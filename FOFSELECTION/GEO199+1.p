%------------------------------------------------------------------------------
% File     : GEO199+1 : TPTP v6.1.0. Released v3.3.0.
% Domain   : Geometry (Constructive)
% Problem  : Corollary to symmetry of incidence
% Version  : [vPl95] axioms : Especial.
% English  : If the lines X, Y, and Z are pairwise convergent, and the
%            intersection point of X and Y is incident with Z, then the
%            intersection point of Y and X is incident with Z.

% Refs     : [vPl95] von Plato (1995), The Axioms of Constructive Geometry
%          : [ROK06] Raths et al. (2006), The ILTP Problem Library for Intu
% Source   : [ILTP]
% Names    : Corollary 4.12.iii [vPl95]

% Status   : Theorem
% Rating   : 0.09 v6.1.0, 0.12 v6.0.0, 0.25 v5.4.0, 0.26 v5.3.0, 0.30 v5.2.0, 0.29 v5.0.0, 0.20 v4.1.0, 0.22 v4.0.1, 0.26 v4.0.0, 0.30 v3.7.0, 0.29 v3.5.0, 0.25 v3.4.0, 0.00 v3.3.0
% Syntax   : Number of formulae    :   15 (   3 unit)
%            Number of atoms       :   40 (   0 equality)
%            Maximal formula depth :    9 (   6 average)
%            Number of connectives :   34 (   9 ~  ;   9  |;   4  &)
%                                         (   0 <=>;  12 =>;   0 <=)
%                                         (   0 <~>;   0 ~|;   0 ~&)
%            Number of predicates  :    4 (   0 propositional; 2-2 arity)
%            Number of functors    :    2 (   0 constant; 2-2 arity)
%            Number of variables   :   36 (   0 singleton;  36 !;   0 ?)
%            Maximal term depth    :    2 (   1 average)
% SPC      : FOF_THM_RFO_NEQ

% Comments : Definitions unfolded, hence Especial.
%------------------------------------------------------------------------------
include('Axioms/GEO006+0.ax').
%------------------------------------------------------------------------------
fof(con,conjecture,(
    ! [X,Y,Z] :
      ( ( convergent_lines(X,Y)
        & convergent_lines(Z,Y)
        & convergent_lines(X,Z)
        & ~ apart_point_and_line(intersection_point(X,Y),Z) )
     => ~ apart_point_and_line(intersection_point(Y,X),Z) ) )).

%------------------------------------------------------------------------------
