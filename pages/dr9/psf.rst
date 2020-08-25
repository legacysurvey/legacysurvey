.. title: Modified PSFEx Profile and Outer Wings of Stars
.. slug: psf
.. tags: mathjax
.. description:

.. |deg|    unicode:: U+000B0 .. DEGREE SIGN
.. |Prime|    unicode:: U+02033 .. DOUBLE PRIME

.. class:: pull-right well

.. contents::


The extended PSF model is used to subtract the extended wings of bright stars from DECam images. The model is symmetric (which is
a good approximation for DECam images), and is a linear combination of two components:

1. a flexible inner PSF, which is a Moffat fit to the `PSFEx`_ image.
2. a fixed outer PSF, which is either a power law (for :math:`g\hbox{-}` and :math:`r\hbox{-}\mathrm{bands}`) or a Moffat profile (for :math:`z\hbox{-}\mathrm{band}`).

.. _`PSFEx`: http://www.astromatic.net/software/psfex
   
The Inner PSF Profile
=====================
The inner PSF component is a Moffat profile:

- :math:`f_{\mathrm{Moffat}} = \frac{\beta-1}{\pi \alpha^2} \left[1 + \frac{r}{\alpha^2}\right]^{-\beta}`

This formula gives a total flux of unity by definition. Its two free parameters, :math:`\alpha` and :math:`beta`, are obtained by fitting to
the `PSFEx`_ image of each CCD. Only `PSFEx`_ pixels between 1.8 and 5 arcsec in radius are used in the fit.

The size of the DECam `PSFEx`_ image is only ~8.1 arcsec in radius, too small for implementing the extended PSF model. Nevertheless, we
modify the the `PSFEx`_ image for the following reasons:

1. It removes discontinuities when we subtract the outer wings of bright stars from the images
2. The noisy parts of the PSFEx images are replaced by a noiseless model PSF. This is more of a cosmetic improvement and it should not
   affect the *Tractor* fitting of unsaturated stars or faint galaxies.

Here are illustrations of the weights for patching the `PSFEx`_ image and the weights of the stellar halo subtraction:

.. image:: ../../files/psfex_patching_weights.png
    :height: 305
    :width: 550

.. image:: ../../files/stellar_halo_weights.png
    :height: 305
    :width: 550

The (tentative) :math:`R` values are :math:`R1, R2, R3, R4 = 5.0, 6.0, 7.0, 8.0 (\mathrm{arcsec}`). The transition radii R1 and R2 are chosen so
that beyond radius :math:`R1` there is little asymmetry in the `PSFEx`_ model (*i.e.* the symmetric Moffat profile is a good approximation).
For reference, the size of the `PSFEx`_ images is ~8.1 arcsec in radius (:math:`63 \times 63` with pixel size :math:`0.262\,arcsec`) for DECam
and Mosaic, and ~6.8 arcsec (:math:`31 \times 31` with pixel size :math:`0.454\,arcsec`) for 90Prime.

In the patched `PSFEx`_ image (the first eigen-image), the crossover between :math:`R1` and :math:`R2` marks the transition between the `PSFEx`_
image and the model PSF. The flux gradually approaches zero between :math:`R3` and :math:`R4`, and is strictly zero beyond :math:`R4`. For the
other eigenimages, the values for each pixel gradually approach zero between :math:`R1` and :math:`R2` (*i.e.* the red curve in the above plot),
and they are strictly zero beyond :math:`R2`. To preserve continuity, the outer PSF component is included for `PSFEx`_ patching, even though it's
not used in the fitting; it is contributes a negligible fraction of the flux in the `PSFEx`_ image.

Here is an example of the Moffat fit to the `PSFEx`_ image, and the corresponding original and patched `PSFEx`_ image:

.. image:: ../../files/example_psfex_profile1.png
    :height: 325
    :width: 465

.. image:: ../../files/example_psfex_profile_v2.png
    :height: 325
    :width: 645

The Outer PSF Profile
=====================

For :math:`g\hbox{-}` and :math:`r\hbox{-}\mathrm{bands}`, the outer PSF profile is a fixed power law (normalized to a 22.5 magnitude star, in units
of :math:`\mathrm{nanomaggies}/\mathrm{arcsec}^2`):

- :math:`f_g = 0.00045 r^{-2}`
- :math:`f_r = 0.00033 r^{-2}`

For :math:`z\hbox{-}\mathrm{band}`, the outer PSF is a weighted Moffat profile. For most CCDs, the Moffat parameters (with radius in arcsec and surface
brightness in :math:`\mathrm{nanomaggies}/\mathrm{arcsec}^2`) and the weights are (for a 22.5 magnitude star):

- :math:`[\alpha, \beta, weight] = [17.650, 1.7, 0.0145]`

However, a small subset of DECam CCDs (N20, S8, S10, S18, S21 and S27) have a more compact outer PSF in the :math:`z\hbox{-}\mathrm{band}`, which is characterized using:

- :math:`[\alpha, \beta, weight] = [16, 2.3, 0.0095]`

The Combined PSF model
======================

Additional Information
======================
Further extensive tests and plots characterizing the Legacy Surveys DR9 PSF model is available for DESI collaborators `on the wiki`_.

.. _`on the wiki`: https://desi.lbl.gov/trac/wiki/DecamLegacy/DR9/PSFExAndOuterWings
