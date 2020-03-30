.. title: DR9 bitmasks
.. slug: bitmasks
.. tags: mathjax

.. class:: pull-right well

.. contents::


This page details the meaning of the bitmasks provided with Data Release 9 of the Legacy Surveys. The bits are
enumerated as a power (i.e. ``7`` written in a column of bits means `two-to-the-power-of-7`).

``BRIGHTBLOB``
==============

See also the `legacypipe bitmask definitions`_.
Note that the difference between bits 0, 1, 2, 3 for ``BRIGHTBLOB`` as compared to bits 1, 11, 12 and 13 for ``MASKBITS`` is that
``BRIGHTBLOB`` is set based on an *initial* position (the source detection integer pixel peak), while ``MASKBITS`` is set *after* 
fitting has finished (i.e., on the final brick pixel position). This can lead to slight differences (~0.15%) in the areas
covered by the ``MASKBITS`` and ``BRIGHTBLOB`` masks.

.. _`legacypipe bitmask definitions`: https://github.com/legacysurvey/legacypipe/blob/master/py/legacypipe/bits.py

=== =========== ===============================================================
Bit Name        Description
=== =========== ===============================================================
0   ``BRIGHT``  source lies in the pixels that define a bright star (Tycho)
1   ``MEDIUM``  source lies in the pixels that define medium bright star (GAIA)
2   ``CLUSTER`` source lies in the pixels that define a globular cluster
3   ``GALAXY``  source lies in the pixels that define an `LSLGA`_ large galaxy
=== =========== ===============================================================

``MASKBITS``
============

These definitions apply to both the values in the ``coadd/*/*/*maskbits*`` *files* and to ``MASKBITS`` *columns* in the Tractor
and sweeps catalogs. See also the `legacypipe bitmask definitions`_.

=== ============= ===============================
Bit Name          Description
=== ============= ===============================
0   ``NPRIMARY``  touches a pixel that is outside the ``BRICK_PRIMARY`` region of a brick
1   ``BRIGHT``    touches a pixel within the locus of a `radius-magnitude relation for Tycho-2 stars`_ or one `for (G < 13) Gaia DR2 stars`_
2   ``SATUR_G``   touches a pixel that was saturated in at least one :math:`g`-band image
3   ``SATUR_R``   touches a pixel that was saturated in at least one :math:`r`-band image
4   ``SATUR_Z``   touches a pixel that was saturated in at least one :math:`z`-band image
5   ``ALLMASK_G`` touches a pixel that has any of the ``ALLMASK_G`` bits set
6   ``ALLMASK_R`` touches a pixel that has any of the ``ALLMASK_R`` bits set
7   ``ALLMASK_Z`` touches a pixel that has any of the ``ALLMASK_Z`` bits set
8   ``WISEM1``    touches a pixel in a ``WISEMASK_W1`` bright star mask
9   ``WISEM2``    touches a pixel in a ``WISEMASK_W2`` bright star mask
10  ``BAILOUT``   touches a pixel in a blob where we "bailed out" of source fitting
11  ``MEDIUM``    touches a pixel within the locus of a `radius-magnitude relation for (13 < G < 16) Gaia DR2 stars`_
12  ``GALAXY``    touches a pixel in an `LSLGA`_ large galaxy
13  ``CLUSTER``   touches a pixel in a globular cluster
=== ============= ===============================

.. _`radius-magnitude relation for Tycho-2 stars`: https://github.com/legacysurvey/legacypipe/blob/65d71a6b0d0cc2ab94d497770346ff6241020f80/py/legacypipe/reference.py#L258
.. _`for (G < 13) Gaia DR2 stars`: https://github.com/legacysurvey/legacypipe/blob/65d71a6b0d0cc2ab94d497770346ff6241020f80/py/legacypipe/reference.py#L196
.. _`radius-magnitude relation for (13 < G < 16) Gaia DR2 stars`: https://github.com/legacysurvey/legacypipe/blob/65d71a6b0d0cc2ab94d497770346ff6241020f80/py/legacypipe/reference.py#L196
.. _`Gaia`: https://gea.esac.esa.int/archive/documentation//GDR2/Gaia_archive/chap_datamodel/sec_dm_main_tables/ssec_dm_gaia_source.html
.. _`LSLGA`: ../external

``ALLMASK_X``/``ANYMASK_X``
===========================

``ANYMASK_X`` denotes a source that touches a bad pixel in *any* of a set of overlapping :math:`X`-band images whereas
``ALLMASK_X`` denotes a source that touches a bad pixel in *all* of a set of overlapping :math:`X`-band images. 
See, also, the `legacypipe bitmask definitions`_. The 
``ANYMASK`` and ``ALLMASK`` bit masks are defined as follows, mostly from the CP (NOAO Community Pipeline) Data Quality bits.

=== =========== ==========================================================================
Bit Name        Description
=== =========== ==========================================================================
  0 ``BADPIX``  bad columns, hot pixels, etc. (see the `CP Data Quality bit description`_)
  1 ``SATUR``   saturated (see the `CP Data Quality bit description`_)
  2 ``INTERP``  interpolated (see the `CP Data Quality bit description`_)
  4 ``CR``      single exposure cosmic ray (see the `CP Data Quality bit description`_)
  6 ``BLEED``   bleed trail (see the `CP Data Quality bit description`_)
  7 ``TRANS``   multi-exposure transient (see the `CP Data Quality bit description`_)
  8 ``EDGE``    edge pixel (see the `CP Data Quality bit description`_)
  9 ``EDGE2``   edge pixel (see the `CP Data Quality bit description`_)
 11 ``OUTLIER`` marked as touching an outlier pixel by ``legacypipe`` itself
=== =========== ==========================================================================

.. _`CP Data Quality bit description`: http://www.noao.edu/noao/staff/fvaldes/CPDocPrelim/PL201_3.html

``WISEMASK_W1``/``WISEMASK_W2``
===============================

``WISEMASK_W1`` and ``WISEMASK_W2`` have identical bit definitions, the only difference is that ``WISEMASK_W1`` applies to masking in the W1 band
and ``WISEMASK_W2`` to masking in the W2 band.

=== =========== ===========================
Bit Name        Description
=== =========== ===========================
0   ``BRIGHT``  Bright star core and wings
1   ``SPIKE``   PSF-based diffraction spike
2   ``GHOST``   Optical ghost
3   ``LATENT``  First latent
4   ``LATENT2`` Second latent image
5   ``HALO``    AllWISE-like circular halo
6   ``SATUR``   Bright star saturation
7   ``SPIKE2``  Geometric diffraction spike
=== =========== ===========================

`Aaron Meisner's unWISE documentation`_ details how these masks were derived.

.. _`Aaron Meisner's unWISE documentation`: http://catalog.unwise.me/files/unwise_bitmask_writeup-03Dec2018.pdf

``CCD_CUTS``
============
`Files`_ such as the ``survey-ccds-<camera>-dr9.fits.gz`` file and the forced photometry files include a bitmask ``ccd_cuts`` that
is `used by the legacypipe code`_ to discard CCDs before processing imaging for the Legacy Surveys. Any observations with
non-zero vales of ``ccd_cuts`` are discarded prior to processing.

=== ===================== ===========================
Bit Name                  Description
=== ===================== ===========================
0   ``err_legacyzpts``    Some error from the ``legacyzpts`` code (e.g., the CP had a WCS error, usually due to being very shallow)
1   ``not_grz`` 	  Not a :math:`g`-, :math:`r`- or :math:`z`-band observation
2   ``not_third_pix``     Mosaic-3 one-third-pixel interpolation problem
3   ``exptime_lt_30``     Exposure time < 30 seconds
4   ``ccdnmatch_lt_20``   ``CCDNMATCH`` < 20
5   ``zpt_diff_avg``      Zeropoint for CCD is different than the average for the exposure: abs(``ccdzpt`` - ``zpt``) > 0.25 for DECam, 0.2 for 90Prime, 0.1 for Mosaic-3
6   ``zpt_small`` 	  Zeropoint is too *low*: less than [0.5, 0.5, 1.0] mag below nominal for [DECam, 90Prime, Mosaic-3]
7   ``zpt_large`` 	  Zeropoint is too *high*: more than [0.35, 0.18, 0.4] mag above nominal for [DECam, 90Prime, Mosaic-3]
8   ``sky_is_bright``     Sky is too high; more than [90, 150, 180] for DECam [:math:`g, r, z`]; [150, 150] for 90Prime [:math:`g, r`]; [250] for Mosaic-3 [:math:`z`]
9   ``badexp_file``       Exposure is listed in the ``bad_expid.txt`` file
10  ``phrms`` 	      	  *Photometric* calibration RMS is too big: ``ccdphrms`` > 0.2
11  ``radecrms`` 	  *Astrometric* calibration RMS is too large: rms (:math:`\sqrt(\mathrm{CCDRARMS^2 + CCDDECRMS^2})` > 0.4 arcsec for DECam; 0.2 arcsec for 90Prime; 0.1 arcsec for Mosaic-3
12  ``seeing_bad`` 	  Bad seeing measure: (``seeing`` < 0 OR ``seeing`` > 3.0), where ``seeing`` = ``fwhm`` :math:`\times` 0.262 for DECam
13  ``early_decam``       Defined as ``MJD`` < 56516 (note that `DR8`_ started with ``MJD`` < 56730)
14  ``depth_cut`` 	  Depth cut code (this is run after the other cuts)
15  ``too_many_bad_ccds`` Remove full exposures if more than 70% of the CCDs are cut
16  ``flagged_in_des``    Flagged as bad in DES 
=== ===================== ===========================

.. _`DR8`: ../../dr8/description
.. _`Files`: ../files
.. _`used by the legacypipe code`: https://github.com/legacysurvey/legacypipe/blob/ac568487758f800e1ab5958d1d1de5582da22210/py/legacyzpts/psfzpt_cuts.py#L15