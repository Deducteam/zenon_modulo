%--------------------------------------------------------------------------
% File     : GEO112+1 : TPTP v6.1.0. Released v2.4.0.
% Domain   : Geometry (Oriented curves)
% Problem  : Basic property of orderings on linear structures 2
% Version  : [EHK99] axioms.
% English  : If Q is between P and R wrt. c, then Q is between R and P wrt. c

% Refs     : [KE99]  Kulik & Eschenbach (1999), A Geometry of Oriented Curv
%          : [EHK99] Eschenbach et al. (1999), Representing Simple Trajecto
% Source   : [KE99]
% Names    : Theorem 3.8 (2) [KE99]
%          : T5 [EHK99]

% Status   : Theorem
% Rating   : 0.24 v6.1.0, 0.27 v6.0.0, 0.22 v5.5.0, 0.19 v5.4.0, 0.18 v5.3.0, 0.22 v5.2.0, 0.20 v5.1.0, 0.19 v5.0.0, 0.25 v4.1.0, 0.22 v4.0.1, 0.26 v4.0.0, 0.25 v3.7.0, 0.20 v3.5.0, 0.21 v3.4.0, 0.26 v3.3.0, 0.14 v3.2.0, 0.27 v3.1.0, 0.33 v2.5.0, 0.50 v2.4.0
% Syntax   : Number of formulae    :   18 (   1 unit)
%            Number of atoms       :   75 (  11 equality)
%            Maximal formula depth :   12 (   7 average)
%            Number of connectives :   62 (   5 ~  ;   9  |;  25  &)
%                                         (  10 <=>;  13 =>;   0 <=)
%                                         (   0 <~>;   0 ~|;   0 ~&)
%            Number of predicates  :    9 (   0 propositional; 1-4 arity)
%            Number of functors    :    1 (   0 constant; 2-2 arity)
%            Number of variables   :   62 (   0 singleton;  52 !;  10 ?)
%            Maximal term depth    :    2 (   1 average)
% SPC      : FOF_THM_RFO_SEQ

% Comments :
%--------------------------------------------------------------------------
%----Include simple curve axioms
include('Axioms/GEO004+0.ax').
%----Include axioms of betweenness for simple curves
include('Axioms/GEO004+1.ax').
%--------------------------------------------------------------------------
fof(theorem_3_8_2,conjecture,
    ( ! [C,P,Q,R] :
        ( between_c(C,P,Q,R)
       => between_c(C,R,Q,P) ) )).

%--------------------------------------------------------------------------
