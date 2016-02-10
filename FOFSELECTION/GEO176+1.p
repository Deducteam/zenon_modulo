%------------------------------------------------------------------------------
% File     : GEO176+1 : TPTP v6.1.0. Released v3.3.0.
% Domain   : Geometry (Constructive)
% Problem  : Lemma on symmetry and apartness
% Version  : [vPl95] axioms : Especial.
% English  : If two lines are convergent and a point is apart from at least
%            one of these lines, then this point is distinct from the
%            intersection point of these lines.

% Refs     : [vPl95] von Plato (1995), The Axioms of Constructive Geometry
%          : [ROK06] Raths et al. (2006), The ILTP Problem Library for Intu
% Source   : [ILTP]
% Names    : Lemma 4.1.ii [vPl95]

% Status   : Theorem
% Rating   : 0.00 v6.1.0, 0.04 v6.0.0, 0.25 v5.5.0, 0.04 v5.3.0, 0.13 v5.2.0, 0.07 v5.0.0, 0.00 v4.0.1, 0.05 v3.7.0, 0.00 v3.3.0
% Syntax   : Number of formulae    :   15 (   3 unit)
%            Number of atoms       :   40 (   0 equality)
%            Maximal formula depth :    9 (   6 average)
%            Number of connectives :   32 (   7 ~  ;  10  |;   3  &)
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
      ( ( distinct_points(X,Y)
        & convergent_lines(U,V)
        & ( apart_point_and_line(X,U)
          | apart_point_and_line(X,V) ) )
     => distinct_points(X,intersection_point(U,V)) ) )).

%------------------------------------------------------------------------------
