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

The most up-to-date issues and in-progress fixes moving from DR9 to DR10 are
available on the GitHub issues pages for the `Legacy Surveys website`_ or the `legacypipe pipeline`_.

Issues with CCDs that may have affected the quality of DECam observations are recorded on the
`DECam CCDs page`_.

Bricks that didn't finish processing
------------------------------------
Bricks that didn't finish processing, or that only partially
completed because we "bailed out" of source-fitting can fail after the coadded
images have been produced but before sources have been extracted.

Most of these cases consist of bricks containing particularly large galaxies
(e.g., `Andromeda`_), globular clusters (e.g., `M13`_), or bright stars.

For such bricks, we remove any images from the ``coadd/`` directory so that the
pixel-level files are consistent with the catalog-level files. This means that
there are a small number of bricks in DR9 which have images loaded in the
`viewer`_ but that do not have corresponding `files`_, `coadd files`_ or
`Tractor catalogs`_.

.. _`to fix a different bug in the reduction process`: https://github.com/legacysurvey/legacypipe/commit/a10ecc33247ec615ec1d8401cef2e0787f91a8fc
.. _`Legacy Surveys website`: https://github.com/legacysurvey/legacysurvey/issues
.. _`legacypipe pipeline`: https://github.com/legacysurvey/legacypipe/issues?q=is:issue+sort:updated-desc
.. _`DECam CCDs page`: http://www.ctio.noao.edu/noao/content/Status-DECam-CCDs
.. _`DECaLS`: ../../decamls
.. _`Tractor catalogs`: ../catalogs
.. _`coadd files`: ../files/#image-stacks-region-coadd
.. _`files`: ../files
.. _`viewer`: https://legacysurvey.org/viewer
.. _`Andromeda`: https://legacysurvey.org/viewer?ra=10.6801&dec=41.2757&zoom=10&layer=dr8
.. _`M13`: https://legacysurvey.org/viewer?ra=250.4306&dec=36.4666&zoom=10&layer=dr8
