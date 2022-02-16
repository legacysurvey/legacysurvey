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

Overflow in survey-bricks-dr8-south.fits.gz
-------------------------------------------

The columns `nobjs`, `npsf`, and so on are signed 16-bit integers.  One brick, 2296p020, containing the
globular cluster M5, contains 32,943 PSFs (and no other types), which overflows a 16-bit signed integer.
It therefore appears as -32,593 (off by 65,536).

Patching Morphological Models
-----------------------------

Some morphological quantities are inconsistent for PSF sources in DR8, due to a bug in the model selection function that was introduced
on May 13th, 2019 `to fix a different bug in the reduction process`_.

This issue occurs when the ``REX`` model is better than the ``PSF`` model, but not by more than a ``DCHISQ`` value of 1%.  In that case, instead of reverting to ``PSF``, the modeling code reverts to NONE.

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

DR8 was processed with several different code versions. Morphological models were only patched for a subset of the files that were
processed with version DR8.2.1 of the code. These files can be identified by the header card: ``PATCHED`` `(= integer number of sources patched)`.

The brightest stars are missing from models and catalogs
--------------------------------------------------------

The cores of very bright stars are often highly saturated. This produces negative fluxes in model fits, which
causes very bright stars to be dropped completely during model selection. An example is Tania Australis (V~3, RA~213.88\ |deg|, Dec~19.18\ |deg|).

The fix, which will be included in DR9, is to force all reference stars (such as Gaia stars) to be retained during model fitting.

Bricks that didn't finish processing
------------------------------------
Bricks that didn't finish processing, or that only partially
completed because we "bailed out" of source-fitting can fail after the coadded
images have been produced but before sources have been extracted.

Most of these cases consist of bricks containing particularly large galaxies
(e.g., `Andromeda`_), globular clusters (e.g., `M13`_), or bright stars.

For such bricks, we remove any images from the ``coadd/`` directory so that the
pixel-level files are consistent with the catalog-level files. This means that
there are a small number of bricks in DR8 which have images loaded in the
`viewer`_ but that do not have corresponding `files`_, `coadd files`_ or
`Tractor catalogs`_.

Incorrect values in the annotated ccds file
--------------------------------------------
Sky levels at Declinations south of -30\ |deg| were computed using CCD zero-points of 0 mag rather than the correct zero-points. This produced
incorrect values for the following quantities in the `annotated ccds file`_:

- ``meansky``
- ``stdsky``
- ``maxsky``
- ``minsky``

These values, which have been corrected for `DR9`_, need to be updated for DR8 as in `this code snippet`_. In addition, the units stated
for these 4 quantities in the DR8 documentation were originally incorrect. These quantities are all in nanomaggies, not ADU.

.. _`this code snippet`: https://github.com/legacysurvey/legacypipe/commit/3650c7bce35ecd0a1c908cb20111da33a1bfee94
.. _`DR9`: ../../dr9/files/#ccds-annotated-camera-dr9-cut-fits-gz
.. _`annotated ccds file`: ../files/#ccds-annotated-camera-dr8-fits-gz
.. _`to fix a different bug in the reduction process`: https://github.com/legacysurvey/legacypipe/commit/a10ecc33247ec615ec1d8401cef2e0787f91a8fc
.. _`Legacy Surveys website`: https://github.com/legacysurvey/legacysurvey/issues
.. _`legacypipe pipeline`: https://github.com/legacysurvey/legacypipe/issues?q=is:issue+sort:updated-desc
.. _`DECam CCDs page`: https://noirlab.edu/science/programs/ctio/instruments/Dark-Energy-Camera/Status-DECam-CCDs
.. _`DECaLS`: ../../decamls
.. _`Tractor catalogs`: ../catalogs
.. _`coadd files`: ../files/#image-stacks-region-coadd
.. _`files`: ../files
.. _`viewer`: https://www.legacysurvey.org/viewer
.. _`Andromeda`: https://www.legacysurvey.org/viewer?ra=10.6801&dec=41.2757&zoom=10&layer=dr8
.. _`M13`: https://www.legacysurvey.org/viewer?ra=250.4306&dec=36.4666&zoom=10&layer=dr8
