.. title: Legacy Survey Files
.. slug: files
.. tags: 
.. has_math: yes

.. |sigma|    unicode:: U+003C3 .. GREEK SMALL LETTER SIGMA
.. |sup2|     unicode:: U+000B2 .. SUPERSCRIPT TWO
.. |chi|      unicode:: U+003C7 .. GREEK SMALL LETTER CHI
.. |delta|    unicode:: U+003B4 .. GREEK SMALL LETTER DELTA
.. |deg|    unicode:: U+000B0 .. DEGREE SIGN
.. |times|  unicode:: U+000D7 .. MULTIPLICATION SIGN
.. |plusmn| unicode:: U+000B1 .. PLUS-MINUS SIGN
.. |Prime|    unicode:: U+02033 .. DOUBLE PRIME
.. |gtapprox| unicode:: U+02273 .. GREATER-THAN OR EQUIVALENT TO

.. class:: pull-right well

.. contents::

Throughout this page ``<region>`` denotes either ``north`` for `BASS`_/`MzLS`_ or ``south`` for `DECaLS`_.

Directory Structures
====================

For Web Access
--------------

| **Top level directory:**
| https://portal.nersc.gov/cfs/cosmo/data/legacysurvey/dr9/
| **Top level directory for** `DECaLS`_ **data**:
| https://portal.nersc.gov/cfs/cosmo/data/legacysurvey/dr9/south/
| **Top level directory for** `MzLS`_/`BASS`_ **data:**
| https://portal.nersc.gov/cfs/cosmo/data/legacysurvey/dr9/north/
| **Top level directories for sweeps catalogs:**
| https://portal.nersc.gov/cfs/cosmo/data/legacysurvey/dr9/south/sweep/
| https://portal.nersc.gov/cfs/cosmo/data/legacysurvey/dr9/north/sweep/


At NERSC (for collaborators)
----------------------------

| **Top level directory:**
| /global/cfs/cdirs/cosmo/data/legacysurvey/dr9/
| **Top level directory for** `DECaLS`_ **data:**
| /global/cfs/cdirs/cosmo/data/legacysurvey/dr9/south/
| **Top level directory for** `MzLS`_/`BASS`_ **data:**
| /global/cfs/cdirs/cosmo/data/legacysurvey/dr9/north/
| **Top level directories for sweeps catalogs:**
| /global/cfs/cdirs/cosmo/data/legacysurvey/dr9/south/sweep/
| /global/cfs/cdirs/cosmo/data/legacysurvey/dr9/north/sweep/

Summary Files
=============

survey-bricks.fits.gz
---------------------

FITS binary table with the RA, Dec bounds of each geometrical "brick" on the sky.
This includes all bricks on the sky, not just the ones in our footprint or with
coverage in DR9.  For that information, see the next file description.

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

<region>/survey-bricks-dr9-<region>.fits.gz
-------------------------------------------

A FITS binary table with information that summarizes the contents of each brick for a region of DR9.

================== ========== =========================================================================
Column             Type       Description
================== ========== =========================================================================
``brickname``      char[8]    Name of the brick.
``ra``             float64    RA of the center of the brick.
``dec``            float64    Dec of the center of the brick.
``nexp_g``         int16      Median number of exposures in the unique area (i.e. ``BRICK_PRIMARY`` area) of the brick in g-band.
``nexp_r``         int16      Median number of exposures in the unique area of the brick in r-band.
``nexp_z``         int16      Median number of exposures in the unique area of the brick in z-band.
``nexphist_g``     int32[6]   Histogram of number of pixels in the unique brick area with 0, 1, 2, 3, 4, or > 5 exposures in g.
``nexphist_r``     int32[6]   Histogram of number of pixels in the unique brick area with 0, 1, 2, 3, 4, or > 5 exposures in r.
``nexphist_z``     int32[6]   Histogram of number of pixels in the unique brick area with 0, 1, 2, 3, 4, or > 5 exposures in z.
``nobjs``          int16      Total number of ``BRICK_PRIMARY`` objects in this brick, of all types.
``npsf``           int16      Total number of ``BRICK_PRIMARY`` objects in this brick, of type ``PSF``.
``nsimp``          int16      Total number of ``BRICK_PRIMARY`` objects in this brick, of type ``SIMP`` (there should be 0 such objects).
``nrex``           int16      Total number of ``BRICK_PRIMARY`` objects in this brick, of type ``REX``.
``nexp``           int16      Total number of ``BRICK_PRIMARY`` objects in this brick, of type ``EXP``.
``ndev``           int16      Total number of ``BRICK_PRIMARY`` objects in this brick, of type ``DEV``.
``ncomp``          int16      Total number of ``BRICK_PRIMARY`` objects in this brick, of type ``COMP`` (there should be 0 such objects).
``nser``           int16      Total number of ``BRICK_PRIMARY`` objects in this brick, of type ``SER``.
``ndup``           int16      Total number of ``BRICK_PRIMARY`` objects in this brick, of type ``DUP``.
``psfsize_g``      float32    Median PSF size, in arcsec, evaluated at the ``BRICK_PRIMARY`` objects in this brick in g-band.
``psfsize_r``      float32    Median PSF size, in arcsec, evaluated at the ``BRICK_PRIMARY`` objects in this brick in r-band.
``psfsize_z``      float32    Median PSF size, in arcsec, evaluated at the ``BRICK_PRIMARY`` objects in this brick in z-band.
``psfdepth_g``     float32    5-sigma PSF detection depth in :math:`g`-band (AB mag), using PsfEx PSF model.
``psfdepth_r``     float32    5-sigma PSF detection depth in :math:`r`-band (AB mag), using PsfEx PSF model.
``psfdepth_z``     float32    5-sigma PSF detection depth in :math:`z`-band (AB mag), using PsfEx PSF model.
``galdepth_g``     float32    5-sigma galaxy (0.45" round exp) detection depth in :math:`g`-band (AB) mag.
``galdepth_r``     float32    5-sigma galaxy (0.45" round exp) detection depth in :math:`r`-band (AB) mag.
``galdepth_z``     float32    5-sigma galaxy (0.45" round exp) detection depth in :math:`z`-band (AB) mag.
``ebv``            float32    Median `SFD98`_ dust map E(B-V) extinction, in magnitudes, evaluated at ``BRICK_PRIMARY`` objects in this brick.
``trans_g``        float32    Median Milky Way dust transparency in :math:`g`-band, based on ``ebv``. See also ``MW_TRANSMISSION_G``.
``trans_r``        float32    Median Milky Way dust transparency in :math:`g`-band, based on ``ebv``. See also ``MW_TRANSMISSION_R``.
``trans_z``        float32    Median Milky Way dust transparency in :math:`z`-band, based on ``ebv``. See also ``MW_TRANSMISSION_Z``.
``cosky_g``        float32    Estimated sky level in the coadded images (stacks) in :math:`g`-band [#]_.
``cosky_r``        float32    Estimated sky level in the coadded images (stacks) in :math:`r`-band.
``cosky_z``        float32    Estimated sky level in the coadded images (stacks) in :math:`z`-band.
``ext_g``          float32    Extinction in :math:`g`-band.
``ext_r``          float32    Extinction in :math:`r`-band.
``ext_z``          float32    Extinction in :math:`z`-band.
``wise_nobs``      int16[4]   Number of images that contributed to WISE calculations in each filter (not profile-weighted).
``trans_wise``     float32[4] Median Milky Way dust transparency in WISE bands, based on ``ebv``. See also, e.g., ``MW_TRANSMISSION_W1``.
``ext_w1``         float32    Extinction in :math:`W1`-band.
``ext_w2``         float32    Extinction in :math:`W2`-band.
``ext_w3``         float32    Extinction in :math:`W3`-band.
``ext_w4``         float32    Extinction in :math:`W4`-band.
``brickid``        int16      A unique integer with 1-to-1 mapping to ``brickname``.
``ra1``            float32    Lower RA boundary.
``ra2``            float32    Upper RA boundary.
``dec1``           float32    Lower Dec boundary.
``dec2``           float32    Upper Dec boundary.
``area``           float32    Area of the brick in square degrees.
``survey_primary`` boolean    ``True`` for northern (southern) bricks that lie in the northern (southern) region of the Legacy Surveys.
``in_desi``        boolean    ``True`` if the brick is in the DESI footprint.
================== ========== =========================================================================

Note that, for the ``nexphist`` rows, pixels that are masked by the NOIRLab Community Pipeline as, e.g., cosmic rays or saturation
(see, e.g. the ``ALLMASK/ANYMASK`` information on the `DR9 bitmasks page`_), do
*not* count toward the number of exposures. More information about the morphological types and ``MW_TRANSMISSION`` can be found on
the `catalogs page`_.

.. _`catalogs page`: ../catalogs
.. _`github`: https://github.com
.. _`DR9 bitmasks page`: ../bitmasks

survey-ccds-<camera>-dr9.fits.gz
--------------------------------

A FITS binary table with almanac information about each individual CCD image for each camera (where ``<camera>`` is one of ``90prime`` for `BASS`_, ``decam`` for `DECaLS`_ or ``mosaic`` for `MzLS`_).

This file contains information regarding the photometric and astrometric zero points for each CCD of every image that is part of the DR9 data release. Photometric zero points for each CCD are computed by identifying stars and comparing their instrumental magnitudes to color-selected stars in `the PanSTARRS "qz" catalog`_.

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
.. _`the PanSTARRS "qz" catalog`: ../external

==================== ========== =======================================================
Column               Type       Description
==================== ========== =======================================================
``image_filename``   char[120]  Path to FITS image, *e.g.* "north/DECam_CP/CP20170729/c4d_170730_045351_ooi_g_v1.fits.fz".
``image_hdu``        int16      FITS HDU number in the ``image_filename`` file where this image can be found.
``camera``           char[X]    The camera that took this image (X is 7 for "90prime", 6 for "mosaic" and 5 for "decam").
``expnum``           int64      Exposure number, *e.g.* 348224.
``plver``            char[8]    Community Pipeline (CP) version number.
``procdate``         char[19]   CP processing date.
``plprocid``         char[7]    Unique, time-based, CP processing hash - see the `plprocid page`_ for how to convert this to a date.
``ccdname``          char[X]    CCD name, *e.g.* "N10", "S7" for DECam (X is 4 for 90prime and mosaic CCDs, and 3 for decam).
``object``           char[35]   Name listed in the object tag from the CCD header.
``propid``           char[10]   Proposal ID of the program that took this image, eg "2014B-0404".
``filter``           char[1]    Filter used for observation, *e.g.* ":math:`g`", ":math:`r`", ":math:`z`".
``exptime``          float32    Exposure time in seconds, *e.g.* 30.
``mjd_obs``          float64    Date of observation in MJD (in UTC system), *e.g.* 56884.99373389.
``airmass``          float32    Airmass of observation (measured at the telescope bore-sight).
``fwhm``             float32    FWHM (in pixels) measured by the CP.
``width``            int16      Width in pixels of this image, *e.g.* 2046.
``height``           int16      Height in pixels of this image, *e.g.* 4096.
``ra_bore``          float64    Telescope boresight RA  of this exposure (deg).
``dec_bore``         float64    Telescope boresight Dec of this exposure (deg).
``crpix1``           float32    Astrometric header value: X reference pixel.
``crpix2``           float32    Astrometric header value: Y reference pixel.
``crval1``           float64    Astrometric header value: RA of reference pixel.
``crval2``           float64    Astrometric header value: Dec of reference pixel.
``cd1_1``            float32    Astrometric header value: transformation matrix.
``cd1_2``            float32    Astrometric header value: transformation matrix.
``cd2_1``            float32    Astrometric header value: transformation matrix.
``cd2_2``            float32    Astrometric header value: transformation matrix.
``yshift``           boolean    (ignore; it's always ``False``).
``ra``               float64    Approximate RA center of this CCD (deg).
``dec``              float64    Approximate Dec center of this CCD (deg).
``skyrms``           float32    Sky rms for the entire image (in counts/second).
``sig1``             float32    Median per-pixel error standard deviation, in nanomaggies.
``ccdzpt``           float32    Zeropoint for the CCD (AB mag).
``zpt``              float32    Median zero point for the entire image (median of all CCDs of the image), *e.g.* 25.0927.
``ccdraoff``         float32    Median astrometric offset for the CCD <GAIA-Legacy Survey> in arcsec.
``ccddecoff``        float32    Median astrometric offset for the CCD <GAIA-Legacy Survey> in arcsec.
``ccdskycounts``     float32    Mean sky counts level per pixel (AVSKY divided by EXPTIME) in the CP-processed frames measured (with iterative rejection) for each CCD in the image section [500:1500,1500:2500]. DECam exposure data is in electrons. Mosaic and 90prime are in electrons/sec. Sky counts are normalized to maintain a mean level from the original gain-corrected ADU.
``ccdrarms``         float32    rms in astrometric offset for the CCD <Gaia-Legacy Survey> in arcsec.
``ccddecrms``        float32    rms in astrometric offset for the CCD <Gaia-Legacy Survey> in arcsec.
``ccdphrms``         float32    Photometric rms for the CCD (in mag).
``phrms``            float32    Median photometric rms across all CCDs in the image (in mag).
``ccdnastrom``       int16      Number of stars (after sigma-clipping) used to compute astrometric correction.
``ccdnphotom``       int16      Number of Gaia+PS1 stars detected with signal-to-noise ratio greater than five.
``ccd_cuts``         int32      Bit mask describing CCD image quality (see the `DR9 bitmasks page`_).
==================== ========== =======================================================

.. _`ordering of the CCD corners is detailed here`: ../../ccdordering

survey-ccds-<camera>-dr9.kd.fits
--------------------------------

As for the **survey-ccds-<camera>-dr9.fits.gz** files but limited by the depth of each observation. These files
contain the CCDs actually used for the DR9 reductions. Columns are the same as for the **survey-ccds-<camera>-dr9.fits.gz** files.

ccds-annotated-<camera>-dr9.fits.gz
-----------------------------------

Versions of the **survey-ccds-<camera>-dr9.fits.gz** files with additional information
gathered during calibration pre-processing before running the Tractor reductions.

Includes all of the columns in the **survey-ccds-<camera>-dr9.fits.gz** files plus the columns
listed below. Note that string columns can have different lengths in the **survey-ccds-<camera>-dr9.fits.gz**
and **ccds-annotated-<camera>-dr9.fits.gz** files. For example the ``camera`` column can change from
``char[9]`` to ``char[7]`` (see, e.g. `legacypipe issue #379`_).

==================== ========== ======================================================
Column               Type       Description
==================== ========== ======================================================
``annotated``        boolean    ``True`` unless there is an error when computing the "annotated" quantities in this row of the file
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
``meansky``          float32    Our pipeline (not the CP) estimate of the sky level, average over the image, in nanomaggies
``stdsky``           float32    Standard deviation of our sky level, in nanomaggies
``maxsky``           float32    Max of our sky level, in nanomaggies
``minsky``           float32    Min of our sky level, in nanomaggies
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

ccds-annotated-<camera>-dr9.kd.fits
-----------------------------------

As for the **ccds-annotated-<camera>-dr9.fits.gz** files but limited by the depth of each observation. These files
contain the CCDs actually used for the DR9 reductions. Columns are the same as for the **ccds-annotated-<camera>-dr9.fits.gz** files.


<region>/dr9-<region>-depth.fits.gz
-----------------------------------

A concatenation of the depth histograms for each brick, for each region, from the
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

<region>/dr9-<region>-depth-summary.fits.gz
-------------------------------------------

A summary of the depth histogram for a region of DR9.  FITS table with the following columns:

==================== ======== ======================================================
Column               Type     Description
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

.. _`Myers et al. 2023`: https://ui.adsabs.harvard.edu/abs/2023AJ....165...50M/abstract
.. _`Myers et al. (2023)`: https://ui.adsabs.harvard.edu/abs/2023AJ....165...50M/abstract

Random Catalogs (``randoms/*``)
===============================

randoms-1-\*.fits
-----------------

Twenty files of random points sampled across the CCDs that comprise the geometry of DR9 (see `Myers et al. 2023`_). Random locations
were generated across the footprint at a density of 2,500 per square degree and meta-information
about the survey was extracted from pixels at each random location from files in the ``coadd`` directory (see below, e.g.
``coadd/*/*/*-depth-<filter>.fits.fz``, ``coadd/*/*/*-galdepth-<filter>.fits.fz``,
``coadd/*/*/*-nexp-<filter>.fits.fz``, ``coadd/*/*/*-maskbits.fits.fz``,
``coadd/*/*/*-invvar-<filter>.fits.fz``). The order of the points within each file is also random
(meaning that randomness is retained if just the first N rows of the file are read). Each file contains the following columns:

==================== ======== ======================================================
Column               Type     Description
==================== ======== ======================================================
``RELEASE``	     int16    Integer denoting the camera and filter set used, which will be unique for a given processing run of the data (`RELEASE is documented here`_)
``BRICKID``          int32    A unique Brick ID (in the range [1, 662174])
``BRICKNAME``        char[8]  Name of the brick
``BRICK_OBJID``      int32    Random catalog object number enumerate by increasing ``RA`` within each brick; a unique identifier hash is ``RELEASE,BRICKID,BRICK_OBJID``
``RA``               float64  Right ascension at equinox J2000
``DEC``              float64  Declination at equinox J2000
``NOBS_G``           int16    Number of images that contribute to the central pixel in the :math:`g` filter for this location (not profile-weighted)
``NOBS_R``           int16    Number of images that contribute to the central pixel in the :math:`r` filter for this location (not profile-weighted)
``NOBS_Z``           int16    Number of images that contribute to the central pixel in the :math:`z` filter for this location (not profile-weighted)
``PSFDEPTH_G``       float32  For a :math:`5\sigma` point source detection limit in :math:`g`, :math:`5/\sqrt(\mathrm{PSFDEPTH\_G})` gives flux in nanomaggies and :math:`-2.5[\log_{10}(5 / \sqrt(\mathrm{PSFDEPTH\_G})) - 9]` gives corresponding magnitude
``PSFDEPTH_R``       float32  For a :math:`5\sigma` point source detection limit in :math:`r`, :math:`5/\sqrt(\mathrm{PSFDEPTH\_R})` gives flux in nanomaggies and :math:`-2.5[\log_{10}(5 / \sqrt(\mathrm{PSFDEPTH\_R})) - 9]` gives corresponding magnitude
``PSFDEPTH_Z``       float32  For a :math:`5\sigma` point source detection limit in :math:`i`, :math:`5/\sqrt(\mathrm{PSFDEPTH\_Z})` gives flux in nanomaggies and :math:`-2.5[\log_{10}(5 / \sqrt(\mathrm{PSFDEPTH\_Z})) - 9]` gives corresponding magnitude
``GALDEPTH_G``       float32  As for ``PSFDEPTH_G`` but for a galaxy (0.45" exp, round) detection sensitivity
``GALDEPTH_R``       float32  As for ``PSFDEPTH_R`` but for a galaxy (0.45" exp, round) detection sensitivity
``GALDEPTH_Z``       float32  As for ``PSFDEPTH_Z`` but for a galaxy (0.45" exp, round) detection sensitivity
``PSFDEPTH_W1``      float32  As for ``PSFDEPTH_G`` (and also on the AB system) but for WISE W1
``PSFDEPTH_W2``      float32  As for ``PSFDEPTH_G`` (and also on the AB system) but for WISE W2
``PSFSIZE_G``	     float32  Weighted average PSF FWHM in arcsec in the :math:`g` band
``PSFSIZE_R``	     float32  Weighted average PSF FWHM in arcsec in the :math:`r` band
``PSFSIZE_Z``	     float32  Weighted average PSF FWHM in arcsec in the :math:`z` band
``APFLUX_G``	     float32  Total flux in nanomaggies extracted in a 0.75 arcsec radius in the :math:`g` band at this location
``APFLUX_R``	     float32  Total flux in nanomaggies extracted in a 0.75 arcsec radius in the :math:`r` band at this location
``APFLUX_Z``	     float32  Total flux in nanomaggies extracted in a 0.75 arcsec radius in the :math:`z` band at this location
``APFLUX_IVAR_G``    float32  Inverse variance of ``APFLUX_G``
``APFLUX_IVAR_R``    float32  Inverse variance of ``APFLUX_R``
``APFLUX_IVAR_Z``    float32  Inverse variance of ``APFLUX_Z``
``MASKBITS``         int16    Bitwise mask for optical data in the ``coadd/*/*/*maskbits*`` maps (see the `DR9 bitmasks page`_)
``WISEMASK_W1``      uint8    Bitwise mask for WISE W1 data in the ``coadd/*/*/*maskbits*`` maps (see the `DR9 bitmasks page`_)
``WISEMASK_W2``      uint8    Bitwise mask for WISE W2 data in the ``coadd/*/*/*maskbits*`` maps (see the `DR9 bitmasks page`_)
``EBV``              float32  Galactic extinction E(B-V) reddening from `SFD98`_
``PHOTSYS``	     char[1]  'N' for an `MzLS`_/`BASS`_ location, 'S' for a `DECaLS`_ location
``HPXPIXEL``         int64    `HEALPixel`_ containing this location at NSIDE=64 in the NESTED scheme
``TARGETID``         int64    See the `desitarget data model`_ (added to facilitate running randoms through the `DESI fiberassign code`_)
``DESI_TARGET``      int64    See the `desitarget data model`_; set to 4, appropriate to a QSO, the highest-priority DESI dark-time target (added to facilitate running randoms through the `DESI fiberassign code`_)
``BGS_TARGET``       int64    See the `desitarget data model`_; set to zero (added to facilitate running randoms through the `DESI fiberassign code`_)
``MWS_TARGET``       int64    See the `desitarget data model`_; set to zero (added to facilitate running randoms through the `DESI fiberassign code`_)
``SUBPRIORITY``      int64    See the `desitarget data model`_ (added to facilitate running randoms through the `DESI fiberassign code`_)
``OBSCONDITIONS``    int32    See the `desitarget data model`_; set to 511, which corresponds to all possible observing conditions (added to facilitate running randoms through the `DESI fiberassign code`_)
``PRIORITY_INIT``    int64    See the `desitarget data model`_; set to 3400, appropriate to a QSO, the highest-priority DESI dark-time target (added to facilitate running randoms through the `DESI fiberassign code`_)
``NUMOBS_INIT``      int64    See the `desitarget data model`_; set to 4, appropriate to a QSO, the highest-priority DESI dark-time target (added to facilitate running randoms through the `DESI fiberassign code`_)
``SCND_TARGET``      int64    See the `desitarget data model`_; set to 0 (added to facilitate running randoms through the `DESI fiberassign code`_)
``NUMOBS_MORE``      int64    See the `desitarget data model`_; set to 4, appropriate to a QSO, the highest-priority DESI dark-time target (added to facilitate running randoms through the `DESI fiberassign code`_)
``NUMOBS``           int64    See the `desitarget data model`_; set to 0 (added to facilitate running randoms through the `DESI fiberassign code`_)
``Z``                float64  See the `desitarget data model`_; set to -1.0 (added to facilitate running randoms through the `DESI fiberassign code`_)
``ZWARN``            int64    See the `desitarget data model`_; set to -1 (added to facilitate running randoms through the `DESI fiberassign code`_)
``TARGET_STATE``     char[15] See the `desitarget data model`_; set to "QSO|UNOBS", denoting an unobserved QSO (added to facilitate running randoms through the `DESI fiberassign code`_)
``TIMESTAMP``        char[19] See the `desitarget data model`_; time at which this random was processed (added to facilitate running randoms through the `DESI fiberassign code`_)
``VERSION``          char[14] See the `desitarget data model`_; version of the ``desitarget`` code used to process this random (added to facilitate running randoms through the `DESI fiberassign code`_)
``PRIORITY``         int64    See the `desitarget data model`_; set to 3400, appropriate to a QSO, the highest-priority DESI dark-time target (added to facilitate running randoms through the `DESI fiberassign code`_)
==================== ======== ======================================================

.. _`a particular declination`: https://github.com/desihub/desitarget/blob/0.48.0/py/desitarget/io.py#L102
.. _`the desitarget code`: https://github.com/desihub/desitarget/blob/0.48.0/py/desitarget/targets.py#L821
.. _`desitarget data model`: https://desidatamodel.readthedocs.io/en/latest/DESI_TARGET/index.html
.. _`DESI fiberassign code`: https://github.com/desihub/fiberassign
.. _`HEALPixel`: https://healpy.readthedocs.io/en/latest/
.. _`code is available on GitHub`: https://github.com/desihub/desitarget/blob/0.48.0/bin/select_randoms
.. _`desitarget`: https://github.com/desihub/desitarget/
.. _`here`: https://github.com/desihub/desitarget/blob/0.48.0/py/desitarget/randoms.py

The version of the `desitarget`_ code used to generate the random catalogs (``0.48.0``) can be extracted from the ``VERSION`` column. The `code is available on GitHub`_ (see also `here`_). The
northern and southern imaging footprints overlap, so, randoms are resolved by `the desitarget code`_ at `a particular declination`_ and by the Galactic plane. The result is that
randoms with locations at Dec :math:`\geq` 32.375\ |deg| `and` that are north of the Galactic Plane are only included in this file if they have pixels in `BASS`_/`MzLS`_ (``PHOTSYS`` set to "N"), and
randoms with locations at Dec <  32.375\ |deg| `or` that are south of the Galactic Plane are only included in this file if they have pixels in `DECaLS`_ (``PHOTSYS`` set to "S").

Work which uses any of the random catalogs should cite `Myers et al. (2023)`_.

randoms-outside-1-\*.fits
-------------------------

Twenty files of random points in bricks that do not contain an observation in DR9 (that are "outside" of the DR9 footprint). The columns in this file
are simplified compared to the other random catalogs as most of the entries in the additional columns would be zeros.
As with the other random catalogs, points were generated at a density of 2,500 per square degree and
the order of the points within the file is also randomized. Contains the following columns:

==================== ======== ======================================================
Column               Type     Description
==================== ======== ======================================================
``BRICKID``          int32    A unique Brick ID (in the range [1, 662174])
``BRICKNAME``        char[8]  Name of the brick
``RA``               float64  Right ascension at equinox J2000
``DEC``              float64  Declination at equinox J2000
``NOBS_G``           int16    Always zero in this file.
``NOBS_R``           int16    Always zero in this file.
``NOBS_Z``           int16    Always zero in this file.
``EBV``              float32  Galactic extinction E(B-V) reddening from `SFD98`_
==================== ======== ======================================================

randoms-allsky-1-\*.fits
------------------------

The (randomly shuffled) combination of each of the ``randoms-1-X.fits``
and ``randoms-outside-1-X.fits`` files (where X = 0, 1, 2, 3, ... 18, 19). This creates
twenty "all-sky" random catalogs (at a density of 2,500 locations per square degree)
where each brick is either populated with observations from the
Legacy Surveys, or zeros. Contains a subset of the columns from the ``randoms-1-X.fits`` files.

survey-bricks-dr9-randoms-0.48.0.fits
-------------------------------------

A similar file to the `survey-bricks.fits.gz`_ file, but with extra columns to help interpret
the random catalogs. Contains the same columns as the `survey-bricks.fits.gz`_ file, plus the additional
columns:

================== ======= ======================================================
Column             Type    Description
================== ======= ======================================================
``PHOTSYS``        char[1] ``"N"``, ``"S"`` or ``" "`` for bricks resolved to be "officially" in the north, south, or outside of the footprint, respectively.
``AREA_PER_BRICK`` float64 The area of the brick in square degrees.
================== ======= ======================================================

<region>/randoms/randoms-<region>-1-\*.fits
-------------------------------------------

As for the corresponding ``randoms-1-*.fits`` file, but for each ``<region>`` without resolving randoms using `the desitarget code`_. In other words, this file
contains all randoms for the northern (southern) imaging surveys, regardless of whether the brick is "officially" in the ``north`` (``south``) region.

.. _`survey-bricks.fits.gz`: ../files/#survey-bricks-fits-gz

External Match Files (``<region>/external/*``)
==============================================

| **The Legacy Survey photometric catalogs have been matched to a range of external spectroscopic files from the SDSS. These external spectroscopic files can be accessed on the NERSC computers (for collaborators) at:**
| /global/cfs/cdirs/sdss/data/sdss
| /global/cfs/cdirs/sdss/staging/dr16/sdss/spectro/redux/

| **The resulting catalogs, which are listed below, can be accessed through the web at:**
| https://portal.nersc.gov/cfs/cosmo/data/legacysurvey/dr9/north/external/
| https://portal.nersc.gov/cfs/cosmo/data/legacysurvey/dr9/south/external/

| **Or on the NERSC computers at:**
| /global/cfs/cdirs/cosmo/data/legacysurvey/dr9/north/external/
| /global/cfs/cdirs/cosmo/data/legacysurvey/dr9/south/external/

Each row of each external-match file contains the full record of the nearest object in our Tractored survey
imaging catalogs, matched at a radius of 1.5 arcsec. The structure of the imaging catalog files
is documented on the `catalogs page`_. If no match is found, then ``OBJID`` is set to -1.

In addition to the columns from the Tractor `catalogs`_, we have added columns from the SDSS files that can be used to track objects uniquely. These are typically some combination of ``PLATE``, ``FIBER``, ``MJD`` (or ``SMJD``) and, in some cases, ``RERUN``.

In previous Data Releases, if a source was duplicated in the SDSS spectroscopic files, only one of the duplicates was matched to a Legacy Surveys photometric object. Starting with DR9, we match
`all` duplicates in the SDSS spectroscopic files. The result is that all sources in the SDSS spectroscopic files should have information from the Legacy Surveys imaging if they
match with any Legacy Surveys ``BRICK_PRIMARY`` photometric object.

.. _`catalogs page`: ../catalogs
.. _`catalogs`: ../catalogs
.. _`Catalogs`: ../catalogs

survey-dr9-<region>-specObj-dr16.fits
-------------------------------------
HDU1 (the only HDU) contains Tractored survey
photometry that is row-by-row-matched to the SDSS DR16 spectrosopic
pipeline file such that the photometric parameters in row "N" of
**survey-dr9-<region>-specObj-dr16.fits** match the spectroscopic parameters in row "N" of
specObj-dr16.fits. The spectroscopic file
is documented in the SDSS DR16 `data model for specObj-dr16.fits`_.

.. _`data model for specObj-dr16.fits`: https://data.sdss.org/datamodel/files/SPECTRO_REDUX/specObj.html

survey-dr9-<region>-dr16Q-v4.fits
---------------------------------
HDU1 (the only HDU) contains Tractored survey
photometry that is row-by-row-matched to the SDSS DR16
visually inspected quasar catalog (`Lyke et al. 2020`_)
such that the photometric parameters in row "N" of
**survey-dr9-<region>-dr16Q-v4.fits** match the spectroscopic parameters in row "N" of
DR16Q_v4.fits. The spectroscopic file
is documented in the SDSS DR14 `data model for DR16Q_v4.fits`_.

.. _`Lyke et al. 2020`: https://ui.adsabs.harvard.edu/abs/2020ApJS..250....8L/abstract
.. _`Paris et al. 2018`: https://ui.adsabs.harvard.edu/abs/2018A%26A...613A..51P/abstract
.. _`data model for DR16Q_v4.fits`: https://data.sdss.org/datamodel/files/BOSS_QSO/DR16Q/DR16Q_v4.html

survey-dr9-<region>-superset-dr16Q-v3.fits
------------------------------------------
HDU1 (the only HDU) contains Tractored survey
photometry that is row-by-row-matched to the superset of all SDSS DR16 spectroscopically
confirmed objects that were visually inspected as possible quasars (`Lyke et al. 2020`_)
such that the photometric parameters in row "N" of
**survey-dr9-<region>-superset-dr16Q-v3.fits** match the spectroscopic parameters in row "N" of
DR16Q_Superset_v3.fits. The spectroscopic file
is documented in the SDSS DR16 `data model for DR16Q_Superset_v3.fits`_.

.. _`data model for DR16Q_Superset_v3.fits`: https://data.sdss.org/datamodel/files/BOSS_QSO/DR16Q/DR16Q_Superset_v3.html

survey-dr9-<region>-dr12Q.fits
------------------------------
HDU1 (the only HDU) contains Tractored survey
photometry that is row-by-row-matched to the SDSS DR12
visually inspected quasar catalog (`Paris et al. 2017`_)
such that the photometric parameters in row "N" of
**survey-dr9-<region>-dr12Q.fits** match the spectroscopic parameters in row "N" of
DR12Q.fits. The spectroscopic file
is documented in the SDSS DR12 `data model for DR12Q.fits`_.

.. _`Paris et al. 2017`: https://ui.adsabs.harvard.edu/abs/2017A%26A...597A..79P/abstract
.. _`data model for DR12Q.fits`: https://data.sdss.org/datamodel/files/BOSS_QSO/DR12Q/DR12Q.html

survey-dr9-<region>-superset-dr12Q.fits
---------------------------------------
HDU1 (the only HDU) contains Tractored survey
photometry that is row-by-row-matched to the superset of all SDSS DR12 spectroscopically
confirmed objects that were visually inspected as possible quasars
(`Paris et al. 2017`_) such that the photometric parameters in row "N" of
**survey-dr9-<region>-superset-dr12Q.fits** match the spectroscopic parameters in row "N" of
Superset_DR12Q.fits. The spectroscopic file
is documented in the SDSS DR12 `data model for Superset_DR12Q.fits`_.

.. _`data model for Superset_DR12Q.fits`: https://data.sdss.org/datamodel/files/BOSS_QSO/DR12Q/DR12Q_superset.html

survey-dr9-<region>-dr7Q.fits
-----------------------------
HDU1 (the only HDU) contains Tractored survey
photometry that is row-by-row-matched to the SDSS DR7
visually inspected quasar catalog (`Schneider et al. 2010`_)
such that the photometric parameters in row "N" of
**survey-dr9-<region>-dr7Q.fits** match the spectroscopic parameters in row "N" of
DR7qso.fit. The spectroscopic file
is documented on the `DR7 quasar catalog description page`_.

.. _`Schneider et al. 2010`: https://ui.adsabs.harvard.edu/abs/2010AJ....139.2360S/abstract
.. _`DR7 quasar catalog description page`: https://classic.sdss.org/dr7/products/value_added/qsocat_dr7.html


Tractor Catalogs (``<region>/tractor/*``)
=========================================

In the file listings outlined below:

- brick names (**<brick>**) have the format `<AAAa>c<BBB>` where `A`, `a` and `B` are digits and `c` is either the letter `m` or `p` (e.g. `1126p222`). The names are derived from the (RA, Dec) center of the brick. The first four digits are :math:`int(RA \times 10)`, followed by `p` to denote positive Dec or `m` to denote negative Dec ("plus"/"minus"), followed by three digits of :math:`int(Dec \times 10)`. For example the case `1126p222` corresponds to (RA, Dec) = (112.6\ |deg|, +22.2\ |deg|).

- **<brickmin>** and **<brickmax>** denote the corners of a rectangle in (RA, Dec). Explicitly, **<brickmin>** has the format `<AAA>c<BBB>` where `<AAA>` denotes three digits of the minimum :math:`int(RA)` in degrees, <BBB> denotes three digits of the minimum :math:`int(Dec)` in degrees, and `c` uses the `p`/`m` ("plus"/"minus") format outlined in the previous bullet point. The convention is similar for  **<brickmax>** and the maximum RA and Dec. For example `000m010-010m005` would correspond to a survey region limited by :math:`0^\circ \leq RA < 10^\circ` and :math:`-10^\circ \leq Dec < -5^\circ`.

- sub-directories are listed by the RA of the brick center, and sub-directory names (**<AAA>**) correspond to RA. For example `002` corresponds to brick centers between an RA of 2\ |deg| and an RA of 3\ |deg|.

- **<filter>** denotes the :math:`g`, :math:`r` or :math:`z` band, using the corresponding letter.

Note that it is not possible to go from a brick name back to an *exact* (RA, Dec) center (the bricks are not on 0.1\ |deg| grid
lines). The exact brick center for a given brick name can be derived from columns in the
**survey-bricks.fits.gz** file (i.e. ``brickname``, ``ra``, ``dec``).

<AAA>/tractor-<brick>.fits
--------------------------

FITS binary table containing Tractor photometry, documented on the
`catalogs page`_.

.. _`catalogs page`: ../catalogs

Users interested in database access to the Tractor `catalogs`_ can use the `NOIRLab Astro Data Lab`_ [#]_.

.. _`NOIRLab Astro Data Lab`: https://datalab.noirlab.edu/

Sweep Catalogs (``<region>/sweep/*``)
=====================================

9.0/sweep-<brickmin>-<brickmax>.fits
------------------------------------

The sweeps are light-weight FITS binary tables (containing a subset of the most commonly used
Tractor measurements) of all the Tractor `catalogs`_ for which ``BRICK_PRIMARY==T`` in rectangles of RA, Dec.

.. _`RELEASE is documented here`: ../../release
.. _`release is documented here`: ../../release
.. _`SFD98`: https://ui.adsabs.harvard.edu/abs/1998ApJ...500..525S/abstract

===================================== ============ ===================== ===============================================
Name                                  Type         Units                 Description
===================================== ============ ===================== ===============================================
``RELEASE``                           int16                              Integer denoting the camera and filter set used, which will be unique for a given processing run of the data (`RELEASE is documented here`_)
``BRICKID``                           int32                              A unique Brick ID (in the range [1, 662174])
``BRICKNAME``                         char[8]                            Name of brick, encoding the brick sky position, eg "1126p222" near RA=112.6, Dec=+22.2
``OBJID``                             int32                              Catalog object number within this brick; a unique identifier hash is ``RELEASE,BRICKID,OBJID``; ``OBJID`` spans [0,N-1] and is contiguously enumerated within each blob
``TYPE``                              char[3]                            Morphological model: "PSF"=stellar, "REX"="round exponential galaxy" = round EXP galaxy with a variable radius, "EXP"=exponential, "DEV"=deVauc, "SER"=Sersic, "DUP"==Gaia source fit by different model
``RA``                                float64      deg                   Right ascension at equinox J2000
``DEC``                               float64      deg                   Declination at equinox J2000
``RA_IVAR``                           float32      1/deg\ |sup2|         Inverse variance of ``RA`` (no cosine term!), excluding astrometric calibration errors
``DEC_IVAR``                          float32      1/deg\ |sup2|         Inverse variance of ``DEC``, excluding astrometric calibration errors
``DCHISQ``                            float32[5]                         Difference in |chi|\ |sup2| between successively more-complex model fits: PSF, REX, DEV, EXP, SER.  The difference is versus no source.
``EBV``                               float32      mag                   Galactic extinction E(B-V) reddening from `SFD98`_, used to compute ``MW_TRANSMISSION``
``FLUX_G``                            float32      nanomaggy             Model flux in :math:`g`
``FLUX_R``                            float32      nanomaggy             Model flux in :math:`r`
``FLUX_Z``                            float32      nanomaggy             Model flux in :math:`z`
``FLUX_W1``                           float32      nanomaggy             WISE model flux in :math:`W1` (AB system)
``FLUX_W2``                           float32      nanomaggy             WISE model flux in :math:`W2` (AB)
``FLUX_W3``                           float32      nanomaggy             WISE model flux in :math:`W3` (AB)
``FLUX_W4``                           float32      nanomaggy             WISE model flux in :math:`W4` (AB)
``FLUX_IVAR_G``                       float32      1/nanomaggy\ |sup2|   Inverse variance of ``FLUX_G``
``FLUX_IVAR_R``                       float32      1/nanomaggy\ |sup2|   Inverse variance of ``FLUX_R``
``FLUX_IVAR_Z``                       float32      1/nanomaggy\ |sup2|   Inverse variance of ``FLUX_Z``
``FLUX_IVAR_W1``                      float32      1/nanomaggy\ |sup2|   Inverse variance of ``FLUX_W1`` (AB system)
``FLUX_IVAR_W2``                      float32      1/nanomaggy\ |sup2|   Inverse variance of ``FLUX_W2`` (AB)
``FLUX_IVAR_W3``                      float32      1/nanomaggy\ |sup2|   Inverse variance of ``FLUX_W3`` (AB)
``FLUX_IVAR_W4``                      float32      1/nanomaggy\ |sup2|   Inverse variance of ``FLUX_W4`` (AB)
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
``ANYMASK_G``                         int16                              Bitwise mask set if the central pixel from any image satisfies each condition in :math:`g` (see the `DR9 bitmasks page`_)
``ANYMASK_R``                         int16                              Bitwise mask set if the central pixel from any image satisfies each condition in :math:`r` (see the `DR9 bitmasks page`_)
``ANYMASK_Z``                         int16                              Bitwise mask set if the central pixel from any image satisfies each condition in :math:`z` (see the `DR9 bitmasks page`_)
``ALLMASK_G``                         int16                              Bitwise mask set if the central pixel from all images satisfy each condition in :math:`g` (see the `DR9 bitmasks page`_)
``ALLMASK_R``                         int16                              Bitwise mask set if the central pixel from all images satisfy each condition in :math:`r` (see the `DR9 bitmasks page`_)
``ALLMASK_Z``                         int16                              Bitwise mask set if the central pixel from all images satisfy each condition in :math:`z` (see the `DR9 bitmasks page`_)
``WISEMASK_W1``                       uint8                              W1 bitmask as cataloged on the `DR9 bitmasks page`_
``WISEMASK_W2``                       uint8                              W2 bitmask as cataloged on the `DR9 bitmasks page`_
``PSFSIZE_G``                         float32      arcsec                Weighted average PSF FWHM in the :math:`g` band
``PSFSIZE_R``                         float32      arcsec                Weighted average PSF FWHM in the :math:`r` band
``PSFSIZE_Z``                         float32      arcsec                Weighted average PSF FWHM in the :math:`z` band
``PSFDEPTH_G``                        float32      1/nanomaggy\ |sup2|   For a :math:`5\sigma` point source detection limit in :math:`g`, :math:`5/\sqrt(\mathrm{PSFDEPTH\_G})` gives flux in nanomaggies and :math:`-2.5[\log_{10}(5 / \sqrt(\mathrm{PSFDEPTH\_G})) - 9]` gives corresponding magnitude
``PSFDEPTH_R``                        float32      1/nanomaggy\ |sup2|   For a :math:`5\sigma` point source detection limit in :math:`g`, :math:`5/\sqrt(\mathrm{PSFDEPTH\_R})` gives flux in nanomaggies and :math:`-2.5[\log_{10}(5 / \sqrt(\mathrm{PSFDEPTH\_R})) - 9]` gives corresponding magnitude
``PSFDEPTH_Z``                        float32      1/nanomaggy\ |sup2|   For a :math:`5\sigma` point source detection limit in :math:`g`, :math:`5/\sqrt(\mathrm{PSFDEPTH\_Z})` gives flux in nanomaggies and :math:`-2.5[\log_{10}(5 / \sqrt(\mathrm{PSFDEPTH\_Z})) - 9]` gives corresponding magnitude
``GALDEPTH_G``                        float32      1/nanomaggy\ |sup2|   As for ``PSFDEPTH_G`` but for a galaxy (0.45" exp, round) detection sensitivity
``GALDEPTH_R``                        float32      1/nanomaggy\ |sup2|   As for ``PSFDEPTH_R`` but for a galaxy (0.45" exp, round) detection sensitivity
``GALDEPTH_Z``                        float32      1/nanomaggy\ |sup2|   As for ``PSFDEPTH_Z`` but for a galaxy (0.45" exp, round) detection sensitivity
``PSFDEPTH_W1``                       float32      1/nanomaggy\ |sup2|   As for ``PSFDEPTH_G`` (and also on the AB system) but for WISE W1
``PSFDEPTH_W2``                       float32      1/nanomaggy\ |sup2|   As for ``PSFDEPTH_G`` (and also on the AB system) but for WISE W2
``WISE_COADD_ID``                     char[8]                            unWISE coadd file name for the center of each object
``SHAPE_R``                           float32      arcsec                Half-light radius of galaxy model for galaxy type ``TYPE`` (>0)
``SHAPE_R_IVAR``                      float32      1/arcsec\ |sup2|      Inverse variance of ``SHAPE_R``
``SHAPE_E1``                          float32                            Ellipticity component 1 of galaxy model for galaxy type ``TYPE``
``SHAPE_E1_IVAR``                     float32                            Inverse variance of ``SHAPE_E1``
``SHAPE_E2``                          float32                            Ellipticity component 2 of galaxy model for galaxy type ``TYPE``
``SHAPE_E2_IVAR``                     float32                            Inverse variance of ``SHAPE_E2``
``FIBERFLUX_G``                       float32      nanomaggy             Predicted :math:`g`-band flux within a fiber of diameter 1.5 arcsec from this object in 1 arcsec Gaussian seeing
``FIBERFLUX_R``                       float32      nanomaggy             Predicted :math:`r`-band flux within a fiber of diameter 1.5 arcsec from this object in 1 arcsec Gaussian seeing
``FIBERFLUX_Z``                       float32      nanomaggy             Predicted :math:`z`-band flux within a fiber of diameter 1.5 arcsec from this object in 1 arcsec Gaussian seeing
``FIBERTOTFLUX_G``                    float32      nanomaggy             Predicted :math:`g`-band flux within a fiber of diameter 1.5 arcsec from all sources at this location in 1 arcsec Gaussian seeing
``FIBERTOTFLUX_R``                    float32      nanomaggy             Predicted :math:`r`-band flux within a fiber of diameter 1.5 arcsec from all sources at this location in 1 arcsec Gaussian seeing
``FIBERTOTFLUX_Z``                    float32      nanomaggy             Predicted :math:`z`-band flux within a fiber of diameter 1.5 arcsec from all sources at this location in 1 arcsec Gaussian seeing
``REF_CAT``                           char[2]                            Reference catalog source for this star: "T2" for `Tycho-2`_, "G2" for `Gaia`_ DR2, "L3" for the `SGA`_, empty otherwise
``REF_ID``                            int64                              Reference catalog identifier for this star; Tyc1*1,000,000+Tyc2*10+Tyc3 for `Tycho-2`_; "sourceid" for `Gaia`_ DR2 and `SGA`_
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
``PARALLAX_IVAR``                     float32      1/mas\ |sup2|         Reference catalog inverse-variance on ``PARALLAX``
``PMRA``                              float32      mas/yr                Reference catalog proper motion in RA direction (:math:`\mu_\alpha^*\equiv\mu_\alpha\cos\delta`) in the ICRS at ``REF_EPOCH``
``PMRA_IVAR``                         float32      1/(mas/yr)\ |sup2|    Reference catalog inverse-variance on ``PMRA``
``PMDEC``                             float32      mas/yr                Reference catalog proper motion in Dec direction (:math:`\mu_\delta`) in the ICRS at ``REF_EPOCH``
``PMDEC_IVAR``                        float32      1/(mas/yr)\ |sup2|    Reference catalog inverse-variance on ``PMDEC``
``MASKBITS``           		      int16    	   	       		 Bitwise mask indicating that an object touches a pixel in the ``coadd/*/*/*maskbits*`` maps (see the `DR9 bitmasks page`_)
``FITBITS``                           int16                              Bitwise mask detailing properties of how a source was fit (see the `DR9 bitmasks page`_)
``SERSIC``                            float32                            Power-law index for the Sersic profile model (``TYPE="SER"``)
``SERSIC_IVAR``                       float32                            Inverse variance of ``SERSIC``
===================================== ============ ===================== ===============================================

.. _`Gaia`: https://gea.esac.esa.int/archive/documentation//GDR2/Gaia_archive/chap_datamodel/sec_dm_main_tables/ssec_dm_gaia_source.html
.. _`Tycho-2`: https://heasarc.gsfc.nasa.gov/W3Browse/all/tycho2.html
.. _`SGA`: ../../sga/sga2020

.. _photometric-redshifts:

Light Curve sweeps (9.0-lightcurves/sweep-<brickmin>-<brickmax>-lc.fits)
------------------------------------------------------------------------

The "light curve" sweeps files contain values from the `Tractor catalogs`_ that
relate to multi-epoch WISE data, which are

====================== ============ ===================== =======================
Name                   Type         Units                 Description
====================== ============ ===================== =======================
``RELEASE``            int16                              Integer denoting the camera and filter set used, which will be unique for a given processing run of the data (`RELEASE is documented here`_)
``BRICKID``            int32                              A unique Brick ID (in the range [1, 662174])
``OBJID``              int32                              Catalog object number within this brick; a unique identifier hash is ``RELEASE,BRICKID,OBJID``; ``OBJID`` spans [0,N-1] and is contiguously enumerated within each blob
``LC_FLUX_W1``         float32[15]  nanomaggy             ``FLUX_W1`` in each of up to fifteen unWISE coadd epochs (AB system; defaults to zero for unused entries)
``LC_FLUX_W2``         float32[15]  nanomaggy             ``FLUX_W2`` in each of up to fifteen unWISE coadd epochs (AB; defaults to zero for unused entries)
``LC_FLUX_IVAR_W1``    float32[15]  1/nanomaggy\ |sup2|   Inverse variance of ``LC_FLUX_W1`` (AB system; defaults to zero for unused entries)
``LC_FLUX_IVAR_W2``    float32[15]  1/nanomaggy\ |sup2|   Inverse variance of ``LC_FLUX_W2`` (AB; defaults to zero for unused entries)
``LC_NOBS_W1``         int16[15]                          ``NOBS_W1`` in each of up to fifteen unWISE coadd epochs
``LC_NOBS_W2``         int16[15]                          ``NOBS_W2`` in each of up to fifteen unWISE coadd epochs
``LC_MJD_W1``          float64[15]                        ``MJD_W1`` in each of up to fifteen unWISE coadd epochs (defaults to zero for unused entries)
``LC_MJD_W2``          float64[15]                        ``MJD_W2`` in each of up to fifteen unWISE coadd epochs (defaults to zero for unused entries)
``LC_FRACFLUX_W1``     float32[15]                        ``FRACFLUX_W1`` in each of up to fifteen unWISE coadd epochs (defaults to zero for unused entries)
``LC_FRACFLUX_W2``     float32[15]                        ``FRACFLUX_W2`` in each of up to fifteen unWISE coadd epochs (defaults to zero for unused entries)
``LC_RCHISQ_W1``       float32[15]                        ``RCHISQ_W1`` in each of up to fifteen unWISE coadd epochs (defaults to zero for unused entries)
``LC_RCHISQ_W2``       float32[15]                        ``RCHISQ_W2`` in each of up to fifteen unWISE coadd epochs (defaults to zero for unused entries)
``LC_EPOCH_INDEX_W1``  int16[15]                          Index number of unWISE epoch for W1 (defaults to -1 for unused entries)
``LC_EPOCH_INDEX_W2``  int16[15]                          Index number of unWISE epoch for W2 (defaults to -1 for unused entries)
====================== ============ ===================== =======================

The light curve sweeps files are row-by-row-parallel to the standard sweeps files
(i.e. the entries in each row of the light curve sweeps files correspond to the entries
in each row of the standard sweeps files, which can be verified using ``RELEASE``,
``BRICKID`` and ``OBJID``).


Extra sweeps (9.0-lightcurves/sweep-<brickmin>-<brickmax>-ex.fits)
-------------------------------------------------------------------

The "extra" sweeps files contain all columns from the `Tractor catalogs`_ that
are not otherwise in the standard sweeps files or the "light curve" sweep files.
See the `Tractor catalogs`_ for a description of the columns in these files.
The extra sweeps files are row-by-row-parallel to the standard sweeps files
(i.e. the entries in each row of the extra sweeps files correspond to the entries
in each row of the standard sweeps files, which can be verified using ``RELEASE``,
``BRICKID`` and ``OBJID``).


Photo-z sweeps (9.1-photo-z/sweep-<brickmin>-<brickmax>-pz.fits)
----------------------------------------------------------------

.. note::
   In July of 2023, the photometric redshift sweeps were updated to the version detailed
   in `Zhou et al. (2023; in preparation)`_. The older versions, from `Zhou et al. (2021)`_, which we
   `have retained`_, were stored in the ``9.0-photo-z`` directory. The older and newer photometric
   redshift sweeps are both based on the same, ``9.0``, versions of the sweep catalogs. But the newer
   photometric redshift sweeps are stored in the ``9.1-photo-z`` directory
   to distinguish them from the older versions.

The photometric redshift (photo-z)
sweeps catalogs are row-by-row-matched to the DR9 sweep catalogs as described above for the
other types of sweeps files.

The photometric redshifts are computed using a random forest algorithm.
Details of the photo-z training and performance can be found in `Zhou et al. (2023; in preparation)`_.
For computing the photo-z's, we require at least one exposure in
:math:`g`, :math:`r` and :math:`z` bands (``NOBS_G,R,Z>1``).
For objects that do not meet the ``NOBS`` cut,
the photo-z values are filled with -99.

Although we provide photo-z's for all
objects that meet the ``NOBS`` cut, the brightest objects have the most reliable
photo-z's. As a rule of thumb, objects brighter than :math:`z`-band magnitude of 21
are mostly reliable, whereas fainter objects are increasingly unreliable with
increasingly large systematic offsets. The overall performance of the photometric
redshifts compared to a range of spectroscopic surveys are available for both
the `northern`_ and `southern`_ regions of the legacy surveys imaging.

.. _`northern`: ../../files/pz_vs_sz_north.pdf
.. _`southern`: ../../files/pz_vs_sz_south.pdf

The photo-z catalogs do not provide information on star-galaxy separation.
Stars are excluded from the photo-z training data, and we do not attempt to
identify stars. To perform star-galaxy separation, one can use the
morphological ``TYPE`` and/or the photometry (*e.g.*, the optical-WISE
color cut, as applied in  `Zhou et al. 2021`_, can be very effective for selecting redshift |gtapprox| 0.3 galaxies) in the sweep catalogs.

================= ========== ==========================================================================
Name              Type       Description
================= ========== ==========================================================================
``RELEASE``	  int16      Integer denoting the camera and filter set used, which will be unique for a given processing run of the data (`RELEASE is documented here`_)
``BRICKID``       int32      A unique Brick ID (in the range [1, 662174])
``OBJID``         int32      Catalog object number within this brick; a unique identifier hash is ``RELEASE,BRICKID,OBJID``; ``OBJID`` spans [0,N-1] and is contiguously enumerated within each blob
``Z_PHOT_MEAN``   float32    photo-z derived from the mean of the photo-z PDF
``Z_PHOT_MEDIAN`` float32    photo-z derived from the median of the photo-z PDF
``Z_PHOT_STD``    float32    standard deviation of the photo-z's derived from the photo-z PDF
``Z_PHOT_L68``    float32    lower bound of the 68% confidence region, derived from the photo-z PDF
``Z_PHOT_U68``    float32    upper bound of the 68% confidence region, derived from the photo-z PDF
``Z_PHOT_L95``    float32    lower bound of the 95% confidence region, derived from the photo-z PDF
``Z_PHOT_U95``    float32    upper bound of the 68% confidence region, derived from the photo-z PDF
``Z_SPEC``        float32    spectroscopic redshift, if available
``SURVEY``        char[10]   source of the spectroscopic redshift
``TRAINING``      boolean    whether or not the spectroscopic redshift is used in photometric redshift training
``KFOLD``         int16      index of the subset in the 10-fold cross-validation
================= ========== ==========================================================================

Work which uses this photometric redshift catalog should cite `Zhou et al. (2023; in preparation)`_
and include the `additional acknowledgment for photometric redshifts`_.

.. _`additional acknowledgment for photometric redshifts`: ../../acknowledgment/#photometric-redshifts
.. _`Zhou et al. (2021)`: https://ui.adsabs.harvard.edu/abs/2021MNRAS.501.3309Z/abstract
.. _`Zhou et al. 2021`: https://ui.adsabs.harvard.edu/abs/2021MNRAS.501.3309Z/abstract
.. _`Zhou et al. (2023)`: https://ui.adsabs.harvard.edu
.. _`Zhou et al. (2023; in preparation)`: ./#photo-z-sweeps-9-1-photo-z-sweep-brickmin-brickmax-pz-fits
.. _`Zhou et al. 2023`: https://ui.adsabs.harvard.edu
.. _`have retained`: ../oldphotozs

Foreground object masks (``masking/*``)
=======================================

The foreground object masks were used to set the ``BRIGHT``, ``MEDIUM``, ``GALAXY`` and ``CLUSTER`` bits
described on the `DR9 bitmasks page`_. Files in the ``masking`` directory other than **gaia-mask-dr9.fits.gz**
are generally described as part the overview of the `external catalogs used for masking`_, and have data models
that are detailed as part of the `Siena Galaxy Atlas (SGA)`_.

gaia-mask-dr9.fits.gz
---------------------

A FITS binary table with a single HDU containing information about the `Tycho-2`_ and `Gaia`_ DR2 stars used to
set the ``BRIGHT`` and ``MEDIUM`` bits described on the `DR9 bitmasks page`_. See also the general overview of
the `external catalogs used for masking`_.

.. _`external catalogs used for masking`: ../external/#external-catalogs-used-for-masking
.. _`Siena Galaxy Atlas (SGA)`: ../../sga/sga2020

===================================== ======= ================== ========================
Name                                  Type    Units              Description
===================================== ======= ================== ========================
``ra``                                float64 deg                Right ascension from the `Gaia`_ DR2 or `Tycho-2`_ catalog
``dec``                               float64 deg                Declination from the `Gaia`_ DR2 or `Tycho-2`_ catalog
``ref_cat``                           char[2]                    Reference catalog source for this star: "T2" for `Tycho-2`_, "G2" for `Gaia`_ DR2
``ref_id``                            int64                      Reference catalog identifier for this star; Tyc1*1,000,000+Tyc2*10+Tyc3 for `Tycho-2`_; "sourceid" for `Gaia`_ DR2
``ref_epoch``                         float32 yr                 Reference catalog reference epoch (eg, 2015.5 for `Gaia`_ DR2)
``mag``                               float32 mag                Gaia G-band mag for `Gaia`_ DR2; V_T for `Tycho-2`_ when available, otherwise `Hipparcos`_ magnitude
``mask_mag``                          float32 mag                Magnitude used for masking: the lesser of ``mag`` or (``zguess`` + 1)
``radius``                            float32 deg                Masking radius
``radius_pix``                        int64   pix                Masking radius in 0.262 arcsec "brick" pixels
``pmra``                              float32 mas/yr             Reference catalog proper motion in RA direction (:math:`\mu_\alpha^*\equiv\mu_\alpha\cos\delta`) in the ICRS at ``ref_epoch``
``pmdec``                             float32 mas/yr             Reference catalog proper motion in Dec direction (:math:`\mu_\delta`) in the ICRS at ``ref_epoch``
``parallax``                          float32 mas                Reference catalog parallax
``ra_ivar``                           float32 1/deg\ |sup2|      Inverse variance of RA (no cosine term!), excluding astrometric calibration errors
``dec_ivar``                          float32 1/deg\ |sup2|      Inverse variance of DEC, excluding astrometric calibration errors
``pmra_ivar``                         float32 1/(mas/yr)\ |sup2| Reference catalog inverse-variance on ``pmra``
``pmdec_ivar``                        float32 1/(mas/yr)\ |sup2| Reference catalog inverse-variance on ``pmdec``
``parallax_ivar``                     float32 1/mas\ |sup2|      Reference catalog inverse-variance on ``parallax``
``in_desi``                           boolean                    In the DESI footprint?
``istycho``                           boolean                    From, or was matched to, the `Tycho-2`_ catalog?
``isgaia``                            boolean                    From, or was matched to, the `Gaia`_ DR2 catalog?
``isbright``                          boolean                    Is a ``BRIGHT`` star? ``BRIGHT`` stars are all `Tycho-2`_ stars, plus `Gaia`_ DR2 stars with ``mask_mag`` < 13 (see also the `DR9 bitmasks page`_)
``ismedium``                          boolean                    Is a ``MEDIUM`` star? ``MEDIUM`` stars are `Gaia`_ DR2 stars with ``mask_mag`` < 16 (see also the `DR9 bitmasks page`_)
``pointsource``                       boolean                    Does the star pass the Legacy Surveys `Gaia`_ DR2 point source cut?
``donotfit``                          boolean                    Does the object match an `SGA`_ galaxy? If ``True`` then the object will appear in the `Tractor catalogs`_ as a "DUP" source.
``decam_mag_g``                       float32 mag                The estimated DECam :math:`g` magnitude for `Gaia`_ DR2 stars based on the :math:`G` and :math:`Bp-Rp` color
``decam_mag_r``                       float32 mag                The estimated DECam :math:`r` magnitude for `Gaia`_ DR2 stars based on the :math:`G` and :math:`Bp-Rp` color
``decam_mag_z``                       float32 mag                The estimated DECam :math:`z` magnitude for `Gaia`_ DR2 stars based on the :math:`G` and :math:`Bp-Rp` color
``zguess``                            float32 mag                The estimated :math:`z` magnitude for `Tycho-2`_ stars from matching to `2MASS`_ and estimating :math:`V` to :math:`z` transformations based on `APASS`_.
``brickname``                         char[8]                    Name of brick, encoding the brick sky position, eg "1126p222" near RA=112.6, Dec=+22.2
``ibx``                               int32                      Integer brick pixel X coordinate (0-indexed) of this star
``iby``                               int32                      Integer brick pixel Y coordinate (0-indexed) of this star
``gaia_phot_g_mean_mag``              float32 mag                `Gaia`_ G band magnitude
``gaia_phot_g_mean_flux_over_error``  float32 	      	         `Gaia`_ G band signal-to-noise
``gaia_phot_g_n_obs``                 int16 	      	      	 `Gaia`_ G band number of observations
``gaia_phot_bp_mean_mag``             float32 mag     	      	 `Gaia`_ BP magnitude
``gaia_phot_bp_mean_flux_over_error`` float32 	      	      	 `Gaia`_ BP signal-to-noise
``gaia_phot_bp_n_obs``                int16 	      	      	 `Gaia`_ BP number of observations
``gaia_phot_rp_mean_mag``             float32 mag      	      	 `Gaia`_ RP magnitude
``gaia_phot_rp_mean_flux_over_error`` float32 	      	      	 `Gaia`_ RP signal-to-noise
``gaia_phot_rp_n_obs``                int16 	      	      	 `Gaia`_ RP number of observations
``gaia_phot_variable_flag``           boolean 	      	      	 `Gaia`_ photometric variable flag
``gaia_astrometric_excess_noise``     float32 	      	      	 `Gaia`_ astrometric excess noise
``gaia_astrometric_excess_noise_sig`` float32 	      	      	 `Gaia`_ astrometric excess noise uncertainty
``gaia_astrometric_n_obs_al``         int16 	      	      	 `Gaia`_ number of astrometric observations along scan direction
``gaia_astrometric_n_good_obs_al``    int16 	      	      	 `Gaia`_ number of good astrometric observations along scan direction
``gaia_astrometric_weight_al``        float32 	      	      	 `Gaia`_ astrometric weight along scan direction
``gaia_duplicated_source``            boolean 	      	      	 `Gaia`_ duplicated source flag
``gaia_a_g_val``                      float32 mag      	      	 `Gaia`_ line-of-sight extinction in the G band
``gaia_e_bp_min_rp_val``              float32 mag      	      	 `Gaia`_ line-of-sight reddening E(BP-RP)
``gaia_phot_bp_rp_excess_factor``     float32 	      	      	 `Gaia`_ BP/RP excess factor
``gaia_astrometric_sigma5d_max``      float32 mas   	      	 `Gaia`_ longest semi-major axis of the 5-d error ellipsoid
``gaia_astrometric_params_solved``    uint8 	      	      	 which astrometric parameters were estimated for a `Gaia`_ source
===================================== ======= ================== ========================

.. _`catalog`: http://vizier.u-strasbg.fr/viz-bin/VizieR?-source=J%2FA%2BA%2F413%2F771
.. _`Metz & Geffert (2004)`: https://www.aanda.org/articles/aa/pdf/2004/02/aah4555.pdf
.. _`APASS`: https://www.aavso.org/apass
.. _`2MASS`: https://www.ipac.caltech.edu/project/2mass
.. _`Hipparcos`: https://heasarc.gsfc.nasa.gov/W3Browse/all/hipparcos.html
.. _`Tractor catalogs`: ../catalogs

Image Stacks (``<region>/coadd/*``)
===================================

Image stacks are on tangent-plane (WCS TAN) projections, 3600 |times| 3600 pixels, at 0.262 arcseconds per pixel.

- <AAA>/<brick>/legacysurvey-<brick>-blobmodel-<filter>.fits.fz
    The Tractor's model prediction of the images, similar to ``<AAA>/<brick>/legacysurvey-<brick>-model-<filter>.fits.fz``, below,
    except that the models are `clipped to the blobs within which they are measured`. In other words, the models used to derive the
    maps in these files are not extrapolated beyond the pixels in the blobs that are used to fit the models.

- <AAA>/<brick>/legacysurvey-<brick>-ccds.fits
    FITS binary table with the list of CCD images that were used in this brick.
    Contains the same columns as **survey-ccds-<camera>-dr9.fits.gz**, and also contains
    the additional columns listed below. Note that string columns can have different lengths in the **survey-ccds-<camera>-dr9.fits.gz**
    and **legacysurvey-<brick>-ccds.fits** files and can differ for ``<region>`` equal to ``<north>`` and ``<south>``.
    For example the ``camera`` column can change from ``char[7]`` to ``char[5]`` (see, e.g. `legacypipe issue #379`_).

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
    ``co_sky``       float32
    ================ ========= ======================================================

.. _`legacypipe issue #379`: https://github.com/legacysurvey/legacypipe/issues/379

- <AAA>/<brick>/legacysurvey-<brick>-chi2-<filter>.fits.fz
    Stacked |chi|\ |sup2| image, which is approximately the summed |chi|\ |sup2| values from the single-epoch images.

- <AAA>/<brick>/legacysurvey-<brick>-depth-<filter>.fits.fz
    Stacked depth map in units of the point-source flux inverse-variance at each pixel.

    - The 5\ |sigma| point-source depth can be computed as :math:`5 / \sqrt(\mathrm{depth\_ivar})` .

- <AAA>/<brick>/legacysurvey-<brick>-galdepth-<filter>.fits.fz
    Stacked depth map in units of the canonical galaxy flux inverse-variance at each pixel.
    The canonical galaxy is an exponential profile with effective radius 0.45" and round shape.

    - The 5\ |sigma| galaxy depth can be computed as :math:`5 / \sqrt(\mathrm{galdepth\_ivar})` .

- <AAA>/<brick>/legacysurvey-<brick>-image-<filter>.fits.fz
    Stacked image centered on a brick location covering 0.25\ |deg| |times| 0.25\
    |deg|.  The primary HDU contains the coadded image (inverse-variance weighted coadd), in
    units of nanomaggies per pixel.

    - NOTE: These are not the images used by Tractor, which operates on the
      single-epoch images.

    - NOTE: These images are resampled using Lanczos-3 resampling.

    - NOTE: Images in WISE bands are on the Vega system, all other flux-related quantities
      in DR9 are reported on the AB system. The `description`_ page lists
      the Vega-to-AB conversions `recommended by the WISE team`_.

.. _`description`: ../description/#photometry
.. _`recommended by the WISE team`: http://wise2.ipac.caltech.edu/docs/release/allsky/expsup/sec4_4h.html#conv2ab

- <AAA>/<brick>/legacysurvey-<brick>-invvar-<filter>.fits.fz
    Inverse variance image corresponding to the legacysurvey-<brick>-image-<filter>.fits.fz file based on the sum of the
    inverse-variances of the individual input images in units of 1/(nanomaggies)\
    |sup2| per pixel.

    - NOTE: These are not the inverse variance maps used by Tractor, which operates
      on the single-epoch images.

    - NOTE: Images in WISE bands are on the Vega system, all other flux-related quantities
      in DR9 are reported on the AB system. The `description`_ page lists
      the Vega-to-AB conversions `recommended by the WISE team`_.

- <AAA>/<brick>/legacysurvey-<brick>-maskbits.fits.fz
    Bitmask of possible problems with pixels in this brick.

    - HDU1: The optical bitmasks, corresponding to ``MASKBITS`` on the `DR9 bitmasks page`_.
    - HDU2: The WISE W1 bitmasks, corresponding to ``WISEMASK_W1`` on the `DR9 bitmasks page`_.
    - HDU3: The WISE W2 bitmasks, corresponding to ``WISEMASK_W2`` on the `DR9 bitmasks page`_.

- <AAA>/<brick>/legacysurvey-<brick>-model-<filter>.fits.fz
    Stacked model image centered on a brick location covering 0.25\ |deg| |times| 0.25\ |deg|.

    - The Tractor's idea of what the coadded images should look like; the Tractor's model prediction.

    - NOTE: Images in WISE bands are on the Vega system, all other flux-related quantities
      in DR9 are reported on the AB system. The `description`_ page lists
      the Vega-to-AB conversions `recommended by the WISE team`_.

- <AAA>/<brick>/legacysurvey-<brick>-nexp-<filter>.fits.fz
    Number of exposures contributing to each pixel of the stacked images.

- <AAA>/<brick>/legacysurvey-<brick>-psfsize-<filter>.fits.fz
    `Weighted average PSF FWHM`_ in arcsec at each pixel of the stacked images.

- <AAA>/<brick>/legacysurvey-<brick>-blobmodel.jpg
    JPEG image of the Tractor's model images, where the model fits have been clipped to
    the blobs within which the models are measured. Uses the :math:`g,r,z` filters as the colors.

- <AAA>/<brick>/legacysurvey-<brick>-image.jpg
    JPEG image of the calibrated image using the :math:`g,r,z` filters as the colors.

- <AAA>/<brick>/legacysurvey-<brick>-model.jpg
    JPEG image of the Tractor's model image using the :math:`g,r,z` filters as the colors.

- <AAA>/<brick>/legacysurvey-<brick>-resid.jpg
    JPEG image of the residual image (data minus model) using the :math:`g,r,z` filters as
    the colors.

- <AAA>/<brick>/legacysurvey-<brick>-wise.jpg
    JPEG image of the calibrated image using the WISE filters as the colors.

- <AAA>/<brick>/legacysurvey-<brick>-wisemodel.jpg
    JPEG image of the model image using the WISE filters as the colors.

.. _`Weighted average PSF FWHM`: https://github.com/legacysurvey/legacypipe/blob/ddb05a39b739917d0b03b0cdfd5afccf907a0c7f/py/legacypipe/coadds.py#L466

Forced Photometry Files (``forced-ccd/*`` and ``forced-brick/*``)
=================================================================

.. _`catalog description`: ../catalogs
.. _`BASS`: ../../bass
.. _`MzLS`: ../../mzls

Files in this directory contain *forced photometry* results, for all CCDs that
were included in the DR9 processing.

After we produce the catalogs based on fitting to all images
simultaneously, we go back to the individual CCDs, select the catalog
objects that overlap, and ask what fluxes those objects should have to
best match what is observed in the CCD. The positions and shapes of the stars
and galaxies are held fixed, which is why it is called "forced"; only the fluxes are fit.
When selecting objects from
the catalog, we *resolve* the north and south components using the
same cut as in the sweep files and randoms.

We perform two fits. The first is regular forced photometry, where
the position and profile of the sources are fixed, and all we are
fitting is the flux. In the second fit, we compute the
source-centered spatial derivatives and fit the amplitudes of those
derivatives as well. For sources moving less than a pixel or two,
this produces an approximate estimate of the motion of the source (``dra`` and ``ddec``).
Note that for Gaia sources, this is relative to the Gaia measured
proper motion!

We provide these results organized in two ways.  The first is
exposure-based (each file contains measurements for all the sources
that appear in the CCDs of a single exposure), and the second is
brick-based (each file contains all the sources within a brick,
gathering up measurements from all the CCDs that overlap the brick).

- forced-ccd/<camera>/<EXPOS>/forced-<camera>-<EXPOSURE>.fits
    Where <camera> is one of ``90prime`` for `BASS`_, ``decam`` for
    `DECaLS`_ or ``mosaic`` for `MzLS`_, <EXPOSURE> is the exposure
    number (not necessarily as an 8-character string, unlike some other data
    products), and <EXPOS> is the first 5 characters of the exposure
    number printed as an 8-character string.

    This file contains a single FITS binary table for all the CCDs in
    this exposure, contatenated into one long table.

    For the columns pertaining to the catalog objects, see the
    `catalog description`_ page.

    ================ ========== ======================================================
    Column           Type       Description
    ================ ========== ======================================================
    ``release``      int16      Integer denoting the camera and filter set used, which will be unique for a given processing run of the data (`release is documented here`_)
    ``brickid``      int32      Unique Brick ID (in the range [1, 662174]) that the catalog object came from
    ``brickname``    char[8]    Name of brick, encoding the brick sky position, eg "1126p222" near RA=112.6, Dec=+22.2, of the catalog object
    ``objid``        int32      Catalog object number within this brick; a unique identifier hash is ``release,brickid,objid``
    ``camera``       char[7]    The camera for the CCD being measured, eg "decam"
    ``expnum``       int64      The exposure number of the CCD being measured, eg 574299
    ``ccdname``      char[4]    The name of the CCD being measured, eg "N10" or "CCD4"
    ``filter``       char[1]    The filter of the CCD being measured ("g", "r" or "z")
    ``mjd``          float64    The Modified Julian Date when the exposure was taken, in UTC, eg 57644.31537588
    ``exptime``      float32    The exposure time in seconds, eg 90.0
    ``psfsize``      float32    PSF FWHM in this exposure, in arcsec
    ``ccd_cuts``     int64      Bit mask describing CCD image quality (see the `DR9 bitmasks page`_)
    ``airmass``      float32    Airmass of this observation
    ``sky``          float32    Sky background surface brightness, in nanomaggies/arcsec\ |sup2|
    ``psfdepth``     float32    Inverse-variance for the flux measured from a point source; for a :math:`5\sigma` point source detection limit use :math:`5/\sqrt(\mathrm{psfdepth})` for the flux in nanomaggies and :math:`-2.5[\log_{10}(5 / \sqrt(\mathrm{psfdepth})) - 9]` for the corresponding AB magnitude
    ``galdepth``     float32    Inverse-variance for the flux measured from a nominal galaxy source (0.45" round exponential galaxy)
    ``ra``           float64    Right Ascension in degrees
    ``dec``          float64    Declination in degrees
    ``flux``         float32    Measured flux for this catalog object in this CCD, in nanomaggies
    ``flux_ivar``    float32    Inverse-variance of the `flux` measurement, in 1/nanomaggies\ |sup2|
    ``fracflux``     float32    Profile-weighted fraction of the flux from other sources over total flux
    ``rchisq``       float32    Profile-weighted |chi|\ |sup2| residual chi-squared per pixel
    ``fracmasked``   float32    Profile-weighted fraction of pixels masked
    ``apflux``       float32[8] Aperture fluxes in this CCD, in nanomaggies, for aperture radii [0.5, 0.75, 1.0, 1.5, 2.0, 3.5, 5.0, 7.0] arcsec
    ``apflux_ivar``  float32[8] Inverse-variance on `apflux`, in 1/nanomaggies\ |sup2|
    ``x``            float32    Horizontal pixel position of the catalog source in this CCD, in zero-indexed pixels
    ``y``            float32    Vertical pixel position of the catalog source in this CCD, in zero-indexed pixels
    ``dqmask``       int16      Data Quality mask from the CP pipeline for the center pixel (defined as for ``ALLMASK/ANYMASK`` on the `DR9 bitmasks page`_)
    ``dra``          float32    When fitting for spatial derivatives, the motion of the source in the RA direction, in arcsec
    ``ddec``         float32    Motion of the source in the Dec direction, in arcsec
    ``dra_ivar``     float32    Inverse-variance on ``dra``, in 1/arcsec|sup2|
    ``ddec_ivar``    float32    Inverse-variance on ``ddec``, in 1/arcsec|sup2|
    ================ ========== ======================================================

- forced-brick/<AAA>/forced-<brick>.fits.gz
    Where ``<AAA>`` are the first three characters of the brick name,
    ie, the RA angle, and ``<brick>`` is the brick name.

    These files contain two tables.  The first lists the catalog objects contained
    in the file, and gives the indices in the second table of the measurements for
    that source.

    Note that the forced photometry was performed on a *resolved* combination of the
    *north* and *south* surveys, so the ``forced-brick`` product for the ``north``
    will contain measurements of northern CCDs, but *catalog entries* that may have been
    detected in the north or south.

    ================ ========= ======================================================
    Column           Type      Description
    ================ ========= ======================================================
    ``release``      int16     Integer denoting the camera and filter set used, which will be unique for a given processing run of the data
    ``brickid``      int32     Brick ID [1,662174]
    ``objid``        int32     Catalog object number within this brick; a unique identifier hash is ``release,brickid,objid``;  ``objid`` spans [0,N-1] and is contiguously enumerated within each brick
    ``nobs_g``       int32     Number of forced-photometry measurements in the :math:`g` band.
    ``index_g``      int32     Starting index in the second table of the :math:`g` band measurements.
    ``nobs_r``       int32     Number of forced-photometry measurements in the :math:`r` band.
    ``index_r``      int32     Starting index in the second table of the :math:`r` band measurements.
    ``nobs_z``       int32     Number of forced-photometry measurements in the :math:`z` band.
    ``index_z``      int32     Starting index in the second table of the :math:`z` band measurements.
    ================ ========= ======================================================

    The second HDU has exactly the same format as the ``forced-ccd`` table described above.

Other Files
===========

Much additional information is available as part of the `DESI`_ Legacy Imaging Surveys Data Releases, including, in separate directories,
statistics of the Tractor fits (``<region>/metrics``), CCD-level masks of outlier pixels (``<region>/outlier-masks``),
code outputs from the fitting processes (``<region>/logs``) and additional files
detailing the calibrations (``calib``).
We don't expect that most users will need a description of these files, but `contact`_ us if you require more information.

.. _`contact`: ../../contact
.. _`DESI`: https://desi.lbl.gov
.. _`plprocid page`: ../../plprocid

Raw Data
========

See the `raw data page`_.

.. _`raw data page`: ../../rawdata

|

**Footnotes**

.. [#] The ``cosky_x`` (where ``x`` :math:`= g, r` or :math:`z`) level is subtracted from each individual exposure (and hence also from the coadd) for the corresponding filter.
.. [#] The Astro Data Lab is part of the Community Science and Data Center (CSDC) of NSF's National Optical Infrared Astronomy Research Laboratory.
