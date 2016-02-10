%------------------------------------------------------------------------------
% File     : KRS154+1 : TPTP v6.1.0. Released v3.1.0.
% Domain   : Knowledge Representation (Semantic Web)
% Problem  : DL Test: k_branch ABox test from DL98 systems comparison
% Version  : Especial.
% English  :

% Refs     : [Bec03] Bechhofer (2003), Email to G. Sutcliffe
%          : [TR+04] Tsarkov et al. (2004), Using Vampire to Reason with OW
% Source   : [Bec03]
% Names    : positive_description-logic-Manifest661 [Bec03]

% Status   : Theorem
% Rating   : 0.00 v6.1.0, 0.04 v6.0.0, 0.25 v5.5.0, 0.12 v5.4.0, 0.13 v5.2.0, 0.07 v5.0.0, 0.05 v4.1.0, 0.11 v4.0.0, 0.10 v3.7.0, 0.33 v3.5.0, 0.12 v3.4.0, 0.17 v3.3.0, 0.11 v3.2.0, 0.22 v3.1.0
% Syntax   : Number of formulae    :  170 (  20 unit)
%            Number of atoms       :  397 (   0 equality)
%            Maximal formula depth :   11 (   4 average)
%            Number of connectives :  270 (  43 ~  ;   0  |;  78  &)
%                                         ( 146 <=>;   3 =>;   0 <=)
%                                         (   0 <~>;   0 ~|;   0 ~&)
%            Number of predicates  :  154 (   0 propositional; 1-2 arity)
%            Number of functors    :    1 (   1 constant; 0-0 arity)
%            Number of variables   :  242 (   0 singleton; 151 !;  91 ?)
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
      <=> ~ ( ? [Y] : ra_Px16(X,Y) ) ) )).

%----Equality cC10xcomp
fof(axiom_3,axiom,
    ( ! [X] :
        ( cC10xcomp(X)
      <=> ? [Y0] : ra_Px16(X,Y0) ) )).

%----Equality cC100
fof(axiom_4,axiom,
    ( ! [X] :
        ( cC100(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & cC98(Y) ) ) )).

%----Equality cC100
fof(axiom_5,axiom,
    ( ! [X] :
        ( cC100(X)
      <=> ~ ( ? [Y] : ra_Px49(X,Y) ) ) )).

%----Equality cC100xcomp
fof(axiom_6,axiom,
    ( ! [X] :
        ( cC100xcomp(X)
      <=> ? [Y0] : ra_Px49(X,Y0) ) )).

%----Equality cC102
fof(axiom_7,axiom,
    ( ! [X] :
        ( cC102(X)
      <=> ? [Y0] : ra_Px35(X,Y0) ) )).

%----Equality cC102
fof(axiom_8,axiom,
    ( ! [X] :
        ( cC102(X)
      <=> ( cC34(X)
          & cC100(X) ) ) )).

%----Equality cC102xcomp
fof(axiom_9,axiom,
    ( ! [X] :
        ( cC102xcomp(X)
      <=> ~ ( ? [Y] : ra_Px35(X,Y) ) ) )).

%----Equality cC104
fof(axiom_10,axiom,
    ( ! [X] :
        ( cC104(X)
      <=> ( cC4(X)
          & cC34(X) ) ) )).

%----Equality cC106
fof(axiom_11,axiom,
    ( ! [X] :
        ( cC106(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & cC104(Y) ) ) )).

%----Equality cC108
fof(axiom_12,axiom,
    ( ! [X] :
        ( cC108(X)
      <=> ( cC34xcomp(X)
          & cC106(X) ) ) )).

%----Equality cC108
fof(axiom_13,axiom,
    ( ! [X] :
        ( cC108(X)
      <=> ? [Y0] : ra_Px36(X,Y0) ) )).

%----Equality cC108xcomp
fof(axiom_14,axiom,
    ( ! [X] :
        ( cC108xcomp(X)
      <=> ~ ( ? [Y] : ra_Px36(X,Y) ) ) )).

%----Equality cC110
fof(axiom_15,axiom,
    ( ! [X] :
        ( cC110(X)
      <=> ( cC102xcomp(X)
          & cC108xcomp(X) ) ) )).

%----Equality cC110
fof(axiom_16,axiom,
    ( ! [X] :
        ( cC110(X)
      <=> ~ ( ? [Y] : ra_Px37(X,Y) ) ) )).

%----Equality cC110xcomp
fof(axiom_17,axiom,
    ( ! [X] :
        ( cC110xcomp(X)
      <=> ? [Y0] : ra_Px37(X,Y0) ) )).

%----Equality cC112
fof(axiom_18,axiom,
    ( ! [X] :
        ( cC112(X)
      <=> ( cC4(X)
          & cC110xcomp(X) ) ) )).

%----Equality cC112
fof(axiom_19,axiom,
    ( ! [X] :
        ( cC112(X)
      <=> ? [Y0] : ra_Px39(X,Y0) ) )).

%----Equality cC112xcomp
fof(axiom_20,axiom,
    ( ! [X] :
        ( cC112xcomp(X)
      <=> ~ ( ? [Y] : ra_Px39(X,Y) ) ) )).

%----Equality cC114
fof(axiom_21,axiom,
    ( ! [X] :
        ( cC114(X)
      <=> ( cC112xcomp(X)
          & cC96xcomp(X) ) ) )).

%----Equality cC116
fof(axiom_22,axiom,
    ( ! [X] :
        ( cC116(X)
      <=> ( cC114(X)
          & cC80(X) ) ) )).

%----Equality cC118
fof(axiom_23,axiom,
    ( ! [X] :
        ( cC118(X)
      <=> ( cC4(X)
          & cC10xcomp(X) ) ) )).

%----Equality cC12
fof(axiom_24,axiom,
    ( ! [X] :
        ( cC12(X)
      <=> ( cC10(X)
          & cC4xcomp(X) ) ) )).

%----Equality cC12
fof(axiom_25,axiom,
    ( ! [X] :
        ( cC12(X)
      <=> ? [Y0] : ra_Px3(X,Y0) ) )).

%----Equality cC12xcomp
fof(axiom_26,axiom,
    ( ! [X] :
        ( cC12xcomp(X)
      <=> ~ ( ? [Y] : ra_Px3(X,Y) ) ) )).

%----Equality cC120
fof(axiom_27,axiom,
    ( ! [X] :
        ( cC120(X)
      <=> ( cC118(X)
          & cC34(X) ) ) )).

%----Equality cC122
fof(axiom_28,axiom,
    ( ! [X] :
        ( cC122(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & cC120(Y) ) ) )).

%----Equality cC124
fof(axiom_29,axiom,
    ( ! [X] :
        ( cC124(X)
      <=> ( cC4(X)
          & cC10xcomp(X) ) ) )).

%----Equality cC126
fof(axiom_30,axiom,
    ( ! [X] :
        ( cC126(X)
      <=> ( cC34xcomp(X)
          & cC124(X) ) ) )).

%----Equality cC128
fof(axiom_31,axiom,
    ( ! [X] :
        ( cC128(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & cC126(Y) ) ) )).

%----Equality cC130
fof(axiom_32,axiom,
    ( ! [X] :
        ( cC130(X)
      <=> ( cC128(X)
          & cC122(X) ) ) )).

%----Equality cC130
fof(axiom_33,axiom,
    ( ! [X] :
        ( cC130(X)
      <=> ? [Y0] : ra_Px44(X,Y0) ) )).

%----Equality cC130xcomp
fof(axiom_34,axiom,
    ( ! [X] :
        ( cC130xcomp(X)
      <=> ~ ( ? [Y] : ra_Px44(X,Y) ) ) )).

%----Equality cC132
fof(axiom_35,axiom,
    ( ! [X] :
        ( cC132(X)
      <=> ( cC2(X)
          & cC4xcomp(X) ) ) )).

%----Equality cC132
fof(axiom_36,axiom,
    ( ! [X] :
        ( cC132(X)
      <=> ? [Y0] : ra_Px48(X,Y0) ) )).

%----Equality cC132xcomp
fof(axiom_37,axiom,
    ( ! [X] :
        ( cC132xcomp(X)
      <=> ~ ( ? [Y] : ra_Px48(X,Y) ) ) )).

%----Equality cC134
fof(axiom_38,axiom,
    ( ! [X] :
        ( cC134(X)
      <=> ( cC130xcomp(X)
          & cC132(X) ) ) )).

%----Equality cC134
fof(axiom_39,axiom,
    ( ! [X] :
        ( cC134(X)
      <=> ? [Y0] : ra_Px45(X,Y0) ) )).

%----Equality cC134xcomp
fof(axiom_40,axiom,
    ( ! [X] :
        ( cC134xcomp(X)
      <=> ~ ( ? [Y] : ra_Px45(X,Y) ) ) )).

%----Equality cC136
fof(axiom_41,axiom,
    ( ! [X] :
        ( cC136(X)
      <=> ~ ( ? [Y] : ra_Px46(X,Y) ) ) )).

%----Equality cC136
fof(axiom_42,axiom,
    ( ! [X] :
        ( cC136(X)
      <=> ( cC134xcomp(X)
          & cC116(X) ) ) )).

%----Equality cC136xcomp
fof(axiom_43,axiom,
    ( ! [X] :
        ( cC136xcomp(X)
      <=> ? [Y0] : ra_Px46(X,Y0) ) )).

%----Equality cC138
fof(axiom_44,axiom,
    ( ! [X] :
        ( cC138(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & cC136xcomp(Y) ) ) )).

%----Equality cC138
fof(axiom_45,axiom,
    ( ! [X] :
        ( cC138(X)
      <=> ? [Y0] : ra_Px47(X,Y0) ) )).

%----Equality cC138xcomp
fof(axiom_46,axiom,
    ( ! [X] :
        ( cC138xcomp(X)
      <=> ~ ( ? [Y] : ra_Px47(X,Y) ) ) )).

%----Equality cC14
fof(axiom_47,axiom,
    ( ! [X] :
        ( cC14(X)
      <=> ( cC12xcomp(X)
          & cC8xcomp(X) ) ) )).

%----Equality cC140
fof(axiom_48,axiom,
    ( ! [X] :
        ( cC140(X)
      <=> ( cC74(X)
          & cC138xcomp(X) ) ) )).

%----Equality cC16
fof(axiom_49,axiom,
    ( ! [X] :
        ( cC16(X)
      <=> ~ ( ? [Y] : ra_Px4(X,Y) ) ) )).

%----Equality cC16xcomp
fof(axiom_50,axiom,
    ( ! [X] :
        ( cC16xcomp(X)
      <=> ? [Y0] : ra_Px4(X,Y0) ) )).

%----Equality cC18
fof(axiom_51,axiom,
    ( ! [X] :
        ( cC18(X)
      <=> ( cC2(X)
          & cC16xcomp(X) ) ) )).

%----Equality cC18
fof(axiom_52,axiom,
    ( ! [X] :
        ( cC18(X)
      <=> ? [Y0] : ra_Px56(X,Y0) ) )).

%----Equality cC18xcomp
fof(axiom_53,axiom,
    ( ! [X] :
        ( cC18xcomp(X)
      <=> ~ ( ? [Y] : ra_Px56(X,Y) ) ) )).

%----Equality cC2
fof(axiom_54,axiom,
    ( ! [X] :
        ( cC2(X)
      <=> ~ ( ? [Y] : ra_Px22(X,Y) ) ) )).

%----Equality cC2xcomp
fof(axiom_55,axiom,
    ( ! [X] :
        ( cC2xcomp(X)
      <=> ? [Y0] : ra_Px22(X,Y0) ) )).

%----Equality cC20
fof(axiom_56,axiom,
    ( ! [X] :
        ( cC20(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & cC18(Y) ) ) )).

%----Equality cC22
fof(axiom_57,axiom,
    ( ! [X] :
        ( cC22(X)
      <=> ( cC16(X)
          & cC20(X) ) ) )).

%----Equality cC22
fof(axiom_58,axiom,
    ( ! [X] :
        ( cC22(X)
      <=> ? [Y0] : ra_Px6(X,Y0) ) )).

%----Equality cC22xcomp
fof(axiom_59,axiom,
    ( ! [X] :
        ( cC22xcomp(X)
      <=> ~ ( ? [Y] : ra_Px6(X,Y) ) ) )).

%----Equality cC24
fof(axiom_60,axiom,
    ( ! [X] :
        ( cC24(X)
      <=> ( cC16(X)
          & cC2(X) ) ) )).

%----Equality cC26
fof(axiom_61,axiom,
    ( ! [X] :
        ( cC26(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & cC24(Y) ) ) )).

%----Equality cC28
fof(axiom_62,axiom,
    ( ! [X] :
        ( cC28(X)
      <=> ~ ( ? [Y] : ra_Px7(X,Y) ) ) )).

%----Equality cC28
fof(axiom_63,axiom,
    ( ! [X] :
        ( cC28(X)
      <=> ( cC26(X)
          & cC16xcomp(X) ) ) )).

%----Equality cC28xcomp
fof(axiom_64,axiom,
    ( ! [X] :
        ( cC28xcomp(X)
      <=> ? [Y0] : ra_Px7(X,Y0) ) )).

%----Equality cC30
fof(axiom_65,axiom,
    ( ! [X] :
        ( cC30(X)
      <=> ? [Y0] : ra_Px8(X,Y0) ) )).

%----Equality cC30
fof(axiom_66,axiom,
    ( ! [X] :
        ( cC30(X)
      <=> ( cC22xcomp(X)
          & cC28xcomp(X) ) ) )).

%----Equality cC30xcomp
fof(axiom_67,axiom,
    ( ! [X] :
        ( cC30xcomp(X)
      <=> ~ ( ? [Y] : ra_Px8(X,Y) ) ) )).

%----Equality cC32
fof(axiom_68,axiom,
    ( ! [X] :
        ( cC32(X)
      <=> ( cC2(X)
          & cC30xcomp(X) ) ) )).

%----Equality cC32
fof(axiom_69,axiom,
    ( ! [X] :
        ( cC32(X)
      <=> ? [Y0] : ra_Px14(X,Y0) ) )).

%----Equality cC32xcomp
fof(axiom_70,axiom,
    ( ! [X] :
        ( cC32xcomp(X)
      <=> ~ ( ? [Y] : ra_Px14(X,Y) ) ) )).

%----Equality cC34
fof(axiom_71,axiom,
    ( ! [X] :
        ( cC34(X)
      <=> ? [Y0] : ra_Px9(X,Y0) ) )).

%----Equality cC34xcomp
fof(axiom_72,axiom,
    ( ! [X] :
        ( cC34xcomp(X)
      <=> ~ ( ? [Y] : ra_Px9(X,Y) ) ) )).

%----Equality cC36
fof(axiom_73,axiom,
    ( ! [X] :
        ( cC36(X)
      <=> ( cC34xcomp(X)
          & cC4(X) ) ) )).

%----Equality cC38
fof(axiom_74,axiom,
    ( ! [X] :
        ( cC38(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & cC36(Y) ) ) )).

%----Equality cC4
fof(axiom_75,axiom,
    ( ! [X] :
        ( cC4(X)
      <=> ~ ( ? [Y] : ra_Px1(X,Y) ) ) )).

%----Equality cC4xcomp
fof(axiom_76,axiom,
    ( ! [X] :
        ( cC4xcomp(X)
      <=> ? [Y0] : ra_Px1(X,Y0) ) )).

%----Equality cC40
fof(axiom_77,axiom,
    ( ! [X] :
        ( cC40(X)
      <=> ? [Y0] : ra_Px11(X,Y0) ) )).

%----Equality cC40
fof(axiom_78,axiom,
    ( ! [X] :
        ( cC40(X)
      <=> ( cC34(X)
          & cC38(X) ) ) )).

%----Equality cC40xcomp
fof(axiom_79,axiom,
    ( ! [X] :
        ( cC40xcomp(X)
      <=> ~ ( ? [Y] : ra_Px11(X,Y) ) ) )).

%----Equality cC42
fof(axiom_80,axiom,
    ( ! [X] :
        ( cC42(X)
      <=> ( cC4(X)
          & cC34(X) ) ) )).

%----Equality cC44
fof(axiom_81,axiom,
    ( ! [X] :
        ( cC44(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & cC42(Y) ) ) )).

%----Equality cC46
fof(axiom_82,axiom,
    ( ! [X] :
        ( cC46(X)
      <=> ? [Y0] : ra_Px12(X,Y0) ) )).

%----Equality cC46
fof(axiom_83,axiom,
    ( ! [X] :
        ( cC46(X)
      <=> ( cC34xcomp(X)
          & cC44(X) ) ) )).

%----Equality cC46xcomp
fof(axiom_84,axiom,
    ( ! [X] :
        ( cC46xcomp(X)
      <=> ~ ( ? [Y] : ra_Px12(X,Y) ) ) )).

%----Equality cC48
fof(axiom_85,axiom,
    ( ! [X] :
        ( cC48(X)
      <=> ~ ( ? [Y] : ra_Px13(X,Y) ) ) )).

%----Equality cC48
fof(axiom_86,axiom,
    ( ! [X] :
        ( cC48(X)
      <=> ( cC40xcomp(X)
          & cC46xcomp(X) ) ) )).

%----Equality cC48xcomp
fof(axiom_87,axiom,
    ( ! [X] :
        ( cC48xcomp(X)
      <=> ? [Y0] : ra_Px13(X,Y0) ) )).

%----Equality cC50
fof(axiom_88,axiom,
    ( ! [X] :
        ( cC50(X)
      <=> ? [Y0] : ra_Px15(X,Y0) ) )).

%----Equality cC50
fof(axiom_89,axiom,
    ( ! [X] :
        ( cC50(X)
      <=> ( cC4(X)
          & cC48xcomp(X) ) ) )).

%----Equality cC50xcomp
fof(axiom_90,axiom,
    ( ! [X] :
        ( cC50xcomp(X)
      <=> ~ ( ? [Y] : ra_Px15(X,Y) ) ) )).

%----Equality cC52
fof(axiom_91,axiom,
    ( ! [X] :
        ( cC52(X)
      <=> ( cC32xcomp(X)
          & cC50xcomp(X) ) ) )).

%----Equality cC54
fof(axiom_92,axiom,
    ( ! [X] :
        ( cC54(X)
      <=> ( cC14(X)
          & cC52(X) ) ) )).

%----Equality cC56
fof(axiom_93,axiom,
    ( ! [X] :
        ( cC56(X)
      <=> ( cC4(X)
          & cC10xcomp(X) ) ) )).

%----Equality cC58
fof(axiom_94,axiom,
    ( ! [X] :
        ( cC58(X)
      <=> ( cC34(X)
          & cC56(X) ) ) )).

%----Equality cC6
fof(axiom_95,axiom,
    ( ! [X] :
        ( cC6(X)
      <=> ( cC2(X)
          & cC4xcomp(X) ) ) )).

%----Equality cC60
fof(axiom_96,axiom,
    ( ! [X] :
        ( cC60(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & cC58(Y) ) ) )).

%----Equality cC62
fof(axiom_97,axiom,
    ( ! [X] :
        ( cC62(X)
      <=> ( cC4(X)
          & cC10xcomp(X) ) ) )).

%----Equality cC64
fof(axiom_98,axiom,
    ( ! [X] :
        ( cC64(X)
      <=> ( cC34xcomp(X)
          & cC62(X) ) ) )).

%----Equality cC66
fof(axiom_99,axiom,
    ( ! [X] :
        ( cC66(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & cC64(Y) ) ) )).

%----Equality cC68
fof(axiom_100,axiom,
    ( ! [X] :
        ( cC68(X)
      <=> ( cC66(X)
          & cC60(X) ) ) )).

%----Equality cC68
fof(axiom_101,axiom,
    ( ! [X] :
        ( cC68(X)
      <=> ? [Y0] : ra_Px20(X,Y0) ) )).

%----Equality cC68xcomp
fof(axiom_102,axiom,
    ( ! [X] :
        ( cC68xcomp(X)
      <=> ~ ( ? [Y] : ra_Px20(X,Y) ) ) )).

%----Equality cC70
fof(axiom_103,axiom,
    ( ! [X] :
        ( cC70(X)
      <=> ( cC2(X)
          & cC4xcomp(X) ) ) )).

%----Equality cC72
fof(axiom_104,axiom,
    ( ! [X] :
        ( cC72(X)
      <=> ? [Y0] : ra_Px21(X,Y0) ) )).

%----Equality cC72
fof(axiom_105,axiom,
    ( ! [X] :
        ( cC72(X)
      <=> ( cC70(X)
          & cC68xcomp(X) ) ) )).

%----Equality cC72xcomp
fof(axiom_106,axiom,
    ( ! [X] :
        ( cC72xcomp(X)
      <=> ~ ( ? [Y] : ra_Px21(X,Y) ) ) )).

%----Equality cC74
fof(axiom_107,axiom,
    ( ! [X] :
        ( cC74(X)
      <=> ( cC54(X)
          & cC72xcomp(X) ) ) )).

%----Equality cC76
fof(axiom_108,axiom,
    ( ! [X] :
        ( cC76(X)
      <=> ? [Y0] : ra_Px24(X,Y0) ) )).

%----Equality cC76
fof(axiom_109,axiom,
    ( ! [X] :
        ( cC76(X)
      <=> ( cC4(X)
          & cC2xcomp(X) ) ) )).

%----Equality cC76xcomp
fof(axiom_110,axiom,
    ( ! [X] :
        ( cC76xcomp(X)
      <=> ~ ( ? [Y] : ra_Px24(X,Y) ) ) )).

%----Equality cC78
fof(axiom_111,axiom,
    ( ! [X] :
        ( cC78(X)
      <=> ( cC10(X)
          & cC4xcomp(X) ) ) )).

%----Equality cC78
fof(axiom_112,axiom,
    ( ! [X] :
        ( cC78(X)
      <=> ~ ( ? [Y] : ra_Px25(X,Y) ) ) )).

%----Equality cC78xcomp
fof(axiom_113,axiom,
    ( ! [X] :
        ( cC78xcomp(X)
      <=> ? [Y0] : ra_Px25(X,Y0) ) )).

%----Equality cC8
fof(axiom_114,axiom,
    ( ! [X] :
        ( cC8(X)
      <=> ? [Y0] : ra_Px2(X,Y0) ) )).

%----Equality cC8
fof(axiom_115,axiom,
    ( ! [X] :
        ( cC8(X)
      <=> ( cC4(X)
          & cC2xcomp(X) ) ) )).

%----Equality cC8xcomp
fof(axiom_116,axiom,
    ( ! [X] :
        ( cC8xcomp(X)
      <=> ~ ( ? [Y] : ra_Px2(X,Y) ) ) )).

%----Equality cC80
fof(axiom_117,axiom,
    ( ! [X] :
        ( cC80(X)
      <=> ( cC78xcomp(X)
          & cC76xcomp(X) ) ) )).

%----Equality cC82
fof(axiom_118,axiom,
    ( ! [X] :
        ( cC82(X)
      <=> ? [Y0] : ra_Px65(X,Y0) ) )).

%----Equality cC82
fof(axiom_119,axiom,
    ( ! [X] :
        ( cC82(X)
      <=> ( cC2(X)
          & cC16xcomp(X) ) ) )).

%----Equality cC82xcomp
fof(axiom_120,axiom,
    ( ! [X] :
        ( cC82xcomp(X)
      <=> ~ ( ? [Y] : ra_Px65(X,Y) ) ) )).

%----Equality cC84
fof(axiom_121,axiom,
    ( ! [X] :
        ( cC84(X)
      <=> ? [Y0] : ra_Px53(X,Y0) ) )).

%----Equality cC84
fof(axiom_122,axiom,
    ( ! [X] :
        ( cC84(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & cC82(Y) ) ) )).

%----Equality cC84xcomp
fof(axiom_123,axiom,
    ( ! [X] :
        ( cC84xcomp(X)
      <=> ~ ( ? [Y] : ra_Px53(X,Y) ) ) )).

%----Equality cC86
fof(axiom_124,axiom,
    ( ! [X] :
        ( cC86(X)
      <=> ( cC16(X)
          & cC84(X) ) ) )).

%----Equality cC86
fof(axiom_125,axiom,
    ( ! [X] :
        ( cC86(X)
      <=> ~ ( ? [Y] : ra_Px28(X,Y) ) ) )).

%----Equality cC86xcomp
fof(axiom_126,axiom,
    ( ! [X] :
        ( cC86xcomp(X)
      <=> ? [Y0] : ra_Px28(X,Y0) ) )).

%----Equality cC88
fof(axiom_127,axiom,
    ( ! [X] :
        ( cC88(X)
      <=> ( cC16(X)
          & cC2(X) ) ) )).

%----Equality cC88
fof(axiom_128,axiom,
    ( ! [X] :
        ( cC88(X)
      <=> ~ ( ? [Y] : ra_Px64(X,Y) ) ) )).

%----Equality cC88xcomp
fof(axiom_129,axiom,
    ( ! [X] :
        ( cC88xcomp(X)
      <=> ? [Y0] : ra_Px64(X,Y0) ) )).

%----Equality cC90
fof(axiom_130,axiom,
    ( ! [X] :
        ( cC90(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & cC88(Y) ) ) )).

%----Equality cC90
fof(axiom_131,axiom,
    ( ! [X] :
        ( cC90(X)
      <=> ~ ( ? [Y] : ra_Px52(X,Y) ) ) )).

%----Equality cC90xcomp
fof(axiom_132,axiom,
    ( ! [X] :
        ( cC90xcomp(X)
      <=> ? [Y0] : ra_Px52(X,Y0) ) )).

%----Equality cC92
fof(axiom_133,axiom,
    ( ! [X] :
        ( cC92(X)
      <=> ? [Y0] : ra_Px29(X,Y0) ) )).

%----Equality cC92
fof(axiom_134,axiom,
    ( ! [X] :
        ( cC92(X)
      <=> ( cC90(X)
          & cC16xcomp(X) ) ) )).

%----Equality cC92xcomp
fof(axiom_135,axiom,
    ( ! [X] :
        ( cC92xcomp(X)
      <=> ~ ( ? [Y] : ra_Px29(X,Y) ) ) )).

%----Equality cC94
fof(axiom_136,axiom,
    ( ! [X] :
        ( cC94(X)
      <=> ( cC86xcomp(X)
          & cC92xcomp(X) ) ) )).

%----Equality cC94
fof(axiom_137,axiom,
    ( ! [X] :
        ( cC94(X)
      <=> ? [Y0] : ra_Px30(X,Y0) ) )).

%----Equality cC94xcomp
fof(axiom_138,axiom,
    ( ! [X] :
        ( cC94xcomp(X)
      <=> ~ ( ? [Y] : ra_Px30(X,Y) ) ) )).

%----Equality cC96
fof(axiom_139,axiom,
    ( ! [X] :
        ( cC96(X)
      <=> ? [Y0] : ra_Px38(X,Y0) ) )).

%----Equality cC96
fof(axiom_140,axiom,
    ( ! [X] :
        ( cC96(X)
      <=> ( cC2(X)
          & cC94xcomp(X) ) ) )).

%----Equality cC96xcomp
fof(axiom_141,axiom,
    ( ! [X] :
        ( cC96xcomp(X)
      <=> ~ ( ? [Y] : ra_Px38(X,Y) ) ) )).

%----Equality cC98
fof(axiom_142,axiom,
    ( ! [X] :
        ( cC98(X)
      <=> ? [Y0] : ra_Px63(X,Y0) ) )).

%----Equality cC98
fof(axiom_143,axiom,
    ( ! [X] :
        ( cC98(X)
      <=> ( cC34xcomp(X)
          & cC4(X) ) ) )).

%----Equality cC98xcomp
fof(axiom_144,axiom,
    ( ! [X] :
        ( cC98xcomp(X)
      <=> ~ ( ? [Y] : ra_Px63(X,Y) ) ) )).

%----Equality cTEST
fof(axiom_145,axiom,
    ( ! [X] :
        ( cTEST(X)
      <=> ( cC6(X)
          & cC140(X) ) ) )).

%----iV822576
fof(axiom_146,axiom,
    ( cC16(iV822576) )).

%----iV822576
fof(axiom_147,axiom,
    ( cC102xcomp(iV822576) )).

%----iV822576
fof(axiom_148,axiom,
    ( cC108xcomp(iV822576) )).

%----iV822576
fof(axiom_149,axiom,
    ( cC4(iV822576) )).

%----iV822576
fof(axiom_150,axiom,
    ( cC18xcomp(iV822576) )).

%----iV822576
fof(axiom_151,axiom,
    ( cC112xcomp(iV822576) )).

%----iV822576
fof(axiom_152,axiom,
    ( cC76xcomp(iV822576) )).

%----iV822576
fof(axiom_153,axiom,
    ( cC96xcomp(iV822576) )).

%----iV822576
fof(axiom_154,axiom,
    ( cC132xcomp(iV822576) )).

%----iV822576
fof(axiom_155,axiom,
    ( cC100xcomp(iV822576) )).

%----iV822576
fof(axiom_156,axiom,
    ( ! [X] :
        ( rR1(iV822576,X)
       => cC98xcomp(X) ) )).

%----iV822576
fof(axiom_157,axiom,
    ( cC90xcomp(iV822576) )).

%----iV822576
fof(axiom_158,axiom,
    ( cC78xcomp(iV822576) )).

%----iV822576
fof(axiom_159,axiom,
    ( ! [X] :
        ( rR1(iV822576,X)
       => cC82xcomp(X) ) )).

%----iV822576
fof(axiom_160,axiom,
    ( cC134xcomp(iV822576) )).

%----iV822576
fof(axiom_161,axiom,
    ( cC86xcomp(iV822576) )).

%----iV822576
fof(axiom_162,axiom,
    ( cC34(iV822576) )).

%----iV822576
fof(axiom_163,axiom,
    ( cC84xcomp(iV822576) )).

%----iV822576
fof(axiom_164,axiom,
    ( ! [X] :
        ( rR1(iV822576,X)
       => cC88xcomp(X) ) )).

%----iV822576
fof(axiom_165,axiom,
    ( cC2(iV822576) )).

%----iV822576
fof(axiom_166,axiom,
    ( cowlThing(iV822576) )).

%----iV822576
fof(axiom_167,axiom,
    ( cC10xcomp(iV822576) )).

%----iV822576
fof(axiom_168,axiom,
    ( cC92xcomp(iV822576) )).

%----Thing and Nothing
%----String and Integer disjoint
%----iV822576
%----iV822576
%----iV822576
%----iV822576
%----iV822576
%----iV822576
%----iV822576
%----iV822576
%----iV822576
fof(the_axiom,conjecture,
    ( ! [X] :
        ( cowlThing(X)
        & ~ cowlNothing(X) )
    & ! [X] :
        ( xsd_string(X)
      <=> ~ xsd_integer(X) )
    & cC58(iV822576)
    & cC116(iV822576)
    & cC114(iV822576)
    & cowlThing(iV822576)
    & cC94(iV822576)
    & cC80(iV822576)
    & cC110(iV822576)
    & cC136(iV822576)
    & cC56(iV822576) )).

%------------------------------------------------------------------------------
