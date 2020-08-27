.. title: Interpretation of the bitmask column
.. slug: bitmask
.. tags: mathjax

.. |leq|    unicode:: U+2264 .. LESS-THAN-OR-EQUAL-TO SIGN
.. |geq|    unicode:: U+2265 .. GREATER-THAN-OR-EQUAL-TO SIGN
.. |deg|    unicode:: U+000B0 .. DEGREE SIGN

.. _`BASS`: ../bass
.. _`DECaLS`: ../decamls
.. _`MzLS`: ../mzls
.. _`DESI`: https://desi.lbl.gov
.. _`files page`: ../dr4/files
.. _`legacypipe`: https://github.com/legacysurvey/legacypipe

The ``ccds-`` and ``survey-`` files described on the DR4 `files page`_ contain a column ``bitmask``, which is defined as:


==== ========
Bit  Meaning
==== ========
0001 this exposure is flagged in the ``bad_expid`` file
0010 a zeropoint solution was not computed for these exposures, and so the ccdname disagrees with the hdu number
0100 these ccds had outlying values for astrometric or photometric offsets (:math:`\sqrt(` ``ccdrarms`` :math:`^2 +` ``ccddecrms`` :math:`^2) > 0.1` OR ``ccdphrms`` :math:`> 0.2`)
==== ========

The CCDs used by `legacypipe`_ can be determined via:
 
``photometric == True AND bitmask == 0``

Note that ``photometric``, ``ccdrarms``, ``ccddecrms`` and ``ccdphrms`` are all columns in the ``ccds-`` and ``survey-`` files described on the DR4 `files page`_.

