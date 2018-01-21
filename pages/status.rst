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

The figures below depict the status of `DECaLS`_ as of Data Release 5 (`DR5`_), the
most recent release of `DECaLS`_ imaging. The coverage is color-coded by the number of passes. 
Area that is yet to be observed is marked in light gray. The lines track Galactic 
latitudes of 0\ |deg|, -10\ |deg| and +10\ |deg|.

.. image:: /files/nexp-g-dr5.png
.. image:: /files/nexp-r-dr5.png
.. image:: /files/nexp-z-dr5.png
    :alt: DR5 Coverage Plots

The figures below depict the status of `MzLS`_ and `BASS`_ as of Data Release 6 (`DR6`_), the
most recent release of `MzLS`_ and `BASS`_ imaging. The coverage is color-coded by the number of passes. 
Area that is yet to be observed is marked in light gray.

.. image:: /files/nexp-g-dr6.png
.. image:: /files/nexp-r-dr6.png
.. image:: /files/nexp-z-dr6.png
    :alt: DR6 Coverage Plots



