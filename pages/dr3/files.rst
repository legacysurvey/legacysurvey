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
  http://portal.nersc.gov/project/cosmo/data/legacysurvey/dr3/

Top level directory for web access to dr3.1 sweeps (see `known issues`_ for a description of dr3.1):
  http://portal.nersc.gov/project/cosmo/data/legacysurvey/dr3/sweep/3.1/

.. _`known issues`: ../issues

Top level directory local to NERSC computers (for collaborators):
  /global/project/projectdirs/cosmo/data/legacysurvey/dr3/

Top level directory local to NERSC computers for dr3.1 sweeps (see `known issues`_ for a description of dr3.1):
  /global/project/projectdirs/cosmo/data/legacysurvey/dr3/sweep/3.1/

Summary Files
=============

survey-bricks.fits.gz
---------------------

FITS binary table with the RA, DEC bounds of each geometrical "brick" on the sky.
This includes all bricks on the sky, not just the ones in our footprint or with
coverage in DR3.  For that information, see the next file description.

- HDU1 (only HDU) - tags in the ``survey-bricks.fits.gz`` file

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


survey-bricks-dr3.fits.gz
--------------------------

A FITS binary table with information that summarizes the contents of each brick,
as of DR3.

=============== ======== =========================================================================
Column          Type     Description
=============== ======== =========================================================================
``brickname``   char[8]  Name of the brick.
``ra``          double   RA of the center of the brick.
``dec``         double   Dec of the center of the brick.
``nexp_g``      int16    Median number of exposures in the unique area (i.e. ``BRICK_PRIMARY`` area) of the brick in g-band.
``nexp_r``      int16    Median number of exposures in the unique area of the brick in r-band.
``nexp_z``      int16    Median number of exposures in the unique area of the brick in z-band.
``nexphist_g``  int32[6] Histogram of number of pixels in the unique brick area with 0, 1, 2, 3, 4, or > 5 exposures in g
``nexphist_r``  int32[6] Histogram of number of pixels in the unique brick area with 0, 1, 2, 3, 4, or > 5 exposures in r
``nexphist_z``  int32[6] Histogram of number of pixels in the unique brick area with 0, 1, 2, 3, 4, or > 5 exposures in z
``nobjs``       int16    Total number of ``BRICK_UNIQUE`` objects in this brick, of all types.
``npsf``        int16    Total number of ``BRICK_UNIQUE`` objects in this brick, of type ``PSF``.
``nsimp``       int16    Total number of ``BRICK_UNIQUE`` objects in this brick, of type ``SIMP``.
``nexp``        int16    Total number of ``BRICK_UNIQUE`` objects in this brick, of type ``EXP``.
``ndev``        int16    Total number of ``BRICK_UNIQUE`` objects in this brick, of type ``DEV``.
``ncomp``       int16    Total number of ``BRICK_UNIQUE`` objects in this brick, of type ``COMP``.
``psfsize_g``   float32  Median PSF size, in arcsec, evaluated at the ``BRICK_UNIQUE`` objects in this brick in g-band.
``psfsize_r``   float32  Median PSF size, in arcsec, evaluated at the ``BRICK_UNIQUE`` objects in this brick in r-band.
``psfsize_z``   float32  Median PSF size, in arcsec, evaluated at the ``BRICK_UNIQUE`` objects in this brick in z-band.
``ebv``         float32  Median SFD dust map E(B-V) extinction, in magnitudes, evaluated at ``BRICK_UNIQUE`` objects in this brick.
``trans_g``     float32  Median Milky Way dust transparency in :math:`g`-band, based on ``ebv``. See also ``DECAM_MW_TRANSMISSION``.
``trans_r``     float32  Median Milky Way dust transparency in :math:`r`-band, based on ``ebv``. See also ``DECAM_MW_TRANSMISSION``.
``trans_z``     float32  Median Milky Way dust transparency in :math:`z`-band, based on ``ebv``. See also ``DECAM_MW_TRANSMISSION``.
=============== ======== =========================================================================

Note that, for the ``nexphist`` rows, pixels that are masked by the NOAO Community Pipeline as, e.g., cosmic rays or saturation, do NOT count toward the number of exposures. More information about the morphological types and ``DECAM_MW_TRANSMISSION`` can be found on the `catalogs page`_.

.. _`catalogs page`: ../catalogs

survey-ccds-decals.fits.gz
--------------------------

A FITS binary table with almanac information (e.g. seeing, etc.) about each individual CCD image. 

This file contains information regarding the photometric and astrometric zero points for each CCD of every DECam image that is part of the DECaLS DR3 data release. Photometric zero points for each CCD are computed by identifying stars and comparing their instrumental magnitudes (measured in an approximately 7 arcsec diameter aperture) to color-selected stars in the PanSTARRS "qz" catalog. 

The photometric zeropoints (``zpt``, ``ccdzpt``, etc)
are magnitude-like numbers (e.g. 25.04), and
indicate the magnitude of a source that would contribute one count per
second to the image.  For example, in an image with zeropoint of 25.04
and exposure time of 30 seconds, a source of magnitude 22.5 would
contribute
:math:`30 * 10^{((25.04 - 22.5) / 2.5)} = 311.3`
counts.

================== =========  ======================================================
Column             Type       Description
================== =========  ======================================================
``object``         char[35]   Name listed in the object tag from the CCD header. For propid 2014B-0404, in most cases, this has the form: *DECaLS_<tile_number>_<filter>*, but this can differ for older and non-DECaLS data.
``expnum``         int32      Unique DECam exposure number, eg 348224.
``exptime``        float      Exposure time in seconds, eg 30.
``filter``         char[1]    Filter used for observation, eg "g", "r", "z".
``seeing``         float      Seeing in arcseconds determined by fitting a 2-dimensional gaussian to the median PSF of stars on the CCD, eg 1.1019.
``date_obs``       char[10]   Date of observation start, eg "2014-08-15".  Can be combined with ``ut``, or use ``mjd_obs`` instead.
``mjd_obs``        double     Date of observation in MJD (in UTC system), eg 56884.99373389.               
``ut``             char[15]   Time of observation start, eg "23:50:58.608241".
``ha``             char[13]   Hour angle of the observation (HH:MM:SS)  
``airmass``        float      Airmass, eg 1.35.
``propid``         char[10]   NOAO Proposal ID that took this image, eg "2014B-0404".
``zpt``            float      Median zero point for the entire image (median of all CCDs of the image), eg 25.0927.
``avsky``          float      Average sky level in this image, in ADU, eg 36.9324. ``avsky`` is `detailed more here`_
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
``ccdskyrms``      float      Sky rms (in counts)
``ccdskymag``      float      Mean sky background in AB mag/arcsec\ :sup:`2` on each CCD; measured from the CP-processed frames as -2.5*alog10(``ccdskycounts``/``pixscale``/``pixscale``/``exptime``) + ``ccdzpt``
``ccdskycounts``   float      Mean sky count level per pixel in the CP-processed frames measured (with iterative rejection) for each CCD in the image section [500:1500,1500:2500]
``ccdraoff``       float      Median astrometric offset for the CCD <PS1-DECaLS> in arcsec.
``ccddecoff``      float      Median astrometric offset for the CCD <PS1-DECaLS> in arcsec
``ccdtransp``      float      (ignore)
``ccdnstar``       int16      Number of stars found on the CCD.
``ccdnmatch``      int16      Number of stars matched to PS1 (and used to compute the photometric zero points and astrometric offsets).
``ccdnmatcha``     int16      Number of stars in amp A matched.
``ccdnmatchb``     int16      Number of stars in amp B matched.
``ccdmdncol``      float      Median (g-i) color from the PS1 catalog of the matched stars.
``temp``           float      Outside temperature in :sup:`o`\ C listed in the ``OUTTEMP`` tag in the CCD image header.
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

.. _`detailed more here`: ../avsky

survey-ccds-nondecals.fits.gz
-----------------------------

As for survey-ccds-decals.fits.gz, but for areas of the sky covered with DECam by surveys other than DECaLS.

survey-ccds-extra.fits.gz
-----------------------------

As for survey-ccds-nondecals.fits.gz but for some additional regions of the sky. The "nondecals" and "extra" files are currently split up simply to make them easier to store on github.

ccds-annotated-decals.fits.gz
-----------------------------

A version of the survey-ccds-decals.fits.gz file with additional information
gathered during calibration pre-processing before running the Tractor
reductions.

Includes everything listed in the survey-ccds-decals.fits.gz files plus the following:

==================== ======== ======================================================
Column               Type      Description
==================== ======== ======================================================
``photometric``      boolean  True if this CCD was considered photometric and used in the DR3 reductions
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
``dec_center``       double   Dec coordinate of CCD center
``sig1``             float    Median per-pixel error standard deviation, in nanomaggies.
``meansky``          float    Our pipeline (not the CP) estimate of the sky level, average over the image, in ADU.
``stdsky``           float    Standard deviation of our sky level
``maxsky``           float    Max of our sky level
``minsky``           float    Min of our sky level
``pixscale_mean``    float    Pixel scale (via sqrt of area of a 10x10 pixel patch evaluated in a 5x5 grid across the image), in arcsec/pixel.
``pixscale_std``     float    Standard deviation of pixel scale
``pixscale_max``     float    Max of pixel scale
``pixscale_min``     float    Min of pixel scale
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

ccds-annotated-nondecals.fits.gz
--------------------------------

As for ccds-annotated-decals.fits.gz, but for areas of the sky covered with DECam by surveys other than DECaLS.

ccds-annotated-extra.fits.gz
----------------------------

As for ccds-annotated-nondecals.fits.gz but for some additional regions of the sky. The "nondecals" and "extra" ccds files are currently split up simply to make them easier to store on github.

dr3-depth.fits.gz
-----------------

A concatenation of the depth histograms for each brick, from the
``coadd/*/*/*-depth.fits`` tables.  These histograms describe the
number of pixels in each brick with a 5-sigma AB depth in the given
magnitude bin.

dr3-depth-summary.fits.gz
-------------------------

A summary of the depth histogram of the whole DR3 survey.  FITS table with the following columns:

==================== ======== ======================================================
Column               Type      Description
==================== ======== ======================================================
``depthlo``          float    Lower limit of the depth bin
``depthhi``          float    Upper limit of the depth bin
``counts_ptsrc_g``   int      Number of pixels in histogram for point source depth in g band
``counts_gal_g``     int      Number of pixels in histogram for canonical galaxy depth in g band
``counts_ptsrc_r``   int      Number of pixels in histogram for point source depth in r band
``counts_gal_r``     int      Number of pixels in histogram for canonical galaxy depth in r band
``counts_ptsrc_z``   int      Number of pixels in histogram for point source depth in z band
``counts_gal_z``     int      Number of pixels in histogram for canonical galaxy depth in z band
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

The DECaLS photometric catalogs have been matched to the following external spectroscopic files from the SDSS, which can be accessed through the web at:
  http://portal.nersc.gov/project/cosmo/data/legacysurvey/dr3/external/

Or on the NERSC computers (for collaborators) at:
  /global/project/projectdirs/cosmo/data/legacysurvey/dr3/external/

Each row of each external-match file contains the full record of the nearest object in our Tractored survey
imaging catalogs, matched at a radius of 1.0 arcsec. The structure of the imaging catalog files 
is documented on the `catalogs page`_. If no match is found, then ``OBJID`` is set to -1.

.. _`catalogs page`: ../catalogs

survey-dr3-specObj-dr13.fits
----------------------------
HDU1 (the only HDU) contains Tractored survey
photometry that is row-by-row-matched to the SDSS DR13 spectrosopic
pipeline file such that the photometric parameters in row "N" of 
survey-dr3-specObj-dr13.fits matches the spectroscopic parameters in row "N" of
specObj-dr13.fits. The spectroscopic file 
is documented in the SDSS DR13 `data model for specObj-dr13.fits`_.

.. _`data model for specObj-dr13.fits`: http://data.sdss3.org/datamodel/files/SPECTRO_REDUX/specObj.html

survey-dr3-DR12Q.fits
---------------------
HDU1 (the only HDU) contains Tractored survey
photometry that is row-by-row-matched to the SDSS DR12 
visually inspected quasar catalog (`Paris et al. 2016`_)
such that the photometric parameters in row "N" of 
survey-dr3-DR12Q.fits matches the spectroscopic parameters in row "N" of
DR12Q.fits. The spectroscopic file 
is documented in the SDSS DR12 `data model for DR12Q.fits`_.

.. _`Paris et al. 2016`: http://adsabs.harvard.edu/cgi-bin/bib_query?arXiv:1608.06483
.. _`data model for DR12Q.fits`: http://data.sdss3.org/datamodel/files/BOSS_QSO/DR12Q/DR12Q.html

survey-dr3-Superset_DR12Q.fits
------------------------------
HDU1 (the only HDU) contains Tractored survey
photometry that is row-by-row-matched to the superset of all SDSS DR12 spectroscopically
confirmed objects that were visually inspected as possible quasars 
(Paris et al. 2016, in preparation, see also `Paris et al. 2014`_)
such that the photometric parameters in row "N" of 
survey-dr3-Superset_DR12Q.fits matches the spectroscopic parameters in row "N" of
Superset_DR12Q.fits. The spectroscopic file
is documented in the SDSS DR12 `data model for Superset_DR12Q.fits`_.

.. _`Paris et al. 2014`: http://adsabs.harvard.edu/abs/2014A%26A...563A..54P
.. _`data model for Superset_DR12Q.fits`: http://data.sdss3.org/datamodel/files/BOSS_QSO/DR12Q/DR12Q_superset.html

survey-dr3-DR7Q.fits
---------------------
HDU1 (the only HDU) contains Tractored survey
photometry that is row-by-row-matched to the SDSS DR7
visually inspected quasar catalog (`Schneider et al. 2010`_)
such that the photometric parameters in row "N" of
survey-dr3-DR7Q.fits matches the spectroscopic parameters in row "N" of
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

- **<filter>** denotes the `g`, `r` or `z` band, using the corresponding letter.

Note that it is not possible to go from a brick name back to an *exact* RA,Dec center (the bricks are not on 0.1\ |deg| grid lines). The exact brick center for a given brick name can be derived from columns in the `survey-bricks.fits.gz` file (i.e. ``brickname``, ``ra``, ``dec``).

tractor/<AAA>/tractor-<brick>.fits
----------------------------------

FITS binary table containing Tractor photometry, documented on the
`catalogs page`_. 

.. _`catalogs page`: ../catalogs

Users interested in database access to the Tractor Catalogs can contact the NOAO Data Lab at datalab@noao.edu.

Sweep Catalogs
==============

sweep/3.1/sweep-<brickmin>-<brickmax>.fits
------------------------------------------

Note that previous versions of the sweeps are available in sweep/3.0/sweep-<brickmin>-<brickmax>.fits
for reasons detailed on the `known issues`_ page.

.. _`known issues`: ../issues

The sweeps are light-weight FITS binary tables (containing a subset of the most commonly used
Tractor measurements) of all the Tractor catalogs for which ``BRICK_PRIMARY==T`` in rectangles of RA, Dec. Includes:

=============================== ============ ===================== ===============================================
Name                            Type         Units                 Description
=============================== ============ ===================== ===============================================
``BRICKID``                     int32                              Brick ID [1,662174]
``BRICKNAME``                   char                               Name of brick, encoding the brick sky position, eg "1126p222" near RA=112.6, Dec=+22.2
``OBJID``                       int32                              Catalog object number within this brick; a unique identifier hash is BRICKID,OBJID;  OBJID spans [0,N-1] and is contiguously enumerated within each blob
``TYPE``                        char[4]                            Morphological model: "PSF"=stellar, "SIMP"="simple galaxy" = 0.45" round EXP galaxy, "EXP"=exponential, "DEV"=deVauc, "COMP"=composite.  Note that in some FITS readers, a trailing space may be appended for "PSF ", "EXP " and "DEV " since the column data type is a 4-character string
``RA``                          float64      deg                   Right ascension at epoch J2000
``RA_IVAR``                     float32      1/deg\ |sup2|         Inverse variance of RA, excluding astrometric calibration errors
``DEC``                         float64      deg                   Declination at epoch J2000
``DEC_IVAR``                    float32      1/deg\ |sup2|         Inverse variance of DEC (no cos term!), excluding astrometric calibration errors
``DECAM_FLUX``                  float32[6]   nanomaggies           DECam model flux in ugrizY
``DECAM_FLUX_IVAR``             float32[6]   1/nanomaggies\ |sup2| Inverse variance oF DECAM_FLUX
``DECAM_MW_TRANSMISSION``       float32[6]                         Galactic transmission in ugrizY filters in linear units [0,1]
``DECAM_NOBS``                  uint8[6]                           Number of images that contribute to the central pixel in each filter for this object (not profile-weighted)
``DECAM_RCHI2``                 float32[6]                         Profile-weighted |chi|\ |sup2| of model fit normalized by the number of pixels
``DECAM_PSFSIZE``               float32[6]   arcsec                Weighted average PSF FWHM per band
``DECAM_FRACFLUX``              float32[6]                         Profile-weight fraction of the flux from other sources divided by the total flux (typically [0,1])
``DECAM_FRACMASKED``            float32[6]                         Profile-weighted fraction of pixels masked from all observations of this object, strictly between [0,1]
``DECAM_FRACIN``                float32[6]                         Fraction of a source's flux within the blob, near unity for real sources
``DECAM_DEPTH``                 float32[6]   1/nanomaggies\ |sup2| For a :math:`5\sigma` point source detection limit, :math:`5/\sqrt(\mathrm{DECAM\_DEPTH})` gives flux in nanomaggies and :math:`-2.5(\log_{10}((5 / \sqrt(\mathrm{DECAM\_DEPTH}) - 9)` gives corresponding magnitude
``DECAM_GALDEPTH``              float32[6]   1/nanomaggies\ |sup2| As for DECAM_DEPTH but for a galaxy (0.45" exp, round) detection sensitivity
``OUT_OF_BOUNDS``               boolean                            True for objects whose center is on the brick; less strong of a cut than BRICK_PRIMARY
``DECAM_ANYMASK``               int16[6]                           Bitwise mask set if the central pixel from any image satisfy each condition
``DECAM_ALLMASK``               int16[6]                           Bitwise mask set if the central pixel from all images satisfy each condition
``WISE_FLUX``                   float32[4]   nanomaggies           WISE model flux in W1,W2,W3,W4
``WISE_FLUX_IVAR``              float32[4]   1/nanomaggies\ |sup2| Inverse variance of WISE_FLUX
``WISE_MW_TRANSMISSION``        float32[4]                         Galactic transmission in W1,W2,W3,W4 filters in linear units [0,1]
``WISE_NOBS``                   int16[4]                           Number of images that contribute to the central pixel in each filter for this object (not profile-weighted)
``WISE_FRACFLUX``               float32[4]                         Profile-weight fraction of the flux from other sources divided by the total flux (typically [0,1])
``WISE_RCHI2``                  float32[4]                         Profile-weighted |chi|\ |sup2| of model fit normalized by the number of pixels
``DCHISQ``                      float32[5]                         Difference in |chi|\ |sup2| between successively more-complex model fits: PSF, SIMPle, EXP, DEV, COMP.  The difference is versus no source.
``FRACDEV``                     float32                            Fraction of model in deVauc [0,1]
``TYCHO2INBLOB``                boolean                            Is there a Tycho-2 (very bright) star in this blob?
``SHAPEDEV_R``                  float32      arcsec                Half-light radius of deVaucouleurs model (>0)
``SHAPEDEV_R_IVAR``             float32      1/arcsec\ |sup2|      Inverse variance of SHAPEDEV_R
``SHAPEDEV_E1``                 float32                            Ellipticity component 1 (documented on the `catalogs page`_) 
``SHAPEDEV_E1_IVAR``            float32                            Inverse variance of SHAPEDEV_E1
``SHAPEDEV_E2``                 float32                            Ellipticity component 2 (documented on the `catalogs page`_)
``SHAPEDEV_E2_IVAR``            float32                            Inverse variance of SHAPEDEV_E2
``SHAPEEXP_R``                  float32      arcsec                Half-light radius of exponential model (>0)
``SHAPEEXP_R_IVAR``             float32      1/arcsec\ |sup2|      Inverse variance of R_EXP
``SHAPEEXP_E1``                 float32                            Ellipticity component 1 (documented on the `catalogs page`_)
``SHAPEEXP_E1_IVAR``            float32                            Inverse variance of SHAPEEXP_E1
``SHAPEEXP_E2``                 float32                            Ellipticity component 2 (documented on the `catalogs page`_)
``SHAPEEXP_E2_IVAR``            float32                            Inverse variance of SHAPEEXP_E2
``EBV``                         float32      mag                   Galactic extinction E(B-V) reddening from SFD98, used to compute DECAM_MW_TRANSMISSION and WISE_MW_TRANSMISSION
=============================== ============ ===================== ===============================================

Image Stacks
============

Image stacks are on tangent-plane (WCS TAN) projections, 3600 |times|
3600 pixels, at 0.262 arcseconds per pixel.

coadd/<AAA>/<brick>/legacysurvey-<brick>-ccds.fits
---------------------------------------------------

FITS binary table with the list of CCD images that were used in this brick.
Same columns as ``survey-ccds-*.fits.gz``, plus:

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

Raw and Calibrated Legacy Survey images are available from the NOAO Science Archive through the web 
portal (http://archive.noao.edu/search/query) and an ftp server. The input data used to create the 
stacked images, Tractor catalogs, etc. comprise images taken by the dedicated DECam Legacy Survey 
project, as well as other DECam images. 

(i) Web interface
-----------------

1. Query the `NOAO Science Archive`_.
2. From the menu of "Available Collections" on the left, select the desired data release (e.g. DECaLS-DR3).
3. Under "Data products - Raw data" check "Object".
4. Optionally, you may select data from specific DECam filters, or restrict the search by other parameters such as sky coordinates, observing date, or exposure time.
5. Click "Search".
6. For DECaLS only images, refine the search by Proposal ID (2014B-0404) in the "Refine" tab.
7. The Results page offers several different ways to download the data. See `the Tutorials page`_ for details.

.. _`NOAO Science Archive`: http://archive.noao.edu/search/query
.. _`the Tutorials page`: http://archive.noao.edu/tutorials/query


(ii) ftp sites
--------------

Following the organization of the Stacked images, Raw and Calibrated DECam images are organized 
by survey brick, which are defined in the file *survey-bricks-dr3.fits.gz* for DR3. Both the main Tractor 
catalogs and Sweep catalogs include the ``BRICKNAME`` keyword (corresponding to ``<brick>`` with 
format ``<AAAa>c<BBB>)``. 

- Raw: ftp://archive.noao.edu/public/hlsp/decals/dr3/raw/``<AAA>/<brick>``
- Calibrated: ftp://archive.noao.edu/public/hlsp/decals/dr3/calibrated/``<AAA>/<brick>``
- Stacked: ftp://archive.noao.edu/public/hlsp/decals/dr3/coadd/``<AAA>/<brick>``

For the calibrated images, filenames can be retrieved from the ``IMAGE_FILENAME`` keyword in each brick 
from *legacysurvey*-``<brick>``-*ccds.fits*. Additionally, each *calibrated*/``<AAA>/<brick>`` 
contains an ASCII file 
with a list of ``EXPID`` and ``IMAGE_FILENAME`` 
(*legacysurvey*-``<brick>``-*image_filename.txt*; see the example below). 
``EXPID`` contains the exposure number and the CCD name (Nxx or Sxx) with the format ``EXPNUM-ccd``. 
There is one entry per CCD. Often, multiple CCDs from a given file are used so there are 
fewer unique filenames than the number of CCDs. Each *legacysurvey*-``<brick>``-*image_filename.txt*
file contains the number of unique images in the last row (File Count).

For the Raw CCD images, the file naming convention has evolved during the survey. The 
corresponding files can be reconciled through the original DECam filename: 
DECam_<``EXPNUM``>.fits.fz where ``EXPNUM`` needs to be in format ``I08`` and can be retrieved 
from *legacysurvey*-``<brick>``-*ccds.fits* for each brick, and from the keyword ``DTNSANAM`` 
in ``hdr[0]`` from each calibrated file.

Here is an example ASCII file for a given brick: *[noao-ftp]/calibrated/006/0060p147/legacysurvey-0060p147-image_filename.txt*

::

   expid                                                image_filename 
   1 00483709-N25 decam/CP20151010/c4d_151011_041055_oki_g_v1.fits.fz           
   2 00483709-N26 decam/CP20151010/c4d_151011_041055_oki_g_v1.fits.fz           
   3 00483709-N29 decam/CP20151010/c4d_151011_041055_oki_g_v1.fits.fz           
   4 00483710-N25 decam/CP20151010/c4d_151011_041329_oki_r_v1.fits.fz           
   5 00483710-N26 decam/CP20151010/c4d_151011_041329_oki_r_v1.fits.fz           
   6 00483710-N29 decam/CP20151010/c4d_151011_041329_oki_r_v1.fits.fz           
   File Count: 2

In the example above, there are 6 CCDs used for the stacked image, corresponding to 2 unique, multi-extension files.


