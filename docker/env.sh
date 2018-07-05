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
