.. title: Known Issues
.. slug: issues
.. tags: 
.. has_math: yes

.. |deg|    unicode:: U+000B0 .. DEGREE SIGN
.. |Prime|    unicode:: U+02033 .. DOUBLE PRIME

.. class:: pull-right well

.. contents::

General Issues
--------------
The most up-to-date issues and in-progress fixes are
available on the GitHub issues pages for the `Legacy Surveys website`_ or the `legacypipe pipeline`_.

Issues with CCDs that may have affected the quality of DECam observations are recorded on the
`DECam CCDs page`_.

.. _`Legacy Surveys website`: https://github.com/legacysurvey/legacysurvey/issues
.. _`legacypipe pipeline`: https://github.com/legacysurvey/legacypipe/issues?q=is:issue+sort:updated-desc
.. _`DECam CCDs page`: https://noirlab.edu/science/programs/ctio/instruments/Dark-Energy-Camera/Status-DECam-CCDs


``BLOB_NEA_I`` uses inverse variances from :math:`g`-band
---------------------------------------------------------
The ``BLOB_NEA_I`` quantities reported in the `Tractor catalogs`_ and derived products such as the
`sweep files`_ were incorrectly calculated using the inverse variances from :math:`g`-band instead of :math:`i`-band.

.. _`Tractor catalogs`: ../catalogs
.. _`sweep files`: ../files/#sweep-catalogs
