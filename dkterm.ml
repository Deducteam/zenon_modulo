open Printf
open Expr

type var = string

type dkterm =
  | Dktypetype                                  (* type type *)
  | Dktypeprop                                  (* type prop *)
  | Dktypeiota                                  (* type iota *)
  | Dkseq                                       (* type seq *)
  | Dkproof       of dkterm                     (* type proof of prop *)
(*  | Dkterm        of dkterm                *)     (* type term of app *)
  | Dkarrow       of dkterm list * dkterm       (* type arrow of type list *)
  | Dkpi          of dkterm * dkterm            (* type pi of var*arrow *)

  | Dkvar         of var  * dkterm              (* term var of string*type *)
  | Dklam         of dkterm * dkterm            (* term lam of var*prop *)
  | Dkapp         of var * dkterm * dkterm list (* term app of string*type*args *)

  | Dknot         of dkterm                    (* not of prop *)
  | Dkand         of dkterm * dkterm           (* and of 2 prop *)
  | Dkor          of dkterm * dkterm           (* or of 2 prop *)
  | Dkimply       of dkterm * dkterm           (* imply of 2 prop *)
  | Dkequiv       of dkterm * dkterm           (* equiv of 2 prop *)
  | Dkforall      of dkterm * dkterm           (* forall of type*lambda *)
  | Dkexists      of dkterm * dkterm           (* exists of type*lambda *)
  | Dkforalltype  of dkterm                    (* foralltype of lambda *)
  | Dkexiststype  of dkterm                    (* existstype of lambda *)
  | Dktrue                                     (* true *)
  | Dkfalse                                    (* false *)
  | Dkequal       of dkterm * dkterm * dkterm  (* equal type*term*term *)

  | DkRfalse        of dkterm
  | DkRnottrue      of dkterm
  | DkRaxiom        of dkterm * dkterm * dkterm
  | DkRnoteq        of dkterm * dkterm * dkterm
  | DkReqsym        of dkterm * dkterm * dkterm * dkterm * dkterm
  | DkRcut          of dkterm * dkterm * dkterm
  | DkRnotnot       of dkterm * dkterm * dkterm
  | DkRand          of dkterm * dkterm * dkterm * dkterm
  | DkRor           of dkterm * dkterm * dkterm * dkterm * dkterm
  | DkRimply        of dkterm * dkterm * dkterm * dkterm * dkterm
  | DkRequiv        of dkterm * dkterm * dkterm * dkterm * dkterm
  | DkRnotand       of dkterm * dkterm * dkterm * dkterm * dkterm
  | DkRnotor        of dkterm * dkterm * dkterm * dkterm
  | DkRnotimply     of dkterm * dkterm * dkterm * dkterm
  | DkRnotequiv     of dkterm * dkterm * dkterm * dkterm * dkterm
  | DkRex           of dkterm * dkterm * dkterm * dkterm
  | DkRall          of dkterm * dkterm * dkterm * dkterm * dkterm
  | DkRnotex        of dkterm * dkterm * dkterm * dkterm * dkterm
  | DkRnotall       of dkterm * dkterm * dkterm * dkterm
  | DkRextype       of dkterm * dkterm * dkterm
  | DkRalltype      of dkterm * dkterm * dkterm * dkterm
  | DkRnotextype    of dkterm * dkterm * dkterm * dkterm
  | DkRnotalltype   of dkterm * dkterm * dkterm
  | DkRsubst        of dkterm * dkterm * dkterm * dkterm * dkterm * dkterm * dkterm
  | DkRconglr       of dkterm * dkterm * dkterm * dkterm * dkterm * dkterm * dkterm
  | DkRcongrl       of dkterm * dkterm * dkterm * dkterm * dkterm * dkterm * dkterm
;;

type line =
  | Dkdecl of var * dkterm                     (* declaration of symbols *)
  | Dkrwrt of dkterm list * dkterm * dkterm    (* rewrite rules *)
;;

let get_dkvar_type var =
  match var with
  | Dkvar (_, t) -> t
  | _ -> assert false
;;

let tbl_var_newname = ref (Hashtbl.create 42);;

let newname () =
  let s = Expr.newname () in
  let res = "v"^(String.sub s 5 (String.length s - 5)) in
(*  Log.debug 4 " |- Var Newname : %s" res; *)
  res
;;

let get_var_newname var =
  try
    match var with
    | Dkvar (v, _) ->
       let nv = Hashtbl.find !tbl_var_newname var in
       nv
    | _ -> assert false
  with Not_found ->
    begin
      match var with
      | Dkvar (v, _) ->
	 let nv = newname () in
	 Hashtbl.add !tbl_var_newname var nv;
	 nv
      | _ -> assert false
    end
;;

let mk_typetype                = Dktypetype
let mk_typeprop                = Dktypeprop
let mk_typeiota                = Dktypeiota
let mk_seq                     = Dkseq
let mk_proof      (t)          = Dkproof t
(*let mk_term       (t)          = Dkterm t*)
let mk_arrow      (l, r)       = Dkarrow (l, r)
let mk_pi         (t1, t2)     = Dkpi (t1, t2)
let mk_var        (v, t)       = Dkvar (v, t)
let mk_lam        (t1, t2)     = Dklam (t1, t2)
let mk_app        (v, t, l)    = Dkapp (v, t, l)
let mk_not        (t)          = Dknot t
let mk_and        (t1, t2)     = Dkand (t1, t2)
let mk_or         (t1, t2)     = Dkor (t1, t2)
let mk_imply      (t1, t2)     = Dkimply (t1, t2)
let mk_equiv      (t1, t2)     = Dkequiv (t1, t2)
let mk_forall     (t1, t2)     = Dkforall (t1, t2)
let mk_exists     (t1, t2)     = Dkexists (t1, t2)
let mk_foralltype (t)          = Dkforalltype t
let mk_existstype (t)          = Dkexiststype t
let mk_true                    = Dktrue
let mk_false                   = Dkfalse
let mk_equal      (t1, t2, t3) = Dkequal (t1, t2, t3)

let mk_DkRfalse        (pr)                      = DkRfalse (pr)
let mk_DkRnottrue      (pr)                      = DkRnottrue (pr)
let mk_DkRaxiom        (p, pr1, pr2)             = DkRaxiom (p, pr1, pr2)
let mk_DkRnoteq        (a, t, pr)                = DkRnoteq (a, t, pr)
let mk_DkReqsym        (a, t, u, pr1, pr2)       = DkReqsym (a, t, u, pr1, pr2)
let mk_DkRcut          (p, pr1, pr2)             = DkRcut (p, pr1, pr2)
let mk_DkRnotnot       (p, pr1, pr2)             = DkRnotnot (p, pr1, pr2)
let mk_DkRand          (p, q, pr1, pr2)          = DkRand (p, q, pr1, pr2)
let mk_DkRor           (p, q, pr1, pr2, pr3)     = DkRor (p, q, pr1, pr2, pr3)
let mk_DkRimply        (p, q, pr1, pr2, pr3)     = DkRimply (p, q, pr1, pr2, pr3)
let mk_DkRequiv        (p, q, pr1, pr2, pr3)     = DkRequiv (p, q, pr1, pr2, pr3)
let mk_DkRnotand       (p, q, pr1, pr2, pr3)     = DkRnotand (p, q, pr1, pr2, pr3)
let mk_DkRnotor        (p, q, pr1, pr2)          = DkRnotor (p, q, pr1, pr2)
let mk_DkRnotimply     (p, q, pr1, pr2)          = DkRnotimply (p, q, pr1, pr2)
let mk_DkRnotequiv     (p, q, pr1, pr2, pr3)     = DkRnotequiv (p, q, pr1, pr2, pr3)
let mk_DkRex           (a, p, pr1, pr2)          = DkRex (a, p, pr1, pr2)
let mk_DkRall          (a, p, t, pr1, pr2)       = DkRall (a, p, t, pr1, pr2)
let mk_DkRnotex        (a, p, t, pr1, pr2)       = DkRnotex (a, p, t, pr1, pr2)
let mk_DkRnotall       (a, p, pr1, pr2)          = DkRnotall (a, p, pr1, pr2)
let mk_DkRextype       (p, pr1, pr2)             = DkRextype (p, pr1, pr2)
let mk_DkRalltype      (p, a, pr1, pr2)          = DkRalltype (p, a, pr1, pr2)
let mk_DkRnotextype    (p, a, pr1, pr2)          = DkRnotextype (p, a, pr1, pr2)
let mk_DkRnotalltype   (p, pr1, pr2)             = DkRnotalltype (p, pr1, pr2)
let mk_DkRsubst        (a, p, t1, t2, pr1, pr2, pr3)  = DkRsubst (a, p, t1, t2, pr1, pr2, pr3)
let mk_DkRconglr       (a, p, t1, t2, pr1, pr2, pr3)  = DkRconglr (a, p, t1, t2, pr1, pr2, pr3)
let mk_DkRcongrl       (a, p, t1, t2, pr1, pr2, pr3)  = DkRcongrl (a, p, t1, t2, pr1, pr2, pr3)

let mk_decl       (v, t)       = Dkdecl (v, t)
let mk_rwrt       (l, t1, t2)  = Dkrwrt (l, t1, t2)

let rec print_dk_type o t =
  match t with
  | Dktypetype -> fprintf o "zen.type"
  | Dktypeprop -> fprintf o "zen.prop"
  | Dkarrow (l, r) ->
     begin
       List.iter (fun x -> fprintf o "%a -> " print_dk_type x) l;
       print_dk_type o r;
     end
  | Dkpi (Dkvar (v, t1) as var, t2) ->
     fprintf o "%s : %a\n -> %a"
	     (get_var_newname var) print_dk_type t1 print_dk_type t2
  | Dkpi _ -> assert false
  | Dkproof (t) ->
     fprintf o "zen.proof (%a)" print_dk_term t
  | t -> fprintf o "zen.term (%a)" print_dk_zentype t

and print_dk_zentype o t =
  match t with
  | Dktypeiota -> fprintf o "zen.iota"
  | t -> print_dk_term o t

and print_dk_cst o t =
  match t with
  | "Is_true" -> fprintf o "dk_logic.ebP"
  | "FOCAL.ifthenelse" -> fprintf o "dk_bool.ite"
  | s -> fprintf o "%s" s

and print_dk_term o t =
  match t with
  | Dkvar (v, _) as var ->
     fprintf o "%s" (get_var_newname var)
  | Dklam (Dkvar (v, t1) as var, t2) ->
     fprintf o "%s : (%a)\n => %a"
	     (get_var_newname var)
	     print_dk_type t1 print_dk_term t2
  | Dklam (Dkapp (v, t1, []), t2) ->
     fprintf o "%s : (%a)\n => %a"
	     v print_dk_type t1 print_dk_term t2
  | Dklam _ -> assert false
  | Dkapp (v, _, l) ->
     begin
       print_dk_cst o v;
       List.iter (fun x -> fprintf o " (%a)" print_dk_term x) l;
(*       fprintf o "\n ";*)
     end
  | Dkseq -> fprintf o "zen.seq"
  | Dknot (t) ->
     fprintf o "zen.not\n (%a)" print_dk_term t
  | Dkand (t1, t2) ->
     fprintf o "zen.and\n (%a) (%a)" print_dk_term t1 print_dk_term t2
  | Dkor (t1, t2) ->
     fprintf o "zen.or\n (%a) (%a)" print_dk_term t1 print_dk_term t2
  | Dkimply (t1, t2) ->
     fprintf o "zen.imp\n (%a) (%a)" print_dk_term t1 print_dk_term t2
  | Dkequiv (t1, t2) ->
     fprintf o "zen.eqv\n (%a) (%a)" print_dk_term t1 print_dk_term t2
  | Dkforall (t1, t2) ->
     fprintf o "zen.forall (%a)\n (%a)" print_dk_term t1 print_dk_term t2
  | Dkexists (t1, t2) ->
     fprintf o "zen.exists (%a)\n (%a)" print_dk_term t1 print_dk_term t2
  | Dkforalltype (t) ->
     fprintf o "zen.foralltype\n (%a)" print_dk_term t
  | Dkexiststype (t) ->
     fprintf o "zen.existstype\n (%a)" print_dk_term t
  | Dktrue -> fprintf o "zen.True"
  | Dkfalse -> fprintf o "zen.False"
  | Dkequal (t1, t2, t3) ->
     fprintf o "zen.equal (%a)\n (%a)\n (%a)"
	     print_dk_term t1
	     print_dk_term t2
	     print_dk_term t3
  | DkRfalse (pr) -> fprintf o "zen.Rfalse\n (%a)" print_dk_term pr
  | DkRnottrue (pr) -> fprintf o "zen.Rnottrue\n (%a)" print_dk_term pr
  | DkRaxiom (p, pr1, pr2) ->
     fprintf o "zen.Raxiom\n (%a)\n (%a)\n (%a)\n"
	     print_dk_term p
	     print_dk_term pr1
	     print_dk_term pr2
  | DkRnoteq (a, t, pr) ->
     fprintf o "zen.Rnoteq\n (%a)\n (%a)\n (%a)\n"
	     print_dk_term a
	     print_dk_term t
	     print_dk_term pr
  | DkReqsym (a, t, u, pr1, pr2) ->
     fprintf o "zen.Reqsym\n (%a)\n (%a)\n (%a)\n (%a)\n (%a)\n"
	     print_dk_term a
	     print_dk_term t
	     print_dk_term u
	     print_dk_term pr1
	     print_dk_term pr2
  | DkRcut (p, pr1, pr2) ->
     fprintf o "zen.Rcut\n (%a)\n (%a)\n (%a)\n"
	     print_dk_term p
	     print_dk_term pr1
	     print_dk_term pr2
  | DkRnotnot (p, pr1, pr2) ->
     fprintf o "zen.Rnotnot\n (%a)\n (%a)\n (%a)\n"
	     print_dk_term p
	     print_dk_term pr1
	     print_dk_term pr2
  | DkRand (p, q, pr1, pr2) ->
     fprintf o "zen.Rand\n (%a)\n (%a)\n (%a)\n (%a)\n"
	     print_dk_term p
	     print_dk_term q
	     print_dk_term pr1
	     print_dk_term pr2
  | DkRor (p, q, pr1, pr2, pr3) ->
     fprintf o "zen.Ror\n (%a)\n (%a)\n (%a)\n (%a)\n (%a)\n"
	     print_dk_term p
	     print_dk_term q
	     print_dk_term pr1
	     print_dk_term pr2
	     print_dk_term pr3
  | DkRimply (p, q, pr1, pr2, pr3) ->
     fprintf o "zen.Rimply\n (%a)\n (%a)\n (%a)\n (%a)\n (%a)\n"
	     print_dk_term p
	     print_dk_term q
	     print_dk_term pr1
	     print_dk_term pr2
	     print_dk_term pr3
  | DkRequiv (p, q, pr1, pr2, pr3) ->
     fprintf o "zen.Requiv\n (%a)\n (%a)\n (%a)\n (%a)\n (%a)\n"
	     print_dk_term p
	     print_dk_term q
	     print_dk_term pr1
	     print_dk_term pr2
	     print_dk_term pr3
  | DkRnotand (p, q, pr1, pr2, pr3) ->
     fprintf o "zen.Rnotand\n (%a)\n (%a)\n (%a)\n (%a)\n (%a)\n"
	     print_dk_term p
	     print_dk_term q
	     print_dk_term pr1
	     print_dk_term pr2
	     print_dk_term pr3
  | DkRnotor (p, q, pr1, pr2) ->
     fprintf o "zen.Rnotor\n (%a)\n (%a)\n (%a)\n (%a)\n"
	     print_dk_term p
	     print_dk_term q
	     print_dk_term pr1
	     print_dk_term pr2
  | DkRnotimply (p, q, pr1, pr2) ->
     fprintf o "zen.Rnotimply\n (%a)\n (%a)\n (%a)\n (%a)\n"
	     print_dk_term p
	     print_dk_term q
	     print_dk_term pr1
	     print_dk_term pr2
  | DkRnotequiv (p, q, pr1, pr2, pr3) ->
     fprintf o "zen.Rnotequiv\n (%a)\n (%a)\n (%a)\n (%a)\n (%a)\n"
	     print_dk_term p
	     print_dk_term q
	     print_dk_term pr1
	     print_dk_term pr2
	     print_dk_term pr3
  | DkRex (a, p, pr1, pr2) ->
     fprintf o "zen.Rex\n (%a)\n (%a)\n (%a)\n (%a)\n"
	     print_dk_term a
	     print_dk_term p
	     print_dk_term pr1
	     print_dk_term pr2
  | DkRall (a, p, t, pr1, pr2) ->
     fprintf o "zen.Rall\n (%a)\n (%a)\n (%a)\n (%a)\n (%a)\n"
	     print_dk_term a
	     print_dk_term p
	     print_dk_term t
	     print_dk_term pr1
	     print_dk_term pr2
  | DkRnotex (a, p, t, pr1, pr2) ->
     fprintf o "zen.Rnotex\n (%a)\n (%a)\n (%a)\n (%a)\n (%a)\n"
	     print_dk_term a
	     print_dk_term p
	     print_dk_term t
	     print_dk_term pr1
	     print_dk_term pr2
  | DkRnotall (a, p, pr1, pr2) ->
     fprintf o "zen.Rnotall\n (%a)\n (%a)\n (%a)\n (%a)\n"
	     print_dk_term a
	     print_dk_term p
	     print_dk_term pr1
	     print_dk_term pr2
  | DkRextype (p, pr1, pr2) ->
     fprintf o "zen.Rextype\n (%a)\n (%a)\n (%a)\n"
	     print_dk_term p
	     print_dk_term pr1
	     print_dk_term pr2
  | DkRalltype (p, a, pr1, pr2) ->
     fprintf o "zen.Ralltype\n (%a)\n (%a)\n (%a)\n (%a)\n"
	     print_dk_term p
	     print_dk_term a
	     print_dk_term pr1
	     print_dk_term pr2
  | DkRnotextype (p, a, pr1, pr2) ->
     fprintf o "zen.Rnotextype\n (%a)\n (%a)\n (%a)\n (%a)\n"
	     print_dk_term p
	     print_dk_term a
	     print_dk_term pr1
	     print_dk_term pr2
  | DkRnotalltype (p, pr1, pr2) ->
     fprintf o "zen.Rnotalltype\n (%a)\n (%a)\n (%a)\n"
	     print_dk_term p
	     print_dk_term pr1
	     print_dk_term pr2
  | DkRsubst  (a, p, t1, t2, pr1, pr2, pr3) ->
     fprintf o "zen.Rsubst\n (%a)\n (%a)\n (%a)\n (%a)\n (%a)\n (%a)\n (%a)\n"
	     print_dk_term a
	     print_dk_term p
	     print_dk_term t1
	     print_dk_term t2
	     print_dk_term pr1
	     print_dk_term pr2
	     print_dk_term pr3
  | DkRconglr (a, p, t1, t2, pr1, pr2, pr3) ->
     fprintf o "zen.Rconglr\n (%a)\n (%a)\n (%a)\n (%a)\n (%a)\n (%a)\n (%a)\n"
	     print_dk_term a
	     print_dk_term p
	     print_dk_term t1
	     print_dk_term t2
	     print_dk_term pr1
	     print_dk_term pr2
	     print_dk_term pr3
  | DkRcongrl (a, p, t1, t2, pr1, pr2, pr3) ->
     fprintf o "zen.Rcongrl\n (%a)\n (%a)\n (%a)\n (%a)\n (%a)\n (%a)\n (%a)\n"
	     print_dk_term a
	     print_dk_term p
	     print_dk_term t1
	     print_dk_term t2
	     print_dk_term pr1
	     print_dk_term pr2
	     print_dk_term pr3
  | _ -> assert false
;;

(*
let rec print_dk o t =
  match t with
  | Dktypetype -> fprintf o "zen.type"
  | Dktypeprop -> fprintf o "zen.prop"
  | Dktypeiota -> fprintf o "zen.iota"
  | Dkseq  -> fprintf o "zen.seq"
  | Dkproof (t) ->  fprintf o "zen.proof (%a)" print_dk t
  | Dkterm (t) -> fprintf o "zen.term (%a)" print_dk t
  | Dkarrow (l) -> print_dk_list_arrow o l
  | Dkpi (Dkvar (v, t1) as var, t2) ->
     fprintf o "%s : %a\n -> %a" (get_var_newname var) print_dk t1 print_dk t2
  | Dkpi _ -> assert false
  | Dkvar ("false", _) -> fprintf o "basics.false"
  | Dkvar ("true", _) -> fprintf o "basics.true"
  | Dkvar ("Is_true", _) -> fprintf o "dk_logic.ebP"
  | Dkvar (v, _) as var -> fprintf o "%s" (get_var_newname var)
  | Dklam (Dkvar (v, t1) as var, t2) ->
     fprintf o "%s : (%a)\n => %a" (get_var_newname var) print_dk t1 print_dk t2
  | Dklam (Dkapp (v, _, l), _) ->
     begin
       Log.debug 4 " crash %s : %i" v (List.length l);
       assert false
     end
  | Dklam _ -> assert false
  | Dkapp (v, _, l) ->
     fprintf o "%s %a" v print_dk_list_app l
  | Dknot (t) ->
     fprintf o "zen.not\n (%a)" print_dk t
  | Dkand (t1, t2) ->
     fprintf o "zen.and\n (%a) (%a)" print_dk t1 print_dk t2
  | Dkor (t1, t2) ->
     fprintf o "zen.or\n (%a) (%a)" print_dk t1 print_dk t2
  | Dkimply (t1, t2) ->
     fprintf o "zen.imp\n (%a) (%a)" print_dk t1 print_dk t2
  | Dkequiv (t1, t2) ->
     fprintf o "zen.eqv\n (%a) (%a)" print_dk t1 print_dk t2
  | Dkforall (t1, t2) ->
     fprintf o "zen.forall (%a)\n (%a)" print_dk t1 print_dk t2
  | Dkexists (t1, t2) ->
     fprintf o "zen.exists (%a)\n (%a)" print_dk t1 print_dk t2
  | Dkforalltype (t) ->
     fprintf o "zen.foralltype\n (%a)" print_dk t
  | Dkexiststype (t) ->
     fprintf o "zen.existstype\n (%a)" print_dk t
  | Dktrue -> fprintf o "zen.True"
  | Dkfalse -> fprintf o "zen.False"
  | Dkequal (t1, t2, t3) ->
     fprintf o "zen.equal (%a)\n (%a)\n (%a)"
	     print_dk t1
	     print_dk t2
	     print_dk t3
  | DkRfalse (pr) -> fprintf o "zen.Rfalse\n (%a)" print_dk pr
  | DkRnottrue (pr) -> fprintf o "zen.Rnottrue\n (%a)" print_dk pr
  | DkRaxiom (p, pr1, pr2) ->
     fprintf o "zen.Raxiom\n (%a)\n (%a)\n (%a)\n"
	     print_dk p
	     print_dk pr1
	     print_dk pr2
  | DkRnoteq (a, t, pr) ->
     fprintf o "zen.Rnoteq\n (%a)\n (%a)\n (%a)\n"
	     print_dk a
	     print_dk t
	     print_dk pr
  | DkReqsym (a, t, u, pr1, pr2) ->
     fprintf o "zen.Reqsym\n (%a)\n (%a)\n (%a)\n (%a)\n (%a)\n"
	     print_dk a
	     print_dk t
	     print_dk u
	     print_dk pr1
	     print_dk pr2
  | DkRcut (p, pr1, pr2) ->
     fprintf o "zen.Rcut\n (%a)\n (%a)\n (%a)\n"
	     print_dk p
	     print_dk pr1
	     print_dk pr2
  | DkRnotnot (p, pr1, pr2) ->
     fprintf o "zen.Rnotnot\n (%a)\n (%a)\n (%a)\n"
	     print_dk p
	     print_dk pr1
	     print_dk pr2
  | DkRand (p, q, pr1, pr2) ->
     fprintf o "zen.Rand\n (%a)\n (%a)\n (%a)\n (%a)\n"
	     print_dk p
	     print_dk q
	     print_dk pr1
	     print_dk pr2
  | DkRor (p, q, pr1, pr2, pr3) ->
     fprintf o "zen.Ror\n (%a)\n (%a)\n (%a)\n (%a)\n (%a)\n"
	     print_dk p
	     print_dk q
	     print_dk pr1
	     print_dk pr2
	     print_dk pr3
  | DkRimply (p, q, pr1, pr2, pr3) ->
     fprintf o "zen.Rimply\n (%a)\n (%a)\n (%a)\n (%a)\n (%a)\n"
	     print_dk p
	     print_dk q
	     print_dk pr1
	     print_dk pr2
	     print_dk pr3
  | DkRequiv (p, q, pr1, pr2, pr3) ->
     fprintf o "zen.Requiv\n (%a)\n (%a)\n (%a)\n (%a)\n (%a)\n"
	     print_dk p
	     print_dk q
	     print_dk pr1
	     print_dk pr2
	     print_dk pr3
  | DkRnotand (p, q, pr1, pr2, pr3) ->
     fprintf o "zen.Rnotand\n (%a)\n (%a)\n (%a)\n (%a)\n (%a)\n"
	     print_dk p
	     print_dk q
	     print_dk pr1
	     print_dk pr2
	     print_dk pr3
  | DkRnotor (p, q, pr1, pr2) ->
     fprintf o "zen.Rnotor\n (%a)\n (%a)\n (%a)\n (%a)\n"
	     print_dk p
	     print_dk q
	     print_dk pr1
	     print_dk pr2
  | DkRnotimply (p, q, pr1, pr2) ->
     fprintf o "zen.Rnotimply\n (%a)\n (%a)\n (%a)\n (%a)\n"
	     print_dk p
	     print_dk q
	     print_dk pr1
	     print_dk pr2
  | DkRnotequiv (p, q, pr1, pr2, pr3) ->
     fprintf o "zen.Rnotequiv\n (%a)\n (%a)\n (%a)\n (%a)\n (%a)\n"
	     print_dk p
	     print_dk q
	     print_dk pr1
	     print_dk pr2
	     print_dk pr3
  | DkRex (a, p, pr1, pr2) ->
     fprintf o "zen.Rex\n (%a)\n (%a)\n (%a)\n (%a)\n"
	     print_dk a
	     print_dk p
	     print_dk pr1
	     print_dk pr2
  | DkRall (a, p, t, pr1, pr2) ->
     fprintf o "zen.Rall\n (%a)\n (%a)\n (%a)\n (%a)\n (%a)\n"
	     print_dk a
	     print_dk p
	     print_dk t
	     print_dk pr1
	     print_dk pr2
  | DkRnotex (a, p, t, pr1, pr2) ->
     fprintf o "zen.Rnotex\n (%a)\n (%a)\n (%a)\n (%a)\n (%a)\n"
	     print_dk a
	     print_dk p
	     print_dk t
	     print_dk pr1
	     print_dk pr2
  | DkRnotall (a, p, pr1, pr2) ->
     fprintf o "zen.Rnotall\n (%a)\n (%a)\n (%a)\n (%a)\n"
	     print_dk a
	     print_dk p
	     print_dk pr1
	     print_dk pr2
  | DkRextype (p, pr1, pr2) ->
     fprintf o "zen.Rextype\n (%a)\n (%a)\n (%a)\n"
	     print_dk p
	     print_dk pr1
	     print_dk pr2
  | DkRalltype (p, a, pr1, pr2) ->
     fprintf o "zen.Ralltype\n (%a)\n (%a)\n (%a)\n (%a)\n"
	     print_dk p
	     print_dk a
	     print_dk pr1
	     print_dk pr2
  | DkRnotextype (p, a, pr1, pr2) ->
     fprintf o "zen.Rnotextype\n (%a)\n (%a)\n (%a)\n (%a)\n"
	     print_dk p
	     print_dk a
	     print_dk pr1
	     print_dk pr2
  | DkRnotalltype (p, pr1, pr2) ->
     fprintf o "zen.Rnotalltype\n (%a)\n (%a)\n (%a)\n"
	     print_dk p
	     print_dk pr1
	     print_dk pr2
  | DkRsubst  (a, p, t1, t2, pr1, pr2, pr3) ->
     fprintf o "zen.Rsubst\n (%a)\n (%a)\n (%a)\n (%a)\n (%a)\n (%a)\n (%a)\n"
	     print_dk a
	     print_dk p
	     print_dk t1
	     print_dk t2
	     print_dk pr1
	     print_dk pr2
	     print_dk pr3
  | DkRconglr (a, p, t1, t2, pr1, pr2, pr3) ->
     fprintf o "zen.Rconglr\n (%a)\n (%a)\n (%a)\n (%a)\n (%a)\n (%a)\n (%a)\n"
	     print_dk a
	     print_dk p
	     print_dk t1
	     print_dk t2
	     print_dk pr1
	     print_dk pr2
	     print_dk pr3
  | DkRcongrl (a, p, t1, t2, pr1, pr2, pr3) ->
     fprintf o "zen.Rcongrl\n (%a)\n (%a)\n (%a)\n (%a)\n (%a)\n (%a)\n (%a)\n"
	     print_dk a
	     print_dk p
	     print_dk t1
	     print_dk t2
	     print_dk pr1
	     print_dk pr2
	     print_dk pr3

and print_dk_list_arrow o t =
  match t with
  | [] -> ()
  | [h] -> fprintf o "%a" print_dk h
  | h :: tl -> fprintf o "%a -> %a" print_dk h print_dk_list_arrow tl

and print_dk_list_app o t =
  match t with
  | [] -> ()
  | [h] -> fprintf o "(%a)" print_dk h
  | h :: tl -> fprintf o "(%a)\n %a" print_dk h print_dk_list_app tl
;;
 *)

let rec pr_list_var o l =
  match l with
  | [] -> ()
  | [Dkvar (v, t) as var] ->
     fprintf o "%s : %a" (get_var_newname var) print_dk_type t
  | (Dkvar (v, t) as var) :: tl ->
     fprintf o "%s : %a, %a"
	     (get_var_newname var)
	     print_dk_type t
	     pr_list_var tl
  | _ -> assert false
;;

let print_line o line =
  match line with
  | Dkdecl (v, _) when String.contains v '.' ->
     ()
  | Dkdecl (v, t) ->
     fprintf o "def %s : %a.\n\n" v print_dk_type t
  | Dkrwrt (_, Dkapp (s, _, _), _) when String.contains s '.' || s = "Is_true" ->
     ()
  | Dkrwrt (l, t1, t2) ->
     fprintf o "[%a]\n %a \n --> %a.\n\n"
	     pr_list_var l print_dk_term t1 print_dk_term t2
;;

let print_goal_type o name goal =
  fprintf o "def %s :\n %a\n -> %a.\n"
	  name print_dk_type goal print_dk_term mk_seq
;;

let print_proof o name proof =
  fprintf o "[] %s -->\n %a.\n"
	  name print_dk_term proof
;;

(* to manage dependances of symbols definitions *)



type declaration =
  | Some of line       (* line is a Dkdecl here *)
  | None
;;

type vertex = {
  mutable decl : declaration;
  mutable edge : var list;
}

type graph = (var, vertex) Hashtbl.t
;;

let create i = Hashtbl.create i
;;

let rec get_var_list_aux env accu ty =
  match ty with
  | Dktypetype
  | Dktypeprop
  | Dktypeiota
  | Dkseq -> accu
(*  | Dkterm (t) -> get_var_list_aux env accu t *)
  | Dkarrow (l, r) ->
     List.fold_left (get_var_list_aux env) accu (List.append l [r])
  | Dkpi (Dkvar(v, _), t) -> get_var_list_aux (v :: env) accu t
  | Dkvar (v, _) ->
     if List.mem v env then accu
     else v :: accu
  | Dkapp (v, _, l) ->
     if List.mem v env
     then List.fold_left (get_var_list_aux env) accu l
     else List.fold_left (get_var_list_aux env) (v :: accu) l
  | _ -> assert false
;;

let get_var_list ty =
  get_var_list_aux [] [] ty
;;

let mk_vertex d =
  match d with
  | Dkdecl (v, ty) ->
     let var_list = get_var_list ty in
     {decl = Some d;
      edge = var_list;}
  | _ -> assert false
;;

let mk_vertex_none =
  {decl = None; edge = [];}
;;

let add_none_dep gr v =
  try
    match (Hashtbl.find gr v) with
    | _ -> ()
  with Not_found ->
    Hashtbl.add gr v mk_vertex_none
;;

let add_sym_graph gr d =
  match d with
  | Dkdecl (v, ty) ->
     begin
       Log.debug 13 " |- Add Sym Graph %s" v;
       try
	 match Hashtbl.find gr v with
	 | {decl = Some _; edge = _;} -> assert false
	 | {decl = None; edge = _;} ->
	    Hashtbl.replace gr v (mk_vertex d)
       with Not_found ->
	 let ver = mk_vertex d in
	 Hashtbl.add gr v ver;
	 List.iter (add_none_dep gr) ver.edge;
     end
  | _ -> assert false
;;

let rm_sym_graph gr v =
  Hashtbl.replace gr v mk_vertex_none
;;

let get_vertex_name v =
  match v with
  | {decl = Some Dkdecl(v, _); edge = _;} -> v
  | _ -> assert false
;;

let select_no_incoming gr =
  let f x y z =
    let is_some a =
      match a with
      | {decl = Some _; edge = _;} -> true
      | _ -> false
    in
    let find_sym t =
      try
	match Hashtbl.find gr t with
	| {decl = Some _; edge = _;} -> true
	| _ -> false
      with Not_found -> false
    in
    if (is_some y) &&
	 not (List.exists find_sym y.edge)
    then (y :: z)
    else z
  in
  Hashtbl.fold f gr []
;;

let test_graph gr =
  let f x y =
    match y with
    | {decl = Some _; edge = _;} -> ()
    | {decl = None; edge = _;} -> assert false
  in
  Hashtbl.iter f gr
;;

let topo_sort gr =
(*  test_graph gr; *)
  let rec f accu gr =
    match select_no_incoming gr with
    | [] -> accu
    | h :: tl ->
       let name = get_vertex_name h in
       rm_sym_graph gr name;
       let dec = match h.decl with
	 | Some d -> d | None -> assert false
       in
       f (dec :: accu) gr
  in
  let res = f [] gr in
  List.rev res
;;
