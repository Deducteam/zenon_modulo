%------------------------------------------------------------------------------
% File     : SWV371+1 : TPTP v6.1.0. Released v3.3.0.
% Domain   : Software Verification
% Problem  : Priority queue checker: lemma_pi_min_elem
% Version  : [dNP05] axioms.
% English  :

% Refs     : [Pis06] Piskac (2006), Email to Geoff Sutcliffe
%          : [dNP05] de Nivelle & Piskac (2005), Verification of an Off-Lin
% Source   : [Pis06]
% Names    : cpq_l007 [Pis06]

% Status   : Theorem
% Rating   : 0.32 v6.1.0, 0.23 v6.0.0, 0.17 v5.5.0, 0.26 v5.4.0, 0.32 v5.3.0, 0.44 v5.2.0, 0.30 v5.1.0, 0.29 v4.1.0, 0.35 v4.0.0, 0.38 v3.7.0, 0.35 v3.5.0, 0.32 v3.4.0, 0.37 v3.3.0
% Syntax   : Number of formulae    :   65 (  23 unit)
%            Number of atoms       :  134 (  40 equality)
%            Maximal formula depth :    9 (   5 average)
%            Number of connectives :   85 (  16 ~  ;   4  |;  21  &)
%                                         (  16 <=>;  28 =>;   0 <=)
%                                         (   0 <~>;   0 ~|;   0 ~&)
%            Number of predicates  :   21 (   1 propositional; 0-3 arity)
%            Number of functors    :   26 (   4 constant; 0-3 arity)
%            Number of variables   :  172 (   4 singleton; 169 !;   3 ?)
%            Maximal term depth    :    5 (   2 average)
% SPC      : FOF_THM_RFO_SEQ

% Comments :
%------------------------------------------------------------------------------
%----Include the axioms about priority queues and checked priority queues
include('Axioms/SWV007+0.ax').
include('Axioms/SWV007+1.ax').
include('Axioms/SWV007+2.ax').
include('Axioms/SWV007+3.ax').
include('Axioms/SWV007+4.ax').
%------------------------------------------------------------------------------
%----lemma_contains_cpq_min_elem (cpq_l008.p)
fof(l7_l8,lemma,(
    ! [U,V,W] :
      ( phi(findmin_cpq_eff(triple(U,V,W)))
     => contains_pq(i(triple(U,V,W)),findmin_cpq_res(triple(U,V,W))) ) )).

%----lemma_min_elem_smallest (cpq_l017.p)
fof(l7_lX,lemma,(
    ! [U,V,W] :
      ( phi(findmin_cpq_eff(triple(U,V,W)))
     => issmallestelement_pq(i(triple(U,V,W)),findmin_cpq_res(triple(U,V,W))) ) )).

%----lemma_pi_min_elem (conjecture)
fof(l7_co,conjecture,(
    ! [U,V,W] :
      ( phi(findmin_cpq_eff(triple(U,V,W)))
     => pi_sharp_find_min(i(triple(U,V,W)),findmin_cpq_res(triple(U,V,W))) ) )).
%------------------------------------------------------------------------------
