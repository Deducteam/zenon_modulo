%------------------------------------------------------------------------------
% File     : SWV388+1 : TPTP v6.1.0. Released v3.3.0.
% Domain   : Software Verification
% Problem  : Priority queue checker: lemma_not_min_elem_not_check_ind_steps 3
% Version  : [dNP05] axioms.
% English  :

% Refs     : [Pis06] Piskac (2006), Email to Geoff Sutcliffe
%          : [dNP05] de Nivelle & Piskac (2005), Verification of an Off-Lin
% Source   : [Pis06]
% Names    : cpq_l024 [Pis06]

% Status   : Theorem
% Rating   : 0.16 v6.1.0, 0.10 v6.0.0, 0.09 v5.5.0, 0.04 v5.4.0, 0.11 v5.3.0, 0.15 v5.2.0, 0.05 v5.1.0, 0.10 v5.0.0, 0.12 v4.1.0, 0.17 v4.0.0, 0.21 v3.7.0, 0.30 v3.5.0, 0.47 v3.4.0, 0.21 v3.3.0
% Syntax   : Number of formulae    :   43 (  16 unit)
%            Number of atoms       :   87 (  29 equality)
%            Maximal formula depth :    9 (   5 average)
%            Number of connectives :   62 (  18 ~  ;   4  |;  12  &)
%                                         (   7 <=>;  21 =>;   0 <=)
%                                         (   0 <~>;   0 ~|;   0 ~&)
%            Number of predicates  :   11 (   1 propositional; 0-3 arity)
%            Number of functors    :   18 (   3 constant; 0-3 arity)
%            Number of variables   :  123 (   4 singleton; 123 !;   0 ?)
%            Maximal term depth    :    4 (   2 average)
% SPC      : FOF_THM_RFO_SEQ

% Comments :
%------------------------------------------------------------------------------
%----Include the axioms about priority queues and checked priority queues
include('Axioms/SWV007+0.ax').
include('Axioms/SWV007+2.ax').
include('Axioms/SWV007+3.ax').
%------------------------------------------------------------------------------
%----goal: fof(l21_li2225, lemma, (! [U,V,W] : (~(check_cpq(triple(U,V,W))) =>
%----     (~(check_cpq(im_succ_cpq(triple(U,V,W)))) |
%----    ~(ok(im_succ_cpq(triple(U,V,W)))))))).

%----tmp_not_check_03 (cpq_l034.p)
fof(l24_l34,lemma,(
    ! [U,V,W] :
      ( ~ check_cpq(triple(U,V,W))
     => ~ check_cpq(findmin_cpq_eff(triple(U,V,W))) ) )).

%----step3: findmin (conjecture)
fof(l24_co,conjecture,(
    ! [U,V,W] :
      ( ~ check_cpq(triple(U,V,W))
     => ( ~ check_cpq(findmin_cpq_eff(triple(U,V,W)))
        | ~ ok(findmin_cpq_eff(triple(U,V,W))) ) ) )).
%------------------------------------------------------------------------------
