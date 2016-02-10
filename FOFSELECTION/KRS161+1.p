%------------------------------------------------------------------------------
% File     : KRS161+1 : TPTP v6.1.0. Released v3.1.0.
% Domain   : Knowledge Representation (Semantic Web)
% Problem  : DL Test: k_poly ABox test from DL98 systems comparison
% Version  : Especial.
% English  :

% Refs     : [Bec03] Bechhofer (2003), Email to G. Sutcliffe
%          : [TR+04] Tsarkov et al. (2004), Using Vampire to Reason with OW
% Source   : [Bec03]
% Names    : positive_description-logic-Manifest668 [Bec03]

% Status   : Theorem
% Rating   : 0.09 v6.1.0, 0.20 v6.0.0, 0.25 v5.4.0, 0.26 v5.3.0, 0.30 v5.2.0, 0.21 v5.0.0, 0.20 v4.1.0, 0.17 v4.0.1, 0.21 v4.0.0, 0.20 v3.7.0, 0.67 v3.5.0, 0.38 v3.4.0, 0.25 v3.3.0, 0.11 v3.2.0, 0.22 v3.1.0
% Syntax   : Number of formulae    :  287 (  99 unit)
%            Number of atoms       :  580 (   0 equality)
%            Maximal formula depth :   47 (   3 average)
%            Number of connectives :  340 (  47 ~  ;   0  |; 106  &)
%                                         ( 146 <=>;  41 =>;   0 <=)
%                                         (   0 <~>;   0 ~|;   0 ~&)
%            Number of predicates  :  158 (   0 propositional; 1-2 arity)
%            Number of functors    :   16 (  16 constant; 0-0 arity)
%            Number of variables   :  303 (   0 singleton; 189 !; 114 ?)
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
      <=> ( cC8(X)
          & cC6(X) ) ) )).

%----Equality cC10
fof(axiom_3,axiom,
    ( ! [X] :
        ( cC10(X)
      <=> ~ ( ? [Y] : ra_Px73(X,Y) ) ) )).

%----Equality cC10xcomp
fof(axiom_4,axiom,
    ( ! [X] :
        ( cC10xcomp(X)
      <=> ? [Y0] : ra_Px73(X,Y0) ) )).

%----Equality cC100
fof(axiom_5,axiom,
    ( ! [X] :
        ( cC100(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & cC98xcomp(Y) ) ) )).

%----Equality cC100
fof(axiom_6,axiom,
    ( ! [X] :
        ( cC100(X)
      <=> ~ ( ? [Y] : ra_Px37(X,Y) ) ) )).

%----Equality cC100xcomp
fof(axiom_7,axiom,
    ( ! [X] :
        ( cC100xcomp(X)
      <=> ? [Y0] : ra_Px37(X,Y0) ) )).

%----Equality cC102
fof(axiom_8,axiom,
    ( ! [X] :
        ( cC102(X)
      <=> ? [Y0] : ra_Px36(X,Y0) ) )).

%----Equality cC102xcomp
fof(axiom_9,axiom,
    ( ! [X] :
        ( cC102xcomp(X)
      <=> ~ ( ? [Y] : ra_Px36(X,Y) ) ) )).

%----Equality cC104
fof(axiom_10,axiom,
    ( ! [X] :
        ( cC104(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & cC102xcomp(Y) ) ) )).

%----Equality cC106
fof(axiom_11,axiom,
    ( ! [X] :
        ( cC106(X)
      <=> ( cC104(X)
          & cC100xcomp(X) ) ) )).

%----Equality cC108
fof(axiom_12,axiom,
    ( ! [X] :
        ( cC108(X)
      <=> ( cC28(X)
          & cC106(X) ) ) )).

%----Equality cC110
fof(axiom_13,axiom,
    ( ! [X] :
        ( cC110(X)
      <=> ( cC4xcomp(X)
          & cC12xcomp(X) ) ) )).

%----Equality cC112
fof(axiom_14,axiom,
    ( ! [X] :
        ( cC112(X)
      <=> ( cC110(X)
          & cC102xcomp(X) ) ) )).

%----Equality cC114
fof(axiom_15,axiom,
    ( ! [X] :
        ( cC114(X)
      <=> ? [Y0] : ra_Px41(X,Y0) ) )).

%----Equality cC114xcomp
fof(axiom_16,axiom,
    ( ! [X] :
        ( cC114xcomp(X)
      <=> ~ ( ? [Y] : ra_Px41(X,Y) ) ) )).

%----Equality cC116
fof(axiom_17,axiom,
    ( ! [X] :
        ( cC116(X)
      <=> ( cC112(X)
          & cC114xcomp(X) ) ) )).

%----Equality cC118
fof(axiom_18,axiom,
    ( ! [X] :
        ( cC118(X)
      <=> ? [Y0] : ra_Px42(X,Y0) ) )).

%----Equality cC118xcomp
fof(axiom_19,axiom,
    ( ! [X] :
        ( cC118xcomp(X)
      <=> ~ ( ? [Y] : ra_Px42(X,Y) ) ) )).

%----Equality cC12
fof(axiom_20,axiom,
    ( ! [X] :
        ( cC12(X)
      <=> ? [Y0] : ra_Px18(X,Y0) ) )).

%----Equality cC12xcomp
fof(axiom_21,axiom,
    ( ! [X] :
        ( cC12xcomp(X)
      <=> ~ ( ? [Y] : ra_Px18(X,Y) ) ) )).

%----Equality cC120
fof(axiom_22,axiom,
    ( ! [X] :
        ( cC120(X)
      <=> ( cC116(X)
          & cC118xcomp(X) ) ) )).

%----Equality cC120
fof(axiom_23,axiom,
    ( ! [X] :
        ( cC120(X)
      <=> ~ ( ? [Y] : ra_Px43(X,Y) ) ) )).

%----Equality cC120xcomp
fof(axiom_24,axiom,
    ( ! [X] :
        ( cC120xcomp(X)
      <=> ? [Y0] : ra_Px43(X,Y0) ) )).

%----Equality cC122
fof(axiom_25,axiom,
    ( ! [X] :
        ( cC122(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & cC120xcomp(Y) ) ) )).

%----Equality cC124
fof(axiom_26,axiom,
    ( ! [X] :
        ( cC124(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & cC122(Y) ) ) )).

%----Equality cC126
fof(axiom_27,axiom,
    ( ! [X] :
        ( cC126(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & cC124(Y) ) ) )).

%----Equality cC128
fof(axiom_28,axiom,
    ( ! [X] :
        ( cC128(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & cC126(Y) ) ) )).

%----Equality cC130
fof(axiom_29,axiom,
    ( ! [X] :
        ( cC130(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & cC128(Y) ) ) )).

%----Equality cC14
fof(axiom_30,axiom,
    ( ! [X] :
        ( cC14(X)
      <=> ? [Y0] : ra_Px74(X,Y0) ) )).

%----Equality cC14
fof(axiom_31,axiom,
    ( ! [X] :
        ( cC14(X)
      <=> ( cC10(X)
          & cC12(X) ) ) )).

%----Equality cC14xcomp
fof(axiom_32,axiom,
    ( ! [X] :
        ( cC14xcomp(X)
      <=> ~ ( ? [Y] : ra_Px74(X,Y) ) ) )).

%----Equality cC16
fof(axiom_33,axiom,
    ( ! [X] :
        ( cC16(X)
      <=> ? [Y0] : ra_Px27(X,Y0) ) )).

%----Equality cC16xcomp
fof(axiom_34,axiom,
    ( ! [X] :
        ( cC16xcomp(X)
      <=> ~ ( ? [Y] : ra_Px27(X,Y) ) ) )).

%----Equality cC18
fof(axiom_35,axiom,
    ( ! [X] :
        ( cC18(X)
      <=> ~ ( ? [Y] : ra_Px1(X,Y) ) ) )).

%----Equality cC18
fof(axiom_36,axiom,
    ( ! [X] :
        ( cC18(X)
      <=> ( cC14(X)
          & cC16(X) ) ) )).

%----Equality cC18xcomp
fof(axiom_37,axiom,
    ( ! [X] :
        ( cC18xcomp(X)
      <=> ? [Y0] : ra_Px1(X,Y0) ) )).

%----Equality cC2
fof(axiom_38,axiom,
    ( ! [X] :
        ( cC2(X)
      <=> ? [Y0] : ra_Px2(X,Y0) ) )).

%----Equality cC2xcomp
fof(axiom_39,axiom,
    ( ! [X] :
        ( cC2xcomp(X)
      <=> ~ ( ? [Y] : ra_Px2(X,Y) ) ) )).

%----Equality cC20
fof(axiom_40,axiom,
    ( ! [X] :
        ( cC20(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & cC18xcomp(Y) ) ) )).

%----Equality cC22
fof(axiom_41,axiom,
    ( ! [X] :
        ( cC22(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & cC20(Y) ) ) )).

%----Equality cC24
fof(axiom_42,axiom,
    ( ! [X] :
        ( cC24(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & cC22(Y) ) ) )).

%----Equality cC26
fof(axiom_43,axiom,
    ( ! [X] :
        ( cC26(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & cC24(Y) ) ) )).

%----Equality cC28
fof(axiom_44,axiom,
    ( ! [X] :
        ( cC28(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & cC26(Y) ) ) )).

%----Equality cC30
fof(axiom_45,axiom,
    ( ! [X] :
        ( cC30(X)
      <=> ~ ( ? [Y] : ra_Px4(X,Y) ) ) )).

%----Equality cC30
fof(axiom_46,axiom,
    ( ! [X] :
        ( cC30(X)
      <=> ( cC2(X)
          & cC4(X) ) ) )).

%----Equality cC30xcomp
fof(axiom_47,axiom,
    ( ! [X] :
        ( cC30xcomp(X)
      <=> ? [Y0] : ra_Px4(X,Y0) ) )).

%----Equality cC32
fof(axiom_48,axiom,
    ( ! [X] :
        ( cC32(X)
      <=> ? [Y0] : ra_Px5(X,Y0) ) )).

%----Equality cC32
fof(axiom_49,axiom,
    ( ! [X] :
        ( cC32(X)
      <=> ( cC4xcomp(X)
          & cC2xcomp(X) ) ) )).

%----Equality cC32xcomp
fof(axiom_50,axiom,
    ( ! [X] :
        ( cC32xcomp(X)
      <=> ~ ( ? [Y] : ra_Px5(X,Y) ) ) )).

%----Equality cC34
fof(axiom_51,axiom,
    ( ! [X] :
        ( cC34(X)
      <=> ? [Y0] : ra_Px6(X,Y0) ) )).

%----Equality cC34
fof(axiom_52,axiom,
    ( ! [X] :
        ( cC34(X)
      <=> ( cC30xcomp(X)
          & cC32xcomp(X) ) ) )).

%----Equality cC34xcomp
fof(axiom_53,axiom,
    ( ! [X] :
        ( cC34xcomp(X)
      <=> ~ ( ? [Y] : ra_Px6(X,Y) ) ) )).

%----Equality cC36
fof(axiom_54,axiom,
    ( ! [X] :
        ( cC36(X)
      <=> ~ ( ? [Y] : ra_Px7(X,Y) ) ) )).

%----Equality cC36
fof(axiom_55,axiom,
    ( ! [X] :
        ( cC36(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & cC34xcomp(Y) ) ) )).

%----Equality cC36xcomp
fof(axiom_56,axiom,
    ( ! [X] :
        ( cC36xcomp(X)
      <=> ? [Y0] : ra_Px7(X,Y0) ) )).

%----Equality cC38
fof(axiom_57,axiom,
    ( ! [X] :
        ( cC38(X)
      <=> ( cTOP(X)
          & cC36xcomp(X) ) ) )).

%----Equality cC38
fof(axiom_58,axiom,
    ( ! [X] :
        ( cC38(X)
      <=> ? [Y0] : ra_Px8(X,Y0) ) )).

%----Equality cC38xcomp
fof(axiom_59,axiom,
    ( ! [X] :
        ( cC38xcomp(X)
      <=> ~ ( ? [Y] : ra_Px8(X,Y) ) ) )).

%----Equality cC4
fof(axiom_60,axiom,
    ( ! [X] :
        ( cC4(X)
      <=> ? [Y0] : ra_Px3(X,Y0) ) )).

%----Equality cC4xcomp
fof(axiom_61,axiom,
    ( ! [X] :
        ( cC4xcomp(X)
      <=> ~ ( ? [Y] : ra_Px3(X,Y) ) ) )).

%----Equality cC40
fof(axiom_62,axiom,
    ( ! [X] :
        ( cC40(X)
      <=> ~ ( ? [Y] : ra_Px10(X,Y) ) ) )).

%----Equality cC40
fof(axiom_63,axiom,
    ( ! [X] :
        ( cC40(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & cC38xcomp(Y) ) ) )).

%----Equality cC40xcomp
fof(axiom_64,axiom,
    ( ! [X] :
        ( cC40xcomp(X)
      <=> ? [Y0] : ra_Px10(X,Y0) ) )).

%----Equality cC42
fof(axiom_65,axiom,
    ( ! [X] :
        ( cC42(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & cC8xcomp(Y) ) ) )).

%----Equality cC44
fof(axiom_66,axiom,
    ( ! [X] :
        ( cC44(X)
      <=> ( cC40xcomp(X)
          & cC42(X) ) ) )).

%----Equality cC46
fof(axiom_67,axiom,
    ( ! [X] :
        ( cC46(X)
      <=> ~ ( ? [Y] : ra_Px13(X,Y) ) ) )).

%----Equality cC46
fof(axiom_68,axiom,
    ( ! [X] :
        ( cC46(X)
      <=> ( cC8(X)
          & cC4(X) ) ) )).

%----Equality cC46xcomp
fof(axiom_69,axiom,
    ( ! [X] :
        ( cC46xcomp(X)
      <=> ? [Y0] : ra_Px13(X,Y0) ) )).

%----Equality cC48
fof(axiom_70,axiom,
    ( ! [X] :
        ( cC48(X)
      <=> ( cC4xcomp(X)
          & cC8xcomp(X) ) ) )).

%----Equality cC48
fof(axiom_71,axiom,
    ( ! [X] :
        ( cC48(X)
      <=> ? [Y0] : ra_Px14(X,Y0) ) )).

%----Equality cC48xcomp
fof(axiom_72,axiom,
    ( ! [X] :
        ( cC48xcomp(X)
      <=> ~ ( ? [Y] : ra_Px14(X,Y) ) ) )).

%----Equality cC50
fof(axiom_73,axiom,
    ( ! [X] :
        ( cC50(X)
      <=> ( cC46xcomp(X)
          & cC48xcomp(X) ) ) )).

%----Equality cC50
fof(axiom_74,axiom,
    ( ! [X] :
        ( cC50(X)
      <=> ? [Y0] : ra_Px15(X,Y0) ) )).

%----Equality cC50xcomp
fof(axiom_75,axiom,
    ( ! [X] :
        ( cC50xcomp(X)
      <=> ~ ( ? [Y] : ra_Px15(X,Y) ) ) )).

%----Equality cC52
fof(axiom_76,axiom,
    ( ! [X] :
        ( cC52(X)
      <=> ~ ( ? [Y] : ra_Px49(X,Y) ) ) )).

%----Equality cC52
fof(axiom_77,axiom,
    ( ! [X] :
        ( cC52(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & cC50xcomp(Y) ) ) )).

%----Equality cC52xcomp
fof(axiom_78,axiom,
    ( ! [X] :
        ( cC52xcomp(X)
      <=> ? [Y0] : ra_Px49(X,Y0) ) )).

%----Equality cC54
fof(axiom_79,axiom,
    ( ! [X] :
        ( cC54(X)
      <=> ~ ( ? [Y] : ra_Px16(X,Y) ) ) )).

%----Equality cC54
fof(axiom_80,axiom,
    ( ! [X] :
        ( cC54(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & cC52(Y) ) ) )).

%----Equality cC54xcomp
fof(axiom_81,axiom,
    ( ! [X] :
        ( cC54xcomp(X)
      <=> ? [Y0] : ra_Px16(X,Y0) ) )).

%----Equality cC56
fof(axiom_82,axiom,
    ( ! [X] :
        ( cC56(X)
      <=> ( cC54xcomp(X)
          & cC44(X) ) ) )).

%----Equality cC56
fof(axiom_83,axiom,
    ( ! [X] :
        ( cC56(X)
      <=> ? [Y0] : ra_Px17(X,Y0) ) )).

%----Equality cC56xcomp
fof(axiom_84,axiom,
    ( ! [X] :
        ( cC56xcomp(X)
      <=> ~ ( ? [Y] : ra_Px17(X,Y) ) ) )).

%----Equality cC58
fof(axiom_85,axiom,
    ( ! [X] :
        ( cC58(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & cC56xcomp(Y) ) ) )).

%----Equality cC58
fof(axiom_86,axiom,
    ( ! [X] :
        ( cC58(X)
      <=> ~ ( ? [Y] : ra_Px19(X,Y) ) ) )).

%----Equality cC58xcomp
fof(axiom_87,axiom,
    ( ! [X] :
        ( cC58xcomp(X)
      <=> ? [Y0] : ra_Px19(X,Y0) ) )).

%----Equality cC6
fof(axiom_88,axiom,
    ( ! [X] :
        ( cC6(X)
      <=> ( cC2(X)
          & cC4(X) ) ) )).

%----Equality cC6
fof(axiom_89,axiom,
    ( ! [X] :
        ( cC6(X)
      <=> ? [Y0] : ra_Px72(X,Y0) ) )).

%----Equality cC6xcomp
fof(axiom_90,axiom,
    ( ! [X] :
        ( cC6xcomp(X)
      <=> ~ ( ? [Y] : ra_Px72(X,Y) ) ) )).

%----Equality cC60
fof(axiom_91,axiom,
    ( ! [X] :
        ( cC60(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & cC12xcomp(Y) ) ) )).

%----Equality cC62
fof(axiom_92,axiom,
    ( ! [X] :
        ( cC62(X)
      <=> ( cC60(X)
          & cC58xcomp(X) ) ) )).

%----Equality cC64
fof(axiom_93,axiom,
    ( ! [X] :
        ( cC64(X)
      <=> ( cC8(X)
          & cC12(X) ) ) )).

%----Equality cC64
fof(axiom_94,axiom,
    ( ! [X] :
        ( cC64(X)
      <=> ~ ( ? [Y] : ra_Px22(X,Y) ) ) )).

%----Equality cC64xcomp
fof(axiom_95,axiom,
    ( ! [X] :
        ( cC64xcomp(X)
      <=> ? [Y0] : ra_Px22(X,Y0) ) )).

%----Equality cC66
fof(axiom_96,axiom,
    ( ! [X] :
        ( cC66(X)
      <=> ( cC12xcomp(X)
          & cC8xcomp(X) ) ) )).

%----Equality cC66
fof(axiom_97,axiom,
    ( ! [X] :
        ( cC66(X)
      <=> ? [Y0] : ra_Px23(X,Y0) ) )).

%----Equality cC66xcomp
fof(axiom_98,axiom,
    ( ! [X] :
        ( cC66xcomp(X)
      <=> ~ ( ? [Y] : ra_Px23(X,Y) ) ) )).

%----Equality cC68
fof(axiom_99,axiom,
    ( ! [X] :
        ( cC68(X)
      <=> ? [Y0] : ra_Px24(X,Y0) ) )).

%----Equality cC68
fof(axiom_100,axiom,
    ( ! [X] :
        ( cC68(X)
      <=> ( cC64xcomp(X)
          & cC66xcomp(X) ) ) )).

%----Equality cC68xcomp
fof(axiom_101,axiom,
    ( ! [X] :
        ( cC68xcomp(X)
      <=> ~ ( ? [Y] : ra_Px24(X,Y) ) ) )).

%----Equality cC70
fof(axiom_102,axiom,
    ( ! [X] :
        ( cC70(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & cC68xcomp(Y) ) ) )).

%----Equality cC70
fof(axiom_103,axiom,
    ( ! [X] :
        ( cC70(X)
      <=> ? [Y0] : ra_Px51(X,Y0) ) )).

%----Equality cC70xcomp
fof(axiom_104,axiom,
    ( ! [X] :
        ( cC70xcomp(X)
      <=> ~ ( ? [Y] : ra_Px51(X,Y) ) ) )).

%----Equality cC72
fof(axiom_105,axiom,
    ( ! [X] :
        ( cC72(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & cC70(Y) ) ) )).

%----Equality cC72
fof(axiom_106,axiom,
    ( ! [X] :
        ( cC72(X)
      <=> ~ ( ? [Y] : ra_Px58(X,Y) ) ) )).

%----Equality cC72xcomp
fof(axiom_107,axiom,
    ( ! [X] :
        ( cC72xcomp(X)
      <=> ? [Y0] : ra_Px58(X,Y0) ) )).

%----Equality cC74
fof(axiom_108,axiom,
    ( ! [X] :
        ( cC74(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & cC72(Y) ) ) )).

%----Equality cC74
fof(axiom_109,axiom,
    ( ! [X] :
        ( cC74(X)
      <=> ~ ( ? [Y] : ra_Px25(X,Y) ) ) )).

%----Equality cC74xcomp
fof(axiom_110,axiom,
    ( ! [X] :
        ( cC74xcomp(X)
      <=> ? [Y0] : ra_Px25(X,Y0) ) )).

%----Equality cC76
fof(axiom_111,axiom,
    ( ! [X] :
        ( cC76(X)
      <=> ? [Y0] : ra_Px26(X,Y0) ) )).

%----Equality cC76
fof(axiom_112,axiom,
    ( ! [X] :
        ( cC76(X)
      <=> ( cC74xcomp(X)
          & cC62(X) ) ) )).

%----Equality cC76xcomp
fof(axiom_113,axiom,
    ( ! [X] :
        ( cC76xcomp(X)
      <=> ~ ( ? [Y] : ra_Px26(X,Y) ) ) )).

%----Equality cC78
fof(axiom_114,axiom,
    ( ! [X] :
        ( cC78(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & cC76xcomp(Y) ) ) )).

%----Equality cC78
fof(axiom_115,axiom,
    ( ! [X] :
        ( cC78(X)
      <=> ~ ( ? [Y] : ra_Px28(X,Y) ) ) )).

%----Equality cC78xcomp
fof(axiom_116,axiom,
    ( ! [X] :
        ( cC78xcomp(X)
      <=> ? [Y0] : ra_Px28(X,Y0) ) )).

%----Equality cC8
fof(axiom_117,axiom,
    ( ! [X] :
        ( cC8(X)
      <=> ? [Y0] : ra_Px9(X,Y0) ) )).

%----Equality cC8xcomp
fof(axiom_118,axiom,
    ( ! [X] :
        ( cC8xcomp(X)
      <=> ~ ( ? [Y] : ra_Px9(X,Y) ) ) )).

%----Equality cC80
fof(axiom_119,axiom,
    ( ! [X] :
        ( cC80(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & cC16xcomp(Y) ) ) )).

%----Equality cC82
fof(axiom_120,axiom,
    ( ! [X] :
        ( cC82(X)
      <=> ( cC80(X)
          & cC78xcomp(X) ) ) )).

%----Equality cC84
fof(axiom_121,axiom,
    ( ! [X] :
        ( cC84(X)
      <=> ~ ( ? [Y] : ra_Px31(X,Y) ) ) )).

%----Equality cC84
fof(axiom_122,axiom,
    ( ! [X] :
        ( cC84(X)
      <=> ( cC2(X)
          & cC12(X) ) ) )).

%----Equality cC84xcomp
fof(axiom_123,axiom,
    ( ! [X] :
        ( cC84xcomp(X)
      <=> ? [Y0] : ra_Px31(X,Y0) ) )).

%----Equality cC86
fof(axiom_124,axiom,
    ( ! [X] :
        ( cC86(X)
      <=> ( cC12xcomp(X)
          & cC2xcomp(X) ) ) )).

%----Equality cC86
fof(axiom_125,axiom,
    ( ! [X] :
        ( cC86(X)
      <=> ? [Y0] : ra_Px32(X,Y0) ) )).

%----Equality cC86xcomp
fof(axiom_126,axiom,
    ( ! [X] :
        ( cC86xcomp(X)
      <=> ~ ( ? [Y] : ra_Px32(X,Y) ) ) )).

%----Equality cC88
fof(axiom_127,axiom,
    ( ! [X] :
        ( cC88(X)
      <=> ? [Y0] : ra_Px33(X,Y0) ) )).

%----Equality cC88
fof(axiom_128,axiom,
    ( ! [X] :
        ( cC88(X)
      <=> ( cC84xcomp(X)
          & cC86xcomp(X) ) ) )).

%----Equality cC88xcomp
fof(axiom_129,axiom,
    ( ! [X] :
        ( cC88xcomp(X)
      <=> ~ ( ? [Y] : ra_Px33(X,Y) ) ) )).

%----Equality cC90
fof(axiom_130,axiom,
    ( ! [X] :
        ( cC90(X)
      <=> ? [Y0] : ra_Px50(X,Y0) ) )).

%----Equality cC90
fof(axiom_131,axiom,
    ( ! [X] :
        ( cC90(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & cC88xcomp(Y) ) ) )).

%----Equality cC90xcomp
fof(axiom_132,axiom,
    ( ! [X] :
        ( cC90xcomp(X)
      <=> ~ ( ? [Y] : ra_Px50(X,Y) ) ) )).

%----Equality cC92
fof(axiom_133,axiom,
    ( ! [X] :
        ( cC92(X)
      <=> ? [Y0] : ra_Px57(X,Y0) ) )).

%----Equality cC92
fof(axiom_134,axiom,
    ( ! [X] :
        ( cC92(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & cC90(Y) ) ) )).

%----Equality cC92xcomp
fof(axiom_135,axiom,
    ( ! [X] :
        ( cC92xcomp(X)
      <=> ~ ( ? [Y] : ra_Px57(X,Y) ) ) )).

%----Equality cC94
fof(axiom_136,axiom,
    ( ! [X] :
        ( cC94(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & cC92(Y) ) ) )).

%----Equality cC94
fof(axiom_137,axiom,
    ( ! [X] :
        ( cC94(X)
      <=> ? [Y0] : ra_Px48(X,Y0) ) )).

%----Equality cC94xcomp
fof(axiom_138,axiom,
    ( ! [X] :
        ( cC94xcomp(X)
      <=> ~ ( ? [Y] : ra_Px48(X,Y) ) ) )).

%----Equality cC96
fof(axiom_139,axiom,
    ( ! [X] :
        ( cC96(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & cC94(Y) ) ) )).

%----Equality cC96
fof(axiom_140,axiom,
    ( ! [X] :
        ( cC96(X)
      <=> ~ ( ? [Y] : ra_Px34(X,Y) ) ) )).

%----Equality cC96xcomp
fof(axiom_141,axiom,
    ( ! [X] :
        ( cC96xcomp(X)
      <=> ? [Y0] : ra_Px34(X,Y0) ) )).

%----Equality cC98
fof(axiom_142,axiom,
    ( ! [X] :
        ( cC98(X)
      <=> ? [Y0] : ra_Px35(X,Y0) ) )).

%----Equality cC98
fof(axiom_143,axiom,
    ( ! [X] :
        ( cC98(X)
      <=> ( cC96xcomp(X)
          & cC82(X) ) ) )).

%----Equality cC98xcomp
fof(axiom_144,axiom,
    ( ! [X] :
        ( cC98xcomp(X)
      <=> ~ ( ? [Y] : ra_Px35(X,Y) ) ) )).

%----Equality cTEST
fof(axiom_145,axiom,
    ( ! [X] :
        ( cTEST(X)
      <=> ( cC108(X)
          & cC130(X) ) ) )).

%----iV16439
fof(axiom_146,axiom,
    ( ! [X] :
        ( rR1(iV16439,X)
       => cC98(X) ) )).

%----iV16439
fof(axiom_147,axiom,
    ( cowlThing(iV16439) )).

%----iV16439
fof(axiom_148,axiom,
    ( cC100xcomp(iV16439) )).

%----iV16439
fof(axiom_149,axiom,
    ( cTEST(iV16439) )).

fof(axiom_150,axiom,
    ( rR1(iV16439,iV16440) )).

fof(axiom_151,axiom,
    ( rR1(iV16439,iV16442) )).

fof(axiom_152,axiom,
    ( rR1(iV16439,iV16441) )).

%----iV16440
fof(axiom_153,axiom,
    ( cowlThing(iV16440) )).

%----iV16440
fof(axiom_154,axiom,
    ( cC96xcomp(iV16440) )).

%----iV16440
fof(axiom_155,axiom,
    ( ! [X] :
        ( rR1(iV16440,X)
       => cC94xcomp(X) ) )).

%----iV16440
fof(axiom_156,axiom,
    ( ! [X] :
        ( rR1(iV16440,X)
       => cC76(X) ) )).

%----iV16440
fof(axiom_157,axiom,
    ( cC102xcomp(iV16440) )).

%----iV16440
fof(axiom_158,axiom,
    ( cC78xcomp(iV16440) )).

fof(axiom_159,axiom,
    ( rR1(iV16440,iV16463) )).

%----iV16441
fof(axiom_160,axiom,
    ( cowlThing(iV16441) )).

%----iV16442
fof(axiom_161,axiom,
    ( cowlThing(iV16442) )).

%----iV16448
fof(axiom_162,axiom,
    ( cowlThing(iV16448) )).

%----iV16448
fof(axiom_163,axiom,
    ( cTOP(iV16448) )).

%----iV16448
fof(axiom_164,axiom,
    ( cC52xcomp(iV16448) )).

%----iV16448
fof(axiom_165,axiom,
    ( ! [X] :
        ( rR1(iV16448,X)
       => cC50(X) ) )).

%----iV16448
fof(axiom_166,axiom,
    ( ! [X] :
        ( rR1(iV16448,X)
       => cC68(X) ) )).

%----iV16448
fof(axiom_167,axiom,
    ( ! [X] :
        ( rR1(iV16448,X)
       => cC34(X) ) )).

%----iV16448
fof(axiom_168,axiom,
    ( cC36xcomp(iV16448) )).

%----iV16448
fof(axiom_169,axiom,
    ( cC90xcomp(iV16448) )).

%----iV16448
fof(axiom_170,axiom,
    ( ! [X] :
        ( rR1(iV16448,X)
       => cC88(X) ) )).

%----iV16448
fof(axiom_171,axiom,
    ( cC70xcomp(iV16448) )).

fof(axiom_172,axiom,
    ( rR1(iV16448,iV16449) )).

%----iV16449
fof(axiom_173,axiom,
    ( cowlThing(iV16449) )).

%----iV16453
fof(axiom_174,axiom,
    ( cC74xcomp(iV16453) )).

%----iV16453
fof(axiom_175,axiom,
    ( cowlThing(iV16453) )).

%----iV16453
fof(axiom_176,axiom,
    ( ! [X] :
        ( rR1(iV16453,X)
       => cC72xcomp(X) ) )).

%----iV16453
fof(axiom_177,axiom,
    ( cC16xcomp(iV16453) )).

%----iV16453
fof(axiom_178,axiom,
    ( ! [X] :
        ( rR1(iV16453,X)
       => cC56(X) ) )).

%----iV16453
fof(axiom_179,axiom,
    ( ! [X] :
        ( rR1(iV16453,X)
       => cC92xcomp(X) ) )).

%----iV16453
fof(axiom_180,axiom,
    ( cC94xcomp(iV16453) )).

%----iV16453
fof(axiom_181,axiom,
    ( cC58xcomp(iV16453) )).

fof(axiom_182,axiom,
    ( rR1(iV16453,iV16461) )).

%----iV16455
fof(axiom_183,axiom,
    ( ! [X] :
        ( rR1(iV16455,X)
       => cC52xcomp(X) ) )).

%----iV16455
fof(axiom_184,axiom,
    ( cowlThing(iV16455) )).

%----iV16455
fof(axiom_185,axiom,
    ( cC40xcomp(iV16455) )).

%----iV16455
fof(axiom_186,axiom,
    ( ! [X] :
        ( rR1(iV16455,X)
       => cC90xcomp(X) ) )).

%----iV16455
fof(axiom_187,axiom,
    ( cC12xcomp(iV16455) )).

%----iV16455
fof(axiom_188,axiom,
    ( ! [X] :
        ( rR1(iV16455,X)
       => cC38(X) ) )).

%----iV16455
fof(axiom_189,axiom,
    ( cC92xcomp(iV16455) )).

%----iV16455
fof(axiom_190,axiom,
    ( cC54xcomp(iV16455) )).

%----iV16455
fof(axiom_191,axiom,
    ( ! [X] :
        ( rR1(iV16455,X)
       => cC70xcomp(X) ) )).

%----iV16455
fof(axiom_192,axiom,
    ( cC72xcomp(iV16455) )).

fof(axiom_193,axiom,
    ( rR1(iV16455,iV16460) )).

%----iV16457
fof(axiom_194,axiom,
    ( ! [X] :
        ( rR1(iV16457,X)
       => cC68(X) ) )).

%----iV16457
fof(axiom_195,axiom,
    ( cowlThing(iV16457) )).

%----iV16457
fof(axiom_196,axiom,
    ( ! [X] :
        ( rR1(iV16457,X)
       => cC34(X) ) )).

%----iV16457
fof(axiom_197,axiom,
    ( cTOP(iV16457) )).

%----iV16457
fof(axiom_198,axiom,
    ( cC52xcomp(iV16457) )).

%----iV16457
fof(axiom_199,axiom,
    ( cC8xcomp(iV16457) )).

%----iV16457
fof(axiom_200,axiom,
    ( ! [X] :
        ( rR1(iV16457,X)
       => cC88(X) ) )).

%----iV16457
fof(axiom_201,axiom,
    ( cC36xcomp(iV16457) )).

%----iV16457
fof(axiom_202,axiom,
    ( cC90xcomp(iV16457) )).

%----iV16457
fof(axiom_203,axiom,
    ( ! [X] :
        ( rR1(iV16457,X)
       => cC50(X) ) )).

%----iV16457
fof(axiom_204,axiom,
    ( cC70xcomp(iV16457) )).

%----iV16459
fof(axiom_205,axiom,
    ( cowlThing(iV16459) )).

%----iV16459
fof(axiom_206,axiom,
    ( cC14xcomp(iV16459) )).

%----iV16459
fof(axiom_207,axiom,
    ( cC8xcomp(iV16459) )).

%----iV16459
fof(axiom_208,axiom,
    ( cC10xcomp(iV16459) )).

%----iV16459
fof(axiom_209,axiom,
    ( cC30xcomp(iV16459) )).

%----iV16459
fof(axiom_210,axiom,
    ( cC84xcomp(iV16459) )).

%----iV16459
fof(axiom_211,axiom,
    ( cC12(iV16459) )).

%----iV16459
fof(axiom_212,axiom,
    ( cC46xcomp(iV16459) )).

%----iV16459
fof(axiom_213,axiom,
    ( cC64xcomp(iV16459) )).

%----iV16459
fof(axiom_214,axiom,
    ( cC4(iV16459) )).

%----iV16459
fof(axiom_215,axiom,
    ( cC86xcomp(iV16459) )).

%----iV16459
fof(axiom_216,axiom,
    ( cC32xcomp(iV16459) )).

%----iV16459
fof(axiom_217,axiom,
    ( cC48xcomp(iV16459) )).

%----iV16459
fof(axiom_218,axiom,
    ( cC18xcomp(iV16459) )).

%----iV16459
fof(axiom_219,axiom,
    ( cC2xcomp(iV16459) )).

%----iV16459
fof(axiom_220,axiom,
    ( cC6xcomp(iV16459) )).

%----iV16459
fof(axiom_221,axiom,
    ( cC66xcomp(iV16459) )).

%----iV16460
fof(axiom_222,axiom,
    ( ! [X] :
        ( rR1(iV16460,X)
       => cC68(X) ) )).

%----iV16460
fof(axiom_223,axiom,
    ( cowlThing(iV16460) )).

%----iV16460
fof(axiom_224,axiom,
    ( ! [X] :
        ( rR1(iV16460,X)
       => cC34(X) ) )).

%----iV16460
fof(axiom_225,axiom,
    ( cTOP(iV16460) )).

%----iV16460
fof(axiom_226,axiom,
    ( cC52xcomp(iV16460) )).

%----iV16460
fof(axiom_227,axiom,
    ( cC8xcomp(iV16460) )).

%----iV16460
fof(axiom_228,axiom,
    ( cC36xcomp(iV16460) )).

%----iV16460
fof(axiom_229,axiom,
    ( ! [X] :
        ( rR1(iV16460,X)
       => cC50(X) ) )).

%----iV16460
fof(axiom_230,axiom,
    ( ! [X] :
        ( rR1(iV16460,X)
       => cC88(X) ) )).

%----iV16460
fof(axiom_231,axiom,
    ( cC90xcomp(iV16460) )).

%----iV16460
fof(axiom_232,axiom,
    ( cC70xcomp(iV16460) )).

%----iV16461
fof(axiom_233,axiom,
    ( cowlThing(iV16461) )).

%----iV16461
fof(axiom_234,axiom,
    ( cC40xcomp(iV16461) )).

%----iV16461
fof(axiom_235,axiom,
    ( ! [X] :
        ( rR1(iV16461,X)
       => cC90xcomp(X) ) )).

%----iV16461
fof(axiom_236,axiom,
    ( ! [X] :
        ( rR1(iV16461,X)
       => cC70xcomp(X) ) )).

%----iV16461
fof(axiom_237,axiom,
    ( cC12xcomp(iV16461) )).

%----iV16461
fof(axiom_238,axiom,
    ( ! [X] :
        ( rR1(iV16461,X)
       => cC52xcomp(X) ) )).

%----iV16461
fof(axiom_239,axiom,
    ( cC92xcomp(iV16461) )).

%----iV16461
fof(axiom_240,axiom,
    ( cC54xcomp(iV16461) )).

%----iV16461
fof(axiom_241,axiom,
    ( ! [X] :
        ( rR1(iV16461,X)
       => cC38(X) ) )).

%----iV16461
fof(axiom_242,axiom,
    ( cC72xcomp(iV16461) )).

fof(axiom_243,axiom,
    ( rR1(iV16461,iV16462) )).

%----iV16462
fof(axiom_244,axiom,
    ( ! [X] :
        ( rR1(iV16462,X)
       => cC50(X) ) )).

%----iV16462
fof(axiom_245,axiom,
    ( ! [X] :
        ( rR1(iV16462,X)
       => cC68(X) ) )).

%----iV16462
fof(axiom_246,axiom,
    ( cowlThing(iV16462) )).

%----iV16462
fof(axiom_247,axiom,
    ( cTOP(iV16462) )).

%----iV16462
fof(axiom_248,axiom,
    ( cC52xcomp(iV16462) )).

%----iV16462
fof(axiom_249,axiom,
    ( cC8xcomp(iV16462) )).

%----iV16462
fof(axiom_250,axiom,
    ( ! [X] :
        ( rR1(iV16462,X)
       => cC34(X) ) )).

%----iV16462
fof(axiom_251,axiom,
    ( ! [X] :
        ( rR1(iV16462,X)
       => cC88(X) ) )).

%----iV16462
fof(axiom_252,axiom,
    ( cC36xcomp(iV16462) )).

%----iV16462
fof(axiom_253,axiom,
    ( cC90xcomp(iV16462) )).

%----iV16462
fof(axiom_254,axiom,
    ( cC70xcomp(iV16462) )).

%----iV16463
fof(axiom_255,axiom,
    ( cC74xcomp(iV16463) )).

%----iV16463
fof(axiom_256,axiom,
    ( cowlThing(iV16463) )).

%----iV16463
fof(axiom_257,axiom,
    ( cC16xcomp(iV16463) )).

%----iV16463
fof(axiom_258,axiom,
    ( ! [X] :
        ( rR1(iV16463,X)
       => cC92xcomp(X) ) )).

%----iV16463
fof(axiom_259,axiom,
    ( ! [X] :
        ( rR1(iV16463,X)
       => cC72xcomp(X) ) )).

%----iV16463
fof(axiom_260,axiom,
    ( cC94xcomp(iV16463) )).

%----iV16463
fof(axiom_261,axiom,
    ( ! [X] :
        ( rR1(iV16463,X)
       => cC56(X) ) )).

%----iV16463
fof(axiom_262,axiom,
    ( cC58xcomp(iV16463) )).

fof(axiom_263,axiom,
    ( rR1(iV16463,iV16464) )).

%----iV16464
fof(axiom_264,axiom,
    ( cowlThing(iV16464) )).

%----iV16464
fof(axiom_265,axiom,
    ( ! [X] :
        ( rR1(iV16464,X)
       => cC38(X) ) )).

%----iV16464
fof(axiom_266,axiom,
    ( cC40xcomp(iV16464) )).

%----iV16464
fof(axiom_267,axiom,
    ( cC12xcomp(iV16464) )).

%----iV16464
fof(axiom_268,axiom,
    ( ! [X] :
        ( rR1(iV16464,X)
       => cC52xcomp(X) ) )).

%----iV16464
fof(axiom_269,axiom,
    ( cC92xcomp(iV16464) )).

%----iV16464
fof(axiom_270,axiom,
    ( cC54xcomp(iV16464) )).

%----iV16464
fof(axiom_271,axiom,
    ( ! [X] :
        ( rR1(iV16464,X)
       => cC90xcomp(X) ) )).

%----iV16464
fof(axiom_272,axiom,
    ( ! [X] :
        ( rR1(iV16464,X)
       => cC70xcomp(X) ) )).

%----iV16464
fof(axiom_273,axiom,
    ( cC72xcomp(iV16464) )).

fof(axiom_274,axiom,
    ( rR1(iV16464,iV16465) )).

%----iV16465
fof(axiom_275,axiom,
    ( ! [X] :
        ( rR1(iV16465,X)
       => cC34(X) ) )).

%----iV16465
fof(axiom_276,axiom,
    ( cowlThing(iV16465) )).

%----iV16465
fof(axiom_277,axiom,
    ( cTOP(iV16465) )).

%----iV16465
fof(axiom_278,axiom,
    ( ! [X] :
        ( rR1(iV16465,X)
       => cC88(X) ) )).

%----iV16465
fof(axiom_279,axiom,
    ( cC52xcomp(iV16465) )).

%----iV16465
fof(axiom_280,axiom,
    ( cC8xcomp(iV16465) )).

%----iV16465
fof(axiom_281,axiom,
    ( ! [X] :
        ( rR1(iV16465,X)
       => cC68(X) ) )).

%----iV16465
fof(axiom_282,axiom,
    ( cC36xcomp(iV16465) )).

%----iV16465
fof(axiom_283,axiom,
    ( cC90xcomp(iV16465) )).

%----iV16465
fof(axiom_284,axiom,
    ( ! [X] :
        ( rR1(iV16465,X)
       => cC50(X) ) )).

%----iV16465
fof(axiom_285,axiom,
    ( cC70xcomp(iV16465) )).

%----Thing and Nothing
%----String and Integer disjoint
%----iV16439
%----iV16439
%----iV16439
%----iV16439
%----iV16439
%----iV16439
%----iV16440
%----iV16440
%----iV16440
%----iV16440
%----iV16448
%----iV16448
%----iV16453
%----iV16453
%----iV16453
%----iV16453
%----iV16455
%----iV16455
%----iV16455
%----iV16455
%----iV16457
%----iV16457
%----iV16459
%----iV16459
%----iV16459
%----iV16459
%----iV16459
%----iV16460
%----iV16460
%----iV16461
%----iV16461
%----iV16461
%----iV16461
%----iV16462
%----iV16462
%----iV16463
%----iV16463
%----iV16463
%----iV16463
%----iV16464
%----iV16464
%----iV16464
%----iV16464
%----iV16465
%----iV16465
fof(the_axiom,conjecture,
    ( ! [X] :
        ( cowlThing(X)
        & ~ cowlNothing(X) )
    & ! [X] :
        ( xsd_string(X)
      <=> ~ xsd_integer(X) )
    & cC130(iV16439)
    & cC108(iV16439)
    & cC104(iV16439)
    & cC106(iV16439)
    & cC28(iV16439)
    & cowlThing(iV16439)
    & cC98(iV16440)
    & cC80(iV16440)
    & cC82(iV16440)
    & cowlThing(iV16440)
    & cC38(iV16448)
    & cowlThing(iV16448)
    & cC76(iV16453)
    & cC62(iV16453)
    & cowlThing(iV16453)
    & cC60(iV16453)
    & cC56(iV16455)
    & cC44(iV16455)
    & cC42(iV16455)
    & cowlThing(iV16455)
    & cC38(iV16457)
    & cowlThing(iV16457)
    & cC50(iV16459)
    & cC88(iV16459)
    & cC34(iV16459)
    & cC68(iV16459)
    & cowlThing(iV16459)
    & cC38(iV16460)
    & cowlThing(iV16460)
    & cC42(iV16461)
    & cC56(iV16461)
    & cC44(iV16461)
    & cowlThing(iV16461)
    & cC38(iV16462)
    & cowlThing(iV16462)
    & cC76(iV16463)
    & cC62(iV16463)
    & cowlThing(iV16463)
    & cC60(iV16463)
    & cC56(iV16464)
    & cC42(iV16464)
    & cC44(iV16464)
    & cowlThing(iV16464)
    & cC38(iV16465)
    & cowlThing(iV16465) )).

%------------------------------------------------------------------------------
