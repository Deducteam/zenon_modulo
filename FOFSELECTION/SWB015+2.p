%------------------------------------------------------------------------------
% File     : SWB015+2 : TPTP v6.1.0. Released v5.2.0.
% Domain   : Semantic Web
% Problem  : Reflective Tautologies I
% Version  : [Sch11] axioms : Reduced > Incomplete.
% English  :

% Refs     : [Sch11] Schneider, M. (2011), Email to G. Sutcliffe
% Source   : [Sch11]
% Names    : 015_Reflective_Tautologies_I [Sch11]

% Status   : Theorem
% Rating   : 0.00 v5.3.0, 0.09 v5.2.0
% Syntax   : Number of formulae    :    2 (   1 unit)
%            Number of atoms       :    3 (   1 equality)
%            Maximal formula depth :    4 (   2 average)
%            Number of connectives :    1 (   0   ~;   0   |;   0   &)
%                                         (   1 <=>;   0  =>;   0  <=;   0 <~>)
%                                         (   0  ~|;   0  ~&)
%            Number of predicates  :    2 (   0 propositional; 2-3 arity)
%            Number of functors    :    1 (   1 constant; 0-0 arity)
%            Number of variables   :    2 (   0 sgn;   2   !;   0   ?)
%            Maximal term depth    :    1 (   1 average)
% SPC      : FOF_THM_EPR

% Comments :
%------------------------------------------------------------------------------
fof(owl_eqdis_sameas,axiom,(
    ! [X,Y] :
      ( iext(uri_owl_sameAs,X,Y)
    <=> X = Y ) )).

fof(testcase_conclusion_fullish_015_Reflective_Tautologies_I,conjecture,(
    iext(uri_owl_sameAs,uri_owl_sameAs,uri_owl_sameAs) )).

%------------------------------------------------------------------------------
