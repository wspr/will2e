______________________
The IFPLATFORM package
v0.3a       2009/09/10

This package uses heuristics to establish whether
the document is being processed on Windows or a *NIX
platform (Mac OS X, Linux, etc.).

Shell escape is required to differentiate different *NIX platforms.

Booleans provided are:
 - ifwindows
 - iflinux
 - ifmacosx
 - ifcygwin

Finally, the \platformname macro is also provided that
expands to a string of the platform name.

Will Robertson         wspr 81 at gmail dot com
Johannes Große

Copyright 2007, 2009 Will Robertson
Distributed under the LaTeX Project Public License
