
(*
copyright (c) 2014, guillaume bury
all rights reserved.

redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:

redistributions of source code must retain the above copyright notice, this
list of conditions and the following disclaimer.  redistributions in binary
form must reproduce the above copyright notice, this list of conditions and the
following disclaimer in the documentation and/or other materials provided with
the distribution.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*)

(* OPTIMS:
 * - distinguish separate systems (that do not interact), such as in { 1 <= 3x = 3y <= 2; z <= 3} ?
 * - Implement gomorry cuts ?
*)

(* Signature for the variable type *)
module type VarType = sig
    type t
    val hash : t -> int
    val equal : t -> t -> bool
    val compare : t -> t -> int
end

(* Output signature for the simplex module *)
module type S = sig

    type var
    type t
    type 'cert res =
        | Solution of (var * Q.t) list
        | Unsatisfiable of 'cert
    type k_cert = var * (Q.t * var) list
    type n_cert = cert_tree option ref
    and cert_tree =
            | Branch of var * Z.t * n_cert * n_cert
            | Explanation of k_cert
    type k_res = k_cert res
    type n_res = n_cert res
    type optim =
        | Tight of var
        | Multiply of var *  Q.t
    type debug_printer = Format.formatter -> t -> unit

    (* Simplex construction *)
    val create      : unit -> t
    val copy        : t -> t
    val add_eq      : t -> var * (Q.t * var) list -> unit
    val add_bounds  : t -> ?strict_lower:bool -> ?strict_upper:bool -> var * Q.t * Q.t -> unit
    (* Simplex solving *)
    val ksolve      : ?debug:(Format.formatter -> t -> unit) -> t -> k_res
    val nsolve      : t -> (var -> bool) -> n_res
    val nsolve_safe : t -> (var -> bool) -> Q.t * n_res
    val nsolve_incr : t -> (var -> bool) -> (unit -> n_res option)
    (* Optimization functions *)
    val tighten      : (var -> bool) -> t -> optim list
    val normalize    : (var -> bool) -> t -> optim list
    val preprocess   : t -> (var -> bool) -> optim list
    val apply_optims : (t -> optim list) list -> t -> optim list
    (* Access functions, some are rewritten at the end of the module *)
    val get_tab         : t -> var list * var list * Q.t list list
    val get_assign      : t -> (var * (Q.t * Q.t)) list
    val get_full_assign : t -> (var * Q.t) list
    val get_bounds      : t -> var -> Q.t * Q.t
    val get_all_bounds  : t -> (var * (Q.t * Q.t)) list
    (* Printing functions *)
    val print_debug : (Format.formatter -> var -> unit) -> debug_printer
end

(* Simplex Implementation *)
module Make(Var: VarType) = struct

    let equal_var x y = Var.compare x y = 0

    module H = Hashtbl.Make(Var)

    (* Exceptions *)
    exception Unsat of Var.t
    exception SolutionFound of (Var.t * Q.t) list
    exception AbsurdBounds of Var.t
    exception NoneSuitable
    exception UnExpected of string

    (* Type declarations *)
    type var = Var.t
    type erat = Q.t * Q.t

    type t = {
        tab : Q.t CCVector.vector CCVector.vector;
        basic : Var.t CCVector.vector;
        nbasic : Var.t CCVector.vector;
        assign : erat CCVector.vector;
        mutable bounds : (erat * erat) H.t; (* (lower, upper) *)
    }

    type 'cert res =
        | Solution of (Var.t * Q.t) list
        | Unsatisfiable of 'cert

    type k_cert = var * (Q.t * var) list
    type n_cert = cert_tree option ref
    and cert_tree =
            | Branch of Var.t * Z.t * n_cert * n_cert
            | Explanation of k_cert

    type k_res = k_cert res
    type n_res = n_cert res

    type debug_printer = Format.formatter -> t -> unit

    (* Misc *)
    let list_min f l =
        let rec aux acc = function
            | [] -> acc
            | x :: r -> aux (if f acc x < 0 then acc else x) r
        in match l with
        | [] -> raise Not_found
        | a :: r -> aux a r


    (* epsilon-rationals *)
    let ezero = Q.zero, Q.zero
    let mul k (a,e) = Q.((k * a, k * e))
    let sum (a,e1) (b,e2) = Q.((a + b, e1 + e2))
    let compare (a,e1) (b,e2) = match Q.compare a b with
        | 0 -> Q.compare e1 e2
        | x -> x

    let lt a b = compare a b < 0
    let gt a b = compare a b > 0

    let min x y = if compare x y <= 0 then x else y
    let max x y = if compare x y >= 0 then x else y

    let evaluate epsilon (a,e) = Q.(a + epsilon * e)

    (* Base manipulation functions *)
    let vget = CCVector.get
    let vset = CCVector.set

    let mget m i j = vget (vget m i) j
    let mset m i j v = vset (vget m i) j v

    let copy_vect = CCVector.copy

    let matrix_iter f m =
        for i = 0 to CCVector.length m - 1 do
            for j = 0 to CCVector.length (vget m 0) - 1 do
                mset m i j (f i j (mget m i j))
            done
        done

    let init_matrix line col f =
        CCVector.init line (fun i -> CCVector.init col (fun j -> f i j))

    let copy_matrix m =
        if CCVector.length m = 0 then
            init_matrix 0 0 (fun i j -> Q.zero)
        else
            init_matrix (CCVector.length m) (CCVector.length (vget m 0)) (mget m)

    (* Simplex state base functions *)
    let create () = {
        tab = CCVector.create ();
        basic = CCVector.create ();
        nbasic = CCVector.create ();
        assign = CCVector.create ();
        bounds = H.create 100;
    }

    let copy t = {
        tab = copy_matrix t.tab;
        basic = copy_vect t.basic;
        nbasic = copy_vect t.nbasic;
        assign = copy_vect t.assign;
        bounds = H.copy t.bounds;
    }

    (* Expr manipulation *)
    exception Found of int
    let index x a =
        try
            for i = 0 to CCVector.length a - 1 do
                if equal_var x (vget a i) then raise (Found i)
            done;
            (-1)
        with Found i -> i

    let mem x a = index x a >= 0

    let rec list_uniq = function
        | [] -> []
        | a :: r ->
                let l = list_uniq r in
                if List.exists (equal_var a) l then l else a :: l

    let rec empty_expr n = CCVector.make n Q.zero

    let find_expr_basic t x =
        match index x t.basic with
        | -1 -> raise (UnExpected "Trying to find an expression for a non-basic variable.")
        | i -> vget t.tab i

    let find_expr_nbasic t x =
        CCVector.init (CCVector.length t.nbasic) (fun j -> if equal_var x (vget t.nbasic j) then Q.one else Q.zero)

    let find_expr_total t x =
        if mem x t.basic then
            find_expr_basic t x
        else if mem x t.nbasic then
            find_expr_nbasic t x
        else
            raise (UnExpected "Unknown variable")

    let find_coef t x y =
        match index x t.basic, index y t.nbasic with
        | -1, _ | _, -1 -> assert false
        | i, j -> mget t.tab i j

    let basic_value t i =
        let expr = vget t.tab i in
        let res = ref ezero in
        for i = 0 to CCVector.length expr - 1 do
            res := sum !res (mul (vget expr i) (vget t.assign i))
        done;
        !res

    let value t x =
        match index x t.nbasic with
        | -1 ->
                basic_value t (index x t.basic)
        | i ->
                vget t.assign i

    let get_bounds t x = try H.find t.bounds x with Not_found -> Q.((minus_inf, zero), (inf, zero))

    let is_within_aux v (low, upp) =
        if compare v low <= -1 then
            (false, low)
        else if compare v upp >= 1 then
            (false, upp)
        else
            (true, v)

    let is_within t x =
        let v = value t x in
        let low, upp = get_bounds t x in
        is_within_aux v (low, upp)

    (* Add functions *)
    let add_vars t l =
        let l = List.filter (fun x -> not (mem x t.basic || mem x t.nbasic)) l in
        let l = list_uniq l in
        if l <> [] then begin
            let a = Array.of_list l in
            let z = Array.make (Array.length a) Q.zero in
            let ez = Array.make (Array.length a) ezero in
            CCVector.append_array t.nbasic a;
            CCVector.append_array t.assign ez;
            CCVector.iter (fun v -> CCVector.append_array v z) t.tab;
        end

    let add_eq t (s, eq) =
        if mem s t.basic || mem s t.nbasic then
            raise (UnExpected "Variable already defined.");
        add_vars t (List.map snd eq);
        let new_eq = CCVector.make (CCVector.length t.nbasic) Q.zero in
        let aux (c, x) = CCVector.iteri
                (fun i c' -> vset new_eq i (Q.((vget new_eq i) + c * c')))
                (find_expr_total t x)
        in
        List.iter aux eq;
        CCVector.push t.tab new_eq;
        CCVector.push t.basic s;
        ()

    (* Modifies bounds in place. Do NOT export. *)
    let add_bounds_aux ?force:(b=false) t ?strict_lower:(slow=false) ?strict_upper:(supp=false) (x, l, u) =
        add_vars t [x];
        let low = (l, if slow then Q.one else Q.zero) in
        let upp = (u, if supp then Q.neg Q.one else Q.zero) in
        if b then
            H.replace t.bounds x (low, upp)
        else
            let low', upp' = get_bounds t x in
            H.replace t.bounds x (max low low', min upp upp');
            match index x t.nbasic with
            | -1 -> ()
            | i ->
                    let (b, v) = is_within t x in
                    if not b then
                        vset t.assign i v

    let add_bounds = add_bounds_aux ~force:false
    let change_bounds = add_bounds_aux ~force:true

    let enforce_bounds t =
        CCVector.iteri (fun i v ->
            let (b, v') = is_within_aux v (get_bounds t (vget t.nbasic i)) in
            if not b then
                vset t.assign i v') t.assign

    let restore_bounds t bounds =
        t.bounds <- bounds;
        enforce_bounds t

    let full_assign t = List.map (fun x -> (x, value t x))
        (List.sort Var.compare (CCVector.to_list t.nbasic @ CCVector.to_list t.basic))

    let solve_epsilon t =
        let emin = ref Q.minus_inf in
        let emax = ref Q.inf in
        H.iter (fun x ((low,e1), (upp,e2)) ->
            let v,e = value t x in
            if Q.(e - e1 > zero) then
                emin := Q.max !emin Q.((low - v) / (e - e1))
            else if Q.(e - e1 < zero) then (* shouldn't happen, theoretically *)
                emax := Q.min !emax Q.((low - v) / (e - e1));
            if Q.(e - e2 > zero) then
                emax := Q.min !emax Q.((upp - v) / (e - e2))
            else if Q.(e - e2 < zero) then
                emin := Q.max !emin Q.((upp - v) / (e - e2));
        ) t.bounds;
        if Q.gt !emin Q.zero then
            !emin
        else if Q.geq !emax Q.one then
            Q.one
        else
            !emax

    let get_full_assign t =
        let e = solve_epsilon t in
        let f = evaluate e in
        List.map (fun (x, v) -> (x, f v)) (full_assign t)

    let find_suitable t i b =
        let test j a =
            let v = vget t.assign j in
            let low, upp = get_bounds t (vget t.nbasic j) in
            if b then
                (lt v upp && Q.gt a Q.zero) || (gt v low && Q.lt a Q.zero)
            else
                (gt v low && Q.gt a Q.zero) || (lt v upp && Q.lt a Q.zero)
        in
        let aux v1 v2 =
            let res = ref [] in
            if CCVector.length v1 <> CCVector.length v2 then
                raise (UnExpected "Wrong list size")
            else begin
                for i = 0 to CCVector.length v1 - 1 do
                    let y = vget v1 i in
                    let a = vget v2 i in
                    if test i a then begin
                        res := (y, (i, a)) :: !res
                    end
                done;
                !res
            end
        in
        try
            list_min
                (fun x y -> Var.compare (fst x) (fst y))
                (aux t.nbasic (vget t.tab i))
        with Not_found -> raise NoneSuitable

    let subst x y a =
        let k = index x a in
        vset a k y

    let pivot t kx ky a =
        (* Assignment change *)
        let v = basic_value t kx in
        vset t.assign ky v;
        (* Matrix Pivot operation *)
        for j = 0 to CCVector.length t.nbasic - 1 do
            if ky = j then
                mset t.tab kx j (Q.inv a)
            else
                mset t.tab kx j (Q.neg (Q.div (mget t.tab kx j) a))
        done;
        for i = 0 to CCVector.length t.basic - 1 do
            if i <> kx then begin
                let c = mget t.tab i ky in
                mset t.tab i ky Q.zero;
                for j = 0 to CCVector.length t.nbasic - 1 do
                    mset t.tab i j Q.((mget t.tab i j) + c * (mget t.tab kx j))
                done
            end
        done;
        (* Switch x and y in basic and nbasic vars *)
        let x = vget t.basic kx in
        let y = vget t.nbasic ky in
        vset t.basic kx y;
        vset t.nbasic ky x

    let find_outside t =
        let res = ref None in
        let aux x = match !res with
            | None -> true
            | Some (_, y, _, _) -> Var.compare x y < 0
        in
        CCVector.iteri (fun i x ->
            let v = basic_value t i in
            let b = get_bounds t x in
            if not (fst (is_within_aux v b)) && aux x then res := Some (i, x, v, b)
            ) t.basic;
        match !res with
        | None -> raise Not_found
        | Some x -> x

    let rec solve_aux debug t =
        debug t;
        H.iter (fun x (l, u) -> if gt l u then raise (AbsurdBounds x)) t.bounds;
        try
            while true do
                let (i, x, v, b) = find_outside t in
                let _, v' = is_within_aux v b in
                try
                    let y, (j, a) = find_suitable t i (compare v v' < 0) in
                    pivot t i j a;
                    vset t.assign j v';
                    debug t
                with NoneSuitable ->
                    raise (Unsat x)
            done;
        with Not_found -> ()

    let ksolve ?debug:(f=fun _ _ -> ()) t =
        let f = f Format.err_formatter in
        try
            solve_aux f t;
            Solution (get_full_assign t)
        with
        | Unsat x ->
                Unsatisfiable (x, List.combine (CCVector.to_list (find_expr_basic t x)) (CCVector.to_list t.nbasic))
        | AbsurdBounds x ->
                Unsatisfiable (x, [])

    (* TODO: is there a better way to do this ? *)
    let is_z v = Z.equal (Q.den v) Z.one
    let is_q v = not (Z.equal (Q.den v) Z.zero || is_z v)

    let denlcm = List.fold_left (fun k c -> if Q.is_real c then Z.lcm k (Q.den c) else k) Z.one

    let lgcd k expr =
        let expr = List.filter (fun v -> Q.is_real v && not (Q.equal v Q.zero)) expr in
        let aux = (fun g c -> Z.gcd g (Q.to_bigint (Q.mul c k))) in
        Q.of_bigint (List.fold_left aux (Q.to_bigint (Q.mul (List.hd expr) k)) (List.tl expr))

    let global_bound t =
        let m, max_coef = H.fold (fun x ((l,_), (u,_)) (m, max_coef) ->
            let m = m + (if Q.is_real l then 1 else 0) + (if Q.is_real u then 1 else 0) in
            let expr = CCVector.to_list (find_expr_total t x) in
            let k = Q.of_bigint (denlcm (l :: u :: expr)) in
            let k' = lgcd k expr in
            let max_coef = Z.max max_coef
                (Q.to_bigint (List.fold_left Q.max Q.zero (List.filter Q.is_real (List.map (fun x -> Q.abs (Q.div (Q.mul k x) k')) (l :: u :: expr))))) in
            m, max_coef
        ) t.bounds (0, Z.zero) in
        let n = Pervasives.max (CCVector.length t.nbasic) m in
        Q.of_bigint (Z.pow (Z.mul (Z.of_int 2) (Z.mul (Z.pow (Z.of_int n) 2) max_coef)) n)

    let bound_all t int_vars g =
        CCVector.iter (fun x -> if int_vars x then add_bounds t (x, Q.neg g, g)) t.nbasic

    type optim =
        | Tight of Var.t
        | Multiply of Var.t * Q.t

    let floor v =
        try
            Q.of_bigint (Z.ediv (Q.num v) (Q.den v))
        with Division_by_zero -> v

    let ceil v = Q.neg (floor (Q.neg v))

    let normalize int_vars t =
        let mask = List.map int_vars (CCVector.to_list t.nbasic) in
        let aux x expr =
            let tmp = ref [] in
            let (l,e1), (u,e2) = get_bounds t x in
            let s1 = not (Q.equal e1 Q.zero) in
            let s2 = not (Q.equal e2 Q.zero) in
            let k = Q.of_bigint (denlcm (l :: u :: expr)) in
            let k' = lgcd k expr in
            let k'' = Q.div k k' in
            if (List.for_all2 (fun b c -> b || Q.equal c Q.zero) mask expr) &&
                (not (Q.equal k' Q.one) && (not (is_z (Q.div (Q.mul l k) k')) || not (is_z (Q.div (Q.mul u k) k')))) then begin
                let low, upp = ceil (Q.mul l k''), floor (Q.mul u k'') in
                tmp := [Tight x];
                change_bounds t ~strict_lower:s1 ~strict_upper:s2 (x, low, upp)
            end else
                change_bounds t ~strict_lower:s1 ~strict_upper:s2 (x, Q.mul l k'', Q.mul u k'');
            (Multiply (x, k'') :: !tmp, List.map (fun c -> Q.mul c k'') expr)
        in
        let o, tab = List.fold_left2 (fun (opt_l, tab_l) x e ->
            let o, e' = aux x e in (o @ opt_l, e' :: tab_l)) ([], [])
            (CCVector.to_list t.basic) (List.map CCVector.to_list (CCVector.to_list t.tab)) in
        List.iteri (fun i l -> List.iteri (mset t.tab i) l) tab;
        o

    let tighten int_vars t =
        let aux acc x =
            let (l,e1), (u,e2) = get_bounds t x in
            let s1 = not (Q.equal e1 Q.zero) in
            let s2 = not (Q.equal e2 Q.zero) in
            if is_q l || is_q u then begin
                change_bounds t ~strict_lower:s1 ~strict_upper:s2 (x, ceil l, floor u);
                Tight x :: acc
            end else
                acc
        in
        List.fold_left aux [] (List.filter int_vars (CCVector.to_list t.nbasic))

    let apply_optims l t =
        List.fold_left (fun acc f -> acc @ (f t)) [] l

    let preprocess t int_vars =
        let l = [
            tighten int_vars;
            normalize int_vars;
        ] in
        apply_optims l t

    (* TODO: insert user functions between iterations ? + debug function for ksolve ? *)
    let nsolve_aux max_depth t int_vars =
        let f = fun _ _ -> () in
        let to_do = Queue.create () in
        let final = ref None in
        Queue.push (0, t.bounds, (vget t.nbasic 0, Q.minus_inf, Q.inf), final) to_do;
        try
            while true do
                let depth, bounds, new_bound, res = Queue.pop to_do in
                if max_depth > 0 && depth > max_depth then
                    raise Exit;
                (* We can assume res = ref None *)
                try
                    restore_bounds t bounds;
                    add_bounds t new_bound;
                    solve_aux f t;
                    let x = List.find (fun y -> not (is_z (fst (value t y)))) int_vars in
                    let v, _ = value t x in
                    let v' = Z.ediv (Q.num v) (Q.den v) in
                    let under, above = (ref None), (ref None) in
                    res := Some (Branch (x, v', under, above));
                    Queue.push (depth + 1, t.bounds, (x, Q.of_bigint (Z.succ v'), Q.inf), above) to_do;
                    Queue.push (depth + 1, H.copy t.bounds, (x, Q.minus_inf, Q.of_bigint v'), under) to_do
                with
                | Not_found ->
                    raise (SolutionFound (get_full_assign t))
                | Unsat x ->
                        res := Some (Explanation (x, List.combine
                            (CCVector.to_list (find_expr_basic t x)) (CCVector.to_list t.nbasic)))
                | AbsurdBounds x ->
                        res := Some (Explanation(x, []))
            done;
            raise (UnExpected "")
        with
        | Queue.Empty ->
                Unsatisfiable final
        | SolutionFound sol ->
                Solution sol

    let nsolve t int_vars =
        let init_bounds = H.copy t.bounds in
        if CCVector.length t.nbasic = 0 then
            raise (Invalid_argument "Simplex is empty.");
        let res = nsolve_aux 0 t (List.filter int_vars (CCVector.to_list t.nbasic @ CCVector.to_list t.basic)) in
        restore_bounds t init_bounds;
        res

    let nsolve_safe t int_vars =
        let g = global_bound t in
        bound_all t int_vars g;
        g, nsolve t int_vars

    let base_depth t = 100 + 2 * (CCVector.length t.nbasic)

    let nsolve_incr t int_vars =
        if CCVector.length t.nbasic = 0 then
            raise (Invalid_argument "Simplex is empty.");
        let init_bounds = H.copy t.bounds in
        let int_vars = (List.filter int_vars (CCVector.to_list t.nbasic @ CCVector.to_list t.basic)) in
        let max_depth = ref (base_depth t) in
        let acc = ref None in
        let f () = match !acc with
            | Some _ -> !acc
            | None ->
                    try
                        let res = nsolve_aux !max_depth t int_vars in
                        restore_bounds t init_bounds;
                        acc := Some res;
                        Some (res)
                    with Exit ->
                        max_depth := 2 * !max_depth;
                        restore_bounds t init_bounds;
                        None
        in
        f

    let get_tab t =
        CCVector.to_list t.nbasic,
        CCVector.to_list t.basic,
        List.map CCVector.to_list (CCVector.to_list t.tab)

    let get_assign t = List.combine (CCVector.to_list t.nbasic) (CCVector.to_list t.assign)
    let get_bounds t x = let ((l,_), (u,_)) = get_bounds t x in (l,u)
    let get_all_bounds t = H.fold (fun x ((l,_),(u,_)) acc -> (x, (l, u)) :: acc) t.bounds []

    let pp_to_str f format =
        f Format.str_formatter format;
        Format.flush_str_formatter ()

    let tab_box var_to_string t =
        let a = Array.init (CCVector.length t.basic + 1) (fun i ->
                Array.init (CCVector.length t.nbasic + 1) (fun j ->
                    if i = 0 then
                        if j = 0 then
                            "..."
                        else
                            var_to_string (vget t.nbasic (j - 1))
                    else
                        if j = 0 then
                            var_to_string (vget t.basic (i - 1))
                        else (* i > 0 && j > 0 *)
                            Q.to_string (mget t.tab (i - 1) (j - 1))
                )) in
        PrintBox.grid_text ~pad:(PrintBox.hpad 1) ~bars:true a

    let bounds_box var_to_string t =
        let a = Array.make_matrix (H.length t.bounds) 5 "<=" in
        let i = ref 0 in
        H.iter (fun x ((l,e1), (u,e2)) ->
            a.(!i).(0) <- Q.to_string l;
            if not (Q.equal e1 Q.zero) then a.(!i).(1) <- "<";
            a.(!i).(2) <- var_to_string x;
            if not (Q.equal e2 Q.zero) then a.(!i).(3) <- "<";
            a.(!i).(4) <- Q.to_string u;
            incr i;
        ) t.bounds;
        PrintBox.grid_text ~pad:(PrintBox.hpad 1) ~bars:false a

    let print_assign print_var fmt l =
        List.iter (fun (x, (c,e)) -> Format.fprintf fmt "%a -> %s + %s e;@ " print_var x (Q.to_string c) (Q.to_string e)) l

    let print_debug print_var fmt t =
        Format.fprintf fmt
            "@[*** System state ***@.%s@.%s@\n@[<hov 2>Current assign:@\n%a@]@\n******** END ********@."
            (PrintBox.to_string (tab_box (pp_to_str print_var) t))
            (PrintBox.to_string (bounds_box (pp_to_str print_var) t))
            (print_assign print_var) (get_assign t)

end

module type HELPER = sig
  (** User provided variable type *)
  type external_var

  type var = private
    | Intern of int
    | Extern of external_var

  (** Fresh internal variable *)
  val fresh_var : unit -> var

  (** Lift an external variable in the [var] type *)
  val mk_var : external_var -> var

  (** the usual system, but the extended variable type *)
  include S with type var := var

  type monome = (Q.t * external_var) list

  type op = Less | LessEq | Eq | Greater | GreaterEq

  type constraint_ = op * monome * Q.t

  val add_constraints : t -> constraint_ list -> unit
end

module MakeHelp(Var : VarType) = struct
  type external_var = Var.t

  type var =
    | Intern of int
    | Extern of external_var

  let combine hash i = (hash * 65599 + i) land max_int

  let equal_var v1 v2 = match v1, v2 with
    | Intern i, Intern j -> i = j
    | Extern v1, Extern v2 -> Var.equal v1 v2
    | _, _ -> false

  let compare_var v1 v2 = match v1, v2 with
    | Intern i, Intern j -> Pervasives.compare i j
    | Intern _, Extern _ -> 1
    | Extern _, Intern _ -> -1
    | Extern v1, Extern v2 -> Var.compare v1 v2

  let hash_var = function
    | Intern i -> combine (Hashtbl.hash "Intern") (Hashtbl.hash i)
    | Extern v -> combine (Hashtbl.hash "Extern") (Var.hash v)

  let fresh_var =
    let r = ref 0 in
    fun () ->
      let v = Intern !r in
      incr r;
      v

  let mk_var e = Extern e

  (* use the previous module *)
  module M = Make(struct
    type t = var
    let equal = equal_var
    let hash = hash_var
    let compare = compare_var
  end)
  include (M : S with type var := var)

  type monome = (Q.t * external_var) list

  type op = Less | LessEq | Eq | Greater | GreaterEq

  type constraint_ = op * monome * Q.t

  (* normalize a monome *)
  let _normalize_monome l =
    (* merge together coefficients for the same variables *)
    let rec aux l = match l with
      | []
      | [_] -> l
      | (c,_)::l' when Q.equal c Q.zero -> aux l'
      | (c1,v1)::(c2,v2)::l' when compare_var v1 v2 = 0 ->
          aux ((Q.add c1 c2, v1)::l')
      | (c1,v1)::l' -> (c1,v1) :: aux l'
    in
    let l = List.map (fun (c,v) -> c, mk_var v) l in
    (* sort, then merge together *)
    let l = List.sort (fun (_,v1)(_,v2) -> compare_var v1 v2) l in
    aux l

  let add_constraints simpl l =
    List.iter
      (fun c ->
        let op, m, const = c in
        let m = _normalize_monome m in
        (* obtain one coefficient and variable that have bounds *)
        let var, coeff =
          match m with
          | [c,v] -> v, c
          | _ ->
            let v = fresh_var () in
            add_eq simpl (v, m);
            v, Q.one
        in
        (* add bounds for the selected variable *)
        assert(Q.sign coeff <> 0);
        let const' = Q.div const coeff in
        match op with
        | Eq -> add_bounds simpl (var,const',const')
        | Less ->
            (* beware the multiplication by a negative number *)
            if Q.sign coeff < 0
              then add_bounds simpl ~strict_lower:true (var,const',Q.inf)
              else add_bounds simpl ~strict_upper:true (var,Q.minus_inf,const')
        | LessEq ->
            (* beware the multiplication by a negative number *)
            if Q.sign coeff < 0
              then add_bounds simpl (var,const',Q.inf)
              else add_bounds simpl (var,Q.minus_inf,const')
        | Greater ->
            if Q.sign coeff < 0
              then add_bounds simpl ~strict_upper:true (var,Q.minus_inf,const')
              else add_bounds simpl ~strict_lower:true (var,const',Q.inf)
        | GreaterEq ->
            if Q.sign coeff < 0
              then add_bounds simpl (var,Q.minus_inf,const')
              else add_bounds simpl (var,const',Q.inf)
      ) l

end
