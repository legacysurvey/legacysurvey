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
----------------------
| **/global/cfs/cdirs/cosmo/staging/tycho2** and
| **/global/cfs/cdirs/cosmo/work/gaia/chunks-gaia-dr2-astrom-2**
|     Bright stars are defined from a starting sample of all sources in the Tycho-2 catalog that have ``MAG_VT`` < 13.  The ``BRIGHT`` bit is set for all such Tycho-2 stars. In addition, Gaia DR2 sources with ``phot_g_mean_mag`` < 13 have the ``BRIGHT`` bit set, provided they do not already match a Tycho-2 source. Gaia and Tycho-2 sources are matched after accounting for proper motion.

"MEDIUM-bright" stars
--------------------------
| **/global/cfs/cdirs/cosmo/staging/tycho2** and
| **/global/cfs/cdirs/cosmo/work/gaia/chunks-gaia-dr2-astrom-2**
|     Medium-bright stars are also defined starting with all sources in the Tycho-2 catalog cut to ``MAG_VT`` < 13.  All such Tycho-2 stars have the ``MEDIUM`` bit set. In addition, Gaia DR2 sources with ``phot_g_mean_mag`` < 16 have the ``MEDIUM`` bit set, provided they do not already match a Tycho-2 source (where the match accounts for proper motion). Note that this means that all ``BRIGHT`` stars also have the ``MEDIUM`` bit set. The specific (Gaia G) magnitude-radius relationship is `hardcoded in legacypipe`_.


Globular Clusters & Planetary Nebulae
-------------------------------------

| In DR9 we mask globular clusters and planetary nebulae selected from the `OpenNGC`_ catalog of NGC/IC objects.  Specifically, we select all objects classified as ``GCl`` or ``PN`` and use a circular mask with a diameter taken from the ``majax`` attribute of this catalog.  The input catalog `can be found in the legacypipe software product`_.  Objects in this mask are given the ``CLUSTER`` bit on the `bitmasks page`_.

Large Galaxies
--------------
| The input catalog used to define and mask large galaxies (and to set the ``GALAXY`` bit on the `bitmasks page`_) is taken from the 2020 version of the Siena Galaxy Atlas, `SGA-2020`_. 

Three versions of this catalog were used for DR9 (as recorded in the ``LARGEGALAXIES_CAT`` header card of the output FITS files):

| **/global/cfs/cdirs/cosmo/staging/largegalaxies/v3.0/SGA-ellipse-v3.0.kd.fits**  
| **/global/cfs/cdirs/cosmo/staging/largegalaxies/v3.1/SGA-ellipse-v3.1.kd.fits**
| **/global/cfs/cdirs/cosmo/staging/largegalaxies/v3.2/SGA-ellipse-v3.2.kd.fits**

In detail, the ``v3.0`` version was used for most (but not all) bricks north of
:math:`32^{\circ}`, while the ``v3.1`` version was used below
:math:`32^{\circ}`, including over the full `DECaLS`_ footprint. The ``v3.2``
version is identical to the ``v3.1`` version except for the three galaxies in
and around NGC0598=M33, which required special handling.

In these files, the elliptical geometry (defined by ``DIAM``, ``PA``, and
``BA``, as documented in the `SGA-2020-ls.fits`_ data model) defines the
elliptical mask used to set the ``GALAXY`` targeting bit.

In addition, an early version of this large-galaxy catalog was used for masking
of large galaxies when building the CCD-level sky models:
| **/global/cfs/cdirs/cosmo/staging/largegalaxies/v3.0/SGA-parent-v3.0.kd.fits**  

In this catalog we used the elliptical geometry defined by ``D25_LEDA``,
``PA_LEDA``, and ``BA_LEDA`` (again, as documented in the `SGA-2020-ls.fits`_
data model).

.. _`bitmasks page`: ../bitmasks
.. _`can be found in the legacypipe software product`: https://github.com/legacysurvey/legacypipe/blob/master/py/legacypipe/data/NGC-star-clusters.fits 
.. _`hardcoded in legacypipe`: https://github.com/legacysurvey/legacypipe/blob/63d0548602a52be1134f64196d6268adc68208fb/py/legacypipe/reference.py#L196
.. _`OpenNGC`: https://github.com/mattiaverga/OpenNGC
.. _`SGA-2020`: ../../sga/sga2020
.. _`SGA-2020-ls.fits`: ../../sga/sga2020#SGA-2020-ls.fits
.. _`DECaLS`: ../../decamls
