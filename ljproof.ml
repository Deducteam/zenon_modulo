open Printf
open Expr 

type ljproof = 
| SCaxiom of expr
| SCfalse
| SCtrue
| SCeqsym of expr * expr
| SCeqprop of expr * expr
| SCeqfunc of expr * expr
| SClcontr of expr * ljproof
| SCrweak of expr * ljproof
| SCcut of expr * ljproof * ljproof
| SCland of expr * expr * ljproof
| SClor of expr * expr * ljproof * ljproof
| SClimply of expr * expr * ljproof * ljproof
| SClnot of expr * ljproof
| SClall of expr * expr * ljproof
| SClex of expr * expr * ljproof
| SCrand of expr * expr * ljproof * ljproof
| SCrorl of expr * expr * ljproof
| SCrorr of expr * expr * ljproof
| SCrimply of expr * expr * ljproof
| SCrnot of expr * ljproof
| SCrall of expr * expr * ljproof
| SCrex of expr * expr * ljproof

let scaxiom e =
  SCaxiom e
let scfalse =
  SCfalse
let sctrue =
  SCtrue
let sccut (e, proof1, proof2) =
  SCcut(e, proof1, proof2)
let scland (e1, e2, proof) =
  SCland (e1, e2, proof)
let sclor (e1, e2, proof1, proof2) =
  SClor (e1, e2, proof1, proof2)
let sclimply (e1, e2, proof1, proof2) =
  SClimply (e1, e2, proof1, proof2)
let sclnot (e, proof) =
  SClnot (e, proof)
let scrand (e1, e2, proof1, proof2) =
  SCrand (e1, e2, proof1, proof2)
let scrorl (e1, e2, proof) =
  SCrorl (e1, e2, proof)
let scrorr (e1, e2, proof) =
  SCrorr (e1, e2, proof)
let scrimply (e1, e2, proof) =
  SCrimply (e1, e2, proof)
let scrnot (e, proof) =
  SCrnot (e, proof)
let scrweak (e, proof) =
  SCrweak (e, proof)
let sclall (e1, t, proof) =
  SClall (e1, t, proof)
let sclex (e1, v, proof) =
  SClex (e1, v, proof)
let scrall (e1, v, proof) =
  SCrall (e1, v, proof)
let screx (e1, t, proof) =
  SCrex (e1, t, proof)
let sclcontr (e, proof) =
  SClcontr (e, proof)
(* let sceqsym (a, b, g) = *)
(*   scweak (g, None, ([eapp ("=", [a; b])], eapp ("=", [b; a]), SCeqsym (a, b))) *)
(* let sceqprop (e1, e2, g) = *)
(*   match e1, e2 with *)
(*   | Eapp (p, ts, _), Eapp (q, us, _) when p = q -> *)
(*     scweak (g, None, (e1 :: List.map2 (fun t u -> eapp ("=", [t; u])) ts us, e2, *)
(* 		 SCeqprop (e1, e2))) *)
(*   | _, _ -> assert false *)
(* let sceqfunc (e1, e2, g) = *)
(*   match e1, e2 with *)
(*   | Eapp (p, ts, _), Eapp (q, us, _) when p = q -> *)
(*     scweak (g, None, (List.map2 (fun t u -> eapp ("=", [t; u])) ts us, *)
(* 		 eapp ("=", [e1; e2]), SCeqfunc (e1, e2))) *)
(*   | _, _ -> assert false *)
(* let sctheory (str, e, proof) = *)
(*   let g, c, rule = proof in *)
(*   assert (List.mem e g); *)
(*   rm e g, c, SCtheory(str, e, proof) *)

let rec print proof =
  let printexpr = fun oc e -> Print.expr (Print.Chan oc) e in
  match proof with
  | SCaxiom p ->
     eprintf "Axiom (%a)" printexpr p
  | SCfalse ->
     eprintf "False";
  | SCtrue ->
     eprintf "True";
  | SClnot (p, proof) ->
     eprintf "Lnot (%a \n" printexpr p;
     print proof;
     eprintf ")"
  | SCrnot (p, proof) ->
     eprintf "Rnot (%a \n" printexpr p;
     print proof;
     eprintf ")"
  | SClimply (p, q, proof1, proof2) ->
     eprintf "Limply (%a %a \n" printexpr p printexpr q;
     print proof1;
     eprintf "\n";
     print proof2;
     eprintf ")"
  | SCrimply (p, q, proof) ->
     eprintf "Rimply (%a %a \n" printexpr p printexpr q;
     print proof;
     eprintf ")"
  | SCland (p, q, proof) ->
     eprintf "Land (%a %a \n" printexpr p printexpr q;
     print proof;
     eprintf ")"
  | SCrand (p, q, proof1, proof2) ->
     eprintf "Rand (%a %a \n" printexpr p printexpr q;
     print proof1;
     eprintf "\n";
     print proof2;
     eprintf ")"
  | SClor (p, q, proof1, proof2) ->
     eprintf "Lor (%a %a \n" printexpr p printexpr q;
     print proof1;
     eprintf "\n";
     print proof2;
     eprintf ")"
  | SCrorr (p, q, proof) ->
     eprintf "Rorl (%a %a \n" printexpr p printexpr q;
     print proof;
     eprintf ")"
  | SCrorl (p, q, proof) ->
     eprintf "Rorr (%a %a \n" printexpr p printexpr q;
     print proof;
     eprintf ")"
  | SCcut (p, proof1, proof2) ->
     eprintf "Cut (%a \n" printexpr p;
     print proof1;
     eprintf "\n";
     print proof2;
     eprintf ")"
  (* | SClcontr (e, proof) -> *)
  (* | SCrcontr of expr * lkproof *)
  (* | SClall of expr * expr * lkproof *)
  (* | SCrall of expr * expr * lkproof *)
  (* | SClex of expr * expr * lkproof *)
  (* | SCrex of expr * expr * lkproof *)
  | _ -> assert false
