# FIWARE CKAN Extensions

[![](https://nexus.lab.fiware.org/repository/raw/public/badges/chapters/data-publication.svg)](https://www.fiware.org/developers/catalogue/)
[![License badge](https://img.shields.io/github/license/conwetlab/FIWARE-CKAN-Extensions.svg)](https://opensource.org/licenses/AGPL-3.0)
[![Docker](https://img.shields.io/docker/pulls/fiware/ckan-extended.svg)](https://hub.docker.com/r/fiware/ckan-extended/)
[![](https://img.shields.io/badge/tag-fiware-orange.svg?logo=stackoverflow)](http://stackoverflow.com/questions/tagged/fiware)
[![Support](https://img.shields.io/badge/support-askbot-yellowgreen.svg)](https://ask.fiware.org)
<br>
[![Documentation badge](https://img.shields.io/readthedocs/fiware-ckan-extensions.svg)](https://fiware-ckan-extensions.rtfd.io)
![Status](https://nexus.lab.fiware.org/static/badges/statuses/ckan.svg)

A set of CKAN extensions, developed within FIWARE, which integrates the CKAN
data portal platform with the main FIWARE GEs, enhancing the default CKAN
behaviour with improved access control, publication of right-time context data,
and rich visualization features.

This project is part of [FIWARE](https://www.fiware.org/). For more information
check the FIWARE Catalogue entry for
[Data Publication and Monetization](https://github.com/Fiware/catalogue/tree/master/data-publication).

 | :books: [Documentation](https://fiware-ckan-extensions.rtfd.io/) |  :mortar_board: [Academy](https://fiware-academy.readthedocs.io/en/latest/data-publication/ckan) |  :whale: [Docker Hub](https://hub.docker.com/r/fiware/ckan-extended/) |
|---|---|---|

## Contents

-   [Background](#background)
    -   [Description](#description)
-   [Install](#install)
-   [Usage](#usage)
-   [API](#api)
-   [Advanced Topics](#advanced-topics)
-   [Quality Assurance](#quality-assurance)
-   [License](#license)

## Background

This is the main repository of the FIWARE CKAN extensions. This project is part
of [FIWARE](https://www.fiware.org).

The FIWARE CKAN extensions project is not a single repository, but it is
composed of a set projects, each of them implementing a different CKAN
extension, that together with with [CKAN](https://ckan.org/) made up the
[FIWARE Extended CKAN portal](https://catalogue.fiware.org/enablers/ckan).

In particular, the following extensions have been created:

-   **[OAuth2](https://github.com/conwetlab/ckanext-oauth2)**: This extension
    allows to use an external OAuth2 identity manager (Including but not limited
    to the FIWARE Idm) to authenticate CKAN users, including both, login in the
    web portal and accessing the APIs using OAuth2 access tokens.
-   **[Private Datasets](https://github.com/conwetlab/ckanext-privatedatasets)**:
    This extension extends the default dataset access permissions by including
    an access list where it is possible to specify what users can access to the
    data, even if they are not part of the owner organization
-   **[Right Time Context](https://github.com/conwetlab/ckanext-right_time_context)**:
    This extension enables the publication of right-time queries to the
    [Context Broker](https://catalogue.fiware.org/enablers/publishsubscribe-context-broker-orion-context-broker)
    as dataset resources.
-   **[BAE Publisher](https://github.com/FIWARE-TMForum/ckanext-baepublisher)**:
    This extension integrates CKAN with the FIWARE
    [Business API Ecosystem](https://catalogue.fiware.org/enablers/business-api-ecosystem-biz-ecosystem-ri),
    enabling the automatic creation of products and offerings using the
    information of a private dataset.
-   **[WireCloud View](https://github.com/conwetlab/ckanext-wirecloud_view)**:
    This extension allows the creation of rich visualizations for dataset
    resources by embedding
    [WireCloud](https://catalogue.fiware.org/enablers/application-mashup-wirecloud)
    dashboards as resource views.
-   **[Data Requests](https://github.com/conwetlab/ckanext-datarequests)**: This
    extension enables users to ask for datasets which are not published in the
    portal, so it can include not only data offers but data demands.

### Description

[CKAN](https://ckan.org/) is an open data publication platform, widely extended,
which enable the publication, search, discovery and consumption of open
datasets.

In this context, the FIWARE CKAN extensions enhance the default CKAN features in
order to integrate this tool within the FIWARE ecosystem, supporting the
publication, management and rich visualization of right-time context data, while
improving the access control and enabling data monetization.

## Install

The detailed instructions on how to install the FIWARE CKAN Extensions can be
found at the
[Installation Guide](http://fiware-ckan-extensions.readthedocs.io/en/latest/installation-administration-guide.html).

In general, CKAN extensions can be installed using python, following the next
steps:

-   Download the plugin from the repository and access it:

```console
$ git clone https://github.com/<plugin_repo>
$ cd <plugin_repo>
```

-   Activate CKAN virtual environment

```console
$ . /usr/lib/ckan/default/bin/activate
```

-   Install the extension

```console
$ python setup.py install
```

> **Note**: If you want to install the plugin for development, you can use the
> following command:
>
> ```console
> $ python setup.py develop
> ```

## Usage

The different extensions provide an API that can be used in order to manage its
features programmatically without using the web portal. In particular:

-   Private Datasets:
    -   **acquisitions_list**: Lists all the private datasets a particular user
        has been granted access to
    -   **package_acquired**: Includes a particular user in the list of
        authorized users of a set of datasets
    -   **revoke_access**: Removes a particular user from the list of authorized
        users of a set of datasets
-   Data Requests:
    -   **create_datarequest**: Creates a new data request
    -   **show_datarequest**: Retrieves the information of a data request
    -   **update_datarequest**: Updates a data request
    -   **list_datarequests**: Lists the existing data requests
    -   **delete_datarequest**: Deletes a data request
    -   **close_datarequest**: Closes a data request
    -   **comment_datarequest**: Creates a comment in a data request
    -   **show_datarequest_comment**: Shows the comments of a data request
    -   **list_datarequest_comments**: Lists the comments of a data request
    -   **update_datarequest_comment**: Updates a comment of a data request
    -   **delete_datarequest_comment**: Deletes a comment from a data request
    -   **follow_datarequest**: Starts following a data request
    -   **unfollow_datarequest**: Stops following a data request

## API

For further documentation, you can check the API Reference available at:

-   [Apiary](https://fiwareckanextensions.docs.apiary.io/#)

## Advanced Topics

-   [User & Programmers Guide](doc/user-programmer-guide.rst)
-   [Installation & Administration Guide](doc/installation-administration-guide.rst)

You can also find this documentation on
[ReadTheDocs](http://fiware-ckan-extensions.readthedocs.io/)

## Quality Assurance

This project is part of [FIWARE](https://fiware.org/) and has been rated as
follows:

-   **Version Tested:**
    ![ ](https://img.shields.io/badge/dynamic/json.svg?label=Version&url=https://fiware.github.io/catalogue/json/ckan.json&query=$.version&colorB=blue)
-   **Documentation:**
    ![ ](https://img.shields.io/badge/dynamic/json.svg?label=Completeness&url=https://fiware.github.io/catalogue/json/ckan.json&query=$.docCompleteness&colorB=blue)
    ![ ](https://img.shields.io/badge/dynamic/json.svg?label=Usability&url=https://fiware.github.io/catalogue/json/ckan.json&query=$.docSoundness&colorB=blue)
-   **Responsiveness:**
    ![ ](https://img.shields.io/badge/dynamic/json.svg?label=Time%20to%20Respond&url=https://fiware.github.io/catalogue/json/ckan.json&query=$.timeToCharge&colorB=blue)
    ![ ](https://img.shields.io/badge/dynamic/json.svg?label=Time%20to%20Fix&url=https://fiware.github.io/catalogue/json/ckan.json&query=$.timeToFix&colorB=blue)
-   **FIWARE Testing:**
    ![ ](https://img.shields.io/badge/dynamic/json.svg?label=Tests%20Passed&url=https://fiware.github.io/catalogue/json/ckan.json&query=$.failureRate&colorB=blue)
    ![ ](https://img.shields.io/badge/dynamic/json.svg?label=Scalability&url=https://fiware.github.io/catalogue/json/ckan.json&query=$.scalability&colorB=blue)
    ![ ](https://img.shields.io/badge/dynamic/json.svg?label=Performance&url=https://fiware.github.io/catalogue/json/ckan.json&query=$.performance&colorB=blue)
    ![ ](https://img.shields.io/badge/dynamic/json.svg?label=Stability&url=https://fiware.github.io/catalogue/json/ckan.json&query=$.stability&colorB=blue)

---

## License

Extensions to CKAN is licensed under Affero General Public License (GPL)
version 3.
