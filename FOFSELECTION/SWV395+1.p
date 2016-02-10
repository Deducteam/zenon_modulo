%------------------------------------------------------------------------------
% File     : SWV395+1 : TPTP v6.1.0. Released v3.3.0.
% Domain   : Software Verification
% Problem  : Priority queue checker: tmp_not_check_02_2_1 base
% Version  : [dNP05] axioms.
% English  :

% Refs     : [Pis06] Piskac (2006), Email to Geoff Sutcliffe
%          : [dNP05] de Nivelle & Piskac (2005), Verification of an Off-Lin
% Source   : [Pis06]
% Names    : cpq_l031 [Pis06]

% Status   : Theorem
% Rating   : 0.16 v6.1.0, 0.10 v6.0.0, 0.09 v5.5.0, 0.04 v5.3.0, 0.11 v5.2.0, 0.05 v5.0.0, 0.08 v4.1.0, 0.09 v4.0.0, 0.12 v3.7.0, 0.15 v3.5.0, 0.16 v3.4.0, 0.11 v3.3.0
% Syntax   : Number of formulae    :   42 (  16 unit)
%            Number of atoms       :   86 (  29 equality)
%            Maximal formula depth :    9 (   5 average)
%            Number of connectives :   57 (  13 ~  ;   3  |;  14  &)
%                                         (   7 <=>;  20 =>;   0 <=)
%                                         (   0 <~>;   0 ~|;   0 ~&)
%            Number of predicates  :   11 (   1 propositional; 0-3 arity)
%            Number of functors    :   18 (   3 constant; 0-3 arity)
%            Number of variables   :  121 (   4 singleton; 121 !;   0 ?)
%            Maximal term depth    :    4 (   2 average)
% SPC      : FOF_THM_RFO_SEQ

% Comments :
%------------------------------------------------------------------------------
%----Include the axioms about priority queues and checked priority queues
include('Axioms/SWV007+0.ax').
include('Axioms/SWV007+2.ax').
include('Axioms/SWV007+3.ax').
%------------------------------------------------------------------------------
%----goal: fof(l30_li3132, lemma, (! [U,V,W,X,Y] :
%----    ((pair_in_list(V,X,Y) & (strictly_less_than(X,Y) &
%----        ok(remove_cpq(triple(U,V,W),X)))) =>
%----        pair_in_list(remove_slb(V,X),X,Y)))).

%----tmp_not_check_02_2_1::base (conjecture)
fof(l31_co,conjecture,(
    ! [U,V,W,X] :
      ( ( pair_in_list(create_slb,W,X)
        & strictly_less_than(W,X)
        & ok(remove_cpq(triple(U,create_slb,V),W)) )
     => pair_in_list(remove_slb(create_slb,W),W,X) ) )).
%------------------------------------------------------------------------------
