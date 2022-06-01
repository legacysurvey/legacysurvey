.. title: Known Issues
.. slug: issues
.. tags: 
.. has_math: yes

.. |deg|    unicode:: U+000B0 .. DEGREE SIGN
.. |Prime|    unicode:: U+02033 .. DOUBLE PRIME

For issues relevant to `DECaLS`_ imaging, consult the `DR5 issues`_ page.

.. _`DR5 issues`: ../../dr5/issues
.. _`DECaLS`: ../../decamls
.. _`files`: ../files
.. _`catalogs page`: ../catalogs
.. _`MzLS`: ../../mzls
.. _`BASS`: ../../bass
.. _`description page`: ../description

Repeat Sources Due to Check-pointing
====================================

The legacypipe code applied a series of check-points in case of failures during
processing. Unfortunately, when the code resumed after a check-point failure, it
sometimes produced a duplicate of the same source. These duplicates can be identified
because they have identical coordinates and fluxes but a different ``OBJID``. An
example repeated source is here:

https://www.legacysurvey.org/viewer-dev?ra=215.8471&dec=0.0805&zoom=16&layer=decals-dr5&sources-dr5&bricks

This source has the following attributes in catalog-level DR5 data:

=========== =========== ===========
Attribute   Source 1    Source 2
=========== =========== ===========
``RA``      215.84766   215.84766
``DEC``     0.080533681 0.080533681
``BRICKID`` 331231      331231
``OBJID``   4938        4941
``TYPE``    DEV         DEV
``FLUX_G``  5.86150     5.86150
``FLUX_R``  22.1008     22.1008
``FLUX_Z``  47.8499     47.8499
``FLUX_W1`` 28.0480     28.0480
=========== =========== ===========

(i.e. fluxes and coordinates are identical but ``OBJID`` is different).

In DR6, we estimate that there are many thousands of duplicates spread across
264 bricks. The full list of DR6 bricks that contain duplicates, and the number of
duplicates in each brick, is available `here`_.

.. _`here`: ../../files/dups_bricks_dr6.dat

One brick was processed with a different pipeline version
=========================================================

Brick *1228p810* was processed with a different stack of codes, as detailed at the
bottom of the `description page`_.
