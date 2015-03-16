type token =
  | ID of (string)
  | QID of (string)
  | STRING of (string)
  | TYPE
  | COLON
  | DOT
  | ARROW
  | DOUBLE_ARROW
  | LONG_ARROW
  | DEF
  | LPAREN
  | RPAREN
  | EOF
  | TRUE
  | FALSE
  | MUSTUSE
  | BEGINPROOF
  | BEGIN_TYPEALIAS
  | BEGIN_TY
  | BEGIN_VAR
  | BEGIN_HYP
  | END_TYPEALIAS
  | END_VAR
  | END_HYP
  | BEGINNAME of (string)
  | BEGINHEADER
  | ENDPROOF

val file :
  (Lexing.lexbuf  -> token) -> Lexing.lexbuf -> string * (Phrase.phrase * bool) list
