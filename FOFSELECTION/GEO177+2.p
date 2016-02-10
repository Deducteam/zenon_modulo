%------------------------------------------------------------------------------
% File     : GEO177+2 : TPTP v6.1.0. Released v3.3.0.
% Domain   : Geometry (Constructive)
% Problem  : Symmetry of apartness
% Version  : [vPl95] axioms : Reduced > Especial.
% English  : If the points X and Y are distinct and U and V are distinct,
%            and X or Y is apart from the line connecting U and V, then
%            U or V are apart from the line connecting X and Y.

% Refs     : [vPl95] von Plato (1995), The Axioms of Constructive Geometry
%          : [Li97]  Li (1997), Replacing the Axioms for Connecting Lines a
%          : [Li98]  Li (1998), A Shorter and Intuitive Axiom to Replace th
%          : [ROK06] Raths et al. (2006), The ILTP Problem Library for Intu
% Source   : [ILTP]
% Names    :

% Status   : Theorem
% Rating   : 0.00 v6.1.0, 0.08 v6.0.0, 0.50 v5.5.0, 0.25 v5.4.0, 0.26 v5.3.0, 0.35 v5.2.0, 0.29 v5.0.0, 0.20 v4.1.0, 0.22 v4.0.1, 0.26 v4.0.0, 0.30 v3.7.0, 0.14 v3.5.0, 0.00 v3.3.0
% Syntax   : Number of formulae    :   13 (   3 unit)
%            Number of atoms       :   40 (   0 equality)
%            Maximal formula depth :    9 (   6 average)
%            Number of connectives :   30 (   3 ~  ;  11  |;   3  &)
%                                         (   0 <=>;  13 =>;   0 <=)
%                                         (   0 <~>;   0 ~|;   0 ~&)
%            Number of predicates  :    4 (   0 propositional; 2-2 arity)
%            Number of functors    :    2 (   0 constant; 2-2 arity)
%            Number of variables   :   34 (   0 singleton;  34 !;   0 ?)
%            Maximal term depth    :    2 (   1 average)
% SPC      : FOF_THM_RFO_NEQ

% Comments :  Definitions unfolded, hence Especial.
%------------------------------------------------------------------------------
include('Axioms/GEO008+0.ax').
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
