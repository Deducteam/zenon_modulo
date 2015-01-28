(* AST corresponding to a Dedukti output *)
type var = string

type dkterm =
  | Dktype                                     (* type type *)
  | Dkprop                                     (* type prop *)
  | Dkseq                                      (* type seq *)
  | Dkproof       of dkterm                    (* type proof of prop *)
  | Dkterm        of dkterm                    (* type term of type *)
  | Dkarrow       of dkterm list               (* type arrow of type alphas list *)
  | Dkpi          of dkterm * dkterm           (* vartype -> arrow *)

  | Dkvar         of var  * dkterm             (* vartype alpha *)
  | Dklam         of dkterm * dkterm           (* vartype alpha => prop of var *)
  | Dkapp         of dkterm * dkterm list      (* app term apply to term list *)

  | Dknot         of dkterm                    (* not of prop *)
  | Dkand         of dkterm * dkterm           (* and of 2 prop *)
  | Dkor          of dkterm * dkterm           (* or of 2 prop *)
  | Dkimply       of dkterm * dkterm           (* imply of 2 prop *)
  | Dkequiv       of dkterm * dkterm           (* equiv of 2 prop *)
  | Dkforall      of dkterm * dkterm           (* forall type prop *)
  | Dkexists      of dkterm * dkterm           (* exists type prop *)
  | Dkforalltype  of dkterm                    (* foralltype prop lambda *)
  | Dkexiststype  of dkterm                    (* existstype prop lambda *)
  | Dktrue                                     (* true *)
  | Dkfalse                                    (* false *)
  | Dkequal       of dkterm * dkterm * dkterm  (* equal type term term *)

type line =
  | Dkdecl of var * dkterm                     (* declaration of symbols *)
  | Dkrwrt of dkterm list * dkterm * dkterm    (* rewrite rules *)

val get_dkvar_type      : dkterm -> dkterm

val mk_type             : dkterm
val mk_prop             : dkterm
val mk_seq              : dkterm 
val mk_proof            : dkterm -> dkterm 
val mk_term             : dkterm -> dkterm 
val mk_arrow            : dkterm list -> dkterm 
val mk_pi               : dkterm * dkterm -> dkterm
val mk_var              : var * dkterm -> dkterm
val mk_lam              : dkterm * dkterm -> dkterm 
val mk_app              : dkterm * dkterm list -> dkterm
val mk_not              : dkterm -> dkterm 
val mk_and              : dkterm * dkterm -> dkterm
val mk_or               : dkterm * dkterm -> dkterm
val mk_imply            : dkterm * dkterm -> dkterm
val mk_equiv            : dkterm * dkterm -> dkterm
val mk_forall           : dkterm * dkterm -> dkterm
val mk_exists           : dkterm * dkterm -> dkterm
val mk_foralltype       : dkterm -> dkterm 
val mk_existstype       : dkterm -> dkterm 
val mk_true             : dkterm 
val mk_false            : dkterm 
val mk_equal            : dkterm * dkterm * dkterm -> dkterm

val mk_decl             : var * dkterm -> line
val mk_rwrt             : dkterm list * dkterm * dkterm -> line

val print_line          : out_channel -> line -> unit

