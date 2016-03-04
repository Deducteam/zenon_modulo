type ljproof = private
| SCaxiom of Expr.expr
| SCfalse
| SCtrue
| SCeqsym of Expr.expr * Expr.expr
| SCeqprop of Expr.expr * Expr.expr
| SCeqfunc of Expr.expr * Expr.expr
| SClcontr of Expr.expr * ljproof
| SCrweak of Expr.expr * ljproof
| SCcut of Expr.expr * ljproof * ljproof
| SCland of Expr.expr * Expr.expr * ljproof
| SClor of Expr.expr * Expr.expr * ljproof * ljproof
| SClimply of Expr.expr * Expr.expr * ljproof * ljproof
| SClnot of Expr.expr * ljproof
| SClall of Expr.expr * Expr.expr * ljproof
| SClex of Expr.expr * Expr.expr * ljproof
| SCrand of Expr.expr * Expr.expr * ljproof * ljproof
| SCrorl of Expr.expr * Expr.expr * ljproof
| SCrorr of Expr.expr * Expr.expr * ljproof
| SCrimply of Expr.expr * Expr.expr * ljproof
| SCrnot of Expr.expr * ljproof
| SCrall of Expr.expr * Expr.expr * ljproof
| SCrex of Expr.expr * Expr.expr * ljproof
;;

val scaxiom : Expr.expr -> ljproof;;
val scfalse : ljproof;;
val sctrue : ljproof;;
val sccut : Expr.expr * ljproof * ljproof -> ljproof;;
val scland : Expr.expr * Expr.expr * ljproof -> ljproof;;
val sclor :
  Expr.expr * Expr.expr * ljproof * ljproof -> ljproof;;
val sclimply :
  Expr.expr * Expr.expr * ljproof * ljproof -> ljproof;;
val sclnot : Expr.expr * ljproof -> ljproof;;
val scrand :
  Expr.expr * Expr.expr * ljproof * ljproof -> ljproof;;
val scrorl : Expr.expr * Expr.expr * ljproof -> ljproof;;
val scrorr : Expr.expr * Expr.expr * ljproof -> ljproof;;
val scrimply : Expr.expr * Expr.expr * ljproof -> ljproof;;
val scrnot  : Expr.expr * ljproof -> ljproof;;
val scrweak  : Expr.expr * ljproof -> ljproof;;
val sclall : Expr.expr * Expr.expr * ljproof -> ljproof;;
val sclex : Expr.expr * Expr.expr * ljproof -> ljproof;;
val scrall : Expr.expr * Expr.expr * ljproof -> ljproof;;
val screx : Expr.expr * Expr.expr * ljproof -> ljproof;;
val sclcontr : Expr.expr * ljproof -> ljproof;;
(* val sceqsym : Expr.expr * Expr.expr * Expr.expr list -> ljproof;; *)
(* val sceqprop : Expr.expr * Expr.expr * Expr.expr list -> ljproof;; *)
(* val sceqfunc : Expr.expr * Expr.expr * Expr.expr list -> ljproof;; *)

val print : ljproof -> unit;;
