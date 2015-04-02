.. title: Tractor Catalog Format
.. slug: catalogs
.. tags: mathjax
.. description:

.. |chi|      unicode:: U+003C7 .. GREEK SMALL LETTER CHI
.. |sup2|   unicode:: U+000B2 .. SUPERSCRIPT TWO
.. |epsilon|  unicode:: U+003B5 .. GREEK SMALL LETTER EPSILON
.. |phi|      unicode:: U+003D5 .. GREEK PHI SYMBOL
.. |deg|    unicode:: U+000B0 .. DEGREE SIGN


=========================== ============ ===================== ===============================================
Name                        Type         Units                 Description
=========================== ============ ===================== ===============================================
BRICKID                     int32                              Brick ID [1,662174]
BRICKNAME                   char                               Name of brick, encoding the brick sky position
OBJID                       int64                              Catalog object number within this brick; a unique identifier hash is BRICKID,OBJID;  OBJID spans [0,N-1] and is contiguously enumerated within each blob
BRICK_PRIMARY               bool                               "T" if the object is within the brick boundary
BLOB                        int64                              Blend family; objects with the same [BRICKID,BLOB] identifier were modeled (deblended) together; contiguously numbered from 0
TYPE                        char                               Morphological model: PSF=stellar, EXP=exponential, DEV=deVauc, COMP=composite
RA                          float64      deg                   Right ascension at epoch J2000
RA_IVAR                     float32      1/deg\ |sup2|         Inverse variance of RA, excluding astrometric calibration errors
DEC                         float64      deg                   Declination at epoch J2000
DEC_IVAR                    float32      1/deg\ |sup2|         Inverse variance of DEC (no cos term!), excluding astrometric calibration errors
BX                          float32      pix                   X position (0-indexed) of coordinates in brick image stack
BY                          float32      pix                   Y position (0-indexed) of coordinates in brick image stack
DECAM_FLUX                  float32[6]   nanomaggies           DECam model flux in ugrizY
DECAM_FLUX_IVAR             float32[6]   1/nanomaggies\ |sup2| Inverse variance oF DECAM_FLUX
DECAM_APFLUX                float32[8,6] nanomaggies           DECam aperture fluxes on the co-added images in apertures of radius  [0.5,0.75,1.0,1.5,2.0,3.5,5.0,7.0] arcsec in ugrizY
DECAM_APFLUX_RESID          float32[8,6] nanomaggies           DECam aperture fluxes on the co-added residual images
DECAM_APFLUX_IVAR           float32[8,6] 1/nanomaggies\ |sup2| Inverse variance oF DECAM_APFLUX
DECAM_MW_TRANSMISSION       float32[6]                         Galactic transmission in ugrizY filters in linear units [0,1]
DECAM_NOBS                  int32[6]                           Number of images that contribute to the central pixel in each filter for this object (not profile-weighted)
DECAM_RCHI2                 float32[6]                         Profile-weighted |chi|\ |sup2| of model fit normalized by the number of pixels
DECAM_FRACFLUX              float32[6]                         Profile-weight fraction of the flux from other sources divided by the total flux (typically [0,1])
DECAM_FRACMASKED            float32[6]                         Profile-weighted fraction of pixels masked from all observations of this object, strictly between [0,1]
DECAM_FRACIN                float32[6]                         Fraction of a source's flux within the blob, near unity for real sources
DECAM_SATURATED             byte[6]                            "T" if any contributing image has the central pixel saturated
OUT_OF_BOUNDS               bool[6]                            "T" for objects whose center is on the brick; less strong of a cut than BRICK_PRIMARY
DECAM_ANYMASK               int32[6]                           Bitwise mask set if the central pixel from any image satisfy each condition
DECAM_ALLMASK               int32[6]                           Bitwise mask set if the central pixel from all images satisfy each condition
WISE_FLUX                   float32[4]   nanomaggies           WISE model flux in W1,W2,W3,W4
WISE_FLUX_IVAR              float32[4]   1/nanomaggies\ |sup2| Inverse variance of WISE_FLUX
WISE_MW_TRANSMISSION        float32[4]                         Galactic transmission in W1,W2,W3,W4 filters in linear units [0,1]
WISE_NOBS                   int32[4]                           Number of images that contribute to the central pixel in each filter for this object (not profile-weighted)
WISE_FRACFLUX               float32[4]                         Profile-weight fraction of the flux from other sources divided by the total flux (typically [0,1])
WISE_RCHI2                  float32[4]                         Profile-weighted |chi|\ |sup2| of model fit normalized by the number of pixels
DCHISQ                      float32[4]                         Difference in |chi|\ |sup2| between successfully more-complex model fits
FRACDEV                     float32                            Fraction of model in deVauc [0,1]
FRACDEV_IVAR                float32                            Inverse variance of FRACDEV
SHAPEEXP_R                  float32      arcsec                Half-light radius of exponential model (>0)
SHAPEEXP_R_IVAR             float32      1/arcsec\ |sup2|      Inverse variance of R_EXP
SHAPEEXP_E1                 float32                            Ellipticity component 1
SHAPEEXP_E1_IVAR            float32                            Inverse variance of SHAPEEXP_E1
SHAPEEXP_E2                 float32                            Ellipticity component 2
SHAPEEXP_E2_IVAR            float32                            Inverse variance of SHAPEEXP_E2
SHAPEDEV_R                  float32      arcsec                Half-light radius of deVaucouleurs model (>0)
SHAPEDEV_R_IVAR             float32      1/arcsec\ |sup2|      Inverse variance of R_DEV
SHAPEDEV_E1                 float32                            Ellipticity component 1
SHAPEDEV_E1_IVAR            float32                            Inverse variance of SHAPEDEV_E1
SHAPEDEV_E2                 float32                            Ellipticity component 2
SHAPEDEV_E2_IVAR            float32                            Inverse variance of SHAPEDEV_E2
EBV                         float32      mag                   Galactic extinction E(B-V) reddening from SFD98, used to compute DECAM_MW_TRANSMISSION and WISE_MW_TRANSMISSION
=========================== ============ ===================== ===============================================

Mask Values
===========

The DECAM_ANYMASK and DECAM_ALLMASK bit masks are defined as follows
from the CP Data Quality bits:

=== =======
Bit Name
=== =======
  0 badpix
  1 satur
  2 interp
  4 cr
  6 bleed
  7 trans
  8 edge
  9 edge2
=== =======

Goodness-of-Fits
================

The DCHISQ values represent the penalized |chi|\ |sup2| of all the pixels compared to
various models.  This 4-element vectorcontains the |chi|\ |sup2| difference between
the best-fit point source, deVauc model, exponential model, and a composite model.
The number of degrees of freedom to include as a penalty to these |chi|\ |sup2| values
are 2 for a point source (ra,dec), 5 for the deVauc or exp model, and 9 for the composite model.

The DECAM_RCHI2 values are interpreted as the reduced |chi|\ |sup2| pixel-weighted by the model fit,
computed as the following sum over pixels in the blob for each object:

.. math::
    \chi^2 = \frac{\sum \left[ \left(\mathrm{image} - \mathrm{model}\right)^2 \times \mathrm{model} \times \mathrm{inverse\, variance}\right]}{\sum \left[ \mathrm{model} \right]}

The above sum is over all images contributing to a particular filter.
The above can be negative-valued for sources that have a flux measured as negative in some bands
where they are not detected.

SDSS_TREATED_AS_POINTSOURCE indicated whether an object was initialized as an SDSS point source
(if "T") or galaxy (if "F").  This is based upon the SDSS morphological classifications, where SDSS_OBJTYPE=6
indicates a point source and =3 indicates a galaxy.  However, SDSS_TREATED_AS_POINTSOURCE is also set
to "T" for sources satisfying any of the following conditions: the effective radius is measured as S/N less than 3,
sources with very large flux, the effective radius reported is the largest allowed, or the effective radius S/N is
larger than expected given the measured flux of the objects.  These are almost the same conditions as
described in Lang et al 2014 (http://arxiv.org/abs/1410.7397), and are further described there.

Galactic Extinction Coefficients
================================

The Galactic extinction values are derived from the SFD98 maps, but with updated coefficients to
convert E(B-V) to the extinction in each filter.  These are reported in linear units of transmission,
with 1 representing a fully transparent region of the Milky Way and 0 representing a fully opaque region.
The value can slightly exceed unity owing to noise in the SFD98 maps, although it is never below 0.

Extinction coefficients for the SDSS filters have been changed to the values recommended
by Schlafly & Finkbeiner 2011 (http://arxiv.org/abs/1012.4804 ; Table 4) using the Fizpatrick 1999
extinction curve at R_V = 3.1 and their improved overall calibration of the SFD98 maps.
These coefficients are A / E(B-V) = 4.239,  3.303,  2.285,  1.698,  1.263 in ugriz,
which are different from those used in SDSS-I,II,III, but are the values used for SDSS-IV/eBOSS target selection.

Extinction coefficients for the DECam filters also use the Schlafly & Finkbeiner 2011 values,
with u-band computed using the same formulae and code at airmass 1.3 (Schlafly, priv. comm. decam-data list on 11/13/14).
These coefficients are A / E(B-V) = 3.995, 3.214, 2.165, 1.592, 1.211, 1.064.
(These are slightly different than the ones in Schlafly & Finkbeiner (http://arxiv.org/abs/1012.4804).)

The coefficients for the four WISE filters are derived from Fitzpatrick 1999, as recommended by Schafly & Finkbeiner,
considered better than either the Cardelli et al 1989 curves or the newer Fitzpatrick & Massa 2009 NIR curve not vetted beyond 2 micron).
These coefficients are A / E(B-V) = 0.184,  0.113, 0.0241, 0.00910.

Ellipticities
=============

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

** ??? In the catalogs sometimes AB is used to mean b/a.  We need to define this
explicitly. ??? **

Debugging Tags to Remove in the Future
======================================

The following are from the SDSS DR13 catalogs, to be released in 2015
as the SDSS-IV/eBOSS target selection catalogs.

=========================== ============ ===================== ===============================================
Name                        Type         Units                 Description
=========================== ============ ===================== ===============================================
SDSS_RUN                    int32                              http://data.sdss3.org/datamodel/files/BOSS_PHOTOOBJ/RERUN/RUN/CAMCOL/photoObj.html
SDSS_CAMCOL                 byte
SDSS_FIELD                  int32
SDSS_ID                     int32
SDSS_OBJID                  int64
SDSS_PARENT                 int32
SDSS_NCHILD                 int32
SDSS_OBJC_TYPE              int64
SDSS_OBJC_FLAGS             int64
SDSS_OBJC_FLAGS2            int64
SDSS_FLAGS                  int64[5]
SDSS_FLAGS2                 int64[5]
SDSS_TAI                    float64[5]
SDSS_RA                     float64
SDSS_DEC                    float64
SDSS_PSF_FWHM               float32[5]
SDSS_MJD                    int64
SDSS_THETA_DEV              float32[5]
SDSS_THETA_DEVERR           float32[5]
SDSS_AB_DEV                 float32[5]
SDSS_AB_DEVERR              float32[5]
SDSS_THETA_EXP              float32[5]
SDSS_THETA_EXPERR           float32[5]
SDSS_AB_EXP                 float32[5]
SDSS_AB_EXPERR              float32[5]
SDSS_FRACDEV                float32[5]
SDSS_PHI_DEV_DEG            float32[5]
SDSS_PHI_EXP_DEG            float32[5]
SDSS_PSFFLUX                float32[5]
SDSS_PSFFLUX_IVAR           float32[5]
SDSS_CMODELFLUX             float32[5]
SDSS_CMODELFLUX_IVAR        float32[5]
SDSS_MODELFLUX              float32[5]
SDSS_MODELFLUX_IVAR         float32[5]
SDSS_DEVFLUX                float32[5]
SDSS_DEVFLUX_IVAR           float32[5]
SDSS_EXPFLUX                float32[5]
SDSS_EXPFLUX_IVAR           float32[5]
SDSS_EXTINCTION             float32[5]
SDSS_CALIB_STATUS           int64[5]
SDSS_RESOLVE_STATUS         int64
=========================== ============ ===================== ===============================================


Tags to Add in the Future
=========================

=========================== ============ ===================== ===============================================
Name                        Type         Units                 Description
=========================== ============ ===================== ===============================================
TAI_MIN                     float64      sec                   TAI timestamp for the earliest DECam image contributing to this brick (any filter)
TAI_MAX                     float64      sec                   TAI timestamp for the latest DECam image contributing to this brick (any filter)
EPOCH                       float64      year                  Epoch for RA,DEC coordinates, equal to the Julian Date of observation if only 1 epoch
PM_RA                       float32      mas/year              Proper motion in RA (actual milli-arcsec per year, not cos(dec) units as done in Hipparcos catalog
PM_RA_IVAR                  float32      1/(mas/year)\ |sup2|  Inverse variance of PM_RA
PM_DEC                      float32      mas/year              Proper motion in DEC
PM_DEC_ISIG                 float32      1/(mas/year)\ |sup2|  Inverse variance of PM_DEC
PARALLAX                    float32      mas                   Trigonometric parallax in milliarcsec; distance in parsecs equals 1000/PARALLAX
PARALLAX_IVAR               float32      1/mas\ |sup2|         Inverse variance of PARALLAX
=========================== ============ ===================== ===============================================


Measurement Catalogs
====================

This is the forced photometry model fluxes on individual frames.  The object coordinates, classification,
and shape parameters are fixed.  Only the amplitude of the fluxes are fit, and are unconstrained
(*e.g.*, they can go negative).

=========================== ============ ===================== ===============================================
Name                        Type         Units                 Description
=========================== ============ ===================== ===============================================
BRICKID                     int64                              Brick ID [1,662174]
BRICKNAME                   char                               Name of brick, encoding the brick sky position
OBJID                       int64                              Catalog object number within this brick; a unique identifier hash is BRICKID,OBJID
FILTER                      char[1]                            Filter name, which will be 'g', 'r', or 'z' for DECam files or 'W1', 'W2', 'W3' or 'W4' for WISE files
TAI                         float64      sec                   International Atomic Time timestamp for start of observation
EXPTIME                     float64      sec                   Exposure time; shutter open from [TAI,TAI+EXPTIME]
X                           float32      pix                   X coordinate center from 0-indexed lower-left of image; not measured but projected from the object catalog
Y                           float32      pix                   X coordinate center from 0-indexed lower-left of image; not measured but projected from the object catalog
FLUX                        float32      nanomaggies           Model flux
FLUX_IVAR                   float32      1/nanomaggies\ |sup2| Inverse variance oF FLUX
FRACFLUX                    float32                            Profile-weight fraction of the flux from other sources divided by the total flux (typically [0,1])
RCHI2                       float32                            Profile-weighted |chi|\ |sup2| of model fit normalized by the number of pixels
=========================== ============ ===================== ===============================================

Notes
-----

* The RCHI2 is different from the PROCHI2 and PRONPIX in the WISE Tractor catalog, since the
  latter only had one stacked image from which it was measuring.  Here, the measurement can be from
  multiple images (and in principle those images could have different pixel scales).
* FRACFLUX would be >1 in the WISE Tractor catalog if
  neighbors contribute more than the object.  This is computed from the
  models only, not the actual image flux.
* We may replace the ellipse parameters R, AB, PHI with a
  different parameterization, such as R, G1, G2 (shear parameters)
  often used by weak lensers.  Question: Which has less covariance?
* Timestamps would normally be associated with the image, but for SDSS it's also a function of row number.
  That would be the argument to attach the timestamps to each individual measurement rather than image.
