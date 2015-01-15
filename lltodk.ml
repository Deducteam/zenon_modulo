(*  Copyright 2004 INRIA  *)
Version.add "$Id$";;

open Printf;;

open Expr;;
open Llproof;;
open Exprtodk;;

let get_signatures phrases = 
  let sig_tbl = (Hashtbl.create 999 : (string,  expr) Hashtbl.t) in 
  let add_sig sym ar e = 
    if not (Hashtbl.mem sig_tbl sym) then 
      Hashtbl.add sig_tbl sym e
  in
  let rec get_sig env e = 
    match e with 
    | Evar (s, _) -> 
       if not (List.mem s env) then add_sig s 0 e
    | Emeta _ 
    | Etrue 
    | Efalse -> ()
    | e when (Expr.equal e type_type) -> ()
    | Earrow (args, ret, _) -> 
       List.iter (get_sig env) (ret :: args);
    | Eapp (Evar (s, _) as s', args, _) -> 
       add_sig s (List.length args) e;
       List.iter (get_sig env) ((get_type s') :: args);
    | Eapp _ -> assert false
    | Eand (e1, e2, _) 
    | Eor (e1, e2, _) 
    | Eimply (e1, e2, _) 
    | Eequiv (e1, e2, _) -> 
       List.iter (get_sig env) [e1; e2];
    | Enot (e1, _) -> 
       get_sig env e1;
    | Eall (Evar (v, _), e1, _) -> 
       get_sig (v :: env) e1;
    | Eall _ -> assert false
    | Eex (Evar (v, _), e1, _) -> 
       get_sig (v :: env) e1;
    | Eex _ -> assert false
    | Etau _ 
    | Elam _  -> assert false
  in
  let do_phrase p = 
    match p with 
    | Phrase.Hyp (name, e, _) 
    | Phrase.Rew (name, e, _) ->
       get_sig [] e;
    | _ -> assert false
  in
  List.iter do_phrase phrases;
  Hashtbl.fold (fun x y l -> (x,y)::l) sig_tbl []
;;

let output oc phrases llp =
  fprintf oc "#NAME tocheck";
  let sigs = get_signatures phrases in 
  let sigs = List.map (fun (x, y) -> (x, trexprdk y)) sigs in
  List.iter (fun (x, y) -> fprintf oc "%s : " x;
			   Dkterm.print_term oc y;
			   fprintf oc ".\n") 
	    sigs;
  []
;;
