%------------------------------------------------------------------------------
% File     : HWV093+1 : TPTP v6.1.0. Released v6.1.0.
% Domain   : Hardware Verification
% Problem  : dmu_dmc property 6 cone of influence 5_b20
% Version  : Especial.
% English  : Verification of a property of the SPARCT2 RTL hardware design.

% Refs     : [Kha14] Khasidashvili (2014), Email to Geoff Sutcliffe
% Source   : [Kha14]
% Names    : dmu_dmc_prop6_cone5_b20 [Kha14]

% Status   : Theorem
% Rating   : 0.00 v6.1.0
% Syntax   : Number of formulae    : 1156 ( 233 unit)
%            Number of atoms       : 3946 ( 228 equality)
%            Maximal formula depth :  128 (   4 average)
%            Number of connectives : 3182 ( 392   ~; 338   |; 647   &)
%                                         (1467 <=>; 338  =>;   0  <=;   0 <~>)
%                                         (   0  ~|;   0  ~&)
%            Number of predicates  :  701 (   2 propositional; 0-2 arity)
%            Number of functors    :  398 ( 398 constant; 0-0 arity)
%            Number of variables   : 1096 (   0 sgn;1096   !;   0   ?)
%            Maximal term depth    :    1 (   1 average)
% SPC      : FOF_THM_EPR

% Comments : Copyright 2013 Moshe Emmer and Zurab Khasidashvili
%            Licensed under the Apache License, Version 2.0 (the "License");
%            you may not use this file except in compliance with the License.
%            You may obtain a copy of the License at
%                http://www.apache.org/licenses/LICENSE-2.0
%            Unless required by applicable law or agreed to in writing,
%            software distributed under the License is distributed on an "AS
%            IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
%            express or implied. See the License for the specific language
%            governing permissions and limitations under the License.
%------------------------------------------------------------------------------
fof(pathAxiom_8,axiom,(
    nextState(constB8,constB9) )).

fof(pathAxiom_7,axiom,(
    nextState(constB7,constB8) )).

fof(pathAxiom_6,axiom,(
    nextState(constB6,constB7) )).

fof(pathAxiom_5,axiom,(
    nextState(constB5,constB6) )).

fof(pathAxiom_4,axiom,(
    nextState(constB4,constB5) )).

fof(pathAxiom_3,axiom,(
    nextState(constB3,constB4) )).

fof(pathAxiom_2,axiom,(
    nextState(constB2,constB3) )).

fof(pathAxiom_1,axiom,(
    nextState(constB1,constB2) )).

fof(pathAxiom,axiom,(
    nextState(constB0,constB1) )).

fof(reachableStateAxiom_22,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( reachableState(VarCurr)
        & reachableState(VarNext) ) ) )).

fof(reachableStateAxiom_21,axiom,(
    ! [VarState] :
      ( reachableState(VarState)
     => ( constB0 = VarState
        | constB1 = VarState
        | constB2 = VarState
        | constB3 = VarState
        | constB4 = VarState
        | constB5 = VarState
        | constB6 = VarState
        | constB7 = VarState
        | constB8 = VarState
        | constB9 = VarState
        | constB10 = VarState
        | constB11 = VarState
        | constB12 = VarState
        | constB13 = VarState
        | constB14 = VarState
        | constB15 = VarState
        | constB16 = VarState
        | constB17 = VarState
        | constB18 = VarState
        | constB19 = VarState
        | constB20 = VarState ) ) )).

fof(reachableStateAxiom_20,axiom,(
    reachableState(constB20) )).

fof(reachableStateAxiom_19,axiom,(
    reachableState(constB19) )).

fof(reachableStateAxiom_18,axiom,(
    reachableState(constB18) )).

fof(reachableStateAxiom_17,axiom,(
    reachableState(constB17) )).

fof(reachableStateAxiom_16,axiom,(
    reachableState(constB16) )).

fof(reachableStateAxiom_15,axiom,(
    reachableState(constB15) )).

fof(reachableStateAxiom_14,axiom,(
    reachableState(constB14) )).

fof(reachableStateAxiom_13,axiom,(
    reachableState(constB13) )).

fof(reachableStateAxiom_12,axiom,(
    reachableState(constB12) )).

fof(reachableStateAxiom_11,axiom,(
    reachableState(constB11) )).

fof(reachableStateAxiom_10,axiom,(
    reachableState(constB10) )).

fof(reachableStateAxiom_9,axiom,(
    reachableState(constB9) )).

fof(reachableStateAxiom_8,axiom,(
    reachableState(constB8) )).

fof(reachableStateAxiom_7,axiom,(
    reachableState(constB7) )).

fof(reachableStateAxiom_6,axiom,(
    reachableState(constB6) )).

fof(reachableStateAxiom_5,axiom,(
    reachableState(constB5) )).

fof(reachableStateAxiom_4,axiom,(
    reachableState(constB4) )).

fof(reachableStateAxiom_3,axiom,(
    reachableState(constB3) )).

fof(reachableStateAxiom_2,axiom,(
    reachableState(constB2) )).

fof(reachableStateAxiom_1,axiom,(
    reachableState(constB1) )).

fof(reachableStateAxiom,axiom,(
    reachableState(constB0) )).

fof(clock_toggling,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( v1(VarCurr)
      <=> ~ v1(VarNext) ) ) )).

fof(clock_pattern,axiom,(
    ~ v1(constB0) )).

fof(addAssertion,conjecture,(
    ! [VarCurr] :
      ( reachableState(VarCurr)
     => v4(VarCurr) ) )).

fof(writeUnaryOperator_113,axiom,(
    ! [VarCurr] :
      ( ~ v4(VarCurr)
    <=> v995(VarCurr) ) )).

fof(writeUnaryOperator_112,axiom,(
    ! [VarCurr] :
      ( ~ v995(VarCurr)
    <=> v996(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_170,axiom,(
    ! [VarCurr] :
      ( v996(VarCurr)
    <=> ( v998(VarCurr)
        & v1010(VarCurr) ) ) )).

fof(writeBinaryOperatorShiftedRanges_80,axiom,(
    ! [VarCurr] :
      ( v1010(VarCurr)
    <=> ( v1000(VarCurr,bitIndex0)
        | v1000(VarCurr,bitIndex1) ) ) )).

fof(writeUnaryOperator_111,axiom,(
    ! [VarCurr] :
      ( ~ v998(VarCurr)
    <=> v999(VarCurr) ) )).

fof(writeBinaryOperatorShiftedRanges_79,axiom,(
    ! [VarCurr] :
      ( v999(VarCurr)
    <=> ( v1000(VarCurr,bitIndex0)
        & v1000(VarCurr,bitIndex1) ) ) )).

fof(addAssignment_245,axiom,(
    ! [VarCurr] :
      ( v1000(VarCurr,bitIndex0)
    <=> v1001(VarCurr) ) )).

fof(addAssignment_244,axiom,(
    ! [VarCurr] :
      ( v1000(VarCurr,bitIndex1)
    <=> $true ) )).

fof(writeBinaryOperatorShiftedRanges_78,axiom,(
    ! [VarCurr] :
      ( v1001(VarCurr)
    <=> ( v1003(VarCurr)
        & v1007(VarCurr,bitIndex5) ) ) )).

fof(writeBinaryOperatorShiftedRanges_77,axiom,(
    ! [VarCurr] :
      ( v1003(VarCurr)
    <=> ( v1004(VarCurr)
        & v1007(VarCurr,bitIndex4) ) ) )).

fof(writeBinaryOperatorShiftedRanges_76,axiom,(
    ! [VarCurr] :
      ( v1004(VarCurr)
    <=> ( v1005(VarCurr)
        & v1007(VarCurr,bitIndex3) ) ) )).

fof(writeBinaryOperatorShiftedRanges_75,axiom,(
    ! [VarCurr] :
      ( v1005(VarCurr)
    <=> ( v1006(VarCurr)
        & v1007(VarCurr,bitIndex2) ) ) )).

fof(writeBinaryOperatorShiftedRanges_74,axiom,(
    ! [VarCurr] :
      ( v1006(VarCurr)
    <=> ( v1007(VarCurr,bitIndex1)
        | v1008(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_169,axiom,(
    ! [VarCurr] :
      ( v1008(VarCurr)
    <=> ( v1007(VarCurr,bitIndex0)
        & v1009(VarCurr) ) ) )).

fof(writeUnaryOperator_110,axiom,(
    ! [VarCurr] :
      ( ~ v1009(VarCurr)
    <=> v1007(VarCurr,bitIndex1) ) )).

fof(addZeroExtensionConstraint_4,axiom,(
    ! [VarCurr] : ~ v1007(VarCurr,bitIndex4) )).

fof(addZeroExtensionConstraint_3,axiom,(
    ! [VarCurr] : ~ v1007(VarCurr,bitIndex5) )).

fof(addAssignment_243,axiom,(
    ! [VarCurr,B] :
      ( range_3_0(B)
     => ( v1007(VarCurr,B)
      <=> v8(VarCurr,B) ) ) )).

fof(addCaseBooleanConditionEqualRanges1_8,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( ~ v981(VarNext)
       => ! [B] :
            ( range_3_0(B)
           => ( v8(VarNext,B)
            <=> v8(VarCurr,B) ) ) ) ) )).

fof(addCaseBooleanConditionEqualRanges0_9,axiom,(
    ! [VarNext] :
      ( v981(VarNext)
     => ! [B] :
          ( range_3_0(B)
         => ( v8(VarNext,B)
          <=> v989(VarNext,B) ) ) ) )).

fof(addAssignment_242,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ! [B] :
          ( range_3_0(B)
         => ( v989(VarNext,B)
          <=> v987(VarCurr,B) ) ) ) )).

fof(aaddConditionBooleanCondEqualRangesElseBranch_43,axiom,(
    ! [VarCurr] :
      ( ~ v990(VarCurr)
     => ! [B] :
          ( range_3_0(B)
         => ( v987(VarCurr,B)
          <=> v23(VarCurr,B) ) ) ) )).

fof(addConditionBooleanCondEqualRangesThenBranch_44,axiom,(
    ! [VarCurr] :
      ( v990(VarCurr)
     => ! [B] :
          ( range_3_0(B)
         => ( v987(VarCurr,B)
          <=> $false ) ) ) )).

fof(writeUnaryOperator_109,axiom,(
    ! [VarCurr] :
      ( ~ v990(VarCurr)
    <=> v10(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_168,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( v981(VarNext)
      <=> v982(VarNext) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_167,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( v982(VarNext)
      <=> ( v983(VarNext)
          & v150(VarNext) ) ) ) )).

fof(writeUnaryOperator_108,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( ~ v983(VarNext)
      <=> v163(VarNext) ) ) )).

fof(aaddConditionBooleanCondEqualRangesElseBranch_42,axiom,(
    ! [VarCurr] :
      ( ~ v25(VarCurr)
     => ! [B] :
          ( range_3_0(B)
         => ( v23(VarCurr,B)
          <=> v8(VarCurr,B) ) ) ) )).

fof(addConditionBooleanCondEqualRangesThenBranch_43,axiom,(
    ! [VarCurr] :
      ( v25(VarCurr)
     => ! [B] :
          ( range_3_0(B)
         => ( v23(VarCurr,B)
          <=> v958(VarCurr,B) ) ) ) )).

fof(aaddConditionBooleanCondEqualRangesElseBranch_41,axiom,(
    ! [VarCurr] :
      ( ~ v959(VarCurr)
     => ! [B] :
          ( range_3_0(B)
         => ( v958(VarCurr,B)
          <=> v960(VarCurr,B) ) ) ) )).

fof(addConditionBooleanCondEqualRangesThenBranch_42,axiom,(
    ! [VarCurr] :
      ( v959(VarCurr)
     => ! [B] :
          ( range_3_0(B)
         => ( v958(VarCurr,B)
          <=> $false ) ) ) )).

fof(addAssignment_241,axiom,(
    ! [VarCurr] :
      ( v960(VarCurr,bitIndex0)
    <=> v976(VarCurr) ) )).

fof(addAssignment_240,axiom,(
    ! [VarCurr] :
      ( v960(VarCurr,bitIndex1)
    <=> v974(VarCurr) ) )).

fof(addAssignment_239,axiom,(
    ! [VarCurr] :
      ( v960(VarCurr,bitIndex2)
    <=> v969(VarCurr) ) )).

fof(addAssignment_238,axiom,(
    ! [VarCurr] :
      ( v960(VarCurr,bitIndex3)
    <=> v962(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_166,axiom,(
    ! [VarCurr] :
      ( v974(VarCurr)
    <=> ( v975(VarCurr)
        & v978(VarCurr) ) ) )).

fof(writeBinaryOperatorShiftedRanges_73,axiom,(
    ! [VarCurr] :
      ( v978(VarCurr)
    <=> ( v8(VarCurr,bitIndex0)
        | v8(VarCurr,bitIndex1) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_165,axiom,(
    ! [VarCurr] :
      ( v975(VarCurr)
    <=> ( v976(VarCurr)
        | v977(VarCurr) ) ) )).

fof(writeUnaryOperator_107,axiom,(
    ! [VarCurr] :
      ( ~ v977(VarCurr)
    <=> v8(VarCurr,bitIndex1) ) )).

fof(writeUnaryOperator_106,axiom,(
    ! [VarCurr] :
      ( ~ v976(VarCurr)
    <=> v8(VarCurr,bitIndex0) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_164,axiom,(
    ! [VarCurr] :
      ( v969(VarCurr)
    <=> ( v970(VarCurr)
        & v973(VarCurr) ) ) )).

fof(writeBinaryOperatorShiftedRanges_72,axiom,(
    ! [VarCurr] :
      ( v973(VarCurr)
    <=> ( v966(VarCurr)
        | v8(VarCurr,bitIndex2) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_163,axiom,(
    ! [VarCurr] :
      ( v970(VarCurr)
    <=> ( v971(VarCurr)
        | v972(VarCurr) ) ) )).

fof(writeUnaryOperator_105,axiom,(
    ! [VarCurr] :
      ( ~ v972(VarCurr)
    <=> v8(VarCurr,bitIndex2) ) )).

fof(writeUnaryOperator_104,axiom,(
    ! [VarCurr] :
      ( ~ v971(VarCurr)
    <=> v966(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_162,axiom,(
    ! [VarCurr] :
      ( v962(VarCurr)
    <=> ( v963(VarCurr)
        & v968(VarCurr) ) ) )).

fof(writeBinaryOperatorShiftedRanges_71,axiom,(
    ! [VarCurr] :
      ( v968(VarCurr)
    <=> ( v965(VarCurr)
        | v8(VarCurr,bitIndex3) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_161,axiom,(
    ! [VarCurr] :
      ( v963(VarCurr)
    <=> ( v964(VarCurr)
        | v967(VarCurr) ) ) )).

fof(writeUnaryOperator_103,axiom,(
    ! [VarCurr] :
      ( ~ v967(VarCurr)
    <=> v8(VarCurr,bitIndex3) ) )).

fof(writeUnaryOperator_102,axiom,(
    ! [VarCurr] :
      ( ~ v964(VarCurr)
    <=> v965(VarCurr) ) )).

fof(writeBinaryOperatorShiftedRanges_70,axiom,(
    ! [VarCurr] :
      ( v965(VarCurr)
    <=> ( v966(VarCurr)
        & v8(VarCurr,bitIndex2) ) ) )).

fof(writeBinaryOperatorShiftedRanges_69,axiom,(
    ! [VarCurr] :
      ( v966(VarCurr)
    <=> ( v8(VarCurr,bitIndex0)
        & v8(VarCurr,bitIndex1) ) ) )).

fof(addBitVectorEqualityBitBlasted_47,axiom,(
    ! [VarCurr] :
      ( v959(VarCurr)
    <=> ( ( v8(VarCurr,bitIndex3)
        <=> $true )
        & ( v8(VarCurr,bitIndex2)
        <=> $true )
        & ( v8(VarCurr,bitIndex1)
        <=> $true )
        & ( v8(VarCurr,bitIndex0)
        <=> $false ) ) ) )).

fof(bitBlastConstant_196,axiom,(
    b1110(bitIndex3) )).

fof(bitBlastConstant_195,axiom,(
    b1110(bitIndex2) )).

fof(bitBlastConstant_194,axiom,(
    b1110(bitIndex1) )).

fof(bitBlastConstant_193,axiom,(
    ~ b1110(bitIndex0) )).

fof(addAssignment_237,axiom,(
    ! [VarCurr] :
      ( v25(VarCurr)
    <=> v27(VarCurr) ) )).

fof(aaddConditionBooleanCondEqualRangesElseBranch_40,axiom,(
    ! [VarCurr] :
      ( ~ v950(VarCurr)
     => ( v27(VarCurr)
      <=> $false ) ) )).

fof(addConditionBooleanCondEqualRangesThenBranch_41,axiom,(
    ! [VarCurr] :
      ( v950(VarCurr)
     => ( v27(VarCurr)
      <=> v951(VarCurr) ) ) )).

fof(addParallelCaseBooleanConditionEqualRanges1_17,axiom,(
    ! [VarCurr] :
      ( ~ v803(VarCurr)
     => ( v951(VarCurr)
      <=> v954(VarCurr) ) ) )).

fof(addParallelCaseBooleanConditionEqualRanges0_16,axiom,(
    ! [VarCurr] :
      ( v803(VarCurr)
     => ( v951(VarCurr)
      <=> v952(VarCurr) ) ) )).

fof(aaddConditionBooleanCondEqualRangesElseBranch_39,axiom,(
    ! [VarCurr] :
      ( ~ v806(VarCurr)
     => ( v954(VarCurr)
      <=> v955(VarCurr) ) ) )).

fof(addConditionBooleanCondEqualRangesThenBranch_40,axiom,(
    ! [VarCurr] :
      ( v806(VarCurr)
     => ( v954(VarCurr)
      <=> $false ) ) )).

fof(aaddConditionBooleanCondEqualRangesElseBranch_38,axiom,(
    ! [VarCurr] :
      ( ~ v810(VarCurr)
     => ( v955(VarCurr)
      <=> $false ) ) )).

fof(addConditionBooleanCondEqualRangesThenBranch_39,axiom,(
    ! [VarCurr] :
      ( v810(VarCurr)
     => ( v955(VarCurr)
      <=> $true ) ) )).

fof(aaddConditionBooleanCondEqualRangesElseBranch_37,axiom,(
    ! [VarCurr] :
      ( ~ v802(VarCurr)
     => ( v952(VarCurr)
      <=> v953(VarCurr) ) ) )).

fof(addConditionBooleanCondEqualRangesThenBranch_38,axiom,(
    ! [VarCurr] :
      ( v802(VarCurr)
     => ( v952(VarCurr)
      <=> $true ) ) )).

fof(aaddConditionBooleanCondEqualRangesElseBranch_36,axiom,(
    ! [VarCurr] :
      ( ~ v832(VarCurr)
     => ( v953(VarCurr)
      <=> $false ) ) )).

fof(addConditionBooleanCondEqualRangesThenBranch_37,axiom,(
    ! [VarCurr] :
      ( v832(VarCurr)
     => ( v953(VarCurr)
      <=> $false ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_160,axiom,(
    ! [VarCurr] :
      ( v950(VarCurr)
    <=> ( v803(VarCurr)
        | v807(VarCurr) ) ) )).

fof(addCaseBooleanConditionEqualRanges1_7,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( ~ v938(VarNext)
       => ( v29(VarNext,bitIndex0)
        <=> v29(VarCurr,bitIndex0) ) ) ) )).

fof(addCaseBooleanConditionEqualRanges0_8,axiom,(
    ! [VarNext] :
      ( v938(VarNext)
     => ( v29(VarNext,bitIndex0)
      <=> v946(VarNext) ) ) )).

fof(addAssignment_236,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( v946(VarNext)
      <=> v944(VarCurr) ) ) )).

fof(aaddConditionBooleanCondEqualRangesElseBranch_35,axiom,(
    ! [VarCurr] :
      ( ~ v824(VarCurr)
     => ( v944(VarCurr)
      <=> v31(VarCurr,bitIndex0) ) ) )).

fof(addConditionBooleanCondEqualRangesThenBranch_36,axiom,(
    ! [VarCurr] :
      ( v824(VarCurr)
     => ( v944(VarCurr)
      <=> $true ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_159,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( v938(VarNext)
      <=> v939(VarNext) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_158,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( v939(VarNext)
      <=> ( v941(VarNext)
          & v152(VarNext) ) ) ) )).

fof(writeUnaryOperator_101,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( ~ v941(VarNext)
      <=> v817(VarNext) ) ) )).

fof(aaddConditionBooleanCondEqualRangesElseBranch_34,axiom,(
    ! [VarCurr] :
      ( ~ v930(VarCurr)
     => ( v31(VarCurr,bitIndex0)
      <=> $false ) ) )).

fof(addConditionBooleanCondEqualRangesThenBranch_35,axiom,(
    ! [VarCurr] :
      ( v930(VarCurr)
     => ( v31(VarCurr,bitIndex0)
      <=> v934(VarCurr) ) ) )).

fof(addParallelCaseBooleanConditionEqualRanges1_16,axiom,(
    ! [VarCurr] :
      ( ~ v931(VarCurr)
     => ( v934(VarCurr)
      <=> $true ) ) )).

fof(addParallelCaseBooleanConditionEqualRanges0_15,axiom,(
    ! [VarCurr] :
      ( v931(VarCurr)
     => ( v934(VarCurr)
      <=> v935(VarCurr) ) ) )).

fof(aaddConditionBooleanCondEqualRangesElseBranch_33,axiom,(
    ! [VarCurr] :
      ( ~ v832(VarCurr)
     => ( v935(VarCurr)
      <=> $true ) ) )).

fof(addConditionBooleanCondEqualRangesThenBranch_34,axiom,(
    ! [VarCurr] :
      ( v832(VarCurr)
     => ( v935(VarCurr)
      <=> $true ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_157,axiom,(
    ! [VarCurr] :
      ( v930(VarCurr)
    <=> ( v931(VarCurr)
        | v933(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_156,axiom,(
    ! [VarCurr] :
      ( v933(VarCurr)
    <=> ( v806(VarCurr)
        & v807(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_155,axiom,(
    ! [VarCurr] :
      ( v931(VarCurr)
    <=> ( v932(VarCurr)
        & v803(VarCurr) ) ) )).

fof(writeUnaryOperator_100,axiom,(
    ! [VarCurr] :
      ( ~ v932(VarCurr)
    <=> v802(VarCurr) ) )).

fof(addAssignment_235,axiom,(
    ! [VarCurr] :
      ( v175(VarCurr)
    <=> v177(VarCurr) ) )).

fof(addBitVectorEqualityBitBlasted_46,axiom,(
    ! [VarCurr] :
      ( v177(VarCurr)
    <=> ( ( v179(VarCurr,bitIndex4)
        <=> $false )
        & ( v179(VarCurr,bitIndex3)
        <=> $false )
        & ( v179(VarCurr,bitIndex2)
        <=> $false )
        & ( v179(VarCurr,bitIndex1)
        <=> $false )
        & ( v179(VarCurr,bitIndex0)
        <=> $false ) ) ) )).

fof(addCaseBooleanConditionEqualRanges1_6,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( ~ v914(VarNext)
       => ! [B] :
            ( range_4_0(B)
           => ( v179(VarNext,B)
            <=> v179(VarCurr,B) ) ) ) ) )).

fof(addCaseBooleanConditionEqualRanges0_7,axiom,(
    ! [VarNext] :
      ( v914(VarNext)
     => ! [B] :
          ( range_4_0(B)
         => ( v179(VarNext,B)
          <=> v924(VarNext,B) ) ) ) )).

fof(addAssignment_234,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ! [B] :
          ( range_4_0(B)
         => ( v924(VarNext,B)
          <=> v922(VarCurr,B) ) ) ) )).

fof(aaddConditionBooleanCondEqualRangesElseBranch_32,axiom,(
    ! [VarCurr] :
      ( ~ v925(VarCurr)
     => ! [B] :
          ( range_4_0(B)
         => ( v922(VarCurr,B)
          <=> v183(VarCurr,B) ) ) ) )).

fof(addConditionBooleanCondEqualRangesThenBranch_33,axiom,(
    ! [VarCurr] :
      ( v925(VarCurr)
     => ! [B] :
          ( range_4_0(B)
         => ( v922(VarCurr,B)
          <=> $false ) ) ) )).

fof(writeUnaryOperator_99,axiom,(
    ! [VarCurr] :
      ( ~ v925(VarCurr)
    <=> v181(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_154,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( v914(VarNext)
      <=> v915(VarNext) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_153,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( v915(VarNext)
      <=> ( v916(VarNext)
          & v911(VarNext) ) ) ) )).

fof(writeUnaryOperator_98,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( ~ v916(VarNext)
      <=> v918(VarNext) ) ) )).

fof(addAssignment_233,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( v918(VarNext)
      <=> v911(VarCurr) ) ) )).

fof(addAssignment_232,axiom,(
    ! [VarCurr] :
      ( v911(VarCurr)
    <=> v152(VarCurr) ) )).

fof(addParallelCaseBooleanConditionEqualRanges3_4,axiom,(
    ! [VarCurr] :
      ( ( ~ v836(VarCurr)
        & ~ v838(VarCurr)
        & ~ v879(VarCurr) )
     => ! [B] :
          ( range_4_0(B)
         => ( v183(VarCurr,B)
          <=> v179(VarCurr,B) ) ) ) )).

fof(addParallelCaseBooleanConditionEqualRanges2_7,axiom,(
    ! [VarCurr] :
      ( v879(VarCurr)
     => ! [B] :
          ( range_4_0(B)
         => ( v183(VarCurr,B)
          <=> v881(VarCurr,B) ) ) ) )).

fof(addParallelCaseBooleanConditionEqualRanges1_15,axiom,(
    ! [VarCurr] :
      ( v838(VarCurr)
     => ! [B] :
          ( range_4_0(B)
         => ( v183(VarCurr,B)
          <=> v840(VarCurr,B) ) ) ) )).

fof(addParallelCaseBooleanConditionEqualRanges0_14,axiom,(
    ! [VarCurr] :
      ( v836(VarCurr)
     => ! [B] :
          ( range_4_0(B)
         => ( v183(VarCurr,B)
          <=> v179(VarCurr,B) ) ) ) )).

fof(addBitVectorEqualityBitBlasted_45,axiom,(
    ! [VarCurr] :
      ( v908(VarCurr)
    <=> ( ( v909(VarCurr,bitIndex1)
        <=> $true )
        & ( v909(VarCurr,bitIndex0)
        <=> $true ) ) ) )).

fof(addAssignment_231,axiom,(
    ! [VarCurr] :
      ( v909(VarCurr,bitIndex0)
    <=> v796(VarCurr) ) )).

fof(addAssignment_230,axiom,(
    ! [VarCurr] :
      ( v909(VarCurr,bitIndex1)
    <=> v185(VarCurr) ) )).

fof(aaddConditionBooleanCondEqualRangesElseBranch_31,axiom,(
    ! [VarCurr] :
      ( ~ v882(VarCurr)
     => ! [B] :
          ( range_4_0(B)
         => ( v881(VarCurr,B)
          <=> v883(VarCurr,B) ) ) ) )).

fof(addConditionBooleanCondEqualRangesThenBranch_32,axiom,(
    ! [VarCurr] :
      ( v882(VarCurr)
     => ! [B] :
          ( range_4_0(B)
         => ( v881(VarCurr,B)
          <=> b01111(B) ) ) ) )).

fof(addAssignment_229,axiom,(
    ! [VarCurr] :
      ( v883(VarCurr,bitIndex0)
    <=> v905(VarCurr) ) )).

fof(addAssignment_228,axiom,(
    ! [VarCurr] :
      ( v883(VarCurr,bitIndex1)
    <=> v903(VarCurr) ) )).

fof(addAssignment_227,axiom,(
    ! [VarCurr] :
      ( v883(VarCurr,bitIndex2)
    <=> v898(VarCurr) ) )).

fof(addAssignment_226,axiom,(
    ! [VarCurr] :
      ( v883(VarCurr,bitIndex3)
    <=> v893(VarCurr) ) )).

fof(addAssignment_225,axiom,(
    ! [VarCurr] :
      ( v883(VarCurr,bitIndex4)
    <=> v885(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_152,axiom,(
    ! [VarCurr] :
      ( v903(VarCurr)
    <=> ( v904(VarCurr)
        & v907(VarCurr) ) ) )).

fof(writeBinaryOperatorShiftedRanges_68,axiom,(
    ! [VarCurr] :
      ( v907(VarCurr)
    <=> ( v179(VarCurr,bitIndex0)
        | v179(VarCurr,bitIndex1) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_151,axiom,(
    ! [VarCurr] :
      ( v904(VarCurr)
    <=> ( v905(VarCurr)
        | v906(VarCurr) ) ) )).

fof(writeUnaryOperator_97,axiom,(
    ! [VarCurr] :
      ( ~ v906(VarCurr)
    <=> v179(VarCurr,bitIndex1) ) )).

fof(writeUnaryOperator_96,axiom,(
    ! [VarCurr] :
      ( ~ v905(VarCurr)
    <=> v179(VarCurr,bitIndex0) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_150,axiom,(
    ! [VarCurr] :
      ( v898(VarCurr)
    <=> ( v899(VarCurr)
        & v902(VarCurr) ) ) )).

fof(writeBinaryOperatorShiftedRanges_67,axiom,(
    ! [VarCurr] :
      ( v902(VarCurr)
    <=> ( v890(VarCurr)
        | v179(VarCurr,bitIndex2) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_149,axiom,(
    ! [VarCurr] :
      ( v899(VarCurr)
    <=> ( v900(VarCurr)
        | v901(VarCurr) ) ) )).

fof(writeUnaryOperator_95,axiom,(
    ! [VarCurr] :
      ( ~ v901(VarCurr)
    <=> v179(VarCurr,bitIndex2) ) )).

fof(writeUnaryOperator_94,axiom,(
    ! [VarCurr] :
      ( ~ v900(VarCurr)
    <=> v890(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_148,axiom,(
    ! [VarCurr] :
      ( v893(VarCurr)
    <=> ( v894(VarCurr)
        & v897(VarCurr) ) ) )).

fof(writeBinaryOperatorShiftedRanges_66,axiom,(
    ! [VarCurr] :
      ( v897(VarCurr)
    <=> ( v889(VarCurr)
        | v179(VarCurr,bitIndex3) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_147,axiom,(
    ! [VarCurr] :
      ( v894(VarCurr)
    <=> ( v895(VarCurr)
        | v896(VarCurr) ) ) )).

fof(writeUnaryOperator_93,axiom,(
    ! [VarCurr] :
      ( ~ v896(VarCurr)
    <=> v179(VarCurr,bitIndex3) ) )).

fof(writeUnaryOperator_92,axiom,(
    ! [VarCurr] :
      ( ~ v895(VarCurr)
    <=> v889(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_146,axiom,(
    ! [VarCurr] :
      ( v885(VarCurr)
    <=> ( v886(VarCurr)
        & v892(VarCurr) ) ) )).

fof(writeBinaryOperatorShiftedRanges_65,axiom,(
    ! [VarCurr] :
      ( v892(VarCurr)
    <=> ( v888(VarCurr)
        | v179(VarCurr,bitIndex4) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_145,axiom,(
    ! [VarCurr] :
      ( v886(VarCurr)
    <=> ( v887(VarCurr)
        | v891(VarCurr) ) ) )).

fof(writeUnaryOperator_91,axiom,(
    ! [VarCurr] :
      ( ~ v891(VarCurr)
    <=> v179(VarCurr,bitIndex4) ) )).

fof(writeUnaryOperator_90,axiom,(
    ! [VarCurr] :
      ( ~ v887(VarCurr)
    <=> v888(VarCurr) ) )).

fof(writeBinaryOperatorShiftedRanges_64,axiom,(
    ! [VarCurr] :
      ( v888(VarCurr)
    <=> ( v889(VarCurr)
        & v179(VarCurr,bitIndex3) ) ) )).

fof(writeBinaryOperatorShiftedRanges_63,axiom,(
    ! [VarCurr] :
      ( v889(VarCurr)
    <=> ( v890(VarCurr)
        & v179(VarCurr,bitIndex2) ) ) )).

fof(writeBinaryOperatorShiftedRanges_62,axiom,(
    ! [VarCurr] :
      ( v890(VarCurr)
    <=> ( v179(VarCurr,bitIndex0)
        & v179(VarCurr,bitIndex1) ) ) )).

fof(addBitVectorEqualityBitBlasted_44,axiom,(
    ! [VarCurr] :
      ( v882(VarCurr)
    <=> ( ( v179(VarCurr,bitIndex4)
        <=> $false )
        & ( v179(VarCurr,bitIndex3)
        <=> $true )
        & ( v179(VarCurr,bitIndex2)
        <=> $true )
        & ( v179(VarCurr,bitIndex1)
        <=> $true )
        & ( v179(VarCurr,bitIndex0)
        <=> $true ) ) ) )).

fof(addBitVectorEqualityBitBlasted_43,axiom,(
    ! [VarCurr] :
      ( v879(VarCurr)
    <=> ( ( v880(VarCurr,bitIndex1)
        <=> $true )
        & ( v880(VarCurr,bitIndex0)
        <=> $false ) ) ) )).

fof(addAssignment_224,axiom,(
    ! [VarCurr] :
      ( v880(VarCurr,bitIndex0)
    <=> v796(VarCurr) ) )).

fof(addAssignment_223,axiom,(
    ! [VarCurr] :
      ( v880(VarCurr,bitIndex1)
    <=> v185(VarCurr) ) )).

fof(aaddConditionBooleanCondEqualRangesElseBranch_30,axiom,(
    ! [VarCurr] :
      ( ~ v841(VarCurr)
     => ! [B] :
          ( range_31_0(B)
         => ( v840(VarCurr,B)
          <=> v842(VarCurr,B) ) ) ) )).

fof(addConditionBooleanCondEqualRangesThenBranch_31,axiom,(
    ! [VarCurr] :
      ( v841(VarCurr)
     => ! [B] :
          ( range_31_0(B)
         => ( v840(VarCurr,B)
          <=> $false ) ) ) )).

fof(addSignExtensionConstraint_79,axiom,(
    ! [VarCurr] :
      ( v842(VarCurr,bitIndex6)
    <=> v843(VarCurr,bitIndex5) ) )).

fof(addSignExtensionConstraint_78,axiom,(
    ! [VarCurr] :
      ( v842(VarCurr,bitIndex7)
    <=> v843(VarCurr,bitIndex5) ) )).

fof(addSignExtensionConstraint_77,axiom,(
    ! [VarCurr] :
      ( v842(VarCurr,bitIndex8)
    <=> v843(VarCurr,bitIndex5) ) )).

fof(addSignExtensionConstraint_76,axiom,(
    ! [VarCurr] :
      ( v842(VarCurr,bitIndex9)
    <=> v843(VarCurr,bitIndex5) ) )).

fof(addSignExtensionConstraint_75,axiom,(
    ! [VarCurr] :
      ( v842(VarCurr,bitIndex10)
    <=> v843(VarCurr,bitIndex5) ) )).

fof(addSignExtensionConstraint_74,axiom,(
    ! [VarCurr] :
      ( v842(VarCurr,bitIndex11)
    <=> v843(VarCurr,bitIndex5) ) )).

fof(addSignExtensionConstraint_73,axiom,(
    ! [VarCurr] :
      ( v842(VarCurr,bitIndex12)
    <=> v843(VarCurr,bitIndex5) ) )).

fof(addSignExtensionConstraint_72,axiom,(
    ! [VarCurr] :
      ( v842(VarCurr,bitIndex13)
    <=> v843(VarCurr,bitIndex5) ) )).

fof(addSignExtensionConstraint_71,axiom,(
    ! [VarCurr] :
      ( v842(VarCurr,bitIndex14)
    <=> v843(VarCurr,bitIndex5) ) )).

fof(addSignExtensionConstraint_70,axiom,(
    ! [VarCurr] :
      ( v842(VarCurr,bitIndex15)
    <=> v843(VarCurr,bitIndex5) ) )).

fof(addSignExtensionConstraint_69,axiom,(
    ! [VarCurr] :
      ( v842(VarCurr,bitIndex16)
    <=> v843(VarCurr,bitIndex5) ) )).

fof(addSignExtensionConstraint_68,axiom,(
    ! [VarCurr] :
      ( v842(VarCurr,bitIndex17)
    <=> v843(VarCurr,bitIndex5) ) )).

fof(addSignExtensionConstraint_67,axiom,(
    ! [VarCurr] :
      ( v842(VarCurr,bitIndex18)
    <=> v843(VarCurr,bitIndex5) ) )).

fof(addSignExtensionConstraint_66,axiom,(
    ! [VarCurr] :
      ( v842(VarCurr,bitIndex19)
    <=> v843(VarCurr,bitIndex5) ) )).

fof(addSignExtensionConstraint_65,axiom,(
    ! [VarCurr] :
      ( v842(VarCurr,bitIndex20)
    <=> v843(VarCurr,bitIndex5) ) )).

fof(addSignExtensionConstraint_64,axiom,(
    ! [VarCurr] :
      ( v842(VarCurr,bitIndex21)
    <=> v843(VarCurr,bitIndex5) ) )).

fof(addSignExtensionConstraint_63,axiom,(
    ! [VarCurr] :
      ( v842(VarCurr,bitIndex22)
    <=> v843(VarCurr,bitIndex5) ) )).

fof(addSignExtensionConstraint_62,axiom,(
    ! [VarCurr] :
      ( v842(VarCurr,bitIndex23)
    <=> v843(VarCurr,bitIndex5) ) )).

fof(addSignExtensionConstraint_61,axiom,(
    ! [VarCurr] :
      ( v842(VarCurr,bitIndex24)
    <=> v843(VarCurr,bitIndex5) ) )).

fof(addSignExtensionConstraint_60,axiom,(
    ! [VarCurr] :
      ( v842(VarCurr,bitIndex25)
    <=> v843(VarCurr,bitIndex5) ) )).

fof(addSignExtensionConstraint_59,axiom,(
    ! [VarCurr] :
      ( v842(VarCurr,bitIndex26)
    <=> v843(VarCurr,bitIndex5) ) )).

fof(addSignExtensionConstraint_58,axiom,(
    ! [VarCurr] :
      ( v842(VarCurr,bitIndex27)
    <=> v843(VarCurr,bitIndex5) ) )).

fof(addSignExtensionConstraint_57,axiom,(
    ! [VarCurr] :
      ( v842(VarCurr,bitIndex28)
    <=> v843(VarCurr,bitIndex5) ) )).

fof(addSignExtensionConstraint_56,axiom,(
    ! [VarCurr] :
      ( v842(VarCurr,bitIndex29)
    <=> v843(VarCurr,bitIndex5) ) )).

fof(addSignExtensionConstraint_55,axiom,(
    ! [VarCurr] :
      ( v842(VarCurr,bitIndex30)
    <=> v843(VarCurr,bitIndex5) ) )).

fof(addSignExtensionConstraint_54,axiom,(
    ! [VarCurr] :
      ( v842(VarCurr,bitIndex31)
    <=> v843(VarCurr,bitIndex5) ) )).

fof(addAssignment_222,axiom,(
    ! [VarCurr,B] :
      ( range_5_0(B)
     => ( v842(VarCurr,B)
      <=> v843(VarCurr,B) ) ) )).

fof(addAssignment_221,axiom,(
    ! [VarCurr] :
      ( v843(VarCurr,bitIndex0)
    <=> v877(VarCurr) ) )).

fof(addAssignment_220,axiom,(
    ! [VarCurr] :
      ( v843(VarCurr,bitIndex1)
    <=> v875(VarCurr) ) )).

fof(addAssignment_219,axiom,(
    ! [VarCurr] :
      ( v843(VarCurr,bitIndex2)
    <=> v871(VarCurr) ) )).

fof(addAssignment_218,axiom,(
    ! [VarCurr] :
      ( v843(VarCurr,bitIndex3)
    <=> v867(VarCurr) ) )).

fof(addAssignment_217,axiom,(
    ! [VarCurr] :
      ( v843(VarCurr,bitIndex4)
    <=> v863(VarCurr) ) )).

fof(addAssignment_216,axiom,(
    ! [VarCurr] :
      ( v843(VarCurr,bitIndex5)
    <=> v845(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_144,axiom,(
    ! [VarCurr] :
      ( v875(VarCurr)
    <=> ( v876(VarCurr)
        & v878(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_143,axiom,(
    ! [VarCurr] :
      ( v878(VarCurr)
    <=> ( v849(VarCurr,bitIndex0)
        | v857(VarCurr) ) ) )).

fof(writeBinaryOperatorShiftedRanges_61,axiom,(
    ! [VarCurr] :
      ( v876(VarCurr)
    <=> ( v877(VarCurr)
        | v849(VarCurr,bitIndex1) ) ) )).

fof(writeUnaryOperator_89,axiom,(
    ! [VarCurr] :
      ( ~ v877(VarCurr)
    <=> v849(VarCurr,bitIndex0) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_142,axiom,(
    ! [VarCurr] :
      ( v871(VarCurr)
    <=> ( v872(VarCurr)
        & v874(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_141,axiom,(
    ! [VarCurr] :
      ( v874(VarCurr)
    <=> ( v855(VarCurr)
        | v858(VarCurr) ) ) )).

fof(writeBinaryOperatorShiftedRanges_60,axiom,(
    ! [VarCurr] :
      ( v872(VarCurr)
    <=> ( v873(VarCurr)
        | v849(VarCurr,bitIndex2) ) ) )).

fof(writeUnaryOperator_88,axiom,(
    ! [VarCurr] :
      ( ~ v873(VarCurr)
    <=> v855(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_140,axiom,(
    ! [VarCurr] :
      ( v867(VarCurr)
    <=> ( v868(VarCurr)
        & v870(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_139,axiom,(
    ! [VarCurr] :
      ( v870(VarCurr)
    <=> ( v853(VarCurr)
        | v859(VarCurr) ) ) )).

fof(writeBinaryOperatorShiftedRanges_59,axiom,(
    ! [VarCurr] :
      ( v868(VarCurr)
    <=> ( v869(VarCurr)
        | v849(VarCurr,bitIndex3) ) ) )).

fof(writeUnaryOperator_87,axiom,(
    ! [VarCurr] :
      ( ~ v869(VarCurr)
    <=> v853(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_138,axiom,(
    ! [VarCurr] :
      ( v863(VarCurr)
    <=> ( v864(VarCurr)
        & v866(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_137,axiom,(
    ! [VarCurr] :
      ( v866(VarCurr)
    <=> ( v851(VarCurr)
        | v860(VarCurr) ) ) )).

fof(writeBinaryOperatorShiftedRanges_58,axiom,(
    ! [VarCurr] :
      ( v864(VarCurr)
    <=> ( v865(VarCurr)
        | v849(VarCurr,bitIndex4) ) ) )).

fof(writeUnaryOperator_86,axiom,(
    ! [VarCurr] :
      ( ~ v865(VarCurr)
    <=> v851(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_136,axiom,(
    ! [VarCurr] :
      ( v845(VarCurr)
    <=> ( v846(VarCurr)
        & v861(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_135,axiom,(
    ! [VarCurr] :
      ( v861(VarCurr)
    <=> ( v848(VarCurr)
        | v862(VarCurr) ) ) )).

fof(writeUnaryOperator_85,axiom,(
    ! [VarCurr] :
      ( ~ v862(VarCurr)
    <=> v849(VarCurr,bitIndex5) ) )).

fof(writeBinaryOperatorShiftedRanges_57,axiom,(
    ! [VarCurr] :
      ( v846(VarCurr)
    <=> ( v847(VarCurr)
        | v849(VarCurr,bitIndex5) ) ) )).

fof(writeUnaryOperator_84,axiom,(
    ! [VarCurr] :
      ( ~ v847(VarCurr)
    <=> v848(VarCurr) ) )).

fof(writeBinaryOperatorShiftedRanges_56,axiom,(
    ! [VarCurr] :
      ( v848(VarCurr)
    <=> ( v849(VarCurr,bitIndex4)
        | v850(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_134,axiom,(
    ! [VarCurr] :
      ( v850(VarCurr)
    <=> ( v851(VarCurr)
        & v860(VarCurr) ) ) )).

fof(writeUnaryOperator_83,axiom,(
    ! [VarCurr] :
      ( ~ v860(VarCurr)
    <=> v849(VarCurr,bitIndex4) ) )).

fof(writeBinaryOperatorShiftedRanges_55,axiom,(
    ! [VarCurr] :
      ( v851(VarCurr)
    <=> ( v849(VarCurr,bitIndex3)
        | v852(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_133,axiom,(
    ! [VarCurr] :
      ( v852(VarCurr)
    <=> ( v853(VarCurr)
        & v859(VarCurr) ) ) )).

fof(writeUnaryOperator_82,axiom,(
    ! [VarCurr] :
      ( ~ v859(VarCurr)
    <=> v849(VarCurr,bitIndex3) ) )).

fof(writeBinaryOperatorShiftedRanges_54,axiom,(
    ! [VarCurr] :
      ( v853(VarCurr)
    <=> ( v849(VarCurr,bitIndex2)
        | v854(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_132,axiom,(
    ! [VarCurr] :
      ( v854(VarCurr)
    <=> ( v855(VarCurr)
        & v858(VarCurr) ) ) )).

fof(writeUnaryOperator_81,axiom,(
    ! [VarCurr] :
      ( ~ v858(VarCurr)
    <=> v849(VarCurr,bitIndex2) ) )).

fof(writeBinaryOperatorShiftedRanges_53,axiom,(
    ! [VarCurr] :
      ( v855(VarCurr)
    <=> ( v849(VarCurr,bitIndex1)
        | v856(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_131,axiom,(
    ! [VarCurr] :
      ( v856(VarCurr)
    <=> ( v849(VarCurr,bitIndex0)
        & v857(VarCurr) ) ) )).

fof(writeUnaryOperator_80,axiom,(
    ! [VarCurr] :
      ( ~ v857(VarCurr)
    <=> v849(VarCurr,bitIndex1) ) )).

fof(addZeroExtensionConstraint_2,axiom,(
    ! [VarCurr] : ~ v849(VarCurr,bitIndex5) )).

fof(addAssignment_215,axiom,(
    ! [VarCurr,B] :
      ( range_4_0(B)
     => ( v849(VarCurr,B)
      <=> v179(VarCurr,B) ) ) )).

fof(addBitVectorEqualityBitBlasted_42,axiom,(
    ! [VarCurr] :
      ( v841(VarCurr)
    <=> ( ( v179(VarCurr,bitIndex4)
        <=> $false )
        & ( v179(VarCurr,bitIndex3)
        <=> $false )
        & ( v179(VarCurr,bitIndex2)
        <=> $false )
        & ( v179(VarCurr,bitIndex1)
        <=> $false )
        & ( v179(VarCurr,bitIndex0)
        <=> $false ) ) ) )).

fof(addBitVectorEqualityBitBlasted_41,axiom,(
    ! [VarCurr] :
      ( v838(VarCurr)
    <=> ( ( v839(VarCurr,bitIndex1)
        <=> $false )
        & ( v839(VarCurr,bitIndex0)
        <=> $true ) ) ) )).

fof(addAssignment_214,axiom,(
    ! [VarCurr] :
      ( v839(VarCurr,bitIndex0)
    <=> v796(VarCurr) ) )).

fof(addAssignment_213,axiom,(
    ! [VarCurr] :
      ( v839(VarCurr,bitIndex1)
    <=> v185(VarCurr) ) )).

fof(addAssignmentInitValueVector_3,axiom,(
    ! [B] :
      ( range_4_0(B)
     => ( v179(constB0,B)
      <=> $false ) ) )).

fof(addBitVectorEqualityBitBlasted_40,axiom,(
    ! [VarCurr] :
      ( v836(VarCurr)
    <=> ( ( v837(VarCurr,bitIndex1)
        <=> $false )
        & ( v837(VarCurr,bitIndex0)
        <=> $false ) ) ) )).

fof(addAssignment_212,axiom,(
    ! [VarCurr] :
      ( v837(VarCurr,bitIndex0)
    <=> v796(VarCurr) ) )).

fof(addAssignment_211,axiom,(
    ! [VarCurr] :
      ( v837(VarCurr,bitIndex1)
    <=> v185(VarCurr) ) )).

fof(addAssignment_210,axiom,(
    ! [VarCurr] :
      ( v796(VarCurr)
    <=> v798(VarCurr) ) )).

fof(aaddConditionBooleanCondEqualRangesElseBranch_29,axiom,(
    ! [VarCurr] :
      ( ~ v828(VarCurr)
     => ( v798(VarCurr)
      <=> $false ) ) )).

fof(addConditionBooleanCondEqualRangesThenBranch_30,axiom,(
    ! [VarCurr] :
      ( v828(VarCurr)
     => ( v798(VarCurr)
      <=> v829(VarCurr) ) ) )).

fof(addParallelCaseBooleanConditionEqualRanges1_14,axiom,(
    ! [VarCurr] :
      ( ~ v803(VarCurr)
     => ( v829(VarCurr)
      <=> v833(VarCurr) ) ) )).

fof(addParallelCaseBooleanConditionEqualRanges0_13,axiom,(
    ! [VarCurr] :
      ( v803(VarCurr)
     => ( v829(VarCurr)
      <=> v830(VarCurr) ) ) )).

fof(aaddConditionBooleanCondEqualRangesElseBranch_28,axiom,(
    ! [VarCurr] :
      ( ~ v806(VarCurr)
     => ( v833(VarCurr)
      <=> v834(VarCurr) ) ) )).

fof(addConditionBooleanCondEqualRangesThenBranch_29,axiom,(
    ! [VarCurr] :
      ( v806(VarCurr)
     => ( v833(VarCurr)
      <=> $true ) ) )).

fof(aaddConditionBooleanCondEqualRangesElseBranch_27,axiom,(
    ! [VarCurr] :
      ( ~ v810(VarCurr)
     => ( v834(VarCurr)
      <=> $false ) ) )).

fof(addConditionBooleanCondEqualRangesThenBranch_28,axiom,(
    ! [VarCurr] :
      ( v810(VarCurr)
     => ( v834(VarCurr)
      <=> $false ) ) )).

fof(aaddConditionBooleanCondEqualRangesElseBranch_26,axiom,(
    ! [VarCurr] :
      ( ~ v802(VarCurr)
     => ( v830(VarCurr)
      <=> v831(VarCurr) ) ) )).

fof(addConditionBooleanCondEqualRangesThenBranch_27,axiom,(
    ! [VarCurr] :
      ( v802(VarCurr)
     => ( v830(VarCurr)
      <=> $false ) ) )).

fof(aaddConditionBooleanCondEqualRangesElseBranch_25,axiom,(
    ! [VarCurr] :
      ( ~ v832(VarCurr)
     => ( v831(VarCurr)
      <=> $false ) ) )).

fof(addConditionBooleanCondEqualRangesThenBranch_26,axiom,(
    ! [VarCurr] :
      ( v832(VarCurr)
     => ( v831(VarCurr)
      <=> $true ) ) )).

fof(writeUnaryOperator_79,axiom,(
    ! [VarCurr] :
      ( ~ v832(VarCurr)
    <=> v175(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_130,axiom,(
    ! [VarCurr] :
      ( v828(VarCurr)
    <=> ( v803(VarCurr)
        | v807(VarCurr) ) ) )).

fof(addCaseBooleanConditionEqualRanges1_5,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( ~ v813(VarNext)
       => ( v29(VarNext,bitIndex1)
        <=> v29(VarCurr,bitIndex1) ) ) ) )).

fof(addCaseBooleanConditionShiftedRanges0,axiom,(
    ! [VarNext] :
      ( v813(VarNext)
     => ( v29(VarNext,bitIndex1)
      <=> v823(VarNext) ) ) )).

fof(addAssignment_209,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( v823(VarNext)
      <=> v821(VarCurr) ) ) )).

fof(addConditionBooleanCondShiftedRangesElseBranch_1,axiom,(
    ! [VarCurr] :
      ( ~ v824(VarCurr)
     => ( v821(VarCurr)
      <=> v31(VarCurr,bitIndex1) ) ) )).

fof(addConditionBooleanCondEqualRangesThenBranch_25,axiom,(
    ! [VarCurr] :
      ( v824(VarCurr)
     => ( v821(VarCurr)
      <=> $false ) ) )).

fof(writeUnaryOperator_78,axiom,(
    ! [VarCurr] :
      ( ~ v824(VarCurr)
    <=> v12(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_129,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( v813(VarNext)
      <=> v814(VarNext) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_128,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( v814(VarNext)
      <=> ( v815(VarNext)
          & v152(VarNext) ) ) ) )).

fof(writeUnaryOperator_77,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( ~ v815(VarNext)
      <=> v817(VarNext) ) ) )).

fof(addAssignment_208,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( v817(VarNext)
      <=> v152(VarCurr) ) ) )).

fof(addConditionBooleanCondShiftedRangesElseBranch,axiom,(
    ! [VarCurr] :
      ( ~ v800(VarCurr)
     => ( v31(VarCurr,bitIndex1)
      <=> $false ) ) )).

fof(addConditionBooleanCondShiftedRangesThenBranch,axiom,(
    ! [VarCurr] :
      ( v800(VarCurr)
     => ( v31(VarCurr,bitIndex1)
      <=> v808(VarCurr) ) ) )).

fof(addParallelCaseBooleanConditionEqualRanges1_13,axiom,(
    ! [VarCurr] :
      ( ~ v801(VarCurr)
     => ( v808(VarCurr)
      <=> v809(VarCurr) ) ) )).

fof(addParallelCaseBooleanConditionEqualRanges0_12,axiom,(
    ! [VarCurr] :
      ( v801(VarCurr)
     => ( v808(VarCurr)
      <=> $true ) ) )).

fof(aaddConditionBooleanCondEqualRangesElseBranch_24,axiom,(
    ! [VarCurr] :
      ( ~ v810(VarCurr)
     => ( v809(VarCurr)
      <=> $true ) ) )).

fof(addConditionBooleanCondEqualRangesThenBranch_24,axiom,(
    ! [VarCurr] :
      ( v810(VarCurr)
     => ( v809(VarCurr)
      <=> $true ) ) )).

fof(writeUnaryOperator_76,axiom,(
    ! [VarCurr] :
      ( ~ v810(VarCurr)
    <=> v33(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_127,axiom,(
    ! [VarCurr] :
      ( v800(VarCurr)
    <=> ( v801(VarCurr)
        | v804(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_126,axiom,(
    ! [VarCurr] :
      ( v804(VarCurr)
    <=> ( v805(VarCurr)
        & v807(VarCurr) ) ) )).

fof(addBitVectorEqualityBitBlasted_39,axiom,(
    ! [VarCurr] :
      ( v807(VarCurr)
    <=> ( $true
      <=> v29(VarCurr,bitIndex1) ) ) )).

fof(writeUnaryOperator_75,axiom,(
    ! [VarCurr] :
      ( ~ v805(VarCurr)
    <=> v806(VarCurr) ) )).

fof(writeUnaryOperator_74,axiom,(
    ! [VarCurr] :
      ( ~ v806(VarCurr)
    <=> v175(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_125,axiom,(
    ! [VarCurr] :
      ( v801(VarCurr)
    <=> ( v802(VarCurr)
        & v803(VarCurr) ) ) )).

fof(addBitVectorEqualityBitBlasted_38,axiom,(
    ! [VarCurr] :
      ( v803(VarCurr)
    <=> ( $true
      <=> v29(VarCurr,bitIndex0) ) ) )).

fof(addAssignmentInitValueVector_2,axiom,
    ( v29(constB0,bitIndex1)
  <=> $false )).

fof(addAssignmentInitValueVector_1,axiom,
    ( v29(constB0,bitIndex0)
  <=> $true )).

fof(writeUnaryOperator_73,axiom,(
    ! [VarCurr] :
      ( ~ v802(VarCurr)
    <=> v33(VarCurr) ) )).

fof(addAssignment_207,axiom,(
    ! [VarCurr] :
      ( v185(VarCurr)
    <=> v187(VarCurr) ) )).

fof(addAssignment_206,axiom,(
    ! [VarCurr] :
      ( v187(VarCurr)
    <=> v189(VarCurr) ) )).

fof(addAssignment_205,axiom,(
    ! [VarCurr] :
      ( v189(VarCurr)
    <=> v191(VarCurr) ) )).

fof(addAssignment_204,axiom,(
    ! [VarCurr] :
      ( v191(VarCurr)
    <=> v193(VarCurr) ) )).

fof(addAssignment_203,axiom,(
    ! [VarCurr] :
      ( v193(VarCurr)
    <=> v195(VarCurr) ) )).

fof(addCaseBooleanConditionEqualRanges1_4,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( ~ v783(VarNext)
       => ( v195(VarNext)
        <=> v195(VarCurr) ) ) ) )).

fof(addCaseBooleanConditionEqualRanges0_6,axiom,(
    ! [VarNext] :
      ( v783(VarNext)
     => ( v195(VarNext)
      <=> v791(VarNext) ) ) )).

fof(addAssignment_202,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( v791(VarNext)
      <=> v789(VarCurr) ) ) )).

fof(aaddConditionBooleanCondEqualRangesElseBranch_23,axiom,(
    ! [VarCurr] :
      ( ~ v792(VarCurr)
     => ( v789(VarCurr)
      <=> v201(VarCurr) ) ) )).

fof(addConditionBooleanCondEqualRangesThenBranch_23,axiom,(
    ! [VarCurr] :
      ( v792(VarCurr)
     => ( v789(VarCurr)
      <=> $false ) ) )).

fof(writeUnaryOperator_72,axiom,(
    ! [VarCurr] :
      ( ~ v792(VarCurr)
    <=> v197(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_124,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( v783(VarNext)
      <=> v784(VarNext) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_123,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( v784(VarNext)
      <=> ( v785(VarNext)
          & v438(VarNext) ) ) ) )).

fof(writeUnaryOperator_71,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( ~ v785(VarNext)
      <=> v447(VarNext) ) ) )).

fof(aaddConditionBooleanCondEqualRangesElseBranch_22,axiom,(
    ! [VarCurr] :
      ( ~ v775(VarCurr)
     => ( v201(VarCurr)
      <=> $false ) ) )).

fof(addConditionBooleanCondEqualRangesThenBranch_22,axiom,(
    ! [VarCurr] :
      ( v775(VarCurr)
     => ( v201(VarCurr)
      <=> v780(VarCurr) ) ) )).

fof(addParallelCaseBooleanConditionEqualRanges1_12,axiom,(
    ! [VarCurr] :
      ( ~ v777(VarCurr)
     => ( v780(VarCurr)
      <=> $false ) ) )).

fof(addParallelCaseBooleanConditionEqualRanges0_11,axiom,(
    ! [VarCurr] :
      ( v777(VarCurr)
     => ( v780(VarCurr)
      <=> $true ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_122,axiom,(
    ! [VarCurr] :
      ( v775(VarCurr)
    <=> ( v776(VarCurr)
        & v779(VarCurr) ) ) )).

fof(writeUnaryOperator_70,axiom,(
    ! [VarCurr] :
      ( ~ v779(VarCurr)
    <=> v385(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_121,axiom,(
    ! [VarCurr] :
      ( v776(VarCurr)
    <=> ( v777(VarCurr)
        | v778(VarCurr) ) ) )).

fof(writeUnaryOperator_69,axiom,(
    ! [VarCurr] :
      ( ~ v778(VarCurr)
    <=> v382(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_120,axiom,(
    ! [VarCurr] :
      ( v777(VarCurr)
    <=> ( v550(VarCurr)
        & v382(VarCurr) ) ) )).

fof(aaddConditionBooleanCondEqualRangesElseBranch_21,axiom,(
    ! [VarCurr] :
      ( ~ v205(VarCurr)
     => ! [B] :
          ( range_1_0(B)
         => ( v203(VarCurr,B)
          <=> v705(VarCurr,B) ) ) ) )).

fof(addConditionBooleanCondEqualRangesThenBranch_21,axiom,(
    ! [VarCurr] :
      ( v205(VarCurr)
     => ! [B] :
          ( range_1_0(B)
         => ( v203(VarCurr,B)
          <=> $false ) ) ) )).

fof(addParallelCaseBooleanConditionEqualRanges4,axiom,(
    ! [VarCurr] :
      ( ( ~ v706(VarCurr)
        & ~ v743(VarCurr)
        & ~ v751(VarCurr)
        & ~ v759(VarCurr) )
     => ! [B] :
          ( range_1_0(B)
         => ( v705(VarCurr,B)
          <=> $true ) ) ) )).

fof(addParallelCaseBooleanConditionEqualRanges3_3,axiom,(
    ! [VarCurr] :
      ( v759(VarCurr)
     => ! [B] :
          ( range_1_0(B)
         => ( v705(VarCurr,B)
          <=> b01(B) ) ) ) )).

fof(addParallelCaseBooleanConditionEqualRanges2_6,axiom,(
    ! [VarCurr] :
      ( v751(VarCurr)
     => ! [B] :
          ( range_1_0(B)
         => ( v705(VarCurr,B)
          <=> $false ) ) ) )).

fof(addParallelCaseBooleanConditionEqualRanges1_11,axiom,(
    ! [VarCurr] :
      ( v743(VarCurr)
     => ! [B] :
          ( range_1_0(B)
         => ( v705(VarCurr,B)
          <=> v750(VarCurr,B) ) ) ) )).

fof(addParallelCaseBooleanConditionEqualRanges0_10,axiom,(
    ! [VarCurr] :
      ( v706(VarCurr)
     => ! [B] :
          ( range_1_0(B)
         => ( v705(VarCurr,B)
          <=> $false ) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_119,axiom,(
    ! [VarCurr] :
      ( v759(VarCurr)
    <=> ( v761(VarCurr)
        | v770(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_118,axiom,(
    ! [VarCurr] :
      ( v770(VarCurr)
    <=> ( v772(VarCurr)
        & v725(VarCurr) ) ) )).

fof(writeBinaryOperatorShiftedRanges_52,axiom,(
    ! [VarCurr] :
      ( v772(VarCurr)
    <=> ( v773(VarCurr)
        & v593(VarCurr,bitIndex5) ) ) )).

fof(writeBinaryOperatorShiftedRanges_51,axiom,(
    ! [VarCurr] :
      ( v773(VarCurr)
    <=> ( v722(VarCurr)
        & v593(VarCurr,bitIndex4) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_117,axiom,(
    ! [VarCurr] :
      ( v761(VarCurr)
    <=> ( v762(VarCurr)
        | v767(VarCurr) ) ) )).

fof(writeBinaryOperatorShiftedRanges_50,axiom,(
    ! [VarCurr] :
      ( v767(VarCurr)
    <=> ( v769(VarCurr)
        & v593(VarCurr,bitIndex6) ) ) )).

fof(writeBinaryOperatorShiftedRanges_49,axiom,(
    ! [VarCurr] :
      ( v769(VarCurr)
    <=> ( v765(VarCurr)
        & v593(VarCurr,bitIndex5) ) ) )).

fof(writeBinaryOperatorShiftedRanges_48,axiom,(
    ! [VarCurr] :
      ( v762(VarCurr)
    <=> ( v764(VarCurr)
        & v593(VarCurr,bitIndex6) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_116,axiom,(
    ! [VarCurr] :
      ( v764(VarCurr)
    <=> ( v765(VarCurr)
        & v724(VarCurr) ) ) )).

fof(writeBinaryOperatorShiftedRanges_47,axiom,(
    ! [VarCurr] :
      ( v765(VarCurr)
    <=> ( v766(VarCurr)
        & v593(VarCurr,bitIndex4) ) ) )).

fof(writeBinaryOperatorShiftedRanges_46,axiom,(
    ! [VarCurr] :
      ( v766(VarCurr)
    <=> ( v717(VarCurr)
        & v593(VarCurr,bitIndex3) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_115,axiom,(
    ! [VarCurr] :
      ( v751(VarCurr)
    <=> ( v752(VarCurr)
        | v754(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_114,axiom,(
    ! [VarCurr] :
      ( v754(VarCurr)
    <=> ( v756(VarCurr)
        & v725(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_113,axiom,(
    ! [VarCurr] :
      ( v756(VarCurr)
    <=> ( v757(VarCurr)
        & v724(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_112,axiom,(
    ! [VarCurr] :
      ( v757(VarCurr)
    <=> ( v758(VarCurr)
        & v723(VarCurr) ) ) )).

fof(writeBinaryOperatorShiftedRanges_45,axiom,(
    ! [VarCurr] :
      ( v758(VarCurr)
    <=> ( v734(VarCurr)
        & v593(VarCurr,bitIndex3) ) ) )).

fof(writeBinaryOperatorShiftedRanges_44,axiom,(
    ! [VarCurr] :
      ( v752(VarCurr)
    <=> ( v745(VarCurr)
        & v593(VarCurr,bitIndex6) ) ) )).

fof(aaddConditionBooleanCondEqualRangesElseBranch_20,axiom,(
    ! [VarCurr] :
      ( ~ v690(VarCurr)
     => ! [B] :
          ( range_1_0(B)
         => ( v750(VarCurr,B)
          <=> $false ) ) ) )).

fof(addConditionBooleanCondEqualRangesThenBranch_20,axiom,(
    ! [VarCurr] :
      ( v690(VarCurr)
     => ! [B] :
          ( range_1_0(B)
         => ( v750(VarCurr,B)
          <=> b10(B) ) ) ) )).

fof(range_axiom_10,axiom,(
    ! [B] :
      ( range_1_0(B)
    <=> ( $false
        | bitIndex0 = B
        | bitIndex1 = B ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_111,axiom,(
    ! [VarCurr] :
      ( v743(VarCurr)
    <=> ( v745(VarCurr)
        & v725(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_110,axiom,(
    ! [VarCurr] :
      ( v745(VarCurr)
    <=> ( v746(VarCurr)
        & v724(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_109,axiom,(
    ! [VarCurr] :
      ( v746(VarCurr)
    <=> ( v747(VarCurr)
        & v723(VarCurr) ) ) )).

fof(writeBinaryOperatorShiftedRanges_43,axiom,(
    ! [VarCurr] :
      ( v747(VarCurr)
    <=> ( v748(VarCurr)
        & v593(VarCurr,bitIndex3) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_108,axiom,(
    ! [VarCurr] :
      ( v748(VarCurr)
    <=> ( v749(VarCurr)
        & v721(VarCurr) ) ) )).

fof(writeBinaryOperatorShiftedRanges_42,axiom,(
    ! [VarCurr] :
      ( v749(VarCurr)
    <=> ( v719(VarCurr)
        & v593(VarCurr,bitIndex1) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_107,axiom,(
    ! [VarCurr] :
      ( v706(VarCurr)
    <=> ( v708(VarCurr)
        | v741(VarCurr) ) ) )).

fof(writeBinaryOperatorShiftedRanges_41,axiom,(
    ! [VarCurr] :
      ( v741(VarCurr)
    <=> ( v728(VarCurr)
        & v593(VarCurr,bitIndex6) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_106,axiom,(
    ! [VarCurr] :
      ( v708(VarCurr)
    <=> ( v709(VarCurr)
        | v739(VarCurr) ) ) )).

fof(writeBinaryOperatorShiftedRanges_40,axiom,(
    ! [VarCurr] :
      ( v739(VarCurr)
    <=> ( v714(VarCurr)
        & v593(VarCurr,bitIndex6) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_105,axiom,(
    ! [VarCurr] :
      ( v709(VarCurr)
    <=> ( v710(VarCurr)
        | v736(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_104,axiom,(
    ! [VarCurr] :
      ( v736(VarCurr)
    <=> ( v738(VarCurr)
        & v725(VarCurr) ) ) )).

fof(writeBinaryOperatorShiftedRanges_39,axiom,(
    ! [VarCurr] :
      ( v738(VarCurr)
    <=> ( v732(VarCurr)
        & v593(VarCurr,bitIndex5) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_103,axiom,(
    ! [VarCurr] :
      ( v710(VarCurr)
    <=> ( v711(VarCurr)
        | v729(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_102,axiom,(
    ! [VarCurr] :
      ( v729(VarCurr)
    <=> ( v731(VarCurr)
        & v725(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_101,axiom,(
    ! [VarCurr] :
      ( v731(VarCurr)
    <=> ( v732(VarCurr)
        & v724(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_100,axiom,(
    ! [VarCurr] :
      ( v732(VarCurr)
    <=> ( v733(VarCurr)
        & v723(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_99,axiom,(
    ! [VarCurr] :
      ( v733(VarCurr)
    <=> ( v734(VarCurr)
        & v722(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_98,axiom,(
    ! [VarCurr] :
      ( v734(VarCurr)
    <=> ( v735(VarCurr)
        & v721(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_97,axiom,(
    ! [VarCurr] :
      ( v735(VarCurr)
    <=> ( v593(VarCurr,bitIndex0)
        & v720(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_96,axiom,(
    ! [VarCurr] :
      ( v711(VarCurr)
    <=> ( v712(VarCurr)
        | v726(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_95,axiom,(
    ! [VarCurr] :
      ( v726(VarCurr)
    <=> ( v728(VarCurr)
        & v725(VarCurr) ) ) )).

fof(writeBinaryOperatorShiftedRanges_38,axiom,(
    ! [VarCurr] :
      ( v728(VarCurr)
    <=> ( v715(VarCurr)
        & v593(VarCurr,bitIndex5) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_94,axiom,(
    ! [VarCurr] :
      ( v712(VarCurr)
    <=> ( v714(VarCurr)
        & v725(VarCurr) ) ) )).

fof(writeUnaryOperator_68,axiom,(
    ! [VarCurr] :
      ( ~ v725(VarCurr)
    <=> v593(VarCurr,bitIndex6) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_93,axiom,(
    ! [VarCurr] :
      ( v714(VarCurr)
    <=> ( v715(VarCurr)
        & v724(VarCurr) ) ) )).

fof(writeUnaryOperator_67,axiom,(
    ! [VarCurr] :
      ( ~ v724(VarCurr)
    <=> v593(VarCurr,bitIndex5) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_92,axiom,(
    ! [VarCurr] :
      ( v715(VarCurr)
    <=> ( v716(VarCurr)
        & v723(VarCurr) ) ) )).

fof(writeUnaryOperator_66,axiom,(
    ! [VarCurr] :
      ( ~ v723(VarCurr)
    <=> v593(VarCurr,bitIndex4) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_91,axiom,(
    ! [VarCurr] :
      ( v716(VarCurr)
    <=> ( v717(VarCurr)
        & v722(VarCurr) ) ) )).

fof(writeUnaryOperator_65,axiom,(
    ! [VarCurr] :
      ( ~ v722(VarCurr)
    <=> v593(VarCurr,bitIndex3) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_90,axiom,(
    ! [VarCurr] :
      ( v717(VarCurr)
    <=> ( v718(VarCurr)
        & v721(VarCurr) ) ) )).

fof(writeUnaryOperator_64,axiom,(
    ! [VarCurr] :
      ( ~ v721(VarCurr)
    <=> v593(VarCurr,bitIndex2) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_89,axiom,(
    ! [VarCurr] :
      ( v718(VarCurr)
    <=> ( v719(VarCurr)
        & v720(VarCurr) ) ) )).

fof(writeUnaryOperator_63,axiom,(
    ! [VarCurr] :
      ( ~ v720(VarCurr)
    <=> v593(VarCurr,bitIndex1) ) )).

fof(writeUnaryOperator_62,axiom,(
    ! [VarCurr] :
      ( ~ v719(VarCurr)
    <=> v593(VarCurr,bitIndex0) ) )).

fof(addAssignment_201,axiom,(
    ! [VarCurr] :
      ( v690(VarCurr)
    <=> v595(VarCurr,bitIndex81) ) )).

fof(addAssignment_200,axiom,(
    ! [VarCurr] :
      ( v595(VarCurr,bitIndex81)
    <=> v597(VarCurr,bitIndex81) ) )).

fof(addAssignment_199,axiom,(
    ! [VarCurr] :
      ( v597(VarCurr,bitIndex81)
    <=> v599(VarCurr,bitIndex696) ) )).

fof(addAssignment_198,axiom,(
    ! [VarNext] :
      ( v599(VarNext,bitIndex696)
    <=> v692(VarNext,bitIndex81) ) )).

fof(addCaseBooleanConditionShiftedRanges1_1,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( ~ v694(VarNext)
       => ( ( v692(VarNext,bitIndex122)
          <=> v599(VarCurr,bitIndex737) )
          & ( v692(VarNext,bitIndex121)
          <=> v599(VarCurr,bitIndex736) )
          & ( v692(VarNext,bitIndex120)
          <=> v599(VarCurr,bitIndex735) )
          & ( v692(VarNext,bitIndex119)
          <=> v599(VarCurr,bitIndex734) )
          & ( v692(VarNext,bitIndex118)
          <=> v599(VarCurr,bitIndex733) )
          & ( v692(VarNext,bitIndex117)
          <=> v599(VarCurr,bitIndex732) )
          & ( v692(VarNext,bitIndex116)
          <=> v599(VarCurr,bitIndex731) )
          & ( v692(VarNext,bitIndex115)
          <=> v599(VarCurr,bitIndex730) )
          & ( v692(VarNext,bitIndex114)
          <=> v599(VarCurr,bitIndex729) )
          & ( v692(VarNext,bitIndex113)
          <=> v599(VarCurr,bitIndex728) )
          & ( v692(VarNext,bitIndex112)
          <=> v599(VarCurr,bitIndex727) )
          & ( v692(VarNext,bitIndex111)
          <=> v599(VarCurr,bitIndex726) )
          & ( v692(VarNext,bitIndex110)
          <=> v599(VarCurr,bitIndex725) )
          & ( v692(VarNext,bitIndex109)
          <=> v599(VarCurr,bitIndex724) )
          & ( v692(VarNext,bitIndex108)
          <=> v599(VarCurr,bitIndex723) )
          & ( v692(VarNext,bitIndex107)
          <=> v599(VarCurr,bitIndex722) )
          & ( v692(VarNext,bitIndex106)
          <=> v599(VarCurr,bitIndex721) )
          & ( v692(VarNext,bitIndex105)
          <=> v599(VarCurr,bitIndex720) )
          & ( v692(VarNext,bitIndex104)
          <=> v599(VarCurr,bitIndex719) )
          & ( v692(VarNext,bitIndex103)
          <=> v599(VarCurr,bitIndex718) )
          & ( v692(VarNext,bitIndex102)
          <=> v599(VarCurr,bitIndex717) )
          & ( v692(VarNext,bitIndex101)
          <=> v599(VarCurr,bitIndex716) )
          & ( v692(VarNext,bitIndex100)
          <=> v599(VarCurr,bitIndex715) )
          & ( v692(VarNext,bitIndex99)
          <=> v599(VarCurr,bitIndex714) )
          & ( v692(VarNext,bitIndex98)
          <=> v599(VarCurr,bitIndex713) )
          & ( v692(VarNext,bitIndex97)
          <=> v599(VarCurr,bitIndex712) )
          & ( v692(VarNext,bitIndex96)
          <=> v599(VarCurr,bitIndex711) )
          & ( v692(VarNext,bitIndex95)
          <=> v599(VarCurr,bitIndex710) )
          & ( v692(VarNext,bitIndex94)
          <=> v599(VarCurr,bitIndex709) )
          & ( v692(VarNext,bitIndex93)
          <=> v599(VarCurr,bitIndex708) )
          & ( v692(VarNext,bitIndex92)
          <=> v599(VarCurr,bitIndex707) )
          & ( v692(VarNext,bitIndex91)
          <=> v599(VarCurr,bitIndex706) )
          & ( v692(VarNext,bitIndex90)
          <=> v599(VarCurr,bitIndex705) )
          & ( v692(VarNext,bitIndex89)
          <=> v599(VarCurr,bitIndex704) )
          & ( v692(VarNext,bitIndex88)
          <=> v599(VarCurr,bitIndex703) )
          & ( v692(VarNext,bitIndex87)
          <=> v599(VarCurr,bitIndex702) )
          & ( v692(VarNext,bitIndex86)
          <=> v599(VarCurr,bitIndex701) )
          & ( v692(VarNext,bitIndex85)
          <=> v599(VarCurr,bitIndex700) )
          & ( v692(VarNext,bitIndex84)
          <=> v599(VarCurr,bitIndex699) )
          & ( v692(VarNext,bitIndex83)
          <=> v599(VarCurr,bitIndex698) )
          & ( v692(VarNext,bitIndex82)
          <=> v599(VarCurr,bitIndex697) )
          & ( v692(VarNext,bitIndex81)
          <=> v599(VarCurr,bitIndex696) )
          & ( v692(VarNext,bitIndex80)
          <=> v599(VarCurr,bitIndex695) )
          & ( v692(VarNext,bitIndex79)
          <=> v599(VarCurr,bitIndex694) )
          & ( v692(VarNext,bitIndex78)
          <=> v599(VarCurr,bitIndex693) )
          & ( v692(VarNext,bitIndex77)
          <=> v599(VarCurr,bitIndex692) )
          & ( v692(VarNext,bitIndex76)
          <=> v599(VarCurr,bitIndex691) )
          & ( v692(VarNext,bitIndex75)
          <=> v599(VarCurr,bitIndex690) )
          & ( v692(VarNext,bitIndex74)
          <=> v599(VarCurr,bitIndex689) )
          & ( v692(VarNext,bitIndex73)
          <=> v599(VarCurr,bitIndex688) )
          & ( v692(VarNext,bitIndex72)
          <=> v599(VarCurr,bitIndex687) )
          & ( v692(VarNext,bitIndex71)
          <=> v599(VarCurr,bitIndex686) )
          & ( v692(VarNext,bitIndex70)
          <=> v599(VarCurr,bitIndex685) )
          & ( v692(VarNext,bitIndex69)
          <=> v599(VarCurr,bitIndex684) )
          & ( v692(VarNext,bitIndex68)
          <=> v599(VarCurr,bitIndex683) )
          & ( v692(VarNext,bitIndex67)
          <=> v599(VarCurr,bitIndex682) )
          & ( v692(VarNext,bitIndex66)
          <=> v599(VarCurr,bitIndex681) )
          & ( v692(VarNext,bitIndex65)
          <=> v599(VarCurr,bitIndex680) )
          & ( v692(VarNext,bitIndex64)
          <=> v599(VarCurr,bitIndex679) )
          & ( v692(VarNext,bitIndex63)
          <=> v599(VarCurr,bitIndex678) )
          & ( v692(VarNext,bitIndex62)
          <=> v599(VarCurr,bitIndex677) )
          & ( v692(VarNext,bitIndex61)
          <=> v599(VarCurr,bitIndex676) )
          & ( v692(VarNext,bitIndex60)
          <=> v599(VarCurr,bitIndex675) )
          & ( v692(VarNext,bitIndex59)
          <=> v599(VarCurr,bitIndex674) )
          & ( v692(VarNext,bitIndex58)
          <=> v599(VarCurr,bitIndex673) )
          & ( v692(VarNext,bitIndex57)
          <=> v599(VarCurr,bitIndex672) )
          & ( v692(VarNext,bitIndex56)
          <=> v599(VarCurr,bitIndex671) )
          & ( v692(VarNext,bitIndex55)
          <=> v599(VarCurr,bitIndex670) )
          & ( v692(VarNext,bitIndex54)
          <=> v599(VarCurr,bitIndex669) )
          & ( v692(VarNext,bitIndex53)
          <=> v599(VarCurr,bitIndex668) )
          & ( v692(VarNext,bitIndex52)
          <=> v599(VarCurr,bitIndex667) )
          & ( v692(VarNext,bitIndex51)
          <=> v599(VarCurr,bitIndex666) )
          & ( v692(VarNext,bitIndex50)
          <=> v599(VarCurr,bitIndex665) )
          & ( v692(VarNext,bitIndex49)
          <=> v599(VarCurr,bitIndex664) )
          & ( v692(VarNext,bitIndex48)
          <=> v599(VarCurr,bitIndex663) )
          & ( v692(VarNext,bitIndex47)
          <=> v599(VarCurr,bitIndex662) )
          & ( v692(VarNext,bitIndex46)
          <=> v599(VarCurr,bitIndex661) )
          & ( v692(VarNext,bitIndex45)
          <=> v599(VarCurr,bitIndex660) )
          & ( v692(VarNext,bitIndex44)
          <=> v599(VarCurr,bitIndex659) )
          & ( v692(VarNext,bitIndex43)
          <=> v599(VarCurr,bitIndex658) )
          & ( v692(VarNext,bitIndex42)
          <=> v599(VarCurr,bitIndex657) )
          & ( v692(VarNext,bitIndex41)
          <=> v599(VarCurr,bitIndex656) )
          & ( v692(VarNext,bitIndex40)
          <=> v599(VarCurr,bitIndex655) )
          & ( v692(VarNext,bitIndex39)
          <=> v599(VarCurr,bitIndex654) )
          & ( v692(VarNext,bitIndex38)
          <=> v599(VarCurr,bitIndex653) )
          & ( v692(VarNext,bitIndex37)
          <=> v599(VarCurr,bitIndex652) )
          & ( v692(VarNext,bitIndex36)
          <=> v599(VarCurr,bitIndex651) )
          & ( v692(VarNext,bitIndex35)
          <=> v599(VarCurr,bitIndex650) )
          & ( v692(VarNext,bitIndex34)
          <=> v599(VarCurr,bitIndex649) )
          & ( v692(VarNext,bitIndex33)
          <=> v599(VarCurr,bitIndex648) )
          & ( v692(VarNext,bitIndex32)
          <=> v599(VarCurr,bitIndex647) )
          & ( v692(VarNext,bitIndex31)
          <=> v599(VarCurr,bitIndex646) )
          & ( v692(VarNext,bitIndex30)
          <=> v599(VarCurr,bitIndex645) )
          & ( v692(VarNext,bitIndex29)
          <=> v599(VarCurr,bitIndex644) )
          & ( v692(VarNext,bitIndex28)
          <=> v599(VarCurr,bitIndex643) )
          & ( v692(VarNext,bitIndex27)
          <=> v599(VarCurr,bitIndex642) )
          & ( v692(VarNext,bitIndex26)
          <=> v599(VarCurr,bitIndex641) )
          & ( v692(VarNext,bitIndex25)
          <=> v599(VarCurr,bitIndex640) )
          & ( v692(VarNext,bitIndex24)
          <=> v599(VarCurr,bitIndex639) )
          & ( v692(VarNext,bitIndex23)
          <=> v599(VarCurr,bitIndex638) )
          & ( v692(VarNext,bitIndex22)
          <=> v599(VarCurr,bitIndex637) )
          & ( v692(VarNext,bitIndex21)
          <=> v599(VarCurr,bitIndex636) )
          & ( v692(VarNext,bitIndex20)
          <=> v599(VarCurr,bitIndex635) )
          & ( v692(VarNext,bitIndex19)
          <=> v599(VarCurr,bitIndex634) )
          & ( v692(VarNext,bitIndex18)
          <=> v599(VarCurr,bitIndex633) )
          & ( v692(VarNext,bitIndex17)
          <=> v599(VarCurr,bitIndex632) )
          & ( v692(VarNext,bitIndex16)
          <=> v599(VarCurr,bitIndex631) )
          & ( v692(VarNext,bitIndex15)
          <=> v599(VarCurr,bitIndex630) )
          & ( v692(VarNext,bitIndex14)
          <=> v599(VarCurr,bitIndex629) )
          & ( v692(VarNext,bitIndex13)
          <=> v599(VarCurr,bitIndex628) )
          & ( v692(VarNext,bitIndex12)
          <=> v599(VarCurr,bitIndex627) )
          & ( v692(VarNext,bitIndex11)
          <=> v599(VarCurr,bitIndex626) )
          & ( v692(VarNext,bitIndex10)
          <=> v599(VarCurr,bitIndex625) )
          & ( v692(VarNext,bitIndex9)
          <=> v599(VarCurr,bitIndex624) )
          & ( v692(VarNext,bitIndex8)
          <=> v599(VarCurr,bitIndex623) )
          & ( v692(VarNext,bitIndex7)
          <=> v599(VarCurr,bitIndex622) )
          & ( v692(VarNext,bitIndex6)
          <=> v599(VarCurr,bitIndex621) )
          & ( v692(VarNext,bitIndex5)
          <=> v599(VarCurr,bitIndex620) )
          & ( v692(VarNext,bitIndex4)
          <=> v599(VarCurr,bitIndex619) )
          & ( v692(VarNext,bitIndex3)
          <=> v599(VarCurr,bitIndex618) )
          & ( v692(VarNext,bitIndex2)
          <=> v599(VarCurr,bitIndex617) )
          & ( v692(VarNext,bitIndex1)
          <=> v599(VarCurr,bitIndex616) )
          & ( v692(VarNext,bitIndex0)
          <=> v599(VarCurr,bitIndex615) ) ) ) ) )).

fof(addCaseBooleanConditionEqualRanges0_5,axiom,(
    ! [VarNext] :
      ( v694(VarNext)
     => ! [B] :
          ( range_122_0(B)
         => ( v692(VarNext,B)
          <=> v679(VarNext,B) ) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_88,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( v694(VarNext)
      <=> ( v695(VarNext)
          & v660(VarNext) ) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_87,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( v695(VarNext)
      <=> ( v697(VarNext)
          & v565(VarNext) ) ) ) )).

fof(writeUnaryOperator_61,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( ~ v697(VarNext)
      <=> v572(VarNext) ) ) )).

fof(addAssignment_197,axiom,(
    ! [VarCurr] :
      ( v644(VarCurr,bitIndex81)
    <=> v649(VarCurr,bitIndex81) ) )).

fof(addAssignment_196,axiom,(
    ! [VarCurr] :
      ( v648(VarCurr,bitIndex81)
    <=> v599(VarCurr,bitIndex573) ) )).

fof(addAssignment_195,axiom,(
    ! [VarCurr] :
      ( v602(VarCurr,bitIndex81)
    <=> v642(VarCurr,bitIndex81) ) )).

fof(addAssignment_194,axiom,(
    ! [VarCurr] :
      ( v641(VarCurr,bitIndex81)
    <=> v599(VarCurr,bitIndex696) ) )).

fof(addAssignment_193,axiom,(
    ! [VarCurr] :
      ( v625(VarCurr,bitIndex81)
    <=> v627(VarCurr,bitIndex81) ) )).

fof(addAssignment_192,axiom,(
    ! [VarCurr] :
      ( v627(VarCurr,bitIndex81)
    <=> v629(VarCurr,bitIndex81) ) )).

fof(addAssignment_191,axiom,(
    ! [VarCurr] :
      ( v629(VarCurr,bitIndex81)
    <=> v631(VarCurr,bitIndex81) ) )).

fof(addAssignment_190,axiom,(
    ! [VarCurr] :
      ( v631(VarCurr,bitIndex81)
    <=> v633(VarCurr,bitIndex81) ) )).

fof(addAssignment_189,axiom,(
    ! [VarCurr] :
      ( v633(VarCurr,bitIndex81)
    <=> v635(VarCurr,bitIndex81) ) )).

fof(addAssignment_188,axiom,(
    ! [VarCurr] :
      ( v635(VarCurr,bitIndex81)
    <=> v637(VarCurr,bitIndex81) ) )).

fof(addAssignment_187,axiom,(
    ! [VarCurr] :
      ( v637(VarCurr,bitIndex81)
    <=> v639(VarCurr,bitIndex81) ) )).

fof(addAssignment_186,axiom,(
    ! [VarCurr] :
      ( ( v593(VarCurr,bitIndex6)
      <=> v595(VarCurr,bitIndex122) )
      & ( v593(VarCurr,bitIndex5)
      <=> v595(VarCurr,bitIndex121) )
      & ( v593(VarCurr,bitIndex4)
      <=> v595(VarCurr,bitIndex120) )
      & ( v593(VarCurr,bitIndex3)
      <=> v595(VarCurr,bitIndex119) )
      & ( v593(VarCurr,bitIndex2)
      <=> v595(VarCurr,bitIndex118) )
      & ( v593(VarCurr,bitIndex1)
      <=> v595(VarCurr,bitIndex117) )
      & ( v593(VarCurr,bitIndex0)
      <=> v595(VarCurr,bitIndex116) ) ) )).

fof(addAssignment_185,axiom,(
    ! [VarCurr,B] :
      ( range_122_116(B)
     => ( v595(VarCurr,B)
      <=> v597(VarCurr,B) ) ) )).

fof(addAssignment_184,axiom,(
    ! [VarCurr] :
      ( ( v597(VarCurr,bitIndex122)
      <=> v599(VarCurr,bitIndex737) )
      & ( v597(VarCurr,bitIndex121)
      <=> v599(VarCurr,bitIndex736) )
      & ( v597(VarCurr,bitIndex120)
      <=> v599(VarCurr,bitIndex735) )
      & ( v597(VarCurr,bitIndex119)
      <=> v599(VarCurr,bitIndex734) )
      & ( v597(VarCurr,bitIndex118)
      <=> v599(VarCurr,bitIndex733) )
      & ( v597(VarCurr,bitIndex117)
      <=> v599(VarCurr,bitIndex732) )
      & ( v597(VarCurr,bitIndex116)
      <=> v599(VarCurr,bitIndex731) ) ) )).

fof(addAssignment_183,axiom,(
    ! [VarNext] :
      ( ( v599(VarNext,bitIndex737)
      <=> v651(VarNext,bitIndex122) )
      & ( v599(VarNext,bitIndex736)
      <=> v651(VarNext,bitIndex121) )
      & ( v599(VarNext,bitIndex735)
      <=> v651(VarNext,bitIndex120) )
      & ( v599(VarNext,bitIndex734)
      <=> v651(VarNext,bitIndex119) )
      & ( v599(VarNext,bitIndex733)
      <=> v651(VarNext,bitIndex118) )
      & ( v599(VarNext,bitIndex732)
      <=> v651(VarNext,bitIndex117) )
      & ( v599(VarNext,bitIndex731)
      <=> v651(VarNext,bitIndex116) ) ) )).

fof(addCaseBooleanConditionShiftedRanges1,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( ~ v652(VarNext)
       => ( ( v651(VarNext,bitIndex122)
          <=> v599(VarCurr,bitIndex737) )
          & ( v651(VarNext,bitIndex121)
          <=> v599(VarCurr,bitIndex736) )
          & ( v651(VarNext,bitIndex120)
          <=> v599(VarCurr,bitIndex735) )
          & ( v651(VarNext,bitIndex119)
          <=> v599(VarCurr,bitIndex734) )
          & ( v651(VarNext,bitIndex118)
          <=> v599(VarCurr,bitIndex733) )
          & ( v651(VarNext,bitIndex117)
          <=> v599(VarCurr,bitIndex732) )
          & ( v651(VarNext,bitIndex116)
          <=> v599(VarCurr,bitIndex731) )
          & ( v651(VarNext,bitIndex115)
          <=> v599(VarCurr,bitIndex730) )
          & ( v651(VarNext,bitIndex114)
          <=> v599(VarCurr,bitIndex729) )
          & ( v651(VarNext,bitIndex113)
          <=> v599(VarCurr,bitIndex728) )
          & ( v651(VarNext,bitIndex112)
          <=> v599(VarCurr,bitIndex727) )
          & ( v651(VarNext,bitIndex111)
          <=> v599(VarCurr,bitIndex726) )
          & ( v651(VarNext,bitIndex110)
          <=> v599(VarCurr,bitIndex725) )
          & ( v651(VarNext,bitIndex109)
          <=> v599(VarCurr,bitIndex724) )
          & ( v651(VarNext,bitIndex108)
          <=> v599(VarCurr,bitIndex723) )
          & ( v651(VarNext,bitIndex107)
          <=> v599(VarCurr,bitIndex722) )
          & ( v651(VarNext,bitIndex106)
          <=> v599(VarCurr,bitIndex721) )
          & ( v651(VarNext,bitIndex105)
          <=> v599(VarCurr,bitIndex720) )
          & ( v651(VarNext,bitIndex104)
          <=> v599(VarCurr,bitIndex719) )
          & ( v651(VarNext,bitIndex103)
          <=> v599(VarCurr,bitIndex718) )
          & ( v651(VarNext,bitIndex102)
          <=> v599(VarCurr,bitIndex717) )
          & ( v651(VarNext,bitIndex101)
          <=> v599(VarCurr,bitIndex716) )
          & ( v651(VarNext,bitIndex100)
          <=> v599(VarCurr,bitIndex715) )
          & ( v651(VarNext,bitIndex99)
          <=> v599(VarCurr,bitIndex714) )
          & ( v651(VarNext,bitIndex98)
          <=> v599(VarCurr,bitIndex713) )
          & ( v651(VarNext,bitIndex97)
          <=> v599(VarCurr,bitIndex712) )
          & ( v651(VarNext,bitIndex96)
          <=> v599(VarCurr,bitIndex711) )
          & ( v651(VarNext,bitIndex95)
          <=> v599(VarCurr,bitIndex710) )
          & ( v651(VarNext,bitIndex94)
          <=> v599(VarCurr,bitIndex709) )
          & ( v651(VarNext,bitIndex93)
          <=> v599(VarCurr,bitIndex708) )
          & ( v651(VarNext,bitIndex92)
          <=> v599(VarCurr,bitIndex707) )
          & ( v651(VarNext,bitIndex91)
          <=> v599(VarCurr,bitIndex706) )
          & ( v651(VarNext,bitIndex90)
          <=> v599(VarCurr,bitIndex705) )
          & ( v651(VarNext,bitIndex89)
          <=> v599(VarCurr,bitIndex704) )
          & ( v651(VarNext,bitIndex88)
          <=> v599(VarCurr,bitIndex703) )
          & ( v651(VarNext,bitIndex87)
          <=> v599(VarCurr,bitIndex702) )
          & ( v651(VarNext,bitIndex86)
          <=> v599(VarCurr,bitIndex701) )
          & ( v651(VarNext,bitIndex85)
          <=> v599(VarCurr,bitIndex700) )
          & ( v651(VarNext,bitIndex84)
          <=> v599(VarCurr,bitIndex699) )
          & ( v651(VarNext,bitIndex83)
          <=> v599(VarCurr,bitIndex698) )
          & ( v651(VarNext,bitIndex82)
          <=> v599(VarCurr,bitIndex697) )
          & ( v651(VarNext,bitIndex81)
          <=> v599(VarCurr,bitIndex696) )
          & ( v651(VarNext,bitIndex80)
          <=> v599(VarCurr,bitIndex695) )
          & ( v651(VarNext,bitIndex79)
          <=> v599(VarCurr,bitIndex694) )
          & ( v651(VarNext,bitIndex78)
          <=> v599(VarCurr,bitIndex693) )
          & ( v651(VarNext,bitIndex77)
          <=> v599(VarCurr,bitIndex692) )
          & ( v651(VarNext,bitIndex76)
          <=> v599(VarCurr,bitIndex691) )
          & ( v651(VarNext,bitIndex75)
          <=> v599(VarCurr,bitIndex690) )
          & ( v651(VarNext,bitIndex74)
          <=> v599(VarCurr,bitIndex689) )
          & ( v651(VarNext,bitIndex73)
          <=> v599(VarCurr,bitIndex688) )
          & ( v651(VarNext,bitIndex72)
          <=> v599(VarCurr,bitIndex687) )
          & ( v651(VarNext,bitIndex71)
          <=> v599(VarCurr,bitIndex686) )
          & ( v651(VarNext,bitIndex70)
          <=> v599(VarCurr,bitIndex685) )
          & ( v651(VarNext,bitIndex69)
          <=> v599(VarCurr,bitIndex684) )
          & ( v651(VarNext,bitIndex68)
          <=> v599(VarCurr,bitIndex683) )
          & ( v651(VarNext,bitIndex67)
          <=> v599(VarCurr,bitIndex682) )
          & ( v651(VarNext,bitIndex66)
          <=> v599(VarCurr,bitIndex681) )
          & ( v651(VarNext,bitIndex65)
          <=> v599(VarCurr,bitIndex680) )
          & ( v651(VarNext,bitIndex64)
          <=> v599(VarCurr,bitIndex679) )
          & ( v651(VarNext,bitIndex63)
          <=> v599(VarCurr,bitIndex678) )
          & ( v651(VarNext,bitIndex62)
          <=> v599(VarCurr,bitIndex677) )
          & ( v651(VarNext,bitIndex61)
          <=> v599(VarCurr,bitIndex676) )
          & ( v651(VarNext,bitIndex60)
          <=> v599(VarCurr,bitIndex675) )
          & ( v651(VarNext,bitIndex59)
          <=> v599(VarCurr,bitIndex674) )
          & ( v651(VarNext,bitIndex58)
          <=> v599(VarCurr,bitIndex673) )
          & ( v651(VarNext,bitIndex57)
          <=> v599(VarCurr,bitIndex672) )
          & ( v651(VarNext,bitIndex56)
          <=> v599(VarCurr,bitIndex671) )
          & ( v651(VarNext,bitIndex55)
          <=> v599(VarCurr,bitIndex670) )
          & ( v651(VarNext,bitIndex54)
          <=> v599(VarCurr,bitIndex669) )
          & ( v651(VarNext,bitIndex53)
          <=> v599(VarCurr,bitIndex668) )
          & ( v651(VarNext,bitIndex52)
          <=> v599(VarCurr,bitIndex667) )
          & ( v651(VarNext,bitIndex51)
          <=> v599(VarCurr,bitIndex666) )
          & ( v651(VarNext,bitIndex50)
          <=> v599(VarCurr,bitIndex665) )
          & ( v651(VarNext,bitIndex49)
          <=> v599(VarCurr,bitIndex664) )
          & ( v651(VarNext,bitIndex48)
          <=> v599(VarCurr,bitIndex663) )
          & ( v651(VarNext,bitIndex47)
          <=> v599(VarCurr,bitIndex662) )
          & ( v651(VarNext,bitIndex46)
          <=> v599(VarCurr,bitIndex661) )
          & ( v651(VarNext,bitIndex45)
          <=> v599(VarCurr,bitIndex660) )
          & ( v651(VarNext,bitIndex44)
          <=> v599(VarCurr,bitIndex659) )
          & ( v651(VarNext,bitIndex43)
          <=> v599(VarCurr,bitIndex658) )
          & ( v651(VarNext,bitIndex42)
          <=> v599(VarCurr,bitIndex657) )
          & ( v651(VarNext,bitIndex41)
          <=> v599(VarCurr,bitIndex656) )
          & ( v651(VarNext,bitIndex40)
          <=> v599(VarCurr,bitIndex655) )
          & ( v651(VarNext,bitIndex39)
          <=> v599(VarCurr,bitIndex654) )
          & ( v651(VarNext,bitIndex38)
          <=> v599(VarCurr,bitIndex653) )
          & ( v651(VarNext,bitIndex37)
          <=> v599(VarCurr,bitIndex652) )
          & ( v651(VarNext,bitIndex36)
          <=> v599(VarCurr,bitIndex651) )
          & ( v651(VarNext,bitIndex35)
          <=> v599(VarCurr,bitIndex650) )
          & ( v651(VarNext,bitIndex34)
          <=> v599(VarCurr,bitIndex649) )
          & ( v651(VarNext,bitIndex33)
          <=> v599(VarCurr,bitIndex648) )
          & ( v651(VarNext,bitIndex32)
          <=> v599(VarCurr,bitIndex647) )
          & ( v651(VarNext,bitIndex31)
          <=> v599(VarCurr,bitIndex646) )
          & ( v651(VarNext,bitIndex30)
          <=> v599(VarCurr,bitIndex645) )
          & ( v651(VarNext,bitIndex29)
          <=> v599(VarCurr,bitIndex644) )
          & ( v651(VarNext,bitIndex28)
          <=> v599(VarCurr,bitIndex643) )
          & ( v651(VarNext,bitIndex27)
          <=> v599(VarCurr,bitIndex642) )
          & ( v651(VarNext,bitIndex26)
          <=> v599(VarCurr,bitIndex641) )
          & ( v651(VarNext,bitIndex25)
          <=> v599(VarCurr,bitIndex640) )
          & ( v651(VarNext,bitIndex24)
          <=> v599(VarCurr,bitIndex639) )
          & ( v651(VarNext,bitIndex23)
          <=> v599(VarCurr,bitIndex638) )
          & ( v651(VarNext,bitIndex22)
          <=> v599(VarCurr,bitIndex637) )
          & ( v651(VarNext,bitIndex21)
          <=> v599(VarCurr,bitIndex636) )
          & ( v651(VarNext,bitIndex20)
          <=> v599(VarCurr,bitIndex635) )
          & ( v651(VarNext,bitIndex19)
          <=> v599(VarCurr,bitIndex634) )
          & ( v651(VarNext,bitIndex18)
          <=> v599(VarCurr,bitIndex633) )
          & ( v651(VarNext,bitIndex17)
          <=> v599(VarCurr,bitIndex632) )
          & ( v651(VarNext,bitIndex16)
          <=> v599(VarCurr,bitIndex631) )
          & ( v651(VarNext,bitIndex15)
          <=> v599(VarCurr,bitIndex630) )
          & ( v651(VarNext,bitIndex14)
          <=> v599(VarCurr,bitIndex629) )
          & ( v651(VarNext,bitIndex13)
          <=> v599(VarCurr,bitIndex628) )
          & ( v651(VarNext,bitIndex12)
          <=> v599(VarCurr,bitIndex627) )
          & ( v651(VarNext,bitIndex11)
          <=> v599(VarCurr,bitIndex626) )
          & ( v651(VarNext,bitIndex10)
          <=> v599(VarCurr,bitIndex625) )
          & ( v651(VarNext,bitIndex9)
          <=> v599(VarCurr,bitIndex624) )
          & ( v651(VarNext,bitIndex8)
          <=> v599(VarCurr,bitIndex623) )
          & ( v651(VarNext,bitIndex7)
          <=> v599(VarCurr,bitIndex622) )
          & ( v651(VarNext,bitIndex6)
          <=> v599(VarCurr,bitIndex621) )
          & ( v651(VarNext,bitIndex5)
          <=> v599(VarCurr,bitIndex620) )
          & ( v651(VarNext,bitIndex4)
          <=> v599(VarCurr,bitIndex619) )
          & ( v651(VarNext,bitIndex3)
          <=> v599(VarCurr,bitIndex618) )
          & ( v651(VarNext,bitIndex2)
          <=> v599(VarCurr,bitIndex617) )
          & ( v651(VarNext,bitIndex1)
          <=> v599(VarCurr,bitIndex616) )
          & ( v651(VarNext,bitIndex0)
          <=> v599(VarCurr,bitIndex615) ) ) ) ) )).

fof(addCaseBooleanConditionEqualRanges0_4,axiom,(
    ! [VarNext] :
      ( v652(VarNext)
     => ! [B] :
          ( range_122_0(B)
         => ( v651(VarNext,B)
          <=> v679(VarNext,B) ) ) ) )).

fof(addAssignment_182,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ! [B] :
          ( range_122_0(B)
         => ( v679(VarNext,B)
          <=> v677(VarCurr,B) ) ) ) )).

fof(addParallelCaseBooleanConditionEqualRanges1_10,axiom,(
    ! [VarCurr] :
      ( ~ v662(VarCurr)
     => ! [B] :
          ( range_122_0(B)
         => ( v677(VarCurr,B)
          <=> v680(VarCurr,B) ) ) ) )).

fof(addParallelCaseBooleanConditionEqualRanges0_9,axiom,(
    ! [VarCurr] :
      ( v662(VarCurr)
     => ! [B] :
          ( range_122_0(B)
         => ( v677(VarCurr,B)
          <=> $false ) ) ) )).

fof(bitBlastConstant_192,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex122) )).

fof(bitBlastConstant_191,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex121) )).

fof(bitBlastConstant_190,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex120) )).

fof(bitBlastConstant_189,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex119) )).

fof(bitBlastConstant_188,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex118) )).

fof(bitBlastConstant_187,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex117) )).

fof(bitBlastConstant_186,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex116) )).

fof(bitBlastConstant_185,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex115) )).

fof(bitBlastConstant_184,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex114) )).

fof(bitBlastConstant_183,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex113) )).

fof(bitBlastConstant_182,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex112) )).

fof(bitBlastConstant_181,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex111) )).

fof(bitBlastConstant_180,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex110) )).

fof(bitBlastConstant_179,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex109) )).

fof(bitBlastConstant_178,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex108) )).

fof(bitBlastConstant_177,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex107) )).

fof(bitBlastConstant_176,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex106) )).

fof(bitBlastConstant_175,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex105) )).

fof(bitBlastConstant_174,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex104) )).

fof(bitBlastConstant_173,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex103) )).

fof(bitBlastConstant_172,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex102) )).

fof(bitBlastConstant_171,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex101) )).

fof(bitBlastConstant_170,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex100) )).

fof(bitBlastConstant_169,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex99) )).

fof(bitBlastConstant_168,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex98) )).

fof(bitBlastConstant_167,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex97) )).

fof(bitBlastConstant_166,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex96) )).

fof(bitBlastConstant_165,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex95) )).

fof(bitBlastConstant_164,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex94) )).

fof(bitBlastConstant_163,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex93) )).

fof(bitBlastConstant_162,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex92) )).

fof(bitBlastConstant_161,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex91) )).

fof(bitBlastConstant_160,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex90) )).

fof(bitBlastConstant_159,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex89) )).

fof(bitBlastConstant_158,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex88) )).

fof(bitBlastConstant_157,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex87) )).

fof(bitBlastConstant_156,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex86) )).

fof(bitBlastConstant_155,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex85) )).

fof(bitBlastConstant_154,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex84) )).

fof(bitBlastConstant_153,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex83) )).

fof(bitBlastConstant_152,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex82) )).

fof(bitBlastConstant_151,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex81) )).

fof(bitBlastConstant_150,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex80) )).

fof(bitBlastConstant_149,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex79) )).

fof(bitBlastConstant_148,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex78) )).

fof(bitBlastConstant_147,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex77) )).

fof(bitBlastConstant_146,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex76) )).

fof(bitBlastConstant_145,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex75) )).

fof(bitBlastConstant_144,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex74) )).

fof(bitBlastConstant_143,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex73) )).

fof(bitBlastConstant_142,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex72) )).

fof(bitBlastConstant_141,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex71) )).

fof(bitBlastConstant_140,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex70) )).

fof(bitBlastConstant_139,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex69) )).

fof(bitBlastConstant_138,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex68) )).

fof(bitBlastConstant_137,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex67) )).

fof(bitBlastConstant_136,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex66) )).

fof(bitBlastConstant_135,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex65) )).

fof(bitBlastConstant_134,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex64) )).

fof(bitBlastConstant_133,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex63) )).

fof(bitBlastConstant_132,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex62) )).

fof(bitBlastConstant_131,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex61) )).

fof(bitBlastConstant_130,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex60) )).

fof(bitBlastConstant_129,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex59) )).

fof(bitBlastConstant_128,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex58) )).

fof(bitBlastConstant_127,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex57) )).

fof(bitBlastConstant_126,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex56) )).

fof(bitBlastConstant_125,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex55) )).

fof(bitBlastConstant_124,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex54) )).

fof(bitBlastConstant_123,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex53) )).

fof(bitBlastConstant_122,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex52) )).

fof(bitBlastConstant_121,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex51) )).

fof(bitBlastConstant_120,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex50) )).

fof(bitBlastConstant_119,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex49) )).

fof(bitBlastConstant_118,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex48) )).

fof(bitBlastConstant_117,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex47) )).

fof(bitBlastConstant_116,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex46) )).

fof(bitBlastConstant_115,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex45) )).

fof(bitBlastConstant_114,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex44) )).

fof(bitBlastConstant_113,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex43) )).

fof(bitBlastConstant_112,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex42) )).

fof(bitBlastConstant_111,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex41) )).

fof(bitBlastConstant_110,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex40) )).

fof(bitBlastConstant_109,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex39) )).

fof(bitBlastConstant_108,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex38) )).

fof(bitBlastConstant_107,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex37) )).

fof(bitBlastConstant_106,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex36) )).

fof(bitBlastConstant_105,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex35) )).

fof(bitBlastConstant_104,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex34) )).

fof(bitBlastConstant_103,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex33) )).

fof(bitBlastConstant_102,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex32) )).

fof(bitBlastConstant_101,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex31) )).

fof(bitBlastConstant_100,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex30) )).

fof(bitBlastConstant_99,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex29) )).

fof(bitBlastConstant_98,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex28) )).

fof(bitBlastConstant_97,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex27) )).

fof(bitBlastConstant_96,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex26) )).

fof(bitBlastConstant_95,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex25) )).

fof(bitBlastConstant_94,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex24) )).

fof(bitBlastConstant_93,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex23) )).

fof(bitBlastConstant_92,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex22) )).

fof(bitBlastConstant_91,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex21) )).

fof(bitBlastConstant_90,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex20) )).

fof(bitBlastConstant_89,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex19) )).

fof(bitBlastConstant_88,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex18) )).

fof(bitBlastConstant_87,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex17) )).

fof(bitBlastConstant_86,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex16) )).

fof(bitBlastConstant_85,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex15) )).

fof(bitBlastConstant_84,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex14) )).

fof(bitBlastConstant_83,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex13) )).

fof(bitBlastConstant_82,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex12) )).

fof(bitBlastConstant_81,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex11) )).

fof(bitBlastConstant_80,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex10) )).

fof(bitBlastConstant_79,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex9) )).

fof(bitBlastConstant_78,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex8) )).

fof(bitBlastConstant_77,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex7) )).

fof(bitBlastConstant_76,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex6) )).

fof(bitBlastConstant_75,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex5) )).

fof(bitBlastConstant_74,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex4) )).

fof(bitBlastConstant_73,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex3) )).

fof(bitBlastConstant_72,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex2) )).

fof(bitBlastConstant_71,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex1) )).

fof(bitBlastConstant_70,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex0) )).

fof(addParallelCaseBooleanConditionEqualRanges2_5,axiom,(
    ! [VarCurr] :
      ( ( ~ v666(VarCurr)
        & ~ v668(VarCurr) )
     => ! [B] :
          ( range_122_0(B)
         => ( v680(VarCurr,B)
          <=> v644(VarCurr,B) ) ) ) )).

fof(addParallelCaseBooleanConditionEqualRanges1_9,axiom,(
    ! [VarCurr] :
      ( v668(VarCurr)
     => ! [B] :
          ( range_122_0(B)
         => ( v680(VarCurr,B)
          <=> v602(VarCurr,B) ) ) ) )).

fof(addParallelCaseBooleanConditionShiftedRanges0,axiom,(
    ! [VarCurr] :
      ( v666(VarCurr)
     => ( ( v680(VarCurr,bitIndex122)
        <=> v599(VarCurr,bitIndex614) )
        & ( v680(VarCurr,bitIndex121)
        <=> v599(VarCurr,bitIndex613) )
        & ( v680(VarCurr,bitIndex120)
        <=> v599(VarCurr,bitIndex612) )
        & ( v680(VarCurr,bitIndex119)
        <=> v599(VarCurr,bitIndex611) )
        & ( v680(VarCurr,bitIndex118)
        <=> v599(VarCurr,bitIndex610) )
        & ( v680(VarCurr,bitIndex117)
        <=> v599(VarCurr,bitIndex609) )
        & ( v680(VarCurr,bitIndex116)
        <=> v599(VarCurr,bitIndex608) )
        & ( v680(VarCurr,bitIndex115)
        <=> v599(VarCurr,bitIndex607) )
        & ( v680(VarCurr,bitIndex114)
        <=> v599(VarCurr,bitIndex606) )
        & ( v680(VarCurr,bitIndex113)
        <=> v599(VarCurr,bitIndex605) )
        & ( v680(VarCurr,bitIndex112)
        <=> v599(VarCurr,bitIndex604) )
        & ( v680(VarCurr,bitIndex111)
        <=> v599(VarCurr,bitIndex603) )
        & ( v680(VarCurr,bitIndex110)
        <=> v599(VarCurr,bitIndex602) )
        & ( v680(VarCurr,bitIndex109)
        <=> v599(VarCurr,bitIndex601) )
        & ( v680(VarCurr,bitIndex108)
        <=> v599(VarCurr,bitIndex600) )
        & ( v680(VarCurr,bitIndex107)
        <=> v599(VarCurr,bitIndex599) )
        & ( v680(VarCurr,bitIndex106)
        <=> v599(VarCurr,bitIndex598) )
        & ( v680(VarCurr,bitIndex105)
        <=> v599(VarCurr,bitIndex597) )
        & ( v680(VarCurr,bitIndex104)
        <=> v599(VarCurr,bitIndex596) )
        & ( v680(VarCurr,bitIndex103)
        <=> v599(VarCurr,bitIndex595) )
        & ( v680(VarCurr,bitIndex102)
        <=> v599(VarCurr,bitIndex594) )
        & ( v680(VarCurr,bitIndex101)
        <=> v599(VarCurr,bitIndex593) )
        & ( v680(VarCurr,bitIndex100)
        <=> v599(VarCurr,bitIndex592) )
        & ( v680(VarCurr,bitIndex99)
        <=> v599(VarCurr,bitIndex591) )
        & ( v680(VarCurr,bitIndex98)
        <=> v599(VarCurr,bitIndex590) )
        & ( v680(VarCurr,bitIndex97)
        <=> v599(VarCurr,bitIndex589) )
        & ( v680(VarCurr,bitIndex96)
        <=> v599(VarCurr,bitIndex588) )
        & ( v680(VarCurr,bitIndex95)
        <=> v599(VarCurr,bitIndex587) )
        & ( v680(VarCurr,bitIndex94)
        <=> v599(VarCurr,bitIndex586) )
        & ( v680(VarCurr,bitIndex93)
        <=> v599(VarCurr,bitIndex585) )
        & ( v680(VarCurr,bitIndex92)
        <=> v599(VarCurr,bitIndex584) )
        & ( v680(VarCurr,bitIndex91)
        <=> v599(VarCurr,bitIndex583) )
        & ( v680(VarCurr,bitIndex90)
        <=> v599(VarCurr,bitIndex582) )
        & ( v680(VarCurr,bitIndex89)
        <=> v599(VarCurr,bitIndex581) )
        & ( v680(VarCurr,bitIndex88)
        <=> v599(VarCurr,bitIndex580) )
        & ( v680(VarCurr,bitIndex87)
        <=> v599(VarCurr,bitIndex579) )
        & ( v680(VarCurr,bitIndex86)
        <=> v599(VarCurr,bitIndex578) )
        & ( v680(VarCurr,bitIndex85)
        <=> v599(VarCurr,bitIndex577) )
        & ( v680(VarCurr,bitIndex84)
        <=> v599(VarCurr,bitIndex576) )
        & ( v680(VarCurr,bitIndex83)
        <=> v599(VarCurr,bitIndex575) )
        & ( v680(VarCurr,bitIndex82)
        <=> v599(VarCurr,bitIndex574) )
        & ( v680(VarCurr,bitIndex81)
        <=> v599(VarCurr,bitIndex573) )
        & ( v680(VarCurr,bitIndex80)
        <=> v599(VarCurr,bitIndex572) )
        & ( v680(VarCurr,bitIndex79)
        <=> v599(VarCurr,bitIndex571) )
        & ( v680(VarCurr,bitIndex78)
        <=> v599(VarCurr,bitIndex570) )
        & ( v680(VarCurr,bitIndex77)
        <=> v599(VarCurr,bitIndex569) )
        & ( v680(VarCurr,bitIndex76)
        <=> v599(VarCurr,bitIndex568) )
        & ( v680(VarCurr,bitIndex75)
        <=> v599(VarCurr,bitIndex567) )
        & ( v680(VarCurr,bitIndex74)
        <=> v599(VarCurr,bitIndex566) )
        & ( v680(VarCurr,bitIndex73)
        <=> v599(VarCurr,bitIndex565) )
        & ( v680(VarCurr,bitIndex72)
        <=> v599(VarCurr,bitIndex564) )
        & ( v680(VarCurr,bitIndex71)
        <=> v599(VarCurr,bitIndex563) )
        & ( v680(VarCurr,bitIndex70)
        <=> v599(VarCurr,bitIndex562) )
        & ( v680(VarCurr,bitIndex69)
        <=> v599(VarCurr,bitIndex561) )
        & ( v680(VarCurr,bitIndex68)
        <=> v599(VarCurr,bitIndex560) )
        & ( v680(VarCurr,bitIndex67)
        <=> v599(VarCurr,bitIndex559) )
        & ( v680(VarCurr,bitIndex66)
        <=> v599(VarCurr,bitIndex558) )
        & ( v680(VarCurr,bitIndex65)
        <=> v599(VarCurr,bitIndex557) )
        & ( v680(VarCurr,bitIndex64)
        <=> v599(VarCurr,bitIndex556) )
        & ( v680(VarCurr,bitIndex63)
        <=> v599(VarCurr,bitIndex555) )
        & ( v680(VarCurr,bitIndex62)
        <=> v599(VarCurr,bitIndex554) )
        & ( v680(VarCurr,bitIndex61)
        <=> v599(VarCurr,bitIndex553) )
        & ( v680(VarCurr,bitIndex60)
        <=> v599(VarCurr,bitIndex552) )
        & ( v680(VarCurr,bitIndex59)
        <=> v599(VarCurr,bitIndex551) )
        & ( v680(VarCurr,bitIndex58)
        <=> v599(VarCurr,bitIndex550) )
        & ( v680(VarCurr,bitIndex57)
        <=> v599(VarCurr,bitIndex549) )
        & ( v680(VarCurr,bitIndex56)
        <=> v599(VarCurr,bitIndex548) )
        & ( v680(VarCurr,bitIndex55)
        <=> v599(VarCurr,bitIndex547) )
        & ( v680(VarCurr,bitIndex54)
        <=> v599(VarCurr,bitIndex546) )
        & ( v680(VarCurr,bitIndex53)
        <=> v599(VarCurr,bitIndex545) )
        & ( v680(VarCurr,bitIndex52)
        <=> v599(VarCurr,bitIndex544) )
        & ( v680(VarCurr,bitIndex51)
        <=> v599(VarCurr,bitIndex543) )
        & ( v680(VarCurr,bitIndex50)
        <=> v599(VarCurr,bitIndex542) )
        & ( v680(VarCurr,bitIndex49)
        <=> v599(VarCurr,bitIndex541) )
        & ( v680(VarCurr,bitIndex48)
        <=> v599(VarCurr,bitIndex540) )
        & ( v680(VarCurr,bitIndex47)
        <=> v599(VarCurr,bitIndex539) )
        & ( v680(VarCurr,bitIndex46)
        <=> v599(VarCurr,bitIndex538) )
        & ( v680(VarCurr,bitIndex45)
        <=> v599(VarCurr,bitIndex537) )
        & ( v680(VarCurr,bitIndex44)
        <=> v599(VarCurr,bitIndex536) )
        & ( v680(VarCurr,bitIndex43)
        <=> v599(VarCurr,bitIndex535) )
        & ( v680(VarCurr,bitIndex42)
        <=> v599(VarCurr,bitIndex534) )
        & ( v680(VarCurr,bitIndex41)
        <=> v599(VarCurr,bitIndex533) )
        & ( v680(VarCurr,bitIndex40)
        <=> v599(VarCurr,bitIndex532) )
        & ( v680(VarCurr,bitIndex39)
        <=> v599(VarCurr,bitIndex531) )
        & ( v680(VarCurr,bitIndex38)
        <=> v599(VarCurr,bitIndex530) )
        & ( v680(VarCurr,bitIndex37)
        <=> v599(VarCurr,bitIndex529) )
        & ( v680(VarCurr,bitIndex36)
        <=> v599(VarCurr,bitIndex528) )
        & ( v680(VarCurr,bitIndex35)
        <=> v599(VarCurr,bitIndex527) )
        & ( v680(VarCurr,bitIndex34)
        <=> v599(VarCurr,bitIndex526) )
        & ( v680(VarCurr,bitIndex33)
        <=> v599(VarCurr,bitIndex525) )
        & ( v680(VarCurr,bitIndex32)
        <=> v599(VarCurr,bitIndex524) )
        & ( v680(VarCurr,bitIndex31)
        <=> v599(VarCurr,bitIndex523) )
        & ( v680(VarCurr,bitIndex30)
        <=> v599(VarCurr,bitIndex522) )
        & ( v680(VarCurr,bitIndex29)
        <=> v599(VarCurr,bitIndex521) )
        & ( v680(VarCurr,bitIndex28)
        <=> v599(VarCurr,bitIndex520) )
        & ( v680(VarCurr,bitIndex27)
        <=> v599(VarCurr,bitIndex519) )
        & ( v680(VarCurr,bitIndex26)
        <=> v599(VarCurr,bitIndex518) )
        & ( v680(VarCurr,bitIndex25)
        <=> v599(VarCurr,bitIndex517) )
        & ( v680(VarCurr,bitIndex24)
        <=> v599(VarCurr,bitIndex516) )
        & ( v680(VarCurr,bitIndex23)
        <=> v599(VarCurr,bitIndex515) )
        & ( v680(VarCurr,bitIndex22)
        <=> v599(VarCurr,bitIndex514) )
        & ( v680(VarCurr,bitIndex21)
        <=> v599(VarCurr,bitIndex513) )
        & ( v680(VarCurr,bitIndex20)
        <=> v599(VarCurr,bitIndex512) )
        & ( v680(VarCurr,bitIndex19)
        <=> v599(VarCurr,bitIndex511) )
        & ( v680(VarCurr,bitIndex18)
        <=> v599(VarCurr,bitIndex510) )
        & ( v680(VarCurr,bitIndex17)
        <=> v599(VarCurr,bitIndex509) )
        & ( v680(VarCurr,bitIndex16)
        <=> v599(VarCurr,bitIndex508) )
        & ( v680(VarCurr,bitIndex15)
        <=> v599(VarCurr,bitIndex507) )
        & ( v680(VarCurr,bitIndex14)
        <=> v599(VarCurr,bitIndex506) )
        & ( v680(VarCurr,bitIndex13)
        <=> v599(VarCurr,bitIndex505) )
        & ( v680(VarCurr,bitIndex12)
        <=> v599(VarCurr,bitIndex504) )
        & ( v680(VarCurr,bitIndex11)
        <=> v599(VarCurr,bitIndex503) )
        & ( v680(VarCurr,bitIndex10)
        <=> v599(VarCurr,bitIndex502) )
        & ( v680(VarCurr,bitIndex9)
        <=> v599(VarCurr,bitIndex501) )
        & ( v680(VarCurr,bitIndex8)
        <=> v599(VarCurr,bitIndex500) )
        & ( v680(VarCurr,bitIndex7)
        <=> v599(VarCurr,bitIndex499) )
        & ( v680(VarCurr,bitIndex6)
        <=> v599(VarCurr,bitIndex498) )
        & ( v680(VarCurr,bitIndex5)
        <=> v599(VarCurr,bitIndex497) )
        & ( v680(VarCurr,bitIndex4)
        <=> v599(VarCurr,bitIndex496) )
        & ( v680(VarCurr,bitIndex3)
        <=> v599(VarCurr,bitIndex495) )
        & ( v680(VarCurr,bitIndex2)
        <=> v599(VarCurr,bitIndex494) )
        & ( v680(VarCurr,bitIndex1)
        <=> v599(VarCurr,bitIndex493) )
        & ( v680(VarCurr,bitIndex0)
        <=> v599(VarCurr,bitIndex492) ) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_86,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( v652(VarNext)
      <=> ( v653(VarNext)
          & v660(VarNext) ) ) ) )).

fof(addAssignment_181,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( v660(VarNext)
      <=> v658(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_85,axiom,(
    ! [VarCurr] :
      ( v658(VarCurr)
    <=> ( v661(VarCurr)
        & v673(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_84,axiom,(
    ! [VarCurr] :
      ( v673(VarCurr)
    <=> ( v674(VarCurr)
        | v662(VarCurr) ) ) )).

fof(writeUnaryOperator_60,axiom,(
    ! [VarCurr] :
      ( ~ v674(VarCurr)
    <=> v675(VarCurr) ) )).

fof(addBitVectorEqualityBitBlasted_37,axiom,(
    ! [VarCurr] :
      ( v675(VarCurr)
    <=> ( ( v676(VarCurr,bitIndex1)
        <=> $false )
        & ( v676(VarCurr,bitIndex0)
        <=> $false ) ) ) )).

fof(addAssignment_180,axiom,(
    ! [VarCurr] :
      ( v676(VarCurr,bitIndex0)
    <=> v229(VarCurr) ) )).

fof(addAssignment_179,axiom,(
    ! [VarCurr] :
      ( v676(VarCurr,bitIndex1)
    <=> v211(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_83,axiom,(
    ! [VarCurr] :
      ( v661(VarCurr)
    <=> ( v662(VarCurr)
        | v663(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_82,axiom,(
    ! [VarCurr] :
      ( v663(VarCurr)
    <=> ( v664(VarCurr)
        & v672(VarCurr) ) ) )).

fof(writeUnaryOperator_59,axiom,(
    ! [VarCurr] :
      ( ~ v672(VarCurr)
    <=> v662(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_81,axiom,(
    ! [VarCurr] :
      ( v664(VarCurr)
    <=> ( v665(VarCurr)
        | v670(VarCurr) ) ) )).

fof(addBitVectorEqualityBitBlasted_36,axiom,(
    ! [VarCurr] :
      ( v670(VarCurr)
    <=> ( ( v671(VarCurr,bitIndex1)
        <=> $true )
        & ( v671(VarCurr,bitIndex0)
        <=> $true ) ) ) )).

fof(addAssignment_178,axiom,(
    ! [VarCurr] :
      ( v671(VarCurr,bitIndex0)
    <=> v229(VarCurr) ) )).

fof(addAssignment_177,axiom,(
    ! [VarCurr] :
      ( v671(VarCurr,bitIndex1)
    <=> v211(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_80,axiom,(
    ! [VarCurr] :
      ( v665(VarCurr)
    <=> ( v666(VarCurr)
        | v668(VarCurr) ) ) )).

fof(addBitVectorEqualityBitBlasted_35,axiom,(
    ! [VarCurr] :
      ( v668(VarCurr)
    <=> ( ( v669(VarCurr,bitIndex1)
        <=> $true )
        & ( v669(VarCurr,bitIndex0)
        <=> $false ) ) ) )).

fof(addAssignment_176,axiom,(
    ! [VarCurr] :
      ( v669(VarCurr,bitIndex0)
    <=> v229(VarCurr) ) )).

fof(addAssignment_175,axiom,(
    ! [VarCurr] :
      ( v669(VarCurr,bitIndex1)
    <=> v211(VarCurr) ) )).

fof(addBitVectorEqualityBitBlasted_34,axiom,(
    ! [VarCurr] :
      ( v666(VarCurr)
    <=> ( ( v667(VarCurr,bitIndex1)
        <=> $false )
        & ( v667(VarCurr,bitIndex0)
        <=> $true ) ) ) )).

fof(addAssignment_174,axiom,(
    ! [VarCurr] :
      ( v667(VarCurr,bitIndex0)
    <=> v229(VarCurr) ) )).

fof(addAssignment_173,axiom,(
    ! [VarCurr] :
      ( v667(VarCurr,bitIndex1)
    <=> v211(VarCurr) ) )).

fof(writeUnaryOperator_58,axiom,(
    ! [VarCurr] :
      ( ~ v662(VarCurr)
    <=> v209(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_79,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( v653(VarNext)
      <=> ( v654(VarNext)
          & v565(VarNext) ) ) ) )).

fof(writeUnaryOperator_57,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( ~ v654(VarNext)
      <=> v572(VarNext) ) ) )).

fof(addAssignment_172,axiom,(
    ! [VarCurr,B] :
      ( range_122_116(B)
     => ( v644(VarCurr,B)
      <=> v649(VarCurr,B) ) ) )).

fof(aaddConditionBooleanCondEqualRangesElseBranch_19,axiom,(
    ! [VarCurr] :
      ( ~ v646(VarCurr)
     => ! [B] :
          ( range_122_0(B)
         => ( v649(VarCurr,B)
          <=> v648(VarCurr,B) ) ) ) )).

fof(addConditionBooleanCondEqualRangesThenBranch_19,axiom,(
    ! [VarCurr] :
      ( v646(VarCurr)
     => ! [B] :
          ( range_122_0(B)
         => ( v649(VarCurr,B)
          <=> v625(VarCurr,B) ) ) ) )).

fof(addAssignment_171,axiom,(
    ! [VarCurr] :
      ( ( v648(VarCurr,bitIndex122)
      <=> v599(VarCurr,bitIndex614) )
      & ( v648(VarCurr,bitIndex121)
      <=> v599(VarCurr,bitIndex613) )
      & ( v648(VarCurr,bitIndex120)
      <=> v599(VarCurr,bitIndex612) )
      & ( v648(VarCurr,bitIndex119)
      <=> v599(VarCurr,bitIndex611) )
      & ( v648(VarCurr,bitIndex118)
      <=> v599(VarCurr,bitIndex610) )
      & ( v648(VarCurr,bitIndex117)
      <=> v599(VarCurr,bitIndex609) )
      & ( v648(VarCurr,bitIndex116)
      <=> v599(VarCurr,bitIndex608) ) ) )).

fof(addAssignment_170,axiom,(
    ! [VarCurr] :
      ( v646(VarCurr)
    <=> v606(VarCurr,bitIndex1) ) )).

fof(addAssignment_169,axiom,(
    ! [VarCurr,B] :
      ( range_122_116(B)
     => ( v602(VarCurr,B)
      <=> v642(VarCurr,B) ) ) )).

fof(aaddConditionBooleanCondEqualRangesElseBranch_18,axiom,(
    ! [VarCurr] :
      ( ~ v604(VarCurr)
     => ! [B] :
          ( range_122_0(B)
         => ( v642(VarCurr,B)
          <=> v641(VarCurr,B) ) ) ) )).

fof(addConditionBooleanCondEqualRangesThenBranch_18,axiom,(
    ! [VarCurr] :
      ( v604(VarCurr)
     => ! [B] :
          ( range_122_0(B)
         => ( v642(VarCurr,B)
          <=> v625(VarCurr,B) ) ) ) )).

fof(range_axiom_9,axiom,(
    ! [B] :
      ( range_122_0(B)
    <=> ( $false
        | bitIndex0 = B
        | bitIndex1 = B
        | bitIndex2 = B
        | bitIndex3 = B
        | bitIndex4 = B
        | bitIndex5 = B
        | bitIndex6 = B
        | bitIndex7 = B
        | bitIndex8 = B
        | bitIndex9 = B
        | bitIndex10 = B
        | bitIndex11 = B
        | bitIndex12 = B
        | bitIndex13 = B
        | bitIndex14 = B
        | bitIndex15 = B
        | bitIndex16 = B
        | bitIndex17 = B
        | bitIndex18 = B
        | bitIndex19 = B
        | bitIndex20 = B
        | bitIndex21 = B
        | bitIndex22 = B
        | bitIndex23 = B
        | bitIndex24 = B
        | bitIndex25 = B
        | bitIndex26 = B
        | bitIndex27 = B
        | bitIndex28 = B
        | bitIndex29 = B
        | bitIndex30 = B
        | bitIndex31 = B
        | bitIndex32 = B
        | bitIndex33 = B
        | bitIndex34 = B
        | bitIndex35 = B
        | bitIndex36 = B
        | bitIndex37 = B
        | bitIndex38 = B
        | bitIndex39 = B
        | bitIndex40 = B
        | bitIndex41 = B
        | bitIndex42 = B
        | bitIndex43 = B
        | bitIndex44 = B
        | bitIndex45 = B
        | bitIndex46 = B
        | bitIndex47 = B
        | bitIndex48 = B
        | bitIndex49 = B
        | bitIndex50 = B
        | bitIndex51 = B
        | bitIndex52 = B
        | bitIndex53 = B
        | bitIndex54 = B
        | bitIndex55 = B
        | bitIndex56 = B
        | bitIndex57 = B
        | bitIndex58 = B
        | bitIndex59 = B
        | bitIndex60 = B
        | bitIndex61 = B
        | bitIndex62 = B
        | bitIndex63 = B
        | bitIndex64 = B
        | bitIndex65 = B
        | bitIndex66 = B
        | bitIndex67 = B
        | bitIndex68 = B
        | bitIndex69 = B
        | bitIndex70 = B
        | bitIndex71 = B
        | bitIndex72 = B
        | bitIndex73 = B
        | bitIndex74 = B
        | bitIndex75 = B
        | bitIndex76 = B
        | bitIndex77 = B
        | bitIndex78 = B
        | bitIndex79 = B
        | bitIndex80 = B
        | bitIndex81 = B
        | bitIndex82 = B
        | bitIndex83 = B
        | bitIndex84 = B
        | bitIndex85 = B
        | bitIndex86 = B
        | bitIndex87 = B
        | bitIndex88 = B
        | bitIndex89 = B
        | bitIndex90 = B
        | bitIndex91 = B
        | bitIndex92 = B
        | bitIndex93 = B
        | bitIndex94 = B
        | bitIndex95 = B
        | bitIndex96 = B
        | bitIndex97 = B
        | bitIndex98 = B
        | bitIndex99 = B
        | bitIndex100 = B
        | bitIndex101 = B
        | bitIndex102 = B
        | bitIndex103 = B
        | bitIndex104 = B
        | bitIndex105 = B
        | bitIndex106 = B
        | bitIndex107 = B
        | bitIndex108 = B
        | bitIndex109 = B
        | bitIndex110 = B
        | bitIndex111 = B
        | bitIndex112 = B
        | bitIndex113 = B
        | bitIndex114 = B
        | bitIndex115 = B
        | bitIndex116 = B
        | bitIndex117 = B
        | bitIndex118 = B
        | bitIndex119 = B
        | bitIndex120 = B
        | bitIndex121 = B
        | bitIndex122 = B ) ) )).

fof(addAssignment_168,axiom,(
    ! [VarCurr] :
      ( ( v641(VarCurr,bitIndex122)
      <=> v599(VarCurr,bitIndex737) )
      & ( v641(VarCurr,bitIndex121)
      <=> v599(VarCurr,bitIndex736) )
      & ( v641(VarCurr,bitIndex120)
      <=> v599(VarCurr,bitIndex735) )
      & ( v641(VarCurr,bitIndex119)
      <=> v599(VarCurr,bitIndex734) )
      & ( v641(VarCurr,bitIndex118)
      <=> v599(VarCurr,bitIndex733) )
      & ( v641(VarCurr,bitIndex117)
      <=> v599(VarCurr,bitIndex732) )
      & ( v641(VarCurr,bitIndex116)
      <=> v599(VarCurr,bitIndex731) ) ) )).

fof(addAssignment_167,axiom,(
    ! [VarCurr,B] :
      ( range_122_116(B)
     => ( v625(VarCurr,B)
      <=> v627(VarCurr,B) ) ) )).

fof(addAssignment_166,axiom,(
    ! [VarCurr,B] :
      ( range_122_116(B)
     => ( v627(VarCurr,B)
      <=> v629(VarCurr,B) ) ) )).

fof(addAssignment_165,axiom,(
    ! [VarCurr,B] :
      ( range_122_116(B)
     => ( v629(VarCurr,B)
      <=> v631(VarCurr,B) ) ) )).

fof(addAssignment_164,axiom,(
    ! [VarCurr,B] :
      ( range_122_116(B)
     => ( v631(VarCurr,B)
      <=> v633(VarCurr,B) ) ) )).

fof(addAssignment_163,axiom,(
    ! [VarCurr,B] :
      ( range_122_116(B)
     => ( v633(VarCurr,B)
      <=> v635(VarCurr,B) ) ) )).

fof(addAssignment_162,axiom,(
    ! [VarCurr,B] :
      ( range_122_116(B)
     => ( v635(VarCurr,B)
      <=> v637(VarCurr,B) ) ) )).

fof(addAssignment_161,axiom,(
    ! [VarCurr,B] :
      ( range_122_116(B)
     => ( v637(VarCurr,B)
      <=> v639(VarCurr,B) ) ) )).

fof(range_axiom_8,axiom,(
    ! [B] :
      ( range_122_116(B)
    <=> ( $false
        | bitIndex116 = B
        | bitIndex117 = B
        | bitIndex118 = B
        | bitIndex119 = B
        | bitIndex120 = B
        | bitIndex121 = B
        | bitIndex122 = B ) ) )).

fof(addAssignment_160,axiom,(
    ! [VarCurr] :
      ( v604(VarCurr)
    <=> v606(VarCurr,bitIndex1) ) )).

fof(addAssignment_159,axiom,(
    ! [VarCurr] :
      ( v606(VarCurr,bitIndex1)
    <=> v608(VarCurr,bitIndex1) ) )).

fof(aaddConditionBooleanCondEqualRangesElseBranch_17,axiom,(
    ! [VarCurr] :
      ( ~ v609(VarCurr)
     => ! [B] :
          ( range_8_0(B)
         => ( v608(VarCurr,B)
          <=> v611(VarCurr,B) ) ) ) )).

fof(addConditionBooleanCondEqualRangesThenBranch_17,axiom,(
    ! [VarCurr] :
      ( v609(VarCurr)
     => ! [B] :
          ( range_8_0(B)
         => ( v608(VarCurr,B)
          <=> v610(VarCurr,B) ) ) ) )).

fof(addParallelCaseBooleanConditionEqualRanges3_2,axiom,(
    ! [VarCurr] :
      ( ( ~ v612(VarCurr)
        & ~ v614(VarCurr)
        & ~ v618(VarCurr) )
     => ! [B] :
          ( range_8_0(B)
         => ( v611(VarCurr,B)
          <=> v562(VarCurr,B) ) ) ) )).

fof(addParallelCaseBooleanConditionEqualRanges2_4,axiom,(
    ! [VarCurr] :
      ( v618(VarCurr)
     => ! [B] :
          ( range_8_0(B)
         => ( v611(VarCurr,B)
          <=> v620(VarCurr,B) ) ) ) )).

fof(addParallelCaseBooleanConditionEqualRanges1_8,axiom,(
    ! [VarCurr] :
      ( v614(VarCurr)
     => ! [B] :
          ( range_8_0(B)
         => ( v611(VarCurr,B)
          <=> v616(VarCurr,B) ) ) ) )).

fof(addParallelCaseBooleanConditionEqualRanges0_8,axiom,(
    ! [VarCurr] :
      ( v612(VarCurr)
     => ! [B] :
          ( range_8_0(B)
         => ( v611(VarCurr,B)
          <=> v562(VarCurr,B) ) ) ) )).

fof(range_axiom_7,axiom,(
    ! [B] :
      ( range_8_0(B)
    <=> ( $false
        | bitIndex0 = B
        | bitIndex1 = B
        | bitIndex2 = B
        | bitIndex3 = B
        | bitIndex4 = B
        | bitIndex5 = B
        | bitIndex6 = B
        | bitIndex7 = B
        | bitIndex8 = B ) ) )).

fof(addBitVectorEqualityBitBlasted_33,axiom,(
    ! [VarCurr] :
      ( v622(VarCurr)
    <=> ( ( v623(VarCurr,bitIndex1)
        <=> $true )
        & ( v623(VarCurr,bitIndex0)
        <=> $true ) ) ) )).

fof(addAssignment_158,axiom,(
    ! [VarCurr] :
      ( v623(VarCurr,bitIndex0)
    <=> v229(VarCurr) ) )).

fof(addAssignment_157,axiom,(
    ! [VarCurr] :
      ( v623(VarCurr,bitIndex1)
    <=> v211(VarCurr) ) )).

fof(addAssignment_156,axiom,(
    ! [VarCurr] :
      ( v620(VarCurr,bitIndex0)
    <=> $false ) )).

fof(addAssignment_155,axiom,(
    ! [VarCurr] :
      ( ( v620(VarCurr,bitIndex8)
      <=> v562(VarCurr,bitIndex7) )
      & ( v620(VarCurr,bitIndex7)
      <=> v562(VarCurr,bitIndex6) )
      & ( v620(VarCurr,bitIndex6)
      <=> v562(VarCurr,bitIndex5) )
      & ( v620(VarCurr,bitIndex5)
      <=> v562(VarCurr,bitIndex4) )
      & ( v620(VarCurr,bitIndex4)
      <=> v562(VarCurr,bitIndex3) )
      & ( v620(VarCurr,bitIndex3)
      <=> v562(VarCurr,bitIndex2) )
      & ( v620(VarCurr,bitIndex2)
      <=> v562(VarCurr,bitIndex1) )
      & ( v620(VarCurr,bitIndex1)
      <=> v562(VarCurr,bitIndex0) ) ) )).

fof(addBitVectorEqualityBitBlasted_32,axiom,(
    ! [VarCurr] :
      ( v618(VarCurr)
    <=> ( ( v619(VarCurr,bitIndex1)
        <=> $true )
        & ( v619(VarCurr,bitIndex0)
        <=> $false ) ) ) )).

fof(addAssignment_154,axiom,(
    ! [VarCurr] :
      ( v619(VarCurr,bitIndex0)
    <=> v229(VarCurr) ) )).

fof(addAssignment_153,axiom,(
    ! [VarCurr] :
      ( v619(VarCurr,bitIndex1)
    <=> v211(VarCurr) ) )).

fof(addAssignment_152,axiom,(
    ! [VarCurr] :
      ( ( v616(VarCurr,bitIndex7)
      <=> v562(VarCurr,bitIndex8) )
      & ( v616(VarCurr,bitIndex6)
      <=> v562(VarCurr,bitIndex7) )
      & ( v616(VarCurr,bitIndex5)
      <=> v562(VarCurr,bitIndex6) )
      & ( v616(VarCurr,bitIndex4)
      <=> v562(VarCurr,bitIndex5) )
      & ( v616(VarCurr,bitIndex3)
      <=> v562(VarCurr,bitIndex4) )
      & ( v616(VarCurr,bitIndex2)
      <=> v562(VarCurr,bitIndex3) )
      & ( v616(VarCurr,bitIndex1)
      <=> v562(VarCurr,bitIndex2) )
      & ( v616(VarCurr,bitIndex0)
      <=> v562(VarCurr,bitIndex1) ) ) )).

fof(addAssignment_151,axiom,(
    ! [VarCurr] :
      ( v616(VarCurr,bitIndex8)
    <=> $false ) )).

fof(addBitVectorEqualityBitBlasted_31,axiom,(
    ! [VarCurr] :
      ( v614(VarCurr)
    <=> ( ( v615(VarCurr,bitIndex1)
        <=> $false )
        & ( v615(VarCurr,bitIndex0)
        <=> $true ) ) ) )).

fof(addAssignment_150,axiom,(
    ! [VarCurr] :
      ( v615(VarCurr,bitIndex0)
    <=> v229(VarCurr) ) )).

fof(addAssignment_149,axiom,(
    ! [VarCurr] :
      ( v615(VarCurr,bitIndex1)
    <=> v211(VarCurr) ) )).

fof(addBitVectorEqualityBitBlasted_30,axiom,(
    ! [VarCurr] :
      ( v612(VarCurr)
    <=> ( ( v613(VarCurr,bitIndex1)
        <=> $false )
        & ( v613(VarCurr,bitIndex0)
        <=> $false ) ) ) )).

fof(addAssignment_148,axiom,(
    ! [VarCurr] :
      ( v613(VarCurr,bitIndex0)
    <=> v229(VarCurr) ) )).

fof(addAssignment_147,axiom,(
    ! [VarCurr] :
      ( v613(VarCurr,bitIndex1)
    <=> v211(VarCurr) ) )).

fof(addAssignment_146,axiom,(
    ! [VarCurr] :
      ( v610(VarCurr,bitIndex0)
    <=> $true ) )).

fof(addAssignment_145,axiom,(
    ! [VarCurr,B] :
      ( range_8_1(B)
     => ( v610(VarCurr,B)
      <=> v560(VarCurr,B) ) ) )).

fof(writeUnaryOperator_56,axiom,(
    ! [VarCurr] :
      ( ~ v609(VarCurr)
    <=> v209(VarCurr) ) )).

fof(addAssignment_144,axiom,(
    ! [VarCurr] :
      ( v560(VarCurr,bitIndex1)
    <=> v561(VarCurr,bitIndex1) ) )).

fof(addAssignment_143,axiom,(
    ! [VarCurr] :
      ( v205(VarCurr)
    <=> v207(VarCurr) ) )).

fof(addCaseBooleanConditionEqualRanges1_3,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( ~ v568(VarNext)
       => ( v207(VarNext)
        <=> v207(VarCurr) ) ) ) )).

fof(addCaseBooleanConditionEqualRanges0_3,axiom,(
    ! [VarNext] :
      ( v568(VarNext)
     => ( v207(VarNext)
      <=> v588(VarNext) ) ) )).

fof(addAssignment_142,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( v588(VarNext)
      <=> v586(VarCurr) ) ) )).

fof(aaddConditionBooleanCondEqualRangesElseBranch_16,axiom,(
    ! [VarCurr] :
      ( ~ v585(VarCurr)
     => ( v586(VarCurr)
      <=> v589(VarCurr) ) ) )).

fof(addConditionBooleanCondEqualRangesThenBranch_16,axiom,(
    ! [VarCurr] :
      ( v585(VarCurr)
     => ( v586(VarCurr)
      <=> $true ) ) )).

fof(aaddConditionBooleanCondEqualRangesElseBranch_15,axiom,(
    ! [VarCurr] :
      ( ~ v211(VarCurr)
     => ( v589(VarCurr)
      <=> $true ) ) )).

fof(addConditionBooleanCondEqualRangesThenBranch_15,axiom,(
    ! [VarCurr] :
      ( v211(VarCurr)
     => ( v589(VarCurr)
      <=> $false ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_78,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( v568(VarNext)
      <=> ( v569(VarNext)
          & v578(VarNext) ) ) ) )).

fof(addAssignment_141,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( v578(VarNext)
      <=> v576(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_77,axiom,(
    ! [VarCurr] :
      ( v576(VarCurr)
    <=> ( v579(VarCurr)
        | v585(VarCurr) ) ) )).

fof(writeUnaryOperator_55,axiom,(
    ! [VarCurr] :
      ( ~ v585(VarCurr)
    <=> v209(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_76,axiom,(
    ! [VarCurr] :
      ( v579(VarCurr)
    <=> ( v580(VarCurr)
        | v211(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_75,axiom,(
    ! [VarCurr] :
      ( v580(VarCurr)
    <=> ( v581(VarCurr)
        & v584(VarCurr) ) ) )).

fof(addBitVectorEqualityBitBlasted_29,axiom,(
    ! [VarCurr] :
      ( v584(VarCurr)
    <=> ( v560(VarCurr,bitIndex0)
      <=> $true ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_74,axiom,(
    ! [VarCurr] :
      ( v581(VarCurr)
    <=> ( v582(VarCurr)
        & v583(VarCurr) ) ) )).

fof(addBitVectorEqualityBitBlasted_28,axiom,(
    ! [VarCurr] :
      ( v583(VarCurr)
    <=> ( v558(VarCurr,bitIndex1)
      <=> $false ) ) )).

fof(addBitVectorEqualityBitBlasted_27,axiom,(
    ! [VarCurr] :
      ( v582(VarCurr)
    <=> ( v229(VarCurr)
      <=> $true ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_73,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( v569(VarNext)
      <=> ( v570(VarNext)
          & v565(VarNext) ) ) ) )).

fof(writeUnaryOperator_54,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( ~ v570(VarNext)
      <=> v572(VarNext) ) ) )).

fof(addAssignment_140,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( v572(VarNext)
      <=> v565(VarCurr) ) ) )).

fof(addAssignment_139,axiom,(
    ! [VarCurr] :
      ( v565(VarCurr)
    <=> v438(VarCurr) ) )).

fof(addAssignment_138,axiom,(
    ! [VarCurr] :
      ( v560(VarCurr,bitIndex0)
    <=> v561(VarCurr,bitIndex0) ) )).

fof(addAssignment_137,axiom,(
    ! [VarCurr] :
      ( v561(VarCurr,bitIndex0)
    <=> $true ) )).

fof(addAssignment_136,axiom,(
    ! [VarCurr,B] :
      ( range_8_1(B)
     => ( v561(VarCurr,B)
      <=> v562(VarCurr,B) ) ) )).

fof(range_axiom_6,axiom,(
    ! [B] :
      ( range_8_1(B)
    <=> ( $false
        | bitIndex1 = B
        | bitIndex2 = B
        | bitIndex3 = B
        | bitIndex4 = B
        | bitIndex5 = B
        | bitIndex6 = B
        | bitIndex7 = B
        | bitIndex8 = B ) ) )).

fof(addAssignment_135,axiom,(
    ! [VarCurr] :
      ( v229(VarCurr)
    <=> v231(VarCurr) ) )).

fof(aaddConditionBooleanCondEqualRangesElseBranch_14,axiom,(
    ! [VarCurr] :
      ( ~ v544(VarCurr)
     => ( v231(VarCurr)
      <=> $false ) ) )).

fof(addConditionBooleanCondEqualRangesThenBranch_14,axiom,(
    ! [VarCurr] :
      ( v544(VarCurr)
     => ( v231(VarCurr)
      <=> v553(VarCurr) ) ) )).

fof(addParallelCaseBooleanConditionEqualRanges1_7,axiom,(
    ! [VarCurr] :
      ( ~ v546(VarCurr)
     => ( v553(VarCurr)
      <=> $false ) ) )).

fof(addParallelCaseBooleanConditionEqualRanges0_7,axiom,(
    ! [VarCurr] :
      ( v546(VarCurr)
     => ( v553(VarCurr)
      <=> v554(VarCurr) ) ) )).

fof(addParallelCaseBooleanConditionEqualRanges2_3,axiom,(
    ! [VarCurr] :
      ( ( ~ v549(VarCurr)
        & ~ v381(VarCurr) )
     => ( v554(VarCurr)
      <=> $true ) ) )).

fof(addParallelCaseBooleanConditionEqualRanges1_6,axiom,(
    ! [VarCurr] :
      ( v381(VarCurr)
     => ( v554(VarCurr)
      <=> v556(VarCurr) ) ) )).

fof(addParallelCaseBooleanConditionEqualRanges0_6,axiom,(
    ! [VarCurr] :
      ( v549(VarCurr)
     => ( v554(VarCurr)
      <=> v555(VarCurr) ) ) )).

fof(aaddConditionBooleanCondEqualRangesElseBranch_13,axiom,(
    ! [VarCurr] :
      ( ~ v269(VarCurr)
     => ( v556(VarCurr)
      <=> $false ) ) )).

fof(addConditionBooleanCondEqualRangesThenBranch_13,axiom,(
    ! [VarCurr] :
      ( v269(VarCurr)
     => ( v556(VarCurr)
      <=> $true ) ) )).

fof(aaddConditionBooleanCondEqualRangesElseBranch_12,axiom,(
    ! [VarCurr] :
      ( ~ v537(VarCurr)
     => ( v555(VarCurr)
      <=> $false ) ) )).

fof(addConditionBooleanCondEqualRangesThenBranch_12,axiom,(
    ! [VarCurr] :
      ( v537(VarCurr)
     => ( v555(VarCurr)
      <=> $true ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_72,axiom,(
    ! [VarCurr] :
      ( v544(VarCurr)
    <=> ( v545(VarCurr)
        & v552(VarCurr) ) ) )).

fof(writeUnaryOperator_53,axiom,(
    ! [VarCurr] :
      ( ~ v552(VarCurr)
    <=> v385(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_71,axiom,(
    ! [VarCurr] :
      ( v545(VarCurr)
    <=> ( v546(VarCurr)
        | v551(VarCurr) ) ) )).

fof(writeUnaryOperator_52,axiom,(
    ! [VarCurr] :
      ( ~ v551(VarCurr)
    <=> v382(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_70,axiom,(
    ! [VarCurr] :
      ( v546(VarCurr)
    <=> ( v547(VarCurr)
        & v382(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_69,axiom,(
    ! [VarCurr] :
      ( v547(VarCurr)
    <=> ( v548(VarCurr)
        | v550(VarCurr) ) ) )).

fof(addBitVectorEqualityBitBlasted_26,axiom,(
    ! [VarCurr] :
      ( v550(VarCurr)
    <=> ( ( v203(VarCurr,bitIndex1)
        <=> $true )
        & ( v203(VarCurr,bitIndex0)
        <=> $false ) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_68,axiom,(
    ! [VarCurr] :
      ( v548(VarCurr)
    <=> ( v549(VarCurr)
        | v381(VarCurr) ) ) )).

fof(addBitVectorEqualityBitBlasted_25,axiom,(
    ! [VarCurr] :
      ( v549(VarCurr)
    <=> ( ( v203(VarCurr,bitIndex1)
        <=> $false )
        & ( v203(VarCurr,bitIndex0)
        <=> $false ) ) ) )).

fof(writeBinaryOperatorShiftedRanges_37,axiom,(
    ! [VarCurr] :
      ( v537(VarCurr)
    <=> ( v542(VarCurr)
        | v539(VarCurr,bitIndex2) ) ) )).

fof(writeBinaryOperatorShiftedRanges_36,axiom,(
    ! [VarCurr] :
      ( v542(VarCurr)
    <=> ( v539(VarCurr,bitIndex0)
        | v539(VarCurr,bitIndex1) ) ) )).

fof(addAssignment_134,axiom,(
    ! [VarCurr] :
      ( v233(VarCurr)
    <=> v235(VarCurr) ) )).

fof(addBitVectorEqualityBitBlasted_24,axiom,(
    ! [VarCurr] :
      ( v235(VarCurr)
    <=> ( ( v237(VarCurr,bitIndex2)
        <=> $false )
        & ( v237(VarCurr,bitIndex1)
        <=> $false )
        & ( v237(VarCurr,bitIndex0)
        <=> $false ) ) ) )).

fof(addCaseBooleanConditionEqualRanges1_2,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( ~ v521(VarNext)
       => ! [B] :
            ( range_2_0(B)
           => ( v237(VarNext,B)
            <=> v237(VarCurr,B) ) ) ) ) )).

fof(addCaseBooleanConditionEqualRanges0_2,axiom,(
    ! [VarNext] :
      ( v521(VarNext)
     => ! [B] :
          ( range_2_0(B)
         => ( v237(VarNext,B)
          <=> v531(VarNext,B) ) ) ) )).

fof(addAssignment_133,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ! [B] :
          ( range_2_0(B)
         => ( v531(VarNext,B)
          <=> v529(VarCurr,B) ) ) ) )).

fof(aaddConditionBooleanCondEqualRangesElseBranch_11,axiom,(
    ! [VarCurr] :
      ( ~ v532(VarCurr)
     => ! [B] :
          ( range_2_0(B)
         => ( v529(VarCurr,B)
          <=> v242(VarCurr,B) ) ) ) )).

fof(addConditionBooleanCondEqualRangesThenBranch_11,axiom,(
    ! [VarCurr] :
      ( v532(VarCurr)
     => ! [B] :
          ( range_2_0(B)
         => ( v529(VarCurr,B)
          <=> $false ) ) ) )).

fof(writeUnaryOperator_51,axiom,(
    ! [VarCurr] :
      ( ~ v532(VarCurr)
    <=> v239(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_67,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( v521(VarNext)
      <=> v522(VarNext) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_66,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( v522(VarNext)
      <=> ( v523(VarNext)
          & v518(VarNext) ) ) ) )).

fof(writeUnaryOperator_50,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( ~ v523(VarNext)
      <=> v525(VarNext) ) ) )).

fof(addAssignment_132,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( v525(VarNext)
      <=> v518(VarCurr) ) ) )).

fof(addAssignment_131,axiom,(
    ! [VarCurr] :
      ( v518(VarCurr)
    <=> v438(VarCurr) ) )).

fof(addParallelCaseBooleanConditionEqualRanges3_1,axiom,(
    ! [VarCurr] :
      ( ( ~ v468(VarCurr)
        & ~ v470(VarCurr)
        & ~ v498(VarCurr) )
     => ! [B] :
          ( range_2_0(B)
         => ( v242(VarCurr,B)
          <=> v237(VarCurr,B) ) ) ) )).

fof(addParallelCaseBooleanConditionEqualRanges2_2,axiom,(
    ! [VarCurr] :
      ( v498(VarCurr)
     => ! [B] :
          ( range_2_0(B)
         => ( v242(VarCurr,B)
          <=> v500(VarCurr,B) ) ) ) )).

fof(addParallelCaseBooleanConditionEqualRanges1_5,axiom,(
    ! [VarCurr] :
      ( v470(VarCurr)
     => ! [B] :
          ( range_2_0(B)
         => ( v242(VarCurr,B)
          <=> v472(VarCurr,B) ) ) ) )).

fof(addParallelCaseBooleanConditionEqualRanges0_5,axiom,(
    ! [VarCurr] :
      ( v468(VarCurr)
     => ! [B] :
          ( range_2_0(B)
         => ( v242(VarCurr,B)
          <=> v237(VarCurr,B) ) ) ) )).

fof(addBitVectorEqualityBitBlasted_23,axiom,(
    ! [VarCurr] :
      ( v515(VarCurr)
    <=> ( ( v516(VarCurr,bitIndex1)
        <=> $true )
        & ( v516(VarCurr,bitIndex0)
        <=> $true ) ) ) )).

fof(addAssignment_130,axiom,(
    ! [VarCurr] :
      ( v516(VarCurr,bitIndex0)
    <=> v263(VarCurr) ) )).

fof(addAssignment_129,axiom,(
    ! [VarCurr] :
      ( v516(VarCurr,bitIndex1)
    <=> v244(VarCurr) ) )).

fof(aaddConditionBooleanCondEqualRangesElseBranch_10,axiom,(
    ! [VarCurr] :
      ( ~ v501(VarCurr)
     => ! [B] :
          ( range_2_0(B)
         => ( v500(VarCurr,B)
          <=> v502(VarCurr,B) ) ) ) )).

fof(addConditionBooleanCondEqualRangesThenBranch_10,axiom,(
    ! [VarCurr] :
      ( v501(VarCurr)
     => ! [B] :
          ( range_2_0(B)
         => ( v500(VarCurr,B)
          <=> b100(B) ) ) ) )).

fof(addAssignment_128,axiom,(
    ! [VarCurr] :
      ( v502(VarCurr,bitIndex0)
    <=> v512(VarCurr) ) )).

fof(addAssignment_127,axiom,(
    ! [VarCurr] :
      ( v502(VarCurr,bitIndex1)
    <=> v510(VarCurr) ) )).

fof(addAssignment_126,axiom,(
    ! [VarCurr] :
      ( v502(VarCurr,bitIndex2)
    <=> v504(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_65,axiom,(
    ! [VarCurr] :
      ( v510(VarCurr)
    <=> ( v511(VarCurr)
        & v514(VarCurr) ) ) )).

fof(writeBinaryOperatorShiftedRanges_35,axiom,(
    ! [VarCurr] :
      ( v514(VarCurr)
    <=> ( v237(VarCurr,bitIndex0)
        | v237(VarCurr,bitIndex1) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_64,axiom,(
    ! [VarCurr] :
      ( v511(VarCurr)
    <=> ( v512(VarCurr)
        | v513(VarCurr) ) ) )).

fof(writeUnaryOperator_49,axiom,(
    ! [VarCurr] :
      ( ~ v513(VarCurr)
    <=> v237(VarCurr,bitIndex1) ) )).

fof(writeUnaryOperator_48,axiom,(
    ! [VarCurr] :
      ( ~ v512(VarCurr)
    <=> v237(VarCurr,bitIndex0) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_63,axiom,(
    ! [VarCurr] :
      ( v504(VarCurr)
    <=> ( v505(VarCurr)
        & v509(VarCurr) ) ) )).

fof(writeBinaryOperatorShiftedRanges_34,axiom,(
    ! [VarCurr] :
      ( v509(VarCurr)
    <=> ( v507(VarCurr)
        | v237(VarCurr,bitIndex2) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_62,axiom,(
    ! [VarCurr] :
      ( v505(VarCurr)
    <=> ( v506(VarCurr)
        | v508(VarCurr) ) ) )).

fof(writeUnaryOperator_47,axiom,(
    ! [VarCurr] :
      ( ~ v508(VarCurr)
    <=> v237(VarCurr,bitIndex2) ) )).

fof(writeUnaryOperator_46,axiom,(
    ! [VarCurr] :
      ( ~ v506(VarCurr)
    <=> v507(VarCurr) ) )).

fof(writeBinaryOperatorShiftedRanges_33,axiom,(
    ! [VarCurr] :
      ( v507(VarCurr)
    <=> ( v237(VarCurr,bitIndex0)
        & v237(VarCurr,bitIndex1) ) ) )).

fof(addBitVectorEqualityBitBlasted_22,axiom,(
    ! [VarCurr] :
      ( v501(VarCurr)
    <=> ( ( v237(VarCurr,bitIndex2)
        <=> $true )
        & ( v237(VarCurr,bitIndex1)
        <=> $false )
        & ( v237(VarCurr,bitIndex0)
        <=> $false ) ) ) )).

fof(bitBlastConstant_69,axiom,(
    b100(bitIndex2) )).

fof(bitBlastConstant_68,axiom,(
    ~ b100(bitIndex1) )).

fof(bitBlastConstant_67,axiom,(
    ~ b100(bitIndex0) )).

fof(addBitVectorEqualityBitBlasted_21,axiom,(
    ! [VarCurr] :
      ( v498(VarCurr)
    <=> ( ( v499(VarCurr,bitIndex1)
        <=> $true )
        & ( v499(VarCurr,bitIndex0)
        <=> $false ) ) ) )).

fof(addAssignment_125,axiom,(
    ! [VarCurr] :
      ( v499(VarCurr,bitIndex0)
    <=> v263(VarCurr) ) )).

fof(addAssignment_124,axiom,(
    ! [VarCurr] :
      ( v499(VarCurr,bitIndex1)
    <=> v244(VarCurr) ) )).

fof(aaddConditionBooleanCondEqualRangesElseBranch_9,axiom,(
    ! [VarCurr] :
      ( ~ v473(VarCurr)
     => ! [B] :
          ( range_31_0(B)
         => ( v472(VarCurr,B)
          <=> v474(VarCurr,B) ) ) ) )).

fof(addConditionBooleanCondEqualRangesThenBranch_9,axiom,(
    ! [VarCurr] :
      ( v473(VarCurr)
     => ! [B] :
          ( range_31_0(B)
         => ( v472(VarCurr,B)
          <=> $false ) ) ) )).

fof(addSignExtensionConstraint_53,axiom,(
    ! [VarCurr] :
      ( v474(VarCurr,bitIndex4)
    <=> v475(VarCurr,bitIndex3) ) )).

fof(addSignExtensionConstraint_52,axiom,(
    ! [VarCurr] :
      ( v474(VarCurr,bitIndex5)
    <=> v475(VarCurr,bitIndex3) ) )).

fof(addSignExtensionConstraint_51,axiom,(
    ! [VarCurr] :
      ( v474(VarCurr,bitIndex6)
    <=> v475(VarCurr,bitIndex3) ) )).

fof(addSignExtensionConstraint_50,axiom,(
    ! [VarCurr] :
      ( v474(VarCurr,bitIndex7)
    <=> v475(VarCurr,bitIndex3) ) )).

fof(addSignExtensionConstraint_49,axiom,(
    ! [VarCurr] :
      ( v474(VarCurr,bitIndex8)
    <=> v475(VarCurr,bitIndex3) ) )).

fof(addSignExtensionConstraint_48,axiom,(
    ! [VarCurr] :
      ( v474(VarCurr,bitIndex9)
    <=> v475(VarCurr,bitIndex3) ) )).

fof(addSignExtensionConstraint_47,axiom,(
    ! [VarCurr] :
      ( v474(VarCurr,bitIndex10)
    <=> v475(VarCurr,bitIndex3) ) )).

fof(addSignExtensionConstraint_46,axiom,(
    ! [VarCurr] :
      ( v474(VarCurr,bitIndex11)
    <=> v475(VarCurr,bitIndex3) ) )).

fof(addSignExtensionConstraint_45,axiom,(
    ! [VarCurr] :
      ( v474(VarCurr,bitIndex12)
    <=> v475(VarCurr,bitIndex3) ) )).

fof(addSignExtensionConstraint_44,axiom,(
    ! [VarCurr] :
      ( v474(VarCurr,bitIndex13)
    <=> v475(VarCurr,bitIndex3) ) )).

fof(addSignExtensionConstraint_43,axiom,(
    ! [VarCurr] :
      ( v474(VarCurr,bitIndex14)
    <=> v475(VarCurr,bitIndex3) ) )).

fof(addSignExtensionConstraint_42,axiom,(
    ! [VarCurr] :
      ( v474(VarCurr,bitIndex15)
    <=> v475(VarCurr,bitIndex3) ) )).

fof(addSignExtensionConstraint_41,axiom,(
    ! [VarCurr] :
      ( v474(VarCurr,bitIndex16)
    <=> v475(VarCurr,bitIndex3) ) )).

fof(addSignExtensionConstraint_40,axiom,(
    ! [VarCurr] :
      ( v474(VarCurr,bitIndex17)
    <=> v475(VarCurr,bitIndex3) ) )).

fof(addSignExtensionConstraint_39,axiom,(
    ! [VarCurr] :
      ( v474(VarCurr,bitIndex18)
    <=> v475(VarCurr,bitIndex3) ) )).

fof(addSignExtensionConstraint_38,axiom,(
    ! [VarCurr] :
      ( v474(VarCurr,bitIndex19)
    <=> v475(VarCurr,bitIndex3) ) )).

fof(addSignExtensionConstraint_37,axiom,(
    ! [VarCurr] :
      ( v474(VarCurr,bitIndex20)
    <=> v475(VarCurr,bitIndex3) ) )).

fof(addSignExtensionConstraint_36,axiom,(
    ! [VarCurr] :
      ( v474(VarCurr,bitIndex21)
    <=> v475(VarCurr,bitIndex3) ) )).

fof(addSignExtensionConstraint_35,axiom,(
    ! [VarCurr] :
      ( v474(VarCurr,bitIndex22)
    <=> v475(VarCurr,bitIndex3) ) )).

fof(addSignExtensionConstraint_34,axiom,(
    ! [VarCurr] :
      ( v474(VarCurr,bitIndex23)
    <=> v475(VarCurr,bitIndex3) ) )).

fof(addSignExtensionConstraint_33,axiom,(
    ! [VarCurr] :
      ( v474(VarCurr,bitIndex24)
    <=> v475(VarCurr,bitIndex3) ) )).

fof(addSignExtensionConstraint_32,axiom,(
    ! [VarCurr] :
      ( v474(VarCurr,bitIndex25)
    <=> v475(VarCurr,bitIndex3) ) )).

fof(addSignExtensionConstraint_31,axiom,(
    ! [VarCurr] :
      ( v474(VarCurr,bitIndex26)
    <=> v475(VarCurr,bitIndex3) ) )).

fof(addSignExtensionConstraint_30,axiom,(
    ! [VarCurr] :
      ( v474(VarCurr,bitIndex27)
    <=> v475(VarCurr,bitIndex3) ) )).

fof(addSignExtensionConstraint_29,axiom,(
    ! [VarCurr] :
      ( v474(VarCurr,bitIndex28)
    <=> v475(VarCurr,bitIndex3) ) )).

fof(addSignExtensionConstraint_28,axiom,(
    ! [VarCurr] :
      ( v474(VarCurr,bitIndex29)
    <=> v475(VarCurr,bitIndex3) ) )).

fof(addSignExtensionConstraint_27,axiom,(
    ! [VarCurr] :
      ( v474(VarCurr,bitIndex30)
    <=> v475(VarCurr,bitIndex3) ) )).

fof(addSignExtensionConstraint_26,axiom,(
    ! [VarCurr] :
      ( v474(VarCurr,bitIndex31)
    <=> v475(VarCurr,bitIndex3) ) )).

fof(addAssignment_123,axiom,(
    ! [VarCurr,B] :
      ( range_3_0(B)
     => ( v474(VarCurr,B)
      <=> v475(VarCurr,B) ) ) )).

fof(addAssignment_122,axiom,(
    ! [VarCurr] :
      ( v475(VarCurr,bitIndex0)
    <=> v496(VarCurr) ) )).

fof(addAssignment_121,axiom,(
    ! [VarCurr] :
      ( v475(VarCurr,bitIndex1)
    <=> v494(VarCurr) ) )).

fof(addAssignment_120,axiom,(
    ! [VarCurr] :
      ( v475(VarCurr,bitIndex2)
    <=> v490(VarCurr) ) )).

fof(addAssignment_119,axiom,(
    ! [VarCurr] :
      ( v475(VarCurr,bitIndex3)
    <=> v477(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_61,axiom,(
    ! [VarCurr] :
      ( v494(VarCurr)
    <=> ( v495(VarCurr)
        & v497(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_60,axiom,(
    ! [VarCurr] :
      ( v497(VarCurr)
    <=> ( v481(VarCurr,bitIndex0)
        | v486(VarCurr) ) ) )).

fof(writeBinaryOperatorShiftedRanges_32,axiom,(
    ! [VarCurr] :
      ( v495(VarCurr)
    <=> ( v496(VarCurr)
        | v481(VarCurr,bitIndex1) ) ) )).

fof(writeUnaryOperator_45,axiom,(
    ! [VarCurr] :
      ( ~ v496(VarCurr)
    <=> v481(VarCurr,bitIndex0) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_59,axiom,(
    ! [VarCurr] :
      ( v490(VarCurr)
    <=> ( v491(VarCurr)
        & v493(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_58,axiom,(
    ! [VarCurr] :
      ( v493(VarCurr)
    <=> ( v484(VarCurr)
        | v487(VarCurr) ) ) )).

fof(writeBinaryOperatorShiftedRanges_31,axiom,(
    ! [VarCurr] :
      ( v491(VarCurr)
    <=> ( v492(VarCurr)
        | v481(VarCurr,bitIndex2) ) ) )).

fof(writeUnaryOperator_44,axiom,(
    ! [VarCurr] :
      ( ~ v492(VarCurr)
    <=> v484(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_57,axiom,(
    ! [VarCurr] :
      ( v477(VarCurr)
    <=> ( v478(VarCurr)
        & v488(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_56,axiom,(
    ! [VarCurr] :
      ( v488(VarCurr)
    <=> ( v480(VarCurr)
        | v489(VarCurr) ) ) )).

fof(writeUnaryOperator_43,axiom,(
    ! [VarCurr] :
      ( ~ v489(VarCurr)
    <=> v481(VarCurr,bitIndex3) ) )).

fof(writeBinaryOperatorShiftedRanges_30,axiom,(
    ! [VarCurr] :
      ( v478(VarCurr)
    <=> ( v479(VarCurr)
        | v481(VarCurr,bitIndex3) ) ) )).

fof(writeUnaryOperator_42,axiom,(
    ! [VarCurr] :
      ( ~ v479(VarCurr)
    <=> v480(VarCurr) ) )).

fof(writeBinaryOperatorShiftedRanges_29,axiom,(
    ! [VarCurr] :
      ( v480(VarCurr)
    <=> ( v481(VarCurr,bitIndex2)
        | v483(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_55,axiom,(
    ! [VarCurr] :
      ( v483(VarCurr)
    <=> ( v484(VarCurr)
        & v487(VarCurr) ) ) )).

fof(writeUnaryOperator_41,axiom,(
    ! [VarCurr] :
      ( ~ v487(VarCurr)
    <=> v481(VarCurr,bitIndex2) ) )).

fof(writeBinaryOperatorShiftedRanges_28,axiom,(
    ! [VarCurr] :
      ( v484(VarCurr)
    <=> ( v481(VarCurr,bitIndex1)
        | v485(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_54,axiom,(
    ! [VarCurr] :
      ( v485(VarCurr)
    <=> ( v481(VarCurr,bitIndex0)
        & v486(VarCurr) ) ) )).

fof(writeUnaryOperator_40,axiom,(
    ! [VarCurr] :
      ( ~ v486(VarCurr)
    <=> v481(VarCurr,bitIndex1) ) )).

fof(addZeroExtensionConstraint_1,axiom,(
    ! [VarCurr] : ~ v481(VarCurr,bitIndex3) )).

fof(addAssignment_118,axiom,(
    ! [VarCurr,B] :
      ( range_2_0(B)
     => ( v481(VarCurr,B)
      <=> v237(VarCurr,B) ) ) )).

fof(range_axiom_5,axiom,(
    ! [B] :
      ( range_2_0(B)
    <=> ( $false
        | bitIndex0 = B
        | bitIndex1 = B
        | bitIndex2 = B ) ) )).

fof(addBitVectorEqualityBitBlasted_20,axiom,(
    ! [VarCurr] :
      ( v473(VarCurr)
    <=> ( ( v237(VarCurr,bitIndex2)
        <=> $false )
        & ( v237(VarCurr,bitIndex1)
        <=> $false )
        & ( v237(VarCurr,bitIndex0)
        <=> $false ) ) ) )).

fof(bitBlastConstant_66,axiom,(
    ~ b000(bitIndex2) )).

fof(bitBlastConstant_65,axiom,(
    ~ b000(bitIndex1) )).

fof(bitBlastConstant_64,axiom,(
    ~ b000(bitIndex0) )).

fof(addBitVectorEqualityBitBlasted_19,axiom,(
    ! [VarCurr] :
      ( v470(VarCurr)
    <=> ( ( v471(VarCurr,bitIndex1)
        <=> $false )
        & ( v471(VarCurr,bitIndex0)
        <=> $true ) ) ) )).

fof(addAssignment_117,axiom,(
    ! [VarCurr] :
      ( v471(VarCurr,bitIndex0)
    <=> v263(VarCurr) ) )).

fof(addAssignment_116,axiom,(
    ! [VarCurr] :
      ( v471(VarCurr,bitIndex1)
    <=> v244(VarCurr) ) )).

fof(addBitVectorEqualityBitBlasted_18,axiom,(
    ! [VarCurr] :
      ( v468(VarCurr)
    <=> ( ( v469(VarCurr,bitIndex1)
        <=> $false )
        & ( v469(VarCurr,bitIndex0)
        <=> $false ) ) ) )).

fof(addAssignment_115,axiom,(
    ! [VarCurr] :
      ( v469(VarCurr,bitIndex0)
    <=> v263(VarCurr) ) )).

fof(addAssignment_114,axiom,(
    ! [VarCurr] :
      ( v469(VarCurr,bitIndex1)
    <=> v244(VarCurr) ) )).

fof(addAssignment_113,axiom,(
    ! [VarCurr] :
      ( v263(VarCurr)
    <=> v265(VarCurr) ) )).

fof(addAssignment_112,axiom,(
    ! [VarCurr] :
      ( v265(VarCurr)
    <=> v267(VarCurr) ) )).

fof(aaddConditionBooleanCondEqualRangesElseBranch_8,axiom,(
    ! [VarCurr] :
      ( ~ v461(VarCurr)
     => ( v267(VarCurr)
      <=> $false ) ) )).

fof(addConditionBooleanCondEqualRangesThenBranch_8,axiom,(
    ! [VarCurr] :
      ( v461(VarCurr)
     => ( v267(VarCurr)
      <=> v465(VarCurr) ) ) )).

fof(addParallelCaseBooleanConditionEqualRanges1_4,axiom,(
    ! [VarCurr] :
      ( ~ v385(VarCurr)
     => ( v465(VarCurr)
      <=> $false ) ) )).

fof(addParallelCaseBooleanConditionEqualRanges0_4,axiom,(
    ! [VarCurr] :
      ( v385(VarCurr)
     => ( v465(VarCurr)
      <=> $true ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_53,axiom,(
    ! [VarCurr] :
      ( v461(VarCurr)
    <=> ( v385(VarCurr)
        | v462(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_52,axiom,(
    ! [VarCurr] :
      ( v462(VarCurr)
    <=> ( v463(VarCurr)
        & v464(VarCurr) ) ) )).

fof(writeUnaryOperator_39,axiom,(
    ! [VarCurr] :
      ( ~ v464(VarCurr)
    <=> v385(VarCurr) ) )).

fof(writeUnaryOperator_38,axiom,(
    ! [VarCurr] :
      ( ~ v463(VarCurr)
    <=> v382(VarCurr) ) )).

fof(writeBinaryOperatorShiftedRanges_27,axiom,(
    ! [VarCurr] :
      ( v269(VarCurr)
    <=> ( v459(VarCurr)
        | v271(VarCurr,bitIndex3) ) ) )).

fof(writeBinaryOperatorShiftedRanges_26,axiom,(
    ! [VarCurr] :
      ( v459(VarCurr)
    <=> ( v431(VarCurr)
        | v271(VarCurr,bitIndex2) ) ) )).

fof(addCaseBooleanConditionEqualRanges1_1,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( ~ v443(VarNext)
       => ! [B] :
            ( range_3_0(B)
           => ( v271(VarNext,B)
            <=> v271(VarCurr,B) ) ) ) ) )).

fof(addCaseBooleanConditionEqualRanges0_1,axiom,(
    ! [VarNext] :
      ( v443(VarNext)
     => ! [B] :
          ( range_3_0(B)
         => ( v271(VarNext,B)
          <=> v453(VarNext,B) ) ) ) )).

fof(addAssignment_111,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ! [B] :
          ( range_3_0(B)
         => ( v453(VarNext,B)
          <=> v451(VarCurr,B) ) ) ) )).

fof(aaddConditionBooleanCondEqualRangesElseBranch_7,axiom,(
    ! [VarCurr] :
      ( ~ v454(VarCurr)
     => ! [B] :
          ( range_3_0(B)
         => ( v451(VarCurr,B)
          <=> v274(VarCurr,B) ) ) ) )).

fof(addConditionBooleanCondEqualRangesThenBranch_7,axiom,(
    ! [VarCurr] :
      ( v454(VarCurr)
     => ! [B] :
          ( range_3_0(B)
         => ( v451(VarCurr,B)
          <=> b1000(B) ) ) ) )).

fof(bitBlastConstant_63,axiom,(
    b1000(bitIndex3) )).

fof(bitBlastConstant_62,axiom,(
    ~ b1000(bitIndex2) )).

fof(bitBlastConstant_61,axiom,(
    ~ b1000(bitIndex1) )).

fof(bitBlastConstant_60,axiom,(
    ~ b1000(bitIndex0) )).

fof(writeUnaryOperator_37,axiom,(
    ! [VarCurr] :
      ( ~ v454(VarCurr)
    <=> v197(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_51,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( v443(VarNext)
      <=> v444(VarNext) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_50,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( v444(VarNext)
      <=> ( v445(VarNext)
          & v438(VarNext) ) ) ) )).

fof(writeUnaryOperator_36,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( ~ v445(VarNext)
      <=> v447(VarNext) ) ) )).

fof(addAssignment_110,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( v447(VarNext)
      <=> v438(VarCurr) ) ) )).

fof(addAssignment_109,axiom,(
    ! [VarCurr] :
      ( v438(VarCurr)
    <=> v440(VarCurr) ) )).

fof(addAssignment_108,axiom,(
    ! [VarCurr] :
      ( v440(VarCurr)
    <=> v156(VarCurr) ) )).

fof(addParallelCaseBooleanConditionEqualRanges2_1,axiom,(
    ! [VarCurr] :
      ( ( ~ v392(VarCurr)
        & ~ v415(VarCurr) )
     => ! [B] :
          ( range_3_0(B)
         => ( v274(VarCurr,B)
          <=> v271(VarCurr,B) ) ) ) )).

fof(addParallelCaseBooleanConditionEqualRanges1_3,axiom,(
    ! [VarCurr] :
      ( v415(VarCurr)
     => ! [B] :
          ( range_3_0(B)
         => ( v274(VarCurr,B)
          <=> v417(VarCurr,B) ) ) ) )).

fof(addParallelCaseBooleanConditionEqualRanges0_3,axiom,(
    ! [VarCurr] :
      ( v392(VarCurr)
     => ! [B] :
          ( range_3_0(B)
         => ( v274(VarCurr,B)
          <=> v394(VarCurr,B) ) ) ) )).

fof(range_axiom_4,axiom,(
    ! [B] :
      ( range_3_0(B)
    <=> ( $false
        | bitIndex0 = B
        | bitIndex1 = B
        | bitIndex2 = B
        | bitIndex3 = B ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_49,axiom,(
    ! [VarCurr] :
      ( v432(VarCurr)
    <=> ( v433(VarCurr)
        | v435(VarCurr) ) ) )).

fof(addBitVectorEqualityBitBlasted_17,axiom,(
    ! [VarCurr] :
      ( v435(VarCurr)
    <=> ( ( v436(VarCurr,bitIndex1)
        <=> $true )
        & ( v436(VarCurr,bitIndex0)
        <=> $true ) ) ) )).

fof(addAssignment_107,axiom,(
    ! [VarCurr] :
      ( v436(VarCurr,bitIndex0)
    <=> v374(VarCurr) ) )).

fof(addAssignment_106,axiom,(
    ! [VarCurr] :
      ( v436(VarCurr,bitIndex1)
    <=> v276(VarCurr) ) )).

fof(addBitVectorEqualityBitBlasted_16,axiom,(
    ! [VarCurr] :
      ( v433(VarCurr)
    <=> ( ( v434(VarCurr,bitIndex1)
        <=> $false )
        & ( v434(VarCurr,bitIndex0)
        <=> $false ) ) ) )).

fof(addAssignment_105,axiom,(
    ! [VarCurr] :
      ( v434(VarCurr,bitIndex0)
    <=> v374(VarCurr) ) )).

fof(addAssignment_104,axiom,(
    ! [VarCurr] :
      ( v434(VarCurr,bitIndex1)
    <=> v276(VarCurr) ) )).

fof(addAssignment_103,axiom,(
    ! [VarCurr] :
      ( v417(VarCurr,bitIndex0)
    <=> v413(VarCurr) ) )).

fof(addAssignment_102,axiom,(
    ! [VarCurr] :
      ( v417(VarCurr,bitIndex1)
    <=> v429(VarCurr) ) )).

fof(addAssignment_101,axiom,(
    ! [VarCurr] :
      ( v417(VarCurr,bitIndex2)
    <=> v425(VarCurr) ) )).

fof(addAssignment_100,axiom,(
    ! [VarCurr] :
      ( v417(VarCurr,bitIndex3)
    <=> v419(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_48,axiom,(
    ! [VarCurr] :
      ( v429(VarCurr)
    <=> ( v430(VarCurr)
        & v431(VarCurr) ) ) )).

fof(writeBinaryOperatorShiftedRanges_25,axiom,(
    ! [VarCurr] :
      ( v431(VarCurr)
    <=> ( v271(VarCurr,bitIndex0)
        | v271(VarCurr,bitIndex1) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_47,axiom,(
    ! [VarCurr] :
      ( v430(VarCurr)
    <=> ( v413(VarCurr)
        | v403(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_46,axiom,(
    ! [VarCurr] :
      ( v425(VarCurr)
    <=> ( v426(VarCurr)
        & v428(VarCurr) ) ) )).

fof(writeBinaryOperatorShiftedRanges_24,axiom,(
    ! [VarCurr] :
      ( v428(VarCurr)
    <=> ( v271(VarCurr,bitIndex2)
        | v423(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_45,axiom,(
    ! [VarCurr] :
      ( v426(VarCurr)
    <=> ( v404(VarCurr)
        | v427(VarCurr) ) ) )).

fof(writeUnaryOperator_35,axiom,(
    ! [VarCurr] :
      ( ~ v427(VarCurr)
    <=> v423(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_44,axiom,(
    ! [VarCurr] :
      ( v419(VarCurr)
    <=> ( v420(VarCurr)
        & v424(VarCurr) ) ) )).

fof(writeBinaryOperatorShiftedRanges_23,axiom,(
    ! [VarCurr] :
      ( v424(VarCurr)
    <=> ( v271(VarCurr,bitIndex3)
        | v422(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_43,axiom,(
    ! [VarCurr] :
      ( v420(VarCurr)
    <=> ( v406(VarCurr)
        | v421(VarCurr) ) ) )).

fof(writeUnaryOperator_34,axiom,(
    ! [VarCurr] :
      ( ~ v421(VarCurr)
    <=> v422(VarCurr) ) )).

fof(writeBinaryOperatorShiftedRanges_22,axiom,(
    ! [VarCurr] :
      ( v422(VarCurr)
    <=> ( v271(VarCurr,bitIndex2)
        & v423(VarCurr) ) ) )).

fof(writeBinaryOperatorShiftedRanges_21,axiom,(
    ! [VarCurr] :
      ( v423(VarCurr)
    <=> ( v271(VarCurr,bitIndex0)
        & v271(VarCurr,bitIndex1) ) ) )).

fof(addBitVectorEqualityBitBlasted_15,axiom,(
    ! [VarCurr] :
      ( v415(VarCurr)
    <=> ( ( v416(VarCurr,bitIndex1)
        <=> $true )
        & ( v416(VarCurr,bitIndex0)
        <=> $false ) ) ) )).

fof(addAssignment_99,axiom,(
    ! [VarCurr] :
      ( v416(VarCurr,bitIndex0)
    <=> v374(VarCurr) ) )).

fof(addAssignment_98,axiom,(
    ! [VarCurr] :
      ( v416(VarCurr,bitIndex1)
    <=> v276(VarCurr) ) )).

fof(addAssignment_97,axiom,(
    ! [VarCurr] :
      ( v394(VarCurr,bitIndex0)
    <=> v413(VarCurr) ) )).

fof(addAssignment_96,axiom,(
    ! [VarCurr] :
      ( v394(VarCurr,bitIndex1)
    <=> v411(VarCurr) ) )).

fof(addAssignment_95,axiom,(
    ! [VarCurr] :
      ( v394(VarCurr,bitIndex2)
    <=> v407(VarCurr) ) )).

fof(addAssignment_94,axiom,(
    ! [VarCurr] :
      ( v394(VarCurr,bitIndex3)
    <=> v396(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_42,axiom,(
    ! [VarCurr] :
      ( v411(VarCurr)
    <=> ( v412(VarCurr)
        & v414(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_41,axiom,(
    ! [VarCurr] :
      ( v414(VarCurr)
    <=> ( v271(VarCurr,bitIndex0)
        | v403(VarCurr) ) ) )).

fof(writeBinaryOperatorShiftedRanges_20,axiom,(
    ! [VarCurr] :
      ( v412(VarCurr)
    <=> ( v413(VarCurr)
        | v271(VarCurr,bitIndex1) ) ) )).

fof(writeUnaryOperator_33,axiom,(
    ! [VarCurr] :
      ( ~ v413(VarCurr)
    <=> v271(VarCurr,bitIndex0) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_40,axiom,(
    ! [VarCurr] :
      ( v407(VarCurr)
    <=> ( v408(VarCurr)
        & v410(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_39,axiom,(
    ! [VarCurr] :
      ( v410(VarCurr)
    <=> ( v401(VarCurr)
        | v404(VarCurr) ) ) )).

fof(writeBinaryOperatorShiftedRanges_19,axiom,(
    ! [VarCurr] :
      ( v408(VarCurr)
    <=> ( v409(VarCurr)
        | v271(VarCurr,bitIndex2) ) ) )).

fof(writeUnaryOperator_32,axiom,(
    ! [VarCurr] :
      ( ~ v409(VarCurr)
    <=> v401(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_38,axiom,(
    ! [VarCurr] :
      ( v396(VarCurr)
    <=> ( v397(VarCurr)
        & v405(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_37,axiom,(
    ! [VarCurr] :
      ( v405(VarCurr)
    <=> ( v399(VarCurr)
        | v406(VarCurr) ) ) )).

fof(writeUnaryOperator_31,axiom,(
    ! [VarCurr] :
      ( ~ v406(VarCurr)
    <=> v271(VarCurr,bitIndex3) ) )).

fof(writeBinaryOperatorShiftedRanges_18,axiom,(
    ! [VarCurr] :
      ( v397(VarCurr)
    <=> ( v398(VarCurr)
        | v271(VarCurr,bitIndex3) ) ) )).

fof(writeUnaryOperator_30,axiom,(
    ! [VarCurr] :
      ( ~ v398(VarCurr)
    <=> v399(VarCurr) ) )).

fof(writeBinaryOperatorShiftedRanges_17,axiom,(
    ! [VarCurr] :
      ( v399(VarCurr)
    <=> ( v271(VarCurr,bitIndex2)
        | v400(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_36,axiom,(
    ! [VarCurr] :
      ( v400(VarCurr)
    <=> ( v401(VarCurr)
        & v404(VarCurr) ) ) )).

fof(writeUnaryOperator_29,axiom,(
    ! [VarCurr] :
      ( ~ v404(VarCurr)
    <=> v271(VarCurr,bitIndex2) ) )).

fof(writeBinaryOperatorShiftedRanges_16,axiom,(
    ! [VarCurr] :
      ( v401(VarCurr)
    <=> ( v271(VarCurr,bitIndex1)
        | v402(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_35,axiom,(
    ! [VarCurr] :
      ( v402(VarCurr)
    <=> ( v271(VarCurr,bitIndex0)
        & v403(VarCurr) ) ) )).

fof(writeUnaryOperator_28,axiom,(
    ! [VarCurr] :
      ( ~ v403(VarCurr)
    <=> v271(VarCurr,bitIndex1) ) )).

fof(addBitVectorEqualityBitBlasted_14,axiom,(
    ! [VarCurr] :
      ( v392(VarCurr)
    <=> ( ( v393(VarCurr,bitIndex1)
        <=> $false )
        & ( v393(VarCurr,bitIndex0)
        <=> $true ) ) ) )).

fof(addAssignment_93,axiom,(
    ! [VarCurr] :
      ( v393(VarCurr,bitIndex0)
    <=> v374(VarCurr) ) )).

fof(addAssignment_92,axiom,(
    ! [VarCurr] :
      ( v393(VarCurr,bitIndex1)
    <=> v276(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_34,axiom,(
    ! [VarCurr] :
      ( v374(VarCurr)
    <=> ( v267(VarCurr)
        | v376(VarCurr) ) ) )).

fof(aaddConditionBooleanCondEqualRangesElseBranch_6,axiom,(
    ! [VarCurr] :
      ( ~ v378(VarCurr)
     => ( v376(VarCurr)
      <=> $false ) ) )).

fof(addConditionBooleanCondEqualRangesThenBranch_6,axiom,(
    ! [VarCurr] :
      ( v378(VarCurr)
     => ( v376(VarCurr)
      <=> v387(VarCurr) ) ) )).

fof(addParallelCaseBooleanConditionEqualRanges1_2,axiom,(
    ! [VarCurr] :
      ( ~ v380(VarCurr)
     => ( v387(VarCurr)
      <=> $false ) ) )).

fof(addParallelCaseBooleanConditionEqualRanges0_2,axiom,(
    ! [VarCurr] :
      ( v380(VarCurr)
     => ( v387(VarCurr)
      <=> v388(VarCurr) ) ) )).

fof(aaddConditionBooleanCondEqualRangesElseBranch_5,axiom,(
    ! [VarCurr] :
      ( ~ v269(VarCurr)
     => ( v388(VarCurr)
      <=> $false ) ) )).

fof(addConditionBooleanCondEqualRangesThenBranch_5,axiom,(
    ! [VarCurr] :
      ( v269(VarCurr)
     => ( v388(VarCurr)
      <=> $true ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_33,axiom,(
    ! [VarCurr] :
      ( v378(VarCurr)
    <=> ( v379(VarCurr)
        & v384(VarCurr) ) ) )).

fof(writeUnaryOperator_27,axiom,(
    ! [VarCurr] :
      ( ~ v384(VarCurr)
    <=> v385(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_32,axiom,(
    ! [VarCurr] :
      ( v385(VarCurr)
    <=> ( v386(VarCurr)
        & v269(VarCurr) ) ) )).

fof(writeUnaryOperator_26,axiom,(
    ! [VarCurr] :
      ( ~ v386(VarCurr)
    <=> v233(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_31,axiom,(
    ! [VarCurr] :
      ( v379(VarCurr)
    <=> ( v380(VarCurr)
        | v383(VarCurr) ) ) )).

fof(writeUnaryOperator_25,axiom,(
    ! [VarCurr] :
      ( ~ v383(VarCurr)
    <=> v382(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_30,axiom,(
    ! [VarCurr] :
      ( v380(VarCurr)
    <=> ( v381(VarCurr)
        & v382(VarCurr) ) ) )).

fof(writeUnaryOperator_24,axiom,(
    ! [VarCurr] :
      ( ~ v382(VarCurr)
    <=> v205(VarCurr) ) )).

fof(addBitVectorEqualityBitBlasted_13,axiom,(
    ! [VarCurr] :
      ( v381(VarCurr)
    <=> ( ( v203(VarCurr,bitIndex1)
        <=> $false )
        & ( v203(VarCurr,bitIndex0)
        <=> $true ) ) ) )).

fof(addAssignment_91,axiom,(
    ! [VarCurr] :
      ( v276(VarCurr)
    <=> v278(VarCurr) ) )).

fof(addAssignment_90,axiom,(
    ! [VarCurr] :
      ( v278(VarCurr)
    <=> v280(VarCurr) ) )).

fof(addAssignment_89,axiom,(
    ! [VarCurr] :
      ( v280(VarCurr)
    <=> v282(VarCurr) ) )).

fof(aaddConditionBooleanCondEqualRangesElseBranch_4,axiom,(
    ! [VarCurr] :
      ( ~ v365(VarCurr)
     => ( v282(VarCurr)
      <=> $false ) ) )).

fof(addConditionBooleanCondEqualRangesThenBranch_4,axiom,(
    ! [VarCurr] :
      ( v365(VarCurr)
     => ( v282(VarCurr)
      <=> v372(VarCurr) ) ) )).

fof(addParallelCaseBooleanConditionEqualRanges1_1,axiom,(
    ! [VarCurr] :
      ( ~ v366(VarCurr)
     => ( v372(VarCurr)
      <=> $false ) ) )).

fof(addParallelCaseBooleanConditionEqualRanges0_1,axiom,(
    ! [VarCurr] :
      ( v366(VarCurr)
     => ( v372(VarCurr)
      <=> $true ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_29,axiom,(
    ! [VarCurr] :
      ( v365(VarCurr)
    <=> ( v366(VarCurr)
        | v368(VarCurr) ) ) )).

fof(writeUnaryOperator_23,axiom,(
    ! [VarCurr] :
      ( ~ v368(VarCurr)
    <=> v369(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_28,axiom,(
    ! [VarCurr] :
      ( v369(VarCurr)
    <=> ( v370(VarCurr)
        | v366(VarCurr) ) ) )).

fof(addBitVectorEqualityBitBlasted_12,axiom,(
    ! [VarCurr] :
      ( v370(VarCurr)
    <=> ( ( v371(VarCurr,bitIndex2)
        <=> $false )
        & ( v371(VarCurr,bitIndex1)
        <=> $false )
        & ( v371(VarCurr,bitIndex0)
        <=> $true ) ) ) )).

fof(bitBlastConstant_59,axiom,(
    ~ b001(bitIndex2) )).

fof(bitBlastConstant_58,axiom,(
    ~ b001(bitIndex1) )).

fof(bitBlastConstant_57,axiom,(
    b001(bitIndex0) )).

fof(addAssignment_88,axiom,(
    ! [VarCurr] :
      ( v371(VarCurr,bitIndex0)
    <=> v346(VarCurr) ) )).

fof(addAssignment_87,axiom,(
    ! [VarCurr] :
      ( v371(VarCurr,bitIndex1)
    <=> v321(VarCurr) ) )).

fof(addAssignment_86,axiom,(
    ! [VarCurr] :
      ( v371(VarCurr,bitIndex2)
    <=> v284(VarCurr) ) )).

fof(addBitVectorEqualityBitBlasted_11,axiom,(
    ! [VarCurr] :
      ( v366(VarCurr)
    <=> ( ( v367(VarCurr,bitIndex2)
        <=> $false )
        & ( v367(VarCurr,bitIndex1)
        <=> $true )
        & ( v367(VarCurr,bitIndex0)
        <=> $false ) ) ) )).

fof(bitBlastConstant_56,axiom,(
    ~ b010(bitIndex2) )).

fof(bitBlastConstant_55,axiom,(
    b010(bitIndex1) )).

fof(bitBlastConstant_54,axiom,(
    ~ b010(bitIndex0) )).

fof(addAssignment_85,axiom,(
    ! [VarCurr] :
      ( v367(VarCurr,bitIndex0)
    <=> v346(VarCurr) ) )).

fof(addAssignment_84,axiom,(
    ! [VarCurr] :
      ( v367(VarCurr,bitIndex1)
    <=> v321(VarCurr) ) )).

fof(addAssignment_83,axiom,(
    ! [VarCurr] :
      ( v367(VarCurr,bitIndex2)
    <=> v284(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_27,axiom,(
    ! [VarCurr] :
      ( v346(VarCurr)
    <=> ( v360(VarCurr)
        & v361(VarCurr) ) ) )).

fof(writeUnaryOperator_22,axiom,(
    ! [VarCurr] :
      ( ~ v361(VarCurr)
    <=> v356(VarCurr) ) )).

fof(addBitVectorEqualityBitBlasted_10,axiom,(
    ! [VarCurr] :
      ( v360(VarCurr)
    <=> ( ( v323(VarCurr,bitIndex7)
        <=> v348(VarCurr,bitIndex7) )
        & ( v323(VarCurr,bitIndex6)
        <=> v348(VarCurr,bitIndex6) )
        & ( v323(VarCurr,bitIndex5)
        <=> v348(VarCurr,bitIndex5) )
        & ( v323(VarCurr,bitIndex4)
        <=> v348(VarCurr,bitIndex4) )
        & ( v323(VarCurr,bitIndex3)
        <=> v348(VarCurr,bitIndex3) )
        & ( v323(VarCurr,bitIndex2)
        <=> v348(VarCurr,bitIndex2) )
        & ( v323(VarCurr,bitIndex1)
        <=> v348(VarCurr,bitIndex1) )
        & ( v323(VarCurr,bitIndex0)
        <=> v348(VarCurr,bitIndex0) ) ) ) )).

fof(addAssignment_82,axiom,(
    ! [VarCurr] :
      ( v356(VarCurr)
    <=> v358(VarCurr) ) )).

fof(addAssignment_81,axiom,(
    ! [VarCurr,B] :
      ( range_7_0(B)
     => ( v348(VarCurr,B)
      <=> v350(VarCurr,B) ) ) )).

fof(addAssignment_80,axiom,(
    ! [VarCurr,B] :
      ( range_7_0(B)
     => ( v350(VarCurr,B)
      <=> v352(VarCurr,B) ) ) )).

fof(addAssignment_79,axiom,(
    ! [VarCurr] :
      ( ( v352(VarCurr,bitIndex7)
      <=> v354(VarCurr,bitIndex400) )
      & ( v352(VarCurr,bitIndex6)
      <=> v354(VarCurr,bitIndex399) )
      & ( v352(VarCurr,bitIndex5)
      <=> v354(VarCurr,bitIndex398) )
      & ( v352(VarCurr,bitIndex4)
      <=> v354(VarCurr,bitIndex397) )
      & ( v352(VarCurr,bitIndex3)
      <=> v354(VarCurr,bitIndex396) )
      & ( v352(VarCurr,bitIndex2)
      <=> v354(VarCurr,bitIndex395) )
      & ( v352(VarCurr,bitIndex1)
      <=> v354(VarCurr,bitIndex394) )
      & ( v352(VarCurr,bitIndex0)
      <=> v354(VarCurr,bitIndex393) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_26,axiom,(
    ! [VarCurr] :
      ( v321(VarCurr)
    <=> ( v343(VarCurr)
        & v344(VarCurr) ) ) )).

fof(writeUnaryOperator_21,axiom,(
    ! [VarCurr] :
      ( ~ v344(VarCurr)
    <=> v336(VarCurr) ) )).

fof(addBitVectorEqualityBitBlasted_9,axiom,(
    ! [VarCurr] :
      ( v343(VarCurr)
    <=> ( ( v323(VarCurr,bitIndex7)
        <=> v325(VarCurr,bitIndex7) )
        & ( v323(VarCurr,bitIndex6)
        <=> v325(VarCurr,bitIndex6) )
        & ( v323(VarCurr,bitIndex5)
        <=> v325(VarCurr,bitIndex5) )
        & ( v323(VarCurr,bitIndex4)
        <=> v325(VarCurr,bitIndex4) )
        & ( v323(VarCurr,bitIndex3)
        <=> v325(VarCurr,bitIndex3) )
        & ( v323(VarCurr,bitIndex2)
        <=> v325(VarCurr,bitIndex2) )
        & ( v323(VarCurr,bitIndex1)
        <=> v325(VarCurr,bitIndex1) )
        & ( v323(VarCurr,bitIndex0)
        <=> v325(VarCurr,bitIndex0) ) ) ) )).

fof(addAssignment_78,axiom,(
    ! [VarCurr] :
      ( v336(VarCurr)
    <=> v338(VarCurr) ) )).

fof(addBitVectorEqualityBitBlasted_8,axiom,(
    ! [VarCurr] :
      ( v338(VarCurr)
    <=> ( ( v340(VarCurr,bitIndex3)
        <=> $false )
        & ( v340(VarCurr,bitIndex2)
        <=> $false )
        & ( v340(VarCurr,bitIndex1)
        <=> $false )
        & ( v340(VarCurr,bitIndex0)
        <=> $false ) ) ) )).

fof(bitBlastConstant_53,axiom,(
    ~ b0000(bitIndex3) )).

fof(bitBlastConstant_52,axiom,(
    ~ b0000(bitIndex2) )).

fof(bitBlastConstant_51,axiom,(
    ~ b0000(bitIndex1) )).

fof(bitBlastConstant_50,axiom,(
    ~ b0000(bitIndex0) )).

fof(addAssignment_77,axiom,(
    ! [VarCurr,B] :
      ( range_7_0(B)
     => ( v325(VarCurr,B)
      <=> v327(VarCurr,B) ) ) )).

fof(addAssignment_76,axiom,(
    ! [VarCurr,B] :
      ( range_7_0(B)
     => ( v327(VarCurr,B)
      <=> v329(VarCurr,B) ) ) )).

fof(addAssignment_75,axiom,(
    ! [VarCurr,B] :
      ( range_7_0(B)
     => ( v329(VarCurr,B)
      <=> v334(VarCurr,B) ) ) )).

fof(range_axiom_3,axiom,(
    ! [B] :
      ( range_7_0(B)
    <=> ( $false
        | bitIndex0 = B
        | bitIndex1 = B
        | bitIndex2 = B
        | bitIndex3 = B
        | bitIndex4 = B
        | bitIndex5 = B
        | bitIndex6 = B
        | bitIndex7 = B ) ) )).

fof(addAssignment_74,axiom,(
    ! [VarCurr] :
      ( v284(VarCurr)
    <=> v286(VarCurr) ) )).

fof(addAssignment_73,axiom,(
    ! [VarCurr] :
      ( v286(VarCurr)
    <=> v288(VarCurr) ) )).

fof(addAssignment_72,axiom,(
    ! [VarCurr] :
      ( v288(VarCurr)
    <=> v290(VarCurr) ) )).

fof(addAssignment_71,axiom,(
    ! [VarCurr] :
      ( v290(VarCurr)
    <=> v292(VarCurr) ) )).

fof(addAssignment_70,axiom,(
    ! [VarCurr] :
      ( v292(VarCurr)
    <=> v294(VarCurr) ) )).

fof(addAssignment_69,axiom,(
    ! [VarCurr] :
      ( v294(VarCurr)
    <=> v296(VarCurr) ) )).

fof(addAssignment_68,axiom,(
    ! [VarCurr] :
      ( v296(VarCurr)
    <=> v298(VarCurr) ) )).

fof(addAssignment_67,axiom,(
    ! [VarCurr] :
      ( v298(VarCurr)
    <=> v300(VarCurr) ) )).

fof(addAssignment_66,axiom,(
    ! [VarCurr] :
      ( v300(VarCurr)
    <=> v302(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_25,axiom,(
    ! [VarCurr] :
      ( v302(VarCurr)
    <=> ( v304(VarCurr)
        | v312(VarCurr) ) ) )).

fof(addAssignment_65,axiom,(
    ! [VarCurr] :
      ( v312(VarCurr)
    <=> v314(VarCurr,bitIndex6) ) )).

fof(addAssignment_64,axiom,(
    ! [VarCurr] :
      ( v314(VarCurr,bitIndex6)
    <=> v316(VarCurr,bitIndex6) ) )).

fof(addAssignment_63,axiom,(
    ! [VarCurr] :
      ( v316(VarCurr,bitIndex6)
    <=> v318(VarCurr,bitIndex6) ) )).

fof(addAssignment_62,axiom,(
    ! [VarCurr] :
      ( v304(VarCurr)
    <=> v306(VarCurr,bitIndex2) ) )).

fof(addAssignment_61,axiom,(
    ! [VarCurr] :
      ( v306(VarCurr,bitIndex2)
    <=> v308(VarCurr,bitIndex2) ) )).

fof(addAssignment_60,axiom,(
    ! [VarCurr] :
      ( v308(VarCurr,bitIndex2)
    <=> v310(VarCurr,bitIndex2) ) )).

fof(addAssignment_59,axiom,(
    ! [VarCurr] :
      ( v244(VarCurr)
    <=> v246(VarCurr) ) )).

fof(addAssignment_58,axiom,(
    ! [VarCurr] :
      ( v246(VarCurr)
    <=> v248(VarCurr) ) )).

fof(addAssignment_57,axiom,(
    ! [VarCurr] :
      ( v248(VarCurr)
    <=> v250(VarCurr) ) )).

fof(addAssignment_56,axiom,(
    ! [VarCurr] :
      ( v250(VarCurr)
    <=> v252(VarCurr) ) )).

fof(addAssignment_55,axiom,(
    ! [VarCurr] :
      ( v252(VarCurr)
    <=> v254(VarCurr) ) )).

fof(addAssignment_54,axiom,(
    ! [VarCurr] :
      ( v254(VarCurr)
    <=> v256(VarCurr) ) )).

fof(addAssignment_53,axiom,(
    ! [VarCurr] :
      ( v256(VarCurr)
    <=> v258(VarCurr) ) )).

fof(addBitVectorEqualityBitBlasted_7,axiom,(
    ! [VarCurr] :
      ( v258(VarCurr)
    <=> ( ( v260(VarCurr,bitIndex1)
        <=> $true )
        & ( v260(VarCurr,bitIndex0)
        <=> $true ) ) ) )).

fof(addAssignment_52,axiom,(
    ! [VarCurr] :
      ( v239(VarCurr)
    <=> v197(VarCurr) ) )).

fof(addAssignment_51,axiom,(
    ! [VarCurr] :
      ( v211(VarCurr)
    <=> v213(VarCurr) ) )).

fof(addAssignment_50,axiom,(
    ! [VarCurr] :
      ( v213(VarCurr)
    <=> v215(VarCurr) ) )).

fof(addAssignment_49,axiom,(
    ! [VarCurr] :
      ( v215(VarCurr)
    <=> v217(VarCurr) ) )).

fof(addAssignment_48,axiom,(
    ! [VarCurr] :
      ( v217(VarCurr)
    <=> v219(VarCurr) ) )).

fof(addAssignment_47,axiom,(
    ! [VarCurr] :
      ( v219(VarCurr)
    <=> v221(VarCurr) ) )).

fof(addAssignment_46,axiom,(
    ! [VarCurr] :
      ( v221(VarCurr)
    <=> v223(VarCurr) ) )).

fof(addAssignment_45,axiom,(
    ! [VarCurr] :
      ( v223(VarCurr)
    <=> v225(VarCurr) ) )).

fof(addAssignment_44,axiom,(
    ! [VarCurr] :
      ( v225(VarCurr)
    <=> v227(VarCurr,bitIndex1) ) )).

fof(addAssignment_43,axiom,(
    ! [VarCurr] :
      ( v209(VarCurr)
    <=> v197(VarCurr) ) )).

fof(addAssignment_42,axiom,(
    ! [VarCurr] :
      ( v197(VarCurr)
    <=> v199(VarCurr) ) )).

fof(addAssignment_41,axiom,(
    ! [VarCurr] :
      ( v199(VarCurr)
    <=> v16(VarCurr) ) )).

fof(addAssignment_40,axiom,(
    ! [VarCurr] :
      ( v181(VarCurr)
    <=> v12(VarCurr) ) )).

fof(addAssignment_39,axiom,(
    ! [VarCurr] :
      ( v33(VarCurr)
    <=> v35(VarCurr) ) )).

fof(addBitVectorEqualityBitBlasted_6,axiom,(
    ! [VarCurr] :
      ( v35(VarCurr)
    <=> ( ( v37(VarCurr,bitIndex4)
        <=> $false )
        & ( v37(VarCurr,bitIndex3)
        <=> $false )
        & ( v37(VarCurr,bitIndex2)
        <=> $false )
        & ( v37(VarCurr,bitIndex1)
        <=> $false )
        & ( v37(VarCurr,bitIndex0)
        <=> $false ) ) ) )).

fof(addCaseBooleanConditionEqualRanges1,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( ~ v159(VarNext)
       => ! [B] :
            ( range_4_0(B)
           => ( v37(VarNext,B)
            <=> v37(VarCurr,B) ) ) ) ) )).

fof(addCaseBooleanConditionEqualRanges0,axiom,(
    ! [VarNext] :
      ( v159(VarNext)
     => ! [B] :
          ( range_4_0(B)
         => ( v37(VarNext,B)
          <=> v169(VarNext,B) ) ) ) )).

fof(addAssignment_38,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ! [B] :
          ( range_4_0(B)
         => ( v169(VarNext,B)
          <=> v167(VarCurr,B) ) ) ) )).

fof(aaddConditionBooleanCondEqualRangesElseBranch_3,axiom,(
    ! [VarCurr] :
      ( ~ v170(VarCurr)
     => ! [B] :
          ( range_4_0(B)
         => ( v167(VarCurr,B)
          <=> v40(VarCurr,B) ) ) ) )).

fof(addConditionBooleanCondEqualRangesThenBranch_3,axiom,(
    ! [VarCurr] :
      ( v170(VarCurr)
     => ! [B] :
          ( range_4_0(B)
         => ( v167(VarCurr,B)
          <=> $false ) ) ) )).

fof(writeUnaryOperator_20,axiom,(
    ! [VarCurr] :
      ( ~ v170(VarCurr)
    <=> v10(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_24,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( v159(VarNext)
      <=> v160(VarNext) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_23,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( v160(VarNext)
      <=> ( v161(VarNext)
          & v150(VarNext) ) ) ) )).

fof(writeUnaryOperator_19,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( ~ v161(VarNext)
      <=> v163(VarNext) ) ) )).

fof(addAssignment_37,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( v163(VarNext)
      <=> v150(VarCurr) ) ) )).

fof(addAssignment_36,axiom,(
    ! [VarCurr] :
      ( v150(VarCurr)
    <=> v152(VarCurr) ) )).

fof(addAssignment_35,axiom,(
    ! [VarCurr] :
      ( v152(VarCurr)
    <=> v154(VarCurr) ) )).

fof(addAssignment_34,axiom,(
    ! [VarCurr] :
      ( v154(VarCurr)
    <=> v156(VarCurr) ) )).

fof(addAssignment_33,axiom,(
    ! [VarCurr] :
      ( v156(VarCurr)
    <=> v1(VarCurr) ) )).

fof(addParallelCaseBooleanConditionEqualRanges3,axiom,(
    ! [VarCurr] :
      ( ( ~ v73(VarCurr)
        & ~ v75(VarCurr)
        & ~ v118(VarCurr) )
     => ! [B] :
          ( range_4_0(B)
         => ( v40(VarCurr,B)
          <=> v37(VarCurr,B) ) ) ) )).

fof(addParallelCaseBooleanConditionEqualRanges2,axiom,(
    ! [VarCurr] :
      ( v118(VarCurr)
     => ! [B] :
          ( range_4_0(B)
         => ( v40(VarCurr,B)
          <=> v120(VarCurr,B) ) ) ) )).

fof(addParallelCaseBooleanConditionEqualRanges1,axiom,(
    ! [VarCurr] :
      ( v75(VarCurr)
     => ! [B] :
          ( range_4_0(B)
         => ( v40(VarCurr,B)
          <=> v77(VarCurr,B) ) ) ) )).

fof(addParallelCaseBooleanConditionEqualRanges0,axiom,(
    ! [VarCurr] :
      ( v73(VarCurr)
     => ! [B] :
          ( range_4_0(B)
         => ( v40(VarCurr,B)
          <=> v37(VarCurr,B) ) ) ) )).

fof(addBitVectorEqualityBitBlasted_5,axiom,(
    ! [VarCurr] :
      ( v147(VarCurr)
    <=> ( ( v148(VarCurr,bitIndex1)
        <=> $true )
        & ( v148(VarCurr,bitIndex0)
        <=> $true ) ) ) )).

fof(bitBlastConstant_49,axiom,(
    b11(bitIndex1) )).

fof(bitBlastConstant_48,axiom,(
    b11(bitIndex0) )).

fof(addAssignment_32,axiom,(
    ! [VarCurr] :
      ( v148(VarCurr,bitIndex0)
    <=> v25(VarCurr) ) )).

fof(addAssignment_31,axiom,(
    ! [VarCurr] :
      ( v148(VarCurr,bitIndex1)
    <=> v42(VarCurr) ) )).

fof(aaddConditionBooleanCondEqualRangesElseBranch_2,axiom,(
    ! [VarCurr] :
      ( ~ v121(VarCurr)
     => ! [B] :
          ( range_4_0(B)
         => ( v120(VarCurr,B)
          <=> v122(VarCurr,B) ) ) ) )).

fof(addConditionBooleanCondEqualRangesThenBranch_2,axiom,(
    ! [VarCurr] :
      ( v121(VarCurr)
     => ! [B] :
          ( range_4_0(B)
         => ( v120(VarCurr,B)
          <=> b01111(B) ) ) ) )).

fof(addAssignment_30,axiom,(
    ! [VarCurr] :
      ( v122(VarCurr,bitIndex0)
    <=> v144(VarCurr) ) )).

fof(addAssignment_29,axiom,(
    ! [VarCurr] :
      ( v122(VarCurr,bitIndex1)
    <=> v142(VarCurr) ) )).

fof(addAssignment_28,axiom,(
    ! [VarCurr] :
      ( v122(VarCurr,bitIndex2)
    <=> v137(VarCurr) ) )).

fof(addAssignment_27,axiom,(
    ! [VarCurr] :
      ( v122(VarCurr,bitIndex3)
    <=> v132(VarCurr) ) )).

fof(addAssignment_26,axiom,(
    ! [VarCurr] :
      ( v122(VarCurr,bitIndex4)
    <=> v124(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_22,axiom,(
    ! [VarCurr] :
      ( v142(VarCurr)
    <=> ( v143(VarCurr)
        & v146(VarCurr) ) ) )).

fof(writeBinaryOperatorShiftedRanges_15,axiom,(
    ! [VarCurr] :
      ( v146(VarCurr)
    <=> ( v37(VarCurr,bitIndex0)
        | v37(VarCurr,bitIndex1) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_21,axiom,(
    ! [VarCurr] :
      ( v143(VarCurr)
    <=> ( v144(VarCurr)
        | v145(VarCurr) ) ) )).

fof(writeUnaryOperator_18,axiom,(
    ! [VarCurr] :
      ( ~ v145(VarCurr)
    <=> v37(VarCurr,bitIndex1) ) )).

fof(writeUnaryOperator_17,axiom,(
    ! [VarCurr] :
      ( ~ v144(VarCurr)
    <=> v37(VarCurr,bitIndex0) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_20,axiom,(
    ! [VarCurr] :
      ( v137(VarCurr)
    <=> ( v138(VarCurr)
        & v141(VarCurr) ) ) )).

fof(writeBinaryOperatorShiftedRanges_14,axiom,(
    ! [VarCurr] :
      ( v141(VarCurr)
    <=> ( v129(VarCurr)
        | v37(VarCurr,bitIndex2) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_19,axiom,(
    ! [VarCurr] :
      ( v138(VarCurr)
    <=> ( v139(VarCurr)
        | v140(VarCurr) ) ) )).

fof(writeUnaryOperator_16,axiom,(
    ! [VarCurr] :
      ( ~ v140(VarCurr)
    <=> v37(VarCurr,bitIndex2) ) )).

fof(writeUnaryOperator_15,axiom,(
    ! [VarCurr] :
      ( ~ v139(VarCurr)
    <=> v129(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_18,axiom,(
    ! [VarCurr] :
      ( v132(VarCurr)
    <=> ( v133(VarCurr)
        & v136(VarCurr) ) ) )).

fof(writeBinaryOperatorShiftedRanges_13,axiom,(
    ! [VarCurr] :
      ( v136(VarCurr)
    <=> ( v128(VarCurr)
        | v37(VarCurr,bitIndex3) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_17,axiom,(
    ! [VarCurr] :
      ( v133(VarCurr)
    <=> ( v134(VarCurr)
        | v135(VarCurr) ) ) )).

fof(writeUnaryOperator_14,axiom,(
    ! [VarCurr] :
      ( ~ v135(VarCurr)
    <=> v37(VarCurr,bitIndex3) ) )).

fof(writeUnaryOperator_13,axiom,(
    ! [VarCurr] :
      ( ~ v134(VarCurr)
    <=> v128(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_16,axiom,(
    ! [VarCurr] :
      ( v124(VarCurr)
    <=> ( v125(VarCurr)
        & v131(VarCurr) ) ) )).

fof(writeBinaryOperatorShiftedRanges_12,axiom,(
    ! [VarCurr] :
      ( v131(VarCurr)
    <=> ( v127(VarCurr)
        | v37(VarCurr,bitIndex4) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_15,axiom,(
    ! [VarCurr] :
      ( v125(VarCurr)
    <=> ( v126(VarCurr)
        | v130(VarCurr) ) ) )).

fof(writeUnaryOperator_12,axiom,(
    ! [VarCurr] :
      ( ~ v130(VarCurr)
    <=> v37(VarCurr,bitIndex4) ) )).

fof(writeUnaryOperator_11,axiom,(
    ! [VarCurr] :
      ( ~ v126(VarCurr)
    <=> v127(VarCurr) ) )).

fof(writeBinaryOperatorShiftedRanges_11,axiom,(
    ! [VarCurr] :
      ( v127(VarCurr)
    <=> ( v128(VarCurr)
        & v37(VarCurr,bitIndex3) ) ) )).

fof(writeBinaryOperatorShiftedRanges_10,axiom,(
    ! [VarCurr] :
      ( v128(VarCurr)
    <=> ( v129(VarCurr)
        & v37(VarCurr,bitIndex2) ) ) )).

fof(writeBinaryOperatorShiftedRanges_9,axiom,(
    ! [VarCurr] :
      ( v129(VarCurr)
    <=> ( v37(VarCurr,bitIndex0)
        & v37(VarCurr,bitIndex1) ) ) )).

fof(addBitVectorEqualityBitBlasted_4,axiom,(
    ! [VarCurr] :
      ( v121(VarCurr)
    <=> ( ( v37(VarCurr,bitIndex4)
        <=> $false )
        & ( v37(VarCurr,bitIndex3)
        <=> $true )
        & ( v37(VarCurr,bitIndex2)
        <=> $true )
        & ( v37(VarCurr,bitIndex1)
        <=> $true )
        & ( v37(VarCurr,bitIndex0)
        <=> $true ) ) ) )).

fof(bitBlastConstant_47,axiom,(
    ~ b01111(bitIndex4) )).

fof(bitBlastConstant_46,axiom,(
    b01111(bitIndex3) )).

fof(bitBlastConstant_45,axiom,(
    b01111(bitIndex2) )).

fof(bitBlastConstant_44,axiom,(
    b01111(bitIndex1) )).

fof(bitBlastConstant_43,axiom,(
    b01111(bitIndex0) )).

fof(addBitVectorEqualityBitBlasted_3,axiom,(
    ! [VarCurr] :
      ( v118(VarCurr)
    <=> ( ( v119(VarCurr,bitIndex1)
        <=> $true )
        & ( v119(VarCurr,bitIndex0)
        <=> $false ) ) ) )).

fof(bitBlastConstant_42,axiom,(
    b10(bitIndex1) )).

fof(bitBlastConstant_41,axiom,(
    ~ b10(bitIndex0) )).

fof(addAssignment_25,axiom,(
    ! [VarCurr] :
      ( v119(VarCurr,bitIndex0)
    <=> v25(VarCurr) ) )).

fof(addAssignment_24,axiom,(
    ! [VarCurr] :
      ( v119(VarCurr,bitIndex1)
    <=> v42(VarCurr) ) )).

fof(aaddConditionBooleanCondEqualRangesElseBranch_1,axiom,(
    ! [VarCurr] :
      ( ~ v78(VarCurr)
     => ! [B] :
          ( range_31_0(B)
         => ( v77(VarCurr,B)
          <=> v79(VarCurr,B) ) ) ) )).

fof(addConditionBooleanCondEqualRangesThenBranch_1,axiom,(
    ! [VarCurr] :
      ( v78(VarCurr)
     => ! [B] :
          ( range_31_0(B)
         => ( v77(VarCurr,B)
          <=> $false ) ) ) )).

fof(range_axiom_2,axiom,(
    ! [B] :
      ( range_31_0(B)
    <=> ( $false
        | bitIndex0 = B
        | bitIndex1 = B
        | bitIndex2 = B
        | bitIndex3 = B
        | bitIndex4 = B
        | bitIndex5 = B
        | bitIndex6 = B
        | bitIndex7 = B
        | bitIndex8 = B
        | bitIndex9 = B
        | bitIndex10 = B
        | bitIndex11 = B
        | bitIndex12 = B
        | bitIndex13 = B
        | bitIndex14 = B
        | bitIndex15 = B
        | bitIndex16 = B
        | bitIndex17 = B
        | bitIndex18 = B
        | bitIndex19 = B
        | bitIndex20 = B
        | bitIndex21 = B
        | bitIndex22 = B
        | bitIndex23 = B
        | bitIndex24 = B
        | bitIndex25 = B
        | bitIndex26 = B
        | bitIndex27 = B
        | bitIndex28 = B
        | bitIndex29 = B
        | bitIndex30 = B
        | bitIndex31 = B ) ) )).

fof(bitBlastConstant_40,axiom,(
    ~ b00000000000000000000000000000000(bitIndex31) )).

fof(bitBlastConstant_39,axiom,(
    ~ b00000000000000000000000000000000(bitIndex30) )).

fof(bitBlastConstant_38,axiom,(
    ~ b00000000000000000000000000000000(bitIndex29) )).

fof(bitBlastConstant_37,axiom,(
    ~ b00000000000000000000000000000000(bitIndex28) )).

fof(bitBlastConstant_36,axiom,(
    ~ b00000000000000000000000000000000(bitIndex27) )).

fof(bitBlastConstant_35,axiom,(
    ~ b00000000000000000000000000000000(bitIndex26) )).

fof(bitBlastConstant_34,axiom,(
    ~ b00000000000000000000000000000000(bitIndex25) )).

fof(bitBlastConstant_33,axiom,(
    ~ b00000000000000000000000000000000(bitIndex24) )).

fof(bitBlastConstant_32,axiom,(
    ~ b00000000000000000000000000000000(bitIndex23) )).

fof(bitBlastConstant_31,axiom,(
    ~ b00000000000000000000000000000000(bitIndex22) )).

fof(bitBlastConstant_30,axiom,(
    ~ b00000000000000000000000000000000(bitIndex21) )).

fof(bitBlastConstant_29,axiom,(
    ~ b00000000000000000000000000000000(bitIndex20) )).

fof(bitBlastConstant_28,axiom,(
    ~ b00000000000000000000000000000000(bitIndex19) )).

fof(bitBlastConstant_27,axiom,(
    ~ b00000000000000000000000000000000(bitIndex18) )).

fof(bitBlastConstant_26,axiom,(
    ~ b00000000000000000000000000000000(bitIndex17) )).

fof(bitBlastConstant_25,axiom,(
    ~ b00000000000000000000000000000000(bitIndex16) )).

fof(bitBlastConstant_24,axiom,(
    ~ b00000000000000000000000000000000(bitIndex15) )).

fof(bitBlastConstant_23,axiom,(
    ~ b00000000000000000000000000000000(bitIndex14) )).

fof(bitBlastConstant_22,axiom,(
    ~ b00000000000000000000000000000000(bitIndex13) )).

fof(bitBlastConstant_21,axiom,(
    ~ b00000000000000000000000000000000(bitIndex12) )).

fof(bitBlastConstant_20,axiom,(
    ~ b00000000000000000000000000000000(bitIndex11) )).

fof(bitBlastConstant_19,axiom,(
    ~ b00000000000000000000000000000000(bitIndex10) )).

fof(bitBlastConstant_18,axiom,(
    ~ b00000000000000000000000000000000(bitIndex9) )).

fof(bitBlastConstant_17,axiom,(
    ~ b00000000000000000000000000000000(bitIndex8) )).

fof(bitBlastConstant_16,axiom,(
    ~ b00000000000000000000000000000000(bitIndex7) )).

fof(bitBlastConstant_15,axiom,(
    ~ b00000000000000000000000000000000(bitIndex6) )).

fof(bitBlastConstant_14,axiom,(
    ~ b00000000000000000000000000000000(bitIndex5) )).

fof(bitBlastConstant_13,axiom,(
    ~ b00000000000000000000000000000000(bitIndex4) )).

fof(bitBlastConstant_12,axiom,(
    ~ b00000000000000000000000000000000(bitIndex3) )).

fof(bitBlastConstant_11,axiom,(
    ~ b00000000000000000000000000000000(bitIndex2) )).

fof(bitBlastConstant_10,axiom,(
    ~ b00000000000000000000000000000000(bitIndex1) )).

fof(bitBlastConstant_9,axiom,(
    ~ b00000000000000000000000000000000(bitIndex0) )).

fof(addSignExtensionConstraint_25,axiom,(
    ! [VarCurr] :
      ( v79(VarCurr,bitIndex6)
    <=> v80(VarCurr,bitIndex5) ) )).

fof(addSignExtensionConstraint_24,axiom,(
    ! [VarCurr] :
      ( v79(VarCurr,bitIndex7)
    <=> v80(VarCurr,bitIndex5) ) )).

fof(addSignExtensionConstraint_23,axiom,(
    ! [VarCurr] :
      ( v79(VarCurr,bitIndex8)
    <=> v80(VarCurr,bitIndex5) ) )).

fof(addSignExtensionConstraint_22,axiom,(
    ! [VarCurr] :
      ( v79(VarCurr,bitIndex9)
    <=> v80(VarCurr,bitIndex5) ) )).

fof(addSignExtensionConstraint_21,axiom,(
    ! [VarCurr] :
      ( v79(VarCurr,bitIndex10)
    <=> v80(VarCurr,bitIndex5) ) )).

fof(addSignExtensionConstraint_20,axiom,(
    ! [VarCurr] :
      ( v79(VarCurr,bitIndex11)
    <=> v80(VarCurr,bitIndex5) ) )).

fof(addSignExtensionConstraint_19,axiom,(
    ! [VarCurr] :
      ( v79(VarCurr,bitIndex12)
    <=> v80(VarCurr,bitIndex5) ) )).

fof(addSignExtensionConstraint_18,axiom,(
    ! [VarCurr] :
      ( v79(VarCurr,bitIndex13)
    <=> v80(VarCurr,bitIndex5) ) )).

fof(addSignExtensionConstraint_17,axiom,(
    ! [VarCurr] :
      ( v79(VarCurr,bitIndex14)
    <=> v80(VarCurr,bitIndex5) ) )).

fof(addSignExtensionConstraint_16,axiom,(
    ! [VarCurr] :
      ( v79(VarCurr,bitIndex15)
    <=> v80(VarCurr,bitIndex5) ) )).

fof(addSignExtensionConstraint_15,axiom,(
    ! [VarCurr] :
      ( v79(VarCurr,bitIndex16)
    <=> v80(VarCurr,bitIndex5) ) )).

fof(addSignExtensionConstraint_14,axiom,(
    ! [VarCurr] :
      ( v79(VarCurr,bitIndex17)
    <=> v80(VarCurr,bitIndex5) ) )).

fof(addSignExtensionConstraint_13,axiom,(
    ! [VarCurr] :
      ( v79(VarCurr,bitIndex18)
    <=> v80(VarCurr,bitIndex5) ) )).

fof(addSignExtensionConstraint_12,axiom,(
    ! [VarCurr] :
      ( v79(VarCurr,bitIndex19)
    <=> v80(VarCurr,bitIndex5) ) )).

fof(addSignExtensionConstraint_11,axiom,(
    ! [VarCurr] :
      ( v79(VarCurr,bitIndex20)
    <=> v80(VarCurr,bitIndex5) ) )).

fof(addSignExtensionConstraint_10,axiom,(
    ! [VarCurr] :
      ( v79(VarCurr,bitIndex21)
    <=> v80(VarCurr,bitIndex5) ) )).

fof(addSignExtensionConstraint_9,axiom,(
    ! [VarCurr] :
      ( v79(VarCurr,bitIndex22)
    <=> v80(VarCurr,bitIndex5) ) )).

fof(addSignExtensionConstraint_8,axiom,(
    ! [VarCurr] :
      ( v79(VarCurr,bitIndex23)
    <=> v80(VarCurr,bitIndex5) ) )).

fof(addSignExtensionConstraint_7,axiom,(
    ! [VarCurr] :
      ( v79(VarCurr,bitIndex24)
    <=> v80(VarCurr,bitIndex5) ) )).

fof(addSignExtensionConstraint_6,axiom,(
    ! [VarCurr] :
      ( v79(VarCurr,bitIndex25)
    <=> v80(VarCurr,bitIndex5) ) )).

fof(addSignExtensionConstraint_5,axiom,(
    ! [VarCurr] :
      ( v79(VarCurr,bitIndex26)
    <=> v80(VarCurr,bitIndex5) ) )).

fof(addSignExtensionConstraint_4,axiom,(
    ! [VarCurr] :
      ( v79(VarCurr,bitIndex27)
    <=> v80(VarCurr,bitIndex5) ) )).

fof(addSignExtensionConstraint_3,axiom,(
    ! [VarCurr] :
      ( v79(VarCurr,bitIndex28)
    <=> v80(VarCurr,bitIndex5) ) )).

fof(addSignExtensionConstraint_2,axiom,(
    ! [VarCurr] :
      ( v79(VarCurr,bitIndex29)
    <=> v80(VarCurr,bitIndex5) ) )).

fof(addSignExtensionConstraint_1,axiom,(
    ! [VarCurr] :
      ( v79(VarCurr,bitIndex30)
    <=> v80(VarCurr,bitIndex5) ) )).

fof(addSignExtensionConstraint,axiom,(
    ! [VarCurr] :
      ( v79(VarCurr,bitIndex31)
    <=> v80(VarCurr,bitIndex5) ) )).

fof(addAssignment_23,axiom,(
    ! [VarCurr,B] :
      ( range_5_0(B)
     => ( v79(VarCurr,B)
      <=> v80(VarCurr,B) ) ) )).

fof(range_axiom_1,axiom,(
    ! [B] :
      ( range_5_0(B)
    <=> ( $false
        | bitIndex0 = B
        | bitIndex1 = B
        | bitIndex2 = B
        | bitIndex3 = B
        | bitIndex4 = B
        | bitIndex5 = B ) ) )).

fof(addAssignment_22,axiom,(
    ! [VarCurr] :
      ( v80(VarCurr,bitIndex0)
    <=> v115(VarCurr) ) )).

fof(addAssignment_21,axiom,(
    ! [VarCurr] :
      ( v80(VarCurr,bitIndex1)
    <=> v113(VarCurr) ) )).

fof(addAssignment_20,axiom,(
    ! [VarCurr] :
      ( v80(VarCurr,bitIndex2)
    <=> v109(VarCurr) ) )).

fof(addAssignment_19,axiom,(
    ! [VarCurr] :
      ( v80(VarCurr,bitIndex3)
    <=> v105(VarCurr) ) )).

fof(addAssignment_18,axiom,(
    ! [VarCurr] :
      ( v80(VarCurr,bitIndex4)
    <=> v101(VarCurr) ) )).

fof(addAssignment_17,axiom,(
    ! [VarCurr] :
      ( v80(VarCurr,bitIndex5)
    <=> v82(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_14,axiom,(
    ! [VarCurr] :
      ( v113(VarCurr)
    <=> ( v114(VarCurr)
        & v116(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_13,axiom,(
    ! [VarCurr] :
      ( v116(VarCurr)
    <=> ( v86(VarCurr,bitIndex0)
        | v95(VarCurr) ) ) )).

fof(writeBinaryOperatorShiftedRanges_8,axiom,(
    ! [VarCurr] :
      ( v114(VarCurr)
    <=> ( v115(VarCurr)
        | v86(VarCurr,bitIndex1) ) ) )).

fof(writeUnaryOperator_10,axiom,(
    ! [VarCurr] :
      ( ~ v115(VarCurr)
    <=> v86(VarCurr,bitIndex0) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_12,axiom,(
    ! [VarCurr] :
      ( v109(VarCurr)
    <=> ( v110(VarCurr)
        & v112(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_11,axiom,(
    ! [VarCurr] :
      ( v112(VarCurr)
    <=> ( v93(VarCurr)
        | v96(VarCurr) ) ) )).

fof(writeBinaryOperatorShiftedRanges_7,axiom,(
    ! [VarCurr] :
      ( v110(VarCurr)
    <=> ( v111(VarCurr)
        | v86(VarCurr,bitIndex2) ) ) )).

fof(writeUnaryOperator_9,axiom,(
    ! [VarCurr] :
      ( ~ v111(VarCurr)
    <=> v93(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_10,axiom,(
    ! [VarCurr] :
      ( v105(VarCurr)
    <=> ( v106(VarCurr)
        & v108(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_9,axiom,(
    ! [VarCurr] :
      ( v108(VarCurr)
    <=> ( v91(VarCurr)
        | v97(VarCurr) ) ) )).

fof(writeBinaryOperatorShiftedRanges_6,axiom,(
    ! [VarCurr] :
      ( v106(VarCurr)
    <=> ( v107(VarCurr)
        | v86(VarCurr,bitIndex3) ) ) )).

fof(writeUnaryOperator_8,axiom,(
    ! [VarCurr] :
      ( ~ v107(VarCurr)
    <=> v91(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_8,axiom,(
    ! [VarCurr] :
      ( v101(VarCurr)
    <=> ( v102(VarCurr)
        & v104(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_7,axiom,(
    ! [VarCurr] :
      ( v104(VarCurr)
    <=> ( v89(VarCurr)
        | v98(VarCurr) ) ) )).

fof(writeBinaryOperatorShiftedRanges_5,axiom,(
    ! [VarCurr] :
      ( v102(VarCurr)
    <=> ( v103(VarCurr)
        | v86(VarCurr,bitIndex4) ) ) )).

fof(writeUnaryOperator_7,axiom,(
    ! [VarCurr] :
      ( ~ v103(VarCurr)
    <=> v89(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_6,axiom,(
    ! [VarCurr] :
      ( v82(VarCurr)
    <=> ( v83(VarCurr)
        & v99(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_5,axiom,(
    ! [VarCurr] :
      ( v99(VarCurr)
    <=> ( v85(VarCurr)
        | v100(VarCurr) ) ) )).

fof(writeUnaryOperator_6,axiom,(
    ! [VarCurr] :
      ( ~ v100(VarCurr)
    <=> v86(VarCurr,bitIndex5) ) )).

fof(writeBinaryOperatorShiftedRanges_4,axiom,(
    ! [VarCurr] :
      ( v83(VarCurr)
    <=> ( v84(VarCurr)
        | v86(VarCurr,bitIndex5) ) ) )).

fof(writeUnaryOperator_5,axiom,(
    ! [VarCurr] :
      ( ~ v84(VarCurr)
    <=> v85(VarCurr) ) )).

fof(writeBinaryOperatorShiftedRanges_3,axiom,(
    ! [VarCurr] :
      ( v85(VarCurr)
    <=> ( v86(VarCurr,bitIndex4)
        | v88(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_4,axiom,(
    ! [VarCurr] :
      ( v88(VarCurr)
    <=> ( v89(VarCurr)
        & v98(VarCurr) ) ) )).

fof(writeUnaryOperator_4,axiom,(
    ! [VarCurr] :
      ( ~ v98(VarCurr)
    <=> v86(VarCurr,bitIndex4) ) )).

fof(writeBinaryOperatorShiftedRanges_2,axiom,(
    ! [VarCurr] :
      ( v89(VarCurr)
    <=> ( v86(VarCurr,bitIndex3)
        | v90(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_3,axiom,(
    ! [VarCurr] :
      ( v90(VarCurr)
    <=> ( v91(VarCurr)
        & v97(VarCurr) ) ) )).

fof(writeUnaryOperator_3,axiom,(
    ! [VarCurr] :
      ( ~ v97(VarCurr)
    <=> v86(VarCurr,bitIndex3) ) )).

fof(writeBinaryOperatorShiftedRanges_1,axiom,(
    ! [VarCurr] :
      ( v91(VarCurr)
    <=> ( v86(VarCurr,bitIndex2)
        | v92(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_2,axiom,(
    ! [VarCurr] :
      ( v92(VarCurr)
    <=> ( v93(VarCurr)
        & v96(VarCurr) ) ) )).

fof(writeUnaryOperator_2,axiom,(
    ! [VarCurr] :
      ( ~ v96(VarCurr)
    <=> v86(VarCurr,bitIndex2) ) )).

fof(writeBinaryOperatorShiftedRanges,axiom,(
    ! [VarCurr] :
      ( v93(VarCurr)
    <=> ( v86(VarCurr,bitIndex1)
        | v94(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_1,axiom,(
    ! [VarCurr] :
      ( v94(VarCurr)
    <=> ( v86(VarCurr,bitIndex0)
        & v95(VarCurr) ) ) )).

fof(writeUnaryOperator_1,axiom,(
    ! [VarCurr] :
      ( ~ v95(VarCurr)
    <=> v86(VarCurr,bitIndex1) ) )).

fof(addZeroExtensionConstraint,axiom,(
    ! [VarCurr] : ~ v86(VarCurr,bitIndex5) )).

fof(addAssignment_16,axiom,(
    ! [VarCurr,B] :
      ( range_4_0(B)
     => ( v86(VarCurr,B)
      <=> v37(VarCurr,B) ) ) )).

fof(addBitVectorEqualityBitBlasted_2,axiom,(
    ! [VarCurr] :
      ( v78(VarCurr)
    <=> ( ( v37(VarCurr,bitIndex4)
        <=> $false )
        & ( v37(VarCurr,bitIndex3)
        <=> $false )
        & ( v37(VarCurr,bitIndex2)
        <=> $false )
        & ( v37(VarCurr,bitIndex1)
        <=> $false )
        & ( v37(VarCurr,bitIndex0)
        <=> $false ) ) ) )).

fof(addBitVectorEqualityBitBlasted_1,axiom,(
    ! [VarCurr] :
      ( v75(VarCurr)
    <=> ( ( v76(VarCurr,bitIndex1)
        <=> $false )
        & ( v76(VarCurr,bitIndex0)
        <=> $true ) ) ) )).

fof(bitBlastConstant_8,axiom,(
    ~ b01(bitIndex1) )).

fof(bitBlastConstant_7,axiom,(
    b01(bitIndex0) )).

fof(addAssignment_15,axiom,(
    ! [VarCurr] :
      ( v76(VarCurr,bitIndex0)
    <=> v25(VarCurr) ) )).

fof(addAssignment_14,axiom,(
    ! [VarCurr] :
      ( v76(VarCurr,bitIndex1)
    <=> v42(VarCurr) ) )).

fof(addAssignmentInitValueVector,axiom,(
    ! [B] :
      ( range_4_0(B)
     => ( v37(constB0,B)
      <=> $false ) ) )).

fof(range_axiom,axiom,(
    ! [B] :
      ( range_4_0(B)
    <=> ( $false
        | bitIndex0 = B
        | bitIndex1 = B
        | bitIndex2 = B
        | bitIndex3 = B
        | bitIndex4 = B ) ) )).

fof(bitBlastConstant_6,axiom,(
    ~ b00000(bitIndex4) )).

fof(bitBlastConstant_5,axiom,(
    ~ b00000(bitIndex3) )).

fof(bitBlastConstant_4,axiom,(
    ~ b00000(bitIndex2) )).

fof(bitBlastConstant_3,axiom,(
    ~ b00000(bitIndex1) )).

fof(bitBlastConstant_2,axiom,(
    ~ b00000(bitIndex0) )).

fof(addBitVectorEqualityBitBlasted,axiom,(
    ! [VarCurr] :
      ( v73(VarCurr)
    <=> ( ( v74(VarCurr,bitIndex1)
        <=> $false )
        & ( v74(VarCurr,bitIndex0)
        <=> $false ) ) ) )).

fof(bitBlastConstant_1,axiom,(
    ~ b00(bitIndex1) )).

fof(bitBlastConstant,axiom,(
    ~ b00(bitIndex0) )).

fof(addAssignment_13,axiom,(
    ! [VarCurr] :
      ( v74(VarCurr,bitIndex0)
    <=> v25(VarCurr) ) )).

fof(addAssignment_12,axiom,(
    ! [VarCurr] :
      ( v74(VarCurr,bitIndex1)
    <=> v42(VarCurr) ) )).

fof(addAssignment_11,axiom,(
    ! [VarCurr] :
      ( v42(VarCurr)
    <=> v44(VarCurr) ) )).

fof(aaddConditionBooleanCondEqualRangesElseBranch,axiom,(
    ! [VarCurr] :
      ( ~ v62(VarCurr)
     => ( v44(VarCurr)
      <=> $false ) ) )).

fof(addConditionBooleanCondEqualRangesThenBranch,axiom,(
    ! [VarCurr] :
      ( v62(VarCurr)
     => ( v44(VarCurr)
      <=> $true ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits,axiom,(
    ! [VarCurr] :
      ( v62(VarCurr)
    <=> ( v63(VarCurr)
        & v54(VarCurr) ) ) )).

fof(writeUnaryOperator,axiom,(
    ! [VarCurr] :
      ( ~ v63(VarCurr)
    <=> v46(VarCurr,bitIndex8) ) )).

fof(addAssignment_10,axiom,(
    ! [VarCurr] :
      ( v54(VarCurr)
    <=> v56(VarCurr) ) )).

fof(addAssignment_9,axiom,(
    ! [VarCurr] :
      ( v56(VarCurr)
    <=> v58(VarCurr) ) )).

fof(addAssignment_8,axiom,(
    ! [VarCurr] :
      ( v58(VarCurr)
    <=> v60(VarCurr) ) )).

fof(addAssignment_7,axiom,(
    ! [VarCurr] :
      ( v46(VarCurr,bitIndex8)
    <=> v48(VarCurr,bitIndex8) ) )).

fof(addAssignment_6,axiom,(
    ! [VarCurr] :
      ( v48(VarCurr,bitIndex8)
    <=> v50(VarCurr,bitIndex8) ) )).

fof(addAssignment_5,axiom,(
    ! [VarCurr] :
      ( v50(VarCurr,bitIndex8)
    <=> v52(VarCurr,bitIndex8) ) )).

fof(addAssignment_4,axiom,(
    ! [VarCurr] :
      ( v10(VarCurr)
    <=> v12(VarCurr) ) )).

fof(addAssignment_3,axiom,(
    ! [VarCurr] :
      ( v12(VarCurr)
    <=> v14(VarCurr) ) )).

fof(addAssignment_2,axiom,(
    ! [VarCurr] :
      ( v14(VarCurr)
    <=> v16(VarCurr) ) )).

fof(addAssignment_1,axiom,(
    ! [VarCurr] :
      ( v16(VarCurr)
    <=> v18(VarCurr) ) )).

fof(addAssignment,axiom,(
    ! [VarCurr] :
      ( v18(VarCurr)
    <=> v20(VarCurr) ) )).

%------------------------------------------------------------------------------
