.. title: Legacy Survey Files
.. slug: files
.. tags: mathjax
.. description:

.. |sigma|    unicode:: U+003C3 .. GREEK SMALL LETTER SIGMA
.. |sup2|     unicode:: U+000B2 .. SUPERSCRIPT TWO
.. |chi|      unicode:: U+003C7 .. GREEK SMALL LETTER CHI
.. |delta|    unicode:: U+003B4 .. GREEK SMALL LETTER DELTA
.. |deg|    unicode:: U+000B0 .. DEGREE SIGN
.. |times|  unicode:: U+000D7 .. MULTIPLICATION SIGN
.. |plusmn| unicode:: U+000B1 .. PLUS-MINUS SIGN
.. |Prime|    unicode:: U+02033 .. DOUBLE PRIME

Top level directory for web access:
  http://portal.nersc.gov/project/cosmo/data/legacysurvey/dr2/

Top level directory local to NERSC computers (for collaborators):
  /global/project/projectdirs/cosmo/data/legacysurvey/dr2/

Summary Files
=============

decals-bricks.fits
------------------

FITS binary table with the RA, DEC bounds of each geometrical "brick" on the sky.
The subset of bricks which have g-, r-, or z-band imaging in this data release
can be identified using the ``has_image_g``, ``has_image_r``, and ``has_image_z`` tags,
respectively.  The bricks with a corresponding Tractor photometric catalog in
this release can be identified using the ``has_catalog`` tag.

- HDU1 (only HDU) - tags in the ``decals-bricks.fits`` file

=============== ======= ======================================================
Column          Type    Description
=============== ======= ======================================================
``brickname``   char[8] Name of the brick.
``brickid``     int32   A unique integer with 1-to-1 mapping to ``brickname``.
``brickq``      int16   A "priority" factor used for processing.
``brickrow``    int32   Dec row number.
``brickcol``    int32   Number of the brick within a Dec row.
``ra``          double  RA of the center of the brick.
``dec``         double  Dec of the center of the brick.
``ra1``         double  Lower RA boundary.
``ra2``         double  Upper RA boundary.
``dec1``        double  Lower Dec boundary.
``dec2``        double  Upper Dec boundary.
``has_image_g`` byte    This brick has imaging data in this band.
``has_image_r`` byte    This brick has imaging data in this band.
``has_image_z`` byte    This brick has imaging data in this band.
``has_catalog`` byte    This brick has Tractor photometry.
=============== ======= ======================================================


decals-ccds.fits
----------------

================ ========= ======================================================
Column           Type      Description
================ ========= ======================================================
``filter``       char[1]
``ra``           double
``dec``          double
``airmass``      float
``date_obs``     char[26]
``g_seeing``     float
``exptime``      float
``expnum``       int32
``mjd_obs``      float
``propid``       char[10]
``guider``       int32
``object``       char[31]
``avsky``        float
``arawgain``     float
``fwhm``         float
``crpix1``       double
``crpix2``       double
``crval1``       double
``crval2``       double
``cd1_1``        float
``cd1_2``        float
``cd2_1``        float
``cd2_2``        float
``extname``      char[8]
``ccdnum``       int32
``cpimage``      char[82]
``cpimage_hdu``  int32
``calname``      float[38]
``height``       int32
``width``        int32
``ra_bore``      double
``dec_bore``     double
``dr1``          byte
================ ========= ======================================================

FITS binary table with almanac information (seeing, sky-brighness, etc.) about
each individual CCD image.  The subset of CCDs included in this release can be
identified using the DR2 tag.

decals-dr2-specObj-dr12.fits
----------------------------
HDU1 (the only HDU) contains Tractored DECaLS
photometry that is row-by-row-matched to the SDSS DR12 spectrosopic
pipeline file such that the photometric parameters in row "N" of 
decals-dr2-specObj-dr12.fits matches the spectroscopic parameters in row "N" of
specObj-dr12.fits. The structure of the DECaLS photometric catalog file is documented on the
`catalogs page`_ and the spectroscopic file 
is documented in the SDSS DR12 `data model for specObj-dr12.fits`_.

.. _`catalogs page`: ../catalogs
.. _`data model for specObj-dr12.fits`: http://data.sdss3.org/datamodel/files/SPECTRO_REDUX/specObj.html

decals-dr2-DR12Q.fits
---------------------
HDU1 (the only HDU) contains Tractored DECaLS 
photometry that is row-by-row-matched to the SDSS DR12 
visually inspected quasar catalog (Paris et al. 2016, in preparation, see also `Paris et al. 2014`_)
such that the photometric parameters in row "N" of 
decals-dr2-DR12Q.fits matches the spectroscopic parameters in row "N" of
DR12Q.fits. The structure of the DECaLS photometric catalog file is documented on the
`catalogs page`_ and the spectroscopic file 
is documented in the SDSS DR12 `data model for DR12Q.fits`_.

.. _`Paris et al. 2014`: http://adsabs.harvard.edu/abs/2014A%26A...563A..54P
.. _`catalogs page`: ../catalogs
.. _`data model for DR12Q.fits`: http://data.sdss3.org/datamodel/files/BOSS_QSO/DR12Q/DR12Q.html

decals-dr2-Superset_DR12Q.fits
------------------------------
HDU1 (the only HDU) contains Tractored DECaLS
photometry catalog that is row-by-row-matched to the superset of all SDSS DR12 spectroscopically
confirmed objects that were visually inspected as possible quasars 
(Paris et al. 2016, in preparation, see also `Paris et al. 2014`_)
such that the photometric parameters in row "N" of 
decals-dr2-Superset_DR12Q.fits matches the spectroscopic parameters in row "N" of
Superset_DR12Q.fits. The structure of the DECaLS photometric catalog file is documented on the
`catalogs page`_ and the spectroscopic file
is documented in the SDSS DR12 `data model for Superset_DR12Q.fits`_.

.. _`Paris et al. 2014`: http://adsabs.harvard.edu/abs/2014A%26A...563A..54P
.. _`catalogs page`: ../catalogs
.. _`data model for Superset_DR12Q.fits`: http://data.sdss3.org/datamodel/files/BOSS_QSO/DR12Q/DR12Q_superset.html

ZeroPoints-DR2.fits
-------------------
The ZeroPoints-DR2.fits file contains information regarding the photometric and astrometric zero points for each CCD of every DECam image that is part of the DECaLS DR2 data release. Photometric zero points for each CCD are computed by identifying stars and comparing their instrumental magnitudes (measured in an approximately 7 arcsec diameter aperture) to color-selected stars in the PanSTARRS "qy" catalog. 

- HDU1 (only HDU) - tags in the ``ZeroPoints-DR2.fits`` file

================= ======== ======================================================
Column            Type     Description
================= ======== ======================================================
``filename``      char[78] Name of the NOAO CP-reduced image FITS file.
``expnum``        char[12] Unique DECam exposure number.
``exptime``       float    Exposure time in seconds.
``filter``        char[32] Filter used for observation.
``seeing``        float    Seeing in arcseconds determined by fitting a 2-dimensional gaussian to the median PSF of stars on the CCD.
``ra``            double   Right Ascension in decimal degrees.
``dec``           double   Declination in decimal degrees.
``zpt``           float    Median zero point for the entire image (median of all CCDs of the image).
``ccdnum``        int32    CCD number (see DECam layout).
``ccdname``       char[3]  CCD name (see DECam layout).
``ccdra``         double   Central RA for the CCD.
``ccddec``        double   Central Dec for the CCD.
``ccdzpt``        double   Zeropoint for the CCD (AB mag).
``ccdphrms``      double   Photometric rms for the CCD (in mag).
``ccdskyrms``     double   Sky rms (in counts).
``ccdraoff``      double   Median astrometric offset for the CCD <PS1-DECaLS> in arcsec.
``ccddecoff``     double   Median astrometric offset for the CCD <PS1-DECaLS> in arcsec
``ccdnstar``      int32    Number of stars found on the CCD.
``ccdnmatch``     int32    Number of stars matched to PS1 (and used to compute the photometric zero points and astrometric offsets).
``ccdmdncol``     float    Median (g-i) color from the PS1 catalog of the matched stars.
``dr1``           byte     Included in the DR1 data set? 1=Yes, 0=No. Images that are non-photometric or on malfunctioning CCDs are excluded from DR1.
================= ======== ======================================================

Tractor Catalogs
================

tractor/<AAA>/tractor-<brick>.fits
----------------------------------

FITS binary table containing Tractor photometry, documented on the
`catalogs page`_. 

.. _`catalogs page`: ../catalogs

Sweep Catalogs
==============

tractor-sweep-<AAA>.fits
------------------------

Light-weight FITS binary tables (containing a subset of the most commonly used
Tractor measurements) of all the Tractor catalogs in a given degree of right
ascension <AAA>.

Image Stacks
============

coadd/<AAA>/<brick>/decals-<brick>-ccds.fits
--------------------------------------------

FITS binary table with the list of CCD images that were used in this brick.
EXPNUM indicates the DECam exposure ID and FILTER indicates the filter (u,g,r).

coadd/<AAA>/<brick>/decals-<brick>-image-<filter>.fits
------------------------------------------------------

Stacked image centered on a brick location covering 0.25\ |deg| |times| 0.25\
|deg|.  The primary HDU contains the coadded image (simple unweighted coadd), in
units of nano-maggies per pixel.

- NOTE: These are not the images used by Tractor, which operates on the
  single-epoch images.

coadd/<AAA>/<brick>/decals-<brick>-invvar-<filter>.fits
-------------------------------------------------------

Corresponding stacked inverse variance image based on the sum of the
inverse-variances of the individual input images in units of 1/(nano-maggies)\
|sup2| per pixel.

- NOTE: These are not the inverse variance maps used by Tractor, which operates
  on the single-epoch images.

coadd/<AAA>/<brick>/decals-<brick>-model-<filter>.fits.gz
---------------------------------------------------------

Stacked model image centered on a brick location covering 0.25\ |deg| |times| 0.25\ |deg|.

- The Tractor's idea of what the coadded images should look like; the Tractor's model prediction.

coadd/<AAA>/<brick>/decals-<brick>-chi2-<filter>.fits
-----------------------------------------------------

Stacked |chi|\ |sup2| image, which is approximately the summed |chi|\ |sup2| values from the single-epoch images.

coadd/<AAA>/<brick>/decals-<brick>-depth-<filter>.fits.gz
---------------------------------------------------------

Stacked depth map in units of the point-source inverse-variance at each pixel.

- The 5\ |sigma| point-source depth can be computed as 5 / sqrt(depth_ivar) .

coadd/<AAA>/<brick>/decals-<brick>-nexp-<filter>.fits.gz
--------------------------------------------------------

Number of exposures contributing to each pixel of the stacked images.

coadd/<AAA>/<brick>/decals-<brick>-image.jpg
--------------------------------------------

JPEG image of calibrated image using the g,r,z filters as the colors.

coadd/<AAA>/<brick>/decals-<brick>-model.jpg
--------------------------------------------

JPEG image of the Tractor's model image using the g,r,z filters as the colors.

coadd/<AAA>/<brick>/decals-<brick>-resid.jpg
--------------------------------------------

JPEG image of the residual image (data minus model) using the g,r,z filters as
the colors.

Raw Data
========

Raw Legacy Survey images are available through the NOAO Science Archive.  The
*input* data used to create the stacked images, Tractor catalogs, etc. comprises
images taken by the dedicated DECam Legacy Survey project, as well as other
DECam images, and images from other surveys.  These instructions are for
obtaining raw images from the DECam Legacy Survey *only*.

1. Visit the `NOAO Science Archive`_.
2. Click on `General Search for NOAO data (all users)`_.
3. In the Simple Query Form, enter "2014B-0404" in the Program number box.
4. Check "Raw" under All instruments.
5. Click Search
6. Once the query finishes, you can "Categorize by"  "Observation type".  The "object"
   images are actual on-sky data.  Other Observation types are flats, darks, etc.
7. The Results page offers several different ways to download the detail.  See
   `the Tutorials page`_ for details.

.. _`NOAO Science Archive`: http://portal-nvo.noao.edu
.. _`General Search for NOAO data (all users)`: http://portal-nvo.noao.edu/search/query
.. _`the Tutorials page`: http://portal-nvo.noao.edu/tutorials/query
