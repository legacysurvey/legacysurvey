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

XXX - clean these up

Header inconsistencies
----------------------
Headers may be inconsistent with catalog values for about 2% of bricks in the `Tractor catalogs`_. This is due to
some files being altered while rsync processes were running.

Duplicate ``ref_id`` values
---------------------------
A very small number of ``ref_id`` values for Gaia sources appear twice in the `Tractor catalogs`_. One of the duplicates corresponds to the
"correct" Gaia source and the second duplicate has all of the correct information for a Gaia source but with an incorrect
``ref_id``. The ``ref_id`` that would be correct for the second duplicate is missing entirely from the `Tractor catalogs`_.

An example from `DR9`_ is ``ref_id`` 303293444934132224, which appears in Tractor catalog ``tractor-0238p302.fits`` with
correct information (RA, Dec, etc.) and in Tractor catalog ``tractor-0238p305.fits`` with information that `actually`
corresponds to the Gaia source with ``ref_id`` 303315950562852864.

The cause of this problem has yet to be fully diagnosed, although the discrepant Gaia sources tend to lie very close to the
boundaries of a brick.

This issue will also propagate to the `sweep files`_.

Inconsistencies with DES photometry south of :math:`-30^\circ`
--------------------------------------------------------------
Do we want to mention this? Probably not. XXX

Bricks where source-fitting failed
----------------------------------
A few dozen bricks were intractable on a reasonable timescale as they overlapped regions of high source density. These
bricks were "bailed out" of before they finished processing. Sources in such bricks can be identified as they have
the ``BAILOUT`` flag set in the `MASKBITS bitmask`_.

LMC in viewer is only Gaia sources.
-----------------------------------
So, there's a significant drop in density at the boundary. Improve this description and add an example when the
viewer is served. XXX

Rings of spurious Gaia sources around bright stars
--------------------------------------------------
([decam-chatter 16786]). Expand on this. XXX

.. _`Tractor catalogs`: ../catalogs
.. _`sweep files`: ../files/#sweep-catalogs-south-sweep
.. _`DR9`: ../../dr9
.. _`MASKBITS bitmask`: ../bitmasks/#maskbits
