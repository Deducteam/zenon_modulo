%------------------------------------------------------------------------------
% File     : KRS155+1 : TPTP v6.1.0. Released v3.1.0.
% Domain   : Knowledge Representation (Semantic Web)
% Problem  : DL Test: k_d4 ABox test from DL98 systems comparison
% Version  : Especial.
% English  :

% Refs     : [Bec03] Bechhofer (2003), Email to G. Sutcliffe
%          : [TR+04] Tsarkov et al. (2004), Using Vampire to Reason with OW
% Source   : [Bec03]
% Names    : positive_description-logic-Manifest662 [Bec03]

% Status   : Theorem
% Rating   : 0.09 v6.1.0, 0.12 v6.0.0, 0.25 v5.4.0, 0.22 v5.3.0, 0.35 v5.2.0, 0.21 v5.0.0, 0.25 v4.1.0, 0.22 v4.0.1, 0.16 v4.0.0, 0.15 v3.7.0, 0.67 v3.5.0, 0.25 v3.3.0, 0.00 v3.2.0, 0.11 v3.1.0
% Syntax   : Number of formulae    :  135 (  34 unit)
%            Number of atoms       :  300 (   0 equality)
%            Maximal formula depth :   17 (   4 average)
%            Number of connectives :  193 (  28 ~  ;   0  |;  65  &)
%                                         (  97 <=>;   3 =>;   0 <=)
%                                         (   0 <~>;   0 ~|;   0 ~&)
%            Number of predicates  :  102 (   0 propositional; 1-2 arity)
%            Number of functors    :   10 (  10 constant; 0-0 arity)
%            Number of variables   :  181 (   0 singleton; 102 !;  79 ?)
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
      <=> ~ ( ? [Y] : ra_Px1(X,Y) ) ) )).

%----Equality cC14
fof(axiom_5,axiom,
    ( ! [X] :
        ( cC14(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & cTOP(Y) ) ) )).

%----Equality cC14xcomp
fof(axiom_6,axiom,
    ( ! [X] :
        ( cC14xcomp(X)
      <=> ? [Y0] : ra_Px1(X,Y0) ) )).

%----Equality cC16
fof(axiom_7,axiom,
    ( ! [X] :
        ( cC16(X)
      <=> ? [Y0] : ra_Px2(X,Y0) ) )).

%----Equality cC16
fof(axiom_8,axiom,
    ( ! [X] :
        ( cC16(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & cC14xcomp(Y) ) ) )).

%----Equality cC16xcomp
fof(axiom_9,axiom,
    ( ! [X] :
        ( cC16xcomp(X)
      <=> ~ ( ? [Y] : ra_Px2(X,Y) ) ) )).

%----Equality cC18
fof(axiom_10,axiom,
    ( ! [X] :
        ( cC18(X)
      <=> ( cC16xcomp(X)
          & cC12(X) ) ) )).

%----Equality cC2
fof(axiom_11,axiom,
    ( ! [X] :
        ( cC2(X)
      <=> ? [Y0] : ra_Px3(X,Y0) ) )).

%----Equality cC2xcomp
fof(axiom_12,axiom,
    ( ! [X] :
        ( cC2xcomp(X)
      <=> ~ ( ? [Y] : ra_Px3(X,Y) ) ) )).

%----Equality cC20
fof(axiom_13,axiom,
    ( ! [X] :
        ( cC20(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & cC2xcomp(Y) ) ) )).

%----Equality cC20
fof(axiom_14,axiom,
    ( ! [X] :
        ( cC20(X)
      <=> ? [Y0] : ra_Px5(X,Y0) ) )).

%----Equality cC20xcomp
fof(axiom_15,axiom,
    ( ! [X] :
        ( cC20xcomp(X)
      <=> ~ ( ? [Y] : ra_Px5(X,Y) ) ) )).

%----Equality cC22
fof(axiom_16,axiom,
    ( ! [X] :
        ( cC22(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & cC2xcomp(Y) ) ) )).

%----Equality cC24
fof(axiom_17,axiom,
    ( ! [X] :
        ( cC24(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & cC22(Y) ) ) )).

%----Equality cC26
fof(axiom_18,axiom,
    ( ! [X] :
        ( cC26(X)
      <=> ( cC24(X)
          & cC20xcomp(X) ) ) )).

%----Equality cC26
fof(axiom_19,axiom,
    ( ! [X] :
        ( cC26(X)
      <=> ? [Y0] : ra_Px30(X,Y0) ) )).

%----Equality cC26xcomp
fof(axiom_20,axiom,
    ( ! [X] :
        ( cC26xcomp(X)
      <=> ~ ( ? [Y] : ra_Px30(X,Y) ) ) )).

%----Equality cC28
fof(axiom_21,axiom,
    ( ! [X] :
        ( cC28(X)
      <=> ? [Y0] : ra_Px6(X,Y0) ) )).

%----Equality cC28
fof(axiom_22,axiom,
    ( ! [X] :
        ( cC28(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & cC26(Y) ) ) )).

%----Equality cC28xcomp
fof(axiom_23,axiom,
    ( ! [X] :
        ( cC28xcomp(X)
      <=> ~ ( ? [Y] : ra_Px6(X,Y) ) ) )).

%----Equality cC30
fof(axiom_24,axiom,
    ( ! [X] :
        ( cC30(X)
      <=> ( cC18(X)
          & cC28xcomp(X) ) ) )).

%----Equality cC32
fof(axiom_25,axiom,
    ( ! [X] :
        ( cC32(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & cC2(Y) ) ) )).

%----Equality cC32
fof(axiom_26,axiom,
    ( ! [X] :
        ( cC32(X)
      <=> ~ ( ? [Y] : ra_Px7(X,Y) ) ) )).

%----Equality cC32xcomp
fof(axiom_27,axiom,
    ( ! [X] :
        ( cC32xcomp(X)
      <=> ? [Y0] : ra_Px7(X,Y0) ) )).

%----Equality cC34
fof(axiom_28,axiom,
    ( ! [X] :
        ( cC34(X)
      <=> ? [Y0] : ra_Px9(X,Y0) ) )).

%----Equality cC34
fof(axiom_29,axiom,
    ( ! [X] :
        ( cC34(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & cC32xcomp(Y) ) ) )).

%----Equality cC34xcomp
fof(axiom_30,axiom,
    ( ! [X] :
        ( cC34xcomp(X)
      <=> ~ ( ? [Y] : ra_Px9(X,Y) ) ) )).

%----Equality cC36
fof(axiom_31,axiom,
    ( ! [X] :
        ( cC36(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & cC2(Y) ) ) )).

%----Equality cC36
fof(axiom_32,axiom,
    ( ! [X] :
        ( cC36(X)
      <=> ? [Y0] : ra_Px8(X,Y0) ) )).

%----Equality cC36xcomp
fof(axiom_33,axiom,
    ( ! [X] :
        ( cC36xcomp(X)
      <=> ~ ( ? [Y] : ra_Px8(X,Y) ) ) )).

%----Equality cC38
fof(axiom_34,axiom,
    ( ! [X] :
        ( cC38(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & cC36xcomp(Y) ) ) )).

%----Equality cC4
fof(axiom_35,axiom,
    ( ! [X] :
        ( cC4(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & cC2xcomp(Y) ) ) )).

%----Equality cC40
fof(axiom_36,axiom,
    ( ! [X] :
        ( cC40(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & cC38(Y) ) ) )).

%----Equality cC42
fof(axiom_37,axiom,
    ( ! [X] :
        ( cC42(X)
      <=> ~ ( ? [Y] : ra_Px31(X,Y) ) ) )).

%----Equality cC42
fof(axiom_38,axiom,
    ( ! [X] :
        ( cC42(X)
      <=> ( cC40(X)
          & cC34xcomp(X) ) ) )).

%----Equality cC42xcomp
fof(axiom_39,axiom,
    ( ! [X] :
        ( cC42xcomp(X)
      <=> ? [Y0] : ra_Px31(X,Y0) ) )).

%----Equality cC44
fof(axiom_40,axiom,
    ( ! [X] :
        ( cC44(X)
      <=> ~ ( ? [Y] : ra_Px10(X,Y) ) ) )).

%----Equality cC44
fof(axiom_41,axiom,
    ( ! [X] :
        ( cC44(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & cC42(Y) ) ) )).

%----Equality cC44xcomp
fof(axiom_42,axiom,
    ( ! [X] :
        ( cC44xcomp(X)
      <=> ? [Y0] : ra_Px10(X,Y0) ) )).

%----Equality cC46
fof(axiom_43,axiom,
    ( ! [X] :
        ( cC46(X)
      <=> ( cC44xcomp(X)
          & cC30(X) ) ) )).

%----Equality cC48
fof(axiom_44,axiom,
    ( ! [X] :
        ( cC48(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & cC2xcomp(Y) ) ) )).

%----Equality cC48
fof(axiom_45,axiom,
    ( ! [X] :
        ( cC48(X)
      <=> ? [Y0] : ra_Px12(X,Y0) ) )).

%----Equality cC48xcomp
fof(axiom_46,axiom,
    ( ! [X] :
        ( cC48xcomp(X)
      <=> ~ ( ? [Y] : ra_Px12(X,Y) ) ) )).

%----Equality cC50
fof(axiom_47,axiom,
    ( ! [X] :
        ( cC50(X)
      <=> ~ ( ? [Y] : ra_Px13(X,Y) ) ) )).

%----Equality cC50
fof(axiom_48,axiom,
    ( ! [X] :
        ( cC50(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & cC2(Y) ) ) )).

%----Equality cC50xcomp
fof(axiom_49,axiom,
    ( ! [X] :
        ( cC50xcomp(X)
      <=> ? [Y0] : ra_Px13(X,Y0) ) )).

%----Equality cC52
fof(axiom_50,axiom,
    ( ! [X] :
        ( cC52(X)
      <=> ? [Y0] : ra_Px32(X,Y0) ) )).

%----Equality cC52
fof(axiom_51,axiom,
    ( ! [X] :
        ( cC52(X)
      <=> ( cC50xcomp(X)
          & cC48xcomp(X) ) ) )).

%----Equality cC52xcomp
fof(axiom_52,axiom,
    ( ! [X] :
        ( cC52xcomp(X)
      <=> ~ ( ? [Y] : ra_Px32(X,Y) ) ) )).

%----Equality cC54
fof(axiom_53,axiom,
    ( ! [X] :
        ( cC54(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & cC52(Y) ) ) )).

%----Equality cC54
fof(axiom_54,axiom,
    ( ! [X] :
        ( cC54(X)
      <=> ? [Y0] : ra_Px14(X,Y0) ) )).

%----Equality cC54xcomp
fof(axiom_55,axiom,
    ( ! [X] :
        ( cC54xcomp(X)
      <=> ~ ( ? [Y] : ra_Px14(X,Y) ) ) )).

%----Equality cC56
fof(axiom_56,axiom,
    ( ! [X] :
        ( cC56(X)
      <=> ( cC54xcomp(X)
          & cC46(X) ) ) )).

%----Equality cC58
fof(axiom_57,axiom,
    ( ! [X] :
        ( cC58(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & cC2(Y) ) ) )).

%----Equality cC6
fof(axiom_58,axiom,
    ( ! [X] :
        ( cC6(X)
      <=> ~ ( ? [Y] : ra_Px28(X,Y) ) ) )).

%----Equality cC6
fof(axiom_59,axiom,
    ( ! [X] :
        ( cC6(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & cC2xcomp(Y) ) ) )).

%----Equality cC6xcomp
fof(axiom_60,axiom,
    ( ! [X] :
        ( cC6xcomp(X)
      <=> ? [Y0] : ra_Px28(X,Y0) ) )).

%----Equality cC60
fof(axiom_61,axiom,
    ( ! [X] :
        ( cC60(X)
      <=> ( cC2xcomp(X)
          & cC58(X) ) ) )).

%----Equality cC62
fof(axiom_62,axiom,
    ( ! [X] :
        ( cC62(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & cC60(Y) ) ) )).

%----Equality cC62
fof(axiom_63,axiom,
    ( ! [X] :
        ( cC62(X)
      <=> ? [Y0] : ra_Px17(X,Y0) ) )).

%----Equality cC62xcomp
fof(axiom_64,axiom,
    ( ! [X] :
        ( cC62xcomp(X)
      <=> ~ ( ? [Y] : ra_Px17(X,Y) ) ) )).

%----Equality cC64
fof(axiom_65,axiom,
    ( ! [X] :
        ( cC64(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & cC2(Y) ) ) )).

%----Equality cC66
fof(axiom_66,axiom,
    ( ! [X] :
        ( cC66(X)
      <=> ( cC2xcomp(X)
          & cC64(X) ) ) )).

%----Equality cC68
fof(axiom_67,axiom,
    ( ! [X] :
        ( cC68(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & cC66(Y) ) ) )).

%----Equality cC70
fof(axiom_68,axiom,
    ( ! [X] :
        ( cC70(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & cC68(Y) ) ) )).

%----Equality cC72
fof(axiom_69,axiom,
    ( ! [X] :
        ( cC72(X)
      <=> ( cC62xcomp(X)
          & cC70(X) ) ) )).

%----Equality cC72
fof(axiom_70,axiom,
    ( ! [X] :
        ( cC72(X)
      <=> ? [Y0] : ra_Px33(X,Y0) ) )).

%----Equality cC72xcomp
fof(axiom_71,axiom,
    ( ! [X] :
        ( cC72xcomp(X)
      <=> ~ ( ? [Y] : ra_Px33(X,Y) ) ) )).

%----Equality cC74
fof(axiom_72,axiom,
    ( ! [X] :
        ( cC74(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & cC72(Y) ) ) )).

%----Equality cC74
fof(axiom_73,axiom,
    ( ! [X] :
        ( cC74(X)
      <=> ? [Y0] : ra_Px18(X,Y0) ) )).

%----Equality cC74xcomp
fof(axiom_74,axiom,
    ( ! [X] :
        ( cC74xcomp(X)
      <=> ~ ( ? [Y] : ra_Px18(X,Y) ) ) )).

%----Equality cC76
fof(axiom_75,axiom,
    ( ! [X] :
        ( cC76(X)
      <=> ( cC74xcomp(X)
          & cC56(X) ) ) )).

%----Equality cC78
fof(axiom_76,axiom,
    ( ! [X] :
        ( cC78(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & cC2xcomp(Y) ) ) )).

%----Equality cC78
fof(axiom_77,axiom,
    ( ! [X] :
        ( cC78(X)
      <=> ? [Y0] : ra_Px20(X,Y0) ) )).

%----Equality cC78xcomp
fof(axiom_78,axiom,
    ( ! [X] :
        ( cC78xcomp(X)
      <=> ~ ( ? [Y] : ra_Px20(X,Y) ) ) )).

%----Equality cC8
fof(axiom_79,axiom,
    ( ! [X] :
        ( cC8(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & cC6xcomp(Y) ) ) )).

%----Equality cC80
fof(axiom_80,axiom,
    ( ! [X] :
        ( cC80(X)
      <=> ( cC78xcomp(X)
          & cC2xcomp(X) ) ) )).

%----Equality cC82
fof(axiom_81,axiom,
    ( ! [X] :
        ( cC82(X)
      <=> ~ ( ? [Y] : ra_Px25(X,Y) ) ) )).

%----Equality cC82
fof(axiom_82,axiom,
    ( ! [X] :
        ( cC82(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & cC80(Y) ) ) )).

%----Equality cC82xcomp
fof(axiom_83,axiom,
    ( ! [X] :
        ( cC82xcomp(X)
      <=> ? [Y0] : ra_Px25(X,Y0) ) )).

%----Equality cC84
fof(axiom_84,axiom,
    ( ! [X] :
        ( cC84(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & cC2xcomp(Y) ) ) )).

%----Equality cC84
fof(axiom_85,axiom,
    ( ! [X] :
        ( cC84(X)
      <=> ? [Y0] : ra_Px23(X,Y0) ) )).

%----Equality cC84xcomp
fof(axiom_86,axiom,
    ( ! [X] :
        ( cC84xcomp(X)
      <=> ~ ( ? [Y] : ra_Px23(X,Y) ) ) )).

%----Equality cC86
fof(axiom_87,axiom,
    ( ! [X] :
        ( cC86(X)
      <=> ( cC84xcomp(X)
          & cC2xcomp(X) ) ) )).

%----Equality cC88
fof(axiom_88,axiom,
    ( ! [X] :
        ( cC88(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & cC86(Y) ) ) )).

%----Equality cC90
fof(axiom_89,axiom,
    ( ! [X] :
        ( cC90(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & cC88(Y) ) ) )).

%----Equality cC92
fof(axiom_90,axiom,
    ( ! [X] :
        ( cC92(X)
      <=> ( cC82xcomp(X)
          & cC90(X) ) ) )).

%----Equality cC92
fof(axiom_91,axiom,
    ( ! [X] :
        ( cC92(X)
      <=> ~ ( ? [Y] : ra_Px34(X,Y) ) ) )).

%----Equality cC92xcomp
fof(axiom_92,axiom,
    ( ! [X] :
        ( cC92xcomp(X)
      <=> ? [Y0] : ra_Px34(X,Y0) ) )).

%----Equality cC94
fof(axiom_93,axiom,
    ( ! [X] :
        ( cC94(X)
      <=> ? [Y0] : ra_Px29(X,Y0) ) )).

%----Equality cC94
fof(axiom_94,axiom,
    ( ! [X] :
        ( cC94(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & cC92(Y) ) ) )).

%----Equality cC94xcomp
fof(axiom_95,axiom,
    ( ! [X] :
        ( cC94xcomp(X)
      <=> ~ ( ? [Y] : ra_Px29(X,Y) ) ) )).

%----Equality cTEST
fof(axiom_96,axiom,
    ( ! [X] :
        ( cTEST(X)
      <=> ( cC76(X)
          & cC94xcomp(X) ) ) )).

%----iV8467
fof(axiom_97,axiom,
    ( cC52xcomp(iV8467) )).

%----iV8467
fof(axiom_98,axiom,
    ( cC72xcomp(iV8467) )).

%----iV8467
fof(axiom_99,axiom,
    ( cC92xcomp(iV8467) )).

%----iV8467
fof(axiom_100,axiom,
    ( cC42xcomp(iV8467) )).

%----iV8467
fof(axiom_101,axiom,
    ( cC26xcomp(iV8467) )).

%----iV8467
fof(axiom_102,axiom,
    ( cowlThing(iV8467) )).

fof(axiom_103,axiom,
    ( rR1(iV8467,iV8471) )).

fof(axiom_104,axiom,
    ( rR1(iV8467,iV8470) )).

fof(axiom_105,axiom,
    ( rR1(iV8467,iV8469) )).

fof(axiom_106,axiom,
    ( rR1(iV8467,iV8474) )).

fof(axiom_107,axiom,
    ( rR1(iV8467,iV8468) )).

fof(axiom_108,axiom,
    ( rR1(iV8467,iV8473) )).

fof(axiom_109,axiom,
    ( rR1(iV8467,iV8475) )).

fof(axiom_110,axiom,
    ( rR1(iV8467,iV8472) )).

%----iV8468
fof(axiom_111,axiom,
    ( cC2xcomp(iV8468) )).

%----iV8468
fof(axiom_112,axiom,
    ( cowlThing(iV8468) )).

%----iV8469
fof(axiom_113,axiom,
    ( cC6xcomp(iV8469) )).

%----iV8469
fof(axiom_114,axiom,
    ( cowlThing(iV8469) )).

%----iV8469
fof(axiom_115,axiom,
    ( ! [X] :
        ( rR1(iV8469,X)
       => cC2(X) ) )).

%----iV8470
fof(axiom_116,axiom,
    ( cTOP(iV8470) )).

%----iV8470
fof(axiom_117,axiom,
    ( cowlThing(iV8470) )).

%----iV8471
fof(axiom_118,axiom,
    ( cC78xcomp(iV8471) )).

%----iV8471
fof(axiom_119,axiom,
    ( cC2xcomp(iV8471) )).

%----iV8471
fof(axiom_120,axiom,
    ( cowlThing(iV8471) )).

%----iV8471
fof(axiom_121,axiom,
    ( ! [X] :
        ( rR1(iV8471,X)
       => cC2(X) ) )).

%----iV8472
fof(axiom_122,axiom,
    ( cC2xcomp(iV8472) )).

%----iV8472
fof(axiom_123,axiom,
    ( cowlThing(iV8472) )).

fof(axiom_124,axiom,
    ( rR1(iV8472,iV8476) )).

%----iV8473
fof(axiom_125,axiom,
    ( cC2xcomp(iV8473) )).

%----iV8473
fof(axiom_126,axiom,
    ( cowlThing(iV8473) )).

%----iV8474
fof(axiom_127,axiom,
    ( cC32xcomp(iV8474) )).

%----iV8474
fof(axiom_128,axiom,
    ( cowlThing(iV8474) )).

%----iV8474
fof(axiom_129,axiom,
    ( ! [X] :
        ( rR1(iV8474,X)
       => cC2xcomp(X) ) )).

%----iV8475
fof(axiom_130,axiom,
    ( cC2xcomp(iV8475) )).

%----iV8475
fof(axiom_131,axiom,
    ( cowlThing(iV8475) )).

%----iV8476
fof(axiom_132,axiom,
    ( cC2(iV8476) )).

%----iV8476
fof(axiom_133,axiom,
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
    & cC20(iV8467)
    & cC4(iV8467)
    & cC8(iV8467)
    & cC82(iV8467)
    & cC62(iV8467)
    & cC14(iV8467)
    & cC34(iV8467)
    & cC10(iV8467)
    & cowlThing(iV8467)
    & cC48(iV8467)
    & cowlThing(iV8471)
    & cC80(iV8471)
    & cC58(iV8472)
    & cC60(iV8472)
    & cowlThing(iV8472) )).

%------------------------------------------------------------------------------
