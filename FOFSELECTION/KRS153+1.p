%------------------------------------------------------------------------------
% File     : KRS153+1 : TPTP v6.1.0. Released v3.1.0.
% Domain   : Knowledge Representation (Semantic Web)
% Problem  : DL Test: k_poly ABox test from DL98 systems comparison
% Version  : Especial.
% English  :

% Refs     : [Bec03] Bechhofer (2003), Email to G. Sutcliffe
%          : [TR+04] Tsarkov et al. (2004), Using Vampire to Reason with OW
% Source   : [Bec03]
% Names    : positive_description-logic-Manifest208 [Bec03]

% Status   : Theorem
% Rating   : 0.00 v6.1.0, 0.24 v6.0.0, 0.25 v5.4.0, 0.26 v5.3.0, 0.22 v5.2.0, 0.07 v5.0.0, 0.10 v4.1.0, 0.06 v4.0.1, 0.11 v4.0.0, 0.15 v3.7.0, 0.33 v3.5.0, 0.25 v3.3.0, 0.22 v3.2.0, 0.33 v3.1.0
% Syntax   : Number of formulae    :  201 (  99 unit)
%            Number of atoms       :  408 (   0 equality)
%            Maximal formula depth :   47 (   3 average)
%            Number of connectives :  333 ( 126 ~  ;   0  |; 106  &)
%                                         (  60 <=>;  41 =>;   0 <=)
%                                         (   0 <~>;   0 ~|;   0 ~&)
%            Number of predicates  :   72 (   0 propositional; 1-2 arity)
%            Number of functors    :   16 (  16 constant; 0-0 arity)
%            Number of variables   :  131 (   0 singleton; 103 !;  28 ?)
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

%----Equality cC100
fof(axiom_3,axiom,
    ( ! [X] :
        ( cC100(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & ~ cC98(Y) ) ) )).

%----Equality cC104
fof(axiom_4,axiom,
    ( ! [X] :
        ( cC104(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & ~ cC102(Y) ) ) )).

%----Equality cC106
fof(axiom_5,axiom,
    ( ! [X] :
        ( cC106(X)
      <=> ( ~ cC100(X)
          & cC104(X) ) ) )).

%----Equality cC108
fof(axiom_6,axiom,
    ( ! [X] :
        ( cC108(X)
      <=> ( cC28(X)
          & cC106(X) ) ) )).

%----Equality cC110
fof(axiom_7,axiom,
    ( ! [X] :
        ( cC110(X)
      <=> ( ~ cC12(X)
          & ~ cC4(X) ) ) )).

%----Equality cC112
fof(axiom_8,axiom,
    ( ! [X] :
        ( cC112(X)
      <=> ( ~ cC102(X)
          & cC110(X) ) ) )).

%----Equality cC116
fof(axiom_9,axiom,
    ( ! [X] :
        ( cC116(X)
      <=> ( cC112(X)
          & ~ cC114(X) ) ) )).

%----Equality cC120
fof(axiom_10,axiom,
    ( ! [X] :
        ( cC120(X)
      <=> ( cC116(X)
          & ~ cC118(X) ) ) )).

%----Equality cC122
fof(axiom_11,axiom,
    ( ! [X] :
        ( cC122(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & ~ cC120(Y) ) ) )).

%----Equality cC124
fof(axiom_12,axiom,
    ( ! [X] :
        ( cC124(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & cC122(Y) ) ) )).

%----Equality cC126
fof(axiom_13,axiom,
    ( ! [X] :
        ( cC126(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & cC124(Y) ) ) )).

%----Equality cC128
fof(axiom_14,axiom,
    ( ! [X] :
        ( cC128(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & cC126(Y) ) ) )).

%----Equality cC130
fof(axiom_15,axiom,
    ( ! [X] :
        ( cC130(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & cC128(Y) ) ) )).

%----Equality cC14
fof(axiom_16,axiom,
    ( ! [X] :
        ( cC14(X)
      <=> ( cC10(X)
          & cC12(X) ) ) )).

%----Equality cC18
fof(axiom_17,axiom,
    ( ! [X] :
        ( cC18(X)
      <=> ( cC14(X)
          & cC16(X) ) ) )).

%----Equality cC20
fof(axiom_18,axiom,
    ( ! [X] :
        ( cC20(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & ~ cC18(Y) ) ) )).

%----Equality cC22
fof(axiom_19,axiom,
    ( ! [X] :
        ( cC22(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & cC20(Y) ) ) )).

%----Equality cC24
fof(axiom_20,axiom,
    ( ! [X] :
        ( cC24(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & cC22(Y) ) ) )).

%----Equality cC26
fof(axiom_21,axiom,
    ( ! [X] :
        ( cC26(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & cC24(Y) ) ) )).

%----Equality cC28
fof(axiom_22,axiom,
    ( ! [X] :
        ( cC28(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & cC26(Y) ) ) )).

%----Equality cC30
fof(axiom_23,axiom,
    ( ! [X] :
        ( cC30(X)
      <=> ( cC4(X)
          & cC2(X) ) ) )).

%----Equality cC32
fof(axiom_24,axiom,
    ( ! [X] :
        ( cC32(X)
      <=> ( ~ cC2(X)
          & ~ cC4(X) ) ) )).

%----Equality cC34
fof(axiom_25,axiom,
    ( ! [X] :
        ( cC34(X)
      <=> ( ~ cC32(X)
          & ~ cC30(X) ) ) )).

%----Equality cC36
fof(axiom_26,axiom,
    ( ! [X] :
        ( cC36(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & ~ cC34(Y) ) ) )).

%----Equality cC38
fof(axiom_27,axiom,
    ( ! [X] :
        ( cC38(X)
      <=> ( ~ cC36(X)
          & cTOP(X) ) ) )).

%----Equality cC40
fof(axiom_28,axiom,
    ( ! [X] :
        ( cC40(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & ~ cC38(Y) ) ) )).

%----Equality cC42
fof(axiom_29,axiom,
    ( ! [X] :
        ( cC42(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & ~ cC8(Y) ) ) )).

%----Equality cC44
fof(axiom_30,axiom,
    ( ! [X] :
        ( cC44(X)
      <=> ( ~ cC40(X)
          & cC42(X) ) ) )).

%----Equality cC46
fof(axiom_31,axiom,
    ( ! [X] :
        ( cC46(X)
      <=> ( cC8(X)
          & cC4(X) ) ) )).

%----Equality cC48
fof(axiom_32,axiom,
    ( ! [X] :
        ( cC48(X)
      <=> ( ~ cC8(X)
          & ~ cC4(X) ) ) )).

%----Equality cC50
fof(axiom_33,axiom,
    ( ! [X] :
        ( cC50(X)
      <=> ( ~ cC46(X)
          & ~ cC48(X) ) ) )).

%----Equality cC52
fof(axiom_34,axiom,
    ( ! [X] :
        ( cC52(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & ~ cC50(Y) ) ) )).

%----Equality cC54
fof(axiom_35,axiom,
    ( ! [X] :
        ( cC54(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & cC52(Y) ) ) )).

%----Equality cC56
fof(axiom_36,axiom,
    ( ! [X] :
        ( cC56(X)
      <=> ( cC44(X)
          & ~ cC54(X) ) ) )).

%----Equality cC58
fof(axiom_37,axiom,
    ( ! [X] :
        ( cC58(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & ~ cC56(Y) ) ) )).

%----Equality cC6
fof(axiom_38,axiom,
    ( ! [X] :
        ( cC6(X)
      <=> ( cC4(X)
          & cC2(X) ) ) )).

%----Equality cC60
fof(axiom_39,axiom,
    ( ! [X] :
        ( cC60(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & ~ cC12(Y) ) ) )).

%----Equality cC62
fof(axiom_40,axiom,
    ( ! [X] :
        ( cC62(X)
      <=> ( cC60(X)
          & ~ cC58(X) ) ) )).

%----Equality cC64
fof(axiom_41,axiom,
    ( ! [X] :
        ( cC64(X)
      <=> ( cC8(X)
          & cC12(X) ) ) )).

%----Equality cC66
fof(axiom_42,axiom,
    ( ! [X] :
        ( cC66(X)
      <=> ( ~ cC8(X)
          & ~ cC12(X) ) ) )).

%----Equality cC68
fof(axiom_43,axiom,
    ( ! [X] :
        ( cC68(X)
      <=> ( ~ cC64(X)
          & ~ cC66(X) ) ) )).

%----Equality cC70
fof(axiom_44,axiom,
    ( ! [X] :
        ( cC70(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & ~ cC68(Y) ) ) )).

%----Equality cC72
fof(axiom_45,axiom,
    ( ! [X] :
        ( cC72(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & cC70(Y) ) ) )).

%----Equality cC74
fof(axiom_46,axiom,
    ( ! [X] :
        ( cC74(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & cC72(Y) ) ) )).

%----Equality cC76
fof(axiom_47,axiom,
    ( ! [X] :
        ( cC76(X)
      <=> ( ~ cC74(X)
          & cC62(X) ) ) )).

%----Equality cC78
fof(axiom_48,axiom,
    ( ! [X] :
        ( cC78(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & ~ cC76(Y) ) ) )).

%----Equality cC80
fof(axiom_49,axiom,
    ( ! [X] :
        ( cC80(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & ~ cC16(Y) ) ) )).

%----Equality cC82
fof(axiom_50,axiom,
    ( ! [X] :
        ( cC82(X)
      <=> ( ~ cC78(X)
          & cC80(X) ) ) )).

%----Equality cC84
fof(axiom_51,axiom,
    ( ! [X] :
        ( cC84(X)
      <=> ( cC2(X)
          & cC12(X) ) ) )).

%----Equality cC86
fof(axiom_52,axiom,
    ( ! [X] :
        ( cC86(X)
      <=> ( ~ cC12(X)
          & ~ cC2(X) ) ) )).

%----Equality cC88
fof(axiom_53,axiom,
    ( ! [X] :
        ( cC88(X)
      <=> ( ~ cC84(X)
          & ~ cC86(X) ) ) )).

%----Equality cC90
fof(axiom_54,axiom,
    ( ! [X] :
        ( cC90(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & ~ cC88(Y) ) ) )).

%----Equality cC92
fof(axiom_55,axiom,
    ( ! [X] :
        ( cC92(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & cC90(Y) ) ) )).

%----Equality cC94
fof(axiom_56,axiom,
    ( ! [X] :
        ( cC94(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & cC92(Y) ) ) )).

%----Equality cC96
fof(axiom_57,axiom,
    ( ! [X] :
        ( cC96(X)
      <=> ? [Y] :
            ( rR1(X,Y)
            & cC94(Y) ) ) )).

%----Equality cC98
fof(axiom_58,axiom,
    ( ! [X] :
        ( cC98(X)
      <=> ( ~ cC96(X)
          & cC82(X) ) ) )).

%----Equality cTEST
fof(axiom_59,axiom,
    ( ! [X] :
        ( cTEST(X)
      <=> ( cC108(X)
          & cC130(X) ) ) )).

%----iV16439
fof(axiom_60,axiom,
    ( ! [X] :
        ( rR1(iV16439,X)
       => cC98(X) ) )).

%----iV16439
fof(axiom_61,axiom,
    ( cTEST(iV16439) )).

%----iV16439
fof(axiom_62,axiom,
    ( ~ cC100(iV16439) )).

%----iV16439
fof(axiom_63,axiom,
    ( cowlThing(iV16439) )).

fof(axiom_64,axiom,
    ( rR1(iV16439,iV16440) )).

fof(axiom_65,axiom,
    ( rR1(iV16439,iV16442) )).

fof(axiom_66,axiom,
    ( rR1(iV16439,iV16441) )).

%----iV16440
fof(axiom_67,axiom,
    ( ! [X] :
        ( rR1(iV16440,X)
       => cC76(X) ) )).

%----iV16440
fof(axiom_68,axiom,
    ( ! [X] :
        ( rR1(iV16440,X)
       => ~ cC94(X) ) )).

%----iV16440
fof(axiom_69,axiom,
    ( ~ cC102(iV16440) )).

%----iV16440
fof(axiom_70,axiom,
    ( ~ cC78(iV16440) )).

%----iV16440
fof(axiom_71,axiom,
    ( ~ cC96(iV16440) )).

%----iV16440
fof(axiom_72,axiom,
    ( cowlThing(iV16440) )).

fof(axiom_73,axiom,
    ( rR1(iV16440,iV16463) )).

%----iV16441
fof(axiom_74,axiom,
    ( cowlThing(iV16441) )).

%----iV16442
fof(axiom_75,axiom,
    ( cowlThing(iV16442) )).

%----iV16448
fof(axiom_76,axiom,
    ( ~ cC36(iV16448) )).

%----iV16448
fof(axiom_77,axiom,
    ( ! [X] :
        ( rR1(iV16448,X)
       => cC68(X) ) )).

%----iV16448
fof(axiom_78,axiom,
    ( ! [X] :
        ( rR1(iV16448,X)
       => cC34(X) ) )).

%----iV16448
fof(axiom_79,axiom,
    ( cTOP(iV16448) )).

%----iV16448
fof(axiom_80,axiom,
    ( ! [X] :
        ( rR1(iV16448,X)
       => cC50(X) ) )).

%----iV16448
fof(axiom_81,axiom,
    ( ~ cC52(iV16448) )).

%----iV16448
fof(axiom_82,axiom,
    ( ~ cC70(iV16448) )).

%----iV16448
fof(axiom_83,axiom,
    ( ~ cC90(iV16448) )).

%----iV16448
fof(axiom_84,axiom,
    ( cowlThing(iV16448) )).

%----iV16448
fof(axiom_85,axiom,
    ( ! [X] :
        ( rR1(iV16448,X)
       => cC88(X) ) )).

fof(axiom_86,axiom,
    ( rR1(iV16448,iV16449) )).

%----iV16449
fof(axiom_87,axiom,
    ( cowlThing(iV16449) )).

%----iV16453
fof(axiom_88,axiom,
    ( ! [X] :
        ( rR1(iV16453,X)
       => ~ cC92(X) ) )).

%----iV16453
fof(axiom_89,axiom,
    ( ! [X] :
        ( rR1(iV16453,X)
       => ~ cC72(X) ) )).

%----iV16453
fof(axiom_90,axiom,
    ( ~ cC16(iV16453) )).

%----iV16453
fof(axiom_91,axiom,
    ( ~ cC58(iV16453) )).

%----iV16453
fof(axiom_92,axiom,
    ( ~ cC74(iV16453) )).

%----iV16453
fof(axiom_93,axiom,
    ( ! [X] :
        ( rR1(iV16453,X)
       => cC56(X) ) )).

%----iV16453
fof(axiom_94,axiom,
    ( cowlThing(iV16453) )).

%----iV16453
fof(axiom_95,axiom,
    ( ~ cC94(iV16453) )).

fof(axiom_96,axiom,
    ( rR1(iV16453,iV16461) )).

%----iV16455
fof(axiom_97,axiom,
    ( ~ cC12(iV16455) )).

%----iV16455
fof(axiom_98,axiom,
    ( ~ cC40(iV16455) )).

%----iV16455
fof(axiom_99,axiom,
    ( ! [X] :
        ( rR1(iV16455,X)
       => ~ cC90(X) ) )).

%----iV16455
fof(axiom_100,axiom,
    ( ! [X] :
        ( rR1(iV16455,X)
       => ~ cC70(X) ) )).

%----iV16455
fof(axiom_101,axiom,
    ( ! [X] :
        ( rR1(iV16455,X)
       => ~ cC52(X) ) )).

%----iV16455
fof(axiom_102,axiom,
    ( ~ cC72(iV16455) )).

%----iV16455
fof(axiom_103,axiom,
    ( ~ cC54(iV16455) )).

%----iV16455
fof(axiom_104,axiom,
    ( ~ cC92(iV16455) )).

%----iV16455
fof(axiom_105,axiom,
    ( cowlThing(iV16455) )).

%----iV16455
fof(axiom_106,axiom,
    ( ! [X] :
        ( rR1(iV16455,X)
       => cC38(X) ) )).

fof(axiom_107,axiom,
    ( rR1(iV16455,iV16460) )).

%----iV16457
fof(axiom_108,axiom,
    ( ~ cC36(iV16457) )).

%----iV16457
fof(axiom_109,axiom,
    ( ! [X] :
        ( rR1(iV16457,X)
       => cC88(X) ) )).

%----iV16457
fof(axiom_110,axiom,
    ( ~ cC52(iV16457) )).

%----iV16457
fof(axiom_111,axiom,
    ( ! [X] :
        ( rR1(iV16457,X)
       => cC68(X) ) )).

%----iV16457
fof(axiom_112,axiom,
    ( ! [X] :
        ( rR1(iV16457,X)
       => cC34(X) ) )).

%----iV16457
fof(axiom_113,axiom,
    ( cTOP(iV16457) )).

%----iV16457
fof(axiom_114,axiom,
    ( ~ cC90(iV16457) )).

%----iV16457
fof(axiom_115,axiom,
    ( ~ cC70(iV16457) )).

%----iV16457
fof(axiom_116,axiom,
    ( ! [X] :
        ( rR1(iV16457,X)
       => cC50(X) ) )).

%----iV16457
fof(axiom_117,axiom,
    ( cowlThing(iV16457) )).

%----iV16457
fof(axiom_118,axiom,
    ( ~ cC8(iV16457) )).

%----iV16459
fof(axiom_119,axiom,
    ( cC4(iV16459) )).

%----iV16459
fof(axiom_120,axiom,
    ( ~ cC48(iV16459) )).

%----iV16459
fof(axiom_121,axiom,
    ( ~ cC30(iV16459) )).

%----iV16459
fof(axiom_122,axiom,
    ( ~ cC6(iV16459) )).

%----iV16459
fof(axiom_123,axiom,
    ( ~ cC86(iV16459) )).

%----iV16459
fof(axiom_124,axiom,
    ( ~ cC46(iV16459) )).

%----iV16459
fof(axiom_125,axiom,
    ( ~ cC14(iV16459) )).

%----iV16459
fof(axiom_126,axiom,
    ( ~ cC18(iV16459) )).

%----iV16459
fof(axiom_127,axiom,
    ( ~ cC66(iV16459) )).

%----iV16459
fof(axiom_128,axiom,
    ( cC12(iV16459) )).

%----iV16459
fof(axiom_129,axiom,
    ( ~ cC8(iV16459) )).

%----iV16459
fof(axiom_130,axiom,
    ( ~ cC2(iV16459) )).

%----iV16459
fof(axiom_131,axiom,
    ( ~ cC10(iV16459) )).

%----iV16459
fof(axiom_132,axiom,
    ( ~ cC84(iV16459) )).

%----iV16459
fof(axiom_133,axiom,
    ( ~ cC64(iV16459) )).

%----iV16459
fof(axiom_134,axiom,
    ( cowlThing(iV16459) )).

%----iV16459
fof(axiom_135,axiom,
    ( ~ cC32(iV16459) )).

%----iV16460
fof(axiom_136,axiom,
    ( ~ cC90(iV16460) )).

%----iV16460
fof(axiom_137,axiom,
    ( ~ cC36(iV16460) )).

%----iV16460
fof(axiom_138,axiom,
    ( ! [X] :
        ( rR1(iV16460,X)
       => cC68(X) ) )).

%----iV16460
fof(axiom_139,axiom,
    ( ~ cC52(iV16460) )).

%----iV16460
fof(axiom_140,axiom,
    ( cTOP(iV16460) )).

%----iV16460
fof(axiom_141,axiom,
    ( ~ cC8(iV16460) )).

%----iV16460
fof(axiom_142,axiom,
    ( ~ cC70(iV16460) )).

%----iV16460
fof(axiom_143,axiom,
    ( ! [X] :
        ( rR1(iV16460,X)
       => cC88(X) ) )).

%----iV16460
fof(axiom_144,axiom,
    ( ! [X] :
        ( rR1(iV16460,X)
       => cC50(X) ) )).

%----iV16460
fof(axiom_145,axiom,
    ( ! [X] :
        ( rR1(iV16460,X)
       => cC34(X) ) )).

%----iV16460
fof(axiom_146,axiom,
    ( cowlThing(iV16460) )).

%----iV16461
fof(axiom_147,axiom,
    ( ~ cC40(iV16461) )).

%----iV16461
fof(axiom_148,axiom,
    ( ! [X] :
        ( rR1(iV16461,X)
       => ~ cC52(X) ) )).

%----iV16461
fof(axiom_149,axiom,
    ( ~ cC92(iV16461) )).

%----iV16461
fof(axiom_150,axiom,
    ( ! [X] :
        ( rR1(iV16461,X)
       => ~ cC90(X) ) )).

%----iV16461
fof(axiom_151,axiom,
    ( ~ cC12(iV16461) )).

%----iV16461
fof(axiom_152,axiom,
    ( ~ cC54(iV16461) )).

%----iV16461
fof(axiom_153,axiom,
    ( ! [X] :
        ( rR1(iV16461,X)
       => ~ cC70(X) ) )).

%----iV16461
fof(axiom_154,axiom,
    ( ! [X] :
        ( rR1(iV16461,X)
       => cC38(X) ) )).

%----iV16461
fof(axiom_155,axiom,
    ( cowlThing(iV16461) )).

%----iV16461
fof(axiom_156,axiom,
    ( ~ cC72(iV16461) )).

fof(axiom_157,axiom,
    ( rR1(iV16461,iV16462) )).

%----iV16462
fof(axiom_158,axiom,
    ( ~ cC52(iV16462) )).

%----iV16462
fof(axiom_159,axiom,
    ( ~ cC8(iV16462) )).

%----iV16462
fof(axiom_160,axiom,
    ( ! [X] :
        ( rR1(iV16462,X)
       => cC68(X) ) )).

%----iV16462
fof(axiom_161,axiom,
    ( ~ cC36(iV16462) )).

%----iV16462
fof(axiom_162,axiom,
    ( cTOP(iV16462) )).

%----iV16462
fof(axiom_163,axiom,
    ( ~ cC90(iV16462) )).

%----iV16462
fof(axiom_164,axiom,
    ( ! [X] :
        ( rR1(iV16462,X)
       => cC34(X) ) )).

%----iV16462
fof(axiom_165,axiom,
    ( ! [X] :
        ( rR1(iV16462,X)
       => cC50(X) ) )).

%----iV16462
fof(axiom_166,axiom,
    ( ! [X] :
        ( rR1(iV16462,X)
       => cC88(X) ) )).

%----iV16462
fof(axiom_167,axiom,
    ( ~ cC70(iV16462) )).

%----iV16462
fof(axiom_168,axiom,
    ( cowlThing(iV16462) )).

%----iV16463
fof(axiom_169,axiom,
    ( ! [X] :
        ( rR1(iV16463,X)
       => ~ cC92(X) ) )).

%----iV16463
fof(axiom_170,axiom,
    ( ~ cC94(iV16463) )).

%----iV16463
fof(axiom_171,axiom,
    ( ! [X] :
        ( rR1(iV16463,X)
       => cC56(X) ) )).

%----iV16463
fof(axiom_172,axiom,
    ( ! [X] :
        ( rR1(iV16463,X)
       => ~ cC72(X) ) )).

%----iV16463
fof(axiom_173,axiom,
    ( ~ cC74(iV16463) )).

%----iV16463
fof(axiom_174,axiom,
    ( ~ cC58(iV16463) )).

%----iV16463
fof(axiom_175,axiom,
    ( ~ cC16(iV16463) )).

%----iV16463
fof(axiom_176,axiom,
    ( cowlThing(iV16463) )).

fof(axiom_177,axiom,
    ( rR1(iV16463,iV16464) )).

%----iV16464
fof(axiom_178,axiom,
    ( ~ cC72(iV16464) )).

%----iV16464
fof(axiom_179,axiom,
    ( ~ cC40(iV16464) )).

%----iV16464
fof(axiom_180,axiom,
    ( ! [X] :
        ( rR1(iV16464,X)
       => ~ cC70(X) ) )).

%----iV16464
fof(axiom_181,axiom,
    ( ~ cC54(iV16464) )).

%----iV16464
fof(axiom_182,axiom,
    ( ! [X] :
        ( rR1(iV16464,X)
       => cC38(X) ) )).

%----iV16464
fof(axiom_183,axiom,
    ( ~ cC12(iV16464) )).

%----iV16464
fof(axiom_184,axiom,
    ( ~ cC92(iV16464) )).

%----iV16464
fof(axiom_185,axiom,
    ( ! [X] :
        ( rR1(iV16464,X)
       => ~ cC90(X) ) )).

%----iV16464
fof(axiom_186,axiom,
    ( ! [X] :
        ( rR1(iV16464,X)
       => ~ cC52(X) ) )).

%----iV16464
fof(axiom_187,axiom,
    ( cowlThing(iV16464) )).

fof(axiom_188,axiom,
    ( rR1(iV16464,iV16465) )).

%----iV16465
fof(axiom_189,axiom,
    ( ! [X] :
        ( rR1(iV16465,X)
       => cC68(X) ) )).

%----iV16465
fof(axiom_190,axiom,
    ( ~ cC70(iV16465) )).

%----iV16465
fof(axiom_191,axiom,
    ( ~ cC52(iV16465) )).

%----iV16465
fof(axiom_192,axiom,
    ( ! [X] :
        ( rR1(iV16465,X)
       => cC88(X) ) )).

%----iV16465
fof(axiom_193,axiom,
    ( ! [X] :
        ( rR1(iV16465,X)
       => cC34(X) ) )).

%----iV16465
fof(axiom_194,axiom,
    ( ~ cC8(iV16465) )).

%----iV16465
fof(axiom_195,axiom,
    ( ~ cC36(iV16465) )).

%----iV16465
fof(axiom_196,axiom,
    ( cTOP(iV16465) )).

%----iV16465
fof(axiom_197,axiom,
    ( ! [X] :
        ( rR1(iV16465,X)
       => cC50(X) ) )).

%----iV16465
fof(axiom_198,axiom,
    ( cowlThing(iV16465) )).

%----iV16465
fof(axiom_199,axiom,
    ( ~ cC90(iV16465) )).

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
    & cC106(iV16439)
    & cC28(iV16439)
    & cC130(iV16439)
    & cowlThing(iV16439)
    & cC108(iV16439)
    & cC104(iV16439)
    & cC80(iV16440)
    & cowlThing(iV16440)
    & cC82(iV16440)
    & cC98(iV16440)
    & cowlThing(iV16448)
    & cC38(iV16448)
    & cC62(iV16453)
    & cowlThing(iV16453)
    & cC76(iV16453)
    & cC60(iV16453)
    & cC44(iV16455)
    & cowlThing(iV16455)
    & cC56(iV16455)
    & cC42(iV16455)
    & cowlThing(iV16457)
    & cC38(iV16457)
    & cC68(iV16459)
    & cowlThing(iV16459)
    & cC88(iV16459)
    & cC50(iV16459)
    & cC34(iV16459)
    & cowlThing(iV16460)
    & cC38(iV16460)
    & cC44(iV16461)
    & cowlThing(iV16461)
    & cC56(iV16461)
    & cC42(iV16461)
    & cowlThing(iV16462)
    & cC38(iV16462)
    & cC62(iV16463)
    & cowlThing(iV16463)
    & cC76(iV16463)
    & cC60(iV16463)
    & cC44(iV16464)
    & cowlThing(iV16464)
    & cC56(iV16464)
    & cC42(iV16464)
    & cowlThing(iV16465)
    & cC38(iV16465) )).

%------------------------------------------------------------------------------
