/*  Copyright 2005 INRIA  */

%{
Version.add "$Id: parsetptp.mly,v 1.9 2012-04-24 17:32:04 doligez Exp $";;

open Expr;;

let ns pre s = (if !Globals.namespace_flag then pre else "") ^ s;;
(* Renaming is now done during typechecking *)
let ns_hyp s = ns "" s;; (* "H_" *)
let ns_var s = ns "" s;; (* "v_" *)
let ns_fun s = ns "" s;; (* "f_" *)

let rec mk_quant q vs body =
  match vs with
  | [] -> body
  | h::t ->
          let body = mk_quant q t body in
          Log.debug 10 "Quantifying over %a" Print.pp_expr h;
          q (h, body)
;;

let cnf_to_formula l =
  let l1 = List.flatten (List.map Expr.get_fv l) in
  let vs = Misc.list_sort_unique String.compare l1 in
  let body =
    match l with
    | [] -> assert false
    | a::l2 -> List.fold_left (fun x y -> eor (y,x)) a l2
  in
  mk_quant eall (List.map (fun x -> (tvar x type_iota)) vs) body
;;

%}

%token EQUIV
%token IMPLY
%token RIMPLY
%token AND
%token ITE_F
%token OR
%token NOT
%token PROP
%token TRUE
%token FALSE
%token TTYPE
%token ALL
%token EX
%token OPEN
%token CLOSE
%token EOF
%token INCLUDE
%token DOT
%token INPUT_CLAUSE
%token INPUT_FORMULA
%token INPUT_TFF_FORMULA
%token RANGL
%token LBRACKET
%token RBRACKET
%token STAR
%token <string> LIDENT
%token <string> UIDENT
%token <string> STRING
%token <string> INT
%token <string> RAT
%token <string> REAL
%token POSITIVE
%token NEGATIVE
%token COMMA
%token EQSYM
%token NEQSYM
%token COLON
%token XOR
%token NOR
%token NAND
%token <string> ANNOT

%nonassoc OPEN
%nonassoc ALL EXISTS
%nonassoc EQSYM NEQSYM
%left XOR NOR NAND AND OR
%right IMPLY
%left RIMPLY
%nonassoc EQUIV
%nonassoc lowest

%start file
%type <Phrase.tpphrase list> file

%%

/* TPTP (v5.3.0) syntax */

file:
  | EOF             { [] }
  | phrase file     { $1 :: $2 }
;
phrase:
  | INCLUDE OPEN LIDENT CLOSE DOT  { Phrase.Include ($3, None) }
  | INCLUDE OPEN LIDENT COMMA LBRACKET name_list RBRACKET CLOSE DOT
                                   { Phrase.Include ($3, Some ($6)) }
  | INPUT_FORMULA OPEN LIDENT COMMA LIDENT COMMA formula extra CLOSE DOT
                                   { Phrase.Formula (ns_hyp $3, $5, $7, None) }
  | INPUT_CLAUSE OPEN LIDENT COMMA LIDENT COMMA cnf_formula extra CLOSE DOT
     { Phrase.Formula (ns_hyp $3, $5, cnf_to_formula $7, None) }
  | INPUT_TFF_FORMULA OPEN LIDENT COMMA LIDENT COMMA formula COMMA LIDENT extra CLOSE DOT
     { Phrase.Formula (ns_hyp $3, "tff_" ^ $5, $7, Some $9) }
  | INPUT_TFF_FORMULA OPEN LIDENT COMMA LIDENT COMMA formula extra CLOSE DOT
     { Phrase.Formula (ns_hyp $3, "tff_" ^ $5, $7, None) }
  | INPUT_TFF_FORMULA OPEN LIDENT COMMA LIDENT COMMA type_def extra CLOSE DOT
     { Phrase.Formula (ns_hyp $3, "tff_" ^ $5, $7, None) }
  | INPUT_TFF_FORMULA OPEN INT COMMA LIDENT COMMA formula extra CLOSE DOT
     { Phrase.Formula (ns_hyp $3, "tff_" ^ $5, $7, None) }
  | INPUT_TFF_FORMULA OPEN INT COMMA LIDENT COMMA type_def extra CLOSE DOT
     { Phrase.Formula (ns_hyp $3, "tff_" ^ $5, $7, None) }
  | ANNOT                          { Phrase.Annotation $1 }
;
extra:
  | {}
  | COMMA extra_expr extra {}
;
extra_expr:
  | expr {}
  | LBRACKET extra_expr extra RBRACKET {}
  | LIDENT OPEN LIDENT extra CLOSE {}
;
expr:
  | UIDENT                             { tvar_none (ns_var $1) }
  | LIDENT arguments                   { eapp (tvar_none @@ ns_fun $1, $2) }
  | PROP                               { type_prop }
  | TTYPE                              { type_type }
  | STRING                             { eapp (tvar_none "$string", [tvar_none $1]) }
  | INT                                { Arith.mk_int $1 }
  | RAT                                { Arith.mk_rat $1 }
  | REAL                               { Arith.mk_real $1 }
  | expr EQSYM expr                    { eeq $1 $3 }
  | expr NEQSYM expr                   { enot (eeq $1 $3) }
  | OPEN expr CLOSE                    { $2 }
;
arguments:
  | OPEN expr_list CLOSE         { $2 }
  | /* empty */                  { [] }
;
expr_list:
  | expr COMMA expr_list         { $1 :: $3 }
  | expr                         { [$1] }
;
formula:
  | unit_formula %prec lowest          { $1 }
  | unit_formula AND formula           { eand ($1, $3) }
  | unit_formula OR formula            { eor ($1, $3) }
  | unit_formula IMPLY formula         { eimply ($1, $3) }
  | unit_formula EQUIV formula         { eequiv ($1, $3) }
  | unit_formula RIMPLY formula        { eimply ($3, $1) }
  | unit_formula XOR formula           { enot (eequiv ($1, $3)) }
  | unit_formula NOR formula           { enot (eor ($1, $3)) }
  | unit_formula NAND formula          { enot (eand ($1, $3)) }
;

type_def:
    | OPEN type_def CLOSE        { $2 }
    | LIDENT COLON tff_type_sig  { eapp (tvar_none "#", [tvar_none $1; $3]) }
;
unit_formula:
  | ALL LBRACKET var_list RBRACKET COLON unit_formula
                                   { mk_quant eall $3 $6 }
  | EX LBRACKET var_list RBRACKET COLON unit_formula
                                   { mk_quant eex $3 $6 }
  | NOT unit_formula               { enot ($2) }
  | OPEN formula CLOSE             { $2 }
  | ITE_F OPEN formula COMMA formula COMMA formula CLOSE { let a,b,c = $3,$5,$7 in eor(eand(enot a, b), eand(a,c)) }
  | atom                           { $1 }
;
var_list:
  | UIDENT COMMA var_list             { (tvar (ns_var $1) type_iota) :: $3 }
  | UIDENT COLON expr COMMA var_list  { (tvar (ns_var $1) $3) :: $5 }
  | UIDENT                            { [tvar (ns_var $1) type_iota] }
  | UIDENT COLON expr                 { [tvar (ns_var $1) $3] }
;
tff_type_arrow:
  | tff_unitary_type RANGL expr       { earrow $1 $3 }
;
tff_unitary_type:
  | expr { [ $1 ] }
  | OPEN tff_tuple CLOSE { $2 }
tff_tuple:
  | tff_unitary_type STAR expr   { $1 @ [$3] }
  | tff_tuple STAR expr   {  $1 @ [ $3 ] }
;
tff_type_sig:
  | expr
     { $1 }
  | tff_type_arrow
     { $1 }
  | ALL RANGL LBRACKET tff_quant RBRACKET COLON expr
     { mk_quant eall $4 $7 }
  | ALL RANGL LBRACKET tff_quant RBRACKET COLON OPEN tff_type_arrow CLOSE
     { mk_quant eall $4 $8 }
  | OPEN tff_type_sig CLOSE { $2 }
;
tff_quant:
  | UIDENT COLON TTYPE COMMA tff_quant  { (tvar (ns_var $1) type_type) :: $5 }
  | UIDENT COLON TTYPE                  { [tvar (ns_var $1) type_type] }
;
name_list:
  | LIDENT COMMA name_list         { $1 :: $3 }
  | LIDENT                         { [$1] }
;

cnf_formula:
  | OPEN disjunction CLOSE         { $2 }
  | disjunction                    { $1 }
;
disjunction:
  | literal                           { [$1] }
  | disjunction OR literal            { $3 :: $1 }
;
literal:
  | atom { $1 }
  | NOT atom { enot ($2) }
;
atom:
  | TRUE                           { etrue }
  | FALSE                          { efalse }
  | expr                           { $1 }
;
%%
