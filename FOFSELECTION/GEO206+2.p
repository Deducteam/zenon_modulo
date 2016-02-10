%------------------------------------------------------------------------------
% File     : GEO206+2 : TPTP v6.1.0. Released v3.3.0.
% Domain   : Geometry (Constructive)
% Problem  : Point on parallel lines
% Version  : [vPl95] axioms : Reduced > Especial.
% English  : If the point X is incident with the line Y, and the lines
%            Y and Z are parallel, then the line Y is equal to the parallel
%            of Z through point X.

% Refs     : [vPl95] von Plato (1995), The Axioms of Constructive Geometry
%          : [Li97]  Li (1997), Replacing the Axioms for Connecting Lines a
%          : [Li98]  Li (1998), A Shorter and Intuitive Axiom to Replace th
%          : [ROK06] Raths et al. (2006), The ILTP Problem Library for Intu
% Source   : [ILTP]
% Names    :

% Status   : Theorem
% Rating   : 0.00 v5.5.0, 0.04 v5.3.0, 0.13 v5.2.0, 0.14 v5.0.0, 0.05 v4.1.0, 0.06 v4.0.1, 0.05 v3.7.0, 0.00 v3.3.0
% Syntax   : Number of formulae    :   16 (   5 unit)
%            Number of atoms       :   43 (   0 equality)
%            Maximal formula depth :    9 (   6 average)
%            Number of connectives :   35 (   8 ~  ;  11  |;   3  &)
%                                         (   0 <=>;  13 =>;   0 <=)
%                                         (   0 <~>;   0 ~|;   0 ~&)
%            Number of predicates  :    4 (   0 propositional; 2-2 arity)
%            Number of functors    :    3 (   0 constant; 2-2 arity)
%            Number of variables   :   40 (   0 singleton;  40 !;   0 ?)
%            Maximal term depth    :    2 (   1 average)
% SPC      : FOF_THM_RFO_NEQ

% Comments :  Definitions unfolded, hence Especial.
%------------------------------------------------------------------------------
include('Axioms/GEO008+0.ax').
include('Axioms/GEO006+2.ax').
%------------------------------------------------------------------------------
fof(con,conjecture,(
    ! [X,Y,Z] :
      ( ( ~ apart_point_and_line(X,Y)
        & ~ convergent_lines(Y,Z) )
     => ~ distinct_lines(Y,parallel_through_point(Z,X)) ) )).

%------------------------------------------------------------------------------
