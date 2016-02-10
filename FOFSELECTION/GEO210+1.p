%------------------------------------------------------------------------------
% File     : GEO210+1 : TPTP v6.1.0. Released v3.3.0.
% Domain   : Geometry (Constructive)
% Problem  : Uniqueness of orthogonality
% Version  : [vPl95] axioms : Especial.
% English  : If the point A is incident with line L, and the line L is
%            orthogonal to M, then L is equal to the orthogonal to M
%            through A.

% Refs     : [vPl95] von Plato (1995), The Axioms of Constructive Geometry
%          : [ROK06] Raths et al. (2006), The ILTP Problem Library for Intu
% Source   : [ILTP]
% Names    : Theorem 8.1 [vPl95]

% Status   : Theorem
% Rating   : 0.00 v5.5.0, 0.08 v5.4.0, 0.09 v5.3.0, 0.17 v5.2.0, 0.21 v5.0.0, 0.10 v4.1.0, 0.11 v4.0.0, 0.10 v3.7.0, 0.14 v3.5.0, 0.00 v3.3.0
% Syntax   : Number of formulae    :   23 (   7 unit)
%            Number of atoms       :   59 (   0 equality)
%            Maximal formula depth :    9 (   5 average)
%            Number of connectives :   50 (  14   ~;  16   |;   5   &)
%                                         (   0 <=>;  15  =>;   0  <=)
%                                         (   0 <~>;   0  ~|;   0  ~&)
%            Number of predicates  :    5 (   0 propositional; 2-2 arity)
%            Number of functors    :    4 (   0 constant; 2-2 arity)
%            Number of variables   :   56 (   0 sgn;  56   !;   0   ?)
%            Maximal term depth    :    2 (   1 average)
% SPC      : FOF_THM_RFO_NEQ

% Comments : Definitions unfolded, hence Especial.
%------------------------------------------------------------------------------
include('Axioms/GEO006+0.ax').
include('Axioms/GEO006+2.ax').
include('Axioms/GEO006+3.ax').
%------------------------------------------------------------------------------
fof(con,conjecture,(
    ! [A,L,M] :
      ( ( ~ apart_point_and_line(A,L)
        & ~ unorthogonal_lines(L,M) )
     => ~ distinct_lines(L,orthogonal_through_point(M,A)) ) )).

%------------------------------------------------------------------------------
