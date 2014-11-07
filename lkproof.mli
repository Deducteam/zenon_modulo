type lkrule =
| SCaxiom of Expr.expr
| SCfalse
| SCtrue
| SCeqref of Expr.expr
| SCeqsym of Expr.expr * Expr.expr
| SCeqprop of Expr.expr * Expr.expr
| SCeqfunc of Expr.expr * Expr.expr
| SCrweak of Expr.expr * lkproof
| SClcontr of Expr.expr * lkproof
| SCcut of Expr.expr * lkproof * lkproof
| SCland of Expr.expr * Expr.expr * lkproof
| SClor of Expr.expr * Expr.expr * lkproof * lkproof
| SClimply of Expr.expr * Expr.expr * lkproof * lkproof
| SClnot of Expr.expr * lkproof
| SClall of Expr.expr * Expr.expr * lkproof
| SClex of Expr.expr * Expr.expr * lkproof
| SCrand of Expr.expr * Expr.expr * lkproof * lkproof
| SCrorl of Expr.expr * Expr.expr * lkproof
| SCrorr of Expr.expr * Expr.expr * lkproof
| SCrimply of Expr.expr * Expr.expr * lkproof
| SCrnot of Expr.expr * lkproof
| SCrall of Expr.expr * Expr.expr * lkproof
| SCrex of Expr.expr * Expr.expr * lkproof
| SCcnot of Expr.expr * lkproof
| SCext of string * string * Expr.expr list * Expr.expr list * Expr.expr list list * lkproof list

and lkproof =
  Expr.expr list * Expr.expr * lkrule
;;

val scaxiom : Expr.expr * Expr.expr list -> lkproof;;
val scfalse : Expr.expr list * Expr.expr -> lkproof;;
val sctrue : Expr.expr list -> lkproof;;
val sceqref : Expr.expr * Expr.expr list -> lkproof;;
val sceqsym : Expr.expr * Expr.expr * Expr.expr list -> lkproof;;
val sceqprop : Expr.expr * Expr.expr * Expr.expr list -> lkproof;;
val sceqfunc : Expr.expr * Expr.expr * Expr.expr list -> lkproof;;
val scrweak : Expr.expr * lkproof -> lkproof;;
val sclcontr : Expr.expr * lkproof -> lkproof;;
val sccut : Expr.expr * lkproof * lkproof -> lkproof;;
val scland : Expr.expr * Expr.expr * lkproof -> lkproof;;
val sclor :
  Expr.expr * Expr.expr * lkproof * lkproof -> lkproof;;
val sclimply :
  Expr.expr * Expr.expr * lkproof * lkproof -> lkproof;;
val sclnot : Expr.expr * lkproof -> lkproof;;
val sclall : Expr.expr * Expr.expr * lkproof -> lkproof;;
val sclex : Expr.expr * Expr.expr * lkproof -> lkproof;;
val scrand :
  Expr.expr * Expr.expr * lkproof * lkproof -> lkproof;;
val scrorl : Expr.expr * Expr.expr * lkproof -> lkproof;;
val scrorr : Expr.expr * Expr.expr * lkproof -> lkproof;;
val scrimply : Expr.expr * Expr.expr * lkproof -> lkproof;;
val scrnot  : Expr.expr * lkproof -> lkproof;;
val scrall : Expr.expr * Expr.expr * lkproof -> lkproof;;
val screx : Expr.expr * Expr.expr * lkproof -> lkproof;;
val sccnot : Expr.expr * lkproof -> lkproof;;
val scext : string * string * Expr.expr list * Expr.expr list * Expr.expr list list * lkproof list -> lkproof;;

val scconc : lkproof -> Expr.expr;;

val p_debug : string -> Expr.expr list -> unit;;
val p_debug_proof : string -> Expr.expr list * Expr.expr * 'a -> unit;;
val ingamma : Expr.expr -> lkproof -> bool;;
val rm : Expr.expr -> Expr.expr list -> Expr.expr list;;
val applytohyps : (lkproof -> lkproof) -> lkproof -> lkproof;;
val hypsofrule : lkrule -> lkproof list;;
val new_var : unit -> Expr.expr;;
