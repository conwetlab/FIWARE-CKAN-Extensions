#!/bin/bash

export CKAN_SITE_ID=default
export CKAN_SITE_URL=http://localhost:5000

#
# Email settings
#
export CKAN_SMTP_SERVER=smtp.corporateict.domain:25
export CKAN_SMTP_STARTTLS=True
export CKAN_SMTP_USER=user
export CKAN_SMTP_PASSWORD=pass
export CKAN_SMTP_MAIL_FROM=ckan@localhost

#
# db settings
#
export POSTGRES_PASSWORD=ckan
export DATASTORE_READONLY_PASSWORD=datastore

export CKAN_MAX_UPLOAD_SIZE_MB=20

# Private datasets
export CKAN_PRIVATEDATASETS_SHOW_ACQUIRE_URL_ON_CREATE=true
export CKAN_PRIVATEDATASETS_SHOW_ACQUIRE_URL_ON_EDIT=true

# WireCloud View
export CKAN_WIRECLOUD_VIEW_URL=https://dashboards.example.org

# BAE Publisher
export CKAN_BAEPUBLISHER_STORE_URL=https://market.example.org

# FIWARE Lab
export CKAN.OAUTH2_REGISTER_URL=https://account.lab.fiware.org/users/sign_up
export CKAN.OAUTH2_RESET_URL=https://account.lab.fiware.org/users/password/new
export CKAN.OAUTH2_EDIT_URL=https://account.lab.fiware.org/idm/settings
export CKAN_OAUTH2_AUTHORIZATION_ENDPOINT=https://account.lab.fiware.org/oauth2/authorize
export CKAN_OAUTH2_TOKEN_ENDPOINT=https://account.lab.fiware.org/oauth2/token
export CKAN_OAUTH2_PROFILE_API_URL=https://account.lab.fiware.org/user
export CKAN_OAUTH2_CLIENT_ID=_____client_id________
export CKAN_OAUTH2_CLIENT_SECRET=_______client_secret_________
export CKAN_OAUTH2_SCOPE=all_info
export CKAN_OAUTH2_PROFILE_API_USER_FIELD=id
export CKAN_OAUTH2_PROFILE_API_FULLNAME_FIELD=displayName
export CKAN_OAUTH2_PROFILE_API_MAIL_FIELD=email
export CKAN_OAUTH2_LEGACY_IDM=True
