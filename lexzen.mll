(*  Copyright 2005 INRIA  *)
{
Version.add "$Id: lexzen.mll,v 1.10 2008-09-16 12:25:45 doligez Exp $";;

open Lexing;;
open Parsezen;;
open Printf;;

}

let newline = ('\010' | '\013' | "\013\010")
let space = [' ' '\009' '\012']
let idstart = ['A'-'Z' 'a'-'z' '_' '0'-'9']
let idchar =  ['A'-'Z' 'a'-'z' '0'-'9' '_' '\'' '.']
let stringchar = [^ '\000'-'\031' '\"' '\127'-'\255']

rule token = parse
  | '#' [^ '\010' '\013'] * { token lexbuf }
  | ';' [^ '\010' '\013'] * { token lexbuf }
  | newline     {
      lexbuf.lex_curr_p <- { lexbuf.lex_curr_p with
        pos_bol = lexbuf.lex_curr_p.pos_cnum;
        pos_lnum = lexbuf.lex_curr_p.pos_lnum + 1;
      };
      token lexbuf
    }
  | space +     { token lexbuf }
  | "("         { OPEN }
  | ")"         { CLOSE }
  | '$' ['0' - '9'] + {
      let s = Lexing.lexeme lexbuf in
      let i = int_of_string (String.sub s 1 (String.length s - 1)) in
      INT i
    }

  | "$def"      { DEF }
  | "$goal"     { GOAL }
  | "$hyp"      { HYP }
  | "$indset"   { INDSET }
  | "$indprop"  { INDPROP }
  | "$let"      { LET }
  | "$match"    { MATCH }
  | "$sig"      { SIG }
  | "$include"  { INCLUDE }

  | "-."        { NOT }
  | "/\\"       { AND }
  | "\\/"       { OR }
  | "=>"        { IMPLY }
  | "<="        { RIMPLY }
  | "<=>"       { EQUIV }
  | "T."        { TRUE }
  | "F."        { FALSE }
  | "A."        { ALL }
  | "E."        { EX }
  | "t."        { TAU }
  | "="         { EQUAL }

  | "\"" stringchar* "\"" {
      let s = Lexing.lexeme lexbuf in
      STRING (String.sub s 1 (String.length s - 2))
    }

  | idstart idchar* { IDENT (Lexing.lexeme lexbuf) }

  | eof         { EOF }
  | _ {
      let msg = sprintf "bad character %C" (Lexing.lexeme_char lexbuf 0) in
      raise (Error.Lex_error msg)
    }
