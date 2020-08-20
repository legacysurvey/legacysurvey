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

In DR5, we estimate that there are a few hundred duplicates, based on finding of 
order 20 repeat sources in a scan of 7000 of the 176,811 DR5 bricks.

Brick ``0351m025``
==================

Brick ``0351m025`` failed during
processing, so doesn't have a Tractor catalog. However the coadds did run to completion for
brick ``0351m025``. We've tried to redact brick ``0351m025`` from all of the relevant
files, but we may not have completely removed it from all possible places in DR5. It could,
for instance, still appear in the viewer:


https://www.legacysurvey.org/viewer/dr5?brick=0351m025&bricks&zoom=11

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

Update to ``ccds-annotated-`` file in early December, 2017
==========================================================

The ``ccds-annotated-dr5.fits.gz`` file provided with the original DR5 release included a 
``photometric`` binary column that was computed based on zeropoints from our "traditional" IDL 
zeropoints code.  However, during DR5 processing we used our new Python-based ``legacyzpts`` 
code to produce zeropoints, and we performed a photometric cut based on those zeropoints.  As a 
result, some CCDs that appeared in the original ``ccds-annotated-dr5.fits.gz`` file with 
the ``photometric`` flag set to ``True`` were *not* actually used in the DR5 reductions.

The updated ``ccds-annotated-dr5.fits.gz`` file (replaced on December 7th, 2017)
includes a new column, ``new_photometric``, that contains the correct set of CCDs used in
the DR5 reductions. In addition, there were 228 CCDs for which annotations were not 
computed in the original file, and these are added in the update.

The original ``ccds-annotated-`` file is still available in the DR5 release directory. It
has been renamed to ``ccds-annotated-dr5-2017-12-07.fits.gz``.
