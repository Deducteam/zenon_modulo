(*
Copyright (c) 2013, Simon Cruanes
All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:

Redistributions of source code must retain the above copyright notice, this
list of conditions and the following disclaimer.  Redistributions in binary
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

(** {1 Functional Congruence Closure} *)

(** This implementation follows more or less the paper
    "fast congruence closure and extensions" by Nieuwenhuis & Oliveras.
    It uses semi-persistent data structures but still thrives for efficiency. *)

(** {2 Curryfied terms} *)

module type CurryfiedTerm = sig
  type symbol
  type t = private {
    shape : shape;      (** Which kind of term is it? *)
    tag : int;          (** Unique ID *)
  } (** A curryfied term *)
  and shape = private
    | Const of symbol   (** Constant *)
    | Apply of t * t    (** Curryfied application *)

  val mk_const : symbol -> t
  val mk_app : t -> t -> t
  val get_id : t -> int
  val eq : t -> t -> bool
end

module Curryfy(X : Hashtbl.HashedType) = struct
  type symbol = X.t
  type t = {
    shape : shape;      (** Which kind of term is it? *)
    tag : int;          (** Unique ID *)
  }
  and shape =
    | Const of symbol   (** Constant *)
    | Apply of t * t    (** Curryfied application *)

  type term = t

  module WE = Weak.Make(struct
    type t = term
    let equal a b = match a.shape, b.shape with
      | Const ia, Const ib -> X.equal ia ib
      | Apply (a1,a2), Apply (b1,b2) -> a1 == b1 && a2 == b2
      | _ -> false
    let hash a = match a.shape with
      | Const i -> X.hash i
      | Apply (a, b) -> a.tag * 65599 + b.tag
  end)

  let __table = WE.create 10001
  let count = ref 0

  let hashcons t =
    let t' = WE.merge __table t in
    (if t == t' then incr count);
    t'

  let mk_const i =
    let t = {shape=Const i; tag= !count; } in
    hashcons t

  let mk_app a b =
    let t = {shape=Apply (a, b); tag= !count; } in
    hashcons t

  let get_id t = t.tag

  let eq t1 t2 = t1 == t2
end

(** {2 Congruence Closure} *)

module type S = sig
  module CT : CurryfiedTerm

  type t
    (** Congruence Closure instance *)

  exception Inconsistent of t * CT.t * CT.t
    (** Exception raised when equality and inequality constraints are
        inconsistent. The two given terms should be different
        but are equal in the given CC instance. *)

  val create : int -> t
    (** Create an empty CC of given size *)

  val normalize : t -> CT.t -> CT.t
    (** Normal form of the term w.r.t. the congruence *)

  val eq : t -> CT.t -> CT.t -> bool
    (** Check whether the two terms are equal *)

  val merge : t -> CT.t -> CT.t -> t
    (** Assert that the two terms are equal (may raise Inconsistent) *)

  val distinct : t -> CT.t -> CT.t -> t
    (** Assert that the two given terms are distinct (may raise Inconsistent) *)

  type action =
    | Merge of CT.t * CT.t
    | Distinct of CT.t * CT.t
    (** Action that can be performed on the CC *)

  val do_action : t -> action -> t
    (** Perform the given action (may raise Inconsistent) *)

  val can_eq : t -> CT.t -> CT.t -> bool
    (** Check whether the two terms can be equal *)

  val iter_equiv_class : t -> CT.t -> (CT.t -> unit) -> unit
    (** Iterate on terms that are congruent to the given term *)

  val explain : t -> CT.t -> CT.t -> (CT.t * CT.t) list
    (** Explain why those two terms are equal (assuming they are,
        otherwise raises Invalid_argument) by returning a list
        of merges. *)
end

module Make(T : CurryfiedTerm) = struct
  module CT = T
  module BV = Puf.PBitVector
  module Puf = Puf.Make(CT)

  (* Persistent Hashtable on curryfied terms *)
  module THashtbl = PersistentHashtbl.Make(struct
    type t = CT.t
    let equal t1 t2 = t1.CT.tag = t2.CT.tag
    let hash t = t.CT.tag
  end)

  (* Persistent Hashtable on pairs of curryfied terms *)
  module T2Hashtbl = PersistentHashtbl.Make(struct
    type t = CT.t * CT.t
    let equal (t1,t1') (t2,t2') = t1.CT.tag = t2.CT.tag && t1'.CT.tag = t2'.CT.tag
    let hash (t,t') = t.CT.tag * 65599 + t'.CT.tag
  end)

  type t = {
    uf : Puf.t;                   (* representatives for terms *)
    defined : BV.t;               (* is the term defined? *)
    use : eqn list THashtbl.t;    (* for all repr a, a -> all a@b=c and b@a=c *)
    lookup : eqn T2Hashtbl.t;     (* for all reprs a,b, some a@b=c (if any) *)
  } (** Congruence Closure data structure *)
  and eqn =
    | EqnSimple of CT.t * CT.t          (* t1 = t2 *)
    | EqnApply of CT.t * CT.t * CT.t    (* (t1 @ t2) = t3 *)
    (** Equation between two terms *)
  and pending_eqn =
    | PendingSimple of eqn
    | PendingDouble of eqn * eqn

  exception Inconsistent of t * CT.t * CT.t
    (** Exception raised when equality and inequality constraints are
        inconsistent. The two given terms should be different
       but are equal in the given CC instance. *)

  (** Create an empty CC of given size *)
  let create size =
    { uf = Puf.create size;
      defined = BV.make 3;
      use = THashtbl.create size;
      lookup = T2Hashtbl.create size;
    }

  let mem cc t =
    BV.get cc.defined t.CT.tag

  let is_const t = match t.CT.shape with
    | CT.Const _ -> true
    | CT.Apply _ -> false

  (** Merge equations in the congruence closure structure. [q] is a list
      of [eqn], processed in FIFO order. May raise Inconsistent. *)
  let rec merge cc eqn = match eqn with
    | EqnSimple (a, b) ->
      (* a=b, just propagate *)
      propagate cc [PendingSimple eqn]
    | EqnApply (a1, a2, a) ->
      (* (a1 @ a2) = a *)
      let a1' = Puf.find cc.uf a1 in
      let a2' = Puf.find cc.uf a2 in
      begin try
        (* eqn' is (b1 @ b2) = b for some b1=a1', b2=a2' *)
        let eqn' = T2Hashtbl.find cc.lookup (a1', a2') in
        (* merge a and b because of eqn and eqn' *)
        propagate cc [PendingDouble (eqn, eqn')]
      with Not_found ->
        (* remember that a1' @ a2' = a *)
        let lookup = T2Hashtbl.replace cc.lookup (a1', a2') eqn in
        let use_a1' = try THashtbl.find cc.use a1' with Not_found -> [] in
        let use_a2' = try THashtbl.find cc.use a2' with Not_found -> [] in
        let use = THashtbl.replace cc.use a1' (eqn::use_a1') in
        let use = THashtbl.replace use a2' (eqn::use_a2') in
        { cc with use; lookup; }
      end
  (* propagate: merge pending equations *)
  and propagate cc eqns =
    let pending = ref eqns in
    let uf = ref cc.uf in
    let use = ref cc.use in
    let lookup = ref cc.lookup in
    (* process each pending equation *)
    while !pending <> [] do
      let eqn = List.hd !pending in
      pending := List.tl !pending;
      (* extract the two merged terms *)
      let a, b = match eqn with
        | PendingSimple (EqnSimple (a, b)) -> a, b
        | PendingDouble (EqnApply (a1,a2,a), EqnApply (b1,b2,b)) -> a, b
        | _ -> assert false
      in
      let a' = Puf.find !uf a in
      let b' = Puf.find !uf b in
      if not (CT.eq a' b') then begin
        let use_a' = try THashtbl.find !use a' with Not_found -> [] in
        let use_b' = ref (try THashtbl.find !use b' with Not_found -> []) in
        (* merge a and b's equivalence classes *)
        uf := Puf.union !uf a b;
        (* consider all c1@c2=c in use(a') *)
        List.iter
          (fun eqn -> match eqn with
          | EqnSimple _ -> ()
          | EqnApply (c1, c2, c) ->
            let c1' = Puf.find !uf c1 in
            let c2' = Puf.find !uf c2 in
            begin try
              let eqn' = T2Hashtbl.find !lookup (c1', c2') in
              (* merge eqn with eqn', by congruence *)
              pending := (PendingDouble (eqn,eqn')) :: !pending
            with Not_found ->
              lookup := T2Hashtbl.replace !lookup (c1', c2') eqn;
              use_b' := eqn :: !use_b';
            end)
          use_a';
        (* update use list of b' *)
        use := THashtbl.replace !use b' !use_b';
        (* check for inconsistencies *)
        match Puf.inconsistent !uf with
        | None -> ()  (* consistent *)
        | Some (t1, t2) ->
          (* inconsistent *)
          let cc = { cc with use= !use; lookup= !lookup; uf= !uf; } in
          raise (Inconsistent (cc, t1, t2))
    end
  done;
  let cc = { cc with use= !use; lookup= !lookup; uf= !uf; } in
  cc

  (** Add the given term to the CC *)
  let rec add cc t =
    match t.CT.shape with
    | CT.Const _ -> cc   (* always trivially defined *)
    | CT.Apply (t1, t2) ->
      if BV.get cc.defined t.CT.tag
      then cc  (* already defined *)
      else begin
        (* note that [t] is defined *)
        let defined = BV.set_true cc.defined t.CT.tag in
        let cc = {cc with defined; } in
        (* recursive add. invariant: if a term is added, then its subterms
           also are (hence the base case of constants or already added terms). *)
        let cc = add cc t1 in
        let cc = add cc t2 in
        let cc = merge cc (EqnApply (t1, t2, t)) in
        cc
      end

  (** Normal form of a term w.r.t the congruence closure *)
  let rec normalize cc t = match t.CT.shape with
    | CT.Const _ -> Puf.find cc.uf t
    | CT.Apply (t1, t2) ->
      let t1' = normalize cc t1 in
      let t2' = normalize cc t2 in
      if is_const t1' && is_const t2'
        then
          try  (* is there a constant [a] s.t. [t1'@t2' = a]? *) 
            match T2Hashtbl.find cc.lookup (t1',t2') with
            | EqnSimple _ -> assert false
            | EqnApply (_, _, a) ->
              Puf.find cc.uf a (* t1' @ t2' = a *)
          with Not_found ->
            CT.mk_app t1' t2'  (* nope, just t1' @ t2' then *)
        else
          CT.mk_app t1' t2'

  (** Check whether the two terms are equal *)
  let eq cc t1 t2 =
    let t1' = normalize cc t1 in
    let t2' = normalize cc t2 in
    CT.eq t1' t2'

  (** Assert that the two terms are equal (may raise Inconsistent) *)
  let merge cc t1 t2 =
    let cc = add (add cc t1) t2 in
    merge cc (EqnSimple (t1, t2))

  (** Assert that the two given terms are distinct (may raise Inconsistent) *)
  let distinct cc t1 t2 =
    let cc = add (add cc t1) t2 in
    let t1' = normalize cc t1 in
    let t2' = normalize cc t2 in
    if CT.eq t1' t2'
      then raise (Inconsistent (cc, t1, t2))   (* they are equal, fail *)
      else
        (* remember that they should not become equal *)
        let uf = Puf.distinct cc.uf t1 t2 in
        { cc with uf; }

  type action =
    | Merge of CT.t * CT.t
    | Distinct of CT.t * CT.t
    (** Action that can be performed on the CC *)

  let do_action cc action = match action with
    | Merge (t1, t2) -> merge cc t1 t2
    | Distinct (t1, t2) -> distinct cc t1 t2

  (** Check whether the two terms can be equal *)
  let can_eq cc t1 t2 =
    not (Puf.must_be_distinct cc.uf t1 t2)

  (** Iterate on terms that are congruent to the given term *)
  let iter_equiv_class cc t f =
    Puf.iter_equiv_class cc.uf t f

  (** Explain why those two terms are equal (they must be) *)
  let explain cc t1 t2 =
    []  (* TODO *)
end

module StrTerm = Curryfy(struct
  type t = string
  let equal s1 s2 = s1 = s2
  let hash s = Hashtbl.hash s
end)

module StrCC = Make(StrTerm)

let lex str =
  let lexer = Genlex.make_lexer ["("; ")"] in
  lexer (Stream.of_string str)

let parse str =
  let stream = lex str in
  let rec parse_term () =
    match Stream.peek stream with
    | Some (Genlex.Kwd "(") ->
      Stream.junk stream;
      let t1 = parse_term () in
      let t2 = parse_term () in
      begin match Stream.peek stream with
      | Some (Genlex.Kwd ")") ->
        Stream.junk stream;
        StrTerm.mk_app t1 t2  (* end apply *)
      | _ -> raise (Stream.Error "expected )")
      end
    | Some (Genlex.Ident s) ->
      Stream.junk stream;
      StrTerm.mk_const s
    | _ -> raise (Stream.Error "expected term")
  in
  parse_term ()

let rec pp fmt t =
  match t.StrTerm.shape with
  | StrTerm.Const s ->
    Format.fprintf fmt "%s:%d" s t.StrTerm.tag
  | StrTerm.Apply (t1, t2) ->
    Format.fprintf fmt "(%a %a):%d" pp t1 pp t2 t.StrTerm.tag

