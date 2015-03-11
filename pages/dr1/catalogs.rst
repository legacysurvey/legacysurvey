= DR1 Tractor Catalog format =

|| '''Field''' || '''Format''' || '''Unit''' || '''Description''' ||
|| BRICKID || LONG || || Brick ID ![1,662174] ||
|| BRICKNAME || STRING || || Name of brick, encoding the brick sky position ||
|| OBJID || LONG || || Catalog object number within this brick; a unique identifier hash is BRICKID,OBJID;  OBJID spans [0,N-1] and is contiguously enumerated within each blob ||
|| RA || DOUBLE  || deg || Right ascension at epoch J2000 ||
|| RA_IVAR || FLOAT || 1/deg^2^ || Inverse variance of RA, excluding astrometric calibration errors ||
|| DEC || DOUBLE  || deg || Declination at epoch J2000 ||
|| DEC_IVAR || FLOAT || 1/deg^2^ || Inverse variance of DEC, excluding astrometric calibration errors ||
|| TYPE || STRING || || Morphological model: PSF=stellar, EXP=exponential, DEV=deVauc, COMP=composite ||
|| BX || FLOAT || pix || X position (0-indexed) of coordinates in brick image stack ||
|| BY || FLOAT || pix || Y position (0-indexed) of coordinates in brick image stack ||
|| TX || FLOAT || pix || Initialized X position (0-indexed) of coordinates in brick image stack ??? ||
|| TY || FLOAT || pix || Initialized Y position (0-indexed) of coordinates in brick image stack ??? ||
|| BRICK_PRIMARY || STRING || || "T" if the object is within the brick boundary ||
|| BLOB || LONG || || Blend family; objects with the same [BRICKID,BLOB] identifier were modeled (deblended) together; contiguously numbered from 0 ||
|| DCHISQ || FLOAT![4] ||  || Difference in chi^2^ between successfully more-complex model fits ||
|| DECAM_RCHI2 || FLOAT![6] || || Profile-weighted chi^2^ of model fit normalized by the number of pixels ||
|| DECAM_FRACFLUX || FLOAT![6] || || Profile-weight fraction of the flux from other sources divided by the total flux (typically [0,1])  ||
|| DECAM_FRACMASKED || FLOAT || || Profile-weighted raction of pixels masked from all observations of this object, strictly between [0,1] ||
|| DECAM_NOBS || INT![6] || || Number of images that contribute to the central pixel in each filter for this object (not profile-weighted) ||
|| DECAM_FLUX || FLOAT![6] || nanomaggies || DECam model flux in ugrizY ||
|| DECAM_FLUX_IVAR || FLOAT![6] || 1/nanomaggies^2^ || Inverse variance oF DECAM_FLUX ||
|| DECAM_APFLUX || FLOAT![8,6] || nanomaggies || DECam aperture fluxes on the co-added images in apertures of radius  [0.5,0.75,1.0,1.5,2.0,3.5,5.0,7.0] arcsec in ugrizY ||
|| DECAM_APFLUX_RESID || FLOAT![8,6] || nanomaggies || DECam aperture fluxes on the co-added residual images ||
|| DECAM_APFLUX_IVAR || FLOAT![8,6] || 1/nanomaggies^2^ || Inverse variance oF DECAM_APFLUX ||
|| FRACDEV || FLOAT || || Fraction of model in deVauc [0,1] ||
|| FRACDEV_IVAR || FLOAT || || Inverse variance of FRACDEV  ||
|| SHAPEEXP_R || FLOAT || arcsec || Half-light radius of exponential model (>0) ||
|| SHAPEEXP_R_IVAR || FLOAT || 1/arcsec^2^ || Inverse variance of R_EXP ||
|| SHAPEEXP_E1 || FLOAT ||  || Ellipticity component 1 ||
|| SHAPEEXP_E1_IVAR || FLOAT ||  || Inverse variance of SHAPEEXP_E1 ||
|| SHAPEEXP_E2 || FLOAT ||  || Ellipticity component 2 ||
|| SHAPEEXP_E2_IVAR || FLOAT ||  || Inverse variance of SHAPEEXP_E2 ||
|| SHAPEDEV_R || FLOAT || arcsec || Half-light radius of deVaucouleurs model (>0) ||
|| SHAPEDEV_R_IVAR || FLOAT || 1/arcsec || Inverse variance of R_DEV ||
|| SHAPEDEV_E1 || FLOAT ||  || Ellipticity component 1 ||
|| SHAPEDEV_E1_IVAR || FLOAT ||  || Inverse variance of SHAPEDEV_E1 ||
|| SHAPEDEV_E2 || FLOAT ||  || Ellipticity component 2 ||
|| SHAPEDEV_E2_IVAR || FLOAT ||  || Inverse variance of SHAPEDEV_E2 ||
|| SDSS_TREATED_AS_POINTSOURCE || BYTE ||  || "T" if initialized as a point source from SDSS, "F" if initialized as a galaxy from SDSS ||
|| DECAM_MW_TRANSMISSION || FLOAT![6] || mag || Galactic transmission in ugrizY filters in linear units [0,1] ||
|| WISE_FLUX || FLOAT![4] || nanomaggies || WISE model flux in W1,W2,W3,W4 ||
|| WISE_FLUX_IVAR || FLOAT![4] || 1/nanomaggies^2^ || Inverse variance of WISE_FLUX ||
|| WISE_NOBS || FLOAT![4] || || Number of images that contribute to the central pixel in each filter for this object (not profile-weighted) }}
|| WISE_FRACFLUX || FLOAT![4] || || Profile-weight fraction of the flux from other sources divided by the total flux (typically [0,1])  ||
|| WISE_RCHI2 || FLOAT![4] || || Profile-weighted chi^2^ of model fit normalized by the number of pixels ||
|| WISE_MW_TRANSMISSION || FLOAT![4] || mag || Galactic transmission in W1,W2,W3,W4 filters in linear units [0,1] ||
|| EBV || FLOAT || mag || Galactic extinction E(B-V) reddening from SFD98, used to compute DECAM_MW_TRANSMISSION and WISE_MW_TRANSMISSION ||


=== Goodness-of-fits ===

The DCHISQ values represent the penalized chi-squared of all the pixels compared to
various models.  This 4-element vectorcontains the chi-squared difference between
the best-fit point source, deVauc model, exponential model, and a composite model.
The number of degrees of freedom to include as a penalty to these chi-squared values
are 2 for a point source (ra,dec), 5 for the deVauc or exp model, and 9 for the composite model.

The DECAM_RCHI2 values are interpreted as the reduced chi-squared pixel-weighted by the model fit,
computed as the following sum over pixels in the blob for each object:
{{{
SUM[ (image - model)^2^ * model * ivar] / SUM[ model ]
}}}
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

=== Galactic extinction coefficients ===

The Galactic extinction values are derived from the SFD98 maps, but with updated coefficients to
convert E(B-V) to the extinction in each filter.  These are reported in linear units of transmission,
with 1 representing a fully transparent region of the Milky Way and 0 representing a fully opaque region.
The value can slightly exceed unity owing to noise in the SFD98 maps, although it is never below 0.

Extinction coefficients for the SDSS filters have been changed to the values recommended
by Schlafly & Finkbeiner 2011 (http://arxiv.org/abs/1012.4804 ; Table 4) using the Fizpatrick 1999
extinction curve at R_V_ = 3.1 and their improved overall calibration of the SFD98 maps.  
These coefficients are A / E(B-V) = 4.239,  3.303,  2.285,  1.698,  1.263 in ugriz,
which are different from those used in SDSS-I,II,III, but are the values used for SDSS-IV/eBOSS target selection.

Extinction coefficients for the DECam filters also use the Schlafly & Finkbeiner 2011 values,
with u-band computed using the same formulae and code at airmass 1.3 (Schlafly, priv. comm. decam-data list on 11/13/14).
These coefficients are A / E(B-V) = 3.995, 3.214, 2.165, 1.592, 1.211, 1.064.
(These are slightly different than the ones in Schlafly & Finkbeiner (http://arxiv.org/abs/1012.4804).)

The coefficients for the four WISE filters are derived from Fitzpatrick 1999, as recommended by Schafly & Finkbeiner,
considered better than either the Cardelli et al 1989 curves or the newer Fitzpatrick & Massa 2009 NIR curve not vetted beyond 2 micron).
These coefficients are A / E(B-V) = 0.184,  0.113, 0.0241, 0.00910.

 === Ellipticities ===

Going between `r,e1,e2` and `r,ba,phi`:

{{{
e = hypot(e1, e2)

ab = (1 - e) / (1 + e)
e  = (ba + 1) / (ba - 1)

phi = -rad2deg(arctan2(e2, e1) / 2)
angle = deg2rad(-2 * phi)
e1 = e * cos(angle)
e2 = e * sin(angle)
}}}

== Debugging tags -- possibly remove before DR1 ==

The following are from the SDSS DR13 catalogs, to be released in 2015
as the SDSS-IV/eBOSS target selection catalogs.

|| '''Field''' || '''Format''' || '''Unit''' || '''Description''' ||
|| SDSS_OBJID          || LONG64    || ||
|| SDSS_RA             || DOUBLE    || ||
|| SDSS_DEC            || DOUBLE    || ||
|| SDSS_FRACDEV   || FLOAT[5]  || ||
|| SDSS_OBJC_TYPE || LONG || ||
|| SDSS_THETA_DEV   || FLOAT[5]  || ||
|| SDSS_THETA_DEVERR   || FLOAT[5]  || ||
|| SDSS_AB_DEV   || FLOAT[5]  || ||
|| SDSS_AB_DEVERR   || FLOAT[5]  || ||
|| SDSS_PHI_DEV_DEG   || FLOAT[5]  || ||
|| SDSS_THETA_EXP   || FLOAT[5]  || ||
|| SDSS_THETA_EXPERR   || FLOAT[5]  || ||
|| SDSS_AB_EXP   || FLOAT[5]  || ||
|| SDSS_AB_EXPERR   || FLOAT[5]  || ||
|| SDSS_PHI_EXP_DEG   || FLOAT[5]  || ||
|| SDSS_RESOLVE_STATUS            ||  LONG      || ||
|| SDSS_NCHILD           ||  INT      || ||
|| SDSS_FLAGS || LONG[5] || ||
|| SDSS_OBJC_FLAGS || LONG || ||
|| SDSS_RUN            ||  INT      || ||
|| SDSS_CAMCOL         ||  BYTE     || ||
|| SDSS_FIELD          ||  INT      || ||
|| SDSS_ID             ||  INT      || ||
|| SDSS_PSFFLUX     || FLOAT[5]  || ||
|| SDSS_PSFFLUX_IVAR || FLOAT[5]  || ||
|| SDSS_CMODELFLUX     || FLOAT[5]  || ||
|| SDSS_CMODELFLUX_IVAR|| FLOAT[5]  || ||
|| SDSS_MODELFLUX      || FLOAT[5]  || ||
|| SDSS_MODELFLUX_IVAR || FLOAT[5]  || ||
|| SDSS_DEVFLUX   || FLOAT[5]  || ||
|| SDSS_EXPFLUX_IVAR   || FLOAT[5]  || ||
|| SDSS_EXTINCTION || FLOAT[5] || mag || Galactic extinction in SDSS ugriz filters ||


== Tags to add to the catalogs in the future ==

|| '''Field''' || '''Format''' || '''Unit''' || '''Description''' ||
|| TAI_MIN || DOUBLE || sec || TAI timestamp for the earliest DECam image contributing to this brick (any filter) ||
|| TAI_MAX || DOUBLE || sec || TAI timestamp for the latest DECam image contributing to this brick (any filter) ||
|| EPOCH || DOUBLE || year || Epoch for RA,DEC coordinates, equal to the Julian Date of observation if only 1 epoch ||
|| PM_RA || FLOAT || mas/year || Proper motion in RA (actual milli-arcsec per year, not cos(dec) units as done in Hipparcos catalog ||
|| PM_RA_IVAR || FLOAT || 1/(mas/year)^2^ || Inverse variance of PM_RA ||
|| PM_DEC || FLOAT || mas/year || Proper motion in DEC ||
|| PM_DEC_ISIG || FLOAT || 1/(mas/year)^2^ || Inverse variance of PM_DEC ||
|| PARALLAX || FLOAT || mas || Trigonometric parallax in milliarcsec; distance in parsecs equals 1000/PARALLAX ||
|| PARALLAX_IVAR || FLOAT || 1/mas^2^ || Inverse variance of PARALLAX ||


=== Measurement catalogs ===

This is the forced photometry model fluxes on individual frames.  The object coordinates, classification,
and shape parameters are fixed.  Only the amplitude of the fluxes are fit, and are unconstrained
(e.g., they can go negative).

|| '''Field''' || '''Format''' || '''Unit''' || '''Description''' ||
|| BRICKID || LONG || || Brick ID [1,662174] ||
|| BRICKNAME || STRING[8] || || Name of brick, encoding the brick sky position ||
|| OBJID || LONG || || Catalog object number within this brick; a unique identifier hash is BRICKID,OBJID ||
|| FILTER || STRING ||  || Filter name, which will be 'g', 'r', or 'z' for DECam files or 'W1', 'W2', 'W3' or 'W4' for WISE files ||
|| TAI || DOUBLE || sec || International Atomic Time timestamp for start of observation ||
|| EXPTIME || FLOAT || sec || Exposure time; shutter open from [TAI,TAI+EXPTIME] ||
|| X || FLOAT || pix || X coordinate center from 0-indexed lower-left of image; not measured but projected from the object catalog ||
|| Y || FLOAT || pix || X coordinate center from 0-indexed lower-left of image; not measured but projected from the object catalog ||
|| FLUX || FLOAT || nanomaggies || Model flux ||
|| FLUX_IVAR || FLOAT || 1/nanomaggies^2^ || Inverse variance oF FLUX ||
|| FRACFLUX || FLOAT || || Profile-weight fraction of the flux from other sources divided by the total flux (typically [0,1])  ||
|| RCHI2 || FLOAT || || Profile-weighted chi^2^ of model fit normalized by the number of pixels ||


**Note:** The RCHI2 is different from the PROCHI2 and PRONPIX in the WISE Tractor catalog, since the
latter only had one stacked image from which it was measuring.  Here, the measurement can be from
multiple images (and in principle those images could have different pixel scales).

**NOTE:** FRACFLUX would be >1 in the WISE Tractor catalog if
neighbors contribute more than the object.  This is computed from the
models only, not the actual image flux.

**NOTE:** We may replace the ellipse parameters R, AB, PHI with a
different parameterization, such as R, G1, G2 (shear parameters)
often used by weak lensers.  Question: Which has less covariance?

**Note:** Timestamps would normally be associated with the image, but for SDSS it's also a function of row number.
That would be the argument to attach the timestamps to each individual measurement rather than image.
