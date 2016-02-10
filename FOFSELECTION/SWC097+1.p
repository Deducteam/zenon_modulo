%--------------------------------------------------------------------------
% File     : SWC097+1 : TPTP v6.1.0. Released v2.4.0.
% Domain   : Software Creation
% Problem  : cond_lead_x_lead
% Version  : [Wei00] axioms.
% English  : Find components in a software library that match a given target
%            specification given in first-order logic. The components are
%            specified in first-order logic as well. The problem represents
%            a test of one library module specification against a target
%            specification.

% Refs     : [Wei00] Weidenbach (2000), Software Reuse of List Functions Ve
%          : [FSS98] Fischer et al. (1998), Deduction-Based Software Compon
% Source   : [Wei00]
% Names    : cond_lead_x_lead [Wei00]

% Status   : Theorem
% Rating   : 0.28 v6.1.0, 0.27 v6.0.0, 0.26 v5.5.0, 0.30 v5.4.0, 0.36 v5.3.0, 0.37 v5.2.0, 0.25 v5.1.0, 0.29 v4.1.0, 0.30 v4.0.0, 0.33 v3.7.0, 0.25 v3.5.0, 0.26 v3.4.0, 0.42 v3.3.0, 0.29 v3.2.0, 0.36 v3.1.0, 0.44 v2.7.0, 0.50 v2.4.0
% Syntax   : Number of formulae    :   96 (   9 unit)
%            Number of atoms       :  407 (  75 equality)
%            Maximal formula depth :   17 (   7 average)
%            Number of connectives :  340 (  29 ~  ;  13  |;  40  &)
%                                         (  26 <=>; 232 =>;   0 <=)
%                                         (   0 <~>;   0 ~|;   0 ~&)
%            Number of predicates  :   20 (   0 propositional; 1-2 arity)
%            Number of functors    :    5 (   1 constant; 0-2 arity)
%            Number of variables   :  209 (   0 singleton; 195 !;  14 ?)
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
                      | ( ( ~ neq(V,nil)
                          | ? [Y] :
                              ( ssItem(Y)
                              & app(U,cons(Y,nil)) = V )
                          | ! [Z] :
                              ( ssItem(Z)
                             => app(W,cons(Z,nil)) != X ) )
                        & ( ~ neq(V,nil)
                          | neq(X,nil) ) ) ) ) ) ) ) )).

%--------------------------------------------------------------------------
