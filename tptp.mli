(*  Copyright 2004 INRIA  *)
(*  $Id: tptp.mli,v 1.7 2006-02-16 09:22:46 doligez Exp $  *)

open Phrase;;

val translate : string list -> tpphrase list -> phrase list * string;;
