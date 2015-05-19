# ZENON

Zenon is a first-order automated theorem prover based on the tableau method.
It is used in the FoCaLiZe project.

## COPYRIGHT

Under the new BSD License (see the file LICENSE for details)

## INSTALLATION

### DEPENDENCIES

This depends on:
- `OCaml >= 4.02.1`
- `ZArith >= 1.3`
- `Coq >= 8.0`
- Graphviz (optional)

### COMPILATION

In order to compile, use :

    ./configure
    make

This should make available to you the `zenon` executable in the root directory.
If you want to install the binary, then issue the following command:

    make install


## USAGE

### TPTP LIBRARY

In order to use zenon on problems from the tptp problem library, be suze to use
the `-itptp` option in order to set the corret input parser. A standard use of
zenon would then look like this:

    ./zenon -itptp -max-time 60s -max-size 1G /path/to/tptp/problem.p

### ARITHMETIC

In order to activate the arithmetic extension of zenon, you have to use the
`-x arith` option. You should also use the `-k` option, in order to activate
the arithmetic instantiation search. A usual use of zenon on an arithemtic
problem would look like:

    ./zenon -itptp -max-time 60s -max-size 1G \
          -k -x arith $TPTP/Problems/ARI/ARI001\=1.p

### COQ PROOFS

In order to output checkable coq proofs, you have to use the `-ocoq` option.
Additionally, you should use the `-context` and `-opt0` option. A complete
execution of zenon and checking of the proof by the coq compiler afterwards
would look like the following, assuming that your current working directory
is the zenon root directory.

    ./zenon -itptp -max-time 5s -max-size 1G -k -x arith \
          -ocoq -context -opt0 $TPTP/Problems/ARI/ARI001\=1.p > temp.v
    coqc -I ./ temp.v

If no erros are produced, and the `coqc` command has return code `0`, it means
everything went well and the proof has been accepted by the coq compiler.


## MISC

### VERSION NUMBER

The version number starts from scratch fro this extension, but this extension
will be merged into the main branch of Zenon sooner or later.

### LINEAR ARITHMETIC BENCHMARKS

In the source directory, you will find a file `linear_ari_tptp.list`, which
contains a list of linear problems of the `ARI` section of the tptp library.
These problems only involve linear arithmetic, and do not use the `$to_int`,
`$to_rat`, `$to_real`, `$is_int` or `$is_rat` functions and predicates.
This is the list of files used to benchmark the arithmetic extension of zenon
against the princess and beagle automated provers.

## CONTACT

Guillaume Bury <guillaume.bury@inria.fr>

