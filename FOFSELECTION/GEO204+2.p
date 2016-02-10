%------------------------------------------------------------------------------
% File     : GEO204+2 : TPTP v6.1.0. Released v3.3.0.
% Domain   : Geometry (Constructive)
% Problem  : Distinct points and equal lines
% Version  : [vPl95] axioms : Reduced > Especial.
% English  : If the points X and Y are distinct, and the points Y and Z are
%            equal, then X and Z are distinct, and the line connecting X
%            and Y is equivalent to the line connecting X and Z.

% Refs     : [vPl95] von Plato (1995), The Axioms of Constructive Geometry
%          : [Li97]  Li (1997), Replacing the Axioms for Connecting Lines a
%          : [Li98]  Li (1998), A Shorter and Intuitive Axiom to Replace th
%          : [ROK06] Raths et al. (2006), The ILTP Problem Library for Intu
% Source   : [ILTP]
% Names    :

% Status   : Theorem
% Rating   : 0.00 v5.5.0, 0.04 v5.3.0, 0.17 v5.2.0, 0.21 v5.0.0, 0.10 v4.1.0, 0.11 v4.0.0, 0.15 v3.7.0, 0.14 v3.5.0, 0.00 v3.3.0
% Syntax   : Number of formulae    :   13 (   3 unit)
%            Number of atoms       :   38 (   0 equality)
%            Maximal formula depth :    9 (   6 average)
%            Number of connectives :   30 (   5 ~  ;   9  |;   4  &)
%                                         (   0 <=>;  12 =>;   0 <=)
%                                         (   0 <~>;   0 ~|;   0 ~&)
%            Number of predicates  :    4 (   0 propositional; 2-2 arity)
%            Number of functors    :    2 (   0 constant; 2-2 arity)
%            Number of variables   :   33 (   0 singleton;  33 !;   0 ?)
%            Maximal term depth    :    2 (   1 average)
% SPC      : FOF_THM_RFO_NEQ

% Comments :  Definitions unfolded, hence Especial.
%------------------------------------------------------------------------------
include('Axioms/GEO008+0.ax').
%------------------------------------------------------------------------------
fof(con,conjecture,(
    ! [X,Y,Z] :
      ( ( distinct_points(X,Y)
        & ~ distinct_points(Y,Z) )
     => ( distinct_points(X,Z)
        & ~ distinct_lines(line_connecting(X,Y),line_connecting(X,Z)) ) ) )).

%------------------------------------------------------------------------------
