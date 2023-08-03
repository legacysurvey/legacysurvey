.. title: Old Photometric Redshift Sweeps
.. slug: oldphotozs
.. tags: 
.. has_math: yes

.. |deg|    unicode:: U+000B0 .. DEGREE SIGN
.. |Prime|    unicode:: U+02033 .. DOUBLE PRIME
.. |gtapprox| unicode:: U+02273 .. GREATER-THAN OR EQUIVALENT TO

.. class:: pull-right well

.. contents::

The DR9 photometric redshift sweeps were updated in July of 2023, and we recommend
that users adopt the `newer versions`_.

Below, for posterity, we retain the information for the earlier versions of the photometric redshift sweeps,
which are stored at ``9.0-photo-z/sweep-<brickmin>-<brickmax>-pz.fits``.

The Photometric Redshifts for the Legacy Surveys (PRLS, e.g., see `Zhou et al. 2021`_)
catalog is row-by-row-matched to the DR9 sweep catalogs as described previously for the other types of sweeps files.

The photometric redshifts are computed using the random forest algorithm.
Details of the photo-z training and performance can be found in `Zhou et al. (2021)`_.
For computing the photo-z's, we require at least one exposure in
:math:`g`, :math:`r` and :math:`z` bands (``NOBS_G,R,Z>1``).
For objects that do not meet the NOBS cut,
the photo-z values are filled with -99. Although we provide photo-z's for all
objects that meet the NOBS cut, only relatively bright objects have reliable
photo-z's. As a rule of thumb, objects brighter than :math:`z`-band magnitude of 21
are mostly reliable, whereas fainter objects are increasingly unreliable with
large systematic offsets.

The photo-z catalogs do not provide information on star-galaxy separation.
Stars are excluded from the photo-z training data, and we do not attempt to
identify stars. To perform star-galaxy separation, one can use the
morphological "TYPE" and/or the photometry (*e.g.*, the optical-WISE
color cut, as applied in  `Zhou et al. 2021`_, can be very effective for selecting redshift |gtapprox| 0.3 galaxies) in the sweep catalogs.

================= ========== ==========================================================================
Name              Type       Description
================= ========== ==========================================================================
``RELEASE``       int16      Integer denoting the camera and filter set used, which will be unique for a given processing run of the data (`RELEASE is documented here`_)
``BRICKID``       int32      A unique Brick ID (in the range [1, 662174])
``OBJID``         int32      Catalog object number within this brick; a unique identifier hash is ``RELEASE,BRICKID,OBJID``; ``OBJID`` spans [0,N-1] and is contiguously enumerated within each blob
``Z_PHOT_MEAN``   float32    photo-z derived from the mean of the photo-z PDF
``Z_PHOT_MEDIAN`` float32    photo-z derived from the median of the photo-z PDF
``Z_PHOT_STD``    float32    standard deviation of the photo-z's derived from the photo-z PDF
``Z_PHOT_L68``    float32    lower bound of the 68% confidence region, derived from the photo-z PDF
``Z_PHOT_U68``    float32    upper bound of the 68% confidence region, derived from the photo-z PDF
``Z_PHOT_L95``    float32    lower bound of the 95% confidence region, derived from the photo-z PDF
``Z_PHOT_U95``    float32    upper bound of the 68% confidence region, derived from the photo-z PDF
``Z_SPEC``        float32    spectroscopic redshift, if available
``SURVEY``        char[10]   source of the spectroscopic redshift
``TRAINING``      boolean    whether or not the spectroscopic redshift is used in photometric redshift training
================= ========== ==========================================================================

Work which uses this photometric redshift catalog should cite `Zhou et al. (2021)`_
and include the `additional acknowledgment for photometric redshifts`_.

.. _`additional acknowledgment for photometric redshifts`: ../../acknowledgment/#photometric-redshifts
.. _`Zhou et al. (2021)`: https://ui.adsabs.harvard.edu/abs/2021MNRAS.501.3309Z/abstract
.. _`Zhou et al. 2021`: https://ui.adsabs.harvard.edu/abs/2021MNRAS.501.3309Z/abstract
.. _`newer versions`: ../files/#photometric-redshift-sweeps
.. _`RELEASE is documented here`: ../../release
