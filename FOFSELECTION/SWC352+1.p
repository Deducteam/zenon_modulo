%--------------------------------------------------------------------------
% File     : SWC352+1 : TPTP v6.1.0. Released v2.4.0.
% Domain   : Software Creation
% Problem  : cond_segment_front_x_ne_segment_front_total1
% Version  : [Wei00] axioms.
% English  : Find components in a software library that match a given target
%            specification given in first-order logic. The components are
%            specified in first-order logic as well. The problem represents
%            a test of one library module specification against a target
%            specification.

% Refs     : [Wei00] Weidenbach (2000), Software Reuse of List Functions Ve
%          : [FSS98] Fischer et al. (1998), Deduction-Based Software Compon
% Source   : [Wei00]
% Names    : cond_segment_front_x_ne_segment_front_total1 [Wei00]

% Status   : Theorem
% Rating   : 0.20 v6.0.0, 0.13 v5.5.0, 0.22 v5.4.0, 0.29 v5.3.0, 0.33 v5.2.0, 0.25 v5.1.0, 0.24 v5.0.0, 0.21 v4.1.0, 0.26 v4.0.1, 0.35 v4.0.0, 0.33 v3.7.0, 0.30 v3.5.0, 0.26 v3.3.0, 0.14 v3.2.0, 0.09 v3.1.0, 0.11 v2.7.0, 0.17 v2.5.0, 0.00 v2.4.0
% Syntax   : Number of formulae    :   96 (   9 unit)
%            Number of atoms       :  406 (  75 equality)
%            Maximal formula depth :   17 (   7 average)
%            Number of connectives :  339 (  29 ~  ;  13  |;  40  &)
%                                         (  26 <=>; 231 =>;   0 <=)
%                                         (   0 <~>;   0 ~|;   0 ~&)
%            Number of predicates  :   20 (   0 propositional; 1-2 arity)
%            Number of functors    :    5 (   1 constant; 0-2 arity)
%            Number of variables   :  207 (   0 singleton; 194 !;  13 ?)
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
                      | frontsegP(V,U)
                      | ( nil != W
                        & nil = X )
                      | ( neq(X,nil)
                        & ( ~ neq(W,nil)
                          | ~ frontsegP(X,W) ) ) ) ) ) ) ) )).

%--------------------------------------------------------------------------
