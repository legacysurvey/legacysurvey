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
This includes all bricks on the sky, not just the ones in our footprint or with
coverage in DR2.  For that information, see the next file description.

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
=============== ======= ======================================================


decals-bricks-dr2.fits
----------------------

A FITS binary table with information about what is included in DR2.

This table contains only rows (bricks) for which we have some imaging coverage.

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
``nobs_med_g``  uint8   Median number of observations in g
``nobs_med_r``  uint8   Median number of observations in r
``nobs_med_z``  uint8   Median number of observations in z
``nobs_max_g``  uint8   Maximum number of observations in g
``nobs_max_r``  uint8   Maximum number of observations in r
``nobs_max_z``  uint8   Maximum number of observations in z
=============== ======= ======================================================


decals-ccds.fits
----------------

This file contains information regarding the photometric and astrometric zero points for each CCD of every DECam image that is part of the DECaLS DR2 data release. Photometric zero points for each CCD are computed by identifying stars and comparing their instrumental magnitudes (measured in an approximately 7 arcsec diameter aperture) to color-selected stars in the PanSTARRS "qy" catalog. 

================== =========  ======================================================
Column             Type       Description
================== =========  ======================================================
``expnum``         int32      Unique DECam exposure number, eg 348224.
``exptime``        float      Exposure time in seconds, eg 30.
``filter``         char[1]    Filter used for observation, eg "g", "r", "z".
``seeing``         float      Seeing in arcseconds determined by fitting a 2-dimensional gaussian to the median PSF of stars on the CCD, eg 1.1019.
``date_obs``       char[10]   Date of observation start, eg "2014-08-15".  Can be combined with ``ut``, or use ``mjd_obs`` instead.
``mjd_obs``        double     Date of observation in MJD (in UTC system), eg 56884.99373389.               
``ut``             char[15]   Time of observation start, eg "23:50:58.608241".
``airmass``        float      Airmass, eg 1.35.
``propid``         char[10]   NOAO Proposal ID that took this image, eg "2014B-0404".
``zpt``            float      Median zero point for the entire image (median of all CCDs of the image), eg 25.0927.
``avsky``          float      Average sky level in this image, in ADU, eg 36.9324.
``arawgain``       float      Average gain for this CCD, eg 4.34.
``fwhm``           float      [use "seeing" instead]
``crpix1``         float      Astrometric header value: X reference pixel.
``crpix2``         float      Astrometric header value: Y reference pixel.
``crval1``         double     Astrometric header value: RA of reference pixel.
``crval2``         double     Astrometric header value: Dec of reference pixel.
``cd1_1``          float      Astrometric header value: transformation matrix.
``cd1_2``          float      Astrometric header value: transformation matrix.
``cd2_1``          float      Astrometric header value: transformation matrix.
``cd2_2``          float      Astrometric header value: transformation matrix.
``ccdnum``         int16      CCD number (see DECam layout), eg 1.
``ccdname``        char[3]    CCD name (see DECam layout), eg "N10", "S7".
``ccdzpt``         float      Zeropoint for the CCD (AB mag).
``ccdzpta``        float      Zeropoint for amp A (AB mag).
``ccdzptb``        float      Zeropoint for amp B (AB mag).
``ccdphoff``       float      (ignore)
``ccdphrms``       float      Photometric rms for the CCD (in mag).
``ccdskyrms``      float      Sky rms (in counts).
``ccdraoff``       float      Median astrometric offset for the CCD <PS1-DECaLS> in arcsec.
``ccddecoff``      float      Median astrometric offset for the CCD <PS1-DECaLS> in arcsec
``ccdtransp``      float      (ignore)
``ccdnstar``       int16      Number of stars found on the CCD.
``ccdnmatch``      int16      Number of stars matched to PS1 (and used to compute the photometric zero points and astrometric offsets).
``ccdnmatcha``     int16      Number of stars in amp A matched.
``ccdnmatchb``     int16      Number of stars in amp B matched.
``ccdmdncol``      float      Median (g-i) color from the PS1 catalog of the matched stars.
``camera``         char[5]    The camera that took this image; "decam".
``expid``          char[12]   Exposure ID string, eg "00348224-S29" (from ``expnum`` and ``ccdname``)
``image_hdu``      int16      FITS HDU number in the ``image_filename`` file where this image can be found.
``image_filename`` char[61]   Path to FITS image, eg "decam/CP20140810_g_v2/c4d_140815_235218_ooi_g_v2.fits.fz".
``width``          int16      Width in pixels of this image, eg 2046.
``height``         int16      Height in pixels of this image, eg 4096.
``ra_bore``        double     Telescope boresight RA  of this exposure (deg).
``dec_bore``       double     Telescope boresight Dec of this exposure (deg).
``ra``             double     Approximate RA  center of this CCD (deg).
``dec``            double     Approximate Dec center of this CCD (deg).
================== =========  ======================================================



FITS binary table with almanac information (seeing, sky-brighness, etc.) about
each individual CCD image.


decals-ccds-annotated.fits
--------------------------

A version of the decals-ccds.fits file with additional information
gathered during calibration pre-processing before running the Tractor
reductions.

Includes everything listed in the decals-ccds.fits file plus the following:

==================== ======== ======================================================
Column               Type      Description
==================== ======== ======================================================
``photometric``      boolean  True if this CCD was considered photometric and used in the DR2 reductions
``blacklist_ok``     boolean  We blacklisted certain programs (Proposal IDs) from other PIs where there were a large number of images covering a single patch of sky, because our pipeline code didn't handle the extreme depth very well.  True if this CCD was *not* blacklisted, ie, was used.
``good_region``      int[4]   If only a subset of the CCD images was used, this array of x0,x1,y0,y1 values gives the coordinates that were used, [x0,x1), [y0,y1).  -1 for no cut (most CCDs).
``ra0``              double   RA  coordinate of pixel (1,1)
``dec0``             double   Dec coordinate of pixel (1,1)
``ra1``              double   RA  coordinate of pixel (1,H)
``dec1``             double   Dec coordinate of pixel (1,H)
``ra2``              double   RA  coordinate of pixel (W,H)
``dec2``             double   Dec coordinate of pixel (W,H)
``ra3``              double   RA  coordinate of pixel (W,1)
``dec3``             double   Dec coordinate of pixel (W,1)
``dra``              float    Maximum distance from RA,Dec center to the edge midpoints, in RA
``ddec``             float    Maximum distance from RA,Dec center to the edge midpoints, in Dec
``ra_center``        double   RA coordinate of CCD center
``dec_center``       double   RA coordinate of CCD center
``sig1``             float    Median per-pixel error standard deviation, in nanomaggies.
``meansky``          float    Our pipeline (not the CP) estimate of the sky level, average over the image, in ADU.
``stdsky``           float    Standard deviation of our sky level
``minsky``           float    Min of our sky level
``maxsky``           float    Max of our sky level
``pixscale_mean``    float    Pixel scale (via sqrt of area of a 10x10 pixel patch evaluated in a 5x5 grid across the image), in arcsec/pixel.
``pixscale_std``     float    Standard deviation of pixel scale
``pixscale_min``     float    Min of pixel scale
``pixscale_max``     float    Max of pixel scale
``psfnorm_mean``     float    PSF norm = 1/sqrt of N_eff = sqrt(sum(psf_i^2)) for normalized PSF pixels i; mean of the PSF model evaluated on a 5x5 grid of points across the image.  Point-source detection standard deviation is ``sig1 / psfnorm``.
``psfnorm_std``      float    Standard deviation of PSF norm
``galnorm_mean``     float    Norm of the PSF model convolved by a 0.45" exponential galaxy.
``galnorm_std``      float    Standard deviation of galaxy norm.
``psf_mx2``          float    PSF model second moment in x (pixels^2)
``psf_my2``          float    PSF model second moment in y (pixels^2)
``psf_mxy``          float    PSF model second moment in x-y (pixels^2)
``psf_a``            float    PSF model major axis (pixels)
``psf_b``            float    PSF model minor axis (pixels)
``psf_theta``        float    PSF position angle (deg)
``psf_ell``          float    PSF ellipticity 1 - minor/major
``humidity``         float    Percent humidity outside
``outtemp``          float    Outside temperate (deg C).
``tileid``           int32    DECaLS tile number, if this was a DECaLS observation; or 0 for data from other programs.
``tilepass``         uint8    DECaLS tile pass number, 1, 2 or 3, if this was a DECaLS observation, or 0 for data from other programs.  Set by the observers; pass 1 is supposed to be photometric with good seeing, pass 3 unphotometric or bad seeing, and pass 2 in between.
``tileebv``          float    Mean SFD E(B-V) extinction in the DECaLS tile, or 0 for non-DECaLS data.
``plver``            char[6]  Community Pipeline (CP) PLVER version string
``ebv``              float    SFD E(B-V) extinction for CCD center
``decam_extinction`` float[6] Extinction for DECam filters ugrizY
``wise_extinction``  float[4] Extinction for WISE bands W1,W2,W3,W4
``psfdepth``         float    5-sigma PSF detection depth in AB mag, using PsfEx PSF model
``galdepth``         float    5-sigma galaxy (0.45" round exp) detection depth in AB mag
``gausspsfdepth``    float    5-sigma PSF detection depth in AB mag, using Gaussian PSF approximation (using ``seeing`` value)
``gaussgaldepth``    float    5-sigma galaxy detection depth in AB mag, using Gaussian PSF approximation
==================== ======== ======================================================





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
Tractor measurements) of all the Tractor catalogs in rectangles of RA,Dec.


Image Stacks
============

Image stacks are on tangent-plane (WCS TAN) projections, 3600 |times|
3600 pixels, at 0.262 arcseconds per pixel.

coadd/<AAA>/<brick>/decals-<brick>-ccds.fits
--------------------------------------------

FITS binary table with the list of CCD images that were used in this brick.
Same columns as decals-ccds.fits, plus:

================ ========= ======================================================
Column           Type      Description
================ ========= ======================================================
``ccd_x0``       int16     Minimum x image coordinate overlapping this brick
``ccd_x1``       int16     Maximum x image coordinate overlapping this brick
``ccd_y0``       int16     Minimum y image coordinate overlapping this brick
``ccd_y1``       int16     Maximum y image coordinate overlapping this brick
``brick_x0``     int16     Minimum x brick image coordinate overlapped by this image
``brick_x1``     int16     Maximum x brick image coordinate overlapped by this image
``brick_y0``     int16     Minimum y brick image coordinate overlapped by this image
``brick_y1``     int16     Maximum y brick image coordinate overlapped by this image
``psfnorm``      float     Same as ``psfnorm`` in decals-ccds-annotated.fits
``galnorm``      float     Same as ``galnorm`` in decals-ccds-annotated.fits
``plver``        char[6]   Community Pipeline (CP) version
``skyver``       char[16]  Git version of the sky calibration code
``wcsver``       char[16]  Git version of the WCS calibration code
``psfver``       char[16]  Git version of the PSF calibration code
``skyplver``     char[16]  CP version of the input to sky calibration
``wcsplver``     char[16]  CP version of the input to WCS calibration
``psfplver``     char[16]  CP version of the input to PSF calibration
================ ========= ======================================================


coadd/<AAA>/<brick>/decals-<brick>-image-<filter>.fits
------------------------------------------------------

Stacked image centered on a brick location covering 0.25\ |deg| |times| 0.25\
|deg|.  The primary HDU contains the coadded image (inverse-variance weighted coadd), in
units of nanomaggies per pixel.

- NOTE: These are not the images used by Tractor, which operates on the
  single-epoch images.

- NOTE: that these images are resampled using nearest-neighbor
  resampling, so should not be used for numerical purposes (eg, photometry)

coadd/<AAA>/<brick>/decals-<brick>-invvar-<filter>.fits
-------------------------------------------------------

Corresponding stacked inverse variance image based on the sum of the
inverse-variances of the individual input images in units of 1/(nanomaggies)\
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
