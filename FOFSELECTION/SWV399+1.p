%------------------------------------------------------------------------------
% File     : SWV399+1 : TPTP v6.1.0. Released v3.3.0.
% Domain   : Software Verification
% Problem  : Priority queue checker: tmp_not_check_03_1
% Version  : [dNP05] axioms.
% English  :

% Refs     : [Pis06] Piskac (2006), Email to Geoff Sutcliffe
%          : [dNP05] de Nivelle & Piskac (2005), Verification of an Off-Lin
% Source   : [Pis06]
% Names    : cpq_l035 [Pis06]

% Status   : Theorem
% Rating   : 0.16 v6.1.0, 0.10 v6.0.0, 0.09 v5.5.0, 0.07 v5.4.0, 0.11 v5.3.0, 0.19 v5.2.0, 0.10 v5.0.0, 0.12 v4.1.0, 0.17 v4.0.1, 0.13 v4.0.0, 0.12 v3.7.0, 0.10 v3.5.0, 0.11 v3.4.0, 0.21 v3.3.0
% Syntax   : Number of formulae    :   21 (   9 unit)
%            Number of atoms       :   44 (  12 equality)
%            Maximal formula depth :    9 (   5 average)
%            Number of connectives :   29 (   6 ~  ;   3  |;   9  &)
%                                         (   3 <=>;   8 =>;   0 <=)
%                                         (   0 <~>;   0 ~|;   0 ~&)
%            Number of predicates  :    6 (   0 propositional; 1-3 arity)
%            Number of functors    :    7 (   2 constant; 0-2 arity)
%            Number of variables   :   61 (   0 singleton;  57 !;   4 ?)
%            Maximal term depth    :    4 (   1 average)
% SPC      : FOF_THM_RFO_SEQ

% Comments :
%------------------------------------------------------------------------------
%----Include the axioms about priority queues and checked priority queues
include('Axioms/SWV007+0.ax').
include('Axioms/SWV007+2.ax').
%------------------------------------------------------------------------------
%----tmp_not_check_03_2 (cpq_l036.p, cpq_l037.p)
fof(l35_li3637,lemma,(
    ! [U,V,W,X] :
      ( ( pair_in_list(U,V,W)
        & less_than(X,W) )
     => pair_in_list(update_slb(U,X),V,W) ) )).

%----tmp_not_check_03_3 (cpq_l038.p, cpq_l039.p)
fof(l35_li3839,lemma,(
    ! [U,V,W,X] :
      ( ( pair_in_list(U,V,W)
        & strictly_less_than(W,X) )
     => pair_in_list(update_slb(U,X),V,X) ) )).

%----tmp_not_check_03_1 (conjecture)
fof(l35_co,conjecture,(
    ! [U] :
      ( ? [V,W] :
          ( pair_in_list(U,V,W)
          & strictly_less_than(V,W) )
     => ! [X] :
        ? [Y,Z] :
          ( pair_in_list(update_slb(U,X),Y,Z)
          & strictly_less_than(Y,Z) ) ) )).
%------------------------------------------------------------------------------
