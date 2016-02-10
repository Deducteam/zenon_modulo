%------------------------------------------------------------------------------
% File     : GEO191+1 : TPTP v6.1.0. Released v3.3.0.
% Domain   : Geometry (Constructive)
% Problem  : Symmetry of apartness
% Version  : [vPl95] axioms : Especial.
% English  : If the lines X and Y are convergent, U and V are convergent,
%            and the intersection point of X and Y is apart from U and V,
%            then the intersection point of U and V is apart from X and Y.

% Refs     : [vPl95] von Plato (1995), The Axioms of Constructive Geometry
%          : [ROK06] Raths et al. (2006), The ILTP Problem Library for Intu
% Source   : [ILTP]
% Names    : Theorem 4.8 [vPl95]

% Status   : Theorem
% Rating   : 0.00 v6.1.0, 0.16 v6.0.0, 0.50 v5.5.0, 0.29 v5.4.0, 0.30 v5.3.0, 0.39 v5.2.0, 0.29 v5.0.0, 0.25 v4.1.0, 0.28 v4.0.1, 0.32 v4.0.0, 0.35 v3.7.0, 0.29 v3.5.0, 0.25 v3.4.0, 0.00 v3.3.0
% Syntax   : Number of formulae    :   15 (   3 unit)
%            Number of atoms       :   41 (   0 equality)
%            Maximal formula depth :    9 (   6 average)
%            Number of connectives :   33 (   7 ~  ;  11  |;   3  &)
%                                         (   0 <=>;  12 =>;   0 <=)
%                                         (   0 <~>;   0 ~|;   0 ~&)
%            Number of predicates  :    4 (   0 propositional; 2-2 arity)
%            Number of functors    :    2 (   0 constant; 2-2 arity)
%            Number of variables   :   37 (   0 singleton;  37 !;   0 ?)
%            Maximal term depth    :    2 (   1 average)
% SPC      : FOF_THM_RFO_NEQ

% Comments : Definitions unfolded, hence Especial.
%------------------------------------------------------------------------------
include('Axioms/GEO006+0.ax').
%------------------------------------------------------------------------------
fof(con,conjecture,(
    ! [X,Y,U,V] :
      ( ( convergent_lines(X,Y)
        & convergent_lines(U,V)
        & ( apart_point_and_line(intersection_point(X,Y),U)
          | apart_point_and_line(intersection_point(X,Y),V) ) )
     => ( apart_point_and_line(intersection_point(U,V),X)
        | apart_point_and_line(intersection_point(U,V),Y) ) ) )).

%------------------------------------------------------------------------------
