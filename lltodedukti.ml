open Printf
open Expr
open Llproof
open Namespace

module Translate (Out : Ljtodk.TermSig) =
struct
  
  module LjToDk = Ljtodk.Translate(Out)
    
  let rec trexpr e =
    match e with
    | Eand (Eimply (e1, e2, _), Eimply (e3, e4, _), _)
        when (equal e3 e2 && equal e4 e1) -> Out.mk_equiv (trexpr e1) (trexpr e2)
    | Enot (Enot (Enot (Enot (Enot (e, _), _), _), _), _) ->
       Out.mk_notc (trexpr e)
    | Enot (Enot ( Eand (
      Enot (Enot (e1, _), _), Enot (Enot (e2, _), _), _), _), _) ->
       Out.mk_andc (trexpr e1) (trexpr e2)
    | Enot (Enot ( Eor (
      Enot (Enot (e1, _), _), Enot (Enot (e2, _), _), _), _), _) ->
       Out.mk_orc (trexpr e1) (trexpr e2)
    | Enot (Enot ( Eimply (
      Enot (Enot (e1, _), _), Enot (Enot (e2, _), _), _), _), _) ->
       Out.mk_implyc (trexpr e1) (trexpr e2)
    | Enot (Enot (Etrue, _), _) -> Out.mk_truec
    | Enot (Enot (Efalse, _), _) -> Out.mk_falsec
    | Enot (Enot (
      Eall (e1, s, Enot (Enot (e2, _), _), _), _), _) ->
       Out.mk_forallc (trexpr e1) (trexpr e2)
    | Enot (Enot (
      Eex (e1, s, Enot (Enot (e2, _), _), _), _), _) ->
       Out.mk_existsc (trexpr e1) (trexpr e2)
    | Enot (Enot (Eapp ("=", [e1;e2], _), _), _) ->
       Out.mk_eqc (trexpr e1) (trexpr e2)
    | Evar (v, _) when Mltoll.is_meta v ->
       Out.mk_anyterm
    | Evar (v, _) ->
       Out.mk_var v
    | Eapp ("$string", [Evar (v, _)], _) ->
       Out.mk_var ("S"^v)
    | Eapp ("$string", _, _) -> assert false
    | Eapp ("=", [e1;e2], _) ->
       Out.mk_eq (trexpr e1) (trexpr e2)
    | Eapp (s, args, _) ->
       Out.mk_app (Out.mk_var s) (List.map trexpr args)
    | Enot (e, _) ->
       Out.mk_not (trexpr e)
    | Eand (e1, e2, _) ->
       Out.mk_and (trexpr e1) (trexpr e2)
    | Eor (e1, e2, _) ->
       Out.mk_or (trexpr e1) (trexpr e2)
    | Eimply (e1, e2, _) ->
       Out.mk_imply (trexpr e1) (trexpr e2)
    | Etrue -> Out.mk_true
    | Efalse -> Out.mk_false
    | Eall (e1, s, e2, _) ->
       Out.mk_forall (trexpr e1) (trexpr e2)
    | Eex (e1, s, e2, _) ->
       Out.mk_exists (trexpr e1) (trexpr e2)
    | Elam _ | Eequiv _ | Emeta _ | Etau _ -> assert false

  (* *** COLLECT FREE VARIABLES *** *)

  type result =
    | Typ of Out.term
    | Indirect of string

  let predefined = ["="; "$string"]

  let rec get_freevars ps =
    let symtbl = (Hashtbl.create 97 : (string, int * result) Hashtbl.t) in
    let add_sig sym arity kind =
      if not (Hashtbl.mem symtbl sym) then
        Hashtbl.add symtbl sym (arity, kind)
    in
    let rec get_sig t env e =
      match e with
      | Evar (s, _) -> if not (List.mem s env) then add_sig s 0 t
      | Emeta  _ | Etrue | Efalse -> ()
      | Eapp ("$string", [Evar (s, _)], _) ->
         add_sig ("S"^s) 0 (Typ Out.mk_termtype)
      | Eapp (s, args, _) ->
         add_sig s (List.length args) t;
        List.iter (get_sig (Typ Out.mk_termtype) env) args;
      | Eand (e1, e2, _) | Eor (e1, e2, _)
      | Eimply (e1, e2, _) | Eequiv (e1, e2, _)
        -> get_sig (Typ Out.mk_proptype) env e1;
	  get_sig (Typ Out.mk_proptype) env e2
      | Enot (e1, _) -> get_sig (Typ Out.mk_proptype) env e1;
      | Eall (Evar (v, _), _, e1, _)
        -> get_sig (Typ Out.mk_proptype) (v::env) e1
      | Eall _ -> assert false
      | Eex (Evar (v, _), _, e1, _)
        -> get_sig (Typ Out.mk_proptype) (v::env) e1
      | Eex _ -> assert false
      | Etau _ | Elam _ -> assert false (* no tau nor lambda accepted in phrases *)
    in
    let do_phrase p =
      match p with
      | Phrase.Hyp (name, e, _) ->
         get_sig (Typ Out.mk_proptype) [] e;
      | Phrase.Def (DefReal ("", s, _, e, None)) ->
         get_sig (Indirect s) [] e;
      | _ -> assert false
    in
    List.iter do_phrase ps;
    let rec follow_indirect path s =
      if List.mem s path then Out.mk_proptype else
        begin try
                match Hashtbl.find symtbl s with
	        | (_, Typ t) -> t
	        | (_, Indirect s1) -> follow_indirect (s::path) s1
          with Not_found -> Out.mk_proptype
        end
    in
    let rec add_arrow n ty =
      if n = 0 then ty else
        Out.mk_arrow Out.mk_termtype (add_arrow (n-1) ty) in
    let find_sig sym (arity, kind) l =
      if List.mem sym predefined then l
      else
        let ty =
	  match kind with
	  | Typ t -> t
	  | Indirect s -> follow_indirect [] s in
        (sym, add_arrow arity ty) :: l
    in
    Hashtbl.fold find_sig symtbl []

  (* *** COLLECT TERMS THAT ARE SUPPOSED TO BE PAIRWISE DISTINCTS *** *)

  let get_distincts phrases =
    let rec xget_distincts distincts e =
      match e with
      | Evar _ | Emeta  _ | Etrue | Efalse -> distincts
      | Eapp ("$string", [Evar (s, _)], _) ->
	if not (List.mem_assoc e distincts)
	then (e, (List.length distincts) + 1) :: distincts
	else distincts
      | Eapp (s, args, _) ->
	List.fold_left xget_distincts distincts args;
      | Eand (e1, e2, _) | Eor (e1, e2, _)
      | Eimply (e1, e2, _) | Eequiv (e1, e2, _)
	-> xget_distincts (xget_distincts distincts e1) e2
      | Enot (e1, _) | Eall (_, _, e1, _) | Eex (_, _, e1, _)
	-> xget_distincts distincts e1
      | Etau _ | Elam _ -> assert false (* no tau nor lambda accepted in phrases *) in
    let get_distincts_phrase distincts p =
      match p with
      | Phrase.Hyp (name, e, _) -> xget_distincts distincts e
      | Phrase.Def (DefReal (_, sym, params, body, None)) -> xget_distincts distincts body
      | Phrase.Def (DefReal (_, sym, params, body, Some _)) -> assert false
      | Phrase.Def (DefPseudo (_, _, _, _)) -> assert false
      | Phrase.Def (DefRec (_, _, _, _)) -> assert false
      | Phrase.Sig _ -> assert false
      | Phrase.Inductive _ -> assert false      (* TODO: to implement *) in
    List.fold_left get_distincts_phrase [] phrases
      
(* *** GET THE CONTEXT OF THE LLPROOF *** *)

  let get_definitions phrases =
    let xget_definitions definitions p = match p with
    | Phrase.Hyp (name, e, _) -> ()
    | Phrase.Def (DefReal (_, sym, params, body, None)) ->
      Hashtbl.add definitions sym (params, body)
    | Phrase.Def (DefReal (_, sym, params, body, Some _)) -> assert false
    | Phrase.Def (DefPseudo (_, _, _, _)) -> assert false
    | Phrase.Def (DefRec (_, _, _, _)) -> assert false
    | Phrase.Sig _ -> assert false
    | Phrase.Inductive _ -> assert false      (* TODO: to implement *) in
    let definitions = (Hashtbl.create 97 : (string, Expr.expr list * Expr.expr) Hashtbl.t) in
    List.iter (xget_definitions definitions) phrases; 
    definitions

  let get_lemmas lems = 
    let lemmas = (Hashtbl.create 97 : (string, prooftree) Hashtbl.t) in
    List.iter (fun lem -> Hashtbl.add lemmas lem.name lem.proof) lems;
    lemmas

  let get_env phrases = 
    let xget_env hyps p =
      match p with
      | Phrase.Hyp (name, e, _) when name = goal_name -> hyps
      | Phrase.Hyp (name, e, _) -> e :: hyps
      | Phrase.Def (DefReal (_, sym, params, body, None)) -> hyps
      | Phrase.Def (DefReal (_, sym, params, body, Some _)) -> assert false
      | Phrase.Def (DefPseudo (_, _, _, _)) -> assert false
      | Phrase.Def (DefRec (_, _, _, _)) -> assert false
      | Phrase.Sig _ -> assert false
      | Phrase.Inductive _ -> assert false      (* TODO: to implement *) in
    let hyps = List.fold_left xget_env [] phrases in
    let distincts = get_distincts phrases in 
    let rec get_distinctshyps distincts = 
      match distincts with
      | (x, n) :: (y, m) :: l ->
	enot (eapp ("=", [y; x])) :: (get_distinctshyps ((x, n) :: l))
	@ (get_distinctshyps ((y, m) :: l))
      | _ -> [] in
    {Llmtolk.hypotheses = ((get_distinctshyps distincts)@hyps); 
     Llmtolk.distincts = distincts}

  let rec get_goal phrases =
    match phrases with
    | Phrase.Hyp (name, Enot (e, _), _) :: _ when name = goal_name -> e, true
    | Phrase.Hyp (name, _, _) :: _ when name = goal_name -> assert false
    | _ :: t -> get_goal t
    | [] -> efalse, false

  (* *** CONTEXT PRINTING FUNCTIONS *** *)

  let print_prelude oc name =
    let buf = Buffer.create (2*String.length name) in
    String.iter
      (fun c -> match c with
      | 'a'..'z' | 'A'..'Z' | '0'..'9' -> Buffer.add_char buf c
      | '_' -> Buffer.add_string buf "__"
      | _ -> Buffer.add_string buf ("_"^(string_of_int (int_of_char c)))) name;
    Buffer.add_string buf "todk";
    let prelude = Out.mk_prelude (Buffer.contents buf) in
    Out.print_line oc prelude

  let print_declarations oc freevars =
    let xprint_declarations (sym, ty) = 
      let line = Out.mk_decl (LjToDk.trexpr (evar sym)) ty in
      Out.print_line oc line in
    List.iter xprint_declarations freevars

  let print_definitions oc freevars definitions =
    let xprint_definitions sym (params, body) =
      let varstypes =
	List.map (
	  fun e -> match e with
	  | Evar (v, _) -> let t = List.assoc v freevars in LjToDk.trexpr e, t
	  | _ -> assert false) params in
      let vars, types = List.split varstypes in
      let line = Out.mk_rewrite varstypes 
	(Out.mk_app (Out.mk_var sym) vars) (LjToDk.trexpr body) in
      Out.print_line oc line in
    Hashtbl.iter xprint_definitions definitions

  (* *** MAIN OUTPUT FUNCTION *** *)

  let output oc phrases ppphrases llp filename contextoutput =
    let thm, lemmas =
      match List.rev llp with
      | [] -> assert false
      | thm :: lems -> thm, get_lemmas lems in
    let definitions = get_definitions phrases in
    if contextoutput
    then
      begin
        print_prelude oc filename;
        let freevars = get_freevars phrases in
	print_declarations oc freevars;
        print_definitions oc freevars definitions
      end;
    let env = get_env phrases in
    let goal, righthandside = get_goal phrases in
    let newgoal, newproof, newenv = 
      Lltollm.lltollm_expr definitions goal, 
      Lltollm.lltollm_proof definitions lemmas thm.proof,
      Lltollm.lltollm_env definitions env in
    let ljproof, ljconc = Lktolj.lltolj newenv newproof newgoal righthandside in
    let term = LjToDk.trproof (ljproof, ljconc, []) in
    let rec line =
      Out.mk_deftype (Out.mk_var "conjecture_proof")
        (Out.mk_prf (LjToDk.trexpr ljconc)) term in
    Out.print_line oc line

end

module TranslateDk = Translate(Dkterm)
module TranslateCoq = Translate(ClassicalCoqTerm)

let output = TranslateDk.output
let coq_output = TranslateCoq.output

