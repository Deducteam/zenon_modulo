%------------------------------------------------------------------------------
% File     : GEO197+2 : TPTP v6.1.0. Released v3.3.0.
% Domain   : Geometry (Constructive)
% Problem  : Corollary to symmetry of incidence
% Version  : [vPl95] axioms : Reduced > Especial.
% English  : If the lines X, Y, and Z are pairwise convergent, and the
%            intersection point of X and Y is incident with Z, then the
%            intersection point of Z and Y is incident with X.

% Refs     : [vPl95] von Plato (1995), The Axioms of Constructive Geometry
%          : [Li97]  Li (1997), Replacing the Axioms for Connecting Lines a
%          : [Li98]  Li (1998), A Shorter and Intuitive Axiom to Replace th
%          : [ROK06] Raths et al. (2006), The ILTP Problem Library for Intu
% Source   : [ILTP]
% Names    :

% Status   : Theorem
% Rating   : 0.00 v6.1.0, 0.08 v6.0.0, 0.25 v5.4.0, 0.22 v5.3.0, 0.30 v5.2.0, 0.21 v5.0.0, 0.15 v4.1.0, 0.17 v4.0.1, 0.16 v4.0.0, 0.20 v3.7.0, 0.29 v3.5.0, 0.25 v3.4.0, 0.00 v3.3.0
% Syntax   : Number of formulae    :   13 (   3 unit)
%            Number of atoms       :   39 (   0 equality)
%            Maximal formula depth :    9 (   6 average)
%            Number of connectives :   31 (   5 ~  ;   9  |;   5  &)
%                                         (   0 <=>;  12 =>;   0 <=)
%                                         (   0 <~>;   0 ~|;   0 ~&)
%            Number of predicates  :    4 (   0 propositional; 2-2 arity)
%            Number of functors    :    2 (   0 constant; 2-2 arity)
%            Number of variables   :   33 (   0 singleton;  33 !;   0 ?)
%            Maximal term depth    :    2 (   1 average)
% SPC      : FOF_THM_RFO_NEQ

% Comments :  Definitions unfolded, hence Especial.
%------------------------------------------------------------------------------
include('Axioms/GEO008+0.ax').
%------------------------------------------------------------------------------
fof(con,conjecture,(
    ! [X,Y,Z] :
      ( ( convergent_lines(X,Y)
        & convergent_lines(Z,Y)
        & convergent_lines(X,Z)
        & ~ apart_point_and_line(intersection_point(X,Y),Z) )
     => ~ apart_point_and_line(intersection_point(Z,Y),X) ) )).

%------------------------------------------------------------------------------
