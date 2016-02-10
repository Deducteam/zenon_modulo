%------------------------------------------------------------------------------
% File     : HWV095+1 : TPTP v6.1.0. Released v6.1.0.
% Domain   : Hardware Verification
% Problem  : dmu_dmc property 7 cone of influence 5_b20
% Version  : Especial.
% English  : Verification of a property of the SPARCT2 RTL hardware design.

% Refs     : [Kha14] Khasidashvili (2014), Email to Geoff Sutcliffe
% Source   : [Kha14]
% Names    : dmu_dmc_prop7_cone5_b20 [Kha14]

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
          & v777(VarNext) ) ) ) )).

fof(writeUnaryOperator_108,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( ~ v983(VarNext)
      <=> v788(VarNext) ) ) )).

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
      <=> $true ) ) )).

fof(aaddConditionBooleanCondEqualRangesElseBranch_38,axiom,(
    ! [VarCurr] :
      ( ~ v810(VarCurr)
     => ( v955(VarCurr)
      <=> $false ) ) )).

fof(addConditionBooleanCondEqualRangesThenBranch_39,axiom,(
    ! [VarCurr] :
      ( v810(VarCurr)
     => ( v955(VarCurr)
      <=> $false ) ) )).

fof(aaddConditionBooleanCondEqualRangesElseBranch_37,axiom,(
    ! [VarCurr] :
      ( ~ v802(VarCurr)
     => ( v952(VarCurr)
      <=> v953(VarCurr) ) ) )).

fof(addConditionBooleanCondEqualRangesThenBranch_38,axiom,(
    ! [VarCurr] :
      ( v802(VarCurr)
     => ( v952(VarCurr)
      <=> $false ) ) )).

fof(aaddConditionBooleanCondEqualRangesElseBranch_36,axiom,(
    ! [VarCurr] :
      ( ~ v832(VarCurr)
     => ( v953(VarCurr)
      <=> $false ) ) )).

fof(addConditionBooleanCondEqualRangesThenBranch_37,axiom,(
    ! [VarCurr] :
      ( v832(VarCurr)
     => ( v953(VarCurr)
      <=> $true ) ) )).

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
          & v779(VarNext) ) ) ) )).

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
      ( v33(VarCurr)
    <=> v35(VarCurr) ) )).

fof(addBitVectorEqualityBitBlasted_46,axiom,(
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

fof(addCaseBooleanConditionEqualRanges1_6,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( ~ v914(VarNext)
       => ! [B] :
            ( range_4_0(B)
           => ( v37(VarNext,B)
            <=> v37(VarCurr,B) ) ) ) ) )).

fof(addCaseBooleanConditionEqualRanges0_7,axiom,(
    ! [VarNext] :
      ( v914(VarNext)
     => ! [B] :
          ( range_4_0(B)
         => ( v37(VarNext,B)
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
          <=> v42(VarCurr,B) ) ) ) )).

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
    <=> v39(VarCurr) ) )).

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
    <=> v779(VarCurr) ) )).

fof(addParallelCaseBooleanConditionEqualRanges3_4,axiom,(
    ! [VarCurr] :
      ( ( ~ v836(VarCurr)
        & ~ v838(VarCurr)
        & ~ v879(VarCurr) )
     => ! [B] :
          ( range_4_0(B)
         => ( v42(VarCurr,B)
          <=> v37(VarCurr,B) ) ) ) )).

fof(addParallelCaseBooleanConditionEqualRanges2_7,axiom,(
    ! [VarCurr] :
      ( v879(VarCurr)
     => ! [B] :
          ( range_4_0(B)
         => ( v42(VarCurr,B)
          <=> v881(VarCurr,B) ) ) ) )).

fof(addParallelCaseBooleanConditionEqualRanges1_15,axiom,(
    ! [VarCurr] :
      ( v838(VarCurr)
     => ! [B] :
          ( range_4_0(B)
         => ( v42(VarCurr,B)
          <=> v840(VarCurr,B) ) ) ) )).

fof(addParallelCaseBooleanConditionEqualRanges0_14,axiom,(
    ! [VarCurr] :
      ( v836(VarCurr)
     => ! [B] :
          ( range_4_0(B)
         => ( v42(VarCurr,B)
          <=> v37(VarCurr,B) ) ) ) )).

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
    <=> v67(VarCurr) ) )).

fof(addAssignment_230,axiom,(
    ! [VarCurr] :
      ( v909(VarCurr,bitIndex1)
    <=> v44(VarCurr) ) )).

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
    <=> ( v37(VarCurr,bitIndex0)
        | v37(VarCurr,bitIndex1) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_151,axiom,(
    ! [VarCurr] :
      ( v904(VarCurr)
    <=> ( v905(VarCurr)
        | v906(VarCurr) ) ) )).

fof(writeUnaryOperator_97,axiom,(
    ! [VarCurr] :
      ( ~ v906(VarCurr)
    <=> v37(VarCurr,bitIndex1) ) )).

fof(writeUnaryOperator_96,axiom,(
    ! [VarCurr] :
      ( ~ v905(VarCurr)
    <=> v37(VarCurr,bitIndex0) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_150,axiom,(
    ! [VarCurr] :
      ( v898(VarCurr)
    <=> ( v899(VarCurr)
        & v902(VarCurr) ) ) )).

fof(writeBinaryOperatorShiftedRanges_67,axiom,(
    ! [VarCurr] :
      ( v902(VarCurr)
    <=> ( v890(VarCurr)
        | v37(VarCurr,bitIndex2) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_149,axiom,(
    ! [VarCurr] :
      ( v899(VarCurr)
    <=> ( v900(VarCurr)
        | v901(VarCurr) ) ) )).

fof(writeUnaryOperator_95,axiom,(
    ! [VarCurr] :
      ( ~ v901(VarCurr)
    <=> v37(VarCurr,bitIndex2) ) )).

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
        | v37(VarCurr,bitIndex3) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_147,axiom,(
    ! [VarCurr] :
      ( v894(VarCurr)
    <=> ( v895(VarCurr)
        | v896(VarCurr) ) ) )).

fof(writeUnaryOperator_93,axiom,(
    ! [VarCurr] :
      ( ~ v896(VarCurr)
    <=> v37(VarCurr,bitIndex3) ) )).

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
        | v37(VarCurr,bitIndex4) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_145,axiom,(
    ! [VarCurr] :
      ( v886(VarCurr)
    <=> ( v887(VarCurr)
        | v891(VarCurr) ) ) )).

fof(writeUnaryOperator_91,axiom,(
    ! [VarCurr] :
      ( ~ v891(VarCurr)
    <=> v37(VarCurr,bitIndex4) ) )).

fof(writeUnaryOperator_90,axiom,(
    ! [VarCurr] :
      ( ~ v887(VarCurr)
    <=> v888(VarCurr) ) )).

fof(writeBinaryOperatorShiftedRanges_64,axiom,(
    ! [VarCurr] :
      ( v888(VarCurr)
    <=> ( v889(VarCurr)
        & v37(VarCurr,bitIndex3) ) ) )).

fof(writeBinaryOperatorShiftedRanges_63,axiom,(
    ! [VarCurr] :
      ( v889(VarCurr)
    <=> ( v890(VarCurr)
        & v37(VarCurr,bitIndex2) ) ) )).

fof(writeBinaryOperatorShiftedRanges_62,axiom,(
    ! [VarCurr] :
      ( v890(VarCurr)
    <=> ( v37(VarCurr,bitIndex0)
        & v37(VarCurr,bitIndex1) ) ) )).

fof(addBitVectorEqualityBitBlasted_44,axiom,(
    ! [VarCurr] :
      ( v882(VarCurr)
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
    <=> v67(VarCurr) ) )).

fof(addAssignment_223,axiom,(
    ! [VarCurr] :
      ( v880(VarCurr,bitIndex1)
    <=> v44(VarCurr) ) )).

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
      <=> v37(VarCurr,B) ) ) )).

fof(addBitVectorEqualityBitBlasted_42,axiom,(
    ! [VarCurr] :
      ( v841(VarCurr)
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
    <=> v67(VarCurr) ) )).

fof(addAssignment_213,axiom,(
    ! [VarCurr] :
      ( v839(VarCurr,bitIndex1)
    <=> v44(VarCurr) ) )).

fof(addAssignmentInitValueVector_3,axiom,(
    ! [B] :
      ( range_4_0(B)
     => ( v37(constB0,B)
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
    <=> v67(VarCurr) ) )).

fof(addAssignment_211,axiom,(
    ! [VarCurr] :
      ( v837(VarCurr,bitIndex1)
    <=> v44(VarCurr) ) )).

fof(addAssignment_210,axiom,(
    ! [VarCurr] :
      ( v67(VarCurr)
    <=> v69(VarCurr) ) )).

fof(aaddConditionBooleanCondEqualRangesElseBranch_29,axiom,(
    ! [VarCurr] :
      ( ~ v828(VarCurr)
     => ( v69(VarCurr)
      <=> $false ) ) )).

fof(addConditionBooleanCondEqualRangesThenBranch_30,axiom,(
    ! [VarCurr] :
      ( v828(VarCurr)
     => ( v69(VarCurr)
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
      <=> $false ) ) )).

fof(aaddConditionBooleanCondEqualRangesElseBranch_27,axiom,(
    ! [VarCurr] :
      ( ~ v810(VarCurr)
     => ( v834(VarCurr)
      <=> $false ) ) )).

fof(addConditionBooleanCondEqualRangesThenBranch_28,axiom,(
    ! [VarCurr] :
      ( v810(VarCurr)
     => ( v834(VarCurr)
      <=> $true ) ) )).

fof(aaddConditionBooleanCondEqualRangesElseBranch_26,axiom,(
    ! [VarCurr] :
      ( ~ v802(VarCurr)
     => ( v830(VarCurr)
      <=> v831(VarCurr) ) ) )).

fof(addConditionBooleanCondEqualRangesThenBranch_27,axiom,(
    ! [VarCurr] :
      ( v802(VarCurr)
     => ( v830(VarCurr)
      <=> $true ) ) )).

fof(aaddConditionBooleanCondEqualRangesElseBranch_25,axiom,(
    ! [VarCurr] :
      ( ~ v832(VarCurr)
     => ( v831(VarCurr)
      <=> $false ) ) )).

fof(addConditionBooleanCondEqualRangesThenBranch_26,axiom,(
    ! [VarCurr] :
      ( v832(VarCurr)
     => ( v831(VarCurr)
      <=> $false ) ) )).

fof(writeUnaryOperator_79,axiom,(
    ! [VarCurr] :
      ( ~ v832(VarCurr)
    <=> v71(VarCurr) ) )).

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
          & v779(VarNext) ) ) ) )).

fof(writeUnaryOperator_77,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( ~ v815(VarNext)
      <=> v817(VarNext) ) ) )).

fof(addAssignment_208,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( v817(VarNext)
      <=> v779(VarCurr) ) ) )).

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
    <=> v71(VarCurr) ) )).

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
      ( v71(VarCurr)
    <=> v73(VarCurr) ) )).

fof(addBitVectorEqualityBitBlasted_37,axiom,(
    ! [VarCurr] :
      ( v73(VarCurr)
    <=> ( ( v75(VarCurr,bitIndex4)
        <=> $false )
        & ( v75(VarCurr,bitIndex3)
        <=> $false )
        & ( v75(VarCurr,bitIndex2)
        <=> $false )
        & ( v75(VarCurr,bitIndex1)
        <=> $false )
        & ( v75(VarCurr,bitIndex0)
        <=> $false ) ) ) )).

fof(addCaseBooleanConditionEqualRanges1_4,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( ~ v784(VarNext)
       => ! [B] :
            ( range_4_0(B)
           => ( v75(VarNext,B)
            <=> v75(VarCurr,B) ) ) ) ) )).

fof(addCaseBooleanConditionEqualRanges0_6,axiom,(
    ! [VarNext] :
      ( v784(VarNext)
     => ! [B] :
          ( range_4_0(B)
         => ( v75(VarNext,B)
          <=> v794(VarNext,B) ) ) ) )).

fof(addAssignment_206,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ! [B] :
          ( range_4_0(B)
         => ( v794(VarNext,B)
          <=> v792(VarCurr,B) ) ) ) )).

fof(aaddConditionBooleanCondEqualRangesElseBranch_23,axiom,(
    ! [VarCurr] :
      ( ~ v795(VarCurr)
     => ! [B] :
          ( range_4_0(B)
         => ( v792(VarCurr,B)
          <=> v77(VarCurr,B) ) ) ) )).

fof(addConditionBooleanCondEqualRangesThenBranch_23,axiom,(
    ! [VarCurr] :
      ( v795(VarCurr)
     => ! [B] :
          ( range_4_0(B)
         => ( v792(VarCurr,B)
          <=> $false ) ) ) )).

fof(writeUnaryOperator_72,axiom,(
    ! [VarCurr] :
      ( ~ v795(VarCurr)
    <=> v10(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_124,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( v784(VarNext)
      <=> v785(VarNext) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_123,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( v785(VarNext)
      <=> ( v786(VarNext)
          & v777(VarNext) ) ) ) )).

fof(writeUnaryOperator_71,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( ~ v786(VarNext)
      <=> v788(VarNext) ) ) )).

fof(addAssignment_205,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( v788(VarNext)
      <=> v777(VarCurr) ) ) )).

fof(addAssignment_204,axiom,(
    ! [VarCurr] :
      ( v777(VarCurr)
    <=> v779(VarCurr) ) )).

fof(addAssignment_203,axiom,(
    ! [VarCurr] :
      ( v779(VarCurr)
    <=> v781(VarCurr) ) )).

fof(addAssignment_202,axiom,(
    ! [VarCurr] :
      ( v781(VarCurr)
    <=> v340(VarCurr) ) )).

fof(addParallelCaseBooleanConditionEqualRanges3_3,axiom,(
    ! [VarCurr] :
      ( ( ~ v701(VarCurr)
        & ~ v703(VarCurr)
        & ~ v745(VarCurr) )
     => ! [B] :
          ( range_4_0(B)
         => ( v77(VarCurr,B)
          <=> v75(VarCurr,B) ) ) ) )).

fof(addParallelCaseBooleanConditionEqualRanges2_6,axiom,(
    ! [VarCurr] :
      ( v745(VarCurr)
     => ! [B] :
          ( range_4_0(B)
         => ( v77(VarCurr,B)
          <=> v747(VarCurr,B) ) ) ) )).

fof(addParallelCaseBooleanConditionEqualRanges1_12,axiom,(
    ! [VarCurr] :
      ( v703(VarCurr)
     => ! [B] :
          ( range_4_0(B)
         => ( v77(VarCurr,B)
          <=> v705(VarCurr,B) ) ) ) )).

fof(addParallelCaseBooleanConditionEqualRanges0_11,axiom,(
    ! [VarCurr] :
      ( v701(VarCurr)
     => ! [B] :
          ( range_4_0(B)
         => ( v77(VarCurr,B)
          <=> v75(VarCurr,B) ) ) ) )).

fof(addBitVectorEqualityBitBlasted_36,axiom,(
    ! [VarCurr] :
      ( v774(VarCurr)
    <=> ( ( v775(VarCurr,bitIndex1)
        <=> $true )
        & ( v775(VarCurr,bitIndex0)
        <=> $true ) ) ) )).

fof(addAssignment_201,axiom,(
    ! [VarCurr] :
      ( v775(VarCurr,bitIndex0)
    <=> v25(VarCurr) ) )).

fof(addAssignment_200,axiom,(
    ! [VarCurr] :
      ( v775(VarCurr,bitIndex1)
    <=> v79(VarCurr) ) )).

fof(aaddConditionBooleanCondEqualRangesElseBranch_22,axiom,(
    ! [VarCurr] :
      ( ~ v748(VarCurr)
     => ! [B] :
          ( range_4_0(B)
         => ( v747(VarCurr,B)
          <=> v749(VarCurr,B) ) ) ) )).

fof(addConditionBooleanCondEqualRangesThenBranch_22,axiom,(
    ! [VarCurr] :
      ( v748(VarCurr)
     => ! [B] :
          ( range_4_0(B)
         => ( v747(VarCurr,B)
          <=> b01111(B) ) ) ) )).

fof(addAssignment_199,axiom,(
    ! [VarCurr] :
      ( v749(VarCurr,bitIndex0)
    <=> v771(VarCurr) ) )).

fof(addAssignment_198,axiom,(
    ! [VarCurr] :
      ( v749(VarCurr,bitIndex1)
    <=> v769(VarCurr) ) )).

fof(addAssignment_197,axiom,(
    ! [VarCurr] :
      ( v749(VarCurr,bitIndex2)
    <=> v764(VarCurr) ) )).

fof(addAssignment_196,axiom,(
    ! [VarCurr] :
      ( v749(VarCurr,bitIndex3)
    <=> v759(VarCurr) ) )).

fof(addAssignment_195,axiom,(
    ! [VarCurr] :
      ( v749(VarCurr,bitIndex4)
    <=> v751(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_122,axiom,(
    ! [VarCurr] :
      ( v769(VarCurr)
    <=> ( v770(VarCurr)
        & v773(VarCurr) ) ) )).

fof(writeBinaryOperatorShiftedRanges_52,axiom,(
    ! [VarCurr] :
      ( v773(VarCurr)
    <=> ( v75(VarCurr,bitIndex0)
        | v75(VarCurr,bitIndex1) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_121,axiom,(
    ! [VarCurr] :
      ( v770(VarCurr)
    <=> ( v771(VarCurr)
        | v772(VarCurr) ) ) )).

fof(writeUnaryOperator_70,axiom,(
    ! [VarCurr] :
      ( ~ v772(VarCurr)
    <=> v75(VarCurr,bitIndex1) ) )).

fof(writeUnaryOperator_69,axiom,(
    ! [VarCurr] :
      ( ~ v771(VarCurr)
    <=> v75(VarCurr,bitIndex0) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_120,axiom,(
    ! [VarCurr] :
      ( v764(VarCurr)
    <=> ( v765(VarCurr)
        & v768(VarCurr) ) ) )).

fof(writeBinaryOperatorShiftedRanges_51,axiom,(
    ! [VarCurr] :
      ( v768(VarCurr)
    <=> ( v756(VarCurr)
        | v75(VarCurr,bitIndex2) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_119,axiom,(
    ! [VarCurr] :
      ( v765(VarCurr)
    <=> ( v766(VarCurr)
        | v767(VarCurr) ) ) )).

fof(writeUnaryOperator_68,axiom,(
    ! [VarCurr] :
      ( ~ v767(VarCurr)
    <=> v75(VarCurr,bitIndex2) ) )).

fof(writeUnaryOperator_67,axiom,(
    ! [VarCurr] :
      ( ~ v766(VarCurr)
    <=> v756(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_118,axiom,(
    ! [VarCurr] :
      ( v759(VarCurr)
    <=> ( v760(VarCurr)
        & v763(VarCurr) ) ) )).

fof(writeBinaryOperatorShiftedRanges_50,axiom,(
    ! [VarCurr] :
      ( v763(VarCurr)
    <=> ( v755(VarCurr)
        | v75(VarCurr,bitIndex3) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_117,axiom,(
    ! [VarCurr] :
      ( v760(VarCurr)
    <=> ( v761(VarCurr)
        | v762(VarCurr) ) ) )).

fof(writeUnaryOperator_66,axiom,(
    ! [VarCurr] :
      ( ~ v762(VarCurr)
    <=> v75(VarCurr,bitIndex3) ) )).

fof(writeUnaryOperator_65,axiom,(
    ! [VarCurr] :
      ( ~ v761(VarCurr)
    <=> v755(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_116,axiom,(
    ! [VarCurr] :
      ( v751(VarCurr)
    <=> ( v752(VarCurr)
        & v758(VarCurr) ) ) )).

fof(writeBinaryOperatorShiftedRanges_49,axiom,(
    ! [VarCurr] :
      ( v758(VarCurr)
    <=> ( v754(VarCurr)
        | v75(VarCurr,bitIndex4) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_115,axiom,(
    ! [VarCurr] :
      ( v752(VarCurr)
    <=> ( v753(VarCurr)
        | v757(VarCurr) ) ) )).

fof(writeUnaryOperator_64,axiom,(
    ! [VarCurr] :
      ( ~ v757(VarCurr)
    <=> v75(VarCurr,bitIndex4) ) )).

fof(writeUnaryOperator_63,axiom,(
    ! [VarCurr] :
      ( ~ v753(VarCurr)
    <=> v754(VarCurr) ) )).

fof(writeBinaryOperatorShiftedRanges_48,axiom,(
    ! [VarCurr] :
      ( v754(VarCurr)
    <=> ( v755(VarCurr)
        & v75(VarCurr,bitIndex3) ) ) )).

fof(writeBinaryOperatorShiftedRanges_47,axiom,(
    ! [VarCurr] :
      ( v755(VarCurr)
    <=> ( v756(VarCurr)
        & v75(VarCurr,bitIndex2) ) ) )).

fof(writeBinaryOperatorShiftedRanges_46,axiom,(
    ! [VarCurr] :
      ( v756(VarCurr)
    <=> ( v75(VarCurr,bitIndex0)
        & v75(VarCurr,bitIndex1) ) ) )).

fof(addBitVectorEqualityBitBlasted_35,axiom,(
    ! [VarCurr] :
      ( v748(VarCurr)
    <=> ( ( v75(VarCurr,bitIndex4)
        <=> $false )
        & ( v75(VarCurr,bitIndex3)
        <=> $true )
        & ( v75(VarCurr,bitIndex2)
        <=> $true )
        & ( v75(VarCurr,bitIndex1)
        <=> $true )
        & ( v75(VarCurr,bitIndex0)
        <=> $true ) ) ) )).

fof(bitBlastConstant_192,axiom,(
    ~ b01111(bitIndex4) )).

fof(bitBlastConstant_191,axiom,(
    b01111(bitIndex3) )).

fof(bitBlastConstant_190,axiom,(
    b01111(bitIndex2) )).

fof(bitBlastConstant_189,axiom,(
    b01111(bitIndex1) )).

fof(bitBlastConstant_188,axiom,(
    b01111(bitIndex0) )).

fof(addBitVectorEqualityBitBlasted_34,axiom,(
    ! [VarCurr] :
      ( v745(VarCurr)
    <=> ( ( v746(VarCurr,bitIndex1)
        <=> $true )
        & ( v746(VarCurr,bitIndex0)
        <=> $false ) ) ) )).

fof(addAssignment_194,axiom,(
    ! [VarCurr] :
      ( v746(VarCurr,bitIndex0)
    <=> v25(VarCurr) ) )).

fof(addAssignment_193,axiom,(
    ! [VarCurr] :
      ( v746(VarCurr,bitIndex1)
    <=> v79(VarCurr) ) )).

fof(aaddConditionBooleanCondEqualRangesElseBranch_21,axiom,(
    ! [VarCurr] :
      ( ~ v706(VarCurr)
     => ! [B] :
          ( range_31_0(B)
         => ( v705(VarCurr,B)
          <=> v707(VarCurr,B) ) ) ) )).

fof(addConditionBooleanCondEqualRangesThenBranch_21,axiom,(
    ! [VarCurr] :
      ( v706(VarCurr)
     => ! [B] :
          ( range_31_0(B)
         => ( v705(VarCurr,B)
          <=> $false ) ) ) )).

fof(addSignExtensionConstraint_53,axiom,(
    ! [VarCurr] :
      ( v707(VarCurr,bitIndex6)
    <=> v708(VarCurr,bitIndex5) ) )).

fof(addSignExtensionConstraint_52,axiom,(
    ! [VarCurr] :
      ( v707(VarCurr,bitIndex7)
    <=> v708(VarCurr,bitIndex5) ) )).

fof(addSignExtensionConstraint_51,axiom,(
    ! [VarCurr] :
      ( v707(VarCurr,bitIndex8)
    <=> v708(VarCurr,bitIndex5) ) )).

fof(addSignExtensionConstraint_50,axiom,(
    ! [VarCurr] :
      ( v707(VarCurr,bitIndex9)
    <=> v708(VarCurr,bitIndex5) ) )).

fof(addSignExtensionConstraint_49,axiom,(
    ! [VarCurr] :
      ( v707(VarCurr,bitIndex10)
    <=> v708(VarCurr,bitIndex5) ) )).

fof(addSignExtensionConstraint_48,axiom,(
    ! [VarCurr] :
      ( v707(VarCurr,bitIndex11)
    <=> v708(VarCurr,bitIndex5) ) )).

fof(addSignExtensionConstraint_47,axiom,(
    ! [VarCurr] :
      ( v707(VarCurr,bitIndex12)
    <=> v708(VarCurr,bitIndex5) ) )).

fof(addSignExtensionConstraint_46,axiom,(
    ! [VarCurr] :
      ( v707(VarCurr,bitIndex13)
    <=> v708(VarCurr,bitIndex5) ) )).

fof(addSignExtensionConstraint_45,axiom,(
    ! [VarCurr] :
      ( v707(VarCurr,bitIndex14)
    <=> v708(VarCurr,bitIndex5) ) )).

fof(addSignExtensionConstraint_44,axiom,(
    ! [VarCurr] :
      ( v707(VarCurr,bitIndex15)
    <=> v708(VarCurr,bitIndex5) ) )).

fof(addSignExtensionConstraint_43,axiom,(
    ! [VarCurr] :
      ( v707(VarCurr,bitIndex16)
    <=> v708(VarCurr,bitIndex5) ) )).

fof(addSignExtensionConstraint_42,axiom,(
    ! [VarCurr] :
      ( v707(VarCurr,bitIndex17)
    <=> v708(VarCurr,bitIndex5) ) )).

fof(addSignExtensionConstraint_41,axiom,(
    ! [VarCurr] :
      ( v707(VarCurr,bitIndex18)
    <=> v708(VarCurr,bitIndex5) ) )).

fof(addSignExtensionConstraint_40,axiom,(
    ! [VarCurr] :
      ( v707(VarCurr,bitIndex19)
    <=> v708(VarCurr,bitIndex5) ) )).

fof(addSignExtensionConstraint_39,axiom,(
    ! [VarCurr] :
      ( v707(VarCurr,bitIndex20)
    <=> v708(VarCurr,bitIndex5) ) )).

fof(addSignExtensionConstraint_38,axiom,(
    ! [VarCurr] :
      ( v707(VarCurr,bitIndex21)
    <=> v708(VarCurr,bitIndex5) ) )).

fof(addSignExtensionConstraint_37,axiom,(
    ! [VarCurr] :
      ( v707(VarCurr,bitIndex22)
    <=> v708(VarCurr,bitIndex5) ) )).

fof(addSignExtensionConstraint_36,axiom,(
    ! [VarCurr] :
      ( v707(VarCurr,bitIndex23)
    <=> v708(VarCurr,bitIndex5) ) )).

fof(addSignExtensionConstraint_35,axiom,(
    ! [VarCurr] :
      ( v707(VarCurr,bitIndex24)
    <=> v708(VarCurr,bitIndex5) ) )).

fof(addSignExtensionConstraint_34,axiom,(
    ! [VarCurr] :
      ( v707(VarCurr,bitIndex25)
    <=> v708(VarCurr,bitIndex5) ) )).

fof(addSignExtensionConstraint_33,axiom,(
    ! [VarCurr] :
      ( v707(VarCurr,bitIndex26)
    <=> v708(VarCurr,bitIndex5) ) )).

fof(addSignExtensionConstraint_32,axiom,(
    ! [VarCurr] :
      ( v707(VarCurr,bitIndex27)
    <=> v708(VarCurr,bitIndex5) ) )).

fof(addSignExtensionConstraint_31,axiom,(
    ! [VarCurr] :
      ( v707(VarCurr,bitIndex28)
    <=> v708(VarCurr,bitIndex5) ) )).

fof(addSignExtensionConstraint_30,axiom,(
    ! [VarCurr] :
      ( v707(VarCurr,bitIndex29)
    <=> v708(VarCurr,bitIndex5) ) )).

fof(addSignExtensionConstraint_29,axiom,(
    ! [VarCurr] :
      ( v707(VarCurr,bitIndex30)
    <=> v708(VarCurr,bitIndex5) ) )).

fof(addSignExtensionConstraint_28,axiom,(
    ! [VarCurr] :
      ( v707(VarCurr,bitIndex31)
    <=> v708(VarCurr,bitIndex5) ) )).

fof(addAssignment_192,axiom,(
    ! [VarCurr,B] :
      ( range_5_0(B)
     => ( v707(VarCurr,B)
      <=> v708(VarCurr,B) ) ) )).

fof(range_axiom_10,axiom,(
    ! [B] :
      ( range_5_0(B)
    <=> ( $false
        | bitIndex0 = B
        | bitIndex1 = B
        | bitIndex2 = B
        | bitIndex3 = B
        | bitIndex4 = B
        | bitIndex5 = B ) ) )).

fof(addAssignment_191,axiom,(
    ! [VarCurr] :
      ( v708(VarCurr,bitIndex0)
    <=> v743(VarCurr) ) )).

fof(addAssignment_190,axiom,(
    ! [VarCurr] :
      ( v708(VarCurr,bitIndex1)
    <=> v741(VarCurr) ) )).

fof(addAssignment_189,axiom,(
    ! [VarCurr] :
      ( v708(VarCurr,bitIndex2)
    <=> v737(VarCurr) ) )).

fof(addAssignment_188,axiom,(
    ! [VarCurr] :
      ( v708(VarCurr,bitIndex3)
    <=> v733(VarCurr) ) )).

fof(addAssignment_187,axiom,(
    ! [VarCurr] :
      ( v708(VarCurr,bitIndex4)
    <=> v729(VarCurr) ) )).

fof(addAssignment_186,axiom,(
    ! [VarCurr] :
      ( v708(VarCurr,bitIndex5)
    <=> v710(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_114,axiom,(
    ! [VarCurr] :
      ( v741(VarCurr)
    <=> ( v742(VarCurr)
        & v744(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_113,axiom,(
    ! [VarCurr] :
      ( v744(VarCurr)
    <=> ( v714(VarCurr,bitIndex0)
        | v723(VarCurr) ) ) )).

fof(writeBinaryOperatorShiftedRanges_45,axiom,(
    ! [VarCurr] :
      ( v742(VarCurr)
    <=> ( v743(VarCurr)
        | v714(VarCurr,bitIndex1) ) ) )).

fof(writeUnaryOperator_62,axiom,(
    ! [VarCurr] :
      ( ~ v743(VarCurr)
    <=> v714(VarCurr,bitIndex0) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_112,axiom,(
    ! [VarCurr] :
      ( v737(VarCurr)
    <=> ( v738(VarCurr)
        & v740(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_111,axiom,(
    ! [VarCurr] :
      ( v740(VarCurr)
    <=> ( v721(VarCurr)
        | v724(VarCurr) ) ) )).

fof(writeBinaryOperatorShiftedRanges_44,axiom,(
    ! [VarCurr] :
      ( v738(VarCurr)
    <=> ( v739(VarCurr)
        | v714(VarCurr,bitIndex2) ) ) )).

fof(writeUnaryOperator_61,axiom,(
    ! [VarCurr] :
      ( ~ v739(VarCurr)
    <=> v721(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_110,axiom,(
    ! [VarCurr] :
      ( v733(VarCurr)
    <=> ( v734(VarCurr)
        & v736(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_109,axiom,(
    ! [VarCurr] :
      ( v736(VarCurr)
    <=> ( v719(VarCurr)
        | v725(VarCurr) ) ) )).

fof(writeBinaryOperatorShiftedRanges_43,axiom,(
    ! [VarCurr] :
      ( v734(VarCurr)
    <=> ( v735(VarCurr)
        | v714(VarCurr,bitIndex3) ) ) )).

fof(writeUnaryOperator_60,axiom,(
    ! [VarCurr] :
      ( ~ v735(VarCurr)
    <=> v719(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_108,axiom,(
    ! [VarCurr] :
      ( v729(VarCurr)
    <=> ( v730(VarCurr)
        & v732(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_107,axiom,(
    ! [VarCurr] :
      ( v732(VarCurr)
    <=> ( v717(VarCurr)
        | v726(VarCurr) ) ) )).

fof(writeBinaryOperatorShiftedRanges_42,axiom,(
    ! [VarCurr] :
      ( v730(VarCurr)
    <=> ( v731(VarCurr)
        | v714(VarCurr,bitIndex4) ) ) )).

fof(writeUnaryOperator_59,axiom,(
    ! [VarCurr] :
      ( ~ v731(VarCurr)
    <=> v717(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_106,axiom,(
    ! [VarCurr] :
      ( v710(VarCurr)
    <=> ( v711(VarCurr)
        & v727(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_105,axiom,(
    ! [VarCurr] :
      ( v727(VarCurr)
    <=> ( v713(VarCurr)
        | v728(VarCurr) ) ) )).

fof(writeUnaryOperator_58,axiom,(
    ! [VarCurr] :
      ( ~ v728(VarCurr)
    <=> v714(VarCurr,bitIndex5) ) )).

fof(writeBinaryOperatorShiftedRanges_41,axiom,(
    ! [VarCurr] :
      ( v711(VarCurr)
    <=> ( v712(VarCurr)
        | v714(VarCurr,bitIndex5) ) ) )).

fof(writeUnaryOperator_57,axiom,(
    ! [VarCurr] :
      ( ~ v712(VarCurr)
    <=> v713(VarCurr) ) )).

fof(writeBinaryOperatorShiftedRanges_40,axiom,(
    ! [VarCurr] :
      ( v713(VarCurr)
    <=> ( v714(VarCurr,bitIndex4)
        | v716(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_104,axiom,(
    ! [VarCurr] :
      ( v716(VarCurr)
    <=> ( v717(VarCurr)
        & v726(VarCurr) ) ) )).

fof(writeUnaryOperator_56,axiom,(
    ! [VarCurr] :
      ( ~ v726(VarCurr)
    <=> v714(VarCurr,bitIndex4) ) )).

fof(writeBinaryOperatorShiftedRanges_39,axiom,(
    ! [VarCurr] :
      ( v717(VarCurr)
    <=> ( v714(VarCurr,bitIndex3)
        | v718(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_103,axiom,(
    ! [VarCurr] :
      ( v718(VarCurr)
    <=> ( v719(VarCurr)
        & v725(VarCurr) ) ) )).

fof(writeUnaryOperator_55,axiom,(
    ! [VarCurr] :
      ( ~ v725(VarCurr)
    <=> v714(VarCurr,bitIndex3) ) )).

fof(writeBinaryOperatorShiftedRanges_38,axiom,(
    ! [VarCurr] :
      ( v719(VarCurr)
    <=> ( v714(VarCurr,bitIndex2)
        | v720(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_102,axiom,(
    ! [VarCurr] :
      ( v720(VarCurr)
    <=> ( v721(VarCurr)
        & v724(VarCurr) ) ) )).

fof(writeUnaryOperator_54,axiom,(
    ! [VarCurr] :
      ( ~ v724(VarCurr)
    <=> v714(VarCurr,bitIndex2) ) )).

fof(writeBinaryOperatorShiftedRanges_37,axiom,(
    ! [VarCurr] :
      ( v721(VarCurr)
    <=> ( v714(VarCurr,bitIndex1)
        | v722(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_101,axiom,(
    ! [VarCurr] :
      ( v722(VarCurr)
    <=> ( v714(VarCurr,bitIndex0)
        & v723(VarCurr) ) ) )).

fof(writeUnaryOperator_53,axiom,(
    ! [VarCurr] :
      ( ~ v723(VarCurr)
    <=> v714(VarCurr,bitIndex1) ) )).

fof(addZeroExtensionConstraint_1,axiom,(
    ! [VarCurr] : ~ v714(VarCurr,bitIndex5) )).

fof(addAssignment_185,axiom,(
    ! [VarCurr,B] :
      ( range_4_0(B)
     => ( v714(VarCurr,B)
      <=> v75(VarCurr,B) ) ) )).

fof(addBitVectorEqualityBitBlasted_33,axiom,(
    ! [VarCurr] :
      ( v706(VarCurr)
    <=> ( ( v75(VarCurr,bitIndex4)
        <=> $false )
        & ( v75(VarCurr,bitIndex3)
        <=> $false )
        & ( v75(VarCurr,bitIndex2)
        <=> $false )
        & ( v75(VarCurr,bitIndex1)
        <=> $false )
        & ( v75(VarCurr,bitIndex0)
        <=> $false ) ) ) )).

fof(addBitVectorEqualityBitBlasted_32,axiom,(
    ! [VarCurr] :
      ( v703(VarCurr)
    <=> ( ( v704(VarCurr,bitIndex1)
        <=> $false )
        & ( v704(VarCurr,bitIndex0)
        <=> $true ) ) ) )).

fof(addAssignment_184,axiom,(
    ! [VarCurr] :
      ( v704(VarCurr,bitIndex0)
    <=> v25(VarCurr) ) )).

fof(addAssignment_183,axiom,(
    ! [VarCurr] :
      ( v704(VarCurr,bitIndex1)
    <=> v79(VarCurr) ) )).

fof(addAssignmentInitValueVector,axiom,(
    ! [B] :
      ( range_4_0(B)
     => ( v75(constB0,B)
      <=> $false ) ) )).

fof(range_axiom_9,axiom,(
    ! [B] :
      ( range_4_0(B)
    <=> ( $false
        | bitIndex0 = B
        | bitIndex1 = B
        | bitIndex2 = B
        | bitIndex3 = B
        | bitIndex4 = B ) ) )).

fof(bitBlastConstant_187,axiom,(
    ~ b00000(bitIndex4) )).

fof(bitBlastConstant_186,axiom,(
    ~ b00000(bitIndex3) )).

fof(bitBlastConstant_185,axiom,(
    ~ b00000(bitIndex2) )).

fof(bitBlastConstant_184,axiom,(
    ~ b00000(bitIndex1) )).

fof(bitBlastConstant_183,axiom,(
    ~ b00000(bitIndex0) )).

fof(addBitVectorEqualityBitBlasted_31,axiom,(
    ! [VarCurr] :
      ( v701(VarCurr)
    <=> ( ( v702(VarCurr,bitIndex1)
        <=> $false )
        & ( v702(VarCurr,bitIndex0)
        <=> $false ) ) ) )).

fof(addAssignment_182,axiom,(
    ! [VarCurr] :
      ( v702(VarCurr,bitIndex0)
    <=> v25(VarCurr) ) )).

fof(addAssignment_181,axiom,(
    ! [VarCurr] :
      ( v702(VarCurr,bitIndex1)
    <=> v79(VarCurr) ) )).

fof(addAssignment_180,axiom,(
    ! [VarCurr] :
      ( v79(VarCurr)
    <=> v81(VarCurr) ) )).

fof(addAssignment_179,axiom,(
    ! [VarCurr] :
      ( v81(VarCurr)
    <=> v83(VarCurr) ) )).

fof(addAssignment_178,axiom,(
    ! [VarCurr] :
      ( v83(VarCurr)
    <=> v85(VarCurr) ) )).

fof(addAssignment_177,axiom,(
    ! [VarCurr] :
      ( v85(VarCurr)
    <=> v87(VarCurr) ) )).

fof(addAssignment_176,axiom,(
    ! [VarCurr] :
      ( v87(VarCurr)
    <=> v89(VarCurr) ) )).

fof(addCaseBooleanConditionEqualRanges1_3,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( ~ v685(VarNext)
       => ( v89(VarNext)
        <=> v89(VarCurr) ) ) ) )).

fof(addCaseBooleanConditionEqualRanges0_5,axiom,(
    ! [VarNext] :
      ( v685(VarNext)
     => ( v89(VarNext)
      <=> v693(VarNext) ) ) )).

fof(addAssignment_175,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( v693(VarNext)
      <=> v691(VarCurr) ) ) )).

fof(aaddConditionBooleanCondEqualRangesElseBranch_20,axiom,(
    ! [VarCurr] :
      ( ~ v694(VarCurr)
     => ( v691(VarCurr)
      <=> v95(VarCurr) ) ) )).

fof(addConditionBooleanCondEqualRangesThenBranch_20,axiom,(
    ! [VarCurr] :
      ( v694(VarCurr)
     => ( v691(VarCurr)
      <=> $false ) ) )).

fof(writeUnaryOperator_52,axiom,(
    ! [VarCurr] :
      ( ~ v694(VarCurr)
    <=> v91(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_100,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( v685(VarNext)
      <=> v686(VarNext) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_99,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( v686(VarNext)
      <=> ( v687(VarNext)
          & v336(VarNext) ) ) ) )).

fof(writeUnaryOperator_51,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( ~ v687(VarNext)
      <=> v347(VarNext) ) ) )).

fof(aaddConditionBooleanCondEqualRangesElseBranch_19,axiom,(
    ! [VarCurr] :
      ( ~ v677(VarCurr)
     => ( v95(VarCurr)
      <=> $false ) ) )).

fof(addConditionBooleanCondEqualRangesThenBranch_19,axiom,(
    ! [VarCurr] :
      ( v677(VarCurr)
     => ( v95(VarCurr)
      <=> v682(VarCurr) ) ) )).

fof(addParallelCaseBooleanConditionEqualRanges1_11,axiom,(
    ! [VarCurr] :
      ( ~ v679(VarCurr)
     => ( v682(VarCurr)
      <=> $false ) ) )).

fof(addParallelCaseBooleanConditionEqualRanges0_10,axiom,(
    ! [VarCurr] :
      ( v679(VarCurr)
     => ( v682(VarCurr)
      <=> $true ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_98,axiom,(
    ! [VarCurr] :
      ( v677(VarCurr)
    <=> ( v678(VarCurr)
        & v681(VarCurr) ) ) )).

fof(writeUnaryOperator_50,axiom,(
    ! [VarCurr] :
      ( ~ v681(VarCurr)
    <=> v283(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_97,axiom,(
    ! [VarCurr] :
      ( v678(VarCurr)
    <=> ( v679(VarCurr)
        | v680(VarCurr) ) ) )).

fof(writeUnaryOperator_49,axiom,(
    ! [VarCurr] :
      ( ~ v680(VarCurr)
    <=> v280(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_96,axiom,(
    ! [VarCurr] :
      ( v679(VarCurr)
    <=> ( v452(VarCurr)
        & v280(VarCurr) ) ) )).

fof(aaddConditionBooleanCondEqualRangesElseBranch_18,axiom,(
    ! [VarCurr] :
      ( ~ v99(VarCurr)
     => ! [B] :
          ( range_1_0(B)
         => ( v97(VarCurr,B)
          <=> v607(VarCurr,B) ) ) ) )).

fof(addConditionBooleanCondEqualRangesThenBranch_18,axiom,(
    ! [VarCurr] :
      ( v99(VarCurr)
     => ! [B] :
          ( range_1_0(B)
         => ( v97(VarCurr,B)
          <=> $false ) ) ) )).

fof(addParallelCaseBooleanConditionEqualRanges4,axiom,(
    ! [VarCurr] :
      ( ( ~ v608(VarCurr)
        & ~ v645(VarCurr)
        & ~ v653(VarCurr)
        & ~ v661(VarCurr) )
     => ! [B] :
          ( range_1_0(B)
         => ( v607(VarCurr,B)
          <=> $true ) ) ) )).

fof(addParallelCaseBooleanConditionEqualRanges3_2,axiom,(
    ! [VarCurr] :
      ( v661(VarCurr)
     => ! [B] :
          ( range_1_0(B)
         => ( v607(VarCurr,B)
          <=> b01(B) ) ) ) )).

fof(addParallelCaseBooleanConditionEqualRanges2_5,axiom,(
    ! [VarCurr] :
      ( v653(VarCurr)
     => ! [B] :
          ( range_1_0(B)
         => ( v607(VarCurr,B)
          <=> $false ) ) ) )).

fof(addParallelCaseBooleanConditionEqualRanges1_10,axiom,(
    ! [VarCurr] :
      ( v645(VarCurr)
     => ! [B] :
          ( range_1_0(B)
         => ( v607(VarCurr,B)
          <=> v652(VarCurr,B) ) ) ) )).

fof(addParallelCaseBooleanConditionEqualRanges0_9,axiom,(
    ! [VarCurr] :
      ( v608(VarCurr)
     => ! [B] :
          ( range_1_0(B)
         => ( v607(VarCurr,B)
          <=> $false ) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_95,axiom,(
    ! [VarCurr] :
      ( v661(VarCurr)
    <=> ( v663(VarCurr)
        | v672(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_94,axiom,(
    ! [VarCurr] :
      ( v672(VarCurr)
    <=> ( v674(VarCurr)
        & v627(VarCurr) ) ) )).

fof(writeBinaryOperatorShiftedRanges_36,axiom,(
    ! [VarCurr] :
      ( v674(VarCurr)
    <=> ( v675(VarCurr)
        & v495(VarCurr,bitIndex5) ) ) )).

fof(writeBinaryOperatorShiftedRanges_35,axiom,(
    ! [VarCurr] :
      ( v675(VarCurr)
    <=> ( v624(VarCurr)
        & v495(VarCurr,bitIndex4) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_93,axiom,(
    ! [VarCurr] :
      ( v663(VarCurr)
    <=> ( v664(VarCurr)
        | v669(VarCurr) ) ) )).

fof(writeBinaryOperatorShiftedRanges_34,axiom,(
    ! [VarCurr] :
      ( v669(VarCurr)
    <=> ( v671(VarCurr)
        & v495(VarCurr,bitIndex6) ) ) )).

fof(writeBinaryOperatorShiftedRanges_33,axiom,(
    ! [VarCurr] :
      ( v671(VarCurr)
    <=> ( v667(VarCurr)
        & v495(VarCurr,bitIndex5) ) ) )).

fof(writeBinaryOperatorShiftedRanges_32,axiom,(
    ! [VarCurr] :
      ( v664(VarCurr)
    <=> ( v666(VarCurr)
        & v495(VarCurr,bitIndex6) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_92,axiom,(
    ! [VarCurr] :
      ( v666(VarCurr)
    <=> ( v667(VarCurr)
        & v626(VarCurr) ) ) )).

fof(writeBinaryOperatorShiftedRanges_31,axiom,(
    ! [VarCurr] :
      ( v667(VarCurr)
    <=> ( v668(VarCurr)
        & v495(VarCurr,bitIndex4) ) ) )).

fof(writeBinaryOperatorShiftedRanges_30,axiom,(
    ! [VarCurr] :
      ( v668(VarCurr)
    <=> ( v619(VarCurr)
        & v495(VarCurr,bitIndex3) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_91,axiom,(
    ! [VarCurr] :
      ( v653(VarCurr)
    <=> ( v654(VarCurr)
        | v656(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_90,axiom,(
    ! [VarCurr] :
      ( v656(VarCurr)
    <=> ( v658(VarCurr)
        & v627(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_89,axiom,(
    ! [VarCurr] :
      ( v658(VarCurr)
    <=> ( v659(VarCurr)
        & v626(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_88,axiom,(
    ! [VarCurr] :
      ( v659(VarCurr)
    <=> ( v660(VarCurr)
        & v625(VarCurr) ) ) )).

fof(writeBinaryOperatorShiftedRanges_29,axiom,(
    ! [VarCurr] :
      ( v660(VarCurr)
    <=> ( v636(VarCurr)
        & v495(VarCurr,bitIndex3) ) ) )).

fof(writeBinaryOperatorShiftedRanges_28,axiom,(
    ! [VarCurr] :
      ( v654(VarCurr)
    <=> ( v647(VarCurr)
        & v495(VarCurr,bitIndex6) ) ) )).

fof(aaddConditionBooleanCondEqualRangesElseBranch_17,axiom,(
    ! [VarCurr] :
      ( ~ v592(VarCurr)
     => ! [B] :
          ( range_1_0(B)
         => ( v652(VarCurr,B)
          <=> $false ) ) ) )).

fof(addConditionBooleanCondEqualRangesThenBranch_17,axiom,(
    ! [VarCurr] :
      ( v592(VarCurr)
     => ! [B] :
          ( range_1_0(B)
         => ( v652(VarCurr,B)
          <=> b10(B) ) ) ) )).

fof(range_axiom_8,axiom,(
    ! [B] :
      ( range_1_0(B)
    <=> ( $false
        | bitIndex0 = B
        | bitIndex1 = B ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_87,axiom,(
    ! [VarCurr] :
      ( v645(VarCurr)
    <=> ( v647(VarCurr)
        & v627(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_86,axiom,(
    ! [VarCurr] :
      ( v647(VarCurr)
    <=> ( v648(VarCurr)
        & v626(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_85,axiom,(
    ! [VarCurr] :
      ( v648(VarCurr)
    <=> ( v649(VarCurr)
        & v625(VarCurr) ) ) )).

fof(writeBinaryOperatorShiftedRanges_27,axiom,(
    ! [VarCurr] :
      ( v649(VarCurr)
    <=> ( v650(VarCurr)
        & v495(VarCurr,bitIndex3) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_84,axiom,(
    ! [VarCurr] :
      ( v650(VarCurr)
    <=> ( v651(VarCurr)
        & v623(VarCurr) ) ) )).

fof(writeBinaryOperatorShiftedRanges_26,axiom,(
    ! [VarCurr] :
      ( v651(VarCurr)
    <=> ( v621(VarCurr)
        & v495(VarCurr,bitIndex1) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_83,axiom,(
    ! [VarCurr] :
      ( v608(VarCurr)
    <=> ( v610(VarCurr)
        | v643(VarCurr) ) ) )).

fof(writeBinaryOperatorShiftedRanges_25,axiom,(
    ! [VarCurr] :
      ( v643(VarCurr)
    <=> ( v630(VarCurr)
        & v495(VarCurr,bitIndex6) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_82,axiom,(
    ! [VarCurr] :
      ( v610(VarCurr)
    <=> ( v611(VarCurr)
        | v641(VarCurr) ) ) )).

fof(writeBinaryOperatorShiftedRanges_24,axiom,(
    ! [VarCurr] :
      ( v641(VarCurr)
    <=> ( v616(VarCurr)
        & v495(VarCurr,bitIndex6) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_81,axiom,(
    ! [VarCurr] :
      ( v611(VarCurr)
    <=> ( v612(VarCurr)
        | v638(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_80,axiom,(
    ! [VarCurr] :
      ( v638(VarCurr)
    <=> ( v640(VarCurr)
        & v627(VarCurr) ) ) )).

fof(writeBinaryOperatorShiftedRanges_23,axiom,(
    ! [VarCurr] :
      ( v640(VarCurr)
    <=> ( v634(VarCurr)
        & v495(VarCurr,bitIndex5) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_79,axiom,(
    ! [VarCurr] :
      ( v612(VarCurr)
    <=> ( v613(VarCurr)
        | v631(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_78,axiom,(
    ! [VarCurr] :
      ( v631(VarCurr)
    <=> ( v633(VarCurr)
        & v627(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_77,axiom,(
    ! [VarCurr] :
      ( v633(VarCurr)
    <=> ( v634(VarCurr)
        & v626(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_76,axiom,(
    ! [VarCurr] :
      ( v634(VarCurr)
    <=> ( v635(VarCurr)
        & v625(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_75,axiom,(
    ! [VarCurr] :
      ( v635(VarCurr)
    <=> ( v636(VarCurr)
        & v624(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_74,axiom,(
    ! [VarCurr] :
      ( v636(VarCurr)
    <=> ( v637(VarCurr)
        & v623(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_73,axiom,(
    ! [VarCurr] :
      ( v637(VarCurr)
    <=> ( v495(VarCurr,bitIndex0)
        & v622(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_72,axiom,(
    ! [VarCurr] :
      ( v613(VarCurr)
    <=> ( v614(VarCurr)
        | v628(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_71,axiom,(
    ! [VarCurr] :
      ( v628(VarCurr)
    <=> ( v630(VarCurr)
        & v627(VarCurr) ) ) )).

fof(writeBinaryOperatorShiftedRanges_22,axiom,(
    ! [VarCurr] :
      ( v630(VarCurr)
    <=> ( v617(VarCurr)
        & v495(VarCurr,bitIndex5) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_70,axiom,(
    ! [VarCurr] :
      ( v614(VarCurr)
    <=> ( v616(VarCurr)
        & v627(VarCurr) ) ) )).

fof(writeUnaryOperator_48,axiom,(
    ! [VarCurr] :
      ( ~ v627(VarCurr)
    <=> v495(VarCurr,bitIndex6) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_69,axiom,(
    ! [VarCurr] :
      ( v616(VarCurr)
    <=> ( v617(VarCurr)
        & v626(VarCurr) ) ) )).

fof(writeUnaryOperator_47,axiom,(
    ! [VarCurr] :
      ( ~ v626(VarCurr)
    <=> v495(VarCurr,bitIndex5) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_68,axiom,(
    ! [VarCurr] :
      ( v617(VarCurr)
    <=> ( v618(VarCurr)
        & v625(VarCurr) ) ) )).

fof(writeUnaryOperator_46,axiom,(
    ! [VarCurr] :
      ( ~ v625(VarCurr)
    <=> v495(VarCurr,bitIndex4) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_67,axiom,(
    ! [VarCurr] :
      ( v618(VarCurr)
    <=> ( v619(VarCurr)
        & v624(VarCurr) ) ) )).

fof(writeUnaryOperator_45,axiom,(
    ! [VarCurr] :
      ( ~ v624(VarCurr)
    <=> v495(VarCurr,bitIndex3) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_66,axiom,(
    ! [VarCurr] :
      ( v619(VarCurr)
    <=> ( v620(VarCurr)
        & v623(VarCurr) ) ) )).

fof(writeUnaryOperator_44,axiom,(
    ! [VarCurr] :
      ( ~ v623(VarCurr)
    <=> v495(VarCurr,bitIndex2) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_65,axiom,(
    ! [VarCurr] :
      ( v620(VarCurr)
    <=> ( v621(VarCurr)
        & v622(VarCurr) ) ) )).

fof(writeUnaryOperator_43,axiom,(
    ! [VarCurr] :
      ( ~ v622(VarCurr)
    <=> v495(VarCurr,bitIndex1) ) )).

fof(writeUnaryOperator_42,axiom,(
    ! [VarCurr] :
      ( ~ v621(VarCurr)
    <=> v495(VarCurr,bitIndex0) ) )).

fof(addAssignment_174,axiom,(
    ! [VarCurr] :
      ( v592(VarCurr)
    <=> v497(VarCurr,bitIndex81) ) )).

fof(addAssignment_173,axiom,(
    ! [VarCurr] :
      ( v497(VarCurr,bitIndex81)
    <=> v499(VarCurr,bitIndex81) ) )).

fof(addAssignment_172,axiom,(
    ! [VarCurr] :
      ( v499(VarCurr,bitIndex81)
    <=> v501(VarCurr,bitIndex696) ) )).

fof(addAssignment_171,axiom,(
    ! [VarNext] :
      ( v501(VarNext,bitIndex696)
    <=> v594(VarNext,bitIndex81) ) )).

fof(addCaseBooleanConditionShiftedRanges1_1,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( ~ v596(VarNext)
       => ( ( v594(VarNext,bitIndex122)
          <=> v501(VarCurr,bitIndex737) )
          & ( v594(VarNext,bitIndex121)
          <=> v501(VarCurr,bitIndex736) )
          & ( v594(VarNext,bitIndex120)
          <=> v501(VarCurr,bitIndex735) )
          & ( v594(VarNext,bitIndex119)
          <=> v501(VarCurr,bitIndex734) )
          & ( v594(VarNext,bitIndex118)
          <=> v501(VarCurr,bitIndex733) )
          & ( v594(VarNext,bitIndex117)
          <=> v501(VarCurr,bitIndex732) )
          & ( v594(VarNext,bitIndex116)
          <=> v501(VarCurr,bitIndex731) )
          & ( v594(VarNext,bitIndex115)
          <=> v501(VarCurr,bitIndex730) )
          & ( v594(VarNext,bitIndex114)
          <=> v501(VarCurr,bitIndex729) )
          & ( v594(VarNext,bitIndex113)
          <=> v501(VarCurr,bitIndex728) )
          & ( v594(VarNext,bitIndex112)
          <=> v501(VarCurr,bitIndex727) )
          & ( v594(VarNext,bitIndex111)
          <=> v501(VarCurr,bitIndex726) )
          & ( v594(VarNext,bitIndex110)
          <=> v501(VarCurr,bitIndex725) )
          & ( v594(VarNext,bitIndex109)
          <=> v501(VarCurr,bitIndex724) )
          & ( v594(VarNext,bitIndex108)
          <=> v501(VarCurr,bitIndex723) )
          & ( v594(VarNext,bitIndex107)
          <=> v501(VarCurr,bitIndex722) )
          & ( v594(VarNext,bitIndex106)
          <=> v501(VarCurr,bitIndex721) )
          & ( v594(VarNext,bitIndex105)
          <=> v501(VarCurr,bitIndex720) )
          & ( v594(VarNext,bitIndex104)
          <=> v501(VarCurr,bitIndex719) )
          & ( v594(VarNext,bitIndex103)
          <=> v501(VarCurr,bitIndex718) )
          & ( v594(VarNext,bitIndex102)
          <=> v501(VarCurr,bitIndex717) )
          & ( v594(VarNext,bitIndex101)
          <=> v501(VarCurr,bitIndex716) )
          & ( v594(VarNext,bitIndex100)
          <=> v501(VarCurr,bitIndex715) )
          & ( v594(VarNext,bitIndex99)
          <=> v501(VarCurr,bitIndex714) )
          & ( v594(VarNext,bitIndex98)
          <=> v501(VarCurr,bitIndex713) )
          & ( v594(VarNext,bitIndex97)
          <=> v501(VarCurr,bitIndex712) )
          & ( v594(VarNext,bitIndex96)
          <=> v501(VarCurr,bitIndex711) )
          & ( v594(VarNext,bitIndex95)
          <=> v501(VarCurr,bitIndex710) )
          & ( v594(VarNext,bitIndex94)
          <=> v501(VarCurr,bitIndex709) )
          & ( v594(VarNext,bitIndex93)
          <=> v501(VarCurr,bitIndex708) )
          & ( v594(VarNext,bitIndex92)
          <=> v501(VarCurr,bitIndex707) )
          & ( v594(VarNext,bitIndex91)
          <=> v501(VarCurr,bitIndex706) )
          & ( v594(VarNext,bitIndex90)
          <=> v501(VarCurr,bitIndex705) )
          & ( v594(VarNext,bitIndex89)
          <=> v501(VarCurr,bitIndex704) )
          & ( v594(VarNext,bitIndex88)
          <=> v501(VarCurr,bitIndex703) )
          & ( v594(VarNext,bitIndex87)
          <=> v501(VarCurr,bitIndex702) )
          & ( v594(VarNext,bitIndex86)
          <=> v501(VarCurr,bitIndex701) )
          & ( v594(VarNext,bitIndex85)
          <=> v501(VarCurr,bitIndex700) )
          & ( v594(VarNext,bitIndex84)
          <=> v501(VarCurr,bitIndex699) )
          & ( v594(VarNext,bitIndex83)
          <=> v501(VarCurr,bitIndex698) )
          & ( v594(VarNext,bitIndex82)
          <=> v501(VarCurr,bitIndex697) )
          & ( v594(VarNext,bitIndex81)
          <=> v501(VarCurr,bitIndex696) )
          & ( v594(VarNext,bitIndex80)
          <=> v501(VarCurr,bitIndex695) )
          & ( v594(VarNext,bitIndex79)
          <=> v501(VarCurr,bitIndex694) )
          & ( v594(VarNext,bitIndex78)
          <=> v501(VarCurr,bitIndex693) )
          & ( v594(VarNext,bitIndex77)
          <=> v501(VarCurr,bitIndex692) )
          & ( v594(VarNext,bitIndex76)
          <=> v501(VarCurr,bitIndex691) )
          & ( v594(VarNext,bitIndex75)
          <=> v501(VarCurr,bitIndex690) )
          & ( v594(VarNext,bitIndex74)
          <=> v501(VarCurr,bitIndex689) )
          & ( v594(VarNext,bitIndex73)
          <=> v501(VarCurr,bitIndex688) )
          & ( v594(VarNext,bitIndex72)
          <=> v501(VarCurr,bitIndex687) )
          & ( v594(VarNext,bitIndex71)
          <=> v501(VarCurr,bitIndex686) )
          & ( v594(VarNext,bitIndex70)
          <=> v501(VarCurr,bitIndex685) )
          & ( v594(VarNext,bitIndex69)
          <=> v501(VarCurr,bitIndex684) )
          & ( v594(VarNext,bitIndex68)
          <=> v501(VarCurr,bitIndex683) )
          & ( v594(VarNext,bitIndex67)
          <=> v501(VarCurr,bitIndex682) )
          & ( v594(VarNext,bitIndex66)
          <=> v501(VarCurr,bitIndex681) )
          & ( v594(VarNext,bitIndex65)
          <=> v501(VarCurr,bitIndex680) )
          & ( v594(VarNext,bitIndex64)
          <=> v501(VarCurr,bitIndex679) )
          & ( v594(VarNext,bitIndex63)
          <=> v501(VarCurr,bitIndex678) )
          & ( v594(VarNext,bitIndex62)
          <=> v501(VarCurr,bitIndex677) )
          & ( v594(VarNext,bitIndex61)
          <=> v501(VarCurr,bitIndex676) )
          & ( v594(VarNext,bitIndex60)
          <=> v501(VarCurr,bitIndex675) )
          & ( v594(VarNext,bitIndex59)
          <=> v501(VarCurr,bitIndex674) )
          & ( v594(VarNext,bitIndex58)
          <=> v501(VarCurr,bitIndex673) )
          & ( v594(VarNext,bitIndex57)
          <=> v501(VarCurr,bitIndex672) )
          & ( v594(VarNext,bitIndex56)
          <=> v501(VarCurr,bitIndex671) )
          & ( v594(VarNext,bitIndex55)
          <=> v501(VarCurr,bitIndex670) )
          & ( v594(VarNext,bitIndex54)
          <=> v501(VarCurr,bitIndex669) )
          & ( v594(VarNext,bitIndex53)
          <=> v501(VarCurr,bitIndex668) )
          & ( v594(VarNext,bitIndex52)
          <=> v501(VarCurr,bitIndex667) )
          & ( v594(VarNext,bitIndex51)
          <=> v501(VarCurr,bitIndex666) )
          & ( v594(VarNext,bitIndex50)
          <=> v501(VarCurr,bitIndex665) )
          & ( v594(VarNext,bitIndex49)
          <=> v501(VarCurr,bitIndex664) )
          & ( v594(VarNext,bitIndex48)
          <=> v501(VarCurr,bitIndex663) )
          & ( v594(VarNext,bitIndex47)
          <=> v501(VarCurr,bitIndex662) )
          & ( v594(VarNext,bitIndex46)
          <=> v501(VarCurr,bitIndex661) )
          & ( v594(VarNext,bitIndex45)
          <=> v501(VarCurr,bitIndex660) )
          & ( v594(VarNext,bitIndex44)
          <=> v501(VarCurr,bitIndex659) )
          & ( v594(VarNext,bitIndex43)
          <=> v501(VarCurr,bitIndex658) )
          & ( v594(VarNext,bitIndex42)
          <=> v501(VarCurr,bitIndex657) )
          & ( v594(VarNext,bitIndex41)
          <=> v501(VarCurr,bitIndex656) )
          & ( v594(VarNext,bitIndex40)
          <=> v501(VarCurr,bitIndex655) )
          & ( v594(VarNext,bitIndex39)
          <=> v501(VarCurr,bitIndex654) )
          & ( v594(VarNext,bitIndex38)
          <=> v501(VarCurr,bitIndex653) )
          & ( v594(VarNext,bitIndex37)
          <=> v501(VarCurr,bitIndex652) )
          & ( v594(VarNext,bitIndex36)
          <=> v501(VarCurr,bitIndex651) )
          & ( v594(VarNext,bitIndex35)
          <=> v501(VarCurr,bitIndex650) )
          & ( v594(VarNext,bitIndex34)
          <=> v501(VarCurr,bitIndex649) )
          & ( v594(VarNext,bitIndex33)
          <=> v501(VarCurr,bitIndex648) )
          & ( v594(VarNext,bitIndex32)
          <=> v501(VarCurr,bitIndex647) )
          & ( v594(VarNext,bitIndex31)
          <=> v501(VarCurr,bitIndex646) )
          & ( v594(VarNext,bitIndex30)
          <=> v501(VarCurr,bitIndex645) )
          & ( v594(VarNext,bitIndex29)
          <=> v501(VarCurr,bitIndex644) )
          & ( v594(VarNext,bitIndex28)
          <=> v501(VarCurr,bitIndex643) )
          & ( v594(VarNext,bitIndex27)
          <=> v501(VarCurr,bitIndex642) )
          & ( v594(VarNext,bitIndex26)
          <=> v501(VarCurr,bitIndex641) )
          & ( v594(VarNext,bitIndex25)
          <=> v501(VarCurr,bitIndex640) )
          & ( v594(VarNext,bitIndex24)
          <=> v501(VarCurr,bitIndex639) )
          & ( v594(VarNext,bitIndex23)
          <=> v501(VarCurr,bitIndex638) )
          & ( v594(VarNext,bitIndex22)
          <=> v501(VarCurr,bitIndex637) )
          & ( v594(VarNext,bitIndex21)
          <=> v501(VarCurr,bitIndex636) )
          & ( v594(VarNext,bitIndex20)
          <=> v501(VarCurr,bitIndex635) )
          & ( v594(VarNext,bitIndex19)
          <=> v501(VarCurr,bitIndex634) )
          & ( v594(VarNext,bitIndex18)
          <=> v501(VarCurr,bitIndex633) )
          & ( v594(VarNext,bitIndex17)
          <=> v501(VarCurr,bitIndex632) )
          & ( v594(VarNext,bitIndex16)
          <=> v501(VarCurr,bitIndex631) )
          & ( v594(VarNext,bitIndex15)
          <=> v501(VarCurr,bitIndex630) )
          & ( v594(VarNext,bitIndex14)
          <=> v501(VarCurr,bitIndex629) )
          & ( v594(VarNext,bitIndex13)
          <=> v501(VarCurr,bitIndex628) )
          & ( v594(VarNext,bitIndex12)
          <=> v501(VarCurr,bitIndex627) )
          & ( v594(VarNext,bitIndex11)
          <=> v501(VarCurr,bitIndex626) )
          & ( v594(VarNext,bitIndex10)
          <=> v501(VarCurr,bitIndex625) )
          & ( v594(VarNext,bitIndex9)
          <=> v501(VarCurr,bitIndex624) )
          & ( v594(VarNext,bitIndex8)
          <=> v501(VarCurr,bitIndex623) )
          & ( v594(VarNext,bitIndex7)
          <=> v501(VarCurr,bitIndex622) )
          & ( v594(VarNext,bitIndex6)
          <=> v501(VarCurr,bitIndex621) )
          & ( v594(VarNext,bitIndex5)
          <=> v501(VarCurr,bitIndex620) )
          & ( v594(VarNext,bitIndex4)
          <=> v501(VarCurr,bitIndex619) )
          & ( v594(VarNext,bitIndex3)
          <=> v501(VarCurr,bitIndex618) )
          & ( v594(VarNext,bitIndex2)
          <=> v501(VarCurr,bitIndex617) )
          & ( v594(VarNext,bitIndex1)
          <=> v501(VarCurr,bitIndex616) )
          & ( v594(VarNext,bitIndex0)
          <=> v501(VarCurr,bitIndex615) ) ) ) ) )).

fof(addCaseBooleanConditionEqualRanges0_4,axiom,(
    ! [VarNext] :
      ( v596(VarNext)
     => ! [B] :
          ( range_122_0(B)
         => ( v594(VarNext,B)
          <=> v581(VarNext,B) ) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_64,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( v596(VarNext)
      <=> ( v597(VarNext)
          & v562(VarNext) ) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_63,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( v597(VarNext)
      <=> ( v599(VarNext)
          & v467(VarNext) ) ) ) )).

fof(writeUnaryOperator_41,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( ~ v599(VarNext)
      <=> v474(VarNext) ) ) )).

fof(addAssignment_170,axiom,(
    ! [VarCurr] :
      ( v546(VarCurr,bitIndex81)
    <=> v551(VarCurr,bitIndex81) ) )).

fof(addAssignment_169,axiom,(
    ! [VarCurr] :
      ( v550(VarCurr,bitIndex81)
    <=> v501(VarCurr,bitIndex573) ) )).

fof(addAssignment_168,axiom,(
    ! [VarCurr] :
      ( v504(VarCurr,bitIndex81)
    <=> v544(VarCurr,bitIndex81) ) )).

fof(addAssignment_167,axiom,(
    ! [VarCurr] :
      ( v543(VarCurr,bitIndex81)
    <=> v501(VarCurr,bitIndex696) ) )).

fof(addAssignment_166,axiom,(
    ! [VarCurr] :
      ( v527(VarCurr,bitIndex81)
    <=> v529(VarCurr,bitIndex81) ) )).

fof(addAssignment_165,axiom,(
    ! [VarCurr] :
      ( v529(VarCurr,bitIndex81)
    <=> v531(VarCurr,bitIndex81) ) )).

fof(addAssignment_164,axiom,(
    ! [VarCurr] :
      ( v531(VarCurr,bitIndex81)
    <=> v533(VarCurr,bitIndex81) ) )).

fof(addAssignment_163,axiom,(
    ! [VarCurr] :
      ( v533(VarCurr,bitIndex81)
    <=> v535(VarCurr,bitIndex81) ) )).

fof(addAssignment_162,axiom,(
    ! [VarCurr] :
      ( v535(VarCurr,bitIndex81)
    <=> v537(VarCurr,bitIndex81) ) )).

fof(addAssignment_161,axiom,(
    ! [VarCurr] :
      ( v537(VarCurr,bitIndex81)
    <=> v539(VarCurr,bitIndex81) ) )).

fof(addAssignment_160,axiom,(
    ! [VarCurr] :
      ( v539(VarCurr,bitIndex81)
    <=> v541(VarCurr,bitIndex81) ) )).

fof(addAssignment_159,axiom,(
    ! [VarCurr] :
      ( ( v495(VarCurr,bitIndex6)
      <=> v497(VarCurr,bitIndex122) )
      & ( v495(VarCurr,bitIndex5)
      <=> v497(VarCurr,bitIndex121) )
      & ( v495(VarCurr,bitIndex4)
      <=> v497(VarCurr,bitIndex120) )
      & ( v495(VarCurr,bitIndex3)
      <=> v497(VarCurr,bitIndex119) )
      & ( v495(VarCurr,bitIndex2)
      <=> v497(VarCurr,bitIndex118) )
      & ( v495(VarCurr,bitIndex1)
      <=> v497(VarCurr,bitIndex117) )
      & ( v495(VarCurr,bitIndex0)
      <=> v497(VarCurr,bitIndex116) ) ) )).

fof(addAssignment_158,axiom,(
    ! [VarCurr,B] :
      ( range_122_116(B)
     => ( v497(VarCurr,B)
      <=> v499(VarCurr,B) ) ) )).

fof(addAssignment_157,axiom,(
    ! [VarCurr] :
      ( ( v499(VarCurr,bitIndex122)
      <=> v501(VarCurr,bitIndex737) )
      & ( v499(VarCurr,bitIndex121)
      <=> v501(VarCurr,bitIndex736) )
      & ( v499(VarCurr,bitIndex120)
      <=> v501(VarCurr,bitIndex735) )
      & ( v499(VarCurr,bitIndex119)
      <=> v501(VarCurr,bitIndex734) )
      & ( v499(VarCurr,bitIndex118)
      <=> v501(VarCurr,bitIndex733) )
      & ( v499(VarCurr,bitIndex117)
      <=> v501(VarCurr,bitIndex732) )
      & ( v499(VarCurr,bitIndex116)
      <=> v501(VarCurr,bitIndex731) ) ) )).

fof(addAssignment_156,axiom,(
    ! [VarNext] :
      ( ( v501(VarNext,bitIndex737)
      <=> v553(VarNext,bitIndex122) )
      & ( v501(VarNext,bitIndex736)
      <=> v553(VarNext,bitIndex121) )
      & ( v501(VarNext,bitIndex735)
      <=> v553(VarNext,bitIndex120) )
      & ( v501(VarNext,bitIndex734)
      <=> v553(VarNext,bitIndex119) )
      & ( v501(VarNext,bitIndex733)
      <=> v553(VarNext,bitIndex118) )
      & ( v501(VarNext,bitIndex732)
      <=> v553(VarNext,bitIndex117) )
      & ( v501(VarNext,bitIndex731)
      <=> v553(VarNext,bitIndex116) ) ) )).

fof(addCaseBooleanConditionShiftedRanges1,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( ~ v554(VarNext)
       => ( ( v553(VarNext,bitIndex122)
          <=> v501(VarCurr,bitIndex737) )
          & ( v553(VarNext,bitIndex121)
          <=> v501(VarCurr,bitIndex736) )
          & ( v553(VarNext,bitIndex120)
          <=> v501(VarCurr,bitIndex735) )
          & ( v553(VarNext,bitIndex119)
          <=> v501(VarCurr,bitIndex734) )
          & ( v553(VarNext,bitIndex118)
          <=> v501(VarCurr,bitIndex733) )
          & ( v553(VarNext,bitIndex117)
          <=> v501(VarCurr,bitIndex732) )
          & ( v553(VarNext,bitIndex116)
          <=> v501(VarCurr,bitIndex731) )
          & ( v553(VarNext,bitIndex115)
          <=> v501(VarCurr,bitIndex730) )
          & ( v553(VarNext,bitIndex114)
          <=> v501(VarCurr,bitIndex729) )
          & ( v553(VarNext,bitIndex113)
          <=> v501(VarCurr,bitIndex728) )
          & ( v553(VarNext,bitIndex112)
          <=> v501(VarCurr,bitIndex727) )
          & ( v553(VarNext,bitIndex111)
          <=> v501(VarCurr,bitIndex726) )
          & ( v553(VarNext,bitIndex110)
          <=> v501(VarCurr,bitIndex725) )
          & ( v553(VarNext,bitIndex109)
          <=> v501(VarCurr,bitIndex724) )
          & ( v553(VarNext,bitIndex108)
          <=> v501(VarCurr,bitIndex723) )
          & ( v553(VarNext,bitIndex107)
          <=> v501(VarCurr,bitIndex722) )
          & ( v553(VarNext,bitIndex106)
          <=> v501(VarCurr,bitIndex721) )
          & ( v553(VarNext,bitIndex105)
          <=> v501(VarCurr,bitIndex720) )
          & ( v553(VarNext,bitIndex104)
          <=> v501(VarCurr,bitIndex719) )
          & ( v553(VarNext,bitIndex103)
          <=> v501(VarCurr,bitIndex718) )
          & ( v553(VarNext,bitIndex102)
          <=> v501(VarCurr,bitIndex717) )
          & ( v553(VarNext,bitIndex101)
          <=> v501(VarCurr,bitIndex716) )
          & ( v553(VarNext,bitIndex100)
          <=> v501(VarCurr,bitIndex715) )
          & ( v553(VarNext,bitIndex99)
          <=> v501(VarCurr,bitIndex714) )
          & ( v553(VarNext,bitIndex98)
          <=> v501(VarCurr,bitIndex713) )
          & ( v553(VarNext,bitIndex97)
          <=> v501(VarCurr,bitIndex712) )
          & ( v553(VarNext,bitIndex96)
          <=> v501(VarCurr,bitIndex711) )
          & ( v553(VarNext,bitIndex95)
          <=> v501(VarCurr,bitIndex710) )
          & ( v553(VarNext,bitIndex94)
          <=> v501(VarCurr,bitIndex709) )
          & ( v553(VarNext,bitIndex93)
          <=> v501(VarCurr,bitIndex708) )
          & ( v553(VarNext,bitIndex92)
          <=> v501(VarCurr,bitIndex707) )
          & ( v553(VarNext,bitIndex91)
          <=> v501(VarCurr,bitIndex706) )
          & ( v553(VarNext,bitIndex90)
          <=> v501(VarCurr,bitIndex705) )
          & ( v553(VarNext,bitIndex89)
          <=> v501(VarCurr,bitIndex704) )
          & ( v553(VarNext,bitIndex88)
          <=> v501(VarCurr,bitIndex703) )
          & ( v553(VarNext,bitIndex87)
          <=> v501(VarCurr,bitIndex702) )
          & ( v553(VarNext,bitIndex86)
          <=> v501(VarCurr,bitIndex701) )
          & ( v553(VarNext,bitIndex85)
          <=> v501(VarCurr,bitIndex700) )
          & ( v553(VarNext,bitIndex84)
          <=> v501(VarCurr,bitIndex699) )
          & ( v553(VarNext,bitIndex83)
          <=> v501(VarCurr,bitIndex698) )
          & ( v553(VarNext,bitIndex82)
          <=> v501(VarCurr,bitIndex697) )
          & ( v553(VarNext,bitIndex81)
          <=> v501(VarCurr,bitIndex696) )
          & ( v553(VarNext,bitIndex80)
          <=> v501(VarCurr,bitIndex695) )
          & ( v553(VarNext,bitIndex79)
          <=> v501(VarCurr,bitIndex694) )
          & ( v553(VarNext,bitIndex78)
          <=> v501(VarCurr,bitIndex693) )
          & ( v553(VarNext,bitIndex77)
          <=> v501(VarCurr,bitIndex692) )
          & ( v553(VarNext,bitIndex76)
          <=> v501(VarCurr,bitIndex691) )
          & ( v553(VarNext,bitIndex75)
          <=> v501(VarCurr,bitIndex690) )
          & ( v553(VarNext,bitIndex74)
          <=> v501(VarCurr,bitIndex689) )
          & ( v553(VarNext,bitIndex73)
          <=> v501(VarCurr,bitIndex688) )
          & ( v553(VarNext,bitIndex72)
          <=> v501(VarCurr,bitIndex687) )
          & ( v553(VarNext,bitIndex71)
          <=> v501(VarCurr,bitIndex686) )
          & ( v553(VarNext,bitIndex70)
          <=> v501(VarCurr,bitIndex685) )
          & ( v553(VarNext,bitIndex69)
          <=> v501(VarCurr,bitIndex684) )
          & ( v553(VarNext,bitIndex68)
          <=> v501(VarCurr,bitIndex683) )
          & ( v553(VarNext,bitIndex67)
          <=> v501(VarCurr,bitIndex682) )
          & ( v553(VarNext,bitIndex66)
          <=> v501(VarCurr,bitIndex681) )
          & ( v553(VarNext,bitIndex65)
          <=> v501(VarCurr,bitIndex680) )
          & ( v553(VarNext,bitIndex64)
          <=> v501(VarCurr,bitIndex679) )
          & ( v553(VarNext,bitIndex63)
          <=> v501(VarCurr,bitIndex678) )
          & ( v553(VarNext,bitIndex62)
          <=> v501(VarCurr,bitIndex677) )
          & ( v553(VarNext,bitIndex61)
          <=> v501(VarCurr,bitIndex676) )
          & ( v553(VarNext,bitIndex60)
          <=> v501(VarCurr,bitIndex675) )
          & ( v553(VarNext,bitIndex59)
          <=> v501(VarCurr,bitIndex674) )
          & ( v553(VarNext,bitIndex58)
          <=> v501(VarCurr,bitIndex673) )
          & ( v553(VarNext,bitIndex57)
          <=> v501(VarCurr,bitIndex672) )
          & ( v553(VarNext,bitIndex56)
          <=> v501(VarCurr,bitIndex671) )
          & ( v553(VarNext,bitIndex55)
          <=> v501(VarCurr,bitIndex670) )
          & ( v553(VarNext,bitIndex54)
          <=> v501(VarCurr,bitIndex669) )
          & ( v553(VarNext,bitIndex53)
          <=> v501(VarCurr,bitIndex668) )
          & ( v553(VarNext,bitIndex52)
          <=> v501(VarCurr,bitIndex667) )
          & ( v553(VarNext,bitIndex51)
          <=> v501(VarCurr,bitIndex666) )
          & ( v553(VarNext,bitIndex50)
          <=> v501(VarCurr,bitIndex665) )
          & ( v553(VarNext,bitIndex49)
          <=> v501(VarCurr,bitIndex664) )
          & ( v553(VarNext,bitIndex48)
          <=> v501(VarCurr,bitIndex663) )
          & ( v553(VarNext,bitIndex47)
          <=> v501(VarCurr,bitIndex662) )
          & ( v553(VarNext,bitIndex46)
          <=> v501(VarCurr,bitIndex661) )
          & ( v553(VarNext,bitIndex45)
          <=> v501(VarCurr,bitIndex660) )
          & ( v553(VarNext,bitIndex44)
          <=> v501(VarCurr,bitIndex659) )
          & ( v553(VarNext,bitIndex43)
          <=> v501(VarCurr,bitIndex658) )
          & ( v553(VarNext,bitIndex42)
          <=> v501(VarCurr,bitIndex657) )
          & ( v553(VarNext,bitIndex41)
          <=> v501(VarCurr,bitIndex656) )
          & ( v553(VarNext,bitIndex40)
          <=> v501(VarCurr,bitIndex655) )
          & ( v553(VarNext,bitIndex39)
          <=> v501(VarCurr,bitIndex654) )
          & ( v553(VarNext,bitIndex38)
          <=> v501(VarCurr,bitIndex653) )
          & ( v553(VarNext,bitIndex37)
          <=> v501(VarCurr,bitIndex652) )
          & ( v553(VarNext,bitIndex36)
          <=> v501(VarCurr,bitIndex651) )
          & ( v553(VarNext,bitIndex35)
          <=> v501(VarCurr,bitIndex650) )
          & ( v553(VarNext,bitIndex34)
          <=> v501(VarCurr,bitIndex649) )
          & ( v553(VarNext,bitIndex33)
          <=> v501(VarCurr,bitIndex648) )
          & ( v553(VarNext,bitIndex32)
          <=> v501(VarCurr,bitIndex647) )
          & ( v553(VarNext,bitIndex31)
          <=> v501(VarCurr,bitIndex646) )
          & ( v553(VarNext,bitIndex30)
          <=> v501(VarCurr,bitIndex645) )
          & ( v553(VarNext,bitIndex29)
          <=> v501(VarCurr,bitIndex644) )
          & ( v553(VarNext,bitIndex28)
          <=> v501(VarCurr,bitIndex643) )
          & ( v553(VarNext,bitIndex27)
          <=> v501(VarCurr,bitIndex642) )
          & ( v553(VarNext,bitIndex26)
          <=> v501(VarCurr,bitIndex641) )
          & ( v553(VarNext,bitIndex25)
          <=> v501(VarCurr,bitIndex640) )
          & ( v553(VarNext,bitIndex24)
          <=> v501(VarCurr,bitIndex639) )
          & ( v553(VarNext,bitIndex23)
          <=> v501(VarCurr,bitIndex638) )
          & ( v553(VarNext,bitIndex22)
          <=> v501(VarCurr,bitIndex637) )
          & ( v553(VarNext,bitIndex21)
          <=> v501(VarCurr,bitIndex636) )
          & ( v553(VarNext,bitIndex20)
          <=> v501(VarCurr,bitIndex635) )
          & ( v553(VarNext,bitIndex19)
          <=> v501(VarCurr,bitIndex634) )
          & ( v553(VarNext,bitIndex18)
          <=> v501(VarCurr,bitIndex633) )
          & ( v553(VarNext,bitIndex17)
          <=> v501(VarCurr,bitIndex632) )
          & ( v553(VarNext,bitIndex16)
          <=> v501(VarCurr,bitIndex631) )
          & ( v553(VarNext,bitIndex15)
          <=> v501(VarCurr,bitIndex630) )
          & ( v553(VarNext,bitIndex14)
          <=> v501(VarCurr,bitIndex629) )
          & ( v553(VarNext,bitIndex13)
          <=> v501(VarCurr,bitIndex628) )
          & ( v553(VarNext,bitIndex12)
          <=> v501(VarCurr,bitIndex627) )
          & ( v553(VarNext,bitIndex11)
          <=> v501(VarCurr,bitIndex626) )
          & ( v553(VarNext,bitIndex10)
          <=> v501(VarCurr,bitIndex625) )
          & ( v553(VarNext,bitIndex9)
          <=> v501(VarCurr,bitIndex624) )
          & ( v553(VarNext,bitIndex8)
          <=> v501(VarCurr,bitIndex623) )
          & ( v553(VarNext,bitIndex7)
          <=> v501(VarCurr,bitIndex622) )
          & ( v553(VarNext,bitIndex6)
          <=> v501(VarCurr,bitIndex621) )
          & ( v553(VarNext,bitIndex5)
          <=> v501(VarCurr,bitIndex620) )
          & ( v553(VarNext,bitIndex4)
          <=> v501(VarCurr,bitIndex619) )
          & ( v553(VarNext,bitIndex3)
          <=> v501(VarCurr,bitIndex618) )
          & ( v553(VarNext,bitIndex2)
          <=> v501(VarCurr,bitIndex617) )
          & ( v553(VarNext,bitIndex1)
          <=> v501(VarCurr,bitIndex616) )
          & ( v553(VarNext,bitIndex0)
          <=> v501(VarCurr,bitIndex615) ) ) ) ) )).

fof(addCaseBooleanConditionEqualRanges0_3,axiom,(
    ! [VarNext] :
      ( v554(VarNext)
     => ! [B] :
          ( range_122_0(B)
         => ( v553(VarNext,B)
          <=> v581(VarNext,B) ) ) ) )).

fof(addAssignment_155,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ! [B] :
          ( range_122_0(B)
         => ( v581(VarNext,B)
          <=> v579(VarCurr,B) ) ) ) )).

fof(addParallelCaseBooleanConditionEqualRanges1_9,axiom,(
    ! [VarCurr] :
      ( ~ v564(VarCurr)
     => ! [B] :
          ( range_122_0(B)
         => ( v579(VarCurr,B)
          <=> v582(VarCurr,B) ) ) ) )).

fof(addParallelCaseBooleanConditionEqualRanges0_8,axiom,(
    ! [VarCurr] :
      ( v564(VarCurr)
     => ! [B] :
          ( range_122_0(B)
         => ( v579(VarCurr,B)
          <=> $false ) ) ) )).

fof(bitBlastConstant_182,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex122) )).

fof(bitBlastConstant_181,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex121) )).

fof(bitBlastConstant_180,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex120) )).

fof(bitBlastConstant_179,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex119) )).

fof(bitBlastConstant_178,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex118) )).

fof(bitBlastConstant_177,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex117) )).

fof(bitBlastConstant_176,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex116) )).

fof(bitBlastConstant_175,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex115) )).

fof(bitBlastConstant_174,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex114) )).

fof(bitBlastConstant_173,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex113) )).

fof(bitBlastConstant_172,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex112) )).

fof(bitBlastConstant_171,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex111) )).

fof(bitBlastConstant_170,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex110) )).

fof(bitBlastConstant_169,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex109) )).

fof(bitBlastConstant_168,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex108) )).

fof(bitBlastConstant_167,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex107) )).

fof(bitBlastConstant_166,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex106) )).

fof(bitBlastConstant_165,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex105) )).

fof(bitBlastConstant_164,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex104) )).

fof(bitBlastConstant_163,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex103) )).

fof(bitBlastConstant_162,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex102) )).

fof(bitBlastConstant_161,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex101) )).

fof(bitBlastConstant_160,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex100) )).

fof(bitBlastConstant_159,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex99) )).

fof(bitBlastConstant_158,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex98) )).

fof(bitBlastConstant_157,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex97) )).

fof(bitBlastConstant_156,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex96) )).

fof(bitBlastConstant_155,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex95) )).

fof(bitBlastConstant_154,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex94) )).

fof(bitBlastConstant_153,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex93) )).

fof(bitBlastConstant_152,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex92) )).

fof(bitBlastConstant_151,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex91) )).

fof(bitBlastConstant_150,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex90) )).

fof(bitBlastConstant_149,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex89) )).

fof(bitBlastConstant_148,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex88) )).

fof(bitBlastConstant_147,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex87) )).

fof(bitBlastConstant_146,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex86) )).

fof(bitBlastConstant_145,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex85) )).

fof(bitBlastConstant_144,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex84) )).

fof(bitBlastConstant_143,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex83) )).

fof(bitBlastConstant_142,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex82) )).

fof(bitBlastConstant_141,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex81) )).

fof(bitBlastConstant_140,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex80) )).

fof(bitBlastConstant_139,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex79) )).

fof(bitBlastConstant_138,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex78) )).

fof(bitBlastConstant_137,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex77) )).

fof(bitBlastConstant_136,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex76) )).

fof(bitBlastConstant_135,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex75) )).

fof(bitBlastConstant_134,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex74) )).

fof(bitBlastConstant_133,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex73) )).

fof(bitBlastConstant_132,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex72) )).

fof(bitBlastConstant_131,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex71) )).

fof(bitBlastConstant_130,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex70) )).

fof(bitBlastConstant_129,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex69) )).

fof(bitBlastConstant_128,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex68) )).

fof(bitBlastConstant_127,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex67) )).

fof(bitBlastConstant_126,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex66) )).

fof(bitBlastConstant_125,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex65) )).

fof(bitBlastConstant_124,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex64) )).

fof(bitBlastConstant_123,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex63) )).

fof(bitBlastConstant_122,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex62) )).

fof(bitBlastConstant_121,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex61) )).

fof(bitBlastConstant_120,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex60) )).

fof(bitBlastConstant_119,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex59) )).

fof(bitBlastConstant_118,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex58) )).

fof(bitBlastConstant_117,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex57) )).

fof(bitBlastConstant_116,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex56) )).

fof(bitBlastConstant_115,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex55) )).

fof(bitBlastConstant_114,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex54) )).

fof(bitBlastConstant_113,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex53) )).

fof(bitBlastConstant_112,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex52) )).

fof(bitBlastConstant_111,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex51) )).

fof(bitBlastConstant_110,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex50) )).

fof(bitBlastConstant_109,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex49) )).

fof(bitBlastConstant_108,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex48) )).

fof(bitBlastConstant_107,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex47) )).

fof(bitBlastConstant_106,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex46) )).

fof(bitBlastConstant_105,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex45) )).

fof(bitBlastConstant_104,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex44) )).

fof(bitBlastConstant_103,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex43) )).

fof(bitBlastConstant_102,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex42) )).

fof(bitBlastConstant_101,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex41) )).

fof(bitBlastConstant_100,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex40) )).

fof(bitBlastConstant_99,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex39) )).

fof(bitBlastConstant_98,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex38) )).

fof(bitBlastConstant_97,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex37) )).

fof(bitBlastConstant_96,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex36) )).

fof(bitBlastConstant_95,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex35) )).

fof(bitBlastConstant_94,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex34) )).

fof(bitBlastConstant_93,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex33) )).

fof(bitBlastConstant_92,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex32) )).

fof(bitBlastConstant_91,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex31) )).

fof(bitBlastConstant_90,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex30) )).

fof(bitBlastConstant_89,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex29) )).

fof(bitBlastConstant_88,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex28) )).

fof(bitBlastConstant_87,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex27) )).

fof(bitBlastConstant_86,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex26) )).

fof(bitBlastConstant_85,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex25) )).

fof(bitBlastConstant_84,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex24) )).

fof(bitBlastConstant_83,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex23) )).

fof(bitBlastConstant_82,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex22) )).

fof(bitBlastConstant_81,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex21) )).

fof(bitBlastConstant_80,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex20) )).

fof(bitBlastConstant_79,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex19) )).

fof(bitBlastConstant_78,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex18) )).

fof(bitBlastConstant_77,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex17) )).

fof(bitBlastConstant_76,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex16) )).

fof(bitBlastConstant_75,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex15) )).

fof(bitBlastConstant_74,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex14) )).

fof(bitBlastConstant_73,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex13) )).

fof(bitBlastConstant_72,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex12) )).

fof(bitBlastConstant_71,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex11) )).

fof(bitBlastConstant_70,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex10) )).

fof(bitBlastConstant_69,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex9) )).

fof(bitBlastConstant_68,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex8) )).

fof(bitBlastConstant_67,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex7) )).

fof(bitBlastConstant_66,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex6) )).

fof(bitBlastConstant_65,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex5) )).

fof(bitBlastConstant_64,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex4) )).

fof(bitBlastConstant_63,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex3) )).

fof(bitBlastConstant_62,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex2) )).

fof(bitBlastConstant_61,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex1) )).

fof(bitBlastConstant_60,axiom,(
    ~ b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000(bitIndex0) )).

fof(addParallelCaseBooleanConditionEqualRanges2_4,axiom,(
    ! [VarCurr] :
      ( ( ~ v568(VarCurr)
        & ~ v570(VarCurr) )
     => ! [B] :
          ( range_122_0(B)
         => ( v582(VarCurr,B)
          <=> v546(VarCurr,B) ) ) ) )).

fof(addParallelCaseBooleanConditionEqualRanges1_8,axiom,(
    ! [VarCurr] :
      ( v570(VarCurr)
     => ! [B] :
          ( range_122_0(B)
         => ( v582(VarCurr,B)
          <=> v504(VarCurr,B) ) ) ) )).

fof(addParallelCaseBooleanConditionShiftedRanges0,axiom,(
    ! [VarCurr] :
      ( v568(VarCurr)
     => ( ( v582(VarCurr,bitIndex122)
        <=> v501(VarCurr,bitIndex614) )
        & ( v582(VarCurr,bitIndex121)
        <=> v501(VarCurr,bitIndex613) )
        & ( v582(VarCurr,bitIndex120)
        <=> v501(VarCurr,bitIndex612) )
        & ( v582(VarCurr,bitIndex119)
        <=> v501(VarCurr,bitIndex611) )
        & ( v582(VarCurr,bitIndex118)
        <=> v501(VarCurr,bitIndex610) )
        & ( v582(VarCurr,bitIndex117)
        <=> v501(VarCurr,bitIndex609) )
        & ( v582(VarCurr,bitIndex116)
        <=> v501(VarCurr,bitIndex608) )
        & ( v582(VarCurr,bitIndex115)
        <=> v501(VarCurr,bitIndex607) )
        & ( v582(VarCurr,bitIndex114)
        <=> v501(VarCurr,bitIndex606) )
        & ( v582(VarCurr,bitIndex113)
        <=> v501(VarCurr,bitIndex605) )
        & ( v582(VarCurr,bitIndex112)
        <=> v501(VarCurr,bitIndex604) )
        & ( v582(VarCurr,bitIndex111)
        <=> v501(VarCurr,bitIndex603) )
        & ( v582(VarCurr,bitIndex110)
        <=> v501(VarCurr,bitIndex602) )
        & ( v582(VarCurr,bitIndex109)
        <=> v501(VarCurr,bitIndex601) )
        & ( v582(VarCurr,bitIndex108)
        <=> v501(VarCurr,bitIndex600) )
        & ( v582(VarCurr,bitIndex107)
        <=> v501(VarCurr,bitIndex599) )
        & ( v582(VarCurr,bitIndex106)
        <=> v501(VarCurr,bitIndex598) )
        & ( v582(VarCurr,bitIndex105)
        <=> v501(VarCurr,bitIndex597) )
        & ( v582(VarCurr,bitIndex104)
        <=> v501(VarCurr,bitIndex596) )
        & ( v582(VarCurr,bitIndex103)
        <=> v501(VarCurr,bitIndex595) )
        & ( v582(VarCurr,bitIndex102)
        <=> v501(VarCurr,bitIndex594) )
        & ( v582(VarCurr,bitIndex101)
        <=> v501(VarCurr,bitIndex593) )
        & ( v582(VarCurr,bitIndex100)
        <=> v501(VarCurr,bitIndex592) )
        & ( v582(VarCurr,bitIndex99)
        <=> v501(VarCurr,bitIndex591) )
        & ( v582(VarCurr,bitIndex98)
        <=> v501(VarCurr,bitIndex590) )
        & ( v582(VarCurr,bitIndex97)
        <=> v501(VarCurr,bitIndex589) )
        & ( v582(VarCurr,bitIndex96)
        <=> v501(VarCurr,bitIndex588) )
        & ( v582(VarCurr,bitIndex95)
        <=> v501(VarCurr,bitIndex587) )
        & ( v582(VarCurr,bitIndex94)
        <=> v501(VarCurr,bitIndex586) )
        & ( v582(VarCurr,bitIndex93)
        <=> v501(VarCurr,bitIndex585) )
        & ( v582(VarCurr,bitIndex92)
        <=> v501(VarCurr,bitIndex584) )
        & ( v582(VarCurr,bitIndex91)
        <=> v501(VarCurr,bitIndex583) )
        & ( v582(VarCurr,bitIndex90)
        <=> v501(VarCurr,bitIndex582) )
        & ( v582(VarCurr,bitIndex89)
        <=> v501(VarCurr,bitIndex581) )
        & ( v582(VarCurr,bitIndex88)
        <=> v501(VarCurr,bitIndex580) )
        & ( v582(VarCurr,bitIndex87)
        <=> v501(VarCurr,bitIndex579) )
        & ( v582(VarCurr,bitIndex86)
        <=> v501(VarCurr,bitIndex578) )
        & ( v582(VarCurr,bitIndex85)
        <=> v501(VarCurr,bitIndex577) )
        & ( v582(VarCurr,bitIndex84)
        <=> v501(VarCurr,bitIndex576) )
        & ( v582(VarCurr,bitIndex83)
        <=> v501(VarCurr,bitIndex575) )
        & ( v582(VarCurr,bitIndex82)
        <=> v501(VarCurr,bitIndex574) )
        & ( v582(VarCurr,bitIndex81)
        <=> v501(VarCurr,bitIndex573) )
        & ( v582(VarCurr,bitIndex80)
        <=> v501(VarCurr,bitIndex572) )
        & ( v582(VarCurr,bitIndex79)
        <=> v501(VarCurr,bitIndex571) )
        & ( v582(VarCurr,bitIndex78)
        <=> v501(VarCurr,bitIndex570) )
        & ( v582(VarCurr,bitIndex77)
        <=> v501(VarCurr,bitIndex569) )
        & ( v582(VarCurr,bitIndex76)
        <=> v501(VarCurr,bitIndex568) )
        & ( v582(VarCurr,bitIndex75)
        <=> v501(VarCurr,bitIndex567) )
        & ( v582(VarCurr,bitIndex74)
        <=> v501(VarCurr,bitIndex566) )
        & ( v582(VarCurr,bitIndex73)
        <=> v501(VarCurr,bitIndex565) )
        & ( v582(VarCurr,bitIndex72)
        <=> v501(VarCurr,bitIndex564) )
        & ( v582(VarCurr,bitIndex71)
        <=> v501(VarCurr,bitIndex563) )
        & ( v582(VarCurr,bitIndex70)
        <=> v501(VarCurr,bitIndex562) )
        & ( v582(VarCurr,bitIndex69)
        <=> v501(VarCurr,bitIndex561) )
        & ( v582(VarCurr,bitIndex68)
        <=> v501(VarCurr,bitIndex560) )
        & ( v582(VarCurr,bitIndex67)
        <=> v501(VarCurr,bitIndex559) )
        & ( v582(VarCurr,bitIndex66)
        <=> v501(VarCurr,bitIndex558) )
        & ( v582(VarCurr,bitIndex65)
        <=> v501(VarCurr,bitIndex557) )
        & ( v582(VarCurr,bitIndex64)
        <=> v501(VarCurr,bitIndex556) )
        & ( v582(VarCurr,bitIndex63)
        <=> v501(VarCurr,bitIndex555) )
        & ( v582(VarCurr,bitIndex62)
        <=> v501(VarCurr,bitIndex554) )
        & ( v582(VarCurr,bitIndex61)
        <=> v501(VarCurr,bitIndex553) )
        & ( v582(VarCurr,bitIndex60)
        <=> v501(VarCurr,bitIndex552) )
        & ( v582(VarCurr,bitIndex59)
        <=> v501(VarCurr,bitIndex551) )
        & ( v582(VarCurr,bitIndex58)
        <=> v501(VarCurr,bitIndex550) )
        & ( v582(VarCurr,bitIndex57)
        <=> v501(VarCurr,bitIndex549) )
        & ( v582(VarCurr,bitIndex56)
        <=> v501(VarCurr,bitIndex548) )
        & ( v582(VarCurr,bitIndex55)
        <=> v501(VarCurr,bitIndex547) )
        & ( v582(VarCurr,bitIndex54)
        <=> v501(VarCurr,bitIndex546) )
        & ( v582(VarCurr,bitIndex53)
        <=> v501(VarCurr,bitIndex545) )
        & ( v582(VarCurr,bitIndex52)
        <=> v501(VarCurr,bitIndex544) )
        & ( v582(VarCurr,bitIndex51)
        <=> v501(VarCurr,bitIndex543) )
        & ( v582(VarCurr,bitIndex50)
        <=> v501(VarCurr,bitIndex542) )
        & ( v582(VarCurr,bitIndex49)
        <=> v501(VarCurr,bitIndex541) )
        & ( v582(VarCurr,bitIndex48)
        <=> v501(VarCurr,bitIndex540) )
        & ( v582(VarCurr,bitIndex47)
        <=> v501(VarCurr,bitIndex539) )
        & ( v582(VarCurr,bitIndex46)
        <=> v501(VarCurr,bitIndex538) )
        & ( v582(VarCurr,bitIndex45)
        <=> v501(VarCurr,bitIndex537) )
        & ( v582(VarCurr,bitIndex44)
        <=> v501(VarCurr,bitIndex536) )
        & ( v582(VarCurr,bitIndex43)
        <=> v501(VarCurr,bitIndex535) )
        & ( v582(VarCurr,bitIndex42)
        <=> v501(VarCurr,bitIndex534) )
        & ( v582(VarCurr,bitIndex41)
        <=> v501(VarCurr,bitIndex533) )
        & ( v582(VarCurr,bitIndex40)
        <=> v501(VarCurr,bitIndex532) )
        & ( v582(VarCurr,bitIndex39)
        <=> v501(VarCurr,bitIndex531) )
        & ( v582(VarCurr,bitIndex38)
        <=> v501(VarCurr,bitIndex530) )
        & ( v582(VarCurr,bitIndex37)
        <=> v501(VarCurr,bitIndex529) )
        & ( v582(VarCurr,bitIndex36)
        <=> v501(VarCurr,bitIndex528) )
        & ( v582(VarCurr,bitIndex35)
        <=> v501(VarCurr,bitIndex527) )
        & ( v582(VarCurr,bitIndex34)
        <=> v501(VarCurr,bitIndex526) )
        & ( v582(VarCurr,bitIndex33)
        <=> v501(VarCurr,bitIndex525) )
        & ( v582(VarCurr,bitIndex32)
        <=> v501(VarCurr,bitIndex524) )
        & ( v582(VarCurr,bitIndex31)
        <=> v501(VarCurr,bitIndex523) )
        & ( v582(VarCurr,bitIndex30)
        <=> v501(VarCurr,bitIndex522) )
        & ( v582(VarCurr,bitIndex29)
        <=> v501(VarCurr,bitIndex521) )
        & ( v582(VarCurr,bitIndex28)
        <=> v501(VarCurr,bitIndex520) )
        & ( v582(VarCurr,bitIndex27)
        <=> v501(VarCurr,bitIndex519) )
        & ( v582(VarCurr,bitIndex26)
        <=> v501(VarCurr,bitIndex518) )
        & ( v582(VarCurr,bitIndex25)
        <=> v501(VarCurr,bitIndex517) )
        & ( v582(VarCurr,bitIndex24)
        <=> v501(VarCurr,bitIndex516) )
        & ( v582(VarCurr,bitIndex23)
        <=> v501(VarCurr,bitIndex515) )
        & ( v582(VarCurr,bitIndex22)
        <=> v501(VarCurr,bitIndex514) )
        & ( v582(VarCurr,bitIndex21)
        <=> v501(VarCurr,bitIndex513) )
        & ( v582(VarCurr,bitIndex20)
        <=> v501(VarCurr,bitIndex512) )
        & ( v582(VarCurr,bitIndex19)
        <=> v501(VarCurr,bitIndex511) )
        & ( v582(VarCurr,bitIndex18)
        <=> v501(VarCurr,bitIndex510) )
        & ( v582(VarCurr,bitIndex17)
        <=> v501(VarCurr,bitIndex509) )
        & ( v582(VarCurr,bitIndex16)
        <=> v501(VarCurr,bitIndex508) )
        & ( v582(VarCurr,bitIndex15)
        <=> v501(VarCurr,bitIndex507) )
        & ( v582(VarCurr,bitIndex14)
        <=> v501(VarCurr,bitIndex506) )
        & ( v582(VarCurr,bitIndex13)
        <=> v501(VarCurr,bitIndex505) )
        & ( v582(VarCurr,bitIndex12)
        <=> v501(VarCurr,bitIndex504) )
        & ( v582(VarCurr,bitIndex11)
        <=> v501(VarCurr,bitIndex503) )
        & ( v582(VarCurr,bitIndex10)
        <=> v501(VarCurr,bitIndex502) )
        & ( v582(VarCurr,bitIndex9)
        <=> v501(VarCurr,bitIndex501) )
        & ( v582(VarCurr,bitIndex8)
        <=> v501(VarCurr,bitIndex500) )
        & ( v582(VarCurr,bitIndex7)
        <=> v501(VarCurr,bitIndex499) )
        & ( v582(VarCurr,bitIndex6)
        <=> v501(VarCurr,bitIndex498) )
        & ( v582(VarCurr,bitIndex5)
        <=> v501(VarCurr,bitIndex497) )
        & ( v582(VarCurr,bitIndex4)
        <=> v501(VarCurr,bitIndex496) )
        & ( v582(VarCurr,bitIndex3)
        <=> v501(VarCurr,bitIndex495) )
        & ( v582(VarCurr,bitIndex2)
        <=> v501(VarCurr,bitIndex494) )
        & ( v582(VarCurr,bitIndex1)
        <=> v501(VarCurr,bitIndex493) )
        & ( v582(VarCurr,bitIndex0)
        <=> v501(VarCurr,bitIndex492) ) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_62,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( v554(VarNext)
      <=> ( v555(VarNext)
          & v562(VarNext) ) ) ) )).

fof(addAssignment_154,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( v562(VarNext)
      <=> v560(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_61,axiom,(
    ! [VarCurr] :
      ( v560(VarCurr)
    <=> ( v563(VarCurr)
        & v575(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_60,axiom,(
    ! [VarCurr] :
      ( v575(VarCurr)
    <=> ( v576(VarCurr)
        | v564(VarCurr) ) ) )).

fof(writeUnaryOperator_40,axiom,(
    ! [VarCurr] :
      ( ~ v576(VarCurr)
    <=> v577(VarCurr) ) )).

fof(addBitVectorEqualityBitBlasted_30,axiom,(
    ! [VarCurr] :
      ( v577(VarCurr)
    <=> ( ( v578(VarCurr,bitIndex1)
        <=> $false )
        & ( v578(VarCurr,bitIndex0)
        <=> $false ) ) ) )).

fof(addAssignment_153,axiom,(
    ! [VarCurr] :
      ( v578(VarCurr,bitIndex0)
    <=> v123(VarCurr) ) )).

fof(addAssignment_152,axiom,(
    ! [VarCurr] :
      ( v578(VarCurr,bitIndex1)
    <=> v105(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_59,axiom,(
    ! [VarCurr] :
      ( v563(VarCurr)
    <=> ( v564(VarCurr)
        | v565(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_58,axiom,(
    ! [VarCurr] :
      ( v565(VarCurr)
    <=> ( v566(VarCurr)
        & v574(VarCurr) ) ) )).

fof(writeUnaryOperator_39,axiom,(
    ! [VarCurr] :
      ( ~ v574(VarCurr)
    <=> v564(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_57,axiom,(
    ! [VarCurr] :
      ( v566(VarCurr)
    <=> ( v567(VarCurr)
        | v572(VarCurr) ) ) )).

fof(addBitVectorEqualityBitBlasted_29,axiom,(
    ! [VarCurr] :
      ( v572(VarCurr)
    <=> ( ( v573(VarCurr,bitIndex1)
        <=> $true )
        & ( v573(VarCurr,bitIndex0)
        <=> $true ) ) ) )).

fof(addAssignment_151,axiom,(
    ! [VarCurr] :
      ( v573(VarCurr,bitIndex0)
    <=> v123(VarCurr) ) )).

fof(addAssignment_150,axiom,(
    ! [VarCurr] :
      ( v573(VarCurr,bitIndex1)
    <=> v105(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_56,axiom,(
    ! [VarCurr] :
      ( v567(VarCurr)
    <=> ( v568(VarCurr)
        | v570(VarCurr) ) ) )).

fof(addBitVectorEqualityBitBlasted_28,axiom,(
    ! [VarCurr] :
      ( v570(VarCurr)
    <=> ( ( v571(VarCurr,bitIndex1)
        <=> $true )
        & ( v571(VarCurr,bitIndex0)
        <=> $false ) ) ) )).

fof(addAssignment_149,axiom,(
    ! [VarCurr] :
      ( v571(VarCurr,bitIndex0)
    <=> v123(VarCurr) ) )).

fof(addAssignment_148,axiom,(
    ! [VarCurr] :
      ( v571(VarCurr,bitIndex1)
    <=> v105(VarCurr) ) )).

fof(addBitVectorEqualityBitBlasted_27,axiom,(
    ! [VarCurr] :
      ( v568(VarCurr)
    <=> ( ( v569(VarCurr,bitIndex1)
        <=> $false )
        & ( v569(VarCurr,bitIndex0)
        <=> $true ) ) ) )).

fof(addAssignment_147,axiom,(
    ! [VarCurr] :
      ( v569(VarCurr,bitIndex0)
    <=> v123(VarCurr) ) )).

fof(addAssignment_146,axiom,(
    ! [VarCurr] :
      ( v569(VarCurr,bitIndex1)
    <=> v105(VarCurr) ) )).

fof(writeUnaryOperator_38,axiom,(
    ! [VarCurr] :
      ( ~ v564(VarCurr)
    <=> v103(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_55,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( v555(VarNext)
      <=> ( v556(VarNext)
          & v467(VarNext) ) ) ) )).

fof(writeUnaryOperator_37,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( ~ v556(VarNext)
      <=> v474(VarNext) ) ) )).

fof(addAssignment_145,axiom,(
    ! [VarCurr,B] :
      ( range_122_116(B)
     => ( v546(VarCurr,B)
      <=> v551(VarCurr,B) ) ) )).

fof(aaddConditionBooleanCondEqualRangesElseBranch_16,axiom,(
    ! [VarCurr] :
      ( ~ v548(VarCurr)
     => ! [B] :
          ( range_122_0(B)
         => ( v551(VarCurr,B)
          <=> v550(VarCurr,B) ) ) ) )).

fof(addConditionBooleanCondEqualRangesThenBranch_16,axiom,(
    ! [VarCurr] :
      ( v548(VarCurr)
     => ! [B] :
          ( range_122_0(B)
         => ( v551(VarCurr,B)
          <=> v527(VarCurr,B) ) ) ) )).

fof(addAssignment_144,axiom,(
    ! [VarCurr] :
      ( ( v550(VarCurr,bitIndex122)
      <=> v501(VarCurr,bitIndex614) )
      & ( v550(VarCurr,bitIndex121)
      <=> v501(VarCurr,bitIndex613) )
      & ( v550(VarCurr,bitIndex120)
      <=> v501(VarCurr,bitIndex612) )
      & ( v550(VarCurr,bitIndex119)
      <=> v501(VarCurr,bitIndex611) )
      & ( v550(VarCurr,bitIndex118)
      <=> v501(VarCurr,bitIndex610) )
      & ( v550(VarCurr,bitIndex117)
      <=> v501(VarCurr,bitIndex609) )
      & ( v550(VarCurr,bitIndex116)
      <=> v501(VarCurr,bitIndex608) ) ) )).

fof(addAssignment_143,axiom,(
    ! [VarCurr] :
      ( v548(VarCurr)
    <=> v508(VarCurr,bitIndex1) ) )).

fof(addAssignment_142,axiom,(
    ! [VarCurr,B] :
      ( range_122_116(B)
     => ( v504(VarCurr,B)
      <=> v544(VarCurr,B) ) ) )).

fof(aaddConditionBooleanCondEqualRangesElseBranch_15,axiom,(
    ! [VarCurr] :
      ( ~ v506(VarCurr)
     => ! [B] :
          ( range_122_0(B)
         => ( v544(VarCurr,B)
          <=> v543(VarCurr,B) ) ) ) )).

fof(addConditionBooleanCondEqualRangesThenBranch_15,axiom,(
    ! [VarCurr] :
      ( v506(VarCurr)
     => ! [B] :
          ( range_122_0(B)
         => ( v544(VarCurr,B)
          <=> v527(VarCurr,B) ) ) ) )).

fof(range_axiom_7,axiom,(
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

fof(addAssignment_141,axiom,(
    ! [VarCurr] :
      ( ( v543(VarCurr,bitIndex122)
      <=> v501(VarCurr,bitIndex737) )
      & ( v543(VarCurr,bitIndex121)
      <=> v501(VarCurr,bitIndex736) )
      & ( v543(VarCurr,bitIndex120)
      <=> v501(VarCurr,bitIndex735) )
      & ( v543(VarCurr,bitIndex119)
      <=> v501(VarCurr,bitIndex734) )
      & ( v543(VarCurr,bitIndex118)
      <=> v501(VarCurr,bitIndex733) )
      & ( v543(VarCurr,bitIndex117)
      <=> v501(VarCurr,bitIndex732) )
      & ( v543(VarCurr,bitIndex116)
      <=> v501(VarCurr,bitIndex731) ) ) )).

fof(addAssignment_140,axiom,(
    ! [VarCurr,B] :
      ( range_122_116(B)
     => ( v527(VarCurr,B)
      <=> v529(VarCurr,B) ) ) )).

fof(addAssignment_139,axiom,(
    ! [VarCurr,B] :
      ( range_122_116(B)
     => ( v529(VarCurr,B)
      <=> v531(VarCurr,B) ) ) )).

fof(addAssignment_138,axiom,(
    ! [VarCurr,B] :
      ( range_122_116(B)
     => ( v531(VarCurr,B)
      <=> v533(VarCurr,B) ) ) )).

fof(addAssignment_137,axiom,(
    ! [VarCurr,B] :
      ( range_122_116(B)
     => ( v533(VarCurr,B)
      <=> v535(VarCurr,B) ) ) )).

fof(addAssignment_136,axiom,(
    ! [VarCurr,B] :
      ( range_122_116(B)
     => ( v535(VarCurr,B)
      <=> v537(VarCurr,B) ) ) )).

fof(addAssignment_135,axiom,(
    ! [VarCurr,B] :
      ( range_122_116(B)
     => ( v537(VarCurr,B)
      <=> v539(VarCurr,B) ) ) )).

fof(addAssignment_134,axiom,(
    ! [VarCurr,B] :
      ( range_122_116(B)
     => ( v539(VarCurr,B)
      <=> v541(VarCurr,B) ) ) )).

fof(range_axiom_6,axiom,(
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

fof(addAssignment_133,axiom,(
    ! [VarCurr] :
      ( v506(VarCurr)
    <=> v508(VarCurr,bitIndex1) ) )).

fof(addAssignment_132,axiom,(
    ! [VarCurr] :
      ( v508(VarCurr,bitIndex1)
    <=> v510(VarCurr,bitIndex1) ) )).

fof(aaddConditionBooleanCondEqualRangesElseBranch_14,axiom,(
    ! [VarCurr] :
      ( ~ v511(VarCurr)
     => ! [B] :
          ( range_8_0(B)
         => ( v510(VarCurr,B)
          <=> v513(VarCurr,B) ) ) ) )).

fof(addConditionBooleanCondEqualRangesThenBranch_14,axiom,(
    ! [VarCurr] :
      ( v511(VarCurr)
     => ! [B] :
          ( range_8_0(B)
         => ( v510(VarCurr,B)
          <=> v512(VarCurr,B) ) ) ) )).

fof(addParallelCaseBooleanConditionEqualRanges3_1,axiom,(
    ! [VarCurr] :
      ( ( ~ v514(VarCurr)
        & ~ v516(VarCurr)
        & ~ v520(VarCurr) )
     => ! [B] :
          ( range_8_0(B)
         => ( v513(VarCurr,B)
          <=> v464(VarCurr,B) ) ) ) )).

fof(addParallelCaseBooleanConditionEqualRanges2_3,axiom,(
    ! [VarCurr] :
      ( v520(VarCurr)
     => ! [B] :
          ( range_8_0(B)
         => ( v513(VarCurr,B)
          <=> v522(VarCurr,B) ) ) ) )).

fof(addParallelCaseBooleanConditionEqualRanges1_7,axiom,(
    ! [VarCurr] :
      ( v516(VarCurr)
     => ! [B] :
          ( range_8_0(B)
         => ( v513(VarCurr,B)
          <=> v518(VarCurr,B) ) ) ) )).

fof(addParallelCaseBooleanConditionEqualRanges0_7,axiom,(
    ! [VarCurr] :
      ( v514(VarCurr)
     => ! [B] :
          ( range_8_0(B)
         => ( v513(VarCurr,B)
          <=> v464(VarCurr,B) ) ) ) )).

fof(range_axiom_5,axiom,(
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

fof(addBitVectorEqualityBitBlasted_26,axiom,(
    ! [VarCurr] :
      ( v524(VarCurr)
    <=> ( ( v525(VarCurr,bitIndex1)
        <=> $true )
        & ( v525(VarCurr,bitIndex0)
        <=> $true ) ) ) )).

fof(addAssignment_131,axiom,(
    ! [VarCurr] :
      ( v525(VarCurr,bitIndex0)
    <=> v123(VarCurr) ) )).

fof(addAssignment_130,axiom,(
    ! [VarCurr] :
      ( v525(VarCurr,bitIndex1)
    <=> v105(VarCurr) ) )).

fof(addAssignment_129,axiom,(
    ! [VarCurr] :
      ( v522(VarCurr,bitIndex0)
    <=> $false ) )).

fof(addAssignment_128,axiom,(
    ! [VarCurr] :
      ( ( v522(VarCurr,bitIndex8)
      <=> v464(VarCurr,bitIndex7) )
      & ( v522(VarCurr,bitIndex7)
      <=> v464(VarCurr,bitIndex6) )
      & ( v522(VarCurr,bitIndex6)
      <=> v464(VarCurr,bitIndex5) )
      & ( v522(VarCurr,bitIndex5)
      <=> v464(VarCurr,bitIndex4) )
      & ( v522(VarCurr,bitIndex4)
      <=> v464(VarCurr,bitIndex3) )
      & ( v522(VarCurr,bitIndex3)
      <=> v464(VarCurr,bitIndex2) )
      & ( v522(VarCurr,bitIndex2)
      <=> v464(VarCurr,bitIndex1) )
      & ( v522(VarCurr,bitIndex1)
      <=> v464(VarCurr,bitIndex0) ) ) )).

fof(addBitVectorEqualityBitBlasted_25,axiom,(
    ! [VarCurr] :
      ( v520(VarCurr)
    <=> ( ( v521(VarCurr,bitIndex1)
        <=> $true )
        & ( v521(VarCurr,bitIndex0)
        <=> $false ) ) ) )).

fof(addAssignment_127,axiom,(
    ! [VarCurr] :
      ( v521(VarCurr,bitIndex0)
    <=> v123(VarCurr) ) )).

fof(addAssignment_126,axiom,(
    ! [VarCurr] :
      ( v521(VarCurr,bitIndex1)
    <=> v105(VarCurr) ) )).

fof(addAssignment_125,axiom,(
    ! [VarCurr] :
      ( ( v518(VarCurr,bitIndex7)
      <=> v464(VarCurr,bitIndex8) )
      & ( v518(VarCurr,bitIndex6)
      <=> v464(VarCurr,bitIndex7) )
      & ( v518(VarCurr,bitIndex5)
      <=> v464(VarCurr,bitIndex6) )
      & ( v518(VarCurr,bitIndex4)
      <=> v464(VarCurr,bitIndex5) )
      & ( v518(VarCurr,bitIndex3)
      <=> v464(VarCurr,bitIndex4) )
      & ( v518(VarCurr,bitIndex2)
      <=> v464(VarCurr,bitIndex3) )
      & ( v518(VarCurr,bitIndex1)
      <=> v464(VarCurr,bitIndex2) )
      & ( v518(VarCurr,bitIndex0)
      <=> v464(VarCurr,bitIndex1) ) ) )).

fof(addAssignment_124,axiom,(
    ! [VarCurr] :
      ( v518(VarCurr,bitIndex8)
    <=> $false ) )).

fof(addBitVectorEqualityBitBlasted_24,axiom,(
    ! [VarCurr] :
      ( v516(VarCurr)
    <=> ( ( v517(VarCurr,bitIndex1)
        <=> $false )
        & ( v517(VarCurr,bitIndex0)
        <=> $true ) ) ) )).

fof(addAssignment_123,axiom,(
    ! [VarCurr] :
      ( v517(VarCurr,bitIndex0)
    <=> v123(VarCurr) ) )).

fof(addAssignment_122,axiom,(
    ! [VarCurr] :
      ( v517(VarCurr,bitIndex1)
    <=> v105(VarCurr) ) )).

fof(addBitVectorEqualityBitBlasted_23,axiom,(
    ! [VarCurr] :
      ( v514(VarCurr)
    <=> ( ( v515(VarCurr,bitIndex1)
        <=> $false )
        & ( v515(VarCurr,bitIndex0)
        <=> $false ) ) ) )).

fof(addAssignment_121,axiom,(
    ! [VarCurr] :
      ( v515(VarCurr,bitIndex0)
    <=> v123(VarCurr) ) )).

fof(addAssignment_120,axiom,(
    ! [VarCurr] :
      ( v515(VarCurr,bitIndex1)
    <=> v105(VarCurr) ) )).

fof(addAssignment_119,axiom,(
    ! [VarCurr] :
      ( v512(VarCurr,bitIndex0)
    <=> $true ) )).

fof(addAssignment_118,axiom,(
    ! [VarCurr,B] :
      ( range_8_1(B)
     => ( v512(VarCurr,B)
      <=> v462(VarCurr,B) ) ) )).

fof(writeUnaryOperator_36,axiom,(
    ! [VarCurr] :
      ( ~ v511(VarCurr)
    <=> v103(VarCurr) ) )).

fof(addAssignment_117,axiom,(
    ! [VarCurr] :
      ( v462(VarCurr,bitIndex1)
    <=> v463(VarCurr,bitIndex1) ) )).

fof(addAssignment_116,axiom,(
    ! [VarCurr] :
      ( v99(VarCurr)
    <=> v101(VarCurr) ) )).

fof(addCaseBooleanConditionEqualRanges1_2,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( ~ v470(VarNext)
       => ( v101(VarNext)
        <=> v101(VarCurr) ) ) ) )).

fof(addCaseBooleanConditionEqualRanges0_2,axiom,(
    ! [VarNext] :
      ( v470(VarNext)
     => ( v101(VarNext)
      <=> v490(VarNext) ) ) )).

fof(addAssignment_115,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( v490(VarNext)
      <=> v488(VarCurr) ) ) )).

fof(aaddConditionBooleanCondEqualRangesElseBranch_13,axiom,(
    ! [VarCurr] :
      ( ~ v487(VarCurr)
     => ( v488(VarCurr)
      <=> v491(VarCurr) ) ) )).

fof(addConditionBooleanCondEqualRangesThenBranch_13,axiom,(
    ! [VarCurr] :
      ( v487(VarCurr)
     => ( v488(VarCurr)
      <=> $true ) ) )).

fof(aaddConditionBooleanCondEqualRangesElseBranch_12,axiom,(
    ! [VarCurr] :
      ( ~ v105(VarCurr)
     => ( v491(VarCurr)
      <=> $true ) ) )).

fof(addConditionBooleanCondEqualRangesThenBranch_12,axiom,(
    ! [VarCurr] :
      ( v105(VarCurr)
     => ( v491(VarCurr)
      <=> $false ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_54,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( v470(VarNext)
      <=> ( v471(VarNext)
          & v480(VarNext) ) ) ) )).

fof(addAssignment_114,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( v480(VarNext)
      <=> v478(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_53,axiom,(
    ! [VarCurr] :
      ( v478(VarCurr)
    <=> ( v481(VarCurr)
        | v487(VarCurr) ) ) )).

fof(writeUnaryOperator_35,axiom,(
    ! [VarCurr] :
      ( ~ v487(VarCurr)
    <=> v103(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_52,axiom,(
    ! [VarCurr] :
      ( v481(VarCurr)
    <=> ( v482(VarCurr)
        | v105(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_51,axiom,(
    ! [VarCurr] :
      ( v482(VarCurr)
    <=> ( v483(VarCurr)
        & v486(VarCurr) ) ) )).

fof(addBitVectorEqualityBitBlasted_22,axiom,(
    ! [VarCurr] :
      ( v486(VarCurr)
    <=> ( v462(VarCurr,bitIndex0)
      <=> $true ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_50,axiom,(
    ! [VarCurr] :
      ( v483(VarCurr)
    <=> ( v484(VarCurr)
        & v485(VarCurr) ) ) )).

fof(addBitVectorEqualityBitBlasted_21,axiom,(
    ! [VarCurr] :
      ( v485(VarCurr)
    <=> ( v460(VarCurr,bitIndex1)
      <=> $false ) ) )).

fof(addBitVectorEqualityBitBlasted_20,axiom,(
    ! [VarCurr] :
      ( v484(VarCurr)
    <=> ( v123(VarCurr)
      <=> $true ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_49,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( v471(VarNext)
      <=> ( v472(VarNext)
          & v467(VarNext) ) ) ) )).

fof(writeUnaryOperator_34,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( ~ v472(VarNext)
      <=> v474(VarNext) ) ) )).

fof(addAssignment_113,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( v474(VarNext)
      <=> v467(VarCurr) ) ) )).

fof(addAssignment_112,axiom,(
    ! [VarCurr] :
      ( v467(VarCurr)
    <=> v336(VarCurr) ) )).

fof(addAssignment_111,axiom,(
    ! [VarCurr] :
      ( v462(VarCurr,bitIndex0)
    <=> v463(VarCurr,bitIndex0) ) )).

fof(addAssignment_110,axiom,(
    ! [VarCurr] :
      ( v463(VarCurr,bitIndex0)
    <=> $true ) )).

fof(addAssignment_109,axiom,(
    ! [VarCurr,B] :
      ( range_8_1(B)
     => ( v463(VarCurr,B)
      <=> v464(VarCurr,B) ) ) )).

fof(range_axiom_4,axiom,(
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

fof(addAssignment_108,axiom,(
    ! [VarCurr] :
      ( v123(VarCurr)
    <=> v125(VarCurr) ) )).

fof(aaddConditionBooleanCondEqualRangesElseBranch_11,axiom,(
    ! [VarCurr] :
      ( ~ v446(VarCurr)
     => ( v125(VarCurr)
      <=> $false ) ) )).

fof(addConditionBooleanCondEqualRangesThenBranch_11,axiom,(
    ! [VarCurr] :
      ( v446(VarCurr)
     => ( v125(VarCurr)
      <=> v455(VarCurr) ) ) )).

fof(addParallelCaseBooleanConditionEqualRanges1_6,axiom,(
    ! [VarCurr] :
      ( ~ v448(VarCurr)
     => ( v455(VarCurr)
      <=> $false ) ) )).

fof(addParallelCaseBooleanConditionEqualRanges0_6,axiom,(
    ! [VarCurr] :
      ( v448(VarCurr)
     => ( v455(VarCurr)
      <=> v456(VarCurr) ) ) )).

fof(addParallelCaseBooleanConditionEqualRanges2_2,axiom,(
    ! [VarCurr] :
      ( ( ~ v451(VarCurr)
        & ~ v279(VarCurr) )
     => ( v456(VarCurr)
      <=> $true ) ) )).

fof(addParallelCaseBooleanConditionEqualRanges1_5,axiom,(
    ! [VarCurr] :
      ( v279(VarCurr)
     => ( v456(VarCurr)
      <=> v458(VarCurr) ) ) )).

fof(addParallelCaseBooleanConditionEqualRanges0_5,axiom,(
    ! [VarCurr] :
      ( v451(VarCurr)
     => ( v456(VarCurr)
      <=> v457(VarCurr) ) ) )).

fof(aaddConditionBooleanCondEqualRangesElseBranch_10,axiom,(
    ! [VarCurr] :
      ( ~ v167(VarCurr)
     => ( v458(VarCurr)
      <=> $false ) ) )).

fof(addConditionBooleanCondEqualRangesThenBranch_10,axiom,(
    ! [VarCurr] :
      ( v167(VarCurr)
     => ( v458(VarCurr)
      <=> $true ) ) )).

fof(aaddConditionBooleanCondEqualRangesElseBranch_9,axiom,(
    ! [VarCurr] :
      ( ~ v439(VarCurr)
     => ( v457(VarCurr)
      <=> $false ) ) )).

fof(addConditionBooleanCondEqualRangesThenBranch_9,axiom,(
    ! [VarCurr] :
      ( v439(VarCurr)
     => ( v457(VarCurr)
      <=> $true ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_48,axiom,(
    ! [VarCurr] :
      ( v446(VarCurr)
    <=> ( v447(VarCurr)
        & v454(VarCurr) ) ) )).

fof(writeUnaryOperator_33,axiom,(
    ! [VarCurr] :
      ( ~ v454(VarCurr)
    <=> v283(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_47,axiom,(
    ! [VarCurr] :
      ( v447(VarCurr)
    <=> ( v448(VarCurr)
        | v453(VarCurr) ) ) )).

fof(writeUnaryOperator_32,axiom,(
    ! [VarCurr] :
      ( ~ v453(VarCurr)
    <=> v280(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_46,axiom,(
    ! [VarCurr] :
      ( v448(VarCurr)
    <=> ( v449(VarCurr)
        & v280(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_45,axiom,(
    ! [VarCurr] :
      ( v449(VarCurr)
    <=> ( v450(VarCurr)
        | v452(VarCurr) ) ) )).

fof(addBitVectorEqualityBitBlasted_19,axiom,(
    ! [VarCurr] :
      ( v452(VarCurr)
    <=> ( ( v97(VarCurr,bitIndex1)
        <=> $true )
        & ( v97(VarCurr,bitIndex0)
        <=> $false ) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_44,axiom,(
    ! [VarCurr] :
      ( v450(VarCurr)
    <=> ( v451(VarCurr)
        | v279(VarCurr) ) ) )).

fof(addBitVectorEqualityBitBlasted_18,axiom,(
    ! [VarCurr] :
      ( v451(VarCurr)
    <=> ( ( v97(VarCurr,bitIndex1)
        <=> $false )
        & ( v97(VarCurr,bitIndex0)
        <=> $false ) ) ) )).

fof(writeBinaryOperatorShiftedRanges_21,axiom,(
    ! [VarCurr] :
      ( v439(VarCurr)
    <=> ( v444(VarCurr)
        | v441(VarCurr,bitIndex2) ) ) )).

fof(writeBinaryOperatorShiftedRanges_20,axiom,(
    ! [VarCurr] :
      ( v444(VarCurr)
    <=> ( v441(VarCurr,bitIndex0)
        | v441(VarCurr,bitIndex1) ) ) )).

fof(addAssignment_107,axiom,(
    ! [VarCurr] :
      ( v130(VarCurr)
    <=> v132(VarCurr) ) )).

fof(addBitVectorEqualityBitBlasted_17,axiom,(
    ! [VarCurr] :
      ( v132(VarCurr)
    <=> ( ( v134(VarCurr,bitIndex2)
        <=> $false )
        & ( v134(VarCurr,bitIndex1)
        <=> $false )
        & ( v134(VarCurr,bitIndex0)
        <=> $false ) ) ) )).

fof(addCaseBooleanConditionEqualRanges1_1,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( ~ v423(VarNext)
       => ! [B] :
            ( range_2_0(B)
           => ( v134(VarNext,B)
            <=> v134(VarCurr,B) ) ) ) ) )).

fof(addCaseBooleanConditionEqualRanges0_1,axiom,(
    ! [VarNext] :
      ( v423(VarNext)
     => ! [B] :
          ( range_2_0(B)
         => ( v134(VarNext,B)
          <=> v433(VarNext,B) ) ) ) )).

fof(addAssignment_106,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ! [B] :
          ( range_2_0(B)
         => ( v433(VarNext,B)
          <=> v431(VarCurr,B) ) ) ) )).

fof(aaddConditionBooleanCondEqualRangesElseBranch_8,axiom,(
    ! [VarCurr] :
      ( ~ v434(VarCurr)
     => ! [B] :
          ( range_2_0(B)
         => ( v431(VarCurr,B)
          <=> v139(VarCurr,B) ) ) ) )).

fof(addConditionBooleanCondEqualRangesThenBranch_8,axiom,(
    ! [VarCurr] :
      ( v434(VarCurr)
     => ! [B] :
          ( range_2_0(B)
         => ( v431(VarCurr,B)
          <=> $false ) ) ) )).

fof(writeUnaryOperator_31,axiom,(
    ! [VarCurr] :
      ( ~ v434(VarCurr)
    <=> v136(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_43,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( v423(VarNext)
      <=> v424(VarNext) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_42,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( v424(VarNext)
      <=> ( v425(VarNext)
          & v420(VarNext) ) ) ) )).

fof(writeUnaryOperator_30,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( ~ v425(VarNext)
      <=> v427(VarNext) ) ) )).

fof(addAssignment_105,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( v427(VarNext)
      <=> v420(VarCurr) ) ) )).

fof(addAssignment_104,axiom,(
    ! [VarCurr] :
      ( v420(VarCurr)
    <=> v336(VarCurr) ) )).

fof(addParallelCaseBooleanConditionEqualRanges3,axiom,(
    ! [VarCurr] :
      ( ( ~ v369(VarCurr)
        & ~ v371(VarCurr)
        & ~ v400(VarCurr) )
     => ! [B] :
          ( range_2_0(B)
         => ( v139(VarCurr,B)
          <=> v134(VarCurr,B) ) ) ) )).

fof(addParallelCaseBooleanConditionEqualRanges2_1,axiom,(
    ! [VarCurr] :
      ( v400(VarCurr)
     => ! [B] :
          ( range_2_0(B)
         => ( v139(VarCurr,B)
          <=> v402(VarCurr,B) ) ) ) )).

fof(addParallelCaseBooleanConditionEqualRanges1_4,axiom,(
    ! [VarCurr] :
      ( v371(VarCurr)
     => ! [B] :
          ( range_2_0(B)
         => ( v139(VarCurr,B)
          <=> v373(VarCurr,B) ) ) ) )).

fof(addParallelCaseBooleanConditionEqualRanges0_4,axiom,(
    ! [VarCurr] :
      ( v369(VarCurr)
     => ! [B] :
          ( range_2_0(B)
         => ( v139(VarCurr,B)
          <=> v134(VarCurr,B) ) ) ) )).

fof(addBitVectorEqualityBitBlasted_16,axiom,(
    ! [VarCurr] :
      ( v417(VarCurr)
    <=> ( ( v418(VarCurr,bitIndex1)
        <=> $true )
        & ( v418(VarCurr,bitIndex0)
        <=> $true ) ) ) )).

fof(addAssignment_103,axiom,(
    ! [VarCurr] :
      ( v418(VarCurr,bitIndex0)
    <=> v161(VarCurr) ) )).

fof(addAssignment_102,axiom,(
    ! [VarCurr] :
      ( v418(VarCurr,bitIndex1)
    <=> v141(VarCurr) ) )).

fof(aaddConditionBooleanCondEqualRangesElseBranch_7,axiom,(
    ! [VarCurr] :
      ( ~ v403(VarCurr)
     => ! [B] :
          ( range_2_0(B)
         => ( v402(VarCurr,B)
          <=> v404(VarCurr,B) ) ) ) )).

fof(addConditionBooleanCondEqualRangesThenBranch_7,axiom,(
    ! [VarCurr] :
      ( v403(VarCurr)
     => ! [B] :
          ( range_2_0(B)
         => ( v402(VarCurr,B)
          <=> b100(B) ) ) ) )).

fof(addAssignment_101,axiom,(
    ! [VarCurr] :
      ( v404(VarCurr,bitIndex0)
    <=> v414(VarCurr) ) )).

fof(addAssignment_100,axiom,(
    ! [VarCurr] :
      ( v404(VarCurr,bitIndex1)
    <=> v412(VarCurr) ) )).

fof(addAssignment_99,axiom,(
    ! [VarCurr] :
      ( v404(VarCurr,bitIndex2)
    <=> v406(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_41,axiom,(
    ! [VarCurr] :
      ( v412(VarCurr)
    <=> ( v413(VarCurr)
        & v416(VarCurr) ) ) )).

fof(writeBinaryOperatorShiftedRanges_19,axiom,(
    ! [VarCurr] :
      ( v416(VarCurr)
    <=> ( v134(VarCurr,bitIndex0)
        | v134(VarCurr,bitIndex1) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_40,axiom,(
    ! [VarCurr] :
      ( v413(VarCurr)
    <=> ( v414(VarCurr)
        | v415(VarCurr) ) ) )).

fof(writeUnaryOperator_29,axiom,(
    ! [VarCurr] :
      ( ~ v415(VarCurr)
    <=> v134(VarCurr,bitIndex1) ) )).

fof(writeUnaryOperator_28,axiom,(
    ! [VarCurr] :
      ( ~ v414(VarCurr)
    <=> v134(VarCurr,bitIndex0) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_39,axiom,(
    ! [VarCurr] :
      ( v406(VarCurr)
    <=> ( v407(VarCurr)
        & v411(VarCurr) ) ) )).

fof(writeBinaryOperatorShiftedRanges_18,axiom,(
    ! [VarCurr] :
      ( v411(VarCurr)
    <=> ( v409(VarCurr)
        | v134(VarCurr,bitIndex2) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_38,axiom,(
    ! [VarCurr] :
      ( v407(VarCurr)
    <=> ( v408(VarCurr)
        | v410(VarCurr) ) ) )).

fof(writeUnaryOperator_27,axiom,(
    ! [VarCurr] :
      ( ~ v410(VarCurr)
    <=> v134(VarCurr,bitIndex2) ) )).

fof(writeUnaryOperator_26,axiom,(
    ! [VarCurr] :
      ( ~ v408(VarCurr)
    <=> v409(VarCurr) ) )).

fof(writeBinaryOperatorShiftedRanges_17,axiom,(
    ! [VarCurr] :
      ( v409(VarCurr)
    <=> ( v134(VarCurr,bitIndex0)
        & v134(VarCurr,bitIndex1) ) ) )).

fof(addBitVectorEqualityBitBlasted_15,axiom,(
    ! [VarCurr] :
      ( v403(VarCurr)
    <=> ( ( v134(VarCurr,bitIndex2)
        <=> $true )
        & ( v134(VarCurr,bitIndex1)
        <=> $false )
        & ( v134(VarCurr,bitIndex0)
        <=> $false ) ) ) )).

fof(bitBlastConstant_59,axiom,(
    b100(bitIndex2) )).

fof(bitBlastConstant_58,axiom,(
    ~ b100(bitIndex1) )).

fof(bitBlastConstant_57,axiom,(
    ~ b100(bitIndex0) )).

fof(addBitVectorEqualityBitBlasted_14,axiom,(
    ! [VarCurr] :
      ( v400(VarCurr)
    <=> ( ( v401(VarCurr,bitIndex1)
        <=> $true )
        & ( v401(VarCurr,bitIndex0)
        <=> $false ) ) ) )).

fof(addAssignment_98,axiom,(
    ! [VarCurr] :
      ( v401(VarCurr,bitIndex0)
    <=> v161(VarCurr) ) )).

fof(addAssignment_97,axiom,(
    ! [VarCurr] :
      ( v401(VarCurr,bitIndex1)
    <=> v141(VarCurr) ) )).

fof(aaddConditionBooleanCondEqualRangesElseBranch_6,axiom,(
    ! [VarCurr] :
      ( ~ v374(VarCurr)
     => ! [B] :
          ( range_31_0(B)
         => ( v373(VarCurr,B)
          <=> v375(VarCurr,B) ) ) ) )).

fof(addConditionBooleanCondEqualRangesThenBranch_6,axiom,(
    ! [VarCurr] :
      ( v374(VarCurr)
     => ! [B] :
          ( range_31_0(B)
         => ( v373(VarCurr,B)
          <=> $false ) ) ) )).

fof(range_axiom_3,axiom,(
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

fof(bitBlastConstant_56,axiom,(
    ~ b00000000000000000000000000000000(bitIndex31) )).

fof(bitBlastConstant_55,axiom,(
    ~ b00000000000000000000000000000000(bitIndex30) )).

fof(bitBlastConstant_54,axiom,(
    ~ b00000000000000000000000000000000(bitIndex29) )).

fof(bitBlastConstant_53,axiom,(
    ~ b00000000000000000000000000000000(bitIndex28) )).

fof(bitBlastConstant_52,axiom,(
    ~ b00000000000000000000000000000000(bitIndex27) )).

fof(bitBlastConstant_51,axiom,(
    ~ b00000000000000000000000000000000(bitIndex26) )).

fof(bitBlastConstant_50,axiom,(
    ~ b00000000000000000000000000000000(bitIndex25) )).

fof(bitBlastConstant_49,axiom,(
    ~ b00000000000000000000000000000000(bitIndex24) )).

fof(bitBlastConstant_48,axiom,(
    ~ b00000000000000000000000000000000(bitIndex23) )).

fof(bitBlastConstant_47,axiom,(
    ~ b00000000000000000000000000000000(bitIndex22) )).

fof(bitBlastConstant_46,axiom,(
    ~ b00000000000000000000000000000000(bitIndex21) )).

fof(bitBlastConstant_45,axiom,(
    ~ b00000000000000000000000000000000(bitIndex20) )).

fof(bitBlastConstant_44,axiom,(
    ~ b00000000000000000000000000000000(bitIndex19) )).

fof(bitBlastConstant_43,axiom,(
    ~ b00000000000000000000000000000000(bitIndex18) )).

fof(bitBlastConstant_42,axiom,(
    ~ b00000000000000000000000000000000(bitIndex17) )).

fof(bitBlastConstant_41,axiom,(
    ~ b00000000000000000000000000000000(bitIndex16) )).

fof(bitBlastConstant_40,axiom,(
    ~ b00000000000000000000000000000000(bitIndex15) )).

fof(bitBlastConstant_39,axiom,(
    ~ b00000000000000000000000000000000(bitIndex14) )).

fof(bitBlastConstant_38,axiom,(
    ~ b00000000000000000000000000000000(bitIndex13) )).

fof(bitBlastConstant_37,axiom,(
    ~ b00000000000000000000000000000000(bitIndex12) )).

fof(bitBlastConstant_36,axiom,(
    ~ b00000000000000000000000000000000(bitIndex11) )).

fof(bitBlastConstant_35,axiom,(
    ~ b00000000000000000000000000000000(bitIndex10) )).

fof(bitBlastConstant_34,axiom,(
    ~ b00000000000000000000000000000000(bitIndex9) )).

fof(bitBlastConstant_33,axiom,(
    ~ b00000000000000000000000000000000(bitIndex8) )).

fof(bitBlastConstant_32,axiom,(
    ~ b00000000000000000000000000000000(bitIndex7) )).

fof(bitBlastConstant_31,axiom,(
    ~ b00000000000000000000000000000000(bitIndex6) )).

fof(bitBlastConstant_30,axiom,(
    ~ b00000000000000000000000000000000(bitIndex5) )).

fof(bitBlastConstant_29,axiom,(
    ~ b00000000000000000000000000000000(bitIndex4) )).

fof(bitBlastConstant_28,axiom,(
    ~ b00000000000000000000000000000000(bitIndex3) )).

fof(bitBlastConstant_27,axiom,(
    ~ b00000000000000000000000000000000(bitIndex2) )).

fof(bitBlastConstant_26,axiom,(
    ~ b00000000000000000000000000000000(bitIndex1) )).

fof(bitBlastConstant_25,axiom,(
    ~ b00000000000000000000000000000000(bitIndex0) )).

fof(addSignExtensionConstraint_27,axiom,(
    ! [VarCurr] :
      ( v375(VarCurr,bitIndex4)
    <=> v376(VarCurr,bitIndex3) ) )).

fof(addSignExtensionConstraint_26,axiom,(
    ! [VarCurr] :
      ( v375(VarCurr,bitIndex5)
    <=> v376(VarCurr,bitIndex3) ) )).

fof(addSignExtensionConstraint_25,axiom,(
    ! [VarCurr] :
      ( v375(VarCurr,bitIndex6)
    <=> v376(VarCurr,bitIndex3) ) )).

fof(addSignExtensionConstraint_24,axiom,(
    ! [VarCurr] :
      ( v375(VarCurr,bitIndex7)
    <=> v376(VarCurr,bitIndex3) ) )).

fof(addSignExtensionConstraint_23,axiom,(
    ! [VarCurr] :
      ( v375(VarCurr,bitIndex8)
    <=> v376(VarCurr,bitIndex3) ) )).

fof(addSignExtensionConstraint_22,axiom,(
    ! [VarCurr] :
      ( v375(VarCurr,bitIndex9)
    <=> v376(VarCurr,bitIndex3) ) )).

fof(addSignExtensionConstraint_21,axiom,(
    ! [VarCurr] :
      ( v375(VarCurr,bitIndex10)
    <=> v376(VarCurr,bitIndex3) ) )).

fof(addSignExtensionConstraint_20,axiom,(
    ! [VarCurr] :
      ( v375(VarCurr,bitIndex11)
    <=> v376(VarCurr,bitIndex3) ) )).

fof(addSignExtensionConstraint_19,axiom,(
    ! [VarCurr] :
      ( v375(VarCurr,bitIndex12)
    <=> v376(VarCurr,bitIndex3) ) )).

fof(addSignExtensionConstraint_18,axiom,(
    ! [VarCurr] :
      ( v375(VarCurr,bitIndex13)
    <=> v376(VarCurr,bitIndex3) ) )).

fof(addSignExtensionConstraint_17,axiom,(
    ! [VarCurr] :
      ( v375(VarCurr,bitIndex14)
    <=> v376(VarCurr,bitIndex3) ) )).

fof(addSignExtensionConstraint_16,axiom,(
    ! [VarCurr] :
      ( v375(VarCurr,bitIndex15)
    <=> v376(VarCurr,bitIndex3) ) )).

fof(addSignExtensionConstraint_15,axiom,(
    ! [VarCurr] :
      ( v375(VarCurr,bitIndex16)
    <=> v376(VarCurr,bitIndex3) ) )).

fof(addSignExtensionConstraint_14,axiom,(
    ! [VarCurr] :
      ( v375(VarCurr,bitIndex17)
    <=> v376(VarCurr,bitIndex3) ) )).

fof(addSignExtensionConstraint_13,axiom,(
    ! [VarCurr] :
      ( v375(VarCurr,bitIndex18)
    <=> v376(VarCurr,bitIndex3) ) )).

fof(addSignExtensionConstraint_12,axiom,(
    ! [VarCurr] :
      ( v375(VarCurr,bitIndex19)
    <=> v376(VarCurr,bitIndex3) ) )).

fof(addSignExtensionConstraint_11,axiom,(
    ! [VarCurr] :
      ( v375(VarCurr,bitIndex20)
    <=> v376(VarCurr,bitIndex3) ) )).

fof(addSignExtensionConstraint_10,axiom,(
    ! [VarCurr] :
      ( v375(VarCurr,bitIndex21)
    <=> v376(VarCurr,bitIndex3) ) )).

fof(addSignExtensionConstraint_9,axiom,(
    ! [VarCurr] :
      ( v375(VarCurr,bitIndex22)
    <=> v376(VarCurr,bitIndex3) ) )).

fof(addSignExtensionConstraint_8,axiom,(
    ! [VarCurr] :
      ( v375(VarCurr,bitIndex23)
    <=> v376(VarCurr,bitIndex3) ) )).

fof(addSignExtensionConstraint_7,axiom,(
    ! [VarCurr] :
      ( v375(VarCurr,bitIndex24)
    <=> v376(VarCurr,bitIndex3) ) )).

fof(addSignExtensionConstraint_6,axiom,(
    ! [VarCurr] :
      ( v375(VarCurr,bitIndex25)
    <=> v376(VarCurr,bitIndex3) ) )).

fof(addSignExtensionConstraint_5,axiom,(
    ! [VarCurr] :
      ( v375(VarCurr,bitIndex26)
    <=> v376(VarCurr,bitIndex3) ) )).

fof(addSignExtensionConstraint_4,axiom,(
    ! [VarCurr] :
      ( v375(VarCurr,bitIndex27)
    <=> v376(VarCurr,bitIndex3) ) )).

fof(addSignExtensionConstraint_3,axiom,(
    ! [VarCurr] :
      ( v375(VarCurr,bitIndex28)
    <=> v376(VarCurr,bitIndex3) ) )).

fof(addSignExtensionConstraint_2,axiom,(
    ! [VarCurr] :
      ( v375(VarCurr,bitIndex29)
    <=> v376(VarCurr,bitIndex3) ) )).

fof(addSignExtensionConstraint_1,axiom,(
    ! [VarCurr] :
      ( v375(VarCurr,bitIndex30)
    <=> v376(VarCurr,bitIndex3) ) )).

fof(addSignExtensionConstraint,axiom,(
    ! [VarCurr] :
      ( v375(VarCurr,bitIndex31)
    <=> v376(VarCurr,bitIndex3) ) )).

fof(addAssignment_96,axiom,(
    ! [VarCurr,B] :
      ( range_3_0(B)
     => ( v375(VarCurr,B)
      <=> v376(VarCurr,B) ) ) )).

fof(addAssignment_95,axiom,(
    ! [VarCurr] :
      ( v376(VarCurr,bitIndex0)
    <=> v397(VarCurr) ) )).

fof(addAssignment_94,axiom,(
    ! [VarCurr] :
      ( v376(VarCurr,bitIndex1)
    <=> v395(VarCurr) ) )).

fof(addAssignment_93,axiom,(
    ! [VarCurr] :
      ( v376(VarCurr,bitIndex2)
    <=> v391(VarCurr) ) )).

fof(addAssignment_92,axiom,(
    ! [VarCurr] :
      ( v376(VarCurr,bitIndex3)
    <=> v378(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_37,axiom,(
    ! [VarCurr] :
      ( v395(VarCurr)
    <=> ( v396(VarCurr)
        & v398(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_36,axiom,(
    ! [VarCurr] :
      ( v398(VarCurr)
    <=> ( v382(VarCurr,bitIndex0)
        | v387(VarCurr) ) ) )).

fof(writeBinaryOperatorShiftedRanges_16,axiom,(
    ! [VarCurr] :
      ( v396(VarCurr)
    <=> ( v397(VarCurr)
        | v382(VarCurr,bitIndex1) ) ) )).

fof(writeUnaryOperator_25,axiom,(
    ! [VarCurr] :
      ( ~ v397(VarCurr)
    <=> v382(VarCurr,bitIndex0) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_35,axiom,(
    ! [VarCurr] :
      ( v391(VarCurr)
    <=> ( v392(VarCurr)
        & v394(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_34,axiom,(
    ! [VarCurr] :
      ( v394(VarCurr)
    <=> ( v385(VarCurr)
        | v388(VarCurr) ) ) )).

fof(writeBinaryOperatorShiftedRanges_15,axiom,(
    ! [VarCurr] :
      ( v392(VarCurr)
    <=> ( v393(VarCurr)
        | v382(VarCurr,bitIndex2) ) ) )).

fof(writeUnaryOperator_24,axiom,(
    ! [VarCurr] :
      ( ~ v393(VarCurr)
    <=> v385(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_33,axiom,(
    ! [VarCurr] :
      ( v378(VarCurr)
    <=> ( v379(VarCurr)
        & v389(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_32,axiom,(
    ! [VarCurr] :
      ( v389(VarCurr)
    <=> ( v381(VarCurr)
        | v390(VarCurr) ) ) )).

fof(writeUnaryOperator_23,axiom,(
    ! [VarCurr] :
      ( ~ v390(VarCurr)
    <=> v382(VarCurr,bitIndex3) ) )).

fof(writeBinaryOperatorShiftedRanges_14,axiom,(
    ! [VarCurr] :
      ( v379(VarCurr)
    <=> ( v380(VarCurr)
        | v382(VarCurr,bitIndex3) ) ) )).

fof(writeUnaryOperator_22,axiom,(
    ! [VarCurr] :
      ( ~ v380(VarCurr)
    <=> v381(VarCurr) ) )).

fof(writeBinaryOperatorShiftedRanges_13,axiom,(
    ! [VarCurr] :
      ( v381(VarCurr)
    <=> ( v382(VarCurr,bitIndex2)
        | v384(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_31,axiom,(
    ! [VarCurr] :
      ( v384(VarCurr)
    <=> ( v385(VarCurr)
        & v388(VarCurr) ) ) )).

fof(writeUnaryOperator_21,axiom,(
    ! [VarCurr] :
      ( ~ v388(VarCurr)
    <=> v382(VarCurr,bitIndex2) ) )).

fof(writeBinaryOperatorShiftedRanges_12,axiom,(
    ! [VarCurr] :
      ( v385(VarCurr)
    <=> ( v382(VarCurr,bitIndex1)
        | v386(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_30,axiom,(
    ! [VarCurr] :
      ( v386(VarCurr)
    <=> ( v382(VarCurr,bitIndex0)
        & v387(VarCurr) ) ) )).

fof(writeUnaryOperator_20,axiom,(
    ! [VarCurr] :
      ( ~ v387(VarCurr)
    <=> v382(VarCurr,bitIndex1) ) )).

fof(addZeroExtensionConstraint,axiom,(
    ! [VarCurr] : ~ v382(VarCurr,bitIndex3) )).

fof(addAssignment_91,axiom,(
    ! [VarCurr,B] :
      ( range_2_0(B)
     => ( v382(VarCurr,B)
      <=> v134(VarCurr,B) ) ) )).

fof(range_axiom_2,axiom,(
    ! [B] :
      ( range_2_0(B)
    <=> ( $false
        | bitIndex0 = B
        | bitIndex1 = B
        | bitIndex2 = B ) ) )).

fof(addBitVectorEqualityBitBlasted_13,axiom,(
    ! [VarCurr] :
      ( v374(VarCurr)
    <=> ( ( v134(VarCurr,bitIndex2)
        <=> $false )
        & ( v134(VarCurr,bitIndex1)
        <=> $false )
        & ( v134(VarCurr,bitIndex0)
        <=> $false ) ) ) )).

fof(bitBlastConstant_24,axiom,(
    ~ b000(bitIndex2) )).

fof(bitBlastConstant_23,axiom,(
    ~ b000(bitIndex1) )).

fof(bitBlastConstant_22,axiom,(
    ~ b000(bitIndex0) )).

fof(addBitVectorEqualityBitBlasted_12,axiom,(
    ! [VarCurr] :
      ( v371(VarCurr)
    <=> ( ( v372(VarCurr,bitIndex1)
        <=> $false )
        & ( v372(VarCurr,bitIndex0)
        <=> $true ) ) ) )).

fof(addAssignment_90,axiom,(
    ! [VarCurr] :
      ( v372(VarCurr,bitIndex0)
    <=> v161(VarCurr) ) )).

fof(addAssignment_89,axiom,(
    ! [VarCurr] :
      ( v372(VarCurr,bitIndex1)
    <=> v141(VarCurr) ) )).

fof(addBitVectorEqualityBitBlasted_11,axiom,(
    ! [VarCurr] :
      ( v369(VarCurr)
    <=> ( ( v370(VarCurr,bitIndex1)
        <=> $false )
        & ( v370(VarCurr,bitIndex0)
        <=> $false ) ) ) )).

fof(addAssignment_88,axiom,(
    ! [VarCurr] :
      ( v370(VarCurr,bitIndex0)
    <=> v161(VarCurr) ) )).

fof(addAssignment_87,axiom,(
    ! [VarCurr] :
      ( v370(VarCurr,bitIndex1)
    <=> v141(VarCurr) ) )).

fof(addAssignment_86,axiom,(
    ! [VarCurr] :
      ( v161(VarCurr)
    <=> v163(VarCurr) ) )).

fof(addAssignment_85,axiom,(
    ! [VarCurr] :
      ( v163(VarCurr)
    <=> v165(VarCurr) ) )).

fof(aaddConditionBooleanCondEqualRangesElseBranch_5,axiom,(
    ! [VarCurr] :
      ( ~ v361(VarCurr)
     => ( v165(VarCurr)
      <=> $false ) ) )).

fof(addConditionBooleanCondEqualRangesThenBranch_5,axiom,(
    ! [VarCurr] :
      ( v361(VarCurr)
     => ( v165(VarCurr)
      <=> v365(VarCurr) ) ) )).

fof(addParallelCaseBooleanConditionEqualRanges1_3,axiom,(
    ! [VarCurr] :
      ( ~ v283(VarCurr)
     => ( v365(VarCurr)
      <=> $false ) ) )).

fof(addParallelCaseBooleanConditionEqualRanges0_3,axiom,(
    ! [VarCurr] :
      ( v283(VarCurr)
     => ( v365(VarCurr)
      <=> $true ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_29,axiom,(
    ! [VarCurr] :
      ( v361(VarCurr)
    <=> ( v283(VarCurr)
        | v362(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_28,axiom,(
    ! [VarCurr] :
      ( v362(VarCurr)
    <=> ( v363(VarCurr)
        & v364(VarCurr) ) ) )).

fof(writeUnaryOperator_19,axiom,(
    ! [VarCurr] :
      ( ~ v364(VarCurr)
    <=> v283(VarCurr) ) )).

fof(writeUnaryOperator_18,axiom,(
    ! [VarCurr] :
      ( ~ v363(VarCurr)
    <=> v280(VarCurr) ) )).

fof(writeBinaryOperatorShiftedRanges_11,axiom,(
    ! [VarCurr] :
      ( v167(VarCurr)
    <=> ( v359(VarCurr)
        | v169(VarCurr,bitIndex3) ) ) )).

fof(writeBinaryOperatorShiftedRanges_10,axiom,(
    ! [VarCurr] :
      ( v359(VarCurr)
    <=> ( v329(VarCurr)
        | v169(VarCurr,bitIndex2) ) ) )).

fof(addCaseBooleanConditionEqualRanges1,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( ~ v343(VarNext)
       => ! [B] :
            ( range_3_0(B)
           => ( v169(VarNext,B)
            <=> v169(VarCurr,B) ) ) ) ) )).

fof(addCaseBooleanConditionEqualRanges0,axiom,(
    ! [VarNext] :
      ( v343(VarNext)
     => ! [B] :
          ( range_3_0(B)
         => ( v169(VarNext,B)
          <=> v353(VarNext,B) ) ) ) )).

fof(addAssignment_84,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ! [B] :
          ( range_3_0(B)
         => ( v353(VarNext,B)
          <=> v351(VarCurr,B) ) ) ) )).

fof(aaddConditionBooleanCondEqualRangesElseBranch_4,axiom,(
    ! [VarCurr] :
      ( ~ v354(VarCurr)
     => ! [B] :
          ( range_3_0(B)
         => ( v351(VarCurr,B)
          <=> v172(VarCurr,B) ) ) ) )).

fof(addConditionBooleanCondEqualRangesThenBranch_4,axiom,(
    ! [VarCurr] :
      ( v354(VarCurr)
     => ! [B] :
          ( range_3_0(B)
         => ( v351(VarCurr,B)
          <=> b1000(B) ) ) ) )).

fof(bitBlastConstant_21,axiom,(
    b1000(bitIndex3) )).

fof(bitBlastConstant_20,axiom,(
    ~ b1000(bitIndex2) )).

fof(bitBlastConstant_19,axiom,(
    ~ b1000(bitIndex1) )).

fof(bitBlastConstant_18,axiom,(
    ~ b1000(bitIndex0) )).

fof(writeUnaryOperator_17,axiom,(
    ! [VarCurr] :
      ( ~ v354(VarCurr)
    <=> v91(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_27,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( v343(VarNext)
      <=> v344(VarNext) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_26,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( v344(VarNext)
      <=> ( v345(VarNext)
          & v336(VarNext) ) ) ) )).

fof(writeUnaryOperator_16,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( ~ v345(VarNext)
      <=> v347(VarNext) ) ) )).

fof(addAssignment_83,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( v347(VarNext)
      <=> v336(VarCurr) ) ) )).

fof(addAssignment_82,axiom,(
    ! [VarCurr] :
      ( v336(VarCurr)
    <=> v338(VarCurr) ) )).

fof(addAssignment_81,axiom,(
    ! [VarCurr] :
      ( v338(VarCurr)
    <=> v340(VarCurr) ) )).

fof(addAssignment_80,axiom,(
    ! [VarCurr] :
      ( v340(VarCurr)
    <=> v1(VarCurr) ) )).

fof(addParallelCaseBooleanConditionEqualRanges2,axiom,(
    ! [VarCurr] :
      ( ( ~ v290(VarCurr)
        & ~ v313(VarCurr) )
     => ! [B] :
          ( range_3_0(B)
         => ( v172(VarCurr,B)
          <=> v169(VarCurr,B) ) ) ) )).

fof(addParallelCaseBooleanConditionEqualRanges1_2,axiom,(
    ! [VarCurr] :
      ( v313(VarCurr)
     => ! [B] :
          ( range_3_0(B)
         => ( v172(VarCurr,B)
          <=> v315(VarCurr,B) ) ) ) )).

fof(addParallelCaseBooleanConditionEqualRanges0_2,axiom,(
    ! [VarCurr] :
      ( v290(VarCurr)
     => ! [B] :
          ( range_3_0(B)
         => ( v172(VarCurr,B)
          <=> v292(VarCurr,B) ) ) ) )).

fof(range_axiom_1,axiom,(
    ! [B] :
      ( range_3_0(B)
    <=> ( $false
        | bitIndex0 = B
        | bitIndex1 = B
        | bitIndex2 = B
        | bitIndex3 = B ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_25,axiom,(
    ! [VarCurr] :
      ( v330(VarCurr)
    <=> ( v331(VarCurr)
        | v333(VarCurr) ) ) )).

fof(addBitVectorEqualityBitBlasted_10,axiom,(
    ! [VarCurr] :
      ( v333(VarCurr)
    <=> ( ( v334(VarCurr,bitIndex1)
        <=> $true )
        & ( v334(VarCurr,bitIndex0)
        <=> $true ) ) ) )).

fof(addAssignment_79,axiom,(
    ! [VarCurr] :
      ( v334(VarCurr,bitIndex0)
    <=> v272(VarCurr) ) )).

fof(addAssignment_78,axiom,(
    ! [VarCurr] :
      ( v334(VarCurr,bitIndex1)
    <=> v174(VarCurr) ) )).

fof(addBitVectorEqualityBitBlasted_9,axiom,(
    ! [VarCurr] :
      ( v331(VarCurr)
    <=> ( ( v332(VarCurr,bitIndex1)
        <=> $false )
        & ( v332(VarCurr,bitIndex0)
        <=> $false ) ) ) )).

fof(bitBlastConstant_17,axiom,(
    ~ b00(bitIndex1) )).

fof(bitBlastConstant_16,axiom,(
    ~ b00(bitIndex0) )).

fof(addAssignment_77,axiom,(
    ! [VarCurr] :
      ( v332(VarCurr,bitIndex0)
    <=> v272(VarCurr) ) )).

fof(addAssignment_76,axiom,(
    ! [VarCurr] :
      ( v332(VarCurr,bitIndex1)
    <=> v174(VarCurr) ) )).

fof(addAssignment_75,axiom,(
    ! [VarCurr] :
      ( v315(VarCurr,bitIndex0)
    <=> v311(VarCurr) ) )).

fof(addAssignment_74,axiom,(
    ! [VarCurr] :
      ( v315(VarCurr,bitIndex1)
    <=> v327(VarCurr) ) )).

fof(addAssignment_73,axiom,(
    ! [VarCurr] :
      ( v315(VarCurr,bitIndex2)
    <=> v323(VarCurr) ) )).

fof(addAssignment_72,axiom,(
    ! [VarCurr] :
      ( v315(VarCurr,bitIndex3)
    <=> v317(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_24,axiom,(
    ! [VarCurr] :
      ( v327(VarCurr)
    <=> ( v328(VarCurr)
        & v329(VarCurr) ) ) )).

fof(writeBinaryOperatorShiftedRanges_9,axiom,(
    ! [VarCurr] :
      ( v329(VarCurr)
    <=> ( v169(VarCurr,bitIndex0)
        | v169(VarCurr,bitIndex1) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_23,axiom,(
    ! [VarCurr] :
      ( v328(VarCurr)
    <=> ( v311(VarCurr)
        | v301(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_22,axiom,(
    ! [VarCurr] :
      ( v323(VarCurr)
    <=> ( v324(VarCurr)
        & v326(VarCurr) ) ) )).

fof(writeBinaryOperatorShiftedRanges_8,axiom,(
    ! [VarCurr] :
      ( v326(VarCurr)
    <=> ( v169(VarCurr,bitIndex2)
        | v321(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_21,axiom,(
    ! [VarCurr] :
      ( v324(VarCurr)
    <=> ( v302(VarCurr)
        | v325(VarCurr) ) ) )).

fof(writeUnaryOperator_15,axiom,(
    ! [VarCurr] :
      ( ~ v325(VarCurr)
    <=> v321(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_20,axiom,(
    ! [VarCurr] :
      ( v317(VarCurr)
    <=> ( v318(VarCurr)
        & v322(VarCurr) ) ) )).

fof(writeBinaryOperatorShiftedRanges_7,axiom,(
    ! [VarCurr] :
      ( v322(VarCurr)
    <=> ( v169(VarCurr,bitIndex3)
        | v320(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_19,axiom,(
    ! [VarCurr] :
      ( v318(VarCurr)
    <=> ( v304(VarCurr)
        | v319(VarCurr) ) ) )).

fof(writeUnaryOperator_14,axiom,(
    ! [VarCurr] :
      ( ~ v319(VarCurr)
    <=> v320(VarCurr) ) )).

fof(writeBinaryOperatorShiftedRanges_6,axiom,(
    ! [VarCurr] :
      ( v320(VarCurr)
    <=> ( v169(VarCurr,bitIndex2)
        & v321(VarCurr) ) ) )).

fof(writeBinaryOperatorShiftedRanges_5,axiom,(
    ! [VarCurr] :
      ( v321(VarCurr)
    <=> ( v169(VarCurr,bitIndex0)
        & v169(VarCurr,bitIndex1) ) ) )).

fof(addBitVectorEqualityBitBlasted_8,axiom,(
    ! [VarCurr] :
      ( v313(VarCurr)
    <=> ( ( v314(VarCurr,bitIndex1)
        <=> $true )
        & ( v314(VarCurr,bitIndex0)
        <=> $false ) ) ) )).

fof(bitBlastConstant_15,axiom,(
    b10(bitIndex1) )).

fof(bitBlastConstant_14,axiom,(
    ~ b10(bitIndex0) )).

fof(addAssignment_71,axiom,(
    ! [VarCurr] :
      ( v314(VarCurr,bitIndex0)
    <=> v272(VarCurr) ) )).

fof(addAssignment_70,axiom,(
    ! [VarCurr] :
      ( v314(VarCurr,bitIndex1)
    <=> v174(VarCurr) ) )).

fof(addAssignment_69,axiom,(
    ! [VarCurr] :
      ( v292(VarCurr,bitIndex0)
    <=> v311(VarCurr) ) )).

fof(addAssignment_68,axiom,(
    ! [VarCurr] :
      ( v292(VarCurr,bitIndex1)
    <=> v309(VarCurr) ) )).

fof(addAssignment_67,axiom,(
    ! [VarCurr] :
      ( v292(VarCurr,bitIndex2)
    <=> v305(VarCurr) ) )).

fof(addAssignment_66,axiom,(
    ! [VarCurr] :
      ( v292(VarCurr,bitIndex3)
    <=> v294(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_18,axiom,(
    ! [VarCurr] :
      ( v309(VarCurr)
    <=> ( v310(VarCurr)
        & v312(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_17,axiom,(
    ! [VarCurr] :
      ( v312(VarCurr)
    <=> ( v169(VarCurr,bitIndex0)
        | v301(VarCurr) ) ) )).

fof(writeBinaryOperatorShiftedRanges_4,axiom,(
    ! [VarCurr] :
      ( v310(VarCurr)
    <=> ( v311(VarCurr)
        | v169(VarCurr,bitIndex1) ) ) )).

fof(writeUnaryOperator_13,axiom,(
    ! [VarCurr] :
      ( ~ v311(VarCurr)
    <=> v169(VarCurr,bitIndex0) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_16,axiom,(
    ! [VarCurr] :
      ( v305(VarCurr)
    <=> ( v306(VarCurr)
        & v308(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_15,axiom,(
    ! [VarCurr] :
      ( v308(VarCurr)
    <=> ( v299(VarCurr)
        | v302(VarCurr) ) ) )).

fof(writeBinaryOperatorShiftedRanges_3,axiom,(
    ! [VarCurr] :
      ( v306(VarCurr)
    <=> ( v307(VarCurr)
        | v169(VarCurr,bitIndex2) ) ) )).

fof(writeUnaryOperator_12,axiom,(
    ! [VarCurr] :
      ( ~ v307(VarCurr)
    <=> v299(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_14,axiom,(
    ! [VarCurr] :
      ( v294(VarCurr)
    <=> ( v295(VarCurr)
        & v303(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_13,axiom,(
    ! [VarCurr] :
      ( v303(VarCurr)
    <=> ( v297(VarCurr)
        | v304(VarCurr) ) ) )).

fof(writeUnaryOperator_11,axiom,(
    ! [VarCurr] :
      ( ~ v304(VarCurr)
    <=> v169(VarCurr,bitIndex3) ) )).

fof(writeBinaryOperatorShiftedRanges_2,axiom,(
    ! [VarCurr] :
      ( v295(VarCurr)
    <=> ( v296(VarCurr)
        | v169(VarCurr,bitIndex3) ) ) )).

fof(writeUnaryOperator_10,axiom,(
    ! [VarCurr] :
      ( ~ v296(VarCurr)
    <=> v297(VarCurr) ) )).

fof(writeBinaryOperatorShiftedRanges_1,axiom,(
    ! [VarCurr] :
      ( v297(VarCurr)
    <=> ( v169(VarCurr,bitIndex2)
        | v298(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_12,axiom,(
    ! [VarCurr] :
      ( v298(VarCurr)
    <=> ( v299(VarCurr)
        & v302(VarCurr) ) ) )).

fof(writeUnaryOperator_9,axiom,(
    ! [VarCurr] :
      ( ~ v302(VarCurr)
    <=> v169(VarCurr,bitIndex2) ) )).

fof(writeBinaryOperatorShiftedRanges,axiom,(
    ! [VarCurr] :
      ( v299(VarCurr)
    <=> ( v169(VarCurr,bitIndex1)
        | v300(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_11,axiom,(
    ! [VarCurr] :
      ( v300(VarCurr)
    <=> ( v169(VarCurr,bitIndex0)
        & v301(VarCurr) ) ) )).

fof(writeUnaryOperator_8,axiom,(
    ! [VarCurr] :
      ( ~ v301(VarCurr)
    <=> v169(VarCurr,bitIndex1) ) )).

fof(addBitVectorEqualityBitBlasted_7,axiom,(
    ! [VarCurr] :
      ( v290(VarCurr)
    <=> ( ( v291(VarCurr,bitIndex1)
        <=> $false )
        & ( v291(VarCurr,bitIndex0)
        <=> $true ) ) ) )).

fof(addAssignment_65,axiom,(
    ! [VarCurr] :
      ( v291(VarCurr,bitIndex0)
    <=> v272(VarCurr) ) )).

fof(addAssignment_64,axiom,(
    ! [VarCurr] :
      ( v291(VarCurr,bitIndex1)
    <=> v174(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_10,axiom,(
    ! [VarCurr] :
      ( v272(VarCurr)
    <=> ( v165(VarCurr)
        | v274(VarCurr) ) ) )).

fof(aaddConditionBooleanCondEqualRangesElseBranch_3,axiom,(
    ! [VarCurr] :
      ( ~ v276(VarCurr)
     => ( v274(VarCurr)
      <=> $false ) ) )).

fof(addConditionBooleanCondEqualRangesThenBranch_3,axiom,(
    ! [VarCurr] :
      ( v276(VarCurr)
     => ( v274(VarCurr)
      <=> v285(VarCurr) ) ) )).

fof(addParallelCaseBooleanConditionEqualRanges1_1,axiom,(
    ! [VarCurr] :
      ( ~ v278(VarCurr)
     => ( v285(VarCurr)
      <=> $false ) ) )).

fof(addParallelCaseBooleanConditionEqualRanges0_1,axiom,(
    ! [VarCurr] :
      ( v278(VarCurr)
     => ( v285(VarCurr)
      <=> v286(VarCurr) ) ) )).

fof(aaddConditionBooleanCondEqualRangesElseBranch_2,axiom,(
    ! [VarCurr] :
      ( ~ v167(VarCurr)
     => ( v286(VarCurr)
      <=> $false ) ) )).

fof(addConditionBooleanCondEqualRangesThenBranch_2,axiom,(
    ! [VarCurr] :
      ( v167(VarCurr)
     => ( v286(VarCurr)
      <=> $true ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_9,axiom,(
    ! [VarCurr] :
      ( v276(VarCurr)
    <=> ( v277(VarCurr)
        & v282(VarCurr) ) ) )).

fof(writeUnaryOperator_7,axiom,(
    ! [VarCurr] :
      ( ~ v282(VarCurr)
    <=> v283(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_8,axiom,(
    ! [VarCurr] :
      ( v283(VarCurr)
    <=> ( v284(VarCurr)
        & v167(VarCurr) ) ) )).

fof(writeUnaryOperator_6,axiom,(
    ! [VarCurr] :
      ( ~ v284(VarCurr)
    <=> v130(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_7,axiom,(
    ! [VarCurr] :
      ( v277(VarCurr)
    <=> ( v278(VarCurr)
        | v281(VarCurr) ) ) )).

fof(writeUnaryOperator_5,axiom,(
    ! [VarCurr] :
      ( ~ v281(VarCurr)
    <=> v280(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_6,axiom,(
    ! [VarCurr] :
      ( v278(VarCurr)
    <=> ( v279(VarCurr)
        & v280(VarCurr) ) ) )).

fof(writeUnaryOperator_4,axiom,(
    ! [VarCurr] :
      ( ~ v280(VarCurr)
    <=> v99(VarCurr) ) )).

fof(addBitVectorEqualityBitBlasted_6,axiom,(
    ! [VarCurr] :
      ( v279(VarCurr)
    <=> ( ( v97(VarCurr,bitIndex1)
        <=> $false )
        & ( v97(VarCurr,bitIndex0)
        <=> $true ) ) ) )).

fof(bitBlastConstant_13,axiom,(
    ~ b01(bitIndex1) )).

fof(bitBlastConstant_12,axiom,(
    b01(bitIndex0) )).

fof(addAssignment_63,axiom,(
    ! [VarCurr] :
      ( v174(VarCurr)
    <=> v176(VarCurr) ) )).

fof(addAssignment_62,axiom,(
    ! [VarCurr] :
      ( v176(VarCurr)
    <=> v178(VarCurr) ) )).

fof(addAssignment_61,axiom,(
    ! [VarCurr] :
      ( v178(VarCurr)
    <=> v180(VarCurr) ) )).

fof(aaddConditionBooleanCondEqualRangesElseBranch_1,axiom,(
    ! [VarCurr] :
      ( ~ v263(VarCurr)
     => ( v180(VarCurr)
      <=> $false ) ) )).

fof(addConditionBooleanCondEqualRangesThenBranch_1,axiom,(
    ! [VarCurr] :
      ( v263(VarCurr)
     => ( v180(VarCurr)
      <=> v270(VarCurr) ) ) )).

fof(addParallelCaseBooleanConditionEqualRanges1,axiom,(
    ! [VarCurr] :
      ( ~ v264(VarCurr)
     => ( v270(VarCurr)
      <=> $false ) ) )).

fof(addParallelCaseBooleanConditionEqualRanges0,axiom,(
    ! [VarCurr] :
      ( v264(VarCurr)
     => ( v270(VarCurr)
      <=> $true ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_5,axiom,(
    ! [VarCurr] :
      ( v263(VarCurr)
    <=> ( v264(VarCurr)
        | v266(VarCurr) ) ) )).

fof(writeUnaryOperator_3,axiom,(
    ! [VarCurr] :
      ( ~ v266(VarCurr)
    <=> v267(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_4,axiom,(
    ! [VarCurr] :
      ( v267(VarCurr)
    <=> ( v268(VarCurr)
        | v264(VarCurr) ) ) )).

fof(addBitVectorEqualityBitBlasted_5,axiom,(
    ! [VarCurr] :
      ( v268(VarCurr)
    <=> ( ( v269(VarCurr,bitIndex2)
        <=> $false )
        & ( v269(VarCurr,bitIndex1)
        <=> $false )
        & ( v269(VarCurr,bitIndex0)
        <=> $true ) ) ) )).

fof(bitBlastConstant_11,axiom,(
    ~ b001(bitIndex2) )).

fof(bitBlastConstant_10,axiom,(
    ~ b001(bitIndex1) )).

fof(bitBlastConstant_9,axiom,(
    b001(bitIndex0) )).

fof(addAssignment_60,axiom,(
    ! [VarCurr] :
      ( v269(VarCurr,bitIndex0)
    <=> v244(VarCurr) ) )).

fof(addAssignment_59,axiom,(
    ! [VarCurr] :
      ( v269(VarCurr,bitIndex1)
    <=> v219(VarCurr) ) )).

fof(addAssignment_58,axiom,(
    ! [VarCurr] :
      ( v269(VarCurr,bitIndex2)
    <=> v182(VarCurr) ) )).

fof(addBitVectorEqualityBitBlasted_4,axiom,(
    ! [VarCurr] :
      ( v264(VarCurr)
    <=> ( ( v265(VarCurr,bitIndex2)
        <=> $false )
        & ( v265(VarCurr,bitIndex1)
        <=> $true )
        & ( v265(VarCurr,bitIndex0)
        <=> $false ) ) ) )).

fof(bitBlastConstant_8,axiom,(
    ~ b010(bitIndex2) )).

fof(bitBlastConstant_7,axiom,(
    b010(bitIndex1) )).

fof(bitBlastConstant_6,axiom,(
    ~ b010(bitIndex0) )).

fof(addAssignment_57,axiom,(
    ! [VarCurr] :
      ( v265(VarCurr,bitIndex0)
    <=> v244(VarCurr) ) )).

fof(addAssignment_56,axiom,(
    ! [VarCurr] :
      ( v265(VarCurr,bitIndex1)
    <=> v219(VarCurr) ) )).

fof(addAssignment_55,axiom,(
    ! [VarCurr] :
      ( v265(VarCurr,bitIndex2)
    <=> v182(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_3,axiom,(
    ! [VarCurr] :
      ( v244(VarCurr)
    <=> ( v258(VarCurr)
        & v259(VarCurr) ) ) )).

fof(writeUnaryOperator_2,axiom,(
    ! [VarCurr] :
      ( ~ v259(VarCurr)
    <=> v254(VarCurr) ) )).

fof(addBitVectorEqualityBitBlasted_3,axiom,(
    ! [VarCurr] :
      ( v258(VarCurr)
    <=> ( ( v221(VarCurr,bitIndex7)
        <=> v246(VarCurr,bitIndex7) )
        & ( v221(VarCurr,bitIndex6)
        <=> v246(VarCurr,bitIndex6) )
        & ( v221(VarCurr,bitIndex5)
        <=> v246(VarCurr,bitIndex5) )
        & ( v221(VarCurr,bitIndex4)
        <=> v246(VarCurr,bitIndex4) )
        & ( v221(VarCurr,bitIndex3)
        <=> v246(VarCurr,bitIndex3) )
        & ( v221(VarCurr,bitIndex2)
        <=> v246(VarCurr,bitIndex2) )
        & ( v221(VarCurr,bitIndex1)
        <=> v246(VarCurr,bitIndex1) )
        & ( v221(VarCurr,bitIndex0)
        <=> v246(VarCurr,bitIndex0) ) ) ) )).

fof(addAssignment_54,axiom,(
    ! [VarCurr] :
      ( v254(VarCurr)
    <=> v256(VarCurr) ) )).

fof(addAssignment_53,axiom,(
    ! [VarCurr,B] :
      ( range_7_0(B)
     => ( v246(VarCurr,B)
      <=> v248(VarCurr,B) ) ) )).

fof(addAssignment_52,axiom,(
    ! [VarCurr,B] :
      ( range_7_0(B)
     => ( v248(VarCurr,B)
      <=> v250(VarCurr,B) ) ) )).

fof(addAssignment_51,axiom,(
    ! [VarCurr] :
      ( ( v250(VarCurr,bitIndex7)
      <=> v252(VarCurr,bitIndex400) )
      & ( v250(VarCurr,bitIndex6)
      <=> v252(VarCurr,bitIndex399) )
      & ( v250(VarCurr,bitIndex5)
      <=> v252(VarCurr,bitIndex398) )
      & ( v250(VarCurr,bitIndex4)
      <=> v252(VarCurr,bitIndex397) )
      & ( v250(VarCurr,bitIndex3)
      <=> v252(VarCurr,bitIndex396) )
      & ( v250(VarCurr,bitIndex2)
      <=> v252(VarCurr,bitIndex395) )
      & ( v250(VarCurr,bitIndex1)
      <=> v252(VarCurr,bitIndex394) )
      & ( v250(VarCurr,bitIndex0)
      <=> v252(VarCurr,bitIndex393) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_2,axiom,(
    ! [VarCurr] :
      ( v219(VarCurr)
    <=> ( v241(VarCurr)
        & v242(VarCurr) ) ) )).

fof(writeUnaryOperator_1,axiom,(
    ! [VarCurr] :
      ( ~ v242(VarCurr)
    <=> v234(VarCurr) ) )).

fof(addBitVectorEqualityBitBlasted_2,axiom,(
    ! [VarCurr] :
      ( v241(VarCurr)
    <=> ( ( v221(VarCurr,bitIndex7)
        <=> v223(VarCurr,bitIndex7) )
        & ( v221(VarCurr,bitIndex6)
        <=> v223(VarCurr,bitIndex6) )
        & ( v221(VarCurr,bitIndex5)
        <=> v223(VarCurr,bitIndex5) )
        & ( v221(VarCurr,bitIndex4)
        <=> v223(VarCurr,bitIndex4) )
        & ( v221(VarCurr,bitIndex3)
        <=> v223(VarCurr,bitIndex3) )
        & ( v221(VarCurr,bitIndex2)
        <=> v223(VarCurr,bitIndex2) )
        & ( v221(VarCurr,bitIndex1)
        <=> v223(VarCurr,bitIndex1) )
        & ( v221(VarCurr,bitIndex0)
        <=> v223(VarCurr,bitIndex0) ) ) ) )).

fof(addAssignment_50,axiom,(
    ! [VarCurr] :
      ( v234(VarCurr)
    <=> v236(VarCurr) ) )).

fof(addBitVectorEqualityBitBlasted_1,axiom,(
    ! [VarCurr] :
      ( v236(VarCurr)
    <=> ( ( v238(VarCurr,bitIndex3)
        <=> $false )
        & ( v238(VarCurr,bitIndex2)
        <=> $false )
        & ( v238(VarCurr,bitIndex1)
        <=> $false )
        & ( v238(VarCurr,bitIndex0)
        <=> $false ) ) ) )).

fof(bitBlastConstant_5,axiom,(
    ~ b0000(bitIndex3) )).

fof(bitBlastConstant_4,axiom,(
    ~ b0000(bitIndex2) )).

fof(bitBlastConstant_3,axiom,(
    ~ b0000(bitIndex1) )).

fof(bitBlastConstant_2,axiom,(
    ~ b0000(bitIndex0) )).

fof(addAssignment_49,axiom,(
    ! [VarCurr,B] :
      ( range_7_0(B)
     => ( v223(VarCurr,B)
      <=> v225(VarCurr,B) ) ) )).

fof(addAssignment_48,axiom,(
    ! [VarCurr,B] :
      ( range_7_0(B)
     => ( v225(VarCurr,B)
      <=> v227(VarCurr,B) ) ) )).

fof(addAssignment_47,axiom,(
    ! [VarCurr,B] :
      ( range_7_0(B)
     => ( v227(VarCurr,B)
      <=> v232(VarCurr,B) ) ) )).

fof(range_axiom,axiom,(
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

fof(addAssignment_46,axiom,(
    ! [VarCurr] :
      ( v182(VarCurr)
    <=> v184(VarCurr) ) )).

fof(addAssignment_45,axiom,(
    ! [VarCurr] :
      ( v184(VarCurr)
    <=> v186(VarCurr) ) )).

fof(addAssignment_44,axiom,(
    ! [VarCurr] :
      ( v186(VarCurr)
    <=> v188(VarCurr) ) )).

fof(addAssignment_43,axiom,(
    ! [VarCurr] :
      ( v188(VarCurr)
    <=> v190(VarCurr) ) )).

fof(addAssignment_42,axiom,(
    ! [VarCurr] :
      ( v190(VarCurr)
    <=> v192(VarCurr) ) )).

fof(addAssignment_41,axiom,(
    ! [VarCurr] :
      ( v192(VarCurr)
    <=> v194(VarCurr) ) )).

fof(addAssignment_40,axiom,(
    ! [VarCurr] :
      ( v194(VarCurr)
    <=> v196(VarCurr) ) )).

fof(addAssignment_39,axiom,(
    ! [VarCurr] :
      ( v196(VarCurr)
    <=> v198(VarCurr) ) )).

fof(addAssignment_38,axiom,(
    ! [VarCurr] :
      ( v198(VarCurr)
    <=> v200(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_1,axiom,(
    ! [VarCurr] :
      ( v200(VarCurr)
    <=> ( v202(VarCurr)
        | v210(VarCurr) ) ) )).

fof(addAssignment_37,axiom,(
    ! [VarCurr] :
      ( v210(VarCurr)
    <=> v212(VarCurr,bitIndex6) ) )).

fof(addAssignment_36,axiom,(
    ! [VarCurr] :
      ( v212(VarCurr,bitIndex6)
    <=> v214(VarCurr,bitIndex6) ) )).

fof(addAssignment_35,axiom,(
    ! [VarCurr] :
      ( v214(VarCurr,bitIndex6)
    <=> v216(VarCurr,bitIndex6) ) )).

fof(addAssignment_34,axiom,(
    ! [VarCurr] :
      ( v202(VarCurr)
    <=> v204(VarCurr,bitIndex2) ) )).

fof(addAssignment_33,axiom,(
    ! [VarCurr] :
      ( v204(VarCurr,bitIndex2)
    <=> v206(VarCurr,bitIndex2) ) )).

fof(addAssignment_32,axiom,(
    ! [VarCurr] :
      ( v206(VarCurr,bitIndex2)
    <=> v208(VarCurr,bitIndex2) ) )).

fof(addAssignment_31,axiom,(
    ! [VarCurr] :
      ( v141(VarCurr)
    <=> v143(VarCurr) ) )).

fof(addAssignment_30,axiom,(
    ! [VarCurr] :
      ( v143(VarCurr)
    <=> v145(VarCurr) ) )).

fof(addAssignment_29,axiom,(
    ! [VarCurr] :
      ( v145(VarCurr)
    <=> v147(VarCurr) ) )).

fof(addAssignment_28,axiom,(
    ! [VarCurr] :
      ( v147(VarCurr)
    <=> v149(VarCurr) ) )).

fof(addAssignment_27,axiom,(
    ! [VarCurr] :
      ( v149(VarCurr)
    <=> v151(VarCurr) ) )).

fof(addAssignment_26,axiom,(
    ! [VarCurr] :
      ( v151(VarCurr)
    <=> v153(VarCurr) ) )).

fof(addAssignment_25,axiom,(
    ! [VarCurr] :
      ( v153(VarCurr)
    <=> v155(VarCurr) ) )).

fof(addBitVectorEqualityBitBlasted,axiom,(
    ! [VarCurr] :
      ( v155(VarCurr)
    <=> ( ( v157(VarCurr,bitIndex1)
        <=> $true )
        & ( v157(VarCurr,bitIndex0)
        <=> $true ) ) ) )).

fof(bitBlastConstant_1,axiom,(
    b11(bitIndex1) )).

fof(bitBlastConstant,axiom,(
    b11(bitIndex0) )).

fof(addAssignment_24,axiom,(
    ! [VarCurr] :
      ( v136(VarCurr)
    <=> v91(VarCurr) ) )).

fof(addAssignment_23,axiom,(
    ! [VarCurr] :
      ( v105(VarCurr)
    <=> v107(VarCurr) ) )).

fof(addAssignment_22,axiom,(
    ! [VarCurr] :
      ( v107(VarCurr)
    <=> v109(VarCurr) ) )).

fof(addAssignment_21,axiom,(
    ! [VarCurr] :
      ( v109(VarCurr)
    <=> v111(VarCurr) ) )).

fof(addAssignment_20,axiom,(
    ! [VarCurr] :
      ( v111(VarCurr)
    <=> v113(VarCurr) ) )).

fof(addAssignment_19,axiom,(
    ! [VarCurr] :
      ( v113(VarCurr)
    <=> v115(VarCurr) ) )).

fof(addAssignment_18,axiom,(
    ! [VarCurr] :
      ( v115(VarCurr)
    <=> v117(VarCurr) ) )).

fof(addAssignment_17,axiom,(
    ! [VarCurr] :
      ( v117(VarCurr)
    <=> v119(VarCurr) ) )).

fof(addAssignment_16,axiom,(
    ! [VarCurr] :
      ( v119(VarCurr)
    <=> v121(VarCurr,bitIndex1) ) )).

fof(addAssignment_15,axiom,(
    ! [VarCurr] :
      ( v103(VarCurr)
    <=> v91(VarCurr) ) )).

fof(addAssignment_14,axiom,(
    ! [VarCurr] :
      ( v91(VarCurr)
    <=> v93(VarCurr) ) )).

fof(addAssignment_13,axiom,(
    ! [VarCurr] :
      ( v93(VarCurr)
    <=> v16(VarCurr) ) )).

fof(addAssignment_12,axiom,(
    ! [VarCurr] :
      ( v44(VarCurr)
    <=> v46(VarCurr) ) )).

fof(aaddConditionBooleanCondEqualRangesElseBranch,axiom,(
    ! [VarCurr] :
      ( ~ v64(VarCurr)
     => ( v46(VarCurr)
      <=> $false ) ) )).

fof(addConditionBooleanCondEqualRangesThenBranch,axiom,(
    ! [VarCurr] :
      ( v64(VarCurr)
     => ( v46(VarCurr)
      <=> $true ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits,axiom,(
    ! [VarCurr] :
      ( v64(VarCurr)
    <=> ( v65(VarCurr)
        & v56(VarCurr) ) ) )).

fof(writeUnaryOperator,axiom,(
    ! [VarCurr] :
      ( ~ v65(VarCurr)
    <=> v48(VarCurr,bitIndex8) ) )).

fof(addAssignment_11,axiom,(
    ! [VarCurr] :
      ( v56(VarCurr)
    <=> v58(VarCurr) ) )).

fof(addAssignment_10,axiom,(
    ! [VarCurr] :
      ( v58(VarCurr)
    <=> v60(VarCurr) ) )).

fof(addAssignment_9,axiom,(
    ! [VarCurr] :
      ( v60(VarCurr)
    <=> v62(VarCurr) ) )).

fof(addAssignment_8,axiom,(
    ! [VarCurr] :
      ( v48(VarCurr,bitIndex8)
    <=> v50(VarCurr,bitIndex8) ) )).

fof(addAssignment_7,axiom,(
    ! [VarCurr] :
      ( v50(VarCurr,bitIndex8)
    <=> v52(VarCurr,bitIndex8) ) )).

fof(addAssignment_6,axiom,(
    ! [VarCurr] :
      ( v52(VarCurr,bitIndex8)
    <=> v54(VarCurr,bitIndex8) ) )).

fof(addAssignment_5,axiom,(
    ! [VarCurr] :
      ( v39(VarCurr)
    <=> v12(VarCurr) ) )).

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
