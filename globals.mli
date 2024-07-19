(*  Copyright 1997 INRIA  *)
(*  $Id: globals.mli,v 1.15 2008-10-09 13:21:30 doligez Exp $  *)

val debug_flag : bool ref;;

val stats_flag : bool ref;;
val quiet_flag : bool ref;;
val size_limit : float ref;;
val step_limit : float ref;;
val time_limit : float ref;;
val short_flag : bool ref;;
val ctx_flag : bool ref;;
val random_flag : bool ref;;
val random_seed : int ref;;
val load_path : string ref;;
val namespace_flag : bool ref;;
val use_all_flag : bool ref;;

val inferences : int ref;;
val proof_nodes : int ref;;
val top_num_forms : int ref;;
val stored_lemmas : int ref;;
val num_expr : int ref;;

val output_dk : bool ref;;
val output_lp : bool ref;;
val modulo : bool ref;;
val modulo_heuri : bool ref;;
val modulo_heuri_simple : bool ref;;
val debug_rwrt : bool ref;;

val output_sig : bool ref;;
val signature_name : string ref;;
val conjecture : string ref;;
val check_axiom : bool ref;;

val begin_comment : unit -> string;;
val end_comment : unit -> string;;
