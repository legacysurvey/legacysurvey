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
  http://portal.nersc.gov/project/cosmo/data/legacysurvey/dr4/

Top level directory local to NERSC computers (for collaborators):
  /global/project/projectdirs/cosmo/data/legacysurvey/dr4/

Summary Files
=============

survey-bricks.fits.gz
---------------------

FITS binary table with the RA, DEC bounds of each geometrical "brick" on the sky.
This includes all bricks on the sky, not just the ones in our footprint or with
coverage in DR4.  For that information, see the next file description.

- HDU1 (only HDU) - tags in the ``survey-bricks.fits.gz`` file

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
``RA1``         float64  Lower RA boundary.
``RA2``         float64  Upper RA boundary.
``DEC1``        float64  Lower Dec boundary.
``DEC2``        float64  Upper Dec boundary.
=============== ======= ======================================================

survey-bricks-dr4.fits.gz
--------------------------

A FITS binary table with information that summarizes the contents of each brick for DR4.

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
``nsimp``       int16      Total number of ``BRICK_UNIQUE`` objects in this brick, of type ``SIMP``
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
``ebv``         float32    Median SFD dust map E(B-V) extinction, in magnitudes, evaluated at ``BRICK_UNIQUE`` objects in this brick
``trans_g``     float32    Median Milky Way dust transparency in :math:`g`-band, based on ``ebv``. See also ``MW_TRANSMISSION_G``
``trans_r``     float32    Median Milky Way dust transparency in :math:`g`-band, based on ``ebv``. See also ``MW_TRANSMISSION_R``
``trans_z``     float32    Median Milky Way dust transparency in :math:`z`-band, based on ``ebv``. See also ``MW_TRANSMISSION_Z``
``ext_g``       float32    Extinction (calculated, for DR4, assuming BASS and MzLS are on the DECam filter system) in :math:`g`-band
``ext_r``       float32    Extinction (calculated, for DR4, assuming BASS and MzLS are on the DECam filter system) in :math:`r`-band
``ext_z``       float32    Extinction (calculated, for DR4, assuming BASS and MzLS are on the DECam filter system) in :math:`z`-band
``wise_nobs``   int16[4]   Number of images that contributed to WISE calculations in each filter (not profile-weighted)
``trans_wise``  float32[4] Median Milky Way dust transparency in WISE bands, based on ``ebv``. See also, e.g., ``MW_TRANSMISSION_W1``
``ext_w1``      float32    Extinction in :math:`W1`-band
``ext_w2``      float32    Extinction in :math:`W2`-band
``ext_w3``      float32    Extinction in :math:`W3`-band
``ext_w4``      float32    Extinction in :math:`W4`-band
=============== ========== =========================================================================

Note that, for the ``nexphist`` rows, pixels that are masked by the NOAO Community Pipeline as, e.g., cosmic rays or saturation, do NOT count toward the number of exposures. More information about the morphological types and ``MW_TRANSMISSION`` can be found on the `catalogs page`_.

.. _`catalogs page`: ../catalogs
.. _`github`: https://github.com

survey-ccds-bass.fits.gz and survey-ccds-mzls.fits.gz
------------------------------------------------------

FITS binary tables with almanac information (e.g. seeing, etc.) about each individual CCD image for
`BASS`_ and `MzLS`_, respectively.

These files contain information regarding the photometric and astrometric zero points for each CCD of every Legacy Survey image that is part of DR4. Photometric zero points for each CCD are computed by identifying stars and comparing their instrumental magnitudes (measured in an approximately 7 arcsec diameter aperture) to color-selected stars in Pan-STARRS, as outlined further on the `description page`_.

The photometric zeropoints (``zpt``, ``ccdzpt``, etc)
are magnitude-like numbers (e.g. 25.04), and
indicate the magnitude of a source that would contribute one count per
second to the image.  For example, in an image with zeropoint of 25.04
and exposure time of 30 seconds, a source of magnitude 22.5 would
contribute
:math:`30 * 10^{((25.04 - 22.5) / 2.5)} = 311.3`
counts.


.. _`BASS`: ../../bass  
.. _`MzLS`: ../../mzls
.. _`description page`: ../description

==================== ========== =======================================================
Column               Type       Description
==================== ========== =======================================================
``object``           char[24]   Name listed in the object tag from the CCD header
``expnum``           int32      Exposure number, eg 348224
``exptime``          float32    Exposure time in seconds, eg 30
``filter``           char[1]    Filter used for observation, eg ":math:`g`", ":math:`r`", ":math:`z`"
``seeing``           float32    Seeing in arcseconds determined by fitting a 2-dimensional gaussian to the median PSF of stars on the CCD, eg 1.1019
``date_obs``         char[10]   Date of observation start, eg "2014-08-15".  Can be combined with ``ut``, or use ``mjd_obs`` instead
``mjd_obs``          float64    Date of observation in MJD (in UTC system), eg 56884.99373389
``ut``               char[12]   Time of observation start, eg "23:50:58.608241"
``ha``               char[12]   Hour angle of the observation (HH:MM:SS)  
``airmass``          float32    Airmass, eg 1.35
``propid``           char[12]   NOAO Proposal ID that took this image, eg "2014B-0404"
``zpt``              float32    Median zero point for the entire image (median of all CCDs of the image), eg 25.0927
``avsky``            float32    Average sky level in this image, in ADU, eg 36.9324. ``avsky`` is `detailed more here`_
``arawgain``         float32    Average gain for this CCD, eg 4.34
``fwhm``             float32    (use "seeing" instead)
``crpix1``           float32    Astrometric header value: X reference pixel
``crpix2``           float32    Astrometric header value: Y reference pixel
``crval1``           float64    Astrometric header value: RA of reference pixel
``crval2``           float64    Astrometric header value: Dec of reference pixel
``cd1_1``            float32    Astrometric header value: transformation matrix
``cd1_2``            float32    Astrometric header value: transformation matrix
``cd2_1``            float32    Astrometric header value: transformation matrix
``cd2_2``            float32    Astrometric header value: transformation matrix
``ccdnum``           int16      CCD number (see Legacy Survey camera layout), eg 1
``ccdname``          char[4]    CCD name (see Legacy Survey camera layout), eg "N10", "S7"
``ccdzpt``           float32    Zeropoint for the CCD (AB mag)
``ccdzpta``          float32    Zeropoint for amp A (AB mag)
``ccdzptb``          float32    Zeropoint for amp B (AB mag)
``ccdzptc``          float32    Zeropoint for amp C (AB mag)
``ccdzptd``          float32    Zeropoint for amp D (AB mag)
``ccdphoff``         float32    (ignore; depends on the nominal zeropoint, measured at the start of each survey rather than now)
``ccdphrms``         float32    Photometric rms for the CCD (in mag)
``ccdskyrms``        float32    Sky rms (in counts)
``ccdskymag``        float32    Mean sky background in AB mag/arcsec\ :sup:`2` on each CCD; measured from the CP-processed frames as -2.5*alog10(``ccdskycounts``/``pixscale``/``pixscale``/``exptime``) + ``ccdzpt``
``ccdskycounts``     float32    Mean sky count level per pixel in the CP-processed frames measured (with iterative rejection) for each CCD in the image section [500:1500,1500:2500]
``ccdraoff``         float32    Median astrometric offset for the CCD <GAIA-Legacy Survey> in arcsec
``ccddecoff``        float32    Median astrometric offset for the CCD <GAIA-Legacy Survey> in arcsec
``ccdrarms``	     float32    rms in astrometric offset for the CCD <GAIA-Legacy Survey> in arcsec   
``ccddecrms``	     float32    rms in astrometric offset for the CCD <GAIA-Legacy Survey> in arcsec
``ccdtransp``        float32    (ignore; depends on the nominal zeropoint, measured at the the start of survey rather than now)
``ccdnstar``         int16      Number of stars found on the CCD
``ccdnmatch``        int16      Number of stars matched to Pan-STARRS (and used to compute the photometric zero points)
``ccdnmatcha``       int16      Number of stars in amp A matched
``ccdnmatchb``       int16      Number of stars in amp B matched
``ccdnmatchc``       int16      Number of stars in amp C matched
``ccdnmatchd``       int16      Number of stars in amp D matched
``ccdmdncol``        float32    Median (g-i) color from the PS1 catalog of the matched stars
``psfab``	     float32    (ignore)
``psfpa``	     float32    (ignore)
``temp``             float32    Outside temperature in :sup:`o`\ C listed in the ``OUTTEMP`` tag in the CCD image header
``badimg``	     int16      (ignore)
``camera``           char[7]    The camera that took this image
``expid``            char[15]   Exposure ID string, eg "00348224-S29" (from ``expnum`` and ``ccdname``)
``image_hdu``        int16      FITS HDU number in the ``image_filename`` file where this image can be found
``image_filename``   char[55]   Path to FITS image, eg "decam/CP20140810_g_v2/c4d_140815_235218_ooi_g_v2.fits.fz"
``width``            int16      Width in pixels of this image, eg 2046
``height``           int16      Height in pixels of this image, eg 4096
``ra_bore``          float64    Telescope boresight RA  of this exposure (deg)
``dec_bore``         float64    Telescope boresight Dec of this exposure (deg)
``ra``               float64    Approximate RA center of this CCD (deg)
``dec``              float64    Approximate Dec center of this CCD (deg)
``photometric``      boolean    True if this CCD was considered photometric and used in the DR4 reductions
``bitmask``	     uint8      `bitmask is documented here`_
``telfocus``	     float32[3] (ignore)
==================== ========== =======================================================

.. _`detailed more here`: ../../avsky
.. _`ordering of the CCD corners is detailed here`: ../../ccdordering
.. _`bitmask is documented here`: ../../bitmask

ccds-annotated-dr4-90prime.fits.gz and ccds-annotated-dr4-mzls.fits.gz
----------------------------------------------------------------------

Versions of the survey-ccds* files for `BASS`_ and `MzLS`_, respectively. These files contain additional information
gathered during calibration pre-processing before running the Tractor reductions.

Includes everything listed in the survey-ccds* files plus the following:

==================== ========== ======================================================
Column               Type       Description
==================== ========== ======================================================
``ccd_cuts``         int32      (ignore)
``annotated``	     boolean    (ignore)
``good_region``      int16      If only a subset of the CCD images was used, this array of x0,x1,y0,y1 values gives the coordinates that were used, [x0,x1), [y0,y1).  -1 for no cut (most CCDs).
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
``sig1``             float32    Median per-pixel error standard deviation, in nanomaggies.
``meansky``          float32    Our pipeline (not the CP) estimate of the sky level, average over the image, in ADU.
``stdsky``           float32    Standard deviation of our sky level
``maxsky``           float32    Max of our sky level
``minsky``           float32    Min of our sky level
``pixscale_mean``    float32    Pixel scale (via sqrt of area of a 10x10 pixel patch evaluated in a 5x5 grid across the image), in arcsec/pixel.
``pixscale_std``     float32    Standard deviation of pixel scale
``pixscale_max``     float32    Max of pixel scale
``pixscale_min``     float32    Min of pixel scale
``psf_sampling``     float32    (ignore)
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
``tileid``           int32      tile number, 0 for data from programs other than MzLS or DECaLS
``tilepass``         uint8      tile pass number, 1, 2 or 3, if this was an MzLS or DECaLS observation, or 0 for data from other programs. Set by the observers (the meaning of ``tilepass`` is on the `status page`_)
``tileebv``          float32    Mean SFD E(B-V) extinction in the tile, 0 for data from programs other than BASS, MzLS or DECaLS
``plver``            char[6]    Community Pipeline (CP) PLVER version string
``ebv``              float32    SFD E(B-V) extinction for CCD center
``decam_extinction`` float32[6] Extinction for optical filters :math:`ugrizY`
``wise_extinction``  float32[4] Extinction for WISE bands W1,W2,W3,W4
``psfdepth``         float32    5-sigma PSF detection depth in AB mag, using PsfEx PSF model
``galdepth``         float32    5-sigma galaxy (0.45" round exp) detection depth in AB mag
``gausspsfdepth``    float32    5-sigma PSF detection depth in AB mag, using Gaussian PSF approximation (using ``seeing`` value)
``gaussgaldepth``    float32    5-sigma galaxy detection depth in AB mag, using Gaussian PSF approximation
==================== ========== ======================================================

.. _`status page`: ../../status

dr4-depth.fits.gz
-----------------

A concatenation of the depth histograms for each brick, from the
``coadd/*/*/*-depth.fits`` tables.  These histograms describe the
number of pixels in each brick with a 5-sigma AB depth in the given
magnitude bin.

dr4-depth-summary.fits.gz
-------------------------

A summary of the depth histogram of the whole DR4 survey.  FITS table with the following columns:

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

The depth histogram goes from magnitude of 20.1 to 24.9 in steps of
0.1 mag.  The first and last bins are "catch-all" bins: 0 to 20.1 and
24.9 to 100, respectively.  The histograms count the number of pixels
in each brick's unique area with the given depth.  These numbers can
be turned into values in square degrees using the brick pixel area of
0.262 arcseconds square.  These depth estimates take into account the
small-scale masking (cosmic rays, edges, saturated pixels) and
detailed PSF model.


External Files
==============

The Legacy Survey photometric catalogs have been matched to the following external spectroscopic files from the SDSS, which can be accessed through the web at:
  http://portal.nersc.gov/project/cosmo/data/legacysurvey/dr4/external/

Or on the NERSC computers (for collaborators) at:
  /global/project/projectdirs/cosmo/data/legacysurvey/dr4/external/

Each row of each external-match file contains the full record of the nearest object in our Tractored survey
imaging catalogs, matched at a radius of 1.0 arcsec. The structure of the imaging catalog files 
is documented on the `catalogs page`_. If no match is found, then ``OBJID`` is set to -1.

.. _`catalogs page`: ../catalogs

survey-dr4-specObj-dr13.fits
----------------------------
HDU1 (the only HDU) contains Tractored survey
photometry that is row-by-row-matched to the SDSS DR13 spectrosopic
pipeline file such that the photometric parameters in row "N" of 
survey-dr4-specObj-dr13.fits matches the spectroscopic parameters in row "N" of
specObj-dr13.fits. The spectroscopic file 
is documented in the SDSS DR13 `data model for specObj-dr13.fits`_.

.. _`data model for specObj-dr13.fits`: http://data.sdss3.org/datamodel/files/SPECTRO_REDUX/specObj.html

survey-dr4-dr12Q.fits
---------------------
HDU1 (the only HDU) contains Tractored survey
photometry that is row-by-row-matched to the SDSS DR12 
visually inspected quasar catalog (`Paris et al. 2016`_)
such that the photometric parameters in row "N" of 
survey-dr4-DR12Q.fits matches the spectroscopic parameters in row "N" of
DR12Q.fits. The spectroscopic file 
is documented in the SDSS DR12 `data model for DR12Q.fits`_.

.. _`Paris et al. 2016`: http://adsabs.harvard.edu/cgi-bin/bib_query?arXiv:1608.06483
.. _`data model for DR12Q.fits`: http://data.sdss3.org/datamodel/files/BOSS_QSO/DR12Q/DR12Q.html

survey-dr4-superset-dr12Q.fits
------------------------------
HDU1 (the only HDU) contains Tractored survey
photometry that is row-by-row-matched to the superset of all SDSS DR12 spectroscopically
confirmed objects that were visually inspected as possible quasars 
(`Paris et al. 2017`_) such that the photometric parameters in row "N" of 
survey-dr4-Superset_DR12Q.fits matches the spectroscopic parameters in row "N" of
Superset_DR12Q.fits. The spectroscopic file
is documented in the SDSS DR12 `data model for Superset_DR12Q.fits`_.

.. _`Paris et al. 2017`: http://adsabs.harvard.edu/abs/2017A%26A...597A..79P
.. _`data model for Superset_DR12Q.fits`: http://data.sdss3.org/datamodel/files/BOSS_QSO/DR12Q/DR12Q_superset.html

survey-dr4-dr7Q.fits
---------------------
HDU1 (the only HDU) contains Tractored survey
photometry that is row-by-row-matched to the SDSS DR7
visually inspected quasar catalog (`Schneider et al. 2010`_)
such that the photometric parameters in row "N" of
survey-dr4-DR7Q.fits matches the spectroscopic parameters in row "N" of
DR7qso.fit. The spectroscopic file
is documented on the `DR7 quasar catalog description page`_.

.. _`Schneider et al. 2010`: http://adsabs.harvard.edu/abs/2010AJ....139.2360S
.. _`DR7 quasar catalog description page`: http://classic.sdss.org/dr7/products/value_added/qsocat_dr7.html


Tractor Catalogs
================

In the file listings outlined below:

- brick names (**<brick>**) have the format `<AAAa>c<BBB>` where `A`, `a` and `B` are digits and `c` is either the letter `m` or `p` (e.g. `1126p222`). The names are derived from the RA,Dec center of the brick. The first four digits are :math:`int(RA * 10)`, followed by `p` to denote positive Dec or `m` to denote negative Dec ("plus"/"minus"), followed by three digits of :math:`int(Dec * 10)`. For example the case `1126p222` corresponds to RA,Dec = (112.6\ |deg|, +22.2\ |deg|). 

- **<brickmin>** and **<brickmax>** denote the corners of a rectangle in RA,Dec using the format outlined in the previous bullet point. For example `000m010-010m005` would correspond to a survey region limited by :math:`0^\circ \leq RA < 10^\circ` and :math:`-10^\circ \leq Dec < -5^\circ`.

- sub-directories are listed by the RA of the brick center, and sub-directory names (**<AAA>**) correspond to RA. For example `002` corresponds to brick centers between an RA of 2\ |deg| and an RA of 3\ |deg|.

- **<filter>** denotes the :math:`g`, :math:`r` or :math:`z` band, using the corresponding letter.

Note that it is not possible to go from a brick name back to an *exact* RA,Dec center (the bricks are not on 0.1\ |deg| grid lines). The exact brick center for a given brick name can be derived from columns in the `survey-bricks.fits.gz` file (i.e. ``brickname``, ``ra``, ``dec``).

tractor/<AAA>/tractor-<brick>.fits
----------------------------------

FITS binary table containing Tractor photometry, documented on the
`catalogs page`_. 

.. _`catalogs page`: ../catalogs

Users interested in database access to the Tractor Catalogs can contact the NOAO Data Lab at datalab@noao.edu.

Sweep Catalogs
==============

sweep/4.0/sweep-<brickmin>-<brickmax>.fits
------------------------------------------

The sweeps are light-weight FITS binary tables (containing a subset of the most commonly used
Tractor measurements) of all the Tractor catalogs for which ``BRICK_PRIMARY==T`` in rectangles of RA, Dec. Includes:

.. _`RELEASE is documented here`: ../../release

=============================== ============ ===================== ===============================================
Name                            Type         Units                 Description
=============================== ============ ===================== ===============================================
``RELEASE``                     int32                              Unique integer denoting the camera and filter set used (`RELEASE is documented here`_)
``BRICKID``                     int32                              Brick ID [1,662174]
``BRICKNAME``                   char[8]                            Name of brick, encoding the brick sky position, eg "1126p222" near RA=112.6, Dec=+22.2
``OBJID``                       int32                              Catalog object number within this brick; a unique identifier hash is BRICKID,OBJID;  OBJID spans [0,N-1] and is contiguously enumerated within each blob
``TYPE``                        char[4]                            Morphological model: "PSF"=stellar, "SIMP"="simple galaxy" = 0.45" round EXP galaxy, "EXP"=exponential, "DEV"=deVauc, "COMP"=composite.  Note that in some FITS readers, a trailing space may be appended for "PSF ", "EXP " and "DEV " since the column data type is a 4-character string
``RA``                          float64      deg                   Right ascension at equinox J2000
``DEC``                         float64      deg                   Declination at equinox J2000
``RA_IVAR``                     float32      1/deg\ |sup2|         Inverse variance of ``RA`` (no cosine term!), excluding astrometric calibration errors
``DEC_IVAR``                    float32      1/deg\ |sup2|         Inverse variance of ``DEC``, excluding astrometric calibration errors
``DCHISQ``                      float32[5]                         Difference in |chi|\ |sup2| between successively more-complex model fits: PSF, SIMPle, EXP, DEV, COMP.  The difference is versus no source.
``EBV``                         float32      mag                   Galactic extinction E(B-V) reddening from SFD98, used to compute ``MW_TRANSMISSION``
``FLUX_G``                      float32      nanomaggies           model flux in :math:`g`
``FLUX_R``                      float32      nanomaggies           model flux in :math:`r`
``FLUX_Z``                      float32      nanomaggies           model flux in :math:`z`
``FLUX_W1``                     float32      nanomaggies           WISE model flux in :math:`W1`
``FLUX_W2``                     float32      nanomaggies           WISE model flux in :math:`W2`
``FLUX_W3``                     float32      nanomaggies           WISE model flux in :math:`W3`
``FLUX_W4``                     float32      nanomaggies           WISE model flux in :math:`W4`
``FLUX_IVAR_G``                 float32      1/nanomaggies\ |sup2| Inverse variance of ``FLUX_G``
``FLUX_IVAR_R``                 float32      1/nanomaggies\ |sup2| Inverse variance of ``FLUX_R``
``FLUX_IVAR_Z``                 float32      1/nanomaggies\ |sup2| Inverse variance of ``FLUX_Z``
``FLUX_IVAR_W1``                float32      1/nanomaggies\ |sup2| Inverse variance of ``FLUX_W1``
``FLUX_IVAR_W2``                float32      1/nanomaggies\ |sup2| Inverse variance of ``FLUX_W2``
``FLUX_IVAR_W3``                float32      1/nanomaggies\ |sup2| Inverse variance of ``FLUX_W3``
``FLUX_IVAR_W4``                float32      1/nanomaggies\ |sup2| Inverse variance of ``FLUX_W4``
``MW_TRANSMISSION_G``           float32                            Galactic transmission in :math:`g` filter in linear units [0,1]
``MW_TRANSMISSION_R``           float32                            Galactic transmission in :math:`r` filter in linear units [0,1]
``MW_TRANSMISSION_Z``           float32                            Galactic transmission in :math:`z` filter in linear units [0,1]
``MW_TRANSMISSION_W1``          float32                            Galactic transmission in :math:`W1` filter in linear units [0,1]
``MW_TRANSMISSION_W2``          float32                            Galactic transmission in :math:`W2` filter in linear units [0,1]
``MW_TRANSMISSION_W3``          float32                            Galactic transmission in :math:`W3` filter in linear units [0,1]
``MW_TRANSMISSION_W4``          float32                            Galactic transmission in :math:`W4` filter in linear units [0,1]
``NOBS_G``                      int16                              Number of images that contribute to the central pixel in :math:`g`: filter for this object (not profile-weighted)
``NOBS_R``                      int16                              Number of images that contribute to the central pixel in :math:`r`: filter for this object (not profile-weighted)
``NOBS_Z``                      int16                              Number of images that contribute to the central pixel in :math:`z`: filter for this object (not profile-weighted)
``NOBS_W1``                     int16                              Number of images that contribute to the central pixel in :math:`W1`: filter for this object (not profile-weighted)
``NOBS_W2``                     int16                              Number of images that contribute to the central pixel in :math:`W2`: filter for this object (not profile-weighted)
``NOBS_W3``                     int16                              Number of images that contribute to the central pixel in :math:`W3`: filter for this object (not profile-weighted)
``NOBS_W4``                     int16                              Number of images that contribute to the central pixel in :math:`W4`: filter for this object (not profile-weighted)
``RCHISQ_G``                    float32                            Profile-weighted |chi|\ |sup2| of model fit normalized by the number of pixels in :math:`g`
``RCHISQ_R``                    float32                            Profile-weighted |chi|\ |sup2| of model fit normalized by the number of pixels in :math:`r`
``RCHISQ_Z``                    float32                            Profile-weighted |chi|\ |sup2| of model fit normalized by the number of pixels in :math:`z`
``RCHISQ_W1``                   float32                            Profile-weighted |chi|\ |sup2| of model fit normalized by the number of pixels in :math:`W1`
``RCHISQ_W2``                   float32                            Profile-weighted |chi|\ |sup2| of model fit normalized by the number of pixels in :math:`W2`
``RCHISQ_W3``                   float32                            Profile-weighted |chi|\ |sup2| of model fit normalized by the number of pixels in :math:`W3`
``RCHISQ_W4``                   float32                            Profile-weighted |chi|\ |sup2| of model fit normalized by the number of pixels in :math:`W4`
``FRACFLUX_G``                  float32                            Profile-weighted fraction of the flux from other sources divided by the total flux in :math:`g` (typically [0,1])
``FRACFLUX_R``                  float32                            Profile-weighted fraction of the flux from other sources divided by the total flux in :math:`r` (typically [0,1])
``FRACFLUX_Z``                  float32                            Profile-weighted fraction of the flux from other sources divided by the total flux in :math:`z` (typically [0,1])
``FRACFLUX_W1``                 float32                            Profile-weighted fraction of the flux from other sources divided by the total flux in :math:`W1` (typically [0,1])
``FRACFLUX_W2``                 float32                            Profile-weighted fraction of the flux from other sources divided by the total flux in :math:`W2` (typically [0,1])
``FRACFLUX_W3``                 float32                            Profile-weighted fraction of the flux from other sources divided by the total flux in :math:`W3` (typically [0,1])
``FRACFLUX_W4``                 float32                            Profile-weighted fraction of the flux from other sources divided by the total flux in :math:`W4` (typically [0,1])
``FRACMASKED_G``                float32                            Profile-weighted fraction of pixels masked from all observations of this object in :math:`g`, strictly between [0,1]
``FRACMASKED_R``                float32                            Profile-weighted fraction of pixels masked from all observations of this object in :math:`r`, strictly between [0,1]
``FRACMASKED_Z``                float32                            Profile-weighted fraction of pixels masked from all observations of this object in :math:`z`, strictly between [0,1]
``FRACIN_G``                    float32                            Fraction of a source's flux within the blob in :math:`g`, near unity for real sources
``FRACIN_R``                    float32                            Fraction of a source's flux within the blob in :math:`r`, near unity for real sources
``FRACIN_Z``                    float32                            Fraction of a source's flux within the blob in :math:`z`, near unity for real sources
``ANYMASK_G``                   int16                              Bitwise mask set if the central pixel from any image satisfies each condition in :math:`g`
``ANYMASK_R``                   int16                              Bitwise mask set if the central pixel from any image satisfies each condition in :math:`r`
``ANYMASK_Z``                   int16                              Bitwise mask set if the central pixel from any image satisfies each condition in :math:`z`
``ALLMASK_G``                   int16                              Bitwise mask set if the central pixel from all images satisfy each condition in :math:`g`
``ALLMASK_R``                   int16                              Bitwise mask set if the central pixel from all images satisfy each condition in :math:`r`
``ALLMASK_Z``                   int16                              Bitwise mask set if the central pixel from all images satisfy each condition in :math:`z`
``WISEMASK_W1``                 uint8                              W1 bright star bitmask, :math:`2^0` :math:`(2^1)` for southward (northward) scans
``WISEMASK_W2``                 uint8                              W2 bright star bitmask, :math:`2^0` :math:`(2^1)` for southward (northward) scans
``PSFSIZE_G``                   float32      arcsec                Weighted average PSF FWHM in the :math:`g` band
``PSFSIZE_R``                   float32      arcsec                Weighted average PSF FWHM in the :math:`r` band
``PSFSIZE_Z``                   float32      arcsec                Weighted average PSF FWHM in the :math:`z` band
``PSFDEPTH_G``                  float32      1/nanomaggies\ |sup2| For a :math:`5\sigma` point source detection limit in :math:`g`, :math:`5/\sqrt(\mathrm{PSFDEPTH\_G})` gives flux in nanomaggies and :math:`-2.5[\log_{10}(5 / \sqrt(\mathrm{PSFDEPTH\_G})) - 9]` gives corresponding magnitude
``PSFDEPTH_R``                  float32      1/nanomaggies\ |sup2| For a :math:`5\sigma` point source detection limit in :math:`g`, :math:`5/\sqrt(\mathrm{PSFDEPTH\_R})` gives flux in nanomaggies and :math:`-2.5[\log_{10}(5 / \sqrt(\mathrm{PSFDEPTH\_R})) - 9]` gives corresponding magnitude
``PSFDEPTH_Z``                  float32      1/nanomaggies\ |sup2| For a :math:`5\sigma` point source detection limit in :math:`g`, :math:`5/\sqrt(\mathrm{PSFDEPTH\_Z})` gives flux in nanomaggies and :math:`-2.5[\log_{10}(5 / \sqrt(\mathrm{PSFDEPTH\_Z})) - 9]` gives corresponding magnitude
``GALDEPTH_G``                  float32      1/nanomaggies\ |sup2| As for ``PSFDEPTH_G`` but for a galaxy (0.45" exp, round) detection sensitivity
``GALDEPTH_R``                  float32      1/nanomaggies\ |sup2| As for ``PSFDEPTH_R`` but for a galaxy (0.45" exp, round) detection sensitivity
``GALDEPTH_Z``                  float32      1/nanomaggies\ |sup2| As for ``PSFDEPTH_Z`` but for a galaxy (0.45" exp, round) detection sensitivity
``WISE_COADD_ID``               char[8]                            unWISE coadd file name for the center of each object
``FRACDEV``                     float32                            Fraction of model in deVauc [0,1]
``FRACDEV_IVAR``                float32                            Inverse variance of ``FRACDEV``
``SHAPEDEV_R``                  float32      arcsec                Half-light radius of deVaucouleurs model (>0)
``SHAPEDEV_R_IVAR``             float32      1/arcsec              Inverse variance of ``SHAPEDEV_R``
``SHAPEDEV_E1``                 float32                            Ellipticity component 1
``SHAPEDEV_E1_IVAR``            float32                            Inverse variance of ``SHAPEDEV_E1``
``SHAPEDEV_E2``                 float32                            Ellipticity component 2
``SHAPEDEV_E2_IVAR``            float32                            Inverse variance of ``SHAPEDEV_E2``
``SHAPEEXP_R``                  float32      arcsec                Half-light radius of exponential model (>0)
``SHAPEEXP_R_IVAR``             float32      1/arcsec2             Inverse variance of ``SHAPEEXP_R``
``SHAPEEXP_E1``                 float32                            Ellipticity component 1
``SHAPEEXP_E1_IVAR``            float32                            Inverse variance of ``SHAPEEXP_E1``
``SHAPEEXP_E2``                 float32                            Ellipticity component 2
``SHAPEEXP_E2_IVAR``            float32                            Inverse variance of ``SHAPEEXP_E2``
=============================== ============ ===================== ===============================================

Image Stacks
============

Image stacks are on tangent-plane (WCS TAN) projections, 3600 |times|
3600 pixels, at 0.262 arcseconds per pixel.

coadd/<AAA>/<brick>/legacysurvey-<brick>-ccds.fits
---------------------------------------------------

FITS binary table with the list of CCD images that were used in this brick.
Same columns as ``survey-ccds-*.fits.gz``, except for ``photometric`` and
``bitmask``, and with the additional columns:

================ ========= ======================================================
Column           Type      Description
================ ========= ======================================================
``extname``	 char[4]   (ignore)
``ccd_cuts``	 int32	   (ignore)
``ccd_x0``       int16     Minimum x image coordinate overlapping this brick
``ccd_x1``       int16     Maximum x image coordinate overlapping this brick
``ccd_y0``       int16     Minimum y image coordinate overlapping this brick
``ccd_y1``       int16     Maximum y image coordinate overlapping this brick
``brick_x0``     int16     Minimum x brick image coordinate overlapped by this image
``brick_x1``     int16     Maximum x brick image coordinate overlapped by this image
``brick_y0``     int16     Minimum y brick image coordinate overlapped by this image
``brick_y1``     int16     Maximum y brick image coordinate overlapped by this image
``sig1``         float64   (ignore)
``psfnorm``      float32   Same as ``psfnorm`` in the ``ccds-annotated-`` file
``galnorm``      float64   Same as ``galnorm`` in the ``ccds-annotated-`` file
``plver``        char[4]   Community Pipeline (CP) version
``skyver``       char[17]  Git version of the sky calibration code
``wcsver``       char[1]   Git version of the WCS calibration code
``psfver``       char[12]  Git version of the PSF calibration code
``skyplver``     char[4]   CP version of the input to sky calibration
``wcsplver``     char[4]   CP version of the input to WCS calibration
``psfplver``     char[4]   CP version of the input to PSF calibration
================ ========= ======================================================


coadd/<AAA>/<brick>/legacysurvey-<brick>-image-<filter>.fits
------------------------------------------------------------

Stacked image centered on a brick location covering 0.25\ |deg| |times| 0.25\
|deg|.  The primary HDU contains the coadded image (inverse-variance weighted coadd), in
units of nanomaggies per pixel.

- NOTE: These are not the images used by Tractor, which operates on the
  single-epoch images.

- NOTE: that these images are resampled using Lanczos-3 resampling.

coadd/<AAA>/<brick>/legacysurvey-<brick>-invvar-<filter>.fits
-------------------------------------------------------------

Corresponding stacked inverse variance image based on the sum of the
inverse-variances of the individual input images in units of 1/(nanomaggies)\
|sup2| per pixel.

- NOTE: These are not the inverse variance maps used by Tractor, which operates
  on the single-epoch images.

coadd/<AAA>/<brick>/legacysurvey-<brick>-model-<filter>.fits.gz
---------------------------------------------------------------

Stacked model image centered on a brick location covering 0.25\ |deg| |times| 0.25\ |deg|.

- The Tractor's idea of what the coadded images should look like; the Tractor's model prediction.

coadd/<AAA>/<brick>/legacysurvey-<brick>-chi2-<filter>.fits
-----------------------------------------------------------

Stacked |chi|\ |sup2| image, which is approximately the summed |chi|\ |sup2| values from the single-epoch images.

coadd/<AAA>/<brick>/legacysurvey-<brick>-depth-<filter>.fits.gz
---------------------------------------------------------------

Stacked depth map in units of the point-source flux inverse-variance at each pixel.

- The 5\ |sigma| point-source depth can be computed as 5 / sqrt(depth_ivar) .

coadd/<AAA>/<brick>/legacysurvey-<brick>-galdepth-<filter>.fits.gz
------------------------------------------------------------------

Stacked depth map in units of the canonical galaxy flux inverse-variance at each pixel.
The canonical galaxy is an exponential profile with effective radius 0.45" and round shape.

- The 5\ |sigma| galaxy depth can be computed as 5 / sqrt(galdepth_ivar) .

coadd/<AAA>/<brick>/legacysurvey-<brick>-nexp-<filter>.fits.gz
--------------------------------------------------------------

Number of exposures contributing to each pixel of the stacked images.

coadd/<AAA>/<brick>/legacysurvey-<brick>-image.jpg
--------------------------------------------------

JPEG image of calibrated image using the g,r,z filters as the colors.

coadd/<AAA>/<brick>/legacysurvey-<brick>-model.jpg
--------------------------------------------------

JPEG image of the Tractor's model image using the g,r,z filters as the colors.

coadd/<AAA>/<brick>/legacysurvey-<brick>-resid.jpg
--------------------------------------------------

JPEG image of the residual image (data minus model) using the g,r,z filters as
the colors.

Raw Data
========

NOAO access to raw and calibrated images will be available starting on July 10, 2017.

Raw and Calibrated Legacy Survey images are available from the NOAO Science Archive through the web 
portal (http://archive.noao.edu/search/query) and an ftp server. The input data used to create the 
stacked images, Tractor catalogs, etc. comprise images 
taken from the Mayall :math:`z`-band Legacy Survey (`MzLS`_) in the :math:`z` band, and from 
the Beijing-Arizona Sky Survey (`BASS`_) in the :math:`g` & :math:`r` bands.

(i) Web interface
-----------------

1. Query the `NOAO Science Archive`_.
2. From the menu of "Available Collections" on the left, select the desired data release (e.g. LS-DR4).
3. Under "Data products - Raw data" check "Object".
4. Optionally, you may select data from specific filters, or restrict the search by other parameters such as sky coordinates, observing date, or exposure time.
5. Click "Search".
6. The Results page offers several different ways to download the data. See `the Tutorials page`_ for details.

.. _`NOAO Science Archive`: http://archive.noao.edu/search/query
.. _`the Tutorials page`: http://archive.noao.edu/tutorials/query


(ii) ftp sites
--------------

Following the organization of the Stacked images, Raw and Calibrated images are organized 
by survey brick, which are defined in the file *survey-bricks-dr4.fits.gz* for DR4. Both the main Tractor 
catalogs and Sweep catalogs include the ``BRICKNAME`` keyword (corresponding to ``<brick>`` with 
format ``<AAAa>c<BBB>)``. 

- Raw: ftp://archive.noao.edu/public/hlsp/ls/dr4/raw/``<AAA>/<brick>``
- Calibrated: ftp://archive.noao.edu/public/hlsp/ls/dr4/calibrated/``<AAA>/<brick>``
- Stacked: ftp://archive.noao.edu/public/hlsp/ls/dr4/coadd/``<AAA>/<brick>``

For the calibrated images, filenames can be retrieved from the ``IMAGE_FILENAME`` keyword in each brick 
from *legacysurvey*-``<brick>``-*ccds.fits*. Additionally, each *calibrated*/``<AAA>/<brick>`` 
contains an ASCII file 
with a list of ``EXPID`` and ``IMAGE_FILENAME`` 
(*legacysurvey*-``<brick>``-*image_filename.txt*). 
``EXPID`` contains the exposure number and the CCD name with the format ``EXPNUM-ccd``. 
There is one entry per CCD. Often, multiple CCDs from a given file are used so there are 
fewer unique filenames than the number of CCDs. Each *legacysurvey*-``<brick>``-*image_filename.txt*
file contains the number of unique images in the last row (File Count).