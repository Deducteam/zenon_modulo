(*  Copyright 1997 INRIA  *)
Version.add "$Id$";;

let debug_flag = ref false;;

let stats_flag = ref false;;
let quiet_flag = ref false;;
let size_limit = ref 1000_000_000.;;
let step_limit = ref 10_000.;;
let time_limit = ref 300.;;
let short_flag = ref false;;
let ctx_flag = ref false;;
let random_flag = ref false;;
let random_seed = ref 0;;
let load_path = ref Config.libdir;;
let namespace_flag = ref false;;
let use_all_flag = ref false;;

let inferences = ref 0;;
let proof_nodes = ref 0;;
let top_num_forms = ref 0;;
let stored_lemmas = ref 0;;
let num_expr = ref 0;;

let output_dk = ref false;;
let output_lp = ref false;;
let modulo = ref false;;
let modulo_heuri = ref false;;
let modulo_heuri_simple = ref false;;
let debug_rwrt = ref false;;

let output_sig = ref false;;
let signature_name = ref "";;
let lp_package = ref "";;
let conjecture = ref "";;
let check_axiom = ref false;;
let szs = ref false;;

let begin_comment() =
  if !output_dk then "(;"
  else if !output_lp then "/*"
  else "(*"

let end_comment() =
  if !output_dk then ";)"
  else if !output_lp then "*/"
  else "*)"

let has_a_conjecture = ref true
