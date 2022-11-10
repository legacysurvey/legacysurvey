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

General changes
===============

* DR10 only contains updates for the ``south`` part of the Legacy Surveys from new imaging with DECam. Northern areas can be obtained from DR9 (see, e.g., `the status page`_).

* The `sweep files`_ are now partitioned into 5\ |deg| x 5\ |deg| areas rather than 10\ |deg| x 5\ |deg| areas.

Changes for optical data
========================

* Multiple :math:`i\hbox{-}\mathrm{band}` quantities have been added to the `Tractor catalogs`_ and the `sweep files`_.

* Gaia quantities included in files and catalogs are now drawn from `Gaia EDR3`_.

  - Note, though, that the astrometric solution for DR10 was still calculated using Gaia DR2.

* The ``MASKBITS`` bitmask is now 32-bit rather than 16-bit, as a new bit called ``SUB_BLOB`` was added. This bit is described on the DR10 bitmasks page `under MASKBITS`_.

* The ``CCD_CUTS`` bitmask is now 64-bit rather than 32-bit, as two new bits called ``PHRMS_S7`` and ``DEPTH_CUT_2`` were added. These bits are described on the DR10 bitmasks page `under CCD_CUTS`_.

* The `Tractor catalogs`_ contain a new per-band quantity called ``ngood_x`` where ``x`` is one of :math:`g`, :math:`r`, :math:`i` or :math:`z`. These quantities record the number of `good` (unmasked) images that contribute to a source in a particular band at a particular pixel-location. Prior to DR9, we only recorded ``nobs_x`` (the `total` number of images that contributed to a source in each band) in the `Tractor catalogs`_, which created an inconsistency with the "nexp" pixel-maps in the `image stacks`_ (which only record the number of `good` images). So, ``ngood_x`` is recorded to allow a direct mapping between the number of good images in the `Tractor catalogs`_ and `image stacks`_. As an example of the difference, for saturated sources one would expect ``ngood_x`` and the "nexp" pixel maps to be zero, but ``nobs_x`` to correspond to the total number of exposures that contributed to the source.

Changes for WISE data
=====================

* The WISE imaging has been updated to include observations through the `7th year of the NEOWISE W1/W2 data`_.

* The potential number of unWISE epochs has been expanded for the WISE light curves (e.g. columns such as ``lc_flux_w1`` in the `Tractor catalogs`_ can now have up to 17 entries).

.. _`7th year of the NEOWISE W1/W2 data`: http://wise2.ipac.caltech.edu/docs/release/neowise/neowise_2021_release_intro.html
.. _`Tractor catalogs`: ../catalogs
.. _`sweep files`: ../files/#sweep-catalogs-south-sweep
.. _`under MASKBITS`: ../bitmasks#maskbits
.. _`under CCD_CUTS`: ../bitmasks#ccd-cuts
.. _`the status page`: ../../status
.. _`Gaia EDR3`: https://gea.esac.esa.int/archive/documentation/GEDR3/Gaia_archive/chap_datamodel/sec_dm_main_tables/ssec_dm_gaia_source.html
.. _`image stacks`: ../files/#image-stacks-south-coadd
