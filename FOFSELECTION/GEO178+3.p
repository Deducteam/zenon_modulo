%------------------------------------------------------------------------------
% File     : GEO178+3 : TPTP v6.1.0. Released v4.0.0.
% Domain   : Geometry (Constructive)
% Problem  : Lemma on symmetry and apartness
% Version  : [vPl95] axioms.
% English  : If two points X and Y are distinct and a point Z is apart from
%            the line connecting X and Y, then Z and X are distinct, and
%            Z and Y are distinct.

% Refs     : [vPl95] von Plato (1995), The Axioms of Constructive Geometry
%          : [ROK06] Raths et al. (2006), The ILTP Problem Library for Intu
%          : [Rat07] Raths (2007), Email to Geoff Sutcliffe
% Source   : [Rat07]
% Names    : Lemma 4.3.i [vPl95]

% Status   : Theorem
% Rating   : 0.00 v6.1.0, 0.04 v6.0.0, 0.25 v5.5.0, 0.04 v5.3.0, 0.13 v5.2.0, 0.07 v5.0.0, 0.00 v4.0.0
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
      ( ( distinct_points(X,Y)
        & apart_point_and_line(Z,line_connecting(X,Y)) )
     => ( distinct_points(Z,X)
        & distinct_points(Z,Y) ) ) )).

%------------------------------------------------------------------------------
