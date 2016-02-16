open Printf
open Expr 

type lkrule = 
| SCaxiom of expr
| SCfalse
| SCtrue
| SCeqref of expr
| SCeqsym of expr * expr
| SCeqprop of expr * expr
| SCeqfunc of expr * expr
| SClweak of expr list * lkproof
| SCrweak of expr * lkproof
| SClcontr of expr * lkproof
| SCcut of expr * lkproof * lkproof
| SCland of expr * expr * lkproof
| SClor of expr * expr * lkproof * lkproof
| SClimply of expr * expr * lkproof * lkproof
| SClnot of expr * lkproof
| SClall of expr * expr * lkproof
| SClex of expr * expr * lkproof
| SCrand of expr * expr * lkproof * lkproof
| SCrorl of expr * expr * lkproof
| SCrorr of expr * expr * lkproof
| SCrimply of expr * expr * lkproof
| SCrnot of expr * lkproof
| SCrall of expr * expr * lkproof
| SCrex of expr * expr * lkproof
| SCcnot of expr * lkproof
| SCext of string * string * expr list * expr list * expr list list * lkproof list

and lkproof =
  expr list * expr * lkrule

let p_debug s es =
  eprintf "%s |" s;
  List.iter
    (eprintf " %a |"
       (fun oc x -> Print.expr (Print.Chan oc) x)
    ) es;
  eprintf "\n"

let p_debug_proof s (g, c, rule) =
  eprintf "%s : gamma = |" s;
  List.iter
    (eprintf " %a |"
       (fun oc x -> Print.expr (Print.Chan oc) x)) g;
  eprintf "\n and conc = |";
  eprintf " %a |"
    (fun oc x -> Print.expr (Print.Chan oc) x) c;
  eprintf "\n"

let ingamma e proof =
  let g, c, rule = proof in
  let b = List.exists (equal e) g in
  if not b then
    (p_debug "Error: expression" [e];
     p_debug_proof "not found in proof context" proof);
  b

let rec rm a list =
  match list with
  | x :: list when equal x a -> list
  | x :: list -> x :: (rm a list)
  | [] -> assert false
		 
let sclweak (w, proof) =
  let g, c, rule = proof in
  match w with
  | [] -> proof
  | _ ->
     match rule with
     | SClweak (l, prf) ->
	w @ g, c, SClweak (w@l, prf)
     | _ -> w @ g, c, SClweak (w, proof)
let scaxiom (e, g) =
  sclweak (g, ([e], e, SCaxiom e))
let scfalse (g, e) =
  sclweak (g, ([efalse], e, SCfalse))
let sctrue (g) =
  sclweak (g, ([], etrue, SCtrue))
let sceqref (a, g) =
  sclweak (g, ([], eapp ("=", [a; a]), SCeqref (a)))
let sceqsym (a, b, g) =
  sclweak (g, ([eapp ("=", [a; b])], eapp ("=", [b; a]), SCeqsym (a, b)))
let sceqprop (e1, e2, g) =
  match e1, e2 with
  | Eapp (p, ts, _), Eapp (q, us, _) when p = q ->
    sclweak (g, (e1 :: List.map2 (fun t u -> eapp ("=", [t; u])) ts us, e2,
		 SCeqprop (e1, e2)))
  | _, _ -> assert false
let sceqfunc (e1, e2, g) =
  match e1, e2 with
  | Eapp (p, ts, _), Eapp (q, us, _) when p = q ->
    sclweak (g, (List.map2 (fun t u -> eapp ("=", [t; u])) ts us,
		 eapp ("=", [e1; e2]), SCeqfunc (e1, e2)))
  | _, _ -> assert false
let scrweak (e, proof) =
  let g, c, rule = proof in
  assert (equal c efalse);
  g, e, SCrweak (e, proof)
let sclcontr (e, proof) =
  let g, c, rule = proof in
  assert (List.mem e g);
  assert (List.mem e (rm e g));
  rm e g, c, SClcontr (e, proof)
let sccut (e, proof1, proof2) =
  let (g1, c1, rule1) = proof1 in
  let (g2, c2, rule2) = proof2 in
  assert (List.length g2 = List.length g1 + 1);
  assert (equal c1 e);
  g1, c2, SCcut(e, proof1, proof2)
let scland (e1, e2, proof) =
  assert (ingamma e2 proof);
  let (g, c, rule) = proof in
  assert (List.mem e1 (rm e2 g));
  (eand (e1, e2)) :: rm e1 (rm e2 g), c, SCland (e1, e2, proof)
let sclor (e1, e2, proof1, proof2) =
  assert (ingamma e1 proof1);
  let (g1, c, rule1) = proof1 in
  let (g2, _, _) = proof2 in
  assert (List.length g2 = List.length g1);
  (eor (e1, e2)) :: rm e1 g1, c, SClor (e1, e2, proof1, proof2)
let sclimply (e1, e2, proof1, proof2) =
  let (g1, c1, rule1) = proof1 in
  let (g2, c2, rule2) = proof2 in
  assert (List.length g2 = List.length g1 + 1);
  (eimply (e1, e2)) :: g1, c2,
  SClimply (e1, e2, proof1, proof2)
let sclnot (e, proof) =
  let (g, d, rule) = proof in
  assert (equal e d);
  (enot e) :: g, efalse, SClnot (e, proof)
let sclall (e1, t, proof) =
  match e1 with
  | Eall (x, ty, p, _) ->
    let (g, c, rule) = proof in
    assert (ingamma (substitute [(x, t)] p) proof);
    e1 :: rm (substitute [(x, t)] p) g, c, SClall (e1, t, proof)
  | _ -> assert false
let sclex (e1, v, proof) =
  match e1 with
  | Eex (x, ty, p, _) ->
    let (g, c, rule) = proof in
    assert (ingamma (substitute [(x, v)] p) proof);
    e1 :: rm (substitute [(x, v)] p) g, c, SClex (e1, v, proof)
  | _ -> assert false
let scrand (e1, e2, proof1, proof2) =
  let (g1, d1, rule1) = proof1 in
  let (g2, _, _) = proof2 in
  assert (List.length g2 = List.length g1);
  g1, eand (e1, e2), SCrand (e1, e2, proof1, proof2)
let scrorl (e1, e2, proof) =
  let (g, d, rule) = proof in
  g, eor (e1, e2), SCrorl (e1, e2, proof)
let scrorr (e1, e2, proof) =
  let (g, d, rule) = proof in
  g, eor (e1, e2), SCrorr (e1, e2, proof)
let scrimply (e1, e2, proof) =
  assert (ingamma e1 proof);
  let (g, d, rule) = proof in
  rm e1 g, eimply (e1, e2), SCrimply (e1, e2, proof)
let scrnot (e, proof) =
  assert (ingamma e proof);
  let (g, d, rule) = proof in
  rm e g, enot e, SCrnot (e, proof)
let scrall (e1, v, proof) =
  match e1 with
  | Eall (x, ty, p, _) ->
    let (g, c, rule) = proof in
    g, e1, SCrall (e1, v, proof)
  | _ -> assert false
let screx (e1, t, proof) =
  match e1 with
  | Eex (x, ty, p, _) ->
    let (g, c, rule) = proof in
    g, e1, SCrex (e1, t, proof)
  | _ -> assert false
let sccnot (e, proof) =
  let (g, c, rule) = proof in
  assert (equal c efalse);
  assert (List.mem (enot e) g);
  rm (enot e) g, e, SCcnot (e, proof)
let scconc (g, c, rule) = c
let scext (ext, name, args, cons, hyps, proofs) =
  let gammas = List.map
    (fun (g, _, _) -> g)
    proofs in
  let gammas_weak = List.map2
    (List.fold_left (fun gamma e -> rm e gamma))
    gammas hyps
  in
  let new_gamma = List.flatten gammas_weak in
  new_gamma @ cons, efalse, SCext (ext, name, args, cons, hyps, proofs)

let hypsofrule lkrule =
  match lkrule with
  | SCaxiom (e) -> []
  | SCfalse -> []
  | SCtrue -> []
  | SCeqref (e) -> []
  | SCeqsym (e1, e2) -> []
  | SCeqprop (e1, e2) -> []
  | SCeqfunc (e1, e2) -> []
  | SClweak (e, proof) -> [proof]
  | SCrweak (e, proof) -> [proof]
  | SClcontr (e, proof) -> [proof]
  | SCcut (e, proof1, proof2) -> [proof1; proof2]
  | SCland (e1, e2, proof) -> [proof]
  | SClor (e1, e2, proof1, proof2) -> [proof1; proof2]
  | SClimply (e1, e2, proof1, proof2) -> [proof1; proof2]
  | SClnot (e, proof) -> [proof]
  | SClall (e1, e2, proof) -> [proof]
  | SClex (e1, e2, proof) -> [proof]
  | SCrand (e1, e2, proof1, proof2) -> [proof1; proof2]
  | SCrorl (e1, e2, proof) -> [proof]
  | SCrorr (e1, e2, proof) -> [proof]
  | SCrimply (e1, e2, proof) -> [proof]
  | SCrnot (e, proof) -> [proof]
  | SCrall (e1, e2, proof) -> [proof]
  | SCrex (e1, e2, proof) -> [proof]
  | SCcnot (e, proof) -> [proof]
  | SCext (_, _, _, _, _, proofs) -> proofs

let applytohyps f lkproof =
  let g, c, lkrule = lkproof in
  match lkrule with
  | SCaxiom (e) -> g, c, SCaxiom (e)
  | SCfalse -> g, c, SCfalse
  | SCtrue -> g, c, SCtrue
  | SCeqref (e) -> g, c, SCeqref (e)
  | SCeqsym (e1, e2) -> g, c, SCeqsym (e1, e2)
  | SCeqprop (e1, e2) -> g, c, SCeqprop (e1, e2)
  | SCeqfunc (e1, e2) -> g, c, SCeqfunc (e1, e2)
  | SClweak (e, proof) -> sclweak (e, f proof)
  | SCrweak (e, proof) -> scrweak (e, f proof)
  | SClcontr (e, proof) -> sclcontr (e, f proof)
  | SCcut (e, proof1, proof2) ->
    sccut (e, f proof1, f proof2)
  | SCland (e1, e2, proof) ->
    scland (e1, e2, f proof)
  | SClor (e1, e2, proof1, proof2) ->
    sclor (e1, e2, f proof1, f proof2)
  | SClimply (e1, e2, proof1, proof2) ->
    sclimply (e1, e2, f proof1, f proof2)
  | SClnot (e, proof) -> sclnot (e, f proof)
  | SClall (e1, e2, proof) -> sclall (e1, e2, f proof)
  | SClex (e1, e2, proof) -> sclex (e1, e2, f proof)
  | SCrand (e1, e2, proof1, proof2) ->
    scrand (e1, e2, f proof1, f proof2)
  | SCrorl (e1, e2, proof) ->
    scrorl (e1, e2, f proof)
  | SCrorr (e1, e2, proof) ->
    scrorr (e1, e2, f proof)
  | SCrimply (e1, e2, proof) ->
    scrimply (e1, e2, f proof)
  | SCrnot (e, proof) -> scrnot (e, f proof)
  | SCrall (e1, e2, proof) -> scrall (e1, e2, f proof)
  | SCrex (e1, e2, proof) -> screx (e1, e2, f proof)
  | SCcnot (e, proof) -> sccnot (e, f proof)
  | SCext (ext, name, args, cons, hyps, proofs) -> scext (ext, name, args, cons, hyps, List.map f proofs)

let new_var =
  let r = ref 0 in
  fun () ->
    let n = !r in
    incr r;
    evar (sprintf "v%d" n)
