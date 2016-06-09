type token =
  | EQUIV
  | IMPLY
  | RIMPLY
  | AND
  | OR
  | NOT
  | PROP
  | TRUE
  | FALSE
  | TTYPE
  | ALL
  | EX
  | OPEN
  | CLOSE
  | EOF
  | INCLUDE
  | DOT
  | FILE
  | INFERENCE
  | INTRODUCED
  | DEFINITION
  | AXIOM_OF_CHOICE
  | TAUTOLOGY
  | ASSUMPTION
  | UNKNOWN
  | AC
  | EQUALITY
  | THEORY
  | CREATOR
  | INPUT_CLAUSE
  | INPUT_FORMULA
  | INPUT_TFF_FORMULA
  | RANGL
  | LBRACKET
  | RBRACKET
  | STAR
  | LIDENT of (string)
  | UIDENT of (string)
  | ANYCHAR of (string)
  | STRING of (string)
  | INT of (string)
  | RAT of (string)
  | REAL of (string)
  | POSITIVE
  | NEGATIVE
  | COMMA
  | EQSYM
  | NEQSYM
  | COLON
  | XOR
  | NOR
  | NAND
  | ANNOT of (string)

open Parsing;;
let _ = parse_error;;
# 2 "parsetstp.mly"
Version.add "$Id$";;

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

# 92 "parsetstp.ml"
let yytransl_const = [|
  257 (* EQUIV *);
  258 (* IMPLY *);
  259 (* RIMPLY *);
  260 (* AND *);
  261 (* OR *);
  262 (* NOT *);
  263 (* PROP *);
  264 (* TRUE *);
  265 (* FALSE *);
  266 (* TTYPE *);
  267 (* ALL *);
  268 (* EX *);
  269 (* OPEN *);
  270 (* CLOSE *);
    0 (* EOF *);
  271 (* INCLUDE *);
  272 (* DOT *);
  273 (* FILE *);
  274 (* INFERENCE *);
  275 (* INTRODUCED *);
  276 (* DEFINITION *);
  277 (* AXIOM_OF_CHOICE *);
  278 (* TAUTOLOGY *);
  279 (* ASSUMPTION *);
  280 (* UNKNOWN *);
  281 (* AC *);
  282 (* EQUALITY *);
  283 (* THEORY *);
  284 (* CREATOR *);
  285 (* INPUT_CLAUSE *);
  286 (* INPUT_FORMULA *);
  287 (* INPUT_TFF_FORMULA *);
  288 (* RANGL *);
  289 (* LBRACKET *);
  290 (* RBRACKET *);
  291 (* STAR *);
  299 (* POSITIVE *);
  300 (* NEGATIVE *);
  301 (* COMMA *);
  302 (* EQSYM *);
  303 (* NEQSYM *);
  304 (* COLON *);
  305 (* XOR *);
  306 (* NOR *);
  307 (* NAND *);
    0|]

let yytransl_block = [|
  292 (* LIDENT *);
  293 (* UIDENT *);
  294 (* ANYCHAR *);
  295 (* STRING *);
  296 (* INT *);
  297 (* RAT *);
  298 (* REAL *);
  308 (* ANNOT *);
    0|]

let yylhs = "\255\255\
\001\000\001\000\002\000\002\000\002\000\002\000\002\000\002\000\
\002\000\002\000\002\000\002\000\002\000\008\000\008\000\008\000\
\008\000\008\000\008\000\008\000\008\000\008\000\008\000\009\000\
\009\000\010\000\010\000\004\000\004\000\004\000\004\000\004\000\
\004\000\004\000\004\000\004\000\007\000\007\000\011\000\011\000\
\011\000\011\000\011\000\011\000\011\000\013\000\013\000\013\000\
\013\000\014\000\014\000\015\000\015\000\012\000\012\000\012\000\
\012\000\016\000\016\000\003\000\003\000\006\000\006\000\017\000\
\017\000\005\000\005\000\018\000\018\000\018\000\018\000\018\000\
\023\000\023\000\023\000\020\000\020\000\021\000\025\000\025\000\
\025\000\025\000\022\000\022\000\022\000\026\000\029\000\029\000\
\027\000\030\000\030\000\028\000\019\000\019\000\024\000\031\000\
\031\000\031\000\032\000\032\000\000\000"

let yylen = "\002\000\
\001\000\002\000\005\000\009\000\009\000\010\000\010\000\011\000\
\009\000\009\000\009\000\009\000\001\000\001\000\002\000\001\000\
\001\000\001\000\001\000\001\000\001\000\003\000\003\000\003\000\
\000\000\003\000\001\000\001\000\003\000\003\000\003\000\003\000\
\003\000\003\000\003\000\003\000\003\000\003\000\006\000\006\000\
\002\000\003\000\001\000\001\000\001\000\003\000\005\000\001\000\
\003\000\003\000\005\000\001\000\003\000\001\000\001\000\007\000\
\009\000\005\000\003\000\003\000\001\000\003\000\001\000\001\000\
\003\000\000\000\003\000\001\000\001\000\001\000\001\000\003\000\
\000\000\001\000\003\000\001\000\010\000\005\000\001\000\001\000\
\001\000\001\000\001\000\001\000\001\000\005\000\000\000\002\000\
\005\000\001\000\001\000\005\000\000\000\002\000\003\000\000\000\
\001\000\003\000\001\000\004\000\002\000"

let yydefred = "\000\000\
\000\000\000\000\001\000\000\000\000\000\000\000\000\000\013\000\
\101\000\000\000\000\000\000\000\000\000\000\000\002\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\003\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\016\000\043\000\044\000\017\000\000\000\000\000\000\000\
\000\000\014\000\018\000\019\000\020\000\021\000\000\000\000\000\
\064\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\060\000\000\000\041\000\000\000\000\000\
\000\000\000\000\000\000\000\000\015\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\004\000\000\000\000\000\000\000\042\000\
\062\000\000\000\000\000\000\000\000\000\000\000\071\000\000\000\
\000\000\000\000\076\000\000\000\068\000\069\000\070\000\083\000\
\084\000\085\000\000\000\022\000\023\000\065\000\005\000\000\000\
\032\000\031\000\033\000\029\000\030\000\034\000\035\000\036\000\
\037\000\000\000\000\000\000\000\038\000\055\000\009\000\000\000\
\010\000\011\000\012\000\000\000\000\000\000\000\000\000\000\000\
\024\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\067\000\007\000\006\000\000\000\000\000\000\000\000\000\
\000\000\046\000\000\000\000\000\000\000\026\000\000\000\000\000\
\079\000\080\000\081\000\082\000\000\000\090\000\091\000\000\000\
\000\000\000\000\072\000\000\000\094\000\000\000\000\000\000\000\
\000\000\008\000\000\000\039\000\040\000\000\000\000\000\000\000\
\000\000\000\000\000\000\075\000\000\000\000\000\000\000\000\000\
\000\000\053\000\000\000\047\000\088\000\086\000\000\000\078\000\
\089\000\092\000\000\000\095\000\000\000\000\000\000\000\000\000\
\000\000\000\000\098\000\000\000\000\000\000\000\100\000\000\000\
\000\000\000\000\000\000\058\000\000\000\000\000\000\000\057\000\
\077\000"

let yydgoto = "\002\000\
\009\000\010\000\034\000\073\000\079\000\055\000\065\000\056\000\
\077\000\107\000\061\000\141\000\102\000\142\000\167\000\209\000\
\058\000\159\000\162\000\117\000\118\000\119\000\160\000\189\000\
\181\000\120\000\121\000\122\000\199\000\184\000\206\000\207\000"

let yysindex = "\045\000\
\001\000\000\000\000\000\049\255\059\255\065\255\091\255\000\000\
\000\000\001\000\069\255\075\255\080\255\067\255\000\000\000\255\
\074\255\079\255\093\255\099\255\109\255\112\255\116\255\118\255\
\119\255\120\255\000\000\147\255\137\255\139\255\140\255\141\255\
\142\255\156\255\152\255\160\255\168\255\168\255\147\255\181\255\
\160\255\000\000\000\000\000\000\000\000\165\255\170\255\160\255\
\193\255\000\000\000\000\000\000\000\000\000\000\167\255\043\255\
\000\000\208\255\160\255\007\255\097\255\168\255\003\255\011\255\
\202\255\205\255\206\255\000\000\207\255\000\000\185\255\185\255\
\212\255\097\255\023\255\081\255\000\000\246\255\213\255\081\255\
\081\255\160\255\214\255\215\255\160\255\160\255\160\255\160\255\
\160\255\160\255\160\255\160\255\219\255\204\255\216\255\198\255\
\220\255\221\255\222\255\000\000\234\254\201\255\227\255\000\000\
\000\000\086\255\225\255\229\255\236\255\243\255\000\000\249\255\
\253\255\246\255\000\000\224\255\000\000\000\000\000\000\000\000\
\000\000\000\000\252\255\000\000\000\000\000\000\000\000\255\255\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\244\255\081\255\244\254\000\000\000\000\000\000\005\000\
\000\000\000\000\000\000\185\255\081\255\230\255\232\255\081\255\
\000\000\231\255\241\255\107\255\044\255\245\255\238\255\250\255\
\002\000\000\000\000\000\000\000\003\000\001\255\015\000\081\255\
\017\000\000\000\104\255\160\255\160\255\000\000\248\255\254\255\
\000\000\000\000\000\000\000\000\224\255\000\000\000\000\224\255\
\224\255\246\255\000\000\004\000\000\000\007\000\081\255\006\000\
\043\255\000\000\185\255\000\000\000\000\009\000\020\000\002\000\
\025\000\027\000\028\000\000\000\033\000\013\000\010\000\008\000\
\014\000\000\000\081\255\000\000\000\000\000\000\012\000\000\000\
\000\000\000\000\004\000\000\000\004\000\039\000\011\000\043\255\
\018\000\036\000\000\000\016\000\211\255\246\255\000\000\007\000\
\218\255\043\255\024\000\000\000\244\254\038\000\040\000\000\000\
\000\000"

let yyrindex = "\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\026\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\008\255\000\000\000\000\000\000\000\000\000\000\048\000\092\255\
\000\000\015\255\000\000\000\000\016\255\000\000\063\255\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\049\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\030\000\000\000\000\000\000\000\
\000\000\051\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\032\000\000\000\053\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\054\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\035\000\000\000\
\000\000\000\000\000\000\000\000\000\000\056\000\000\000\000\000\
\000\000\000\000\037\000\000\000\000\000\000\000\058\000\000\000\
\000\000\000\000\000\000\000\000\053\000\000\000\000\000\053\000\
\053\000\032\000\000\000\041\000\000\000\000\000\000\000\000\000\
\059\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\249\254\000\000\005\255\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\060\000\000\000\010\255\000\000\000\000\062\000\
\000\000\000\000\000\000\043\000\000\000\032\000\000\000\000\000\
\000\000\064\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000"

let yygindex = "\000\000\
\069\001\000\000\041\001\251\255\021\001\000\000\235\255\180\255\
\000\000\186\000\223\255\000\000\187\255\106\000\149\000\109\000\
\038\001\009\001\146\255\000\000\000\000\000\000\076\255\144\000\
\000\000\000\000\000\000\000\000\000\000\000\000\171\255\000\000"

let yytablesize = 344
let yytable = "\106\000\
\003\000\057\000\103\000\124\000\125\000\204\000\099\000\070\000\
\025\000\025\000\025\000\025\000\025\000\021\000\074\000\076\000\
\067\000\140\000\097\000\168\000\083\000\025\000\148\000\096\000\
\095\000\149\000\099\000\082\000\063\000\028\000\060\000\064\000\
\066\000\080\000\081\000\191\000\105\000\099\000\097\000\025\000\
\093\000\025\000\025\000\096\000\022\000\001\000\080\000\081\000\
\126\000\235\000\094\000\078\000\025\000\025\000\025\000\096\000\
\025\000\025\000\025\000\063\000\028\000\011\000\166\000\025\000\
\025\000\025\000\025\000\025\000\182\000\183\000\201\000\012\000\
\171\000\202\000\203\000\106\000\025\000\013\000\170\000\129\000\
\130\000\131\000\132\000\133\000\134\000\135\000\136\000\042\000\
\080\000\081\000\045\000\193\000\045\000\045\000\045\000\045\000\
\045\000\085\000\086\000\087\000\088\000\089\000\019\000\014\000\
\016\000\045\000\020\000\025\000\025\000\025\000\017\000\025\000\
\025\000\025\000\166\000\018\000\049\000\050\000\023\000\051\000\
\052\000\053\000\054\000\024\000\027\000\212\000\177\000\178\000\
\179\000\180\000\152\000\080\000\081\000\226\000\224\000\227\000\
\045\000\025\000\196\000\197\000\045\000\045\000\045\000\026\000\
\028\000\090\000\091\000\092\000\195\000\080\000\081\000\029\000\
\234\000\030\000\031\000\032\000\237\000\041\000\042\000\043\000\
\044\000\045\000\046\000\047\000\048\000\041\000\042\000\043\000\
\044\000\045\000\046\000\047\000\059\000\041\000\042\000\043\000\
\044\000\045\000\046\000\047\000\062\000\035\000\033\000\036\000\
\037\000\038\000\039\000\049\000\050\000\040\000\051\000\052\000\
\053\000\054\000\069\000\049\000\050\000\071\000\051\000\052\000\
\053\000\054\000\072\000\063\000\050\000\076\000\051\000\052\000\
\053\000\054\000\042\000\078\000\082\000\045\000\138\000\097\000\
\139\000\042\000\098\000\099\000\045\000\101\000\100\000\233\000\
\042\000\104\000\123\000\045\000\128\000\127\000\139\000\143\000\
\137\000\144\000\150\000\145\000\146\000\147\000\153\000\049\000\
\050\000\154\000\051\000\052\000\053\000\054\000\049\000\050\000\
\155\000\051\000\052\000\053\000\054\000\049\000\050\000\156\000\
\051\000\052\000\053\000\054\000\151\000\157\000\108\000\109\000\
\110\000\158\000\175\000\163\000\161\000\111\000\164\000\004\000\
\112\000\113\000\169\000\165\000\176\000\172\000\114\000\173\000\
\185\000\115\000\186\000\187\000\192\000\005\000\006\000\007\000\
\194\000\214\000\188\000\190\000\198\000\211\000\216\000\205\000\
\217\000\218\000\200\000\208\000\213\000\219\000\220\000\223\000\
\228\000\231\000\230\000\240\000\008\000\241\000\221\000\222\000\
\225\000\239\000\229\000\061\000\232\000\066\000\028\000\048\000\
\027\000\073\000\093\000\054\000\074\000\052\000\049\000\087\000\
\050\000\096\000\096\000\051\000\059\000\056\000\015\000\068\000\
\084\000\174\000\238\000\210\000\236\000\075\000\116\000\215\000"

let yycheck = "\076\000\
\000\000\035\000\072\000\080\000\081\000\186\000\014\001\041\000\
\001\001\002\001\003\001\004\001\005\001\014\001\048\000\013\001\
\038\000\094\000\014\001\032\001\014\001\014\001\045\001\014\001\
\014\001\048\001\034\001\005\001\014\001\014\001\036\000\037\000\
\038\000\046\001\047\001\035\001\014\001\045\001\034\001\032\001\
\062\000\034\001\035\001\034\001\045\001\001\000\046\001\047\001\
\082\000\230\000\048\001\045\001\045\001\046\001\047\001\045\001\
\049\001\050\001\051\001\045\001\045\001\013\001\139\000\001\001\
\002\001\003\001\004\001\005\001\025\001\026\001\181\000\013\001\
\149\000\184\000\185\000\152\000\014\001\013\001\148\000\085\000\
\086\000\087\000\088\000\089\000\090\000\091\000\092\000\007\001\
\046\001\047\001\010\001\168\000\001\001\002\001\003\001\004\001\
\005\001\001\001\002\001\003\001\004\001\005\001\036\001\013\001\
\036\001\014\001\040\001\045\001\046\001\047\001\036\001\049\001\
\050\001\051\001\191\000\036\001\036\001\037\001\045\001\039\001\
\040\001\041\001\042\001\045\001\016\001\195\000\020\001\021\001\
\022\001\023\001\045\001\046\001\047\001\219\000\211\000\221\000\
\045\001\045\001\172\000\173\000\049\001\050\001\051\001\045\001\
\033\001\049\001\050\001\051\001\045\001\046\001\047\001\036\001\
\229\000\036\001\036\001\036\001\233\000\006\001\007\001\008\001\
\009\001\010\001\011\001\012\001\013\001\006\001\007\001\008\001\
\009\001\010\001\011\001\012\001\013\001\006\001\007\001\008\001\
\009\001\010\001\011\001\012\001\013\001\045\001\036\001\045\001\
\045\001\045\001\045\001\036\001\037\001\034\001\039\001\040\001\
\041\001\042\001\014\001\036\001\037\001\033\001\039\001\040\001\
\041\001\042\001\033\001\036\001\037\001\013\001\039\001\040\001\
\041\001\042\001\007\001\045\001\005\001\010\001\011\001\014\001\
\013\001\007\001\014\001\014\001\010\001\037\001\016\001\013\001\
\007\001\014\001\014\001\010\001\014\001\016\001\013\001\016\001\
\014\001\036\001\034\001\016\001\016\001\016\001\014\001\036\001\
\037\001\013\001\039\001\040\001\041\001\042\001\036\001\037\001\
\013\001\039\001\040\001\041\001\042\001\036\001\037\001\013\001\
\039\001\040\001\041\001\042\001\034\001\013\001\017\001\018\001\
\019\001\013\001\036\001\016\001\045\001\024\001\016\001\015\001\
\027\001\028\001\014\001\032\001\036\001\048\001\033\001\048\001\
\036\001\036\001\045\001\034\001\014\001\029\001\030\001\031\001\
\016\001\014\001\033\001\033\001\045\001\032\001\014\001\036\001\
\014\001\014\001\045\001\037\001\036\001\013\001\034\001\034\001\
\010\001\014\001\033\001\014\001\052\001\014\001\045\001\048\001\
\045\001\034\001\048\001\034\001\045\001\014\001\014\001\034\001\
\014\001\034\001\014\001\014\001\034\001\014\001\034\001\014\001\
\014\001\014\001\034\001\014\001\034\001\014\001\010\000\039\000\
\060\000\152\000\233\000\191\000\232\000\048\000\078\000\200\000"

let yynames_const = "\
  EQUIV\000\
  IMPLY\000\
  RIMPLY\000\
  AND\000\
  OR\000\
  NOT\000\
  PROP\000\
  TRUE\000\
  FALSE\000\
  TTYPE\000\
  ALL\000\
  EX\000\
  OPEN\000\
  CLOSE\000\
  EOF\000\
  INCLUDE\000\
  DOT\000\
  FILE\000\
  INFERENCE\000\
  INTRODUCED\000\
  DEFINITION\000\
  AXIOM_OF_CHOICE\000\
  TAUTOLOGY\000\
  ASSUMPTION\000\
  UNKNOWN\000\
  AC\000\
  EQUALITY\000\
  THEORY\000\
  CREATOR\000\
  INPUT_CLAUSE\000\
  INPUT_FORMULA\000\
  INPUT_TFF_FORMULA\000\
  RANGL\000\
  LBRACKET\000\
  RBRACKET\000\
  STAR\000\
  POSITIVE\000\
  NEGATIVE\000\
  COMMA\000\
  EQSYM\000\
  NEQSYM\000\
  COLON\000\
  XOR\000\
  NOR\000\
  NAND\000\
  "

let yynames_block = "\
  LIDENT\000\
  UIDENT\000\
  ANYCHAR\000\
  STRING\000\
  INT\000\
  RAT\000\
  REAL\000\
  ANNOT\000\
  "

let yyact = [|
  (fun _ -> failwith "parser")
; (fun __caml_parser_env ->
    Obj.repr(
# 107 "parsetstp.mly"
                    ( [] )
# 449 "parsetstp.ml"
               : Phrase.tpphrase list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'phrase) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : Phrase.tpphrase list) in
    Obj.repr(
# 108 "parsetstp.mly"
                    ( _1 :: _2 )
# 457 "parsetstp.ml"
               : Phrase.tpphrase list))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 2 : string) in
    Obj.repr(
# 111 "parsetstp.mly"
                                   ( Phrase.Include (_3, None) )
# 464 "parsetstp.ml"
               : 'phrase))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 6 : string) in
    let _6 = (Parsing.peek_val __caml_parser_env 3 : 'name_list) in
    Obj.repr(
# 113 "parsetstp.mly"
      ( Phrase.Include (_3, Some (_6)) )
# 472 "parsetstp.ml"
               : 'phrase))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 6 : string) in
    let _5 = (Parsing.peek_val __caml_parser_env 4 : string) in
    let _7 = (Parsing.peek_val __caml_parser_env 2 : 'formula) in
    Obj.repr(
# 115 "parsetstp.mly"
      ( Phrase.Formula (ns_hyp _3, _5, _7, None) )
# 481 "parsetstp.ml"
               : 'phrase))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 7 : string) in
    let _5 = (Parsing.peek_val __caml_parser_env 5 : string) in
    let _7 = (Parsing.peek_val __caml_parser_env 3 : 'formula) in
    let _8 = (Parsing.peek_val __caml_parser_env 2 : 'optional) in
    Obj.repr(
# 117 "parsetstp.mly"
      ( Phrase.Formula_annot (ns_hyp _3, _5, _7, _8) )
# 491 "parsetstp.ml"
               : 'phrase))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 7 : string) in
    let _5 = (Parsing.peek_val __caml_parser_env 5 : string) in
    let _7 = (Parsing.peek_val __caml_parser_env 3 : 'cnf_formula) in
    let _8 = (Parsing.peek_val __caml_parser_env 2 : 'optional) in
    Obj.repr(
# 119 "parsetstp.mly"
      ( Phrase.Formula_annot (_3, _5, cnf_to_formula _7, _8) )
# 501 "parsetstp.ml"
               : 'phrase))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 8 : string) in
    let _5 = (Parsing.peek_val __caml_parser_env 6 : string) in
    let _7 = (Parsing.peek_val __caml_parser_env 4 : 'formula) in
    let _9 = (Parsing.peek_val __caml_parser_env 2 : string) in
    Obj.repr(
# 121 "parsetstp.mly"
     ( Phrase.Formula (ns_hyp _3, "tff_" ^ _5, _7, Some _9) )
# 511 "parsetstp.ml"
               : 'phrase))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 6 : string) in
    let _5 = (Parsing.peek_val __caml_parser_env 4 : string) in
    let _7 = (Parsing.peek_val __caml_parser_env 2 : 'formula) in
    Obj.repr(
# 123 "parsetstp.mly"
     ( Phrase.Formula (ns_hyp _3, "tff_" ^ _5, _7, None) )
# 520 "parsetstp.ml"
               : 'phrase))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 6 : string) in
    let _5 = (Parsing.peek_val __caml_parser_env 4 : string) in
    let _7 = (Parsing.peek_val __caml_parser_env 2 : 'type_def) in
    Obj.repr(
# 125 "parsetstp.mly"
     ( Phrase.Formula (ns_hyp _3, "tff_" ^ _5, _7, None) )
# 529 "parsetstp.ml"
               : 'phrase))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 6 : string) in
    let _5 = (Parsing.peek_val __caml_parser_env 4 : string) in
    let _7 = (Parsing.peek_val __caml_parser_env 2 : 'formula) in
    Obj.repr(
# 127 "parsetstp.mly"
     ( Phrase.Formula (ns_hyp _3, "tff_" ^ _5, _7, None) )
# 538 "parsetstp.ml"
               : 'phrase))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 6 : string) in
    let _5 = (Parsing.peek_val __caml_parser_env 4 : string) in
    let _7 = (Parsing.peek_val __caml_parser_env 2 : 'type_def) in
    Obj.repr(
# 129 "parsetstp.mly"
     ( Phrase.Formula (ns_hyp _3, "tff_" ^ _5, _7, None) )
# 547 "parsetstp.ml"
               : 'phrase))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 130 "parsetstp.mly"
                                   ( Phrase.Annotation _1 )
# 554 "parsetstp.ml"
               : 'phrase))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 133 "parsetstp.mly"
                                       ( tvar_none (ns_var _1) )
# 561 "parsetstp.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : string) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'arguments) in
    Obj.repr(
# 134 "parsetstp.mly"
                                       ( eapp (tvar_none @@ ns_fun _1, _2) )
# 569 "parsetstp.ml"
               : 'expr))
; (fun __caml_parser_env ->
    Obj.repr(
# 135 "parsetstp.mly"
                                       ( type_prop )
# 575 "parsetstp.ml"
               : 'expr))
; (fun __caml_parser_env ->
    Obj.repr(
# 136 "parsetstp.mly"
                                       ( type_type )
# 581 "parsetstp.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 137 "parsetstp.mly"
                                       ( eapp (tvar_none "$string", [tvar_none _1]) )
# 588 "parsetstp.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 138 "parsetstp.mly"
                                       ( Arith.mk_int _1 )
# 595 "parsetstp.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 139 "parsetstp.mly"
                                       ( Arith.mk_rat _1 )
# 602 "parsetstp.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 140 "parsetstp.mly"
                                       ( Arith.mk_real _1 )
# 609 "parsetstp.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 141 "parsetstp.mly"
                                       ( eeq _1 _3 )
# 617 "parsetstp.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 142 "parsetstp.mly"
                                       ( enot (eeq _1 _3) )
# 625 "parsetstp.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'expr_list) in
    Obj.repr(
# 145 "parsetstp.mly"
                                 ( _2 )
# 632 "parsetstp.ml"
               : 'arguments))
; (fun __caml_parser_env ->
    Obj.repr(
# 146 "parsetstp.mly"
                                 ( [] )
# 638 "parsetstp.ml"
               : 'arguments))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr_list) in
    Obj.repr(
# 149 "parsetstp.mly"
                                 ( _1 :: _3 )
# 646 "parsetstp.ml"
               : 'expr_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 150 "parsetstp.mly"
                                 ( [_1] )
# 653 "parsetstp.ml"
               : 'expr_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'atom) in
    Obj.repr(
# 153 "parsetstp.mly"
                               ( _1 )
# 660 "parsetstp.ml"
               : 'formula))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'atom) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'formula) in
    Obj.repr(
# 154 "parsetstp.mly"
                               ( eand (_1, _3) )
# 668 "parsetstp.ml"
               : 'formula))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'atom) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'formula) in
    Obj.repr(
# 155 "parsetstp.mly"
                               ( eor (_1, _3) )
# 676 "parsetstp.ml"
               : 'formula))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'atom) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'formula) in
    Obj.repr(
# 156 "parsetstp.mly"
                               ( eimply (_1, _3) )
# 684 "parsetstp.ml"
               : 'formula))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'atom) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'formula) in
    Obj.repr(
# 157 "parsetstp.mly"
                               ( eequiv (_1, _3) )
# 692 "parsetstp.ml"
               : 'formula))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'atom) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'formula) in
    Obj.repr(
# 158 "parsetstp.mly"
                               ( eimply (_3, _1) )
# 700 "parsetstp.ml"
               : 'formula))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'atom) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'formula) in
    Obj.repr(
# 159 "parsetstp.mly"
                               ( enot (eequiv (_1, _3)) )
# 708 "parsetstp.ml"
               : 'formula))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'atom) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'formula) in
    Obj.repr(
# 160 "parsetstp.mly"
                               ( enot (eor (_1, _3)) )
# 716 "parsetstp.ml"
               : 'formula))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'atom) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'formula) in
    Obj.repr(
# 161 "parsetstp.mly"
                               ( enot (eand (_1, _3)) )
# 724 "parsetstp.ml"
               : 'formula))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'type_def) in
    Obj.repr(
# 164 "parsetstp.mly"
                                 ( _2 )
# 731 "parsetstp.ml"
               : 'type_def))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'tff_type_sig) in
    Obj.repr(
# 165 "parsetstp.mly"
                                 ( eapp (tvar_none "#", [tvar_none _1; _3]) )
# 739 "parsetstp.ml"
               : 'type_def))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 3 : 'var_list) in
    let _6 = (Parsing.peek_val __caml_parser_env 0 : 'atom) in
    Obj.repr(
# 169 "parsetstp.mly"
                                   ( mk_quant eall _3 _6 )
# 747 "parsetstp.ml"
               : 'atom))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 3 : 'var_list) in
    let _6 = (Parsing.peek_val __caml_parser_env 0 : 'atom) in
    Obj.repr(
# 171 "parsetstp.mly"
                                   ( mk_quant eex _3 _6 )
# 755 "parsetstp.ml"
               : 'atom))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'atom) in
    Obj.repr(
# 172 "parsetstp.mly"
                                   ( enot (_2) )
# 762 "parsetstp.ml"
               : 'atom))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'formula) in
    Obj.repr(
# 173 "parsetstp.mly"
                                   ( _2 )
# 769 "parsetstp.ml"
               : 'atom))
; (fun __caml_parser_env ->
    Obj.repr(
# 174 "parsetstp.mly"
                                   ( etrue )
# 775 "parsetstp.ml"
               : 'atom))
; (fun __caml_parser_env ->
    Obj.repr(
# 175 "parsetstp.mly"
                                   ( efalse )
# 781 "parsetstp.ml"
               : 'atom))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 176 "parsetstp.mly"
                                   ( _1 )
# 788 "parsetstp.ml"
               : 'atom))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'var_list) in
    Obj.repr(
# 179 "parsetstp.mly"
                                      ( (tvar (ns_var _1) type_iota) :: _3 )
# 796 "parsetstp.ml"
               : 'var_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 4 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _5 = (Parsing.peek_val __caml_parser_env 0 : 'var_list) in
    Obj.repr(
# 180 "parsetstp.mly"
                                      ( (tvar (ns_var _1) _3) :: _5 )
# 805 "parsetstp.ml"
               : 'var_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 181 "parsetstp.mly"
                                      ( [tvar (ns_var _1) type_iota] )
# 812 "parsetstp.ml"
               : 'var_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 182 "parsetstp.mly"
                                      ( [tvar (ns_var _1) _3] )
# 820 "parsetstp.ml"
               : 'var_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 185 "parsetstp.mly"
                                      ( earrow [_1] _3 )
# 828 "parsetstp.ml"
               : 'tff_type_arrow))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 3 : 'tff_tuple) in
    let _5 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 186 "parsetstp.mly"
                                      ( earrow _2 _5 )
# 836 "parsetstp.ml"
               : 'tff_type_arrow))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 189 "parsetstp.mly"
                          ( [_1] )
# 843 "parsetstp.ml"
               : 'tff_tuple))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'tff_tuple) in
    Obj.repr(
# 190 "parsetstp.mly"
                          (  _1 :: _3 )
# 851 "parsetstp.ml"
               : 'tff_tuple))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 194 "parsetstp.mly"
     ( _1 )
# 858 "parsetstp.ml"
               : 'tff_type_sig))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'tff_type_arrow) in
    Obj.repr(
# 196 "parsetstp.mly"
     ( _1 )
# 865 "parsetstp.ml"
               : 'tff_type_sig))
; (fun __caml_parser_env ->
    let _4 = (Parsing.peek_val __caml_parser_env 3 : 'tff_quant) in
    let _7 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 198 "parsetstp.mly"
     ( mk_quant eall _4 _7 )
# 873 "parsetstp.ml"
               : 'tff_type_sig))
; (fun __caml_parser_env ->
    let _4 = (Parsing.peek_val __caml_parser_env 5 : 'tff_quant) in
    let _8 = (Parsing.peek_val __caml_parser_env 1 : 'tff_type_arrow) in
    Obj.repr(
# 200 "parsetstp.mly"
     ( mk_quant eall _4 _8 )
# 881 "parsetstp.ml"
               : 'tff_type_sig))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 4 : string) in
    let _5 = (Parsing.peek_val __caml_parser_env 0 : 'tff_quant) in
    Obj.repr(
# 203 "parsetstp.mly"
                                        ( (tvar (ns_var _1) type_type) :: _5 )
# 889 "parsetstp.ml"
               : 'tff_quant))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : string) in
    Obj.repr(
# 204 "parsetstp.mly"
                                        ( [tvar (ns_var _1) type_type] )
# 896 "parsetstp.ml"
               : 'tff_quant))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'name_list) in
    Obj.repr(
# 207 "parsetstp.mly"
                                   ( _1 :: _3 )
# 904 "parsetstp.ml"
               : 'name_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 208 "parsetstp.mly"
                                   ( [_1] )
# 911 "parsetstp.ml"
               : 'name_list))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'disjunction) in
    Obj.repr(
# 212 "parsetstp.mly"
                                   ( _2 )
# 918 "parsetstp.ml"
               : 'cnf_formula))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'disjunction) in
    Obj.repr(
# 213 "parsetstp.mly"
                                   ( _1 )
# 925 "parsetstp.ml"
               : 'cnf_formula))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'atom) in
    Obj.repr(
# 217 "parsetstp.mly"
                                   ( [_1] )
# 932 "parsetstp.ml"
               : 'disjunction))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'disjunction) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'atom) in
    Obj.repr(
# 218 "parsetstp.mly"
                                   ( _3 :: _1 )
# 940 "parsetstp.ml"
               : 'disjunction))
; (fun __caml_parser_env ->
    Obj.repr(
# 222 "parsetstp.mly"
                 ( None )
# 946 "parsetstp.ml"
               : 'optional))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'source) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'optional_info) in
    Obj.repr(
# 223 "parsetstp.mly"
                             ( Some (Phrase.Option (_2)) )
# 954 "parsetstp.ml"
               : 'optional))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'dag_source) in
    Obj.repr(
# 227 "parsetstp.mly"
             ( _1 )
# 961 "parsetstp.ml"
               : 'source))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'internal_source) in
    Obj.repr(
# 228 "parsetstp.mly"
                  ( _1 )
# 968 "parsetstp.ml"
               : 'source))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'external_source) in
    Obj.repr(
# 229 "parsetstp.mly"
                  ( _1 )
# 975 "parsetstp.ml"
               : 'source))
; (fun __caml_parser_env ->
    Obj.repr(
# 230 "parsetstp.mly"
          ( "" )
# 981 "parsetstp.ml"
               : 'source))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'source_list) in
    Obj.repr(
# 231 "parsetstp.mly"
                                ( _2 )
# 988 "parsetstp.ml"
               : 'source))
; (fun __caml_parser_env ->
    Obj.repr(
# 235 "parsetstp.mly"
                 ( "" )
# 994 "parsetstp.ml"
               : 'source_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'source) in
    Obj.repr(
# 236 "parsetstp.mly"
         ( _1 )
# 1001 "parsetstp.ml"
               : 'source_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'source) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'source_list) in
    Obj.repr(
# 237 "parsetstp.mly"
                           ( _1 )
# 1009 "parsetstp.ml"
               : 'source_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 241 "parsetstp.mly"
         ( _1 )
# 1016 "parsetstp.ml"
               : 'dag_source))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 7 : string) in
    let _5 = (Parsing.peek_val __caml_parser_env 5 : 'useful_info) in
    let _8 = (Parsing.peek_val __caml_parser_env 2 : 'source_list) in
    Obj.repr(
# 242 "parsetstp.mly"
                                                                                    ( "Inference" )
# 1025 "parsetstp.ml"
               : 'dag_source))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 2 : 'intro_type) in
    let _4 = (Parsing.peek_val __caml_parser_env 1 : 'optional_info) in
    Obj.repr(
# 246 "parsetstp.mly"
                                                 ( "introduction type" )
# 1033 "parsetstp.ml"
               : 'internal_source))
; (fun __caml_parser_env ->
    Obj.repr(
# 250 "parsetstp.mly"
             ( "definition" )
# 1039 "parsetstp.ml"
               : 'intro_type))
; (fun __caml_parser_env ->
    Obj.repr(
# 251 "parsetstp.mly"
                  ( "axiom_of_choice" )
# 1045 "parsetstp.ml"
               : 'intro_type))
; (fun __caml_parser_env ->
    Obj.repr(
# 252 "parsetstp.mly"
            ( "tautology" )
# 1051 "parsetstp.ml"
               : 'intro_type))
; (fun __caml_parser_env ->
    Obj.repr(
# 253 "parsetstp.mly"
             ( "assumption" )
# 1057 "parsetstp.ml"
               : 'intro_type))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'file_source) in
    Obj.repr(
# 257 "parsetstp.mly"
              ( _1 )
# 1064 "parsetstp.ml"
               : 'external_source))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'theory) in
    Obj.repr(
# 258 "parsetstp.mly"
         ( _1 )
# 1071 "parsetstp.ml"
               : 'external_source))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'creator_source) in
    Obj.repr(
# 259 "parsetstp.mly"
                 ( _1 )
# 1078 "parsetstp.ml"
               : 'external_source))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _4 = (Parsing.peek_val __caml_parser_env 1 : 'file_info) in
    Obj.repr(
# 263 "parsetstp.mly"
                                   ( _3 )
# 1086 "parsetstp.ml"
               : 'file_source))
; (fun __caml_parser_env ->
    Obj.repr(
# 267 "parsetstp.mly"
               ( None )
# 1092 "parsetstp.ml"
               : 'file_info))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 268 "parsetstp.mly"
               ( Some (_2) )
# 1099 "parsetstp.ml"
               : 'file_info))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 2 : 'theory_name) in
    let _4 = (Parsing.peek_val __caml_parser_env 1 : 'optional_info) in
    Obj.repr(
# 272 "parsetstp.mly"
                                              ( "Theory" )
# 1107 "parsetstp.ml"
               : 'theory))
; (fun __caml_parser_env ->
    Obj.repr(
# 276 "parsetstp.mly"
     ( None  )
# 1113 "parsetstp.ml"
               : 'theory_name))
; (fun __caml_parser_env ->
    Obj.repr(
# 277 "parsetstp.mly"
           ( None )
# 1119 "parsetstp.ml"
               : 'theory_name))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _4 = (Parsing.peek_val __caml_parser_env 1 : 'optional_info) in
    Obj.repr(
# 281 "parsetstp.mly"
                                          ( "Creator" )
# 1127 "parsetstp.ml"
               : 'creator_source))
; (fun __caml_parser_env ->
    Obj.repr(
# 285 "parsetstp.mly"
               ( [] )
# 1133 "parsetstp.ml"
               : 'optional_info))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'useful_info) in
    Obj.repr(
# 286 "parsetstp.mly"
                    ( [_2] )
# 1140 "parsetstp.ml"
               : 'optional_info))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'info_items) in
    Obj.repr(
# 290 "parsetstp.mly"
                               ( [_2] )
# 1147 "parsetstp.ml"
               : 'useful_info))
; (fun __caml_parser_env ->
    Obj.repr(
# 294 "parsetstp.mly"
               ( None )
# 1153 "parsetstp.ml"
               : 'info_items))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'info_item) in
    Obj.repr(
# 295 "parsetstp.mly"
            ( Some (_1) )
# 1160 "parsetstp.ml"
               : 'info_items))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'info_item) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'info_items) in
    Obj.repr(
# 296 "parsetstp.mly"
                             ( Some (_1) )
# 1168 "parsetstp.ml"
               : 'info_items))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 300 "parsetstp.mly"
         ( [_1] )
# 1175 "parsetstp.ml"
               : 'info_item))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 3 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 1 : 'info_items) in
    Obj.repr(
# 301 "parsetstp.mly"
                               ( ["Info_item"]  )
# 1183 "parsetstp.ml"
               : 'info_item))
(* Entry file *)
; (fun __caml_parser_env -> raise (Parsing.YYexit (Parsing.peek_val __caml_parser_env 0)))
|]
let yytables =
  { Parsing.actions=yyact;
    Parsing.transl_const=yytransl_const;
    Parsing.transl_block=yytransl_block;
    Parsing.lhs=yylhs;
    Parsing.len=yylen;
    Parsing.defred=yydefred;
    Parsing.dgoto=yydgoto;
    Parsing.sindex=yysindex;
    Parsing.rindex=yyrindex;
    Parsing.gindex=yygindex;
    Parsing.tablesize=yytablesize;
    Parsing.table=yytable;
    Parsing.check=yycheck;
    Parsing.error_function=parse_error;
    Parsing.names_const=yynames_const;
    Parsing.names_block=yynames_block }
let file (lexfun : Lexing.lexbuf -> token) (lexbuf : Lexing.lexbuf) =
   (Parsing.yyparse yytables 1 lexfun lexbuf : Phrase.tpphrase list)
;;
