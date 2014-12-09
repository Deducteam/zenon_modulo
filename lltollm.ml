open Llproof
open Expr
open Printf

let new_terms = ref []

let new_tau =
  let r = ref 0 in
  fun () ->
    let n = !r in
    incr r;
    evar (sprintf "tau%d" n)

let rec lltollm_expr defs e =
  match e with
  | Evar (v, _) when Hashtbl.mem defs v ->
    let (params, body) = Hashtbl.find defs v in
    lltollm_expr defs body
  | Eapp (Evar(s, _), args, _) when Hashtbl.mem defs s ->
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
  | Eall (x, e, _) ->
    eall (x, lltollm_expr defs e)
  | Eex (x, e, _) ->
    eex (x, lltollm_expr defs e)
  | Etau (x, e, _) ->
    let tau = etau (x, e) in
    if List.mem_assoc tau !new_terms
    then
      List.assoc tau !new_terms
    else
      let z = new_tau () in
      new_terms := (tau, z) :: !new_terms;
      z
  | Elam (x, e, _) ->
    elam (x, lltollm_expr defs e)
  | Earrow _ -> assert false
  | Emeta (x, _) -> assert false
(* /!\ Raised by a lot of files in SYN (SYN048+1.p, SYN049+1.p, SYN315+1.p, SYN318+1.p, ...) *)

let lltollm_rule defs rule =
  match rule with
  | Rfalse -> Rfalse
  | Rnottrue -> Rnottrue
  | Raxiom (p) -> Raxiom (lltollm_expr defs p)
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
  | Rlemma (name, args) ->
    lltollm_proof definitions lemmas (Hashtbl.find lemmas name)
  | Rdefinition (name, sym, args, body, recarg, c, h) ->
    begin match proof.hyps with
    | [hyp] -> lltollm_proof definitions lemmas hyp
    | _ -> assert false end
  | _ ->
    {conc = List.map (lltollm_expr definitions) proof.conc;
     hyps = List.map (lltollm_proof definitions lemmas) proof.hyps;
     rule = lltollm_rule definitions proof.rule}

let lltollm_env definitions env =
  {Llmtolk.hypotheses = List.map (lltollm_expr definitions) env.Llmtolk.hypotheses; 
   Llmtolk.distincts = List.map (fun (e, n) -> lltollm_expr definitions e, n) 
      env.Llmtolk.distincts}
