==========
User Guide
==========

------------
Introduction
------------

This user guide covers the FIWARE CKAN extensions for the FIWARE release 6. For details on
the usage of CKAN itself please refer to the `CKAN User Guide <http://docs.ckan.org/en/latest/user-guide.html>`__

Any feedback on this document is highly welcomed, including bugs, typos or things you think should be included but aren't.
Please send them to the "Contact Person" email that appears in the `Catalogue page for this GEi`_. Or create an issue at `GitHub Issues`_

.. _Catalogue page for this GEi: https://catalogue.fiware.org/enablers/ckan
.. _GitHub Issues: https://github.com/conwetlab/FIWARE-CKAN-Extensions/issues/new

------
OAuth2
------

When the OAuth2 extension is installed and active in a CKAN instance, all user and sign in features are delegated to
the external IDM. In this regard, the sign in process starts normally by clicking on *sign in*

.. image:: images/oauth1.png
   :align: center
   :scale: 50%

Then, the OAuth2 plugin redirects CKAN to the configured OAuth2 IDM in order to provide user credentials

.. image:: images/oauth2.png
   :align: center
   :scale: 50%

Once done, the browser is redirected back to CKAN with the user signed in

.. image:: images/oauth3.png
   :align: center


----------------
Private Datasets
----------------

---------
NGSI View
---------

-------------
BAE Publisher
-------------

--------------
WireCloud View
--------------

-------------
Data Requests
-------------
