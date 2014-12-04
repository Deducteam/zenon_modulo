
(* Add a declaration for a global constant. *)
val declare_constant : (string * Expr.expr) -> unit

(* Print the declared constants, one by line *)
val print_constant_decls : out_channel -> unit

(* Type-check a list of phrases, the bool annotation is passed unchanged *)
val phrasebl : (Phrase.phrase * bool) list -> (Phrase.phrase * bool) list
