%--------------------------------------------------------------------------
% File     : SWC359+1 : TPTP v6.1.0. Released v2.4.0.
% Domain   : Software Creation
% Problem  : cond_segment_ne_x_run_eq_max1
% Version  : [Wei00] axioms.
% English  : Find components in a software library that match a given target
%            specification given in first-order logic. The components are
%            specified in first-order logic as well. The problem represents
%            a test of one library module specification against a target
%            specification.

% Refs     : [Wei00] Weidenbach (2000), Software Reuse of List Functions Ve
%          : [FSS98] Fischer et al. (1998), Deduction-Based Software Compon
% Source   : [Wei00]
% Names    : cond_segment_ne_x_run_eq_max1 [Wei00]

% Status   : Theorem
% Rating   : 0.12 v6.1.0, 0.10 v6.0.0, 0.09 v5.5.0, 0.04 v5.3.0, 0.11 v5.2.0, 0.05 v5.0.0, 0.00 v4.0.1, 0.04 v4.0.0, 0.08 v3.7.0, 0.00 v3.4.0, 0.11 v3.3.0, 0.00 v2.4.0
% Syntax   : Number of formulae    :   96 (   9 unit)
%            Number of atoms       :  409 (  73 equality)
%            Maximal formula depth :   20 (   7 average)
%            Number of connectives :  342 (  29 ~  ;  14  |;  42  &)
%                                         (  26 <=>; 231 =>;   0 <=)
%                                         (   0 <~>;   0 ~|;   0 ~&)
%            Number of predicates  :   20 (   0 propositional; 1-2 arity)
%            Number of functors    :    5 (   1 constant; 0-2 arity)
%            Number of variables   :  208 (   0 singleton; 194 !;  14 ?)
%            Maximal term depth    :    4 (   1 average)
% SPC      : FOF_THM_RFO_SEQ

% Comments :
%--------------------------------------------------------------------------
%----Include list specification axioms
include('Axioms/SWC001+0.ax').
%--------------------------------------------------------------------------
fof(co1,conjecture,
    ( ! [U] :
        ( ssList(U)
       => ! [V] :
            ( ssList(V)
           => ! [W] :
                ( ssList(W)
               => ! [X] :
                    ( ssList(X)
                   => ( V != X
                      | U != W
                      | ~ neq(V,nil)
                      | ~ segmentP(X,W)
                      | ~ equalelemsP(W)
                      | ? [Y] :
                          ( ssList(Y)
                          & neq(W,Y)
                          & segmentP(X,Y)
                          & segmentP(Y,W)
                          & equalelemsP(Y) )
                      | segmentP(V,U) ) ) ) ) ) )).

%--------------------------------------------------------------------------
