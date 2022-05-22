.. title: Known Issues and Workarounds
.. slug: issues
.. tags: 
.. has_math: yes

DR3.1 Update to sweeps and Tractor Files
========================================
Issue
  During final processing checks on DR3 it was noticed that 36 bricks had been corrupted in a
  read/write error. The corrupted files corresponding to these 36 bricks were::

    tractor-1763p240.fits tractor-1821p295.fits tractor-1888p270.fits tractor-1916p295.fits
    tractor-1934p255.fits tractor-1942p130.fits tractor-1942p255.fits tractor-1942p320.fits
    tractor-1951p237.fits tractor-1896p300.fits tractor-1985p267.fits tractor-1986p237.fits
    tractor-1986p272.fits tractor-1965p300.fits tractor-2030p270.fits tractor-2040p287.fits 
    tractor-2049p237.fits tractor-2054p187.fits tractor-2063p300.fits tractor-2087p305.fits
    tractor-2087p272.fits tractor-2109p317.fits tractor-2115p317.fits tractor-2116p302.fits
    tractor-2117p307.fits tractor-2176p097.fits tractor-2204p252.fits tractor-2224p285.fits
    tractor-2254p290.fits tractor-2261p257.fits tractor-2290p292.fits tractor-2295p320.fits
    tractor-2310p320.fits tractor-2318p302.fits tractor-2334p200.fits tractor-2496p257.fits

Workaround
  These files have been reprocessed and are included in a "DR3.1" directory structure,
  which is now the default to which DR3 directories point. The one exception to the overall
  directory structure is the sweeps files, for which the uncorrupted versions are available at
  legacysurvey/dr3/sweep/3.1 (instead of at legacysurvey/dr3/sweep/3.0). Note that users who
  want access to the original version of the legacysurvey directory structure can still 
  find it at legacysurvey/dr3.0.

Tractor-on-Bricks
==================

Issue
  Tractor-on-Bricks is a slightly different implementation of the Tractor source extraction code in
  which a fraction of bricks that don't touch are run through Tractor, and then sources that 
  are BRICK_PRIMARY are fixed so that additional bricks run through Tractor don't produce
  duplicate "edge" sources where bricks overlap. This has the advantage of producing rigorous
  brick boundaries, but the disadvantage of slowing down processing through being harder to
  parallelize. In DR3, tractor-on-bricks was enforced until June 6.

Workaround
  Bricks with timestamps before June 6 were processed slightly differently to subsequent bricks.
  All of these "pre-6/6" bricks are within a region bounded by Right Ascensions of 315 to 45
  degrees and Declinations of  -5 to +7 degrees (a region in which the eBOSS survey is targeting
  Emission Line Galaxies). Not every brick in that region was run with Tractor-on-Bricks but
  no brick outside of that region was run with Tractor-on-Bricks.

Blacklisted Frames
==================

Issue
  We attempt to process all available DECam imaging, regardless of whether such
  data was specifically taken as part of the legacy survey. Some imaging surveys revisit
  certain areas of the sky many times, and processing the coaddition of such data can severely
  slow down the Tractor pipeline. Because of this, some proposal IDs are "blacklisted" to
  prevent Tractor from dwelling on those regions. The upshot of this is that if you're looking
  for coadded DECam imaging from a specific set of surveys in a certain region of the sky, it may not be
  available to the full depth that you expect.

Workaround
  Which proposal IDs were considered in which brick can be obtained from the ccds files that
  are documented on the `catalogs page`_.
  Unfortunately, however, the final ``dr3e`` code used to generate DR3 catalogs has a 
  blacklist cut that does *not* match the ``blacklist_ok`` 
  column in the DR3 ``ccds-annotated`` files. This implies that the 
  ``ccds-annotated`` files were generated with an earlier version of the code (seemingly
  the ``dr3c`` version). The easiest
  way to handle these discrepancies is to use the newer `Data Release 5`_ of the
  Legacy Surveys.

.. _`catalogs page`: ../catalogs
.. _`Data Release 5`: ../../dr5

NANs in Tractor Catalogs
========================

Issue
  Occasionally, measurements of an object in a particular band will have
  NaNs in all of the following columns: DECAM_RCHI2, DECAM_FRACFLUX and
  DECAM_FRACMASKED. No other columns ever have NaNs. The vast majority
  of NaNs correspond to measurements which have DECAM_NOBS of 0. A small
  fraction of the NaNs (~1%) correspond to measurements with non-zero
  DECAM_NOBS. In these cases, the relevant band's flux is identically
  zero, suggesting that no such measurement was actually performed.

Workaround
  We suggest that users simply ignore all measurements
  which correspond to NaN values of
  DECAM_RCHI2/DECAM_FRACFLUX/DECAM_FRACMASKED, although we have not
  determined whether there are unintended negative consequences of this
  prescription. ~7% of all Tractor catalog rows contain a nonzero number
  of NaNs. The root cause of these NaNs is being investigated.