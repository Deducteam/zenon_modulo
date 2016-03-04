type lkproof = private
| SCaxiom of Expr.expr
| SCweak of Expr.expr list * Expr.expr list * lkproof
| SClcontr of Expr.expr * lkproof
| SCrcontr of Expr.expr * lkproof
| SCfalse
| SCtrue
| SClnot of Expr.expr * lkproof
| SCrnot of Expr.expr * lkproof
| SClimply of Expr.expr * Expr.expr * lkproof * lkproof
| SCrimply of Expr.expr * Expr.expr * lkproof
| SCland of Expr.expr * Expr.expr * lkproof
| SCrand of Expr.expr * Expr.expr * lkproof * lkproof
| SClor of Expr.expr * Expr.expr * lkproof * lkproof
| SCror of Expr.expr * Expr.expr * lkproof
| SClall of Expr.expr * Expr.expr * lkproof
| SCrall of Expr.expr * Expr.expr * lkproof
| SClex of Expr.expr * Expr.expr * lkproof
| SCrex of Expr.expr * Expr.expr * lkproof
;;

type typed_lkproof = private
  Expr.expr list * Expr.expr list * lkproof
;;

val lkproof : typed_lkproof -> lkproof;;  
val sequent : typed_lkproof -> Expr.expr list * Expr.expr list;;
val scaxiom : Expr.expr -> typed_lkproof;;
val scfalse : typed_lkproof;;
val sctrue : typed_lkproof;;
val sclcontr : Expr.expr * typed_lkproof -> typed_lkproof;;
val scrcontr : Expr.expr * typed_lkproof -> typed_lkproof;;
val scweak : Expr.expr list * Expr.expr list * typed_lkproof -> typed_lkproof;;
val scland : Expr.expr * Expr.expr * typed_lkproof -> typed_lkproof;;
val sclor : Expr.expr * Expr.expr * typed_lkproof * typed_lkproof -> typed_lkproof;;
val sclimply : Expr.expr * Expr.expr * typed_lkproof * typed_lkproof -> typed_lkproof;;
val sclnot : Expr.expr * typed_lkproof -> typed_lkproof;;
val scrand : Expr.expr * Expr.expr * typed_lkproof * typed_lkproof -> typed_lkproof;;
val scror : Expr.expr * Expr.expr * typed_lkproof -> typed_lkproof;;
val scrimply : Expr.expr * Expr.expr * typed_lkproof -> typed_lkproof;;
val scrnot  : Expr.expr * typed_lkproof -> typed_lkproof;;
val sclall : Expr.expr * Expr.expr * typed_lkproof -> typed_lkproof;;
val sclex : Expr.expr * Expr.expr * typed_lkproof -> typed_lkproof;;
val scrall : Expr.expr * Expr.expr * typed_lkproof -> typed_lkproof;;
val screx : Expr.expr * Expr.expr * typed_lkproof -> typed_lkproof;;

(* val sceqsym : Expr.expr * Expr.expr * Expr.expr list -> lkproof;; *)
(* val sceqprop : Expr.expr * Expr.expr * Expr.expr list -> lkproof;; *)
(* val sceqfunc : Expr.expr * Expr.expr * Expr.expr list -> lkproof;; *)

val new_var : unit -> Expr.expr;;
val print : lkproof -> unit;;
val premises : typed_lkproof -> typed_lkproof list;;
val applytopremises :
  (typed_lkproof -> typed_lkproof) -> typed_lkproof -> typed_lkproof;;
