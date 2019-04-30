.. title: Major updates since DR7
.. slug: updates
.. tags: mathjax
.. description:

.. |deg|    unicode:: U+000B0 .. DEGREE SIGN
.. |Prime|    unicode:: U+02033 .. DOUBLE PRIME

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
   - Such forground sources include bright stars, medium-bright stars, globular clusters and large galaxies
   - Pre-defined geometrical masks (elliptical for galaxies)
   - Ignore these mask regions in the local sky fitting calibration code
   - Within some mask regions for bright stars + globulars + large gals, object fitting is only type=PSF (except for the large galaxies themselves)
   - Within all mask regions, fit for a constant sky level in the blob for each exposure; this appears to preferentially classify sources as TYPE=PSF around GAIA stars
* Multi-image detection of cosmic rays & other artifacts
* Partial subtraction of PSF wings around bright stars
* Fix positions for all GAIA sources after applying proper motion + parallax
* Fix TYPE=PSF if pass star/galaxy cut in GAIA catalog using the excess noise parameter as follows:
     - astrometric_excess_noise < 10^0.5^ for G <= 18
     - astrometric_excess_noise < 10^(0.5 + 0.2*(G-18))^ for G >= 18

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