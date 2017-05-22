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
`known issues`_ regarding their content and derivation.

.. _`known issues`: ../issues
.. _`RELEASE is documented here`: ../../release

=========================== ============ ===================== ===============================================
Name                        Type         Units                 Description
=========================== ============ ===================== ===============================================
RELEASE			    int16	 		       Unique integer denoting the camera and filter set used (`RELEASE is documented here`_)
BRICKID                     int32                              Brick ID [1,662174]
BRICKNAME                   char                               Name of brick, encoding the brick sky position, eg "1126p222" near RA=112.6, Dec=+22.2
OBJID                       int32                              Catalog object number within this brick; a unique identifier hash is BRICKID,OBJID;  OBJID spans [0,N-1] and is contiguously enumerated within each blob
BRICK_PRIMARY               boolean                            True if the object is within the brick boundary
TYPE                        char[4]                            Morphological model: "PSF"=stellar, "SIMP"="simple galaxy" = 0.45" round EXP galaxy, "DEV"=deVauc, "EXP"=exponential, "COMP"=composite.  Note that in some FITS readers, a trailing space may be appended for "PSF ", "DEV " and "EXP " since the column data type is a 4-character string
RA                          float64      deg                   Right ascension at epoch J2000
DEC                         float64      deg                   Declination at epoch J2000
RA_IVAR                     float32      1/deg\ |sup2|         Inverse variance of RA, excluding astrometric calibration errors
DEC_IVAR                    float32      1/deg\ |sup2|         Inverse variance of DEC (no cos term!), excluding astrometric calibration errors
BX                          float32      pix                   X position (0-indexed) of coordinates in brick image stack
BY                          float32      pix                   Y position (0-indexed) of coordinates in brick image stack
DCHISQ                      float32[5]                         Difference in |chi|\ |sup2| between successively more-complex model fits: PSF, SIMPle, DEV, EXP, COMP.  The difference is versus no source.
EBV                         float32      mag                   Galactic extinction E(B-V) reddening from SFD98, used to compute DECAM_MW_TRANSMISSION and WISE_MW_TRANSMISSION
MJD_MIN			    float64	 days		       Minimum Modified Julian Date of observations used to construct the model of this object
MJD_MAX			    float64	 days		       Maximum Modified Julian Date of observations used to construct the model of this object
FLUX_G			    float32	 nanomaggies	       model flux in :math:`g`
FLUX_R			    float32	 nanomaggies	       model flux in :math:`r`
FLUX_Z			    float32	 nanomaggies	       model flux in :math:`z`
FLUX_W1                     float32      nanomaggies           WISE model flux in :math:`W1`
FLUX_W2                     float32      nanomaggies           WISE model flux in :math:`W2`
FLUX_W3                     float32      nanomaggies           WISE model flux in :math:`W3`
FLUX_W4                     float32      nanomaggies           WISE model flux in :math:`W4`
FLUX_IVAR_G		    float32	 1/nanomaggies\ |sup2| Inverse variance of FLUX_G
FLUX_IVAR_R		    float32	 1/nanomaggies\ |sup2| Inverse variance of FLUX_R
FLUX_IVAR_Z		    float32	 1/nanomaggies\ |sup2| Inverse variance of FLUX_Z
FLUX_IVAR_W1                float32      1/nanomaggies\ |sup2| Inverse variance of FLUX_W1
FLUX_IVAR_W2                float32      1/nanomaggies\ |sup2| Inverse variance of FLUX_W2
FLUX_IVAR_W3                float32      1/nanomaggies\ |sup2| Inverse variance of FLUX_W3
FLUX_IVAR_W4                float32      1/nanomaggies\ |sup2| Inverse variance of FLUX_W4
APFLUX_G		    float32[8]	 nanomaggies	       aperture fluxes on the co-added images in apertures of radius [0.5,0.75,1.0,1.5,2.0,3.5,5.0,7.0] arcsec in :math:`g`
APFLUX_R		    float32[8]	 nanomaggies	       aperture fluxes on the co-added images in apertures of radius [0.5,0.75,1.0,1.5,2.0,3.5,5.0,7.0] arcsec in :math:`r`
APFLUX_Z		    float32[8]	 nanomaggies	       aperture fluxes on the co-added images in apertures of radius [0.5,0.75,1.0,1.5,2.0,3.5,5.0,7.0] arcsec in :math:`z`
APFLUX_RESID_G              float32[8]   nanomaggies           aperture fluxes on the co-added residual images in :math:`g`
APFLUX_RESID_R              float32[8]   nanomaggies           aperture fluxes on the co-added residual images in :math:`r`
APFLUX_RESID_Z              float32[8]   nanomaggies           aperture fluxes on the co-added residual images in :math:`z`
APFLUX_IVAR_G               float32[8]   1/nanomaggies\ |sup2| Inverse variance of APFLUX_RESID_G
APFLUX_IVAR_R               float32[8]   1/nanomaggies\ |sup2| Inverse variance of APFLUX_RESID_R
APFLUX_IVAR_Z               float32[8]   1/nanomaggies\ |sup2| Inverse variance of APFLUX_RESID_Z
MW_TRANSMISSION_G	    float32                            Galactic transmission in :math:`g` filter in linear units [0,1]
MW_TRANSMISSION_R	    float32                            Galactic transmission in :math:`r` filter in linear units [0,1]
MW_TRANSMISSION_Z	    float32                            Galactic transmission in :math:`z` filter in linear units [0,1]
MW_TRANSMISSION_W1	    float32                            Galactic transmission in :math:`W1` filter in linear units [0,1]
MW_TRANSMISSION_W2	    float32                            Galactic transmission in :math:`W2` filter in linear units [0,1]
MW_TRANSMISSION_W3	    float32                            Galactic transmission in :math:`W3` filter in linear units [0,1]
MW_TRANSMISSION_W4	    float32                            Galactic transmission in :math:`W4` filter in linear units [0,1]
NOBS_G                      int16                              Number of images that contribute to the central pixel in :math:`g`: filter for this object (not profile-weighted)
NOBS_R                      int16                              Number of images that contribute to the central pixel in :math:`r`: filter for this object (not profile-weighted)
NOBS_Z                      int16                              Number of images that contribute to the central pixel in :math:`z`: filter for this object (not profile-weighted)
NOBS_W1                     int16                              Number of images that contribute to the central pixel in :math:`W1`: filter for this object (not profile-weighted)
NOBS_W2                     int16                              Number of images that contribute to the central pixel in :math:`W2`: filter for this object (not profile-weighted)
NOBS_W3                     int16                              Number of images that contribute to the central pixel in :math:`W3`: filter for this object (not profile-weighted)
NOBS_W4                     int16                              Number of images that contribute to the central pixel in :math:`W4`: filter for this object (not profile-weighted)
RCHISQ_G                    float32                            Profile-weighted |chi|\ |sup2| of model fit normalized by the number of pixels in :math:`g`
RCHISQ_R                    float32                            Profile-weighted |chi|\ |sup2| of model fit normalized by the number of pixels in :math:`r`
RCHISQ_Z                    float32                            Profile-weighted |chi|\ |sup2| of model fit normalized by the number of pixels in :math:`z`
RCHISQ_W1                   float32                            Profile-weighted |chi|\ |sup2| of model fit normalized by the number of pixels in :math:`W1`
RCHISQ_W2                   float32                            Profile-weighted |chi|\ |sup2| of model fit normalized by the number of pixels in :math:`W2`
RCHISQ_W3                   float32                            Profile-weighted |chi|\ |sup2| of model fit normalized by the number of pixels in :math:`W3`
RCHISQ_W4                   float32                            Profile-weighted |chi|\ |sup2| of model fit normalized by the number of pixels in :math:`W4`
FRACFLUX_G                  float32                            Profile-weighted fraction of the flux from other sources divided by the total flux in :math:`g` (typically [0,1])
FRACFLUX_R                  float32                            Profile-weighted fraction of the flux from other sources divided by the total flux in :math:`r` (typically [0,1])
FRACFLUX_Z                  float32                            Profile-weighted fraction of the flux from other sources divided by the total flux in :math:`z` (typically [0,1])
FRACFLUX_W1                 float32                            Profile-weighted fraction of the flux from other sources divided by the total flux in :math:`W1` (typically [0,1])
FRACFLUX_W2                 float32                            Profile-weighted fraction of the flux from other sources divided by the total flux in :math:`W2` (typically [0,1])
FRACFLUX_W3                 float32                            Profile-weighted fraction of the flux from other sources divided by the total flux in :math:`W3` (typically [0,1])
FRACFLUX_W4                 float32                            Profile-weighted fraction of the flux from other sources divided by the total flux in :math:`W4` (typically [0,1])
FRACMASKED_G                float32                            Profile-weighted fraction of pixels masked from all observations of this object in :math:`g`, strictly between [0,1]
FRACMASKED_R                float32                            Profile-weighted fraction of pixels masked from all observations of this object in :math:`r`, strictly between [0,1]
FRACMASKED_Z                float32                            Profile-weighted fraction of pixels masked from all observations of this object in :math:`z`, strictly between [0,1]
FRACIN_G                    float32                            Fraction of a source's flux within the blob in :math:`g`, near unity for real sources
FRACIN_R                    float32                            Fraction of a source's flux within the blob in :math:`r`, near unity for real sources
FRACIN_Z                    float32                            Fraction of a source's flux within the blob in :math:`z`, near unity for real sources
ANYMASK_G                   int16                              Bitwise mask set if the central pixel from any image satisfies each condition in :math:`g`
ANYMASK_R                   int16                              Bitwise mask set if the central pixel from any image satisfies each condition in :math:`r`
ANYMASK_Z                   int16                              Bitwise mask set if the central pixel from any image satisfies each condition in :math:`z`
ALLMASK_G                   int16                              Bitwise mask set if the central pixel from all images satisfy each condition in :math:`g` 
ALLMASK_R                   int16                              Bitwise mask set if the central pixel from all images satisfy each condition in :math:`r` 
ALLMASK_Z                   int16                              Bitwise mask set if the central pixel from all images satisfy each condition in :math:`z` 
WISEMASK_W1		    uint8			       W1 bright star bitmask, :math:`2^0` :math:`(2^1)` for southward (northward) scans
WISEMASK_W2		    uint8			       W2 bright star bitmask, :math:`2^0` :math:`(2^1)` for southward (northward) scans
PSFSIZE_G                   float32      arcsec                Weighted average PSF FWHM in the :math:`g` band
PSFSIZE_R                   float32      arcsec                Weighted average PSF FWHM in the :math:`r` band
PSFSIZE_Z                   float32      arcsec                Weighted average PSF FWHM in the :math:`z` band
PSFDEPTH_G                  float32      1/nanomaggies\ |sup2| For a :math:`5\sigma` point source detection limit in :math:`g`, :math:`5/\sqrt(\mathrm{PSFDEPTH\_G})` gives flux in nanomaggies and :math:`-2.5(\log_{10}((5 / \sqrt(\mathrm{PSFDEPTH\_G}) - 9)` gives corresponding magnitude
PSFDEPTH_R                  float32      1/nanomaggies\ |sup2| For a :math:`5\sigma` point source detection limit in :math:`g`, :math:`5/\sqrt(\mathrm{PSFDEPTH\_R})` gives flux in nanomaggies and :math:`-2.5(\log_{10}((5 / \sqrt(\mathrm{PSFDEPTH\_R}) - 9)` gives corresponding magnitude
PSFDEPTH_Z                  float32      1/nanomaggies\ |sup2| For a :math:`5\sigma` point source detection limit in :math:`g`, :math:`5/\sqrt(\mathrm{PSFDEPTH\_Z})` gives flux in nanomaggies and :math:`-2.5(\log_{10}((5 / \sqrt(\mathrm{PSFDEPTH\_Z}) - 9)` gives corresponding magnitude
GALDEPTH_G                  float32      1/nanomaggies\ |sup2| As for PSFDEPTH_G but for a galaxy (0.45" exp, round) detection sensitivity
GALDEPTH_R                  float32      1/nanomaggies\ |sup2| As for PSFDEPTH_R but for a galaxy (0.45" exp, round) detection sensitivity
GALDEPTH_Z                  float32      1/nanomaggies\ |sup2| As for PSFDEPTH_Z but for a galaxy (0.45" exp, round) detection sensitivity
WISE_COADD_ID		    char[8]	 		       unWISE coadd file name for the center of each object
LC_FLUX_W1		    float32[7]	 nanomaggies           FLUX_W1 in each of up to seven unWISE coadd epochs
LC_FLUX_W2		    float32[7]	 nanomaggies           FLUX_W2 in each of up to seven unWISE coadd epochs
LC_FLUX_IVAR_W1		    float32[7]	 1/nanomaggies2	       Inverse variance of LC_FLUX_W1
LC_FLUX_IVAR_W2		    float32[7]	 1/nanomaggies2	       Inverse variance of LC_FLUX_W2
LC_NOBS_W1		    int16[7]			       NOBS_W1 in each of up to seven unWISE coadd epochs
LC_NOBS_W2		    int16[7]		               NOBS_W2 in each of up to seven unWISE coadd epochs
LC_FRACFLUX_W1		    float32[7]	                       FRACFLUX_W1 in each of up to seven unWISE coadd epochs
LC_FRACFLUX_W2		    float32[7]			       FRACFLUX_W2 in each of up to seven unWISE coadd epochs
LC_RCHI2_W1		    float32[7]			       RCHI2_W1 in each of up to seven unWISE coadd epochs
LC_RCHI2_W2		    float32[7]		      	       RCHI2_W2 in each of up to seven unWISE coadd epochs
LC_MJD_W1		    float32[7]			       MJD_W1 in each of up to seven unWISE coadd epochs
LC_MJD_W2		    float32[7]			       MJD_W2 in each of up to seven unWISE coadd epochs
FRACDEV			    float32			       Fraction of model in deVauc [0,1]
FRACDEV_IVAR		    float32			       Inverse variance of FRACDEV
SHAPEEXP_R		    float32	 arcsec  	       Half-light radius of exponential model (>0)
SHAPEEXP_R_IVAR		    float32	 1/arcsec2	       Inverse variance of R_EXP
SHAPEEXP_E1		    float32         		       Ellipticity component 1
SHAPEEXP_E1_IVAR	    float32		   	       Inverse variance of SHAPEEXP_E1
SHAPEEXP_E2		    float32		               Ellipticity component 2
SHAPEEXP_E2_IVAR	    float32	       		       Inverse variance of SHAPEEXP_E2
SHAPEDEV_R		    float32	 arcsec	               Half-light radius of deVaucouleurs model (>0)
SHAPEDEV_R_IVAR		    float32	 1/arcsec	       Inverse variance of R_DEV
SHAPEDEV_E1		    float32		               Ellipticity component 1
SHAPEDEV_E1_IVAR	    float32	   		       Inverse variance of SHAPEDEV_E1
SHAPEDEV_E2		    float32			       Ellipticity component 2
SHAPEDEV_E2_IVAR	    float32			       Inverse variance of SHAPEDEV_E2
=========================== ============ ===================== ===============================================

Mask Values
-----------

The ANYMASK and ALLMASK bit masks are defined as follows from the CP (NOAO Community Pipeline) Data Quality bits.

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

.. _`CP Data Quality bit description`: http://www.noao.edu/noao/staff/fvaldes/CPDocPrelim/PL201_3.html

Goodness-of-Fits
----------------

The DCHISQ values represent the |chi|\ |sup2| sum of all pixels in the source's blob
for various models.  This 5-element vector contains the |chi|\ |sup2| difference between
the best-fit point source (type="PSF"), simple galaxy model ("SIMP"),
de Vaucouleurs model ("DEV"), exponential model ("EXP"), and a composite model ("COMP"), in that order.
The "simple galaxy" model is an exponential galaxy with fixed shape of 0.45\ |Prime| and zero ellipticity (round)
and is meant to capture slightly-extended but low signal-to-noise objects.
The DCHISQ values are the |chi|\ |sup2| difference versus no source in this location---that is, it is the improvement from adding the given source to our model of the sky.  The first element (for PSF) corresponds to a tradition notion of detection significance.
Note that the DCHISQ values are negated so that positive values indicate better fits.
We penalize models with negative flux in a band by subtracting rather than adding its |chi|\ |sup2| improvement in that band.


The RCHI2 values are interpreted as the reduced |chi|\ |sup2| pixel-weighted by the model fit,
computed as the following sum over pixels in the blob for each object:

.. math::
    \chi^2 = \frac{\sum \left[ \left(\mathrm{image} - \mathrm{model}\right)^2 \times \mathrm{model} \times \mathrm{inverse\, variance}\right]}{\sum \left[ \mathrm{model} \right]}

The above sum is over all images contributing to a particular filter.
The above can be negative-valued for sources that have a flux measured as negative in some bands
where they are not detected.

Galactic Extinction Coefficients
--------------------------------

The Galactic extinction values are derived from the SFD98 maps, but with updated coefficients to
convert E(B-V) to the extinction in each filter.  These are reported in linear units of transmission,
with 1 representing a fully transparent region of the Milky Way and 0 representing a fully opaque region.
The value can slightly exceed unity owing to noise in the SFD98 maps, although it is never below 0.

Extinction coefficients for the SDSS filters have been changed to the values recommended
by Schlafly & Finkbeiner (2011; http://arxiv.org/abs/1012.4804 ; Table 4) using the Fizpatrick 1999
extinction curve at R_V = 3.1 and their improved overall calibration of the SFD98 maps.
These coefficients are A / E(B-V) = 4.239,  3.303,  2.285,  1.698,  1.263 in ugriz,
which are different from those used in SDSS-I,II,III, but are the values used for SDSS-IV/eBOSS target selection.

For DR4, we calculate Galactic extinction for BASS and MzLS as if they were on the DECam filter system.

Extinction coefficients for the DECam filters use the Schlafly & Finkbeiner (2011) values,
with u-band computed using the same formulae and code at airmass 1.3 (Schlafly, priv. comm. decam-data list on 11/13/14).
These coefficients are A / E(B-V) = 3.995, 3.214, 2.165, 1.592, 1.211, 1.064.
(These are slightly different than the ones in Schlafly & Finkbeiner (2011; http://arxiv.org/abs/1012.4804).)

The coefficients for the four WISE filters are derived from Fitzpatrick 1999, as recommended by Schafly & Finkbeiner,
considered better than either the Cardelli et al 1989 curves or the newer Fitzpatrick & Massa 2009 NIR curve not vetted beyond 2 micron).
These coefficients are A / E(B-V) = 0.184,  0.113, 0.0241, 0.00910.

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
