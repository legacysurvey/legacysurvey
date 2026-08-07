.. title: Data Release Description
.. slug: description
.. tags: 
.. has_math: yes

.. |sigma|    unicode:: U+003C3 .. GREEK SMALL LETTER SIGMA
.. |sup2|     unicode:: U+000B2 .. SUPERSCRIPT TWO
.. |alpha|      unicode:: U+003B1 .. GREEK SMALL LETTER ALPHA
.. |chi|      unicode:: U+003C7 .. GREEK SMALL LETTER CHI
.. |delta|    unicode:: U+003B4 .. GREEK SMALL LETTER DELTA
.. |deg|    unicode:: U+000B0 .. DEGREE SIGN
.. |times|  unicode:: U+000D7 .. MULTIPLICATION SIGN
.. |plusmn| unicode:: U+000B1 .. PLUS-MINUS SIGN
.. |Prime|    unicode:: U+02033 .. DOUBLE PRIME
.. |geq|    unicode:: U+02265 .. GREATER THAN OR EQUAL TO

.. class:: pull-right well

.. contents::


The DESI Legacy Surveys team is producing an inference model of the extragalactic sky in the optical and
infrared. The original Legacy Surveys (`MzLS`_, `DECaLS`_ and `BASS`_) conducted dedicated observations
of ~14,000 square degrees of extragalactic sky visible from the northern hemisphere in three optical bands
(:math:`g,r,z`), which was augmented with four infrared bands from `NEOWISE`_.
To achieve this goal, the Legacy Surveys completed
three imaging projects on different telescopes, described in more depth at the following links:

- *The Beijing-Arizona Sky Survey* (`BASS`_)
- *The DECam Legacy Survey* (`DECaLS`_)
- *The Mayall z-band Legacy Survey* (`MzLS`_)

As of DR11, the Legacy Surveys inference model is being self-consistently expanded to > 20,000 square
degrees by incorporating additional DECam data from NOIRLab that includes extra
optical bands (:math:`g,r,i,z`):

- *Additional Public Data from NOIRLab* (`NOIRLab Astro Data Archive`_)

Note that the only new data included for DR11 is in the southern region of the Legacy Surveys, referred to
as ``region=<south>`` in the data model. The northern region (``region=<north>``) only includes reductions of data
already included as part of `DR9`_. For this reason, DR11 of the Legacy Surveys does not include :math:`i`-band data
for ``region=<north>``.

An overview of the Legacy Surveys is available in `Dey et al. (2019)`_.

.. _`Dey et al. (2019)`: https://ui.adsabs.harvard.edu/abs/2019AJ....157..168D/abstract
.. _`BASS`: ../../bass
.. _`DECaLS`: ../../decamls
.. _`MzLS`: ../../mzls
.. _`Legacypipe`: https://github.com/legacysurvey/legacypipe
.. _`Tractor`: https://github.com/dstndstn/tractor
.. _`NOIRLab Community Pipeline`: https://nsf-noirlab.gitlab.io/csdc/csdc-mso-docs/PL201/
.. _`Ceres solver`: http://ceres-solver.org
.. _`SciPy`: https://www.scipy.org
.. _`mixture-of-Gaussians`: https://arxiv.org/abs/1210.6563
.. _`Mixture-of-Gaussians`: https://arxiv.org/abs/1210.6563
.. _`SFD98`: https://ui.adsabs.harvard.edu/abs/1998ApJ...500..525S/abstract
.. _`recommended conversions by the WISE team`: http://wise2.ipac.caltech.edu/docs/release/allsky/expsup/sec4_4h.html#conv2ab
.. _`Gaia Data Release 2`: https://gaia.esac.esa.int/documentation/GDR2/index.html
.. _`Gaia Data Release 3`: https://gaia.esac.esa.int/documentation/GDR3/index.html
.. _`DR11`: ../../dr11
.. _`DR10`: ../../dr10
.. _`DR9`: ../../dr9
.. _`DR8`: ../../dr8
.. _`DR7`: ../../dr7
.. _`DR6`: ../../dr6
.. _`DR5`: ../../dr5
.. _`DR4`: ../../dr4
.. _`DR3`: ../../dr3
.. _`DESI`: https://desi.lbl.gov
.. _`WISE`: http://wise.ssl.berkeley.edu
.. _`year 11 of NEOWISE-Reactivation`: https://irsa.ipac.caltech.edu/data/WISE/docs/release//NEOWISE/
.. _`survey program 0404`: https://legacy.noirlab.edu/perl/abstract?2014B-0404
.. _`survey program 2014B-0404`: https://noirlab.edu/science/observing-noirlab/approved-survey-programs
.. _`Dark Energy Survey`: https://www.darkenergysurvey.org
.. _`Proposal IDs`: ../files/dr10-propids.txt
.. _`NOIRLab Astro Data Archive`: https://noirlab.edu/public/projects/astrodataarchive/
.. _`NEOWISE`: https://wise2.ipac.caltech.edu/docs/release/neowise/
.. _`DeROSITA Survey`: https://noirlab.edu/science/programs/ctio/instruments/Dark-Energy-Camera/DeROSITAS
.. _`BLISS+`: https://arxiv.org/abs/1812.06318
.. _`DELVE Survey`: https://delve-survey.github.io

Contents of DR11
================

Data Release 11 (DR11) is the eleventh public data release of the Legacy Surveys. The dedicated observations that
comprised `DECaLS`_, `BASS`_ and `MzLS`_ were complete as of `DR9`_. In DR11, we focus, instead, on incorporating
new imaging from DECam into the "southern" (Declination :math:`\leq` 32.375\ |deg|) Legacy Surveys footprint; continuing to extend the footprint while also providing
a consistent inference model of imaging over much of the sky. Notably, DR11 of the Legacy Surveys continues in the vein of `DR10`_
by providing :math:`i\hbox{-}\mathrm{band}` observations in the southern region of the survey. Imaging from the Legacy Surveys is
reduced through the `NOIRLab Community Pipeline`_ before being processed using the `Legacypipe`_ pipeline. DR11 also
includes `WISE`_ fluxes from all imaging through `year 11 of NEOWISE-Reactivation`_
force-photometered in the `unWISE`_ maps at the locations of Legacy Surveys optical sources.

DR11 includes :math:`g,r,i,z`-band DECam observations from a range of `DECaLS`_ and
non-DECaLS surveys, including observations that were conducted between 31st August 2013 and 11th September 2024. The bulk
of these additional DECam observations are from the `Dark Energy Survey`_ (including the full six years of the survey);
the `DELVE Survey`_, and the `DeROSITA Survey`_.
Information on the exact observations included in DR11 can be derived from
the Legacy Surveys `survey-ccds-* files`_. To obtain northern observations from `BASS`_ and `MzLS`_, see `DR9`_ of the Legacy Surveys.

The table below indicates the area covered in DR11 for different numbers of passes and in different filters. These estimates
are derived from the geometry of the CCDs that contribute to the Legacy Surveys footprint, using the `random catalogs`_ at a density of 10,000 |d-2|.

===================== =========== =========== ===========
Band/Number of Passes |geq| 1     |geq| 2     |geq| 3
===================== =========== =========== ===========
:math:`g`-band        30,255 |d2| 28,815 |d2| 24,500 |d2|
:math:`r`-band        29,656 |d2| 27,702 |d2| 22,941 |d2|
:math:`i`-band        24,415 |d2| 22,335 |d2| 18,926 |d2|
:math:`z`-band        30,516 |d2| 28,748 |d2| 24,675 |d2|
All bands jointly     22,731 |d2| 18,845 |d2| 13,010 |d2|
===================== =========== =========== ===========

Past data releases have strictly defined the northern and southern portions of the Legacy Surveys to prevent double-counting of area
in regions covered by multiple surveys. Typically, the Legacy Surveys has defined locations at Dec :math:`\geq` 32.375\ |deg| `and`
that are north of the Galactic Plane as "northern" for `BASS`_/`MzLS`_ imaging and locations at Dec <  32.375\ |deg| `or` that are
south of the Galactic Plane as "southern" for DECam imaging. Under this stricter definition, DR11 covers:

===================== =========== =========== ===========
Band/Number of Passes |geq| 1     |geq| 2     |geq| 3
===================== =========== =========== ===========
:math:`g`-band        25,384 |d2| 23,995 |d2| 20,316 |d2|
:math:`r`-band        24,795 |d2| 22,895 |d2| 18,760 |d2|
:math:`i`-band        24,415 |d2| 22,335 |d2| 18,926 |d2|
:math:`z`-band        25,673 |d2| 23,939 |d2| 20,480 |d2|
All bands jointly     22,731 |d2| 18,845 |d2| 13,010 |d2|
===================== =========== =========== ===========

.. |d2| replace:: deg\ :sup:`2`
.. |d-2| replace:: deg\ :sup:`-2`

DR11 includes a variety of pixel-level and catalog-level products, which are described in more
detail on the `files`_ page.
The size of the DR11 data distribution is:

================== ================================================= =========================================================
Size*              Directory                                         Description
================== ================================================= =========================================================
1.7 TB             `calib/`_                                         Calibration files
5.5 GB             `masking/`_                                       Files containing `external catalogs used for masking`_
12 TB +  TB        `north/coadd/`_ + `south/coadd/`_                 Coadded images (image stacks)
23 GB + 25 GB      `north/external/`_ + `south/external/`_           `Matches to other catalogs`_ (SDSS, etc.)
16 GB + 103 GB     `north/logs/`_ + `south/logs/`_                   Log files generated by `Tractor`_ processing
1.5 TB + 7.9 TB    `north/metrics/`_ + `south/metrics/`_             Metrics and statisics of Tractor fits
801 GB	           `randoms/`_                                       Catalogs of random points
95 GB +  429 GB     `north/randoms/`_ + `south/randoms/`_             Region-specific catalogs of random points
1.0 TB + 9.5 TB    `north/sweep/`_ + `south/sweep/`_                 Subsets of the Tractor `catalogs`_ and row-by-row matched products
1.1 TB + 9.9 TB    `north/tractor/`_ + `south/tractor/`_             The Tractor `catalogs`_
1.1 TB + 9.4 TB    `north/tractor-i/`_ + `south/tractor-i/`_         Expanded versions of the Tractor `catalogs`_
================== ================================================= =========================================================

.. _`Matches to other catalogs`: ../files/#external-match-files-south-external

\*Note that although the *contents* of a directory should be fixed for each Data Release, the *size* of a directory can change. This is typically due to updated file compression. So, the listed directory sizes should be viewed as (very reasonable) estimates.

.. _`calib/`: https://portal.nersc.gov/cfs/cosmo/data/legacysurvey/dr11/calib/
.. _`masking/`: https://portal.nersc.gov/cfs/cosmo/data/legacysurvey/dr11/masking/
.. _`external catalogs used for masking`: ../external/#external-catalogs-used-for-masking
.. _`randoms/`: https://portal.nersc.gov/cfs/cosmo/data/legacysurvey/dr11/randoms/
.. _`south/coadd/`: https://portal.nersc.gov/cfs/cosmo/data/legacysurvey/dr11/south/coadd/
.. _`south/external/`: https://portal.nersc.gov/cfs/cosmo/data/legacysurvey/dr11/south/external/
.. _`south/logs/`: https://portal.nersc.gov/cfs/cosmo/data/legacysurvey/dr11/south/logs/
.. _`south/metrics/`: https://portal.nersc.gov/cfs/cosmo/data/legacysurvey/dr11/south/metrics/
.. _`south/randoms/`: https://portal.nersc.gov/cfs/cosmo/data/legacysurvey/dr11/south/randoms/
.. _`south/sweep/`: https://portal.nersc.gov/cfs/cosmo/data/legacysurvey/dr11/south/sweep/
.. _`south/tractor/`: https://portal.nersc.gov/cfs/cosmo/data/legacysurvey/dr11/south/tractor/
.. _`south/tractor-i/`: https://portal.nersc.gov/cfs/cosmo/data/legacysurvey/dr11/south/tractor-i/
.. _`north/coadd/`: https://portal.nersc.gov/cfs/cosmo/data/legacysurvey/dr11/north/coadd/
.. _`north/external/`: https://portal.nersc.gov/cfs/cosmo/data/legacysurvey/dr11/north/external/
.. _`north/logs/`: https://portal.nersc.gov/cfs/cosmo/data/legacysurvey/dr11/north/logs/
.. _`north/metrics/`: https://portal.nersc.gov/cfs/cosmo/data/legacysurvey/dr11/north/metrics/
.. _`north/randoms/`: https://portal.nersc.gov/cfs/cosmo/data/legacysurvey/dr11/north/randoms/
.. _`north/sweep/`: https://portal.nersc.gov/cfs/cosmo/data/legacysurvey/dr11/north/sweep/
.. _`north/tractor/`: https://portal.nersc.gov/cfs/cosmo/data/legacysurvey/dr11/north/tractor/
.. _`north/tractor-i/`: https://portal.nersc.gov/cfs/cosmo/data/legacysurvey/dr11/north/tractor-i/
.. _`survey-ccds-decam-dr11.fits.gz files`: ../files/#survey-ccds-decam-dr11-fits-gz

For all of the DESI Legacy Imaging Surveys, coadded images and
Tractor catalogs are presented in "bricks" of approximate
size 0.25\ |deg| |times| 0.25\ |deg|.  Each brick is defined in terms of a box in RA,Dec
coordinates.  The `image stacks`_ use a simple tangent-plane (WCS TAN)
projection around the brick center. The projections for the :math:`g,r,i,z` filters are identical, with
a pixel scale of 0.262\ |Prime|/pix. The projections for the four WISE filters are also identical
but with a pixel scale of 2.75\ |Prime|/pix.
There are 662,174 bricks spread over the sky, meaning that each brick has an average
area of 0.0623 deg\ :sup:`2`\ . The brick images have some overlap.

There are approximately 3.9 billion unique sources in DR11 spread over 517,550 unique bricks.

Obtaining Images and Raw Data
=============================

Images for the Legacy Surveys can be viewed directly using `the Sky viewer`_
and raw data can be obtained through `the NOIRLab portal`_ (see also the information near
`the bottom of the files`_ page). Note that the weight map images (the ``oow`` files) that can be retrieved either from the viewer or
portal are in the same units as :math:`1/\mathtt{skyrms}^2` in the `survey-ccds-decam-dr11.fits.gz files`_.

Sections of the Legacy Surveys for DR11 can be obtained as JPEGs or FITS files using
the cutout service, for example, as follows:

JPEG: https://www.legacysurvey.org/viewer/jpeg-cutout?ra=190.1086&dec=1.2005&layer=ls-dr11&pixscale=0.262

FITS: https://www.legacysurvey.org/viewer/fits-cutout?ra=190.1086&dec=1.2005&layer=ls-dr11&pixscale=0.262&bands=griz

This will merge the northern (MzLS+BASS) and southern (DECam) images at a line corresponding to Dec=32.375\ |deg|.

DR11 includes images in the (:math:`i`) band, so it uses a different color mapping for JPEG images in the DECam footprint.
(The DR9-north footprint still uses the (:math:`g,r,z`) color mapping.)  To use only the (:math:`g,r,z`) bands used in previous
data releases for the DECam data, you can set `layer=ls-dr11-grz`.

To request images from only the northern or southern surveys, specify `dr9-north` or `dr11-south`, for example:

JPEG (`DECaLS`_): https://www.legacysurvey.org/viewer/jpeg-cutout?ra=190.1086&dec=1.2005&layer=ls-dr11-south&pixscale=0.262

FITS (`DECaLS`_): https://www.legacysurvey.org/viewer/fits-cutout?ra=190.1086&dec=1.2005&layer=ls-dr11-south&pixscale=0.262&bands=grz

JPEG (`BASS`_/`MzLS`_): https://www.legacysurvey.org/viewer/jpeg-cutout?ra=154.7709&dec=46.4537&layer=ls-dr9-north&pixscale=0.262

FITS (`BASS`_/`MzLS`_): https://www.legacysurvey.org/viewer/fits-cutout?ra=154.7709&dec=46.4537&layer=ls-dr9-north&pixscale=0.262&bands=grz

where "bands" is a string such as ":math:`griz`",":math:`gz`",":math:`g`", etc.

Replacing `layer=ls-dr11` (or, e.g., `layer=ls-dr9-north`) with `layer=ls-dr11-model` (`layer=ls-dr9-north-model`)
or `layer=ls-dr11-resid` (`layer=ls-dr9-north-resid`) will instead return cutouts for the model and residual images, respectively.

The size of the image can also be specified using :math:`width`, :math:`height` and :math:`size`,
where :math:`size` forces :math:`width` and :math:`height` to be equal. For example:

https://www.legacysurvey.org/viewer/jpeg-cutout?ra=190.1086&dec=1.2005&width=100&layer=ls-dr11&pixscale=0.262

https://www.legacysurvey.org/viewer/jpeg-cutout?ra=190.1086&dec=1.2005&height=100&layer=ls-dr11&pixscale=0.262

https://www.legacysurvey.org/viewer/jpeg-cutout?ra=190.1086&dec=1.2005&size=100&layer=ls-dr11&pixscale=0.262

It is possible to retrieve multiple cutouts from the command line using standard utilites such as `wget`_.

The maximum size for cutouts (in number of pixels) is currently 512.
Pixscale=0.262 will return (approximately) the native pixels used by the `Tractor`_.

More examples are available on the `list of URL/cutout patterns that are supported by the viewer`_.

.. _`list of URL/cutout patterns that are supported by the viewer`: https://www.legacysurvey.org/viewer/urls
.. _`wget`: https://www.gnu.org/software/wget/manual/wget.html#Overview
.. _`files`: ../files
.. _`the bottom of the files`: ../files/#raw-data
.. _`survey-ccds-* files`: ../files/#survey-ccds-decam-dr11-fits-gz
.. _`random catalogs`: ../files/#random-catalogs-randoms
.. _`image stacks`: ../files/#image-stacks-south-coadd
.. _`the Sky viewer`: https://www.legacysurvey.org/viewer
.. _`the NOIRLab portal`: https://astroarchive.noirlab.edu/portal/search/#/search-form

Source Detection
================

The source detection uses a PSF- and SED-matched-filter detection on
the stacked images, with a 6\ |sigma| detection limit.
The `Tractor`_ fitting step is initialized with these positions, although
these positions can be changed during the fits and
low-S/N sources can be removed.

For source detection, each image is convolved by its PSF model,
then a weighted stack
of these is created in order to optimize the point-source detection
efficiency.  Next, SED-matched combinations of the three bands are
created, for two SEDs: "flat" (a source with AB color zero), and
"red", a source with AB color :math:`g-r = 1`, :math:`r-z = 1`.  Sources above 6\ |sigma|
are detected in each of these two SED-matched filters, as well as independently in each band.

The locations of the peak fluxes of extracted sources are used to determine where objects
are photometered and how the initial parameters for an object are seeded. When a source is detected
in multiple bands a choice of filter must be made to seed the initial extraction.
Sources detected in other bands beyond the initial filter are only kept if they are
sufficiently separated from an object that was extracted in previous bands.
In `DR4`_, `DR3`_ and earlier data releases,
source detection was run first in :math:`g`, then in :math:`r`, :math:`z`, "flat"
and finally in "red".
Starting with `DR5`_, source detection
was run first in :math:`z`, then in :math:`r`, :math:`g`, "flat"
and finally in "red". :math:`z` was chosen as the "primary" detection image
to take advantage of the better PSF in that band. DR10 follows the convention of running
source detection in the redder bands first, i.e. in the order
:math:`z`, :math:`i`, :math:`r`, :math:`g`, "flat" and finally "red".

Starting with `DR7`_ the criteria for deciding whether a
flux peak is a distinct source were relaxed. The minimum possible distance between
neighboring peaks was reduced from 6 pixels (about 1.5 arcseconds) to 4 pixels (about 1 arcsecond).
In addition, the "saddle" depth (dip in flux) necessary to model neighboring peaks as
distinct sources was reduced.

Starting with `DR8`_, many different "foreground" objects are extracted as independent sources
in a similar fashion to how `Gaia stars were extracted in DR7`_.
These include bright stars, medium-bright stars, globular clusters and `SGA (Siena Galaxy Atlas)`_ large galaxies
(as detailed on the `external catalogs page`_). The foreground objects consist of pre-defined
geometrical masks (which are elliptical for galaxies) that are
fixed at their expected positions in the Legacy Surveys images after accounting for proper motion
and parallax in Gaia.
The reasoning behind treating bright foreground sources as special cases is that many of them
have large halos or include diffuse light that is not present in the Tractor model choices. This leads such sources
to be typically best-fit by misleading (and computationally expensive) diffuse galaxy models.

Sources that lie inside the boundary of a foreground object have ``MASKBITS``
set (see the `bitmasks page`_). Within the mask regions for bright stars (``BRIGHT``), globular clusters (``CLUSTER``)
and `SGA`_ large galaxies (``GALAXY``), sources are forced to be ``TYPE=PSF``
(except for the `SGA`_ large galaxies themselves). Note that sources are *not* forced to be ``TYPE=PSF`` in the region of *medium*-bright stars
(i.e. if `MEDIUM is set but BRIGHT, CLUSTER, and GALAXY are not`_).
Mask regions are ignored in the `Tractor` local-sky-fitting calibration code and are superseded by fits within the mask regions themselves.
Within ``BRIGHT``, ``MEDIUM`` and ``GALAXY`` mask regions (except for the `SGA`_ large galaxies themselves), a per-source background sky level is fit in the mask blob for each exposure.

Starting with `DR9`_, objects that appear in the `Gaia catalogs`_ are always retained in the `Tractor catalogs`_, even if they would normally be cut by the
model-selection criteria used to detect sources. This is because Gaia sources are often so bright that they saturate in Legacy Surveys imaging.
Since such "retained" Gaia sources have no model fits, their ``flux_g``, ``flux_r``, ``flux_i`` and ``flux_z`` values are estimated in the `catalogs`_,
using `polynomial fits to Gaia-to-DECam`_ color transformations for stars.
Transformations to `DECam`_ are always used (i.e. even in areas of the Legacy Surveys footprint that are only covered by `BASS`_ and `MzLS`_).
The ``flux_ivar_[griz]`` values for these "retained" Gaia sources are set to zero.

.. _`SGA (Siena Galaxy Atlas)`: https://sga.readthedocs.io/en/latest/
.. _`SGA`: https://sga.readthedocs.io/en/latest/
.. _`Siena Galaxy Atlas`: https://sga.readthedocs.io/en/latest/
.. _`bitmasks page`: ../bitmasks
.. _`MEDIUM is set but BRIGHT, CLUSTER, and GALAXY are not`: ../bitmasks
.. _`external catalogs page`: ../external
.. _`Tractor catalogs`: ../catalogs
.. _`Gaia catalogs`: ../external
.. _`catalogs`: ../catalogs
.. _`Tycho-2`: https://heasarc.gsfc.nasa.gov/W3Browse/all/tycho2.html
.. _`Gaia stars were extracted in DR7`: https://www.legacysurvey.org/dr7/description/#source-detection
.. _`polynomial fits to Gaia-to-DECam`: https://github.com/legacysurvey/legacypipe/blob/DR10.0.12/py/legacypipe/reference.py#L237-L267

PSF
===

The Tractor makes use of the PSF on each individual exposure. The PSF for
the individual exposures are first computed independently for each CCD
using `PSFEx`_, generating spatially varying pixelized models. Note that it is possible that
``survey-*`` and ``*-annotated-*`` `files`_ could record information
that is missing from other files in cases where `PSFEx`_ fails. This is `expected behavior`_.

Starting with `DR9`_, a `modified, extended PSF model`_ is used to subtract the extended wings of bright stars from DECam images.

The configuration files for SExtractor and `PSFEx`_ that were used for a given
iteration of the Legacy Surveys ``legacypipe`` codebase are available `on our GitHub page`_.

.. _`PSFEx`: http://www.astromatic.net/software/psfex
.. _`on our GitHub page`: https://github.com/legacysurvey/legacypipe/tree/main/py/legacypipe/config
.. _`expected behavior`: https://github.com/legacysurvey/legacypipe/issues/349
.. _`modified, extended PSF model`: ../psf

Sky Level
=========

The Community Pipeline removes a sky level that includes a sky pattern, an illumination correction,
and a single, scaled fringe pattern. These steps are described on the `NOIRLab Community Pipeline`_
page.
These corrections are intended to make the sky level in the processed images near zero, and to remove most pattern artifacts.
A constant sky level, that is the mean of what was removed, is then added back to the image.

Additionally, a spatially varying (spline) sky model is computed and removed, by detecting and masking sources, then computing medians in
sliding 512-pixel boxes. The `image stacks`_ provided on the `files`_ page have this sky level
removed. As noted under `Source Detection`_, above, any regions (blobs) covered by foreground sources
are specially treated.

Changes in the Community Pipeline after `DR8`_ (in particular the switch to using star flats from
the `Dark Energy Survey`_ instead of dark sky flats) created
residual sky patterns in DECam images. These patterns are expected to exist in all optical bands
with the :math:`z\hbox{-}\mathrm{band}` having the worst residuals. So, starting
with `DR9`_, the Legacy Surveys `corrects DECam images to account for these residual sky patterns`_.

In addition, starting with `DR9`_, a new set of fringe templates was created for DECam :math:`z\hbox{-}\mathrm{band}`
images, with associated per-exposure fringe scale factors. These
`fringe templates and scale factors`_ replace the fringe correction applied by the Community Pipeline for
DECam imaging in the :math:`z\hbox{-}\mathrm{band}`.

.. _`corrects DECam images to account for these residual sky patterns`: ../sky
.. _`fringe templates and scale factors`: ../fringe
.. _`Source Detection`: #source-detection

Tractor Catalogs
================

The Tractor code runs within the geometrical region
of a brick to produce `catalogs`_ of extracted sources. This fitting is performed on the individual exposures
that overlap the brick, without making use of image stacks (such as the `image stacks`_ detailed on the
`files`_ page).
This preserves the full information content of the data set in the fits,
handles masked pixels without the need for uncertain interpolation techniques,
and fits to data points without the complication of pixel covariances.

Morphological Classification
============================

The `Tractor`_ fitting can allow any of the source properties or
image calibration parameters (such as the PSF) to float.
Only the source properties were allowed to float in DR11.
These are continuous properties for the object centers, fluxes,
and the shape parameters.

There is also the discrete choice of which
model type to use. In DR11, six morphological types are used. Five of these
are used in the `Tractor`_ fitting procedure: point sources ("PSF"),
round exponential galaxies with a variable radius ("REX"), deVaucouleurs ("DEV") profiles
(elliptical galaxies), exponential ("EXP") profiles (spiral galaxies), and Sersic ("SER") profiles.
The sixth morphological type is "DUP," which is set for Gaia sources that are coincident with, and so have been fit by, an extended source.
No optical flux is assigned to "DUP" sources, but they are retained to ensure that all Gaia sources appear in the catalogs even if
`Tractor`_ preferred and fit a different source based on the deeper Legacy Surveys imaging.
The total numbers of the different morphological types in DR11 are:

======================= ======================== ==================== ========================= ========================= ==============
Primary Objects of Type All Northern Sources     All Southern Sources Resolved Northern Sources Resolved Southern Sources Unique Sources
======================= ======================== ==================== ========================= ========================= ==============
*All*                            405,790,233           3,561,828,221            379,018,400              3,541,643,406     3,920,661,806
``PSF``                          190,400,842           2,031,416,132            177,046,620              2,021,435,284     2,198,481,904
``REX``                          165,922,629           1,107,137,679            155,621,636              1,099,223,580     1,254,845,216
``EXP``                           26,383,507             215,859,266             24,670,753                214,563,217       239,233,970                           
``DEV``                           15,909,955             138,162,003             14,940,568                137,496,476       152,437,044
``SER``                            7,106,952              68,975,340              6,680,052                 68,650,450        75,330,502
``DUP``                               66,348                 277,801                 58,771                    274,399           333,170
======================= ======================== ==================== ========================= ========================= ==============

where *northern* sources are from `BASS`_ and `MzLS`_, and *southern* sources are from `DECam`_
surveys. *Primary* objects, here, specifically refers to sources for which ``BRICK_PRIMARY==True``
(the totals are derived from the *total number* counts in the `survey bricks summary file`_).
Sources are *resolved* as distinct by only counting `BASS`_ and `MzLS`_ sources if they are both at Declination > 32.375\ |deg|
and north of the Galactic Plane, or, otherwise counting `DECam`_ sources. *Unique* sources are
the total of all *resolved* sources.

The decision to retain an object in the catalog and to re-classify it using
models more complicated than a point source is made using the penalized
changes to |chi|\ |sup2| in the image after subtracting the models for other sources.
Here, the |chi|\ |sup2| value is calculated as a sum across all optical bands
(i.e. :math:`g`, :math:`r`, :math:`i` and :math:`z` for the southern region of DR11
and :math:`g`, :math:`r` and :math:`z` for the northern region of DR11).
The "PSF" and "REX" models are computed for every source and the better of these
two is used when deciding whether to keep the source. A source is retained if its
penalized |chi|\ |sup2| is improved by 25; this corresponds to a |chi|\ |sup2|
difference of 27 (because of the penalty of 2 for the source centroid).  Sources
below this threshold are removed.

The source is classified as the better of "point source (PSF)" or "round exponential
galaxy (REX)" unless the penalized |chi|\ |sup2| is improved by 9 (i.e.,
approximately a 3\ |sigma| improvement) by treating it as a deVaucouleurs or
exponential profile. The classification becomes a Sersic profile
if it is both a better fit to a single profile over the point source, and
improves the penalized |chi|\ |sup2| by another 9.  These choices implicitly mean
that any extended source classifications have to be at least 5.8\ |sigma| detections
and that Sersic profiles must be at least 6.5\ |sigma| detections.

The fluxes are not constrained to be positive-valued.  This allows the fitting of
very low signal-to-noise sources without introducing biases at the faint end.  It
also allows the stacking of fluxes at the catalog level.

.. _`survey bricks summary file`: ../files/#south-survey-bricks-dr10-south-fits-gz

Tractor Implementation Details
==============================

Tractor fundamentally treats the fitting as a |chi|\ |sup2| minimization
problem.  The current core routine uses the sparse least squares
solver from the `SciPy`_ package, or the open source
`Ceres solver`_, originally developed by Google.

The galaxy profiles (the exponential and deVaucouleurs profiles mentioned above
under `Morphological Classification`_) are approximated with `mixture-of-Gaussians`_
(MoG) models and are convolved by the pixelized PSF models using a new
Fourier-space method (`Lang 2020`_).
The galaxy profile approximation introduces errors in these
models typically at the level of :math:`10^{-4}` or smaller.
The PSF models are treated as pixel-convolved quantities,
and are evaluated at the integral pixel coordinates without integrating
any functions over the pixels.

The Tractor algorithm could be run with both the source parameters
and the calibration parameters allowed to float, at the cost of
more compute time and the necessity to use much larger blobs because
of the non-locality of the calibrations.  A more practical approach
would be to iterate between fitting source parameters in brick space,
and fitting calibration parameters in exposure space.

.. _`Morphological Classification`: #morphological-classification
.. _`Lang 2020`: https://ui.adsabs.harvard.edu/abs/2020arXiv201215797L/abstract

Photometry
==========

The flux calibration for `BASS`_, `MzLS`_ and `DECaLS`_ are on the AB natural system of the
`90Prime`_, `Mosaic-3`_ and `DECam`_ instruments, respectively.
An AB system reports the same flux in any band for a source whose spectrum is
constant in units of erg/s/cm\ |sup2|/Hz. A source with a spectrum of
:math:`f = 10^{-(48.6+22.5)/2.5}` erg/s/cm\ |sup2|/Hz
would be reported to have an integrated flux of 1 nanomaggie in any filter.
The natural system implies that no color terms have been applied to any of the photometry, meaning
that fluxes are reported as observed in the `90Prime`_, `Mosaic-3`_ and `DECam`_ filter systems.

Zero point magnitudes for the Community Pipeline reductions of the `90Prime`_, `Mosaic-3`_ and `DECam`_ images
were computed by comparing Legacy Survey PSF photometry to
`Pan-STARRS1 (PS1) PSF photometry`_, where the latter was modified with color terms
to place the PS1 photometry on the `90Prime`_, `Mosaic-3`_ or `DECam`_ system.  The same color terms
are applied to all CCDs.
Zero points are computed separately for each CCD, but not for each amplifier.
The *average* color terms to convert from PS1 to `90Prime`_, `Mosaic-3`_ and `DECam`_ were computed for stars
in the color range :math:`0.4 < (g-i) < 2.7` as follows:


.. math::

               (g-i) & = & g_{\mathrm{PS}} - i_{\mathrm{PS}} \\

   g_{\mathrm{90Prime}}  & = & g_{\mathrm{PS}} + 0.00464 + 0.08672 (g-i) - 0.00668 (g-i)^2 - 0.00255 (g-i)^3 \\
   r_{\mathrm{90Prime}}  & = & r_{\mathrm{PS}} + 0.00110 - 0.06875 (g-i) + 0.02480 (g-i)^2 - 0.00855 (g-i)^3 \\
   z_{\mathrm{Mosaic3}} & = & z_{\mathrm{PS}}  + 0.03664 - 0.11084 (g-i) + 0.04477 (g-i)^2 - 0.01223 (g-i)^3 \\

   g_{\mathrm{DECam}} & = & g_{\mathrm{PS}} + 0.00062 + 0.03604 (g-i) + 0.01028 (g-i)^2 - 0.00613 (g-i)^3 \\
   r_{\mathrm{DECam}} & = & r_{\mathrm{PS}} + 0.00495 - 0.08435 (g-i) + 0.03222 (g-i)^2 - 0.01140 (g-i)^3 \\
   i_{\mathrm{DECam}} & = & i_{\mathrm{PS}} + 0.00904 - 0.04171 (g-i) + 0.00566 (g-i)^2 - 0.00829 (g-i)^3 \\
   z_{\mathrm{DECam}} & = & z_{\mathrm{PS}} + 0.02583 - 0.07690 (g-i) + 0.02824 (g-i)^2 - 0.00898 (g-i)^3 \\
   Y_{\mathrm{DECam}} & = & Y_{\mathrm{PS}} + 0.02332 - 0.05992 (g-i) + 0.02840 (g-i)^2 - 0.00572 (g-i)^3 \\

Note that the `DECam`_ zero points have been significantly `updated since DR5`_ and the `90Prime`_ and `Mosaic-3`_
zero points have been significantly `updated since DR6`_. We included transformations for :math:`i\hbox{-}\mathrm{band}`
and :math:`Y\hbox{-}\mathrm{band}` starting with DR10, although we have yet to release any :math:`Y\hbox{-}\mathrm{band}`
observations. Functions to perform the conversions are
available `in the legacypipe code`_ and the `actual external PS1 catalogs`_ we used are available at NERSC.

.. _`actual external PS1 catalogs`: ../external/#pan-starrs-1-ps1
.. _`updated since DR5`: https://www.legacysurvey.org/dr5/description/#photometry
.. _`updated since DR6`: https://www.legacysurvey.org/dr6/description/#photometry
.. _`Pan-STARRS1 (PS1) PSF photometry`: https://ui.adsabs.harvard.edu/abs/2016ApJ...822...66F/abstract
.. _`in the legacypipe code`: https://github.com/legacysurvey/legacypipe/blob/DR11.1.0/py/legacypipe/ps1cat.py#L193

The brightnesses of objects are all stored as linear fluxes in units of nanomaggies.  The conversion
from linear fluxes to magnitudes is :math:`m = 22.5 - 2.5 \log_{10}(\mathrm{flux})`.
These linear fluxes are well-defined even at the faint end, and the errors on the linear
fluxes should be very close to a normal distribution.  The fluxes can be negative for faint
objects, and indeed we expect many such cases for the faintest objects.

The filter curves are available for `BASS g-band`_, `BASS r-band`_, `MzLS z-band`_, `MzLS z-band with corrections`_,
`DECam g-band`_, `DECam r-band`_, `DECam i-band`_ and `DECam z-band`_. The curves "with corrections" include terms to correct for
the telescope, corrector, camera and atmosphere.

Starting with `DR6`_, PSF photometry uses the same PSF models
(and sky background subtraction) for zeropoint-fitting as is later used in cataloging.
So, for DR10 the measured fluxes for PS1 stars should be completely self-consistent.

The WISE Level 1 images and the `unWISE`_ image stacks are on a Vega system.
We have converted these to an AB system using the `recommended conversions by the WISE team`_. Namely,
:math:`\mathrm{Flux}_{\mathrm{AB}} = \mathrm{Flux}_{\mathrm{Vega}} \times 10^{-(\Delta m/2.5)}`
where :math:`\Delta m` = 2.699, 3.339, 5.174, and 6.620 mag in the W1, W2, W3 and W4 bands.
For example, a WISE W1 image should be multiplied by :math:`10^{-2.699/2.5} = 0.083253` to
give units consistent with the Tractor catalogs. These conversion factors are recorded in the
Tractor catalog headers ("WISEAB1", etc). The result is that the optical and WISE fluxes
we provide should all be within a few percent of being on an AB system.

.. _`unWISE`: https://ui.adsabs.harvard.edu/abs/2018RNAAS...2....1M/abstract
.. _`BASS g-band`: ../../files/bass-g.txt
.. _`BASS r-band`: ../../files/bass-r.txt
.. _`MzLS z-band`: ../../files/kpzd.txt
.. _`MzLS z-band with corrections`: ../../files/kpzdccdcorr3.txt
.. _`DECam g-band`: ../../files/decam.g.am1p4.dat.txt
.. _`DECam r-band`: ../../files/decam.r.am1p4.dat.txt
.. _`DECam i-band`: ../../files/decam.i.am1p4.dat.txt
.. _`DECam z-band`: ../../files/decam.z.am1p4.dat.txt
.. _`Mosaic-3`: https://noirlab.edu/science/programs/kpno/retired-instruments/mosaic
.. _`90Prime`: https://soweb.as.arizona.edu/~tscopewiki/doku.php?id=90prime_info
.. _`DECam`: https://noirlab.edu/science/programs/ctio/instruments/Dark-Energy-Camera
.. _`Dark Energy Camera`: https://noirlab.edu/science/programs/ctio/instruments/Dark-Energy-Camera
.. _`catalogs page`: ../catalogs/#galactic-extinction-coefficients


Galactic Extinction
===================

The most recent values of the Galactic extinction coefficients are available on the `catalogs page`_.


Astrometry
==========

Starting with `DR11`_, astrometry is tied entirely to `Gaia Data Release 3`_. Each image is calibrated to
`Gaia Data Release 3`_, yielding an astrometric solution that is offset by the average difference between
the position of Gaia stars at an epoch of 2015.0 and the epoch of the DR11 image. Source
extraction is then fixed to the `Gaia Data Release 3`_ system, such that positions of sources are tied to
predicted Gaia positions at the epoch of the corresponding Legacy Surveys observation.
Astrometric residuals are typically smaller than |plusmn|\ 0.03\ |Prime|.

Astrometric calibration of all optical Legacy Surveys data is conducted using Gaia
astrometric positions of stars matched to Pan-STARRS1 (PS1).
The same matched objects are used for both astrometric and photometric calibration.
The `actual external PS1`_ and `Gaia DR3`_ catalogs we used are available at NERSC.

.. _`actual external PS1`: ../external/#pan-starrs-1-ps1
.. _`Gaia DR3`: ../external/#gaia-dr3

Image Stacks
============

The image stacks (that are detailed on the `files`_ page) are provided for convenience, but were not used in the `Tractor`_ fits.
These images overlap adjacent images by approximately 130 pixels in each direction.
These are tangent projections centered at each brick center, North up, with dimensions of 3600 |times| 3600
and a scale of 0.262\ |Prime|/pix for the :math:`g,r,i,z` data and 2.75\ |Prime|/pix for the WISE data.
The image stacks are computed using Lanczos-3
interpolation. They have not been designed for "precision" work, although they should be
sufficient for many use cases.


Depths
======

The histograms below depict the median 5\ |sigma| point source (AB) depths for areas with
different numbers of DECam observations in DR11:

.. image:: ../../files/depth-hist-g-dr11-south.png
    :height: 375
    :width: 570
.. image:: ../../files/depth-hist-r-dr11-south.png
    :height: 375
    :width: 570
.. image:: ../../files/depth-hist-i-dr11-south.png
    :height: 375
    :width: 570
.. image:: ../../files/depth-hist-z-dr11-south.png
    :height: 375
    :width: 570
    :alt: DR10 Depth Histograms

These can be compared to similar plots for the northern Legacy Surveys (`BASS`_ and `MzLS`_)
from `DR9`_:

.. image:: ../../files/depth-hist-g-dr9-north.png
    :height: 375
    :width: 570
.. image:: ../../files/depth-hist-r-dr9-north.png
    :height: 375
    :width: 570
.. image:: ../../files/depth-hist-z-dr9-north.png
    :height: 375
    :width: 570

These plots are based upon the formal errors in the Tractor catalogs for point sources. The
predicted proposed Legacy Surveys depths for 2 observations at 1.5\ |Prime| seeing were
:math:`g=24.7`, :math:`r=23.9`, :math:`z=23.0`.

Code Versions
=============

* `LegacyPipe <https://github.com/legacysurvey/legacypipe>`_: A range of versions; DR10.9.1, DR11.0.0, DR11.0.3, DR11.0.6 and DR11.1.0. The version used is documented in the Tractor header card ``LEGPIPEV``.
* `Astrometry.net <https://github.com/dstndstn/astrometry.net>`_: 0.98
* `Tractor <https://github.com/dstndstn/tractor>`_: 10.9, 11.0 and 11.1
* `NOIRLab Community Pipeline <https://nsf-noirlab.gitlab.io/csdc/csdc-mso-docs/PL201/>`_: A mixture of versions; recorded in the `survey-ccds-* files`_ as ``plver``.
* `SourceExtractor <http://www.astromatic.net/software/sextractor>`_: 
* `PSFEx <http://www.astromatic.net/software/psfex>`_: 3.24.2
* `Astropy <https://www.astropy.org/>`_: 7.2.0
* `fitsio <https://github.com/esheldon/fitsio>`_: 1.3.0
* `Matplotlib <https://matplotlib.org>`_: 3.10.8
* `NumPy <https://numpy.org/>`_: 2.4.2 and 2.4.3
* `photutils <https://photutils.readthedocs.io/en/stable/index.html>`_: 2.3.0
*  `SciPy`_: 1.17.1
* `unwise_psf <https://github.com/legacysurvey/unwise_psf/blob/master/README>`_: dr10.0

.. _`DESI Legacy Surveys Imaging Data Release 2`: ../../dr2
.. _`DESI Legacy Surveys Imaging Data Release 3`: ../../dr3
.. _`DESI Legacy Surveys Imaging Data Release 4`: ../../dr4
.. _`DESI Legacy Surveys Imaging Data Release 5`: ../../dr5
.. _`DESI Legacy Surveys Imaging Data Release 6`: ../../dr6
.. _`DESI Legacy Surveys Imaging Data Release 7`: ../../dr7
.. _`DESI Legacy Surveys Imaging Data Release 8`: ../../dr8
.. _`DESI Legacy Surveys Imaging Data Release 9`: ../../dr9

Glossary
========

BASS
    `Beijing-Arizona Sky Survey <https://www.legacysurvey.org/bass>`_.

BLISS+
    `Blanco Imaging of the Southern Sky Survey <https://arxiv.org/abs/1812.06318>`_.

Blob
    Continguous region of pixels above a detection threshold and neighboring
    pixels; Tractor is optimized within blobs.

Brick
    A region bounded by lines of constant RA and DEC; reductions
    are performed within bricks of size approximately 0.25\ |deg| |times| 0.25\ |deg|.

CP
    Community Pipeline (`reduction pipeline operated by NOIRLab <https://nsf-noirlab.gitlab.io/csdc/csdc-mso-docs/PL201/>`_).

DECaLS
    `Dark Energy Camera Legacy Survey <https://www.legacysurvey.org/decamls>`_.

DeROSITAS
    `DECam eROSITA Survey <https://noirlab.edu/science/programs/ctio/instruments/Dark-Energy-Camera/DeROSITAS>`_.

DR3
    `DESI Legacy Surveys Imaging Data Release 3`_.

DR4
    `DESI Legacy Surveys Imaging Data Release 4`_.

DR5
    `DESI Legacy Surveys Imaging Data Release 5`_.

DR6
    `DESI Legacy Surveys Imaging Data Release 6`_.

DR7
    `DESI Legacy Surveys Imaging Data Release 7`_.

DR8
    `DESI Legacy Surveys Imaging Data Release 8`_.

DR9
    `DESI Legacy Surveys Imaging Data Release 9`_.

DECam
    `Dark Energy Camera`_ on the Blanco 4-meter telescope.

maggie
    Linear flux units, where an object with an AB magnitude of 0 has a
    flux of 1.0 maggie.  A convenient unit is the nanomaggie: a flux of 1 nanomaggie
    corresponds to an AB magnitude of 22.5.

MoG
    `Mixture-of-Gaussians`_ to approximate galaxy models.

MzLS
    `Mayall z-band Legacy Survey <https://www.legacysurvey.org/mzls>`_.

NOIRLab
    `The NSF's National Optical-Infrared Astronomy Research Laboratory  <https://www.aura-astronomy.org/centers/nsfs-oir-lab>`_.

nanomaggie
    Linear flux units, where an object with an AB magnitude of 22.5 has a flux
    of :math:`1 \times 10^{-9}` maggie or 1.0 nanomaggie.

PSF
    Point spread function.

PSFEx
    `Emmanuel Bertin's PSF fitting code <http://www.astromatic.net/software/psfex>`_.

SDSS
    `Sloan Digital Sky Survey <https://www.sdss.org>`_.

SDSS DR12
    `Sloan Digital Sky Survey Data Release 12 <https://www.sdss.org/dr12/>`_.

SDSS DR13
    `Sloan Digital Sky Survey Data Release 13 <https://www.sdss.org/dr13/>`_.

SED
    Spectral energy distribution.

SGA
    `Siena Galaxy Atlas`_.

SourceExtractor
    `Source Extractor reduction code <http://www.astromatic.net/software/sextractor>`_.

SFD98
    `Schlegel, Finkbeiner & Davis 1998 extinction maps <https://ui.adsabs.harvard.edu/abs/1998ApJ...500..525S/abstract>`_.

Tractor
    `Dustin Lang's inference code <https://github.com/dstndstn/tractor>`_.

unWISE
    `New coadds <https://arxiv.org/abs/1405.0308>`_ of the WISE imaging, `at original full resolution <http://unwise.me>`_.

WISE
    `Wide Infrared Survey Explorer <http://wise.ssl.berkeley.edu>`_.

.. _`DESI Legacy Imaging Surveys Overview Paper`: https://ui.adsabs.harvard.edu/abs/2019AJ....157..168D
.. _`this table`: ../../files/dr10-propids.txt
