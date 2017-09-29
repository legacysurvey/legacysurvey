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


"Infs" and "NaNs" in Tractor Catalogues
=======================================

There are three places where "Inf" or "NaN" can occur in the tractor catalogues. Note, any Inf or Nan in ``flux_ivar`` measurements were replaced with "0".

- ``{RA,DEC,*shape*}_IVAR:`` "Inf", 37 bricks, object's center is a masked pixel, in some cases "Inf" appears in the corresponding ``{shape}_IVAR``.
  See https://github.com/legacysurvey/legacypipe/issues/148
- ``{D,R}CHISQ``: "NaN", 7 bricks, occurs near boundary with masked region, at the boundary the image is fine but the model is rendered with very
  positive or negative outliers. See https://github.com/legacysurvey/legacypipe/issues/147
- ``MJD_{MIN,MAX}``: "NaN", 3,024 bricks, object is at a CCD edge, we could remove quite a few cutting on "sum(NOBS_*) = 0" but not for all of the
  cases. The fix in "legacypipe" would be to compute ``NOBS`` and ``MJD_MIN/MAX`` consistently. Currently, ``NOBS`` are derived from the pixel in
  resampled brick space, while ``MJD_MIN/MAX`` are derived from the pixel in the CCD image. See https://github.com/legacysurvey/legacypipe/issues/154


One brick has depth information but isn't listed as being in DR5
================================================================

The depth file (**dr5-depth.fits.gz**) contains one brick that isn't listed as being in the 
survey (that isn't in the file **survey-bricks-dr5.fits.gz**). The brick ``0351m025`` failed during
processing, so doesn't have a Tractor catalog. However the coadds did run to completion for
brick ``0351m025``, so that brick *does* have depth information!

http://legacysurvey.org/viewer/dr5?brick=0351m025&bricks&zoom=11
