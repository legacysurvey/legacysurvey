.. title: External catalogs used in processing
.. slug: external
.. tags: mathjax
.. description:

.. |deg|    unicode:: U+000B0 .. DEGREE SIGN
.. |Prime|    unicode:: U+02033 .. DOUBLE PRIME

.. class:: pull-right well

.. contents::

External Catalogs used for Astrometry and Photometry
====================================================

Several external catalogs are used for astrometric and photometric calibration of DR8. These catalogs are available to collaborators in the indicated directories at NERSC.

Pan-STARRS-1 (PS1)
------------------
| **/global/project/projectdirs/cosmo/work/ps1/cats/chunks-qz-star-v3**
|    These files were produced by `Doug Finkbeiner`_ from proprietary Pan-STARRS1 (PS1) data. The data in the files should be public as of Data Release 1 of PS1. The format of the file names is ``ps1-<XXXXX>.fits`` where ``<XXXXX>`` corresponds to HEALPixel numbers in the ``nside=32``, ``NESTED`` scheme. Each file contains a FITS table of PS1 sources.

Gaia DR2
--------
| **/global/project/projectdirs/cosmo/work/gaia/chunks-gaia-dr2-astrom-2**
|    These files contain all sources from the Gaia DR2 public data release, with columns corresponding to the `Gaia DR2 data model`_. The format of the the file names is ``chunk-<XXXXX>.fits`` where ``<XXXXX>`` corresponds to HEALPixel numbers in the ``nside=32``, ``NESTED`` scheme. The provenance of these files is documented at ``/global/project/projectdirs/cosmo/work/gaia/chunks-gaia-dr2-astrom-2/README`` and ``/global/project/projectdirs/cosmo/staging/gaia/dr2/README``.

Tycho-2
-------
| **/global/project/projectdirs/cosmo/staging/tycho2/tycho2.kd.fits**
|    This file corresponds to the `Tycho-2`_ star catalog, produced from the original binary .dat files, and augmented with an ``isgalaxy`` column, plus :math:`J`, :math:`H`, :math:`K` and estimated :math:`z` magnitudes. How these extra columns were derived is detailed in ``/global/project/projectdirs/cosmo/staging/tycho2/README``.

.. _`Doug Finkbeiner`: ../../contacts
.. _`Gaia DR2 data model`: https://gea.esac.esa.int/archive/documentation//GDR2/Gaia_archive/chap_datamodel/sec_dm_main_tables/ssec_dm_gaia_source.html
.. _`Tycho-2`: https://heasarc.nasa.gov/W3Browse/all/tycho2.html

External Catalogs used for Masking
==================================

External catalogs are used for masking regions near foreground sources in DR8 (e.g. to construct ``BRIGHTBLOB`` on the `bitmasks page`_).
These catalogs are available to collaborators in the indicated directories at NERSC.

"BRIGHT" Tycho-2 stars
----------------------
| XXX
|

"MEDIUM-bright" Gaia stars
--------------------------
| XXX
|

Globular Clusters
-----------------
| XXX
|

LSLGA Large Galaxies
--------------------
| XXX
|

.. _`bitmasks page`: ../bitmasks
