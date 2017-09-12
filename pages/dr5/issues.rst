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

Galdepth
========

Due to a bug in PSF fitting, columns related to ``GALDEPTH`` are incorrect in DR5.
Corrupted files and entries include:

Tractor catalogues (all)

- galdepth_{g,r}
- apflux_resid_{g,r}

Tractor catalogues (large blobs only)

- ra_ivar
- dec_ivar
- fracdev_ivar
- flux_ivar_{g,r}
- fracflux_{g,r}
- fracin_{g,r}
- fracmasked_{g,r}
- rchi2_{g,r}
- shapeexp_{r,e1,e2}_ivar
- shapedev_{r,e1,e2}_ivar

Coadd images (all)

- legacysurvey-\*-model-{g,r}.fits
- legacysurvey-\*-chi2-{g,r}.fits
- legacysurvey-\*-model.jpg
- legacysurvey-\*-resid.jpg

survey-bricks-dr5.fits.gz (all)

- galdepth_{g,r}

In the PSFex configuration file for BASS images, we set PSF_SAMPLING to *auto* (0.0) rather than to *fixed* (1.0). PSFex then automatically
chooses a pixel scale (0.455\ |PRIME| per pixel times a factor roughly between 0.8 and 1.2), which is then mis-interpreted by legacypipe.
For various reasons, legacypipe using a different set of code for model rendering (e.g. coadd model images) and model fitting
(e.g. convolving a PSFex and galaxy model) so the incorrect pixel scale in used in different cases.

In the first case, model rendering uses the incorrect PSFex pixel scale, so all g,r-band "coadd" images are wrong. This happens for:

- legacysurvey-\*-model-{g,r}.fits
- legacysurvey-\*-chi2-{g,r}.fits
- legacysurvey-\*-model.jpg
- legacysurvey-\*-resid.jpg

Model rendering is also used to compute the ``galdepth`` and ``apflux_resid`` columns in tractor catalogues, so all tractor catalogues have incorrect:

- galdepth_{g,r}
- apflux_resid_{g,r}

Finally, "survey-bricks-dr5.fits.gz" tabulates ``galdepth_*`` using the tractor catalogues, so all of its corresponding columns are incorrect:

- galdepth_{g,r}

In the second case, model fitting (for optimization reasons) uses slightly different code for sub-images (roughly the size of the blob that contains possible sources)
that are small (height or width :math:`< 400` pixels) versus large (height and width :math:`> 400` pixels). The threshold for large versus small is hardcoded so
that large sub-images correspond to blobs larger than :math:`400 \times 0.455 / 0.262 \sim 694` pixels. Sources in small blobs use the correct pixel scale
and have no further issues; however, sources in large blobs use the incorrect pixel scale and end up with incorrect values for:

- ``ra_ivar``
- ``dec_ivar``
- ``fracdev_ivar``
- ``flux_ivar_{g,r}``
- ``fracflux_{g,r}``
- ``fracin_{g,r}``
- ``fracmasked_{g,r}``
- ``rchi2_{g,r}``
- ``shapeexp_{r,e1,e2}_ivar``
- ``shapedev_{r,e1,e2}_ivar``

Note, a "quick" fix was possible for the values of ``galdepth`` in the "depth" and "galdepth" fits files. So these values were remade and are *correct* for all bands:

- coadd/\*/\*/legacysurvey-\*-ccds.fits
- coadd/\*/\*/legacysurvey-\*-depth.fits
- coadd/\*/\*/legacysurvey-\*-galdepth-\*.fits.gz


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

Blacklisted Frames
==================

We attempt to process all available DECam imaging, regardless of whether such
data was specifically taken as part of the legacy survey. Some imaging surveys revisit
certain areas of the sky many times, and processing the coaddition of such data can severely
slow down the Tractor pipeline. Because of this, some proposal IDs are "blacklisted" to
prevent Tractor from dwelling on those regions. The upshot of this is that if you're looking
for coadded DECam imaging from a specific set of surveys in a certain region of the sky, it may not be
available to the full depth that you expect.

Which proposal IDs were considered in which brick can be obtained from the ccds files that
are documented on the `catalogs page`_.

.. _`catalogs page`: ../catalogs

Tractor-on-Bricks
==================

Tractor-on-Bricks is a slightly different implementation of the Tractor source extraction code in
which a fraction of bricks that don't touch are run through Tractor, and then sources that 
are BRICK_PRIMARY are fixed so that additional bricks run through Tractor don't produce
duplicate "edge" sources where bricks overlap. This has the advantage of producing rigorous
brick boundaries, but the disadvantage of slowing down processing through being harder to
parallelize. In DR5, tractor-on-bricks was enforced???.
