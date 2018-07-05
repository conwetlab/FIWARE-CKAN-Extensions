#!/bin/sh
set -e

# URL for the primary database, in the format expected by sqlalchemy (required
# unless linked to a container called 'db')
: ${CKAN_SQLALCHEMY_URL:=}
# URL for solr (required unless linked to a container called 'solr')
: ${CKAN_SOLR_URL:=}
# URL for redis (required unless linked to a container called 'redis')
: ${CKAN_REDIS_URL:=}
# URL for datapusher (required unless linked to a container called 'datapusher')
: ${CKAN_DATAPUSHER_URL:=}

CKAN_CONFIG=/etc/ckan/default
CONFIG="${CKAN_CONFIG}/production.ini"

abort () {
    echo "$@" >&2
    exit 1
}

set_environment () {
    # Basic CKAN settings
    export CKAN_SITE_ID=${CKAN_SITE_ID}
    export CKAN_SITE_URL=${CKAN_SITE_URL}
    export CKAN_SQLALCHEMY_URL=${CKAN_SQLALCHEMY_URL}
    export CKAN_SOLR_URL=${CKAN_SOLR_URL}
    export CKAN_REDIS_URL=${CKAN_REDIS_URL}
    export CKAN_STORAGE_PATH=/var/lib/ckan
    export CKAN_DATAPUSHER_URL=${CKAN_DATAPUSHER_URL}
    export CKAN_DATASTORE_WRITE_URL=${CKAN_DATASTORE_WRITE_URL}
    export CKAN_DATASTORE_READ_URL=${CKAN_DATASTORE_READ_URL}
    export CKAN_SMTP_SERVER=${CKAN_SMTP_SERVER}
    export CKAN_SMTP_STARTTLS=${CKAN_SMTP_STARTTLS}
    export CKAN_SMTP_USER=${CKAN_SMTP_USER}
    export CKAN_SMTP_PASSWORD=${CKAN_SMTP_PASSWORD}
    export CKAN_SMTP_MAIL_FROM=${CKAN_SMTP_MAIL_FROM}
    export CKAN_MAX_UPLOAD_SIZE_MB=${CKAN_MAX_UPLOAD_SIZE_MB}

    # OAuth2 settings
    export CKAN_OAUTH2_LOGOUT_URL=${CKAN_OAUTH2_LOGOUT_URL}
    export CKAN_OAUTH2_REGISTER_URL=${CKAN_OAUTH2_REGISTER_URL}
    export CKAN_OAUTH2_RESET_URL=${CKAN_OAUTH2_RESET_URL}
    export CKAN_OAUTH2_EDIT_URL=${CKAN_OAUTH2_EDIT_URL}
    export CKAN_OAUTH2_AUTHORIZATION_ENDPOINT=${CKAN_OAUTH2_AUTHORIZATION_ENDPOINT}
    export CKAN_OAUTH2_TOKEN_ENDPOINT=${CKAN_OAUTH2_TOKEN_ENDPOINT}
    export CKAN_OAUTH2_PROFILE_API_URL=${CKAN_OAUTH2_PROFILE_API_URL}
    export CKAN_OAUTH2_CLIENT_ID=${CKAN_OAUTH2_CLIENT_ID}
    export CKAN_OAUTH2_CLIENT_SECRET=${CKAN_OAUTH2_CLIENT_SECRET}
    export CKAN_OAUTH2_SCOPE=${CKAN_OAUTH2_SCOPE}
    export CKAN_OAUTH2_REMEMBERER_NAME=${CKAN_OAUTH2_REMEMBERER_NAME}
    export CKAN_OAUTH2_PROFILE_API_USER_FIELD=${CKAN_OAUTH2_PROFILE_API_USER_FIELD}
    export CKAN_OAUTH2_PROFILE_API_FULLNAME_FIELD=${CKAN_OAUTH2_PROFILE_API_FULLNAME_FIELD}
    export CKAN_OAUTH2_PROFILE_API_MAIL_FIELD=${CKAN_OAUTH2_PROFILE_API_MAIL_FIELD}
    export CKAN_OAUTH2_AUTHORIZATION_HEADER=${CKAN_OAUTH2_AUTHORIZATION_HEADER}
}

write_config () {
    ckan-paster make-config --no-interactive ckan "${CONFIG}"
    sed -ri "s/^(ckan.plugins = .+)/\1 oauth2/" /etc/ckan/default/production.ini
}

# If we don't already have a config file, bootstrap
if [ ! -e "${CONFIG}" ]; then
    write_config
fi

# Get or create CKAN_SQLALCHEMY_URL
if [ -z "${CKAN_SQLALCHEMY_URL}" ]; then
    abort "ERROR: no CKAN_SQLALCHEMY_URL specified in docker-compose.yml"
fi

if [ -z "${CKAN_SOLR_URL}" ]; then
    abort "ERROR: no CKAN_SOLR_URL specified in docker-compose.yml"
fi

if [ -z "${CKAN_REDIS_URL}" ]; then
    abort "ERROR: no CKAN_REDIS_URL specified in docker-compose.yml"
fi

if [ -z "${CKAN_DATAPUSHER_URL}" ]; then
    abort "ERROR: no CKAN_DATAPUSHER_URL specified in docker-compose.yml"
fi

set_environment
. /usr/lib/ckan/default/bin/activate
ckan-paster --plugin=ckan db init -c "${CKAN_CONFIG}/production.ini"

/usr/sbin/apache2ctl graceful-stop
rm -f /var/run/apache2/apache2.pid
exec /usr/sbin/apache2ctl -D FOREGROUND
