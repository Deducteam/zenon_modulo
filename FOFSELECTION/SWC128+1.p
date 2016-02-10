%--------------------------------------------------------------------------
% File     : SWC128+1 : TPTP v6.1.0. Released v2.4.0.
% Domain   : Software Creation
% Problem  : cond_pr_works_always_x_filter_segment
% Version  : [Wei00] axioms : Biased.
% English  : Find components in a software library that match a given target
%            specification given in first-order logic. The components are
%            specified in first-order logic as well. The problem represents
%            a test of one library module specification against a target
%            specification.

% Refs     : [Wei00] Weidenbach (2000), Software Reuse of List Functions Ve
%          : [FSS98] Fischer et al. (1998), Deduction-Based Software Compon
% Source   : [Wei00]
% Names    : cond_pr_works_always_x_filter_segment [Wei00]

% Status   : Theorem
% Rating   : 0.16 v6.1.0, 0.17 v5.5.0, 0.19 v5.4.0, 0.21 v5.3.0, 0.26 v5.2.0, 0.15 v5.1.0, 0.14 v5.0.0, 0.12 v4.1.0, 0.17 v4.0.1, 0.22 v4.0.0, 0.29 v3.7.0, 0.25 v3.5.0, 0.26 v3.4.0, 0.42 v3.3.0, 0.36 v3.2.0, 0.27 v3.1.0, 0.78 v2.7.0, 0.67 v2.6.0, 0.83 v2.5.0, 1.00 v2.4.0
% Syntax   : Number of formulae    :   96 (  10 unit)
%            Number of atoms       :  395 (  71 equality)
%            Maximal formula depth :   17 (   6 average)
%            Number of connectives :  323 (  24 ~  ;   8  |;  38  &)
%                                         (  26 <=>; 227 =>;   0 <=)
%                                         (   0 <~>;   0 ~|;   0 ~&)
%            Number of predicates  :   21 (   1 propositional; 0-2 arity)
%            Number of functors    :    5 (   1 constant; 0-2 arity)
%            Number of variables   :  203 (   0 singleton; 190 !;  13 ?)
%            Maximal term depth    :    4 (   1 average)
% SPC      : FOF_THM_RFO_SEQ

% Comments : Biased because it has $false which some systems don't understand
%            yet.
%--------------------------------------------------------------------------
%----Include list specification axioms
include('Axioms/SWC001+0.ax').
%--------------------------------------------------------------------------
fof(co1,conjecture,
    ( $true )).

%--------------------------------------------------------------------------
