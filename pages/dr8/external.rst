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

Several external catalogs are used for astrometric and photometric calibration of DR8. These catalogs are available to collaborators in the indicated directories at NERSC. We expect that these
catalogs will be made available to the public in a static, archival state for DR9.

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

.. _`Doug Finkbeiner`: ../../contact
.. _`Gaia DR2 data model`: https://gea.esac.esa.int/archive/documentation//GDR2/Gaia_archive/chap_datamodel/sec_dm_main_tables/ssec_dm_gaia_source.html
.. _`Tycho-2`: https://heasarc.nasa.gov/W3Browse/all/tycho2.html

External Catalogs used for Masking
==================================

External catalogs are used for masking regions near foreground sources in DR8 (e.g. to construct ``BRIGHTBLOB`` on the `bitmasks page`_).
These catalogs are available to collaborators in the indicated directories at NERSC.

"BRIGHT" stars
----------------------
| **/global/project/projectdirs/cosmo/staging/tycho2** and
| **/global/project/projectdirs/cosmo/work/gaia/chunks-gaia-dr2-astrom-2**
|     Bright stars are defined from a starting sample of all sources in the Tycho-2 catalog that have ``MAG_VT`` < 13.  The ``BRIGHT`` bit is set for all such Tycho-2 stars. In addition, Gaia DR2 sources with ``phot_g_mean_mag`` < 13 have the ``BRIGHT`` bit set, provided they do not already match a Tycho-2 source. Gaia and Tycho-2 sources are matched after accounting for proper motion.

"MEDIUM-bright" stars
--------------------------
| **/global/project/projectdirs/cosmo/staging/tycho2** and
| **/global/project/projectdirs/cosmo/work/gaia/chunks-gaia-dr2-astrom-2**
|     Medium-bright stars are also defined starting with all sources in the Tycho-2 catalog cut to ``MAG_VT`` < 13.  All such Tycho-2 stars have the ``MEDIUM`` bit set. In addition, Gaia DR2 sources with ``phot_g_mean_mag`` < 16 have the ``MEDIUM`` bit set, provided they do not already match a Tycho-2 source (where the match accounts for proper motion). Note that this means that all ``BRIGHT`` stars also have the ``MEDIUM`` bit set. The specific (Gaia G) magnitude-radius relationship is `hardcoded in legacypipe`_.


Globular Clusters
-----------------
| The globular cluster catalog used for foreground masking is taken from `Mattia Verga's NGC/IC objects database`_. More specifically the catalog used to set the ``CLUSTER`` bit on the `bitmasks page`_ is `embedded within the legacypipe product itself`_.
|

LSLGA Large Galaxies
--------------------
| **/global/project/projectdirs/cosmo/staging/largegalaxies/v2.0**
|     The input catalog used to define and mask large galaxies (and to set the ``GALAXY`` bit on the `bitmasks page`_) is taken from John Moustakas' `Legacy Survey Large Galaxy Atlas (LSLGA) work`_ with Dustin Lang which builds on `the HyperLeda catalog`_.


.. _`bitmasks page`: ../bitmasks
.. _`embedded within the legacypipe product itself`: https://github.com/legacysurvey/legacypipe/blob/master/py/legacypipe/data/NGC-star-clusters.fits
.. _`hardcoded in legacypipe`: https://github.com/legacysurvey/legacypipe/blob/63d0548602a52be1134f64196d6268adc68208fb/py/legacypipe/reference.py#L196
.. _`Mattia Verga's NGC/IC objects database`: https://github.com/mattiaverga/OpenNGC
.. _`Legacy Survey Large Galaxy Atlas (LSLGA) work`: https://github.com/moustakas/LSLGA
.. _`the HyperLeda catalog`: http://leda.univ-lyon1.fr/acknowledge.html