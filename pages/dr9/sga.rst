.. title: Siena Galaxy Atlas 2020
.. slug: sga
.. tags: mathjax
.. description:

.. |deg|    unicode:: U+000B0 .. DEGREE SIGN
.. |Prime|    unicode:: U+02033 .. DOUBLE PRIME

.. class:: pull-right well

.. contents::

*Primary contacts:* `John Moustakas`_ and `Dustin Lang`_

.. _`John Moustakas`: ../../contact/#other-experts
.. _`Dustin Lang`: ../../contact/#other-experts

`Data Access`_
==============

The ``SGA-2020`` data products can be browsed and downloaded at the `SGA
web-portal`_, both for individual galaxies and the full sample. Below, we
describe the data model for these data products. A forthcoming paper (Moustakas,
Lang, et al., in preparation) will describe the ``SGA-2020`` in detail.

``Overview``
============

The ``Siena Galaxy Atlas (SGA)`` is a multiwavelength atlas of approximately
385,000 nearby galaxies selected based on their apparent angular diameter.

These galaxies are intrinsically large enough to be spatially resolved from our
vantage point in the universe, providing a unique and powerful window into the
fossil record of galaxy formation and evolution and the galaxy-halo
connection. In addition, the atlas serves as a valuable angular map of the
foreground extragalactic sky for cosmological surveys of distant galaxies like
the `Dark Energy Spectroscopic Instrument (DESI)`_ survey.

The ``SGA`` delivers precise coordinates, multiwavelength mosaics, azimuthally
averaged optical surface brightness and color profiles, integrated and aperture
photometry, model images and photometry, and additional metadata for the full
sample. The primary sample relies on deep, wide-field *grz* imaging from the
`DESI Legacy Imaging Surveys DR9`_ as well as all-sky infrared imaging at 3.4-22
microns from `unWISE`_.

The 2020 version of the atlas, ``SGA-2020``, is primarily selected from the
`Hyperleda extragalactic database`_ of *known* large angular-diameter galaxies,
although future versions of the atlas will be supplemented with galaxies
identified from the `DR9`_ imaging itself, which will mitigate the heterogeneity
and surface brightness incompleteness of the parent sample.

Coupled with existing and forthcoming optical spectroscopy from `DESI`_,
particularly the Bright Galaxy Survey (BGS) of 10 million galaxies brigher than
:math:`r=20`, the ``SGA-2020`` will yield important new insights into the star
formation and mass assembly histories of galaxies, enable a myriad complementary
studies of the nearby and distant universe, and help engage the broader public
in astronomy with visually striking color imaging of large, well-resolved,
nearby galaxies.

.. 
 Historical & Scientific Context
 ===============================
 
 Nearby galaxies which are intrinsically large enough to be spatially
 well-resolved (from our vantage point in the universe) provide a unique and
 powerful window into the fossil record of galaxy formation and evolution. In
 these large angular-diameter systems we can carry out exceptionally detailed
 studies of their internal structure, global properties, faint, low
 surface-brightness features, and local and large-scale environments.

 Indeed, existing catalogs and imaging atlases of large, nearby galaxies such as
 the Third Reference Catalog of Bright Galaxies (RC3), the 2MASS Large Galaxy
 Atlas, and the NASA–Sloan Atlas, among others, have had a rich and outsized
 impact on our current understanding of galaxy formation.

``Reporting Issues``
====================

We welcome questions and feedback from users, as well as requests for additional
data products through the ticket system at

- https://github.com/moustakas/SGA/issues

We also acknowledge that all the code used to select, build, and analyze the
catalog is open source and publicly available:

- https://github.com/moustakas/SGA
- https://github.com/moustakas/legacyhalos
- https://github.com/legacysurvey/legacypipe

``Sample Selection``
====================

In this section we briefly describe the construction of the parent ``SGA-2020`` sample.

``Hyperleda Catalog``
---------------------

To construct the initial galaxy catalog, we queried the `Hyperleda extragalactic
database`_ for galaxies with angular diameter :math:`D(25)>0.2\
\mathrm{arcmin}`, where :math:`D(25)` is the diameter at the :math:`25\
\mathrm{mag\ arcsec}^{-2}` surface brightness isophote (in the optical,
typically the `B`-band), a traditional measure of the "size" of the galaxy
popularized by the `Third Reference Catalog of Bright Galaxies (RC3)`_.

We executed the following query on the ``2018 November 14`` version of the
`Hyperleda`_ database, resulting in a catalog of 1,436,176 galaxies:

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
     m.pgc, m.objname, m.objtype, m.al2000, m.de2000, m.type, m.bar, m.ring, m.multiple, m.compactness, m.t, 
     m.logd25, m.logr25, m.pa, m.bt, m.it, m.kt, m.v, m.modbest, "R50".lax, "R50".sax, "IR".lax, "IR".sax,
   FROM
     m000 AS m
     LEFT JOIN "R50" USING (pgc)
     LEFT JOIN "IR" USING (pgc)
   WHERE
     objtype='G'
     and (
       m.logd25>0.2 or "R50".lax>0.2 or "IR".lax>0.2
     )


Based on a large number of visual inspections and both quantitative and
qualitative tests, we culled the resulting sample by applying the following
additional cuts:

* First, we limited the sample to :math:`0.333<D(25)<180\ \mathrm{arcmin}`,
  which removed roughly 900,000 galaxies (:math:`\approx63\%` of the original
  sample), including the Magellanic Clouds and the Sagittarius Dwarf Galaxy at
  the large-diameter end). We implemented the :math:`D(25)<20\ \mathrm{arcsec}`
  cut because we found that the fraction of spurious sources (or sources with
  incorrect diameters) increased rapidly below this diameter; moreover, galaxies
  smaller than this size are modeled reasonably well as part of the standard
  ``Tractor`` pipeline used in `DR9`_.
  
..  
  

* Next, we removed :math:`\approx3800` galaxies with no magnitude estimate in
  `Hyperleda`_, galaxies which we found to be largely spurious based on visual
  inspection.
  
..  
  

* Third, we removed :math:`\approx6500` spurious sources (or galaxies with
  significantly overestimated diameters) based on visual inspection.
  
..  
  

* Finally, we removed :math:`\approx1700` galaxies whose primary galaxy
  identifier (in `Hyperleda`_) was from either SDSS or 2MASS and whose central
  coordinates placed it *inside* the elliptical aperture of *another* (non-SDSS
  and non-2MASS) galaxy with diameter greater than 0.5 arcmin. Based on visual
  inspection, we found that many of these sources were due to shredding or were
  spurious sources with grossly over-estimated diameters.

In addition, we visually inspected all galaxies in the sample with
:math:`D(25)>0.75\ \mathrm{arcmin}`, including all the NGC/IC galaxies, and
assessed their published elliptical geometry and coordinates. Where necessary,
we updated the diameter, position angle, minor-to-major axis ratio, and, in some
cases, central coordinates "by hand", as indicated in the `BYHAND` column
described in the data model below. The `NASA Extragalactic Database (NED)`_
proved invaluable for these cross-checks.

``Supplemental Catalogs``
-------------------------

To improve the completeness of the `Hyperleda`_ catalog, we supplemented the
sample with several additional catalogs:

* First, we added the sample of Local Group Dwarf Galaxies from `McConnachie
  (2012)`_, making sure to account for any systems already in the `Hyperleda`_
  catalog. Using visual inspection, we determined that approximately half these
  systems were too unresolved to be part of the ``SGA-2020`` (e.g., Ursa Minor),
  and so we removed them from the sample.
  
..  
  

* Next, we identified the sample of galaxies in the `RC3`_ and `OpenNGC`_
  catalogs which were missing from the `Hyperleda`_ sample. Surprisingly, many
  of these systems are large and high surface-brightness.
  
..  
  

* Finally, we used the `DR8`_ photometric catalogs to identify additional additional large-diameter
  galaxies. This supplemental catalog consists of two subsamples:

  * First, after applying a variety of catalog-level quality cuts (and extensive
    visual inspection), we identified all objects in `DR8`_ with half-light radii
    :math:`r(50)>14\ \mathrm{arcsec}` based on their ``Tractor`` model fits;

  * And second, we constructed a candidate sample of compact galaxies which
    would otherwise be forced to be point sources in `DR9`_ based on their Gaia
    catalog properties `this notebook`_ for details.

..  
  In addition, Fornax and Sculptor to the [http://link/to/the/cluster/page
  "globular cluster"] sample for special handling in source detection and
  photometry.

``Group Catalog``
-----------------

Galaxies which are close to one another (in apparent, angular coordinates) must
be analyzed jointly. Consequently, we built a simple group catalog using a
friends-of-friends algorithm and a :math:`10\ \mathrm{arcmin}` linking length,
taking care to ensure that galaxies which overlap (within two times their
circularized :math:`D(25)` diameter) were assigned to the same group.

Using this procedure, we identified :math:`\approx515,000` unique groups, of
which approximately :math:`93\%` have just one member. Among the remaining 7% of
groups, :math:`\approx15,000` groups have two members, :math:`\approx1700`
groups have 3-5 members, :math:`\approx50` groups have 6-10 members, and just
four groups have 10 or more galaxies, including the center of the Coma Cluster.

..
  We also identify galaxies lying within and outside the Legacy Surveys imaging
  footprint.

``Final Parent Sample``
-----------------------

The final parent sample contains 531,677 galaxies approximately limited to
:math:`D(25)>20\ \mathrm{arcsec}`, spanning a wide range of magnitude and mean
surface brightness. Of these, approximately 385,000 (:math:`\approx72\%`) lie
within the `DR9`_ imaging footprint.

..
  Note that because of the supplemental catalogs, this sample includes a small
  fraction of sources with `D(25)<20 arcsec`; however we retain these galaxies
  in the parent sample because some of them are historically important NGC/IC
  galaxies.

Custom Mosaics & Ellipse-Fitting
================================

We analyze every galaxy group in the parent ``SGA-2020`` catalog independently
(noting that the pipeline is MPI-parallelized, and so it scales reasonably
well). In the following two sections (`Custom Mosaics`_ and `Ellipse-Fitting`_)
we describe our procedure in more detail. 

Information regarding the resulting data products and their organization on-disk
can be found in the `Data Products`_ section.

Custom Mosaics
--------------

We run the `DR9`_ pipeline on a "custom brick" based on the estimated center and
diameter of the galaxy group (using ``GROUP_RA``, ``GROUP_DEC``, and
``GROUP_DIAMETER`` defined in `SGA-2020.fits`_). Specifically, we generate
mosaics according to the following criteria:

* For groups with ``GROUP_DIAMETER``:math:`<14\ \mathrm{arcmin}` we use a mosaic
  diameter of :math:`3\times` ``GROUP_DIAMETER``;
* For groups with :math:`14<` ``GROUP_DIAMETER``:math:`<30\ \mathrm{arcmin}` we
  use a mosaic diameter of :math:`2\times` ``GROUP_DIAMETER``;
* And for groups with ``GROUP_DIAMETER``:math:`>30\ \mathrm{arcmin}` (which only
  affects ``NGC0598_GROUP``) we use a mosaic diameter of :math:`1.4\times`
  ``GROUP_DIAMETER``.

In all cases, for the *grz* imaging we adopt a fixed pixel scale of
:math:`0.262\ \mathrm{arcsec/pixel}` and for the unWISE mosaics we use
:math:`2.75\ \mathrm{arcsec/pixel}`.

Unlike in `DR9`_, we use a couple different options when calling the
`legacypipe`_ photometric pipeline:

* First, we invoke the ``--fit-on-coadds`` option, which triggers the following
  specialized behavior:
  
  * After reading the individual, sky-subtracted CCD images and rejecting
    outlier pixels, we rescale the inverse variance weights in order to
    downweight the bright central region of the galaxy (even more than from
    Poisson noise). This change was implemented in order to prevent Tractor from
    fitting the central part of the (typically large, high-surface brightness)
    galaxy at the expense of the outer envelope;
  * We generate and write out inverse-variance weighted pixelized PSFs for each
    of the *g*-, *g*-, and *z*-band bandpass based on all the available input
    imaging;
  * We turn off the default behavior of only fitting point sources to objects
    detected within the elliptical mask of each SGA large galaxy;
  * And finally, we continue with source detection and model fitting *on the
    coadded images*, unlike in the normal pipeline (in which source detection
    and model fitting are run on the individual CCDs).
    
..  
  

* Second, we increase the threshold for detecting and deblending sources by
  specifying ``--saddle-fraction 0.2`` (the default value is ``0.1``) and
  ``--saddle-min 4.0`` (versus the default ``2.0``). These parameters control
  the fractional peak height for identifying new sources around existing
  sources, and the minimum required saddle point depth (in units of the standard
  deviation of pixel values above the noise) from existing sources down to new
  sources, respectively. We find these options necessary in order to prevent
  excessive shredding and overfitting of the "resolved" galactic structure in
  individual galaxies (e.g., HII regions).

Ellipse-Fitting
---------------

We measure the multi-band surface brightness profiles of each galaxy in the
``SGA`` using the ellipse-fitting tools in the `astropy`_-affiliated package
`photutils`_. Once again, we analyze each galaxy group independently and use MPI
parallelization to process the full sample.

Specifically, we carry out the following steps for each galaxy group:

1. We begin by reading the ``GROUP_NAME-largegalaxy-tractor.fits`` and
   ``GROUP_NAME-largegalaxy-sample.fits`` catalogs for each group (see the
   `Images and Catalogs`_ section) and reject the following sources from the
   subsequent ellipse-fitting step, if any:
   
   * objects missing from the *Tractor* catalog (i.e., they were dropped during
     *Tractor* modeling);
   * objects with negative *r*-band flux or objects fit by *Tractor* as type
     ``PSF``;
   * galaxies fit as *Tractor* type ``REX`` which have a measured half-light
     radius shape_r :math:`<5\ \mathrm{arcsec}`;
   * galaxies fit as *Tractor* types ``EXP``, ``DEV``, or ``SER`` which have a
     measured half-light radius shape_r :math:`<2\ \mathrm{arcsec}`;

   The first two criteria identify spurious sources in the initial parent
   catalog or objects with grossly over-estimated diameters, and all these
   objects already have been removed from the `SGA-2020.fits`_ catalog.

   The second two criteria identify galaxies which are too small to benefit from
   ellipse-fitting, i.e., they are well-fit by the standard photometric pipeline
   and have been deemed to not require special handling. These sources will
   likely be removed from future versions of the ``SGA``.

2. Next, we read the *grz* images and corresponding inverse variance and model
   images. Here and throughout our analysis we use the *r*-band image as the
   "reference band." We also read the ``GROUP_NAME-largegalaxy-maskbits.fits``
   image (see `Images and Catalogs`_) but only retain the ``BRIGHT``,
   ``MEDIUM``, ``CLUSTER``, ``ALLMASK_G``, ``ALLMASK_R``, and ``ALLMASK_Z`` bits
   (defined in the `DR9 bitmasks`_ page). Hereafter, we refer to this mask as
   the ``starmask``.

   With these data in hand, we carry out the following steps:
   
   * First, we build a ``residual_mask`` which accounts for statistically
     significant differences between the data and the *Tractor* models. In
     detail, we flag all pixels which deviate by more than `5-sigma` (in *any*
     bandpass) from the absolute value of the Gaussian-smoothed residual image,
     which we construct by subtracting the model image from the data and
     smoothing with a `2-pixel` Gaussian kernel. This step obviously masks all
     sources *including* the galaxy of interest, but we restore those pixels in
     the next step. In addition, we iteratively dilate the mask two times and we
     also mask pixels along the border of the mosaic with a border equal to 2%
     the size of the mosaic.
    
   ..  
  
    
   * Next, we iterate on each galaxy in the group from brightest to faintest
     based on its *r*-band flux (from *Tractor*). For each galaxy, we construct
     the model image from all the *Tractor* sources in the field *except the
     galaxy of interest*, and subtract this model image from the data. 

     We then measure the mean elliptical geometry of the galaxy based on the
     second moment of the light distribution using a modified version of
     `Michele Cappellari's mge.find_galaxy`_ algorithm (hereafter, the ``ellipse
     moments``). When computing the ``ellipse moments``, we only use pixels with
     surface brightness :math:`>27\ \mathrm{mag\ arcsec}^{-2}` and we
     median-filter the image with a `3-pixel` boxcar to smooth out any
     small-scale galactic structure.

     Finally, we combine the ``residual_mask`` with the ``starmask`` (using
     Boolean logic), but *unmask* pixels belonging to the galaxy based on the
     ``ellipse moments`` geometry, but using 1.5 times the estimated semi-major
     axis of the galaxy.
    
   ..  
  
    
   * The preceding algorithm fails in fields containing more than one galaxy if
     the central coordinates of one of galaxies is masked by a previous
     (brighter) system. (We consider a source to be impacted if *any* pixels in
     a `5-pixel` diameter box centered on the *Tractor* position of the galaxy
     are masked.) In this case, we iteratively *shrink* the elliptical mask of
     any of the previous galaxies until the central position of the current
     galaxy is unmasked.

     Note that this algorithm is not perfect, particularly in crowded fields
     (e.g., the center of the Coma Cluster), but will be improved in future
     versions of the ``SGA``.
    
   ..  
  
    
   * Another occasional failure mode is if the flux-weighted position of the
     galaxy based on the ``ellipse moments`` differs by the *Tractor* position
     by more than `10 pixels`, which can happen in crowded fields and near
     bright stars and unmasked image artifacts. In this case we revert to using
     the *Tractor* coordinates and model geometry and record this occurance in
     the ``largeshift`` bit (see the `SGA Bitmasks`_ page). 
    
   ..  
  
     
   * Finally, we convert the images to surface brightness in 
     :math:`\mathrm{nanomaggies\ arcsec}^{-2}` and the weight maps to variance
     images in :math:`\mathrm{nanomaggies}^2\ \mathrm{arcsec}^{-4}`.

3. With the images and individual masks for each galaxy in hand, we can now
   measure the multi-band surface-brightness profiles of each galaxy. We assume
   a fixed elliptical geometry based on the ``ellipse moments`` previously
   measured, and robustly determine the surface brightness along the elliptical
   path from the central pixel to two times the estimated semi-major axis of the
   galaxy (based on the ``ellipse moments``), in `1-pixel` (0.262 arcsec)
   intervals.

   In detail, we measure the surface brightness (and the uncertainty) using
   `nclip=2`, `sclip=3`, and `integrmode=median`, i.e., two sigma-clipping
   iterations, a `3-sigma` clipping threshold, and `median` area integration,
   respectively, as documented in the `photutils.isophote.Ellipse.fit_image`_
   method.

   From the *r*-band surface brightness profile, we also robustly measure the
   size of the galaxy at the following surface brightness thresholds: 22, 22.5,
   23, 23.5, 24, 24.5, 25, 25.5, and :math:`26\ \mathrm{mag\ arcsec}^{-2}` . We
   perform this measurement by fitting a linear model to the surface brightness
   profile converted to :math:`\mathrm{mag\ arcsec}^{-2}` vs :math:`r^0.25`
   (which would be a straight line for a de Vaucouleurs galaxy profile), but
   only consider measurements which are within :math:`\pm1\ \mathrm{mag\
   arcsec}^{-2}` of the desired surface brightness threshold. To estimate the
   uncertainty in this radius we generate Monte Carlo realizations of the
   surface brightness profile and use the standard deviation of the resulting
   distribution of radii.

   Finally, we also measure the curve-of-growth in each bandpass using the tools
   in `photutils.aperture`_. Briefly, we integrate the image and variance image
   in each bandpass using elliptical apertures from the center of the galaxy to
   two times its estimated semi-major axis (based on the ``ellipse moments``,
   again, in `1-pixel` or 0.262 arcsec intervals). 

   We fit the curve-of-growth, :math:`m(r)` using the following empirical model
   (taken from `Observational Astronomy by Birney, Gonzalez, & Oesper`_):

   .. math::
                   
      m(r) = m_{1} + m_{0} \left\{1-\exp\left[ -\alpha_{1} \left(\frac{r}{r_{0}}\right)^{-\alpha_{2}} \right]\right\}

   where :math:`m_{1}`, :math:`m_{0}`, :math:`\alpha_{1}`, :math:`\alpha_{2}`,
   and :math:`r_{0}` are constant parameters of the model and *r* is the
   semi-major axis in arcsec. In our analysis we take the radius scale factor
   :math:`r_{0}=10` arcsec to be fixed.

   Note that in the limit :math:`r\rightarrow\infty`, :math:`m_{1}` is the
   total, integrated magnitude, and as :math:`r\rightarrow0`,
   :math:`m_{0}+m_{1}` is the brightness at the center of the galaxy.

   Finally, we package all the measurements, one per galaxy, into an
   `astropy.QTable`_ table (including units on all the quantities), and write
   out the results (as documented in the `Ellipse-Fitting Results`_ section).

``Data Products``
=================

We divide the ``SGA-2020`` into two non-overlapping samples and define the data
model for each catalog below:

* `SGA-2020.fits`_ contains 383,568 galaxies with three-band (*grz*) imaging
  from `DR9`_, spanning :math:`\approx20,000\ \mathrm{deg}^2`. For these systems
  we were able to generate multiband mosaics and measure their
  surface-brightness and color profiles using standard ellipse-fitting
  techniques.
  
..  
  

* `SGA-2020-leda.fits`_ contains the remaining 148,109 galaxies from the parent
  sample which lie *off* the `DR9`_ imaging footprint. (Note that a small number
  of these galaxies are within the boundaries of the footprint but they lack
  three-band coverage and therefore were not analyzed as part of the
  ``SGA-2020``.)

We also define the set of `Group Files`_ we generate, such as the
multi-band mosaics and individual Tractor catalogs.

SGA-2020.fits
-------------

====== ============ ======== ======================
Number EXTNAME      Type     Contents
====== ============ ======== ======================
HDU00  PRIMARY      IMAGE    Empty.
HDU01  SGA_         BINTABLE Ellipse-fitting results.
HDU02  SGA-TRACTOR_ BINTABLE Tractor modeling results.
====== ============ ======== ======================

SGA
~~~

==================== ============ =========================================== ===============================================
Name                 Type         Units                                       Description
==================== ============ =========================================== ===============================================
``SGA_ID``           int64                                                    Unique identifier.
``GALAXY``           char[29]                                                 Unique galaxy name.
``PGC``              int64                                                    Unique identifier from the `Principal Catalogue of Galaxies`_ (-1 if none or not known).
``SGA_RA``           float64      degree                                      Right ascension (J2000).
``SGA_DEC``          float64      degree                                      Declination (J2000).
``MORPHTYPE``        char[21]                                                 Visual morphological type from `Hyperleda`_ (if available).
``PA_LEDA``          float32      degree                                      Galaxy position angle, measured positive clockwise from North.
``D25_LEDA``         float32      arcmin                                      Approximate diameter at the :math:`25\ \mathrm{mag}/\mathrm{arcsec}^2` (optical) surface brightness isophote, from `Hyperleda`_.
``BA_LEDA``          float32                                                  Ratio of the semi-minor axis to the semi-major axis.
``Z_LEDA``           float32                                                  Heliocentric redshift from `HyperLeda`_. *Note: a missing value, represented with -1.0, does not imply that no redshift exists*.
``SB_D25_LEDA``      float32      Vega :math:`\mathrm{mag}/\mathrm{arcsec}^2` Mean surface brightness within ``D25_LEDA`` based on the brightness in ``MAG_LEDA``.
``MAG_LEDA``         float32      Vega mag                                    Approximate brightness (*Note: this magnitude estimate is heterogeneous in both bandpass and aperture but for most galaxies it is measured in the B-band within ``D25_LEDA``; use with care*.)
``BYHAND``           boolean                                                  Flag indicating that one or more quantities (``RA``, ``DEC``, ``D25_LEDA``, ``PA_LEDA``, ``BA_LEDA``, or ``MAG_LEDA`` were changed from their published `HyperLeda`_ values, generally based on visual inspection.) 
``REF``              char[13]                                                 Unique reference name indicating the original source of the object, as described in `Sample Selection`_: ``LEDA-20181114``, ``LGDWARFS``, ``RC3``, ``OpenNGC``, or ``DR8``.
``GROUP_ID``         int64                                                    Unique group number.
``GROUP_NAME``       char[35]                                                 Unique group name, constructed from the name of its largest member (based on ``D25_LEDA``) and the suffix ``_GROUP`` (e.g., ``PGC193199_GROUP``).
``GROUP_MULT``       int16                                                    Group multiplicity (i.e., number of group members from the parent sample).
``GROUP_PRIMARY``    boolean                                                  Flag indicating the primary (i.e., largest) group member.
``GROUP_RA``         float64      degree                                      Right ascencion of the group weighted by ``D25_LEDA``.
``GROUP_DEC``        float64      degree                                      Declination of the group weighted by ``D25_LEDA``.
``GROUP_DIAMETER``   float32      arcmin                                      Approximate group diameter. For groups with a single galaxy this quantity equals ``D25_LEDA``. For galaxies with multiple members, we estimate the diameter of the group as the maximum separation of all the pairs of group members (plus their ``D25_LEDA`` diameter).
``BRICKNAME``        char[8]                                                  Name of brick, encoding the brick sky position, e.g. "1126p222" is centered on RA=112.6, Dec=+22.2. 
``DIAM``             float32      arcmin                                      Galaxy semi-major axis diameter measured at the :math:`26\ \mathrm{mag}/\mathrm{arcsec}^2\ r`-band isophote based on ``RADIUS_SB26``. If the *r*-band surface-brightness profile could not be measured at this level, the diameter is set equal to :math:`2.5\times` ``RADIUS_SB25`` or :math:`1.5\times` ``D25_LEDA``, in that order of priority.
``DIAM_REF``         char[4]                                                  Reference indicating the origin of the ``DIAM`` measurement: ``SB26``, ``SB25``, or ``LEDA``.
``PA``               float32      degree                                      Galaxy position angle, measured positive clockwise from North.
``BA``               float32                                                  Minor-to-major axis ratio.
``ELLIPSEBIT``       int32                                                    See `SGA Bitmasks`_ section.
``RADIUS_SB22``      float32      arcsec                                      Semi-major axis length at the :math:`\mu=22\ \mathrm{mag}\ \mathrm{arcsec}^{-2}` isophote in the *r*-band (-1 if not measured).
``RADIUS_SB22.5``    float32      arcsec                                      Like ``RADIUS_SB22`` but measured at the :math:`\mu=22.5\ \mathrm{mag}\ \mathrm{arcsec}^{-2}` isophote.
``RADIUS_SB23``      float32      arcsec                                      Like ``RADIUS_SB22`` but measured at the :math:`\mu=23\ \mathrm{mag}\ \mathrm{arcsec}^{-2}` isophote.
``RADIUS_SB23.5``    float32      arcsec                                      Like ``RADIUS_SB22`` but measured at the :math:`\mu=23.5\ \mathrm{mag}\ \mathrm{arcsec}^{-2}` isophote.
``RADIUS_SB24``      float32      arcsec                                      Like ``RADIUS_SB22`` but measured at the :math:`\mu=24\ \mathrm{mag}\ \mathrm{arcsec}^{-2}` isophote.
``RADIUS_SB24.5``    float32      arcsec                                      Like ``RADIUS_SB22`` but measured at the :math:`\mu=24.5\ \mathrm{mag}\ \mathrm{arcsec}^{-2}` isophote.
``RADIUS_SB25``      float32      arcsec                                      Like ``RADIUS_SB22`` but measured at the :math:`\mu=25\ \mathrm{mag}\ \mathrm{arcsec}^{-2}` isophote.
``RADIUS_SB25.5``    float32      arcsec                                      Like ``RADIUS_SB22`` but measured at the :math:`\mu=25.5\ \mathrm{mag}\ \mathrm{arcsec}^{-2}` isophote.
``RADIUS_SB26``      float32      arcsec                                      Like ``RADIUS_SB22`` but measured at the :math:`\mu=26\ \mathrm{mag}\ \mathrm{arcsec}^{-2}` isophote.
``G_MAG_SB22``       float32      AB mag                                      *g*-band magnitude measured within ``RADIUS_SB22`` (-1 if not measured).
``R_MAG_SB22``       float32      AB mag                                      *r*-band magnitude measured within ``RADIUS_SB22`` (-1 if not measured).
``Z_MAG_SB22``       float32      AB mag                                      *z*-band magnitude measured within ``RADIUS_SB22`` (-1 if not measured).
``G_MAG_SB22.5``     float32      AB mag                                      Like ``G_MAG_SB22`` but measured within ``RADIUS_SB22.5``.
``R_MAG_SB22.5``     float32      AB mag                                      Like ``R_MAG_SB22`` but measured within ``RADIUS_SB22.5``.
``Z_MAG_SB22.5``     float32      AB mag                                      Like ``Z_MAG_SB22`` but measured within ``RADIUS_SB22.5``.
``G_MAG_SB23``       float32      AB mag                                      Like ``G_MAG_SB22`` but measured within ``RADIUS_SB23``.
``R_MAG_SB23``       float32      AB mag                                      Like ``R_MAG_SB22`` but measured within ``RADIUS_SB23``.
``Z_MAG_SB23``       float32      AB mag                                      Like ``Z_MAG_SB22`` but measured within ``RADIUS_SB23``.
``G_MAG_SB23.5``     float32      AB mag                                      Like ``G_MAG_SB22`` but measured within ``RADIUS_SB23.5``.
``R_MAG_SB23.5``     float32      AB mag                                      Like ``R_MAG_SB22`` but measured within ``RADIUS_SB23.5``.
``Z_MAG_SB23.5``     float32      AB mag                                      Like ``Z_MAG_SB22`` but measured within ``RADIUS_SB23.5``.
``G_MAG_SB24``       float32      AB mag                                      Like ``G_MAG_SB22`` but measured within ``RADIUS_SB24``.
``R_MAG_SB24``       float32      AB mag                                      Like ``R_MAG_SB22`` but measured within ``RADIUS_SB24``.
``Z_MAG_SB24``       float32      AB mag                                      Like ``Z_MAG_SB22`` but measured within ``RADIUS_SB24``.
``G_MAG_SB24.5``     float32      AB mag                                      Like ``G_MAG_SB22`` but measured within ``RADIUS_SB24.5``.
``R_MAG_SB24.5``     float32      AB mag                                      Like ``R_MAG_SB22`` but measured within ``RADIUS_SB24.5``.
``Z_MAG_SB24.5``     float32      AB mag                                      Like ``Z_MAG_SB22`` but measured within ``RADIUS_SB24.5``.
``G_MAG_SB25``       float32      AB mag                                      Like ``G_MAG_SB22`` but measured within ``RADIUS_SB25``.
``R_MAG_SB25``       float32      AB mag                                      Like ``R_MAG_SB22`` but measured within ``RADIUS_SB25``.
``Z_MAG_SB25``       float32      AB mag                                      Like ``Z_MAG_SB22`` but measured within ``RADIUS_SB25``.
``G_MAG_SB25.5``     float32      AB mag                                      Like ``G_MAG_SB22`` but measured within ``RADIUS_SB25.5``.
``R_MAG_SB25.5``     float32      AB mag                                      Like ``R_MAG_SB22`` but measured within ``RADIUS_SB25.5``.
``Z_MAG_SB25.5``     float32      AB mag                                      Like ``Z_MAG_SB22`` but measured within ``RADIUS_SB25.5``.
``G_MAG_SB26``       float32      AB mag                                      Like ``G_MAG_SB22`` but measured within ``RADIUS_SB26``.
``R_MAG_SB26``       float32      AB mag                                      Like ``R_MAG_SB22`` but measured within ``RADIUS_SB26``.
``Z_MAG_SB26``       float32      AB mag                                      Like ``Z_MAG_SB22`` but measured within ``RADIUS_SB26``.
``G_MAG_TOT``        float32      AB mag                                      Estimate of the total, integrated *g*-band magnitude based on a fit to the *g*-band curve of growth (-1 if not measured). *May be very incorrect depending on the quality of the fit; use with caution!*
``R_MAG_TOT``        float32      AB mag                                      Like ``G_MAG_TOT`` but in the *r*-band.
``Z_MAG_TOT``        float32      AB mag                                      Like ``G_MAG_TOT`` but in the *z*-band.
==================== ============ =========================================== ===============================================

SGA-TRACTOR
~~~~~~~~~~~

This binary table is row-matched to the `SGA`_ table in the preceding HDU and
contains all the columns documented in `DR9 Tractor catalogs`_ documentation,
supplemented (for convenience) with ``SGA_ID``. All sources in this table have
``REF_CAT=="L3"`` and ``REF_ID`` is identical to ``SGA_ID``, as described in the
`external catalogs documentation`_.

SGA-2020-leda.fits
------------------

====== ============ ======== ======================
Number EXTNAME      Type     Contents
====== ============ ======== ======================
HDU00  PRIMARY      IMAGE    Empty.
HDU01  SGA-LEDA_    BINTABLE Metadata based on the parent catalog.
====== ============ ======== ======================

SGA-LEDA
~~~~~~~~

==================== ============ =========================================== ===============================================
Name                 Type         Units                                       Description
==================== ============ =========================================== ===============================================
``SGA_ID``           int64                                                    Unique identifier.
``GALAXY``           char[29]                                                 Unique galaxy name.
``PGC``              int64                                                    Unique identifier from the `Principal Catalogue of Galaxies`_ (-1 if none or not known).
``SGA_RA``           float64      degree                                      Right ascension (J2000).
``SGA_DEC``          float64      degree                                      Declination (J2000).
``MORPHTYPE``        char[21]                                                 Visual morphological type from `Hyperleda`_ (if available).
``PA_LEDA``          float32      degree                                      Galaxy position angle, measured positive clockwise from North.
``D25_LEDA``         float32      arcmin                                      Approximate diameter at the :math:`25\ \mathrm{mag}/\mathrm{arcsec}^2` (optical) surface brightness isophote, from `Hyperleda`_.
``BA_LEDA``          float32                                                  Ratio of the semi-minor axis to the semi-major axis.
``Z_LEDA``           float32                                                  Heliocentric redshift from `HyperLeda`_. *Note: a missing value, represented with -1.0, does not imply that no redshift exists*.
``SB_D25_LEDA``      float32      Vega :math:`\mathrm{mag}/\mathrm{arcsec}^2` Mean surface brightness within ``D25_LEDA`` based on the brightness in ``MAG_LEDA``.
``MAG_LEDA``         float32      Vega mag                                    Approximate brightness (*Note: this magnitude estimate is heterogeneous in both bandpass and aperture but for most galaxies it is measured in the B-band within ``D25_LEDA``; use with care*.)
``BYHAND``           boolean                                                  Flag indicating that one or more quantities (``RA``, ``DEC``, ``D25_LEDA``, ``PA_LEDA``, ``BA_LEDA``, or ``MAG_LEDA`` were changed from their published `HyperLeda`_ values, generally based on visual inspection.) 
``REF``              char[13]                                                 Unique reference name indicating the original source of the object, as described in `Sample Selection`_: ``LEDA-20181114``, ``LGDWARFS``, ``RC3``, ``OpenNGC``, or ``DR8``.
``GROUP_ID``         int64                                                    Unique group number.
``GROUP_NAME``       char[35]                                                 Unique group name, constructed from the name of its largest member (based on ``D25_LEDA``) and the suffix ``_GROUP`` (e.g., ``PGC193199_GROUP``).
``GROUP_MULT``       int16                                                    Group multiplicity (i.e., number of group members from the parent sample).
``GROUP_PRIMARY``    boolean                                                  Flag indicating the primary (i.e., largest) group member.
``GROUP_RA``         float64      degree                                      Right ascencion of the group weighted by ``D25_LEDA``.
``GROUP_DEC``        float64      degree                                      Declination of the group weighted by ``D25_LEDA``.
``GROUP_DIAMETER``   float32      arcmin                                      Approximate group diameter. For groups with a single galaxy this quantity equals ``D25_LEDA``. For galaxies with multiple members, we estimate the diameter of the group as the maximum separation of all the pairs of group members (plus their ``D25_LEDA`` diameter).
``BRICKNAME``        char[8]                                                  Name of brick, encoding the brick sky position, e.g. "1126p222" is centered on RA=112.6, Dec=+22.2. 
``DROPBIT``          int32                                                    See `SGA Bitmasks`_ section.
==================== ============ =========================================== ===============================================

``Group Files``
---------------

This portion of the ``SGA`` pipeline produces the files documented in the
`Custom Mosaics & Ellipse-Fitting`_ section, above. Most of these files are
standard `legacypipe`_ data products, albeit with different names and with some
slightly different assumptions than the nominal DR9 processing; additional
information about these files can be found in the `DR9 files documentation`_

For each galaxy group in the ``SGA-2020`` (i.e., each row in `SGA-2020.fits`_)
we generate the set of files described in the `Images and Catalogs`_ section,
below. In addition, the `Ellipse-Fitting Results`_ section defines the data
model of the ellipse-fitting results for each individual galaxy in each group,
including, among many other quantities, the detailed surface-brightness profiles
for each galaxy.

All these files are organized into the sub-directory structure
``RASLICE/GROUP_NAME``, where ``GROUP_NAME`` is the name of the galaxy group and
``RASLICE`` (``000-359``) is the one-degree wide *slice* of the sky that the
object belongs to. E.g., in Python:

.. code-block:: python

   RASLICE = '{:06d}'.format(int(GROUP_RA*1000))[:3]
   
Images and Catalogs
~~~~~~~~~~~~~~~~~~~

============================================================================== ================================================
File                                                                           Description
============================================================================== ================================================
**DR9 Pipeline Catalogs**                                                      
``GROUP_NAME``-ccds-[north,south].fits                                         Input table of ``north`` or ``south`` `CCDs`_ used to generate the optical image stacks.  
``GROUP_NAME``-largegalaxy-blobs.fits.gz                                       Enumerated segmentation ("blob") image (see the `metrics`_ documentation); may be removed in future releases.
``GROUP_NAME``-largegalaxy-tractor.fits                                        `Tractor catalog`_ of all detected sources in the field.
**DR9 Pipeline Mosaics and Catalogs**                                          
``GROUP_NAME``-largegalaxy-maskbits.fits.fz                                    Image encoding the `DR9 bitmasks`_ contributing to each pixel (see also the `DR9 image stacks`_ documentation).
``GROUP_NAME``-largegalaxy-outlier-mask.fits.fz                                Image of pixels rejecting during outlier masking (see the `metrics`_ documentation); may be removed in future releases.
``GROUP_NAME``-depth-`[g,r,z]`.fits.fz                                         Image of the depth :math:`5\sigma` point-source depth at each pixel (see also the `DR9 image stacks`_ documentation).
``GROUP_NAME``-largegalaxy-psf-`[g,r,z]`.fits.fz                               Postage stamp of the inverse-variance weighted mean pixelized *grz* PSF at the center of the field (see the `PSF documentation`_ for more details). 
``GROUP_NAME``-largegalaxy-`[image,invvar,model]`-`[g,r,z]`.fits.fz            Inverse-variance weighted image, inverse variance image, and *Tractor* model image based on the input *grz* imaging (see the `DR9 image stacks`_ documentation for more details).
``GROUP_NAME``-largegalaxy-`[image,model,resid]`-grz.jpg                       JPEG visualization of the data, model, and residual *grz* mosaics.
``GROUP_NAME``-`[image,invvar]`-`[W1,W2,W3,W4]`.fits.fz                        Inverse-variance weighted image and inverse variance image based on the input *W1-W4* imaging (see the `DR9 image stacks`_ documentation for more details). *Note: there is no ``largegalaxy`` prefix because the data used to generate these files is independent of the SGA.*
``GROUP_NAME``-largegalaxy-model-`[W1,W2,W3,W4]`.fits.fz                       unWISE *Tractor* model *W1-W4* mosaic based on the forced photometry technique used in `DR9`_. *Note that the ``largegalaxy`` prefix is present because the Tractor models used to generate this image rely on assumptions made specifically for the SGA.*
``GROUP_NAME``-`[image,model`]-W1W2.jpg                                        JPEG visualization of the data and model *W1W2* mosaics.
**SGA Pipeline Files**                                                         
``GROUP_NAME``-largegalaxy-sample.fits                                         Catalog of (one or more) galaxies from `SGA-2020.fits`_ belonging to this group.
``GROUP_NAME``-largegalaxy-``SGA_ID``-ellipse.fits                             Table containing the ellipse-fitting results for the galaxy with ``SGA`` identification number ``ID``, using the data model from the table below
``GROUP_NAME``-coadds.log                                                      Logging output for the *coadds* stage of the pipeline; may be missing in some cases.
``GROUP_NAME``-ellipse.log                                                     Logging output for the *ellipse* stage of the pipeline; may be missing in some cases.
``GROUP_NAME``-largegalaxy-coadds.isdone                                       Zero-byte file indicating successful completion of the *coadds* stage of the pipeline.
``GROUP_NAME``-largegalaxy-ellipse.isdone                                      Zero-byte file indicating successful completion of the *ellipse* stage of the pipeline.
============================================================================== ================================================

|

Ellipse-Fitting Results
~~~~~~~~~~~~~~~~~~~~~~~

We generate a table.

..
 ====== ============ ======== ======================
 Number EXTNAME      Type     Contents
 ====== ============ ======== ======================
 HDU00  PRIMARY      IMAGE    Empty.
 HDU01  ELLIPSE      BINTABLE Ellipse-fitting results for a single galaxy.
 ====== ============ ======== ======================

================================================== ========== ============================================== ===============================================
Name                                               Type       Units                                          Description
================================================== ========== ============================================== ===============================================
``SGA_ID``                                         int64                                                     See `SGA-2020.fits`_.
``GALAXY``                                         char[?]                                                   See `SGA-2020.fits`_.
``RA``                                             float64    degree                                         See `SGA-2020.fits`_.
``DEC``                                            float64    degree                                         See `SGA-2020.fits`_.
``PGC``                                            int64                                                     See `SGA-2020.fits`_.
``PA_LEDA``                                        float32    degree                                         See `SGA-2020.fits`_.
``BA_LEDA``                                        float32                                                   See `SGA-2020.fits`_.
``D25_LEDA``                                       float32    arcmin                                         See `SGA-2020.fits`_.
``BANDS``                                          char[1][3]                                                List of bandpasses fitted (here, always `g,r,z`).
``REFBAND``                                        char[1]                                                   Reference band (here, always `r`).
``REFPIXSCALE``                                    float32    arcsec/pixel                                   Pixel scale in ``REFBAND``.
``SUCCESS``                                        boolean                                                   Flag indicating ellipse-fitting success or failure.
``FITGEOMETRY``                                    boolean                                                   Flag indicating whether the ellipse geometry was allowed to vary with semi-major axis (here, always ``False``).
``INPUT_ELLIPSE``                                  boolean                                                   Flag indicating whether ellipse parameters were passed from an external file (here, always ``False``).
``LARGESHIFT``                                     boolean                                                   Flag indicating that the light-weighted center (from the ``ellipse moments``) is different from the *Tractor* position by more than 10 pixels in either dimension.
``RA_X0``                                          float64    degree                                         Right ascension (J2000) at pixel position ``X0``.
``DEC_Y0``                                         float64    degree                                         Declination (J2000) at pixel position ``Y0``.
``X0``                                             float32    pixel                                          Light-weighted position along the *x*-axis (from ``ellipse moments``).
``Y0``                                             float32    pixel                                          Light-weighted position along the *y*-axis (from ``ellipse moments``).
``EPS``                                            float32                                                   Ellipticity :math:`e=1-b/a`, where :math:`b/a` is the semi-minor to semi-major axis ratio from ``ellipse moments``.
``PA``                                             float32    degree                                         Position angle (astronomical convention, measured clockwise from North; from ``ellipse moments``).
``THETA``                                          float32    degree                                         Position angle (physics convention, measured clockwise from the *x*-axis, given by [:math:`(270-PA)` mod 180] from ``ellipse moments``).
``MAJORAXIS``                                      float32    pixel                                          Light-weighted length of the semi-major axis (from ``ellipse moments``).
``MAXSMA``                                         float32    pixel                                          Maximum semi-major axis length used for the ellipse-fitting and curve-of-growth measurements (typically taken to be :math:`2\times` ``MAJORAXIS``).
``INTEGRMODE``                                     char[6]                                                   `photutils.isophote.Ellipse.fit_image`_ integration mode (here, always *median*).
``SCLIP``                                          int16                                                     `photutils.isophote.Ellipse.fit_image`_ sigma-clipping (here, always *3*).
``NCLIP``                                          int16                                                     Number of `photutils.isophote.Ellipse.fit_image`_ sigma-clipping iterations (here, always *3*).
``PSFSIZE_[G,R,Z]``                                float32    arcsec                                         Mean width of the point-spread function over the full mosaic (derived from the ``PSFSIZE_[G,R,Z]`` columns in the `Tractor catalogs`_).
``PSFDEPTH_[G,R,Z]``                               float32    mag                                            Mean :math:`5\hbox{-}\sigma` depth over the full mosaic (derived from the ``PSFDEPTH_[G,R,Z]`` columns in the `Tractor catalogs`_).
``MW_TRANSMISSION_[G,R,Z]``                        float32                                                   Galactic transmission fraction (taken from the corresponding `Tractor catalog`_ at the central coordinates of the galaxy).
``REFBAND_WIDTH``                                  float32    pixel                                          Width of the optical mosaics in ``REFBAND``.
``REFBAND_HEIGHT``                                 float32    pixel                                          Height of the optical mosaics in ``REFBAND`` (always equal to ``REFBAND_WIDTH``).
``[G,R,Z]_SMA``                                    float32[N] pixel
``[G,R,Z]_EPS``                                    float32[N]
``[G,R,Z]_EPS_ERR``                                float32[N]
``[G,R,Z]_PA``                                     float32[N] degree
``[G,R,Z]_PA_ERR``                                 float32[N] degree
``[G,R,Z]_INTENS``                                 float32[N] :math:`\mathrm{nanomaggies}/\mathrm{arcsec}^2`
``[G,R,Z]_INTENS_ERR``                             float32[N] :math:`\mathrm{nanomaggies}/\mathrm{arcsec}^2`
``[G,R,Z]_X0``                                     float32[N] pixel
``[G,R,Z]_X0_ERR``                                 float32[N] pixel
``[G,R,Z]_Y0``                                     float32[N] pixel
``[G,R,Z]_Y0_ERR``                                 float32[N] pixel
``[G,R,Z]_A3``                                     float32[N]
``[G,R,Z]_A3_ERR``                                 float32[N]
``[G,R,Z]_A4``                                     float32[N]
``[G,R,Z]_A4_ERR``                                 float32[N]
``[G,R,Z]_RMS``                                    float32[N] :math:`\mathrm{nanomaggies}/\mathrm{arcsec}^2`
``[G,R,Z]_PIX_STDDEV``                             float32[N] :math:`\mathrm{nanomaggies}/\mathrm{arcsec}^2`
``[G,R,Z]_STOP_CODE``                              int16[N]
``[G,R,Z]_NDATA``                                  int16[N]
``[G,R,Z]_NFLAG``                                  int16[N]
``[G,R,Z]_NITER``                                  int16[N]
``[G,R,Z]_COG_SMA``                                float32[M] pixel
``[G,R,Z]_COG_MAG``                                float32[M] mag
``[G,R,Z]_COG_MAGERR``                             float32[M] mag
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

``SGA Bitmasks``
================

.. 
 ELLIPSEBITS = dict(
     largeshift = 2**0,      # >10-pixel shift in the flux-weighted center
     rex_toosmall = 2**1,    # type == REX & shape_r < 5
     notrex_toosmall = 2**2, # type != REX & shape_r < 2
     failed = 2**3,          # ellipse-fitting failed
     notfit = 2**4,          # not ellipse-fit
     indropcat = 2**5,       # in the dropcat catalog
     )

Bit indicating why this object could not be included in the `SGA-2020.fits`_
catalog: `0`: not fitted (i.e., no Tractor catalog); `1`: missing *grz*
coverage; `2`: galaxy center is fully masked (e.g., due to a bleed trail); `3`:
dropped by Tractor during fitting, indicating either a spurious object or an
irrecoverable problem with the fitting; `4`: fitted as a point source by
Tractor; `5`: problematic ellipse-fitting; `6`: negative *r*-band flux. E.g., in
Python, the expression (``DROPBIT & 2**1 != 0``) would return an index array of
all the objects without *grz* coverage.

Bit indicating why this object could not be included in the `SGA-2020.fits`_
catalog: `0`: not fitted (i.e., no Tractor catalog); `1`: missing *grz*
coverage; `2`: galaxy center is fully masked (e.g., due to a bleed trail); `3`:
dropped by Tractor during fitting, indicating either a spurious object or an
irrecoverable problem with the fitting; `4`: fitted as a point source
(type=``PSF``) by Tractor; `5`: problematic ellipse-fitting; `6`: negative
*r*-band flux. E.g., in Python, the expression (``ELLIPSEBIT \& 2^1 != 0``)
would return all the objects without *grz* coverage.

``Known Issues``
================

Some known issues include:

* Talk about the largest galaxies that were not ellipse-fit, including NGC0598.


``Future Plans``
================

* Infrared surface-brightness profiles in ``W1-W4``.


``Acknowledgements``
====================

Write me.

.. _`Data Access`: https://sga.legacysurvey.org
.. _`SGA web-portal`: https://sga.legacysurvey.org
.. _`DESI Legacy Imaging Surveys DR9`: ../../dr9
.. _`DR9`: ../../dr9
.. _`unWISE`: http://unwise.me
.. _`Dark Energy Spectroscopic Instrument (DESI)`: http://desi.lbl.gov
.. _`DESI`: http://desi.lbl.gov
.. _`HyperLeda`: http://leda.univ-lyon1.fr/
.. _`HyperLeda extragalactic database`: http://leda.univ-lyon1.fr/
.. _`Third Reference Catalog of Bright Galaxies (RC3)`: https://vizier.u-strasbg.fr/viz-bin/VizieR?-source=VII/155
.. _`RC3`: https://vizier.u-strasbg.fr/viz-bin/VizieR?-source=VII/155
.. _`NASA Extragalactic Database (NED)`: https://ned.ipac.caltech.edu
.. _`McConnachie (2012)`: https://ui.adsabs.harvard.edu/abs/2012AJ....144....4M/abstract
.. _`OpenNGC`: https://github.com/mattiaverga/OpenNGC
.. _`DR8`: ../../dr8
.. _`this notebook`: https://github.com/legacysurvey/legacypipe/blob/master/doc/nb/lslga-from-gaia.ipynb
.. _`Principal Catalogue of Galaxies`: https://ui.adsabs.harvard.edu/abs/1989A%26AS...80..299P/abstract
.. _`DR9 Tractor catalogs`: ../catalogs
.. _`external catalogs documentation`: ../../external/#sga-large-galaxies
.. _`DR9 files documentation`: ../files
.. _`legacypipe`: https://github.com/legacysurvey/legacypipe
.. _`CCDs`: ../files/#survey-ccds-camera-dr9-fits-gz
.. _`metrics`: ../files/#other-files
.. _`DR9 image stacks`: ../files/#image-stacks-region-coadd
.. _`DR9 bitmasks`: ../bitmasks
.. _`Tractor catalog`: ../catalogs
.. _`Tractor catalogs`: ../catalogs
.. _`PSF documentation`: ../description/#psf
.. _`astropy`: https://docs.astropy.org/en/stable 
.. _`photutils`: https://photutils.readthedocs.io/en/stable/isophote.html
.. _`photutils.isophote.Ellipse.fit_image`: https://photutils.readthedocs.io/en/stable/api/photutils.isophote.Ellipse.html#photutils.isophote.Ellipse.fit_image 
.. _`astropy.QTable`: https://docs.astropy.org/en/stable/api/astropy.table.QTable.html#astropy.table.QTable
.. _`Michele Cappellari's mge.find_galaxy`: https://www-astro.physics.ox.ac.uk/~mxc/software/#mge
.. _`photutils.aperture`: https://photutils.readthedocs.io/en/stable/aperture.html
.. _`Observational Astronomy by Birney, Gonzalez, & Oesper`: https://www.cambridge.org/core/books/observational-astronomy/98B4694421AEB3953FE088D19BA0495C
