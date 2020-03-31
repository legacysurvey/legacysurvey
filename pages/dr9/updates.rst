.. title: Major updates since DR8
.. slug: updates
.. tags: mathjax

.. class:: pull-right well

.. contents::

DR9 will be the final release of the Legacy Surveys that is used for `DESI`_ target selection.
As such, a major push was made to update the `DR8`_ code and data model to prepare for `DESI`_ observations.
This page documents those updates, in brief.

.. _`DESI`: http://desi.lbl.gov
.. _`DR8`: ../../dr7/description

Algorithmic changes for optical data
====================================
* All raw images from Legacy Surveys observations are initially reduced using the `NSF OIR Lab Community Pipeline`_ (CP). For DR9, the CP has been rerun in full on each of the raw images:
   * The CP now imposes no interpolation.
   * The CP has improved fit parameters for good seeing images.
   * The CP WCS now consistently uses Gaia DR1.
   * The CP now doesn't remove pixels in masks, rather, it just flags those pixels as having been masked
      * Notably, `cosmic rays are no longer masked`_ by the CP.
   * The CP now has improved star-flats fit across all of the imaging.
* The Tractor pipeline now includes iterative fitting:
   * After a first round of fits, the data-model residuals are calculated and a second round of fits is conducted.
* A modified, extended PSF model is now used to subtract the extended wings of bright stars from DECam images. The model is symmetric (which is a good approximation for DECam images), and it is a linear combination of two components:
   * A flexible inner PSF, which is a Moffat fit to the PSFEx image:
      * :math:`f_{\mathrm{Moffat}} = \frac{\beta-1}{\pi \alpha^2} \left[1 + \frac{r}{\alpha^2}\right]^{-\beta}`
   * This formula gives a total flux of unity by definition. Its two free parameters, :math:`\alpha` and :math:`\beta`, are obtained by fitting to the PSFEx image of each CCD. Only PSFEx pixels between 1.8 and 5 arcsec in radius (:math:`r`) are used in the fit.
   * A fixed outer PSF, which is either a power law (for :math:`g`- and :math:`r`-bands):
      * :math:`f_g = 0.00045 r^{-2}`
      * :math:`f_r = 0.00033 r^{-2}`
   * or a Moffat profile (for :math:`z`-band):
      * For most CCDs, the Moffat parameters (with radius in arcsec and SB in nmgy per sq arcsec) and the weight are (for a 22.5 magnitude star):
         * :math:`[\alpha, \beta, weight] = [17.650, 1.7, 0.0145]`
      * However, a small subset of DECam CCDs (N20, S8, S10, S18, S21 and S27) have a more compact outer PSF in the :math:`z`-band, which is characterized using:
         * :math:`[\alpha, \beta, weight] = [16, 2.3, 0.0095]`
   * A complete description of the new PSF model, with examples, is `available for DESI collaborators`_.
   * This updated PSF model leads to different sky levels.
* The "COMP" (composite) morphological ``type`` from DR8 has been replaced by a Sersic profile (``type=SER``).
* The large galaxy (`LSLGA`_) catalog has been updated extensively:
   * XXX

.. _`available for DESI collaborators`: https://desi.lbl.gov/trac/wiki/DecamLegacy/DR9/PSFExAndOuterWings
.. _`cosmic rays are no longer masked`: https://github.com/legacysurvey/legacypipe/issues/334
.. _`NSF OIR Lab Community Pipeline`: http://www.noao.edu/noao/staff/fvaldes/CPDocPrelim/PL201_3.html

Algorithmic changes for WISE
============================
* WISE imaging has been updated to include observations through the `5th year of the NEOWISE W1/W2 data`_.
* The unWISE astrometry has been re-generated, and proper motions of stars have been correctly accounted for when conducting time-resolved forced photometry.
* unWISE epochs have been resampled to have more uniform coverage for the WISE light curves, particularly near the ecliptic poles (e.g. for columns such as ``lc_flux_w1`` on the `catalogs page`_).
* The unWISE epoch index number is now recorded in the `Tractor catalogs`_.
* Bit-flags for pixels that lie in some of the brightest `WISE bright star masks`_ have been updated.

.. _`5th year of the NEOWISE W1/W2 data`: http://wise2.ipac.caltech.edu/docs/release/neowise/neowise_2019_release_intro.html
.. _`catalogs page`: ../catalogs
.. _`Tractor catalogs`: ../catalogs
.. _`WISE bright star masks`: ../bitmasks/#wisemask-w1-wisemask-w2

Other algorithmic changes
=========================
* The DR9 `external match files`_ now include matches to Data Release 16 of the SDSS.

Data model changes
==================
* Additional WISE-variability light-curve columns have been included in the `sweep files`_:
   * ``LC_MJD_W1`` and ``LC_MJD_W2``
   * ``LC_FLUX_W1`` and ``LC_FLUX_W2``
   * ``LC_FLUX_IVAR_W1`` and ``LC_FLUX_IVAR_W2``
   * ``LC_NOBS_W1`` and ``LC_NOBS_W2``
* The shape parameters in the Tractor files (and downstream) have changed, as there are now no sources of ``type=COMP`` (which corresponded to a "composite" galaxy):
   * The `DR8 catalog`_ columns:
      * ``fracdev``, ``fracdev_ivar``
      * ``shapedev_e1``, ``shapedev_e1_ivar``, ``shapedev_e2``, ``shapedev_e2_ivar``, ``shapedev_r``, ``shapedev_r_ivar``
      * ``shapeexp_e1``, ``shapeexp_e1_ivar``, ``shapeexp_e2``, ``shapeexp_e2_ivar``, ``shapeexp_r``, ``shapeexp_r_ivar``
   * have been replaced, in DR9, by:
      * ``shape_e1``, ``shape_e1_ivar``, ``shape_e2``, ``shape_e2_ivar``, ``shape_r``, ``shape_r_ivar``
   * the logic behind this change is that, in DR8, the composite ``type`` comprised some fraction (``fracdev``) of a de Vaucouleurs profile, with the remaining fraction being an exponential profile. 
   * the ``shapedev_`` and ``shapeexp_`` parameters, in DR8, defined the appropriate parameters for the de Vaucouleurs and exponential profiles. In the event that something was fit with ``type=DEV`` or ``type=EXP``, only the columns that corresponded to the relevant profile would be populated. 
   * the "COMP" profile has been replaced by a Sersic profile in DR9, so there is no need to have "mixes" of "DEV" and "EXP". 
   * In DR9, every profile is defined by its ``type``, and ``shape_r``, ``shape_e1`` etc. are the appropriate parameters for that ``type`` (so, i.e., ``shapedev_r`` and ``shapeexp_r`` can now be collapsed to just the single ``shape_r`` column).
   * As there are no sources of ``type=COMP``, the ``type`` column is now a 3-string (``'S3'``) rather than a 4-string (``'S4'``).
* Three new columns related to the Sersic profiles and iterative-fitting now exist in the `Tractor files for DR9`_:
   * ``iterative``
   * ``sersic`` and ``sersic_ivar``
* Five additional columns exist in the `Tractor files for DR9`_:
   * ``lc_epoch_index_w1`` and ``lc_epoch_index_w2``
   * ``apflux_blobresid_g``, ``apflux_blobresid_r`` and ``apflux_blobresid_z``
* Three additional columns exist in the `region-specific survey bricks files`_.
   * ``cosky_g``, ``cosky_r`` and ``cosky_z``
* The large galaxy (`LSLGA`_) catalog has been updated extensively, meaning that there are many additional `files of data from fitting in LSLGA regions`_.
   * DR9 uses version 5 of the `LSLGA`_, so the ``ref_cat`` (or ``REF_CAT``) column in the `Tractor catalogs`_ and `sweep files`_ is populated with ``L5`` for LSLGA sources in DR9 (this column was populated with ``L2`` for LSLGA sources in DR8).
* The DR9 `coadds`_ include a new file ``legacysurvey-<brick>-blobmodel-<filter>.fits.fz`` which records XXX.

.. _`DR7`: ../../dr7/description
.. _`DR8 catalog`: ../../dr8/catalogs
.. _`DR9 bitmasks page`: ../bitmasks
.. _`Aaron Meisner's unWISE documentation`: http://catalog.unwise.me/files/unwise_bitmask_writeup-03Dec2018.pdf
.. _`BASS`: ../../bass
.. _`DECaLS`: ../../decamls
.. _`MzLS`: ../../mzls
.. _`Gaia Data Release 2`: http://gaia.esac.esa.int/documentation/GDR2/index.html
.. _`Tractor files for DR9`: ../catalogs
.. _`Tractor catalogs`: ../catalogs
.. _`sweep files`: ../files/#sweep-catalogs-region-sweep
.. _`region-specific survey bricks files`: ../files/#region-survey-bricks-dr9-region-fits-gz
.. _`LSLGA`: https://github.com/moustakas/LSLGA
.. _`files of data from fitting in LSLGA regions`: ../files/#large-galaxy-files-largegalaxies-aaa-galname
.. _`coadds`: ../files/#image-stacks-region-coadd
.. _`external match files`: ../files/#external-match-files-region-external