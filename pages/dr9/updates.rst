.. title: Major updates since DR8
.. slug: updates
.. tags: mathjax

.. class:: pull-right well

.. contents::

DR9 will be the final release of the Legacy Surveys that is used for `DESI`_ target selection.
As such, a major push was made to update the `DR8`_ code and data model to prepare for `DESI`_ observations.
This page briefly documents those updates.

.. _`DESI`: http://desi.lbl.gov
.. _`DR8`: ../../dr7/description

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
* Astrometry is now tied entirely to `Gaia Data Release 2`_.

Algorithmic changes for WISE
============================
* WISE imaging has been updated to include observations through the `5th year of the NEOWISE W1/W2 data`_.
* The unWISE astrometry has been re-generated, and proper motions of stars have been correctly accounted for when conducting time-resolved forced photometry.
* unWISE epochs have been resampled to have more uniform coverage for the WISE light curves, particularly near the ecliptic poles (e.g. for columns such as ``lc_flux_w1`` on the `catalogs page`_).
* The unWISE epoch index number is now recorded in the `Tractor catalogs`_.

.. _`5th year of the NEOWISE W1/W2 data`: http://wise2.ipac.caltech.edu/docs/release/neowise/neowise_2019_release_intro.html
.. _`catalogs page`: ../catalogs
.. _`Tractor catalogs`: ../catalogs

Other algorithmic changes
=========================
* External catalogs are now matched to using a 1.5 arcsecond radius (the matching radius was 1.0 arcsec prior to DR8).

Data model changes
==================
* The directory structure is now split into two distinct sub-directories:
    - ``dr8/south/`` for `DECaLS`_ data
    - ``dr8/north/`` for `MzLS`_/`BASS`_ data
* A new morphological type ``TYPE=DUP`` has been added for Gaia sources that are coincident with an extended source.
    - No optical flux is assigned to ``DUP`` sources, but they are retained such that all Gaia sources appear in the source catalogs.
* The ``maskbits-*`` files have been updated with extra bits as documented on the `DR9 bitmasks page`_.
* The ``BRIGHTSTARINBLOB`` boolean column has been dropped in favor of the integer column ``BRIGHTBLOB``, which contains extra bits as documented on the `DR9 bitmasks page`_.
* Additional Gaia columns have been added to the Tractor and sweeps catalogs:
   - ``GAIA_PHOT_BP_RP_EXCESS_FACTOR``
   - ``GAIA_ASTROMETRIC_SIGMA5D_MAX``
   - ``GAIA_ASTROMETRIC_PARAMS_SOLVED``
* Additional Gaia columns have been propagated from the Tractor catalogs to the sweeps catalogs:
   - ``REF_CAT``
   - ``REF_EPOCH``
* Additional columns now appear in the random catalogs:
   - ``PSFSIZE_G/R/Z``
   - ``APFLUX_G/R/Z``
   - ``APFLUX_IVAR_G/R/Z``
   - ``PHOTSYS``
* Additional columns now appear in the ``survey-ccds-`` files:
   - ``plver`` (this was previously only in the ``ccds-annotated-`` files)
   - ``procdate``
   - ``plprocid``
   - ``airmass``
   - ``ccdskysb``
   - ``ccdnastrom``
   - ``ccdnphotom``
* A column has been removed from the ``survey-ccds-`` files:
   - ``ccdnmatch``
* Any columns denoting quantities in :math:`u`, :math:`i` or :math:`Y` filters have been removed from the Tractor catalogs (e.g. ``flux_u``, ``flux_i``, ``flux_Y``).
* The ``calib/*/splinesky`` files now contain many additional statistics characterizing the sky fitting.
* New metrics files have been added in the metrics directories:
   - ``metrics/*/outlier-mask*``
   - ``metrics/*/reference*``


.. _`DR7`: ../../dr7/description
.. _`DR9 bitmasks page`: ../bitmasks
.. _`Aaron Meisner's unWISE documentation`: http://catalog.unwise.me/files/unwise_bitmask_writeup-03Dec2018.pdf
.. _`BASS`: ../../bass
.. _`DECaLS`: ../../decamls
.. _`MzLS`: ../../mzls
.. _`Gaia Data Release 2`: http://gaia.esac.esa.int/documentation/GDR2/index.html
