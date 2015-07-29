.. title: Legacy Survey Files
.. slug: files
.. tags: mathjax
.. description:

.. |sigma|    unicode:: U+003C3 .. GREEK SMALL LETTER SIGMA
.. |sup2|     unicode:: U+000B2 .. SUPERSCRIPT TWO
.. |chi|      unicode:: U+003C7 .. GREEK SMALL LETTER CHI
.. |delta|    unicode:: U+003B4 .. GREEK SMALL LETTER DELTA
.. |deg|    unicode:: U+000B0 .. DEGREE SIGN
.. |times|  unicode:: U+000D7 .. MULTIPLICATION SIGN
.. |plusmn| unicode:: U+000B1 .. PLUS-MINUS SIGN
.. |Prime|    unicode:: U+02033 .. DOUBLE PRIME

Top level directory for web access:
  http://portal.nersc.gov/project/cosmo/data/legacysurvey/dr1/

Top level directory local to NERSC computers (for collaborators):
  /global/project/projectdirs/cosmo/data/legacysurvey/dr1/

Summary Files
=============

decals-bricks.fits
------------------

FITS binary table with the RA, DEC bounds of each geometrical "brick" on the sky.
The subset of bricks which have g-, r-, or z-band imaging in this data release
can be identified using the ``has_image_g``, ``has_image_r``, and ``has_image_z`` tags,
respectively.  The bricks with a corresponding Tractor photometric catalog in
this release can be identified using the ``has_catalog`` tag.

=============== ======= =========================================
Column          Type    Description
=============== ======= =========================================
``brickname``   char[8] Name of the brick.
``brickid``     int32   Is this a unique integer that can be used as a primary key?
``brickq``      int16   A "priority" factor used for processing.
``brickrow``    int32   Dec row number
``brickcol``    int32   Number of the brick within a Dec row.
``ra``          double  RA of the center of the brick.
``dec``         double  Dec of the center of the brick.
``ra1``         double  Lower RA boundary.
``ra2``         double  Upper RA boundary.
``dec1``        double  Lower Dec boundary.
``dec2``        double  Upper Dec boundary.
``has_image_g`` byte    This brick has imaging data in this band.
``has_image_r`` byte    This brick has imaging data in this band.
``has_image_z`` byte    This brick has imaging data in this band.
``has_catalog`` byte    This brick has Tractor photometry.
=============== ======= =========================================


decals-ccds.fits
----------------

FITS binary table with almanac information (seeing, sky-brighness, etc.) about
each individual CCD image.  The subset of CCDs included in this release can be
identified using the DR1 tag.

decals-specz.fits
-----------------

Merged photometric and spectroscopic catalog for 751,070 sources with
spectroscopic redshifts from SDSS/DR12.  This file is a binary FITS table with 4
extensions (HDUs).  Each extension contains the following row-matched catalogs:

- HDU1 - DECaLS photometry and related Tractor outputs
- HDU2 - SDSS/DR12 spectroscopy (http://data.sdss3.org/sas/dr12/sdss/spectro/redux/specObj-dr12.fits )
- HDU3 - SDSS/DR12 photometry (http://data.sdss3.org/sas/dr12/sdss/spectro/redux/photoPosPlate-dr12.fits)
- HDU4 - WISE forced photometry (http://unwise.me)

Tractor Catalogs
================

tractor/<AAA>/tractor-<brick>.fits
----------------------------------

FITS binary table containing Tractor photometry, documented here:
http://legacysurvey.org/dr1/catalogs/.

Sweep Catalogs
==============

tractor-sweep-<AAA>.fits
------------------------

Light-weight FITS binary tables (containing a subset of the most commonly used
Tractor measurements) of all the Tractor catalogs in a given degree of right
ascension <AAA>.

Image Stacks
============

coadd/<AAA>/<brick>/decals-<brick>-ccds.fits
--------------------------------------------

FITS binary table with the list of CCD images that were used in this brick.
EXPNUM indicates the DECam exposure ID and FILTER indicates the filter (u,g,r).

coadd/<AAA>/<brick>/decals-<brick>-image-<filter>.fits
------------------------------------------------------

Stacked image centered on a brick location covering 0.25\ |deg| |times| 0.25\
|deg|.  The primary HDU contains the coadded image (simple unweighted coadd), in
units of nano-maggies per pixel.

- NOTE: These are not the images used by Tractor, which operates on the
  single-epoch images.

coadd/<AAA>/<brick>/decals-<brick>-invvar-<filter>.fits
-------------------------------------------------------

Corresponding stacked inverse variance image based on the sum of the
inverse-variances of the individual input images in units of 1/(nano-maggies)\
|sup2| per pixel.

- NOTE: These are not the inverse variance maps used by Tractor, which operates
  on the single-epoch images.

coadd/<AAA>/<brick>/decals-<brick>-model-<filter>.fits.gz
---------------------------------------------------------

Stacked model image centered on a brick location covering 0.25\ |deg| |times| 0.25\ |deg|.

- The Tractor's idea of what the coadded images should look like; the Tractor's model prediction.

coadd/<AAA>/<brick>/decals-<brick>-chi2-<filter>.fits
-----------------------------------------------------

Stacked |chi|\ |sup2| image, which is approximately the summed |chi|\ |sup2| values from the single-epoch images.

coadd/<AAA>/<brick>/decals-<brick>-depth-<filter>.fits.gz
---------------------------------------------------------

Stacked depth map in units of the point-source inverse-variance at each pixel.

- The 5\ |sigma| point-source depth can be computed as 5 / sqrt(depth_ivar) .

coadd/<AAA>/<brick>/decals-<brick>-nexp-<filter>.fits.gz
--------------------------------------------------------

Number of exposures contributing to each pixel of the stacked images.

coadd/<AAA>/<brick>/decals-<brick>-image.jpg
--------------------------------------------

JPEG image of calibrated image using the g,r,z filters as the colors.

coadd/<AAA>/<brick>/decals-<brick>-model.jpg
--------------------------------------------

JPEG image of the Tractor's model image using the g,r,z filters as the colors.

coadd/<AAA>/<brick>/decals-<brick>-resid.jpg
--------------------------------------------

JPEG image of the residual image (data minus model) using the g,r,z filters as
the colors.
