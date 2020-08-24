.. title: Tractor Catalog Format
.. slug: catalogs
.. tags: mathjax
.. description:

.. |chi|      unicode:: U+003C7 .. GREEK SMALL LETTER CHI
.. |sup2|   unicode:: U+000B2 .. SUPERSCRIPT TWO
.. |epsilon|  unicode:: U+003B5 .. GREEK SMALL LETTER EPSILON
.. |phi|      unicode:: U+003D5 .. GREEK PHI SYMBOL
.. |deg|    unicode:: U+000B0 .. DEGREE SIGN
.. |Prime|    unicode:: U+02033 .. DOUBLE PRIME

.. class:: pull-right well

.. contents::


<camera>/tractor/<AAA>/tractor-<brick>.fits
-------------------------------------------

FITS binary table containing Tractor photometry. Before using these catalogs, note that there may be
`known issues`_ regarding their content and derivation. Note that all flux-based quantities in the
catalogs are on the AB system (we specify that WISE fluxes are AB in the table for clarity, as
such quantities are often quoted on the Vega system).

.. _`known issues`: ../issues
.. _`as documented here`: ../../release
.. _`BASS`: ../../bass
.. _`DECaLS`: ../../decamls
.. _`MzLS`: ../../mzls
.. _`DR9 bitmasks page`: ../bitmasks
.. _`SGA`: ../sga

===================================== ============ ===================== ===============================================
Name                                  Type         Units                 Description
===================================== ============ ===================== ===============================================
``release``		              int16	 		         Unique integer denoting the camera and filter set used (`as documented here`_)
``brickid``                           int32                              Brick ID [1,662174]
``brickname``                         char[8]                            Name of brick, encoding the brick sky position, eg "1126p222" near RA=112.6, Dec=+22.2
``objid``                             int32                              Catalog object number within this brick; a unique identifier hash is ``release,brickid,objid``;  ``objid`` spans [0,N-1] and is contiguously enumerated within each brick
``brick_primary``                     boolean                            ``True`` if the object is within the brick boundary
``maskbits``                          int16                              Bitwise mask indicating that an object touches a pixel in the ``coadd/*/*/*maskbits*`` maps, as cataloged on the `DR9 bitmasks page`_
``fitbits``                           int16                              Bitwise mask detailing pecularities of how an object was fit, as cataloged on the `DR9 bitmasks page`_
``type``                              char[3]                            Morphological model: "PSF"=stellar, "REX"="round exponential galaxy", "DEV"=deVauc, "EXP"=exponential, "SER"=Sersic, "DUP"=Gaia source fit by different model.
``ra``                                float64      deg                   Right ascension at equinox J2000
``dec``                               float64      deg                   Declination at equinox J2000
``ra_ivar``                           float32      1/deg\ |sup2|         Inverse variance of RA (no cosine term!), excluding astrometric calibration errors
``dec_ivar``                          float32      1/deg\ |sup2|         Inverse variance of DEC, excluding astrometric calibration errors
``bx``                                float32      pix                   X position (0-indexed) of coordinates in the brick image stack (*i.e.* in the *e.g.* `legacysurvey-<brick>-image-g.fits.fz` `coadd file`_)
``by``                                float32      pix                   Y position (0-indexed) of coordinates in brick image stack
``dchisq``                            float32[5]                         Difference in |chi|\ |sup2| between successively more-complex model fits: PSF, REX, DEV, EXP, SER.  The difference is versus no source.
``ebv``                               float32      mag                   Galactic extinction E(B-V) reddening from `SFD98`_, used to compute the ``mw_transmission_`` columns
``mjd_min``		              float64	   days                  Minimum Modified Julian Date of observations used to construct the model of this object
``mjd_max``		              float64      days                  Maximum Modified Julian Date of observations used to construct the model of this object
``ref_cat``                           char[2]                            Reference catalog source for this star: "T2" for `Tycho-2`_, "G2" for `Gaia`_ DR2, "L3" for the `SGA`_, empty otherwise
``ref_id``                            int64                              Reference catalog identifier for this star; Tyc1*1,000,000+Tyc2*10+Tyc3 for Tycho2; "sourceid" for `Gaia`_ DR2 and `SGA`_
``pmra``                              float32      mas/yr                Reference catalog proper motion in the RA direction
``pmdec``                             float32      mas/yr                Reference catalog proper motion in the Dec direction
``parallax``                          float32      mas                   Reference catalog parallax
``pmra_ivar``                         float32      1/(mas/yr)\ |sup2|    Reference catalog inverse-variance on ``pmra``
``pmdec_ivar``                        float32      1/(mas/yr)\ |sup2|    Reference catalog inverse-variance on ``pmdec``
``parallax_ivar``                     float32      1/(mas)\ |sup2|       Reference catalog inverse-variance on ``parallax``
``ref_epoch``                         float32      yr                    Reference catalog reference epoch (eg, 2015.5 for `Gaia`_ DR2)
``gaia_phot_g_mean_mag``              float32      mag                   `Gaia`_ G band mag
``gaia_phot_g_mean_flux_over_error``  float32                            `Gaia`_ G band signal-to-noise
``gaia_phot_g_n_obs``                 int16                              `Gaia`_ G band number of observations
``gaia_phot_bp_mean_mag``             float32      mag                   `Gaia`_ BP mag
``gaia_phot_bp_mean_flux_over_error`` float32                            `Gaia`_ BP signal-to-noise
``gaia_phot_bp_n_obs``                int16                              `Gaia`_ BP number of observations
``gaia_phot_rp_mean_mag``             float32      mag                   `Gaia`_ RP mag
``gaia_phot_rp_mean_flux_over_error`` float32                            `Gaia`_ RP signal-to-noise
``gaia_phot_rp_n_obs``                int16                              `Gaia`_ RP number of observations
``gaia_phot_variable_flag``           bool                               `Gaia`_ photometric variable flag
``gaia_astrometric_excess_noise``     float32                            `Gaia`_ astrometric excess noise
``gaia_astrometric_excess_noise_sig`` float32                            `Gaia`_ astrometric excess noise uncertainty
``gaia_astrometric_n_obs_al``         int16                              `Gaia`_ number of astrometric observations along scan direction
``gaia_astrometric_n_good_obs_al``    int16                              `Gaia`_ number of good astrometric observations along scan direction
``gaia_astrometric_weight_al``        float32                            `Gaia`_ astrometric weight along scan direction
``gaia_duplicated_source``            bool                               `Gaia`_ duplicated source flag
``gaia_a_g_val``		      float32	   magnitudes		 `Gaia`_ line-of-sight extinction in the G band
``gaia_e_bp_min_rp_val``	      float32	   magnitudes		 `Gaia`_ line-of-sight reddening E(BP-RP)
``gaia_phot_bp_rp_excess_factor``     float32	   			 `Gaia`_ BP/RP excess factor
``gaia_astrometric_sigma5d_max``      float32	   mas			 `Gaia`_ longest semi-major axis of the 5-d error ellipsoid
``gaia_astrometric_params_solved``    uint8				 which astrometric parameters were estimated for a `Gaia`_ source
``flux_g``		              float32      nanomaggies           model flux in :math:`g`
``flux_r``		              float32      nanomaggies           model flux in :math:`r`
``flux_z``		              float32      nanomaggies           model flux in :math:`z`
``flux_w1``                           float32      nanomaggies           WISE model flux in :math:`W1` (AB system)
``flux_w2``                           float32      nanomaggies           WISE model flux in :math:`W2` (AB)
``flux_w3``                           float32      nanomaggies           WISE model flux in :math:`W3` (AB)
``flux_w4``                           float32      nanomaggies           WISE model flux in :math:`W4` (AB)
``flux_ivar_g``		              float32      1/nanomaggies\ |sup2| Inverse variance of ``flux_g``
``flux_ivar_r``		              float32      1/nanomaggies\ |sup2| Inverse variance of ``flux_r``
``flux_ivar_z``		              float32      1/nanomaggies\ |sup2| Inverse variance of ``flux_z``
``flux_ivar_w1``                      float32      1/nanomaggies\ |sup2| Inverse variance of ``flux_w1`` (AB system)
``flux_ivar_w2``                      float32      1/nanomaggies\ |sup2| Inverse variance of ``flux_w2`` (AB)
``flux_ivar_w3``                      float32      1/nanomaggies\ |sup2| Inverse variance of ``flux_w3`` (AB)
``flux_ivar_w4``                      float32      1/nanomaggies\ |sup2| Inverse variance of ``flux_w4`` (AB)
``fiberflux_g``                       float32      nanomaggies           Predicted :math:`g`-band flux within a fiber of diameter 1.5 arcsec from this object in 1 arcsec Gaussian seeing
``fiberflux_r``                       float32      nanomaggies           Predicted :math:`r`-band flux within a fiber of diameter 1.5 arcsec from this object in 1 arcsec Gaussian seeing
``fiberflux_z``                       float32      nanomaggies           Predicted :math:`z`-band flux within a fiber of diameter 1.5 arcsec from this object in 1 arcsec Gaussian seeing
``fibertotflux_g``                    float32      nanomaggies           Predicted :math:`g`-band flux within a fiber of diameter 1.5 arcsec from all sources at this location in 1 arcsec Gaussian seeing
``fibertotflux_r``                    float32      nanomaggies           Predicted :math:`r`-band flux within a fiber of diameter 1.5 arcsec from all sources at this location in 1 arcsec Gaussian seeing
``fibertotflux_z``                    float32      nanomaggies           Predicted :math:`z`-band flux within a fiber of diameter 1.5 arcsec from all sources at this location in 1 arcsec Gaussian seeing
``apflux_g``		              float32[8]   nanomaggies           Aperture fluxes on the co-added images in apertures of radius [0.5, 0.75, 1.0, 1.5, 2.0, 3.5, 5.0, 7.0] arcsec in :math:`g`, masked by :math:`invvar=0` (inverse variance of zero [#]_)
``apflux_r``		              float32[8]   nanomaggies           Aperture fluxes on the co-added images in apertures of radius [0.5, 0.75, 1.0, 1.5, 2.0, 3.5, 5.0, 7.0] arcsec in :math:`r`, masked by :math:`invvar=0`
``apflux_z``    	              float32[8]   nanomaggies	         Aperture fluxes on the co-added images in apertures of radius [0.5, 0.75, 1.0, 1.5, 2.0, 3.5, 5.0, 7.0] arcsec in :math:`z`, masked by :math:`invvar=0`
``apflux_resid_g``                    float32[8]   nanomaggies           Aperture fluxes on the co-added residual images in :math:`g`, masked by :math:`invvar=0`
``apflux_resid_r``                    float32[8]   nanomaggies           Aperture fluxes on the co-added residual images in :math:`r`, masked by :math:`invvar=0`
``apflux_resid_z``                    float32[8]   nanomaggies           Aperture fluxes on the co-added residual images in :math:`z`, masked by :math:`invvar=0`
``apflux_blobresid_g``                float32[8]   nanomaggies           Aperture fluxes on :math:`image-blobmodel` residual maps in :math:`g` [#]_, masked by :math:`invvar=0`
``apflux_blobresid_r``                float32[8]   nanomaggies           Aperture fluxes on :math:`image-blobmodel` residual maps in :math:`r`, masked by :math:`invvar=0`
``apflux_blobresid_z``                float32[8]   nanomaggies           Aperture fluxes on :math:`image-blobmodel` residual maps in :math:`z`, masked by :math:`invvar=0`
``apflux_ivar_g``                     float32[8]   1/nanomaggies\ |sup2| Inverse variance of ``apflux_resid_g``, masked by :math:`invvar=0`
``apflux_ivar_r``                     float32[8]   1/nanomaggies\ |sup2| Inverse variance of ``apflux_resid_r``, masked by :math:`invvar=0`
``apflux_ivar_z``                     float32[8]   1/nanomaggies\ |sup2| Inverse variance of ``apflux_resid_z``, masked by :math:`invvar=0`
``apflux_masked_g``                   float32[8]                         Fraction of pixels masked in :math:`g`-band aperture flux measurements; 1 means fully masked (ie, fully ignored; contributing zero to the measurement)
``apflux_masked_r``                   float32[8]                         Fraction of pixels masked in :math:`r`-band aperture flux measurements; 1 means fully masked (ie, fully ignored; contributing zero to the measurement)
``apflux_masked_z``                   float32[8]                         Fraction of pixels masked in :math:`z`-band aperture flux measurements; 1 means fully masked (ie, fully ignored; contributing zero to the measurement)
``apflux_w1``		              float32[5]   nanomaggies           Aperture fluxes on the co-added images in apertures of radius [3, 5, 7, 9, 11] [#]_ arcsec in :math:`W1`, masked by :math:`invvar=0`
``apflux_w2``		              float32[5]   nanomaggies           Aperture fluxes on the co-added images in apertures of radius [3, 5, 7, 9, 11] arcsec in :math:`W2`, masked by :math:`invvar=0`
``apflux_w3``    	              float32[5]   nanomaggies	         Aperture fluxes on the co-added images in apertures of radius [3, 5, 7, 9, 11] arcsec in :math:`W3`, masked by :math:`invvar=0`
``apflux_w4``    	              float32[5]   nanomaggies	         Aperture fluxes on the co-added images in apertures of radius [3, 5, 7, 9, 11] arcsec in :math:`W4`, masked by :math:`invvar=0`
``apflux_resid_w1``		      float32[5]   nanomaggies           Aperture fluxes on the co-added residual images in :math:`W1`, masked by :math:`invvar=0`
``apflux_resid_w2``		      float32[5]   nanomaggies           Aperture fluxes on the co-added residual images in :math:`W2`, masked by :math:`invvar=0`
``apflux_resid_w3``    	              float32[5]   nanomaggies	         Aperture fluxes on the co-added residual images in :math:`W3`, masked by :math:`invvar=0`
``apflux_resid_w4``    	              float32[5]   nanomaggies	         Aperture fluxes on the co-added residual images in :math:`W4`, masked by :math:`invvar=0`
``apflux_ivar_w1``		      float32[5]   1/nanomaggies\ |sup2| Inverse variance of ``apflux_resid_w1``, masked by :math:`invvar=0`
``apflux_ivar_w2``		      float32[5]   1/nanomaggies\ |sup2| Inverse variance of ``apflux_resid_w2``, masked by :math:`invvar=0`
``apflux_ivar_w3``		      float32[5]   1/nanomaggies\ |sup2| Inverse variance of ``apflux_resid_w3``, masked by :math:`invvar=0`
``apflux_ivar_w4``		      float32[5]   1/nanomaggies\ |sup2| Inverse variance of ``apflux_resid_w4``, masked by :math:`invvar=0`
``mw_transmission_g``	              float32                            Galactic transmission in :math:`g` filter in linear units [0, 1]
``mw_transmission_r``	              float32                            Galactic transmission in :math:`r` filter in linear units [0, 1]
``mw_transmission_z``	              float32                            Galactic transmission in :math:`z` filter in linear units [0, 1]
``mw_transmission_w1``	              float32                            Galactic transmission in :math:`W1` filter in linear units [0, 1]
``mw_transmission_w2``	              float32                            Galactic transmission in :math:`W2` filter in linear units [0, 1]
``mw_transmission_w3``	              float32                            Galactic transmission in :math:`W3` filter in linear units [0, 1]
``mw_transmission_w4``	              float32                            Galactic transmission in :math:`W4` filter in linear units [0, 1]
``nobs_g``                            int16                              Number of images that contribute to the central pixel in :math:`g`: filter for this object (not profile-weighted)
``nobs_r``                            int16                              Number of images that contribute to the central pixel in :math:`r`: filter for this object (not profile-weighted)
``nobs_z``                            int16                              Number of images that contribute to the central pixel in :math:`z`: filter for this object (not profile-weighted)
``nobs_w1``                           int16                              Number of images that contribute to the central pixel in :math:`W1`: filter for this object (not profile-weighted)
``nobs_w2``                           int16                              Number of images that contribute to the central pixel in :math:`W2`: filter for this object (not profile-weighted)
``nobs_w3``                           int16                              Number of images that contribute to the central pixel in :math:`W3`: filter for this object (not profile-weighted)
``nobs_w4``                           int16                              Number of images that contribute to the central pixel in :math:`W4`: filter for this object (not profile-weighted)
``rchisq_g``                          float32                            Profile-weighted |chi|\ |sup2| of model fit normalized by the number of pixels in :math:`g`
``rchisq_r``                          float32                            Profile-weighted |chi|\ |sup2| of model fit normalized by the number of pixels in :math:`r`
``rchisq_z``                          float32                            Profile-weighted |chi|\ |sup2| of model fit normalized by the number of pixels in :math:`z`
``rchisq_w1``                         float32                            Profile-weighted |chi|\ |sup2| of model fit normalized by the number of pixels in :math:`W1`
``rchisq_w2``                         float32                            Profile-weighted |chi|\ |sup2| of model fit normalized by the number of pixels in :math:`W2`
``rchisq_w3``                         float32                            Profile-weighted |chi|\ |sup2| of model fit normalized by the number of pixels in :math:`W3`
``rchisq_w4``                         float32                            Profile-weighted |chi|\ |sup2| of model fit normalized by the number of pixels in :math:`W4`
``fracflux_g``                        float32                            Profile-weighted fraction of the flux from other sources divided by the total flux in :math:`g` (typically [0,1])
``fracflux_r``                        float32                            Profile-weighted fraction of the flux from other sources divided by the total flux in :math:`r` (typically [0,1])
``fracflux_z``                        float32                            Profile-weighted fraction of the flux from other sources divided by the total flux in :math:`z` (typically [0,1])
``fracflux_w1``                       float32                            Profile-weighted fraction of the flux from other sources divided by the total flux in :math:`W1` (typically [0,1])
``fracflux_w2``                       float32                            Profile-weighted fraction of the flux from other sources divided by the total flux in :math:`W2` (typically [0,1])
``fracflux_w3``                       float32                            Profile-weighted fraction of the flux from other sources divided by the total flux in :math:`W3` (typically [0,1])
``fracflux_w4``                       float32                            Profile-weighted fraction of the flux from other sources divided by the total flux in :math:`W4` (typically [0,1])
``fracmasked_g``                      float32                            Profile-weighted fraction of pixels masked from all observations of this object in :math:`g`, strictly between [0,1]
``fracmasked_r``                      float32                            Profile-weighted fraction of pixels masked from all observations of this object in :math:`r`, strictly between [0,1]
``fracmasked_z``                      float32                            Profile-weighted fraction of pixels masked from all observations of this object in :math:`z`, strictly between [0,1]
``fracin_g``                          float32                            Fraction of a source's flux within the blob in :math:`g`, near unity for real sources
``fracin_r``                          float32                            Fraction of a source's flux within the blob in :math:`r`, near unity for real sources
``fracin_z``                          float32                            Fraction of a source's flux within the blob in :math:`z`, near unity for real sources
``anymask_g``                         int16                              Bitwise mask set if the central pixel from any image satisfies each condition in :math:`g` as cataloged on the `DR9 bitmasks page`_
``anymask_r``                         int16                              Bitwise mask set if the central pixel from any image satisfies each condition in :math:`r` as cataloged on the `DR9 bitmasks page`_
``anymask_z``                         int16                              Bitwise mask set if the central pixel from any image satisfies each condition in :math:`z` as cataloged on the `DR9 bitmasks page`_
``allmask_g``                         int16                              Bitwise mask set if the central pixel from all images satisfy each condition in :math:`g` as cataloged on the `DR9 bitmasks page`_
``allmask_r``                         int16                              Bitwise mask set if the central pixel from all images satisfy each condition in :math:`r` as cataloged on the `DR9 bitmasks page`_
``allmask_z``                         int16                              Bitwise mask set if the central pixel from all images satisfy each condition in :math:`z` as cataloged on the `DR9 bitmasks page`_
``wisemask_w1``                       uint8                              W1 bitmask as cataloged on the `DR9 bitmasks page`_
``wisemask_w2``		              uint8                              W2 bitmask as cataloged on the `DR9 bitmasks page`_
``psfsize_g``                         float32      arcsec                Weighted average PSF FWHM in the :math:`g` band
``psfsize_r``                         float32      arcsec                Weighted average PSF FWHM in the :math:`r` band
``psfsize_z``                         float32      arcsec                Weighted average PSF FWHM in the :math:`z` band
``psfdepth_g``                        float32      1/nanomaggies\ |sup2| For a :math:`5\sigma` point source detection limit in :math:`g`, :math:`5/\sqrt(\mathrm{psfdepth\_g})` gives flux in nanomaggies and :math:`-2.5[\log_{10}(5 / \sqrt(\mathrm{psfdepth\_g})) - 9]` gives corresponding AB magnitude
``psfdepth_r``                        float32      1/nanomaggies\ |sup2| For a :math:`5\sigma` point source detection limit in :math:`g`, :math:`5/\sqrt(\mathrm{psfdepth\_r})` gives flux in nanomaggies and :math:`-2.5[\log_{10}(5 / \sqrt(\mathrm{psfdepth\_r})) - 9]` gives corresponding AB magnitude
``psfdepth_z``                        float32      1/nanomaggies\ |sup2| For a :math:`5\sigma` point source detection limit in :math:`g`, :math:`5/\sqrt(\mathrm{psfdepth\_z})` gives flux in nanomaggies and :math:`-2.5[\log_{10}(5 / \sqrt(\mathrm{psfdepth\_z})) - 9]` gives corresponding AB magnitude
``galdepth_g``                        float32      1/nanomaggies\ |sup2| As for ``psfdepth_g`` but for a galaxy (0.45" exp, round) detection sensitivity
``galdepth_r``                        float32      1/nanomaggies\ |sup2| As for ``psfdepth_r`` but for a galaxy (0.45" exp, round) detection sensitivity
``galdepth_z``                        float32      1/nanomaggies\ |sup2| As for ``psfdepth_z`` but for a galaxy (0.45" exp, round) detection sensitivity
``nea_g``                             float32      arcsec\ |sup2|        Noise-equivalent area in :math:`g`. Can be used to predict the inverse variance of a source's flux from the pixel-level weight map via :math:`invvar \equiv 1/(σ_{\rm pix}^2 \times \mathtt{nea})`
``nea_r``                             float32      arcsec\ |sup2|        Noise-equivalent area in :math:`r`.
``nea_z``                             float32      arcsec\ |sup2|        Noise-equivalent area in :math:`z`.
``blob_nea_g``                        float32      arcsec\ |sup2|     	 Blob-masked noise-equivalent area in :math:`g`.
``blob_nea_r``                        float32      arcsec\ |sup2|     	 Blob-masked noise-equivalent area in :math:`r`.
``blob_nea_z``                        float32      arcsec\ |sup2|     	 Blob-masked noise-equivalent area in :math:`z`.
``psfdepth_w1``			      float32	   1/nanomaggies\ |sup2| As for ``psfdepth_g`` (and also on the AB system) but for WISE W1
``psfdepth_w2``			      float32	   1/nanomaggies\ |sup2| As for ``psfdepth_g`` (and also on the AB system) but for WISE W2
``psfdepth_w3``			      float32	   1/nanomaggies\ |sup2| As for ``psfdepth_g`` (and also on the AB system) but for WISE W3
``psfdepth_w4``			      float32	   1/nanomaggies\ |sup2| As for ``psfdepth_g`` (and also on the AB system) but for WISE W4
``wise_coadd_id``	              char[8]                            unWISE coadd brick name (corresponding to the, *e.g.*, `legacysurvey-<brick>-image-W1.fits.fz` `coadd file`_) for the center of each object
``wise_x``                            float32      pix                   X position of coordinates in the brick image stack that corresponds to ``wise_coadd_id`` (see the `DR9 updates page`_ for transformations between ``wise_x`` and ``bx``)
``wise_y``                            float32      pix                   Y position of coordinates in the brick image stack that corresponds to ``wise_coadd_id`` (see the `DR9 updates page`_ for transformations between ``wise_y`` and ``by``)
``lc_flux_w1``	     	              float32[15]  nanomaggies           ``flux_w1`` in each of up to fifteen unWISE coadd epochs (AB system; defaults to zero for unused entries)
``lc_flux_w2``                        float32[15]  nanomaggies           ``flux_w2`` in each of up to fifteen unWISE coadd epochs (AB; defaults to zero for unused entries)
``lc_flux_ivar_w1``	              float32[15]  1/nanomaggies\ |sup2| Inverse variance of ``lc_flux_w1`` (AB system; defaults to zero for unused entries)
``lc_flux_ivar_w2``	              float32[15]  1/nanomaggies\ |sup2| Inverse variance of ``lc_flux_w2`` (AB; defaults to zero for unused entries)
``lc_nobs_w1``		              int16[15]                          ``nobs_w1`` in each of up to fifteen unWISE coadd epochs
``lc_nobs_w2``		              int16[15]                          ``nobs_w2`` in each of up to fifteen unWISE coadd epochs
``lc_fracflux_w1``	              float32[15]                        ``fracflux_w1`` in each of up to fifteen unWISE coadd epochs (defaults to zero for unused entries)
``lc_fracflux_w2``	              float32[15]                        ``fracflux_w2`` in each of up to fifteen unWISE coadd epochs (defaults to zero for unused entries)
``lc_rchisq_w1``	              float32[15]                        ``rchisq_w1`` in each of up to fifteen unWISE coadd epochs (defaults to zero for unused entries)
``lc_rchisq_w2``	              float32[15]                        ``rchisq_w2`` in each of up to fifteen unWISE coadd epochs (defaults to zero for unused entries)
``lc_mjd_w1``		              float64[15]                        ``mjd_w1`` in each of up to fifteen unWISE coadd epochs (defaults to zero for unused entries)
``lc_mjd_w2``		              float64[15]                        ``mjd_w2`` in each of up to fifteen unWISE coadd epochs (defaults to zero for unused entries)
``lc_epoch_index_w1``                 int16[15]                          Index number of unWISE epoch for W1 (defaults to -1 for unused entries)
``lc_epoch_index_w2``                 int16[15]                          Index number of unWISE epoch for W2 (defaults to -1 for unused entries)
``sersic``		              float32                            Power-law index for the Sersic profile model (``type="SER"``)
``sersic_ivar``	                      float32                            Inverse variance of ``sersic``
``shape_r``		              float32      arcsec                Half-light radius of galaxy model for galaxy type ``type`` (>0)
``shape_r_ivar``	              float32      1/arcsec\ |sup2|      Inverse variance of ``shape_r``
``shape_e1``		              float32                            Ellipticity component 1 of galaxy model for galaxy type ``type``
``shape_e1_ivar``	              float32                            Inverse variance of ``shape_e1``
``shape_e2``		              float32                            Ellipticity component 2 of galaxy model for galaxy type ``type``
``shape_e2_ivar``	              float32                            Inverse variance of ``shape_e2``
===================================== ============ ===================== ===============================================

.. _`Gaia`: https://gea.esac.esa.int/archive/documentation//GDR2/Gaia_archive/chap_datamodel/sec_dm_main_tables/ssec_dm_gaia_source.html
.. _`Tycho-2`: https://heasarc.gsfc.nasa.gov/W3Browse/all/tycho2.html
.. _`coadd file`: ../files/#image-stacks-region-coadd
.. _`DR9 updates page`: ../updates/#data-model-changes

Goodness-of-Fits and Morphological ``type``
-------------------------------------------

The ``dchisq`` values represent the |chi|\ |sup2| sum of all pixels in the source's blob
for various models.  This 5-element vector contains the |chi|\ |sup2| difference between
the best-fit point source (type="PSF"), round exponential galaxy model ("REX"),
de Vaucouleurs model ("DEV"), exponential model ("EXP"), and a Sersic model ("SER"), in that order. Note that the Sersic model replaces the composite ("COMP") model used in `DR8`_ (and before).
The "REX" model is a round exponential galaxy profile with a variable radius
and is meant to capture slightly-extended but low signal-to-noise objects.
The ``dchisq`` values are the |chi|\ |sup2| difference versus no source in this location---that is, it is the improvement from adding the given source to our model of the sky.  The first element (for PSF) corresponds to a traditional notion of detection significance.
Note that the ``dchisq`` values are negated so that positive values indicate better fits.
We penalize models with negative flux in a band by subtracting rather than adding its |chi|\ |sup2| improvement in that band.

The ``rchisq`` values are interpreted as the reduced |chi|\ |sup2| pixel-weighted by the model fit,
computed as the following sum over pixels in the blob for each object:

.. math::
    \chi^2 = \frac{\sum \left[ \left(\mathrm{image} - \mathrm{model}\right)^2 \times \mathrm{model} \times \mathrm{inverse\, variance}\right]}{\sum \left[ \mathrm{model} \right]}

The above sum is over all images contributing to a particular filter, and can be negative-valued for sources 
that have a flux measured as negative in some bands where they are not detected.

The final, additional moropholigical type is "DUP." This type is set for Gaia sources that are coincident with, and so have been fit by, an extended source.
No optical flux is assigned to ``DUP`` sources, but they are retained to ensure that all Gaia sources appear in the catalogs even if Tractor prefers an alternate fit.

.. _`DR8`: ../../dr8/catalogs

Galactic Extinction Coefficients
--------------------------------

The Galactic extinction values are derived from the `SFD98`_ maps, but with updated coefficients to
convert E(B-V) to the extinction in each filter.  These are reported in linear units of transmission,
with 1 representing a fully transparent region of the Milky Way and 0 representing a fully opaque region.
The value can slightly exceed unity owing to noise in the `SFD98`_ maps, although it is never below 0.

Eddie Schlafly has computed the extinction coefficients for the DECam filters through airmass=1.3, computed for a 7000K source spectrum as was
done in the Appendix of `Schlafly & Finkbeiner (2011)`_. 
These coefficients are A / E(B-V) = 3.995, 3.214, 2.165, 1.592, 1.211, 1.064 (note that these are
*slightly* different from the coefficients in `Schlafly & Finkbeiner 2011`_).
The coefficients are multiplied by the SFD98 E(B-V) values at the coordinates
of each object to derive the :math:`g`, :math:`r` and :math:`z` ``mw_transmission`` values in the Legacy Surveys catalogs. The coefficients at different airmasses 
only change by a small amount, with the largest effect in :math:`g`-band where the coefficient would be 3.219 at airmass=1 and 3.202 at airmass=2.

We calculate Galactic extinction for `BASS`_ and `MzLS`_ as if they are on the DECam filter system.

The coefficients for the four WISE filters are derived from `Fitzpatrick (1999)`_, as recommended by `Schlafly & Finkbeiner (2011)`_,
considered better than either the `Cardelli et al. (1989)`_ curves or the newer `Fitzpatrick & Massa (2009)`_ NIR curve (which is not vetted beyond 2 microns).
These coefficients are A / E(B-V) = 0.184,  0.113, 0.0241, 0.00910.

.. _`SFD98`: https://ui.adsabs.harvard.edu/abs/1998ApJ...500..525S/abstract
.. _`Schlafly & Finkbeiner (2011)`: https://ui.adsabs.harvard.edu/abs/2011ApJ...737..103S/abstract
.. _`Schlafly & Finkbeiner 2011`: https://ui.adsabs.harvard.edu/abs/2011ApJ...737..103S/abstract
.. _`Fitzpatrick (1999)`: https://ui.adsabs.harvard.edu/abs/1999PASP..111...63F/abstract
.. _`Cardelli et al. (1989)`: https://ui.adsabs.harvard.edu/abs/1989ApJ...345..245C/abstract
.. _`Fitzpatrick & Massa (2009)`: https://ui.adsabs.harvard.edu/abs/2009ApJ...699.1209F/abstract

Ellipticities
-------------

The ellipticities for each galaxy ``type`` (i.e. ``shape_e1``, ``shape_e2``) are different from the usual
eccentricity, :math:`e \equiv \sqrt{1 - (b/a)^2}`.  In gravitational lensing
studies, the ellipticity is taken to be a complex number:

.. math::

    \epsilon = \frac{a-b}{a+b} \exp( 2i\phi ) = \epsilon_1 + i \epsilon_2

Where |phi| is the position angle with a range of 180\ |deg|, due to the
ellipse's symmetry. Going between :math:`r, \epsilon_1, \epsilon_2`
and :math:`r, b/a, \phi`:

.. math::

    r           & = & r \\
    |\epsilon|  & = & \sqrt{\epsilon_1^2 + \epsilon_2^2} \\
    \frac{b}{a} & = & \frac{1 - |\epsilon|}{1 + |\epsilon|} \\
    \phi        & = & \frac{1}{2} \arctan \frac{\epsilon_2}{\epsilon_1} \\
    |\epsilon|  & = & \frac{1 - b/a}{1 + b/a} \\
    \epsilon_1  & = & |\epsilon| \cos(2 \phi) \\
    \epsilon_2  & = & |\epsilon| \sin(2 \phi) \\


|

**Footnotes**

.. [#] We define a mask for the aperture fluxes using an inverse variance of zero. So, pixels with undefined ("infinite") measurement errors are not used when calculating aperture fluxes in the Tractor catalogs. As the aperture fluxes are calculated from the coadd images described on the `files page`_, pixels end up being ignored if they are masked in `every` overlapping exposure in a given band. Thus, for example, the saturated cores and bleed trails of bright stars will be masked. Further, in the case that a coadd is only built from a single image, cosmic rays and other mask bits will cause poorly measured and saturated pixels to be ignored for aperture flux measurements.
.. [#] `blobmodel` refers to the "blob-model" maps (i.e. the ``<AAA>/<brick>/legacysurvey-<brick>-blobmodel-<filter>.fits.fz`` maps described on the `files page`_).
.. [#] The aperture sizes for WISE, and the rationale for including them, are detailed in `issue #447`_.
.. _`files page`: ../files/#image-stacks-region-coadd
.. _`issue #447`: https://github.com/legacysurvey/legacypipe/issues/447
