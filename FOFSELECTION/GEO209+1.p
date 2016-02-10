%------------------------------------------------------------------------------
% File     : GEO209+1 : TPTP v6.1.0. Released v3.3.0.
% Domain   : Geometry (Constructive)
% Problem  : Pont and three parallel lines
% Version  : [vPl95] axioms : Especial.
% English  : If the point A is apart from the line L, but incident with the
%            lines M and N, and L is parallel to M and N, then M and N are
%            equal.

% Refs     : [vPl95] von Plato (1995), The Axioms of Constructive Geometry
%          : [ROK06] Raths et al. (2006), The ILTP Problem Library for Intu
% Source   : [ILTP]
% Names    : Theorem 7.4 [vPl95]

% Status   : Theorem
% Rating   : 0.00 v6.1.0, 0.04 v6.0.0, 0.25 v5.5.0, 0.08 v5.4.0, 0.09 v5.3.0, 0.17 v5.2.0, 0.14 v5.0.0, 0.05 v4.1.0, 0.06 v4.0.1, 0.05 v3.7.0, 0.00 v3.3.0
% Syntax   : Number of formulae    :   18 (   5 unit)
%            Number of atoms       :   47 (   0 equality)
%            Maximal formula depth :   11 (   6 average)
%            Number of connectives :   43 (  14 ~  ;  11  |;   5  &)
%                                         (   0 <=>;  13 =>;   0 <=)
%                                         (   0 <~>;   0 ~|;   0 ~&)
%            Number of predicates  :    4 (   0 propositional; 2-2 arity)
%            Number of functors    :    3 (   0 constant; 2-2 arity)
%            Number of variables   :   44 (   0 singleton;  44 !;   0 ?)
%            Maximal term depth    :    2 (   1 average)
% SPC      : FOF_THM_RFO_NEQ

% Comments : Definitions unfolded, hence Especial.
%------------------------------------------------------------------------------
include('Axioms/GEO006+0.ax').
include('Axioms/GEO006+2.ax').
%------------------------------------------------------------------------------
fof(con,conjecture,(
    ! [A,L,M,N] :
      ( ( apart_point_and_line(A,L)
        & ~ apart_point_and_line(A,M)
        & ~ apart_point_and_line(A,N)
        & ~ convergent_lines(M,L)
        & ~ convergent_lines(N,L) )
     => ~ distinct_lines(M,N) ) )).

%------------------------------------------------------------------------------
