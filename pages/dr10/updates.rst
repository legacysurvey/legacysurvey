.. title: Updates since DR9
.. slug: updates
.. tags: 
.. has_math: yes

.. |deg|    unicode:: U+000B0 .. DEGREE SIGN

.. class:: pull-right well

.. contents::

This page documents some of the main updates to the Legacy Surveys since Data Release 9.

.. _`DESI`: https://desi.lbl.gov
.. _`DR8`: ../../dr8/description
.. _`DR9`: ../../dr9/description

Changes for optical data
========================

* Multiple :math:`i\hbox{-}\mathrm{band}` quantities have been added to the `Tractor catalogs`_ and the sweeps files.

* The ``MASKBITS`` bitmask is now 32-bit rather than 16-bit, as a new bit called ``SUB_BLOB`` was added. This bit is described on the DR10 bitmasks page `under MASKBITS`_.

* The ``CCD_CUTS`` bitmask is now 64-bit rather than 32-bit, as two new bits called ``PHRMS_S7`` and ``DEPTH_CUT_2`` were added. These bits are described on the DR10 bitmasks page `under CCD_CUTS`_.

* The sweeps are now partitioned into 5\ |deg| x 5\ |deg| areas rather than 10\ |deg| x 5\ |deg| areas.

* The `Tractor catalogs`_ contain a new per-band quantity called ``ngood_x`` where ``x`` is one of :math:`g`, :math:`r`, :math:`i` or :math:`z`. (XXX what does it mean?)

* DR10 only contains updates for the ``south`` part of the Legacy Surveys from new imaging with DECam. Northern areas can be obtained from DR9 (see, e.g., `the status page`_).

Changes for WISE data
=====================

* The WISE imaging has been updated to include observations through the `7th year of the NEOWISE W1/W2 data`_.

* The potential number of unWISE epochs has been expanded for the WISE light curves (e.g. columns such as ``lc_flux_w1`` in the `Tractor catalogs`_ can now have up to 17 entries).

.. _`7th year of the NEOWISE W1/W2 data`: http://wise2.ipac.caltech.edu/docs/release/neowise/neowise_2021_release_intro.html
.. _`Tractor catalogs`: ../catalogs
.. _`under MASKBITS`: ../bitmasks#maskbits
.. _`under CCD_CUTS`: ../bitmasks#ccd-cuts
.. _`the status page`: ../../status

