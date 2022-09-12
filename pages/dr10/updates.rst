.. title: Updates since DR9
.. slug: updates
.. tags: 
.. has_math: yes

.. |deg|    unicode:: U+000B0 .. DEGREE SIGN

.. class:: pull-right well

.. contents::

This page documents some of the main updates to the Legacy Surveys since Data Release 9.

.. _`DESI`: https://desi.lbl.gov
.. _`DR8`: ../../dr7/description

XXX

Changes for optical data
========================

* Added :math:`i\hbox{-}\mathrm{band}` quantities in the Tractor catalogs and sweeps files.

* ``MASKBITS`` is now 32-bit rather than 16-bit (XXX what extra bits did we define?).

* ``CCD_CUTS`` is now 64-bit rather than 32-bit (XXX what extra bits did we define?).

* Sweeps are now 5\ |deg| x 5\ |deg| rather than 10\ |deg| x 5\ |deg|.

* New per-band ``ngood_x`` in the Tractor catalogs (XXX what does it mean?)

* DR10 only contains updates for the ``south`` part of the Legacy Surveys from new imaging with DECam.

Changes for WISE data
=====================
* WISE imaging has been updated to include observations through the `7th year of the NEOWISE W1/W2 data`_.
* The potential number of unWISE epochs has been expanded for the WISE light curves (e.g. columns such as ``lc_flux_w1`` on the `catalogs page`_ can now have up too 17 entries).

.. _`7th year of the NEOWISE W1/W2 data`: http://wise2.ipac.caltech.edu/docs/release/neowise/neowise_2021_release_intro.html
.. _`catalogs page`: ../catalogs

