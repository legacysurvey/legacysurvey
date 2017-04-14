.. title: Known Issues and Workarounds
.. slug: issues
.. tags: mathjax
.. description:

.. |deg|    unicode:: U+000B0 .. DEGREE SIGN


For issues relevant to `DECaLS`_ imaging, consult the `DR3 issues`_ page.

.. _`DR3 issues`: ../../dr3/issues
.. _`DECaLS`: ../../decamls
.. _`files`: ../files


MzLS Repeat Observations
========================

Issue
  Due to a bug in the `MzLS`_ scheduling code, approximately 3500 `MzLS`_ exposures were
  unintentionally repeated between February 2nd, 2017 and March 27, 2017. Certain `MzLS`_
  fields have therefore been covered more than the expected ~3-4 times. In fact, about 
  100 fields were observed of order 10 times.
  
Workaround
  There is no need to do anything to circumvent this issue. It is worth remembering
  though, that in some fields `MzLS`_ observations are deeper than is typical (potentially 
  much deeper). Objects in these fields will therefore have different noise characteristics
  than in the typical field. For example the ``_NOBS`` and ``_DEPTH`` values in the sweeps
  `files`_ can be quite different for objects in these "deep" fields.

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
  See https://github.com/legacysurvey/legacypipe/issues/140 for a
  partial list of files that contain NaNs.

Workaround
  We suggest that users simply ignore all measurements
  which correspond to NaN values of
  DECAM_RCHI2/DECAM_FRACFLUX/DECAM_FRACMASKED, although we have not
  determined whether there are unintended negative consequences of this
  prescription. The root cause of these NaNs is being investigated.