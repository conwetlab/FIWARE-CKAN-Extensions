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

write_config () {
    ckan-paster make-config --no-interactive ckan "${CONFIG}"
    sed -ri "s/^(ckan.plugins = .+)/\1 oauth2 privatedatasets resource_proxy right_time_context/" /etc/ckan/default/production.ini
    sed -ri "s/^(ckan.views.default_views = .+)/\1 ngsi_view/" /etc/ckan/default/production.ini
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

. /usr/lib/ckan/default/bin/activate
ckan-paster --plugin=ckan db init -c "${CKAN_CONFIG}/production.ini"

/usr/sbin/apache2ctl graceful-stop
rm -f /var/run/apache2/apache2.pid
exec /usr/sbin/apache2ctl -D FOREGROUND
