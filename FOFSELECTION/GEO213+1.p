%------------------------------------------------------------------------------
% File     : GEO213+1 : TPTP v6.1.0. Released v3.3.0.
% Domain   : Geometry (Constructive)
% Problem  : Corollary to non-orthogonal lines and a third line
% Version  : [vPl95] axioms : Especial.
% English  : If line L is not orthogonal to line M, then a third line N
%            is distinct from L or not orthogonal to M.

% Refs     : [vPl95] von Plato (1995), The Axioms of Constructive Geometry
%          : [ROK06] Raths et al. (2006), The ILTP Problem Library for Intu
% Source   : [ILTP]
% Names    : Corollary 8.4 [vPl95]

% Status   : Theorem
% Rating   : 0.00 v6.1.0, 0.04 v6.0.0, 0.25 v5.5.0, 0.08 v5.4.0, 0.09 v5.3.0, 0.17 v5.2.0, 0.14 v5.0.0, 0.05 v4.1.0, 0.06 v4.0.1, 0.05 v3.7.0, 0.00 v3.3.0
% Syntax   : Number of formulae    :   23 (   7 unit)
%            Number of atoms       :   59 (   0 equality)
%            Maximal formula depth :    9 (   5 average)
%            Number of connectives :   47 (  11 ~  ;  17  |;   4  &)
%                                         (   0 <=>;  15 =>;   0 <=)
%                                         (   0 <~>;   0 ~|;   0 ~&)
%            Number of predicates  :    5 (   0 propositional; 2-2 arity)
%            Number of functors    :    4 (   0 constant; 2-2 arity)
%            Number of variables   :   56 (   0 singleton;  56 !;   0 ?)
%            Maximal term depth    :    2 (   1 average)
% SPC      : FOF_THM_RFO_NEQ

% Comments : Definitions unfolded, hence Especial.
%------------------------------------------------------------------------------
include('Axioms/GEO006+0.ax').
include('Axioms/GEO006+2.ax').
include('Axioms/GEO006+3.ax').
%------------------------------------------------------------------------------
fof(con,conjecture,(
    ! [L,M,N] :
      ( unorthogonal_lines(L,M)
     => ( distinct_lines(L,N)
        | unorthogonal_lines(M,N) ) ) )).

%------------------------------------------------------------------------------
