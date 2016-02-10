%------------------------------------------------------------------------------
% File     : KRS151+1 : TPTP v6.1.0. Released v3.1.0.
% Domain   : Knowledge Representation (Semantic Web)
% Problem  : DL Test: k_path ABox test from DL98 systems comparison
% Version  : Especial.
% English  :

% Refs     : [Bec03] Bechhofer (2003), Email to G. Sutcliffe
%          : [TR+04] Tsarkov et al. (2004), Using Vampire to Reason with OW
% Source   : [Bec03]
% Names    : positive_description-logic-Manifest206 [Bec03]

% Status   : Theorem
% Rating   : 0.00 v6.1.0, 0.12 v6.0.0, 0.25 v5.5.0, 0.21 v5.4.0, 0.26 v5.3.0, 0.35 v5.2.0, 0.14 v5.0.0, 0.15 v4.1.0, 0.11 v4.0.1, 0.05 v4.0.0, 0.10 v3.7.0, 0.33 v3.5.0, 0.25 v3.3.0, 0.22 v3.2.0, 0.33 v3.1.0
% Syntax   : Number of formulae    :  243 ( 127 unit)
%            Number of atoms       :  490 (   0 equality)
%            Maximal formula depth :   52 (   3 average)
%            Number of connectives :  399 ( 152 ~  ;   0  |; 132  &)
%                                         (  87 <=>;  28 =>;   0 <=)
%                                         (   0 <~>;   0 ~|;   0 ~&)
%            Number of predicates  :   97 (   0 propositional; 1-2 arity)
%            Number of functors    :   11 (  11 constant; 0-0 arity)
%            Number of variables   :  153 (   0 singleton; 117 !;  36 ?)
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
          & cC4(X) ) ) )).

%----Equality cC102
fof(axiom_3,axiom,
    ( ! [X] :
        ( cC102(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & ~ cC6(Y) ) ) )).

%----Equality cC104
fof(axiom_4,axiom,
    ( ! [X] :
        ( cC104(X)
      <=> ( ~ cC100(X)
          & ~ cC102(X) ) ) )).

%----Equality cC106
fof(axiom_5,axiom,
    ( ! [X] :
        ( cC106(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & cC104(Y) ) ) )).

%----Equality cC108
fof(axiom_6,axiom,
    ( ! [X] :
        ( cC108(X)
      <=> ( ~ cC106(X)
          & ~ cC98(X) ) ) )).

%----Equality cC110
fof(axiom_7,axiom,
    ( ! [X] :
        ( cC110(X)
      <=> ( cC108(X)
          & cTOP(X) ) ) )).

%----Equality cC112
fof(axiom_8,axiom,
    ( ! [X] :
        ( cC112(X)
      <=> ( cC90(X)
          & cC110(X) ) ) )).

%----Equality cC114
fof(axiom_9,axiom,
    ( ! [X] :
        ( cC114(X)
      <=> cTOP(X) ) )).

%----Equality cC116
fof(axiom_10,axiom,
    ( ! [X] :
        ( cC116(X)
      <=> ( cC114(X)
          & cC112(X) ) ) )).

%----Equality cC118
fof(axiom_11,axiom,
    ( ! [X] :
        ( cC118(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & ~ cC92(Y) ) ) )).

%----Equality cC120
fof(axiom_12,axiom,
    ( ! [X] :
        ( cC120(X)
      <=> ( ~ cC118(X)
          & ~ cC92(X) ) ) )).

%----Equality cC122
fof(axiom_13,axiom,
    ( ! [X] :
        ( cC122(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & cC120(Y) ) ) )).

%----Equality cC124
fof(axiom_14,axiom,
    ( ! [X] :
        ( cC124(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & ~ cC92(Y) ) ) )).

%----Equality cC126
fof(axiom_15,axiom,
    ( ! [X] :
        ( cC126(X)
      <=> ( ~ cC124(X)
          & ~ cC100(X) ) ) )).

%----Equality cC128
fof(axiom_16,axiom,
    ( ! [X] :
        ( cC128(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & cC126(Y) ) ) )).

%----Equality cC130
fof(axiom_17,axiom,
    ( ! [X] :
        ( cC130(X)
      <=> ( ~ cC122(X)
          & ~ cC128(X) ) ) )).

%----Equality cC132
fof(axiom_18,axiom,
    ( ! [X] :
        ( cC132(X)
      <=> ( cTOP(X)
          & cC130(X) ) ) )).

%----Equality cC134
fof(axiom_19,axiom,
    ( ! [X] :
        ( cC134(X)
      <=> ( cC132(X)
          & cC116(X) ) ) )).

%----Equality cC136
fof(axiom_20,axiom,
    ( ! [X] :
        ( cC136(X)
      <=> cTOP(X) ) )).

%----Equality cC138
fof(axiom_21,axiom,
    ( ! [X] :
        ( cC138(X)
      <=> ( cC136(X)
          & cC134(X) ) ) )).

%----Equality cC14
fof(axiom_22,axiom,
    ( ! [X] :
        ( cC14(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & ~ cC12(Y) ) ) )).

%----Equality cC140
fof(axiom_23,axiom,
    ( ! [X] :
        ( cC140(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & ~ cC100(Y) ) ) )).

%----Equality cC142
fof(axiom_24,axiom,
    ( ! [X] :
        ( cC142(X)
      <=> ( ~ cC140(X)
          & ~ cC92(X) ) ) )).

%----Equality cC144
fof(axiom_25,axiom,
    ( ! [X] :
        ( cC144(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & cC142(Y) ) ) )).

%----Equality cC146
fof(axiom_26,axiom,
    ( ! [X] :
        ( cC146(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & ~ cC100(Y) ) ) )).

%----Equality cC148
fof(axiom_27,axiom,
    ( ! [X] :
        ( cC148(X)
      <=> ( ~ cC146(X)
          & ~ cC100(X) ) ) )).

%----Equality cC150
fof(axiom_28,axiom,
    ( ! [X] :
        ( cC150(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & cC148(Y) ) ) )).

%----Equality cC152
fof(axiom_29,axiom,
    ( ! [X] :
        ( cC152(X)
      <=> ( ~ cC150(X)
          & ~ cC144(X) ) ) )).

%----Equality cC154
fof(axiom_30,axiom,
    ( ! [X] :
        ( cC154(X)
      <=> ( cTOP(X)
          & cC152(X) ) ) )).

%----Equality cC156
fof(axiom_31,axiom,
    ( ! [X] :
        ( cC156(X)
      <=> ( cC154(X)
          & cC138(X) ) ) )).

%----Equality cC158
fof(axiom_32,axiom,
    ( ! [X] :
        ( cC158(X)
      <=> ( cC22(X)
          & cC156(X) ) ) )).

%----Equality cC16
fof(axiom_33,axiom,
    ( ! [X] :
        ( cC16(X)
      <=> ( cC14(X)
          & cC10(X) ) ) )).

%----Equality cC160
fof(axiom_34,axiom,
    ( ! [X] :
        ( cC160(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & ~ cC6(Y) ) ) )).

%----Equality cC162
fof(axiom_35,axiom,
    ( ! [X] :
        ( cC162(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & cC160(Y) ) ) )).

%----Equality cC164
fof(axiom_36,axiom,
    ( ! [X] :
        ( cC164(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & ~ cC92(Y) ) ) )).

%----Equality cC166
fof(axiom_37,axiom,
    ( ! [X] :
        ( cC166(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & cC164(Y) ) ) )).

%----Equality cC168
fof(axiom_38,axiom,
    ( ! [X] :
        ( cC168(X)
      <=> ( ~ cC166(X)
          & ~ cC162(X) ) ) )).

%----Equality cC170
fof(axiom_39,axiom,
    ( ! [X] :
        ( cC170(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & ~ cC18(Y) ) ) )).

%----Equality cC172
fof(axiom_40,axiom,
    ( ! [X] :
        ( cC172(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & cC170(Y) ) ) )).

%----Equality cC174
fof(axiom_41,axiom,
    ( ! [X] :
        ( cC174(X)
      <=> ( cC168(X)
          & ~ cC172(X) ) ) )).

%----Equality cC176
fof(axiom_42,axiom,
    ( ! [X] :
        ( cC176(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & ~ cC100(Y) ) ) )).

%----Equality cC178
fof(axiom_43,axiom,
    ( ! [X] :
        ( cC178(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & cC176(Y) ) ) )).

%----Equality cC180
fof(axiom_44,axiom,
    ( ! [X] :
        ( cC180(X)
      <=> ( ~ cC178(X)
          & cC174(X) ) ) )).

%----Equality cC20
fof(axiom_45,axiom,
    ( ! [X] :
        ( cC20(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & ~ cC18(Y) ) ) )).

%----Equality cC22
fof(axiom_46,axiom,
    ( ! [X] :
        ( cC22(X)
      <=> ( cC16(X)
          & cC20(X) ) ) )).

%----Equality cC24
fof(axiom_47,axiom,
    ( ! [X] :
        ( cC24(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & ~ cC2(Y) ) ) )).

%----Equality cC26
fof(axiom_48,axiom,
    ( ! [X] :
        ( cC26(X)
      <=> ( ~ cC24(X)
          & ~ cC2(X) ) ) )).

%----Equality cC28
fof(axiom_49,axiom,
    ( ! [X] :
        ( cC28(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & cC26(Y) ) ) )).

%----Equality cC30
fof(axiom_50,axiom,
    ( ! [X] :
        ( cC30(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & ~ cC12(Y) ) ) )).

%----Equality cC32
fof(axiom_51,axiom,
    ( ! [X] :
        ( cC32(X)
      <=> ( ~ cC2(X)
          & ~ cC30(X) ) ) )).

%----Equality cC34
fof(axiom_52,axiom,
    ( ! [X] :
        ( cC34(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & cC32(Y) ) ) )).

%----Equality cC36
fof(axiom_53,axiom,
    ( ! [X] :
        ( cC36(X)
      <=> ( ~ cC28(X)
          & ~ cC34(X) ) ) )).

%----Equality cC38
fof(axiom_54,axiom,
    ( ! [X] :
        ( cC38(X)
      <=> ( cC36(X)
          & cTOP(X) ) ) )).

%----Equality cC4
fof(axiom_55,axiom,
    ( ! [X] :
        ( cC4(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & ~ cC2(Y) ) ) )).

%----Equality cC40
fof(axiom_56,axiom,
    ( ! [X] :
        ( cC40(X)
      <=> cTOP(X) ) )).

%----Equality cC42
fof(axiom_57,axiom,
    ( ! [X] :
        ( cC42(X)
      <=> ( cC40(X)
          & cC38(X) ) ) )).

%----Equality cC44
fof(axiom_58,axiom,
    ( ! [X] :
        ( cC44(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & ~ cC2(Y) ) ) )).

%----Equality cC46
fof(axiom_59,axiom,
    ( ! [X] :
        ( cC46(X)
      <=> ( ~ cC12(X)
          & ~ cC44(X) ) ) )).

%----Equality cC48
fof(axiom_60,axiom,
    ( ! [X] :
        ( cC48(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & cC46(Y) ) ) )).

%----Equality cC50
fof(axiom_61,axiom,
    ( ! [X] :
        ( cC50(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & ~ cC12(Y) ) ) )).

%----Equality cC52
fof(axiom_62,axiom,
    ( ! [X] :
        ( cC52(X)
      <=> ( ~ cC12(X)
          & ~ cC50(X) ) ) )).

%----Equality cC54
fof(axiom_63,axiom,
    ( ! [X] :
        ( cC54(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & cC52(Y) ) ) )).

%----Equality cC56
fof(axiom_64,axiom,
    ( ! [X] :
        ( cC56(X)
      <=> ( ~ cC48(X)
          & ~ cC54(X) ) ) )).

%----Equality cC58
fof(axiom_65,axiom,
    ( ! [X] :
        ( cC58(X)
      <=> ( cC56(X)
          & cTOP(X) ) ) )).

%----Equality cC60
fof(axiom_66,axiom,
    ( ! [X] :
        ( cC60(X)
      <=> ( cC58(X)
          & cC42(X) ) ) )).

%----Equality cC62
fof(axiom_67,axiom,
    ( ! [X] :
        ( cC62(X)
      <=> cTOP(X) ) )).

%----Equality cC64
fof(axiom_68,axiom,
    ( ! [X] :
        ( cC64(X)
      <=> ( cC62(X)
          & cC60(X) ) ) )).

%----Equality cC66
fof(axiom_69,axiom,
    ( ! [X] :
        ( cC66(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & ~ cC2(Y) ) ) )).

%----Equality cC68
fof(axiom_70,axiom,
    ( ! [X] :
        ( cC68(X)
      <=> ( ~ cC66(X)
          & ~ cC18(X) ) ) )).

%----Equality cC70
fof(axiom_71,axiom,
    ( ! [X] :
        ( cC70(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & cC68(Y) ) ) )).

%----Equality cC72
fof(axiom_72,axiom,
    ( ! [X] :
        ( cC72(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & ~ cC12(Y) ) ) )).

%----Equality cC74
fof(axiom_73,axiom,
    ( ! [X] :
        ( cC74(X)
      <=> ( ~ cC18(X)
          & ~ cC72(X) ) ) )).

%----Equality cC76
fof(axiom_74,axiom,
    ( ! [X] :
        ( cC76(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & cC74(Y) ) ) )).

%----Equality cC78
fof(axiom_75,axiom,
    ( ! [X] :
        ( cC78(X)
      <=> ( ~ cC70(X)
          & ~ cC76(X) ) ) )).

%----Equality cC8
fof(axiom_76,axiom,
    ( ! [X] :
        ( cC8(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & ~ cC6(Y) ) ) )).

%----Equality cC80
fof(axiom_77,axiom,
    ( ! [X] :
        ( cC80(X)
      <=> ( cTOP(X)
          & cC78(X) ) ) )).

%----Equality cC82
fof(axiom_78,axiom,
    ( ! [X] :
        ( cC82(X)
      <=> ( cC80(X)
          & cC64(X) ) ) )).

%----Equality cC84
fof(axiom_79,axiom,
    ( ! [X] :
        ( cC84(X)
      <=> cTOP(X) ) )).

%----Equality cC86
fof(axiom_80,axiom,
    ( ! [X] :
        ( cC86(X)
      <=> ( cC82(X)
          & cC84(X) ) ) )).

%----Equality cC88
fof(axiom_81,axiom,
    ( ! [X] :
        ( cC88(X)
      <=> cTOP(X) ) )).

%----Equality cC90
fof(axiom_82,axiom,
    ( ! [X] :
        ( cC90(X)
      <=> ( cC88(X)
          & cC86(X) ) ) )).

%----Equality cC94
fof(axiom_83,axiom,
    ( ! [X] :
        ( cC94(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & ~ cC6(Y) ) ) )).

%----Equality cC96
fof(axiom_84,axiom,
    ( ! [X] :
        ( cC96(X)
      <=> ( ~ cC92(X)
          & ~ cC94(X) ) ) )).

%----Equality cC98
fof(axiom_85,axiom,
    ( ! [X] :
        ( cC98(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & cC96(Y) ) ) )).

%----Equality cTEST
fof(axiom_86,axiom,
    ( ! [X] :
        ( cTEST(X)
      <=> ( cC158(X)
          & cC180(X) ) ) )).

%----iV21026
fof(axiom_87,axiom,
    ( ! [X] :
        ( rR1(iV21026,X)
       => ~ cC26(X) ) )).

%----iV21026
fof(axiom_88,axiom,
    ( cTOP(iV21026) )).

%----iV21026
fof(axiom_89,axiom,
    ( cTEST(iV21026) )).

%----iV21026
fof(axiom_90,axiom,
    ( ! [X] :
        ( rR1(iV21026,X)
       => ~ cC104(X) ) )).

%----iV21026
fof(axiom_91,axiom,
    ( ~ cC98(iV21026) )).

%----iV21026
fof(axiom_92,axiom,
    ( ~ cC122(iV21026) )).

%----iV21026
fof(axiom_93,axiom,
    ( ! [X] :
        ( rR1(iV21026,X)
       => ~ cC148(X) ) )).

%----iV21026
fof(axiom_94,axiom,
    ( ! [X] :
        ( rR1(iV21026,X)
       => ~ cC160(X) ) )).

%----iV21026
fof(axiom_95,axiom,
    ( ~ cC34(iV21026) )).

%----iV21026
fof(axiom_96,axiom,
    ( ~ cC28(iV21026) )).

%----iV21026
fof(axiom_97,axiom,
    ( ! [X] :
        ( rR1(iV21026,X)
       => ~ cC126(X) ) )).

%----iV21026
fof(axiom_98,axiom,
    ( ~ cC70(iV21026) )).

%----iV21026
fof(axiom_99,axiom,
    ( ~ cC178(iV21026) )).

%----iV21026
fof(axiom_100,axiom,
    ( ~ cC162(iV21026) )).

%----iV21026
fof(axiom_101,axiom,
    ( ~ cC166(iV21026) )).

%----iV21026
fof(axiom_102,axiom,
    ( ! [X] :
        ( rR1(iV21026,X)
       => ~ cC68(X) ) )).

%----iV21026
fof(axiom_103,axiom,
    ( ! [X] :
        ( rR1(iV21026,X)
       => ~ cC164(X) ) )).

%----iV21026
fof(axiom_104,axiom,
    ( ! [X] :
        ( rR1(iV21026,X)
       => ~ cC46(X) ) )).

%----iV21026
fof(axiom_105,axiom,
    ( ! [X] :
        ( rR1(iV21026,X)
       => ~ cC52(X) ) )).

%----iV21026
fof(axiom_106,axiom,
    ( ! [X] :
        ( rR1(iV21026,X)
       => ~ cC176(X) ) )).

%----iV21026
fof(axiom_107,axiom,
    ( ! [X] :
        ( rR1(iV21026,X)
       => ~ cC142(X) ) )).

%----iV21026
fof(axiom_108,axiom,
    ( ~ cC150(iV21026) )).

%----iV21026
fof(axiom_109,axiom,
    ( ~ cC54(iV21026) )).

%----iV21026
fof(axiom_110,axiom,
    ( ~ cC106(iV21026) )).

%----iV21026
fof(axiom_111,axiom,
    ( ~ cC144(iV21026) )).

%----iV21026
fof(axiom_112,axiom,
    ( ~ cC48(iV21026) )).

%----iV21026
fof(axiom_113,axiom,
    ( ~ cC76(iV21026) )).

%----iV21026
fof(axiom_114,axiom,
    ( ! [X] :
        ( rR1(iV21026,X)
       => ~ cC32(X) ) )).

%----iV21026
fof(axiom_115,axiom,
    ( ~ cC128(iV21026) )).

%----iV21026
fof(axiom_116,axiom,
    ( ~ cC172(iV21026) )).

%----iV21026
fof(axiom_117,axiom,
    ( ! [X] :
        ( rR1(iV21026,X)
       => ~ cC120(X) ) )).

%----iV21026
fof(axiom_118,axiom,
    ( ! [X] :
        ( rR1(iV21026,X)
       => ~ cC96(X) ) )).

%----iV21026
fof(axiom_119,axiom,
    ( ! [X] :
        ( rR1(iV21026,X)
       => ~ cC170(X) ) )).

%----iV21026
fof(axiom_120,axiom,
    ( cowlThing(iV21026) )).

%----iV21026
fof(axiom_121,axiom,
    ( ! [X] :
        ( rR1(iV21026,X)
       => ~ cC74(X) ) )).

fof(axiom_122,axiom,
    ( rR1(iV21026,iV21030) )).

fof(axiom_123,axiom,
    ( rR1(iV21026,iV21027) )).

fof(axiom_124,axiom,
    ( rR1(iV21026,iV21028) )).

fof(axiom_125,axiom,
    ( rR1(iV21026,iV21029) )).

%----iV21027
fof(axiom_126,axiom,
    ( ~ cC26(iV21027) )).

%----iV21027
fof(axiom_127,axiom,
    ( ~ cC176(iV21027) )).

%----iV21027
fof(axiom_128,axiom,
    ( ! [X] :
        ( rR1(iV21027,X)
       => cC18(X) ) )).

%----iV21027
fof(axiom_129,axiom,
    ( ~ cC46(iV21027) )).

%----iV21027
fof(axiom_130,axiom,
    ( ~ cC170(iV21027) )).

%----iV21027
fof(axiom_131,axiom,
    ( cC12(iV21027) )).

%----iV21027
fof(axiom_132,axiom,
    ( ~ cC120(iV21027) )).

%----iV21027
fof(axiom_133,axiom,
    ( ~ cC74(iV21027) )).

%----iV21027
fof(axiom_134,axiom,
    ( ! [X] :
        ( rR1(iV21027,X)
       => cC6(X) ) )).

%----iV21027
fof(axiom_135,axiom,
    ( ~ cC52(iV21027) )).

%----iV21027
fof(axiom_136,axiom,
    ( ~ cC32(iV21027) )).

%----iV21027
fof(axiom_137,axiom,
    ( ~ cC96(iV21027) )).

%----iV21027
fof(axiom_138,axiom,
    ( ~ cC68(iV21027) )).

%----iV21027
fof(axiom_139,axiom,
    ( cC92(iV21027) )).

%----iV21027
fof(axiom_140,axiom,
    ( ~ cC126(iV21027) )).

%----iV21027
fof(axiom_141,axiom,
    ( cC100(iV21027) )).

%----iV21027
fof(axiom_142,axiom,
    ( ~ cC160(iV21027) )).

%----iV21027
fof(axiom_143,axiom,
    ( ~ cC104(iV21027) )).

%----iV21027
fof(axiom_144,axiom,
    ( ~ cC148(iV21027) )).

%----iV21027
fof(axiom_145,axiom,
    ( ~ cC142(iV21027) )).

%----iV21027
fof(axiom_146,axiom,
    ( cC18(iV21027) )).

%----iV21027
fof(axiom_147,axiom,
    ( ! [X] :
        ( rR1(iV21027,X)
       => cC92(X) ) )).

%----iV21027
fof(axiom_148,axiom,
    ( ! [X] :
        ( rR1(iV21027,X)
       => cC100(X) ) )).

%----iV21027
fof(axiom_149,axiom,
    ( ~ cC164(iV21027) )).

%----iV21027
fof(axiom_150,axiom,
    ( ~ cC2(iV21027) )).

%----iV21027
fof(axiom_151,axiom,
    ( cowlThing(iV21027) )).

fof(axiom_152,axiom,
    ( rR1(iV21027,iV21036) )).

fof(axiom_153,axiom,
    ( rR1(iV21027,iV21035) )).

%----iV21028
fof(axiom_154,axiom,
    ( cowlThing(iV21028) )).

%----iV21029
fof(axiom_155,axiom,
    ( ~ cC148(iV21029) )).

%----iV21029
fof(axiom_156,axiom,
    ( ~ cC68(iV21029) )).

%----iV21029
fof(axiom_157,axiom,
    ( ~ cC46(iV21029) )).

%----iV21029
fof(axiom_158,axiom,
    ( ~ cC104(iV21029) )).

%----iV21029
fof(axiom_159,axiom,
    ( ! [X] :
        ( rR1(iV21029,X)
       => cC100(X) ) )).

%----iV21029
fof(axiom_160,axiom,
    ( ~ cC176(iV21029) )).

%----iV21029
fof(axiom_161,axiom,
    ( ~ cC142(iV21029) )).

%----iV21029
fof(axiom_162,axiom,
    ( ! [X] :
        ( rR1(iV21029,X)
       => cC92(X) ) )).

%----iV21029
fof(axiom_163,axiom,
    ( ~ cC12(iV21029) )).

%----iV21029
fof(axiom_164,axiom,
    ( cC2(iV21029) )).

%----iV21029
fof(axiom_165,axiom,
    ( ~ cC74(iV21029) )).

%----iV21029
fof(axiom_166,axiom,
    ( ~ cC120(iV21029) )).

%----iV21029
fof(axiom_167,axiom,
    ( cC92(iV21029) )).

%----iV21029
fof(axiom_168,axiom,
    ( ~ cC52(iV21029) )).

%----iV21029
fof(axiom_169,axiom,
    ( ~ cC32(iV21029) )).

%----iV21029
fof(axiom_170,axiom,
    ( cC100(iV21029) )).

%----iV21029
fof(axiom_171,axiom,
    ( cC18(iV21029) )).

%----iV21029
fof(axiom_172,axiom,
    ( ~ cC170(iV21029) )).

%----iV21029
fof(axiom_173,axiom,
    ( ~ cC26(iV21029) )).

%----iV21029
fof(axiom_174,axiom,
    ( ~ cC96(iV21029) )).

%----iV21029
fof(axiom_175,axiom,
    ( ~ cC126(iV21029) )).

%----iV21029
fof(axiom_176,axiom,
    ( ! [X] :
        ( rR1(iV21029,X)
       => cC6(X) ) )).

%----iV21029
fof(axiom_177,axiom,
    ( ~ cC164(iV21029) )).

%----iV21029
fof(axiom_178,axiom,
    ( ~ cC160(iV21029) )).

%----iV21029
fof(axiom_179,axiom,
    ( ! [X] :
        ( rR1(iV21029,X)
       => cC18(X) ) )).

%----iV21029
fof(axiom_180,axiom,
    ( cowlThing(iV21029) )).

fof(axiom_181,axiom,
    ( rR1(iV21029,iV21034) )).

fof(axiom_182,axiom,
    ( rR1(iV21029,iV21033) )).

%----iV21030
fof(axiom_183,axiom,
    ( ~ cC32(iV21030) )).

%----iV21030
fof(axiom_184,axiom,
    ( ~ cC26(iV21030) )).

%----iV21030
fof(axiom_185,axiom,
    ( ~ cC126(iV21030) )).

%----iV21030
fof(axiom_186,axiom,
    ( ! [X] :
        ( rR1(iV21030,X)
       => cC18(X) ) )).

%----iV21030
fof(axiom_187,axiom,
    ( ~ cC148(iV21030) )).

%----iV21030
fof(axiom_188,axiom,
    ( ~ cC46(iV21030) )).

%----iV21030
fof(axiom_189,axiom,
    ( ! [X] :
        ( rR1(iV21030,X)
       => cC6(X) ) )).

%----iV21030
fof(axiom_190,axiom,
    ( cC12(iV21030) )).

%----iV21030
fof(axiom_191,axiom,
    ( ~ cC68(iV21030) )).

%----iV21030
fof(axiom_192,axiom,
    ( ~ cC74(iV21030) )).

%----iV21030
fof(axiom_193,axiom,
    ( ~ cC96(iV21030) )).

%----iV21030
fof(axiom_194,axiom,
    ( ~ cC176(iV21030) )).

%----iV21030
fof(axiom_195,axiom,
    ( cC2(iV21030) )).

%----iV21030
fof(axiom_196,axiom,
    ( ~ cC104(iV21030) )).

%----iV21030
fof(axiom_197,axiom,
    ( cC92(iV21030) )).

%----iV21030
fof(axiom_198,axiom,
    ( cC100(iV21030) )).

%----iV21030
fof(axiom_199,axiom,
    ( ~ cC120(iV21030) )).

%----iV21030
fof(axiom_200,axiom,
    ( ! [X] :
        ( rR1(iV21030,X)
       => cC100(X) ) )).

%----iV21030
fof(axiom_201,axiom,
    ( ~ cC170(iV21030) )).

%----iV21030
fof(axiom_202,axiom,
    ( ~ cC18(iV21030) )).

%----iV21030
fof(axiom_203,axiom,
    ( ! [X] :
        ( rR1(iV21030,X)
       => cC92(X) ) )).

%----iV21030
fof(axiom_204,axiom,
    ( ~ cC52(iV21030) )).

%----iV21030
fof(axiom_205,axiom,
    ( ~ cC160(iV21030) )).

%----iV21030
fof(axiom_206,axiom,
    ( ~ cC164(iV21030) )).

%----iV21030
fof(axiom_207,axiom,
    ( cowlThing(iV21030) )).

%----iV21030
fof(axiom_208,axiom,
    ( ~ cC142(iV21030) )).

fof(axiom_209,axiom,
    ( rR1(iV21030,iV21032) )).

fof(axiom_210,axiom,
    ( rR1(iV21030,iV21031) )).

%----iV21031
fof(axiom_211,axiom,
    ( cowlThing(iV21031) )).

%----iV21032
fof(axiom_212,axiom,
    ( cC92(iV21032) )).

%----iV21032
fof(axiom_213,axiom,
    ( cC100(iV21032) )).

%----iV21032
fof(axiom_214,axiom,
    ( ~ cC2(iV21032) )).

%----iV21032
fof(axiom_215,axiom,
    ( cC18(iV21032) )).

%----iV21032
fof(axiom_216,axiom,
    ( cC6(iV21032) )).

%----iV21032
fof(axiom_217,axiom,
    ( cowlThing(iV21032) )).

%----iV21033
fof(axiom_218,axiom,
    ( cC92(iV21033) )).

%----iV21033
fof(axiom_219,axiom,
    ( cC100(iV21033) )).

%----iV21033
fof(axiom_220,axiom,
    ( cC18(iV21033) )).

%----iV21033
fof(axiom_221,axiom,
    ( cC6(iV21033) )).

%----iV21033
fof(axiom_222,axiom,
    ( ~ cC12(iV21033) )).

%----iV21033
fof(axiom_223,axiom,
    ( cowlThing(iV21033) )).

%----iV21034
fof(axiom_224,axiom,
    ( cC92(iV21034) )).

%----iV21034
fof(axiom_225,axiom,
    ( cC100(iV21034) )).

%----iV21034
fof(axiom_226,axiom,
    ( cC18(iV21034) )).

%----iV21034
fof(axiom_227,axiom,
    ( cC6(iV21034) )).

%----iV21034
fof(axiom_228,axiom,
    ( ~ cC2(iV21034) )).

%----iV21034
fof(axiom_229,axiom,
    ( cowlThing(iV21034) )).

%----iV21035
fof(axiom_230,axiom,
    ( cC92(iV21035) )).

%----iV21035
fof(axiom_231,axiom,
    ( cC100(iV21035) )).

%----iV21035
fof(axiom_232,axiom,
    ( ~ cC12(iV21035) )).

%----iV21035
fof(axiom_233,axiom,
    ( cC18(iV21035) )).

%----iV21035
fof(axiom_234,axiom,
    ( cC6(iV21035) )).

%----iV21035
fof(axiom_235,axiom,
    ( cowlThing(iV21035) )).

%----iV21036
fof(axiom_236,axiom,
    ( cC92(iV21036) )).

%----iV21036
fof(axiom_237,axiom,
    ( cC100(iV21036) )).

%----iV21036
fof(axiom_238,axiom,
    ( cC18(iV21036) )).

%----iV21036
fof(axiom_239,axiom,
    ( cC6(iV21036) )).

%----iV21036
fof(axiom_240,axiom,
    ( ~ cC2(iV21036) )).

%----iV21036
fof(axiom_241,axiom,
    ( cowlThing(iV21036) )).

%----Thing and Nothing
%----String and Integer disjoint
%----iV21026
%----iV21026
%----iV21026
%----iV21026
%----iV21026
%----iV21026
%----iV21026
%----iV21026
%----iV21026
%----iV21026
%----iV21026
%----iV21026
%----iV21026
%----iV21026
%----iV21026
%----iV21026
%----iV21026
%----iV21026
%----iV21026
%----iV21026
%----iV21026
%----iV21026
%----iV21026
%----iV21026
%----iV21026
%----iV21026
%----iV21026
%----iV21026
%----iV21026
%----iV21026
%----iV21026
%----iV21026
%----iV21026
%----iV21026
%----iV21026
%----iV21026
%----iV21026
%----iV21026
%----iV21026
%----iV21026
%----iV21026
%----iV21027
%----iV21027
%----iV21027
%----iV21029
%----iV21029
%----iV21029
%----iV21030
%----iV21030
%----iV21030
fof(the_axiom,conjecture,
    ( ! [X] :
        ( cowlThing(X)
        & ~ cowlNothing(X) )
    & ! [X] :
        ( xsd_string(X)
      <=> ~ xsd_integer(X) )
    & cowlThing(iV21026)
    & cC84(iV21026)
    & cC16(iV21026)
    & cC36(iV21026)
    & cC42(iV21026)
    & cC88(iV21026)
    & cC86(iV21026)
    & cC174(iV21026)
    & cC20(iV21026)
    & cC156(iV21026)
    & cC60(iV21026)
    & cC38(iV21026)
    & cC158(iV21026)
    & cC10(iV21026)
    & cC134(iV21026)
    & cC22(iV21026)
    & cC168(iV21026)
    & cC56(iV21026)
    & cC78(iV21026)
    & cC58(iV21026)
    & cC152(iV21026)
    & cC40(iV21026)
    & cC132(iV21026)
    & cC130(iV21026)
    & cC62(iV21026)
    & cC154(iV21026)
    & cC80(iV21026)
    & cC8(iV21026)
    & cC136(iV21026)
    & cC112(iV21026)
    & cC180(iV21026)
    & cC114(iV21026)
    & cC64(iV21026)
    & cC110(iV21026)
    & cC116(iV21026)
    & cC82(iV21026)
    & cC138(iV21026)
    & cC4(iV21026)
    & cC108(iV21026)
    & cC14(iV21026)
    & cC90(iV21026)
    & cowlThing(iV21027)
    & cC30(iV21027)
    & cC24(iV21027)
    & cowlThing(iV21029)
    & cC50(iV21029)
    & cC44(iV21029)
    & cowlThing(iV21030)
    & cC66(iV21030)
    & cC72(iV21030) )).

%------------------------------------------------------------------------------
