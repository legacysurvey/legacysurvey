.. title: Full Documentation Coming Soon! - The Siena Galaxy Atlas
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

The table below documents the data model of the current version of the SGA parent sample.

.. _`/global/cfs/cdirs/cosmo/data/legacysurvey/dr9/XXX`: https://portal.nersc.gov/cfs/cosmo/data/legacysurvey/dr9/sga/XXX
.. _`McConnachie (2012)`: https://ui.adsabs.harvard.edu/abs/2012AJ....144....4M/abstract
.. _`DR8 of the Legacy Surveys`: ../../dr8
.. _`DR9 of the Legacy Surveys`: ../../dr9
.. _`globular cluster sample`: ../../external/#globular-clusters-planetary-nebulae
.. _`RC3`: https://vizier.u-strasbg.fr/viz-bin/VizieR?-source=VII/155
.. _`OpenNGC`: https://github.com/mattiaverga/OpenNGC
.. _`this notebook`: https://github.com/legacysurvey/legacypipe/blob/master/doc/nb/lslga-from-gaia.ipynb
.. _`HyperLeda`: http://leda.univ-lyon1.fr/
.. _`Tractor catalogs`: ../catalogs
.. _`Tractor catalog`: ../catalogs

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


Additional products are available on the `DR9 files page`_:

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
``GROUP_NAME``-largegalaxy-``ID``-ellipse.fits                       Table containing the ellipse-fitting results for the galaxy with ``SGA`` identification number ``ID``, using the data model from the table below
``GROUP_NAME``-ellipse.log                                           Logging output for this portion of the pipeline
``GROUP_NAME``-largegalaxy-ellipse.[``isdone``, ``isfail``]          Zero-byte file indicating whether this portion of the pipeline completed successfully (``isdone``) or failed (``isfail``)
==================================================================== ================================================

.. _`DR9 files page`: ../files/#large-galaxy-files-largegalaxies-aaa-galname
.. _`photutils.isophote.Ellipse.fit_image`: https://photutils.readthedocs.io/en/stable/api/photutils.isophote.Ellipse.html#photutils.isophote.Ellipse.fit_image
.. _`photutils.aperture`: https://photutils.readthedocs.io/en/stable/aperture.html
.. _`Observational Astronomy by Birney, Gonzalez, & Oesper`: https://www.cambridge.org/highereducation/books/observational-astronomy/98B4694421AEB3953FE088D19BA0495C
.. _`astropy.QTable`: https://docs.astropy.org/en/stable/api/astropy.table.QTable.html#astropy.table.QTable


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
