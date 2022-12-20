.. title: Known Issues
.. slug: issues
.. tags: 
.. has_math: yes

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
.. _`DECam CCDs page`: https://noirlab.edu/science/programs/ctio/instruments/Dark-Energy-Camera/Status-DECam-CCDs

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


``NOBS`` differs between the Tractor catalogs and random catalogs
-----------------------------------------------------------------

Quantities named ``nobs_x`` (where ``x`` is any of the Legacy Surveys imaging bands) in the `Tractor catalogs`_ (and derived
products such as the sweep files) are slightly different from the ``NOBS_X`` quantities in the `random catalogs`_.

The `Tractor catalogs`_ ``nobs`` columns count *all* pixels overlapping each brick pixel, even if the pixel is masked. In contrast,
the `random catalogs`_ are derived from the ``nexp`` `coadded stacks`_, which only count pixels where the inverse variances are positive.
This means, for instance, that the ``nexp`` stacks ignore both masked pixels and pixels that have zero weight passed forwards from the
Community Pipeline.

The result of this discrepancy is that a few percent of objects in the `Tractor catalogs`_ have different values of ``nobs`` than would
be expected when deriving ``NOBS`` from the same location in the ``nexp`` `coadded stacks`_. Conveniently, the ``nobs`` values in the `Tractor catalogs`_
are (almost) always larger than what would be derived from the ``nexp`` `coadded stacks`_. This means that constraints based on a minimum ``nexp`` value
in a given filter will always result in reproducible survey geometry, at the expense of rejecting a small fraction (typically <1%) of sources.

Duplicate ``ref_id`` values
---------------------------

A very small number of ``ref_id`` values for Gaia sources appear twice in the `Tractor catalogs`_. One of the duplicates corresponds to the
"correct" Gaia source and the second duplicate has all of the correct information for a Gaia source but with an incorrect
``ref_id``. The ``ref_id`` that would be correct for the second duplicate is missing entirely from the `Tractor catalogs`_.

An example is ``ref_id`` 303293444934132224, which appears in Tractor catalog ``tractor-0238p302.fits`` with correct
information (RA, Dec, etc.) and in Tractor catalog ``tractor-0238p305.fits`` with information that corresponds to
the Gaia source with ``ref_id`` 303315950562852864.

The cause of this problem has yet to be fully diagnosed, although the discrepant Gaia sources tend to lie very close to brick boundaries.

This issue will also propagate to the `sweep files`_.

.. _`Tractor catalogs`: ../catalogs
.. _`random catalogs`: ../files/#random-catalogs-randoms
.. _`coadded stacks`: ../files/#image-stacks-region-coadd
.. _`sweep files`: ../files/#sweep-catalogs-region-sweep
