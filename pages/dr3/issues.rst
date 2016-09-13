.. title: Known Issues and Workarounds
.. slug: issues
.. tags: mathjax
.. description: 

Tractor-on-Bricks
==================

Issue
   Tractor-on-Bricks is a slightly different implementation of the Tractor source extraction code in 
   which a fraction of bricks that don't touch are run through Tractor, and then sources that
   are BRICK_PRIMARY are fixed so that additional bricks run through Tractor don't produce 
   duplicate "edge" sources where bricks overlap. This has the advantage of producing rigorus
   brick boundaries, but the disadvantage of slowing down processing through being harder to
   parallelize. In DR3, tractor-on-bricks was enforced until June 6.

Workaround
   Bricks with timestamps before June 6 were processed slightly differently to subsequent bricsk.
   All of these "pre-6/6" bricks are within a region bounded by Right Ascenscions of 315 to 45 
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

.. _`catalogs page`: ../catalogs

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
