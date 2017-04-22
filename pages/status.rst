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
.. _`DR3`: ../dr3

Legacy Survey observations began in August 2014. For each of the Legacy Surveys 
(`BASS`_, `DECaLS`_ and `MzLS`_) each position in the sky (minus some small filling factor)
will be observed in three "passes" in each of three filters (:math:`g`, :math:`r`, :math:`z`).
"Pass 1" is observed in photometric, good-seeing conditions.
"Pass 2" and "Pass 3" are observed in progressively worse conditions.
This strategy will ensure a photometric solution across the full survey area.

`MzLS`_ and `BASS`_ mostly observe regions at Dec |geq| 32\ |deg| whereas `DECaLS`_ mostly
observes regions at Dec |leq| 32\ |deg|. `MzLS`_ observes solely in :math:`z`, `BASS`_
observes in :math:`g` and :math:`r`, and `DECaLS`_ observes in all 3 filters.

In addition to observations carried out as part of the Legacy Survey, data releases will include
reductions of data from other programs in (:math:`g`, :math:`r`, :math:`z`) that overlap the 
Legacy Survey footprint.

MzLS
====

The figure below depicts the status of `MzLS`_ as of April 2017 (roughly the time of Data Release 4)
in Mollweide projection. Each panel depicts a different pass. 

.. image:: /files/coverage_mollweide_mzls_2017apr.pdf

DECaLS
======

The images below depict the status of `DECaLS`_ in each band as of Data Release 3 (`DR3`_), the
most recent release of `DECaLS`_ imaging. The coverage is color-coded by the number of passes. 
`DESI`_ area that is yet to be observed is marked in light gray. The lines track Galactic 
latitudes of 0\ |deg|, -10\ |deg| and +10\ |deg|.

.. image:: /files/nexp-g.png
.. image:: /files/nexp-r.png
.. image:: /files/nexp-z.png
    :alt: Coverage Plots

