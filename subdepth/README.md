
The SUBDEPTH package
====================

## Overview

This package uses some Donald Arseneau code to unify the heights
of math subscripts regardless of the presence of a superscript above.
Compare `$M_n$` to `$M_n'$` in regular LaTeX for why this can be desirable.
(Although note that the default LaTeX behaviour is considered good typographic
practice in general.)

Two package options take this idea to further extremes:

* `[low-sup]` keeps the subscript as low as possible, which has the benefit
  of keeping the superscript close to its original position; the downside to this
  could be that a lone subscript appears visually rather low.

* `[high-sup]` uses the low subscript height of `[low-sup]` and further raises the
  superscript to prevent shifting of the superscripts in cases such as `$A_n^g$` due
  to the depth of the ‘g’.

Further details can be found in the PDF documentation.


## License and copyright

Copyright (C) 2007-2018 by Will Robertson

Distributed under the LaTeX Project Public License,
version 1.3c or higher (your choice). The latest version of
this license is at: <http://www.latex-project.org/lppl.txt>

This work is "maintained" (as per LPPL maintenance status)
by Will Robertson.

This work consists of the files subdepth.dtx and subdepth.ins,
          and the derived files subdepth.sty and subdepth.pdf.
