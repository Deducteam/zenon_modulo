open Llproof
open Expr
open Printf

let new_terms = ref []
	 
let rec lltollm_expr defs e =
  match e with
  | Evar (v, _) when Hashtbl.mem defs v ->
    let (params, body) = Hashtbl.find defs v in
    lltollm_expr defs body
  | Eapp (s, args, _) when Hashtbl.mem defs s ->
    let exprs = List.map (lltollm_expr defs) args in
    let (params, body) = Hashtbl.find defs s in
    lltollm_expr defs (substitute (List.combine params exprs) body)
  | Evar _ | Etrue | Efalse -> e
  | Eapp (s, args, _) ->
    eapp (s, List.map (lltollm_expr defs) args)
  | Enot (e, _) ->
    enot (lltollm_expr defs e)
  | Eand (e1, e2, _) ->
    eand (lltollm_expr defs e1, lltollm_expr defs e2)
  | Eor (e1, e2, _) ->
    eor (lltollm_expr defs e1, lltollm_expr defs e2)
  | Eimply (e1, e2, _) ->
    eimply (lltollm_expr defs e1, lltollm_expr defs e2)
  | Eequiv (e1, e2, _) ->
    let expr1 = lltollm_expr defs e1 in
    let expr2 = lltollm_expr defs e2 in
    eand (eimply (expr1, expr2), eimply (expr2, expr1))
  | Eall (x, s, e, _) ->
    eall (x, s, lltollm_expr defs e)
  | Eex (x, s, e, _) ->
    eex (x, s, lltollm_expr defs e)
  | Etau (x, s, e, _) ->
    let tau = etau (x, s, e) in
    if List.mem_assoc tau !new_terms
    then
      List.assoc tau !new_terms
    else
      let z = Llmtolk.new_tau () in
      new_terms := (tau, z) :: !new_terms;
      z
  | Elam (x, s, e, _) ->
    elam (x, s, lltollm_expr defs e)
  | Emeta (x, _) ->
     assert false
(* /!\ Raised by a lot of files in SYN (SYN048+1.p, SYN049+1.p, SYN315+1.p, SYN318+1.p, ...) *)

let rec unfold_axiom e =
  match e with
  | Evar _
  | Eapp _ ->
     {conc = [e; enot e];
      hyps = [];
      rule = Raxiom e}
  | Enot (e1, _) ->
     {conc = [e; enot e];
      hyps =
	[unfold_axiom e1];
      rule = Rnotnot e1}
  | Eand (e1, e2, _) ->
     {conc = [e; enot e];
      hyps =
	[{conc = [e1; e2; enot e];
	  hyps = [unfold_axiom e1; unfold_axiom e2];
	  rule = Rnotconnect (And, e1, e2)}];
      rule = Rconnect (And, e1, e2)}
  | Eor (e1, e2, _) ->
     {conc = [e; enot e];
      hyps =
	[{conc = [e1; enot e];
	  hyps = [unfold_axiom e1];
	  rule = Rnotconnect (Or, e1, e2)};
	{conc = [e2; enot e];
	  hyps = [unfold_axiom e2];
	  rule = Rnotconnect (Or, e1, e2)}];
      rule = Rconnect (Or, e1, e2)}
  | Eimply (e1, e2, _) ->
     {conc = [e; enot e];
      hyps =
	[{conc = [e; e1; enot e2];
	  hyps = [unfold_axiom e1; unfold_axiom e2];
	  rule = Rconnect (Imply, e1, e2)}];
      rule = Rnotconnect (Imply, e1, e2)}
  | Etrue ->     
     assert false (* to be implemented later *)
  | Efalse ->
     assert false (* to be implemented later *)
  | Eall (e1, s, e2, _) ->
     let z = Llmtolk.new_tau () in
     {conc = [e; enot e];
      hyps =
	[{conc = [e; enot (substitute [(e1, z)] e2)];
	  hyps = [unfold_axiom (substitute [(e1, z)] e2)];
	  rule = Rall (e, z)}];
      rule = Rnotall (e, z)}
  | Eex (e1, s, e2, _) ->
     let z = Llmtolk.new_tau () in
     {conc = [e; enot e];
      hyps =
	[{conc = [enot e; (substitute [(e1, z)] e2)];
	  hyps = [unfold_axiom (substitute [(e1, z)] e2)];
	  rule = Rnotex (e, z)}];
      rule = Rex (e, z)}
  | Eequiv _ | Etau _ | Elam _ | Emeta _ -> assert false

let rec remove_one e list =
  match list with
  | hd :: tl ->
     if hd = e
     then tl
     else hd :: (remove_one e tl)
  | _ -> assert false
						   
let unfold_equiv p q conc hyps =
  assert (List.mem (eand (eimply (p, q), eimply (q, p))) conc);
  assert (List.length hyps == 2);
  let xconc = remove_one (eand (eimply (p, q), eimply (q, p))) conc in
  assert (List.length xconc == (List.length conc) - 1);
  let hyp1 = (List.nth hyps 0) in
  let hyp2 = (List.nth hyps 1) in
  {conc = conc;
   hyps =
     [{conc = (eimply (p, q)) :: (eimply (q, p)) :: xconc;
       hyps =
	 [{conc = (enot p) :: (eimply (q, p)) :: xconc;
	   hyps =
	     [hyp1; unfold_axiom p];
	   rule = Rconnect (Imply, q, p)};
	  {conc = q :: (eimply (q, p)) :: xconc;
	   hyps =
	     [unfold_axiom q; hyp2];
	   rule = Rconnect (Imply, q, p)}];
       rule = Rconnect (Imply, p, q)}];
   rule = Rconnect (And, eimply (p, q), eimply (q, p))}  

let unfold_notequiv p q conc hyps =
  assert (List.mem (enot (eand (eimply (p, q), eimply (q, p)))) conc);
  assert (List.length hyps == 2);
  let xconc = remove_one (enot (eand (eimply (p, q), eimply (q, p)))) conc in
  assert (List.length xconc == (List.length conc) - 1);
  let hyp1 = (List.nth hyps 0) in
  let hyp2 = (List.nth hyps 1) in
  {conc = conc;
   hyps =
     [{conc = (enot (eimply (p, q))) :: xconc;
       hyps = [hyp2];
       rule = Rnotconnect (Imply, p, q)};
      {conc = (enot (eimply (q, p))) :: xconc;
       hyps = [hyp1];
       rule = Rnotconnect (Imply, q, p)}];
   rule = Rnotconnect (And, eimply (p, q), eimply (q, p))}  

    
let lltollm_rule defs rule =
  match rule with
  | Rfalse -> Rfalse
  | Rnottrue -> Rnottrue
  | Raxiom (p) ->
     assert false
  | Rcut (p) -> Rcut (lltollm_expr defs p)
  | Rnoteq (a) -> Rnoteq (lltollm_expr defs a)
  | Reqsym (a, b) -> Reqsym (lltollm_expr defs a, lltollm_expr defs b)
  | Rnotnot (p) -> Rnotnot (lltollm_expr defs p)
  | Rconnect (b, p, q) -> Rconnect (b, lltollm_expr defs p, lltollm_expr defs q)
  | Rnotconnect (b, p, q) ->
    Rnotconnect (b, lltollm_expr defs p, lltollm_expr defs q)
  | Rex (ep, v) -> Rex (lltollm_expr defs ep, lltollm_expr defs v)
  | Rall (ap, t) -> Rall (lltollm_expr defs ap, lltollm_expr defs t)
  | Rnotex (ep, t) -> Rnotex (lltollm_expr defs ep, lltollm_expr defs t)
  | Rnotall (ap, v) -> Rnotall (lltollm_expr defs ap, lltollm_expr defs v)
  | Rpnotp (e1, e2) -> Rpnotp (lltollm_expr defs e1, lltollm_expr defs e2)
  | Rnotequal (e1, e2) -> Rnotequal (lltollm_expr defs e1, lltollm_expr defs e2)
  | Rdefinition (name, sym, args, body, recarg, c, h) ->
    assert false
  | Rextension (ext, name, args, cons, hyps) ->
     Rextension (
      ext, name, List.map (lltollm_expr defs) args,
      List.map (lltollm_expr defs) cons, List.map (List.map (lltollm_expr defs)) hyps)
  | Rlemma (name, args) ->
    assert false
  | RcongruenceLR (p, a, b) ->
    RcongruenceLR (lltollm_expr defs p, lltollm_expr defs a, lltollm_expr defs b)
  | RcongruenceRL (p, a, b) ->
    RcongruenceRL (lltollm_expr defs p, lltollm_expr defs a, lltollm_expr defs b)

let rec lltollm_proof definitions lemmas proof =
  match proof.rule with
  | Raxiom (p) ->
     let np = lltollm_expr definitions p in
     unfold_axiom np
  | Rconnect (Equiv, p, q) ->
     let np = lltollm_expr definitions p in
     let nq = lltollm_expr definitions q in
     let nconc = List.map (lltollm_expr definitions) proof.conc in
     let nhyps = List.map (lltollm_proof definitions lemmas) proof.hyps in
     unfold_equiv np nq nconc nhyps
  | Rnotconnect (Equiv, p, q) ->
     let np = lltollm_expr definitions p in
     let nq = lltollm_expr definitions q in
     let nconc = List.map (lltollm_expr definitions) proof.conc in
     let nhyps = List.map (lltollm_proof definitions lemmas) proof.hyps in
     unfold_notequiv np nq nconc nhyps
  | Rlemma (name, args) ->
    lltollm_proof definitions lemmas (Hashtbl.find lemmas name)
  | Rdefinition (name, sym, args, body, recarg, c, h) ->
     assert false
    (* begin match proof.hyps with *)
    (* | [hyp] -> lltollm_proof definitions lemmas hyp *)
    (* | _ -> assert false end *)
  | _ ->
    {conc = List.map (lltollm_expr definitions) proof.conc;
     hyps = List.map (lltollm_proof definitions lemmas) proof.hyps;
     rule = lltollm_rule definitions proof.rule}

let lltollm_env definitions env =
  {Llmtolk.hypotheses = List.map (lltollm_expr definitions) env.Llmtolk.hypotheses; 
   Llmtolk.distincts = List.map (fun (e, n) -> lltollm_expr definitions e, n) 
      env.Llmtolk.distincts}
