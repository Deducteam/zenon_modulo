%{
Version.add "$Id: parsetstp.mly,v 1.9 2012-04-24 17:32:04 doligez Exp $";;

open Printf;;
open Expr;;
open Phrase;;

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
    | a::l2 -> List.fold_left (fun x y -> eor (x,y)) a l2
  in
  mk_quant eall (List.map (fun x -> (tvar x type_iota)) vs) body
;;

%}

%token EQUIV
%token IMPLY
%token RIMPLY
%token AND
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
%token INFERENCE
%token FILE
%token STATUS
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

/* TSTP syntax */

file:
  | EOF             { [] }
  | phrase file     { $1 :: $2 }
;
phrase:
  | INCLUDE OPEN LIDENT CLOSE DOT  { Phrase.Include ($3, None) }
  | INCLUDE OPEN LIDENT COMMA LBRACKET name_list RBRACKET CLOSE DOT
                                   { Phrase.Include ($3, Some ($6)) }
  | INPUT_FORMULA OPEN LIDENT COMMA LIDENT COMMA formula optionnal CLOSE DOT
                                   { Phrase.Formula_annot  ($3, $5, $7, $8) }
  | INPUT_CLAUSE OPEN LIDENT COMMA LIDENT COMMA cnf_formula optionnal CLOSE DOT
      { Phrase.Formula_annot ($3, $5, cnf_to_formula $7, $8) }
  | INPUT_TFF_FORMULA OPEN LIDENT COMMA LIDENT COMMA formula COMMA LIDENT CLOSE DOT
     { Phrase.Formula (ns_hyp $3, "tff_" ^ $5, $7, Some $9) }
  | INPUT_TFF_FORMULA OPEN LIDENT COMMA LIDENT COMMA formula CLOSE DOT
     { Phrase.Formula (ns_hyp $3, "tff_" ^ $5, $7, None) }
  | INPUT_TFF_FORMULA OPEN LIDENT COMMA LIDENT COMMA type_def CLOSE DOT
     { Phrase.Formula (ns_hyp $3, "tff_" ^ $5, $7, None) }
  | INPUT_TFF_FORMULA OPEN INT COMMA LIDENT COMMA formula CLOSE DOT
     { Phrase.Formula (ns_hyp $3, "tff_" ^ $5, $7, None) }
  | INPUT_TFF_FORMULA OPEN INT COMMA LIDENT COMMA type_def CLOSE DOT
     { Phrase.Formula (ns_hyp $3, "tff_" ^ $5, $7, None) }
  | ANNOT                          { Phrase.Annotation $1 }
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
  | atom %prec lowest          { $1 }
  | atom AND formula           { eand ($1, $3) }
  | atom OR formula            { eor ($1, $3) }
  | atom IMPLY formula         { eimply ($1, $3) }
  | atom EQUIV formula         { eequiv ($1, $3) }
  | atom RIMPLY formula        { eimply ($3, $1) }
  | atom XOR formula           { enot (eequiv ($1, $3)) }
  | atom NOR formula           { enot (eor ($1, $3)) }
  | atom NAND formula          { enot (eand ($1, $3)) }
;
type_def:
    | OPEN type_def CLOSE        { $2 }
    | LIDENT COLON tff_type_sig  { eapp (tvar_none "#", [tvar_none $1; $3]) }
;
atom:
  | ALL LBRACKET var_list RBRACKET COLON atom
                                   { mk_quant eall $3 $6 }
  | EX LBRACKET var_list RBRACKET COLON atom
                                   { mk_quant eex $3 $6 }
  | NOT atom                       { enot ($2) }
  | OPEN formula CLOSE             { $2 }
  | TRUE                           { etrue }
  | FALSE                          { efalse }
  | expr                           { $1 }
;
var_list:
  | UIDENT COMMA var_list             { (tvar (ns_var $1) type_iota) :: $3 }
  | UIDENT COLON expr COMMA var_list  { (tvar (ns_var $1) $3) :: $5 }
  | UIDENT                            { [tvar (ns_var $1) type_iota] }
  | UIDENT COLON expr                 { [tvar (ns_var $1) $3] }
;
tff_type_arrow:
  | expr RANGL expr                   { earrow [$1] $3 }
  | OPEN tff_tuple CLOSE RANGL expr   { earrow $2 $5 }
;
tff_tuple:
  | expr                  { [$1] }
  | expr STAR tff_tuple   {  $1 :: $3 }
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
  | atom                           { [$1] }
  | disjunction OR atom            { $3 :: $1 }
;

optionnal:
  | /* mot vide */  { None }
  | COMMA FILE OPEN LIDENT COMMA LIDENT CLOSE
      { Some (Phrase.File  ($4, $6)) }
  | COMMA infer { Some ($2) }
;

infer:
  | INFERENCE OPEN LIDENT COMMA LBRACKET STATUS OPEN LIDENT CLOSE RBRACKET COMMA LBRACKET infer_list RBRACKET { Phrase.Infer ($3, $8, $13) }
  | LIDENT { Phrase.Name ($1) }
;

infer_list:
  | /* mot vide */ { [] }
  | infer COMMA infer_list { $1::$3 }
  | infer { [$1] }

      
%%
