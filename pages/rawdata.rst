.. title: Accessing Raw and Calibrated Images
.. slug: rawdata
.. date: 2012-11-08 00:06:06
.. has_math: yes

.. class:: pull-right well

.. contents::

Data Lab
========

`Astro Data Lab`_ access to raw and calibrated images is available for Legacy Surveys data.

.. _`Astro Data Lab`: https://datalab.noirlab.edu/

Raw and Calibrated Legacy Survey images are available from the `NOIRLab Astro Data Archive`_. The input data used to create the
stacked images, Tractor `catalogs`_, etc. comprise images taken by the dedicated `DESI`_ Legacy Imaging Surveys
project, as well as other images from the NOIRLab telescopes.

.. _`catalogs`: ../dr11/catalogs
.. _`files`: ../dr11/files
.. _`DESI`: https://www.desi.lbl.gov


Web Interface
=============

*Warning:* these instructions are still being updated.

1. Query the `NOIRLab Astro Data archive`_.
2. From the menu of "Available Collections" on the left, select the desired data release (*e.g.* LS-DR11).
3. Under "Data products - Raw data" check "Object".
4. Optionally, you may select data from specific filters, or restrict the search by other parameters such as sky coordinates, observing date, or exposure time.
5. Click "Search".
6. The Results page offers several different ways to download the data.

.. _`NOIRLab Astro Data archive`: https://astroarchive.noirlab.edu/portal/search/
.. .. _`the Tutorials page`: http://archive.noao.edu/tutorials/query


API Query
=========

*Warning:* these instructions are still being updated.

Following the organization of the Stacked images, Raw and Calibrated images are organized
by survey brick, which are defined in the file **survey-bricks-dr11.fits.gz** for DR11. Both the main Tractor
catalogs and Sweep catalogs include the ``BRICKNAME`` keyword (corresponding to ``<brick>`` with
format ``<AAAa>c<BBB>)``.

For the calibrated images, filenames can be retrieved from the ``IMAGE_FILENAME`` keyword in each brick
from *legacysurvey*-``<brick>``-*ccds.fits*. Additionally, each *calibrated*/``<AAA>/<brick>``
contains an ASCII file with a list of ``EXPID`` and ``IMAGE_FILENAME``
(*legacysurvey*-``<brick>``-*image_filename.txt*).
``EXPID`` contains the exposure number and the CCD name with the format ``EXPNUM-ccd``.
There is one entry per CCD. Often, multiple CCDs from a given file are used so there are
fewer unique filenames than the number of CCDs. Each *legacysurvey*-``<brick>``-*image_filename.txt*
file contains the number of unique images in the last row (File Count).

Note that the weight map images (the ``oow`` files) are in the same units as :math:`1/\mathtt{skyrms}^2` in the **survey-ccds-<camera>-dr11.fits.gz** file (documented on the `files`_ page).
But, these images need to be multiplied by both gain and ``exptime`` to retrieve units of electrons (for **<camera>** of **mosaic** or **90prime**).
