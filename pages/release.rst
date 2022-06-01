.. title: Mapping RELEASE to camera and filters
.. slug: release
.. date: 2012-11-08 00:06:06
.. tags:
.. has_math: yes

.. |leq|    unicode:: U+2264 .. LESS-THAN-OR-EQUAL-TO SIGN
.. |geq|    unicode:: U+2265 .. GREATER-THAN-OR-EQUAL-TO SIGN
.. |deg|    unicode:: U+000B0 .. DEGREE SIGN
.. |g| replace:: :math:`g`
.. |r| replace:: :math:`r`
.. |z| replace:: :math:`z`
.. |W1| replace:: :math:`W1`
.. |W2| replace:: :math:`W2`
.. |W3| replace:: :math:`W3`
.. |W4| replace:: :math:`W4`


.. _`BASS`: ../bass
.. _`DECaLS`: ../decamls
.. _`MzLS`: ../mzls
.. _`DESI`: https://desi.lbl.gov

These tables contains information regarding how the RELEASE integer corresponds to the cameras and filter set used for an observation.

DR9
---

========= ====== ========= ====== ====== =======
RELEASE	  CAMERA RELEASE   CAMERA FILTER PRIMARY
========= ====== ========= ====== ====== =======
9010/9012 decam  9011      bok    |g|    1
9010/9012 decam  9011      bok    |r|    1
9010/9012 decam  9011      mosaic |z|    1
9010/9012 wise   9011      wise   |W1|   0
9010/9012 wise   9011      wise   |W2|   0
9010/9012 wise   9011      wise   |W3|   0
9010/9012 wise   9011      wise   |W4|   0
========= ====== ========= ====== ====== =======

Note that all of the objects in DR9 across a total of 1691 bricks have a ``RELEASE`` number of ``9012``
instead of ``9010``. This was because these bricks required additional processing, which altered the
sources that were extracted on these bricks. See also the `known issues page`_.

.. _`known issues page`: ../dr9/issues#bricks-that-were-processed-using-the-burst-buffer-at-nersc

DR8
---

======= ====== ======= ====== ====== =======
RELEASE	CAMERA RELEASE CAMERA FILTER PRIMARY
======= ====== ======= ====== ====== =======
8000	decam  8001    bok    |g|    1
8000	decam  8001    bok    |r|    1
8000	decam  8001    mosaic |z|    1
8000	wise   8001    wise   |W1|   0
8000    wise   8001    wise   |W2|   0
8000	wise   8001    wise   |W3|   0
8000	wise   8001    wise   |W4|   0
======= ====== ======= ====== ====== =======

DR7
---

======= ====== ====== =======
RELEASE	CAMERA FILTER PRIMARY
======= ====== ====== =======
7000	decam  |g|    1
7000	decam  |r|    1
7000	decam  |z|    1
7000	wise   |W1|   0
7000    wise   |W2|   0
7000	wise   |W3|   0
7000	wise   |W4|   0
======= ====== ====== =======

DR6
---

======= ====== ====== =======
RELEASE	CAMERA FILTER PRIMARY
======= ====== ====== =======
6000	bok    |g|    1
6000	bok    |r|    1
6000	mosaic |z|    1
6000	wise   |W1|   0
6000    wise   |W2|   0
6000	wise   |W3|   0
6000	wise   |W4|   0
======= ====== ====== =======

DR5
---

======= ====== ====== =======
RELEASE	CAMERA FILTER PRIMARY
======= ====== ====== =======
5000	decam  |g|    1
5000	decam  |r|    1
5000	decam  |z|    1
5000	wise   |W1|   0
5000    wise   |W2|   0
5000	wise   |W3|   0
5000	wise   |W4|   0
======= ====== ====== =======

DR4
---

======= ====== ====== =======
RELEASE	CAMERA FILTER PRIMARY
======= ====== ====== =======
4000	bok    |g|    1
4000	bok    |r|    1
4000	mosaic |z|    1
4000	wise   |W1|   0
4000    wise   |W2|   0
4000	wise   |W3|   0
4000	wise   |W4|   0
======= ====== ====== =======
