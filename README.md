# FIWARE CKAN Extensions

* [Introduction](#introduction)
* [GEi Overall Description](#gei-overall-description)
* [Installation](#installation)
* [API Overview](#api-overview)
* [API Reference](#api-reference)
* [Advanced Topics](#advanced-topics)

# Introduction

This is the main repository of the FIWARE CKAN extensions. This project is part of [FIWARE](https://www.fiware.org).

The FIWARE CKAN extensions project is not a single repository, but it is composed of
a set projects, each of them implementing a different CKAN extension, that together with
with [CKAN](https://ckan.org/) made up the [FIWARE Extended CKAN portal](https://catalogue.fiware.org/enablers/ckan).

In particular, the following extensions have been created:

* **[OAuth2](https://github.com/conwetlab/ckanext-oauth2)**: This extension allows to use an external OAuth2
identity manager (Including but not limited to the FIWARE Idm) to authenticate CKAN users, including both,
login in the web portal and accessing the APIs using OAuth2 access tokens.
* **[Private Datasets](https://github.com/conwetlab/ckanext-privatedatasets)**: This extension extends the default
dataset access permissions by including an access list where it is possible to specify what users can access to the
data, even if they are not part of the owner organization
* **[NGSI View](https://github.com/conwetlab/ckanext-ngsiview)**: This extension enables the publication
of right-time queries to the [Context Broker](https://catalogue.fiware.org/enablers/publishsubscribe-context-broker-orion-context-broker) as dataset resources.
* **[BAE Publisher](https://github.com/FIWARE-TMForum/ckanext-baepublisher)**: This extension integrates CKAN
with the FIWARE [Business API Ecosystem](https://catalogue.fiware.org/enablers/business-api-ecosystem-biz-ecosystem-ri), enabling
the automatic creation of products and offerings using the information of a private dataset.
* **[WireCloud View](https://github.com/conwetlab/ckanext-wirecloud_view)**: This extension allows the creation
of rich visualizations for dataset resources by embedding [WireCloud](https://catalogue.fiware.org/enablers/application-mashup-wirecloud) dashboards
as resource views.
* **[Data Requests](https://github.com/conwetlab/ckanext-datarequests)**: This extension enables users
to ask for datasets which are not published in the portal, so it can include not only data offers but
data demands.


# GEi Overall Description


[CKAN](https://ckan.org/) is an open data publication platform, widely extended, which enable
the publication, search, discovery and consumption of open datasets.

In this context, the FIWARE CKAN extensions enhance the default CKAN features in order to
integrate this tool within the FIWARE ecosystem, supporting the publication, management and
rich visualization of right-time context data, while improving the access control and 
enabling data monetization. 


# Installation

The detailed instructions on how to install the FIWARE CKAN Extensions can be found at the [Installation Guide](http://fiware-ckan-extensions.readthedocs.io/en/latest/installation-administration-guide.html).

In general, CKAN extensions can be installed using python, following the next steps:

* Download the plugin from the repository and access it:

```
$ git clone https://github.com/<plugin_repo>
$ cd <plugin_repo>
```

* Activate CKAN virtual environment

```
$ . /usr/lib/ckan/default/bin/activate
```

* Install the extension

```
$ python setup.py install
```

> **Note**: If you want to install the plugin for development, you can use the following command:
> ```
> $ python setup.py develop
> ```

# API Overview

The different extensions provide an API that can be used in order to manage its features
programmatically without using the web portal. In particular:

* OAuth2:
* Private Datasets:
* NGSI View:
* BAE Publisher:
* WireCloud view:
* Data Requests:

# API Reference

For further documentation, you can check the API Reference available at:

* [Apiary](https://fiwareckanextensions.docs.apiary.io/#)

# Advanced Topics

* [User & Programmers Guide](doc/user-programmer-guide.rst)
* [Installation & Administration Guide](doc/installation-administration-guide.rst)

You can also find this documentation on [ReadTheDocs](http://fiware-ckan-extensions.readthedocs.io/)