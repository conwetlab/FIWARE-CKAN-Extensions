# FIWARE CKAN Extensions

* [Introduction](#introduction)
* [GEi Overall Description](#gei-overall-description)
* [Installation](#installation)
* [API Overview](#api-overview)
* [API Reference](#api-reference)
* [Testing](#testing)
* [Advanced Topics](#advanced-topics)

# Introduction

This is the main repository of the FIWARE CKAN extensions. This project is part of [FIWARE](https://www.fiware.org).

The FIWARE CKAN extensions project is not a single repository, but it is composed of
a set projects, each of them implementing a different CKAN extension, that together with
with [CKAN](https://ckan.org/) made up the FIWARE Extended CKAN portal.

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

# Installation

# API Overview

# API Reference

# Testing

# Advanced Topics