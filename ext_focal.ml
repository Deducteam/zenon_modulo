(*  Copyright 2008 INRIA  *)
Version.add "$Id$";;

(* Extension for Coq's "bool" type, as used in focal. *)
(* Symbols:
     Is_true
     basics._amper__amper_
     basics._bar__bar_
     basics._bar__lt__gt__bar_
     basics._tilda__tilda_
     false
     true
     FOCAL.ifthenelse
     basics.pair
     basics.fst
     basics.snd
     List.nil
     List.cons
     equality under its many names...
 *)

let names_of_equality = ["basics.syntactic_equal"; "basics._equal_"];;
let name_of_equality_lemma = "coq_builtins.zenon_syntactic_equal";;
let name_of_notequality_lemma = "coq_builtins.zenon_not_syntactic_equal";;

open Printf;;

open Expr;;
open Misc;;
open Mlproof;;
open Node;;
open Phrase;;

let rec is_prefix n s1 s2 =
  if n >= String.length s1 then true
  else if n >= String.length s2 then false
  else if s1.[n] <> s2.[n] then false
  else is_prefix (n+1) s1 s2
;;

let chop_prefix s1 s2 =
  let l1 = String.length s1 in
  let l2 = String.length s2 in
  assert (String.sub s2 0 l1 = s1);
  String.sub s2 l1 (l2 - l1)
;;

let add_formula e = ();;
let remove_formula e = ();;

let arity_warning s =
  Log.debug 1 "defined symbol %s is used with wrong arity" s
;;

let higher_order_warning s =
  Error.warn (sprintf "symbol %s is used in higher-order substitution" s);
;;
(* Functions for building types *)
let arr ty1 ty2 =
  match ty2 with
  | Earrow (l, ret, _) -> earrow (ty1 :: l) ret
  | _ -> earrow [ty1] ty2
;;
let bool1 = eapp (tvar "basics.bool__t" type_type, []);;
let bool2 = arr bool1 bool1;;
let bool3 = arr bool1 bool2;;
let t_prop = type_prop;;

let rec ret_prop_to_bool = function
  | ty when ty == type_prop -> bool1
  | Earrow (l, ret, _) -> earrow l bool1
  | Eall (v, ty, _) -> eall (v, ret_prop_to_bool ty)
  | ty ->
     Log.debug 15 "Ret_prop_to_bool (%a)" Print.pp_expr ty;
     raise (Invalid_argument "ret_prop_to_bool")
;;
let rec ret_bool_to_prop = function
  | ty when ty == bool1 -> type_prop
  | Earrow (l, ret, _) -> earrow l type_prop
  | Eall (v, ty, _) -> eall (v, ret_bool_to_prop ty)
  | _ -> raise (Invalid_argument "ret_bool_to_prop")
;;

let prop_to_bool_args args ty =
  if ty == type_none then earrow (List.map get_type args) bool1
  else ret_prop_to_bool ty
;;

let istrue e = eapp (tvar "Is_true" (arr bool1 t_prop), [e]);;
let isfalse e = enot (istrue e);;
let ite_ty =
  let ty = newtvar type_type in
  eall (ty, earrow [bool1; ty; ty] ty)
;;
let is_true_equal x =
  List.exists (fun y -> x = "Is_true**" ^ y) names_of_equality
;;

let btrue = eapp (tvar "basics.true" bool1, []);;
let bfalse = eapp (tvar "basics.false" bool1, []);;

let newnodes_istrue e g =
  let mk_unfold ctx p args =
    try
      let (d, ty, params, body) = Index.get_def p in
      let prio = match d with DefRec _ -> Inst e | _ -> Prop in
      match params, args, body with
      | [], Some aa, (Evar (b, _) as b') ->
         let unfolded = ctx (eapp (b', aa)) in
         [ Node {
           nconc = [e];
           nrule = Definition (d, e, unfolded);
           nprio = prio;
           ngoal = g;
           nbranches = [| [unfolded] |];
         }; Stop ]
      | _ ->
         let aa = match args with None -> [] | Some l -> l in
         let (params1, params2) =
           if List.length aa <= List.length params then
             Misc.list_split params (List.length aa)
           else
             begin
               Log.debug 15 "Not enough params: [%a]"
                         (Print.pp_lst Print.pp_expr ", ") params;
               (params, [])
             end
         in
         let subst = List.map2 (fun x y -> (x,y)) params1 aa in
         let unfolded = ctx (substitute_2nd subst body) in
         [ Node {
           nconc = [e];
           nrule = Definition (d, e, unfolded);
           nprio = prio;
           ngoal = g;
           nbranches = [| [unfolded] |];
         }; Stop ]
    with
    | Higher_order -> higher_order_warning p; []
    | Invalid_argument "List.map2" -> arity_warning p; []
    | Not_found -> assert false
  in
  match e with
  | Eapp (Evar("Is_true**basics._amper__amper_",_), [e1; e2], _) ->
      let branches = [| [eand (istrue e1, istrue e2)] |] in
      [ Node {
        nconc = [e];
        nrule = Ext ("focal", "and", [e1; e2]);
        nprio = Arity;
        ngoal = g;
        nbranches = branches;
      }; Stop ]
  | Eapp (Evar("Is_true**basics._bar__bar_",_), [e1; e2], _) ->
      let branches = [| [eor (istrue e1, istrue e2)] |] in
      [ Node {
        nconc = [e];
        nrule = Ext ("focal", "or", [e1; e2]);
        nprio = Arity;
        ngoal = g;
        nbranches = branches;
      }; Stop ]
  | Eapp (Evar("Is_true**basics._bar__lt__gt__bar_",_), [e1; e2], _) ->
      let branches = [| [enot (eequiv (istrue e1, istrue e2))] |] in
      [ Node {
        nconc = [e];
        nrule = Ext ("focal", "xor", [e1; e2]);
        nprio = Arity;
        ngoal = g;
        nbranches = branches;
      }; Stop ]
  | Eapp (Evar("Is_true**basics._tilda__tilda_",_), [e1], _) ->
      let branches = [| [isfalse e1] |] in
      [ Node {
        nconc = [e];
        nrule = Ext ("focal", "not", [e1]);
        nprio = Arity;
        ngoal = g;
        nbranches = branches;
      }; Stop ]
  | Eapp (Evar(op,_) as var, [e1; e2; e3], _) when is_true_equal op ->
     let branches = [| [eeq e2 e3] |] in
     let name = chop_prefix "Is_true**" op in
     let vssty = prop_to_bool_args [e1; e2; e3] (get_type var) in
       [ Node {
         nconc = [e];
         nrule = Ext ("focal", "equal", [tvar name vssty; e1; e2; e3]);
         nprio = Arity;
         ngoal = g;
         nbranches = branches;
       }; Stop ]
  | Enot (Eapp (Evar("Is_true**basics._amper__amper_",_), [e1; e2], _), _) ->
      let branches = [| [enot (eand (istrue e1, istrue e2))] |] in
      [ Node {
        nconc = [e];
        nrule = Ext ("focal", "notand", [e1; e2]);
        nprio = Arity;
        ngoal = g;
        nbranches = branches;
      }; Stop ]
  | Enot (Eapp (Evar("Is_true**basics._bar__bar_",_), [e1; e2], _), _) ->
      let branches = [| [enot (eor (istrue e1, istrue e2))] |] in
      [ Node {
        nconc = [e];
        nrule = Ext ("focal", "notor", [e1; e2]);
        nprio = Arity;
        ngoal = g;
        nbranches = branches;
      }; Stop ]
  | Enot (Eapp (Evar("Is_true**basics._bar__lt__gt__bar_",_), [e1; e2], _), _) ->
      let branches = [| [eequiv (istrue e1, istrue e2)] |] in
      [ Node {
        nconc = [e];
        nrule = Ext ("focal", "notxor", [e1; e2]);
        nprio = Arity;
        ngoal = g;
        nbranches = branches;
      }; Stop ]
  | Enot (Eapp (Evar("Is_true**basics._tilda__tilda_",_), [e1], _), _) ->
      let branches = [| [istrue e1] |] in
      [ Node {
        nconc = [e];
        nrule = Ext ("focal", "notnot", [e1]);
        nprio = Arity;
        ngoal = g;
        nbranches = branches;
      }; Stop ]
  | Enot (Eapp (Evar(op,_) as var, [e1; e2; e3], _), _) when is_true_equal op ->
     let branches = [| [enot (eeq e2 e3)] |] in
     let name = chop_prefix "Is_true**" op in
     let vssty = prop_to_bool_args [e1; e2; e3] (get_type var) in
       [ Node {
         nconc = [e];
         nrule = Ext ("focal", "notequal", [tvar name vssty; e1; e2; e3]);
         nprio = Arity;
         ngoal = g;
         nbranches = branches;
       }; Stop ]
  | Eapp (Evar("Is_true",_), [Evar ("basics.true", _)], _) -> [Stop]
  | Enot (Eapp (Evar("Is_true",_), [Evar ("basics.false", _)], _), _) -> [Stop]

  | Eapp (Evar("Is_true",_), [Evar ("basics.false", _)], _) ->
      [ Node {
        nconc = [e];
        nrule = Ext ("focal", "false", []);
        nprio = Arity;
        ngoal = g;
        nbranches = [| |];
      }; Stop ]
  | Enot (Eapp (Evar("Is_true",_), [Evar ("basics.true", _)], _), _) ->
      [ Node {
        nconc = [e];
        nrule = Ext ("focal", "nottrue", []);
        nprio = Arity;
        ngoal = g;
        nbranches = [| |];
      }; Stop ]
  | Enot (Eapp (Evar("=",_), [Evar ("basics.true", _); Evar ("basics.false", _)], _), _) -> [Stop]
  | Enot (Eapp (Evar("=",_), [Evar ("basics.false", _); Evar ("basics.true", _)], _), _) -> [Stop]
  | Eapp (Evar("=",_), [Evar ("basics.true", _); e1], _) ->
      [ Node {
        nconc = [e];
        nrule = Ext ("focal", "trueequal", [e1]);
        nprio = Arity;
        ngoal = g;
        nbranches = [| [istrue e1] |];
      }; Stop ]
  | Eapp (Evar("=",_), [e1; Evar ("basics.true", _)], _) ->
      [ Node {
        nconc = [e];
        nrule = Ext ("focal", "equaltrue", [e1]);
        nprio = Arity;
        ngoal = g;
        nbranches = [| [istrue e1] |];
      }; Stop ]
  | Enot (Eapp (Evar("=",_), [Evar ("basics.true", _); e1], _), _) ->
      [ Node {
        nconc = [e];
        nrule = Ext ("focal", "truenotequal", [e1]);
        nprio = Arity;
        ngoal = g;
        nbranches = [| [isfalse e1] |];
      }; Stop ]
  | Enot (Eapp (Evar("=",_), [e1; Evar ("basics.true", _)], _), _) ->
      [ Node {
        nconc = [e];
        nrule = Ext ("focal", "notequaltrue", [e1]);
        nprio = Arity;
        ngoal = g;
        nbranches = [| [isfalse e1] |];
      }; Stop ]
  | Eapp (Evar("=",_), [Evar ("basics.false", _); e1], _) ->
      [ Node {
        nconc = [e];
        nrule = Ext ("focal", "falseequal", [e1]);
        nprio = Arity;
        ngoal = g;
        nbranches = [| [isfalse e1] |];
      }; Stop ]
  | Eapp (Evar("=",_), [e1; Evar ("basics.false", _)], _) ->
      [ Node {
        nconc = [e];
        nrule = Ext ("focal", "equalfalse", [e1]);
        nprio = Arity;
        ngoal = g;
        nbranches = [| [isfalse e1] |];
      }; Stop ]
  | Enot (Eapp (Evar("=",_), [Evar ("basics.false", _); e1], _), _) ->
      [ Node {
        nconc = [e];
        nrule = Ext ("focal", "falsenotequal", [e1]);
        nprio = Arity;
        ngoal = g;
        nbranches = [| [istrue e1] |];
      }; Stop ]
  | Enot (Eapp (Evar("=",_), [e1; Evar ("basics.false", _)], _), _) ->
      [ Node {
        nconc = [e];
        nrule = Ext ("focal", "notequalfalse", [e1]);
        nprio = Arity;
        ngoal = g;
        nbranches = [| [istrue e1] |];
      }; Stop ]
(*
  | Eapp ("Is_true", [Emeta _], _) -> FIXME TODO instancier par false
  | Enot (Eapp ("Is_true", [Emeta _], _) -> FIXME TODO instancier par true
*)
  | Eapp (Evar("Is_true",_), [Eapp (Evar("$fix",_), _, _) as e1], _) ->
      [ Node {
          nconc = [e];
          nrule = Ext ("focal", "istrue_true", [e1]);
          nprio = Arity;
          ngoal = g;
          nbranches = [| [eeq e1 btrue] |];
      } ]
  | Enot (Eapp (Evar("Is_true",_), [Eapp (Evar("$fix",_), _, _) as e1], _), _) ->
      [ Node {
          nconc = [e];
          nrule = Ext ("focal", "notistrue_false", [e1]);
          nprio = Arity;
          ngoal = g;
          nbranches = [| [eeq e1 bfalse] |];
      } ]
  | Eapp (Evar("Is_true",_), [Eapp (Evar(s,_), args, _)], _) when Index.has_def s ->
     let ctx x = istrue x in
     mk_unfold ctx s (Some args)
  | Enot (Eapp (Evar("Is_true",_), [Eapp (Evar(s,_), args, _)], _), _) when Index.has_def s ->
     let ctx x = enot (istrue x) in
     mk_unfold ctx s (Some args)
  | Eapp (Evar("Is_true",_), [Evar (s, _)], _) when Index.has_def s ->
     let ctx x = istrue x in
     mk_unfold ctx s None
  | Enot (Eapp (Evar("Is_true",_), [Evar (s, _)], _), _) when Index.has_def s ->
     let ctx x = enot (istrue x) in
     mk_unfold ctx s None
  | Eapp (Evar("Is_true",_), [Eapp (Evar(s,_) as var, args, _)], _) ->
      let branches = [| [eapp (tvar ("Is_true**" ^ s) (ret_bool_to_prop (get_type var)), args)] |] in
      [ Node {
          nconc = [e];
          nrule = Ext ("focal", "merge", []);
          nprio = Arity;
          ngoal = g;
          nbranches = branches;
      }; Stop ]
  | Eapp (Evar(s,_) as vs, args, _) when is_prefix 0 "Is_true**" s ->
      let ss = chop_prefix "Is_true**" s in
      let vssty = prop_to_bool_args args (get_type vs) in
      let branches = [| [istrue (eapp (tvar ss vssty, args))] |] in
      [ Node {
          nconc = [e];
          nrule = Ext ("focal", "split", []);
          nprio = Arity;
          ngoal = g;
          nbranches = branches;
      } ]
  | Enot (Eapp (Evar("Is_true",_), [Eapp (Evar(s,_) as v, args, _)], _), _) ->
      let ty = ret_bool_to_prop (get_type v) in
      let branches = [| [enot (eapp (tvar ("Is_true**" ^ s) ty, args))] |] in
      [ Node {
          nconc = [e];
          nrule = Ext ("focal", "merge", []);
          nprio = Arity;
          ngoal = g;
          nbranches = branches;
      }; Stop ]
  | Enot (Eapp (Evar(s,_) as var, args, _), _) when is_prefix 0 "Is_true**" s ->
      let ss = chop_prefix "Is_true**" s in
      let vssty = prop_to_bool_args args (get_type var) in
      let branches = [| [isfalse (eapp (tvar ss vssty, args))] |] in
      [ Node {
          nconc = [e];
          nrule = Ext ("focal", "split", []);
          nprio = Arity;
          ngoal = g;
          nbranches = branches;
      } ]
  | _ -> []
;;

let ite_branches pat cond thn els =
  [| [istrue cond; pat thn]; [isfalse cond; pat els] |]
;;

let newnodes_ifthenelse e g =
  match e with
  | Eapp (Evar("Is_true**FOCAL.ifthenelse",_), [_; cond; thn; els], _) ->
      let branches = ite_branches istrue cond thn els in
      [ Node {
          nconc = [e];
          nrule = Ext ("focal", "ite_bool", [cond; thn; els]);
          nprio = Arity;
          ngoal = g;
          nbranches = branches;
      }; Stop ]
  | Enot (Eapp (Evar("Is_true**FOCAL.ifthenelse",_), [_; cond; thn; els], _), _) ->
      let branches = ite_branches isfalse cond thn els in
      [ Node {
          nconc = [e];
          nrule = Ext ("focal", "ite_bool_n", [cond; thn; els]);
          nprio = Arity;
          ngoal = g;
          nbranches = branches;
      }; Stop ]
  | Eapp (r, [Eapp (Evar("FOCAL.ifthenelse",_), [ty; cond; thn; els], _); e2], _)
    when Eqrel.any r ->
      let pat x = eapp (r, [x; e2]) in
      let branches = ite_branches pat cond thn els in
      [ Node {
          nconc = [e];
          nrule = Ext ("focal", "ite_rel_l", [e]);
          nprio = Arity;
          ngoal = g;
          nbranches = branches;
      }; Stop ]
  | Eapp (r, [e1; Eapp (Evar("FOCAL.ifthenelse",_), [ty; cond; thn; els], _)], _)
    when Eqrel.any r ->
      let pat x = eapp (r, [e1; x]) in
      let branches = ite_branches pat cond thn els in
      [ Node {
          nconc = [e];
          nrule = Ext ("focal", "ite_rel_r", [e]);
          nprio = Arity;
          ngoal = g;
          nbranches = branches;
      }; Stop ]
  | Enot (Eapp (r, [Eapp (Evar("FOCAL.ifthenelse",_), [ty; cond; thn; els], _); e2], _),_)
    when Eqrel.any r ->
      let pat x = enot (eapp (r, [x; e2])) in
      let branches = ite_branches pat cond thn els in
      [ Node {
          nconc = [e];
          nrule = Ext ("focal", "ite_rel_nl", [e]);
          nprio = Arity;
          ngoal = g;
          nbranches = branches;
      }; Stop ]
  | Enot (Eapp (r, [e1; Eapp (Evar("FOCAL.ifthenelse",_), [ty; cond; thn; els], _)], _),_)
    when Eqrel.any r ->
      let pat x = enot (eapp (r, [e1; x])) in
      let branches = ite_branches pat cond thn els in
      [ Node {
          nconc = [e];
          nrule = Ext ("focal", "ite_rel_nr", [e]);
          nprio = Arity;
          ngoal = g;
          nbranches = branches;
      }; Stop ]
  | _ -> []
;;

let newnodes_quantifier_bool e g =
  match e with
  | Eex (var, p, _) when get_type var == bool1 ->
     let h = elam (var, p) in
     let htrue = substitute [(var, btrue)] p in
     let hfalse = substitute [(var, bfalse)] p in
     [ Node {
       nconc = [e];
       nrule = Ext ("focal", "ex_bool", [h]);
       nprio = Arity;
       ngoal = g;
       nbranches = [| [htrue]; [hfalse] |];
     }; Stop ]
  | Enot (Eall (var, p, _), _) when get_type var == bool1 ->
     let h = elam (var, p) in
     let htrue = substitute [(var, btrue)] p in
     let hfalse = substitute [(var, bfalse)] p in
     [ Node {
       nconc = [e];
       nrule = Ext ("focal", "not_all_bool", [h]);
       nprio = Arity;
       ngoal = g;
       nbranches = [| [enot htrue]; [enot hfalse] |];
     }; Stop ]
  | _ -> []
;;


let newnodes e g _ = newnodes_istrue e g @ newnodes_ifthenelse e g @ newnodes_quantifier_bool e g;;

let make_inst m term g = assert false;;

let to_llargs tr_expr r =
  match r with
  | Ext (_, "and", [e1; e2]) ->
      let h = tr_expr (eand (istrue e1, istrue e2)) in
      let c = tr_expr (istrue (eapp (tvar "basics._amper__amper_" bool3, [e1; e2]))) in
      ("zenon_focal_and", [tr_expr e1; tr_expr e2], [c], [ [h] ])
  | Ext (_, "or", [e1; e2]) ->
      let h = tr_expr (eor (istrue e1, istrue e2)) in
      let c = tr_expr (istrue (eapp (tvar "basics._bar__bar_" bool3, [e1; e2]))) in
      ("zenon_focal_or", [tr_expr e1; tr_expr e2], [c], [ [h] ])
  | Ext (_, "xor", [e1; e2]) ->
      let h = tr_expr (enot (eequiv (istrue e1, istrue e2))) in
      let c = tr_expr (istrue (eapp (tvar "basics._bar__lt__gt__bar_" bool3, [e1; e2]))) in
      ("zenon_focal_xor", [tr_expr e1; tr_expr e2], [c], [ [h] ])
  | Ext (_, "not", [e1]) ->
      let h = tr_expr (enot (istrue e1)) in
      let c = tr_expr (istrue (eapp (tvar "basics._tilda__tilda_" bool2, [e1]))) in
      ("zenon_focal_not", [tr_expr e1], [c], [ [h] ])
  | Ext (_, "equal", [Evar (name, _)as a; e1; e2; e3]) ->
      let h = tr_expr (eeq e2 e3) in
      let c = tr_expr (istrue (eapp (a, [e1; e2; e3]))) in
      ("zenon_syntactic_equal",
       List.map tr_expr [e1; e2; e3], [c], [ [h] ])
  | Ext (_, "notand", [e1; e2]) ->
      let h = tr_expr (enot (eand (istrue e1, istrue e2))) in
      let c = tr_expr (enot (istrue (eapp (tvar "basics._amper__amper_" bool3, [e1; e2])))) in
      ("zenon_focal_notand", [tr_expr e1; tr_expr e2], [c], [ [h] ])
  | Ext (_, "notor", [e1; e2]) ->
      let h = tr_expr (enot (eor (istrue e1, istrue e2))) in
      let c = tr_expr (enot (istrue (eapp (tvar "basics._bar__bar_" bool3, [e1; e2])))) in
      ("zenon_focal_notor", [tr_expr e1; tr_expr e2], [c], [ [h] ])
  | Ext (_, "notxor", [e1; e2]) ->
      let h = tr_expr (eequiv (istrue e1, istrue e2)) in
      let c = tr_expr (enot (istrue (eapp (tvar "basics._bar__lt__gt__bar_" bool3, [e1; e2])))) in
      ("zenon_focal_notxor", [tr_expr e1; tr_expr e2], [c], [ [h] ])
  | Ext (_, "notnot", [e1]) ->
      let h = tr_expr (istrue e1) in
      let c = tr_expr (enot (istrue (eapp (tvar "basics._tilda__tilda_" bool2, [e1])))) in
      ("zenon_focal_notnot", [tr_expr e1], [c], [ [h] ])
  | Ext (_, "notequal", [Evar (name, _) as a; e1; e2; e3]) ->
      let h = tr_expr (enot (eeq e2 e3)) in
      let c = tr_expr (enot (istrue (eapp (a, [e1; e2; e3])))) in
      ("zenon_not_syntactic_equal",
       [tr_expr e1; tr_expr e2; tr_expr e3], [c], [ [h] ])
  | Ext (_, "false", []) ->
      let c = tr_expr (istrue bfalse) in
      ("zenon_focal_false", [], [c], []);
  | Ext (_, "nottrue", []) ->
      let c = tr_expr (enot (istrue btrue)) in
      ("zenon_focal_nottrue", [], [c], []);
  | Ext (_, "trueequal", [e1]) ->
     let c = tr_expr (eeq btrue e1) in
     let h = tr_expr (istrue e1) in
     ("zenon_focal_trueequal", [tr_expr e1], [c], [ [h] ])
  | Ext (_, "equaltrue", [e1]) ->
     let c = tr_expr (eeq e1 btrue) in
     let h = tr_expr (istrue e1) in
     ("zenon_focal_equaltrue", [tr_expr e1], [c], [ [h] ])
  | Ext (_, "truenotequal", [e1]) ->
     let c = tr_expr (enot (eeq btrue e1)) in
     let h = tr_expr (enot (istrue e1)) in
     ("zenon_focal_truenotequal", [tr_expr e1], [c], [ [h] ])
  | Ext (_, "notequaltrue", [e1]) ->
     let c = tr_expr (enot (eeq e1 btrue)) in
     let h = tr_expr (enot (istrue e1)) in
     ("zenon_focal_notequaltrue", [tr_expr e1], [c], [ [h] ])
  | Ext (_, "falseequal", [e1]) ->
     let c = tr_expr (eeq bfalse e1) in
     let h = tr_expr (enot (istrue e1)) in
     ("zenon_focal_falseequal", [tr_expr e1], [c], [ [h] ])
  | Ext (_, "equalfalse", [e1]) ->
     let c = tr_expr (eeq e1 bfalse) in
     let h = tr_expr (enot (istrue e1)) in
     ("zenon_focal_equalfalse", [tr_expr e1], [c], [ [h] ])
  | Ext (_, "falsenotequal", [e1]) ->
     let c = tr_expr (enot (eeq bfalse e1)) in
     let h = tr_expr (istrue e1) in
     ("zenon_focal_falsenotequal", [tr_expr e1], [c], [ [h] ])
  | Ext (_, "notequalfalse", [e1]) ->
     let c = tr_expr (enot (eeq e1 bfalse)) in
     let h = tr_expr (istrue e1) in
     ("zenon_focal_notequalfalse", [tr_expr e1], [c], [ [h] ])
  | Ext (_, "merge", _) -> ("zenon_focal_merge", [], [], [])
  | Ext (_, "split", _) -> ("zenon_focal_split", [], [], [])

  | Ext (_, "ite_bool", ([cond; thn; els] as args)) ->
      let ht1 = tr_expr (istrue cond) in
      let ht2 = tr_expr (istrue thn) in
      let he1 = tr_expr (isfalse cond) in
      let he2 = tr_expr (istrue els) in
      let c = tr_expr (istrue (eapp (tvar "FOCAL.ifthenelse" ite_ty, [bool1; cond; thn; els])))
      in
      ("zenon_focal_ite_bool", List.map tr_expr args, [c],
       [ [ht2; ht1]; [he2; he1] ])
  | Ext (_, "ite_bool_n", ([cond; thn; els] as args)) ->
      let ht1 = tr_expr (istrue cond) in
      let ht2 = tr_expr (isfalse thn) in
      let he1 = tr_expr (isfalse cond) in
      let he2 = tr_expr (isfalse els) in
      let c = tr_expr (isfalse (eapp (tvar "FOCAL.ifthenelse" ite_ty, [bool1; cond; thn; els])))
      in
      ("zenon_focal_ite_bool_n", List.map tr_expr args, [c],
       [ [ht2; ht1]; [he2; he1] ])
  | Ext (_, "ite_rel_l",
         [Eapp (r, [Eapp (Evar("FOCAL.ifthenelse",_), [ty; c; t; e], _); e2], _) as a])
    ->
      let ht1 = tr_expr (istrue c) in
      let ht2 = tr_expr (eapp (r, [t; e2])) in
      let he1 = tr_expr (isfalse c) in
      let he2 = tr_expr (eapp (r, [e; e2])) in
      let concl = tr_expr a in
      let v1 = newtvar ty and v2 = newtvar (get_type e2) in
      let rf = elam (v1, elam (v2, eapp (r, [v1; v2]))) in
      ("zenon_focal_ite_rel_l", List.map tr_expr [ty; get_type e2; rf; c; t; e; e2],
       [concl], [ [ht2; ht1]; [he2; he1] ])
  | Ext (_, "ite_rel_r",
         [Eapp (r, [e1; Eapp (Evar("FOCAL.ifthenelse",_), [ty; c; t; e], _)], _) as a])
    ->
      let ht1 = tr_expr (istrue c) in
      let ht2 = tr_expr (eapp (r, [e1; t])) in
      let he1 = tr_expr (isfalse c) in
      let he2 = tr_expr (eapp (r, [e1; e])) in
      let concl = tr_expr a in
      let v1 = newtvar (get_type e1) and v2 = newtvar ty in
      let rf = elam (v1, elam (v2, eapp (r, [v1; v2]))) in
      ("zenon_focal_ite_rel_r", List.map tr_expr [get_type e1; ty; rf; e1; c; t; e],
       [concl], [ [ht2; ht1]; [he2; he1] ])
  | Ext (_, "ite_rel_nl",
         [Enot (Eapp (r, [Eapp (Evar("FOCAL.ifthenelse",_),
                                [ty; c; t; e], _); e2], _), _) as a])
    ->
      let ht1 = tr_expr (istrue c) in
      let ht2 = tr_expr (enot (eapp (r, [t; e2]))) in
      let he1 = tr_expr (isfalse c) in
      let he2 = tr_expr (enot (eapp (r, [e; e2]))) in
      let concl = tr_expr a in
      let v1 = newtvar ty and v2 = newtvar (get_type e2) in
      let rf = elam (v1, elam (v2, eapp (r, [v1; v2]))) in
      ("zenon_focal_ite_rel_nl", List.map tr_expr [ty; get_type e2; rf; c; t; e; e2],
       [concl], [ [ht2; ht1]; [he2; he1] ])
  | Ext (_, "ite_rel_nr",
         [Enot (Eapp (r, [e1; Eapp (Evar("FOCAL.ifthenelse",_),
                                    [ty; c; t; e], _)], _), _) as a])
    ->
      let ht1 = tr_expr (istrue c) in
      let ht2 = tr_expr (enot (eapp (r, [e1; t]))) in
      let he1 = tr_expr (isfalse c) in
      let he2 = tr_expr (enot (eapp (r, [e1; e]))) in
      let concl = tr_expr a in
      let v1 = newtvar (get_type e1) and v2 = newtvar ty in
      let rf = elam (v1, elam (v2, eapp (r, [v1; v2]))) in
      ("zenon_focal_ite_rel_nr", List.map tr_expr [get_type e1; ty; rf; e1; c; t; e],
       [concl], [ [ht2; ht1]; [he2; he1] ])
  | Ext (_, "istrue_true", [e1]) ->
     let h = tr_expr (eeq e1 btrue) in
     let c = tr_expr (istrue e1) in
     ("zenon_focal_istrue_true", [tr_expr e1], [c], [ [h] ])
  | Ext (_, "notistrue_false", [e1]) ->
     let h = tr_expr (eeq e1 bfalse) in
     let c = tr_expr (enot (istrue e1)) in
     ("zenon_focal_notistrue_false", [tr_expr e1], [c], [ [h] ])
  | Ext (_, "ex_bool", [Elam (var, p, _)]) ->
     let ptrue = substitute [(var, btrue)] p in
     let pfalse = substitute [(var, bfalse)] p in
     ("zenon_focal_ex_bool",
      [tr_expr (elam (var, p))],
      [tr_expr (eex (var, p))],
      [ [tr_expr ptrue]; [tr_expr pfalse] ])
  | Ext (_, "not_all_bool", [Elam (var, p, _)]) ->
     let ptrue = substitute [(var, btrue)] p in
     let pfalse = substitute [(var, bfalse)] p in
     ("zenon_focal_not_all_bool",
      [tr_expr (elam (var, p))],
      [tr_expr (enot (eall (var, p)))],
      [ [tr_expr (enot ptrue)]; [tr_expr (enot pfalse)] ])
  | Ext (x, y, _) ->
     Printf.eprintf "unknown extension rule %s/%s\n" x y;
     assert false
  | _ -> assert false
;;

let to_llproof tr_expr mlp args =
  let (name, meta, con, hyp) = to_llargs tr_expr mlp.mlrule in
  let (subs, exts) = List.split (Array.to_list args) in
  let ext = List.fold_left Expr.union [] exts in
  let extras = Expr.diff ext mlp.mlconc in
  let nn = {
      Llproof.conc = List.map tr_expr (extras @@ mlp.mlconc);
      Llproof.rule = Llproof.Rextension ("", name, meta, con, hyp);
      Llproof.hyps = subs;
    }
  in (nn, extras)
;;

let rec pp_expr e =
  match e with
  | Evar _ -> e
  | Emeta _ -> e
  | Earrow _ -> assert false
  | Eapp (Evar("Is_true",_), [Eapp (Evar(s,_) as var, args, _)], _) ->
      eapp (tvar ("Is_true**" ^ s) (ret_bool_to_prop (get_type var)), List.map pp_expr args)
  | Eapp (s, args, _) -> eapp (s, List.map pp_expr args)
  | Enot (e1, _) -> enot (pp_expr e1)
  | Eand (e1, e2, _) -> eand (pp_expr e1, pp_expr e2)
  | Eor (e1, e2, _) -> eor (pp_expr e1, pp_expr e2)
  | Eimply (e1, e2, _) -> eimply (pp_expr e1, pp_expr e2)
  | Eequiv (e1, e2, _) -> eequiv (pp_expr e1, pp_expr e2)
  | Etrue -> e
  | Efalse -> e
  | Eall (v, e, _) -> eall (v, pp_expr e)
  | Eex (v, e, _) -> eex (v, pp_expr e)
  | Etau (v, e, _) -> etau (v, pp_expr e)
(*
  | Elam (v, t, e, _) when occurs "basics.list__t" t ->
      let t1 = replace_first "basics.list__t" "List.list" t in
      elam (v, t1, pp_expr e)
*)
  | Elam (v, e, _) -> elam (v, pp_expr e)
;;

(* Registering of constants for type-checking *)

let prod_ty = earrow [type_type; type_type] type_type
let prod a b =
  eapp (tvar "dk_tuple.prod" prod_ty, [a; b])

let pair_ty =
  let a = newtvar type_type in
  let b = newtvar type_type in
  eall (a, eall (b, earrow [a; b] (prod a b)))
let dk_pair_ty =
  let a = newtvar type_type in
  let b = newtvar type_type in
  eall (a, eall (b, earrow [a; b] (prod a b)))

let first_ty =
  let a = newtvar type_type in
  let b = newtvar type_type in
  eall (a, eall (b, earrow [prod a b] a))

let second_ty =
  let a = newtvar type_type in
  let b = newtvar type_type in
  eall (a, eall (b, earrow [prod a b] b))

let match_pair_ty =
  let a = newtvar type_type in
  let b = newtvar type_type in
  let r = newtvar type_type in
  eall (a, eall (b, eall (r, earrow [prod a b; earrow [a; b] r; r] r)))

let fail_type =
  let a = newtvar type_type in
  eall (a, a)

(* Higher-order application, if its 3rd arg is a Lambda-abstraction,
   it automatically beta-reduces. *)
let app_type =
  let a = newtvar type_type in
  let b = newtvar type_type in
  eall (a, eall (b, earrow [earrow [a] b; a] b))

let pair_var = tvar "basics.pair" pair_ty
let dk_pair_var = tvar "dk_tuple.pair" dk_pair_ty
let fst_var = tvar "basics.fst" first_ty
let snd_var = tvar "basics.snd" second_ty
let match_pair_var = tvar "dk_tuple.match__pair" match_pair_ty
let app_var = tvar ".@" app_type

let pair a b x y = eapp (pair_var, [a; b; x; y])
let dk_pair a b x y = eapp (dk_pair_var, [a; b; x; y])

let first a b c = eapp (fst_var, [a; b; c])
let second a b c = eapp (snd_var, [a; b; c])
let match_pair a b r t f d = eapp (match_pair_var, [a; b; r; t; f; d])

let ho_apply a b f x = eapp (app_var, [a; b; f; x])

let call_by_value_type = app_type;;

let eq_ty =
  let ty = newtvar type_type in
  eall (ty, earrow [ty; ty] bool1)

let bequal ty a b = eapp (tvar "basics.syntactic_equal" eq_ty, [ty; a; b])

let type_nat = eapp (tvar "dk_nat.nat" type_type, [])
let type_int = eapp (tvar "basics.int__t" type_type, [])

let predecl () =
  (* Add rewrite-rules on pairs *)
  Rewrite.add_rwrt_term "fst"
    (let tya = newtvar type_type in
     let tyb = newtvar type_type in
     let a = newtvar tya in
     let b = newtvar tyb in
     eeq (first tya tyb (pair tya tyb a b)) a
    );
  Rewrite.add_rwrt_term "snd"
    (let tya = newtvar type_type in
     let tyb = newtvar type_type in
     let a = newtvar tya in
     let b = newtvar tyb in
     eeq (second tya tyb (pair tya tyb a b)) b
    );
  Rewrite.add_rwrt_prop "basics._equal_"
    (let ty = newtvar type_type in
     let a = newtvar ty in
     let b = newtvar ty in
     eequiv
       (istrue (eapp (tvar "basics._equal_" eq_ty, [ty; a; b])),
        eeq a b)
    );
  Rewrite.add_rwrt_prop "Istrue_true"
    (eequiv (istrue btrue, etrue)
    );
  Rewrite.add_rwrt_prop "Istrue_false"
    (eequiv (istrue bfalse, efalse)
    );
  (* Aliases *)
  Rewrite.add_rwrt_term "basics._equal_"
    (let ty = newtvar type_type in
     let a = newtvar ty in
     let b = newtvar ty in
     eeq (eapp (tvar "basics._equal_" eq_ty, [ty; a; b]))
         (bequal ty a b)
    );
  Rewrite.add_rwrt_term "dk_bool.true"
    (eeq (eapp (tvar "dk_bool.true" bool1, [])) btrue);
  Rewrite.add_rwrt_term "dk_bool.false"
    (eeq (eapp (tvar "dk_bool.false" bool1, [])) bfalse);
  Rewrite.add_rwrt_term "dk_bool.ite"
    (let ty = newtvar type_type in
     let b = newtvar bool1 in
     let t = newtvar ty in
     let e = newtvar ty in
     eeq (eapp (tvar "dk_bool.ite" ite_ty,
                [ty; b; t; e]))
         (eapp (tvar "FOCAL.ifthenelse" ite_ty,
                [ty; b; t; e])));
  Rewrite.add_rwrt_term "dk_tuple.pair"
    (let tya = newtvar type_type in
     let tyb = newtvar type_type in
     let a = newtvar tya in
     let b = newtvar tyb in
     eeq (dk_pair tya tyb a b)
         (pair tya tyb a b));
  Rewrite.add_rwrt_term "dk_tuple.match_pair"
    (let tya = newtvar type_type in
     let tyb = newtvar type_type in
     let tyr = newtvar type_type in
     let t = newtvar (prod tya tyb) in
     let f = newtvar (earrow [tya; tyb] tyr) in
     let d = newtvar tyr in
     eeq (match_pair tya tyb tyr t f d)
         (ho_apply tyb tyr
                   (ho_apply tya (earrow [tyb] tyr) f (first tya tyb t))
                   (second tya tyb t)));
  [
    ("basics.bool__t", type_type);
    ("Is_true", arr bool1 t_prop);
    ("basics.true", bool1);
    ("basics.false", bool1);
    ("dk_bool.true", bool1);
    ("dk_bool.false", bool1);

    ("basics._tilda__tilda_", bool2);
    ("basics._amper__amper_", bool3);
    ("basics._bar__bar_", bool3);
    ("basics._bar__lt__gt__bar_", bool3);

    ("FOCAL.ifthenelse", ite_ty);
    ("dk_bool.ite", ite_ty);

    ("basics.syntactic_equal", eq_ty);

    ("basics._equal_", eq_ty);

    ("basics._equal_",
     let ty = newtvar type_type in
     eall (ty, earrow [ty; ty] bool1));

    ("dk_tuple.prod", prod_ty);
    ("basics.fst", first_ty);
    ("basics.snd", second_ty);
    ("basics.pair", pair_ty);
    ("dk_tuple.pair", dk_pair_ty);
    ("dk_tuple.match__pair", match_pair_ty);
    ("dk_fail.fail", fail_type);
    (".@", app_type);
    ("dk_builtins.call_by_value", call_by_value_type);

    ("dk_int.from_nat", earrow [type_nat] type_int);

  ]
;;

let built_in_defs () =
  let b1 = Expr.newtvar bool1 in
  let b2 = Expr.newtvar bool1 in
  [
    Inductive ("basics.list__t", ["A"], [
                 ("List.nil", []);
                 ("List.cons", [Param "A"; Self]);
               ],
               "@List.list_ind");
    Inductive ("Datatypes.prod", ["A"; "B"],
               [ ("basics.pair", [Param "A"; Param "B"]) ],
               "@Datatypes.prod_ind");
    Inductive ("basics.bool__t", [],
               [ ("basics.true", []); ("basics.false", []) ], "basics.bool__t_ind");

    (* deprecated, kept for compatibility only *)
    Def (DefReal ("and_b", "basics.and_b", bool3, [b1; b2],
                  eapp (tvar "basics._amper__amper_" bool3, [b1; b2]), None));
    Def (DefReal ("or_b", "basics.or_b", bool3, [b1; b2],
                  eapp (tvar "basics._bar__bar_" bool3, [b1; b2]), None));
    Def (DefReal ("not_b", "basics.not_b", bool2, [b1],
                  eapp (tvar "basics._tilda__tilda_" bool2, [b1]), None));
    Def (DefReal ("xor_b", "basics.xor_b", bool3, [b1; b2],
                  eapp (tvar "basics._bar__lt__gt__bar_" bool3, [b1; b2]), None));
  ]
;;

let preprocess l =
  let f x =
    match x with
    | Hyp (name, e, goalness) -> Hyp (name, pp_expr e, goalness)
    | Def (DefReal (name, sym, ty, formals, body, decarg)) ->
        Def (DefReal (name, sym, ty, formals, pp_expr body, decarg))
    | Def (DefRec (eqn, sym, ty, formals, body)) ->
        Def (DefRec (eqn, sym, ty, formals, pp_expr body))
    | Def (DefPseudo _) -> assert false
    | Sig _ -> x
    | Inductive _ -> x
    | Rew _ -> x
  in
  built_in_defs () @ List.map f l
;;

let add_phrase p = ();;

let rec process_expr e =
  match e with
  | Evar _ -> e
  | Emeta _ -> e
  | Earrow _ -> e
  | Eapp (Evar(s,_) as vs, args, _) when is_prefix 0 "Is_true**" s ->
      let s1 = chop_prefix "Is_true**" s in
      let vssty = prop_to_bool_args args (get_type vs) in
      istrue (eapp (tvar s1 vssty, List.map process_expr args))
  | Eapp (s, args, _) -> eapp (s, List.map process_expr args)
  | Enot (e1, _) -> enot (process_expr e1)
  | Eand (e1, e2, _) -> eand (process_expr e1, process_expr e2)
  | Eor (e1, e2, _) -> eor (process_expr e1, process_expr e2)
  | Eimply (e1, e2, _) -> eimply (process_expr e1, process_expr e2)
  | Eequiv (e1, e2, _) -> eequiv (process_expr e1, process_expr e2)
  | Etrue -> e
  | Efalse -> e
  | Eall (e1, e2, _) -> eall (process_expr e1, process_expr e2)
  | Eex (e1, e2, _) -> eex (process_expr e1, process_expr e2)
  | Etau (e1, e2, _) -> etau (process_expr e1, process_expr e2)
  | Elam (e1, e2, _) -> elam (process_expr e1, process_expr e2)
;;

let rec process_expr_set accu l =
  match l with
  | [] -> accu
  | h::t -> process_expr_set (Expr.union [process_expr h] accu) t
;;

open Llproof;;

let rec process_prooftree p =
  let pconc = process_expr_set [] p.conc in
  let phyps = List.map process_prooftree p.hyps in
  match p.rule with
  | Rpnotp (Eapp (Evar(s1,_) as var, args1, _), Enot (Eapp (Evar(s2,_), args2, _), _))
    when is_prefix 0 "Is_true**" s1 ->
      assert (s1 = s2);
      let s = chop_prefix "Is_true**" s1 in
      let vssty = prop_to_bool_args args1 (get_type var) in
      let fa1 = eapp (tvar s vssty, List.map process_expr args1) in
      let fa2 = eapp (tvar s vssty, List.map process_expr args2) in
      let step1 = {
        conc = Expr.union [enot (eeq fa1 fa2)] pconc;
        rule = Rnotequal (fa1, fa2);
        hyps = phyps;
      } in
      let step2 = {
        conc = pconc;
        rule = Rpnotp (istrue fa1, isfalse fa2);
        hyps = [step1];
      } in
      step2
  | Rextension (_, "zenon_focal_merge", _, _, _)
  | Rextension (_, "zenon_focal_split", _, _, _)
    -> begin match phyps with
       | [ p ] -> p
       | _ -> assert false
       end
  | r -> { conc = pconc; rule = process_rule r; hyps = phyps }

and process_rule r =
  match r with
  | Rfalse -> Rfalse
  | Rnottrue -> Rnottrue
  | Raxiom (e1) -> Raxiom (process_expr e1)
  | Rcut (e1) -> Rcut (process_expr e1)
  | Rnoteq (e1) -> Rnoteq (process_expr e1)
  | Reqsym (e1, e2) -> Reqsym (process_expr e1, process_expr e2)
  | Rnotnot (e1) -> Rnotnot (process_expr e1)
  | Rconnect (op, e1, e2) -> Rconnect (op, process_expr e1, process_expr e2)
  | Rnotconnect (op, e1, e2) ->
      Rnotconnect (op, process_expr e1, process_expr e2)
  | Rex (e1, v) -> Rex (process_expr e1, v)
  | Rall (e1, e2) -> Rall (process_expr e1, process_expr e2)
  | Rnotex (e1, e2) -> Rnotex (process_expr e1, process_expr e2)
  | Rnotall (e1, v) -> Rnotall (process_expr e1, v)
  | Rpnotp (e1, e2) -> Rpnotp (process_expr e1, process_expr e2)
  | Rnotequal (e1, e2) -> Rnotequal (process_expr e1, process_expr e2)
  | RcongruenceLR (e1, e2, e3) ->
     RcongruenceLR (process_expr e1, process_expr e2, process_expr e3)
  | RcongruenceRL (e1, e2, e3) ->
     RcongruenceRL (process_expr e1, process_expr e2, process_expr e3)
  | Rdefinition (n, s, args, body, recarg, e1, e2) ->
      Rdefinition (n, s, args, body, recarg, process_expr e1, process_expr e2)
  | Rextension (e, s, el1, el2, ell) ->
      Rextension (e, s, List.map process_expr el1, List.map process_expr el2,
                  List.map (List.map process_expr) ell)
  | Rlemma (_, _) -> r
;;

let process_lemma l = { l with
  params = List.map (fun (ty, e) -> (ty, process_expr e)) l.params;
  proof = process_prooftree l.proof;
};;
let postprocess p = List.map process_lemma p;;

let declare_context_coq oc =
  fprintf oc "Require Import zenon_focal.\n";
  fprintf oc "Require Import basics.\n";
;;

let p_rule_coq oc r = assert false;;

let predef () =
  names_of_equality @
    ["bool"; "Is_true"; "basics._tilda__tilda_"; "basics._amper__amper_";
     "basics._bar__bar_";
     "basics._bar__lt__gt__bar_";
     "basics.pair"; "basics.fst"; "basics.snd";
     "basics._equal_";
     "basics.true"; "basics.false"; "FOCAL.ifthenelse" ;
     "List.cons"; "List.nil";
    ]
;;

Extension.register {
  Extension.name = "focal";
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
  Extension.predecl = predecl;
};;
