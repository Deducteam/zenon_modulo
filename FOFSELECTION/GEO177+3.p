%------------------------------------------------------------------------------
% File     : GEO177+3 : TPTP v6.1.0. Released v4.0.0.
% Domain   : Geometry (Constructive)
% Problem  : Symmetry of apartness
% Version  : [vPl95] axioms.
% English  : If the points X and Y are distinct and U and V are distinct,
%            and X or Y is apart from the line connecting U and V, then
%            U or V are apart from the line connecting X and Y.

% Refs     : [vPl95] von Plato (1995), The Axioms of Constructive Geometry
%          : [ROK06] Raths et al. (2006), The ILTP Problem Library for Intu
%          : [Rat07] Raths (2007), Email to Geoff Sutcliffe
% Source   : [Rat07]
% Names    : Theorem 4.2 [vPl95]

% Status   : Theorem
% Rating   : 0.00 v6.1.0, 0.12 v6.0.0, 0.25 v5.5.0, 0.17 v5.3.0, 0.26 v5.2.0, 0.29 v5.0.0, 0.15 v4.1.0, 0.17 v4.0.1, 0.16 v4.0.0
% Syntax   : Number of formulae    :   36 (   7 unit)
%            Number of atoms       :   99 (   0 equality)
%            Maximal formula depth :    9 (   5 average)
%            Number of connectives :   91 (  28   ~;  21   |;  14   &)
%                                         (   5 <=>;  23  =>;   0  <=)
%                                         (   0 <~>;   0  ~|;   0  ~&)
%            Number of predicates  :   12 (   0 propositional; 1-2 arity)
%            Number of functors    :    4 (   0 constant; 2-2 arity)
%            Number of variables   :   85 (   0 sgn;  85   !;   0   ?)
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
    ! [X,Y,U,V] :
      ( ( distinct_points(X,Y)
        & distinct_points(U,V) )
     => ( ( apart_point_and_line(X,line_connecting(U,V))
          | apart_point_and_line(Y,line_connecting(U,V)) )
       => ( apart_point_and_line(U,line_connecting(X,Y))
          | apart_point_and_line(V,line_connecting(X,Y)) ) ) ) )).

%------------------------------------------------------------------------------
