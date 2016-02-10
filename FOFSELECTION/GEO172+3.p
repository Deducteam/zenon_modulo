%------------------------------------------------------------------------------
% File     : GEO172+3 : TPTP v6.1.0. Released v4.0.0.
% Domain   : Geometry (Constructive)
% Problem  : Uniqueness of constructed points
% Version  : [vPl95] axioms.
% English  : If two lines are convergent and there is a point that is
%            incident with both lines, then this point is equivalent to the
%            intersection point of these lines.

% Refs     : [vPl95] von Plato (1995), The Axioms of Constructive Geometry
%          : [ROK06] Raths et al. (2006), The ILTP Problem Library for Intu
%          : [Rat07] Raths (2007), Email to Geoff Sutcliffe
% Source   : [Rat07]
% Names    : Theorem 3.3 [vPl95]

% Status   : Theorem
% Rating   : 0.00 v6.1.0, 0.12 v6.0.0, 0.25 v5.5.0, 0.21 v5.4.0, 0.22 v5.3.0, 0.30 v5.2.0, 0.29 v5.0.0, 0.20 v4.1.0, 0.22 v4.0.1, 0.21 v4.0.0
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
        & incident_point_and_line(Z,X)
        & incident_point_and_line(Z,Y) )
     => equal_points(Z,intersection_point(X,Y)) ) )).

%------------------------------------------------------------------------------
