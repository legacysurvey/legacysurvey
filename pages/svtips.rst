.. title: Sky Viewer Tips & Tricks
.. slug: svtips
.. date: 2012-11-08 00:06:06
.. tags: 
.. has_math: yes

.. |sigma|    unicode:: U+003C3 .. GREEK SMALL LETTER SIGMA
.. |sup2|     unicode:: U+000B2 .. SUPERSCRIPT TWO
.. |delta|    unicode:: U+003B4 .. GREEK SMALL LETTER DELTA
.. |deg|    unicode:: U+000B0 .. DEGREE SIGN
.. |leq|    unicode:: U+2264 .. LESS-THAN-OR-EQUAL-TO SIGN
.. |geq|    unicode:: U+2265 .. GREATER-THAN-OR-EQUAL-TO SIGN
.. |AA|    unicode:: U+212B .. ANGSTROM SYMBOL
.. |mu|    unicode:: U+00B5 .. MICRO SIGN

The Legacy Survey Sky Viewer is generally intuitive, but here are some additional features of which you might not be aware:

#. Each time you reload the page, you'll jump to a new random NGC galaxy within the most recent Legacy Survey footprint.
#. You can jump to a new random galaxy by entering a blank string in the "Jump to object" search box.
#. Clicking on the map will return a popup with a few different options. A particularly useful option is "Link Here", which redirects your browser to a URL that should reproduce what you're seeing - at the correct position, zoom, and layer, with the correct overlays enabled.  This is convenient if you want to share something of note.
#. If you notice something unusual which you'd like to bring to the attention of the LegacySurvey team, you can click on the map and in the popup look for the "Discuss This Object" link.  That will direct you to our discussion forum, with a link back to your object of interest.
#. If you click on the RA,Dec coordinate readout box, you can enter an RA, Dec, and zoom number that you'd like to view.
#. If you select one layer and then select a second layer, you can flip back to the previous layer using the space bar.  This is handy to "blink" between two layers, e.g., to look for moving objects.  You can set up a blink by adding a parameter to the URL: ``&blink=<layer-name>``; `blink example <https://www.legacysurvey.org/viewer/?ra=111.3938&dec=29.4898&zoom=12&layer=ls-dr9&blink=unwise-neo6>`_.
#. Annotations: If you add to the URL an extra parameter ``&mark=1,2;3,4``, the viewer will place yellow circles at RA,Dec = 1,2 and 3,4.  This is useful for marking the position of objects whose RA,Decs you know.  If you add ``&poly=1,2,3,4;5,6,7,8``, it will draw a line from RA,Dec = (1,2) to (3,4) and another polygon from (5,6) to (7,8).  You can draw multiple polygons this way.
#. When fetching cutouts, if you add `&subimage` to the URL, then instead of getting a resampled image, you will get sub-images cut out from our data release coadd products (at a fixed pixel scale of 0.262 arcseconds per pixel).  This will include the image and inverse-variance maps for each band.  If you requested cutout region spans multiple bricks, then you will get cutouts of those multiple images, and since bricks overlap, some sky regions will be covered by more than one subimage; `subimage example <https://www.legacysurvey.org/viewer/cutout.fits?ra=19.8023&dec=10.3749&layer=ls-dr10&size=100&subimage>`_.
#. When fetching cutouts, if you set the `pixscale=0.262`, then you will get images in the same units as our data release coadd image products, which are in "nanomaggy" units, ie, fluxes with a zeropoint of 22.5 mag in the AB system.

Uploading a custom catalog:

#. In the bottom-left corner there is a box to upload a Custom Catalog.  This file can be in FITS or CSV format.  It must contain columns called "RA" and "DEC" (case-insensitive), in decimal degrees.  It may optionally contain columns: "NAME" (giving a label to each point); "COLOR", which can take either color names like "red" and "magenta" or hex codes like "#ff0000"; and "RADIUS", which takes a marker size in arcseconds (default 10 arcseconds.  Check out an `example FITS table </files/example-cat.fits>`_ or `example CSV table </files/example-cat.csv>`_.

A list of the URL patterns that are supported by the viewer is
available `here`_.

.. _`here`: https://www.legacysurvey.org/viewer/urls
