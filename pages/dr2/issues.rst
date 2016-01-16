Known Issues and Workarounds
============================

Some Tractor catalogs contain pixels but zero sources

- Because, in some cases, very few pixels touch a brick, it is entirely
  possible to have zero sources in a Tractor file. For this reason, when
  processing multiple Tractor files as a batch, it is
  recommended to always read in the fits header and check that NAXIS2 > 0