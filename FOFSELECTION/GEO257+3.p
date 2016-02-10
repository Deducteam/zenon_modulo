%------------------------------------------------------------------------------
% File     : GEO257+3 : TPTP v6.1.0. Released v4.0.0.
% Domain   : Geometry (Constructive)
% Problem  : Transitivity of order on a line
% Version  : [vPl98] axioms.
% English  :

% Refs     : [vPl98] von Plato (1998), A Constructive Theory of Ordered Aff
%          : [ROK06] Raths et al. (2006), The ILTP Problem Library for Intu
%          : [Rat07] Raths (2007), Email to Geoff Sutcliffe
% Source   : [Rat07]
% Names    : Corollary 6.3 [vPl98]

% Status   : Theorem
% Rating   : 0.00 v6.1.0, 0.04 v6.0.0, 0.25 v5.5.0, 0.08 v5.4.0, 0.13 v5.3.0, 0.22 v5.2.0, 0.14 v5.0.0, 0.05 v4.1.0, 0.06 v4.0.1, 0.05 v4.0.0
% Syntax   : Number of formulae    :   37 (   6 unit)
%            Number of atoms       :  116 (   0 equality)
%            Maximal formula depth :   13 (   5 average)
%            Number of connectives :   91 (  12   ~;  22   |;  28   &)
%                                         (  10 <=>;  19  =>;   0  <=)
%                                         (   0 <~>;   0  ~|;   0  ~&)
%            Number of predicates  :   18 (   0 propositional; 1-4 arity)
%            Number of functors    :    4 (   0 constant; 1-2 arity)
%            Number of variables   :   86 (   0 sgn;  86   !;   0   ?)
%            Maximal term depth    :    3 (   1 average)
% SPC      : FOF_THM_RFO_NEQ

% Comments :
%------------------------------------------------------------------------------
include('Axioms/GEO009+0.ax').
%------------------------------------------------------------------------------
fof(con,conjecture,(
    ! [L,A,B,C,D] :
      ( ( distinct_points(A,C)
        & distinct_points(B,C)
        & incident_point_and_line(C,L)
        & left_apart_point(D,L) )
     => ( ( before_on_line(L,A,B)
          & before_on_line(L,B,C) )
       => before_on_line(L,A,C) ) ) )).

%------------------------------------------------------------------------------
