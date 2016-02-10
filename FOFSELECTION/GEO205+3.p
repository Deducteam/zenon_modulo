%------------------------------------------------------------------------------
% File     : GEO205+3 : TPTP v6.1.0. Released v4.0.0.
% Domain   : Geometry (Constructive)
% Problem  : Convergent lines and equal points
% Version  : [vPl95] axioms.
% English  : If the lines X and Y are convergent, and Y and Z are
%            equivalent, then X and Z are convergent, and the intersection
%            point of X and Y, and the intersection point of X and Z are
%            equal.

% Refs     : [vPl95] von Plato (1995), The Axioms of Constructive Geometry
%          : [ROK06] Raths et al. (2006), The ILTP Problem Library for Intu
%          : [Rat07] Raths (2007), Email to Geoff Sutcliffe
% Source   : [Rat07]
% Names    : Theorem 5.6 [vPl95]

% Status   : Theorem
% Rating   : 0.00 v6.1.0, 0.16 v6.0.0, 0.50 v5.5.0, 0.33 v5.4.0, 0.30 v5.2.0, 0.29 v5.0.0, 0.30 v4.1.0, 0.39 v4.0.1, 0.32 v4.0.0
% Syntax   : Number of formulae    :   36 (   7 unit)
%            Number of atoms       :   97 (   0 equality)
%            Maximal formula depth :    9 (   5 average)
%            Number of connectives :   89 (  28   ~;  19   |;  15   &)
%                                         (   5 <=>;  22  =>;   0  <=)
%                                         (   0 <~>;   0  ~|;   0  ~&)
%            Number of predicates  :   12 (   0 propositional; 1-2 arity)
%            Number of functors    :    4 (   0 constant; 2-2 arity)
%            Number of variables   :   84 (   0 sgn;  84   !;   0   ?)
%            Maximal term depth    :    2 (   1 average)
% SPC      : FOF_THM_RFO_NEQ

% Comments :
%------------------------------------------------------------------------------
include('Axioms/GEO006+0.ax').
include('Axioms/GEO006+1.ax').
include('Axioms/GEO006+2.ax').
include('Axioms/GEO006+3.ax').
include('Axioms/GEO006+4.ax').
include('Axioms/GEO006+5.ax').
include('Axioms/GEO006+6.ax').
%------------------------------------------------------------------------------
fof(con,conjecture,(
    ! [X,Y,Z] :
      ( ( convergent_lines(X,Y)
        & equal_lines(Y,Z) )
     => ( convergent_lines(X,Z)
        & equal_points(intersection_point(X,Y),intersection_point(X,Z)) ) ) )).

%------------------------------------------------------------------------------
