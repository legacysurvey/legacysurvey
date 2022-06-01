.. title: Known Issues
.. slug: issues
.. date: 2012-11-08 00:06:06
.. tags: 
.. has_math: yes

.. |deg|    unicode:: U+000B0 .. DEGREE SIGN
.. |Prime|    unicode:: U+02033 .. DOUBLE PRIME

For issues relevant to `BASS`_ or `MzLS`_ imaging, consult the `DR6 issues`_ page.

DR7.1 update to sweeps files
============================
The column ``BRIGHTSTARINBLOB`` was not initially included in the DR7 sweeps
files. In addition, the ``GAIA_DUPLICATED_SOURCE`` column in the DR7 sweeps files
was initially included as type *int8* rather than being passed through as a
*boolean* from the Tractor files. The DR7.1 sweeps files were provided as an
update to rectify these issues.

Smaller subsets of files of random points
=========================================
On August 23, 2018, the ``randoms-dr7.fits`` file initially supplied with DR7
was split into smaller files in a dedicated ``randoms`` directory for ease of use.

DR1 and DR2 coadd files have been deprecated
============================================

On August 23rd, 2018, the DR1 and DR2 coadd directories were removed to
save space. Data from those directories is still
available via FTP from the Astro Data Lab's archive for `DR1`_ and `DR2`_.

Spurious extended sources exist across brick boundaries
=======================================================

In DR7, sources in a blob that touched a bright star were forced to ``type=PSF`` and
the ``BRIGHTSTARINBLOB`` column was set for these sources. However, sources for
which the blob crossed brick boundaries were *not* forced to ``type=PSF``. This is
illustrated in the figure below, where objects labeled ``BGS_BRIGHT`` are
extended sources that lie across a brick boundary that touches a bright star.

.. image:: /files/brickcrossDR7.png
   :height: 500
   :width: 575
   :scale: 85

.. _`DR1`: ftp://archive.noao.edu/public/hlsp/decals/dr1/coadd/
.. _`DR2`: ftp://archive.noao.edu/public/hlsp/decals/dr2/coadd/
.. _`DR6 issues`: ../../dr6/issues
.. _`DECaLS`: ../../decamls
.. _`files`: ../files
.. _`catalogs page`: ../catalogs
.. _`MzLS`: ../../mzls
.. _`BASS`: ../../bass
