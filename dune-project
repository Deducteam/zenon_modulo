(lang dune 3.7)

(generate_opam_files true)

(name zenon_modulo)
(source (github Deducteam/zenon_modulo))
(authors "INRIA and contributors")
(maintainers "guillaume.burel@ensiie.fr")
(license BSD-3-Clause)

(package
 (name zenon_modulo)
 (synopsis "Automated theorem prover generating formal proofs")
 (description
"Automated theorem prover for typed first-order logic based on the tableau
method, generating Coq, Dedukti or Lambdapi proofs.")
 (depends
  (ocaml (>= 4.08.0))
))
