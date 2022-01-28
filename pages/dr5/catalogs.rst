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

tractor/<AAA>/tractor-<brick>.fits
----------------------------------

FITS binary table containing Tractor photometry. Before using these catalogs, note that there are
`known issues`_ regarding their content and derivation. In DR5, the columns pertaining to optical data
also have :math:`u`, :math:`i` and :math:`Y`-band entries (e.g. ``flux_u``, ``flux_i``, ``flux_Y``), but these contain only
zeros.

.. _`known issues`: ../issues
.. _`RELEASE is documented here`: ../../release
.. _`BASS`: ../../bass
.. _`DECaLS`: ../../decamls
.. _`MzLS`: ../../mzls

=========================== ============ ===================== ===============================================
Name                        Type         Units                 Description
=========================== ============ ===================== ===============================================
``release``		    int32	 		       Unique integer denoting the camera and filter set used (`RELEASE is documented here`_)
``brickid``                 int32                              Brick ID [1,662174]
``brickname``               char[8]                            Name of brick, encoding the brick sky position, eg "1126p222" near RA=112.6, Dec=+22.2
``objid``                   int32                              Catalog object number within this brick; a unique identifier hash is BRICKID,OBJID;  OBJID spans [0,N-1] and is contiguously enumerated within each brick
``brick_primary``           boolean                            True if the object is within the brick boundary
``type``                    char[4]                            Morphological model: "PSF"=stellar, "REX"="round exponential galaxy" = 0.45" round EXP galaxy, "DEV"=deVauc, "EXP"=exponential, "COMP"=composite.  Note that in some FITS readers, a trailing space may be appended for "PSF ", "DEV " and "EXP " since the column data type is a 4-character string
``ra``                      float64      deg                   Right ascension at equinox J2000
``dec``                     float64      deg                   Declination at equinox J2000
``ra_ivar``                 float32      1/deg\ |sup2|         Inverse variance of RA (no cosine term!), excluding astrometric calibration errors
``dec_ivar``                float32      1/deg\ |sup2|         Inverse variance of DEC, excluding astrometric calibration errors
``bx``                      float32      pix                   X position (0-indexed) of coordinates in brick image stack
``by``                      float32      pix                   Y position (0-indexed) of coordinates in brick image stack
``dchisq``                  float32[5]                         Difference in |chi|\ |sup2| between successively more-complex model fits: PSF, REX, DEV, EXP, COMP.  The difference is versus no source.
``ebv``                     float32      mag                   Galactic extinction E(B-V) reddening from SFD98, used to compute DECAM_MW_TRANSMISSION and WISE_MW_TRANSMISSION
``mjd_min``		    float64	 days		       Minimum Modified Julian Date of observations used to construct the model of this object
``mjd_max``		    float64	 days		       Maximum Modified Julian Date of observations used to construct the model of this object
``flux_g``		    float32	 nanomaggies	       model flux in :math:`g`
``flux_r``		    float32	 nanomaggies	       model flux in :math:`r`
``flux_z``		    float32	 nanomaggies	       model flux in :math:`z`
``flux_w1``                 float32      nanomaggies           WISE model flux in :math:`W1`
``flux_w2``                 float32      nanomaggies           WISE model flux in :math:`W2`
``flux_w3``                 float32      nanomaggies           WISE model flux in :math:`W3`
``flux_w4``                 float32      nanomaggies           WISE model flux in :math:`W4`
``flux_ivar_g``		    float32	 1/nanomaggies\ |sup2| Inverse variance of FLUX_G
``flux_ivar_r``		    float32	 1/nanomaggies\ |sup2| Inverse variance of FLUX_R
``flux_ivar_z``		    float32	 1/nanomaggies\ |sup2| Inverse variance of FLUX_Z
``flux_ivar_w1``            float32      1/nanomaggies\ |sup2| Inverse variance of FLUX_W1
``flux_ivar_w2``            float32      1/nanomaggies\ |sup2| Inverse variance of FLUX_W2
``flux_ivar_w3``            float32      1/nanomaggies\ |sup2| Inverse variance of FLUX_W3
``flux_ivar_w4``            float32      1/nanomaggies\ |sup2| Inverse variance of FLUX_W4
``apflux_g``		    float32[8]	 nanomaggies	       aperture fluxes on the co-added images in apertures of radius [0.5,0.75,1.0,1.5,2.0,3.5,5.0,7.0] arcsec in :math:`g`
``apflux_r``		    float32[8]	 nanomaggies	       aperture fluxes on the co-added images in apertures of radius [0.5,0.75,1.0,1.5,2.0,3.5,5.0,7.0] arcsec in :math:`r`
``apflux_z``    	    float32[8]	 nanomaggies	       aperture fluxes on the co-added images in apertures of radius [0.5,0.75,1.0,1.5,2.0,3.5,5.0,7.0] arcsec in :math:`z`
``apflux_resid_g``          float32[8]   nanomaggies           aperture fluxes on the co-added residual images in :math:`g`
``apflux_resid_r``          float32[8]   nanomaggies           aperture fluxes on the co-added residual images in :math:`r`
``apflux_resid_z``          float32[8]   nanomaggies           aperture fluxes on the co-added residual images in :math:`z`
``apflux_ivar_g``           float32[8]   1/nanomaggies\ |sup2| Inverse variance of APFLUX_RESID_G
``apflux_ivar_r``           float32[8]   1/nanomaggies\ |sup2| Inverse variance of APFLUX_RESID_R
``apflux_ivar_z``           float32[8]   1/nanomaggies\ |sup2| Inverse variance of APFLUX_RESID_Z
``mw_transmission_g``	    float32                            Galactic transmission in :math:`g` filter in linear units [0,1]
``mw_transmission_r``	    float32                            Galactic transmission in :math:`r` filter in linear units [0,1]
``mw_transmission_z``	    float32                            Galactic transmission in :math:`z` filter in linear units [0,1]
``mw_transmission_w1``	    float32                            Galactic transmission in :math:`W1` filter in linear units [0,1]
``mw_transmission_w2``	    float32                            Galactic transmission in :math:`W2` filter in linear units [0,1]
``mw_transmission_w3``	    float32                            Galactic transmission in :math:`W3` filter in linear units [0,1]
``mw_transmission_w4``	    float32                            Galactic transmission in :math:`W4` filter in linear units [0,1]
``nobs_g``                  int16                              Number of images that contribute to the central pixel in :math:`g`: filter for this object (not profile-weighted)
``nobs_r``                  int16                              Number of images that contribute to the central pixel in :math:`r`: filter for this object (not profile-weighted)
``nobs_z``                  int16                              Number of images that contribute to the central pixel in :math:`z`: filter for this object (not profile-weighted)
``nobs_w1``                 int16                              Number of images that contribute to the central pixel in :math:`W1`: filter for this object (not profile-weighted)
``nobs_w2``                 int16                              Number of images that contribute to the central pixel in :math:`W2`: filter for this object (not profile-weighted)
``nobs_w3``                 int16                              Number of images that contribute to the central pixel in :math:`W3`: filter for this object (not profile-weighted)
``nobs_w4``                 int16                              Number of images that contribute to the central pixel in :math:`W4`: filter for this object (not profile-weighted)
``rchisq_g``                float32                            Profile-weighted |chi|\ |sup2| of model fit normalized by the number of pixels in :math:`g`
``rchisq_r``                float32                            Profile-weighted |chi|\ |sup2| of model fit normalized by the number of pixels in :math:`r`
``rchisq_z``                float32                            Profile-weighted |chi|\ |sup2| of model fit normalized by the number of pixels in :math:`z`
``rchisq_w1``               float32                            Profile-weighted |chi|\ |sup2| of model fit normalized by the number of pixels in :math:`W1`
``rchisq_w2``               float32                            Profile-weighted |chi|\ |sup2| of model fit normalized by the number of pixels in :math:`W2`
``rchisq_w3``               float32                            Profile-weighted |chi|\ |sup2| of model fit normalized by the number of pixels in :math:`W3`
``rchisq_w4``               float32                            Profile-weighted |chi|\ |sup2| of model fit normalized by the number of pixels in :math:`W4`
``fracflux_g``              float32                            Profile-weighted fraction of the flux from other sources divided by the total flux in :math:`g` (typically [0,1])
``fracflux_r``              float32                            Profile-weighted fraction of the flux from other sources divided by the total flux in :math:`r` (typically [0,1])
``fracflux_z``              float32                            Profile-weighted fraction of the flux from other sources divided by the total flux in :math:`z` (typically [0,1])
``fracflux_w1``             float32                            Profile-weighted fraction of the flux from other sources divided by the total flux in :math:`W1` (typically [0,1])
``fracflux_w2``             float32                            Profile-weighted fraction of the flux from other sources divided by the total flux in :math:`W2` (typically [0,1])
``fracflux_w3``             float32                            Profile-weighted fraction of the flux from other sources divided by the total flux in :math:`W3` (typically [0,1])
``fracflux_w4``             float32                            Profile-weighted fraction of the flux from other sources divided by the total flux in :math:`W4` (typically [0,1])
``fracmasked_g``            float32                            Profile-weighted fraction of pixels masked from all observations of this object in :math:`g`, strictly between [0,1]
``fracmasked_r``            float32                            Profile-weighted fraction of pixels masked from all observations of this object in :math:`r`, strictly between [0,1]
``fracmasked_z``            float32                            Profile-weighted fraction of pixels masked from all observations of this object in :math:`z`, strictly between [0,1]
``fracin_g``                float32                            Fraction of a source's flux within the blob in :math:`g`, near unity for real sources
``fracin_r``                float32                            Fraction of a source's flux within the blob in :math:`r`, near unity for real sources
``fracin_z``                float32                            Fraction of a source's flux within the blob in :math:`z`, near unity for real sources
``anymask_g``               int16                              Bitwise mask set if the central pixel from any image satisfies each condition in :math:`g`
``anymask_r``               int16                              Bitwise mask set if the central pixel from any image satisfies each condition in :math:`r`
``anymask_z``               int16                              Bitwise mask set if the central pixel from any image satisfies each condition in :math:`z`
``allmask_g``               int16                              Bitwise mask set if the central pixel from all images satisfy each condition in :math:`g`
``allmask_r``               int16                              Bitwise mask set if the central pixel from all images satisfy each condition in :math:`r`
``allmask_z``               int16                              Bitwise mask set if the central pixel from all images satisfy each condition in :math:`z`
``wisemask_w1``		    uint8			       W1 bright star bitmask, :math:`2^0` :math:`(2^1)` for southward (northward) scans
``wisemask_w2``		    uint8			       W2 bright star bitmask, :math:`2^0` :math:`(2^1)` for southward (northward) scans
``psfsize_g``               float32      arcsec                Weighted average PSF FWHM in the :math:`g` band
``psfsize_r``               float32      arcsec                Weighted average PSF FWHM in the :math:`r` band
``psfsize_z``               float32      arcsec                Weighted average PSF FWHM in the :math:`z` band
``psfdepth_g``              float32      1/nanomaggies\ |sup2| For a :math:`5\sigma` point source detection limit in :math:`g`, :math:`5/\sqrt(\mathrm{PSFDEPTH\_G})` gives flux in nanomaggies and :math:`-2.5[\log_{10}(5 / \sqrt(\mathrm{PSFDEPTH\_G})) - 9]` gives corresponding magnitude
``psfdepth_r``              float32      1/nanomaggies\ |sup2| For a :math:`5\sigma` point source detection limit in :math:`r`, :math:`5/\sqrt(\mathrm{PSFDEPTH\_R})` gives flux in nanomaggies and :math:`-2.5[\log_{10}(5 / \sqrt(\mathrm{PSFDEPTH\_R})) - 9]` gives corresponding magnitude
``psfdepth_z``              float32      1/nanomaggies\ |sup2| For a :math:`5\sigma` point source detection limit in :math:`z`, :math:`5/\sqrt(\mathrm{PSFDEPTH\_Z})` gives flux in nanomaggies and :math:`-2.5[\log_{10}(5 / \sqrt(\mathrm{PSFDEPTH\_Z})) - 9]` gives corresponding magnitude
``galdepth_g``              float32      1/nanomaggies\ |sup2| As for PSFDEPTH_G but for a galaxy (0.45" exp, round) detection sensitivity
``galdepth_r``              float32      1/nanomaggies\ |sup2| As for PSFDEPTH_R but for a galaxy (0.45" exp, round) detection sensitivity
``galdepth_z``              float32      1/nanomaggies\ |sup2| As for PSFDEPTH_Z but for a galaxy (0.45" exp, round) detection sensitivity
``wise_coadd_id``	    char[8]	 		       unWISE coadd file name for the center of each object
``lc_flux_w1``		    float32[7]	 nanomaggies           FLUX_W1 in each of up to seven unWISE coadd epochs
``lc_flux_w2``		    float32[7]	 nanomaggies           FLUX_W2 in each of up to seven unWISE coadd epochs
``lc_flux_ivar_w1``	    float32[7]	 1/nanomaggies\ |sup2| Inverse variance of LC_FLUX_W1
``lc_flux_ivar_w2``	    float32[7]	 1/nanomaggies\ |sup2| Inverse variance of LC_FLUX_W2
``lc_nobs_w1``		    int16[7]			       NOBS_W1 in each of up to seven unWISE coadd epochs
``lc_nobs_w2``		    int16[7]		               NOBS_W2 in each of up to seven unWISE coadd epochs
``lc_fracflux_w1``	    float32[7]	                       FRACFLUX_W1 in each of up to seven unWISE coadd epochs
``lc_fracflux_w2``	    float32[7]			       FRACFLUX_W2 in each of up to seven unWISE coadd epochs
``lc_rchisq_w1``	    float32[7]			       RCHISQ_W1 in each of up to seven unWISE coadd epochs
``lc_rchisq_w2``	    float32[7]		      	       RCHISQ_W2 in each of up to seven unWISE coadd epochs
``lc_mjd_w1``		    float32[7]			       MJD_W1 in each of up to seven unWISE coadd epochs
``lc_mjd_w2``		    float32[7]			       MJD_W2 in each of up to seven unWISE coadd epochs
``fracdev``		    float32			       Fraction of model in deVauc [0,1]
``fracdev_ivar``	    float32			       Inverse variance of FRACDEV
``shapeexp_r``		    float32	 arcsec  	       Half-light radius of exponential model (>0)
``shapeexp_r_ivar``	    float32	 1/arcsec\ |sup2|      Inverse variance of R_EXP
``shapeexp_e1``		    float32         		       Ellipticity component 1
``shapeexp_e1_ivar``	    float32		   	       Inverse variance of SHAPEEXP_E1
``shapeexp_e2``		    float32		               Ellipticity component 2
``shapeexp_e2_ivar``	    float32	       		       Inverse variance of SHAPEEXP_E2
``shapedev_r``		    float32	 arcsec	               Half-light radius of deVaucouleurs model (>0)
``shapedev_r_ivar``	    float32	 1/arcsec\ |sup2|      Inverse variance of R_DEV
``shapedev_e1``		    float32		               Ellipticity component 1
``shapedev_e1_ivar``	    float32	   		       Inverse variance of SHAPEDEV_E1
``shapedev_e2``		    float32			       Ellipticity component 2
``shapedev_e2_ivar``	    float32			       Inverse variance of SHAPEDEV_E2
=========================== ============ ===================== ===============================================

Mask Values
-----------

The ANYMASK and ALLMASK bit masks are defined as follows from the CP (NOIRLab Community Pipeline) Data Quality bits.

=== ===== =========================== ==================================================
Bit Value Name                        Description
=== ===== =========================== ==================================================
  0     1 detector bad pixel/no data  See the `CP Data Quality bit description`_.
  1     2 saturated                   See the `CP Data Quality bit description`_.
  2     4 interpolated                See the `CP Data Quality bit description`_.
  4    16 single exposure cosmic ray  See the `CP Data Quality bit description`_.
  6    64 bleed trail                 See the `CP Data Quality bit description`_.
  7   128 multi-exposure transient    See the `CP Data Quality bit description`_.
  8   256 edge                        See the `CP Data Quality bit description`_.
  9   512 edge2                       See the `CP Data Quality bit description`_.
 10  1024 longthin                    :math:`\gt 5\sigma` connected components with major axis :math:`\gt 200` pixels and major/minor axis :math:`\gt 0.1`.  To mask, *e.g.*, satellite trails.
=== ===== =========================== ==================================================

.. _`CP Data Quality bit description`: https://legacy.noirlab.edu/noao/staff/fvaldes/CPDocPrelim/PL201_3.html

Goodness-of-Fits
----------------

The ``dchisq`` values represent the |chi|\ |sup2| sum of all pixels in the source's blob
for various models.  This 5-element vector contains the |chi|\ |sup2| difference between
the best-fit point source (type="PSF"), round exponential galaxy model ("REX"),
de Vaucouleurs model ("DEV"), exponential model ("EXP"), and a composite model ("COMP"), in that order.
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

Galactic Extinction Coefficients
--------------------------------

The Galactic extinction values are derived from the `SFD98`_ maps, but with updated coefficients to
convert E(B-V) to the extinction in each filter.  These are reported in linear units of transmission,
with 1 representing a fully transparent region of the Milky Way and 0 representing a fully opaque region.
The value can slightly exceed unity owing to noise in the SFD98 maps, although it is never below 0.

Extinction coefficients for the SDSS filters have been changed to the values recommended
by `Schlafly & Finkbeiner (2011)`_ using the `Fitzpatrick (1999)`_
extinction curve at R_V = 3.1 and their improved overall calibration of the `SFD98`_ maps.
These coefficients are A / E(B-V) = 4.239,  3.303,  2.285,  1.698,  1.263 in :math:`ugriz`,
which are different from those used in SDSS-I,II,III, but are the values used for SDSS-IV/eBOSS target selection.

Extinction coefficients for the DECam filters use the `Schlafly & Finkbeiner (2011)`_ values,
with :math:`u`-band computed using the same formulae and code at airmass 1.3 (Schlafly, priv. comm. decam-data list on 11/13/14).
These coefficients are A / E(B-V) = 3.995, 3.214, 2.165, 1.592, 1.211, 1.064 (note that these are
*slightly* different from the coefficients in `Schlafly & Finkbeiner 2011`_).

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

The ellipticity, |epsilon|, is different from the usual
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
