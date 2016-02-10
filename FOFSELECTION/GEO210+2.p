%------------------------------------------------------------------------------
% File     : GEO210+2 : TPTP v6.1.0. Released v3.3.0.
% Domain   : Geometry (Constructive)
% Problem  : Uniqueness of orthogonality
% Version  : [vPl95] axioms : Reduced > Especial.
% English  : If the point A is incident with line L, and the line L is
%            orthogonal to M, then L is equal to the orthogonal to M
%            through A.

% Refs     : [vPl95] von Plato (1995), The Axioms of Constructive Geometry
%          : [Li97]  Li (1997), Replacing the Axioms for Connecting Lines a
%          : [Li98]  Li (1998), A Shorter and Intuitive Axiom to Replace th
%          : [ROK06] Raths et al. (2006), The ILTP Problem Library for Intu
% Source   : [ILTP]
% Names    :

% Status   : Theorem
% Rating   : 0.00 v6.1.0, 0.04 v6.0.0, 0.25 v5.5.0, 0.17 v5.4.0, 0.13 v5.3.0, 0.17 v5.2.0, 0.21 v5.0.0, 0.10 v4.1.0, 0.11 v4.0.0, 0.10 v3.7.0, 0.14 v3.5.0, 0.00 v3.3.0
% Syntax   : Number of formulae    :   21 (   7 unit)
%            Number of atoms       :   58 (   0 equality)
%            Maximal formula depth :    9 (   6 average)
%            Number of connectives :   47 (  10 ~  ;  16  |;   6  &)
%                                         (   0 <=>;  15 =>;   0 <=)
%                                         (   0 <~>;   0 ~|;   0 ~&)
%            Number of predicates  :    5 (   0 propositional; 2-2 arity)
%            Number of functors    :    4 (   0 constant; 2-2 arity)
%            Number of variables   :   53 (   0 singleton;  53 !;   0 ?)
%            Maximal term depth    :    2 (   1 average)
% SPC      : FOF_THM_RFO_NEQ

% Comments :  Definitions unfolded, hence Especial.
%------------------------------------------------------------------------------
include('Axioms/GEO008+0.ax').
include('Axioms/GEO006+2.ax').
include('Axioms/GEO006+3.ax').
%------------------------------------------------------------------------------
fof(con,conjecture,(
    ! [A,L,M] :
      ( ( ~ apart_point_and_line(A,L)
        & ~ unorthogonal_lines(L,M) )
     => ~ distinct_lines(L,orthogonal_through_point(M,A)) ) )).

%------------------------------------------------------------------------------
