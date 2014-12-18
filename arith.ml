(* Copyright 2014 INRIA  *)

open Expr
open Mlproof

let equal = Expr.equal

let type_int = eapp (tvar "Z" type_type, [])
let type_rat = eapp (tvar "Q" type_type, [])
let type_real = eapp (tvar "R" type_type, [])

(* String to rational conversion *)
let of_string s =
    let rec aux s decimal pos acc =
        if pos >= 0 && pos < String.length s then begin
            match s.[pos] with
            | '0' .. '9' as c ->
                    let n = Q.of_string (String.make 1 c) in
                    if decimal <= 0 then
                        aux s decimal (pos + 1) Q.(acc * (of_int 10) + n)
                    else
                        aux s (decimal + 1) (pos + 1)
                            Q.(acc + n / of_bigint Z.(pow (of_int 10) decimal))
            | '/' ->
                    if decimal <= 0 then
                        Q.div acc (aux s 0 (pos + 1) Q.zero)
                    else
                        raise (Invalid_argument s)
            | '.' -> aux s 1 (pos + 1) acc
            | _ -> raise (Invalid_argument s)
        end else
            acc
    in
    match String.length s with
    | 0 -> raise (Invalid_argument s)
    | 1 -> aux s 0 0 Q.zero
    | _ -> begin match s.[0] with
        | '-' -> Q.neg (aux s 0 1 Q.zero)
        | _ -> aux s 0 0 Q.zero
    end

(* Exprs manipulation *)
let mk_int v = eapp (tvar v type_int, [])
let mk_rat v = eapp (tvar v type_rat, [])
let mk_real v = eapp (tvar v type_real, [])

let is_num_string s = try ignore (of_string s); true with Invalid_argument _ -> false

let is_int e = Expr.equal type_int (Expr.get_type e)
let is_rat e = Expr.equal type_rat (Expr.get_type e)
let is_real e = Expr.equal type_real (Expr.get_type e)

let is_type_num t = List.exists (Expr.equal t) [type_int; type_rat; type_real]
let is_num e = is_type_num (Expr.get_type e)

(* We assume t a t' are numeric types *)
let mix_type t t' =
    assert (is_type_num t && is_type_num t');
    match (Expr.equal type_real t), (Expr.equal type_real t') with
    | true, _
    | _, true -> type_real
    | false, false ->
    begin match (Expr.equal type_rat t), (Expr.equal type_rat t') with
    | true, _
    | _, true -> type_rat
    | false, false -> type_int
    end

(* Manipulation of expressions/formulas *)
exception NotaFormula

let is_z v = Z.equal (Q.den v) Z.one
let is_q v = not (Z.equal (Q.den v) Z.zero || is_z v)
let floor v =
    try
         Q.of_bigint (Z.ediv (Q.num v) (Q.den v))
    with Division_by_zero -> v
let ceil v = Q.neg (floor (Q.neg v))

let comp_neg = function
    | "$less" -> "$greatereq"
    | "$lesseq" -> "$greater"
    | "$greater" -> "$lesseq"
    | "$greatereq" -> "$less"
    | "$is_int" -> "$not_is_int"
    | "$is_rat" -> "$not_is_rat"
    | _ -> assert false

(* Combine types *)
let const s = if is_z (of_string s) then mk_int s else mk_rat s

let mk_op s a b =
    let ta = Expr.get_type a in
    let tb = Expr.get_type b in
    eapp (tvar s (Expr.earrow [ta; tb] (mix_type ta tb)), [a; b])

let sum a b = mk_op "$sum" a b
let diff a b = mk_op "$difference" a b
let mul a b = mk_op "$product" a b
let minus_one e = diff e (const "1")
let plus_one e = sum e (const "1")

let mk_uop s a =
    let t = Expr.get_type a in
    eapp (tvar s (Expr.earrow [t] t), [a])

let uminus a = mk_uop "$uminus" a

let mk_bop s a b =
    let ta = Expr.get_type a in
    let tb = Expr.get_type b in
    eapp (tvar s (Expr.earrow [ta; tb] Expr.type_prop), [a; b])

let less a b = mk_bop "$less" a b
let lesseq a b = mk_bop "$lesseq" a b
let greater a b = mk_bop "$greater" a b
let greatereq a b = mk_bop "$greatereq" a b

(* Possibly unsafe... *)
let rec coerce t = function
    | Evar(_, _) as v -> v
    | Eapp(Evar(s, _), [], _) as c ->
            let aux =
                if Expr.equal type_int t then mk_int
                else if Expr.equal type_rat t then mk_rat
                else if Expr.equal type_real t then mk_real
                else (fun s -> assert false)
            in
            begin try
                aux (Q.to_string (of_string s))
            with Invalid_argument _ -> c
            end
    | Eapp (Evar("$uminus",_), [a], _) -> uminus (coerce t a)
    | Eapp (Evar("$sum",_), [a; b], _) -> sum (coerce t a) (coerce t b)
    | Eapp (Evar("$difference",_), [a; b], _) -> diff (coerce t a) (coerce t b)
    | Eapp (Evar("$product",_), [a; b], _) -> mul (coerce t a) (coerce t b)
    | e -> e

let mk_ubop s a =
    let t = Expr.get_type a in
    eapp (tvar s (Expr.earrow [t] Expr.type_prop), [a])


let rec find_coef x = function
    | [] -> raise Not_found
    | (c, y) :: r -> if equal x y then c else find_coef x r

let rec fadd_aux (c, x) = function
    | [] -> [(c, x)]
    | (c', y) :: r ->
            if equal x y then
                (Q.add c c', x) :: r
            else
                (c', y) :: (fadd_aux (c, x) r)

let fadd a b = List.fold_left (fun e c -> fadd_aux c e) a b
let fdiff a b = fadd a (List.map (fun (c, x) -> (Q.neg c, x)) b)
let fmul c a = List.map (fun (c', x) -> (Q.mul c c', x)) a

let fis_int = List.for_all (fun (_, e) -> is_int e)
let fis_tau = List.for_all (fun (_, e) -> match e with Emeta(_) -> false | _ -> true)
let fis_meta = List.for_all (fun (_, e) -> match e with Emeta(_) -> true | _ -> false)

let fneg (b, s, c) =
    let s = comp_neg s in
    if not (fis_int b) then
        (b, s, c)
    else begin match s with
    | "$less" -> (b, "$lesseq", Q.sub c Q.one)
    | "$greater" -> (b, "$greatereq", Q.add c Q.one)
    | _ -> (b, s, c)
    end

let rec sanitize = function
    | [] -> []
    | (c, _) as a :: r -> if Q.equal Q.zero c then (sanitize r) else a :: (sanitize r)

let rec fpop x = function
    | [] -> (Q.zero, [])
    | (c, y) :: r ->
            if equal x y then
                (Q.neg c), r
            else
                let c', r' = fpop x r in
                c', (c, y) :: r'

let fsep l x =
    let c, r = fpop x l in
    Q.neg c, fmul (Q.inv c) r

let normalize_aux a b =
    let coef e =
        if e = [] then
            Q.one
        else
            let k = Q.of_bigint (List.fold_left (fun k c -> if Q.is_real c then Z.lcm k (Q.den c) else k) Z.one e) in
            let aux = (fun g c -> Z.gcd g (Q.to_bigint (Q.mul c k))) in
            Q.div k (Q.of_bigint (List.fold_left aux (Q.to_bigint (Q.mul (List.hd e) k)) (List.tl e)))
    in
    let f = fdiff a b in
    let c, e = fpop etrue f in
    let e = sanitize e in
    let k = Q.abs (coef (List.map fst e)) in
    k, (Q.mul c k, (List.map (fun (c, x) -> (Q.mul c k, x)) e))

let normalize a b = snd (normalize_aux a b)

let of_cexpr e = match e with
    | Eapp(Evar(s, _), [], _) when is_num e ->
            begin try
                of_string s
            with Invalid_argument _ ->
                raise Exit
            end
    | _ -> raise NotaFormula

let rec of_nexpr e = match e with
    | Eapp (Evar(s, _), [], _) -> begin try [of_cexpr e, etrue] with Exit -> [Q.one, e] end
    | Eapp (Evar("$uminus",_), [a], _) -> fdiff [Q.zero, etrue] (of_nexpr a)
    | Eapp (Evar("$sum",_), [a; b], _) -> fadd (of_nexpr a) (of_nexpr b)
    | Eapp (Evar("$difference",_), [a; b], _) -> fdiff (of_nexpr a) (of_nexpr b)
    | Eapp (Evar("$product",_), [a; b], _) ->
            begin match (of_nexpr a, of_nexpr b) with
            | [k, Etrue], f | f, [k, Etrue] ->
                    fmul k f
            | _ -> raise NotaFormula
            end
    | _ -> [Q.one, e]

let of_bexpr_aux = function
    | Eapp (Evar(("$less"|"$lesseq"|"$greater"|"$greatereq") as s,_), [a; b], _ ) ->
            let a', b' = of_nexpr a, of_nexpr b in
            let k, (c, e) = normalize_aux a' b' in
            k, (e, s, c)
    | Eapp (Evar("=",_), [a; b], _ ) when is_num a && is_num b ->
            let a', b' = of_nexpr a, of_nexpr b in
            let k, (c, e) = normalize_aux a' b' in
            k, (e, "=", c)
    | Eapp (Evar(("$is_int"|"$is_rat"|"$not_is_int"|"$not_is_rat") as s,_), [a], _) ->
            let a' = of_nexpr a in
            let k, (c, e) = normalize_aux [Q.zero, etrue] a' in
            k, (e, s, c)
    | _ -> raise NotaFormula

let of_bexpr e = snd (of_bexpr_aux e)

let is_bexpr e = try ignore (of_bexpr e); true with NotaFormula -> false

let norm_coef e = const (Q.to_string (fst (of_bexpr_aux e)))

let to_nexpr_aux (c, x) =
    if x == etrue then const (Q.to_string c) else
    (if Q.equal Q.one c then x else mul (const (Q.to_string c)) x)

let to_nexpr = function
    | [] -> const "0"
    | (c, x) :: r -> List.fold_left
        (fun e (c', x') -> if Q.sign c' < 0 then diff e (to_nexpr_aux (Q.neg c', x')) else sum e (to_nexpr_aux (c', x')))
                          (if Q.sign c < 0 then uminus (to_nexpr_aux (Q.neg c, x)) else to_nexpr_aux (c, x)) r

let to_bexpr (e, s, c) = mk_bop s (to_nexpr e) (const (Q.to_string c))

let expr_norm e = try to_bexpr (of_bexpr e) with NotaFormula -> e

let is_rexpr = function
    | e when is_real e -> true
    | Eapp (_, l, _) -> List.exists is_real l
    | _ -> false

(* Coq translation *)
let mk_coq_q p q =
    let div = tvar "$coq_div" (Expr.earrow [type_int; type_int] type_rat) in
    eapp (div, [p; q])

let coq_const c = mk_coq_q (const (Z.to_string (Q.num c))) (const (Z.to_string (Q.den c)))

let coq_var x =
    if is_int x then
        mk_coq_q x (const "1")
    else
        x

let type_scope = tvar "#coq_scope" Expr.type_type

let coq_scope s e =
    let t = Expr.get_type e in
    let scope = tvar "$coq_scope" (Expr.earrow [type_scope; t] t) in
    eapp (scope, [tvar s type_scope; e])

let z_scope = coq_scope "Z"
let q_scope = coq_scope "Q"
let r_scope = coq_scope "R"

let rec coqify_real e = match e with
    | Evar(s, _) ->
            begin try
                tvar (Q.to_string (of_string s)) (Expr.get_type e)
            with Exit | Invalid_argument _ ->
                e
            end
    | Eapp (f, l, _) ->
            eapp (coqify_real f, List.map coqify_real l)
    | Enot (e', _) -> enot (coqify_real e')
    | Eand (e1, e2, _) -> eand (coqify_real e1, coqify_real e2)
    | Eor (e1, e2, _) -> eor (coqify_real e1, coqify_real e2)
    | Eimply (e1, e2, _) -> eimply (coqify_real e1, coqify_real e2)
    | Eequiv (e1, e2, _) -> eequiv (coqify_real e1, coqify_real e2)
    | Eall (v, e', _) -> eall (v, coqify_real e')
    | Eex (v, e', _) -> eex (v, coqify_real e')
    | Elam (v, e', _) -> elam (v, coqify_real e')
    | _ -> e

let rec coqify_aux b e =
    let aux = if b then coqify_to_q else coqify_term in
    match e with
    | Evar(_)
    | Etau(_)
    | Emeta(_) when is_int e ->
            if b then mk_coq_q e (const "1") else e
    | Evar(v, _) when is_rat e ->
            begin try coq_const (of_string v) with Invalid_argument _ -> e end
    | Eapp (Evar(_,_) as e', [], _) -> coqify_aux b e'
    | Eapp (Evar("$uminus",_), [a], _) -> uminus (aux a)
    | Eapp (Evar("$sum",_), [a; b], _) -> sum (aux a) (aux b)
    | Eapp (Evar("$difference",_), [a; b], _) -> diff (aux a) (aux b)
    | Eapp (Evar("$product",_), [a; b], _) -> mul (aux a) (aux b)
    | Eapp (f, l, _) ->
            let e' = eapp (f, List.map coqify_term l) in
            if b && is_int e then mk_coq_q e' (const "1") else e'
    | _ -> e

and coqify_term e =
    if is_int e then
        z_scope (coqify_aux false e)
    else if is_rat e then
        q_scope (coqify_aux true e)
    else if is_real e then
        r_scope (coqify_real e)
    else
        coqify_aux true e

and coqify_to_q e =
    if is_int e then
        mk_coq_q (coqify_term e) (const "1")
    else
        coqify_term e

and coqify_to_r e =
    r_scope (coqify_real e)

and coqify_prop e = match e with
    | Eapp (Evar("=",_), [a; b], _ ) when is_real a || is_real b ->
            mk_bop "=" (coqify_to_r a) (coqify_to_r b)
    | Eapp (Evar("=",_), [a; b], _ ) when is_rat a || is_rat b ->
            mk_bop "==" (coqify_to_q a) (coqify_to_q b)
    | Eapp (Evar("=",_), [a; b], _ ) when is_num a && is_num b ->
            mk_bop "=" (coqify_term a) (coqify_term b)
    | Eapp (Evar(("$less"|"$lesseq"|"$greater"|"$greatereq") as s,_), [a; b], _ )
        when is_real a || is_real b ->
            r_scope (mk_bop s (coqify_to_r a) (coqify_to_r b))
    | Eapp (Evar(("$less"|"$lesseq"|"$greater"|"$greatereq") as s,_), [a; b], _ )
        when is_num a && is_num b ->
            q_scope (mk_bop s (coqify_to_q a) (coqify_to_q b))
    | Eapp (Evar(("$is_int"|"$is_rat"|"$not_is_int"|"$not_is_rat") as s,_), [a], _) ->
            mk_ubop s (coqify_term a)
    | Eapp(f, l, _) -> eapp (f, List.map coqify_term l)
    | Enot(f, _) -> enot (coqify_prop f)
    | Eand(f, g, _) -> eand (coqify_prop f, coqify_prop g)
    | Eor(f, g, _) -> eor (coqify_prop f, coqify_prop g)
    | Eimply(f, g, _) -> eimply (coqify_prop f, coqify_prop g)
    | Eequiv(f, g, _) -> eequiv (coqify_prop f, coqify_prop g)
    | Etrue
    | Efalse -> e
    | Eall(v, body, _) -> eall (v, coqify_prop body)
    | Eex(v, body, _) -> eex (v, coqify_prop body)
    | Etau(v, body, _) -> e
    | Elam(v, body, _) -> elam (v, coqify_prop body)
    | _ -> coqify_term e

let coqify e =
    Log.debug 15 "Coqifying term : %a ::: %a" Print.pp_expr e Print.pp_expr (get_type e);
    match get_type e with
    | t when Expr.equal t type_none -> e
    | t when Expr.equal type_prop t -> coqify_prop e
    | Earrow _ -> coqify_prop e
    | _ -> coqify_term e

(* Analog to circular lists with a 'stop' element, imperative style *)
exception EndReached

type 'a clist = {
    mutable front : 'a list;
    mutable acc : 'a list;
}

let cl_is_empty l = l.front = [] && l.acc = []

let cl_to_list l = (List.rev l.acc) @ l.front

let cl_from_list l = {
    front = l;
    acc = []
}

let cl_current l =
    if l.front = [] then
        raise EndReached
    else
        List.hd l.front

let cl_next l =
    if l.front = [] then
        raise EndReached
    else begin
        let x = List.hd l.front in
        l.front <- List.tl l.front;
        l.acc <- x :: l.acc
    end

let cl_to_list l = (List.rev l.acc) @ l.front

let cl_reset cl =
    (* l.front *should* be empty, but just in case,.. *)
    let l = cl_to_list cl in
    cl.front <- l;
    cl.acc <- []

(* Combinatorial tree *)
type 'a ctree = {
    node : 'a clist;
    children : 'a ctree array;
}

let ct_is_empty t =
    Array.length t.children = 0 && cl_is_empty t.node

let collapse t =
    let rec aux l t =
        if Array.length t.children = 1 then
            aux (l @ cl_to_list t.node) t.children.(0)
        else
            {
                node = cl_from_list (l @ cl_to_list t.node);
                children = Array.map (aux []) t.children;
            }
    in
    aux [] t

let rec reset t =
    cl_reset t.node;
    Array.iter reset t.children

let rec next t =
    try
        cl_next t.node
    with EndReached ->
        if Array.length t.children = 0 then
            raise EndReached
        else begin
            let i = ref 0 in
            try
                while true do
                    if !i >= Array.length t.children then
                        raise EndReached;
                    try
                        next t.children.(!i);
                        raise Exit
                    with EndReached ->
                        reset t.children.(!i);
                        incr i
                done
            with Exit -> ()
        end

let rec current t =
    let rec aux t =
        try
            [cl_current t.node]
        with EndReached ->
            if Array.length t.children = 0 then
                raise Exit
            else
                List.concat @@ Array.to_list @@ (Array.map aux t.children)
    in
    try
        aux t
    with Exit ->
        next t; current t

let ct_all t =
    let res = ref [] in
    try
        while true do
            res := (current t) :: !res;
            next t
        done;
        !res
    with EndReached -> List.rev !res

let is_inst_node p = match p.mlrule with
    | All (e, e') -> begin match e' with
        | Emeta(e'', _) when equal e e'' -> false
        | _ -> true
        end
    | NotEx(e, e') -> begin match e' with
        | Emeta(e'',_) when equal e (enot e'') -> false
        | _ -> true
        end
    | _ -> false

let ct_from_ml p =
    let filter l = List.filter (fun e ->
        try begin match of_bexpr e with
            | (_, "=", _) -> false
            | (f, ("$less"|"$lesseq"|"$greater"|"$greatereq"), _) ->
                (List.for_all (fun (_, e) ->
                    (is_num e) && (match e with
                    | Emeta(_) -> true
                    | Eapp(Evar(s, _), [], _) -> false
                    | _ -> false)) f) &&
                (List.exists (fun (_, e) -> match e with
                    | Emeta(_) -> true
                    | _ -> false) f)
            | _ -> false
        end with NotaFormula -> false
        ) l in
    let rec aux l p =
        (*
        if is_inst_node p then
            { node = cl_from_list []; children = [| |]; }
        else
            *)
            let l' = match p.mlrule with
                | Ext("arith", "inst", x) -> x (* @ p.mlconc ? *)
                | _ -> p.mlconc
            in
            let hyps = Array.to_list p.mlhyps in
            let hyps = List.filter is_open_proof hyps in
            let hyps = List.map (aux l') hyps in
            let hyps = List.filter (fun t -> not (ct_is_empty t)) hyps in
            let hyps = Array.of_list hyps in
            {
                node = cl_from_list (filter (Expr.diff p.mlconc l));
                children = hyps;
            }
    in
    let res = aux [] p in
    if ct_is_empty res then
        None
    else
        Some res

exception Found_inst of proof
let find_next_inst p =
    let rec aux p =
        if is_inst_node p
        then raise (Found_inst p)
        else Array.iter aux p.mlhyps
    in
    try aux p; raise EndReached with Found_inst p ->
        let e, l = match p.mlrule with
            | All(e, _) | NotEx(e, _) -> e, p.mlconc
            | _ -> assert false
        in
        e, { p with mlrule = Ext("arith", "inst", l) }

let replace_inst p (e, inst) =
    let rec aux p = match p.mlrule with
        | All(e', _) | NotEx(e', _) when equal e e' ->
                { inst with mlconc = p.mlconc }
        | _ -> { p with mlhyps = Array.map aux p.mlhyps }
    in
    aux p

let next_inst p = replace_inst p (find_next_inst p)

let rec treebox p =
    let aux cl =
        let l = cl_to_list cl in
        let s = String.concat ", " (List.map Print.sexpr l) in
        PrintBox.Simple.(`Text (Log.sprintf "[%s]" s))
    in
    PrintBox.Simple.(`Tree (aux p.node, Array.to_list @@ Array.map treebox p.children))

let sctree t = PrintBox.Simple.to_string (treebox t)

(* Simplex solver with a cache *)
let lhash l = List.fold_left (+) 0 (List.map Expr.hash l)
let lequal l l' = try List.for_all2 equal l l' with Invalid_argument _ -> false

module Simplex = Simplex.MakeHelp(Expr)
module ElH = Hashtbl.Make(struct type t = Expr.t list let hash = lhash let equal = lequal end)

let pp_simplex b s =
    let fmt = Format.formatter_of_buffer b in
    let print_var fmt = function Simplex.Extern e -> Format.fprintf fmt "%s" (Print.sexpr e) | Simplex.Intern i -> Format.fprintf fmt "v%d" i in
    Format.fprintf fmt "%a" (Simplex.print_debug print_var) s

let cache = ElH.create 97

let simplex_is_int = function
    | Simplex.Extern v -> is_int v
    | Simplex.Intern _ -> false

let add_expr e st =
    let st = Simplex.copy st in
    try
        begin match fneg (of_bexpr e) with
        | (b, "$less", c) -> Simplex.add_constraints st [Simplex.Less, b, c]
        | (b, "$lesseq", c) -> Simplex.add_constraints st [Simplex.LessEq, b, c]
        | (b, "$greater", c) -> Simplex.add_constraints st [Simplex.Greater, b, c]
        | (b, "$greatereq", c) -> Simplex.add_constraints st [Simplex.GreaterEq, b, c]
        | (b, "=", c) -> Simplex.add_constraints st [Simplex.Eq, b, c]
        | _ -> ()
        end;
        st
    with
    | NotaFormula -> assert false

let rec get_state l =
    try
        ElH.find cache l
    with Not_found ->
        begin match l with
        | [] -> Some(Simplex.create (), fun () -> None)
        | e :: r ->
                let res = match get_state r with
                | None -> None
                | Some(st, _) ->
                    let st = add_expr e st in
                    try
                        let f = Simplex.nsolve_incr st simplex_is_int in
                        begin match f () with
                        | None -> Some(st, f)
                        | Some Simplex.Solution _ -> Some(st, f)
                        | Some Simplex.Unsatisfiable _ -> None
                        end
                    with Invalid_argument "Simplex is empty." -> Some(st, fun _ -> None)
                in
                ElH.add cache l res;
                res
        end

type solution =
    | Unsat
    | Abstract of (expr * expr) list

let try_solve l =
    Log.debug 8 "arith -- Trying to contradict :";
    List.iter (fun e -> Log.debug 8 "arith --    %a" Print.pp_expr e) l;
    match get_state l with
    | None -> Unsat
    | Some (st, f) -> begin match f () with
        | None -> Unsat
        | Some Simplex.Unsatisfiable _ -> Unsat
        | Some Simplex.Solution s ->
                Log.debug 8 "arith -- simplex solution found";
                Log.debug 10 "arith -- simplex state :\n%a" pp_simplex st;
                Log.debug 8 "arith -- tentative solution :";
                let rec aux = function
                    | [] -> []
                    | (Simplex.Extern v, k) :: r ->
                        let e' = to_nexpr [k, etrue] in
                        Log.debug 8 "arith -- %a == %a" Print.pp_expr v Print.pp_expr e';
                        (v, e') :: (aux r)
                    | (Simplex.Intern _, _) :: r -> aux r
                in
                Abstract (aux s)
        end

let solve_tree t =
    reset t;
    let rec aux () =
        match try_solve (current t) with
        | Unsat ->
                begin try
                    next t;
                    aux ()
                with EndReached -> Unsat end
        | x -> x
    in
    aux ()
