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

NANs and Infs in Tractor Catalogs
=================================

Issue
  Occasionally, some measurements of an object in a particular band will have
  NaNs or Infs in some columns. In DR4, 37 Tractor catalogs are affected by NaNs
  or Infs with the following number of objects affected in the following columns:

  =============== ====== ============ ======= ======== ================ ================ ===============
  File (tractor-) DCHISQ DECAM_RCHISQ RA_IVAR DEC_IVAR SHAPEEXP_E1_IVAR SHAPEEXP_E2_IVAR SHAPEEXP_R_IVAR
  =============== ====== ============ ======= ======== ================ ================ ===============
  0932p677.fits            	      1       1	   
  0988p517.fits 		      1	      1
  1015p360.fits 		      1	      1
  1043p385.fits 		      1       1
  1181p395.fits 		      1	      1
  1260p460.fits 		      1	      1
  1276p442.fits 		      1	      1
  1312p450.fits 		      1	      1
  1312p457.fits	  4	 5            1	      1
  1336p437.fits  		      1	      1
  1489p427.fits  		      1	      1
  1798p450.fits	  28	 17           2	      2        1	        1		 1
  1896p525.fits          	      1	      1
  2000p412.fits   		      1	      1
  2007p412.fits	         	      1	      1	       1		1		 1 
  2076p525.fits   12	 19           1	      1	       1                1		 1
  2240p592.fits         	      1	      1
  2326p505.fits 		      1	      1
  2346p535.fits   8	 6            1	      1	       1		1 		 1
  2375p580.fits          	      1	      1
  2389p580.fits 		      1	      1
  2394p400.fits 	       	      1	      1
  2475p400.fits		              1	      1
  2484p402.fits   8	 6	      1	      1	       1	        1		 1
  2547p540.fits   2	 3            1	      1	       1                1		 1
  2617p410.fits         	      1	      1	       1	        1	 	 1
  2644p400.fits 		      1	      1
  2677p430.fits 		      1	      1
  2713p357.fits 		      1	      1
  2754p392.fits		              1	      1
  2760p342.fits	         	      1	      1
  2819p415.fits   8	 6            1	      1	       1		1		 1
  2834p427.fits          	      1	      1
  2835p432.fits 		      1	      1        1		1  		 1
  2842p435.fits 		      1	      1
  2889p542.fits 		      1	      1	       1		1		 1
  2967p617.fits 		      1	      1
  =============== ====== ============ ======= ======== ================ ================ ===============

  See also https://github.com/legacysurvey/legacypipe/issues/140.

Workaround
  We suggest that users simply ignore all measurements
  which correspond to NaN or Inf values, although we have not
  determined whether there are unintended negative consequences of this
  prescription. Investigations of the root cause of these NaNs and Infs are ongoing.