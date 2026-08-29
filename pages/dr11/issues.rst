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


``BLOB_NEA_I`` uses inverse variances from :math:`g`-band
---------------------------------------------------------
The ``BLOB_NEA_I`` quantities reported in the `Tractor catalogs`_ and derived products such as the
`sweep files`_ were incorrectly calculated using the inverse variances from :math:`g`-band instead of :math:`i`-band.

.. _`Tractor catalogs`: ../catalogs
.. _`sweep files`: ../files/#sweep-catalogs-region-sweep


Duplicate or missing sources along boundaries
---------------------------------------------
The strictly coordinate-based assignment of ``BRICK_PRIMARY`` used by the Legacy Surveys can result in either duplicate or missing sources at brick
boundaries. Sources are fit independently in each brick. Near a boundary, the same input data enters into the fits on either side of the boundary, so with perfect
optimization we would recover exactly the same optimal parameters (including the RA, Dec coordinates) in both bricks. ``BRICK_PRIMARY`` would then select
exactly one of the two sources to keep. In practice, however, sources can scatter slightly across a brick boundary. For example, consider these two sources:

.. code-block::

  brickname 0003m017, objid 5494, RA, Dec (0.39252o, -1.8749996o), type REX, z=22.74
  brickname 0003m020, objid 5417, RA, Dec (0.39252o, -1.8750004o), type REX, z=22.70

in the `Viewer`_. In this case, the Dec values straddle the -1.875\ |deg| Dec boundary. These are duplicates, and only one should appear in the catalog.

Presumably, there are an equal number of `missing` sources where the fits scattered in opposite directions, leaving `neither` source as ``BRICK_PRIMARY``.

These sources tend to be quite faint. It is unclear whether this is simply because most sources are faint, or because fainter sources have larger positional scatter.

A second category of duplicates appears to occur when two sources are initialized just outside a ``BLEED`` or ``SATUR`` `masked area`_
(e.g. see this `Viewer rendering`_) and both subsequently migrate toward a new position. Two of the 10 closest pairs
in `sweep file`_ ``sweep-000m005-005p000.fits``, which contains about 4M objects, are of this type, but there are none in the next 10 closest pairs, so
these may not be particularly common. Naively scaling up, we might expect a few thousand such cases in the full catalog. Unlike the brick-boundary
duplicates, these can be quite bright; the examples in the `Viewer rendering`_  are approximately 16th magnitude.

A third potential category is when one of two duplicate sources receives the ``RUNNER`` or ``WALKER`` `flag`_. In these cases, one source could be initialized
and then subsequently migrate away from its origin during the fitting process.

.. _`Viewer`: https://www.legacysurvey.org/viewer/?ra=0.3925&dec=-1.8749&layer=ls-dr11&zoom=16&bricks
.. _`masked area`: ../bitmasks/
.. _`Viewer rendering`: https://www.legacysurvey.org/viewer/?ra=4.43765&dec=-1.04873&zoom=16&mark=4.43458,-1.04887;4.44069,-1.04894;4.43765,-1.04873
.. _`flag`: ../bitmasks/#fitbits
.. _`sweep file`: ../files/#sweep-catalogs-region-sweep


Missing :math:`i`-band data in the DES region
---------------------------------------------
The Legacy Surveys appears to be missing some :math:`i`-band data in the `DES region of DECaLS`_. These data don't appear to be rejected during processing,
they simply don't appear in the data files reduced by the `NOIRLab Community Pipeline`_ (CP) and transferred to NERSC to be incorporated into the Legacy Surveys.
We are currently investigating which data is missing any why.

.. _`DES region of DECaLS`: ../../status
.. _`NOIRLab Community Pipeline`: https://nsf-noirlab.gitlab.io/csdc/csdc-mso-docs/PL201/
