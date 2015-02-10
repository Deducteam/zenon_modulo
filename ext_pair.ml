(* Extension for dealing with pairs. *)

(* This could be a special case of ext_induct but since it is easier,
   we prefer to have built-in pairs. *)

let newnodes e g _ = [];;
let make_inst m tern g = assert false;;
let add_formula e = ();;
let remove_formula e = ();;
let preprocess l = l;;
let add_phrase x = ();;
let postprocess l = l;;
let to_llproof tr_expr mlp args = assert false;;
let declare_context_coq oc = ();;
let p_rule_coq oc r = assert false;;
let predef () = [];;

Extension.register {
  Extension.name = "pair";
  Extension.newnodes = newnodes;
  Extension.make_inst = make_inst;
  Extension.add_formula = add_formula;
  Extension.remove_formula = remove_formula;
  Extension.iter_open = (fun _ -> false);
  Extension.preprocess = preprocess;
  Extension.add_phrase = add_phrase;
  Extension.postprocess = postprocess;
  Extension.to_llproof = to_llproof;
  Extension.declare_context_coq = declare_context_coq;
  Extension.p_rule_coq = p_rule_coq;
  Extension.predef = predef;
};;
