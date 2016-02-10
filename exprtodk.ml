(* This module defines operations for translating expressions and
   ljproofs to the Dedukti ASTs defined in Dkterm *)

open Printf
open Expr
open Termsig

module Translate(Dk : TermSig) =
struct

  let tr_string s = 
    let buf = Buffer.create (2*String.length s) in
    let escape = ref false in
    String.iter
      (fun c ->
       match c with
       | 'a'..'z' | 'A'..'Z' -> Buffer.add_char buf c
       | '0'..'9' ->
	  if !escape
	  then 
	    (Buffer.add_char buf '0'; Buffer.add_char buf c; escape := false) 
	  else 
	    Buffer.add_char buf c
       | '_' -> 
	  escape := true; Buffer.add_char buf c
       | _ -> 
	  Buffer.add_string 
	    buf ("_"^(string_of_int (int_of_char c))^"_")) s;
    Buffer.contents buf
  
  (* Translation function from expressions *)
  let rec trexpr e =
    match e with
    (* Formulae *)
    (* We first fold the definitions of logical equivalence
       and classical connectors: *)
    (* | Eand (Eimply (e1, e2, _), Eimply (e3, e4, _), _) *)
    (*     when (equal e3 e2 && equal e4 e1) -> Dk.mk_equiv (trexpr e1) (trexpr e2) *)
    (* Terms *)
    | Evar (v, _) when Mltoll.is_meta v ->
       Dk.mk_anyterm
    | Evar (v, _) ->
       Dk.mk_var (tr_string v)
    | Eapp ("$string", [Evar (v, _)], _) ->
       Dk.mk_var ("S"^(tr_string v))
    | Eapp ("$string", _, _) -> assert false
    | Eapp ("=", [e1;e2], _) ->
       Dk.mk_eq (trexpr e1) (trexpr e2)
    | Eapp (s, args, _) ->
       Dk.mk_app (Dk.mk_var (tr_string s)) (List.map trexpr args)
    (* Intuitionistic connectors *)
    | Enot (e, _) ->
       Dk.mk_not (trexpr e)
    | Eand (e1, e2, _) ->
       Dk.mk_and (trexpr e1) (trexpr e2)
    | Eor (e1, e2, _) ->
       Dk.mk_or (trexpr e1) (trexpr e2)
    | Eimply (e1, e2, _) ->
       Dk.mk_imply (trexpr e1) (trexpr e2)
    | Etrue -> Dk.mk_true
    | Efalse -> Dk.mk_false
    | Eall (e1, s, e2, _) ->
       Dk.mk_forall (trexpr e1) s (trexpr e2)
    | Eex (e1, s, e2, _) ->
       Dk.mk_exists (trexpr e1) s (trexpr e2)
    | Eequiv _ -> assert false                  (* Should have been unfolded earlier *)
    | Etau _ -> assert false                    (* Should have been unfolded *)
    | Elam (e1, s, e2, _) ->
       assert false
       (* Dk.mk_lam (trexpr e1) (Dk.mk_var s) (trexpr e2) *)
    | Emeta _ -> assert false                   (* Meta are forbidden earlier *)
end
