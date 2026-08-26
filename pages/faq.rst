.. title: Frequently Asked Questions
.. slug: faq
.. date: 2026-08-26 00:06:06
.. tags: 
.. has_math: yes

.. |leq|    unicode:: U+2264 .. LESS-THAN-OR-EQUAL-TO SIGN
.. |geq|    unicode:: U+2265 .. GREATER-THAN-OR-EQUAL-TO SIGN

.. class:: pull-right well

.. contents::

How do I re-create the RGB images from the sky viewer?
------------------------------------------------------

The function that the viewer uses to make its RGB images is `dr2_rgb()`_, which takes a list of images (e.g. [im1, im2, im3]) and a list of bands (e.g. ['g', 'r', 'z'])
and calls the function `sdss_rgb()`_ with scalings that appropriately render the images.

.. _`dr2_rgb()`: https://github.com/legacysurvey/imagine/blob/deploy11/map/views.py#L6368
.. _`sdss_rgb()`: https://github.com/legacysurvey/imagine/blob/deploy11/map/views.py#L6314

What observational effects are corrected for in the Legacy Surveys coadded images?
----------------------------------------------------------------------------------

The images are all calibrated to the same zero-point of 22.5 mag, and are sky subtracted with outliers (cosmic rays, satellite trails, etc.) masked (as best
we can). So if a star generates a total value of 1.0 in the coadded images, then it has magnitude 22.5.

The major observational characteristic for which we don't correct any Legacy Surveys fluxes, including in the coadds, is Milky Way dust extinction/reddening.

How do I convert fluxes in nanomaggies to magnitudes?
-----------------------------------------------------

The conversion from fluxes in nanomaggies (:math:`f`) to magnitudes (:math:`m`) is:

.. math::

   m = 22.5 - 2.5\log_{10}(f)

