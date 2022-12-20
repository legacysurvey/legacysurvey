.. title: External catalogs used in processing
.. slug: external
.. tags: 
.. has_math: yes

.. |deg|    unicode:: U+000B0 .. DEGREE SIGN
.. |Prime|    unicode:: U+02033 .. DOUBLE PRIME

.. class:: pull-right well

.. contents::

External Catalogs used for Astrometry and Photometry
====================================================

Several external catalogs are used for astrometric and photometric calibration of DR10. These catalogs are currently availble in the indicated directories at NERSC, although we will soon
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

External catalogs are used for masking regions near foreground sources in DR10
(e.g. to construct ``MASKBITS`` on the `bitmasks page`_).
These catalogs are available in the indicated directories at NERSC and at the listed urls.

"BRIGHT" stars
--------------
| **/global/cfs/cdirs/cosmo/data/legacysurvey/dr10/masking/gaia-mask-dr10.fits.gz**
| https://portal.nersc.gov/cfs/cosmo/data/legacysurvey/dr10/masking/gaia-mask-dr10.fits.gz
|     Bright stars are defined from a starting sample of all sources in the Tycho-2 catalog that have ``MAG_VT`` < 13.  The ``BRIGHT`` bit is set for all such Tycho-2 stars. In addition, Gaia DR2 sources with ``phot_g_mean_mag`` < 13 have the ``BRIGHT`` bit set, provided they do not already match a Tycho-2 source. Gaia and Tycho-2 sources are matched after accounting for proper motion. In the **gaia-mask-dr10-near.fits.gz** file, bright stars have the ``isbright`` column set to ``True``. In the legacypipe code, the radius of the ``BRIGHT`` star mask is set by pixels within `half of`_ the locus of a hardcoded `radius-magnitude relation`_ that is set for all Tycho-2 stars and for Gaia DR2 stars `to G < 13`_. But, note that the specific radii in the **gaia-mask-dr10-near.fits.gz** do not include the factor-of-two correction (i.e. they are the appropriate radii for the ``MEDIUM`` masks, as described below).

"MEDIUM-bright" stars
---------------------
| **/global/cfs/cdirs/cosmo/data/legacysurvey/dr10/masking/gaia-mask-dr10.fits.gz**
| https://portal.nersc.gov/cfs/cosmo/data/legacysurvey/dr10/masking/gaia-mask-dr10.fits.gz
|     Medium-bright stars are also defined starting with all sources in the Tycho-2 catalog cut to ``MAG_VT`` < 13.  All such Tycho-2 stars have the ``MEDIUM`` bit set. In addition, Gaia DR2 sources with ``phot_g_mean_mag`` < 16 (`G < 16`_) have the ``MEDIUM`` bit set, provided they do not already match a Tycho-2 source (where the match accounts for proper motion). Note that this means that all ``BRIGHT`` stars also have the ``MEDIUM`` bit set. The specific `radius-magnitude relation`_ used is the same one that is adopted for ``BRIGHT`` masks. In the **gaia-mask-dr10-near.fits.gz** file, medium-bright stars have the ``ismedium`` column set to ``True``. Note that, in the legacypipe code, the radius of a ``BRIGHT`` mask is half that for a ``MEDIUM`` mask for a star of the same magnitude. The radii in the **gaia-mask-dr10-near.fits.gz** file *correspond to the radii for the MEDIUM masks* (which is *twice* the appropriate radius for a ``BRIGHT`` mask).

.. _`radius-magnitude relation`: https://github.com/legacysurvey/legacypipe/blob/6d1a92f8462f4db9360fb1a68ef7d6c252781027/py/legacypipe/reference.py#L314-L319
.. _`to G < 13`: https://github.com/legacysurvey/legacypipe/blob/6d1a92f8462f4db9360fb1a68ef7d6c252781027/py/legacypipe/reference.py#L310
.. _`G < 16`: https://github.com/legacysurvey/legacypipe/blob/6d1a92f8462f4db9360fb1a68ef7d6c252781027/py/legacypipe/reference.py#L311
.. _`Gaia`: https://gea.esac.esa.int/archive/documentation//GDR2/Gaia_archive/chap_datamodel/sec_dm_main_tables/ssec_dm_gaia_source.html
.. _`half of`: https://github.com/legacysurvey/legacypipe/blob/6d1a92f8462f4db9360fb1a68ef7d6c252781027/py/legacypipe/reference.py#L672-L675


Globular Clusters & Planetary Nebulae
-------------------------------------

| **/global/cfs/cdirs/cosmo/data/legacysurvey/dr10/masking/NGC-star-clusters.fits**
| https://portal.nersc.gov/cfs/cosmo/data/legacysurvey/dr10/masking/NGC-star-clusters.fits
|     In DR10, we treat globular clusters and planetary nebulae by turning off source detection (although we do perform forced photometry of Gaia sources) and using the ``CLUSTER`` bit to identify the regions of the sky occupied by these systems. We construct our catalog using the following procedure:

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
   occupied by these galaxies DR10 only contains photometry for Gaia point
   sources.

The final input catalog was built using the `build-cluster-catalog.py`_ script
and `can be found in the legacypipe software product`_ or at the
publicly-accessible directory given above. Objects in this mask are given the
``CLUSTER`` bit on the `bitmasks page`_.

Large Galaxies
--------------
| **/global/cfs/cdirs/cosmo/data/legacysurvey/dr10/masking/SGA-parent-v3.0.kd.fits** and
| **/global/cfs/cdirs/cosmo/data/legacysurvey/dr10/masking/SGA-ellipse-v3.0.kd.fits**
| https://portal.nersc.gov/cfs/cosmo/data/legacysurvey/dr10/masking/SGA-parent-v3.0.kd.fits and
| https://portal.nersc.gov/cfs/cosmo/data/legacysurvey/dr10/masking/SGA-ellipse-v3.0.kd.fits
|     These catalogs are based on the 2020 version of the Siena Galaxy Atlas, `SGA-2020`_. The elliptical geometry listed in the *parent* catalog was used to mask large galaxies during sky-subtraction, while the elliptical geometry in the *ellipse* catalog determined where we set the ``GALAXY`` ``MASKBITS`` bit (see the `bitmasks page`_). Specifically, we use the ``RA``, ``DEC``, ``DIAM``, ``PA``, and ``BA`` parameters in these catalogs, as documented in the `SGA-2020.fits`_ data model. 

Additional Masking
------------------
Additionally, DR10 processing bypassed the densest regions of the Large Magellanic Cloud and Small Magellanic Cloud (effectively, we "cut holes" around the LMC and SMC). The
result is that bricks in the central regions of the `LMC`_ and `SMC`_ are simply missing from DR10.


.. _`bitmasks page`: ../bitmasks
.. _`can be found in the legacypipe software product`: https://github.com/legacysurvey/legacypipe/blob/DR10.0.4/py/legacypipe/data/NGC-star-clusters.fits
.. _`build-cluster-catalog.py`: https://github.com/legacysurvey/legacypipe/blob/DR10.0.4/bin/build-cluster-catalog.py
.. _`NGC-star-clusters-radii.csv`: https://github.com/legacysurvey/legacypipe/blob/DR10.0.4/py/legacypipe/data/NGC-star-clusters-radii.csv
.. _`star-clusters-supplemental.csv`: https://github.com/legacysurvey/legacypipe/blob/DR10.0.4/py/legacypipe/data/star-clusters-supplemental.csv
.. _`OpenNGC`: https://github.com/mattiaverga/OpenNGC
.. _`SGA-2020`: ../../sga/sga2020
.. _`SGA-2020.fits`: ../../sga/sga2020#sga-2020-fits
.. _`DECaLS`: ../../decamls
.. _`Fornax`: https://www.legacysurvey.org/viewer?ra=39.997&dec=-34.449&layer=ls-dr10&zoom=10&GCs-PNe
.. _`Sculptor`: https://www.legacysurvey.org/viewer?ra=15.039&dec=-33.709&layer=ls-dr10&zoom=10&GCs-PNe
.. _`LMC`: https://www.legacysurvey.org/viewer?ra=80.8916&dec=-69.7567&layer=ls-dr10&zoom=5
.. _`SMC`: https://www.legacysurvey.org/viewer?ra=13.1867&dec=-72.8286&layer=ls-dr10&zoom=5
