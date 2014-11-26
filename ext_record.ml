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

exception Not_eapp;;
exception Not_label;;
exception Not_record;;

let get_var_sym x = 
  match x with 
  | Evar (sym, _) -> sym
  | _ -> raise Not_label
;;

let is_eapp_sym x = 
  match x with 
  | Eapp (sym, _, _) -> true
  | _ -> false
;;

let get_eapp_sym x = 
  match x with 
  | Eapp (sym, _, _) -> sym
  | _ -> raise Not_eapp
;;

let get_eapp_value x = 
  match x with 
  | Eapp (_, [e], _) -> e 
  | _ -> raise Not_eapp
;;

let is_label sym r = 
  match r with 
  | Eapp ("Datatypes.record", args, _) -> 
     List.exists (fun x -> sym = (get_eapp_sym x)) args
  | _ -> false
;;

let get_value sym r =
  try 
    match r with 
    | Eapp ("Datatypes.record", args, _) -> 
       let field = 
	 List.find (fun x -> sym = (get_eapp_sym x)) args
       in
       get_eapp_value field
    | _ -> raise Not_eapp
  with
  | Not_eapp | Not_found -> raise Not_found
;;

let select e = 
  try 
    match e with 
    | Eapp ("Record.select", [sym; r], _) -> 
       Some ((get_value (get_var_sym sym) r), 1)
    | Enot (Eapp ("Record.select", [sym; r], _), _) -> 
       Some ((enot (get_value (get_var_sym sym) r)), 1)
    | Eapp ("Is_true**Record.select", [sym; r], _) -> 
       Some ((get_value (get_var_sym sym) r), 2)
    | Enot (Eapp ("Is_true**Record.select", [sym; r], _), _) -> 
       Some ((enot (get_value (get_var_sym sym) r)), 2)
    | _ -> None
  with 
  | Not_eapp | Not_found | Not_record -> None
;;

let print_ e = Print.expr_soft (Print.Chan stdout) e
;;

let newnodes_select e g = 
  match select e with
    | Some (value, 1) -> 
       [ Node { 
	     nconc = [e];
	     nrule = Ext ("record", "select", []);
	     nprio = Arity;
	     ngoal = g;
	     nbranches = [| [value] |];
       } ]
    | Some (value, 2) -> 
       [ Node { 
	     nconc = [e];
	     nrule = Ext ("record", "istrue_select", []);
	     nprio = Arity;
	     ngoal = g;
	     nbranches = [| [value] |];
       } ]
    | None -> []
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
let to_llproof tr_expr mlp args = assert false;;
let declare_context_coq oc =
  fprintf oc "Require Import zenon_record.\n";;
let p_rule_coq oc r = ();;
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
