%------------------------------------------------------------------------------
% File     : GEO237+1 : TPTP v6.1.0. Released v3.3.0.
% Domain   : Geometry (Constructive)
% Problem  : Axiom of Pasch
% Version  : [vPl98] axioms : Especial.
% English  :

% Refs     : [vPl98] von Plato (1998), A Constructive Theory of Ordered Aff
%          : [ROK06] Raths et al. (2006), The ILTP Problem Library for Intu
% Source   : [ILTP]
% Names    : Therorem 5.3 [vPl98]

% Status   : Theorem
% Rating   : 0.00 v5.3.0, 0.09 v5.2.0, 0.07 v5.0.0, 0.00 v3.3.0
% Syntax   : Number of formulae    :   32 (   7 unit)
%            Number of atoms       :  104 (   0 equality)
%            Maximal formula depth :   13 (   6 average)
%            Number of connectives :   88 (  16 ~  ;  25  |;  24  &)
%                                         (   5 <=>;  18 =>;   0 <=)
%                                         (   0 <~>;   0 ~|;   0 ~&)
%            Number of predicates  :   12 (   0 propositional; 1-4 arity)
%            Number of functors    :    4 (   0 constant; 1-2 arity)
%            Number of variables   :   75 (   0 singleton;  75 !;   0 ?)
%            Maximal term depth    :    3 (   1 average)
% SPC      : FOF_THM_RFO_NEQ

% Comments : Definitions unfolded, hence Especial.
%------------------------------------------------------------------------------
include('Axioms/GEO007+0.ax').
%------------------------------------------------------------------------------
fof(con,conjecture,(
    ! [A,B,C,L] :
      ( apart_point_and_line(C,L)
     => ( divides_points(L,A,B)
       => ( divides_points(L,A,C)
          | divides_points(L,B,C) ) ) ) )).

%------------------------------------------------------------------------------
