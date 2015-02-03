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

  | DkRfalse 
  | DkRnottrue
  | DkRaxiom        of dkterm                              (* p *)
  | DkRnoteq        of dkterm * dkterm                     (* a -> t:a *)
  | DkReqsym        of dkterm * dkterm * dkterm            (* a -> t:a -> u a *)
  | DkRcut          of dkterm * dkterm * dkterm            (* p -> prf -> prf *)
  | DkRnotnot       of dkterm * dkterm                     (* p -> prf *)
  | DkRand          of dkterm * dkterm * dkterm            (* p -> q -> prf *)
  | DkRor           of dkterm * dkterm * dkterm * dkterm   (* p -> q -> prf -> prf *)
  | DkRimply        of dkterm * dkterm * dkterm * dkterm   (* p -> q -> prf -> prf *)
  | DkRequiv        of dkterm * dkterm * dkterm * dkterm   (* p -> q -> prf -> prf *)
  | DkRnotand       of dkterm * dkterm * dkterm * dkterm   (* p -> q -> prf -> prf *)
  | DkRnotor        of dkterm * dkterm * dkterm            (* p -> q -> prf *)
  | DkRnotimply     of dkterm * dkterm * dkterm            (* p -> q -> prf *)
  | DkRnotequiv     of dkterm * dkterm * dkterm * dkterm   (* p -> q -> prf -> prf *)
  | DkRex           of dkterm * dkterm * dkterm            (* a -> p -> (t:a -> prf) *)
  | DkRall          of dkterm * dkterm * dkterm * dkterm   (* a -> p -> t:a -> prf *)
  | DkRnotex        of dkterm * dkterm * dkterm * dkterm   (* a -> p -> t:a -> prf *)
  | DkRnotall       of dkterm * dkterm * dkterm            (* a -> p -> (t:a -> prf) *)
  | DkRextype       of dkterm * dkterm                     (* p -> (a -> prf) *)
  | DkRalltype      of dkterm * dkterm * dkterm            (* p -> a -> prf *)
  | DkRnotextype    of dkterm * dkterm * dkterm            (* p -> a -> prf *)
  | DkRnotalltype   of dkterm * dkterm                     (* p -> (a -> prf) *)
  | DkRconglr       of dkterm * dkterm * dkterm * dkterm * dkterm 
  | DkRcongrl       of dkterm * dkterm * dkterm * dkterm * dkterm 

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

val mk_DkRfalse         : dkterm
val mk_DkRnottrue       : dkterm
val mk_DkRaxiom         : dkterm -> dkterm
val mk_DkRnoteq         : dkterm * dkterm -> dkterm
val mk_DkReqsym         : dkterm * dkterm * dkterm -> dkterm
val mk_DkRcut           : dkterm * dkterm * dkterm -> dkterm
val mk_DkRnotnot        : dkterm * dkterm -> dkterm
val mk_DkRand           : dkterm * dkterm * dkterm -> dkterm
val mk_DkRor            : dkterm * dkterm * dkterm * dkterm -> dkterm
val mk_DkRimply         : dkterm * dkterm * dkterm * dkterm -> dkterm
val mk_DkRequiv         : dkterm * dkterm * dkterm * dkterm -> dkterm
val mk_DkRnotand        : dkterm * dkterm * dkterm * dkterm -> dkterm
val mk_DkRnotor         : dkterm * dkterm * dkterm -> dkterm
val mk_DkRnotimply      : dkterm * dkterm * dkterm -> dkterm
val mk_DkRnotequiv      : dkterm * dkterm * dkterm * dkterm -> dkterm
val mk_DkRex            : dkterm * dkterm * dkterm -> dkterm
val mk_DkRall           : dkterm * dkterm * dkterm * dkterm -> dkterm
val mk_DkRnotex         : dkterm * dkterm * dkterm * dkterm -> dkterm
val mk_DkRnotall        : dkterm * dkterm * dkterm -> dkterm
val mk_DkRextype        : dkterm * dkterm -> dkterm
val mk_DkRalltype       : dkterm * dkterm * dkterm -> dkterm
val mk_DkRnotextype     : dkterm * dkterm * dkterm -> dkterm
val mk_DkRnotalltype    : dkterm * dkterm -> dkterm
val mk_DkRconglr        : dkterm * dkterm * dkterm * dkterm * dkterm -> dkterm
val mk_DkRcongrl        : dkterm * dkterm * dkterm * dkterm * dkterm -> dkterm

val mk_decl             : var * dkterm -> line
val mk_rwrt             : dkterm list * dkterm * dkterm -> line

val print_line          : out_channel -> line -> unit
val print_goal_type     : out_channel -> string -> dkterm -> unit
val print_proof         : out_channel -> string -> dkterm -> unit


type declaration = 
  | Some of line       (* line is a Dkdecl here *)
  | None
;;

type vertex = { 
  mutable decl : declaration;
  mutable edge : var list;
}

type graph = (var, vertex) Hashtbl.t
;;

val create : int -> graph;;
val add_sym_graph : graph -> line -> unit;;
val topo_sort : graph -> line list;;
