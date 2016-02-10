%------------------------------------------------------------------------------
% File     : KRS181+1 : TPTP v6.1.0. Bugfixed v5.4.0.
% Domain   : Knowledge Representation
% Problem  : If S1 isa S2, and S1 nota S3, then S2 nota S3
% Version  : [Sut08] axioms.
% English  :

% Refs     : [Sut08] Sutcliffe (2008), The SZS Ontologies for Automated Rea
% Source   : [TPTP]
% Names    :

% Status   : Theorem
% Rating   : 0.00 v6.1.0, 0.08 v6.0.0, 0.00 v5.5.0, 0.04 v5.4.0
% Syntax   : Number of formulae    :   14 (   2 unit)
%            Number of atoms       :   39 (   0 equality)
%            Maximal formula depth :    9 (   6 average)
%            Number of connectives :   35 (  10   ~;   1   |;  12   &)
%                                         (   6 <=>;   4  =>;   0  <=;   2 <~>)
%                                         (   0  ~|;   0  ~&)
%            Number of predicates  :    7 (   0 propositional; 2-3 arity)
%            Number of functors    :    1 (   0 constant; 1-1 arity)
%            Number of variables   :   48 (   0 sgn;  26   !;  22   ?)
%            Maximal term depth    :    2 (   1 average)
% SPC      : FOF_THM_RFO_NEQ

% Comments :
% Bugfixes : v5.4.0 - Added missing axiom in KRS001+1.ax
%------------------------------------------------------------------------------
%----Include SZS success ontology node relationships
include('Axioms/KRS001+1.ax').
%------------------------------------------------------------------------------
fof(nota_isa_nota,conjecture,
    ! [S1,S2,S3] :
      ( ( isa(S1,S2)
        & nota(S1,S3) )
     => nota(S2,S3) )   ).

%------------------------------------------------------------------------------
