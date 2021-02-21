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

Several external catalogs are used for astrometric and photometric calibration of DR9. These catalogs are currently availble in the indicated directories at NERSC, although we will soon
make them available to the wider public.

Pan-STARRS-1 (PS1)
------------------
| **/global/cfs/cdirs/cosmo/work/ps1/cats/chunks-qz-star-v3**
|    These files were produced by `Doug Finkbeiner`_ from proprietary Pan-STARRS1 (PS1) data. The data in the files should be public as of Data Release 1 of PS1. The format of the file names is ``ps1-<hhhhh>.fits`` where ``<hhhhh>`` corresponds to HEALPixel numbers in the ``nside=32``, ``NESTED`` scheme. Each file contains a FITS table of PS1 sources.

Gaia DR2
--------
| **/global/cfs/cdirs/cosmo/work/gaia/chunks-gaia-dr2-astrom-2**
|    These files contain all sources from the Gaia DR2 public data release, with columns corresponding to the `Gaia DR2 data model`_. The format of the the file names is ``chunk-<hhhhh>.fits`` where ``<hhhhh>`` corresponds to HEALPixel numbers in the ``nside=32``, ``NESTED`` scheme. The provenance of these files is documented at ``/global/cfs/cdirs/cosmo/work/gaia/chunks-gaia-dr2-astrom-2/README`` and ``/global/cfs/cdirs/cosmo/staging/gaia/dr2/README``.

Tycho-2
-------
| **/global/cfs/cdirs/cosmo/staging/tycho2/tycho2.kd.fits**
|    This file corresponds to the `Tycho-2`_ star catalog, produced from the original binary .dat files, and augmented with an ``isgalaxy`` column, plus :math:`J`, :math:`H`, :math:`K` and estimated :math:`z` magnitudes. How these extra columns were derived is detailed in ``/global/cfs/cdirs/cosmo/staging/tycho2/README``.

.. _`Doug Finkbeiner`: ../../contact
.. _`Gaia DR2 data model`: https://gea.esac.esa.int/archive/documentation//GDR2/Gaia_archive/chap_datamodel/sec_dm_main_tables/ssec_dm_gaia_source.html
.. _`Tycho-2`: https://heasarc.gsfc.nasa.gov/W3Browse/all/tycho2.html

External Catalogs used for Masking
==================================

External catalogs are used for masking regions near foreground sources in DR9
(e.g. to construct ``MASKBITS`` on the `bitmasks page`_).
These catalogs are available to collaborators in the indicated directories at NERSC.

"BRIGHT" stars
--------------
| **/global/cfs/cdirs/cosmo/staging/tycho2** and
| **/global/cfs/cdirs/cosmo/work/gaia/chunks-gaia-dr2-astrom-2**
|     Bright stars are defined from a starting sample of all sources in the Tycho-2 catalog that have ``MAG_VT`` < 13.  The ``BRIGHT`` bit is set for all such Tycho-2 stars. In addition, Gaia DR2 sources with ``phot_g_mean_mag`` < 13 have the ``BRIGHT`` bit set, provided they do not already match a Tycho-2 source. Gaia and Tycho-2 sources are matched after accounting for proper motion.

"MEDIUM-bright" stars
---------------------
| **/global/cfs/cdirs/cosmo/staging/tycho2** and
| **/global/cfs/cdirs/cosmo/work/gaia/chunks-gaia-dr2-astrom-2**
|     Medium-bright stars are also defined starting with all sources in the Tycho-2 catalog cut to ``MAG_VT`` < 13.  All such Tycho-2 stars have the ``MEDIUM`` bit set. In addition, Gaia DR2 sources with ``phot_g_mean_mag`` < 16 have the ``MEDIUM`` bit set, provided they do not already match a Tycho-2 source (where the match accounts for proper motion). Note that this means that all ``BRIGHT`` stars also have the ``MEDIUM`` bit set. The specific (Gaia G) magnitude-radius relationship is `hardcoded in legacypipe`_.


Globular Clusters & Planetary Nebulae
-------------------------------------

| **/global/cfs/cdirs/cosmo/data/legacysurvey/dr9/masking/NGC-star-clusters.fits**
|     In DR9, we treat globular clusters and planetary nebulae by turning off source detection (although we do perform forced photometry of Gaia sources) and using the ``CLUSTER`` bit to identify the regions of the sky occupied by these systems. We construct our catalog using the following procedure:

1. First, we select all objects classified as ``GCl`` or ``PN`` from the
   `OpenNGC`_ catalog of NGC/IC objects. In most cases, we use the published
   central coordinates and a circular mask with a radius taken from the
   ``majax`` attribute of this catalog; however, we update the radii of 14 of
   these objects based on visual inspection using the values (in degrees) in the
   `NGC-star-clusters-radii.csv`_ file.

2. Next, we supplement this catalog with a list of nine additional globular
   clusters and compact open clusters from a variety of sources from the
   literature. This supplemental catalog can be found in the
   `star-clusters-supplemental.csv`_ file.

3. Finally, we add two Local Group galaxies to this catalog, `Fornax`_ and
   `Sculptor`_. We include these objects in this catalog because the normal
   pipeline led to the detection of tens of millions of additional sources which
   proved problematic to photometer. Consequently, in the part of the sky
   occupied by these galaxies DR9 only contains photometry for Gaia point
   sources.

The final input catalog was built using the `build-cluster-catalog.py`_ script
and `can be found in the legacypipe software product`_ or at the
publicly-accessible directory given above. Objects in this mask are given the
``CLUSTER`` bit on the `bitmasks page`_.

Large Galaxies
--------------
| **/global/cfs/cdirs/cosmo/data/legacysurvey/dr9/masking/SGA-parent-v3.0.kd.fits** and 
| **/global/cfs/cdirs/cosmo/data/legacysurvey/dr9/masking/SGA-ellipse-v3.0.kd.fits** 
|     These catalogs are based on the 2020 version of the Siena Galaxy Atlas, `SGA-2020`_. The elliptical geometry listed in the *parent* catalog was used to mask large galaxies during sky-subtraction, while the elliptical geometry in the *ellipse* catalog determined where we set the ``GALAXY`` ``MASKBITS`` bit (see the `bitmasks page`_). Specifically, we use the ``RA``, ``DEC``, ``DIAM``, ``PA``, and ``BA`` parameters in these catalogs, as documented in the `SGA-2020.fits`_ data model. 

.. _`bitmasks page`: ../bitmasks
.. _`can be found in the legacypipe software product`: https://github.com/legacysurvey/legacypipe/blob/DR9.6.0/py/legacypipe/data/NGC-star-clusters.fits 
.. _`hardcoded in legacypipe`: https://github.com/legacysurvey/legacypipe/blob/63d0548602a52be1134f64196d6268adc68208fb/py/legacypipe/reference.py#L196
.. _`build-cluster-catalog.py`: https://github.com/legacysurvey/legacypipe/blob/DR9.6.0/bin/build-cluster-catalog.py
.. _`NGC-star-clusters-radii.csv`: https://github.com/legacysurvey/legacypipe/blob/DR9.6.0/py/legacypipe/data/NGC-star-clusters-radii.csv
.. _`star-clusters-supplemental.csv`: https://github.com/legacysurvey/legacypipe/blob/DR9.6.0/py/legacypipe/data/star-clusters-supplemental.csv
.. _`OpenNGC`: https://github.com/mattiaverga/OpenNGC
.. _`SGA-2020`: ../../sga/sga2020
.. _`SGA-2020.fits`: ../../sga/sga2020#sga-2020.fits
.. _`DECaLS`: ../../decamls
.. _`Fornax`: https://www.legacysurvey.org/viewer?ra=39.997&dec=-34.449&layer=ls-dr9&zoom=10&GCs-PNe
.. _`Sculptor`: https://www.legacysurvey.org/viewer?ra=15.039&dec=-33.709&layer=ls-dr9&zoom=10&GCs-PNe
