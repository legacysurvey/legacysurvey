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
3   ``GALAXY``  source lies in the pixels that define an `LSLGA`_ large galaxy
=== =========== ===============================================================

``MASKBITS``
============

These definitions apply to both the values in the ``coadd/*/*/*maskbits*`` *files* and to ``MASKBITS`` *columns* in the Tractor
and sweeps catalogs. See also the `legacypipe bitmask definitions`_.

=== ============= ===============================
Bit Name          Description
=== ============= ===============================
0   ``NPRIMARY``  touches a pixel that is outside the PRIMARY region of a brick
1   ``BRIGHT``    touches a pixel in a blob containing a bright (Tycho-2) star
2   ``SATUR_G``   touches a pixel that was saturated in at least one :math:`g`-band image
3   ``SATUR_R``   touches a pixel that was saturated in at least one :math:`r`-band image
4   ``SATUR_Z``   touches a pixel that was saturated in at least one :math:`z`-band image
5   ``ALLMASK_G`` touches a pixel that has any of the ``ALLMASK_G`` bits set
6   ``ALLMASK_R`` touches a pixel that has any of the ``ALLMASK_R`` bits set
7   ``ALLMASK_Z`` touches a pixel that has any of the ``ALLMASK_Z`` bits set
8   ``WISEM1``    touches a pixel that has any of the ``WISEMASK_W1`` bits set
9   ``WISEM2``    touches a pixel that has any of the ``WISEMASK_W2`` bits set
10  ``BAILOUT``   touches a pixel in a blob where we "bailed out" of source fitting
11  ``MEDIUM``    touches a pixel in a medium-bright (`Gaia`_ DR2) star
12  ``GALAXY``    touches a pixel in an `LSLGA`_ large galaxy
13  ``CLUSTER``   touches a pixel in a globular cluster
=== ============= ===============================

.. _`Gaia`: https://gea.esac.esa.int/archive/documentation//GDR2/Gaia_archive/chap_datamodel/sec_dm_main_tables/ssec_dm_gaia_source.html
.. _`LSLGA`: ../external

``ALLMASK_X``/``ANYMASK_X``
===========================

``ANYMASK_X`` denotes a source that touches a bad pixel in *any* of a set of overlapping :math:`X`-band images whereas
``ALLMASK_X`` denotes a source that touches a bad pixel in *all* of a set of overlapping :math:`X`-band images. 
See, also, the `legacypipe bitmask definitions`_. The 
``ANYMASK`` and ``ALLMASK`` bit masks are defined as follows, mostly from the CP (NOAO Community Pipeline) Data Quality bits.

=== =========================== ==================================================
Bit Attribute                   Description
=== =========================== ==================================================
  0 detector bad pixel/no data  See the `CP Data Quality bit description`_
  1 saturated                   See the `CP Data Quality bit description`_
  2 interpolated                See the `CP Data Quality bit description`_
  4 single exposure cosmic ray  See the `CP Data Quality bit description`_
  6 bleed trail                 See the `CP Data Quality bit description`_
  7 multi-exposure transient    See the `CP Data Quality bit description`_
  8 edge                        See the `CP Data Quality bit description`_
  9 edge2                       See the `CP Data Quality bit description`_
 11 outlier			Marked as touching an outlier pixel by ``legacypipe`` itself
=== =========================== ==================================================

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