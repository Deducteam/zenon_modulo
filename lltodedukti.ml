open Printf
open Expr
open Llproof
open Namespace
open Termsig

module Translate (Out : TermSig) =
struct
  
  module LjToDk = Ljtodk.Translate(Out)

  module TrExpr = Exprtodk.Translate(Out)

  let trexpr = TrExpr.trexpr

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
      | Etau _ -> assert false
      | Elam _ -> distincts (* no tau nor lambda accepted in phrases *) in
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

    | Phrase.Inductive _ -> ()      (* TODO: to implement *)
    in

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
      | Phrase.Hyp (name, e, _) -> (Some name, e) :: hyps
      | Phrase.Def (DefReal (_, sym, params, body, None)) -> hyps
      | Phrase.Def (DefReal (_, sym, params, body, Some _)) -> assert false
      | Phrase.Def (DefPseudo (_, _, _, _)) -> assert false
      | Phrase.Def (DefRec (_, _, _, _)) -> assert false
      | Phrase.Sig _ -> assert false
      | Phrase.Inductive _ -> hyps      (* TODO: to implement *) in
    let hyps = List.fold_left xget_env [] phrases in
    let distincts = get_distincts phrases in 
    let rec get_distinctshyps distincts = 
      match distincts with
      | (x, n) :: (y, m) :: l ->
	(None, enot (eapp ("=", [y; x]))) :: (get_distinctshyps ((x, n) :: l))
	@ (get_distinctshyps ((y, m) :: l))
      | _ -> [] in
    (((get_distinctshyps distincts)@hyps), distincts)

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
      let line = Out.mk_decl (trexpr (evar sym)) ty in
      Out.print_line oc line in
    List.iter xprint_declarations freevars

  let print_definitions oc freevars definitions =
    let xprint_definitions sym (params, body) =
      let varstypes =
	List.map (
	  fun e -> match e with
	  | Evar (v, _) -> let t = List.assoc v freevars in trexpr e, t
	  | _ -> assert false) params in
      let vars, types = List.split varstypes in
      let line = Out.mk_rewrite varstypes 
	(Out.mk_app (Out.mk_var sym) vars) (trexpr body) in
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
    let hyps, distincts = get_env phrases in
    let env = { Llmtolk.hypotheses = List.map snd hyps;
                Llmtolk.distincts = distincts } in
    let goal, righthandside = get_goal phrases in
    let newgoal, newproof, newenv = 
      Lltollm.lltollm_expr definitions goal, 
      Lltollm.lltollm_proof definitions lemmas thm.proof,
      Lltollm.lltollm_env definitions env in
    let gamma =
      if contextoutput
      then []
      else
        List.fold_left
          (fun l -> function
               | (Some name, expr) ->
                  (Lltollm.lltollm_expr definitions expr, Out.mk_var name) :: l
               | _ -> l)
          []
          hyps
    in
    let lkproof = Llmtolk.lltolk newenv newproof newgoal righthandside contextoutput in
    let proof = 
      if !Globals.keepclassical = false
      then Lktolj.lktolj lkproof
      else lkproof in

    (* Output a fake declaration if the proof is constructive (the proven formula is identical to the input one)/ *)
    let (_, lkproofgoal, _) = lkproof in
    let (_, proofgoal, _) = proof in
    if Expr.equal lkproofgoal proofgoal then
      Out.print_line oc (Out.mk_decl (Out.mk_var "Constructive_flag") Out.mk_termtype);

    let conc = Lkproof.scconc proof in
    let term = LjToDk.trproof (proof, conc, gamma) in
    let thm_name =
      if thm.name = ""
      then "conjecture_proof"
      else thm.name
    in
    let rec line =
      Out.mk_deftype (Out.mk_var thm_name)
        (Out.mk_prf (trexpr conc)) term in
    if contextoutput
    then
      Out.print_line oc line
    else
      Out.print_term oc term

end

module TranslateDk = Translate(Dkterm)
module TranslateCoq = Translate(ClassicalCoqTerm)

let output = TranslateDk.output
let coq_output = TranslateCoq.output

