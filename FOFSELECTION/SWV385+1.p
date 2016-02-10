%------------------------------------------------------------------------------
% File     : SWV385+1 : TPTP v6.1.0. Released v3.3.0.
% Domain   : Software Verification
% Problem  : Priority queue checker: lemma_not_min_elem_not_check_induction02
% Version  : [dNP05] axioms.
% English  :

% Refs     : [Pis06] Piskac (2006), Email to Geoff Sutcliffe
%          : [dNP05] de Nivelle & Piskac (2005), Verification of an Off-Lin
% Source   : [Pis06]
% Names    : cpq_l021 [Pis06]

% Status   : Theorem
% Rating   : 0.20 v6.1.0, 0.13 v5.5.0, 0.11 v5.4.0, 0.18 v5.3.0, 0.19 v5.2.0, 0.15 v5.1.0, 0.14 v5.0.0, 0.12 v4.1.0, 0.17 v4.0.0, 0.21 v3.7.0, 0.15 v3.5.0, 0.16 v3.4.0, 0.21 v3.3.0
% Syntax   : Number of formulae    :   44 (  16 unit)
%            Number of atoms       :   91 (  29 equality)
%            Maximal formula depth :    9 (   5 average)
%            Number of connectives :   69 (  22 ~  ;   6  |;  12  &)
%                                         (   7 <=>;  22 =>;   0 <=)
%                                         (   0 <~>;   0 ~|;   0 ~&)
%            Number of predicates  :   11 (   1 propositional; 0-3 arity)
%            Number of functors    :   19 (   3 constant; 0-3 arity)
%            Number of variables   :  126 (   4 singleton; 126 !;   0 ?)
%            Maximal term depth    :    4 (   2 average)
% SPC      : FOF_THM_RFO_SEQ

% Comments :
%------------------------------------------------------------------------------
%----Include the axioms about priority queues and checked priority queues
include('Axioms/SWV007+0.ax').
include('Axioms/SWV007+2.ax').
include('Axioms/SWV007+3.ax').
%------------------------------------------------------------------------------
%----lemma_not_ok_persistence_induction (cpq_l013.p .. cpq_l016.p)
fof(l21_li1316,lemma,(
    ! [U,V,W] :
      ( ~ ok(triple(U,V,W))
     => ~ ok(im_succ_cpq(triple(U,V,W))) ) )).

%----lemma_not_min_elem_not_check_ind_steps (cpq_l022.p .. cpq_l025.p)
fof(l21_li2225,lemma,(
    ! [U,V,W] :
      ( ~ check_cpq(triple(U,V,W))
     => ( ~ check_cpq(im_succ_cpq(triple(U,V,W)))
        | ~ ok(im_succ_cpq(triple(U,V,W))) ) ) )).

%----lemma_not_min_elem_not_check_induction02 (conjecture)
fof(l21_co,conjecture,(
    ! [U,V,W] :
      ( ( ~ check_cpq(triple(U,V,W))
        | ~ ok(triple(U,V,W)) )
     => ( ~ check_cpq(im_succ_cpq(triple(U,V,W)))
        | ~ ok(im_succ_cpq(triple(U,V,W))) ) ) )).
%------------------------------------------------------------------------------
