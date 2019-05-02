.. title: DR8 bitmasks
.. slug: bitmasks
.. tags: mathjax

.. class:: pull-right well

.. contents::


This page details the meaning of several of the optical bitmasks, circa Data Release 8 of the Legacy Surveys. The bits are
enumerated as a power (i.e. ``7`` written in a column of bits means `two-to-the-power-of-7`).

``BRIGHTBLOB``
==============

See also the  `legacypipe definition of BRIGHTBLOB`_.
Note that the difference between bits 0, 1, 2, 3 for ``BRIGHTBLOB`` as compared to bits 1, 11, 12 and 13 for ``MASKBITS`` is that
``BRIGHTBLOB`` is set based on an *initial* position (the source detection integer pixel peak), while ``MASKBITS`` is set *after* 
fitting has finished (i.e., on the final brick pixel position). This can lead to slight differences (~0.15%) in the areas
covered by the ``MASKBITS`` and ``BRIGHTBLOB`` masks.

.. _`legacypipe definition of BRIGHTBLOB`: https://github.com/legacysurvey/legacypipe/blob/976d2ed6d3ebfad7feb7745560802e64e46caccc/py/legacypipe/survey.py#L51-L57

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
and sweeps catalogs. See also the `legacypipe definition of MASKBITS`_.

.. _`legacypipe definition of MASKBITS`: https://github.com/legacysurvey/legacypipe/blob/976d2ed6d3ebfad7feb7745560802e64e46caccc/py/legacypipe/survey.py#L34-L49.

=== ============= ===============================
Bit Name          Description
=== ============= ===============================
0   ``NPRIMARY``  not brick primary
1   ``BRIGHT``    bright star in blob
2   ``SATUR_G``   :math:`g` saturated + margin
3   ``SATUR_R``   :math:`r` saturated + margin
4   ``SATUR_Z``   :math:`z` saturated + margin
5   ``ALLMASK_G`` any ``ALLMASK_G`` bit is set
6   ``ALLMASK_R`` any ``ALLMASK_R`` bit is set
7   ``ALLMASK_Z`` any ``ALLMASK_Z`` bit is set
8   ``WISEM1``    in the WISE W1 bright star mask
9   ``WISEM2``    in the WISE W2 bright star mask
10  ``BAILOUT``   Bailed out of during processing
11  ``MEDIUM``    in a medium-bright star
12  ``GALAXY``    in an `LSLGA`_ large galaxy
13  ``CLUSTER``   in a globular cluster
=== ============= ===============================

.. _`LSLGA`: ../external

``ALLMASK``/``ANYMASK``
=======================

The ``ANYMASK`` and ``ALLMASK`` bit masks are defined as follows from the CP (NOAO Community Pipeline) Data Quality bits.

=== =========================== ==================================================
Bit Attribute                   Description
=== =========================== ==================================================
  0 detector bad pixel/no data  See the `CP Data Quality bit description`_.
  1 saturated                   See the `CP Data Quality bit description`_.
  2 interpolated                See the `CP Data Quality bit description`_.
  4 single exposure cosmic ray  See the `CP Data Quality bit description`_.
  6 bleed trail                 See the `CP Data Quality bit description`_.
  7 multi-exposure transient    See the `CP Data Quality bit description`_.
  8 edge                        See the `CP Data Quality bit description`_.
  9 edge2                       See the `CP Data Quality bit description`_.
 10 longthin                    :math:`\gt 5\sigma` connected components with major axis :math:`\gt 200` pixels and major/minor axis :math:`\gt 0.1`.  To mask, *e.g.*, satellite trails.
 11 outlier
=== =========================== ==================================================

.. _`CP Data Quality bit description`: http://www.noao.edu/noao/staff/fvaldes/CPDocPrelim/PL201_3.html

``WISEMASK_W1``/``WISEMASK_W2``
===============================

=== ===================================
Bit Description
=== ===================================
0   W1 bright star, southward scan
1   W1 bright star, northward scan
2   W2 bright star, southward scan
3   W2 bright star, northward scan
4   W1 bright star saturation
5   W2 bright star saturation
6   center of pixel not primary
7   W1 bright star, centroid off edge
8   W2 bright star, centroid off edge
9   resolved galaxy
10  big object (LMC, SMC, M31)
11  W2 optical ghost, southward scan
12  W2 optical ghost, northward scan
13  W1 first latent, southward scan
14  W1 first latent, northward scan
15  W2 first latent, southward scan
16  W2 first latent, northward scan
17  W1 second latent, southward scan
18  W1 second latent, northward scan
19  W2 second latent, southward scan
20  W2 second latent, northward scan
21  may contain W1 bright star centroid
22  may contain W2 bright star centroid
23  AllWISE-like W1 circular halo
24  AllWISE-like W2 circular halo
25  W1 optical ghost, southward scan
26  W1 optical ghost, northward scan
27  PSF-based W1 diffraction spike
28  PSF-based W2 diffraction spike
29  geometric W1 diffraction spike
30  geometric W2 diffraction spike
=== ===================================

See `Aaron Meisner's unWISE documentation`_ for further details.

.. _`Aaron Meisner's unWISE documentation`: http://catalog.unwise.me/files/unwise_bitmask_writeup-03Dec2018.pdf
