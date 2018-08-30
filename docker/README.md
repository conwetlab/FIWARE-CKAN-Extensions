# Supported tags and respective `Dockerfile` links

- [`2.8`, `latest`](https://github.com/conwetlab/FIWARE-CKAN-Extensions/blob/master/docker/Dockerfile)
- [`2.7`](https://github.com/conwetlab/FIWARE-CKAN-Extensions/blob/master/docker/Dockerfile-2.7)


## What is FIWARE's Extended CKAN?

CKAN is an open data publication platform, widely extended, which enable the publication, search, discovery and consumption of open datasets.

In this context, the FIWARE CKAN extensions enhance the default CKAN features in order to integrate this tool within the FIWARE ecosystem, supporting the publication, management and rich visualization of right-time context data, while improving the access control and enabling data monetization.

The FIWARE's Extended CKAN is just a version of CKAN with the FIWARE CKAN extensions installed.


## Example docker compose

```
version: '3.4'

services:

    ckan:
        restart: always
        image: fiware/ckan-extended
        ports:
            - 5000:5000
        depends_on:
            - ckan_postgres
            - ckan_solr
            - ckan_redis
        volumes:
            - ./ckan-data:/opt/ckan
        environment:
            # Basic Configuration parameters
            # Defaults work with linked containers, change to use own Postgres, SolR, Redis or Datapusher
            - CKAN_SQLALCHEMY_URL=postgresql://ckan:${POSTGRES_PASSWORD}@ckan_postgres/ckan
            - CKAN_DATASTORE_WRITE_URL=postgresql://ckan:${POSTGRES_PASSWORD}@ckan_postgres/datastore
            - CKAN_DATASTORE_READ_URL=postgresql://datastore_ro:${DATASTORE_READONLY_PASSWORD}@ckan_postgres/datastore
            - CKAN_SOLR_URL=http://ckan_solr:8983/solr/ckan
            - CKAN_REDIS_URL=redis://ckan_redis:6379/1
            - CKAN_DATAPUSHER_URL=http://datapusher:8800
            - CKAN_SITE_URL=${CKAN_SITE_URL}
            - CKAN_MAX_UPLOAD_SIZE_MB=${CKAN_MAX_UPLOAD_SIZE_MB}
            - CKAN_VERIFY_REQUESTS=True


            #
            # OAuth2 (uncomment the following environment variables for
            # enabling this extension)
            #
            # See https://github.com/conwetlab/ckanext-oauth2/wiki/Activating-and-Installing
            #

            #- CKAN_OAUTH2_REGISTER_URL=${CKAN_OAUTH2_REGIISTER_URL}
            #- CKAN_OAUTH2_RESET_URL=${CKAN_OAUTH2_RESET_URL}
            #- CKAN_OAUTH2_EDIT_URL=${CKAN_OAUTH2_EDIT_URL}
            #- CKAN_OAUTH2_AUTHORIZATION_ENDPOINT=${CKAN_OAUTH2_AUTHORIZATION_ENDPOINT}
            #- CKAN_OAUTH2_TOKEN_ENDPOINT=${CKAN_OAUTH2_TOKEN_ENDPOINT}
            #- CKAN_OAUTH2_PROFILE_API_URL=${CKAN_OAUTH2_PROFILE_API_URL}
            #- CKAN_OAUTH2_CLIENT_ID=${CKAN_OAUTH2_CLIENT_ID}
            #- CKAN_OAUTH2_CLIENT_SECRET=${CKAN_OAUTH2_CLIENT_SECRET}
            #- CKAN_OAUTH2_SCOPE=${CKAN_OAUTH2_SCOPE}
            #- CKAN_OAUTH2_REMEMBERER_NAME=${CKAN_OAUTH2_REMEMBERER_NAME}
            #- CKAN_OAUTH2_PROFILE_API_USER_FIELD=${CKAN_OAUTH2_PROFILE_API_USER_FIELD}
            #- CKAN_OAUTH2_PROFILE_API_FULLNAME_FIELD=${CKAN_OAUTH2_PROFILE_API_FULLNAME_FIELD}
            #- CKAN_OAUTH2_PROFILE_API_MAIL_FIELD=${CKAN_OAUTH2_PROFILE_API_MAIL_FIELD}
            #- CKAN_OAUTH2_AUTHORIZATION_HEADER=${CKAN_OAUTH2_AUTHORIZATION_HEADER}
            #- CKAN_OAUTH2_LEGACY_IDM=${CKAN_OAUTH2_LEGACY_IDM}
            ## DON'T USE THIS SETTING ON PRODUCTION!
            #- OAUTHLIB_INSECURE_TRANSPORT=True


            #
            # Private datasets (uncomment the following environment variables
            # for enabling this extension)
            #
            #- CKAN_PRIVATEDATASETS_ENABLED=True
            #- CKAN_PRIVATEDATASETS_SHOW_ACQUIRE_URL_ON_CREATE=${CKAN_PRIVATEDATASETS_SHOW_ACQUIRE_URL_ON_CREATE}
            #- CKAN_PRIVATEDATASETS_SHOW_ACQUIRE_URL_ON_EDIT=${CKAN_PRIVATEDATASETS_SHOW_ACQUIRE_URL_ON_EDIT}
            #- CKAN_PRIVATEDATASETS_PARSER=${CKAN_PRIVATEDATASETS_PARSER}


            #
            # Right time context (it is recommended to enable oauth2 extension)
            #
            #- CKAN_RIGHT_TIME_CONTEXT_ENABLED=True
            #- CKAN_RIGHT_TIME_CONTEXT_VERIFY_REQUESTS=True


            #
            # WireCloud view (uncomment the following environment variables for
            # enabling this extension, requires the oauth2 extension)
            #
            # See https://github.com/conwetlab/ckanext-wirecloud_view
            #

            #- CKAN_WIRECLOUD_VIEW_URL=${CKAN_WIRECLOUD_VIEW_URL}
            #- CKAN_WIRECLOUD_VIEW_EDITOR_DASHBOARD=${CKAN_WIRECLOUD_VIEW_EDITOR_DASHBOARD}


            #
            # BAE publisher (uncomment the following environment variables for
            # enabling this extension, requires the oauth2 and privatedatasets extensions)
            #
            # See https://github.com/FIWARE-TMForum/ckanext-baepublisher/
            #

            #- CKAN_BAEPUBLISHER_STORE_URL=${CKAN_BAEPUBLISHER_STORE_URL}

    ckan_datapusher:
        restart: always
        image: clementmouchet/datapusher

    ckan_solr:
        restart: always
        image: ckan/solr
        volumes:
            - ./solr-data/:/opt/solr/server/solr/ckan/data

    ckan_postgres:
        restart: always
        image: ckan/postgresql
        environment:
            - DS_RO_PASS=${DATASTORE_READONLY_PASSWORD}
            - POSTGRES_PASSWORD=${POSTGRES_PASSWORD}
        volumes:
            - ./postgres-data:/var/lib/postgresql/data

    ckan_redis:
        restart: always
        image: redis:latest
```

> Take into account that before using this docker-compose file, you should
> perform some steps. Take a look into the links provided for each of the
> extensions.

> On the other hand, this docker-compose file uses a `${VARIABLE}` syntax as
> the placeholders where you have to provide the configuration values. You can
> replace the placeholder with the proper value or provide them by using
> environment variables (e.g. by using an [.env file](https://github.com/conwetlab/FIWARE-CKAN-Extensions/blob/master/docker/.env)).


## License

CKAN is copyright (c) 2006-2018 Open Knowledge International and contributors.

It is open and licensed under the GNU Affero General Public License (AGPL) v3.0 whose full text may be found at:

http://www.fsf.org/licensing/licenses/agpl-3.0.html

The FIWARE Extensions are copyright (c) 2014-2018 CoNWeT Lab., Universidad Politécnica de Madrid, Future Internet Consulting and Development Solutions S.L. and contributors.

They are also open and licensed under the GNU Affero General Public License (AGPL) v3.0.

## User Feedback

### Documentation

This document should provide everything you need to deploy a CKAN instance using docker and with all the FIWARE Extensions installed. Anyway, you can find the User & Programmer's Manual and the Administration Guides on [Read the Docs](https://fiware-ckan-extensions.readthedocs.io/en/stable/).

### Issues

If you have any problems with or questions about this image, please contact us through a [GitHub issue](https://github.com/conwetlab/FIWARE-CKAN-Extensions/issues).

You can also reach many of the official image maintainers via the `fiware` and `ckan` tags on [StackOverflow](https://stackoverflow.com/questions/tagged/fiware+ckan).

### Contributing

You are invited to contribute new features, fixes, or updates, large or small; we are always thrilled to receive pull requests, and do our best to process them as fast as we can.

Before you start to code, we recommend discussing your plans through a [GitHub issue](https://github.com/conwetlab/FIWARE-CKAN-Extensions/issues), especially for more ambitious contributions. This gives other contributors a chance to point you in the right direction, give you feedback on your design, and help you find out if someone else is working on the same thing.

