.. title: Known Issues
.. slug: issues
.. tags: mathjax
.. description:

.. |deg|    unicode:: U+000B0 .. DEGREE SIGN
.. |Prime|    unicode:: U+02033 .. DOUBLE PRIME

DR7.1 update to sweeps files
============================
The column ``BRIGHTSTARINBLOB`` was not initially included in the DR7 sweeps
files. In addition, the ``GAIA_DUPLICATED_SOURCE`` column in the DR7 sweeps files
was initially included as type *int8* rather than being passed through as a 
*boolean* from the Tractor files. The DR7.1 sweeps files were provided as an 
update to rectify these issues.

Smaller subsets of files of random points
=========================================
On August 23, 2018, the ``randoms-dr7.fits`` file initially supplied with DR7
was split into smaller files in a dedicated ``randoms`` directory for ease of use.

For issues relevant to `BASS`_ or `MzLS`_ imaging, consult the `DR6 issues`_ page.

.. _`DR6 issues`: ../../dr6/issues
.. _`DECaLS`: ../../decamls
.. _`files`: ../files
.. _`catalogs page`: ../catalogs
.. _`MzLS`: ../../mzls
.. _`BASS`: ../../bass


