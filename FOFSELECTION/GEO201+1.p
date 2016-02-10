%------------------------------------------------------------------------------
% File     : GEO201+1 : TPTP v6.1.0. Released v3.3.0.
% Domain   : Geometry (Constructive)
% Problem  : Distinct ends means distinct lines
% Version  : [vPl95] axioms : Especial.
% English  : If the lines X and Y are convergent, then the intersection
%            point of X and Y is equal to the intersection point of X and Y.

% Refs     : [vPl95] von Plato (1995), The Axioms of Constructive Geometry
%          : [ROK06] Raths et al. (2006), The ILTP Problem Library for Intu
% Source   : [ILTP]
% Names    : Theorem 5.2 [vPl95]

% Status   : Theorem
% Rating   : 0.00 v6.1.0, 0.04 v6.0.0, 0.25 v5.5.0, 0.12 v5.4.0, 0.13 v5.3.0, 0.22 v5.2.0, 0.21 v5.0.0, 0.05 v4.1.0, 0.06 v4.0.1, 0.05 v4.0.0, 0.10 v3.7.0, 0.29 v3.5.0, 0.00 v3.3.0
% Syntax   : Number of formulae    :   15 (   3 unit)
%            Number of atoms       :   37 (   0 equality)
%            Maximal formula depth :    9 (   5 average)
%            Number of connectives :   30 (   8 ~  ;   9  |;   1  &)
%                                         (   0 <=>;  12 =>;   0 <=)
%                                         (   0 <~>;   0 ~|;   0 ~&)
%            Number of predicates  :    4 (   0 propositional; 2-2 arity)
%            Number of functors    :    2 (   0 constant; 2-2 arity)
%            Number of variables   :   35 (   0 singleton;  35 !;   0 ?)
%            Maximal term depth    :    2 (   1 average)
% SPC      : FOF_THM_RFO_NEQ

% Comments : Definitions unfolded, hence Especial.
%------------------------------------------------------------------------------
include('Axioms/GEO006+0.ax').
%------------------------------------------------------------------------------
fof(con,conjecture,(
    ! [X,Y] :
      ( convergent_lines(X,Y)
     => ~ distinct_points(intersection_point(X,Y),intersection_point(Y,X)) ) )).

%------------------------------------------------------------------------------
