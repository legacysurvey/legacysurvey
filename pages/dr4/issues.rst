.. title: Known Issues and Workarounds
.. slug: issues
.. tags: mathjax
.. description:

.. |deg|    unicode:: U+000B0 .. DEGREE SIGN


For issues relevant to `DECaLS`_ imaging, consult the `DR3 issues`_ page.

.. _`DR3 issues`: ../../dr3/issues
.. _`DECaLS`: ../../decamls
.. _`files`: ../files
.. _`catalogs page`: ../catalogs
.. _`MzLS`: ../../mzls  
.. _`BASS`: ../../bass

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

NANs in Tractor Catalogs
========================

Issue
  Occasionally, some measurements of an object in a particular band will have
  NaNs in some columns. In DR4, 7 Tractor catalogs are affected, and all of the 
  NaNs are in the RCHI2 and DCHISQ columns:

  ================================= =========== ==========
  File                              DCHISQ NaNs RCHI2 NaNs
  ================================= =========== ==========
  tractor/234/tractor-2346p535.fits 8           6
  tractor/254/tractor-2547p540.fits 2           2
  tractor/281/tractor-2819p415.fits 8           6
  tractor/179/tractor-1798p450.fits 28          0
  tractor/131/tractor-1312p457.fits 4           5
  tractor/248/tractor-2484p402.fits 8           5
  tractor/207/tractor-2076p525.fits 12          17
  ================================= =========== ==========

  See also https://github.com/legacysurvey/legacypipe/issues/140.

Workaround
  We suggest that users simply ignore all measurements
  which correspond to NaN values, although we have not
  determined whether there are unintended negative consequences of this
  prescription. Investigations of the root cause of these NaNs are ongoing.