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

The most up-to-date issues and in-progress fixes are
available on the GitHub issues pages for the `Legacy Surveys website`_ or the `legacypipe pipeline`_.

Issues with CCDs that may have affected the quality of DECam observations are recorded on the
`DECam CCDs page`_.

Bricks that were processed using the Burst Buffer at NERSC
----------------------------------------------------------
After noticing that some bricks that were run using the `Cori Burst Buffer`_ at NERSC
were corrupted, we reprocessed all such reductions. A total of 1691 bricks in the
southern region of the Legacy Surveys were
discovered that displayed changes in some of their coadded ``image``, ``invvar``, or ``nexp``
files. These bricks were rerun, and assigned a ``RELEASE`` number of ``9012`` (instead of the
``RELEASE`` number of ``9010`` used throughout the rest of the South).

A list of the affected bricks `is available here`_.

.. _`is available here`: ../../files/dr9-south-patched-bricks.fits
.. _`Cori Burst Buffer`: https://docs.nersc.gov/filesystems/cori-burst-buffer/
.. _`to fix a different bug in the reduction process`: https://github.com/legacysurvey/legacypipe/commit/a10ecc33247ec615ec1d8401cef2e0787f91a8fc
.. _`Legacy Surveys website`: https://github.com/legacysurvey/legacysurvey/issues
.. _`legacypipe pipeline`: https://github.com/legacysurvey/legacypipe/issues?q=is:issue+sort:updated-desc
.. _`DECam CCDs page`: http://www.ctio.noao.edu/noao/content/Status-DECam-CCDs
.. _`DECaLS`: ../../decamls
.. _`Tractor catalogs`: ../catalogs
.. _`coadd files`: ../files/#image-stacks-region-coadd
.. _`files`: ../files
.. _`viewer`: https://www.legacysurvey.org/viewer
.. _`Andromeda`: https://www.legacysurvey.org/viewer?ra=10.6801&dec=41.2757&zoom=10&layer=dr8
.. _`M13`: https://www.legacysurvey.org/viewer?ra=250.4306&dec=36.4666&zoom=10&layer=dr8
