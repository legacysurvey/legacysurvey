.. title: Converting plprocid to a date
.. slug: plprocid

``plprocid`` is a time-based hash used as a unique identifier by the `NOIRLab Community Pipeline`_ (CP). Here are a couple of ways to convert ``plprocid`` to a date.
Note that these methods recover the time in your `local` timezone, which you may have to adjust to reflect the timezone of the CP (Tucson, AZ).

At the Command Line
-------------------

In an editor, store the following script and save it as ``procid2date``:

.. code:: bash

    #!/bin/csh
    set procid = `echo $1 | tr '[:lower:]' '[:upper:]'`
    set unixtime = `echo "ibase=16; $procid * A" | bc`
    date -d @$unixtime '+%Y%m%dT%H%M%S'

Then, for example:

.. code:: bash

    procid2date 91adb7f

    Output: 20180528T163830

(tested on ``x86_64 GNU/Linux`` as displayed by the ``uname -a`` command)

Using Python
------------

.. _`NOIRLab Community Pipeline`: https://www.noao.edu/noao/staff/fvaldes/CPDocPrelim/PL201_3.html

At the Python prompt:

.. code:: python

    import datetime
    datetime.datetime.fromtimestamp(0x91adb7f * 10)

    Output: datetime.datetime(2018, 5, 28, 16, 38, 30)

(tested on ``Python 3.6.6 |Anaconda, Inc.| (default, Jun 28 2018, 17:14:51)``)
