%------------------------------------------------------------------------------
% File     : GEO257+1 : TPTP v6.1.0. Released v3.3.0.
% Domain   : Geometry (Constructive)
% Problem  : Transitivity of order on a line
% Version  : [vPl98] axioms : Especial.
% English  :

% Refs     : [vPl98] von Plato (1998), A Constructive Theory of Ordered Aff
%          : [ROK06] Raths et al. (2006), The ILTP Problem Library for Intu
% Source   : [ILTP]
% Names    : Corollary 6.3 [vPl98]

% Status   : Theorem
% Rating   : 0.00 v6.1.0, 0.04 v6.0.0, 0.25 v5.5.0, 0.04 v5.3.0, 0.09 v5.2.0, 0.07 v5.0.0, 0.00 v3.3.0
% Syntax   : Number of formulae    :   32 (   7 unit)
%            Number of atoms       :  107 (   0 equality)
%            Maximal formula depth :   13 (   6 average)
%            Number of connectives :   92 (  17 ~  ;  24  |;  28  &)
%                                         (   5 <=>;  18 =>;   0 <=)
%                                         (   0 <~>;   0 ~|;   0 ~&)
%            Number of predicates  :   12 (   0 propositional; 1-4 arity)
%            Number of functors    :    4 (   0 constant; 1-2 arity)
%            Number of variables   :   76 (   0 singleton;  76 !;   0 ?)
%            Maximal term depth    :    3 (   1 average)
% SPC      : FOF_THM_RFO_NEQ

% Comments : Definitions unfolded, hence Especial.
%------------------------------------------------------------------------------
include('Axioms/GEO007+0.ax').
%------------------------------------------------------------------------------
fof(con,conjecture,(
    ! [L,A,B,C,D] :
      ( ( distinct_points(A,C)
        & distinct_points(B,C)
        & ~ apart_point_and_line(C,L)
        & left_apart_point(D,L) )
     => ( ( before_on_line(L,A,B)
          & before_on_line(L,B,C) )
       => before_on_line(L,A,C) ) ) )).

%------------------------------------------------------------------------------
