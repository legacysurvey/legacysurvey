.. title: Known Issues and Workarounds
.. slug: issues
.. tags: mathjax
.. description: 

Tractor-on-Bricks
==================

Issue
  ?

Workaround
  ?

Blacklisted Frames
==================

Issue
  ?
Workaround
  ?

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
