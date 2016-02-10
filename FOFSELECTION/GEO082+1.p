%--------------------------------------------------------------------------
% File     : GEO082+1 : TPTP v6.1.0. Released v2.4.0.
% Domain   : Geometry (Oriented curves)
% Problem  : Antisymmetry of part_of
% Version  : [EHK99] axioms.
% English  :

% Refs     : [KE99]  Kulik & Eschenbach (1999), A Geometry of Oriented Curv
%          : [EHK99] Eschenbach et al. (1999), Representing Simple Trajecto
% Source   : [KE99]
% Names    : Theorem 2.5 [KE99]

% Status   : Theorem
% Rating   : 0.12 v6.1.0, 0.27 v6.0.0, 0.39 v5.5.0, 0.26 v5.4.0, 0.29 v5.3.0, 0.30 v5.2.0, 0.15 v5.1.0, 0.14 v5.0.0, 0.17 v4.1.0, 0.13 v4.0.1, 0.17 v3.7.0, 0.10 v3.5.0, 0.11 v3.4.0, 0.16 v3.3.0, 0.14 v3.2.0, 0.18 v3.1.0, 0.22 v2.7.0, 0.17 v2.4.0
% Syntax   : Number of formulae    :   17 (   1 unit)
%            Number of atoms       :   70 (  11 equality)
%            Maximal formula depth :   12 (   7 average)
%            Number of connectives :   57 (   4 ~  ;   9  |;  22  &)
%                                         (   9 <=>;  13 =>;   0 <=)
%                                         (   0 <~>;   0 ~|;   0 ~&)
%            Number of predicates  :    8 (   0 propositional; 1-3 arity)
%            Number of functors    :    1 (   0 constant; 2-2 arity)
%            Number of variables   :   55 (   0 singleton;  46 !;   9 ?)
%            Maximal term depth    :    2 (   1 average)
% SPC      : FOF_THM_RFO_SEQ

% Comments :
%--------------------------------------------------------------------------
%----Include simple curve axioms
include('Axioms/GEO004+0.ax').
%--------------------------------------------------------------------------
fof(part_of_antisymmetry,conjecture,
    ( ! [C1,C2] :
        ( ( part_of(C1,C2)
          & part_of(C2,C1) )
       => C1 = C2 ) )).

%--------------------------------------------------------------------------
