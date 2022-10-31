.. title: Survey Status
.. slug: status
.. date: 2012-11-08 00:06:06 UTC
.. tags:
.. category:
.. link:
.. description:
.. type: text
.. author: Legacy Survey
.. has_math: true

.. |leq|    unicode:: U+2264 .. LESS-THAN-OR-EQUAL-TO SIGN
.. |geq|    unicode:: U+2265 .. GREATER-THAN-OR-EQUAL-TO SIGN
.. |deg|    unicode:: U+000B0 .. DEGREE SIGN

.. _`BASS`: ../bass
.. _`DECaLS`: ../decamls
.. _`MzLS`: ../mzls
.. _`DESI`: https://desi.lbl.gov
.. _`DR7`: ../dr7
.. _`DR8`: ../dr8
.. _`DR9`: ../dr9
.. _`DR10`: ../dr10

Observations for the `DESI`_ Legacy Imaging Surveys began in August 2014. For each of the Legacy Surveys
(`BASS`_, `DECaLS`_ and `MzLS`_) each position in the sky (minus some small filling factor)
was designed to be observed in three "passes" in each of three filters (:math:`g`, :math:`r`, :math:`z`).
The passes were observed according to the following criteria:

==== ==========
Pass Conditions
==== ==========
1    Photometric and seeing < 1.3 arcsec
2    (Photometric and seeing < 2.0 arcsec) OR (seeing < 1.3 arcsec) OR (all Pass 1 tiles completed)
3    Unphotometric OR seeing > 1.3 arc sec
==== ==========

`MzLS`_ and `BASS`_ mostly observed regions at Dec |geq| 32\ |deg| whereas `DECaLS`_ mostly
observed regions at Dec |leq| 32\ |deg|. `MzLS`_ observed solely in :math:`z`, `BASS`_
observed in :math:`g` and :math:`r`, and `DECaLS`_ observed in all 3 filters.

In addition to observations carried out as part of the DESI Legacy Imaging Surveys, data releases include
reductions of data from other programs in (:math:`g`, :math:`r`, :math:`z`) that overlap the
footprint of the Legacy Surveys.

The figures below depict the (:math:`g`, :math:`r`, :math:`z`) status of the DESI Legacy Imaging Surveys
as of Data Release 10 (`DR10`_). The coverage is color-coded by (extinction-corrected)
depth. The solid line depicts the Galactic plane.


.. image:: /files/depth-g-dr10.png
    :height: 410
    :width: 570

.. image:: /files/depth-r-dr10.png
    :height: 410
    :width: 570

.. image:: /files/depth-i-dr10.png
    :height: 410
    :width: 570

.. image:: /files/depth-z-dr10.png
    :height: 410
    :width: 570

The status for DR9 (which usefully illustrates the northern coverage) is depicted below.

.. image:: /files/depth-g-dr9.png
    :height: 410
    :width: 570

.. image:: /files/depth-r-dr9.png
    :height: 410
    :width: 570

.. image:: /files/depth-z-dr9.png
    :height: 410
    :width: 570
    :align: center
