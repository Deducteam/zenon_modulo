%------------------------------------------------------------------------------
% File     : GEO225+1 : TPTP v6.1.0. Released v3.3.0.
% Domain   : Geometry (Constructive)
% Problem  : Existence of line joining distinct points
% Version  : [vPl95] axioms : Especial.
% English  : When there are two distinct points, then a line connecting
%            them can be constructed.

% Refs     : [vPl95] von Plato (1995), The Axioms of Constructive Geometry
%          : [ROK06] Raths et al. (2006), The ILTP Problem Library for Intu
% Source   : [ILTP]
% Names    :

% Status   : Theorem
% Rating   : 0.00 v6.1.0, 0.04 v6.0.0, 0.25 v5.5.0, 0.08 v5.4.0, 0.09 v5.3.0, 0.17 v5.2.0, 0.14 v5.0.0, 0.05 v4.1.0, 0.06 v4.0.1, 0.11 v4.0.0, 0.10 v3.7.0, 0.00 v3.3.0
% Syntax   : Number of formulae    :   19 (   3 unit)
%            Number of atoms       :   55 (   0 equality)
%            Maximal formula depth :    9 (   5 average)
%            Number of connectives :   45 (   9 ~  ;   9  |;  10  &)
%                                         (   0 <=>;  17 =>;   0 <=)
%                                         (   0 <~>;   0 ~|;   0 ~&)
%            Number of predicates  :    6 (   0 propositional; 1-2 arity)
%            Number of functors    :    4 (   0 constant; 2-2 arity)
%            Number of variables   :   44 (   0 singleton;  43 !;   1 ?)
%            Maximal term depth    :    2 (   1 average)
% SPC      : FOF_THM_RFO_NEQ

% Comments : Definitions unfolded, hence Especial.
%------------------------------------------------------------------------------
include('Axioms/GEO006+0.ax').
include('Axioms/GEO006+5.ax').
%------------------------------------------------------------------------------
fof(con,conjecture,(
    ! [A,B] :
      ( ( point(A)
        & point(B)
        & distinct_points(A,B) )
     => ? [X] :
          ( line(X)
         => ( ~ apart_point_and_line(A,X)
            & ~ apart_point_and_line(B,X) ) ) ) )).

%------------------------------------------------------------------------------
