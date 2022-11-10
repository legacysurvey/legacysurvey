.. title: DR10 bitmasks
.. slug: bitmasks
.. tags: 
.. has_math: yes

.. class:: pull-right well

.. contents::


This page details the meaning of the bitmasks provided with Data Release 10 of the Legacy Surveys. The bits are
enumerated as a power (i.e. ``7`` written in a column of bits means `two-to-the-power-of-7`).

``MASKBITS``
============

These definitions apply to both the values in the ``coadd/*/*/*maskbits*`` *files* and to ``MASKBITS`` *columns* in the Tractor
and sweeps catalogs. See also the `legacypipe bitmask definitions`_.

=== ============= ===============================
Bit Name          Description
=== ============= ===============================
0   ``NPRIMARY``  touches a pixel that is outside the ``BRICK_PRIMARY`` region of a brick
1   ``BRIGHT``    touches a pixel within `half of`_ the locus of a `radius-magnitude relation`_. Set for Tycho sources with ``MAG_VT`` < 13 and Gaia stars with `G < 13`_.
2   ``SATUR_G``   touches a pixel that was saturated in at least one :math:`g`-band image
3   ``SATUR_R``   touches a pixel that was saturated in at least one :math:`r`-band image
4   ``SATUR_Z``   touches a pixel that was saturated in at least one :math:`z`-band image
5   ``ALLMASK_G`` touches a pixel that has any of the ``ALLMASK_G`` bits set
6   ``ALLMASK_R`` touches a pixel that has any of the ``ALLMASK_R`` bits set
7   ``ALLMASK_Z`` touches a pixel that has any of the ``ALLMASK_Z`` bits set
8   ``WISEM1``    touches a pixel in a ``WISEMASK_W1`` bright star mask
9   ``WISEM2``    touches a pixel in a ``WISEMASK_W2`` bright star mask
10  ``BAILOUT``   touches a pixel in a blob where we "bailed out" of source fitting
11  ``MEDIUM``    touches a pixel within the locus of a `radius-magnitude relation`_. Set for Gaia stars with `G < 16`_. The ``MEDIUM`` radius is twice the ``BRIGHT`` radius at the same magnitude.
12  ``GALAXY``    touches a pixel in an `SGA`_ large galaxy
13  ``CLUSTER``   touches a pixel in a globular cluster
14  ``SATUR_I``   touches a pixel that was saturated in at least one :math:`i`-band image (always zero prior to DR10)
15  ``ALLMASK_I`` touches a pixel that has any of the ``ALLMASK_I`` bits set (always zero prior to DR10)
16  ``SUB_BLOB``  source is in a large blob that was split into smaller blobs for processing
=== ============= ===============================

.. _`legacypipe bitmask definitions`: https://github.com/legacysurvey/legacypipe/blob/master/py/legacypipe/bits.py
.. _`radius-magnitude relation`: https://github.com/legacysurvey/legacypipe/blob/6d1a92f8462f4db9360fb1a68ef7d6c252781027/py/legacypipe/reference.py#L314-L319
.. _`G < 13`: https://github.com/legacysurvey/legacypipe/blob/6d1a92f8462f4db9360fb1a68ef7d6c252781027/py/legacypipe/reference.py#L310
.. _`G < 16`: https://github.com/legacysurvey/legacypipe/blob/6d1a92f8462f4db9360fb1a68ef7d6c252781027/py/legacypipe/reference.py#L311
.. _`Gaia`: https://gea.esac.esa.int/archive/documentation//GDR2/Gaia_archive/chap_datamodel/sec_dm_main_tables/ssec_dm_gaia_source.html
.. _`SGA`: ../../sga/sga2020
.. _`half of`: https://github.com/legacysurvey/legacypipe/blob/6d1a92f8462f4db9360fb1a68ef7d6c252781027/py/legacypipe/reference.py#L672-L675

``FITBITS``
============

A bit-mask detailing any peculiarities regarding how a source was fit. See also the `legacypipe bitmask definitions`_ and the
`issue that prompted`_ the development of ``FITBITS``.

=== ====================== ==========
Bit Name                   Description
=== ====================== ==========
0   ``FORCED_POINTSOURCE`` the source was forced to be type PSF
1   ``FIT_BACKGROUND``     the source had its background levels independently fit
2   ``HIT_RADIUS_LIMIT``   the source hit the radius limit during fitting (based on the limits for galaxy models in the Tractor code)
3   ``HIT_SERSIC_LIMIT``   the source hit the Sersic index limit during fitting (*e.g.*, see the `Sersic model limits`_ in the Tractor code)
4   ``FROZEN``             the source was not fit (all parameters for the source were frozen at the reference catalog values)
5   ``BRIGHT``             the source is a bright star (see also ``MASKBITS``, above)
6   ``MEDIUM``             the source is a medium-bright star (see also ``MASKBITS``, above)
7   ``GAIA``               the source is a Gaia source
8   ``TYCHO2``             the source is a Tycho-2 star
9   ``LARGEGALAXY``        the source is an `SGA`_ large galaxy
10  ``WALKER``             fitting the source shifted its position by > 1 arcsec
11  ``RUNNER``             fitting the source shifted its position by > 2.5 arcsec
12  ``GAIA_POINTSOURCE``   the source was a Gaia source that was *treated* as a point source
13  ``ITERATIVE``          the source was found during iterative detection
=== ====================== ==========

.. _`Sersic model limits`: https://github.com/dstndstn/tractor/blob/009656d8043f06fd8ed18095e5daabafc4c22505/tractor/sersic.py#L356-L358
.. _`issue that prompted`: https://github.com/legacysurvey/legacypipe/issues/593

``ALLMASK_X``/``ANYMASK_X``
===========================

``ANYMASK_X`` denotes a source that touches a bad pixel in *any* of a set of overlapping ``X``-band images whereas
``ALLMASK_X`` denotes a source that touches a bad pixel in *all* of a set of overlapping ``X``-band images.
See, also, the `legacypipe bitmask definitions`_. The
``ANYMASK`` and ``ALLMASK`` bit masks are defined as follows, mostly from the CP (NOIRLab Community Pipeline) `Data Quality bits`_,
which we `map to the values in the table`_.

=== =========== ==========================
Bit Name        Description
=== =========== ==========================
  0 ``BADPIX``  bad columns, hot pixels, etc.
  1 ``SATUR``   saturated
  2 ``INTERP``  interpolated
  4 ``CR``      single exposure cosmic ray
  6 ``BLEED``   bleed trail
  7 ``TRANS``   multi-exposure transient
  8 ``EDGE``    edge pixel
  9 ``EDGE2``   edge pixel
 11 ``OUTLIER`` marked as touching an outlier pixel by ``legacypipe`` itself
=== =========== ==========================

.. _`Data Quality bits`: https://legacy.noirlab.edu/noao/staff/fvaldes/CPDocPrelim/PL201_3.html
.. _`map to the values in the table`: https://github.com/legacysurvey/legacypipe/blob/14c49362418b85a591f48eaa394205ffb0321777/py/legacypipe/image.py#L27

``WISEMASK_W1``/``WISEMASK_W2``
===============================

``WISEMASK_W1`` and ``WISEMASK_W2`` have identical bit definitions, the only difference is that ``WISEMASK_W1`` applies to masking in the W1 band
and ``WISEMASK_W2`` to masking in the W2 band.

=== =========== ===============
Bit Name        Description
=== =========== ===============
0   ``BRIGHT``  Bright star core and wings
1   ``SPIKE``   PSF-based diffraction spike
2   ``GHOST``   Optical ghost
3   ``LATENT``  First latent
4   ``LATENT2`` Second latent image
5   ``HALO``    AllWISE-like circular halo
6   ``SATUR``   Bright star saturation
7   ``SPIKE2``  Geometric diffraction spike
=== =========== ===============

`Aaron Meisner's unWISE documentation`_ details how these masks were derived.

.. _`Aaron Meisner's unWISE documentation`: https://catalog.unwise.me/files/unwise_bitmask_writeup-03Dec2018.pdf

``CCD_CUTS``
============

The `survey CCDs`_ files include a bitmask ``ccd_cuts`` that
is `used by the legacypipe code`_ to discard CCDs that have low-quality observations before processing imaging for the Legacy Surveys. Any observations with
non-zero vales of ``ccd_cuts`` are discarded prior to processing.

In this table, the ``column`` ``names`` are as they appear in, e.g., the `survey CCDs`_ file. The overall zero-points (``zpt0``) are:

- :math:`g, r` = [25.74, 25.52] for 90Prime (`BASS`_)
- :math:`z` = 26.20 for Mosaic-3 (`MzLS`_)
- :math:`g, r, z` = [25.08, 25.29, 24.92] for DECam (`DECaLS`_)

=== ===================== ===========================
Bit Name                  Description
=== ===================== ===========================
0   ``ERR_LEGACYZPTS``    Some error from the `legacyzpts`_ code (e.g., the CP had a WCS error, usually due to being very shallow)
1   ``NOT_GRZ`` 	  Not a :math:`g`-, :math:`r`- or :math:`z`-band observation
2   ``NOT_THIRD_PIX``     Mosaic-3 one-third-pixel interpolation problem
3   ``EXPTIME_LT_30``     Exposure time < 30 seconds
4   ``CCDNMATCH_LT_20``   Number of matching CCDs < 20
5   ``ZPT_DIFF_AVG``      Zeropoint for CCD is different than the average for the exposure: abs(``ccdzpt`` - ``zpt``) > 0.25 for DECam, 0.1 for 90Prime, 0.1 for Mosaic-3
6   ``ZPT_SMALL`` 	  Zeropoint is too *low*: ``zpt`` < (``zpt0`` - P) where P is [0.5, 0.5, 1.0] mag for [DECam, 90Prime, Mosaic-3]
7   ``ZPT_LARGE`` 	  Zeropoint is too *high*: ``zpt`` > (``zpt0`` + Q) where Q is [0.25, 0.18, 0.8] mag for [DECam, 90Prime, Mosaic-3]
8   ``SKY_IS_BRIGHT``     Sky is too high; ``ccdskycounts`` is more than [90, 150, 180] for DECam [:math:`g, r, z`]; [200] for Mosaic-3 [:math:`z`] (no cuts are made for 90Prime)
9   ``BADEXP_FILE``       Exposure is listed in the ``bad_expid.txt`` file (`90prime-bad_expid.txt`_, `mosaic-bad_expid.txt`_ or `decam-bad_expid.txt`_)
10  ``PHRMS`` 	      	  *Photometric* calibration RMS is too large: ``ccdphrms`` > 0.2
11  ``RADECRMS`` 	  *Astrometric* calibration RMS is too large: rms (:math:`\sqrt(\mathtt{ccdrarms^2 + ccddecrms^2})` > 0.4 arcsec for DECam; 0.2 arcsec for 90Prime; 0.1 arcsec for Mosaic-3
12  ``SEEING_BAD`` 	  Bad seeing measure: (*seeing* < 0 arcsec OR *seeing* > 3.0 arcsec), where, e.g., ``seeing`` = ``fwhm`` :math:`\times` 0.262 for DECam
13  ``EARLY_DECAM``       Defined as ``MJD`` < 56516 (note that `DR8`_ started with ``MJD`` < 56730)
14  ``DEPTH_CUT`` 	  Depth cut code (this is run after the other cuts)
15  ``TOO_MANY_BAD_CCDS`` Remove full exposures if more than 70% of the CCDs are cut
16  ``FLAGGED_IN_DES``    Flagged as bad in DES
17  ``PHRMS_S7``          A special bit for the DECam S7 chip, indicating that an extra cut on ``ccdphrms`` (see, e.g., the `survey CCDs`_ file) of > 0.1 mag was included
18  ``DEPTH_CUT_2``       An additional depth cut was applied to allow this field to run to completion (likely because a particularly high source density made extractions intractable)
=== ===================== ===========================

Some of the exact values used to create the ``CCD_CUTS`` bitmask are recorded in the ``legacyzpts`` code for `90Prime`_, `Mosaic-3`_ and `DECam`_.

.. _`BASS`: ../../bass
.. _`DECaLS`: ../../decamls
.. _`MzLS`: ../../mzls
.. _`DR8`: ../../dr8/description
.. _`survey CCDs`: ../files/#survey-ccds-dr10-v7.fits-gz
.. _`used by the legacypipe code`: https://github.com/legacysurvey/legacypipe/blob/ac568487758f800e1ab5958d1d1de5582da22210/py/legacyzpts/psfzpt_cuts.py#L15
.. _`legacyzpts`: https://github.com/legacysurvey/legacyzpts/
.. _`mosaic-bad_expid.txt`: https://github.com/legacysurvey/legacypipe/blob/master/py/legacyzpts/data/mosaic-bad_expid.txt
.. _`90prime-bad_expid.txt`: https://github.com/legacysurvey/legacypipe/blob/master/py/legacyzpts/data/90prime-bad_expid.txt
.. _`decam-bad_expid.txt`: https://github.com/legacysurvey/legacypipe/blob/master/py/legacyzpts/data/decam-bad_expid.txt
.. _`90Prime`: https://github.com/legacysurvey/legacypipe/blob/ac568487758f800e1ab5958d1d1de5582da22210/py/legacyzpts/psfzpt_cuts.py#L291
.. _`Mosaic-3`: https://github.com/legacysurvey/legacypipe/blob/ac568487758f800e1ab5958d1d1de5582da22210/py/legacyzpts/psfzpt_cuts.py#L279
.. _`DECam`: https://github.com/legacysurvey/legacypipe/blob/ac568487758f800e1ab5958d1d1de5582da22210/py/legacyzpts/psfzpt_cuts.py#L304
