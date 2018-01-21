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


Brick ``0351m025``
==================

Brick ``0351m025`` failed during
processing, so doesn't have a Tractor catalog. However the coadds did run to completion for
brick ``0351m025``. We've tried to redact brick ``0351m025`` from all of the relevant
files, but we may not have completely removed it from all possible places in DR5. It could,
for instance, still appear in the viewer:


http://legacysurvey.org/viewer/dr5?brick=0351m025&bricks&zoom=11

Missing CCDs in the region of Gaia bright stars
===============================================

Some DECam CCDs that are included in DR3 are not included in the DR5 release. This is because the 
DR3 zeropoints were based on comparisons to stars from PanSTARRS Data Release 1 (PS1), whereas 
the DR5 zeropoints are based on comparisons to the subset of PS1 stars that are also in the 
Gaia Data Release 1 catalog. DR1 of Gaia has "holes" in its coverage, with large spatial regions 
missing PS1 stars. An example is shown in the figure below, which plots the PS1 calibrators 
(black dots) and the PS1-Gaia calibrators (blue dots) with the outlines of the DECam CCDs. 
Since only CCDs with > 20 matched calibrators are retained in the DR5 version of the catalog, 
CCDs covering regions like CCD N26 in the figure would be dropped from DR5.

.. image:: /files/DR5missingCCDs.png
   :height: 500
   :width: 700
   :scale: 85