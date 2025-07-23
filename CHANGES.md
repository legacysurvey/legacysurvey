# legacysurvey Change Log

## 10.1.4 (DR10, planned)

- *Planned*: correct units for `ccdskycounts`
  ([issue #152](https://github.com/legacysurvey/legacysurvey/issues/152)).
- *Planned*: actually update the raw and CP-processed data access instructions
  ([issue #143](https://github.com/legacysurvey/legacysurvey/issues/143)).

# 10.1.3 (DR1, 2025-07-23)

- Add cutout documentation ([PR#184](https://github.com/legacysurvey/legacysurvey/pull/184)).
- Fix slow-loading CSS font ([PR#183](https://github.com/legacysurvey/legacysurvey/pull/183)).

## 10.1.2 (DR10, 2024-01-03)

- Add a known issue describing updates to the brick summary files
  ([PR#177](https://github.com/legacysurvey/legacysurvey/pull/177)):
    - Also update table of sources by morphological type on DR10 description page.
    - Addresses [issue #176](https://github.com/legacysurvey/legacysurvey/issues/176).

## 10.1.1 (DR10, 2023-09-28)

- Add description of DR10.1 photo-zs
  ([PR#175](https://github.com/legacysurvey/legacysurvey/pull/175)). Also includes:
    - Add arXiv link to Zhou et al. (2023) photo-z paper.
    - Update `RELEASE` documentation to include `RELEASE=10002` number.
    - Add a mention of DR10.1 to the landing page.

## 10.1.0 (DR10, 2023-09-11)

- Document updates made to fix the sub-blob bug (*i.e.* for "DR10.1")
  ([PR#174](https://github.com/legacysurvey/legacysurvey/pull/174)).
    - Addresses [issue #173](https://github.com/legacysurvey/legacysurvey/issues/173).
- Address points listed in [issue #170](https://github.com/legacysurvey/legacysurvey/issues/170)
  ([PR#172](https://github.com/legacysurvey/legacysurvey/pull/172)). Also includes:
    - A description of the new Zhou et al. (2023) dr9.1 photo-z sweeps.
    - A link to the SGA-2020 paper.

## 10.0.3 (DR10, 2023-04-05)

- Add issue about missing `SUB_BLOB` sources to the DR10 known issues page
  ([PR#169](https://github.com/legacysurvey/legacysurvey/pull/169)).
- Update descriptions of, and depth plots for, DELVE and DeROSITA surveys
  ([PR#168](https://github.com/legacysurvey/legacysurvey/pull/168)).

## 10.0.2 (DR10, 2023-01-24)

- Update boilerplate on entry index page for NOIRLab rather than NOAO
  ([PR#167](https://github.com/legacysurvey/legacysurvey/pull/167)).

## 10.0.1 (DR10, 2023-01-05)

- Additional, minor updates to the DR10 description page
  ([PR#166](https://github.com/legacysurvey/legacysurvey/pull/166)).

## 10.0.0 (DR10, 2022-12-20)

- Near-final updates for DR10
  ([PR#165](https://github.com/legacysurvey/legacysurvey/pull/165)):
    - Includes a sufficient set of DR10 pages for an initial release.
    - Still missing details about the DR10 sky pattern correction.
    - Addresses [issue #160](https://github.com/legacysurvey/legacysurvey/issues/160).

## 9.1.2 (DR9, 2022-08-09)

- Add LBNL details to *short* acknowledgment ([PR#164](https://github.com/legacysurvey/legacysurvey/pull/164)).

## 9.1.1 (DR9, 2022-08-03)

- Add LBNL and BASS details to acknowledgment; allow
  shorter acknowledgment for DESI papers ([PR#162](https://github.com/legacysurvey/legacysurvey/pull/162)).

## 9.1.0 (DR9, 2022-06-01)

- Support up-to-date Nikola versions `>=8.0`
  ([PR#155](https://github.com/legacysurvey/legacysurvey/pull/155)).

## 9.0.8 (DR9, 2022-04-04)

- Add new i-band `MASKBITS` values (`SATUR_I` and `ALLMASK_I`)
  ([PR#154](https://github.com/legacysurvey/legacysurvey/pull/154)).

## 9.0.7 (DR9, 2022-02-16)

- Add a DR9 known issue about NOBS in the Tractor *versus* random catalogs
  ([PR#153](https://github.com/legacysurvey/legacysurvey/pull/153)).

## 9.0.6 (DR9, 2022-02-16)

- Replace `noao.edu` with `noirlab.edu` wherever possible; move raw
  data access instructions into a unified, top-level page
  ([PR#150](https://github.com/legacysurvey/legacysurvey/pull/150)).

## 9.0.5 (DR9, 2022-01-27)

- Add known issue about blobmodel files ([PR#149](https://github.com/legacysurvey/legacysurvey/pull/149)).

## 9.0.4 (DR9, 2021-10-19)

- Fix SGA documentation bug ([PR#148](https://github.com/legacysurvey/legacysurvey/pull/148)).
- Minor additions to sky viewer tips and tricks page: `blink`, `mark`, `poly`, and custom catalog upload
  ([PR#146](https://github.com/legacysurvey/legacysurvey/pull/146)).

## 9.0.3 (DR9, 2021-07-28)

- Fix incorrect/broken links to the SGA documentation
  ([PR#145](https://github.com/legacysurvey/legacysurvey/pull/145)).
- Automate removal of outdated JavaScript files
  ([PR#144](https://github.com/legacysurvey/legacysurvey/pull/144)).

## 9.0.2 (DR9, 2021-06-24)

- Fix minor typos in psfdepth description on catalogs page
  ([PR#141](https://github.com/legacysurvey/legacysurvey/pull/141)).
- Replace NOAO with NOIRLab ([PR#139](https://github.com/legacysurvey/legacysurvey/pull/139)).
- Describe the forced-brick data product, and add forced-brick and forced-ccd to the file-size contents list
  ([PR#138](https://github.com/legacysurvey/legacysurvey/pull/138)).
- Major update of SGA documentation ahead of public release
  ([PR#137](https://github.com/legacysurvey/legacysurvey/pull/137)).
- A few more updates for DR9
  ([PR#136](https://github.com/legacysurvey/legacysurvey/pull/136)). Includes:
    - Specify relative radii of `BRIGHT`/`MEDIUM` Masks (addresses [#135](https://github.com/legacysurvey/legacysurvey/issues/135))
    - Document the forced photometry files, remove "Coming Soon."
    - Clarify the counts of morphological types are for `BRICK_PRIMARY`.
    - Add some sizes for new directories we've added to the release.
- Update some "Coming Soon" sections for DR9, now that they're released
  ([PR#133](https://github.com/legacysurvey/legacysurvey/pull/133)). Includes:
    - Update description of foreground masking files.
    - Add data model for photoz sweeps (and update Zhou et al. reference).
    - Also fix broken cutout server links, and update BASS contacts.
- First version of SGA-2020 documentation
  ([PR#132](https://github.com/legacysurvey/legacysurvey/pull/132)).

## 9.0.1 (DR9, 2021-01-19)

- Incorporate gallery pages into this package
  ([PR#129](https://github.com/legacysurvey/legacysurvey/pull/129)).

## 9.0.0 (DR9, 2021-01-12)

- Near-final updates for DR9
  ([PR#125](https://github.com/legacysurvey/legacysurvey/pull/125)). Includes:
    - Final data model, where available.
    - Updated publications through 2020-12-12.
    - Add statistics to the description page (areas, numbers of sources, etc.).
    - Add depth histogram plots.
    - Add "coming soon" text to work-in-progress sections and pages.
    - Add known issues, including patched bricks and DR9sv release.
- Merge DR9 WIP branch with PR#120
  ([PR#120](https://github.com/legacysurvey/legacysurvey/pull/120))
  security updates. Also includes some updates for DR9
  ([PR#121](https://github.com/legacysurvey/legacysurvey/pull/121)):
    - New acknowledgment with viewer copyright and NOIRLab language.
    - Change "NSF's OIR Lab" text to NOIRLab everywhere.
    - Updated publications through early October, 2020.
    - A handful of other minor notes and fixes.
- Initial updates for DR9 ([PR#116](https://github.com/legacysurvey/legacysurvey/pull/116)).
  Includes:
    - New fringe, sky-level, NEA, psf documentation from Rongpu.
    - Preliminary SGA documentation from John. Changed LSLGA->SGA.
    - Update URLs, where possible, to https instead of http.
    - Near-final data model (pending final DR9 files and organization).
    - Updated publications through 2020-08-11.
    - Add a drop-down menu to access earlier versions of the gallery.
    - Update NERSC directory names to the Community File System.
    - Add documentation for the `CCD_CUTS` and `FITBITS` bit-masks.
    - Preliminary changes where information will need finalized (XXX).
    - Addresses [issue #109](https://github.com/legacysurvey/legacysurvey/issues/109)
      through 2020-08-26.
    - Addresses [issue #106](https://github.com/legacysurvey/legacysurvey/issues/106),
      [#110](https://github.com/legacysurvey/legacysurvey/issues/110),
      [#113](https://github.com/legacysurvey/legacysurvey/issues/113),
      [#114](https://github.com/legacysurvey/legacysurvey/issues/114),
      [#115](https://github.com/legacysurvey/legacysurvey/issues/115),
      [#118](https://github.com/legacysurvey/legacysurvey/issues/118) and
      [#119](https://github.com/legacysurvey/legacysurvey/issues/119).

## 8.1.0 (DR8, 2020-10-28)

- Update jQuery and Bootstrap versions for security reasons
  ([PR#120](https://github.com/legacysurvey/legacysurvey/pull/120)).

## 8.0.3 (DR8, 2020-01-20)

- Add documentation of photo-z files
  ([PR#105](https://github.com/legacysurvey/legacysurvey/pull/105)).

## 8.0.2 (DR8, 2019-10-10)

- Add DR8 forced photometry, clarify bitmasks/CCD ordering/patching:
  ([PR#103](https://github.com/legacysurvey/legacysurvey/pull/103),
  [PR#104](https://github.com/legacysurvey/legacysurvey/pull/104)).

## 8.0.1 (DR8, 2019-07-31)

- A few additions for outstanding DR8 issues
  ([PR#93](https://github.com/legacysurvey/legacysurvey/pull/93),
  [PR#94](https://github.com/legacysurvey/legacysurvey/pull/94),
  [PR#95](https://github.com/legacysurvey/legacysurvey/pull/95),
  [PR#96](https://github.com/legacysurvey/legacysurvey/pull/96),
  [PR#99](https://github.com/legacysurvey/legacysurvey/pull/99)).

## 8.0.0 (DR8, 2019-07-05)

- Updated to release version for DR8 ([PR#89](https://github.com/legacysurvey/legacysurvey/pull/89)).
- Latest data model.
    - In particular, partition directories by north/south.
    - New files added to the random catalogs.
- General language describing how MzLS/BASS/DECaLS are merged into a single release.
- New pages, including:
    - Updates (major changes in scope since DR7).
    - External catalogs (decription and locations of catalogs used for masking/astrometry/photometry).
    - Bitmasks (the data model for all of the masks in DR8).
- Updates for publications through June, 2019.
- Sharper depth histograms.
- Contents side bars on most pages.
- Address [issue(s) #86](https://github.com/legacysurvey/legacysurvey/issues/86)
- Address [issue(s) #87](https://github.com/legacysurvey/legacysurvey/issues/87)
- Address [issue(s) #88](https://github.com/legacysurvey/legacysurvey/issues/88)

## 7.1.1 (DR7, 2018-10-15)

- A few more updates to correct DR7 [issues](https://github.com/legacysurvey/legacysurvey/issues/84) ([PR#85](https://github.com/legacysurvey/legacysurvey/pull/85)).

## 7.1.0 (DR7, 2018-08-23)

- Additions to address DR7 [issues](https://github.com/legacysurvey/legacysurvey/issues/82) ([PR#83](https://github.com/legacysurvey/legacysurvey/pull/83)). Main changes:
    - Split random files into smaller subsets and place in a dedicated directory.
    - Document the 7.1 versions of the sweeps file.
- Deprecate DR1 and DR2 coadd directories.

## 7.0.1 (DR7, 2018-07-26)

- A few more additions for DR7 ([PR#81](https://github.com/legacysurvey/legacysurvey/pull/81)).

## 7.0.0 (DR7, 2018-07-26)

- Updated to release version for DR7 ([PR#80](https://github.com/legacysurvey/legacysurvey/pull/80)).
- Latest data model (new random catalog, new Gaia and fiber flux columns).
- Latest status and depth histogram plots.
- New more accurate calculations of area using random catalogs for DR7 (and for previous DRs).
- General updates to the description page for area/number of sources/new techniques/zeropoints, etc.
- Updates to publications.

## 6.0.2 (DR6, 2018-04-23)

- Fix typos regarding how to convert depths to magnitudes ([PR#79](https://github.com/legacysurvey/legacysurvey/pull/79)).
- Added extra command options to the DR5/DR6 cutouts.

## 6.0.1 (DR6, 2018-02-27)

- Correct "layer" argument in cutout server example URLs.
- List pixel scales of the coadds, and native Mosaic and 90prime pixel scales.

## 6.0.0 (DR6, 2018-02-23)

- Updated to release version for DR6 ([PR#77](https://github.com/legacysurvey/legacysurvey/pull/77)).
- Latest Data Model.
- Latest status plots.
- Added histogram plots for depth instead of referring back to DR2 calculations.
- General updates to the description page for area/number of sources, etc.
- Links to NOAO's publications page for the LS in addition to updating publications from the LS team.

## 5.0.1 (DR5, 2017-12-07)

- Update to ccds-annotated file to fix which CCDs were used in DR5.

## 5.0.0 (DR5, 2017-10-25)

- Updated to release version for DR5 ([PR#73](https://github.com/legacysurvey/legacysurvey/pull/73)).
- New Data Model where appropriate.
- Added `RELEASE=5000` description.
- Contents toolbars for quick-links on longer pages.
- Additional drop-down menus (*e.g.*, there are now tips and tricks for the viewer).
- `SIMP` has been deprecated by `REX`.
- ordering of bands for photometric model fits has changed.
- acknowledgment is now consistent with NOAO page.

## 4.0.0 (DR4, 2017-06-30)

- Updated to release version for DR4 ([PR#72](https://github.com/legacysurvey/legacysurvey/pull/72)).
- Extensive changes reflecting the new Legacy Survey Data Model.
- Removed references to DECam and made them more generic.
- Added references to MzLS, BASS and DECaLS as the "Legacy Surveys."
- Updated descriptions to new code, where needed.
- New plots for status of observations.
- Recalculated coverage, file sizes etc. for DR4.

## 3.1.1 (2016-11-28)

- Fix order of DEV and EXP in TYPE column ([PR#69](https://github.com/legacysurvey/legacysurvey/pull/69)).

## 3.1.0 (DR3.1, 2016-11-15)

- Add Caveat about tractor and sweep files with bad or corrupted data.

## 3.0.0 (DR3, 2016-09-26)

- Hopefully fixed hidden titles problem.
- Release version for DR3.
