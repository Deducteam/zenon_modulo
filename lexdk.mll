(* Copyright 2005 INRIA *)
(* Copyright 2014 Ali Assaf *)
(* Copyright 2014 Raphaël Cauderlier *)
{
Version.add "$Id: lexdk.mll,v 1.16 2012-04-11 18:27:26 doligez Exp $";;

open Parsedk
let pos lexbuf = (Lexing.lexeme_start_p lexbuf, Lexing.lexeme_end_p lexbuf)

}
let id = (['_' '\'' '0'-'9' 'a'-'z' 'A'-'Z'])+
let qid = id '.' id
let space = [' ' '\t']

rule token = parse
| space { token lexbuf } (* skip blanks *)
| '\n' { Lexing.new_line lexbuf; token lexbuf }
| "(;" { comment (pos lexbuf) [] lexbuf }
| "cc.eT" { TERM }
| "cc.eP" { PROOF }
| "cc.Arrow" { CCARR }
| "dk_logic.true" { TRUE }
| "dk_logic.false" { FALSE }
| "dk_logic.not" { NOT }
| "dk_logic.and" { AND }
| "dk_logic.or" { OR }
| "dk_logic.imp" { IMP }
| "dk_logic.eqv" { EQV }
| "dk_logic.forall" { ALL }
| "dk_logic.exists" { EX }
| "dk_logic.eP" { PROOF }
| "dk_logic.ebP" { ISTRUE }
| "dk_builtins.prop" { PROP }
| id as id { ID(id) }
| qid as qid { QID(qid) }
| ":" { COLON }
| "." { DOT }
| "=>" { DOUBLE_ARROW }
| ":=" { DEF }
| "(" { LPAREN }
| ")" { RPAREN }

| "(;_MUST_USE_;)"        { MUSTUSE }

| "%%begin-auto-proof"                      { BEGINPROOF }
| "%%type:"                                 { BEGIN_TY }
| "%%begin-type-alias:"                     { BEGIN_TYPEALIAS }
| "%%begin-variable:"                       { BEGIN_VAR }
| "%%begin-hypothesis:"                     { BEGIN_HYP }
| "%%end-type-alias"                       { END_TYPEALIAS }
| "%%end-variable"                          { END_VAR }
| "%%end-hypothesis"                        { END_HYP }
| "%%name:" space* (id as name) space*      { BEGINNAME name }
| "%%" id ":"                               { BEGINHEADER }
| "%%end-auto-proof"                        { ENDPROOF }

| eof { EOF }
| _ { raise (Error.Lex_error "Invalid character") }
and comment current stack = parse
| "(;" { comment (pos lexbuf) (current :: stack) lexbuf }
| ";)" { match stack with [] -> token lexbuf | h :: t -> comment h t lexbuf }
| '\n' { Lexing.new_line lexbuf; comment current stack lexbuf }
| eof { raise (Error.Lex_error "This comment is not closed") }
| _ { comment current stack lexbuf }
