%------------------------------------------------------------------------------
% File     : GEO208+1 : TPTP v6.1.0. Released v3.3.0.
% Domain   : Geometry (Constructive)
% Problem  : Point on both parallel lines
% Version  : [vPl95] axioms : Especial.
% English  : If the point X is incident with both the lines Y and Z, and
%            Y and Z are parallel, then Y and Z are equal.

% Refs     : [vPl95] von Plato (1995), The Axioms of Constructive Geometry
%          : [ROK06] Raths et al. (2006), The ILTP Problem Library for Intu
% Source   : [ILTP]
% Names    : Lemma 7.3 [vPl95]

% Status   : Theorem
% Rating   : 0.00 v6.1.0, 0.04 v6.0.0, 0.25 v5.5.0, 0.08 v5.4.0, 0.04 v5.3.0, 0.13 v5.2.0, 0.07 v5.0.0, 0.00 v3.3.0
% Syntax   : Number of formulae    :   18 (   5 unit)
%            Number of atoms       :   45 (   0 equality)
%            Maximal formula depth :    9 (   5 average)
%            Number of connectives :   40 (  13 ~  ;  11  |;   3  &)
%                                         (   0 <=>;  13 =>;   0 <=)
%                                         (   0 <~>;   0 ~|;   0 ~&)
%            Number of predicates  :    4 (   0 propositional; 2-2 arity)
%            Number of functors    :    3 (   0 constant; 2-2 arity)
%            Number of variables   :   43 (   0 singleton;  43 !;   0 ?)
%            Maximal term depth    :    2 (   1 average)
% SPC      : FOF_THM_RFO_NEQ

% Comments : Definitions unfolded, hence Especial.
%------------------------------------------------------------------------------
include('Axioms/GEO006+0.ax').
include('Axioms/GEO006+2.ax').
%------------------------------------------------------------------------------
fof(con,conjecture,(
    ! [X,Y,Z] :
      ( ( ~ apart_point_and_line(X,Y)
        & ~ apart_point_and_line(X,Z)
        & ~ convergent_lines(Y,Z) )
     => ~ distinct_lines(Y,Z) ) )).

%------------------------------------------------------------------------------
