========
Overview
========

This project is part of `FIWARE <https://www.fiware.org>`__

`CKAN <https://ckan.org/>`__ is an open data publication platform, widely extended, which enable
the publication, search, discovery and consumption of open datasets.

In this context, the FIWARE CKAN extensions enhance the default CKAN features in order to
integrate this tool within the FIWARE ecosystem, supporting the publication, management and
rich visualization of right-time context data, while improving the access control and
enabling data monetization.

In particular, the following extensions have been created:

* `OAuth2 <https://github.com/conwetlab/ckanext-oauth2>`__: This extension allows to use an external OAuth2 identity manager (Including but not limited to the FIWARE Idm) to authenticate CKAN users, including both, login in the web portal and accessing the APIs using OAuth2 access tokens.
* `Private Datasets <https://github.com/conwetlab/ckanext-privatedatasets>`__: This extension extends the default dataset access permissions by including an access list where it is possible to specify what users can access to the data, even if they are not part of the owner organization
* `NGSI View <https://github.com/conwetlab/ckanext-ngsiview>`__: This extension enables the publication of right-time queries to the `Context Broker <https://catalogue.fiware.org/enablers/publishsubscribe-context-broker-orion-context-broker>`__ as dataset resources.
* `BAE Publisher <https://github.com/FIWARE-TMForum/ckanext-baepublisher>`__: This extension integrates CKAN with the FIWARE `Business API Ecosystem <https://catalogue.fiware.org/enablers/business-api-ecosystem-biz-ecosystem-ri>`__, enabling the automatic creation of products and offerings using the information of a private dataset.
* `WireCloud View <https://github.com/conwetlab/ckanext-wirecloud_view>`__: This extension allows the creation of rich visualizations for dataset resources by embedding `WireCloud <https://catalogue.fiware.org/enablers/application-mashup-wirecloud>`__ dashboards as resource views.
* `Data Requests <https://github.com/conwetlab/ckanext-datarequests>`__: This extension enables users to ask for datasets which are not published in the portal, so it can include not only data offers but data demands.

The current documentation includes several guides for the usage, installation and administration of the
different FIWARE CKAN extensions, for documentation of CKAN itself please refer to the `CKAN documentation <http://docs.ckan.org/>`__.

Index
=====

:doc:`installation-administration-guide`
  The guide for maintainers that explains how to install the different extensions.

:doc:`user-programmer-guide`
  The guide for users and programmers that explains how to use the different extensions.

.. _documentation:

.. toctree::
    :maxdepth: 2
    :caption: Documentation

    installation-administration-guide
    user-programmer-guide
