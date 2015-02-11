(* Extension for dealing with pairs. *)

(* This could be a special case of ext_induct but since it is easier,
   we prefer to have built-in pairs. *)

open Expr
open Mlproof
open Node

(* Definitions of pair, first and second *)

let eps a =
  eapp (tvar "cc.eT" (earrow [type_type] type_type),
        [a])

let prod a b =
  eapp (tvar "dk_tuple.prod" (earrow [type_type; type_type] type_type),
        [a; b])

let pair_ty =
  let a = newtvar type_type in
  let b = newtvar type_type in
  eall (a, eall (b, earrow [eps a; eps b] (eps (prod a b))))

let first_ty =
  let a = newtvar type_type in
  let b = newtvar type_type in
  eall (b, eall (a, earrow [eps (prod a b)] (eps a)))

let second_ty =
  let a = newtvar type_type in
  let b = newtvar type_type in
  eall (b, eall (a, earrow [eps (prod a b)] (eps b)))

let pair_var = tvar "dk_tuple.pair" pair_ty
let fst_var = tvar "basics.fst" first_ty
let snd_var = tvar "basics.snd" second_ty

let pair a b x y = eapp (pair_var, [a; b; x; y])
let first a b c = eapp (fst_var, [a; b; c])
let second a b c = eapp (snd_var, [a; b; c])

;;
List.iter Typer.declare_constant
  [
    ("dk_tuple.prod", earrow [type_type; type_type] type_type);
    ("dk_tuple.pair", pair_ty);
    ("basics.fst", first_ty);
    ("basics.snd", second_ty);
  ]
;;


(* Reduce applications of projections to concrete pairs *)
let rec reduce = function
  | Emeta _
  | Etau _
  | Earrow _
  | Etrue
  | Efalse as e -> e

  | Enot (e, _) -> enot (reduce e)
  | Eand (a, b, _) -> eand (reduce a, reduce b)
  | Eor (a, b, _) -> eor (reduce a, reduce b)
  | Eimply (a, b, _) -> eimply (reduce a, reduce b)
  | Eequiv (a, b, _) -> eequiv (reduce a, reduce b)

  | Eall (v, a, _) -> eall (v, reduce a)
  | Eex (v, a, _) -> eex (v, reduce a)
  | Elam (v, a, _) -> elam (v, reduce a)

  (* Unfold defined constants *)
  | Eapp (Evar (v, _), l, _) when Index.has_def v ->
     let (_, _, params, body) = Index.get_def v in
     let subst = List.map2 (fun x y -> (x,y)) params (List.map reduce l) in
     let unfolded = substitute_unsafe subst body in
     reduce (unfolded)
  | Evar (v, _) when Index.has_def v ->
     let (_, _, _, body) = Index.get_def v in
     reduce (body)

  (* Reduce projections applied to constructor *)
  | Eapp (fst, [_; _; Eapp(pair, [_; _; x; _], _)], _)
       when Expr.equal fst fst_var && Expr.equal pair pair_var ->
     reduce x
  | Eapp (snd, [_; _; Eapp(pair, [_; _; _; y], _)], _)
       when Expr.equal snd snd_var && Expr.equal pair pair_var ->
     reduce y

  | Evar _ as e -> e
  | Eapp (v, l, _) -> eapp (v, List.map reduce l)

let newnodes_reduce e g =
  let mk_node e2 =
    [Node {
         nconc = [e];
         nrule = Ext ("pair", "reduce", [e; e2]);
         nprio = Inst e;
         ngoal = g;
         nbranches = [| [e2] |];
       }; Stop]
  in
  let e2 = reduce e in
  if not (Expr.equal e e2) then
    begin
      Log.debug 1 "Found reducible term %a --> %a"
                Print.pp_expr e
                Print.pp_expr e2;
      mk_node e2
    end
  else
    begin
      Log.debug 10 "Term %a is not reducible"
                Print.pp_expr e;
      []
    end

let newnodes e g _ = newnodes_reduce e g;;
let make_inst m tern g = assert false;;
let add_formula e = ();;
let remove_formula e = ();;
let preprocess l = l;;
let add_phrase x = ();;
let postprocess l = l;;

let to_llproof tr_expr mlp args =
  match mlp.mlconc, mlp.mlrule, args with
  | [conc], Ext ("pair", "reduce", [e1; e2]), [| (sub, _) |] ->
     assert (Expr.equal conc e1);
     let e1' = tr_expr e1 in
     let e2' = tr_expr e2 in
     let c' = e1' in
     let h' = e2' in
     let conc' = tr_expr conc in
     ({
       Llproof.conc = [conc'];
       Llproof.rule = Llproof.Rextension ("", "pair_reduce", [e1'; e2'], [c'], [[h']]);
       Llproof.hyps = [sub];
     }, [])
  | _ -> assert false
;;

let declare_context_coq oc = ();;
let p_rule_coq oc r = assert false;;
let predef () = [];;

Extension.register {
  Extension.name = "pair";
  Extension.newnodes = newnodes;
  Extension.make_inst = make_inst;
  Extension.add_formula = add_formula;
  Extension.remove_formula = remove_formula;
  Extension.iter_open = (fun _ -> false);
  Extension.preprocess = preprocess;
  Extension.add_phrase = add_phrase;
  Extension.postprocess = postprocess;
  Extension.to_llproof = to_llproof;
  Extension.declare_context_coq = declare_context_coq;
  Extension.p_rule_coq = p_rule_coq;
  Extension.predef = predef;
};;
