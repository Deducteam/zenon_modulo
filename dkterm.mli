(* AST corresponding to a Dedukti output *)
type var = string

type term
type line

(* constructor functions *)
val mk_var : var -> term
val mk_lam : term -> term -> term -> term
val mk_lams : term list -> term list -> term -> term
val mk_pi : term -> term -> term -> term
val mk_app : term -> term list -> term
val mk_app2 : term -> term -> term
val mk_app3 : term -> term -> term -> term
val mk_arrow : term -> term -> term
val mk_prf : term -> term
val mk_termtype : term
val mk_proptype : term
val mk_anyterm : term
val mk_not : term -> term
val mk_and : term -> term -> term
val mk_or : term -> term -> term
val mk_imply : term -> term -> term
val mk_forall : term -> string -> term -> term
val mk_exists : term -> string -> term -> term
val mk_true : term
val mk_false : term
val mk_eq : term -> term -> term
val mk_notc : term -> term
val mk_andc : term -> term -> term
val mk_orc : term -> term -> term
val mk_implyc : term -> term -> term
val mk_forallc : term -> string -> term -> term
val mk_existsc : term -> string -> term -> term
val mk_truec : term
val mk_falsec : term
val mk_eqc : term -> term -> term
val mk_equiv : term -> term -> term

val mk_decl : term -> term -> line
val mk_deftype : term -> term -> term -> line
val mk_prelude : string -> line
val mk_rewrite : (term * term) list -> term -> term -> line

(* print functions *)
val print_term : out_channel -> term -> unit
val print_terms : out_channel -> term list -> unit
val print_line : out_channel -> line -> unit
