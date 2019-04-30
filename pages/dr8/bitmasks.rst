.. title: DR8 bitmasks
.. slug: bitmasks
.. tags: mathjax

.. |leq|    unicode:: U+2264 .. LESS-THAN-OR-EQUAL-TO SIGN
.. |geq|    unicode:: U+2265 .. GREATER-THAN-OR-EQUAL-TO SIGN
.. |deg|    unicode:: U+000B0 .. DEGREE SIGN


This page details the meaning of several of the optical bitmasks, circa Data Release 8 of the Legacy Surveys. The bits are
enumerated as a power (i.e. ``7`` written in a column of bits means `two-to-the-power-of-7`).

``MASKBITS``
============

These definitions apply to both the values in the ``*maskbits*`` *files* and to ``MASKBITS`` *columns*.
See also https://github.com/legacysurvey/legacypipe/blob/976d2ed6d3ebfad7feb7745560802e64e46caccc/py/legacypipe/survey.py#L34-L49.
Note that the difference between bits 1, 11, 12 and 13 for ``MASKBITS`` as compared to bits 0, 1, 2, 3 for ``BRIGHTBLOB`` is that
``BRIGHTBLOB`` is set based on an *initial* position (the source detection integer pixel peak), while ``MASKBITS`` is set *after* 
fitting has finished (i.e., on the final brick pixel position).

=== ==============================================================
Bit Meaning
=== ==============================================================
0   ``NPRIMARY``  (not brick primary)
1   ``BRIGHT``    (bright star in blob)
2   ``SATUR_G``   (g saturated + margin)
3   ``SATUR_R``   (r saturated + margin)
4   ``SATUR_Z``   (z saturated + margin)
5   ``ALLMASK_G`` (any ``ALLMASK_G`` bit is set)
6   ``ALLMASK_R`` (any ``ALLMASK_R`` bit is set)
7   ``ALLMASK_Z`` (any ``ALLMASK_Z`` bit is set)
8   ``WISEM1``    (in the WISE W1 bright star mask)
9   ``WISEM2``    (in the WISE W2 bright star mask)
10  ``BAILOUT``   (Bailed out of during processing)
11  ``MEDIUM``    (in a medium-bright star)
12  ``GALAXY``    (in an LSLGA large galaxy)
13  ``CLUSTER``   (in a globular luster)
=== ==============================================================


``BRIGHTBLOB``
==============

See also https://github.com/legacysurvey/legacypipe/blob/976d2ed6d3ebfad7feb7745560802e64e46caccc/py/legacypipe/survey.py#L51-L57.
Note that the difference between bits 1, 11, 12 and 13 for ``MASKBITS`` as compared to bits 0, 1, 2, 3 for ``BRIGHTBLOB`` is that
``BRIGHTBLOB`` is set based on an *initial* position (the source detection integer pixel peak), while ``MASKBITS`` is set *after* 
fitting has finished (i.e., on the final brick pixel position).

=== ==============================================================
Bit Meaning
=== ==============================================================
0   source lies in the pixels that define a bright star (Tycho)
1   source lies in the pixels that define medium bright star (GAIA)
2   source lies in the pixels that define a globular cluster
3   source lies in the pixels that define a large galaxy
=== ==============================================================


``ALLMASK/ANYMASK``
===================

=== ===========
Bit Meaning
=== ===========
0   ``badpix``
1   ``satur``
2   ``interp``
3
4   ``cr``
5
6   ``bleed``
7   ``trans``
8   ``edge``
9   ``edge2``
10
11  ``outlier``
=== ===========


