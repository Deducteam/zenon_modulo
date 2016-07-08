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

# 88 "parsetstp.ml"
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
  276 (* UNKNOWN *);
  277 (* AC *);
  278 (* EQUALITY *);
  279 (* THEORY *);
  280 (* CREATOR *);
  281 (* INPUT_CLAUSE *);
  282 (* INPUT_FORMULA *);
  283 (* INPUT_TFF_FORMULA *);
  284 (* RANGL *);
  285 (* LBRACKET *);
  286 (* RBRACKET *);
  287 (* STAR *);
  295 (* POSITIVE *);
  296 (* NEGATIVE *);
  297 (* COMMA *);
  298 (* EQSYM *);
  299 (* NEQSYM *);
  300 (* COLON *);
  301 (* XOR *);
  302 (* NOR *);
  303 (* NAND *);
    0|]

let yytransl_block = [|
  288 (* LIDENT *);
  289 (* UIDENT *);
  290 (* ANYCHAR *);
  291 (* STRING *);
  292 (* INT *);
  293 (* RAT *);
  294 (* REAL *);
  304 (* ANNOT *);
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
\023\000\023\000\023\000\020\000\020\000\021\000\022\000\022\000\
\022\000\025\000\028\000\028\000\026\000\029\000\029\000\027\000\
\019\000\019\000\024\000\030\000\030\000\030\000\031\000\031\000\
\000\000"

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
\001\000\005\000\000\000\002\000\005\000\001\000\001\000\005\000\
\000\000\002\000\003\000\000\000\001\000\003\000\001\000\004\000\
\002\000"

let yydefred = "\000\000\
\000\000\000\000\001\000\000\000\000\000\000\000\000\000\013\000\
\097\000\000\000\000\000\000\000\000\000\000\000\002\000\000\000\
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
\000\000\000\000\076\000\000\000\068\000\069\000\070\000\079\000\
\080\000\081\000\000\000\022\000\023\000\065\000\005\000\000\000\
\032\000\031\000\033\000\029\000\030\000\034\000\035\000\036\000\
\037\000\000\000\000\000\000\000\038\000\055\000\009\000\000\000\
\010\000\011\000\012\000\000\000\000\000\000\000\000\000\000\000\
\024\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\067\000\007\000\006\000\000\000\000\000\000\000\000\000\
\000\000\046\000\000\000\000\000\000\000\026\000\000\000\000\000\
\000\000\086\000\087\000\000\000\000\000\000\000\072\000\000\000\
\090\000\000\000\000\000\000\000\000\000\008\000\000\000\039\000\
\040\000\000\000\000\000\000\000\000\000\000\000\000\000\075\000\
\000\000\000\000\000\000\000\000\000\000\053\000\000\000\047\000\
\084\000\082\000\000\000\078\000\085\000\088\000\000\000\091\000\
\000\000\000\000\000\000\000\000\000\000\000\000\094\000\000\000\
\000\000\000\000\096\000\000\000\000\000\000\000\000\000\058\000\
\000\000\000\000\000\000\057\000\077\000"

let yydgoto = "\002\000\
\009\000\010\000\034\000\073\000\079\000\055\000\065\000\056\000\
\077\000\107\000\061\000\141\000\102\000\142\000\167\000\205\000\
\058\000\159\000\162\000\117\000\118\000\119\000\160\000\185\000\
\120\000\121\000\122\000\195\000\180\000\202\000\203\000"

let yysindex = "\023\000\
\001\000\000\000\000\000\046\255\059\255\082\255\090\255\000\000\
\000\000\001\000\088\255\106\255\112\255\241\254\000\000\249\254\
\065\255\087\255\137\255\138\255\166\255\158\255\163\255\172\255\
\173\255\176\255\000\000\179\255\149\255\157\255\171\255\174\255\
\177\255\184\255\148\255\156\255\164\255\164\255\179\255\205\255\
\156\255\000\000\000\000\000\000\000\000\192\255\193\255\156\255\
\211\255\000\000\000\000\000\000\000\000\000\000\185\255\233\254\
\000\000\220\255\156\255\002\255\043\255\164\255\017\255\021\255\
\213\255\216\255\230\255\000\000\221\255\000\000\217\255\217\255\
\235\255\043\255\131\255\097\255\000\000\095\255\237\255\097\255\
\097\255\156\255\236\255\239\255\156\255\156\255\156\255\156\255\
\156\255\156\255\156\255\156\255\240\255\196\255\241\255\224\255\
\242\255\243\255\244\255\000\000\052\255\225\255\231\255\000\000\
\000\000\105\255\248\255\250\255\252\255\253\255\000\000\255\255\
\002\000\095\255\000\000\226\255\000\000\000\000\000\000\000\000\
\000\000\000\000\003\000\000\000\000\000\000\000\000\000\004\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\245\255\097\255\066\255\000\000\000\000\000\000\007\000\
\000\000\000\000\000\000\217\255\097\255\234\255\246\255\097\255\
\000\000\232\255\238\255\247\255\104\255\249\255\228\255\005\000\
\008\000\000\000\000\000\000\000\009\000\074\255\010\000\097\255\
\013\000\000\000\109\255\156\255\156\255\000\000\233\255\006\000\
\226\255\000\000\000\000\226\255\226\255\095\255\000\000\011\000\
\000\000\012\000\097\255\014\000\233\254\000\000\217\255\000\000\
\000\000\016\000\017\000\008\000\018\000\019\000\022\000\000\000\
\026\000\020\000\015\000\021\000\024\000\000\000\097\255\000\000\
\000\000\000\000\025\000\000\000\000\000\000\000\011\000\000\000\
\011\000\030\000\027\000\233\254\028\000\032\000\000\000\029\000\
\203\255\095\255\000\000\012\000\210\255\233\254\031\000\000\000\
\066\255\037\000\038\000\000\000\000\000"

let yyrindex = "\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\033\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\009\255\000\000\000\000\000\000\000\000\000\000\039\000\096\255\
\000\000\050\255\000\000\000\000\061\255\000\000\024\255\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\041\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\034\000\000\000\000\000\000\000\
\000\000\044\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\042\000\000\000\045\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\046\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\043\000\000\000\
\000\000\000\000\000\000\000\000\000\000\048\000\000\000\000\000\
\000\000\000\000\047\000\000\000\000\000\000\000\053\000\000\000\
\045\000\000\000\000\000\045\000\045\000\042\000\000\000\049\000\
\000\000\000\000\000\000\000\000\054\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\027\255\000\000\248\254\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\055\000\000\000\
\028\255\000\000\000\000\060\000\000\000\000\000\000\000\050\000\
\000\000\042\000\000\000\000\000\000\000\061\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000"

let yygindex = "\000\000\
\020\001\000\000\002\001\251\255\240\000\000\000\254\255\180\255\
\000\000\180\000\223\255\000\000\187\255\105\000\150\000\110\000\
\035\001\006\001\153\255\000\000\000\000\000\000\083\255\145\000\
\000\000\000\000\000\000\000\000\000\000\162\255\000\000"

let yytablesize = 341
let yytable = "\106\000\
\003\000\057\000\103\000\124\000\125\000\093\000\021\000\070\000\
\200\000\025\000\025\000\025\000\025\000\025\000\074\000\083\000\
\019\000\140\000\080\000\081\000\020\000\093\000\025\000\001\000\
\025\000\025\000\025\000\025\000\025\000\076\000\060\000\064\000\
\066\000\022\000\095\000\067\000\025\000\025\000\025\000\025\000\
\095\000\092\000\078\000\085\000\086\000\087\000\088\000\089\000\
\126\000\025\000\025\000\025\000\231\000\025\000\025\000\025\000\
\095\000\092\000\011\000\093\000\094\000\096\000\166\000\063\000\
\025\000\025\000\025\000\095\000\025\000\025\000\025\000\012\000\
\171\000\197\000\028\000\106\000\198\000\199\000\170\000\129\000\
\130\000\131\000\132\000\133\000\134\000\135\000\136\000\090\000\
\091\000\092\000\063\000\189\000\148\000\168\000\013\000\149\000\
\045\000\045\000\045\000\045\000\045\000\028\000\014\000\042\000\
\187\000\023\000\045\000\080\000\081\000\045\000\166\000\108\000\
\109\000\110\000\111\000\080\000\081\000\112\000\113\000\016\000\
\222\000\208\000\223\000\114\000\178\000\179\000\115\000\024\000\
\049\000\050\000\220\000\051\000\052\000\053\000\054\000\082\000\
\045\000\017\000\192\000\193\000\045\000\045\000\045\000\018\000\
\105\000\152\000\080\000\081\000\230\000\191\000\080\000\081\000\
\233\000\041\000\042\000\043\000\044\000\045\000\046\000\047\000\
\048\000\041\000\042\000\043\000\044\000\045\000\046\000\047\000\
\059\000\041\000\042\000\043\000\044\000\045\000\046\000\047\000\
\062\000\025\000\026\000\049\000\050\000\027\000\051\000\052\000\
\053\000\054\000\028\000\049\000\050\000\035\000\051\000\052\000\
\053\000\054\000\029\000\063\000\050\000\036\000\051\000\052\000\
\053\000\054\000\042\000\030\000\031\000\045\000\138\000\032\000\
\139\000\042\000\033\000\037\000\045\000\040\000\038\000\229\000\
\042\000\039\000\069\000\045\000\071\000\072\000\139\000\076\000\
\082\000\078\000\097\000\049\000\050\000\098\000\051\000\052\000\
\053\000\054\000\049\000\050\000\100\000\051\000\052\000\053\000\
\054\000\049\000\050\000\099\000\051\000\052\000\053\000\054\000\
\104\000\101\000\123\000\127\000\128\000\137\000\150\000\144\000\
\143\000\145\000\146\000\147\000\151\000\153\000\154\000\175\000\
\155\000\156\000\161\000\157\000\182\000\176\000\158\000\004\000\
\165\000\194\000\163\000\164\000\169\000\172\000\177\000\188\000\
\181\000\005\000\006\000\007\000\190\000\015\000\210\000\212\000\
\213\000\173\000\183\000\214\000\184\000\186\000\215\000\224\000\
\068\000\207\000\201\000\084\000\204\000\227\000\196\000\209\000\
\008\000\216\000\236\000\237\000\066\000\219\000\028\000\217\000\
\226\000\027\000\089\000\054\000\235\000\052\000\061\000\048\000\
\218\000\221\000\083\000\050\000\092\000\228\000\225\000\073\000\
\074\000\051\000\056\000\174\000\049\000\234\000\092\000\059\000\
\206\000\232\000\075\000\116\000\211\000"

let yycheck = "\076\000\
\000\000\035\000\072\000\080\000\081\000\014\001\014\001\041\000\
\182\000\001\001\002\001\003\001\004\001\005\001\048\000\014\001\
\032\001\094\000\042\001\043\001\036\001\030\001\014\001\001\000\
\001\001\002\001\003\001\004\001\005\001\013\001\036\000\037\000\
\038\000\041\001\014\001\038\000\028\001\014\001\030\001\031\001\
\014\001\014\001\041\001\001\001\002\001\003\001\004\001\005\001\
\082\000\041\001\042\001\043\001\226\000\045\001\046\001\047\001\
\030\001\030\001\013\001\062\000\044\001\041\001\139\000\014\001\
\041\001\042\001\043\001\041\001\045\001\046\001\047\001\013\001\
\149\000\177\000\014\001\152\000\180\000\181\000\148\000\085\000\
\086\000\087\000\088\000\089\000\090\000\091\000\092\000\045\001\
\046\001\047\001\041\001\168\000\041\001\028\001\013\001\044\001\
\001\001\002\001\003\001\004\001\005\001\041\001\013\001\007\001\
\031\001\041\001\010\001\042\001\043\001\014\001\187\000\017\001\
\018\001\019\001\020\001\042\001\043\001\023\001\024\001\032\001\
\215\000\191\000\217\000\029\001\021\001\022\001\032\001\041\001\
\032\001\033\001\207\000\035\001\036\001\037\001\038\001\005\001\
\041\001\032\001\172\000\173\000\045\001\046\001\047\001\032\001\
\014\001\041\001\042\001\043\001\225\000\041\001\042\001\043\001\
\229\000\006\001\007\001\008\001\009\001\010\001\011\001\012\001\
\013\001\006\001\007\001\008\001\009\001\010\001\011\001\012\001\
\013\001\006\001\007\001\008\001\009\001\010\001\011\001\012\001\
\013\001\041\001\041\001\032\001\033\001\016\001\035\001\036\001\
\037\001\038\001\029\001\032\001\033\001\041\001\035\001\036\001\
\037\001\038\001\032\001\032\001\033\001\041\001\035\001\036\001\
\037\001\038\001\007\001\032\001\032\001\010\001\011\001\032\001\
\013\001\007\001\032\001\041\001\010\001\030\001\041\001\013\001\
\007\001\041\001\014\001\010\001\029\001\029\001\013\001\013\001\
\005\001\041\001\014\001\032\001\033\001\014\001\035\001\036\001\
\037\001\038\001\032\001\033\001\016\001\035\001\036\001\037\001\
\038\001\032\001\033\001\014\001\035\001\036\001\037\001\038\001\
\014\001\033\001\014\001\016\001\014\001\014\001\030\001\032\001\
\016\001\016\001\016\001\016\001\030\001\014\001\013\001\032\001\
\013\001\013\001\041\001\013\001\041\001\032\001\013\001\015\001\
\028\001\041\001\016\001\016\001\014\001\044\001\032\001\014\001\
\032\001\025\001\026\001\027\001\016\001\010\000\014\001\014\001\
\014\001\044\001\030\001\014\001\029\001\029\001\013\001\010\001\
\039\000\028\001\032\001\060\000\033\001\014\001\041\001\032\001\
\048\001\030\001\014\001\014\001\014\001\030\001\014\001\041\001\
\029\001\014\001\014\001\014\001\030\001\014\001\030\001\030\001\
\044\001\041\001\014\001\014\001\014\001\041\001\044\001\030\001\
\030\001\014\001\014\001\152\000\030\001\229\000\030\001\030\001\
\187\000\228\000\048\000\078\000\196\000"

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
# 103 "parsetstp.mly"
                    ( [] )
# 434 "parsetstp.ml"
               : Phrase.tpphrase list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'phrase) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : Phrase.tpphrase list) in
    Obj.repr(
# 104 "parsetstp.mly"
                    ( _1 :: _2 )
# 442 "parsetstp.ml"
               : Phrase.tpphrase list))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 2 : string) in
    Obj.repr(
# 107 "parsetstp.mly"
                                   ( Phrase.Include (_3, None) )
# 449 "parsetstp.ml"
               : 'phrase))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 6 : string) in
    let _6 = (Parsing.peek_val __caml_parser_env 3 : 'name_list) in
    Obj.repr(
# 109 "parsetstp.mly"
      ( Phrase.Include (_3, Some (_6)) )
# 457 "parsetstp.ml"
               : 'phrase))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 6 : string) in
    let _5 = (Parsing.peek_val __caml_parser_env 4 : string) in
    let _7 = (Parsing.peek_val __caml_parser_env 2 : 'formula) in
    Obj.repr(
# 111 "parsetstp.mly"
      ( Hashtbl.add Phrase.name_formula_tbl _3 _7; Phrase.Formula (ns_hyp _3, _5, _7, None) )
# 466 "parsetstp.ml"
               : 'phrase))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 7 : string) in
    let _5 = (Parsing.peek_val __caml_parser_env 5 : string) in
    let _7 = (Parsing.peek_val __caml_parser_env 3 : 'formula) in
    let _8 = (Parsing.peek_val __caml_parser_env 2 : 'optional) in
    Obj.repr(
# 113 "parsetstp.mly"
      ( Hashtbl.add Phrase.name_formula_tbl _3 _7; Phrase.Formula_annot (ns_hyp _3, _5, _7, _8) )
# 476 "parsetstp.ml"
               : 'phrase))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 7 : string) in
    let _5 = (Parsing.peek_val __caml_parser_env 5 : string) in
    let _7 = (Parsing.peek_val __caml_parser_env 3 : 'cnf_formula) in
    let _8 = (Parsing.peek_val __caml_parser_env 2 : 'optional) in
    Obj.repr(
# 115 "parsetstp.mly"
      ( Hashtbl.add Phrase.name_formula_tbl _3 (cnf_to_formula _7); Phrase.Formula_annot (_3, _5, cnf_to_formula _7, _8) )
# 486 "parsetstp.ml"
               : 'phrase))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 8 : string) in
    let _5 = (Parsing.peek_val __caml_parser_env 6 : string) in
    let _7 = (Parsing.peek_val __caml_parser_env 4 : 'formula) in
    let _9 = (Parsing.peek_val __caml_parser_env 2 : string) in
    Obj.repr(
# 117 "parsetstp.mly"
     ( Phrase.Formula (ns_hyp _3, "tff_" ^ _5, _7, Some _9) )
# 496 "parsetstp.ml"
               : 'phrase))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 6 : string) in
    let _5 = (Parsing.peek_val __caml_parser_env 4 : string) in
    let _7 = (Parsing.peek_val __caml_parser_env 2 : 'formula) in
    Obj.repr(
# 119 "parsetstp.mly"
     ( Phrase.Formula (ns_hyp _3, "tff_" ^ _5, _7, None) )
# 505 "parsetstp.ml"
               : 'phrase))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 6 : string) in
    let _5 = (Parsing.peek_val __caml_parser_env 4 : string) in
    let _7 = (Parsing.peek_val __caml_parser_env 2 : 'type_def) in
    Obj.repr(
# 121 "parsetstp.mly"
     ( Phrase.Formula (ns_hyp _3, "tff_" ^ _5, _7, None) )
# 514 "parsetstp.ml"
               : 'phrase))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 6 : string) in
    let _5 = (Parsing.peek_val __caml_parser_env 4 : string) in
    let _7 = (Parsing.peek_val __caml_parser_env 2 : 'formula) in
    Obj.repr(
# 123 "parsetstp.mly"
     ( Phrase.Formula (ns_hyp _3, "tff_" ^ _5, _7, None) )
# 523 "parsetstp.ml"
               : 'phrase))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 6 : string) in
    let _5 = (Parsing.peek_val __caml_parser_env 4 : string) in
    let _7 = (Parsing.peek_val __caml_parser_env 2 : 'type_def) in
    Obj.repr(
# 125 "parsetstp.mly"
     ( Phrase.Formula (ns_hyp _3, "tff_" ^ _5, _7, None) )
# 532 "parsetstp.ml"
               : 'phrase))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 126 "parsetstp.mly"
                                   ( Phrase.Annotation _1 )
# 539 "parsetstp.ml"
               : 'phrase))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 129 "parsetstp.mly"
                                       ( tvar_none (ns_var _1) )
# 546 "parsetstp.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : string) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'arguments) in
    Obj.repr(
# 130 "parsetstp.mly"
                                       ( eapp (tvar_none @@ ns_fun _1, _2) )
# 554 "parsetstp.ml"
               : 'expr))
; (fun __caml_parser_env ->
    Obj.repr(
# 131 "parsetstp.mly"
                                       ( type_prop )
# 560 "parsetstp.ml"
               : 'expr))
; (fun __caml_parser_env ->
    Obj.repr(
# 132 "parsetstp.mly"
                                       ( type_type )
# 566 "parsetstp.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 133 "parsetstp.mly"
                                       ( eapp (tvar_none "$string", [tvar_none _1]) )
# 573 "parsetstp.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 134 "parsetstp.mly"
                                       ( Arith.mk_int _1 )
# 580 "parsetstp.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 135 "parsetstp.mly"
                                       ( Arith.mk_rat _1 )
# 587 "parsetstp.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 136 "parsetstp.mly"
                                       ( Arith.mk_real _1 )
# 594 "parsetstp.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 137 "parsetstp.mly"
                                       ( eeq _1 _3 )
# 602 "parsetstp.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 138 "parsetstp.mly"
                                       ( enot (eeq _1 _3) )
# 610 "parsetstp.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'expr_list) in
    Obj.repr(
# 141 "parsetstp.mly"
                                 ( _2 )
# 617 "parsetstp.ml"
               : 'arguments))
; (fun __caml_parser_env ->
    Obj.repr(
# 142 "parsetstp.mly"
                                 ( [] )
# 623 "parsetstp.ml"
               : 'arguments))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr_list) in
    Obj.repr(
# 145 "parsetstp.mly"
                                 ( _1 :: _3 )
# 631 "parsetstp.ml"
               : 'expr_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 146 "parsetstp.mly"
                                 ( [_1] )
# 638 "parsetstp.ml"
               : 'expr_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'atom) in
    Obj.repr(
# 149 "parsetstp.mly"
                               ( _1 )
# 645 "parsetstp.ml"
               : 'formula))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'atom) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'formula) in
    Obj.repr(
# 150 "parsetstp.mly"
                               ( eand (_1, _3) )
# 653 "parsetstp.ml"
               : 'formula))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'atom) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'formula) in
    Obj.repr(
# 151 "parsetstp.mly"
                               ( eor (_1, _3) )
# 661 "parsetstp.ml"
               : 'formula))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'atom) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'formula) in
    Obj.repr(
# 152 "parsetstp.mly"
                               ( eimply (_1, _3) )
# 669 "parsetstp.ml"
               : 'formula))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'atom) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'formula) in
    Obj.repr(
# 153 "parsetstp.mly"
                               ( eequiv (_1, _3) )
# 677 "parsetstp.ml"
               : 'formula))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'atom) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'formula) in
    Obj.repr(
# 154 "parsetstp.mly"
                               ( eimply (_3, _1) )
# 685 "parsetstp.ml"
               : 'formula))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'atom) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'formula) in
    Obj.repr(
# 155 "parsetstp.mly"
                               ( enot (eequiv (_1, _3)) )
# 693 "parsetstp.ml"
               : 'formula))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'atom) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'formula) in
    Obj.repr(
# 156 "parsetstp.mly"
                               ( enot (eor (_1, _3)) )
# 701 "parsetstp.ml"
               : 'formula))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'atom) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'formula) in
    Obj.repr(
# 157 "parsetstp.mly"
                               ( enot (eand (_1, _3)) )
# 709 "parsetstp.ml"
               : 'formula))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'type_def) in
    Obj.repr(
# 160 "parsetstp.mly"
                                 ( _2 )
# 716 "parsetstp.ml"
               : 'type_def))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'tff_type_sig) in
    Obj.repr(
# 161 "parsetstp.mly"
                                 ( eapp (tvar_none "#", [tvar_none _1; _3]) )
# 724 "parsetstp.ml"
               : 'type_def))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 3 : 'var_list) in
    let _6 = (Parsing.peek_val __caml_parser_env 0 : 'atom) in
    Obj.repr(
# 165 "parsetstp.mly"
                                   ( mk_quant eall _3 _6 )
# 732 "parsetstp.ml"
               : 'atom))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 3 : 'var_list) in
    let _6 = (Parsing.peek_val __caml_parser_env 0 : 'atom) in
    Obj.repr(
# 167 "parsetstp.mly"
                                   ( mk_quant eex _3 _6 )
# 740 "parsetstp.ml"
               : 'atom))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'atom) in
    Obj.repr(
# 168 "parsetstp.mly"
                                   ( enot (_2) )
# 747 "parsetstp.ml"
               : 'atom))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'formula) in
    Obj.repr(
# 169 "parsetstp.mly"
                                   ( _2 )
# 754 "parsetstp.ml"
               : 'atom))
; (fun __caml_parser_env ->
    Obj.repr(
# 170 "parsetstp.mly"
                                   ( etrue )
# 760 "parsetstp.ml"
               : 'atom))
; (fun __caml_parser_env ->
    Obj.repr(
# 171 "parsetstp.mly"
                                   ( efalse )
# 766 "parsetstp.ml"
               : 'atom))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 172 "parsetstp.mly"
                                   ( _1 )
# 773 "parsetstp.ml"
               : 'atom))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'var_list) in
    Obj.repr(
# 175 "parsetstp.mly"
                                      ( (tvar (ns_var _1) type_iota) :: _3 )
# 781 "parsetstp.ml"
               : 'var_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 4 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _5 = (Parsing.peek_val __caml_parser_env 0 : 'var_list) in
    Obj.repr(
# 176 "parsetstp.mly"
                                      ( (tvar (ns_var _1) _3) :: _5 )
# 790 "parsetstp.ml"
               : 'var_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 177 "parsetstp.mly"
                                      ( [tvar (ns_var _1) type_iota] )
# 797 "parsetstp.ml"
               : 'var_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 178 "parsetstp.mly"
                                      ( [tvar (ns_var _1) _3] )
# 805 "parsetstp.ml"
               : 'var_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 181 "parsetstp.mly"
                                      ( earrow [_1] _3 )
# 813 "parsetstp.ml"
               : 'tff_type_arrow))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 3 : 'tff_tuple) in
    let _5 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 182 "parsetstp.mly"
                                      ( earrow _2 _5 )
# 821 "parsetstp.ml"
               : 'tff_type_arrow))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 185 "parsetstp.mly"
                          ( [_1] )
# 828 "parsetstp.ml"
               : 'tff_tuple))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'tff_tuple) in
    Obj.repr(
# 186 "parsetstp.mly"
                          (  _1 :: _3 )
# 836 "parsetstp.ml"
               : 'tff_tuple))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 190 "parsetstp.mly"
     ( _1 )
# 843 "parsetstp.ml"
               : 'tff_type_sig))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'tff_type_arrow) in
    Obj.repr(
# 192 "parsetstp.mly"
     ( _1 )
# 850 "parsetstp.ml"
               : 'tff_type_sig))
; (fun __caml_parser_env ->
    let _4 = (Parsing.peek_val __caml_parser_env 3 : 'tff_quant) in
    let _7 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 194 "parsetstp.mly"
     ( mk_quant eall _4 _7 )
# 858 "parsetstp.ml"
               : 'tff_type_sig))
; (fun __caml_parser_env ->
    let _4 = (Parsing.peek_val __caml_parser_env 5 : 'tff_quant) in
    let _8 = (Parsing.peek_val __caml_parser_env 1 : 'tff_type_arrow) in
    Obj.repr(
# 196 "parsetstp.mly"
     ( mk_quant eall _4 _8 )
# 866 "parsetstp.ml"
               : 'tff_type_sig))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 4 : string) in
    let _5 = (Parsing.peek_val __caml_parser_env 0 : 'tff_quant) in
    Obj.repr(
# 199 "parsetstp.mly"
                                        ( (tvar (ns_var _1) type_type) :: _5 )
# 874 "parsetstp.ml"
               : 'tff_quant))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : string) in
    Obj.repr(
# 200 "parsetstp.mly"
                                        ( [tvar (ns_var _1) type_type] )
# 881 "parsetstp.ml"
               : 'tff_quant))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'name_list) in
    Obj.repr(
# 203 "parsetstp.mly"
                                   ( _1 :: _3 )
# 889 "parsetstp.ml"
               : 'name_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 204 "parsetstp.mly"
                                   ( [_1] )
# 896 "parsetstp.ml"
               : 'name_list))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'disjunction) in
    Obj.repr(
# 208 "parsetstp.mly"
                                   ( _2 )
# 903 "parsetstp.ml"
               : 'cnf_formula))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'disjunction) in
    Obj.repr(
# 209 "parsetstp.mly"
                                   ( _1 )
# 910 "parsetstp.ml"
               : 'cnf_formula))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'atom) in
    Obj.repr(
# 213 "parsetstp.mly"
                                   ( [_1] )
# 917 "parsetstp.ml"
               : 'disjunction))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'disjunction) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'atom) in
    Obj.repr(
# 214 "parsetstp.mly"
                                   ( _3 :: _1 )
# 925 "parsetstp.ml"
               : 'disjunction))
; (fun __caml_parser_env ->
    Obj.repr(
# 218 "parsetstp.mly"
                 ( None )
# 931 "parsetstp.ml"
               : 'optional))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'source) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'optional_info) in
    Obj.repr(
# 219 "parsetstp.mly"
                             ( Some (_2) )
# 939 "parsetstp.ml"
               : 'optional))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'dag_source) in
    Obj.repr(
# 223 "parsetstp.mly"
             ( _1 )
# 946 "parsetstp.ml"
               : 'source))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'internal_source) in
    Obj.repr(
# 224 "parsetstp.mly"
                  ( Phrase.Other _1 )
# 953 "parsetstp.ml"
               : 'source))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'external_source) in
    Obj.repr(
# 225 "parsetstp.mly"
                  ( Phrase.File _1 )
# 960 "parsetstp.ml"
               : 'source))
; (fun __caml_parser_env ->
    Obj.repr(
# 226 "parsetstp.mly"
          ( Phrase.Other "unknown" )
# 966 "parsetstp.ml"
               : 'source))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'source_list) in
    Obj.repr(
# 227 "parsetstp.mly"
                                ( Phrase.List _2 )
# 973 "parsetstp.ml"
               : 'source))
; (fun __caml_parser_env ->
    Obj.repr(
# 231 "parsetstp.mly"
                 ( [] )
# 979 "parsetstp.ml"
               : 'source_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'source) in
    Obj.repr(
# 232 "parsetstp.mly"
         ( [_1] )
# 986 "parsetstp.ml"
               : 'source_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'source) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'source_list) in
    Obj.repr(
# 233 "parsetstp.mly"
                           ( _1 :: _3 )
# 994 "parsetstp.ml"
               : 'source_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 237 "parsetstp.mly"
         ( Phrase.Name _1 )
# 1001 "parsetstp.ml"
               : 'dag_source))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 7 : string) in
    let _5 = (Parsing.peek_val __caml_parser_env 5 : 'useful_info) in
    let _8 = (Parsing.peek_val __caml_parser_env 2 : 'source_list) in
    Obj.repr(
# 238 "parsetstp.mly"
                                                                                    ( Phrase.Inference (_3, _5, _8) )
# 1010 "parsetstp.ml"
               : 'dag_source))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _4 = (Parsing.peek_val __caml_parser_env 1 : 'optional_info) in
    Obj.repr(
# 242 "parsetstp.mly"
                                             ( _3 )
# 1018 "parsetstp.ml"
               : 'internal_source))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'file_source) in
    Obj.repr(
# 245 "parsetstp.mly"
              ( _1 )
# 1025 "parsetstp.ml"
               : 'external_source))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'theory) in
    Obj.repr(
# 246 "parsetstp.mly"
         ( _1 )
# 1032 "parsetstp.ml"
               : 'external_source))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'creator_source) in
    Obj.repr(
# 247 "parsetstp.mly"
                 ( _1 )
# 1039 "parsetstp.ml"
               : 'external_source))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _4 = (Parsing.peek_val __caml_parser_env 1 : 'file_info) in
    Obj.repr(
# 251 "parsetstp.mly"
                                   ( _3 )
# 1047 "parsetstp.ml"
               : 'file_source))
; (fun __caml_parser_env ->
    Obj.repr(
# 255 "parsetstp.mly"
               ( None )
# 1053 "parsetstp.ml"
               : 'file_info))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 256 "parsetstp.mly"
               ( Some (_2) )
# 1060 "parsetstp.ml"
               : 'file_info))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 2 : 'theory_name) in
    let _4 = (Parsing.peek_val __caml_parser_env 1 : 'optional_info) in
    Obj.repr(
# 260 "parsetstp.mly"
                                              ( "Theory" )
# 1068 "parsetstp.ml"
               : 'theory))
; (fun __caml_parser_env ->
    Obj.repr(
# 264 "parsetstp.mly"
     ( None  )
# 1074 "parsetstp.ml"
               : 'theory_name))
; (fun __caml_parser_env ->
    Obj.repr(
# 265 "parsetstp.mly"
           ( None )
# 1080 "parsetstp.ml"
               : 'theory_name))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _4 = (Parsing.peek_val __caml_parser_env 1 : 'optional_info) in
    Obj.repr(
# 269 "parsetstp.mly"
                                          ( "Creator" )
# 1088 "parsetstp.ml"
               : 'creator_source))
; (fun __caml_parser_env ->
    Obj.repr(
# 273 "parsetstp.mly"
               ( [] )
# 1094 "parsetstp.ml"
               : 'optional_info))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'useful_info) in
    Obj.repr(
# 274 "parsetstp.mly"
                    ( [_2] )
# 1101 "parsetstp.ml"
               : 'optional_info))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'info_items) in
    Obj.repr(
# 278 "parsetstp.mly"
                               ( _2 )
# 1108 "parsetstp.ml"
               : 'useful_info))
; (fun __caml_parser_env ->
    Obj.repr(
# 282 "parsetstp.mly"
               ( [] )
# 1114 "parsetstp.ml"
               : 'info_items))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'info_item) in
    Obj.repr(
# 283 "parsetstp.mly"
            ( [_1] )
# 1121 "parsetstp.ml"
               : 'info_items))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'info_item) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'info_items) in
    Obj.repr(
# 284 "parsetstp.mly"
                             ( _1 :: _3 )
# 1129 "parsetstp.ml"
               : 'info_items))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 288 "parsetstp.mly"
         ( Phrase.Cte _1 )
# 1136 "parsetstp.ml"
               : 'info_item))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 3 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 1 : 'info_items) in
    Obj.repr(
# 289 "parsetstp.mly"
                               ( Phrase.Fun (_1,_3) )
# 1144 "parsetstp.ml"
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
