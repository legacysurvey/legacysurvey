.. title: Major updates since DR7
.. slug: updates
.. tags: mathjax

.. class:: pull-right well

.. contents::

DR8 is the first release to integrate data from all of the individual Legacy Surveys (`BASS`_, `DECaLS`_ and `MzLS`_).
In addition, observations for the Legacy Surveys were completed in March 2019, before the release of DR8.
As such, a major push was made to update the `DR7`_ code and data model to prepare for the final Legacy Surveys Data Releases.
This page briefly documents those updates.

.. _`BASS`: ../../bass
.. _`DECaLS`: ../../decamls
.. _`MzLS`: ../../mzls

Algorithmic changes for optical data
====================================
* Data from DECam has been trimmed to only observations after 2014-03-14 (to avoid problems with scattered light in early DECam data).
* Contaminating foreground sources have been treated more consistently: 
    - Such foreground sources include bright stars, medium-bright stars, globular clusters and large galaxies.
    - The foreground sources consist of pre-defined geometrical masks (which are elliptical for galaxies).
    - These mask regions are ignored in the local-sky-fitting calibration code.
    - Within the mask regions for bright stars, globular clusters and large galaxies, sources are forced to be ``TYPE=PSF`` (except for the large galaxies themselves).
    - Within all of the mask regions, a constant sky level is fit in the mask blob for each exposure; this appears to preferentially classify sources as ``TYPE=PSF`` around Gaia stars.
* Cosmic rays & other artifacts are now detected across multiple images.
* PSF wings around bright stars are now partially subtracted.
* All Gaia sources are forced to have fixed positions after accounting for proper motion and parallax.
* Sources that pass a star/galaxy cut in the Gaia catalog are forced to be ``TYPE=PSF`` using the Gaia excess noise parameter as follows:
    - For :math:`G < 18`: :math:`\mathrm{astrometric\_excess\_noise} < 10^{0.5}`
    - For :math:`G \geq 18`: :math:`\mathrm{astrometric\_excess\_noise} < 10^{(0.5 + 0.2(G-18))}`

Algorithmic changes for WISE
============================
* PSFs are now pixelized.
* Astrometry has been improved.
* Sky modeling is now more accurate, which should remove biases for faint sources.
* WISE coadds are generated on the same brick projections as for the optical (:math:`g,r,z`) imaging.
* WISE bitmasks are now much more richly featured, as detailed in `Aaron Meisner's unWISE documentation`_.
* The unWISE inverse variance map has been regularized.

Data model changes
==================
* A new morphological type ``TYPE=DUP`` has been added for Gaia sources that are coincident with an extended source.
    - No optical flux is assigned to ``DUP`` sources, but they are retained such that all Gaia sources appear in the source catalogs.
* The ``maskbits-*`` files have been updated with extra bits as documented on the `DR8 bitmasks page`_.
* The ``BRIGHTSTARINBLOB`` boolean column has been dropped in favor of the integer column ``BRIGHTBLOB``, which contains extra bits as documented on the `DR8 bitmasks page`_.
* Additional Gaia columns have been added to the Tractor and sweeps catalogs:
   - ``GAIA_PHOT_BP_RP_EXCESS_FACTOR``
   - ``GAIA_ASTROMETRIC_SIGMA5D_MAX``
   - ``GAIA_ASTROMETRIC_PARAMS_SOLVED``
* Additional Gaia columns have been propagated from the Tractor catalogs to the sweeps catalogs:
   - ``REF_CAT``
   - ``REF_EPOCH``
* Any columns denoting quantities in :math:`u`, :math:`i` or :math:`Y` filters have been removed from the Tractor catalogs (e.g. ``flux_u``, ``flux_i``, ``flux_Y``).
* The ``calib/*/splinesky`` files now contain many additional statistics characterizing the sky fitting.
* New metrics files have been added in the metrics directories:
   - ``metrics/*/outlier-mask*``
   - ``metrics/*/reference*``


.. _`DR7`: ../../dr7/description
.. _`DR8 bitmasks page`: ../bitmasks
.. _`Aaron Meisner's unWISE documentation`: http://catalog.unwise.me/files/unwise_bitmask_writeup-03Dec2018.pdf