========
Overview
========

.. figure:: https://img.shields.io/badge/FIWARE-Data_Publication-51b6a3.svg?logo=data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABsAAAAVCAYAAAC33pUlAAAABHNCSVQICAgIfAhkiAAAA8NJREFUSEuVlUtIFlEUx+eO+j3Uz8wSLLJ3pBiBUljRu1WLCAKXbXpQEUFERSQF0aKVFAUVrSJalNXGgmphFEhQiZEIPQwKLbEUK7VvZrRvbr8zzjfNl4/swplz7rn/8z/33HtmRhn/MWzbXmloHVeG0a+VSmAXorXS+oehVD9+0zDN9mgk8n0sWtYnHo5tT9daH4BsM+THQC8naK02jCZ83/HlKaVSzBey1sm8BP9nnUpdjOfl/Qyzj5ust6cnO5FItJLoJqB6yJ4QuNcjVOohegpihshS4F6S7DTVVlNtFFxzNBa7kcaEwUGcbVnH8xOJD67WG9n1NILuKtOsQG9FngOc+lciic1iQ8uQGhJ1kVAKKXUs60RoQ5km93IfaREvuoFj7PZsy9rGXE9G/NhBsDOJ63Acp1J82eFU7OIVO1OxWGwpSU5hb0GqfMydMHYSdiMVnncNY5Vy3VbwRUEydvEaRxmAOSSqJMlJISTxS9YWTYLcg3B253xsPkc5lXk3XLlwrPLuDPKDqDIutzYaj3eweMkPeCCahO3+fEIF8SfLtg/5oI3Mh0ylKM4YRBaYzuBgPuRnBYD3mmhA1X5Aka8NKl4nNz7BaKTzSgsLCzWbvyo4eK9r15WwLKRAmmCXXDoA1kaG2F4jWFbgkxUnlcrB/xj5iHxFPiBN4JekY4nZ6ccOiQ87hgwhe+TOdogT1nfpgEDTvYAucIwHxBfNyhpGrR+F8x00WD33VCNTOr/Wd+9C51Ben7S0ZJUq3qZJ2OkZz+cL87ZfWuePlwRcHZjeUMxFwTrJZAJfSvyWZc1VgORTY8rBcubetdiOk+CO+jPOcCRTF+oZ0okUIyuQeSNL/lPrulg8flhmJHmE2gBpE9xrJNkwpN4rQIIyujGoELCQz8ggG38iGzjKkXufJ2Klun1iu65bnJub2yut3xbEK3UvsDEInCmvA6YjMeE1bCn8F9JBe1eAnS2JksmkIlEDfi8R46kkEkMWdqOv+AvS9rcp2bvk8OAESvgox7h4aWNMLd32jSMLvuwDAwORSE7Oe3ZRKrFwvYGrPOBJ2nZ20Op/mqKNzgraOTPt6Bnx5citUINIczX/jUw3xGL2+ia8KAvsvp0ePoL5hXkXO5YvQYSFAiqcJX8E/gyX8QUvv8eh9XUq3h7mE9tLJoNKqnhHXmCO+dtJ4ybSkH1jc9XRaHTMz1tATBe2UEkeAdKu/zWIkUbZxD+veLxEQhhUFmbnvOezsJrk+zmqMo6vIL2OXzPvQ8v7dgtpoQnkF/LP8Ruu9zXdJHg4igAAAABJRU5ErkJgggA=
  :target: https://www.fiware.org/developers/catalogue
.. figure:: https://img.shields.io/badge/tag-fiware-orange.svg?logo=stackoverflow
  :target: http://stackoverflow.com/questions/tagged/fiware


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
