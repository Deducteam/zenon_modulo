%------------------------------------------------------------------------------
% File     : GEO223+2 : TPTP v6.1.0. Released v3.3.0.
% Domain   : Geometry (Constructive)
% Problem  : Corollary to uniqueness of parallels
% Version  : [vPl95] axioms : Reduced > Especial.
% English  : The parallel to line L through a point A is equal to the line,
%            that is orthogonal to the orthogonal to L through A, and goes
%            through A as well.

% Refs     : [vPl95] von Plato (1995), The Axioms of Constructive Geometry
%          : [Li97]  Li (1997), Replacing the Axioms for Connecting Lines a
%          : [Li98]  Li (1998), A Shorter and Intuitive Axiom to Replace th
%          : [ROK06] Raths et al. (2006), The ILTP Problem Library for Intu
% Source   : [ILTP]
% Names    :

% Status   : Theorem
% Rating   : 0.00 v6.1.0, 0.16 v6.0.0, 0.50 v5.5.0, 0.33 v5.4.0, 0.30 v5.3.0, 0.39 v5.2.0, 0.29 v5.0.0, 0.15 v4.1.0, 0.22 v4.0.1, 0.26 v4.0.0, 0.30 v3.7.0, 0.29 v3.5.0, 0.25 v3.4.0, 0.00 v3.3.0
% Syntax   : Number of formulae    :   21 (   8 unit)
%            Number of atoms       :   56 (   0 equality)
%            Maximal formula depth :    9 (   5 average)
%            Number of connectives :   43 (   8 ~  ;  16  |;   5  &)
%                                         (   0 <=>;  14 =>;   0 <=)
%                                         (   0 <~>;   0 ~|;   0 ~&)
%            Number of predicates  :    5 (   0 propositional; 2-2 arity)
%            Number of functors    :    4 (   0 constant; 2-2 arity)
%            Number of variables   :   52 (   0 singleton;  52 !;   0 ?)
%            Maximal term depth    :    3 (   1 average)
% SPC      : FOF_THM_RFO_NEQ

% Comments :  Definitions unfolded, hence Especial.
%------------------------------------------------------------------------------
include('Axioms/GEO008+0.ax').
include('Axioms/GEO006+2.ax').
include('Axioms/GEO006+3.ax').
%------------------------------------------------------------------------------
fof(con,conjecture,(
    ! [A,L] : ~ distinct_lines(parallel_through_point(L,A),orthogonal_through_point(orthogonal_through_point(L,A),A)) )).

%------------------------------------------------------------------------------
