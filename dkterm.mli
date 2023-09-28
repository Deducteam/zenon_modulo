(* AST corresponding to Dedukti format
   common to the dk and the lambdapi output *)
type var = string

type dkterm =
  | Dktypetype                                  (* type type *)
  | Dktypeprop                                  (* type prop *)
  | Dktypeiota                                  (* type iota *)
  | Dkseq                                       (* type seq *)
  | Dkproof       of dkterm                     (* type proof of prop *)
(*  | Dkterm        of dkterm *)                     (* type term of app *)
  | Dkarrow       of dkterm list * dkterm       (* type arrow of type list *)
  | Dkpi          of dkterm * dkterm            (* type pi of var*arrow *)

  | Dkvar         of var  * dkterm              (* term var of string*type *)
  | Dklam         of dkterm * dkterm            (* term lam of var*prop *)
  | Dkapp         of var * dkterm * dkterm list (* term app of string*type*args *)

  | Dknot         of dkterm                    (* not of prop *)
  | Dkand         of dkterm * dkterm           (* and of 2 prop *)
  | Dkor          of dkterm * dkterm           (* or of 2 prop *)
  | Dkimply       of dkterm * dkterm           (* imply of 2 prop *)
  | Dkequiv       of dkterm * dkterm           (* equiv of 2 prop *)
  | Dkforall      of dkterm * dkterm           (* forall of type*lambda *)
  | Dkexists      of dkterm * dkterm           (* exists of type*lambda *)
  | Dkforalltype  of dkterm                    (* foralltype of lambda *)
  | Dkexiststype  of dkterm                    (* existstype of lambda *)
  | Dktrue                                     (* true *)
  | Dkfalse                                    (* false *)
  | Dkequal       of dkterm * dkterm * dkterm  (* equal type*term*term *)

  | DkRfalse        of dkterm
  | DkRnottrue      of dkterm
  | DkRaxiom        of dkterm * dkterm * dkterm
  | DkRnoteq        of dkterm * dkterm * dkterm
  | DkReqsym        of dkterm * dkterm * dkterm * dkterm * dkterm
  | DkRcut          of dkterm * dkterm * dkterm
  | DkRnotnot       of dkterm * dkterm * dkterm
  | DkRand          of dkterm * dkterm * dkterm * dkterm
  | DkRor           of dkterm * dkterm * dkterm * dkterm * dkterm
  | DkRimply        of dkterm * dkterm * dkterm * dkterm * dkterm
  | DkRequiv        of dkterm * dkterm * dkterm * dkterm * dkterm
  | DkRnotand       of dkterm * dkterm * dkterm * dkterm * dkterm
  | DkRnotor        of dkterm * dkterm * dkterm * dkterm
  | DkRnotimply     of dkterm * dkterm * dkterm * dkterm
  | DkRnotequiv     of dkterm * dkterm * dkterm * dkterm * dkterm
  | DkRex           of dkterm * dkterm * dkterm * dkterm
  | DkRall          of dkterm * dkterm * dkterm * dkterm * dkterm
  | DkRnotex        of dkterm * dkterm * dkterm * dkterm * dkterm
  | DkRnotall       of dkterm * dkterm * dkterm * dkterm
  | DkRextype       of dkterm * dkterm * dkterm
  | DkRalltype      of dkterm * dkterm * dkterm * dkterm
  | DkRnotextype    of dkterm * dkterm * dkterm * dkterm
  | DkRnotalltype   of dkterm * dkterm * dkterm
  | DkRsubst        of dkterm * dkterm * dkterm * dkterm * dkterm * dkterm * dkterm
  | DkRconglr       of dkterm * dkterm * dkterm * dkterm * dkterm * dkterm * dkterm
  | DkRcongrl       of dkterm * dkterm * dkterm * dkterm * dkterm * dkterm * dkterm

type line =
  | Dkdecl of var * dkterm                     (* declaration of symbols *)
  | Dkrwrt of dkterm list * dkterm * dkterm    (* rewrite rules *)

val get_dkvar_type      : dkterm -> dkterm
val get_var_newname    : dkterm -> string

val mk_typetype         : dkterm
val mk_typeprop         : dkterm
val mk_typeiota         : dkterm
val mk_seq              : dkterm
val mk_proof            : dkterm -> dkterm
(*val mk_term             : dkterm -> dkterm*)
val mk_arrow            : dkterm list *dkterm -> dkterm
val mk_pi               : dkterm * dkterm -> dkterm
val mk_var              : var * dkterm -> dkterm
val mk_lam              : dkterm * dkterm -> dkterm
val mk_app              : var * dkterm * dkterm list -> dkterm
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

val mk_DkRfalse         : dkterm -> dkterm
val mk_DkRnottrue       : dkterm -> dkterm
val mk_DkRaxiom         : dkterm * dkterm * dkterm -> dkterm
val mk_DkRnoteq         : dkterm * dkterm * dkterm -> dkterm
val mk_DkReqsym         : dkterm * dkterm * dkterm * dkterm * dkterm -> dkterm
val mk_DkRcut           : dkterm * dkterm * dkterm -> dkterm
val mk_DkRnotnot        : dkterm * dkterm * dkterm -> dkterm
val mk_DkRand           : dkterm * dkterm * dkterm * dkterm -> dkterm
val mk_DkRor            : dkterm * dkterm * dkterm * dkterm * dkterm -> dkterm
val mk_DkRimply         : dkterm * dkterm * dkterm * dkterm * dkterm -> dkterm
val mk_DkRequiv         : dkterm * dkterm * dkterm * dkterm * dkterm -> dkterm
val mk_DkRnotand        : dkterm * dkterm * dkterm * dkterm * dkterm -> dkterm
val mk_DkRnotor         : dkterm * dkterm * dkterm * dkterm -> dkterm
val mk_DkRnotimply      : dkterm * dkterm * dkterm * dkterm -> dkterm
val mk_DkRnotequiv      : dkterm * dkterm * dkterm * dkterm * dkterm -> dkterm
val mk_DkRex            : dkterm * dkterm * dkterm * dkterm -> dkterm
val mk_DkRall           : dkterm * dkterm * dkterm * dkterm * dkterm -> dkterm
val mk_DkRnotex         : dkterm * dkterm * dkterm * dkterm * dkterm -> dkterm
val mk_DkRnotall        : dkterm * dkterm * dkterm * dkterm -> dkterm
val mk_DkRextype        : dkterm * dkterm * dkterm -> dkterm
val mk_DkRalltype       : dkterm * dkterm * dkterm * dkterm -> dkterm
val mk_DkRnotextype     : dkterm * dkterm * dkterm * dkterm -> dkterm
val mk_DkRnotalltype    : dkterm * dkterm * dkterm -> dkterm
val mk_DkRsubst         : dkterm * dkterm * dkterm * dkterm * dkterm * dkterm * dkterm -> dkterm
val mk_DkRconglr        : dkterm * dkterm * dkterm * dkterm * dkterm * dkterm * dkterm -> dkterm
val mk_DkRcongrl        : dkterm * dkterm * dkterm * dkterm * dkterm * dkterm * dkterm -> dkterm

val mk_decl             : var * dkterm -> line
val mk_rwrt             : dkterm list * dkterm * dkterm -> line



type declaration = line option;;

type vertex = {
  mutable decl : declaration;
  mutable edge : var list;
}

type graph = (var, vertex) Hashtbl.t
;;

val create : int -> graph;;
val add_sym_graph : graph -> line -> unit;;
val topo_sort : graph -> line list;;
