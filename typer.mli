
(* Parameters of the type checking/inference functions *)
type opts =
    {
      default_type : Expr.expr;      (* A type to associate to free variables *)
      scope_warnings : bool;    (* Should we warn when we encounter free variables? *)
      undeclared_functions_warning : bool; (* Should we warn when we encounter undeclared function symbols? *)
      register_new_constants : bool; (* If we infer the type of an unknown function symbol, should we register it? *)
      fully_type : bool;             (* Should everything be typed? *)
    }
;;

(* Add a declaration for a global constant. *)
val declare_constant : (string * Expr.expr) -> unit

(* Print the declared constants, one by line *)
val print_constant_decls : out_channel -> unit

(* Type-check a list of phrases, the bool annotation is passed unchanged *)
val phrasebl : opts -> (Phrase.phrase * bool) list -> (Phrase.phrase * bool) list
