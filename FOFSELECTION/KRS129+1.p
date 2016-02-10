%------------------------------------------------------------------------------
% File     : KRS129+1 : TPTP v6.1.0. Released v3.1.0.
% Domain   : Knowledge Representation (Semantic Web)
% Problem  : An example combinging owl:oneOf and owl:inverseOf
% Version  : Especial.
% English  :

% Refs     : [Bec03] Bechhofer (2003), Email to G. Sutcliffe
%          : [TR+04] Tsarkov et al. (2004), Using Vampire to Reason with OW
% Source   : [Bec03]
% Names    : positive_I4.5-Manifest001 [Bec03]

% Status   : Theorem
% Rating   : 0.00 v6.1.0, 0.03 v6.0.0, 0.04 v5.4.0, 0.07 v5.3.0, 0.15 v5.2.0, 0.00 v4.1.0, 0.04 v4.0.1, 0.09 v4.0.0, 0.08 v3.7.0, 0.00 v3.2.0, 0.11 v3.1.0
% Syntax   : Number of formulae    :   27 (   8 unit)
%            Number of atoms       :   67 (  18 equality)
%            Maximal formula depth :    8 (   4 average)
%            Number of connectives :   44 (   4 ~  ;   5  |;  17  &)
%                                         (   5 <=>;  13 =>;   0 <=)
%                                         (   0 <~>;   0 ~|;   0 ~&)
%            Number of predicates  :   11 (   0 propositional; 1-2 arity)
%            Number of functors    :    7 (   7 constant; 0-0 arity)
%            Number of variables   :   39 (   0 singleton;  38 !;   1 ?)
%            Maximal term depth    :    1 (   1 average)
% SPC      : FOF_THM_RFO_SEQ

% Comments : Sean Bechhofer says there are some errors in the encoding of
%            datatypes, so this problem may not be perfect. At least it's
%            still representative of the type of reasoning required for OWL.
%------------------------------------------------------------------------------
fof(cEUCountry_substitution_1,axiom,
    ( ! [A,B] :
        ( ( A = B
          & cEUCountry(A) )
       => cEUCountry(B) ) )).

fof(cEuroMP_substitution_1,axiom,
    ( ! [A,B] :
        ( ( A = B
          & cEuroMP(A) )
       => cEuroMP(B) ) )).

fof(cEuropeanCountry_substitution_1,axiom,
    ( ! [A,B] :
        ( ( A = B
          & cEuropeanCountry(A) )
       => cEuropeanCountry(B) ) )).

fof(cPerson_substitution_1,axiom,
    ( ! [A,B] :
        ( ( A = B
          & cPerson(A) )
       => cPerson(B) ) )).

fof(cowlNothing_substitution_1,axiom,
    ( ! [A,B] :
        ( ( A = B
          & cowlNothing(A) )
       => cowlNothing(B) ) )).

fof(cowlThing_substitution_1,axiom,
    ( ! [A,B] :
        ( ( A = B
          & cowlThing(A) )
       => cowlThing(B) ) )).

fof(rhasEuroMP_substitution_1,axiom,
    ( ! [A,B,C] :
        ( ( A = B
          & rhasEuroMP(A,C) )
       => rhasEuroMP(B,C) ) )).

fof(rhasEuroMP_substitution_2,axiom,
    ( ! [A,B,C] :
        ( ( A = B
          & rhasEuroMP(C,A) )
       => rhasEuroMP(C,B) ) )).

fof(risEuroMPFrom_substitution_1,axiom,
    ( ! [A,B,C] :
        ( ( A = B
          & risEuroMPFrom(A,C) )
       => risEuroMPFrom(B,C) ) )).

fof(risEuroMPFrom_substitution_2,axiom,
    ( ! [A,B,C] :
        ( ( A = B
          & risEuroMPFrom(C,A) )
       => risEuroMPFrom(C,B) ) )).

fof(xsd_integer_substitution_1,axiom,
    ( ! [A,B] :
        ( ( A = B
          & xsd_integer(A) )
       => xsd_integer(B) ) )).

fof(xsd_string_substitution_1,axiom,
    ( ! [A,B] :
        ( ( A = B
          & xsd_string(A) )
       => xsd_string(B) ) )).

%----Thing and Nothing
fof(axiom_0,axiom,
    ( ! [X] :
        ( cowlThing(X)
        & ~ cowlNothing(X) ) )).

%----String and Integer disjoint
fof(axiom_1,axiom,
    ( ! [X] :
        ( xsd_string(X)
      <=> ~ xsd_integer(X) ) )).

%----Enumeration cEUCountry
fof(axiom_2,axiom,
    ( ! [X] :
        ( cEUCountry(X)
      <=> ( X = iBE
          | X = iFR
          | X = iES
          | X = iUK
          | X = iNL
          | X = iPT ) ) )).

%----Equality cEuroMP
fof(axiom_3,axiom,
    ( ! [X] :
        ( cEuroMP(X)
      <=> ? [Y] :
            ( risEuroMPFrom(X,Y)
            & cowlThing(Y) ) ) )).

%----Domain: rhasEuroMP
fof(axiom_4,axiom,
    ( ! [X,Y] :
        ( rhasEuroMP(X,Y)
       => cEUCountry(X) ) )).

%----Inverse: risEuroMPFrom
fof(axiom_5,axiom,
    ( ! [X,Y] :
        ( risEuroMPFrom(X,Y)
      <=> rhasEuroMP(Y,X) ) )).

%----iBE
fof(axiom_6,axiom,
    ( cEuropeanCountry(iBE) )).

%----iES
fof(axiom_7,axiom,
    ( cEuropeanCountry(iES) )).

%----iFR
fof(axiom_8,axiom,
    ( cEuropeanCountry(iFR) )).

%----iKinnock
fof(axiom_9,axiom,
    ( cPerson(iKinnock) )).

%----iNL
fof(axiom_10,axiom,
    ( cEuropeanCountry(iNL) )).

%----iPT
fof(axiom_11,axiom,
    ( cEuropeanCountry(iPT) )).

%----iUK
fof(axiom_12,axiom,
    ( cEuropeanCountry(iUK) )).

fof(axiom_13,axiom,
    ( rhasEuroMP(iUK,iKinnock) )).

%----Thing and Nothing
%----String and Integer disjoint
%----iKinnock
fof(the_axiom,conjecture,
    ( ! [X] :
        ( cowlThing(X)
        & ~ cowlNothing(X) )
    & ! [X] :
        ( xsd_string(X)
      <=> ~ xsd_integer(X) )
    & cEuroMP(iKinnock) )).

%------------------------------------------------------------------------------
