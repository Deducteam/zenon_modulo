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
  | _ -> assert false
;;

let get_value l r = 
  match r with 
  | Eapp ("Record", args, _) 
    -> get_field_value (List.find (is_field_label l) args)
  | _ -> assert false
;;

let istrue e = eapp ("Is_true", [e]);;
let isfalse e = enot (eapp ("Is_true", [e]));;

let newnodes_select e g = 
  match e with 
  | Eapp ("$select" , [l; r], _) -> 
     let value = get_value l r in 
     [ Node { 
	   nconc = [e];
	   nrule = Ext ("Record", "$select", []);
	   nprio = Arity;
	   ngoal = g;
	   nbranches = [| [value] |];
     } ]
  | Enot (Eapp ("$select" , [l; r], _), _) -> 
     let value = get_value l r in 
     [ Node { 
	   nconc = [e];
	   nrule = Ext ("Record", "$select", []);
	   nprio = Arity;
	   ngoal = g;
	   nbranches = [| [enot value] |];
     } ]
  | Eapp ("Is_true**$select", [l; r], _) -> 
     let value = get_value l r in 
     [ Node { 
	   nconc = [e];
	   nrule = Ext ("Record", "Is_true**$select", []);
	   nprio = Arity;
	   ngoal = g;
	   nbranches = [| [istrue value] |];
     } ]
  | Enot (Eapp ("Is_true**$select", [l; r], _), _) -> 
     let value = get_value l r in 
     [ Node { 
	   nconc = [e];
	   nrule = Ext ("Record", "Is_true**$select", []);
	   nprio = Arity;
	   ngoal = g;
	   nbranches = [| [isfalse value] |];
     } ]
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
