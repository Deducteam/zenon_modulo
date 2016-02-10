%------------------------------------------------------------------------------
% File     : KRS180+1 : TPTP v6.1.0. Bugfixed v5.4.0.
% Domain   : Knowledge Representation
% Problem  : isa is incompatible with nota, nevera, and xora
% Version  : [Sut08] axioms.
% English  :

% Refs     : [Sut08] Sutcliffe (2008), The SZS Ontologies for Automated Rea
% Source   : [TPTP]
% Names    :

% Status   : Theorem
% Rating   : 0.00 v6.1.0, 0.04 v6.0.0, 0.25 v5.5.0, 0.17 v5.4.0
% Syntax   : Number of formulae    :   14 (   2 unit)
%            Number of atoms       :   41 (   0 equality)
%            Maximal formula depth :   10 (   6 average)
%            Number of connectives :   38 (  11   ~;   3   |;  12   &)
%                                         (   6 <=>;   4  =>;   0  <=;   2 <~>)
%                                         (   0  ~|;   0  ~&)
%            Number of predicates  :    7 (   0 propositional; 2-3 arity)
%            Number of functors    :    1 (   0 constant; 1-1 arity)
%            Number of variables   :   49 (   0 sgn;  25   !;  24   ?)
%            Maximal term depth    :    2 (   1 average)
% SPC      : FOF_THM_RFO_NEQ

% Comments :
% Bugfixes : v5.4.0 - Added missing axiom in KRS001+1.ax
%------------------------------------------------------------------------------
%----Include SZS success ontology node relationships
include('Axioms/KRS001+1.ax').
%------------------------------------------------------------------------------
fof(isa_exclusive,conjecture,
    ! [S1,S2] :
    ? [Ax,C] :
      ( status(Ax,C,S1)
     => ~ ( isa(S1,S2)
          & ( nota(S1,S2)
            | nevera(S1,S2)
            | xora(S1,S2) ) ) )   ).

%------------------------------------------------------------------------------
