tff(bool, type, bool: $tType).

tff(true, type, true: bool).

tff(false, type, false: bool).

tff(match_bool, type, match_bool: !>[A : $tType]: ((bool * A * A) > A)).

tff(match_bool_True, axiom, ![A : $tType]: ![Z:A, Z1:A]: (match_bool(A, true,
  Z, Z1) = Z)).

tff(match_bool_False, axiom, ![A : $tType]: ![Z:A, Z1:A]:
  (match_bool(A, false, Z, Z1) = Z1)).

tff(true_False, axiom, ~ (true = false)).

tff(bool_inversion, axiom, ![U:bool]: ((U = true) | (U = false))).

tff(andb, type, andb: (bool * bool) > bool).

tff(andb_def, axiom, ![Y:bool]: ((andb(true, Y) = Y) & (andb(false,
  Y) = false))).

tff(orb, type, orb: (bool * bool) > bool).

tff(orb_def, axiom, ![Y:bool]: ((orb(true, Y) = true) & (orb(false,
  Y) = Y))).

tff(xorb, type, xorb: (bool * bool) > bool).

tff(xorb_def, axiom, (((xorb(true, true) = false) & (xorb(false,
  true) = true)) & ((xorb(true, false) = true) & (xorb(false,
  false) = false)))).

tff(notb, type, notb: bool > bool).

tff(notb_def, axiom, ((notb(true) = false) & (notb(false) = true))).

tff(implb, type, implb: (bool * bool) > bool).

tff(implb_def, axiom, ![X:bool]: ((implb(X, true) = true) & ((implb(true,
  false) = false) & (implb(false, false) = true)))).

tff(compatOrderMult, axiom, ![X:$int, Y:$int, Z:$int]: ($lesseq(X,Y)
  => ($lesseq(0,Z) => $lesseq($product(X,Z),$product(Y,Z))))).

tff(abs, type, abs: $int > $int).

tff(abs_def, axiom, ![X:$int]: (($lesseq(0,X) => (abs(X) = X)) & (~
  $lesseq(0,X) => (abs(X) = $uminus(X))))).

tff(abs_le, axiom, ![X:$int, Y:$int]: ($lesseq(abs(X),Y)
  <=> ($lesseq($uminus(Y),X) & $lesseq(X,Y)))).

tff(abs_pos, axiom, ![X:$int]: $lesseq(0,abs(X))).

tff(div, type, div: ($int * $int) > $int).

tff(mod, type, mod: ($int * $int) > $int).

tff(div_mod, axiom, ![X:$int, Y:$int]: (~ (Y = 0)
  => (X = $sum($product(Y,div(X, Y)),mod(X, Y))))).

tff(div_bound, axiom, ![X:$int, Y:$int]: (($lesseq(0,X) & $less(0,Y))
  => ($lesseq(0,div(X, Y)) & $lesseq(div(X, Y),X)))).

tff(mod_bound, axiom, ![X:$int, Y:$int]: (~ (Y = 0)
  => ($less($uminus(abs(Y)),mod(X, Y)) & $less(mod(X, Y),abs(Y))))).

tff(div_sign_pos, axiom, ![X:$int, Y:$int]: (($lesseq(0,X) & $less(0,Y))
  => $lesseq(0,div(X, Y)))).

tff(div_sign_neg, axiom, ![X:$int, Y:$int]: (($lesseq(X,0) & $less(0,Y))
  => $lesseq(div(X, Y),0))).

tff(mod_sign_pos, axiom, ![X:$int, Y:$int]: (($lesseq(0,X) & ~ (Y = 0))
  => $lesseq(0,mod(X, Y)))).

tff(mod_sign_neg, axiom, ![X:$int, Y:$int]: (($lesseq(X,0) & ~ (Y = 0))
  => $lesseq(mod(X, Y),0))).

tff(rounds_toward_zero, axiom, ![X:$int, Y:$int]: (~ (Y = 0)
  => $lesseq(abs($product(div(X, Y),Y)),abs(X)))).

tff(div_1, axiom, ![X:$int]: (div(X, 1) = X)).

tff(mod_1, axiom, ![X:$int]: (mod(X, 1) = 0)).

tff(div_inf, axiom, ![X:$int, Y:$int]: (($lesseq(0,X) & $less(X,Y))
  => (div(X, Y) = 0))).

tff(mod_inf, axiom, ![X:$int, Y:$int]: (($lesseq(0,X) & $less(X,Y))
  => (mod(X, Y) = X))).

tff(div_mult, axiom, ![X:$int, Y:$int, Z:$int]: (($less(0,X) & ($lesseq(0,Y)
  & $lesseq(0,Z))) => (div($sum($product(X,Y),Z), X) = $sum(Y,div(Z, X))))).

tff(mod_mult, axiom, ![X:$int, Y:$int, Z:$int]: (($less(0,X) & ($lesseq(0,Y)
  & $lesseq(0,Z))) => (mod($sum($product(X,Y),Z), X) = mod(Z, X)))).

tff(set, type, set: $tType > $tType).

tff(mem, type, mem: !>[A : $tType]: ((A * set(A)) > $o)).

tff(infix_eqeq, type, infix_eqeq: !>[A : $tType]: ((set(A) * set(A)) > $o)).

tff(infix_eqeq_def, axiom, ![A : $tType]: ![S:set(A), T:set(A)]:
  (infix_eqeq(A, S, T) <=> ![X:A]: (mem(A, X, S) <=> mem(A, X, T)))).

tff(power, type, power: !>[A : $tType]: (set(A) > set(set(A)))).

tff(non_empty_power, type, non_empty_power: !>[A : $tType]: (set(A) >
  set(set(A)))).

tff(subset, type, subset: !>[A : $tType]: ((set(A) * set(A)) > $o)).

tff(subset_def, axiom, ![A : $tType]: ![S:set(A), T:set(A)]: (subset(A, S, T)
  <=> mem(set(A), S, power(A, T)))).

tff(subsetnoteq, type, subsetnoteq: !>[A : $tType]: ((set(A) * set(A)) >
  $o)).

tff(subsetnoteq_def, axiom, ![A : $tType]: ![S:set(A), T:set(A)]:
  (subsetnoteq(A, S, T) <=> (subset(A, S, T) & ~ infix_eqeq(A, S, T)))).

tff(empty, type, empty: !>[A : $tType]: set(A)).

tff(is_empty, type, is_empty: !>[A : $tType]: (set(A) > $o)).

tff(is_empty_def, axiom, ![A : $tType]: ![S:set(A)]: (is_empty(A, S) <=> ![X:
  A]: ~ mem(A, X, S))).

tff(empty_def1, axiom, ![A : $tType]: is_empty(A, empty(A))).

tff(empty1, axiom, ![A : $tType]: ![X:A]: ~ mem(A, X, empty(A))).

tff(add, type, add: !>[A : $tType]: ((A * set(A)) > set(A))).

tff(add_def1, axiom, ![A : $tType]: ![X:A, Y:A]: ![S:set(A)]: (mem(A, X,
  add(A, Y, S)) <=> ((X = Y) | mem(A, X, S)))).

tff(singleton, type, singleton: !>[A : $tType]: (A > set(A))).

tff(mem_singleton, axiom, ![A : $tType]: ![X:A, Y:A]: (mem(A, X,
  singleton(A, Y)) <=> (X = Y))).

tff(remove, type, remove: !>[A : $tType]: ((A * set(A)) > set(A))).

tff(remove_def1, axiom, ![A : $tType]: ![X:A, Y:A, S:set(A)]: (mem(A, X,
  remove(A, Y, S)) <=> (~ (X = Y) & mem(A, X, S)))).

tff(all, type, all: !>[A : $tType]: set(A)).

tff(all_def, axiom, ![A : $tType]: ![X:A]: mem(A, X, all(A))).

tff(union, type, union: !>[A : $tType]: ((set(A) * set(A)) > set(A))).

tff(mem_union, axiom, ![A : $tType]: ![S:set(A), T:set(A), X:A]: (mem(A, X,
  union(A, S, T)) <=> (mem(A, X, S) | mem(A, X, T)))).

tff(inter, type, inter: !>[A : $tType]: ((set(A) * set(A)) > set(A))).

tff(mem_inter, axiom, ![A : $tType]: ![S:set(A), T:set(A), X:A]: (mem(A, X,
  inter(A, S, T)) <=> (mem(A, X, S) & mem(A, X, T)))).

tff(diff, type, diff: !>[A : $tType]: ((set(A) * set(A)) > set(A))).

tff(mem_diff, axiom, ![A : $tType]: ![S:set(A), T:set(A), X:A]: (mem(A, X,
  diff(A, S, T)) <=> (mem(A, X, S) & ~ mem(A, X, T)))).

tff(b_bool, type, b_bool: set(bool)).

tff(mem_b_bool, axiom, ![X:bool]: mem(bool, X, b_bool)).

tff(integer, type, integer: set($int)).

tff(mem_integer, axiom, ![X:$int]: mem($int, X, integer)).

tff(natural, type, natural: set($int)).

tff(mem_natural, axiom, ![X:$int]: (mem($int, X, natural) <=> $lesseq(0,X))).

tff(natural1, type, natural1: set($int)).

tff(mem_natural1, axiom, ![X:$int]: (mem($int, X, natural1) <=> $less(0,X))).

tff(nat, type, nat: set($int)).

tff(mem_nat, axiom, ![X:$int]: (mem($int, X, nat) <=> ($lesseq(0,X)
  & $lesseq(X,2147483647)))).

tff(nat1, type, nat1: set($int)).

tff(mem_nat1, axiom, ![X:$int]: (mem($int, X, nat1) <=> ($less(0,X)
  & $lesseq(X,2147483647)))).

tff(bounded_int, type, bounded_int: set($int)).

tff(mem_bounded_int, axiom, ![X:$int]: (mem($int, X, bounded_int)
  <=> ($lesseq($uminus(2147483647),X) & $lesseq(X,2147483647)))).

tff(mk, type, mk: ($int * $int) > set($int)).

tff(mem_interval, axiom, ![X:$int, A:$int, B:$int]: (mem($int, X, mk(A, B))
  <=> ($lesseq(A,X) & $lesseq(X,B)))).

tff(tuple2, type, tuple2: ($tType * $tType) > $tType).

tff(tuple21, type, tuple21: !>[A : $tType, A1 : $tType]: ((A1 * A) >
  tuple2(A1, A))).

tff(tuple2_proj_1, type, tuple2_proj_1: !>[A : $tType, A1 : $tType]:
  (tuple2(A1, A) > A1)).

tff(tuple2_proj_1_def, axiom, ![A : $tType, A1 : $tType]: ![U:A1, U1:A]:
  (tuple2_proj_1(A, A1, tuple21(A, A1, U, U1)) = U)).

tff(tuple2_proj_2, type, tuple2_proj_2: !>[A : $tType, A1 : $tType]:
  (tuple2(A1, A) > A)).

tff(tuple2_proj_2_def, axiom, ![A : $tType, A1 : $tType]: ![U:A1, U1:A]:
  (tuple2_proj_2(A, A1, tuple21(A, A1, U, U1)) = U1)).

tff(tuple2_inversion, axiom, ![A : $tType, A1 : $tType]: ![U:tuple2(A1, A)]:
  (U = tuple21(A, A1, tuple2_proj_1(A, A1, U), tuple2_proj_2(A, A1, U)))).

tff(times, type, times: !>[A : $tType, B : $tType]: ((set(A) * set(B)) >
  set(tuple2(A, B)))).

tff(mem_times, axiom, ![A : $tType, B : $tType]: ![S:set(A), T:set(B), X:A,
  Y:B]: (mem(tuple2(A, B), tuple21(B, A, X, Y), times(A, B, S, T))
  <=> (mem(A, X, S) & mem(B, Y, T)))).

tff(mem_power, axiom, ![A : $tType]: ![S:set(A), T:set(A)]: (mem(set(A), S,
  power(A, T)) <=> ![X:A]: (mem(A, X, S) => mem(A, X, T)))).

tff(mem_non_empty_power, axiom, ![A : $tType]: ![S:set(A), T:set(A)]:
  (mem(set(A), S, non_empty_power(A, T)) <=> (![X:A]: (mem(A, X, S)
  => mem(A, X, T)) & ~ infix_eqeq(A, S, empty(A))))).

tff(choose, type, choose: !>[A : $tType]: (set(A) > A)).

tff(relation, type, relation: !>[A : $tType, B : $tType]: ((set(A) *
  set(B)) > set(set(tuple2(A, B))))).

tff(mem_relation, axiom, ![A : $tType, B : $tType]: ![U:set(A), V:set(B), R:
  set(tuple2(A, B))]: (mem(set(tuple2(A, B)), R, relation(A, B, U, V))
  <=> ![X:A, Y:B]: (mem(tuple2(A, B), tuple21(B, A, X, Y), R) => (mem(A, X,
  U) & mem(B, Y, V))))).

tff(inverse, type, inverse: !>[A : $tType, B : $tType]: (set(tuple2(A, B)) >
  set(tuple2(B, A)))).

tff(mem_inverse, axiom, ![A : $tType, B : $tType]: ![P:set(tuple2(A, B)), X:
  B, Y:A]: (mem(tuple2(B, A), tuple21(A, B, X, Y), inverse(A, B, P))
  <=> mem(tuple2(A, B), tuple21(B, A, Y, X), P))).

tff(dom, type, dom: !>[A : $tType, B : $tType]: (set(tuple2(A, B)) >
  set(A))).

tff(mem_dom, axiom, ![A : $tType, B : $tType]: ![P:set(tuple2(A, B)), X:A]:
  (mem(A, X, dom(A, B, P)) <=> ?[B1:B]: mem(tuple2(A, B), tuple21(B, A, X,
  B1), P))).

tff(ran, type, ran: !>[A : $tType, B : $tType]: (set(tuple2(A, B)) >
  set(B))).

tff(mem_ran, axiom, ![A : $tType, B : $tType]: ![P:set(tuple2(A, B)), X:B]:
  (mem(B, X, ran(A, B, P)) <=> ?[A1:A]: mem(tuple2(A, B), tuple21(B, A, A1,
  X), P))).

tff(semicolon, type, semicolon: !>[A : $tType, B : $tType, C : $tType]:
  ((set(tuple2(A, B)) * set(tuple2(B, C))) > set(tuple2(A, C)))).

tff(mem_semicolon, axiom, ![A : $tType, B : $tType, C : $tType]: ![P:
  set(tuple2(A, B)), Q:set(tuple2(B, C)), X:A, Y:C]:
  (mem(tuple2(A, C), tuple21(C, A, X, Y), semicolon(A, B, C, P, Q)) <=> ?[B1:
  B]: (mem(tuple2(A, B), tuple21(B, A, X, B1), P)
  & mem(tuple2(B, C), tuple21(C, B, B1, Y), Q)))).

tff(semicolon_back, type, semicolon_back: !>[A : $tType, B : $tType,
  C : $tType]: ((set(tuple2(B, C)) * set(tuple2(A, B))) >
  set(tuple2(A, C)))).

tff(semicolon_back1, axiom, ![A : $tType, B : $tType, C : $tType]: ![P:
  set(tuple2(A, B)), Q:set(tuple2(B, C))]: (semicolon_back(A, B, C, Q,
  P) = semicolon(A, B, C, P, Q))).

tff(id, type, id: !>[A : $tType]: (set(A) > set(tuple2(A, A)))).

tff(mem_id, axiom, ![A : $tType]: ![U:set(A), X:A, Y:A]:
  (mem(tuple2(A, A), tuple21(A, A, X, Y), id(A, U)) <=> (mem(A, X, U)
  & (X = Y)))).

tff(domain_restriction, type, domain_restriction: !>[A : $tType, B : $tType]:
  ((set(A) * set(tuple2(A, B))) > set(tuple2(A, B)))).

tff(mem_domain_restriction, axiom, ![A : $tType, B : $tType]: ![P:
  set(tuple2(A, B)), S:set(A), X:A, Y:B]: (mem(tuple2(A, B), tuple21(B, A, X,
  Y), domain_restriction(A, B, S, P)) <=> (mem(tuple2(A, B), tuple21(B, A, X,
  Y), P) & mem(A, X, S)))).

tff(range_restriction, type, range_restriction: !>[A : $tType, B : $tType]:
  ((set(tuple2(A, B)) * set(B)) > set(tuple2(A, B)))).

tff(mem_range_restriction, axiom, ![A : $tType, B : $tType]: ![P:
  set(tuple2(A, B)), T:set(B), X:A, Y:B]: (mem(tuple2(A, B), tuple21(B, A, X,
  Y), range_restriction(A, B, P, T)) <=> (mem(tuple2(A, B), tuple21(B, A, X,
  Y), P) & mem(B, Y, T)))).

tff(domain_substraction, type, domain_substraction: !>[A : $tType,
  B : $tType]: ((set(A) * set(tuple2(A, B))) > set(tuple2(A, B)))).

tff(mem_domain_substraction, axiom, ![A : $tType, B : $tType]: ![P:
  set(tuple2(A, B)), S:set(A), X:A, Y:B]: (mem(tuple2(A, B), tuple21(B, A, X,
  Y), domain_substraction(A, B, S, P)) <=> (mem(tuple2(A, B), tuple21(B,
  A, X, Y), P) & ~ mem(A, X, S)))).

tff(range_substraction, type, range_substraction: !>[A : $tType, B : $tType]:
  ((set(tuple2(A, B)) * set(B)) > set(tuple2(A, B)))).

tff(mem_range_substraction, axiom, ![A : $tType, B : $tType]: ![P:
  set(tuple2(A, B)), T:set(B), X:A, Y:B]: (mem(tuple2(A, B), tuple21(B, A, X,
  Y), range_substraction(A, B, P, T)) <=> (mem(tuple2(A, B), tuple21(B, A, X,
  Y), P) & ~ mem(B, Y, T)))).

tff(image, type, image: !>[A : $tType, B : $tType]: ((set(tuple2(A, B)) *
  set(A)) > set(B))).

tff(mem_image, axiom, ![A : $tType, B : $tType]: ![P:set(tuple2(A, B)), W:
  set(A), X:B]: (mem(B, X, image(A, B, P, W)) <=> ?[A1:A]: (mem(A, A1, W)
  & mem(tuple2(A, B), tuple21(B, A, A1, X), P)))).

tff(infix_lspl, type, infix_lspl: !>[A : $tType, B : $tType]:
  ((set(tuple2(A, B)) * set(tuple2(A, B))) > set(tuple2(A, B)))).

tff(mem_overriding, axiom, ![A : $tType, B : $tType]: ![Q:set(tuple2(A, B)),
  P:set(tuple2(A, B)), X:A, Y:B]: (mem(tuple2(A, B), tuple21(B, A, X, Y),
  infix_lspl(A, B, Q, P)) <=> ((mem(tuple2(A, B), tuple21(B, A, X, Y), Q) & ~
  mem(A, X, dom(A, B, P))) | mem(tuple2(A, B), tuple21(B, A, X, Y), P)))).

tff(direct_product, type, direct_product: !>[A : $tType, B : $tType,
  C : $tType]: ((set(tuple2(A, B)) * set(tuple2(A, C))) >
  set(tuple2(A, tuple2(B, C))))).

tff(mem_direct_product, axiom, ![A : $tType, B : $tType, C : $tType]: ![F:
  set(tuple2(A, B)), G:set(tuple2(A, C)), X:A, Y:B, Z:C]:
  (mem(tuple2(A, tuple2(B, C)), tuple21(tuple2(B, C), A, X, tuple21(C, B, Y,
  Z)), direct_product(A, B, C, F, G)) <=> (mem(tuple2(A, B), tuple21(B, A, X,
  Y), F) & mem(tuple2(A, C), tuple21(C, A, X, Z), G)))).

tff(prj1, type, prj1: !>[A : $tType, B : $tType]: (tuple2(set(A), set(B)) >
  set(tuple2(tuple2(A, B), A)))).

tff(mem_proj_op_1, axiom, ![A : $tType, B : $tType]: ![S:set(A), T:set(B), X:
  A, Y:B, Z:A]: (mem(tuple2(tuple2(A, B), A), tuple21(A,
  tuple2(A, B), tuple21(B, A, X, Y), Z), prj1(A, B, tuple21(set(B),
  set(A), S, T))) <=> (mem(tuple2(tuple2(A, B), A), tuple21(A,
  tuple2(A, B), tuple21(B, A, X, Y), Z), times(tuple2(A, B), A, times(A,
  B, S, T), S)) & (Z = X)))).

tff(prj2, type, prj2: !>[A : $tType, B : $tType]: (tuple2(set(A), set(B)) >
  set(tuple2(tuple2(A, B), B)))).

tff(mem_proj_op_2, axiom, ![A : $tType, B : $tType]: ![S:set(A), T:set(B), X:
  A, Y:B, Z:B]: (mem(tuple2(tuple2(A, B), B), tuple21(B,
  tuple2(A, B), tuple21(B, A, X, Y), Z), prj2(A, B, tuple21(set(B),
  set(A), S, T))) <=> (mem(tuple2(tuple2(A, B), B), tuple21(B,
  tuple2(A, B), tuple21(B, A, X, Y), Z), times(tuple2(A, B), B, times(A,
  B, S, T), T)) & (Z = Y)))).

tff(parallel_product, type, parallel_product: !>[A : $tType, B : $tType,
  C : $tType, D : $tType]: ((set(tuple2(A, B)) * set(tuple2(C, D))) >
  set(tuple2(tuple2(A, C), tuple2(B, D))))).

tff(mem_parallel_product, axiom, ![A : $tType, B : $tType, C : $tType,
  D : $tType]: ![H:set(tuple2(A, B)), K:set(tuple2(C, D)), X:A, Y:C, Z:B, W:
  D]: (mem(tuple2(tuple2(A, C), tuple2(B, D)), tuple21(tuple2(B, D),
  tuple2(A, C), tuple21(C, A, X, Y), tuple21(D, B, Z, W)),
  parallel_product(A, B, C, D, H, K)) <=> (mem(tuple2(A, B), tuple21(B, A, X,
  Z), H) & mem(tuple2(C, D), tuple21(D, C, Y, W), K)))).

tff(infix_plmngt, type, infix_plmngt: !>[A : $tType, B : $tType]: ((set(A) *
  set(B)) > set(set(tuple2(A, B))))).

tff(mem_partial_function_set, axiom, ![A : $tType, B : $tType]: ![S:set(A),
  T:set(B), F:set(tuple2(A, B))]: (mem(set(tuple2(A, B)), F, infix_plmngt(A,
  B, S, T)) <=> (mem(set(tuple2(A, B)), F, relation(A, B, S, T)) & ![X:A, Y1:
  B, Y2:B]: ((mem(tuple2(A, B), tuple21(B, A, X, Y1), F)
  & mem(tuple2(A, B), tuple21(B, A, X, Y2), F)) => (Y1 = Y2))))).

tff(infix_mnmngt, type, infix_mnmngt: !>[A : $tType, B : $tType]: ((set(A) *
  set(B)) > set(set(tuple2(A, B))))).

tff(mem_total_function_set, axiom, ![A : $tType, B : $tType]: ![S:set(A), T:
  set(B), X:set(tuple2(A, B))]: (mem(set(tuple2(A, B)), X, infix_mnmngt(A,
  B, S, T)) <=> (mem(set(tuple2(A, B)), X, infix_plmngt(A, B, S, T))
  & infix_eqeq(A, dom(A, B, X), S)))).

tff(infix_gtplgt, type, infix_gtplgt: !>[A : $tType, B : $tType]: ((set(A) *
  set(B)) > set(set(tuple2(A, B))))).

tff(mem_partial_injection_set, axiom, ![A : $tType, B : $tType]: ![S:
  set(A), T:set(B), X:set(tuple2(A, B))]: (mem(set(tuple2(A, B)), X,
  infix_gtplgt(A, B, S, T)) <=> (mem(set(tuple2(A, B)), X, infix_plmngt(A,
  B, S, T)) & mem(set(tuple2(B, A)), inverse(A, B, X), infix_plmngt(B, A, T,
  S))))).

tff(infix_gtmngt, type, infix_gtmngt: !>[A : $tType, B : $tType]: ((set(A) *
  set(B)) > set(set(tuple2(A, B))))).

tff(mem_total_injection_set, axiom, ![A : $tType, B : $tType]: ![S:set(A), T:
  set(B), X:set(tuple2(A, B))]: (mem(set(tuple2(A, B)), X, infix_gtmngt(A,
  B, S, T)) <=> (mem(set(tuple2(A, B)), X, infix_gtplgt(A, B, S, T))
  & mem(set(tuple2(A, B)), X, infix_mnmngt(A, B, S, T))))).

tff(infix_plmngtgt, type, infix_plmngtgt: !>[A : $tType, B : $tType]:
  ((set(A) * set(B)) > set(set(tuple2(A, B))))).

tff(mem_partial_surjection_set, axiom, ![A : $tType, B : $tType]: ![S:
  set(A), T:set(B), X:set(tuple2(A, B))]: (mem(set(tuple2(A, B)), X,
  infix_plmngtgt(A, B, S, T)) <=> (mem(set(tuple2(A, B)), X, infix_plmngt(A,
  B, S, T)) & infix_eqeq(B, ran(A, B, X), T)))).

tff(infix_mnmngtgt, type, infix_mnmngtgt: !>[A : $tType, B : $tType]:
  ((set(A) * set(B)) > set(set(tuple2(A, B))))).

tff(mem_total_surjection_set, axiom, ![A : $tType, B : $tType]: ![S:set(A),
  T:set(B), X:set(tuple2(A, B))]: (mem(set(tuple2(A, B)), X,
  infix_mnmngtgt(A, B, S, T)) <=> (mem(set(tuple2(A, B)), X,
  infix_plmngtgt(A, B, S, T)) & mem(set(tuple2(A, B)), X, infix_mnmngt(A,
  B, S, T))))).

tff(infix_gtplgtgt, type, infix_gtplgtgt: !>[A : $tType, B : $tType]:
  ((set(A) * set(B)) > set(set(tuple2(A, B))))).

tff(mem_partial_bijection_set, axiom, ![A : $tType, B : $tType]: ![S:
  set(A), T:set(B), X:set(tuple2(A, B))]: (mem(set(tuple2(A, B)), X,
  infix_gtplgtgt(A, B, S, T)) <=> (mem(set(tuple2(A, B)), X, infix_gtplgt(A,
  B, S, T)) & mem(set(tuple2(A, B)), X, infix_plmngtgt(A, B, S, T))))).

tff(infix_gtmngtgt, type, infix_gtmngtgt: !>[A : $tType, B : $tType]:
  ((set(A) * set(B)) > set(set(tuple2(A, B))))).

tff(mem_total_bijection_set, axiom, ![A : $tType, B : $tType]: ![S:set(A), T:
  set(B), X:set(tuple2(A, B))]: (mem(set(tuple2(A, B)), X, infix_gtmngtgt(A,
  B, S, T)) <=> (mem(set(tuple2(A, B)), X, infix_gtmngt(A, B, S, T))
  & mem(set(tuple2(A, B)), X, infix_mnmngtgt(A, B, S, T))))).

tff(apply, type, apply: !>[A : $tType, B : $tType]: ((set(tuple2(A, B)) *
  A) > B)).

tff(apply_def0, axiom, ![A : $tType, B : $tType]: ![F:set(tuple2(A, B)), S:
  set(A), T:set(B), A1:A]: ((mem(set(tuple2(A, B)), F, infix_plmngt(A, B, S,
  T)) & mem(A, A1, dom(A, B, F))) => mem(tuple2(A, B), tuple21(B, A, A1,
  apply(A, B, F, A1)), F))).

tff(apply_def2, axiom, ![A : $tType, B : $tType]: ![F:set(tuple2(A, B)), S:
  set(A), T:set(B), A1:A, B1:B]: ((mem(set(tuple2(A, B)), F, infix_plmngt(A,
  B, S, T)) & mem(tuple2(A, B), tuple21(B, A, A1, B1), F)) => (apply(A, B, F,
  A1) = B1))).

tff(seq_length, type, seq_length: !>[A : $tType]: (($int * set(A)) >
  set(set(tuple2($int, A))))).

tff(seq_length_def, axiom, ![A : $tType]: ![N:$int, S:set(A)]:
  (seq_length(A, N, S) = infix_mnmngt($int, A, mk(1, N), S))).

tff(size, type, size: !>[A : $tType]: (set(tuple2($int, A)) > $int)).

tff(size_def, axiom, ![A : $tType]: ![N:$int, S:set(A), R:
  set(tuple2($int, A))]: (($lesseq(0,N) & mem(set(tuple2($int, A)), R,
  seq_length(A, N, S))) => (size(A, R) = N))).

tff(seq, type, seq: !>[A : $tType]: (set(A) > set(set(tuple2($int, A))))).

tff(seq_def, axiom, ![A : $tType]: ![S:set(A), R:set(tuple2($int, A))]:
  (mem(set(tuple2($int, A)), R, seq(A, S)) <=> ($lesseq(0,size(A, R))
  & mem(set(tuple2($int, A)), R, seq_length(A, size(A, R), S))))).

tff(seq1, type, seq1: !>[A : $tType]: (set(A) > set(set(tuple2($int, A))))).

tff(iseq, type, iseq: !>[A : $tType]: (set(A) > set(set(tuple2($int, A))))).

tff(iseq1, type, iseq1: !>[A : $tType]: (set(A) >
  set(set(tuple2($int, A))))).

tff(perm, type, perm: !>[A : $tType]: (set(A) > set(set(tuple2($int, A))))).

tff(insert_in_front, type, insert_in_front: !>[A : $tType]: ((A *
  set(tuple2($int, A))) > set(tuple2($int, A)))).

tff(insert_at_tail, type, insert_at_tail: !>[A : $tType]:
  ((set(tuple2($int, A)) * A) > set(tuple2($int, A)))).

tff(tail, type, tail: !>[A : $tType]: (set(tuple2($int, A)) >
  set(tuple2($int, A)))).

tff(last, type, last: !>[A : $tType]: (set(tuple2($int, A)) > A)).

tff(first, type, first: !>[A : $tType]: (set(tuple2($int, A)) > A)).

tff(front, type, front: !>[A : $tType]: (set(tuple2($int, A)) >
  set(tuple2($int, A)))).

tff(concatenation, type, concatenation: !>[A : $tType]:
  ((set(tuple2($int, A)) * set(tuple2($int, A))) > set(tuple2($int, A)))).

tff(conc, type, conc: !>[A : $tType]:
  (set(tuple2($int, set(tuple2($int, A)))) > set(tuple2($int, A)))).

tff(is_finite_subset, type, is_finite_subset: !>[A : $tType]: ((set(A) *
  set(A) * $int) > $o)).

tff(empty2, axiom, ![A : $tType]: ![S:set(A)]: is_finite_subset(A, empty(A),
  S, 0)).

tff(add_mem, axiom, ![A : $tType]: ![X:A, S1:set(A), S2:set(A), C:$int]:
  (is_finite_subset(A, S1, S2, C) => (mem(A, X, S2) => (mem(A, X, S1)
  => is_finite_subset(A, add(A, X, S1), S2, C))))).

tff(add_notmem, axiom, ![A : $tType]: ![X:A, S1:set(A), S2:set(A), C:$int]:
  (is_finite_subset(A, S1, S2, C) => (mem(A, X, S2) => (~ mem(A, X, S1)
  => is_finite_subset(A, add(A, X, S1), S2, $sum(C,1)))))).

tff(is_finite_subset_inversion, axiom, ![A : $tType]: ![Z:set(A), Z1:
  set(A), Z2:$int]: (is_finite_subset(A, Z, Z1, Z2) => ((?[S:set(A)]:
  (((Z = empty(A)) & (Z1 = S)) & (Z2 = 0)) | ?[X:A, S1:set(A), S2:set(A), C:
  $int]: (is_finite_subset(A, S1, S2, C) & (mem(A, X, S2) & (mem(A, X, S1)
  & (((Z = add(A, X, S1)) & (Z1 = S2)) & (Z2 = C)))))) | ?[X:A, S1:set(A),
  S2:set(A), C:$int]: (is_finite_subset(A, S1, S2, C) & (mem(A, X, S2) & (~
  mem(A, X, S1) & (((Z = add(A, X, S1)) & (Z1 = S2))
  & (Z2 = $sum(C,1))))))))).

tff(finite_subsets, type, finite_subsets: !>[A : $tType]: (set(A) >
  set(set(A)))).

tff(finite_subsets_def, axiom, ![A : $tType]: ![S:set(A), X:set(A)]:
  (mem(set(A), X, finite_subsets(A, S)) <=> ?[C:$int]: is_finite_subset(A, X,
  S, C))).

tff(non_empty_finite_subsets, type, non_empty_finite_subsets: !>[A : $tType]:
  (set(A) > set(set(A)))).

tff(non_empty_finite_subsets_def, axiom, ![A : $tType]: ![S:set(A), X:
  set(A)]: (mem(set(A), X, non_empty_finite_subsets(A, S)) <=> ?[C:$int]:
  (is_finite_subset(A, X, S, C) & ~ infix_eqeq(A, X, empty(A))))).

tff(card, type, card: !>[A : $tType]: (set(A) > $int)).

tff(card_def, axiom, ![A : $tType]: ![S:set(A), X:set(A), C:$int]:
  (is_finite_subset(A, X, S, C) => (card(A, X) = C))).

tff(min, type, min: set($int) > $int).

tff(min_belongs, axiom, ![S:set($int)]: ((subset($int, S, natural) & ~
  infix_eqeq($int, S, empty($int))) => mem($int, min(S), S))).

tff(min_is_min, axiom, ![S:set($int), X:$int]: ((subset($int, S, natural)
  & mem($int, X, S)) => $lesseq(min(S),X))).

tff(max, type, max: set($int) > $int).

tff(max_belongs, axiom, ![S:set($int)]: (mem(set($int), S,
  non_empty_finite_subsets($int, natural)) => mem($int, max(S), S))).

tff(max_is_max, axiom, ![S:set($int), X:$int]: ((mem(set($int), S,
  finite_subsets($int, natural)) & mem($int, X, S)) => $lesseq(X,max(S)))).

tff(iterate, type, iterate: !>[A : $tType]:
  (tuple2(set(tuple2(A, A)), $int) > set(tuple2(A, A)))).

tff(iterate_def, axiom, ![A : $tType]: ![A1:set(tuple2(A, A)), B:$int]:
  (((B = 0) => (iterate(A, tuple21($int, set(tuple2(A, A)), A1,
  B)) = id(A, dom(A, A, A1)))) & (~ (B = 0) => (iterate(A, tuple21($int,
  set(tuple2(A, A)), A1, B)) = semicolon(A, A, A, iterate(A, tuple21($int,
  set(tuple2(A, A)), A1, $difference(B,1))), A1))))).

tff(closure, type, closure: !>[A : $tType]: (set(tuple2(A, A)) >
  set(tuple2(A, A)))).

tff(closure_def, axiom, ![A : $tType]: ![A1:set(tuple2(A, A)), U:
  tuple2(A, A)]: (mem(tuple2(A, A), U, closure(A, A1)) <=> ?[X:$int]:
  ($lesseq(0,X) & mem(tuple2(A, A), U, iterate(A, tuple21($int,
  set(tuple2(A, A)), A1, X)))))).

tff(closure1, type, closure1: !>[A : $tType]: (set(tuple2(A, A)) >
  set(tuple2(A, A)))).

tff(closure1_def, axiom, ![A : $tType]: ![A1:set(tuple2(A, A)), U:
  tuple2(A, A)]: (mem(tuple2(A, A), U, closure1(A, A1)) <=> ?[X:$int]:
  ($less(0,X) & mem(tuple2(A, A), U, iterate(A, tuple21($int,
  set(tuple2(A, A)), A1, X)))))).

tff(generalized_union, type, generalized_union: !>[A : $tType]:
  (set(set(A)) > set(A))).

tff(generalized_union_def, axiom, ![A : $tType]: ![A1:set(set(A)), X:A]:
  (mem(A, X, generalized_union(A, A1)) <=> ?[B:set(A)]: (mem(set(A), B, A1)
  & mem(A, X, B)))).

tff(uninterpreted_type, type, uninterpreted_type: $tType).

tff(enum_aa, type, enum_aa: $tType).

tff(e_bb, type, e_bb: enum_aa).

tff(e_cc, type, e_cc: enum_aa).

tff(e_dd, type, e_dd: enum_aa).

tff(e_ee, type, e_ee: enum_aa).

tff(e_ff, type, e_ff: enum_aa).

tff(e_gg, type, e_gg: enum_aa).

tff(e_hh, type, e_hh: enum_aa).

tff(e_ii, type, e_ii: enum_aa).

tff(match_enum_aa, type, match_enum_aa: !>[A : $tType]: ((enum_aa * A * A *
  A * A * A * A * A * A) > A)).

tff(match_enum_aa_E_bb, axiom, ![A : $tType]: ![Z:A, Z1:A, Z2:A, Z3:A, Z4:A,
  Z5:A, Z6:A, Z7:A]: (match_enum_aa(A, e_bb, Z, Z1, Z2, Z3, Z4, Z5, Z6,
  Z7) = Z)).

tff(match_enum_aa_E_cc, axiom, ![A : $tType]: ![Z:A, Z1:A, Z2:A, Z3:A, Z4:A,
  Z5:A, Z6:A, Z7:A]: (match_enum_aa(A, e_cc, Z, Z1, Z2, Z3, Z4, Z5, Z6,
  Z7) = Z1)).

tff(match_enum_aa_E_dd, axiom, ![A : $tType]: ![Z:A, Z1:A, Z2:A, Z3:A, Z4:A,
  Z5:A, Z6:A, Z7:A]: (match_enum_aa(A, e_dd, Z, Z1, Z2, Z3, Z4, Z5, Z6,
  Z7) = Z2)).

tff(match_enum_aa_E_ee, axiom, ![A : $tType]: ![Z:A, Z1:A, Z2:A, Z3:A, Z4:A,
  Z5:A, Z6:A, Z7:A]: (match_enum_aa(A, e_ee, Z, Z1, Z2, Z3, Z4, Z5, Z6,
  Z7) = Z3)).

tff(match_enum_aa_E_ff, axiom, ![A : $tType]: ![Z:A, Z1:A, Z2:A, Z3:A, Z4:A,
  Z5:A, Z6:A, Z7:A]: (match_enum_aa(A, e_ff, Z, Z1, Z2, Z3, Z4, Z5, Z6,
  Z7) = Z4)).

tff(match_enum_aa_E_gg, axiom, ![A : $tType]: ![Z:A, Z1:A, Z2:A, Z3:A, Z4:A,
  Z5:A, Z6:A, Z7:A]: (match_enum_aa(A, e_gg, Z, Z1, Z2, Z3, Z4, Z5, Z6,
  Z7) = Z5)).

tff(match_enum_aa_E_hh, axiom, ![A : $tType]: ![Z:A, Z1:A, Z2:A, Z3:A, Z4:A,
  Z5:A, Z6:A, Z7:A]: (match_enum_aa(A, e_hh, Z, Z1, Z2, Z3, Z4, Z5, Z6,
  Z7) = Z6)).

tff(match_enum_aa_E_ii, axiom, ![A : $tType]: ![Z:A, Z1:A, Z2:A, Z3:A, Z4:A,
  Z5:A, Z6:A, Z7:A]: (match_enum_aa(A, e_ii, Z, Z1, Z2, Z3, Z4, Z5, Z6,
  Z7) = Z7)).

tff(e_bb_E_cc, axiom, ~ (e_bb = e_cc)).

tff(e_bb_E_dd, axiom, ~ (e_bb = e_dd)).

tff(e_bb_E_ee, axiom, ~ (e_bb = e_ee)).

tff(e_bb_E_ff, axiom, ~ (e_bb = e_ff)).

tff(e_bb_E_gg, axiom, ~ (e_bb = e_gg)).

tff(e_bb_E_hh, axiom, ~ (e_bb = e_hh)).

tff(e_bb_E_ii, axiom, ~ (e_bb = e_ii)).

tff(e_cc_E_dd, axiom, ~ (e_cc = e_dd)).

tff(e_cc_E_ee, axiom, ~ (e_cc = e_ee)).

tff(e_cc_E_ff, axiom, ~ (e_cc = e_ff)).

tff(e_cc_E_gg, axiom, ~ (e_cc = e_gg)).

tff(e_cc_E_hh, axiom, ~ (e_cc = e_hh)).

tff(e_cc_E_ii, axiom, ~ (e_cc = e_ii)).

tff(e_dd_E_ee, axiom, ~ (e_dd = e_ee)).

tff(e_dd_E_ff, axiom, ~ (e_dd = e_ff)).

tff(e_dd_E_gg, axiom, ~ (e_dd = e_gg)).

tff(e_dd_E_hh, axiom, ~ (e_dd = e_hh)).

tff(e_dd_E_ii, axiom, ~ (e_dd = e_ii)).

tff(e_ee_E_ff, axiom, ~ (e_ee = e_ff)).

tff(e_ee_E_gg, axiom, ~ (e_ee = e_gg)).

tff(e_ee_E_hh, axiom, ~ (e_ee = e_hh)).

tff(e_ee_E_ii, axiom, ~ (e_ee = e_ii)).

tff(e_ff_E_gg, axiom, ~ (e_ff = e_gg)).

tff(e_ff_E_hh, axiom, ~ (e_ff = e_hh)).

tff(e_ff_E_ii, axiom, ~ (e_ff = e_ii)).

tff(e_gg_E_hh, axiom, ~ (e_gg = e_hh)).

tff(e_gg_E_ii, axiom, ~ (e_gg = e_ii)).

tff(e_hh_E_ii, axiom, ~ (e_hh = e_ii)).

tff(enum_aa_inversion, axiom, ![U:enum_aa]: ((((((((U = e_bb) | (U = e_cc))
  | (U = e_dd)) | (U = e_ee)) | (U = e_ff)) | (U = e_gg)) | (U = e_hh))
  | (U = e_ii))).

tff(set_enum_aa, type, set_enum_aa: set(enum_aa)).

tff(set_enum_aa_axiom, axiom, ![X:enum_aa]: mem(enum_aa, X, set_enum_aa)).

tff(f1, type, f1: (enum_aa * $int * bool * bool * bool * bool * $int * $int *
  $int * $int * $int * enum_aa * $int * bool * bool * bool * bool * $int *
  $int * $int * $int * $int * $int * $int * $int * set($int) * set($int) *
  set($int) * set($int) * $int * $int * $int * $int * $int * $int * $int *
  $int * $int * $int * $int * $int) > $o).

tff(f1_def, axiom, ![V_zz:enum_aa, V_yy:$int, V_xx:bool, V_ww:bool, V_vv:
  bool, V_uu:bool, V_tt:$int, V_ss:$int, V_rr:$int, V_qq:$int, V_pp:$int,
  V_oo:enum_aa, V_nn:$int, V_mm:bool, V_ll:bool, V_kk:bool, V_jj:bool,
  V_bbxx:$int, V_bbww:$int, V_bbvv:$int, V_bbuu:$int, V_bbtt:$int, V_bbss:
  $int, V_bbrr:$int, V_bbqq:$int, V_bbpp:set($int), V_bboo:set($int), V_bbnn:
  set($int), V_bbmm:set($int), V_bbll:$int, V_bbkk:$int, V_bbjj:$int, V_bbii:
  $int, V_bbhh:$int, V_bbgg:$int, V_bbff:$int, V_bbee:$int, V_bbdd:$int,
  V_bbcc:$int, V_bbbb:$int, V_bbaa:$int]: (f1(V_zz, V_yy, V_xx, V_ww, V_vv,
  V_uu, V_tt, V_ss, V_rr, V_qq, V_pp, V_oo, V_nn, V_mm, V_ll, V_kk, V_jj,
  V_bbxx, V_bbww, V_bbvv, V_bbuu, V_bbtt, V_bbss, V_bbrr, V_bbqq, V_bbpp,
  V_bboo, V_bbnn, V_bbmm, V_bbll, V_bbkk, V_bbjj, V_bbii, V_bbhh, V_bbgg,
  V_bbff, V_bbee, V_bbdd, V_bbcc, V_bbbb, V_bbaa)
  <=> (((((((((((((((((((((((((((((((((((((((((((($true & (V_bbtt = 0))
  & (V_bbuu = 1)) & mem($int, V_bbvv, integer)) & $lesseq(0,V_bbvv))
  & $lesseq(V_bbvv,2147483647)) & mem($int, V_bbww, integer))
  & $lesseq(0,V_bbww)) & $lesseq(V_bbww,2147483647)) & mem($int, V_bbxx,
  integer)) & $lesseq(0,V_bbxx)) & $lesseq(V_bbxx,2147483647))
  & mem($int, V_bbii, integer)) & $lesseq(0,V_bbii))
  & $lesseq(V_bbii,2147483647)) & $lesseq(1,V_bbii)) & $lesseq(V_bbii,254))
  & (V_bbii = V_bbww)) & mem($int, V_bbhh, integer)) & $lesseq(0,V_bbhh))
  & $lesseq(V_bbhh,2147483647)) & $lesseq(1,V_bbhh)) & $lesseq(V_bbhh,254))
  & (V_bbhh = V_bbww)) & mem($int, V_bbgg, integer)) & $lesseq(0,V_bbgg))
  & $lesseq(V_bbgg,2147483647)) & $lesseq(1,V_bbgg))
  & $lesseq($sum(V_bbgg,1),2147483647)) & (V_bbgg = V_bbxx))
  & mem($int, V_bbff, integer)) & $lesseq(0,V_bbff))
  & $lesseq(V_bbff,2147483647)) & $lesseq(2,V_bbff)) & (V_bbff = V_bbvv))
  & $lesseq($sum(V_bbff,V_bbhh),253))
  & $lesseq($sum($sum(V_bbff,V_bbii),V_bbhh),251)) & mem($int, V_bbjj,
  integer)) & $lesseq(0,V_bbjj)) & $lesseq(V_bbjj,2147483647))
  & $lesseq(1,V_bbjj)) & $lesseq($sum(V_bbjj,1),254)) & (V_bbjj = V_bbvv))
  & $true) & $true))).

tff(f2, type, f2: (enum_aa * $int * bool * bool * bool * bool * $int * $int *
  $int * $int * $int * enum_aa * $int * bool * bool * bool * bool * $int *
  $int * $int * $int * $int * $int * $int * $int * set($int) * set($int) *
  set($int) * set($int) * $int * $int * $int * $int * $int * $int * $int *
  $int * $int * $int * $int * $int) > $o).

tff(f2_def, axiom, ![V_zz:enum_aa, V_yy:$int, V_xx:bool, V_ww:bool, V_vv:
  bool, V_uu:bool, V_tt:$int, V_ss:$int, V_rr:$int, V_qq:$int, V_pp:$int,
  V_oo:enum_aa, V_nn:$int, V_mm:bool, V_ll:bool, V_kk:bool, V_jj:bool,
  V_bbxx:$int, V_bbww:$int, V_bbvv:$int, V_bbuu:$int, V_bbtt:$int, V_bbss:
  $int, V_bbrr:$int, V_bbqq:$int, V_bbpp:set($int), V_bboo:set($int), V_bbnn:
  set($int), V_bbmm:set($int), V_bbll:$int, V_bbkk:$int, V_bbjj:$int, V_bbii:
  $int, V_bbhh:$int, V_bbgg:$int, V_bbff:$int, V_bbee:$int, V_bbdd:$int,
  V_bbcc:$int, V_bbbb:$int, V_bbaa:$int]: (f2(V_zz, V_yy, V_xx, V_ww, V_vv,
  V_uu, V_tt, V_ss, V_rr, V_qq, V_pp, V_oo, V_nn, V_mm, V_ll, V_kk, V_jj,
  V_bbxx, V_bbww, V_bbvv, V_bbuu, V_bbtt, V_bbss, V_bbrr, V_bbqq, V_bbpp,
  V_bboo, V_bbnn, V_bbmm, V_bbll, V_bbkk, V_bbjj, V_bbii, V_bbhh, V_bbgg,
  V_bbff, V_bbee, V_bbdd, V_bbcc, V_bbbb, V_bbaa) <=> ((((((((((((((((($true
  & $true) & $true) & $true) & $true) & mem($int, V_yy, integer))
  & $lesseq(0,V_yy)) & $true) & mem($int, V_bbaa, integer))
  & $lesseq(0,V_bbaa)) & mem($int, V_bbbb, integer)) & $lesseq(0,V_bbbb))
  & mem($int, V_bbcc, integer)) & $lesseq(0,V_bbcc)) & mem($int, V_bbdd,
  integer)) & $lesseq(0,V_bbdd)) & mem($int, V_bbee, integer))
  & $lesseq(0,V_bbee)))).

tff(f3, type, f3: (enum_aa * $int * bool * bool * bool * bool * $int * $int *
  $int * $int * $int * enum_aa * $int * bool * bool * bool * bool * $int *
  $int * $int * $int * $int * $int * $int * $int * set($int) * set($int) *
  set($int) * set($int) * $int * $int * $int * $int * $int * $int * $int *
  $int * $int * $int * $int * $int) > $o).

tff(f3_def, axiom, ![V_zz:enum_aa, V_yy:$int, V_xx:bool, V_ww:bool, V_vv:
  bool, V_uu:bool, V_tt:$int, V_ss:$int, V_rr:$int, V_qq:$int, V_pp:$int,
  V_oo:enum_aa, V_nn:$int, V_mm:bool, V_ll:bool, V_kk:bool, V_jj:bool,
  V_bbxx:$int, V_bbww:$int, V_bbvv:$int, V_bbuu:$int, V_bbtt:$int, V_bbss:
  $int, V_bbrr:$int, V_bbqq:$int, V_bbpp:set($int), V_bboo:set($int), V_bbnn:
  set($int), V_bbmm:set($int), V_bbll:$int, V_bbkk:$int, V_bbjj:$int, V_bbii:
  $int, V_bbhh:$int, V_bbgg:$int, V_bbff:$int, V_bbee:$int, V_bbdd:$int,
  V_bbcc:$int, V_bbbb:$int, V_bbaa:$int]: (f3(V_zz, V_yy, V_xx, V_ww, V_vv,
  V_uu, V_tt, V_ss, V_rr, V_qq, V_pp, V_oo, V_nn, V_mm, V_ll, V_kk, V_jj,
  V_bbxx, V_bbww, V_bbvv, V_bbuu, V_bbtt, V_bbss, V_bbrr, V_bbqq, V_bbpp,
  V_bboo, V_bbnn, V_bbmm, V_bbll, V_bbkk, V_bbjj, V_bbii, V_bbhh, V_bbgg,
  V_bbff, V_bbee, V_bbdd, V_bbcc, V_bbbb, V_bbaa)
  <=> (((((((((((((((((((((((((((((((((((((((((((((((((((((((((((($true
  & mem($int, V_yy, integer)) & $lesseq(0,V_yy)) & mem(set($int), V_bbmm,
  power($int, natural))) & mem(set($int), V_bbnn, power($int, natural)))
  & mem(set($int), V_bboo, power($int, natural))) & mem(set($int), V_bbpp,
  power($int, natural))) & $true) & mem($int, V_bbaa, integer))
  & $lesseq(0,V_bbaa)) & mem($int, V_bbbb, integer)) & $lesseq(0,V_bbbb))
  & mem($int, V_bbcc, integer)) & $lesseq(0,V_bbcc)) & mem($int, V_bbdd,
  integer)) & $lesseq(0,V_bbdd)) & mem($int, V_bbee, integer))
  & $lesseq(0,V_bbee)) & (mem(enum_aa, V_zz,
  union(enum_aa, union(enum_aa, union(enum_aa, union(enum_aa, union(enum_aa, union(enum_aa, singleton(enum_aa, e_cc),
  singleton(enum_aa, e_dd)), singleton(enum_aa, e_ee)),
  singleton(enum_aa, e_ff)), singleton(enum_aa, e_gg)),
  singleton(enum_aa, e_hh)), singleton(enum_aa, e_ii))) => mem($int, V_bbaa,
  mk(1, V_yy)))) & ((V_zz = e_cc) => mem(set($int), mk(V_bbaa, V_yy),
  power($int, V_bbnn)))) & ((V_zz = e_cc)
  => $lesseq($difference($sum(V_yy,1),V_bbaa),V_bbjj))) & (mem(enum_aa, V_zz,
  union(enum_aa, union(enum_aa, union(enum_aa, union(enum_aa, union(enum_aa, singleton(enum_aa, e_dd),
  singleton(enum_aa, e_ee)), singleton(enum_aa, e_ff)),
  singleton(enum_aa, e_gg)), singleton(enum_aa, e_hh)),
  singleton(enum_aa, e_ii))) => ((((mem($int, V_bbaa, mk(1, V_yy))
  & mem($int, V_bbbb, mk(V_bbaa, V_yy))) & mem(set($int), mk(V_bbaa, V_bbbb),
  power($int, V_bbnn))) & ~ mem($int, $sum(V_bbbb,1), V_bbnn))
  & ($difference(V_bbbb,V_bbaa) = V_bbjj)))) & ((V_zz = e_dd)
  => ((V_bbbb = V_yy) & mem($int, V_yy, V_bbnn)))) & (mem(enum_aa, V_zz,
  union(enum_aa, union(enum_aa, union(enum_aa, union(enum_aa, singleton(enum_aa, e_ee),
  singleton(enum_aa, e_ff)), singleton(enum_aa, e_gg)),
  singleton(enum_aa, e_hh)), singleton(enum_aa, e_ii)))
  => ((((mem($int, V_bbaa, mk(1, V_yy)) & mem($int, V_bbbb, mk(V_bbaa,
  V_yy))) & mem(set($int), mk(V_bbaa, V_bbbb), power($int, V_bbnn)))
  & ($difference(V_bbbb,V_bbaa) = V_bbjj))
  & mem(set($int), mk($sum(V_bbbb,1), V_yy),
  power($int, union($int, union($int, union($int, V_bbmm, V_bbnn), V_bboo),
  V_bbpp)))))) & ((V_zz = e_ee) => ((V_bbcc = V_yy)
  & mem(set($int), mk($sum(V_bbbb,1), V_yy), power($int, union($int, V_bbnn,
  V_bbpp)))))) & (mem(enum_aa, V_zz,
  union(enum_aa, union(enum_aa, union(enum_aa, union(enum_aa, singleton(enum_aa, e_ee),
  singleton(enum_aa, e_ff)), singleton(enum_aa, e_gg)),
  singleton(enum_aa, e_hh)), singleton(enum_aa, e_ii)))
  => ((($lesseq($sum(V_bbbb,1),V_yy) & mem($int, V_bbcc, mk(V_bbbb, V_yy)))
  & $lesseq($difference($difference(V_bbcc,V_bbbb),1),V_bbii))
  & mem(set($int), mk($sum(V_bbbb,1), V_bbcc),
  power($int, union($int, V_bbnn, V_bbpp)))))) & ((V_zz = e_ff)
  => (V_bbdd = V_yy))) & (mem(enum_aa, V_zz,
  union(enum_aa, union(enum_aa, union(enum_aa, singleton(enum_aa, e_ff),
  singleton(enum_aa, e_gg)), singleton(enum_aa, e_hh)),
  singleton(enum_aa, e_ii))) => (mem($int, V_bbdd, mk(V_bbcc, V_yy))
  & mem(set($int), mk($sum(V_bbcc,1), V_bbdd), power($int, V_bbpp)))))
  & ((V_zz = e_gg) => mem(set($int), mk($sum(V_bbdd,1), V_yy),
  power($int, union($int, union($int, union($int, V_bbmm, V_bbnn), V_bboo),
  V_bbpp))))) & ((V_zz = e_gg) => ((((mem($int, V_bbee, mk(V_bbdd, V_yy))
  & mem($int, V_bbee, mk($difference(V_yy,1), V_yy)))
  & mem(set($int), mk($sum(V_bbdd,1), V_bbee),
  power($int, union($int, union($int, union($int, V_bbmm, V_bbnn), V_bboo),
  V_bbpp)))) & mem(set($int), mk($sum(V_bbee,1), V_yy), power($int, V_bbmm)))
  & ~ mem($int, V_bbee, V_bbmm)))) & ((V_zz = e_gg) => ~
  mem(set($int), mk($difference(V_yy,1), V_yy), power($int, V_bbmm))))
  & (mem(enum_aa, V_zz, union(enum_aa, singleton(enum_aa, e_gg),
  singleton(enum_aa, e_hh))) => ![V_bbqq1:$int, V_bbrr1:$int]:
  (((mem($int, V_bbqq1, mk($sum(V_bbdd,1), V_yy)) & mem($int, V_bbrr1,
  mk($sum(V_bbdd,1), V_yy))) & mem(set($int), mk(V_bbqq1, V_bbrr1),
  power($int, V_bbmm)))
  => $lesseq($sum($difference(V_bbrr1,V_bbqq1),1),V_bbff))))
  & (mem(enum_aa, V_zz,
  union(enum_aa, union(enum_aa, singleton(enum_aa, e_gg),
  singleton(enum_aa, e_hh)), singleton(enum_aa, e_ii))) => (~
  mem($int, $sum(V_bbdd,1), V_bbpp) & $lesseq($sum(V_bbdd,1),V_yy))))
  & (mem(enum_aa, V_zz, union(enum_aa, singleton(enum_aa, e_hh),
  singleton(enum_aa, e_ii))) => ((mem($int, V_bbee, mk(V_bbdd, V_yy))
  & mem(set($int), mk($sum(V_bbee,1), V_yy), power($int, V_bbmm)))
  & mem(set($int), mk($sum(V_bbdd,1), V_bbee),
  power($int, union($int, union($int, union($int, V_bbmm, V_bbnn), V_bboo),
  V_bbpp)))))) & ((V_zz = e_hh) => ($lesseq(V_bbee,V_yy) & ~
  mem($int, V_bbee, V_bbmm)))) & ((V_zz = e_hh)
  => $lesseq($difference($difference(V_yy,1),V_bbee),V_bbff)))
  & (mem(enum_aa, V_zz, union(enum_aa, singleton(enum_aa, e_hh),
  singleton(enum_aa, e_ii)))
  => $lesseq($difference($difference(V_bbee,V_bbdd),1),V_bbhh)))
  & ((V_zz = e_ii) => (![V_bbqq1:$int, V_bbrr1:$int]: (((mem($int, V_bbqq1,
  mk($sum(V_bbdd,1), V_bbee)) & mem($int, V_bbrr1, mk($sum(V_bbdd,1),
  V_bbee))) & mem(set($int), mk(V_bbqq1, V_bbrr1), power($int, V_bbmm)))
  => $lesseq($sum($difference(V_bbrr1,V_bbqq1),1),V_bbff))
  & mem($int, $difference($difference(V_yy,V_bbee),1), mk(V_bbff,
  $sum(V_bbff,V_bbgg)))))) & $true) & $true) & $true) & $true) & ![V_bbss1:
  $int]: (((mem($int, V_bbss1, integer) & $lesseq(0,V_bbss1))
  & $lesseq($sum(V_yy,1),V_bbss1)) => ~ mem($int, V_bbss1, V_bbmm)))
  & ![V_bbss1:$int]: (((mem($int, V_bbss1, integer) & $lesseq(0,V_bbss1))
  & $lesseq($sum(V_yy,1),V_bbss1)) => ~ mem($int, V_bbss1, V_bbnn)))
  & ![V_bbss1:$int]: (((mem($int, V_bbss1, integer) & $lesseq(0,V_bbss1))
  & $lesseq($sum(V_yy,1),V_bbss1)) => ~ mem($int, V_bbss1, V_bboo)))
  & ![V_bbss1:$int]: (((mem($int, V_bbss1, integer) & $lesseq(0,V_bbss1))
  & $lesseq($sum(V_yy,1),V_bbss1)) => ~ mem($int, V_bbss1, V_bbpp)))
  & infix_eqeq($int, inter($int, V_bbnn, V_bbmm), empty($int)))
  & infix_eqeq($int, inter($int, V_bboo, V_bbmm), empty($int)))
  & infix_eqeq($int, inter($int, V_bbpp, V_bbmm), empty($int))) & $true)
  & (V_jj = V_uu)) & (V_kk = V_vv)) & (V_ll = V_ww)) & (V_mm = V_xx))
  & (V_nn = V_yy)) & (V_oo = V_zz)) & (V_pp = V_bbaa)) & (V_qq = V_bbbb))
  & (V_rr = V_bbcc)) & (V_ss = V_bbdd)) & (V_tt = V_bbee)))).

tff(f15, type, f15: (enum_aa * $int * bool * bool * bool * bool * $int *
  $int * $int * $int * $int * enum_aa * $int * bool * bool * bool * bool *
  $int * $int * $int * $int * $int * $int * $int * $int * set($int) *
  set($int) * set($int) * set($int) * $int * $int * $int * $int * $int *
  $int * $int * $int * $int * $int * $int * $int) > $o).

tff(f15_def, axiom, ![V_zz:enum_aa, V_yy:$int, V_xx:bool, V_ww:bool, V_vv:
  bool, V_uu:bool, V_tt:$int, V_ss:$int, V_rr:$int, V_qq:$int, V_pp:$int,
  V_oo:enum_aa, V_nn:$int, V_mm:bool, V_ll:bool, V_kk:bool, V_jj:bool,
  V_bbxx:$int, V_bbww:$int, V_bbvv:$int, V_bbuu:$int, V_bbtt:$int, V_bbss:
  $int, V_bbrr:$int, V_bbqq:$int, V_bbpp:set($int), V_bboo:set($int), V_bbnn:
  set($int), V_bbmm:set($int), V_bbll:$int, V_bbkk:$int, V_bbjj:$int, V_bbii:
  $int, V_bbhh:$int, V_bbgg:$int, V_bbff:$int, V_bbee:$int, V_bbdd:$int,
  V_bbcc:$int, V_bbbb:$int, V_bbaa:$int]: (f15(V_zz, V_yy, V_xx, V_ww, V_vv,
  V_uu, V_tt, V_ss, V_rr, V_qq, V_pp, V_oo, V_nn, V_mm, V_ll, V_kk, V_jj,
  V_bbxx, V_bbww, V_bbvv, V_bbuu, V_bbtt, V_bbss, V_bbrr, V_bbqq, V_bbpp,
  V_bboo, V_bbnn, V_bbmm, V_bbll, V_bbkk, V_bbjj, V_bbii, V_bbhh, V_bbgg,
  V_bbff, V_bbee, V_bbdd, V_bbcc, V_bbbb, V_bbaa)
  <=> ((((((((((((((((((((((((((((((((((((((((((((((((((((($true & ~
  (V_zz = e_bb)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_dd))
  & $lesseq(V_bbjj,$difference($sum(V_yy,1),V_bbaa))) & (V_zz = e_cc))
  & (V_uu = true)) & (V_vv = true)) & (V_ww = false)) & (V_xx = false))
  & mem($int, $sum(V_yy,1), integer)) & $lesseq(0,$sum(V_yy,1))) & $true) & ~
  (((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_hh))
  & (V_zz = e_ii)) & ($sum(V_yy,1) = V_bbbb)) & ~ ((((V_uu = false)
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = true)
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & ~ ((((V_uu = true)
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = false)
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & (e_dd = e_bb))) & ~
  (((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_hh))
  & (V_zz = e_ii)) & ($sum(V_yy,1) = V_bbbb)) & (V_uu = false))
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false)) & (e_dd = e_bb))) & ~
  (((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_hh))
  & (V_zz = e_ii)) & ($sum(V_yy,1) = V_bbbb)) & (V_uu = true))
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false)) & (e_dd = e_bb))) & ~
  (((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_hh))
  & (V_zz = e_ii)) & ($sum(V_yy,1) = V_bbbb)) & (V_uu = true))
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false)) & (e_dd = e_bb))) & ~
  (((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_hh))
  & (V_zz = e_ii)) & ($sum(V_yy,1) = V_bbbb)) & (V_uu = false))
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false)) & (~
  $lesseq($sum($difference(V_yy,V_bbee),1),$sum(V_bbff,V_bbgg))
  & (e_dd = e_bb)))) & ~ (((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~
  (V_zz = e_ii)) & (V_zz = e_hh)) & ($sum(V_yy,1) = V_bbbb)) & ~
  ((((V_uu = false) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~
  ((((V_uu = true) & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & ~
  ((((V_uu = true) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~
  ((((V_uu = false) & (V_vv = true)) & (V_ww = false)) & (V_xx = false)))
  & (e_dd = e_bb))) & ~ ((((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~
  (V_zz = e_ii)) & (V_zz = e_hh)) & ($sum(V_yy,1) = V_bbbb))
  & (V_uu = false)) & (V_vv = true)) & (V_ww = false)) & (V_xx = false))
  & (e_dd = e_gg)) & (V_bbee = $sum(V_yy,1)))) & ~ ((((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ii)) & (V_zz = e_hh))
  & ($sum(V_yy,1) = V_bbbb)) & (V_uu = true)) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false)) & (e_dd = e_gg))
  & (V_bbee = $sum(V_yy,1)))) & ~ ((((((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ii)) & (V_zz = e_hh))
  & ($sum(V_yy,1) = V_bbbb)) & (V_uu = true)) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false)) & (e_dd = e_gg))
  & (V_bbee = $sum(V_yy,1)))) & ~ (((((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ii)) & (V_zz = e_hh))
  & ($sum(V_yy,1) = V_bbbb)) & (V_uu = false)) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false)) & (~
  $lesseq($sum($difference($difference($sum(V_yy,1),V_bbee),1),1),V_bbff)
  & (e_dd = e_ii)))) & ~ (((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & (V_zz = e_gg)) & ($sum(V_yy,1) = V_bbbb)) & ~
  ((((V_uu = false) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~
  ((((V_uu = true) & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & ~
  ((((V_uu = true) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~
  ((((V_uu = false) & (V_vv = true)) & (V_ww = false)) & (V_xx = false)))
  & (e_dd = e_bb))) & ~ (((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & (V_zz = e_gg)) & ($sum(V_yy,1) = V_bbbb))
  & (V_uu = false)) & (V_vv = true)) & (V_ww = false)) & (V_xx = false))
  & (($lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)
  & ((e_dd = e_gg) & (V_bbee = $sum(V_yy,1)))) | (~
  $lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)
  & (e_dd = e_bb))))) & ~ (((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & (V_zz = e_gg)) & ($sum(V_yy,1) = V_bbbb)) & (V_uu = true))
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false))
  & (($lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)
  & ((e_dd = e_gg) & (V_bbee = $sum(V_yy,1)))) | (~
  $lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)
  & (e_dd = e_bb))))) & ~ (((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & (V_zz = e_gg)) & ($sum(V_yy,1) = V_bbbb)) & (V_uu = true))
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false))
  & (($lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)
  & ((e_dd = e_gg) & (V_bbee = $sum(V_yy,1)))) | (~
  $lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)
  & (e_dd = e_bb))))) & ~ (((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & (V_zz = e_gg)) & ($sum(V_yy,1) = V_bbbb))
  & (V_uu = false)) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))
  & (($lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)
  & (e_dd = e_hh)) | (~
  $lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)
  & (e_dd = e_bb))))) & ~ (((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & (V_zz = e_gg)) & ($sum(V_yy,1) = V_bbbb)) & (e_dd = e_bb))
  & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = true)) & (V_xx = false)))
  & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = false)) & (V_xx = false)))
  & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = true)) & (V_xx = false)))
  & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false)))) & ~ (((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & (V_zz = e_gg)) & ($sum(V_yy,1) = V_bbbb)) & (e_dd = e_bb))
  & (V_uu = false)) & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & ~
  (((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh))
  & (V_zz = e_gg)) & ($sum(V_yy,1) = V_bbbb)) & (e_dd = e_bb))
  & (V_uu = true)) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~
  (((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh))
  & (V_zz = e_gg)) & ($sum(V_yy,1) = V_bbbb)) & (e_dd = e_bb))
  & (V_uu = true)) & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & ~
  (((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh))
  & (V_zz = e_gg)) & ($sum(V_yy,1) = V_bbbb)) & (e_dd = e_bb))
  & (V_uu = false)) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~
  (((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg))
  & (V_zz = e_ff)) & ($sum(V_yy,1) = V_bbbb)) & ~ ((((V_uu = false)
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = true)
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & ~ ((((V_uu = true)
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = false)
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & (e_dd = e_bb))) & ~
  (((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg))
  & (V_zz = e_ff)) & ($sum(V_yy,1) = V_bbbb)) & (V_uu = true))
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false)) & (e_dd = e_bb))) & ~
  (((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg))
  & (V_zz = e_ff)) & ($sum(V_yy,1) = V_bbbb)) & (V_uu = true))
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false)) & (e_dd = e_bb))) & ~
  ((((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg))
  & (V_zz = e_ff)) & ($sum(V_yy,1) = V_bbbb)) & (V_uu = false))
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false)) & (e_dd = e_gg))
  & (V_bbee = V_yy))) & ~ (((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~
  (V_zz = e_ff)) & (V_zz = e_ee)) & ($sum(V_yy,1) = V_bbbb)) & ~
  ((((V_uu = false) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~
  ((((V_uu = true) & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & ~
  ((((V_uu = true) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~
  ((((V_uu = false) & (V_vv = true)) & (V_ww = false)) & (V_xx = false)))
  & (e_dd = e_bb))) & ~ (((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~
  (V_zz = e_ff)) & (V_zz = e_ee)) & ($sum(V_yy,1) = V_bbbb))
  & (V_uu = false)) & (V_vv = true)) & (V_ww = false)) & (V_xx = false))
  & (($lesseq($sum($difference($difference($sum(V_bbcc,1),V_bbbb),1),1),V_bbii)
  & ((V_bbcc = $sum(V_yy,1)) & (e_dd = e_ee))) | (~
  $lesseq($sum($difference($difference($sum(V_bbcc,1),V_bbbb),1),1),V_bbii)
  & ((V_bbdd = $sum(V_yy,1)) & (e_dd = e_ff)))))) & ~ (((((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff)) & (V_zz = e_ee))
  & ($sum(V_yy,1) = V_bbbb)) & (V_uu = true)) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false)) & (e_dd = e_gg)) & (V_bbdd = V_bbcc))
  & (V_bbee = $sum(V_yy,1)))) & ~ (((((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ff)) & (V_zz = e_ee))
  & ($sum(V_yy,1) = V_bbbb)) & (V_uu = true)) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false))
  & (($lesseq($sum($difference($difference($sum(V_bbcc,1),V_bbbb),1),1),V_bbii)
  & ((V_bbcc = $sum(V_yy,1)) & (e_dd = e_ee))) | (~
  $lesseq($sum($difference($difference($sum(V_bbcc,1),V_bbbb),1),1),V_bbii)
  & (e_dd = e_bb))))) & ~ (((((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc))
  & ~ (V_zz = e_dd)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg))
  & ~ (V_zz = e_ff)) & (V_zz = e_ee)) & ($sum(V_yy,1) = V_bbbb))
  & (V_uu = false)) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))
  & (e_dd = e_gg)) & (V_bbdd = V_bbcc)) & (V_bbee = V_yy))) & ~
  (((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ee))
  & (V_zz = e_dd)) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))) & (e_dd = e_bb)) & ($sum(V_yy,1) = V_bbbb))) & ~
  ((((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ee))
  & (V_zz = e_dd)) & (V_uu = false)) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false)) & (V_bbcc = $sum(V_yy,1))) & (e_dd = e_ee))
  & ($sum(V_yy,1) = V_bbbb))) & ~ ((((((((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_ee)) & (V_zz = e_dd)) & (V_uu = true))
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false)) & (e_dd = e_gg))
  & (V_bbcc = V_bbbb)) & (V_bbdd = V_bbbb)) & (V_bbee = $sum(V_yy,1)))
  & ($sum(V_yy,1) = V_bbbb))) & ~ ((((((((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_ee)) & (V_zz = e_dd)) & (V_uu = false))
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false)) & (e_dd = e_gg))
  & (V_bbcc = V_bbbb)) & (V_bbdd = V_bbbb)) & (V_bbee = V_yy))
  & ($sum(V_yy,1) = V_bbbb))) & ~ ((((((((((((~ (V_zz = e_ii) & ~
  (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_dd)) & (V_zz = e_cc)) & ~ ((((V_uu = false) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = false) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false))) & (e_dd = e_bb))
  & ($sum(V_yy,1) = V_bbbb))) & ~ ((((((((((((~ (V_zz = e_ii) & ~
  (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_dd)) & (V_zz = e_cc)) & (V_uu = false)) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false)) & (e_dd = e_bb))
  & ($sum(V_yy,1) = V_bbbb))) & ~ ((((((((((((~ (V_zz = e_ii) & ~
  (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_dd)) & (V_zz = e_cc)) & (V_uu = true)) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false)) & (e_dd = e_bb))
  & ($sum(V_yy,1) = V_bbbb))) & ~ (((((((((((~ (V_zz = e_ii) & ~
  (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_dd)) & (V_zz = e_cc)) & (V_uu = true)) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false))
  & $lesseq(V_bbjj,$difference($sum(V_yy,1),V_bbaa)))))).

tff(f18, type, f18: (enum_aa * $int * bool * bool * bool * bool * $int *
  $int * $int * $int * $int * enum_aa * $int * bool * bool * bool * bool *
  $int * $int * $int * $int * $int * $int * $int * $int * set($int) *
  set($int) * set($int) * set($int) * $int * $int * $int * $int * $int *
  $int * $int * $int * $int * $int * $int * $int) > $o).

tff(f18_def, axiom, ![V_zz:enum_aa, V_yy:$int, V_xx:bool, V_ww:bool, V_vv:
  bool, V_uu:bool, V_tt:$int, V_ss:$int, V_rr:$int, V_qq:$int, V_pp:$int,
  V_oo:enum_aa, V_nn:$int, V_mm:bool, V_ll:bool, V_kk:bool, V_jj:bool,
  V_bbxx:$int, V_bbww:$int, V_bbvv:$int, V_bbuu:$int, V_bbtt:$int, V_bbss:
  $int, V_bbrr:$int, V_bbqq:$int, V_bbpp:set($int), V_bboo:set($int), V_bbnn:
  set($int), V_bbmm:set($int), V_bbll:$int, V_bbkk:$int, V_bbjj:$int, V_bbii:
  $int, V_bbhh:$int, V_bbgg:$int, V_bbff:$int, V_bbee:$int, V_bbdd:$int,
  V_bbcc:$int, V_bbbb:$int, V_bbaa:$int]: (f18(V_zz, V_yy, V_xx, V_ww, V_vv,
  V_uu, V_tt, V_ss, V_rr, V_qq, V_pp, V_oo, V_nn, V_mm, V_ll, V_kk, V_jj,
  V_bbxx, V_bbww, V_bbvv, V_bbuu, V_bbtt, V_bbss, V_bbrr, V_bbqq, V_bbpp,
  V_bboo, V_bbnn, V_bbmm, V_bbll, V_bbkk, V_bbjj, V_bbii, V_bbhh, V_bbgg,
  V_bbff, V_bbee, V_bbdd, V_bbcc, V_bbbb, V_bbaa)
  <=> ($sum(V_yy,1) = V_bbbb))).

tff(f19, type, f19: (enum_aa * $int * bool * bool * bool * bool * $int *
  $int * $int * $int * $int * enum_aa * $int * bool * bool * bool * bool *
  $int * $int * $int * $int * $int * $int * $int * $int * set($int) *
  set($int) * set($int) * set($int) * $int * $int * $int * $int * $int *
  $int * $int * $int * $int * $int * $int * $int) > $o).

tff(f19_def, axiom, ![V_zz:enum_aa, V_yy:$int, V_xx:bool, V_ww:bool, V_vv:
  bool, V_uu:bool, V_tt:$int, V_ss:$int, V_rr:$int, V_qq:$int, V_pp:$int,
  V_oo:enum_aa, V_nn:$int, V_mm:bool, V_ll:bool, V_kk:bool, V_jj:bool,
  V_bbxx:$int, V_bbww:$int, V_bbvv:$int, V_bbuu:$int, V_bbtt:$int, V_bbss:
  $int, V_bbrr:$int, V_bbqq:$int, V_bbpp:set($int), V_bboo:set($int), V_bbnn:
  set($int), V_bbmm:set($int), V_bbll:$int, V_bbkk:$int, V_bbjj:$int, V_bbii:
  $int, V_bbhh:$int, V_bbgg:$int, V_bbff:$int, V_bbee:$int, V_bbdd:$int,
  V_bbcc:$int, V_bbbb:$int, V_bbaa:$int]: (f19(V_zz, V_yy, V_xx, V_ww, V_vv,
  V_uu, V_tt, V_ss, V_rr, V_qq, V_pp, V_oo, V_nn, V_mm, V_ll, V_kk, V_jj,
  V_bbxx, V_bbww, V_bbvv, V_bbuu, V_bbtt, V_bbss, V_bbrr, V_bbqq, V_bbpp,
  V_bboo, V_bbnn, V_bbmm, V_bbll, V_bbkk, V_bbjj, V_bbii, V_bbhh, V_bbgg,
  V_bbff, V_bbee, V_bbdd, V_bbcc, V_bbbb, V_bbaa)
  <=> (((((((((((((((((((((((((((((((((((((((((((((((((((((($true & ~
  (V_zz = e_bb)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_dd)) & ~
  $lesseq(V_bbjj,$difference($sum(V_yy,1),V_bbaa))) & (V_zz = e_cc))
  & (V_uu = true)) & (V_vv = true)) & (V_ww = false)) & (V_xx = false))
  & mem($int, $sum(V_yy,1), integer)) & $lesseq(0,$sum(V_yy,1))) & ~ (((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_ii)))
  & ~ ((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_hh))
  & (V_zz = e_ii)) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))) & (V_zz = e_bb))) & ~ ((((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_hh)) & (V_zz = e_ii)) & (V_uu = false))
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false)) & (V_zz = e_bb))) & ~
  ((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_hh))
  & (V_zz = e_ii)) & (V_uu = true)) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false)) & (V_zz = e_bb))) & ~ ((((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_hh)) & (V_zz = e_ii)) & (V_uu = true))
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false)) & (V_zz = e_bb))) & ~
  ((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_hh))
  & (V_zz = e_ii)) & (V_uu = false)) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))
  & ($lesseq($sum($difference(V_yy,V_bbee),1),$sum(V_bbff,V_bbgg)) | (~
  $lesseq($sum($difference(V_yy,V_bbee),1),$sum(V_bbff,V_bbgg))
  & (V_zz = e_bb))))) & ~ ((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~
  (V_zz = e_ii)) & (V_zz = e_hh)) & ~ ((((V_uu = false) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = false) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false))) & (V_zz = e_bb))) & ~ (((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ii)) & (V_zz = e_hh))
  & (V_uu = false)) & (V_vv = true)) & (V_ww = false)) & (V_xx = false))
  & (V_zz = e_gg)) & (V_bbee = $sum(V_yy,1)))) & ~ (((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ii)) & (V_zz = e_hh))
  & (V_uu = true)) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))
  & (V_zz = e_gg)) & (V_bbee = $sum(V_yy,1)))) & ~ (((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ii)) & (V_zz = e_hh))
  & (V_uu = true)) & (V_vv = true)) & (V_ww = false)) & (V_xx = false))
  & (V_zz = e_gg)) & (V_bbee = $sum(V_yy,1)))) & ~ ((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ii)) & (V_zz = e_hh))
  & (V_uu = false)) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))
  & ($lesseq($sum($difference($difference($sum(V_yy,1),V_bbee),1),1),V_bbff)
  | (~
  $lesseq($sum($difference($difference($sum(V_yy,1),V_bbee),1),1),V_bbff)
  & (V_zz = e_ii))))) & ~ ((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & (V_zz = e_gg)) & ~ ((((V_uu = false) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = false) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false))) & (V_zz = e_bb))) & ~ ((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & (V_zz = e_gg))
  & (V_uu = false)) & (V_vv = true)) & (V_ww = false)) & (V_xx = false))
  & (($lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)
  & ((V_zz = e_gg) & (V_bbee = $sum(V_yy,1)))) | (~
  $lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)
  & (V_zz = e_bb))))) & ~ ((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & (V_zz = e_gg)) & (V_uu = true)) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false))
  & (($lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)
  & ((V_zz = e_gg) & (V_bbee = $sum(V_yy,1)))) | (~
  $lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)
  & (V_zz = e_bb))))) & ~ ((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & (V_zz = e_gg)) & (V_uu = true)) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false))
  & (($lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)
  & ((V_zz = e_gg) & (V_bbee = $sum(V_yy,1)))) | (~
  $lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)
  & (V_zz = e_bb))))) & ~ ((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & (V_zz = e_gg)) & (V_uu = false)) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false))
  & (($lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)
  & (V_zz = e_hh)) | (~
  $lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)
  & (V_zz = e_bb))))) & ~ ((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & (V_zz = e_gg)) & (V_zz = e_bb)) & ~ ((((V_uu = false)
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = true)
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & ~ ((((V_uu = true)
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = false)
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false)))) & ~ ((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & (V_zz = e_gg))
  & (V_zz = e_bb)) & (V_uu = false)) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))) & ~ ((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & (V_zz = e_gg)) & (V_zz = e_bb)) & (V_uu = true))
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~ ((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & (V_zz = e_gg))
  & (V_zz = e_bb)) & (V_uu = true)) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))) & ~ ((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & (V_zz = e_gg)) & (V_zz = e_bb)) & (V_uu = false))
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~ ((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & (V_zz = e_ff)) & ~
  ((((V_uu = false) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~
  ((((V_uu = true) & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & ~
  ((((V_uu = true) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~
  ((((V_uu = false) & (V_vv = true)) & (V_ww = false)) & (V_xx = false)))
  & (V_zz = e_bb))) & ~ ((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~
  (V_zz = e_gg)) & (V_zz = e_ff)) & (V_uu = false)) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false)) & (V_bbdd = $sum(V_yy,1)))) & ~
  ((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg))
  & (V_zz = e_ff)) & (V_uu = true)) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false)) & (V_zz = e_bb))) & ~ ((((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & ~ (V_zz = e_gg)) & (V_zz = e_ff)) & (V_uu = true))
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false)) & (V_zz = e_bb))) & ~
  (((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg))
  & (V_zz = e_ff)) & (V_uu = false)) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false)) & (V_zz = e_gg)) & (V_bbee = V_yy))) & ~ ((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff)) & (V_zz = e_ee)) & ~
  ((((V_uu = false) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~
  ((((V_uu = true) & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & ~
  ((((V_uu = true) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~
  ((((V_uu = false) & (V_vv = true)) & (V_ww = false)) & (V_xx = false)))
  & (V_zz = e_bb))) & ~ ((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~
  (V_zz = e_ff)) & (V_zz = e_ee)) & (V_uu = false)) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false))
  & (($lesseq($sum($difference($difference($sum(V_bbcc,1),V_bbbb),1),1),V_bbii)
  & ((V_bbcc = $sum(V_yy,1)) & (V_zz = e_ee))) | (~
  $lesseq($sum($difference($difference($sum(V_bbcc,1),V_bbbb),1),1),V_bbii)
  & ((V_bbdd = $sum(V_yy,1)) & (V_zz = e_ff)))))) & ~ ((((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff)) & (V_zz = e_ee))
  & (V_uu = true)) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))
  & (V_zz = e_gg)) & (V_bbdd = V_bbcc)) & (V_bbee = $sum(V_yy,1)))) & ~
  ((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff))
  & (V_zz = e_ee)) & (V_uu = true)) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))
  & (($lesseq($sum($difference($difference($sum(V_bbcc,1),V_bbbb),1),1),V_bbii)
  & ((V_bbcc = $sum(V_yy,1)) & (V_zz = e_ee))) | (~
  $lesseq($sum($difference($difference($sum(V_bbcc,1),V_bbbb),1),1),V_bbii)
  & (V_zz = e_bb))))) & ~ ((((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc))
  & ~ (V_zz = e_dd)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg))
  & ~ (V_zz = e_ff)) & (V_zz = e_ee)) & (V_uu = false)) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false)) & (V_zz = e_gg)) & (V_bbdd = V_bbcc))
  & (V_bbee = V_yy))) & ~ ((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_ee)) & (V_zz = e_dd)) & ~ ((((V_uu = false) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = false) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false))) & (V_zz = e_bb))) & ~ (((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ee)) & (V_zz = e_dd))
  & (V_uu = false)) & (V_vv = true)) & (V_ww = false)) & (V_xx = false))
  & (V_bbcc = $sum(V_yy,1))) & (V_zz = e_ee))) & ~ (((((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ee)) & (V_zz = e_dd))
  & (V_uu = true)) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))
  & (V_zz = e_gg)) & (V_bbcc = V_bbbb)) & (V_bbdd = V_bbbb))
  & (V_bbee = $sum(V_yy,1)))) & ~ (((((((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_ee)) & (V_zz = e_dd)) & (V_uu = false))
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false)) & (V_zz = e_gg))
  & (V_bbcc = V_bbbb)) & (V_bbdd = V_bbbb)) & (V_bbee = V_yy))) & ~
  (((((((((((~ (V_zz = e_ii) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_dd)) & (V_zz = e_cc)) & ~
  ((((V_uu = false) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~
  ((((V_uu = true) & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & ~
  ((((V_uu = true) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~
  ((((V_uu = false) & (V_vv = true)) & (V_ww = false)) & (V_xx = false)))
  & (V_zz = e_bb))) & ~ (((((((((((~ (V_zz = e_ii) & ~ (V_zz = e_hh)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_dd))
  & (V_zz = e_cc)) & (V_uu = false)) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false)) & (V_zz = e_bb))) & ~ (((((((((((~ (V_zz = e_ii) & ~
  (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_dd)) & (V_zz = e_cc)) & (V_uu = true)) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false)) & (V_zz = e_bb))) & ~ (((((((((((~
  (V_zz = e_ii) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_dd)) & (V_zz = e_cc)) & (V_uu = true))
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false))
  & (($lesseq(V_bbjj,$difference($sum(V_yy,1),V_bbaa)) & ((V_zz = e_dd)
  & (V_bbbb = $sum(V_yy,1)))) | ~
  $lesseq(V_bbjj,$difference($sum(V_yy,1),V_bbaa))))))).

tff(f21, type, f21: (enum_aa * $int * bool * bool * bool * bool * $int *
  $int * $int * $int * $int * enum_aa * $int * bool * bool * bool * bool *
  $int * $int * $int * $int * $int * $int * $int * $int * set($int) *
  set($int) * set($int) * set($int) * $int * $int * $int * $int * $int *
  $int * $int * $int * $int * $int * $int * $int) > $o).

tff(f21_def, axiom, ![V_zz:enum_aa, V_yy:$int, V_xx:bool, V_ww:bool, V_vv:
  bool, V_uu:bool, V_tt:$int, V_ss:$int, V_rr:$int, V_qq:$int, V_pp:$int,
  V_oo:enum_aa, V_nn:$int, V_mm:bool, V_ll:bool, V_kk:bool, V_jj:bool,
  V_bbxx:$int, V_bbww:$int, V_bbvv:$int, V_bbuu:$int, V_bbtt:$int, V_bbss:
  $int, V_bbrr:$int, V_bbqq:$int, V_bbpp:set($int), V_bboo:set($int), V_bbnn:
  set($int), V_bbmm:set($int), V_bbll:$int, V_bbkk:$int, V_bbjj:$int, V_bbii:
  $int, V_bbhh:$int, V_bbgg:$int, V_bbff:$int, V_bbee:$int, V_bbdd:$int,
  V_bbcc:$int, V_bbbb:$int, V_bbaa:$int]: (f21(V_zz, V_yy, V_xx, V_ww, V_vv,
  V_uu, V_tt, V_ss, V_rr, V_qq, V_pp, V_oo, V_nn, V_mm, V_ll, V_kk, V_jj,
  V_bbxx, V_bbww, V_bbvv, V_bbuu, V_bbtt, V_bbss, V_bbrr, V_bbqq, V_bbpp,
  V_bboo, V_bbnn, V_bbmm, V_bbll, V_bbkk, V_bbjj, V_bbii, V_bbhh, V_bbgg,
  V_bbff, V_bbee, V_bbdd, V_bbcc, V_bbbb, V_bbaa)
  <=> ((((((((((((((((((((((((((((((((((((((((((((((((((($true & ~
  (V_zz = e_bb)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_dd)) & (V_zz = e_cc))
  & (V_uu = true)) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))
  & mem($int, $sum(V_yy,1), integer)) & $lesseq(0,$sum(V_yy,1))) & $true) & ~
  (((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_hh))
  & (V_zz = e_ii)) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false)))) & ~ (((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~
  (V_zz = e_hh)) & (V_zz = e_ii)) & (V_uu = false)) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false))) & ~ (((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_hh)) & (V_zz = e_ii)) & (V_uu = true))
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~ (((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_hh)) & (V_zz = e_ii))
  & (V_uu = true)) & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & ~
  ((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_hh))
  & (V_zz = e_ii)) & (V_uu = false)) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false)) & ~
  $lesseq($sum($difference(V_yy,V_bbee),1),$sum(V_bbff,V_bbgg)))) & ~
  (((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ii))
  & (V_zz = e_hh)) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false)))) & ~ (((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~
  (V_zz = e_ii)) & (V_zz = e_hh)) & (V_uu = false)) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false)) & (e_bb = e_gg))
  & (V_bbee = $sum(V_yy,1)))) & ~ (((((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ii)) & (V_zz = e_hh)) & (V_uu = true))
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false)) & (e_bb = e_gg))
  & (V_bbee = $sum(V_yy,1)))) & ~ (((((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ii)) & (V_zz = e_hh)) & (V_uu = true))
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false)) & (e_bb = e_gg))
  & (V_bbee = $sum(V_yy,1)))) & ~ ((((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ii)) & (V_zz = e_hh)) & (V_uu = false))
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false)) & (~
  $lesseq($sum($difference($difference($sum(V_yy,1),V_bbee),1),1),V_bbff)
  & (e_bb = e_ii)))) & ~ (((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & (V_zz = e_gg)) & ~ ((((V_uu = false) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = false) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false)))) & ~ ((((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & (V_zz = e_gg)) & (V_uu = false))
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false))
  & (($lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)
  & ((e_bb = e_gg) & (V_bbee = $sum(V_yy,1)))) | ~
  $lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)))) & ~
  ((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh))
  & (V_zz = e_gg)) & (V_uu = true)) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))
  & (($lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)
  & ((e_bb = e_gg) & (V_bbee = $sum(V_yy,1)))) | ~
  $lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)))) & ~
  ((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh))
  & (V_zz = e_gg)) & (V_uu = true)) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))
  & (($lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)
  & ((e_bb = e_gg) & (V_bbee = $sum(V_yy,1)))) | ~
  $lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)))) & ~
  ((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh))
  & (V_zz = e_gg)) & (V_uu = false)) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))
  & (($lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)
  & (e_bb = e_hh)) | ~
  $lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)))) & ~
  (((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh))
  & (V_zz = e_gg)) & (V_uu = false)) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))) & ~ (((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & (V_zz = e_gg)) & (V_uu = true)) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false))) & ~ (((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & (V_zz = e_gg)) & (V_uu = true))
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & ~ (((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & (V_zz = e_gg))
  & (V_uu = false)) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~
  (((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg))
  & (V_zz = e_ff)) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false)))) & ~ (((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~
  (V_zz = e_gg)) & (V_zz = e_ff)) & (V_uu = true)) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false))) & ~ (((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & ~ (V_zz = e_gg)) & (V_zz = e_ff)) & (V_uu = true))
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & ~ (((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & (V_zz = e_ff))
  & (V_uu = false)) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))
  & (e_bb = e_gg)) & (V_bbee = V_yy))) & ~ (((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ff)) & (V_zz = e_ee)) & ~ ((((V_uu = false)
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = true)
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & ~ ((((V_uu = true)
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = false)
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false)))) & ~ ((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff)) & (V_zz = e_ee))
  & (V_uu = false)) & (V_vv = true)) & (V_ww = false)) & (V_xx = false))
  & (($lesseq($sum($difference($difference($sum(V_bbcc,1),V_bbbb),1),1),V_bbii)
  & ((V_bbcc = $sum(V_yy,1)) & (e_bb = e_ee))) | (~
  $lesseq($sum($difference($difference($sum(V_bbcc,1),V_bbbb),1),1),V_bbii)
  & ((V_bbdd = $sum(V_yy,1)) & (e_bb = e_ff)))))) & ~ ((((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff)) & (V_zz = e_ee))
  & (V_uu = true)) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))
  & (e_bb = e_gg)) & (V_bbdd = V_bbcc)) & (V_bbee = $sum(V_yy,1)))) & ~
  ((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff))
  & (V_zz = e_ee)) & (V_uu = true)) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))
  & (($lesseq($sum($difference($difference($sum(V_bbcc,1),V_bbbb),1),1),V_bbii)
  & ((V_bbcc = $sum(V_yy,1)) & (e_bb = e_ee))) | ~
  $lesseq($sum($difference($difference($sum(V_bbcc,1),V_bbbb),1),1),V_bbii))))
  & ~ ((((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff))
  & (V_zz = e_ee)) & (V_uu = false)) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false)) & (e_bb = e_gg)) & (V_bbdd = V_bbcc)) & (V_bbee = V_yy)))
  & ~ (((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ee))
  & (V_zz = e_dd)) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false)))) & ~ (((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_ee)) & (V_zz = e_dd)) & (V_uu = false)) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false)) & (V_bbcc = $sum(V_yy,1)))
  & (e_bb = e_ee))) & ~ (((((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_ee)) & (V_zz = e_dd)) & (V_uu = true)) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false)) & (e_bb = e_gg)) & (V_bbcc = V_bbbb))
  & (V_bbdd = V_bbbb)) & (V_bbee = $sum(V_yy,1)))) & ~ (((((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ee)) & (V_zz = e_dd))
  & (V_uu = false)) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))
  & (e_bb = e_gg)) & (V_bbcc = V_bbbb)) & (V_bbdd = V_bbbb))
  & (V_bbee = V_yy))) & ~ ((((((((((~ (V_zz = e_ii) & ~ (V_zz = e_hh)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_dd))
  & (V_zz = e_cc)) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false)))) & ~ ((((((((((~ (V_zz = e_ii) & ~ (V_zz = e_hh)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_dd))
  & (V_zz = e_cc)) & (V_uu = false)) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))) & ~ ((((((((((~ (V_zz = e_ii) & ~ (V_zz = e_hh)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_dd))
  & (V_zz = e_cc)) & (V_uu = true)) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ (((((((((((~ (V_zz = e_ii) & ~ (V_zz = e_hh)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_dd))
  & (V_zz = e_cc)) & (V_uu = true)) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false)) & ($lesseq(V_bbjj,$difference($sum(V_yy,1),V_bbaa))
  & ((e_bb = e_dd) & (V_bbbb = $sum(V_yy,1)))))))).

tff(f22, type, f22: (enum_aa * $int * bool * bool * bool * bool * $int *
  $int * $int * $int * $int * enum_aa * $int * bool * bool * bool * bool *
  $int * $int * $int * $int * $int * $int * $int * $int * set($int) *
  set($int) * set($int) * set($int) * $int * $int * $int * $int * $int *
  $int * $int * $int * $int * $int * $int * $int) > $o).

tff(f22_def, axiom, ![V_zz:enum_aa, V_yy:$int, V_xx:bool, V_ww:bool, V_vv:
  bool, V_uu:bool, V_tt:$int, V_ss:$int, V_rr:$int, V_qq:$int, V_pp:$int,
  V_oo:enum_aa, V_nn:$int, V_mm:bool, V_ll:bool, V_kk:bool, V_jj:bool,
  V_bbxx:$int, V_bbww:$int, V_bbvv:$int, V_bbuu:$int, V_bbtt:$int, V_bbss:
  $int, V_bbrr:$int, V_bbqq:$int, V_bbpp:set($int), V_bboo:set($int), V_bbnn:
  set($int), V_bbmm:set($int), V_bbll:$int, V_bbkk:$int, V_bbjj:$int, V_bbii:
  $int, V_bbhh:$int, V_bbgg:$int, V_bbff:$int, V_bbee:$int, V_bbdd:$int,
  V_bbcc:$int, V_bbbb:$int, V_bbaa:$int]: (f22(V_zz, V_yy, V_xx, V_ww, V_vv,
  V_uu, V_tt, V_ss, V_rr, V_qq, V_pp, V_oo, V_nn, V_mm, V_ll, V_kk, V_jj,
  V_bbxx, V_bbww, V_bbvv, V_bbuu, V_bbtt, V_bbss, V_bbrr, V_bbqq, V_bbpp,
  V_bboo, V_bbnn, V_bbmm, V_bbll, V_bbkk, V_bbjj, V_bbii, V_bbhh, V_bbgg,
  V_bbff, V_bbee, V_bbdd, V_bbcc, V_bbbb, V_bbaa)
  <=> ((((((((((((((((((((((((((((((((((((((((((((((((((($true & ~
  (V_zz = e_bb)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_dd)) & (V_zz = e_cc))
  & (V_uu = false)) & (V_vv = true)) & (V_ww = false)) & (V_xx = false))
  & mem($int, $sum(V_yy,1), integer)) & $lesseq(0,$sum(V_yy,1))) & $true) & ~
  (((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_hh))
  & (V_zz = e_ii)) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false)))) & ~ (((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~
  (V_zz = e_hh)) & (V_zz = e_ii)) & (V_uu = false)) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false))) & ~ (((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_hh)) & (V_zz = e_ii)) & (V_uu = true))
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~ (((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_hh)) & (V_zz = e_ii))
  & (V_uu = true)) & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & ~
  ((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_hh))
  & (V_zz = e_ii)) & (V_uu = false)) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false)) & ~
  $lesseq($sum($difference(V_yy,V_bbee),1),$sum(V_bbff,V_bbgg)))) & ~
  (((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ii))
  & (V_zz = e_hh)) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false)))) & ~ (((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~
  (V_zz = e_ii)) & (V_zz = e_hh)) & (V_uu = false)) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false)) & (e_bb = e_gg))
  & (V_bbee = $sum(V_yy,1)))) & ~ (((((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ii)) & (V_zz = e_hh)) & (V_uu = true))
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false)) & (e_bb = e_gg))
  & (V_bbee = $sum(V_yy,1)))) & ~ (((((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ii)) & (V_zz = e_hh)) & (V_uu = true))
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false)) & (e_bb = e_gg))
  & (V_bbee = $sum(V_yy,1)))) & ~ ((((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ii)) & (V_zz = e_hh)) & (V_uu = false))
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false)) & (~
  $lesseq($sum($difference($difference($sum(V_yy,1),V_bbee),1),1),V_bbff)
  & (e_bb = e_ii)))) & ~ (((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & (V_zz = e_gg)) & ~ ((((V_uu = false) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = false) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false)))) & ~ ((((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & (V_zz = e_gg)) & (V_uu = false))
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false))
  & (($lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)
  & ((e_bb = e_gg) & (V_bbee = $sum(V_yy,1)))) | ~
  $lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)))) & ~
  ((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh))
  & (V_zz = e_gg)) & (V_uu = true)) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))
  & (($lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)
  & ((e_bb = e_gg) & (V_bbee = $sum(V_yy,1)))) | ~
  $lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)))) & ~
  ((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh))
  & (V_zz = e_gg)) & (V_uu = true)) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))
  & (($lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)
  & ((e_bb = e_gg) & (V_bbee = $sum(V_yy,1)))) | ~
  $lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)))) & ~
  ((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh))
  & (V_zz = e_gg)) & (V_uu = false)) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))
  & (($lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)
  & (e_bb = e_hh)) | ~
  $lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)))) & ~
  (((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh))
  & (V_zz = e_gg)) & (V_uu = false)) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))) & ~ (((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & (V_zz = e_gg)) & (V_uu = true)) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false))) & ~ (((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & (V_zz = e_gg)) & (V_uu = true))
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & ~ (((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & (V_zz = e_gg))
  & (V_uu = false)) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~
  (((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg))
  & (V_zz = e_ff)) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false)))) & ~ (((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~
  (V_zz = e_gg)) & (V_zz = e_ff)) & (V_uu = true)) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false))) & ~ (((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & ~ (V_zz = e_gg)) & (V_zz = e_ff)) & (V_uu = true))
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & ~ (((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & (V_zz = e_ff))
  & (V_uu = false)) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))
  & (e_bb = e_gg)) & (V_bbee = V_yy))) & ~ (((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ff)) & (V_zz = e_ee)) & ~ ((((V_uu = false)
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = true)
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & ~ ((((V_uu = true)
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = false)
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false)))) & ~ ((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff)) & (V_zz = e_ee))
  & (V_uu = false)) & (V_vv = true)) & (V_ww = false)) & (V_xx = false))
  & (($lesseq($sum($difference($difference($sum(V_bbcc,1),V_bbbb),1),1),V_bbii)
  & ((V_bbcc = $sum(V_yy,1)) & (e_bb = e_ee))) | (~
  $lesseq($sum($difference($difference($sum(V_bbcc,1),V_bbbb),1),1),V_bbii)
  & ((V_bbdd = $sum(V_yy,1)) & (e_bb = e_ff)))))) & ~ ((((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff)) & (V_zz = e_ee))
  & (V_uu = true)) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))
  & (e_bb = e_gg)) & (V_bbdd = V_bbcc)) & (V_bbee = $sum(V_yy,1)))) & ~
  ((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff))
  & (V_zz = e_ee)) & (V_uu = true)) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))
  & (($lesseq($sum($difference($difference($sum(V_bbcc,1),V_bbbb),1),1),V_bbii)
  & ((V_bbcc = $sum(V_yy,1)) & (e_bb = e_ee))) | ~
  $lesseq($sum($difference($difference($sum(V_bbcc,1),V_bbbb),1),1),V_bbii))))
  & ~ ((((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff))
  & (V_zz = e_ee)) & (V_uu = false)) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false)) & (e_bb = e_gg)) & (V_bbdd = V_bbcc)) & (V_bbee = V_yy)))
  & ~ (((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ee))
  & (V_zz = e_dd)) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false)))) & ~ (((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_ee)) & (V_zz = e_dd)) & (V_uu = false)) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false)) & (V_bbcc = $sum(V_yy,1)))
  & (e_bb = e_ee))) & ~ (((((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_ee)) & (V_zz = e_dd)) & (V_uu = true)) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false)) & (e_bb = e_gg)) & (V_bbcc = V_bbbb))
  & (V_bbdd = V_bbbb)) & (V_bbee = $sum(V_yy,1)))) & ~ (((((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ee)) & (V_zz = e_dd))
  & (V_uu = false)) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))
  & (e_bb = e_gg)) & (V_bbcc = V_bbbb)) & (V_bbdd = V_bbbb))
  & (V_bbee = V_yy))) & ~ ((((((((((~ (V_zz = e_ii) & ~ (V_zz = e_hh)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_dd))
  & (V_zz = e_cc)) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false)))) & ~ ((((((((((~ (V_zz = e_ii) & ~ (V_zz = e_hh)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_dd))
  & (V_zz = e_cc)) & (V_uu = false)) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))) & ~ ((((((((((~ (V_zz = e_ii) & ~ (V_zz = e_hh)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_dd))
  & (V_zz = e_cc)) & (V_uu = true)) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ (((((((((((~ (V_zz = e_ii) & ~ (V_zz = e_hh)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_dd))
  & (V_zz = e_cc)) & (V_uu = true)) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false)) & ($lesseq(V_bbjj,$difference($sum(V_yy,1),V_bbaa))
  & ((e_bb = e_dd) & (V_bbbb = $sum(V_yy,1)))))))).

tff(f23, type, f23: (enum_aa * $int * bool * bool * bool * bool * $int *
  $int * $int * $int * $int * enum_aa * $int * bool * bool * bool * bool *
  $int * $int * $int * $int * $int * $int * $int * $int * set($int) *
  set($int) * set($int) * set($int) * $int * $int * $int * $int * $int *
  $int * $int * $int * $int * $int * $int * $int) > $o).

tff(f23_def, axiom, ![V_zz:enum_aa, V_yy:$int, V_xx:bool, V_ww:bool, V_vv:
  bool, V_uu:bool, V_tt:$int, V_ss:$int, V_rr:$int, V_qq:$int, V_pp:$int,
  V_oo:enum_aa, V_nn:$int, V_mm:bool, V_ll:bool, V_kk:bool, V_jj:bool,
  V_bbxx:$int, V_bbww:$int, V_bbvv:$int, V_bbuu:$int, V_bbtt:$int, V_bbss:
  $int, V_bbrr:$int, V_bbqq:$int, V_bbpp:set($int), V_bboo:set($int), V_bbnn:
  set($int), V_bbmm:set($int), V_bbll:$int, V_bbkk:$int, V_bbjj:$int, V_bbii:
  $int, V_bbhh:$int, V_bbgg:$int, V_bbff:$int, V_bbee:$int, V_bbdd:$int,
  V_bbcc:$int, V_bbbb:$int, V_bbaa:$int]: (f23(V_zz, V_yy, V_xx, V_ww, V_vv,
  V_uu, V_tt, V_ss, V_rr, V_qq, V_pp, V_oo, V_nn, V_mm, V_ll, V_kk, V_jj,
  V_bbxx, V_bbww, V_bbvv, V_bbuu, V_bbtt, V_bbss, V_bbrr, V_bbqq, V_bbpp,
  V_bboo, V_bbnn, V_bbmm, V_bbll, V_bbkk, V_bbjj, V_bbii, V_bbhh, V_bbgg,
  V_bbff, V_bbee, V_bbdd, V_bbcc, V_bbbb, V_bbaa)
  <=> ((((((((((((((((((((((((((((((((((((((((((((((((((($true & ~
  (V_zz = e_bb)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_dd)) & ~ ((((V_uu = false)
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = true)
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & ~ ((((V_uu = true)
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = false)
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & (V_zz = e_cc))
  & mem($int, $sum(V_yy,1), integer)) & $lesseq(0,$sum(V_yy,1))) & $true) & ~
  (((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_hh))
  & (V_zz = e_ii)) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false)))) & ~ (((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~
  (V_zz = e_hh)) & (V_zz = e_ii)) & (V_uu = false)) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false))) & ~ (((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_hh)) & (V_zz = e_ii)) & (V_uu = true))
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~ (((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_hh)) & (V_zz = e_ii))
  & (V_uu = true)) & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & ~
  ((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_hh))
  & (V_zz = e_ii)) & (V_uu = false)) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false)) & ~
  $lesseq($sum($difference(V_yy,V_bbee),1),$sum(V_bbff,V_bbgg)))) & ~
  (((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ii))
  & (V_zz = e_hh)) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false)))) & ~ (((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~
  (V_zz = e_ii)) & (V_zz = e_hh)) & (V_uu = false)) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false)) & (e_bb = e_gg))
  & (V_bbee = $sum(V_yy,1)))) & ~ (((((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ii)) & (V_zz = e_hh)) & (V_uu = true))
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false)) & (e_bb = e_gg))
  & (V_bbee = $sum(V_yy,1)))) & ~ (((((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ii)) & (V_zz = e_hh)) & (V_uu = true))
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false)) & (e_bb = e_gg))
  & (V_bbee = $sum(V_yy,1)))) & ~ ((((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ii)) & (V_zz = e_hh)) & (V_uu = false))
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false)) & (~
  $lesseq($sum($difference($difference($sum(V_yy,1),V_bbee),1),1),V_bbff)
  & (e_bb = e_ii)))) & ~ (((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & (V_zz = e_gg)) & ~ ((((V_uu = false) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = false) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false)))) & ~ ((((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & (V_zz = e_gg)) & (V_uu = false))
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false))
  & (($lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)
  & ((e_bb = e_gg) & (V_bbee = $sum(V_yy,1)))) | ~
  $lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)))) & ~
  ((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh))
  & (V_zz = e_gg)) & (V_uu = true)) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))
  & (($lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)
  & ((e_bb = e_gg) & (V_bbee = $sum(V_yy,1)))) | ~
  $lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)))) & ~
  ((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh))
  & (V_zz = e_gg)) & (V_uu = true)) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))
  & (($lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)
  & ((e_bb = e_gg) & (V_bbee = $sum(V_yy,1)))) | ~
  $lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)))) & ~
  ((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh))
  & (V_zz = e_gg)) & (V_uu = false)) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))
  & (($lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)
  & (e_bb = e_hh)) | ~
  $lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)))) & ~
  (((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh))
  & (V_zz = e_gg)) & (V_uu = false)) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))) & ~ (((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & (V_zz = e_gg)) & (V_uu = true)) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false))) & ~ (((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & (V_zz = e_gg)) & (V_uu = true))
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & ~ (((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & (V_zz = e_gg))
  & (V_uu = false)) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~
  (((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg))
  & (V_zz = e_ff)) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false)))) & ~ (((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~
  (V_zz = e_gg)) & (V_zz = e_ff)) & (V_uu = true)) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false))) & ~ (((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & ~ (V_zz = e_gg)) & (V_zz = e_ff)) & (V_uu = true))
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & ~ (((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & (V_zz = e_ff))
  & (V_uu = false)) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))
  & (e_bb = e_gg)) & (V_bbee = V_yy))) & ~ (((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ff)) & (V_zz = e_ee)) & ~ ((((V_uu = false)
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = true)
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & ~ ((((V_uu = true)
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = false)
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false)))) & ~ ((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff)) & (V_zz = e_ee))
  & (V_uu = false)) & (V_vv = true)) & (V_ww = false)) & (V_xx = false))
  & (($lesseq($sum($difference($difference($sum(V_bbcc,1),V_bbbb),1),1),V_bbii)
  & ((V_bbcc = $sum(V_yy,1)) & (e_bb = e_ee))) | (~
  $lesseq($sum($difference($difference($sum(V_bbcc,1),V_bbbb),1),1),V_bbii)
  & ((V_bbdd = $sum(V_yy,1)) & (e_bb = e_ff)))))) & ~ ((((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff)) & (V_zz = e_ee))
  & (V_uu = true)) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))
  & (e_bb = e_gg)) & (V_bbdd = V_bbcc)) & (V_bbee = $sum(V_yy,1)))) & ~
  ((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff))
  & (V_zz = e_ee)) & (V_uu = true)) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))
  & (($lesseq($sum($difference($difference($sum(V_bbcc,1),V_bbbb),1),1),V_bbii)
  & ((V_bbcc = $sum(V_yy,1)) & (e_bb = e_ee))) | ~
  $lesseq($sum($difference($difference($sum(V_bbcc,1),V_bbbb),1),1),V_bbii))))
  & ~ ((((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff))
  & (V_zz = e_ee)) & (V_uu = false)) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false)) & (e_bb = e_gg)) & (V_bbdd = V_bbcc)) & (V_bbee = V_yy)))
  & ~ (((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ee))
  & (V_zz = e_dd)) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false)))) & ~ (((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_ee)) & (V_zz = e_dd)) & (V_uu = false)) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false)) & (V_bbcc = $sum(V_yy,1)))
  & (e_bb = e_ee))) & ~ (((((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_ee)) & (V_zz = e_dd)) & (V_uu = true)) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false)) & (e_bb = e_gg)) & (V_bbcc = V_bbbb))
  & (V_bbdd = V_bbbb)) & (V_bbee = $sum(V_yy,1)))) & ~ (((((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ee)) & (V_zz = e_dd))
  & (V_uu = false)) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))
  & (e_bb = e_gg)) & (V_bbcc = V_bbbb)) & (V_bbdd = V_bbbb))
  & (V_bbee = V_yy))) & ~ ((((((((((~ (V_zz = e_ii) & ~ (V_zz = e_hh)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_dd))
  & (V_zz = e_cc)) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false)))) & ~ ((((((((((~ (V_zz = e_ii) & ~ (V_zz = e_hh)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_dd))
  & (V_zz = e_cc)) & (V_uu = false)) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))) & ~ ((((((((((~ (V_zz = e_ii) & ~ (V_zz = e_hh)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_dd))
  & (V_zz = e_cc)) & (V_uu = true)) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ (((((((((((~ (V_zz = e_ii) & ~ (V_zz = e_hh)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_dd))
  & (V_zz = e_cc)) & (V_uu = true)) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false)) & ($lesseq(V_bbjj,$difference($sum(V_yy,1),V_bbaa))
  & ((e_bb = e_dd) & (V_bbbb = $sum(V_yy,1)))))))).

tff(f24, type, f24: (enum_aa * $int * bool * bool * bool * bool * $int *
  $int * $int * $int * $int * enum_aa * $int * bool * bool * bool * bool *
  $int * $int * $int * $int * $int * $int * $int * $int * set($int) *
  set($int) * set($int) * set($int) * $int * $int * $int * $int * $int *
  $int * $int * $int * $int * $int * $int * $int) > $o).

tff(f24_def, axiom, ![V_zz:enum_aa, V_yy:$int, V_xx:bool, V_ww:bool, V_vv:
  bool, V_uu:bool, V_tt:$int, V_ss:$int, V_rr:$int, V_qq:$int, V_pp:$int,
  V_oo:enum_aa, V_nn:$int, V_mm:bool, V_ll:bool, V_kk:bool, V_jj:bool,
  V_bbxx:$int, V_bbww:$int, V_bbvv:$int, V_bbuu:$int, V_bbtt:$int, V_bbss:
  $int, V_bbrr:$int, V_bbqq:$int, V_bbpp:set($int), V_bboo:set($int), V_bbnn:
  set($int), V_bbmm:set($int), V_bbll:$int, V_bbkk:$int, V_bbjj:$int, V_bbii:
  $int, V_bbhh:$int, V_bbgg:$int, V_bbff:$int, V_bbee:$int, V_bbdd:$int,
  V_bbcc:$int, V_bbbb:$int, V_bbaa:$int]: (f24(V_zz, V_yy, V_xx, V_ww, V_vv,
  V_uu, V_tt, V_ss, V_rr, V_qq, V_pp, V_oo, V_nn, V_mm, V_ll, V_kk, V_jj,
  V_bbxx, V_bbww, V_bbvv, V_bbuu, V_bbtt, V_bbss, V_bbrr, V_bbqq, V_bbpp,
  V_bboo, V_bbnn, V_bbmm, V_bbll, V_bbkk, V_bbjj, V_bbii, V_bbhh, V_bbgg,
  V_bbff, V_bbee, V_bbdd, V_bbcc, V_bbbb, V_bbaa)
  <=> ((((((((((((((((((((((((((((((((((((((((((((((($true & ~ (V_zz = e_bb))
  & ~ (V_zz = e_cc)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg))
  & ~ (V_zz = e_ff)) & ~ (V_zz = e_ee)) & (V_zz = e_dd)) & (V_uu = false))
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false))
  & mem($int, $sum(V_yy,1), integer)) & $lesseq(0,$sum(V_yy,1))) & $true) & ~
  (((((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_hh))
  & (V_zz = e_ii)) & (V_yy = V_bbee)) & (V_bbbb = V_bbdd))
  & (V_bbbb = V_bbcc)) & ~ ((((V_uu = false) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = false) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false))) & (e_gg = e_bb))) & ~ (((((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_hh)) & (V_zz = e_ii))
  & (V_yy = V_bbee)) & (V_bbbb = V_bbdd)) & (V_bbbb = V_bbcc))
  & (V_uu = false)) & (V_vv = true)) & (V_ww = false)) & (V_xx = false))
  & (e_gg = e_bb))) & ~ (((((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~
  (V_zz = e_hh)) & (V_zz = e_ii)) & (V_yy = V_bbee)) & (V_bbbb = V_bbdd))
  & (V_bbbb = V_bbcc)) & (V_uu = true)) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false)) & (e_gg = e_bb))) & ~ (((((((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_hh)) & (V_zz = e_ii)) & (V_yy = V_bbee))
  & (V_bbbb = V_bbdd)) & (V_bbbb = V_bbcc)) & (V_uu = true)) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false)) & (e_gg = e_bb))) & ~ (((((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_hh)) & (V_zz = e_ii))
  & (V_yy = V_bbee)) & (V_bbbb = V_bbdd)) & (V_bbbb = V_bbcc))
  & (V_uu = false)) & (V_vv = true)) & (V_ww = true)) & (V_xx = false)) & (~
  $lesseq($sum($difference(V_yy,V_bbee),1),$sum(V_bbff,V_bbgg))
  & (e_gg = e_bb)))) & ~ (((((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc))
  & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_gg))
  & ~ (V_zz = e_ii)) & (V_zz = e_hh)) & (V_bbbb = V_bbcc))
  & (V_bbbb = V_bbdd)) & ~ ((((V_uu = false) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = false) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false))) & (e_gg = e_bb)) & (V_yy = V_bbee)))
  & ~ (((((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd))
  & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ii))
  & (V_zz = e_hh)) & (V_bbbb = V_bbcc)) & (V_bbbb = V_bbdd))
  & (V_uu = false)) & (V_vv = true)) & (V_ww = true)) & (V_xx = false)) & (~
  $lesseq($sum($difference($difference($sum(V_yy,1),V_bbee),1),1),V_bbff)
  & (e_gg = e_ii))) & (V_yy = V_bbee))) & ~ (((((((((((((((~ (V_zz = e_bb)
  & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff))
  & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & (V_zz = e_gg)) & (V_bbbb = V_bbdd))
  & (V_bbbb = V_bbcc)) & ~ ((((V_uu = false) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = false) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false))) & (e_gg = e_bb)) & (V_yy = V_bbee)))
  & ~ ((((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh))
  & (V_zz = e_gg)) & (V_bbbb = V_bbdd)) & (V_bbbb = V_bbcc))
  & (V_uu = false)) & (V_vv = true)) & (V_ww = false)) & (V_xx = false))
  & ((~ $lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)
  & (e_gg = e_bb)) & (V_yy = V_bbee)))) & ~ ((((((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & (V_zz = e_gg)) & (V_bbbb = V_bbdd))
  & (V_bbbb = V_bbcc)) & (V_uu = true)) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false)) & ((~
  $lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)
  & (e_gg = e_bb)) & (V_yy = V_bbee)))) & ~ ((((((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & (V_zz = e_gg)) & (V_bbbb = V_bbdd))
  & (V_bbbb = V_bbcc)) & (V_uu = true)) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false)) & ((~
  $lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)
  & (e_gg = e_bb)) & (V_yy = V_bbee)))) & ~ (((((((((((((((~ (V_zz = e_bb)
  & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff))
  & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & (V_zz = e_gg)) & (V_bbbb = V_bbdd))
  & (V_bbbb = V_bbcc)) & (V_uu = false)) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))
  & (($lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)
  & (e_gg = e_hh)) | (~
  $lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)
  & (e_gg = e_bb)))) & (V_yy = V_bbee))) & ~ (((((((((((((((~ (V_zz = e_bb)
  & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff))
  & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & (V_zz = e_gg)) & (V_bbbb = V_bbdd))
  & (V_bbbb = V_bbcc)) & (e_gg = e_bb)) & (V_yy = V_bbee)) & ~
  ((((V_uu = false) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~
  ((((V_uu = true) & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & ~
  ((((V_uu = true) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~
  ((((V_uu = false) & (V_vv = true)) & (V_ww = false)) & (V_xx = false))))
  & ~ (((((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd))
  & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh))
  & (V_zz = e_gg)) & (V_bbbb = V_bbdd)) & (V_bbbb = V_bbcc)) & (e_gg = e_bb))
  & (V_yy = V_bbee)) & (V_uu = false)) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))) & ~ (((((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc))
  & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ii))
  & ~ (V_zz = e_hh)) & (V_zz = e_gg)) & (V_bbbb = V_bbdd))
  & (V_bbbb = V_bbcc)) & (e_gg = e_bb)) & (V_yy = V_bbee)) & (V_uu = true))
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~ (((((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & (V_zz = e_gg))
  & (V_bbbb = V_bbdd)) & (V_bbbb = V_bbcc)) & (e_gg = e_bb))
  & (V_yy = V_bbee)) & (V_uu = true)) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))) & ~ (((((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc))
  & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ii))
  & ~ (V_zz = e_hh)) & (V_zz = e_gg)) & (V_bbbb = V_bbdd))
  & (V_bbbb = V_bbcc)) & (e_gg = e_bb)) & (V_yy = V_bbee)) & (V_uu = false))
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~ (((((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & (V_zz = e_ff))
  & (V_bbbb = V_bbcc)) & ~ ((((V_uu = false) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = false) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false))) & (e_gg = e_bb)) & (V_bbbb = V_bbdd))
  & (V_yy = V_bbee))) & ~ (((((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc))
  & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh))
  & ~ (V_zz = e_gg)) & (V_zz = e_ff)) & (V_bbbb = V_bbcc))
  & (V_bbbb = V_bbdd)) & (V_uu = true)) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false)) & (e_gg = e_bb)) & (V_yy = V_bbee))) & ~ (((((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & (V_zz = e_ff))
  & (V_bbbb = V_bbcc)) & (V_bbbb = V_bbdd)) & (V_uu = true)) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false)) & (e_gg = e_bb)) & (V_yy = V_bbee)))
  & ~ (((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg))
  & (V_zz = e_ff)) & (V_bbbb = V_bbcc)) & (V_bbbb = V_bbdd))
  & (V_uu = false)) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~
  (((((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff))
  & (V_zz = e_ee)) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))) & (e_gg = e_bb)) & (V_bbbb = V_bbdd))
  & (V_bbbb = V_bbcc)) & (V_yy = V_bbee))) & ~ (((((((((((((~ (V_zz = e_bb)
  & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh))
  & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff)) & (V_zz = e_ee)) & (V_uu = false))
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false))
  & ((($lesseq($sum($difference($difference($sum(V_bbcc,1),V_bbbb),1),1),V_bbii)
  & ((V_bbbb = $sum(V_yy,1)) & (e_gg = e_ee))) & (V_bbbb = V_bbdd)) | ((~
  $lesseq($sum($difference($difference($sum(V_bbcc,1),V_bbbb),1),1),V_bbii)
  & ((V_bbbb = $sum(V_yy,1)) & (e_gg = e_ff))) & (V_bbbb = V_bbcc))))
  & (V_yy = V_bbee))) & ~ ((((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc))
  & ~ (V_zz = e_dd)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg))
  & ~ (V_zz = e_ff)) & (V_zz = e_ee)) & (V_uu = true)) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false))
  & (($lesseq($sum($difference($difference($sum(V_bbcc,1),V_bbbb),1),1),V_bbii)
  & ((V_bbbb = $sum(V_yy,1)) & (e_gg = e_ee))) | ((~
  $lesseq($sum($difference($difference($sum(V_bbcc,1),V_bbbb),1),1),V_bbii)
  & (e_gg = e_bb)) & (V_bbbb = V_bbcc)))) & (V_bbbb = V_bbdd))
  & (V_yy = V_bbee))) & ~ (((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~
  (V_zz = e_ff)) & (V_zz = e_ee)) & (V_uu = false)) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false)) & (V_bbbb = V_bbcc))
  & (V_bbbb = V_bbcc))) & ~ (((((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc))
  & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff))
  & ~ (V_zz = e_ee)) & (V_zz = e_dd)) & ~ ((((V_uu = false) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = false) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false))) & (e_gg = e_bb)) & (V_bbbb = V_bbcc))
  & (V_yy = V_bbee)) & (V_bbbb = V_bbdd))) & ~ (((((((((((((((~ (V_zz = e_bb)
  & ~ (V_zz = e_cc)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg))
  & ~ (V_zz = e_ff)) & ~ (V_zz = e_ee)) & (V_zz = e_dd)) & (V_uu = false))
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false))
  & (V_bbbb = $sum(V_yy,1))) & (e_gg = e_ee)) & (V_bbbb = V_bbdd))
  & (V_yy = V_bbee))) & ~ (((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_ee)) & (V_zz = e_dd)) & (V_uu = false)) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false))) & ~ ((((((((((((((~ (V_zz = e_ii) & ~
  (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_dd)) & (V_zz = e_cc)) & (V_bbbb = V_bbdd)) & (V_yy = V_bbee))
  & (V_bbbb = V_bbcc)) & ~ ((((V_uu = false) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = false) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false))) & (e_gg = e_bb))) & ~ ((((((((((((((~
  (V_zz = e_ii) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_dd)) & (V_zz = e_cc)) & (V_bbbb = V_bbdd))
  & (V_yy = V_bbee)) & (V_bbbb = V_bbcc)) & (V_uu = false)) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false)) & (e_gg = e_bb))) & ~ ((((((((((((((~
  (V_zz = e_ii) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_dd)) & (V_zz = e_cc)) & (V_bbbb = V_bbdd))
  & (V_yy = V_bbee)) & (V_bbbb = V_bbcc)) & (V_uu = true)) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false)) & (e_gg = e_bb))) & ~ ((((((((((((((~
  (V_zz = e_ii) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_dd)) & (V_zz = e_cc)) & (V_bbbb = V_bbdd))
  & (V_yy = V_bbee)) & (V_bbbb = V_bbcc)) & (V_uu = true)) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false))
  & ($lesseq(V_bbjj,$difference($sum(V_yy,1),V_bbaa)) & ((e_gg = e_dd)
  & (V_bbbb = $sum(V_yy,1)))))))).

tff(f26, type, f26: (enum_aa * $int * bool * bool * bool * bool * $int *
  $int * $int * $int * $int * enum_aa * $int * bool * bool * bool * bool *
  $int * $int * $int * $int * $int * $int * $int * $int * set($int) *
  set($int) * set($int) * set($int) * $int * $int * $int * $int * $int *
  $int * $int * $int * $int * $int * $int * $int) > $o).

tff(f26_def, axiom, ![V_zz:enum_aa, V_yy:$int, V_xx:bool, V_ww:bool, V_vv:
  bool, V_uu:bool, V_tt:$int, V_ss:$int, V_rr:$int, V_qq:$int, V_pp:$int,
  V_oo:enum_aa, V_nn:$int, V_mm:bool, V_ll:bool, V_kk:bool, V_jj:bool,
  V_bbxx:$int, V_bbww:$int, V_bbvv:$int, V_bbuu:$int, V_bbtt:$int, V_bbss:
  $int, V_bbrr:$int, V_bbqq:$int, V_bbpp:set($int), V_bboo:set($int), V_bbnn:
  set($int), V_bbmm:set($int), V_bbll:$int, V_bbkk:$int, V_bbjj:$int, V_bbii:
  $int, V_bbhh:$int, V_bbgg:$int, V_bbff:$int, V_bbee:$int, V_bbdd:$int,
  V_bbcc:$int, V_bbbb:$int, V_bbaa:$int]: (f26(V_zz, V_yy, V_xx, V_ww, V_vv,
  V_uu, V_tt, V_ss, V_rr, V_qq, V_pp, V_oo, V_nn, V_mm, V_ll, V_kk, V_jj,
  V_bbxx, V_bbww, V_bbvv, V_bbuu, V_bbtt, V_bbss, V_bbrr, V_bbqq, V_bbpp,
  V_bboo, V_bbnn, V_bbmm, V_bbll, V_bbkk, V_bbjj, V_bbii, V_bbhh, V_bbgg,
  V_bbff, V_bbee, V_bbdd, V_bbcc, V_bbbb, V_bbaa) <=> ~ (V_zz = e_dd))).

tff(f34, type, f34: (enum_aa * $int * bool * bool * bool * bool * $int *
  $int * $int * $int * $int * enum_aa * $int * bool * bool * bool * bool *
  $int * $int * $int * $int * $int * $int * $int * $int * set($int) *
  set($int) * set($int) * set($int) * $int * $int * $int * $int * $int *
  $int * $int * $int * $int * $int * $int * $int) > $o).

tff(f34_def, axiom, ![V_zz:enum_aa, V_yy:$int, V_xx:bool, V_ww:bool, V_vv:
  bool, V_uu:bool, V_tt:$int, V_ss:$int, V_rr:$int, V_qq:$int, V_pp:$int,
  V_oo:enum_aa, V_nn:$int, V_mm:bool, V_ll:bool, V_kk:bool, V_jj:bool,
  V_bbxx:$int, V_bbww:$int, V_bbvv:$int, V_bbuu:$int, V_bbtt:$int, V_bbss:
  $int, V_bbrr:$int, V_bbqq:$int, V_bbpp:set($int), V_bboo:set($int), V_bbnn:
  set($int), V_bbmm:set($int), V_bbll:$int, V_bbkk:$int, V_bbjj:$int, V_bbii:
  $int, V_bbhh:$int, V_bbgg:$int, V_bbff:$int, V_bbee:$int, V_bbdd:$int,
  V_bbcc:$int, V_bbbb:$int, V_bbaa:$int]: (f34(V_zz, V_yy, V_xx, V_ww, V_vv,
  V_uu, V_tt, V_ss, V_rr, V_qq, V_pp, V_oo, V_nn, V_mm, V_ll, V_kk, V_jj,
  V_bbxx, V_bbww, V_bbvv, V_bbuu, V_bbtt, V_bbss, V_bbrr, V_bbqq, V_bbpp,
  V_bboo, V_bbnn, V_bbmm, V_bbll, V_bbkk, V_bbjj, V_bbii, V_bbhh, V_bbgg,
  V_bbff, V_bbee, V_bbdd, V_bbcc, V_bbbb, V_bbaa)
  <=> ((((((((((((((((((($true & ~ (V_zz = e_bb)) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_ee)) & (V_zz = e_dd)) & (V_uu = true)) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false)) & mem($int, $sum(V_yy,1), integer))
  & $lesseq(0,$sum(V_yy,1))) & mem($int, $sum(V_bbaa,1), integer))
  & $lesseq(0,$sum(V_bbaa,1))) & mem($int, $sum(V_bbbb,1), integer))
  & $lesseq(0,$sum(V_bbbb,1))) & ~ (((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_ee)) & (V_zz = e_dd)) & (V_uu = true))
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false))))).

tff(f36, type, f36: (enum_aa * $int * bool * bool * bool * bool * $int *
  $int * $int * $int * $int * enum_aa * $int * bool * bool * bool * bool *
  $int * $int * $int * $int * $int * $int * $int * $int * set($int) *
  set($int) * set($int) * set($int) * $int * $int * $int * $int * $int *
  $int * $int * $int * $int * $int * $int * $int) > $o).

tff(f36_def, axiom, ![V_zz:enum_aa, V_yy:$int, V_xx:bool, V_ww:bool, V_vv:
  bool, V_uu:bool, V_tt:$int, V_ss:$int, V_rr:$int, V_qq:$int, V_pp:$int,
  V_oo:enum_aa, V_nn:$int, V_mm:bool, V_ll:bool, V_kk:bool, V_jj:bool,
  V_bbxx:$int, V_bbww:$int, V_bbvv:$int, V_bbuu:$int, V_bbtt:$int, V_bbss:
  $int, V_bbrr:$int, V_bbqq:$int, V_bbpp:set($int), V_bboo:set($int), V_bbnn:
  set($int), V_bbmm:set($int), V_bbll:$int, V_bbkk:$int, V_bbjj:$int, V_bbii:
  $int, V_bbhh:$int, V_bbgg:$int, V_bbff:$int, V_bbee:$int, V_bbdd:$int,
  V_bbcc:$int, V_bbbb:$int, V_bbaa:$int]: (f36(V_zz, V_yy, V_xx, V_ww, V_vv,
  V_uu, V_tt, V_ss, V_rr, V_qq, V_pp, V_oo, V_nn, V_mm, V_ll, V_kk, V_jj,
  V_bbxx, V_bbww, V_bbvv, V_bbuu, V_bbtt, V_bbss, V_bbrr, V_bbqq, V_bbpp,
  V_bboo, V_bbnn, V_bbmm, V_bbll, V_bbkk, V_bbjj, V_bbii, V_bbhh, V_bbgg,
  V_bbff, V_bbee, V_bbdd, V_bbcc, V_bbbb, V_bbaa)
  <=> ($sum(V_bbaa,1) = V_bbaa))).

tff(f37, type, f37: (enum_aa * $int * bool * bool * bool * bool * $int *
  $int * $int * $int * $int * enum_aa * $int * bool * bool * bool * bool *
  $int * $int * $int * $int * $int * $int * $int * $int * set($int) *
  set($int) * set($int) * set($int) * $int * $int * $int * $int * $int *
  $int * $int * $int * $int * $int * $int * $int) > $o).

tff(f37_def, axiom, ![V_zz:enum_aa, V_yy:$int, V_xx:bool, V_ww:bool, V_vv:
  bool, V_uu:bool, V_tt:$int, V_ss:$int, V_rr:$int, V_qq:$int, V_pp:$int,
  V_oo:enum_aa, V_nn:$int, V_mm:bool, V_ll:bool, V_kk:bool, V_jj:bool,
  V_bbxx:$int, V_bbww:$int, V_bbvv:$int, V_bbuu:$int, V_bbtt:$int, V_bbss:
  $int, V_bbrr:$int, V_bbqq:$int, V_bbpp:set($int), V_bboo:set($int), V_bbnn:
  set($int), V_bbmm:set($int), V_bbll:$int, V_bbkk:$int, V_bbjj:$int, V_bbii:
  $int, V_bbhh:$int, V_bbgg:$int, V_bbff:$int, V_bbee:$int, V_bbdd:$int,
  V_bbcc:$int, V_bbbb:$int, V_bbaa:$int]: (f37(V_zz, V_yy, V_xx, V_ww, V_vv,
  V_uu, V_tt, V_ss, V_rr, V_qq, V_pp, V_oo, V_nn, V_mm, V_ll, V_kk, V_jj,
  V_bbxx, V_bbww, V_bbvv, V_bbuu, V_bbtt, V_bbss, V_bbrr, V_bbqq, V_bbpp,
  V_bboo, V_bbnn, V_bbmm, V_bbll, V_bbkk, V_bbjj, V_bbii, V_bbhh, V_bbgg,
  V_bbff, V_bbee, V_bbdd, V_bbcc, V_bbbb, V_bbaa)
  <=> ($sum(V_bbbb,1) = V_bbbb))).

tff(f38, type, f38: (enum_aa * $int * bool * bool * bool * bool * $int *
  $int * $int * $int * $int * enum_aa * $int * bool * bool * bool * bool *
  $int * $int * $int * $int * $int * $int * $int * $int * set($int) *
  set($int) * set($int) * set($int) * $int * $int * $int * $int * $int *
  $int * $int * $int * $int * $int * $int * $int) > $o).

tff(f38_def, axiom, ![V_zz:enum_aa, V_yy:$int, V_xx:bool, V_ww:bool, V_vv:
  bool, V_uu:bool, V_tt:$int, V_ss:$int, V_rr:$int, V_qq:$int, V_pp:$int,
  V_oo:enum_aa, V_nn:$int, V_mm:bool, V_ll:bool, V_kk:bool, V_jj:bool,
  V_bbxx:$int, V_bbww:$int, V_bbvv:$int, V_bbuu:$int, V_bbtt:$int, V_bbss:
  $int, V_bbrr:$int, V_bbqq:$int, V_bbpp:set($int), V_bboo:set($int), V_bbnn:
  set($int), V_bbmm:set($int), V_bbll:$int, V_bbkk:$int, V_bbjj:$int, V_bbii:
  $int, V_bbhh:$int, V_bbgg:$int, V_bbff:$int, V_bbee:$int, V_bbdd:$int,
  V_bbcc:$int, V_bbbb:$int, V_bbaa:$int]: (f38(V_zz, V_yy, V_xx, V_ww, V_vv,
  V_uu, V_tt, V_ss, V_rr, V_qq, V_pp, V_oo, V_nn, V_mm, V_ll, V_kk, V_jj,
  V_bbxx, V_bbww, V_bbvv, V_bbuu, V_bbtt, V_bbss, V_bbrr, V_bbqq, V_bbpp,
  V_bboo, V_bbnn, V_bbmm, V_bbll, V_bbkk, V_bbjj, V_bbii, V_bbhh, V_bbgg,
  V_bbff, V_bbee, V_bbdd, V_bbcc, V_bbbb, V_bbaa)
  <=> ((((((((((((((((((((((((((((((((((((((((((((((((($true & ~
  (V_zz = e_bb)) & ~ (V_zz = e_cc)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ee)) & (V_zz = e_dd))
  & (V_uu = true)) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))
  & mem($int, $sum(V_yy,1), integer)) & $lesseq(0,$sum(V_yy,1))) & $true) & ~
  (((((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_hh))
  & (V_zz = e_ii)) & ($sum(V_yy,1) = V_bbee)) & (V_bbbb = V_bbdd))
  & (V_bbbb = V_bbcc)) & ~ ((((V_uu = false) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = false) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false))) & (e_gg = e_bb))) & ~ (((((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_hh)) & (V_zz = e_ii))
  & ($sum(V_yy,1) = V_bbee)) & (V_bbbb = V_bbdd)) & (V_bbbb = V_bbcc))
  & (V_uu = false)) & (V_vv = true)) & (V_ww = false)) & (V_xx = false))
  & (e_gg = e_bb))) & ~ (((((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~
  (V_zz = e_hh)) & (V_zz = e_ii)) & ($sum(V_yy,1) = V_bbee))
  & (V_bbbb = V_bbdd)) & (V_bbbb = V_bbcc)) & (V_uu = true)) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false)) & (e_gg = e_bb))) & ~ (((((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_hh)) & (V_zz = e_ii))
  & ($sum(V_yy,1) = V_bbee)) & (V_bbbb = V_bbdd)) & (V_bbbb = V_bbcc))
  & (V_uu = true)) & (V_vv = true)) & (V_ww = false)) & (V_xx = false))
  & (e_gg = e_bb))) & ~ (((((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~
  (V_zz = e_hh)) & (V_zz = e_ii)) & ($sum(V_yy,1) = V_bbee))
  & (V_bbbb = V_bbdd)) & (V_bbbb = V_bbcc)) & (V_uu = false))
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false)) & (~
  $lesseq($sum($difference(V_yy,V_bbee),1),$sum(V_bbff,V_bbgg))
  & (e_gg = e_bb)))) & ~ (((((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc))
  & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_gg))
  & ~ (V_zz = e_ii)) & (V_zz = e_hh)) & (V_bbbb = V_bbcc))
  & (V_bbbb = V_bbdd)) & ~ ((((V_uu = false) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = false) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false))) & (e_gg = e_bb))
  & ($sum(V_yy,1) = V_bbee))) & ~ (((((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ii)) & (V_zz = e_hh)) & (V_bbbb = V_bbcc))
  & (V_bbbb = V_bbdd)) & (V_uu = false)) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))) & ~ (((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~
  (V_zz = e_ii)) & (V_zz = e_hh)) & (V_bbbb = V_bbcc)) & (V_bbbb = V_bbdd))
  & (V_uu = true)) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~
  (((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ii))
  & (V_zz = e_hh)) & (V_bbbb = V_bbcc)) & (V_bbbb = V_bbdd)) & (V_uu = true))
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & ~ (((((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ii)) & (V_zz = e_hh))
  & (V_bbbb = V_bbcc)) & (V_bbbb = V_bbdd)) & (V_uu = false))
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false)) & (~
  $lesseq($sum($difference($difference($sum(V_yy,1),V_bbee),1),1),V_bbff)
  & (e_gg = e_ii))) & ($sum(V_yy,1) = V_bbee))) & ~ (((((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & (V_zz = e_gg))
  & (V_bbbb = V_bbdd)) & (V_bbbb = V_bbcc)) & ~ ((((V_uu = false)
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = true)
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & ~ ((((V_uu = true)
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = false)
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & (e_gg = e_bb))
  & ($sum(V_yy,1) = V_bbee))) & ~ ((((((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & (V_zz = e_gg)) & (V_bbbb = V_bbdd))
  & (V_bbbb = V_bbcc)) & (V_uu = false)) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))
  & ($lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh) | ((~
  $lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)
  & (e_gg = e_bb)) & ($sum(V_yy,1) = V_bbee))))) & ~ ((((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & (V_zz = e_gg))
  & (V_bbbb = V_bbdd)) & (V_bbbb = V_bbcc)) & (V_uu = true)) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false))
  & ($lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh) | ((~
  $lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)
  & (e_gg = e_bb)) & ($sum(V_yy,1) = V_bbee))))) & ~ ((((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & (V_zz = e_gg))
  & (V_bbbb = V_bbdd)) & (V_bbbb = V_bbcc)) & (V_uu = true)) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false))
  & ($lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh) | ((~
  $lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)
  & (e_gg = e_bb)) & ($sum(V_yy,1) = V_bbee))))) & ~ (((((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & (V_zz = e_gg))
  & (V_bbbb = V_bbdd)) & (V_bbbb = V_bbcc)) & (V_uu = false))
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false))
  & (($lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)
  & (e_gg = e_hh)) | (~
  $lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)
  & (e_gg = e_bb)))) & ($sum(V_yy,1) = V_bbee))) & ~ (((((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & (V_zz = e_gg))
  & (V_bbbb = V_bbdd)) & (V_bbbb = V_bbcc)) & (e_gg = e_bb))
  & ($sum(V_yy,1) = V_bbee)) & ~ ((((V_uu = false) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = false) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false)))) & ~ (((((((((((((((~ (V_zz = e_bb)
  & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff))
  & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & (V_zz = e_gg)) & (V_bbbb = V_bbdd))
  & (V_bbbb = V_bbcc)) & (e_gg = e_bb)) & ($sum(V_yy,1) = V_bbee))
  & (V_uu = false)) & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & ~
  (((((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh))
  & (V_zz = e_gg)) & (V_bbbb = V_bbdd)) & (V_bbbb = V_bbcc)) & (e_gg = e_bb))
  & ($sum(V_yy,1) = V_bbee)) & (V_uu = true)) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false))) & ~ (((((((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & (V_zz = e_gg)) & (V_bbbb = V_bbdd))
  & (V_bbbb = V_bbcc)) & (e_gg = e_bb)) & ($sum(V_yy,1) = V_bbee))
  & (V_uu = true)) & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & ~
  (((((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh))
  & (V_zz = e_gg)) & (V_bbbb = V_bbdd)) & (V_bbbb = V_bbcc)) & (e_gg = e_bb))
  & ($sum(V_yy,1) = V_bbee)) & (V_uu = false)) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false))) & ~ (((((((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & ~ (V_zz = e_gg)) & (V_zz = e_ff)) & (V_bbbb = V_bbcc)) & ~
  ((((V_uu = false) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~
  ((((V_uu = true) & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & ~
  ((((V_uu = true) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~
  ((((V_uu = false) & (V_vv = true)) & (V_ww = false)) & (V_xx = false)))
  & (e_gg = e_bb)) & (V_bbbb = V_bbdd)) & ($sum(V_yy,1) = V_bbee))) & ~
  (((((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg))
  & (V_zz = e_ff)) & (V_bbbb = V_bbcc)) & (V_bbbb = V_bbdd)) & (V_uu = true))
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false)) & (e_gg = e_bb))
  & ($sum(V_yy,1) = V_bbee))) & ~ (((((((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & ~ (V_zz = e_gg)) & (V_zz = e_ff)) & (V_bbbb = V_bbcc))
  & (V_bbbb = V_bbdd)) & (V_uu = true)) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false)) & (e_gg = e_bb)) & ($sum(V_yy,1) = V_bbee))) & ~
  (((((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff))
  & (V_zz = e_ee)) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))) & (e_gg = e_bb)) & (V_bbbb = V_bbdd))
  & (V_bbbb = V_bbcc)) & ($sum(V_yy,1) = V_bbee))) & ~ (((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff)) & (V_zz = e_ee))
  & (V_uu = false)) & (V_vv = true)) & (V_ww = false)) & (V_xx = false))
  & ((($lesseq($sum($difference($difference($sum(V_bbcc,1),V_bbbb),1),1),V_bbii)
  & ((V_bbbb = $sum(V_yy,1)) & (e_gg = e_ee))) & (V_bbbb = V_bbdd)) | ((~
  $lesseq($sum($difference($difference($sum(V_bbcc,1),V_bbbb),1),1),V_bbii)
  & ((V_bbbb = $sum(V_yy,1)) & (e_gg = e_ff))) & (V_bbbb = V_bbcc))))
  & ($sum(V_yy,1) = V_bbee))) & ~ (((((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ff)) & (V_zz = e_ee)) & (V_uu = true))
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false)) & (V_bbbb = V_bbcc))
  & (V_bbbb = V_bbcc))) & ~ ((((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc))
  & ~ (V_zz = e_dd)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg))
  & ~ (V_zz = e_ff)) & (V_zz = e_ee)) & (V_uu = true)) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false))
  & (($lesseq($sum($difference($difference($sum(V_bbcc,1),V_bbbb),1),1),V_bbii)
  & ((V_bbbb = $sum(V_yy,1)) & (e_gg = e_ee))) | ((~
  $lesseq($sum($difference($difference($sum(V_bbcc,1),V_bbbb),1),1),V_bbii)
  & (e_gg = e_bb)) & (V_bbbb = V_bbcc)))) & (V_bbbb = V_bbdd))
  & ($sum(V_yy,1) = V_bbee))) & ~ (((((((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_ee)) & (V_zz = e_dd)) & ~ ((((V_uu = false)
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = true)
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & ~ ((((V_uu = true)
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = false)
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & (e_gg = e_bb))
  & (V_bbbb = V_bbcc)) & ($sum(V_yy,1) = V_bbee)) & (V_bbbb = V_bbdd))) & ~
  (((((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ee))
  & (V_zz = e_dd)) & (V_uu = false)) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false)) & (V_bbbb = $sum(V_yy,1))) & (e_gg = e_ee))
  & (V_bbbb = V_bbdd)) & ($sum(V_yy,1) = V_bbee))) & ~ (((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ee)) & (V_zz = e_dd))
  & (V_uu = true)) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~
  ((((((((((((((~ (V_zz = e_ii) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_dd)) & (V_zz = e_cc))
  & (V_bbbb = V_bbdd)) & ($sum(V_yy,1) = V_bbee)) & (V_bbbb = V_bbcc)) & ~
  ((((V_uu = false) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~
  ((((V_uu = true) & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & ~
  ((((V_uu = true) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~
  ((((V_uu = false) & (V_vv = true)) & (V_ww = false)) & (V_xx = false)))
  & (e_gg = e_bb))) & ~ ((((((((((((((~ (V_zz = e_ii) & ~ (V_zz = e_hh)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_dd))
  & (V_zz = e_cc)) & (V_bbbb = V_bbdd)) & ($sum(V_yy,1) = V_bbee))
  & (V_bbbb = V_bbcc)) & (V_uu = false)) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false)) & (e_gg = e_bb))) & ~ ((((((((((((((~ (V_zz = e_ii) & ~
  (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_dd)) & (V_zz = e_cc)) & (V_bbbb = V_bbdd))
  & ($sum(V_yy,1) = V_bbee)) & (V_bbbb = V_bbcc)) & (V_uu = true))
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false)) & (e_gg = e_bb))) & ~
  ((((((((((((((~ (V_zz = e_ii) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_dd)) & (V_zz = e_cc))
  & (V_bbbb = V_bbdd)) & ($sum(V_yy,1) = V_bbee)) & (V_bbbb = V_bbcc))
  & (V_uu = true)) & (V_vv = true)) & (V_ww = false)) & (V_xx = false))
  & ($lesseq(V_bbjj,$difference($sum(V_yy,1),V_bbaa)) & ((e_gg = e_dd)
  & (V_bbbb = $sum(V_yy,1)))))))).

tff(f39, type, f39: (enum_aa * $int * bool * bool * bool * bool * $int *
  $int * $int * $int * $int * enum_aa * $int * bool * bool * bool * bool *
  $int * $int * $int * $int * $int * $int * $int * $int * set($int) *
  set($int) * set($int) * set($int) * $int * $int * $int * $int * $int *
  $int * $int * $int * $int * $int * $int * $int) > $o).

tff(f39_def, axiom, ![V_zz:enum_aa, V_yy:$int, V_xx:bool, V_ww:bool, V_vv:
  bool, V_uu:bool, V_tt:$int, V_ss:$int, V_rr:$int, V_qq:$int, V_pp:$int,
  V_oo:enum_aa, V_nn:$int, V_mm:bool, V_ll:bool, V_kk:bool, V_jj:bool,
  V_bbxx:$int, V_bbww:$int, V_bbvv:$int, V_bbuu:$int, V_bbtt:$int, V_bbss:
  $int, V_bbrr:$int, V_bbqq:$int, V_bbpp:set($int), V_bboo:set($int), V_bbnn:
  set($int), V_bbmm:set($int), V_bbll:$int, V_bbkk:$int, V_bbjj:$int, V_bbii:
  $int, V_bbhh:$int, V_bbgg:$int, V_bbff:$int, V_bbee:$int, V_bbdd:$int,
  V_bbcc:$int, V_bbbb:$int, V_bbaa:$int]: (f39(V_zz, V_yy, V_xx, V_ww, V_vv,
  V_uu, V_tt, V_ss, V_rr, V_qq, V_pp, V_oo, V_nn, V_mm, V_ll, V_kk, V_jj,
  V_bbxx, V_bbww, V_bbvv, V_bbuu, V_bbtt, V_bbss, V_bbrr, V_bbqq, V_bbpp,
  V_bboo, V_bbnn, V_bbmm, V_bbll, V_bbkk, V_bbjj, V_bbii, V_bbhh, V_bbgg,
  V_bbff, V_bbee, V_bbdd, V_bbcc, V_bbbb, V_bbaa)
  <=> ($sum(V_yy,1) = V_bbee))).

tff(f40, type, f40: (enum_aa * $int * bool * bool * bool * bool * $int *
  $int * $int * $int * $int * enum_aa * $int * bool * bool * bool * bool *
  $int * $int * $int * $int * $int * $int * $int * $int * set($int) *
  set($int) * set($int) * set($int) * $int * $int * $int * $int * $int *
  $int * $int * $int * $int * $int * $int * $int) > $o).

tff(f40_def, axiom, ![V_zz:enum_aa, V_yy:$int, V_xx:bool, V_ww:bool, V_vv:
  bool, V_uu:bool, V_tt:$int, V_ss:$int, V_rr:$int, V_qq:$int, V_pp:$int,
  V_oo:enum_aa, V_nn:$int, V_mm:bool, V_ll:bool, V_kk:bool, V_jj:bool,
  V_bbxx:$int, V_bbww:$int, V_bbvv:$int, V_bbuu:$int, V_bbtt:$int, V_bbss:
  $int, V_bbrr:$int, V_bbqq:$int, V_bbpp:set($int), V_bboo:set($int), V_bbnn:
  set($int), V_bbmm:set($int), V_bbll:$int, V_bbkk:$int, V_bbjj:$int, V_bbii:
  $int, V_bbhh:$int, V_bbgg:$int, V_bbff:$int, V_bbee:$int, V_bbdd:$int,
  V_bbcc:$int, V_bbbb:$int, V_bbaa:$int]: (f40(V_zz, V_yy, V_xx, V_ww, V_vv,
  V_uu, V_tt, V_ss, V_rr, V_qq, V_pp, V_oo, V_nn, V_mm, V_ll, V_kk, V_jj,
  V_bbxx, V_bbww, V_bbvv, V_bbuu, V_bbtt, V_bbss, V_bbrr, V_bbqq, V_bbpp,
  V_bboo, V_bbnn, V_bbmm, V_bbll, V_bbkk, V_bbjj, V_bbii, V_bbhh, V_bbgg,
  V_bbff, V_bbee, V_bbdd, V_bbcc, V_bbbb, V_bbaa)
  <=> (((((((((((((((((((((((((((((((((((((((((((((((((((($true & ~
  (V_zz = e_bb)) & ~ (V_zz = e_cc)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ee)) & (V_zz = e_dd))
  & (V_uu = false)) & (V_vv = true)) & (V_ww = false)) & (V_xx = false))
  & mem($int, $sum(V_yy,1), integer)) & $lesseq(0,$sum(V_yy,1))) & $true) & ~
  (((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_hh))
  & (V_zz = e_ii)) & ($sum(V_yy,1) = V_bbcc)) & ~ ((((V_uu = false)
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = true)
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & ~ ((((V_uu = true)
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = false)
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & (e_ee = e_bb))) & ~
  (((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_hh))
  & (V_zz = e_ii)) & ($sum(V_yy,1) = V_bbcc)) & (V_uu = false))
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false)) & (e_ee = e_bb))) & ~
  (((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_hh))
  & (V_zz = e_ii)) & ($sum(V_yy,1) = V_bbcc)) & (V_uu = true))
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false)) & (e_ee = e_bb))) & ~
  (((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_hh))
  & (V_zz = e_ii)) & ($sum(V_yy,1) = V_bbcc)) & (V_uu = true))
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false)) & (e_ee = e_bb))) & ~
  (((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_hh))
  & (V_zz = e_ii)) & ($sum(V_yy,1) = V_bbcc)) & (V_uu = false))
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false)) & (~
  $lesseq($sum($difference(V_yy,V_bbee),1),$sum(V_bbff,V_bbgg))
  & (e_ee = e_bb)))) & ~ (((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~
  (V_zz = e_ii)) & (V_zz = e_hh)) & ($sum(V_yy,1) = V_bbcc)) & ~
  ((((V_uu = false) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~
  ((((V_uu = true) & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & ~
  ((((V_uu = true) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~
  ((((V_uu = false) & (V_vv = true)) & (V_ww = false)) & (V_xx = false)))
  & (e_ee = e_bb))) & ~ ((((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~
  (V_zz = e_ii)) & (V_zz = e_hh)) & ($sum(V_yy,1) = V_bbcc))
  & (V_uu = false)) & (V_vv = true)) & (V_ww = false)) & (V_xx = false))
  & (e_ee = e_gg)) & (V_bbee = $sum(V_yy,1)))) & ~ ((((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ii)) & (V_zz = e_hh))
  & ($sum(V_yy,1) = V_bbcc)) & (V_uu = true)) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false)) & (e_ee = e_gg))
  & (V_bbee = $sum(V_yy,1)))) & ~ ((((((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ii)) & (V_zz = e_hh))
  & ($sum(V_yy,1) = V_bbcc)) & (V_uu = true)) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false)) & (e_ee = e_gg))
  & (V_bbee = $sum(V_yy,1)))) & ~ (((((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ii)) & (V_zz = e_hh))
  & ($sum(V_yy,1) = V_bbcc)) & (V_uu = false)) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false)) & (~
  $lesseq($sum($difference($difference($sum(V_yy,1),V_bbee),1),1),V_bbff)
  & (e_ee = e_ii)))) & ~ (((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & (V_zz = e_gg)) & ($sum(V_yy,1) = V_bbcc)) & ~
  ((((V_uu = false) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~
  ((((V_uu = true) & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & ~
  ((((V_uu = true) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~
  ((((V_uu = false) & (V_vv = true)) & (V_ww = false)) & (V_xx = false)))
  & (e_ee = e_bb))) & ~ (((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & (V_zz = e_gg)) & ($sum(V_yy,1) = V_bbcc))
  & (V_uu = false)) & (V_vv = true)) & (V_ww = false)) & (V_xx = false))
  & (($lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)
  & ((e_ee = e_gg) & (V_bbee = $sum(V_yy,1)))) | (~
  $lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)
  & (e_ee = e_bb))))) & ~ (((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & (V_zz = e_gg)) & ($sum(V_yy,1) = V_bbcc)) & (V_uu = true))
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false))
  & (($lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)
  & ((e_ee = e_gg) & (V_bbee = $sum(V_yy,1)))) | (~
  $lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)
  & (e_ee = e_bb))))) & ~ (((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & (V_zz = e_gg)) & ($sum(V_yy,1) = V_bbcc)) & (V_uu = true))
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false))
  & (($lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)
  & ((e_ee = e_gg) & (V_bbee = $sum(V_yy,1)))) | (~
  $lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)
  & (e_ee = e_bb))))) & ~ (((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & (V_zz = e_gg)) & ($sum(V_yy,1) = V_bbcc))
  & (V_uu = false)) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))
  & (($lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)
  & (e_ee = e_hh)) | (~
  $lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)
  & (e_ee = e_bb))))) & ~ (((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & (V_zz = e_gg)) & ($sum(V_yy,1) = V_bbcc)) & (e_ee = e_bb))
  & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = true)) & (V_xx = false)))
  & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = false)) & (V_xx = false)))
  & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = true)) & (V_xx = false)))
  & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false)))) & ~ (((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & (V_zz = e_gg)) & ($sum(V_yy,1) = V_bbcc)) & (e_ee = e_bb))
  & (V_uu = false)) & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & ~
  (((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh))
  & (V_zz = e_gg)) & ($sum(V_yy,1) = V_bbcc)) & (e_ee = e_bb))
  & (V_uu = true)) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~
  (((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh))
  & (V_zz = e_gg)) & ($sum(V_yy,1) = V_bbcc)) & (e_ee = e_bb))
  & (V_uu = true)) & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & ~
  (((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh))
  & (V_zz = e_gg)) & ($sum(V_yy,1) = V_bbcc)) & (e_ee = e_bb))
  & (V_uu = false)) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~
  (((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg))
  & (V_zz = e_ff)) & ($sum(V_yy,1) = V_bbcc)) & ~ ((((V_uu = false)
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = true)
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & ~ ((((V_uu = true)
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = false)
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & (e_ee = e_bb))) & ~
  (((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg))
  & (V_zz = e_ff)) & ($sum(V_yy,1) = V_bbcc)) & (V_uu = true))
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false)) & (e_ee = e_bb))) & ~
  (((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg))
  & (V_zz = e_ff)) & ($sum(V_yy,1) = V_bbcc)) & (V_uu = true))
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false)) & (e_ee = e_bb))) & ~
  ((((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg))
  & (V_zz = e_ff)) & ($sum(V_yy,1) = V_bbcc)) & (V_uu = false))
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false)) & (e_ee = e_gg))
  & (V_bbee = V_yy))) & ~ (((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~
  (V_zz = e_ff)) & (V_zz = e_ee)) & ~ ((((V_uu = false) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = false) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false))) & (e_ee = e_bb))
  & ($sum(V_yy,1) = V_bbcc))) & ~ ((((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ff)) & (V_zz = e_ee)) & (V_uu = false))
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false))
  & ($lesseq($sum($difference($difference($sum(V_bbcc,1),V_bbbb),1),1),V_bbii)
  | ((~
  $lesseq($sum($difference($difference($sum(V_bbcc,1),V_bbbb),1),1),V_bbii)
  & ((V_bbdd = $sum(V_yy,1)) & (e_ee = e_ff))) & ($sum(V_yy,1) = V_bbcc)))))
  & ~ (((((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd))
  & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff))
  & (V_zz = e_ee)) & (V_uu = true)) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false)) & (e_ee = e_gg)) & (V_bbdd = V_bbcc))
  & (V_bbee = $sum(V_yy,1))) & ($sum(V_yy,1) = V_bbcc))) & ~ ((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff)) & (V_zz = e_ee))
  & (V_uu = true)) & (V_vv = true)) & (V_ww = false)) & (V_xx = false))
  & ($lesseq($sum($difference($difference($sum(V_bbcc,1),V_bbbb),1),1),V_bbii)
  | ((~
  $lesseq($sum($difference($difference($sum(V_bbcc,1),V_bbbb),1),1),V_bbii)
  & (e_ee = e_bb)) & ($sum(V_yy,1) = V_bbcc))))) & ~ (((((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff)) & (V_zz = e_ee))
  & (V_uu = false)) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))
  & (e_ee = e_gg)) & (V_bbdd = V_bbcc)) & (V_bbee = V_yy))
  & ($sum(V_yy,1) = V_bbcc))) & ~ (((((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_ee)) & (V_zz = e_dd)) & ~ ((((V_uu = false)
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = true)
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & ~ ((((V_uu = true)
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = false)
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & (e_ee = e_bb))
  & ($sum(V_yy,1) = V_bbcc))) & ~ (((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_ee)) & (V_zz = e_dd)) & (V_uu = false))
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & ~ (((((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ee)) & (V_zz = e_dd))
  & (V_uu = true)) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))
  & (e_ee = e_gg)) & ($sum(V_yy,1) = V_bbbb)) & (V_bbdd = V_bbbb))
  & (V_bbee = $sum(V_yy,1)))) & ~ (((((((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_ee)) & (V_zz = e_dd)) & (V_uu = false))
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false)) & (e_ee = e_gg))
  & ($sum(V_yy,1) = V_bbbb)) & (V_bbdd = V_bbbb)) & (V_bbee = V_yy))) & ~
  ((((((((((((~ (V_zz = e_ii) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_dd)) & (V_zz = e_cc))
  & ($sum(V_yy,1) = V_bbcc)) & ~ ((((V_uu = false) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = false) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false))) & (e_ee = e_bb))) & ~ ((((((((((((~
  (V_zz = e_ii) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_dd)) & (V_zz = e_cc))
  & ($sum(V_yy,1) = V_bbcc)) & (V_uu = false)) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false)) & (e_ee = e_bb))) & ~ ((((((((((((~
  (V_zz = e_ii) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_dd)) & (V_zz = e_cc))
  & ($sum(V_yy,1) = V_bbcc)) & (V_uu = true)) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false)) & (e_ee = e_bb))) & ~ ((((((((((((~
  (V_zz = e_ii) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_dd)) & (V_zz = e_cc))
  & ($sum(V_yy,1) = V_bbcc)) & (V_uu = true)) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false))
  & ($lesseq(V_bbjj,$difference($sum(V_yy,1),V_bbaa)) & ((e_ee = e_dd)
  & (V_bbbb = $sum(V_yy,1)))))))).

tff(f41, type, f41: (enum_aa * $int * bool * bool * bool * bool * $int *
  $int * $int * $int * $int * enum_aa * $int * bool * bool * bool * bool *
  $int * $int * $int * $int * $int * $int * $int * $int * set($int) *
  set($int) * set($int) * set($int) * $int * $int * $int * $int * $int *
  $int * $int * $int * $int * $int * $int * $int) > $o).

tff(f41_def, axiom, ![V_zz:enum_aa, V_yy:$int, V_xx:bool, V_ww:bool, V_vv:
  bool, V_uu:bool, V_tt:$int, V_ss:$int, V_rr:$int, V_qq:$int, V_pp:$int,
  V_oo:enum_aa, V_nn:$int, V_mm:bool, V_ll:bool, V_kk:bool, V_jj:bool,
  V_bbxx:$int, V_bbww:$int, V_bbvv:$int, V_bbuu:$int, V_bbtt:$int, V_bbss:
  $int, V_bbrr:$int, V_bbqq:$int, V_bbpp:set($int), V_bboo:set($int), V_bbnn:
  set($int), V_bbmm:set($int), V_bbll:$int, V_bbkk:$int, V_bbjj:$int, V_bbii:
  $int, V_bbhh:$int, V_bbgg:$int, V_bbff:$int, V_bbee:$int, V_bbdd:$int,
  V_bbcc:$int, V_bbbb:$int, V_bbaa:$int]: (f41(V_zz, V_yy, V_xx, V_ww, V_vv,
  V_uu, V_tt, V_ss, V_rr, V_qq, V_pp, V_oo, V_nn, V_mm, V_ll, V_kk, V_jj,
  V_bbxx, V_bbww, V_bbvv, V_bbuu, V_bbtt, V_bbss, V_bbrr, V_bbqq, V_bbpp,
  V_bboo, V_bbnn, V_bbmm, V_bbll, V_bbkk, V_bbjj, V_bbii, V_bbhh, V_bbgg,
  V_bbff, V_bbee, V_bbdd, V_bbcc, V_bbbb, V_bbaa)
  <=> ($sum(V_yy,1) = V_bbcc))).

tff(f43, type, f43: (enum_aa * $int * bool * bool * bool * bool * $int *
  $int * $int * $int * $int * enum_aa * $int * bool * bool * bool * bool *
  $int * $int * $int * $int * $int * $int * $int * $int * set($int) *
  set($int) * set($int) * set($int) * $int * $int * $int * $int * $int *
  $int * $int * $int * $int * $int * $int * $int) > $o).

tff(f43_def, axiom, ![V_zz:enum_aa, V_yy:$int, V_xx:bool, V_ww:bool, V_vv:
  bool, V_uu:bool, V_tt:$int, V_ss:$int, V_rr:$int, V_qq:$int, V_pp:$int,
  V_oo:enum_aa, V_nn:$int, V_mm:bool, V_ll:bool, V_kk:bool, V_jj:bool,
  V_bbxx:$int, V_bbww:$int, V_bbvv:$int, V_bbuu:$int, V_bbtt:$int, V_bbss:
  $int, V_bbrr:$int, V_bbqq:$int, V_bbpp:set($int), V_bboo:set($int), V_bbnn:
  set($int), V_bbmm:set($int), V_bbll:$int, V_bbkk:$int, V_bbjj:$int, V_bbii:
  $int, V_bbhh:$int, V_bbgg:$int, V_bbff:$int, V_bbee:$int, V_bbdd:$int,
  V_bbcc:$int, V_bbbb:$int, V_bbaa:$int]: (f43(V_zz, V_yy, V_xx, V_ww, V_vv,
  V_uu, V_tt, V_ss, V_rr, V_qq, V_pp, V_oo, V_nn, V_mm, V_ll, V_kk, V_jj,
  V_bbxx, V_bbww, V_bbvv, V_bbuu, V_bbtt, V_bbss, V_bbrr, V_bbqq, V_bbpp,
  V_bboo, V_bbnn, V_bbmm, V_bbll, V_bbkk, V_bbjj, V_bbii, V_bbhh, V_bbgg,
  V_bbff, V_bbee, V_bbdd, V_bbcc, V_bbbb, V_bbaa)
  <=> ((((((((((((((((((((((((((((((((((((((((((((((((((($true & ~
  (V_zz = e_bb)) & ~ (V_zz = e_cc)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ee)) & ~ ((((V_uu = false)
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = true)
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & ~ ((((V_uu = true)
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = false)
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & (V_zz = e_dd))
  & mem($int, $sum(V_yy,1), integer)) & $lesseq(0,$sum(V_yy,1))) & $true) & ~
  (((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_hh))
  & (V_zz = e_ii)) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false)))) & ~ (((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~
  (V_zz = e_hh)) & (V_zz = e_ii)) & (V_uu = false)) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false))) & ~ (((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_hh)) & (V_zz = e_ii)) & (V_uu = true))
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~ (((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_hh)) & (V_zz = e_ii))
  & (V_uu = true)) & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & ~
  ((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_hh))
  & (V_zz = e_ii)) & (V_uu = false)) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false)) & ~
  $lesseq($sum($difference(V_yy,V_bbee),1),$sum(V_bbff,V_bbgg)))) & ~
  (((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ii))
  & (V_zz = e_hh)) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false)))) & ~ (((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~
  (V_zz = e_ii)) & (V_zz = e_hh)) & (V_uu = false)) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false)) & (e_bb = e_gg))
  & (V_bbee = $sum(V_yy,1)))) & ~ (((((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ii)) & (V_zz = e_hh)) & (V_uu = true))
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false)) & (e_bb = e_gg))
  & (V_bbee = $sum(V_yy,1)))) & ~ (((((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ii)) & (V_zz = e_hh)) & (V_uu = true))
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false)) & (e_bb = e_gg))
  & (V_bbee = $sum(V_yy,1)))) & ~ ((((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ii)) & (V_zz = e_hh)) & (V_uu = false))
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false)) & (~
  $lesseq($sum($difference($difference($sum(V_yy,1),V_bbee),1),1),V_bbff)
  & (e_bb = e_ii)))) & ~ (((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & (V_zz = e_gg)) & ~ ((((V_uu = false) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = false) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false)))) & ~ ((((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & (V_zz = e_gg)) & (V_uu = false))
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false))
  & (($lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)
  & ((e_bb = e_gg) & (V_bbee = $sum(V_yy,1)))) | ~
  $lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)))) & ~
  ((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh))
  & (V_zz = e_gg)) & (V_uu = true)) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))
  & (($lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)
  & ((e_bb = e_gg) & (V_bbee = $sum(V_yy,1)))) | ~
  $lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)))) & ~
  ((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh))
  & (V_zz = e_gg)) & (V_uu = true)) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))
  & (($lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)
  & ((e_bb = e_gg) & (V_bbee = $sum(V_yy,1)))) | ~
  $lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)))) & ~
  ((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh))
  & (V_zz = e_gg)) & (V_uu = false)) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))
  & (($lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)
  & (e_bb = e_hh)) | ~
  $lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)))) & ~
  (((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh))
  & (V_zz = e_gg)) & (V_uu = false)) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))) & ~ (((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & (V_zz = e_gg)) & (V_uu = true)) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false))) & ~ (((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & (V_zz = e_gg)) & (V_uu = true))
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & ~ (((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & (V_zz = e_gg))
  & (V_uu = false)) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~
  (((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg))
  & (V_zz = e_ff)) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false)))) & ~ (((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~
  (V_zz = e_gg)) & (V_zz = e_ff)) & (V_uu = true)) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false))) & ~ (((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & ~ (V_zz = e_gg)) & (V_zz = e_ff)) & (V_uu = true))
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & ~ (((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & (V_zz = e_ff))
  & (V_uu = false)) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))
  & (e_bb = e_gg)) & (V_bbee = V_yy))) & ~ (((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ff)) & (V_zz = e_ee)) & ~ ((((V_uu = false)
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = true)
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & ~ ((((V_uu = true)
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = false)
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false)))) & ~ ((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff)) & (V_zz = e_ee))
  & (V_uu = false)) & (V_vv = true)) & (V_ww = false)) & (V_xx = false))
  & (($lesseq($sum($difference($difference($sum(V_bbcc,1),V_bbbb),1),1),V_bbii)
  & ((V_bbcc = $sum(V_yy,1)) & (e_bb = e_ee))) | (~
  $lesseq($sum($difference($difference($sum(V_bbcc,1),V_bbbb),1),1),V_bbii)
  & ((V_bbdd = $sum(V_yy,1)) & (e_bb = e_ff)))))) & ~ ((((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff)) & (V_zz = e_ee))
  & (V_uu = true)) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))
  & (e_bb = e_gg)) & (V_bbdd = V_bbcc)) & (V_bbee = $sum(V_yy,1)))) & ~
  ((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff))
  & (V_zz = e_ee)) & (V_uu = true)) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))
  & (($lesseq($sum($difference($difference($sum(V_bbcc,1),V_bbbb),1),1),V_bbii)
  & ((V_bbcc = $sum(V_yy,1)) & (e_bb = e_ee))) | ~
  $lesseq($sum($difference($difference($sum(V_bbcc,1),V_bbbb),1),1),V_bbii))))
  & ~ ((((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff))
  & (V_zz = e_ee)) & (V_uu = false)) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false)) & (e_bb = e_gg)) & (V_bbdd = V_bbcc)) & (V_bbee = V_yy)))
  & ~ (((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ee))
  & (V_zz = e_dd)) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false)))) & ~ (((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_ee)) & (V_zz = e_dd)) & (V_uu = false)) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false)) & (V_bbcc = $sum(V_yy,1)))
  & (e_bb = e_ee))) & ~ (((((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_ee)) & (V_zz = e_dd)) & (V_uu = true)) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false)) & (e_bb = e_gg)) & (V_bbcc = V_bbbb))
  & (V_bbdd = V_bbbb)) & (V_bbee = $sum(V_yy,1)))) & ~ (((((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ee)) & (V_zz = e_dd))
  & (V_uu = false)) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))
  & (e_bb = e_gg)) & (V_bbcc = V_bbbb)) & (V_bbdd = V_bbbb))
  & (V_bbee = V_yy))) & ~ ((((((((((~ (V_zz = e_ii) & ~ (V_zz = e_hh)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_dd))
  & (V_zz = e_cc)) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false)))) & ~ ((((((((((~ (V_zz = e_ii) & ~ (V_zz = e_hh)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_dd))
  & (V_zz = e_cc)) & (V_uu = false)) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))) & ~ ((((((((((~ (V_zz = e_ii) & ~ (V_zz = e_hh)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_dd))
  & (V_zz = e_cc)) & (V_uu = true)) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ (((((((((((~ (V_zz = e_ii) & ~ (V_zz = e_hh)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_dd))
  & (V_zz = e_cc)) & (V_uu = true)) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false)) & ($lesseq(V_bbjj,$difference($sum(V_yy,1),V_bbaa))
  & ((e_bb = e_dd) & (V_bbbb = $sum(V_yy,1)))))))).

tff(f44, type, f44: (enum_aa * $int * bool * bool * bool * bool * $int *
  $int * $int * $int * $int * enum_aa * $int * bool * bool * bool * bool *
  $int * $int * $int * $int * $int * $int * $int * $int * set($int) *
  set($int) * set($int) * set($int) * $int * $int * $int * $int * $int *
  $int * $int * $int * $int * $int * $int * $int) > $o).

tff(f44_def, axiom, ![V_zz:enum_aa, V_yy:$int, V_xx:bool, V_ww:bool, V_vv:
  bool, V_uu:bool, V_tt:$int, V_ss:$int, V_rr:$int, V_qq:$int, V_pp:$int,
  V_oo:enum_aa, V_nn:$int, V_mm:bool, V_ll:bool, V_kk:bool, V_jj:bool,
  V_bbxx:$int, V_bbww:$int, V_bbvv:$int, V_bbuu:$int, V_bbtt:$int, V_bbss:
  $int, V_bbrr:$int, V_bbqq:$int, V_bbpp:set($int), V_bboo:set($int), V_bbnn:
  set($int), V_bbmm:set($int), V_bbll:$int, V_bbkk:$int, V_bbjj:$int, V_bbii:
  $int, V_bbhh:$int, V_bbgg:$int, V_bbff:$int, V_bbee:$int, V_bbdd:$int,
  V_bbcc:$int, V_bbbb:$int, V_bbaa:$int]: (f44(V_zz, V_yy, V_xx, V_ww, V_vv,
  V_uu, V_tt, V_ss, V_rr, V_qq, V_pp, V_oo, V_nn, V_mm, V_ll, V_kk, V_jj,
  V_bbxx, V_bbww, V_bbvv, V_bbuu, V_bbtt, V_bbss, V_bbrr, V_bbqq, V_bbpp,
  V_bboo, V_bbnn, V_bbmm, V_bbll, V_bbkk, V_bbjj, V_bbii, V_bbhh, V_bbgg,
  V_bbff, V_bbee, V_bbdd, V_bbcc, V_bbbb, V_bbaa)
  <=> ((((((((((((((((((((((((((((((((((((((((((((((($true & ~ (V_zz = e_bb))
  & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh))
  & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff)) & (V_zz = e_ee)) & (V_uu = false))
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false))
  & mem($int, $sum(V_yy,1), integer)) & $lesseq(0,$sum(V_yy,1))) & $true) & ~
  ((((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_hh))
  & (V_zz = e_ii)) & (V_yy = V_bbee)) & (V_bbcc = V_bbdd)) & ~
  ((((V_uu = false) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~
  ((((V_uu = true) & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & ~
  ((((V_uu = true) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~
  ((((V_uu = false) & (V_vv = true)) & (V_ww = false)) & (V_xx = false)))
  & (e_gg = e_bb))) & ~ ((((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~
  (V_zz = e_hh)) & (V_zz = e_ii)) & (V_yy = V_bbee)) & (V_bbcc = V_bbdd))
  & (V_uu = false)) & (V_vv = true)) & (V_ww = false)) & (V_xx = false))
  & (e_gg = e_bb))) & ~ ((((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~
  (V_zz = e_hh)) & (V_zz = e_ii)) & (V_yy = V_bbee)) & (V_bbcc = V_bbdd))
  & (V_uu = true)) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))
  & (e_gg = e_bb))) & ~ ((((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~
  (V_zz = e_hh)) & (V_zz = e_ii)) & (V_yy = V_bbee)) & (V_bbcc = V_bbdd))
  & (V_uu = true)) & (V_vv = true)) & (V_ww = false)) & (V_xx = false))
  & (e_gg = e_bb))) & ~ ((((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~
  (V_zz = e_hh)) & (V_zz = e_ii)) & (V_yy = V_bbee)) & (V_bbcc = V_bbdd))
  & (V_uu = false)) & (V_vv = true)) & (V_ww = true)) & (V_xx = false)) & (~
  $lesseq($sum($difference(V_yy,V_bbee),1),$sum(V_bbff,V_bbgg))
  & (e_gg = e_bb)))) & ~ ((((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~
  (V_zz = e_ii)) & (V_zz = e_hh)) & (V_bbcc = V_bbdd)) & ~ ((((V_uu = false)
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = true)
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & ~ ((((V_uu = true)
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = false)
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & (e_gg = e_bb))
  & (V_yy = V_bbee))) & ~ ((((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc))
  & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_gg))
  & ~ (V_zz = e_ii)) & (V_zz = e_hh)) & (V_bbcc = V_bbdd)) & (V_uu = false))
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false)) & (~
  $lesseq($sum($difference($difference($sum(V_yy,1),V_bbee),1),1),V_bbff)
  & (e_gg = e_ii))) & (V_yy = V_bbee))) & ~ ((((((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & (V_zz = e_gg)) & (V_bbcc = V_bbdd)) & ~
  ((((V_uu = false) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~
  ((((V_uu = true) & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & ~
  ((((V_uu = true) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~
  ((((V_uu = false) & (V_vv = true)) & (V_ww = false)) & (V_xx = false)))
  & (e_gg = e_bb)) & (V_yy = V_bbee))) & ~ (((((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & (V_zz = e_gg)) & (V_bbcc = V_bbdd))
  & (V_uu = false)) & (V_vv = true)) & (V_ww = false)) & (V_xx = false))
  & ((~ $lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)
  & (e_gg = e_bb)) & (V_yy = V_bbee)))) & ~ (((((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & (V_zz = e_gg)) & (V_bbcc = V_bbdd))
  & (V_uu = true)) & (V_vv = true)) & (V_ww = true)) & (V_xx = false)) & ((~
  $lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)
  & (e_gg = e_bb)) & (V_yy = V_bbee)))) & ~ (((((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & (V_zz = e_gg)) & (V_bbcc = V_bbdd))
  & (V_uu = true)) & (V_vv = true)) & (V_ww = false)) & (V_xx = false)) & ((~
  $lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)
  & (e_gg = e_bb)) & (V_yy = V_bbee)))) & ~ ((((((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & (V_zz = e_gg)) & (V_bbcc = V_bbdd))
  & (V_uu = false)) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))
  & (($lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)
  & (e_gg = e_hh)) | (~
  $lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)
  & (e_gg = e_bb)))) & (V_yy = V_bbee))) & ~ ((((((((((((((~ (V_zz = e_bb)
  & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff))
  & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & (V_zz = e_gg)) & (V_bbcc = V_bbdd))
  & (e_gg = e_bb)) & (V_yy = V_bbee)) & ~ ((((V_uu = false) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = false) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false)))) & ~ ((((((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & (V_zz = e_gg)) & (V_bbcc = V_bbdd))
  & (e_gg = e_bb)) & (V_yy = V_bbee)) & (V_uu = false)) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false))) & ~ ((((((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & (V_zz = e_gg)) & (V_bbcc = V_bbdd))
  & (e_gg = e_bb)) & (V_yy = V_bbee)) & (V_uu = true)) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false))) & ~ ((((((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & (V_zz = e_gg)) & (V_bbcc = V_bbdd))
  & (e_gg = e_bb)) & (V_yy = V_bbee)) & (V_uu = true)) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false))) & ~ ((((((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & (V_zz = e_gg)) & (V_bbcc = V_bbdd))
  & (e_gg = e_bb)) & (V_yy = V_bbee)) & (V_uu = false)) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false))) & ~ ((((((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & ~ (V_zz = e_gg)) & (V_zz = e_ff)) & ~ ((((V_uu = false)
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = true)
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & ~ ((((V_uu = true)
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = false)
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & (e_gg = e_bb))
  & (V_bbcc = V_bbdd)) & (V_yy = V_bbee))) & ~ ((((((((((((((~ (V_zz = e_bb)
  & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ii))
  & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & (V_zz = e_ff)) & (V_bbcc = V_bbdd))
  & (V_uu = true)) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))
  & (e_gg = e_bb)) & (V_yy = V_bbee))) & ~ ((((((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & ~ (V_zz = e_gg)) & (V_zz = e_ff)) & (V_bbcc = V_bbdd))
  & (V_uu = true)) & (V_vv = true)) & (V_ww = false)) & (V_xx = false))
  & (e_gg = e_bb)) & (V_yy = V_bbee))) & ~ ((((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & ~ (V_zz = e_gg)) & (V_zz = e_ff)) & (V_bbcc = V_bbdd))
  & (V_uu = false)) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~
  ((((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff))
  & (V_zz = e_ee)) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))) & (e_gg = e_bb)) & (V_bbcc = V_bbdd))
  & (V_yy = V_bbee))) & ~ (((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~
  (V_zz = e_ff)) & (V_zz = e_ee)) & (V_uu = false)) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false))
  & ((($lesseq($sum($difference($difference($sum(V_bbcc,1),V_bbbb),1),1),V_bbii)
  & ((V_bbcc = $sum(V_yy,1)) & (e_gg = e_ee))) & (V_bbcc = V_bbdd)) | (~
  $lesseq($sum($difference($difference($sum(V_bbcc,1),V_bbbb),1),1),V_bbii)
  & ((V_bbcc = $sum(V_yy,1)) & (e_gg = e_ff))))) & (V_yy = V_bbee))) & ~
  ((((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff))
  & (V_zz = e_ee)) & (V_uu = true)) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))
  & (($lesseq($sum($difference($difference($sum(V_bbcc,1),V_bbbb),1),1),V_bbii)
  & ((V_bbcc = $sum(V_yy,1)) & (e_gg = e_ee))) | (~
  $lesseq($sum($difference($difference($sum(V_bbcc,1),V_bbbb),1),1),V_bbii)
  & (e_gg = e_bb)))) & (V_bbcc = V_bbdd)) & (V_yy = V_bbee))) & ~
  (((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff))
  & (V_zz = e_ee)) & (V_uu = false)) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_ee)) & (V_zz = e_dd)) & ~ ((((V_uu = false) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = false) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false))) & (e_gg = e_bb)) & (V_yy = V_bbee))
  & (V_bbcc = V_bbdd))) & ~ (((((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc))
  & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff))
  & ~ (V_zz = e_ee)) & (V_zz = e_dd)) & (V_uu = false)) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false)) & (V_bbcc = $sum(V_yy,1)))
  & (e_gg = e_ee)) & (V_bbcc = V_bbdd)) & (V_yy = V_bbee))) & ~
  (((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ee))
  & (V_zz = e_dd)) & (V_uu = false)) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false)) & (V_bbcc = V_bbbb)) & (V_bbcc = V_bbbb))) & ~
  (((((((((((((~ (V_zz = e_ii) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_dd)) & (V_zz = e_cc))
  & (V_bbcc = V_bbdd)) & (V_yy = V_bbee)) & ~ ((((V_uu = false)
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = true)
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & ~ ((((V_uu = true)
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = false)
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & (e_gg = e_bb))) & ~
  (((((((((((((~ (V_zz = e_ii) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_dd)) & (V_zz = e_cc))
  & (V_bbcc = V_bbdd)) & (V_yy = V_bbee)) & (V_uu = false)) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false)) & (e_gg = e_bb))) & ~ (((((((((((((~
  (V_zz = e_ii) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_dd)) & (V_zz = e_cc)) & (V_bbcc = V_bbdd))
  & (V_yy = V_bbee)) & (V_uu = true)) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false)) & (e_gg = e_bb))) & ~ (((((((((((((~ (V_zz = e_ii) & ~
  (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_dd)) & (V_zz = e_cc)) & (V_bbcc = V_bbdd)) & (V_yy = V_bbee))
  & (V_uu = true)) & (V_vv = true)) & (V_ww = false)) & (V_xx = false))
  & ($lesseq(V_bbjj,$difference($sum(V_yy,1),V_bbaa)) & ((e_gg = e_dd)
  & (V_bbbb = $sum(V_yy,1)))))))).

tff(f45, type, f45: (enum_aa * $int * bool * bool * bool * bool * $int *
  $int * $int * $int * $int * enum_aa * $int * bool * bool * bool * bool *
  $int * $int * $int * $int * $int * $int * $int * $int * set($int) *
  set($int) * set($int) * set($int) * $int * $int * $int * $int * $int *
  $int * $int * $int * $int * $int * $int * $int) > $o).

tff(f45_def, axiom, ![V_zz:enum_aa, V_yy:$int, V_xx:bool, V_ww:bool, V_vv:
  bool, V_uu:bool, V_tt:$int, V_ss:$int, V_rr:$int, V_qq:$int, V_pp:$int,
  V_oo:enum_aa, V_nn:$int, V_mm:bool, V_ll:bool, V_kk:bool, V_jj:bool,
  V_bbxx:$int, V_bbww:$int, V_bbvv:$int, V_bbuu:$int, V_bbtt:$int, V_bbss:
  $int, V_bbrr:$int, V_bbqq:$int, V_bbpp:set($int), V_bboo:set($int), V_bbnn:
  set($int), V_bbmm:set($int), V_bbll:$int, V_bbkk:$int, V_bbjj:$int, V_bbii:
  $int, V_bbhh:$int, V_bbgg:$int, V_bbff:$int, V_bbee:$int, V_bbdd:$int,
  V_bbcc:$int, V_bbbb:$int, V_bbaa:$int]: (f45(V_zz, V_yy, V_xx, V_ww, V_vv,
  V_uu, V_tt, V_ss, V_rr, V_qq, V_pp, V_oo, V_nn, V_mm, V_ll, V_kk, V_jj,
  V_bbxx, V_bbww, V_bbvv, V_bbuu, V_bbtt, V_bbss, V_bbrr, V_bbqq, V_bbpp,
  V_bboo, V_bbnn, V_bbmm, V_bbll, V_bbkk, V_bbjj, V_bbii, V_bbhh, V_bbgg,
  V_bbff, V_bbee, V_bbdd, V_bbcc, V_bbbb, V_bbaa) <=> ~ (V_zz = e_ee))).

tff(f47, type, f47: (enum_aa * $int * bool * bool * bool * bool * $int *
  $int * $int * $int * $int * enum_aa * $int * bool * bool * bool * bool *
  $int * $int * $int * $int * $int * $int * $int * $int * set($int) *
  set($int) * set($int) * set($int) * $int * $int * $int * $int * $int *
  $int * $int * $int * $int * $int * $int * $int) > $o).

tff(f47_def, axiom, ![V_zz:enum_aa, V_yy:$int, V_xx:bool, V_ww:bool, V_vv:
  bool, V_uu:bool, V_tt:$int, V_ss:$int, V_rr:$int, V_qq:$int, V_pp:$int,
  V_oo:enum_aa, V_nn:$int, V_mm:bool, V_ll:bool, V_kk:bool, V_jj:bool,
  V_bbxx:$int, V_bbww:$int, V_bbvv:$int, V_bbuu:$int, V_bbtt:$int, V_bbss:
  $int, V_bbrr:$int, V_bbqq:$int, V_bbpp:set($int), V_bboo:set($int), V_bbnn:
  set($int), V_bbmm:set($int), V_bbll:$int, V_bbkk:$int, V_bbjj:$int, V_bbii:
  $int, V_bbhh:$int, V_bbgg:$int, V_bbff:$int, V_bbee:$int, V_bbdd:$int,
  V_bbcc:$int, V_bbbb:$int, V_bbaa:$int]: (f47(V_zz, V_yy, V_xx, V_ww, V_vv,
  V_uu, V_tt, V_ss, V_rr, V_qq, V_pp, V_oo, V_nn, V_mm, V_ll, V_kk, V_jj,
  V_bbxx, V_bbww, V_bbvv, V_bbuu, V_bbtt, V_bbss, V_bbrr, V_bbqq, V_bbpp,
  V_bboo, V_bbnn, V_bbmm, V_bbll, V_bbkk, V_bbjj, V_bbii, V_bbhh, V_bbgg,
  V_bbff, V_bbee, V_bbdd, V_bbcc, V_bbbb, V_bbaa)
  <=> ((((((((((((((((((((((((((((((((((((((((((((((((((((((($true & ~
  (V_zz = e_bb)) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff))
  & $lesseq($sum($difference($difference($sum(V_bbcc,1),V_bbbb),1),1),V_bbii))
  & (V_zz = e_ee)) & (V_uu = true)) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false)) & mem($int, $sum(V_yy,1), integer))
  & $lesseq(0,$sum(V_yy,1))) & $true) & ~ (((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_ii)) & (e_ee = V_zz))
  & ($sum(V_yy,1) = V_bbcc))) & ~ (((((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_hh)) & (V_zz = e_ii))
  & ($sum(V_yy,1) = V_bbcc)) & ~ ((((V_uu = false) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = false) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false))) & (e_ee = e_bb))) & ~ (((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_hh)) & (V_zz = e_ii))
  & ($sum(V_yy,1) = V_bbcc)) & (V_uu = false)) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false)) & (e_ee = e_bb))) & ~ (((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_hh)) & (V_zz = e_ii))
  & ($sum(V_yy,1) = V_bbcc)) & (V_uu = true)) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false)) & (e_ee = e_bb))) & ~ (((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_hh)) & (V_zz = e_ii))
  & ($sum(V_yy,1) = V_bbcc)) & (V_uu = true)) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false)) & (e_ee = e_bb))) & ~ (((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_hh)) & (V_zz = e_ii))
  & ($sum(V_yy,1) = V_bbcc)) & (V_uu = false)) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false))
  & (($lesseq($sum($difference(V_yy,V_bbee),1),$sum(V_bbff,V_bbgg))
  & (e_ee = V_zz)) | (~
  $lesseq($sum($difference(V_yy,V_bbee),1),$sum(V_bbff,V_bbgg))
  & (e_ee = e_bb))))) & ~ (((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~
  (V_zz = e_ii)) & (V_zz = e_hh)) & ($sum(V_yy,1) = V_bbcc)) & ~
  ((((V_uu = false) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~
  ((((V_uu = true) & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & ~
  ((((V_uu = true) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~
  ((((V_uu = false) & (V_vv = true)) & (V_ww = false)) & (V_xx = false)))
  & (e_ee = e_bb))) & ~ ((((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~
  (V_zz = e_ii)) & (V_zz = e_hh)) & ($sum(V_yy,1) = V_bbcc))
  & (V_uu = false)) & (V_vv = true)) & (V_ww = false)) & (V_xx = false))
  & (e_ee = e_gg)) & (V_bbee = $sum(V_yy,1)))) & ~ ((((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ii)) & (V_zz = e_hh))
  & ($sum(V_yy,1) = V_bbcc)) & (V_uu = true)) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false)) & (e_ee = e_gg))
  & (V_bbee = $sum(V_yy,1)))) & ~ ((((((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ii)) & (V_zz = e_hh))
  & ($sum(V_yy,1) = V_bbcc)) & (V_uu = true)) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false)) & (e_ee = e_gg))
  & (V_bbee = $sum(V_yy,1)))) & ~ (((((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ii)) & (V_zz = e_hh))
  & ($sum(V_yy,1) = V_bbcc)) & (V_uu = false)) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false))
  & (($lesseq($sum($difference($difference($sum(V_yy,1),V_bbee),1),1),V_bbff)
  & (e_ee = V_zz)) | (~
  $lesseq($sum($difference($difference($sum(V_yy,1),V_bbee),1),1),V_bbff)
  & (e_ee = e_ii))))) & ~ (((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & (V_zz = e_gg)) & ($sum(V_yy,1) = V_bbcc)) & ~
  ((((V_uu = false) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~
  ((((V_uu = true) & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & ~
  ((((V_uu = true) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~
  ((((V_uu = false) & (V_vv = true)) & (V_ww = false)) & (V_xx = false)))
  & (e_ee = e_bb))) & ~ (((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & (V_zz = e_gg)) & ($sum(V_yy,1) = V_bbcc))
  & (V_uu = false)) & (V_vv = true)) & (V_ww = false)) & (V_xx = false))
  & (($lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)
  & ((e_ee = e_gg) & (V_bbee = $sum(V_yy,1)))) | (~
  $lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)
  & (e_ee = e_bb))))) & ~ (((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & (V_zz = e_gg)) & ($sum(V_yy,1) = V_bbcc)) & (V_uu = true))
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false))
  & (($lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)
  & ((e_ee = e_gg) & (V_bbee = $sum(V_yy,1)))) | (~
  $lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)
  & (e_ee = e_bb))))) & ~ (((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & (V_zz = e_gg)) & ($sum(V_yy,1) = V_bbcc)) & (V_uu = true))
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false))
  & (($lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)
  & ((e_ee = e_gg) & (V_bbee = $sum(V_yy,1)))) | (~
  $lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)
  & (e_ee = e_bb))))) & ~ (((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & (V_zz = e_gg)) & ($sum(V_yy,1) = V_bbcc))
  & (V_uu = false)) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))
  & (($lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)
  & (e_ee = e_hh)) | (~
  $lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)
  & (e_ee = e_bb))))) & ~ (((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & (V_zz = e_gg)) & ($sum(V_yy,1) = V_bbcc)) & (e_ee = e_bb))
  & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = true)) & (V_xx = false)))
  & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = false)) & (V_xx = false)))
  & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = true)) & (V_xx = false)))
  & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false)))) & ~ (((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & (V_zz = e_gg)) & ($sum(V_yy,1) = V_bbcc)) & (e_ee = e_bb))
  & (V_uu = false)) & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & ~
  (((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh))
  & (V_zz = e_gg)) & ($sum(V_yy,1) = V_bbcc)) & (e_ee = e_bb))
  & (V_uu = true)) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~
  (((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh))
  & (V_zz = e_gg)) & ($sum(V_yy,1) = V_bbcc)) & (e_ee = e_bb))
  & (V_uu = true)) & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & ~
  (((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh))
  & (V_zz = e_gg)) & ($sum(V_yy,1) = V_bbcc)) & (e_ee = e_bb))
  & (V_uu = false)) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~
  (((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg))
  & (V_zz = e_ff)) & ($sum(V_yy,1) = V_bbcc)) & ~ ((((V_uu = false)
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = true)
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & ~ ((((V_uu = true)
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = false)
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & (e_ee = e_bb))) & ~
  ((((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg))
  & (V_zz = e_ff)) & ($sum(V_yy,1) = V_bbcc)) & (V_uu = false))
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false))
  & (V_bbdd = $sum(V_yy,1))) & (e_ee = V_zz))) & ~ (((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & (V_zz = e_ff))
  & ($sum(V_yy,1) = V_bbcc)) & (V_uu = true)) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false)) & (e_ee = e_bb))) & ~ (((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & (V_zz = e_ff))
  & ($sum(V_yy,1) = V_bbcc)) & (V_uu = true)) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false)) & (e_ee = e_bb))) & ~ ((((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & (V_zz = e_ff))
  & ($sum(V_yy,1) = V_bbcc)) & (V_uu = false)) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false)) & (e_ee = e_gg)) & (V_bbee = V_yy))) & ~
  (((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff))
  & (V_zz = e_ee)) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))) & (e_ee = e_bb)) & ($sum(V_yy,1) = V_bbcc))) & ~
  ((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff))
  & (V_zz = e_ee)) & (V_uu = false)) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))
  & ($lesseq($sum($difference($difference($sum(V_bbcc,1),V_bbbb),1),1),V_bbii)
  | ((~
  $lesseq($sum($difference($difference($sum(V_bbcc,1),V_bbbb),1),1),V_bbii)
  & ((V_bbdd = $sum(V_yy,1)) & (e_ee = e_ff))) & ($sum(V_yy,1) = V_bbcc)))))
  & ~ (((((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd))
  & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff))
  & (V_zz = e_ee)) & (V_uu = true)) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false)) & (e_ee = e_gg)) & (V_bbdd = V_bbcc))
  & (V_bbee = $sum(V_yy,1))) & ($sum(V_yy,1) = V_bbcc))) & ~ ((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff)) & (V_zz = e_ee))
  & (V_uu = true)) & (V_vv = true)) & (V_ww = false)) & (V_xx = false))
  & ($lesseq($sum($difference($difference($sum(V_bbcc,1),V_bbbb),1),1),V_bbii)
  | ((~
  $lesseq($sum($difference($difference($sum(V_bbcc,1),V_bbbb),1),1),V_bbii)
  & (e_ee = e_bb)) & ($sum(V_yy,1) = V_bbcc))))) & ~ (((((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff)) & (V_zz = e_ee))
  & (V_uu = false)) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))
  & (e_ee = e_gg)) & (V_bbdd = V_bbcc)) & (V_bbee = V_yy))
  & ($sum(V_yy,1) = V_bbcc))) & ~ (((((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_ee)) & (V_zz = e_dd)) & ~ ((((V_uu = false)
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = true)
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & ~ ((((V_uu = true)
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = false)
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & (e_ee = e_bb))
  & ($sum(V_yy,1) = V_bbcc))) & ~ (((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_ee)) & (V_zz = e_dd)) & (V_uu = false))
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & ~ (((((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ee)) & (V_zz = e_dd))
  & (V_uu = true)) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))
  & (e_ee = e_gg)) & ($sum(V_yy,1) = V_bbbb)) & (V_bbdd = V_bbbb))
  & (V_bbee = $sum(V_yy,1)))) & ~ (((((((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_ee)) & (V_zz = e_dd)) & (V_uu = false))
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false)) & (e_ee = e_gg))
  & ($sum(V_yy,1) = V_bbbb)) & (V_bbdd = V_bbbb)) & (V_bbee = V_yy))) & ~
  ((((((((((((~ (V_zz = e_ii) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_dd)) & (V_zz = e_cc))
  & ($sum(V_yy,1) = V_bbcc)) & ~ ((((V_uu = false) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = false) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false))) & (e_ee = e_bb))) & ~ ((((((((((((~
  (V_zz = e_ii) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_dd)) & (V_zz = e_cc))
  & ($sum(V_yy,1) = V_bbcc)) & (V_uu = false)) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false)) & (e_ee = e_bb))) & ~ ((((((((((((~
  (V_zz = e_ii) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_dd)) & (V_zz = e_cc))
  & ($sum(V_yy,1) = V_bbcc)) & (V_uu = true)) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false)) & (e_ee = e_bb))) & ~ ((((((((((((~
  (V_zz = e_ii) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_dd)) & (V_zz = e_cc))
  & ($sum(V_yy,1) = V_bbcc)) & (V_uu = true)) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false))
  & (($lesseq(V_bbjj,$difference($sum(V_yy,1),V_bbaa)) & ((e_ee = e_dd)
  & (V_bbbb = $sum(V_yy,1)))) | (~
  $lesseq(V_bbjj,$difference($sum(V_yy,1),V_bbaa)) & (e_ee = V_zz))))))).

tff(f48, type, f48: (enum_aa * $int * bool * bool * bool * bool * $int *
  $int * $int * $int * $int * enum_aa * $int * bool * bool * bool * bool *
  $int * $int * $int * $int * $int * $int * $int * $int * set($int) *
  set($int) * set($int) * set($int) * $int * $int * $int * $int * $int *
  $int * $int * $int * $int * $int * $int * $int) > $o).

tff(f48_def, axiom, ![V_zz:enum_aa, V_yy:$int, V_xx:bool, V_ww:bool, V_vv:
  bool, V_uu:bool, V_tt:$int, V_ss:$int, V_rr:$int, V_qq:$int, V_pp:$int,
  V_oo:enum_aa, V_nn:$int, V_mm:bool, V_ll:bool, V_kk:bool, V_jj:bool,
  V_bbxx:$int, V_bbww:$int, V_bbvv:$int, V_bbuu:$int, V_bbtt:$int, V_bbss:
  $int, V_bbrr:$int, V_bbqq:$int, V_bbpp:set($int), V_bboo:set($int), V_bbnn:
  set($int), V_bbmm:set($int), V_bbll:$int, V_bbkk:$int, V_bbjj:$int, V_bbii:
  $int, V_bbhh:$int, V_bbgg:$int, V_bbff:$int, V_bbee:$int, V_bbdd:$int,
  V_bbcc:$int, V_bbbb:$int, V_bbaa:$int]: (f48(V_zz, V_yy, V_xx, V_ww, V_vv,
  V_uu, V_tt, V_ss, V_rr, V_qq, V_pp, V_oo, V_nn, V_mm, V_ll, V_kk, V_jj,
  V_bbxx, V_bbww, V_bbvv, V_bbuu, V_bbtt, V_bbss, V_bbrr, V_bbqq, V_bbpp,
  V_bboo, V_bbnn, V_bbmm, V_bbll, V_bbkk, V_bbjj, V_bbii, V_bbhh, V_bbgg,
  V_bbff, V_bbee, V_bbdd, V_bbcc, V_bbbb, V_bbaa)
  <=> (((((((((((((((((((((((((((((((((((((((((((((((((((($true & ~
  (V_zz = e_bb)) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~
  $lesseq($sum($difference($difference($sum(V_bbcc,1),V_bbbb),1),1),V_bbii))
  & (V_zz = e_ee)) & (V_uu = true)) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false)) & mem($int, $sum(V_yy,1), integer))
  & $lesseq(0,$sum(V_yy,1))) & $true) & ~ (((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_hh)) & (V_zz = e_ii)) & ~ ((((V_uu = false)
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = true)
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & ~ ((((V_uu = true)
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = false)
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false)))) & ~ (((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_hh)) & (V_zz = e_ii))
  & (V_uu = false)) & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & ~
  (((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_hh))
  & (V_zz = e_ii)) & (V_uu = true)) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ (((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~
  (V_zz = e_hh)) & (V_zz = e_ii)) & (V_uu = true)) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false))) & ~ ((((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_hh)) & (V_zz = e_ii)) & (V_uu = false))
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false)) & ~
  $lesseq($sum($difference(V_yy,V_bbee),1),$sum(V_bbff,V_bbgg)))) & ~
  (((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ii))
  & (V_zz = e_hh)) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false)))) & ~ (((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~
  (V_zz = e_ii)) & (V_zz = e_hh)) & (V_uu = false)) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false)) & (e_bb = e_gg))
  & (V_bbee = $sum(V_yy,1)))) & ~ (((((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ii)) & (V_zz = e_hh)) & (V_uu = true))
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false)) & (e_bb = e_gg))
  & (V_bbee = $sum(V_yy,1)))) & ~ (((((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ii)) & (V_zz = e_hh)) & (V_uu = true))
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false)) & (e_bb = e_gg))
  & (V_bbee = $sum(V_yy,1)))) & ~ ((((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ii)) & (V_zz = e_hh)) & (V_uu = false))
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false)) & (~
  $lesseq($sum($difference($difference($sum(V_yy,1),V_bbee),1),1),V_bbff)
  & (e_bb = e_ii)))) & ~ (((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & (V_zz = e_gg)) & ~ ((((V_uu = false) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = false) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false)))) & ~ ((((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & (V_zz = e_gg)) & (V_uu = false))
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false))
  & (($lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)
  & ((e_bb = e_gg) & (V_bbee = $sum(V_yy,1)))) | ~
  $lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)))) & ~
  ((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh))
  & (V_zz = e_gg)) & (V_uu = true)) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))
  & (($lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)
  & ((e_bb = e_gg) & (V_bbee = $sum(V_yy,1)))) | ~
  $lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)))) & ~
  ((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh))
  & (V_zz = e_gg)) & (V_uu = true)) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))
  & (($lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)
  & ((e_bb = e_gg) & (V_bbee = $sum(V_yy,1)))) | ~
  $lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)))) & ~
  ((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh))
  & (V_zz = e_gg)) & (V_uu = false)) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))
  & (($lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)
  & (e_bb = e_hh)) | ~
  $lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)))) & ~
  (((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh))
  & (V_zz = e_gg)) & (V_uu = false)) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))) & ~ (((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & (V_zz = e_gg)) & (V_uu = true)) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false))) & ~ (((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & (V_zz = e_gg)) & (V_uu = true))
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & ~ (((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & (V_zz = e_gg))
  & (V_uu = false)) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~
  (((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg))
  & (V_zz = e_ff)) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false)))) & ~ (((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~
  (V_zz = e_gg)) & (V_zz = e_ff)) & (V_uu = true)) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false))) & ~ (((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & ~ (V_zz = e_gg)) & (V_zz = e_ff)) & (V_uu = true))
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & ~ (((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & (V_zz = e_ff))
  & (V_uu = false)) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))
  & (e_bb = e_gg)) & (V_bbee = V_yy))) & ~ (((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ff)) & (V_zz = e_ee)) & ~ ((((V_uu = false)
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = true)
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & ~ ((((V_uu = true)
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = false)
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false)))) & ~ ((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff)) & (V_zz = e_ee))
  & (V_uu = false)) & (V_vv = true)) & (V_ww = false)) & (V_xx = false))
  & (($lesseq($sum($difference($difference($sum(V_bbcc,1),V_bbbb),1),1),V_bbii)
  & ((V_bbcc = $sum(V_yy,1)) & (e_bb = e_ee))) | (~
  $lesseq($sum($difference($difference($sum(V_bbcc,1),V_bbbb),1),1),V_bbii)
  & ((V_bbdd = $sum(V_yy,1)) & (e_bb = e_ff)))))) & ~ ((((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff)) & (V_zz = e_ee))
  & (V_uu = true)) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))
  & (e_bb = e_gg)) & (V_bbdd = V_bbcc)) & (V_bbee = $sum(V_yy,1)))) & ~
  ((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff))
  & (V_zz = e_ee)) & (V_uu = true)) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))
  & (($lesseq($sum($difference($difference($sum(V_bbcc,1),V_bbbb),1),1),V_bbii)
  & ((V_bbcc = $sum(V_yy,1)) & (e_bb = e_ee))) | ~
  $lesseq($sum($difference($difference($sum(V_bbcc,1),V_bbbb),1),1),V_bbii))))
  & ~ ((((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff))
  & (V_zz = e_ee)) & (V_uu = false)) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false)) & (e_bb = e_gg)) & (V_bbdd = V_bbcc)) & (V_bbee = V_yy)))
  & ~ (((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ee))
  & (V_zz = e_dd)) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false)))) & ~ (((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_ee)) & (V_zz = e_dd)) & (V_uu = false)) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false)) & (V_bbcc = $sum(V_yy,1)))
  & (e_bb = e_ee))) & ~ (((((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_ee)) & (V_zz = e_dd)) & (V_uu = true)) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false)) & (e_bb = e_gg)) & (V_bbcc = V_bbbb))
  & (V_bbdd = V_bbbb)) & (V_bbee = $sum(V_yy,1)))) & ~ (((((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ee)) & (V_zz = e_dd))
  & (V_uu = false)) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))
  & (e_bb = e_gg)) & (V_bbcc = V_bbbb)) & (V_bbdd = V_bbbb))
  & (V_bbee = V_yy))) & ~ ((((((((((~ (V_zz = e_ii) & ~ (V_zz = e_hh)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_dd))
  & (V_zz = e_cc)) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false)))) & ~ ((((((((((~ (V_zz = e_ii) & ~ (V_zz = e_hh)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_dd))
  & (V_zz = e_cc)) & (V_uu = false)) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))) & ~ ((((((((((~ (V_zz = e_ii) & ~ (V_zz = e_hh)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_dd))
  & (V_zz = e_cc)) & (V_uu = true)) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ (((((((((((~ (V_zz = e_ii) & ~ (V_zz = e_hh)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_dd))
  & (V_zz = e_cc)) & (V_uu = true)) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false)) & ($lesseq(V_bbjj,$difference($sum(V_yy,1),V_bbaa))
  & ((e_bb = e_dd) & (V_bbbb = $sum(V_yy,1)))))))).

tff(f49, type, f49: (enum_aa * $int * bool * bool * bool * bool * $int *
  $int * $int * $int * $int * enum_aa * $int * bool * bool * bool * bool *
  $int * $int * $int * $int * $int * $int * $int * $int * set($int) *
  set($int) * set($int) * set($int) * $int * $int * $int * $int * $int *
  $int * $int * $int * $int * $int * $int * $int) > $o).

tff(f49_def, axiom, ![V_zz:enum_aa, V_yy:$int, V_xx:bool, V_ww:bool, V_vv:
  bool, V_uu:bool, V_tt:$int, V_ss:$int, V_rr:$int, V_qq:$int, V_pp:$int,
  V_oo:enum_aa, V_nn:$int, V_mm:bool, V_ll:bool, V_kk:bool, V_jj:bool,
  V_bbxx:$int, V_bbww:$int, V_bbvv:$int, V_bbuu:$int, V_bbtt:$int, V_bbss:
  $int, V_bbrr:$int, V_bbqq:$int, V_bbpp:set($int), V_bboo:set($int), V_bbnn:
  set($int), V_bbmm:set($int), V_bbll:$int, V_bbkk:$int, V_bbjj:$int, V_bbii:
  $int, V_bbhh:$int, V_bbgg:$int, V_bbff:$int, V_bbee:$int, V_bbdd:$int,
  V_bbcc:$int, V_bbbb:$int, V_bbaa:$int]: (f49(V_zz, V_yy, V_xx, V_ww, V_vv,
  V_uu, V_tt, V_ss, V_rr, V_qq, V_pp, V_oo, V_nn, V_mm, V_ll, V_kk, V_jj,
  V_bbxx, V_bbww, V_bbvv, V_bbuu, V_bbtt, V_bbss, V_bbrr, V_bbqq, V_bbpp,
  V_bboo, V_bbnn, V_bbmm, V_bbll, V_bbkk, V_bbjj, V_bbii, V_bbhh, V_bbgg,
  V_bbff, V_bbee, V_bbdd, V_bbcc, V_bbbb, V_bbaa)
  <=> ((((((((((((((((((((((((((((((((((((((((((((((((($true & ~
  (V_zz = e_bb)) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff)) & (V_zz = e_ee))
  & (V_uu = true)) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))
  & mem($int, $sum(V_yy,1), integer)) & $lesseq(0,$sum(V_yy,1))) & $true) & ~
  ((((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_hh))
  & (V_zz = e_ii)) & ($sum(V_yy,1) = V_bbee)) & (V_bbcc = V_bbdd)) & ~
  ((((V_uu = false) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~
  ((((V_uu = true) & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & ~
  ((((V_uu = true) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~
  ((((V_uu = false) & (V_vv = true)) & (V_ww = false)) & (V_xx = false)))
  & (e_gg = e_bb))) & ~ ((((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~
  (V_zz = e_hh)) & (V_zz = e_ii)) & ($sum(V_yy,1) = V_bbee))
  & (V_bbcc = V_bbdd)) & (V_uu = false)) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false)) & (e_gg = e_bb))) & ~ ((((((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_hh)) & (V_zz = e_ii))
  & ($sum(V_yy,1) = V_bbee)) & (V_bbcc = V_bbdd)) & (V_uu = true))
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false)) & (e_gg = e_bb))) & ~
  ((((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_hh))
  & (V_zz = e_ii)) & ($sum(V_yy,1) = V_bbee)) & (V_bbcc = V_bbdd))
  & (V_uu = true)) & (V_vv = true)) & (V_ww = false)) & (V_xx = false))
  & (e_gg = e_bb))) & ~ ((((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~
  (V_zz = e_hh)) & (V_zz = e_ii)) & ($sum(V_yy,1) = V_bbee))
  & (V_bbcc = V_bbdd)) & (V_uu = false)) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false)) & (~
  $lesseq($sum($difference(V_yy,V_bbee),1),$sum(V_bbff,V_bbgg))
  & (e_gg = e_bb)))) & ~ ((((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~
  (V_zz = e_ii)) & (V_zz = e_hh)) & (V_bbcc = V_bbdd)) & ~ ((((V_uu = false)
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = true)
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & ~ ((((V_uu = true)
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = false)
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & (e_gg = e_bb))
  & ($sum(V_yy,1) = V_bbee))) & ~ ((((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ii)) & (V_zz = e_hh)) & (V_bbcc = V_bbdd))
  & (V_uu = false)) & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & ~
  ((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ii))
  & (V_zz = e_hh)) & (V_bbcc = V_bbdd)) & (V_uu = true)) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false))) & ~ ((((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ii)) & (V_zz = e_hh)) & (V_bbcc = V_bbdd))
  & (V_uu = true)) & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & ~
  ((((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ii))
  & (V_zz = e_hh)) & (V_bbcc = V_bbdd)) & (V_uu = false)) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false)) & (~
  $lesseq($sum($difference($difference($sum(V_yy,1),V_bbee),1),1),V_bbff)
  & (e_gg = e_ii))) & ($sum(V_yy,1) = V_bbee))) & ~ ((((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & (V_zz = e_gg))
  & (V_bbcc = V_bbdd)) & ~ ((((V_uu = false) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = false) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false))) & (e_gg = e_bb))
  & ($sum(V_yy,1) = V_bbee))) & ~ (((((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & (V_zz = e_gg)) & (V_bbcc = V_bbdd))
  & (V_uu = false)) & (V_vv = true)) & (V_ww = false)) & (V_xx = false))
  & ($lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh) | ((~
  $lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)
  & (e_gg = e_bb)) & ($sum(V_yy,1) = V_bbee))))) & ~ (((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & (V_zz = e_gg))
  & (V_bbcc = V_bbdd)) & (V_uu = true)) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))
  & ($lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh) | ((~
  $lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)
  & (e_gg = e_bb)) & ($sum(V_yy,1) = V_bbee))))) & ~ (((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & (V_zz = e_gg))
  & (V_bbcc = V_bbdd)) & (V_uu = true)) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))
  & ($lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh) | ((~
  $lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)
  & (e_gg = e_bb)) & ($sum(V_yy,1) = V_bbee))))) & ~ ((((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & (V_zz = e_gg))
  & (V_bbcc = V_bbdd)) & (V_uu = false)) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))
  & (($lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)
  & (e_gg = e_hh)) | (~
  $lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)
  & (e_gg = e_bb)))) & ($sum(V_yy,1) = V_bbee))) & ~ ((((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & (V_zz = e_gg))
  & (V_bbcc = V_bbdd)) & (e_gg = e_bb)) & ($sum(V_yy,1) = V_bbee)) & ~
  ((((V_uu = false) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~
  ((((V_uu = true) & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & ~
  ((((V_uu = true) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~
  ((((V_uu = false) & (V_vv = true)) & (V_ww = false)) & (V_xx = false))))
  & ~ ((((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh))
  & (V_zz = e_gg)) & (V_bbcc = V_bbdd)) & (e_gg = e_bb))
  & ($sum(V_yy,1) = V_bbee)) & (V_uu = false)) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false))) & ~ ((((((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & (V_zz = e_gg)) & (V_bbcc = V_bbdd))
  & (e_gg = e_bb)) & ($sum(V_yy,1) = V_bbee)) & (V_uu = true))
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~ ((((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & (V_zz = e_gg))
  & (V_bbcc = V_bbdd)) & (e_gg = e_bb)) & ($sum(V_yy,1) = V_bbee))
  & (V_uu = true)) & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & ~
  ((((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh))
  & (V_zz = e_gg)) & (V_bbcc = V_bbdd)) & (e_gg = e_bb))
  & ($sum(V_yy,1) = V_bbee)) & (V_uu = false)) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false))) & ~ ((((((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & ~ (V_zz = e_gg)) & (V_zz = e_ff)) & ~ ((((V_uu = false)
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = true)
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & ~ ((((V_uu = true)
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = false)
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & (e_gg = e_bb))
  & (V_bbcc = V_bbdd)) & ($sum(V_yy,1) = V_bbee))) & ~ ((((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & (V_zz = e_ff))
  & (V_bbcc = V_bbdd)) & (V_uu = true)) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false)) & (e_gg = e_bb)) & ($sum(V_yy,1) = V_bbee))) & ~
  ((((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg))
  & (V_zz = e_ff)) & (V_bbcc = V_bbdd)) & (V_uu = true)) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false)) & (e_gg = e_bb))
  & ($sum(V_yy,1) = V_bbee))) & ~ ((((((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ff)) & (V_zz = e_ee)) & ~ ((((V_uu = false)
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = true)
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & ~ ((((V_uu = true)
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = false)
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & (e_gg = e_bb))
  & (V_bbcc = V_bbdd)) & ($sum(V_yy,1) = V_bbee))) & ~ (((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff)) & (V_zz = e_ee))
  & (V_uu = false)) & (V_vv = true)) & (V_ww = false)) & (V_xx = false))
  & ((($lesseq($sum($difference($difference($sum(V_bbcc,1),V_bbbb),1),1),V_bbii)
  & ((V_bbcc = $sum(V_yy,1)) & (e_gg = e_ee))) & (V_bbcc = V_bbdd)) | (~
  $lesseq($sum($difference($difference($sum(V_bbcc,1),V_bbbb),1),1),V_bbii)
  & ((V_bbcc = $sum(V_yy,1)) & (e_gg = e_ff))))) & ($sum(V_yy,1) = V_bbee)))
  & ~ (((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff))
  & (V_zz = e_ee)) & (V_uu = true)) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~
  (V_zz = e_ff)) & (V_zz = e_ee)) & (V_uu = true)) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false))
  & (($lesseq($sum($difference($difference($sum(V_bbcc,1),V_bbbb),1),1),V_bbii)
  & ((V_bbcc = $sum(V_yy,1)) & (e_gg = e_ee))) | (~
  $lesseq($sum($difference($difference($sum(V_bbcc,1),V_bbbb),1),1),V_bbii)
  & (e_gg = e_bb)))) & (V_bbcc = V_bbdd)) & ($sum(V_yy,1) = V_bbee))) & ~
  ((((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ee))
  & (V_zz = e_dd)) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))) & (e_gg = e_bb)) & ($sum(V_yy,1) = V_bbee))
  & (V_bbcc = V_bbdd))) & ~ (((((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc))
  & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff))
  & ~ (V_zz = e_ee)) & (V_zz = e_dd)) & (V_uu = false)) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false)) & (V_bbcc = $sum(V_yy,1)))
  & (e_gg = e_ee)) & (V_bbcc = V_bbdd)) & ($sum(V_yy,1) = V_bbee))) & ~
  (((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ee))
  & (V_zz = e_dd)) & (V_uu = true)) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false)) & (V_bbcc = V_bbbb)) & (V_bbcc = V_bbbb))) & ~
  (((((((((((((~ (V_zz = e_ii) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_dd)) & (V_zz = e_cc))
  & (V_bbcc = V_bbdd)) & ($sum(V_yy,1) = V_bbee)) & ~ ((((V_uu = false)
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = true)
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & ~ ((((V_uu = true)
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = false)
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & (e_gg = e_bb))) & ~
  (((((((((((((~ (V_zz = e_ii) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_dd)) & (V_zz = e_cc))
  & (V_bbcc = V_bbdd)) & ($sum(V_yy,1) = V_bbee)) & (V_uu = false))
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false)) & (e_gg = e_bb))) & ~
  (((((((((((((~ (V_zz = e_ii) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_dd)) & (V_zz = e_cc))
  & (V_bbcc = V_bbdd)) & ($sum(V_yy,1) = V_bbee)) & (V_uu = true))
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false)) & (e_gg = e_bb))) & ~
  (((((((((((((~ (V_zz = e_ii) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_dd)) & (V_zz = e_cc))
  & (V_bbcc = V_bbdd)) & ($sum(V_yy,1) = V_bbee)) & (V_uu = true))
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false))
  & ($lesseq(V_bbjj,$difference($sum(V_yy,1),V_bbaa)) & ((e_gg = e_dd)
  & (V_bbbb = $sum(V_yy,1)))))))).

tff(f50, type, f50: (enum_aa * $int * bool * bool * bool * bool * $int *
  $int * $int * $int * $int * enum_aa * $int * bool * bool * bool * bool *
  $int * $int * $int * $int * $int * $int * $int * $int * set($int) *
  set($int) * set($int) * set($int) * $int * $int * $int * $int * $int *
  $int * $int * $int * $int * $int * $int * $int) > $o).

tff(f50_def, axiom, ![V_zz:enum_aa, V_yy:$int, V_xx:bool, V_ww:bool, V_vv:
  bool, V_uu:bool, V_tt:$int, V_ss:$int, V_rr:$int, V_qq:$int, V_pp:$int,
  V_oo:enum_aa, V_nn:$int, V_mm:bool, V_ll:bool, V_kk:bool, V_jj:bool,
  V_bbxx:$int, V_bbww:$int, V_bbvv:$int, V_bbuu:$int, V_bbtt:$int, V_bbss:
  $int, V_bbrr:$int, V_bbqq:$int, V_bbpp:set($int), V_bboo:set($int), V_bbnn:
  set($int), V_bbmm:set($int), V_bbll:$int, V_bbkk:$int, V_bbjj:$int, V_bbii:
  $int, V_bbhh:$int, V_bbgg:$int, V_bbff:$int, V_bbee:$int, V_bbdd:$int,
  V_bbcc:$int, V_bbbb:$int, V_bbaa:$int]: (f50(V_zz, V_yy, V_xx, V_ww, V_vv,
  V_uu, V_tt, V_ss, V_rr, V_qq, V_pp, V_oo, V_nn, V_mm, V_ll, V_kk, V_jj,
  V_bbxx, V_bbww, V_bbvv, V_bbuu, V_bbtt, V_bbss, V_bbrr, V_bbqq, V_bbpp,
  V_bboo, V_bbnn, V_bbmm, V_bbll, V_bbkk, V_bbjj, V_bbii, V_bbhh, V_bbgg,
  V_bbff, V_bbee, V_bbdd, V_bbcc, V_bbbb, V_bbaa)
  <=> ((((((((((((((((((((((((((((((((((((((((((((((((((((((($true & ~
  (V_zz = e_bb)) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff))
  & $lesseq($sum($difference($difference($sum(V_bbcc,1),V_bbbb),1),1),V_bbii))
  & (V_zz = e_ee)) & (V_uu = false)) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false)) & mem($int, $sum(V_yy,1), integer))
  & $lesseq(0,$sum(V_yy,1))) & $true) & ~ (((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_ii)) & (e_ee = V_zz))
  & ($sum(V_yy,1) = V_bbcc))) & ~ (((((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_hh)) & (V_zz = e_ii))
  & ($sum(V_yy,1) = V_bbcc)) & ~ ((((V_uu = false) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = false) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false))) & (e_ee = e_bb))) & ~ (((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_hh)) & (V_zz = e_ii))
  & ($sum(V_yy,1) = V_bbcc)) & (V_uu = false)) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false)) & (e_ee = e_bb))) & ~ (((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_hh)) & (V_zz = e_ii))
  & ($sum(V_yy,1) = V_bbcc)) & (V_uu = true)) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false)) & (e_ee = e_bb))) & ~ (((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_hh)) & (V_zz = e_ii))
  & ($sum(V_yy,1) = V_bbcc)) & (V_uu = true)) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false)) & (e_ee = e_bb))) & ~ (((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_hh)) & (V_zz = e_ii))
  & ($sum(V_yy,1) = V_bbcc)) & (V_uu = false)) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false))
  & (($lesseq($sum($difference(V_yy,V_bbee),1),$sum(V_bbff,V_bbgg))
  & (e_ee = V_zz)) | (~
  $lesseq($sum($difference(V_yy,V_bbee),1),$sum(V_bbff,V_bbgg))
  & (e_ee = e_bb))))) & ~ (((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~
  (V_zz = e_ii)) & (V_zz = e_hh)) & ($sum(V_yy,1) = V_bbcc)) & ~
  ((((V_uu = false) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~
  ((((V_uu = true) & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & ~
  ((((V_uu = true) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~
  ((((V_uu = false) & (V_vv = true)) & (V_ww = false)) & (V_xx = false)))
  & (e_ee = e_bb))) & ~ ((((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~
  (V_zz = e_ii)) & (V_zz = e_hh)) & ($sum(V_yy,1) = V_bbcc))
  & (V_uu = false)) & (V_vv = true)) & (V_ww = false)) & (V_xx = false))
  & (e_ee = e_gg)) & (V_bbee = $sum(V_yy,1)))) & ~ ((((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ii)) & (V_zz = e_hh))
  & ($sum(V_yy,1) = V_bbcc)) & (V_uu = true)) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false)) & (e_ee = e_gg))
  & (V_bbee = $sum(V_yy,1)))) & ~ ((((((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ii)) & (V_zz = e_hh))
  & ($sum(V_yy,1) = V_bbcc)) & (V_uu = true)) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false)) & (e_ee = e_gg))
  & (V_bbee = $sum(V_yy,1)))) & ~ (((((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ii)) & (V_zz = e_hh))
  & ($sum(V_yy,1) = V_bbcc)) & (V_uu = false)) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false))
  & (($lesseq($sum($difference($difference($sum(V_yy,1),V_bbee),1),1),V_bbff)
  & (e_ee = V_zz)) | (~
  $lesseq($sum($difference($difference($sum(V_yy,1),V_bbee),1),1),V_bbff)
  & (e_ee = e_ii))))) & ~ (((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & (V_zz = e_gg)) & ($sum(V_yy,1) = V_bbcc)) & ~
  ((((V_uu = false) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~
  ((((V_uu = true) & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & ~
  ((((V_uu = true) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~
  ((((V_uu = false) & (V_vv = true)) & (V_ww = false)) & (V_xx = false)))
  & (e_ee = e_bb))) & ~ (((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & (V_zz = e_gg)) & ($sum(V_yy,1) = V_bbcc))
  & (V_uu = false)) & (V_vv = true)) & (V_ww = false)) & (V_xx = false))
  & (($lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)
  & ((e_ee = e_gg) & (V_bbee = $sum(V_yy,1)))) | (~
  $lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)
  & (e_ee = e_bb))))) & ~ (((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & (V_zz = e_gg)) & ($sum(V_yy,1) = V_bbcc)) & (V_uu = true))
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false))
  & (($lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)
  & ((e_ee = e_gg) & (V_bbee = $sum(V_yy,1)))) | (~
  $lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)
  & (e_ee = e_bb))))) & ~ (((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & (V_zz = e_gg)) & ($sum(V_yy,1) = V_bbcc)) & (V_uu = true))
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false))
  & (($lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)
  & ((e_ee = e_gg) & (V_bbee = $sum(V_yy,1)))) | (~
  $lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)
  & (e_ee = e_bb))))) & ~ (((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & (V_zz = e_gg)) & ($sum(V_yy,1) = V_bbcc))
  & (V_uu = false)) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))
  & (($lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)
  & (e_ee = e_hh)) | (~
  $lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)
  & (e_ee = e_bb))))) & ~ (((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & (V_zz = e_gg)) & ($sum(V_yy,1) = V_bbcc)) & (e_ee = e_bb))
  & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = true)) & (V_xx = false)))
  & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = false)) & (V_xx = false)))
  & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = true)) & (V_xx = false)))
  & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false)))) & ~ (((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & (V_zz = e_gg)) & ($sum(V_yy,1) = V_bbcc)) & (e_ee = e_bb))
  & (V_uu = false)) & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & ~
  (((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh))
  & (V_zz = e_gg)) & ($sum(V_yy,1) = V_bbcc)) & (e_ee = e_bb))
  & (V_uu = true)) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~
  (((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh))
  & (V_zz = e_gg)) & ($sum(V_yy,1) = V_bbcc)) & (e_ee = e_bb))
  & (V_uu = true)) & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & ~
  (((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh))
  & (V_zz = e_gg)) & ($sum(V_yy,1) = V_bbcc)) & (e_ee = e_bb))
  & (V_uu = false)) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~
  (((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg))
  & (V_zz = e_ff)) & ($sum(V_yy,1) = V_bbcc)) & ~ ((((V_uu = false)
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = true)
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & ~ ((((V_uu = true)
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = false)
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & (e_ee = e_bb))) & ~
  ((((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg))
  & (V_zz = e_ff)) & ($sum(V_yy,1) = V_bbcc)) & (V_uu = false))
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false))
  & (V_bbdd = $sum(V_yy,1))) & (e_ee = V_zz))) & ~ (((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & (V_zz = e_ff))
  & ($sum(V_yy,1) = V_bbcc)) & (V_uu = true)) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false)) & (e_ee = e_bb))) & ~ (((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & (V_zz = e_ff))
  & ($sum(V_yy,1) = V_bbcc)) & (V_uu = true)) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false)) & (e_ee = e_bb))) & ~ ((((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & (V_zz = e_ff))
  & ($sum(V_yy,1) = V_bbcc)) & (V_uu = false)) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false)) & (e_ee = e_gg)) & (V_bbee = V_yy))) & ~
  (((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff))
  & (V_zz = e_ee)) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))) & (e_ee = e_bb)) & ($sum(V_yy,1) = V_bbcc))) & ~
  ((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff))
  & (V_zz = e_ee)) & (V_uu = false)) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))
  & ($lesseq($sum($difference($difference($sum(V_bbcc,1),V_bbbb),1),1),V_bbii)
  | ((~
  $lesseq($sum($difference($difference($sum(V_bbcc,1),V_bbbb),1),1),V_bbii)
  & ((V_bbdd = $sum(V_yy,1)) & (e_ee = e_ff))) & ($sum(V_yy,1) = V_bbcc)))))
  & ~ (((((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd))
  & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff))
  & (V_zz = e_ee)) & (V_uu = true)) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false)) & (e_ee = e_gg)) & (V_bbdd = V_bbcc))
  & (V_bbee = $sum(V_yy,1))) & ($sum(V_yy,1) = V_bbcc))) & ~ ((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff)) & (V_zz = e_ee))
  & (V_uu = true)) & (V_vv = true)) & (V_ww = false)) & (V_xx = false))
  & ($lesseq($sum($difference($difference($sum(V_bbcc,1),V_bbbb),1),1),V_bbii)
  | ((~
  $lesseq($sum($difference($difference($sum(V_bbcc,1),V_bbbb),1),1),V_bbii)
  & (e_ee = e_bb)) & ($sum(V_yy,1) = V_bbcc))))) & ~ (((((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff)) & (V_zz = e_ee))
  & (V_uu = false)) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))
  & (e_ee = e_gg)) & (V_bbdd = V_bbcc)) & (V_bbee = V_yy))
  & ($sum(V_yy,1) = V_bbcc))) & ~ (((((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_ee)) & (V_zz = e_dd)) & ~ ((((V_uu = false)
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = true)
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & ~ ((((V_uu = true)
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = false)
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & (e_ee = e_bb))
  & ($sum(V_yy,1) = V_bbcc))) & ~ (((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_ee)) & (V_zz = e_dd)) & (V_uu = false))
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & ~ (((((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ee)) & (V_zz = e_dd))
  & (V_uu = true)) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))
  & (e_ee = e_gg)) & ($sum(V_yy,1) = V_bbbb)) & (V_bbdd = V_bbbb))
  & (V_bbee = $sum(V_yy,1)))) & ~ (((((((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_ee)) & (V_zz = e_dd)) & (V_uu = false))
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false)) & (e_ee = e_gg))
  & ($sum(V_yy,1) = V_bbbb)) & (V_bbdd = V_bbbb)) & (V_bbee = V_yy))) & ~
  ((((((((((((~ (V_zz = e_ii) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_dd)) & (V_zz = e_cc))
  & ($sum(V_yy,1) = V_bbcc)) & ~ ((((V_uu = false) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = false) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false))) & (e_ee = e_bb))) & ~ ((((((((((((~
  (V_zz = e_ii) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_dd)) & (V_zz = e_cc))
  & ($sum(V_yy,1) = V_bbcc)) & (V_uu = false)) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false)) & (e_ee = e_bb))) & ~ ((((((((((((~
  (V_zz = e_ii) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_dd)) & (V_zz = e_cc))
  & ($sum(V_yy,1) = V_bbcc)) & (V_uu = true)) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false)) & (e_ee = e_bb))) & ~ ((((((((((((~
  (V_zz = e_ii) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_dd)) & (V_zz = e_cc))
  & ($sum(V_yy,1) = V_bbcc)) & (V_uu = true)) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false))
  & (($lesseq(V_bbjj,$difference($sum(V_yy,1),V_bbaa)) & ((e_ee = e_dd)
  & (V_bbbb = $sum(V_yy,1)))) | (~
  $lesseq(V_bbjj,$difference($sum(V_yy,1),V_bbaa)) & (e_ee = V_zz))))))).

tff(f51, type, f51: (enum_aa * $int * bool * bool * bool * bool * $int *
  $int * $int * $int * $int * enum_aa * $int * bool * bool * bool * bool *
  $int * $int * $int * $int * $int * $int * $int * $int * set($int) *
  set($int) * set($int) * set($int) * $int * $int * $int * $int * $int *
  $int * $int * $int * $int * $int * $int * $int) > $o).

tff(f51_def, axiom, ![V_zz:enum_aa, V_yy:$int, V_xx:bool, V_ww:bool, V_vv:
  bool, V_uu:bool, V_tt:$int, V_ss:$int, V_rr:$int, V_qq:$int, V_pp:$int,
  V_oo:enum_aa, V_nn:$int, V_mm:bool, V_ll:bool, V_kk:bool, V_jj:bool,
  V_bbxx:$int, V_bbww:$int, V_bbvv:$int, V_bbuu:$int, V_bbtt:$int, V_bbss:
  $int, V_bbrr:$int, V_bbqq:$int, V_bbpp:set($int), V_bboo:set($int), V_bbnn:
  set($int), V_bbmm:set($int), V_bbll:$int, V_bbkk:$int, V_bbjj:$int, V_bbii:
  $int, V_bbhh:$int, V_bbgg:$int, V_bbff:$int, V_bbee:$int, V_bbdd:$int,
  V_bbcc:$int, V_bbbb:$int, V_bbaa:$int]: (f51(V_zz, V_yy, V_xx, V_ww, V_vv,
  V_uu, V_tt, V_ss, V_rr, V_qq, V_pp, V_oo, V_nn, V_mm, V_ll, V_kk, V_jj,
  V_bbxx, V_bbww, V_bbvv, V_bbuu, V_bbtt, V_bbss, V_bbrr, V_bbqq, V_bbpp,
  V_bboo, V_bbnn, V_bbmm, V_bbll, V_bbkk, V_bbjj, V_bbii, V_bbhh, V_bbgg,
  V_bbff, V_bbee, V_bbdd, V_bbcc, V_bbbb, V_bbaa)
  <=> ((((((((((((((((((((((((((((((((((((((((((((((((((((($true & ~
  (V_zz = e_bb)) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~
  $lesseq($sum($difference($difference($sum(V_bbcc,1),V_bbbb),1),1),V_bbii))
  & (V_zz = e_ee)) & (V_uu = false)) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false)) & mem($int, $sum(V_yy,1), integer))
  & $lesseq(0,$sum(V_yy,1))) & $true) & ~ (((((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_hh)) & (V_zz = e_ii))
  & ($sum(V_yy,1) = V_bbdd)) & ~ ((((V_uu = false) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = false) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false))) & (e_ff = e_bb))) & ~ (((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_hh)) & (V_zz = e_ii))
  & ($sum(V_yy,1) = V_bbdd)) & (V_uu = false)) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false)) & (e_ff = e_bb))) & ~ (((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_hh)) & (V_zz = e_ii))
  & ($sum(V_yy,1) = V_bbdd)) & (V_uu = true)) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false)) & (e_ff = e_bb))) & ~ (((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_hh)) & (V_zz = e_ii))
  & ($sum(V_yy,1) = V_bbdd)) & (V_uu = true)) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false)) & (e_ff = e_bb))) & ~ (((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_hh)) & (V_zz = e_ii))
  & ($sum(V_yy,1) = V_bbdd)) & (V_uu = false)) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false)) & (~
  $lesseq($sum($difference(V_yy,V_bbee),1),$sum(V_bbff,V_bbgg))
  & (e_ff = e_bb)))) & ~ (((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~
  (V_zz = e_ii)) & (V_zz = e_hh)) & ($sum(V_yy,1) = V_bbdd)) & ~
  ((((V_uu = false) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~
  ((((V_uu = true) & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & ~
  ((((V_uu = true) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~
  ((((V_uu = false) & (V_vv = true)) & (V_ww = false)) & (V_xx = false)))
  & (e_ff = e_bb))) & ~ ((((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~
  (V_zz = e_ii)) & (V_zz = e_hh)) & ($sum(V_yy,1) = V_bbdd))
  & (V_uu = false)) & (V_vv = true)) & (V_ww = false)) & (V_xx = false))
  & (e_ff = e_gg)) & (V_bbee = $sum(V_yy,1)))) & ~ ((((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ii)) & (V_zz = e_hh))
  & ($sum(V_yy,1) = V_bbdd)) & (V_uu = true)) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false)) & (e_ff = e_gg))
  & (V_bbee = $sum(V_yy,1)))) & ~ ((((((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ii)) & (V_zz = e_hh))
  & ($sum(V_yy,1) = V_bbdd)) & (V_uu = true)) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false)) & (e_ff = e_gg))
  & (V_bbee = $sum(V_yy,1)))) & ~ (((((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ii)) & (V_zz = e_hh))
  & ($sum(V_yy,1) = V_bbdd)) & (V_uu = false)) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false)) & (~
  $lesseq($sum($difference($difference($sum(V_yy,1),V_bbee),1),1),V_bbff)
  & (e_ff = e_ii)))) & ~ (((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & (V_zz = e_gg)) & ($sum(V_yy,1) = V_bbdd)) & ~
  ((((V_uu = false) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~
  ((((V_uu = true) & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & ~
  ((((V_uu = true) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~
  ((((V_uu = false) & (V_vv = true)) & (V_ww = false)) & (V_xx = false)))
  & (e_ff = e_bb))) & ~ (((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & (V_zz = e_gg)) & ($sum(V_yy,1) = V_bbdd))
  & (V_uu = false)) & (V_vv = true)) & (V_ww = false)) & (V_xx = false))
  & (($lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)
  & ((e_ff = e_gg) & (V_bbee = $sum(V_yy,1)))) | (~
  $lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)
  & (e_ff = e_bb))))) & ~ (((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & (V_zz = e_gg)) & ($sum(V_yy,1) = V_bbdd)) & (V_uu = true))
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false))
  & (($lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)
  & ((e_ff = e_gg) & (V_bbee = $sum(V_yy,1)))) | (~
  $lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)
  & (e_ff = e_bb))))) & ~ (((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & (V_zz = e_gg)) & ($sum(V_yy,1) = V_bbdd)) & (V_uu = true))
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false))
  & (($lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)
  & ((e_ff = e_gg) & (V_bbee = $sum(V_yy,1)))) | (~
  $lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)
  & (e_ff = e_bb))))) & ~ (((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & (V_zz = e_gg)) & ($sum(V_yy,1) = V_bbdd))
  & (V_uu = false)) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))
  & (($lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)
  & (e_ff = e_hh)) | (~
  $lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)
  & (e_ff = e_bb))))) & ~ (((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & (V_zz = e_gg)) & ($sum(V_yy,1) = V_bbdd)) & (e_ff = e_bb))
  & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = true)) & (V_xx = false)))
  & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = false)) & (V_xx = false)))
  & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = true)) & (V_xx = false)))
  & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false)))) & ~ (((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & (V_zz = e_gg)) & ($sum(V_yy,1) = V_bbdd)) & (e_ff = e_bb))
  & (V_uu = false)) & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & ~
  (((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh))
  & (V_zz = e_gg)) & ($sum(V_yy,1) = V_bbdd)) & (e_ff = e_bb))
  & (V_uu = true)) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~
  (((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh))
  & (V_zz = e_gg)) & ($sum(V_yy,1) = V_bbdd)) & (e_ff = e_bb))
  & (V_uu = true)) & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & ~
  (((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh))
  & (V_zz = e_gg)) & ($sum(V_yy,1) = V_bbdd)) & (e_ff = e_bb))
  & (V_uu = false)) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~
  (((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg))
  & (V_zz = e_ff)) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))) & (e_ff = e_bb)) & ($sum(V_yy,1) = V_bbdd))) & ~
  (((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg))
  & (V_zz = e_ff)) & ($sum(V_yy,1) = V_bbdd)) & (V_uu = true))
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false)) & (e_ff = e_bb))) & ~
  (((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg))
  & (V_zz = e_ff)) & ($sum(V_yy,1) = V_bbdd)) & (V_uu = true))
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false)) & (e_ff = e_bb))) & ~
  ((((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg))
  & (V_zz = e_ff)) & ($sum(V_yy,1) = V_bbdd)) & (V_uu = false))
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false)) & (e_ff = e_gg))
  & (V_bbee = V_yy))) & ~ (((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~
  (V_zz = e_ff)) & (V_zz = e_ee)) & ~ ((((V_uu = false) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = false) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false))) & (e_ff = e_bb))
  & ($sum(V_yy,1) = V_bbdd))) & ~ ((((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ff)) & (V_zz = e_ee)) & (V_uu = false))
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false))
  & ((($lesseq($sum($difference($difference($sum(V_bbcc,1),V_bbbb),1),1),V_bbii)
  & ((V_bbcc = $sum(V_yy,1)) & (e_ff = e_ee))) & ($sum(V_yy,1) = V_bbdd)) | ~
  $lesseq($sum($difference($difference($sum(V_bbcc,1),V_bbbb),1),1),V_bbii))))
  & ~ ((((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff))
  & (V_zz = e_ee)) & (V_uu = true)) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false)) & (e_ff = e_gg)) & ($sum(V_yy,1) = V_bbcc))
  & (V_bbee = $sum(V_yy,1)))) & ~ (((((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ff)) & (V_zz = e_ee)) & (V_uu = true))
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false))
  & (($lesseq($sum($difference($difference($sum(V_bbcc,1),V_bbbb),1),1),V_bbii)
  & ((V_bbcc = $sum(V_yy,1)) & (e_ff = e_ee))) | (~
  $lesseq($sum($difference($difference($sum(V_bbcc,1),V_bbbb),1),1),V_bbii)
  & (e_ff = e_bb)))) & ($sum(V_yy,1) = V_bbdd))) & ~ ((((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff)) & (V_zz = e_ee))
  & (V_uu = false)) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))
  & (e_ff = e_gg)) & ($sum(V_yy,1) = V_bbcc)) & (V_bbee = V_yy))) & ~
  (((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ee))
  & (V_zz = e_dd)) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))) & (e_ff = e_bb)) & ($sum(V_yy,1) = V_bbdd))) & ~
  ((((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ee))
  & (V_zz = e_dd)) & (V_uu = false)) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false)) & (V_bbcc = $sum(V_yy,1))) & (e_ff = e_ee))
  & ($sum(V_yy,1) = V_bbdd))) & ~ (((((((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_ee)) & (V_zz = e_dd)) & (V_uu = true))
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false)) & (e_ff = e_gg))
  & (V_bbcc = V_bbbb)) & ($sum(V_yy,1) = V_bbbb)) & (V_bbee = $sum(V_yy,1))))
  & ~ (((((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_ii))
  & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ee))
  & (V_zz = e_dd)) & (V_uu = false)) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false)) & (e_ff = e_gg)) & (V_bbcc = V_bbbb))
  & ($sum(V_yy,1) = V_bbbb)) & (V_bbee = V_yy))) & ~ ((((((((((((~
  (V_zz = e_ii) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_dd)) & (V_zz = e_cc))
  & ($sum(V_yy,1) = V_bbdd)) & ~ ((((V_uu = false) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = false) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false))) & (e_ff = e_bb))) & ~ ((((((((((((~
  (V_zz = e_ii) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_dd)) & (V_zz = e_cc))
  & ($sum(V_yy,1) = V_bbdd)) & (V_uu = false)) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false)) & (e_ff = e_bb))) & ~ ((((((((((((~
  (V_zz = e_ii) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_dd)) & (V_zz = e_cc))
  & ($sum(V_yy,1) = V_bbdd)) & (V_uu = true)) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false)) & (e_ff = e_bb))) & ~ ((((((((((((~
  (V_zz = e_ii) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_dd)) & (V_zz = e_cc))
  & ($sum(V_yy,1) = V_bbdd)) & (V_uu = true)) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false))
  & ($lesseq(V_bbjj,$difference($sum(V_yy,1),V_bbaa)) & ((e_ff = e_dd)
  & (V_bbbb = $sum(V_yy,1)))))))).

tff(f52, type, f52: (enum_aa * $int * bool * bool * bool * bool * $int *
  $int * $int * $int * $int * enum_aa * $int * bool * bool * bool * bool *
  $int * $int * $int * $int * $int * $int * $int * $int * set($int) *
  set($int) * set($int) * set($int) * $int * $int * $int * $int * $int *
  $int * $int * $int * $int * $int * $int * $int) > $o).

tff(f52_def, axiom, ![V_zz:enum_aa, V_yy:$int, V_xx:bool, V_ww:bool, V_vv:
  bool, V_uu:bool, V_tt:$int, V_ss:$int, V_rr:$int, V_qq:$int, V_pp:$int,
  V_oo:enum_aa, V_nn:$int, V_mm:bool, V_ll:bool, V_kk:bool, V_jj:bool,
  V_bbxx:$int, V_bbww:$int, V_bbvv:$int, V_bbuu:$int, V_bbtt:$int, V_bbss:
  $int, V_bbrr:$int, V_bbqq:$int, V_bbpp:set($int), V_bboo:set($int), V_bbnn:
  set($int), V_bbmm:set($int), V_bbll:$int, V_bbkk:$int, V_bbjj:$int, V_bbii:
  $int, V_bbhh:$int, V_bbgg:$int, V_bbff:$int, V_bbee:$int, V_bbdd:$int,
  V_bbcc:$int, V_bbbb:$int, V_bbaa:$int]: (f52(V_zz, V_yy, V_xx, V_ww, V_vv,
  V_uu, V_tt, V_ss, V_rr, V_qq, V_pp, V_oo, V_nn, V_mm, V_ll, V_kk, V_jj,
  V_bbxx, V_bbww, V_bbvv, V_bbuu, V_bbtt, V_bbss, V_bbrr, V_bbqq, V_bbpp,
  V_bboo, V_bbnn, V_bbmm, V_bbll, V_bbkk, V_bbjj, V_bbii, V_bbhh, V_bbgg,
  V_bbff, V_bbee, V_bbdd, V_bbcc, V_bbbb, V_bbaa)
  <=> ($sum(V_yy,1) = V_bbdd))).

tff(f54, type, f54: (enum_aa * $int * bool * bool * bool * bool * $int *
  $int * $int * $int * $int * enum_aa * $int * bool * bool * bool * bool *
  $int * $int * $int * $int * $int * $int * $int * $int * set($int) *
  set($int) * set($int) * set($int) * $int * $int * $int * $int * $int *
  $int * $int * $int * $int * $int * $int * $int) > $o).

tff(f54_def, axiom, ![V_zz:enum_aa, V_yy:$int, V_xx:bool, V_ww:bool, V_vv:
  bool, V_uu:bool, V_tt:$int, V_ss:$int, V_rr:$int, V_qq:$int, V_pp:$int,
  V_oo:enum_aa, V_nn:$int, V_mm:bool, V_ll:bool, V_kk:bool, V_jj:bool,
  V_bbxx:$int, V_bbww:$int, V_bbvv:$int, V_bbuu:$int, V_bbtt:$int, V_bbss:
  $int, V_bbrr:$int, V_bbqq:$int, V_bbpp:set($int), V_bboo:set($int), V_bbnn:
  set($int), V_bbmm:set($int), V_bbll:$int, V_bbkk:$int, V_bbjj:$int, V_bbii:
  $int, V_bbhh:$int, V_bbgg:$int, V_bbff:$int, V_bbee:$int, V_bbdd:$int,
  V_bbcc:$int, V_bbbb:$int, V_bbaa:$int]: (f54(V_zz, V_yy, V_xx, V_ww, V_vv,
  V_uu, V_tt, V_ss, V_rr, V_qq, V_pp, V_oo, V_nn, V_mm, V_ll, V_kk, V_jj,
  V_bbxx, V_bbww, V_bbvv, V_bbuu, V_bbtt, V_bbss, V_bbrr, V_bbqq, V_bbpp,
  V_bboo, V_bbnn, V_bbmm, V_bbll, V_bbkk, V_bbjj, V_bbii, V_bbhh, V_bbgg,
  V_bbff, V_bbee, V_bbdd, V_bbcc, V_bbbb, V_bbaa)
  <=> ((((((((((((((((((((((((((((((((((((((((((((((((((($true & ~
  (V_zz = e_bb)) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~ ((((V_uu = false)
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = true)
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & ~ ((((V_uu = true)
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = false)
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & (V_zz = e_ee))
  & mem($int, $sum(V_yy,1), integer)) & $lesseq(0,$sum(V_yy,1))) & $true) & ~
  (((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_hh))
  & (V_zz = e_ii)) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false)))) & ~ (((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~
  (V_zz = e_hh)) & (V_zz = e_ii)) & (V_uu = false)) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false))) & ~ (((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_hh)) & (V_zz = e_ii)) & (V_uu = true))
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~ (((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_hh)) & (V_zz = e_ii))
  & (V_uu = true)) & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & ~
  ((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_hh))
  & (V_zz = e_ii)) & (V_uu = false)) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false)) & ~
  $lesseq($sum($difference(V_yy,V_bbee),1),$sum(V_bbff,V_bbgg)))) & ~
  (((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ii))
  & (V_zz = e_hh)) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false)))) & ~ (((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~
  (V_zz = e_ii)) & (V_zz = e_hh)) & (V_uu = false)) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false)) & (e_bb = e_gg))
  & (V_bbee = $sum(V_yy,1)))) & ~ (((((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ii)) & (V_zz = e_hh)) & (V_uu = true))
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false)) & (e_bb = e_gg))
  & (V_bbee = $sum(V_yy,1)))) & ~ (((((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ii)) & (V_zz = e_hh)) & (V_uu = true))
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false)) & (e_bb = e_gg))
  & (V_bbee = $sum(V_yy,1)))) & ~ ((((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ii)) & (V_zz = e_hh)) & (V_uu = false))
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false)) & (~
  $lesseq($sum($difference($difference($sum(V_yy,1),V_bbee),1),1),V_bbff)
  & (e_bb = e_ii)))) & ~ (((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & (V_zz = e_gg)) & ~ ((((V_uu = false) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = false) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false)))) & ~ ((((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & (V_zz = e_gg)) & (V_uu = false))
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false))
  & (($lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)
  & ((e_bb = e_gg) & (V_bbee = $sum(V_yy,1)))) | ~
  $lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)))) & ~
  ((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh))
  & (V_zz = e_gg)) & (V_uu = true)) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))
  & (($lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)
  & ((e_bb = e_gg) & (V_bbee = $sum(V_yy,1)))) | ~
  $lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)))) & ~
  ((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh))
  & (V_zz = e_gg)) & (V_uu = true)) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))
  & (($lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)
  & ((e_bb = e_gg) & (V_bbee = $sum(V_yy,1)))) | ~
  $lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)))) & ~
  ((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh))
  & (V_zz = e_gg)) & (V_uu = false)) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))
  & (($lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)
  & (e_bb = e_hh)) | ~
  $lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)))) & ~
  (((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh))
  & (V_zz = e_gg)) & (V_uu = false)) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))) & ~ (((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & (V_zz = e_gg)) & (V_uu = true)) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false))) & ~ (((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & (V_zz = e_gg)) & (V_uu = true))
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & ~ (((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & (V_zz = e_gg))
  & (V_uu = false)) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~
  (((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg))
  & (V_zz = e_ff)) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false)))) & ~ (((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~
  (V_zz = e_gg)) & (V_zz = e_ff)) & (V_uu = true)) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false))) & ~ (((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & ~ (V_zz = e_gg)) & (V_zz = e_ff)) & (V_uu = true))
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & ~ (((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & (V_zz = e_ff))
  & (V_uu = false)) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))
  & (e_bb = e_gg)) & (V_bbee = V_yy))) & ~ (((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ff)) & (V_zz = e_ee)) & ~ ((((V_uu = false)
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = true)
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & ~ ((((V_uu = true)
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = false)
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false)))) & ~ ((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff)) & (V_zz = e_ee))
  & (V_uu = false)) & (V_vv = true)) & (V_ww = false)) & (V_xx = false))
  & (($lesseq($sum($difference($difference($sum(V_bbcc,1),V_bbbb),1),1),V_bbii)
  & ((V_bbcc = $sum(V_yy,1)) & (e_bb = e_ee))) | (~
  $lesseq($sum($difference($difference($sum(V_bbcc,1),V_bbbb),1),1),V_bbii)
  & ((V_bbdd = $sum(V_yy,1)) & (e_bb = e_ff)))))) & ~ ((((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff)) & (V_zz = e_ee))
  & (V_uu = true)) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))
  & (e_bb = e_gg)) & (V_bbdd = V_bbcc)) & (V_bbee = $sum(V_yy,1)))) & ~
  ((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff))
  & (V_zz = e_ee)) & (V_uu = true)) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))
  & (($lesseq($sum($difference($difference($sum(V_bbcc,1),V_bbbb),1),1),V_bbii)
  & ((V_bbcc = $sum(V_yy,1)) & (e_bb = e_ee))) | ~
  $lesseq($sum($difference($difference($sum(V_bbcc,1),V_bbbb),1),1),V_bbii))))
  & ~ ((((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff))
  & (V_zz = e_ee)) & (V_uu = false)) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false)) & (e_bb = e_gg)) & (V_bbdd = V_bbcc)) & (V_bbee = V_yy)))
  & ~ (((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ee))
  & (V_zz = e_dd)) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false)))) & ~ (((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_ee)) & (V_zz = e_dd)) & (V_uu = false)) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false)) & (V_bbcc = $sum(V_yy,1)))
  & (e_bb = e_ee))) & ~ (((((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_ee)) & (V_zz = e_dd)) & (V_uu = true)) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false)) & (e_bb = e_gg)) & (V_bbcc = V_bbbb))
  & (V_bbdd = V_bbbb)) & (V_bbee = $sum(V_yy,1)))) & ~ (((((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ee)) & (V_zz = e_dd))
  & (V_uu = false)) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))
  & (e_bb = e_gg)) & (V_bbcc = V_bbbb)) & (V_bbdd = V_bbbb))
  & (V_bbee = V_yy))) & ~ ((((((((((~ (V_zz = e_ii) & ~ (V_zz = e_hh)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_dd))
  & (V_zz = e_cc)) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false)))) & ~ ((((((((((~ (V_zz = e_ii) & ~ (V_zz = e_hh)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_dd))
  & (V_zz = e_cc)) & (V_uu = false)) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))) & ~ ((((((((((~ (V_zz = e_ii) & ~ (V_zz = e_hh)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_dd))
  & (V_zz = e_cc)) & (V_uu = true)) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ (((((((((((~ (V_zz = e_ii) & ~ (V_zz = e_hh)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_dd))
  & (V_zz = e_cc)) & (V_uu = true)) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false)) & ($lesseq(V_bbjj,$difference($sum(V_yy,1),V_bbaa))
  & ((e_bb = e_dd) & (V_bbbb = $sum(V_yy,1)))))))).

tff(f55, type, f55: (enum_aa * $int * bool * bool * bool * bool * $int *
  $int * $int * $int * $int * enum_aa * $int * bool * bool * bool * bool *
  $int * $int * $int * $int * $int * $int * $int * $int * set($int) *
  set($int) * set($int) * set($int) * $int * $int * $int * $int * $int *
  $int * $int * $int * $int * $int * $int * $int) > $o).

tff(f55_def, axiom, ![V_zz:enum_aa, V_yy:$int, V_xx:bool, V_ww:bool, V_vv:
  bool, V_uu:bool, V_tt:$int, V_ss:$int, V_rr:$int, V_qq:$int, V_pp:$int,
  V_oo:enum_aa, V_nn:$int, V_mm:bool, V_ll:bool, V_kk:bool, V_jj:bool,
  V_bbxx:$int, V_bbww:$int, V_bbvv:$int, V_bbuu:$int, V_bbtt:$int, V_bbss:
  $int, V_bbrr:$int, V_bbqq:$int, V_bbpp:set($int), V_bboo:set($int), V_bbnn:
  set($int), V_bbmm:set($int), V_bbll:$int, V_bbkk:$int, V_bbjj:$int, V_bbii:
  $int, V_bbhh:$int, V_bbgg:$int, V_bbff:$int, V_bbee:$int, V_bbdd:$int,
  V_bbcc:$int, V_bbbb:$int, V_bbaa:$int]: (f55(V_zz, V_yy, V_xx, V_ww, V_vv,
  V_uu, V_tt, V_ss, V_rr, V_qq, V_pp, V_oo, V_nn, V_mm, V_ll, V_kk, V_jj,
  V_bbxx, V_bbww, V_bbvv, V_bbuu, V_bbtt, V_bbss, V_bbrr, V_bbqq, V_bbpp,
  V_bboo, V_bbnn, V_bbmm, V_bbll, V_bbkk, V_bbjj, V_bbii, V_bbhh, V_bbgg,
  V_bbff, V_bbee, V_bbdd, V_bbcc, V_bbbb, V_bbaa)
  <=> ((((((((((((((((((((((((((((((((((((((((((((((($true & ~ (V_zz = e_bb))
  & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ii))
  & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & (V_zz = e_ff)) & (V_uu = false))
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false))
  & mem($int, $sum(V_yy,1), integer)) & $lesseq(0,$sum(V_yy,1))) & $true) & ~
  (((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_hh))
  & (V_zz = e_ii)) & (V_yy = V_bbee)) & ~ ((((V_uu = false) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = false) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false))) & (e_gg = e_bb))) & ~ (((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_hh)) & (V_zz = e_ii))
  & (V_yy = V_bbee)) & (V_uu = false)) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false)) & (e_gg = e_bb))) & ~ (((((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_hh)) & (V_zz = e_ii)) & (V_yy = V_bbee))
  & (V_uu = true)) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))
  & (e_gg = e_bb))) & ~ (((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~
  (V_zz = e_hh)) & (V_zz = e_ii)) & (V_yy = V_bbee)) & (V_uu = true))
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false)) & (e_gg = e_bb))) & ~
  (((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_hh))
  & (V_zz = e_ii)) & (V_yy = V_bbee)) & (V_uu = false)) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false)) & (~
  $lesseq($sum($difference(V_yy,V_bbee),1),$sum(V_bbff,V_bbgg))
  & (e_gg = e_bb)))) & ~ (((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~
  (V_zz = e_ii)) & (V_zz = e_hh)) & ~ ((((V_uu = false) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = false) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false))) & (e_gg = e_bb)) & (V_yy = V_bbee)))
  & ~ (((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ii))
  & (V_zz = e_hh)) & (V_uu = false)) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false)) & (~
  $lesseq($sum($difference($difference($sum(V_yy,1),V_bbee),1),1),V_bbff)
  & (e_gg = e_ii))) & (V_yy = V_bbee))) & ~ (((((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & (V_zz = e_gg)) & ~ ((((V_uu = false)
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = true)
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & ~ ((((V_uu = true)
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = false)
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & (e_gg = e_bb))
  & (V_yy = V_bbee))) & ~ ((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & (V_zz = e_gg)) & (V_uu = false)) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false)) & ((~
  $lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)
  & (e_gg = e_bb)) & (V_yy = V_bbee)))) & ~ ((((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & (V_zz = e_gg)) & (V_uu = true))
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false)) & ((~
  $lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)
  & (e_gg = e_bb)) & (V_yy = V_bbee)))) & ~ ((((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & (V_zz = e_gg)) & (V_uu = true))
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false)) & ((~
  $lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)
  & (e_gg = e_bb)) & (V_yy = V_bbee)))) & ~ (((((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & (V_zz = e_gg)) & (V_uu = false))
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false))
  & (($lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)
  & (e_gg = e_hh)) | (~
  $lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)
  & (e_gg = e_bb)))) & (V_yy = V_bbee))) & ~ (((((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & (V_zz = e_gg)) & (e_gg = e_bb))
  & (V_yy = V_bbee)) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false)))) & ~ (((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & (V_zz = e_gg)) & (e_gg = e_bb)) & (V_yy = V_bbee))
  & (V_uu = false)) & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & ~
  (((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh))
  & (V_zz = e_gg)) & (e_gg = e_bb)) & (V_yy = V_bbee)) & (V_uu = true))
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~ (((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & (V_zz = e_gg))
  & (e_gg = e_bb)) & (V_yy = V_bbee)) & (V_uu = true)) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false))) & ~ (((((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & (V_zz = e_gg)) & (e_gg = e_bb))
  & (V_yy = V_bbee)) & (V_uu = false)) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ (((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~
  (V_zz = e_gg)) & (V_zz = e_ff)) & ~ ((((V_uu = false) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = false) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false))) & (e_gg = e_bb)) & (V_yy = V_bbee)))
  & ~ (((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg))
  & (V_zz = e_ff)) & (V_uu = true)) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false)) & (e_gg = e_bb)) & (V_yy = V_bbee))) & ~ (((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & (V_zz = e_ff))
  & (V_uu = true)) & (V_vv = true)) & (V_ww = false)) & (V_xx = false))
  & (e_gg = e_bb)) & (V_yy = V_bbee))) & ~ (((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & ~ (V_zz = e_gg)) & (V_zz = e_ff)) & (V_uu = false))
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~ (((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff)) & (V_zz = e_ee)) & ~
  ((((V_uu = false) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~
  ((((V_uu = true) & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & ~
  ((((V_uu = true) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~
  ((((V_uu = false) & (V_vv = true)) & (V_ww = false)) & (V_xx = false)))
  & (e_gg = e_bb)) & (V_yy = V_bbee))) & ~ (((((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ff)) & (V_zz = e_ee)) & (V_uu = false))
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false))
  & (($lesseq($sum($difference($difference($sum(V_bbcc,1),V_bbbb),1),1),V_bbii)
  & ((V_bbcc = $sum(V_yy,1)) & (e_gg = e_ee))) | (~
  $lesseq($sum($difference($difference($sum(V_bbcc,1),V_bbbb),1),1),V_bbii)
  & ((V_bbdd = $sum(V_yy,1)) & (e_gg = e_ff))))) & (V_yy = V_bbee))) & ~
  (((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff))
  & (V_zz = e_ee)) & (V_uu = true)) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))
  & (($lesseq($sum($difference($difference($sum(V_bbcc,1),V_bbbb),1),1),V_bbii)
  & ((V_bbcc = $sum(V_yy,1)) & (e_gg = e_ee))) | (~
  $lesseq($sum($difference($difference($sum(V_bbcc,1),V_bbbb),1),1),V_bbii)
  & (e_gg = e_bb)))) & (V_yy = V_bbee))) & ~ ((((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ff)) & (V_zz = e_ee)) & (V_uu = false))
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false)) & (V_bbdd = V_bbcc)))
  & ~ (((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ee))
  & (V_zz = e_dd)) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))) & (e_gg = e_bb)) & (V_yy = V_bbee))) & ~ ((((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ee)) & (V_zz = e_dd))
  & (V_uu = false)) & (V_vv = true)) & (V_ww = false)) & (V_xx = false))
  & (V_bbcc = $sum(V_yy,1))) & (e_gg = e_ee)) & (V_yy = V_bbee))) & ~
  (((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ee))
  & (V_zz = e_dd)) & (V_uu = false)) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false)) & (V_bbcc = V_bbbb)) & (V_bbdd = V_bbbb))) & ~
  ((((((((((((~ (V_zz = e_ii) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_dd)) & (V_zz = e_cc))
  & (V_yy = V_bbee)) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))) & (e_gg = e_bb))) & ~ ((((((((((((~ (V_zz = e_ii) & ~
  (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_dd)) & (V_zz = e_cc)) & (V_yy = V_bbee)) & (V_uu = false))
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false)) & (e_gg = e_bb))) & ~
  ((((((((((((~ (V_zz = e_ii) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_dd)) & (V_zz = e_cc))
  & (V_yy = V_bbee)) & (V_uu = true)) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false)) & (e_gg = e_bb))) & ~ ((((((((((((~ (V_zz = e_ii) & ~
  (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_dd)) & (V_zz = e_cc)) & (V_yy = V_bbee)) & (V_uu = true))
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false))
  & ($lesseq(V_bbjj,$difference($sum(V_yy,1),V_bbaa)) & ((e_gg = e_dd)
  & (V_bbbb = $sum(V_yy,1)))))))).

tff(f56, type, f56: (enum_aa * $int * bool * bool * bool * bool * $int *
  $int * $int * $int * $int * enum_aa * $int * bool * bool * bool * bool *
  $int * $int * $int * $int * $int * $int * $int * $int * set($int) *
  set($int) * set($int) * set($int) * $int * $int * $int * $int * $int *
  $int * $int * $int * $int * $int * $int * $int) > $o).

tff(f56_def, axiom, ![V_zz:enum_aa, V_yy:$int, V_xx:bool, V_ww:bool, V_vv:
  bool, V_uu:bool, V_tt:$int, V_ss:$int, V_rr:$int, V_qq:$int, V_pp:$int,
  V_oo:enum_aa, V_nn:$int, V_mm:bool, V_ll:bool, V_kk:bool, V_jj:bool,
  V_bbxx:$int, V_bbww:$int, V_bbvv:$int, V_bbuu:$int, V_bbtt:$int, V_bbss:
  $int, V_bbrr:$int, V_bbqq:$int, V_bbpp:set($int), V_bboo:set($int), V_bbnn:
  set($int), V_bbmm:set($int), V_bbll:$int, V_bbkk:$int, V_bbjj:$int, V_bbii:
  $int, V_bbhh:$int, V_bbgg:$int, V_bbff:$int, V_bbee:$int, V_bbdd:$int,
  V_bbcc:$int, V_bbbb:$int, V_bbaa:$int]: (f56(V_zz, V_yy, V_xx, V_ww, V_vv,
  V_uu, V_tt, V_ss, V_rr, V_qq, V_pp, V_oo, V_nn, V_mm, V_ll, V_kk, V_jj,
  V_bbxx, V_bbww, V_bbvv, V_bbuu, V_bbtt, V_bbss, V_bbrr, V_bbqq, V_bbpp,
  V_bboo, V_bbnn, V_bbmm, V_bbll, V_bbkk, V_bbjj, V_bbii, V_bbhh, V_bbgg,
  V_bbff, V_bbee, V_bbdd, V_bbcc, V_bbbb, V_bbaa) <=> ~ (V_zz = e_ff))).

tff(f57, type, f57: (enum_aa * $int * bool * bool * bool * bool * $int *
  $int * $int * $int * $int * enum_aa * $int * bool * bool * bool * bool *
  $int * $int * $int * $int * $int * $int * $int * $int * set($int) *
  set($int) * set($int) * set($int) * $int * $int * $int * $int * $int *
  $int * $int * $int * $int * $int * $int * $int) > $o).

tff(f57_def, axiom, ![V_zz:enum_aa, V_yy:$int, V_xx:bool, V_ww:bool, V_vv:
  bool, V_uu:bool, V_tt:$int, V_ss:$int, V_rr:$int, V_qq:$int, V_pp:$int,
  V_oo:enum_aa, V_nn:$int, V_mm:bool, V_ll:bool, V_kk:bool, V_jj:bool,
  V_bbxx:$int, V_bbww:$int, V_bbvv:$int, V_bbuu:$int, V_bbtt:$int, V_bbss:
  $int, V_bbrr:$int, V_bbqq:$int, V_bbpp:set($int), V_bboo:set($int), V_bbnn:
  set($int), V_bbmm:set($int), V_bbll:$int, V_bbkk:$int, V_bbjj:$int, V_bbii:
  $int, V_bbhh:$int, V_bbgg:$int, V_bbff:$int, V_bbee:$int, V_bbdd:$int,
  V_bbcc:$int, V_bbbb:$int, V_bbaa:$int]: (f57(V_zz, V_yy, V_xx, V_ww, V_vv,
  V_uu, V_tt, V_ss, V_rr, V_qq, V_pp, V_oo, V_nn, V_mm, V_ll, V_kk, V_jj,
  V_bbxx, V_bbww, V_bbvv, V_bbuu, V_bbtt, V_bbss, V_bbrr, V_bbqq, V_bbpp,
  V_bboo, V_bbnn, V_bbmm, V_bbll, V_bbkk, V_bbjj, V_bbii, V_bbhh, V_bbgg,
  V_bbff, V_bbee, V_bbdd, V_bbcc, V_bbbb, V_bbaa)
  <=> ((((((((((((((((((((((((((((((((((((((((((((((((((($true & ~
  (V_zz = e_bb)) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & (V_zz = e_ff))
  & (V_uu = true)) & (V_vv = true)) & (V_ww = false)) & (V_xx = false))
  & mem($int, $sum(V_yy,1), integer)) & $lesseq(0,$sum(V_yy,1))) & $true) & ~
  (((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_hh))
  & (V_zz = e_ii)) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false)))) & ~ (((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~
  (V_zz = e_hh)) & (V_zz = e_ii)) & (V_uu = false)) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false))) & ~ (((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_hh)) & (V_zz = e_ii)) & (V_uu = true))
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~ (((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_hh)) & (V_zz = e_ii))
  & (V_uu = true)) & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & ~
  ((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_hh))
  & (V_zz = e_ii)) & (V_uu = false)) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false)) & ~
  $lesseq($sum($difference(V_yy,V_bbee),1),$sum(V_bbff,V_bbgg)))) & ~
  (((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ii))
  & (V_zz = e_hh)) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false)))) & ~ (((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~
  (V_zz = e_ii)) & (V_zz = e_hh)) & (V_uu = false)) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false)) & (e_bb = e_gg))
  & (V_bbee = $sum(V_yy,1)))) & ~ (((((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ii)) & (V_zz = e_hh)) & (V_uu = true))
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false)) & (e_bb = e_gg))
  & (V_bbee = $sum(V_yy,1)))) & ~ (((((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ii)) & (V_zz = e_hh)) & (V_uu = true))
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false)) & (e_bb = e_gg))
  & (V_bbee = $sum(V_yy,1)))) & ~ ((((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ii)) & (V_zz = e_hh)) & (V_uu = false))
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false)) & (~
  $lesseq($sum($difference($difference($sum(V_yy,1),V_bbee),1),1),V_bbff)
  & (e_bb = e_ii)))) & ~ (((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & (V_zz = e_gg)) & ~ ((((V_uu = false) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = false) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false)))) & ~ ((((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & (V_zz = e_gg)) & (V_uu = false))
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false))
  & (($lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)
  & ((e_bb = e_gg) & (V_bbee = $sum(V_yy,1)))) | ~
  $lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)))) & ~
  ((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh))
  & (V_zz = e_gg)) & (V_uu = true)) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))
  & (($lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)
  & ((e_bb = e_gg) & (V_bbee = $sum(V_yy,1)))) | ~
  $lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)))) & ~
  ((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh))
  & (V_zz = e_gg)) & (V_uu = true)) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))
  & (($lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)
  & ((e_bb = e_gg) & (V_bbee = $sum(V_yy,1)))) | ~
  $lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)))) & ~
  ((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh))
  & (V_zz = e_gg)) & (V_uu = false)) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))
  & (($lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)
  & (e_bb = e_hh)) | ~
  $lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)))) & ~
  (((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh))
  & (V_zz = e_gg)) & (V_uu = false)) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))) & ~ (((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & (V_zz = e_gg)) & (V_uu = true)) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false))) & ~ (((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & (V_zz = e_gg)) & (V_uu = true))
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & ~ (((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & (V_zz = e_gg))
  & (V_uu = false)) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~
  (((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg))
  & (V_zz = e_ff)) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false)))) & ~ (((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~
  (V_zz = e_gg)) & (V_zz = e_ff)) & (V_uu = true)) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false))) & ~ (((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & ~ (V_zz = e_gg)) & (V_zz = e_ff)) & (V_uu = true))
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & ~ (((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & (V_zz = e_ff))
  & (V_uu = false)) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))
  & (e_bb = e_gg)) & (V_bbee = V_yy))) & ~ (((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ff)) & (V_zz = e_ee)) & ~ ((((V_uu = false)
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = true)
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & ~ ((((V_uu = true)
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = false)
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false)))) & ~ ((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff)) & (V_zz = e_ee))
  & (V_uu = false)) & (V_vv = true)) & (V_ww = false)) & (V_xx = false))
  & (($lesseq($sum($difference($difference($sum(V_bbcc,1),V_bbbb),1),1),V_bbii)
  & ((V_bbcc = $sum(V_yy,1)) & (e_bb = e_ee))) | (~
  $lesseq($sum($difference($difference($sum(V_bbcc,1),V_bbbb),1),1),V_bbii)
  & ((V_bbdd = $sum(V_yy,1)) & (e_bb = e_ff)))))) & ~ ((((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff)) & (V_zz = e_ee))
  & (V_uu = true)) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))
  & (e_bb = e_gg)) & (V_bbdd = V_bbcc)) & (V_bbee = $sum(V_yy,1)))) & ~
  ((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff))
  & (V_zz = e_ee)) & (V_uu = true)) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))
  & (($lesseq($sum($difference($difference($sum(V_bbcc,1),V_bbbb),1),1),V_bbii)
  & ((V_bbcc = $sum(V_yy,1)) & (e_bb = e_ee))) | ~
  $lesseq($sum($difference($difference($sum(V_bbcc,1),V_bbbb),1),1),V_bbii))))
  & ~ ((((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff))
  & (V_zz = e_ee)) & (V_uu = false)) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false)) & (e_bb = e_gg)) & (V_bbdd = V_bbcc)) & (V_bbee = V_yy)))
  & ~ (((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ee))
  & (V_zz = e_dd)) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false)))) & ~ (((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_ee)) & (V_zz = e_dd)) & (V_uu = false)) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false)) & (V_bbcc = $sum(V_yy,1)))
  & (e_bb = e_ee))) & ~ (((((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_ee)) & (V_zz = e_dd)) & (V_uu = true)) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false)) & (e_bb = e_gg)) & (V_bbcc = V_bbbb))
  & (V_bbdd = V_bbbb)) & (V_bbee = $sum(V_yy,1)))) & ~ (((((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ee)) & (V_zz = e_dd))
  & (V_uu = false)) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))
  & (e_bb = e_gg)) & (V_bbcc = V_bbbb)) & (V_bbdd = V_bbbb))
  & (V_bbee = V_yy))) & ~ ((((((((((~ (V_zz = e_ii) & ~ (V_zz = e_hh)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_dd))
  & (V_zz = e_cc)) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false)))) & ~ ((((((((((~ (V_zz = e_ii) & ~ (V_zz = e_hh)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_dd))
  & (V_zz = e_cc)) & (V_uu = false)) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))) & ~ ((((((((((~ (V_zz = e_ii) & ~ (V_zz = e_hh)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_dd))
  & (V_zz = e_cc)) & (V_uu = true)) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ (((((((((((~ (V_zz = e_ii) & ~ (V_zz = e_hh)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_dd))
  & (V_zz = e_cc)) & (V_uu = true)) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false)) & ($lesseq(V_bbjj,$difference($sum(V_yy,1),V_bbaa))
  & ((e_bb = e_dd) & (V_bbbb = $sum(V_yy,1)))))))).

tff(f58, type, f58: (enum_aa * $int * bool * bool * bool * bool * $int *
  $int * $int * $int * $int * enum_aa * $int * bool * bool * bool * bool *
  $int * $int * $int * $int * $int * $int * $int * $int * set($int) *
  set($int) * set($int) * set($int) * $int * $int * $int * $int * $int *
  $int * $int * $int * $int * $int * $int * $int) > $o).

tff(f58_def, axiom, ![V_zz:enum_aa, V_yy:$int, V_xx:bool, V_ww:bool, V_vv:
  bool, V_uu:bool, V_tt:$int, V_ss:$int, V_rr:$int, V_qq:$int, V_pp:$int,
  V_oo:enum_aa, V_nn:$int, V_mm:bool, V_ll:bool, V_kk:bool, V_jj:bool,
  V_bbxx:$int, V_bbww:$int, V_bbvv:$int, V_bbuu:$int, V_bbtt:$int, V_bbss:
  $int, V_bbrr:$int, V_bbqq:$int, V_bbpp:set($int), V_bboo:set($int), V_bbnn:
  set($int), V_bbmm:set($int), V_bbll:$int, V_bbkk:$int, V_bbjj:$int, V_bbii:
  $int, V_bbhh:$int, V_bbgg:$int, V_bbff:$int, V_bbee:$int, V_bbdd:$int,
  V_bbcc:$int, V_bbbb:$int, V_bbaa:$int]: (f58(V_zz, V_yy, V_xx, V_ww, V_vv,
  V_uu, V_tt, V_ss, V_rr, V_qq, V_pp, V_oo, V_nn, V_mm, V_ll, V_kk, V_jj,
  V_bbxx, V_bbww, V_bbvv, V_bbuu, V_bbtt, V_bbss, V_bbrr, V_bbqq, V_bbpp,
  V_bboo, V_bbnn, V_bbmm, V_bbll, V_bbkk, V_bbjj, V_bbii, V_bbhh, V_bbgg,
  V_bbff, V_bbee, V_bbdd, V_bbcc, V_bbbb, V_bbaa)
  <=> ((((((((((((((((((((((((((((((((((((((((((((((((((($true & ~
  (V_zz = e_bb)) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & (V_zz = e_ff))
  & (V_uu = true)) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))
  & mem($int, $sum(V_yy,1), integer)) & $lesseq(0,$sum(V_yy,1))) & $true) & ~
  (((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_hh))
  & (V_zz = e_ii)) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false)))) & ~ (((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~
  (V_zz = e_hh)) & (V_zz = e_ii)) & (V_uu = false)) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false))) & ~ (((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_hh)) & (V_zz = e_ii)) & (V_uu = true))
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~ (((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_hh)) & (V_zz = e_ii))
  & (V_uu = true)) & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & ~
  ((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_hh))
  & (V_zz = e_ii)) & (V_uu = false)) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false)) & ~
  $lesseq($sum($difference(V_yy,V_bbee),1),$sum(V_bbff,V_bbgg)))) & ~
  (((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ii))
  & (V_zz = e_hh)) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false)))) & ~ (((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~
  (V_zz = e_ii)) & (V_zz = e_hh)) & (V_uu = false)) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false)) & (e_bb = e_gg))
  & (V_bbee = $sum(V_yy,1)))) & ~ (((((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ii)) & (V_zz = e_hh)) & (V_uu = true))
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false)) & (e_bb = e_gg))
  & (V_bbee = $sum(V_yy,1)))) & ~ (((((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ii)) & (V_zz = e_hh)) & (V_uu = true))
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false)) & (e_bb = e_gg))
  & (V_bbee = $sum(V_yy,1)))) & ~ ((((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ii)) & (V_zz = e_hh)) & (V_uu = false))
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false)) & (~
  $lesseq($sum($difference($difference($sum(V_yy,1),V_bbee),1),1),V_bbff)
  & (e_bb = e_ii)))) & ~ (((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & (V_zz = e_gg)) & ~ ((((V_uu = false) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = false) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false)))) & ~ ((((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & (V_zz = e_gg)) & (V_uu = false))
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false))
  & (($lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)
  & ((e_bb = e_gg) & (V_bbee = $sum(V_yy,1)))) | ~
  $lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)))) & ~
  ((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh))
  & (V_zz = e_gg)) & (V_uu = true)) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))
  & (($lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)
  & ((e_bb = e_gg) & (V_bbee = $sum(V_yy,1)))) | ~
  $lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)))) & ~
  ((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh))
  & (V_zz = e_gg)) & (V_uu = true)) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))
  & (($lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)
  & ((e_bb = e_gg) & (V_bbee = $sum(V_yy,1)))) | ~
  $lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)))) & ~
  ((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh))
  & (V_zz = e_gg)) & (V_uu = false)) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))
  & (($lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)
  & (e_bb = e_hh)) | ~
  $lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)))) & ~
  (((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh))
  & (V_zz = e_gg)) & (V_uu = false)) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))) & ~ (((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & (V_zz = e_gg)) & (V_uu = true)) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false))) & ~ (((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & (V_zz = e_gg)) & (V_uu = true))
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & ~ (((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & (V_zz = e_gg))
  & (V_uu = false)) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~
  (((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg))
  & (V_zz = e_ff)) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false)))) & ~ (((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~
  (V_zz = e_gg)) & (V_zz = e_ff)) & (V_uu = true)) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false))) & ~ (((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & ~ (V_zz = e_gg)) & (V_zz = e_ff)) & (V_uu = true))
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & ~ (((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & (V_zz = e_ff))
  & (V_uu = false)) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))
  & (e_bb = e_gg)) & (V_bbee = V_yy))) & ~ (((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ff)) & (V_zz = e_ee)) & ~ ((((V_uu = false)
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = true)
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & ~ ((((V_uu = true)
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = false)
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false)))) & ~ ((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff)) & (V_zz = e_ee))
  & (V_uu = false)) & (V_vv = true)) & (V_ww = false)) & (V_xx = false))
  & (($lesseq($sum($difference($difference($sum(V_bbcc,1),V_bbbb),1),1),V_bbii)
  & ((V_bbcc = $sum(V_yy,1)) & (e_bb = e_ee))) | (~
  $lesseq($sum($difference($difference($sum(V_bbcc,1),V_bbbb),1),1),V_bbii)
  & ((V_bbdd = $sum(V_yy,1)) & (e_bb = e_ff)))))) & ~ ((((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff)) & (V_zz = e_ee))
  & (V_uu = true)) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))
  & (e_bb = e_gg)) & (V_bbdd = V_bbcc)) & (V_bbee = $sum(V_yy,1)))) & ~
  ((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff))
  & (V_zz = e_ee)) & (V_uu = true)) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))
  & (($lesseq($sum($difference($difference($sum(V_bbcc,1),V_bbbb),1),1),V_bbii)
  & ((V_bbcc = $sum(V_yy,1)) & (e_bb = e_ee))) | ~
  $lesseq($sum($difference($difference($sum(V_bbcc,1),V_bbbb),1),1),V_bbii))))
  & ~ ((((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff))
  & (V_zz = e_ee)) & (V_uu = false)) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false)) & (e_bb = e_gg)) & (V_bbdd = V_bbcc)) & (V_bbee = V_yy)))
  & ~ (((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ee))
  & (V_zz = e_dd)) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false)))) & ~ (((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_ee)) & (V_zz = e_dd)) & (V_uu = false)) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false)) & (V_bbcc = $sum(V_yy,1)))
  & (e_bb = e_ee))) & ~ (((((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_ee)) & (V_zz = e_dd)) & (V_uu = true)) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false)) & (e_bb = e_gg)) & (V_bbcc = V_bbbb))
  & (V_bbdd = V_bbbb)) & (V_bbee = $sum(V_yy,1)))) & ~ (((((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ee)) & (V_zz = e_dd))
  & (V_uu = false)) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))
  & (e_bb = e_gg)) & (V_bbcc = V_bbbb)) & (V_bbdd = V_bbbb))
  & (V_bbee = V_yy))) & ~ ((((((((((~ (V_zz = e_ii) & ~ (V_zz = e_hh)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_dd))
  & (V_zz = e_cc)) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false)))) & ~ ((((((((((~ (V_zz = e_ii) & ~ (V_zz = e_hh)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_dd))
  & (V_zz = e_cc)) & (V_uu = false)) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))) & ~ ((((((((((~ (V_zz = e_ii) & ~ (V_zz = e_hh)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_dd))
  & (V_zz = e_cc)) & (V_uu = true)) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ (((((((((((~ (V_zz = e_ii) & ~ (V_zz = e_hh)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_dd))
  & (V_zz = e_cc)) & (V_uu = true)) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false)) & ($lesseq(V_bbjj,$difference($sum(V_yy,1),V_bbaa))
  & ((e_bb = e_dd) & (V_bbbb = $sum(V_yy,1)))))))).

tff(f59, type, f59: (enum_aa * $int * bool * bool * bool * bool * $int *
  $int * $int * $int * $int * enum_aa * $int * bool * bool * bool * bool *
  $int * $int * $int * $int * $int * $int * $int * $int * set($int) *
  set($int) * set($int) * set($int) * $int * $int * $int * $int * $int *
  $int * $int * $int * $int * $int * $int * $int) > $o).

tff(f59_def, axiom, ![V_zz:enum_aa, V_yy:$int, V_xx:bool, V_ww:bool, V_vv:
  bool, V_uu:bool, V_tt:$int, V_ss:$int, V_rr:$int, V_qq:$int, V_pp:$int,
  V_oo:enum_aa, V_nn:$int, V_mm:bool, V_ll:bool, V_kk:bool, V_jj:bool,
  V_bbxx:$int, V_bbww:$int, V_bbvv:$int, V_bbuu:$int, V_bbtt:$int, V_bbss:
  $int, V_bbrr:$int, V_bbqq:$int, V_bbpp:set($int), V_bboo:set($int), V_bbnn:
  set($int), V_bbmm:set($int), V_bbll:$int, V_bbkk:$int, V_bbjj:$int, V_bbii:
  $int, V_bbhh:$int, V_bbgg:$int, V_bbff:$int, V_bbee:$int, V_bbdd:$int,
  V_bbcc:$int, V_bbbb:$int, V_bbaa:$int]: (f59(V_zz, V_yy, V_xx, V_ww, V_vv,
  V_uu, V_tt, V_ss, V_rr, V_qq, V_pp, V_oo, V_nn, V_mm, V_ll, V_kk, V_jj,
  V_bbxx, V_bbww, V_bbvv, V_bbuu, V_bbtt, V_bbss, V_bbrr, V_bbqq, V_bbpp,
  V_bboo, V_bbnn, V_bbmm, V_bbll, V_bbkk, V_bbjj, V_bbii, V_bbhh, V_bbgg,
  V_bbff, V_bbee, V_bbdd, V_bbcc, V_bbbb, V_bbaa)
  <=> ((((((((((((((((((((((((((((((((((((((((((((((((((((($true & ~
  (V_zz = e_bb)) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & (V_zz = e_ff))
  & (V_uu = false)) & (V_vv = true)) & (V_ww = false)) & (V_xx = false))
  & mem($int, $sum(V_yy,1), integer)) & $lesseq(0,$sum(V_yy,1))) & ~
  ((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_hh)) & ~
  (V_zz = e_ii)) & ($sum(V_yy,1) = V_bbdd))) & ~ (((((((((((((~ (V_zz = e_bb)
  & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff))
  & ~ (V_zz = e_gg)) & ~ (V_zz = e_hh)) & (V_zz = e_ii))
  & ($sum(V_yy,1) = V_bbdd)) & ~ ((((V_uu = false) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = false) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false))) & (V_zz = e_bb))) & ~ (((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_hh)) & (V_zz = e_ii))
  & ($sum(V_yy,1) = V_bbdd)) & (V_uu = false)) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false)) & (V_zz = e_bb))) & ~ (((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_hh)) & (V_zz = e_ii))
  & ($sum(V_yy,1) = V_bbdd)) & (V_uu = true)) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false)) & (V_zz = e_bb))) & ~ (((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_hh)) & (V_zz = e_ii))
  & ($sum(V_yy,1) = V_bbdd)) & (V_uu = true)) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false)) & (V_zz = e_bb))) & ~ (((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_hh)) & (V_zz = e_ii))
  & ($sum(V_yy,1) = V_bbdd)) & (V_uu = false)) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false))
  & ($lesseq($sum($difference(V_yy,V_bbee),1),$sum(V_bbff,V_bbgg)) | (~
  $lesseq($sum($difference(V_yy,V_bbee),1),$sum(V_bbff,V_bbgg))
  & (V_zz = e_bb))))) & ~ (((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~
  (V_zz = e_ii)) & (V_zz = e_hh)) & ($sum(V_yy,1) = V_bbdd)) & ~
  ((((V_uu = false) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~
  ((((V_uu = true) & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & ~
  ((((V_uu = true) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~
  ((((V_uu = false) & (V_vv = true)) & (V_ww = false)) & (V_xx = false)))
  & (V_zz = e_bb))) & ~ ((((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~
  (V_zz = e_ii)) & (V_zz = e_hh)) & ($sum(V_yy,1) = V_bbdd))
  & (V_uu = false)) & (V_vv = true)) & (V_ww = false)) & (V_xx = false))
  & (V_zz = e_gg)) & (V_bbee = $sum(V_yy,1)))) & ~ ((((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ii)) & (V_zz = e_hh))
  & ($sum(V_yy,1) = V_bbdd)) & (V_uu = true)) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false)) & (V_zz = e_gg))
  & (V_bbee = $sum(V_yy,1)))) & ~ ((((((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ii)) & (V_zz = e_hh))
  & ($sum(V_yy,1) = V_bbdd)) & (V_uu = true)) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false)) & (V_zz = e_gg))
  & (V_bbee = $sum(V_yy,1)))) & ~ (((((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ii)) & (V_zz = e_hh))
  & ($sum(V_yy,1) = V_bbdd)) & (V_uu = false)) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false))
  & ($lesseq($sum($difference($difference($sum(V_yy,1),V_bbee),1),1),V_bbff)
  | (~
  $lesseq($sum($difference($difference($sum(V_yy,1),V_bbee),1),1),V_bbff)
  & (V_zz = e_ii))))) & ~ (((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & (V_zz = e_gg)) & ($sum(V_yy,1) = V_bbdd)) & ~
  ((((V_uu = false) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~
  ((((V_uu = true) & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & ~
  ((((V_uu = true) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~
  ((((V_uu = false) & (V_vv = true)) & (V_ww = false)) & (V_xx = false)))
  & (V_zz = e_bb))) & ~ (((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & (V_zz = e_gg)) & ($sum(V_yy,1) = V_bbdd))
  & (V_uu = false)) & (V_vv = true)) & (V_ww = false)) & (V_xx = false))
  & (($lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)
  & ((V_zz = e_gg) & (V_bbee = $sum(V_yy,1)))) | (~
  $lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)
  & (V_zz = e_bb))))) & ~ (((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & (V_zz = e_gg)) & ($sum(V_yy,1) = V_bbdd)) & (V_uu = true))
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false))
  & (($lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)
  & ((V_zz = e_gg) & (V_bbee = $sum(V_yy,1)))) | (~
  $lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)
  & (V_zz = e_bb))))) & ~ (((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & (V_zz = e_gg)) & ($sum(V_yy,1) = V_bbdd)) & (V_uu = true))
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false))
  & (($lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)
  & ((V_zz = e_gg) & (V_bbee = $sum(V_yy,1)))) | (~
  $lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)
  & (V_zz = e_bb))))) & ~ (((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & (V_zz = e_gg)) & ($sum(V_yy,1) = V_bbdd))
  & (V_uu = false)) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))
  & (($lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)
  & (V_zz = e_hh)) | (~
  $lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)
  & (V_zz = e_bb))))) & ~ (((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & (V_zz = e_gg)) & ($sum(V_yy,1) = V_bbdd)) & (V_zz = e_bb))
  & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = true)) & (V_xx = false)))
  & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = false)) & (V_xx = false)))
  & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = true)) & (V_xx = false)))
  & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false)))) & ~ (((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & (V_zz = e_gg)) & ($sum(V_yy,1) = V_bbdd)) & (V_zz = e_bb))
  & (V_uu = false)) & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & ~
  (((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh))
  & (V_zz = e_gg)) & ($sum(V_yy,1) = V_bbdd)) & (V_zz = e_bb))
  & (V_uu = true)) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~
  (((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh))
  & (V_zz = e_gg)) & ($sum(V_yy,1) = V_bbdd)) & (V_zz = e_bb))
  & (V_uu = true)) & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & ~
  (((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh))
  & (V_zz = e_gg)) & ($sum(V_yy,1) = V_bbdd)) & (V_zz = e_bb))
  & (V_uu = false)) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~
  (((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg))
  & (V_zz = e_ff)) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))) & (V_zz = e_bb)) & ($sum(V_yy,1) = V_bbdd))) & ~
  (((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg))
  & (V_zz = e_ff)) & (V_uu = false)) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))) & ~ (((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~
  (V_zz = e_gg)) & (V_zz = e_ff)) & ($sum(V_yy,1) = V_bbdd)) & (V_uu = true))
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false)) & (V_zz = e_bb))) & ~
  (((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg))
  & (V_zz = e_ff)) & ($sum(V_yy,1) = V_bbdd)) & (V_uu = true))
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false)) & (V_zz = e_bb))) & ~
  ((((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg))
  & (V_zz = e_ff)) & ($sum(V_yy,1) = V_bbdd)) & (V_uu = false))
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false)) & (V_zz = e_gg))
  & (V_bbee = V_yy))) & ~ (((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~
  (V_zz = e_ff)) & (V_zz = e_ee)) & ~ ((((V_uu = false) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = false) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false))) & (V_zz = e_bb))
  & ($sum(V_yy,1) = V_bbdd))) & ~ ((((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ff)) & (V_zz = e_ee)) & (V_uu = false))
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false))
  & ((($lesseq($sum($difference($difference($sum(V_bbcc,1),V_bbbb),1),1),V_bbii)
  & ((V_bbcc = $sum(V_yy,1)) & (V_zz = e_ee))) & ($sum(V_yy,1) = V_bbdd))
  | (~
  $lesseq($sum($difference($difference($sum(V_bbcc,1),V_bbbb),1),1),V_bbii)
  & (V_zz = e_ff))))) & ~ ((((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc))
  & ~ (V_zz = e_dd)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg))
  & ~ (V_zz = e_ff)) & (V_zz = e_ee)) & (V_uu = true)) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false)) & (V_zz = e_gg))
  & ($sum(V_yy,1) = V_bbcc)) & (V_bbee = $sum(V_yy,1)))) & ~ (((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff)) & (V_zz = e_ee))
  & (V_uu = true)) & (V_vv = true)) & (V_ww = false)) & (V_xx = false))
  & (($lesseq($sum($difference($difference($sum(V_bbcc,1),V_bbbb),1),1),V_bbii)
  & ((V_bbcc = $sum(V_yy,1)) & (V_zz = e_ee))) | (~
  $lesseq($sum($difference($difference($sum(V_bbcc,1),V_bbbb),1),1),V_bbii)
  & (V_zz = e_bb)))) & ($sum(V_yy,1) = V_bbdd))) & ~ ((((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff)) & (V_zz = e_ee))
  & (V_uu = false)) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))
  & (V_zz = e_gg)) & ($sum(V_yy,1) = V_bbcc)) & (V_bbee = V_yy))) & ~
  (((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ee))
  & (V_zz = e_dd)) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))) & (V_zz = e_bb)) & ($sum(V_yy,1) = V_bbdd))) & ~
  ((((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ee))
  & (V_zz = e_dd)) & (V_uu = false)) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false)) & (V_bbcc = $sum(V_yy,1))) & (V_zz = e_ee))
  & ($sum(V_yy,1) = V_bbdd))) & ~ (((((((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_ee)) & (V_zz = e_dd)) & (V_uu = true))
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false)) & (V_zz = e_gg))
  & (V_bbcc = V_bbbb)) & ($sum(V_yy,1) = V_bbbb)) & (V_bbee = $sum(V_yy,1))))
  & ~ (((((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_ii))
  & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ee))
  & (V_zz = e_dd)) & (V_uu = false)) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false)) & (V_zz = e_gg)) & (V_bbcc = V_bbbb))
  & ($sum(V_yy,1) = V_bbbb)) & (V_bbee = V_yy))) & ~ ((((((((((((~
  (V_zz = e_ii) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_dd)) & (V_zz = e_cc))
  & ($sum(V_yy,1) = V_bbdd)) & ~ ((((V_uu = false) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = false) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false))) & (V_zz = e_bb))) & ~ ((((((((((((~
  (V_zz = e_ii) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_dd)) & (V_zz = e_cc))
  & ($sum(V_yy,1) = V_bbdd)) & (V_uu = false)) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false)) & (V_zz = e_bb))) & ~ ((((((((((((~
  (V_zz = e_ii) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_dd)) & (V_zz = e_cc))
  & ($sum(V_yy,1) = V_bbdd)) & (V_uu = true)) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false)) & (V_zz = e_bb))) & ~ ((((((((((((~
  (V_zz = e_ii) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_dd)) & (V_zz = e_cc))
  & ($sum(V_yy,1) = V_bbdd)) & (V_uu = true)) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false))
  & (($lesseq(V_bbjj,$difference($sum(V_yy,1),V_bbaa)) & ((V_zz = e_dd)
  & (V_bbbb = $sum(V_yy,1)))) | ~
  $lesseq(V_bbjj,$difference($sum(V_yy,1),V_bbaa))))))).

tff(f60, type, f60: (enum_aa * $int * bool * bool * bool * bool * $int *
  $int * $int * $int * $int * enum_aa * $int * bool * bool * bool * bool *
  $int * $int * $int * $int * $int * $int * $int * $int * set($int) *
  set($int) * set($int) * set($int) * $int * $int * $int * $int * $int *
  $int * $int * $int * $int * $int * $int * $int) > $o).

tff(f60_def, axiom, ![V_zz:enum_aa, V_yy:$int, V_xx:bool, V_ww:bool, V_vv:
  bool, V_uu:bool, V_tt:$int, V_ss:$int, V_rr:$int, V_qq:$int, V_pp:$int,
  V_oo:enum_aa, V_nn:$int, V_mm:bool, V_ll:bool, V_kk:bool, V_jj:bool,
  V_bbxx:$int, V_bbww:$int, V_bbvv:$int, V_bbuu:$int, V_bbtt:$int, V_bbss:
  $int, V_bbrr:$int, V_bbqq:$int, V_bbpp:set($int), V_bboo:set($int), V_bbnn:
  set($int), V_bbmm:set($int), V_bbll:$int, V_bbkk:$int, V_bbjj:$int, V_bbii:
  $int, V_bbhh:$int, V_bbgg:$int, V_bbff:$int, V_bbee:$int, V_bbdd:$int,
  V_bbcc:$int, V_bbbb:$int, V_bbaa:$int]: (f60(V_zz, V_yy, V_xx, V_ww, V_vv,
  V_uu, V_tt, V_ss, V_rr, V_qq, V_pp, V_oo, V_nn, V_mm, V_ll, V_kk, V_jj,
  V_bbxx, V_bbww, V_bbvv, V_bbuu, V_bbtt, V_bbss, V_bbrr, V_bbqq, V_bbpp,
  V_bboo, V_bbnn, V_bbmm, V_bbll, V_bbkk, V_bbjj, V_bbii, V_bbhh, V_bbgg,
  V_bbff, V_bbee, V_bbdd, V_bbcc, V_bbbb, V_bbaa)
  <=> ((((((((((((((((((((((((((((((((((((((((((((((((((($true & ~
  (V_zz = e_bb)) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ ((((V_uu = false)
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = true)
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & ~ ((((V_uu = true)
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = false)
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & (V_zz = e_ff))
  & mem($int, $sum(V_yy,1), integer)) & $lesseq(0,$sum(V_yy,1))) & $true) & ~
  (((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_hh))
  & (V_zz = e_ii)) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false)))) & ~ (((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~
  (V_zz = e_hh)) & (V_zz = e_ii)) & (V_uu = false)) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false))) & ~ (((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_hh)) & (V_zz = e_ii)) & (V_uu = true))
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~ (((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_hh)) & (V_zz = e_ii))
  & (V_uu = true)) & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & ~
  ((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_hh))
  & (V_zz = e_ii)) & (V_uu = false)) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false)) & ~
  $lesseq($sum($difference(V_yy,V_bbee),1),$sum(V_bbff,V_bbgg)))) & ~
  (((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ii))
  & (V_zz = e_hh)) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false)))) & ~ (((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~
  (V_zz = e_ii)) & (V_zz = e_hh)) & (V_uu = false)) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false)) & (e_bb = e_gg))
  & (V_bbee = $sum(V_yy,1)))) & ~ (((((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ii)) & (V_zz = e_hh)) & (V_uu = true))
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false)) & (e_bb = e_gg))
  & (V_bbee = $sum(V_yy,1)))) & ~ (((((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ii)) & (V_zz = e_hh)) & (V_uu = true))
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false)) & (e_bb = e_gg))
  & (V_bbee = $sum(V_yy,1)))) & ~ ((((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ii)) & (V_zz = e_hh)) & (V_uu = false))
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false)) & (~
  $lesseq($sum($difference($difference($sum(V_yy,1),V_bbee),1),1),V_bbff)
  & (e_bb = e_ii)))) & ~ (((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & (V_zz = e_gg)) & ~ ((((V_uu = false) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = false) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false)))) & ~ ((((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & (V_zz = e_gg)) & (V_uu = false))
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false))
  & (($lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)
  & ((e_bb = e_gg) & (V_bbee = $sum(V_yy,1)))) | ~
  $lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)))) & ~
  ((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh))
  & (V_zz = e_gg)) & (V_uu = true)) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))
  & (($lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)
  & ((e_bb = e_gg) & (V_bbee = $sum(V_yy,1)))) | ~
  $lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)))) & ~
  ((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh))
  & (V_zz = e_gg)) & (V_uu = true)) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))
  & (($lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)
  & ((e_bb = e_gg) & (V_bbee = $sum(V_yy,1)))) | ~
  $lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)))) & ~
  ((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh))
  & (V_zz = e_gg)) & (V_uu = false)) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))
  & (($lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)
  & (e_bb = e_hh)) | ~
  $lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)))) & ~
  (((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh))
  & (V_zz = e_gg)) & (V_uu = false)) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))) & ~ (((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & (V_zz = e_gg)) & (V_uu = true)) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false))) & ~ (((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & (V_zz = e_gg)) & (V_uu = true))
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & ~ (((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & (V_zz = e_gg))
  & (V_uu = false)) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~
  (((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg))
  & (V_zz = e_ff)) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false)))) & ~ (((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~
  (V_zz = e_gg)) & (V_zz = e_ff)) & (V_uu = true)) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false))) & ~ (((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & ~ (V_zz = e_gg)) & (V_zz = e_ff)) & (V_uu = true))
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & ~ (((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & (V_zz = e_ff))
  & (V_uu = false)) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))
  & (e_bb = e_gg)) & (V_bbee = V_yy))) & ~ (((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ff)) & (V_zz = e_ee)) & ~ ((((V_uu = false)
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = true)
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & ~ ((((V_uu = true)
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = false)
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false)))) & ~ ((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff)) & (V_zz = e_ee))
  & (V_uu = false)) & (V_vv = true)) & (V_ww = false)) & (V_xx = false))
  & (($lesseq($sum($difference($difference($sum(V_bbcc,1),V_bbbb),1),1),V_bbii)
  & ((V_bbcc = $sum(V_yy,1)) & (e_bb = e_ee))) | (~
  $lesseq($sum($difference($difference($sum(V_bbcc,1),V_bbbb),1),1),V_bbii)
  & ((V_bbdd = $sum(V_yy,1)) & (e_bb = e_ff)))))) & ~ ((((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff)) & (V_zz = e_ee))
  & (V_uu = true)) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))
  & (e_bb = e_gg)) & (V_bbdd = V_bbcc)) & (V_bbee = $sum(V_yy,1)))) & ~
  ((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff))
  & (V_zz = e_ee)) & (V_uu = true)) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))
  & (($lesseq($sum($difference($difference($sum(V_bbcc,1),V_bbbb),1),1),V_bbii)
  & ((V_bbcc = $sum(V_yy,1)) & (e_bb = e_ee))) | ~
  $lesseq($sum($difference($difference($sum(V_bbcc,1),V_bbbb),1),1),V_bbii))))
  & ~ ((((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff))
  & (V_zz = e_ee)) & (V_uu = false)) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false)) & (e_bb = e_gg)) & (V_bbdd = V_bbcc)) & (V_bbee = V_yy)))
  & ~ (((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ee))
  & (V_zz = e_dd)) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false)))) & ~ (((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_ee)) & (V_zz = e_dd)) & (V_uu = false)) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false)) & (V_bbcc = $sum(V_yy,1)))
  & (e_bb = e_ee))) & ~ (((((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_ee)) & (V_zz = e_dd)) & (V_uu = true)) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false)) & (e_bb = e_gg)) & (V_bbcc = V_bbbb))
  & (V_bbdd = V_bbbb)) & (V_bbee = $sum(V_yy,1)))) & ~ (((((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ee)) & (V_zz = e_dd))
  & (V_uu = false)) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))
  & (e_bb = e_gg)) & (V_bbcc = V_bbbb)) & (V_bbdd = V_bbbb))
  & (V_bbee = V_yy))) & ~ ((((((((((~ (V_zz = e_ii) & ~ (V_zz = e_hh)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_dd))
  & (V_zz = e_cc)) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false)))) & ~ ((((((((((~ (V_zz = e_ii) & ~ (V_zz = e_hh)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_dd))
  & (V_zz = e_cc)) & (V_uu = false)) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))) & ~ ((((((((((~ (V_zz = e_ii) & ~ (V_zz = e_hh)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_dd))
  & (V_zz = e_cc)) & (V_uu = true)) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ (((((((((((~ (V_zz = e_ii) & ~ (V_zz = e_hh)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_dd))
  & (V_zz = e_cc)) & (V_uu = true)) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false)) & ($lesseq(V_bbjj,$difference($sum(V_yy,1),V_bbaa))
  & ((e_bb = e_dd) & (V_bbbb = $sum(V_yy,1)))))))).

tff(f61, type, f61: (enum_aa * $int * bool * bool * bool * bool * $int *
  $int * $int * $int * $int * enum_aa * $int * bool * bool * bool * bool *
  $int * $int * $int * $int * $int * $int * $int * $int * set($int) *
  set($int) * set($int) * set($int) * $int * $int * $int * $int * $int *
  $int * $int * $int * $int * $int * $int * $int) > $o).

tff(f61_def, axiom, ![V_zz:enum_aa, V_yy:$int, V_xx:bool, V_ww:bool, V_vv:
  bool, V_uu:bool, V_tt:$int, V_ss:$int, V_rr:$int, V_qq:$int, V_pp:$int,
  V_oo:enum_aa, V_nn:$int, V_mm:bool, V_ll:bool, V_kk:bool, V_jj:bool,
  V_bbxx:$int, V_bbww:$int, V_bbvv:$int, V_bbuu:$int, V_bbtt:$int, V_bbss:
  $int, V_bbrr:$int, V_bbqq:$int, V_bbpp:set($int), V_bboo:set($int), V_bbnn:
  set($int), V_bbmm:set($int), V_bbll:$int, V_bbkk:$int, V_bbjj:$int, V_bbii:
  $int, V_bbhh:$int, V_bbgg:$int, V_bbff:$int, V_bbee:$int, V_bbdd:$int,
  V_bbcc:$int, V_bbbb:$int, V_bbaa:$int]: (f61(V_zz, V_yy, V_xx, V_ww, V_vv,
  V_uu, V_tt, V_ss, V_rr, V_qq, V_pp, V_oo, V_nn, V_mm, V_ll, V_kk, V_jj,
  V_bbxx, V_bbww, V_bbvv, V_bbuu, V_bbtt, V_bbss, V_bbrr, V_bbqq, V_bbpp,
  V_bboo, V_bbnn, V_bbmm, V_bbll, V_bbkk, V_bbjj, V_bbii, V_bbhh, V_bbgg,
  V_bbff, V_bbee, V_bbdd, V_bbcc, V_bbbb, V_bbaa)
  <=> ((((((((((((((((((((((((((((((((((((((((((((((($true & ~ (V_zz = e_bb))
  & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff))
  & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & (V_zz = e_gg))
  & mem($int, $sum(V_yy,1), integer)) & $lesseq(0,$sum(V_yy,1))) & $true) & ~
  (((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_hh))
  & (V_zz = e_ii)) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false)))) & ~ (((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~
  (V_zz = e_hh)) & (V_zz = e_ii)) & (V_uu = false)) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false))) & ~ (((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_hh)) & (V_zz = e_ii)) & (V_uu = true))
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~ (((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_hh)) & (V_zz = e_ii))
  & (V_uu = true)) & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & ~
  ((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_hh))
  & (V_zz = e_ii)) & (V_uu = false)) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false)) & ~
  $lesseq($sum($difference(V_yy,V_bbee),1),$sum(V_bbff,V_bbgg)))) & ~
  (((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ii))
  & (V_zz = e_hh)) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false)))) & ~ (((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~
  (V_zz = e_ii)) & (V_zz = e_hh)) & (V_uu = false)) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false)) & (e_bb = e_gg))
  & (V_bbee = $sum(V_yy,1)))) & ~ (((((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ii)) & (V_zz = e_hh)) & (V_uu = true))
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false)) & (e_bb = e_gg))
  & (V_bbee = $sum(V_yy,1)))) & ~ (((((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ii)) & (V_zz = e_hh)) & (V_uu = true))
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false)) & (e_bb = e_gg))
  & (V_bbee = $sum(V_yy,1)))) & ~ ((((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ii)) & (V_zz = e_hh)) & (V_uu = false))
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false)) & (~
  $lesseq($sum($difference($difference($sum(V_yy,1),V_bbee),1),1),V_bbff)
  & (e_bb = e_ii)))) & ~ (((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & (V_zz = e_gg)) & ~ ((((V_uu = false) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = false) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false)))) & ~ ((((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & (V_zz = e_gg)) & (V_uu = false))
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false))
  & (($lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)
  & ((e_bb = e_gg) & (V_bbee = $sum(V_yy,1)))) | ~
  $lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)))) & ~
  ((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh))
  & (V_zz = e_gg)) & (V_uu = true)) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))
  & (($lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)
  & ((e_bb = e_gg) & (V_bbee = $sum(V_yy,1)))) | ~
  $lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)))) & ~
  ((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh))
  & (V_zz = e_gg)) & (V_uu = true)) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))
  & (($lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)
  & ((e_bb = e_gg) & (V_bbee = $sum(V_yy,1)))) | ~
  $lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)))) & ~
  ((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh))
  & (V_zz = e_gg)) & (V_uu = false)) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))
  & (($lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)
  & (e_bb = e_hh)) | ~
  $lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)))) & ~
  (((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh))
  & (V_zz = e_gg)) & (V_uu = false)) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))) & ~ (((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & (V_zz = e_gg)) & (V_uu = true)) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false))) & ~ (((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & (V_zz = e_gg)) & (V_uu = true))
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & ~ (((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & (V_zz = e_gg))
  & (V_uu = false)) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~
  (((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg))
  & (V_zz = e_ff)) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false)))) & ~ (((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~
  (V_zz = e_gg)) & (V_zz = e_ff)) & (V_uu = true)) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false))) & ~ (((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & ~ (V_zz = e_gg)) & (V_zz = e_ff)) & (V_uu = true))
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & ~ (((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & (V_zz = e_ff))
  & (V_uu = false)) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))
  & (e_bb = e_gg)) & (V_bbee = V_yy))) & ~ (((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ff)) & (V_zz = e_ee)) & ~ ((((V_uu = false)
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = true)
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & ~ ((((V_uu = true)
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = false)
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false)))) & ~ ((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff)) & (V_zz = e_ee))
  & (V_uu = false)) & (V_vv = true)) & (V_ww = false)) & (V_xx = false))
  & (($lesseq($sum($difference($difference($sum(V_bbcc,1),V_bbbb),1),1),V_bbii)
  & ((V_bbcc = $sum(V_yy,1)) & (e_bb = e_ee))) | (~
  $lesseq($sum($difference($difference($sum(V_bbcc,1),V_bbbb),1),1),V_bbii)
  & ((V_bbdd = $sum(V_yy,1)) & (e_bb = e_ff)))))) & ~ ((((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff)) & (V_zz = e_ee))
  & (V_uu = true)) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))
  & (e_bb = e_gg)) & (V_bbdd = V_bbcc)) & (V_bbee = $sum(V_yy,1)))) & ~
  ((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff))
  & (V_zz = e_ee)) & (V_uu = true)) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))
  & (($lesseq($sum($difference($difference($sum(V_bbcc,1),V_bbbb),1),1),V_bbii)
  & ((V_bbcc = $sum(V_yy,1)) & (e_bb = e_ee))) | ~
  $lesseq($sum($difference($difference($sum(V_bbcc,1),V_bbbb),1),1),V_bbii))))
  & ~ ((((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff))
  & (V_zz = e_ee)) & (V_uu = false)) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false)) & (e_bb = e_gg)) & (V_bbdd = V_bbcc)) & (V_bbee = V_yy)))
  & ~ (((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ee))
  & (V_zz = e_dd)) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false)))) & ~ (((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_ee)) & (V_zz = e_dd)) & (V_uu = false)) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false)) & (V_bbcc = $sum(V_yy,1)))
  & (e_bb = e_ee))) & ~ (((((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_ee)) & (V_zz = e_dd)) & (V_uu = true)) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false)) & (e_bb = e_gg)) & (V_bbcc = V_bbbb))
  & (V_bbdd = V_bbbb)) & (V_bbee = $sum(V_yy,1)))) & ~ (((((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ee)) & (V_zz = e_dd))
  & (V_uu = false)) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))
  & (e_bb = e_gg)) & (V_bbcc = V_bbbb)) & (V_bbdd = V_bbbb))
  & (V_bbee = V_yy))) & ~ ((((((((((~ (V_zz = e_ii) & ~ (V_zz = e_hh)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_dd))
  & (V_zz = e_cc)) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false)))) & ~ ((((((((((~ (V_zz = e_ii) & ~ (V_zz = e_hh)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_dd))
  & (V_zz = e_cc)) & (V_uu = false)) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))) & ~ ((((((((((~ (V_zz = e_ii) & ~ (V_zz = e_hh)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_dd))
  & (V_zz = e_cc)) & (V_uu = true)) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ (((((((((((~ (V_zz = e_ii) & ~ (V_zz = e_hh)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_dd))
  & (V_zz = e_cc)) & (V_uu = true)) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false)) & ($lesseq(V_bbjj,$difference($sum(V_yy,1),V_bbaa))
  & ((e_bb = e_dd) & (V_bbbb = $sum(V_yy,1)))))))).

tff(f62, type, f62: (enum_aa * $int * bool * bool * bool * bool * $int *
  $int * $int * $int * $int * enum_aa * $int * bool * bool * bool * bool *
  $int * $int * $int * $int * $int * $int * $int * $int * set($int) *
  set($int) * set($int) * set($int) * $int * $int * $int * $int * $int *
  $int * $int * $int * $int * $int * $int * $int) > $o).

tff(f62_def, axiom, ![V_zz:enum_aa, V_yy:$int, V_xx:bool, V_ww:bool, V_vv:
  bool, V_uu:bool, V_tt:$int, V_ss:$int, V_rr:$int, V_qq:$int, V_pp:$int,
  V_oo:enum_aa, V_nn:$int, V_mm:bool, V_ll:bool, V_kk:bool, V_jj:bool,
  V_bbxx:$int, V_bbww:$int, V_bbvv:$int, V_bbuu:$int, V_bbtt:$int, V_bbss:
  $int, V_bbrr:$int, V_bbqq:$int, V_bbpp:set($int), V_bboo:set($int), V_bbnn:
  set($int), V_bbmm:set($int), V_bbll:$int, V_bbkk:$int, V_bbjj:$int, V_bbii:
  $int, V_bbhh:$int, V_bbgg:$int, V_bbff:$int, V_bbee:$int, V_bbdd:$int,
  V_bbcc:$int, V_bbbb:$int, V_bbaa:$int]: (f62(V_zz, V_yy, V_xx, V_ww, V_vv,
  V_uu, V_tt, V_ss, V_rr, V_qq, V_pp, V_oo, V_nn, V_mm, V_ll, V_kk, V_jj,
  V_bbxx, V_bbww, V_bbvv, V_bbuu, V_bbtt, V_bbss, V_bbrr, V_bbqq, V_bbpp,
  V_bboo, V_bbnn, V_bbmm, V_bbll, V_bbkk, V_bbjj, V_bbii, V_bbhh, V_bbgg,
  V_bbff, V_bbee, V_bbdd, V_bbcc, V_bbbb, V_bbaa) <=> ~ (V_zz = e_gg))).

tff(f63, type, f63: (enum_aa * $int * bool * bool * bool * bool * $int *
  $int * $int * $int * $int * enum_aa * $int * bool * bool * bool * bool *
  $int * $int * $int * $int * $int * $int * $int * $int * set($int) *
  set($int) * set($int) * set($int) * $int * $int * $int * $int * $int *
  $int * $int * $int * $int * $int * $int * $int) > $o).

tff(f63_def, axiom, ![V_zz:enum_aa, V_yy:$int, V_xx:bool, V_ww:bool, V_vv:
  bool, V_uu:bool, V_tt:$int, V_ss:$int, V_rr:$int, V_qq:$int, V_pp:$int,
  V_oo:enum_aa, V_nn:$int, V_mm:bool, V_ll:bool, V_kk:bool, V_jj:bool,
  V_bbxx:$int, V_bbww:$int, V_bbvv:$int, V_bbuu:$int, V_bbtt:$int, V_bbss:
  $int, V_bbrr:$int, V_bbqq:$int, V_bbpp:set($int), V_bboo:set($int), V_bbnn:
  set($int), V_bbmm:set($int), V_bbll:$int, V_bbkk:$int, V_bbjj:$int, V_bbii:
  $int, V_bbhh:$int, V_bbgg:$int, V_bbff:$int, V_bbee:$int, V_bbdd:$int,
  V_bbcc:$int, V_bbbb:$int, V_bbaa:$int]: (f63(V_zz, V_yy, V_xx, V_ww, V_vv,
  V_uu, V_tt, V_ss, V_rr, V_qq, V_pp, V_oo, V_nn, V_mm, V_ll, V_kk, V_jj,
  V_bbxx, V_bbww, V_bbvv, V_bbuu, V_bbtt, V_bbss, V_bbrr, V_bbqq, V_bbpp,
  V_bboo, V_bbnn, V_bbmm, V_bbll, V_bbkk, V_bbjj, V_bbii, V_bbhh, V_bbgg,
  V_bbff, V_bbee, V_bbdd, V_bbcc, V_bbbb, V_bbaa)
  <=> ((((((((((((((((((((((((((((((((((((((((((((((((((((($true & ~
  (V_zz = e_bb)) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh))
  & $lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh))
  & (V_zz = e_gg)) & (V_uu = false)) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false)) & mem($int, $sum(V_yy,1), integer))
  & $lesseq(0,$sum(V_yy,1))) & $true) & ~ ((((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_hh)) & (V_zz = e_ii)) & ~ ((((V_uu = false)
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = true)
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & ~ ((((V_uu = true)
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = false)
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & (e_hh = e_bb))) & ~
  ((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_hh))
  & (V_zz = e_ii)) & (V_uu = false)) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false)) & (e_hh = e_bb))) & ~ ((((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_hh)) & (V_zz = e_ii)) & (V_uu = true))
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false)) & (e_hh = e_bb))) & ~
  ((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_hh))
  & (V_zz = e_ii)) & (V_uu = true)) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false)) & (e_hh = e_bb))) & ~ ((((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_hh)) & (V_zz = e_ii)) & (V_uu = false))
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false)) & (~
  $lesseq($sum($difference(V_yy,V_bbee),1),$sum(V_bbff,V_bbgg))
  & (e_hh = e_bb)))) & ~ ((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~
  (V_zz = e_ii)) & (V_zz = e_hh)) & ~ ((((V_uu = false) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = false) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false))) & (e_hh = e_bb))) & ~ (((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ii)) & (V_zz = e_hh))
  & (V_uu = false)) & (V_vv = true)) & (V_ww = false)) & (V_xx = false))
  & (e_hh = e_gg)) & (V_bbee = $sum(V_yy,1)))) & ~ (((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ii)) & (V_zz = e_hh))
  & (V_uu = true)) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))
  & (e_hh = e_gg)) & (V_bbee = $sum(V_yy,1)))) & ~ (((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ii)) & (V_zz = e_hh))
  & (V_uu = true)) & (V_vv = true)) & (V_ww = false)) & (V_xx = false))
  & (e_hh = e_gg)) & (V_bbee = $sum(V_yy,1)))) & ~ ((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ii)) & (V_zz = e_hh))
  & (V_uu = false)) & (V_vv = true)) & (V_ww = true)) & (V_xx = false)) & (~
  $lesseq($sum($difference($difference($sum(V_yy,1),V_bbee),1),1),V_bbff)
  & (e_hh = e_ii)))) & ~ ((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & (V_zz = e_gg)) & ~ ((((V_uu = false) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = false) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false))) & (e_hh = e_bb))) & ~ ((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & (V_zz = e_gg))
  & (V_uu = false)) & (V_vv = true)) & (V_ww = false)) & (V_xx = false))
  & (($lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)
  & ((e_hh = e_gg) & (V_bbee = $sum(V_yy,1)))) | (~
  $lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)
  & (e_hh = e_bb))))) & ~ ((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & (V_zz = e_gg)) & (V_uu = true)) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false))
  & (($lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)
  & ((e_hh = e_gg) & (V_bbee = $sum(V_yy,1)))) | (~
  $lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)
  & (e_hh = e_bb))))) & ~ ((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & (V_zz = e_gg)) & (V_uu = true)) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false))
  & (($lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)
  & ((e_hh = e_gg) & (V_bbee = $sum(V_yy,1)))) | (~
  $lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)
  & (e_hh = e_bb))))) & ~ ((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & (V_zz = e_gg)) & (V_uu = false)) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false))
  & ($lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh) | (~
  $lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)
  & (e_hh = e_bb))))) & ~ ((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & (V_zz = e_gg)) & (e_hh = e_bb)) & ~ ((((V_uu = false)
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = true)
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & ~ ((((V_uu = true)
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = false)
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false)))) & ~ ((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & (V_zz = e_gg))
  & (e_hh = e_bb)) & (V_uu = false)) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))) & ~ ((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & (V_zz = e_gg)) & (e_hh = e_bb)) & (V_uu = true))
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~ ((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & (V_zz = e_gg))
  & (e_hh = e_bb)) & (V_uu = true)) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))) & ~ ((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & (V_zz = e_gg)) & (e_hh = e_bb)) & (V_uu = false))
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~ ((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & (V_zz = e_ff)) & ~
  ((((V_uu = false) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~
  ((((V_uu = true) & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & ~
  ((((V_uu = true) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~
  ((((V_uu = false) & (V_vv = true)) & (V_ww = false)) & (V_xx = false)))
  & (e_hh = e_bb))) & ~ ((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~
  (V_zz = e_gg)) & (V_zz = e_ff)) & (V_uu = true)) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false)) & (e_hh = e_bb))) & ~ ((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & (V_zz = e_ff))
  & (V_uu = true)) & (V_vv = true)) & (V_ww = false)) & (V_xx = false))
  & (e_hh = e_bb))) & ~ (((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~
  (V_zz = e_gg)) & (V_zz = e_ff)) & (V_uu = false)) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false)) & (e_hh = e_gg)) & (V_bbee = V_yy))) & ~
  ((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff))
  & (V_zz = e_ee)) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))) & (e_hh = e_bb))) & ~ ((((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ff)) & (V_zz = e_ee)) & (V_uu = false))
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false))
  & (($lesseq($sum($difference($difference($sum(V_bbcc,1),V_bbbb),1),1),V_bbii)
  & ((V_bbcc = $sum(V_yy,1)) & (e_hh = e_ee))) | (~
  $lesseq($sum($difference($difference($sum(V_bbcc,1),V_bbbb),1),1),V_bbii)
  & ((V_bbdd = $sum(V_yy,1)) & (e_hh = e_ff)))))) & ~ ((((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff)) & (V_zz = e_ee))
  & (V_uu = true)) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))
  & (e_hh = e_gg)) & (V_bbdd = V_bbcc)) & (V_bbee = $sum(V_yy,1)))) & ~
  ((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff))
  & (V_zz = e_ee)) & (V_uu = true)) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))
  & (($lesseq($sum($difference($difference($sum(V_bbcc,1),V_bbbb),1),1),V_bbii)
  & ((V_bbcc = $sum(V_yy,1)) & (e_hh = e_ee))) | (~
  $lesseq($sum($difference($difference($sum(V_bbcc,1),V_bbbb),1),1),V_bbii)
  & (e_hh = e_bb))))) & ~ ((((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc))
  & ~ (V_zz = e_dd)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg))
  & ~ (V_zz = e_ff)) & (V_zz = e_ee)) & (V_uu = false)) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false)) & (e_hh = e_gg)) & (V_bbdd = V_bbcc))
  & (V_bbee = V_yy))) & ~ ((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_ee)) & (V_zz = e_dd)) & ~ ((((V_uu = false) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = false) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false))) & (e_hh = e_bb))) & ~ (((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ee)) & (V_zz = e_dd))
  & (V_uu = false)) & (V_vv = true)) & (V_ww = false)) & (V_xx = false))
  & (V_bbcc = $sum(V_yy,1))) & (e_hh = e_ee))) & ~ (((((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ee)) & (V_zz = e_dd))
  & (V_uu = true)) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))
  & (e_hh = e_gg)) & (V_bbcc = V_bbbb)) & (V_bbdd = V_bbbb))
  & (V_bbee = $sum(V_yy,1)))) & ~ (((((((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_ee)) & (V_zz = e_dd)) & (V_uu = false))
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false)) & (e_hh = e_gg))
  & (V_bbcc = V_bbbb)) & (V_bbdd = V_bbbb)) & (V_bbee = V_yy))) & ~
  (((((((((((~ (V_zz = e_ii) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_dd)) & (V_zz = e_cc)) & ~
  ((((V_uu = false) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~
  ((((V_uu = true) & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & ~
  ((((V_uu = true) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~
  ((((V_uu = false) & (V_vv = true)) & (V_ww = false)) & (V_xx = false)))
  & (e_hh = e_bb))) & ~ (((((((((((~ (V_zz = e_ii) & ~ (V_zz = e_hh)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_dd))
  & (V_zz = e_cc)) & (V_uu = false)) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false)) & (e_hh = e_bb))) & ~ (((((((((((~ (V_zz = e_ii) & ~
  (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_dd)) & (V_zz = e_cc)) & (V_uu = true)) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false)) & (e_hh = e_bb))) & ~ (((((((((((~
  (V_zz = e_ii) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_dd)) & (V_zz = e_cc)) & (V_uu = true))
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false))
  & ($lesseq(V_bbjj,$difference($sum(V_yy,1),V_bbaa)) & ((e_hh = e_dd)
  & (V_bbbb = $sum(V_yy,1)))))))).

tff(f65, type, f65: (enum_aa * $int * bool * bool * bool * bool * $int *
  $int * $int * $int * $int * enum_aa * $int * bool * bool * bool * bool *
  $int * $int * $int * $int * $int * $int * $int * $int * set($int) *
  set($int) * set($int) * set($int) * $int * $int * $int * $int * $int *
  $int * $int * $int * $int * $int * $int * $int) > $o).

tff(f65_def, axiom, ![V_zz:enum_aa, V_yy:$int, V_xx:bool, V_ww:bool, V_vv:
  bool, V_uu:bool, V_tt:$int, V_ss:$int, V_rr:$int, V_qq:$int, V_pp:$int,
  V_oo:enum_aa, V_nn:$int, V_mm:bool, V_ll:bool, V_kk:bool, V_jj:bool,
  V_bbxx:$int, V_bbww:$int, V_bbvv:$int, V_bbuu:$int, V_bbtt:$int, V_bbss:
  $int, V_bbrr:$int, V_bbqq:$int, V_bbpp:set($int), V_bboo:set($int), V_bbnn:
  set($int), V_bbmm:set($int), V_bbll:$int, V_bbkk:$int, V_bbjj:$int, V_bbii:
  $int, V_bbhh:$int, V_bbgg:$int, V_bbff:$int, V_bbee:$int, V_bbdd:$int,
  V_bbcc:$int, V_bbbb:$int, V_bbaa:$int]: (f65(V_zz, V_yy, V_xx, V_ww, V_vv,
  V_uu, V_tt, V_ss, V_rr, V_qq, V_pp, V_oo, V_nn, V_mm, V_ll, V_kk, V_jj,
  V_bbxx, V_bbww, V_bbvv, V_bbuu, V_bbtt, V_bbss, V_bbrr, V_bbqq, V_bbpp,
  V_bboo, V_bbnn, V_bbmm, V_bbll, V_bbkk, V_bbjj, V_bbii, V_bbhh, V_bbgg,
  V_bbff, V_bbee, V_bbdd, V_bbcc, V_bbbb, V_bbaa)
  <=> (((((((((((((((((((((((((((((((((((((((((((((((((((($true & ~
  (V_zz = e_bb)) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~
  $lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh))
  & (V_zz = e_gg)) & (V_uu = false)) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false)) & mem($int, $sum(V_yy,1), integer))
  & $lesseq(0,$sum(V_yy,1))) & $true) & ~ (((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_hh)) & (V_zz = e_ii)) & ~ ((((V_uu = false)
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = true)
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & ~ ((((V_uu = true)
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = false)
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false)))) & ~ (((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_hh)) & (V_zz = e_ii))
  & (V_uu = false)) & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & ~
  (((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_hh))
  & (V_zz = e_ii)) & (V_uu = true)) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ (((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~
  (V_zz = e_hh)) & (V_zz = e_ii)) & (V_uu = true)) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false))) & ~ ((((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_hh)) & (V_zz = e_ii)) & (V_uu = false))
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false)) & ~
  $lesseq($sum($difference(V_yy,V_bbee),1),$sum(V_bbff,V_bbgg)))) & ~
  (((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ii))
  & (V_zz = e_hh)) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false)))) & ~ (((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~
  (V_zz = e_ii)) & (V_zz = e_hh)) & (V_uu = false)) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false)) & (e_bb = e_gg))
  & (V_bbee = $sum(V_yy,1)))) & ~ (((((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ii)) & (V_zz = e_hh)) & (V_uu = true))
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false)) & (e_bb = e_gg))
  & (V_bbee = $sum(V_yy,1)))) & ~ (((((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ii)) & (V_zz = e_hh)) & (V_uu = true))
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false)) & (e_bb = e_gg))
  & (V_bbee = $sum(V_yy,1)))) & ~ ((((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ii)) & (V_zz = e_hh)) & (V_uu = false))
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false)) & (~
  $lesseq($sum($difference($difference($sum(V_yy,1),V_bbee),1),1),V_bbff)
  & (e_bb = e_ii)))) & ~ (((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & (V_zz = e_gg)) & ~ ((((V_uu = false) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = false) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false)))) & ~ ((((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & (V_zz = e_gg)) & (V_uu = false))
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false))
  & (($lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)
  & ((e_bb = e_gg) & (V_bbee = $sum(V_yy,1)))) | ~
  $lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)))) & ~
  ((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh))
  & (V_zz = e_gg)) & (V_uu = true)) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))
  & (($lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)
  & ((e_bb = e_gg) & (V_bbee = $sum(V_yy,1)))) | ~
  $lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)))) & ~
  ((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh))
  & (V_zz = e_gg)) & (V_uu = true)) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))
  & (($lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)
  & ((e_bb = e_gg) & (V_bbee = $sum(V_yy,1)))) | ~
  $lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)))) & ~
  ((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh))
  & (V_zz = e_gg)) & (V_uu = false)) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))
  & (($lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)
  & (e_bb = e_hh)) | ~
  $lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)))) & ~
  (((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh))
  & (V_zz = e_gg)) & (V_uu = false)) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))) & ~ (((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & (V_zz = e_gg)) & (V_uu = true)) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false))) & ~ (((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & (V_zz = e_gg)) & (V_uu = true))
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & ~ (((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & (V_zz = e_gg))
  & (V_uu = false)) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~
  (((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg))
  & (V_zz = e_ff)) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false)))) & ~ (((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~
  (V_zz = e_gg)) & (V_zz = e_ff)) & (V_uu = true)) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false))) & ~ (((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & ~ (V_zz = e_gg)) & (V_zz = e_ff)) & (V_uu = true))
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & ~ (((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & (V_zz = e_ff))
  & (V_uu = false)) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))
  & (e_bb = e_gg)) & (V_bbee = V_yy))) & ~ (((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ff)) & (V_zz = e_ee)) & ~ ((((V_uu = false)
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = true)
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & ~ ((((V_uu = true)
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = false)
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false)))) & ~ ((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff)) & (V_zz = e_ee))
  & (V_uu = false)) & (V_vv = true)) & (V_ww = false)) & (V_xx = false))
  & (($lesseq($sum($difference($difference($sum(V_bbcc,1),V_bbbb),1),1),V_bbii)
  & ((V_bbcc = $sum(V_yy,1)) & (e_bb = e_ee))) | (~
  $lesseq($sum($difference($difference($sum(V_bbcc,1),V_bbbb),1),1),V_bbii)
  & ((V_bbdd = $sum(V_yy,1)) & (e_bb = e_ff)))))) & ~ ((((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff)) & (V_zz = e_ee))
  & (V_uu = true)) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))
  & (e_bb = e_gg)) & (V_bbdd = V_bbcc)) & (V_bbee = $sum(V_yy,1)))) & ~
  ((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff))
  & (V_zz = e_ee)) & (V_uu = true)) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))
  & (($lesseq($sum($difference($difference($sum(V_bbcc,1),V_bbbb),1),1),V_bbii)
  & ((V_bbcc = $sum(V_yy,1)) & (e_bb = e_ee))) | ~
  $lesseq($sum($difference($difference($sum(V_bbcc,1),V_bbbb),1),1),V_bbii))))
  & ~ ((((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff))
  & (V_zz = e_ee)) & (V_uu = false)) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false)) & (e_bb = e_gg)) & (V_bbdd = V_bbcc)) & (V_bbee = V_yy)))
  & ~ (((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ee))
  & (V_zz = e_dd)) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false)))) & ~ (((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_ee)) & (V_zz = e_dd)) & (V_uu = false)) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false)) & (V_bbcc = $sum(V_yy,1)))
  & (e_bb = e_ee))) & ~ (((((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_ee)) & (V_zz = e_dd)) & (V_uu = true)) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false)) & (e_bb = e_gg)) & (V_bbcc = V_bbbb))
  & (V_bbdd = V_bbbb)) & (V_bbee = $sum(V_yy,1)))) & ~ (((((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ee)) & (V_zz = e_dd))
  & (V_uu = false)) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))
  & (e_bb = e_gg)) & (V_bbcc = V_bbbb)) & (V_bbdd = V_bbbb))
  & (V_bbee = V_yy))) & ~ ((((((((((~ (V_zz = e_ii) & ~ (V_zz = e_hh)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_dd))
  & (V_zz = e_cc)) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false)))) & ~ ((((((((((~ (V_zz = e_ii) & ~ (V_zz = e_hh)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_dd))
  & (V_zz = e_cc)) & (V_uu = false)) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))) & ~ ((((((((((~ (V_zz = e_ii) & ~ (V_zz = e_hh)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_dd))
  & (V_zz = e_cc)) & (V_uu = true)) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ (((((((((((~ (V_zz = e_ii) & ~ (V_zz = e_hh)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_dd))
  & (V_zz = e_cc)) & (V_uu = true)) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false)) & ($lesseq(V_bbjj,$difference($sum(V_yy,1),V_bbaa))
  & ((e_bb = e_dd) & (V_bbbb = $sum(V_yy,1)))))))).

tff(f66, type, f66: (enum_aa * $int * bool * bool * bool * bool * $int *
  $int * $int * $int * $int * enum_aa * $int * bool * bool * bool * bool *
  $int * $int * $int * $int * $int * $int * $int * $int * set($int) *
  set($int) * set($int) * set($int) * $int * $int * $int * $int * $int *
  $int * $int * $int * $int * $int * $int * $int) > $o).

tff(f66_def, axiom, ![V_zz:enum_aa, V_yy:$int, V_xx:bool, V_ww:bool, V_vv:
  bool, V_uu:bool, V_tt:$int, V_ss:$int, V_rr:$int, V_qq:$int, V_pp:$int,
  V_oo:enum_aa, V_nn:$int, V_mm:bool, V_ll:bool, V_kk:bool, V_jj:bool,
  V_bbxx:$int, V_bbww:$int, V_bbvv:$int, V_bbuu:$int, V_bbtt:$int, V_bbss:
  $int, V_bbrr:$int, V_bbqq:$int, V_bbpp:set($int), V_bboo:set($int), V_bbnn:
  set($int), V_bbmm:set($int), V_bbll:$int, V_bbkk:$int, V_bbjj:$int, V_bbii:
  $int, V_bbhh:$int, V_bbgg:$int, V_bbff:$int, V_bbee:$int, V_bbdd:$int,
  V_bbcc:$int, V_bbbb:$int, V_bbaa:$int]: (f66(V_zz, V_yy, V_xx, V_ww, V_vv,
  V_uu, V_tt, V_ss, V_rr, V_qq, V_pp, V_oo, V_nn, V_mm, V_ll, V_kk, V_jj,
  V_bbxx, V_bbww, V_bbvv, V_bbuu, V_bbtt, V_bbss, V_bbrr, V_bbqq, V_bbpp,
  V_bboo, V_bbnn, V_bbmm, V_bbll, V_bbkk, V_bbjj, V_bbii, V_bbhh, V_bbgg,
  V_bbff, V_bbee, V_bbdd, V_bbcc, V_bbbb, V_bbaa)
  <=> (((((((((((((((((((((((((((((((((((((((((((((((((((($true & ~
  (V_zz = e_bb)) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh))
  & $lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh))
  & (V_zz = e_gg)) & (V_uu = true)) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false)) & mem($int, $sum(V_yy,1), integer))
  & $lesseq(0,$sum(V_yy,1))) & $true) & ~ (((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_ii)) & (e_gg = V_zz))
  & ($sum(V_yy,1) = V_bbee))) & ~ (((((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_hh)) & (V_zz = e_ii))
  & ($sum(V_yy,1) = V_bbee)) & ~ ((((V_uu = false) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = false) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false))) & (e_gg = e_bb))) & ~ (((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_hh)) & (V_zz = e_ii))
  & ($sum(V_yy,1) = V_bbee)) & (V_uu = false)) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false)) & (e_gg = e_bb))) & ~ (((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_hh)) & (V_zz = e_ii))
  & ($sum(V_yy,1) = V_bbee)) & (V_uu = true)) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false)) & (e_gg = e_bb))) & ~ (((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_hh)) & (V_zz = e_ii))
  & ($sum(V_yy,1) = V_bbee)) & (V_uu = true)) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false)) & (e_gg = e_bb))) & ~ (((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_hh)) & (V_zz = e_ii))
  & ($sum(V_yy,1) = V_bbee)) & (V_uu = false)) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false))
  & (($lesseq($sum($difference(V_yy,V_bbee),1),$sum(V_bbff,V_bbgg))
  & (e_gg = V_zz)) | (~
  $lesseq($sum($difference(V_yy,V_bbee),1),$sum(V_bbff,V_bbgg))
  & (e_gg = e_bb))))) & ~ (((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~
  (V_zz = e_ii)) & (V_zz = e_hh)) & ~ ((((V_uu = false) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = false) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false))) & (e_gg = e_bb))
  & ($sum(V_yy,1) = V_bbee))) & ~ (((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ii)) & (V_zz = e_hh)) & (V_uu = false))
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & ~ (((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ii)) & (V_zz = e_hh))
  & (V_uu = true)) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~
  (((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ii))
  & (V_zz = e_hh)) & (V_uu = true)) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))) & ~ (((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~
  (V_zz = e_ii)) & (V_zz = e_hh)) & (V_uu = false)) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false))
  & (($lesseq($sum($difference($difference($sum(V_yy,1),V_bbee),1),1),V_bbff)
  & (e_gg = V_zz)) | (~
  $lesseq($sum($difference($difference($sum(V_yy,1),V_bbee),1),1),V_bbff)
  & (e_gg = e_ii)))) & ($sum(V_yy,1) = V_bbee))) & ~ (((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & (V_zz = e_gg)) & ~
  ((((V_uu = false) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~
  ((((V_uu = true) & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & ~
  ((((V_uu = true) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~
  ((((V_uu = false) & (V_vv = true)) & (V_ww = false)) & (V_xx = false)))
  & (e_gg = e_bb)) & ($sum(V_yy,1) = V_bbee))) & ~ ((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & (V_zz = e_gg))
  & (V_uu = false)) & (V_vv = true)) & (V_ww = false)) & (V_xx = false))
  & ($lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh) | ((~
  $lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)
  & (e_gg = e_bb)) & ($sum(V_yy,1) = V_bbee))))) & ~ ((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & (V_zz = e_gg))
  & (V_uu = true)) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))
  & ($lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh) | ((~
  $lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)
  & (e_gg = e_bb)) & ($sum(V_yy,1) = V_bbee))))) & ~ ((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & (V_zz = e_gg))
  & (V_uu = true)) & (V_vv = true)) & (V_ww = false)) & (V_xx = false))
  & ($lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh) | ((~
  $lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)
  & (e_gg = e_bb)) & ($sum(V_yy,1) = V_bbee))))) & ~ (((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & (V_zz = e_gg))
  & (V_uu = false)) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))
  & (($lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)
  & (e_gg = e_hh)) | (~
  $lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)
  & (e_gg = e_bb)))) & ($sum(V_yy,1) = V_bbee))) & ~ (((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & (V_zz = e_gg))
  & (e_gg = e_bb)) & ($sum(V_yy,1) = V_bbee)) & ~ ((((V_uu = false)
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = true)
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & ~ ((((V_uu = true)
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = false)
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false)))) & ~ (((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & (V_zz = e_gg))
  & (e_gg = e_bb)) & ($sum(V_yy,1) = V_bbee)) & (V_uu = false))
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & ~ (((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & (V_zz = e_gg))
  & (e_gg = e_bb)) & ($sum(V_yy,1) = V_bbee)) & (V_uu = true))
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~ (((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & (V_zz = e_gg))
  & (e_gg = e_bb)) & ($sum(V_yy,1) = V_bbee)) & (V_uu = true))
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & ~ (((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & (V_zz = e_gg))
  & (e_gg = e_bb)) & ($sum(V_yy,1) = V_bbee)) & (V_uu = false))
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~ (((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & (V_zz = e_ff)) & ~
  ((((V_uu = false) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~
  ((((V_uu = true) & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & ~
  ((((V_uu = true) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~
  ((((V_uu = false) & (V_vv = true)) & (V_ww = false)) & (V_xx = false)))
  & (e_gg = e_bb)) & ($sum(V_yy,1) = V_bbee))) & ~ ((((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & (V_zz = e_ff))
  & (V_uu = false)) & (V_vv = true)) & (V_ww = false)) & (V_xx = false))
  & (V_bbdd = $sum(V_yy,1))) & (e_gg = V_zz)) & ($sum(V_yy,1) = V_bbee))) & ~
  (((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg))
  & (V_zz = e_ff)) & (V_uu = true)) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false)) & (e_gg = e_bb)) & ($sum(V_yy,1) = V_bbee))) & ~
  (((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg))
  & (V_zz = e_ff)) & (V_uu = true)) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false)) & (e_gg = e_bb)) & ($sum(V_yy,1) = V_bbee))) & ~
  (((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff))
  & (V_zz = e_ee)) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))) & (e_gg = e_bb)) & ($sum(V_yy,1) = V_bbee))) & ~
  (((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff))
  & (V_zz = e_ee)) & (V_uu = false)) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))
  & (($lesseq($sum($difference($difference($sum(V_bbcc,1),V_bbbb),1),1),V_bbii)
  & ((V_bbcc = $sum(V_yy,1)) & (e_gg = e_ee))) | (~
  $lesseq($sum($difference($difference($sum(V_bbcc,1),V_bbbb),1),1),V_bbii)
  & ((V_bbdd = $sum(V_yy,1)) & (e_gg = e_ff))))) & ($sum(V_yy,1) = V_bbee)))
  & ~ ((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff))
  & (V_zz = e_ee)) & (V_uu = true)) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false)) & (V_bbdd = V_bbcc))) & ~ (((((((((((((~ (V_zz = e_bb)
  & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh))
  & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff)) & (V_zz = e_ee)) & (V_uu = true))
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false))
  & (($lesseq($sum($difference($difference($sum(V_bbcc,1),V_bbbb),1),1),V_bbii)
  & ((V_bbcc = $sum(V_yy,1)) & (e_gg = e_ee))) | (~
  $lesseq($sum($difference($difference($sum(V_bbcc,1),V_bbbb),1),1),V_bbii)
  & (e_gg = e_bb)))) & ($sum(V_yy,1) = V_bbee))) & ~ (((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ee)) & (V_zz = e_dd)) & ~
  ((((V_uu = false) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~
  ((((V_uu = true) & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & ~
  ((((V_uu = true) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~
  ((((V_uu = false) & (V_vv = true)) & (V_ww = false)) & (V_xx = false)))
  & (e_gg = e_bb)) & ($sum(V_yy,1) = V_bbee))) & ~ ((((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ee)) & (V_zz = e_dd))
  & (V_uu = false)) & (V_vv = true)) & (V_ww = false)) & (V_xx = false))
  & (V_bbcc = $sum(V_yy,1))) & (e_gg = e_ee)) & ($sum(V_yy,1) = V_bbee))) & ~
  (((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ee))
  & (V_zz = e_dd)) & (V_uu = true)) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false)) & (V_bbcc = V_bbbb)) & (V_bbdd = V_bbbb))) & ~
  ((((((((((((~ (V_zz = e_ii) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_dd)) & (V_zz = e_cc))
  & ($sum(V_yy,1) = V_bbee)) & ~ ((((V_uu = false) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = false) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false))) & (e_gg = e_bb))) & ~ ((((((((((((~
  (V_zz = e_ii) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_dd)) & (V_zz = e_cc))
  & ($sum(V_yy,1) = V_bbee)) & (V_uu = false)) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false)) & (e_gg = e_bb))) & ~ ((((((((((((~
  (V_zz = e_ii) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_dd)) & (V_zz = e_cc))
  & ($sum(V_yy,1) = V_bbee)) & (V_uu = true)) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false)) & (e_gg = e_bb))) & ~ ((((((((((((~
  (V_zz = e_ii) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_dd)) & (V_zz = e_cc))
  & ($sum(V_yy,1) = V_bbee)) & (V_uu = true)) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false))
  & (($lesseq(V_bbjj,$difference($sum(V_yy,1),V_bbaa)) & ((e_gg = e_dd)
  & (V_bbbb = $sum(V_yy,1)))) | (~
  $lesseq(V_bbjj,$difference($sum(V_yy,1),V_bbaa)) & (e_gg = V_zz))))))).

tff(f67, type, f67: (enum_aa * $int * bool * bool * bool * bool * $int *
  $int * $int * $int * $int * enum_aa * $int * bool * bool * bool * bool *
  $int * $int * $int * $int * $int * $int * $int * $int * set($int) *
  set($int) * set($int) * set($int) * $int * $int * $int * $int * $int *
  $int * $int * $int * $int * $int * $int * $int) > $o).

tff(f67_def, axiom, ![V_zz:enum_aa, V_yy:$int, V_xx:bool, V_ww:bool, V_vv:
  bool, V_uu:bool, V_tt:$int, V_ss:$int, V_rr:$int, V_qq:$int, V_pp:$int,
  V_oo:enum_aa, V_nn:$int, V_mm:bool, V_ll:bool, V_kk:bool, V_jj:bool,
  V_bbxx:$int, V_bbww:$int, V_bbvv:$int, V_bbuu:$int, V_bbtt:$int, V_bbss:
  $int, V_bbrr:$int, V_bbqq:$int, V_bbpp:set($int), V_bboo:set($int), V_bbnn:
  set($int), V_bbmm:set($int), V_bbll:$int, V_bbkk:$int, V_bbjj:$int, V_bbii:
  $int, V_bbhh:$int, V_bbgg:$int, V_bbff:$int, V_bbee:$int, V_bbdd:$int,
  V_bbcc:$int, V_bbbb:$int, V_bbaa:$int]: (f67(V_zz, V_yy, V_xx, V_ww, V_vv,
  V_uu, V_tt, V_ss, V_rr, V_qq, V_pp, V_oo, V_nn, V_mm, V_ll, V_kk, V_jj,
  V_bbxx, V_bbww, V_bbvv, V_bbuu, V_bbtt, V_bbss, V_bbrr, V_bbqq, V_bbpp,
  V_bboo, V_bbnn, V_bbmm, V_bbll, V_bbkk, V_bbjj, V_bbii, V_bbhh, V_bbgg,
  V_bbff, V_bbee, V_bbdd, V_bbcc, V_bbbb, V_bbaa)
  <=> (((((((((((((((((((((((((((((((((((((((((((((((((((($true & ~
  (V_zz = e_bb)) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~
  $lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh))
  & (V_zz = e_gg)) & (V_uu = true)) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false)) & mem($int, $sum(V_yy,1), integer))
  & $lesseq(0,$sum(V_yy,1))) & $true) & ~ (((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_hh)) & (V_zz = e_ii)) & ~ ((((V_uu = false)
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = true)
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & ~ ((((V_uu = true)
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = false)
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false)))) & ~ (((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_hh)) & (V_zz = e_ii))
  & (V_uu = false)) & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & ~
  (((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_hh))
  & (V_zz = e_ii)) & (V_uu = true)) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ (((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~
  (V_zz = e_hh)) & (V_zz = e_ii)) & (V_uu = true)) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false))) & ~ ((((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_hh)) & (V_zz = e_ii)) & (V_uu = false))
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false)) & ~
  $lesseq($sum($difference(V_yy,V_bbee),1),$sum(V_bbff,V_bbgg)))) & ~
  (((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ii))
  & (V_zz = e_hh)) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false)))) & ~ (((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~
  (V_zz = e_ii)) & (V_zz = e_hh)) & (V_uu = false)) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false)) & (e_bb = e_gg))
  & (V_bbee = $sum(V_yy,1)))) & ~ (((((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ii)) & (V_zz = e_hh)) & (V_uu = true))
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false)) & (e_bb = e_gg))
  & (V_bbee = $sum(V_yy,1)))) & ~ (((((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ii)) & (V_zz = e_hh)) & (V_uu = true))
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false)) & (e_bb = e_gg))
  & (V_bbee = $sum(V_yy,1)))) & ~ ((((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ii)) & (V_zz = e_hh)) & (V_uu = false))
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false)) & (~
  $lesseq($sum($difference($difference($sum(V_yy,1),V_bbee),1),1),V_bbff)
  & (e_bb = e_ii)))) & ~ (((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & (V_zz = e_gg)) & ~ ((((V_uu = false) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = false) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false)))) & ~ ((((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & (V_zz = e_gg)) & (V_uu = false))
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false))
  & (($lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)
  & ((e_bb = e_gg) & (V_bbee = $sum(V_yy,1)))) | ~
  $lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)))) & ~
  ((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh))
  & (V_zz = e_gg)) & (V_uu = true)) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))
  & (($lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)
  & ((e_bb = e_gg) & (V_bbee = $sum(V_yy,1)))) | ~
  $lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)))) & ~
  ((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh))
  & (V_zz = e_gg)) & (V_uu = true)) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))
  & (($lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)
  & ((e_bb = e_gg) & (V_bbee = $sum(V_yy,1)))) | ~
  $lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)))) & ~
  ((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh))
  & (V_zz = e_gg)) & (V_uu = false)) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))
  & (($lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)
  & (e_bb = e_hh)) | ~
  $lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)))) & ~
  (((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh))
  & (V_zz = e_gg)) & (V_uu = false)) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))) & ~ (((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & (V_zz = e_gg)) & (V_uu = true)) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false))) & ~ (((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & (V_zz = e_gg)) & (V_uu = true))
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & ~ (((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & (V_zz = e_gg))
  & (V_uu = false)) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~
  (((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg))
  & (V_zz = e_ff)) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false)))) & ~ (((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~
  (V_zz = e_gg)) & (V_zz = e_ff)) & (V_uu = true)) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false))) & ~ (((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & ~ (V_zz = e_gg)) & (V_zz = e_ff)) & (V_uu = true))
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & ~ (((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & (V_zz = e_ff))
  & (V_uu = false)) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))
  & (e_bb = e_gg)) & (V_bbee = V_yy))) & ~ (((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ff)) & (V_zz = e_ee)) & ~ ((((V_uu = false)
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = true)
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & ~ ((((V_uu = true)
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = false)
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false)))) & ~ ((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff)) & (V_zz = e_ee))
  & (V_uu = false)) & (V_vv = true)) & (V_ww = false)) & (V_xx = false))
  & (($lesseq($sum($difference($difference($sum(V_bbcc,1),V_bbbb),1),1),V_bbii)
  & ((V_bbcc = $sum(V_yy,1)) & (e_bb = e_ee))) | (~
  $lesseq($sum($difference($difference($sum(V_bbcc,1),V_bbbb),1),1),V_bbii)
  & ((V_bbdd = $sum(V_yy,1)) & (e_bb = e_ff)))))) & ~ ((((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff)) & (V_zz = e_ee))
  & (V_uu = true)) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))
  & (e_bb = e_gg)) & (V_bbdd = V_bbcc)) & (V_bbee = $sum(V_yy,1)))) & ~
  ((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff))
  & (V_zz = e_ee)) & (V_uu = true)) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))
  & (($lesseq($sum($difference($difference($sum(V_bbcc,1),V_bbbb),1),1),V_bbii)
  & ((V_bbcc = $sum(V_yy,1)) & (e_bb = e_ee))) | ~
  $lesseq($sum($difference($difference($sum(V_bbcc,1),V_bbbb),1),1),V_bbii))))
  & ~ ((((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff))
  & (V_zz = e_ee)) & (V_uu = false)) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false)) & (e_bb = e_gg)) & (V_bbdd = V_bbcc)) & (V_bbee = V_yy)))
  & ~ (((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ee))
  & (V_zz = e_dd)) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false)))) & ~ (((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_ee)) & (V_zz = e_dd)) & (V_uu = false)) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false)) & (V_bbcc = $sum(V_yy,1)))
  & (e_bb = e_ee))) & ~ (((((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_ee)) & (V_zz = e_dd)) & (V_uu = true)) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false)) & (e_bb = e_gg)) & (V_bbcc = V_bbbb))
  & (V_bbdd = V_bbbb)) & (V_bbee = $sum(V_yy,1)))) & ~ (((((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ee)) & (V_zz = e_dd))
  & (V_uu = false)) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))
  & (e_bb = e_gg)) & (V_bbcc = V_bbbb)) & (V_bbdd = V_bbbb))
  & (V_bbee = V_yy))) & ~ ((((((((((~ (V_zz = e_ii) & ~ (V_zz = e_hh)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_dd))
  & (V_zz = e_cc)) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false)))) & ~ ((((((((((~ (V_zz = e_ii) & ~ (V_zz = e_hh)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_dd))
  & (V_zz = e_cc)) & (V_uu = false)) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))) & ~ ((((((((((~ (V_zz = e_ii) & ~ (V_zz = e_hh)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_dd))
  & (V_zz = e_cc)) & (V_uu = true)) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ (((((((((((~ (V_zz = e_ii) & ~ (V_zz = e_hh)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_dd))
  & (V_zz = e_cc)) & (V_uu = true)) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false)) & ($lesseq(V_bbjj,$difference($sum(V_yy,1),V_bbaa))
  & ((e_bb = e_dd) & (V_bbbb = $sum(V_yy,1)))))))).

tff(f68, type, f68: (enum_aa * $int * bool * bool * bool * bool * $int *
  $int * $int * $int * $int * enum_aa * $int * bool * bool * bool * bool *
  $int * $int * $int * $int * $int * $int * $int * $int * set($int) *
  set($int) * set($int) * set($int) * $int * $int * $int * $int * $int *
  $int * $int * $int * $int * $int * $int * $int) > $o).

tff(f68_def, axiom, ![V_zz:enum_aa, V_yy:$int, V_xx:bool, V_ww:bool, V_vv:
  bool, V_uu:bool, V_tt:$int, V_ss:$int, V_rr:$int, V_qq:$int, V_pp:$int,
  V_oo:enum_aa, V_nn:$int, V_mm:bool, V_ll:bool, V_kk:bool, V_jj:bool,
  V_bbxx:$int, V_bbww:$int, V_bbvv:$int, V_bbuu:$int, V_bbtt:$int, V_bbss:
  $int, V_bbrr:$int, V_bbqq:$int, V_bbpp:set($int), V_bboo:set($int), V_bbnn:
  set($int), V_bbmm:set($int), V_bbll:$int, V_bbkk:$int, V_bbjj:$int, V_bbii:
  $int, V_bbhh:$int, V_bbgg:$int, V_bbff:$int, V_bbee:$int, V_bbdd:$int,
  V_bbcc:$int, V_bbbb:$int, V_bbaa:$int]: (f68(V_zz, V_yy, V_xx, V_ww, V_vv,
  V_uu, V_tt, V_ss, V_rr, V_qq, V_pp, V_oo, V_nn, V_mm, V_ll, V_kk, V_jj,
  V_bbxx, V_bbww, V_bbvv, V_bbuu, V_bbtt, V_bbss, V_bbrr, V_bbqq, V_bbpp,
  V_bboo, V_bbnn, V_bbmm, V_bbll, V_bbkk, V_bbjj, V_bbii, V_bbhh, V_bbgg,
  V_bbff, V_bbee, V_bbdd, V_bbcc, V_bbbb, V_bbaa)
  <=> (((((((((((((((((((((((((((((((((((((((((((((((((((($true & ~
  (V_zz = e_bb)) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh))
  & $lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh))
  & (V_zz = e_gg)) & (V_uu = true)) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false)) & mem($int, $sum(V_yy,1), integer))
  & $lesseq(0,$sum(V_yy,1))) & $true) & ~ (((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_ii)) & (e_gg = V_zz))
  & ($sum(V_yy,1) = V_bbee))) & ~ (((((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_hh)) & (V_zz = e_ii))
  & ($sum(V_yy,1) = V_bbee)) & ~ ((((V_uu = false) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = false) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false))) & (e_gg = e_bb))) & ~ (((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_hh)) & (V_zz = e_ii))
  & ($sum(V_yy,1) = V_bbee)) & (V_uu = false)) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false)) & (e_gg = e_bb))) & ~ (((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_hh)) & (V_zz = e_ii))
  & ($sum(V_yy,1) = V_bbee)) & (V_uu = true)) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false)) & (e_gg = e_bb))) & ~ (((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_hh)) & (V_zz = e_ii))
  & ($sum(V_yy,1) = V_bbee)) & (V_uu = true)) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false)) & (e_gg = e_bb))) & ~ (((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_hh)) & (V_zz = e_ii))
  & ($sum(V_yy,1) = V_bbee)) & (V_uu = false)) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false))
  & (($lesseq($sum($difference(V_yy,V_bbee),1),$sum(V_bbff,V_bbgg))
  & (e_gg = V_zz)) | (~
  $lesseq($sum($difference(V_yy,V_bbee),1),$sum(V_bbff,V_bbgg))
  & (e_gg = e_bb))))) & ~ (((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~
  (V_zz = e_ii)) & (V_zz = e_hh)) & ~ ((((V_uu = false) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = false) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false))) & (e_gg = e_bb))
  & ($sum(V_yy,1) = V_bbee))) & ~ (((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ii)) & (V_zz = e_hh)) & (V_uu = false))
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & ~ (((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ii)) & (V_zz = e_hh))
  & (V_uu = true)) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~
  (((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ii))
  & (V_zz = e_hh)) & (V_uu = true)) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))) & ~ (((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~
  (V_zz = e_ii)) & (V_zz = e_hh)) & (V_uu = false)) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false))
  & (($lesseq($sum($difference($difference($sum(V_yy,1),V_bbee),1),1),V_bbff)
  & (e_gg = V_zz)) | (~
  $lesseq($sum($difference($difference($sum(V_yy,1),V_bbee),1),1),V_bbff)
  & (e_gg = e_ii)))) & ($sum(V_yy,1) = V_bbee))) & ~ (((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & (V_zz = e_gg)) & ~
  ((((V_uu = false) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~
  ((((V_uu = true) & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & ~
  ((((V_uu = true) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~
  ((((V_uu = false) & (V_vv = true)) & (V_ww = false)) & (V_xx = false)))
  & (e_gg = e_bb)) & ($sum(V_yy,1) = V_bbee))) & ~ ((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & (V_zz = e_gg))
  & (V_uu = false)) & (V_vv = true)) & (V_ww = false)) & (V_xx = false))
  & ($lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh) | ((~
  $lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)
  & (e_gg = e_bb)) & ($sum(V_yy,1) = V_bbee))))) & ~ ((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & (V_zz = e_gg))
  & (V_uu = true)) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))
  & ($lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh) | ((~
  $lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)
  & (e_gg = e_bb)) & ($sum(V_yy,1) = V_bbee))))) & ~ ((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & (V_zz = e_gg))
  & (V_uu = true)) & (V_vv = true)) & (V_ww = false)) & (V_xx = false))
  & ($lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh) | ((~
  $lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)
  & (e_gg = e_bb)) & ($sum(V_yy,1) = V_bbee))))) & ~ (((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & (V_zz = e_gg))
  & (V_uu = false)) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))
  & (($lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)
  & (e_gg = e_hh)) | (~
  $lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)
  & (e_gg = e_bb)))) & ($sum(V_yy,1) = V_bbee))) & ~ (((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & (V_zz = e_gg))
  & (e_gg = e_bb)) & ($sum(V_yy,1) = V_bbee)) & ~ ((((V_uu = false)
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = true)
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & ~ ((((V_uu = true)
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = false)
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false)))) & ~ (((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & (V_zz = e_gg))
  & (e_gg = e_bb)) & ($sum(V_yy,1) = V_bbee)) & (V_uu = false))
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & ~ (((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & (V_zz = e_gg))
  & (e_gg = e_bb)) & ($sum(V_yy,1) = V_bbee)) & (V_uu = true))
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~ (((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & (V_zz = e_gg))
  & (e_gg = e_bb)) & ($sum(V_yy,1) = V_bbee)) & (V_uu = true))
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & ~ (((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & (V_zz = e_gg))
  & (e_gg = e_bb)) & ($sum(V_yy,1) = V_bbee)) & (V_uu = false))
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~ (((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & (V_zz = e_ff)) & ~
  ((((V_uu = false) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~
  ((((V_uu = true) & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & ~
  ((((V_uu = true) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~
  ((((V_uu = false) & (V_vv = true)) & (V_ww = false)) & (V_xx = false)))
  & (e_gg = e_bb)) & ($sum(V_yy,1) = V_bbee))) & ~ ((((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & (V_zz = e_ff))
  & (V_uu = false)) & (V_vv = true)) & (V_ww = false)) & (V_xx = false))
  & (V_bbdd = $sum(V_yy,1))) & (e_gg = V_zz)) & ($sum(V_yy,1) = V_bbee))) & ~
  (((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg))
  & (V_zz = e_ff)) & (V_uu = true)) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false)) & (e_gg = e_bb)) & ($sum(V_yy,1) = V_bbee))) & ~
  (((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg))
  & (V_zz = e_ff)) & (V_uu = true)) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false)) & (e_gg = e_bb)) & ($sum(V_yy,1) = V_bbee))) & ~
  (((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff))
  & (V_zz = e_ee)) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))) & (e_gg = e_bb)) & ($sum(V_yy,1) = V_bbee))) & ~
  (((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff))
  & (V_zz = e_ee)) & (V_uu = false)) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))
  & (($lesseq($sum($difference($difference($sum(V_bbcc,1),V_bbbb),1),1),V_bbii)
  & ((V_bbcc = $sum(V_yy,1)) & (e_gg = e_ee))) | (~
  $lesseq($sum($difference($difference($sum(V_bbcc,1),V_bbbb),1),1),V_bbii)
  & ((V_bbdd = $sum(V_yy,1)) & (e_gg = e_ff))))) & ($sum(V_yy,1) = V_bbee)))
  & ~ ((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff))
  & (V_zz = e_ee)) & (V_uu = true)) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false)) & (V_bbdd = V_bbcc))) & ~ (((((((((((((~ (V_zz = e_bb)
  & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh))
  & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff)) & (V_zz = e_ee)) & (V_uu = true))
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false))
  & (($lesseq($sum($difference($difference($sum(V_bbcc,1),V_bbbb),1),1),V_bbii)
  & ((V_bbcc = $sum(V_yy,1)) & (e_gg = e_ee))) | (~
  $lesseq($sum($difference($difference($sum(V_bbcc,1),V_bbbb),1),1),V_bbii)
  & (e_gg = e_bb)))) & ($sum(V_yy,1) = V_bbee))) & ~ (((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ee)) & (V_zz = e_dd)) & ~
  ((((V_uu = false) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~
  ((((V_uu = true) & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & ~
  ((((V_uu = true) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~
  ((((V_uu = false) & (V_vv = true)) & (V_ww = false)) & (V_xx = false)))
  & (e_gg = e_bb)) & ($sum(V_yy,1) = V_bbee))) & ~ ((((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ee)) & (V_zz = e_dd))
  & (V_uu = false)) & (V_vv = true)) & (V_ww = false)) & (V_xx = false))
  & (V_bbcc = $sum(V_yy,1))) & (e_gg = e_ee)) & ($sum(V_yy,1) = V_bbee))) & ~
  (((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ee))
  & (V_zz = e_dd)) & (V_uu = true)) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false)) & (V_bbcc = V_bbbb)) & (V_bbdd = V_bbbb))) & ~
  ((((((((((((~ (V_zz = e_ii) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_dd)) & (V_zz = e_cc))
  & ($sum(V_yy,1) = V_bbee)) & ~ ((((V_uu = false) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = false) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false))) & (e_gg = e_bb))) & ~ ((((((((((((~
  (V_zz = e_ii) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_dd)) & (V_zz = e_cc))
  & ($sum(V_yy,1) = V_bbee)) & (V_uu = false)) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false)) & (e_gg = e_bb))) & ~ ((((((((((((~
  (V_zz = e_ii) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_dd)) & (V_zz = e_cc))
  & ($sum(V_yy,1) = V_bbee)) & (V_uu = true)) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false)) & (e_gg = e_bb))) & ~ ((((((((((((~
  (V_zz = e_ii) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_dd)) & (V_zz = e_cc))
  & ($sum(V_yy,1) = V_bbee)) & (V_uu = true)) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false))
  & (($lesseq(V_bbjj,$difference($sum(V_yy,1),V_bbaa)) & ((e_gg = e_dd)
  & (V_bbbb = $sum(V_yy,1)))) | (~
  $lesseq(V_bbjj,$difference($sum(V_yy,1),V_bbaa)) & (e_gg = V_zz))))))).

tff(f69, type, f69: (enum_aa * $int * bool * bool * bool * bool * $int *
  $int * $int * $int * $int * enum_aa * $int * bool * bool * bool * bool *
  $int * $int * $int * $int * $int * $int * $int * $int * set($int) *
  set($int) * set($int) * set($int) * $int * $int * $int * $int * $int *
  $int * $int * $int * $int * $int * $int * $int) > $o).

tff(f69_def, axiom, ![V_zz:enum_aa, V_yy:$int, V_xx:bool, V_ww:bool, V_vv:
  bool, V_uu:bool, V_tt:$int, V_ss:$int, V_rr:$int, V_qq:$int, V_pp:$int,
  V_oo:enum_aa, V_nn:$int, V_mm:bool, V_ll:bool, V_kk:bool, V_jj:bool,
  V_bbxx:$int, V_bbww:$int, V_bbvv:$int, V_bbuu:$int, V_bbtt:$int, V_bbss:
  $int, V_bbrr:$int, V_bbqq:$int, V_bbpp:set($int), V_bboo:set($int), V_bbnn:
  set($int), V_bbmm:set($int), V_bbll:$int, V_bbkk:$int, V_bbjj:$int, V_bbii:
  $int, V_bbhh:$int, V_bbgg:$int, V_bbff:$int, V_bbee:$int, V_bbdd:$int,
  V_bbcc:$int, V_bbbb:$int, V_bbaa:$int]: (f69(V_zz, V_yy, V_xx, V_ww, V_vv,
  V_uu, V_tt, V_ss, V_rr, V_qq, V_pp, V_oo, V_nn, V_mm, V_ll, V_kk, V_jj,
  V_bbxx, V_bbww, V_bbvv, V_bbuu, V_bbtt, V_bbss, V_bbrr, V_bbqq, V_bbpp,
  V_bboo, V_bbnn, V_bbmm, V_bbll, V_bbkk, V_bbjj, V_bbii, V_bbhh, V_bbgg,
  V_bbff, V_bbee, V_bbdd, V_bbcc, V_bbbb, V_bbaa)
  <=> (((((((((((((((((((((((((((((((((((((((((((((((((((($true & ~
  (V_zz = e_bb)) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~
  $lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh))
  & (V_zz = e_gg)) & (V_uu = true)) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false)) & mem($int, $sum(V_yy,1), integer))
  & $lesseq(0,$sum(V_yy,1))) & $true) & ~ (((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_hh)) & (V_zz = e_ii)) & ~ ((((V_uu = false)
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = true)
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & ~ ((((V_uu = true)
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = false)
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false)))) & ~ (((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_hh)) & (V_zz = e_ii))
  & (V_uu = false)) & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & ~
  (((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_hh))
  & (V_zz = e_ii)) & (V_uu = true)) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ (((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~
  (V_zz = e_hh)) & (V_zz = e_ii)) & (V_uu = true)) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false))) & ~ ((((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_hh)) & (V_zz = e_ii)) & (V_uu = false))
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false)) & ~
  $lesseq($sum($difference(V_yy,V_bbee),1),$sum(V_bbff,V_bbgg)))) & ~
  (((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ii))
  & (V_zz = e_hh)) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false)))) & ~ (((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~
  (V_zz = e_ii)) & (V_zz = e_hh)) & (V_uu = false)) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false)) & (e_bb = e_gg))
  & (V_bbee = $sum(V_yy,1)))) & ~ (((((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ii)) & (V_zz = e_hh)) & (V_uu = true))
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false)) & (e_bb = e_gg))
  & (V_bbee = $sum(V_yy,1)))) & ~ (((((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ii)) & (V_zz = e_hh)) & (V_uu = true))
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false)) & (e_bb = e_gg))
  & (V_bbee = $sum(V_yy,1)))) & ~ ((((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ii)) & (V_zz = e_hh)) & (V_uu = false))
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false)) & (~
  $lesseq($sum($difference($difference($sum(V_yy,1),V_bbee),1),1),V_bbff)
  & (e_bb = e_ii)))) & ~ (((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & (V_zz = e_gg)) & ~ ((((V_uu = false) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = false) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false)))) & ~ ((((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & (V_zz = e_gg)) & (V_uu = false))
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false))
  & (($lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)
  & ((e_bb = e_gg) & (V_bbee = $sum(V_yy,1)))) | ~
  $lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)))) & ~
  ((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh))
  & (V_zz = e_gg)) & (V_uu = true)) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))
  & (($lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)
  & ((e_bb = e_gg) & (V_bbee = $sum(V_yy,1)))) | ~
  $lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)))) & ~
  ((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh))
  & (V_zz = e_gg)) & (V_uu = true)) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))
  & (($lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)
  & ((e_bb = e_gg) & (V_bbee = $sum(V_yy,1)))) | ~
  $lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)))) & ~
  ((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh))
  & (V_zz = e_gg)) & (V_uu = false)) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))
  & (($lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)
  & (e_bb = e_hh)) | ~
  $lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)))) & ~
  (((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh))
  & (V_zz = e_gg)) & (V_uu = false)) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))) & ~ (((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & (V_zz = e_gg)) & (V_uu = true)) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false))) & ~ (((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & (V_zz = e_gg)) & (V_uu = true))
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & ~ (((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & (V_zz = e_gg))
  & (V_uu = false)) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~
  (((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg))
  & (V_zz = e_ff)) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false)))) & ~ (((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~
  (V_zz = e_gg)) & (V_zz = e_ff)) & (V_uu = true)) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false))) & ~ (((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & ~ (V_zz = e_gg)) & (V_zz = e_ff)) & (V_uu = true))
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & ~ (((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & (V_zz = e_ff))
  & (V_uu = false)) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))
  & (e_bb = e_gg)) & (V_bbee = V_yy))) & ~ (((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ff)) & (V_zz = e_ee)) & ~ ((((V_uu = false)
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = true)
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & ~ ((((V_uu = true)
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = false)
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false)))) & ~ ((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff)) & (V_zz = e_ee))
  & (V_uu = false)) & (V_vv = true)) & (V_ww = false)) & (V_xx = false))
  & (($lesseq($sum($difference($difference($sum(V_bbcc,1),V_bbbb),1),1),V_bbii)
  & ((V_bbcc = $sum(V_yy,1)) & (e_bb = e_ee))) | (~
  $lesseq($sum($difference($difference($sum(V_bbcc,1),V_bbbb),1),1),V_bbii)
  & ((V_bbdd = $sum(V_yy,1)) & (e_bb = e_ff)))))) & ~ ((((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff)) & (V_zz = e_ee))
  & (V_uu = true)) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))
  & (e_bb = e_gg)) & (V_bbdd = V_bbcc)) & (V_bbee = $sum(V_yy,1)))) & ~
  ((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff))
  & (V_zz = e_ee)) & (V_uu = true)) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))
  & (($lesseq($sum($difference($difference($sum(V_bbcc,1),V_bbbb),1),1),V_bbii)
  & ((V_bbcc = $sum(V_yy,1)) & (e_bb = e_ee))) | ~
  $lesseq($sum($difference($difference($sum(V_bbcc,1),V_bbbb),1),1),V_bbii))))
  & ~ ((((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff))
  & (V_zz = e_ee)) & (V_uu = false)) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false)) & (e_bb = e_gg)) & (V_bbdd = V_bbcc)) & (V_bbee = V_yy)))
  & ~ (((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ee))
  & (V_zz = e_dd)) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false)))) & ~ (((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_ee)) & (V_zz = e_dd)) & (V_uu = false)) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false)) & (V_bbcc = $sum(V_yy,1)))
  & (e_bb = e_ee))) & ~ (((((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_ee)) & (V_zz = e_dd)) & (V_uu = true)) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false)) & (e_bb = e_gg)) & (V_bbcc = V_bbbb))
  & (V_bbdd = V_bbbb)) & (V_bbee = $sum(V_yy,1)))) & ~ (((((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ee)) & (V_zz = e_dd))
  & (V_uu = false)) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))
  & (e_bb = e_gg)) & (V_bbcc = V_bbbb)) & (V_bbdd = V_bbbb))
  & (V_bbee = V_yy))) & ~ ((((((((((~ (V_zz = e_ii) & ~ (V_zz = e_hh)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_dd))
  & (V_zz = e_cc)) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false)))) & ~ ((((((((((~ (V_zz = e_ii) & ~ (V_zz = e_hh)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_dd))
  & (V_zz = e_cc)) & (V_uu = false)) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))) & ~ ((((((((((~ (V_zz = e_ii) & ~ (V_zz = e_hh)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_dd))
  & (V_zz = e_cc)) & (V_uu = true)) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ (((((((((((~ (V_zz = e_ii) & ~ (V_zz = e_hh)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_dd))
  & (V_zz = e_cc)) & (V_uu = true)) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false)) & ($lesseq(V_bbjj,$difference($sum(V_yy,1),V_bbaa))
  & ((e_bb = e_dd) & (V_bbbb = $sum(V_yy,1)))))))).

tff(f70, type, f70: (enum_aa * $int * bool * bool * bool * bool * $int *
  $int * $int * $int * $int * enum_aa * $int * bool * bool * bool * bool *
  $int * $int * $int * $int * $int * $int * $int * $int * set($int) *
  set($int) * set($int) * set($int) * $int * $int * $int * $int * $int *
  $int * $int * $int * $int * $int * $int * $int) > $o).

tff(f70_def, axiom, ![V_zz:enum_aa, V_yy:$int, V_xx:bool, V_ww:bool, V_vv:
  bool, V_uu:bool, V_tt:$int, V_ss:$int, V_rr:$int, V_qq:$int, V_pp:$int,
  V_oo:enum_aa, V_nn:$int, V_mm:bool, V_ll:bool, V_kk:bool, V_jj:bool,
  V_bbxx:$int, V_bbww:$int, V_bbvv:$int, V_bbuu:$int, V_bbtt:$int, V_bbss:
  $int, V_bbrr:$int, V_bbqq:$int, V_bbpp:set($int), V_bboo:set($int), V_bbnn:
  set($int), V_bbmm:set($int), V_bbll:$int, V_bbkk:$int, V_bbjj:$int, V_bbii:
  $int, V_bbhh:$int, V_bbgg:$int, V_bbff:$int, V_bbee:$int, V_bbdd:$int,
  V_bbcc:$int, V_bbbb:$int, V_bbaa:$int]: (f70(V_zz, V_yy, V_xx, V_ww, V_vv,
  V_uu, V_tt, V_ss, V_rr, V_qq, V_pp, V_oo, V_nn, V_mm, V_ll, V_kk, V_jj,
  V_bbxx, V_bbww, V_bbvv, V_bbuu, V_bbtt, V_bbss, V_bbrr, V_bbqq, V_bbpp,
  V_bboo, V_bbnn, V_bbmm, V_bbll, V_bbkk, V_bbjj, V_bbii, V_bbhh, V_bbgg,
  V_bbff, V_bbee, V_bbdd, V_bbcc, V_bbbb, V_bbaa)
  <=> (((((((((((((((((((((((((((((((((((((((((((((((((((($true & ~
  (V_zz = e_bb)) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh))
  & $lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh))
  & (V_zz = e_gg)) & (V_uu = false)) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false)) & mem($int, $sum(V_yy,1), integer))
  & $lesseq(0,$sum(V_yy,1))) & $true) & ~ (((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_ii)) & (e_gg = V_zz))
  & ($sum(V_yy,1) = V_bbee))) & ~ (((((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_hh)) & (V_zz = e_ii))
  & ($sum(V_yy,1) = V_bbee)) & ~ ((((V_uu = false) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = false) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false))) & (e_gg = e_bb))) & ~ (((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_hh)) & (V_zz = e_ii))
  & ($sum(V_yy,1) = V_bbee)) & (V_uu = false)) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false)) & (e_gg = e_bb))) & ~ (((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_hh)) & (V_zz = e_ii))
  & ($sum(V_yy,1) = V_bbee)) & (V_uu = true)) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false)) & (e_gg = e_bb))) & ~ (((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_hh)) & (V_zz = e_ii))
  & ($sum(V_yy,1) = V_bbee)) & (V_uu = true)) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false)) & (e_gg = e_bb))) & ~ (((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_hh)) & (V_zz = e_ii))
  & ($sum(V_yy,1) = V_bbee)) & (V_uu = false)) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false))
  & (($lesseq($sum($difference(V_yy,V_bbee),1),$sum(V_bbff,V_bbgg))
  & (e_gg = V_zz)) | (~
  $lesseq($sum($difference(V_yy,V_bbee),1),$sum(V_bbff,V_bbgg))
  & (e_gg = e_bb))))) & ~ (((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~
  (V_zz = e_ii)) & (V_zz = e_hh)) & ~ ((((V_uu = false) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = false) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false))) & (e_gg = e_bb))
  & ($sum(V_yy,1) = V_bbee))) & ~ (((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ii)) & (V_zz = e_hh)) & (V_uu = false))
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & ~ (((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ii)) & (V_zz = e_hh))
  & (V_uu = true)) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~
  (((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ii))
  & (V_zz = e_hh)) & (V_uu = true)) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))) & ~ (((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~
  (V_zz = e_ii)) & (V_zz = e_hh)) & (V_uu = false)) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false))
  & (($lesseq($sum($difference($difference($sum(V_yy,1),V_bbee),1),1),V_bbff)
  & (e_gg = V_zz)) | (~
  $lesseq($sum($difference($difference($sum(V_yy,1),V_bbee),1),1),V_bbff)
  & (e_gg = e_ii)))) & ($sum(V_yy,1) = V_bbee))) & ~ (((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & (V_zz = e_gg)) & ~
  ((((V_uu = false) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~
  ((((V_uu = true) & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & ~
  ((((V_uu = true) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~
  ((((V_uu = false) & (V_vv = true)) & (V_ww = false)) & (V_xx = false)))
  & (e_gg = e_bb)) & ($sum(V_yy,1) = V_bbee))) & ~ ((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & (V_zz = e_gg))
  & (V_uu = false)) & (V_vv = true)) & (V_ww = false)) & (V_xx = false))
  & ($lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh) | ((~
  $lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)
  & (e_gg = e_bb)) & ($sum(V_yy,1) = V_bbee))))) & ~ ((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & (V_zz = e_gg))
  & (V_uu = true)) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))
  & ($lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh) | ((~
  $lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)
  & (e_gg = e_bb)) & ($sum(V_yy,1) = V_bbee))))) & ~ ((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & (V_zz = e_gg))
  & (V_uu = true)) & (V_vv = true)) & (V_ww = false)) & (V_xx = false))
  & ($lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh) | ((~
  $lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)
  & (e_gg = e_bb)) & ($sum(V_yy,1) = V_bbee))))) & ~ (((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & (V_zz = e_gg))
  & (V_uu = false)) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))
  & (($lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)
  & (e_gg = e_hh)) | (~
  $lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)
  & (e_gg = e_bb)))) & ($sum(V_yy,1) = V_bbee))) & ~ (((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & (V_zz = e_gg))
  & (e_gg = e_bb)) & ($sum(V_yy,1) = V_bbee)) & ~ ((((V_uu = false)
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = true)
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & ~ ((((V_uu = true)
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = false)
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false)))) & ~ (((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & (V_zz = e_gg))
  & (e_gg = e_bb)) & ($sum(V_yy,1) = V_bbee)) & (V_uu = false))
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & ~ (((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & (V_zz = e_gg))
  & (e_gg = e_bb)) & ($sum(V_yy,1) = V_bbee)) & (V_uu = true))
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~ (((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & (V_zz = e_gg))
  & (e_gg = e_bb)) & ($sum(V_yy,1) = V_bbee)) & (V_uu = true))
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & ~ (((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & (V_zz = e_gg))
  & (e_gg = e_bb)) & ($sum(V_yy,1) = V_bbee)) & (V_uu = false))
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~ (((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & (V_zz = e_ff)) & ~
  ((((V_uu = false) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~
  ((((V_uu = true) & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & ~
  ((((V_uu = true) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~
  ((((V_uu = false) & (V_vv = true)) & (V_ww = false)) & (V_xx = false)))
  & (e_gg = e_bb)) & ($sum(V_yy,1) = V_bbee))) & ~ ((((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & (V_zz = e_ff))
  & (V_uu = false)) & (V_vv = true)) & (V_ww = false)) & (V_xx = false))
  & (V_bbdd = $sum(V_yy,1))) & (e_gg = V_zz)) & ($sum(V_yy,1) = V_bbee))) & ~
  (((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg))
  & (V_zz = e_ff)) & (V_uu = true)) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false)) & (e_gg = e_bb)) & ($sum(V_yy,1) = V_bbee))) & ~
  (((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg))
  & (V_zz = e_ff)) & (V_uu = true)) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false)) & (e_gg = e_bb)) & ($sum(V_yy,1) = V_bbee))) & ~
  (((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff))
  & (V_zz = e_ee)) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))) & (e_gg = e_bb)) & ($sum(V_yy,1) = V_bbee))) & ~
  (((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff))
  & (V_zz = e_ee)) & (V_uu = false)) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))
  & (($lesseq($sum($difference($difference($sum(V_bbcc,1),V_bbbb),1),1),V_bbii)
  & ((V_bbcc = $sum(V_yy,1)) & (e_gg = e_ee))) | (~
  $lesseq($sum($difference($difference($sum(V_bbcc,1),V_bbbb),1),1),V_bbii)
  & ((V_bbdd = $sum(V_yy,1)) & (e_gg = e_ff))))) & ($sum(V_yy,1) = V_bbee)))
  & ~ ((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff))
  & (V_zz = e_ee)) & (V_uu = true)) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false)) & (V_bbdd = V_bbcc))) & ~ (((((((((((((~ (V_zz = e_bb)
  & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh))
  & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff)) & (V_zz = e_ee)) & (V_uu = true))
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false))
  & (($lesseq($sum($difference($difference($sum(V_bbcc,1),V_bbbb),1),1),V_bbii)
  & ((V_bbcc = $sum(V_yy,1)) & (e_gg = e_ee))) | (~
  $lesseq($sum($difference($difference($sum(V_bbcc,1),V_bbbb),1),1),V_bbii)
  & (e_gg = e_bb)))) & ($sum(V_yy,1) = V_bbee))) & ~ (((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ee)) & (V_zz = e_dd)) & ~
  ((((V_uu = false) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~
  ((((V_uu = true) & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & ~
  ((((V_uu = true) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~
  ((((V_uu = false) & (V_vv = true)) & (V_ww = false)) & (V_xx = false)))
  & (e_gg = e_bb)) & ($sum(V_yy,1) = V_bbee))) & ~ ((((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ee)) & (V_zz = e_dd))
  & (V_uu = false)) & (V_vv = true)) & (V_ww = false)) & (V_xx = false))
  & (V_bbcc = $sum(V_yy,1))) & (e_gg = e_ee)) & ($sum(V_yy,1) = V_bbee))) & ~
  (((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ee))
  & (V_zz = e_dd)) & (V_uu = true)) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false)) & (V_bbcc = V_bbbb)) & (V_bbdd = V_bbbb))) & ~
  ((((((((((((~ (V_zz = e_ii) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_dd)) & (V_zz = e_cc))
  & ($sum(V_yy,1) = V_bbee)) & ~ ((((V_uu = false) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = false) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false))) & (e_gg = e_bb))) & ~ ((((((((((((~
  (V_zz = e_ii) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_dd)) & (V_zz = e_cc))
  & ($sum(V_yy,1) = V_bbee)) & (V_uu = false)) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false)) & (e_gg = e_bb))) & ~ ((((((((((((~
  (V_zz = e_ii) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_dd)) & (V_zz = e_cc))
  & ($sum(V_yy,1) = V_bbee)) & (V_uu = true)) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false)) & (e_gg = e_bb))) & ~ ((((((((((((~
  (V_zz = e_ii) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_dd)) & (V_zz = e_cc))
  & ($sum(V_yy,1) = V_bbee)) & (V_uu = true)) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false))
  & (($lesseq(V_bbjj,$difference($sum(V_yy,1),V_bbaa)) & ((e_gg = e_dd)
  & (V_bbbb = $sum(V_yy,1)))) | (~
  $lesseq(V_bbjj,$difference($sum(V_yy,1),V_bbaa)) & (e_gg = V_zz))))))).

tff(f71, type, f71: (enum_aa * $int * bool * bool * bool * bool * $int *
  $int * $int * $int * $int * enum_aa * $int * bool * bool * bool * bool *
  $int * $int * $int * $int * $int * $int * $int * $int * set($int) *
  set($int) * set($int) * set($int) * $int * $int * $int * $int * $int *
  $int * $int * $int * $int * $int * $int * $int) > $o).

tff(f71_def, axiom, ![V_zz:enum_aa, V_yy:$int, V_xx:bool, V_ww:bool, V_vv:
  bool, V_uu:bool, V_tt:$int, V_ss:$int, V_rr:$int, V_qq:$int, V_pp:$int,
  V_oo:enum_aa, V_nn:$int, V_mm:bool, V_ll:bool, V_kk:bool, V_jj:bool,
  V_bbxx:$int, V_bbww:$int, V_bbvv:$int, V_bbuu:$int, V_bbtt:$int, V_bbss:
  $int, V_bbrr:$int, V_bbqq:$int, V_bbpp:set($int), V_bboo:set($int), V_bbnn:
  set($int), V_bbmm:set($int), V_bbll:$int, V_bbkk:$int, V_bbjj:$int, V_bbii:
  $int, V_bbhh:$int, V_bbgg:$int, V_bbff:$int, V_bbee:$int, V_bbdd:$int,
  V_bbcc:$int, V_bbbb:$int, V_bbaa:$int]: (f71(V_zz, V_yy, V_xx, V_ww, V_vv,
  V_uu, V_tt, V_ss, V_rr, V_qq, V_pp, V_oo, V_nn, V_mm, V_ll, V_kk, V_jj,
  V_bbxx, V_bbww, V_bbvv, V_bbuu, V_bbtt, V_bbss, V_bbrr, V_bbqq, V_bbpp,
  V_bboo, V_bbnn, V_bbmm, V_bbll, V_bbkk, V_bbjj, V_bbii, V_bbhh, V_bbgg,
  V_bbff, V_bbee, V_bbdd, V_bbcc, V_bbbb, V_bbaa)
  <=> (((((((((((((((((((((((((((((((((((((((((((((((((((($true & ~
  (V_zz = e_bb)) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~
  $lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh))
  & (V_zz = e_gg)) & (V_uu = false)) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false)) & mem($int, $sum(V_yy,1), integer))
  & $lesseq(0,$sum(V_yy,1))) & $true) & ~ (((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_hh)) & (V_zz = e_ii)) & ~ ((((V_uu = false)
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = true)
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & ~ ((((V_uu = true)
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = false)
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false)))) & ~ (((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_hh)) & (V_zz = e_ii))
  & (V_uu = false)) & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & ~
  (((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_hh))
  & (V_zz = e_ii)) & (V_uu = true)) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ (((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~
  (V_zz = e_hh)) & (V_zz = e_ii)) & (V_uu = true)) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false))) & ~ ((((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_hh)) & (V_zz = e_ii)) & (V_uu = false))
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false)) & ~
  $lesseq($sum($difference(V_yy,V_bbee),1),$sum(V_bbff,V_bbgg)))) & ~
  (((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ii))
  & (V_zz = e_hh)) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false)))) & ~ (((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~
  (V_zz = e_ii)) & (V_zz = e_hh)) & (V_uu = false)) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false)) & (e_bb = e_gg))
  & (V_bbee = $sum(V_yy,1)))) & ~ (((((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ii)) & (V_zz = e_hh)) & (V_uu = true))
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false)) & (e_bb = e_gg))
  & (V_bbee = $sum(V_yy,1)))) & ~ (((((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ii)) & (V_zz = e_hh)) & (V_uu = true))
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false)) & (e_bb = e_gg))
  & (V_bbee = $sum(V_yy,1)))) & ~ ((((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ii)) & (V_zz = e_hh)) & (V_uu = false))
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false)) & (~
  $lesseq($sum($difference($difference($sum(V_yy,1),V_bbee),1),1),V_bbff)
  & (e_bb = e_ii)))) & ~ (((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & (V_zz = e_gg)) & ~ ((((V_uu = false) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = false) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false)))) & ~ ((((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & (V_zz = e_gg)) & (V_uu = false))
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false))
  & (($lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)
  & ((e_bb = e_gg) & (V_bbee = $sum(V_yy,1)))) | ~
  $lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)))) & ~
  ((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh))
  & (V_zz = e_gg)) & (V_uu = true)) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))
  & (($lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)
  & ((e_bb = e_gg) & (V_bbee = $sum(V_yy,1)))) | ~
  $lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)))) & ~
  ((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh))
  & (V_zz = e_gg)) & (V_uu = true)) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))
  & (($lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)
  & ((e_bb = e_gg) & (V_bbee = $sum(V_yy,1)))) | ~
  $lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)))) & ~
  ((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh))
  & (V_zz = e_gg)) & (V_uu = false)) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))
  & (($lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)
  & (e_bb = e_hh)) | ~
  $lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)))) & ~
  (((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh))
  & (V_zz = e_gg)) & (V_uu = false)) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))) & ~ (((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & (V_zz = e_gg)) & (V_uu = true)) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false))) & ~ (((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & (V_zz = e_gg)) & (V_uu = true))
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & ~ (((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & (V_zz = e_gg))
  & (V_uu = false)) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~
  (((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg))
  & (V_zz = e_ff)) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false)))) & ~ (((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~
  (V_zz = e_gg)) & (V_zz = e_ff)) & (V_uu = true)) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false))) & ~ (((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & ~ (V_zz = e_gg)) & (V_zz = e_ff)) & (V_uu = true))
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & ~ (((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & (V_zz = e_ff))
  & (V_uu = false)) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))
  & (e_bb = e_gg)) & (V_bbee = V_yy))) & ~ (((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ff)) & (V_zz = e_ee)) & ~ ((((V_uu = false)
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = true)
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & ~ ((((V_uu = true)
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = false)
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false)))) & ~ ((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff)) & (V_zz = e_ee))
  & (V_uu = false)) & (V_vv = true)) & (V_ww = false)) & (V_xx = false))
  & (($lesseq($sum($difference($difference($sum(V_bbcc,1),V_bbbb),1),1),V_bbii)
  & ((V_bbcc = $sum(V_yy,1)) & (e_bb = e_ee))) | (~
  $lesseq($sum($difference($difference($sum(V_bbcc,1),V_bbbb),1),1),V_bbii)
  & ((V_bbdd = $sum(V_yy,1)) & (e_bb = e_ff)))))) & ~ ((((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff)) & (V_zz = e_ee))
  & (V_uu = true)) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))
  & (e_bb = e_gg)) & (V_bbdd = V_bbcc)) & (V_bbee = $sum(V_yy,1)))) & ~
  ((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff))
  & (V_zz = e_ee)) & (V_uu = true)) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))
  & (($lesseq($sum($difference($difference($sum(V_bbcc,1),V_bbbb),1),1),V_bbii)
  & ((V_bbcc = $sum(V_yy,1)) & (e_bb = e_ee))) | ~
  $lesseq($sum($difference($difference($sum(V_bbcc,1),V_bbbb),1),1),V_bbii))))
  & ~ ((((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff))
  & (V_zz = e_ee)) & (V_uu = false)) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false)) & (e_bb = e_gg)) & (V_bbdd = V_bbcc)) & (V_bbee = V_yy)))
  & ~ (((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ee))
  & (V_zz = e_dd)) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false)))) & ~ (((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_ee)) & (V_zz = e_dd)) & (V_uu = false)) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false)) & (V_bbcc = $sum(V_yy,1)))
  & (e_bb = e_ee))) & ~ (((((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_ee)) & (V_zz = e_dd)) & (V_uu = true)) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false)) & (e_bb = e_gg)) & (V_bbcc = V_bbbb))
  & (V_bbdd = V_bbbb)) & (V_bbee = $sum(V_yy,1)))) & ~ (((((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ee)) & (V_zz = e_dd))
  & (V_uu = false)) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))
  & (e_bb = e_gg)) & (V_bbcc = V_bbbb)) & (V_bbdd = V_bbbb))
  & (V_bbee = V_yy))) & ~ ((((((((((~ (V_zz = e_ii) & ~ (V_zz = e_hh)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_dd))
  & (V_zz = e_cc)) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false)))) & ~ ((((((((((~ (V_zz = e_ii) & ~ (V_zz = e_hh)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_dd))
  & (V_zz = e_cc)) & (V_uu = false)) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))) & ~ ((((((((((~ (V_zz = e_ii) & ~ (V_zz = e_hh)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_dd))
  & (V_zz = e_cc)) & (V_uu = true)) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ (((((((((((~ (V_zz = e_ii) & ~ (V_zz = e_hh)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_dd))
  & (V_zz = e_cc)) & (V_uu = true)) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false)) & ($lesseq(V_bbjj,$difference($sum(V_yy,1),V_bbaa))
  & ((e_bb = e_dd) & (V_bbbb = $sum(V_yy,1)))))))).

tff(f72, type, f72: (enum_aa * $int * bool * bool * bool * bool * $int *
  $int * $int * $int * $int * enum_aa * $int * bool * bool * bool * bool *
  $int * $int * $int * $int * $int * $int * $int * $int * set($int) *
  set($int) * set($int) * set($int) * $int * $int * $int * $int * $int *
  $int * $int * $int * $int * $int * $int * $int) > $o).

tff(f72_def, axiom, ![V_zz:enum_aa, V_yy:$int, V_xx:bool, V_ww:bool, V_vv:
  bool, V_uu:bool, V_tt:$int, V_ss:$int, V_rr:$int, V_qq:$int, V_pp:$int,
  V_oo:enum_aa, V_nn:$int, V_mm:bool, V_ll:bool, V_kk:bool, V_jj:bool,
  V_bbxx:$int, V_bbww:$int, V_bbvv:$int, V_bbuu:$int, V_bbtt:$int, V_bbss:
  $int, V_bbrr:$int, V_bbqq:$int, V_bbpp:set($int), V_bboo:set($int), V_bbnn:
  set($int), V_bbmm:set($int), V_bbll:$int, V_bbkk:$int, V_bbjj:$int, V_bbii:
  $int, V_bbhh:$int, V_bbgg:$int, V_bbff:$int, V_bbee:$int, V_bbdd:$int,
  V_bbcc:$int, V_bbbb:$int, V_bbaa:$int]: (f72(V_zz, V_yy, V_xx, V_ww, V_vv,
  V_uu, V_tt, V_ss, V_rr, V_qq, V_pp, V_oo, V_nn, V_mm, V_ll, V_kk, V_jj,
  V_bbxx, V_bbww, V_bbvv, V_bbuu, V_bbtt, V_bbss, V_bbrr, V_bbqq, V_bbpp,
  V_bboo, V_bbnn, V_bbmm, V_bbll, V_bbkk, V_bbjj, V_bbii, V_bbhh, V_bbgg,
  V_bbff, V_bbee, V_bbdd, V_bbcc, V_bbbb, V_bbaa)
  <=> ((((((((((((((((((((((((((((((((((((((((((((((((((($true & ~
  (V_zz = e_bb)) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ ((((V_uu = false)
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = true)
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & ~ ((((V_uu = true)
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = false)
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & (V_zz = e_gg))
  & mem($int, $sum(V_yy,1), integer)) & $lesseq(0,$sum(V_yy,1))) & $true) & ~
  (((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_hh))
  & (V_zz = e_ii)) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false)))) & ~ (((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~
  (V_zz = e_hh)) & (V_zz = e_ii)) & (V_uu = false)) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false))) & ~ (((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_hh)) & (V_zz = e_ii)) & (V_uu = true))
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~ (((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_hh)) & (V_zz = e_ii))
  & (V_uu = true)) & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & ~
  ((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_hh))
  & (V_zz = e_ii)) & (V_uu = false)) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false)) & ~
  $lesseq($sum($difference(V_yy,V_bbee),1),$sum(V_bbff,V_bbgg)))) & ~
  (((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ii))
  & (V_zz = e_hh)) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false)))) & ~ (((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~
  (V_zz = e_ii)) & (V_zz = e_hh)) & (V_uu = false)) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false)) & (e_bb = e_gg))
  & (V_bbee = $sum(V_yy,1)))) & ~ (((((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ii)) & (V_zz = e_hh)) & (V_uu = true))
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false)) & (e_bb = e_gg))
  & (V_bbee = $sum(V_yy,1)))) & ~ (((((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ii)) & (V_zz = e_hh)) & (V_uu = true))
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false)) & (e_bb = e_gg))
  & (V_bbee = $sum(V_yy,1)))) & ~ ((((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ii)) & (V_zz = e_hh)) & (V_uu = false))
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false)) & (~
  $lesseq($sum($difference($difference($sum(V_yy,1),V_bbee),1),1),V_bbff)
  & (e_bb = e_ii)))) & ~ (((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & (V_zz = e_gg)) & ~ ((((V_uu = false) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = false) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false)))) & ~ ((((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & (V_zz = e_gg)) & (V_uu = false))
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false))
  & (($lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)
  & ((e_bb = e_gg) & (V_bbee = $sum(V_yy,1)))) | ~
  $lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)))) & ~
  ((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh))
  & (V_zz = e_gg)) & (V_uu = true)) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))
  & (($lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)
  & ((e_bb = e_gg) & (V_bbee = $sum(V_yy,1)))) | ~
  $lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)))) & ~
  ((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh))
  & (V_zz = e_gg)) & (V_uu = true)) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))
  & (($lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)
  & ((e_bb = e_gg) & (V_bbee = $sum(V_yy,1)))) | ~
  $lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)))) & ~
  ((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh))
  & (V_zz = e_gg)) & (V_uu = false)) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))
  & (($lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)
  & (e_bb = e_hh)) | ~
  $lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)))) & ~
  (((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh))
  & (V_zz = e_gg)) & (V_uu = false)) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))) & ~ (((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & (V_zz = e_gg)) & (V_uu = true)) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false))) & ~ (((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & (V_zz = e_gg)) & (V_uu = true))
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & ~ (((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & (V_zz = e_gg))
  & (V_uu = false)) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~
  (((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg))
  & (V_zz = e_ff)) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false)))) & ~ (((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~
  (V_zz = e_gg)) & (V_zz = e_ff)) & (V_uu = true)) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false))) & ~ (((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & ~ (V_zz = e_gg)) & (V_zz = e_ff)) & (V_uu = true))
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & ~ (((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & (V_zz = e_ff))
  & (V_uu = false)) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))
  & (e_bb = e_gg)) & (V_bbee = V_yy))) & ~ (((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ff)) & (V_zz = e_ee)) & ~ ((((V_uu = false)
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = true)
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & ~ ((((V_uu = true)
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = false)
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false)))) & ~ ((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff)) & (V_zz = e_ee))
  & (V_uu = false)) & (V_vv = true)) & (V_ww = false)) & (V_xx = false))
  & (($lesseq($sum($difference($difference($sum(V_bbcc,1),V_bbbb),1),1),V_bbii)
  & ((V_bbcc = $sum(V_yy,1)) & (e_bb = e_ee))) | (~
  $lesseq($sum($difference($difference($sum(V_bbcc,1),V_bbbb),1),1),V_bbii)
  & ((V_bbdd = $sum(V_yy,1)) & (e_bb = e_ff)))))) & ~ ((((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff)) & (V_zz = e_ee))
  & (V_uu = true)) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))
  & (e_bb = e_gg)) & (V_bbdd = V_bbcc)) & (V_bbee = $sum(V_yy,1)))) & ~
  ((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff))
  & (V_zz = e_ee)) & (V_uu = true)) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))
  & (($lesseq($sum($difference($difference($sum(V_bbcc,1),V_bbbb),1),1),V_bbii)
  & ((V_bbcc = $sum(V_yy,1)) & (e_bb = e_ee))) | ~
  $lesseq($sum($difference($difference($sum(V_bbcc,1),V_bbbb),1),1),V_bbii))))
  & ~ ((((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff))
  & (V_zz = e_ee)) & (V_uu = false)) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false)) & (e_bb = e_gg)) & (V_bbdd = V_bbcc)) & (V_bbee = V_yy)))
  & ~ (((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ee))
  & (V_zz = e_dd)) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false)))) & ~ (((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_ee)) & (V_zz = e_dd)) & (V_uu = false)) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false)) & (V_bbcc = $sum(V_yy,1)))
  & (e_bb = e_ee))) & ~ (((((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_ee)) & (V_zz = e_dd)) & (V_uu = true)) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false)) & (e_bb = e_gg)) & (V_bbcc = V_bbbb))
  & (V_bbdd = V_bbbb)) & (V_bbee = $sum(V_yy,1)))) & ~ (((((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ee)) & (V_zz = e_dd))
  & (V_uu = false)) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))
  & (e_bb = e_gg)) & (V_bbcc = V_bbbb)) & (V_bbdd = V_bbbb))
  & (V_bbee = V_yy))) & ~ ((((((((((~ (V_zz = e_ii) & ~ (V_zz = e_hh)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_dd))
  & (V_zz = e_cc)) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false)))) & ~ ((((((((((~ (V_zz = e_ii) & ~ (V_zz = e_hh)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_dd))
  & (V_zz = e_cc)) & (V_uu = false)) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))) & ~ ((((((((((~ (V_zz = e_ii) & ~ (V_zz = e_hh)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_dd))
  & (V_zz = e_cc)) & (V_uu = true)) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ (((((((((((~ (V_zz = e_ii) & ~ (V_zz = e_hh)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_dd))
  & (V_zz = e_cc)) & (V_uu = true)) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false)) & ($lesseq(V_bbjj,$difference($sum(V_yy,1),V_bbaa))
  & ((e_bb = e_dd) & (V_bbbb = $sum(V_yy,1)))))))).

tff(f73, type, f73: (enum_aa * $int * bool * bool * bool * bool * $int *
  $int * $int * $int * $int * enum_aa * $int * bool * bool * bool * bool *
  $int * $int * $int * $int * $int * $int * $int * $int * set($int) *
  set($int) * set($int) * set($int) * $int * $int * $int * $int * $int *
  $int * $int * $int * $int * $int * $int * $int) > $o).

tff(f73_def, axiom, ![V_zz:enum_aa, V_yy:$int, V_xx:bool, V_ww:bool, V_vv:
  bool, V_uu:bool, V_tt:$int, V_ss:$int, V_rr:$int, V_qq:$int, V_pp:$int,
  V_oo:enum_aa, V_nn:$int, V_mm:bool, V_ll:bool, V_kk:bool, V_jj:bool,
  V_bbxx:$int, V_bbww:$int, V_bbvv:$int, V_bbuu:$int, V_bbtt:$int, V_bbss:
  $int, V_bbrr:$int, V_bbqq:$int, V_bbpp:set($int), V_bboo:set($int), V_bbnn:
  set($int), V_bbmm:set($int), V_bbll:$int, V_bbkk:$int, V_bbjj:$int, V_bbii:
  $int, V_bbhh:$int, V_bbgg:$int, V_bbff:$int, V_bbee:$int, V_bbdd:$int,
  V_bbcc:$int, V_bbbb:$int, V_bbaa:$int]: (f73(V_zz, V_yy, V_xx, V_ww, V_vv,
  V_uu, V_tt, V_ss, V_rr, V_qq, V_pp, V_oo, V_nn, V_mm, V_ll, V_kk, V_jj,
  V_bbxx, V_bbww, V_bbvv, V_bbuu, V_bbtt, V_bbss, V_bbrr, V_bbqq, V_bbpp,
  V_bboo, V_bbnn, V_bbmm, V_bbll, V_bbkk, V_bbjj, V_bbii, V_bbhh, V_bbgg,
  V_bbff, V_bbee, V_bbdd, V_bbcc, V_bbbb, V_bbaa)
  <=> (((((((((((((((((((((((((((((((((((((((((((((((((((((($true & ~
  (V_zz = e_bb)) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ii))
  & $lesseq($sum($difference($difference($sum(V_yy,1),V_bbee),1),1),V_bbff))
  & (V_zz = e_hh)) & (V_uu = false)) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false)) & mem($int, $sum(V_yy,1), integer))
  & $lesseq(0,$sum(V_yy,1))) & ~ (((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc))
  & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_gg))
  & ~ (V_zz = e_hh)) & ~ (V_zz = e_ii))) & ~ ((((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_hh)) & (V_zz = e_ii)) & ~ ((((V_uu = false)
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = true)
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & ~ ((((V_uu = true)
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = false)
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & (V_zz = e_bb))) & ~
  ((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_hh))
  & (V_zz = e_ii)) & (V_uu = false)) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false)) & (V_zz = e_bb))) & ~ ((((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_hh)) & (V_zz = e_ii)) & (V_uu = true))
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false)) & (V_zz = e_bb))) & ~
  ((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_hh))
  & (V_zz = e_ii)) & (V_uu = true)) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false)) & (V_zz = e_bb))) & ~ ((((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_hh)) & (V_zz = e_ii)) & (V_uu = false))
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false))
  & ($lesseq($sum($difference(V_yy,V_bbee),1),$sum(V_bbff,V_bbgg)) | (~
  $lesseq($sum($difference(V_yy,V_bbee),1),$sum(V_bbff,V_bbgg))
  & (V_zz = e_bb))))) & ~ ((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~
  (V_zz = e_ii)) & (V_zz = e_hh)) & ~ ((((V_uu = false) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = false) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false))) & (V_zz = e_bb))) & ~ (((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ii)) & (V_zz = e_hh))
  & (V_uu = false)) & (V_vv = true)) & (V_ww = false)) & (V_xx = false))
  & (V_zz = e_gg)) & (V_bbee = $sum(V_yy,1)))) & ~ (((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ii)) & (V_zz = e_hh))
  & (V_uu = true)) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))
  & (V_zz = e_gg)) & (V_bbee = $sum(V_yy,1)))) & ~ (((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ii)) & (V_zz = e_hh))
  & (V_uu = true)) & (V_vv = true)) & (V_ww = false)) & (V_xx = false))
  & (V_zz = e_gg)) & (V_bbee = $sum(V_yy,1)))) & ~ ((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ii)) & (V_zz = e_hh))
  & (V_uu = false)) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))
  & ($lesseq($sum($difference($difference($sum(V_yy,1),V_bbee),1),1),V_bbff)
  | (~
  $lesseq($sum($difference($difference($sum(V_yy,1),V_bbee),1),1),V_bbff)
  & (V_zz = e_ii))))) & ~ ((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & (V_zz = e_gg)) & ~ ((((V_uu = false) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = false) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false))) & (V_zz = e_bb))) & ~ ((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & (V_zz = e_gg))
  & (V_uu = false)) & (V_vv = true)) & (V_ww = false)) & (V_xx = false))
  & (($lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)
  & ((V_zz = e_gg) & (V_bbee = $sum(V_yy,1)))) | (~
  $lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)
  & (V_zz = e_bb))))) & ~ ((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & (V_zz = e_gg)) & (V_uu = true)) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false))
  & (($lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)
  & ((V_zz = e_gg) & (V_bbee = $sum(V_yy,1)))) | (~
  $lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)
  & (V_zz = e_bb))))) & ~ ((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & (V_zz = e_gg)) & (V_uu = true)) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false))
  & (($lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)
  & ((V_zz = e_gg) & (V_bbee = $sum(V_yy,1)))) | (~
  $lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)
  & (V_zz = e_bb))))) & ~ ((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & (V_zz = e_gg)) & (V_uu = false)) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false))
  & (($lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)
  & (V_zz = e_hh)) | (~
  $lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)
  & (V_zz = e_bb))))) & ~ ((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & (V_zz = e_gg)) & (V_zz = e_bb)) & ~ ((((V_uu = false)
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = true)
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & ~ ((((V_uu = true)
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = false)
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false)))) & ~ ((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & (V_zz = e_gg))
  & (V_zz = e_bb)) & (V_uu = false)) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))) & ~ ((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & (V_zz = e_gg)) & (V_zz = e_bb)) & (V_uu = true))
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~ ((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & (V_zz = e_gg))
  & (V_zz = e_bb)) & (V_uu = true)) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))) & ~ ((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & (V_zz = e_gg)) & (V_zz = e_bb)) & (V_uu = false))
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~ ((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & (V_zz = e_ff)) & ~
  ((((V_uu = false) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~
  ((((V_uu = true) & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & ~
  ((((V_uu = true) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~
  ((((V_uu = false) & (V_vv = true)) & (V_ww = false)) & (V_xx = false)))
  & (V_zz = e_bb))) & ~ ((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~
  (V_zz = e_gg)) & (V_zz = e_ff)) & (V_uu = false)) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false)) & (V_bbdd = $sum(V_yy,1)))) & ~
  ((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg))
  & (V_zz = e_ff)) & (V_uu = true)) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false)) & (V_zz = e_bb))) & ~ ((((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & ~ (V_zz = e_gg)) & (V_zz = e_ff)) & (V_uu = true))
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false)) & (V_zz = e_bb))) & ~
  (((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg))
  & (V_zz = e_ff)) & (V_uu = false)) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false)) & (V_zz = e_gg)) & (V_bbee = V_yy))) & ~ ((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff)) & (V_zz = e_ee)) & ~
  ((((V_uu = false) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~
  ((((V_uu = true) & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & ~
  ((((V_uu = true) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~
  ((((V_uu = false) & (V_vv = true)) & (V_ww = false)) & (V_xx = false)))
  & (V_zz = e_bb))) & ~ ((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~
  (V_zz = e_ff)) & (V_zz = e_ee)) & (V_uu = false)) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false))
  & (($lesseq($sum($difference($difference($sum(V_bbcc,1),V_bbbb),1),1),V_bbii)
  & ((V_bbcc = $sum(V_yy,1)) & (V_zz = e_ee))) | (~
  $lesseq($sum($difference($difference($sum(V_bbcc,1),V_bbbb),1),1),V_bbii)
  & ((V_bbdd = $sum(V_yy,1)) & (V_zz = e_ff)))))) & ~ ((((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff)) & (V_zz = e_ee))
  & (V_uu = true)) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))
  & (V_zz = e_gg)) & (V_bbdd = V_bbcc)) & (V_bbee = $sum(V_yy,1)))) & ~
  ((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff))
  & (V_zz = e_ee)) & (V_uu = true)) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))
  & (($lesseq($sum($difference($difference($sum(V_bbcc,1),V_bbbb),1),1),V_bbii)
  & ((V_bbcc = $sum(V_yy,1)) & (V_zz = e_ee))) | (~
  $lesseq($sum($difference($difference($sum(V_bbcc,1),V_bbbb),1),1),V_bbii)
  & (V_zz = e_bb))))) & ~ ((((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc))
  & ~ (V_zz = e_dd)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg))
  & ~ (V_zz = e_ff)) & (V_zz = e_ee)) & (V_uu = false)) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false)) & (V_zz = e_gg)) & (V_bbdd = V_bbcc))
  & (V_bbee = V_yy))) & ~ ((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_ee)) & (V_zz = e_dd)) & ~ ((((V_uu = false) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = false) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false))) & (V_zz = e_bb))) & ~ (((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ee)) & (V_zz = e_dd))
  & (V_uu = false)) & (V_vv = true)) & (V_ww = false)) & (V_xx = false))
  & (V_bbcc = $sum(V_yy,1))) & (V_zz = e_ee))) & ~ (((((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ee)) & (V_zz = e_dd))
  & (V_uu = true)) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))
  & (V_zz = e_gg)) & (V_bbcc = V_bbbb)) & (V_bbdd = V_bbbb))
  & (V_bbee = $sum(V_yy,1)))) & ~ (((((((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_ee)) & (V_zz = e_dd)) & (V_uu = false))
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false)) & (V_zz = e_gg))
  & (V_bbcc = V_bbbb)) & (V_bbdd = V_bbbb)) & (V_bbee = V_yy))) & ~
  (((((((((((~ (V_zz = e_ii) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_dd)) & (V_zz = e_cc)) & ~
  ((((V_uu = false) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~
  ((((V_uu = true) & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & ~
  ((((V_uu = true) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~
  ((((V_uu = false) & (V_vv = true)) & (V_ww = false)) & (V_xx = false)))
  & (V_zz = e_bb))) & ~ (((((((((((~ (V_zz = e_ii) & ~ (V_zz = e_hh)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_dd))
  & (V_zz = e_cc)) & (V_uu = false)) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false)) & (V_zz = e_bb))) & ~ (((((((((((~ (V_zz = e_ii) & ~
  (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_dd)) & (V_zz = e_cc)) & (V_uu = true)) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false)) & (V_zz = e_bb))) & ~ (((((((((((~
  (V_zz = e_ii) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_dd)) & (V_zz = e_cc)) & (V_uu = true))
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false))
  & (($lesseq(V_bbjj,$difference($sum(V_yy,1),V_bbaa)) & ((V_zz = e_dd)
  & (V_bbbb = $sum(V_yy,1)))) | ~
  $lesseq(V_bbjj,$difference($sum(V_yy,1),V_bbaa))))))).

tff(f74, type, f74: (enum_aa * $int * bool * bool * bool * bool * $int *
  $int * $int * $int * $int * enum_aa * $int * bool * bool * bool * bool *
  $int * $int * $int * $int * $int * $int * $int * $int * set($int) *
  set($int) * set($int) * set($int) * $int * $int * $int * $int * $int *
  $int * $int * $int * $int * $int * $int * $int) > $o).

tff(f74_def, axiom, ![V_zz:enum_aa, V_yy:$int, V_xx:bool, V_ww:bool, V_vv:
  bool, V_uu:bool, V_tt:$int, V_ss:$int, V_rr:$int, V_qq:$int, V_pp:$int,
  V_oo:enum_aa, V_nn:$int, V_mm:bool, V_ll:bool, V_kk:bool, V_jj:bool,
  V_bbxx:$int, V_bbww:$int, V_bbvv:$int, V_bbuu:$int, V_bbtt:$int, V_bbss:
  $int, V_bbrr:$int, V_bbqq:$int, V_bbpp:set($int), V_bboo:set($int), V_bbnn:
  set($int), V_bbmm:set($int), V_bbll:$int, V_bbkk:$int, V_bbjj:$int, V_bbii:
  $int, V_bbhh:$int, V_bbgg:$int, V_bbff:$int, V_bbee:$int, V_bbdd:$int,
  V_bbcc:$int, V_bbbb:$int, V_bbaa:$int]: (f74(V_zz, V_yy, V_xx, V_ww, V_vv,
  V_uu, V_tt, V_ss, V_rr, V_qq, V_pp, V_oo, V_nn, V_mm, V_ll, V_kk, V_jj,
  V_bbxx, V_bbww, V_bbvv, V_bbuu, V_bbtt, V_bbss, V_bbrr, V_bbqq, V_bbpp,
  V_bboo, V_bbnn, V_bbmm, V_bbll, V_bbkk, V_bbjj, V_bbii, V_bbhh, V_bbgg,
  V_bbff, V_bbee, V_bbdd, V_bbcc, V_bbbb, V_bbaa) <=> ~ (V_zz = e_hh))).

tff(f75, type, f75: (enum_aa * $int * bool * bool * bool * bool * $int *
  $int * $int * $int * $int * enum_aa * $int * bool * bool * bool * bool *
  $int * $int * $int * $int * $int * $int * $int * $int * set($int) *
  set($int) * set($int) * set($int) * $int * $int * $int * $int * $int *
  $int * $int * $int * $int * $int * $int * $int) > $o).

tff(f75_def, axiom, ![V_zz:enum_aa, V_yy:$int, V_xx:bool, V_ww:bool, V_vv:
  bool, V_uu:bool, V_tt:$int, V_ss:$int, V_rr:$int, V_qq:$int, V_pp:$int,
  V_oo:enum_aa, V_nn:$int, V_mm:bool, V_ll:bool, V_kk:bool, V_jj:bool,
  V_bbxx:$int, V_bbww:$int, V_bbvv:$int, V_bbuu:$int, V_bbtt:$int, V_bbss:
  $int, V_bbrr:$int, V_bbqq:$int, V_bbpp:set($int), V_bboo:set($int), V_bbnn:
  set($int), V_bbmm:set($int), V_bbll:$int, V_bbkk:$int, V_bbjj:$int, V_bbii:
  $int, V_bbhh:$int, V_bbgg:$int, V_bbff:$int, V_bbee:$int, V_bbdd:$int,
  V_bbcc:$int, V_bbbb:$int, V_bbaa:$int]: (f75(V_zz, V_yy, V_xx, V_ww, V_vv,
  V_uu, V_tt, V_ss, V_rr, V_qq, V_pp, V_oo, V_nn, V_mm, V_ll, V_kk, V_jj,
  V_bbxx, V_bbww, V_bbvv, V_bbuu, V_bbtt, V_bbss, V_bbrr, V_bbqq, V_bbpp,
  V_bboo, V_bbnn, V_bbmm, V_bbll, V_bbkk, V_bbjj, V_bbii, V_bbhh, V_bbgg,
  V_bbff, V_bbee, V_bbdd, V_bbcc, V_bbbb, V_bbaa)
  <=> ((((((((((((((((((((((((((((((((((((((((((((((((((((($true & ~
  (V_zz = e_bb)) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ii)) & ~
  $lesseq($sum($difference($difference($sum(V_yy,1),V_bbee),1),1),V_bbff))
  & (V_zz = e_hh)) & (V_uu = false)) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false)) & mem($int, $sum(V_yy,1), integer))
  & $lesseq(0,$sum(V_yy,1))) & $true) & ~ ((((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_hh)) & (V_zz = e_ii)) & ~ ((((V_uu = false)
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = true)
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & ~ ((((V_uu = true)
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = false)
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & (e_ii = e_bb))) & ~
  ((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_hh))
  & (V_zz = e_ii)) & (V_uu = false)) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false)) & (e_ii = e_bb))) & ~ ((((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_hh)) & (V_zz = e_ii)) & (V_uu = true))
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false)) & (e_ii = e_bb))) & ~
  ((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_hh))
  & (V_zz = e_ii)) & (V_uu = true)) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false)) & (e_ii = e_bb))) & ~ ((((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_hh)) & (V_zz = e_ii)) & (V_uu = false))
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false)) & (~
  $lesseq($sum($difference(V_yy,V_bbee),1),$sum(V_bbff,V_bbgg))
  & (e_ii = e_bb)))) & ~ ((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~
  (V_zz = e_ii)) & (V_zz = e_hh)) & ~ ((((V_uu = false) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = false) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false))) & (e_ii = e_bb))) & ~ (((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ii)) & (V_zz = e_hh))
  & (V_uu = false)) & (V_vv = true)) & (V_ww = false)) & (V_xx = false))
  & (e_ii = e_gg)) & (V_bbee = $sum(V_yy,1)))) & ~ (((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ii)) & (V_zz = e_hh))
  & (V_uu = true)) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))
  & (e_ii = e_gg)) & (V_bbee = $sum(V_yy,1)))) & ~ (((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ii)) & (V_zz = e_hh))
  & (V_uu = true)) & (V_vv = true)) & (V_ww = false)) & (V_xx = false))
  & (e_ii = e_gg)) & (V_bbee = $sum(V_yy,1)))) & ~ ((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ii)) & (V_zz = e_hh))
  & (V_uu = false)) & (V_vv = true)) & (V_ww = true)) & (V_xx = false)) & ~
  $lesseq($sum($difference($difference($sum(V_yy,1),V_bbee),1),1),V_bbff)))
  & ~ ((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh))
  & (V_zz = e_gg)) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))) & (e_ii = e_bb))) & ~ ((((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & (V_zz = e_gg)) & (V_uu = false))
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false))
  & (($lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)
  & ((e_ii = e_gg) & (V_bbee = $sum(V_yy,1)))) | (~
  $lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)
  & (e_ii = e_bb))))) & ~ ((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & (V_zz = e_gg)) & (V_uu = true)) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false))
  & (($lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)
  & ((e_ii = e_gg) & (V_bbee = $sum(V_yy,1)))) | (~
  $lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)
  & (e_ii = e_bb))))) & ~ ((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & (V_zz = e_gg)) & (V_uu = true)) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false))
  & (($lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)
  & ((e_ii = e_gg) & (V_bbee = $sum(V_yy,1)))) | (~
  $lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)
  & (e_ii = e_bb))))) & ~ ((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & (V_zz = e_gg)) & (V_uu = false)) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false))
  & (($lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)
  & (e_ii = e_hh)) | (~
  $lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)
  & (e_ii = e_bb))))) & ~ ((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & (V_zz = e_gg)) & (e_ii = e_bb)) & ~ ((((V_uu = false)
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = true)
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & ~ ((((V_uu = true)
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = false)
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false)))) & ~ ((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & (V_zz = e_gg))
  & (e_ii = e_bb)) & (V_uu = false)) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))) & ~ ((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & (V_zz = e_gg)) & (e_ii = e_bb)) & (V_uu = true))
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~ ((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & (V_zz = e_gg))
  & (e_ii = e_bb)) & (V_uu = true)) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))) & ~ ((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & (V_zz = e_gg)) & (e_ii = e_bb)) & (V_uu = false))
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~ ((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & (V_zz = e_ff)) & ~
  ((((V_uu = false) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~
  ((((V_uu = true) & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & ~
  ((((V_uu = true) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~
  ((((V_uu = false) & (V_vv = true)) & (V_ww = false)) & (V_xx = false)))
  & (e_ii = e_bb))) & ~ ((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~
  (V_zz = e_gg)) & (V_zz = e_ff)) & (V_uu = true)) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false)) & (e_ii = e_bb))) & ~ ((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & (V_zz = e_ff))
  & (V_uu = true)) & (V_vv = true)) & (V_ww = false)) & (V_xx = false))
  & (e_ii = e_bb))) & ~ (((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~
  (V_zz = e_gg)) & (V_zz = e_ff)) & (V_uu = false)) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false)) & (e_ii = e_gg)) & (V_bbee = V_yy))) & ~
  ((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff))
  & (V_zz = e_ee)) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))) & (e_ii = e_bb))) & ~ ((((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ff)) & (V_zz = e_ee)) & (V_uu = false))
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false))
  & (($lesseq($sum($difference($difference($sum(V_bbcc,1),V_bbbb),1),1),V_bbii)
  & ((V_bbcc = $sum(V_yy,1)) & (e_ii = e_ee))) | (~
  $lesseq($sum($difference($difference($sum(V_bbcc,1),V_bbbb),1),1),V_bbii)
  & ((V_bbdd = $sum(V_yy,1)) & (e_ii = e_ff)))))) & ~ ((((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff)) & (V_zz = e_ee))
  & (V_uu = true)) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))
  & (e_ii = e_gg)) & (V_bbdd = V_bbcc)) & (V_bbee = $sum(V_yy,1)))) & ~
  ((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff))
  & (V_zz = e_ee)) & (V_uu = true)) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))
  & (($lesseq($sum($difference($difference($sum(V_bbcc,1),V_bbbb),1),1),V_bbii)
  & ((V_bbcc = $sum(V_yy,1)) & (e_ii = e_ee))) | (~
  $lesseq($sum($difference($difference($sum(V_bbcc,1),V_bbbb),1),1),V_bbii)
  & (e_ii = e_bb))))) & ~ ((((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc))
  & ~ (V_zz = e_dd)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg))
  & ~ (V_zz = e_ff)) & (V_zz = e_ee)) & (V_uu = false)) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false)) & (e_ii = e_gg)) & (V_bbdd = V_bbcc))
  & (V_bbee = V_yy))) & ~ ((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_ee)) & (V_zz = e_dd)) & ~ ((((V_uu = false) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = false) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false))) & (e_ii = e_bb))) & ~ (((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ee)) & (V_zz = e_dd))
  & (V_uu = false)) & (V_vv = true)) & (V_ww = false)) & (V_xx = false))
  & (V_bbcc = $sum(V_yy,1))) & (e_ii = e_ee))) & ~ (((((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ee)) & (V_zz = e_dd))
  & (V_uu = true)) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))
  & (e_ii = e_gg)) & (V_bbcc = V_bbbb)) & (V_bbdd = V_bbbb))
  & (V_bbee = $sum(V_yy,1)))) & ~ (((((((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_ee)) & (V_zz = e_dd)) & (V_uu = false))
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false)) & (e_ii = e_gg))
  & (V_bbcc = V_bbbb)) & (V_bbdd = V_bbbb)) & (V_bbee = V_yy))) & ~
  (((((((((((~ (V_zz = e_ii) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_dd)) & (V_zz = e_cc)) & ~
  ((((V_uu = false) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~
  ((((V_uu = true) & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & ~
  ((((V_uu = true) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~
  ((((V_uu = false) & (V_vv = true)) & (V_ww = false)) & (V_xx = false)))
  & (e_ii = e_bb))) & ~ (((((((((((~ (V_zz = e_ii) & ~ (V_zz = e_hh)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_dd))
  & (V_zz = e_cc)) & (V_uu = false)) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false)) & (e_ii = e_bb))) & ~ (((((((((((~ (V_zz = e_ii) & ~
  (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_dd)) & (V_zz = e_cc)) & (V_uu = true)) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false)) & (e_ii = e_bb))) & ~ (((((((((((~
  (V_zz = e_ii) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_dd)) & (V_zz = e_cc)) & (V_uu = true))
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false))
  & ($lesseq(V_bbjj,$difference($sum(V_yy,1),V_bbaa)) & ((e_ii = e_dd)
  & (V_bbbb = $sum(V_yy,1)))))))).

tff(f77, type, f77: (enum_aa * $int * bool * bool * bool * bool * $int *
  $int * $int * $int * $int * enum_aa * $int * bool * bool * bool * bool *
  $int * $int * $int * $int * $int * $int * $int * $int * set($int) *
  set($int) * set($int) * set($int) * $int * $int * $int * $int * $int *
  $int * $int * $int * $int * $int * $int * $int) > $o).

tff(f77_def, axiom, ![V_zz:enum_aa, V_yy:$int, V_xx:bool, V_ww:bool, V_vv:
  bool, V_uu:bool, V_tt:$int, V_ss:$int, V_rr:$int, V_qq:$int, V_pp:$int,
  V_oo:enum_aa, V_nn:$int, V_mm:bool, V_ll:bool, V_kk:bool, V_jj:bool,
  V_bbxx:$int, V_bbww:$int, V_bbvv:$int, V_bbuu:$int, V_bbtt:$int, V_bbss:
  $int, V_bbrr:$int, V_bbqq:$int, V_bbpp:set($int), V_bboo:set($int), V_bbnn:
  set($int), V_bbmm:set($int), V_bbll:$int, V_bbkk:$int, V_bbjj:$int, V_bbii:
  $int, V_bbhh:$int, V_bbgg:$int, V_bbff:$int, V_bbee:$int, V_bbdd:$int,
  V_bbcc:$int, V_bbbb:$int, V_bbaa:$int]: (f77(V_zz, V_yy, V_xx, V_ww, V_vv,
  V_uu, V_tt, V_ss, V_rr, V_qq, V_pp, V_oo, V_nn, V_mm, V_ll, V_kk, V_jj,
  V_bbxx, V_bbww, V_bbvv, V_bbuu, V_bbtt, V_bbss, V_bbrr, V_bbqq, V_bbpp,
  V_bboo, V_bbnn, V_bbmm, V_bbll, V_bbkk, V_bbjj, V_bbii, V_bbhh, V_bbgg,
  V_bbff, V_bbee, V_bbdd, V_bbcc, V_bbbb, V_bbaa)
  <=> ((((((((((((((((((((((((((((((((((((((((((((((((($true & ~
  (V_zz = e_bb)) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ii)) & (V_zz = e_hh))
  & (V_uu = true)) & (V_vv = true)) & (V_ww = false)) & (V_xx = false))
  & mem($int, $sum(V_yy,1), integer)) & $lesseq(0,$sum(V_yy,1))) & $true) & ~
  (((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_hh))
  & (V_zz = e_ii)) & ($sum(V_yy,1) = V_bbee)) & ~ ((((V_uu = false)
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = true)
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & ~ ((((V_uu = true)
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = false)
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & (e_gg = e_bb))) & ~
  (((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_hh))
  & (V_zz = e_ii)) & ($sum(V_yy,1) = V_bbee)) & (V_uu = false))
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false)) & (e_gg = e_bb))) & ~
  (((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_hh))
  & (V_zz = e_ii)) & ($sum(V_yy,1) = V_bbee)) & (V_uu = true))
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false)) & (e_gg = e_bb))) & ~
  (((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_hh))
  & (V_zz = e_ii)) & ($sum(V_yy,1) = V_bbee)) & (V_uu = true))
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false)) & (e_gg = e_bb))) & ~
  (((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_hh))
  & (V_zz = e_ii)) & ($sum(V_yy,1) = V_bbee)) & (V_uu = false))
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false)) & (~
  $lesseq($sum($difference(V_yy,V_bbee),1),$sum(V_bbff,V_bbgg))
  & (e_gg = e_bb)))) & ~ (((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~
  (V_zz = e_ii)) & (V_zz = e_hh)) & ~ ((((V_uu = false) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = false) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false))) & (e_gg = e_bb))
  & ($sum(V_yy,1) = V_bbee))) & ~ (((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ii)) & (V_zz = e_hh)) & (V_uu = false))
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & ~ (((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ii)) & (V_zz = e_hh))
  & (V_uu = true)) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~
  (((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ii))
  & (V_zz = e_hh)) & (V_uu = true)) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))) & ~ (((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~
  (V_zz = e_ii)) & (V_zz = e_hh)) & (V_uu = false)) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false)) & (~
  $lesseq($sum($difference($difference($sum(V_yy,1),V_bbee),1),1),V_bbff)
  & (e_gg = e_ii))) & ($sum(V_yy,1) = V_bbee))) & ~ (((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & (V_zz = e_gg)) & ~
  ((((V_uu = false) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~
  ((((V_uu = true) & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & ~
  ((((V_uu = true) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~
  ((((V_uu = false) & (V_vv = true)) & (V_ww = false)) & (V_xx = false)))
  & (e_gg = e_bb)) & ($sum(V_yy,1) = V_bbee))) & ~ ((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & (V_zz = e_gg))
  & (V_uu = false)) & (V_vv = true)) & (V_ww = false)) & (V_xx = false))
  & ($lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh) | ((~
  $lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)
  & (e_gg = e_bb)) & ($sum(V_yy,1) = V_bbee))))) & ~ ((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & (V_zz = e_gg))
  & (V_uu = true)) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))
  & ($lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh) | ((~
  $lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)
  & (e_gg = e_bb)) & ($sum(V_yy,1) = V_bbee))))) & ~ ((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & (V_zz = e_gg))
  & (V_uu = true)) & (V_vv = true)) & (V_ww = false)) & (V_xx = false))
  & ($lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh) | ((~
  $lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)
  & (e_gg = e_bb)) & ($sum(V_yy,1) = V_bbee))))) & ~ (((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & (V_zz = e_gg))
  & (V_uu = false)) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))
  & (($lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)
  & (e_gg = e_hh)) | (~
  $lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)
  & (e_gg = e_bb)))) & ($sum(V_yy,1) = V_bbee))) & ~ (((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & (V_zz = e_gg))
  & (e_gg = e_bb)) & ($sum(V_yy,1) = V_bbee)) & ~ ((((V_uu = false)
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = true)
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & ~ ((((V_uu = true)
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = false)
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false)))) & ~ (((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & (V_zz = e_gg))
  & (e_gg = e_bb)) & ($sum(V_yy,1) = V_bbee)) & (V_uu = false))
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & ~ (((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & (V_zz = e_gg))
  & (e_gg = e_bb)) & ($sum(V_yy,1) = V_bbee)) & (V_uu = true))
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~ (((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & (V_zz = e_gg))
  & (e_gg = e_bb)) & ($sum(V_yy,1) = V_bbee)) & (V_uu = true))
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & ~ (((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & (V_zz = e_gg))
  & (e_gg = e_bb)) & ($sum(V_yy,1) = V_bbee)) & (V_uu = false))
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~ (((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & (V_zz = e_ff)) & ~
  ((((V_uu = false) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~
  ((((V_uu = true) & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & ~
  ((((V_uu = true) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~
  ((((V_uu = false) & (V_vv = true)) & (V_ww = false)) & (V_xx = false)))
  & (e_gg = e_bb)) & ($sum(V_yy,1) = V_bbee))) & ~ (((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & (V_zz = e_ff))
  & (V_uu = true)) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))
  & (e_gg = e_bb)) & ($sum(V_yy,1) = V_bbee))) & ~ (((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & (V_zz = e_ff))
  & (V_uu = true)) & (V_vv = true)) & (V_ww = false)) & (V_xx = false))
  & (e_gg = e_bb)) & ($sum(V_yy,1) = V_bbee))) & ~ (((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff)) & (V_zz = e_ee)) & ~
  ((((V_uu = false) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~
  ((((V_uu = true) & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & ~
  ((((V_uu = true) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~
  ((((V_uu = false) & (V_vv = true)) & (V_ww = false)) & (V_xx = false)))
  & (e_gg = e_bb)) & ($sum(V_yy,1) = V_bbee))) & ~ (((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff)) & (V_zz = e_ee))
  & (V_uu = false)) & (V_vv = true)) & (V_ww = false)) & (V_xx = false))
  & (($lesseq($sum($difference($difference($sum(V_bbcc,1),V_bbbb),1),1),V_bbii)
  & ((V_bbcc = $sum(V_yy,1)) & (e_gg = e_ee))) | (~
  $lesseq($sum($difference($difference($sum(V_bbcc,1),V_bbbb),1),1),V_bbii)
  & ((V_bbdd = $sum(V_yy,1)) & (e_gg = e_ff))))) & ($sum(V_yy,1) = V_bbee)))
  & ~ ((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff))
  & (V_zz = e_ee)) & (V_uu = true)) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false)) & (V_bbdd = V_bbcc))) & ~ (((((((((((((~ (V_zz = e_bb)
  & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh))
  & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff)) & (V_zz = e_ee)) & (V_uu = true))
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false))
  & (($lesseq($sum($difference($difference($sum(V_bbcc,1),V_bbbb),1),1),V_bbii)
  & ((V_bbcc = $sum(V_yy,1)) & (e_gg = e_ee))) | (~
  $lesseq($sum($difference($difference($sum(V_bbcc,1),V_bbbb),1),1),V_bbii)
  & (e_gg = e_bb)))) & ($sum(V_yy,1) = V_bbee))) & ~ (((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ee)) & (V_zz = e_dd)) & ~
  ((((V_uu = false) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~
  ((((V_uu = true) & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & ~
  ((((V_uu = true) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~
  ((((V_uu = false) & (V_vv = true)) & (V_ww = false)) & (V_xx = false)))
  & (e_gg = e_bb)) & ($sum(V_yy,1) = V_bbee))) & ~ ((((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ee)) & (V_zz = e_dd))
  & (V_uu = false)) & (V_vv = true)) & (V_ww = false)) & (V_xx = false))
  & (V_bbcc = $sum(V_yy,1))) & (e_gg = e_ee)) & ($sum(V_yy,1) = V_bbee))) & ~
  (((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ee))
  & (V_zz = e_dd)) & (V_uu = true)) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false)) & (V_bbcc = V_bbbb)) & (V_bbdd = V_bbbb))) & ~
  ((((((((((((~ (V_zz = e_ii) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_dd)) & (V_zz = e_cc))
  & ($sum(V_yy,1) = V_bbee)) & ~ ((((V_uu = false) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = false) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false))) & (e_gg = e_bb))) & ~ ((((((((((((~
  (V_zz = e_ii) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_dd)) & (V_zz = e_cc))
  & ($sum(V_yy,1) = V_bbee)) & (V_uu = false)) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false)) & (e_gg = e_bb))) & ~ ((((((((((((~
  (V_zz = e_ii) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_dd)) & (V_zz = e_cc))
  & ($sum(V_yy,1) = V_bbee)) & (V_uu = true)) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false)) & (e_gg = e_bb))) & ~ ((((((((((((~
  (V_zz = e_ii) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_dd)) & (V_zz = e_cc))
  & ($sum(V_yy,1) = V_bbee)) & (V_uu = true)) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false))
  & ($lesseq(V_bbjj,$difference($sum(V_yy,1),V_bbaa)) & ((e_gg = e_dd)
  & (V_bbbb = $sum(V_yy,1)))))))).

tff(f78, type, f78: (enum_aa * $int * bool * bool * bool * bool * $int *
  $int * $int * $int * $int * enum_aa * $int * bool * bool * bool * bool *
  $int * $int * $int * $int * $int * $int * $int * $int * set($int) *
  set($int) * set($int) * set($int) * $int * $int * $int * $int * $int *
  $int * $int * $int * $int * $int * $int * $int) > $o).

tff(f78_def, axiom, ![V_zz:enum_aa, V_yy:$int, V_xx:bool, V_ww:bool, V_vv:
  bool, V_uu:bool, V_tt:$int, V_ss:$int, V_rr:$int, V_qq:$int, V_pp:$int,
  V_oo:enum_aa, V_nn:$int, V_mm:bool, V_ll:bool, V_kk:bool, V_jj:bool,
  V_bbxx:$int, V_bbww:$int, V_bbvv:$int, V_bbuu:$int, V_bbtt:$int, V_bbss:
  $int, V_bbrr:$int, V_bbqq:$int, V_bbpp:set($int), V_bboo:set($int), V_bbnn:
  set($int), V_bbmm:set($int), V_bbll:$int, V_bbkk:$int, V_bbjj:$int, V_bbii:
  $int, V_bbhh:$int, V_bbgg:$int, V_bbff:$int, V_bbee:$int, V_bbdd:$int,
  V_bbcc:$int, V_bbbb:$int, V_bbaa:$int]: (f78(V_zz, V_yy, V_xx, V_ww, V_vv,
  V_uu, V_tt, V_ss, V_rr, V_qq, V_pp, V_oo, V_nn, V_mm, V_ll, V_kk, V_jj,
  V_bbxx, V_bbww, V_bbvv, V_bbuu, V_bbtt, V_bbss, V_bbrr, V_bbqq, V_bbpp,
  V_bboo, V_bbnn, V_bbmm, V_bbll, V_bbkk, V_bbjj, V_bbii, V_bbhh, V_bbgg,
  V_bbff, V_bbee, V_bbdd, V_bbcc, V_bbbb, V_bbaa)
  <=> ((((((((((((((((((((((((((((((((((((((((((((((((($true & ~
  (V_zz = e_bb)) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ii)) & (V_zz = e_hh))
  & (V_uu = true)) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))
  & mem($int, $sum(V_yy,1), integer)) & $lesseq(0,$sum(V_yy,1))) & $true) & ~
  (((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_hh))
  & (V_zz = e_ii)) & ($sum(V_yy,1) = V_bbee)) & ~ ((((V_uu = false)
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = true)
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & ~ ((((V_uu = true)
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = false)
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & (e_gg = e_bb))) & ~
  (((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_hh))
  & (V_zz = e_ii)) & ($sum(V_yy,1) = V_bbee)) & (V_uu = false))
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false)) & (e_gg = e_bb))) & ~
  (((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_hh))
  & (V_zz = e_ii)) & ($sum(V_yy,1) = V_bbee)) & (V_uu = true))
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false)) & (e_gg = e_bb))) & ~
  (((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_hh))
  & (V_zz = e_ii)) & ($sum(V_yy,1) = V_bbee)) & (V_uu = true))
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false)) & (e_gg = e_bb))) & ~
  (((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_hh))
  & (V_zz = e_ii)) & ($sum(V_yy,1) = V_bbee)) & (V_uu = false))
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false)) & (~
  $lesseq($sum($difference(V_yy,V_bbee),1),$sum(V_bbff,V_bbgg))
  & (e_gg = e_bb)))) & ~ (((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~
  (V_zz = e_ii)) & (V_zz = e_hh)) & ~ ((((V_uu = false) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = false) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false))) & (e_gg = e_bb))
  & ($sum(V_yy,1) = V_bbee))) & ~ (((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ii)) & (V_zz = e_hh)) & (V_uu = false))
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & ~ (((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ii)) & (V_zz = e_hh))
  & (V_uu = true)) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~
  (((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ii))
  & (V_zz = e_hh)) & (V_uu = true)) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))) & ~ (((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~
  (V_zz = e_ii)) & (V_zz = e_hh)) & (V_uu = false)) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false)) & (~
  $lesseq($sum($difference($difference($sum(V_yy,1),V_bbee),1),1),V_bbff)
  & (e_gg = e_ii))) & ($sum(V_yy,1) = V_bbee))) & ~ (((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & (V_zz = e_gg)) & ~
  ((((V_uu = false) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~
  ((((V_uu = true) & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & ~
  ((((V_uu = true) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~
  ((((V_uu = false) & (V_vv = true)) & (V_ww = false)) & (V_xx = false)))
  & (e_gg = e_bb)) & ($sum(V_yy,1) = V_bbee))) & ~ ((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & (V_zz = e_gg))
  & (V_uu = false)) & (V_vv = true)) & (V_ww = false)) & (V_xx = false))
  & ($lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh) | ((~
  $lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)
  & (e_gg = e_bb)) & ($sum(V_yy,1) = V_bbee))))) & ~ ((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & (V_zz = e_gg))
  & (V_uu = true)) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))
  & ($lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh) | ((~
  $lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)
  & (e_gg = e_bb)) & ($sum(V_yy,1) = V_bbee))))) & ~ ((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & (V_zz = e_gg))
  & (V_uu = true)) & (V_vv = true)) & (V_ww = false)) & (V_xx = false))
  & ($lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh) | ((~
  $lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)
  & (e_gg = e_bb)) & ($sum(V_yy,1) = V_bbee))))) & ~ (((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & (V_zz = e_gg))
  & (V_uu = false)) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))
  & (($lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)
  & (e_gg = e_hh)) | (~
  $lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)
  & (e_gg = e_bb)))) & ($sum(V_yy,1) = V_bbee))) & ~ (((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & (V_zz = e_gg))
  & (e_gg = e_bb)) & ($sum(V_yy,1) = V_bbee)) & ~ ((((V_uu = false)
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = true)
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & ~ ((((V_uu = true)
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = false)
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false)))) & ~ (((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & (V_zz = e_gg))
  & (e_gg = e_bb)) & ($sum(V_yy,1) = V_bbee)) & (V_uu = false))
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & ~ (((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & (V_zz = e_gg))
  & (e_gg = e_bb)) & ($sum(V_yy,1) = V_bbee)) & (V_uu = true))
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~ (((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & (V_zz = e_gg))
  & (e_gg = e_bb)) & ($sum(V_yy,1) = V_bbee)) & (V_uu = true))
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & ~ (((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & (V_zz = e_gg))
  & (e_gg = e_bb)) & ($sum(V_yy,1) = V_bbee)) & (V_uu = false))
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~ (((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & (V_zz = e_ff)) & ~
  ((((V_uu = false) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~
  ((((V_uu = true) & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & ~
  ((((V_uu = true) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~
  ((((V_uu = false) & (V_vv = true)) & (V_ww = false)) & (V_xx = false)))
  & (e_gg = e_bb)) & ($sum(V_yy,1) = V_bbee))) & ~ (((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & (V_zz = e_ff))
  & (V_uu = true)) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))
  & (e_gg = e_bb)) & ($sum(V_yy,1) = V_bbee))) & ~ (((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & (V_zz = e_ff))
  & (V_uu = true)) & (V_vv = true)) & (V_ww = false)) & (V_xx = false))
  & (e_gg = e_bb)) & ($sum(V_yy,1) = V_bbee))) & ~ (((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff)) & (V_zz = e_ee)) & ~
  ((((V_uu = false) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~
  ((((V_uu = true) & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & ~
  ((((V_uu = true) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~
  ((((V_uu = false) & (V_vv = true)) & (V_ww = false)) & (V_xx = false)))
  & (e_gg = e_bb)) & ($sum(V_yy,1) = V_bbee))) & ~ (((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff)) & (V_zz = e_ee))
  & (V_uu = false)) & (V_vv = true)) & (V_ww = false)) & (V_xx = false))
  & (($lesseq($sum($difference($difference($sum(V_bbcc,1),V_bbbb),1),1),V_bbii)
  & ((V_bbcc = $sum(V_yy,1)) & (e_gg = e_ee))) | (~
  $lesseq($sum($difference($difference($sum(V_bbcc,1),V_bbbb),1),1),V_bbii)
  & ((V_bbdd = $sum(V_yy,1)) & (e_gg = e_ff))))) & ($sum(V_yy,1) = V_bbee)))
  & ~ ((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff))
  & (V_zz = e_ee)) & (V_uu = true)) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false)) & (V_bbdd = V_bbcc))) & ~ (((((((((((((~ (V_zz = e_bb)
  & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh))
  & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff)) & (V_zz = e_ee)) & (V_uu = true))
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false))
  & (($lesseq($sum($difference($difference($sum(V_bbcc,1),V_bbbb),1),1),V_bbii)
  & ((V_bbcc = $sum(V_yy,1)) & (e_gg = e_ee))) | (~
  $lesseq($sum($difference($difference($sum(V_bbcc,1),V_bbbb),1),1),V_bbii)
  & (e_gg = e_bb)))) & ($sum(V_yy,1) = V_bbee))) & ~ (((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ee)) & (V_zz = e_dd)) & ~
  ((((V_uu = false) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~
  ((((V_uu = true) & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & ~
  ((((V_uu = true) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~
  ((((V_uu = false) & (V_vv = true)) & (V_ww = false)) & (V_xx = false)))
  & (e_gg = e_bb)) & ($sum(V_yy,1) = V_bbee))) & ~ ((((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ee)) & (V_zz = e_dd))
  & (V_uu = false)) & (V_vv = true)) & (V_ww = false)) & (V_xx = false))
  & (V_bbcc = $sum(V_yy,1))) & (e_gg = e_ee)) & ($sum(V_yy,1) = V_bbee))) & ~
  (((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ee))
  & (V_zz = e_dd)) & (V_uu = true)) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false)) & (V_bbcc = V_bbbb)) & (V_bbdd = V_bbbb))) & ~
  ((((((((((((~ (V_zz = e_ii) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_dd)) & (V_zz = e_cc))
  & ($sum(V_yy,1) = V_bbee)) & ~ ((((V_uu = false) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = false) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false))) & (e_gg = e_bb))) & ~ ((((((((((((~
  (V_zz = e_ii) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_dd)) & (V_zz = e_cc))
  & ($sum(V_yy,1) = V_bbee)) & (V_uu = false)) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false)) & (e_gg = e_bb))) & ~ ((((((((((((~
  (V_zz = e_ii) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_dd)) & (V_zz = e_cc))
  & ($sum(V_yy,1) = V_bbee)) & (V_uu = true)) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false)) & (e_gg = e_bb))) & ~ ((((((((((((~
  (V_zz = e_ii) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_dd)) & (V_zz = e_cc))
  & ($sum(V_yy,1) = V_bbee)) & (V_uu = true)) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false))
  & ($lesseq(V_bbjj,$difference($sum(V_yy,1),V_bbaa)) & ((e_gg = e_dd)
  & (V_bbbb = $sum(V_yy,1)))))))).

tff(f79, type, f79: (enum_aa * $int * bool * bool * bool * bool * $int *
  $int * $int * $int * $int * enum_aa * $int * bool * bool * bool * bool *
  $int * $int * $int * $int * $int * $int * $int * $int * set($int) *
  set($int) * set($int) * set($int) * $int * $int * $int * $int * $int *
  $int * $int * $int * $int * $int * $int * $int) > $o).

tff(f79_def, axiom, ![V_zz:enum_aa, V_yy:$int, V_xx:bool, V_ww:bool, V_vv:
  bool, V_uu:bool, V_tt:$int, V_ss:$int, V_rr:$int, V_qq:$int, V_pp:$int,
  V_oo:enum_aa, V_nn:$int, V_mm:bool, V_ll:bool, V_kk:bool, V_jj:bool,
  V_bbxx:$int, V_bbww:$int, V_bbvv:$int, V_bbuu:$int, V_bbtt:$int, V_bbss:
  $int, V_bbrr:$int, V_bbqq:$int, V_bbpp:set($int), V_bboo:set($int), V_bbnn:
  set($int), V_bbmm:set($int), V_bbll:$int, V_bbkk:$int, V_bbjj:$int, V_bbii:
  $int, V_bbhh:$int, V_bbgg:$int, V_bbff:$int, V_bbee:$int, V_bbdd:$int,
  V_bbcc:$int, V_bbbb:$int, V_bbaa:$int]: (f79(V_zz, V_yy, V_xx, V_ww, V_vv,
  V_uu, V_tt, V_ss, V_rr, V_qq, V_pp, V_oo, V_nn, V_mm, V_ll, V_kk, V_jj,
  V_bbxx, V_bbww, V_bbvv, V_bbuu, V_bbtt, V_bbss, V_bbrr, V_bbqq, V_bbpp,
  V_bboo, V_bbnn, V_bbmm, V_bbll, V_bbkk, V_bbjj, V_bbii, V_bbhh, V_bbgg,
  V_bbff, V_bbee, V_bbdd, V_bbcc, V_bbbb, V_bbaa)
  <=> ((((((((((((((((((((((((((((((((((((((((((((((((($true & ~
  (V_zz = e_bb)) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ii)) & (V_zz = e_hh))
  & (V_uu = false)) & (V_vv = true)) & (V_ww = false)) & (V_xx = false))
  & mem($int, $sum(V_yy,1), integer)) & $lesseq(0,$sum(V_yy,1))) & $true) & ~
  (((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_hh))
  & (V_zz = e_ii)) & ($sum(V_yy,1) = V_bbee)) & ~ ((((V_uu = false)
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = true)
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & ~ ((((V_uu = true)
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = false)
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & (e_gg = e_bb))) & ~
  (((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_hh))
  & (V_zz = e_ii)) & ($sum(V_yy,1) = V_bbee)) & (V_uu = false))
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false)) & (e_gg = e_bb))) & ~
  (((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_hh))
  & (V_zz = e_ii)) & ($sum(V_yy,1) = V_bbee)) & (V_uu = true))
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false)) & (e_gg = e_bb))) & ~
  (((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_hh))
  & (V_zz = e_ii)) & ($sum(V_yy,1) = V_bbee)) & (V_uu = true))
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false)) & (e_gg = e_bb))) & ~
  (((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_hh))
  & (V_zz = e_ii)) & ($sum(V_yy,1) = V_bbee)) & (V_uu = false))
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false)) & (~
  $lesseq($sum($difference(V_yy,V_bbee),1),$sum(V_bbff,V_bbgg))
  & (e_gg = e_bb)))) & ~ (((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~
  (V_zz = e_ii)) & (V_zz = e_hh)) & ~ ((((V_uu = false) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = false) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false))) & (e_gg = e_bb))
  & ($sum(V_yy,1) = V_bbee))) & ~ (((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ii)) & (V_zz = e_hh)) & (V_uu = false))
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & ~ (((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ii)) & (V_zz = e_hh))
  & (V_uu = true)) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~
  (((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ii))
  & (V_zz = e_hh)) & (V_uu = true)) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))) & ~ (((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~
  (V_zz = e_ii)) & (V_zz = e_hh)) & (V_uu = false)) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false)) & (~
  $lesseq($sum($difference($difference($sum(V_yy,1),V_bbee),1),1),V_bbff)
  & (e_gg = e_ii))) & ($sum(V_yy,1) = V_bbee))) & ~ (((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & (V_zz = e_gg)) & ~
  ((((V_uu = false) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~
  ((((V_uu = true) & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & ~
  ((((V_uu = true) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~
  ((((V_uu = false) & (V_vv = true)) & (V_ww = false)) & (V_xx = false)))
  & (e_gg = e_bb)) & ($sum(V_yy,1) = V_bbee))) & ~ ((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & (V_zz = e_gg))
  & (V_uu = false)) & (V_vv = true)) & (V_ww = false)) & (V_xx = false))
  & ($lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh) | ((~
  $lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)
  & (e_gg = e_bb)) & ($sum(V_yy,1) = V_bbee))))) & ~ ((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & (V_zz = e_gg))
  & (V_uu = true)) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))
  & ($lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh) | ((~
  $lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)
  & (e_gg = e_bb)) & ($sum(V_yy,1) = V_bbee))))) & ~ ((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & (V_zz = e_gg))
  & (V_uu = true)) & (V_vv = true)) & (V_ww = false)) & (V_xx = false))
  & ($lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh) | ((~
  $lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)
  & (e_gg = e_bb)) & ($sum(V_yy,1) = V_bbee))))) & ~ (((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & (V_zz = e_gg))
  & (V_uu = false)) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))
  & (($lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)
  & (e_gg = e_hh)) | (~
  $lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)
  & (e_gg = e_bb)))) & ($sum(V_yy,1) = V_bbee))) & ~ (((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & (V_zz = e_gg))
  & (e_gg = e_bb)) & ($sum(V_yy,1) = V_bbee)) & ~ ((((V_uu = false)
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = true)
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & ~ ((((V_uu = true)
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = false)
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false)))) & ~ (((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & (V_zz = e_gg))
  & (e_gg = e_bb)) & ($sum(V_yy,1) = V_bbee)) & (V_uu = false))
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & ~ (((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & (V_zz = e_gg))
  & (e_gg = e_bb)) & ($sum(V_yy,1) = V_bbee)) & (V_uu = true))
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~ (((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & (V_zz = e_gg))
  & (e_gg = e_bb)) & ($sum(V_yy,1) = V_bbee)) & (V_uu = true))
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & ~ (((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & (V_zz = e_gg))
  & (e_gg = e_bb)) & ($sum(V_yy,1) = V_bbee)) & (V_uu = false))
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~ (((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & (V_zz = e_ff)) & ~
  ((((V_uu = false) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~
  ((((V_uu = true) & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & ~
  ((((V_uu = true) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~
  ((((V_uu = false) & (V_vv = true)) & (V_ww = false)) & (V_xx = false)))
  & (e_gg = e_bb)) & ($sum(V_yy,1) = V_bbee))) & ~ (((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & (V_zz = e_ff))
  & (V_uu = true)) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))
  & (e_gg = e_bb)) & ($sum(V_yy,1) = V_bbee))) & ~ (((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & (V_zz = e_ff))
  & (V_uu = true)) & (V_vv = true)) & (V_ww = false)) & (V_xx = false))
  & (e_gg = e_bb)) & ($sum(V_yy,1) = V_bbee))) & ~ (((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff)) & (V_zz = e_ee)) & ~
  ((((V_uu = false) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~
  ((((V_uu = true) & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & ~
  ((((V_uu = true) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~
  ((((V_uu = false) & (V_vv = true)) & (V_ww = false)) & (V_xx = false)))
  & (e_gg = e_bb)) & ($sum(V_yy,1) = V_bbee))) & ~ (((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff)) & (V_zz = e_ee))
  & (V_uu = false)) & (V_vv = true)) & (V_ww = false)) & (V_xx = false))
  & (($lesseq($sum($difference($difference($sum(V_bbcc,1),V_bbbb),1),1),V_bbii)
  & ((V_bbcc = $sum(V_yy,1)) & (e_gg = e_ee))) | (~
  $lesseq($sum($difference($difference($sum(V_bbcc,1),V_bbbb),1),1),V_bbii)
  & ((V_bbdd = $sum(V_yy,1)) & (e_gg = e_ff))))) & ($sum(V_yy,1) = V_bbee)))
  & ~ ((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff))
  & (V_zz = e_ee)) & (V_uu = true)) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false)) & (V_bbdd = V_bbcc))) & ~ (((((((((((((~ (V_zz = e_bb)
  & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh))
  & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff)) & (V_zz = e_ee)) & (V_uu = true))
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false))
  & (($lesseq($sum($difference($difference($sum(V_bbcc,1),V_bbbb),1),1),V_bbii)
  & ((V_bbcc = $sum(V_yy,1)) & (e_gg = e_ee))) | (~
  $lesseq($sum($difference($difference($sum(V_bbcc,1),V_bbbb),1),1),V_bbii)
  & (e_gg = e_bb)))) & ($sum(V_yy,1) = V_bbee))) & ~ (((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ee)) & (V_zz = e_dd)) & ~
  ((((V_uu = false) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~
  ((((V_uu = true) & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & ~
  ((((V_uu = true) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~
  ((((V_uu = false) & (V_vv = true)) & (V_ww = false)) & (V_xx = false)))
  & (e_gg = e_bb)) & ($sum(V_yy,1) = V_bbee))) & ~ ((((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ee)) & (V_zz = e_dd))
  & (V_uu = false)) & (V_vv = true)) & (V_ww = false)) & (V_xx = false))
  & (V_bbcc = $sum(V_yy,1))) & (e_gg = e_ee)) & ($sum(V_yy,1) = V_bbee))) & ~
  (((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ee))
  & (V_zz = e_dd)) & (V_uu = true)) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false)) & (V_bbcc = V_bbbb)) & (V_bbdd = V_bbbb))) & ~
  ((((((((((((~ (V_zz = e_ii) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_dd)) & (V_zz = e_cc))
  & ($sum(V_yy,1) = V_bbee)) & ~ ((((V_uu = false) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = false) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false))) & (e_gg = e_bb))) & ~ ((((((((((((~
  (V_zz = e_ii) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_dd)) & (V_zz = e_cc))
  & ($sum(V_yy,1) = V_bbee)) & (V_uu = false)) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false)) & (e_gg = e_bb))) & ~ ((((((((((((~
  (V_zz = e_ii) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_dd)) & (V_zz = e_cc))
  & ($sum(V_yy,1) = V_bbee)) & (V_uu = true)) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false)) & (e_gg = e_bb))) & ~ ((((((((((((~
  (V_zz = e_ii) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_dd)) & (V_zz = e_cc))
  & ($sum(V_yy,1) = V_bbee)) & (V_uu = true)) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false))
  & ($lesseq(V_bbjj,$difference($sum(V_yy,1),V_bbaa)) & ((e_gg = e_dd)
  & (V_bbbb = $sum(V_yy,1)))))))).

tff(f80, type, f80: (enum_aa * $int * bool * bool * bool * bool * $int *
  $int * $int * $int * $int * enum_aa * $int * bool * bool * bool * bool *
  $int * $int * $int * $int * $int * $int * $int * $int * set($int) *
  set($int) * set($int) * set($int) * $int * $int * $int * $int * $int *
  $int * $int * $int * $int * $int * $int * $int) > $o).

tff(f80_def, axiom, ![V_zz:enum_aa, V_yy:$int, V_xx:bool, V_ww:bool, V_vv:
  bool, V_uu:bool, V_tt:$int, V_ss:$int, V_rr:$int, V_qq:$int, V_pp:$int,
  V_oo:enum_aa, V_nn:$int, V_mm:bool, V_ll:bool, V_kk:bool, V_jj:bool,
  V_bbxx:$int, V_bbww:$int, V_bbvv:$int, V_bbuu:$int, V_bbtt:$int, V_bbss:
  $int, V_bbrr:$int, V_bbqq:$int, V_bbpp:set($int), V_bboo:set($int), V_bbnn:
  set($int), V_bbmm:set($int), V_bbll:$int, V_bbkk:$int, V_bbjj:$int, V_bbii:
  $int, V_bbhh:$int, V_bbgg:$int, V_bbff:$int, V_bbee:$int, V_bbdd:$int,
  V_bbcc:$int, V_bbbb:$int, V_bbaa:$int]: (f80(V_zz, V_yy, V_xx, V_ww, V_vv,
  V_uu, V_tt, V_ss, V_rr, V_qq, V_pp, V_oo, V_nn, V_mm, V_ll, V_kk, V_jj,
  V_bbxx, V_bbww, V_bbvv, V_bbuu, V_bbtt, V_bbss, V_bbrr, V_bbqq, V_bbpp,
  V_bboo, V_bbnn, V_bbmm, V_bbll, V_bbkk, V_bbjj, V_bbii, V_bbhh, V_bbgg,
  V_bbff, V_bbee, V_bbdd, V_bbcc, V_bbbb, V_bbaa)
  <=> ((((((((((((((((((((((((((((((((((((((((((((((((((($true & ~
  (V_zz = e_bb)) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ii)) & ~ ((((V_uu = false)
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = true)
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & ~ ((((V_uu = true)
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = false)
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & (V_zz = e_hh))
  & mem($int, $sum(V_yy,1), integer)) & $lesseq(0,$sum(V_yy,1))) & $true) & ~
  (((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_hh))
  & (V_zz = e_ii)) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false)))) & ~ (((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~
  (V_zz = e_hh)) & (V_zz = e_ii)) & (V_uu = false)) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false))) & ~ (((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_hh)) & (V_zz = e_ii)) & (V_uu = true))
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~ (((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_hh)) & (V_zz = e_ii))
  & (V_uu = true)) & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & ~
  ((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_hh))
  & (V_zz = e_ii)) & (V_uu = false)) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false)) & ~
  $lesseq($sum($difference(V_yy,V_bbee),1),$sum(V_bbff,V_bbgg)))) & ~
  (((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ii))
  & (V_zz = e_hh)) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false)))) & ~ (((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~
  (V_zz = e_ii)) & (V_zz = e_hh)) & (V_uu = false)) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false)) & (e_bb = e_gg))
  & (V_bbee = $sum(V_yy,1)))) & ~ (((((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ii)) & (V_zz = e_hh)) & (V_uu = true))
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false)) & (e_bb = e_gg))
  & (V_bbee = $sum(V_yy,1)))) & ~ (((((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ii)) & (V_zz = e_hh)) & (V_uu = true))
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false)) & (e_bb = e_gg))
  & (V_bbee = $sum(V_yy,1)))) & ~ ((((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ii)) & (V_zz = e_hh)) & (V_uu = false))
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false)) & (~
  $lesseq($sum($difference($difference($sum(V_yy,1),V_bbee),1),1),V_bbff)
  & (e_bb = e_ii)))) & ~ (((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & (V_zz = e_gg)) & ~ ((((V_uu = false) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = false) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false)))) & ~ ((((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & (V_zz = e_gg)) & (V_uu = false))
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false))
  & (($lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)
  & ((e_bb = e_gg) & (V_bbee = $sum(V_yy,1)))) | ~
  $lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)))) & ~
  ((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh))
  & (V_zz = e_gg)) & (V_uu = true)) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))
  & (($lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)
  & ((e_bb = e_gg) & (V_bbee = $sum(V_yy,1)))) | ~
  $lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)))) & ~
  ((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh))
  & (V_zz = e_gg)) & (V_uu = true)) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))
  & (($lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)
  & ((e_bb = e_gg) & (V_bbee = $sum(V_yy,1)))) | ~
  $lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)))) & ~
  ((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh))
  & (V_zz = e_gg)) & (V_uu = false)) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))
  & (($lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)
  & (e_bb = e_hh)) | ~
  $lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)))) & ~
  (((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh))
  & (V_zz = e_gg)) & (V_uu = false)) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))) & ~ (((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & (V_zz = e_gg)) & (V_uu = true)) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false))) & ~ (((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & (V_zz = e_gg)) & (V_uu = true))
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & ~ (((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & (V_zz = e_gg))
  & (V_uu = false)) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~
  (((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg))
  & (V_zz = e_ff)) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false)))) & ~ (((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~
  (V_zz = e_gg)) & (V_zz = e_ff)) & (V_uu = true)) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false))) & ~ (((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & ~ (V_zz = e_gg)) & (V_zz = e_ff)) & (V_uu = true))
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & ~ (((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & (V_zz = e_ff))
  & (V_uu = false)) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))
  & (e_bb = e_gg)) & (V_bbee = V_yy))) & ~ (((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ff)) & (V_zz = e_ee)) & ~ ((((V_uu = false)
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = true)
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & ~ ((((V_uu = true)
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = false)
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false)))) & ~ ((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff)) & (V_zz = e_ee))
  & (V_uu = false)) & (V_vv = true)) & (V_ww = false)) & (V_xx = false))
  & (($lesseq($sum($difference($difference($sum(V_bbcc,1),V_bbbb),1),1),V_bbii)
  & ((V_bbcc = $sum(V_yy,1)) & (e_bb = e_ee))) | (~
  $lesseq($sum($difference($difference($sum(V_bbcc,1),V_bbbb),1),1),V_bbii)
  & ((V_bbdd = $sum(V_yy,1)) & (e_bb = e_ff)))))) & ~ ((((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff)) & (V_zz = e_ee))
  & (V_uu = true)) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))
  & (e_bb = e_gg)) & (V_bbdd = V_bbcc)) & (V_bbee = $sum(V_yy,1)))) & ~
  ((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff))
  & (V_zz = e_ee)) & (V_uu = true)) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))
  & (($lesseq($sum($difference($difference($sum(V_bbcc,1),V_bbbb),1),1),V_bbii)
  & ((V_bbcc = $sum(V_yy,1)) & (e_bb = e_ee))) | ~
  $lesseq($sum($difference($difference($sum(V_bbcc,1),V_bbbb),1),1),V_bbii))))
  & ~ ((((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff))
  & (V_zz = e_ee)) & (V_uu = false)) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false)) & (e_bb = e_gg)) & (V_bbdd = V_bbcc)) & (V_bbee = V_yy)))
  & ~ (((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ee))
  & (V_zz = e_dd)) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false)))) & ~ (((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_ee)) & (V_zz = e_dd)) & (V_uu = false)) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false)) & (V_bbcc = $sum(V_yy,1)))
  & (e_bb = e_ee))) & ~ (((((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_ee)) & (V_zz = e_dd)) & (V_uu = true)) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false)) & (e_bb = e_gg)) & (V_bbcc = V_bbbb))
  & (V_bbdd = V_bbbb)) & (V_bbee = $sum(V_yy,1)))) & ~ (((((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ee)) & (V_zz = e_dd))
  & (V_uu = false)) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))
  & (e_bb = e_gg)) & (V_bbcc = V_bbbb)) & (V_bbdd = V_bbbb))
  & (V_bbee = V_yy))) & ~ ((((((((((~ (V_zz = e_ii) & ~ (V_zz = e_hh)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_dd))
  & (V_zz = e_cc)) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false)))) & ~ ((((((((((~ (V_zz = e_ii) & ~ (V_zz = e_hh)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_dd))
  & (V_zz = e_cc)) & (V_uu = false)) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))) & ~ ((((((((((~ (V_zz = e_ii) & ~ (V_zz = e_hh)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_dd))
  & (V_zz = e_cc)) & (V_uu = true)) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ (((((((((((~ (V_zz = e_ii) & ~ (V_zz = e_hh)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_dd))
  & (V_zz = e_cc)) & (V_uu = true)) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false)) & ($lesseq(V_bbjj,$difference($sum(V_yy,1),V_bbaa))
  & ((e_bb = e_dd) & (V_bbbb = $sum(V_yy,1)))))))).

tff(f81, type, f81: (enum_aa * $int * bool * bool * bool * bool * $int *
  $int * $int * $int * $int * enum_aa * $int * bool * bool * bool * bool *
  $int * $int * $int * $int * $int * $int * $int * $int * set($int) *
  set($int) * set($int) * set($int) * $int * $int * $int * $int * $int *
  $int * $int * $int * $int * $int * $int * $int) > $o).

tff(f81_def, axiom, ![V_zz:enum_aa, V_yy:$int, V_xx:bool, V_ww:bool, V_vv:
  bool, V_uu:bool, V_tt:$int, V_ss:$int, V_rr:$int, V_qq:$int, V_pp:$int,
  V_oo:enum_aa, V_nn:$int, V_mm:bool, V_ll:bool, V_kk:bool, V_jj:bool,
  V_bbxx:$int, V_bbww:$int, V_bbvv:$int, V_bbuu:$int, V_bbtt:$int, V_bbss:
  $int, V_bbrr:$int, V_bbqq:$int, V_bbpp:set($int), V_bboo:set($int), V_bbnn:
  set($int), V_bbmm:set($int), V_bbll:$int, V_bbkk:$int, V_bbjj:$int, V_bbii:
  $int, V_bbhh:$int, V_bbgg:$int, V_bbff:$int, V_bbee:$int, V_bbdd:$int,
  V_bbcc:$int, V_bbbb:$int, V_bbaa:$int]: (f81(V_zz, V_yy, V_xx, V_ww, V_vv,
  V_uu, V_tt, V_ss, V_rr, V_qq, V_pp, V_oo, V_nn, V_mm, V_ll, V_kk, V_jj,
  V_bbxx, V_bbww, V_bbvv, V_bbuu, V_bbtt, V_bbss, V_bbrr, V_bbqq, V_bbpp,
  V_bboo, V_bbnn, V_bbmm, V_bbll, V_bbkk, V_bbjj, V_bbii, V_bbhh, V_bbgg,
  V_bbff, V_bbee, V_bbdd, V_bbcc, V_bbbb, V_bbaa)
  <=> (((((((((((((((((((((((((((((((((((((((((((((((((((((($true & ~
  (V_zz = e_bb)) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_hh))
  & $lesseq($sum($difference(V_yy,V_bbee),1),$sum(V_bbff,V_bbgg)))
  & (V_zz = e_ii)) & (V_uu = false)) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false)) & mem($int, $sum(V_yy,1), integer))
  & $lesseq(0,$sum(V_yy,1))) & ~ (((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc))
  & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_gg))
  & ~ (V_zz = e_hh)) & ~ (V_zz = e_ii))) & ~ ((((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_hh)) & (V_zz = e_ii)) & ~ ((((V_uu = false)
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = true)
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & ~ ((((V_uu = true)
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = false)
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & (V_zz = e_bb))) & ~
  ((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_hh))
  & (V_zz = e_ii)) & (V_uu = false)) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false)) & (V_zz = e_bb))) & ~ ((((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_hh)) & (V_zz = e_ii)) & (V_uu = true))
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false)) & (V_zz = e_bb))) & ~
  ((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_hh))
  & (V_zz = e_ii)) & (V_uu = true)) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false)) & (V_zz = e_bb))) & ~ ((((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_hh)) & (V_zz = e_ii)) & (V_uu = false))
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false))
  & ($lesseq($sum($difference(V_yy,V_bbee),1),$sum(V_bbff,V_bbgg)) | (~
  $lesseq($sum($difference(V_yy,V_bbee),1),$sum(V_bbff,V_bbgg))
  & (V_zz = e_bb))))) & ~ ((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~
  (V_zz = e_ii)) & (V_zz = e_hh)) & ~ ((((V_uu = false) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = false) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false))) & (V_zz = e_bb))) & ~ (((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ii)) & (V_zz = e_hh))
  & (V_uu = false)) & (V_vv = true)) & (V_ww = false)) & (V_xx = false))
  & (V_zz = e_gg)) & (V_bbee = $sum(V_yy,1)))) & ~ (((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ii)) & (V_zz = e_hh))
  & (V_uu = true)) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))
  & (V_zz = e_gg)) & (V_bbee = $sum(V_yy,1)))) & ~ (((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ii)) & (V_zz = e_hh))
  & (V_uu = true)) & (V_vv = true)) & (V_ww = false)) & (V_xx = false))
  & (V_zz = e_gg)) & (V_bbee = $sum(V_yy,1)))) & ~ ((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ii)) & (V_zz = e_hh))
  & (V_uu = false)) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))
  & ($lesseq($sum($difference($difference($sum(V_yy,1),V_bbee),1),1),V_bbff)
  | (~
  $lesseq($sum($difference($difference($sum(V_yy,1),V_bbee),1),1),V_bbff)
  & (V_zz = e_ii))))) & ~ ((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & (V_zz = e_gg)) & ~ ((((V_uu = false) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = false) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false))) & (V_zz = e_bb))) & ~ ((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & (V_zz = e_gg))
  & (V_uu = false)) & (V_vv = true)) & (V_ww = false)) & (V_xx = false))
  & (($lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)
  & ((V_zz = e_gg) & (V_bbee = $sum(V_yy,1)))) | (~
  $lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)
  & (V_zz = e_bb))))) & ~ ((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & (V_zz = e_gg)) & (V_uu = true)) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false))
  & (($lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)
  & ((V_zz = e_gg) & (V_bbee = $sum(V_yy,1)))) | (~
  $lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)
  & (V_zz = e_bb))))) & ~ ((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & (V_zz = e_gg)) & (V_uu = true)) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false))
  & (($lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)
  & ((V_zz = e_gg) & (V_bbee = $sum(V_yy,1)))) | (~
  $lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)
  & (V_zz = e_bb))))) & ~ ((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & (V_zz = e_gg)) & (V_uu = false)) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false))
  & (($lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)
  & (V_zz = e_hh)) | (~
  $lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)
  & (V_zz = e_bb))))) & ~ ((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & (V_zz = e_gg)) & (V_zz = e_bb)) & ~ ((((V_uu = false)
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = true)
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & ~ ((((V_uu = true)
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = false)
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false)))) & ~ ((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & (V_zz = e_gg))
  & (V_zz = e_bb)) & (V_uu = false)) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))) & ~ ((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & (V_zz = e_gg)) & (V_zz = e_bb)) & (V_uu = true))
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~ ((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & (V_zz = e_gg))
  & (V_zz = e_bb)) & (V_uu = true)) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))) & ~ ((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & (V_zz = e_gg)) & (V_zz = e_bb)) & (V_uu = false))
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~ ((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & (V_zz = e_ff)) & ~
  ((((V_uu = false) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~
  ((((V_uu = true) & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & ~
  ((((V_uu = true) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~
  ((((V_uu = false) & (V_vv = true)) & (V_ww = false)) & (V_xx = false)))
  & (V_zz = e_bb))) & ~ ((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~
  (V_zz = e_gg)) & (V_zz = e_ff)) & (V_uu = false)) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false)) & (V_bbdd = $sum(V_yy,1)))) & ~
  ((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg))
  & (V_zz = e_ff)) & (V_uu = true)) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false)) & (V_zz = e_bb))) & ~ ((((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & ~ (V_zz = e_gg)) & (V_zz = e_ff)) & (V_uu = true))
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false)) & (V_zz = e_bb))) & ~
  (((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg))
  & (V_zz = e_ff)) & (V_uu = false)) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false)) & (V_zz = e_gg)) & (V_bbee = V_yy))) & ~ ((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff)) & (V_zz = e_ee)) & ~
  ((((V_uu = false) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~
  ((((V_uu = true) & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & ~
  ((((V_uu = true) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~
  ((((V_uu = false) & (V_vv = true)) & (V_ww = false)) & (V_xx = false)))
  & (V_zz = e_bb))) & ~ ((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~
  (V_zz = e_ff)) & (V_zz = e_ee)) & (V_uu = false)) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false))
  & (($lesseq($sum($difference($difference($sum(V_bbcc,1),V_bbbb),1),1),V_bbii)
  & ((V_bbcc = $sum(V_yy,1)) & (V_zz = e_ee))) | (~
  $lesseq($sum($difference($difference($sum(V_bbcc,1),V_bbbb),1),1),V_bbii)
  & ((V_bbdd = $sum(V_yy,1)) & (V_zz = e_ff)))))) & ~ ((((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff)) & (V_zz = e_ee))
  & (V_uu = true)) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))
  & (V_zz = e_gg)) & (V_bbdd = V_bbcc)) & (V_bbee = $sum(V_yy,1)))) & ~
  ((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff))
  & (V_zz = e_ee)) & (V_uu = true)) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))
  & (($lesseq($sum($difference($difference($sum(V_bbcc,1),V_bbbb),1),1),V_bbii)
  & ((V_bbcc = $sum(V_yy,1)) & (V_zz = e_ee))) | (~
  $lesseq($sum($difference($difference($sum(V_bbcc,1),V_bbbb),1),1),V_bbii)
  & (V_zz = e_bb))))) & ~ ((((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc))
  & ~ (V_zz = e_dd)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg))
  & ~ (V_zz = e_ff)) & (V_zz = e_ee)) & (V_uu = false)) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false)) & (V_zz = e_gg)) & (V_bbdd = V_bbcc))
  & (V_bbee = V_yy))) & ~ ((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_ee)) & (V_zz = e_dd)) & ~ ((((V_uu = false) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = false) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false))) & (V_zz = e_bb))) & ~ (((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ee)) & (V_zz = e_dd))
  & (V_uu = false)) & (V_vv = true)) & (V_ww = false)) & (V_xx = false))
  & (V_bbcc = $sum(V_yy,1))) & (V_zz = e_ee))) & ~ (((((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ee)) & (V_zz = e_dd))
  & (V_uu = true)) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))
  & (V_zz = e_gg)) & (V_bbcc = V_bbbb)) & (V_bbdd = V_bbbb))
  & (V_bbee = $sum(V_yy,1)))) & ~ (((((((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_ee)) & (V_zz = e_dd)) & (V_uu = false))
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false)) & (V_zz = e_gg))
  & (V_bbcc = V_bbbb)) & (V_bbdd = V_bbbb)) & (V_bbee = V_yy))) & ~
  (((((((((((~ (V_zz = e_ii) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_dd)) & (V_zz = e_cc)) & ~
  ((((V_uu = false) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~
  ((((V_uu = true) & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & ~
  ((((V_uu = true) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~
  ((((V_uu = false) & (V_vv = true)) & (V_ww = false)) & (V_xx = false)))
  & (V_zz = e_bb))) & ~ (((((((((((~ (V_zz = e_ii) & ~ (V_zz = e_hh)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_dd))
  & (V_zz = e_cc)) & (V_uu = false)) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false)) & (V_zz = e_bb))) & ~ (((((((((((~ (V_zz = e_ii) & ~
  (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_dd)) & (V_zz = e_cc)) & (V_uu = true)) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false)) & (V_zz = e_bb))) & ~ (((((((((((~
  (V_zz = e_ii) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_dd)) & (V_zz = e_cc)) & (V_uu = true))
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false))
  & (($lesseq(V_bbjj,$difference($sum(V_yy,1),V_bbaa)) & ((V_zz = e_dd)
  & (V_bbbb = $sum(V_yy,1)))) | ~
  $lesseq(V_bbjj,$difference($sum(V_yy,1),V_bbaa))))))).

tff(f82, type, f82: (enum_aa * $int * bool * bool * bool * bool * $int *
  $int * $int * $int * $int * enum_aa * $int * bool * bool * bool * bool *
  $int * $int * $int * $int * $int * $int * $int * $int * set($int) *
  set($int) * set($int) * set($int) * $int * $int * $int * $int * $int *
  $int * $int * $int * $int * $int * $int * $int) > $o).

tff(f82_def, axiom, ![V_zz:enum_aa, V_yy:$int, V_xx:bool, V_ww:bool, V_vv:
  bool, V_uu:bool, V_tt:$int, V_ss:$int, V_rr:$int, V_qq:$int, V_pp:$int,
  V_oo:enum_aa, V_nn:$int, V_mm:bool, V_ll:bool, V_kk:bool, V_jj:bool,
  V_bbxx:$int, V_bbww:$int, V_bbvv:$int, V_bbuu:$int, V_bbtt:$int, V_bbss:
  $int, V_bbrr:$int, V_bbqq:$int, V_bbpp:set($int), V_bboo:set($int), V_bbnn:
  set($int), V_bbmm:set($int), V_bbll:$int, V_bbkk:$int, V_bbjj:$int, V_bbii:
  $int, V_bbhh:$int, V_bbgg:$int, V_bbff:$int, V_bbee:$int, V_bbdd:$int,
  V_bbcc:$int, V_bbbb:$int, V_bbaa:$int]: (f82(V_zz, V_yy, V_xx, V_ww, V_vv,
  V_uu, V_tt, V_ss, V_rr, V_qq, V_pp, V_oo, V_nn, V_mm, V_ll, V_kk, V_jj,
  V_bbxx, V_bbww, V_bbvv, V_bbuu, V_bbtt, V_bbss, V_bbrr, V_bbqq, V_bbpp,
  V_bboo, V_bbnn, V_bbmm, V_bbll, V_bbkk, V_bbjj, V_bbii, V_bbhh, V_bbgg,
  V_bbff, V_bbee, V_bbdd, V_bbcc, V_bbbb, V_bbaa) <=> ~ (V_zz = e_ii))).

tff(f83, type, f83: (enum_aa * $int * bool * bool * bool * bool * $int *
  $int * $int * $int * $int * enum_aa * $int * bool * bool * bool * bool *
  $int * $int * $int * $int * $int * $int * $int * $int * set($int) *
  set($int) * set($int) * set($int) * $int * $int * $int * $int * $int *
  $int * $int * $int * $int * $int * $int * $int) > $o).

tff(f83_def, axiom, ![V_zz:enum_aa, V_yy:$int, V_xx:bool, V_ww:bool, V_vv:
  bool, V_uu:bool, V_tt:$int, V_ss:$int, V_rr:$int, V_qq:$int, V_pp:$int,
  V_oo:enum_aa, V_nn:$int, V_mm:bool, V_ll:bool, V_kk:bool, V_jj:bool,
  V_bbxx:$int, V_bbww:$int, V_bbvv:$int, V_bbuu:$int, V_bbtt:$int, V_bbss:
  $int, V_bbrr:$int, V_bbqq:$int, V_bbpp:set($int), V_bboo:set($int), V_bbnn:
  set($int), V_bbmm:set($int), V_bbll:$int, V_bbkk:$int, V_bbjj:$int, V_bbii:
  $int, V_bbhh:$int, V_bbgg:$int, V_bbff:$int, V_bbee:$int, V_bbdd:$int,
  V_bbcc:$int, V_bbbb:$int, V_bbaa:$int]: (f83(V_zz, V_yy, V_xx, V_ww, V_vv,
  V_uu, V_tt, V_ss, V_rr, V_qq, V_pp, V_oo, V_nn, V_mm, V_ll, V_kk, V_jj,
  V_bbxx, V_bbww, V_bbvv, V_bbuu, V_bbtt, V_bbss, V_bbrr, V_bbqq, V_bbpp,
  V_bboo, V_bbnn, V_bbmm, V_bbll, V_bbkk, V_bbjj, V_bbii, V_bbhh, V_bbgg,
  V_bbff, V_bbee, V_bbdd, V_bbcc, V_bbbb, V_bbaa)
  <=> (((((((((((((((((((((((((((((((((((((((((((((((((((($true & ~
  (V_zz = e_bb)) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_hh)) & ~
  $lesseq($sum($difference(V_yy,V_bbee),1),$sum(V_bbff,V_bbgg)))
  & (V_zz = e_ii)) & (V_uu = false)) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false)) & mem($int, $sum(V_yy,1), integer))
  & $lesseq(0,$sum(V_yy,1))) & $true) & ~ (((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_hh)) & (V_zz = e_ii)) & ~ ((((V_uu = false)
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = true)
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & ~ ((((V_uu = true)
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = false)
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false)))) & ~ (((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_hh)) & (V_zz = e_ii))
  & (V_uu = false)) & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & ~
  (((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_hh))
  & (V_zz = e_ii)) & (V_uu = true)) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ (((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~
  (V_zz = e_hh)) & (V_zz = e_ii)) & (V_uu = true)) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false))) & ~ ((((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_hh)) & (V_zz = e_ii)) & (V_uu = false))
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false)) & ~
  $lesseq($sum($difference(V_yy,V_bbee),1),$sum(V_bbff,V_bbgg)))) & ~
  (((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ii))
  & (V_zz = e_hh)) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false)))) & ~ (((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~
  (V_zz = e_ii)) & (V_zz = e_hh)) & (V_uu = false)) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false)) & (e_bb = e_gg))
  & (V_bbee = $sum(V_yy,1)))) & ~ (((((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ii)) & (V_zz = e_hh)) & (V_uu = true))
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false)) & (e_bb = e_gg))
  & (V_bbee = $sum(V_yy,1)))) & ~ (((((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ii)) & (V_zz = e_hh)) & (V_uu = true))
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false)) & (e_bb = e_gg))
  & (V_bbee = $sum(V_yy,1)))) & ~ ((((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ii)) & (V_zz = e_hh)) & (V_uu = false))
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false)) & (~
  $lesseq($sum($difference($difference($sum(V_yy,1),V_bbee),1),1),V_bbff)
  & (e_bb = e_ii)))) & ~ (((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & (V_zz = e_gg)) & ~ ((((V_uu = false) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = false) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false)))) & ~ ((((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & (V_zz = e_gg)) & (V_uu = false))
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false))
  & (($lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)
  & ((e_bb = e_gg) & (V_bbee = $sum(V_yy,1)))) | ~
  $lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)))) & ~
  ((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh))
  & (V_zz = e_gg)) & (V_uu = true)) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))
  & (($lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)
  & ((e_bb = e_gg) & (V_bbee = $sum(V_yy,1)))) | ~
  $lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)))) & ~
  ((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh))
  & (V_zz = e_gg)) & (V_uu = true)) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))
  & (($lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)
  & ((e_bb = e_gg) & (V_bbee = $sum(V_yy,1)))) | ~
  $lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)))) & ~
  ((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh))
  & (V_zz = e_gg)) & (V_uu = false)) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))
  & (($lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)
  & (e_bb = e_hh)) | ~
  $lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)))) & ~
  (((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh))
  & (V_zz = e_gg)) & (V_uu = false)) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))) & ~ (((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & (V_zz = e_gg)) & (V_uu = true)) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false))) & ~ (((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & (V_zz = e_gg)) & (V_uu = true))
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & ~ (((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & (V_zz = e_gg))
  & (V_uu = false)) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~
  (((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg))
  & (V_zz = e_ff)) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false)))) & ~ (((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~
  (V_zz = e_gg)) & (V_zz = e_ff)) & (V_uu = true)) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false))) & ~ (((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & ~ (V_zz = e_gg)) & (V_zz = e_ff)) & (V_uu = true))
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & ~ (((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & (V_zz = e_ff))
  & (V_uu = false)) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))
  & (e_bb = e_gg)) & (V_bbee = V_yy))) & ~ (((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ff)) & (V_zz = e_ee)) & ~ ((((V_uu = false)
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = true)
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & ~ ((((V_uu = true)
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = false)
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false)))) & ~ ((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff)) & (V_zz = e_ee))
  & (V_uu = false)) & (V_vv = true)) & (V_ww = false)) & (V_xx = false))
  & (($lesseq($sum($difference($difference($sum(V_bbcc,1),V_bbbb),1),1),V_bbii)
  & ((V_bbcc = $sum(V_yy,1)) & (e_bb = e_ee))) | (~
  $lesseq($sum($difference($difference($sum(V_bbcc,1),V_bbbb),1),1),V_bbii)
  & ((V_bbdd = $sum(V_yy,1)) & (e_bb = e_ff)))))) & ~ ((((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff)) & (V_zz = e_ee))
  & (V_uu = true)) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))
  & (e_bb = e_gg)) & (V_bbdd = V_bbcc)) & (V_bbee = $sum(V_yy,1)))) & ~
  ((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff))
  & (V_zz = e_ee)) & (V_uu = true)) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))
  & (($lesseq($sum($difference($difference($sum(V_bbcc,1),V_bbbb),1),1),V_bbii)
  & ((V_bbcc = $sum(V_yy,1)) & (e_bb = e_ee))) | ~
  $lesseq($sum($difference($difference($sum(V_bbcc,1),V_bbbb),1),1),V_bbii))))
  & ~ ((((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff))
  & (V_zz = e_ee)) & (V_uu = false)) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false)) & (e_bb = e_gg)) & (V_bbdd = V_bbcc)) & (V_bbee = V_yy)))
  & ~ (((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ee))
  & (V_zz = e_dd)) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false)))) & ~ (((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_ee)) & (V_zz = e_dd)) & (V_uu = false)) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false)) & (V_bbcc = $sum(V_yy,1)))
  & (e_bb = e_ee))) & ~ (((((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_ee)) & (V_zz = e_dd)) & (V_uu = true)) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false)) & (e_bb = e_gg)) & (V_bbcc = V_bbbb))
  & (V_bbdd = V_bbbb)) & (V_bbee = $sum(V_yy,1)))) & ~ (((((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ee)) & (V_zz = e_dd))
  & (V_uu = false)) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))
  & (e_bb = e_gg)) & (V_bbcc = V_bbbb)) & (V_bbdd = V_bbbb))
  & (V_bbee = V_yy))) & ~ ((((((((((~ (V_zz = e_ii) & ~ (V_zz = e_hh)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_dd))
  & (V_zz = e_cc)) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false)))) & ~ ((((((((((~ (V_zz = e_ii) & ~ (V_zz = e_hh)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_dd))
  & (V_zz = e_cc)) & (V_uu = false)) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))) & ~ ((((((((((~ (V_zz = e_ii) & ~ (V_zz = e_hh)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_dd))
  & (V_zz = e_cc)) & (V_uu = true)) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ (((((((((((~ (V_zz = e_ii) & ~ (V_zz = e_hh)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_dd))
  & (V_zz = e_cc)) & (V_uu = true)) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false)) & ($lesseq(V_bbjj,$difference($sum(V_yy,1),V_bbaa))
  & ((e_bb = e_dd) & (V_bbbb = $sum(V_yy,1)))))))).

tff(f84, type, f84: (enum_aa * $int * bool * bool * bool * bool * $int *
  $int * $int * $int * $int * enum_aa * $int * bool * bool * bool * bool *
  $int * $int * $int * $int * $int * $int * $int * $int * set($int) *
  set($int) * set($int) * set($int) * $int * $int * $int * $int * $int *
  $int * $int * $int * $int * $int * $int * $int) > $o).

tff(f84_def, axiom, ![V_zz:enum_aa, V_yy:$int, V_xx:bool, V_ww:bool, V_vv:
  bool, V_uu:bool, V_tt:$int, V_ss:$int, V_rr:$int, V_qq:$int, V_pp:$int,
  V_oo:enum_aa, V_nn:$int, V_mm:bool, V_ll:bool, V_kk:bool, V_jj:bool,
  V_bbxx:$int, V_bbww:$int, V_bbvv:$int, V_bbuu:$int, V_bbtt:$int, V_bbss:
  $int, V_bbrr:$int, V_bbqq:$int, V_bbpp:set($int), V_bboo:set($int), V_bbnn:
  set($int), V_bbmm:set($int), V_bbll:$int, V_bbkk:$int, V_bbjj:$int, V_bbii:
  $int, V_bbhh:$int, V_bbgg:$int, V_bbff:$int, V_bbee:$int, V_bbdd:$int,
  V_bbcc:$int, V_bbbb:$int, V_bbaa:$int]: (f84(V_zz, V_yy, V_xx, V_ww, V_vv,
  V_uu, V_tt, V_ss, V_rr, V_qq, V_pp, V_oo, V_nn, V_mm, V_ll, V_kk, V_jj,
  V_bbxx, V_bbww, V_bbvv, V_bbuu, V_bbtt, V_bbss, V_bbrr, V_bbqq, V_bbpp,
  V_bboo, V_bbnn, V_bbmm, V_bbll, V_bbkk, V_bbjj, V_bbii, V_bbhh, V_bbgg,
  V_bbff, V_bbee, V_bbdd, V_bbcc, V_bbbb, V_bbaa)
  <=> ((((((((((((((((((((((((((((((((((((((((((((((((((($true & ~
  (V_zz = e_bb)) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_hh)) & (V_zz = e_ii))
  & (V_uu = true)) & (V_vv = true)) & (V_ww = false)) & (V_xx = false))
  & mem($int, $sum(V_yy,1), integer)) & $lesseq(0,$sum(V_yy,1))) & $true) & ~
  (((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_hh))
  & (V_zz = e_ii)) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false)))) & ~ (((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~
  (V_zz = e_hh)) & (V_zz = e_ii)) & (V_uu = false)) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false))) & ~ (((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_hh)) & (V_zz = e_ii)) & (V_uu = true))
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~ (((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_hh)) & (V_zz = e_ii))
  & (V_uu = true)) & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & ~
  ((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_hh))
  & (V_zz = e_ii)) & (V_uu = false)) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false)) & ~
  $lesseq($sum($difference(V_yy,V_bbee),1),$sum(V_bbff,V_bbgg)))) & ~
  (((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ii))
  & (V_zz = e_hh)) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false)))) & ~ (((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~
  (V_zz = e_ii)) & (V_zz = e_hh)) & (V_uu = false)) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false)) & (e_bb = e_gg))
  & (V_bbee = $sum(V_yy,1)))) & ~ (((((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ii)) & (V_zz = e_hh)) & (V_uu = true))
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false)) & (e_bb = e_gg))
  & (V_bbee = $sum(V_yy,1)))) & ~ (((((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ii)) & (V_zz = e_hh)) & (V_uu = true))
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false)) & (e_bb = e_gg))
  & (V_bbee = $sum(V_yy,1)))) & ~ ((((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ii)) & (V_zz = e_hh)) & (V_uu = false))
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false)) & (~
  $lesseq($sum($difference($difference($sum(V_yy,1),V_bbee),1),1),V_bbff)
  & (e_bb = e_ii)))) & ~ (((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & (V_zz = e_gg)) & ~ ((((V_uu = false) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = false) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false)))) & ~ ((((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & (V_zz = e_gg)) & (V_uu = false))
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false))
  & (($lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)
  & ((e_bb = e_gg) & (V_bbee = $sum(V_yy,1)))) | ~
  $lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)))) & ~
  ((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh))
  & (V_zz = e_gg)) & (V_uu = true)) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))
  & (($lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)
  & ((e_bb = e_gg) & (V_bbee = $sum(V_yy,1)))) | ~
  $lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)))) & ~
  ((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh))
  & (V_zz = e_gg)) & (V_uu = true)) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))
  & (($lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)
  & ((e_bb = e_gg) & (V_bbee = $sum(V_yy,1)))) | ~
  $lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)))) & ~
  ((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh))
  & (V_zz = e_gg)) & (V_uu = false)) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))
  & (($lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)
  & (e_bb = e_hh)) | ~
  $lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)))) & ~
  (((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh))
  & (V_zz = e_gg)) & (V_uu = false)) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))) & ~ (((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & (V_zz = e_gg)) & (V_uu = true)) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false))) & ~ (((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & (V_zz = e_gg)) & (V_uu = true))
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & ~ (((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & (V_zz = e_gg))
  & (V_uu = false)) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~
  (((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg))
  & (V_zz = e_ff)) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false)))) & ~ (((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~
  (V_zz = e_gg)) & (V_zz = e_ff)) & (V_uu = true)) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false))) & ~ (((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & ~ (V_zz = e_gg)) & (V_zz = e_ff)) & (V_uu = true))
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & ~ (((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & (V_zz = e_ff))
  & (V_uu = false)) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))
  & (e_bb = e_gg)) & (V_bbee = V_yy))) & ~ (((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ff)) & (V_zz = e_ee)) & ~ ((((V_uu = false)
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = true)
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & ~ ((((V_uu = true)
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = false)
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false)))) & ~ ((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff)) & (V_zz = e_ee))
  & (V_uu = false)) & (V_vv = true)) & (V_ww = false)) & (V_xx = false))
  & (($lesseq($sum($difference($difference($sum(V_bbcc,1),V_bbbb),1),1),V_bbii)
  & ((V_bbcc = $sum(V_yy,1)) & (e_bb = e_ee))) | (~
  $lesseq($sum($difference($difference($sum(V_bbcc,1),V_bbbb),1),1),V_bbii)
  & ((V_bbdd = $sum(V_yy,1)) & (e_bb = e_ff)))))) & ~ ((((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff)) & (V_zz = e_ee))
  & (V_uu = true)) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))
  & (e_bb = e_gg)) & (V_bbdd = V_bbcc)) & (V_bbee = $sum(V_yy,1)))) & ~
  ((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff))
  & (V_zz = e_ee)) & (V_uu = true)) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))
  & (($lesseq($sum($difference($difference($sum(V_bbcc,1),V_bbbb),1),1),V_bbii)
  & ((V_bbcc = $sum(V_yy,1)) & (e_bb = e_ee))) | ~
  $lesseq($sum($difference($difference($sum(V_bbcc,1),V_bbbb),1),1),V_bbii))))
  & ~ ((((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff))
  & (V_zz = e_ee)) & (V_uu = false)) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false)) & (e_bb = e_gg)) & (V_bbdd = V_bbcc)) & (V_bbee = V_yy)))
  & ~ (((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ee))
  & (V_zz = e_dd)) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false)))) & ~ (((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_ee)) & (V_zz = e_dd)) & (V_uu = false)) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false)) & (V_bbcc = $sum(V_yy,1)))
  & (e_bb = e_ee))) & ~ (((((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_ee)) & (V_zz = e_dd)) & (V_uu = true)) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false)) & (e_bb = e_gg)) & (V_bbcc = V_bbbb))
  & (V_bbdd = V_bbbb)) & (V_bbee = $sum(V_yy,1)))) & ~ (((((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ee)) & (V_zz = e_dd))
  & (V_uu = false)) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))
  & (e_bb = e_gg)) & (V_bbcc = V_bbbb)) & (V_bbdd = V_bbbb))
  & (V_bbee = V_yy))) & ~ ((((((((((~ (V_zz = e_ii) & ~ (V_zz = e_hh)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_dd))
  & (V_zz = e_cc)) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false)))) & ~ ((((((((((~ (V_zz = e_ii) & ~ (V_zz = e_hh)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_dd))
  & (V_zz = e_cc)) & (V_uu = false)) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))) & ~ ((((((((((~ (V_zz = e_ii) & ~ (V_zz = e_hh)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_dd))
  & (V_zz = e_cc)) & (V_uu = true)) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ (((((((((((~ (V_zz = e_ii) & ~ (V_zz = e_hh)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_dd))
  & (V_zz = e_cc)) & (V_uu = true)) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false)) & ($lesseq(V_bbjj,$difference($sum(V_yy,1),V_bbaa))
  & ((e_bb = e_dd) & (V_bbbb = $sum(V_yy,1)))))))).

tff(f85, type, f85: (enum_aa * $int * bool * bool * bool * bool * $int *
  $int * $int * $int * $int * enum_aa * $int * bool * bool * bool * bool *
  $int * $int * $int * $int * $int * $int * $int * $int * set($int) *
  set($int) * set($int) * set($int) * $int * $int * $int * $int * $int *
  $int * $int * $int * $int * $int * $int * $int) > $o).

tff(f85_def, axiom, ![V_zz:enum_aa, V_yy:$int, V_xx:bool, V_ww:bool, V_vv:
  bool, V_uu:bool, V_tt:$int, V_ss:$int, V_rr:$int, V_qq:$int, V_pp:$int,
  V_oo:enum_aa, V_nn:$int, V_mm:bool, V_ll:bool, V_kk:bool, V_jj:bool,
  V_bbxx:$int, V_bbww:$int, V_bbvv:$int, V_bbuu:$int, V_bbtt:$int, V_bbss:
  $int, V_bbrr:$int, V_bbqq:$int, V_bbpp:set($int), V_bboo:set($int), V_bbnn:
  set($int), V_bbmm:set($int), V_bbll:$int, V_bbkk:$int, V_bbjj:$int, V_bbii:
  $int, V_bbhh:$int, V_bbgg:$int, V_bbff:$int, V_bbee:$int, V_bbdd:$int,
  V_bbcc:$int, V_bbbb:$int, V_bbaa:$int]: (f85(V_zz, V_yy, V_xx, V_ww, V_vv,
  V_uu, V_tt, V_ss, V_rr, V_qq, V_pp, V_oo, V_nn, V_mm, V_ll, V_kk, V_jj,
  V_bbxx, V_bbww, V_bbvv, V_bbuu, V_bbtt, V_bbss, V_bbrr, V_bbqq, V_bbpp,
  V_bboo, V_bbnn, V_bbmm, V_bbll, V_bbkk, V_bbjj, V_bbii, V_bbhh, V_bbgg,
  V_bbff, V_bbee, V_bbdd, V_bbcc, V_bbbb, V_bbaa)
  <=> ((((((((((((((((((((((((((((((((((((((((((((((((((($true & ~
  (V_zz = e_bb)) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_hh)) & (V_zz = e_ii))
  & (V_uu = true)) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))
  & mem($int, $sum(V_yy,1), integer)) & $lesseq(0,$sum(V_yy,1))) & $true) & ~
  (((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_hh))
  & (V_zz = e_ii)) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false)))) & ~ (((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~
  (V_zz = e_hh)) & (V_zz = e_ii)) & (V_uu = false)) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false))) & ~ (((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_hh)) & (V_zz = e_ii)) & (V_uu = true))
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~ (((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_hh)) & (V_zz = e_ii))
  & (V_uu = true)) & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & ~
  ((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_hh))
  & (V_zz = e_ii)) & (V_uu = false)) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false)) & ~
  $lesseq($sum($difference(V_yy,V_bbee),1),$sum(V_bbff,V_bbgg)))) & ~
  (((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ii))
  & (V_zz = e_hh)) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false)))) & ~ (((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~
  (V_zz = e_ii)) & (V_zz = e_hh)) & (V_uu = false)) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false)) & (e_bb = e_gg))
  & (V_bbee = $sum(V_yy,1)))) & ~ (((((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ii)) & (V_zz = e_hh)) & (V_uu = true))
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false)) & (e_bb = e_gg))
  & (V_bbee = $sum(V_yy,1)))) & ~ (((((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ii)) & (V_zz = e_hh)) & (V_uu = true))
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false)) & (e_bb = e_gg))
  & (V_bbee = $sum(V_yy,1)))) & ~ ((((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ii)) & (V_zz = e_hh)) & (V_uu = false))
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false)) & (~
  $lesseq($sum($difference($difference($sum(V_yy,1),V_bbee),1),1),V_bbff)
  & (e_bb = e_ii)))) & ~ (((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & (V_zz = e_gg)) & ~ ((((V_uu = false) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = false) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false)))) & ~ ((((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & (V_zz = e_gg)) & (V_uu = false))
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false))
  & (($lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)
  & ((e_bb = e_gg) & (V_bbee = $sum(V_yy,1)))) | ~
  $lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)))) & ~
  ((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh))
  & (V_zz = e_gg)) & (V_uu = true)) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))
  & (($lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)
  & ((e_bb = e_gg) & (V_bbee = $sum(V_yy,1)))) | ~
  $lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)))) & ~
  ((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh))
  & (V_zz = e_gg)) & (V_uu = true)) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))
  & (($lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)
  & ((e_bb = e_gg) & (V_bbee = $sum(V_yy,1)))) | ~
  $lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)))) & ~
  ((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh))
  & (V_zz = e_gg)) & (V_uu = false)) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))
  & (($lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)
  & (e_bb = e_hh)) | ~
  $lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)))) & ~
  (((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh))
  & (V_zz = e_gg)) & (V_uu = false)) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))) & ~ (((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & (V_zz = e_gg)) & (V_uu = true)) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false))) & ~ (((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & (V_zz = e_gg)) & (V_uu = true))
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & ~ (((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & (V_zz = e_gg))
  & (V_uu = false)) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~
  (((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg))
  & (V_zz = e_ff)) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false)))) & ~ (((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~
  (V_zz = e_gg)) & (V_zz = e_ff)) & (V_uu = true)) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false))) & ~ (((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & ~ (V_zz = e_gg)) & (V_zz = e_ff)) & (V_uu = true))
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & ~ (((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & (V_zz = e_ff))
  & (V_uu = false)) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))
  & (e_bb = e_gg)) & (V_bbee = V_yy))) & ~ (((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ff)) & (V_zz = e_ee)) & ~ ((((V_uu = false)
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = true)
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & ~ ((((V_uu = true)
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = false)
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false)))) & ~ ((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff)) & (V_zz = e_ee))
  & (V_uu = false)) & (V_vv = true)) & (V_ww = false)) & (V_xx = false))
  & (($lesseq($sum($difference($difference($sum(V_bbcc,1),V_bbbb),1),1),V_bbii)
  & ((V_bbcc = $sum(V_yy,1)) & (e_bb = e_ee))) | (~
  $lesseq($sum($difference($difference($sum(V_bbcc,1),V_bbbb),1),1),V_bbii)
  & ((V_bbdd = $sum(V_yy,1)) & (e_bb = e_ff)))))) & ~ ((((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff)) & (V_zz = e_ee))
  & (V_uu = true)) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))
  & (e_bb = e_gg)) & (V_bbdd = V_bbcc)) & (V_bbee = $sum(V_yy,1)))) & ~
  ((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff))
  & (V_zz = e_ee)) & (V_uu = true)) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))
  & (($lesseq($sum($difference($difference($sum(V_bbcc,1),V_bbbb),1),1),V_bbii)
  & ((V_bbcc = $sum(V_yy,1)) & (e_bb = e_ee))) | ~
  $lesseq($sum($difference($difference($sum(V_bbcc,1),V_bbbb),1),1),V_bbii))))
  & ~ ((((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff))
  & (V_zz = e_ee)) & (V_uu = false)) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false)) & (e_bb = e_gg)) & (V_bbdd = V_bbcc)) & (V_bbee = V_yy)))
  & ~ (((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ee))
  & (V_zz = e_dd)) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false)))) & ~ (((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_ee)) & (V_zz = e_dd)) & (V_uu = false)) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false)) & (V_bbcc = $sum(V_yy,1)))
  & (e_bb = e_ee))) & ~ (((((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_ee)) & (V_zz = e_dd)) & (V_uu = true)) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false)) & (e_bb = e_gg)) & (V_bbcc = V_bbbb))
  & (V_bbdd = V_bbbb)) & (V_bbee = $sum(V_yy,1)))) & ~ (((((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ee)) & (V_zz = e_dd))
  & (V_uu = false)) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))
  & (e_bb = e_gg)) & (V_bbcc = V_bbbb)) & (V_bbdd = V_bbbb))
  & (V_bbee = V_yy))) & ~ ((((((((((~ (V_zz = e_ii) & ~ (V_zz = e_hh)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_dd))
  & (V_zz = e_cc)) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false)))) & ~ ((((((((((~ (V_zz = e_ii) & ~ (V_zz = e_hh)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_dd))
  & (V_zz = e_cc)) & (V_uu = false)) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))) & ~ ((((((((((~ (V_zz = e_ii) & ~ (V_zz = e_hh)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_dd))
  & (V_zz = e_cc)) & (V_uu = true)) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ (((((((((((~ (V_zz = e_ii) & ~ (V_zz = e_hh)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_dd))
  & (V_zz = e_cc)) & (V_uu = true)) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false)) & ($lesseq(V_bbjj,$difference($sum(V_yy,1),V_bbaa))
  & ((e_bb = e_dd) & (V_bbbb = $sum(V_yy,1)))))))).

tff(f86, type, f86: (enum_aa * $int * bool * bool * bool * bool * $int *
  $int * $int * $int * $int * enum_aa * $int * bool * bool * bool * bool *
  $int * $int * $int * $int * $int * $int * $int * $int * set($int) *
  set($int) * set($int) * set($int) * $int * $int * $int * $int * $int *
  $int * $int * $int * $int * $int * $int * $int) > $o).

tff(f86_def, axiom, ![V_zz:enum_aa, V_yy:$int, V_xx:bool, V_ww:bool, V_vv:
  bool, V_uu:bool, V_tt:$int, V_ss:$int, V_rr:$int, V_qq:$int, V_pp:$int,
  V_oo:enum_aa, V_nn:$int, V_mm:bool, V_ll:bool, V_kk:bool, V_jj:bool,
  V_bbxx:$int, V_bbww:$int, V_bbvv:$int, V_bbuu:$int, V_bbtt:$int, V_bbss:
  $int, V_bbrr:$int, V_bbqq:$int, V_bbpp:set($int), V_bboo:set($int), V_bbnn:
  set($int), V_bbmm:set($int), V_bbll:$int, V_bbkk:$int, V_bbjj:$int, V_bbii:
  $int, V_bbhh:$int, V_bbgg:$int, V_bbff:$int, V_bbee:$int, V_bbdd:$int,
  V_bbcc:$int, V_bbbb:$int, V_bbaa:$int]: (f86(V_zz, V_yy, V_xx, V_ww, V_vv,
  V_uu, V_tt, V_ss, V_rr, V_qq, V_pp, V_oo, V_nn, V_mm, V_ll, V_kk, V_jj,
  V_bbxx, V_bbww, V_bbvv, V_bbuu, V_bbtt, V_bbss, V_bbrr, V_bbqq, V_bbpp,
  V_bboo, V_bbnn, V_bbmm, V_bbll, V_bbkk, V_bbjj, V_bbii, V_bbhh, V_bbgg,
  V_bbff, V_bbee, V_bbdd, V_bbcc, V_bbbb, V_bbaa)
  <=> ((((((((((((((((((((((((((((((((((((((((((((((((((($true & ~
  (V_zz = e_bb)) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_hh)) & (V_zz = e_ii))
  & (V_uu = false)) & (V_vv = true)) & (V_ww = false)) & (V_xx = false))
  & mem($int, $sum(V_yy,1), integer)) & $lesseq(0,$sum(V_yy,1))) & $true) & ~
  (((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_hh))
  & (V_zz = e_ii)) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false)))) & ~ (((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~
  (V_zz = e_hh)) & (V_zz = e_ii)) & (V_uu = false)) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false))) & ~ (((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_hh)) & (V_zz = e_ii)) & (V_uu = true))
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~ (((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_hh)) & (V_zz = e_ii))
  & (V_uu = true)) & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & ~
  ((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_hh))
  & (V_zz = e_ii)) & (V_uu = false)) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false)) & ~
  $lesseq($sum($difference(V_yy,V_bbee),1),$sum(V_bbff,V_bbgg)))) & ~
  (((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ii))
  & (V_zz = e_hh)) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false)))) & ~ (((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~
  (V_zz = e_ii)) & (V_zz = e_hh)) & (V_uu = false)) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false)) & (e_bb = e_gg))
  & (V_bbee = $sum(V_yy,1)))) & ~ (((((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ii)) & (V_zz = e_hh)) & (V_uu = true))
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false)) & (e_bb = e_gg))
  & (V_bbee = $sum(V_yy,1)))) & ~ (((((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ii)) & (V_zz = e_hh)) & (V_uu = true))
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false)) & (e_bb = e_gg))
  & (V_bbee = $sum(V_yy,1)))) & ~ ((((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ii)) & (V_zz = e_hh)) & (V_uu = false))
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false)) & (~
  $lesseq($sum($difference($difference($sum(V_yy,1),V_bbee),1),1),V_bbff)
  & (e_bb = e_ii)))) & ~ (((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & (V_zz = e_gg)) & ~ ((((V_uu = false) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = false) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false)))) & ~ ((((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & (V_zz = e_gg)) & (V_uu = false))
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false))
  & (($lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)
  & ((e_bb = e_gg) & (V_bbee = $sum(V_yy,1)))) | ~
  $lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)))) & ~
  ((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh))
  & (V_zz = e_gg)) & (V_uu = true)) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))
  & (($lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)
  & ((e_bb = e_gg) & (V_bbee = $sum(V_yy,1)))) | ~
  $lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)))) & ~
  ((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh))
  & (V_zz = e_gg)) & (V_uu = true)) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))
  & (($lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)
  & ((e_bb = e_gg) & (V_bbee = $sum(V_yy,1)))) | ~
  $lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)))) & ~
  ((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh))
  & (V_zz = e_gg)) & (V_uu = false)) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))
  & (($lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)
  & (e_bb = e_hh)) | ~
  $lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)))) & ~
  (((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh))
  & (V_zz = e_gg)) & (V_uu = false)) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))) & ~ (((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & (V_zz = e_gg)) & (V_uu = true)) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false))) & ~ (((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & (V_zz = e_gg)) & (V_uu = true))
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & ~ (((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & (V_zz = e_gg))
  & (V_uu = false)) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~
  (((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg))
  & (V_zz = e_ff)) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false)))) & ~ (((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~
  (V_zz = e_gg)) & (V_zz = e_ff)) & (V_uu = true)) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false))) & ~ (((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & ~ (V_zz = e_gg)) & (V_zz = e_ff)) & (V_uu = true))
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & ~ (((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & (V_zz = e_ff))
  & (V_uu = false)) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))
  & (e_bb = e_gg)) & (V_bbee = V_yy))) & ~ (((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ff)) & (V_zz = e_ee)) & ~ ((((V_uu = false)
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = true)
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & ~ ((((V_uu = true)
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = false)
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false)))) & ~ ((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff)) & (V_zz = e_ee))
  & (V_uu = false)) & (V_vv = true)) & (V_ww = false)) & (V_xx = false))
  & (($lesseq($sum($difference($difference($sum(V_bbcc,1),V_bbbb),1),1),V_bbii)
  & ((V_bbcc = $sum(V_yy,1)) & (e_bb = e_ee))) | (~
  $lesseq($sum($difference($difference($sum(V_bbcc,1),V_bbbb),1),1),V_bbii)
  & ((V_bbdd = $sum(V_yy,1)) & (e_bb = e_ff)))))) & ~ ((((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff)) & (V_zz = e_ee))
  & (V_uu = true)) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))
  & (e_bb = e_gg)) & (V_bbdd = V_bbcc)) & (V_bbee = $sum(V_yy,1)))) & ~
  ((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff))
  & (V_zz = e_ee)) & (V_uu = true)) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))
  & (($lesseq($sum($difference($difference($sum(V_bbcc,1),V_bbbb),1),1),V_bbii)
  & ((V_bbcc = $sum(V_yy,1)) & (e_bb = e_ee))) | ~
  $lesseq($sum($difference($difference($sum(V_bbcc,1),V_bbbb),1),1),V_bbii))))
  & ~ ((((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff))
  & (V_zz = e_ee)) & (V_uu = false)) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false)) & (e_bb = e_gg)) & (V_bbdd = V_bbcc)) & (V_bbee = V_yy)))
  & ~ (((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ee))
  & (V_zz = e_dd)) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false)))) & ~ (((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_ee)) & (V_zz = e_dd)) & (V_uu = false)) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false)) & (V_bbcc = $sum(V_yy,1)))
  & (e_bb = e_ee))) & ~ (((((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_ee)) & (V_zz = e_dd)) & (V_uu = true)) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false)) & (e_bb = e_gg)) & (V_bbcc = V_bbbb))
  & (V_bbdd = V_bbbb)) & (V_bbee = $sum(V_yy,1)))) & ~ (((((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ee)) & (V_zz = e_dd))
  & (V_uu = false)) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))
  & (e_bb = e_gg)) & (V_bbcc = V_bbbb)) & (V_bbdd = V_bbbb))
  & (V_bbee = V_yy))) & ~ ((((((((((~ (V_zz = e_ii) & ~ (V_zz = e_hh)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_dd))
  & (V_zz = e_cc)) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false)))) & ~ ((((((((((~ (V_zz = e_ii) & ~ (V_zz = e_hh)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_dd))
  & (V_zz = e_cc)) & (V_uu = false)) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))) & ~ ((((((((((~ (V_zz = e_ii) & ~ (V_zz = e_hh)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_dd))
  & (V_zz = e_cc)) & (V_uu = true)) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ (((((((((((~ (V_zz = e_ii) & ~ (V_zz = e_hh)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_dd))
  & (V_zz = e_cc)) & (V_uu = true)) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false)) & ($lesseq(V_bbjj,$difference($sum(V_yy,1),V_bbaa))
  & ((e_bb = e_dd) & (V_bbbb = $sum(V_yy,1)))))))).

tff(f87, type, f87: (enum_aa * $int * bool * bool * bool * bool * $int *
  $int * $int * $int * $int * enum_aa * $int * bool * bool * bool * bool *
  $int * $int * $int * $int * $int * $int * $int * $int * set($int) *
  set($int) * set($int) * set($int) * $int * $int * $int * $int * $int *
  $int * $int * $int * $int * $int * $int * $int) > $o).

tff(f87_def, axiom, ![V_zz:enum_aa, V_yy:$int, V_xx:bool, V_ww:bool, V_vv:
  bool, V_uu:bool, V_tt:$int, V_ss:$int, V_rr:$int, V_qq:$int, V_pp:$int,
  V_oo:enum_aa, V_nn:$int, V_mm:bool, V_ll:bool, V_kk:bool, V_jj:bool,
  V_bbxx:$int, V_bbww:$int, V_bbvv:$int, V_bbuu:$int, V_bbtt:$int, V_bbss:
  $int, V_bbrr:$int, V_bbqq:$int, V_bbpp:set($int), V_bboo:set($int), V_bbnn:
  set($int), V_bbmm:set($int), V_bbll:$int, V_bbkk:$int, V_bbjj:$int, V_bbii:
  $int, V_bbhh:$int, V_bbgg:$int, V_bbff:$int, V_bbee:$int, V_bbdd:$int,
  V_bbcc:$int, V_bbbb:$int, V_bbaa:$int]: (f87(V_zz, V_yy, V_xx, V_ww, V_vv,
  V_uu, V_tt, V_ss, V_rr, V_qq, V_pp, V_oo, V_nn, V_mm, V_ll, V_kk, V_jj,
  V_bbxx, V_bbww, V_bbvv, V_bbuu, V_bbtt, V_bbss, V_bbrr, V_bbqq, V_bbpp,
  V_bboo, V_bbnn, V_bbmm, V_bbll, V_bbkk, V_bbjj, V_bbii, V_bbhh, V_bbgg,
  V_bbff, V_bbee, V_bbdd, V_bbcc, V_bbbb, V_bbaa)
  <=> ((((((((((((((((((((((((((((((((((((((((((((((((((($true & ~
  (V_zz = e_bb)) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_hh)) & ~ ((((V_uu = false)
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = true)
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & ~ ((((V_uu = true)
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = false)
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & (V_zz = e_ii))
  & mem($int, $sum(V_yy,1), integer)) & $lesseq(0,$sum(V_yy,1))) & $true) & ~
  (((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_hh))
  & (V_zz = e_ii)) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false)))) & ~ (((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~
  (V_zz = e_hh)) & (V_zz = e_ii)) & (V_uu = false)) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false))) & ~ (((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_hh)) & (V_zz = e_ii)) & (V_uu = true))
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~ (((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_hh)) & (V_zz = e_ii))
  & (V_uu = true)) & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & ~
  ((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_hh))
  & (V_zz = e_ii)) & (V_uu = false)) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false)) & ~
  $lesseq($sum($difference(V_yy,V_bbee),1),$sum(V_bbff,V_bbgg)))) & ~
  (((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ii))
  & (V_zz = e_hh)) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false)))) & ~ (((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~
  (V_zz = e_ii)) & (V_zz = e_hh)) & (V_uu = false)) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false)) & (e_bb = e_gg))
  & (V_bbee = $sum(V_yy,1)))) & ~ (((((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ii)) & (V_zz = e_hh)) & (V_uu = true))
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false)) & (e_bb = e_gg))
  & (V_bbee = $sum(V_yy,1)))) & ~ (((((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ii)) & (V_zz = e_hh)) & (V_uu = true))
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false)) & (e_bb = e_gg))
  & (V_bbee = $sum(V_yy,1)))) & ~ ((((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ii)) & (V_zz = e_hh)) & (V_uu = false))
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false)) & (~
  $lesseq($sum($difference($difference($sum(V_yy,1),V_bbee),1),1),V_bbff)
  & (e_bb = e_ii)))) & ~ (((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & (V_zz = e_gg)) & ~ ((((V_uu = false) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = false) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false)))) & ~ ((((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & (V_zz = e_gg)) & (V_uu = false))
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false))
  & (($lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)
  & ((e_bb = e_gg) & (V_bbee = $sum(V_yy,1)))) | ~
  $lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)))) & ~
  ((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh))
  & (V_zz = e_gg)) & (V_uu = true)) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))
  & (($lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)
  & ((e_bb = e_gg) & (V_bbee = $sum(V_yy,1)))) | ~
  $lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)))) & ~
  ((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh))
  & (V_zz = e_gg)) & (V_uu = true)) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))
  & (($lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)
  & ((e_bb = e_gg) & (V_bbee = $sum(V_yy,1)))) | ~
  $lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)))) & ~
  ((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh))
  & (V_zz = e_gg)) & (V_uu = false)) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))
  & (($lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)
  & (e_bb = e_hh)) | ~
  $lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)))) & ~
  (((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh))
  & (V_zz = e_gg)) & (V_uu = false)) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))) & ~ (((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & (V_zz = e_gg)) & (V_uu = true)) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false))) & ~ (((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & (V_zz = e_gg)) & (V_uu = true))
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & ~ (((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & (V_zz = e_gg))
  & (V_uu = false)) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~
  (((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg))
  & (V_zz = e_ff)) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false)))) & ~ (((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~
  (V_zz = e_gg)) & (V_zz = e_ff)) & (V_uu = true)) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false))) & ~ (((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & ~ (V_zz = e_gg)) & (V_zz = e_ff)) & (V_uu = true))
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & ~ (((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & (V_zz = e_ff))
  & (V_uu = false)) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))
  & (e_bb = e_gg)) & (V_bbee = V_yy))) & ~ (((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ff)) & (V_zz = e_ee)) & ~ ((((V_uu = false)
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = true)
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & ~ ((((V_uu = true)
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = false)
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false)))) & ~ ((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff)) & (V_zz = e_ee))
  & (V_uu = false)) & (V_vv = true)) & (V_ww = false)) & (V_xx = false))
  & (($lesseq($sum($difference($difference($sum(V_bbcc,1),V_bbbb),1),1),V_bbii)
  & ((V_bbcc = $sum(V_yy,1)) & (e_bb = e_ee))) | (~
  $lesseq($sum($difference($difference($sum(V_bbcc,1),V_bbbb),1),1),V_bbii)
  & ((V_bbdd = $sum(V_yy,1)) & (e_bb = e_ff)))))) & ~ ((((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff)) & (V_zz = e_ee))
  & (V_uu = true)) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))
  & (e_bb = e_gg)) & (V_bbdd = V_bbcc)) & (V_bbee = $sum(V_yy,1)))) & ~
  ((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff))
  & (V_zz = e_ee)) & (V_uu = true)) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))
  & (($lesseq($sum($difference($difference($sum(V_bbcc,1),V_bbbb),1),1),V_bbii)
  & ((V_bbcc = $sum(V_yy,1)) & (e_bb = e_ee))) | ~
  $lesseq($sum($difference($difference($sum(V_bbcc,1),V_bbbb),1),1),V_bbii))))
  & ~ ((((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff))
  & (V_zz = e_ee)) & (V_uu = false)) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false)) & (e_bb = e_gg)) & (V_bbdd = V_bbcc)) & (V_bbee = V_yy)))
  & ~ (((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ee))
  & (V_zz = e_dd)) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false)))) & ~ (((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_ee)) & (V_zz = e_dd)) & (V_uu = false)) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false)) & (V_bbcc = $sum(V_yy,1)))
  & (e_bb = e_ee))) & ~ (((((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_ee)) & (V_zz = e_dd)) & (V_uu = true)) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false)) & (e_bb = e_gg)) & (V_bbcc = V_bbbb))
  & (V_bbdd = V_bbbb)) & (V_bbee = $sum(V_yy,1)))) & ~ (((((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ee)) & (V_zz = e_dd))
  & (V_uu = false)) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))
  & (e_bb = e_gg)) & (V_bbcc = V_bbbb)) & (V_bbdd = V_bbbb))
  & (V_bbee = V_yy))) & ~ ((((((((((~ (V_zz = e_ii) & ~ (V_zz = e_hh)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_dd))
  & (V_zz = e_cc)) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false)))) & ~ ((((((((((~ (V_zz = e_ii) & ~ (V_zz = e_hh)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_dd))
  & (V_zz = e_cc)) & (V_uu = false)) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))) & ~ ((((((((((~ (V_zz = e_ii) & ~ (V_zz = e_hh)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_dd))
  & (V_zz = e_cc)) & (V_uu = true)) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ (((((((((((~ (V_zz = e_ii) & ~ (V_zz = e_hh)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_dd))
  & (V_zz = e_cc)) & (V_uu = true)) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false)) & ($lesseq(V_bbjj,$difference($sum(V_yy,1),V_bbaa))
  & ((e_bb = e_dd) & (V_bbbb = $sum(V_yy,1)))))))).

tff(f88, type, f88: (enum_aa * $int * bool * bool * bool * bool * $int *
  $int * $int * $int * $int * enum_aa * $int * bool * bool * bool * bool *
  $int * $int * $int * $int * $int * $int * $int * $int * set($int) *
  set($int) * set($int) * set($int) * $int * $int * $int * $int * $int *
  $int * $int * $int * $int * $int * $int * $int) > $o).

tff(f88_def, axiom, ![V_zz:enum_aa, V_yy:$int, V_xx:bool, V_ww:bool, V_vv:
  bool, V_uu:bool, V_tt:$int, V_ss:$int, V_rr:$int, V_qq:$int, V_pp:$int,
  V_oo:enum_aa, V_nn:$int, V_mm:bool, V_ll:bool, V_kk:bool, V_jj:bool,
  V_bbxx:$int, V_bbww:$int, V_bbvv:$int, V_bbuu:$int, V_bbtt:$int, V_bbss:
  $int, V_bbrr:$int, V_bbqq:$int, V_bbpp:set($int), V_bboo:set($int), V_bbnn:
  set($int), V_bbmm:set($int), V_bbll:$int, V_bbkk:$int, V_bbjj:$int, V_bbii:
  $int, V_bbhh:$int, V_bbgg:$int, V_bbff:$int, V_bbee:$int, V_bbdd:$int,
  V_bbcc:$int, V_bbbb:$int, V_bbaa:$int]: (f88(V_zz, V_yy, V_xx, V_ww, V_vv,
  V_uu, V_tt, V_ss, V_rr, V_qq, V_pp, V_oo, V_nn, V_mm, V_ll, V_kk, V_jj,
  V_bbxx, V_bbww, V_bbvv, V_bbuu, V_bbtt, V_bbss, V_bbrr, V_bbqq, V_bbpp,
  V_bboo, V_bbnn, V_bbmm, V_bbll, V_bbkk, V_bbjj, V_bbii, V_bbhh, V_bbgg,
  V_bbff, V_bbee, V_bbdd, V_bbcc, V_bbbb, V_bbaa)
  <=> ((((((((((((((((((((((((((((((((((((((((((((((((($true & ~
  (V_zz = e_bb)) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_ii))
  & mem($int, $sum(V_yy,1), integer)) & $lesseq(0,$sum(V_yy,1))) & ~ (((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_ii)))
  & ~ ((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_hh))
  & (V_zz = e_ii)) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))) & ~ ((((V_uu = false) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))) & (V_zz = e_bb))) & ~ ((((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_hh)) & (V_zz = e_ii)) & (V_uu = false))
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false)) & (V_zz = e_bb))) & ~
  ((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_hh))
  & (V_zz = e_ii)) & (V_uu = true)) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false)) & (V_zz = e_bb))) & ~ ((((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_hh)) & (V_zz = e_ii)) & (V_uu = true))
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false)) & (V_zz = e_bb))) & ~
  ((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_hh))
  & (V_zz = e_ii)) & (V_uu = false)) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false))
  & ($lesseq($sum($difference(V_yy,V_bbee),1),$sum(V_bbff,V_bbgg)) | (~
  $lesseq($sum($difference(V_yy,V_bbee),1),$sum(V_bbff,V_bbgg))
  & (V_zz = e_bb))))) & ~ ((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~
  (V_zz = e_ii)) & (V_zz = e_hh)) & ~ ((((V_uu = false) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = false) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false))) & (V_zz = e_bb))) & ~ (((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ii)) & (V_zz = e_hh))
  & (V_uu = false)) & (V_vv = true)) & (V_ww = false)) & (V_xx = false))
  & (V_zz = e_gg)) & (V_bbee = $sum(V_yy,1)))) & ~ (((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ii)) & (V_zz = e_hh))
  & (V_uu = true)) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))
  & (V_zz = e_gg)) & (V_bbee = $sum(V_yy,1)))) & ~ (((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ii)) & (V_zz = e_hh))
  & (V_uu = true)) & (V_vv = true)) & (V_ww = false)) & (V_xx = false))
  & (V_zz = e_gg)) & (V_bbee = $sum(V_yy,1)))) & ~ ((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ii)) & (V_zz = e_hh))
  & (V_uu = false)) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))
  & ($lesseq($sum($difference($difference($sum(V_yy,1),V_bbee),1),1),V_bbff)
  | (~
  $lesseq($sum($difference($difference($sum(V_yy,1),V_bbee),1),1),V_bbff)
  & (V_zz = e_ii))))) & ~ ((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & (V_zz = e_gg)) & ~ ((((V_uu = false) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = false) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false))) & (V_zz = e_bb))) & ~ ((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & (V_zz = e_gg))
  & (V_uu = false)) & (V_vv = true)) & (V_ww = false)) & (V_xx = false))
  & (($lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)
  & ((V_zz = e_gg) & (V_bbee = $sum(V_yy,1)))) | (~
  $lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)
  & (V_zz = e_bb))))) & ~ ((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & (V_zz = e_gg)) & (V_uu = true)) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false))
  & (($lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)
  & ((V_zz = e_gg) & (V_bbee = $sum(V_yy,1)))) | (~
  $lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)
  & (V_zz = e_bb))))) & ~ ((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & (V_zz = e_gg)) & (V_uu = true)) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false))
  & (($lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)
  & ((V_zz = e_gg) & (V_bbee = $sum(V_yy,1)))) | (~
  $lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)
  & (V_zz = e_bb))))) & ~ ((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & (V_zz = e_gg)) & (V_uu = false)) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false))
  & (($lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)
  & (V_zz = e_hh)) | (~
  $lesseq($difference($difference($sum(V_yy,1),V_bbdd),1),V_bbhh)
  & (V_zz = e_bb))))) & ~ ((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & (V_zz = e_gg)) & (V_zz = e_bb)) & ~ ((((V_uu = false)
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = true)
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & ~ ((((V_uu = true)
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = false)
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false)))) & ~ ((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & (V_zz = e_gg))
  & (V_zz = e_bb)) & (V_uu = false)) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))) & ~ ((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & (V_zz = e_gg)) & (V_zz = e_bb)) & (V_uu = true))
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~ ((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & (V_zz = e_gg))
  & (V_zz = e_bb)) & (V_uu = true)) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))) & ~ ((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & (V_zz = e_gg)) & (V_zz = e_bb)) & (V_uu = false))
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~ ((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & (V_zz = e_ff)) & ~
  ((((V_uu = false) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~
  ((((V_uu = true) & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & ~
  ((((V_uu = true) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~
  ((((V_uu = false) & (V_vv = true)) & (V_ww = false)) & (V_xx = false)))
  & (V_zz = e_bb))) & ~ ((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~
  (V_zz = e_gg)) & (V_zz = e_ff)) & (V_uu = false)) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false)) & (V_bbdd = $sum(V_yy,1)))) & ~
  ((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg))
  & (V_zz = e_ff)) & (V_uu = true)) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false)) & (V_zz = e_bb))) & ~ ((((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & ~ (V_zz = e_gg)) & (V_zz = e_ff)) & (V_uu = true))
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false)) & (V_zz = e_bb))) & ~
  (((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg))
  & (V_zz = e_ff)) & (V_uu = false)) & (V_vv = true)) & (V_ww = true))
  & (V_xx = false)) & (V_zz = e_gg)) & (V_bbee = V_yy))) & ~ ((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff)) & (V_zz = e_ee)) & ~
  ((((V_uu = false) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~
  ((((V_uu = true) & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & ~
  ((((V_uu = true) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~
  ((((V_uu = false) & (V_vv = true)) & (V_ww = false)) & (V_xx = false)))
  & (V_zz = e_bb))) & ~ ((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_dd)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~
  (V_zz = e_ff)) & (V_zz = e_ee)) & (V_uu = false)) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false))
  & (($lesseq($sum($difference($difference($sum(V_bbcc,1),V_bbbb),1),1),V_bbii)
  & ((V_bbcc = $sum(V_yy,1)) & (V_zz = e_ee))) | (~
  $lesseq($sum($difference($difference($sum(V_bbcc,1),V_bbbb),1),1),V_bbii)
  & ((V_bbdd = $sum(V_yy,1)) & (V_zz = e_ff)))))) & ~ ((((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~ (V_zz = e_ii)) & ~
  (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff)) & (V_zz = e_ee))
  & (V_uu = true)) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))
  & (V_zz = e_gg)) & (V_bbdd = V_bbcc)) & (V_bbee = $sum(V_yy,1)))) & ~
  ((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_dd)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff))
  & (V_zz = e_ee)) & (V_uu = true)) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false))
  & (($lesseq($sum($difference($difference($sum(V_bbcc,1),V_bbbb),1),1),V_bbii)
  & ((V_bbcc = $sum(V_yy,1)) & (V_zz = e_ee))) | (~
  $lesseq($sum($difference($difference($sum(V_bbcc,1),V_bbbb),1),1),V_bbii)
  & (V_zz = e_bb))))) & ~ ((((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc))
  & ~ (V_zz = e_dd)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg))
  & ~ (V_zz = e_ff)) & (V_zz = e_ee)) & (V_uu = false)) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false)) & (V_zz = e_gg)) & (V_bbdd = V_bbcc))
  & (V_bbee = V_yy))) & ~ ((((((((((((~ (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~
  (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_ee)) & (V_zz = e_dd)) & ~ ((((V_uu = false) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false))) & ~ ((((V_uu = true) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false))) & ~ ((((V_uu = false) & (V_vv = true))
  & (V_ww = false)) & (V_xx = false))) & (V_zz = e_bb))) & ~ (((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ee)) & (V_zz = e_dd))
  & (V_uu = false)) & (V_vv = true)) & (V_ww = false)) & (V_xx = false))
  & (V_bbcc = $sum(V_yy,1))) & (V_zz = e_ee))) & ~ (((((((((((((((~
  (V_zz = e_bb) & ~ (V_zz = e_cc)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ee)) & (V_zz = e_dd))
  & (V_uu = true)) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))
  & (V_zz = e_gg)) & (V_bbcc = V_bbbb)) & (V_bbdd = V_bbbb))
  & (V_bbee = $sum(V_yy,1)))) & ~ (((((((((((((((~ (V_zz = e_bb) & ~
  (V_zz = e_cc)) & ~ (V_zz = e_ii)) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_ee)) & (V_zz = e_dd)) & (V_uu = false))
  & (V_vv = true)) & (V_ww = true)) & (V_xx = false)) & (V_zz = e_gg))
  & (V_bbcc = V_bbbb)) & (V_bbdd = V_bbbb)) & (V_bbee = V_yy))) & ~
  (((((((((((~ (V_zz = e_ii) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~
  (V_zz = e_ff)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_dd)) & (V_zz = e_cc)) & ~
  ((((V_uu = false) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~
  ((((V_uu = true) & (V_vv = true)) & (V_ww = false)) & (V_xx = false))) & ~
  ((((V_uu = true) & (V_vv = true)) & (V_ww = true)) & (V_xx = false))) & ~
  ((((V_uu = false) & (V_vv = true)) & (V_ww = false)) & (V_xx = false)))
  & (V_zz = e_bb))) & ~ (((((((((((~ (V_zz = e_ii) & ~ (V_zz = e_hh)) & ~
  (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ee)) & ~ (V_zz = e_dd))
  & (V_zz = e_cc)) & (V_uu = false)) & (V_vv = true)) & (V_ww = false))
  & (V_xx = false)) & (V_zz = e_bb))) & ~ (((((((((((~ (V_zz = e_ii) & ~
  (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~ (V_zz = e_ee)) & ~
  (V_zz = e_dd)) & (V_zz = e_cc)) & (V_uu = true)) & (V_vv = true))
  & (V_ww = true)) & (V_xx = false)) & (V_zz = e_bb))) & ~ (((((((((((~
  (V_zz = e_ii) & ~ (V_zz = e_hh)) & ~ (V_zz = e_gg)) & ~ (V_zz = e_ff)) & ~
  (V_zz = e_ee)) & ~ (V_zz = e_dd)) & (V_zz = e_cc)) & (V_uu = true))
  & (V_vv = true)) & (V_ww = false)) & (V_xx = false))
  & (($lesseq(V_bbjj,$difference($sum(V_yy,1),V_bbaa)) & ((V_zz = e_dd)
  & (V_bbbb = $sum(V_yy,1)))) | ~
  $lesseq(V_bbjj,$difference($sum(V_yy,1),V_bbaa))))))).

tff(bbyy_25, conjecture, ![V_zz:enum_aa, V_yy:$int, V_xx:bool, V_ww:bool,
  V_vv:bool, V_uu:bool, V_tt:$int, V_ss:$int, V_rr:$int, V_qq:$int, V_pp:
  $int, V_oo:enum_aa, V_nn:$int, V_mm:bool, V_ll:bool, V_kk:bool, V_jj:bool,
  V_bbxx:$int, V_bbww:$int, V_bbvv:$int, V_bbuu:$int, V_bbtt:$int, V_bbss:
  $int, V_bbrr:$int, V_bbqq:$int, V_bbpp:set($int), V_bboo:set($int), V_bbnn:
  set($int), V_bbmm:set($int), V_bbll:$int, V_bbkk:$int, V_bbjj:$int, V_bbii:
  $int, V_bbhh:$int, V_bbgg:$int, V_bbff:$int, V_bbee:$int, V_bbdd:$int,
  V_bbcc:$int, V_bbbb:$int, V_bbaa:$int]: ((f1(V_zz, V_yy, V_xx, V_ww, V_vv,
  V_uu, V_tt, V_ss, V_rr, V_qq, V_pp, V_oo, V_nn, V_mm, V_ll, V_kk, V_jj,
  V_bbxx, V_bbww, V_bbvv, V_bbuu, V_bbtt, V_bbss, V_bbrr, V_bbqq, V_bbpp,
  V_bboo, V_bbnn, V_bbmm, V_bbll, V_bbkk, V_bbjj, V_bbii, V_bbhh, V_bbgg,
  V_bbff, V_bbee, V_bbdd, V_bbcc, V_bbbb, V_bbaa) & (f2(V_zz, V_yy, V_xx,
  V_ww, V_vv, V_uu, V_tt, V_ss, V_rr, V_qq, V_pp, V_oo, V_nn, V_mm, V_ll,
  V_kk, V_jj, V_bbxx, V_bbww, V_bbvv, V_bbuu, V_bbtt, V_bbss, V_bbrr, V_bbqq,
  V_bbpp, V_bboo, V_bbnn, V_bbmm, V_bbll, V_bbkk, V_bbjj, V_bbii, V_bbhh,
  V_bbgg, V_bbff, V_bbee, V_bbdd, V_bbcc, V_bbbb, V_bbaa) & (f3(V_zz, V_yy,
  V_xx, V_ww, V_vv, V_uu, V_tt, V_ss, V_rr, V_qq, V_pp, V_oo, V_nn, V_mm,
  V_ll, V_kk, V_jj, V_bbxx, V_bbww, V_bbvv, V_bbuu, V_bbtt, V_bbss, V_bbrr,
  V_bbqq, V_bbpp, V_bboo, V_bbnn, V_bbmm, V_bbll, V_bbkk, V_bbjj, V_bbii,
  V_bbhh, V_bbgg, V_bbff, V_bbee, V_bbdd, V_bbcc, V_bbbb, V_bbaa)
  & (f24(V_zz, V_yy, V_xx, V_ww, V_vv, V_uu, V_tt, V_ss, V_rr, V_qq, V_pp,
  V_oo, V_nn, V_mm, V_ll, V_kk, V_jj, V_bbxx, V_bbww, V_bbvv, V_bbuu, V_bbtt,
  V_bbss, V_bbrr, V_bbqq, V_bbpp, V_bboo, V_bbnn, V_bbmm, V_bbll, V_bbkk,
  V_bbjj, V_bbii, V_bbhh, V_bbgg, V_bbff, V_bbee, V_bbdd, V_bbcc, V_bbbb,
  V_bbaa) & ($true & $true))))) => ((V_bbbb = V_bbdd) & $true))).
