# FIWARE CKAN Extensions

[![](https://img.shields.io/badge/FIWARE-Data_Publication-51b6a3.svg?logo=data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABsAAAAVCAYAAAC33pUlAAAABHNCSVQICAgIfAhkiAAAA8NJREFUSEuVlUtIFlEUx+eO+j3Uz8wSLLJ3pBiBUljRu1WLCAKXbXpQEUFERSQF0aKVFAUVrSJalNXGgmphFEhQiZEIPQwKLbEUK7VvZrRvbr8zzjfNl4/swplz7rn/8z/33HtmRhn/MWzbXmloHVeG0a+VSmAXorXS+oehVD9+0zDN9mgk8n0sWtYnHo5tT9daH4BsM+THQC8naK02jCZ83/HlKaVSzBey1sm8BP9nnUpdjOfl/Qyzj5ust6cnO5FItJLoJqB6yJ4QuNcjVOohegpihshS4F6S7DTVVlNtFFxzNBa7kcaEwUGcbVnH8xOJD67WG9n1NILuKtOsQG9FngOc+lciic1iQ8uQGhJ1kVAKKXUs60RoQ5km93IfaREvuoFj7PZsy9rGXE9G/NhBsDOJ63Acp1J82eFU7OIVO1OxWGwpSU5hb0GqfMydMHYSdiMVnncNY5Vy3VbwRUEydvEaRxmAOSSqJMlJISTxS9YWTYLcg3B253xsPkc5lXk3XLlwrPLuDPKDqDIutzYaj3eweMkPeCCahO3+fEIF8SfLtg/5oI3Mh0ylKM4YRBaYzuBgPuRnBYD3mmhA1X5Aka8NKl4nNz7BaKTzSgsLCzWbvyo4eK9r15WwLKRAmmCXXDoA1kaG2F4jWFbgkxUnlcrB/xj5iHxFPiBN4JekY4nZ6ccOiQ87hgwhe+TOdogT1nfpgEDTvYAucIwHxBfNyhpGrR+F8x00WD33VCNTOr/Wd+9C51Ben7S0ZJUq3qZJ2OkZz+cL87ZfWuePlwRcHZjeUMxFwTrJZAJfSvyWZc1VgORTY8rBcubetdiOk+CO+jPOcCRTF+oZ0okUIyuQeSNL/lPrulg8flhmJHmE2gBpE9xrJNkwpN4rQIIyujGoELCQz8ggG38iGzjKkXufJ2Klun1iu65bnJub2yut3xbEK3UvsDEInCmvA6YjMeE1bCn8F9JBe1eAnS2JksmkIlEDfi8R46kkEkMWdqOv+AvS9rcp2bvk8OAESvgox7h4aWNMLd32jSMLvuwDAwORSE7Oe3ZRKrFwvYGrPOBJ2nZ20Op/mqKNzgraOTPt6Bnx5citUINIczX/jUw3xGL2+ia8KAvsvp0ePoL5hXkXO5YvQYSFAiqcJX8E/gyX8QUvv8eh9XUq3h7mE9tLJoNKqnhHXmCO+dtJ4ybSkH1jc9XRaHTMz1tATBe2UEkeAdKu/zWIkUbZxD+veLxEQhhUFmbnvOezsJrk+zmqMo6vIL2OXzPvQ8v7dgtpoQnkF/LP8Ruu9zXdJHg4igAAAABJRU5ErkJgggA=)](https://www.fiware.org/developers/catalogue/)
[![License badge](https://img.shields.io/github/license/conwetlab/FIWARE-CKAN-Extensions.svg)](https://opensource.org/licenses/AGPL-3.0) 
[![Documentation badge](https://img.shields.io/readthedocs/fiware-ckan-extensions.svg)](https://fiware-ckan-extensions.rtfd.io) 
[![Docker](https://img.shields.io/docker/pulls/fiware/ckan-extended.svg)](https://hub.docker.com/r/fiware/ckan-extended/) 
[![](https://img.shields.io/badge/tag-fiware-orange.svg?logo=stackoverflow)](http://stackoverflow.com/questions/tagged/fiware) 
[![Support](https://img.shields.io/badge/support-askbot-yellowgreen.svg)](https://ask.fiware.org)

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

* Private Datasets:
  * **acquisitions_list**: Lists all the private datasets a particular user has been granted access to
  * **package_acquired**: Includes a particular user in the list of authorized users of a set of datasets
  * **revoke_access**: Removes a particular user from the list of authorized users of a set of datasets
* Data Requests:
  * **create_datarequest**: Creates a new data request
  * **show_datarequest**: Retrieves the information of a data request
  * **update_datarequest**: Updates a data request
  * **list_datarequests**: Lists the existing data requests
  * **delete_datarequest**: Deletes a data request
  * **close_datarequest**: Closes a data request
  * **comment_datarequest**: Creates a comment in a data request
  * **show_datarequest_comment**: Shows the comments of a data request
  * **list_datarequest_comments**: Lists the comments of a data request
  * **update_datarequest_comment**: Updates a comment of a data request
  * **delete_datarequest_comment**: Deletes a comment from a data request
  * **follow_datarequest**: Starts following a data request
  * **unfollow_datarequest**: Stops following a data request
 
# API Reference

For further documentation, you can check the API Reference available at:

* [Apiary](https://fiwareckanextensions.docs.apiary.io/#)

# Advanced Topics

* [User & Programmers Guide](doc/user-programmer-guide.rst)
* [Installation & Administration Guide](doc/installation-administration-guide.rst)

You can also find this documentation on [ReadTheDocs](http://fiware-ckan-extensions.readthedocs.io/)