%------------------------------------------------------------------------------
% File     : KRS148+1 : TPTP v6.1.0. Released v3.1.0.
% Domain   : Knowledge Representation (Semantic Web)
% Problem  : DL Test: k_dum ABox test from DL98 systems comparison
% Version  : Especial.
% English  :

% Refs     : [Bec03] Bechhofer (2003), Email to G. Sutcliffe
%          : [TR+04] Tsarkov et al. (2004), Using Vampire to Reason with OW
% Source   : [Bec03]
% Names    : positive_description-logic-Manifest203 [Bec03]

% Status   : Theorem
% Rating   : 0.00 v6.1.0, 0.12 v6.0.0, 0.50 v5.5.0, 0.12 v5.4.0, 0.17 v5.3.0, 0.22 v5.2.0, 0.07 v5.0.0, 0.10 v4.1.0, 0.06 v4.0.1, 0.00 v3.7.0, 0.33 v3.5.0, 0.12 v3.4.0, 0.17 v3.3.0, 0.00 v3.2.0, 0.11 v3.1.0
% Syntax   : Number of formulae    :   90 (  13 unit)
%            Number of atoms       :  243 (   0 equality)
%            Maximal formula depth :    6 (   4 average)
%            Number of connectives :  207 (  54 ~  ;   0  |;  77  &)
%                                         (  72 <=>;   4 =>;   0 <=)
%                                         (   0 <~>;   0 ~|;   0 ~&)
%            Number of predicates  :   77 (   0 propositional; 1-2 arity)
%            Number of functors    :    3 (   3 constant; 0-0 arity)
%            Number of variables   :  116 (   0 singleton;  78 !;  38 ?)
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
      <=> ( ~ cC8(X)
          & ~ cC2(X) ) ) )).

%----Equality cC100
fof(axiom_3,axiom,
    ( ! [X] :
        ( cC100(X)
      <=> ( ~ cC98(X)
          & cC94(X) ) ) )).

%----Equality cC102
fof(axiom_4,axiom,
    ( ! [X] :
        ( cC102(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & cC100(Y) ) ) )).

%----Equality cC104
fof(axiom_5,axiom,
    ( ! [X] :
        ( cC104(X)
      <=> ( ~ cC102(X)
          & cC88(X) ) ) )).

%----Equality cC106
fof(axiom_6,axiom,
    ( ! [X] :
        ( cC106(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & cC104(Y) ) ) )).

%----Equality cC108
fof(axiom_7,axiom,
    ( ! [X] :
        ( cC108(X)
      <=> ( cC84(X)
          & ~ cC106(X) ) ) )).

%----Equality cC110
fof(axiom_8,axiom,
    ( ! [X] :
        ( cC110(X)
      <=> ( cC62(X)
          & ~ cC108(X) ) ) )).

%----Equality cC112
fof(axiom_9,axiom,
    ( ! [X] :
        ( cC112(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & ~ cC110(Y) ) ) )).

%----Equality cC114
fof(axiom_10,axiom,
    ( ! [X] :
        ( cC114(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & cC112(Y) ) ) )).

%----Equality cC116
fof(axiom_11,axiom,
    ( ! [X] :
        ( cC116(X)
      <=> ( cTOP(X)
          & ~ cC114(X) ) ) )).

%----Equality cC118
fof(axiom_12,axiom,
    ( ! [X] :
        ( cC118(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & ~ cC2(Y) ) ) )).

%----Equality cC12
fof(axiom_13,axiom,
    ( ! [X] :
        ( cC12(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & cC10(Y) ) ) )).

%----Equality cC120
fof(axiom_14,axiom,
    ( ! [X] :
        ( cC120(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & ~ cC118(Y) ) ) )).

%----Equality cC122
fof(axiom_15,axiom,
    ( ! [X] :
        ( cC122(X)
      <=> ( ~ cC2(X)
          & cC120(X) ) ) )).

%----Equality cC124
fof(axiom_16,axiom,
    ( ! [X] :
        ( cC124(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & ~ cC2(Y) ) ) )).

%----Equality cC126
fof(axiom_17,axiom,
    ( ! [X] :
        ( cC126(X)
      <=> ( cC124(X)
          & cC2(X) ) ) )).

%----Equality cC128
fof(axiom_18,axiom,
    ( ! [X] :
        ( cC128(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & cC126(Y) ) ) )).

%----Equality cC130
fof(axiom_19,axiom,
    ( ! [X] :
        ( cC130(X)
      <=> ( ~ cC2(X)
          & ~ cC128(X) ) ) )).

%----Equality cC132
fof(axiom_20,axiom,
    ( ! [X] :
        ( cC132(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & cC130(Y) ) ) )).

%----Equality cC134
fof(axiom_21,axiom,
    ( ! [X] :
        ( cC134(X)
      <=> ( cC122(X)
          & ~ cC132(X) ) ) )).

%----Equality cC136
fof(axiom_22,axiom,
    ( ! [X] :
        ( cC136(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & cC134(Y) ) ) )).

%----Equality cC138
fof(axiom_23,axiom,
    ( ! [X] :
        ( cC138(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & cC136(Y) ) ) )).

%----Equality cC14
fof(axiom_24,axiom,
    ( ! [X] :
        ( cC14(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & cC12(Y) ) ) )).

%----Equality cC140
fof(axiom_25,axiom,
    ( ! [X] :
        ( cC140(X)
      <=> ( cTOP(X)
          & cC138(X) ) ) )).

%----Equality cC16
fof(axiom_26,axiom,
    ( ! [X] :
        ( cC16(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & ~ cC2(Y) ) ) )).

%----Equality cC18
fof(axiom_27,axiom,
    ( ! [X] :
        ( cC18(X)
      <=> ( cC16(X)
          & cC2(X) ) ) )).

%----Equality cC20
fof(axiom_28,axiom,
    ( ! [X] :
        ( cC20(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & cC18(Y) ) ) )).

%----Equality cC22
fof(axiom_29,axiom,
    ( ! [X] :
        ( cC22(X)
      <=> ( ~ cC20(X)
          & ~ cC2(X) ) ) )).

%----Equality cC24
fof(axiom_30,axiom,
    ( ! [X] :
        ( cC24(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & cC22(Y) ) ) )).

%----Equality cC26
fof(axiom_31,axiom,
    ( ! [X] :
        ( cC26(X)
      <=> ( cC14(X)
          & ~ cC24(X) ) ) )).

%----Equality cC28
fof(axiom_32,axiom,
    ( ! [X] :
        ( cC28(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & ~ cC2(Y) ) ) )).

%----Equality cC30
fof(axiom_33,axiom,
    ( ! [X] :
        ( cC30(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & cC28(Y) ) ) )).

%----Equality cC32
fof(axiom_34,axiom,
    ( ! [X] :
        ( cC32(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & ~ cC2(Y) ) ) )).

%----Equality cC34
fof(axiom_35,axiom,
    ( ! [X] :
        ( cC34(X)
      <=> ( cC30(X)
          & ~ cC32(X) ) ) )).

%----Equality cC36
fof(axiom_36,axiom,
    ( ! [X] :
        ( cC36(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & cC34(Y) ) ) )).

%----Equality cC38
fof(axiom_37,axiom,
    ( ! [X] :
        ( cC38(X)
      <=> ( ~ cC36(X)
          & ~ cC26(X) ) ) )).

%----Equality cC4
fof(axiom_38,axiom,
    ( ! [X] :
        ( cC4(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & ~ cC2(Y) ) ) )).

%----Equality cC40
fof(axiom_39,axiom,
    ( ! [X] :
        ( cC40(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & ~ cC2(Y) ) ) )).

%----Equality cC42
fof(axiom_40,axiom,
    ( ! [X] :
        ( cC42(X)
      <=> ( ~ cC2(X)
          & cC40(X) ) ) )).

%----Equality cC44
fof(axiom_41,axiom,
    ( ! [X] :
        ( cC44(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & ~ cC2(Y) ) ) )).

%----Equality cC46
fof(axiom_42,axiom,
    ( ! [X] :
        ( cC46(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & ~ cC44(Y) ) ) )).

%----Equality cC48
fof(axiom_43,axiom,
    ( ! [X] :
        ( cC48(X)
      <=> ( cC42(X)
          & cC46(X) ) ) )).

%----Equality cC50
fof(axiom_44,axiom,
    ( ! [X] :
        ( cC50(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & ~ cC2(Y) ) ) )).

%----Equality cC52
fof(axiom_45,axiom,
    ( ! [X] :
        ( cC52(X)
      <=> ( cC2(X)
          & cC50(X) ) ) )).

%----Equality cC54
fof(axiom_46,axiom,
    ( ! [X] :
        ( cC54(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & cC52(Y) ) ) )).

%----Equality cC56
fof(axiom_47,axiom,
    ( ! [X] :
        ( cC56(X)
      <=> ( ~ cC54(X)
          & ~ cC2(X) ) ) )).

%----Equality cC58
fof(axiom_48,axiom,
    ( ! [X] :
        ( cC58(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & cC56(Y) ) ) )).

%----Equality cC6
fof(axiom_49,axiom,
    ( ! [X] :
        ( cC6(X)
      <=> ( cC2(X)
          & cC4(X) ) ) )).

%----Equality cC60
fof(axiom_50,axiom,
    ( ! [X] :
        ( cC60(X)
      <=> ( cC48(X)
          & ~ cC58(X) ) ) )).

%----Equality cC62
fof(axiom_51,axiom,
    ( ! [X] :
        ( cC62(X)
      <=> ( cC38(X)
          & ~ cC60(X) ) ) )).

%----Equality cC64
fof(axiom_52,axiom,
    ( ! [X] :
        ( cC64(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & ~ cC2(Y) ) ) )).

%----Equality cC66
fof(axiom_53,axiom,
    ( ! [X] :
        ( cC66(X)
      <=> ( cC64(X)
          & cC2(X) ) ) )).

%----Equality cC68
fof(axiom_54,axiom,
    ( ! [X] :
        ( cC68(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & ~ cC2(Y) ) ) )).

%----Equality cC70
fof(axiom_55,axiom,
    ( ! [X] :
        ( cC70(X)
      <=> ( cC2(X)
          & cC68(X) ) ) )).

%----Equality cC72
fof(axiom_56,axiom,
    ( ! [X] :
        ( cC72(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & cC70(Y) ) ) )).

%----Equality cC74
fof(axiom_57,axiom,
    ( ! [X] :
        ( cC74(X)
      <=> ( cC66(X)
          & cC72(X) ) ) )).

%----Equality cC76
fof(axiom_58,axiom,
    ( ! [X] :
        ( cC76(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & ~ cC2(Y) ) ) )).

%----Equality cC78
fof(axiom_59,axiom,
    ( ! [X] :
        ( cC78(X)
      <=> ( cC76(X)
          & cC2(X) ) ) )).

%----Equality cC8
fof(axiom_60,axiom,
    ( ! [X] :
        ( cC8(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & cC6(Y) ) ) )).

%----Equality cC80
fof(axiom_61,axiom,
    ( ! [X] :
        ( cC80(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & cC78(Y) ) ) )).

%----Equality cC82
fof(axiom_62,axiom,
    ( ! [X] :
        ( cC82(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & ~ cC80(Y) ) ) )).

%----Equality cC84
fof(axiom_63,axiom,
    ( ! [X] :
        ( cC84(X)
      <=> ( cC82(X)
          & cC74(X) ) ) )).

%----Equality cC86
fof(axiom_64,axiom,
    ( ! [X] :
        ( cC86(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & ~ cC2(Y) ) ) )).

%----Equality cC88
fof(axiom_65,axiom,
    ( ! [X] :
        ( cC88(X)
      <=> ( cC86(X)
          & cC2(X) ) ) )).

%----Equality cC90
fof(axiom_66,axiom,
    ( ! [X] :
        ( cC90(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & ~ cC2(Y) ) ) )).

%----Equality cC92
fof(axiom_67,axiom,
    ( ! [X] :
        ( cC92(X)
      <=> ( cC2(X)
          & cC90(X) ) ) )).

%----Equality cC94
fof(axiom_68,axiom,
    ( ! [X] :
        ( cC94(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & cC92(Y) ) ) )).

%----Equality cC96
fof(axiom_69,axiom,
    ( ! [X] :
        ( cC96(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & ~ cC2(Y) ) ) )).

%----Equality cC98
fof(axiom_70,axiom,
    ( ! [X] :
        ( cC98(X)
      <=> ( cC96(X)
          & cC2(X) ) ) )).

%----Equality cTEST
fof(axiom_71,axiom,
    ( ! [X] :
        ( cTEST(X)
      <=> ( cC140(X)
          & cC116(X) ) ) )).

%----iV5475
fof(axiom_72,axiom,
    ( cTEST(iV5475) )).

%----iV5475
fof(axiom_73,axiom,
    ( cTOP(iV5475) )).

%----iV5475
fof(axiom_74,axiom,
    ( cowlThing(iV5475) )).

%----iV5475
fof(axiom_75,axiom,
    ( ! [X] :
        ( rR1(iV5475,X)
       => ~ cC112(X) ) )).

%----iV5475
fof(axiom_76,axiom,
    ( ~ cC114(iV5475) )).

fof(axiom_77,axiom,
    ( rR1(iV5475,iV5476) )).

%----iV5476
fof(axiom_78,axiom,
    ( cowlThing(iV5476) )).

%----iV5478
fof(axiom_79,axiom,
    ( ~ cC34(iV5478) )).

%----iV5478
fof(axiom_80,axiom,
    ( ~ cC12(iV5478) )).

%----iV5478
fof(axiom_81,axiom,
    ( ! [X] :
        ( rR1(iV5478,X)
       => cC2(X) ) )).

%----iV5478
fof(axiom_82,axiom,
    ( ~ cC30(iV5478) )).

%----iV5478
fof(axiom_83,axiom,
    ( ~ cC130(iV5478) )).

%----iV5478
fof(axiom_84,axiom,
    ( ~ cC118(iV5478) )).

%----iV5478
fof(axiom_85,axiom,
    ( cowlThing(iV5478) )).

%----iV5478
fof(axiom_86,axiom,
    ( cC2(iV5478) )).

%----iV5478
fof(axiom_87,axiom,
    ( ! [X] :
        ( rR1(iV5478,X)
       => ~ cC28(X) ) )).

%----iV5478
fof(axiom_88,axiom,
    ( ! [X] :
        ( rR1(iV5478,X)
       => ~ cC10(X) ) )).

%----Thing and Nothing
%----String and Integer disjoint
%----iV5475
%----iV5475
%----iV5475
%----iV5475
fof(the_axiom,conjecture,
    ( ! [X] :
        ( cowlThing(X)
        & ~ cowlNothing(X) )
    & ! [X] :
        ( xsd_string(X)
      <=> ~ xsd_integer(X) )
    & cC138(iV5475)
    & cowlThing(iV5475)
    & cC116(iV5475)
    & cC140(iV5475) )).

%------------------------------------------------------------------------------
