.. title: Known Issues and Workarounds
.. slug: issues
.. tags: mathjax

Catalogs with Zero Sources
==========================

Problem
    Some Tractor catalogs contain pixels but zero sources.

Explanation
    Because, in some cases, very few pixels touch a brick, it is entirely
    possible to have zero sources in a Tractor file. For this reason, when
    processing multiple Tractor files as a batch, it is
    recommended to always read in the FITS header and check that ``NAXIS2 > 0``.

DR2 coadd files have been deprecated
====================================

As of August 23rd, 2018, the DR2 coadd directory has been removed to save space.
Data from that directory is still available via FTP from the `NOAO archive`_

.. _`NOAO archive`: ftp://archive.noao.edu/public/hlsp/decals/dr2/coadd/
