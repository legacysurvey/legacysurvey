.. title: Description of how AVSKY is calculated
.. slug: avsky
.. tags: mathjax

Description of how AVSKY is calculated
======================================

.. _`Legacy Survey Data Release 2`: ../../dr2

(Courtesy of Frank Valdes, NSF's OIR Lab)

``AVSKY`` is measured in each CCD after standard detrending and before any pupil and sky 
structure subtraction.  This is done by the Automatic Cataloging Environment (ACE) 
system I developed.  For the purposes of this discussion you can think of it as a 
SExtractor type of thing.  ACE does a very careful measurement of the background in an 
image excluding sources and any masked data.  One result of this is the scalar quantity 
``AVSKY`` which is the average of this sky image that captures the background structure at a 
scale of roughly 200 pixels and is then used as part of the global pattern structure removal.

So, in the :math:`ooi` data products (which I believe is what is in the 
`Legacy Survey Data Release 2`_ catalog) each CCD 
has a different value of ``AVSKY`` and will vary due to gradients, the pupil reflections, 
and residual gain errors (corrected further later with a dark sky flat field).  In the 
`oki` data products which apply a local sky subtraction (in a sense similar to what `the 
Tractor` does) the ``AVSKY`` value is the average of all the individual CCD values and is a 
global header parameter.  The :math:`oki` data also has the same effect of removing light 
around big/bright sources in a CCD while the `ooi` data by itself is less affected until 
sources are on the scale of a whole CCD or more.

The keyword ``SKYSUB`` is the average value of the sky across all CCDs after pupil 
pattern and large scale background surface fit to remove gradients and other 
non-local structure.  The final sky that is derived and 
subtracted has the zeroth order term (the ``mean=SKYSUB``) removed in order to leave the 
data with approximately the same count level.

I now realize that it is an oversight that there is no measure of the per CCD 
background after the pupil and low order background structure removal.  In other 
words ``AVSKY`` should probably be corrected by the average of whatever correction is 
applied in each CCD but that is not currently the case.  In as much as these large 
pattern subtraction steps bring the focal plane to a uniform background, ``SKYSUB`` is the 
best background value and ``AVSKY`` - ``SKYSUB`` would be a crude measure of the background 
pattern removed.  Of course, whatever is done at `the Tractor` level with background 
would also not be represented in the ``AVSKY`` values.

I would also note that exposures taken with a bright moon, typically in the :math:`z`-band, 
there can be a fairly strong background gradient and structure.  Also the pupil 
pattern is significant in :math:`g` and :math:`z` and can reach amplitudes of several percent of sky.