(*  Copyright 2004 INRIA  *)
(*  $Id: lltocoq.mli,v 1.9 2011-12-28 16:43:33 doligez Exp $  *)

val output :
  out_channel ->
  Phrase.phrase list ->
  Llproof.proof ->
    string list
;;

