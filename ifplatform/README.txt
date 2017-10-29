______________________
The IFPLATFORM package
v0.4a       2017/10/13

This package uses heuristics to establish whether
the document is being processed on Windows or a *NIX
platform (Mac OS X, Linux, etc.).

Except if you're using LuaTeX where this information
is already known. Otherwise, shell escape is required
to differentiate different *NIX platforms.

Booleans provided are:
 - ifwindows
 - iflinux
 - ifmacosx
 - ifcygwin

Finally, the \platformname macro is also provided that
expands to a string of the platform name.

# TODO

## Fails if spaces appear in \jobname (@rgov)

> The issue seems to be that ifplatform is naming the file "Foo Bar".w18 (due to LaTeX automatically adding quotes to\jobname), which causes the shell commands it executes to do unexpected things. For instance, when you execute uname -s > ""Foo Bar".w18" this outputs to a file named Foo; ifplatform then tries to use catchfile to read in "Foo Bar".w18 (which doesn't exist), and then deletes Foo.

> I think the best bet is to remove the quotes around \ip@file in the shell commands.




Will Robertson         wspr 81 at gmail dot com
Johannes Große

Copyright 2007-2017 Will Robertson
Copyright 2007      Johannes Große
Distributed under the LaTeX Project Public License
