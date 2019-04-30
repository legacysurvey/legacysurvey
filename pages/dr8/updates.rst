.. title: Major updates since DR7
.. slug: updates
.. tags: mathjax

.. class:: pull-right well

.. contents::

DR8 was the first release to integrate data from all of the individual Legacy Surveys (`BASS`_, `DECaLS`_ and `MzLS`_).
In addition, observations for the Legacy Surveys were completed in March 2019, before the release of DR8.
As such, a major push was made to update the `DR7`_ code and data model to prepare for the final Legacy Surveys Data Releases.
This page briefly documents those updates.

.. _`BASS`: ../../bass
.. _`DECaLS`: ../../decamls
.. _`MzLS`: ../../mzls

Algorithmic changes for optical data
====================================
* Data from DECam has been trimmed to only observations after 2014-03-14 (to avoid problems with scattered light).
* Contaminating foreground sources have been treated more consistently: 
   - Such foreground sources include bright stars, medium-bright stars, globular clusters and large galaxies.
   - The foreground sources consist of pre-defined geometrical masks (which are elliptical for galaxies).
   - These mask regions are ignored in the local-sky-fitting calibration code.
   - Within the mask regions for bright stars, globular clusters and large galaxies, source fitting is forced to only be ``type=PSF`` (except for the large galaxies themselves).
   - Within all of the mask regions, a constant sky level is fit in the mask blob for each exposure; this appears to preferentially classify sources as ``TYPE=PSF`` around GAIA stars.
* Cosmic rays & other artifacts are now detected across multiple images.
* PSF wings around bright stars are now partially subtracted.
* All Gaia sources are forced to have fixes positions after accounting for proper motion + parallax.
* Sources that pass a star/galaxy cut in the Gaia catalog are forced to be ``TYPE=PSF`` using the Gaia excess noise parameter as follows:
     - for :math:`G < 18`: :math:`\mathrm{astrometric\_excess\_noise} < 10^{0.5}`
     - for :math:`G \geq 18`: :math:`\mathrm{astrometric\_excess\_noise} < 10^{(0.5 + 0.2(G-18))}`

Algorithmic changes for WISE
============================
* PSFs are now pixelized.
* Astrometry has been improved.
* Sky modeling is now more accurate, which should remove biases for faint sources.
* WISE coadds are generated on the same brick projections as for the optical (:math:`g,r,z`) imaging.
* WISE bitmasks are now much more richly featured, as detailed [http://catalog.unwise.me/files/unwise_bitmask_writeup-03Dec2018.pdf here].
* The unWISE inverse variance map has been regularized.

Data model changes:
* New type TYPE="DUP" for GAIA sources that are coincident with an extended source; in these cases, no optical flux is assigned to the DUP source, but it is retained in the catalog such that all GAIA sources appear in the Tractor catalogs
* Two new bits in the maskbits-* files (see https://github.com/legacysurvey/legacypipe/blob/master/py/legacypipe/survey.py#L33 ):
   - 0x800 bit set for medium-bright star
   - 0x1000 bit set for large galaxies where no other extended sources are detected or fit
* BRIGHTSTARINBLOB boolean column dropped in favor of the integer column BRIGHTBLOB, a bit mask with values (see https://github.com/legacysurvey/legacypipe/blob/976d2ed6d3ebfad7feb7745560802e64e46caccc/py/legacypipe/survey.py#L51-L57 ):
   - 0x1 bright star (Tycho)
   - 0x2 medium bright star (GAIA)
   - 0x4 globular cluster
   - 0x8 large galaxy
* Include additional GAIA columns in Tractor/sweeps files (if failed to do this, then do so for DR9)
   - GAIA_PHOT_BP_RP_EXCESS_FACTOR
   - GAIA_ASTROMETRIC_SIGMA5D_MAX
   - GAIA_ASTROMETRIC_PARAMS_SOLVED
* In the sweep files, add REF_CAT.
* In the sweep files, add the column "REF_EPOCH" from the Tractor files preferable as a single header keyword
* In the calib directory, the splinesky files contain many statistics on the sky fitting, and the sky if fit on smaller scales

.. _`DR7`: ../../dr7/description