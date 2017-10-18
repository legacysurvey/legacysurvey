.. title: Known Issues
.. slug: issues
.. tags: mathjax
.. description:

.. |deg|    unicode:: U+000B0 .. DEGREE SIGN
.. |Prime|    unicode:: U+02033 .. DOUBLE PRIME

For issues relevant to `BASS`_ or `MzLS`_ imaging, consult the `DR4 issues`_ page.

.. _`DR4 issues`: ../../dr4/issues
.. _`DECaLS`: ../../decamls
.. _`files`: ../files
.. _`catalogs page`: ../catalogs
.. _`MzLS`: ../../mzls
.. _`BASS`: ../../bass


One brick has depth information but isn't listed as being in DR5
================================================================

The depth file (**dr5-depth.fits.gz**) contains one brick that isn't listed as being in the 
survey (that isn't in the file **survey-bricks-dr5.fits.gz**). The brick ``0351m025`` failed during
processing, so doesn't have a Tractor catalog. However the coadds did run to completion for
brick ``0351m025``, so that brick *does* have depth information!

http://legacysurvey.org/viewer/dr5?brick=0351m025&bricks&zoom=11
