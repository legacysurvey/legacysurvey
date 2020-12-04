.. title: The Siena Galaxy Atlas
.. slug: sga
.. tags: mathjax
.. description:

.. |deg|    unicode:: U+000B0 .. DEGREE SIGN
.. |Prime|    unicode:: U+02033 .. DOUBLE PRIME

.. class:: pull-right well

.. contents::

*Page author and contact:* `John Moustakas`_

.. _`John Moustakas`: ../../contact/#other-experts

The Siena Galaxy Atlas (SGA) is an angular diameter-limited sample of galaxies constructed as part of the DESI Legacy Imaging Surveys. It provides
custom, wide-area, optical and infrared mosaics (in :math:`grz` and :math:`W1-W4`), azimuthally averaged surface brightness profiles, and both aperture and integrated
photometry for a sample of approximately 400,000 galaxies over :math:`20{,}000\,\mathrm{deg}^2`.

All the code used to generate and analyze the catalog is publicly available:

- https://github.com/moustakas/SGA
- https://github.com/moustakas/legacyhalos
- https://github.com/legacysurvey/legacypipe

Constructing the atlas involves three major steps. First, we build a parent catalog of known large galaxies. Second, we carry out ellipse-fitting
on custom multi-band mosaics. And finally we assemble all the data to produce the final Siena Galaxy Atlas.

Parent Catalog
==============

HyperLeda
---------
We begin building the parent sample by querying the `HyperLeda`_ extragalactic database for galaxies with angular diameters,
:math:`D(25)>0.2\,\mathrm{arcmin}` (:math:`12\,\mathrm{arcsec}`), where :math:`D(25)` is the diameter at the :math:`25 \mathrm{mag}/\mathrm{arcsec}^2` surface
brightness isophote (in the optical, typically the B-band), a traditional measure of the size of the galaxy popularized by the
`The Third Reference Catalog of Bright Galaxies (RC3)`_.

.. _`HyperLeda`: http://leda.univ-lyon1.fr/
.. _`The Third Reference Catalog of Bright Galaxies (RC3)`: https://ui.adsabs.harvard.edu/abs/1991rc3..book.....D/abstract

The following query was carried out on the version of the `HyperLeda`_ database in place on 2018 November 14, resulting in a catalog of 1,436,176 galaxies:

.. code-block:: sql

		WITH
		"R50" AS (
		  SELECT pgc, avg(lax) AS lax, avg(sax) AS sax
		  FROM rawdia
		  WHERE quality=0 and dcode=5 and band between 4400 and 4499 GROUP BY pgc
		),
		"IR" AS (
		  SELECT pgc, avg(lax) AS lax, avg(sax) AS sax
		  FROM rawdia
		  WHERE quality=0 and iref in (27129) and dcode=7 and band=0 GROUP BY pgc
		)

		SELECT
		count(*)
		  m.pgc,
		  m.objname,
		  m.objtype,
		  m.al2000,
		  m.de2000,
		  m.type,
		  m.bar,
		  m.ring,
		  m.multiple,
		  m.compactness,
		  m.t,
		  m.logd25,
		  m.logr25,
		  m.pa,
		  m.bt,
		  m.it,
		  m.kt,
		  m.v,
		  m.modbest,
		  "R50".lax,
		  "R50".sax,
		  "IR".lax,
		  "IR".sax,

		FROM
		  m000 AS m
		  LEFT JOIN "R50" USING (pgc)
		  LEFT JOIN "IR" USING (pgc)
		  WHERE
		  objtype='G'
		    and (
		    m.logd25>0.2 or "R50".lax>0.2 or "IR".lax>0.2
		  )

Based on a large number of visual inspections and both quantitative and qualitative tests, we cull the sample by applying the following additional cuts:

- First, we limit the sample to :math:`0.333<D(25)<180\,\mathrm{arcmin}`, which removes ~900,000 galaxies (~63% of the original sample), including the
  Magellanic Clouds and the Sagittarius Dwarf Galaxy at the large-diameter end). We implement the :math:`D(25)<20\,\mathrm{arcsec}` cut because we find
  that the fraction of spurious sources (or sources with incorrect diameters) increases rapidly below this diameter; moreover, galaxies
  smaller than this size are modeled reasonably well as part of the standard Tractor pipeline.

- Next, we remove ~3,800 galaxies with no magnitude estimate in `HyperLeda`_, galaxies which we find to be largely spurious based on visual inspection.

- Third, we remove ~3,800 spurious sources (or galaxies with significantly overestimated diameters) based on visual inspection.

- Finally, we remove ~1700 galaxies whose primary galaxy identifier (in `HyperLeda`_) is from either SDSS or 2MASS and whose central coordinates place
  it *inside* the elliptical aperture of *another* (non-SDSS and non-2MASS) galaxy with diameter greater than :math:`0.5\,\mathrm{arcmin}`. Based on visual inspection,
  we find that many of these sources are shredded, spurious sources with incorrect diameters.

In addition, we visually inspect all the galaxies in the sample with :math:`D(25)>0.75\,\mathrm{arcmin}`, including all the NGC/IC galaxies, and assess their
published elliptical geometry and coordinates. Where necessary, we update the diameter, position angle, minor-to-major axis ratio, and, in some cases,
celestial coordinates of these galaxies "by hand" (as indicated in the ``BYHAND`` column, described in the data model below). The
`NASA Extragalactic Database`_ proved invaluable for these cross-checks.

.. _`NASA Extragalactic Database`: https://ned.ipac.caltech.edu/

Supplemental Catalogs
~~~~~~~~~~~~~~~~~~~~~

To improve the completeness of the `HyperLeda`_ catalog, we incorporate several additional, external catalogs into the parent sample.

1. First, we add the sample of Local Group Dwarf Galaxies from `McConnachie (2012)`_, making sure to account for any systems already in the
   `HyperLeda`_ catalog. Using visual inspection, we determine that approximately half these systems are too low surface brightness to
   be part of the SGA (and therefore require special handling in `DR9 of the Legacy Surveys`_), and so we remove them from the sample. In
   addition, we move Fornax and Sculptor to the `globular cluster sample`_ for special handling in source detection and photometry.

2. Next, we identify the sample of galaxies in the `RC3`_ and `OpenNGC`_ catalogs which are missing from the `HyperLeda`_ sample. Surprisingly,
   many of these systems are large and high surface-brightness.

3. Finally, we use the photometric catalogs from `DR8 of the Legacy Surveys`_ to identify additional, previously unknown large-diameter
   galaxies. This supplemental catalog consists of two subsamples:

   - First, after applying a variety of catalog-level quality cuts (and extensive visual inspection), we identify all objects in DR8
     with half-light radii :math:`r(50)>14\,\mathrm{arcsec}` based on their Tractor fits;
   - Second, we construct a candidate sample of compact galaxies which would otherwise be forced to be point sources in DR9 based on
     their Gaia catalog properties (see `this notebook`_ for details).

.. _`McConnachie (2012)`: https://ui.adsabs.harvard.edu/abs/2012AJ....144....4M/abstract
.. _`DR8 of the Legacy Surveys`: ../../dr8
.. _`DR9 of the Legacy Surveys`: ../../dr9
.. _`globular cluster sample`: ../../external/#globular-clusters-planetary-nebulae
.. _`RC3`: https://vizier.u-strasbg.fr/viz-bin/VizieR?-source=VII/155
.. _`OpenNGC`: https://github.com/mattiaverga/OpenNGC
.. _`this notebook`: https://github.com/legacysurvey/legacypipe/blob/master/doc/nb/lslga-from-gaia.ipynb

Group Catalog
-------------

Next, we build a simple group catalog based on the angular separation of the galaxies in the sample. We join galaxies together using a
friends-of-friends algorithm and a :math:`10\,\mathrm{arcmin}` linking length, taking care to ensure that galaxies which overlap (within two times their
circularized :math:`D(25)` diameter) are assigned to the same group.

We identify ~515,000 unique groups, of which approximately 93% contain just one member. Among the remaining 7% of groups, we find ~15,000 groups with two
members, ~1700 groups with 3-5 members, ~50 groups with 6-10 members, and just four groups with 10 or more galaxies (including the Coma Cluster).

We also identify galaxies lying within and outside the Legacy Surveys imaging footprint.

Final Parent Sample and Data Model
----------------------------------

The final parent sample contains 535,787 galaxies approximately limited to :math:`D(25)>20\,\mathrm{arcsec}`, spanning a wide range of magnitude and
mean surface brightness. Of these, approximately 400,000 (~75%) lie within the DESI footprint.

Note that because of the supplemental catalogs, this sample includes a small fraction of sources with :math:`D(25)<20\,\mathrm{arcsec}`; however we
retain these galaxies in the parent sample because some of them are historically important NGC/IC galaxies.

**XXX Possible figures to make (also need to mention the heterogeneity of the sample and the surface brightness incompleteness somewhere, maybe in a "known issues" page).**

- **distribution on the sky**
- **diameter vs magnitude;**
- **something about the groups?**

The table below documents the data model of the current version (``v3.0``) of the parent sample, ``$LEGACYHALOS_DATA/SGA-parent-v3.0.fits``, where
``$LEGACYHALOS_DATA`` is the top-level output directory (environment variable) of the SGA pipeline. For `DR9 of the Legacy Surveys`_, this corresponds to
`/global/cfs/cdirs/cosmo/data/legacysurvey/dr9/XXX`_ at NERSC.

.. _`/global/cfs/cdirs/cosmo/data/legacysurvey/dr9/XXX`: https://portal.nersc.gov/cfs/cosmo/data/legacysurvey/dr9/sga/XXX

==================== ============ =========================================== ===============================================
Name                 Type         Units                                       Description
==================== ============ =========================================== ===============================================
``SGA_ID``           int64                                                    Unique identifier, corresponding to the row of the original catalog. Galaxies from `HyperLeda`_ have IDs ``0-1436175``; Local Group dwarfs have IDs ``2000000-2000092``; galaxies from the RC3 and OpenNGC have IDs ``3000000-3023010`` and ``4000000-4013957``, respectively; and sources from `DR8 of the Legacy Surveys`_ have IDs ``>5000000``
``GALAXY``           char[29]                                                 Unique galaxy name
``PGC``              int64                                                    Unique number from the `Principal Catalogue of Galaxies`_ (-1 if none or not known)
``RA``               float64      degree                                      Right Ascension (J2000)
``DEC``              float64      degree                                      Declination (J2000)
``MORPHTYPE``        char[21]                                                 Visual morphological type (*note: heterogeneous and incomplete*)
``PA_LEDA``          float32      degree                                      Position angle (astronomical convention, clockwise from North)
``D25_LEDA``         float32      arcmin                                      Diameter at the :math:`25\,\mathrm{mag}/\mathrm{arcsec}^2` (optical) surface brightness
``BA_LEDA``          float32                                                  Ratio of the semi-minor axis to the semi-major axis
``Z_LEDA``           float32                                                  Heliocentric redshift from `HyperLeda`_ (*note: missing values, represented with -1.0, do not imply that no redshift exists*)
``SB_D25_LEDA``      float32      Vega :math:`\mathrm{mag}/\mathrm{arcsec}^2` Mean surface brightness within ``D25_LEDA`` based on the brightness in ``MAG_LEDA``
``MAG_LEDA``         float32      Vega mag                                    Estimated total brightness (*note: heterogeneous in both bandpass and aperture; but for most galaxies* ``MAG_LEDA`` *is measured in the B-band*)
``BYHAND``           boolean                                                  Flag indicating that one or more quantities (``RA``, ``DEC``, ``D25_LEDA``, ``PA_LEDA``, ``BA_LEDA``, or ``MAG_LEDA`` were changed from their published values)
``REF``              char[13]                                                 Unique reference name: ``LEDA-20181114``, ``LGDWARFS``, ``RC3``, ``OpenNGC``, or ``DR8``
``IN_FOOTPRINT``     boolean                                                  Flag indicating whether the galaxy lies within the Legacy Surveys imaging footprint (~74% of the sample)
``IN_FOOTPRINT_GRZ`` boolean                                                  Union of ``IN_FOOTPRINT`` and three-band optical coverage at the central position of the galaxy (~70% of the sample)
``GROUP_ID``         int64                                                    Unique group number
``GROUP_NAME``       char[35]                                                 Unique group name, constructed from the name of its largest member (based on ``D25_LEDA``) and the suffix ``_GROUP``
``GROUP_MULT``       int16                                                    Group multiplicity (*i.e.*, number of members)
``GROUP_PRIMARY``    boolean                                                  Flag indicating the primary (*i.e.*, largest) member
``GROUP_RA``         float64      degree                                      Right Ascencion of the group weighted by ``D25_LEDA``
``GROUP_DEC``        float64      degree                                      Declination of the group weighted by ``D25_LEDA``
``GROUP_DIAMETER``   float32      arcmin                                      Approximate group diameter. For groups with a single galaxy, this quantity equals ``D25_LEDA``. For galaxies with multiple members, we estimate the diameter of the group as the maximum separation of all the pairs of group members (plus their ``D25_LEDA`` diameter)
``BRICKNAME``        char[8]                                                  Name of brick, encoding the brick sky position, eg "1126p222" near RA=112.6, Dec=+22.2
``DIAM``             float32      arcmin                                      Placeholder column documented below, but in this catalog populated with ``D25_LEDA``
``DIAM_REF``         char[4]                                                  Placeholder column documented below, but in this catalog populated with the string ``LEDA``
``PA``               float32      degree                                      Placeholder column documented below, but in this catalog populated with ``PA_LEDA``
``BA``               float32                                                  Placeholder column documented below, but in this catalog populated with ``BA_LEDA``
``ELLIPSEBIT``       int32                                                    Placeholder column documented below
==================== ============ =========================================== ===============================================

.. _`Principal Catalogue of Galaxies`: https://ui.adsabs.harvard.edu/abs/1989A%26AS...80..299P/abstract

Custom Mosaics and Ellipse-Fitting
==================================

With the parent sample in hand, we analyze every galaxy group independently; however, the code is MPI-parallelized and scales well. Specifically, we

1. build custom mosaics;
2. measure surface-brightness profiles by performing ellipse-fitting; and
3. generate diagnostic plots and webpage visualizations. **XXX: Not yet documented**

Custom Mosaics
--------------

We run the DR9 pipeline on a custom brick centered on the mean coordinates of the galaxy group and using a mosaic width (in pixels) equal to three times the
group diameter (based on the ``GROUP_RA``, ``GROUP_DEC``, and ``GROUP_DIAMETER`` properties; see the data model table, above). We restrict our analysis to galaxies
with :math:`grz` coverage in the DESI footprint, and adopt a fixed :math:`0.262\,\mathrm{arcsec}/\mathrm{pixel}` pixel scale for the optical imaging throughout.

Unlike the DR9 production runs, we use a couple different options when invoking the photometric pipeline:

* First, we invoke the ``--fit-on-coadds`` option, which triggers the following specialized behavior:

  - After reading the individual, sky-subtracted CCD images and rejecting outlier pixels, we increase the dynamic range of the pixel
    weights and then generate inverse-variance weighted coadds. We rescale the relative weights in order to downweight the bright
    central region of the galaxy (even more than from Poisson noise) to prevent Tractor from fitting the central part of the galaxy
    at the expense of the outer envelope. In addition, we generate an inverse-variance weighted pixelized PSF for each bandpass, and
    we turn off the default behavior of only fitting point sources to objects detected within the elliptical mask of each large
    galaxy. Finally, we continue with source detection and model fitting (*on the coadded images*), as in the normal pipeline.

* Second, we increase the threshold for detecting and deblending sources by specifying ``--saddle-fraction 0.2`` (the default value is ``0.1``)
  and ``--saddle-min 4.0`` (versus the default ``2.0``). These parameters control the fractional peak height for identifying new sources around
  existing sources, and the minimum required saddle point depth (in units of *sigma* above the noise) from existing sources down to new sources,
  respectively. We find these options necessary in order to prevent excessive shredding and overfitting of the *resolved* galactic structure of
  galaxies like HII regions.

This portion of the SGA pipeline produces the files described in the table below. The files are organized into the directory structure
``$LEGACYHALOS_DATA/RASLICE/GROUP_NAME``, where ``RASLICE [0-359]`` is the one-degree wide slice of the sky that the object belongs to
(in Python, ``RASLICE='{:06d}'.format(int(GROUP_RA*1000))[:3]``), and GROUP_NAME is the name of the galaxy group (see the data model table, above).

Most of these files are standard outputs of the DR9 photometric pipeline and are described on the `DR9 files page`_, although they have been
renamed for organizational purposes. Also note that we use the ``-largegalaxy`` suffix in many of these files to differentiate other possible variations
of the pipeline which produce the same files (but with a different suffix).

==================================================================== ================================================
File                                                                 Description
==================================================================== ================================================
**DR9 pipeline ''grz'' files**
``GROUP_NAME``-ccds-south.fits                                       See the `DR9 files page`_
``GROUP_NAME``-largegalaxy-blobs.fits.gz                             See the `DR9 files page`_
``GROUP_NAME``-largegalaxy-maskbits.fits.fz                          See the `DR9 files page`_
``GROUP_NAME``-largegalaxy-outlier-mask.fits.fz                      See the `DR9 files page`_
``GROUP_NAME``-largegalaxy-tractor.fits                              See the `DR9 files page`_
``GROUP_NAME``-depth-`[g,r,z]`.fits.fz                               See the `DR9 files page`_
``GROUP_NAME``-largegalaxy-psf-`[g,r,z]`.fits.fz                     See the `DR9 files page`_
``GROUP_NAME``-largegalaxy-`[image,invvar,model]`-`[g,r,z]`.fits.fz  See the `DR9 files page`_
``GROUP_NAME``-largegalaxy-`[image,model,resid]`-grz.jpg             See the `DR9 files page`_
**DR9 pipeline "unWISE" outputs**
``GROUP_NAME``-`[image,invvar,model]`-`[W1,W2,W3,W4]`.fits.fz        See the `DR9 files page`_
``GROUP_NAME``-image-W1W2.jpg                                        See the `DR9 files page`_
``GROUP_NAME``-model-W1W2.jpg                                        See the `DR9 files page`_
**SGC pipeline files**
``GROUP_NAME``-largegalaxy-sample.fits                               Catalog that corresponds to the data model table, above containing just the galaxies in this galaxy group
``GROUP_NAME``-coadds.log                                            Logging output for this portion of the pipeline
``GROUP_NAME``-largegalaxy-coadds.[``isdone``, ``isfail``]           Zero-byte file indicating whether this portion of the pipeline completed successfully (``isdone``) or failed (``isfail``)
==================================================================== ================================================

.. _`DR9 files page`: ../files/#large-galaxy-files-largegalaxies-aaa-galname

Ellipse-Fitting
---------------

Next, we measure the multi-band surface brightness profiles of all the galaxies in our sample using the ellipse-fitting tools in the
`astropy-affiliated`_ package `photutils`_. Once again, we analyze each galaxy group independently and use MPI parallelization to
process the full sample in finite time.

.. _`astropy-affiliated`: https://docs.astropy.org/en/stable/
.. _`photutils`: https://photutils.readthedocs.io/en/stable/isophote.html

Specifically, we carry out the following steps for each galaxy group:

1. We begin by reading the ``-largegalaxy-tractor.fits`` and ``-largegalaxy-sample.fits`` catalogs for the field, and reject the following sources from the
   subsequent ellipse-fitting step, if any:

   - objects missing from the `Tractor catalogs`_ (i.e., they were dropped during fitting);
   - objects with negative :math:`r\hbox{-}\mathrm{band}` flux or objects fit by *Tractor* as type ``PSF``;
   - galaxies fit as *Tractor* type ``REX`` which have a measured half-light radius of :math:`\mathrm{shape\_r}<5\,\mathrm{arcsec}`;
   - galaxies fit as *Tractor* types ``EXP``, ``DEV``, or ``SER`` which have a measured half-light radius of :math:`\mathrm{shape\_r}<2\,\mathrm{arcsec}`.

   The first two criteria identify spurious sources in the parent catalog, or objects with grossly over-estimated diameters; we reject
   these objects from the final SGA catalog. The second two criteria identify galaxies which are too small to benefit from ellipse-fitting
   (*i.e.*, they are well-fit by the standard photometric pipeline); these objects also get special handling when we assemble the final SGA catalog.

.. _`Tractor catalogs`: ../catalogs
.. _`Tractor catalog`: ../catalogs

2. Next, we read the :math:`grz` images and the corresponding inverse variance and model images. Here and throughout our analysis we use the
   :math:`r\hbox{-}\mathrm{band}` image as the *reference band*. We also read the ``-largegalaxy-maskbits.fits`` image but only retain the
   ``BRIGHT``, ``MEDIUM``, ``CLUSTER``, ``ALLMASK_G``, ``ALLMASK_R``, and ``ALLMASK_Z`` `bitmasks`_ (hereafter, we refer to this mask as the
   ``starmask``). With these pieces in hand, we carry out the following steps:

   - First, we build a ``residual_mask`` which accounts for statistically significant differences between the data and the *Tractor* models.
     In detail, we flag all pixels which deviate by more than :math:`5\hbox{-}\sigma` (in any bandpass) from the absolute value of the Gaussian-smoothed
     residual image, which we construct by subtracting the model image from the data and smoothing with a 2-pixel Gaussian kernel. This step
     obviously masks all sources *including* the galaxy of interest, but we restore those pixels in the next step. In addition, we iteratively
     dilate the mask two times, and we also mask pixels along the border of the mosaic with a border equal to 2% of the size of the mosaic.
   - Next, we iterate on each galaxy in the group from brightest to faintest based on its :math:`r\hbox{-}\mathrm{band}` flux. For each galaxy,
     we construct the model image from all the *Tractor* sources in the field *except the galaxy of interest*, and subtract this model image
     from the data. We then measure the mean elliptical geometry of the galaxy based on the second moment of the light distribution using a
     modified version of Michele Cappellari's `mge.find_galaxy`_ algorithm (hereafter, the ``ellipse moments``). When computing the ``ellipse moments``,
     we only use pixels with surface brightness :math:`>27\,\mathrm{mag}/\mathrm{arcsec}^2`, and we median-filter the image with a 3-pixel boxcar to
     smooth out any small-scale galactic structure. We then combine the ``residual_mask`` with the ``starmask`` (using Boolean logic), but *unmask*
     pixels belonging to the galaxy based on the geometry of the ``ellipse moments``, but using 1.5 times the estimated semi-major axis of the galaxy.
   - The preceding algorithm fails in fields containing more than one galaxy if the central coordinates of one of galaxies is masked by a previous
     (brighter) system. (We consider a source to be impacted if *any* pixels in a 5-pixel diameter box centered on the *Tractor* position of the
     galaxy are masked.) In this case, we iteratively *shrink* the elliptical mask of any of the previous galaxies until the central position of
     the current galaxy is unmasked.
   - Another occasional failure mode is if the flux-weighted position of the galaxy based on the ``ellipse moments`` differs from the *Tractor* position
     by more than 10 pixels, which can happen in crowded fields and near bright stars and unmasked image artifacts. In this case we revert to using the
     *Tractor* coordinates and model geometry.
   - Finally, we convert the images to surface brightness in :math:`\mathrm{nanomaggies}/\mathrm{arcsec}^2` and the weight maps to variance images in
     :math:`\mathrm{nanomaggies}^2/\mathrm{arcsec}^4`.

.. _`bitmasks`: ../bitmasks
.. _`mge.find_galaxy`: https://www-astro.physics.ox.ac.uk/~mxc/software/#mge

3. With the images and individual masks for each galaxy in hand, we can now measure the multi-band surface-brightness profiles of each galaxy. We
   assume a fixed elliptical geometry based on the previously measured ``ellipse moments``, and robustly determine the surface brightness along
   the elliptical path from the central pixel to two times the estimated semi-major axis of the galaxy (based on the ``ellipse moments``), in 1-pixel
   intervals. In detail, we measure the surface brightness (and the uncertainty) using ``nclip=2``, ``sclip=3``, and ``integrmode=median``, i.e., two
   sigma-clipping iterations, a :math:`3\hbox{-}\sigma` clipping threshold, and median area integration, respectively, as documented in the
   `photutils.isophote.Ellipse.fit_image`_ method.

   From the :math:`r\hbox{-}\mathrm{band}` surface brightness profile, we also robustly measure the size of the galaxy at the following surface
   brightness thresholds: 22, 22.5, 23, 23.5, 24, 24.5, 25, 25.5 and 26 :math:`\mathrm{mag}/\mathrm{arcsec}^2`. We perform this measurement by
   fitting a linear model to the surface brightness profile converted to :math:`\mathrm{mag}/\mathrm{arcsec}^2` vs. :math:`r^{0.25}` (which would be
   a straight line for a de Vaucouleurs galaxy profile), but only consider measurements that are within :math:`\pm1\,\mathrm{mag}/\mathrm{arcsec}^2`
   of the desired surface brightness threshold. To estimate the uncertainty in this radius we generate Monte Carlo realizations of the surface
   brightness profile and use the standard deviation of the resulting distribution of radii.

   Finally, we also measure the curve-of-growth in each bandpass using the tools in `photutils.aperture`_. Briefly, we integrate the image and
   variance image in each bandpass using elliptical apertures from the center of the galaxy to two times its estimated semi-major axis (based on
   the ``ellipse moments``, again, in 1-pixel intervals). We fit the curve-of-growth, :math:`m(r)` using the following empirical model (based on
   an equation from `Observational Astronomy by Birney, Gonzalez, & Oesper`_):

   :math:`m(r) = m_1 + m_0\{1 - \exp[-\alpha_1(r/r_0)^{-\alpha_2}]\}`

   where :math:`m_1, m_0, \alpha_1, \alpha_2` and :math:`r_0` are constant parameters of the model and :math:`r` is the galactocentric radius
   (semi-major axis) in arcsec. In our analysis we take the radius scale factor :math:`r_0=10\,\mathrm{arcsec}` to be fixed. Note that in the
   limit :math:`r \rightarrow\infty`, :math:`m_1` is the total, integrated magnitude, and as :math:`r \rightarrow 0`, :math:`m_0 + m_1` is the
   brightness at the center of the galaxy.


.. _`photutils.isophote.Ellipse.fit_image`: https://photutils.readthedocs.io/en/stable/api/photutils.isophote.Ellipse.html#photutils.isophote.Ellipse.fit_image
.. _`photutils.aperture`: https://photutils.readthedocs.io/en/stable/aperture.html
.. _`Observational Astronomy by Birney, Gonzalez, & Oesper`: https://www.cambridge.org/highereducation/books/observational-astronomy/98B4694421AEB3953FE088D19BA0495C
.. _`astropy.QTable`: https://docs.astropy.org/en/stable/api/astropy.table.QTable.html#astropy.table.QTable

Finally, we package all the measurements, one per galaxy, into an `astropy.QTable`_ table (including units for all the quantities), and write out
the results. Specifically, this part of the pipeline writes out the following files:

============================================================ ================================================
File                                                         Description
============================================================ ================================================
``GROUP_NAME``-largegalaxy-``ID``-ellipse.fits               Table containing the ellipse-fitting results for the galaxy with ``SGA`` identification number ``ID``, using the data model from the table below
``GROUP_NAME``-ellipse.log                                   Logging output for this portion of the pipeline
``GROUP_NAME``-largegalaxy-ellipse.[``isdone``, ``isfail``]  Zero-byte file indicating whether this portion of the pipeline completed successfully (``isdone``) or failed (``isfail``)
============================================================ ================================================

The data model for the ellipse-fitting results is:

================================================== ========== ============================================== ===============================================
Name                                               Type       Units                                          Description
================================================== ========== ============================================== ===============================================
``SGA_ID``                                         int64                                                     See the data model (the first table on this page)
``GALAXY``                                         char[?]                                                   See the data model (the first table on this page)
``RA``                                             float64    degree                                         See the data model (the first table on this page)
``DEC``                                            float64    degree                                         See the data model (the first table on this page)
``PGC``                                            int64                                                     See the data model (the first table on this page)
``PA_LEDA``                                        float32    degree                                         See the data model (the first table on this page)
``BA_LEDA``                                        float32                                                   See the data model (the first table on this page)
``D25_LEDA``                                       float32    arcmin                                         See the data model (the first table on this page)
``BANDS``                                          char[1][3]                                                List of bandpasses fitted
``REFBAND``                                        char[1]                                                   Reference band
``REFPIXSCALE``                                    float32    arcsec/pixel                                   Pixel scale in the reference band
``SUCCESS``                                        boolean                                                   Flag indicating success or failure
``FITGEOMETRY``                                    boolean                                                   Flag indicating whether the ellipse geometry was allowed to vary with semi-major axis (here, always ``False``)
``INPUT_ELLIPSE``                                  boolean                                                   Flag indicating whether ellipse parameters were passed from an external file (here, always ``False``)
``LARGESHIFT``                                     boolean                                                   Flag indicating that the light-weighted center (from the ``ellipse moments``) is different from the *Tractor* position by more than 10 pixels in either dimension
``RA_X0``                                          float64    degree                                         Right ascension (J2000) at pixel position ``X0``
``DEC_Y0``                                         float64    degree                                         Declination (J2000) at pixel position ``Y0``
``X0``                                             float32    pixel                                          Light-weighted position along the *x*-axis (from ``ellipse moments``)
``Y0``                                             float32    pixel                                          Light-weighted position along the *y*-axis (from ``ellipse moments``)
``EPS``                                            float32                                                   Ellipticity (:math:`e=1-b/a`, where :math:`b/a` is the semi-minor to semi-major axis ratio) see `this FAQ`_ for details (from ``ellipse moments``)
``PA``                                             float32    degree                                         Position angle (astronomical convention, clockwise from North; from ``ellipse moments``)
``THETA``                                          float32    degree                                         Position angle measured clockwise from the *x*-axis, given by [:math:`(270-PA)` mod 180] (from ``ellipse moments``)
``MAJORAXIS``                                      float32    pixel                                          Light-weighted length of the semi-major axis (from ``ellipse moments``)
``MAXSMA``                                         float32    pixel                                          Maximum semi-major axis length used for the ellipse-fitting and curve-of-growth measurements (taken to be two times ``MAJORAXIS``)
``INTEGRMODE``                                     char[6]                                                   `photutils.isophote.Ellipse.fit_image`_ integration mode
``SCLIP``                                          int16                                                     `photutils.isophote.Ellipse.fit_image`_ sigma-clipping threshold
``NCLIP``                                          int16                                                     Number of `photutils.isophote.Ellipse.fit_image`_ sigma-clipping iterations
``PSFSIZE_[G,R,Z]``                                float32    arcsec                                         Mean width of the point-spread function over the full mosaic (derived from the ``PSFSIZE_[G,R,Z]`` columns in the `Tractor catalogs`_)
``PSFDEPTH_[G,R,Z]``                               float32    mag                                            Mean :math:`5\hbox{-}\sigma` depth over the full mosaic (derived from the ``PSFDEPTH_[G,R,Z]`` columns in the `Tractor catalogs`_)
``MW_TRANSMISSION_[G,R,Z]``                        float32                                                   Galactic transmission fraction (taken from the corresponding `Tractor catalog`_ at the central coordinates of the galaxy)
``REFBAND_WIDTH``                                  float32    pixel                                          Width of the optical mosaics in ``REFBAND``
``REFBAND_HEIGHT``                                 float32    pixel                                          Height of the optical mosaics in ``REFBAND`` (always equal to ``REFBAND_WIDTH``)
``[G,R,Z]_SMA``                                    float32    pixel
``[G,R,Z]_EPS``                                    float32
``[G,R,Z]_EPS_ERR``                                float32
``[G,R,Z]_PA``                                     float32    degree
``[G,R,Z]_PA_ERR``                                 float32    degree
``[G,R,Z]_INTENS``                                 float32    :math:`\mathrm{nanomaggies}/\mathrm{arcsec}^2`
``[G,R,Z]_INTENS_ERR``                             float32    :math:`\mathrm{nanomaggies}/\mathrm{arcsec}^2`
``[G,R,Z]_X0``                                     float32    pixel
``[G,R,Z]_X0_ERR``                                 float32    pixel
``[G,R,Z]_Y0``                                     float32    pixel
``[G,R,Z]_Y0_ERR``                                 float32    pixel
``[G,R,Z]_A3``                                     float32
``[G,R,Z]_A3_ERR``                                 float32
``[G,R,Z]_A4``                                     float32
``[G,R,Z]_A4_ERR``                                 float32
``[G,R,Z]_RMS``                                    float32    :math:`\mathrm{nanomaggies}/\mathrm{arcsec}^2`
``[G,R,Z]_PIX_STDDEV``                             float32    :math:`\mathrm{nanomaggies}/\mathrm{arcsec}^2`
``[G,R,Z]_STOP_CODE``                              int16
``[G,R,Z]_NDATA``                                  int16
``[G,R,Z]_NFLAG``                                  int16
``[G,R,Z]_NITER``                                  int16
``[G,R,Z]_COG_SMA``                                float32    pixel
``[G,R,Z]_COG_MAG``                                float32    mag
``[G,R,Z]_COG_MAGERR``                             float32    mag
``[G,R,Z]_COG_PARAMS_MTOT``                        float32    mag
``[G,R,Z]_COG_PARAMS_M0``                          float32    mag
``[G,R,Z]_COG_PARAMS_ALPHA1``                      float32
``[G,R,Z]_COG_PARAMS_ALPHA2``                      float32
``[G,R,Z]_COG_PARAMS_CHI2``                        float32
``RADIUS_SB[23,23.5,24,24.5,25,25.5,26]``          float32
``RADIUS_SB[23,23.5,24,24.5,25,25.5,26]_ERR``      float32
``[G,R,Z]_MAG_SB[23,23.5,24,24.5,25,25.5,26]``     float32
``[G,R,Z]_MAG_SB[23,23.5,24,24.5,25,25.5,26]_ERR`` float32
================================================== ========== ============================================== ===============================================

.. _`this FAQ`: https://photutils.readthedocs.io/en/stable/isophote_faq.html#why-use-ellipticity-instead-of-the-canonical-ellipse-eccentricity