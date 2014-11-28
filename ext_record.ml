(*  Copyright 2006 INRIA  *)
Version.add "$Id$";;

(* Extension for record types:
   - pattern-matching
   - injectivity
   - inductive proofs
   - local fixpoint definitions
*)

open Printf;;

open Expr;;
open Misc;;
open Mlproof;;
open Node;;
open Phrase;;
open Llproof;;

exception Record_error;;

let arity_warning s =
  Error.warn (sprintf "defined symbol %s is used with wrong arity" s)
;;

let higher_order_warning s =
  Error.warn (sprintf "symbol %s is used in higher-order substitution" s);
;;

let get_label rf = 
  match rf with 
  | Eapp ("Record_field", [Evar (l, _); v], _) 
    -> l
  | _ -> raise Record_error
;;

let compare_label rf1 rf2 = 
  String.compare (get_label rf1) (get_label rf2)
;;

let contains_sub big sub = 
  let length = String.length sub in 
  if (String.length big) > length then
    (String.sub big 0 length) = sub
  else false
;;

let is_field_label l f = 
  match f with 
  | Eapp ("Record_field", [l1; v], _) when (Expr.equal l l1) 
    -> true 
  | _ -> false
;;

let get_field_value f = 
  match f with 
  | Eapp ("Record_field", [l; v], _) 
    -> v
  | _ -> raise Record_error
;;

let get_value l r = 
  match r with 
  | Eapp (sym, args, _) when contains_sub sym "Record_"
    -> get_field_value (List.find (is_field_label l) args)
  | _ -> raise Record_error
;;

let istrue e = eapp ("Is_true", [e]);;
let isfalse e = enot (eapp ("Is_true", [e]));;

let newnodes_select e g = 
  let mk_unfold ctx p args =
    try
      let (d, params, body) = Index.get_def p in
      let prio = match d with DefRec _ -> Inst e | _ -> Prop in
      match params, args, body with
      | [], Some aa, Evar (b, _) ->
         let unfolded = ctx (eapp (b, aa)) in
         [ Node {
           nconc = [e];
           nrule = Definition (d, e, unfolded);
           nprio = prio;
           ngoal = g;
           nbranches = [| [unfolded] |];
         }; Stop ]
      | _ ->
         let aa = match args with None -> [] | Some l -> l in
         let subst = List.map2 (fun x y -> (x,y)) params aa in
         let unfolded = ctx (substitute_2nd subst body) in
         [ Node {
           nconc = [e];
           nrule = Definition (d, e, unfolded);
           nprio = prio;
           ngoal = g;
           nbranches = [| [unfolded] |];
         }; Stop ]
    with
    | Higher_order -> higher_order_warning p; []
    | Invalid_argument "List.map2" -> arity_warning p; []
    | Not_found -> assert false
  in
  try
    match e with 
    | Eapp (sym , [l; r], _) 
	 when contains_sub sym "$select_" -> 
       let value = get_value l r in 
       [ Node { 
	     nconc = [e];
	     nrule = Ext ("record", "select", [e; l; r]);
	     nprio = Arity;
	     ngoal = g;
	     nbranches = [| [value] |];
       }; Stop ]
    | Enot (Eapp (sym , [l; r], _), _) 
	 when contains_sub sym "$select_" -> 
       let value = get_value l r in 
       [ Node { 
	     nconc = [e];
	     nrule = Ext ("record", "not_select", [e; l; r]);
	     nprio = Arity;
	     ngoal = g;
	     nbranches = [| [enot value] |];
       }; Stop ]
    | Eapp (sym, [l; r], _) 
	 when contains_sub sym "Is_true**$select_" -> 
       let value = get_value l r in 
       [ Node { 
	     nconc = [e];
	     nrule = Ext ("record", "istrue_select", [e; l; r]);
	     nprio = Arity;
	     ngoal = g;
	     nbranches = [| [istrue value] |];
       }; Stop ]
    | Enot (Eapp (sym, [l; r], _), _) 
	 when contains_sub sym "Is_true**$select_" -> 
       let value = get_value l r in 
       [ Node { 
	     nconc = [e];
	     nrule = Ext ("record", "not_istrue_select", [e; l; r]);
	     nprio = Arity;
	     ngoal = g;
	     nbranches = [| [isfalse value] |];
       }; Stop ]
  with 
  | Record_error -> []
  | _ -> []
;;
       
let newnodes e g _ = 
    newnodes_select e g
;;

let make_inst m term g = assert false;;
let add_formula e = ();;
let remove_formula e = ();;
let preprocess l = l;;
let add_phrase x = ();;
let postprocess l = l;;


let to_llargs tr_expr r =
  match r with
  | Ext ("record", "select", [e; l; r]) -> 
     let h = tr_expr (get_value l r) in 
     let c = tr_expr e in 
     ("zenon_record_select", [tr_expr e], [c], [ [h] ])
  | Ext ("record", "not_select", [e; l; r]) -> 
     let h = tr_expr (enot (get_value l r)) in 
     let c = tr_expr e in 
     ("zenon_record_not_select", [tr_expr e], [c], [ [h] ])
  | Ext ("record", "istrue_select", [e; l; r]) -> 
     let h = tr_expr (istrue (get_value l r)) in 
     let c = tr_expr e in 
     ("zenon_record_istrue_select", [tr_expr e], [c], [ [h] ])
  | Ext ("record", "not_istrue_select", [e; l; r]) -> 
     let h = tr_expr (isfalse (get_value l r)) in 
     let c = tr_expr e in 
     ("zenon_record_not_istrue_select", [tr_expr e], [c], [ [h] ])
  | Ext (x, y, _) ->
     Printf.eprintf "unknown extension rule %s/%s\n" x y;
     assert false
  | _ -> assert false
;;

let to_llproof tr_expr mlp args =
  let (name, meta, con, hyp) = to_llargs tr_expr mlp.mlrule in
  let (subs, exts) = List.split (Array.to_list args) in
  let ext = List.fold_left Expr.union [] exts in
  let extras = Expr.diff ext mlp.mlconc in
  let nn = {
      Llproof.conc = List.map tr_expr mlp.mlconc;
      Llproof.rule = Llproof.Rextension ("record", name, meta, con, hyp);
      Llproof.hyps = subs;
    }
  in (nn, extras)
;;

let declare_context_coq oc =
  fprintf oc "Require Import zenon_record.\n";;

let p_rule_coq oc r = ()
;;

let predef () = [];;

Extension.register {
  Extension.name = "record";
  Extension.newnodes = newnodes;
  Extension.make_inst = make_inst;
  Extension.add_formula = add_formula;
  Extension.remove_formula = remove_formula;
  Extension.preprocess = preprocess;
  Extension.add_phrase = add_phrase;
  Extension.postprocess = postprocess;
  Extension.to_llproof = to_llproof;
  Extension.declare_context_coq = declare_context_coq;
  Extension.p_rule_coq = p_rule_coq;
  Extension.predef = predef;
};;
