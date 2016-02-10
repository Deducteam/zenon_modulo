%------------------------------------------------------------------------------
% File     : SWV383+1 : TPTP v6.1.0. Released v3.3.0.
% Domain   : Software Verification
% Problem  : Priority queue checker: lemma_not_check_not_phi
% Version  : [dNP05] axioms.
% English  :

% Refs     : [Pis06] Piskac (2006), Email to Geoff Sutcliffe
%          : [dNP05] de Nivelle & Piskac (2005), Verification of an Off-Lin
% Source   : [Pis06]
% Names    : cpq_l019 [Pis06]

% Status   : Theorem
% Rating   : 0.24 v6.1.0, 0.13 v5.5.0, 0.15 v5.4.0, 0.18 v5.3.0, 0.22 v5.2.0, 0.15 v5.1.0, 0.14 v5.0.0, 0.17 v4.1.0, 0.22 v4.0.0, 0.25 v3.5.0, 0.26 v3.4.0, 0.21 v3.3.0
% Syntax   : Number of formulae    :   20 (   9 unit)
%            Number of atoms       :   43 (  12 equality)
%            Maximal formula depth :   11 (   5 average)
%            Number of connectives :   36 (  13 ~  ;   6  |;   5  &)
%                                         (   3 <=>;   9 =>;   0 <=)
%                                         (   0 <~>;   0 ~|;   0 ~&)
%            Number of predicates  :    9 (   0 propositional; 1-3 arity)
%            Number of functors    :    8 (   2 constant; 0-3 arity)
%            Number of variables   :   59 (   0 singleton;  59 !;   0 ?)
%            Maximal term depth    :    4 (   2 average)
% SPC      : FOF_THM_RFO_SEQ

% Comments :
%------------------------------------------------------------------------------
%----Include the axioms about priority queues and checked priority queues
include('Axioms/SWV007+0.ax').
include('Axioms/SWV007+2.ax').
include('Axioms/SWV007+3.ax').
%------------------------------------------------------------------------------
%----lemma_not_min_elem_not_check_induction (cpq_l020.p)
fof(l19_l20,lemma,(
    ! [U,V,W] :
      ( ( ~ check_cpq(triple(U,V,W))
        | ~ ok(triple(U,V,W)) )
     => ! [X,Y,Z] :
          ( succ_cpq(triple(U,V,W),triple(X,Y,Z))
         => ( ~ ok(triple(X,Y,Z))
            | ~ check_cpq(triple(X,Y,Z)) ) ) ) )).

%----lemma_not_check_not_phi (conjecture)
fof(l19_co,conjecture,(
    ! [U,V,W] :
      ( ~ check_cpq(triple(U,V,W))
     => ! [X,Y,Z] :
          ( succ_cpq(triple(U,V,W),triple(X,Y,Z))
         => ( ~ ok(triple(X,Y,Z))
            | ~ check_cpq(triple(X,Y,Z)) ) ) ) )).
%------------------------------------------------------------------------------
