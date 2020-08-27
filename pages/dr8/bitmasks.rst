.. title: DR8 bitmasks
.. slug: bitmasks
.. tags: mathjax

.. class:: pull-right well

.. contents::


This page details the meaning of the bitmasks provided with Data Release 8 of the Legacy Surveys. The bits are
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
3   ``GALAXY``  source lies in the pixels that define an `SGA`_ large galaxy
=== =========== ===============================================================

``MASKBITS``
============

These definitions apply to both the values in the ``coadd/*/*/*maskbits*`` *files* and to ``MASKBITS`` *columns* in the Tractor
and sweeps catalogs. See also the `legacypipe bitmask definitions`_.

=== ============= ===============================
Bit Name          Description
=== ============= ===============================
0   ``NPRIMARY``  touches a pixel that is outside the ``BRICK_PRIMARY`` region of a brick
1   ``BRIGHT``    touches a pixel within the locus of a `radius-magnitude relation for Tycho-2 stars`_ or one `for Gaia DR2`_ stars `to G < 13`_
2   ``SATUR_G``   touches a pixel that was saturated in at least one :math:`g`-band image
3   ``SATUR_R``   touches a pixel that was saturated in at least one :math:`r`-band image
4   ``SATUR_Z``   touches a pixel that was saturated in at least one :math:`z`-band image
5   ``ALLMASK_G`` touches a pixel that has any of the ``ALLMASK_G`` bits set
6   ``ALLMASK_R`` touches a pixel that has any of the ``ALLMASK_R`` bits set
7   ``ALLMASK_Z`` touches a pixel that has any of the ``ALLMASK_Z`` bits set
8   ``WISEM1``    touches a pixel in a ``WISEMASK_W1`` bright star mask
9   ``WISEM2``    touches a pixel in a ``WISEMASK_W2`` bright star mask
10  ``BAILOUT``   touches a pixel in a blob where we "bailed out" of source fitting
11  ``MEDIUM``    touches a pixel within the locus of a `radius-magnitude relation for Gaia DR2`_ stars `to G < 16`_
12  ``GALAXY``    touches a pixel in an `SGA`_ large galaxy
13  ``CLUSTER``   touches a pixel in a globular cluster
=== ============= ===============================

.. _`radius-magnitude relation for Tycho-2 stars`: https://github.com/legacysurvey/legacypipe/blob/65d71a6b0d0cc2ab94d497770346ff6241020f80/py/legacypipe/reference.py#L258
.. _`for Gaia DR2`: https://github.com/legacysurvey/legacypipe/blob/65d71a6b0d0cc2ab94d497770346ff6241020f80/py/legacypipe/reference.py#L196
.. _`radius-magnitude relation for Gaia DR2`: https://github.com/legacysurvey/legacypipe/blob/65d71a6b0d0cc2ab94d497770346ff6241020f80/py/legacypipe/reference.py#L196
.. _`to G < 13`: https://github.com/legacysurvey/legacypipe/blob/65d71a6b0d0cc2ab94d497770346ff6241020f80/py/legacypipe/reference.py#L48
.. _`to G < 16`: https://github.com/legacysurvey/legacypipe/blob/65d71a6b0d0cc2ab94d497770346ff6241020f80/py/legacypipe/reference.py#L49
.. _`Gaia`: https://gea.esac.esa.int/archive/documentation//GDR2/Gaia_archive/chap_datamodel/sec_dm_main_tables/ssec_dm_gaia_source.html
.. _`SGA`: ../external

``ALLMASK_X``/``ANYMASK_X``
===========================

``ANYMASK_X`` denotes a source that touches a bad pixel in *any* of a set of overlapping :math:`X`-band images whereas
``ALLMASK_X`` denotes a source that touches a bad pixel in *all* of a set of overlapping :math:`X`-band images. 
See, also, the `legacypipe bitmask definitions`_. The 
``ANYMASK`` and ``ALLMASK`` bit masks are defined as follows, mostly from the CP (NSF's OIR Lab Community Pipeline) `Data Quality bits`_,
which we `map to the values in the table`_.

=== =========== =========================
Bit Name        Description
=== =========== =========================
  0 ``BADPIX``  bad columns, hot pixels, etc.
  1 ``SATUR``   saturated
  2 ``INTERP``  interpolated
  4 ``CR``      single exposure cosmic ray
  6 ``BLEED``   bleed trail
  7 ``TRANS``   multi-exposure transient
  8 ``EDGE``    edge pixel
  9 ``EDGE2``   edge pixel
 11 ``OUTLIER`` marked as touching an outlier pixel by ``legacypipe`` itself
=== =========== =========================

.. _`Data Quality bits`: https://www.noao.edu/noao/staff/fvaldes/CPDocPrelim/PL201_3.html
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
