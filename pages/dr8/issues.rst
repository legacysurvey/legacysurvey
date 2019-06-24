.. title: Known Issues
.. slug: issues
.. tags: mathjax
.. description:

.. |deg|    unicode:: U+000B0 .. DEGREE SIGN
.. |Prime|    unicode:: U+02033 .. DOUBLE PRIME

.. class:: pull-right well

.. contents::

General Issues
--------------

The most up-to-date issues and in-progress fixes moving from DR8 to DR9 are 
available on the GitHub issues pages for the `Legacy Surveys website`_ or the `legacypipe pipeline`_.

Issues with CCDs that may have affected the quality of DECam observations are recorded on the
`DECam CCDs page`_.

Patching Morphological Models
-----------------------------

Some morphological quantities are inconsistent for PSF sources in DR8, due to a bug in the model selection function that was introduced 
on May 13th, 2019 `to fix a different bug in the reduction process`_.

This issue occurs when the ``REX`` model is better than the ``PSF`` model, but not by *enough*.  In this case, instead of reverting to ``PSF``, the modeling code reverts to NONE.

The upshot of this issue is that when ``REX`` is better than ``PSF``, but not by a sufficiently large margin, then the ``EXP`` or ``DEV`` model would be chosen instead of the ``PSF`` model.

This issue has been mostly addressed by looking at the ``DCHISQ`` values in the `Tractor catalogs`_, determining which sources are affected, and
patching the Tractor files with the ``PSF`` fit values, which are then propagated to all `files`_ that rely on the Tractor catalogs.
Patching the catalogs in this manner has the inconsistency problem that the pipeline would have already subtracted the ``EXP`` or ``DEV`` model 
for a patched source during extraction, affecting the fitting of other sources in the image.

- Quantities that should be unaffected:
    - ``RA``, ``DEC``, fluxes and their IVARs; ``TYPE``, ``BX``, ``BY``, ``BRICK_PRIMARY``.
- Quantities that *could* be inconsistent (if the ``PSF``-fit centroid was in a different brick pixel than the ``DEV``- or ``EXP``-fit centroid):
    - ``ANYMASK``, ``ALLMASK``, ``MASKBITS``, ``BRIGHTBLOB``, ``NOBS``.
- Quantities that *will* be inconsistent as they will still use the ``DEV`` or ``EXP`` model shape:
    - ``FIBERFLUX``, ``FRACIN``, ``FRACFLUX``, ``FRACMASKED``, ``RCHISQ`` and the WISE forced photometry.

The original "unpatched" files are available in the individual survey directories, e.g. ``/global/project/projectdirs/cosmo/data/legacysurvey/dr8/south/unpatched-tractor``.

The brightest stars are missing from models and catalogs
--------------------------------------------------------

The cores of very bright stars are often highly saturated. This produces negative fluxes in model fits, which
causes very bright stars to be dropped completely during model selection. An example is Tania Australis (V~3, RA~213.88\ |deg|, Dec~19.18\ |deg|).

The fix, which will be included in DR9, is to force all reference stars (such as Gaia stars) to be retained during model fitting.


Bricks that didn't finish processing
------------------------------------
XXX list the missing bricks. (see DS email for telecon on Monday, June 24th).

.. _`to fix a different bug in the reduction process`: https://github.com/legacysurvey/legacypipe/commit/a10ecc33247ec615ec1d8401cef2e0787f91a8fc
.. _`Legacy Surveys website`: https://github.com/legacysurvey/legacysurvey/issues
.. _`legacypipe pipeline`: https://github.com/legacysurvey/legacypipe/issues?q=is:issue+sort:updated-desc
.. _`DECam CCDs page`: http://www.ctio.noao.edu/noao/content/Status-DECam-CCDs
.. _`DECaLS`: ../../decamls
.. _`Tractor catalogs`: ../catalogs
.. _`coadd files`: ../files#image-stacks-coadd
.. _`files`: ../files