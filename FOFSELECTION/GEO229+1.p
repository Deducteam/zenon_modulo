%------------------------------------------------------------------------------
% File     : GEO229+1 : TPTP v6.1.0. Released v3.3.0.
% Domain   : Geometry (Constructive)
% Problem  : Uniqueness of reversed lines
% Version  : [vPl98] axioms : Especial.
% English  :

% Refs     : [vPl98] von Plato (1998), A Constructive Theory of Ordered Aff
%          : [ROK06] Raths et al. (2006), The ILTP Problem Library for Intu
% Source   : [ILTP]
% Names    : Therorem 3.3 [vPl98]

% Status   : Theorem
% Rating   : 0.00 v5.5.0, 0.04 v5.2.0, 0.07 v5.0.0, 0.00 v3.3.0
% Syntax   : Number of formulae    :   32 (   7 unit)
%            Number of atoms       :  102 (   0 equality)
%            Maximal formula depth :   13 (   6 average)
%            Number of connectives :   88 (  18 ~  ;  24  |;  24  &)
%                                         (   5 <=>;  17 =>;   0 <=)
%                                         (   0 <~>;   0 ~|;   0 ~&)
%            Number of predicates  :   12 (   0 propositional; 1-4 arity)
%            Number of functors    :    4 (   0 constant; 1-2 arity)
%            Number of variables   :   73 (   0 singleton;  73 !;   0 ?)
%            Maximal term depth    :    3 (   1 average)
% SPC      : FOF_THM_RFO_NEQ

% Comments : Definitions unfolded, hence Especial.
%------------------------------------------------------------------------------
include('Axioms/GEO007+0.ax').
%------------------------------------------------------------------------------
fof(con,conjecture,(
    ! [L,M] :
      ( ~ unequally_directed_lines(L,reverse_line(M))
     => ~ unequally_directed_lines(L,reverse_line(M)) ) )).

%------------------------------------------------------------------------------
