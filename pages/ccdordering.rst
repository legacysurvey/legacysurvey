.. title: Ordering of the CCD corners for the Legacy Surveys
.. slug: ccdordering
.. tags: mathjax

.. |leq|    unicode:: U+2264 .. LESS-THAN-OR-EQUAL-TO SIGN
.. |geq|    unicode:: U+2265 .. GREATER-THAN-OR-EQUAL-TO SIGN
.. |deg|    unicode:: U+000B0 .. DEGREE SIGN

.. _`BASS`: ../bass
.. _`DECaLS`: ../decamls
.. _`MzLS`: ../mzls
.. _`DESI`: http://desi.lbl.gov
.. _`files page`: ../dr5/files

The ordering of the CCD vertices is different for `BASS`_, `MzLS`_ and `DECaLS`_. For each individual survey, the CCD corners are ordered as in the table below, in which RA increases to the right and Dec increases upwards.

In the table, ``0`` denotes [``ra0``, ``dec0``], ``1`` denotes [``ra1``, ``dec1``], ``2`` denotes [``ra2``, ``dec2``] and ``3`` denotes [``ra3``, ``dec3``]. The quantities ``ra0``, ``dec0``, ``ra1``, ``dec1``, etc. are defined in the data model for the ``ccds-`` files on the `files page`_. 

+----------+---------+
|  Survey  | Order   |
+==========+=========+
|          |``0   1``|
|`DECaLS`_ |         |
|          |``3   2``|
+----------+---------+
|          |``1   0``|
|`BASS`_   |         |
| 	   |``2   3``|
+----------+---------+
|          |``3   2``|
|`MzLS`_   |         |
| 	   |``0   1``|
+----------+---------+

Note that for 2084 MzLS exposures the column ordering is reversed. These exposures were taken when the telescope was pointing at 
hour angles (h.a.) of more than 6 hours; specifically at locations beyond the great circle that passes through the north celestial pole and the points Dec = 0, h.a. = +/- 6h.

