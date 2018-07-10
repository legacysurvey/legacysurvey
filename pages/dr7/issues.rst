.. title: Known Issues
.. slug: issues
.. tags: mathjax
.. description:

.. |deg|    unicode:: U+000B0 .. DEGREE SIGN
.. |Prime|    unicode:: U+02033 .. DOUBLE PRIME

For issues relevant to `BASS`_ or `MzLS`_ imaging, consult the `DR6 issues`_ page.

.. _`DR6 issues`: ../../dr6/issues
.. _`DECaLS`: ../../decamls
.. _`files`: ../files
.. _`catalogs page`: ../catalogs
.. _`MzLS`: ../../mzls
.. _`BASS`: ../../bass


Bricks that failed during processing?
=====================================

Brick X failed during
processing, so doesn't have a Tractor catalog. However the coadds did run to completion for
brick X. We've tried to redact brick X from all of the relevant
files, but we may not have completely removed it from all possible places in DR5. It could,
for instance, still appear in the viewer:


http://legacysurvey.org/viewer/dr7?brick=&bricks&zoom=11

Missing CCDs in the region of Gaia bright stars?
================================================