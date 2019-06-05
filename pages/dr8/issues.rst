.. title: Known Issues
.. slug: issues
.. tags: mathjax
.. description:

.. |deg|    unicode:: U+000B0 .. DEGREE SIGN
.. |Prime|    unicode:: U+02033 .. DOUBLE PRIME

General Issues
--------------

The most up-to-date issues and in-progress fixes moving from DR8 to DR9 are 
available on the GitHub issues pages for the `Legacy Surveys website`_ or the `legacypipe pipeline`_.

Issues with CCDs that may have affected the quality of DECam observations are recorded on the
`DECam CCDs page`_.

Patching Morphological Models
-----------------------------

Some morphological quantities are inconsistent for PSF sources in DR8, due to a bug in the model selection function that was introduced 
on May 13th, 2019 `to fix an issue in the DR8 90prime-mosaic reductions`_.

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

.. _`to fix an issue in the DR8 90prime-mosaic reductions`: https://github.com/legacysurvey/legacypipe/commit/a10ecc33247ec615ec1d8401cef2e0787f91a8fc
.. _`Legacy Surveys website`: https://github.com/legacysurvey/legacysurvey/issues
.. _`legacypipe pipeline`: https://github.com/legacysurvey/legacypipe/issues?q=is:issue+sort:updated-desc
.. _`DECam CCDs page`: http://www.ctio.noao.edu/noao/content/Status-DECam-CCDs
.. _`DECaLS`: ../../decamls
.. _`Tractor catalogs`: ../catalogs
.. _`files`: ../files