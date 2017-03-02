.. title: Known Issues and Workarounds
.. slug: issues
.. tags: mathjax
.. description:

.. |deg|    unicode:: U+000B0 .. DEGREE SIGN


For issues relevant to `DECaLS`_ imaging, consult the `DR3 issues`_ page.

.. _`DR3 issues`: ../../dr3/issues
.. _`DECaLS`: ../../decamls


Blacklisted Frames
==================

Issue
  We attempt to process all available `BASS`_ and `MzLS`_ imaging, regardless of whether such
  data was specifically taken as part of the Legacy Surveys. Some imaging is conducted
  during multiple revisits to certain areas of the sky, and processing the coaddition of such data can severely
  slow down the Tractor pipeline. Because of this, some observations are "blacklisted" to
  prevent Tractor from dwelling on those regions. 

Workaround
  Which proposal IDs were considered in which brick can be obtained from the ccds files that
  are documented on the `catalogs page`_.

.. _`catalogs page`: ../catalogs
.. _`MzLS`: ../../mzls  
.. _`BASS`: ../../bass

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