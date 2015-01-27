(* AST corresponding to a Dedukti output *)
type var = string

type term =
  | Dktype                                  (* type type *)
  | Dkprop                                  (* type prop *)
  | Dkseq                                   (* type seq *)
  | Dkproof       of term                   (* type proof of prop *)
  | Dkterm        of term                   (* type term of type *)
  | Dkarrow       of term list              (* type arrow of type alphas list *)
  | Dkpi          of term * term            (* vartype -> arrow *)

  | Dkvar         of var  * term            (* vartype alpha *)
  | Dklam         of term * term            (* vartype alpha => prop of var *)
  | Dkapp         of term * term list       (* app term apply to term list *)

  | Dknot         of term                   (* not of prop *)
  | Dkand         of term * term            (* and of 2 prop *)
  | Dkor          of term * term            (* or of 2 prop *)
  | Dkimply       of term * term            (* imply of 2 prop *)
  | Dkequiv       of term * term            (* equiv of 2 prop *)
  | Dkforall      of term * term            (* forall type prop *)
  | Dkexists      of term * term            (* exists type prop *)
  | Dkforalltype  of term                   (* foralltype prop lambda *)
  | Dkexiststype  of term                   (* existstype prop lambda *)
  | Dktrue                                  (* true *)
  | Dkfalse                                 (* false *)
  | Dkequal       of term * term * term     (* equal type term term *)

type line =
  | Dkdecl of var * term                    (* declaration of symbols *)
  | Dkrwrt of term list * term * term       (* rewrite rules *)

val mk_type             : term
val mk_prop             : term
val mk_seq              : term 
val mk_proof            : term -> term 
val mk_term             : term -> term 
val mk_arrow            : term list -> term 
val mk_pi               : term * term -> term
val mk_var              : var * term -> term
val mk_lam              : term * term -> term 
val mk_app              : term * term list -> term
val mk_not              : term -> term 
val mk_and              : term * term -> term
val mk_or               : term * term -> term
val mk_imply            : term * term -> term
val mk_equiv            : term * term -> term
val mk_forall           : term * term -> term
val mk_exists           : term * term -> term
val mk_foralltype       : term -> term 
val mk_existstype       : term -> term 
val mk_true             : term 
val mk_false            : term 
val mk_equal            : term * term * term -> term

val mk_decl             : var * term -> line
val mk_rwrt             : term list * term * term -> line

val print_line          : out_channel -> line -> unit

