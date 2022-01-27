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

.. _`Legacy Surveys website`: https://github.com/legacysurvey/legacysurvey/issues
.. _`legacypipe pipeline`: https://github.com/legacysurvey/legacypipe/issues?q=is:issue+sort:updated-desc
.. _`DECam CCDs page`: http://www.ctio.noao.edu/noao/content/Status-DECam-CCDs

The DR9sv "Data Release"
------------------------
DR9sv was a preliminary version of the Legacy Surveys imaging intended to possibly be used for targeting during the DESI
Survey Validation (SV) phase. However, DR9sv was never used for DESI SV targeting. Although DR9sv remains publicly available at:

| https://portal.nersc.gov/project/cosmo/data/legacysurvey/dr9sv/

and at NERSC in the directory:

| ``/global/cfs/cdirs/cosmo/data/legacysurvey/dr9sv``

DR9sv has been supplanted by the full DR9 release. We recommend ignoring any data from DR9sv, and using DR9 instead.

Bricks that were processed using the Burst Buffer at NERSC
----------------------------------------------------------

After noticing that some bricks that were run using the `Cori Burst Buffer`_ at NERSC
were corrupted, we reprocessed all such reductions. A total of 1691 bricks in the
southern region of the Legacy Surveys were
discovered that displayed changes in some of their coadded ``image``, ``invvar``, or ``nexp``
files. These bricks were rerun, and assigned a ``RELEASE`` number of ``9012`` (instead of the
``RELEASE`` number of ``9010`` used for reductions in the rest of DR9 south of the Legacy Surveys).

A list of the affected bricks `is available here`_.

.. _`Cori Burst Buffer`: https://docs.nersc.gov/filesystems/cori-burst-buffer/
.. _`is available here`: ../../files/dr9-south-patched-bricks.fits

"Blobmodel" images are not compressed
-------------------------------------

`Blobmodel images`_ were intended to be compressed, and are named with a ``.fits.fz`` suffix, but they are not actually compressed.

.. _`Blobmodel images`: ../files/#image-stacks-region-coadd
