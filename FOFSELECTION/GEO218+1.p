%------------------------------------------------------------------------------
% File     : GEO218+1 : TPTP v6.1.0. Released v3.3.0.
% Domain   : Geometry (Constructive)
% Problem  : Transitivity of parallel and orthogonal
% Version  : [vPl95] axioms : Especial.
% English  : If two lines L and M are parallel and a third line N is
%            orthogonal to L, then M is orthogonal to N.

% Refs     : [vPl95] von Plato (1995), The Axioms of Constructive Geometry
%          : [ROK06] Raths et al. (2006), The ILTP Problem Library for Intu
% Source   : [ILTP]
% Names    : Theorem 8.7.ii [vPl95]

% Status   : Theorem
% Rating   : 0.00 v6.1.0, 0.04 v6.0.0, 0.25 v5.5.0, 0.08 v5.4.0, 0.09 v5.3.0, 0.17 v5.2.0, 0.14 v5.0.0, 0.05 v4.1.0, 0.06 v4.0.1, 0.05 v3.7.0, 0.00 v3.3.0
% Syntax   : Number of formulae    :   18 (   3 unit)
%            Number of atoms       :   49 (   0 equality)
%            Maximal formula depth :    9 (   6 average)
%            Number of connectives :   53 (  22 ~  ;  12  |;   5  &)
%                                         (   0 <=>;  14 =>;   0 <=)
%                                         (   0 <~>;   0 ~|;   0 ~&)
%            Number of predicates  :    5 (   0 propositional; 2-2 arity)
%            Number of functors    :    2 (   0 constant; 2-2 arity)
%            Number of variables   :   44 (   0 singleton;  44 !;   0 ?)
%            Maximal term depth    :    2 (   1 average)
% SPC      : FOF_THM_RFO_NEQ

% Comments : Definitions unfolded, hence Especial.
%------------------------------------------------------------------------------
include('Axioms/GEO006+0.ax').
include('Axioms/GEO006+4.ax').
%------------------------------------------------------------------------------
fof(con,conjecture,(
    ! [L,M,N] :
      ( ( ~ convergent_lines(L,M)
        & ~ unorthogonal_lines(L,N) )
     => ~ unorthogonal_lines(M,N) ) )).

%------------------------------------------------------------------------------
