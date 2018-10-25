=====================================
Installation and Administration Guide
=====================================

------------
Introduction
------------

This installation and administration guide covers the FIWARE CKAN extensions for the FIWARE release 7. For details on
the installation of CKAN itself please refer to the `CKAN Installation Guide <http://docs.ckan.org/en/latest/maintaining/installing/index.html>`__

Any feedback on this document is highly welcomed, including bugs, typos or things you think should be included but aren't.
Please send them to the "Contact Person" email that appears in the `Catalogue page for this GEi`_. Or create an issue at `GitHub Issues`_

.. _Catalogue page for this GEi: https://catalogue.fiware.org/enablers/ckan
.. _GitHub Issues: https://github.com/conwetlab/FIWARE-CKAN-Extensions/issues/new

The current version of the software has been tested in CKAN versions 2.7, and 2.8

------
OAuth2
------

This guide covers the installation of the OAuth2 CKAN extension v0.6.1, compatible with the software provided
as part of the FIWARE release 7.

Installation
++++++++++++

To install the extension in CKAN, it is required to activate the CKAN virtual environment as follows: ::

    $ . /usr/lib/ckan/default/bin/activate

.. note::
   The previous command is supposing that your CKAN virtualenv is in /usr/lib/ckan/default

The OAuth2 extension is available in pip and can be installed as follows: ::

    $ pip install ckanext-oauth2==0.6.1

If you want to install the extension for development, you can download it with the following commands: ::

    $ git clone https://github.com/conwetlab/ckanext-oauth2
    $ cd ckanext-oauth2
    $ git checkout v0.6.1

Once the extension has been downloaded and the virtualenv has been activated, the extension can be installed with the
following command: ::

    $ python setup.py develop

Configuration
+++++++++++++

To activate the OAuth2 extension in CKAN, it is required to include it in the *ckan.plugins* setting of the *.ini* file
(generally */etc/ckan/default/production.ini*). ::

    ckan.plugins = oauth2 <other-plugins>

Additionally, this extension requires a set of settings to be provided in the *.ini* file in order to configure its
behaviour and the integration with the selected IdM. In particular: ::

    ## OAuth2 configuration
    ckan.oauth2.logout_url = /user/logged_out
    ckan.oauth2.register_url = https://YOUR_OAUTH_SERVICE/users/sign_up
    ckan.oauth2.reset_url = https://YOUR_OAUTH_SERVICE/users/password/new
    ckan.oauth2.edit_url = https://YOUR_OAUTH_SERVICE/settings
    ckan.oauth2.authorization_endpoint = https://YOUR_OAUTH_SERVICE/oauth2/authorize
    ckan.oauth2.token_endpoint = https://YOUR_OAUTH_SERVICE/oauth2/token
    ckan.oauth2.profile_api_url = https://YOUR_OAUTH_SERVICE/user
    ckan.oauth2.client_id = CLIENT_ID
    ckan.oauth2.client_secret = CLIENT_SECRET
    ckan.oauth2.scope = all_info
    ckan.oauth2.rememberer_name = auth_tkt
    ckan.oauth2.profile_api_user_field = id
    ckan.oauth2.profile_api_fullname_field = displayName
    ckan.oauth2.profile_api_mail_field = email
    ckan.oauth2.authorization_header = Bearer

With the following meaning:

* **logout_url**: URL used in CKAN for logging out the user
* **register_url**: URL in the selected IDM for registering users
* **reset_url**: URL in the selected IDM for resetting user password
* **edit_url**: URL in the selected IDM for updating user info
* **authorization_endpoint**: URL in the selected IDM for retrieving authorization code in the OAuth2 process.
* **token_endpoint**: URL in the selected IDM for retrieving the access token in the OAuth2 process
* **profile_api_url**: URL in the selected IDM for retrieving user info
* **client_id**: Client ID given by the IDM to the CKAN instance
* **client_secret**: Client Secret given by the selected IDM for the CKAN instance
* **profile_api_user_field**: Name of the field which contains the user id within the user info object as provided by the IDM
* **profile_api_fullname_field**: Name of the field which contains the user display name within the user info object as provided by the IDM
* **profile_api_mail_field**: Name of the field which contains the user email within the user info object as provided by the IDM
* **authorization_header**: Header that will be used for accessing CKAN APIs using an access token for authentication

It is important to note that this extension has been designed by default to be used in a CKAN deployed in HTTPS, so trying
to use it in an unsecured CKAN instance will result in an error. To use this extension in a not secured instance it is
required to set the *OAUTHLIB_INSECURE_TRANSPORT* environment variable to true: ::

    $ export OAUTHLIB_INSECURE_TRANSPORT=True

Or if CKAN is deployed in Apache, modifying */etc/apache2/envvars*

Finally, the callback URL that must be used in the IDM for registering CKAN is: ::

    https://YOUR_CKAN_INSTANCE/oauth2/callback

----------------
Private Datasets
----------------

This guide covers the installation of the Private Datasets CKAN extension v0.4, compatible with the software provided
as part of the FIWARE release 7.

Installation
++++++++++++

To install the extension in CKAN, it is required to activate the CKAN virtual environment as follows: ::

    $ . /usr/lib/ckan/default/bin/activate

.. note::
   The previous command is supposing that your CKAN virtualenv is in /usr/lib/ckan/default

The Private Datasets extension is available in pip and can be installed with the following command: ::

    $ pip install ckanext-privatedatasets==0.4

If you want to install the extension for development, you can download it with the following commands: ::

    $ git clone https://github.com/conwetlab/ckanext-privatedatasets
    $ cd ckanext-privatedatasets
    $ git checkout v0.4

Once the extension has been downloaded and the virtualenv has been activated, the extension can be installed with the
following command: ::


    $ python setup.py develop


Configuration
+++++++++++++

To activate the Private Datasets extension it is required to include *privatedatasets* in the *ckan.plugins* setting of
your *.ini* file: ::

    ckan.plugins = privatedatasets <other-plugins>

In addition, some settings can be configured in order to customize the extension behaviour. In particular: ::

    ckan.privatedatasets.parser = ckanext.privatedatasets.parsers.fiware:FiWareNotificationParser
    ckan.privatedatasets.show_acquire_url_on_create = True
    ckan.privatedatasets.show_acquire_url_on_edit = True

With the following meaning:

* **parser**: Class used to parse user access grants and revokes to datasets.
* **show_acquire_url_on_create**: Whether to show the acquire URL (URL where access grants can be obtained) on dataset creation form
* **show_acquire_url_on_edit**: Whether to show the acquire URL on dataset update form

------------------
Right Time Context
------------------

This guide covers the installation of the Right Time Context CKAN extension v0.9, compatible with the software provided
as part of the FIWARE release 7.

Installation
++++++++++++

To install the extension in CKAN, it is required to activate the CKAN virtual environment as follows: ::

    $ . /usr/lib/ckan/default/bin/activate

.. note::
   The previous command is supposing that your CKAN virtualenv is in /usr/lib/ckan/default

The Right Time Context extension is available in pip and can be installed with the following command: ::

    $ pip install ckanext-right_time_context==0.9

If you want to install the extension for development, you can download it with the following commands: ::

    $ git clone https://github.com/conwetlab/ckanext-right_time_context
    $ cd ckanext-right_time_context
    $ git checkout v0.9

Once the extension has been downloaded and the virtualenv has been activated, the plugin can be installed with the
following command: ::

    $ python setup.py develop


Configuration
+++++++++++++

To activate the Right Time Context extension it is required to include *right_time_context* in the *ckan.plugins* and *ckan.views.default_views* settings of
your *.ini* file: ::

    ckan.plugins = right_time_context <other-plugins>

    ckan.views.default_views = right_time_context <other-views>

-------------
BAE Publisher
-------------

This guide covers the installation of the BAE Publisher CKAN extension v0.5, compatible with the software provided
as part of the FIWARE release 7.

Requirements
++++++++++++

* Business API Ecosystem v5.4.0 or higher
* OAuth2 CKAN extension installed
* Private Datasets extension installed

Installation
++++++++++++

To install the extension in CKAN, it is required to activate the CKAN virtual environment as follows: ::

    $ . /usr/lib/ckan/default/bin/activate

.. note::
   The previous command is supposing that your CKAN virtualenv is in /usr/lib/ckan/default

The BAE Publisher extension is available in pip and can be installed with the following command: ::

    $ pip install ckanext-baepublisher==0.5

If you want to install the extension for development, you can download it with the following commands: ::

    $ git clone https://github.com/FIWARE-TMForum/ckanext-baepublisher
    $ cd ckanext-baepublisher
    $ git checkout v0.5

Once the extension has been downloaded and the virtualenv has been activated, the extension can be installed with the
following command: ::

    $ python setup.py develop


Configuration
+++++++++++++

To activate the BAE publisher extension it is required to include *baepublisher* in the *ckan.plugins* setting of your *.ini*
file. In addition, it is necessary to configure the URL of the BAE instance to be used with *ckan.storepublisher.store_url*: ::

    ckan.plugins = baepublisher <other-plugins>

    ckan.baepublisher.store_url = https://YOUR_BAE_INSTANCE/

--------------
WireCloud View
--------------

This guide covers the installation of the WireCloud View CKAN extension v1.1.0, compatible with the software provided
as part of the FIWARE release 7.

Requirements
++++++++++++

* WireCloud v1.0 or higher
* OAuth2 CKAN extension installed

Installation
++++++++++++

To install the extension in CKAN, it is required to activate the CKAN virtual environment as follows: ::

    $ . /usr/lib/ckan/default/bin/activate

.. note::
   The previous command is supposing that your CKAN virtualenv is in /usr/lib/ckan/default

The WireCloud View  extension is available in pip and can be installed with the following command: ::

    $ pip install ckanext-wirecloud_view==1.1.0

If you want to install the extension for development, you can download it with the following commands: ::

    $ git clone https://github.com/conwetlab/ckanext-wirecloud_view
    $ cd ckanext-wirecloud_view
    $ git checkout 1.1.0

Once the extension has been downloaded and the virtualenv has been activated, the extension can be installed with the
following command: ::

    $ python setup.py develop


Configuration
+++++++++++++

To activate the WireCloud View extension it is required to include *wirecloud_view* in the *ckan.plugins* setting of your *.ini*: ::

    ckan.plugins = wirecloud_view <other-plugins>


In addition, it is necessary to configure some settings related with the WireCloud instance used. In particular: ::

    ckan.wirecloud_view.url = https://YOUR_WIRECLOUD_INSTANCE
    ckan.wirecloud_view.editor_dashboard = wirecloud/ckan-editor

With the following meaning:

* **url**: URL of the WireCloud server
* **editor_dashboard**: Dashboard in the WireCloud instance used as wizard for basic dashboard creation

-------------
Data Requests
-------------

This guide covers the installation of the Data Requests CKAN extension v1.1.0, compatible with the software provided
as part of the FIWARE release 7.

Installation
++++++++++++

To install the extension in CKAN, it is required to activate the CKAN virtual environment as follows: ::

    $ . /usr/lib/ckan/default/bin/activate

.. note::
   The previous command is supposing that your CKAN virtualenv is in /usr/lib/ckan/default

The Data Requests extension is available in pip and can be installed with the following command: ::

    $ pip install ckanext-datarequests==1.1.0

If you want to install the extension for development, you can download it with the following commands: ::

    $ git clone https://github.com/conwetlab/ckanext-datarequests
    $ cd ckanext-datarequests
    $ git checkout v1.1.0

Once the extension has been downloaded and the virtualenv has been activated, the extension can be installed with the
following command: ::

    $ python setup.py develop


Configuration
+++++++++++++

To activate the Data Requests extension it is required to include *datarequests* in the *ckan.plugins* setting of your *.ini*: ::

    ckan.plugins = datarequests <other-plugins>

Additionally, it is possible to customize the behaviour of the extension by including some settings. In particular: ::

    ckan.datarequests.comments = true
    ckan.datarequests.show_datarequests_badge = true

With the following meaning:

* **comments**: Whether the comments system is enabled or not
* **show_datarequests_badge**: Whether to show the number of data requests in a badge in the menu
