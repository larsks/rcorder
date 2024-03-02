This is a port of NetBSD's [rcorder] command to Linux (via FreeBSD).

[rcorder]: https://man.netbsd.org/rcorder.8

## REQUIREMENTS

This port requires [libbsd] to provide Linux versions of some common *BSD functions.

[libbsd]: https://libbsd.freedesktop.org/wiki/

## DESCRIPTION

The  `rcorder` utility is designed to print out a dependency ordering of a set of interdependent files.  Typically it is used to find an execution sequence for a set of shell scripts in which certain files must be executed before others.

Each file passed to `rcorder` must be annotated with special lines (which look like comments to the shell) which indicate the  dependencies  the  files  have  upon  certain  points  in  the sequence, known as "conditions", and which indicate, for each file, which "conditions" may be expected to be filled by that file.

Within each file, a block containing a series of `REQUIRE`, `PROVIDE`, `BEFORE` and `KEYWORD` lines must appear.  The format of the lines is rigid.  Each line must begin with a single `#`, followed by a single space, followed by `PROVIDE:`, `REQUIRE:`, `BEFORE:`, or `KEYWORD:`.  No deviation is permitted.  Each dependency line is then followed by a series of conditions,  separated  by  whitespace.   Multiple `PROVIDE`, `REQUIRE`, `BEFORE` and `KEYWORD` lines may appear, but all such lines must appear in a sequence without any intervening lines, as once a line that does not follow the format is reached, parsing stops.

An example block follows:

      # REQUIRE: networking syslog
      # REQUIRE: usr
      # PROVIDE: dns nscd

This block states that the file in which it appears depends upon the `networking`, `syslog`, and `usr` conditions, and provides the
`dns` and `nscd` conditions.

A  file  may  contain zero `PROVIDE` lines, in which case it provides no conditions, and may contain zero `REQUIRE` lines, in which case it has no dependencies.  There must be at least one file with no dependencies in the set of arguments passed to `rcorder` in order for it to find a starting place in the dependency ordering.
