.. title: Survey Status
.. slug: status
.. tags: mathjax

.. |leq|    unicode:: U+2264 .. LESS-THAN-OR-EQUAL-TO SIGN
.. |geq|    unicode:: U+2265 .. GREATER-THAN-OR-EQUAL-TO SIGN
.. |deg|    unicode:: U+000B0 .. DEGREE SIGN

.. _`BASS`: ../bass
.. _`DECaLS`: ../decamls
.. _`MzLS`: ../mzls
.. _`DESI`: http://desi.lbl.gov
.. _`DR5`: ../dr5
.. _`DR6`: ../dr6
.. _`DR7`: ../dr7

Legacy Survey observations began in August 2014. For each of the Legacy Surveys 
(`BASS`_, `DECaLS`_ and `MzLS`_) each position in the sky (minus some small filling factor)
will be observed in three "passes" in each of three filters (:math:`g`, :math:`r`, :math:`z`).
The passes are observed according to the following criteria:

==== ==========
Pass Conditions
==== ==========
1    Photometric and seeing < 1.3 arcsec 
2    (Photometric and seeing < 2.0 arcsec) OR (seeing < 1.3 arcsec) OR (all Pass 1 tiles completed) 
3    Unphotometric OR seeing > 1.3 arc sec 
==== ==========

`MzLS`_ and `BASS`_ mostly observe regions at Dec |geq| 32\ |deg| whereas `DECaLS`_ mostly
observes regions at Dec |leq| 32\ |deg|. `MzLS`_ observes solely in :math:`z`, `BASS`_
observes in :math:`g` and :math:`r`, and `DECaLS`_ observes in all 3 filters.

In addition to observations carried out as part of the Legacy Survey, data releases will include
reductions of data from other programs in (:math:`g`, :math:`r`, :math:`z`) that overlap the 
Legacy Survey footprint.

The figures below depict the (:math:`g`, :math:`r`, :math:`z`) status of `DECaLS`_ as of Data Release 7 (`DR7`_)
and `MzLS`_ and `BASS`_ as of Data Release 6 (`DR6`_), the most recent releases
of imaging from the Legacy Surveys. The coverage is color-coded by (extinction-corrected)
depth. The solid line depicts the Galactic plane.

.. image:: /files/depth-g-dr6-7.png
.. image:: /files/depth-r-dr6-7.png
.. image:: /files/depth-z-dr6-7.png
    :alt: DR7 Depth Plots



