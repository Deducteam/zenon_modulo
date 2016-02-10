%------------------------------------------------------------------------------
% File     : KRS147+1 : TPTP v6.1.0. Released v3.1.0.
% Domain   : Knowledge Representation (Semantic Web)
% Problem  : DL Test: k_d4 ABox test from DL98 systems comparison
% Version  : Especial.
% English  :

% Refs     : [Bec03] Bechhofer (2003), Email to G. Sutcliffe
%          : [TR+04] Tsarkov et al. (2004), Using Vampire to Reason with OW
% Source   : [Bec03]
% Names    : positive_description-logic-Manifest202 [Bec03]

% Status   : Theorem
% Rating   : 0.00 v6.1.0, 0.16 v6.0.0, 0.25 v5.4.0, 0.26 v5.3.0, 0.35 v5.2.0, 0.07 v5.0.0, 0.15 v4.1.0, 0.11 v4.0.1, 0.05 v3.7.0, 0.00 v3.4.0, 0.17 v3.3.0, 0.00 v3.2.0, 0.11 v3.1.0
% Syntax   : Number of formulae    :   87 (  34 unit)
%            Number of atoms       :  204 (   0 equality)
%            Maximal formula depth :   17 (   4 average)
%            Number of connectives :  164 (  47 ~  ;   0  |;  65  &)
%                                         (  49 <=>;   3 =>;   0 <=)
%                                         (   0 <~>;   0 ~|;   0 ~&)
%            Number of predicates  :   54 (   0 propositional; 1-2 arity)
%            Number of functors    :   10 (  10 constant; 0-0 arity)
%            Number of variables   :   85 (   0 singleton;  54 !;  31 ?)
%            Maximal term depth    :    1 (   1 average)
% SPC      : FOF_THM_RFO_NEQ

% Comments : Sean Bechhofer says there are some errors in the encoding of
%            datatypes, so this problem may not be perfect. At least it's
%            still representative of the type of reasoning required for OWL.
%------------------------------------------------------------------------------
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

%----Equality cC10
fof(axiom_2,axiom,
    ( ! [X] :
        ( cC10(X)
      <=> ( cC4(X)
          & cC8(X) ) ) )).

%----Equality cC12
fof(axiom_3,axiom,
    ( ! [X] :
        ( cC12(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & cC10(Y) ) ) )).

%----Equality cC14
fof(axiom_4,axiom,
    ( ! [X] :
        ( cC14(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & cTOP(Y) ) ) )).

%----Equality cC16
fof(axiom_5,axiom,
    ( ! [X] :
        ( cC16(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & ~ cC14(Y) ) ) )).

%----Equality cC18
fof(axiom_6,axiom,
    ( ! [X] :
        ( cC18(X)
      <=> ( ~ cC16(X)
          & cC12(X) ) ) )).

%----Equality cC20
fof(axiom_7,axiom,
    ( ! [X] :
        ( cC20(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & ~ cC2(Y) ) ) )).

%----Equality cC22
fof(axiom_8,axiom,
    ( ! [X] :
        ( cC22(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & ~ cC2(Y) ) ) )).

%----Equality cC24
fof(axiom_9,axiom,
    ( ! [X] :
        ( cC24(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & cC22(Y) ) ) )).

%----Equality cC26
fof(axiom_10,axiom,
    ( ! [X] :
        ( cC26(X)
      <=> ( ~ cC20(X)
          & cC24(X) ) ) )).

%----Equality cC28
fof(axiom_11,axiom,
    ( ! [X] :
        ( cC28(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & cC26(Y) ) ) )).

%----Equality cC30
fof(axiom_12,axiom,
    ( ! [X] :
        ( cC30(X)
      <=> ( cC18(X)
          & ~ cC28(X) ) ) )).

%----Equality cC32
fof(axiom_13,axiom,
    ( ! [X] :
        ( cC32(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & cC2(Y) ) ) )).

%----Equality cC34
fof(axiom_14,axiom,
    ( ! [X] :
        ( cC34(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & ~ cC32(Y) ) ) )).

%----Equality cC36
fof(axiom_15,axiom,
    ( ! [X] :
        ( cC36(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & cC2(Y) ) ) )).

%----Equality cC38
fof(axiom_16,axiom,
    ( ! [X] :
        ( cC38(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & ~ cC36(Y) ) ) )).

%----Equality cC4
fof(axiom_17,axiom,
    ( ! [X] :
        ( cC4(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & ~ cC2(Y) ) ) )).

%----Equality cC40
fof(axiom_18,axiom,
    ( ! [X] :
        ( cC40(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & cC38(Y) ) ) )).

%----Equality cC42
fof(axiom_19,axiom,
    ( ! [X] :
        ( cC42(X)
      <=> ( ~ cC34(X)
          & cC40(X) ) ) )).

%----Equality cC44
fof(axiom_20,axiom,
    ( ! [X] :
        ( cC44(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & cC42(Y) ) ) )).

%----Equality cC46
fof(axiom_21,axiom,
    ( ! [X] :
        ( cC46(X)
      <=> ( ~ cC44(X)
          & cC30(X) ) ) )).

%----Equality cC48
fof(axiom_22,axiom,
    ( ! [X] :
        ( cC48(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & ~ cC2(Y) ) ) )).

%----Equality cC50
fof(axiom_23,axiom,
    ( ! [X] :
        ( cC50(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & cC2(Y) ) ) )).

%----Equality cC52
fof(axiom_24,axiom,
    ( ! [X] :
        ( cC52(X)
      <=> ( ~ cC50(X)
          & ~ cC48(X) ) ) )).

%----Equality cC54
fof(axiom_25,axiom,
    ( ! [X] :
        ( cC54(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & cC52(Y) ) ) )).

%----Equality cC56
fof(axiom_26,axiom,
    ( ! [X] :
        ( cC56(X)
      <=> ( ~ cC54(X)
          & cC46(X) ) ) )).

%----Equality cC58
fof(axiom_27,axiom,
    ( ! [X] :
        ( cC58(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & cC2(Y) ) ) )).

%----Equality cC6
fof(axiom_28,axiom,
    ( ! [X] :
        ( cC6(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & ~ cC2(Y) ) ) )).

%----Equality cC60
fof(axiom_29,axiom,
    ( ! [X] :
        ( cC60(X)
      <=> ( cC58(X)
          & ~ cC2(X) ) ) )).

%----Equality cC62
fof(axiom_30,axiom,
    ( ! [X] :
        ( cC62(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & cC60(Y) ) ) )).

%----Equality cC64
fof(axiom_31,axiom,
    ( ! [X] :
        ( cC64(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & cC2(Y) ) ) )).

%----Equality cC66
fof(axiom_32,axiom,
    ( ! [X] :
        ( cC66(X)
      <=> ( ~ cC2(X)
          & cC64(X) ) ) )).

%----Equality cC68
fof(axiom_33,axiom,
    ( ! [X] :
        ( cC68(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & cC66(Y) ) ) )).

%----Equality cC70
fof(axiom_34,axiom,
    ( ! [X] :
        ( cC70(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & cC68(Y) ) ) )).

%----Equality cC72
fof(axiom_35,axiom,
    ( ! [X] :
        ( cC72(X)
      <=> ( ~ cC62(X)
          & cC70(X) ) ) )).

%----Equality cC74
fof(axiom_36,axiom,
    ( ! [X] :
        ( cC74(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & cC72(Y) ) ) )).

%----Equality cC76
fof(axiom_37,axiom,
    ( ! [X] :
        ( cC76(X)
      <=> ( ~ cC74(X)
          & cC56(X) ) ) )).

%----Equality cC78
fof(axiom_38,axiom,
    ( ! [X] :
        ( cC78(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & ~ cC2(Y) ) ) )).

%----Equality cC8
fof(axiom_39,axiom,
    ( ! [X] :
        ( cC8(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & ~ cC6(Y) ) ) )).

%----Equality cC80
fof(axiom_40,axiom,
    ( ! [X] :
        ( cC80(X)
      <=> ( ~ cC2(X)
          & ~ cC78(X) ) ) )).

%----Equality cC82
fof(axiom_41,axiom,
    ( ! [X] :
        ( cC82(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & cC80(Y) ) ) )).

%----Equality cC84
fof(axiom_42,axiom,
    ( ! [X] :
        ( cC84(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & ~ cC2(Y) ) ) )).

%----Equality cC86
fof(axiom_43,axiom,
    ( ! [X] :
        ( cC86(X)
      <=> ( ~ cC84(X)
          & ~ cC2(X) ) ) )).

%----Equality cC88
fof(axiom_44,axiom,
    ( ! [X] :
        ( cC88(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & cC86(Y) ) ) )).

%----Equality cC90
fof(axiom_45,axiom,
    ( ! [X] :
        ( cC90(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & cC88(Y) ) ) )).

%----Equality cC92
fof(axiom_46,axiom,
    ( ! [X] :
        ( cC92(X)
      <=> ( ~ cC82(X)
          & cC90(X) ) ) )).

%----Equality cC94
fof(axiom_47,axiom,
    ( ! [X] :
        ( cC94(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & cC92(Y) ) ) )).

%----Equality cTEST
fof(axiom_48,axiom,
    ( ! [X] :
        ( cTEST(X)
      <=> ( ~ cC94(X)
          & cC76(X) ) ) )).

%----iV8467
fof(axiom_49,axiom,
    ( ~ cC92(iV8467) )).

%----iV8467
fof(axiom_50,axiom,
    ( ~ cC72(iV8467) )).

%----iV8467
fof(axiom_51,axiom,
    ( ~ cC42(iV8467) )).

%----iV8467
fof(axiom_52,axiom,
    ( cowlThing(iV8467) )).

%----iV8467
fof(axiom_53,axiom,
    ( ~ cC52(iV8467) )).

%----iV8467
fof(axiom_54,axiom,
    ( ~ cC26(iV8467) )).

fof(axiom_55,axiom,
    ( rR1(iV8467,iV8471) )).

fof(axiom_56,axiom,
    ( rR1(iV8467,iV8473) )).

fof(axiom_57,axiom,
    ( rR1(iV8467,iV8468) )).

fof(axiom_58,axiom,
    ( rR1(iV8467,iV8469) )).

fof(axiom_59,axiom,
    ( rR1(iV8467,iV8475) )).

fof(axiom_60,axiom,
    ( rR1(iV8467,iV8472) )).

fof(axiom_61,axiom,
    ( rR1(iV8467,iV8474) )).

fof(axiom_62,axiom,
    ( rR1(iV8467,iV8470) )).

%----iV8468
fof(axiom_63,axiom,
    ( ~ cC2(iV8468) )).

%----iV8468
fof(axiom_64,axiom,
    ( cowlThing(iV8468) )).

%----iV8469
fof(axiom_65,axiom,
    ( ~ cC6(iV8469) )).

%----iV8469
fof(axiom_66,axiom,
    ( ! [X] :
        ( rR1(iV8469,X)
       => cC2(X) ) )).

%----iV8469
fof(axiom_67,axiom,
    ( cowlThing(iV8469) )).

%----iV8470
fof(axiom_68,axiom,
    ( cTOP(iV8470) )).

%----iV8470
fof(axiom_69,axiom,
    ( cowlThing(iV8470) )).

%----iV8471
fof(axiom_70,axiom,
    ( ~ cC2(iV8471) )).

%----iV8471
fof(axiom_71,axiom,
    ( ~ cC78(iV8471) )).

%----iV8471
fof(axiom_72,axiom,
    ( cowlThing(iV8471) )).

%----iV8471
fof(axiom_73,axiom,
    ( ! [X] :
        ( rR1(iV8471,X)
       => cC2(X) ) )).

%----iV8472
fof(axiom_74,axiom,
    ( ~ cC2(iV8472) )).

%----iV8472
fof(axiom_75,axiom,
    ( cowlThing(iV8472) )).

fof(axiom_76,axiom,
    ( rR1(iV8472,iV8476) )).

%----iV8473
fof(axiom_77,axiom,
    ( ~ cC2(iV8473) )).

%----iV8473
fof(axiom_78,axiom,
    ( cowlThing(iV8473) )).

%----iV8474
fof(axiom_79,axiom,
    ( ! [X] :
        ( rR1(iV8474,X)
       => ~ cC2(X) ) )).

%----iV8474
fof(axiom_80,axiom,
    ( ~ cC32(iV8474) )).

%----iV8474
fof(axiom_81,axiom,
    ( cowlThing(iV8474) )).

%----iV8475
fof(axiom_82,axiom,
    ( ~ cC2(iV8475) )).

%----iV8475
fof(axiom_83,axiom,
    ( cowlThing(iV8475) )).

%----iV8476
fof(axiom_84,axiom,
    ( cC2(iV8476) )).

%----iV8476
fof(axiom_85,axiom,
    ( cowlThing(iV8476) )).

%----Thing and Nothing
%----String and Integer disjoint
%----iV8467
%----iV8467
%----iV8467
%----iV8467
%----iV8467
%----iV8467
%----iV8467
%----iV8467
%----iV8467
%----iV8467
%----iV8471
%----iV8471
%----iV8472
%----iV8472
%----iV8472
fof(the_axiom,conjecture,
    ( ! [X] :
        ( cowlThing(X)
        & ~ cowlNothing(X) )
    & ! [X] :
        ( xsd_string(X)
      <=> ~ xsd_integer(X) )
    & cC10(iV8467)
    & cC48(iV8467)
    & cC4(iV8467)
    & cC82(iV8467)
    & cC14(iV8467)
    & cC8(iV8467)
    & cC20(iV8467)
    & cowlThing(iV8467)
    & cC62(iV8467)
    & cC34(iV8467)
    & cowlThing(iV8471)
    & cC80(iV8471)
    & cC60(iV8472)
    & cowlThing(iV8472)
    & cC58(iV8472) )).

%------------------------------------------------------------------------------
