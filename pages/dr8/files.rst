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

.. class:: pull-right well

.. contents::

Directory Structures
=====================

For Web Access
--------------

| **Top level directory:**
| http://portal.nersc.gov/project/cosmo/data/legacysurvey/dr8/
| **Top level directory for** `DECaLS`_ **data**:
| http://portal.nersc.gov/project/cosmo/data/legacysurvey/dr8/decam/
| **Top level directory for** `MzLS`_/`BASS`_ **data:**
| http://portal.nersc.gov/project/cosmo/data/legacysurvey/dr8/90prime-mosaic/
| **Top level directories for sweeps catalogs:**
| http://portal.nersc.gov/project/cosmo/data/legacysurvey/dr8/decam/sweep/
| http://portal.nersc.gov/project/cosmo/data/legacysurvey/dr8/90prime-mosaic/sweep/


At NERSC (for collaborators)
----------------------------

| **Top level directory:**
| /global/project/projectdirs/cosmo/data/legacysurvey/dr8/
| **Top level directory for** `DECaLS`_ **data:**
| /global/project/projectdirs/cosmo/data/legacysurvey/dr8/decam/
| **Top level directory for** `MzLS`_/`BASS`_ **data:**
| /global/project/projectdirs/cosmo/data/legacysurvey/dr8/90prime-mosaic/
| **Top level directories for sweeps catalogs:**
| /global/project/projectdirs/cosmo/data/legacysurvey/dr8/decam/sweep/
| /global/project/projectdirs/cosmo/data/legacysurvey/dr8/90prime-mosaic/sweep/

Summary Files
=============

survey-bricks.fits.gz
---------------------

FITS binary table with the RA, Dec bounds of each geometrical "brick" on the sky.
This includes all bricks on the sky, not just the ones in our footprint or with
coverage in DR8.  For that information, see the next file description.

=============== ======= ======================================================
Column          Type    Description
=============== ======= ======================================================
``BRICKNAME``   char[8] Name of the brick.
``BRICKID``     int32   A unique integer with 1-to-1 mapping to ``brickname``.
``BRICKQ``      int16   A "priority" factor used for processing.
``BRICKROW``    int32   Dec row number.
``BRICKCOL``    int32   Number of the brick within a Dec row.
``RA``          float64 RA of the center of the brick.
``DEC``         float64 Dec of the center of the brick.
``RA1``         float64 Lower RA boundary.
``RA2``         float64 Upper RA boundary.
``DEC1``        float64 Lower Dec boundary.
``DEC2``        float64 Upper Dec boundary.
=============== ======= ======================================================

survey-bricks-dr8.fits.gz
-------------------------

A FITS binary table with information that summarizes the contents of each brick for DR8.XXX

=============== ========== =========================================================================
Column          Type       Description
=============== ========== =========================================================================
``brickname``   char[8]    Name of the brick
``ra``          float64    RA of the center of the brick
``dec``         float64    Dec of the center of the brick
``nexp_g``      int16      Median number of exposures in the unique area (i.e. ``BRICK_PRIMARY`` area) of the brick in g-band
``nexp_r``      int16      Median number of exposures in the unique area of the brick in r-band
``nexp_z``      int16      Median number of exposures in the unique area of the brick in z-band
``nexphist_g``  int32[6]   Histogram of number of pixels in the unique brick area with 0, 1, 2, 3, 4, or > 5 exposures in g
``nexphist_r``  int32[6]   Histogram of number of pixels in the unique brick area with 0, 1, 2, 3, 4, or > 5 exposures in r
``nexphist_z``  int32[6]   Histogram of number of pixels in the unique brick area with 0, 1, 2, 3, 4, or > 5 exposures in z
``nobjs``       int16      Total number of ``BRICK_UNIQUE`` objects in this brick, of all types
``npsf``        int16      Total number of ``BRICK_UNIQUE`` objects in this brick, of type ``PSF``
``nsimp``       int16      Total number of ``BRICK_UNIQUE`` objects in this brick, of type ``REX``
``nrex``        int16      Total number of ``BRICK_UNIQUE`` objects in this brick, of type ``REX``
``nexp``        int16      Total number of ``BRICK_UNIQUE`` objects in this brick, of type ``EXP``
``ndev``        int16      Total number of ``BRICK_UNIQUE`` objects in this brick, of type ``DEV``
``ncomp``       int16      Total number of ``BRICK_UNIQUE`` objects in this brick, of type ``COMP``
``psfsize_g``   float32    Median PSF size, in arcsec, evaluated at the ``BRICK_UNIQUE`` objects in this brick in g-band
``psfsize_r``   float32    Median PSF size, in arcsec, evaluated at the ``BRICK_UNIQUE`` objects in this brick in r-band
``psfsize_z``   float32    Median PSF size, in arcsec, evaluated at the ``BRICK_UNIQUE`` objects in this brick in z-band
``psfdepth_g``  float32    5-sigma PSF detection depth in :math:`g`-band (AB mag), using PsfEx PSF model
``psfdepth_r``  float32    5-sigma PSF detection depth in :math:`r`-band (AB mag), using PsfEx PSF model
``psfdepth_z``  float32    5-sigma PSF detection depth in :math:`z`-band (AB mag), using PsfEx PSF model
``galdepth_g``  float32    5-sigma galaxy (0.45" round exp) detection depth in :math:`g`-band (AB) mag
``galdepth_r``  float32    5-sigma galaxy (0.45" round exp) detection depth in :math:`r`-band (AB) mag
``galdepth_z``  float32    5-sigma galaxy (0.45" round exp) detection depth in :math:`z`-band (AB) mag
``ebv``         float32    Median `SFD98`_ dust map E(B-V) extinction, in magnitudes, evaluated at ``BRICK_UNIQUE`` objects in this brick
``trans_g``     float32    Median Milky Way dust transparency in :math:`g`-band, based on ``ebv``. See also ``MW_TRANSMISSION_G``
``trans_r``     float32    Median Milky Way dust transparency in :math:`g`-band, based on ``ebv``. See also ``MW_TRANSMISSION_R``
``trans_z``     float32    Median Milky Way dust transparency in :math:`z`-band, based on ``ebv``. See also ``MW_TRANSMISSION_Z``
``ext_g``       float32    Extinction in :math:`g`-band
``ext_r``       float32    Extinction in :math:`r`-band
``ext_z``       float32    Extinction in :math:`z`-band
``wise_nobs``   int16[4]   Number of images that contributed to WISE calculations in each filter (not profile-weighted)
``trans_wise``  float32[4] Median Milky Way dust transparency in WISE bands, based on ``ebv``. See also, e.g., ``MW_TRANSMISSION_W1``
``ext_w1``      float32    Extinction in :math:`W1`-band
``ext_w2``      float32    Extinction in :math:`W2`-band
``ext_w3``      float32    Extinction in :math:`W3`-band
``ext_w4``      float32    Extinction in :math:`W4`-band
=============== ========== =========================================================================

Note that, for the ``nexphist`` rows, pixels that are masked by the NOAO Community Pipeline as, e.g., cosmic rays or saturation
(see, e.g. the ``ALLMASK/ANYMASK`` information on the `DR8 bitmasks page`_), do 
*not* count toward the number of exposures. More information about the morphological types and ``MW_TRANSMISSION`` can be found on 
the `catalogs page`_.

.. _`catalogs page`: ../catalogs
.. _`github`: https://github.com
.. _`DR8 bitmasks page`: ../bitmasks

survey-ccds-<camera>-dr8.fits.gz
--------------------------------

A FITS binary table with almanac information about each individual CCD image for each camera (where ``<camera>`` is one of ``90prime`` for `BASS`_, ``decam`` for `DECaLS`_ or ``mosaic`` for `MzLS`_). 

This file contains information regarding the photometric and astrometric zero points for each CCD of every image that is part of the DR8 data release. Photometric zero points for each CCD are computed by identifying stars and comparing their instrumental magnitudes to color-selected stars in the PanSTARRS "qz" catalog. 

The photometric zeropoints (``zpt``, ``ccdzpt``, etc)
are magnitude-like numbers (e.g. 25.04), and
indicate the magnitude of a source that would contribute one count per
second to the image.  For example, in an image with zeropoint of 25.04
and exposure time of 30 seconds, a source of magnitude 22.5 would
contribute
:math:`30 \times 10^{((25.04 - 22.5) / 2.5)} = 311.3`
counts.

.. _`BASS`: ../../bass  
.. _`MzLS`: ../../mzls
.. _`description page`: ../description

==================== ========== =======================================================
Column               Type       Description
==================== ========== =======================================================
``image_filename``   char[120]  Path to FITS image, e.g. "decam/DECam_CP/CP20170729/c4d_170730_045351_ooi_g_v1.fits.fz"
``image_hdu``        int16      FITS HDU number in the ``image_filename`` file where this image can be found
``camera``           char[9]    The camera that took this image e.g. "90prime"
``expnum``           int64      Exposure number, eg 348224
``plver``	     char[8]	Community Processing (CP) version number
``procdate``	     char[19]	CP processing date
``plprocid``	     char[7]	Unique CP processing hash
``ccdname``          char[5]    CCD name, e.g. "N10", "S7" for DECam
``object``           char[35]   Name listed in the object tag from the CCD header
``propid``           char[10]   NOAO Proposal ID that took this image, eg "2014B-0404"
``filter``           char[1]    Filter used for observation, eg ":math:`g`", ":math:`r`", ":math:`z`"
``exptime``          float32    Exposure time in seconds, eg 30
``mjd_obs``          float64    Date of observation in MJD (in UTC system), eg 56884.99373389
``airmass``	     float32	Airmass of observation (measured at the telescope bore-sight)
``fwhm``             float32    FWHM (in pixels) measured by the CP
``width``            int16      Width in pixels of this image, eg 2046
``height``           int16      Height in pixels of this image, eg 4096
``ra_bore``          float64    Telescope boresight RA  of this exposure (deg)
``dec_bore``         float64    Telescope boresight Dec of this exposure (deg)
``crpix1``           float32    Astrometric header value: X reference pixel
``crpix2``           float32    Astrometric header value: Y reference pixel
``crval1``           float64    Astrometric header value: RA of reference pixel
``crval2``           float64    Astrometric header value: Dec of reference pixel
``cd1_1``            float32    Astrometric header value: transformation matrix
``cd1_2``            float32    Astrometric header value: transformation matrix
``cd2_1``            float32    Astrometric header value: transformation matrix
``cd2_2``            float32    Astrometric header value: transformation matrix
``yshift``	     boolean	(ignore; it's always ``False``)
``ra``               float64    Approximate RA center of this CCD (deg)
``dec``              float64    Approximate Dec center of this CCD (deg)
``skyrms``           float32    Sky rms for the entire image (in counts)
``sig1``             float32    Median per-pixel error standard deviation, in nanomaggies
``ccdzpt``           float32    Zeropoint for the CCD (AB mag)
``zpt``              float32    Median zero point for the entire image (median of all CCDs of the image), eg 25.0927
``ccdraoff``         float32    Median astrometric offset for the CCD <GAIA-Legacy Survey> in arcsec
``ccddecoff``        float32    Median astrometric offset for the CCD <GAIA-Legacy Survey> in arcsec
``ccdskycounts``     float32    Mean sky count level per pixel in the CP-processed frames measured (with iterative rejection) for each CCD in the image section [500:1500,1500:2500]
``ccdskysb``	     float32	Sky surface brightness (in AB mag/arcsec2)
``ccdrarms``         float32    rms in astrometric offset for the CCD <Gaia-Legacy Survey> in arcsec
``ccddecrms``        float32    rms in astrometric offset for the CCD <Gaia-Legacy Survey> in arcsec
``ccdphrms``         float32    Photometric rms for the CCD (in mag)
``ccdnastrom``	     int16	Number of stars (after sigma-clipping) used to compute astrometric correction
``ccdnphotom``	     int16	Number of Gaia+PS1 stars detected with signal-to-noise ratio greater than five
``ccd_cuts``         int32      (ignore)
==================== ========== =======================================================

.. _`ordering of the CCD corners is detailed here`: ../../ccdordering

survey-ccds-<camera>-dr8.kd.fits
--------------------------------

As for the **survey-ccds-<camera>-dr8.fits.gz** files but limited by the depth of each observation. These files 
contain the CCDs actually used for the DR8 reductions. Columns are the same as for the **survey-ccds-<camera>-dr8.fits.gz** files.

ccds-annotated-<camera>-dr8.fits.gz
-----------------------------------

Versions of the **survey-ccds-<camera>-dr8.fits.gz** files with additional information
gathered during calibration pre-processing before running the Tractor reductions.

Includes all of the columns in the **survey-ccds-<camera>-dr8.fits.gz** files plus the following:

==================== ========== ======================================================
Column               Type       Description
==================== ========== ======================================================
``annotated``        boolean    (ignore)
``good_region``      int16[4]   If only a subset of the CCD images was used, this array of x0,x1,y0,y1 values gives the coordinates that were used, [x0,x1), [y0,y1).  -1 for no cut (most CCDs)
``ra0``              float64    RA  coordinate of pixel (1,1)...Note that the `ordering of the CCD corners is detailed here`_
``dec0``             float64    Dec coordinate of pixel (1,1)
``ra1``              float64    RA  coordinate of pixel (1,H)
``dec1``             float64    Dec coordinate of pixel (1,H)
``ra2``              float64    RA  coordinate of pixel (W,H)
``dec2``             float64    Dec coordinate of pixel (W,H)
``ra3``              float64    RA  coordinate of pixel (W,1)
``dec3``             float64    Dec coordinate of pixel (W,1)
``dra``              float32    Maximum distance from RA,Dec center to the edge midpoints, in RA
``ddec``             float32    Maximum distance from RA,Dec center to the edge midpoints, in Dec
``ra_center``        float64    RA coordinate of CCD center
``dec_center``       float64    Dec coordinate of CCD center
``meansky``          float32    Our pipeline (not the CP) estimate of the sky level, average over the image, in ADU.
``stdsky``           float32    Standard deviation of our sky level
``maxsky``           float32    Max of our sky level
``minsky``           float32    Min of our sky level
``pixscale_mean``    float32    Pixel scale (via sqrt of area of a 10x10 pixel patch evaluated in a 5x5 grid across the image), in arcsec/pixel.
``pixscale_std``     float32    Standard deviation of pixel scale
``pixscale_max``     float32    Max of pixel scale
``pixscale_min``     float32    Min of pixel scale
``psfnorm_mean``     float32    PSF norm = 1/sqrt of N_eff = sqrt(sum(psf_i^2)) for normalized PSF pixels i; mean of the PSF model evaluated on a 5x5 grid of points across the image.  Point-source detection standard deviation is ``sig1 / psfnorm``.
``psfnorm_std``      float32    Standard deviation of PSF norm
``galnorm_mean``     float32    Norm of the PSF model convolved by a 0.45" exponential galaxy.
``galnorm_std``      float32    Standard deviation of galaxy norm.
``psf_mx2``          float32    PSF model second moment in x (pixels^2)
``psf_my2``          float32    PSF model second moment in y (pixels^2)
``psf_mxy``          float32    PSF model second moment in x-y (pixels^2)
``psf_a``            float32    PSF model major axis (pixels)
``psf_b``            float32    PSF model minor axis (pixels)
``psf_theta``        float32    PSF position angle (deg)
``psf_ell``          float32    PSF ellipticity 1 - minor/major
``humidity``         float32    Percent humidity outside
``outtemp``          float32    Outside temperate (deg C).
``tileid``           int32      tile number, 0 for data from programs other than `MzLS`_ or `DECaLS`_
``tilepass``         uint8      tile pass number, 1, 2 or 3, if this was an `MzLS`_ or `DECaLS`_ observation, or 0 for data from other programs. Set by the observers (the meaning of ``tilepass`` is on the `status page`_)
``tileebv``          float32    Mean `SFD98`_ E(B-V) extinction in the tile, 0 for data from programs other than `BASS`_, `MzLS`_ or `DECaLS`_
``ebv``              float32    `SFD98`_ E(B-V) extinction for CCD center
``decam_extinction`` float32[6] Extinction for optical filters :math:`ugrizY`
``wise_extinction``  float32[4] Extinction for WISE bands W1,W2,W3,W4
``psfdepth``         float32    5-sigma PSF detection depth in AB mag, using PsfEx PSF model
``galdepth``         float32    5-sigma galaxy (0.45" round exp) detection depth in AB mag
``gausspsfdepth``    float32    5-sigma PSF detection depth in AB mag, using Gaussian PSF approximation (using ``seeing`` value)
``gaussgaldepth``    float32    5-sigma galaxy detection depth in AB mag, using Gaussian PSF approximation
==================== ========== ======================================================

.. _`status page`: ../../status
.. _`issues page`: ../issues
.. _`DECaLS`: ../../decamls

dr8-depth.fits.gz
-----------------

XXX doesn't exist for DR8 yet.

A concatenation of the depth histograms for each brick, from the
``coadd/*/*/*-depth.fits`` tables.  HDU1 contains histograms that describe the
number of pixels in each brick with a 5-sigma AB depth in the given magnitude
bin. HDU2 contains the bin edges of the histograms.

- HDU1

==================== =========  ======================================================
Column               Type       Description
==================== =========  ======================================================
``counts_ptsrc_g``   int32[50]  Histogram of pixels for point source depth in :math:`g` band
``counts_gal_g``     int32[50]  Histogram of pixels for canonical galaxy depth in :math:`g` band
``counts_ptsrc_r``   int32[50]  Histogram of pixels for point source depth in :math:`r` band
``counts_gal_r``     int32[50]  Histogram of pixels for canonical galaxy depth in :math:`r` band
``counts_ptsrc_z``   int32[50]  Histogram of pixels for point source depth in :math:`z` band
``counts_gal_z``     int32[50]  Histogram of pixels for canonical galaxy depth in :math:`z` band
``brickname``        char[8]    Name of the brick
==================== =========  ======================================================

- HDU2

==================== =========  ============================================================
Column               Type       Description
==================== =========  ============================================================
``depthlo``          float32    Lower bin edge for each histogram in HDU1 (5-sigma AB depth)
``depthhi``          float32    Upper bin edge for each histogram in HDU1 (5-sigma AB depth)
==================== =========  ============================================================

dr8-depth-summary.fits.gz
-------------------------

XXX doesn't exist for DR8 yet.

A summary of the depth histogram of the whole DR8 survey.  FITS table with the following columns:

==================== ======== ======================================================
Column               Type      Description
==================== ======== ======================================================
``depthlo``          float32  Lower limit of the depth bin
``depthhi``          float32  Upper limit of the depth bin
``counts_ptsrc_g``   int64    Number of pixels in histogram for point source depth in :math:`g` band
``counts_gal_g``     int64    Number of pixels in histogram for canonical galaxy depth in :math:`g` band
``counts_ptsrc_r``   int64    Number of pixels in histogram for point source depth in :math:`r` band
``counts_gal_r``     int64    Number of pixels in histogram for canonical galaxy depth in :math:`r` band
``counts_ptsrc_z``   int64    Number of pixels in histogram for point source depth in :math:`z` band
``counts_gal_z``     int64    Number of pixels in histogram for canonical galaxy depth in :math:`z` band
==================== ======== ======================================================

The depth histogram runs from magnitude of 20.1 to 24.9 in steps of
0.1 mag.  The first and last bins are "catch-all" bins: 0 to 20.1 and
24.9 to 100, respectively.  The histograms count the number of pixels
in each brick's unique area with the given depth.  These numbers can
be turned into values in square degrees using the brick pixel area of
0.262 arcseconds square.  These depth estimates take into account the
small-scale masking (cosmic rays, edges, saturated pixels) and
detailed PSF model.

randoms/randoms-dr8-0.29.1-\*.fits
------------------------------------
XXX check version is 0.29.1 (used below, too).

Files of random points sampled across the CCDs that comprise the geometry of DR8. Random locations
were generated in the survey footprint at a density of 100,000 per square degree and meta-information 
about the survey was extracted from pixels at each random location from files in the **coadd** directory (see below, e.g.
``coadd/*/*/*-depth-<filter>.fits.gz``, ``coadd/*/*/*-galdepth-<filter>.fits.gz``, 
``coadd/*/*/*-nexp-<filter>.fits.gz``, ``coadd/*/*/*-maskbits.fits.gz``). Contains the following columns:

==================== ======== ======================================================
Column               Type     Description
==================== ======== ======================================================
``RA``               float64  Right ascension at equinox J2000
``DEC``              float64  Declination at equinox J2000
``BRICKNAME``        char[8]  Name of the brick
``NOBS_G``           int16    Number of images that contribute to the central pixel in the :math:`g` filter for this location (not profile-weighted)
``NOBS_R``           int16    Number of images that contribute to the central pixel in the :math:`r` filter for this location (not profile-weighted)   
``NOBS_Z``           int16    Number of images that contribute to the central pixel in the :math:`z` filter for this location (not profile-weighted)
``PSFDEPTH_G``       float32  For a :math:`5\sigma` point source detection limit in :math:`g`, :math:`5/\sqrt(\mathrm{PSFDEPTH\_G})` gives flux in nanomaggies and :math:`-2.5[\log_{10}(5 / \sqrt(\mathrm{PSFDEPTH\_G})) - 9]` gives corresponding magnitude
``PSFDEPTH_R``       float32  For a :math:`5\sigma` point source detection limit in :math:`g`, :math:`5/\sqrt(\mathrm{PSFDEPTH\_R})` gives flux in nanomaggies and :math:`-2.5[\log_{10}(5 / \sqrt(\mathrm{PSFDEPTH\_R})) - 9]` gives corresponding magnitude
``PSFDEPTH_Z``       float32  For a :math:`5\sigma` point source detection limit in :math:`g`, :math:`5/\sqrt(\mathrm{PSFDEPTH\_Z})` gives flux in nanomaggies and :math:`-2.5[\log_{10}(5 / \sqrt(\mathrm{PSFDEPTH\_Z})) - 9]` gives corresponding magnitude
``GALDEPTH_G``       float32  As for ``PSFDEPTH_G`` but for a galaxy (0.45" exp, round) detection sensitivity
``GALDEPTH_R``       float32  As for ``PSFDEPTH_R`` but for a galaxy (0.45" exp, round) detection sensitivity
``GALDEPTH_Z``       float32  As for ``PSFDEPTH_Z`` but for a galaxy (0.45" exp, round) detection sensitivity
``PSFSIZE_G``	     float32  Weighted average PSF FWHM in arcsec in the :math:`g` band
``PSFSIZE_R``	     float32  Weighted average PSF FWHM in arcsec in the :math:`r` band
``PSFSIZE_Z``	     float32  Weighted average PSF FWHM in arcsec in the :math:`z` band
``APFLUX_G``	     float32  Total flux in nanomaggies extracted in a 0.75 arcsec radius in the :math:`g` band at this location
``APFLUX_R``	     float32  Total flux in nanomaggies extracted in a 0.75 arcsec radius in the :math:`r` band at this location
``APFLUX_Z``	     float32  Total flux in nanomaggies extracted in a 0.75 arcsec radius in the :math:`z` band at this location
``APFLUX_IVAR_G``    float32  Inverse variance of ``APFLUX_G``
``APFLUX_IVAR_R``    float32  Inverse variance of ``APFLUX_R``
``APFLUX_IVAR_Z``    float32  Inverse variance of ``APFLUX_Z``
``MASKBITS``         int16    Bitwise mask indicating that an object touches a pixel in the ``coadd/*/*/*maskbits*`` maps (see the `DR8 bitmasks page`_)
``EBV``              float32  Galactic extinction E(B-V) reddening from `SFD98`_
``PHOTSYS``	     char[1]  'N' for an `MzLS`_/`BASS`_ location, 'S' for a `DECaLS`_ location
``HPXPIXEL``         int64    `HEALPixel`_ containing this location at NSIDE=64 in the NESTED scheme
==================== ======== ======================================================

.. _`HEALPixel`: https://healpy.readthedocs.io/en/latest/
.. _`code is available on GitHub`: https://github.com/desihub/desitarget/blob/master/bin/select_randoms
.. _`desitarget`: https://github.com/desihub/desitarget/
.. _`here`: https://github.com/desihub/desitarget/blob/master/py/desitarget/randoms.py

The **0.29.1** in the file names refers to the version of the `desitarget`_ code used to generate the random catalogs. The `code is available on GitHub`_ (see also `here`_).
The randoms are resolved at a Declination of 32.375\ |deg| and by the Galactic plane, such that locations at Dec > 32.375\ |deg| that are north of the Galactic Plane have
``PHOTSYS`` set to "N".

External Files
==============

XXX check that we add "dr8" to the name of the external match files.

| **The Legacy Survey photometric catalogs have been matched to the following external spectroscopic files from the SDSS, which can be accessed through the web at:**
| http://portal.nersc.gov/project/cosmo/data/legacysurvey/dr8/decam/external/
| http://portal.nersc.gov/project/cosmo/data/legacysurvey/dr8/90prime-mosaic/external/

| **Or on the NERSC computers (for collaborators) at:**
| /global/project/projectdirs/cosmo/data/legacysurvey/dr8/decam/external/
| /global/project/projectdirs/cosmo/data/legacysurvey/dr8/90prime-mosaic/external/

Each row of each external-match file contains the full record of the nearest object in our Tractored survey
imaging catalogs, matched at a radius of 1.5 arcsec. The structure of the imaging catalog files 
is documented on the `catalogs page`_. If no match is found, then ``OBJID`` is set to -1.

In addition to the columns from the `Tractor catalogs`_, we have added columns from the SDSS files that can be used to track objects uniquely. These are typically some combination of ``PLATE``, ``FIBER``, ``MJD`` (or ``SMJD``) and, in some cases, ``RERUN``.

.. _`catalogs page`: ../catalogs
.. _`Tractor catalogs`: ../catalogs

survey-dr8-specObj-dr14.fits
----------------------------
HDU1 (the only HDU) contains Tractored survey
photometry that is row-by-row-matched to the SDSS DR14 spectrosopic
pipeline file such that the photometric parameters in row "N" of 
**survey-dr8-specObj-dr14.fits** matches the spectroscopic parameters in row "N" of
specObj-dr14.fits. The spectroscopic file 
is documented in the SDSS DR14 `data model for specObj-dr14.fits`_.

.. _`data model for specObj-dr14.fits`: http://data.sdss3.org/datamodel/files/SPECTRO_REDUX/specObj.html

survey-dr8-dr12Q.fits
---------------------
HDU1 (the only HDU) contains Tractored survey
photometry that is row-by-row-matched to the SDSS DR12 
visually inspected quasar catalog (`Paris et al. 2017`_)
such that the photometric parameters in row "N" of 
**survey-dr8-dr12Q.fits** matches the spectroscopic parameters in row "N" of
DR12Q.fits. The spectroscopic file 
is documented in the SDSS DR12 `data model for DR12Q.fits`_.

.. _`Paris et al. 2017`: https://ui.adsabs.harvard.edu/abs/2017A%26A...597A..79P
.. _`data model for DR12Q.fits`: http://data.sdss3.org/datamodel/files/BOSS_QSO/DR12Q/DR12Q.html

survey-dr8-dr14Q_v4_4.fits
--------------------------
HDU1 (the only HDU) contains Tractored survey
photometry that is row-by-row-matched to the SDSS DR14 
visually inspected quasar catalog (`Paris et al. 2018`_)
such that the photometric parameters in row "N" of 
**survey-dr8-dr14Q_v4_4.fits** matches the spectroscopic parameters in row "N" of
DR14Q_v4_4.fits. The spectroscopic file 
is documented in the SDSS DR14 `data model for DR14Q_v4_4.fits`_.

.. _`Paris et al. 2018`: https://ui.adsabs.harvard.edu/abs/2018A%26A...613A..51P
.. _`data model for DR14Q_v4_4.fits`: https://data.sdss.org/datamodel/files/BOSS_QSO/DR14Q/DR14Q_v4_4.html

survey-dr8-superset-dr12Q.fits
------------------------------
HDU1 (the only HDU) contains Tractored survey
photometry that is row-by-row-matched to the superset of all SDSS DR12 spectroscopically
confirmed objects that were visually inspected as possible quasars 
(`Paris et al. 2017`_) such that the photometric parameters in row "N" of 
**survey-dr8-Superset_dr12Q.fits** matches the spectroscopic parameters in row "N" of
Superset_DR12Q.fits. The spectroscopic file
is documented in the SDSS DR12 `data model for Superset_DR12Q.fits`_.

.. _`data model for Superset_DR12Q.fits`: http://data.sdss3.org/datamodel/files/BOSS_QSO/DR12Q/DR12Q_superset.html

survey-dr8-dr7Q.fits
---------------------
HDU1 (the only HDU) contains Tractored survey
photometry that is row-by-row-matched to the SDSS DR7
visually inspected quasar catalog (`Schneider et al. 2010`_)
such that the photometric parameters in row "N" of
**survey-dr8-dr7Q.fits** matches the spectroscopic parameters in row "N" of
DR7qso.fit. The spectroscopic file
is documented on the `DR7 quasar catalog description page`_.

.. _`Schneider et al. 2010`: https://ui.adsabs.harvard.edu/abs/2010AJ....139.2360S
.. _`DR7 quasar catalog description page`: http://classic.sdss.org/dr7/products/value_added/qsocat_dr7.html


Tractor Catalogs
================

In the file listings outlined below:

- brick names (**<brick>**) have the format `<AAAa>c<BBB>` where `A`, `a` and `B` are digits and `c` is either the letter `m` or `p` (e.g. `1126p222`). The names are derived from the RA,Dec center of the brick. The first four digits are :math:`int(\mathrm{RA} \times 10)`, followed by `p` to denote positive Dec or `m` to denote negative Dec ("plus"/"minus"), followed by three digits of :math:`int(\mathrm{Dec} \times 10)`. For example the case `1126p222` corresponds to RA,Dec = (112.6\ |deg|, +22.2\ |deg|). 

- **<brickmin>** and **<brickmax>** denote the corners of a rectangle in RA,Dec using the format outlined in the previous bullet point. For example `000m010-010m005` would correspond to a survey region limited by :math:`0^\circ \leq \mathrm{RA} < 10^\circ` and :math:`-10^\circ \leq \mathrm{Dec} < -5^\circ`.

- sub-directories are listed by the RA of the brick center, and sub-directory names (**<AAA>**) correspond to RA. For example `002` corresponds to brick centers between an RA of 2\ |deg| and an RA of 3\ |deg|.

- **<filter>** denotes the :math:`g`, :math:`r` or :math:`z` band, using the corresponding letter.

Note that it is not possible to go from a brick name back to an *exact* RA,Dec center (the bricks are not on 0.1\ |deg| grid 
lines). The exact brick center for a given brick name can be derived from columns in the 
**survey-bricks.fits.gz** file (i.e. ``brickname``, ``ra``, ``dec``).

tractor/<AAA>/tractor-<brick>.fits
----------------------------------

FITS binary table containing Tractor photometry, documented on the
`catalogs page`_. 

.. _`catalogs page`: ../catalogs

Users interested in database access to the Tractor Catalogs can contact the NOAO Data Lab at datalab@noao.edu.


Sweep Catalogs
==============

XXX check final directory structure. Is it going to retain the 8.0?

sweep/8.0/sweep-<brickmin>-<brickmax>.fits
------------------------------------------

The sweeps are light-weight FITS binary tables (containing a subset of the most commonly used
Tractor measurements) of all the `Tractor catalogs`_ for which ``BRICK_PRIMARY==T`` in rectangles of RA, Dec.

.. _`RELEASE is documented here`: ../../release
.. _`SFD98`: https://ui.adsabs.harvard.edu/abs/1998ApJ...500..525S

===================================== ============ ===================== ===============================================
Name                                  Type         Units                 Description
===================================== ============ ===================== ===============================================
``RELEASE``                           int16                              Unique integer denoting the camera and filter set used (`RELEASE is documented here`_)
``BRICKID``                           int32                              Brick ID [1,662174]
``BRICKNAME``                         char[8]                            Name of brick, encoding the brick sky position, eg "1126p222" near RA=112.6, Dec=+22.2
``OBJID``                             int32                              Catalog object number within this brick; a unique identifier hash is BRICKID,OBJID;  OBJID spans [0,N-1] and is contiguously enumerated within each blob
``TYPE``                              char[4]                            Morphological model: "PSF"=stellar, "REX"="round exponential galaxy" = round EXP galaxy with a variable radius, "EXP"=exponential, "DEV"=deVauc, "COMP"=composite, "DUP"==Gaia source fit by different model.  Note that in some FITS readers, a trailing space may be appended for "PSF ", "EXP " and "DEV " since the column data type is a 4-character string
``RA``                                float64      deg                   Right ascension at equinox J2000
``DEC``                               float64      deg                   Declination at equinox J2000
``RA_IVAR``                           float32      1/deg\ |sup2|         Inverse variance of ``RA`` (no cosine term!), excluding astrometric calibration errors
``DEC_IVAR``                          float32      1/deg\ |sup2|         Inverse variance of ``DEC``, excluding astrometric calibration errors
``DCHISQ``                            float32[5]                         Difference in |chi|\ |sup2| between successively more-complex model fits: PSF, REX, EXP, DEV, COMP.  The difference is versus no source.
``EBV``                               float32      mag                   Galactic extinction E(B-V) reddening from `SFD98`_, used to compute ``MW_TRANSMISSION``
``FLUX_G``                            float32      nanomaggies           model flux in :math:`g`
``FLUX_R``                            float32      nanomaggies           model flux in :math:`r`
``FLUX_Z``                            float32      nanomaggies           model flux in :math:`z`
``FLUX_W1``                           float32      nanomaggies           WISE model flux in :math:`W1`
``FLUX_W2``                           float32      nanomaggies           WISE model flux in :math:`W2`
``FLUX_W3``                           float32      nanomaggies           WISE model flux in :math:`W3`
``FLUX_W4``                           float32      nanomaggies           WISE model flux in :math:`W4`
``FLUX_IVAR_G``                       float32      1/nanomaggies\ |sup2| Inverse variance of ``FLUX_G``
``FLUX_IVAR_R``                       float32      1/nanomaggies\ |sup2| Inverse variance of ``FLUX_R``
``FLUX_IVAR_Z``                       float32      1/nanomaggies\ |sup2| Inverse variance of ``FLUX_Z``
``FLUX_IVAR_W1``                      float32      1/nanomaggies\ |sup2| Inverse variance of ``FLUX_W1``
``FLUX_IVAR_W2``                      float32      1/nanomaggies\ |sup2| Inverse variance of ``FLUX_W2``
``FLUX_IVAR_W3``                      float32      1/nanomaggies\ |sup2| Inverse variance of ``FLUX_W3``
``FLUX_IVAR_W4``                      float32      1/nanomaggies\ |sup2| Inverse variance of ``FLUX_W4``
``MW_TRANSMISSION_G``                 float32                            Galactic transmission in :math:`g` filter in linear units [0,1]
``MW_TRANSMISSION_R``                 float32                            Galactic transmission in :math:`r` filter in linear units [0,1]
``MW_TRANSMISSION_Z``                 float32                            Galactic transmission in :math:`z` filter in linear units [0,1]
``MW_TRANSMISSION_W1``                float32                            Galactic transmission in :math:`W1` filter in linear units [0,1]
``MW_TRANSMISSION_W2``                float32                            Galactic transmission in :math:`W2` filter in linear units [0,1]
``MW_TRANSMISSION_W3``                float32                            Galactic transmission in :math:`W3` filter in linear units [0,1]
``MW_TRANSMISSION_W4``                float32                            Galactic transmission in :math:`W4` filter in linear units [0,1]
``NOBS_G``                            int16                              Number of images that contribute to the central pixel in :math:`g`: filter for this object (not profile-weighted)
``NOBS_R``                            int16                              Number of images that contribute to the central pixel in :math:`r`: filter for this object (not profile-weighted)
``NOBS_Z``                            int16                              Number of images that contribute to the central pixel in :math:`z`: filter for this object (not profile-weighted)
``NOBS_W1``                           int16                              Number of images that contribute to the central pixel in :math:`W1`: filter for this object (not profile-weighted)
``NOBS_W2``                           int16                              Number of images that contribute to the central pixel in :math:`W2`: filter for this object (not profile-weighted)
``NOBS_W3``                           int16                              Number of images that contribute to the central pixel in :math:`W3`: filter for this object (not profile-weighted)
``NOBS_W4``                           int16                              Number of images that contribute to the central pixel in :math:`W4`: filter for this object (not profile-weighted)
``RCHISQ_G``                          float32                            Profile-weighted |chi|\ |sup2| of model fit normalized by the number of pixels in :math:`g`
``RCHISQ_R``                          float32                            Profile-weighted |chi|\ |sup2| of model fit normalized by the number of pixels in :math:`r`
``RCHISQ_Z``                          float32                            Profile-weighted |chi|\ |sup2| of model fit normalized by the number of pixels in :math:`z`
``RCHISQ_W1``                         float32                            Profile-weighted |chi|\ |sup2| of model fit normalized by the number of pixels in :math:`W1`
``RCHISQ_W2``                         float32                            Profile-weighted |chi|\ |sup2| of model fit normalized by the number of pixels in :math:`W2`
``RCHISQ_W3``                         float32                            Profile-weighted |chi|\ |sup2| of model fit normalized by the number of pixels in :math:`W3`
``RCHISQ_W4``                         float32                            Profile-weighted |chi|\ |sup2| of model fit normalized by the number of pixels in :math:`W4`
``FRACFLUX_G``                        float32                            Profile-weighted fraction of the flux from other sources divided by the total flux in :math:`g` (typically [0,1])
``FRACFLUX_R``                        float32                            Profile-weighted fraction of the flux from other sources divided by the total flux in :math:`r` (typically [0,1])
``FRACFLUX_Z``                        float32                            Profile-weighted fraction of the flux from other sources divided by the total flux in :math:`z` (typically [0,1])
``FRACFLUX_W1``                       float32                            Profile-weighted fraction of the flux from other sources divided by the total flux in :math:`W1` (typically [0,1])
``FRACFLUX_W2``                       float32                            Profile-weighted fraction of the flux from other sources divided by the total flux in :math:`W2` (typically [0,1])
``FRACFLUX_W3``                       float32                            Profile-weighted fraction of the flux from other sources divided by the total flux in :math:`W3` (typically [0,1])
``FRACFLUX_W4``                       float32                            Profile-weighted fraction of the flux from other sources divided by the total flux in :math:`W4` (typically [0,1])
``FRACMASKED_G``                      float32                            Profile-weighted fraction of pixels masked from all observations of this object in :math:`g`, strictly between [0,1]
``FRACMASKED_R``                      float32                            Profile-weighted fraction of pixels masked from all observations of this object in :math:`r`, strictly between [0,1]
``FRACMASKED_Z``                      float32                            Profile-weighted fraction of pixels masked from all observations of this object in :math:`z`, strictly between [0,1]
``FRACIN_G``                          float32                            Fraction of a source's flux within the blob in :math:`g`, near unity for real sources
``FRACIN_R``                          float32                            Fraction of a source's flux within the blob in :math:`r`, near unity for real sources
``FRACIN_Z``                          float32                            Fraction of a source's flux within the blob in :math:`z`, near unity for real sources
``ANYMASK_G``                         int16                              Bitwise mask set if the central pixel from any image satisfies each condition in :math:`g` (see the `DR8 bitmasks page`_)
``ANYMASK_R``                         int16                              Bitwise mask set if the central pixel from any image satisfies each condition in :math:`r` (see the `DR8 bitmasks page`_)
``ANYMASK_Z``                         int16                              Bitwise mask set if the central pixel from any image satisfies each condition in :math:`z` (see the `DR8 bitmasks page`_)
``ALLMASK_G``                         int16                              Bitwise mask set if the central pixel from all images satisfy each condition in :math:`g` (see the `DR8 bitmasks page`_)
``ALLMASK_R``                         int16                              Bitwise mask set if the central pixel from all images satisfy each condition in :math:`r` (see the `DR8 bitmasks page`_)
``ALLMASK_Z``                         int16                              Bitwise mask set if the central pixel from all images satisfy each condition in :math:`z` (see the `DR8 bitmasks page`_)
``WISEMASK_W1``                       uint8                              W1 bitmask as cataloged on the `DR8 bitmasks page`_
``WISEMASK_W2``                       uint8                              W2 bitmask as cataloged on the `DR8 bitmasks page`_
``PSFSIZE_G``                         float32      arcsec                Weighted average PSF FWHM in the :math:`g` band
``PSFSIZE_R``                         float32      arcsec                Weighted average PSF FWHM in the :math:`r` band
``PSFSIZE_Z``                         float32      arcsec                Weighted average PSF FWHM in the :math:`z` band
``PSFDEPTH_G``                        float32      1/nanomaggies\ |sup2| For a :math:`5\sigma` point source detection limit in :math:`g`, :math:`5/\sqrt(\mathrm{PSFDEPTH\_G})` gives flux in nanomaggies and :math:`-2.5[\log_{10}(5 / \sqrt(\mathrm{PSFDEPTH\_G})) - 9]` gives corresponding magnitude
``PSFDEPTH_R``                        float32      1/nanomaggies\ |sup2| For a :math:`5\sigma` point source detection limit in :math:`g`, :math:`5/\sqrt(\mathrm{PSFDEPTH\_R})` gives flux in nanomaggies and :math:`-2.5[\log_{10}(5 / \sqrt(\mathrm{PSFDEPTH\_R})) - 9]` gives corresponding magnitude
``PSFDEPTH_Z``                        float32      1/nanomaggies\ |sup2| For a :math:`5\sigma` point source detection limit in :math:`g`, :math:`5/\sqrt(\mathrm{PSFDEPTH\_Z})` gives flux in nanomaggies and :math:`-2.5[\log_{10}(5 / \sqrt(\mathrm{PSFDEPTH\_Z})) - 9]` gives corresponding magnitude
``GALDEPTH_G``                        float32      1/nanomaggies\ |sup2| As for ``PSFDEPTH_G`` but for a galaxy (0.45" exp, round) detection sensitivity
``GALDEPTH_R``                        float32      1/nanomaggies\ |sup2| As for ``PSFDEPTH_R`` but for a galaxy (0.45" exp, round) detection sensitivity
``GALDEPTH_Z``                        float32      1/nanomaggies\ |sup2| As for ``PSFDEPTH_Z`` but for a galaxy (0.45" exp, round) detection sensitivity
``WISE_COADD_ID``                     char[8]                            unWISE coadd file name for the center of each object
``FRACDEV``                           float32                            Fraction of model in deVauc [0,1]
``FRACDEV_IVAR``                      float32                            Inverse variance of ``FRACDEV``
``SHAPEDEV_R``                        float32      arcsec                Half-light radius of deVaucouleurs model (>0)
``SHAPEDEV_R_IVAR``                   float32      1/arcsec              Inverse variance of ``SHAPEDEV_R``
``SHAPEDEV_E1``                       float32                            Ellipticity component 1
``SHAPEDEV_E1_IVAR``                  float32                            Inverse variance of ``SHAPEDEV_E1``
``SHAPEDEV_E2``                       float32                            Ellipticity component 2
``SHAPEDEV_E2_IVAR``                  float32                            Inverse variance of ``SHAPEDEV_E2``
``SHAPEEXP_R``                        float32      arcsec                Half-light radius of exponential model (>0)
``SHAPEEXP_R_IVAR``                   float32      1/arcsec2             Inverse variance of ``SHAPEEXP_R``
``SHAPEEXP_E1``                       float32                            Ellipticity component 1
``SHAPEEXP_E1_IVAR``                  float32                            Inverse variance of ``SHAPEEXP_E1``
``SHAPEEXP_E2``                       float32                            Ellipticity component 2
``SHAPEEXP_E2_IVAR``                  float32                            Inverse variance of ``SHAPEEXP_E2``
``FIBERFLUX_G``                       float32      nanomaggies           Predicted :math:`g`-band flux within a fiber from this object in 1 arcsec Gaussian seeing
``FIBERFLUX_R``                       float32      nanomaggies		 Predicted :math:`r`-band flux within a fiber from this object in 1 arcsec Gaussian seeing
``FIBERFLUX_Z``                       float32      nanomaggies           Predicted :math:`z`-band flux within a fiber from this object in 1 arcsec Gaussian seeing
``FIBERTOTFLUX_G``                    float32      nanomaggies           Predicted :math:`g`-band flux within a fiber from all sources at this location in 1 arcsec Gaussian seeing
``FIBERTOTFLUX_R``                    float32      nanomaggies           Predicted :math:`r`-band flux within a fiber from all sources at this location in 1 arcsec Gaussian seeing
``FIBERTOTFLUX_Z``                    float32      nanomaggies           Predicted :math:`z`-band flux within a fiber from all sources at this location in 1 arcsec Gaussian seeing
``REF_CAT``                           char[2]                            Reference catalog source for this star: "T2" for `Tycho-2`_, "G2" for `Gaia`_ DR2, "L2" for the `LSLGA`_, empty otherwise
``REF_ID``                            int64                              Reference catalog identifier for this star; Tyc1*1,000,000+Tyc2*10+Tyc3 for Tycho2; "sourceid" for Gaia-DR2 and `LSLGA`_
``REF_EPOCH``                         float32      yr                    Reference catalog reference epoch (eg, 2015.5 for `Gaia`_ DR2)
``GAIA_PHOT_G_MEAN_MAG``              float32      mag                   `Gaia`_ G band magnitude
``GAIA_PHOT_G_MEAN_FLUX_OVER_ERROR``  float32                            `Gaia`_ G band signal-to-noise
``GAIA_PHOT_BP_MEAN_MAG``             float32      mag                   `Gaia`_ BP magnitude
``GAIA_PHOT_BP_MEAN_FLUX_OVER_ERROR`` float32                            `Gaia`_ BP signal-to-noise
``GAIA_PHOT_RP_MEAN_MAG``             float32      mag                   `Gaia`_ RP magnitude
``GAIA_PHOT_RP_MEAN_FLUX_OVER_ERROR`` float32                            `Gaia`_ RP signal-to-noise
``GAIA_ASTROMETRIC_EXCESS_NOISE``     float32                            `Gaia`_ astrometric excess noise
``GAIA_DUPLICATED_SOURCE``            boolean                            `Gaia`_ duplicated source flag (1/0 for True/False)
``GAIA_PHOT_BP_RP_EXCESS_FACTOR``     float32                            `Gaia`_ BP/RP excess factor
``GAIA_ASTROMETRIC_SIGMA5D_MAX``      float32      mas                   `Gaia`_ longest semi-major axis of the 5-d error ellipsoid
``GAIA_ASTROMETRIC_PARAMS_SOLVED``    uint8                              Which astrometric parameters were estimated for a `Gaia`_ source
``PARALLAX``                          float32      mas                   Reference catalog parallax
``PARALLAX_IVAR``                     float32      1/(mas)\ |sup2|       Reference catalog inverse-variance on ``parallax``
``PMRA``                              float32      mas/yr                Reference catalog proper motion in the RA direction
``PMRA_IVAR``                         float32      1/(mas/yr)\ |sup2|    Reference catalog inverse-variance on ``pmra``
``PMDEC``                             float32      mas/yr                Reference catalog proper motion in the Dec direction
``PMDEC_IVAR``                        float32      1/(mas/yr)\ |sup2|    Reference catalog inverse-variance on ``pmdec``
``MASKBITS``           		      int16    	   	       		 Bitwise mask indicating that an object touches a pixel in the ``coadd/*/*/*maskbits*`` maps (see the `DR8 bitmasks page`_)
===================================== ============ ===================== ===============================================

.. _`Gaia`: https://gea.esac.esa.int/archive/documentation//GDR2/Gaia_archive/chap_datamodel/sec_dm_main_tables/ssec_dm_gaia_source.html
.. _`Tycho-2`: https://heasarc.nasa.gov/W3Browse/all/tycho2.html
.. _`LSLGA`: ../external

Image Stacks (``coadd/*``)
==========================

Image stacks are on tangent-plane (WCS TAN) projections, 3600 |times|
3600 pixels, at 0.262 arcseconds per pixel.

- coadd/<AAA>/<brick>/legacysurvey-<brick>-ccds.fits
    FITS binary table with the list of CCD images that were used in this brick.
    Contains the same columns as **survey-ccds-<camera>-dr8.fits.gz**, and also contains
    the additional columns (XXX char columns are different for decam vs. 90prime-mosaic...see https://github.com/legacysurvey/legacypipe/issues/379):

    ================ ========= ======================================================
    Column           Type      Description
    ================ ========= ======================================================
    ``ccd_x0``       int16     Minimum x image coordinate overlapping this brick
    ``ccd_y0``       int16     Minimum y image coordinate overlapping this brick
    ``ccd_x1``       int16     Maximum x image coordinate overlapping this brick
    ``ccd_y1``       int16     Maximum y image coordinate overlapping this brick
    ``brick_x0``     int16     Minimum x brick image coordinate overlapped by this image
    ``brick_x1``     int16     Maximum x brick image coordinate overlapped by this image
    ``brick_y0``     int16     Minimum y brick image coordinate overlapped by this image
    ``brick_y1``     int16     Maximum y brick image coordinate overlapped by this image
    ``psfnorm``      float32   Same as ``psfnorm`` in the *ccds-annotated-* file
    ``galnorm``      float32   Same as ``galnorm`` in the *ccds-annotated-* file
    ``skyver``       char[8]   Git version of the sky calibration code
    ``wcsver``       char[1]   Git version of the WCS calibration code
    ``psfver``       char[7]   Git version of the PSF calibration code
    ``skyplver``     char[8]   Community Pipeline (CP) version of the input to sky calibration
    ``wcsplver``     char[5]   CP version of the input to WCS calibration
    ``psfplver``     char[8]   CP version of the input to PSF calibration
    ================ ========= ======================================================

- coadd/<AAA>/<brick>/legacysurvey-<brick>-chi2-<filter>.fits.fz
    Stacked |chi|\ |sup2| image, which is approximately the summed |chi|\ |sup2| values from the single-epoch images.

- coadd/<AAA>/<brick>/legacysurvey-<brick>-depth-<filter>.fits.fz
    Stacked depth map in units of the point-source flux inverse-variance at each pixel.

    - The 5\ |sigma| point-source depth can be computed as :math:`5 / \sqrt(\mathrm{depth\_ivar})` .

- coadd/<AAA>/<brick>/legacysurvey-<brick>-galdepth-<filter>.fits.fz
    Stacked depth map in units of the canonical galaxy flux inverse-variance at each pixel.
    The canonical galaxy is an exponential profile with effective radius 0.45" and round shape.

    - The 5\ |sigma| galaxy depth can be computed as :math:`5 / \sqrt(\mathrm{galdepth\_ivar})` .

- coadd/<AAA>/<brick>/legacysurvey-<brick>-image-<filter>.fits.fz
    Stacked image centered on a brick location covering 0.25\ |deg| |times| 0.25\
    |deg|.  The primary HDU contains the coadded image (inverse-variance weighted coadd), in
    units of nanomaggies per pixel.

    - NOTE: These are not the images used by Tractor, which operates on the
      single-epoch images.

    - NOTE: that these images are resampled using Lanczos-3 resampling.

- coadd/<AAA>/<brick>/legacysurvey-<brick>-invvar-<filter>.fits.fz
    Corresponding stacked inverse variance image based on the sum of the
    inverse-variances of the individual input images in units of 1/(nanomaggies)\
    |sup2| per pixel.

    - NOTE: These are not the inverse variance maps used by Tractor, which operates
      on the single-epoch images.

- coadd/<AAA>/<brick>/legacysurvey-<brick>-maskbits.fits.fz
    Bitmask of possible problems with pixels in this brick.

    - HDU1: The optical bitmasks, corresponding to ``MASKBITS`` on the `DR8 bitmasks page`_.
    - HDU2: The WISE W1 bitmasks, corresponding to ``WISEMASK_W1`` on the `DR8 bitmasks page`_.
    - HDU3: The WISE W2 bitmasks, corresponding to ``WISEMASK_W2`` on the `DR8 bitmasks page`_.

- coadd/<AAA>/<brick>/legacysurvey-<brick>-model-<filter>.fits.fz
    Stacked model image centered on a brick location covering 0.25\ |deg| |times| 0.25\ |deg|.

    - The Tractor's idea of what the coadded images should look like; the Tractor's model prediction.

- coadd/<AAA>/<brick>/legacysurvey-<brick>-nexp-<filter>.fits.fz
    Number of exposures contributing to each pixel of the stacked images.

- coadd/<AAA>/<brick>/legacysurvey-<brick>-psfsize-<filter>.fits.fz
    Number of exposures contributing to each pixel of the stacked images.

- coadd/<AAA>/<brick>/legacysurvey-<brick>-image.jpg
    JPEG image of the calibrated image using the :math:`g,r,z` filters as the colors.

- coadd/<AAA>/<brick>/legacysurvey-<brick>-model.jpg
    JPEG image of the Tractor's model image using the :math:`g,r,z` filters as the colors.

- coadd/<AAA>/<brick>/legacysurvey-<brick>-resid.jpg
    JPEG image of the residual image (data minus model) using the :math:`g,r,z` filters as
    the colors.

- coadd/<AAA>/<brick>/legacysurvey-<brick>-wise.jpg
    JPEG image of the calibrated image using the WISE filters as the colors.

- coadd/<AAA>/<brick>/legacysurvey-<brick>-wisemodel.jpg
    JPEG image of the model image using the WISE filters as the colors.

Other files
===========

Much additional information is available as part of the `DESI`_ Legacy Imaging Surveys Data Releases, including, in separate directories, 
statistics of the Tractor fits (**metrics**), code outputs from the fitting processes (**logs**) and files detailing the calibrations (**calib**).
We don't expect that most users will need a description of these files, but `contact`_ us if you require more information. 

.. _`contact`: ../../contact
.. _`DESI`: http://desi.lbl.gov

Raw Data
========
XXX still applies?
NOAO access to raw and calibrated images will be available a few weeks after the DR8 release date.

Raw and Calibrated Legacy Survey images are available from the NOAO Science Archive through the web 
portal (http://archive.noao.edu/search/query) and an ftp server. 
The input data used to create the 
stacked images, Tractor catalogs, etc. comprise images taken by the dedicated `DESI`_ Legacy Imaging Surveys
project, as well as other images from NOAO telescopes.

(i) Web interface
-----------------

1. Query the `NOAO Science Archive`_.
2. From the menu of "Available Collections" on the left, select the desired data release (e.g. LS-DR8).
3. Under "Data products - Raw data" check "Object".
4. Optionally, you may select data from specific filters, or restrict the search by other parameters such as sky coordinates, observing date, or exposure time.
5. Click "Search".
6. The Results page offers several different ways to download the data. See `the Tutorials page`_ for details.

.. _`NOAO Science Archive`: http://archive.noao.edu/search/query
.. _`the Tutorials page`: http://archive.noao.edu/tutorials/query


(ii) ftp sites
--------------

Following the organization of the Stacked images, Raw and Calibrated images are organized 
by survey brick, which are defined in the file **survey-bricks-dr8.fits.gz** for DR8. Both the main Tractor 
catalogs and Sweep catalogs include the ``BRICKNAME`` keyword (corresponding to ``<brick>`` with 
format ``<AAAa>c<BBB>)``. 

- Raw: ftp://archive.noao.edu/public/hlsp/ls/dr8/raw/``<AAA>/<brick>``
- Calibrated: ftp://archive.noao.edu/public/hlsp/ls/dr8/calibrated/``<AAA>/<brick>``
- Stacked: ftp://archive.noao.edu/public/hlsp/ls/dr8/coadd/``<AAA>/<brick>``

For the calibrated images, filenames can be retrieved from the ``IMAGE_FILENAME`` keyword in each brick 
from *legacysurvey*-``<brick>``-*ccds.fits*. Additionally, each *calibrated*/``<AAA>/<brick>`` 
contains an ASCII file with a list of ``EXPID`` and ``IMAGE_FILENAME`` 
(*legacysurvey*-``<brick>``-*image_filename.txt*). 
``EXPID`` contains the exposure number and the CCD name with the format ``EXPNUM-ccd``. 
There is one entry per CCD. Often, multiple CCDs from a given file are used so there are 
fewer unique filenames than the number of CCDs. Each *legacysurvey*-``<brick>``-*image_filename.txt*
file contains the number of unique images in the last row (File Count).