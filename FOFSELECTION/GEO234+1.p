%------------------------------------------------------------------------------
% File     : GEO234+1 : TPTP v6.1.0. Released v3.3.0.
% Domain   : Geometry (Constructive)
% Problem  : Unequally directed lines
% Version  : [vPl98] axioms : Especial.
% English  :

% Refs     : [vPl98] von Plato (1998), A Constructive Theory of Ordered Aff
%          : [ROK06] Raths et al. (2006), The ILTP Problem Library for Intu
% Source   : [ILTP]
% Names    : Therorem 3.8 [vPl98]

% Status   : Theorem
% Rating   : 0.00 v6.1.0, 0.04 v6.0.0, 0.25 v5.5.0, 0.08 v5.4.0, 0.04 v5.3.0, 0.13 v5.2.0, 0.07 v5.0.0, 0.00 v3.3.0
% Syntax   : Number of formulae    :   32 (   7 unit)
%            Number of atoms       :  103 (   0 equality)
%            Maximal formula depth :   13 (   6 average)
%            Number of connectives :   87 (  16 ~  ;  25  |;  24  &)
%                                         (   5 <=>;  17 =>;   0 <=)
%                                         (   0 <~>;   0 ~|;   0 ~&)
%            Number of predicates  :   12 (   0 propositional; 1-4 arity)
%            Number of functors    :    4 (   0 constant; 1-2 arity)
%            Number of variables   :   74 (   0 singleton;  74 !;   0 ?)
%            Maximal term depth    :    3 (   1 average)
% SPC      : FOF_THM_RFO_NEQ

% Comments : Definitions unfolded, hence Especial.
%------------------------------------------------------------------------------
include('Axioms/GEO007+0.ax').
%------------------------------------------------------------------------------
fof(con,conjecture,(
    ! [L,M,N] :
      ( unequally_directed_lines(L,reverse_line(M))
     => ( unequally_directed_lines(L,N)
        | unequally_directed_lines(M,reverse_line(N)) ) ) )).

%------------------------------------------------------------------------------
