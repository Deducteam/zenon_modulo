%------------------------------------------------------------------------------
% File     : HWV089+1 : TPTP v6.1.0. Released v6.1.0.
% Domain   : Hardware Verification
% Problem  : dmu_dmc property 4 cone of influence 5_b20
% Version  : Especial.
% English  : Verification of a property of the SPARCT2 RTL hardware design.

% Refs     : [Kha14] Khasidashvili (2014), Email to Geoff Sutcliffe
% Source   : [Kha14]
% Names    : dmu_dmc_prop4_cone5_b20 [Kha14]

% Status   : Theorem
% Rating   : 0.00 v6.1.0
% Syntax   : Number of formulae    : 6279 ( 989 unit)
%            Number of atoms       : 17160 ( 671 equality)
%            Maximal formula depth :   70 (   4 average)
%            Number of connectives : 12064 (1183   ~;1119   |;2006   &)
%                                         (6511 <=>;1244  =>;   0  <=;   1 <~>)
%                                         (   0  ~|;   0  ~&)
%            Number of predicates  : 2562 (   2 propositional; 0-3 arity)
%            Number of functors    :  188 ( 188 constant; 0-0 arity)
%            Number of variables   : 6046 (   0 sgn;6046   !;   0   ?)
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

fof(transient_address_definition_83,axiom,(
    ! [B] :
      ( addressVal(v1019_range_3_to_0_address_term_bound_20,B)
    <=> v1019(constB20,B) ) )).

fof(is_address_99,axiom,(
    address(v1019_range_3_to_0_address_term_bound_20) )).

fof(address_association_83,axiom,(
    v1019_range_3_to_0_address_association(constB20,v1019_range_3_to_0_address_term_bound_20) )).

fof(transient_address_definition_82,axiom,(
    ! [B] :
      ( addressVal(v1019_range_3_to_0_address_term_bound_19,B)
    <=> v1019(constB19,B) ) )).

fof(is_address_98,axiom,(
    address(v1019_range_3_to_0_address_term_bound_19) )).

fof(address_association_82,axiom,(
    v1019_range_3_to_0_address_association(constB19,v1019_range_3_to_0_address_term_bound_19) )).

fof(transient_address_definition_81,axiom,(
    ! [B] :
      ( addressVal(v1019_range_3_to_0_address_term_bound_18,B)
    <=> v1019(constB18,B) ) )).

fof(is_address_97,axiom,(
    address(v1019_range_3_to_0_address_term_bound_18) )).

fof(address_association_81,axiom,(
    v1019_range_3_to_0_address_association(constB18,v1019_range_3_to_0_address_term_bound_18) )).

fof(transient_address_definition_80,axiom,(
    ! [B] :
      ( addressVal(v1019_range_3_to_0_address_term_bound_17,B)
    <=> v1019(constB17,B) ) )).

fof(is_address_96,axiom,(
    address(v1019_range_3_to_0_address_term_bound_17) )).

fof(address_association_80,axiom,(
    v1019_range_3_to_0_address_association(constB17,v1019_range_3_to_0_address_term_bound_17) )).

fof(transient_address_definition_79,axiom,(
    ! [B] :
      ( addressVal(v1019_range_3_to_0_address_term_bound_16,B)
    <=> v1019(constB16,B) ) )).

fof(is_address_95,axiom,(
    address(v1019_range_3_to_0_address_term_bound_16) )).

fof(address_association_79,axiom,(
    v1019_range_3_to_0_address_association(constB16,v1019_range_3_to_0_address_term_bound_16) )).

fof(transient_address_definition_78,axiom,(
    ! [B] :
      ( addressVal(v1019_range_3_to_0_address_term_bound_15,B)
    <=> v1019(constB15,B) ) )).

fof(is_address_94,axiom,(
    address(v1019_range_3_to_0_address_term_bound_15) )).

fof(address_association_78,axiom,(
    v1019_range_3_to_0_address_association(constB15,v1019_range_3_to_0_address_term_bound_15) )).

fof(transient_address_definition_77,axiom,(
    ! [B] :
      ( addressVal(v1019_range_3_to_0_address_term_bound_14,B)
    <=> v1019(constB14,B) ) )).

fof(is_address_93,axiom,(
    address(v1019_range_3_to_0_address_term_bound_14) )).

fof(address_association_77,axiom,(
    v1019_range_3_to_0_address_association(constB14,v1019_range_3_to_0_address_term_bound_14) )).

fof(transient_address_definition_76,axiom,(
    ! [B] :
      ( addressVal(v1019_range_3_to_0_address_term_bound_13,B)
    <=> v1019(constB13,B) ) )).

fof(is_address_92,axiom,(
    address(v1019_range_3_to_0_address_term_bound_13) )).

fof(address_association_76,axiom,(
    v1019_range_3_to_0_address_association(constB13,v1019_range_3_to_0_address_term_bound_13) )).

fof(transient_address_definition_75,axiom,(
    ! [B] :
      ( addressVal(v1019_range_3_to_0_address_term_bound_12,B)
    <=> v1019(constB12,B) ) )).

fof(is_address_91,axiom,(
    address(v1019_range_3_to_0_address_term_bound_12) )).

fof(address_association_75,axiom,(
    v1019_range_3_to_0_address_association(constB12,v1019_range_3_to_0_address_term_bound_12) )).

fof(transient_address_definition_74,axiom,(
    ! [B] :
      ( addressVal(v1019_range_3_to_0_address_term_bound_11,B)
    <=> v1019(constB11,B) ) )).

fof(is_address_90,axiom,(
    address(v1019_range_3_to_0_address_term_bound_11) )).

fof(address_association_74,axiom,(
    v1019_range_3_to_0_address_association(constB11,v1019_range_3_to_0_address_term_bound_11) )).

fof(transient_address_definition_73,axiom,(
    ! [B] :
      ( addressVal(v1019_range_3_to_0_address_term_bound_10,B)
    <=> v1019(constB10,B) ) )).

fof(is_address_89,axiom,(
    address(v1019_range_3_to_0_address_term_bound_10) )).

fof(address_association_73,axiom,(
    v1019_range_3_to_0_address_association(constB10,v1019_range_3_to_0_address_term_bound_10) )).

fof(transient_address_definition_72,axiom,(
    ! [B] :
      ( addressVal(v1019_range_3_to_0_address_term_bound_9,B)
    <=> v1019(constB9,B) ) )).

fof(is_address_88,axiom,(
    address(v1019_range_3_to_0_address_term_bound_9) )).

fof(address_association_72,axiom,(
    v1019_range_3_to_0_address_association(constB9,v1019_range_3_to_0_address_term_bound_9) )).

fof(transient_address_definition_71,axiom,(
    ! [B] :
      ( addressVal(v1019_range_3_to_0_address_term_bound_8,B)
    <=> v1019(constB8,B) ) )).

fof(is_address_87,axiom,(
    address(v1019_range_3_to_0_address_term_bound_8) )).

fof(address_association_71,axiom,(
    v1019_range_3_to_0_address_association(constB8,v1019_range_3_to_0_address_term_bound_8) )).

fof(transient_address_definition_70,axiom,(
    ! [B] :
      ( addressVal(v1019_range_3_to_0_address_term_bound_7,B)
    <=> v1019(constB7,B) ) )).

fof(is_address_86,axiom,(
    address(v1019_range_3_to_0_address_term_bound_7) )).

fof(address_association_70,axiom,(
    v1019_range_3_to_0_address_association(constB7,v1019_range_3_to_0_address_term_bound_7) )).

fof(transient_address_definition_69,axiom,(
    ! [B] :
      ( addressVal(v1019_range_3_to_0_address_term_bound_6,B)
    <=> v1019(constB6,B) ) )).

fof(is_address_85,axiom,(
    address(v1019_range_3_to_0_address_term_bound_6) )).

fof(address_association_69,axiom,(
    v1019_range_3_to_0_address_association(constB6,v1019_range_3_to_0_address_term_bound_6) )).

fof(transient_address_definition_68,axiom,(
    ! [B] :
      ( addressVal(v1019_range_3_to_0_address_term_bound_5,B)
    <=> v1019(constB5,B) ) )).

fof(is_address_84,axiom,(
    address(v1019_range_3_to_0_address_term_bound_5) )).

fof(address_association_68,axiom,(
    v1019_range_3_to_0_address_association(constB5,v1019_range_3_to_0_address_term_bound_5) )).

fof(transient_address_definition_67,axiom,(
    ! [B] :
      ( addressVal(v1019_range_3_to_0_address_term_bound_4,B)
    <=> v1019(constB4,B) ) )).

fof(is_address_83,axiom,(
    address(v1019_range_3_to_0_address_term_bound_4) )).

fof(address_association_67,axiom,(
    v1019_range_3_to_0_address_association(constB4,v1019_range_3_to_0_address_term_bound_4) )).

fof(transient_address_definition_66,axiom,(
    ! [B] :
      ( addressVal(v1019_range_3_to_0_address_term_bound_3,B)
    <=> v1019(constB3,B) ) )).

fof(is_address_82,axiom,(
    address(v1019_range_3_to_0_address_term_bound_3) )).

fof(address_association_66,axiom,(
    v1019_range_3_to_0_address_association(constB3,v1019_range_3_to_0_address_term_bound_3) )).

fof(transient_address_definition_65,axiom,(
    ! [B] :
      ( addressVal(v1019_range_3_to_0_address_term_bound_2,B)
    <=> v1019(constB2,B) ) )).

fof(is_address_81,axiom,(
    address(v1019_range_3_to_0_address_term_bound_2) )).

fof(address_association_65,axiom,(
    v1019_range_3_to_0_address_association(constB2,v1019_range_3_to_0_address_term_bound_2) )).

fof(transient_address_definition_64,axiom,(
    ! [B] :
      ( addressVal(v1019_range_3_to_0_address_term_bound_1,B)
    <=> v1019(constB1,B) ) )).

fof(is_address_80,axiom,(
    address(v1019_range_3_to_0_address_term_bound_1) )).

fof(address_association_64,axiom,(
    v1019_range_3_to_0_address_association(constB1,v1019_range_3_to_0_address_term_bound_1) )).

fof(transient_address_definition_63,axiom,(
    ! [B] :
      ( addressVal(v1019_range_3_to_0_address_term_bound_0,B)
    <=> v1019(constB0,B) ) )).

fof(is_address_79,axiom,(
    address(v1019_range_3_to_0_address_term_bound_0) )).

fof(address_association_63,axiom,(
    v1019_range_3_to_0_address_association(constB0,v1019_range_3_to_0_address_term_bound_0) )).

fof(transient_address_definition_62,axiom,(
    ! [B] :
      ( addressVal(v953_range_3_to_0_address_term_bound_20,B)
    <=> v953(constB20,B) ) )).

fof(is_address_78,axiom,(
    address(v953_range_3_to_0_address_term_bound_20) )).

fof(address_association_62,axiom,(
    v953_range_3_to_0_address_association(constB20,v953_range_3_to_0_address_term_bound_20) )).

fof(transient_address_definition_61,axiom,(
    ! [B] :
      ( addressVal(v953_range_3_to_0_address_term_bound_19,B)
    <=> v953(constB19,B) ) )).

fof(is_address_77,axiom,(
    address(v953_range_3_to_0_address_term_bound_19) )).

fof(address_association_61,axiom,(
    v953_range_3_to_0_address_association(constB19,v953_range_3_to_0_address_term_bound_19) )).

fof(transient_address_definition_60,axiom,(
    ! [B] :
      ( addressVal(v953_range_3_to_0_address_term_bound_18,B)
    <=> v953(constB18,B) ) )).

fof(is_address_76,axiom,(
    address(v953_range_3_to_0_address_term_bound_18) )).

fof(address_association_60,axiom,(
    v953_range_3_to_0_address_association(constB18,v953_range_3_to_0_address_term_bound_18) )).

fof(transient_address_definition_59,axiom,(
    ! [B] :
      ( addressVal(v953_range_3_to_0_address_term_bound_17,B)
    <=> v953(constB17,B) ) )).

fof(is_address_75,axiom,(
    address(v953_range_3_to_0_address_term_bound_17) )).

fof(address_association_59,axiom,(
    v953_range_3_to_0_address_association(constB17,v953_range_3_to_0_address_term_bound_17) )).

fof(transient_address_definition_58,axiom,(
    ! [B] :
      ( addressVal(v953_range_3_to_0_address_term_bound_16,B)
    <=> v953(constB16,B) ) )).

fof(is_address_74,axiom,(
    address(v953_range_3_to_0_address_term_bound_16) )).

fof(address_association_58,axiom,(
    v953_range_3_to_0_address_association(constB16,v953_range_3_to_0_address_term_bound_16) )).

fof(transient_address_definition_57,axiom,(
    ! [B] :
      ( addressVal(v953_range_3_to_0_address_term_bound_15,B)
    <=> v953(constB15,B) ) )).

fof(is_address_73,axiom,(
    address(v953_range_3_to_0_address_term_bound_15) )).

fof(address_association_57,axiom,(
    v953_range_3_to_0_address_association(constB15,v953_range_3_to_0_address_term_bound_15) )).

fof(transient_address_definition_56,axiom,(
    ! [B] :
      ( addressVal(v953_range_3_to_0_address_term_bound_14,B)
    <=> v953(constB14,B) ) )).

fof(is_address_72,axiom,(
    address(v953_range_3_to_0_address_term_bound_14) )).

fof(address_association_56,axiom,(
    v953_range_3_to_0_address_association(constB14,v953_range_3_to_0_address_term_bound_14) )).

fof(transient_address_definition_55,axiom,(
    ! [B] :
      ( addressVal(v953_range_3_to_0_address_term_bound_13,B)
    <=> v953(constB13,B) ) )).

fof(is_address_71,axiom,(
    address(v953_range_3_to_0_address_term_bound_13) )).

fof(address_association_55,axiom,(
    v953_range_3_to_0_address_association(constB13,v953_range_3_to_0_address_term_bound_13) )).

fof(transient_address_definition_54,axiom,(
    ! [B] :
      ( addressVal(v953_range_3_to_0_address_term_bound_12,B)
    <=> v953(constB12,B) ) )).

fof(is_address_70,axiom,(
    address(v953_range_3_to_0_address_term_bound_12) )).

fof(address_association_54,axiom,(
    v953_range_3_to_0_address_association(constB12,v953_range_3_to_0_address_term_bound_12) )).

fof(transient_address_definition_53,axiom,(
    ! [B] :
      ( addressVal(v953_range_3_to_0_address_term_bound_11,B)
    <=> v953(constB11,B) ) )).

fof(is_address_69,axiom,(
    address(v953_range_3_to_0_address_term_bound_11) )).

fof(address_association_53,axiom,(
    v953_range_3_to_0_address_association(constB11,v953_range_3_to_0_address_term_bound_11) )).

fof(transient_address_definition_52,axiom,(
    ! [B] :
      ( addressVal(v953_range_3_to_0_address_term_bound_10,B)
    <=> v953(constB10,B) ) )).

fof(is_address_68,axiom,(
    address(v953_range_3_to_0_address_term_bound_10) )).

fof(address_association_52,axiom,(
    v953_range_3_to_0_address_association(constB10,v953_range_3_to_0_address_term_bound_10) )).

fof(transient_address_definition_51,axiom,(
    ! [B] :
      ( addressVal(v953_range_3_to_0_address_term_bound_9,B)
    <=> v953(constB9,B) ) )).

fof(is_address_67,axiom,(
    address(v953_range_3_to_0_address_term_bound_9) )).

fof(address_association_51,axiom,(
    v953_range_3_to_0_address_association(constB9,v953_range_3_to_0_address_term_bound_9) )).

fof(transient_address_definition_50,axiom,(
    ! [B] :
      ( addressVal(v953_range_3_to_0_address_term_bound_8,B)
    <=> v953(constB8,B) ) )).

fof(is_address_66,axiom,(
    address(v953_range_3_to_0_address_term_bound_8) )).

fof(address_association_50,axiom,(
    v953_range_3_to_0_address_association(constB8,v953_range_3_to_0_address_term_bound_8) )).

fof(transient_address_definition_49,axiom,(
    ! [B] :
      ( addressVal(v953_range_3_to_0_address_term_bound_7,B)
    <=> v953(constB7,B) ) )).

fof(is_address_65,axiom,(
    address(v953_range_3_to_0_address_term_bound_7) )).

fof(address_association_49,axiom,(
    v953_range_3_to_0_address_association(constB7,v953_range_3_to_0_address_term_bound_7) )).

fof(transient_address_definition_48,axiom,(
    ! [B] :
      ( addressVal(v953_range_3_to_0_address_term_bound_6,B)
    <=> v953(constB6,B) ) )).

fof(is_address_64,axiom,(
    address(v953_range_3_to_0_address_term_bound_6) )).

fof(address_association_48,axiom,(
    v953_range_3_to_0_address_association(constB6,v953_range_3_to_0_address_term_bound_6) )).

fof(transient_address_definition_47,axiom,(
    ! [B] :
      ( addressVal(v953_range_3_to_0_address_term_bound_5,B)
    <=> v953(constB5,B) ) )).

fof(is_address_63,axiom,(
    address(v953_range_3_to_0_address_term_bound_5) )).

fof(address_association_47,axiom,(
    v953_range_3_to_0_address_association(constB5,v953_range_3_to_0_address_term_bound_5) )).

fof(transient_address_definition_46,axiom,(
    ! [B] :
      ( addressVal(v953_range_3_to_0_address_term_bound_4,B)
    <=> v953(constB4,B) ) )).

fof(is_address_62,axiom,(
    address(v953_range_3_to_0_address_term_bound_4) )).

fof(address_association_46,axiom,(
    v953_range_3_to_0_address_association(constB4,v953_range_3_to_0_address_term_bound_4) )).

fof(transient_address_definition_45,axiom,(
    ! [B] :
      ( addressVal(v953_range_3_to_0_address_term_bound_3,B)
    <=> v953(constB3,B) ) )).

fof(is_address_61,axiom,(
    address(v953_range_3_to_0_address_term_bound_3) )).

fof(address_association_45,axiom,(
    v953_range_3_to_0_address_association(constB3,v953_range_3_to_0_address_term_bound_3) )).

fof(transient_address_definition_44,axiom,(
    ! [B] :
      ( addressVal(v953_range_3_to_0_address_term_bound_2,B)
    <=> v953(constB2,B) ) )).

fof(is_address_60,axiom,(
    address(v953_range_3_to_0_address_term_bound_2) )).

fof(address_association_44,axiom,(
    v953_range_3_to_0_address_association(constB2,v953_range_3_to_0_address_term_bound_2) )).

fof(transient_address_definition_43,axiom,(
    ! [B] :
      ( addressVal(v953_range_3_to_0_address_term_bound_1,B)
    <=> v953(constB1,B) ) )).

fof(is_address_59,axiom,(
    address(v953_range_3_to_0_address_term_bound_1) )).

fof(address_association_43,axiom,(
    v953_range_3_to_0_address_association(constB1,v953_range_3_to_0_address_term_bound_1) )).

fof(transient_address_definition_42,axiom,(
    ! [B] :
      ( addressVal(v953_range_3_to_0_address_term_bound_0,B)
    <=> v953(constB0,B) ) )).

fof(is_address_58,axiom,(
    address(v953_range_3_to_0_address_term_bound_0) )).

fof(address_association_42,axiom,(
    v953_range_3_to_0_address_association(constB0,v953_range_3_to_0_address_term_bound_0) )).

fof(transient_address_definition_41,axiom,(
    ! [B] :
      ( addressVal(v869_range_3_to_0_address_term_bound_20,B)
    <=> v869(constB20,B) ) )).

fof(is_address_57,axiom,(
    address(v869_range_3_to_0_address_term_bound_20) )).

fof(address_association_41,axiom,(
    v869_range_3_to_0_address_association(constB20,v869_range_3_to_0_address_term_bound_20) )).

fof(transient_address_definition_40,axiom,(
    ! [B] :
      ( addressVal(v869_range_3_to_0_address_term_bound_19,B)
    <=> v869(constB19,B) ) )).

fof(is_address_56,axiom,(
    address(v869_range_3_to_0_address_term_bound_19) )).

fof(address_association_40,axiom,(
    v869_range_3_to_0_address_association(constB19,v869_range_3_to_0_address_term_bound_19) )).

fof(transient_address_definition_39,axiom,(
    ! [B] :
      ( addressVal(v869_range_3_to_0_address_term_bound_18,B)
    <=> v869(constB18,B) ) )).

fof(is_address_55,axiom,(
    address(v869_range_3_to_0_address_term_bound_18) )).

fof(address_association_39,axiom,(
    v869_range_3_to_0_address_association(constB18,v869_range_3_to_0_address_term_bound_18) )).

fof(transient_address_definition_38,axiom,(
    ! [B] :
      ( addressVal(v869_range_3_to_0_address_term_bound_17,B)
    <=> v869(constB17,B) ) )).

fof(is_address_54,axiom,(
    address(v869_range_3_to_0_address_term_bound_17) )).

fof(address_association_38,axiom,(
    v869_range_3_to_0_address_association(constB17,v869_range_3_to_0_address_term_bound_17) )).

fof(transient_address_definition_37,axiom,(
    ! [B] :
      ( addressVal(v869_range_3_to_0_address_term_bound_16,B)
    <=> v869(constB16,B) ) )).

fof(is_address_53,axiom,(
    address(v869_range_3_to_0_address_term_bound_16) )).

fof(address_association_37,axiom,(
    v869_range_3_to_0_address_association(constB16,v869_range_3_to_0_address_term_bound_16) )).

fof(transient_address_definition_36,axiom,(
    ! [B] :
      ( addressVal(v869_range_3_to_0_address_term_bound_15,B)
    <=> v869(constB15,B) ) )).

fof(is_address_52,axiom,(
    address(v869_range_3_to_0_address_term_bound_15) )).

fof(address_association_36,axiom,(
    v869_range_3_to_0_address_association(constB15,v869_range_3_to_0_address_term_bound_15) )).

fof(transient_address_definition_35,axiom,(
    ! [B] :
      ( addressVal(v869_range_3_to_0_address_term_bound_14,B)
    <=> v869(constB14,B) ) )).

fof(is_address_51,axiom,(
    address(v869_range_3_to_0_address_term_bound_14) )).

fof(address_association_35,axiom,(
    v869_range_3_to_0_address_association(constB14,v869_range_3_to_0_address_term_bound_14) )).

fof(transient_address_definition_34,axiom,(
    ! [B] :
      ( addressVal(v869_range_3_to_0_address_term_bound_13,B)
    <=> v869(constB13,B) ) )).

fof(is_address_50,axiom,(
    address(v869_range_3_to_0_address_term_bound_13) )).

fof(address_association_34,axiom,(
    v869_range_3_to_0_address_association(constB13,v869_range_3_to_0_address_term_bound_13) )).

fof(transient_address_definition_33,axiom,(
    ! [B] :
      ( addressVal(v869_range_3_to_0_address_term_bound_12,B)
    <=> v869(constB12,B) ) )).

fof(is_address_49,axiom,(
    address(v869_range_3_to_0_address_term_bound_12) )).

fof(address_association_33,axiom,(
    v869_range_3_to_0_address_association(constB12,v869_range_3_to_0_address_term_bound_12) )).

fof(transient_address_definition_32,axiom,(
    ! [B] :
      ( addressVal(v869_range_3_to_0_address_term_bound_11,B)
    <=> v869(constB11,B) ) )).

fof(is_address_48,axiom,(
    address(v869_range_3_to_0_address_term_bound_11) )).

fof(address_association_32,axiom,(
    v869_range_3_to_0_address_association(constB11,v869_range_3_to_0_address_term_bound_11) )).

fof(transient_address_definition_31,axiom,(
    ! [B] :
      ( addressVal(v869_range_3_to_0_address_term_bound_10,B)
    <=> v869(constB10,B) ) )).

fof(is_address_47,axiom,(
    address(v869_range_3_to_0_address_term_bound_10) )).

fof(address_association_31,axiom,(
    v869_range_3_to_0_address_association(constB10,v869_range_3_to_0_address_term_bound_10) )).

fof(transient_address_definition_30,axiom,(
    ! [B] :
      ( addressVal(v869_range_3_to_0_address_term_bound_9,B)
    <=> v869(constB9,B) ) )).

fof(is_address_46,axiom,(
    address(v869_range_3_to_0_address_term_bound_9) )).

fof(address_association_30,axiom,(
    v869_range_3_to_0_address_association(constB9,v869_range_3_to_0_address_term_bound_9) )).

fof(transient_address_definition_29,axiom,(
    ! [B] :
      ( addressVal(v869_range_3_to_0_address_term_bound_8,B)
    <=> v869(constB8,B) ) )).

fof(is_address_45,axiom,(
    address(v869_range_3_to_0_address_term_bound_8) )).

fof(address_association_29,axiom,(
    v869_range_3_to_0_address_association(constB8,v869_range_3_to_0_address_term_bound_8) )).

fof(transient_address_definition_28,axiom,(
    ! [B] :
      ( addressVal(v869_range_3_to_0_address_term_bound_7,B)
    <=> v869(constB7,B) ) )).

fof(is_address_44,axiom,(
    address(v869_range_3_to_0_address_term_bound_7) )).

fof(address_association_28,axiom,(
    v869_range_3_to_0_address_association(constB7,v869_range_3_to_0_address_term_bound_7) )).

fof(transient_address_definition_27,axiom,(
    ! [B] :
      ( addressVal(v869_range_3_to_0_address_term_bound_6,B)
    <=> v869(constB6,B) ) )).

fof(is_address_43,axiom,(
    address(v869_range_3_to_0_address_term_bound_6) )).

fof(address_association_27,axiom,(
    v869_range_3_to_0_address_association(constB6,v869_range_3_to_0_address_term_bound_6) )).

fof(transient_address_definition_26,axiom,(
    ! [B] :
      ( addressVal(v869_range_3_to_0_address_term_bound_5,B)
    <=> v869(constB5,B) ) )).

fof(is_address_42,axiom,(
    address(v869_range_3_to_0_address_term_bound_5) )).

fof(address_association_26,axiom,(
    v869_range_3_to_0_address_association(constB5,v869_range_3_to_0_address_term_bound_5) )).

fof(transient_address_definition_25,axiom,(
    ! [B] :
      ( addressVal(v869_range_3_to_0_address_term_bound_4,B)
    <=> v869(constB4,B) ) )).

fof(is_address_41,axiom,(
    address(v869_range_3_to_0_address_term_bound_4) )).

fof(address_association_25,axiom,(
    v869_range_3_to_0_address_association(constB4,v869_range_3_to_0_address_term_bound_4) )).

fof(transient_address_definition_24,axiom,(
    ! [B] :
      ( addressVal(v869_range_3_to_0_address_term_bound_3,B)
    <=> v869(constB3,B) ) )).

fof(is_address_40,axiom,(
    address(v869_range_3_to_0_address_term_bound_3) )).

fof(address_association_24,axiom,(
    v869_range_3_to_0_address_association(constB3,v869_range_3_to_0_address_term_bound_3) )).

fof(transient_address_definition_23,axiom,(
    ! [B] :
      ( addressVal(v869_range_3_to_0_address_term_bound_2,B)
    <=> v869(constB2,B) ) )).

fof(is_address_39,axiom,(
    address(v869_range_3_to_0_address_term_bound_2) )).

fof(address_association_23,axiom,(
    v869_range_3_to_0_address_association(constB2,v869_range_3_to_0_address_term_bound_2) )).

fof(transient_address_definition_22,axiom,(
    ! [B] :
      ( addressVal(v869_range_3_to_0_address_term_bound_1,B)
    <=> v869(constB1,B) ) )).

fof(is_address_38,axiom,(
    address(v869_range_3_to_0_address_term_bound_1) )).

fof(address_association_22,axiom,(
    v869_range_3_to_0_address_association(constB1,v869_range_3_to_0_address_term_bound_1) )).

fof(transient_address_definition_21,axiom,(
    ! [B] :
      ( addressVal(v869_range_3_to_0_address_term_bound_0,B)
    <=> v869(constB0,B) ) )).

fof(is_address_37,axiom,(
    address(v869_range_3_to_0_address_term_bound_0) )).

fof(address_association_21,axiom,(
    v869_range_3_to_0_address_association(constB0,v869_range_3_to_0_address_term_bound_0) )).

fof(is_address_36,axiom,(
    address(b1110_address_term) )).

fof(constant_address_definition_15,axiom,(
    ! [B] :
      ( addressVal(b1110_address_term,B)
    <=> b1110(B) ) )).

fof(is_address_35,axiom,(
    address(b1101_address_term) )).

fof(constant_address_definition_14,axiom,(
    ! [B] :
      ( addressVal(b1101_address_term,B)
    <=> b1101(B) ) )).

fof(is_address_34,axiom,(
    address(b1100_address_term) )).

fof(constant_address_definition_13,axiom,(
    ! [B] :
      ( addressVal(b1100_address_term,B)
    <=> b1100(B) ) )).

fof(is_address_33,axiom,(
    address(b1011_address_term) )).

fof(constant_address_definition_12,axiom,(
    ! [B] :
      ( addressVal(b1011_address_term,B)
    <=> b1011(B) ) )).

fof(is_address_32,axiom,(
    address(b1010_address_term) )).

fof(constant_address_definition_11,axiom,(
    ! [B] :
      ( addressVal(b1010_address_term,B)
    <=> b1010(B) ) )).

fof(is_address_31,axiom,(
    address(b1001_address_term) )).

fof(constant_address_definition_10,axiom,(
    ! [B] :
      ( addressVal(b1001_address_term,B)
    <=> b1001(B) ) )).

fof(is_address_30,axiom,(
    address(b1000_address_term) )).

fof(constant_address_definition_9,axiom,(
    ! [B] :
      ( addressVal(b1000_address_term,B)
    <=> b1000(B) ) )).

fof(is_address_29,axiom,(
    address(b0111_address_term) )).

fof(constant_address_definition_8,axiom,(
    ! [B] :
      ( addressVal(b0111_address_term,B)
    <=> b0111(B) ) )).

fof(is_address_28,axiom,(
    address(b0100_address_term) )).

fof(constant_address_definition_7,axiom,(
    ! [B] :
      ( addressVal(b0100_address_term,B)
    <=> b0100(B) ) )).

fof(is_address_27,axiom,(
    address(b0011_address_term) )).

fof(constant_address_definition_6,axiom,(
    ! [B] :
      ( addressVal(b0011_address_term,B)
    <=> b0011(B) ) )).

fof(is_address_26,axiom,(
    address(b0010_address_term) )).

fof(constant_address_definition_5,axiom,(
    ! [B] :
      ( addressVal(b0010_address_term,B)
    <=> b0010(B) ) )).

fof(is_address_25,axiom,(
    address(b1111_address_term) )).

fof(constant_address_definition_4,axiom,(
    ! [B] :
      ( addressVal(b1111_address_term,B)
    <=> b1111(B) ) )).

fof(transient_address_definition_20,axiom,(
    ! [B] :
      ( addressVal(v791_range_3_to_0_address_term_bound_20,B)
    <=> v791(constB20,B) ) )).

fof(is_address_24,axiom,(
    address(v791_range_3_to_0_address_term_bound_20) )).

fof(address_association_20,axiom,(
    v791_range_3_to_0_address_association(constB20,v791_range_3_to_0_address_term_bound_20) )).

fof(transient_address_definition_19,axiom,(
    ! [B] :
      ( addressVal(v791_range_3_to_0_address_term_bound_19,B)
    <=> v791(constB19,B) ) )).

fof(is_address_23,axiom,(
    address(v791_range_3_to_0_address_term_bound_19) )).

fof(address_association_19,axiom,(
    v791_range_3_to_0_address_association(constB19,v791_range_3_to_0_address_term_bound_19) )).

fof(transient_address_definition_18,axiom,(
    ! [B] :
      ( addressVal(v791_range_3_to_0_address_term_bound_18,B)
    <=> v791(constB18,B) ) )).

fof(is_address_22,axiom,(
    address(v791_range_3_to_0_address_term_bound_18) )).

fof(address_association_18,axiom,(
    v791_range_3_to_0_address_association(constB18,v791_range_3_to_0_address_term_bound_18) )).

fof(transient_address_definition_17,axiom,(
    ! [B] :
      ( addressVal(v791_range_3_to_0_address_term_bound_17,B)
    <=> v791(constB17,B) ) )).

fof(is_address_21,axiom,(
    address(v791_range_3_to_0_address_term_bound_17) )).

fof(address_association_17,axiom,(
    v791_range_3_to_0_address_association(constB17,v791_range_3_to_0_address_term_bound_17) )).

fof(transient_address_definition_16,axiom,(
    ! [B] :
      ( addressVal(v791_range_3_to_0_address_term_bound_16,B)
    <=> v791(constB16,B) ) )).

fof(is_address_20,axiom,(
    address(v791_range_3_to_0_address_term_bound_16) )).

fof(address_association_16,axiom,(
    v791_range_3_to_0_address_association(constB16,v791_range_3_to_0_address_term_bound_16) )).

fof(transient_address_definition_15,axiom,(
    ! [B] :
      ( addressVal(v791_range_3_to_0_address_term_bound_15,B)
    <=> v791(constB15,B) ) )).

fof(is_address_19,axiom,(
    address(v791_range_3_to_0_address_term_bound_15) )).

fof(address_association_15,axiom,(
    v791_range_3_to_0_address_association(constB15,v791_range_3_to_0_address_term_bound_15) )).

fof(transient_address_definition_14,axiom,(
    ! [B] :
      ( addressVal(v791_range_3_to_0_address_term_bound_14,B)
    <=> v791(constB14,B) ) )).

fof(is_address_18,axiom,(
    address(v791_range_3_to_0_address_term_bound_14) )).

fof(address_association_14,axiom,(
    v791_range_3_to_0_address_association(constB14,v791_range_3_to_0_address_term_bound_14) )).

fof(transient_address_definition_13,axiom,(
    ! [B] :
      ( addressVal(v791_range_3_to_0_address_term_bound_13,B)
    <=> v791(constB13,B) ) )).

fof(is_address_17,axiom,(
    address(v791_range_3_to_0_address_term_bound_13) )).

fof(address_association_13,axiom,(
    v791_range_3_to_0_address_association(constB13,v791_range_3_to_0_address_term_bound_13) )).

fof(transient_address_definition_12,axiom,(
    ! [B] :
      ( addressVal(v791_range_3_to_0_address_term_bound_12,B)
    <=> v791(constB12,B) ) )).

fof(is_address_16,axiom,(
    address(v791_range_3_to_0_address_term_bound_12) )).

fof(address_association_12,axiom,(
    v791_range_3_to_0_address_association(constB12,v791_range_3_to_0_address_term_bound_12) )).

fof(transient_address_definition_11,axiom,(
    ! [B] :
      ( addressVal(v791_range_3_to_0_address_term_bound_11,B)
    <=> v791(constB11,B) ) )).

fof(is_address_15,axiom,(
    address(v791_range_3_to_0_address_term_bound_11) )).

fof(address_association_11,axiom,(
    v791_range_3_to_0_address_association(constB11,v791_range_3_to_0_address_term_bound_11) )).

fof(transient_address_definition_10,axiom,(
    ! [B] :
      ( addressVal(v791_range_3_to_0_address_term_bound_10,B)
    <=> v791(constB10,B) ) )).

fof(is_address_14,axiom,(
    address(v791_range_3_to_0_address_term_bound_10) )).

fof(address_association_10,axiom,(
    v791_range_3_to_0_address_association(constB10,v791_range_3_to_0_address_term_bound_10) )).

fof(transient_address_definition_9,axiom,(
    ! [B] :
      ( addressVal(v791_range_3_to_0_address_term_bound_9,B)
    <=> v791(constB9,B) ) )).

fof(is_address_13,axiom,(
    address(v791_range_3_to_0_address_term_bound_9) )).

fof(address_association_9,axiom,(
    v791_range_3_to_0_address_association(constB9,v791_range_3_to_0_address_term_bound_9) )).

fof(transient_address_definition_8,axiom,(
    ! [B] :
      ( addressVal(v791_range_3_to_0_address_term_bound_8,B)
    <=> v791(constB8,B) ) )).

fof(is_address_12,axiom,(
    address(v791_range_3_to_0_address_term_bound_8) )).

fof(address_association_8,axiom,(
    v791_range_3_to_0_address_association(constB8,v791_range_3_to_0_address_term_bound_8) )).

fof(transient_address_definition_7,axiom,(
    ! [B] :
      ( addressVal(v791_range_3_to_0_address_term_bound_7,B)
    <=> v791(constB7,B) ) )).

fof(is_address_11,axiom,(
    address(v791_range_3_to_0_address_term_bound_7) )).

fof(address_association_7,axiom,(
    v791_range_3_to_0_address_association(constB7,v791_range_3_to_0_address_term_bound_7) )).

fof(transient_address_definition_6,axiom,(
    ! [B] :
      ( addressVal(v791_range_3_to_0_address_term_bound_6,B)
    <=> v791(constB6,B) ) )).

fof(is_address_10,axiom,(
    address(v791_range_3_to_0_address_term_bound_6) )).

fof(address_association_6,axiom,(
    v791_range_3_to_0_address_association(constB6,v791_range_3_to_0_address_term_bound_6) )).

fof(transient_address_definition_5,axiom,(
    ! [B] :
      ( addressVal(v791_range_3_to_0_address_term_bound_5,B)
    <=> v791(constB5,B) ) )).

fof(is_address_9,axiom,(
    address(v791_range_3_to_0_address_term_bound_5) )).

fof(address_association_5,axiom,(
    v791_range_3_to_0_address_association(constB5,v791_range_3_to_0_address_term_bound_5) )).

fof(transient_address_definition_4,axiom,(
    ! [B] :
      ( addressVal(v791_range_3_to_0_address_term_bound_4,B)
    <=> v791(constB4,B) ) )).

fof(is_address_8,axiom,(
    address(v791_range_3_to_0_address_term_bound_4) )).

fof(address_association_4,axiom,(
    v791_range_3_to_0_address_association(constB4,v791_range_3_to_0_address_term_bound_4) )).

fof(transient_address_definition_3,axiom,(
    ! [B] :
      ( addressVal(v791_range_3_to_0_address_term_bound_3,B)
    <=> v791(constB3,B) ) )).

fof(is_address_7,axiom,(
    address(v791_range_3_to_0_address_term_bound_3) )).

fof(address_association_3,axiom,(
    v791_range_3_to_0_address_association(constB3,v791_range_3_to_0_address_term_bound_3) )).

fof(transient_address_definition_2,axiom,(
    ! [B] :
      ( addressVal(v791_range_3_to_0_address_term_bound_2,B)
    <=> v791(constB2,B) ) )).

fof(is_address_6,axiom,(
    address(v791_range_3_to_0_address_term_bound_2) )).

fof(address_association_2,axiom,(
    v791_range_3_to_0_address_association(constB2,v791_range_3_to_0_address_term_bound_2) )).

fof(transient_address_definition_1,axiom,(
    ! [B] :
      ( addressVal(v791_range_3_to_0_address_term_bound_1,B)
    <=> v791(constB1,B) ) )).

fof(is_address_5,axiom,(
    address(v791_range_3_to_0_address_term_bound_1) )).

fof(address_association_1,axiom,(
    v791_range_3_to_0_address_association(constB1,v791_range_3_to_0_address_term_bound_1) )).

fof(transient_address_definition,axiom,(
    ! [B] :
      ( addressVal(v791_range_3_to_0_address_term_bound_0,B)
    <=> v791(constB0,B) ) )).

fof(is_address_4,axiom,(
    address(v791_range_3_to_0_address_term_bound_0) )).

fof(address_association,axiom,(
    v791_range_3_to_0_address_association(constB0,v791_range_3_to_0_address_term_bound_0) )).

fof(is_address_3,axiom,(
    address(b0101_address_term) )).

fof(constant_address_definition_3,axiom,(
    ! [B] :
      ( addressVal(b0101_address_term,B)
    <=> b0101(B) ) )).

fof(is_address_2,axiom,(
    address(b0001_address_term) )).

fof(constant_address_definition_2,axiom,(
    ! [B] :
      ( addressVal(b0001_address_term,B)
    <=> b0001(B) ) )).

fof(is_address_1,axiom,(
    address(b0110_address_term) )).

fof(constant_address_definition_1,axiom,(
    ! [B] :
      ( addressVal(b0110_address_term,B)
    <=> b0110(B) ) )).

fof(is_address,axiom,(
    address(b0000_address_term) )).

fof(constant_address_definition,axiom,(
    ! [B] :
      ( addressVal(b0000_address_term,B)
    <=> b0000(B) ) )).

fof(addressDiff,axiom,(
    ! [B,A2,A1] :
      ( ( address(A1)
        & address(A2)
        & addressDiff(A1,A2,B) )
     => ( A1 = A2
        | ( addressVal(A1,B)
        <=> ~ addressVal(A2,B) ) ) ) )).

fof(addressDomain,axiom,(
    ! [A1,A2] :
      ( addressDiff(A1,A2,bitIndex0)
      | addressDiff(A1,A2,bitIndex1)
      | addressDiff(A1,A2,bitIndex2)
      | addressDiff(A1,A2,bitIndex3) ) )).

fof(addAssertion,conjecture,(
    ! [VarCurr] :
      ( reachableState(VarCurr)
     => v4(VarCurr) ) )).

fof(writeUnaryOperator_347,axiom,(
    ! [VarCurr] :
      ( ~ v4(VarCurr)
    <=> v3674(VarCurr) ) )).

fof(writeUnaryOperator_346,axiom,(
    ! [VarCurr] :
      ( ~ v3674(VarCurr)
    <=> v3675(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_740,axiom,(
    ! [VarCurr] :
      ( v3675(VarCurr)
    <=> ( v3677(VarCurr)
        & v3693(VarCurr) ) ) )).

fof(writeBinaryOperatorShiftedRanges_555,axiom,(
    ! [VarCurr] :
      ( v3693(VarCurr)
    <=> ( v3679(VarCurr,bitIndex0)
        | v3679(VarCurr,bitIndex1) ) ) )).

fof(writeUnaryOperator_345,axiom,(
    ! [VarCurr] :
      ( ~ v3677(VarCurr)
    <=> v3678(VarCurr) ) )).

fof(writeBinaryOperatorShiftedRanges_554,axiom,(
    ! [VarCurr] :
      ( v3678(VarCurr)
    <=> ( v3679(VarCurr,bitIndex0)
        & v3679(VarCurr,bitIndex1) ) ) )).

fof(addAssignment_2619,axiom,(
    ! [VarCurr] :
      ( v3679(VarCurr,bitIndex0)
    <=> v3680(VarCurr) ) )).

fof(addAssignment_2618,axiom,(
    ! [VarCurr] :
      ( v3679(VarCurr,bitIndex1)
    <=> $true ) )).

fof(writeBinaryOperatorShiftedRanges_553,axiom,(
    ! [VarCurr] :
      ( v3680(VarCurr)
    <=> ( v3682(VarCurr)
        & v3684(VarCurr,bitIndex5) ) ) )).

fof(writeBinaryOperatorShiftedRanges_552,axiom,(
    ! [VarCurr] :
      ( v3682(VarCurr)
    <=> ( v3683(VarCurr)
        & v3684(VarCurr,bitIndex4) ) ) )).

fof(writeBinaryOperatorShiftedRanges_551,axiom,(
    ! [VarCurr] :
      ( v3683(VarCurr)
    <=> ( v3684(VarCurr,bitIndex3)
        | v3685(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_739,axiom,(
    ! [VarCurr] :
      ( v3685(VarCurr)
    <=> ( v3686(VarCurr)
        & v3692(VarCurr) ) ) )).

fof(writeUnaryOperator_344,axiom,(
    ! [VarCurr] :
      ( ~ v3692(VarCurr)
    <=> v3684(VarCurr,bitIndex3) ) )).

fof(writeBinaryOperatorShiftedRanges_550,axiom,(
    ! [VarCurr] :
      ( v3686(VarCurr)
    <=> ( v3684(VarCurr,bitIndex2)
        | v3687(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_738,axiom,(
    ! [VarCurr] :
      ( v3687(VarCurr)
    <=> ( v3688(VarCurr)
        & v3691(VarCurr) ) ) )).

fof(writeUnaryOperator_343,axiom,(
    ! [VarCurr] :
      ( ~ v3691(VarCurr)
    <=> v3684(VarCurr,bitIndex2) ) )).

fof(writeBinaryOperatorShiftedRanges_549,axiom,(
    ! [VarCurr] :
      ( v3688(VarCurr)
    <=> ( v3684(VarCurr,bitIndex1)
        | v3689(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_737,axiom,(
    ! [VarCurr] :
      ( v3689(VarCurr)
    <=> ( v3684(VarCurr,bitIndex0)
        & v3690(VarCurr) ) ) )).

fof(writeUnaryOperator_342,axiom,(
    ! [VarCurr] :
      ( ~ v3690(VarCurr)
    <=> v3684(VarCurr,bitIndex1) ) )).

fof(addZeroExtensionConstraint_7,axiom,(
    ! [VarCurr] : ~ v3684(VarCurr,bitIndex3) )).

fof(addZeroExtensionConstraint_6,axiom,(
    ! [VarCurr] : ~ v3684(VarCurr,bitIndex4) )).

fof(addZeroExtensionConstraint_5,axiom,(
    ! [VarCurr] : ~ v3684(VarCurr,bitIndex5) )).

fof(addAssignment_2617,axiom,(
    ! [VarCurr,B] :
      ( range_2_0(B)
     => ( v3684(VarCurr,B)
      <=> v8(VarCurr,B) ) ) )).

fof(addCaseBooleanConditionEqualRanges1_38,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( ~ v3660(VarNext)
       => ! [B] :
            ( range_2_0(B)
           => ( v8(VarNext,B)
            <=> v8(VarCurr,B) ) ) ) ) )).

fof(addCaseBooleanConditionEqualRanges0_52,axiom,(
    ! [VarNext] :
      ( v3660(VarNext)
     => ! [B] :
          ( range_2_0(B)
         => ( v8(VarNext,B)
          <=> v3668(VarNext,B) ) ) ) )).

fof(addAssignment_2616,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ! [B] :
          ( range_2_0(B)
         => ( v3668(VarNext,B)
          <=> v3666(VarCurr,B) ) ) ) )).

fof(aaddConditionBooleanCondEqualRangesElseBranch_99,axiom,(
    ! [VarCurr] :
      ( ~ v3669(VarCurr)
     => ! [B] :
          ( range_2_0(B)
         => ( v3666(VarCurr,B)
          <=> v21(VarCurr,B) ) ) ) )).

fof(addConditionBooleanCondEqualRangesThenBranch_102,axiom,(
    ! [VarCurr] :
      ( v3669(VarCurr)
     => ! [B] :
          ( range_2_0(B)
         => ( v3666(VarCurr,B)
          <=> $false ) ) ) )).

fof(writeUnaryOperator_341,axiom,(
    ! [VarCurr] :
      ( ~ v3669(VarCurr)
    <=> v10(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_736,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( v3660(VarNext)
      <=> v3661(VarNext) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_735,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( v3661(VarNext)
      <=> ( v3662(VarNext)
          & v286(VarNext) ) ) ) )).

fof(writeUnaryOperator_340,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( ~ v3662(VarNext)
      <=> v295(VarNext) ) ) )).

fof(aaddConditionBooleanCondEqualRangesElseBranch_98,axiom,(
    ! [VarCurr] :
      ( ~ v23(VarCurr)
     => ! [B] :
          ( range_2_0(B)
         => ( v21(VarCurr,B)
          <=> v8(VarCurr,B) ) ) ) )).

fof(addConditionBooleanCondEqualRangesThenBranch_101,axiom,(
    ! [VarCurr] :
      ( v23(VarCurr)
     => ! [B] :
          ( range_2_0(B)
         => ( v21(VarCurr,B)
          <=> v3643(VarCurr,B) ) ) ) )).

fof(aaddConditionBooleanCondEqualRangesElseBranch_97,axiom,(
    ! [VarCurr] :
      ( ~ v3644(VarCurr)
     => ! [B] :
          ( range_2_0(B)
         => ( v3643(VarCurr,B)
          <=> v3645(VarCurr,B) ) ) ) )).

fof(addConditionBooleanCondEqualRangesThenBranch_100,axiom,(
    ! [VarCurr] :
      ( v3644(VarCurr)
     => ! [B] :
          ( range_2_0(B)
         => ( v3643(VarCurr,B)
          <=> $false ) ) ) )).

fof(bitBlastConstant_622,axiom,(
    ~ b000(bitIndex2) )).

fof(bitBlastConstant_621,axiom,(
    ~ b000(bitIndex1) )).

fof(bitBlastConstant_620,axiom,(
    ~ b000(bitIndex0) )).

fof(addAssignment_2615,axiom,(
    ! [VarCurr] :
      ( v3645(VarCurr,bitIndex0)
    <=> v3655(VarCurr) ) )).

fof(addAssignment_2614,axiom,(
    ! [VarCurr] :
      ( v3645(VarCurr,bitIndex1)
    <=> v3653(VarCurr) ) )).

fof(addAssignment_2613,axiom,(
    ! [VarCurr] :
      ( v3645(VarCurr,bitIndex2)
    <=> v3647(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_734,axiom,(
    ! [VarCurr] :
      ( v3653(VarCurr)
    <=> ( v3654(VarCurr)
        & v3657(VarCurr) ) ) )).

fof(writeBinaryOperatorShiftedRanges_548,axiom,(
    ! [VarCurr] :
      ( v3657(VarCurr)
    <=> ( v8(VarCurr,bitIndex0)
        | v8(VarCurr,bitIndex1) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_733,axiom,(
    ! [VarCurr] :
      ( v3654(VarCurr)
    <=> ( v3655(VarCurr)
        | v3656(VarCurr) ) ) )).

fof(writeUnaryOperator_339,axiom,(
    ! [VarCurr] :
      ( ~ v3656(VarCurr)
    <=> v8(VarCurr,bitIndex1) ) )).

fof(writeUnaryOperator_338,axiom,(
    ! [VarCurr] :
      ( ~ v3655(VarCurr)
    <=> v8(VarCurr,bitIndex0) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_732,axiom,(
    ! [VarCurr] :
      ( v3647(VarCurr)
    <=> ( v3648(VarCurr)
        & v3652(VarCurr) ) ) )).

fof(writeBinaryOperatorShiftedRanges_547,axiom,(
    ! [VarCurr] :
      ( v3652(VarCurr)
    <=> ( v3650(VarCurr)
        | v8(VarCurr,bitIndex2) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_731,axiom,(
    ! [VarCurr] :
      ( v3648(VarCurr)
    <=> ( v3649(VarCurr)
        | v3651(VarCurr) ) ) )).

fof(writeUnaryOperator_337,axiom,(
    ! [VarCurr] :
      ( ~ v3651(VarCurr)
    <=> v8(VarCurr,bitIndex2) ) )).

fof(writeUnaryOperator_336,axiom,(
    ! [VarCurr] :
      ( ~ v3649(VarCurr)
    <=> v3650(VarCurr) ) )).

fof(writeBinaryOperatorShiftedRanges_546,axiom,(
    ! [VarCurr] :
      ( v3650(VarCurr)
    <=> ( v8(VarCurr,bitIndex0)
        & v8(VarCurr,bitIndex1) ) ) )).

fof(addBitVectorEqualityBitBlasted_151,axiom,(
    ! [VarCurr] :
      ( v3644(VarCurr)
    <=> ( ( v8(VarCurr,bitIndex2)
        <=> $true )
        & ( v8(VarCurr,bitIndex1)
        <=> $false )
        & ( v8(VarCurr,bitIndex0)
        <=> $true ) ) ) )).

fof(bitBlastConstant_619,axiom,(
    b101(bitIndex2) )).

fof(bitBlastConstant_618,axiom,(
    ~ b101(bitIndex1) )).

fof(bitBlastConstant_617,axiom,(
    b101(bitIndex0) )).

fof(addAssignment_2612,axiom,(
    ! [VarCurr] :
      ( v23(VarCurr)
    <=> v25(VarCurr) ) )).

fof(addAssignment_2611,axiom,(
    ! [VarCurr] :
      ( v25(VarCurr)
    <=> v27(VarCurr) ) )).

fof(addAssignment_2610,axiom,(
    ! [VarCurr] :
      ( v27(VarCurr)
    <=> v29(VarCurr) ) )).

fof(addAssignment_2609,axiom,(
    ! [VarCurr] :
      ( v29(VarCurr)
    <=> v31(VarCurr,bitIndex7) ) )).

fof(addAssignment_2608,axiom,(
    ! [VarNext] :
      ( v31(VarNext,bitIndex7)
    <=> v3635(VarNext,bitIndex6) ) )).

fof(addCaseBooleanConditionShiftedRanges1_14,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( ~ v3636(VarNext)
       => ( ( v3635(VarNext,bitIndex10)
          <=> v31(VarCurr,bitIndex11) )
          & ( v3635(VarNext,bitIndex9)
          <=> v31(VarCurr,bitIndex10) )
          & ( v3635(VarNext,bitIndex8)
          <=> v31(VarCurr,bitIndex9) )
          & ( v3635(VarNext,bitIndex7)
          <=> v31(VarCurr,bitIndex8) )
          & ( v3635(VarNext,bitIndex6)
          <=> v31(VarCurr,bitIndex7) )
          & ( v3635(VarNext,bitIndex5)
          <=> v31(VarCurr,bitIndex6) )
          & ( v3635(VarNext,bitIndex4)
          <=> v31(VarCurr,bitIndex5) )
          & ( v3635(VarNext,bitIndex3)
          <=> v31(VarCurr,bitIndex4) )
          & ( v3635(VarNext,bitIndex2)
          <=> v31(VarCurr,bitIndex3) )
          & ( v3635(VarNext,bitIndex1)
          <=> v31(VarCurr,bitIndex2) )
          & ( v3635(VarNext,bitIndex0)
          <=> v31(VarCurr,bitIndex1) ) ) ) ) )).

fof(addCaseBooleanConditionEqualRanges0_51,axiom,(
    ! [VarNext] :
      ( v3636(VarNext)
     => ! [B] :
          ( range_10_0(B)
         => ( v3635(VarNext,B)
          <=> v1253(VarNext,B) ) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_730,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( v3636(VarNext)
      <=> v3637(VarNext) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_729,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( v3637(VarNext)
      <=> ( v3639(VarNext)
          & v1240(VarNext) ) ) ) )).

fof(writeUnaryOperator_335,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( ~ v3639(VarNext)
      <=> v1247(VarNext) ) ) )).

fof(addConditionBooleanCondShiftedRangesElseBranch_22,axiom,(
    ! [VarCurr] :
      ( ~ v3611(VarCurr)
     => ( v36(VarCurr,bitIndex7)
      <=> $false ) ) )).

fof(addConditionBooleanCondShiftedRangesThenBranch_19,axiom,(
    ! [VarCurr] :
      ( v3611(VarCurr)
     => ( v36(VarCurr,bitIndex7)
      <=> $true ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_728,axiom,(
    ! [VarCurr] :
      ( v3611(VarCurr)
    <=> ( v3612(VarCurr)
        | v3632(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_727,axiom,(
    ! [VarCurr] :
      ( v3632(VarCurr)
    <=> ( v3633(VarCurr)
        & v1323(VarCurr) ) ) )).

fof(addAssignment_2607,axiom,(
    ! [VarCurr] :
      ( v3633(VarCurr)
    <=> v3619(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_726,axiom,(
    ! [VarCurr] :
      ( v3612(VarCurr)
    <=> ( v3613(VarCurr)
        | v3630(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_725,axiom,(
    ! [VarCurr] :
      ( v3630(VarCurr)
    <=> ( v3631(VarCurr)
        & v1300(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_724,axiom,(
    ! [VarCurr] :
      ( v3631(VarCurr)
    <=> ( v3619(VarCurr)
        & v1180(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_723,axiom,(
    ! [VarCurr] :
      ( v3613(VarCurr)
    <=> ( v3614(VarCurr)
        | v3628(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_722,axiom,(
    ! [VarCurr] :
      ( v3628(VarCurr)
    <=> ( v3629(VarCurr)
        & v1360(VarCurr) ) ) )).

fof(addAssignment_2606,axiom,(
    ! [VarCurr] :
      ( v3629(VarCurr)
    <=> v3619(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_721,axiom,(
    ! [VarCurr] :
      ( v3614(VarCurr)
    <=> ( v3615(VarCurr)
        | v3626(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_720,axiom,(
    ! [VarCurr] :
      ( v3626(VarCurr)
    <=> ( v3627(VarCurr)
        & v1278(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_719,axiom,(
    ! [VarCurr] :
      ( v3627(VarCurr)
    <=> ( v3619(VarCurr)
        & v1180(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_718,axiom,(
    ! [VarCurr] :
      ( v3615(VarCurr)
    <=> ( v3616(VarCurr)
        | v3624(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_717,axiom,(
    ! [VarCurr] :
      ( v3624(VarCurr)
    <=> ( v3625(VarCurr)
        & v1355(VarCurr) ) ) )).

fof(addAssignment_2605,axiom,(
    ! [VarCurr] :
      ( v3625(VarCurr)
    <=> v3619(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_716,axiom,(
    ! [VarCurr] :
      ( v3616(VarCurr)
    <=> ( v3617(VarCurr)
        | v3621(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_715,axiom,(
    ! [VarCurr] :
      ( v3621(VarCurr)
    <=> ( v3622(VarCurr)
        & v1238(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_714,axiom,(
    ! [VarCurr] :
      ( v3622(VarCurr)
    <=> ( v3619(VarCurr)
        & v1180(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_713,axiom,(
    ! [VarCurr] :
      ( v3619(VarCurr)
    <=> ( v3620(VarCurr)
        & v1347(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_712,axiom,(
    ! [VarCurr] :
      ( v3617(VarCurr)
    <=> ( v3618(VarCurr)
        & v1348(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_711,axiom,(
    ! [VarCurr] :
      ( v3618(VarCurr)
    <=> ( v3620(VarCurr)
        & v1347(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_710,axiom,(
    ! [VarCurr] :
      ( v3620(VarCurr)
    <=> ( v1673(VarCurr)
        & v903(VarCurr) ) ) )).

fof(addAssignment_2604,axiom,(
    ! [VarCurr] :
      ( v38(VarCurr)
    <=> v40(VarCurr) ) )).

fof(addAssignment_2603,axiom,(
    ! [VarCurr] :
      ( v40(VarCurr)
    <=> v42(VarCurr) ) )).

fof(addAssignment_2602,axiom,(
    ! [VarCurr] :
      ( v42(VarCurr)
    <=> v44(VarCurr) ) )).

fof(addAssignment_2601,axiom,(
    ! [VarCurr] :
      ( v44(VarCurr)
    <=> v46(VarCurr) ) )).

fof(addAssignment_2600,axiom,(
    ! [VarCurr] :
      ( v46(VarCurr)
    <=> v48(VarCurr) ) )).

fof(addAssignment_2599,axiom,(
    ! [VarCurr] :
      ( v48(VarCurr)
    <=> v50(VarCurr) ) )).

fof(addAssignment_2598,axiom,(
    ! [VarCurr] :
      ( v50(VarCurr)
    <=> v52(VarCurr) ) )).

fof(addAssignment_2597,axiom,(
    ! [VarCurr] :
      ( v52(VarCurr)
    <=> v54(VarCurr) ) )).

fof(addAssignment_2596,axiom,(
    ! [VarCurr] :
      ( v54(VarCurr)
    <=> v56(VarCurr,bitIndex2) ) )).

fof(addAssignment_2595,axiom,(
    ! [VarNext] :
      ( v56(VarNext,bitIndex2)
    <=> v3601(VarNext,bitIndex2) ) )).

fof(addCaseBooleanConditionEqualRanges1_37,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( ~ v3602(VarNext)
       => ! [B] :
            ( range_3_0(B)
           => ( v3601(VarNext,B)
            <=> v56(VarCurr,B) ) ) ) ) )).

fof(addCaseBooleanConditionEqualRanges0_50,axiom,(
    ! [VarNext] :
      ( v3602(VarNext)
     => ! [B] :
          ( range_3_0(B)
         => ( v3601(VarNext,B)
          <=> v3588(VarNext,B) ) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_709,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( v3602(VarNext)
      <=> v3603(VarNext) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_708,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( v3603(VarNext)
      <=> ( v3605(VarNext)
          & v3573(VarNext) ) ) ) )).

fof(writeUnaryOperator_334,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( ~ v3605(VarNext)
      <=> v3582(VarNext) ) ) )).

fof(addAssignment_2594,axiom,(
    ! [VarCurr] :
      ( v67(VarCurr,bitIndex2)
    <=> v3558(VarCurr,bitIndex2) ) )).

fof(addAssignment_2593,axiom,(
    ! [VarCurr] :
      ( v3555(VarCurr,bitIndex2)
    <=> v3556(VarCurr,bitIndex2) ) )).

fof(addAssignment_2592,axiom,(
    ! [VarNext] :
      ( v56(VarNext,bitIndex1)
    <=> v3593(VarNext,bitIndex1) ) )).

fof(addCaseBooleanConditionEqualRanges1_36,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( ~ v3594(VarNext)
       => ! [B] :
            ( range_3_0(B)
           => ( v3593(VarNext,B)
            <=> v56(VarCurr,B) ) ) ) ) )).

fof(addCaseBooleanConditionEqualRanges0_49,axiom,(
    ! [VarNext] :
      ( v3594(VarNext)
     => ! [B] :
          ( range_3_0(B)
         => ( v3593(VarNext,B)
          <=> v3588(VarNext,B) ) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_707,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( v3594(VarNext)
      <=> v3595(VarNext) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_706,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( v3595(VarNext)
      <=> ( v3597(VarNext)
          & v3573(VarNext) ) ) ) )).

fof(writeUnaryOperator_333,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( ~ v3597(VarNext)
      <=> v3582(VarNext) ) ) )).

fof(addAssignment_2591,axiom,(
    ! [VarCurr] :
      ( v67(VarCurr,bitIndex1)
    <=> v3558(VarCurr,bitIndex1) ) )).

fof(addAssignment_2590,axiom,(
    ! [VarCurr] :
      ( v3555(VarCurr,bitIndex1)
    <=> v3556(VarCurr,bitIndex1) ) )).

fof(addAssignment_2589,axiom,(
    ! [VarNext] :
      ( v56(VarNext,bitIndex3)
    <=> v3577(VarNext,bitIndex3) ) )).

fof(addCaseBooleanConditionEqualRanges1_35,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( ~ v3578(VarNext)
       => ! [B] :
            ( range_3_0(B)
           => ( v3577(VarNext,B)
            <=> v56(VarCurr,B) ) ) ) ) )).

fof(addCaseBooleanConditionEqualRanges0_48,axiom,(
    ! [VarNext] :
      ( v3578(VarNext)
     => ! [B] :
          ( range_3_0(B)
         => ( v3577(VarNext,B)
          <=> v3588(VarNext,B) ) ) ) )).

fof(addAssignment_2588,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ! [B] :
          ( range_3_0(B)
         => ( v3588(VarNext,B)
          <=> v3586(VarCurr,B) ) ) ) )).

fof(aaddConditionBooleanCondEqualRangesElseBranch_96,axiom,(
    ! [VarCurr] :
      ( ~ v3589(VarCurr)
     => ! [B] :
          ( range_3_0(B)
         => ( v3586(VarCurr,B)
          <=> v67(VarCurr,B) ) ) ) )).

fof(addConditionBooleanCondEqualRangesThenBranch_99,axiom,(
    ! [VarCurr] :
      ( v3589(VarCurr)
     => ! [B] :
          ( range_3_0(B)
         => ( v3586(VarCurr,B)
          <=> $false ) ) ) )).

fof(writeUnaryOperator_332,axiom,(
    ! [VarCurr] :
      ( ~ v3589(VarCurr)
    <=> v58(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_705,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( v3578(VarNext)
      <=> v3579(VarNext) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_704,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( v3579(VarNext)
      <=> ( v3580(VarNext)
          & v3573(VarNext) ) ) ) )).

fof(writeUnaryOperator_331,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( ~ v3580(VarNext)
      <=> v3582(VarNext) ) ) )).

fof(addAssignment_2587,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( v3582(VarNext)
      <=> v3573(VarCurr) ) ) )).

fof(addAssignment_2586,axiom,(
    ! [VarCurr] :
      ( v3573(VarCurr)
    <=> v3575(VarCurr) ) )).

fof(addAssignment_2585,axiom,(
    ! [VarCurr] :
      ( v3575(VarCurr)
    <=> v3531(VarCurr) ) )).

fof(addAssignment_2584,axiom,(
    ! [VarCurr] :
      ( v67(VarCurr,bitIndex3)
    <=> v3558(VarCurr,bitIndex3) ) )).

fof(aaddConditionBooleanCondEqualRangesElseBranch_95,axiom,(
    ! [VarCurr] :
      ( ~ v3559(VarCurr)
     => ! [B] :
          ( range_3_0(B)
         => ( v3558(VarCurr,B)
          <=> v3560(VarCurr,B) ) ) ) )).

fof(addConditionBooleanCondEqualRangesThenBranch_98,axiom,(
    ! [VarCurr] :
      ( v3559(VarCurr)
     => ! [B] :
          ( range_3_0(B)
         => ( v3558(VarCurr,B)
          <=> $false ) ) ) )).

fof(addParallelCaseBooleanConditionEqualRanges3_8,axiom,(
    ! [VarCurr] :
      ( ( ~ v3561(VarCurr)
        & ~ v3563(VarCurr)
        & ~ v3567(VarCurr) )
     => ! [B] :
          ( range_3_0(B)
         => ( v3560(VarCurr,B)
          <=> v56(VarCurr,B) ) ) ) )).

fof(addParallelCaseBooleanConditionEqualRanges2_13,axiom,(
    ! [VarCurr] :
      ( v3567(VarCurr)
     => ! [B] :
          ( range_3_0(B)
         => ( v3560(VarCurr,B)
          <=> v3569(VarCurr,B) ) ) ) )).

fof(addParallelCaseBooleanConditionEqualRanges1_33,axiom,(
    ! [VarCurr] :
      ( v3563(VarCurr)
     => ! [B] :
          ( range_3_0(B)
         => ( v3560(VarCurr,B)
          <=> v3565(VarCurr,B) ) ) ) )).

fof(addParallelCaseBooleanConditionEqualRanges0_33,axiom,(
    ! [VarCurr] :
      ( v3561(VarCurr)
     => ! [B] :
          ( range_3_0(B)
         => ( v3560(VarCurr,B)
          <=> v56(VarCurr,B) ) ) ) )).

fof(addBitVectorEqualityBitBlasted_150,axiom,(
    ! [VarCurr] :
      ( v3570(VarCurr)
    <=> ( ( v3571(VarCurr,bitIndex1)
        <=> $true )
        & ( v3571(VarCurr,bitIndex0)
        <=> $true ) ) ) )).

fof(addAssignment_2583,axiom,(
    ! [VarCurr] :
      ( v3571(VarCurr,bitIndex0)
    <=> v3447(VarCurr) ) )).

fof(addAssignment_2582,axiom,(
    ! [VarCurr] :
      ( v3571(VarCurr,bitIndex1)
    <=> v69(VarCurr) ) )).

fof(addAssignment_2581,axiom,(
    ! [VarCurr] :
      ( v3569(VarCurr,bitIndex0)
    <=> $true ) )).

fof(addAssignment_2580,axiom,(
    ! [VarCurr,B] :
      ( range_3_1(B)
     => ( v3569(VarCurr,B)
      <=> v3555(VarCurr,B) ) ) )).

fof(range_axiom_33,axiom,(
    ! [B] :
      ( range_3_1(B)
    <=> ( $false
        | bitIndex1 = B
        | bitIndex2 = B
        | bitIndex3 = B ) ) )).

fof(addBitVectorEqualityBitBlasted_149,axiom,(
    ! [VarCurr] :
      ( v3567(VarCurr)
    <=> ( ( v3568(VarCurr,bitIndex1)
        <=> $true )
        & ( v3568(VarCurr,bitIndex0)
        <=> $false ) ) ) )).

fof(addAssignment_2579,axiom,(
    ! [VarCurr] :
      ( v3568(VarCurr,bitIndex0)
    <=> v3447(VarCurr) ) )).

fof(addAssignment_2578,axiom,(
    ! [VarCurr] :
      ( v3568(VarCurr,bitIndex1)
    <=> v69(VarCurr) ) )).

fof(addAssignment_2577,axiom,(
    ! [VarCurr] :
      ( ( v3565(VarCurr,bitIndex2)
      <=> v56(VarCurr,bitIndex3) )
      & ( v3565(VarCurr,bitIndex1)
      <=> v56(VarCurr,bitIndex2) )
      & ( v3565(VarCurr,bitIndex0)
      <=> v56(VarCurr,bitIndex1) ) ) )).

fof(addAssignment_2576,axiom,(
    ! [VarCurr] :
      ( v3565(VarCurr,bitIndex3)
    <=> $false ) )).

fof(addBitVectorEqualityBitBlasted_148,axiom,(
    ! [VarCurr] :
      ( v3563(VarCurr)
    <=> ( ( v3564(VarCurr,bitIndex1)
        <=> $false )
        & ( v3564(VarCurr,bitIndex0)
        <=> $true ) ) ) )).

fof(addAssignment_2575,axiom,(
    ! [VarCurr] :
      ( v3564(VarCurr,bitIndex0)
    <=> v3447(VarCurr) ) )).

fof(addAssignment_2574,axiom,(
    ! [VarCurr] :
      ( v3564(VarCurr,bitIndex1)
    <=> v69(VarCurr) ) )).

fof(addBitVectorEqualityBitBlasted_147,axiom,(
    ! [VarCurr] :
      ( v3561(VarCurr)
    <=> ( ( v3562(VarCurr,bitIndex1)
        <=> $false )
        & ( v3562(VarCurr,bitIndex0)
        <=> $false ) ) ) )).

fof(addAssignment_2573,axiom,(
    ! [VarCurr] :
      ( v3562(VarCurr,bitIndex0)
    <=> v3447(VarCurr) ) )).

fof(addAssignment_2572,axiom,(
    ! [VarCurr] :
      ( v3562(VarCurr,bitIndex1)
    <=> v69(VarCurr) ) )).

fof(writeUnaryOperator_330,axiom,(
    ! [VarCurr] :
      ( ~ v3559(VarCurr)
    <=> v58(VarCurr) ) )).

fof(addAssignment_2571,axiom,(
    ! [VarCurr] :
      ( v3555(VarCurr,bitIndex3)
    <=> v3556(VarCurr,bitIndex3) ) )).

fof(addAssignment_2570,axiom,(
    ! [VarCurr] :
      ( v3556(VarCurr,bitIndex0)
    <=> $false ) )).

fof(addAssignment_2569,axiom,(
    ! [VarCurr] :
      ( ( v3556(VarCurr,bitIndex3)
      <=> v56(VarCurr,bitIndex2) )
      & ( v3556(VarCurr,bitIndex2)
      <=> v56(VarCurr,bitIndex1) )
      & ( v3556(VarCurr,bitIndex1)
      <=> v56(VarCurr,bitIndex0) ) ) )).

fof(addAssignmentInitValueVector_44,axiom,(
    ! [B] :
      ( range_3_0(B)
     => ( v56(constB0,B)
      <=> $false ) ) )).

fof(addAssignment_2568,axiom,(
    ! [VarCurr] :
      ( v3447(VarCurr)
    <=> v3449(VarCurr) ) )).

fof(addAssignment_2567,axiom,(
    ! [VarCurr] :
      ( v3449(VarCurr)
    <=> v3451(VarCurr) ) )).

fof(addParallelCaseBooleanConditionEqualRanges2_12,axiom,(
    ! [VarCurr] :
      ( ( ~ v3551(VarCurr)
        & ~ v3552(VarCurr) )
     => ( v3451(VarCurr)
      <=> $false ) ) )).

fof(addParallelCaseBooleanConditionEqualRanges1_32,axiom,(
    ! [VarCurr] :
      ( v3552(VarCurr)
     => ( v3451(VarCurr)
      <=> $true ) ) )).

fof(addParallelCaseBooleanConditionEqualRanges0_32,axiom,(
    ! [VarCurr] :
      ( v3551(VarCurr)
     => ( v3451(VarCurr)
      <=> $false ) ) )).

fof(addBitVectorEqualityBitBlasted_146,axiom,(
    ! [VarCurr] :
      ( v3552(VarCurr)
    <=> ( ( v3453(VarCurr,bitIndex1)
        <=> $false )
        & ( v3453(VarCurr,bitIndex0)
        <=> $true ) ) ) )).

fof(addBitVectorEqualityBitBlasted_145,axiom,(
    ! [VarCurr] :
      ( v3551(VarCurr)
    <=> ( ( v3453(VarCurr,bitIndex1)
        <=> $false )
        & ( v3453(VarCurr,bitIndex0)
        <=> $false ) ) ) )).

fof(addCaseBooleanConditionEqualRanges1_34,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( ~ v3536(VarNext)
       => ! [B] :
            ( range_1_0(B)
           => ( v3453(VarNext,B)
            <=> v3453(VarCurr,B) ) ) ) ) )).

fof(addCaseBooleanConditionEqualRanges0_47,axiom,(
    ! [VarNext] :
      ( v3536(VarNext)
     => ! [B] :
          ( range_1_0(B)
         => ( v3453(VarNext,B)
          <=> v3546(VarNext,B) ) ) ) )).

fof(addAssignment_2566,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ! [B] :
          ( range_1_0(B)
         => ( v3546(VarNext,B)
          <=> v3544(VarCurr,B) ) ) ) )).

fof(aaddConditionBooleanCondEqualRangesElseBranch_94,axiom,(
    ! [VarCurr] :
      ( ~ v3547(VarCurr)
     => ! [B] :
          ( range_1_0(B)
         => ( v3544(VarCurr,B)
          <=> v3455(VarCurr,B) ) ) ) )).

fof(addConditionBooleanCondEqualRangesThenBranch_97,axiom,(
    ! [VarCurr] :
      ( v3547(VarCurr)
     => ! [B] :
          ( range_1_0(B)
         => ( v3544(VarCurr,B)
          <=> $false ) ) ) )).

fof(addBitVectorEqualityBitBlasted_144,axiom,(
    ! [VarCurr] :
      ( v3547(VarCurr)
    <=> ( v62(VarCurr)
      <=> $false ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_703,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( v3536(VarNext)
      <=> v3537(VarNext) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_702,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( v3537(VarNext)
      <=> ( v3538(VarNext)
          & v3531(VarNext) ) ) ) )).

fof(writeUnaryOperator_329,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( ~ v3538(VarNext)
      <=> v3540(VarNext) ) ) )).

fof(addAssignment_2565,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( v3540(VarNext)
      <=> v3531(VarCurr) ) ) )).

fof(addAssignment_2564,axiom,(
    ! [VarCurr] :
      ( v3531(VarCurr)
    <=> v3533(VarCurr) ) )).

fof(addAssignment_2563,axiom,(
    ! [VarCurr] :
      ( v3533(VarCurr)
    <=> v1(VarCurr) ) )).

fof(addParallelCaseBooleanConditionEqualRanges2_11,axiom,(
    ! [VarCurr] :
      ( ( ~ v3520(VarCurr)
        & ~ v3529(VarCurr) )
     => ! [B] :
          ( range_1_0(B)
         => ( v3455(VarCurr,B)
          <=> $false ) ) ) )).

fof(addParallelCaseBooleanConditionEqualRanges1_31,axiom,(
    ! [VarCurr] :
      ( v3529(VarCurr)
     => ! [B] :
          ( range_1_0(B)
         => ( v3455(VarCurr,B)
          <=> $false ) ) ) )).

fof(addParallelCaseBooleanConditionEqualRanges0_31,axiom,(
    ! [VarCurr] :
      ( v3520(VarCurr)
     => ! [B] :
          ( range_1_0(B)
         => ( v3455(VarCurr,B)
          <=> v3521(VarCurr,B) ) ) ) )).

fof(addBitVectorEqualityBitBlasted_143,axiom,(
    ! [VarCurr] :
      ( v3529(VarCurr)
    <=> ( ( v3453(VarCurr,bitIndex1)
        <=> $false )
        & ( v3453(VarCurr,bitIndex0)
        <=> $true ) ) ) )).

fof(addParallelCaseBooleanConditionEqualRanges1_30,axiom,(
    ! [VarCurr] :
      ( ~ v3522(VarCurr)
     => ! [B] :
          ( range_1_0(B)
         => ( v3521(VarCurr,B)
          <=> v3524(VarCurr,B) ) ) ) )).

fof(addParallelCaseBooleanConditionEqualRanges0_30,axiom,(
    ! [VarCurr] :
      ( v3522(VarCurr)
     => ! [B] :
          ( range_1_0(B)
         => ( v3521(VarCurr,B)
          <=> $false ) ) ) )).

fof(addParallelCaseBooleanConditionEqualRanges1_29,axiom,(
    ! [VarCurr] :
      ( ~ v3525(VarCurr)
     => ! [B] :
          ( range_1_0(B)
         => ( v3524(VarCurr,B)
          <=> b01(B) ) ) ) )).

fof(addParallelCaseBooleanConditionEqualRanges0_29,axiom,(
    ! [VarCurr] :
      ( v3525(VarCurr)
     => ! [B] :
          ( range_1_0(B)
         => ( v3524(VarCurr,B)
          <=> $false ) ) ) )).

fof(addBitVectorEqualityBitBlasted_142,axiom,(
    ! [VarCurr] :
      ( v3527(VarCurr)
    <=> ( v3528(VarCurr)
      <=> $false ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_701,axiom,(
    ! [VarCurr] :
      ( v3528(VarCurr)
    <=> ( v3500(VarCurr)
        | v3502(VarCurr) ) ) )).

fof(addBitVectorEqualityBitBlasted_141,axiom,(
    ! [VarCurr] :
      ( v3525(VarCurr)
    <=> ( v3526(VarCurr)
      <=> $true ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_700,axiom,(
    ! [VarCurr] :
      ( v3526(VarCurr)
    <=> ( v3500(VarCurr)
        | v3502(VarCurr) ) ) )).

fof(addAssignmentInitValueVector_43,axiom,
    ( v3500(constB0)
  <=> $false )).

fof(addBitVectorEqualityBitBlasted_140,axiom,(
    ! [VarCurr] :
      ( v3523(VarCurr)
    <=> ( v3457(VarCurr)
      <=> $false ) ) )).

fof(addBitVectorEqualityBitBlasted_139,axiom,(
    ! [VarCurr] :
      ( v3522(VarCurr)
    <=> ( v3457(VarCurr)
      <=> $true ) ) )).

fof(addBitVectorEqualityBitBlasted_138,axiom,(
    ! [VarCurr] :
      ( v3520(VarCurr)
    <=> ( ( v3453(VarCurr,bitIndex1)
        <=> $false )
        & ( v3453(VarCurr,bitIndex0)
        <=> $false ) ) ) )).

fof(addAssignmentInitValueVector_42,axiom,(
    ! [B] :
      ( range_1_0(B)
     => ( v3453(constB0,B)
      <=> $false ) ) )).

fof(addAssignment_2562,axiom,(
    ! [VarCurr] :
      ( v3502(VarCurr)
    <=> v3504(VarCurr) ) )).

fof(addAssignment_2561,axiom,(
    ! [VarCurr] :
      ( v3504(VarCurr)
    <=> v3506(VarCurr) ) )).

fof(addAssignment_2560,axiom,(
    ! [VarCurr] :
      ( v3506(VarCurr)
    <=> v3508(VarCurr) ) )).

fof(addAssignment_2559,axiom,(
    ! [VarCurr] :
      ( v3508(VarCurr)
    <=> v3510(VarCurr) ) )).

fof(addAssignment_2558,axiom,(
    ! [VarCurr] :
      ( v3510(VarCurr)
    <=> v3512(VarCurr) ) )).

fof(addAssignment_2557,axiom,(
    ! [VarCurr] :
      ( v3512(VarCurr)
    <=> v3514(VarCurr) ) )).

fof(addAssignment_2556,axiom,(
    ! [VarCurr] :
      ( v3514(VarCurr)
    <=> v3516(VarCurr,bitIndex6) ) )).

fof(addAssignmentInitValue_30,axiom,(
    ~ v3516(constB0,bitIndex6) )).

fof(bitBlastConstant_616,axiom,(
    ~ bx0xxxxxx(bitIndex6) )).

fof(addAssignment_2555,axiom,(
    ! [VarCurr] :
      ( v3457(VarCurr)
    <=> v3459(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_699,axiom,(
    ! [VarCurr] :
      ( v3459(VarCurr)
    <=> ( v3493(VarCurr)
        & v3489(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_698,axiom,(
    ! [VarCurr] :
      ( v3493(VarCurr)
    <=> ( v3494(VarCurr)
        & v3485(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_697,axiom,(
    ! [VarCurr] :
      ( v3494(VarCurr)
    <=> ( v3495(VarCurr)
        & v3481(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_696,axiom,(
    ! [VarCurr] :
      ( v3495(VarCurr)
    <=> ( v3496(VarCurr)
        & v3477(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_695,axiom,(
    ! [VarCurr] :
      ( v3496(VarCurr)
    <=> ( v3497(VarCurr)
        & v3473(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_694,axiom,(
    ! [VarCurr] :
      ( v3497(VarCurr)
    <=> ( v3498(VarCurr)
        & v3469(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_693,axiom,(
    ! [VarCurr] :
      ( v3498(VarCurr)
    <=> ( v3461(VarCurr)
        & v3465(VarCurr) ) ) )).

fof(addAssignment_2554,axiom,(
    ! [VarCurr] :
      ( v3489(VarCurr)
    <=> v3491(VarCurr) ) )).

fof(addAssignmentInitValueVector_41,axiom,
    ( v3491(constB0)
  <=> $true )).

fof(addAssignment_2553,axiom,(
    ! [VarCurr] :
      ( v3485(VarCurr)
    <=> v3487(VarCurr) ) )).

fof(addAssignmentInitValueVector_40,axiom,
    ( v3487(constB0)
  <=> $true )).

fof(addAssignment_2552,axiom,(
    ! [VarCurr] :
      ( v3481(VarCurr)
    <=> v3483(VarCurr) ) )).

fof(addAssignmentInitValueVector_39,axiom,
    ( v3483(constB0)
  <=> $true )).

fof(addAssignment_2551,axiom,(
    ! [VarCurr] :
      ( v3477(VarCurr)
    <=> v3479(VarCurr) ) )).

fof(addAssignmentInitValueVector_38,axiom,
    ( v3479(constB0)
  <=> $true )).

fof(addAssignment_2550,axiom,(
    ! [VarCurr] :
      ( v3473(VarCurr)
    <=> v3475(VarCurr) ) )).

fof(addAssignmentInitValueVector_37,axiom,
    ( v3475(constB0)
  <=> $true )).

fof(addAssignment_2549,axiom,(
    ! [VarCurr] :
      ( v3469(VarCurr)
    <=> v3471(VarCurr) ) )).

fof(addAssignmentInitValueVector_36,axiom,
    ( v3471(constB0)
  <=> $true )).

fof(addAssignment_2548,axiom,(
    ! [VarCurr] :
      ( v3465(VarCurr)
    <=> v3467(VarCurr) ) )).

fof(addAssignmentInitValueVector_35,axiom,
    ( v3467(constB0)
  <=> $true )).

fof(addAssignment_2547,axiom,(
    ! [VarCurr] :
      ( v3461(VarCurr)
    <=> v3463(VarCurr) ) )).

fof(addAssignmentInitValueVector_34,axiom,
    ( v3463(constB0)
  <=> $true )).

fof(addAssignment_2546,axiom,(
    ! [VarCurr] :
      ( v69(VarCurr)
    <=> v71(VarCurr) ) )).

fof(addAssignment_2545,axiom,(
    ! [VarCurr] :
      ( v71(VarCurr)
    <=> v73(VarCurr) ) )).

fof(addAssignment_2544,axiom,(
    ! [VarCurr] :
      ( v73(VarCurr)
    <=> v75(VarCurr) ) )).

fof(addAssignment_2543,axiom,(
    ! [VarCurr] :
      ( v75(VarCurr)
    <=> v77(VarCurr) ) )).

fof(addAssignment_2542,axiom,(
    ! [VarCurr] :
      ( v77(VarCurr)
    <=> v79(VarCurr) ) )).

fof(addAssignment_2541,axiom,(
    ! [VarCurr] :
      ( v79(VarCurr)
    <=> v81(VarCurr) ) )).

fof(addAssignment_2540,axiom,(
    ! [VarCurr] :
      ( v81(VarCurr)
    <=> v83(VarCurr) ) )).

fof(addCaseBooleanConditionEqualRanges1_33,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( ~ v3426(VarNext)
       => ( v83(VarNext)
        <=> v83(VarCurr) ) ) ) )).

fof(addCaseBooleanConditionEqualRanges0_46,axiom,(
    ! [VarNext] :
      ( v3426(VarNext)
     => ( v83(VarNext)
      <=> v3434(VarNext) ) ) )).

fof(addAssignment_2539,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( v3434(VarNext)
      <=> v3432(VarCurr) ) ) )).

fof(aaddConditionBooleanCondEqualRangesElseBranch_93,axiom,(
    ! [VarCurr] :
      ( ~ v3435(VarCurr)
     => ( v3432(VarCurr)
      <=> v3436(VarCurr) ) ) )).

fof(addConditionBooleanCondEqualRangesThenBranch_96,axiom,(
    ! [VarCurr] :
      ( v3435(VarCurr)
     => ( v3432(VarCurr)
      <=> $false ) ) )).

fof(aaddConditionBooleanCondEqualRangesElseBranch_92,axiom,(
    ! [VarCurr] :
      ( ~ v3437(VarCurr)
     => ( v3436(VarCurr)
      <=> $false ) ) )).

fof(addConditionBooleanCondEqualRangesThenBranch_95,axiom,(
    ! [VarCurr] :
      ( v3437(VarCurr)
     => ( v3436(VarCurr)
      <=> $true ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_692,axiom,(
    ! [VarCurr] :
      ( v3437(VarCurr)
    <=> ( v3438(VarCurr)
        | v3442(VarCurr) ) ) )).

fof(writeBinaryOperatorShiftedRanges_545,axiom,(
    ! [VarCurr] :
      ( v3442(VarCurr)
    <=> ( v31(VarCurr,bitIndex9)
        & v3443(VarCurr) ) ) )).

fof(writeUnaryOperator_328,axiom,(
    ! [VarCurr] :
      ( ~ v3443(VarCurr)
    <=> v36(VarCurr,bitIndex9) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_691,axiom,(
    ! [VarCurr] :
      ( v3438(VarCurr)
    <=> ( v3439(VarCurr)
        | v3420(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_690,axiom,(
    ! [VarCurr] :
      ( v3439(VarCurr)
    <=> ( v3440(VarCurr)
        | v3415(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_689,axiom,(
    ! [VarCurr] :
      ( v3440(VarCurr)
    <=> ( v3441(VarCurr)
        | v879(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_688,axiom,(
    ! [VarCurr] :
      ( v3441(VarCurr)
    <=> ( v85(VarCurr)
        | v3410(VarCurr) ) ) )).

fof(writeUnaryOperator_327,axiom,(
    ! [VarCurr] :
      ( ~ v3435(VarCurr)
    <=> v33(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_687,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( v3426(VarNext)
      <=> v3427(VarNext) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_686,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( v3427(VarNext)
      <=> ( v3428(VarNext)
          & v1240(VarNext) ) ) ) )).

fof(writeUnaryOperator_326,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( ~ v3428(VarNext)
      <=> v1247(VarNext) ) ) )).

fof(writeBinaryOperatorShiftedRanges_544,axiom,(
    ! [VarCurr] :
      ( v3420(VarCurr)
    <=> ( v31(VarCurr,bitIndex8)
        & v3422(VarCurr) ) ) )).

fof(writeUnaryOperator_325,axiom,(
    ! [VarCurr] :
      ( ~ v3422(VarCurr)
    <=> v3423(VarCurr) ) )).

fof(writeBinaryOperatorShiftedRanges_543,axiom,(
    ! [VarCurr] :
      ( v3423(VarCurr)
    <=> ( v36(VarCurr,bitIndex8)
        | v36(VarCurr,bitIndex9) ) ) )).

fof(writeBinaryOperatorShiftedRanges_542,axiom,(
    ! [VarCurr] :
      ( v3415(VarCurr)
    <=> ( v31(VarCurr,bitIndex5)
        & v3417(VarCurr) ) ) )).

fof(writeUnaryOperator_324,axiom,(
    ! [VarCurr] :
      ( ~ v3417(VarCurr)
    <=> v3418(VarCurr) ) )).

fof(writeBinaryOperatorShiftedRanges_541,axiom,(
    ! [VarCurr] :
      ( v3418(VarCurr)
    <=> ( v36(VarCurr,bitIndex5)
        | v36(VarCurr,bitIndex9) ) ) )).

fof(writeBinaryOperatorShiftedRanges_540,axiom,(
    ! [VarCurr] :
      ( v3410(VarCurr)
    <=> ( v31(VarCurr,bitIndex2)
        & v3412(VarCurr) ) ) )).

fof(writeUnaryOperator_323,axiom,(
    ! [VarCurr] :
      ( ~ v3412(VarCurr)
    <=> v3413(VarCurr) ) )).

fof(writeBinaryOperatorShiftedRanges_539,axiom,(
    ! [VarCurr] :
      ( v3413(VarCurr)
    <=> ( v36(VarCurr,bitIndex2)
        | v36(VarCurr,bitIndex9) ) ) )).

fof(addAssignment_2538,axiom,(
    ! [VarCurr] :
      ( v85(VarCurr)
    <=> v36(VarCurr,bitIndex3) ) )).

fof(addConditionBooleanCondShiftedRangesElseBranch_21,axiom,(
    ! [VarCurr] :
      ( ~ v3398(VarCurr)
     => ( v36(VarCurr,bitIndex3)
      <=> $false ) ) )).

fof(addConditionBooleanCondShiftedRangesThenBranch_18,axiom,(
    ! [VarCurr] :
      ( v3398(VarCurr)
     => ( v36(VarCurr,bitIndex3)
      <=> $true ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_685,axiom,(
    ! [VarCurr] :
      ( v3398(VarCurr)
    <=> ( v3399(VarCurr)
        | v3407(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_684,axiom,(
    ! [VarCurr] :
      ( v3407(VarCurr)
    <=> ( v3408(VarCurr)
        & v3348(VarCurr) ) ) )).

fof(writeUnaryOperator_322,axiom,(
    ! [VarCurr] :
      ( ~ v3408(VarCurr)
    <=> v38(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_683,axiom,(
    ! [VarCurr] :
      ( v3399(VarCurr)
    <=> ( v3400(VarCurr)
        | v3405(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_682,axiom,(
    ! [VarCurr] :
      ( v3405(VarCurr)
    <=> ( v3406(VarCurr)
        & v1360(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_681,axiom,(
    ! [VarCurr] :
      ( v3406(VarCurr)
    <=> ( v3346(VarCurr)
        & v1682(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_680,axiom,(
    ! [VarCurr] :
      ( v3400(VarCurr)
    <=> ( v3401(VarCurr)
        | v3403(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_679,axiom,(
    ! [VarCurr] :
      ( v3403(VarCurr)
    <=> ( v3404(VarCurr)
        & v1355(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_678,axiom,(
    ! [VarCurr] :
      ( v3404(VarCurr)
    <=> ( v3346(VarCurr)
        & v1682(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_677,axiom,(
    ! [VarCurr] :
      ( v3401(VarCurr)
    <=> ( v3402(VarCurr)
        & v1348(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_676,axiom,(
    ! [VarCurr] :
      ( v3402(VarCurr)
    <=> ( v3346(VarCurr)
        & v1682(VarCurr) ) ) )).

fof(addAssignment_2537,axiom,(
    ! [VarCurr] :
      ( v87(VarCurr)
    <=> v89(VarCurr) ) )).

fof(addAssignment_2536,axiom,(
    ! [VarCurr] :
      ( v89(VarCurr)
    <=> v91(VarCurr,bitIndex0) ) )).

fof(addAssignment_2535,axiom,(
    ! [VarCurr] :
      ( v91(VarCurr,bitIndex0)
    <=> v898(VarCurr,bitIndex0) ) )).

fof(addAssignment_2534,axiom,(
    ! [VarCurr] :
      ( v892(VarCurr,bitIndex0)
    <=> v896(VarCurr,bitIndex0) ) )).

fof(addAssignment_2533,axiom,(
    ! [VarCurr] :
      ( v885(VarCurr,bitIndex0)
    <=> v889(VarCurr,bitIndex0) ) )).

fof(writeUnaryOperator_321,axiom,(
    ! [VarCurr] :
      ( ~ v93(VarCurr)
    <=> v3396(VarCurr) ) )).

fof(writeBinaryOperatorShiftedRanges_538,axiom,(
    ! [VarCurr] :
      ( v3396(VarCurr)
    <=> ( v3358(VarCurr)
        | v95(VarCurr,bitIndex2) ) ) )).

fof(writeBinaryOperatorEqualRangesMultipleBits_97,axiom,(
    ! [VarCurr,B] :
      ( range_2_0(B)
     => ( v95(VarCurr,B)
      <=> ( v97(VarCurr,B)
          & v3309(VarCurr,B) ) ) ) )).

fof(addCaseBooleanConditionEqualRanges1_32,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( ~ v3371(VarNext)
       => ! [B] :
            ( range_2_0(B)
           => ( v3309(VarNext,B)
            <=> v3309(VarCurr,B) ) ) ) ) )).

fof(addCaseBooleanConditionEqualRanges0_45,axiom,(
    ! [VarNext] :
      ( v3371(VarNext)
     => ! [B] :
          ( range_2_0(B)
         => ( v3309(VarNext,B)
          <=> v3390(VarNext,B) ) ) ) )).

fof(addAssignment_2532,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ! [B] :
          ( range_2_0(B)
         => ( v3390(VarNext,B)
          <=> v3388(VarCurr,B) ) ) ) )).

fof(addParallelCaseBooleanConditionEqualRanges1_28,axiom,(
    ! [VarCurr] :
      ( ~ v3382(VarCurr)
     => ! [B] :
          ( range_2_0(B)
         => ( v3388(VarCurr,B)
          <=> v3391(VarCurr,B) ) ) ) )).

fof(addParallelCaseBooleanConditionEqualRanges0_28,axiom,(
    ! [VarCurr] :
      ( v3382(VarCurr)
     => ! [B] :
          ( range_2_0(B)
         => ( v3388(VarCurr,B)
          <=> $true ) ) ) )).

fof(addParallelCaseBooleanConditionEqualRanges1_27,axiom,(
    ! [VarCurr] :
      ( ~ v3313(VarCurr)
     => ! [B] :
          ( range_2_0(B)
         => ( v3391(VarCurr,B)
          <=> v887(VarCurr,B) ) ) ) )).

fof(addParallelCaseBooleanConditionEqualRanges0_27,axiom,(
    ! [VarCurr] :
      ( v3313(VarCurr)
     => ! [B] :
          ( range_2_0(B)
         => ( v3391(VarCurr,B)
          <=> v894(VarCurr,B) ) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_675,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( v3371(VarNext)
      <=> ( v3372(VarNext)
          & v3381(VarNext) ) ) ) )).

fof(addAssignment_2531,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( v3381(VarNext)
      <=> v3379(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_674,axiom,(
    ! [VarCurr] :
      ( v3379(VarCurr)
    <=> ( v3382(VarCurr)
        | v3383(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_673,axiom,(
    ! [VarCurr] :
      ( v3383(VarCurr)
    <=> ( v3384(VarCurr)
        & v3387(VarCurr) ) ) )).

fof(writeUnaryOperator_320,axiom,(
    ! [VarCurr] :
      ( ~ v3387(VarCurr)
    <=> v3382(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_672,axiom,(
    ! [VarCurr] :
      ( v3384(VarCurr)
    <=> ( v3313(VarCurr)
        | v3385(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_671,axiom,(
    ! [VarCurr] :
      ( v3385(VarCurr)
    <=> ( v3361(VarCurr)
        & v3386(VarCurr) ) ) )).

fof(writeUnaryOperator_319,axiom,(
    ! [VarCurr] :
      ( ~ v3386(VarCurr)
    <=> v3313(VarCurr) ) )).

fof(writeUnaryOperator_318,axiom,(
    ! [VarCurr] :
      ( ~ v3382(VarCurr)
    <=> v3311(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_670,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( v3372(VarNext)
      <=> ( v3373(VarNext)
          & v3368(VarNext) ) ) ) )).

fof(writeUnaryOperator_317,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( ~ v3373(VarNext)
      <=> v3375(VarNext) ) ) )).

fof(addAssignment_2530,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( v3375(VarNext)
      <=> v3368(VarCurr) ) ) )).

fof(addAssignmentInitValueVector_33,axiom,(
    ! [B] :
      ( range_2_0(B)
     => ( v3309(constB0,B)
      <=> $true ) ) )).

fof(addAssignment_2529,axiom,(
    ! [VarCurr] :
      ( v3368(VarCurr)
    <=> v288(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_669,axiom,(
    ! [VarCurr] :
      ( v3361(VarCurr)
    <=> ( v3363(VarCurr)
        & v3366(VarCurr) ) ) )).

fof(writeUnaryOperator_316,axiom,(
    ! [VarCurr] :
      ( ~ v3366(VarCurr)
    <=> v3315(VarCurr) ) )).

fof(writeBinaryOperatorShiftedRanges_537,axiom,(
    ! [VarCurr] :
      ( v3363(VarCurr)
    <=> ( v3365(VarCurr)
        | v97(VarCurr,bitIndex2) ) ) )).

fof(writeBinaryOperatorShiftedRanges_536,axiom,(
    ! [VarCurr] :
      ( v3365(VarCurr)
    <=> ( v97(VarCurr,bitIndex0)
        | v97(VarCurr,bitIndex1) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_668,axiom,(
    ! [VarCurr] :
      ( v3313(VarCurr)
    <=> ( v3356(VarCurr)
        & v3359(VarCurr) ) ) )).

fof(writeUnaryOperator_315,axiom,(
    ! [VarCurr] :
      ( ~ v3359(VarCurr)
    <=> v3315(VarCurr) ) )).

fof(writeBinaryOperatorShiftedRanges_535,axiom,(
    ! [VarCurr] :
      ( v3356(VarCurr)
    <=> ( v3358(VarCurr)
        | v95(VarCurr,bitIndex2) ) ) )).

fof(writeBinaryOperatorShiftedRanges_534,axiom,(
    ! [VarCurr] :
      ( v3358(VarCurr)
    <=> ( v95(VarCurr,bitIndex0)
        | v95(VarCurr,bitIndex1) ) ) )).

fof(addAssignment_2528,axiom,(
    ! [VarCurr] :
      ( v3315(VarCurr)
    <=> v3317(VarCurr) ) )).

fof(addAssignment_2527,axiom,(
    ! [VarCurr] :
      ( v3317(VarCurr)
    <=> v3319(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_667,axiom,(
    ! [VarCurr] :
      ( v3319(VarCurr)
    <=> ( v3350(VarCurr)
        | v38(VarCurr) ) ) )).

fof(writeBinaryOperatorShiftedRanges_533,axiom,(
    ! [VarCurr] :
      ( v3350(VarCurr)
    <=> ( v3351(VarCurr)
        | v36(VarCurr,bitIndex11) ) ) )).

fof(writeBinaryOperatorShiftedRanges_532,axiom,(
    ! [VarCurr] :
      ( v3351(VarCurr)
    <=> ( v3352(VarCurr)
        | v36(VarCurr,bitIndex10) ) ) )).

fof(writeBinaryOperatorShiftedRanges_531,axiom,(
    ! [VarCurr] :
      ( v3352(VarCurr)
    <=> ( v3353(VarCurr)
        | v36(VarCurr,bitIndex9) ) ) )).

fof(writeBinaryOperatorShiftedRanges_530,axiom,(
    ! [VarCurr] :
      ( v3353(VarCurr)
    <=> ( v3354(VarCurr)
        | v36(VarCurr,bitIndex8) ) ) )).

fof(writeBinaryOperatorShiftedRanges_529,axiom,(
    ! [VarCurr] :
      ( v3354(VarCurr)
    <=> ( v36(VarCurr,bitIndex2)
        | v36(VarCurr,bitIndex5) ) ) )).

fof(addConditionBooleanCondShiftedRangesElseBranch_20,axiom,(
    ! [VarCurr] :
      ( ~ v3331(VarCurr)
     => ( v36(VarCurr,bitIndex10)
      <=> $false ) ) )).

fof(addConditionBooleanCondShiftedRangesThenBranch_17,axiom,(
    ! [VarCurr] :
      ( v3331(VarCurr)
     => ( v36(VarCurr,bitIndex10)
      <=> $true ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_666,axiom,(
    ! [VarCurr] :
      ( v3331(VarCurr)
    <=> ( v3332(VarCurr)
        | v3347(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_665,axiom,(
    ! [VarCurr] :
      ( v3347(VarCurr)
    <=> ( v38(VarCurr)
        & v3348(VarCurr) ) ) )).

fof(addBitVectorEqualityBitBlasted_137,axiom,(
    ! [VarCurr] :
      ( v3348(VarCurr)
    <=> ( $true
      <=> v31(VarCurr,bitIndex10) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_664,axiom,(
    ! [VarCurr] :
      ( v3332(VarCurr)
    <=> ( v3333(VarCurr)
        | v3343(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_663,axiom,(
    ! [VarCurr] :
      ( v3343(VarCurr)
    <=> ( v3344(VarCurr)
        & v1323(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_662,axiom,(
    ! [VarCurr] :
      ( v3344(VarCurr)
    <=> ( v3346(VarCurr)
        & v1682(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_661,axiom,(
    ! [VarCurr] :
      ( v3346(VarCurr)
    <=> ( v1678(VarCurr)
        & v1162(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_660,axiom,(
    ! [VarCurr] :
      ( v3333(VarCurr)
    <=> ( v3334(VarCurr)
        | v3341(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_659,axiom,(
    ! [VarCurr] :
      ( v3341(VarCurr)
    <=> ( v3342(VarCurr)
        & v1300(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_658,axiom,(
    ! [VarCurr] :
      ( v3342(VarCurr)
    <=> ( v3338(VarCurr)
        & v1682(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_657,axiom,(
    ! [VarCurr] :
      ( v3334(VarCurr)
    <=> ( v3335(VarCurr)
        | v3339(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_656,axiom,(
    ! [VarCurr] :
      ( v3339(VarCurr)
    <=> ( v3340(VarCurr)
        & v1278(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_655,axiom,(
    ! [VarCurr] :
      ( v3340(VarCurr)
    <=> ( v3338(VarCurr)
        & v1682(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_654,axiom,(
    ! [VarCurr] :
      ( v3335(VarCurr)
    <=> ( v3336(VarCurr)
        & v1238(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_653,axiom,(
    ! [VarCurr] :
      ( v3336(VarCurr)
    <=> ( v3338(VarCurr)
        & v1682(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_652,axiom,(
    ! [VarCurr] :
      ( v3338(VarCurr)
    <=> ( v1690(VarCurr)
        & v1162(VarCurr) ) ) )).

fof(addAssignment_2526,axiom,(
    ! [VarNext] :
      ( v31(VarNext,bitIndex10)
    <=> v3323(VarNext,bitIndex9) ) )).

fof(addCaseBooleanConditionShiftedRanges1_13,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( ~ v3324(VarNext)
       => ( ( v3323(VarNext,bitIndex10)
          <=> v31(VarCurr,bitIndex11) )
          & ( v3323(VarNext,bitIndex9)
          <=> v31(VarCurr,bitIndex10) )
          & ( v3323(VarNext,bitIndex8)
          <=> v31(VarCurr,bitIndex9) )
          & ( v3323(VarNext,bitIndex7)
          <=> v31(VarCurr,bitIndex8) )
          & ( v3323(VarNext,bitIndex6)
          <=> v31(VarCurr,bitIndex7) )
          & ( v3323(VarNext,bitIndex5)
          <=> v31(VarCurr,bitIndex6) )
          & ( v3323(VarNext,bitIndex4)
          <=> v31(VarCurr,bitIndex5) )
          & ( v3323(VarNext,bitIndex3)
          <=> v31(VarCurr,bitIndex4) )
          & ( v3323(VarNext,bitIndex2)
          <=> v31(VarCurr,bitIndex3) )
          & ( v3323(VarNext,bitIndex1)
          <=> v31(VarCurr,bitIndex2) )
          & ( v3323(VarNext,bitIndex0)
          <=> v31(VarCurr,bitIndex1) ) ) ) ) )).

fof(addCaseBooleanConditionEqualRanges0_44,axiom,(
    ! [VarNext] :
      ( v3324(VarNext)
     => ! [B] :
          ( range_10_0(B)
         => ( v3323(VarNext,B)
          <=> v1253(VarNext,B) ) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_651,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( v3324(VarNext)
      <=> v3325(VarNext) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_650,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( v3325(VarNext)
      <=> ( v3327(VarNext)
          & v1240(VarNext) ) ) ) )).

fof(writeUnaryOperator_314,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( ~ v3327(VarNext)
      <=> v1247(VarNext) ) ) )).

fof(addAssignment_2525,axiom,(
    ! [VarCurr] :
      ( v3311(VarCurr)
    <=> v12(VarCurr) ) )).

fof(addAssignment_2524,axiom,(
    ! [VarCurr] :
      ( v97(VarCurr,bitIndex0)
    <=> v3301(VarCurr) ) )).

fof(addAssignment_2523,axiom,(
    ! [VarCurr] :
      ( v97(VarCurr,bitIndex1)
    <=> v308(VarCurr) ) )).

fof(addAssignment_2522,axiom,(
    ! [VarCurr] :
      ( v97(VarCurr,bitIndex2)
    <=> v99(VarCurr) ) )).

fof(addAssignment_2521,axiom,(
    ! [VarCurr] :
      ( v3301(VarCurr)
    <=> v3303(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_649,axiom,(
    ! [VarCurr] :
      ( v3303(VarCurr)
    <=> ( v3305(VarCurr)
        & v3306(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_648,axiom,(
    ! [VarCurr] :
      ( v3306(VarCurr)
    <=> ( v1162(VarCurr)
        | v907(VarCurr) ) ) )).

fof(writeUnaryOperator_313,axiom,(
    ! [VarCurr] :
      ( ~ v3305(VarCurr)
    <=> v1031(VarCurr) ) )).

fof(addAssignment_2520,axiom,(
    ! [VarCurr] :
      ( v308(VarCurr)
    <=> v310(VarCurr) ) )).

fof(writeUnaryOperator_312,axiom,(
    ! [VarCurr] :
      ( ~ v310(VarCurr)
    <=> v312(VarCurr) ) )).

fof(addAssignment_2519,axiom,(
    ! [VarCurr] :
      ( v312(VarCurr)
    <=> v314(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_647,axiom,(
    ! [VarCurr] :
      ( v314(VarCurr)
    <=> ( v316(VarCurr)
        | v3201(VarCurr) ) ) )).

fof(addAssignment_2518,axiom,(
    ! [VarCurr] :
      ( v3201(VarCurr)
    <=> v3203(VarCurr) ) )).

fof(addBitVectorEqualityBitBlasted_136,axiom,(
    ! [VarCurr] :
      ( v3203(VarCurr)
    <=> ( ( v3205(VarCurr,bitIndex4)
        <=> $false )
        & ( v3205(VarCurr,bitIndex3)
        <=> $false )
        & ( v3205(VarCurr,bitIndex2)
        <=> $false )
        & ( v3205(VarCurr,bitIndex1)
        <=> $false )
        & ( v3205(VarCurr,bitIndex0)
        <=> $false ) ) ) )).

fof(addCaseBooleanConditionEqualRanges1_31,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( ~ v3285(VarNext)
       => ! [B] :
            ( range_4_0(B)
           => ( v3205(VarNext,B)
            <=> v3205(VarCurr,B) ) ) ) ) )).

fof(addCaseBooleanConditionEqualRanges0_43,axiom,(
    ! [VarNext] :
      ( v3285(VarNext)
     => ! [B] :
          ( range_4_0(B)
         => ( v3205(VarNext,B)
          <=> v3293(VarNext,B) ) ) ) )).

fof(addAssignment_2517,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ! [B] :
          ( range_4_0(B)
         => ( v3293(VarNext,B)
          <=> v3291(VarCurr,B) ) ) ) )).

fof(aaddConditionBooleanCondEqualRangesElseBranch_91,axiom,(
    ! [VarCurr] :
      ( ~ v3294(VarCurr)
     => ! [B] :
          ( range_4_0(B)
         => ( v3291(VarCurr,B)
          <=> v3207(VarCurr,B) ) ) ) )).

fof(addConditionBooleanCondEqualRangesThenBranch_94,axiom,(
    ! [VarCurr] :
      ( v3294(VarCurr)
     => ! [B] :
          ( range_4_0(B)
         => ( v3291(VarCurr,B)
          <=> $false ) ) ) )).

fof(writeUnaryOperator_311,axiom,(
    ! [VarCurr] :
      ( ~ v3294(VarCurr)
    <=> v754(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_646,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( v3285(VarNext)
      <=> v3286(VarNext) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_645,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( v3286(VarNext)
      <=> ( v3287(VarNext)
          & v751(VarNext) ) ) ) )).

fof(writeUnaryOperator_310,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( ~ v3287(VarNext)
      <=> v823(VarNext) ) ) )).

fof(addParallelCaseBooleanConditionEqualRanges3_7,axiom,(
    ! [VarCurr] :
      ( ( ~ v3209(VarCurr)
        & ~ v3211(VarCurr)
        & ~ v3252(VarCurr) )
     => ! [B] :
          ( range_4_0(B)
         => ( v3207(VarCurr,B)
          <=> v3205(VarCurr,B) ) ) ) )).

fof(addParallelCaseBooleanConditionEqualRanges2_10,axiom,(
    ! [VarCurr] :
      ( v3252(VarCurr)
     => ! [B] :
          ( range_4_0(B)
         => ( v3207(VarCurr,B)
          <=> v3254(VarCurr,B) ) ) ) )).

fof(addParallelCaseBooleanConditionEqualRanges1_26,axiom,(
    ! [VarCurr] :
      ( v3211(VarCurr)
     => ! [B] :
          ( range_4_0(B)
         => ( v3207(VarCurr,B)
          <=> v3213(VarCurr,B) ) ) ) )).

fof(addParallelCaseBooleanConditionEqualRanges0_26,axiom,(
    ! [VarCurr] :
      ( v3209(VarCurr)
     => ! [B] :
          ( range_4_0(B)
         => ( v3207(VarCurr,B)
          <=> v3205(VarCurr,B) ) ) ) )).

fof(addBitVectorEqualityBitBlasted_135,axiom,(
    ! [VarCurr] :
      ( v3281(VarCurr)
    <=> ( ( v3282(VarCurr,bitIndex1)
        <=> $true )
        & ( v3282(VarCurr,bitIndex0)
        <=> $true ) ) ) )).

fof(addAssignment_2516,axiom,(
    ! [VarCurr] :
      ( v3282(VarCurr,bitIndex0)
    <=> v873(VarCurr) ) )).

fof(addAssignment_2515,axiom,(
    ! [VarCurr] :
      ( v3282(VarCurr,bitIndex1)
    <=> v783(VarCurr) ) )).

fof(aaddConditionBooleanCondEqualRangesElseBranch_90,axiom,(
    ! [VarCurr] :
      ( ~ v3255(VarCurr)
     => ! [B] :
          ( range_4_0(B)
         => ( v3254(VarCurr,B)
          <=> v3256(VarCurr,B) ) ) ) )).

fof(addConditionBooleanCondEqualRangesThenBranch_93,axiom,(
    ! [VarCurr] :
      ( v3255(VarCurr)
     => ! [B] :
          ( range_4_0(B)
         => ( v3254(VarCurr,B)
          <=> b10000(B) ) ) ) )).

fof(addAssignment_2514,axiom,(
    ! [VarCurr] :
      ( v3256(VarCurr,bitIndex0)
    <=> v3278(VarCurr) ) )).

fof(addAssignment_2513,axiom,(
    ! [VarCurr] :
      ( v3256(VarCurr,bitIndex1)
    <=> v3276(VarCurr) ) )).

fof(addAssignment_2512,axiom,(
    ! [VarCurr] :
      ( v3256(VarCurr,bitIndex2)
    <=> v3271(VarCurr) ) )).

fof(addAssignment_2511,axiom,(
    ! [VarCurr] :
      ( v3256(VarCurr,bitIndex3)
    <=> v3266(VarCurr) ) )).

fof(addAssignment_2510,axiom,(
    ! [VarCurr] :
      ( v3256(VarCurr,bitIndex4)
    <=> v3258(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_644,axiom,(
    ! [VarCurr] :
      ( v3276(VarCurr)
    <=> ( v3277(VarCurr)
        & v3280(VarCurr) ) ) )).

fof(writeBinaryOperatorShiftedRanges_528,axiom,(
    ! [VarCurr] :
      ( v3280(VarCurr)
    <=> ( v3205(VarCurr,bitIndex0)
        | v3205(VarCurr,bitIndex1) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_643,axiom,(
    ! [VarCurr] :
      ( v3277(VarCurr)
    <=> ( v3278(VarCurr)
        | v3279(VarCurr) ) ) )).

fof(writeUnaryOperator_309,axiom,(
    ! [VarCurr] :
      ( ~ v3279(VarCurr)
    <=> v3205(VarCurr,bitIndex1) ) )).

fof(writeUnaryOperator_308,axiom,(
    ! [VarCurr] :
      ( ~ v3278(VarCurr)
    <=> v3205(VarCurr,bitIndex0) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_642,axiom,(
    ! [VarCurr] :
      ( v3271(VarCurr)
    <=> ( v3272(VarCurr)
        & v3275(VarCurr) ) ) )).

fof(writeBinaryOperatorShiftedRanges_527,axiom,(
    ! [VarCurr] :
      ( v3275(VarCurr)
    <=> ( v3263(VarCurr)
        | v3205(VarCurr,bitIndex2) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_641,axiom,(
    ! [VarCurr] :
      ( v3272(VarCurr)
    <=> ( v3273(VarCurr)
        | v3274(VarCurr) ) ) )).

fof(writeUnaryOperator_307,axiom,(
    ! [VarCurr] :
      ( ~ v3274(VarCurr)
    <=> v3205(VarCurr,bitIndex2) ) )).

fof(writeUnaryOperator_306,axiom,(
    ! [VarCurr] :
      ( ~ v3273(VarCurr)
    <=> v3263(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_640,axiom,(
    ! [VarCurr] :
      ( v3266(VarCurr)
    <=> ( v3267(VarCurr)
        & v3270(VarCurr) ) ) )).

fof(writeBinaryOperatorShiftedRanges_526,axiom,(
    ! [VarCurr] :
      ( v3270(VarCurr)
    <=> ( v3262(VarCurr)
        | v3205(VarCurr,bitIndex3) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_639,axiom,(
    ! [VarCurr] :
      ( v3267(VarCurr)
    <=> ( v3268(VarCurr)
        | v3269(VarCurr) ) ) )).

fof(writeUnaryOperator_305,axiom,(
    ! [VarCurr] :
      ( ~ v3269(VarCurr)
    <=> v3205(VarCurr,bitIndex3) ) )).

fof(writeUnaryOperator_304,axiom,(
    ! [VarCurr] :
      ( ~ v3268(VarCurr)
    <=> v3262(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_638,axiom,(
    ! [VarCurr] :
      ( v3258(VarCurr)
    <=> ( v3259(VarCurr)
        & v3265(VarCurr) ) ) )).

fof(writeBinaryOperatorShiftedRanges_525,axiom,(
    ! [VarCurr] :
      ( v3265(VarCurr)
    <=> ( v3261(VarCurr)
        | v3205(VarCurr,bitIndex4) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_637,axiom,(
    ! [VarCurr] :
      ( v3259(VarCurr)
    <=> ( v3260(VarCurr)
        | v3264(VarCurr) ) ) )).

fof(writeUnaryOperator_303,axiom,(
    ! [VarCurr] :
      ( ~ v3264(VarCurr)
    <=> v3205(VarCurr,bitIndex4) ) )).

fof(writeUnaryOperator_302,axiom,(
    ! [VarCurr] :
      ( ~ v3260(VarCurr)
    <=> v3261(VarCurr) ) )).

fof(writeBinaryOperatorShiftedRanges_524,axiom,(
    ! [VarCurr] :
      ( v3261(VarCurr)
    <=> ( v3262(VarCurr)
        & v3205(VarCurr,bitIndex3) ) ) )).

fof(writeBinaryOperatorShiftedRanges_523,axiom,(
    ! [VarCurr] :
      ( v3262(VarCurr)
    <=> ( v3263(VarCurr)
        & v3205(VarCurr,bitIndex2) ) ) )).

fof(writeBinaryOperatorShiftedRanges_522,axiom,(
    ! [VarCurr] :
      ( v3263(VarCurr)
    <=> ( v3205(VarCurr,bitIndex0)
        & v3205(VarCurr,bitIndex1) ) ) )).

fof(addBitVectorEqualityBitBlasted_134,axiom,(
    ! [VarCurr] :
      ( v3255(VarCurr)
    <=> ( ( v3205(VarCurr,bitIndex4)
        <=> $true )
        & ( v3205(VarCurr,bitIndex3)
        <=> $false )
        & ( v3205(VarCurr,bitIndex2)
        <=> $false )
        & ( v3205(VarCurr,bitIndex1)
        <=> $false )
        & ( v3205(VarCurr,bitIndex0)
        <=> $false ) ) ) )).

fof(addBitVectorEqualityBitBlasted_133,axiom,(
    ! [VarCurr] :
      ( v3252(VarCurr)
    <=> ( ( v3253(VarCurr,bitIndex1)
        <=> $true )
        & ( v3253(VarCurr,bitIndex0)
        <=> $false ) ) ) )).

fof(addAssignment_2509,axiom,(
    ! [VarCurr] :
      ( v3253(VarCurr,bitIndex0)
    <=> v873(VarCurr) ) )).

fof(addAssignment_2508,axiom,(
    ! [VarCurr] :
      ( v3253(VarCurr,bitIndex1)
    <=> v783(VarCurr) ) )).

fof(aaddConditionBooleanCondEqualRangesElseBranch_89,axiom,(
    ! [VarCurr] :
      ( ~ v3214(VarCurr)
     => ! [B] :
          ( range_31_0(B)
         => ( v3213(VarCurr,B)
          <=> v3215(VarCurr,B) ) ) ) )).

fof(addConditionBooleanCondEqualRangesThenBranch_92,axiom,(
    ! [VarCurr] :
      ( v3214(VarCurr)
     => ! [B] :
          ( range_31_0(B)
         => ( v3213(VarCurr,B)
          <=> $false ) ) ) )).

fof(addSignExtensionConstraint_130,axiom,(
    ! [VarCurr] :
      ( v3215(VarCurr,bitIndex6)
    <=> v3216(VarCurr,bitIndex5) ) )).

fof(addSignExtensionConstraint_129,axiom,(
    ! [VarCurr] :
      ( v3215(VarCurr,bitIndex7)
    <=> v3216(VarCurr,bitIndex5) ) )).

fof(addSignExtensionConstraint_128,axiom,(
    ! [VarCurr] :
      ( v3215(VarCurr,bitIndex8)
    <=> v3216(VarCurr,bitIndex5) ) )).

fof(addSignExtensionConstraint_127,axiom,(
    ! [VarCurr] :
      ( v3215(VarCurr,bitIndex9)
    <=> v3216(VarCurr,bitIndex5) ) )).

fof(addSignExtensionConstraint_126,axiom,(
    ! [VarCurr] :
      ( v3215(VarCurr,bitIndex10)
    <=> v3216(VarCurr,bitIndex5) ) )).

fof(addSignExtensionConstraint_125,axiom,(
    ! [VarCurr] :
      ( v3215(VarCurr,bitIndex11)
    <=> v3216(VarCurr,bitIndex5) ) )).

fof(addSignExtensionConstraint_124,axiom,(
    ! [VarCurr] :
      ( v3215(VarCurr,bitIndex12)
    <=> v3216(VarCurr,bitIndex5) ) )).

fof(addSignExtensionConstraint_123,axiom,(
    ! [VarCurr] :
      ( v3215(VarCurr,bitIndex13)
    <=> v3216(VarCurr,bitIndex5) ) )).

fof(addSignExtensionConstraint_122,axiom,(
    ! [VarCurr] :
      ( v3215(VarCurr,bitIndex14)
    <=> v3216(VarCurr,bitIndex5) ) )).

fof(addSignExtensionConstraint_121,axiom,(
    ! [VarCurr] :
      ( v3215(VarCurr,bitIndex15)
    <=> v3216(VarCurr,bitIndex5) ) )).

fof(addSignExtensionConstraint_120,axiom,(
    ! [VarCurr] :
      ( v3215(VarCurr,bitIndex16)
    <=> v3216(VarCurr,bitIndex5) ) )).

fof(addSignExtensionConstraint_119,axiom,(
    ! [VarCurr] :
      ( v3215(VarCurr,bitIndex17)
    <=> v3216(VarCurr,bitIndex5) ) )).

fof(addSignExtensionConstraint_118,axiom,(
    ! [VarCurr] :
      ( v3215(VarCurr,bitIndex18)
    <=> v3216(VarCurr,bitIndex5) ) )).

fof(addSignExtensionConstraint_117,axiom,(
    ! [VarCurr] :
      ( v3215(VarCurr,bitIndex19)
    <=> v3216(VarCurr,bitIndex5) ) )).

fof(addSignExtensionConstraint_116,axiom,(
    ! [VarCurr] :
      ( v3215(VarCurr,bitIndex20)
    <=> v3216(VarCurr,bitIndex5) ) )).

fof(addSignExtensionConstraint_115,axiom,(
    ! [VarCurr] :
      ( v3215(VarCurr,bitIndex21)
    <=> v3216(VarCurr,bitIndex5) ) )).

fof(addSignExtensionConstraint_114,axiom,(
    ! [VarCurr] :
      ( v3215(VarCurr,bitIndex22)
    <=> v3216(VarCurr,bitIndex5) ) )).

fof(addSignExtensionConstraint_113,axiom,(
    ! [VarCurr] :
      ( v3215(VarCurr,bitIndex23)
    <=> v3216(VarCurr,bitIndex5) ) )).

fof(addSignExtensionConstraint_112,axiom,(
    ! [VarCurr] :
      ( v3215(VarCurr,bitIndex24)
    <=> v3216(VarCurr,bitIndex5) ) )).

fof(addSignExtensionConstraint_111,axiom,(
    ! [VarCurr] :
      ( v3215(VarCurr,bitIndex25)
    <=> v3216(VarCurr,bitIndex5) ) )).

fof(addSignExtensionConstraint_110,axiom,(
    ! [VarCurr] :
      ( v3215(VarCurr,bitIndex26)
    <=> v3216(VarCurr,bitIndex5) ) )).

fof(addSignExtensionConstraint_109,axiom,(
    ! [VarCurr] :
      ( v3215(VarCurr,bitIndex27)
    <=> v3216(VarCurr,bitIndex5) ) )).

fof(addSignExtensionConstraint_108,axiom,(
    ! [VarCurr] :
      ( v3215(VarCurr,bitIndex28)
    <=> v3216(VarCurr,bitIndex5) ) )).

fof(addSignExtensionConstraint_107,axiom,(
    ! [VarCurr] :
      ( v3215(VarCurr,bitIndex29)
    <=> v3216(VarCurr,bitIndex5) ) )).

fof(addSignExtensionConstraint_106,axiom,(
    ! [VarCurr] :
      ( v3215(VarCurr,bitIndex30)
    <=> v3216(VarCurr,bitIndex5) ) )).

fof(addSignExtensionConstraint_105,axiom,(
    ! [VarCurr] :
      ( v3215(VarCurr,bitIndex31)
    <=> v3216(VarCurr,bitIndex5) ) )).

fof(addAssignment_2507,axiom,(
    ! [VarCurr,B] :
      ( range_5_0(B)
     => ( v3215(VarCurr,B)
      <=> v3216(VarCurr,B) ) ) )).

fof(addAssignment_2506,axiom,(
    ! [VarCurr] :
      ( v3216(VarCurr,bitIndex0)
    <=> v3250(VarCurr) ) )).

fof(addAssignment_2505,axiom,(
    ! [VarCurr] :
      ( v3216(VarCurr,bitIndex1)
    <=> v3248(VarCurr) ) )).

fof(addAssignment_2504,axiom,(
    ! [VarCurr] :
      ( v3216(VarCurr,bitIndex2)
    <=> v3244(VarCurr) ) )).

fof(addAssignment_2503,axiom,(
    ! [VarCurr] :
      ( v3216(VarCurr,bitIndex3)
    <=> v3240(VarCurr) ) )).

fof(addAssignment_2502,axiom,(
    ! [VarCurr] :
      ( v3216(VarCurr,bitIndex4)
    <=> v3236(VarCurr) ) )).

fof(addAssignment_2501,axiom,(
    ! [VarCurr] :
      ( v3216(VarCurr,bitIndex5)
    <=> v3218(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_636,axiom,(
    ! [VarCurr] :
      ( v3248(VarCurr)
    <=> ( v3249(VarCurr)
        & v3251(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_635,axiom,(
    ! [VarCurr] :
      ( v3251(VarCurr)
    <=> ( v3222(VarCurr,bitIndex0)
        | v3230(VarCurr) ) ) )).

fof(writeBinaryOperatorShiftedRanges_521,axiom,(
    ! [VarCurr] :
      ( v3249(VarCurr)
    <=> ( v3250(VarCurr)
        | v3222(VarCurr,bitIndex1) ) ) )).

fof(writeUnaryOperator_301,axiom,(
    ! [VarCurr] :
      ( ~ v3250(VarCurr)
    <=> v3222(VarCurr,bitIndex0) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_634,axiom,(
    ! [VarCurr] :
      ( v3244(VarCurr)
    <=> ( v3245(VarCurr)
        & v3247(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_633,axiom,(
    ! [VarCurr] :
      ( v3247(VarCurr)
    <=> ( v3228(VarCurr)
        | v3231(VarCurr) ) ) )).

fof(writeBinaryOperatorShiftedRanges_520,axiom,(
    ! [VarCurr] :
      ( v3245(VarCurr)
    <=> ( v3246(VarCurr)
        | v3222(VarCurr,bitIndex2) ) ) )).

fof(writeUnaryOperator_300,axiom,(
    ! [VarCurr] :
      ( ~ v3246(VarCurr)
    <=> v3228(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_632,axiom,(
    ! [VarCurr] :
      ( v3240(VarCurr)
    <=> ( v3241(VarCurr)
        & v3243(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_631,axiom,(
    ! [VarCurr] :
      ( v3243(VarCurr)
    <=> ( v3226(VarCurr)
        | v3232(VarCurr) ) ) )).

fof(writeBinaryOperatorShiftedRanges_519,axiom,(
    ! [VarCurr] :
      ( v3241(VarCurr)
    <=> ( v3242(VarCurr)
        | v3222(VarCurr,bitIndex3) ) ) )).

fof(writeUnaryOperator_299,axiom,(
    ! [VarCurr] :
      ( ~ v3242(VarCurr)
    <=> v3226(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_630,axiom,(
    ! [VarCurr] :
      ( v3236(VarCurr)
    <=> ( v3237(VarCurr)
        & v3239(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_629,axiom,(
    ! [VarCurr] :
      ( v3239(VarCurr)
    <=> ( v3224(VarCurr)
        | v3233(VarCurr) ) ) )).

fof(writeBinaryOperatorShiftedRanges_518,axiom,(
    ! [VarCurr] :
      ( v3237(VarCurr)
    <=> ( v3238(VarCurr)
        | v3222(VarCurr,bitIndex4) ) ) )).

fof(writeUnaryOperator_298,axiom,(
    ! [VarCurr] :
      ( ~ v3238(VarCurr)
    <=> v3224(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_628,axiom,(
    ! [VarCurr] :
      ( v3218(VarCurr)
    <=> ( v3219(VarCurr)
        & v3234(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_627,axiom,(
    ! [VarCurr] :
      ( v3234(VarCurr)
    <=> ( v3221(VarCurr)
        | v3235(VarCurr) ) ) )).

fof(writeUnaryOperator_297,axiom,(
    ! [VarCurr] :
      ( ~ v3235(VarCurr)
    <=> v3222(VarCurr,bitIndex5) ) )).

fof(writeBinaryOperatorShiftedRanges_517,axiom,(
    ! [VarCurr] :
      ( v3219(VarCurr)
    <=> ( v3220(VarCurr)
        | v3222(VarCurr,bitIndex5) ) ) )).

fof(writeUnaryOperator_296,axiom,(
    ! [VarCurr] :
      ( ~ v3220(VarCurr)
    <=> v3221(VarCurr) ) )).

fof(writeBinaryOperatorShiftedRanges_516,axiom,(
    ! [VarCurr] :
      ( v3221(VarCurr)
    <=> ( v3222(VarCurr,bitIndex4)
        | v3223(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_626,axiom,(
    ! [VarCurr] :
      ( v3223(VarCurr)
    <=> ( v3224(VarCurr)
        & v3233(VarCurr) ) ) )).

fof(writeUnaryOperator_295,axiom,(
    ! [VarCurr] :
      ( ~ v3233(VarCurr)
    <=> v3222(VarCurr,bitIndex4) ) )).

fof(writeBinaryOperatorShiftedRanges_515,axiom,(
    ! [VarCurr] :
      ( v3224(VarCurr)
    <=> ( v3222(VarCurr,bitIndex3)
        | v3225(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_625,axiom,(
    ! [VarCurr] :
      ( v3225(VarCurr)
    <=> ( v3226(VarCurr)
        & v3232(VarCurr) ) ) )).

fof(writeUnaryOperator_294,axiom,(
    ! [VarCurr] :
      ( ~ v3232(VarCurr)
    <=> v3222(VarCurr,bitIndex3) ) )).

fof(writeBinaryOperatorShiftedRanges_514,axiom,(
    ! [VarCurr] :
      ( v3226(VarCurr)
    <=> ( v3222(VarCurr,bitIndex2)
        | v3227(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_624,axiom,(
    ! [VarCurr] :
      ( v3227(VarCurr)
    <=> ( v3228(VarCurr)
        & v3231(VarCurr) ) ) )).

fof(writeUnaryOperator_293,axiom,(
    ! [VarCurr] :
      ( ~ v3231(VarCurr)
    <=> v3222(VarCurr,bitIndex2) ) )).

fof(writeBinaryOperatorShiftedRanges_513,axiom,(
    ! [VarCurr] :
      ( v3228(VarCurr)
    <=> ( v3222(VarCurr,bitIndex1)
        | v3229(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_623,axiom,(
    ! [VarCurr] :
      ( v3229(VarCurr)
    <=> ( v3222(VarCurr,bitIndex0)
        & v3230(VarCurr) ) ) )).

fof(writeUnaryOperator_292,axiom,(
    ! [VarCurr] :
      ( ~ v3230(VarCurr)
    <=> v3222(VarCurr,bitIndex1) ) )).

fof(addZeroExtensionConstraint_4,axiom,(
    ! [VarCurr] : ~ v3222(VarCurr,bitIndex5) )).

fof(addAssignment_2500,axiom,(
    ! [VarCurr,B] :
      ( range_4_0(B)
     => ( v3222(VarCurr,B)
      <=> v3205(VarCurr,B) ) ) )).

fof(addBitVectorEqualityBitBlasted_132,axiom,(
    ! [VarCurr] :
      ( v3214(VarCurr)
    <=> ( ( v3205(VarCurr,bitIndex4)
        <=> $false )
        & ( v3205(VarCurr,bitIndex3)
        <=> $false )
        & ( v3205(VarCurr,bitIndex2)
        <=> $false )
        & ( v3205(VarCurr,bitIndex1)
        <=> $false )
        & ( v3205(VarCurr,bitIndex0)
        <=> $false ) ) ) )).

fof(addBitVectorEqualityBitBlasted_131,axiom,(
    ! [VarCurr] :
      ( v3211(VarCurr)
    <=> ( ( v3212(VarCurr,bitIndex1)
        <=> $false )
        & ( v3212(VarCurr,bitIndex0)
        <=> $true ) ) ) )).

fof(addAssignment_2499,axiom,(
    ! [VarCurr] :
      ( v3212(VarCurr,bitIndex0)
    <=> v873(VarCurr) ) )).

fof(addAssignment_2498,axiom,(
    ! [VarCurr] :
      ( v3212(VarCurr,bitIndex1)
    <=> v783(VarCurr) ) )).

fof(addAssignmentInitValue_29,axiom,(
    ~ v3205(constB0,bitIndex4) )).

fof(addAssignmentInitValue_28,axiom,(
    ~ v3205(constB0,bitIndex3) )).

fof(addAssignmentInitValue_27,axiom,(
    ~ v3205(constB0,bitIndex2) )).

fof(addAssignmentInitValue_26,axiom,(
    ~ v3205(constB0,bitIndex1) )).

fof(addAssignmentInitValue_25,axiom,(
    v3205(constB0,bitIndex0) )).

fof(addBitVectorEqualityBitBlasted_130,axiom,(
    ! [VarCurr] :
      ( v3209(VarCurr)
    <=> ( ( v3210(VarCurr,bitIndex1)
        <=> $false )
        & ( v3210(VarCurr,bitIndex0)
        <=> $false ) ) ) )).

fof(addAssignment_2497,axiom,(
    ! [VarCurr] :
      ( v3210(VarCurr,bitIndex0)
    <=> v873(VarCurr) ) )).

fof(addAssignment_2496,axiom,(
    ! [VarCurr] :
      ( v3210(VarCurr,bitIndex1)
    <=> v783(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_622,axiom,(
    ! [VarCurr] :
      ( v316(VarCurr)
    <=> ( v3195(VarCurr)
        | v3199(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_621,axiom,(
    ! [VarCurr] :
      ( v3199(VarCurr)
    <=> ( v3103(VarCurr)
        & v3109(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_620,axiom,(
    ! [VarCurr] :
      ( v3195(VarCurr)
    <=> ( v3196(VarCurr)
        | v2259(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_619,axiom,(
    ! [VarCurr] :
      ( v3196(VarCurr)
    <=> ( v3197(VarCurr)
        & v3198(VarCurr) ) ) )).

fof(writeUnaryOperator_291,axiom,(
    ! [VarCurr] :
      ( ~ v3198(VarCurr)
    <=> v1908(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_618,axiom,(
    ! [VarCurr] :
      ( v3197(VarCurr)
    <=> ( v318(VarCurr)
        & v664(VarCurr) ) ) )).

fof(addAssignment_2495,axiom,(
    ! [VarCurr] :
      ( v3109(VarCurr)
    <=> v3111(VarCurr) ) )).

fof(addAssignment_2494,axiom,(
    ! [VarCurr] :
      ( v3111(VarCurr)
    <=> v3113(VarCurr) ) )).

fof(addAssignment_2493,axiom,(
    ! [VarCurr] :
      ( v3113(VarCurr)
    <=> v3115(VarCurr) ) )).

fof(addAssignment_2492,axiom,(
    ! [VarCurr] :
      ( v3115(VarCurr)
    <=> v3117(VarCurr) ) )).

fof(addAssignment_2491,axiom,(
    ! [VarCurr] :
      ( v3117(VarCurr)
    <=> v1918(VarCurr,bitIndex1) ) )).

fof(addAssignment_2490,axiom,(
    ! [VarCurr] :
      ( v1918(VarCurr,bitIndex1)
    <=> v1920(VarCurr,bitIndex1) ) )).

fof(addAssignment_2489,axiom,(
    ! [VarCurr] :
      ( v1920(VarCurr,bitIndex1)
    <=> v1922(VarCurr,bitIndex1) ) )).

fof(addAssignment_2488,axiom,(
    ! [VarCurr] :
      ( v1922(VarCurr,bitIndex1)
    <=> v1924(VarCurr,bitIndex1) ) )).

fof(addAssignment_2487,axiom,(
    ! [VarCurr] :
      ( v1924(VarCurr,bitIndex1)
    <=> v1926(VarCurr,bitIndex1) ) )).

fof(addAssignment_2486,axiom,(
    ! [VarCurr] :
      ( v1926(VarCurr,bitIndex1)
    <=> v1928(VarCurr,bitIndex1) ) )).

fof(addAssignment_2485,axiom,(
    ! [VarCurr] :
      ( v1928(VarCurr,bitIndex1)
    <=> v3119(VarCurr) ) )).

fof(addCaseBooleanConditionEqualRanges1_30,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( ~ v3150(VarNext)
       => ( v3119(VarNext)
        <=> v3119(VarCurr) ) ) ) )).

fof(addCaseBooleanConditionEqualRanges0_42,axiom,(
    ! [VarNext] :
      ( v3150(VarNext)
     => ( v3119(VarNext)
      <=> v3185(VarNext) ) ) )).

fof(addAssignment_2484,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( v3185(VarNext)
      <=> v3183(VarCurr) ) ) )).

fof(addParallelCaseBooleanConditionEqualRanges1_25,axiom,(
    ! [VarCurr] :
      ( ~ v3121(VarCurr)
     => ( v3183(VarCurr)
      <=> v3186(VarCurr) ) ) )).

fof(addParallelCaseBooleanConditionEqualRanges0_25,axiom,(
    ! [VarCurr] :
      ( v3121(VarCurr)
     => ( v3183(VarCurr)
      <=> v3123(VarCurr) ) ) )).

fof(addParallelCaseBooleanConditionEqualRanges1_24,axiom,(
    ! [VarCurr] :
      ( ~ v3163(VarCurr)
     => ( v3186(VarCurr)
      <=> v3145(VarCurr) ) ) )).

fof(addParallelCaseBooleanConditionEqualRanges0_24,axiom,(
    ! [VarCurr] :
      ( v3163(VarCurr)
     => ( v3186(VarCurr)
      <=> v3187(VarCurr) ) ) )).

fof(addParallelCaseBooleanConditionEqualRanges2_9,axiom,(
    ! [VarCurr] :
      ( ( ~ v3166(VarCurr)
        & ~ v3168(VarCurr) )
     => ( v3187(VarCurr)
      <=> v3191(VarCurr) ) ) )).

fof(addParallelCaseBooleanConditionEqualRanges1_23,axiom,(
    ! [VarCurr] :
      ( v3168(VarCurr)
     => ( v3187(VarCurr)
      <=> v3190(VarCurr) ) ) )).

fof(addParallelCaseBooleanConditionEqualRanges0_23,axiom,(
    ! [VarCurr] :
      ( v3166(VarCurr)
     => ( v3187(VarCurr)
      <=> v3188(VarCurr) ) ) )).

fof(addParallelCaseBooleanConditionEqualRanges1_22,axiom,(
    ! [VarCurr] :
      ( ~ v3176(VarCurr)
     => ( v3191(VarCurr)
      <=> v3145(VarCurr) ) ) )).

fof(addParallelCaseBooleanConditionEqualRanges0_22,axiom,(
    ! [VarCurr] :
      ( v3176(VarCurr)
     => ( v3191(VarCurr)
      <=> $true ) ) )).

fof(addParallelCaseBooleanConditionEqualRanges1_21,axiom,(
    ! [VarCurr] :
      ( ~ v3170(VarCurr)
     => ( v3190(VarCurr)
      <=> v3145(VarCurr) ) ) )).

fof(addParallelCaseBooleanConditionEqualRanges0_21,axiom,(
    ! [VarCurr] :
      ( v3170(VarCurr)
     => ( v3190(VarCurr)
      <=> $false ) ) )).

fof(aaddConditionBooleanCondEqualRangesElseBranch_88,axiom,(
    ! [VarCurr] :
      ( ~ v3189(VarCurr)
     => ( v3188(VarCurr)
      <=> $false ) ) )).

fof(addConditionBooleanCondEqualRangesThenBranch_91,axiom,(
    ! [VarCurr] :
      ( v3189(VarCurr)
     => ( v3188(VarCurr)
      <=> $true ) ) )).

fof(addBitVectorEqualityBitBlasted_129,axiom,(
    ! [VarCurr] :
      ( v3189(VarCurr)
    <=> ( v3131(VarCurr)
      <=> $true ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_617,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( v3150(VarNext)
      <=> ( v3151(VarNext)
          & v3160(VarNext) ) ) ) )).

fof(addAssignment_2483,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( v3160(VarNext)
      <=> v3158(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_616,axiom,(
    ! [VarCurr] :
      ( v3158(VarCurr)
    <=> ( v3121(VarCurr)
        | v3161(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_615,axiom,(
    ! [VarCurr] :
      ( v3161(VarCurr)
    <=> ( v3162(VarCurr)
        & v3182(VarCurr) ) ) )).

fof(writeUnaryOperator_290,axiom,(
    ! [VarCurr] :
      ( ~ v3182(VarCurr)
    <=> v3121(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_614,axiom,(
    ! [VarCurr] :
      ( v3162(VarCurr)
    <=> ( v3163(VarCurr)
        | v3180(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_613,axiom,(
    ! [VarCurr] :
      ( v3180(VarCurr)
    <=> ( v3141(VarCurr)
        & v3181(VarCurr) ) ) )).

fof(writeUnaryOperator_289,axiom,(
    ! [VarCurr] :
      ( ~ v3181(VarCurr)
    <=> v3143(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_612,axiom,(
    ! [VarCurr] :
      ( v3163(VarCurr)
    <=> ( v3164(VarCurr)
        & v3143(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_611,axiom,(
    ! [VarCurr] :
      ( v3164(VarCurr)
    <=> ( v3165(VarCurr)
        | v3174(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_610,axiom,(
    ! [VarCurr] :
      ( v3174(VarCurr)
    <=> ( v3175(VarCurr)
        & v3179(VarCurr) ) ) )).

fof(addBitVectorEqualityBitBlasted_128,axiom,(
    ! [VarCurr] :
      ( v3179(VarCurr)
    <=> ( ( v3167(VarCurr,bitIndex2)
        <=> $false )
        & ( v3167(VarCurr,bitIndex1)
        <=> $false )
        & ( v3167(VarCurr,bitIndex0)
        <=> $true ) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_609,axiom,(
    ! [VarCurr] :
      ( v3175(VarCurr)
    <=> ( v3176(VarCurr)
        | v3177(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_608,axiom,(
    ! [VarCurr] :
      ( v3177(VarCurr)
    <=> ( v3141(VarCurr)
        & v3178(VarCurr) ) ) )).

fof(writeUnaryOperator_288,axiom,(
    ! [VarCurr] :
      ( ~ v3178(VarCurr)
    <=> v3176(VarCurr) ) )).

fof(addBitVectorEqualityBitBlasted_127,axiom,(
    ! [VarCurr] :
      ( v3176(VarCurr)
    <=> ( v3131(VarCurr)
      <=> $true ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_607,axiom,(
    ! [VarCurr] :
      ( v3165(VarCurr)
    <=> ( v3166(VarCurr)
        | v3168(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_606,axiom,(
    ! [VarCurr] :
      ( v3168(VarCurr)
    <=> ( v3169(VarCurr)
        & v3173(VarCurr) ) ) )).

fof(addBitVectorEqualityBitBlasted_126,axiom,(
    ! [VarCurr] :
      ( v3173(VarCurr)
    <=> ( ( v3167(VarCurr,bitIndex2)
        <=> $false )
        & ( v3167(VarCurr,bitIndex1)
        <=> $true )
        & ( v3167(VarCurr,bitIndex0)
        <=> $false ) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_605,axiom,(
    ! [VarCurr] :
      ( v3169(VarCurr)
    <=> ( v3170(VarCurr)
        | v3171(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_604,axiom,(
    ! [VarCurr] :
      ( v3171(VarCurr)
    <=> ( v3141(VarCurr)
        & v3172(VarCurr) ) ) )).

fof(writeUnaryOperator_287,axiom,(
    ! [VarCurr] :
      ( ~ v3172(VarCurr)
    <=> v3170(VarCurr) ) )).

fof(addBitVectorEqualityBitBlasted_125,axiom,(
    ! [VarCurr] :
      ( v3170(VarCurr)
    <=> ( v3131(VarCurr)
      <=> $true ) ) )).

fof(addBitVectorEqualityBitBlasted_124,axiom,(
    ! [VarCurr] :
      ( v3166(VarCurr)
    <=> ( ( v3167(VarCurr,bitIndex2)
        <=> $true )
        & ( v3167(VarCurr,bitIndex1)
        <=> $false )
        & ( v3167(VarCurr,bitIndex0)
        <=> $false ) ) ) )).

fof(addAssignment_2482,axiom,(
    ! [VarCurr] :
      ( v3167(VarCurr,bitIndex0)
    <=> v3129(VarCurr) ) )).

fof(addAssignment_2481,axiom,(
    ! [VarCurr] :
      ( v3167(VarCurr,bitIndex1)
    <=> v3127(VarCurr) ) )).

fof(addAssignment_2480,axiom,(
    ! [VarCurr] :
      ( v3167(VarCurr,bitIndex2)
    <=> v3125(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_603,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( v3151(VarNext)
      <=> ( v3152(VarNext)
          & v3147(VarNext) ) ) ) )).

fof(writeUnaryOperator_286,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( ~ v3152(VarNext)
      <=> v3154(VarNext) ) ) )).

fof(addAssignment_2479,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( v3154(VarNext)
      <=> v3147(VarCurr) ) ) )).

fof(addAssignment_2478,axiom,(
    ! [VarCurr] :
      ( v3147(VarCurr)
    <=> v2207(VarCurr) ) )).

fof(addAssignment_2477,axiom,(
    ! [VarCurr] :
      ( v3145(VarCurr)
    <=> $false ) )).

fof(addAssignment_2476,axiom,(
    ! [VarCurr] :
      ( v3143(VarCurr)
    <=> v2045(VarCurr) ) )).

fof(addAssignment_2475,axiom,(
    ! [VarCurr] :
      ( v3141(VarCurr)
    <=> $false ) )).

fof(addAssignment_2474,axiom,(
    ! [VarCurr] :
      ( v3131(VarCurr)
    <=> v1966(VarCurr,bitIndex1) ) )).

fof(addAssignment_2473,axiom,(
    ! [VarCurr] :
      ( v1966(VarCurr,bitIndex1)
    <=> v1968(VarCurr,bitIndex1) ) )).

fof(addAssignment_2472,axiom,(
    ! [VarCurr] :
      ( v1968(VarCurr,bitIndex1)
    <=> v1970(VarCurr,bitIndex1) ) )).

fof(addAssignment_2471,axiom,(
    ! [VarCurr] :
      ( v1970(VarCurr,bitIndex1)
    <=> v1972(VarCurr,bitIndex1) ) )).

fof(addAssignment_2470,axiom,(
    ! [VarCurr] :
      ( v1972(VarCurr,bitIndex1)
    <=> v1974(VarCurr,bitIndex1) ) )).

fof(addAssignment_2469,axiom,(
    ! [VarCurr] :
      ( v1974(VarCurr,bitIndex1)
    <=> v1976(VarCurr,bitIndex1) ) )).

fof(addAssignment_2468,axiom,(
    ! [VarCurr] :
      ( v1976(VarCurr,bitIndex1)
    <=> v1978(VarCurr,bitIndex1) ) )).

fof(addAssignment_2467,axiom,(
    ! [VarCurr] :
      ( v1978(VarCurr,bitIndex1)
    <=> v1980(VarCurr,bitIndex1) ) )).

fof(addAssignment_2466,axiom,(
    ! [VarCurr] :
      ( v1980(VarCurr,bitIndex1)
    <=> v1982(VarCurr,bitIndex1) ) )).

fof(addAssignment_2465,axiom,(
    ! [VarNext] :
      ( v1982(VarNext,bitIndex1)
    <=> v3133(VarNext,bitIndex1) ) )).

fof(addCaseBooleanConditionEqualRanges1_29,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( ~ v3134(VarNext)
       => ! [B] :
            ( range_63_0(B)
           => ( v3133(VarNext,B)
            <=> v1982(VarCurr,B) ) ) ) ) )).

fof(addCaseBooleanConditionEqualRanges0_41,axiom,(
    ! [VarNext] :
      ( v3134(VarNext)
     => ! [B] :
          ( range_63_0(B)
         => ( v3133(VarNext,B)
          <=> v2034(VarNext,B) ) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_602,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( v3134(VarNext)
      <=> v3135(VarNext) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_601,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( v3135(VarNext)
      <=> ( v3137(VarNext)
          & v2013(VarNext) ) ) ) )).

fof(writeUnaryOperator_285,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( ~ v3137(VarNext)
      <=> v2028(VarNext) ) ) )).

fof(addAssignment_2464,axiom,(
    ! [VarCurr] :
      ( v1987(VarCurr,bitIndex1)
    <=> v1989(VarCurr,bitIndex1) ) )).

fof(addAssignment_2463,axiom,(
    ! [VarCurr] :
      ( v1989(VarCurr,bitIndex1)
    <=> v1991(VarCurr,bitIndex1) ) )).

fof(addAssignment_2462,axiom,(
    ! [VarCurr] :
      ( v1991(VarCurr,bitIndex1)
    <=> v1993(VarCurr,bitIndex1) ) )).

fof(addAssignment_2461,axiom,(
    ! [VarCurr] :
      ( v1993(VarCurr,bitIndex1)
    <=> v1995(VarCurr,bitIndex1) ) )).

fof(addAssignment_2460,axiom,(
    ! [VarCurr] :
      ( v1995(VarCurr,bitIndex1)
    <=> v1997(VarCurr,bitIndex1) ) )).

fof(addAssignment_2459,axiom,(
    ! [VarCurr] :
      ( v1997(VarCurr,bitIndex1)
    <=> v1999(VarCurr,bitIndex1) ) )).

fof(addAssignment_2458,axiom,(
    ! [VarCurr] :
      ( v1999(VarCurr,bitIndex1)
    <=> v2001(VarCurr,bitIndex1) ) )).

fof(addAssignment_2457,axiom,(
    ! [VarCurr] :
      ( v2001(VarCurr,bitIndex1)
    <=> v2003(VarCurr,bitIndex1) ) )).

fof(addAssignment_2456,axiom,(
    ! [VarCurr] :
      ( v2003(VarCurr,bitIndex1)
    <=> v2005(VarCurr,bitIndex1) ) )).

fof(addAssignment_2455,axiom,(
    ! [VarCurr] :
      ( v2005(VarCurr,bitIndex1)
    <=> v2007(VarCurr,bitIndex1) ) )).

fof(addAssignment_2454,axiom,(
    ! [VarCurr] :
      ( v2007(VarCurr,bitIndex1)
    <=> v2009(VarCurr,bitIndex1) ) )).

fof(addAssignment_2453,axiom,(
    ! [VarCurr] :
      ( v3129(VarCurr)
    <=> $false ) )).

fof(addAssignment_2452,axiom,(
    ! [VarCurr] :
      ( v3127(VarCurr)
    <=> $false ) )).

fof(addAssignment_2451,axiom,(
    ! [VarCurr] :
      ( v3125(VarCurr)
    <=> $true ) )).

fof(addAssignment_2450,axiom,(
    ! [VarCurr] :
      ( v3123(VarCurr)
    <=> $false ) )).

fof(addAssignment_2449,axiom,(
    ! [VarCurr] :
      ( v3121(VarCurr)
    <=> v1934(VarCurr) ) )).

fof(addAssignment_2448,axiom,(
    ! [VarCurr] :
      ( v3103(VarCurr)
    <=> v3105(VarCurr) ) )).

fof(addAssignment_2447,axiom,(
    ! [VarCurr] :
      ( v3105(VarCurr)
    <=> v3107(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_600,axiom,(
    ! [VarCurr] :
      ( v2259(VarCurr)
    <=> ( v3094(VarCurr)
        & v1908(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_599,axiom,(
    ! [VarCurr] :
      ( v3094(VarCurr)
    <=> ( v3095(VarCurr)
        | v3098(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_598,axiom,(
    ! [VarCurr] :
      ( v3098(VarCurr)
    <=> ( v3099(VarCurr)
        & v3100(VarCurr) ) ) )).

fof(addBitVectorEqualityBitBlasted_123,axiom,(
    ! [VarCurr] :
      ( v3100(VarCurr)
    <=> ( ( v3101(VarCurr,bitIndex4)
        <=> $true )
        & ( v3101(VarCurr,bitIndex3)
        <=> $true )
        & ( v3101(VarCurr,bitIndex2)
        <=> $true )
        & ( v3101(VarCurr,bitIndex1)
        <=> $true )
        & ( v3101(VarCurr,bitIndex0)
        <=> $true ) ) ) )).

fof(addAssignment_2446,axiom,(
    ! [VarCurr] :
      ( v3101(VarCurr,bitIndex0)
    <=> v3054(VarCurr) ) )).

fof(addAssignment_2445,axiom,(
    ! [VarCurr] :
      ( v3101(VarCurr,bitIndex1)
    <=> v3049(VarCurr) ) )).

fof(addAssignment_2444,axiom,(
    ! [VarCurr] :
      ( v3101(VarCurr,bitIndex2)
    <=> v3044(VarCurr) ) )).

fof(addAssignment_2443,axiom,(
    ! [VarCurr] :
      ( v3101(VarCurr,bitIndex3)
    <=> v3039(VarCurr) ) )).

fof(addAssignment_2442,axiom,(
    ! [VarCurr] :
      ( v3101(VarCurr,bitIndex4)
    <=> v3012(VarCurr) ) )).

fof(addBitVectorEqualityBitBlasted_122,axiom,(
    ! [VarCurr] :
      ( v3099(VarCurr)
    <=> ( ( v2261(VarCurr,bitIndex1)
        <=> $true )
        & ( v2261(VarCurr,bitIndex0)
        <=> $false ) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_597,axiom,(
    ! [VarCurr] :
      ( v3095(VarCurr)
    <=> ( v3096(VarCurr)
        | v3097(VarCurr) ) ) )).

fof(addBitVectorEqualityBitBlasted_121,axiom,(
    ! [VarCurr] :
      ( v3097(VarCurr)
    <=> ( ( v2261(VarCurr,bitIndex1)
        <=> $true )
        & ( v2261(VarCurr,bitIndex0)
        <=> $true ) ) ) )).

fof(addBitVectorEqualityBitBlasted_120,axiom,(
    ! [VarCurr] :
      ( v3096(VarCurr)
    <=> ( ( v2261(VarCurr,bitIndex1)
        <=> $false )
        & ( v2261(VarCurr,bitIndex0)
        <=> $true ) ) ) )).

fof(addCaseBooleanConditionEqualRanges1_28,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( ~ v3079(VarNext)
       => ! [B] :
            ( range_1_0(B)
           => ( v2261(VarNext,B)
            <=> v2261(VarCurr,B) ) ) ) ) )).

fof(addCaseBooleanConditionEqualRanges0_40,axiom,(
    ! [VarNext] :
      ( v3079(VarNext)
     => ! [B] :
          ( range_1_0(B)
         => ( v2261(VarNext,B)
          <=> v3087(VarNext,B) ) ) ) )).

fof(addAssignment_2441,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ! [B] :
          ( range_1_0(B)
         => ( v3087(VarNext,B)
          <=> v3085(VarCurr,B) ) ) ) )).

fof(aaddConditionBooleanCondEqualRangesElseBranch_87,axiom,(
    ! [VarCurr] :
      ( ~ v3088(VarCurr)
     => ! [B] :
          ( range_1_0(B)
         => ( v3085(VarCurr,B)
          <=> v2263(VarCurr,B) ) ) ) )).

fof(addConditionBooleanCondEqualRangesThenBranch_90,axiom,(
    ! [VarCurr] :
      ( v3088(VarCurr)
     => ! [B] :
          ( range_1_0(B)
         => ( v3085(VarCurr,B)
          <=> $false ) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_596,axiom,(
    ! [VarCurr] :
      ( v3088(VarCurr)
    <=> ( v3089(VarCurr)
        | v3090(VarCurr) ) ) )).

fof(writeUnaryOperator_284,axiom,(
    ! [VarCurr] :
      ( ~ v3090(VarCurr)
    <=> v1908(VarCurr) ) )).

fof(writeUnaryOperator_283,axiom,(
    ! [VarCurr] :
      ( ~ v3089(VarCurr)
    <=> v12(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_595,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( v3079(VarNext)
      <=> v3080(VarNext) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_594,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( v3080(VarNext)
      <=> ( v3081(VarNext)
          & v288(VarNext) ) ) ) )).

fof(writeUnaryOperator_282,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( ~ v3081(VarNext)
      <=> v1891(VarNext) ) ) )).

fof(addParallelCaseBooleanConditionEqualRanges3_6,axiom,(
    ! [VarCurr] :
      ( ( ~ v2988(VarCurr)
        & ~ v2992(VarCurr)
        & ~ v3004(VarCurr) )
     => ! [B] :
          ( range_1_0(B)
         => ( v2263(VarCurr,B)
          <=> v3058(VarCurr,B) ) ) ) )).

fof(addParallelCaseBooleanConditionEqualRanges2_8,axiom,(
    ! [VarCurr] :
      ( v3004(VarCurr)
     => ! [B] :
          ( range_1_0(B)
         => ( v2263(VarCurr,B)
          <=> v3005(VarCurr,B) ) ) ) )).

fof(addParallelCaseBooleanConditionEqualRanges1_20,axiom,(
    ! [VarCurr] :
      ( v2992(VarCurr)
     => ! [B] :
          ( range_1_0(B)
         => ( v2263(VarCurr,B)
          <=> v2993(VarCurr,B) ) ) ) )).

fof(addParallelCaseBooleanConditionEqualRanges0_20,axiom,(
    ! [VarCurr] :
      ( v2988(VarCurr)
     => ! [B] :
          ( range_1_0(B)
         => ( v2263(VarCurr,B)
          <=> v2989(VarCurr,B) ) ) ) )).

fof(aaddConditionBooleanCondEqualRangesElseBranch_86,axiom,(
    ! [VarCurr] :
      ( ~ v741(VarCurr)
     => ! [B] :
          ( range_1_0(B)
         => ( v3058(VarCurr,B)
          <=> v3059(VarCurr,B) ) ) ) )).

fof(addConditionBooleanCondEqualRangesThenBranch_89,axiom,(
    ! [VarCurr] :
      ( v741(VarCurr)
     => ! [B] :
          ( range_1_0(B)
         => ( v3058(VarCurr,B)
          <=> b01(B) ) ) ) )).

fof(aaddConditionBooleanCondEqualRangesElseBranch_85,axiom,(
    ! [VarCurr] :
      ( ~ v3060(VarCurr)
     => ! [B] :
          ( range_1_0(B)
         => ( v3059(VarCurr,B)
          <=> v3061(VarCurr,B) ) ) ) )).

fof(addConditionBooleanCondEqualRangesThenBranch_88,axiom,(
    ! [VarCurr] :
      ( v3060(VarCurr)
     => ! [B] :
          ( range_1_0(B)
         => ( v3059(VarCurr,B)
          <=> $false ) ) ) )).

fof(aaddConditionBooleanCondEqualRangesElseBranch_84,axiom,(
    ! [VarCurr] :
      ( ~ v3062(VarCurr)
     => ! [B] :
          ( range_1_0(B)
         => ( v3061(VarCurr,B)
          <=> $true ) ) ) )).

fof(addConditionBooleanCondEqualRangesThenBranch_87,axiom,(
    ! [VarCurr] :
      ( v3062(VarCurr)
     => ! [B] :
          ( range_1_0(B)
         => ( v3061(VarCurr,B)
          <=> b10(B) ) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_593,axiom,(
    ! [VarCurr] :
      ( v3062(VarCurr)
    <=> ( v3064(VarCurr)
        | v3066(VarCurr) ) ) )).

fof(writeBinaryOperatorShiftedRanges_512,axiom,(
    ! [VarCurr] :
      ( v3066(VarCurr)
    <=> ( v3067(VarCurr)
        & v3065(VarCurr,bitIndex4) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_592,axiom,(
    ! [VarCurr] :
      ( v3067(VarCurr)
    <=> ( v3068(VarCurr)
        | v3069(VarCurr) ) ) )).

fof(writeBinaryOperatorShiftedRanges_511,axiom,(
    ! [VarCurr] :
      ( v3069(VarCurr)
    <=> ( v3070(VarCurr)
        & v3065(VarCurr,bitIndex3) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_591,axiom,(
    ! [VarCurr] :
      ( v3070(VarCurr)
    <=> ( v3071(VarCurr)
        | v3072(VarCurr) ) ) )).

fof(writeBinaryOperatorShiftedRanges_510,axiom,(
    ! [VarCurr] :
      ( v3072(VarCurr)
    <=> ( v3073(VarCurr)
        & v3065(VarCurr,bitIndex2) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_590,axiom,(
    ! [VarCurr] :
      ( v3073(VarCurr)
    <=> ( v3074(VarCurr)
        | v3075(VarCurr) ) ) )).

fof(writeBinaryOperatorShiftedRanges_509,axiom,(
    ! [VarCurr] :
      ( v3075(VarCurr)
    <=> ( v3076(VarCurr)
        & v3065(VarCurr,bitIndex1) ) ) )).

fof(writeUnaryOperator_281,axiom,(
    ! [VarCurr] :
      ( ~ v3076(VarCurr)
    <=> v3065(VarCurr,bitIndex0) ) )).

fof(writeUnaryOperator_280,axiom,(
    ! [VarCurr] :
      ( ~ v3074(VarCurr)
    <=> v3065(VarCurr,bitIndex1) ) )).

fof(writeUnaryOperator_279,axiom,(
    ! [VarCurr] :
      ( ~ v3071(VarCurr)
    <=> v3065(VarCurr,bitIndex2) ) )).

fof(writeUnaryOperator_278,axiom,(
    ! [VarCurr] :
      ( ~ v3068(VarCurr)
    <=> v3065(VarCurr,bitIndex3) ) )).

fof(writeUnaryOperator_277,axiom,(
    ! [VarCurr] :
      ( ~ v3064(VarCurr)
    <=> v3065(VarCurr,bitIndex4) ) )).

fof(addAssignment_2440,axiom,(
    ! [VarCurr] :
      ( v3065(VarCurr,bitIndex0)
    <=> v3054(VarCurr) ) )).

fof(addAssignment_2439,axiom,(
    ! [VarCurr] :
      ( v3065(VarCurr,bitIndex1)
    <=> v3049(VarCurr) ) )).

fof(addAssignment_2438,axiom,(
    ! [VarCurr] :
      ( v3065(VarCurr,bitIndex2)
    <=> v3044(VarCurr) ) )).

fof(addAssignment_2437,axiom,(
    ! [VarCurr] :
      ( v3065(VarCurr,bitIndex3)
    <=> v3039(VarCurr) ) )).

fof(addAssignment_2436,axiom,(
    ! [VarCurr] :
      ( v3065(VarCurr,bitIndex4)
    <=> v3012(VarCurr) ) )).

fof(addBitVectorEqualityBitBlasted_119,axiom,(
    ! [VarCurr] :
      ( v3060(VarCurr)
    <=> ( ( v2290(VarCurr,bitIndex4)
        <=> $false )
        & ( v2290(VarCurr,bitIndex3)
        <=> $false )
        & ( v2290(VarCurr,bitIndex2)
        <=> $false )
        & ( v2290(VarCurr,bitIndex1)
        <=> $false )
        & ( v2290(VarCurr,bitIndex0)
        <=> $false ) ) ) )).

fof(addBitVectorEqualityBitBlasted_118,axiom,(
    ! [VarCurr] :
      ( v3057(VarCurr)
    <=> ( ( v2261(VarCurr,bitIndex1)
        <=> $true )
        & ( v2261(VarCurr,bitIndex0)
        <=> $true ) ) ) )).

fof(aaddConditionBooleanCondEqualRangesElseBranch_83,axiom,(
    ! [VarCurr] :
      ( ~ v741(VarCurr)
     => ! [B] :
          ( range_1_0(B)
         => ( v3005(VarCurr,B)
          <=> v3006(VarCurr,B) ) ) ) )).

fof(addConditionBooleanCondEqualRangesThenBranch_86,axiom,(
    ! [VarCurr] :
      ( v741(VarCurr)
     => ! [B] :
          ( range_1_0(B)
         => ( v3005(VarCurr,B)
          <=> b01(B) ) ) ) )).

fof(aaddConditionBooleanCondEqualRangesElseBranch_82,axiom,(
    ! [VarCurr] :
      ( ~ v3007(VarCurr)
     => ! [B] :
          ( range_1_0(B)
         => ( v3006(VarCurr,B)
          <=> v3008(VarCurr,B) ) ) ) )).

fof(addConditionBooleanCondEqualRangesThenBranch_85,axiom,(
    ! [VarCurr] :
      ( v3007(VarCurr)
     => ! [B] :
          ( range_1_0(B)
         => ( v3006(VarCurr,B)
          <=> $false ) ) ) )).

fof(aaddConditionBooleanCondEqualRangesElseBranch_81,axiom,(
    ! [VarCurr] :
      ( ~ v3009(VarCurr)
     => ! [B] :
          ( range_1_0(B)
         => ( v3008(VarCurr,B)
          <=> b10(B) ) ) ) )).

fof(addConditionBooleanCondEqualRangesThenBranch_84,axiom,(
    ! [VarCurr] :
      ( v3009(VarCurr)
     => ! [B] :
          ( range_1_0(B)
         => ( v3008(VarCurr,B)
          <=> $true ) ) ) )).

fof(addBitVectorEqualityBitBlasted_117,axiom,(
    ! [VarCurr] :
      ( v3009(VarCurr)
    <=> ( ( v3010(VarCurr,bitIndex4)
        <=> $true )
        & ( v3010(VarCurr,bitIndex3)
        <=> $true )
        & ( v3010(VarCurr,bitIndex2)
        <=> $true )
        & ( v3010(VarCurr,bitIndex1)
        <=> $true )
        & ( v3010(VarCurr,bitIndex0)
        <=> $true ) ) ) )).

fof(bitBlastConstant_615,axiom,(
    b11111(bitIndex4) )).

fof(bitBlastConstant_614,axiom,(
    b11111(bitIndex3) )).

fof(bitBlastConstant_613,axiom,(
    b11111(bitIndex2) )).

fof(bitBlastConstant_612,axiom,(
    b11111(bitIndex1) )).

fof(bitBlastConstant_611,axiom,(
    b11111(bitIndex0) )).

fof(addAssignment_2435,axiom,(
    ! [VarCurr] :
      ( v3010(VarCurr,bitIndex0)
    <=> v3054(VarCurr) ) )).

fof(addAssignment_2434,axiom,(
    ! [VarCurr] :
      ( v3010(VarCurr,bitIndex1)
    <=> v3049(VarCurr) ) )).

fof(addAssignment_2433,axiom,(
    ! [VarCurr] :
      ( v3010(VarCurr,bitIndex2)
    <=> v3044(VarCurr) ) )).

fof(addAssignment_2432,axiom,(
    ! [VarCurr] :
      ( v3010(VarCurr,bitIndex3)
    <=> v3039(VarCurr) ) )).

fof(addAssignment_2431,axiom,(
    ! [VarCurr] :
      ( v3010(VarCurr,bitIndex4)
    <=> v3012(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_589,axiom,(
    ! [VarCurr] :
      ( v3054(VarCurr)
    <=> ( v3055(VarCurr)
        & v3056(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_588,axiom,(
    ! [VarCurr] :
      ( v3056(VarCurr)
    <=> ( v2290(VarCurr,bitIndex0)
        | v2927(VarCurr,bitIndex0) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_587,axiom,(
    ! [VarCurr] :
      ( v3055(VarCurr)
    <=> ( v2898(VarCurr)
        | v2981(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_586,axiom,(
    ! [VarCurr] :
      ( v3049(VarCurr)
    <=> ( v3050(VarCurr)
        & v3053(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_585,axiom,(
    ! [VarCurr] :
      ( v3053(VarCurr)
    <=> ( v3021(VarCurr)
        | v3022(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_584,axiom,(
    ! [VarCurr] :
      ( v3050(VarCurr)
    <=> ( v3051(VarCurr)
        | v3052(VarCurr) ) ) )).

fof(writeUnaryOperator_276,axiom,(
    ! [VarCurr] :
      ( ~ v3052(VarCurr)
    <=> v3022(VarCurr) ) )).

fof(writeUnaryOperator_275,axiom,(
    ! [VarCurr] :
      ( ~ v3051(VarCurr)
    <=> v3021(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_583,axiom,(
    ! [VarCurr] :
      ( v3044(VarCurr)
    <=> ( v3045(VarCurr)
        & v3048(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_582,axiom,(
    ! [VarCurr] :
      ( v3048(VarCurr)
    <=> ( v3019(VarCurr)
        | v3026(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_581,axiom,(
    ! [VarCurr] :
      ( v3045(VarCurr)
    <=> ( v3046(VarCurr)
        | v3047(VarCurr) ) ) )).

fof(writeUnaryOperator_274,axiom,(
    ! [VarCurr] :
      ( ~ v3047(VarCurr)
    <=> v3026(VarCurr) ) )).

fof(writeUnaryOperator_273,axiom,(
    ! [VarCurr] :
      ( ~ v3046(VarCurr)
    <=> v3019(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_580,axiom,(
    ! [VarCurr] :
      ( v3039(VarCurr)
    <=> ( v3040(VarCurr)
        & v3043(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_579,axiom,(
    ! [VarCurr] :
      ( v3043(VarCurr)
    <=> ( v3017(VarCurr)
        | v3030(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_578,axiom,(
    ! [VarCurr] :
      ( v3040(VarCurr)
    <=> ( v3041(VarCurr)
        | v3042(VarCurr) ) ) )).

fof(writeUnaryOperator_272,axiom,(
    ! [VarCurr] :
      ( ~ v3042(VarCurr)
    <=> v3030(VarCurr) ) )).

fof(writeUnaryOperator_271,axiom,(
    ! [VarCurr] :
      ( ~ v3041(VarCurr)
    <=> v3017(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_577,axiom,(
    ! [VarCurr] :
      ( v3012(VarCurr)
    <=> ( v3013(VarCurr)
        & v3038(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_576,axiom,(
    ! [VarCurr] :
      ( v3038(VarCurr)
    <=> ( v3015(VarCurr)
        | v3035(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_575,axiom,(
    ! [VarCurr] :
      ( v3013(VarCurr)
    <=> ( v3014(VarCurr)
        | v3034(VarCurr) ) ) )).

fof(writeUnaryOperator_270,axiom,(
    ! [VarCurr] :
      ( ~ v3034(VarCurr)
    <=> v3035(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_574,axiom,(
    ! [VarCurr] :
      ( v3035(VarCurr)
    <=> ( v3036(VarCurr)
        & v3037(VarCurr) ) ) )).

fof(writeBinaryOperatorShiftedRanges_508,axiom,(
    ! [VarCurr] :
      ( v3037(VarCurr)
    <=> ( v2290(VarCurr,bitIndex4)
        | v2927(VarCurr,bitIndex4) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_573,axiom,(
    ! [VarCurr] :
      ( v3036(VarCurr)
    <=> ( v2884(VarCurr)
        | v2967(VarCurr) ) ) )).

fof(writeUnaryOperator_269,axiom,(
    ! [VarCurr] :
      ( ~ v3014(VarCurr)
    <=> v3015(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_572,axiom,(
    ! [VarCurr] :
      ( v3015(VarCurr)
    <=> ( v3016(VarCurr)
        | v3033(VarCurr) ) ) )).

fof(writeBinaryOperatorShiftedRanges_507,axiom,(
    ! [VarCurr] :
      ( v3033(VarCurr)
    <=> ( v2290(VarCurr,bitIndex3)
        & v2927(VarCurr,bitIndex3) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_571,axiom,(
    ! [VarCurr] :
      ( v3016(VarCurr)
    <=> ( v3017(VarCurr)
        & v3030(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_570,axiom,(
    ! [VarCurr] :
      ( v3030(VarCurr)
    <=> ( v3031(VarCurr)
        & v3032(VarCurr) ) ) )).

fof(writeBinaryOperatorShiftedRanges_506,axiom,(
    ! [VarCurr] :
      ( v3032(VarCurr)
    <=> ( v2290(VarCurr,bitIndex3)
        | v2927(VarCurr,bitIndex3) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_569,axiom,(
    ! [VarCurr] :
      ( v3031(VarCurr)
    <=> ( v2889(VarCurr)
        | v2972(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_568,axiom,(
    ! [VarCurr] :
      ( v3017(VarCurr)
    <=> ( v3018(VarCurr)
        | v3029(VarCurr) ) ) )).

fof(writeBinaryOperatorShiftedRanges_505,axiom,(
    ! [VarCurr] :
      ( v3029(VarCurr)
    <=> ( v2290(VarCurr,bitIndex2)
        & v2927(VarCurr,bitIndex2) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_567,axiom,(
    ! [VarCurr] :
      ( v3018(VarCurr)
    <=> ( v3019(VarCurr)
        & v3026(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_566,axiom,(
    ! [VarCurr] :
      ( v3026(VarCurr)
    <=> ( v3027(VarCurr)
        & v3028(VarCurr) ) ) )).

fof(writeBinaryOperatorShiftedRanges_504,axiom,(
    ! [VarCurr] :
      ( v3028(VarCurr)
    <=> ( v2290(VarCurr,bitIndex2)
        | v2927(VarCurr,bitIndex2) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_565,axiom,(
    ! [VarCurr] :
      ( v3027(VarCurr)
    <=> ( v2894(VarCurr)
        | v2977(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_564,axiom,(
    ! [VarCurr] :
      ( v3019(VarCurr)
    <=> ( v3020(VarCurr)
        | v3025(VarCurr) ) ) )).

fof(writeBinaryOperatorShiftedRanges_503,axiom,(
    ! [VarCurr] :
      ( v3025(VarCurr)
    <=> ( v2290(VarCurr,bitIndex1)
        & v2927(VarCurr,bitIndex1) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_563,axiom,(
    ! [VarCurr] :
      ( v3020(VarCurr)
    <=> ( v3021(VarCurr)
        & v3022(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_562,axiom,(
    ! [VarCurr] :
      ( v3022(VarCurr)
    <=> ( v3023(VarCurr)
        & v3024(VarCurr) ) ) )).

fof(writeBinaryOperatorShiftedRanges_502,axiom,(
    ! [VarCurr] :
      ( v3024(VarCurr)
    <=> ( v2290(VarCurr,bitIndex1)
        | v2927(VarCurr,bitIndex1) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_561,axiom,(
    ! [VarCurr] :
      ( v3023(VarCurr)
    <=> ( v2899(VarCurr)
        | v2982(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_560,axiom,(
    ! [VarCurr] :
      ( v3021(VarCurr)
    <=> ( v2290(VarCurr,bitIndex0)
        & v2927(VarCurr,bitIndex0) ) ) )).

fof(addBitVectorEqualityBitBlasted_116,axiom,(
    ! [VarCurr] :
      ( v3007(VarCurr)
    <=> ( ( v2290(VarCurr,bitIndex4)
        <=> $false )
        & ( v2290(VarCurr,bitIndex3)
        <=> $false )
        & ( v2290(VarCurr,bitIndex2)
        <=> $false )
        & ( v2290(VarCurr,bitIndex1)
        <=> $false )
        & ( v2290(VarCurr,bitIndex0)
        <=> $false ) ) ) )).

fof(addBitVectorEqualityBitBlasted_115,axiom,(
    ! [VarCurr] :
      ( v3004(VarCurr)
    <=> ( ( v2261(VarCurr,bitIndex1)
        <=> $true )
        & ( v2261(VarCurr,bitIndex0)
        <=> $false ) ) ) )).

fof(aaddConditionBooleanCondEqualRangesElseBranch_80,axiom,(
    ! [VarCurr] :
      ( ~ v2994(VarCurr)
     => ! [B] :
          ( range_1_0(B)
         => ( v2993(VarCurr,B)
          <=> v2996(VarCurr,B) ) ) ) )).

fof(addConditionBooleanCondEqualRangesThenBranch_83,axiom,(
    ! [VarCurr] :
      ( v2994(VarCurr)
     => ! [B] :
          ( range_1_0(B)
         => ( v2993(VarCurr,B)
          <=> $false ) ) ) )).

fof(aaddConditionBooleanCondEqualRangesElseBranch_79,axiom,(
    ! [VarCurr] :
      ( ~ v2997(VarCurr)
     => ! [B] :
          ( range_1_0(B)
         => ( v2996(VarCurr,B)
          <=> b01(B) ) ) ) )).

fof(addConditionBooleanCondEqualRangesThenBranch_82,axiom,(
    ! [VarCurr] :
      ( v2997(VarCurr)
     => ! [B] :
          ( range_1_0(B)
         => ( v2996(VarCurr,B)
          <=> b10(B) ) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_559,axiom,(
    ! [VarCurr] :
      ( v2997(VarCurr)
    <=> ( v320(VarCurr)
        & v2998(VarCurr) ) ) )).

fof(writeUnaryOperator_268,axiom,(
    ! [VarCurr] :
      ( ~ v2998(VarCurr)
    <=> v3000(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_558,axiom,(
    ! [VarCurr] :
      ( v3000(VarCurr)
    <=> ( v3001(VarCurr)
        & v2884(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_557,axiom,(
    ! [VarCurr] :
      ( v3001(VarCurr)
    <=> ( v3002(VarCurr)
        & v2889(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_556,axiom,(
    ! [VarCurr] :
      ( v3002(VarCurr)
    <=> ( v3003(VarCurr)
        & v2894(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_555,axiom,(
    ! [VarCurr] :
      ( v3003(VarCurr)
    <=> ( v2898(VarCurr)
        & v2899(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_554,axiom,(
    ! [VarCurr] :
      ( v2994(VarCurr)
    <=> ( v320(VarCurr)
        & v2995(VarCurr) ) ) )).

fof(addBitVectorEqualityBitBlasted_114,axiom,(
    ! [VarCurr] :
      ( v2995(VarCurr)
    <=> ( ( v2290(VarCurr,bitIndex4)
        <=> $false )
        & ( v2290(VarCurr,bitIndex3)
        <=> $false )
        & ( v2290(VarCurr,bitIndex2)
        <=> $false )
        & ( v2290(VarCurr,bitIndex1)
        <=> $false )
        & ( v2290(VarCurr,bitIndex0)
        <=> $false ) ) ) )).

fof(addBitVectorEqualityBitBlasted_113,axiom,(
    ! [VarCurr] :
      ( v2992(VarCurr)
    <=> ( ( v2261(VarCurr,bitIndex1)
        <=> $false )
        & ( v2261(VarCurr,bitIndex0)
        <=> $true ) ) ) )).

fof(aaddConditionBooleanCondEqualRangesElseBranch_78,axiom,(
    ! [VarCurr] :
      ( ~ v2265(VarCurr)
     => ! [B] :
          ( range_1_0(B)
         => ( v2989(VarCurr,B)
          <=> v2990(VarCurr,B) ) ) ) )).

fof(addConditionBooleanCondEqualRangesThenBranch_81,axiom,(
    ! [VarCurr] :
      ( v2265(VarCurr)
     => ! [B] :
          ( range_1_0(B)
         => ( v2989(VarCurr,B)
          <=> $false ) ) ) )).

fof(aaddConditionBooleanCondEqualRangesElseBranch_77,axiom,(
    ! [VarCurr] :
      ( ~ v741(VarCurr)
     => ! [B] :
          ( range_1_0(B)
         => ( v2990(VarCurr,B)
          <=> v2991(VarCurr,B) ) ) ) )).

fof(addConditionBooleanCondEqualRangesThenBranch_80,axiom,(
    ! [VarCurr] :
      ( v741(VarCurr)
     => ! [B] :
          ( range_1_0(B)
         => ( v2990(VarCurr,B)
          <=> b01(B) ) ) ) )).

fof(aaddConditionBooleanCondEqualRangesElseBranch_76,axiom,(
    ! [VarCurr] :
      ( ~ v2275(VarCurr)
     => ! [B] :
          ( range_1_0(B)
         => ( v2991(VarCurr,B)
          <=> $false ) ) ) )).

fof(addConditionBooleanCondEqualRangesThenBranch_79,axiom,(
    ! [VarCurr] :
      ( v2275(VarCurr)
     => ! [B] :
          ( range_1_0(B)
         => ( v2991(VarCurr,B)
          <=> b10(B) ) ) ) )).

fof(addBitVectorEqualityBitBlasted_112,axiom,(
    ! [VarCurr] :
      ( v2988(VarCurr)
    <=> ( ( v2261(VarCurr,bitIndex1)
        <=> $false )
        & ( v2261(VarCurr,bitIndex0)
        <=> $false ) ) ) )).

fof(addCaseBooleanConditionEqualRanges1_27,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( ~ v2940(VarNext)
       => ! [B] :
            ( range_4_0(B)
           => ( v2927(VarNext,B)
            <=> v2927(VarCurr,B) ) ) ) ) )).

fof(addCaseBooleanConditionEqualRanges0_39,axiom,(
    ! [VarNext] :
      ( v2940(VarNext)
     => ! [B] :
          ( range_4_0(B)
         => ( v2927(VarNext,B)
          <=> v2957(VarNext,B) ) ) ) )).

fof(addAssignment_2430,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ! [B] :
          ( range_4_0(B)
         => ( v2957(VarNext,B)
          <=> v2955(VarCurr,B) ) ) ) )).

fof(aaddConditionBooleanCondEqualRangesElseBranch_75,axiom,(
    ! [VarCurr] :
      ( ~ v2952(VarCurr)
     => ! [B] :
          ( range_4_0(B)
         => ( v2955(VarCurr,B)
          <=> v2958(VarCurr,B) ) ) ) )).

fof(addConditionBooleanCondEqualRangesThenBranch_78,axiom,(
    ! [VarCurr] :
      ( v2952(VarCurr)
     => ! [B] :
          ( range_4_0(B)
         => ( v2955(VarCurr,B)
          <=> $false ) ) ) )).

fof(aaddConditionBooleanCondEqualRangesElseBranch_74,axiom,(
    ! [VarCurr] :
      ( ~ v2929(VarCurr)
     => ! [B] :
          ( range_4_0(B)
         => ( v2958(VarCurr,B)
          <=> v2959(VarCurr,B) ) ) ) )).

fof(addConditionBooleanCondEqualRangesThenBranch_77,axiom,(
    ! [VarCurr] :
      ( v2929(VarCurr)
     => ! [B] :
          ( range_4_0(B)
         => ( v2958(VarCurr,B)
          <=> $false ) ) ) )).

fof(addAssignment_2429,axiom,(
    ! [VarCurr] :
      ( v2959(VarCurr,bitIndex0)
    <=> v2981(VarCurr) ) )).

fof(addAssignment_2428,axiom,(
    ! [VarCurr] :
      ( v2959(VarCurr,bitIndex1)
    <=> v2979(VarCurr) ) )).

fof(addAssignment_2427,axiom,(
    ! [VarCurr] :
      ( v2959(VarCurr,bitIndex2)
    <=> v2974(VarCurr) ) )).

fof(addAssignment_2426,axiom,(
    ! [VarCurr] :
      ( v2959(VarCurr,bitIndex3)
    <=> v2969(VarCurr) ) )).

fof(addAssignment_2425,axiom,(
    ! [VarCurr] :
      ( v2959(VarCurr,bitIndex4)
    <=> v2961(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_553,axiom,(
    ! [VarCurr] :
      ( v2979(VarCurr)
    <=> ( v2980(VarCurr)
        & v2983(VarCurr) ) ) )).

fof(writeBinaryOperatorShiftedRanges_501,axiom,(
    ! [VarCurr] :
      ( v2983(VarCurr)
    <=> ( v2927(VarCurr,bitIndex0)
        | v2927(VarCurr,bitIndex1) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_552,axiom,(
    ! [VarCurr] :
      ( v2980(VarCurr)
    <=> ( v2981(VarCurr)
        | v2982(VarCurr) ) ) )).

fof(writeUnaryOperator_267,axiom,(
    ! [VarCurr] :
      ( ~ v2982(VarCurr)
    <=> v2927(VarCurr,bitIndex1) ) )).

fof(writeUnaryOperator_266,axiom,(
    ! [VarCurr] :
      ( ~ v2981(VarCurr)
    <=> v2927(VarCurr,bitIndex0) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_551,axiom,(
    ! [VarCurr] :
      ( v2974(VarCurr)
    <=> ( v2975(VarCurr)
        & v2978(VarCurr) ) ) )).

fof(writeBinaryOperatorShiftedRanges_500,axiom,(
    ! [VarCurr] :
      ( v2978(VarCurr)
    <=> ( v2966(VarCurr)
        | v2927(VarCurr,bitIndex2) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_550,axiom,(
    ! [VarCurr] :
      ( v2975(VarCurr)
    <=> ( v2976(VarCurr)
        | v2977(VarCurr) ) ) )).

fof(writeUnaryOperator_265,axiom,(
    ! [VarCurr] :
      ( ~ v2977(VarCurr)
    <=> v2927(VarCurr,bitIndex2) ) )).

fof(writeUnaryOperator_264,axiom,(
    ! [VarCurr] :
      ( ~ v2976(VarCurr)
    <=> v2966(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_549,axiom,(
    ! [VarCurr] :
      ( v2969(VarCurr)
    <=> ( v2970(VarCurr)
        & v2973(VarCurr) ) ) )).

fof(writeBinaryOperatorShiftedRanges_499,axiom,(
    ! [VarCurr] :
      ( v2973(VarCurr)
    <=> ( v2965(VarCurr)
        | v2927(VarCurr,bitIndex3) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_548,axiom,(
    ! [VarCurr] :
      ( v2970(VarCurr)
    <=> ( v2971(VarCurr)
        | v2972(VarCurr) ) ) )).

fof(writeUnaryOperator_263,axiom,(
    ! [VarCurr] :
      ( ~ v2972(VarCurr)
    <=> v2927(VarCurr,bitIndex3) ) )).

fof(writeUnaryOperator_262,axiom,(
    ! [VarCurr] :
      ( ~ v2971(VarCurr)
    <=> v2965(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_547,axiom,(
    ! [VarCurr] :
      ( v2961(VarCurr)
    <=> ( v2962(VarCurr)
        & v2968(VarCurr) ) ) )).

fof(writeBinaryOperatorShiftedRanges_498,axiom,(
    ! [VarCurr] :
      ( v2968(VarCurr)
    <=> ( v2964(VarCurr)
        | v2927(VarCurr,bitIndex4) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_546,axiom,(
    ! [VarCurr] :
      ( v2962(VarCurr)
    <=> ( v2963(VarCurr)
        | v2967(VarCurr) ) ) )).

fof(writeUnaryOperator_261,axiom,(
    ! [VarCurr] :
      ( ~ v2967(VarCurr)
    <=> v2927(VarCurr,bitIndex4) ) )).

fof(writeUnaryOperator_260,axiom,(
    ! [VarCurr] :
      ( ~ v2963(VarCurr)
    <=> v2964(VarCurr) ) )).

fof(writeBinaryOperatorShiftedRanges_497,axiom,(
    ! [VarCurr] :
      ( v2964(VarCurr)
    <=> ( v2965(VarCurr)
        & v2927(VarCurr,bitIndex3) ) ) )).

fof(writeBinaryOperatorShiftedRanges_496,axiom,(
    ! [VarCurr] :
      ( v2965(VarCurr)
    <=> ( v2966(VarCurr)
        & v2927(VarCurr,bitIndex2) ) ) )).

fof(writeBinaryOperatorShiftedRanges_495,axiom,(
    ! [VarCurr] :
      ( v2966(VarCurr)
    <=> ( v2927(VarCurr,bitIndex0)
        & v2927(VarCurr,bitIndex1) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_545,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( v2940(VarNext)
      <=> ( v2941(VarNext)
          & v2948(VarNext) ) ) ) )).

fof(addAssignment_2424,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( v2948(VarNext)
      <=> v2946(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_544,axiom,(
    ! [VarCurr] :
      ( v2946(VarCurr)
    <=> ( v2949(VarCurr)
        | v2952(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_543,axiom,(
    ! [VarCurr] :
      ( v2952(VarCurr)
    <=> ( v2953(VarCurr)
        | v2954(VarCurr) ) ) )).

fof(writeUnaryOperator_259,axiom,(
    ! [VarCurr] :
      ( ~ v2954(VarCurr)
    <=> v1908(VarCurr) ) )).

fof(writeUnaryOperator_258,axiom,(
    ! [VarCurr] :
      ( ~ v2953(VarCurr)
    <=> v12(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_542,axiom,(
    ! [VarCurr] :
      ( v2949(VarCurr)
    <=> ( v2950(VarCurr)
        | v2929(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_541,axiom,(
    ! [VarCurr] :
      ( v2950(VarCurr)
    <=> ( v2265(VarCurr)
        & v2951(VarCurr) ) ) )).

fof(addBitVectorEqualityBitBlasted_111,axiom,(
    ! [VarCurr] :
      ( v2951(VarCurr)
    <=> ( ( v2261(VarCurr,bitIndex1)
        <=> $true )
        & ( v2261(VarCurr,bitIndex0)
        <=> $false ) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_540,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( v2941(VarNext)
      <=> ( v2942(VarNext)
          & v288(VarNext) ) ) ) )).

fof(writeUnaryOperator_257,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( ~ v2942(VarNext)
      <=> v1891(VarNext) ) ) )).

fof(addAssignmentInitValueVector_32,axiom,(
    ! [B] :
      ( range_4_0(B)
     => ( v2927(constB0,B)
      <=> $false ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_539,axiom,(
    ! [VarCurr] :
      ( v2929(VarCurr)
    <=> ( v2931(VarCurr)
        | v2933(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_538,axiom,(
    ! [VarCurr] :
      ( v2933(VarCurr)
    <=> ( v2934(VarCurr)
        & v2937(VarCurr) ) ) )).

fof(addBitVectorEqualityBitBlasted_110,axiom,(
    ! [VarCurr] :
      ( v2937(VarCurr)
    <=> ( ( v2290(VarCurr,bitIndex4)
        <=> $false )
        & ( v2290(VarCurr,bitIndex3)
        <=> $false )
        & ( v2290(VarCurr,bitIndex2)
        <=> $false )
        & ( v2290(VarCurr,bitIndex1)
        <=> $false )
        & ( v2290(VarCurr,bitIndex0)
        <=> $false ) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_537,axiom,(
    ! [VarCurr] :
      ( v2934(VarCurr)
    <=> ( v2935(VarCurr)
        | v2936(VarCurr) ) ) )).

fof(addBitVectorEqualityBitBlasted_109,axiom,(
    ! [VarCurr] :
      ( v2936(VarCurr)
    <=> ( ( v2261(VarCurr,bitIndex1)
        <=> $true )
        & ( v2261(VarCurr,bitIndex0)
        <=> $true ) ) ) )).

fof(addBitVectorEqualityBitBlasted_108,axiom,(
    ! [VarCurr] :
      ( v2935(VarCurr)
    <=> ( ( v2261(VarCurr,bitIndex1)
        <=> $true )
        & ( v2261(VarCurr,bitIndex0)
        <=> $false ) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_536,axiom,(
    ! [VarCurr] :
      ( v2931(VarCurr)
    <=> ( v2932(VarCurr)
        & v320(VarCurr) ) ) )).

fof(addBitVectorEqualityBitBlasted_107,axiom,(
    ! [VarCurr] :
      ( v2932(VarCurr)
    <=> ( ( v2261(VarCurr,bitIndex1)
        <=> $false )
        & ( v2261(VarCurr,bitIndex0)
        <=> $true ) ) ) )).

fof(addAssignmentInitValueVector_31,axiom,(
    ! [B] :
      ( range_1_0(B)
     => ( v2261(constB0,B)
      <=> $false ) ) )).

fof(addCaseBooleanConditionEqualRanges1_26,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( ~ v2855(VarNext)
       => ! [B] :
            ( range_4_0(B)
           => ( v2290(VarNext,B)
            <=> v2290(VarCurr,B) ) ) ) ) )).

fof(addCaseBooleanConditionEqualRanges0_38,axiom,(
    ! [VarNext] :
      ( v2855(VarNext)
     => ! [B] :
          ( range_4_0(B)
         => ( v2290(VarNext,B)
          <=> v2874(VarNext,B) ) ) ) )).

fof(addAssignment_2423,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ! [B] :
          ( range_4_0(B)
         => ( v2874(VarNext,B)
          <=> v2872(VarCurr,B) ) ) ) )).

fof(aaddConditionBooleanCondEqualRangesElseBranch_73,axiom,(
    ! [VarCurr] :
      ( ~ v2869(VarCurr)
     => ! [B] :
          ( range_4_0(B)
         => ( v2872(VarCurr,B)
          <=> v2875(VarCurr,B) ) ) ) )).

fof(addConditionBooleanCondEqualRangesThenBranch_76,axiom,(
    ! [VarCurr] :
      ( v2869(VarCurr)
     => ! [B] :
          ( range_4_0(B)
         => ( v2872(VarCurr,B)
          <=> $false ) ) ) )).

fof(aaddConditionBooleanCondEqualRangesElseBranch_72,axiom,(
    ! [VarCurr] :
      ( ~ v2867(VarCurr)
     => ! [B] :
          ( range_4_0(B)
         => ( v2875(VarCurr,B)
          <=> v2901(VarCurr,B) ) ) ) )).

fof(addConditionBooleanCondEqualRangesThenBranch_75,axiom,(
    ! [VarCurr] :
      ( v2867(VarCurr)
     => ! [B] :
          ( range_4_0(B)
         => ( v2875(VarCurr,B)
          <=> v2876(VarCurr,B) ) ) ) )).

fof(addAssignment_2422,axiom,(
    ! [VarCurr] :
      ( v2901(VarCurr,bitIndex0)
    <=> v2898(VarCurr) ) )).

fof(addAssignment_2421,axiom,(
    ! [VarCurr] :
      ( v2901(VarCurr,bitIndex1)
    <=> v2921(VarCurr) ) )).

fof(addAssignment_2420,axiom,(
    ! [VarCurr] :
      ( v2901(VarCurr,bitIndex2)
    <=> v2917(VarCurr) ) )).

fof(addAssignment_2419,axiom,(
    ! [VarCurr] :
      ( v2901(VarCurr,bitIndex3)
    <=> v2913(VarCurr) ) )).

fof(addAssignment_2418,axiom,(
    ! [VarCurr] :
      ( v2901(VarCurr,bitIndex4)
    <=> v2903(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_535,axiom,(
    ! [VarCurr] :
      ( v2921(VarCurr)
    <=> ( v2922(VarCurr)
        & v2923(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_534,axiom,(
    ! [VarCurr] :
      ( v2923(VarCurr)
    <=> ( v2290(VarCurr,bitIndex0)
        | v2899(VarCurr) ) ) )).

fof(writeBinaryOperatorShiftedRanges_494,axiom,(
    ! [VarCurr] :
      ( v2922(VarCurr)
    <=> ( v2898(VarCurr)
        | v2290(VarCurr,bitIndex1) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_533,axiom,(
    ! [VarCurr] :
      ( v2917(VarCurr)
    <=> ( v2918(VarCurr)
        & v2920(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_532,axiom,(
    ! [VarCurr] :
      ( v2920(VarCurr)
    <=> ( v2894(VarCurr)
        | v2910(VarCurr) ) ) )).

fof(writeBinaryOperatorShiftedRanges_493,axiom,(
    ! [VarCurr] :
      ( v2918(VarCurr)
    <=> ( v2290(VarCurr,bitIndex2)
        | v2919(VarCurr) ) ) )).

fof(writeUnaryOperator_256,axiom,(
    ! [VarCurr] :
      ( ~ v2919(VarCurr)
    <=> v2910(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_531,axiom,(
    ! [VarCurr] :
      ( v2913(VarCurr)
    <=> ( v2914(VarCurr)
        & v2916(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_530,axiom,(
    ! [VarCurr] :
      ( v2916(VarCurr)
    <=> ( v2889(VarCurr)
        | v2908(VarCurr) ) ) )).

fof(writeBinaryOperatorShiftedRanges_492,axiom,(
    ! [VarCurr] :
      ( v2914(VarCurr)
    <=> ( v2290(VarCurr,bitIndex3)
        | v2915(VarCurr) ) ) )).

fof(writeUnaryOperator_255,axiom,(
    ! [VarCurr] :
      ( ~ v2915(VarCurr)
    <=> v2908(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_529,axiom,(
    ! [VarCurr] :
      ( v2903(VarCurr)
    <=> ( v2904(VarCurr)
        & v2912(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_528,axiom,(
    ! [VarCurr] :
      ( v2912(VarCurr)
    <=> ( v2884(VarCurr)
        | v2906(VarCurr) ) ) )).

fof(writeBinaryOperatorShiftedRanges_491,axiom,(
    ! [VarCurr] :
      ( v2904(VarCurr)
    <=> ( v2290(VarCurr,bitIndex4)
        | v2905(VarCurr) ) ) )).

fof(writeUnaryOperator_254,axiom,(
    ! [VarCurr] :
      ( ~ v2905(VarCurr)
    <=> v2906(VarCurr) ) )).

fof(writeBinaryOperatorShiftedRanges_490,axiom,(
    ! [VarCurr] :
      ( v2906(VarCurr)
    <=> ( v2290(VarCurr,bitIndex3)
        | v2907(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_527,axiom,(
    ! [VarCurr] :
      ( v2907(VarCurr)
    <=> ( v2889(VarCurr)
        & v2908(VarCurr) ) ) )).

fof(writeBinaryOperatorShiftedRanges_489,axiom,(
    ! [VarCurr] :
      ( v2908(VarCurr)
    <=> ( v2290(VarCurr,bitIndex2)
        | v2909(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_526,axiom,(
    ! [VarCurr] :
      ( v2909(VarCurr)
    <=> ( v2894(VarCurr)
        & v2910(VarCurr) ) ) )).

fof(writeBinaryOperatorShiftedRanges_488,axiom,(
    ! [VarCurr] :
      ( v2910(VarCurr)
    <=> ( v2290(VarCurr,bitIndex1)
        | v2911(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_525,axiom,(
    ! [VarCurr] :
      ( v2911(VarCurr)
    <=> ( v2290(VarCurr,bitIndex0)
        & v2899(VarCurr) ) ) )).

fof(addAssignment_2417,axiom,(
    ! [VarCurr] :
      ( v2876(VarCurr,bitIndex0)
    <=> v2898(VarCurr) ) )).

fof(addAssignment_2416,axiom,(
    ! [VarCurr] :
      ( v2876(VarCurr,bitIndex1)
    <=> v2896(VarCurr) ) )).

fof(addAssignment_2415,axiom,(
    ! [VarCurr] :
      ( v2876(VarCurr,bitIndex2)
    <=> v2891(VarCurr) ) )).

fof(addAssignment_2414,axiom,(
    ! [VarCurr] :
      ( v2876(VarCurr,bitIndex3)
    <=> v2886(VarCurr) ) )).

fof(addAssignment_2413,axiom,(
    ! [VarCurr] :
      ( v2876(VarCurr,bitIndex4)
    <=> v2878(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_524,axiom,(
    ! [VarCurr] :
      ( v2896(VarCurr)
    <=> ( v2897(VarCurr)
        & v2900(VarCurr) ) ) )).

fof(writeBinaryOperatorShiftedRanges_487,axiom,(
    ! [VarCurr] :
      ( v2900(VarCurr)
    <=> ( v2290(VarCurr,bitIndex0)
        | v2290(VarCurr,bitIndex1) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_523,axiom,(
    ! [VarCurr] :
      ( v2897(VarCurr)
    <=> ( v2898(VarCurr)
        | v2899(VarCurr) ) ) )).

fof(writeUnaryOperator_253,axiom,(
    ! [VarCurr] :
      ( ~ v2899(VarCurr)
    <=> v2290(VarCurr,bitIndex1) ) )).

fof(writeUnaryOperator_252,axiom,(
    ! [VarCurr] :
      ( ~ v2898(VarCurr)
    <=> v2290(VarCurr,bitIndex0) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_522,axiom,(
    ! [VarCurr] :
      ( v2891(VarCurr)
    <=> ( v2892(VarCurr)
        & v2895(VarCurr) ) ) )).

fof(writeBinaryOperatorShiftedRanges_486,axiom,(
    ! [VarCurr] :
      ( v2895(VarCurr)
    <=> ( v2883(VarCurr)
        | v2290(VarCurr,bitIndex2) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_521,axiom,(
    ! [VarCurr] :
      ( v2892(VarCurr)
    <=> ( v2893(VarCurr)
        | v2894(VarCurr) ) ) )).

fof(writeUnaryOperator_251,axiom,(
    ! [VarCurr] :
      ( ~ v2894(VarCurr)
    <=> v2290(VarCurr,bitIndex2) ) )).

fof(writeUnaryOperator_250,axiom,(
    ! [VarCurr] :
      ( ~ v2893(VarCurr)
    <=> v2883(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_520,axiom,(
    ! [VarCurr] :
      ( v2886(VarCurr)
    <=> ( v2887(VarCurr)
        & v2890(VarCurr) ) ) )).

fof(writeBinaryOperatorShiftedRanges_485,axiom,(
    ! [VarCurr] :
      ( v2890(VarCurr)
    <=> ( v2882(VarCurr)
        | v2290(VarCurr,bitIndex3) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_519,axiom,(
    ! [VarCurr] :
      ( v2887(VarCurr)
    <=> ( v2888(VarCurr)
        | v2889(VarCurr) ) ) )).

fof(writeUnaryOperator_249,axiom,(
    ! [VarCurr] :
      ( ~ v2889(VarCurr)
    <=> v2290(VarCurr,bitIndex3) ) )).

fof(writeUnaryOperator_248,axiom,(
    ! [VarCurr] :
      ( ~ v2888(VarCurr)
    <=> v2882(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_518,axiom,(
    ! [VarCurr] :
      ( v2878(VarCurr)
    <=> ( v2879(VarCurr)
        & v2885(VarCurr) ) ) )).

fof(writeBinaryOperatorShiftedRanges_484,axiom,(
    ! [VarCurr] :
      ( v2885(VarCurr)
    <=> ( v2881(VarCurr)
        | v2290(VarCurr,bitIndex4) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_517,axiom,(
    ! [VarCurr] :
      ( v2879(VarCurr)
    <=> ( v2880(VarCurr)
        | v2884(VarCurr) ) ) )).

fof(writeUnaryOperator_247,axiom,(
    ! [VarCurr] :
      ( ~ v2884(VarCurr)
    <=> v2290(VarCurr,bitIndex4) ) )).

fof(writeUnaryOperator_246,axiom,(
    ! [VarCurr] :
      ( ~ v2880(VarCurr)
    <=> v2881(VarCurr) ) )).

fof(writeBinaryOperatorShiftedRanges_483,axiom,(
    ! [VarCurr] :
      ( v2881(VarCurr)
    <=> ( v2882(VarCurr)
        & v2290(VarCurr,bitIndex3) ) ) )).

fof(writeBinaryOperatorShiftedRanges_482,axiom,(
    ! [VarCurr] :
      ( v2882(VarCurr)
    <=> ( v2883(VarCurr)
        & v2290(VarCurr,bitIndex2) ) ) )).

fof(writeBinaryOperatorShiftedRanges_481,axiom,(
    ! [VarCurr] :
      ( v2883(VarCurr)
    <=> ( v2290(VarCurr,bitIndex0)
        & v2290(VarCurr,bitIndex1) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_516,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( v2855(VarNext)
      <=> ( v2856(VarNext)
          & v2863(VarNext) ) ) ) )).

fof(addAssignment_2412,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( v2863(VarNext)
      <=> v2861(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_515,axiom,(
    ! [VarCurr] :
      ( v2861(VarCurr)
    <=> ( v2864(VarCurr)
        | v2869(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_514,axiom,(
    ! [VarCurr] :
      ( v2869(VarCurr)
    <=> ( v2870(VarCurr)
        | v2871(VarCurr) ) ) )).

fof(writeUnaryOperator_245,axiom,(
    ! [VarCurr] :
      ( ~ v2871(VarCurr)
    <=> v1908(VarCurr) ) )).

fof(writeUnaryOperator_244,axiom,(
    ! [VarCurr] :
      ( ~ v2870(VarCurr)
    <=> v12(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_513,axiom,(
    ! [VarCurr] :
      ( v2864(VarCurr)
    <=> ( v2865(VarCurr)
        | v2867(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_512,axiom,(
    ! [VarCurr] :
      ( v2867(VarCurr)
    <=> ( v2275(VarCurr)
        & v2868(VarCurr) ) ) )).

fof(writeUnaryOperator_243,axiom,(
    ! [VarCurr] :
      ( ~ v2868(VarCurr)
    <=> v2292(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_511,axiom,(
    ! [VarCurr] :
      ( v2865(VarCurr)
    <=> ( v2866(VarCurr)
        & v2292(VarCurr) ) ) )).

fof(writeUnaryOperator_242,axiom,(
    ! [VarCurr] :
      ( ~ v2866(VarCurr)
    <=> v2275(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_510,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( v2856(VarNext)
      <=> ( v2857(VarNext)
          & v288(VarNext) ) ) ) )).

fof(writeUnaryOperator_241,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( ~ v2857(VarNext)
      <=> v1891(VarNext) ) ) )).

fof(addAssignmentInitValueVector_30,axiom,(
    ! [B] :
      ( range_4_0(B)
     => ( v2290(constB0,B)
      <=> $false ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_509,axiom,(
    ! [VarCurr] :
      ( v2292(VarCurr)
    <=> ( v2294(VarCurr)
        & v2852(VarCurr) ) ) )).

fof(addBitVectorEqualityBitBlasted_106,axiom,(
    ! [VarCurr] :
      ( v2852(VarCurr)
    <=> ( v2775(VarCurr)
      <=> $true ) ) )).

fof(addAssignment_2411,axiom,(
    ! [VarCurr] :
      ( v2775(VarCurr)
    <=> v2777(VarCurr,bitIndex3) ) )).

fof(addAssignment_2410,axiom,(
    ! [VarCurr] :
      ( v2777(VarCurr,bitIndex3)
    <=> v2779(VarCurr,bitIndex3) ) )).

fof(addAssignment_2409,axiom,(
    ! [VarCurr] :
      ( v2779(VarCurr,bitIndex3)
    <=> v2781(VarCurr,bitIndex3) ) )).

fof(addAssignment_2408,axiom,(
    ! [VarNext] :
      ( v2781(VarNext,bitIndex3)
    <=> v2836(VarNext,bitIndex3) ) )).

fof(addCaseBooleanConditionEqualRanges1_25,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( ~ v2837(VarNext)
       => ! [B] :
            ( range_3_0(B)
           => ( v2836(VarNext,B)
            <=> v2781(VarCurr,B) ) ) ) ) )).

fof(addCaseBooleanConditionEqualRanges0_37,axiom,(
    ! [VarNext] :
      ( v2837(VarNext)
     => ! [B] :
          ( range_3_0(B)
         => ( v2836(VarNext,B)
          <=> v2847(VarNext,B) ) ) ) )).

fof(addAssignment_2407,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ! [B] :
          ( range_3_0(B)
         => ( v2847(VarNext,B)
          <=> v2845(VarCurr,B) ) ) ) )).

fof(aaddConditionBooleanCondEqualRangesElseBranch_71,axiom,(
    ! [VarCurr] :
      ( ~ v2848(VarCurr)
     => ! [B] :
          ( range_3_0(B)
         => ( v2845(VarCurr,B)
          <=> v2785(VarCurr,B) ) ) ) )).

fof(addConditionBooleanCondEqualRangesThenBranch_74,axiom,(
    ! [VarCurr] :
      ( v2848(VarCurr)
     => ! [B] :
          ( range_3_0(B)
         => ( v2845(VarCurr,B)
          <=> $false ) ) ) )).

fof(writeUnaryOperator_240,axiom,(
    ! [VarCurr] :
      ( ~ v2848(VarCurr)
    <=> v2783(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_508,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( v2837(VarNext)
      <=> v2838(VarNext) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_507,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( v2838(VarNext)
      <=> ( v2839(VarNext)
          & v2834(VarNext) ) ) ) )).

fof(writeUnaryOperator_239,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( ~ v2839(VarNext)
      <=> v2841(VarNext) ) ) )).

fof(addAssignment_2406,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( v2841(VarNext)
      <=> v2834(VarCurr) ) ) )).

fof(addAssignment_2405,axiom,(
    ! [VarCurr] :
      ( v2834(VarCurr)
    <=> v195(VarCurr) ) )).

fof(addAssignment_2404,axiom,(
    ! [VarCurr] :
      ( v2785(VarCurr,bitIndex3)
    <=> v2832(VarCurr,bitIndex3) ) )).

fof(aaddConditionBooleanCondEqualRangesElseBranch_70,axiom,(
    ! [VarCurr] :
      ( ~ v2787(VarCurr)
     => ! [B] :
          ( range_3_0(B)
         => ( v2832(VarCurr,B)
          <=> v2793(VarCurr,B) ) ) ) )).

fof(addConditionBooleanCondEqualRangesThenBranch_73,axiom,(
    ! [VarCurr] :
      ( v2787(VarCurr)
     => ! [B] :
          ( range_3_0(B)
         => ( v2832(VarCurr,B)
          <=> b0011(B) ) ) ) )).

fof(addAssignment_2403,axiom,(
    ! [VarCurr] :
      ( v2793(VarCurr,bitIndex3)
    <=> v2804(VarCurr,bitIndex3) ) )).

fof(aaddConditionBooleanCondEqualRangesElseBranch_69,axiom,(
    ! [VarCurr] :
      ( ~ v2805(VarCurr)
     => ! [B] :
          ( range_3_0(B)
         => ( v2804(VarCurr,B)
          <=> $false ) ) ) )).

fof(addConditionBooleanCondEqualRangesThenBranch_72,axiom,(
    ! [VarCurr] :
      ( v2805(VarCurr)
     => ! [B] :
          ( range_3_0(B)
         => ( v2804(VarCurr,B)
          <=> v2828(VarCurr,B) ) ) ) )).

fof(addParallelCaseBooleanConditionEqualRanges5_1,axiom,(
    ! [VarCurr] :
      ( ( ~ v2810(VarCurr)
        & ~ v2812(VarCurr)
        & ~ v2815(VarCurr)
        & ~ v2822(VarCurr)
        & ~ v2823(VarCurr) )
     => ! [B] :
          ( range_3_0(B)
         => ( v2828(VarCurr,B)
          <=> v2831(VarCurr,B) ) ) ) )).

fof(addParallelCaseBooleanConditionEqualRanges4_1,axiom,(
    ! [VarCurr] :
      ( v2823(VarCurr)
     => ! [B] :
          ( range_3_0(B)
         => ( v2828(VarCurr,B)
          <=> v2830(VarCurr,B) ) ) ) )).

fof(addParallelCaseBooleanConditionEqualRanges3_5,axiom,(
    ! [VarCurr] :
      ( v2822(VarCurr)
     => ! [B] :
          ( range_3_0(B)
         => ( v2828(VarCurr,B)
          <=> b0100(B) ) ) ) )).

fof(addParallelCaseBooleanConditionEqualRanges2_7,axiom,(
    ! [VarCurr] :
      ( v2815(VarCurr)
     => ! [B] :
          ( range_3_0(B)
         => ( v2828(VarCurr,B)
          <=> $false ) ) ) )).

fof(addParallelCaseBooleanConditionEqualRanges1_19,axiom,(
    ! [VarCurr] :
      ( v2812(VarCurr)
     => ! [B] :
          ( range_3_0(B)
         => ( v2828(VarCurr,B)
          <=> v2829(VarCurr,B) ) ) ) )).

fof(addParallelCaseBooleanConditionEqualRanges0_19,axiom,(
    ! [VarCurr] :
      ( v2810(VarCurr)
     => ! [B] :
          ( range_3_0(B)
         => ( v2828(VarCurr,B)
          <=> b0010(B) ) ) ) )).

fof(aaddConditionBooleanCondEqualRangesElseBranch_68,axiom,(
    ! [VarCurr] :
      ( ~ v2803(VarCurr)
     => ! [B] :
          ( range_3_0(B)
         => ( v2831(VarCurr,B)
          <=> b1001(B) ) ) ) )).

fof(addConditionBooleanCondEqualRangesThenBranch_71,axiom,(
    ! [VarCurr] :
      ( v2803(VarCurr)
     => ! [B] :
          ( range_3_0(B)
         => ( v2831(VarCurr,B)
          <=> b1000(B) ) ) ) )).

fof(addParallelCaseBooleanConditionEqualRanges1_18,axiom,(
    ! [VarCurr] :
      ( ~ v2825(VarCurr)
     => ! [B] :
          ( range_3_0(B)
         => ( v2830(VarCurr,B)
          <=> b1010(B) ) ) ) )).

fof(addParallelCaseBooleanConditionEqualRanges0_18,axiom,(
    ! [VarCurr] :
      ( v2825(VarCurr)
     => ! [B] :
          ( range_3_0(B)
         => ( v2830(VarCurr,B)
          <=> b1011(B) ) ) ) )).

fof(aaddConditionBooleanCondEqualRangesElseBranch_67,axiom,(
    ! [VarCurr] :
      ( ~ v2803(VarCurr)
     => ! [B] :
          ( range_3_0(B)
         => ( v2829(VarCurr,B)
          <=> $false ) ) ) )).

fof(addConditionBooleanCondEqualRangesThenBranch_70,axiom,(
    ! [VarCurr] :
      ( v2803(VarCurr)
     => ! [B] :
          ( range_3_0(B)
         => ( v2829(VarCurr,B)
          <=> b0001(B) ) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_506,axiom,(
    ! [VarCurr] :
      ( v2805(VarCurr)
    <=> ( v2806(VarCurr)
        | v2827(VarCurr) ) ) )).

fof(addBitVectorEqualityBitBlasted_105,axiom,(
    ! [VarCurr] :
      ( v2827(VarCurr)
    <=> ( ( v158(VarCurr,bitIndex6)
        <=> $true )
        & ( v158(VarCurr,bitIndex5)
        <=> $false )
        & ( v158(VarCurr,bitIndex4)
        <=> $false )
        & ( v158(VarCurr,bitIndex3)
        <=> $true )
        & ( v158(VarCurr,bitIndex2)
        <=> $false )
        & ( v158(VarCurr,bitIndex1)
        <=> $true )
        & ( v158(VarCurr,bitIndex0)
        <=> $false ) ) ) )).

fof(bitBlastConstant_610,axiom,(
    b1001010(bitIndex6) )).

fof(bitBlastConstant_609,axiom,(
    ~ b1001010(bitIndex5) )).

fof(bitBlastConstant_608,axiom,(
    ~ b1001010(bitIndex4) )).

fof(bitBlastConstant_607,axiom,(
    b1001010(bitIndex3) )).

fof(bitBlastConstant_606,axiom,(
    ~ b1001010(bitIndex2) )).

fof(bitBlastConstant_605,axiom,(
    b1001010(bitIndex1) )).

fof(bitBlastConstant_604,axiom,(
    ~ b1001010(bitIndex0) )).

fof(writeBinaryOperatorEqualRangesSingleBits_505,axiom,(
    ! [VarCurr] :
      ( v2806(VarCurr)
    <=> ( v2807(VarCurr)
        | v2823(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_504,axiom,(
    ! [VarCurr] :
      ( v2823(VarCurr)
    <=> ( v2824(VarCurr)
        & v2750(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_503,axiom,(
    ! [VarCurr] :
      ( v2824(VarCurr)
    <=> ( v2825(VarCurr)
        | v2826(VarCurr) ) ) )).

fof(addBitVectorEqualityBitBlasted_104,axiom,(
    ! [VarCurr] :
      ( v2826(VarCurr)
    <=> ( ( v145(VarCurr,bitIndex2)
        <=> $true )
        & ( v145(VarCurr,bitIndex1)
        <=> $true )
        & ( v145(VarCurr,bitIndex0)
        <=> $true ) ) ) )).

fof(addBitVectorEqualityBitBlasted_103,axiom,(
    ! [VarCurr] :
      ( v2825(VarCurr)
    <=> ( ( v145(VarCurr,bitIndex2)
        <=> $false )
        & ( v145(VarCurr,bitIndex1)
        <=> $false )
        & ( v145(VarCurr,bitIndex0)
        <=> $true ) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_502,axiom,(
    ! [VarCurr] :
      ( v2807(VarCurr)
    <=> ( v2808(VarCurr)
        | v2822(VarCurr) ) ) )).

fof(addBitVectorEqualityBitBlasted_102,axiom,(
    ! [VarCurr] :
      ( v2822(VarCurr)
    <=> ( ( v158(VarCurr,bitIndex6)
        <=> $true )
        & ( v158(VarCurr,bitIndex5)
        <=> $true )
        & ( v158(VarCurr,bitIndex4)
        <=> $true )
        & ( v158(VarCurr,bitIndex3)
        <=> $true )
        & ( v158(VarCurr,bitIndex2)
        <=> $false )
        & ( v158(VarCurr,bitIndex1)
        <=> $true )
        & ( v158(VarCurr,bitIndex0)
        <=> $false ) ) ) )).

fof(bitBlastConstant_603,axiom,(
    b1111010(bitIndex6) )).

fof(bitBlastConstant_602,axiom,(
    b1111010(bitIndex5) )).

fof(bitBlastConstant_601,axiom,(
    b1111010(bitIndex4) )).

fof(bitBlastConstant_600,axiom,(
    b1111010(bitIndex3) )).

fof(bitBlastConstant_599,axiom,(
    ~ b1111010(bitIndex2) )).

fof(bitBlastConstant_598,axiom,(
    b1111010(bitIndex1) )).

fof(bitBlastConstant_597,axiom,(
    ~ b1111010(bitIndex0) )).

fof(writeBinaryOperatorEqualRangesSingleBits_501,axiom,(
    ! [VarCurr] :
      ( v2808(VarCurr)
    <=> ( v2809(VarCurr)
        | v2815(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_500,axiom,(
    ! [VarCurr] :
      ( v2815(VarCurr)
    <=> ( v2816(VarCurr)
        | v2821(VarCurr) ) ) )).

fof(addBitVectorEqualityBitBlasted_101,axiom,(
    ! [VarCurr] :
      ( v2821(VarCurr)
    <=> ( ( v158(VarCurr,bitIndex6)
        <=> $true )
        & ( v158(VarCurr,bitIndex5)
        <=> $true )
        & ( v158(VarCurr,bitIndex4)
        <=> $true )
        & ( v158(VarCurr,bitIndex3)
        <=> $false )
        & ( v158(VarCurr,bitIndex2)
        <=> $false )
        & ( v158(VarCurr,bitIndex1)
        <=> $false )
        & ( v158(VarCurr,bitIndex0)
        <=> $false ) ) ) )).

fof(bitBlastConstant_596,axiom,(
    b1110000(bitIndex6) )).

fof(bitBlastConstant_595,axiom,(
    b1110000(bitIndex5) )).

fof(bitBlastConstant_594,axiom,(
    b1110000(bitIndex4) )).

fof(bitBlastConstant_593,axiom,(
    ~ b1110000(bitIndex3) )).

fof(bitBlastConstant_592,axiom,(
    ~ b1110000(bitIndex2) )).

fof(bitBlastConstant_591,axiom,(
    ~ b1110000(bitIndex1) )).

fof(bitBlastConstant_590,axiom,(
    ~ b1110000(bitIndex0) )).

fof(writeBinaryOperatorEqualRangesSingleBits_499,axiom,(
    ! [VarCurr] :
      ( v2816(VarCurr)
    <=> ( v2817(VarCurr)
        | v2820(VarCurr) ) ) )).

fof(addBitVectorEqualityBitBlasted_100,axiom,(
    ! [VarCurr] :
      ( v2820(VarCurr)
    <=> ( ( v158(VarCurr,bitIndex6)
        <=> $true )
        & ( v158(VarCurr,bitIndex5)
        <=> $false )
        & ( v158(VarCurr,bitIndex4)
        <=> $true )
        & ( v158(VarCurr,bitIndex3)
        <=> $false )
        & ( v158(VarCurr,bitIndex2)
        <=> $false )
        & ( v158(VarCurr,bitIndex1)
        <=> $false )
        & ( v158(VarCurr,bitIndex0)
        <=> $false ) ) ) )).

fof(bitBlastConstant_589,axiom,(
    b1010000(bitIndex6) )).

fof(bitBlastConstant_588,axiom,(
    ~ b1010000(bitIndex5) )).

fof(bitBlastConstant_587,axiom,(
    b1010000(bitIndex4) )).

fof(bitBlastConstant_586,axiom,(
    ~ b1010000(bitIndex3) )).

fof(bitBlastConstant_585,axiom,(
    ~ b1010000(bitIndex2) )).

fof(bitBlastConstant_584,axiom,(
    ~ b1010000(bitIndex1) )).

fof(bitBlastConstant_583,axiom,(
    ~ b1010000(bitIndex0) )).

fof(writeBinaryOperatorEqualRangesSingleBits_498,axiom,(
    ! [VarCurr] :
      ( v2817(VarCurr)
    <=> ( v2818(VarCurr)
        | v2819(VarCurr) ) ) )).

fof(addBitVectorEqualityBitBlasted_99,axiom,(
    ! [VarCurr] :
      ( v2819(VarCurr)
    <=> ( ( v158(VarCurr,bitIndex6)
        <=> $true )
        & ( v158(VarCurr,bitIndex5)
        <=> $true )
        & ( v158(VarCurr,bitIndex4)
        <=> $true )
        & ( v158(VarCurr,bitIndex3)
        <=> $true )
        & ( v158(VarCurr,bitIndex2)
        <=> $false )
        & ( v158(VarCurr,bitIndex1)
        <=> $false )
        & ( v158(VarCurr,bitIndex0)
        <=> $false ) ) ) )).

fof(bitBlastConstant_582,axiom,(
    b1111000(bitIndex6) )).

fof(bitBlastConstant_581,axiom,(
    b1111000(bitIndex5) )).

fof(bitBlastConstant_580,axiom,(
    b1111000(bitIndex4) )).

fof(bitBlastConstant_579,axiom,(
    b1111000(bitIndex3) )).

fof(bitBlastConstant_578,axiom,(
    ~ b1111000(bitIndex2) )).

fof(bitBlastConstant_577,axiom,(
    ~ b1111000(bitIndex1) )).

fof(bitBlastConstant_576,axiom,(
    ~ b1111000(bitIndex0) )).

fof(addBitVectorEqualityBitBlasted_98,axiom,(
    ! [VarCurr] :
      ( v2818(VarCurr)
    <=> ( ( v158(VarCurr,bitIndex6)
        <=> $true )
        & ( v158(VarCurr,bitIndex5)
        <=> $false )
        & ( v158(VarCurr,bitIndex4)
        <=> $true )
        & ( v158(VarCurr,bitIndex3)
        <=> $true )
        & ( v158(VarCurr,bitIndex2)
        <=> $false )
        & ( v158(VarCurr,bitIndex1)
        <=> $false )
        & ( v158(VarCurr,bitIndex0)
        <=> $false ) ) ) )).

fof(bitBlastConstant_575,axiom,(
    b1011000(bitIndex6) )).

fof(bitBlastConstant_574,axiom,(
    ~ b1011000(bitIndex5) )).

fof(bitBlastConstant_573,axiom,(
    b1011000(bitIndex4) )).

fof(bitBlastConstant_572,axiom,(
    b1011000(bitIndex3) )).

fof(bitBlastConstant_571,axiom,(
    ~ b1011000(bitIndex2) )).

fof(bitBlastConstant_570,axiom,(
    ~ b1011000(bitIndex1) )).

fof(bitBlastConstant_569,axiom,(
    ~ b1011000(bitIndex0) )).

fof(writeBinaryOperatorEqualRangesSingleBits_497,axiom,(
    ! [VarCurr] :
      ( v2809(VarCurr)
    <=> ( v2810(VarCurr)
        | v2812(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_496,axiom,(
    ! [VarCurr] :
      ( v2812(VarCurr)
    <=> ( v2813(VarCurr)
        | v2814(VarCurr) ) ) )).

fof(addBitVectorEqualityBitBlasted_97,axiom,(
    ! [VarCurr] :
      ( v2814(VarCurr)
    <=> ( ( v158(VarCurr,bitIndex6)
        <=> $true )
        & ( v158(VarCurr,bitIndex5)
        <=> $true )
        & ( v158(VarCurr,bitIndex4)
        <=> $false )
        & ( v158(VarCurr,bitIndex3)
        <=> $false )
        & ( v158(VarCurr,bitIndex2)
        <=> $false )
        & ( v158(VarCurr,bitIndex1)
        <=> $false )
        & ( v158(VarCurr,bitIndex0)
        <=> $false ) ) ) )).

fof(bitBlastConstant_568,axiom,(
    b1100000(bitIndex6) )).

fof(bitBlastConstant_567,axiom,(
    b1100000(bitIndex5) )).

fof(bitBlastConstant_566,axiom,(
    ~ b1100000(bitIndex4) )).

fof(bitBlastConstant_565,axiom,(
    ~ b1100000(bitIndex3) )).

fof(bitBlastConstant_564,axiom,(
    ~ b1100000(bitIndex2) )).

fof(bitBlastConstant_563,axiom,(
    ~ b1100000(bitIndex1) )).

fof(bitBlastConstant_562,axiom,(
    ~ b1100000(bitIndex0) )).

fof(addBitVectorEqualityBitBlasted_96,axiom,(
    ! [VarCurr] :
      ( v2813(VarCurr)
    <=> ( ( v158(VarCurr,bitIndex6)
        <=> $true )
        & ( v158(VarCurr,bitIndex5)
        <=> $false )
        & ( v158(VarCurr,bitIndex4)
        <=> $false )
        & ( v158(VarCurr,bitIndex3)
        <=> $false )
        & ( v158(VarCurr,bitIndex2)
        <=> $false )
        & ( v158(VarCurr,bitIndex1)
        <=> $false )
        & ( v158(VarCurr,bitIndex0)
        <=> $false ) ) ) )).

fof(bitBlastConstant_561,axiom,(
    b1000000(bitIndex6) )).

fof(bitBlastConstant_560,axiom,(
    ~ b1000000(bitIndex5) )).

fof(bitBlastConstant_559,axiom,(
    ~ b1000000(bitIndex4) )).

fof(bitBlastConstant_558,axiom,(
    ~ b1000000(bitIndex3) )).

fof(bitBlastConstant_557,axiom,(
    ~ b1000000(bitIndex2) )).

fof(bitBlastConstant_556,axiom,(
    ~ b1000000(bitIndex1) )).

fof(bitBlastConstant_555,axiom,(
    ~ b1000000(bitIndex0) )).

fof(writeBinaryOperatorEqualRangesSingleBits_495,axiom,(
    ! [VarCurr] :
      ( v2810(VarCurr)
    <=> ( v2811(VarCurr)
        & v170(VarCurr) ) ) )).

fof(writeUnaryOperator_238,axiom,(
    ! [VarCurr] :
      ( ~ v2811(VarCurr)
    <=> v145(VarCurr,bitIndex0) ) )).

fof(addAssignment_2402,axiom,(
    ! [VarCurr] :
      ( v2803(VarCurr)
    <=> v2424(VarCurr) ) )).

fof(addAssignment_2401,axiom,(
    ! [VarCurr,B] :
      ( range_2_1(B)
     => ( v145(VarCurr,B)
      <=> v147(VarCurr,B) ) ) )).

fof(range_axiom_32,axiom,(
    ! [B] :
      ( range_2_1(B)
    <=> ( $false
        | bitIndex1 = B
        | bitIndex2 = B ) ) )).

fof(addAssignment_2400,axiom,(
    ! [VarCurr] :
      ( ( v147(VarCurr,bitIndex2)
      <=> v149(VarCurr,bitIndex14) )
      & ( v147(VarCurr,bitIndex1)
      <=> v149(VarCurr,bitIndex13) ) ) )).

fof(addAssignment_2399,axiom,(
    ! [VarCurr,B] :
      ( range_14_13(B)
     => ( v149(VarCurr,B)
      <=> v151(VarCurr,B) ) ) )).

fof(addAssignment_2398,axiom,(
    ! [VarCurr,B] :
      ( range_14_13(B)
     => ( v151(VarCurr,B)
      <=> v156(VarCurr,B) ) ) )).

fof(range_axiom_31,axiom,(
    ! [B] :
      ( range_14_13(B)
    <=> ( $false
        | bitIndex13 = B
        | bitIndex14 = B ) ) )).

fof(addAssignment_2397,axiom,(
    ! [VarCurr] :
      ( v2787(VarCurr)
    <=> v2789(VarCurr) ) )).

fof(addAssignment_2396,axiom,(
    ! [VarCurr] :
      ( v2789(VarCurr)
    <=> v2791(VarCurr) ) )).

fof(addAssignment_2395,axiom,(
    ! [VarCurr] :
      ( v2791(VarCurr)
    <=> v2412(VarCurr) ) )).

fof(addAssignment_2394,axiom,(
    ! [VarCurr] :
      ( v2783(VarCurr)
    <=> v125(VarCurr) ) )).

fof(addAssignment_2393,axiom,(
    ! [VarCurr] :
      ( v2294(VarCurr)
    <=> v2296(VarCurr) ) )).

fof(addAssignment_2392,axiom,(
    ! [VarCurr] :
      ( v2296(VarCurr)
    <=> v2298(VarCurr) ) )).

fof(addAssignment_2391,axiom,(
    ! [VarCurr] :
      ( v2298(VarCurr)
    <=> v2300(VarCurr) ) )).

fof(addCaseBooleanConditionEqualRanges1_24,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( ~ v2756(VarNext)
       => ( v2300(VarNext)
        <=> v2300(VarCurr) ) ) ) )).

fof(addCaseBooleanConditionEqualRanges0_36,axiom,(
    ! [VarNext] :
      ( v2756(VarNext)
     => ( v2300(VarNext)
      <=> v2764(VarNext) ) ) )).

fof(addAssignment_2390,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( v2764(VarNext)
      <=> v2762(VarCurr) ) ) )).

fof(aaddConditionBooleanCondEqualRangesElseBranch_66,axiom,(
    ! [VarCurr] :
      ( ~ v2765(VarCurr)
     => ( v2762(VarCurr)
      <=> v2766(VarCurr) ) ) )).

fof(addConditionBooleanCondEqualRangesThenBranch_69,axiom,(
    ! [VarCurr] :
      ( v2765(VarCurr)
     => ( v2762(VarCurr)
      <=> $false ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_494,axiom,(
    ! [VarCurr] :
      ( v2766(VarCurr)
    <=> ( v2767(VarCurr)
        | v2741(VarCurr) ) ) )).

fof(writeBinaryOperatorShiftedRanges_480,axiom,(
    ! [VarCurr] :
      ( v2767(VarCurr)
    <=> ( v2768(VarCurr)
        | v2302(VarCurr,bitIndex12) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_493,axiom,(
    ! [VarCurr] :
      ( v2768(VarCurr)
    <=> ( v2769(VarCurr)
        | v2418(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_492,axiom,(
    ! [VarCurr] :
      ( v2769(VarCurr)
    <=> ( v2770(VarCurr)
        | v2412(VarCurr) ) ) )).

fof(writeBinaryOperatorShiftedRanges_479,axiom,(
    ! [VarCurr] :
      ( v2770(VarCurr)
    <=> ( v2771(VarCurr)
        | v2302(VarCurr,bitIndex9) ) ) )).

fof(writeBinaryOperatorShiftedRanges_478,axiom,(
    ! [VarCurr] :
      ( v2771(VarCurr)
    <=> ( v2302(VarCurr,bitIndex3)
        | v2302(VarCurr,bitIndex6) ) ) )).

fof(writeUnaryOperator_237,axiom,(
    ! [VarCurr] :
      ( ~ v2765(VarCurr)
    <=> v123(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_491,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( v2756(VarNext)
      <=> v2757(VarNext) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_490,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( v2757(VarNext)
      <=> ( v2758(VarNext)
          & v193(VarNext) ) ) ) )).

fof(writeUnaryOperator_236,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( ~ v2758(VarNext)
      <=> v204(VarNext) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_489,axiom,(
    ! [VarCurr] :
      ( v2741(VarCurr)
    <=> ( v2752(VarCurr)
        & v2753(VarCurr) ) ) )).

fof(writeUnaryOperator_235,axiom,(
    ! [VarCurr] :
      ( ~ v2753(VarCurr)
    <=> v2322(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_488,axiom,(
    ! [VarCurr] :
      ( v2752(VarCurr)
    <=> ( v2304(VarCurr)
        & v2743(VarCurr) ) ) )).

fof(addAssignment_2389,axiom,(
    ! [VarCurr] :
      ( v2743(VarCurr)
    <=> v2745(VarCurr) ) )).

fof(addAssignment_2388,axiom,(
    ! [VarCurr] :
      ( v2745(VarCurr)
    <=> v2747(VarCurr) ) )).

fof(aaddConditionBooleanCondEqualRangesElseBranch_65,axiom,(
    ! [VarCurr] :
      ( ~ v2750(VarCurr)
     => ( v2747(VarCurr)
      <=> $false ) ) )).

fof(addConditionBooleanCondEqualRangesThenBranch_68,axiom,(
    ! [VarCurr] :
      ( v2750(VarCurr)
     => ( v2747(VarCurr)
      <=> $true ) ) )).

fof(addBitVectorEqualityBitBlasted_95,axiom,(
    ! [VarCurr] :
      ( v2750(VarCurr)
    <=> ( ( v158(VarCurr,bitIndex6)
        <=> $false )
        & ( v158(VarCurr,bitIndex5)
        <=> $false )
        & ( v158(VarCurr,bitIndex4)
        <=> $false )
        & ( v158(VarCurr,bitIndex3)
        <=> $true )
        & ( v158(VarCurr,bitIndex2)
        <=> $false )
        & ( v158(VarCurr,bitIndex1)
        <=> $true )
        & ( v158(VarCurr,bitIndex0)
        <=> $false ) ) ) )).

fof(bitBlastConstant_554,axiom,(
    ~ b0001010(bitIndex6) )).

fof(bitBlastConstant_553,axiom,(
    ~ b0001010(bitIndex5) )).

fof(bitBlastConstant_552,axiom,(
    ~ b0001010(bitIndex4) )).

fof(bitBlastConstant_551,axiom,(
    b0001010(bitIndex3) )).

fof(bitBlastConstant_550,axiom,(
    ~ b0001010(bitIndex2) )).

fof(bitBlastConstant_549,axiom,(
    b0001010(bitIndex1) )).

fof(bitBlastConstant_548,axiom,(
    ~ b0001010(bitIndex0) )).

fof(addConditionBooleanCondShiftedRangesElseBranch_19,axiom,(
    ! [VarCurr] :
      ( ~ v2737(VarCurr)
     => ( v2302(VarCurr,bitIndex12)
      <=> $false ) ) )).

fof(addConditionBooleanCondShiftedRangesThenBranch_16,axiom,(
    ! [VarCurr] :
      ( v2737(VarCurr)
     => ( v2302(VarCurr,bitIndex12)
      <=> $true ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_487,axiom,(
    ! [VarCurr] :
      ( v2737(VarCurr)
    <=> ( v2738(VarCurr)
        & v2739(VarCurr) ) ) )).

fof(addBitVectorEqualityBitBlasted_94,axiom,(
    ! [VarCurr] :
      ( v2739(VarCurr)
    <=> ( $true
      <=> v2397(VarCurr,bitIndex11) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_486,axiom,(
    ! [VarCurr] :
      ( v2738(VarCurr)
    <=> ( v2365(VarCurr)
        & v2304(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_485,axiom,(
    ! [VarCurr] :
      ( v2418(VarCurr)
    <=> ( v2420(VarCurr)
        | v2732(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_484,axiom,(
    ! [VarCurr] :
      ( v2732(VarCurr)
    <=> ( v2734(VarCurr)
        & v2426(VarCurr) ) ) )).

fof(writeUnaryOperator_234,axiom,(
    ! [VarCurr] :
      ( ~ v2734(VarCurr)
    <=> v2422(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_483,axiom,(
    ! [VarCurr] :
      ( v2420(VarCurr)
    <=> ( v2730(VarCurr)
        & v2441(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_482,axiom,(
    ! [VarCurr] :
      ( v2730(VarCurr)
    <=> ( v2422(VarCurr)
        & v2426(VarCurr) ) ) )).

fof(addAssignment_2387,axiom,(
    ! [VarCurr] :
      ( v2441(VarCurr)
    <=> v2443(VarCurr) ) )).

fof(addAssignment_2386,axiom,(
    ! [VarCurr] :
      ( v2443(VarCurr)
    <=> v2445(VarCurr) ) )).

fof(writeBinaryOperatorShiftedRanges_477,axiom,(
    ! [VarCurr] :
      ( v2445(VarCurr)
    <=> ( v2722(VarCurr)
        & v2447(VarCurr,bitIndex8) ) ) )).

fof(writeBinaryOperatorShiftedRanges_476,axiom,(
    ! [VarCurr] :
      ( v2722(VarCurr)
    <=> ( v2723(VarCurr)
        & v2447(VarCurr,bitIndex7) ) ) )).

fof(writeBinaryOperatorShiftedRanges_475,axiom,(
    ! [VarCurr] :
      ( v2723(VarCurr)
    <=> ( v2724(VarCurr)
        & v2447(VarCurr,bitIndex6) ) ) )).

fof(writeBinaryOperatorShiftedRanges_474,axiom,(
    ! [VarCurr] :
      ( v2724(VarCurr)
    <=> ( v2725(VarCurr)
        & v2447(VarCurr,bitIndex5) ) ) )).

fof(writeBinaryOperatorShiftedRanges_473,axiom,(
    ! [VarCurr] :
      ( v2725(VarCurr)
    <=> ( v2726(VarCurr)
        & v2447(VarCurr,bitIndex4) ) ) )).

fof(writeBinaryOperatorShiftedRanges_472,axiom,(
    ! [VarCurr] :
      ( v2726(VarCurr)
    <=> ( v2727(VarCurr)
        & v2447(VarCurr,bitIndex3) ) ) )).

fof(writeBinaryOperatorShiftedRanges_471,axiom,(
    ! [VarCurr] :
      ( v2727(VarCurr)
    <=> ( v2728(VarCurr)
        & v2447(VarCurr,bitIndex2) ) ) )).

fof(writeBinaryOperatorShiftedRanges_470,axiom,(
    ! [VarCurr] :
      ( v2728(VarCurr)
    <=> ( v2447(VarCurr,bitIndex0)
        & v2447(VarCurr,bitIndex1) ) ) )).

fof(addAssignment_2385,axiom,(
    ! [VarCurr] :
      ( ( v2447(VarCurr,bitIndex8)
      <=> v2655(VarCurr,bitIndex16) )
      & ( v2447(VarCurr,bitIndex7)
      <=> v2655(VarCurr,bitIndex15) )
      & ( v2447(VarCurr,bitIndex6)
      <=> v2655(VarCurr,bitIndex14) )
      & ( v2447(VarCurr,bitIndex5)
      <=> v2655(VarCurr,bitIndex13) )
      & ( v2447(VarCurr,bitIndex4)
      <=> v2655(VarCurr,bitIndex12) )
      & ( v2447(VarCurr,bitIndex3)
      <=> v2655(VarCurr,bitIndex11) )
      & ( v2447(VarCurr,bitIndex2)
      <=> v2655(VarCurr,bitIndex10) )
      & ( v2447(VarCurr,bitIndex1)
      <=> v2655(VarCurr,bitIndex9) )
      & ( v2447(VarCurr,bitIndex0)
      <=> v2655(VarCurr,bitIndex8) ) ) )).

fof(writeBinaryOperatorEqualRangesMultipleBits_96,axiom,(
    ! [VarCurr,B] :
      ( range_16_0(B)
     => ( v2655(VarCurr,B)
      <=> ( v2657(VarCurr,B)
          | v2717(VarCurr,B) ) ) ) )).

fof(writeBinaryOperatorEqualRangesMultipleBits_95,axiom,(
    ! [VarCurr,B] :
      ( range_16_0(B)
     => ( v2717(VarCurr,B)
      <=> ( v2718(VarCurr,B)
          & v2719(VarCurr,B) ) ) ) )).

fof(addAssignment_2384,axiom,(
    ! [VarCurr] :
      ( v2719(VarCurr,bitIndex0)
    <=> v2667(VarCurr,bitIndex3) ) )).

fof(addAssignment_2383,axiom,(
    ! [VarCurr] :
      ( v2719(VarCurr,bitIndex1)
    <=> v2667(VarCurr,bitIndex3) ) )).

fof(addAssignment_2382,axiom,(
    ! [VarCurr] :
      ( v2719(VarCurr,bitIndex2)
    <=> v2667(VarCurr,bitIndex3) ) )).

fof(addAssignment_2381,axiom,(
    ! [VarCurr] :
      ( v2719(VarCurr,bitIndex3)
    <=> v2667(VarCurr,bitIndex3) ) )).

fof(addAssignment_2380,axiom,(
    ! [VarCurr] :
      ( v2719(VarCurr,bitIndex4)
    <=> v2667(VarCurr,bitIndex3) ) )).

fof(addAssignment_2379,axiom,(
    ! [VarCurr] :
      ( v2719(VarCurr,bitIndex5)
    <=> v2667(VarCurr,bitIndex3) ) )).

fof(addAssignment_2378,axiom,(
    ! [VarCurr] :
      ( v2719(VarCurr,bitIndex6)
    <=> v2667(VarCurr,bitIndex3) ) )).

fof(addAssignment_2377,axiom,(
    ! [VarCurr] :
      ( v2719(VarCurr,bitIndex7)
    <=> v2667(VarCurr,bitIndex3) ) )).

fof(addAssignment_2376,axiom,(
    ! [VarCurr] :
      ( v2719(VarCurr,bitIndex8)
    <=> v2667(VarCurr,bitIndex3) ) )).

fof(addAssignment_2375,axiom,(
    ! [VarCurr] :
      ( v2719(VarCurr,bitIndex9)
    <=> v2667(VarCurr,bitIndex3) ) )).

fof(addAssignment_2374,axiom,(
    ! [VarCurr] :
      ( v2719(VarCurr,bitIndex10)
    <=> v2667(VarCurr,bitIndex3) ) )).

fof(addAssignment_2373,axiom,(
    ! [VarCurr] :
      ( v2719(VarCurr,bitIndex11)
    <=> v2667(VarCurr,bitIndex3) ) )).

fof(addAssignment_2372,axiom,(
    ! [VarCurr] :
      ( v2719(VarCurr,bitIndex12)
    <=> v2667(VarCurr,bitIndex3) ) )).

fof(addAssignment_2371,axiom,(
    ! [VarCurr] :
      ( v2719(VarCurr,bitIndex13)
    <=> v2667(VarCurr,bitIndex3) ) )).

fof(addAssignment_2370,axiom,(
    ! [VarCurr] :
      ( v2719(VarCurr,bitIndex14)
    <=> v2667(VarCurr,bitIndex3) ) )).

fof(addAssignment_2369,axiom,(
    ! [VarCurr] :
      ( v2719(VarCurr,bitIndex15)
    <=> v2667(VarCurr,bitIndex3) ) )).

fof(addAssignment_2368,axiom,(
    ! [VarCurr] :
      ( v2719(VarCurr,bitIndex16)
    <=> v2667(VarCurr,bitIndex3) ) )).

fof(addAssignment_2367,axiom,(
    ! [VarCurr,B] :
      ( range_7_0(B)
     => ( v2718(VarCurr,B)
      <=> $false ) ) )).

fof(addAssignment_2366,axiom,(
    ! [VarCurr] :
      ( ( v2718(VarCurr,bitIndex16)
      <=> v2658(VarCurr,bitIndex8) )
      & ( v2718(VarCurr,bitIndex15)
      <=> v2658(VarCurr,bitIndex7) )
      & ( v2718(VarCurr,bitIndex14)
      <=> v2658(VarCurr,bitIndex6) )
      & ( v2718(VarCurr,bitIndex13)
      <=> v2658(VarCurr,bitIndex5) )
      & ( v2718(VarCurr,bitIndex12)
      <=> v2658(VarCurr,bitIndex4) )
      & ( v2718(VarCurr,bitIndex11)
      <=> v2658(VarCurr,bitIndex3) )
      & ( v2718(VarCurr,bitIndex10)
      <=> v2658(VarCurr,bitIndex2) )
      & ( v2718(VarCurr,bitIndex9)
      <=> v2658(VarCurr,bitIndex1) )
      & ( v2718(VarCurr,bitIndex8)
      <=> v2658(VarCurr,bitIndex0) ) ) )).

fof(writeBinaryOperatorEqualRangesMultipleBits_94,axiom,(
    ! [VarCurr,B] :
      ( range_16_0(B)
     => ( v2657(VarCurr,B)
      <=> ( v2658(VarCurr,B)
          & v2715(VarCurr,B) ) ) ) )).

fof(addAssignment_2365,axiom,(
    ! [VarCurr] :
      ( v2715(VarCurr,bitIndex0)
    <=> v2716(VarCurr) ) )).

fof(addAssignment_2364,axiom,(
    ! [VarCurr] :
      ( v2715(VarCurr,bitIndex1)
    <=> v2716(VarCurr) ) )).

fof(addAssignment_2363,axiom,(
    ! [VarCurr] :
      ( v2715(VarCurr,bitIndex2)
    <=> v2716(VarCurr) ) )).

fof(addAssignment_2362,axiom,(
    ! [VarCurr] :
      ( v2715(VarCurr,bitIndex3)
    <=> v2716(VarCurr) ) )).

fof(addAssignment_2361,axiom,(
    ! [VarCurr] :
      ( v2715(VarCurr,bitIndex4)
    <=> v2716(VarCurr) ) )).

fof(addAssignment_2360,axiom,(
    ! [VarCurr] :
      ( v2715(VarCurr,bitIndex5)
    <=> v2716(VarCurr) ) )).

fof(addAssignment_2359,axiom,(
    ! [VarCurr] :
      ( v2715(VarCurr,bitIndex6)
    <=> v2716(VarCurr) ) )).

fof(addAssignment_2358,axiom,(
    ! [VarCurr] :
      ( v2715(VarCurr,bitIndex7)
    <=> v2716(VarCurr) ) )).

fof(addAssignment_2357,axiom,(
    ! [VarCurr] :
      ( v2715(VarCurr,bitIndex8)
    <=> v2716(VarCurr) ) )).

fof(addAssignment_2356,axiom,(
    ! [VarCurr] :
      ( v2715(VarCurr,bitIndex9)
    <=> v2716(VarCurr) ) )).

fof(addAssignment_2355,axiom,(
    ! [VarCurr] :
      ( v2715(VarCurr,bitIndex10)
    <=> v2716(VarCurr) ) )).

fof(addAssignment_2354,axiom,(
    ! [VarCurr] :
      ( v2715(VarCurr,bitIndex11)
    <=> v2716(VarCurr) ) )).

fof(addAssignment_2353,axiom,(
    ! [VarCurr] :
      ( v2715(VarCurr,bitIndex12)
    <=> v2716(VarCurr) ) )).

fof(addAssignment_2352,axiom,(
    ! [VarCurr] :
      ( v2715(VarCurr,bitIndex13)
    <=> v2716(VarCurr) ) )).

fof(addAssignment_2351,axiom,(
    ! [VarCurr] :
      ( v2715(VarCurr,bitIndex14)
    <=> v2716(VarCurr) ) )).

fof(addAssignment_2350,axiom,(
    ! [VarCurr] :
      ( v2715(VarCurr,bitIndex15)
    <=> v2716(VarCurr) ) )).

fof(addAssignment_2349,axiom,(
    ! [VarCurr] :
      ( v2715(VarCurr,bitIndex16)
    <=> v2716(VarCurr) ) )).

fof(writeUnaryOperator_233,axiom,(
    ! [VarCurr] :
      ( ~ v2716(VarCurr)
    <=> v2667(VarCurr,bitIndex3) ) )).

fof(writeBinaryOperatorEqualRangesMultipleBits_93,axiom,(
    ! [VarCurr,B] :
      ( range_16_0(B)
     => ( v2658(VarCurr,B)
      <=> ( v2659(VarCurr,B)
          | v2712(VarCurr,B) ) ) ) )).

fof(writeBinaryOperatorEqualRangesMultipleBits_92,axiom,(
    ! [VarCurr,B] :
      ( range_16_0(B)
     => ( v2712(VarCurr,B)
      <=> ( v2713(VarCurr,B)
          & v2714(VarCurr,B) ) ) ) )).

fof(addAssignment_2348,axiom,(
    ! [VarCurr] :
      ( v2714(VarCurr,bitIndex0)
    <=> v2667(VarCurr,bitIndex2) ) )).

fof(addAssignment_2347,axiom,(
    ! [VarCurr] :
      ( v2714(VarCurr,bitIndex1)
    <=> v2667(VarCurr,bitIndex2) ) )).

fof(addAssignment_2346,axiom,(
    ! [VarCurr] :
      ( v2714(VarCurr,bitIndex2)
    <=> v2667(VarCurr,bitIndex2) ) )).

fof(addAssignment_2345,axiom,(
    ! [VarCurr] :
      ( v2714(VarCurr,bitIndex3)
    <=> v2667(VarCurr,bitIndex2) ) )).

fof(addAssignment_2344,axiom,(
    ! [VarCurr] :
      ( v2714(VarCurr,bitIndex4)
    <=> v2667(VarCurr,bitIndex2) ) )).

fof(addAssignment_2343,axiom,(
    ! [VarCurr] :
      ( v2714(VarCurr,bitIndex5)
    <=> v2667(VarCurr,bitIndex2) ) )).

fof(addAssignment_2342,axiom,(
    ! [VarCurr] :
      ( v2714(VarCurr,bitIndex6)
    <=> v2667(VarCurr,bitIndex2) ) )).

fof(addAssignment_2341,axiom,(
    ! [VarCurr] :
      ( v2714(VarCurr,bitIndex7)
    <=> v2667(VarCurr,bitIndex2) ) )).

fof(addAssignment_2340,axiom,(
    ! [VarCurr] :
      ( v2714(VarCurr,bitIndex8)
    <=> v2667(VarCurr,bitIndex2) ) )).

fof(addAssignment_2339,axiom,(
    ! [VarCurr] :
      ( v2714(VarCurr,bitIndex9)
    <=> v2667(VarCurr,bitIndex2) ) )).

fof(addAssignment_2338,axiom,(
    ! [VarCurr] :
      ( v2714(VarCurr,bitIndex10)
    <=> v2667(VarCurr,bitIndex2) ) )).

fof(addAssignment_2337,axiom,(
    ! [VarCurr] :
      ( v2714(VarCurr,bitIndex11)
    <=> v2667(VarCurr,bitIndex2) ) )).

fof(addAssignment_2336,axiom,(
    ! [VarCurr] :
      ( v2714(VarCurr,bitIndex12)
    <=> v2667(VarCurr,bitIndex2) ) )).

fof(addAssignment_2335,axiom,(
    ! [VarCurr] :
      ( v2714(VarCurr,bitIndex13)
    <=> v2667(VarCurr,bitIndex2) ) )).

fof(addAssignment_2334,axiom,(
    ! [VarCurr] :
      ( v2714(VarCurr,bitIndex14)
    <=> v2667(VarCurr,bitIndex2) ) )).

fof(addAssignment_2333,axiom,(
    ! [VarCurr] :
      ( v2714(VarCurr,bitIndex15)
    <=> v2667(VarCurr,bitIndex2) ) )).

fof(addAssignment_2332,axiom,(
    ! [VarCurr] :
      ( v2714(VarCurr,bitIndex16)
    <=> v2667(VarCurr,bitIndex2) ) )).

fof(addAssignment_2331,axiom,(
    ! [VarCurr,B] :
      ( range_3_0(B)
     => ( v2713(VarCurr,B)
      <=> $false ) ) )).

fof(addAssignment_2330,axiom,(
    ! [VarCurr] :
      ( ( v2713(VarCurr,bitIndex16)
      <=> v2660(VarCurr,bitIndex12) )
      & ( v2713(VarCurr,bitIndex15)
      <=> v2660(VarCurr,bitIndex11) )
      & ( v2713(VarCurr,bitIndex14)
      <=> v2660(VarCurr,bitIndex10) )
      & ( v2713(VarCurr,bitIndex13)
      <=> v2660(VarCurr,bitIndex9) )
      & ( v2713(VarCurr,bitIndex12)
      <=> v2660(VarCurr,bitIndex8) )
      & ( v2713(VarCurr,bitIndex11)
      <=> v2660(VarCurr,bitIndex7) )
      & ( v2713(VarCurr,bitIndex10)
      <=> v2660(VarCurr,bitIndex6) )
      & ( v2713(VarCurr,bitIndex9)
      <=> v2660(VarCurr,bitIndex5) )
      & ( v2713(VarCurr,bitIndex8)
      <=> v2660(VarCurr,bitIndex4) )
      & ( v2713(VarCurr,bitIndex7)
      <=> v2660(VarCurr,bitIndex3) )
      & ( v2713(VarCurr,bitIndex6)
      <=> v2660(VarCurr,bitIndex2) )
      & ( v2713(VarCurr,bitIndex5)
      <=> v2660(VarCurr,bitIndex1) )
      & ( v2713(VarCurr,bitIndex4)
      <=> v2660(VarCurr,bitIndex0) ) ) )).

fof(writeBinaryOperatorEqualRangesMultipleBits_91,axiom,(
    ! [VarCurr,B] :
      ( range_16_0(B)
     => ( v2659(VarCurr,B)
      <=> ( v2660(VarCurr,B)
          & v2710(VarCurr,B) ) ) ) )).

fof(addAssignment_2329,axiom,(
    ! [VarCurr] :
      ( v2710(VarCurr,bitIndex0)
    <=> v2711(VarCurr) ) )).

fof(addAssignment_2328,axiom,(
    ! [VarCurr] :
      ( v2710(VarCurr,bitIndex1)
    <=> v2711(VarCurr) ) )).

fof(addAssignment_2327,axiom,(
    ! [VarCurr] :
      ( v2710(VarCurr,bitIndex2)
    <=> v2711(VarCurr) ) )).

fof(addAssignment_2326,axiom,(
    ! [VarCurr] :
      ( v2710(VarCurr,bitIndex3)
    <=> v2711(VarCurr) ) )).

fof(addAssignment_2325,axiom,(
    ! [VarCurr] :
      ( v2710(VarCurr,bitIndex4)
    <=> v2711(VarCurr) ) )).

fof(addAssignment_2324,axiom,(
    ! [VarCurr] :
      ( v2710(VarCurr,bitIndex5)
    <=> v2711(VarCurr) ) )).

fof(addAssignment_2323,axiom,(
    ! [VarCurr] :
      ( v2710(VarCurr,bitIndex6)
    <=> v2711(VarCurr) ) )).

fof(addAssignment_2322,axiom,(
    ! [VarCurr] :
      ( v2710(VarCurr,bitIndex7)
    <=> v2711(VarCurr) ) )).

fof(addAssignment_2321,axiom,(
    ! [VarCurr] :
      ( v2710(VarCurr,bitIndex8)
    <=> v2711(VarCurr) ) )).

fof(addAssignment_2320,axiom,(
    ! [VarCurr] :
      ( v2710(VarCurr,bitIndex9)
    <=> v2711(VarCurr) ) )).

fof(addAssignment_2319,axiom,(
    ! [VarCurr] :
      ( v2710(VarCurr,bitIndex10)
    <=> v2711(VarCurr) ) )).

fof(addAssignment_2318,axiom,(
    ! [VarCurr] :
      ( v2710(VarCurr,bitIndex11)
    <=> v2711(VarCurr) ) )).

fof(addAssignment_2317,axiom,(
    ! [VarCurr] :
      ( v2710(VarCurr,bitIndex12)
    <=> v2711(VarCurr) ) )).

fof(addAssignment_2316,axiom,(
    ! [VarCurr] :
      ( v2710(VarCurr,bitIndex13)
    <=> v2711(VarCurr) ) )).

fof(addAssignment_2315,axiom,(
    ! [VarCurr] :
      ( v2710(VarCurr,bitIndex14)
    <=> v2711(VarCurr) ) )).

fof(addAssignment_2314,axiom,(
    ! [VarCurr] :
      ( v2710(VarCurr,bitIndex15)
    <=> v2711(VarCurr) ) )).

fof(addAssignment_2313,axiom,(
    ! [VarCurr] :
      ( v2710(VarCurr,bitIndex16)
    <=> v2711(VarCurr) ) )).

fof(writeUnaryOperator_232,axiom,(
    ! [VarCurr] :
      ( ~ v2711(VarCurr)
    <=> v2667(VarCurr,bitIndex2) ) )).

fof(writeBinaryOperatorEqualRangesMultipleBits_90,axiom,(
    ! [VarCurr,B] :
      ( range_16_0(B)
     => ( v2660(VarCurr,B)
      <=> ( v2661(VarCurr,B)
          | v2707(VarCurr,B) ) ) ) )).

fof(writeBinaryOperatorEqualRangesMultipleBits_89,axiom,(
    ! [VarCurr,B] :
      ( range_16_0(B)
     => ( v2707(VarCurr,B)
      <=> ( v2708(VarCurr,B)
          & v2709(VarCurr,B) ) ) ) )).

fof(addAssignment_2312,axiom,(
    ! [VarCurr] :
      ( v2709(VarCurr,bitIndex0)
    <=> v2667(VarCurr,bitIndex1) ) )).

fof(addAssignment_2311,axiom,(
    ! [VarCurr] :
      ( v2709(VarCurr,bitIndex1)
    <=> v2667(VarCurr,bitIndex1) ) )).

fof(addAssignment_2310,axiom,(
    ! [VarCurr] :
      ( v2709(VarCurr,bitIndex2)
    <=> v2667(VarCurr,bitIndex1) ) )).

fof(addAssignment_2309,axiom,(
    ! [VarCurr] :
      ( v2709(VarCurr,bitIndex3)
    <=> v2667(VarCurr,bitIndex1) ) )).

fof(addAssignment_2308,axiom,(
    ! [VarCurr] :
      ( v2709(VarCurr,bitIndex4)
    <=> v2667(VarCurr,bitIndex1) ) )).

fof(addAssignment_2307,axiom,(
    ! [VarCurr] :
      ( v2709(VarCurr,bitIndex5)
    <=> v2667(VarCurr,bitIndex1) ) )).

fof(addAssignment_2306,axiom,(
    ! [VarCurr] :
      ( v2709(VarCurr,bitIndex6)
    <=> v2667(VarCurr,bitIndex1) ) )).

fof(addAssignment_2305,axiom,(
    ! [VarCurr] :
      ( v2709(VarCurr,bitIndex7)
    <=> v2667(VarCurr,bitIndex1) ) )).

fof(addAssignment_2304,axiom,(
    ! [VarCurr] :
      ( v2709(VarCurr,bitIndex8)
    <=> v2667(VarCurr,bitIndex1) ) )).

fof(addAssignment_2303,axiom,(
    ! [VarCurr] :
      ( v2709(VarCurr,bitIndex9)
    <=> v2667(VarCurr,bitIndex1) ) )).

fof(addAssignment_2302,axiom,(
    ! [VarCurr] :
      ( v2709(VarCurr,bitIndex10)
    <=> v2667(VarCurr,bitIndex1) ) )).

fof(addAssignment_2301,axiom,(
    ! [VarCurr] :
      ( v2709(VarCurr,bitIndex11)
    <=> v2667(VarCurr,bitIndex1) ) )).

fof(addAssignment_2300,axiom,(
    ! [VarCurr] :
      ( v2709(VarCurr,bitIndex12)
    <=> v2667(VarCurr,bitIndex1) ) )).

fof(addAssignment_2299,axiom,(
    ! [VarCurr] :
      ( v2709(VarCurr,bitIndex13)
    <=> v2667(VarCurr,bitIndex1) ) )).

fof(addAssignment_2298,axiom,(
    ! [VarCurr] :
      ( v2709(VarCurr,bitIndex14)
    <=> v2667(VarCurr,bitIndex1) ) )).

fof(addAssignment_2297,axiom,(
    ! [VarCurr] :
      ( v2709(VarCurr,bitIndex15)
    <=> v2667(VarCurr,bitIndex1) ) )).

fof(addAssignment_2296,axiom,(
    ! [VarCurr] :
      ( v2709(VarCurr,bitIndex16)
    <=> v2667(VarCurr,bitIndex1) ) )).

fof(addAssignment_2295,axiom,(
    ! [VarCurr,B] :
      ( range_1_0(B)
     => ( v2708(VarCurr,B)
      <=> $false ) ) )).

fof(addAssignment_2294,axiom,(
    ! [VarCurr] :
      ( ( v2708(VarCurr,bitIndex16)
      <=> v2662(VarCurr,bitIndex14) )
      & ( v2708(VarCurr,bitIndex15)
      <=> v2662(VarCurr,bitIndex13) )
      & ( v2708(VarCurr,bitIndex14)
      <=> v2662(VarCurr,bitIndex12) )
      & ( v2708(VarCurr,bitIndex13)
      <=> v2662(VarCurr,bitIndex11) )
      & ( v2708(VarCurr,bitIndex12)
      <=> v2662(VarCurr,bitIndex10) )
      & ( v2708(VarCurr,bitIndex11)
      <=> v2662(VarCurr,bitIndex9) )
      & ( v2708(VarCurr,bitIndex10)
      <=> v2662(VarCurr,bitIndex8) )
      & ( v2708(VarCurr,bitIndex9)
      <=> v2662(VarCurr,bitIndex7) )
      & ( v2708(VarCurr,bitIndex8)
      <=> v2662(VarCurr,bitIndex6) )
      & ( v2708(VarCurr,bitIndex7)
      <=> v2662(VarCurr,bitIndex5) )
      & ( v2708(VarCurr,bitIndex6)
      <=> v2662(VarCurr,bitIndex4) )
      & ( v2708(VarCurr,bitIndex5)
      <=> v2662(VarCurr,bitIndex3) )
      & ( v2708(VarCurr,bitIndex4)
      <=> v2662(VarCurr,bitIndex2) )
      & ( v2708(VarCurr,bitIndex3)
      <=> v2662(VarCurr,bitIndex1) )
      & ( v2708(VarCurr,bitIndex2)
      <=> v2662(VarCurr,bitIndex0) ) ) )).

fof(writeBinaryOperatorEqualRangesMultipleBits_88,axiom,(
    ! [VarCurr,B] :
      ( range_16_0(B)
     => ( v2661(VarCurr,B)
      <=> ( v2662(VarCurr,B)
          & v2705(VarCurr,B) ) ) ) )).

fof(addAssignment_2293,axiom,(
    ! [VarCurr] :
      ( v2705(VarCurr,bitIndex0)
    <=> v2706(VarCurr) ) )).

fof(addAssignment_2292,axiom,(
    ! [VarCurr] :
      ( v2705(VarCurr,bitIndex1)
    <=> v2706(VarCurr) ) )).

fof(addAssignment_2291,axiom,(
    ! [VarCurr] :
      ( v2705(VarCurr,bitIndex2)
    <=> v2706(VarCurr) ) )).

fof(addAssignment_2290,axiom,(
    ! [VarCurr] :
      ( v2705(VarCurr,bitIndex3)
    <=> v2706(VarCurr) ) )).

fof(addAssignment_2289,axiom,(
    ! [VarCurr] :
      ( v2705(VarCurr,bitIndex4)
    <=> v2706(VarCurr) ) )).

fof(addAssignment_2288,axiom,(
    ! [VarCurr] :
      ( v2705(VarCurr,bitIndex5)
    <=> v2706(VarCurr) ) )).

fof(addAssignment_2287,axiom,(
    ! [VarCurr] :
      ( v2705(VarCurr,bitIndex6)
    <=> v2706(VarCurr) ) )).

fof(addAssignment_2286,axiom,(
    ! [VarCurr] :
      ( v2705(VarCurr,bitIndex7)
    <=> v2706(VarCurr) ) )).

fof(addAssignment_2285,axiom,(
    ! [VarCurr] :
      ( v2705(VarCurr,bitIndex8)
    <=> v2706(VarCurr) ) )).

fof(addAssignment_2284,axiom,(
    ! [VarCurr] :
      ( v2705(VarCurr,bitIndex9)
    <=> v2706(VarCurr) ) )).

fof(addAssignment_2283,axiom,(
    ! [VarCurr] :
      ( v2705(VarCurr,bitIndex10)
    <=> v2706(VarCurr) ) )).

fof(addAssignment_2282,axiom,(
    ! [VarCurr] :
      ( v2705(VarCurr,bitIndex11)
    <=> v2706(VarCurr) ) )).

fof(addAssignment_2281,axiom,(
    ! [VarCurr] :
      ( v2705(VarCurr,bitIndex12)
    <=> v2706(VarCurr) ) )).

fof(addAssignment_2280,axiom,(
    ! [VarCurr] :
      ( v2705(VarCurr,bitIndex13)
    <=> v2706(VarCurr) ) )).

fof(addAssignment_2279,axiom,(
    ! [VarCurr] :
      ( v2705(VarCurr,bitIndex14)
    <=> v2706(VarCurr) ) )).

fof(addAssignment_2278,axiom,(
    ! [VarCurr] :
      ( v2705(VarCurr,bitIndex15)
    <=> v2706(VarCurr) ) )).

fof(addAssignment_2277,axiom,(
    ! [VarCurr] :
      ( v2705(VarCurr,bitIndex16)
    <=> v2706(VarCurr) ) )).

fof(writeUnaryOperator_231,axiom,(
    ! [VarCurr] :
      ( ~ v2706(VarCurr)
    <=> v2667(VarCurr,bitIndex1) ) )).

fof(writeBinaryOperatorEqualRangesMultipleBits_87,axiom,(
    ! [VarCurr,B] :
      ( range_16_0(B)
     => ( v2662(VarCurr,B)
      <=> ( v2663(VarCurr,B)
          | v2702(VarCurr,B) ) ) ) )).

fof(writeBinaryOperatorEqualRangesMultipleBits_86,axiom,(
    ! [VarCurr,B] :
      ( range_16_0(B)
     => ( v2702(VarCurr,B)
      <=> ( v2703(VarCurr,B)
          & v2704(VarCurr,B) ) ) ) )).

fof(addAssignment_2276,axiom,(
    ! [VarCurr] :
      ( v2704(VarCurr,bitIndex0)
    <=> v2667(VarCurr,bitIndex0) ) )).

fof(addAssignment_2275,axiom,(
    ! [VarCurr] :
      ( v2704(VarCurr,bitIndex1)
    <=> v2667(VarCurr,bitIndex0) ) )).

fof(addAssignment_2274,axiom,(
    ! [VarCurr] :
      ( v2704(VarCurr,bitIndex2)
    <=> v2667(VarCurr,bitIndex0) ) )).

fof(addAssignment_2273,axiom,(
    ! [VarCurr] :
      ( v2704(VarCurr,bitIndex3)
    <=> v2667(VarCurr,bitIndex0) ) )).

fof(addAssignment_2272,axiom,(
    ! [VarCurr] :
      ( v2704(VarCurr,bitIndex4)
    <=> v2667(VarCurr,bitIndex0) ) )).

fof(addAssignment_2271,axiom,(
    ! [VarCurr] :
      ( v2704(VarCurr,bitIndex5)
    <=> v2667(VarCurr,bitIndex0) ) )).

fof(addAssignment_2270,axiom,(
    ! [VarCurr] :
      ( v2704(VarCurr,bitIndex6)
    <=> v2667(VarCurr,bitIndex0) ) )).

fof(addAssignment_2269,axiom,(
    ! [VarCurr] :
      ( v2704(VarCurr,bitIndex7)
    <=> v2667(VarCurr,bitIndex0) ) )).

fof(addAssignment_2268,axiom,(
    ! [VarCurr] :
      ( v2704(VarCurr,bitIndex8)
    <=> v2667(VarCurr,bitIndex0) ) )).

fof(addAssignment_2267,axiom,(
    ! [VarCurr] :
      ( v2704(VarCurr,bitIndex9)
    <=> v2667(VarCurr,bitIndex0) ) )).

fof(addAssignment_2266,axiom,(
    ! [VarCurr] :
      ( v2704(VarCurr,bitIndex10)
    <=> v2667(VarCurr,bitIndex0) ) )).

fof(addAssignment_2265,axiom,(
    ! [VarCurr] :
      ( v2704(VarCurr,bitIndex11)
    <=> v2667(VarCurr,bitIndex0) ) )).

fof(addAssignment_2264,axiom,(
    ! [VarCurr] :
      ( v2704(VarCurr,bitIndex12)
    <=> v2667(VarCurr,bitIndex0) ) )).

fof(addAssignment_2263,axiom,(
    ! [VarCurr] :
      ( v2704(VarCurr,bitIndex13)
    <=> v2667(VarCurr,bitIndex0) ) )).

fof(addAssignment_2262,axiom,(
    ! [VarCurr] :
      ( v2704(VarCurr,bitIndex14)
    <=> v2667(VarCurr,bitIndex0) ) )).

fof(addAssignment_2261,axiom,(
    ! [VarCurr] :
      ( v2704(VarCurr,bitIndex15)
    <=> v2667(VarCurr,bitIndex0) ) )).

fof(addAssignment_2260,axiom,(
    ! [VarCurr] :
      ( v2704(VarCurr,bitIndex16)
    <=> v2667(VarCurr,bitIndex0) ) )).

fof(addAssignment_2259,axiom,(
    ! [VarCurr] :
      ( v2703(VarCurr,bitIndex0)
    <=> $false ) )).

fof(addAssignment_2258,axiom,(
    ! [VarCurr] :
      ( ( v2703(VarCurr,bitIndex16)
      <=> v2664(VarCurr,bitIndex15) )
      & ( v2703(VarCurr,bitIndex15)
      <=> v2664(VarCurr,bitIndex14) )
      & ( v2703(VarCurr,bitIndex14)
      <=> v2664(VarCurr,bitIndex13) )
      & ( v2703(VarCurr,bitIndex13)
      <=> v2664(VarCurr,bitIndex12) )
      & ( v2703(VarCurr,bitIndex12)
      <=> v2664(VarCurr,bitIndex11) )
      & ( v2703(VarCurr,bitIndex11)
      <=> v2664(VarCurr,bitIndex10) )
      & ( v2703(VarCurr,bitIndex10)
      <=> v2664(VarCurr,bitIndex9) )
      & ( v2703(VarCurr,bitIndex9)
      <=> v2664(VarCurr,bitIndex8) )
      & ( v2703(VarCurr,bitIndex8)
      <=> v2664(VarCurr,bitIndex7) )
      & ( v2703(VarCurr,bitIndex7)
      <=> v2664(VarCurr,bitIndex6) )
      & ( v2703(VarCurr,bitIndex6)
      <=> v2664(VarCurr,bitIndex5) )
      & ( v2703(VarCurr,bitIndex5)
      <=> v2664(VarCurr,bitIndex4) )
      & ( v2703(VarCurr,bitIndex4)
      <=> v2664(VarCurr,bitIndex3) )
      & ( v2703(VarCurr,bitIndex3)
      <=> v2664(VarCurr,bitIndex2) )
      & ( v2703(VarCurr,bitIndex2)
      <=> v2664(VarCurr,bitIndex1) )
      & ( v2703(VarCurr,bitIndex1)
      <=> v2664(VarCurr,bitIndex0) ) ) )).

fof(writeBinaryOperatorEqualRangesMultipleBits_85,axiom,(
    ! [VarCurr,B] :
      ( range_16_0(B)
     => ( v2663(VarCurr,B)
      <=> ( v2664(VarCurr,B)
          & v2665(VarCurr,B) ) ) ) )).

fof(range_axiom_30,axiom,(
    ! [B] :
      ( range_16_0(B)
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
        | bitIndex16 = B ) ) )).

fof(addAssignment_2257,axiom,(
    ! [VarCurr] :
      ( v2665(VarCurr,bitIndex0)
    <=> v2666(VarCurr) ) )).

fof(addAssignment_2256,axiom,(
    ! [VarCurr] :
      ( v2665(VarCurr,bitIndex1)
    <=> v2666(VarCurr) ) )).

fof(addAssignment_2255,axiom,(
    ! [VarCurr] :
      ( v2665(VarCurr,bitIndex2)
    <=> v2666(VarCurr) ) )).

fof(addAssignment_2254,axiom,(
    ! [VarCurr] :
      ( v2665(VarCurr,bitIndex3)
    <=> v2666(VarCurr) ) )).

fof(addAssignment_2253,axiom,(
    ! [VarCurr] :
      ( v2665(VarCurr,bitIndex4)
    <=> v2666(VarCurr) ) )).

fof(addAssignment_2252,axiom,(
    ! [VarCurr] :
      ( v2665(VarCurr,bitIndex5)
    <=> v2666(VarCurr) ) )).

fof(addAssignment_2251,axiom,(
    ! [VarCurr] :
      ( v2665(VarCurr,bitIndex6)
    <=> v2666(VarCurr) ) )).

fof(addAssignment_2250,axiom,(
    ! [VarCurr] :
      ( v2665(VarCurr,bitIndex7)
    <=> v2666(VarCurr) ) )).

fof(addAssignment_2249,axiom,(
    ! [VarCurr] :
      ( v2665(VarCurr,bitIndex8)
    <=> v2666(VarCurr) ) )).

fof(addAssignment_2248,axiom,(
    ! [VarCurr] :
      ( v2665(VarCurr,bitIndex9)
    <=> v2666(VarCurr) ) )).

fof(addAssignment_2247,axiom,(
    ! [VarCurr] :
      ( v2665(VarCurr,bitIndex10)
    <=> v2666(VarCurr) ) )).

fof(addAssignment_2246,axiom,(
    ! [VarCurr] :
      ( v2665(VarCurr,bitIndex11)
    <=> v2666(VarCurr) ) )).

fof(addAssignment_2245,axiom,(
    ! [VarCurr] :
      ( v2665(VarCurr,bitIndex12)
    <=> v2666(VarCurr) ) )).

fof(addAssignment_2244,axiom,(
    ! [VarCurr] :
      ( v2665(VarCurr,bitIndex13)
    <=> v2666(VarCurr) ) )).

fof(addAssignment_2243,axiom,(
    ! [VarCurr] :
      ( v2665(VarCurr,bitIndex14)
    <=> v2666(VarCurr) ) )).

fof(addAssignment_2242,axiom,(
    ! [VarCurr] :
      ( v2665(VarCurr,bitIndex15)
    <=> v2666(VarCurr) ) )).

fof(addAssignment_2241,axiom,(
    ! [VarCurr] :
      ( v2665(VarCurr,bitIndex16)
    <=> v2666(VarCurr) ) )).

fof(writeUnaryOperator_230,axiom,(
    ! [VarCurr] :
      ( ~ v2666(VarCurr)
    <=> v2667(VarCurr,bitIndex0) ) )).

fof(addAssignment_2240,axiom,(
    ! [VarCurr] :
      ( v2667(VarCurr,bitIndex0)
    <=> v2676(VarCurr) ) )).

fof(addAssignment_2239,axiom,(
    ! [VarCurr] :
      ( v2667(VarCurr,bitIndex1)
    <=> v2698(VarCurr) ) )).

fof(addAssignment_2238,axiom,(
    ! [VarCurr] :
      ( v2667(VarCurr,bitIndex2)
    <=> v2693(VarCurr) ) )).

fof(addAssignment_2237,axiom,(
    ! [VarCurr] :
      ( v2667(VarCurr,bitIndex3)
    <=> v2669(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_481,axiom,(
    ! [VarCurr] :
      ( v2698(VarCurr)
    <=> ( v2699(VarCurr)
        & v2701(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_480,axiom,(
    ! [VarCurr] :
      ( v2701(VarCurr)
    <=> ( v2652(VarCurr,bitIndex0)
        | v2688(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_479,axiom,(
    ! [VarCurr] :
      ( v2699(VarCurr)
    <=> ( v2676(VarCurr)
        | v2700(VarCurr) ) ) )).

fof(writeUnaryOperator_229,axiom,(
    ! [VarCurr] :
      ( ~ v2700(VarCurr)
    <=> v2688(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_478,axiom,(
    ! [VarCurr] :
      ( v2693(VarCurr)
    <=> ( v2694(VarCurr)
        & v2697(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_477,axiom,(
    ! [VarCurr] :
      ( v2697(VarCurr)
    <=> ( v2683(VarCurr)
        | v2687(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_476,axiom,(
    ! [VarCurr] :
      ( v2694(VarCurr)
    <=> ( v2695(VarCurr)
        | v2696(VarCurr) ) ) )).

fof(writeUnaryOperator_228,axiom,(
    ! [VarCurr] :
      ( ~ v2696(VarCurr)
    <=> v2687(VarCurr) ) )).

fof(writeUnaryOperator_227,axiom,(
    ! [VarCurr] :
      ( ~ v2695(VarCurr)
    <=> v2683(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_475,axiom,(
    ! [VarCurr] :
      ( v2669(VarCurr)
    <=> ( v2670(VarCurr)
        & v2691(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_474,axiom,(
    ! [VarCurr] :
      ( v2691(VarCurr)
    <=> ( v2692(VarCurr)
        | v2682(VarCurr) ) ) )).

fof(writeUnaryOperator_226,axiom,(
    ! [VarCurr] :
      ( ~ v2692(VarCurr)
    <=> v2671(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_473,axiom,(
    ! [VarCurr] :
      ( v2670(VarCurr)
    <=> ( v2671(VarCurr)
        | v2681(VarCurr) ) ) )).

fof(writeUnaryOperator_225,axiom,(
    ! [VarCurr] :
      ( ~ v2681(VarCurr)
    <=> v2682(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_472,axiom,(
    ! [VarCurr] :
      ( v2682(VarCurr)
    <=> ( v2683(VarCurr)
        & v2687(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_471,axiom,(
    ! [VarCurr] :
      ( v2687(VarCurr)
    <=> ( v2652(VarCurr,bitIndex0)
        & v2688(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_470,axiom,(
    ! [VarCurr] :
      ( v2688(VarCurr)
    <=> ( v2689(VarCurr)
        & v2690(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_469,axiom,(
    ! [VarCurr] :
      ( v2690(VarCurr)
    <=> ( v2676(VarCurr)
        | v2677(VarCurr) ) ) )).

fof(writeBinaryOperatorShiftedRanges_469,axiom,(
    ! [VarCurr] :
      ( v2689(VarCurr)
    <=> ( v2652(VarCurr,bitIndex0)
        | v2652(VarCurr,bitIndex1) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_468,axiom,(
    ! [VarCurr] :
      ( v2683(VarCurr)
    <=> ( v2684(VarCurr)
        & v2686(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_467,axiom,(
    ! [VarCurr] :
      ( v2686(VarCurr)
    <=> ( v2675(VarCurr)
        | v2678(VarCurr) ) ) )).

fof(writeBinaryOperatorShiftedRanges_468,axiom,(
    ! [VarCurr] :
      ( v2684(VarCurr)
    <=> ( v2685(VarCurr)
        | v2652(VarCurr,bitIndex2) ) ) )).

fof(writeUnaryOperator_224,axiom,(
    ! [VarCurr] :
      ( ~ v2685(VarCurr)
    <=> v2675(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_466,axiom,(
    ! [VarCurr] :
      ( v2671(VarCurr)
    <=> ( v2672(VarCurr)
        & v2679(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_465,axiom,(
    ! [VarCurr] :
      ( v2679(VarCurr)
    <=> ( v2674(VarCurr)
        | v2680(VarCurr) ) ) )).

fof(writeUnaryOperator_223,axiom,(
    ! [VarCurr] :
      ( ~ v2680(VarCurr)
    <=> v2652(VarCurr,bitIndex3) ) )).

fof(writeBinaryOperatorShiftedRanges_467,axiom,(
    ! [VarCurr] :
      ( v2672(VarCurr)
    <=> ( v2673(VarCurr)
        | v2652(VarCurr,bitIndex3) ) ) )).

fof(writeUnaryOperator_222,axiom,(
    ! [VarCurr] :
      ( ~ v2673(VarCurr)
    <=> v2674(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_464,axiom,(
    ! [VarCurr] :
      ( v2674(VarCurr)
    <=> ( v2675(VarCurr)
        & v2678(VarCurr) ) ) )).

fof(writeUnaryOperator_221,axiom,(
    ! [VarCurr] :
      ( ~ v2678(VarCurr)
    <=> v2652(VarCurr,bitIndex2) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_463,axiom,(
    ! [VarCurr] :
      ( v2675(VarCurr)
    <=> ( v2676(VarCurr)
        & v2677(VarCurr) ) ) )).

fof(writeUnaryOperator_220,axiom,(
    ! [VarCurr] :
      ( ~ v2677(VarCurr)
    <=> v2652(VarCurr,bitIndex1) ) )).

fof(writeUnaryOperator_219,axiom,(
    ! [VarCurr] :
      ( ~ v2676(VarCurr)
    <=> v2652(VarCurr,bitIndex0) ) )).

fof(addAssignment_2236,axiom,(
    ! [VarCurr,B] :
      ( range_7_0(B)
     => ( v2664(VarCurr,B)
      <=> $true ) ) )).

fof(range_axiom_29,axiom,(
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

fof(bitBlastConstant_547,axiom,(
    b11111111(bitIndex7) )).

fof(bitBlastConstant_546,axiom,(
    b11111111(bitIndex6) )).

fof(bitBlastConstant_545,axiom,(
    b11111111(bitIndex5) )).

fof(bitBlastConstant_544,axiom,(
    b11111111(bitIndex4) )).

fof(bitBlastConstant_543,axiom,(
    b11111111(bitIndex3) )).

fof(bitBlastConstant_542,axiom,(
    b11111111(bitIndex2) )).

fof(bitBlastConstant_541,axiom,(
    b11111111(bitIndex1) )).

fof(bitBlastConstant_540,axiom,(
    b11111111(bitIndex0) )).

fof(addAssignment_2235,axiom,(
    ! [VarCurr] :
      ( ( v2664(VarCurr,bitIndex16)
      <=> v2449(VarCurr,bitIndex8) )
      & ( v2664(VarCurr,bitIndex15)
      <=> v2449(VarCurr,bitIndex7) )
      & ( v2664(VarCurr,bitIndex14)
      <=> v2449(VarCurr,bitIndex6) )
      & ( v2664(VarCurr,bitIndex13)
      <=> v2449(VarCurr,bitIndex5) )
      & ( v2664(VarCurr,bitIndex12)
      <=> v2449(VarCurr,bitIndex4) )
      & ( v2664(VarCurr,bitIndex11)
      <=> v2449(VarCurr,bitIndex3) )
      & ( v2664(VarCurr,bitIndex10)
      <=> v2449(VarCurr,bitIndex2) )
      & ( v2664(VarCurr,bitIndex9)
      <=> v2449(VarCurr,bitIndex1) )
      & ( v2664(VarCurr,bitIndex8)
      <=> v2449(VarCurr,bitIndex0) ) ) )).

fof(addAssignment_2234,axiom,(
    ! [VarCurr,B] :
      ( range_3_0(B)
     => ( v2652(VarCurr,B)
      <=> v2654(VarCurr,B) ) ) )).

fof(addAssignment_2233,axiom,(
    ! [VarCurr] :
      ( ( v2654(VarCurr,bitIndex3)
      <=> v149(VarCurr,bitIndex8) )
      & ( v2654(VarCurr,bitIndex2)
      <=> v149(VarCurr,bitIndex7) )
      & ( v2654(VarCurr,bitIndex1)
      <=> v149(VarCurr,bitIndex6) )
      & ( v2654(VarCurr,bitIndex0)
      <=> v149(VarCurr,bitIndex5) ) ) )).

fof(addAssignment_2232,axiom,(
    ! [VarCurr,B] :
      ( range_8_5(B)
     => ( v149(VarCurr,B)
      <=> v151(VarCurr,B) ) ) )).

fof(addAssignment_2231,axiom,(
    ! [VarCurr,B] :
      ( range_8_5(B)
     => ( v151(VarCurr,B)
      <=> v156(VarCurr,B) ) ) )).

fof(range_axiom_28,axiom,(
    ! [B] :
      ( range_8_5(B)
    <=> ( $false
        | bitIndex5 = B
        | bitIndex6 = B
        | bitIndex7 = B
        | bitIndex8 = B ) ) )).

fof(addAssignment_2230,axiom,(
    ! [VarCurr] :
      ( v2449(VarCurr,bitIndex8)
    <=> v2454(VarCurr,bitIndex8) ) )).

fof(addAssignment_2229,axiom,(
    ! [VarCurr] :
      ( v2449(VarCurr,bitIndex7)
    <=> v2454(VarCurr,bitIndex7) ) )).

fof(addAssignment_2228,axiom,(
    ! [VarCurr] :
      ( v2449(VarCurr,bitIndex6)
    <=> v2454(VarCurr,bitIndex6) ) )).

fof(addAssignment_2227,axiom,(
    ! [VarCurr] :
      ( v2449(VarCurr,bitIndex5)
    <=> v2454(VarCurr,bitIndex5) ) )).

fof(addAssignment_2226,axiom,(
    ! [VarCurr] :
      ( v2449(VarCurr,bitIndex4)
    <=> v2454(VarCurr,bitIndex4) ) )).

fof(addAssignment_2225,axiom,(
    ! [VarCurr] :
      ( v2449(VarCurr,bitIndex3)
    <=> v2454(VarCurr,bitIndex3) ) )).

fof(addAssignment_2224,axiom,(
    ! [VarCurr] :
      ( v2449(VarCurr,bitIndex2)
    <=> v2454(VarCurr,bitIndex2) ) )).

fof(addAssignment_2223,axiom,(
    ! [VarCurr] :
      ( v2449(VarCurr,bitIndex1)
    <=> v2454(VarCurr,bitIndex1) ) )).

fof(addAssignment_2222,axiom,(
    ! [VarCurr] :
      ( v2449(VarCurr,bitIndex0)
    <=> v2454(VarCurr,bitIndex0) ) )).

fof(writeBinaryOperatorEqualRangesMultipleBits_84,axiom,(
    ! [VarCurr,B] :
      ( range_39_0(B)
     => ( v2454(VarCurr,B)
      <=> ( v2456(VarCurr,B)
          | v2556(VarCurr,B) ) ) ) )).

fof(writeBinaryOperatorEqualRangesMultipleBits_83,axiom,(
    ! [VarCurr,B] :
      ( range_39_0(B)
     => ( v2556(VarCurr,B)
      <=> ( v2557(VarCurr,B)
          & v2649(VarCurr,B) ) ) ) )).

fof(addAssignment_2221,axiom,(
    ! [VarCurr] :
      ( v2649(VarCurr,bitIndex0)
    <=> v2453(VarCurr,bitIndex4) ) )).

fof(addAssignment_2220,axiom,(
    ! [VarCurr] :
      ( v2649(VarCurr,bitIndex1)
    <=> v2453(VarCurr,bitIndex4) ) )).

fof(addAssignment_2219,axiom,(
    ! [VarCurr] :
      ( v2649(VarCurr,bitIndex2)
    <=> v2453(VarCurr,bitIndex4) ) )).

fof(addAssignment_2218,axiom,(
    ! [VarCurr] :
      ( v2649(VarCurr,bitIndex3)
    <=> v2453(VarCurr,bitIndex4) ) )).

fof(addAssignment_2217,axiom,(
    ! [VarCurr] :
      ( v2649(VarCurr,bitIndex4)
    <=> v2453(VarCurr,bitIndex4) ) )).

fof(addAssignment_2216,axiom,(
    ! [VarCurr] :
      ( v2649(VarCurr,bitIndex5)
    <=> v2453(VarCurr,bitIndex4) ) )).

fof(addAssignment_2215,axiom,(
    ! [VarCurr] :
      ( v2649(VarCurr,bitIndex6)
    <=> v2453(VarCurr,bitIndex4) ) )).

fof(addAssignment_2214,axiom,(
    ! [VarCurr] :
      ( v2649(VarCurr,bitIndex7)
    <=> v2453(VarCurr,bitIndex4) ) )).

fof(addAssignment_2213,axiom,(
    ! [VarCurr] :
      ( v2649(VarCurr,bitIndex8)
    <=> v2453(VarCurr,bitIndex4) ) )).

fof(addAssignment_2212,axiom,(
    ! [VarCurr] :
      ( v2649(VarCurr,bitIndex9)
    <=> v2453(VarCurr,bitIndex4) ) )).

fof(addAssignment_2211,axiom,(
    ! [VarCurr] :
      ( v2649(VarCurr,bitIndex10)
    <=> v2453(VarCurr,bitIndex4) ) )).

fof(addAssignment_2210,axiom,(
    ! [VarCurr] :
      ( v2649(VarCurr,bitIndex11)
    <=> v2453(VarCurr,bitIndex4) ) )).

fof(addAssignment_2209,axiom,(
    ! [VarCurr] :
      ( v2649(VarCurr,bitIndex12)
    <=> v2453(VarCurr,bitIndex4) ) )).

fof(addAssignment_2208,axiom,(
    ! [VarCurr] :
      ( v2649(VarCurr,bitIndex13)
    <=> v2453(VarCurr,bitIndex4) ) )).

fof(addAssignment_2207,axiom,(
    ! [VarCurr] :
      ( v2649(VarCurr,bitIndex14)
    <=> v2453(VarCurr,bitIndex4) ) )).

fof(addAssignment_2206,axiom,(
    ! [VarCurr] :
      ( v2649(VarCurr,bitIndex15)
    <=> v2453(VarCurr,bitIndex4) ) )).

fof(addAssignment_2205,axiom,(
    ! [VarCurr] :
      ( v2649(VarCurr,bitIndex16)
    <=> v2453(VarCurr,bitIndex4) ) )).

fof(addAssignment_2204,axiom,(
    ! [VarCurr] :
      ( v2649(VarCurr,bitIndex17)
    <=> v2453(VarCurr,bitIndex4) ) )).

fof(addAssignment_2203,axiom,(
    ! [VarCurr] :
      ( v2649(VarCurr,bitIndex18)
    <=> v2453(VarCurr,bitIndex4) ) )).

fof(addAssignment_2202,axiom,(
    ! [VarCurr] :
      ( v2649(VarCurr,bitIndex19)
    <=> v2453(VarCurr,bitIndex4) ) )).

fof(addAssignment_2201,axiom,(
    ! [VarCurr] :
      ( v2649(VarCurr,bitIndex20)
    <=> v2453(VarCurr,bitIndex4) ) )).

fof(addAssignment_2200,axiom,(
    ! [VarCurr] :
      ( v2649(VarCurr,bitIndex21)
    <=> v2453(VarCurr,bitIndex4) ) )).

fof(addAssignment_2199,axiom,(
    ! [VarCurr] :
      ( v2649(VarCurr,bitIndex22)
    <=> v2453(VarCurr,bitIndex4) ) )).

fof(addAssignment_2198,axiom,(
    ! [VarCurr] :
      ( v2649(VarCurr,bitIndex23)
    <=> v2453(VarCurr,bitIndex4) ) )).

fof(addAssignment_2197,axiom,(
    ! [VarCurr] :
      ( v2649(VarCurr,bitIndex24)
    <=> v2453(VarCurr,bitIndex4) ) )).

fof(addAssignment_2196,axiom,(
    ! [VarCurr] :
      ( v2649(VarCurr,bitIndex25)
    <=> v2453(VarCurr,bitIndex4) ) )).

fof(addAssignment_2195,axiom,(
    ! [VarCurr] :
      ( v2649(VarCurr,bitIndex26)
    <=> v2453(VarCurr,bitIndex4) ) )).

fof(addAssignment_2194,axiom,(
    ! [VarCurr] :
      ( v2649(VarCurr,bitIndex27)
    <=> v2453(VarCurr,bitIndex4) ) )).

fof(addAssignment_2193,axiom,(
    ! [VarCurr] :
      ( v2649(VarCurr,bitIndex28)
    <=> v2453(VarCurr,bitIndex4) ) )).

fof(addAssignment_2192,axiom,(
    ! [VarCurr] :
      ( v2649(VarCurr,bitIndex29)
    <=> v2453(VarCurr,bitIndex4) ) )).

fof(addAssignment_2191,axiom,(
    ! [VarCurr] :
      ( v2649(VarCurr,bitIndex30)
    <=> v2453(VarCurr,bitIndex4) ) )).

fof(addAssignment_2190,axiom,(
    ! [VarCurr] :
      ( v2649(VarCurr,bitIndex31)
    <=> v2453(VarCurr,bitIndex4) ) )).

fof(addAssignment_2189,axiom,(
    ! [VarCurr] :
      ( v2649(VarCurr,bitIndex32)
    <=> v2453(VarCurr,bitIndex4) ) )).

fof(addAssignment_2188,axiom,(
    ! [VarCurr] :
      ( v2649(VarCurr,bitIndex33)
    <=> v2453(VarCurr,bitIndex4) ) )).

fof(addAssignment_2187,axiom,(
    ! [VarCurr] :
      ( v2649(VarCurr,bitIndex34)
    <=> v2453(VarCurr,bitIndex4) ) )).

fof(addAssignment_2186,axiom,(
    ! [VarCurr] :
      ( v2649(VarCurr,bitIndex35)
    <=> v2453(VarCurr,bitIndex4) ) )).

fof(addAssignment_2185,axiom,(
    ! [VarCurr] :
      ( v2649(VarCurr,bitIndex36)
    <=> v2453(VarCurr,bitIndex4) ) )).

fof(addAssignment_2184,axiom,(
    ! [VarCurr] :
      ( v2649(VarCurr,bitIndex37)
    <=> v2453(VarCurr,bitIndex4) ) )).

fof(addAssignment_2183,axiom,(
    ! [VarCurr] :
      ( v2649(VarCurr,bitIndex38)
    <=> v2453(VarCurr,bitIndex4) ) )).

fof(addAssignment_2182,axiom,(
    ! [VarCurr] :
      ( v2649(VarCurr,bitIndex39)
    <=> v2453(VarCurr,bitIndex4) ) )).

fof(addAssignment_2181,axiom,(
    ! [VarCurr,B] :
      ( range_23_0(B)
     => ( v2557(VarCurr,B)
      <=> v2559(VarCurr,B) ) ) )).

fof(addAssignment_2180,axiom,(
    ! [VarCurr] :
      ( ( v2557(VarCurr,bitIndex39)
      <=> $false )
      & ( v2557(VarCurr,bitIndex38)
      <=> $false )
      & ( v2557(VarCurr,bitIndex37)
      <=> $false )
      & ( v2557(VarCurr,bitIndex36)
      <=> $false )
      & ( v2557(VarCurr,bitIndex35)
      <=> $false )
      & ( v2557(VarCurr,bitIndex34)
      <=> $false )
      & ( v2557(VarCurr,bitIndex33)
      <=> $false )
      & ( v2557(VarCurr,bitIndex32)
      <=> $false )
      & ( v2557(VarCurr,bitIndex31)
      <=> $false )
      & ( v2557(VarCurr,bitIndex30)
      <=> $false )
      & ( v2557(VarCurr,bitIndex29)
      <=> $false )
      & ( v2557(VarCurr,bitIndex28)
      <=> $false )
      & ( v2557(VarCurr,bitIndex27)
      <=> $false )
      & ( v2557(VarCurr,bitIndex26)
      <=> $false )
      & ( v2557(VarCurr,bitIndex25)
      <=> $false )
      & ( v2557(VarCurr,bitIndex24)
      <=> $false ) ) )).

fof(bitBlastConstant_539,axiom,(
    ~ b0000000000000000(bitIndex15) )).

fof(bitBlastConstant_538,axiom,(
    ~ b0000000000000000(bitIndex14) )).

fof(bitBlastConstant_537,axiom,(
    ~ b0000000000000000(bitIndex13) )).

fof(bitBlastConstant_536,axiom,(
    ~ b0000000000000000(bitIndex12) )).

fof(bitBlastConstant_535,axiom,(
    ~ b0000000000000000(bitIndex11) )).

fof(bitBlastConstant_534,axiom,(
    ~ b0000000000000000(bitIndex10) )).

fof(bitBlastConstant_533,axiom,(
    ~ b0000000000000000(bitIndex9) )).

fof(bitBlastConstant_532,axiom,(
    ~ b0000000000000000(bitIndex8) )).

fof(bitBlastConstant_531,axiom,(
    ~ b0000000000000000(bitIndex7) )).

fof(bitBlastConstant_530,axiom,(
    ~ b0000000000000000(bitIndex6) )).

fof(bitBlastConstant_529,axiom,(
    ~ b0000000000000000(bitIndex5) )).

fof(bitBlastConstant_528,axiom,(
    ~ b0000000000000000(bitIndex4) )).

fof(bitBlastConstant_527,axiom,(
    ~ b0000000000000000(bitIndex3) )).

fof(bitBlastConstant_526,axiom,(
    ~ b0000000000000000(bitIndex2) )).

fof(bitBlastConstant_525,axiom,(
    ~ b0000000000000000(bitIndex1) )).

fof(bitBlastConstant_524,axiom,(
    ~ b0000000000000000(bitIndex0) )).

fof(writeBinaryOperatorEqualRangesMultipleBits_82,axiom,(
    ! [VarCurr,B] :
      ( range_23_0(B)
     => ( v2559(VarCurr,B)
      <=> ( v2560(VarCurr,B)
          | v2604(VarCurr,B) ) ) ) )).

fof(writeBinaryOperatorEqualRangesMultipleBits_81,axiom,(
    ! [VarCurr,B] :
      ( range_23_0(B)
     => ( v2604(VarCurr,B)
      <=> ( v2605(VarCurr,B)
          & v2648(VarCurr,B) ) ) ) )).

fof(addAssignment_2179,axiom,(
    ! [VarCurr] :
      ( v2648(VarCurr,bitIndex0)
    <=> v2453(VarCurr,bitIndex3) ) )).

fof(addAssignment_2178,axiom,(
    ! [VarCurr] :
      ( v2648(VarCurr,bitIndex1)
    <=> v2453(VarCurr,bitIndex3) ) )).

fof(addAssignment_2177,axiom,(
    ! [VarCurr] :
      ( v2648(VarCurr,bitIndex2)
    <=> v2453(VarCurr,bitIndex3) ) )).

fof(addAssignment_2176,axiom,(
    ! [VarCurr] :
      ( v2648(VarCurr,bitIndex3)
    <=> v2453(VarCurr,bitIndex3) ) )).

fof(addAssignment_2175,axiom,(
    ! [VarCurr] :
      ( v2648(VarCurr,bitIndex4)
    <=> v2453(VarCurr,bitIndex3) ) )).

fof(addAssignment_2174,axiom,(
    ! [VarCurr] :
      ( v2648(VarCurr,bitIndex5)
    <=> v2453(VarCurr,bitIndex3) ) )).

fof(addAssignment_2173,axiom,(
    ! [VarCurr] :
      ( v2648(VarCurr,bitIndex6)
    <=> v2453(VarCurr,bitIndex3) ) )).

fof(addAssignment_2172,axiom,(
    ! [VarCurr] :
      ( v2648(VarCurr,bitIndex7)
    <=> v2453(VarCurr,bitIndex3) ) )).

fof(addAssignment_2171,axiom,(
    ! [VarCurr] :
      ( v2648(VarCurr,bitIndex8)
    <=> v2453(VarCurr,bitIndex3) ) )).

fof(addAssignment_2170,axiom,(
    ! [VarCurr] :
      ( v2648(VarCurr,bitIndex9)
    <=> v2453(VarCurr,bitIndex3) ) )).

fof(addAssignment_2169,axiom,(
    ! [VarCurr] :
      ( v2648(VarCurr,bitIndex10)
    <=> v2453(VarCurr,bitIndex3) ) )).

fof(addAssignment_2168,axiom,(
    ! [VarCurr] :
      ( v2648(VarCurr,bitIndex11)
    <=> v2453(VarCurr,bitIndex3) ) )).

fof(addAssignment_2167,axiom,(
    ! [VarCurr] :
      ( v2648(VarCurr,bitIndex12)
    <=> v2453(VarCurr,bitIndex3) ) )).

fof(addAssignment_2166,axiom,(
    ! [VarCurr] :
      ( v2648(VarCurr,bitIndex13)
    <=> v2453(VarCurr,bitIndex3) ) )).

fof(addAssignment_2165,axiom,(
    ! [VarCurr] :
      ( v2648(VarCurr,bitIndex14)
    <=> v2453(VarCurr,bitIndex3) ) )).

fof(addAssignment_2164,axiom,(
    ! [VarCurr] :
      ( v2648(VarCurr,bitIndex15)
    <=> v2453(VarCurr,bitIndex3) ) )).

fof(addAssignment_2163,axiom,(
    ! [VarCurr] :
      ( v2648(VarCurr,bitIndex16)
    <=> v2453(VarCurr,bitIndex3) ) )).

fof(addAssignment_2162,axiom,(
    ! [VarCurr] :
      ( v2648(VarCurr,bitIndex17)
    <=> v2453(VarCurr,bitIndex3) ) )).

fof(addAssignment_2161,axiom,(
    ! [VarCurr] :
      ( v2648(VarCurr,bitIndex18)
    <=> v2453(VarCurr,bitIndex3) ) )).

fof(addAssignment_2160,axiom,(
    ! [VarCurr] :
      ( v2648(VarCurr,bitIndex19)
    <=> v2453(VarCurr,bitIndex3) ) )).

fof(addAssignment_2159,axiom,(
    ! [VarCurr] :
      ( v2648(VarCurr,bitIndex20)
    <=> v2453(VarCurr,bitIndex3) ) )).

fof(addAssignment_2158,axiom,(
    ! [VarCurr] :
      ( v2648(VarCurr,bitIndex21)
    <=> v2453(VarCurr,bitIndex3) ) )).

fof(addAssignment_2157,axiom,(
    ! [VarCurr] :
      ( v2648(VarCurr,bitIndex22)
    <=> v2453(VarCurr,bitIndex3) ) )).

fof(addAssignment_2156,axiom,(
    ! [VarCurr] :
      ( v2648(VarCurr,bitIndex23)
    <=> v2453(VarCurr,bitIndex3) ) )).

fof(addAssignment_2155,axiom,(
    ! [VarCurr,B] :
      ( range_15_0(B)
     => ( v2605(VarCurr,B)
      <=> v2606(VarCurr,B) ) ) )).

fof(addAssignment_2154,axiom,(
    ! [VarCurr] :
      ( ( v2605(VarCurr,bitIndex23)
      <=> $false )
      & ( v2605(VarCurr,bitIndex22)
      <=> $false )
      & ( v2605(VarCurr,bitIndex21)
      <=> $false )
      & ( v2605(VarCurr,bitIndex20)
      <=> $false )
      & ( v2605(VarCurr,bitIndex19)
      <=> $false )
      & ( v2605(VarCurr,bitIndex18)
      <=> $false )
      & ( v2605(VarCurr,bitIndex17)
      <=> $false )
      & ( v2605(VarCurr,bitIndex16)
      <=> $false ) ) )).

fof(writeBinaryOperatorEqualRangesMultipleBits_80,axiom,(
    ! [VarCurr,B] :
      ( range_15_0(B)
     => ( v2606(VarCurr,B)
      <=> ( v2607(VarCurr,B)
          | v2627(VarCurr,B) ) ) ) )).

fof(writeBinaryOperatorEqualRangesMultipleBits_79,axiom,(
    ! [VarCurr,B] :
      ( range_15_0(B)
     => ( v2627(VarCurr,B)
      <=> ( v2628(VarCurr,B)
          & v2647(VarCurr,B) ) ) ) )).

fof(addAssignment_2153,axiom,(
    ! [VarCurr] :
      ( v2647(VarCurr,bitIndex0)
    <=> v2453(VarCurr,bitIndex2) ) )).

fof(addAssignment_2152,axiom,(
    ! [VarCurr] :
      ( v2647(VarCurr,bitIndex1)
    <=> v2453(VarCurr,bitIndex2) ) )).

fof(addAssignment_2151,axiom,(
    ! [VarCurr] :
      ( v2647(VarCurr,bitIndex2)
    <=> v2453(VarCurr,bitIndex2) ) )).

fof(addAssignment_2150,axiom,(
    ! [VarCurr] :
      ( v2647(VarCurr,bitIndex3)
    <=> v2453(VarCurr,bitIndex2) ) )).

fof(addAssignment_2149,axiom,(
    ! [VarCurr] :
      ( v2647(VarCurr,bitIndex4)
    <=> v2453(VarCurr,bitIndex2) ) )).

fof(addAssignment_2148,axiom,(
    ! [VarCurr] :
      ( v2647(VarCurr,bitIndex5)
    <=> v2453(VarCurr,bitIndex2) ) )).

fof(addAssignment_2147,axiom,(
    ! [VarCurr] :
      ( v2647(VarCurr,bitIndex6)
    <=> v2453(VarCurr,bitIndex2) ) )).

fof(addAssignment_2146,axiom,(
    ! [VarCurr] :
      ( v2647(VarCurr,bitIndex7)
    <=> v2453(VarCurr,bitIndex2) ) )).

fof(addAssignment_2145,axiom,(
    ! [VarCurr] :
      ( v2647(VarCurr,bitIndex8)
    <=> v2453(VarCurr,bitIndex2) ) )).

fof(addAssignment_2144,axiom,(
    ! [VarCurr] :
      ( v2647(VarCurr,bitIndex9)
    <=> v2453(VarCurr,bitIndex2) ) )).

fof(addAssignment_2143,axiom,(
    ! [VarCurr] :
      ( v2647(VarCurr,bitIndex10)
    <=> v2453(VarCurr,bitIndex2) ) )).

fof(addAssignment_2142,axiom,(
    ! [VarCurr] :
      ( v2647(VarCurr,bitIndex11)
    <=> v2453(VarCurr,bitIndex2) ) )).

fof(addAssignment_2141,axiom,(
    ! [VarCurr] :
      ( v2647(VarCurr,bitIndex12)
    <=> v2453(VarCurr,bitIndex2) ) )).

fof(addAssignment_2140,axiom,(
    ! [VarCurr] :
      ( v2647(VarCurr,bitIndex13)
    <=> v2453(VarCurr,bitIndex2) ) )).

fof(addAssignment_2139,axiom,(
    ! [VarCurr] :
      ( v2647(VarCurr,bitIndex14)
    <=> v2453(VarCurr,bitIndex2) ) )).

fof(addAssignment_2138,axiom,(
    ! [VarCurr] :
      ( v2647(VarCurr,bitIndex15)
    <=> v2453(VarCurr,bitIndex2) ) )).

fof(addAssignment_2137,axiom,(
    ! [VarCurr,B] :
      ( range_11_0(B)
     => ( v2628(VarCurr,B)
      <=> v2629(VarCurr,B) ) ) )).

fof(addAssignment_2136,axiom,(
    ! [VarCurr] :
      ( ( v2628(VarCurr,bitIndex15)
      <=> $false )
      & ( v2628(VarCurr,bitIndex14)
      <=> $false )
      & ( v2628(VarCurr,bitIndex13)
      <=> $false )
      & ( v2628(VarCurr,bitIndex12)
      <=> $false ) ) )).

fof(writeBinaryOperatorEqualRangesMultipleBits_78,axiom,(
    ! [VarCurr,B] :
      ( range_11_0(B)
     => ( v2629(VarCurr,B)
      <=> ( v2630(VarCurr,B)
          | v2638(VarCurr,B) ) ) ) )).

fof(writeBinaryOperatorEqualRangesMultipleBits_77,axiom,(
    ! [VarCurr,B] :
      ( range_11_0(B)
     => ( v2638(VarCurr,B)
      <=> ( v2639(VarCurr,B)
          & v2646(VarCurr,B) ) ) ) )).

fof(addAssignment_2135,axiom,(
    ! [VarCurr] :
      ( v2646(VarCurr,bitIndex0)
    <=> v2453(VarCurr,bitIndex1) ) )).

fof(addAssignment_2134,axiom,(
    ! [VarCurr] :
      ( v2646(VarCurr,bitIndex1)
    <=> v2453(VarCurr,bitIndex1) ) )).

fof(addAssignment_2133,axiom,(
    ! [VarCurr] :
      ( v2646(VarCurr,bitIndex2)
    <=> v2453(VarCurr,bitIndex1) ) )).

fof(addAssignment_2132,axiom,(
    ! [VarCurr] :
      ( v2646(VarCurr,bitIndex3)
    <=> v2453(VarCurr,bitIndex1) ) )).

fof(addAssignment_2131,axiom,(
    ! [VarCurr] :
      ( v2646(VarCurr,bitIndex4)
    <=> v2453(VarCurr,bitIndex1) ) )).

fof(addAssignment_2130,axiom,(
    ! [VarCurr] :
      ( v2646(VarCurr,bitIndex5)
    <=> v2453(VarCurr,bitIndex1) ) )).

fof(addAssignment_2129,axiom,(
    ! [VarCurr] :
      ( v2646(VarCurr,bitIndex6)
    <=> v2453(VarCurr,bitIndex1) ) )).

fof(addAssignment_2128,axiom,(
    ! [VarCurr] :
      ( v2646(VarCurr,bitIndex7)
    <=> v2453(VarCurr,bitIndex1) ) )).

fof(addAssignment_2127,axiom,(
    ! [VarCurr] :
      ( v2646(VarCurr,bitIndex8)
    <=> v2453(VarCurr,bitIndex1) ) )).

fof(addAssignment_2126,axiom,(
    ! [VarCurr] :
      ( v2646(VarCurr,bitIndex9)
    <=> v2453(VarCurr,bitIndex1) ) )).

fof(addAssignment_2125,axiom,(
    ! [VarCurr] :
      ( v2646(VarCurr,bitIndex10)
    <=> v2453(VarCurr,bitIndex1) ) )).

fof(addAssignment_2124,axiom,(
    ! [VarCurr] :
      ( v2646(VarCurr,bitIndex11)
    <=> v2453(VarCurr,bitIndex1) ) )).

fof(addAssignment_2123,axiom,(
    ! [VarCurr,B] :
      ( range_9_0(B)
     => ( v2639(VarCurr,B)
      <=> v2640(VarCurr,B) ) ) )).

fof(addAssignment_2122,axiom,(
    ! [VarCurr] :
      ( ( v2639(VarCurr,bitIndex11)
      <=> $false )
      & ( v2639(VarCurr,bitIndex10)
      <=> $false ) ) )).

fof(writeBinaryOperatorEqualRangesMultipleBits_76,axiom,(
    ! [VarCurr,B] :
      ( range_9_0(B)
     => ( v2640(VarCurr,B)
      <=> ( v2641(VarCurr,B)
          | v2643(VarCurr,B) ) ) ) )).

fof(writeBinaryOperatorEqualRangesMultipleBits_75,axiom,(
    ! [VarCurr,B] :
      ( range_9_0(B)
     => ( v2643(VarCurr,B)
      <=> ( v2644(VarCurr,B)
          & v2645(VarCurr,B) ) ) ) )).

fof(range_axiom_27,axiom,(
    ! [B] :
      ( range_9_0(B)
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
        | bitIndex9 = B ) ) )).

fof(addAssignment_2121,axiom,(
    ! [VarCurr] :
      ( v2645(VarCurr,bitIndex0)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_2120,axiom,(
    ! [VarCurr] :
      ( v2645(VarCurr,bitIndex1)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_2119,axiom,(
    ! [VarCurr] :
      ( v2645(VarCurr,bitIndex2)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_2118,axiom,(
    ! [VarCurr] :
      ( v2645(VarCurr,bitIndex3)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_2117,axiom,(
    ! [VarCurr] :
      ( v2645(VarCurr,bitIndex4)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_2116,axiom,(
    ! [VarCurr] :
      ( v2645(VarCurr,bitIndex5)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_2115,axiom,(
    ! [VarCurr] :
      ( v2645(VarCurr,bitIndex6)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_2114,axiom,(
    ! [VarCurr] :
      ( v2645(VarCurr,bitIndex7)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_2113,axiom,(
    ! [VarCurr] :
      ( v2645(VarCurr,bitIndex8)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_2112,axiom,(
    ! [VarCurr] :
      ( v2645(VarCurr,bitIndex9)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_2111,axiom,(
    ! [VarCurr] :
      ( ( v2644(VarCurr,bitIndex8)
      <=> v2465(VarCurr,bitIndex39) )
      & ( v2644(VarCurr,bitIndex7)
      <=> v2465(VarCurr,bitIndex38) )
      & ( v2644(VarCurr,bitIndex6)
      <=> v2465(VarCurr,bitIndex37) )
      & ( v2644(VarCurr,bitIndex5)
      <=> v2465(VarCurr,bitIndex36) )
      & ( v2644(VarCurr,bitIndex4)
      <=> v2465(VarCurr,bitIndex35) )
      & ( v2644(VarCurr,bitIndex3)
      <=> v2465(VarCurr,bitIndex34) )
      & ( v2644(VarCurr,bitIndex2)
      <=> v2465(VarCurr,bitIndex33) )
      & ( v2644(VarCurr,bitIndex1)
      <=> v2465(VarCurr,bitIndex32) )
      & ( v2644(VarCurr,bitIndex0)
      <=> v2465(VarCurr,bitIndex31) ) ) )).

fof(addAssignment_2110,axiom,(
    ! [VarCurr] :
      ( v2644(VarCurr,bitIndex9)
    <=> $false ) )).

fof(writeBinaryOperatorShiftedRanges_466,axiom,(
    ! [VarCurr] :
      ( v2641(VarCurr,bitIndex0)
    <=> ( v2465(VarCurr,bitIndex30)
        & v2642(VarCurr,bitIndex0) ) ) )).

fof(writeBinaryOperatorShiftedRanges_465,axiom,(
    ! [VarCurr] :
      ( v2641(VarCurr,bitIndex1)
    <=> ( v2465(VarCurr,bitIndex31)
        & v2642(VarCurr,bitIndex1) ) ) )).

fof(writeBinaryOperatorShiftedRanges_464,axiom,(
    ! [VarCurr] :
      ( v2641(VarCurr,bitIndex2)
    <=> ( v2465(VarCurr,bitIndex32)
        & v2642(VarCurr,bitIndex2) ) ) )).

fof(writeBinaryOperatorShiftedRanges_463,axiom,(
    ! [VarCurr] :
      ( v2641(VarCurr,bitIndex3)
    <=> ( v2465(VarCurr,bitIndex33)
        & v2642(VarCurr,bitIndex3) ) ) )).

fof(writeBinaryOperatorShiftedRanges_462,axiom,(
    ! [VarCurr] :
      ( v2641(VarCurr,bitIndex4)
    <=> ( v2465(VarCurr,bitIndex34)
        & v2642(VarCurr,bitIndex4) ) ) )).

fof(writeBinaryOperatorShiftedRanges_461,axiom,(
    ! [VarCurr] :
      ( v2641(VarCurr,bitIndex5)
    <=> ( v2465(VarCurr,bitIndex35)
        & v2642(VarCurr,bitIndex5) ) ) )).

fof(writeBinaryOperatorShiftedRanges_460,axiom,(
    ! [VarCurr] :
      ( v2641(VarCurr,bitIndex6)
    <=> ( v2465(VarCurr,bitIndex36)
        & v2642(VarCurr,bitIndex6) ) ) )).

fof(writeBinaryOperatorShiftedRanges_459,axiom,(
    ! [VarCurr] :
      ( v2641(VarCurr,bitIndex7)
    <=> ( v2465(VarCurr,bitIndex37)
        & v2642(VarCurr,bitIndex7) ) ) )).

fof(writeBinaryOperatorShiftedRanges_458,axiom,(
    ! [VarCurr] :
      ( v2641(VarCurr,bitIndex8)
    <=> ( v2465(VarCurr,bitIndex38)
        & v2642(VarCurr,bitIndex8) ) ) )).

fof(writeBinaryOperatorShiftedRanges_457,axiom,(
    ! [VarCurr] :
      ( v2641(VarCurr,bitIndex9)
    <=> ( v2465(VarCurr,bitIndex39)
        & v2642(VarCurr,bitIndex9) ) ) )).

fof(addAssignment_2109,axiom,(
    ! [VarCurr] :
      ( v2642(VarCurr,bitIndex0)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_2108,axiom,(
    ! [VarCurr] :
      ( v2642(VarCurr,bitIndex1)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_2107,axiom,(
    ! [VarCurr] :
      ( v2642(VarCurr,bitIndex2)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_2106,axiom,(
    ! [VarCurr] :
      ( v2642(VarCurr,bitIndex3)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_2105,axiom,(
    ! [VarCurr] :
      ( v2642(VarCurr,bitIndex4)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_2104,axiom,(
    ! [VarCurr] :
      ( v2642(VarCurr,bitIndex5)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_2103,axiom,(
    ! [VarCurr] :
      ( v2642(VarCurr,bitIndex6)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_2102,axiom,(
    ! [VarCurr] :
      ( v2642(VarCurr,bitIndex7)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_2101,axiom,(
    ! [VarCurr] :
      ( v2642(VarCurr,bitIndex8)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_2100,axiom,(
    ! [VarCurr] :
      ( v2642(VarCurr,bitIndex9)
    <=> v2468(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesMultipleBits_74,axiom,(
    ! [VarCurr,B] :
      ( range_11_0(B)
     => ( v2630(VarCurr,B)
      <=> ( v2631(VarCurr,B)
          & v2637(VarCurr,B) ) ) ) )).

fof(addAssignment_2099,axiom,(
    ! [VarCurr] :
      ( v2637(VarCurr,bitIndex0)
    <=> v2473(VarCurr) ) )).

fof(addAssignment_2098,axiom,(
    ! [VarCurr] :
      ( v2637(VarCurr,bitIndex1)
    <=> v2473(VarCurr) ) )).

fof(addAssignment_2097,axiom,(
    ! [VarCurr] :
      ( v2637(VarCurr,bitIndex2)
    <=> v2473(VarCurr) ) )).

fof(addAssignment_2096,axiom,(
    ! [VarCurr] :
      ( v2637(VarCurr,bitIndex3)
    <=> v2473(VarCurr) ) )).

fof(addAssignment_2095,axiom,(
    ! [VarCurr] :
      ( v2637(VarCurr,bitIndex4)
    <=> v2473(VarCurr) ) )).

fof(addAssignment_2094,axiom,(
    ! [VarCurr] :
      ( v2637(VarCurr,bitIndex5)
    <=> v2473(VarCurr) ) )).

fof(addAssignment_2093,axiom,(
    ! [VarCurr] :
      ( v2637(VarCurr,bitIndex6)
    <=> v2473(VarCurr) ) )).

fof(addAssignment_2092,axiom,(
    ! [VarCurr] :
      ( v2637(VarCurr,bitIndex7)
    <=> v2473(VarCurr) ) )).

fof(addAssignment_2091,axiom,(
    ! [VarCurr] :
      ( v2637(VarCurr,bitIndex8)
    <=> v2473(VarCurr) ) )).

fof(addAssignment_2090,axiom,(
    ! [VarCurr] :
      ( v2637(VarCurr,bitIndex9)
    <=> v2473(VarCurr) ) )).

fof(addAssignment_2089,axiom,(
    ! [VarCurr] :
      ( v2637(VarCurr,bitIndex10)
    <=> v2473(VarCurr) ) )).

fof(addAssignment_2088,axiom,(
    ! [VarCurr] :
      ( v2637(VarCurr,bitIndex11)
    <=> v2473(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesMultipleBits_73,axiom,(
    ! [VarCurr,B] :
      ( range_11_0(B)
     => ( v2631(VarCurr,B)
      <=> ( v2632(VarCurr,B)
          | v2634(VarCurr,B) ) ) ) )).

fof(writeBinaryOperatorEqualRangesMultipleBits_72,axiom,(
    ! [VarCurr,B] :
      ( range_11_0(B)
     => ( v2634(VarCurr,B)
      <=> ( v2635(VarCurr,B)
          & v2636(VarCurr,B) ) ) ) )).

fof(range_axiom_26,axiom,(
    ! [B] :
      ( range_11_0(B)
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
        | bitIndex11 = B ) ) )).

fof(addAssignment_2087,axiom,(
    ! [VarCurr] :
      ( v2636(VarCurr,bitIndex0)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_2086,axiom,(
    ! [VarCurr] :
      ( v2636(VarCurr,bitIndex1)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_2085,axiom,(
    ! [VarCurr] :
      ( v2636(VarCurr,bitIndex2)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_2084,axiom,(
    ! [VarCurr] :
      ( v2636(VarCurr,bitIndex3)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_2083,axiom,(
    ! [VarCurr] :
      ( v2636(VarCurr,bitIndex4)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_2082,axiom,(
    ! [VarCurr] :
      ( v2636(VarCurr,bitIndex5)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_2081,axiom,(
    ! [VarCurr] :
      ( v2636(VarCurr,bitIndex6)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_2080,axiom,(
    ! [VarCurr] :
      ( v2636(VarCurr,bitIndex7)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_2079,axiom,(
    ! [VarCurr] :
      ( v2636(VarCurr,bitIndex8)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_2078,axiom,(
    ! [VarCurr] :
      ( v2636(VarCurr,bitIndex9)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_2077,axiom,(
    ! [VarCurr] :
      ( v2636(VarCurr,bitIndex10)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_2076,axiom,(
    ! [VarCurr] :
      ( v2636(VarCurr,bitIndex11)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_2075,axiom,(
    ! [VarCurr] :
      ( ( v2635(VarCurr,bitIndex10)
      <=> v2465(VarCurr,bitIndex39) )
      & ( v2635(VarCurr,bitIndex9)
      <=> v2465(VarCurr,bitIndex38) )
      & ( v2635(VarCurr,bitIndex8)
      <=> v2465(VarCurr,bitIndex37) )
      & ( v2635(VarCurr,bitIndex7)
      <=> v2465(VarCurr,bitIndex36) )
      & ( v2635(VarCurr,bitIndex6)
      <=> v2465(VarCurr,bitIndex35) )
      & ( v2635(VarCurr,bitIndex5)
      <=> v2465(VarCurr,bitIndex34) )
      & ( v2635(VarCurr,bitIndex4)
      <=> v2465(VarCurr,bitIndex33) )
      & ( v2635(VarCurr,bitIndex3)
      <=> v2465(VarCurr,bitIndex32) )
      & ( v2635(VarCurr,bitIndex2)
      <=> v2465(VarCurr,bitIndex31) )
      & ( v2635(VarCurr,bitIndex1)
      <=> v2465(VarCurr,bitIndex30) )
      & ( v2635(VarCurr,bitIndex0)
      <=> v2465(VarCurr,bitIndex29) ) ) )).

fof(addAssignment_2074,axiom,(
    ! [VarCurr] :
      ( v2635(VarCurr,bitIndex11)
    <=> $false ) )).

fof(writeBinaryOperatorShiftedRanges_456,axiom,(
    ! [VarCurr] :
      ( v2632(VarCurr,bitIndex0)
    <=> ( v2465(VarCurr,bitIndex28)
        & v2633(VarCurr,bitIndex0) ) ) )).

fof(writeBinaryOperatorShiftedRanges_455,axiom,(
    ! [VarCurr] :
      ( v2632(VarCurr,bitIndex1)
    <=> ( v2465(VarCurr,bitIndex29)
        & v2633(VarCurr,bitIndex1) ) ) )).

fof(writeBinaryOperatorShiftedRanges_454,axiom,(
    ! [VarCurr] :
      ( v2632(VarCurr,bitIndex2)
    <=> ( v2465(VarCurr,bitIndex30)
        & v2633(VarCurr,bitIndex2) ) ) )).

fof(writeBinaryOperatorShiftedRanges_453,axiom,(
    ! [VarCurr] :
      ( v2632(VarCurr,bitIndex3)
    <=> ( v2465(VarCurr,bitIndex31)
        & v2633(VarCurr,bitIndex3) ) ) )).

fof(writeBinaryOperatorShiftedRanges_452,axiom,(
    ! [VarCurr] :
      ( v2632(VarCurr,bitIndex4)
    <=> ( v2465(VarCurr,bitIndex32)
        & v2633(VarCurr,bitIndex4) ) ) )).

fof(writeBinaryOperatorShiftedRanges_451,axiom,(
    ! [VarCurr] :
      ( v2632(VarCurr,bitIndex5)
    <=> ( v2465(VarCurr,bitIndex33)
        & v2633(VarCurr,bitIndex5) ) ) )).

fof(writeBinaryOperatorShiftedRanges_450,axiom,(
    ! [VarCurr] :
      ( v2632(VarCurr,bitIndex6)
    <=> ( v2465(VarCurr,bitIndex34)
        & v2633(VarCurr,bitIndex6) ) ) )).

fof(writeBinaryOperatorShiftedRanges_449,axiom,(
    ! [VarCurr] :
      ( v2632(VarCurr,bitIndex7)
    <=> ( v2465(VarCurr,bitIndex35)
        & v2633(VarCurr,bitIndex7) ) ) )).

fof(writeBinaryOperatorShiftedRanges_448,axiom,(
    ! [VarCurr] :
      ( v2632(VarCurr,bitIndex8)
    <=> ( v2465(VarCurr,bitIndex36)
        & v2633(VarCurr,bitIndex8) ) ) )).

fof(writeBinaryOperatorShiftedRanges_447,axiom,(
    ! [VarCurr] :
      ( v2632(VarCurr,bitIndex9)
    <=> ( v2465(VarCurr,bitIndex37)
        & v2633(VarCurr,bitIndex9) ) ) )).

fof(writeBinaryOperatorShiftedRanges_446,axiom,(
    ! [VarCurr] :
      ( v2632(VarCurr,bitIndex10)
    <=> ( v2465(VarCurr,bitIndex38)
        & v2633(VarCurr,bitIndex10) ) ) )).

fof(writeBinaryOperatorShiftedRanges_445,axiom,(
    ! [VarCurr] :
      ( v2632(VarCurr,bitIndex11)
    <=> ( v2465(VarCurr,bitIndex39)
        & v2633(VarCurr,bitIndex11) ) ) )).

fof(addAssignment_2073,axiom,(
    ! [VarCurr] :
      ( v2633(VarCurr,bitIndex0)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_2072,axiom,(
    ! [VarCurr] :
      ( v2633(VarCurr,bitIndex1)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_2071,axiom,(
    ! [VarCurr] :
      ( v2633(VarCurr,bitIndex2)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_2070,axiom,(
    ! [VarCurr] :
      ( v2633(VarCurr,bitIndex3)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_2069,axiom,(
    ! [VarCurr] :
      ( v2633(VarCurr,bitIndex4)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_2068,axiom,(
    ! [VarCurr] :
      ( v2633(VarCurr,bitIndex5)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_2067,axiom,(
    ! [VarCurr] :
      ( v2633(VarCurr,bitIndex6)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_2066,axiom,(
    ! [VarCurr] :
      ( v2633(VarCurr,bitIndex7)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_2065,axiom,(
    ! [VarCurr] :
      ( v2633(VarCurr,bitIndex8)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_2064,axiom,(
    ! [VarCurr] :
      ( v2633(VarCurr,bitIndex9)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_2063,axiom,(
    ! [VarCurr] :
      ( v2633(VarCurr,bitIndex10)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_2062,axiom,(
    ! [VarCurr] :
      ( v2633(VarCurr,bitIndex11)
    <=> v2468(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesMultipleBits_71,axiom,(
    ! [VarCurr,B] :
      ( range_15_0(B)
     => ( v2607(VarCurr,B)
      <=> ( v2608(VarCurr,B)
          & v2626(VarCurr,B) ) ) ) )).

fof(addAssignment_2061,axiom,(
    ! [VarCurr] :
      ( v2626(VarCurr,bitIndex0)
    <=> v2484(VarCurr) ) )).

fof(addAssignment_2060,axiom,(
    ! [VarCurr] :
      ( v2626(VarCurr,bitIndex1)
    <=> v2484(VarCurr) ) )).

fof(addAssignment_2059,axiom,(
    ! [VarCurr] :
      ( v2626(VarCurr,bitIndex2)
    <=> v2484(VarCurr) ) )).

fof(addAssignment_2058,axiom,(
    ! [VarCurr] :
      ( v2626(VarCurr,bitIndex3)
    <=> v2484(VarCurr) ) )).

fof(addAssignment_2057,axiom,(
    ! [VarCurr] :
      ( v2626(VarCurr,bitIndex4)
    <=> v2484(VarCurr) ) )).

fof(addAssignment_2056,axiom,(
    ! [VarCurr] :
      ( v2626(VarCurr,bitIndex5)
    <=> v2484(VarCurr) ) )).

fof(addAssignment_2055,axiom,(
    ! [VarCurr] :
      ( v2626(VarCurr,bitIndex6)
    <=> v2484(VarCurr) ) )).

fof(addAssignment_2054,axiom,(
    ! [VarCurr] :
      ( v2626(VarCurr,bitIndex7)
    <=> v2484(VarCurr) ) )).

fof(addAssignment_2053,axiom,(
    ! [VarCurr] :
      ( v2626(VarCurr,bitIndex8)
    <=> v2484(VarCurr) ) )).

fof(addAssignment_2052,axiom,(
    ! [VarCurr] :
      ( v2626(VarCurr,bitIndex9)
    <=> v2484(VarCurr) ) )).

fof(addAssignment_2051,axiom,(
    ! [VarCurr] :
      ( v2626(VarCurr,bitIndex10)
    <=> v2484(VarCurr) ) )).

fof(addAssignment_2050,axiom,(
    ! [VarCurr] :
      ( v2626(VarCurr,bitIndex11)
    <=> v2484(VarCurr) ) )).

fof(addAssignment_2049,axiom,(
    ! [VarCurr] :
      ( v2626(VarCurr,bitIndex12)
    <=> v2484(VarCurr) ) )).

fof(addAssignment_2048,axiom,(
    ! [VarCurr] :
      ( v2626(VarCurr,bitIndex13)
    <=> v2484(VarCurr) ) )).

fof(addAssignment_2047,axiom,(
    ! [VarCurr] :
      ( v2626(VarCurr,bitIndex14)
    <=> v2484(VarCurr) ) )).

fof(addAssignment_2046,axiom,(
    ! [VarCurr] :
      ( v2626(VarCurr,bitIndex15)
    <=> v2484(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesMultipleBits_70,axiom,(
    ! [VarCurr,B] :
      ( range_15_0(B)
     => ( v2608(VarCurr,B)
      <=> ( v2609(VarCurr,B)
          | v2617(VarCurr,B) ) ) ) )).

fof(writeBinaryOperatorEqualRangesMultipleBits_69,axiom,(
    ! [VarCurr,B] :
      ( range_15_0(B)
     => ( v2617(VarCurr,B)
      <=> ( v2618(VarCurr,B)
          & v2625(VarCurr,B) ) ) ) )).

fof(addAssignment_2045,axiom,(
    ! [VarCurr] :
      ( v2625(VarCurr,bitIndex0)
    <=> v2453(VarCurr,bitIndex1) ) )).

fof(addAssignment_2044,axiom,(
    ! [VarCurr] :
      ( v2625(VarCurr,bitIndex1)
    <=> v2453(VarCurr,bitIndex1) ) )).

fof(addAssignment_2043,axiom,(
    ! [VarCurr] :
      ( v2625(VarCurr,bitIndex2)
    <=> v2453(VarCurr,bitIndex1) ) )).

fof(addAssignment_2042,axiom,(
    ! [VarCurr] :
      ( v2625(VarCurr,bitIndex3)
    <=> v2453(VarCurr,bitIndex1) ) )).

fof(addAssignment_2041,axiom,(
    ! [VarCurr] :
      ( v2625(VarCurr,bitIndex4)
    <=> v2453(VarCurr,bitIndex1) ) )).

fof(addAssignment_2040,axiom,(
    ! [VarCurr] :
      ( v2625(VarCurr,bitIndex5)
    <=> v2453(VarCurr,bitIndex1) ) )).

fof(addAssignment_2039,axiom,(
    ! [VarCurr] :
      ( v2625(VarCurr,bitIndex6)
    <=> v2453(VarCurr,bitIndex1) ) )).

fof(addAssignment_2038,axiom,(
    ! [VarCurr] :
      ( v2625(VarCurr,bitIndex7)
    <=> v2453(VarCurr,bitIndex1) ) )).

fof(addAssignment_2037,axiom,(
    ! [VarCurr] :
      ( v2625(VarCurr,bitIndex8)
    <=> v2453(VarCurr,bitIndex1) ) )).

fof(addAssignment_2036,axiom,(
    ! [VarCurr] :
      ( v2625(VarCurr,bitIndex9)
    <=> v2453(VarCurr,bitIndex1) ) )).

fof(addAssignment_2035,axiom,(
    ! [VarCurr] :
      ( v2625(VarCurr,bitIndex10)
    <=> v2453(VarCurr,bitIndex1) ) )).

fof(addAssignment_2034,axiom,(
    ! [VarCurr] :
      ( v2625(VarCurr,bitIndex11)
    <=> v2453(VarCurr,bitIndex1) ) )).

fof(addAssignment_2033,axiom,(
    ! [VarCurr] :
      ( v2625(VarCurr,bitIndex12)
    <=> v2453(VarCurr,bitIndex1) ) )).

fof(addAssignment_2032,axiom,(
    ! [VarCurr] :
      ( v2625(VarCurr,bitIndex13)
    <=> v2453(VarCurr,bitIndex1) ) )).

fof(addAssignment_2031,axiom,(
    ! [VarCurr] :
      ( v2625(VarCurr,bitIndex14)
    <=> v2453(VarCurr,bitIndex1) ) )).

fof(addAssignment_2030,axiom,(
    ! [VarCurr] :
      ( v2625(VarCurr,bitIndex15)
    <=> v2453(VarCurr,bitIndex1) ) )).

fof(addAssignment_2029,axiom,(
    ! [VarCurr,B] :
      ( range_13_0(B)
     => ( v2618(VarCurr,B)
      <=> v2619(VarCurr,B) ) ) )).

fof(addAssignment_2028,axiom,(
    ! [VarCurr] :
      ( ( v2618(VarCurr,bitIndex15)
      <=> $false )
      & ( v2618(VarCurr,bitIndex14)
      <=> $false ) ) )).

fof(writeBinaryOperatorEqualRangesMultipleBits_68,axiom,(
    ! [VarCurr,B] :
      ( range_13_0(B)
     => ( v2619(VarCurr,B)
      <=> ( v2620(VarCurr,B)
          | v2622(VarCurr,B) ) ) ) )).

fof(writeBinaryOperatorEqualRangesMultipleBits_67,axiom,(
    ! [VarCurr,B] :
      ( range_13_0(B)
     => ( v2622(VarCurr,B)
      <=> ( v2623(VarCurr,B)
          & v2624(VarCurr,B) ) ) ) )).

fof(range_axiom_25,axiom,(
    ! [B] :
      ( range_13_0(B)
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
        | bitIndex13 = B ) ) )).

fof(addAssignment_2027,axiom,(
    ! [VarCurr] :
      ( v2624(VarCurr,bitIndex0)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_2026,axiom,(
    ! [VarCurr] :
      ( v2624(VarCurr,bitIndex1)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_2025,axiom,(
    ! [VarCurr] :
      ( v2624(VarCurr,bitIndex2)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_2024,axiom,(
    ! [VarCurr] :
      ( v2624(VarCurr,bitIndex3)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_2023,axiom,(
    ! [VarCurr] :
      ( v2624(VarCurr,bitIndex4)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_2022,axiom,(
    ! [VarCurr] :
      ( v2624(VarCurr,bitIndex5)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_2021,axiom,(
    ! [VarCurr] :
      ( v2624(VarCurr,bitIndex6)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_2020,axiom,(
    ! [VarCurr] :
      ( v2624(VarCurr,bitIndex7)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_2019,axiom,(
    ! [VarCurr] :
      ( v2624(VarCurr,bitIndex8)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_2018,axiom,(
    ! [VarCurr] :
      ( v2624(VarCurr,bitIndex9)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_2017,axiom,(
    ! [VarCurr] :
      ( v2624(VarCurr,bitIndex10)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_2016,axiom,(
    ! [VarCurr] :
      ( v2624(VarCurr,bitIndex11)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_2015,axiom,(
    ! [VarCurr] :
      ( v2624(VarCurr,bitIndex12)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_2014,axiom,(
    ! [VarCurr] :
      ( v2624(VarCurr,bitIndex13)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_2013,axiom,(
    ! [VarCurr] :
      ( ( v2623(VarCurr,bitIndex12)
      <=> v2465(VarCurr,bitIndex39) )
      & ( v2623(VarCurr,bitIndex11)
      <=> v2465(VarCurr,bitIndex38) )
      & ( v2623(VarCurr,bitIndex10)
      <=> v2465(VarCurr,bitIndex37) )
      & ( v2623(VarCurr,bitIndex9)
      <=> v2465(VarCurr,bitIndex36) )
      & ( v2623(VarCurr,bitIndex8)
      <=> v2465(VarCurr,bitIndex35) )
      & ( v2623(VarCurr,bitIndex7)
      <=> v2465(VarCurr,bitIndex34) )
      & ( v2623(VarCurr,bitIndex6)
      <=> v2465(VarCurr,bitIndex33) )
      & ( v2623(VarCurr,bitIndex5)
      <=> v2465(VarCurr,bitIndex32) )
      & ( v2623(VarCurr,bitIndex4)
      <=> v2465(VarCurr,bitIndex31) )
      & ( v2623(VarCurr,bitIndex3)
      <=> v2465(VarCurr,bitIndex30) )
      & ( v2623(VarCurr,bitIndex2)
      <=> v2465(VarCurr,bitIndex29) )
      & ( v2623(VarCurr,bitIndex1)
      <=> v2465(VarCurr,bitIndex28) )
      & ( v2623(VarCurr,bitIndex0)
      <=> v2465(VarCurr,bitIndex27) ) ) )).

fof(addAssignment_2012,axiom,(
    ! [VarCurr] :
      ( v2623(VarCurr,bitIndex13)
    <=> $false ) )).

fof(writeBinaryOperatorShiftedRanges_444,axiom,(
    ! [VarCurr] :
      ( v2620(VarCurr,bitIndex0)
    <=> ( v2465(VarCurr,bitIndex26)
        & v2621(VarCurr,bitIndex0) ) ) )).

fof(writeBinaryOperatorShiftedRanges_443,axiom,(
    ! [VarCurr] :
      ( v2620(VarCurr,bitIndex1)
    <=> ( v2465(VarCurr,bitIndex27)
        & v2621(VarCurr,bitIndex1) ) ) )).

fof(writeBinaryOperatorShiftedRanges_442,axiom,(
    ! [VarCurr] :
      ( v2620(VarCurr,bitIndex2)
    <=> ( v2465(VarCurr,bitIndex28)
        & v2621(VarCurr,bitIndex2) ) ) )).

fof(writeBinaryOperatorShiftedRanges_441,axiom,(
    ! [VarCurr] :
      ( v2620(VarCurr,bitIndex3)
    <=> ( v2465(VarCurr,bitIndex29)
        & v2621(VarCurr,bitIndex3) ) ) )).

fof(writeBinaryOperatorShiftedRanges_440,axiom,(
    ! [VarCurr] :
      ( v2620(VarCurr,bitIndex4)
    <=> ( v2465(VarCurr,bitIndex30)
        & v2621(VarCurr,bitIndex4) ) ) )).

fof(writeBinaryOperatorShiftedRanges_439,axiom,(
    ! [VarCurr] :
      ( v2620(VarCurr,bitIndex5)
    <=> ( v2465(VarCurr,bitIndex31)
        & v2621(VarCurr,bitIndex5) ) ) )).

fof(writeBinaryOperatorShiftedRanges_438,axiom,(
    ! [VarCurr] :
      ( v2620(VarCurr,bitIndex6)
    <=> ( v2465(VarCurr,bitIndex32)
        & v2621(VarCurr,bitIndex6) ) ) )).

fof(writeBinaryOperatorShiftedRanges_437,axiom,(
    ! [VarCurr] :
      ( v2620(VarCurr,bitIndex7)
    <=> ( v2465(VarCurr,bitIndex33)
        & v2621(VarCurr,bitIndex7) ) ) )).

fof(writeBinaryOperatorShiftedRanges_436,axiom,(
    ! [VarCurr] :
      ( v2620(VarCurr,bitIndex8)
    <=> ( v2465(VarCurr,bitIndex34)
        & v2621(VarCurr,bitIndex8) ) ) )).

fof(writeBinaryOperatorShiftedRanges_435,axiom,(
    ! [VarCurr] :
      ( v2620(VarCurr,bitIndex9)
    <=> ( v2465(VarCurr,bitIndex35)
        & v2621(VarCurr,bitIndex9) ) ) )).

fof(writeBinaryOperatorShiftedRanges_434,axiom,(
    ! [VarCurr] :
      ( v2620(VarCurr,bitIndex10)
    <=> ( v2465(VarCurr,bitIndex36)
        & v2621(VarCurr,bitIndex10) ) ) )).

fof(writeBinaryOperatorShiftedRanges_433,axiom,(
    ! [VarCurr] :
      ( v2620(VarCurr,bitIndex11)
    <=> ( v2465(VarCurr,bitIndex37)
        & v2621(VarCurr,bitIndex11) ) ) )).

fof(writeBinaryOperatorShiftedRanges_432,axiom,(
    ! [VarCurr] :
      ( v2620(VarCurr,bitIndex12)
    <=> ( v2465(VarCurr,bitIndex38)
        & v2621(VarCurr,bitIndex12) ) ) )).

fof(writeBinaryOperatorShiftedRanges_431,axiom,(
    ! [VarCurr] :
      ( v2620(VarCurr,bitIndex13)
    <=> ( v2465(VarCurr,bitIndex39)
        & v2621(VarCurr,bitIndex13) ) ) )).

fof(addAssignment_2011,axiom,(
    ! [VarCurr] :
      ( v2621(VarCurr,bitIndex0)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_2010,axiom,(
    ! [VarCurr] :
      ( v2621(VarCurr,bitIndex1)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_2009,axiom,(
    ! [VarCurr] :
      ( v2621(VarCurr,bitIndex2)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_2008,axiom,(
    ! [VarCurr] :
      ( v2621(VarCurr,bitIndex3)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_2007,axiom,(
    ! [VarCurr] :
      ( v2621(VarCurr,bitIndex4)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_2006,axiom,(
    ! [VarCurr] :
      ( v2621(VarCurr,bitIndex5)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_2005,axiom,(
    ! [VarCurr] :
      ( v2621(VarCurr,bitIndex6)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_2004,axiom,(
    ! [VarCurr] :
      ( v2621(VarCurr,bitIndex7)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_2003,axiom,(
    ! [VarCurr] :
      ( v2621(VarCurr,bitIndex8)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_2002,axiom,(
    ! [VarCurr] :
      ( v2621(VarCurr,bitIndex9)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_2001,axiom,(
    ! [VarCurr] :
      ( v2621(VarCurr,bitIndex10)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_2000,axiom,(
    ! [VarCurr] :
      ( v2621(VarCurr,bitIndex11)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_1999,axiom,(
    ! [VarCurr] :
      ( v2621(VarCurr,bitIndex12)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_1998,axiom,(
    ! [VarCurr] :
      ( v2621(VarCurr,bitIndex13)
    <=> v2468(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesMultipleBits_66,axiom,(
    ! [VarCurr,B] :
      ( range_15_0(B)
     => ( v2609(VarCurr,B)
      <=> ( v2610(VarCurr,B)
          & v2616(VarCurr,B) ) ) ) )).

fof(addAssignment_1997,axiom,(
    ! [VarCurr] :
      ( v2616(VarCurr,bitIndex0)
    <=> v2473(VarCurr) ) )).

fof(addAssignment_1996,axiom,(
    ! [VarCurr] :
      ( v2616(VarCurr,bitIndex1)
    <=> v2473(VarCurr) ) )).

fof(addAssignment_1995,axiom,(
    ! [VarCurr] :
      ( v2616(VarCurr,bitIndex2)
    <=> v2473(VarCurr) ) )).

fof(addAssignment_1994,axiom,(
    ! [VarCurr] :
      ( v2616(VarCurr,bitIndex3)
    <=> v2473(VarCurr) ) )).

fof(addAssignment_1993,axiom,(
    ! [VarCurr] :
      ( v2616(VarCurr,bitIndex4)
    <=> v2473(VarCurr) ) )).

fof(addAssignment_1992,axiom,(
    ! [VarCurr] :
      ( v2616(VarCurr,bitIndex5)
    <=> v2473(VarCurr) ) )).

fof(addAssignment_1991,axiom,(
    ! [VarCurr] :
      ( v2616(VarCurr,bitIndex6)
    <=> v2473(VarCurr) ) )).

fof(addAssignment_1990,axiom,(
    ! [VarCurr] :
      ( v2616(VarCurr,bitIndex7)
    <=> v2473(VarCurr) ) )).

fof(addAssignment_1989,axiom,(
    ! [VarCurr] :
      ( v2616(VarCurr,bitIndex8)
    <=> v2473(VarCurr) ) )).

fof(addAssignment_1988,axiom,(
    ! [VarCurr] :
      ( v2616(VarCurr,bitIndex9)
    <=> v2473(VarCurr) ) )).

fof(addAssignment_1987,axiom,(
    ! [VarCurr] :
      ( v2616(VarCurr,bitIndex10)
    <=> v2473(VarCurr) ) )).

fof(addAssignment_1986,axiom,(
    ! [VarCurr] :
      ( v2616(VarCurr,bitIndex11)
    <=> v2473(VarCurr) ) )).

fof(addAssignment_1985,axiom,(
    ! [VarCurr] :
      ( v2616(VarCurr,bitIndex12)
    <=> v2473(VarCurr) ) )).

fof(addAssignment_1984,axiom,(
    ! [VarCurr] :
      ( v2616(VarCurr,bitIndex13)
    <=> v2473(VarCurr) ) )).

fof(addAssignment_1983,axiom,(
    ! [VarCurr] :
      ( v2616(VarCurr,bitIndex14)
    <=> v2473(VarCurr) ) )).

fof(addAssignment_1982,axiom,(
    ! [VarCurr] :
      ( v2616(VarCurr,bitIndex15)
    <=> v2473(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesMultipleBits_65,axiom,(
    ! [VarCurr,B] :
      ( range_15_0(B)
     => ( v2610(VarCurr,B)
      <=> ( v2611(VarCurr,B)
          | v2613(VarCurr,B) ) ) ) )).

fof(writeBinaryOperatorEqualRangesMultipleBits_64,axiom,(
    ! [VarCurr,B] :
      ( range_15_0(B)
     => ( v2613(VarCurr,B)
      <=> ( v2614(VarCurr,B)
          & v2615(VarCurr,B) ) ) ) )).

fof(addAssignment_1981,axiom,(
    ! [VarCurr] :
      ( v2615(VarCurr,bitIndex0)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_1980,axiom,(
    ! [VarCurr] :
      ( v2615(VarCurr,bitIndex1)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_1979,axiom,(
    ! [VarCurr] :
      ( v2615(VarCurr,bitIndex2)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_1978,axiom,(
    ! [VarCurr] :
      ( v2615(VarCurr,bitIndex3)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_1977,axiom,(
    ! [VarCurr] :
      ( v2615(VarCurr,bitIndex4)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_1976,axiom,(
    ! [VarCurr] :
      ( v2615(VarCurr,bitIndex5)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_1975,axiom,(
    ! [VarCurr] :
      ( v2615(VarCurr,bitIndex6)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_1974,axiom,(
    ! [VarCurr] :
      ( v2615(VarCurr,bitIndex7)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_1973,axiom,(
    ! [VarCurr] :
      ( v2615(VarCurr,bitIndex8)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_1972,axiom,(
    ! [VarCurr] :
      ( v2615(VarCurr,bitIndex9)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_1971,axiom,(
    ! [VarCurr] :
      ( v2615(VarCurr,bitIndex10)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_1970,axiom,(
    ! [VarCurr] :
      ( v2615(VarCurr,bitIndex11)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_1969,axiom,(
    ! [VarCurr] :
      ( v2615(VarCurr,bitIndex12)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_1968,axiom,(
    ! [VarCurr] :
      ( v2615(VarCurr,bitIndex13)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_1967,axiom,(
    ! [VarCurr] :
      ( v2615(VarCurr,bitIndex14)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_1966,axiom,(
    ! [VarCurr] :
      ( v2615(VarCurr,bitIndex15)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_1965,axiom,(
    ! [VarCurr] :
      ( ( v2614(VarCurr,bitIndex14)
      <=> v2465(VarCurr,bitIndex39) )
      & ( v2614(VarCurr,bitIndex13)
      <=> v2465(VarCurr,bitIndex38) )
      & ( v2614(VarCurr,bitIndex12)
      <=> v2465(VarCurr,bitIndex37) )
      & ( v2614(VarCurr,bitIndex11)
      <=> v2465(VarCurr,bitIndex36) )
      & ( v2614(VarCurr,bitIndex10)
      <=> v2465(VarCurr,bitIndex35) )
      & ( v2614(VarCurr,bitIndex9)
      <=> v2465(VarCurr,bitIndex34) )
      & ( v2614(VarCurr,bitIndex8)
      <=> v2465(VarCurr,bitIndex33) )
      & ( v2614(VarCurr,bitIndex7)
      <=> v2465(VarCurr,bitIndex32) )
      & ( v2614(VarCurr,bitIndex6)
      <=> v2465(VarCurr,bitIndex31) )
      & ( v2614(VarCurr,bitIndex5)
      <=> v2465(VarCurr,bitIndex30) )
      & ( v2614(VarCurr,bitIndex4)
      <=> v2465(VarCurr,bitIndex29) )
      & ( v2614(VarCurr,bitIndex3)
      <=> v2465(VarCurr,bitIndex28) )
      & ( v2614(VarCurr,bitIndex2)
      <=> v2465(VarCurr,bitIndex27) )
      & ( v2614(VarCurr,bitIndex1)
      <=> v2465(VarCurr,bitIndex26) )
      & ( v2614(VarCurr,bitIndex0)
      <=> v2465(VarCurr,bitIndex25) ) ) )).

fof(addAssignment_1964,axiom,(
    ! [VarCurr] :
      ( v2614(VarCurr,bitIndex15)
    <=> $false ) )).

fof(writeBinaryOperatorShiftedRanges_430,axiom,(
    ! [VarCurr] :
      ( v2611(VarCurr,bitIndex0)
    <=> ( v2465(VarCurr,bitIndex24)
        & v2612(VarCurr,bitIndex0) ) ) )).

fof(writeBinaryOperatorShiftedRanges_429,axiom,(
    ! [VarCurr] :
      ( v2611(VarCurr,bitIndex1)
    <=> ( v2465(VarCurr,bitIndex25)
        & v2612(VarCurr,bitIndex1) ) ) )).

fof(writeBinaryOperatorShiftedRanges_428,axiom,(
    ! [VarCurr] :
      ( v2611(VarCurr,bitIndex2)
    <=> ( v2465(VarCurr,bitIndex26)
        & v2612(VarCurr,bitIndex2) ) ) )).

fof(writeBinaryOperatorShiftedRanges_427,axiom,(
    ! [VarCurr] :
      ( v2611(VarCurr,bitIndex3)
    <=> ( v2465(VarCurr,bitIndex27)
        & v2612(VarCurr,bitIndex3) ) ) )).

fof(writeBinaryOperatorShiftedRanges_426,axiom,(
    ! [VarCurr] :
      ( v2611(VarCurr,bitIndex4)
    <=> ( v2465(VarCurr,bitIndex28)
        & v2612(VarCurr,bitIndex4) ) ) )).

fof(writeBinaryOperatorShiftedRanges_425,axiom,(
    ! [VarCurr] :
      ( v2611(VarCurr,bitIndex5)
    <=> ( v2465(VarCurr,bitIndex29)
        & v2612(VarCurr,bitIndex5) ) ) )).

fof(writeBinaryOperatorShiftedRanges_424,axiom,(
    ! [VarCurr] :
      ( v2611(VarCurr,bitIndex6)
    <=> ( v2465(VarCurr,bitIndex30)
        & v2612(VarCurr,bitIndex6) ) ) )).

fof(writeBinaryOperatorShiftedRanges_423,axiom,(
    ! [VarCurr] :
      ( v2611(VarCurr,bitIndex7)
    <=> ( v2465(VarCurr,bitIndex31)
        & v2612(VarCurr,bitIndex7) ) ) )).

fof(writeBinaryOperatorShiftedRanges_422,axiom,(
    ! [VarCurr] :
      ( v2611(VarCurr,bitIndex8)
    <=> ( v2465(VarCurr,bitIndex32)
        & v2612(VarCurr,bitIndex8) ) ) )).

fof(writeBinaryOperatorShiftedRanges_421,axiom,(
    ! [VarCurr] :
      ( v2611(VarCurr,bitIndex9)
    <=> ( v2465(VarCurr,bitIndex33)
        & v2612(VarCurr,bitIndex9) ) ) )).

fof(writeBinaryOperatorShiftedRanges_420,axiom,(
    ! [VarCurr] :
      ( v2611(VarCurr,bitIndex10)
    <=> ( v2465(VarCurr,bitIndex34)
        & v2612(VarCurr,bitIndex10) ) ) )).

fof(writeBinaryOperatorShiftedRanges_419,axiom,(
    ! [VarCurr] :
      ( v2611(VarCurr,bitIndex11)
    <=> ( v2465(VarCurr,bitIndex35)
        & v2612(VarCurr,bitIndex11) ) ) )).

fof(writeBinaryOperatorShiftedRanges_418,axiom,(
    ! [VarCurr] :
      ( v2611(VarCurr,bitIndex12)
    <=> ( v2465(VarCurr,bitIndex36)
        & v2612(VarCurr,bitIndex12) ) ) )).

fof(writeBinaryOperatorShiftedRanges_417,axiom,(
    ! [VarCurr] :
      ( v2611(VarCurr,bitIndex13)
    <=> ( v2465(VarCurr,bitIndex37)
        & v2612(VarCurr,bitIndex13) ) ) )).

fof(writeBinaryOperatorShiftedRanges_416,axiom,(
    ! [VarCurr] :
      ( v2611(VarCurr,bitIndex14)
    <=> ( v2465(VarCurr,bitIndex38)
        & v2612(VarCurr,bitIndex14) ) ) )).

fof(writeBinaryOperatorShiftedRanges_415,axiom,(
    ! [VarCurr] :
      ( v2611(VarCurr,bitIndex15)
    <=> ( v2465(VarCurr,bitIndex39)
        & v2612(VarCurr,bitIndex15) ) ) )).

fof(addAssignment_1963,axiom,(
    ! [VarCurr] :
      ( v2612(VarCurr,bitIndex0)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_1962,axiom,(
    ! [VarCurr] :
      ( v2612(VarCurr,bitIndex1)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_1961,axiom,(
    ! [VarCurr] :
      ( v2612(VarCurr,bitIndex2)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_1960,axiom,(
    ! [VarCurr] :
      ( v2612(VarCurr,bitIndex3)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_1959,axiom,(
    ! [VarCurr] :
      ( v2612(VarCurr,bitIndex4)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_1958,axiom,(
    ! [VarCurr] :
      ( v2612(VarCurr,bitIndex5)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_1957,axiom,(
    ! [VarCurr] :
      ( v2612(VarCurr,bitIndex6)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_1956,axiom,(
    ! [VarCurr] :
      ( v2612(VarCurr,bitIndex7)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_1955,axiom,(
    ! [VarCurr] :
      ( v2612(VarCurr,bitIndex8)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_1954,axiom,(
    ! [VarCurr] :
      ( v2612(VarCurr,bitIndex9)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_1953,axiom,(
    ! [VarCurr] :
      ( v2612(VarCurr,bitIndex10)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_1952,axiom,(
    ! [VarCurr] :
      ( v2612(VarCurr,bitIndex11)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_1951,axiom,(
    ! [VarCurr] :
      ( v2612(VarCurr,bitIndex12)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_1950,axiom,(
    ! [VarCurr] :
      ( v2612(VarCurr,bitIndex13)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_1949,axiom,(
    ! [VarCurr] :
      ( v2612(VarCurr,bitIndex14)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_1948,axiom,(
    ! [VarCurr] :
      ( v2612(VarCurr,bitIndex15)
    <=> v2468(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesMultipleBits_63,axiom,(
    ! [VarCurr,B] :
      ( range_23_0(B)
     => ( v2560(VarCurr,B)
      <=> ( v2561(VarCurr,B)
          & v2603(VarCurr,B) ) ) ) )).

fof(addAssignment_1947,axiom,(
    ! [VarCurr] :
      ( v2603(VarCurr,bitIndex0)
    <=> v2507(VarCurr) ) )).

fof(addAssignment_1946,axiom,(
    ! [VarCurr] :
      ( v2603(VarCurr,bitIndex1)
    <=> v2507(VarCurr) ) )).

fof(addAssignment_1945,axiom,(
    ! [VarCurr] :
      ( v2603(VarCurr,bitIndex2)
    <=> v2507(VarCurr) ) )).

fof(addAssignment_1944,axiom,(
    ! [VarCurr] :
      ( v2603(VarCurr,bitIndex3)
    <=> v2507(VarCurr) ) )).

fof(addAssignment_1943,axiom,(
    ! [VarCurr] :
      ( v2603(VarCurr,bitIndex4)
    <=> v2507(VarCurr) ) )).

fof(addAssignment_1942,axiom,(
    ! [VarCurr] :
      ( v2603(VarCurr,bitIndex5)
    <=> v2507(VarCurr) ) )).

fof(addAssignment_1941,axiom,(
    ! [VarCurr] :
      ( v2603(VarCurr,bitIndex6)
    <=> v2507(VarCurr) ) )).

fof(addAssignment_1940,axiom,(
    ! [VarCurr] :
      ( v2603(VarCurr,bitIndex7)
    <=> v2507(VarCurr) ) )).

fof(addAssignment_1939,axiom,(
    ! [VarCurr] :
      ( v2603(VarCurr,bitIndex8)
    <=> v2507(VarCurr) ) )).

fof(addAssignment_1938,axiom,(
    ! [VarCurr] :
      ( v2603(VarCurr,bitIndex9)
    <=> v2507(VarCurr) ) )).

fof(addAssignment_1937,axiom,(
    ! [VarCurr] :
      ( v2603(VarCurr,bitIndex10)
    <=> v2507(VarCurr) ) )).

fof(addAssignment_1936,axiom,(
    ! [VarCurr] :
      ( v2603(VarCurr,bitIndex11)
    <=> v2507(VarCurr) ) )).

fof(addAssignment_1935,axiom,(
    ! [VarCurr] :
      ( v2603(VarCurr,bitIndex12)
    <=> v2507(VarCurr) ) )).

fof(addAssignment_1934,axiom,(
    ! [VarCurr] :
      ( v2603(VarCurr,bitIndex13)
    <=> v2507(VarCurr) ) )).

fof(addAssignment_1933,axiom,(
    ! [VarCurr] :
      ( v2603(VarCurr,bitIndex14)
    <=> v2507(VarCurr) ) )).

fof(addAssignment_1932,axiom,(
    ! [VarCurr] :
      ( v2603(VarCurr,bitIndex15)
    <=> v2507(VarCurr) ) )).

fof(addAssignment_1931,axiom,(
    ! [VarCurr] :
      ( v2603(VarCurr,bitIndex16)
    <=> v2507(VarCurr) ) )).

fof(addAssignment_1930,axiom,(
    ! [VarCurr] :
      ( v2603(VarCurr,bitIndex17)
    <=> v2507(VarCurr) ) )).

fof(addAssignment_1929,axiom,(
    ! [VarCurr] :
      ( v2603(VarCurr,bitIndex18)
    <=> v2507(VarCurr) ) )).

fof(addAssignment_1928,axiom,(
    ! [VarCurr] :
      ( v2603(VarCurr,bitIndex19)
    <=> v2507(VarCurr) ) )).

fof(addAssignment_1927,axiom,(
    ! [VarCurr] :
      ( v2603(VarCurr,bitIndex20)
    <=> v2507(VarCurr) ) )).

fof(addAssignment_1926,axiom,(
    ! [VarCurr] :
      ( v2603(VarCurr,bitIndex21)
    <=> v2507(VarCurr) ) )).

fof(addAssignment_1925,axiom,(
    ! [VarCurr] :
      ( v2603(VarCurr,bitIndex22)
    <=> v2507(VarCurr) ) )).

fof(addAssignment_1924,axiom,(
    ! [VarCurr] :
      ( v2603(VarCurr,bitIndex23)
    <=> v2507(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesMultipleBits_62,axiom,(
    ! [VarCurr,B] :
      ( range_23_0(B)
     => ( v2561(VarCurr,B)
      <=> ( v2562(VarCurr,B)
          | v2582(VarCurr,B) ) ) ) )).

fof(writeBinaryOperatorEqualRangesMultipleBits_61,axiom,(
    ! [VarCurr,B] :
      ( range_23_0(B)
     => ( v2582(VarCurr,B)
      <=> ( v2583(VarCurr,B)
          & v2602(VarCurr,B) ) ) ) )).

fof(addAssignment_1923,axiom,(
    ! [VarCurr] :
      ( v2602(VarCurr,bitIndex0)
    <=> v2453(VarCurr,bitIndex2) ) )).

fof(addAssignment_1922,axiom,(
    ! [VarCurr] :
      ( v2602(VarCurr,bitIndex1)
    <=> v2453(VarCurr,bitIndex2) ) )).

fof(addAssignment_1921,axiom,(
    ! [VarCurr] :
      ( v2602(VarCurr,bitIndex2)
    <=> v2453(VarCurr,bitIndex2) ) )).

fof(addAssignment_1920,axiom,(
    ! [VarCurr] :
      ( v2602(VarCurr,bitIndex3)
    <=> v2453(VarCurr,bitIndex2) ) )).

fof(addAssignment_1919,axiom,(
    ! [VarCurr] :
      ( v2602(VarCurr,bitIndex4)
    <=> v2453(VarCurr,bitIndex2) ) )).

fof(addAssignment_1918,axiom,(
    ! [VarCurr] :
      ( v2602(VarCurr,bitIndex5)
    <=> v2453(VarCurr,bitIndex2) ) )).

fof(addAssignment_1917,axiom,(
    ! [VarCurr] :
      ( v2602(VarCurr,bitIndex6)
    <=> v2453(VarCurr,bitIndex2) ) )).

fof(addAssignment_1916,axiom,(
    ! [VarCurr] :
      ( v2602(VarCurr,bitIndex7)
    <=> v2453(VarCurr,bitIndex2) ) )).

fof(addAssignment_1915,axiom,(
    ! [VarCurr] :
      ( v2602(VarCurr,bitIndex8)
    <=> v2453(VarCurr,bitIndex2) ) )).

fof(addAssignment_1914,axiom,(
    ! [VarCurr] :
      ( v2602(VarCurr,bitIndex9)
    <=> v2453(VarCurr,bitIndex2) ) )).

fof(addAssignment_1913,axiom,(
    ! [VarCurr] :
      ( v2602(VarCurr,bitIndex10)
    <=> v2453(VarCurr,bitIndex2) ) )).

fof(addAssignment_1912,axiom,(
    ! [VarCurr] :
      ( v2602(VarCurr,bitIndex11)
    <=> v2453(VarCurr,bitIndex2) ) )).

fof(addAssignment_1911,axiom,(
    ! [VarCurr] :
      ( v2602(VarCurr,bitIndex12)
    <=> v2453(VarCurr,bitIndex2) ) )).

fof(addAssignment_1910,axiom,(
    ! [VarCurr] :
      ( v2602(VarCurr,bitIndex13)
    <=> v2453(VarCurr,bitIndex2) ) )).

fof(addAssignment_1909,axiom,(
    ! [VarCurr] :
      ( v2602(VarCurr,bitIndex14)
    <=> v2453(VarCurr,bitIndex2) ) )).

fof(addAssignment_1908,axiom,(
    ! [VarCurr] :
      ( v2602(VarCurr,bitIndex15)
    <=> v2453(VarCurr,bitIndex2) ) )).

fof(addAssignment_1907,axiom,(
    ! [VarCurr] :
      ( v2602(VarCurr,bitIndex16)
    <=> v2453(VarCurr,bitIndex2) ) )).

fof(addAssignment_1906,axiom,(
    ! [VarCurr] :
      ( v2602(VarCurr,bitIndex17)
    <=> v2453(VarCurr,bitIndex2) ) )).

fof(addAssignment_1905,axiom,(
    ! [VarCurr] :
      ( v2602(VarCurr,bitIndex18)
    <=> v2453(VarCurr,bitIndex2) ) )).

fof(addAssignment_1904,axiom,(
    ! [VarCurr] :
      ( v2602(VarCurr,bitIndex19)
    <=> v2453(VarCurr,bitIndex2) ) )).

fof(addAssignment_1903,axiom,(
    ! [VarCurr] :
      ( v2602(VarCurr,bitIndex20)
    <=> v2453(VarCurr,bitIndex2) ) )).

fof(addAssignment_1902,axiom,(
    ! [VarCurr] :
      ( v2602(VarCurr,bitIndex21)
    <=> v2453(VarCurr,bitIndex2) ) )).

fof(addAssignment_1901,axiom,(
    ! [VarCurr] :
      ( v2602(VarCurr,bitIndex22)
    <=> v2453(VarCurr,bitIndex2) ) )).

fof(addAssignment_1900,axiom,(
    ! [VarCurr] :
      ( v2602(VarCurr,bitIndex23)
    <=> v2453(VarCurr,bitIndex2) ) )).

fof(addAssignment_1899,axiom,(
    ! [VarCurr,B] :
      ( range_19_0(B)
     => ( v2583(VarCurr,B)
      <=> v2584(VarCurr,B) ) ) )).

fof(addAssignment_1898,axiom,(
    ! [VarCurr] :
      ( ( v2583(VarCurr,bitIndex23)
      <=> $false )
      & ( v2583(VarCurr,bitIndex22)
      <=> $false )
      & ( v2583(VarCurr,bitIndex21)
      <=> $false )
      & ( v2583(VarCurr,bitIndex20)
      <=> $false ) ) )).

fof(writeBinaryOperatorEqualRangesMultipleBits_60,axiom,(
    ! [VarCurr,B] :
      ( range_19_0(B)
     => ( v2584(VarCurr,B)
      <=> ( v2585(VarCurr,B)
          | v2593(VarCurr,B) ) ) ) )).

fof(writeBinaryOperatorEqualRangesMultipleBits_59,axiom,(
    ! [VarCurr,B] :
      ( range_19_0(B)
     => ( v2593(VarCurr,B)
      <=> ( v2594(VarCurr,B)
          & v2601(VarCurr,B) ) ) ) )).

fof(addAssignment_1897,axiom,(
    ! [VarCurr] :
      ( v2601(VarCurr,bitIndex0)
    <=> v2453(VarCurr,bitIndex1) ) )).

fof(addAssignment_1896,axiom,(
    ! [VarCurr] :
      ( v2601(VarCurr,bitIndex1)
    <=> v2453(VarCurr,bitIndex1) ) )).

fof(addAssignment_1895,axiom,(
    ! [VarCurr] :
      ( v2601(VarCurr,bitIndex2)
    <=> v2453(VarCurr,bitIndex1) ) )).

fof(addAssignment_1894,axiom,(
    ! [VarCurr] :
      ( v2601(VarCurr,bitIndex3)
    <=> v2453(VarCurr,bitIndex1) ) )).

fof(addAssignment_1893,axiom,(
    ! [VarCurr] :
      ( v2601(VarCurr,bitIndex4)
    <=> v2453(VarCurr,bitIndex1) ) )).

fof(addAssignment_1892,axiom,(
    ! [VarCurr] :
      ( v2601(VarCurr,bitIndex5)
    <=> v2453(VarCurr,bitIndex1) ) )).

fof(addAssignment_1891,axiom,(
    ! [VarCurr] :
      ( v2601(VarCurr,bitIndex6)
    <=> v2453(VarCurr,bitIndex1) ) )).

fof(addAssignment_1890,axiom,(
    ! [VarCurr] :
      ( v2601(VarCurr,bitIndex7)
    <=> v2453(VarCurr,bitIndex1) ) )).

fof(addAssignment_1889,axiom,(
    ! [VarCurr] :
      ( v2601(VarCurr,bitIndex8)
    <=> v2453(VarCurr,bitIndex1) ) )).

fof(addAssignment_1888,axiom,(
    ! [VarCurr] :
      ( v2601(VarCurr,bitIndex9)
    <=> v2453(VarCurr,bitIndex1) ) )).

fof(addAssignment_1887,axiom,(
    ! [VarCurr] :
      ( v2601(VarCurr,bitIndex10)
    <=> v2453(VarCurr,bitIndex1) ) )).

fof(addAssignment_1886,axiom,(
    ! [VarCurr] :
      ( v2601(VarCurr,bitIndex11)
    <=> v2453(VarCurr,bitIndex1) ) )).

fof(addAssignment_1885,axiom,(
    ! [VarCurr] :
      ( v2601(VarCurr,bitIndex12)
    <=> v2453(VarCurr,bitIndex1) ) )).

fof(addAssignment_1884,axiom,(
    ! [VarCurr] :
      ( v2601(VarCurr,bitIndex13)
    <=> v2453(VarCurr,bitIndex1) ) )).

fof(addAssignment_1883,axiom,(
    ! [VarCurr] :
      ( v2601(VarCurr,bitIndex14)
    <=> v2453(VarCurr,bitIndex1) ) )).

fof(addAssignment_1882,axiom,(
    ! [VarCurr] :
      ( v2601(VarCurr,bitIndex15)
    <=> v2453(VarCurr,bitIndex1) ) )).

fof(addAssignment_1881,axiom,(
    ! [VarCurr] :
      ( v2601(VarCurr,bitIndex16)
    <=> v2453(VarCurr,bitIndex1) ) )).

fof(addAssignment_1880,axiom,(
    ! [VarCurr] :
      ( v2601(VarCurr,bitIndex17)
    <=> v2453(VarCurr,bitIndex1) ) )).

fof(addAssignment_1879,axiom,(
    ! [VarCurr] :
      ( v2601(VarCurr,bitIndex18)
    <=> v2453(VarCurr,bitIndex1) ) )).

fof(addAssignment_1878,axiom,(
    ! [VarCurr] :
      ( v2601(VarCurr,bitIndex19)
    <=> v2453(VarCurr,bitIndex1) ) )).

fof(addAssignment_1877,axiom,(
    ! [VarCurr,B] :
      ( range_17_0(B)
     => ( v2594(VarCurr,B)
      <=> v2595(VarCurr,B) ) ) )).

fof(addAssignment_1876,axiom,(
    ! [VarCurr] :
      ( ( v2594(VarCurr,bitIndex19)
      <=> $false )
      & ( v2594(VarCurr,bitIndex18)
      <=> $false ) ) )).

fof(writeBinaryOperatorEqualRangesMultipleBits_58,axiom,(
    ! [VarCurr,B] :
      ( range_17_0(B)
     => ( v2595(VarCurr,B)
      <=> ( v2596(VarCurr,B)
          | v2598(VarCurr,B) ) ) ) )).

fof(writeBinaryOperatorEqualRangesMultipleBits_57,axiom,(
    ! [VarCurr,B] :
      ( range_17_0(B)
     => ( v2598(VarCurr,B)
      <=> ( v2599(VarCurr,B)
          & v2600(VarCurr,B) ) ) ) )).

fof(addAssignment_1875,axiom,(
    ! [VarCurr] :
      ( v2600(VarCurr,bitIndex0)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_1874,axiom,(
    ! [VarCurr] :
      ( v2600(VarCurr,bitIndex1)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_1873,axiom,(
    ! [VarCurr] :
      ( v2600(VarCurr,bitIndex2)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_1872,axiom,(
    ! [VarCurr] :
      ( v2600(VarCurr,bitIndex3)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_1871,axiom,(
    ! [VarCurr] :
      ( v2600(VarCurr,bitIndex4)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_1870,axiom,(
    ! [VarCurr] :
      ( v2600(VarCurr,bitIndex5)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_1869,axiom,(
    ! [VarCurr] :
      ( v2600(VarCurr,bitIndex6)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_1868,axiom,(
    ! [VarCurr] :
      ( v2600(VarCurr,bitIndex7)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_1867,axiom,(
    ! [VarCurr] :
      ( v2600(VarCurr,bitIndex8)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_1866,axiom,(
    ! [VarCurr] :
      ( v2600(VarCurr,bitIndex9)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_1865,axiom,(
    ! [VarCurr] :
      ( v2600(VarCurr,bitIndex10)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_1864,axiom,(
    ! [VarCurr] :
      ( v2600(VarCurr,bitIndex11)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_1863,axiom,(
    ! [VarCurr] :
      ( v2600(VarCurr,bitIndex12)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_1862,axiom,(
    ! [VarCurr] :
      ( v2600(VarCurr,bitIndex13)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_1861,axiom,(
    ! [VarCurr] :
      ( v2600(VarCurr,bitIndex14)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_1860,axiom,(
    ! [VarCurr] :
      ( v2600(VarCurr,bitIndex15)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_1859,axiom,(
    ! [VarCurr] :
      ( v2600(VarCurr,bitIndex16)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_1858,axiom,(
    ! [VarCurr] :
      ( v2600(VarCurr,bitIndex17)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_1857,axiom,(
    ! [VarCurr] :
      ( ( v2599(VarCurr,bitIndex16)
      <=> v2465(VarCurr,bitIndex39) )
      & ( v2599(VarCurr,bitIndex15)
      <=> v2465(VarCurr,bitIndex38) )
      & ( v2599(VarCurr,bitIndex14)
      <=> v2465(VarCurr,bitIndex37) )
      & ( v2599(VarCurr,bitIndex13)
      <=> v2465(VarCurr,bitIndex36) )
      & ( v2599(VarCurr,bitIndex12)
      <=> v2465(VarCurr,bitIndex35) )
      & ( v2599(VarCurr,bitIndex11)
      <=> v2465(VarCurr,bitIndex34) )
      & ( v2599(VarCurr,bitIndex10)
      <=> v2465(VarCurr,bitIndex33) )
      & ( v2599(VarCurr,bitIndex9)
      <=> v2465(VarCurr,bitIndex32) )
      & ( v2599(VarCurr,bitIndex8)
      <=> v2465(VarCurr,bitIndex31) )
      & ( v2599(VarCurr,bitIndex7)
      <=> v2465(VarCurr,bitIndex30) )
      & ( v2599(VarCurr,bitIndex6)
      <=> v2465(VarCurr,bitIndex29) )
      & ( v2599(VarCurr,bitIndex5)
      <=> v2465(VarCurr,bitIndex28) )
      & ( v2599(VarCurr,bitIndex4)
      <=> v2465(VarCurr,bitIndex27) )
      & ( v2599(VarCurr,bitIndex3)
      <=> v2465(VarCurr,bitIndex26) )
      & ( v2599(VarCurr,bitIndex2)
      <=> v2465(VarCurr,bitIndex25) )
      & ( v2599(VarCurr,bitIndex1)
      <=> v2465(VarCurr,bitIndex24) )
      & ( v2599(VarCurr,bitIndex0)
      <=> v2465(VarCurr,bitIndex23) ) ) )).

fof(addAssignment_1856,axiom,(
    ! [VarCurr] :
      ( v2599(VarCurr,bitIndex17)
    <=> $false ) )).

fof(writeBinaryOperatorShiftedRanges_414,axiom,(
    ! [VarCurr] :
      ( v2596(VarCurr,bitIndex0)
    <=> ( v2465(VarCurr,bitIndex22)
        & v2597(VarCurr,bitIndex0) ) ) )).

fof(writeBinaryOperatorShiftedRanges_413,axiom,(
    ! [VarCurr] :
      ( v2596(VarCurr,bitIndex1)
    <=> ( v2465(VarCurr,bitIndex23)
        & v2597(VarCurr,bitIndex1) ) ) )).

fof(writeBinaryOperatorShiftedRanges_412,axiom,(
    ! [VarCurr] :
      ( v2596(VarCurr,bitIndex2)
    <=> ( v2465(VarCurr,bitIndex24)
        & v2597(VarCurr,bitIndex2) ) ) )).

fof(writeBinaryOperatorShiftedRanges_411,axiom,(
    ! [VarCurr] :
      ( v2596(VarCurr,bitIndex3)
    <=> ( v2465(VarCurr,bitIndex25)
        & v2597(VarCurr,bitIndex3) ) ) )).

fof(writeBinaryOperatorShiftedRanges_410,axiom,(
    ! [VarCurr] :
      ( v2596(VarCurr,bitIndex4)
    <=> ( v2465(VarCurr,bitIndex26)
        & v2597(VarCurr,bitIndex4) ) ) )).

fof(writeBinaryOperatorShiftedRanges_409,axiom,(
    ! [VarCurr] :
      ( v2596(VarCurr,bitIndex5)
    <=> ( v2465(VarCurr,bitIndex27)
        & v2597(VarCurr,bitIndex5) ) ) )).

fof(writeBinaryOperatorShiftedRanges_408,axiom,(
    ! [VarCurr] :
      ( v2596(VarCurr,bitIndex6)
    <=> ( v2465(VarCurr,bitIndex28)
        & v2597(VarCurr,bitIndex6) ) ) )).

fof(writeBinaryOperatorShiftedRanges_407,axiom,(
    ! [VarCurr] :
      ( v2596(VarCurr,bitIndex7)
    <=> ( v2465(VarCurr,bitIndex29)
        & v2597(VarCurr,bitIndex7) ) ) )).

fof(writeBinaryOperatorShiftedRanges_406,axiom,(
    ! [VarCurr] :
      ( v2596(VarCurr,bitIndex8)
    <=> ( v2465(VarCurr,bitIndex30)
        & v2597(VarCurr,bitIndex8) ) ) )).

fof(writeBinaryOperatorShiftedRanges_405,axiom,(
    ! [VarCurr] :
      ( v2596(VarCurr,bitIndex9)
    <=> ( v2465(VarCurr,bitIndex31)
        & v2597(VarCurr,bitIndex9) ) ) )).

fof(writeBinaryOperatorShiftedRanges_404,axiom,(
    ! [VarCurr] :
      ( v2596(VarCurr,bitIndex10)
    <=> ( v2465(VarCurr,bitIndex32)
        & v2597(VarCurr,bitIndex10) ) ) )).

fof(writeBinaryOperatorShiftedRanges_403,axiom,(
    ! [VarCurr] :
      ( v2596(VarCurr,bitIndex11)
    <=> ( v2465(VarCurr,bitIndex33)
        & v2597(VarCurr,bitIndex11) ) ) )).

fof(writeBinaryOperatorShiftedRanges_402,axiom,(
    ! [VarCurr] :
      ( v2596(VarCurr,bitIndex12)
    <=> ( v2465(VarCurr,bitIndex34)
        & v2597(VarCurr,bitIndex12) ) ) )).

fof(writeBinaryOperatorShiftedRanges_401,axiom,(
    ! [VarCurr] :
      ( v2596(VarCurr,bitIndex13)
    <=> ( v2465(VarCurr,bitIndex35)
        & v2597(VarCurr,bitIndex13) ) ) )).

fof(writeBinaryOperatorShiftedRanges_400,axiom,(
    ! [VarCurr] :
      ( v2596(VarCurr,bitIndex14)
    <=> ( v2465(VarCurr,bitIndex36)
        & v2597(VarCurr,bitIndex14) ) ) )).

fof(writeBinaryOperatorShiftedRanges_399,axiom,(
    ! [VarCurr] :
      ( v2596(VarCurr,bitIndex15)
    <=> ( v2465(VarCurr,bitIndex37)
        & v2597(VarCurr,bitIndex15) ) ) )).

fof(writeBinaryOperatorShiftedRanges_398,axiom,(
    ! [VarCurr] :
      ( v2596(VarCurr,bitIndex16)
    <=> ( v2465(VarCurr,bitIndex38)
        & v2597(VarCurr,bitIndex16) ) ) )).

fof(writeBinaryOperatorShiftedRanges_397,axiom,(
    ! [VarCurr] :
      ( v2596(VarCurr,bitIndex17)
    <=> ( v2465(VarCurr,bitIndex39)
        & v2597(VarCurr,bitIndex17) ) ) )).

fof(addAssignment_1855,axiom,(
    ! [VarCurr] :
      ( v2597(VarCurr,bitIndex0)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_1854,axiom,(
    ! [VarCurr] :
      ( v2597(VarCurr,bitIndex1)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_1853,axiom,(
    ! [VarCurr] :
      ( v2597(VarCurr,bitIndex2)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_1852,axiom,(
    ! [VarCurr] :
      ( v2597(VarCurr,bitIndex3)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_1851,axiom,(
    ! [VarCurr] :
      ( v2597(VarCurr,bitIndex4)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_1850,axiom,(
    ! [VarCurr] :
      ( v2597(VarCurr,bitIndex5)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_1849,axiom,(
    ! [VarCurr] :
      ( v2597(VarCurr,bitIndex6)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_1848,axiom,(
    ! [VarCurr] :
      ( v2597(VarCurr,bitIndex7)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_1847,axiom,(
    ! [VarCurr] :
      ( v2597(VarCurr,bitIndex8)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_1846,axiom,(
    ! [VarCurr] :
      ( v2597(VarCurr,bitIndex9)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_1845,axiom,(
    ! [VarCurr] :
      ( v2597(VarCurr,bitIndex10)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_1844,axiom,(
    ! [VarCurr] :
      ( v2597(VarCurr,bitIndex11)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_1843,axiom,(
    ! [VarCurr] :
      ( v2597(VarCurr,bitIndex12)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_1842,axiom,(
    ! [VarCurr] :
      ( v2597(VarCurr,bitIndex13)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_1841,axiom,(
    ! [VarCurr] :
      ( v2597(VarCurr,bitIndex14)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_1840,axiom,(
    ! [VarCurr] :
      ( v2597(VarCurr,bitIndex15)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_1839,axiom,(
    ! [VarCurr] :
      ( v2597(VarCurr,bitIndex16)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_1838,axiom,(
    ! [VarCurr] :
      ( v2597(VarCurr,bitIndex17)
    <=> v2468(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesMultipleBits_56,axiom,(
    ! [VarCurr,B] :
      ( range_19_0(B)
     => ( v2585(VarCurr,B)
      <=> ( v2586(VarCurr,B)
          & v2592(VarCurr,B) ) ) ) )).

fof(addAssignment_1837,axiom,(
    ! [VarCurr] :
      ( v2592(VarCurr,bitIndex0)
    <=> v2473(VarCurr) ) )).

fof(addAssignment_1836,axiom,(
    ! [VarCurr] :
      ( v2592(VarCurr,bitIndex1)
    <=> v2473(VarCurr) ) )).

fof(addAssignment_1835,axiom,(
    ! [VarCurr] :
      ( v2592(VarCurr,bitIndex2)
    <=> v2473(VarCurr) ) )).

fof(addAssignment_1834,axiom,(
    ! [VarCurr] :
      ( v2592(VarCurr,bitIndex3)
    <=> v2473(VarCurr) ) )).

fof(addAssignment_1833,axiom,(
    ! [VarCurr] :
      ( v2592(VarCurr,bitIndex4)
    <=> v2473(VarCurr) ) )).

fof(addAssignment_1832,axiom,(
    ! [VarCurr] :
      ( v2592(VarCurr,bitIndex5)
    <=> v2473(VarCurr) ) )).

fof(addAssignment_1831,axiom,(
    ! [VarCurr] :
      ( v2592(VarCurr,bitIndex6)
    <=> v2473(VarCurr) ) )).

fof(addAssignment_1830,axiom,(
    ! [VarCurr] :
      ( v2592(VarCurr,bitIndex7)
    <=> v2473(VarCurr) ) )).

fof(addAssignment_1829,axiom,(
    ! [VarCurr] :
      ( v2592(VarCurr,bitIndex8)
    <=> v2473(VarCurr) ) )).

fof(addAssignment_1828,axiom,(
    ! [VarCurr] :
      ( v2592(VarCurr,bitIndex9)
    <=> v2473(VarCurr) ) )).

fof(addAssignment_1827,axiom,(
    ! [VarCurr] :
      ( v2592(VarCurr,bitIndex10)
    <=> v2473(VarCurr) ) )).

fof(addAssignment_1826,axiom,(
    ! [VarCurr] :
      ( v2592(VarCurr,bitIndex11)
    <=> v2473(VarCurr) ) )).

fof(addAssignment_1825,axiom,(
    ! [VarCurr] :
      ( v2592(VarCurr,bitIndex12)
    <=> v2473(VarCurr) ) )).

fof(addAssignment_1824,axiom,(
    ! [VarCurr] :
      ( v2592(VarCurr,bitIndex13)
    <=> v2473(VarCurr) ) )).

fof(addAssignment_1823,axiom,(
    ! [VarCurr] :
      ( v2592(VarCurr,bitIndex14)
    <=> v2473(VarCurr) ) )).

fof(addAssignment_1822,axiom,(
    ! [VarCurr] :
      ( v2592(VarCurr,bitIndex15)
    <=> v2473(VarCurr) ) )).

fof(addAssignment_1821,axiom,(
    ! [VarCurr] :
      ( v2592(VarCurr,bitIndex16)
    <=> v2473(VarCurr) ) )).

fof(addAssignment_1820,axiom,(
    ! [VarCurr] :
      ( v2592(VarCurr,bitIndex17)
    <=> v2473(VarCurr) ) )).

fof(addAssignment_1819,axiom,(
    ! [VarCurr] :
      ( v2592(VarCurr,bitIndex18)
    <=> v2473(VarCurr) ) )).

fof(addAssignment_1818,axiom,(
    ! [VarCurr] :
      ( v2592(VarCurr,bitIndex19)
    <=> v2473(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesMultipleBits_55,axiom,(
    ! [VarCurr,B] :
      ( range_19_0(B)
     => ( v2586(VarCurr,B)
      <=> ( v2587(VarCurr,B)
          | v2589(VarCurr,B) ) ) ) )).

fof(writeBinaryOperatorEqualRangesMultipleBits_54,axiom,(
    ! [VarCurr,B] :
      ( range_19_0(B)
     => ( v2589(VarCurr,B)
      <=> ( v2590(VarCurr,B)
          & v2591(VarCurr,B) ) ) ) )).

fof(range_axiom_24,axiom,(
    ! [B] :
      ( range_19_0(B)
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
        | bitIndex19 = B ) ) )).

fof(addAssignment_1817,axiom,(
    ! [VarCurr] :
      ( v2591(VarCurr,bitIndex0)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_1816,axiom,(
    ! [VarCurr] :
      ( v2591(VarCurr,bitIndex1)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_1815,axiom,(
    ! [VarCurr] :
      ( v2591(VarCurr,bitIndex2)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_1814,axiom,(
    ! [VarCurr] :
      ( v2591(VarCurr,bitIndex3)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_1813,axiom,(
    ! [VarCurr] :
      ( v2591(VarCurr,bitIndex4)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_1812,axiom,(
    ! [VarCurr] :
      ( v2591(VarCurr,bitIndex5)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_1811,axiom,(
    ! [VarCurr] :
      ( v2591(VarCurr,bitIndex6)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_1810,axiom,(
    ! [VarCurr] :
      ( v2591(VarCurr,bitIndex7)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_1809,axiom,(
    ! [VarCurr] :
      ( v2591(VarCurr,bitIndex8)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_1808,axiom,(
    ! [VarCurr] :
      ( v2591(VarCurr,bitIndex9)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_1807,axiom,(
    ! [VarCurr] :
      ( v2591(VarCurr,bitIndex10)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_1806,axiom,(
    ! [VarCurr] :
      ( v2591(VarCurr,bitIndex11)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_1805,axiom,(
    ! [VarCurr] :
      ( v2591(VarCurr,bitIndex12)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_1804,axiom,(
    ! [VarCurr] :
      ( v2591(VarCurr,bitIndex13)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_1803,axiom,(
    ! [VarCurr] :
      ( v2591(VarCurr,bitIndex14)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_1802,axiom,(
    ! [VarCurr] :
      ( v2591(VarCurr,bitIndex15)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_1801,axiom,(
    ! [VarCurr] :
      ( v2591(VarCurr,bitIndex16)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_1800,axiom,(
    ! [VarCurr] :
      ( v2591(VarCurr,bitIndex17)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_1799,axiom,(
    ! [VarCurr] :
      ( v2591(VarCurr,bitIndex18)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_1798,axiom,(
    ! [VarCurr] :
      ( v2591(VarCurr,bitIndex19)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_1797,axiom,(
    ! [VarCurr] :
      ( ( v2590(VarCurr,bitIndex18)
      <=> v2465(VarCurr,bitIndex39) )
      & ( v2590(VarCurr,bitIndex17)
      <=> v2465(VarCurr,bitIndex38) )
      & ( v2590(VarCurr,bitIndex16)
      <=> v2465(VarCurr,bitIndex37) )
      & ( v2590(VarCurr,bitIndex15)
      <=> v2465(VarCurr,bitIndex36) )
      & ( v2590(VarCurr,bitIndex14)
      <=> v2465(VarCurr,bitIndex35) )
      & ( v2590(VarCurr,bitIndex13)
      <=> v2465(VarCurr,bitIndex34) )
      & ( v2590(VarCurr,bitIndex12)
      <=> v2465(VarCurr,bitIndex33) )
      & ( v2590(VarCurr,bitIndex11)
      <=> v2465(VarCurr,bitIndex32) )
      & ( v2590(VarCurr,bitIndex10)
      <=> v2465(VarCurr,bitIndex31) )
      & ( v2590(VarCurr,bitIndex9)
      <=> v2465(VarCurr,bitIndex30) )
      & ( v2590(VarCurr,bitIndex8)
      <=> v2465(VarCurr,bitIndex29) )
      & ( v2590(VarCurr,bitIndex7)
      <=> v2465(VarCurr,bitIndex28) )
      & ( v2590(VarCurr,bitIndex6)
      <=> v2465(VarCurr,bitIndex27) )
      & ( v2590(VarCurr,bitIndex5)
      <=> v2465(VarCurr,bitIndex26) )
      & ( v2590(VarCurr,bitIndex4)
      <=> v2465(VarCurr,bitIndex25) )
      & ( v2590(VarCurr,bitIndex3)
      <=> v2465(VarCurr,bitIndex24) )
      & ( v2590(VarCurr,bitIndex2)
      <=> v2465(VarCurr,bitIndex23) )
      & ( v2590(VarCurr,bitIndex1)
      <=> v2465(VarCurr,bitIndex22) )
      & ( v2590(VarCurr,bitIndex0)
      <=> v2465(VarCurr,bitIndex21) ) ) )).

fof(addAssignment_1796,axiom,(
    ! [VarCurr] :
      ( v2590(VarCurr,bitIndex19)
    <=> $false ) )).

fof(writeBinaryOperatorShiftedRanges_396,axiom,(
    ! [VarCurr] :
      ( v2587(VarCurr,bitIndex0)
    <=> ( v2465(VarCurr,bitIndex20)
        & v2588(VarCurr,bitIndex0) ) ) )).

fof(writeBinaryOperatorShiftedRanges_395,axiom,(
    ! [VarCurr] :
      ( v2587(VarCurr,bitIndex1)
    <=> ( v2465(VarCurr,bitIndex21)
        & v2588(VarCurr,bitIndex1) ) ) )).

fof(writeBinaryOperatorShiftedRanges_394,axiom,(
    ! [VarCurr] :
      ( v2587(VarCurr,bitIndex2)
    <=> ( v2465(VarCurr,bitIndex22)
        & v2588(VarCurr,bitIndex2) ) ) )).

fof(writeBinaryOperatorShiftedRanges_393,axiom,(
    ! [VarCurr] :
      ( v2587(VarCurr,bitIndex3)
    <=> ( v2465(VarCurr,bitIndex23)
        & v2588(VarCurr,bitIndex3) ) ) )).

fof(writeBinaryOperatorShiftedRanges_392,axiom,(
    ! [VarCurr] :
      ( v2587(VarCurr,bitIndex4)
    <=> ( v2465(VarCurr,bitIndex24)
        & v2588(VarCurr,bitIndex4) ) ) )).

fof(writeBinaryOperatorShiftedRanges_391,axiom,(
    ! [VarCurr] :
      ( v2587(VarCurr,bitIndex5)
    <=> ( v2465(VarCurr,bitIndex25)
        & v2588(VarCurr,bitIndex5) ) ) )).

fof(writeBinaryOperatorShiftedRanges_390,axiom,(
    ! [VarCurr] :
      ( v2587(VarCurr,bitIndex6)
    <=> ( v2465(VarCurr,bitIndex26)
        & v2588(VarCurr,bitIndex6) ) ) )).

fof(writeBinaryOperatorShiftedRanges_389,axiom,(
    ! [VarCurr] :
      ( v2587(VarCurr,bitIndex7)
    <=> ( v2465(VarCurr,bitIndex27)
        & v2588(VarCurr,bitIndex7) ) ) )).

fof(writeBinaryOperatorShiftedRanges_388,axiom,(
    ! [VarCurr] :
      ( v2587(VarCurr,bitIndex8)
    <=> ( v2465(VarCurr,bitIndex28)
        & v2588(VarCurr,bitIndex8) ) ) )).

fof(writeBinaryOperatorShiftedRanges_387,axiom,(
    ! [VarCurr] :
      ( v2587(VarCurr,bitIndex9)
    <=> ( v2465(VarCurr,bitIndex29)
        & v2588(VarCurr,bitIndex9) ) ) )).

fof(writeBinaryOperatorShiftedRanges_386,axiom,(
    ! [VarCurr] :
      ( v2587(VarCurr,bitIndex10)
    <=> ( v2465(VarCurr,bitIndex30)
        & v2588(VarCurr,bitIndex10) ) ) )).

fof(writeBinaryOperatorShiftedRanges_385,axiom,(
    ! [VarCurr] :
      ( v2587(VarCurr,bitIndex11)
    <=> ( v2465(VarCurr,bitIndex31)
        & v2588(VarCurr,bitIndex11) ) ) )).

fof(writeBinaryOperatorShiftedRanges_384,axiom,(
    ! [VarCurr] :
      ( v2587(VarCurr,bitIndex12)
    <=> ( v2465(VarCurr,bitIndex32)
        & v2588(VarCurr,bitIndex12) ) ) )).

fof(writeBinaryOperatorShiftedRanges_383,axiom,(
    ! [VarCurr] :
      ( v2587(VarCurr,bitIndex13)
    <=> ( v2465(VarCurr,bitIndex33)
        & v2588(VarCurr,bitIndex13) ) ) )).

fof(writeBinaryOperatorShiftedRanges_382,axiom,(
    ! [VarCurr] :
      ( v2587(VarCurr,bitIndex14)
    <=> ( v2465(VarCurr,bitIndex34)
        & v2588(VarCurr,bitIndex14) ) ) )).

fof(writeBinaryOperatorShiftedRanges_381,axiom,(
    ! [VarCurr] :
      ( v2587(VarCurr,bitIndex15)
    <=> ( v2465(VarCurr,bitIndex35)
        & v2588(VarCurr,bitIndex15) ) ) )).

fof(writeBinaryOperatorShiftedRanges_380,axiom,(
    ! [VarCurr] :
      ( v2587(VarCurr,bitIndex16)
    <=> ( v2465(VarCurr,bitIndex36)
        & v2588(VarCurr,bitIndex16) ) ) )).

fof(writeBinaryOperatorShiftedRanges_379,axiom,(
    ! [VarCurr] :
      ( v2587(VarCurr,bitIndex17)
    <=> ( v2465(VarCurr,bitIndex37)
        & v2588(VarCurr,bitIndex17) ) ) )).

fof(writeBinaryOperatorShiftedRanges_378,axiom,(
    ! [VarCurr] :
      ( v2587(VarCurr,bitIndex18)
    <=> ( v2465(VarCurr,bitIndex38)
        & v2588(VarCurr,bitIndex18) ) ) )).

fof(writeBinaryOperatorShiftedRanges_377,axiom,(
    ! [VarCurr] :
      ( v2587(VarCurr,bitIndex19)
    <=> ( v2465(VarCurr,bitIndex39)
        & v2588(VarCurr,bitIndex19) ) ) )).

fof(addAssignment_1795,axiom,(
    ! [VarCurr] :
      ( v2588(VarCurr,bitIndex0)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_1794,axiom,(
    ! [VarCurr] :
      ( v2588(VarCurr,bitIndex1)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_1793,axiom,(
    ! [VarCurr] :
      ( v2588(VarCurr,bitIndex2)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_1792,axiom,(
    ! [VarCurr] :
      ( v2588(VarCurr,bitIndex3)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_1791,axiom,(
    ! [VarCurr] :
      ( v2588(VarCurr,bitIndex4)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_1790,axiom,(
    ! [VarCurr] :
      ( v2588(VarCurr,bitIndex5)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_1789,axiom,(
    ! [VarCurr] :
      ( v2588(VarCurr,bitIndex6)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_1788,axiom,(
    ! [VarCurr] :
      ( v2588(VarCurr,bitIndex7)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_1787,axiom,(
    ! [VarCurr] :
      ( v2588(VarCurr,bitIndex8)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_1786,axiom,(
    ! [VarCurr] :
      ( v2588(VarCurr,bitIndex9)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_1785,axiom,(
    ! [VarCurr] :
      ( v2588(VarCurr,bitIndex10)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_1784,axiom,(
    ! [VarCurr] :
      ( v2588(VarCurr,bitIndex11)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_1783,axiom,(
    ! [VarCurr] :
      ( v2588(VarCurr,bitIndex12)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_1782,axiom,(
    ! [VarCurr] :
      ( v2588(VarCurr,bitIndex13)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_1781,axiom,(
    ! [VarCurr] :
      ( v2588(VarCurr,bitIndex14)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_1780,axiom,(
    ! [VarCurr] :
      ( v2588(VarCurr,bitIndex15)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_1779,axiom,(
    ! [VarCurr] :
      ( v2588(VarCurr,bitIndex16)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_1778,axiom,(
    ! [VarCurr] :
      ( v2588(VarCurr,bitIndex17)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_1777,axiom,(
    ! [VarCurr] :
      ( v2588(VarCurr,bitIndex18)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_1776,axiom,(
    ! [VarCurr] :
      ( v2588(VarCurr,bitIndex19)
    <=> v2468(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesMultipleBits_53,axiom,(
    ! [VarCurr,B] :
      ( range_23_0(B)
     => ( v2562(VarCurr,B)
      <=> ( v2563(VarCurr,B)
          & v2581(VarCurr,B) ) ) ) )).

fof(addAssignment_1775,axiom,(
    ! [VarCurr] :
      ( v2581(VarCurr,bitIndex0)
    <=> v2484(VarCurr) ) )).

fof(addAssignment_1774,axiom,(
    ! [VarCurr] :
      ( v2581(VarCurr,bitIndex1)
    <=> v2484(VarCurr) ) )).

fof(addAssignment_1773,axiom,(
    ! [VarCurr] :
      ( v2581(VarCurr,bitIndex2)
    <=> v2484(VarCurr) ) )).

fof(addAssignment_1772,axiom,(
    ! [VarCurr] :
      ( v2581(VarCurr,bitIndex3)
    <=> v2484(VarCurr) ) )).

fof(addAssignment_1771,axiom,(
    ! [VarCurr] :
      ( v2581(VarCurr,bitIndex4)
    <=> v2484(VarCurr) ) )).

fof(addAssignment_1770,axiom,(
    ! [VarCurr] :
      ( v2581(VarCurr,bitIndex5)
    <=> v2484(VarCurr) ) )).

fof(addAssignment_1769,axiom,(
    ! [VarCurr] :
      ( v2581(VarCurr,bitIndex6)
    <=> v2484(VarCurr) ) )).

fof(addAssignment_1768,axiom,(
    ! [VarCurr] :
      ( v2581(VarCurr,bitIndex7)
    <=> v2484(VarCurr) ) )).

fof(addAssignment_1767,axiom,(
    ! [VarCurr] :
      ( v2581(VarCurr,bitIndex8)
    <=> v2484(VarCurr) ) )).

fof(addAssignment_1766,axiom,(
    ! [VarCurr] :
      ( v2581(VarCurr,bitIndex9)
    <=> v2484(VarCurr) ) )).

fof(addAssignment_1765,axiom,(
    ! [VarCurr] :
      ( v2581(VarCurr,bitIndex10)
    <=> v2484(VarCurr) ) )).

fof(addAssignment_1764,axiom,(
    ! [VarCurr] :
      ( v2581(VarCurr,bitIndex11)
    <=> v2484(VarCurr) ) )).

fof(addAssignment_1763,axiom,(
    ! [VarCurr] :
      ( v2581(VarCurr,bitIndex12)
    <=> v2484(VarCurr) ) )).

fof(addAssignment_1762,axiom,(
    ! [VarCurr] :
      ( v2581(VarCurr,bitIndex13)
    <=> v2484(VarCurr) ) )).

fof(addAssignment_1761,axiom,(
    ! [VarCurr] :
      ( v2581(VarCurr,bitIndex14)
    <=> v2484(VarCurr) ) )).

fof(addAssignment_1760,axiom,(
    ! [VarCurr] :
      ( v2581(VarCurr,bitIndex15)
    <=> v2484(VarCurr) ) )).

fof(addAssignment_1759,axiom,(
    ! [VarCurr] :
      ( v2581(VarCurr,bitIndex16)
    <=> v2484(VarCurr) ) )).

fof(addAssignment_1758,axiom,(
    ! [VarCurr] :
      ( v2581(VarCurr,bitIndex17)
    <=> v2484(VarCurr) ) )).

fof(addAssignment_1757,axiom,(
    ! [VarCurr] :
      ( v2581(VarCurr,bitIndex18)
    <=> v2484(VarCurr) ) )).

fof(addAssignment_1756,axiom,(
    ! [VarCurr] :
      ( v2581(VarCurr,bitIndex19)
    <=> v2484(VarCurr) ) )).

fof(addAssignment_1755,axiom,(
    ! [VarCurr] :
      ( v2581(VarCurr,bitIndex20)
    <=> v2484(VarCurr) ) )).

fof(addAssignment_1754,axiom,(
    ! [VarCurr] :
      ( v2581(VarCurr,bitIndex21)
    <=> v2484(VarCurr) ) )).

fof(addAssignment_1753,axiom,(
    ! [VarCurr] :
      ( v2581(VarCurr,bitIndex22)
    <=> v2484(VarCurr) ) )).

fof(addAssignment_1752,axiom,(
    ! [VarCurr] :
      ( v2581(VarCurr,bitIndex23)
    <=> v2484(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesMultipleBits_52,axiom,(
    ! [VarCurr,B] :
      ( range_23_0(B)
     => ( v2563(VarCurr,B)
      <=> ( v2564(VarCurr,B)
          | v2572(VarCurr,B) ) ) ) )).

fof(writeBinaryOperatorEqualRangesMultipleBits_51,axiom,(
    ! [VarCurr,B] :
      ( range_23_0(B)
     => ( v2572(VarCurr,B)
      <=> ( v2573(VarCurr,B)
          & v2580(VarCurr,B) ) ) ) )).

fof(addAssignment_1751,axiom,(
    ! [VarCurr] :
      ( v2580(VarCurr,bitIndex0)
    <=> v2453(VarCurr,bitIndex1) ) )).

fof(addAssignment_1750,axiom,(
    ! [VarCurr] :
      ( v2580(VarCurr,bitIndex1)
    <=> v2453(VarCurr,bitIndex1) ) )).

fof(addAssignment_1749,axiom,(
    ! [VarCurr] :
      ( v2580(VarCurr,bitIndex2)
    <=> v2453(VarCurr,bitIndex1) ) )).

fof(addAssignment_1748,axiom,(
    ! [VarCurr] :
      ( v2580(VarCurr,bitIndex3)
    <=> v2453(VarCurr,bitIndex1) ) )).

fof(addAssignment_1747,axiom,(
    ! [VarCurr] :
      ( v2580(VarCurr,bitIndex4)
    <=> v2453(VarCurr,bitIndex1) ) )).

fof(addAssignment_1746,axiom,(
    ! [VarCurr] :
      ( v2580(VarCurr,bitIndex5)
    <=> v2453(VarCurr,bitIndex1) ) )).

fof(addAssignment_1745,axiom,(
    ! [VarCurr] :
      ( v2580(VarCurr,bitIndex6)
    <=> v2453(VarCurr,bitIndex1) ) )).

fof(addAssignment_1744,axiom,(
    ! [VarCurr] :
      ( v2580(VarCurr,bitIndex7)
    <=> v2453(VarCurr,bitIndex1) ) )).

fof(addAssignment_1743,axiom,(
    ! [VarCurr] :
      ( v2580(VarCurr,bitIndex8)
    <=> v2453(VarCurr,bitIndex1) ) )).

fof(addAssignment_1742,axiom,(
    ! [VarCurr] :
      ( v2580(VarCurr,bitIndex9)
    <=> v2453(VarCurr,bitIndex1) ) )).

fof(addAssignment_1741,axiom,(
    ! [VarCurr] :
      ( v2580(VarCurr,bitIndex10)
    <=> v2453(VarCurr,bitIndex1) ) )).

fof(addAssignment_1740,axiom,(
    ! [VarCurr] :
      ( v2580(VarCurr,bitIndex11)
    <=> v2453(VarCurr,bitIndex1) ) )).

fof(addAssignment_1739,axiom,(
    ! [VarCurr] :
      ( v2580(VarCurr,bitIndex12)
    <=> v2453(VarCurr,bitIndex1) ) )).

fof(addAssignment_1738,axiom,(
    ! [VarCurr] :
      ( v2580(VarCurr,bitIndex13)
    <=> v2453(VarCurr,bitIndex1) ) )).

fof(addAssignment_1737,axiom,(
    ! [VarCurr] :
      ( v2580(VarCurr,bitIndex14)
    <=> v2453(VarCurr,bitIndex1) ) )).

fof(addAssignment_1736,axiom,(
    ! [VarCurr] :
      ( v2580(VarCurr,bitIndex15)
    <=> v2453(VarCurr,bitIndex1) ) )).

fof(addAssignment_1735,axiom,(
    ! [VarCurr] :
      ( v2580(VarCurr,bitIndex16)
    <=> v2453(VarCurr,bitIndex1) ) )).

fof(addAssignment_1734,axiom,(
    ! [VarCurr] :
      ( v2580(VarCurr,bitIndex17)
    <=> v2453(VarCurr,bitIndex1) ) )).

fof(addAssignment_1733,axiom,(
    ! [VarCurr] :
      ( v2580(VarCurr,bitIndex18)
    <=> v2453(VarCurr,bitIndex1) ) )).

fof(addAssignment_1732,axiom,(
    ! [VarCurr] :
      ( v2580(VarCurr,bitIndex19)
    <=> v2453(VarCurr,bitIndex1) ) )).

fof(addAssignment_1731,axiom,(
    ! [VarCurr] :
      ( v2580(VarCurr,bitIndex20)
    <=> v2453(VarCurr,bitIndex1) ) )).

fof(addAssignment_1730,axiom,(
    ! [VarCurr] :
      ( v2580(VarCurr,bitIndex21)
    <=> v2453(VarCurr,bitIndex1) ) )).

fof(addAssignment_1729,axiom,(
    ! [VarCurr] :
      ( v2580(VarCurr,bitIndex22)
    <=> v2453(VarCurr,bitIndex1) ) )).

fof(addAssignment_1728,axiom,(
    ! [VarCurr] :
      ( v2580(VarCurr,bitIndex23)
    <=> v2453(VarCurr,bitIndex1) ) )).

fof(addAssignment_1727,axiom,(
    ! [VarCurr,B] :
      ( range_21_0(B)
     => ( v2573(VarCurr,B)
      <=> v2574(VarCurr,B) ) ) )).

fof(addAssignment_1726,axiom,(
    ! [VarCurr] :
      ( ( v2573(VarCurr,bitIndex23)
      <=> $false )
      & ( v2573(VarCurr,bitIndex22)
      <=> $false ) ) )).

fof(writeBinaryOperatorEqualRangesMultipleBits_50,axiom,(
    ! [VarCurr,B] :
      ( range_21_0(B)
     => ( v2574(VarCurr,B)
      <=> ( v2575(VarCurr,B)
          | v2577(VarCurr,B) ) ) ) )).

fof(writeBinaryOperatorEqualRangesMultipleBits_49,axiom,(
    ! [VarCurr,B] :
      ( range_21_0(B)
     => ( v2577(VarCurr,B)
      <=> ( v2578(VarCurr,B)
          & v2579(VarCurr,B) ) ) ) )).

fof(range_axiom_23,axiom,(
    ! [B] :
      ( range_21_0(B)
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
        | bitIndex21 = B ) ) )).

fof(addAssignment_1725,axiom,(
    ! [VarCurr] :
      ( v2579(VarCurr,bitIndex0)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_1724,axiom,(
    ! [VarCurr] :
      ( v2579(VarCurr,bitIndex1)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_1723,axiom,(
    ! [VarCurr] :
      ( v2579(VarCurr,bitIndex2)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_1722,axiom,(
    ! [VarCurr] :
      ( v2579(VarCurr,bitIndex3)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_1721,axiom,(
    ! [VarCurr] :
      ( v2579(VarCurr,bitIndex4)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_1720,axiom,(
    ! [VarCurr] :
      ( v2579(VarCurr,bitIndex5)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_1719,axiom,(
    ! [VarCurr] :
      ( v2579(VarCurr,bitIndex6)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_1718,axiom,(
    ! [VarCurr] :
      ( v2579(VarCurr,bitIndex7)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_1717,axiom,(
    ! [VarCurr] :
      ( v2579(VarCurr,bitIndex8)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_1716,axiom,(
    ! [VarCurr] :
      ( v2579(VarCurr,bitIndex9)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_1715,axiom,(
    ! [VarCurr] :
      ( v2579(VarCurr,bitIndex10)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_1714,axiom,(
    ! [VarCurr] :
      ( v2579(VarCurr,bitIndex11)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_1713,axiom,(
    ! [VarCurr] :
      ( v2579(VarCurr,bitIndex12)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_1712,axiom,(
    ! [VarCurr] :
      ( v2579(VarCurr,bitIndex13)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_1711,axiom,(
    ! [VarCurr] :
      ( v2579(VarCurr,bitIndex14)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_1710,axiom,(
    ! [VarCurr] :
      ( v2579(VarCurr,bitIndex15)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_1709,axiom,(
    ! [VarCurr] :
      ( v2579(VarCurr,bitIndex16)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_1708,axiom,(
    ! [VarCurr] :
      ( v2579(VarCurr,bitIndex17)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_1707,axiom,(
    ! [VarCurr] :
      ( v2579(VarCurr,bitIndex18)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_1706,axiom,(
    ! [VarCurr] :
      ( v2579(VarCurr,bitIndex19)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_1705,axiom,(
    ! [VarCurr] :
      ( v2579(VarCurr,bitIndex20)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_1704,axiom,(
    ! [VarCurr] :
      ( v2579(VarCurr,bitIndex21)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_1703,axiom,(
    ! [VarCurr] :
      ( ( v2578(VarCurr,bitIndex20)
      <=> v2465(VarCurr,bitIndex39) )
      & ( v2578(VarCurr,bitIndex19)
      <=> v2465(VarCurr,bitIndex38) )
      & ( v2578(VarCurr,bitIndex18)
      <=> v2465(VarCurr,bitIndex37) )
      & ( v2578(VarCurr,bitIndex17)
      <=> v2465(VarCurr,bitIndex36) )
      & ( v2578(VarCurr,bitIndex16)
      <=> v2465(VarCurr,bitIndex35) )
      & ( v2578(VarCurr,bitIndex15)
      <=> v2465(VarCurr,bitIndex34) )
      & ( v2578(VarCurr,bitIndex14)
      <=> v2465(VarCurr,bitIndex33) )
      & ( v2578(VarCurr,bitIndex13)
      <=> v2465(VarCurr,bitIndex32) )
      & ( v2578(VarCurr,bitIndex12)
      <=> v2465(VarCurr,bitIndex31) )
      & ( v2578(VarCurr,bitIndex11)
      <=> v2465(VarCurr,bitIndex30) )
      & ( v2578(VarCurr,bitIndex10)
      <=> v2465(VarCurr,bitIndex29) )
      & ( v2578(VarCurr,bitIndex9)
      <=> v2465(VarCurr,bitIndex28) )
      & ( v2578(VarCurr,bitIndex8)
      <=> v2465(VarCurr,bitIndex27) )
      & ( v2578(VarCurr,bitIndex7)
      <=> v2465(VarCurr,bitIndex26) )
      & ( v2578(VarCurr,bitIndex6)
      <=> v2465(VarCurr,bitIndex25) )
      & ( v2578(VarCurr,bitIndex5)
      <=> v2465(VarCurr,bitIndex24) )
      & ( v2578(VarCurr,bitIndex4)
      <=> v2465(VarCurr,bitIndex23) )
      & ( v2578(VarCurr,bitIndex3)
      <=> v2465(VarCurr,bitIndex22) )
      & ( v2578(VarCurr,bitIndex2)
      <=> v2465(VarCurr,bitIndex21) )
      & ( v2578(VarCurr,bitIndex1)
      <=> v2465(VarCurr,bitIndex20) )
      & ( v2578(VarCurr,bitIndex0)
      <=> v2465(VarCurr,bitIndex19) ) ) )).

fof(addAssignment_1702,axiom,(
    ! [VarCurr] :
      ( v2578(VarCurr,bitIndex21)
    <=> $false ) )).

fof(writeBinaryOperatorShiftedRanges_376,axiom,(
    ! [VarCurr] :
      ( v2575(VarCurr,bitIndex0)
    <=> ( v2465(VarCurr,bitIndex18)
        & v2576(VarCurr,bitIndex0) ) ) )).

fof(writeBinaryOperatorShiftedRanges_375,axiom,(
    ! [VarCurr] :
      ( v2575(VarCurr,bitIndex1)
    <=> ( v2465(VarCurr,bitIndex19)
        & v2576(VarCurr,bitIndex1) ) ) )).

fof(writeBinaryOperatorShiftedRanges_374,axiom,(
    ! [VarCurr] :
      ( v2575(VarCurr,bitIndex2)
    <=> ( v2465(VarCurr,bitIndex20)
        & v2576(VarCurr,bitIndex2) ) ) )).

fof(writeBinaryOperatorShiftedRanges_373,axiom,(
    ! [VarCurr] :
      ( v2575(VarCurr,bitIndex3)
    <=> ( v2465(VarCurr,bitIndex21)
        & v2576(VarCurr,bitIndex3) ) ) )).

fof(writeBinaryOperatorShiftedRanges_372,axiom,(
    ! [VarCurr] :
      ( v2575(VarCurr,bitIndex4)
    <=> ( v2465(VarCurr,bitIndex22)
        & v2576(VarCurr,bitIndex4) ) ) )).

fof(writeBinaryOperatorShiftedRanges_371,axiom,(
    ! [VarCurr] :
      ( v2575(VarCurr,bitIndex5)
    <=> ( v2465(VarCurr,bitIndex23)
        & v2576(VarCurr,bitIndex5) ) ) )).

fof(writeBinaryOperatorShiftedRanges_370,axiom,(
    ! [VarCurr] :
      ( v2575(VarCurr,bitIndex6)
    <=> ( v2465(VarCurr,bitIndex24)
        & v2576(VarCurr,bitIndex6) ) ) )).

fof(writeBinaryOperatorShiftedRanges_369,axiom,(
    ! [VarCurr] :
      ( v2575(VarCurr,bitIndex7)
    <=> ( v2465(VarCurr,bitIndex25)
        & v2576(VarCurr,bitIndex7) ) ) )).

fof(writeBinaryOperatorShiftedRanges_368,axiom,(
    ! [VarCurr] :
      ( v2575(VarCurr,bitIndex8)
    <=> ( v2465(VarCurr,bitIndex26)
        & v2576(VarCurr,bitIndex8) ) ) )).

fof(writeBinaryOperatorShiftedRanges_367,axiom,(
    ! [VarCurr] :
      ( v2575(VarCurr,bitIndex9)
    <=> ( v2465(VarCurr,bitIndex27)
        & v2576(VarCurr,bitIndex9) ) ) )).

fof(writeBinaryOperatorShiftedRanges_366,axiom,(
    ! [VarCurr] :
      ( v2575(VarCurr,bitIndex10)
    <=> ( v2465(VarCurr,bitIndex28)
        & v2576(VarCurr,bitIndex10) ) ) )).

fof(writeBinaryOperatorShiftedRanges_365,axiom,(
    ! [VarCurr] :
      ( v2575(VarCurr,bitIndex11)
    <=> ( v2465(VarCurr,bitIndex29)
        & v2576(VarCurr,bitIndex11) ) ) )).

fof(writeBinaryOperatorShiftedRanges_364,axiom,(
    ! [VarCurr] :
      ( v2575(VarCurr,bitIndex12)
    <=> ( v2465(VarCurr,bitIndex30)
        & v2576(VarCurr,bitIndex12) ) ) )).

fof(writeBinaryOperatorShiftedRanges_363,axiom,(
    ! [VarCurr] :
      ( v2575(VarCurr,bitIndex13)
    <=> ( v2465(VarCurr,bitIndex31)
        & v2576(VarCurr,bitIndex13) ) ) )).

fof(writeBinaryOperatorShiftedRanges_362,axiom,(
    ! [VarCurr] :
      ( v2575(VarCurr,bitIndex14)
    <=> ( v2465(VarCurr,bitIndex32)
        & v2576(VarCurr,bitIndex14) ) ) )).

fof(writeBinaryOperatorShiftedRanges_361,axiom,(
    ! [VarCurr] :
      ( v2575(VarCurr,bitIndex15)
    <=> ( v2465(VarCurr,bitIndex33)
        & v2576(VarCurr,bitIndex15) ) ) )).

fof(writeBinaryOperatorShiftedRanges_360,axiom,(
    ! [VarCurr] :
      ( v2575(VarCurr,bitIndex16)
    <=> ( v2465(VarCurr,bitIndex34)
        & v2576(VarCurr,bitIndex16) ) ) )).

fof(writeBinaryOperatorShiftedRanges_359,axiom,(
    ! [VarCurr] :
      ( v2575(VarCurr,bitIndex17)
    <=> ( v2465(VarCurr,bitIndex35)
        & v2576(VarCurr,bitIndex17) ) ) )).

fof(writeBinaryOperatorShiftedRanges_358,axiom,(
    ! [VarCurr] :
      ( v2575(VarCurr,bitIndex18)
    <=> ( v2465(VarCurr,bitIndex36)
        & v2576(VarCurr,bitIndex18) ) ) )).

fof(writeBinaryOperatorShiftedRanges_357,axiom,(
    ! [VarCurr] :
      ( v2575(VarCurr,bitIndex19)
    <=> ( v2465(VarCurr,bitIndex37)
        & v2576(VarCurr,bitIndex19) ) ) )).

fof(writeBinaryOperatorShiftedRanges_356,axiom,(
    ! [VarCurr] :
      ( v2575(VarCurr,bitIndex20)
    <=> ( v2465(VarCurr,bitIndex38)
        & v2576(VarCurr,bitIndex20) ) ) )).

fof(writeBinaryOperatorShiftedRanges_355,axiom,(
    ! [VarCurr] :
      ( v2575(VarCurr,bitIndex21)
    <=> ( v2465(VarCurr,bitIndex39)
        & v2576(VarCurr,bitIndex21) ) ) )).

fof(addAssignment_1701,axiom,(
    ! [VarCurr] :
      ( v2576(VarCurr,bitIndex0)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_1700,axiom,(
    ! [VarCurr] :
      ( v2576(VarCurr,bitIndex1)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_1699,axiom,(
    ! [VarCurr] :
      ( v2576(VarCurr,bitIndex2)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_1698,axiom,(
    ! [VarCurr] :
      ( v2576(VarCurr,bitIndex3)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_1697,axiom,(
    ! [VarCurr] :
      ( v2576(VarCurr,bitIndex4)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_1696,axiom,(
    ! [VarCurr] :
      ( v2576(VarCurr,bitIndex5)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_1695,axiom,(
    ! [VarCurr] :
      ( v2576(VarCurr,bitIndex6)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_1694,axiom,(
    ! [VarCurr] :
      ( v2576(VarCurr,bitIndex7)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_1693,axiom,(
    ! [VarCurr] :
      ( v2576(VarCurr,bitIndex8)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_1692,axiom,(
    ! [VarCurr] :
      ( v2576(VarCurr,bitIndex9)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_1691,axiom,(
    ! [VarCurr] :
      ( v2576(VarCurr,bitIndex10)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_1690,axiom,(
    ! [VarCurr] :
      ( v2576(VarCurr,bitIndex11)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_1689,axiom,(
    ! [VarCurr] :
      ( v2576(VarCurr,bitIndex12)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_1688,axiom,(
    ! [VarCurr] :
      ( v2576(VarCurr,bitIndex13)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_1687,axiom,(
    ! [VarCurr] :
      ( v2576(VarCurr,bitIndex14)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_1686,axiom,(
    ! [VarCurr] :
      ( v2576(VarCurr,bitIndex15)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_1685,axiom,(
    ! [VarCurr] :
      ( v2576(VarCurr,bitIndex16)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_1684,axiom,(
    ! [VarCurr] :
      ( v2576(VarCurr,bitIndex17)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_1683,axiom,(
    ! [VarCurr] :
      ( v2576(VarCurr,bitIndex18)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_1682,axiom,(
    ! [VarCurr] :
      ( v2576(VarCurr,bitIndex19)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_1681,axiom,(
    ! [VarCurr] :
      ( v2576(VarCurr,bitIndex20)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_1680,axiom,(
    ! [VarCurr] :
      ( v2576(VarCurr,bitIndex21)
    <=> v2468(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesMultipleBits_48,axiom,(
    ! [VarCurr,B] :
      ( range_23_0(B)
     => ( v2564(VarCurr,B)
      <=> ( v2565(VarCurr,B)
          & v2571(VarCurr,B) ) ) ) )).

fof(addAssignment_1679,axiom,(
    ! [VarCurr] :
      ( v2571(VarCurr,bitIndex0)
    <=> v2473(VarCurr) ) )).

fof(addAssignment_1678,axiom,(
    ! [VarCurr] :
      ( v2571(VarCurr,bitIndex1)
    <=> v2473(VarCurr) ) )).

fof(addAssignment_1677,axiom,(
    ! [VarCurr] :
      ( v2571(VarCurr,bitIndex2)
    <=> v2473(VarCurr) ) )).

fof(addAssignment_1676,axiom,(
    ! [VarCurr] :
      ( v2571(VarCurr,bitIndex3)
    <=> v2473(VarCurr) ) )).

fof(addAssignment_1675,axiom,(
    ! [VarCurr] :
      ( v2571(VarCurr,bitIndex4)
    <=> v2473(VarCurr) ) )).

fof(addAssignment_1674,axiom,(
    ! [VarCurr] :
      ( v2571(VarCurr,bitIndex5)
    <=> v2473(VarCurr) ) )).

fof(addAssignment_1673,axiom,(
    ! [VarCurr] :
      ( v2571(VarCurr,bitIndex6)
    <=> v2473(VarCurr) ) )).

fof(addAssignment_1672,axiom,(
    ! [VarCurr] :
      ( v2571(VarCurr,bitIndex7)
    <=> v2473(VarCurr) ) )).

fof(addAssignment_1671,axiom,(
    ! [VarCurr] :
      ( v2571(VarCurr,bitIndex8)
    <=> v2473(VarCurr) ) )).

fof(addAssignment_1670,axiom,(
    ! [VarCurr] :
      ( v2571(VarCurr,bitIndex9)
    <=> v2473(VarCurr) ) )).

fof(addAssignment_1669,axiom,(
    ! [VarCurr] :
      ( v2571(VarCurr,bitIndex10)
    <=> v2473(VarCurr) ) )).

fof(addAssignment_1668,axiom,(
    ! [VarCurr] :
      ( v2571(VarCurr,bitIndex11)
    <=> v2473(VarCurr) ) )).

fof(addAssignment_1667,axiom,(
    ! [VarCurr] :
      ( v2571(VarCurr,bitIndex12)
    <=> v2473(VarCurr) ) )).

fof(addAssignment_1666,axiom,(
    ! [VarCurr] :
      ( v2571(VarCurr,bitIndex13)
    <=> v2473(VarCurr) ) )).

fof(addAssignment_1665,axiom,(
    ! [VarCurr] :
      ( v2571(VarCurr,bitIndex14)
    <=> v2473(VarCurr) ) )).

fof(addAssignment_1664,axiom,(
    ! [VarCurr] :
      ( v2571(VarCurr,bitIndex15)
    <=> v2473(VarCurr) ) )).

fof(addAssignment_1663,axiom,(
    ! [VarCurr] :
      ( v2571(VarCurr,bitIndex16)
    <=> v2473(VarCurr) ) )).

fof(addAssignment_1662,axiom,(
    ! [VarCurr] :
      ( v2571(VarCurr,bitIndex17)
    <=> v2473(VarCurr) ) )).

fof(addAssignment_1661,axiom,(
    ! [VarCurr] :
      ( v2571(VarCurr,bitIndex18)
    <=> v2473(VarCurr) ) )).

fof(addAssignment_1660,axiom,(
    ! [VarCurr] :
      ( v2571(VarCurr,bitIndex19)
    <=> v2473(VarCurr) ) )).

fof(addAssignment_1659,axiom,(
    ! [VarCurr] :
      ( v2571(VarCurr,bitIndex20)
    <=> v2473(VarCurr) ) )).

fof(addAssignment_1658,axiom,(
    ! [VarCurr] :
      ( v2571(VarCurr,bitIndex21)
    <=> v2473(VarCurr) ) )).

fof(addAssignment_1657,axiom,(
    ! [VarCurr] :
      ( v2571(VarCurr,bitIndex22)
    <=> v2473(VarCurr) ) )).

fof(addAssignment_1656,axiom,(
    ! [VarCurr] :
      ( v2571(VarCurr,bitIndex23)
    <=> v2473(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesMultipleBits_47,axiom,(
    ! [VarCurr,B] :
      ( range_23_0(B)
     => ( v2565(VarCurr,B)
      <=> ( v2566(VarCurr,B)
          | v2568(VarCurr,B) ) ) ) )).

fof(writeBinaryOperatorEqualRangesMultipleBits_46,axiom,(
    ! [VarCurr,B] :
      ( range_23_0(B)
     => ( v2568(VarCurr,B)
      <=> ( v2569(VarCurr,B)
          & v2570(VarCurr,B) ) ) ) )).

fof(range_axiom_22,axiom,(
    ! [B] :
      ( range_23_0(B)
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
        | bitIndex23 = B ) ) )).

fof(addAssignment_1655,axiom,(
    ! [VarCurr] :
      ( v2570(VarCurr,bitIndex0)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_1654,axiom,(
    ! [VarCurr] :
      ( v2570(VarCurr,bitIndex1)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_1653,axiom,(
    ! [VarCurr] :
      ( v2570(VarCurr,bitIndex2)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_1652,axiom,(
    ! [VarCurr] :
      ( v2570(VarCurr,bitIndex3)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_1651,axiom,(
    ! [VarCurr] :
      ( v2570(VarCurr,bitIndex4)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_1650,axiom,(
    ! [VarCurr] :
      ( v2570(VarCurr,bitIndex5)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_1649,axiom,(
    ! [VarCurr] :
      ( v2570(VarCurr,bitIndex6)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_1648,axiom,(
    ! [VarCurr] :
      ( v2570(VarCurr,bitIndex7)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_1647,axiom,(
    ! [VarCurr] :
      ( v2570(VarCurr,bitIndex8)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_1646,axiom,(
    ! [VarCurr] :
      ( v2570(VarCurr,bitIndex9)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_1645,axiom,(
    ! [VarCurr] :
      ( v2570(VarCurr,bitIndex10)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_1644,axiom,(
    ! [VarCurr] :
      ( v2570(VarCurr,bitIndex11)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_1643,axiom,(
    ! [VarCurr] :
      ( v2570(VarCurr,bitIndex12)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_1642,axiom,(
    ! [VarCurr] :
      ( v2570(VarCurr,bitIndex13)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_1641,axiom,(
    ! [VarCurr] :
      ( v2570(VarCurr,bitIndex14)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_1640,axiom,(
    ! [VarCurr] :
      ( v2570(VarCurr,bitIndex15)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_1639,axiom,(
    ! [VarCurr] :
      ( v2570(VarCurr,bitIndex16)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_1638,axiom,(
    ! [VarCurr] :
      ( v2570(VarCurr,bitIndex17)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_1637,axiom,(
    ! [VarCurr] :
      ( v2570(VarCurr,bitIndex18)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_1636,axiom,(
    ! [VarCurr] :
      ( v2570(VarCurr,bitIndex19)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_1635,axiom,(
    ! [VarCurr] :
      ( v2570(VarCurr,bitIndex20)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_1634,axiom,(
    ! [VarCurr] :
      ( v2570(VarCurr,bitIndex21)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_1633,axiom,(
    ! [VarCurr] :
      ( v2570(VarCurr,bitIndex22)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_1632,axiom,(
    ! [VarCurr] :
      ( v2570(VarCurr,bitIndex23)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_1631,axiom,(
    ! [VarCurr] :
      ( ( v2569(VarCurr,bitIndex22)
      <=> v2465(VarCurr,bitIndex39) )
      & ( v2569(VarCurr,bitIndex21)
      <=> v2465(VarCurr,bitIndex38) )
      & ( v2569(VarCurr,bitIndex20)
      <=> v2465(VarCurr,bitIndex37) )
      & ( v2569(VarCurr,bitIndex19)
      <=> v2465(VarCurr,bitIndex36) )
      & ( v2569(VarCurr,bitIndex18)
      <=> v2465(VarCurr,bitIndex35) )
      & ( v2569(VarCurr,bitIndex17)
      <=> v2465(VarCurr,bitIndex34) )
      & ( v2569(VarCurr,bitIndex16)
      <=> v2465(VarCurr,bitIndex33) )
      & ( v2569(VarCurr,bitIndex15)
      <=> v2465(VarCurr,bitIndex32) )
      & ( v2569(VarCurr,bitIndex14)
      <=> v2465(VarCurr,bitIndex31) )
      & ( v2569(VarCurr,bitIndex13)
      <=> v2465(VarCurr,bitIndex30) )
      & ( v2569(VarCurr,bitIndex12)
      <=> v2465(VarCurr,bitIndex29) )
      & ( v2569(VarCurr,bitIndex11)
      <=> v2465(VarCurr,bitIndex28) )
      & ( v2569(VarCurr,bitIndex10)
      <=> v2465(VarCurr,bitIndex27) )
      & ( v2569(VarCurr,bitIndex9)
      <=> v2465(VarCurr,bitIndex26) )
      & ( v2569(VarCurr,bitIndex8)
      <=> v2465(VarCurr,bitIndex25) )
      & ( v2569(VarCurr,bitIndex7)
      <=> v2465(VarCurr,bitIndex24) )
      & ( v2569(VarCurr,bitIndex6)
      <=> v2465(VarCurr,bitIndex23) )
      & ( v2569(VarCurr,bitIndex5)
      <=> v2465(VarCurr,bitIndex22) )
      & ( v2569(VarCurr,bitIndex4)
      <=> v2465(VarCurr,bitIndex21) )
      & ( v2569(VarCurr,bitIndex3)
      <=> v2465(VarCurr,bitIndex20) )
      & ( v2569(VarCurr,bitIndex2)
      <=> v2465(VarCurr,bitIndex19) )
      & ( v2569(VarCurr,bitIndex1)
      <=> v2465(VarCurr,bitIndex18) )
      & ( v2569(VarCurr,bitIndex0)
      <=> v2465(VarCurr,bitIndex17) ) ) )).

fof(addAssignment_1630,axiom,(
    ! [VarCurr] :
      ( v2569(VarCurr,bitIndex23)
    <=> $false ) )).

fof(writeBinaryOperatorShiftedRanges_354,axiom,(
    ! [VarCurr] :
      ( v2566(VarCurr,bitIndex0)
    <=> ( v2465(VarCurr,bitIndex16)
        & v2567(VarCurr,bitIndex0) ) ) )).

fof(writeBinaryOperatorShiftedRanges_353,axiom,(
    ! [VarCurr] :
      ( v2566(VarCurr,bitIndex1)
    <=> ( v2465(VarCurr,bitIndex17)
        & v2567(VarCurr,bitIndex1) ) ) )).

fof(writeBinaryOperatorShiftedRanges_352,axiom,(
    ! [VarCurr] :
      ( v2566(VarCurr,bitIndex2)
    <=> ( v2465(VarCurr,bitIndex18)
        & v2567(VarCurr,bitIndex2) ) ) )).

fof(writeBinaryOperatorShiftedRanges_351,axiom,(
    ! [VarCurr] :
      ( v2566(VarCurr,bitIndex3)
    <=> ( v2465(VarCurr,bitIndex19)
        & v2567(VarCurr,bitIndex3) ) ) )).

fof(writeBinaryOperatorShiftedRanges_350,axiom,(
    ! [VarCurr] :
      ( v2566(VarCurr,bitIndex4)
    <=> ( v2465(VarCurr,bitIndex20)
        & v2567(VarCurr,bitIndex4) ) ) )).

fof(writeBinaryOperatorShiftedRanges_349,axiom,(
    ! [VarCurr] :
      ( v2566(VarCurr,bitIndex5)
    <=> ( v2465(VarCurr,bitIndex21)
        & v2567(VarCurr,bitIndex5) ) ) )).

fof(writeBinaryOperatorShiftedRanges_348,axiom,(
    ! [VarCurr] :
      ( v2566(VarCurr,bitIndex6)
    <=> ( v2465(VarCurr,bitIndex22)
        & v2567(VarCurr,bitIndex6) ) ) )).

fof(writeBinaryOperatorShiftedRanges_347,axiom,(
    ! [VarCurr] :
      ( v2566(VarCurr,bitIndex7)
    <=> ( v2465(VarCurr,bitIndex23)
        & v2567(VarCurr,bitIndex7) ) ) )).

fof(writeBinaryOperatorShiftedRanges_346,axiom,(
    ! [VarCurr] :
      ( v2566(VarCurr,bitIndex8)
    <=> ( v2465(VarCurr,bitIndex24)
        & v2567(VarCurr,bitIndex8) ) ) )).

fof(writeBinaryOperatorShiftedRanges_345,axiom,(
    ! [VarCurr] :
      ( v2566(VarCurr,bitIndex9)
    <=> ( v2465(VarCurr,bitIndex25)
        & v2567(VarCurr,bitIndex9) ) ) )).

fof(writeBinaryOperatorShiftedRanges_344,axiom,(
    ! [VarCurr] :
      ( v2566(VarCurr,bitIndex10)
    <=> ( v2465(VarCurr,bitIndex26)
        & v2567(VarCurr,bitIndex10) ) ) )).

fof(writeBinaryOperatorShiftedRanges_343,axiom,(
    ! [VarCurr] :
      ( v2566(VarCurr,bitIndex11)
    <=> ( v2465(VarCurr,bitIndex27)
        & v2567(VarCurr,bitIndex11) ) ) )).

fof(writeBinaryOperatorShiftedRanges_342,axiom,(
    ! [VarCurr] :
      ( v2566(VarCurr,bitIndex12)
    <=> ( v2465(VarCurr,bitIndex28)
        & v2567(VarCurr,bitIndex12) ) ) )).

fof(writeBinaryOperatorShiftedRanges_341,axiom,(
    ! [VarCurr] :
      ( v2566(VarCurr,bitIndex13)
    <=> ( v2465(VarCurr,bitIndex29)
        & v2567(VarCurr,bitIndex13) ) ) )).

fof(writeBinaryOperatorShiftedRanges_340,axiom,(
    ! [VarCurr] :
      ( v2566(VarCurr,bitIndex14)
    <=> ( v2465(VarCurr,bitIndex30)
        & v2567(VarCurr,bitIndex14) ) ) )).

fof(writeBinaryOperatorShiftedRanges_339,axiom,(
    ! [VarCurr] :
      ( v2566(VarCurr,bitIndex15)
    <=> ( v2465(VarCurr,bitIndex31)
        & v2567(VarCurr,bitIndex15) ) ) )).

fof(writeBinaryOperatorShiftedRanges_338,axiom,(
    ! [VarCurr] :
      ( v2566(VarCurr,bitIndex16)
    <=> ( v2465(VarCurr,bitIndex32)
        & v2567(VarCurr,bitIndex16) ) ) )).

fof(writeBinaryOperatorShiftedRanges_337,axiom,(
    ! [VarCurr] :
      ( v2566(VarCurr,bitIndex17)
    <=> ( v2465(VarCurr,bitIndex33)
        & v2567(VarCurr,bitIndex17) ) ) )).

fof(writeBinaryOperatorShiftedRanges_336,axiom,(
    ! [VarCurr] :
      ( v2566(VarCurr,bitIndex18)
    <=> ( v2465(VarCurr,bitIndex34)
        & v2567(VarCurr,bitIndex18) ) ) )).

fof(writeBinaryOperatorShiftedRanges_335,axiom,(
    ! [VarCurr] :
      ( v2566(VarCurr,bitIndex19)
    <=> ( v2465(VarCurr,bitIndex35)
        & v2567(VarCurr,bitIndex19) ) ) )).

fof(writeBinaryOperatorShiftedRanges_334,axiom,(
    ! [VarCurr] :
      ( v2566(VarCurr,bitIndex20)
    <=> ( v2465(VarCurr,bitIndex36)
        & v2567(VarCurr,bitIndex20) ) ) )).

fof(writeBinaryOperatorShiftedRanges_333,axiom,(
    ! [VarCurr] :
      ( v2566(VarCurr,bitIndex21)
    <=> ( v2465(VarCurr,bitIndex37)
        & v2567(VarCurr,bitIndex21) ) ) )).

fof(writeBinaryOperatorShiftedRanges_332,axiom,(
    ! [VarCurr] :
      ( v2566(VarCurr,bitIndex22)
    <=> ( v2465(VarCurr,bitIndex38)
        & v2567(VarCurr,bitIndex22) ) ) )).

fof(writeBinaryOperatorShiftedRanges_331,axiom,(
    ! [VarCurr] :
      ( v2566(VarCurr,bitIndex23)
    <=> ( v2465(VarCurr,bitIndex39)
        & v2567(VarCurr,bitIndex23) ) ) )).

fof(addAssignment_1629,axiom,(
    ! [VarCurr] :
      ( v2567(VarCurr,bitIndex0)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_1628,axiom,(
    ! [VarCurr] :
      ( v2567(VarCurr,bitIndex1)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_1627,axiom,(
    ! [VarCurr] :
      ( v2567(VarCurr,bitIndex2)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_1626,axiom,(
    ! [VarCurr] :
      ( v2567(VarCurr,bitIndex3)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_1625,axiom,(
    ! [VarCurr] :
      ( v2567(VarCurr,bitIndex4)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_1624,axiom,(
    ! [VarCurr] :
      ( v2567(VarCurr,bitIndex5)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_1623,axiom,(
    ! [VarCurr] :
      ( v2567(VarCurr,bitIndex6)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_1622,axiom,(
    ! [VarCurr] :
      ( v2567(VarCurr,bitIndex7)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_1621,axiom,(
    ! [VarCurr] :
      ( v2567(VarCurr,bitIndex8)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_1620,axiom,(
    ! [VarCurr] :
      ( v2567(VarCurr,bitIndex9)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_1619,axiom,(
    ! [VarCurr] :
      ( v2567(VarCurr,bitIndex10)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_1618,axiom,(
    ! [VarCurr] :
      ( v2567(VarCurr,bitIndex11)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_1617,axiom,(
    ! [VarCurr] :
      ( v2567(VarCurr,bitIndex12)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_1616,axiom,(
    ! [VarCurr] :
      ( v2567(VarCurr,bitIndex13)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_1615,axiom,(
    ! [VarCurr] :
      ( v2567(VarCurr,bitIndex14)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_1614,axiom,(
    ! [VarCurr] :
      ( v2567(VarCurr,bitIndex15)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_1613,axiom,(
    ! [VarCurr] :
      ( v2567(VarCurr,bitIndex16)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_1612,axiom,(
    ! [VarCurr] :
      ( v2567(VarCurr,bitIndex17)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_1611,axiom,(
    ! [VarCurr] :
      ( v2567(VarCurr,bitIndex18)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_1610,axiom,(
    ! [VarCurr] :
      ( v2567(VarCurr,bitIndex19)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_1609,axiom,(
    ! [VarCurr] :
      ( v2567(VarCurr,bitIndex20)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_1608,axiom,(
    ! [VarCurr] :
      ( v2567(VarCurr,bitIndex21)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_1607,axiom,(
    ! [VarCurr] :
      ( v2567(VarCurr,bitIndex22)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_1606,axiom,(
    ! [VarCurr] :
      ( v2567(VarCurr,bitIndex23)
    <=> v2468(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesMultipleBits_45,axiom,(
    ! [VarCurr,B] :
      ( range_39_0(B)
     => ( v2456(VarCurr,B)
      <=> ( v2457(VarCurr,B)
          & v2554(VarCurr,B) ) ) ) )).

fof(addAssignment_1605,axiom,(
    ! [VarCurr] :
      ( v2554(VarCurr,bitIndex0)
    <=> v2555(VarCurr) ) )).

fof(addAssignment_1604,axiom,(
    ! [VarCurr] :
      ( v2554(VarCurr,bitIndex1)
    <=> v2555(VarCurr) ) )).

fof(addAssignment_1603,axiom,(
    ! [VarCurr] :
      ( v2554(VarCurr,bitIndex2)
    <=> v2555(VarCurr) ) )).

fof(addAssignment_1602,axiom,(
    ! [VarCurr] :
      ( v2554(VarCurr,bitIndex3)
    <=> v2555(VarCurr) ) )).

fof(addAssignment_1601,axiom,(
    ! [VarCurr] :
      ( v2554(VarCurr,bitIndex4)
    <=> v2555(VarCurr) ) )).

fof(addAssignment_1600,axiom,(
    ! [VarCurr] :
      ( v2554(VarCurr,bitIndex5)
    <=> v2555(VarCurr) ) )).

fof(addAssignment_1599,axiom,(
    ! [VarCurr] :
      ( v2554(VarCurr,bitIndex6)
    <=> v2555(VarCurr) ) )).

fof(addAssignment_1598,axiom,(
    ! [VarCurr] :
      ( v2554(VarCurr,bitIndex7)
    <=> v2555(VarCurr) ) )).

fof(addAssignment_1597,axiom,(
    ! [VarCurr] :
      ( v2554(VarCurr,bitIndex8)
    <=> v2555(VarCurr) ) )).

fof(addAssignment_1596,axiom,(
    ! [VarCurr] :
      ( v2554(VarCurr,bitIndex9)
    <=> v2555(VarCurr) ) )).

fof(addAssignment_1595,axiom,(
    ! [VarCurr] :
      ( v2554(VarCurr,bitIndex10)
    <=> v2555(VarCurr) ) )).

fof(addAssignment_1594,axiom,(
    ! [VarCurr] :
      ( v2554(VarCurr,bitIndex11)
    <=> v2555(VarCurr) ) )).

fof(addAssignment_1593,axiom,(
    ! [VarCurr] :
      ( v2554(VarCurr,bitIndex12)
    <=> v2555(VarCurr) ) )).

fof(addAssignment_1592,axiom,(
    ! [VarCurr] :
      ( v2554(VarCurr,bitIndex13)
    <=> v2555(VarCurr) ) )).

fof(addAssignment_1591,axiom,(
    ! [VarCurr] :
      ( v2554(VarCurr,bitIndex14)
    <=> v2555(VarCurr) ) )).

fof(addAssignment_1590,axiom,(
    ! [VarCurr] :
      ( v2554(VarCurr,bitIndex15)
    <=> v2555(VarCurr) ) )).

fof(addAssignment_1589,axiom,(
    ! [VarCurr] :
      ( v2554(VarCurr,bitIndex16)
    <=> v2555(VarCurr) ) )).

fof(addAssignment_1588,axiom,(
    ! [VarCurr] :
      ( v2554(VarCurr,bitIndex17)
    <=> v2555(VarCurr) ) )).

fof(addAssignment_1587,axiom,(
    ! [VarCurr] :
      ( v2554(VarCurr,bitIndex18)
    <=> v2555(VarCurr) ) )).

fof(addAssignment_1586,axiom,(
    ! [VarCurr] :
      ( v2554(VarCurr,bitIndex19)
    <=> v2555(VarCurr) ) )).

fof(addAssignment_1585,axiom,(
    ! [VarCurr] :
      ( v2554(VarCurr,bitIndex20)
    <=> v2555(VarCurr) ) )).

fof(addAssignment_1584,axiom,(
    ! [VarCurr] :
      ( v2554(VarCurr,bitIndex21)
    <=> v2555(VarCurr) ) )).

fof(addAssignment_1583,axiom,(
    ! [VarCurr] :
      ( v2554(VarCurr,bitIndex22)
    <=> v2555(VarCurr) ) )).

fof(addAssignment_1582,axiom,(
    ! [VarCurr] :
      ( v2554(VarCurr,bitIndex23)
    <=> v2555(VarCurr) ) )).

fof(addAssignment_1581,axiom,(
    ! [VarCurr] :
      ( v2554(VarCurr,bitIndex24)
    <=> v2555(VarCurr) ) )).

fof(addAssignment_1580,axiom,(
    ! [VarCurr] :
      ( v2554(VarCurr,bitIndex25)
    <=> v2555(VarCurr) ) )).

fof(addAssignment_1579,axiom,(
    ! [VarCurr] :
      ( v2554(VarCurr,bitIndex26)
    <=> v2555(VarCurr) ) )).

fof(addAssignment_1578,axiom,(
    ! [VarCurr] :
      ( v2554(VarCurr,bitIndex27)
    <=> v2555(VarCurr) ) )).

fof(addAssignment_1577,axiom,(
    ! [VarCurr] :
      ( v2554(VarCurr,bitIndex28)
    <=> v2555(VarCurr) ) )).

fof(addAssignment_1576,axiom,(
    ! [VarCurr] :
      ( v2554(VarCurr,bitIndex29)
    <=> v2555(VarCurr) ) )).

fof(addAssignment_1575,axiom,(
    ! [VarCurr] :
      ( v2554(VarCurr,bitIndex30)
    <=> v2555(VarCurr) ) )).

fof(addAssignment_1574,axiom,(
    ! [VarCurr] :
      ( v2554(VarCurr,bitIndex31)
    <=> v2555(VarCurr) ) )).

fof(addAssignment_1573,axiom,(
    ! [VarCurr] :
      ( v2554(VarCurr,bitIndex32)
    <=> v2555(VarCurr) ) )).

fof(addAssignment_1572,axiom,(
    ! [VarCurr] :
      ( v2554(VarCurr,bitIndex33)
    <=> v2555(VarCurr) ) )).

fof(addAssignment_1571,axiom,(
    ! [VarCurr] :
      ( v2554(VarCurr,bitIndex34)
    <=> v2555(VarCurr) ) )).

fof(addAssignment_1570,axiom,(
    ! [VarCurr] :
      ( v2554(VarCurr,bitIndex35)
    <=> v2555(VarCurr) ) )).

fof(addAssignment_1569,axiom,(
    ! [VarCurr] :
      ( v2554(VarCurr,bitIndex36)
    <=> v2555(VarCurr) ) )).

fof(addAssignment_1568,axiom,(
    ! [VarCurr] :
      ( v2554(VarCurr,bitIndex37)
    <=> v2555(VarCurr) ) )).

fof(addAssignment_1567,axiom,(
    ! [VarCurr] :
      ( v2554(VarCurr,bitIndex38)
    <=> v2555(VarCurr) ) )).

fof(addAssignment_1566,axiom,(
    ! [VarCurr] :
      ( v2554(VarCurr,bitIndex39)
    <=> v2555(VarCurr) ) )).

fof(writeUnaryOperator_218,axiom,(
    ! [VarCurr] :
      ( ~ v2555(VarCurr)
    <=> v2453(VarCurr,bitIndex4) ) )).

fof(writeBinaryOperatorEqualRangesMultipleBits_44,axiom,(
    ! [VarCurr,B] :
      ( range_39_0(B)
     => ( v2457(VarCurr,B)
      <=> ( v2458(VarCurr,B)
          | v2508(VarCurr,B) ) ) ) )).

fof(writeBinaryOperatorEqualRangesMultipleBits_43,axiom,(
    ! [VarCurr,B] :
      ( range_39_0(B)
     => ( v2508(VarCurr,B)
      <=> ( v2509(VarCurr,B)
          & v2553(VarCurr,B) ) ) ) )).

fof(addAssignment_1565,axiom,(
    ! [VarCurr] :
      ( v2553(VarCurr,bitIndex0)
    <=> v2453(VarCurr,bitIndex3) ) )).

fof(addAssignment_1564,axiom,(
    ! [VarCurr] :
      ( v2553(VarCurr,bitIndex1)
    <=> v2453(VarCurr,bitIndex3) ) )).

fof(addAssignment_1563,axiom,(
    ! [VarCurr] :
      ( v2553(VarCurr,bitIndex2)
    <=> v2453(VarCurr,bitIndex3) ) )).

fof(addAssignment_1562,axiom,(
    ! [VarCurr] :
      ( v2553(VarCurr,bitIndex3)
    <=> v2453(VarCurr,bitIndex3) ) )).

fof(addAssignment_1561,axiom,(
    ! [VarCurr] :
      ( v2553(VarCurr,bitIndex4)
    <=> v2453(VarCurr,bitIndex3) ) )).

fof(addAssignment_1560,axiom,(
    ! [VarCurr] :
      ( v2553(VarCurr,bitIndex5)
    <=> v2453(VarCurr,bitIndex3) ) )).

fof(addAssignment_1559,axiom,(
    ! [VarCurr] :
      ( v2553(VarCurr,bitIndex6)
    <=> v2453(VarCurr,bitIndex3) ) )).

fof(addAssignment_1558,axiom,(
    ! [VarCurr] :
      ( v2553(VarCurr,bitIndex7)
    <=> v2453(VarCurr,bitIndex3) ) )).

fof(addAssignment_1557,axiom,(
    ! [VarCurr] :
      ( v2553(VarCurr,bitIndex8)
    <=> v2453(VarCurr,bitIndex3) ) )).

fof(addAssignment_1556,axiom,(
    ! [VarCurr] :
      ( v2553(VarCurr,bitIndex9)
    <=> v2453(VarCurr,bitIndex3) ) )).

fof(addAssignment_1555,axiom,(
    ! [VarCurr] :
      ( v2553(VarCurr,bitIndex10)
    <=> v2453(VarCurr,bitIndex3) ) )).

fof(addAssignment_1554,axiom,(
    ! [VarCurr] :
      ( v2553(VarCurr,bitIndex11)
    <=> v2453(VarCurr,bitIndex3) ) )).

fof(addAssignment_1553,axiom,(
    ! [VarCurr] :
      ( v2553(VarCurr,bitIndex12)
    <=> v2453(VarCurr,bitIndex3) ) )).

fof(addAssignment_1552,axiom,(
    ! [VarCurr] :
      ( v2553(VarCurr,bitIndex13)
    <=> v2453(VarCurr,bitIndex3) ) )).

fof(addAssignment_1551,axiom,(
    ! [VarCurr] :
      ( v2553(VarCurr,bitIndex14)
    <=> v2453(VarCurr,bitIndex3) ) )).

fof(addAssignment_1550,axiom,(
    ! [VarCurr] :
      ( v2553(VarCurr,bitIndex15)
    <=> v2453(VarCurr,bitIndex3) ) )).

fof(addAssignment_1549,axiom,(
    ! [VarCurr] :
      ( v2553(VarCurr,bitIndex16)
    <=> v2453(VarCurr,bitIndex3) ) )).

fof(addAssignment_1548,axiom,(
    ! [VarCurr] :
      ( v2553(VarCurr,bitIndex17)
    <=> v2453(VarCurr,bitIndex3) ) )).

fof(addAssignment_1547,axiom,(
    ! [VarCurr] :
      ( v2553(VarCurr,bitIndex18)
    <=> v2453(VarCurr,bitIndex3) ) )).

fof(addAssignment_1546,axiom,(
    ! [VarCurr] :
      ( v2553(VarCurr,bitIndex19)
    <=> v2453(VarCurr,bitIndex3) ) )).

fof(addAssignment_1545,axiom,(
    ! [VarCurr] :
      ( v2553(VarCurr,bitIndex20)
    <=> v2453(VarCurr,bitIndex3) ) )).

fof(addAssignment_1544,axiom,(
    ! [VarCurr] :
      ( v2553(VarCurr,bitIndex21)
    <=> v2453(VarCurr,bitIndex3) ) )).

fof(addAssignment_1543,axiom,(
    ! [VarCurr] :
      ( v2553(VarCurr,bitIndex22)
    <=> v2453(VarCurr,bitIndex3) ) )).

fof(addAssignment_1542,axiom,(
    ! [VarCurr] :
      ( v2553(VarCurr,bitIndex23)
    <=> v2453(VarCurr,bitIndex3) ) )).

fof(addAssignment_1541,axiom,(
    ! [VarCurr] :
      ( v2553(VarCurr,bitIndex24)
    <=> v2453(VarCurr,bitIndex3) ) )).

fof(addAssignment_1540,axiom,(
    ! [VarCurr] :
      ( v2553(VarCurr,bitIndex25)
    <=> v2453(VarCurr,bitIndex3) ) )).

fof(addAssignment_1539,axiom,(
    ! [VarCurr] :
      ( v2553(VarCurr,bitIndex26)
    <=> v2453(VarCurr,bitIndex3) ) )).

fof(addAssignment_1538,axiom,(
    ! [VarCurr] :
      ( v2553(VarCurr,bitIndex27)
    <=> v2453(VarCurr,bitIndex3) ) )).

fof(addAssignment_1537,axiom,(
    ! [VarCurr] :
      ( v2553(VarCurr,bitIndex28)
    <=> v2453(VarCurr,bitIndex3) ) )).

fof(addAssignment_1536,axiom,(
    ! [VarCurr] :
      ( v2553(VarCurr,bitIndex29)
    <=> v2453(VarCurr,bitIndex3) ) )).

fof(addAssignment_1535,axiom,(
    ! [VarCurr] :
      ( v2553(VarCurr,bitIndex30)
    <=> v2453(VarCurr,bitIndex3) ) )).

fof(addAssignment_1534,axiom,(
    ! [VarCurr] :
      ( v2553(VarCurr,bitIndex31)
    <=> v2453(VarCurr,bitIndex3) ) )).

fof(addAssignment_1533,axiom,(
    ! [VarCurr] :
      ( v2553(VarCurr,bitIndex32)
    <=> v2453(VarCurr,bitIndex3) ) )).

fof(addAssignment_1532,axiom,(
    ! [VarCurr] :
      ( v2553(VarCurr,bitIndex33)
    <=> v2453(VarCurr,bitIndex3) ) )).

fof(addAssignment_1531,axiom,(
    ! [VarCurr] :
      ( v2553(VarCurr,bitIndex34)
    <=> v2453(VarCurr,bitIndex3) ) )).

fof(addAssignment_1530,axiom,(
    ! [VarCurr] :
      ( v2553(VarCurr,bitIndex35)
    <=> v2453(VarCurr,bitIndex3) ) )).

fof(addAssignment_1529,axiom,(
    ! [VarCurr] :
      ( v2553(VarCurr,bitIndex36)
    <=> v2453(VarCurr,bitIndex3) ) )).

fof(addAssignment_1528,axiom,(
    ! [VarCurr] :
      ( v2553(VarCurr,bitIndex37)
    <=> v2453(VarCurr,bitIndex3) ) )).

fof(addAssignment_1527,axiom,(
    ! [VarCurr] :
      ( v2553(VarCurr,bitIndex38)
    <=> v2453(VarCurr,bitIndex3) ) )).

fof(addAssignment_1526,axiom,(
    ! [VarCurr] :
      ( v2553(VarCurr,bitIndex39)
    <=> v2453(VarCurr,bitIndex3) ) )).

fof(addAssignment_1525,axiom,(
    ! [VarCurr,B] :
      ( range_31_0(B)
     => ( v2509(VarCurr,B)
      <=> v2511(VarCurr,B) ) ) )).

fof(addAssignment_1524,axiom,(
    ! [VarCurr] :
      ( ( v2509(VarCurr,bitIndex39)
      <=> $false )
      & ( v2509(VarCurr,bitIndex38)
      <=> $false )
      & ( v2509(VarCurr,bitIndex37)
      <=> $false )
      & ( v2509(VarCurr,bitIndex36)
      <=> $false )
      & ( v2509(VarCurr,bitIndex35)
      <=> $false )
      & ( v2509(VarCurr,bitIndex34)
      <=> $false )
      & ( v2509(VarCurr,bitIndex33)
      <=> $false )
      & ( v2509(VarCurr,bitIndex32)
      <=> $false ) ) )).

fof(bitBlastConstant_523,axiom,(
    ~ b00000000(bitIndex7) )).

fof(bitBlastConstant_522,axiom,(
    ~ b00000000(bitIndex6) )).

fof(bitBlastConstant_521,axiom,(
    ~ b00000000(bitIndex5) )).

fof(bitBlastConstant_520,axiom,(
    ~ b00000000(bitIndex4) )).

fof(bitBlastConstant_519,axiom,(
    ~ b00000000(bitIndex3) )).

fof(bitBlastConstant_518,axiom,(
    ~ b00000000(bitIndex2) )).

fof(bitBlastConstant_517,axiom,(
    ~ b00000000(bitIndex1) )).

fof(bitBlastConstant_516,axiom,(
    ~ b00000000(bitIndex0) )).

fof(writeBinaryOperatorEqualRangesMultipleBits_42,axiom,(
    ! [VarCurr,B] :
      ( range_31_0(B)
     => ( v2511(VarCurr,B)
      <=> ( v2512(VarCurr,B)
          | v2532(VarCurr,B) ) ) ) )).

fof(writeBinaryOperatorEqualRangesMultipleBits_41,axiom,(
    ! [VarCurr,B] :
      ( range_31_0(B)
     => ( v2532(VarCurr,B)
      <=> ( v2533(VarCurr,B)
          & v2552(VarCurr,B) ) ) ) )).

fof(addAssignment_1523,axiom,(
    ! [VarCurr] :
      ( v2552(VarCurr,bitIndex0)
    <=> v2453(VarCurr,bitIndex2) ) )).

fof(addAssignment_1522,axiom,(
    ! [VarCurr] :
      ( v2552(VarCurr,bitIndex1)
    <=> v2453(VarCurr,bitIndex2) ) )).

fof(addAssignment_1521,axiom,(
    ! [VarCurr] :
      ( v2552(VarCurr,bitIndex2)
    <=> v2453(VarCurr,bitIndex2) ) )).

fof(addAssignment_1520,axiom,(
    ! [VarCurr] :
      ( v2552(VarCurr,bitIndex3)
    <=> v2453(VarCurr,bitIndex2) ) )).

fof(addAssignment_1519,axiom,(
    ! [VarCurr] :
      ( v2552(VarCurr,bitIndex4)
    <=> v2453(VarCurr,bitIndex2) ) )).

fof(addAssignment_1518,axiom,(
    ! [VarCurr] :
      ( v2552(VarCurr,bitIndex5)
    <=> v2453(VarCurr,bitIndex2) ) )).

fof(addAssignment_1517,axiom,(
    ! [VarCurr] :
      ( v2552(VarCurr,bitIndex6)
    <=> v2453(VarCurr,bitIndex2) ) )).

fof(addAssignment_1516,axiom,(
    ! [VarCurr] :
      ( v2552(VarCurr,bitIndex7)
    <=> v2453(VarCurr,bitIndex2) ) )).

fof(addAssignment_1515,axiom,(
    ! [VarCurr] :
      ( v2552(VarCurr,bitIndex8)
    <=> v2453(VarCurr,bitIndex2) ) )).

fof(addAssignment_1514,axiom,(
    ! [VarCurr] :
      ( v2552(VarCurr,bitIndex9)
    <=> v2453(VarCurr,bitIndex2) ) )).

fof(addAssignment_1513,axiom,(
    ! [VarCurr] :
      ( v2552(VarCurr,bitIndex10)
    <=> v2453(VarCurr,bitIndex2) ) )).

fof(addAssignment_1512,axiom,(
    ! [VarCurr] :
      ( v2552(VarCurr,bitIndex11)
    <=> v2453(VarCurr,bitIndex2) ) )).

fof(addAssignment_1511,axiom,(
    ! [VarCurr] :
      ( v2552(VarCurr,bitIndex12)
    <=> v2453(VarCurr,bitIndex2) ) )).

fof(addAssignment_1510,axiom,(
    ! [VarCurr] :
      ( v2552(VarCurr,bitIndex13)
    <=> v2453(VarCurr,bitIndex2) ) )).

fof(addAssignment_1509,axiom,(
    ! [VarCurr] :
      ( v2552(VarCurr,bitIndex14)
    <=> v2453(VarCurr,bitIndex2) ) )).

fof(addAssignment_1508,axiom,(
    ! [VarCurr] :
      ( v2552(VarCurr,bitIndex15)
    <=> v2453(VarCurr,bitIndex2) ) )).

fof(addAssignment_1507,axiom,(
    ! [VarCurr] :
      ( v2552(VarCurr,bitIndex16)
    <=> v2453(VarCurr,bitIndex2) ) )).

fof(addAssignment_1506,axiom,(
    ! [VarCurr] :
      ( v2552(VarCurr,bitIndex17)
    <=> v2453(VarCurr,bitIndex2) ) )).

fof(addAssignment_1505,axiom,(
    ! [VarCurr] :
      ( v2552(VarCurr,bitIndex18)
    <=> v2453(VarCurr,bitIndex2) ) )).

fof(addAssignment_1504,axiom,(
    ! [VarCurr] :
      ( v2552(VarCurr,bitIndex19)
    <=> v2453(VarCurr,bitIndex2) ) )).

fof(addAssignment_1503,axiom,(
    ! [VarCurr] :
      ( v2552(VarCurr,bitIndex20)
    <=> v2453(VarCurr,bitIndex2) ) )).

fof(addAssignment_1502,axiom,(
    ! [VarCurr] :
      ( v2552(VarCurr,bitIndex21)
    <=> v2453(VarCurr,bitIndex2) ) )).

fof(addAssignment_1501,axiom,(
    ! [VarCurr] :
      ( v2552(VarCurr,bitIndex22)
    <=> v2453(VarCurr,bitIndex2) ) )).

fof(addAssignment_1500,axiom,(
    ! [VarCurr] :
      ( v2552(VarCurr,bitIndex23)
    <=> v2453(VarCurr,bitIndex2) ) )).

fof(addAssignment_1499,axiom,(
    ! [VarCurr] :
      ( v2552(VarCurr,bitIndex24)
    <=> v2453(VarCurr,bitIndex2) ) )).

fof(addAssignment_1498,axiom,(
    ! [VarCurr] :
      ( v2552(VarCurr,bitIndex25)
    <=> v2453(VarCurr,bitIndex2) ) )).

fof(addAssignment_1497,axiom,(
    ! [VarCurr] :
      ( v2552(VarCurr,bitIndex26)
    <=> v2453(VarCurr,bitIndex2) ) )).

fof(addAssignment_1496,axiom,(
    ! [VarCurr] :
      ( v2552(VarCurr,bitIndex27)
    <=> v2453(VarCurr,bitIndex2) ) )).

fof(addAssignment_1495,axiom,(
    ! [VarCurr] :
      ( v2552(VarCurr,bitIndex28)
    <=> v2453(VarCurr,bitIndex2) ) )).

fof(addAssignment_1494,axiom,(
    ! [VarCurr] :
      ( v2552(VarCurr,bitIndex29)
    <=> v2453(VarCurr,bitIndex2) ) )).

fof(addAssignment_1493,axiom,(
    ! [VarCurr] :
      ( v2552(VarCurr,bitIndex30)
    <=> v2453(VarCurr,bitIndex2) ) )).

fof(addAssignment_1492,axiom,(
    ! [VarCurr] :
      ( v2552(VarCurr,bitIndex31)
    <=> v2453(VarCurr,bitIndex2) ) )).

fof(addAssignment_1491,axiom,(
    ! [VarCurr,B] :
      ( range_27_0(B)
     => ( v2533(VarCurr,B)
      <=> v2534(VarCurr,B) ) ) )).

fof(addAssignment_1490,axiom,(
    ! [VarCurr] :
      ( ( v2533(VarCurr,bitIndex31)
      <=> $false )
      & ( v2533(VarCurr,bitIndex30)
      <=> $false )
      & ( v2533(VarCurr,bitIndex29)
      <=> $false )
      & ( v2533(VarCurr,bitIndex28)
      <=> $false ) ) )).

fof(writeBinaryOperatorEqualRangesMultipleBits_40,axiom,(
    ! [VarCurr,B] :
      ( range_27_0(B)
     => ( v2534(VarCurr,B)
      <=> ( v2535(VarCurr,B)
          | v2543(VarCurr,B) ) ) ) )).

fof(writeBinaryOperatorEqualRangesMultipleBits_39,axiom,(
    ! [VarCurr,B] :
      ( range_27_0(B)
     => ( v2543(VarCurr,B)
      <=> ( v2544(VarCurr,B)
          & v2551(VarCurr,B) ) ) ) )).

fof(addAssignment_1489,axiom,(
    ! [VarCurr] :
      ( v2551(VarCurr,bitIndex0)
    <=> v2453(VarCurr,bitIndex1) ) )).

fof(addAssignment_1488,axiom,(
    ! [VarCurr] :
      ( v2551(VarCurr,bitIndex1)
    <=> v2453(VarCurr,bitIndex1) ) )).

fof(addAssignment_1487,axiom,(
    ! [VarCurr] :
      ( v2551(VarCurr,bitIndex2)
    <=> v2453(VarCurr,bitIndex1) ) )).

fof(addAssignment_1486,axiom,(
    ! [VarCurr] :
      ( v2551(VarCurr,bitIndex3)
    <=> v2453(VarCurr,bitIndex1) ) )).

fof(addAssignment_1485,axiom,(
    ! [VarCurr] :
      ( v2551(VarCurr,bitIndex4)
    <=> v2453(VarCurr,bitIndex1) ) )).

fof(addAssignment_1484,axiom,(
    ! [VarCurr] :
      ( v2551(VarCurr,bitIndex5)
    <=> v2453(VarCurr,bitIndex1) ) )).

fof(addAssignment_1483,axiom,(
    ! [VarCurr] :
      ( v2551(VarCurr,bitIndex6)
    <=> v2453(VarCurr,bitIndex1) ) )).

fof(addAssignment_1482,axiom,(
    ! [VarCurr] :
      ( v2551(VarCurr,bitIndex7)
    <=> v2453(VarCurr,bitIndex1) ) )).

fof(addAssignment_1481,axiom,(
    ! [VarCurr] :
      ( v2551(VarCurr,bitIndex8)
    <=> v2453(VarCurr,bitIndex1) ) )).

fof(addAssignment_1480,axiom,(
    ! [VarCurr] :
      ( v2551(VarCurr,bitIndex9)
    <=> v2453(VarCurr,bitIndex1) ) )).

fof(addAssignment_1479,axiom,(
    ! [VarCurr] :
      ( v2551(VarCurr,bitIndex10)
    <=> v2453(VarCurr,bitIndex1) ) )).

fof(addAssignment_1478,axiom,(
    ! [VarCurr] :
      ( v2551(VarCurr,bitIndex11)
    <=> v2453(VarCurr,bitIndex1) ) )).

fof(addAssignment_1477,axiom,(
    ! [VarCurr] :
      ( v2551(VarCurr,bitIndex12)
    <=> v2453(VarCurr,bitIndex1) ) )).

fof(addAssignment_1476,axiom,(
    ! [VarCurr] :
      ( v2551(VarCurr,bitIndex13)
    <=> v2453(VarCurr,bitIndex1) ) )).

fof(addAssignment_1475,axiom,(
    ! [VarCurr] :
      ( v2551(VarCurr,bitIndex14)
    <=> v2453(VarCurr,bitIndex1) ) )).

fof(addAssignment_1474,axiom,(
    ! [VarCurr] :
      ( v2551(VarCurr,bitIndex15)
    <=> v2453(VarCurr,bitIndex1) ) )).

fof(addAssignment_1473,axiom,(
    ! [VarCurr] :
      ( v2551(VarCurr,bitIndex16)
    <=> v2453(VarCurr,bitIndex1) ) )).

fof(addAssignment_1472,axiom,(
    ! [VarCurr] :
      ( v2551(VarCurr,bitIndex17)
    <=> v2453(VarCurr,bitIndex1) ) )).

fof(addAssignment_1471,axiom,(
    ! [VarCurr] :
      ( v2551(VarCurr,bitIndex18)
    <=> v2453(VarCurr,bitIndex1) ) )).

fof(addAssignment_1470,axiom,(
    ! [VarCurr] :
      ( v2551(VarCurr,bitIndex19)
    <=> v2453(VarCurr,bitIndex1) ) )).

fof(addAssignment_1469,axiom,(
    ! [VarCurr] :
      ( v2551(VarCurr,bitIndex20)
    <=> v2453(VarCurr,bitIndex1) ) )).

fof(addAssignment_1468,axiom,(
    ! [VarCurr] :
      ( v2551(VarCurr,bitIndex21)
    <=> v2453(VarCurr,bitIndex1) ) )).

fof(addAssignment_1467,axiom,(
    ! [VarCurr] :
      ( v2551(VarCurr,bitIndex22)
    <=> v2453(VarCurr,bitIndex1) ) )).

fof(addAssignment_1466,axiom,(
    ! [VarCurr] :
      ( v2551(VarCurr,bitIndex23)
    <=> v2453(VarCurr,bitIndex1) ) )).

fof(addAssignment_1465,axiom,(
    ! [VarCurr] :
      ( v2551(VarCurr,bitIndex24)
    <=> v2453(VarCurr,bitIndex1) ) )).

fof(addAssignment_1464,axiom,(
    ! [VarCurr] :
      ( v2551(VarCurr,bitIndex25)
    <=> v2453(VarCurr,bitIndex1) ) )).

fof(addAssignment_1463,axiom,(
    ! [VarCurr] :
      ( v2551(VarCurr,bitIndex26)
    <=> v2453(VarCurr,bitIndex1) ) )).

fof(addAssignment_1462,axiom,(
    ! [VarCurr] :
      ( v2551(VarCurr,bitIndex27)
    <=> v2453(VarCurr,bitIndex1) ) )).

fof(addAssignment_1461,axiom,(
    ! [VarCurr,B] :
      ( range_25_0(B)
     => ( v2544(VarCurr,B)
      <=> v2545(VarCurr,B) ) ) )).

fof(addAssignment_1460,axiom,(
    ! [VarCurr] :
      ( ( v2544(VarCurr,bitIndex27)
      <=> $false )
      & ( v2544(VarCurr,bitIndex26)
      <=> $false ) ) )).

fof(writeBinaryOperatorEqualRangesMultipleBits_38,axiom,(
    ! [VarCurr,B] :
      ( range_25_0(B)
     => ( v2545(VarCurr,B)
      <=> ( v2546(VarCurr,B)
          | v2548(VarCurr,B) ) ) ) )).

fof(writeBinaryOperatorEqualRangesMultipleBits_37,axiom,(
    ! [VarCurr,B] :
      ( range_25_0(B)
     => ( v2548(VarCurr,B)
      <=> ( v2549(VarCurr,B)
          & v2550(VarCurr,B) ) ) ) )).

fof(range_axiom_21,axiom,(
    ! [B] :
      ( range_25_0(B)
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
        | bitIndex25 = B ) ) )).

fof(addAssignment_1459,axiom,(
    ! [VarCurr] :
      ( v2550(VarCurr,bitIndex0)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_1458,axiom,(
    ! [VarCurr] :
      ( v2550(VarCurr,bitIndex1)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_1457,axiom,(
    ! [VarCurr] :
      ( v2550(VarCurr,bitIndex2)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_1456,axiom,(
    ! [VarCurr] :
      ( v2550(VarCurr,bitIndex3)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_1455,axiom,(
    ! [VarCurr] :
      ( v2550(VarCurr,bitIndex4)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_1454,axiom,(
    ! [VarCurr] :
      ( v2550(VarCurr,bitIndex5)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_1453,axiom,(
    ! [VarCurr] :
      ( v2550(VarCurr,bitIndex6)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_1452,axiom,(
    ! [VarCurr] :
      ( v2550(VarCurr,bitIndex7)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_1451,axiom,(
    ! [VarCurr] :
      ( v2550(VarCurr,bitIndex8)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_1450,axiom,(
    ! [VarCurr] :
      ( v2550(VarCurr,bitIndex9)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_1449,axiom,(
    ! [VarCurr] :
      ( v2550(VarCurr,bitIndex10)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_1448,axiom,(
    ! [VarCurr] :
      ( v2550(VarCurr,bitIndex11)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_1447,axiom,(
    ! [VarCurr] :
      ( v2550(VarCurr,bitIndex12)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_1446,axiom,(
    ! [VarCurr] :
      ( v2550(VarCurr,bitIndex13)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_1445,axiom,(
    ! [VarCurr] :
      ( v2550(VarCurr,bitIndex14)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_1444,axiom,(
    ! [VarCurr] :
      ( v2550(VarCurr,bitIndex15)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_1443,axiom,(
    ! [VarCurr] :
      ( v2550(VarCurr,bitIndex16)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_1442,axiom,(
    ! [VarCurr] :
      ( v2550(VarCurr,bitIndex17)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_1441,axiom,(
    ! [VarCurr] :
      ( v2550(VarCurr,bitIndex18)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_1440,axiom,(
    ! [VarCurr] :
      ( v2550(VarCurr,bitIndex19)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_1439,axiom,(
    ! [VarCurr] :
      ( v2550(VarCurr,bitIndex20)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_1438,axiom,(
    ! [VarCurr] :
      ( v2550(VarCurr,bitIndex21)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_1437,axiom,(
    ! [VarCurr] :
      ( v2550(VarCurr,bitIndex22)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_1436,axiom,(
    ! [VarCurr] :
      ( v2550(VarCurr,bitIndex23)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_1435,axiom,(
    ! [VarCurr] :
      ( v2550(VarCurr,bitIndex24)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_1434,axiom,(
    ! [VarCurr] :
      ( v2550(VarCurr,bitIndex25)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_1433,axiom,(
    ! [VarCurr] :
      ( ( v2549(VarCurr,bitIndex24)
      <=> v2465(VarCurr,bitIndex39) )
      & ( v2549(VarCurr,bitIndex23)
      <=> v2465(VarCurr,bitIndex38) )
      & ( v2549(VarCurr,bitIndex22)
      <=> v2465(VarCurr,bitIndex37) )
      & ( v2549(VarCurr,bitIndex21)
      <=> v2465(VarCurr,bitIndex36) )
      & ( v2549(VarCurr,bitIndex20)
      <=> v2465(VarCurr,bitIndex35) )
      & ( v2549(VarCurr,bitIndex19)
      <=> v2465(VarCurr,bitIndex34) )
      & ( v2549(VarCurr,bitIndex18)
      <=> v2465(VarCurr,bitIndex33) )
      & ( v2549(VarCurr,bitIndex17)
      <=> v2465(VarCurr,bitIndex32) )
      & ( v2549(VarCurr,bitIndex16)
      <=> v2465(VarCurr,bitIndex31) )
      & ( v2549(VarCurr,bitIndex15)
      <=> v2465(VarCurr,bitIndex30) )
      & ( v2549(VarCurr,bitIndex14)
      <=> v2465(VarCurr,bitIndex29) )
      & ( v2549(VarCurr,bitIndex13)
      <=> v2465(VarCurr,bitIndex28) )
      & ( v2549(VarCurr,bitIndex12)
      <=> v2465(VarCurr,bitIndex27) )
      & ( v2549(VarCurr,bitIndex11)
      <=> v2465(VarCurr,bitIndex26) )
      & ( v2549(VarCurr,bitIndex10)
      <=> v2465(VarCurr,bitIndex25) )
      & ( v2549(VarCurr,bitIndex9)
      <=> v2465(VarCurr,bitIndex24) )
      & ( v2549(VarCurr,bitIndex8)
      <=> v2465(VarCurr,bitIndex23) )
      & ( v2549(VarCurr,bitIndex7)
      <=> v2465(VarCurr,bitIndex22) )
      & ( v2549(VarCurr,bitIndex6)
      <=> v2465(VarCurr,bitIndex21) )
      & ( v2549(VarCurr,bitIndex5)
      <=> v2465(VarCurr,bitIndex20) )
      & ( v2549(VarCurr,bitIndex4)
      <=> v2465(VarCurr,bitIndex19) )
      & ( v2549(VarCurr,bitIndex3)
      <=> v2465(VarCurr,bitIndex18) )
      & ( v2549(VarCurr,bitIndex2)
      <=> v2465(VarCurr,bitIndex17) )
      & ( v2549(VarCurr,bitIndex1)
      <=> v2465(VarCurr,bitIndex16) )
      & ( v2549(VarCurr,bitIndex0)
      <=> v2465(VarCurr,bitIndex15) ) ) )).

fof(addAssignment_1432,axiom,(
    ! [VarCurr] :
      ( v2549(VarCurr,bitIndex25)
    <=> $false ) )).

fof(writeBinaryOperatorShiftedRanges_330,axiom,(
    ! [VarCurr] :
      ( v2546(VarCurr,bitIndex0)
    <=> ( v2465(VarCurr,bitIndex14)
        & v2547(VarCurr,bitIndex0) ) ) )).

fof(writeBinaryOperatorShiftedRanges_329,axiom,(
    ! [VarCurr] :
      ( v2546(VarCurr,bitIndex1)
    <=> ( v2465(VarCurr,bitIndex15)
        & v2547(VarCurr,bitIndex1) ) ) )).

fof(writeBinaryOperatorShiftedRanges_328,axiom,(
    ! [VarCurr] :
      ( v2546(VarCurr,bitIndex2)
    <=> ( v2465(VarCurr,bitIndex16)
        & v2547(VarCurr,bitIndex2) ) ) )).

fof(writeBinaryOperatorShiftedRanges_327,axiom,(
    ! [VarCurr] :
      ( v2546(VarCurr,bitIndex3)
    <=> ( v2465(VarCurr,bitIndex17)
        & v2547(VarCurr,bitIndex3) ) ) )).

fof(writeBinaryOperatorShiftedRanges_326,axiom,(
    ! [VarCurr] :
      ( v2546(VarCurr,bitIndex4)
    <=> ( v2465(VarCurr,bitIndex18)
        & v2547(VarCurr,bitIndex4) ) ) )).

fof(writeBinaryOperatorShiftedRanges_325,axiom,(
    ! [VarCurr] :
      ( v2546(VarCurr,bitIndex5)
    <=> ( v2465(VarCurr,bitIndex19)
        & v2547(VarCurr,bitIndex5) ) ) )).

fof(writeBinaryOperatorShiftedRanges_324,axiom,(
    ! [VarCurr] :
      ( v2546(VarCurr,bitIndex6)
    <=> ( v2465(VarCurr,bitIndex20)
        & v2547(VarCurr,bitIndex6) ) ) )).

fof(writeBinaryOperatorShiftedRanges_323,axiom,(
    ! [VarCurr] :
      ( v2546(VarCurr,bitIndex7)
    <=> ( v2465(VarCurr,bitIndex21)
        & v2547(VarCurr,bitIndex7) ) ) )).

fof(writeBinaryOperatorShiftedRanges_322,axiom,(
    ! [VarCurr] :
      ( v2546(VarCurr,bitIndex8)
    <=> ( v2465(VarCurr,bitIndex22)
        & v2547(VarCurr,bitIndex8) ) ) )).

fof(writeBinaryOperatorShiftedRanges_321,axiom,(
    ! [VarCurr] :
      ( v2546(VarCurr,bitIndex9)
    <=> ( v2465(VarCurr,bitIndex23)
        & v2547(VarCurr,bitIndex9) ) ) )).

fof(writeBinaryOperatorShiftedRanges_320,axiom,(
    ! [VarCurr] :
      ( v2546(VarCurr,bitIndex10)
    <=> ( v2465(VarCurr,bitIndex24)
        & v2547(VarCurr,bitIndex10) ) ) )).

fof(writeBinaryOperatorShiftedRanges_319,axiom,(
    ! [VarCurr] :
      ( v2546(VarCurr,bitIndex11)
    <=> ( v2465(VarCurr,bitIndex25)
        & v2547(VarCurr,bitIndex11) ) ) )).

fof(writeBinaryOperatorShiftedRanges_318,axiom,(
    ! [VarCurr] :
      ( v2546(VarCurr,bitIndex12)
    <=> ( v2465(VarCurr,bitIndex26)
        & v2547(VarCurr,bitIndex12) ) ) )).

fof(writeBinaryOperatorShiftedRanges_317,axiom,(
    ! [VarCurr] :
      ( v2546(VarCurr,bitIndex13)
    <=> ( v2465(VarCurr,bitIndex27)
        & v2547(VarCurr,bitIndex13) ) ) )).

fof(writeBinaryOperatorShiftedRanges_316,axiom,(
    ! [VarCurr] :
      ( v2546(VarCurr,bitIndex14)
    <=> ( v2465(VarCurr,bitIndex28)
        & v2547(VarCurr,bitIndex14) ) ) )).

fof(writeBinaryOperatorShiftedRanges_315,axiom,(
    ! [VarCurr] :
      ( v2546(VarCurr,bitIndex15)
    <=> ( v2465(VarCurr,bitIndex29)
        & v2547(VarCurr,bitIndex15) ) ) )).

fof(writeBinaryOperatorShiftedRanges_314,axiom,(
    ! [VarCurr] :
      ( v2546(VarCurr,bitIndex16)
    <=> ( v2465(VarCurr,bitIndex30)
        & v2547(VarCurr,bitIndex16) ) ) )).

fof(writeBinaryOperatorShiftedRanges_313,axiom,(
    ! [VarCurr] :
      ( v2546(VarCurr,bitIndex17)
    <=> ( v2465(VarCurr,bitIndex31)
        & v2547(VarCurr,bitIndex17) ) ) )).

fof(writeBinaryOperatorShiftedRanges_312,axiom,(
    ! [VarCurr] :
      ( v2546(VarCurr,bitIndex18)
    <=> ( v2465(VarCurr,bitIndex32)
        & v2547(VarCurr,bitIndex18) ) ) )).

fof(writeBinaryOperatorShiftedRanges_311,axiom,(
    ! [VarCurr] :
      ( v2546(VarCurr,bitIndex19)
    <=> ( v2465(VarCurr,bitIndex33)
        & v2547(VarCurr,bitIndex19) ) ) )).

fof(writeBinaryOperatorShiftedRanges_310,axiom,(
    ! [VarCurr] :
      ( v2546(VarCurr,bitIndex20)
    <=> ( v2465(VarCurr,bitIndex34)
        & v2547(VarCurr,bitIndex20) ) ) )).

fof(writeBinaryOperatorShiftedRanges_309,axiom,(
    ! [VarCurr] :
      ( v2546(VarCurr,bitIndex21)
    <=> ( v2465(VarCurr,bitIndex35)
        & v2547(VarCurr,bitIndex21) ) ) )).

fof(writeBinaryOperatorShiftedRanges_308,axiom,(
    ! [VarCurr] :
      ( v2546(VarCurr,bitIndex22)
    <=> ( v2465(VarCurr,bitIndex36)
        & v2547(VarCurr,bitIndex22) ) ) )).

fof(writeBinaryOperatorShiftedRanges_307,axiom,(
    ! [VarCurr] :
      ( v2546(VarCurr,bitIndex23)
    <=> ( v2465(VarCurr,bitIndex37)
        & v2547(VarCurr,bitIndex23) ) ) )).

fof(writeBinaryOperatorShiftedRanges_306,axiom,(
    ! [VarCurr] :
      ( v2546(VarCurr,bitIndex24)
    <=> ( v2465(VarCurr,bitIndex38)
        & v2547(VarCurr,bitIndex24) ) ) )).

fof(writeBinaryOperatorShiftedRanges_305,axiom,(
    ! [VarCurr] :
      ( v2546(VarCurr,bitIndex25)
    <=> ( v2465(VarCurr,bitIndex39)
        & v2547(VarCurr,bitIndex25) ) ) )).

fof(addAssignment_1431,axiom,(
    ! [VarCurr] :
      ( v2547(VarCurr,bitIndex0)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_1430,axiom,(
    ! [VarCurr] :
      ( v2547(VarCurr,bitIndex1)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_1429,axiom,(
    ! [VarCurr] :
      ( v2547(VarCurr,bitIndex2)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_1428,axiom,(
    ! [VarCurr] :
      ( v2547(VarCurr,bitIndex3)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_1427,axiom,(
    ! [VarCurr] :
      ( v2547(VarCurr,bitIndex4)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_1426,axiom,(
    ! [VarCurr] :
      ( v2547(VarCurr,bitIndex5)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_1425,axiom,(
    ! [VarCurr] :
      ( v2547(VarCurr,bitIndex6)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_1424,axiom,(
    ! [VarCurr] :
      ( v2547(VarCurr,bitIndex7)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_1423,axiom,(
    ! [VarCurr] :
      ( v2547(VarCurr,bitIndex8)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_1422,axiom,(
    ! [VarCurr] :
      ( v2547(VarCurr,bitIndex9)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_1421,axiom,(
    ! [VarCurr] :
      ( v2547(VarCurr,bitIndex10)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_1420,axiom,(
    ! [VarCurr] :
      ( v2547(VarCurr,bitIndex11)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_1419,axiom,(
    ! [VarCurr] :
      ( v2547(VarCurr,bitIndex12)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_1418,axiom,(
    ! [VarCurr] :
      ( v2547(VarCurr,bitIndex13)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_1417,axiom,(
    ! [VarCurr] :
      ( v2547(VarCurr,bitIndex14)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_1416,axiom,(
    ! [VarCurr] :
      ( v2547(VarCurr,bitIndex15)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_1415,axiom,(
    ! [VarCurr] :
      ( v2547(VarCurr,bitIndex16)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_1414,axiom,(
    ! [VarCurr] :
      ( v2547(VarCurr,bitIndex17)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_1413,axiom,(
    ! [VarCurr] :
      ( v2547(VarCurr,bitIndex18)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_1412,axiom,(
    ! [VarCurr] :
      ( v2547(VarCurr,bitIndex19)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_1411,axiom,(
    ! [VarCurr] :
      ( v2547(VarCurr,bitIndex20)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_1410,axiom,(
    ! [VarCurr] :
      ( v2547(VarCurr,bitIndex21)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_1409,axiom,(
    ! [VarCurr] :
      ( v2547(VarCurr,bitIndex22)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_1408,axiom,(
    ! [VarCurr] :
      ( v2547(VarCurr,bitIndex23)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_1407,axiom,(
    ! [VarCurr] :
      ( v2547(VarCurr,bitIndex24)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_1406,axiom,(
    ! [VarCurr] :
      ( v2547(VarCurr,bitIndex25)
    <=> v2468(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesMultipleBits_36,axiom,(
    ! [VarCurr,B] :
      ( range_27_0(B)
     => ( v2535(VarCurr,B)
      <=> ( v2536(VarCurr,B)
          & v2542(VarCurr,B) ) ) ) )).

fof(addAssignment_1405,axiom,(
    ! [VarCurr] :
      ( v2542(VarCurr,bitIndex0)
    <=> v2473(VarCurr) ) )).

fof(addAssignment_1404,axiom,(
    ! [VarCurr] :
      ( v2542(VarCurr,bitIndex1)
    <=> v2473(VarCurr) ) )).

fof(addAssignment_1403,axiom,(
    ! [VarCurr] :
      ( v2542(VarCurr,bitIndex2)
    <=> v2473(VarCurr) ) )).

fof(addAssignment_1402,axiom,(
    ! [VarCurr] :
      ( v2542(VarCurr,bitIndex3)
    <=> v2473(VarCurr) ) )).

fof(addAssignment_1401,axiom,(
    ! [VarCurr] :
      ( v2542(VarCurr,bitIndex4)
    <=> v2473(VarCurr) ) )).

fof(addAssignment_1400,axiom,(
    ! [VarCurr] :
      ( v2542(VarCurr,bitIndex5)
    <=> v2473(VarCurr) ) )).

fof(addAssignment_1399,axiom,(
    ! [VarCurr] :
      ( v2542(VarCurr,bitIndex6)
    <=> v2473(VarCurr) ) )).

fof(addAssignment_1398,axiom,(
    ! [VarCurr] :
      ( v2542(VarCurr,bitIndex7)
    <=> v2473(VarCurr) ) )).

fof(addAssignment_1397,axiom,(
    ! [VarCurr] :
      ( v2542(VarCurr,bitIndex8)
    <=> v2473(VarCurr) ) )).

fof(addAssignment_1396,axiom,(
    ! [VarCurr] :
      ( v2542(VarCurr,bitIndex9)
    <=> v2473(VarCurr) ) )).

fof(addAssignment_1395,axiom,(
    ! [VarCurr] :
      ( v2542(VarCurr,bitIndex10)
    <=> v2473(VarCurr) ) )).

fof(addAssignment_1394,axiom,(
    ! [VarCurr] :
      ( v2542(VarCurr,bitIndex11)
    <=> v2473(VarCurr) ) )).

fof(addAssignment_1393,axiom,(
    ! [VarCurr] :
      ( v2542(VarCurr,bitIndex12)
    <=> v2473(VarCurr) ) )).

fof(addAssignment_1392,axiom,(
    ! [VarCurr] :
      ( v2542(VarCurr,bitIndex13)
    <=> v2473(VarCurr) ) )).

fof(addAssignment_1391,axiom,(
    ! [VarCurr] :
      ( v2542(VarCurr,bitIndex14)
    <=> v2473(VarCurr) ) )).

fof(addAssignment_1390,axiom,(
    ! [VarCurr] :
      ( v2542(VarCurr,bitIndex15)
    <=> v2473(VarCurr) ) )).

fof(addAssignment_1389,axiom,(
    ! [VarCurr] :
      ( v2542(VarCurr,bitIndex16)
    <=> v2473(VarCurr) ) )).

fof(addAssignment_1388,axiom,(
    ! [VarCurr] :
      ( v2542(VarCurr,bitIndex17)
    <=> v2473(VarCurr) ) )).

fof(addAssignment_1387,axiom,(
    ! [VarCurr] :
      ( v2542(VarCurr,bitIndex18)
    <=> v2473(VarCurr) ) )).

fof(addAssignment_1386,axiom,(
    ! [VarCurr] :
      ( v2542(VarCurr,bitIndex19)
    <=> v2473(VarCurr) ) )).

fof(addAssignment_1385,axiom,(
    ! [VarCurr] :
      ( v2542(VarCurr,bitIndex20)
    <=> v2473(VarCurr) ) )).

fof(addAssignment_1384,axiom,(
    ! [VarCurr] :
      ( v2542(VarCurr,bitIndex21)
    <=> v2473(VarCurr) ) )).

fof(addAssignment_1383,axiom,(
    ! [VarCurr] :
      ( v2542(VarCurr,bitIndex22)
    <=> v2473(VarCurr) ) )).

fof(addAssignment_1382,axiom,(
    ! [VarCurr] :
      ( v2542(VarCurr,bitIndex23)
    <=> v2473(VarCurr) ) )).

fof(addAssignment_1381,axiom,(
    ! [VarCurr] :
      ( v2542(VarCurr,bitIndex24)
    <=> v2473(VarCurr) ) )).

fof(addAssignment_1380,axiom,(
    ! [VarCurr] :
      ( v2542(VarCurr,bitIndex25)
    <=> v2473(VarCurr) ) )).

fof(addAssignment_1379,axiom,(
    ! [VarCurr] :
      ( v2542(VarCurr,bitIndex26)
    <=> v2473(VarCurr) ) )).

fof(addAssignment_1378,axiom,(
    ! [VarCurr] :
      ( v2542(VarCurr,bitIndex27)
    <=> v2473(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesMultipleBits_35,axiom,(
    ! [VarCurr,B] :
      ( range_27_0(B)
     => ( v2536(VarCurr,B)
      <=> ( v2537(VarCurr,B)
          | v2539(VarCurr,B) ) ) ) )).

fof(writeBinaryOperatorEqualRangesMultipleBits_34,axiom,(
    ! [VarCurr,B] :
      ( range_27_0(B)
     => ( v2539(VarCurr,B)
      <=> ( v2540(VarCurr,B)
          & v2541(VarCurr,B) ) ) ) )).

fof(range_axiom_20,axiom,(
    ! [B] :
      ( range_27_0(B)
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
        | bitIndex27 = B ) ) )).

fof(addAssignment_1377,axiom,(
    ! [VarCurr] :
      ( v2541(VarCurr,bitIndex0)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_1376,axiom,(
    ! [VarCurr] :
      ( v2541(VarCurr,bitIndex1)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_1375,axiom,(
    ! [VarCurr] :
      ( v2541(VarCurr,bitIndex2)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_1374,axiom,(
    ! [VarCurr] :
      ( v2541(VarCurr,bitIndex3)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_1373,axiom,(
    ! [VarCurr] :
      ( v2541(VarCurr,bitIndex4)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_1372,axiom,(
    ! [VarCurr] :
      ( v2541(VarCurr,bitIndex5)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_1371,axiom,(
    ! [VarCurr] :
      ( v2541(VarCurr,bitIndex6)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_1370,axiom,(
    ! [VarCurr] :
      ( v2541(VarCurr,bitIndex7)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_1369,axiom,(
    ! [VarCurr] :
      ( v2541(VarCurr,bitIndex8)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_1368,axiom,(
    ! [VarCurr] :
      ( v2541(VarCurr,bitIndex9)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_1367,axiom,(
    ! [VarCurr] :
      ( v2541(VarCurr,bitIndex10)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_1366,axiom,(
    ! [VarCurr] :
      ( v2541(VarCurr,bitIndex11)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_1365,axiom,(
    ! [VarCurr] :
      ( v2541(VarCurr,bitIndex12)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_1364,axiom,(
    ! [VarCurr] :
      ( v2541(VarCurr,bitIndex13)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_1363,axiom,(
    ! [VarCurr] :
      ( v2541(VarCurr,bitIndex14)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_1362,axiom,(
    ! [VarCurr] :
      ( v2541(VarCurr,bitIndex15)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_1361,axiom,(
    ! [VarCurr] :
      ( v2541(VarCurr,bitIndex16)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_1360,axiom,(
    ! [VarCurr] :
      ( v2541(VarCurr,bitIndex17)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_1359,axiom,(
    ! [VarCurr] :
      ( v2541(VarCurr,bitIndex18)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_1358,axiom,(
    ! [VarCurr] :
      ( v2541(VarCurr,bitIndex19)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_1357,axiom,(
    ! [VarCurr] :
      ( v2541(VarCurr,bitIndex20)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_1356,axiom,(
    ! [VarCurr] :
      ( v2541(VarCurr,bitIndex21)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_1355,axiom,(
    ! [VarCurr] :
      ( v2541(VarCurr,bitIndex22)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_1354,axiom,(
    ! [VarCurr] :
      ( v2541(VarCurr,bitIndex23)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_1353,axiom,(
    ! [VarCurr] :
      ( v2541(VarCurr,bitIndex24)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_1352,axiom,(
    ! [VarCurr] :
      ( v2541(VarCurr,bitIndex25)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_1351,axiom,(
    ! [VarCurr] :
      ( v2541(VarCurr,bitIndex26)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_1350,axiom,(
    ! [VarCurr] :
      ( v2541(VarCurr,bitIndex27)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_1349,axiom,(
    ! [VarCurr] :
      ( ( v2540(VarCurr,bitIndex26)
      <=> v2465(VarCurr,bitIndex39) )
      & ( v2540(VarCurr,bitIndex25)
      <=> v2465(VarCurr,bitIndex38) )
      & ( v2540(VarCurr,bitIndex24)
      <=> v2465(VarCurr,bitIndex37) )
      & ( v2540(VarCurr,bitIndex23)
      <=> v2465(VarCurr,bitIndex36) )
      & ( v2540(VarCurr,bitIndex22)
      <=> v2465(VarCurr,bitIndex35) )
      & ( v2540(VarCurr,bitIndex21)
      <=> v2465(VarCurr,bitIndex34) )
      & ( v2540(VarCurr,bitIndex20)
      <=> v2465(VarCurr,bitIndex33) )
      & ( v2540(VarCurr,bitIndex19)
      <=> v2465(VarCurr,bitIndex32) )
      & ( v2540(VarCurr,bitIndex18)
      <=> v2465(VarCurr,bitIndex31) )
      & ( v2540(VarCurr,bitIndex17)
      <=> v2465(VarCurr,bitIndex30) )
      & ( v2540(VarCurr,bitIndex16)
      <=> v2465(VarCurr,bitIndex29) )
      & ( v2540(VarCurr,bitIndex15)
      <=> v2465(VarCurr,bitIndex28) )
      & ( v2540(VarCurr,bitIndex14)
      <=> v2465(VarCurr,bitIndex27) )
      & ( v2540(VarCurr,bitIndex13)
      <=> v2465(VarCurr,bitIndex26) )
      & ( v2540(VarCurr,bitIndex12)
      <=> v2465(VarCurr,bitIndex25) )
      & ( v2540(VarCurr,bitIndex11)
      <=> v2465(VarCurr,bitIndex24) )
      & ( v2540(VarCurr,bitIndex10)
      <=> v2465(VarCurr,bitIndex23) )
      & ( v2540(VarCurr,bitIndex9)
      <=> v2465(VarCurr,bitIndex22) )
      & ( v2540(VarCurr,bitIndex8)
      <=> v2465(VarCurr,bitIndex21) )
      & ( v2540(VarCurr,bitIndex7)
      <=> v2465(VarCurr,bitIndex20) )
      & ( v2540(VarCurr,bitIndex6)
      <=> v2465(VarCurr,bitIndex19) )
      & ( v2540(VarCurr,bitIndex5)
      <=> v2465(VarCurr,bitIndex18) )
      & ( v2540(VarCurr,bitIndex4)
      <=> v2465(VarCurr,bitIndex17) )
      & ( v2540(VarCurr,bitIndex3)
      <=> v2465(VarCurr,bitIndex16) )
      & ( v2540(VarCurr,bitIndex2)
      <=> v2465(VarCurr,bitIndex15) )
      & ( v2540(VarCurr,bitIndex1)
      <=> v2465(VarCurr,bitIndex14) )
      & ( v2540(VarCurr,bitIndex0)
      <=> v2465(VarCurr,bitIndex13) ) ) )).

fof(addAssignment_1348,axiom,(
    ! [VarCurr] :
      ( v2540(VarCurr,bitIndex27)
    <=> $false ) )).

fof(writeBinaryOperatorShiftedRanges_304,axiom,(
    ! [VarCurr] :
      ( v2537(VarCurr,bitIndex0)
    <=> ( v2465(VarCurr,bitIndex12)
        & v2538(VarCurr,bitIndex0) ) ) )).

fof(writeBinaryOperatorShiftedRanges_303,axiom,(
    ! [VarCurr] :
      ( v2537(VarCurr,bitIndex1)
    <=> ( v2465(VarCurr,bitIndex13)
        & v2538(VarCurr,bitIndex1) ) ) )).

fof(writeBinaryOperatorShiftedRanges_302,axiom,(
    ! [VarCurr] :
      ( v2537(VarCurr,bitIndex2)
    <=> ( v2465(VarCurr,bitIndex14)
        & v2538(VarCurr,bitIndex2) ) ) )).

fof(writeBinaryOperatorShiftedRanges_301,axiom,(
    ! [VarCurr] :
      ( v2537(VarCurr,bitIndex3)
    <=> ( v2465(VarCurr,bitIndex15)
        & v2538(VarCurr,bitIndex3) ) ) )).

fof(writeBinaryOperatorShiftedRanges_300,axiom,(
    ! [VarCurr] :
      ( v2537(VarCurr,bitIndex4)
    <=> ( v2465(VarCurr,bitIndex16)
        & v2538(VarCurr,bitIndex4) ) ) )).

fof(writeBinaryOperatorShiftedRanges_299,axiom,(
    ! [VarCurr] :
      ( v2537(VarCurr,bitIndex5)
    <=> ( v2465(VarCurr,bitIndex17)
        & v2538(VarCurr,bitIndex5) ) ) )).

fof(writeBinaryOperatorShiftedRanges_298,axiom,(
    ! [VarCurr] :
      ( v2537(VarCurr,bitIndex6)
    <=> ( v2465(VarCurr,bitIndex18)
        & v2538(VarCurr,bitIndex6) ) ) )).

fof(writeBinaryOperatorShiftedRanges_297,axiom,(
    ! [VarCurr] :
      ( v2537(VarCurr,bitIndex7)
    <=> ( v2465(VarCurr,bitIndex19)
        & v2538(VarCurr,bitIndex7) ) ) )).

fof(writeBinaryOperatorShiftedRanges_296,axiom,(
    ! [VarCurr] :
      ( v2537(VarCurr,bitIndex8)
    <=> ( v2465(VarCurr,bitIndex20)
        & v2538(VarCurr,bitIndex8) ) ) )).

fof(writeBinaryOperatorShiftedRanges_295,axiom,(
    ! [VarCurr] :
      ( v2537(VarCurr,bitIndex9)
    <=> ( v2465(VarCurr,bitIndex21)
        & v2538(VarCurr,bitIndex9) ) ) )).

fof(writeBinaryOperatorShiftedRanges_294,axiom,(
    ! [VarCurr] :
      ( v2537(VarCurr,bitIndex10)
    <=> ( v2465(VarCurr,bitIndex22)
        & v2538(VarCurr,bitIndex10) ) ) )).

fof(writeBinaryOperatorShiftedRanges_293,axiom,(
    ! [VarCurr] :
      ( v2537(VarCurr,bitIndex11)
    <=> ( v2465(VarCurr,bitIndex23)
        & v2538(VarCurr,bitIndex11) ) ) )).

fof(writeBinaryOperatorShiftedRanges_292,axiom,(
    ! [VarCurr] :
      ( v2537(VarCurr,bitIndex12)
    <=> ( v2465(VarCurr,bitIndex24)
        & v2538(VarCurr,bitIndex12) ) ) )).

fof(writeBinaryOperatorShiftedRanges_291,axiom,(
    ! [VarCurr] :
      ( v2537(VarCurr,bitIndex13)
    <=> ( v2465(VarCurr,bitIndex25)
        & v2538(VarCurr,bitIndex13) ) ) )).

fof(writeBinaryOperatorShiftedRanges_290,axiom,(
    ! [VarCurr] :
      ( v2537(VarCurr,bitIndex14)
    <=> ( v2465(VarCurr,bitIndex26)
        & v2538(VarCurr,bitIndex14) ) ) )).

fof(writeBinaryOperatorShiftedRanges_289,axiom,(
    ! [VarCurr] :
      ( v2537(VarCurr,bitIndex15)
    <=> ( v2465(VarCurr,bitIndex27)
        & v2538(VarCurr,bitIndex15) ) ) )).

fof(writeBinaryOperatorShiftedRanges_288,axiom,(
    ! [VarCurr] :
      ( v2537(VarCurr,bitIndex16)
    <=> ( v2465(VarCurr,bitIndex28)
        & v2538(VarCurr,bitIndex16) ) ) )).

fof(writeBinaryOperatorShiftedRanges_287,axiom,(
    ! [VarCurr] :
      ( v2537(VarCurr,bitIndex17)
    <=> ( v2465(VarCurr,bitIndex29)
        & v2538(VarCurr,bitIndex17) ) ) )).

fof(writeBinaryOperatorShiftedRanges_286,axiom,(
    ! [VarCurr] :
      ( v2537(VarCurr,bitIndex18)
    <=> ( v2465(VarCurr,bitIndex30)
        & v2538(VarCurr,bitIndex18) ) ) )).

fof(writeBinaryOperatorShiftedRanges_285,axiom,(
    ! [VarCurr] :
      ( v2537(VarCurr,bitIndex19)
    <=> ( v2465(VarCurr,bitIndex31)
        & v2538(VarCurr,bitIndex19) ) ) )).

fof(writeBinaryOperatorShiftedRanges_284,axiom,(
    ! [VarCurr] :
      ( v2537(VarCurr,bitIndex20)
    <=> ( v2465(VarCurr,bitIndex32)
        & v2538(VarCurr,bitIndex20) ) ) )).

fof(writeBinaryOperatorShiftedRanges_283,axiom,(
    ! [VarCurr] :
      ( v2537(VarCurr,bitIndex21)
    <=> ( v2465(VarCurr,bitIndex33)
        & v2538(VarCurr,bitIndex21) ) ) )).

fof(writeBinaryOperatorShiftedRanges_282,axiom,(
    ! [VarCurr] :
      ( v2537(VarCurr,bitIndex22)
    <=> ( v2465(VarCurr,bitIndex34)
        & v2538(VarCurr,bitIndex22) ) ) )).

fof(writeBinaryOperatorShiftedRanges_281,axiom,(
    ! [VarCurr] :
      ( v2537(VarCurr,bitIndex23)
    <=> ( v2465(VarCurr,bitIndex35)
        & v2538(VarCurr,bitIndex23) ) ) )).

fof(writeBinaryOperatorShiftedRanges_280,axiom,(
    ! [VarCurr] :
      ( v2537(VarCurr,bitIndex24)
    <=> ( v2465(VarCurr,bitIndex36)
        & v2538(VarCurr,bitIndex24) ) ) )).

fof(writeBinaryOperatorShiftedRanges_279,axiom,(
    ! [VarCurr] :
      ( v2537(VarCurr,bitIndex25)
    <=> ( v2465(VarCurr,bitIndex37)
        & v2538(VarCurr,bitIndex25) ) ) )).

fof(writeBinaryOperatorShiftedRanges_278,axiom,(
    ! [VarCurr] :
      ( v2537(VarCurr,bitIndex26)
    <=> ( v2465(VarCurr,bitIndex38)
        & v2538(VarCurr,bitIndex26) ) ) )).

fof(writeBinaryOperatorShiftedRanges_277,axiom,(
    ! [VarCurr] :
      ( v2537(VarCurr,bitIndex27)
    <=> ( v2465(VarCurr,bitIndex39)
        & v2538(VarCurr,bitIndex27) ) ) )).

fof(addAssignment_1347,axiom,(
    ! [VarCurr] :
      ( v2538(VarCurr,bitIndex0)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_1346,axiom,(
    ! [VarCurr] :
      ( v2538(VarCurr,bitIndex1)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_1345,axiom,(
    ! [VarCurr] :
      ( v2538(VarCurr,bitIndex2)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_1344,axiom,(
    ! [VarCurr] :
      ( v2538(VarCurr,bitIndex3)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_1343,axiom,(
    ! [VarCurr] :
      ( v2538(VarCurr,bitIndex4)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_1342,axiom,(
    ! [VarCurr] :
      ( v2538(VarCurr,bitIndex5)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_1341,axiom,(
    ! [VarCurr] :
      ( v2538(VarCurr,bitIndex6)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_1340,axiom,(
    ! [VarCurr] :
      ( v2538(VarCurr,bitIndex7)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_1339,axiom,(
    ! [VarCurr] :
      ( v2538(VarCurr,bitIndex8)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_1338,axiom,(
    ! [VarCurr] :
      ( v2538(VarCurr,bitIndex9)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_1337,axiom,(
    ! [VarCurr] :
      ( v2538(VarCurr,bitIndex10)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_1336,axiom,(
    ! [VarCurr] :
      ( v2538(VarCurr,bitIndex11)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_1335,axiom,(
    ! [VarCurr] :
      ( v2538(VarCurr,bitIndex12)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_1334,axiom,(
    ! [VarCurr] :
      ( v2538(VarCurr,bitIndex13)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_1333,axiom,(
    ! [VarCurr] :
      ( v2538(VarCurr,bitIndex14)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_1332,axiom,(
    ! [VarCurr] :
      ( v2538(VarCurr,bitIndex15)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_1331,axiom,(
    ! [VarCurr] :
      ( v2538(VarCurr,bitIndex16)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_1330,axiom,(
    ! [VarCurr] :
      ( v2538(VarCurr,bitIndex17)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_1329,axiom,(
    ! [VarCurr] :
      ( v2538(VarCurr,bitIndex18)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_1328,axiom,(
    ! [VarCurr] :
      ( v2538(VarCurr,bitIndex19)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_1327,axiom,(
    ! [VarCurr] :
      ( v2538(VarCurr,bitIndex20)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_1326,axiom,(
    ! [VarCurr] :
      ( v2538(VarCurr,bitIndex21)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_1325,axiom,(
    ! [VarCurr] :
      ( v2538(VarCurr,bitIndex22)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_1324,axiom,(
    ! [VarCurr] :
      ( v2538(VarCurr,bitIndex23)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_1323,axiom,(
    ! [VarCurr] :
      ( v2538(VarCurr,bitIndex24)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_1322,axiom,(
    ! [VarCurr] :
      ( v2538(VarCurr,bitIndex25)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_1321,axiom,(
    ! [VarCurr] :
      ( v2538(VarCurr,bitIndex26)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_1320,axiom,(
    ! [VarCurr] :
      ( v2538(VarCurr,bitIndex27)
    <=> v2468(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesMultipleBits_33,axiom,(
    ! [VarCurr,B] :
      ( range_31_0(B)
     => ( v2512(VarCurr,B)
      <=> ( v2513(VarCurr,B)
          & v2531(VarCurr,B) ) ) ) )).

fof(addAssignment_1319,axiom,(
    ! [VarCurr] :
      ( v2531(VarCurr,bitIndex0)
    <=> v2484(VarCurr) ) )).

fof(addAssignment_1318,axiom,(
    ! [VarCurr] :
      ( v2531(VarCurr,bitIndex1)
    <=> v2484(VarCurr) ) )).

fof(addAssignment_1317,axiom,(
    ! [VarCurr] :
      ( v2531(VarCurr,bitIndex2)
    <=> v2484(VarCurr) ) )).

fof(addAssignment_1316,axiom,(
    ! [VarCurr] :
      ( v2531(VarCurr,bitIndex3)
    <=> v2484(VarCurr) ) )).

fof(addAssignment_1315,axiom,(
    ! [VarCurr] :
      ( v2531(VarCurr,bitIndex4)
    <=> v2484(VarCurr) ) )).

fof(addAssignment_1314,axiom,(
    ! [VarCurr] :
      ( v2531(VarCurr,bitIndex5)
    <=> v2484(VarCurr) ) )).

fof(addAssignment_1313,axiom,(
    ! [VarCurr] :
      ( v2531(VarCurr,bitIndex6)
    <=> v2484(VarCurr) ) )).

fof(addAssignment_1312,axiom,(
    ! [VarCurr] :
      ( v2531(VarCurr,bitIndex7)
    <=> v2484(VarCurr) ) )).

fof(addAssignment_1311,axiom,(
    ! [VarCurr] :
      ( v2531(VarCurr,bitIndex8)
    <=> v2484(VarCurr) ) )).

fof(addAssignment_1310,axiom,(
    ! [VarCurr] :
      ( v2531(VarCurr,bitIndex9)
    <=> v2484(VarCurr) ) )).

fof(addAssignment_1309,axiom,(
    ! [VarCurr] :
      ( v2531(VarCurr,bitIndex10)
    <=> v2484(VarCurr) ) )).

fof(addAssignment_1308,axiom,(
    ! [VarCurr] :
      ( v2531(VarCurr,bitIndex11)
    <=> v2484(VarCurr) ) )).

fof(addAssignment_1307,axiom,(
    ! [VarCurr] :
      ( v2531(VarCurr,bitIndex12)
    <=> v2484(VarCurr) ) )).

fof(addAssignment_1306,axiom,(
    ! [VarCurr] :
      ( v2531(VarCurr,bitIndex13)
    <=> v2484(VarCurr) ) )).

fof(addAssignment_1305,axiom,(
    ! [VarCurr] :
      ( v2531(VarCurr,bitIndex14)
    <=> v2484(VarCurr) ) )).

fof(addAssignment_1304,axiom,(
    ! [VarCurr] :
      ( v2531(VarCurr,bitIndex15)
    <=> v2484(VarCurr) ) )).

fof(addAssignment_1303,axiom,(
    ! [VarCurr] :
      ( v2531(VarCurr,bitIndex16)
    <=> v2484(VarCurr) ) )).

fof(addAssignment_1302,axiom,(
    ! [VarCurr] :
      ( v2531(VarCurr,bitIndex17)
    <=> v2484(VarCurr) ) )).

fof(addAssignment_1301,axiom,(
    ! [VarCurr] :
      ( v2531(VarCurr,bitIndex18)
    <=> v2484(VarCurr) ) )).

fof(addAssignment_1300,axiom,(
    ! [VarCurr] :
      ( v2531(VarCurr,bitIndex19)
    <=> v2484(VarCurr) ) )).

fof(addAssignment_1299,axiom,(
    ! [VarCurr] :
      ( v2531(VarCurr,bitIndex20)
    <=> v2484(VarCurr) ) )).

fof(addAssignment_1298,axiom,(
    ! [VarCurr] :
      ( v2531(VarCurr,bitIndex21)
    <=> v2484(VarCurr) ) )).

fof(addAssignment_1297,axiom,(
    ! [VarCurr] :
      ( v2531(VarCurr,bitIndex22)
    <=> v2484(VarCurr) ) )).

fof(addAssignment_1296,axiom,(
    ! [VarCurr] :
      ( v2531(VarCurr,bitIndex23)
    <=> v2484(VarCurr) ) )).

fof(addAssignment_1295,axiom,(
    ! [VarCurr] :
      ( v2531(VarCurr,bitIndex24)
    <=> v2484(VarCurr) ) )).

fof(addAssignment_1294,axiom,(
    ! [VarCurr] :
      ( v2531(VarCurr,bitIndex25)
    <=> v2484(VarCurr) ) )).

fof(addAssignment_1293,axiom,(
    ! [VarCurr] :
      ( v2531(VarCurr,bitIndex26)
    <=> v2484(VarCurr) ) )).

fof(addAssignment_1292,axiom,(
    ! [VarCurr] :
      ( v2531(VarCurr,bitIndex27)
    <=> v2484(VarCurr) ) )).

fof(addAssignment_1291,axiom,(
    ! [VarCurr] :
      ( v2531(VarCurr,bitIndex28)
    <=> v2484(VarCurr) ) )).

fof(addAssignment_1290,axiom,(
    ! [VarCurr] :
      ( v2531(VarCurr,bitIndex29)
    <=> v2484(VarCurr) ) )).

fof(addAssignment_1289,axiom,(
    ! [VarCurr] :
      ( v2531(VarCurr,bitIndex30)
    <=> v2484(VarCurr) ) )).

fof(addAssignment_1288,axiom,(
    ! [VarCurr] :
      ( v2531(VarCurr,bitIndex31)
    <=> v2484(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesMultipleBits_32,axiom,(
    ! [VarCurr,B] :
      ( range_31_0(B)
     => ( v2513(VarCurr,B)
      <=> ( v2514(VarCurr,B)
          | v2522(VarCurr,B) ) ) ) )).

fof(writeBinaryOperatorEqualRangesMultipleBits_31,axiom,(
    ! [VarCurr,B] :
      ( range_31_0(B)
     => ( v2522(VarCurr,B)
      <=> ( v2523(VarCurr,B)
          & v2530(VarCurr,B) ) ) ) )).

fof(addAssignment_1287,axiom,(
    ! [VarCurr] :
      ( v2530(VarCurr,bitIndex0)
    <=> v2453(VarCurr,bitIndex1) ) )).

fof(addAssignment_1286,axiom,(
    ! [VarCurr] :
      ( v2530(VarCurr,bitIndex1)
    <=> v2453(VarCurr,bitIndex1) ) )).

fof(addAssignment_1285,axiom,(
    ! [VarCurr] :
      ( v2530(VarCurr,bitIndex2)
    <=> v2453(VarCurr,bitIndex1) ) )).

fof(addAssignment_1284,axiom,(
    ! [VarCurr] :
      ( v2530(VarCurr,bitIndex3)
    <=> v2453(VarCurr,bitIndex1) ) )).

fof(addAssignment_1283,axiom,(
    ! [VarCurr] :
      ( v2530(VarCurr,bitIndex4)
    <=> v2453(VarCurr,bitIndex1) ) )).

fof(addAssignment_1282,axiom,(
    ! [VarCurr] :
      ( v2530(VarCurr,bitIndex5)
    <=> v2453(VarCurr,bitIndex1) ) )).

fof(addAssignment_1281,axiom,(
    ! [VarCurr] :
      ( v2530(VarCurr,bitIndex6)
    <=> v2453(VarCurr,bitIndex1) ) )).

fof(addAssignment_1280,axiom,(
    ! [VarCurr] :
      ( v2530(VarCurr,bitIndex7)
    <=> v2453(VarCurr,bitIndex1) ) )).

fof(addAssignment_1279,axiom,(
    ! [VarCurr] :
      ( v2530(VarCurr,bitIndex8)
    <=> v2453(VarCurr,bitIndex1) ) )).

fof(addAssignment_1278,axiom,(
    ! [VarCurr] :
      ( v2530(VarCurr,bitIndex9)
    <=> v2453(VarCurr,bitIndex1) ) )).

fof(addAssignment_1277,axiom,(
    ! [VarCurr] :
      ( v2530(VarCurr,bitIndex10)
    <=> v2453(VarCurr,bitIndex1) ) )).

fof(addAssignment_1276,axiom,(
    ! [VarCurr] :
      ( v2530(VarCurr,bitIndex11)
    <=> v2453(VarCurr,bitIndex1) ) )).

fof(addAssignment_1275,axiom,(
    ! [VarCurr] :
      ( v2530(VarCurr,bitIndex12)
    <=> v2453(VarCurr,bitIndex1) ) )).

fof(addAssignment_1274,axiom,(
    ! [VarCurr] :
      ( v2530(VarCurr,bitIndex13)
    <=> v2453(VarCurr,bitIndex1) ) )).

fof(addAssignment_1273,axiom,(
    ! [VarCurr] :
      ( v2530(VarCurr,bitIndex14)
    <=> v2453(VarCurr,bitIndex1) ) )).

fof(addAssignment_1272,axiom,(
    ! [VarCurr] :
      ( v2530(VarCurr,bitIndex15)
    <=> v2453(VarCurr,bitIndex1) ) )).

fof(addAssignment_1271,axiom,(
    ! [VarCurr] :
      ( v2530(VarCurr,bitIndex16)
    <=> v2453(VarCurr,bitIndex1) ) )).

fof(addAssignment_1270,axiom,(
    ! [VarCurr] :
      ( v2530(VarCurr,bitIndex17)
    <=> v2453(VarCurr,bitIndex1) ) )).

fof(addAssignment_1269,axiom,(
    ! [VarCurr] :
      ( v2530(VarCurr,bitIndex18)
    <=> v2453(VarCurr,bitIndex1) ) )).

fof(addAssignment_1268,axiom,(
    ! [VarCurr] :
      ( v2530(VarCurr,bitIndex19)
    <=> v2453(VarCurr,bitIndex1) ) )).

fof(addAssignment_1267,axiom,(
    ! [VarCurr] :
      ( v2530(VarCurr,bitIndex20)
    <=> v2453(VarCurr,bitIndex1) ) )).

fof(addAssignment_1266,axiom,(
    ! [VarCurr] :
      ( v2530(VarCurr,bitIndex21)
    <=> v2453(VarCurr,bitIndex1) ) )).

fof(addAssignment_1265,axiom,(
    ! [VarCurr] :
      ( v2530(VarCurr,bitIndex22)
    <=> v2453(VarCurr,bitIndex1) ) )).

fof(addAssignment_1264,axiom,(
    ! [VarCurr] :
      ( v2530(VarCurr,bitIndex23)
    <=> v2453(VarCurr,bitIndex1) ) )).

fof(addAssignment_1263,axiom,(
    ! [VarCurr] :
      ( v2530(VarCurr,bitIndex24)
    <=> v2453(VarCurr,bitIndex1) ) )).

fof(addAssignment_1262,axiom,(
    ! [VarCurr] :
      ( v2530(VarCurr,bitIndex25)
    <=> v2453(VarCurr,bitIndex1) ) )).

fof(addAssignment_1261,axiom,(
    ! [VarCurr] :
      ( v2530(VarCurr,bitIndex26)
    <=> v2453(VarCurr,bitIndex1) ) )).

fof(addAssignment_1260,axiom,(
    ! [VarCurr] :
      ( v2530(VarCurr,bitIndex27)
    <=> v2453(VarCurr,bitIndex1) ) )).

fof(addAssignment_1259,axiom,(
    ! [VarCurr] :
      ( v2530(VarCurr,bitIndex28)
    <=> v2453(VarCurr,bitIndex1) ) )).

fof(addAssignment_1258,axiom,(
    ! [VarCurr] :
      ( v2530(VarCurr,bitIndex29)
    <=> v2453(VarCurr,bitIndex1) ) )).

fof(addAssignment_1257,axiom,(
    ! [VarCurr] :
      ( v2530(VarCurr,bitIndex30)
    <=> v2453(VarCurr,bitIndex1) ) )).

fof(addAssignment_1256,axiom,(
    ! [VarCurr] :
      ( v2530(VarCurr,bitIndex31)
    <=> v2453(VarCurr,bitIndex1) ) )).

fof(addAssignment_1255,axiom,(
    ! [VarCurr,B] :
      ( range_29_0(B)
     => ( v2523(VarCurr,B)
      <=> v2524(VarCurr,B) ) ) )).

fof(addAssignment_1254,axiom,(
    ! [VarCurr] :
      ( ( v2523(VarCurr,bitIndex31)
      <=> $false )
      & ( v2523(VarCurr,bitIndex30)
      <=> $false ) ) )).

fof(writeBinaryOperatorEqualRangesMultipleBits_30,axiom,(
    ! [VarCurr,B] :
      ( range_29_0(B)
     => ( v2524(VarCurr,B)
      <=> ( v2525(VarCurr,B)
          | v2527(VarCurr,B) ) ) ) )).

fof(writeBinaryOperatorEqualRangesMultipleBits_29,axiom,(
    ! [VarCurr,B] :
      ( range_29_0(B)
     => ( v2527(VarCurr,B)
      <=> ( v2528(VarCurr,B)
          & v2529(VarCurr,B) ) ) ) )).

fof(range_axiom_19,axiom,(
    ! [B] :
      ( range_29_0(B)
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
        | bitIndex29 = B ) ) )).

fof(addAssignment_1253,axiom,(
    ! [VarCurr] :
      ( v2529(VarCurr,bitIndex0)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_1252,axiom,(
    ! [VarCurr] :
      ( v2529(VarCurr,bitIndex1)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_1251,axiom,(
    ! [VarCurr] :
      ( v2529(VarCurr,bitIndex2)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_1250,axiom,(
    ! [VarCurr] :
      ( v2529(VarCurr,bitIndex3)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_1249,axiom,(
    ! [VarCurr] :
      ( v2529(VarCurr,bitIndex4)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_1248,axiom,(
    ! [VarCurr] :
      ( v2529(VarCurr,bitIndex5)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_1247,axiom,(
    ! [VarCurr] :
      ( v2529(VarCurr,bitIndex6)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_1246,axiom,(
    ! [VarCurr] :
      ( v2529(VarCurr,bitIndex7)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_1245,axiom,(
    ! [VarCurr] :
      ( v2529(VarCurr,bitIndex8)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_1244,axiom,(
    ! [VarCurr] :
      ( v2529(VarCurr,bitIndex9)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_1243,axiom,(
    ! [VarCurr] :
      ( v2529(VarCurr,bitIndex10)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_1242,axiom,(
    ! [VarCurr] :
      ( v2529(VarCurr,bitIndex11)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_1241,axiom,(
    ! [VarCurr] :
      ( v2529(VarCurr,bitIndex12)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_1240,axiom,(
    ! [VarCurr] :
      ( v2529(VarCurr,bitIndex13)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_1239,axiom,(
    ! [VarCurr] :
      ( v2529(VarCurr,bitIndex14)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_1238,axiom,(
    ! [VarCurr] :
      ( v2529(VarCurr,bitIndex15)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_1237,axiom,(
    ! [VarCurr] :
      ( v2529(VarCurr,bitIndex16)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_1236,axiom,(
    ! [VarCurr] :
      ( v2529(VarCurr,bitIndex17)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_1235,axiom,(
    ! [VarCurr] :
      ( v2529(VarCurr,bitIndex18)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_1234,axiom,(
    ! [VarCurr] :
      ( v2529(VarCurr,bitIndex19)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_1233,axiom,(
    ! [VarCurr] :
      ( v2529(VarCurr,bitIndex20)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_1232,axiom,(
    ! [VarCurr] :
      ( v2529(VarCurr,bitIndex21)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_1231,axiom,(
    ! [VarCurr] :
      ( v2529(VarCurr,bitIndex22)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_1230,axiom,(
    ! [VarCurr] :
      ( v2529(VarCurr,bitIndex23)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_1229,axiom,(
    ! [VarCurr] :
      ( v2529(VarCurr,bitIndex24)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_1228,axiom,(
    ! [VarCurr] :
      ( v2529(VarCurr,bitIndex25)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_1227,axiom,(
    ! [VarCurr] :
      ( v2529(VarCurr,bitIndex26)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_1226,axiom,(
    ! [VarCurr] :
      ( v2529(VarCurr,bitIndex27)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_1225,axiom,(
    ! [VarCurr] :
      ( v2529(VarCurr,bitIndex28)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_1224,axiom,(
    ! [VarCurr] :
      ( v2529(VarCurr,bitIndex29)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_1223,axiom,(
    ! [VarCurr] :
      ( ( v2528(VarCurr,bitIndex28)
      <=> v2465(VarCurr,bitIndex39) )
      & ( v2528(VarCurr,bitIndex27)
      <=> v2465(VarCurr,bitIndex38) )
      & ( v2528(VarCurr,bitIndex26)
      <=> v2465(VarCurr,bitIndex37) )
      & ( v2528(VarCurr,bitIndex25)
      <=> v2465(VarCurr,bitIndex36) )
      & ( v2528(VarCurr,bitIndex24)
      <=> v2465(VarCurr,bitIndex35) )
      & ( v2528(VarCurr,bitIndex23)
      <=> v2465(VarCurr,bitIndex34) )
      & ( v2528(VarCurr,bitIndex22)
      <=> v2465(VarCurr,bitIndex33) )
      & ( v2528(VarCurr,bitIndex21)
      <=> v2465(VarCurr,bitIndex32) )
      & ( v2528(VarCurr,bitIndex20)
      <=> v2465(VarCurr,bitIndex31) )
      & ( v2528(VarCurr,bitIndex19)
      <=> v2465(VarCurr,bitIndex30) )
      & ( v2528(VarCurr,bitIndex18)
      <=> v2465(VarCurr,bitIndex29) )
      & ( v2528(VarCurr,bitIndex17)
      <=> v2465(VarCurr,bitIndex28) )
      & ( v2528(VarCurr,bitIndex16)
      <=> v2465(VarCurr,bitIndex27) )
      & ( v2528(VarCurr,bitIndex15)
      <=> v2465(VarCurr,bitIndex26) )
      & ( v2528(VarCurr,bitIndex14)
      <=> v2465(VarCurr,bitIndex25) )
      & ( v2528(VarCurr,bitIndex13)
      <=> v2465(VarCurr,bitIndex24) )
      & ( v2528(VarCurr,bitIndex12)
      <=> v2465(VarCurr,bitIndex23) )
      & ( v2528(VarCurr,bitIndex11)
      <=> v2465(VarCurr,bitIndex22) )
      & ( v2528(VarCurr,bitIndex10)
      <=> v2465(VarCurr,bitIndex21) )
      & ( v2528(VarCurr,bitIndex9)
      <=> v2465(VarCurr,bitIndex20) )
      & ( v2528(VarCurr,bitIndex8)
      <=> v2465(VarCurr,bitIndex19) )
      & ( v2528(VarCurr,bitIndex7)
      <=> v2465(VarCurr,bitIndex18) )
      & ( v2528(VarCurr,bitIndex6)
      <=> v2465(VarCurr,bitIndex17) )
      & ( v2528(VarCurr,bitIndex5)
      <=> v2465(VarCurr,bitIndex16) )
      & ( v2528(VarCurr,bitIndex4)
      <=> v2465(VarCurr,bitIndex15) )
      & ( v2528(VarCurr,bitIndex3)
      <=> v2465(VarCurr,bitIndex14) )
      & ( v2528(VarCurr,bitIndex2)
      <=> v2465(VarCurr,bitIndex13) )
      & ( v2528(VarCurr,bitIndex1)
      <=> v2465(VarCurr,bitIndex12) )
      & ( v2528(VarCurr,bitIndex0)
      <=> v2465(VarCurr,bitIndex11) ) ) )).

fof(addAssignment_1222,axiom,(
    ! [VarCurr] :
      ( v2528(VarCurr,bitIndex29)
    <=> $false ) )).

fof(writeBinaryOperatorShiftedRanges_276,axiom,(
    ! [VarCurr] :
      ( v2525(VarCurr,bitIndex0)
    <=> ( v2465(VarCurr,bitIndex10)
        & v2526(VarCurr,bitIndex0) ) ) )).

fof(writeBinaryOperatorShiftedRanges_275,axiom,(
    ! [VarCurr] :
      ( v2525(VarCurr,bitIndex1)
    <=> ( v2465(VarCurr,bitIndex11)
        & v2526(VarCurr,bitIndex1) ) ) )).

fof(writeBinaryOperatorShiftedRanges_274,axiom,(
    ! [VarCurr] :
      ( v2525(VarCurr,bitIndex2)
    <=> ( v2465(VarCurr,bitIndex12)
        & v2526(VarCurr,bitIndex2) ) ) )).

fof(writeBinaryOperatorShiftedRanges_273,axiom,(
    ! [VarCurr] :
      ( v2525(VarCurr,bitIndex3)
    <=> ( v2465(VarCurr,bitIndex13)
        & v2526(VarCurr,bitIndex3) ) ) )).

fof(writeBinaryOperatorShiftedRanges_272,axiom,(
    ! [VarCurr] :
      ( v2525(VarCurr,bitIndex4)
    <=> ( v2465(VarCurr,bitIndex14)
        & v2526(VarCurr,bitIndex4) ) ) )).

fof(writeBinaryOperatorShiftedRanges_271,axiom,(
    ! [VarCurr] :
      ( v2525(VarCurr,bitIndex5)
    <=> ( v2465(VarCurr,bitIndex15)
        & v2526(VarCurr,bitIndex5) ) ) )).

fof(writeBinaryOperatorShiftedRanges_270,axiom,(
    ! [VarCurr] :
      ( v2525(VarCurr,bitIndex6)
    <=> ( v2465(VarCurr,bitIndex16)
        & v2526(VarCurr,bitIndex6) ) ) )).

fof(writeBinaryOperatorShiftedRanges_269,axiom,(
    ! [VarCurr] :
      ( v2525(VarCurr,bitIndex7)
    <=> ( v2465(VarCurr,bitIndex17)
        & v2526(VarCurr,bitIndex7) ) ) )).

fof(writeBinaryOperatorShiftedRanges_268,axiom,(
    ! [VarCurr] :
      ( v2525(VarCurr,bitIndex8)
    <=> ( v2465(VarCurr,bitIndex18)
        & v2526(VarCurr,bitIndex8) ) ) )).

fof(writeBinaryOperatorShiftedRanges_267,axiom,(
    ! [VarCurr] :
      ( v2525(VarCurr,bitIndex9)
    <=> ( v2465(VarCurr,bitIndex19)
        & v2526(VarCurr,bitIndex9) ) ) )).

fof(writeBinaryOperatorShiftedRanges_266,axiom,(
    ! [VarCurr] :
      ( v2525(VarCurr,bitIndex10)
    <=> ( v2465(VarCurr,bitIndex20)
        & v2526(VarCurr,bitIndex10) ) ) )).

fof(writeBinaryOperatorShiftedRanges_265,axiom,(
    ! [VarCurr] :
      ( v2525(VarCurr,bitIndex11)
    <=> ( v2465(VarCurr,bitIndex21)
        & v2526(VarCurr,bitIndex11) ) ) )).

fof(writeBinaryOperatorShiftedRanges_264,axiom,(
    ! [VarCurr] :
      ( v2525(VarCurr,bitIndex12)
    <=> ( v2465(VarCurr,bitIndex22)
        & v2526(VarCurr,bitIndex12) ) ) )).

fof(writeBinaryOperatorShiftedRanges_263,axiom,(
    ! [VarCurr] :
      ( v2525(VarCurr,bitIndex13)
    <=> ( v2465(VarCurr,bitIndex23)
        & v2526(VarCurr,bitIndex13) ) ) )).

fof(writeBinaryOperatorShiftedRanges_262,axiom,(
    ! [VarCurr] :
      ( v2525(VarCurr,bitIndex14)
    <=> ( v2465(VarCurr,bitIndex24)
        & v2526(VarCurr,bitIndex14) ) ) )).

fof(writeBinaryOperatorShiftedRanges_261,axiom,(
    ! [VarCurr] :
      ( v2525(VarCurr,bitIndex15)
    <=> ( v2465(VarCurr,bitIndex25)
        & v2526(VarCurr,bitIndex15) ) ) )).

fof(writeBinaryOperatorShiftedRanges_260,axiom,(
    ! [VarCurr] :
      ( v2525(VarCurr,bitIndex16)
    <=> ( v2465(VarCurr,bitIndex26)
        & v2526(VarCurr,bitIndex16) ) ) )).

fof(writeBinaryOperatorShiftedRanges_259,axiom,(
    ! [VarCurr] :
      ( v2525(VarCurr,bitIndex17)
    <=> ( v2465(VarCurr,bitIndex27)
        & v2526(VarCurr,bitIndex17) ) ) )).

fof(writeBinaryOperatorShiftedRanges_258,axiom,(
    ! [VarCurr] :
      ( v2525(VarCurr,bitIndex18)
    <=> ( v2465(VarCurr,bitIndex28)
        & v2526(VarCurr,bitIndex18) ) ) )).

fof(writeBinaryOperatorShiftedRanges_257,axiom,(
    ! [VarCurr] :
      ( v2525(VarCurr,bitIndex19)
    <=> ( v2465(VarCurr,bitIndex29)
        & v2526(VarCurr,bitIndex19) ) ) )).

fof(writeBinaryOperatorShiftedRanges_256,axiom,(
    ! [VarCurr] :
      ( v2525(VarCurr,bitIndex20)
    <=> ( v2465(VarCurr,bitIndex30)
        & v2526(VarCurr,bitIndex20) ) ) )).

fof(writeBinaryOperatorShiftedRanges_255,axiom,(
    ! [VarCurr] :
      ( v2525(VarCurr,bitIndex21)
    <=> ( v2465(VarCurr,bitIndex31)
        & v2526(VarCurr,bitIndex21) ) ) )).

fof(writeBinaryOperatorShiftedRanges_254,axiom,(
    ! [VarCurr] :
      ( v2525(VarCurr,bitIndex22)
    <=> ( v2465(VarCurr,bitIndex32)
        & v2526(VarCurr,bitIndex22) ) ) )).

fof(writeBinaryOperatorShiftedRanges_253,axiom,(
    ! [VarCurr] :
      ( v2525(VarCurr,bitIndex23)
    <=> ( v2465(VarCurr,bitIndex33)
        & v2526(VarCurr,bitIndex23) ) ) )).

fof(writeBinaryOperatorShiftedRanges_252,axiom,(
    ! [VarCurr] :
      ( v2525(VarCurr,bitIndex24)
    <=> ( v2465(VarCurr,bitIndex34)
        & v2526(VarCurr,bitIndex24) ) ) )).

fof(writeBinaryOperatorShiftedRanges_251,axiom,(
    ! [VarCurr] :
      ( v2525(VarCurr,bitIndex25)
    <=> ( v2465(VarCurr,bitIndex35)
        & v2526(VarCurr,bitIndex25) ) ) )).

fof(writeBinaryOperatorShiftedRanges_250,axiom,(
    ! [VarCurr] :
      ( v2525(VarCurr,bitIndex26)
    <=> ( v2465(VarCurr,bitIndex36)
        & v2526(VarCurr,bitIndex26) ) ) )).

fof(writeBinaryOperatorShiftedRanges_249,axiom,(
    ! [VarCurr] :
      ( v2525(VarCurr,bitIndex27)
    <=> ( v2465(VarCurr,bitIndex37)
        & v2526(VarCurr,bitIndex27) ) ) )).

fof(writeBinaryOperatorShiftedRanges_248,axiom,(
    ! [VarCurr] :
      ( v2525(VarCurr,bitIndex28)
    <=> ( v2465(VarCurr,bitIndex38)
        & v2526(VarCurr,bitIndex28) ) ) )).

fof(writeBinaryOperatorShiftedRanges_247,axiom,(
    ! [VarCurr] :
      ( v2525(VarCurr,bitIndex29)
    <=> ( v2465(VarCurr,bitIndex39)
        & v2526(VarCurr,bitIndex29) ) ) )).

fof(addAssignment_1221,axiom,(
    ! [VarCurr] :
      ( v2526(VarCurr,bitIndex0)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_1220,axiom,(
    ! [VarCurr] :
      ( v2526(VarCurr,bitIndex1)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_1219,axiom,(
    ! [VarCurr] :
      ( v2526(VarCurr,bitIndex2)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_1218,axiom,(
    ! [VarCurr] :
      ( v2526(VarCurr,bitIndex3)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_1217,axiom,(
    ! [VarCurr] :
      ( v2526(VarCurr,bitIndex4)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_1216,axiom,(
    ! [VarCurr] :
      ( v2526(VarCurr,bitIndex5)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_1215,axiom,(
    ! [VarCurr] :
      ( v2526(VarCurr,bitIndex6)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_1214,axiom,(
    ! [VarCurr] :
      ( v2526(VarCurr,bitIndex7)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_1213,axiom,(
    ! [VarCurr] :
      ( v2526(VarCurr,bitIndex8)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_1212,axiom,(
    ! [VarCurr] :
      ( v2526(VarCurr,bitIndex9)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_1211,axiom,(
    ! [VarCurr] :
      ( v2526(VarCurr,bitIndex10)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_1210,axiom,(
    ! [VarCurr] :
      ( v2526(VarCurr,bitIndex11)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_1209,axiom,(
    ! [VarCurr] :
      ( v2526(VarCurr,bitIndex12)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_1208,axiom,(
    ! [VarCurr] :
      ( v2526(VarCurr,bitIndex13)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_1207,axiom,(
    ! [VarCurr] :
      ( v2526(VarCurr,bitIndex14)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_1206,axiom,(
    ! [VarCurr] :
      ( v2526(VarCurr,bitIndex15)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_1205,axiom,(
    ! [VarCurr] :
      ( v2526(VarCurr,bitIndex16)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_1204,axiom,(
    ! [VarCurr] :
      ( v2526(VarCurr,bitIndex17)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_1203,axiom,(
    ! [VarCurr] :
      ( v2526(VarCurr,bitIndex18)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_1202,axiom,(
    ! [VarCurr] :
      ( v2526(VarCurr,bitIndex19)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_1201,axiom,(
    ! [VarCurr] :
      ( v2526(VarCurr,bitIndex20)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_1200,axiom,(
    ! [VarCurr] :
      ( v2526(VarCurr,bitIndex21)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_1199,axiom,(
    ! [VarCurr] :
      ( v2526(VarCurr,bitIndex22)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_1198,axiom,(
    ! [VarCurr] :
      ( v2526(VarCurr,bitIndex23)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_1197,axiom,(
    ! [VarCurr] :
      ( v2526(VarCurr,bitIndex24)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_1196,axiom,(
    ! [VarCurr] :
      ( v2526(VarCurr,bitIndex25)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_1195,axiom,(
    ! [VarCurr] :
      ( v2526(VarCurr,bitIndex26)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_1194,axiom,(
    ! [VarCurr] :
      ( v2526(VarCurr,bitIndex27)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_1193,axiom,(
    ! [VarCurr] :
      ( v2526(VarCurr,bitIndex28)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_1192,axiom,(
    ! [VarCurr] :
      ( v2526(VarCurr,bitIndex29)
    <=> v2468(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesMultipleBits_28,axiom,(
    ! [VarCurr,B] :
      ( range_31_0(B)
     => ( v2514(VarCurr,B)
      <=> ( v2515(VarCurr,B)
          & v2521(VarCurr,B) ) ) ) )).

fof(addAssignment_1191,axiom,(
    ! [VarCurr] :
      ( v2521(VarCurr,bitIndex0)
    <=> v2473(VarCurr) ) )).

fof(addAssignment_1190,axiom,(
    ! [VarCurr] :
      ( v2521(VarCurr,bitIndex1)
    <=> v2473(VarCurr) ) )).

fof(addAssignment_1189,axiom,(
    ! [VarCurr] :
      ( v2521(VarCurr,bitIndex2)
    <=> v2473(VarCurr) ) )).

fof(addAssignment_1188,axiom,(
    ! [VarCurr] :
      ( v2521(VarCurr,bitIndex3)
    <=> v2473(VarCurr) ) )).

fof(addAssignment_1187,axiom,(
    ! [VarCurr] :
      ( v2521(VarCurr,bitIndex4)
    <=> v2473(VarCurr) ) )).

fof(addAssignment_1186,axiom,(
    ! [VarCurr] :
      ( v2521(VarCurr,bitIndex5)
    <=> v2473(VarCurr) ) )).

fof(addAssignment_1185,axiom,(
    ! [VarCurr] :
      ( v2521(VarCurr,bitIndex6)
    <=> v2473(VarCurr) ) )).

fof(addAssignment_1184,axiom,(
    ! [VarCurr] :
      ( v2521(VarCurr,bitIndex7)
    <=> v2473(VarCurr) ) )).

fof(addAssignment_1183,axiom,(
    ! [VarCurr] :
      ( v2521(VarCurr,bitIndex8)
    <=> v2473(VarCurr) ) )).

fof(addAssignment_1182,axiom,(
    ! [VarCurr] :
      ( v2521(VarCurr,bitIndex9)
    <=> v2473(VarCurr) ) )).

fof(addAssignment_1181,axiom,(
    ! [VarCurr] :
      ( v2521(VarCurr,bitIndex10)
    <=> v2473(VarCurr) ) )).

fof(addAssignment_1180,axiom,(
    ! [VarCurr] :
      ( v2521(VarCurr,bitIndex11)
    <=> v2473(VarCurr) ) )).

fof(addAssignment_1179,axiom,(
    ! [VarCurr] :
      ( v2521(VarCurr,bitIndex12)
    <=> v2473(VarCurr) ) )).

fof(addAssignment_1178,axiom,(
    ! [VarCurr] :
      ( v2521(VarCurr,bitIndex13)
    <=> v2473(VarCurr) ) )).

fof(addAssignment_1177,axiom,(
    ! [VarCurr] :
      ( v2521(VarCurr,bitIndex14)
    <=> v2473(VarCurr) ) )).

fof(addAssignment_1176,axiom,(
    ! [VarCurr] :
      ( v2521(VarCurr,bitIndex15)
    <=> v2473(VarCurr) ) )).

fof(addAssignment_1175,axiom,(
    ! [VarCurr] :
      ( v2521(VarCurr,bitIndex16)
    <=> v2473(VarCurr) ) )).

fof(addAssignment_1174,axiom,(
    ! [VarCurr] :
      ( v2521(VarCurr,bitIndex17)
    <=> v2473(VarCurr) ) )).

fof(addAssignment_1173,axiom,(
    ! [VarCurr] :
      ( v2521(VarCurr,bitIndex18)
    <=> v2473(VarCurr) ) )).

fof(addAssignment_1172,axiom,(
    ! [VarCurr] :
      ( v2521(VarCurr,bitIndex19)
    <=> v2473(VarCurr) ) )).

fof(addAssignment_1171,axiom,(
    ! [VarCurr] :
      ( v2521(VarCurr,bitIndex20)
    <=> v2473(VarCurr) ) )).

fof(addAssignment_1170,axiom,(
    ! [VarCurr] :
      ( v2521(VarCurr,bitIndex21)
    <=> v2473(VarCurr) ) )).

fof(addAssignment_1169,axiom,(
    ! [VarCurr] :
      ( v2521(VarCurr,bitIndex22)
    <=> v2473(VarCurr) ) )).

fof(addAssignment_1168,axiom,(
    ! [VarCurr] :
      ( v2521(VarCurr,bitIndex23)
    <=> v2473(VarCurr) ) )).

fof(addAssignment_1167,axiom,(
    ! [VarCurr] :
      ( v2521(VarCurr,bitIndex24)
    <=> v2473(VarCurr) ) )).

fof(addAssignment_1166,axiom,(
    ! [VarCurr] :
      ( v2521(VarCurr,bitIndex25)
    <=> v2473(VarCurr) ) )).

fof(addAssignment_1165,axiom,(
    ! [VarCurr] :
      ( v2521(VarCurr,bitIndex26)
    <=> v2473(VarCurr) ) )).

fof(addAssignment_1164,axiom,(
    ! [VarCurr] :
      ( v2521(VarCurr,bitIndex27)
    <=> v2473(VarCurr) ) )).

fof(addAssignment_1163,axiom,(
    ! [VarCurr] :
      ( v2521(VarCurr,bitIndex28)
    <=> v2473(VarCurr) ) )).

fof(addAssignment_1162,axiom,(
    ! [VarCurr] :
      ( v2521(VarCurr,bitIndex29)
    <=> v2473(VarCurr) ) )).

fof(addAssignment_1161,axiom,(
    ! [VarCurr] :
      ( v2521(VarCurr,bitIndex30)
    <=> v2473(VarCurr) ) )).

fof(addAssignment_1160,axiom,(
    ! [VarCurr] :
      ( v2521(VarCurr,bitIndex31)
    <=> v2473(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesMultipleBits_27,axiom,(
    ! [VarCurr,B] :
      ( range_31_0(B)
     => ( v2515(VarCurr,B)
      <=> ( v2516(VarCurr,B)
          | v2518(VarCurr,B) ) ) ) )).

fof(writeBinaryOperatorEqualRangesMultipleBits_26,axiom,(
    ! [VarCurr,B] :
      ( range_31_0(B)
     => ( v2518(VarCurr,B)
      <=> ( v2519(VarCurr,B)
          & v2520(VarCurr,B) ) ) ) )).

fof(addAssignment_1159,axiom,(
    ! [VarCurr] :
      ( v2520(VarCurr,bitIndex0)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_1158,axiom,(
    ! [VarCurr] :
      ( v2520(VarCurr,bitIndex1)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_1157,axiom,(
    ! [VarCurr] :
      ( v2520(VarCurr,bitIndex2)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_1156,axiom,(
    ! [VarCurr] :
      ( v2520(VarCurr,bitIndex3)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_1155,axiom,(
    ! [VarCurr] :
      ( v2520(VarCurr,bitIndex4)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_1154,axiom,(
    ! [VarCurr] :
      ( v2520(VarCurr,bitIndex5)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_1153,axiom,(
    ! [VarCurr] :
      ( v2520(VarCurr,bitIndex6)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_1152,axiom,(
    ! [VarCurr] :
      ( v2520(VarCurr,bitIndex7)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_1151,axiom,(
    ! [VarCurr] :
      ( v2520(VarCurr,bitIndex8)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_1150,axiom,(
    ! [VarCurr] :
      ( v2520(VarCurr,bitIndex9)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_1149,axiom,(
    ! [VarCurr] :
      ( v2520(VarCurr,bitIndex10)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_1148,axiom,(
    ! [VarCurr] :
      ( v2520(VarCurr,bitIndex11)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_1147,axiom,(
    ! [VarCurr] :
      ( v2520(VarCurr,bitIndex12)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_1146,axiom,(
    ! [VarCurr] :
      ( v2520(VarCurr,bitIndex13)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_1145,axiom,(
    ! [VarCurr] :
      ( v2520(VarCurr,bitIndex14)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_1144,axiom,(
    ! [VarCurr] :
      ( v2520(VarCurr,bitIndex15)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_1143,axiom,(
    ! [VarCurr] :
      ( v2520(VarCurr,bitIndex16)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_1142,axiom,(
    ! [VarCurr] :
      ( v2520(VarCurr,bitIndex17)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_1141,axiom,(
    ! [VarCurr] :
      ( v2520(VarCurr,bitIndex18)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_1140,axiom,(
    ! [VarCurr] :
      ( v2520(VarCurr,bitIndex19)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_1139,axiom,(
    ! [VarCurr] :
      ( v2520(VarCurr,bitIndex20)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_1138,axiom,(
    ! [VarCurr] :
      ( v2520(VarCurr,bitIndex21)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_1137,axiom,(
    ! [VarCurr] :
      ( v2520(VarCurr,bitIndex22)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_1136,axiom,(
    ! [VarCurr] :
      ( v2520(VarCurr,bitIndex23)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_1135,axiom,(
    ! [VarCurr] :
      ( v2520(VarCurr,bitIndex24)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_1134,axiom,(
    ! [VarCurr] :
      ( v2520(VarCurr,bitIndex25)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_1133,axiom,(
    ! [VarCurr] :
      ( v2520(VarCurr,bitIndex26)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_1132,axiom,(
    ! [VarCurr] :
      ( v2520(VarCurr,bitIndex27)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_1131,axiom,(
    ! [VarCurr] :
      ( v2520(VarCurr,bitIndex28)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_1130,axiom,(
    ! [VarCurr] :
      ( v2520(VarCurr,bitIndex29)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_1129,axiom,(
    ! [VarCurr] :
      ( v2520(VarCurr,bitIndex30)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_1128,axiom,(
    ! [VarCurr] :
      ( v2520(VarCurr,bitIndex31)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_1127,axiom,(
    ! [VarCurr] :
      ( ( v2519(VarCurr,bitIndex30)
      <=> v2465(VarCurr,bitIndex39) )
      & ( v2519(VarCurr,bitIndex29)
      <=> v2465(VarCurr,bitIndex38) )
      & ( v2519(VarCurr,bitIndex28)
      <=> v2465(VarCurr,bitIndex37) )
      & ( v2519(VarCurr,bitIndex27)
      <=> v2465(VarCurr,bitIndex36) )
      & ( v2519(VarCurr,bitIndex26)
      <=> v2465(VarCurr,bitIndex35) )
      & ( v2519(VarCurr,bitIndex25)
      <=> v2465(VarCurr,bitIndex34) )
      & ( v2519(VarCurr,bitIndex24)
      <=> v2465(VarCurr,bitIndex33) )
      & ( v2519(VarCurr,bitIndex23)
      <=> v2465(VarCurr,bitIndex32) )
      & ( v2519(VarCurr,bitIndex22)
      <=> v2465(VarCurr,bitIndex31) )
      & ( v2519(VarCurr,bitIndex21)
      <=> v2465(VarCurr,bitIndex30) )
      & ( v2519(VarCurr,bitIndex20)
      <=> v2465(VarCurr,bitIndex29) )
      & ( v2519(VarCurr,bitIndex19)
      <=> v2465(VarCurr,bitIndex28) )
      & ( v2519(VarCurr,bitIndex18)
      <=> v2465(VarCurr,bitIndex27) )
      & ( v2519(VarCurr,bitIndex17)
      <=> v2465(VarCurr,bitIndex26) )
      & ( v2519(VarCurr,bitIndex16)
      <=> v2465(VarCurr,bitIndex25) )
      & ( v2519(VarCurr,bitIndex15)
      <=> v2465(VarCurr,bitIndex24) )
      & ( v2519(VarCurr,bitIndex14)
      <=> v2465(VarCurr,bitIndex23) )
      & ( v2519(VarCurr,bitIndex13)
      <=> v2465(VarCurr,bitIndex22) )
      & ( v2519(VarCurr,bitIndex12)
      <=> v2465(VarCurr,bitIndex21) )
      & ( v2519(VarCurr,bitIndex11)
      <=> v2465(VarCurr,bitIndex20) )
      & ( v2519(VarCurr,bitIndex10)
      <=> v2465(VarCurr,bitIndex19) )
      & ( v2519(VarCurr,bitIndex9)
      <=> v2465(VarCurr,bitIndex18) )
      & ( v2519(VarCurr,bitIndex8)
      <=> v2465(VarCurr,bitIndex17) )
      & ( v2519(VarCurr,bitIndex7)
      <=> v2465(VarCurr,bitIndex16) )
      & ( v2519(VarCurr,bitIndex6)
      <=> v2465(VarCurr,bitIndex15) )
      & ( v2519(VarCurr,bitIndex5)
      <=> v2465(VarCurr,bitIndex14) )
      & ( v2519(VarCurr,bitIndex4)
      <=> v2465(VarCurr,bitIndex13) )
      & ( v2519(VarCurr,bitIndex3)
      <=> v2465(VarCurr,bitIndex12) )
      & ( v2519(VarCurr,bitIndex2)
      <=> v2465(VarCurr,bitIndex11) )
      & ( v2519(VarCurr,bitIndex1)
      <=> v2465(VarCurr,bitIndex10) )
      & ( v2519(VarCurr,bitIndex0)
      <=> v2465(VarCurr,bitIndex9) ) ) )).

fof(addAssignment_1126,axiom,(
    ! [VarCurr] :
      ( v2519(VarCurr,bitIndex31)
    <=> $false ) )).

fof(writeBinaryOperatorShiftedRanges_246,axiom,(
    ! [VarCurr] :
      ( v2516(VarCurr,bitIndex0)
    <=> ( v2465(VarCurr,bitIndex8)
        & v2517(VarCurr,bitIndex0) ) ) )).

fof(writeBinaryOperatorShiftedRanges_245,axiom,(
    ! [VarCurr] :
      ( v2516(VarCurr,bitIndex1)
    <=> ( v2465(VarCurr,bitIndex9)
        & v2517(VarCurr,bitIndex1) ) ) )).

fof(writeBinaryOperatorShiftedRanges_244,axiom,(
    ! [VarCurr] :
      ( v2516(VarCurr,bitIndex2)
    <=> ( v2465(VarCurr,bitIndex10)
        & v2517(VarCurr,bitIndex2) ) ) )).

fof(writeBinaryOperatorShiftedRanges_243,axiom,(
    ! [VarCurr] :
      ( v2516(VarCurr,bitIndex3)
    <=> ( v2465(VarCurr,bitIndex11)
        & v2517(VarCurr,bitIndex3) ) ) )).

fof(writeBinaryOperatorShiftedRanges_242,axiom,(
    ! [VarCurr] :
      ( v2516(VarCurr,bitIndex4)
    <=> ( v2465(VarCurr,bitIndex12)
        & v2517(VarCurr,bitIndex4) ) ) )).

fof(writeBinaryOperatorShiftedRanges_241,axiom,(
    ! [VarCurr] :
      ( v2516(VarCurr,bitIndex5)
    <=> ( v2465(VarCurr,bitIndex13)
        & v2517(VarCurr,bitIndex5) ) ) )).

fof(writeBinaryOperatorShiftedRanges_240,axiom,(
    ! [VarCurr] :
      ( v2516(VarCurr,bitIndex6)
    <=> ( v2465(VarCurr,bitIndex14)
        & v2517(VarCurr,bitIndex6) ) ) )).

fof(writeBinaryOperatorShiftedRanges_239,axiom,(
    ! [VarCurr] :
      ( v2516(VarCurr,bitIndex7)
    <=> ( v2465(VarCurr,bitIndex15)
        & v2517(VarCurr,bitIndex7) ) ) )).

fof(writeBinaryOperatorShiftedRanges_238,axiom,(
    ! [VarCurr] :
      ( v2516(VarCurr,bitIndex8)
    <=> ( v2465(VarCurr,bitIndex16)
        & v2517(VarCurr,bitIndex8) ) ) )).

fof(writeBinaryOperatorShiftedRanges_237,axiom,(
    ! [VarCurr] :
      ( v2516(VarCurr,bitIndex9)
    <=> ( v2465(VarCurr,bitIndex17)
        & v2517(VarCurr,bitIndex9) ) ) )).

fof(writeBinaryOperatorShiftedRanges_236,axiom,(
    ! [VarCurr] :
      ( v2516(VarCurr,bitIndex10)
    <=> ( v2465(VarCurr,bitIndex18)
        & v2517(VarCurr,bitIndex10) ) ) )).

fof(writeBinaryOperatorShiftedRanges_235,axiom,(
    ! [VarCurr] :
      ( v2516(VarCurr,bitIndex11)
    <=> ( v2465(VarCurr,bitIndex19)
        & v2517(VarCurr,bitIndex11) ) ) )).

fof(writeBinaryOperatorShiftedRanges_234,axiom,(
    ! [VarCurr] :
      ( v2516(VarCurr,bitIndex12)
    <=> ( v2465(VarCurr,bitIndex20)
        & v2517(VarCurr,bitIndex12) ) ) )).

fof(writeBinaryOperatorShiftedRanges_233,axiom,(
    ! [VarCurr] :
      ( v2516(VarCurr,bitIndex13)
    <=> ( v2465(VarCurr,bitIndex21)
        & v2517(VarCurr,bitIndex13) ) ) )).

fof(writeBinaryOperatorShiftedRanges_232,axiom,(
    ! [VarCurr] :
      ( v2516(VarCurr,bitIndex14)
    <=> ( v2465(VarCurr,bitIndex22)
        & v2517(VarCurr,bitIndex14) ) ) )).

fof(writeBinaryOperatorShiftedRanges_231,axiom,(
    ! [VarCurr] :
      ( v2516(VarCurr,bitIndex15)
    <=> ( v2465(VarCurr,bitIndex23)
        & v2517(VarCurr,bitIndex15) ) ) )).

fof(writeBinaryOperatorShiftedRanges_230,axiom,(
    ! [VarCurr] :
      ( v2516(VarCurr,bitIndex16)
    <=> ( v2465(VarCurr,bitIndex24)
        & v2517(VarCurr,bitIndex16) ) ) )).

fof(writeBinaryOperatorShiftedRanges_229,axiom,(
    ! [VarCurr] :
      ( v2516(VarCurr,bitIndex17)
    <=> ( v2465(VarCurr,bitIndex25)
        & v2517(VarCurr,bitIndex17) ) ) )).

fof(writeBinaryOperatorShiftedRanges_228,axiom,(
    ! [VarCurr] :
      ( v2516(VarCurr,bitIndex18)
    <=> ( v2465(VarCurr,bitIndex26)
        & v2517(VarCurr,bitIndex18) ) ) )).

fof(writeBinaryOperatorShiftedRanges_227,axiom,(
    ! [VarCurr] :
      ( v2516(VarCurr,bitIndex19)
    <=> ( v2465(VarCurr,bitIndex27)
        & v2517(VarCurr,bitIndex19) ) ) )).

fof(writeBinaryOperatorShiftedRanges_226,axiom,(
    ! [VarCurr] :
      ( v2516(VarCurr,bitIndex20)
    <=> ( v2465(VarCurr,bitIndex28)
        & v2517(VarCurr,bitIndex20) ) ) )).

fof(writeBinaryOperatorShiftedRanges_225,axiom,(
    ! [VarCurr] :
      ( v2516(VarCurr,bitIndex21)
    <=> ( v2465(VarCurr,bitIndex29)
        & v2517(VarCurr,bitIndex21) ) ) )).

fof(writeBinaryOperatorShiftedRanges_224,axiom,(
    ! [VarCurr] :
      ( v2516(VarCurr,bitIndex22)
    <=> ( v2465(VarCurr,bitIndex30)
        & v2517(VarCurr,bitIndex22) ) ) )).

fof(writeBinaryOperatorShiftedRanges_223,axiom,(
    ! [VarCurr] :
      ( v2516(VarCurr,bitIndex23)
    <=> ( v2465(VarCurr,bitIndex31)
        & v2517(VarCurr,bitIndex23) ) ) )).

fof(writeBinaryOperatorShiftedRanges_222,axiom,(
    ! [VarCurr] :
      ( v2516(VarCurr,bitIndex24)
    <=> ( v2465(VarCurr,bitIndex32)
        & v2517(VarCurr,bitIndex24) ) ) )).

fof(writeBinaryOperatorShiftedRanges_221,axiom,(
    ! [VarCurr] :
      ( v2516(VarCurr,bitIndex25)
    <=> ( v2465(VarCurr,bitIndex33)
        & v2517(VarCurr,bitIndex25) ) ) )).

fof(writeBinaryOperatorShiftedRanges_220,axiom,(
    ! [VarCurr] :
      ( v2516(VarCurr,bitIndex26)
    <=> ( v2465(VarCurr,bitIndex34)
        & v2517(VarCurr,bitIndex26) ) ) )).

fof(writeBinaryOperatorShiftedRanges_219,axiom,(
    ! [VarCurr] :
      ( v2516(VarCurr,bitIndex27)
    <=> ( v2465(VarCurr,bitIndex35)
        & v2517(VarCurr,bitIndex27) ) ) )).

fof(writeBinaryOperatorShiftedRanges_218,axiom,(
    ! [VarCurr] :
      ( v2516(VarCurr,bitIndex28)
    <=> ( v2465(VarCurr,bitIndex36)
        & v2517(VarCurr,bitIndex28) ) ) )).

fof(writeBinaryOperatorShiftedRanges_217,axiom,(
    ! [VarCurr] :
      ( v2516(VarCurr,bitIndex29)
    <=> ( v2465(VarCurr,bitIndex37)
        & v2517(VarCurr,bitIndex29) ) ) )).

fof(writeBinaryOperatorShiftedRanges_216,axiom,(
    ! [VarCurr] :
      ( v2516(VarCurr,bitIndex30)
    <=> ( v2465(VarCurr,bitIndex38)
        & v2517(VarCurr,bitIndex30) ) ) )).

fof(writeBinaryOperatorShiftedRanges_215,axiom,(
    ! [VarCurr] :
      ( v2516(VarCurr,bitIndex31)
    <=> ( v2465(VarCurr,bitIndex39)
        & v2517(VarCurr,bitIndex31) ) ) )).

fof(addAssignment_1125,axiom,(
    ! [VarCurr] :
      ( v2517(VarCurr,bitIndex0)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_1124,axiom,(
    ! [VarCurr] :
      ( v2517(VarCurr,bitIndex1)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_1123,axiom,(
    ! [VarCurr] :
      ( v2517(VarCurr,bitIndex2)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_1122,axiom,(
    ! [VarCurr] :
      ( v2517(VarCurr,bitIndex3)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_1121,axiom,(
    ! [VarCurr] :
      ( v2517(VarCurr,bitIndex4)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_1120,axiom,(
    ! [VarCurr] :
      ( v2517(VarCurr,bitIndex5)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_1119,axiom,(
    ! [VarCurr] :
      ( v2517(VarCurr,bitIndex6)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_1118,axiom,(
    ! [VarCurr] :
      ( v2517(VarCurr,bitIndex7)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_1117,axiom,(
    ! [VarCurr] :
      ( v2517(VarCurr,bitIndex8)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_1116,axiom,(
    ! [VarCurr] :
      ( v2517(VarCurr,bitIndex9)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_1115,axiom,(
    ! [VarCurr] :
      ( v2517(VarCurr,bitIndex10)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_1114,axiom,(
    ! [VarCurr] :
      ( v2517(VarCurr,bitIndex11)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_1113,axiom,(
    ! [VarCurr] :
      ( v2517(VarCurr,bitIndex12)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_1112,axiom,(
    ! [VarCurr] :
      ( v2517(VarCurr,bitIndex13)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_1111,axiom,(
    ! [VarCurr] :
      ( v2517(VarCurr,bitIndex14)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_1110,axiom,(
    ! [VarCurr] :
      ( v2517(VarCurr,bitIndex15)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_1109,axiom,(
    ! [VarCurr] :
      ( v2517(VarCurr,bitIndex16)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_1108,axiom,(
    ! [VarCurr] :
      ( v2517(VarCurr,bitIndex17)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_1107,axiom,(
    ! [VarCurr] :
      ( v2517(VarCurr,bitIndex18)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_1106,axiom,(
    ! [VarCurr] :
      ( v2517(VarCurr,bitIndex19)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_1105,axiom,(
    ! [VarCurr] :
      ( v2517(VarCurr,bitIndex20)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_1104,axiom,(
    ! [VarCurr] :
      ( v2517(VarCurr,bitIndex21)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_1103,axiom,(
    ! [VarCurr] :
      ( v2517(VarCurr,bitIndex22)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_1102,axiom,(
    ! [VarCurr] :
      ( v2517(VarCurr,bitIndex23)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_1101,axiom,(
    ! [VarCurr] :
      ( v2517(VarCurr,bitIndex24)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_1100,axiom,(
    ! [VarCurr] :
      ( v2517(VarCurr,bitIndex25)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_1099,axiom,(
    ! [VarCurr] :
      ( v2517(VarCurr,bitIndex26)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_1098,axiom,(
    ! [VarCurr] :
      ( v2517(VarCurr,bitIndex27)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_1097,axiom,(
    ! [VarCurr] :
      ( v2517(VarCurr,bitIndex28)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_1096,axiom,(
    ! [VarCurr] :
      ( v2517(VarCurr,bitIndex29)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_1095,axiom,(
    ! [VarCurr] :
      ( v2517(VarCurr,bitIndex30)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_1094,axiom,(
    ! [VarCurr] :
      ( v2517(VarCurr,bitIndex31)
    <=> v2468(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesMultipleBits_25,axiom,(
    ! [VarCurr,B] :
      ( range_39_0(B)
     => ( v2458(VarCurr,B)
      <=> ( v2459(VarCurr,B)
          & v2506(VarCurr,B) ) ) ) )).

fof(addAssignment_1093,axiom,(
    ! [VarCurr] :
      ( v2506(VarCurr,bitIndex0)
    <=> v2507(VarCurr) ) )).

fof(addAssignment_1092,axiom,(
    ! [VarCurr] :
      ( v2506(VarCurr,bitIndex1)
    <=> v2507(VarCurr) ) )).

fof(addAssignment_1091,axiom,(
    ! [VarCurr] :
      ( v2506(VarCurr,bitIndex2)
    <=> v2507(VarCurr) ) )).

fof(addAssignment_1090,axiom,(
    ! [VarCurr] :
      ( v2506(VarCurr,bitIndex3)
    <=> v2507(VarCurr) ) )).

fof(addAssignment_1089,axiom,(
    ! [VarCurr] :
      ( v2506(VarCurr,bitIndex4)
    <=> v2507(VarCurr) ) )).

fof(addAssignment_1088,axiom,(
    ! [VarCurr] :
      ( v2506(VarCurr,bitIndex5)
    <=> v2507(VarCurr) ) )).

fof(addAssignment_1087,axiom,(
    ! [VarCurr] :
      ( v2506(VarCurr,bitIndex6)
    <=> v2507(VarCurr) ) )).

fof(addAssignment_1086,axiom,(
    ! [VarCurr] :
      ( v2506(VarCurr,bitIndex7)
    <=> v2507(VarCurr) ) )).

fof(addAssignment_1085,axiom,(
    ! [VarCurr] :
      ( v2506(VarCurr,bitIndex8)
    <=> v2507(VarCurr) ) )).

fof(addAssignment_1084,axiom,(
    ! [VarCurr] :
      ( v2506(VarCurr,bitIndex9)
    <=> v2507(VarCurr) ) )).

fof(addAssignment_1083,axiom,(
    ! [VarCurr] :
      ( v2506(VarCurr,bitIndex10)
    <=> v2507(VarCurr) ) )).

fof(addAssignment_1082,axiom,(
    ! [VarCurr] :
      ( v2506(VarCurr,bitIndex11)
    <=> v2507(VarCurr) ) )).

fof(addAssignment_1081,axiom,(
    ! [VarCurr] :
      ( v2506(VarCurr,bitIndex12)
    <=> v2507(VarCurr) ) )).

fof(addAssignment_1080,axiom,(
    ! [VarCurr] :
      ( v2506(VarCurr,bitIndex13)
    <=> v2507(VarCurr) ) )).

fof(addAssignment_1079,axiom,(
    ! [VarCurr] :
      ( v2506(VarCurr,bitIndex14)
    <=> v2507(VarCurr) ) )).

fof(addAssignment_1078,axiom,(
    ! [VarCurr] :
      ( v2506(VarCurr,bitIndex15)
    <=> v2507(VarCurr) ) )).

fof(addAssignment_1077,axiom,(
    ! [VarCurr] :
      ( v2506(VarCurr,bitIndex16)
    <=> v2507(VarCurr) ) )).

fof(addAssignment_1076,axiom,(
    ! [VarCurr] :
      ( v2506(VarCurr,bitIndex17)
    <=> v2507(VarCurr) ) )).

fof(addAssignment_1075,axiom,(
    ! [VarCurr] :
      ( v2506(VarCurr,bitIndex18)
    <=> v2507(VarCurr) ) )).

fof(addAssignment_1074,axiom,(
    ! [VarCurr] :
      ( v2506(VarCurr,bitIndex19)
    <=> v2507(VarCurr) ) )).

fof(addAssignment_1073,axiom,(
    ! [VarCurr] :
      ( v2506(VarCurr,bitIndex20)
    <=> v2507(VarCurr) ) )).

fof(addAssignment_1072,axiom,(
    ! [VarCurr] :
      ( v2506(VarCurr,bitIndex21)
    <=> v2507(VarCurr) ) )).

fof(addAssignment_1071,axiom,(
    ! [VarCurr] :
      ( v2506(VarCurr,bitIndex22)
    <=> v2507(VarCurr) ) )).

fof(addAssignment_1070,axiom,(
    ! [VarCurr] :
      ( v2506(VarCurr,bitIndex23)
    <=> v2507(VarCurr) ) )).

fof(addAssignment_1069,axiom,(
    ! [VarCurr] :
      ( v2506(VarCurr,bitIndex24)
    <=> v2507(VarCurr) ) )).

fof(addAssignment_1068,axiom,(
    ! [VarCurr] :
      ( v2506(VarCurr,bitIndex25)
    <=> v2507(VarCurr) ) )).

fof(addAssignment_1067,axiom,(
    ! [VarCurr] :
      ( v2506(VarCurr,bitIndex26)
    <=> v2507(VarCurr) ) )).

fof(addAssignment_1066,axiom,(
    ! [VarCurr] :
      ( v2506(VarCurr,bitIndex27)
    <=> v2507(VarCurr) ) )).

fof(addAssignment_1065,axiom,(
    ! [VarCurr] :
      ( v2506(VarCurr,bitIndex28)
    <=> v2507(VarCurr) ) )).

fof(addAssignment_1064,axiom,(
    ! [VarCurr] :
      ( v2506(VarCurr,bitIndex29)
    <=> v2507(VarCurr) ) )).

fof(addAssignment_1063,axiom,(
    ! [VarCurr] :
      ( v2506(VarCurr,bitIndex30)
    <=> v2507(VarCurr) ) )).

fof(addAssignment_1062,axiom,(
    ! [VarCurr] :
      ( v2506(VarCurr,bitIndex31)
    <=> v2507(VarCurr) ) )).

fof(addAssignment_1061,axiom,(
    ! [VarCurr] :
      ( v2506(VarCurr,bitIndex32)
    <=> v2507(VarCurr) ) )).

fof(addAssignment_1060,axiom,(
    ! [VarCurr] :
      ( v2506(VarCurr,bitIndex33)
    <=> v2507(VarCurr) ) )).

fof(addAssignment_1059,axiom,(
    ! [VarCurr] :
      ( v2506(VarCurr,bitIndex34)
    <=> v2507(VarCurr) ) )).

fof(addAssignment_1058,axiom,(
    ! [VarCurr] :
      ( v2506(VarCurr,bitIndex35)
    <=> v2507(VarCurr) ) )).

fof(addAssignment_1057,axiom,(
    ! [VarCurr] :
      ( v2506(VarCurr,bitIndex36)
    <=> v2507(VarCurr) ) )).

fof(addAssignment_1056,axiom,(
    ! [VarCurr] :
      ( v2506(VarCurr,bitIndex37)
    <=> v2507(VarCurr) ) )).

fof(addAssignment_1055,axiom,(
    ! [VarCurr] :
      ( v2506(VarCurr,bitIndex38)
    <=> v2507(VarCurr) ) )).

fof(addAssignment_1054,axiom,(
    ! [VarCurr] :
      ( v2506(VarCurr,bitIndex39)
    <=> v2507(VarCurr) ) )).

fof(writeUnaryOperator_217,axiom,(
    ! [VarCurr] :
      ( ~ v2507(VarCurr)
    <=> v2453(VarCurr,bitIndex3) ) )).

fof(writeBinaryOperatorEqualRangesMultipleBits_24,axiom,(
    ! [VarCurr,B] :
      ( range_39_0(B)
     => ( v2459(VarCurr,B)
      <=> ( v2460(VarCurr,B)
          | v2485(VarCurr,B) ) ) ) )).

fof(writeBinaryOperatorEqualRangesMultipleBits_23,axiom,(
    ! [VarCurr,B] :
      ( range_39_0(B)
     => ( v2485(VarCurr,B)
      <=> ( v2486(VarCurr,B)
          & v2505(VarCurr,B) ) ) ) )).

fof(addAssignment_1053,axiom,(
    ! [VarCurr] :
      ( v2505(VarCurr,bitIndex0)
    <=> v2453(VarCurr,bitIndex2) ) )).

fof(addAssignment_1052,axiom,(
    ! [VarCurr] :
      ( v2505(VarCurr,bitIndex1)
    <=> v2453(VarCurr,bitIndex2) ) )).

fof(addAssignment_1051,axiom,(
    ! [VarCurr] :
      ( v2505(VarCurr,bitIndex2)
    <=> v2453(VarCurr,bitIndex2) ) )).

fof(addAssignment_1050,axiom,(
    ! [VarCurr] :
      ( v2505(VarCurr,bitIndex3)
    <=> v2453(VarCurr,bitIndex2) ) )).

fof(addAssignment_1049,axiom,(
    ! [VarCurr] :
      ( v2505(VarCurr,bitIndex4)
    <=> v2453(VarCurr,bitIndex2) ) )).

fof(addAssignment_1048,axiom,(
    ! [VarCurr] :
      ( v2505(VarCurr,bitIndex5)
    <=> v2453(VarCurr,bitIndex2) ) )).

fof(addAssignment_1047,axiom,(
    ! [VarCurr] :
      ( v2505(VarCurr,bitIndex6)
    <=> v2453(VarCurr,bitIndex2) ) )).

fof(addAssignment_1046,axiom,(
    ! [VarCurr] :
      ( v2505(VarCurr,bitIndex7)
    <=> v2453(VarCurr,bitIndex2) ) )).

fof(addAssignment_1045,axiom,(
    ! [VarCurr] :
      ( v2505(VarCurr,bitIndex8)
    <=> v2453(VarCurr,bitIndex2) ) )).

fof(addAssignment_1044,axiom,(
    ! [VarCurr] :
      ( v2505(VarCurr,bitIndex9)
    <=> v2453(VarCurr,bitIndex2) ) )).

fof(addAssignment_1043,axiom,(
    ! [VarCurr] :
      ( v2505(VarCurr,bitIndex10)
    <=> v2453(VarCurr,bitIndex2) ) )).

fof(addAssignment_1042,axiom,(
    ! [VarCurr] :
      ( v2505(VarCurr,bitIndex11)
    <=> v2453(VarCurr,bitIndex2) ) )).

fof(addAssignment_1041,axiom,(
    ! [VarCurr] :
      ( v2505(VarCurr,bitIndex12)
    <=> v2453(VarCurr,bitIndex2) ) )).

fof(addAssignment_1040,axiom,(
    ! [VarCurr] :
      ( v2505(VarCurr,bitIndex13)
    <=> v2453(VarCurr,bitIndex2) ) )).

fof(addAssignment_1039,axiom,(
    ! [VarCurr] :
      ( v2505(VarCurr,bitIndex14)
    <=> v2453(VarCurr,bitIndex2) ) )).

fof(addAssignment_1038,axiom,(
    ! [VarCurr] :
      ( v2505(VarCurr,bitIndex15)
    <=> v2453(VarCurr,bitIndex2) ) )).

fof(addAssignment_1037,axiom,(
    ! [VarCurr] :
      ( v2505(VarCurr,bitIndex16)
    <=> v2453(VarCurr,bitIndex2) ) )).

fof(addAssignment_1036,axiom,(
    ! [VarCurr] :
      ( v2505(VarCurr,bitIndex17)
    <=> v2453(VarCurr,bitIndex2) ) )).

fof(addAssignment_1035,axiom,(
    ! [VarCurr] :
      ( v2505(VarCurr,bitIndex18)
    <=> v2453(VarCurr,bitIndex2) ) )).

fof(addAssignment_1034,axiom,(
    ! [VarCurr] :
      ( v2505(VarCurr,bitIndex19)
    <=> v2453(VarCurr,bitIndex2) ) )).

fof(addAssignment_1033,axiom,(
    ! [VarCurr] :
      ( v2505(VarCurr,bitIndex20)
    <=> v2453(VarCurr,bitIndex2) ) )).

fof(addAssignment_1032,axiom,(
    ! [VarCurr] :
      ( v2505(VarCurr,bitIndex21)
    <=> v2453(VarCurr,bitIndex2) ) )).

fof(addAssignment_1031,axiom,(
    ! [VarCurr] :
      ( v2505(VarCurr,bitIndex22)
    <=> v2453(VarCurr,bitIndex2) ) )).

fof(addAssignment_1030,axiom,(
    ! [VarCurr] :
      ( v2505(VarCurr,bitIndex23)
    <=> v2453(VarCurr,bitIndex2) ) )).

fof(addAssignment_1029,axiom,(
    ! [VarCurr] :
      ( v2505(VarCurr,bitIndex24)
    <=> v2453(VarCurr,bitIndex2) ) )).

fof(addAssignment_1028,axiom,(
    ! [VarCurr] :
      ( v2505(VarCurr,bitIndex25)
    <=> v2453(VarCurr,bitIndex2) ) )).

fof(addAssignment_1027,axiom,(
    ! [VarCurr] :
      ( v2505(VarCurr,bitIndex26)
    <=> v2453(VarCurr,bitIndex2) ) )).

fof(addAssignment_1026,axiom,(
    ! [VarCurr] :
      ( v2505(VarCurr,bitIndex27)
    <=> v2453(VarCurr,bitIndex2) ) )).

fof(addAssignment_1025,axiom,(
    ! [VarCurr] :
      ( v2505(VarCurr,bitIndex28)
    <=> v2453(VarCurr,bitIndex2) ) )).

fof(addAssignment_1024,axiom,(
    ! [VarCurr] :
      ( v2505(VarCurr,bitIndex29)
    <=> v2453(VarCurr,bitIndex2) ) )).

fof(addAssignment_1023,axiom,(
    ! [VarCurr] :
      ( v2505(VarCurr,bitIndex30)
    <=> v2453(VarCurr,bitIndex2) ) )).

fof(addAssignment_1022,axiom,(
    ! [VarCurr] :
      ( v2505(VarCurr,bitIndex31)
    <=> v2453(VarCurr,bitIndex2) ) )).

fof(addAssignment_1021,axiom,(
    ! [VarCurr] :
      ( v2505(VarCurr,bitIndex32)
    <=> v2453(VarCurr,bitIndex2) ) )).

fof(addAssignment_1020,axiom,(
    ! [VarCurr] :
      ( v2505(VarCurr,bitIndex33)
    <=> v2453(VarCurr,bitIndex2) ) )).

fof(addAssignment_1019,axiom,(
    ! [VarCurr] :
      ( v2505(VarCurr,bitIndex34)
    <=> v2453(VarCurr,bitIndex2) ) )).

fof(addAssignment_1018,axiom,(
    ! [VarCurr] :
      ( v2505(VarCurr,bitIndex35)
    <=> v2453(VarCurr,bitIndex2) ) )).

fof(addAssignment_1017,axiom,(
    ! [VarCurr] :
      ( v2505(VarCurr,bitIndex36)
    <=> v2453(VarCurr,bitIndex2) ) )).

fof(addAssignment_1016,axiom,(
    ! [VarCurr] :
      ( v2505(VarCurr,bitIndex37)
    <=> v2453(VarCurr,bitIndex2) ) )).

fof(addAssignment_1015,axiom,(
    ! [VarCurr] :
      ( v2505(VarCurr,bitIndex38)
    <=> v2453(VarCurr,bitIndex2) ) )).

fof(addAssignment_1014,axiom,(
    ! [VarCurr] :
      ( v2505(VarCurr,bitIndex39)
    <=> v2453(VarCurr,bitIndex2) ) )).

fof(addAssignment_1013,axiom,(
    ! [VarCurr,B] :
      ( range_35_0(B)
     => ( v2486(VarCurr,B)
      <=> v2487(VarCurr,B) ) ) )).

fof(addAssignment_1012,axiom,(
    ! [VarCurr] :
      ( ( v2486(VarCurr,bitIndex39)
      <=> $false )
      & ( v2486(VarCurr,bitIndex38)
      <=> $false )
      & ( v2486(VarCurr,bitIndex37)
      <=> $false )
      & ( v2486(VarCurr,bitIndex36)
      <=> $false ) ) )).

fof(writeBinaryOperatorEqualRangesMultipleBits_22,axiom,(
    ! [VarCurr,B] :
      ( range_35_0(B)
     => ( v2487(VarCurr,B)
      <=> ( v2488(VarCurr,B)
          | v2496(VarCurr,B) ) ) ) )).

fof(writeBinaryOperatorEqualRangesMultipleBits_21,axiom,(
    ! [VarCurr,B] :
      ( range_35_0(B)
     => ( v2496(VarCurr,B)
      <=> ( v2497(VarCurr,B)
          & v2504(VarCurr,B) ) ) ) )).

fof(addAssignment_1011,axiom,(
    ! [VarCurr] :
      ( v2504(VarCurr,bitIndex0)
    <=> v2453(VarCurr,bitIndex1) ) )).

fof(addAssignment_1010,axiom,(
    ! [VarCurr] :
      ( v2504(VarCurr,bitIndex1)
    <=> v2453(VarCurr,bitIndex1) ) )).

fof(addAssignment_1009,axiom,(
    ! [VarCurr] :
      ( v2504(VarCurr,bitIndex2)
    <=> v2453(VarCurr,bitIndex1) ) )).

fof(addAssignment_1008,axiom,(
    ! [VarCurr] :
      ( v2504(VarCurr,bitIndex3)
    <=> v2453(VarCurr,bitIndex1) ) )).

fof(addAssignment_1007,axiom,(
    ! [VarCurr] :
      ( v2504(VarCurr,bitIndex4)
    <=> v2453(VarCurr,bitIndex1) ) )).

fof(addAssignment_1006,axiom,(
    ! [VarCurr] :
      ( v2504(VarCurr,bitIndex5)
    <=> v2453(VarCurr,bitIndex1) ) )).

fof(addAssignment_1005,axiom,(
    ! [VarCurr] :
      ( v2504(VarCurr,bitIndex6)
    <=> v2453(VarCurr,bitIndex1) ) )).

fof(addAssignment_1004,axiom,(
    ! [VarCurr] :
      ( v2504(VarCurr,bitIndex7)
    <=> v2453(VarCurr,bitIndex1) ) )).

fof(addAssignment_1003,axiom,(
    ! [VarCurr] :
      ( v2504(VarCurr,bitIndex8)
    <=> v2453(VarCurr,bitIndex1) ) )).

fof(addAssignment_1002,axiom,(
    ! [VarCurr] :
      ( v2504(VarCurr,bitIndex9)
    <=> v2453(VarCurr,bitIndex1) ) )).

fof(addAssignment_1001,axiom,(
    ! [VarCurr] :
      ( v2504(VarCurr,bitIndex10)
    <=> v2453(VarCurr,bitIndex1) ) )).

fof(addAssignment_1000,axiom,(
    ! [VarCurr] :
      ( v2504(VarCurr,bitIndex11)
    <=> v2453(VarCurr,bitIndex1) ) )).

fof(addAssignment_999,axiom,(
    ! [VarCurr] :
      ( v2504(VarCurr,bitIndex12)
    <=> v2453(VarCurr,bitIndex1) ) )).

fof(addAssignment_998,axiom,(
    ! [VarCurr] :
      ( v2504(VarCurr,bitIndex13)
    <=> v2453(VarCurr,bitIndex1) ) )).

fof(addAssignment_997,axiom,(
    ! [VarCurr] :
      ( v2504(VarCurr,bitIndex14)
    <=> v2453(VarCurr,bitIndex1) ) )).

fof(addAssignment_996,axiom,(
    ! [VarCurr] :
      ( v2504(VarCurr,bitIndex15)
    <=> v2453(VarCurr,bitIndex1) ) )).

fof(addAssignment_995,axiom,(
    ! [VarCurr] :
      ( v2504(VarCurr,bitIndex16)
    <=> v2453(VarCurr,bitIndex1) ) )).

fof(addAssignment_994,axiom,(
    ! [VarCurr] :
      ( v2504(VarCurr,bitIndex17)
    <=> v2453(VarCurr,bitIndex1) ) )).

fof(addAssignment_993,axiom,(
    ! [VarCurr] :
      ( v2504(VarCurr,bitIndex18)
    <=> v2453(VarCurr,bitIndex1) ) )).

fof(addAssignment_992,axiom,(
    ! [VarCurr] :
      ( v2504(VarCurr,bitIndex19)
    <=> v2453(VarCurr,bitIndex1) ) )).

fof(addAssignment_991,axiom,(
    ! [VarCurr] :
      ( v2504(VarCurr,bitIndex20)
    <=> v2453(VarCurr,bitIndex1) ) )).

fof(addAssignment_990,axiom,(
    ! [VarCurr] :
      ( v2504(VarCurr,bitIndex21)
    <=> v2453(VarCurr,bitIndex1) ) )).

fof(addAssignment_989,axiom,(
    ! [VarCurr] :
      ( v2504(VarCurr,bitIndex22)
    <=> v2453(VarCurr,bitIndex1) ) )).

fof(addAssignment_988,axiom,(
    ! [VarCurr] :
      ( v2504(VarCurr,bitIndex23)
    <=> v2453(VarCurr,bitIndex1) ) )).

fof(addAssignment_987,axiom,(
    ! [VarCurr] :
      ( v2504(VarCurr,bitIndex24)
    <=> v2453(VarCurr,bitIndex1) ) )).

fof(addAssignment_986,axiom,(
    ! [VarCurr] :
      ( v2504(VarCurr,bitIndex25)
    <=> v2453(VarCurr,bitIndex1) ) )).

fof(addAssignment_985,axiom,(
    ! [VarCurr] :
      ( v2504(VarCurr,bitIndex26)
    <=> v2453(VarCurr,bitIndex1) ) )).

fof(addAssignment_984,axiom,(
    ! [VarCurr] :
      ( v2504(VarCurr,bitIndex27)
    <=> v2453(VarCurr,bitIndex1) ) )).

fof(addAssignment_983,axiom,(
    ! [VarCurr] :
      ( v2504(VarCurr,bitIndex28)
    <=> v2453(VarCurr,bitIndex1) ) )).

fof(addAssignment_982,axiom,(
    ! [VarCurr] :
      ( v2504(VarCurr,bitIndex29)
    <=> v2453(VarCurr,bitIndex1) ) )).

fof(addAssignment_981,axiom,(
    ! [VarCurr] :
      ( v2504(VarCurr,bitIndex30)
    <=> v2453(VarCurr,bitIndex1) ) )).

fof(addAssignment_980,axiom,(
    ! [VarCurr] :
      ( v2504(VarCurr,bitIndex31)
    <=> v2453(VarCurr,bitIndex1) ) )).

fof(addAssignment_979,axiom,(
    ! [VarCurr] :
      ( v2504(VarCurr,bitIndex32)
    <=> v2453(VarCurr,bitIndex1) ) )).

fof(addAssignment_978,axiom,(
    ! [VarCurr] :
      ( v2504(VarCurr,bitIndex33)
    <=> v2453(VarCurr,bitIndex1) ) )).

fof(addAssignment_977,axiom,(
    ! [VarCurr] :
      ( v2504(VarCurr,bitIndex34)
    <=> v2453(VarCurr,bitIndex1) ) )).

fof(addAssignment_976,axiom,(
    ! [VarCurr] :
      ( v2504(VarCurr,bitIndex35)
    <=> v2453(VarCurr,bitIndex1) ) )).

fof(addAssignment_975,axiom,(
    ! [VarCurr,B] :
      ( range_33_0(B)
     => ( v2497(VarCurr,B)
      <=> v2498(VarCurr,B) ) ) )).

fof(addAssignment_974,axiom,(
    ! [VarCurr] :
      ( ( v2497(VarCurr,bitIndex35)
      <=> $false )
      & ( v2497(VarCurr,bitIndex34)
      <=> $false ) ) )).

fof(writeBinaryOperatorEqualRangesMultipleBits_20,axiom,(
    ! [VarCurr,B] :
      ( range_33_0(B)
     => ( v2498(VarCurr,B)
      <=> ( v2499(VarCurr,B)
          | v2501(VarCurr,B) ) ) ) )).

fof(writeBinaryOperatorEqualRangesMultipleBits_19,axiom,(
    ! [VarCurr,B] :
      ( range_33_0(B)
     => ( v2501(VarCurr,B)
      <=> ( v2502(VarCurr,B)
          & v2503(VarCurr,B) ) ) ) )).

fof(range_axiom_18,axiom,(
    ! [B] :
      ( range_33_0(B)
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
        | bitIndex33 = B ) ) )).

fof(addAssignment_973,axiom,(
    ! [VarCurr] :
      ( v2503(VarCurr,bitIndex0)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_972,axiom,(
    ! [VarCurr] :
      ( v2503(VarCurr,bitIndex1)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_971,axiom,(
    ! [VarCurr] :
      ( v2503(VarCurr,bitIndex2)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_970,axiom,(
    ! [VarCurr] :
      ( v2503(VarCurr,bitIndex3)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_969,axiom,(
    ! [VarCurr] :
      ( v2503(VarCurr,bitIndex4)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_968,axiom,(
    ! [VarCurr] :
      ( v2503(VarCurr,bitIndex5)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_967,axiom,(
    ! [VarCurr] :
      ( v2503(VarCurr,bitIndex6)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_966,axiom,(
    ! [VarCurr] :
      ( v2503(VarCurr,bitIndex7)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_965,axiom,(
    ! [VarCurr] :
      ( v2503(VarCurr,bitIndex8)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_964,axiom,(
    ! [VarCurr] :
      ( v2503(VarCurr,bitIndex9)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_963,axiom,(
    ! [VarCurr] :
      ( v2503(VarCurr,bitIndex10)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_962,axiom,(
    ! [VarCurr] :
      ( v2503(VarCurr,bitIndex11)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_961,axiom,(
    ! [VarCurr] :
      ( v2503(VarCurr,bitIndex12)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_960,axiom,(
    ! [VarCurr] :
      ( v2503(VarCurr,bitIndex13)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_959,axiom,(
    ! [VarCurr] :
      ( v2503(VarCurr,bitIndex14)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_958,axiom,(
    ! [VarCurr] :
      ( v2503(VarCurr,bitIndex15)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_957,axiom,(
    ! [VarCurr] :
      ( v2503(VarCurr,bitIndex16)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_956,axiom,(
    ! [VarCurr] :
      ( v2503(VarCurr,bitIndex17)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_955,axiom,(
    ! [VarCurr] :
      ( v2503(VarCurr,bitIndex18)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_954,axiom,(
    ! [VarCurr] :
      ( v2503(VarCurr,bitIndex19)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_953,axiom,(
    ! [VarCurr] :
      ( v2503(VarCurr,bitIndex20)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_952,axiom,(
    ! [VarCurr] :
      ( v2503(VarCurr,bitIndex21)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_951,axiom,(
    ! [VarCurr] :
      ( v2503(VarCurr,bitIndex22)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_950,axiom,(
    ! [VarCurr] :
      ( v2503(VarCurr,bitIndex23)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_949,axiom,(
    ! [VarCurr] :
      ( v2503(VarCurr,bitIndex24)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_948,axiom,(
    ! [VarCurr] :
      ( v2503(VarCurr,bitIndex25)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_947,axiom,(
    ! [VarCurr] :
      ( v2503(VarCurr,bitIndex26)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_946,axiom,(
    ! [VarCurr] :
      ( v2503(VarCurr,bitIndex27)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_945,axiom,(
    ! [VarCurr] :
      ( v2503(VarCurr,bitIndex28)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_944,axiom,(
    ! [VarCurr] :
      ( v2503(VarCurr,bitIndex29)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_943,axiom,(
    ! [VarCurr] :
      ( v2503(VarCurr,bitIndex30)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_942,axiom,(
    ! [VarCurr] :
      ( v2503(VarCurr,bitIndex31)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_941,axiom,(
    ! [VarCurr] :
      ( v2503(VarCurr,bitIndex32)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_940,axiom,(
    ! [VarCurr] :
      ( v2503(VarCurr,bitIndex33)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_939,axiom,(
    ! [VarCurr] :
      ( ( v2502(VarCurr,bitIndex32)
      <=> v2465(VarCurr,bitIndex39) )
      & ( v2502(VarCurr,bitIndex31)
      <=> v2465(VarCurr,bitIndex38) )
      & ( v2502(VarCurr,bitIndex30)
      <=> v2465(VarCurr,bitIndex37) )
      & ( v2502(VarCurr,bitIndex29)
      <=> v2465(VarCurr,bitIndex36) )
      & ( v2502(VarCurr,bitIndex28)
      <=> v2465(VarCurr,bitIndex35) )
      & ( v2502(VarCurr,bitIndex27)
      <=> v2465(VarCurr,bitIndex34) )
      & ( v2502(VarCurr,bitIndex26)
      <=> v2465(VarCurr,bitIndex33) )
      & ( v2502(VarCurr,bitIndex25)
      <=> v2465(VarCurr,bitIndex32) )
      & ( v2502(VarCurr,bitIndex24)
      <=> v2465(VarCurr,bitIndex31) )
      & ( v2502(VarCurr,bitIndex23)
      <=> v2465(VarCurr,bitIndex30) )
      & ( v2502(VarCurr,bitIndex22)
      <=> v2465(VarCurr,bitIndex29) )
      & ( v2502(VarCurr,bitIndex21)
      <=> v2465(VarCurr,bitIndex28) )
      & ( v2502(VarCurr,bitIndex20)
      <=> v2465(VarCurr,bitIndex27) )
      & ( v2502(VarCurr,bitIndex19)
      <=> v2465(VarCurr,bitIndex26) )
      & ( v2502(VarCurr,bitIndex18)
      <=> v2465(VarCurr,bitIndex25) )
      & ( v2502(VarCurr,bitIndex17)
      <=> v2465(VarCurr,bitIndex24) )
      & ( v2502(VarCurr,bitIndex16)
      <=> v2465(VarCurr,bitIndex23) )
      & ( v2502(VarCurr,bitIndex15)
      <=> v2465(VarCurr,bitIndex22) )
      & ( v2502(VarCurr,bitIndex14)
      <=> v2465(VarCurr,bitIndex21) )
      & ( v2502(VarCurr,bitIndex13)
      <=> v2465(VarCurr,bitIndex20) )
      & ( v2502(VarCurr,bitIndex12)
      <=> v2465(VarCurr,bitIndex19) )
      & ( v2502(VarCurr,bitIndex11)
      <=> v2465(VarCurr,bitIndex18) )
      & ( v2502(VarCurr,bitIndex10)
      <=> v2465(VarCurr,bitIndex17) )
      & ( v2502(VarCurr,bitIndex9)
      <=> v2465(VarCurr,bitIndex16) )
      & ( v2502(VarCurr,bitIndex8)
      <=> v2465(VarCurr,bitIndex15) )
      & ( v2502(VarCurr,bitIndex7)
      <=> v2465(VarCurr,bitIndex14) )
      & ( v2502(VarCurr,bitIndex6)
      <=> v2465(VarCurr,bitIndex13) )
      & ( v2502(VarCurr,bitIndex5)
      <=> v2465(VarCurr,bitIndex12) )
      & ( v2502(VarCurr,bitIndex4)
      <=> v2465(VarCurr,bitIndex11) )
      & ( v2502(VarCurr,bitIndex3)
      <=> v2465(VarCurr,bitIndex10) )
      & ( v2502(VarCurr,bitIndex2)
      <=> v2465(VarCurr,bitIndex9) )
      & ( v2502(VarCurr,bitIndex1)
      <=> v2465(VarCurr,bitIndex8) )
      & ( v2502(VarCurr,bitIndex0)
      <=> v2465(VarCurr,bitIndex7) ) ) )).

fof(addAssignment_938,axiom,(
    ! [VarCurr] :
      ( v2502(VarCurr,bitIndex33)
    <=> $false ) )).

fof(writeBinaryOperatorShiftedRanges_214,axiom,(
    ! [VarCurr] :
      ( v2499(VarCurr,bitIndex0)
    <=> ( v2465(VarCurr,bitIndex6)
        & v2500(VarCurr,bitIndex0) ) ) )).

fof(writeBinaryOperatorShiftedRanges_213,axiom,(
    ! [VarCurr] :
      ( v2499(VarCurr,bitIndex1)
    <=> ( v2465(VarCurr,bitIndex7)
        & v2500(VarCurr,bitIndex1) ) ) )).

fof(writeBinaryOperatorShiftedRanges_212,axiom,(
    ! [VarCurr] :
      ( v2499(VarCurr,bitIndex2)
    <=> ( v2465(VarCurr,bitIndex8)
        & v2500(VarCurr,bitIndex2) ) ) )).

fof(writeBinaryOperatorShiftedRanges_211,axiom,(
    ! [VarCurr] :
      ( v2499(VarCurr,bitIndex3)
    <=> ( v2465(VarCurr,bitIndex9)
        & v2500(VarCurr,bitIndex3) ) ) )).

fof(writeBinaryOperatorShiftedRanges_210,axiom,(
    ! [VarCurr] :
      ( v2499(VarCurr,bitIndex4)
    <=> ( v2465(VarCurr,bitIndex10)
        & v2500(VarCurr,bitIndex4) ) ) )).

fof(writeBinaryOperatorShiftedRanges_209,axiom,(
    ! [VarCurr] :
      ( v2499(VarCurr,bitIndex5)
    <=> ( v2465(VarCurr,bitIndex11)
        & v2500(VarCurr,bitIndex5) ) ) )).

fof(writeBinaryOperatorShiftedRanges_208,axiom,(
    ! [VarCurr] :
      ( v2499(VarCurr,bitIndex6)
    <=> ( v2465(VarCurr,bitIndex12)
        & v2500(VarCurr,bitIndex6) ) ) )).

fof(writeBinaryOperatorShiftedRanges_207,axiom,(
    ! [VarCurr] :
      ( v2499(VarCurr,bitIndex7)
    <=> ( v2465(VarCurr,bitIndex13)
        & v2500(VarCurr,bitIndex7) ) ) )).

fof(writeBinaryOperatorShiftedRanges_206,axiom,(
    ! [VarCurr] :
      ( v2499(VarCurr,bitIndex8)
    <=> ( v2465(VarCurr,bitIndex14)
        & v2500(VarCurr,bitIndex8) ) ) )).

fof(writeBinaryOperatorShiftedRanges_205,axiom,(
    ! [VarCurr] :
      ( v2499(VarCurr,bitIndex9)
    <=> ( v2465(VarCurr,bitIndex15)
        & v2500(VarCurr,bitIndex9) ) ) )).

fof(writeBinaryOperatorShiftedRanges_204,axiom,(
    ! [VarCurr] :
      ( v2499(VarCurr,bitIndex10)
    <=> ( v2465(VarCurr,bitIndex16)
        & v2500(VarCurr,bitIndex10) ) ) )).

fof(writeBinaryOperatorShiftedRanges_203,axiom,(
    ! [VarCurr] :
      ( v2499(VarCurr,bitIndex11)
    <=> ( v2465(VarCurr,bitIndex17)
        & v2500(VarCurr,bitIndex11) ) ) )).

fof(writeBinaryOperatorShiftedRanges_202,axiom,(
    ! [VarCurr] :
      ( v2499(VarCurr,bitIndex12)
    <=> ( v2465(VarCurr,bitIndex18)
        & v2500(VarCurr,bitIndex12) ) ) )).

fof(writeBinaryOperatorShiftedRanges_201,axiom,(
    ! [VarCurr] :
      ( v2499(VarCurr,bitIndex13)
    <=> ( v2465(VarCurr,bitIndex19)
        & v2500(VarCurr,bitIndex13) ) ) )).

fof(writeBinaryOperatorShiftedRanges_200,axiom,(
    ! [VarCurr] :
      ( v2499(VarCurr,bitIndex14)
    <=> ( v2465(VarCurr,bitIndex20)
        & v2500(VarCurr,bitIndex14) ) ) )).

fof(writeBinaryOperatorShiftedRanges_199,axiom,(
    ! [VarCurr] :
      ( v2499(VarCurr,bitIndex15)
    <=> ( v2465(VarCurr,bitIndex21)
        & v2500(VarCurr,bitIndex15) ) ) )).

fof(writeBinaryOperatorShiftedRanges_198,axiom,(
    ! [VarCurr] :
      ( v2499(VarCurr,bitIndex16)
    <=> ( v2465(VarCurr,bitIndex22)
        & v2500(VarCurr,bitIndex16) ) ) )).

fof(writeBinaryOperatorShiftedRanges_197,axiom,(
    ! [VarCurr] :
      ( v2499(VarCurr,bitIndex17)
    <=> ( v2465(VarCurr,bitIndex23)
        & v2500(VarCurr,bitIndex17) ) ) )).

fof(writeBinaryOperatorShiftedRanges_196,axiom,(
    ! [VarCurr] :
      ( v2499(VarCurr,bitIndex18)
    <=> ( v2465(VarCurr,bitIndex24)
        & v2500(VarCurr,bitIndex18) ) ) )).

fof(writeBinaryOperatorShiftedRanges_195,axiom,(
    ! [VarCurr] :
      ( v2499(VarCurr,bitIndex19)
    <=> ( v2465(VarCurr,bitIndex25)
        & v2500(VarCurr,bitIndex19) ) ) )).

fof(writeBinaryOperatorShiftedRanges_194,axiom,(
    ! [VarCurr] :
      ( v2499(VarCurr,bitIndex20)
    <=> ( v2465(VarCurr,bitIndex26)
        & v2500(VarCurr,bitIndex20) ) ) )).

fof(writeBinaryOperatorShiftedRanges_193,axiom,(
    ! [VarCurr] :
      ( v2499(VarCurr,bitIndex21)
    <=> ( v2465(VarCurr,bitIndex27)
        & v2500(VarCurr,bitIndex21) ) ) )).

fof(writeBinaryOperatorShiftedRanges_192,axiom,(
    ! [VarCurr] :
      ( v2499(VarCurr,bitIndex22)
    <=> ( v2465(VarCurr,bitIndex28)
        & v2500(VarCurr,bitIndex22) ) ) )).

fof(writeBinaryOperatorShiftedRanges_191,axiom,(
    ! [VarCurr] :
      ( v2499(VarCurr,bitIndex23)
    <=> ( v2465(VarCurr,bitIndex29)
        & v2500(VarCurr,bitIndex23) ) ) )).

fof(writeBinaryOperatorShiftedRanges_190,axiom,(
    ! [VarCurr] :
      ( v2499(VarCurr,bitIndex24)
    <=> ( v2465(VarCurr,bitIndex30)
        & v2500(VarCurr,bitIndex24) ) ) )).

fof(writeBinaryOperatorShiftedRanges_189,axiom,(
    ! [VarCurr] :
      ( v2499(VarCurr,bitIndex25)
    <=> ( v2465(VarCurr,bitIndex31)
        & v2500(VarCurr,bitIndex25) ) ) )).

fof(writeBinaryOperatorShiftedRanges_188,axiom,(
    ! [VarCurr] :
      ( v2499(VarCurr,bitIndex26)
    <=> ( v2465(VarCurr,bitIndex32)
        & v2500(VarCurr,bitIndex26) ) ) )).

fof(writeBinaryOperatorShiftedRanges_187,axiom,(
    ! [VarCurr] :
      ( v2499(VarCurr,bitIndex27)
    <=> ( v2465(VarCurr,bitIndex33)
        & v2500(VarCurr,bitIndex27) ) ) )).

fof(writeBinaryOperatorShiftedRanges_186,axiom,(
    ! [VarCurr] :
      ( v2499(VarCurr,bitIndex28)
    <=> ( v2465(VarCurr,bitIndex34)
        & v2500(VarCurr,bitIndex28) ) ) )).

fof(writeBinaryOperatorShiftedRanges_185,axiom,(
    ! [VarCurr] :
      ( v2499(VarCurr,bitIndex29)
    <=> ( v2465(VarCurr,bitIndex35)
        & v2500(VarCurr,bitIndex29) ) ) )).

fof(writeBinaryOperatorShiftedRanges_184,axiom,(
    ! [VarCurr] :
      ( v2499(VarCurr,bitIndex30)
    <=> ( v2465(VarCurr,bitIndex36)
        & v2500(VarCurr,bitIndex30) ) ) )).

fof(writeBinaryOperatorShiftedRanges_183,axiom,(
    ! [VarCurr] :
      ( v2499(VarCurr,bitIndex31)
    <=> ( v2465(VarCurr,bitIndex37)
        & v2500(VarCurr,bitIndex31) ) ) )).

fof(writeBinaryOperatorShiftedRanges_182,axiom,(
    ! [VarCurr] :
      ( v2499(VarCurr,bitIndex32)
    <=> ( v2465(VarCurr,bitIndex38)
        & v2500(VarCurr,bitIndex32) ) ) )).

fof(writeBinaryOperatorShiftedRanges_181,axiom,(
    ! [VarCurr] :
      ( v2499(VarCurr,bitIndex33)
    <=> ( v2465(VarCurr,bitIndex39)
        & v2500(VarCurr,bitIndex33) ) ) )).

fof(addAssignment_937,axiom,(
    ! [VarCurr] :
      ( v2500(VarCurr,bitIndex0)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_936,axiom,(
    ! [VarCurr] :
      ( v2500(VarCurr,bitIndex1)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_935,axiom,(
    ! [VarCurr] :
      ( v2500(VarCurr,bitIndex2)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_934,axiom,(
    ! [VarCurr] :
      ( v2500(VarCurr,bitIndex3)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_933,axiom,(
    ! [VarCurr] :
      ( v2500(VarCurr,bitIndex4)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_932,axiom,(
    ! [VarCurr] :
      ( v2500(VarCurr,bitIndex5)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_931,axiom,(
    ! [VarCurr] :
      ( v2500(VarCurr,bitIndex6)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_930,axiom,(
    ! [VarCurr] :
      ( v2500(VarCurr,bitIndex7)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_929,axiom,(
    ! [VarCurr] :
      ( v2500(VarCurr,bitIndex8)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_928,axiom,(
    ! [VarCurr] :
      ( v2500(VarCurr,bitIndex9)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_927,axiom,(
    ! [VarCurr] :
      ( v2500(VarCurr,bitIndex10)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_926,axiom,(
    ! [VarCurr] :
      ( v2500(VarCurr,bitIndex11)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_925,axiom,(
    ! [VarCurr] :
      ( v2500(VarCurr,bitIndex12)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_924,axiom,(
    ! [VarCurr] :
      ( v2500(VarCurr,bitIndex13)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_923,axiom,(
    ! [VarCurr] :
      ( v2500(VarCurr,bitIndex14)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_922,axiom,(
    ! [VarCurr] :
      ( v2500(VarCurr,bitIndex15)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_921,axiom,(
    ! [VarCurr] :
      ( v2500(VarCurr,bitIndex16)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_920,axiom,(
    ! [VarCurr] :
      ( v2500(VarCurr,bitIndex17)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_919,axiom,(
    ! [VarCurr] :
      ( v2500(VarCurr,bitIndex18)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_918,axiom,(
    ! [VarCurr] :
      ( v2500(VarCurr,bitIndex19)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_917,axiom,(
    ! [VarCurr] :
      ( v2500(VarCurr,bitIndex20)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_916,axiom,(
    ! [VarCurr] :
      ( v2500(VarCurr,bitIndex21)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_915,axiom,(
    ! [VarCurr] :
      ( v2500(VarCurr,bitIndex22)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_914,axiom,(
    ! [VarCurr] :
      ( v2500(VarCurr,bitIndex23)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_913,axiom,(
    ! [VarCurr] :
      ( v2500(VarCurr,bitIndex24)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_912,axiom,(
    ! [VarCurr] :
      ( v2500(VarCurr,bitIndex25)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_911,axiom,(
    ! [VarCurr] :
      ( v2500(VarCurr,bitIndex26)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_910,axiom,(
    ! [VarCurr] :
      ( v2500(VarCurr,bitIndex27)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_909,axiom,(
    ! [VarCurr] :
      ( v2500(VarCurr,bitIndex28)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_908,axiom,(
    ! [VarCurr] :
      ( v2500(VarCurr,bitIndex29)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_907,axiom,(
    ! [VarCurr] :
      ( v2500(VarCurr,bitIndex30)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_906,axiom,(
    ! [VarCurr] :
      ( v2500(VarCurr,bitIndex31)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_905,axiom,(
    ! [VarCurr] :
      ( v2500(VarCurr,bitIndex32)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_904,axiom,(
    ! [VarCurr] :
      ( v2500(VarCurr,bitIndex33)
    <=> v2468(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesMultipleBits_18,axiom,(
    ! [VarCurr,B] :
      ( range_35_0(B)
     => ( v2488(VarCurr,B)
      <=> ( v2489(VarCurr,B)
          & v2495(VarCurr,B) ) ) ) )).

fof(addAssignment_903,axiom,(
    ! [VarCurr] :
      ( v2495(VarCurr,bitIndex0)
    <=> v2473(VarCurr) ) )).

fof(addAssignment_902,axiom,(
    ! [VarCurr] :
      ( v2495(VarCurr,bitIndex1)
    <=> v2473(VarCurr) ) )).

fof(addAssignment_901,axiom,(
    ! [VarCurr] :
      ( v2495(VarCurr,bitIndex2)
    <=> v2473(VarCurr) ) )).

fof(addAssignment_900,axiom,(
    ! [VarCurr] :
      ( v2495(VarCurr,bitIndex3)
    <=> v2473(VarCurr) ) )).

fof(addAssignment_899,axiom,(
    ! [VarCurr] :
      ( v2495(VarCurr,bitIndex4)
    <=> v2473(VarCurr) ) )).

fof(addAssignment_898,axiom,(
    ! [VarCurr] :
      ( v2495(VarCurr,bitIndex5)
    <=> v2473(VarCurr) ) )).

fof(addAssignment_897,axiom,(
    ! [VarCurr] :
      ( v2495(VarCurr,bitIndex6)
    <=> v2473(VarCurr) ) )).

fof(addAssignment_896,axiom,(
    ! [VarCurr] :
      ( v2495(VarCurr,bitIndex7)
    <=> v2473(VarCurr) ) )).

fof(addAssignment_895,axiom,(
    ! [VarCurr] :
      ( v2495(VarCurr,bitIndex8)
    <=> v2473(VarCurr) ) )).

fof(addAssignment_894,axiom,(
    ! [VarCurr] :
      ( v2495(VarCurr,bitIndex9)
    <=> v2473(VarCurr) ) )).

fof(addAssignment_893,axiom,(
    ! [VarCurr] :
      ( v2495(VarCurr,bitIndex10)
    <=> v2473(VarCurr) ) )).

fof(addAssignment_892,axiom,(
    ! [VarCurr] :
      ( v2495(VarCurr,bitIndex11)
    <=> v2473(VarCurr) ) )).

fof(addAssignment_891,axiom,(
    ! [VarCurr] :
      ( v2495(VarCurr,bitIndex12)
    <=> v2473(VarCurr) ) )).

fof(addAssignment_890,axiom,(
    ! [VarCurr] :
      ( v2495(VarCurr,bitIndex13)
    <=> v2473(VarCurr) ) )).

fof(addAssignment_889,axiom,(
    ! [VarCurr] :
      ( v2495(VarCurr,bitIndex14)
    <=> v2473(VarCurr) ) )).

fof(addAssignment_888,axiom,(
    ! [VarCurr] :
      ( v2495(VarCurr,bitIndex15)
    <=> v2473(VarCurr) ) )).

fof(addAssignment_887,axiom,(
    ! [VarCurr] :
      ( v2495(VarCurr,bitIndex16)
    <=> v2473(VarCurr) ) )).

fof(addAssignment_886,axiom,(
    ! [VarCurr] :
      ( v2495(VarCurr,bitIndex17)
    <=> v2473(VarCurr) ) )).

fof(addAssignment_885,axiom,(
    ! [VarCurr] :
      ( v2495(VarCurr,bitIndex18)
    <=> v2473(VarCurr) ) )).

fof(addAssignment_884,axiom,(
    ! [VarCurr] :
      ( v2495(VarCurr,bitIndex19)
    <=> v2473(VarCurr) ) )).

fof(addAssignment_883,axiom,(
    ! [VarCurr] :
      ( v2495(VarCurr,bitIndex20)
    <=> v2473(VarCurr) ) )).

fof(addAssignment_882,axiom,(
    ! [VarCurr] :
      ( v2495(VarCurr,bitIndex21)
    <=> v2473(VarCurr) ) )).

fof(addAssignment_881,axiom,(
    ! [VarCurr] :
      ( v2495(VarCurr,bitIndex22)
    <=> v2473(VarCurr) ) )).

fof(addAssignment_880,axiom,(
    ! [VarCurr] :
      ( v2495(VarCurr,bitIndex23)
    <=> v2473(VarCurr) ) )).

fof(addAssignment_879,axiom,(
    ! [VarCurr] :
      ( v2495(VarCurr,bitIndex24)
    <=> v2473(VarCurr) ) )).

fof(addAssignment_878,axiom,(
    ! [VarCurr] :
      ( v2495(VarCurr,bitIndex25)
    <=> v2473(VarCurr) ) )).

fof(addAssignment_877,axiom,(
    ! [VarCurr] :
      ( v2495(VarCurr,bitIndex26)
    <=> v2473(VarCurr) ) )).

fof(addAssignment_876,axiom,(
    ! [VarCurr] :
      ( v2495(VarCurr,bitIndex27)
    <=> v2473(VarCurr) ) )).

fof(addAssignment_875,axiom,(
    ! [VarCurr] :
      ( v2495(VarCurr,bitIndex28)
    <=> v2473(VarCurr) ) )).

fof(addAssignment_874,axiom,(
    ! [VarCurr] :
      ( v2495(VarCurr,bitIndex29)
    <=> v2473(VarCurr) ) )).

fof(addAssignment_873,axiom,(
    ! [VarCurr] :
      ( v2495(VarCurr,bitIndex30)
    <=> v2473(VarCurr) ) )).

fof(addAssignment_872,axiom,(
    ! [VarCurr] :
      ( v2495(VarCurr,bitIndex31)
    <=> v2473(VarCurr) ) )).

fof(addAssignment_871,axiom,(
    ! [VarCurr] :
      ( v2495(VarCurr,bitIndex32)
    <=> v2473(VarCurr) ) )).

fof(addAssignment_870,axiom,(
    ! [VarCurr] :
      ( v2495(VarCurr,bitIndex33)
    <=> v2473(VarCurr) ) )).

fof(addAssignment_869,axiom,(
    ! [VarCurr] :
      ( v2495(VarCurr,bitIndex34)
    <=> v2473(VarCurr) ) )).

fof(addAssignment_868,axiom,(
    ! [VarCurr] :
      ( v2495(VarCurr,bitIndex35)
    <=> v2473(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesMultipleBits_17,axiom,(
    ! [VarCurr,B] :
      ( range_35_0(B)
     => ( v2489(VarCurr,B)
      <=> ( v2490(VarCurr,B)
          | v2492(VarCurr,B) ) ) ) )).

fof(writeBinaryOperatorEqualRangesMultipleBits_16,axiom,(
    ! [VarCurr,B] :
      ( range_35_0(B)
     => ( v2492(VarCurr,B)
      <=> ( v2493(VarCurr,B)
          & v2494(VarCurr,B) ) ) ) )).

fof(addAssignment_867,axiom,(
    ! [VarCurr] :
      ( v2494(VarCurr,bitIndex0)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_866,axiom,(
    ! [VarCurr] :
      ( v2494(VarCurr,bitIndex1)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_865,axiom,(
    ! [VarCurr] :
      ( v2494(VarCurr,bitIndex2)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_864,axiom,(
    ! [VarCurr] :
      ( v2494(VarCurr,bitIndex3)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_863,axiom,(
    ! [VarCurr] :
      ( v2494(VarCurr,bitIndex4)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_862,axiom,(
    ! [VarCurr] :
      ( v2494(VarCurr,bitIndex5)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_861,axiom,(
    ! [VarCurr] :
      ( v2494(VarCurr,bitIndex6)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_860,axiom,(
    ! [VarCurr] :
      ( v2494(VarCurr,bitIndex7)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_859,axiom,(
    ! [VarCurr] :
      ( v2494(VarCurr,bitIndex8)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_858,axiom,(
    ! [VarCurr] :
      ( v2494(VarCurr,bitIndex9)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_857,axiom,(
    ! [VarCurr] :
      ( v2494(VarCurr,bitIndex10)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_856,axiom,(
    ! [VarCurr] :
      ( v2494(VarCurr,bitIndex11)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_855,axiom,(
    ! [VarCurr] :
      ( v2494(VarCurr,bitIndex12)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_854,axiom,(
    ! [VarCurr] :
      ( v2494(VarCurr,bitIndex13)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_853,axiom,(
    ! [VarCurr] :
      ( v2494(VarCurr,bitIndex14)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_852,axiom,(
    ! [VarCurr] :
      ( v2494(VarCurr,bitIndex15)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_851,axiom,(
    ! [VarCurr] :
      ( v2494(VarCurr,bitIndex16)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_850,axiom,(
    ! [VarCurr] :
      ( v2494(VarCurr,bitIndex17)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_849,axiom,(
    ! [VarCurr] :
      ( v2494(VarCurr,bitIndex18)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_848,axiom,(
    ! [VarCurr] :
      ( v2494(VarCurr,bitIndex19)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_847,axiom,(
    ! [VarCurr] :
      ( v2494(VarCurr,bitIndex20)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_846,axiom,(
    ! [VarCurr] :
      ( v2494(VarCurr,bitIndex21)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_845,axiom,(
    ! [VarCurr] :
      ( v2494(VarCurr,bitIndex22)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_844,axiom,(
    ! [VarCurr] :
      ( v2494(VarCurr,bitIndex23)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_843,axiom,(
    ! [VarCurr] :
      ( v2494(VarCurr,bitIndex24)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_842,axiom,(
    ! [VarCurr] :
      ( v2494(VarCurr,bitIndex25)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_841,axiom,(
    ! [VarCurr] :
      ( v2494(VarCurr,bitIndex26)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_840,axiom,(
    ! [VarCurr] :
      ( v2494(VarCurr,bitIndex27)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_839,axiom,(
    ! [VarCurr] :
      ( v2494(VarCurr,bitIndex28)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_838,axiom,(
    ! [VarCurr] :
      ( v2494(VarCurr,bitIndex29)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_837,axiom,(
    ! [VarCurr] :
      ( v2494(VarCurr,bitIndex30)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_836,axiom,(
    ! [VarCurr] :
      ( v2494(VarCurr,bitIndex31)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_835,axiom,(
    ! [VarCurr] :
      ( v2494(VarCurr,bitIndex32)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_834,axiom,(
    ! [VarCurr] :
      ( v2494(VarCurr,bitIndex33)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_833,axiom,(
    ! [VarCurr] :
      ( v2494(VarCurr,bitIndex34)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_832,axiom,(
    ! [VarCurr] :
      ( v2494(VarCurr,bitIndex35)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_831,axiom,(
    ! [VarCurr] :
      ( ( v2493(VarCurr,bitIndex34)
      <=> v2465(VarCurr,bitIndex39) )
      & ( v2493(VarCurr,bitIndex33)
      <=> v2465(VarCurr,bitIndex38) )
      & ( v2493(VarCurr,bitIndex32)
      <=> v2465(VarCurr,bitIndex37) )
      & ( v2493(VarCurr,bitIndex31)
      <=> v2465(VarCurr,bitIndex36) )
      & ( v2493(VarCurr,bitIndex30)
      <=> v2465(VarCurr,bitIndex35) )
      & ( v2493(VarCurr,bitIndex29)
      <=> v2465(VarCurr,bitIndex34) )
      & ( v2493(VarCurr,bitIndex28)
      <=> v2465(VarCurr,bitIndex33) )
      & ( v2493(VarCurr,bitIndex27)
      <=> v2465(VarCurr,bitIndex32) )
      & ( v2493(VarCurr,bitIndex26)
      <=> v2465(VarCurr,bitIndex31) )
      & ( v2493(VarCurr,bitIndex25)
      <=> v2465(VarCurr,bitIndex30) )
      & ( v2493(VarCurr,bitIndex24)
      <=> v2465(VarCurr,bitIndex29) )
      & ( v2493(VarCurr,bitIndex23)
      <=> v2465(VarCurr,bitIndex28) )
      & ( v2493(VarCurr,bitIndex22)
      <=> v2465(VarCurr,bitIndex27) )
      & ( v2493(VarCurr,bitIndex21)
      <=> v2465(VarCurr,bitIndex26) )
      & ( v2493(VarCurr,bitIndex20)
      <=> v2465(VarCurr,bitIndex25) )
      & ( v2493(VarCurr,bitIndex19)
      <=> v2465(VarCurr,bitIndex24) )
      & ( v2493(VarCurr,bitIndex18)
      <=> v2465(VarCurr,bitIndex23) )
      & ( v2493(VarCurr,bitIndex17)
      <=> v2465(VarCurr,bitIndex22) )
      & ( v2493(VarCurr,bitIndex16)
      <=> v2465(VarCurr,bitIndex21) )
      & ( v2493(VarCurr,bitIndex15)
      <=> v2465(VarCurr,bitIndex20) )
      & ( v2493(VarCurr,bitIndex14)
      <=> v2465(VarCurr,bitIndex19) )
      & ( v2493(VarCurr,bitIndex13)
      <=> v2465(VarCurr,bitIndex18) )
      & ( v2493(VarCurr,bitIndex12)
      <=> v2465(VarCurr,bitIndex17) )
      & ( v2493(VarCurr,bitIndex11)
      <=> v2465(VarCurr,bitIndex16) )
      & ( v2493(VarCurr,bitIndex10)
      <=> v2465(VarCurr,bitIndex15) )
      & ( v2493(VarCurr,bitIndex9)
      <=> v2465(VarCurr,bitIndex14) )
      & ( v2493(VarCurr,bitIndex8)
      <=> v2465(VarCurr,bitIndex13) )
      & ( v2493(VarCurr,bitIndex7)
      <=> v2465(VarCurr,bitIndex12) )
      & ( v2493(VarCurr,bitIndex6)
      <=> v2465(VarCurr,bitIndex11) )
      & ( v2493(VarCurr,bitIndex5)
      <=> v2465(VarCurr,bitIndex10) )
      & ( v2493(VarCurr,bitIndex4)
      <=> v2465(VarCurr,bitIndex9) )
      & ( v2493(VarCurr,bitIndex3)
      <=> v2465(VarCurr,bitIndex8) )
      & ( v2493(VarCurr,bitIndex2)
      <=> v2465(VarCurr,bitIndex7) )
      & ( v2493(VarCurr,bitIndex1)
      <=> v2465(VarCurr,bitIndex6) )
      & ( v2493(VarCurr,bitIndex0)
      <=> v2465(VarCurr,bitIndex5) ) ) )).

fof(addAssignment_830,axiom,(
    ! [VarCurr] :
      ( v2493(VarCurr,bitIndex35)
    <=> $false ) )).

fof(writeBinaryOperatorShiftedRanges_180,axiom,(
    ! [VarCurr] :
      ( v2490(VarCurr,bitIndex0)
    <=> ( v2465(VarCurr,bitIndex4)
        & v2491(VarCurr,bitIndex0) ) ) )).

fof(writeBinaryOperatorShiftedRanges_179,axiom,(
    ! [VarCurr] :
      ( v2490(VarCurr,bitIndex1)
    <=> ( v2465(VarCurr,bitIndex5)
        & v2491(VarCurr,bitIndex1) ) ) )).

fof(writeBinaryOperatorShiftedRanges_178,axiom,(
    ! [VarCurr] :
      ( v2490(VarCurr,bitIndex2)
    <=> ( v2465(VarCurr,bitIndex6)
        & v2491(VarCurr,bitIndex2) ) ) )).

fof(writeBinaryOperatorShiftedRanges_177,axiom,(
    ! [VarCurr] :
      ( v2490(VarCurr,bitIndex3)
    <=> ( v2465(VarCurr,bitIndex7)
        & v2491(VarCurr,bitIndex3) ) ) )).

fof(writeBinaryOperatorShiftedRanges_176,axiom,(
    ! [VarCurr] :
      ( v2490(VarCurr,bitIndex4)
    <=> ( v2465(VarCurr,bitIndex8)
        & v2491(VarCurr,bitIndex4) ) ) )).

fof(writeBinaryOperatorShiftedRanges_175,axiom,(
    ! [VarCurr] :
      ( v2490(VarCurr,bitIndex5)
    <=> ( v2465(VarCurr,bitIndex9)
        & v2491(VarCurr,bitIndex5) ) ) )).

fof(writeBinaryOperatorShiftedRanges_174,axiom,(
    ! [VarCurr] :
      ( v2490(VarCurr,bitIndex6)
    <=> ( v2465(VarCurr,bitIndex10)
        & v2491(VarCurr,bitIndex6) ) ) )).

fof(writeBinaryOperatorShiftedRanges_173,axiom,(
    ! [VarCurr] :
      ( v2490(VarCurr,bitIndex7)
    <=> ( v2465(VarCurr,bitIndex11)
        & v2491(VarCurr,bitIndex7) ) ) )).

fof(writeBinaryOperatorShiftedRanges_172,axiom,(
    ! [VarCurr] :
      ( v2490(VarCurr,bitIndex8)
    <=> ( v2465(VarCurr,bitIndex12)
        & v2491(VarCurr,bitIndex8) ) ) )).

fof(writeBinaryOperatorShiftedRanges_171,axiom,(
    ! [VarCurr] :
      ( v2490(VarCurr,bitIndex9)
    <=> ( v2465(VarCurr,bitIndex13)
        & v2491(VarCurr,bitIndex9) ) ) )).

fof(writeBinaryOperatorShiftedRanges_170,axiom,(
    ! [VarCurr] :
      ( v2490(VarCurr,bitIndex10)
    <=> ( v2465(VarCurr,bitIndex14)
        & v2491(VarCurr,bitIndex10) ) ) )).

fof(writeBinaryOperatorShiftedRanges_169,axiom,(
    ! [VarCurr] :
      ( v2490(VarCurr,bitIndex11)
    <=> ( v2465(VarCurr,bitIndex15)
        & v2491(VarCurr,bitIndex11) ) ) )).

fof(writeBinaryOperatorShiftedRanges_168,axiom,(
    ! [VarCurr] :
      ( v2490(VarCurr,bitIndex12)
    <=> ( v2465(VarCurr,bitIndex16)
        & v2491(VarCurr,bitIndex12) ) ) )).

fof(writeBinaryOperatorShiftedRanges_167,axiom,(
    ! [VarCurr] :
      ( v2490(VarCurr,bitIndex13)
    <=> ( v2465(VarCurr,bitIndex17)
        & v2491(VarCurr,bitIndex13) ) ) )).

fof(writeBinaryOperatorShiftedRanges_166,axiom,(
    ! [VarCurr] :
      ( v2490(VarCurr,bitIndex14)
    <=> ( v2465(VarCurr,bitIndex18)
        & v2491(VarCurr,bitIndex14) ) ) )).

fof(writeBinaryOperatorShiftedRanges_165,axiom,(
    ! [VarCurr] :
      ( v2490(VarCurr,bitIndex15)
    <=> ( v2465(VarCurr,bitIndex19)
        & v2491(VarCurr,bitIndex15) ) ) )).

fof(writeBinaryOperatorShiftedRanges_164,axiom,(
    ! [VarCurr] :
      ( v2490(VarCurr,bitIndex16)
    <=> ( v2465(VarCurr,bitIndex20)
        & v2491(VarCurr,bitIndex16) ) ) )).

fof(writeBinaryOperatorShiftedRanges_163,axiom,(
    ! [VarCurr] :
      ( v2490(VarCurr,bitIndex17)
    <=> ( v2465(VarCurr,bitIndex21)
        & v2491(VarCurr,bitIndex17) ) ) )).

fof(writeBinaryOperatorShiftedRanges_162,axiom,(
    ! [VarCurr] :
      ( v2490(VarCurr,bitIndex18)
    <=> ( v2465(VarCurr,bitIndex22)
        & v2491(VarCurr,bitIndex18) ) ) )).

fof(writeBinaryOperatorShiftedRanges_161,axiom,(
    ! [VarCurr] :
      ( v2490(VarCurr,bitIndex19)
    <=> ( v2465(VarCurr,bitIndex23)
        & v2491(VarCurr,bitIndex19) ) ) )).

fof(writeBinaryOperatorShiftedRanges_160,axiom,(
    ! [VarCurr] :
      ( v2490(VarCurr,bitIndex20)
    <=> ( v2465(VarCurr,bitIndex24)
        & v2491(VarCurr,bitIndex20) ) ) )).

fof(writeBinaryOperatorShiftedRanges_159,axiom,(
    ! [VarCurr] :
      ( v2490(VarCurr,bitIndex21)
    <=> ( v2465(VarCurr,bitIndex25)
        & v2491(VarCurr,bitIndex21) ) ) )).

fof(writeBinaryOperatorShiftedRanges_158,axiom,(
    ! [VarCurr] :
      ( v2490(VarCurr,bitIndex22)
    <=> ( v2465(VarCurr,bitIndex26)
        & v2491(VarCurr,bitIndex22) ) ) )).

fof(writeBinaryOperatorShiftedRanges_157,axiom,(
    ! [VarCurr] :
      ( v2490(VarCurr,bitIndex23)
    <=> ( v2465(VarCurr,bitIndex27)
        & v2491(VarCurr,bitIndex23) ) ) )).

fof(writeBinaryOperatorShiftedRanges_156,axiom,(
    ! [VarCurr] :
      ( v2490(VarCurr,bitIndex24)
    <=> ( v2465(VarCurr,bitIndex28)
        & v2491(VarCurr,bitIndex24) ) ) )).

fof(writeBinaryOperatorShiftedRanges_155,axiom,(
    ! [VarCurr] :
      ( v2490(VarCurr,bitIndex25)
    <=> ( v2465(VarCurr,bitIndex29)
        & v2491(VarCurr,bitIndex25) ) ) )).

fof(writeBinaryOperatorShiftedRanges_154,axiom,(
    ! [VarCurr] :
      ( v2490(VarCurr,bitIndex26)
    <=> ( v2465(VarCurr,bitIndex30)
        & v2491(VarCurr,bitIndex26) ) ) )).

fof(writeBinaryOperatorShiftedRanges_153,axiom,(
    ! [VarCurr] :
      ( v2490(VarCurr,bitIndex27)
    <=> ( v2465(VarCurr,bitIndex31)
        & v2491(VarCurr,bitIndex27) ) ) )).

fof(writeBinaryOperatorShiftedRanges_152,axiom,(
    ! [VarCurr] :
      ( v2490(VarCurr,bitIndex28)
    <=> ( v2465(VarCurr,bitIndex32)
        & v2491(VarCurr,bitIndex28) ) ) )).

fof(writeBinaryOperatorShiftedRanges_151,axiom,(
    ! [VarCurr] :
      ( v2490(VarCurr,bitIndex29)
    <=> ( v2465(VarCurr,bitIndex33)
        & v2491(VarCurr,bitIndex29) ) ) )).

fof(writeBinaryOperatorShiftedRanges_150,axiom,(
    ! [VarCurr] :
      ( v2490(VarCurr,bitIndex30)
    <=> ( v2465(VarCurr,bitIndex34)
        & v2491(VarCurr,bitIndex30) ) ) )).

fof(writeBinaryOperatorShiftedRanges_149,axiom,(
    ! [VarCurr] :
      ( v2490(VarCurr,bitIndex31)
    <=> ( v2465(VarCurr,bitIndex35)
        & v2491(VarCurr,bitIndex31) ) ) )).

fof(writeBinaryOperatorShiftedRanges_148,axiom,(
    ! [VarCurr] :
      ( v2490(VarCurr,bitIndex32)
    <=> ( v2465(VarCurr,bitIndex36)
        & v2491(VarCurr,bitIndex32) ) ) )).

fof(writeBinaryOperatorShiftedRanges_147,axiom,(
    ! [VarCurr] :
      ( v2490(VarCurr,bitIndex33)
    <=> ( v2465(VarCurr,bitIndex37)
        & v2491(VarCurr,bitIndex33) ) ) )).

fof(writeBinaryOperatorShiftedRanges_146,axiom,(
    ! [VarCurr] :
      ( v2490(VarCurr,bitIndex34)
    <=> ( v2465(VarCurr,bitIndex38)
        & v2491(VarCurr,bitIndex34) ) ) )).

fof(writeBinaryOperatorShiftedRanges_145,axiom,(
    ! [VarCurr] :
      ( v2490(VarCurr,bitIndex35)
    <=> ( v2465(VarCurr,bitIndex39)
        & v2491(VarCurr,bitIndex35) ) ) )).

fof(addAssignment_829,axiom,(
    ! [VarCurr] :
      ( v2491(VarCurr,bitIndex0)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_828,axiom,(
    ! [VarCurr] :
      ( v2491(VarCurr,bitIndex1)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_827,axiom,(
    ! [VarCurr] :
      ( v2491(VarCurr,bitIndex2)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_826,axiom,(
    ! [VarCurr] :
      ( v2491(VarCurr,bitIndex3)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_825,axiom,(
    ! [VarCurr] :
      ( v2491(VarCurr,bitIndex4)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_824,axiom,(
    ! [VarCurr] :
      ( v2491(VarCurr,bitIndex5)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_823,axiom,(
    ! [VarCurr] :
      ( v2491(VarCurr,bitIndex6)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_822,axiom,(
    ! [VarCurr] :
      ( v2491(VarCurr,bitIndex7)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_821,axiom,(
    ! [VarCurr] :
      ( v2491(VarCurr,bitIndex8)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_820,axiom,(
    ! [VarCurr] :
      ( v2491(VarCurr,bitIndex9)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_819,axiom,(
    ! [VarCurr] :
      ( v2491(VarCurr,bitIndex10)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_818,axiom,(
    ! [VarCurr] :
      ( v2491(VarCurr,bitIndex11)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_817,axiom,(
    ! [VarCurr] :
      ( v2491(VarCurr,bitIndex12)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_816,axiom,(
    ! [VarCurr] :
      ( v2491(VarCurr,bitIndex13)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_815,axiom,(
    ! [VarCurr] :
      ( v2491(VarCurr,bitIndex14)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_814,axiom,(
    ! [VarCurr] :
      ( v2491(VarCurr,bitIndex15)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_813,axiom,(
    ! [VarCurr] :
      ( v2491(VarCurr,bitIndex16)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_812,axiom,(
    ! [VarCurr] :
      ( v2491(VarCurr,bitIndex17)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_811,axiom,(
    ! [VarCurr] :
      ( v2491(VarCurr,bitIndex18)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_810,axiom,(
    ! [VarCurr] :
      ( v2491(VarCurr,bitIndex19)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_809,axiom,(
    ! [VarCurr] :
      ( v2491(VarCurr,bitIndex20)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_808,axiom,(
    ! [VarCurr] :
      ( v2491(VarCurr,bitIndex21)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_807,axiom,(
    ! [VarCurr] :
      ( v2491(VarCurr,bitIndex22)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_806,axiom,(
    ! [VarCurr] :
      ( v2491(VarCurr,bitIndex23)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_805,axiom,(
    ! [VarCurr] :
      ( v2491(VarCurr,bitIndex24)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_804,axiom,(
    ! [VarCurr] :
      ( v2491(VarCurr,bitIndex25)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_803,axiom,(
    ! [VarCurr] :
      ( v2491(VarCurr,bitIndex26)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_802,axiom,(
    ! [VarCurr] :
      ( v2491(VarCurr,bitIndex27)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_801,axiom,(
    ! [VarCurr] :
      ( v2491(VarCurr,bitIndex28)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_800,axiom,(
    ! [VarCurr] :
      ( v2491(VarCurr,bitIndex29)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_799,axiom,(
    ! [VarCurr] :
      ( v2491(VarCurr,bitIndex30)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_798,axiom,(
    ! [VarCurr] :
      ( v2491(VarCurr,bitIndex31)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_797,axiom,(
    ! [VarCurr] :
      ( v2491(VarCurr,bitIndex32)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_796,axiom,(
    ! [VarCurr] :
      ( v2491(VarCurr,bitIndex33)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_795,axiom,(
    ! [VarCurr] :
      ( v2491(VarCurr,bitIndex34)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_794,axiom,(
    ! [VarCurr] :
      ( v2491(VarCurr,bitIndex35)
    <=> v2468(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesMultipleBits_15,axiom,(
    ! [VarCurr,B] :
      ( range_39_0(B)
     => ( v2460(VarCurr,B)
      <=> ( v2461(VarCurr,B)
          & v2483(VarCurr,B) ) ) ) )).

fof(addAssignment_793,axiom,(
    ! [VarCurr] :
      ( v2483(VarCurr,bitIndex0)
    <=> v2484(VarCurr) ) )).

fof(addAssignment_792,axiom,(
    ! [VarCurr] :
      ( v2483(VarCurr,bitIndex1)
    <=> v2484(VarCurr) ) )).

fof(addAssignment_791,axiom,(
    ! [VarCurr] :
      ( v2483(VarCurr,bitIndex2)
    <=> v2484(VarCurr) ) )).

fof(addAssignment_790,axiom,(
    ! [VarCurr] :
      ( v2483(VarCurr,bitIndex3)
    <=> v2484(VarCurr) ) )).

fof(addAssignment_789,axiom,(
    ! [VarCurr] :
      ( v2483(VarCurr,bitIndex4)
    <=> v2484(VarCurr) ) )).

fof(addAssignment_788,axiom,(
    ! [VarCurr] :
      ( v2483(VarCurr,bitIndex5)
    <=> v2484(VarCurr) ) )).

fof(addAssignment_787,axiom,(
    ! [VarCurr] :
      ( v2483(VarCurr,bitIndex6)
    <=> v2484(VarCurr) ) )).

fof(addAssignment_786,axiom,(
    ! [VarCurr] :
      ( v2483(VarCurr,bitIndex7)
    <=> v2484(VarCurr) ) )).

fof(addAssignment_785,axiom,(
    ! [VarCurr] :
      ( v2483(VarCurr,bitIndex8)
    <=> v2484(VarCurr) ) )).

fof(addAssignment_784,axiom,(
    ! [VarCurr] :
      ( v2483(VarCurr,bitIndex9)
    <=> v2484(VarCurr) ) )).

fof(addAssignment_783,axiom,(
    ! [VarCurr] :
      ( v2483(VarCurr,bitIndex10)
    <=> v2484(VarCurr) ) )).

fof(addAssignment_782,axiom,(
    ! [VarCurr] :
      ( v2483(VarCurr,bitIndex11)
    <=> v2484(VarCurr) ) )).

fof(addAssignment_781,axiom,(
    ! [VarCurr] :
      ( v2483(VarCurr,bitIndex12)
    <=> v2484(VarCurr) ) )).

fof(addAssignment_780,axiom,(
    ! [VarCurr] :
      ( v2483(VarCurr,bitIndex13)
    <=> v2484(VarCurr) ) )).

fof(addAssignment_779,axiom,(
    ! [VarCurr] :
      ( v2483(VarCurr,bitIndex14)
    <=> v2484(VarCurr) ) )).

fof(addAssignment_778,axiom,(
    ! [VarCurr] :
      ( v2483(VarCurr,bitIndex15)
    <=> v2484(VarCurr) ) )).

fof(addAssignment_777,axiom,(
    ! [VarCurr] :
      ( v2483(VarCurr,bitIndex16)
    <=> v2484(VarCurr) ) )).

fof(addAssignment_776,axiom,(
    ! [VarCurr] :
      ( v2483(VarCurr,bitIndex17)
    <=> v2484(VarCurr) ) )).

fof(addAssignment_775,axiom,(
    ! [VarCurr] :
      ( v2483(VarCurr,bitIndex18)
    <=> v2484(VarCurr) ) )).

fof(addAssignment_774,axiom,(
    ! [VarCurr] :
      ( v2483(VarCurr,bitIndex19)
    <=> v2484(VarCurr) ) )).

fof(addAssignment_773,axiom,(
    ! [VarCurr] :
      ( v2483(VarCurr,bitIndex20)
    <=> v2484(VarCurr) ) )).

fof(addAssignment_772,axiom,(
    ! [VarCurr] :
      ( v2483(VarCurr,bitIndex21)
    <=> v2484(VarCurr) ) )).

fof(addAssignment_771,axiom,(
    ! [VarCurr] :
      ( v2483(VarCurr,bitIndex22)
    <=> v2484(VarCurr) ) )).

fof(addAssignment_770,axiom,(
    ! [VarCurr] :
      ( v2483(VarCurr,bitIndex23)
    <=> v2484(VarCurr) ) )).

fof(addAssignment_769,axiom,(
    ! [VarCurr] :
      ( v2483(VarCurr,bitIndex24)
    <=> v2484(VarCurr) ) )).

fof(addAssignment_768,axiom,(
    ! [VarCurr] :
      ( v2483(VarCurr,bitIndex25)
    <=> v2484(VarCurr) ) )).

fof(addAssignment_767,axiom,(
    ! [VarCurr] :
      ( v2483(VarCurr,bitIndex26)
    <=> v2484(VarCurr) ) )).

fof(addAssignment_766,axiom,(
    ! [VarCurr] :
      ( v2483(VarCurr,bitIndex27)
    <=> v2484(VarCurr) ) )).

fof(addAssignment_765,axiom,(
    ! [VarCurr] :
      ( v2483(VarCurr,bitIndex28)
    <=> v2484(VarCurr) ) )).

fof(addAssignment_764,axiom,(
    ! [VarCurr] :
      ( v2483(VarCurr,bitIndex29)
    <=> v2484(VarCurr) ) )).

fof(addAssignment_763,axiom,(
    ! [VarCurr] :
      ( v2483(VarCurr,bitIndex30)
    <=> v2484(VarCurr) ) )).

fof(addAssignment_762,axiom,(
    ! [VarCurr] :
      ( v2483(VarCurr,bitIndex31)
    <=> v2484(VarCurr) ) )).

fof(addAssignment_761,axiom,(
    ! [VarCurr] :
      ( v2483(VarCurr,bitIndex32)
    <=> v2484(VarCurr) ) )).

fof(addAssignment_760,axiom,(
    ! [VarCurr] :
      ( v2483(VarCurr,bitIndex33)
    <=> v2484(VarCurr) ) )).

fof(addAssignment_759,axiom,(
    ! [VarCurr] :
      ( v2483(VarCurr,bitIndex34)
    <=> v2484(VarCurr) ) )).

fof(addAssignment_758,axiom,(
    ! [VarCurr] :
      ( v2483(VarCurr,bitIndex35)
    <=> v2484(VarCurr) ) )).

fof(addAssignment_757,axiom,(
    ! [VarCurr] :
      ( v2483(VarCurr,bitIndex36)
    <=> v2484(VarCurr) ) )).

fof(addAssignment_756,axiom,(
    ! [VarCurr] :
      ( v2483(VarCurr,bitIndex37)
    <=> v2484(VarCurr) ) )).

fof(addAssignment_755,axiom,(
    ! [VarCurr] :
      ( v2483(VarCurr,bitIndex38)
    <=> v2484(VarCurr) ) )).

fof(addAssignment_754,axiom,(
    ! [VarCurr] :
      ( v2483(VarCurr,bitIndex39)
    <=> v2484(VarCurr) ) )).

fof(writeUnaryOperator_216,axiom,(
    ! [VarCurr] :
      ( ~ v2484(VarCurr)
    <=> v2453(VarCurr,bitIndex2) ) )).

fof(writeBinaryOperatorEqualRangesMultipleBits_14,axiom,(
    ! [VarCurr,B] :
      ( range_39_0(B)
     => ( v2461(VarCurr,B)
      <=> ( v2462(VarCurr,B)
          | v2474(VarCurr,B) ) ) ) )).

fof(writeBinaryOperatorEqualRangesMultipleBits_13,axiom,(
    ! [VarCurr,B] :
      ( range_39_0(B)
     => ( v2474(VarCurr,B)
      <=> ( v2475(VarCurr,B)
          & v2482(VarCurr,B) ) ) ) )).

fof(addAssignment_753,axiom,(
    ! [VarCurr] :
      ( v2482(VarCurr,bitIndex0)
    <=> v2453(VarCurr,bitIndex1) ) )).

fof(addAssignment_752,axiom,(
    ! [VarCurr] :
      ( v2482(VarCurr,bitIndex1)
    <=> v2453(VarCurr,bitIndex1) ) )).

fof(addAssignment_751,axiom,(
    ! [VarCurr] :
      ( v2482(VarCurr,bitIndex2)
    <=> v2453(VarCurr,bitIndex1) ) )).

fof(addAssignment_750,axiom,(
    ! [VarCurr] :
      ( v2482(VarCurr,bitIndex3)
    <=> v2453(VarCurr,bitIndex1) ) )).

fof(addAssignment_749,axiom,(
    ! [VarCurr] :
      ( v2482(VarCurr,bitIndex4)
    <=> v2453(VarCurr,bitIndex1) ) )).

fof(addAssignment_748,axiom,(
    ! [VarCurr] :
      ( v2482(VarCurr,bitIndex5)
    <=> v2453(VarCurr,bitIndex1) ) )).

fof(addAssignment_747,axiom,(
    ! [VarCurr] :
      ( v2482(VarCurr,bitIndex6)
    <=> v2453(VarCurr,bitIndex1) ) )).

fof(addAssignment_746,axiom,(
    ! [VarCurr] :
      ( v2482(VarCurr,bitIndex7)
    <=> v2453(VarCurr,bitIndex1) ) )).

fof(addAssignment_745,axiom,(
    ! [VarCurr] :
      ( v2482(VarCurr,bitIndex8)
    <=> v2453(VarCurr,bitIndex1) ) )).

fof(addAssignment_744,axiom,(
    ! [VarCurr] :
      ( v2482(VarCurr,bitIndex9)
    <=> v2453(VarCurr,bitIndex1) ) )).

fof(addAssignment_743,axiom,(
    ! [VarCurr] :
      ( v2482(VarCurr,bitIndex10)
    <=> v2453(VarCurr,bitIndex1) ) )).

fof(addAssignment_742,axiom,(
    ! [VarCurr] :
      ( v2482(VarCurr,bitIndex11)
    <=> v2453(VarCurr,bitIndex1) ) )).

fof(addAssignment_741,axiom,(
    ! [VarCurr] :
      ( v2482(VarCurr,bitIndex12)
    <=> v2453(VarCurr,bitIndex1) ) )).

fof(addAssignment_740,axiom,(
    ! [VarCurr] :
      ( v2482(VarCurr,bitIndex13)
    <=> v2453(VarCurr,bitIndex1) ) )).

fof(addAssignment_739,axiom,(
    ! [VarCurr] :
      ( v2482(VarCurr,bitIndex14)
    <=> v2453(VarCurr,bitIndex1) ) )).

fof(addAssignment_738,axiom,(
    ! [VarCurr] :
      ( v2482(VarCurr,bitIndex15)
    <=> v2453(VarCurr,bitIndex1) ) )).

fof(addAssignment_737,axiom,(
    ! [VarCurr] :
      ( v2482(VarCurr,bitIndex16)
    <=> v2453(VarCurr,bitIndex1) ) )).

fof(addAssignment_736,axiom,(
    ! [VarCurr] :
      ( v2482(VarCurr,bitIndex17)
    <=> v2453(VarCurr,bitIndex1) ) )).

fof(addAssignment_735,axiom,(
    ! [VarCurr] :
      ( v2482(VarCurr,bitIndex18)
    <=> v2453(VarCurr,bitIndex1) ) )).

fof(addAssignment_734,axiom,(
    ! [VarCurr] :
      ( v2482(VarCurr,bitIndex19)
    <=> v2453(VarCurr,bitIndex1) ) )).

fof(addAssignment_733,axiom,(
    ! [VarCurr] :
      ( v2482(VarCurr,bitIndex20)
    <=> v2453(VarCurr,bitIndex1) ) )).

fof(addAssignment_732,axiom,(
    ! [VarCurr] :
      ( v2482(VarCurr,bitIndex21)
    <=> v2453(VarCurr,bitIndex1) ) )).

fof(addAssignment_731,axiom,(
    ! [VarCurr] :
      ( v2482(VarCurr,bitIndex22)
    <=> v2453(VarCurr,bitIndex1) ) )).

fof(addAssignment_730,axiom,(
    ! [VarCurr] :
      ( v2482(VarCurr,bitIndex23)
    <=> v2453(VarCurr,bitIndex1) ) )).

fof(addAssignment_729,axiom,(
    ! [VarCurr] :
      ( v2482(VarCurr,bitIndex24)
    <=> v2453(VarCurr,bitIndex1) ) )).

fof(addAssignment_728,axiom,(
    ! [VarCurr] :
      ( v2482(VarCurr,bitIndex25)
    <=> v2453(VarCurr,bitIndex1) ) )).

fof(addAssignment_727,axiom,(
    ! [VarCurr] :
      ( v2482(VarCurr,bitIndex26)
    <=> v2453(VarCurr,bitIndex1) ) )).

fof(addAssignment_726,axiom,(
    ! [VarCurr] :
      ( v2482(VarCurr,bitIndex27)
    <=> v2453(VarCurr,bitIndex1) ) )).

fof(addAssignment_725,axiom,(
    ! [VarCurr] :
      ( v2482(VarCurr,bitIndex28)
    <=> v2453(VarCurr,bitIndex1) ) )).

fof(addAssignment_724,axiom,(
    ! [VarCurr] :
      ( v2482(VarCurr,bitIndex29)
    <=> v2453(VarCurr,bitIndex1) ) )).

fof(addAssignment_723,axiom,(
    ! [VarCurr] :
      ( v2482(VarCurr,bitIndex30)
    <=> v2453(VarCurr,bitIndex1) ) )).

fof(addAssignment_722,axiom,(
    ! [VarCurr] :
      ( v2482(VarCurr,bitIndex31)
    <=> v2453(VarCurr,bitIndex1) ) )).

fof(addAssignment_721,axiom,(
    ! [VarCurr] :
      ( v2482(VarCurr,bitIndex32)
    <=> v2453(VarCurr,bitIndex1) ) )).

fof(addAssignment_720,axiom,(
    ! [VarCurr] :
      ( v2482(VarCurr,bitIndex33)
    <=> v2453(VarCurr,bitIndex1) ) )).

fof(addAssignment_719,axiom,(
    ! [VarCurr] :
      ( v2482(VarCurr,bitIndex34)
    <=> v2453(VarCurr,bitIndex1) ) )).

fof(addAssignment_718,axiom,(
    ! [VarCurr] :
      ( v2482(VarCurr,bitIndex35)
    <=> v2453(VarCurr,bitIndex1) ) )).

fof(addAssignment_717,axiom,(
    ! [VarCurr] :
      ( v2482(VarCurr,bitIndex36)
    <=> v2453(VarCurr,bitIndex1) ) )).

fof(addAssignment_716,axiom,(
    ! [VarCurr] :
      ( v2482(VarCurr,bitIndex37)
    <=> v2453(VarCurr,bitIndex1) ) )).

fof(addAssignment_715,axiom,(
    ! [VarCurr] :
      ( v2482(VarCurr,bitIndex38)
    <=> v2453(VarCurr,bitIndex1) ) )).

fof(addAssignment_714,axiom,(
    ! [VarCurr] :
      ( v2482(VarCurr,bitIndex39)
    <=> v2453(VarCurr,bitIndex1) ) )).

fof(addAssignment_713,axiom,(
    ! [VarCurr,B] :
      ( range_37_0(B)
     => ( v2475(VarCurr,B)
      <=> v2476(VarCurr,B) ) ) )).

fof(addAssignment_712,axiom,(
    ! [VarCurr] :
      ( ( v2475(VarCurr,bitIndex39)
      <=> $false )
      & ( v2475(VarCurr,bitIndex38)
      <=> $false ) ) )).

fof(writeBinaryOperatorEqualRangesMultipleBits_12,axiom,(
    ! [VarCurr,B] :
      ( range_37_0(B)
     => ( v2476(VarCurr,B)
      <=> ( v2477(VarCurr,B)
          | v2479(VarCurr,B) ) ) ) )).

fof(writeBinaryOperatorEqualRangesMultipleBits_11,axiom,(
    ! [VarCurr,B] :
      ( range_37_0(B)
     => ( v2479(VarCurr,B)
      <=> ( v2480(VarCurr,B)
          & v2481(VarCurr,B) ) ) ) )).

fof(range_axiom_17,axiom,(
    ! [B] :
      ( range_37_0(B)
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
        | bitIndex37 = B ) ) )).

fof(addAssignment_711,axiom,(
    ! [VarCurr] :
      ( v2481(VarCurr,bitIndex0)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_710,axiom,(
    ! [VarCurr] :
      ( v2481(VarCurr,bitIndex1)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_709,axiom,(
    ! [VarCurr] :
      ( v2481(VarCurr,bitIndex2)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_708,axiom,(
    ! [VarCurr] :
      ( v2481(VarCurr,bitIndex3)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_707,axiom,(
    ! [VarCurr] :
      ( v2481(VarCurr,bitIndex4)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_706,axiom,(
    ! [VarCurr] :
      ( v2481(VarCurr,bitIndex5)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_705,axiom,(
    ! [VarCurr] :
      ( v2481(VarCurr,bitIndex6)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_704,axiom,(
    ! [VarCurr] :
      ( v2481(VarCurr,bitIndex7)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_703,axiom,(
    ! [VarCurr] :
      ( v2481(VarCurr,bitIndex8)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_702,axiom,(
    ! [VarCurr] :
      ( v2481(VarCurr,bitIndex9)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_701,axiom,(
    ! [VarCurr] :
      ( v2481(VarCurr,bitIndex10)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_700,axiom,(
    ! [VarCurr] :
      ( v2481(VarCurr,bitIndex11)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_699,axiom,(
    ! [VarCurr] :
      ( v2481(VarCurr,bitIndex12)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_698,axiom,(
    ! [VarCurr] :
      ( v2481(VarCurr,bitIndex13)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_697,axiom,(
    ! [VarCurr] :
      ( v2481(VarCurr,bitIndex14)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_696,axiom,(
    ! [VarCurr] :
      ( v2481(VarCurr,bitIndex15)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_695,axiom,(
    ! [VarCurr] :
      ( v2481(VarCurr,bitIndex16)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_694,axiom,(
    ! [VarCurr] :
      ( v2481(VarCurr,bitIndex17)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_693,axiom,(
    ! [VarCurr] :
      ( v2481(VarCurr,bitIndex18)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_692,axiom,(
    ! [VarCurr] :
      ( v2481(VarCurr,bitIndex19)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_691,axiom,(
    ! [VarCurr] :
      ( v2481(VarCurr,bitIndex20)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_690,axiom,(
    ! [VarCurr] :
      ( v2481(VarCurr,bitIndex21)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_689,axiom,(
    ! [VarCurr] :
      ( v2481(VarCurr,bitIndex22)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_688,axiom,(
    ! [VarCurr] :
      ( v2481(VarCurr,bitIndex23)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_687,axiom,(
    ! [VarCurr] :
      ( v2481(VarCurr,bitIndex24)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_686,axiom,(
    ! [VarCurr] :
      ( v2481(VarCurr,bitIndex25)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_685,axiom,(
    ! [VarCurr] :
      ( v2481(VarCurr,bitIndex26)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_684,axiom,(
    ! [VarCurr] :
      ( v2481(VarCurr,bitIndex27)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_683,axiom,(
    ! [VarCurr] :
      ( v2481(VarCurr,bitIndex28)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_682,axiom,(
    ! [VarCurr] :
      ( v2481(VarCurr,bitIndex29)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_681,axiom,(
    ! [VarCurr] :
      ( v2481(VarCurr,bitIndex30)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_680,axiom,(
    ! [VarCurr] :
      ( v2481(VarCurr,bitIndex31)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_679,axiom,(
    ! [VarCurr] :
      ( v2481(VarCurr,bitIndex32)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_678,axiom,(
    ! [VarCurr] :
      ( v2481(VarCurr,bitIndex33)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_677,axiom,(
    ! [VarCurr] :
      ( v2481(VarCurr,bitIndex34)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_676,axiom,(
    ! [VarCurr] :
      ( v2481(VarCurr,bitIndex35)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_675,axiom,(
    ! [VarCurr] :
      ( v2481(VarCurr,bitIndex36)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_674,axiom,(
    ! [VarCurr] :
      ( v2481(VarCurr,bitIndex37)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_673,axiom,(
    ! [VarCurr] :
      ( ( v2480(VarCurr,bitIndex36)
      <=> v2465(VarCurr,bitIndex39) )
      & ( v2480(VarCurr,bitIndex35)
      <=> v2465(VarCurr,bitIndex38) )
      & ( v2480(VarCurr,bitIndex34)
      <=> v2465(VarCurr,bitIndex37) )
      & ( v2480(VarCurr,bitIndex33)
      <=> v2465(VarCurr,bitIndex36) )
      & ( v2480(VarCurr,bitIndex32)
      <=> v2465(VarCurr,bitIndex35) )
      & ( v2480(VarCurr,bitIndex31)
      <=> v2465(VarCurr,bitIndex34) )
      & ( v2480(VarCurr,bitIndex30)
      <=> v2465(VarCurr,bitIndex33) )
      & ( v2480(VarCurr,bitIndex29)
      <=> v2465(VarCurr,bitIndex32) )
      & ( v2480(VarCurr,bitIndex28)
      <=> v2465(VarCurr,bitIndex31) )
      & ( v2480(VarCurr,bitIndex27)
      <=> v2465(VarCurr,bitIndex30) )
      & ( v2480(VarCurr,bitIndex26)
      <=> v2465(VarCurr,bitIndex29) )
      & ( v2480(VarCurr,bitIndex25)
      <=> v2465(VarCurr,bitIndex28) )
      & ( v2480(VarCurr,bitIndex24)
      <=> v2465(VarCurr,bitIndex27) )
      & ( v2480(VarCurr,bitIndex23)
      <=> v2465(VarCurr,bitIndex26) )
      & ( v2480(VarCurr,bitIndex22)
      <=> v2465(VarCurr,bitIndex25) )
      & ( v2480(VarCurr,bitIndex21)
      <=> v2465(VarCurr,bitIndex24) )
      & ( v2480(VarCurr,bitIndex20)
      <=> v2465(VarCurr,bitIndex23) )
      & ( v2480(VarCurr,bitIndex19)
      <=> v2465(VarCurr,bitIndex22) )
      & ( v2480(VarCurr,bitIndex18)
      <=> v2465(VarCurr,bitIndex21) )
      & ( v2480(VarCurr,bitIndex17)
      <=> v2465(VarCurr,bitIndex20) )
      & ( v2480(VarCurr,bitIndex16)
      <=> v2465(VarCurr,bitIndex19) )
      & ( v2480(VarCurr,bitIndex15)
      <=> v2465(VarCurr,bitIndex18) )
      & ( v2480(VarCurr,bitIndex14)
      <=> v2465(VarCurr,bitIndex17) )
      & ( v2480(VarCurr,bitIndex13)
      <=> v2465(VarCurr,bitIndex16) )
      & ( v2480(VarCurr,bitIndex12)
      <=> v2465(VarCurr,bitIndex15) )
      & ( v2480(VarCurr,bitIndex11)
      <=> v2465(VarCurr,bitIndex14) )
      & ( v2480(VarCurr,bitIndex10)
      <=> v2465(VarCurr,bitIndex13) )
      & ( v2480(VarCurr,bitIndex9)
      <=> v2465(VarCurr,bitIndex12) )
      & ( v2480(VarCurr,bitIndex8)
      <=> v2465(VarCurr,bitIndex11) )
      & ( v2480(VarCurr,bitIndex7)
      <=> v2465(VarCurr,bitIndex10) )
      & ( v2480(VarCurr,bitIndex6)
      <=> v2465(VarCurr,bitIndex9) )
      & ( v2480(VarCurr,bitIndex5)
      <=> v2465(VarCurr,bitIndex8) )
      & ( v2480(VarCurr,bitIndex4)
      <=> v2465(VarCurr,bitIndex7) )
      & ( v2480(VarCurr,bitIndex3)
      <=> v2465(VarCurr,bitIndex6) )
      & ( v2480(VarCurr,bitIndex2)
      <=> v2465(VarCurr,bitIndex5) )
      & ( v2480(VarCurr,bitIndex1)
      <=> v2465(VarCurr,bitIndex4) )
      & ( v2480(VarCurr,bitIndex0)
      <=> v2465(VarCurr,bitIndex3) ) ) )).

fof(addAssignment_672,axiom,(
    ! [VarCurr] :
      ( v2480(VarCurr,bitIndex37)
    <=> $false ) )).

fof(writeBinaryOperatorShiftedRanges_144,axiom,(
    ! [VarCurr] :
      ( v2477(VarCurr,bitIndex0)
    <=> ( v2465(VarCurr,bitIndex2)
        & v2478(VarCurr,bitIndex0) ) ) )).

fof(writeBinaryOperatorShiftedRanges_143,axiom,(
    ! [VarCurr] :
      ( v2477(VarCurr,bitIndex1)
    <=> ( v2465(VarCurr,bitIndex3)
        & v2478(VarCurr,bitIndex1) ) ) )).

fof(writeBinaryOperatorShiftedRanges_142,axiom,(
    ! [VarCurr] :
      ( v2477(VarCurr,bitIndex2)
    <=> ( v2465(VarCurr,bitIndex4)
        & v2478(VarCurr,bitIndex2) ) ) )).

fof(writeBinaryOperatorShiftedRanges_141,axiom,(
    ! [VarCurr] :
      ( v2477(VarCurr,bitIndex3)
    <=> ( v2465(VarCurr,bitIndex5)
        & v2478(VarCurr,bitIndex3) ) ) )).

fof(writeBinaryOperatorShiftedRanges_140,axiom,(
    ! [VarCurr] :
      ( v2477(VarCurr,bitIndex4)
    <=> ( v2465(VarCurr,bitIndex6)
        & v2478(VarCurr,bitIndex4) ) ) )).

fof(writeBinaryOperatorShiftedRanges_139,axiom,(
    ! [VarCurr] :
      ( v2477(VarCurr,bitIndex5)
    <=> ( v2465(VarCurr,bitIndex7)
        & v2478(VarCurr,bitIndex5) ) ) )).

fof(writeBinaryOperatorShiftedRanges_138,axiom,(
    ! [VarCurr] :
      ( v2477(VarCurr,bitIndex6)
    <=> ( v2465(VarCurr,bitIndex8)
        & v2478(VarCurr,bitIndex6) ) ) )).

fof(writeBinaryOperatorShiftedRanges_137,axiom,(
    ! [VarCurr] :
      ( v2477(VarCurr,bitIndex7)
    <=> ( v2465(VarCurr,bitIndex9)
        & v2478(VarCurr,bitIndex7) ) ) )).

fof(writeBinaryOperatorShiftedRanges_136,axiom,(
    ! [VarCurr] :
      ( v2477(VarCurr,bitIndex8)
    <=> ( v2465(VarCurr,bitIndex10)
        & v2478(VarCurr,bitIndex8) ) ) )).

fof(writeBinaryOperatorShiftedRanges_135,axiom,(
    ! [VarCurr] :
      ( v2477(VarCurr,bitIndex9)
    <=> ( v2465(VarCurr,bitIndex11)
        & v2478(VarCurr,bitIndex9) ) ) )).

fof(writeBinaryOperatorShiftedRanges_134,axiom,(
    ! [VarCurr] :
      ( v2477(VarCurr,bitIndex10)
    <=> ( v2465(VarCurr,bitIndex12)
        & v2478(VarCurr,bitIndex10) ) ) )).

fof(writeBinaryOperatorShiftedRanges_133,axiom,(
    ! [VarCurr] :
      ( v2477(VarCurr,bitIndex11)
    <=> ( v2465(VarCurr,bitIndex13)
        & v2478(VarCurr,bitIndex11) ) ) )).

fof(writeBinaryOperatorShiftedRanges_132,axiom,(
    ! [VarCurr] :
      ( v2477(VarCurr,bitIndex12)
    <=> ( v2465(VarCurr,bitIndex14)
        & v2478(VarCurr,bitIndex12) ) ) )).

fof(writeBinaryOperatorShiftedRanges_131,axiom,(
    ! [VarCurr] :
      ( v2477(VarCurr,bitIndex13)
    <=> ( v2465(VarCurr,bitIndex15)
        & v2478(VarCurr,bitIndex13) ) ) )).

fof(writeBinaryOperatorShiftedRanges_130,axiom,(
    ! [VarCurr] :
      ( v2477(VarCurr,bitIndex14)
    <=> ( v2465(VarCurr,bitIndex16)
        & v2478(VarCurr,bitIndex14) ) ) )).

fof(writeBinaryOperatorShiftedRanges_129,axiom,(
    ! [VarCurr] :
      ( v2477(VarCurr,bitIndex15)
    <=> ( v2465(VarCurr,bitIndex17)
        & v2478(VarCurr,bitIndex15) ) ) )).

fof(writeBinaryOperatorShiftedRanges_128,axiom,(
    ! [VarCurr] :
      ( v2477(VarCurr,bitIndex16)
    <=> ( v2465(VarCurr,bitIndex18)
        & v2478(VarCurr,bitIndex16) ) ) )).

fof(writeBinaryOperatorShiftedRanges_127,axiom,(
    ! [VarCurr] :
      ( v2477(VarCurr,bitIndex17)
    <=> ( v2465(VarCurr,bitIndex19)
        & v2478(VarCurr,bitIndex17) ) ) )).

fof(writeBinaryOperatorShiftedRanges_126,axiom,(
    ! [VarCurr] :
      ( v2477(VarCurr,bitIndex18)
    <=> ( v2465(VarCurr,bitIndex20)
        & v2478(VarCurr,bitIndex18) ) ) )).

fof(writeBinaryOperatorShiftedRanges_125,axiom,(
    ! [VarCurr] :
      ( v2477(VarCurr,bitIndex19)
    <=> ( v2465(VarCurr,bitIndex21)
        & v2478(VarCurr,bitIndex19) ) ) )).

fof(writeBinaryOperatorShiftedRanges_124,axiom,(
    ! [VarCurr] :
      ( v2477(VarCurr,bitIndex20)
    <=> ( v2465(VarCurr,bitIndex22)
        & v2478(VarCurr,bitIndex20) ) ) )).

fof(writeBinaryOperatorShiftedRanges_123,axiom,(
    ! [VarCurr] :
      ( v2477(VarCurr,bitIndex21)
    <=> ( v2465(VarCurr,bitIndex23)
        & v2478(VarCurr,bitIndex21) ) ) )).

fof(writeBinaryOperatorShiftedRanges_122,axiom,(
    ! [VarCurr] :
      ( v2477(VarCurr,bitIndex22)
    <=> ( v2465(VarCurr,bitIndex24)
        & v2478(VarCurr,bitIndex22) ) ) )).

fof(writeBinaryOperatorShiftedRanges_121,axiom,(
    ! [VarCurr] :
      ( v2477(VarCurr,bitIndex23)
    <=> ( v2465(VarCurr,bitIndex25)
        & v2478(VarCurr,bitIndex23) ) ) )).

fof(writeBinaryOperatorShiftedRanges_120,axiom,(
    ! [VarCurr] :
      ( v2477(VarCurr,bitIndex24)
    <=> ( v2465(VarCurr,bitIndex26)
        & v2478(VarCurr,bitIndex24) ) ) )).

fof(writeBinaryOperatorShiftedRanges_119,axiom,(
    ! [VarCurr] :
      ( v2477(VarCurr,bitIndex25)
    <=> ( v2465(VarCurr,bitIndex27)
        & v2478(VarCurr,bitIndex25) ) ) )).

fof(writeBinaryOperatorShiftedRanges_118,axiom,(
    ! [VarCurr] :
      ( v2477(VarCurr,bitIndex26)
    <=> ( v2465(VarCurr,bitIndex28)
        & v2478(VarCurr,bitIndex26) ) ) )).

fof(writeBinaryOperatorShiftedRanges_117,axiom,(
    ! [VarCurr] :
      ( v2477(VarCurr,bitIndex27)
    <=> ( v2465(VarCurr,bitIndex29)
        & v2478(VarCurr,bitIndex27) ) ) )).

fof(writeBinaryOperatorShiftedRanges_116,axiom,(
    ! [VarCurr] :
      ( v2477(VarCurr,bitIndex28)
    <=> ( v2465(VarCurr,bitIndex30)
        & v2478(VarCurr,bitIndex28) ) ) )).

fof(writeBinaryOperatorShiftedRanges_115,axiom,(
    ! [VarCurr] :
      ( v2477(VarCurr,bitIndex29)
    <=> ( v2465(VarCurr,bitIndex31)
        & v2478(VarCurr,bitIndex29) ) ) )).

fof(writeBinaryOperatorShiftedRanges_114,axiom,(
    ! [VarCurr] :
      ( v2477(VarCurr,bitIndex30)
    <=> ( v2465(VarCurr,bitIndex32)
        & v2478(VarCurr,bitIndex30) ) ) )).

fof(writeBinaryOperatorShiftedRanges_113,axiom,(
    ! [VarCurr] :
      ( v2477(VarCurr,bitIndex31)
    <=> ( v2465(VarCurr,bitIndex33)
        & v2478(VarCurr,bitIndex31) ) ) )).

fof(writeBinaryOperatorShiftedRanges_112,axiom,(
    ! [VarCurr] :
      ( v2477(VarCurr,bitIndex32)
    <=> ( v2465(VarCurr,bitIndex34)
        & v2478(VarCurr,bitIndex32) ) ) )).

fof(writeBinaryOperatorShiftedRanges_111,axiom,(
    ! [VarCurr] :
      ( v2477(VarCurr,bitIndex33)
    <=> ( v2465(VarCurr,bitIndex35)
        & v2478(VarCurr,bitIndex33) ) ) )).

fof(writeBinaryOperatorShiftedRanges_110,axiom,(
    ! [VarCurr] :
      ( v2477(VarCurr,bitIndex34)
    <=> ( v2465(VarCurr,bitIndex36)
        & v2478(VarCurr,bitIndex34) ) ) )).

fof(writeBinaryOperatorShiftedRanges_109,axiom,(
    ! [VarCurr] :
      ( v2477(VarCurr,bitIndex35)
    <=> ( v2465(VarCurr,bitIndex37)
        & v2478(VarCurr,bitIndex35) ) ) )).

fof(writeBinaryOperatorShiftedRanges_108,axiom,(
    ! [VarCurr] :
      ( v2477(VarCurr,bitIndex36)
    <=> ( v2465(VarCurr,bitIndex38)
        & v2478(VarCurr,bitIndex36) ) ) )).

fof(writeBinaryOperatorShiftedRanges_107,axiom,(
    ! [VarCurr] :
      ( v2477(VarCurr,bitIndex37)
    <=> ( v2465(VarCurr,bitIndex39)
        & v2478(VarCurr,bitIndex37) ) ) )).

fof(addAssignment_671,axiom,(
    ! [VarCurr] :
      ( v2478(VarCurr,bitIndex0)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_670,axiom,(
    ! [VarCurr] :
      ( v2478(VarCurr,bitIndex1)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_669,axiom,(
    ! [VarCurr] :
      ( v2478(VarCurr,bitIndex2)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_668,axiom,(
    ! [VarCurr] :
      ( v2478(VarCurr,bitIndex3)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_667,axiom,(
    ! [VarCurr] :
      ( v2478(VarCurr,bitIndex4)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_666,axiom,(
    ! [VarCurr] :
      ( v2478(VarCurr,bitIndex5)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_665,axiom,(
    ! [VarCurr] :
      ( v2478(VarCurr,bitIndex6)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_664,axiom,(
    ! [VarCurr] :
      ( v2478(VarCurr,bitIndex7)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_663,axiom,(
    ! [VarCurr] :
      ( v2478(VarCurr,bitIndex8)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_662,axiom,(
    ! [VarCurr] :
      ( v2478(VarCurr,bitIndex9)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_661,axiom,(
    ! [VarCurr] :
      ( v2478(VarCurr,bitIndex10)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_660,axiom,(
    ! [VarCurr] :
      ( v2478(VarCurr,bitIndex11)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_659,axiom,(
    ! [VarCurr] :
      ( v2478(VarCurr,bitIndex12)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_658,axiom,(
    ! [VarCurr] :
      ( v2478(VarCurr,bitIndex13)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_657,axiom,(
    ! [VarCurr] :
      ( v2478(VarCurr,bitIndex14)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_656,axiom,(
    ! [VarCurr] :
      ( v2478(VarCurr,bitIndex15)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_655,axiom,(
    ! [VarCurr] :
      ( v2478(VarCurr,bitIndex16)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_654,axiom,(
    ! [VarCurr] :
      ( v2478(VarCurr,bitIndex17)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_653,axiom,(
    ! [VarCurr] :
      ( v2478(VarCurr,bitIndex18)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_652,axiom,(
    ! [VarCurr] :
      ( v2478(VarCurr,bitIndex19)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_651,axiom,(
    ! [VarCurr] :
      ( v2478(VarCurr,bitIndex20)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_650,axiom,(
    ! [VarCurr] :
      ( v2478(VarCurr,bitIndex21)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_649,axiom,(
    ! [VarCurr] :
      ( v2478(VarCurr,bitIndex22)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_648,axiom,(
    ! [VarCurr] :
      ( v2478(VarCurr,bitIndex23)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_647,axiom,(
    ! [VarCurr] :
      ( v2478(VarCurr,bitIndex24)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_646,axiom,(
    ! [VarCurr] :
      ( v2478(VarCurr,bitIndex25)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_645,axiom,(
    ! [VarCurr] :
      ( v2478(VarCurr,bitIndex26)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_644,axiom,(
    ! [VarCurr] :
      ( v2478(VarCurr,bitIndex27)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_643,axiom,(
    ! [VarCurr] :
      ( v2478(VarCurr,bitIndex28)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_642,axiom,(
    ! [VarCurr] :
      ( v2478(VarCurr,bitIndex29)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_641,axiom,(
    ! [VarCurr] :
      ( v2478(VarCurr,bitIndex30)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_640,axiom,(
    ! [VarCurr] :
      ( v2478(VarCurr,bitIndex31)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_639,axiom,(
    ! [VarCurr] :
      ( v2478(VarCurr,bitIndex32)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_638,axiom,(
    ! [VarCurr] :
      ( v2478(VarCurr,bitIndex33)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_637,axiom,(
    ! [VarCurr] :
      ( v2478(VarCurr,bitIndex34)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_636,axiom,(
    ! [VarCurr] :
      ( v2478(VarCurr,bitIndex35)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_635,axiom,(
    ! [VarCurr] :
      ( v2478(VarCurr,bitIndex36)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_634,axiom,(
    ! [VarCurr] :
      ( v2478(VarCurr,bitIndex37)
    <=> v2468(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesMultipleBits_10,axiom,(
    ! [VarCurr,B] :
      ( range_39_0(B)
     => ( v2462(VarCurr,B)
      <=> ( v2463(VarCurr,B)
          & v2472(VarCurr,B) ) ) ) )).

fof(addAssignment_633,axiom,(
    ! [VarCurr] :
      ( v2472(VarCurr,bitIndex0)
    <=> v2473(VarCurr) ) )).

fof(addAssignment_632,axiom,(
    ! [VarCurr] :
      ( v2472(VarCurr,bitIndex1)
    <=> v2473(VarCurr) ) )).

fof(addAssignment_631,axiom,(
    ! [VarCurr] :
      ( v2472(VarCurr,bitIndex2)
    <=> v2473(VarCurr) ) )).

fof(addAssignment_630,axiom,(
    ! [VarCurr] :
      ( v2472(VarCurr,bitIndex3)
    <=> v2473(VarCurr) ) )).

fof(addAssignment_629,axiom,(
    ! [VarCurr] :
      ( v2472(VarCurr,bitIndex4)
    <=> v2473(VarCurr) ) )).

fof(addAssignment_628,axiom,(
    ! [VarCurr] :
      ( v2472(VarCurr,bitIndex5)
    <=> v2473(VarCurr) ) )).

fof(addAssignment_627,axiom,(
    ! [VarCurr] :
      ( v2472(VarCurr,bitIndex6)
    <=> v2473(VarCurr) ) )).

fof(addAssignment_626,axiom,(
    ! [VarCurr] :
      ( v2472(VarCurr,bitIndex7)
    <=> v2473(VarCurr) ) )).

fof(addAssignment_625,axiom,(
    ! [VarCurr] :
      ( v2472(VarCurr,bitIndex8)
    <=> v2473(VarCurr) ) )).

fof(addAssignment_624,axiom,(
    ! [VarCurr] :
      ( v2472(VarCurr,bitIndex9)
    <=> v2473(VarCurr) ) )).

fof(addAssignment_623,axiom,(
    ! [VarCurr] :
      ( v2472(VarCurr,bitIndex10)
    <=> v2473(VarCurr) ) )).

fof(addAssignment_622,axiom,(
    ! [VarCurr] :
      ( v2472(VarCurr,bitIndex11)
    <=> v2473(VarCurr) ) )).

fof(addAssignment_621,axiom,(
    ! [VarCurr] :
      ( v2472(VarCurr,bitIndex12)
    <=> v2473(VarCurr) ) )).

fof(addAssignment_620,axiom,(
    ! [VarCurr] :
      ( v2472(VarCurr,bitIndex13)
    <=> v2473(VarCurr) ) )).

fof(addAssignment_619,axiom,(
    ! [VarCurr] :
      ( v2472(VarCurr,bitIndex14)
    <=> v2473(VarCurr) ) )).

fof(addAssignment_618,axiom,(
    ! [VarCurr] :
      ( v2472(VarCurr,bitIndex15)
    <=> v2473(VarCurr) ) )).

fof(addAssignment_617,axiom,(
    ! [VarCurr] :
      ( v2472(VarCurr,bitIndex16)
    <=> v2473(VarCurr) ) )).

fof(addAssignment_616,axiom,(
    ! [VarCurr] :
      ( v2472(VarCurr,bitIndex17)
    <=> v2473(VarCurr) ) )).

fof(addAssignment_615,axiom,(
    ! [VarCurr] :
      ( v2472(VarCurr,bitIndex18)
    <=> v2473(VarCurr) ) )).

fof(addAssignment_614,axiom,(
    ! [VarCurr] :
      ( v2472(VarCurr,bitIndex19)
    <=> v2473(VarCurr) ) )).

fof(addAssignment_613,axiom,(
    ! [VarCurr] :
      ( v2472(VarCurr,bitIndex20)
    <=> v2473(VarCurr) ) )).

fof(addAssignment_612,axiom,(
    ! [VarCurr] :
      ( v2472(VarCurr,bitIndex21)
    <=> v2473(VarCurr) ) )).

fof(addAssignment_611,axiom,(
    ! [VarCurr] :
      ( v2472(VarCurr,bitIndex22)
    <=> v2473(VarCurr) ) )).

fof(addAssignment_610,axiom,(
    ! [VarCurr] :
      ( v2472(VarCurr,bitIndex23)
    <=> v2473(VarCurr) ) )).

fof(addAssignment_609,axiom,(
    ! [VarCurr] :
      ( v2472(VarCurr,bitIndex24)
    <=> v2473(VarCurr) ) )).

fof(addAssignment_608,axiom,(
    ! [VarCurr] :
      ( v2472(VarCurr,bitIndex25)
    <=> v2473(VarCurr) ) )).

fof(addAssignment_607,axiom,(
    ! [VarCurr] :
      ( v2472(VarCurr,bitIndex26)
    <=> v2473(VarCurr) ) )).

fof(addAssignment_606,axiom,(
    ! [VarCurr] :
      ( v2472(VarCurr,bitIndex27)
    <=> v2473(VarCurr) ) )).

fof(addAssignment_605,axiom,(
    ! [VarCurr] :
      ( v2472(VarCurr,bitIndex28)
    <=> v2473(VarCurr) ) )).

fof(addAssignment_604,axiom,(
    ! [VarCurr] :
      ( v2472(VarCurr,bitIndex29)
    <=> v2473(VarCurr) ) )).

fof(addAssignment_603,axiom,(
    ! [VarCurr] :
      ( v2472(VarCurr,bitIndex30)
    <=> v2473(VarCurr) ) )).

fof(addAssignment_602,axiom,(
    ! [VarCurr] :
      ( v2472(VarCurr,bitIndex31)
    <=> v2473(VarCurr) ) )).

fof(addAssignment_601,axiom,(
    ! [VarCurr] :
      ( v2472(VarCurr,bitIndex32)
    <=> v2473(VarCurr) ) )).

fof(addAssignment_600,axiom,(
    ! [VarCurr] :
      ( v2472(VarCurr,bitIndex33)
    <=> v2473(VarCurr) ) )).

fof(addAssignment_599,axiom,(
    ! [VarCurr] :
      ( v2472(VarCurr,bitIndex34)
    <=> v2473(VarCurr) ) )).

fof(addAssignment_598,axiom,(
    ! [VarCurr] :
      ( v2472(VarCurr,bitIndex35)
    <=> v2473(VarCurr) ) )).

fof(addAssignment_597,axiom,(
    ! [VarCurr] :
      ( v2472(VarCurr,bitIndex36)
    <=> v2473(VarCurr) ) )).

fof(addAssignment_596,axiom,(
    ! [VarCurr] :
      ( v2472(VarCurr,bitIndex37)
    <=> v2473(VarCurr) ) )).

fof(addAssignment_595,axiom,(
    ! [VarCurr] :
      ( v2472(VarCurr,bitIndex38)
    <=> v2473(VarCurr) ) )).

fof(addAssignment_594,axiom,(
    ! [VarCurr] :
      ( v2472(VarCurr,bitIndex39)
    <=> v2473(VarCurr) ) )).

fof(writeUnaryOperator_215,axiom,(
    ! [VarCurr] :
      ( ~ v2473(VarCurr)
    <=> v2453(VarCurr,bitIndex1) ) )).

fof(writeBinaryOperatorEqualRangesMultipleBits_9,axiom,(
    ! [VarCurr,B] :
      ( range_39_0(B)
     => ( v2463(VarCurr,B)
      <=> ( v2464(VarCurr,B)
          | v2469(VarCurr,B) ) ) ) )).

fof(writeBinaryOperatorEqualRangesMultipleBits_8,axiom,(
    ! [VarCurr,B] :
      ( range_39_0(B)
     => ( v2469(VarCurr,B)
      <=> ( v2470(VarCurr,B)
          & v2471(VarCurr,B) ) ) ) )).

fof(addAssignment_593,axiom,(
    ! [VarCurr] :
      ( v2471(VarCurr,bitIndex0)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_592,axiom,(
    ! [VarCurr] :
      ( v2471(VarCurr,bitIndex1)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_591,axiom,(
    ! [VarCurr] :
      ( v2471(VarCurr,bitIndex2)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_590,axiom,(
    ! [VarCurr] :
      ( v2471(VarCurr,bitIndex3)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_589,axiom,(
    ! [VarCurr] :
      ( v2471(VarCurr,bitIndex4)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_588,axiom,(
    ! [VarCurr] :
      ( v2471(VarCurr,bitIndex5)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_587,axiom,(
    ! [VarCurr] :
      ( v2471(VarCurr,bitIndex6)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_586,axiom,(
    ! [VarCurr] :
      ( v2471(VarCurr,bitIndex7)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_585,axiom,(
    ! [VarCurr] :
      ( v2471(VarCurr,bitIndex8)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_584,axiom,(
    ! [VarCurr] :
      ( v2471(VarCurr,bitIndex9)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_583,axiom,(
    ! [VarCurr] :
      ( v2471(VarCurr,bitIndex10)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_582,axiom,(
    ! [VarCurr] :
      ( v2471(VarCurr,bitIndex11)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_581,axiom,(
    ! [VarCurr] :
      ( v2471(VarCurr,bitIndex12)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_580,axiom,(
    ! [VarCurr] :
      ( v2471(VarCurr,bitIndex13)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_579,axiom,(
    ! [VarCurr] :
      ( v2471(VarCurr,bitIndex14)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_578,axiom,(
    ! [VarCurr] :
      ( v2471(VarCurr,bitIndex15)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_577,axiom,(
    ! [VarCurr] :
      ( v2471(VarCurr,bitIndex16)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_576,axiom,(
    ! [VarCurr] :
      ( v2471(VarCurr,bitIndex17)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_575,axiom,(
    ! [VarCurr] :
      ( v2471(VarCurr,bitIndex18)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_574,axiom,(
    ! [VarCurr] :
      ( v2471(VarCurr,bitIndex19)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_573,axiom,(
    ! [VarCurr] :
      ( v2471(VarCurr,bitIndex20)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_572,axiom,(
    ! [VarCurr] :
      ( v2471(VarCurr,bitIndex21)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_571,axiom,(
    ! [VarCurr] :
      ( v2471(VarCurr,bitIndex22)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_570,axiom,(
    ! [VarCurr] :
      ( v2471(VarCurr,bitIndex23)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_569,axiom,(
    ! [VarCurr] :
      ( v2471(VarCurr,bitIndex24)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_568,axiom,(
    ! [VarCurr] :
      ( v2471(VarCurr,bitIndex25)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_567,axiom,(
    ! [VarCurr] :
      ( v2471(VarCurr,bitIndex26)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_566,axiom,(
    ! [VarCurr] :
      ( v2471(VarCurr,bitIndex27)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_565,axiom,(
    ! [VarCurr] :
      ( v2471(VarCurr,bitIndex28)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_564,axiom,(
    ! [VarCurr] :
      ( v2471(VarCurr,bitIndex29)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_563,axiom,(
    ! [VarCurr] :
      ( v2471(VarCurr,bitIndex30)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_562,axiom,(
    ! [VarCurr] :
      ( v2471(VarCurr,bitIndex31)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_561,axiom,(
    ! [VarCurr] :
      ( v2471(VarCurr,bitIndex32)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_560,axiom,(
    ! [VarCurr] :
      ( v2471(VarCurr,bitIndex33)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_559,axiom,(
    ! [VarCurr] :
      ( v2471(VarCurr,bitIndex34)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_558,axiom,(
    ! [VarCurr] :
      ( v2471(VarCurr,bitIndex35)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_557,axiom,(
    ! [VarCurr] :
      ( v2471(VarCurr,bitIndex36)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_556,axiom,(
    ! [VarCurr] :
      ( v2471(VarCurr,bitIndex37)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_555,axiom,(
    ! [VarCurr] :
      ( v2471(VarCurr,bitIndex38)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_554,axiom,(
    ! [VarCurr] :
      ( v2471(VarCurr,bitIndex39)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignment_553,axiom,(
    ! [VarCurr] :
      ( ( v2470(VarCurr,bitIndex38)
      <=> v2465(VarCurr,bitIndex39) )
      & ( v2470(VarCurr,bitIndex37)
      <=> v2465(VarCurr,bitIndex38) )
      & ( v2470(VarCurr,bitIndex36)
      <=> v2465(VarCurr,bitIndex37) )
      & ( v2470(VarCurr,bitIndex35)
      <=> v2465(VarCurr,bitIndex36) )
      & ( v2470(VarCurr,bitIndex34)
      <=> v2465(VarCurr,bitIndex35) )
      & ( v2470(VarCurr,bitIndex33)
      <=> v2465(VarCurr,bitIndex34) )
      & ( v2470(VarCurr,bitIndex32)
      <=> v2465(VarCurr,bitIndex33) )
      & ( v2470(VarCurr,bitIndex31)
      <=> v2465(VarCurr,bitIndex32) )
      & ( v2470(VarCurr,bitIndex30)
      <=> v2465(VarCurr,bitIndex31) )
      & ( v2470(VarCurr,bitIndex29)
      <=> v2465(VarCurr,bitIndex30) )
      & ( v2470(VarCurr,bitIndex28)
      <=> v2465(VarCurr,bitIndex29) )
      & ( v2470(VarCurr,bitIndex27)
      <=> v2465(VarCurr,bitIndex28) )
      & ( v2470(VarCurr,bitIndex26)
      <=> v2465(VarCurr,bitIndex27) )
      & ( v2470(VarCurr,bitIndex25)
      <=> v2465(VarCurr,bitIndex26) )
      & ( v2470(VarCurr,bitIndex24)
      <=> v2465(VarCurr,bitIndex25) )
      & ( v2470(VarCurr,bitIndex23)
      <=> v2465(VarCurr,bitIndex24) )
      & ( v2470(VarCurr,bitIndex22)
      <=> v2465(VarCurr,bitIndex23) )
      & ( v2470(VarCurr,bitIndex21)
      <=> v2465(VarCurr,bitIndex22) )
      & ( v2470(VarCurr,bitIndex20)
      <=> v2465(VarCurr,bitIndex21) )
      & ( v2470(VarCurr,bitIndex19)
      <=> v2465(VarCurr,bitIndex20) )
      & ( v2470(VarCurr,bitIndex18)
      <=> v2465(VarCurr,bitIndex19) )
      & ( v2470(VarCurr,bitIndex17)
      <=> v2465(VarCurr,bitIndex18) )
      & ( v2470(VarCurr,bitIndex16)
      <=> v2465(VarCurr,bitIndex17) )
      & ( v2470(VarCurr,bitIndex15)
      <=> v2465(VarCurr,bitIndex16) )
      & ( v2470(VarCurr,bitIndex14)
      <=> v2465(VarCurr,bitIndex15) )
      & ( v2470(VarCurr,bitIndex13)
      <=> v2465(VarCurr,bitIndex14) )
      & ( v2470(VarCurr,bitIndex12)
      <=> v2465(VarCurr,bitIndex13) )
      & ( v2470(VarCurr,bitIndex11)
      <=> v2465(VarCurr,bitIndex12) )
      & ( v2470(VarCurr,bitIndex10)
      <=> v2465(VarCurr,bitIndex11) )
      & ( v2470(VarCurr,bitIndex9)
      <=> v2465(VarCurr,bitIndex10) )
      & ( v2470(VarCurr,bitIndex8)
      <=> v2465(VarCurr,bitIndex9) )
      & ( v2470(VarCurr,bitIndex7)
      <=> v2465(VarCurr,bitIndex8) )
      & ( v2470(VarCurr,bitIndex6)
      <=> v2465(VarCurr,bitIndex7) )
      & ( v2470(VarCurr,bitIndex5)
      <=> v2465(VarCurr,bitIndex6) )
      & ( v2470(VarCurr,bitIndex4)
      <=> v2465(VarCurr,bitIndex5) )
      & ( v2470(VarCurr,bitIndex3)
      <=> v2465(VarCurr,bitIndex4) )
      & ( v2470(VarCurr,bitIndex2)
      <=> v2465(VarCurr,bitIndex3) )
      & ( v2470(VarCurr,bitIndex1)
      <=> v2465(VarCurr,bitIndex2) )
      & ( v2470(VarCurr,bitIndex0)
      <=> v2465(VarCurr,bitIndex1) ) ) )).

fof(addAssignment_552,axiom,(
    ! [VarCurr] :
      ( v2470(VarCurr,bitIndex39)
    <=> $false ) )).

fof(writeBinaryOperatorEqualRangesMultipleBits_7,axiom,(
    ! [VarCurr,B] :
      ( range_39_0(B)
     => ( v2464(VarCurr,B)
      <=> ( v2465(VarCurr,B)
          & v2467(VarCurr,B) ) ) ) )).

fof(range_axiom_16,axiom,(
    ! [B] :
      ( range_39_0(B)
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
        | bitIndex39 = B ) ) )).

fof(addAssignment_551,axiom,(
    ! [VarCurr] :
      ( v2467(VarCurr,bitIndex0)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_550,axiom,(
    ! [VarCurr] :
      ( v2467(VarCurr,bitIndex1)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_549,axiom,(
    ! [VarCurr] :
      ( v2467(VarCurr,bitIndex2)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_548,axiom,(
    ! [VarCurr] :
      ( v2467(VarCurr,bitIndex3)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_547,axiom,(
    ! [VarCurr] :
      ( v2467(VarCurr,bitIndex4)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_546,axiom,(
    ! [VarCurr] :
      ( v2467(VarCurr,bitIndex5)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_545,axiom,(
    ! [VarCurr] :
      ( v2467(VarCurr,bitIndex6)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_544,axiom,(
    ! [VarCurr] :
      ( v2467(VarCurr,bitIndex7)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_543,axiom,(
    ! [VarCurr] :
      ( v2467(VarCurr,bitIndex8)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_542,axiom,(
    ! [VarCurr] :
      ( v2467(VarCurr,bitIndex9)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_541,axiom,(
    ! [VarCurr] :
      ( v2467(VarCurr,bitIndex10)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_540,axiom,(
    ! [VarCurr] :
      ( v2467(VarCurr,bitIndex11)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_539,axiom,(
    ! [VarCurr] :
      ( v2467(VarCurr,bitIndex12)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_538,axiom,(
    ! [VarCurr] :
      ( v2467(VarCurr,bitIndex13)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_537,axiom,(
    ! [VarCurr] :
      ( v2467(VarCurr,bitIndex14)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_536,axiom,(
    ! [VarCurr] :
      ( v2467(VarCurr,bitIndex15)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_535,axiom,(
    ! [VarCurr] :
      ( v2467(VarCurr,bitIndex16)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_534,axiom,(
    ! [VarCurr] :
      ( v2467(VarCurr,bitIndex17)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_533,axiom,(
    ! [VarCurr] :
      ( v2467(VarCurr,bitIndex18)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_532,axiom,(
    ! [VarCurr] :
      ( v2467(VarCurr,bitIndex19)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_531,axiom,(
    ! [VarCurr] :
      ( v2467(VarCurr,bitIndex20)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_530,axiom,(
    ! [VarCurr] :
      ( v2467(VarCurr,bitIndex21)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_529,axiom,(
    ! [VarCurr] :
      ( v2467(VarCurr,bitIndex22)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_528,axiom,(
    ! [VarCurr] :
      ( v2467(VarCurr,bitIndex23)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_527,axiom,(
    ! [VarCurr] :
      ( v2467(VarCurr,bitIndex24)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_526,axiom,(
    ! [VarCurr] :
      ( v2467(VarCurr,bitIndex25)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_525,axiom,(
    ! [VarCurr] :
      ( v2467(VarCurr,bitIndex26)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_524,axiom,(
    ! [VarCurr] :
      ( v2467(VarCurr,bitIndex27)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_523,axiom,(
    ! [VarCurr] :
      ( v2467(VarCurr,bitIndex28)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_522,axiom,(
    ! [VarCurr] :
      ( v2467(VarCurr,bitIndex29)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_521,axiom,(
    ! [VarCurr] :
      ( v2467(VarCurr,bitIndex30)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_520,axiom,(
    ! [VarCurr] :
      ( v2467(VarCurr,bitIndex31)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_519,axiom,(
    ! [VarCurr] :
      ( v2467(VarCurr,bitIndex32)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_518,axiom,(
    ! [VarCurr] :
      ( v2467(VarCurr,bitIndex33)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_517,axiom,(
    ! [VarCurr] :
      ( v2467(VarCurr,bitIndex34)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_516,axiom,(
    ! [VarCurr] :
      ( v2467(VarCurr,bitIndex35)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_515,axiom,(
    ! [VarCurr] :
      ( v2467(VarCurr,bitIndex36)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_514,axiom,(
    ! [VarCurr] :
      ( v2467(VarCurr,bitIndex37)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_513,axiom,(
    ! [VarCurr] :
      ( v2467(VarCurr,bitIndex38)
    <=> v2468(VarCurr) ) )).

fof(addAssignment_512,axiom,(
    ! [VarCurr] :
      ( v2467(VarCurr,bitIndex39)
    <=> v2468(VarCurr) ) )).

fof(writeUnaryOperator_214,axiom,(
    ! [VarCurr] :
      ( ~ v2468(VarCurr)
    <=> v2453(VarCurr,bitIndex0) ) )).

fof(addAssignmentInitValueVector_29,axiom,(
    ! [B] :
      ( range_4_0(B)
     => ( v2453(constB0,B)
      <=> $false ) ) )).

fof(addAssignment_511,axiom,(
    ! [VarCurr,B] :
      ( range_31_0(B)
     => ( v2465(VarCurr,B)
      <=> v2451(VarCurr,B) ) ) )).

fof(addAssignment_510,axiom,(
    ! [VarCurr] :
      ( ( v2465(VarCurr,bitIndex39)
      <=> v2451(VarCurr,bitIndex7) )
      & ( v2465(VarCurr,bitIndex38)
      <=> v2451(VarCurr,bitIndex6) )
      & ( v2465(VarCurr,bitIndex37)
      <=> v2451(VarCurr,bitIndex5) )
      & ( v2465(VarCurr,bitIndex36)
      <=> v2451(VarCurr,bitIndex4) )
      & ( v2465(VarCurr,bitIndex35)
      <=> v2451(VarCurr,bitIndex3) )
      & ( v2465(VarCurr,bitIndex34)
      <=> v2451(VarCurr,bitIndex2) )
      & ( v2465(VarCurr,bitIndex33)
      <=> v2451(VarCurr,bitIndex1) )
      & ( v2465(VarCurr,bitIndex32)
      <=> v2451(VarCurr,bitIndex0) ) ) )).

fof(addAssignmentInitValueVector_28,axiom,(
    ! [B] :
      ( range_31_0(B)
     => ( v2451(constB0,B)
      <=> $true ) ) )).

fof(bitBlastConstant_515,axiom,(
    b11111111111111111111111111111111(bitIndex31) )).

fof(bitBlastConstant_514,axiom,(
    b11111111111111111111111111111111(bitIndex30) )).

fof(bitBlastConstant_513,axiom,(
    b11111111111111111111111111111111(bitIndex29) )).

fof(bitBlastConstant_512,axiom,(
    b11111111111111111111111111111111(bitIndex28) )).

fof(bitBlastConstant_511,axiom,(
    b11111111111111111111111111111111(bitIndex27) )).

fof(bitBlastConstant_510,axiom,(
    b11111111111111111111111111111111(bitIndex26) )).

fof(bitBlastConstant_509,axiom,(
    b11111111111111111111111111111111(bitIndex25) )).

fof(bitBlastConstant_508,axiom,(
    b11111111111111111111111111111111(bitIndex24) )).

fof(bitBlastConstant_507,axiom,(
    b11111111111111111111111111111111(bitIndex23) )).

fof(bitBlastConstant_506,axiom,(
    b11111111111111111111111111111111(bitIndex22) )).

fof(bitBlastConstant_505,axiom,(
    b11111111111111111111111111111111(bitIndex21) )).

fof(bitBlastConstant_504,axiom,(
    b11111111111111111111111111111111(bitIndex20) )).

fof(bitBlastConstant_503,axiom,(
    b11111111111111111111111111111111(bitIndex19) )).

fof(bitBlastConstant_502,axiom,(
    b11111111111111111111111111111111(bitIndex18) )).

fof(bitBlastConstant_501,axiom,(
    b11111111111111111111111111111111(bitIndex17) )).

fof(bitBlastConstant_500,axiom,(
    b11111111111111111111111111111111(bitIndex16) )).

fof(bitBlastConstant_499,axiom,(
    b11111111111111111111111111111111(bitIndex15) )).

fof(bitBlastConstant_498,axiom,(
    b11111111111111111111111111111111(bitIndex14) )).

fof(bitBlastConstant_497,axiom,(
    b11111111111111111111111111111111(bitIndex13) )).

fof(bitBlastConstant_496,axiom,(
    b11111111111111111111111111111111(bitIndex12) )).

fof(bitBlastConstant_495,axiom,(
    b11111111111111111111111111111111(bitIndex11) )).

fof(bitBlastConstant_494,axiom,(
    b11111111111111111111111111111111(bitIndex10) )).

fof(bitBlastConstant_493,axiom,(
    b11111111111111111111111111111111(bitIndex9) )).

fof(bitBlastConstant_492,axiom,(
    b11111111111111111111111111111111(bitIndex8) )).

fof(bitBlastConstant_491,axiom,(
    b11111111111111111111111111111111(bitIndex7) )).

fof(bitBlastConstant_490,axiom,(
    b11111111111111111111111111111111(bitIndex6) )).

fof(bitBlastConstant_489,axiom,(
    b11111111111111111111111111111111(bitIndex5) )).

fof(bitBlastConstant_488,axiom,(
    b11111111111111111111111111111111(bitIndex4) )).

fof(bitBlastConstant_487,axiom,(
    b11111111111111111111111111111111(bitIndex3) )).

fof(bitBlastConstant_486,axiom,(
    b11111111111111111111111111111111(bitIndex2) )).

fof(bitBlastConstant_485,axiom,(
    b11111111111111111111111111111111(bitIndex1) )).

fof(bitBlastConstant_484,axiom,(
    b11111111111111111111111111111111(bitIndex0) )).

fof(writeBinaryOperatorEqualRangesSingleBits_462,axiom,(
    ! [VarCurr] :
      ( v2426(VarCurr)
    <=> ( v2437(VarCurr)
        & v2439(VarCurr) ) ) )).

fof(writeUnaryOperator_213,axiom,(
    ! [VarCurr] :
      ( ~ v2439(VarCurr)
    <=> v2322(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_461,axiom,(
    ! [VarCurr] :
      ( v2437(VarCurr)
    <=> ( v2438(VarCurr)
        & v2365(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_460,axiom,(
    ! [VarCurr] :
      ( v2438(VarCurr)
    <=> ( v2304(VarCurr)
        & v2428(VarCurr) ) ) )).

fof(addAssignment_509,axiom,(
    ! [VarCurr] :
      ( v2428(VarCurr)
    <=> v2430(VarCurr) ) )).

fof(addAssignment_508,axiom,(
    ! [VarCurr] :
      ( v2430(VarCurr)
    <=> v2432(VarCurr) ) )).

fof(aaddConditionBooleanCondEqualRangesElseBranch_64,axiom,(
    ! [VarCurr] :
      ( ~ v2434(VarCurr)
     => ( v2432(VarCurr)
      <=> $false ) ) )).

fof(addConditionBooleanCondEqualRangesThenBranch_67,axiom,(
    ! [VarCurr] :
      ( v2434(VarCurr)
     => ( v2432(VarCurr)
      <=> $true ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_459,axiom,(
    ! [VarCurr] :
      ( v2434(VarCurr)
    <=> ( v2435(VarCurr)
        & v170(VarCurr) ) ) )).

fof(writeUnaryOperator_212,axiom,(
    ! [VarCurr] :
      ( ~ v2435(VarCurr)
    <=> v145(VarCurr,bitIndex0) ) )).

fof(addAssignment_507,axiom,(
    ! [VarCurr] :
      ( v2422(VarCurr)
    <=> v2424(VarCurr) ) )).

fof(addAssignment_506,axiom,(
    ! [VarCurr] :
      ( v2424(VarCurr)
    <=> v149(VarCurr,bitIndex53) ) )).

fof(addAssignment_505,axiom,(
    ! [VarCurr] :
      ( v149(VarCurr,bitIndex53)
    <=> v151(VarCurr,bitIndex53) ) )).

fof(addAssignment_504,axiom,(
    ! [VarCurr] :
      ( v151(VarCurr,bitIndex53)
    <=> v156(VarCurr,bitIndex53) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_458,axiom,(
    ! [VarCurr] :
      ( v2412(VarCurr)
    <=> ( v2414(VarCurr)
        & v2416(VarCurr) ) ) )).

fof(writeUnaryOperator_211,axiom,(
    ! [VarCurr] :
      ( ~ v2416(VarCurr)
    <=> v2322(VarCurr) ) )).

fof(addAssignment_503,axiom,(
    ! [VarCurr] :
      ( v2414(VarCurr)
    <=> v2306(VarCurr,bitIndex0) ) )).

fof(addAssignment_502,axiom,(
    ! [VarCurr] :
      ( v2306(VarCurr,bitIndex0)
    <=> v2394(VarCurr,bitIndex0) ) )).

fof(addConditionBooleanCondShiftedRangesElseBranch_18,axiom,(
    ! [VarCurr] :
      ( ~ v2409(VarCurr)
     => ( v2302(VarCurr,bitIndex9)
      <=> $false ) ) )).

fof(addConditionBooleanCondShiftedRangesThenBranch_15,axiom,(
    ! [VarCurr] :
      ( v2409(VarCurr)
     => ( v2302(VarCurr,bitIndex9)
      <=> $true ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_457,axiom,(
    ! [VarCurr] :
      ( v2409(VarCurr)
    <=> ( v2304(VarCurr)
        & v2410(VarCurr) ) ) )).

fof(addBitVectorEqualityBitBlasted_93,axiom,(
    ! [VarCurr] :
      ( v2410(VarCurr)
    <=> ( $true
      <=> v2397(VarCurr,bitIndex8) ) ) )).

fof(addConditionBooleanCondShiftedRangesElseBranch_17,axiom,(
    ! [VarCurr] :
      ( ~ v2406(VarCurr)
     => ( v2302(VarCurr,bitIndex6)
      <=> $false ) ) )).

fof(addConditionBooleanCondShiftedRangesThenBranch_14,axiom,(
    ! [VarCurr] :
      ( v2406(VarCurr)
     => ( v2302(VarCurr,bitIndex6)
      <=> $true ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_456,axiom,(
    ! [VarCurr] :
      ( v2406(VarCurr)
    <=> ( v2304(VarCurr)
        & v2407(VarCurr) ) ) )).

fof(addBitVectorEqualityBitBlasted_92,axiom,(
    ! [VarCurr] :
      ( v2407(VarCurr)
    <=> ( $true
      <=> v2397(VarCurr,bitIndex5) ) ) )).

fof(addConditionBooleanCondShiftedRangesElseBranch_16,axiom,(
    ! [VarCurr] :
      ( ~ v2399(VarCurr)
     => ( v2302(VarCurr,bitIndex3)
      <=> $false ) ) )).

fof(addConditionBooleanCondShiftedRangesThenBranch_13,axiom,(
    ! [VarCurr] :
      ( v2399(VarCurr)
     => ( v2302(VarCurr,bitIndex3)
      <=> $true ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_455,axiom,(
    ! [VarCurr] :
      ( v2399(VarCurr)
    <=> ( v2400(VarCurr)
        & v2402(VarCurr) ) ) )).

fof(addBitVectorEqualityBitBlasted_91,axiom,(
    ! [VarCurr] :
      ( v2402(VarCurr)
    <=> ( $true
      <=> v2397(VarCurr,bitIndex2) ) ) )).

fof(addAssignmentInitValue_24,axiom,(
    ~ v2397(constB0,bitIndex11) )).

fof(addAssignmentInitValue_23,axiom,(
    ~ v2397(constB0,bitIndex10) )).

fof(addAssignmentInitValue_22,axiom,(
    ~ v2397(constB0,bitIndex8) )).

fof(addAssignmentInitValue_21,axiom,(
    ~ v2397(constB0,bitIndex7) )).

fof(addAssignmentInitValue_20,axiom,(
    ~ v2397(constB0,bitIndex5) )).

fof(addAssignmentInitValue_19,axiom,(
    ~ v2397(constB0,bitIndex4) )).

fof(addAssignmentInitValue_18,axiom,(
    ~ v2397(constB0,bitIndex2) )).

fof(addAssignmentInitValue_17,axiom,(
    ~ v2397(constB0,bitIndex1) )).

fof(bitBlastConstant_483,axiom,(
    ~ bx00x00x00x00(bitIndex10) )).

fof(bitBlastConstant_482,axiom,(
    ~ bx00x00x00x00(bitIndex9) )).

fof(bitBlastConstant_481,axiom,(
    ~ bx00x00x00x00(bitIndex7) )).

fof(bitBlastConstant_480,axiom,(
    ~ bx00x00x00x00(bitIndex6) )).

fof(bitBlastConstant_479,axiom,(
    ~ bx00x00x00x00(bitIndex4) )).

fof(bitBlastConstant_478,axiom,(
    ~ bx00x00x00x00(bitIndex3) )).

fof(bitBlastConstant_477,axiom,(
    ~ bx00x00x00x00(bitIndex1) )).

fof(bitBlastConstant_476,axiom,(
    ~ bx00x00x00x00(bitIndex0) )).

fof(writeBinaryOperatorEqualRangesSingleBits_454,axiom,(
    ! [VarCurr] :
      ( v2400(VarCurr)
    <=> ( v2365(VarCurr)
        & v2304(VarCurr) ) ) )).

fof(addAssignment_501,axiom,(
    ! [VarCurr] :
      ( v2304(VarCurr)
    <=> v2306(VarCurr,bitIndex1) ) )).

fof(addAssignment_500,axiom,(
    ! [VarCurr] :
      ( v2306(VarCurr,bitIndex1)
    <=> v2394(VarCurr,bitIndex1) ) )).

fof(writeBinaryOperatorEqualRangesMultipleBits_6,axiom,(
    ! [VarCurr,B] :
      ( range_1_0(B)
     => ( v2394(VarCurr,B)
      <=> ( v2308(VarCurr,B)
          & v2395(VarCurr,B) ) ) ) )).

fof(writeUnaryOperator_210,axiom,(
    ! [VarCurr,B] :
      ( range_1_0(B)
     => ( v2395(VarCurr,B)
      <=> ~ v2338(VarCurr,B) ) ) )).

fof(writeBinaryOperatorShiftedRanges_106,axiom,(
    ! [VarCurr] :
      ( v2338(VarCurr,bitIndex1)
    <=> ( v2338(VarCurr,bitIndex0)
        | v2308(VarCurr,bitIndex0) ) ) )).

fof(addAssignment_499,axiom,(
    ! [VarCurr] :
      ( v2308(VarCurr,bitIndex0)
    <=> v2335(VarCurr,bitIndex0) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_453,axiom,(
    ! [VarCurr] :
      ( v2336(VarCurr)
    <=> ( v2390(VarCurr)
        & v2392(VarCurr) ) ) )).

fof(writeUnaryOperator_209,axiom,(
    ! [VarCurr] :
      ( ~ v2392(VarCurr)
    <=> v2312(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_452,axiom,(
    ! [VarCurr] :
      ( v2390(VarCurr)
    <=> ( v2391(VarCurr)
        & v2365(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_451,axiom,(
    ! [VarCurr] :
      ( v2391(VarCurr)
    <=> ( v2341(VarCurr)
      <~> v2363(VarCurr) ) ) )).

fof(addAssignment_498,axiom,(
    ! [VarCurr] :
      ( v2365(VarCurr)
    <=> v2367(VarCurr) ) )).

fof(addAssignment_497,axiom,(
    ! [VarCurr] :
      ( v2367(VarCurr)
    <=> v2369(VarCurr) ) )).

fof(writeBinaryOperatorShiftedRanges_105,axiom,(
    ! [VarCurr] :
      ( v2369(VarCurr)
    <=> ( v2374(VarCurr)
        | v2371(VarCurr,bitIndex15) ) ) )).

fof(writeBinaryOperatorShiftedRanges_104,axiom,(
    ! [VarCurr] :
      ( v2374(VarCurr)
    <=> ( v2375(VarCurr)
        | v2371(VarCurr,bitIndex14) ) ) )).

fof(writeBinaryOperatorShiftedRanges_103,axiom,(
    ! [VarCurr] :
      ( v2375(VarCurr)
    <=> ( v2376(VarCurr)
        | v2371(VarCurr,bitIndex13) ) ) )).

fof(writeBinaryOperatorShiftedRanges_102,axiom,(
    ! [VarCurr] :
      ( v2376(VarCurr)
    <=> ( v2377(VarCurr)
        | v2371(VarCurr,bitIndex12) ) ) )).

fof(writeBinaryOperatorShiftedRanges_101,axiom,(
    ! [VarCurr] :
      ( v2377(VarCurr)
    <=> ( v2378(VarCurr)
        | v2371(VarCurr,bitIndex11) ) ) )).

fof(writeBinaryOperatorShiftedRanges_100,axiom,(
    ! [VarCurr] :
      ( v2378(VarCurr)
    <=> ( v2379(VarCurr)
        | v2371(VarCurr,bitIndex10) ) ) )).

fof(writeBinaryOperatorShiftedRanges_99,axiom,(
    ! [VarCurr] :
      ( v2379(VarCurr)
    <=> ( v2380(VarCurr)
        | v2371(VarCurr,bitIndex9) ) ) )).

fof(writeBinaryOperatorShiftedRanges_98,axiom,(
    ! [VarCurr] :
      ( v2380(VarCurr)
    <=> ( v2381(VarCurr)
        | v2371(VarCurr,bitIndex8) ) ) )).

fof(writeBinaryOperatorShiftedRanges_97,axiom,(
    ! [VarCurr] :
      ( v2381(VarCurr)
    <=> ( v2382(VarCurr)
        | v2371(VarCurr,bitIndex7) ) ) )).

fof(writeBinaryOperatorShiftedRanges_96,axiom,(
    ! [VarCurr] :
      ( v2382(VarCurr)
    <=> ( v2383(VarCurr)
        | v2371(VarCurr,bitIndex6) ) ) )).

fof(writeBinaryOperatorShiftedRanges_95,axiom,(
    ! [VarCurr] :
      ( v2383(VarCurr)
    <=> ( v2384(VarCurr)
        | v2371(VarCurr,bitIndex5) ) ) )).

fof(writeBinaryOperatorShiftedRanges_94,axiom,(
    ! [VarCurr] :
      ( v2384(VarCurr)
    <=> ( v2385(VarCurr)
        | v2371(VarCurr,bitIndex4) ) ) )).

fof(writeBinaryOperatorShiftedRanges_93,axiom,(
    ! [VarCurr] :
      ( v2385(VarCurr)
    <=> ( v2386(VarCurr)
        | v2371(VarCurr,bitIndex3) ) ) )).

fof(writeBinaryOperatorShiftedRanges_92,axiom,(
    ! [VarCurr] :
      ( v2386(VarCurr)
    <=> ( v2387(VarCurr)
        | v2371(VarCurr,bitIndex2) ) ) )).

fof(writeBinaryOperatorShiftedRanges_91,axiom,(
    ! [VarCurr] :
      ( v2387(VarCurr)
    <=> ( v2371(VarCurr,bitIndex0)
        | v2371(VarCurr,bitIndex1) ) ) )).

fof(addAssignmentInitValueVector_27,axiom,(
    ! [B] :
      ( range_15_0(B)
     => ( v2371(constB0,B)
      <=> $true ) ) )).

fof(bitBlastConstant_475,axiom,(
    b1111111111111111(bitIndex15) )).

fof(bitBlastConstant_474,axiom,(
    b1111111111111111(bitIndex14) )).

fof(bitBlastConstant_473,axiom,(
    b1111111111111111(bitIndex13) )).

fof(bitBlastConstant_472,axiom,(
    b1111111111111111(bitIndex12) )).

fof(bitBlastConstant_471,axiom,(
    b1111111111111111(bitIndex11) )).

fof(bitBlastConstant_470,axiom,(
    b1111111111111111(bitIndex10) )).

fof(bitBlastConstant_469,axiom,(
    b1111111111111111(bitIndex9) )).

fof(bitBlastConstant_468,axiom,(
    b1111111111111111(bitIndex8) )).

fof(bitBlastConstant_467,axiom,(
    b1111111111111111(bitIndex7) )).

fof(bitBlastConstant_466,axiom,(
    b1111111111111111(bitIndex6) )).

fof(bitBlastConstant_465,axiom,(
    b1111111111111111(bitIndex5) )).

fof(bitBlastConstant_464,axiom,(
    b1111111111111111(bitIndex4) )).

fof(bitBlastConstant_463,axiom,(
    b1111111111111111(bitIndex3) )).

fof(bitBlastConstant_462,axiom,(
    b1111111111111111(bitIndex2) )).

fof(bitBlastConstant_461,axiom,(
    b1111111111111111(bitIndex1) )).

fof(bitBlastConstant_460,axiom,(
    b1111111111111111(bitIndex0) )).

fof(addAssignment_496,axiom,(
    ! [VarCurr] :
      ( v2341(VarCurr)
    <=> v2343(VarCurr) ) )).

fof(addAssignment_495,axiom,(
    ! [VarCurr] :
      ( v2343(VarCurr)
    <=> v2345(VarCurr) ) )).

fof(addAssignment_494,axiom,(
    ! [VarCurr] :
      ( v2345(VarCurr)
    <=> v2347(VarCurr) ) )).

fof(addAssignment_493,axiom,(
    ! [VarCurr] :
      ( v2347(VarCurr)
    <=> v2349(VarCurr) ) )).

fof(addAssignment_492,axiom,(
    ! [VarCurr] :
      ( v2349(VarCurr)
    <=> v2351(VarCurr) ) )).

fof(addAssignment_491,axiom,(
    ! [VarCurr] :
      ( v2351(VarCurr)
    <=> v2353(VarCurr) ) )).

fof(addAssignment_490,axiom,(
    ! [VarCurr] :
      ( v2353(VarCurr)
    <=> v2355(VarCurr) ) )).

fof(addAssignment_489,axiom,(
    ! [VarCurr] :
      ( v2355(VarCurr)
    <=> v2357(VarCurr) ) )).

fof(addAssignment_488,axiom,(
    ! [VarCurr] :
      ( v2357(VarCurr)
    <=> v2359(VarCurr) ) )).

fof(addAssignment_487,axiom,(
    ! [VarCurr] :
      ( v2359(VarCurr)
    <=> v2361(VarCurr) ) )).

fof(addAssignmentInitValueVector_26,axiom,
    ( v2361(constB0)
  <=> $false )).

fof(addAssignment_486,axiom,(
    ! [VarCurr] :
      ( v2338(VarCurr,bitIndex0)
    <=> $false ) )).

fof(addAssignment_485,axiom,(
    ! [VarCurr] :
      ( v2308(VarCurr,bitIndex1)
    <=> v2335(VarCurr,bitIndex1) ) )).

fof(addAssignment_484,axiom,(
    ! [VarCurr] :
      ( v2335(VarCurr,bitIndex0)
    <=> v2336(VarCurr) ) )).

fof(addAssignment_483,axiom,(
    ! [VarCurr] :
      ( v2335(VarCurr,bitIndex1)
    <=> v2310(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_450,axiom,(
    ! [VarCurr] :
      ( v2310(VarCurr)
    <=> ( v2331(VarCurr)
        & v2334(VarCurr) ) ) )).

fof(writeUnaryOperator_208,axiom,(
    ! [VarCurr] :
      ( ~ v2334(VarCurr)
    <=> v2320(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_449,axiom,(
    ! [VarCurr] :
      ( v2331(VarCurr)
    <=> ( v2332(VarCurr)
        & v2333(VarCurr) ) ) )).

fof(writeUnaryOperator_207,axiom,(
    ! [VarCurr] :
      ( ~ v2333(VarCurr)
    <=> v2312(VarCurr) ) )).

fof(writeUnaryOperator_206,axiom,(
    ! [VarCurr] :
      ( ~ v2332(VarCurr)
    <=> v129(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_448,axiom,(
    ! [VarCurr] :
      ( v2320(VarCurr)
    <=> ( v2328(VarCurr)
        | v2326(VarCurr) ) ) )).

fof(addAssignmentInitValueVector_25,axiom,
    ( v2326(constB0)
  <=> $false )).

fof(writeBinaryOperatorEqualRangesSingleBits_447,axiom,(
    ! [VarCurr] :
      ( v2328(VarCurr)
    <=> ( v2322(VarCurr)
        & v2329(VarCurr) ) ) )).

fof(writeUnaryOperator_205,axiom,(
    ! [VarCurr] :
      ( ~ v2329(VarCurr)
    <=> v2324(VarCurr) ) )).

fof(addAssignmentInitValueVector_24,axiom,
    ( v2324(constB0)
  <=> $false )).

fof(addAssignmentInitValueVector_23,axiom,
    ( v2322(constB0)
  <=> $false )).

fof(addAssignment_482,axiom,(
    ! [VarCurr] :
      ( v2312(VarCurr)
    <=> v2314(VarCurr) ) )).

fof(addAssignment_481,axiom,(
    ! [VarCurr] :
      ( v2314(VarCurr)
    <=> v2316(VarCurr) ) )).

fof(addAssignment_480,axiom,(
    ! [VarCurr] :
      ( v2316(VarCurr)
    <=> v2318(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_446,axiom,(
    ! [VarCurr] :
      ( v2275(VarCurr)
    <=> ( v2278(VarCurr)
        & v875(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_445,axiom,(
    ! [VarCurr] :
      ( v2278(VarCurr)
    <=> ( v2279(VarCurr)
        | v2288(VarCurr) ) ) )).

fof(addBitVectorEqualityBitBlasted_90,axiom,(
    ! [VarCurr] :
      ( v2288(VarCurr)
    <=> ( ( v743(VarCurr,bitIndex3)
        <=> $true )
        & ( v743(VarCurr,bitIndex2)
        <=> $true )
        & ( v743(VarCurr,bitIndex1)
        <=> $true )
        & ( v743(VarCurr,bitIndex0)
        <=> $true ) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_444,axiom,(
    ! [VarCurr] :
      ( v2279(VarCurr)
    <=> ( v2280(VarCurr)
        | v2287(VarCurr) ) ) )).

fof(addBitVectorEqualityBitBlasted_89,axiom,(
    ! [VarCurr] :
      ( v2287(VarCurr)
    <=> ( ( v743(VarCurr,bitIndex3)
        <=> $true )
        & ( v743(VarCurr,bitIndex2)
        <=> $true )
        & ( v743(VarCurr,bitIndex1)
        <=> $true )
        & ( v743(VarCurr,bitIndex0)
        <=> $false ) ) ) )).

fof(bitBlastConstant_459,axiom,(
    b1110(bitIndex3) )).

fof(bitBlastConstant_458,axiom,(
    b1110(bitIndex2) )).

fof(bitBlastConstant_457,axiom,(
    b1110(bitIndex1) )).

fof(bitBlastConstant_456,axiom,(
    ~ b1110(bitIndex0) )).

fof(writeBinaryOperatorEqualRangesSingleBits_443,axiom,(
    ! [VarCurr] :
      ( v2280(VarCurr)
    <=> ( v2281(VarCurr)
        | v2286(VarCurr) ) ) )).

fof(addBitVectorEqualityBitBlasted_88,axiom,(
    ! [VarCurr] :
      ( v2286(VarCurr)
    <=> ( ( v743(VarCurr,bitIndex3)
        <=> $true )
        & ( v743(VarCurr,bitIndex2)
        <=> $true )
        & ( v743(VarCurr,bitIndex1)
        <=> $false )
        & ( v743(VarCurr,bitIndex0)
        <=> $true ) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_442,axiom,(
    ! [VarCurr] :
      ( v2281(VarCurr)
    <=> ( v2282(VarCurr)
        | v2285(VarCurr) ) ) )).

fof(addBitVectorEqualityBitBlasted_87,axiom,(
    ! [VarCurr] :
      ( v2285(VarCurr)
    <=> ( ( v743(VarCurr,bitIndex3)
        <=> $true )
        & ( v743(VarCurr,bitIndex2)
        <=> $true )
        & ( v743(VarCurr,bitIndex1)
        <=> $false )
        & ( v743(VarCurr,bitIndex0)
        <=> $false ) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_441,axiom,(
    ! [VarCurr] :
      ( v2282(VarCurr)
    <=> ( v2283(VarCurr)
        | v2284(VarCurr) ) ) )).

fof(addBitVectorEqualityBitBlasted_86,axiom,(
    ! [VarCurr] :
      ( v2284(VarCurr)
    <=> ( ( v743(VarCurr,bitIndex3)
        <=> $true )
        & ( v743(VarCurr,bitIndex2)
        <=> $false )
        & ( v743(VarCurr,bitIndex1)
        <=> $false )
        & ( v743(VarCurr,bitIndex0)
        <=> $true ) ) ) )).

fof(addBitVectorEqualityBitBlasted_85,axiom,(
    ! [VarCurr] :
      ( v2283(VarCurr)
    <=> ( ( v743(VarCurr,bitIndex3)
        <=> $true )
        & ( v743(VarCurr,bitIndex2)
        <=> $false )
        & ( v743(VarCurr,bitIndex1)
        <=> $false )
        & ( v743(VarCurr,bitIndex0)
        <=> $false ) ) ) )).

fof(bitBlastConstant_455,axiom,(
    b1000(bitIndex3) )).

fof(bitBlastConstant_454,axiom,(
    ~ b1000(bitIndex2) )).

fof(bitBlastConstant_453,axiom,(
    ~ b1000(bitIndex1) )).

fof(bitBlastConstant_452,axiom,(
    ~ b1000(bitIndex0) )).

fof(writeBinaryOperatorEqualRangesSingleBits_440,axiom,(
    ! [VarCurr] :
      ( v2265(VarCurr)
    <=> ( v2267(VarCurr)
        & v875(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_439,axiom,(
    ! [VarCurr] :
      ( v2267(VarCurr)
    <=> ( v2268(VarCurr)
        | v2273(VarCurr) ) ) )).

fof(addBitVectorEqualityBitBlasted_84,axiom,(
    ! [VarCurr] :
      ( v2273(VarCurr)
    <=> ( ( v743(VarCurr,bitIndex3)
        <=> $false )
        & ( v743(VarCurr,bitIndex2)
        <=> $true )
        & ( v743(VarCurr,bitIndex1)
        <=> $false )
        & ( v743(VarCurr,bitIndex0)
        <=> $true ) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_438,axiom,(
    ! [VarCurr] :
      ( v2268(VarCurr)
    <=> ( v2269(VarCurr)
        | v2272(VarCurr) ) ) )).

fof(addBitVectorEqualityBitBlasted_83,axiom,(
    ! [VarCurr] :
      ( v2272(VarCurr)
    <=> ( ( v743(VarCurr,bitIndex3)
        <=> $false )
        & ( v743(VarCurr,bitIndex2)
        <=> $true )
        & ( v743(VarCurr,bitIndex1)
        <=> $false )
        & ( v743(VarCurr,bitIndex0)
        <=> $false ) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_437,axiom,(
    ! [VarCurr] :
      ( v2269(VarCurr)
    <=> ( v2270(VarCurr)
        | v2271(VarCurr) ) ) )).

fof(addBitVectorEqualityBitBlasted_82,axiom,(
    ! [VarCurr] :
      ( v2271(VarCurr)
    <=> ( ( v743(VarCurr,bitIndex3)
        <=> $false )
        & ( v743(VarCurr,bitIndex2)
        <=> $false )
        & ( v743(VarCurr,bitIndex1)
        <=> $false )
        & ( v743(VarCurr,bitIndex0)
        <=> $true ) ) ) )).

fof(addBitVectorEqualityBitBlasted_81,axiom,(
    ! [VarCurr] :
      ( v2270(VarCurr)
    <=> ( ( v743(VarCurr,bitIndex3)
        <=> $false )
        & ( v743(VarCurr,bitIndex2)
        <=> $false )
        & ( v743(VarCurr,bitIndex1)
        <=> $false )
        & ( v743(VarCurr,bitIndex0)
        <=> $false ) ) ) )).

fof(addAssignment_479,axiom,(
    ! [VarCurr] :
      ( v1908(VarCurr)
    <=> v1910(VarCurr) ) )).

fof(addAssignment_478,axiom,(
    ! [VarCurr] :
      ( v1910(VarCurr)
    <=> v1912(VarCurr) ) )).

fof(addAssignment_477,axiom,(
    ! [VarCurr] :
      ( v1912(VarCurr)
    <=> v1914(VarCurr) ) )).

fof(addAssignment_476,axiom,(
    ! [VarCurr] :
      ( v1914(VarCurr)
    <=> v1916(VarCurr) ) )).

fof(addAssignment_475,axiom,(
    ! [VarCurr] :
      ( v1916(VarCurr)
    <=> v1918(VarCurr,bitIndex0) ) )).

fof(addAssignment_474,axiom,(
    ! [VarCurr] :
      ( v1918(VarCurr,bitIndex0)
    <=> v1920(VarCurr,bitIndex0) ) )).

fof(addAssignment_473,axiom,(
    ! [VarCurr] :
      ( v1920(VarCurr,bitIndex0)
    <=> v1922(VarCurr,bitIndex0) ) )).

fof(addAssignment_472,axiom,(
    ! [VarCurr] :
      ( v1922(VarCurr,bitIndex0)
    <=> v1924(VarCurr,bitIndex0) ) )).

fof(addAssignment_471,axiom,(
    ! [VarCurr] :
      ( v1924(VarCurr,bitIndex0)
    <=> v1926(VarCurr,bitIndex0) ) )).

fof(addAssignment_470,axiom,(
    ! [VarCurr] :
      ( v1926(VarCurr,bitIndex0)
    <=> v1928(VarCurr,bitIndex0) ) )).

fof(addAssignment_469,axiom,(
    ! [VarCurr] :
      ( v1928(VarCurr,bitIndex0)
    <=> v1930(VarCurr) ) )).

fof(addCaseBooleanConditionEqualRanges1_23,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( ~ v2214(VarNext)
       => ( v1930(VarNext)
        <=> v1930(VarCurr) ) ) ) )).

fof(addCaseBooleanConditionEqualRanges0_35,axiom,(
    ! [VarNext] :
      ( v2214(VarNext)
     => ( v1930(VarNext)
      <=> v2249(VarNext) ) ) )).

fof(addAssignment_468,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( v2249(VarNext)
      <=> v2247(VarCurr) ) ) )).

fof(addParallelCaseBooleanConditionEqualRanges1_17,axiom,(
    ! [VarCurr] :
      ( ~ v1932(VarCurr)
     => ( v2247(VarCurr)
      <=> v2250(VarCurr) ) ) )).

fof(addParallelCaseBooleanConditionEqualRanges0_17,axiom,(
    ! [VarCurr] :
      ( v1932(VarCurr)
     => ( v2247(VarCurr)
      <=> v1955(VarCurr) ) ) )).

fof(addParallelCaseBooleanConditionEqualRanges1_16,axiom,(
    ! [VarCurr] :
      ( ~ v2227(VarCurr)
     => ( v2250(VarCurr)
      <=> v2203(VarCurr) ) ) )).

fof(addParallelCaseBooleanConditionEqualRanges0_16,axiom,(
    ! [VarCurr] :
      ( v2227(VarCurr)
     => ( v2250(VarCurr)
      <=> v2251(VarCurr) ) ) )).

fof(addParallelCaseBooleanConditionEqualRanges2_6,axiom,(
    ! [VarCurr] :
      ( ( ~ v2230(VarCurr)
        & ~ v2232(VarCurr) )
     => ( v2251(VarCurr)
      <=> v2255(VarCurr) ) ) )).

fof(addParallelCaseBooleanConditionEqualRanges1_15,axiom,(
    ! [VarCurr] :
      ( v2232(VarCurr)
     => ( v2251(VarCurr)
      <=> v2254(VarCurr) ) ) )).

fof(addParallelCaseBooleanConditionEqualRanges0_15,axiom,(
    ! [VarCurr] :
      ( v2230(VarCurr)
     => ( v2251(VarCurr)
      <=> v2252(VarCurr) ) ) )).

fof(addParallelCaseBooleanConditionEqualRanges1_14,axiom,(
    ! [VarCurr] :
      ( ~ v2240(VarCurr)
     => ( v2255(VarCurr)
      <=> v2203(VarCurr) ) ) )).

fof(addParallelCaseBooleanConditionEqualRanges0_14,axiom,(
    ! [VarCurr] :
      ( v2240(VarCurr)
     => ( v2255(VarCurr)
      <=> $true ) ) )).

fof(addParallelCaseBooleanConditionEqualRanges1_13,axiom,(
    ! [VarCurr] :
      ( ~ v2234(VarCurr)
     => ( v2254(VarCurr)
      <=> v2203(VarCurr) ) ) )).

fof(addParallelCaseBooleanConditionEqualRanges0_13,axiom,(
    ! [VarCurr] :
      ( v2234(VarCurr)
     => ( v2254(VarCurr)
      <=> $false ) ) )).

fof(aaddConditionBooleanCondEqualRangesElseBranch_63,axiom,(
    ! [VarCurr] :
      ( ~ v2253(VarCurr)
     => ( v2252(VarCurr)
      <=> $false ) ) )).

fof(addConditionBooleanCondEqualRangesThenBranch_66,axiom,(
    ! [VarCurr] :
      ( v2253(VarCurr)
     => ( v2252(VarCurr)
      <=> $true ) ) )).

fof(addBitVectorEqualityBitBlasted_80,axiom,(
    ! [VarCurr] :
      ( v2253(VarCurr)
    <=> ( v1964(VarCurr)
      <=> $true ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_436,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( v2214(VarNext)
      <=> ( v2215(VarNext)
          & v2224(VarNext) ) ) ) )).

fof(addAssignment_467,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( v2224(VarNext)
      <=> v2222(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_435,axiom,(
    ! [VarCurr] :
      ( v2222(VarCurr)
    <=> ( v1932(VarCurr)
        | v2225(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_434,axiom,(
    ! [VarCurr] :
      ( v2225(VarCurr)
    <=> ( v2226(VarCurr)
        & v2246(VarCurr) ) ) )).

fof(writeUnaryOperator_204,axiom,(
    ! [VarCurr] :
      ( ~ v2246(VarCurr)
    <=> v1932(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_433,axiom,(
    ! [VarCurr] :
      ( v2226(VarCurr)
    <=> ( v2227(VarCurr)
        | v2244(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_432,axiom,(
    ! [VarCurr] :
      ( v2244(VarCurr)
    <=> ( v2039(VarCurr)
        & v2245(VarCurr) ) ) )).

fof(writeUnaryOperator_203,axiom,(
    ! [VarCurr] :
      ( ~ v2245(VarCurr)
    <=> v2043(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_431,axiom,(
    ! [VarCurr] :
      ( v2227(VarCurr)
    <=> ( v2228(VarCurr)
        & v2043(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_430,axiom,(
    ! [VarCurr] :
      ( v2228(VarCurr)
    <=> ( v2229(VarCurr)
        | v2238(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_429,axiom,(
    ! [VarCurr] :
      ( v2238(VarCurr)
    <=> ( v2239(VarCurr)
        & v2243(VarCurr) ) ) )).

fof(addBitVectorEqualityBitBlasted_79,axiom,(
    ! [VarCurr] :
      ( v2243(VarCurr)
    <=> ( ( v2231(VarCurr,bitIndex2)
        <=> $false )
        & ( v2231(VarCurr,bitIndex1)
        <=> $false )
        & ( v2231(VarCurr,bitIndex0)
        <=> $true ) ) ) )).

fof(bitBlastConstant_451,axiom,(
    ~ b001(bitIndex2) )).

fof(bitBlastConstant_450,axiom,(
    ~ b001(bitIndex1) )).

fof(bitBlastConstant_449,axiom,(
    b001(bitIndex0) )).

fof(writeBinaryOperatorEqualRangesSingleBits_428,axiom,(
    ! [VarCurr] :
      ( v2239(VarCurr)
    <=> ( v2240(VarCurr)
        | v2241(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_427,axiom,(
    ! [VarCurr] :
      ( v2241(VarCurr)
    <=> ( v2039(VarCurr)
        & v2242(VarCurr) ) ) )).

fof(writeUnaryOperator_202,axiom,(
    ! [VarCurr] :
      ( ~ v2242(VarCurr)
    <=> v2240(VarCurr) ) )).

fof(addBitVectorEqualityBitBlasted_78,axiom,(
    ! [VarCurr] :
      ( v2240(VarCurr)
    <=> ( v1964(VarCurr)
      <=> $true ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_426,axiom,(
    ! [VarCurr] :
      ( v2229(VarCurr)
    <=> ( v2230(VarCurr)
        | v2232(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_425,axiom,(
    ! [VarCurr] :
      ( v2232(VarCurr)
    <=> ( v2233(VarCurr)
        & v2237(VarCurr) ) ) )).

fof(addBitVectorEqualityBitBlasted_77,axiom,(
    ! [VarCurr] :
      ( v2237(VarCurr)
    <=> ( ( v2231(VarCurr,bitIndex2)
        <=> $false )
        & ( v2231(VarCurr,bitIndex1)
        <=> $true )
        & ( v2231(VarCurr,bitIndex0)
        <=> $false ) ) ) )).

fof(bitBlastConstant_448,axiom,(
    ~ b010(bitIndex2) )).

fof(bitBlastConstant_447,axiom,(
    b010(bitIndex1) )).

fof(bitBlastConstant_446,axiom,(
    ~ b010(bitIndex0) )).

fof(writeBinaryOperatorEqualRangesSingleBits_424,axiom,(
    ! [VarCurr] :
      ( v2233(VarCurr)
    <=> ( v2234(VarCurr)
        | v2235(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_423,axiom,(
    ! [VarCurr] :
      ( v2235(VarCurr)
    <=> ( v2039(VarCurr)
        & v2236(VarCurr) ) ) )).

fof(writeUnaryOperator_201,axiom,(
    ! [VarCurr] :
      ( ~ v2236(VarCurr)
    <=> v2234(VarCurr) ) )).

fof(addBitVectorEqualityBitBlasted_76,axiom,(
    ! [VarCurr] :
      ( v2234(VarCurr)
    <=> ( v1964(VarCurr)
      <=> $true ) ) )).

fof(addBitVectorEqualityBitBlasted_75,axiom,(
    ! [VarCurr] :
      ( v2230(VarCurr)
    <=> ( ( v2231(VarCurr,bitIndex2)
        <=> $true )
        & ( v2231(VarCurr,bitIndex1)
        <=> $false )
        & ( v2231(VarCurr,bitIndex0)
        <=> $false ) ) ) )).

fof(bitBlastConstant_445,axiom,(
    b100(bitIndex2) )).

fof(bitBlastConstant_444,axiom,(
    ~ b100(bitIndex1) )).

fof(bitBlastConstant_443,axiom,(
    ~ b100(bitIndex0) )).

fof(addAssignment_466,axiom,(
    ! [VarCurr] :
      ( v2231(VarCurr,bitIndex0)
    <=> v1961(VarCurr) ) )).

fof(addAssignment_465,axiom,(
    ! [VarCurr] :
      ( v2231(VarCurr,bitIndex1)
    <=> v1959(VarCurr) ) )).

fof(addAssignment_464,axiom,(
    ! [VarCurr] :
      ( v2231(VarCurr,bitIndex2)
    <=> v1957(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_422,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( v2215(VarNext)
      <=> ( v2216(VarNext)
          & v2205(VarNext) ) ) ) )).

fof(writeUnaryOperator_200,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( ~ v2216(VarNext)
      <=> v2218(VarNext) ) ) )).

fof(addAssignment_463,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( v2218(VarNext)
      <=> v2205(VarCurr) ) ) )).

fof(addAssignment_462,axiom,(
    ! [VarCurr] :
      ( v2205(VarCurr)
    <=> v2207(VarCurr) ) )).

fof(addAssignment_461,axiom,(
    ! [VarCurr] :
      ( v2207(VarCurr)
    <=> v2209(VarCurr) ) )).

fof(addAssignment_460,axiom,(
    ! [VarCurr] :
      ( v2209(VarCurr)
    <=> v2211(VarCurr) ) )).

fof(addAssignment_459,axiom,(
    ! [VarCurr] :
      ( v2211(VarCurr)
    <=> v2015(VarCurr) ) )).

fof(addAssignment_458,axiom,(
    ! [VarCurr] :
      ( v2203(VarCurr)
    <=> $false ) )).

fof(addAssignment_457,axiom,(
    ! [VarCurr] :
      ( v2043(VarCurr)
    <=> v2045(VarCurr) ) )).

fof(addAssignment_456,axiom,(
    ! [VarCurr] :
      ( v2045(VarCurr)
    <=> v2047(VarCurr) ) )).

fof(addAssignment_455,axiom,(
    ! [VarCurr] :
      ( v2047(VarCurr)
    <=> v2049(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_421,axiom,(
    ! [VarCurr] :
      ( v2049(VarCurr)
    <=> ( v2051(VarCurr)
        & v2151(VarCurr) ) ) )).

fof(addAssignment_454,axiom,(
    ! [VarCurr] :
      ( v2151(VarCurr)
    <=> v2153(VarCurr) ) )).

fof(addAssignment_453,axiom,(
    ! [VarCurr] :
      ( v2153(VarCurr)
    <=> v2155(VarCurr) ) )).

fof(addAssignment_452,axiom,(
    ! [VarCurr] :
      ( v2155(VarCurr)
    <=> v2157(VarCurr) ) )).

fof(addAssignment_451,axiom,(
    ! [VarCurr] :
      ( v2157(VarCurr)
    <=> v2159(VarCurr) ) )).

fof(addAssignment_450,axiom,(
    ! [VarCurr] :
      ( v2159(VarCurr)
    <=> v2161(VarCurr) ) )).

fof(addAssignment_449,axiom,(
    ! [VarCurr] :
      ( v2161(VarCurr)
    <=> v2163(VarCurr) ) )).

fof(addCaseBooleanConditionEqualRanges1_22,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( ~ v2190(VarNext)
       => ( v2163(VarNext)
        <=> v2163(VarCurr) ) ) ) )).

fof(addCaseBooleanConditionEqualRanges0_34,axiom,(
    ! [VarNext] :
      ( v2190(VarNext)
     => ( v2163(VarNext)
      <=> v2198(VarNext) ) ) )).

fof(addAssignment_448,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( v2198(VarNext)
      <=> v2196(VarCurr) ) ) )).

fof(aaddConditionBooleanCondEqualRangesElseBranch_62,axiom,(
    ! [VarCurr] :
      ( ~ v2035(VarCurr)
     => ( v2196(VarCurr)
      <=> v2165(VarCurr) ) ) )).

fof(addConditionBooleanCondEqualRangesThenBranch_65,axiom,(
    ! [VarCurr] :
      ( v2035(VarCurr)
     => ( v2196(VarCurr)
      <=> $false ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_420,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( v2190(VarNext)
      <=> v2191(VarNext) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_419,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( v2191(VarNext)
      <=> ( v2193(VarNext)
          & v2013(VarNext) ) ) ) )).

fof(writeUnaryOperator_199,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( ~ v2193(VarNext)
      <=> v2028(VarNext) ) ) )).

fof(addAssignmentInitValueVector_22,axiom,
    ( v2163(constB0)
  <=> $false )).

fof(addAssignment_447,axiom,(
    ! [VarCurr] :
      ( v2165(VarCurr)
    <=> v2167(VarCurr) ) )).

fof(addAssignment_446,axiom,(
    ! [VarCurr] :
      ( v2167(VarCurr)
    <=> v2169(VarCurr) ) )).

fof(addAssignment_445,axiom,(
    ! [VarCurr] :
      ( v2169(VarCurr)
    <=> v2171(VarCurr) ) )).

fof(addAssignment_444,axiom,(
    ! [VarCurr] :
      ( v2171(VarCurr)
    <=> v2173(VarCurr) ) )).

fof(addAssignment_443,axiom,(
    ! [VarCurr] :
      ( v2173(VarCurr)
    <=> v2175(VarCurr) ) )).

fof(addAssignment_442,axiom,(
    ! [VarCurr] :
      ( v2175(VarCurr)
    <=> v2177(VarCurr) ) )).

fof(addAssignment_441,axiom,(
    ! [VarCurr] :
      ( v2177(VarCurr)
    <=> v2179(VarCurr) ) )).

fof(addAssignment_440,axiom,(
    ! [VarCurr] :
      ( v2179(VarCurr)
    <=> v2181(VarCurr) ) )).

fof(addAssignment_439,axiom,(
    ! [VarCurr] :
      ( v2181(VarCurr)
    <=> v2183(VarCurr) ) )).

fof(addAssignment_438,axiom,(
    ! [VarCurr] :
      ( v2183(VarCurr)
    <=> v2185(VarCurr) ) )).

fof(addAssignment_437,axiom,(
    ! [VarCurr] :
      ( v2185(VarCurr)
    <=> v2187(VarCurr) ) )).

fof(addAssignmentInitValueVector_21,axiom,
    ( v2187(constB0)
  <=> $false )).

fof(addAssignment_436,axiom,(
    ! [VarCurr] :
      ( v2051(VarCurr)
    <=> v2053(VarCurr) ) )).

fof(addAssignment_435,axiom,(
    ! [VarCurr] :
      ( v2053(VarCurr)
    <=> v2055(VarCurr) ) )).

fof(addAssignment_434,axiom,(
    ! [VarCurr] :
      ( v2055(VarCurr)
    <=> v2057(VarCurr) ) )).

fof(addAssignment_433,axiom,(
    ! [VarCurr] :
      ( v2057(VarCurr)
    <=> v2059(VarCurr) ) )).

fof(addAssignment_432,axiom,(
    ! [VarCurr] :
      ( v2059(VarCurr)
    <=> v2061(VarCurr) ) )).

fof(addCaseBooleanConditionEqualRanges1_21,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( ~ v2136(VarNext)
       => ( v2061(VarNext)
        <=> v2061(VarCurr) ) ) ) )).

fof(addCaseBooleanConditionEqualRanges0_33,axiom,(
    ! [VarNext] :
      ( v2136(VarNext)
     => ( v2061(VarNext)
      <=> v2144(VarNext) ) ) )).

fof(addAssignment_431,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( v2144(VarNext)
      <=> v2142(VarCurr) ) ) )).

fof(aaddConditionBooleanCondEqualRangesElseBranch_61,axiom,(
    ! [VarCurr] :
      ( ~ v2145(VarCurr)
     => ( v2142(VarCurr)
      <=> v2146(VarCurr) ) ) )).

fof(addConditionBooleanCondEqualRangesThenBranch_64,axiom,(
    ! [VarCurr] :
      ( v2145(VarCurr)
     => ( v2142(VarCurr)
      <=> $false ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_418,axiom,(
    ! [VarCurr] :
      ( v2146(VarCurr)
    <=> ( v2147(VarCurr)
        & v2065(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_417,axiom,(
    ! [VarCurr] :
      ( v2147(VarCurr)
    <=> ( $true
        & v2063(VarCurr) ) ) )).

fof(addAssignmentInitValueVector_20,axiom,
    ( v2063(constB0)
  <=> $false )).

fof(writeUnaryOperator_198,axiom,(
    ! [VarCurr] :
      ( ~ v2145(VarCurr)
    <=> v1984(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_416,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( v2136(VarNext)
      <=> v2137(VarNext) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_415,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( v2137(VarNext)
      <=> ( v2138(VarNext)
          & v2013(VarNext) ) ) ) )).

fof(writeUnaryOperator_197,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( ~ v2138(VarNext)
      <=> v2028(VarNext) ) ) )).

fof(addAssignmentInitValueVector_19,axiom,
    ( v2061(constB0)
  <=> $false )).

fof(aaddConditionBooleanCondEqualRangesElseBranch_60,axiom,(
    ! [VarCurr] :
      ( ~ v2128(VarCurr)
     => ( v2065(VarCurr)
      <=> v2129(VarCurr) ) ) )).

fof(addConditionBooleanCondEqualRangesThenBranch_63,axiom,(
    ! [VarCurr] :
      ( v2128(VarCurr)
     => ( v2065(VarCurr)
      <=> $false ) ) )).

fof(addParallelCaseBooleanConditionEqualRanges2_5,axiom,(
    ! [VarCurr] :
      ( ( ~ v2130(VarCurr)
        & ~ v2132(VarCurr) )
     => ( v2129(VarCurr)
      <=> $false ) ) )).

fof(addParallelCaseBooleanConditionEqualRanges1_12,axiom,(
    ! [VarCurr] :
      ( v2132(VarCurr)
     => ( v2129(VarCurr)
      <=> v2133(VarCurr) ) ) )).

fof(addParallelCaseBooleanConditionEqualRanges0_12,axiom,(
    ! [VarCurr] :
      ( v2130(VarCurr)
     => ( v2129(VarCurr)
      <=> v2131(VarCurr) ) ) )).

fof(addBitVectorEqualityBitBlasted_74,axiom,(
    ! [VarCurr] :
      ( v2133(VarCurr)
    <=> ( ( v2101(VarCurr,bitIndex26)
        <=> $false )
        & ( v2101(VarCurr,bitIndex25)
        <=> $false )
        & ( v2101(VarCurr,bitIndex24)
        <=> $false )
        & ( v2101(VarCurr,bitIndex23)
        <=> $false )
        & ( v2101(VarCurr,bitIndex22)
        <=> $false )
        & ( v2101(VarCurr,bitIndex21)
        <=> $false )
        & ( v2101(VarCurr,bitIndex20)
        <=> $false )
        & ( v2101(VarCurr,bitIndex19)
        <=> $true )
        & ( v2101(VarCurr,bitIndex18)
        <=> $true )
        & ( v2101(VarCurr,bitIndex17)
        <=> $true )
        & ( v2101(VarCurr,bitIndex16)
        <=> $false )
        & ( v2101(VarCurr,bitIndex15)
        <=> $false )
        & ( v2101(VarCurr,bitIndex14)
        <=> $true )
        & ( v2101(VarCurr,bitIndex13)
        <=> $true )
        & ( v2101(VarCurr,bitIndex12)
        <=> $false )
        & ( v2101(VarCurr,bitIndex11)
        <=> $true )
        & ( v2101(VarCurr,bitIndex10)
        <=> $false )
        & ( v2101(VarCurr,bitIndex9)
        <=> $false )
        & ( v2101(VarCurr,bitIndex8)
        <=> $false )
        & ( v2101(VarCurr,bitIndex7)
        <=> $false )
        & ( v2101(VarCurr,bitIndex6)
        <=> $false )
        & ( v2101(VarCurr,bitIndex5)
        <=> $false )
        & ( v2101(VarCurr,bitIndex4)
        <=> $false )
        & ( v2101(VarCurr,bitIndex3)
        <=> $false )
        & ( v2101(VarCurr,bitIndex2)
        <=> $false )
        & ( v2101(VarCurr,bitIndex1)
        <=> $true )
        & ( v2101(VarCurr,bitIndex0)
        <=> $true ) ) ) )).

fof(bitBlastConstant_442,axiom,(
    ~ b000000011100110100000000011(bitIndex26) )).

fof(bitBlastConstant_441,axiom,(
    ~ b000000011100110100000000011(bitIndex25) )).

fof(bitBlastConstant_440,axiom,(
    ~ b000000011100110100000000011(bitIndex24) )).

fof(bitBlastConstant_439,axiom,(
    ~ b000000011100110100000000011(bitIndex23) )).

fof(bitBlastConstant_438,axiom,(
    ~ b000000011100110100000000011(bitIndex22) )).

fof(bitBlastConstant_437,axiom,(
    ~ b000000011100110100000000011(bitIndex21) )).

fof(bitBlastConstant_436,axiom,(
    ~ b000000011100110100000000011(bitIndex20) )).

fof(bitBlastConstant_435,axiom,(
    b000000011100110100000000011(bitIndex19) )).

fof(bitBlastConstant_434,axiom,(
    b000000011100110100000000011(bitIndex18) )).

fof(bitBlastConstant_433,axiom,(
    b000000011100110100000000011(bitIndex17) )).

fof(bitBlastConstant_432,axiom,(
    ~ b000000011100110100000000011(bitIndex16) )).

fof(bitBlastConstant_431,axiom,(
    ~ b000000011100110100000000011(bitIndex15) )).

fof(bitBlastConstant_430,axiom,(
    b000000011100110100000000011(bitIndex14) )).

fof(bitBlastConstant_429,axiom,(
    b000000011100110100000000011(bitIndex13) )).

fof(bitBlastConstant_428,axiom,(
    ~ b000000011100110100000000011(bitIndex12) )).

fof(bitBlastConstant_427,axiom,(
    b000000011100110100000000011(bitIndex11) )).

fof(bitBlastConstant_426,axiom,(
    ~ b000000011100110100000000011(bitIndex10) )).

fof(bitBlastConstant_425,axiom,(
    ~ b000000011100110100000000011(bitIndex9) )).

fof(bitBlastConstant_424,axiom,(
    ~ b000000011100110100000000011(bitIndex8) )).

fof(bitBlastConstant_423,axiom,(
    ~ b000000011100110100000000011(bitIndex7) )).

fof(bitBlastConstant_422,axiom,(
    ~ b000000011100110100000000011(bitIndex6) )).

fof(bitBlastConstant_421,axiom,(
    ~ b000000011100110100000000011(bitIndex5) )).

fof(bitBlastConstant_420,axiom,(
    ~ b000000011100110100000000011(bitIndex4) )).

fof(bitBlastConstant_419,axiom,(
    ~ b000000011100110100000000011(bitIndex3) )).

fof(bitBlastConstant_418,axiom,(
    ~ b000000011100110100000000011(bitIndex2) )).

fof(bitBlastConstant_417,axiom,(
    b000000011100110100000000011(bitIndex1) )).

fof(bitBlastConstant_416,axiom,(
    b000000011100110100000000011(bitIndex0) )).

fof(addBitVectorEqualityBitBlasted_73,axiom,(
    ! [VarCurr] :
      ( v2132(VarCurr)
    <=> ( v2091(VarCurr)
      <=> $true ) ) )).

fof(addBitVectorEqualityBitBlasted_72,axiom,(
    ! [VarCurr] :
      ( v2131(VarCurr)
    <=> ( ( v2101(VarCurr,bitIndex26)
        <=> $false )
        & ( v2101(VarCurr,bitIndex25)
        <=> $false )
        & ( v2101(VarCurr,bitIndex24)
        <=> $false )
        & ( v2101(VarCurr,bitIndex23)
        <=> $false )
        & ( v2101(VarCurr,bitIndex22)
        <=> $false )
        & ( v2101(VarCurr,bitIndex21)
        <=> $false )
        & ( v2101(VarCurr,bitIndex20)
        <=> $false )
        & ( v2101(VarCurr,bitIndex19)
        <=> $true )
        & ( v2101(VarCurr,bitIndex18)
        <=> $true )
        & ( v2101(VarCurr,bitIndex17)
        <=> $false )
        & ( v2101(VarCurr,bitIndex16)
        <=> $false )
        & ( v2101(VarCurr,bitIndex15)
        <=> $false )
        & ( v2101(VarCurr,bitIndex14)
        <=> $true )
        & ( v2101(VarCurr,bitIndex13)
        <=> $true )
        & ( v2101(VarCurr,bitIndex12)
        <=> $false )
        & ( v2101(VarCurr,bitIndex11)
        <=> $true )
        & ( v2101(VarCurr,bitIndex10)
        <=> $false )
        & ( v2101(VarCurr,bitIndex9)
        <=> $false )
        & ( v2101(VarCurr,bitIndex8)
        <=> $false )
        & ( v2101(VarCurr,bitIndex7)
        <=> $false )
        & ( v2101(VarCurr,bitIndex6)
        <=> $false )
        & ( v2101(VarCurr,bitIndex5)
        <=> $false )
        & ( v2101(VarCurr,bitIndex4)
        <=> $false )
        & ( v2101(VarCurr,bitIndex3)
        <=> $false )
        & ( v2101(VarCurr,bitIndex2)
        <=> $false )
        & ( v2101(VarCurr,bitIndex1)
        <=> $true )
        & ( v2101(VarCurr,bitIndex0)
        <=> $true ) ) ) )).

fof(bitBlastConstant_415,axiom,(
    ~ b000000011000110100000000011(bitIndex26) )).

fof(bitBlastConstant_414,axiom,(
    ~ b000000011000110100000000011(bitIndex25) )).

fof(bitBlastConstant_413,axiom,(
    ~ b000000011000110100000000011(bitIndex24) )).

fof(bitBlastConstant_412,axiom,(
    ~ b000000011000110100000000011(bitIndex23) )).

fof(bitBlastConstant_411,axiom,(
    ~ b000000011000110100000000011(bitIndex22) )).

fof(bitBlastConstant_410,axiom,(
    ~ b000000011000110100000000011(bitIndex21) )).

fof(bitBlastConstant_409,axiom,(
    ~ b000000011000110100000000011(bitIndex20) )).

fof(bitBlastConstant_408,axiom,(
    b000000011000110100000000011(bitIndex19) )).

fof(bitBlastConstant_407,axiom,(
    b000000011000110100000000011(bitIndex18) )).

fof(bitBlastConstant_406,axiom,(
    ~ b000000011000110100000000011(bitIndex17) )).

fof(bitBlastConstant_405,axiom,(
    ~ b000000011000110100000000011(bitIndex16) )).

fof(bitBlastConstant_404,axiom,(
    ~ b000000011000110100000000011(bitIndex15) )).

fof(bitBlastConstant_403,axiom,(
    b000000011000110100000000011(bitIndex14) )).

fof(bitBlastConstant_402,axiom,(
    b000000011000110100000000011(bitIndex13) )).

fof(bitBlastConstant_401,axiom,(
    ~ b000000011000110100000000011(bitIndex12) )).

fof(bitBlastConstant_400,axiom,(
    b000000011000110100000000011(bitIndex11) )).

fof(bitBlastConstant_399,axiom,(
    ~ b000000011000110100000000011(bitIndex10) )).

fof(bitBlastConstant_398,axiom,(
    ~ b000000011000110100000000011(bitIndex9) )).

fof(bitBlastConstant_397,axiom,(
    ~ b000000011000110100000000011(bitIndex8) )).

fof(bitBlastConstant_396,axiom,(
    ~ b000000011000110100000000011(bitIndex7) )).

fof(bitBlastConstant_395,axiom,(
    ~ b000000011000110100000000011(bitIndex6) )).

fof(bitBlastConstant_394,axiom,(
    ~ b000000011000110100000000011(bitIndex5) )).

fof(bitBlastConstant_393,axiom,(
    ~ b000000011000110100000000011(bitIndex4) )).

fof(bitBlastConstant_392,axiom,(
    ~ b000000011000110100000000011(bitIndex3) )).

fof(bitBlastConstant_391,axiom,(
    ~ b000000011000110100000000011(bitIndex2) )).

fof(bitBlastConstant_390,axiom,(
    b000000011000110100000000011(bitIndex1) )).

fof(bitBlastConstant_389,axiom,(
    b000000011000110100000000011(bitIndex0) )).

fof(addBitVectorEqualityBitBlasted_71,axiom,(
    ! [VarCurr] :
      ( v2130(VarCurr)
    <=> ( v2091(VarCurr)
      <=> $false ) ) )).

fof(writeUnaryOperator_196,axiom,(
    ! [VarCurr] :
      ( ~ v2128(VarCurr)
    <=> v2067(VarCurr) ) )).

fof(addAssignment_430,axiom,(
    ! [VarCurr,B] :
      ( range_26_0(B)
     => ( v2101(VarCurr,B)
      <=> v2103(VarCurr,B) ) ) )).

fof(addAssignment_429,axiom,(
    ! [VarCurr,B] :
      ( range_26_0(B)
     => ( v2103(VarCurr,B)
      <=> v2105(VarCurr,B) ) ) )).

fof(addAssignment_428,axiom,(
    ! [VarCurr,B] :
      ( range_26_0(B)
     => ( v2105(VarCurr,B)
      <=> v2107(VarCurr,B) ) ) )).

fof(addAssignment_427,axiom,(
    ! [VarCurr,B] :
      ( range_26_0(B)
     => ( v2107(VarCurr,B)
      <=> v2109(VarCurr,B) ) ) )).

fof(addAssignment_426,axiom,(
    ! [VarCurr,B] :
      ( range_26_0(B)
     => ( v2109(VarCurr,B)
      <=> v2111(VarCurr,B) ) ) )).

fof(addAssignment_425,axiom,(
    ! [VarCurr,B] :
      ( range_26_0(B)
     => ( v2111(VarCurr,B)
      <=> v2113(VarCurr,B) ) ) )).

fof(addAssignment_424,axiom,(
    ! [VarCurr,B] :
      ( range_26_0(B)
     => ( v2113(VarCurr,B)
      <=> v2115(VarCurr,B) ) ) )).

fof(addAssignment_423,axiom,(
    ! [VarCurr,B] :
      ( range_26_0(B)
     => ( v2115(VarCurr,B)
      <=> v2117(VarCurr,B) ) ) )).

fof(addAssignment_422,axiom,(
    ! [VarCurr,B] :
      ( range_26_0(B)
     => ( v2117(VarCurr,B)
      <=> v2119(VarCurr,B) ) ) )).

fof(addAssignment_421,axiom,(
    ! [VarCurr,B] :
      ( range_26_0(B)
     => ( v2119(VarCurr,B)
      <=> v2121(VarCurr,B) ) ) )).

fof(addAssignment_420,axiom,(
    ! [VarCurr,B] :
      ( range_26_0(B)
     => ( v2121(VarCurr,B)
      <=> v2123(VarCurr,B) ) ) )).

fof(addAssignmentInitValueVector_18,axiom,(
    ! [B] :
      ( range_26_0(B)
     => ( v2123(constB0,B)
      <=> $false ) ) )).

fof(range_axiom_15,axiom,(
    ! [B] :
      ( range_26_0(B)
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
        | bitIndex26 = B ) ) )).

fof(bitBlastConstant_388,axiom,(
    ~ b000000000000000000000000000(bitIndex26) )).

fof(bitBlastConstant_387,axiom,(
    ~ b000000000000000000000000000(bitIndex25) )).

fof(bitBlastConstant_386,axiom,(
    ~ b000000000000000000000000000(bitIndex24) )).

fof(bitBlastConstant_385,axiom,(
    ~ b000000000000000000000000000(bitIndex23) )).

fof(bitBlastConstant_384,axiom,(
    ~ b000000000000000000000000000(bitIndex22) )).

fof(bitBlastConstant_383,axiom,(
    ~ b000000000000000000000000000(bitIndex21) )).

fof(bitBlastConstant_382,axiom,(
    ~ b000000000000000000000000000(bitIndex20) )).

fof(bitBlastConstant_381,axiom,(
    ~ b000000000000000000000000000(bitIndex19) )).

fof(bitBlastConstant_380,axiom,(
    ~ b000000000000000000000000000(bitIndex18) )).

fof(bitBlastConstant_379,axiom,(
    ~ b000000000000000000000000000(bitIndex17) )).

fof(bitBlastConstant_378,axiom,(
    ~ b000000000000000000000000000(bitIndex16) )).

fof(bitBlastConstant_377,axiom,(
    ~ b000000000000000000000000000(bitIndex15) )).

fof(bitBlastConstant_376,axiom,(
    ~ b000000000000000000000000000(bitIndex14) )).

fof(bitBlastConstant_375,axiom,(
    ~ b000000000000000000000000000(bitIndex13) )).

fof(bitBlastConstant_374,axiom,(
    ~ b000000000000000000000000000(bitIndex12) )).

fof(bitBlastConstant_373,axiom,(
    ~ b000000000000000000000000000(bitIndex11) )).

fof(bitBlastConstant_372,axiom,(
    ~ b000000000000000000000000000(bitIndex10) )).

fof(bitBlastConstant_371,axiom,(
    ~ b000000000000000000000000000(bitIndex9) )).

fof(bitBlastConstant_370,axiom,(
    ~ b000000000000000000000000000(bitIndex8) )).

fof(bitBlastConstant_369,axiom,(
    ~ b000000000000000000000000000(bitIndex7) )).

fof(bitBlastConstant_368,axiom,(
    ~ b000000000000000000000000000(bitIndex6) )).

fof(bitBlastConstant_367,axiom,(
    ~ b000000000000000000000000000(bitIndex5) )).

fof(bitBlastConstant_366,axiom,(
    ~ b000000000000000000000000000(bitIndex4) )).

fof(bitBlastConstant_365,axiom,(
    ~ b000000000000000000000000000(bitIndex3) )).

fof(bitBlastConstant_364,axiom,(
    ~ b000000000000000000000000000(bitIndex2) )).

fof(bitBlastConstant_363,axiom,(
    ~ b000000000000000000000000000(bitIndex1) )).

fof(bitBlastConstant_362,axiom,(
    ~ b000000000000000000000000000(bitIndex0) )).

fof(addAssignment_419,axiom,(
    ! [VarCurr] :
      ( v2091(VarCurr)
    <=> v2093(VarCurr) ) )).

fof(addAssignment_418,axiom,(
    ! [VarCurr] :
      ( v2093(VarCurr)
    <=> v2095(VarCurr) ) )).

fof(addAssignment_417,axiom,(
    ! [VarCurr] :
      ( v2095(VarCurr)
    <=> v2097(VarCurr) ) )).

fof(addAssignment_416,axiom,(
    ! [VarCurr] :
      ( v2097(VarCurr)
    <=> v2099(VarCurr) ) )).

fof(addAssignment_415,axiom,(
    ! [VarCurr] :
      ( v2067(VarCurr)
    <=> v2069(VarCurr) ) )).

fof(addAssignment_414,axiom,(
    ! [VarCurr] :
      ( v2069(VarCurr)
    <=> v2071(VarCurr) ) )).

fof(addAssignment_413,axiom,(
    ! [VarCurr] :
      ( v2071(VarCurr)
    <=> v2073(VarCurr) ) )).

fof(addAssignment_412,axiom,(
    ! [VarCurr] :
      ( v2073(VarCurr)
    <=> v2075(VarCurr) ) )).

fof(addAssignment_411,axiom,(
    ! [VarCurr] :
      ( v2075(VarCurr)
    <=> v2077(VarCurr) ) )).

fof(addAssignment_410,axiom,(
    ! [VarCurr] :
      ( v2077(VarCurr)
    <=> v2079(VarCurr) ) )).

fof(addAssignment_409,axiom,(
    ! [VarCurr] :
      ( v2079(VarCurr)
    <=> v2081(VarCurr) ) )).

fof(addAssignment_408,axiom,(
    ! [VarCurr] :
      ( v2081(VarCurr)
    <=> v2083(VarCurr) ) )).

fof(addAssignment_407,axiom,(
    ! [VarCurr] :
      ( v2083(VarCurr)
    <=> v2085(VarCurr) ) )).

fof(addAssignment_406,axiom,(
    ! [VarCurr] :
      ( v2085(VarCurr)
    <=> v2087(VarCurr) ) )).

fof(addAssignment_405,axiom,(
    ! [VarCurr] :
      ( v2087(VarCurr)
    <=> v2089(VarCurr) ) )).

fof(addAssignmentInitValueVector_17,axiom,
    ( v2089(constB0)
  <=> $true )).

fof(addAssignment_404,axiom,(
    ! [VarCurr] :
      ( v2039(VarCurr)
    <=> $false ) )).

fof(addAssignment_403,axiom,(
    ! [VarCurr] :
      ( v1964(VarCurr)
    <=> v1966(VarCurr,bitIndex0) ) )).

fof(addAssignment_402,axiom,(
    ! [VarCurr] :
      ( v1966(VarCurr,bitIndex0)
    <=> v1968(VarCurr,bitIndex0) ) )).

fof(addAssignment_401,axiom,(
    ! [VarCurr] :
      ( v1968(VarCurr,bitIndex0)
    <=> v1970(VarCurr,bitIndex0) ) )).

fof(addAssignment_400,axiom,(
    ! [VarCurr] :
      ( v1970(VarCurr,bitIndex0)
    <=> v1972(VarCurr,bitIndex0) ) )).

fof(addAssignment_399,axiom,(
    ! [VarCurr] :
      ( v1972(VarCurr,bitIndex0)
    <=> v1974(VarCurr,bitIndex0) ) )).

fof(addAssignment_398,axiom,(
    ! [VarCurr] :
      ( v1974(VarCurr,bitIndex0)
    <=> v1976(VarCurr,bitIndex0) ) )).

fof(addAssignment_397,axiom,(
    ! [VarCurr] :
      ( v1976(VarCurr,bitIndex0)
    <=> v1978(VarCurr,bitIndex0) ) )).

fof(addAssignment_396,axiom,(
    ! [VarCurr] :
      ( v1978(VarCurr,bitIndex0)
    <=> v1980(VarCurr,bitIndex0) ) )).

fof(addAssignment_395,axiom,(
    ! [VarCurr] :
      ( v1980(VarCurr,bitIndex0)
    <=> v1982(VarCurr,bitIndex0) ) )).

fof(addAssignment_394,axiom,(
    ! [VarNext] :
      ( v1982(VarNext,bitIndex0)
    <=> v2023(VarNext,bitIndex0) ) )).

fof(addCaseBooleanConditionEqualRanges1_20,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( ~ v2024(VarNext)
       => ! [B] :
            ( range_63_0(B)
           => ( v2023(VarNext,B)
            <=> v1982(VarCurr,B) ) ) ) ) )).

fof(addCaseBooleanConditionEqualRanges0_32,axiom,(
    ! [VarNext] :
      ( v2024(VarNext)
     => ! [B] :
          ( range_63_0(B)
         => ( v2023(VarNext,B)
          <=> v2034(VarNext,B) ) ) ) )).

fof(addAssignment_393,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ! [B] :
          ( range_63_0(B)
         => ( v2034(VarNext,B)
          <=> v2032(VarCurr,B) ) ) ) )).

fof(aaddConditionBooleanCondEqualRangesElseBranch_59,axiom,(
    ! [VarCurr] :
      ( ~ v2035(VarCurr)
     => ! [B] :
          ( range_63_0(B)
         => ( v2032(VarCurr,B)
          <=> v1987(VarCurr,B) ) ) ) )).

fof(addConditionBooleanCondEqualRangesThenBranch_62,axiom,(
    ! [VarCurr] :
      ( v2035(VarCurr)
     => ! [B] :
          ( range_63_0(B)
         => ( v2032(VarCurr,B)
          <=> $false ) ) ) )).

fof(range_axiom_14,axiom,(
    ! [B] :
      ( range_63_0(B)
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
        | bitIndex63 = B ) ) )).

fof(bitBlastConstant_361,axiom,(
    ~ b0000000000000000000000000000000000000000000000000000000000000000(bitIndex63) )).

fof(bitBlastConstant_360,axiom,(
    ~ b0000000000000000000000000000000000000000000000000000000000000000(bitIndex62) )).

fof(bitBlastConstant_359,axiom,(
    ~ b0000000000000000000000000000000000000000000000000000000000000000(bitIndex61) )).

fof(bitBlastConstant_358,axiom,(
    ~ b0000000000000000000000000000000000000000000000000000000000000000(bitIndex60) )).

fof(bitBlastConstant_357,axiom,(
    ~ b0000000000000000000000000000000000000000000000000000000000000000(bitIndex59) )).

fof(bitBlastConstant_356,axiom,(
    ~ b0000000000000000000000000000000000000000000000000000000000000000(bitIndex58) )).

fof(bitBlastConstant_355,axiom,(
    ~ b0000000000000000000000000000000000000000000000000000000000000000(bitIndex57) )).

fof(bitBlastConstant_354,axiom,(
    ~ b0000000000000000000000000000000000000000000000000000000000000000(bitIndex56) )).

fof(bitBlastConstant_353,axiom,(
    ~ b0000000000000000000000000000000000000000000000000000000000000000(bitIndex55) )).

fof(bitBlastConstant_352,axiom,(
    ~ b0000000000000000000000000000000000000000000000000000000000000000(bitIndex54) )).

fof(bitBlastConstant_351,axiom,(
    ~ b0000000000000000000000000000000000000000000000000000000000000000(bitIndex53) )).

fof(bitBlastConstant_350,axiom,(
    ~ b0000000000000000000000000000000000000000000000000000000000000000(bitIndex52) )).

fof(bitBlastConstant_349,axiom,(
    ~ b0000000000000000000000000000000000000000000000000000000000000000(bitIndex51) )).

fof(bitBlastConstant_348,axiom,(
    ~ b0000000000000000000000000000000000000000000000000000000000000000(bitIndex50) )).

fof(bitBlastConstant_347,axiom,(
    ~ b0000000000000000000000000000000000000000000000000000000000000000(bitIndex49) )).

fof(bitBlastConstant_346,axiom,(
    ~ b0000000000000000000000000000000000000000000000000000000000000000(bitIndex48) )).

fof(bitBlastConstant_345,axiom,(
    ~ b0000000000000000000000000000000000000000000000000000000000000000(bitIndex47) )).

fof(bitBlastConstant_344,axiom,(
    ~ b0000000000000000000000000000000000000000000000000000000000000000(bitIndex46) )).

fof(bitBlastConstant_343,axiom,(
    ~ b0000000000000000000000000000000000000000000000000000000000000000(bitIndex45) )).

fof(bitBlastConstant_342,axiom,(
    ~ b0000000000000000000000000000000000000000000000000000000000000000(bitIndex44) )).

fof(bitBlastConstant_341,axiom,(
    ~ b0000000000000000000000000000000000000000000000000000000000000000(bitIndex43) )).

fof(bitBlastConstant_340,axiom,(
    ~ b0000000000000000000000000000000000000000000000000000000000000000(bitIndex42) )).

fof(bitBlastConstant_339,axiom,(
    ~ b0000000000000000000000000000000000000000000000000000000000000000(bitIndex41) )).

fof(bitBlastConstant_338,axiom,(
    ~ b0000000000000000000000000000000000000000000000000000000000000000(bitIndex40) )).

fof(bitBlastConstant_337,axiom,(
    ~ b0000000000000000000000000000000000000000000000000000000000000000(bitIndex39) )).

fof(bitBlastConstant_336,axiom,(
    ~ b0000000000000000000000000000000000000000000000000000000000000000(bitIndex38) )).

fof(bitBlastConstant_335,axiom,(
    ~ b0000000000000000000000000000000000000000000000000000000000000000(bitIndex37) )).

fof(bitBlastConstant_334,axiom,(
    ~ b0000000000000000000000000000000000000000000000000000000000000000(bitIndex36) )).

fof(bitBlastConstant_333,axiom,(
    ~ b0000000000000000000000000000000000000000000000000000000000000000(bitIndex35) )).

fof(bitBlastConstant_332,axiom,(
    ~ b0000000000000000000000000000000000000000000000000000000000000000(bitIndex34) )).

fof(bitBlastConstant_331,axiom,(
    ~ b0000000000000000000000000000000000000000000000000000000000000000(bitIndex33) )).

fof(bitBlastConstant_330,axiom,(
    ~ b0000000000000000000000000000000000000000000000000000000000000000(bitIndex32) )).

fof(bitBlastConstant_329,axiom,(
    ~ b0000000000000000000000000000000000000000000000000000000000000000(bitIndex31) )).

fof(bitBlastConstant_328,axiom,(
    ~ b0000000000000000000000000000000000000000000000000000000000000000(bitIndex30) )).

fof(bitBlastConstant_327,axiom,(
    ~ b0000000000000000000000000000000000000000000000000000000000000000(bitIndex29) )).

fof(bitBlastConstant_326,axiom,(
    ~ b0000000000000000000000000000000000000000000000000000000000000000(bitIndex28) )).

fof(bitBlastConstant_325,axiom,(
    ~ b0000000000000000000000000000000000000000000000000000000000000000(bitIndex27) )).

fof(bitBlastConstant_324,axiom,(
    ~ b0000000000000000000000000000000000000000000000000000000000000000(bitIndex26) )).

fof(bitBlastConstant_323,axiom,(
    ~ b0000000000000000000000000000000000000000000000000000000000000000(bitIndex25) )).

fof(bitBlastConstant_322,axiom,(
    ~ b0000000000000000000000000000000000000000000000000000000000000000(bitIndex24) )).

fof(bitBlastConstant_321,axiom,(
    ~ b0000000000000000000000000000000000000000000000000000000000000000(bitIndex23) )).

fof(bitBlastConstant_320,axiom,(
    ~ b0000000000000000000000000000000000000000000000000000000000000000(bitIndex22) )).

fof(bitBlastConstant_319,axiom,(
    ~ b0000000000000000000000000000000000000000000000000000000000000000(bitIndex21) )).

fof(bitBlastConstant_318,axiom,(
    ~ b0000000000000000000000000000000000000000000000000000000000000000(bitIndex20) )).

fof(bitBlastConstant_317,axiom,(
    ~ b0000000000000000000000000000000000000000000000000000000000000000(bitIndex19) )).

fof(bitBlastConstant_316,axiom,(
    ~ b0000000000000000000000000000000000000000000000000000000000000000(bitIndex18) )).

fof(bitBlastConstant_315,axiom,(
    ~ b0000000000000000000000000000000000000000000000000000000000000000(bitIndex17) )).

fof(bitBlastConstant_314,axiom,(
    ~ b0000000000000000000000000000000000000000000000000000000000000000(bitIndex16) )).

fof(bitBlastConstant_313,axiom,(
    ~ b0000000000000000000000000000000000000000000000000000000000000000(bitIndex15) )).

fof(bitBlastConstant_312,axiom,(
    ~ b0000000000000000000000000000000000000000000000000000000000000000(bitIndex14) )).

fof(bitBlastConstant_311,axiom,(
    ~ b0000000000000000000000000000000000000000000000000000000000000000(bitIndex13) )).

fof(bitBlastConstant_310,axiom,(
    ~ b0000000000000000000000000000000000000000000000000000000000000000(bitIndex12) )).

fof(bitBlastConstant_309,axiom,(
    ~ b0000000000000000000000000000000000000000000000000000000000000000(bitIndex11) )).

fof(bitBlastConstant_308,axiom,(
    ~ b0000000000000000000000000000000000000000000000000000000000000000(bitIndex10) )).

fof(bitBlastConstant_307,axiom,(
    ~ b0000000000000000000000000000000000000000000000000000000000000000(bitIndex9) )).

fof(bitBlastConstant_306,axiom,(
    ~ b0000000000000000000000000000000000000000000000000000000000000000(bitIndex8) )).

fof(bitBlastConstant_305,axiom,(
    ~ b0000000000000000000000000000000000000000000000000000000000000000(bitIndex7) )).

fof(bitBlastConstant_304,axiom,(
    ~ b0000000000000000000000000000000000000000000000000000000000000000(bitIndex6) )).

fof(bitBlastConstant_303,axiom,(
    ~ b0000000000000000000000000000000000000000000000000000000000000000(bitIndex5) )).

fof(bitBlastConstant_302,axiom,(
    ~ b0000000000000000000000000000000000000000000000000000000000000000(bitIndex4) )).

fof(bitBlastConstant_301,axiom,(
    ~ b0000000000000000000000000000000000000000000000000000000000000000(bitIndex3) )).

fof(bitBlastConstant_300,axiom,(
    ~ b0000000000000000000000000000000000000000000000000000000000000000(bitIndex2) )).

fof(bitBlastConstant_299,axiom,(
    ~ b0000000000000000000000000000000000000000000000000000000000000000(bitIndex1) )).

fof(bitBlastConstant_298,axiom,(
    ~ b0000000000000000000000000000000000000000000000000000000000000000(bitIndex0) )).

fof(writeUnaryOperator_195,axiom,(
    ! [VarCurr] :
      ( ~ v2035(VarCurr)
    <=> v1984(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_414,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( v2024(VarNext)
      <=> v2025(VarNext) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_413,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( v2025(VarNext)
      <=> ( v2026(VarNext)
          & v2013(VarNext) ) ) ) )).

fof(writeUnaryOperator_194,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( ~ v2026(VarNext)
      <=> v2028(VarNext) ) ) )).

fof(addAssignment_392,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( v2028(VarNext)
      <=> v2013(VarCurr) ) ) )).

fof(addAssignmentInitValue_16,axiom,(
    ~ v1982(constB0,bitIndex1) )).

fof(addAssignmentInitValue_15,axiom,(
    ~ v1982(constB0,bitIndex0) )).

fof(bitBlastConstant_297,axiom,(
    ~ bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx00(bitIndex1) )).

fof(bitBlastConstant_296,axiom,(
    ~ bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx00(bitIndex0) )).

fof(addAssignment_391,axiom,(
    ! [VarCurr] :
      ( v2013(VarCurr)
    <=> v2015(VarCurr) ) )).

fof(addAssignment_390,axiom,(
    ! [VarCurr] :
      ( v2015(VarCurr)
    <=> v2017(VarCurr) ) )).

fof(addAssignment_389,axiom,(
    ! [VarCurr] :
      ( v2017(VarCurr)
    <=> v2019(VarCurr) ) )).

fof(addAssignment_388,axiom,(
    ! [VarCurr] :
      ( v2019(VarCurr)
    <=> v1(VarCurr) ) )).

fof(addAssignment_387,axiom,(
    ! [VarCurr] :
      ( v1987(VarCurr,bitIndex0)
    <=> v1989(VarCurr,bitIndex0) ) )).

fof(addAssignment_386,axiom,(
    ! [VarCurr] :
      ( v1989(VarCurr,bitIndex0)
    <=> v1991(VarCurr,bitIndex0) ) )).

fof(addAssignment_385,axiom,(
    ! [VarCurr] :
      ( v1991(VarCurr,bitIndex0)
    <=> v1993(VarCurr,bitIndex0) ) )).

fof(addAssignment_384,axiom,(
    ! [VarCurr] :
      ( v1993(VarCurr,bitIndex0)
    <=> v1995(VarCurr,bitIndex0) ) )).

fof(addAssignment_383,axiom,(
    ! [VarCurr] :
      ( v1995(VarCurr,bitIndex0)
    <=> v1997(VarCurr,bitIndex0) ) )).

fof(addAssignment_382,axiom,(
    ! [VarCurr] :
      ( v1997(VarCurr,bitIndex0)
    <=> v1999(VarCurr,bitIndex0) ) )).

fof(addAssignment_381,axiom,(
    ! [VarCurr] :
      ( v1999(VarCurr,bitIndex0)
    <=> v2001(VarCurr,bitIndex0) ) )).

fof(addAssignment_380,axiom,(
    ! [VarCurr] :
      ( v2001(VarCurr,bitIndex0)
    <=> v2003(VarCurr,bitIndex0) ) )).

fof(addAssignment_379,axiom,(
    ! [VarCurr] :
      ( v2003(VarCurr,bitIndex0)
    <=> v2005(VarCurr,bitIndex0) ) )).

fof(addAssignment_378,axiom,(
    ! [VarCurr] :
      ( v2005(VarCurr,bitIndex0)
    <=> v2007(VarCurr,bitIndex0) ) )).

fof(addAssignment_377,axiom,(
    ! [VarCurr] :
      ( v2007(VarCurr,bitIndex0)
    <=> v2009(VarCurr,bitIndex0) ) )).

fof(addAssignmentInitValue_14,axiom,(
    ~ v2009(constB0,bitIndex1) )).

fof(addAssignmentInitValue_13,axiom,(
    ~ v2009(constB0,bitIndex0) )).

fof(bitBlastConstant_295,axiom,(
    ~ bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx00(bitIndex1) )).

fof(bitBlastConstant_294,axiom,(
    ~ bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx00(bitIndex0) )).

fof(addAssignment_376,axiom,(
    ! [VarCurr] :
      ( v1984(VarCurr)
    <=> v1948(VarCurr) ) )).

fof(addAssignment_375,axiom,(
    ! [VarCurr] :
      ( v1961(VarCurr)
    <=> $false ) )).

fof(addAssignment_374,axiom,(
    ! [VarCurr] :
      ( v1959(VarCurr)
    <=> $false ) )).

fof(addAssignment_373,axiom,(
    ! [VarCurr] :
      ( v1957(VarCurr)
    <=> $true ) )).

fof(addAssignment_372,axiom,(
    ! [VarCurr] :
      ( v1955(VarCurr)
    <=> $false ) )).

fof(addAssignment_371,axiom,(
    ! [VarCurr] :
      ( v1932(VarCurr)
    <=> v1934(VarCurr) ) )).

fof(writeUnaryOperator_193,axiom,(
    ! [VarCurr] :
      ( ~ v1934(VarCurr)
    <=> v1936(VarCurr) ) )).

fof(addAssignment_370,axiom,(
    ! [VarCurr] :
      ( v1936(VarCurr)
    <=> v1938(VarCurr) ) )).

fof(addAssignment_369,axiom,(
    ! [VarCurr] :
      ( v1938(VarCurr)
    <=> v1940(VarCurr) ) )).

fof(addAssignment_368,axiom,(
    ! [VarCurr] :
      ( v1940(VarCurr)
    <=> v1942(VarCurr) ) )).

fof(addAssignment_367,axiom,(
    ! [VarCurr] :
      ( v1942(VarCurr)
    <=> v1944(VarCurr) ) )).

fof(addAssignment_366,axiom,(
    ! [VarCurr] :
      ( v1944(VarCurr)
    <=> v1946(VarCurr) ) )).

fof(addAssignment_365,axiom,(
    ! [VarCurr] :
      ( v1946(VarCurr)
    <=> v1948(VarCurr) ) )).

fof(addAssignment_364,axiom,(
    ! [VarCurr] :
      ( v1948(VarCurr)
    <=> v1950(VarCurr) ) )).

fof(addAssignment_363,axiom,(
    ! [VarCurr] :
      ( v1950(VarCurr)
    <=> v1952(VarCurr) ) )).

fof(addAssignment_362,axiom,(
    ! [VarCurr] :
      ( v1952(VarCurr)
    <=> v16(VarCurr) ) )).

fof(addCaseBooleanConditionEqualRanges1_19,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( ~ v1887(VarNext)
       => ( v318(VarNext)
        <=> v318(VarCurr) ) ) ) )).

fof(addCaseBooleanConditionEqualRanges0_31,axiom,(
    ! [VarNext] :
      ( v1887(VarNext)
     => ( v318(VarNext)
      <=> v1903(VarNext) ) ) )).

fof(addAssignment_361,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( v1903(VarNext)
      <=> v1901(VarCurr) ) ) )).

fof(aaddConditionBooleanCondEqualRangesElseBranch_58,axiom,(
    ! [VarCurr] :
      ( ~ v1900(VarCurr)
     => ( v1901(VarCurr)
      <=> v1904(VarCurr) ) ) )).

fof(addConditionBooleanCondEqualRangesThenBranch_61,axiom,(
    ! [VarCurr] :
      ( v1900(VarCurr)
     => ( v1901(VarCurr)
      <=> $false ) ) )).

fof(aaddConditionBooleanCondEqualRangesElseBranch_57,axiom,(
    ! [VarCurr] :
      ( ~ v320(VarCurr)
     => ( v1904(VarCurr)
      <=> $true ) ) )).

fof(addConditionBooleanCondEqualRangesThenBranch_60,axiom,(
    ! [VarCurr] :
      ( v320(VarCurr)
     => ( v1904(VarCurr)
      <=> $false ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_412,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( v1887(VarNext)
      <=> ( v1888(VarNext)
          & v1897(VarNext) ) ) ) )).

fof(addAssignment_360,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( v1897(VarNext)
      <=> v1895(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_411,axiom,(
    ! [VarCurr] :
      ( v1895(VarCurr)
    <=> ( v1898(VarCurr)
        | v1900(VarCurr) ) ) )).

fof(writeUnaryOperator_192,axiom,(
    ! [VarCurr] :
      ( ~ v1900(VarCurr)
    <=> v12(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_410,axiom,(
    ! [VarCurr] :
      ( v1898(VarCurr)
    <=> ( v1899(VarCurr)
        | v320(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_409,axiom,(
    ! [VarCurr] :
      ( v1899(VarCurr)
    <=> ( v664(VarCurr)
        & v741(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_408,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( v1888(VarNext)
      <=> ( v1889(VarNext)
          & v288(VarNext) ) ) ) )).

fof(writeUnaryOperator_191,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( ~ v1889(VarNext)
      <=> v1891(VarNext) ) ) )).

fof(addAssignment_359,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( v1891(VarNext)
      <=> v288(VarCurr) ) ) )).

fof(addAssignmentInitValueVector_16,axiom,
    ( v318(constB0)
  <=> $false )).

fof(writeBinaryOperatorEqualRangesSingleBits_407,axiom,(
    ! [VarCurr] :
      ( v741(VarCurr)
    <=> ( v1882(VarCurr)
        & v875(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_406,axiom,(
    ! [VarCurr] :
      ( v1882(VarCurr)
    <=> ( v1883(VarCurr)
        | v1884(VarCurr) ) ) )).

fof(addBitVectorEqualityBitBlasted_70,axiom,(
    ! [VarCurr] :
      ( v1884(VarCurr)
    <=> ( ( v743(VarCurr,bitIndex3)
        <=> $false )
        & ( v743(VarCurr,bitIndex2)
        <=> $true )
        & ( v743(VarCurr,bitIndex1)
        <=> $true )
        & ( v743(VarCurr,bitIndex0)
        <=> $true ) ) ) )).

fof(bitBlastConstant_293,axiom,(
    ~ b0111(bitIndex3) )).

fof(bitBlastConstant_292,axiom,(
    b0111(bitIndex2) )).

fof(bitBlastConstant_291,axiom,(
    b0111(bitIndex1) )).

fof(bitBlastConstant_290,axiom,(
    b0111(bitIndex0) )).

fof(addBitVectorEqualityBitBlasted_69,axiom,(
    ! [VarCurr] :
      ( v1883(VarCurr)
    <=> ( ( v743(VarCurr,bitIndex3)
        <=> $false )
        & ( v743(VarCurr,bitIndex2)
        <=> $true )
        & ( v743(VarCurr,bitIndex1)
        <=> $true )
        & ( v743(VarCurr,bitIndex0)
        <=> $false ) ) ) )).

fof(addAssignment_358,axiom,(
    ! [VarCurr] :
      ( ( v743(VarCurr,bitIndex3)
      <=> v745(VarCurr,bitIndex66) )
      & ( v743(VarCurr,bitIndex2)
      <=> v745(VarCurr,bitIndex65) )
      & ( v743(VarCurr,bitIndex1)
      <=> v745(VarCurr,bitIndex64) )
      & ( v743(VarCurr,bitIndex0)
      <=> v745(VarCurr,bitIndex63) ) ) )).

fof(addAssignment_357,axiom,(
    ! [VarCurr,B] :
      ( range_66_63(B)
     => ( v745(VarCurr,B)
      <=> v747(VarCurr,B) ) ) )).

fof(addAssignment_356,axiom,(
    ! [VarCurr,B] :
      ( range_66_63(B)
     => ( v747(VarCurr,B)
      <=> v867(VarCurr,B) ) ) )).

fof(range_axiom_13,axiom,(
    ! [B] :
      ( range_66_63(B)
    <=> ( $false
        | bitIndex63 = B
        | bitIndex64 = B
        | bitIndex65 = B
        | bitIndex66 = B ) ) )).

fof(addCaseBooleanConditionEqualRanges1_18,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( ~ v1869(VarNext)
       => ! [B] :
            ( range_3_0(B)
           => ( v869(VarNext,B)
            <=> v869(VarCurr,B) ) ) ) ) )).

fof(addCaseBooleanConditionEqualRanges0_30,axiom,(
    ! [VarNext] :
      ( v1869(VarNext)
     => ! [B] :
          ( range_3_0(B)
         => ( v869(VarNext,B)
          <=> v1877(VarNext,B) ) ) ) )).

fof(addAssignment_355,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ! [B] :
          ( range_3_0(B)
         => ( v1877(VarNext,B)
          <=> v1875(VarCurr,B) ) ) ) )).

fof(aaddConditionBooleanCondEqualRangesElseBranch_56,axiom,(
    ! [VarCurr] :
      ( ~ v830(VarCurr)
     => ! [B] :
          ( range_3_0(B)
         => ( v1875(VarCurr,B)
          <=> v871(VarCurr,B) ) ) ) )).

fof(addConditionBooleanCondEqualRangesThenBranch_59,axiom,(
    ! [VarCurr] :
      ( v830(VarCurr)
     => ! [B] :
          ( range_3_0(B)
         => ( v1875(VarCurr,B)
          <=> $false ) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_405,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( v1869(VarNext)
      <=> v1870(VarNext) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_404,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( v1870(VarNext)
      <=> ( v1872(VarNext)
          & v751(VarNext) ) ) ) )).

fof(writeUnaryOperator_190,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( ~ v1872(VarNext)
      <=> v823(VarNext) ) ) )).

fof(aaddConditionBooleanCondEqualRangesElseBranch_55,axiom,(
    ! [VarCurr] :
      ( ~ v873(VarCurr)
     => ! [B] :
          ( range_3_0(B)
         => ( v871(VarCurr,B)
          <=> v869(VarCurr,B) ) ) ) )).

fof(addConditionBooleanCondEqualRangesThenBranch_58,axiom,(
    ! [VarCurr] :
      ( v873(VarCurr)
     => ! [B] :
          ( range_3_0(B)
         => ( v871(VarCurr,B)
          <=> v1846(VarCurr,B) ) ) ) )).

fof(aaddConditionBooleanCondEqualRangesElseBranch_54,axiom,(
    ! [VarCurr] :
      ( ~ v1847(VarCurr)
     => ! [B] :
          ( range_3_0(B)
         => ( v1846(VarCurr,B)
          <=> v1848(VarCurr,B) ) ) ) )).

fof(addConditionBooleanCondEqualRangesThenBranch_57,axiom,(
    ! [VarCurr] :
      ( v1847(VarCurr)
     => ! [B] :
          ( range_3_0(B)
         => ( v1846(VarCurr,B)
          <=> $false ) ) ) )).

fof(addAssignment_354,axiom,(
    ! [VarCurr] :
      ( v1848(VarCurr,bitIndex0)
    <=> v1864(VarCurr) ) )).

fof(addAssignment_353,axiom,(
    ! [VarCurr] :
      ( v1848(VarCurr,bitIndex1)
    <=> v1862(VarCurr) ) )).

fof(addAssignment_352,axiom,(
    ! [VarCurr] :
      ( v1848(VarCurr,bitIndex2)
    <=> v1857(VarCurr) ) )).

fof(addAssignment_351,axiom,(
    ! [VarCurr] :
      ( v1848(VarCurr,bitIndex3)
    <=> v1850(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_403,axiom,(
    ! [VarCurr] :
      ( v1862(VarCurr)
    <=> ( v1863(VarCurr)
        & v1866(VarCurr) ) ) )).

fof(writeBinaryOperatorShiftedRanges_90,axiom,(
    ! [VarCurr] :
      ( v1866(VarCurr)
    <=> ( v869(VarCurr,bitIndex0)
        | v869(VarCurr,bitIndex1) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_402,axiom,(
    ! [VarCurr] :
      ( v1863(VarCurr)
    <=> ( v1864(VarCurr)
        | v1865(VarCurr) ) ) )).

fof(writeUnaryOperator_189,axiom,(
    ! [VarCurr] :
      ( ~ v1865(VarCurr)
    <=> v869(VarCurr,bitIndex1) ) )).

fof(writeUnaryOperator_188,axiom,(
    ! [VarCurr] :
      ( ~ v1864(VarCurr)
    <=> v869(VarCurr,bitIndex0) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_401,axiom,(
    ! [VarCurr] :
      ( v1857(VarCurr)
    <=> ( v1858(VarCurr)
        & v1861(VarCurr) ) ) )).

fof(writeBinaryOperatorShiftedRanges_89,axiom,(
    ! [VarCurr] :
      ( v1861(VarCurr)
    <=> ( v1854(VarCurr)
        | v869(VarCurr,bitIndex2) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_400,axiom,(
    ! [VarCurr] :
      ( v1858(VarCurr)
    <=> ( v1859(VarCurr)
        | v1860(VarCurr) ) ) )).

fof(writeUnaryOperator_187,axiom,(
    ! [VarCurr] :
      ( ~ v1860(VarCurr)
    <=> v869(VarCurr,bitIndex2) ) )).

fof(writeUnaryOperator_186,axiom,(
    ! [VarCurr] :
      ( ~ v1859(VarCurr)
    <=> v1854(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_399,axiom,(
    ! [VarCurr] :
      ( v1850(VarCurr)
    <=> ( v1851(VarCurr)
        & v1856(VarCurr) ) ) )).

fof(writeBinaryOperatorShiftedRanges_88,axiom,(
    ! [VarCurr] :
      ( v1856(VarCurr)
    <=> ( v1853(VarCurr)
        | v869(VarCurr,bitIndex3) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_398,axiom,(
    ! [VarCurr] :
      ( v1851(VarCurr)
    <=> ( v1852(VarCurr)
        | v1855(VarCurr) ) ) )).

fof(writeUnaryOperator_185,axiom,(
    ! [VarCurr] :
      ( ~ v1855(VarCurr)
    <=> v869(VarCurr,bitIndex3) ) )).

fof(writeUnaryOperator_184,axiom,(
    ! [VarCurr] :
      ( ~ v1852(VarCurr)
    <=> v1853(VarCurr) ) )).

fof(writeBinaryOperatorShiftedRanges_87,axiom,(
    ! [VarCurr] :
      ( v1853(VarCurr)
    <=> ( v1854(VarCurr)
        & v869(VarCurr,bitIndex2) ) ) )).

fof(writeBinaryOperatorShiftedRanges_86,axiom,(
    ! [VarCurr] :
      ( v1854(VarCurr)
    <=> ( v869(VarCurr,bitIndex0)
        & v869(VarCurr,bitIndex1) ) ) )).

fof(addBitVectorEqualityBitBlasted_68,axiom,(
    ! [VarCurr] :
      ( v1847(VarCurr)
    <=> ( ( v869(VarCurr,bitIndex3)
        <=> $true )
        & ( v869(VarCurr,bitIndex2)
        <=> $true )
        & ( v869(VarCurr,bitIndex1)
        <=> $true )
        & ( v869(VarCurr,bitIndex0)
        <=> $true ) ) ) )).

fof(addAssignment_350,axiom,(
    ! [VarCurr] :
      ( v873(VarCurr)
    <=> v875(VarCurr) ) )).

fof(addAssignment_349,axiom,(
    ! [VarCurr] :
      ( v875(VarCurr)
    <=> v877(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_397,axiom,(
    ! [VarCurr] :
      ( v877(VarCurr)
    <=> ( v879(VarCurr)
        | v1843(VarCurr) ) ) )).

fof(addAssignment_348,axiom,(
    ! [VarCurr] :
      ( v1843(VarCurr)
    <=> v31(VarCurr,bitIndex4) ) )).

fof(addAssignment_347,axiom,(
    ! [VarCurr] :
      ( v879(VarCurr)
    <=> v36(VarCurr,bitIndex6) ) )).

fof(addConditionBooleanCondShiftedRangesElseBranch_15,axiom,(
    ! [VarCurr] :
      ( ~ v1831(VarCurr)
     => ( v36(VarCurr,bitIndex6)
      <=> $false ) ) )).

fof(addConditionBooleanCondShiftedRangesThenBranch_12,axiom,(
    ! [VarCurr] :
      ( v1831(VarCurr)
     => ( v36(VarCurr,bitIndex6)
      <=> $true ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_396,axiom,(
    ! [VarCurr] :
      ( v1831(VarCurr)
    <=> ( v1832(VarCurr)
        | v1840(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_395,axiom,(
    ! [VarCurr] :
      ( v1840(VarCurr)
    <=> ( v1841(VarCurr)
        & v1821(VarCurr) ) ) )).

fof(writeUnaryOperator_183,axiom,(
    ! [VarCurr] :
      ( ~ v1841(VarCurr)
    <=> v38(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_394,axiom,(
    ! [VarCurr] :
      ( v1832(VarCurr)
    <=> ( v1833(VarCurr)
        | v1838(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_393,axiom,(
    ! [VarCurr] :
      ( v1838(VarCurr)
    <=> ( v1839(VarCurr)
        & v1360(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_392,axiom,(
    ! [VarCurr] :
      ( v1839(VarCurr)
    <=> ( v1342(VarCurr)
        & v1812(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_391,axiom,(
    ! [VarCurr] :
      ( v1833(VarCurr)
    <=> ( v1834(VarCurr)
        | v1836(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_390,axiom,(
    ! [VarCurr] :
      ( v1836(VarCurr)
    <=> ( v1837(VarCurr)
        & v1355(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_389,axiom,(
    ! [VarCurr] :
      ( v1837(VarCurr)
    <=> ( v1342(VarCurr)
        & v1812(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_388,axiom,(
    ! [VarCurr] :
      ( v1834(VarCurr)
    <=> ( v1835(VarCurr)
        & v1348(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_387,axiom,(
    ! [VarCurr] :
      ( v1835(VarCurr)
    <=> ( v1342(VarCurr)
        & v1812(VarCurr) ) ) )).

fof(addAssignment_346,axiom,(
    ! [VarNext] :
      ( v31(VarNext,bitIndex11)
    <=> v1823(VarNext,bitIndex10) ) )).

fof(addCaseBooleanConditionShiftedRanges1_12,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( ~ v1824(VarNext)
       => ( ( v1823(VarNext,bitIndex10)
          <=> v31(VarCurr,bitIndex11) )
          & ( v1823(VarNext,bitIndex9)
          <=> v31(VarCurr,bitIndex10) )
          & ( v1823(VarNext,bitIndex8)
          <=> v31(VarCurr,bitIndex9) )
          & ( v1823(VarNext,bitIndex7)
          <=> v31(VarCurr,bitIndex8) )
          & ( v1823(VarNext,bitIndex6)
          <=> v31(VarCurr,bitIndex7) )
          & ( v1823(VarNext,bitIndex5)
          <=> v31(VarCurr,bitIndex6) )
          & ( v1823(VarNext,bitIndex4)
          <=> v31(VarCurr,bitIndex5) )
          & ( v1823(VarNext,bitIndex3)
          <=> v31(VarCurr,bitIndex4) )
          & ( v1823(VarNext,bitIndex2)
          <=> v31(VarCurr,bitIndex3) )
          & ( v1823(VarNext,bitIndex1)
          <=> v31(VarCurr,bitIndex2) )
          & ( v1823(VarNext,bitIndex0)
          <=> v31(VarCurr,bitIndex1) ) ) ) ) )).

fof(addCaseBooleanConditionEqualRanges0_29,axiom,(
    ! [VarNext] :
      ( v1824(VarNext)
     => ! [B] :
          ( range_10_0(B)
         => ( v1823(VarNext,B)
          <=> v1253(VarNext,B) ) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_386,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( v1824(VarNext)
      <=> v1825(VarNext) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_385,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( v1825(VarNext)
      <=> ( v1827(VarNext)
          & v1240(VarNext) ) ) ) )).

fof(writeUnaryOperator_182,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( ~ v1827(VarNext)
      <=> v1247(VarNext) ) ) )).

fof(addConditionBooleanCondShiftedRangesElseBranch_14,axiom,(
    ! [VarCurr] :
      ( ~ v1805(VarCurr)
     => ( v36(VarCurr,bitIndex11)
      <=> $false ) ) )).

fof(addConditionBooleanCondShiftedRangesThenBranch_11,axiom,(
    ! [VarCurr] :
      ( v1805(VarCurr)
     => ( v36(VarCurr,bitIndex11)
      <=> $true ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_384,axiom,(
    ! [VarCurr] :
      ( v1805(VarCurr)
    <=> ( v1806(VarCurr)
        | v1820(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_383,axiom,(
    ! [VarCurr] :
      ( v1820(VarCurr)
    <=> ( v38(VarCurr)
        & v1821(VarCurr) ) ) )).

fof(addBitVectorEqualityBitBlasted_67,axiom,(
    ! [VarCurr] :
      ( v1821(VarCurr)
    <=> ( $true
      <=> v31(VarCurr,bitIndex11) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_382,axiom,(
    ! [VarCurr] :
      ( v1806(VarCurr)
    <=> ( v1807(VarCurr)
        | v1817(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_381,axiom,(
    ! [VarCurr] :
      ( v1817(VarCurr)
    <=> ( v1818(VarCurr)
        & v1323(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_380,axiom,(
    ! [VarCurr] :
      ( v1818(VarCurr)
    <=> ( v1342(VarCurr)
        & v1812(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_379,axiom,(
    ! [VarCurr] :
      ( v1807(VarCurr)
    <=> ( v1808(VarCurr)
        | v1815(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_378,axiom,(
    ! [VarCurr] :
      ( v1815(VarCurr)
    <=> ( v1816(VarCurr)
        & v1300(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_377,axiom,(
    ! [VarCurr] :
      ( v1816(VarCurr)
    <=> ( v1352(VarCurr)
        & v1812(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_376,axiom,(
    ! [VarCurr] :
      ( v1808(VarCurr)
    <=> ( v1809(VarCurr)
        | v1813(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_375,axiom,(
    ! [VarCurr] :
      ( v1813(VarCurr)
    <=> ( v1814(VarCurr)
        & v1278(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_374,axiom,(
    ! [VarCurr] :
      ( v1814(VarCurr)
    <=> ( v1352(VarCurr)
        & v1812(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_373,axiom,(
    ! [VarCurr] :
      ( v1809(VarCurr)
    <=> ( v1810(VarCurr)
        & v1238(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_372,axiom,(
    ! [VarCurr] :
      ( v1810(VarCurr)
    <=> ( v1352(VarCurr)
        & v1812(VarCurr) ) ) )).

fof(writeUnaryOperator_181,axiom,(
    ! [VarCurr] :
      ( ~ v1812(VarCurr)
    <=> v1168(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_371,axiom,(
    ! [VarCurr] :
      ( v907(VarCurr)
    <=> ( v909(VarCurr)
        & v1150(VarCurr) ) ) )).

fof(addAssignment_345,axiom,(
    ! [VarCurr] :
      ( v909(VarCurr)
    <=> v911(VarCurr) ) )).

fof(addAssignment_344,axiom,(
    ! [VarCurr] :
      ( v911(VarCurr)
    <=> v913(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_370,axiom,(
    ! [VarCurr] :
      ( v913(VarCurr)
    <=> ( v1799(VarCurr)
        & v1800(VarCurr) ) ) )).

fof(writeUnaryOperator_180,axiom,(
    ! [VarCurr] :
      ( ~ v1800(VarCurr)
    <=> v1138(VarCurr) ) )).

fof(writeUnaryOperator_179,axiom,(
    ! [VarCurr] :
      ( ~ v1799(VarCurr)
    <=> v915(VarCurr,bitIndex1) ) )).

fof(addAssignment_343,axiom,(
    ! [VarCurr] :
      ( v915(VarCurr,bitIndex1)
    <=> v917(VarCurr,bitIndex1) ) )).

fof(addAssignment_342,axiom,(
    ! [VarCurr] :
      ( v917(VarCurr,bitIndex1)
    <=> v919(VarCurr,bitIndex17) ) )).

fof(addAssignment_341,axiom,(
    ! [VarCurr] :
      ( v919(VarCurr,bitIndex17)
    <=> v921(VarCurr,bitIndex17) ) )).

fof(addAssignment_340,axiom,(
    ! [VarCurr] :
      ( v921(VarCurr,bitIndex17)
    <=> v1017(VarCurr,bitIndex17) ) )).

fof(addCaseBooleanConditionEqualRanges1_17,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( ~ v1787(VarNext)
       => ! [B] :
            ( range_3_0(B)
           => ( v1019(VarNext,B)
            <=> v1019(VarCurr,B) ) ) ) ) )).

fof(addCaseBooleanConditionEqualRanges0_28,axiom,(
    ! [VarNext] :
      ( v1787(VarNext)
     => ! [B] :
          ( range_3_0(B)
         => ( v1019(VarNext,B)
          <=> v1795(VarNext,B) ) ) ) )).

fof(addAssignment_339,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ! [B] :
          ( range_3_0(B)
         => ( v1795(VarNext,B)
          <=> v1793(VarCurr,B) ) ) ) )).

fof(aaddConditionBooleanCondEqualRangesElseBranch_53,axiom,(
    ! [VarCurr] :
      ( ~ v991(VarCurr)
     => ! [B] :
          ( range_3_0(B)
         => ( v1793(VarCurr,B)
          <=> v1021(VarCurr,B) ) ) ) )).

fof(addConditionBooleanCondEqualRangesThenBranch_56,axiom,(
    ! [VarCurr] :
      ( v991(VarCurr)
     => ! [B] :
          ( range_3_0(B)
         => ( v1793(VarCurr,B)
          <=> $false ) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_369,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( v1787(VarNext)
      <=> v1788(VarNext) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_368,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( v1788(VarNext)
      <=> ( v1790(VarNext)
          & v925(VarNext) ) ) ) )).

fof(writeUnaryOperator_178,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( ~ v1790(VarNext)
      <=> v984(VarNext) ) ) )).

fof(aaddConditionBooleanCondEqualRangesElseBranch_52,axiom,(
    ! [VarCurr] :
      ( ~ v1023(VarCurr)
     => ! [B] :
          ( range_3_0(B)
         => ( v1021(VarCurr,B)
          <=> v1019(VarCurr,B) ) ) ) )).

fof(addConditionBooleanCondEqualRangesThenBranch_55,axiom,(
    ! [VarCurr] :
      ( v1023(VarCurr)
     => ! [B] :
          ( range_3_0(B)
         => ( v1021(VarCurr,B)
          <=> v1764(VarCurr,B) ) ) ) )).

fof(aaddConditionBooleanCondEqualRangesElseBranch_51,axiom,(
    ! [VarCurr] :
      ( ~ v1765(VarCurr)
     => ! [B] :
          ( range_3_0(B)
         => ( v1764(VarCurr,B)
          <=> v1766(VarCurr,B) ) ) ) )).

fof(addConditionBooleanCondEqualRangesThenBranch_54,axiom,(
    ! [VarCurr] :
      ( v1765(VarCurr)
     => ! [B] :
          ( range_3_0(B)
         => ( v1764(VarCurr,B)
          <=> $false ) ) ) )).

fof(addAssignment_338,axiom,(
    ! [VarCurr] :
      ( v1766(VarCurr,bitIndex0)
    <=> v1782(VarCurr) ) )).

fof(addAssignment_337,axiom,(
    ! [VarCurr] :
      ( v1766(VarCurr,bitIndex1)
    <=> v1780(VarCurr) ) )).

fof(addAssignment_336,axiom,(
    ! [VarCurr] :
      ( v1766(VarCurr,bitIndex2)
    <=> v1775(VarCurr) ) )).

fof(addAssignment_335,axiom,(
    ! [VarCurr] :
      ( v1766(VarCurr,bitIndex3)
    <=> v1768(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_367,axiom,(
    ! [VarCurr] :
      ( v1780(VarCurr)
    <=> ( v1781(VarCurr)
        & v1784(VarCurr) ) ) )).

fof(writeBinaryOperatorShiftedRanges_85,axiom,(
    ! [VarCurr] :
      ( v1784(VarCurr)
    <=> ( v1019(VarCurr,bitIndex0)
        | v1019(VarCurr,bitIndex1) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_366,axiom,(
    ! [VarCurr] :
      ( v1781(VarCurr)
    <=> ( v1782(VarCurr)
        | v1783(VarCurr) ) ) )).

fof(writeUnaryOperator_177,axiom,(
    ! [VarCurr] :
      ( ~ v1783(VarCurr)
    <=> v1019(VarCurr,bitIndex1) ) )).

fof(writeUnaryOperator_176,axiom,(
    ! [VarCurr] :
      ( ~ v1782(VarCurr)
    <=> v1019(VarCurr,bitIndex0) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_365,axiom,(
    ! [VarCurr] :
      ( v1775(VarCurr)
    <=> ( v1776(VarCurr)
        & v1779(VarCurr) ) ) )).

fof(writeBinaryOperatorShiftedRanges_84,axiom,(
    ! [VarCurr] :
      ( v1779(VarCurr)
    <=> ( v1772(VarCurr)
        | v1019(VarCurr,bitIndex2) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_364,axiom,(
    ! [VarCurr] :
      ( v1776(VarCurr)
    <=> ( v1777(VarCurr)
        | v1778(VarCurr) ) ) )).

fof(writeUnaryOperator_175,axiom,(
    ! [VarCurr] :
      ( ~ v1778(VarCurr)
    <=> v1019(VarCurr,bitIndex2) ) )).

fof(writeUnaryOperator_174,axiom,(
    ! [VarCurr] :
      ( ~ v1777(VarCurr)
    <=> v1772(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_363,axiom,(
    ! [VarCurr] :
      ( v1768(VarCurr)
    <=> ( v1769(VarCurr)
        & v1774(VarCurr) ) ) )).

fof(writeBinaryOperatorShiftedRanges_83,axiom,(
    ! [VarCurr] :
      ( v1774(VarCurr)
    <=> ( v1771(VarCurr)
        | v1019(VarCurr,bitIndex3) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_362,axiom,(
    ! [VarCurr] :
      ( v1769(VarCurr)
    <=> ( v1770(VarCurr)
        | v1773(VarCurr) ) ) )).

fof(writeUnaryOperator_173,axiom,(
    ! [VarCurr] :
      ( ~ v1773(VarCurr)
    <=> v1019(VarCurr,bitIndex3) ) )).

fof(writeUnaryOperator_172,axiom,(
    ! [VarCurr] :
      ( ~ v1770(VarCurr)
    <=> v1771(VarCurr) ) )).

fof(writeBinaryOperatorShiftedRanges_82,axiom,(
    ! [VarCurr] :
      ( v1771(VarCurr)
    <=> ( v1772(VarCurr)
        & v1019(VarCurr,bitIndex2) ) ) )).

fof(writeBinaryOperatorShiftedRanges_81,axiom,(
    ! [VarCurr] :
      ( v1772(VarCurr)
    <=> ( v1019(VarCurr,bitIndex0)
        & v1019(VarCurr,bitIndex1) ) ) )).

fof(addBitVectorEqualityBitBlasted_66,axiom,(
    ! [VarCurr] :
      ( v1765(VarCurr)
    <=> ( ( v1019(VarCurr,bitIndex3)
        <=> $true )
        & ( v1019(VarCurr,bitIndex2)
        <=> $true )
        & ( v1019(VarCurr,bitIndex1)
        <=> $true )
        & ( v1019(VarCurr,bitIndex0)
        <=> $true ) ) ) )).

fof(addAssignment_334,axiom,(
    ! [VarCurr] :
      ( v1023(VarCurr)
    <=> v1025(VarCurr) ) )).

fof(addAssignment_333,axiom,(
    ! [VarCurr] :
      ( v1025(VarCurr)
    <=> v1027(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_361,axiom,(
    ! [VarCurr] :
      ( v1027(VarCurr)
    <=> ( v1761(VarCurr)
        | v1160(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_360,axiom,(
    ! [VarCurr] :
      ( v1761(VarCurr)
    <=> ( v1762(VarCurr)
        | v85(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_359,axiom,(
    ! [VarCurr] :
      ( v1762(VarCurr)
    <=> ( v1029(VarCurr)
        | v1148(VarCurr) ) ) )).

fof(addAssignment_332,axiom,(
    ! [VarCurr] :
      ( v1160(VarCurr)
    <=> v31(VarCurr,bitIndex1) ) )).

fof(addAssignment_331,axiom,(
    ! [VarNext] :
      ( v31(VarNext,bitIndex1)
    <=> v1753(VarNext,bitIndex0) ) )).

fof(addCaseBooleanConditionShiftedRanges1_11,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( ~ v1754(VarNext)
       => ( ( v1753(VarNext,bitIndex10)
          <=> v31(VarCurr,bitIndex11) )
          & ( v1753(VarNext,bitIndex9)
          <=> v31(VarCurr,bitIndex10) )
          & ( v1753(VarNext,bitIndex8)
          <=> v31(VarCurr,bitIndex9) )
          & ( v1753(VarNext,bitIndex7)
          <=> v31(VarCurr,bitIndex8) )
          & ( v1753(VarNext,bitIndex6)
          <=> v31(VarCurr,bitIndex7) )
          & ( v1753(VarNext,bitIndex5)
          <=> v31(VarCurr,bitIndex6) )
          & ( v1753(VarNext,bitIndex4)
          <=> v31(VarCurr,bitIndex5) )
          & ( v1753(VarNext,bitIndex3)
          <=> v31(VarCurr,bitIndex4) )
          & ( v1753(VarNext,bitIndex2)
          <=> v31(VarCurr,bitIndex3) )
          & ( v1753(VarNext,bitIndex1)
          <=> v31(VarCurr,bitIndex2) )
          & ( v1753(VarNext,bitIndex0)
          <=> v31(VarCurr,bitIndex1) ) ) ) ) )).

fof(addCaseBooleanConditionEqualRanges0_27,axiom,(
    ! [VarNext] :
      ( v1754(VarNext)
     => ! [B] :
          ( range_10_0(B)
         => ( v1753(VarNext,B)
          <=> v1253(VarNext,B) ) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_358,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( v1754(VarNext)
      <=> v1755(VarNext) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_357,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( v1755(VarNext)
      <=> ( v1757(VarNext)
          & v1240(VarNext) ) ) ) )).

fof(writeUnaryOperator_171,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( ~ v1757(VarNext)
      <=> v1247(VarNext) ) ) )).

fof(addConditionBooleanCondShiftedRangesElseBranch_13,axiom,(
    ! [VarCurr] :
      ( ~ v1730(VarCurr)
     => ( v36(VarCurr,bitIndex1)
      <=> $false ) ) )).

fof(addConditionBooleanCondShiftedRangesThenBranch_10,axiom,(
    ! [VarCurr] :
      ( v1730(VarCurr)
     => ( v36(VarCurr,bitIndex1)
      <=> $true ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_356,axiom,(
    ! [VarCurr] :
      ( v1730(VarCurr)
    <=> ( v1731(VarCurr)
        | v1750(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_355,axiom,(
    ! [VarCurr] :
      ( v1750(VarCurr)
    <=> ( v1751(VarCurr)
        & v1323(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_354,axiom,(
    ! [VarCurr] :
      ( v1751(VarCurr)
    <=> ( v1677(VarCurr)
        & v907(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_353,axiom,(
    ! [VarCurr] :
      ( v1731(VarCurr)
    <=> ( v1732(VarCurr)
        | v1748(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_352,axiom,(
    ! [VarCurr] :
      ( v1748(VarCurr)
    <=> ( v1749(VarCurr)
        & v1300(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_351,axiom,(
    ! [VarCurr] :
      ( v1749(VarCurr)
    <=> ( v1689(VarCurr)
        & v907(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_350,axiom,(
    ! [VarCurr] :
      ( v1732(VarCurr)
    <=> ( v1733(VarCurr)
        | v1746(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_349,axiom,(
    ! [VarCurr] :
      ( v1746(VarCurr)
    <=> ( v1747(VarCurr)
        & v1360(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_348,axiom,(
    ! [VarCurr] :
      ( v1747(VarCurr)
    <=> ( v1677(VarCurr)
        & v907(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_347,axiom,(
    ! [VarCurr] :
      ( v1733(VarCurr)
    <=> ( v1734(VarCurr)
        | v1744(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_346,axiom,(
    ! [VarCurr] :
      ( v1744(VarCurr)
    <=> ( v1745(VarCurr)
        & v1278(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_345,axiom,(
    ! [VarCurr] :
      ( v1745(VarCurr)
    <=> ( v1689(VarCurr)
        & v907(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_344,axiom,(
    ! [VarCurr] :
      ( v1734(VarCurr)
    <=> ( v1735(VarCurr)
        | v1742(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_343,axiom,(
    ! [VarCurr] :
      ( v1742(VarCurr)
    <=> ( v1743(VarCurr)
        & v1355(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_342,axiom,(
    ! [VarCurr] :
      ( v1743(VarCurr)
    <=> ( v1677(VarCurr)
        & v907(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_341,axiom,(
    ! [VarCurr] :
      ( v1735(VarCurr)
    <=> ( v1736(VarCurr)
        | v1739(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_340,axiom,(
    ! [VarCurr] :
      ( v1739(VarCurr)
    <=> ( v1740(VarCurr)
        & v1238(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_339,axiom,(
    ! [VarCurr] :
      ( v1740(VarCurr)
    <=> ( v1689(VarCurr)
        & v907(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_338,axiom,(
    ! [VarCurr] :
      ( v1736(VarCurr)
    <=> ( v1737(VarCurr)
        & v1348(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_337,axiom,(
    ! [VarCurr] :
      ( v1737(VarCurr)
    <=> ( v1677(VarCurr)
        & v907(VarCurr) ) ) )).

fof(addCaseBooleanConditionEqualRanges1_16,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( ~ v1717(VarNext)
       => ( v31(VarNext,bitIndex0)
        <=> v31(VarCurr,bitIndex0) ) ) ) )).

fof(addCaseBooleanConditionEqualRanges0_26,axiom,(
    ! [VarNext] :
      ( v1717(VarNext)
     => ( v31(VarNext,bitIndex0)
      <=> v1725(VarNext) ) ) )).

fof(addAssignment_330,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( v1725(VarNext)
      <=> v1723(VarCurr) ) ) )).

fof(aaddConditionBooleanCondEqualRangesElseBranch_50,axiom,(
    ! [VarCurr] :
      ( ~ v1254(VarCurr)
     => ( v1723(VarCurr)
      <=> v36(VarCurr,bitIndex0) ) ) )).

fof(addConditionBooleanCondEqualRangesThenBranch_53,axiom,(
    ! [VarCurr] :
      ( v1254(VarCurr)
     => ( v1723(VarCurr)
      <=> $true ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_336,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( v1717(VarNext)
      <=> v1718(VarNext) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_335,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( v1718(VarNext)
      <=> ( v1720(VarNext)
          & v1240(VarNext) ) ) ) )).

fof(writeUnaryOperator_170,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( ~ v1720(VarNext)
      <=> v1247(VarNext) ) ) )).

fof(aaddConditionBooleanCondEqualRangesElseBranch_49,axiom,(
    ! [VarCurr] :
      ( ~ v1660(VarCurr)
     => ( v36(VarCurr,bitIndex0)
      <=> $false ) ) )).

fof(addConditionBooleanCondEqualRangesThenBranch_52,axiom,(
    ! [VarCurr] :
      ( v1660(VarCurr)
     => ( v36(VarCurr,bitIndex0)
      <=> $true ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_334,axiom,(
    ! [VarCurr] :
      ( v1660(VarCurr)
    <=> ( v1661(VarCurr)
        | v1711(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_333,axiom,(
    ! [VarCurr] :
      ( v1711(VarCurr)
    <=> ( v1712(VarCurr)
        & v1323(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_332,axiom,(
    ! [VarCurr] :
      ( v1712(VarCurr)
    <=> ( v1713(VarCurr)
        | v1714(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_331,axiom,(
    ! [VarCurr] :
      ( v1714(VarCurr)
    <=> ( v1677(VarCurr)
        & v1682(VarCurr) ) ) )).

fof(addAssignment_329,axiom,(
    ! [VarCurr] :
      ( v1713(VarCurr)
    <=> v1671(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_330,axiom,(
    ! [VarCurr] :
      ( v1661(VarCurr)
    <=> ( v1662(VarCurr)
        | v1707(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_329,axiom,(
    ! [VarCurr] :
      ( v1707(VarCurr)
    <=> ( v1708(VarCurr)
        & v1300(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_328,axiom,(
    ! [VarCurr] :
      ( v1708(VarCurr)
    <=> ( v1709(VarCurr)
        | v1710(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_327,axiom,(
    ! [VarCurr] :
      ( v1710(VarCurr)
    <=> ( v1689(VarCurr)
        & v1682(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_326,axiom,(
    ! [VarCurr] :
      ( v1709(VarCurr)
    <=> ( v1671(VarCurr)
        & v1180(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_325,axiom,(
    ! [VarCurr] :
      ( v1662(VarCurr)
    <=> ( v1663(VarCurr)
        | v1701(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_324,axiom,(
    ! [VarCurr] :
      ( v1701(VarCurr)
    <=> ( v1702(VarCurr)
        & v1360(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_323,axiom,(
    ! [VarCurr] :
      ( v1702(VarCurr)
    <=> ( v1703(VarCurr)
        | v1706(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_322,axiom,(
    ! [VarCurr] :
      ( v1706(VarCurr)
    <=> ( v1677(VarCurr)
        & v1682(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_321,axiom,(
    ! [VarCurr] :
      ( v1703(VarCurr)
    <=> ( v1704(VarCurr)
        | v1705(VarCurr) ) ) )).

fof(addAssignment_328,axiom,(
    ! [VarCurr] :
      ( v1705(VarCurr)
    <=> v1671(VarCurr) ) )).

fof(addAssignment_327,axiom,(
    ! [VarCurr] :
      ( v1704(VarCurr)
    <=> v38(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_320,axiom,(
    ! [VarCurr] :
      ( v1663(VarCurr)
    <=> ( v1664(VarCurr)
        | v1697(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_319,axiom,(
    ! [VarCurr] :
      ( v1697(VarCurr)
    <=> ( v1698(VarCurr)
        & v1278(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_318,axiom,(
    ! [VarCurr] :
      ( v1698(VarCurr)
    <=> ( v1699(VarCurr)
        | v1700(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_317,axiom,(
    ! [VarCurr] :
      ( v1700(VarCurr)
    <=> ( v1689(VarCurr)
        & v1682(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_316,axiom,(
    ! [VarCurr] :
      ( v1699(VarCurr)
    <=> ( v1671(VarCurr)
        & v1180(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_315,axiom,(
    ! [VarCurr] :
      ( v1664(VarCurr)
    <=> ( v1665(VarCurr)
        | v1691(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_314,axiom,(
    ! [VarCurr] :
      ( v1691(VarCurr)
    <=> ( v1692(VarCurr)
        & v1355(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_313,axiom,(
    ! [VarCurr] :
      ( v1692(VarCurr)
    <=> ( v1693(VarCurr)
        | v1696(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_312,axiom,(
    ! [VarCurr] :
      ( v1696(VarCurr)
    <=> ( v1677(VarCurr)
        & v1682(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_311,axiom,(
    ! [VarCurr] :
      ( v1693(VarCurr)
    <=> ( v1694(VarCurr)
        | v1695(VarCurr) ) ) )).

fof(addAssignment_326,axiom,(
    ! [VarCurr] :
      ( v1695(VarCurr)
    <=> v1671(VarCurr) ) )).

fof(addAssignment_325,axiom,(
    ! [VarCurr] :
      ( v1694(VarCurr)
    <=> v38(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_310,axiom,(
    ! [VarCurr] :
      ( v1665(VarCurr)
    <=> ( v1666(VarCurr)
        | v1683(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_309,axiom,(
    ! [VarCurr] :
      ( v1683(VarCurr)
    <=> ( v1684(VarCurr)
        & v1238(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_308,axiom,(
    ! [VarCurr] :
      ( v1684(VarCurr)
    <=> ( v1685(VarCurr)
        | v1687(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_307,axiom,(
    ! [VarCurr] :
      ( v1687(VarCurr)
    <=> ( v1689(VarCurr)
        & v1682(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_306,axiom,(
    ! [VarCurr] :
      ( v1689(VarCurr)
    <=> ( v1690(VarCurr)
        & v1681(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_305,axiom,(
    ! [VarCurr] :
      ( v1690(VarCurr)
    <=> ( v1678(VarCurr)
        & v1180(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_304,axiom,(
    ! [VarCurr] :
      ( v1685(VarCurr)
    <=> ( v1671(VarCurr)
        & v1180(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_303,axiom,(
    ! [VarCurr] :
      ( v1671(VarCurr)
    <=> ( v1672(VarCurr)
        & v1347(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_302,axiom,(
    ! [VarCurr] :
      ( v1666(VarCurr)
    <=> ( v1667(VarCurr)
        & v1348(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_301,axiom,(
    ! [VarCurr] :
      ( v1667(VarCurr)
    <=> ( v1668(VarCurr)
        | v1675(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_300,axiom,(
    ! [VarCurr] :
      ( v1675(VarCurr)
    <=> ( v1677(VarCurr)
        & v1682(VarCurr) ) ) )).

fof(writeUnaryOperator_169,axiom,(
    ! [VarCurr] :
      ( ~ v1682(VarCurr)
    <=> v907(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_299,axiom,(
    ! [VarCurr] :
      ( v1677(VarCurr)
    <=> ( v1678(VarCurr)
        & v1681(VarCurr) ) ) )).

fof(writeUnaryOperator_168,axiom,(
    ! [VarCurr] :
      ( ~ v1681(VarCurr)
    <=> v1162(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_298,axiom,(
    ! [VarCurr] :
      ( v1678(VarCurr)
    <=> ( v1679(VarCurr)
        & v1347(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_297,axiom,(
    ! [VarCurr] :
      ( v1679(VarCurr)
    <=> ( v1680(VarCurr)
        & v1346(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_296,axiom,(
    ! [VarCurr] :
      ( v1680(VarCurr)
    <=> ( v87(VarCurr)
        & v1674(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_295,axiom,(
    ! [VarCurr] :
      ( v1668(VarCurr)
    <=> ( v1669(VarCurr)
        | v1670(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_294,axiom,(
    ! [VarCurr] :
      ( v1670(VarCurr)
    <=> ( v1672(VarCurr)
        & v1347(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_293,axiom,(
    ! [VarCurr] :
      ( v1672(VarCurr)
    <=> ( v1673(VarCurr)
        & v1346(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_292,axiom,(
    ! [VarCurr] :
      ( v1673(VarCurr)
    <=> ( v1345(VarCurr)
        & v1674(VarCurr) ) ) )).

fof(writeUnaryOperator_167,axiom,(
    ! [VarCurr] :
      ( ~ v1674(VarCurr)
    <=> v881(VarCurr) ) )).

fof(addAssignment_324,axiom,(
    ! [VarCurr] :
      ( v1669(VarCurr)
    <=> v38(VarCurr) ) )).

fof(addAssignment_323,axiom,(
    ! [VarCurr] :
      ( v1180(VarCurr)
    <=> v1182(VarCurr) ) )).

fof(addAssignment_322,axiom,(
    ! [VarCurr] :
      ( v1182(VarCurr)
    <=> v1184(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_291,axiom,(
    ! [VarCurr] :
      ( v1184(VarCurr)
    <=> ( v1186(VarCurr)
        & v1656(VarCurr) ) ) )).

fof(writeBinaryOperatorShiftedRanges_80,axiom,(
    ! [VarCurr] :
      ( v1656(VarCurr)
    <=> ( v1377(VarCurr,bitIndex2)
        | v1377(VarCurr,bitIndex4) ) ) )).

fof(addAssignment_321,axiom,(
    ! [VarCurr] :
      ( v1186(VarCurr)
    <=> v1188(VarCurr) ) )).

fof(addAssignment_320,axiom,(
    ! [VarCurr] :
      ( v1188(VarCurr)
    <=> v1190(VarCurr) ) )).

fof(addAssignment_319,axiom,(
    ! [VarCurr] :
      ( v1190(VarCurr)
    <=> v1192(VarCurr) ) )).

fof(addAssignment_318,axiom,(
    ! [VarCurr] :
      ( v1192(VarCurr)
    <=> v1194(VarCurr) ) )).

fof(addAssignment_317,axiom,(
    ! [VarCurr] :
      ( v1194(VarCurr)
    <=> v1196(VarCurr) ) )).

fof(addCaseBooleanConditionEqualRanges1_15,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( ~ v1643(VarNext)
       => ( v1196(VarNext)
        <=> v1196(VarCurr) ) ) ) )).

fof(addCaseBooleanConditionEqualRanges0_25,axiom,(
    ! [VarNext] :
      ( v1643(VarNext)
     => ( v1196(VarNext)
      <=> v1651(VarNext) ) ) )).

fof(addAssignment_316,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( v1651(VarNext)
      <=> v1649(VarCurr) ) ) )).

fof(aaddConditionBooleanCondEqualRangesElseBranch_48,axiom,(
    ! [VarCurr] :
      ( ~ v1652(VarCurr)
     => ( v1649(VarCurr)
      <=> v1202(VarCurr) ) ) )).

fof(addConditionBooleanCondEqualRangesThenBranch_51,axiom,(
    ! [VarCurr] :
      ( v1652(VarCurr)
     => ( v1649(VarCurr)
      <=> $false ) ) )).

fof(writeUnaryOperator_166,axiom,(
    ! [VarCurr] :
      ( ~ v1652(VarCurr)
    <=> v1198(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_290,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( v1643(VarNext)
      <=> v1644(VarNext) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_289,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( v1644(VarNext)
      <=> ( v1645(VarNext)
          & v1540(VarNext) ) ) ) )).

fof(writeUnaryOperator_165,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( ~ v1645(VarNext)
      <=> v1549(VarNext) ) ) )).

fof(aaddConditionBooleanCondEqualRangesElseBranch_47,axiom,(
    ! [VarCurr] :
      ( ~ v1602(VarCurr)
     => ( v1202(VarCurr)
      <=> $false ) ) )).

fof(addConditionBooleanCondEqualRangesThenBranch_50,axiom,(
    ! [VarCurr] :
      ( v1602(VarCurr)
     => ( v1202(VarCurr)
      <=> v1626(VarCurr) ) ) )).

fof(addParallelCaseBooleanConditionEqualRanges1_11,axiom,(
    ! [VarCurr] :
      ( ~ v1563(VarCurr)
     => ( v1626(VarCurr)
      <=> $false ) ) )).

fof(addParallelCaseBooleanConditionEqualRanges0_11,axiom,(
    ! [VarCurr] :
      ( v1563(VarCurr)
     => ( v1626(VarCurr)
      <=> v1627(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_288,axiom,(
    ! [VarCurr] :
      ( v1633(VarCurr)
    <=> ( v1635(VarCurr)
        | v1615(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_287,axiom,(
    ! [VarCurr] :
      ( v1635(VarCurr)
    <=> ( v1636(VarCurr)
        | v1614(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_286,axiom,(
    ! [VarCurr] :
      ( v1636(VarCurr)
    <=> ( v1637(VarCurr)
        | v1613(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_285,axiom,(
    ! [VarCurr] :
      ( v1637(VarCurr)
    <=> ( v1638(VarCurr)
        | v1583(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_284,axiom,(
    ! [VarCurr] :
      ( v1638(VarCurr)
    <=> ( v1639(VarCurr)
        | v1582(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_283,axiom,(
    ! [VarCurr] :
      ( v1639(VarCurr)
    <=> ( v1640(VarCurr)
        | v1581(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_282,axiom,(
    ! [VarCurr] :
      ( v1640(VarCurr)
    <=> ( v1566(VarCurr)
        | v1580(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_281,axiom,(
    ! [VarCurr] :
      ( v1566(VarCurr)
    <=> ( v1567(VarCurr)
        | v1572(VarCurr) ) ) )).

fof(aaddConditionBooleanCondEqualRangesElseBranch_46,axiom,(
    ! [VarCurr] :
      ( ~ v1208(VarCurr)
     => ( v1627(VarCurr)
      <=> $false ) ) )).

fof(addConditionBooleanCondEqualRangesThenBranch_49,axiom,(
    ! [VarCurr] :
      ( v1208(VarCurr)
     => ( v1627(VarCurr)
      <=> v1628(VarCurr) ) ) )).

fof(aaddConditionBooleanCondEqualRangesElseBranch_45,axiom,(
    ! [VarCurr] :
      ( ~ v1629(VarCurr)
     => ( v1628(VarCurr)
      <=> $true ) ) )).

fof(addConditionBooleanCondEqualRangesThenBranch_48,axiom,(
    ! [VarCurr] :
      ( v1629(VarCurr)
     => ( v1628(VarCurr)
      <=> $false ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_280,axiom,(
    ! [VarCurr] :
      ( v1629(VarCurr)
    <=> ( v1630(VarCurr)
        & v1538(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_279,axiom,(
    ! [VarCurr] :
      ( v1630(VarCurr)
    <=> ( v1631(VarCurr)
        | v1632(VarCurr) ) ) )).

fof(addBitVectorEqualityBitBlasted_65,axiom,(
    ! [VarCurr] :
      ( v1632(VarCurr)
    <=> ( ( v1497(VarCurr,bitIndex3)
        <=> $true )
        & ( v1497(VarCurr,bitIndex2)
        <=> $true )
        & ( v1497(VarCurr,bitIndex1)
        <=> $false )
        & ( v1497(VarCurr,bitIndex0)
        <=> $true ) ) ) )).

fof(addBitVectorEqualityBitBlasted_64,axiom,(
    ! [VarCurr] :
      ( v1631(VarCurr)
    <=> ( ( v1497(VarCurr,bitIndex3)
        <=> $false )
        & ( v1497(VarCurr,bitIndex2)
        <=> $true )
        & ( v1497(VarCurr,bitIndex1)
        <=> $false )
        & ( v1497(VarCurr,bitIndex0)
        <=> $true ) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_278,axiom,(
    ! [VarCurr] :
      ( v1602(VarCurr)
    <=> ( v1603(VarCurr)
        | v1615(VarCurr) ) ) )).

fof(writeUnaryOperator_164,axiom,(
    ! [VarCurr] :
      ( ~ v1615(VarCurr)
    <=> v1616(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_277,axiom,(
    ! [VarCurr] :
      ( v1616(VarCurr)
    <=> ( v1617(VarCurr)
        | v1584(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_276,axiom,(
    ! [VarCurr] :
      ( v1617(VarCurr)
    <=> ( v1618(VarCurr)
        | v1583(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_275,axiom,(
    ! [VarCurr] :
      ( v1618(VarCurr)
    <=> ( v1619(VarCurr)
        | v1582(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_274,axiom,(
    ! [VarCurr] :
      ( v1619(VarCurr)
    <=> ( v1620(VarCurr)
        | v1581(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_273,axiom,(
    ! [VarCurr] :
      ( v1620(VarCurr)
    <=> ( v1621(VarCurr)
        | v1580(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_272,axiom,(
    ! [VarCurr] :
      ( v1621(VarCurr)
    <=> ( v1622(VarCurr)
        | v1573(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_271,axiom,(
    ! [VarCurr] :
      ( v1622(VarCurr)
    <=> ( v1623(VarCurr)
        | v1572(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_270,axiom,(
    ! [VarCurr] :
      ( v1623(VarCurr)
    <=> ( v1624(VarCurr)
        | v1571(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_269,axiom,(
    ! [VarCurr] :
      ( v1624(VarCurr)
    <=> ( v1625(VarCurr)
        | v1570(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_268,axiom,(
    ! [VarCurr] :
      ( v1625(VarCurr)
    <=> ( v1563(VarCurr)
        | v1569(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_267,axiom,(
    ! [VarCurr] :
      ( v1603(VarCurr)
    <=> ( v1604(VarCurr)
        | v1614(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_266,axiom,(
    ! [VarCurr] :
      ( v1614(VarCurr)
    <=> ( v1586(VarCurr)
        & v1584(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_265,axiom,(
    ! [VarCurr] :
      ( v1604(VarCurr)
    <=> ( v1605(VarCurr)
        | v1583(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_264,axiom,(
    ! [VarCurr] :
      ( v1605(VarCurr)
    <=> ( v1606(VarCurr)
        | v1582(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_263,axiom,(
    ! [VarCurr] :
      ( v1606(VarCurr)
    <=> ( v1607(VarCurr)
        | v1581(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_262,axiom,(
    ! [VarCurr] :
      ( v1607(VarCurr)
    <=> ( v1608(VarCurr)
        | v1580(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_261,axiom,(
    ! [VarCurr] :
      ( v1608(VarCurr)
    <=> ( v1609(VarCurr)
        | v1613(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_260,axiom,(
    ! [VarCurr] :
      ( v1613(VarCurr)
    <=> ( v1575(VarCurr)
        & v1573(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_259,axiom,(
    ! [VarCurr] :
      ( v1609(VarCurr)
    <=> ( v1610(VarCurr)
        | v1572(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_258,axiom,(
    ! [VarCurr] :
      ( v1610(VarCurr)
    <=> ( v1611(VarCurr)
        | v1571(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_257,axiom,(
    ! [VarCurr] :
      ( v1611(VarCurr)
    <=> ( v1612(VarCurr)
        | v1570(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_256,axiom,(
    ! [VarCurr] :
      ( v1612(VarCurr)
    <=> ( v1563(VarCurr)
        | v1569(VarCurr) ) ) )).

fof(addCaseBooleanConditionEqualRanges1_14,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( ~ v1589(VarNext)
       => ! [B] :
            ( range_3_0(B)
           => ( v1204(VarNext,B)
            <=> v1204(VarCurr,B) ) ) ) ) )).

fof(addCaseBooleanConditionEqualRanges0_24,axiom,(
    ! [VarNext] :
      ( v1589(VarNext)
     => ! [B] :
          ( range_3_0(B)
         => ( v1204(VarNext,B)
          <=> v1597(VarNext,B) ) ) ) )).

fof(addAssignment_315,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ! [B] :
          ( range_3_0(B)
         => ( v1597(VarNext,B)
          <=> v1595(VarCurr,B) ) ) ) )).

fof(aaddConditionBooleanCondEqualRangesElseBranch_44,axiom,(
    ! [VarCurr] :
      ( ~ v1598(VarCurr)
     => ! [B] :
          ( range_3_0(B)
         => ( v1595(VarCurr,B)
          <=> v1206(VarCurr,B) ) ) ) )).

fof(addConditionBooleanCondEqualRangesThenBranch_47,axiom,(
    ! [VarCurr] :
      ( v1598(VarCurr)
     => ! [B] :
          ( range_3_0(B)
         => ( v1595(VarCurr,B)
          <=> $false ) ) ) )).

fof(writeUnaryOperator_163,axiom,(
    ! [VarCurr] :
      ( ~ v1598(VarCurr)
    <=> v1198(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_255,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( v1589(VarNext)
      <=> v1590(VarNext) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_254,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( v1590(VarNext)
      <=> ( v1591(VarNext)
          & v1540(VarNext) ) ) ) )).

fof(writeUnaryOperator_162,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( ~ v1591(VarNext)
      <=> v1549(VarNext) ) ) )).

fof(addParallelCaseBooleanConditionEqualRanges5,axiom,(
    ! [VarCurr] :
      ( ( ~ v1563(VarCurr)
        & ~ v1565(VarCurr)
        & ~ v1573(VarCurr)
        & ~ v1576(VarCurr)
        & ~ v1584(VarCurr) )
     => ! [B] :
          ( range_3_0(B)
         => ( v1206(VarCurr,B)
          <=> $false ) ) ) )).

fof(addParallelCaseBooleanConditionEqualRanges4,axiom,(
    ! [VarCurr] :
      ( v1584(VarCurr)
     => ! [B] :
          ( range_3_0(B)
         => ( v1206(VarCurr,B)
          <=> v1585(VarCurr,B) ) ) ) )).

fof(addParallelCaseBooleanConditionEqualRanges3_4,axiom,(
    ! [VarCurr] :
      ( v1576(VarCurr)
     => ! [B] :
          ( range_3_0(B)
         => ( v1206(VarCurr,B)
          <=> $false ) ) ) )).

fof(addParallelCaseBooleanConditionEqualRanges2_4,axiom,(
    ! [VarCurr] :
      ( v1573(VarCurr)
     => ! [B] :
          ( range_3_0(B)
         => ( v1206(VarCurr,B)
          <=> v1574(VarCurr,B) ) ) ) )).

fof(addParallelCaseBooleanConditionEqualRanges1_10,axiom,(
    ! [VarCurr] :
      ( v1565(VarCurr)
     => ! [B] :
          ( range_3_0(B)
         => ( v1206(VarCurr,B)
          <=> $false ) ) ) )).

fof(addParallelCaseBooleanConditionEqualRanges0_10,axiom,(
    ! [VarCurr] :
      ( v1563(VarCurr)
     => ! [B] :
          ( range_3_0(B)
         => ( v1206(VarCurr,B)
          <=> v1564(VarCurr,B) ) ) ) )).

fof(aaddConditionBooleanCondEqualRangesElseBranch_43,axiom,(
    ! [VarCurr] :
      ( ~ v1586(VarCurr)
     => ! [B] :
          ( range_3_0(B)
         => ( v1585(VarCurr,B)
          <=> $false ) ) ) )).

fof(addConditionBooleanCondEqualRangesThenBranch_46,axiom,(
    ! [VarCurr] :
      ( v1586(VarCurr)
     => ! [B] :
          ( range_3_0(B)
         => ( v1585(VarCurr,B)
          <=> $false ) ) ) )).

fof(writeUnaryOperator_161,axiom,(
    ! [VarCurr] :
      ( ~ v1586(VarCurr)
    <=> v1536(VarCurr) ) )).

fof(addBitVectorEqualityBitBlasted_63,axiom,(
    ! [VarCurr] :
      ( v1584(VarCurr)
    <=> ( ( v1204(VarCurr,bitIndex3)
        <=> $true )
        & ( v1204(VarCurr,bitIndex2)
        <=> $true )
        & ( v1204(VarCurr,bitIndex1)
        <=> $false )
        & ( v1204(VarCurr,bitIndex0)
        <=> $true ) ) ) )).

fof(bitBlastConstant_289,axiom,(
    b1101(bitIndex3) )).

fof(bitBlastConstant_288,axiom,(
    b1101(bitIndex2) )).

fof(bitBlastConstant_287,axiom,(
    ~ b1101(bitIndex1) )).

fof(bitBlastConstant_286,axiom,(
    b1101(bitIndex0) )).

fof(writeBinaryOperatorEqualRangesSingleBits_253,axiom,(
    ! [VarCurr] :
      ( v1576(VarCurr)
    <=> ( v1578(VarCurr)
        | v1583(VarCurr) ) ) )).

fof(addBitVectorEqualityBitBlasted_62,axiom,(
    ! [VarCurr] :
      ( v1583(VarCurr)
    <=> ( ( v1204(VarCurr,bitIndex3)
        <=> $true )
        & ( v1204(VarCurr,bitIndex2)
        <=> $true )
        & ( v1204(VarCurr,bitIndex1)
        <=> $false )
        & ( v1204(VarCurr,bitIndex0)
        <=> $false ) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_252,axiom,(
    ! [VarCurr] :
      ( v1578(VarCurr)
    <=> ( v1579(VarCurr)
        | v1582(VarCurr) ) ) )).

fof(addBitVectorEqualityBitBlasted_61,axiom,(
    ! [VarCurr] :
      ( v1582(VarCurr)
    <=> ( ( v1204(VarCurr,bitIndex3)
        <=> $true )
        & ( v1204(VarCurr,bitIndex2)
        <=> $false )
        & ( v1204(VarCurr,bitIndex1)
        <=> $true )
        & ( v1204(VarCurr,bitIndex0)
        <=> $true ) ) ) )).

fof(bitBlastConstant_285,axiom,(
    b1011(bitIndex3) )).

fof(bitBlastConstant_284,axiom,(
    ~ b1011(bitIndex2) )).

fof(bitBlastConstant_283,axiom,(
    b1011(bitIndex1) )).

fof(bitBlastConstant_282,axiom,(
    b1011(bitIndex0) )).

fof(writeBinaryOperatorEqualRangesSingleBits_251,axiom,(
    ! [VarCurr] :
      ( v1579(VarCurr)
    <=> ( v1580(VarCurr)
        | v1581(VarCurr) ) ) )).

fof(addBitVectorEqualityBitBlasted_60,axiom,(
    ! [VarCurr] :
      ( v1581(VarCurr)
    <=> ( ( v1204(VarCurr,bitIndex3)
        <=> $true )
        & ( v1204(VarCurr,bitIndex2)
        <=> $false )
        & ( v1204(VarCurr,bitIndex1)
        <=> $true )
        & ( v1204(VarCurr,bitIndex0)
        <=> $false ) ) ) )).

fof(bitBlastConstant_281,axiom,(
    b1010(bitIndex3) )).

fof(bitBlastConstant_280,axiom,(
    ~ b1010(bitIndex2) )).

fof(bitBlastConstant_279,axiom,(
    b1010(bitIndex1) )).

fof(bitBlastConstant_278,axiom,(
    ~ b1010(bitIndex0) )).

fof(addBitVectorEqualityBitBlasted_59,axiom,(
    ! [VarCurr] :
      ( v1580(VarCurr)
    <=> ( ( v1204(VarCurr,bitIndex3)
        <=> $true )
        & ( v1204(VarCurr,bitIndex2)
        <=> $false )
        & ( v1204(VarCurr,bitIndex1)
        <=> $false )
        & ( v1204(VarCurr,bitIndex0)
        <=> $true ) ) ) )).

fof(bitBlastConstant_277,axiom,(
    b1001(bitIndex3) )).

fof(bitBlastConstant_276,axiom,(
    ~ b1001(bitIndex2) )).

fof(bitBlastConstant_275,axiom,(
    ~ b1001(bitIndex1) )).

fof(bitBlastConstant_274,axiom,(
    b1001(bitIndex0) )).

fof(aaddConditionBooleanCondEqualRangesElseBranch_42,axiom,(
    ! [VarCurr] :
      ( ~ v1575(VarCurr)
     => ! [B] :
          ( range_3_0(B)
         => ( v1574(VarCurr,B)
          <=> $false ) ) ) )).

fof(addConditionBooleanCondEqualRangesThenBranch_45,axiom,(
    ! [VarCurr] :
      ( v1575(VarCurr)
     => ! [B] :
          ( range_3_0(B)
         => ( v1574(VarCurr,B)
          <=> $false ) ) ) )).

fof(writeUnaryOperator_160,axiom,(
    ! [VarCurr] :
      ( ~ v1575(VarCurr)
    <=> v1536(VarCurr) ) )).

fof(addBitVectorEqualityBitBlasted_58,axiom,(
    ! [VarCurr] :
      ( v1573(VarCurr)
    <=> ( ( v1204(VarCurr,bitIndex3)
        <=> $false )
        & ( v1204(VarCurr,bitIndex2)
        <=> $true )
        & ( v1204(VarCurr,bitIndex1)
        <=> $false )
        & ( v1204(VarCurr,bitIndex0)
        <=> $true ) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_250,axiom,(
    ! [VarCurr] :
      ( v1565(VarCurr)
    <=> ( v1567(VarCurr)
        | v1572(VarCurr) ) ) )).

fof(addBitVectorEqualityBitBlasted_57,axiom,(
    ! [VarCurr] :
      ( v1572(VarCurr)
    <=> ( ( v1204(VarCurr,bitIndex3)
        <=> $false )
        & ( v1204(VarCurr,bitIndex2)
        <=> $true )
        & ( v1204(VarCurr,bitIndex1)
        <=> $false )
        & ( v1204(VarCurr,bitIndex0)
        <=> $false ) ) ) )).

fof(bitBlastConstant_273,axiom,(
    ~ b0100(bitIndex3) )).

fof(bitBlastConstant_272,axiom,(
    b0100(bitIndex2) )).

fof(bitBlastConstant_271,axiom,(
    ~ b0100(bitIndex1) )).

fof(bitBlastConstant_270,axiom,(
    ~ b0100(bitIndex0) )).

fof(writeBinaryOperatorEqualRangesSingleBits_249,axiom,(
    ! [VarCurr] :
      ( v1567(VarCurr)
    <=> ( v1568(VarCurr)
        | v1571(VarCurr) ) ) )).

fof(addBitVectorEqualityBitBlasted_56,axiom,(
    ! [VarCurr] :
      ( v1571(VarCurr)
    <=> ( ( v1204(VarCurr,bitIndex3)
        <=> $false )
        & ( v1204(VarCurr,bitIndex2)
        <=> $false )
        & ( v1204(VarCurr,bitIndex1)
        <=> $true )
        & ( v1204(VarCurr,bitIndex0)
        <=> $true ) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_248,axiom,(
    ! [VarCurr] :
      ( v1568(VarCurr)
    <=> ( v1569(VarCurr)
        | v1570(VarCurr) ) ) )).

fof(addBitVectorEqualityBitBlasted_55,axiom,(
    ! [VarCurr] :
      ( v1570(VarCurr)
    <=> ( ( v1204(VarCurr,bitIndex3)
        <=> $false )
        & ( v1204(VarCurr,bitIndex2)
        <=> $false )
        & ( v1204(VarCurr,bitIndex1)
        <=> $true )
        & ( v1204(VarCurr,bitIndex0)
        <=> $false ) ) ) )).

fof(bitBlastConstant_269,axiom,(
    ~ b0010(bitIndex3) )).

fof(bitBlastConstant_268,axiom,(
    ~ b0010(bitIndex2) )).

fof(bitBlastConstant_267,axiom,(
    b0010(bitIndex1) )).

fof(bitBlastConstant_266,axiom,(
    ~ b0010(bitIndex0) )).

fof(addBitVectorEqualityBitBlasted_54,axiom,(
    ! [VarCurr] :
      ( v1569(VarCurr)
    <=> ( ( v1204(VarCurr,bitIndex3)
        <=> $false )
        & ( v1204(VarCurr,bitIndex2)
        <=> $false )
        & ( v1204(VarCurr,bitIndex1)
        <=> $false )
        & ( v1204(VarCurr,bitIndex0)
        <=> $true ) ) ) )).

fof(aaddConditionBooleanCondEqualRangesElseBranch_41,axiom,(
    ! [VarCurr] :
      ( ~ v1208(VarCurr)
     => ! [B] :
          ( range_3_0(B)
         => ( v1564(VarCurr,B)
          <=> $false ) ) ) )).

fof(addConditionBooleanCondEqualRangesThenBranch_44,axiom,(
    ! [VarCurr] :
      ( v1208(VarCurr)
     => ! [B] :
          ( range_3_0(B)
         => ( v1564(VarCurr,B)
          <=> v1497(VarCurr,B) ) ) ) )).

fof(addBitVectorEqualityBitBlasted_53,axiom,(
    ! [VarCurr] :
      ( v1563(VarCurr)
    <=> ( ( v1204(VarCurr,bitIndex3)
        <=> $false )
        & ( v1204(VarCurr,bitIndex2)
        <=> $false )
        & ( v1204(VarCurr,bitIndex1)
        <=> $false )
        & ( v1204(VarCurr,bitIndex0)
        <=> $false ) ) ) )).

fof(addAssignmentInitValueVector_15,axiom,(
    ! [B] :
      ( range_3_0(B)
     => ( v1204(constB0,B)
      <=> $false ) ) )).

fof(addCaseBooleanConditionEqualRanges1_13,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( ~ v1545(VarNext)
       => ( v1536(VarNext)
        <=> v1536(VarCurr) ) ) ) )).

fof(addCaseBooleanConditionEqualRanges0_23,axiom,(
    ! [VarNext] :
      ( v1545(VarNext)
     => ( v1536(VarNext)
      <=> v1555(VarNext) ) ) )).

fof(addAssignment_314,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( v1555(VarNext)
      <=> v1553(VarCurr) ) ) )).

fof(aaddConditionBooleanCondEqualRangesElseBranch_40,axiom,(
    ! [VarCurr] :
      ( ~ v1556(VarCurr)
     => ( v1553(VarCurr)
      <=> v1538(VarCurr) ) ) )).

fof(addConditionBooleanCondEqualRangesThenBranch_43,axiom,(
    ! [VarCurr] :
      ( v1556(VarCurr)
     => ( v1553(VarCurr)
      <=> $false ) ) )).

fof(writeUnaryOperator_159,axiom,(
    ! [VarCurr] :
      ( ~ v1556(VarCurr)
    <=> v1198(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_247,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( v1545(VarNext)
      <=> v1546(VarNext) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_246,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( v1546(VarNext)
      <=> ( v1547(VarNext)
          & v1540(VarNext) ) ) ) )).

fof(writeUnaryOperator_158,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( ~ v1547(VarNext)
      <=> v1549(VarNext) ) ) )).

fof(addAssignment_313,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( v1549(VarNext)
      <=> v1540(VarCurr) ) ) )).

fof(addAssignmentInitValueVector_14,axiom,
    ( v1536(constB0)
  <=> $false )).

fof(addAssignment_312,axiom,(
    ! [VarCurr] :
      ( v1540(VarCurr)
    <=> v1542(VarCurr) ) )).

fof(addAssignment_311,axiom,(
    ! [VarCurr] :
      ( v1542(VarCurr)
    <=> v1(VarCurr) ) )).

fof(addAssignment_310,axiom,(
    ! [VarCurr] :
      ( v1538(VarCurr)
    <=> $false ) )).

fof(addAssignment_309,axiom,(
    ! [VarCurr,B] :
      ( range_3_0(B)
     => ( v1497(VarCurr,B)
      <=> v1499(VarCurr,B) ) ) )).

fof(addAssignment_308,axiom,(
    ! [VarCurr,B] :
      ( range_3_0(B)
     => ( v1499(VarCurr,B)
      <=> v1501(VarCurr,B) ) ) )).

fof(addAssignment_307,axiom,(
    ! [VarCurr,B] :
      ( range_3_0(B)
     => ( v1501(VarCurr,B)
      <=> v1503(VarCurr,B) ) ) )).

fof(addAssignment_306,axiom,(
    ! [VarCurr,B] :
      ( range_3_0(B)
     => ( v1503(VarCurr,B)
      <=> v1505(VarCurr,B) ) ) )).

fof(addAssignment_305,axiom,(
    ! [VarCurr,B] :
      ( range_3_0(B)
     => ( v1505(VarCurr,B)
      <=> v1507(VarCurr,B) ) ) )).

fof(addCaseBooleanConditionEqualRanges1_12,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( ~ v1512(VarNext)
       => ! [B] :
            ( range_3_0(B)
           => ( v1507(VarNext,B)
            <=> v1507(VarCurr,B) ) ) ) ) )).

fof(addCaseBooleanConditionEqualRanges0_22,axiom,(
    ! [VarNext] :
      ( v1512(VarNext)
     => ! [B] :
          ( range_3_0(B)
         => ( v1507(VarNext,B)
          <=> v1529(VarNext,B) ) ) ) )).

fof(addAssignment_304,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ! [B] :
          ( range_3_0(B)
         => ( v1529(VarNext,B)
          <=> v1527(VarCurr,B) ) ) ) )).

fof(addParallelCaseBooleanConditionEqualRanges1_9,axiom,(
    ! [VarCurr] :
      ( ~ v1521(VarCurr)
     => ! [B] :
          ( range_3_0(B)
         => ( v1527(VarCurr,B)
          <=> v1530(VarCurr,B) ) ) ) )).

fof(addParallelCaseBooleanConditionEqualRanges0_9,axiom,(
    ! [VarCurr] :
      ( v1521(VarCurr)
     => ! [B] :
          ( range_3_0(B)
         => ( v1527(VarCurr,B)
          <=> $false ) ) ) )).

fof(addParallelCaseBooleanConditionEqualRanges1_8,axiom,(
    ! [VarCurr] :
      ( ~ v1222(VarCurr,bitIndex3)
     => ! [B] :
          ( range_3_0(B)
         => ( v1530(VarCurr,B)
          <=> b0011(B) ) ) ) )).

fof(bitBlastConstant_265,axiom,(
    ~ b0011(bitIndex3) )).

fof(bitBlastConstant_264,axiom,(
    ~ b0011(bitIndex2) )).

fof(bitBlastConstant_263,axiom,(
    b0011(bitIndex1) )).

fof(bitBlastConstant_262,axiom,(
    b0011(bitIndex0) )).

fof(addParallelCaseBooleanConditionEqualRanges0_8,axiom,(
    ! [VarCurr] :
      ( v1222(VarCurr,bitIndex3)
     => ! [B] :
          ( range_3_0(B)
         => ( v1530(VarCurr,B)
          <=> b1100(B) ) ) ) )).

fof(bitBlastConstant_261,axiom,(
    b1100(bitIndex3) )).

fof(bitBlastConstant_260,axiom,(
    b1100(bitIndex2) )).

fof(bitBlastConstant_259,axiom,(
    ~ b1100(bitIndex1) )).

fof(bitBlastConstant_258,axiom,(
    ~ b1100(bitIndex0) )).

fof(writeBinaryOperatorEqualRangesSingleBits_245,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( v1512(VarNext)
      <=> ( v1513(VarNext)
          & v1520(VarNext) ) ) ) )).

fof(addAssignment_303,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( v1520(VarNext)
      <=> v1518(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_244,axiom,(
    ! [VarCurr] :
      ( v1518(VarCurr)
    <=> ( v1521(VarCurr)
        | v1522(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_243,axiom,(
    ! [VarCurr] :
      ( v1522(VarCurr)
    <=> ( v1523(VarCurr)
        & v1526(VarCurr) ) ) )).

fof(writeUnaryOperator_157,axiom,(
    ! [VarCurr] :
      ( ~ v1526(VarCurr)
    <=> v1521(VarCurr) ) )).

fof(writeBinaryOperatorShiftedRanges_79,axiom,(
    ! [VarCurr] :
      ( v1523(VarCurr)
    <=> ( v1222(VarCurr,bitIndex3)
        | v1524(VarCurr) ) ) )).

fof(writeBinaryOperatorShiftedRanges_78,axiom,(
    ! [VarCurr] :
      ( v1524(VarCurr)
    <=> ( v1222(VarCurr,bitIndex1)
        & v1525(VarCurr) ) ) )).

fof(writeUnaryOperator_156,axiom,(
    ! [VarCurr] :
      ( ~ v1525(VarCurr)
    <=> v1222(VarCurr,bitIndex3) ) )).

fof(writeUnaryOperator_155,axiom,(
    ! [VarCurr] :
      ( ~ v1521(VarCurr)
    <=> v1220(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_242,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( v1513(VarNext)
      <=> ( v1514(VarNext)
          & v1402(VarNext) ) ) ) )).

fof(writeUnaryOperator_154,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( ~ v1514(VarNext)
      <=> v1409(VarNext) ) ) )).

fof(addAssignment_302,axiom,(
    ! [VarCurr] :
      ( v1208(VarCurr)
    <=> v1210(VarCurr) ) )).

fof(addAssignment_301,axiom,(
    ! [VarCurr] :
      ( v1210(VarCurr)
    <=> v1212(VarCurr) ) )).

fof(addAssignment_300,axiom,(
    ! [VarCurr] :
      ( v1212(VarCurr)
    <=> v1214(VarCurr) ) )).

fof(addAssignment_299,axiom,(
    ! [VarCurr] :
      ( v1214(VarCurr)
    <=> v1216(VarCurr) ) )).

fof(addAssignment_298,axiom,(
    ! [VarCurr] :
      ( v1216(VarCurr)
    <=> v1218(VarCurr) ) )).

fof(addCaseBooleanConditionEqualRanges1_11,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( ~ v1482(VarNext)
       => ( v1218(VarNext)
        <=> v1218(VarCurr) ) ) ) )).

fof(addCaseBooleanConditionEqualRanges0_21,axiom,(
    ! [VarNext] :
      ( v1482(VarNext)
     => ( v1218(VarNext)
      <=> v1490(VarNext) ) ) )).

fof(addAssignment_297,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( v1490(VarNext)
      <=> v1488(VarCurr) ) ) )).

fof(aaddConditionBooleanCondEqualRangesElseBranch_39,axiom,(
    ! [VarCurr] :
      ( ~ v1491(VarCurr)
     => ( v1488(VarCurr)
      <=> v1492(VarCurr) ) ) )).

fof(addConditionBooleanCondEqualRangesThenBranch_42,axiom,(
    ! [VarCurr] :
      ( v1491(VarCurr)
     => ( v1488(VarCurr)
      <=> $false ) ) )).

fof(aaddConditionBooleanCondEqualRangesElseBranch_38,axiom,(
    ! [VarCurr] :
      ( ~ v1493(VarCurr)
     => ( v1492(VarCurr)
      <=> $false ) ) )).

fof(addConditionBooleanCondEqualRangesThenBranch_41,axiom,(
    ! [VarCurr] :
      ( v1493(VarCurr)
     => ( v1492(VarCurr)
      <=> $true ) ) )).

fof(writeUnaryOperator_153,axiom,(
    ! [VarCurr] :
      ( ~ v1493(VarCurr)
    <=> v1222(VarCurr,bitIndex0) ) )).

fof(writeUnaryOperator_152,axiom,(
    ! [VarCurr] :
      ( ~ v1491(VarCurr)
    <=> v1220(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_241,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( v1482(VarNext)
      <=> v1483(VarNext) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_240,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( v1483(VarNext)
      <=> ( v1484(VarNext)
          & v1402(VarNext) ) ) ) )).

fof(writeUnaryOperator_151,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( ~ v1484(VarNext)
      <=> v1409(VarNext) ) ) )).

fof(aaddConditionBooleanCondEqualRangesElseBranch_37,axiom,(
    ! [VarCurr] :
      ( ~ v1470(VarCurr)
     => ( v1222(VarCurr,bitIndex0)
      <=> $false ) ) )).

fof(addConditionBooleanCondEqualRangesThenBranch_40,axiom,(
    ! [VarCurr] :
      ( v1470(VarCurr)
     => ( v1222(VarCurr,bitIndex0)
      <=> $true ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_239,axiom,(
    ! [VarCurr] :
      ( v1470(VarCurr)
    <=> ( v1471(VarCurr)
        | v1478(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_238,axiom,(
    ! [VarCurr] :
      ( v1478(VarCurr)
    <=> ( v1479(VarCurr)
        & v1400(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_237,axiom,(
    ! [VarCurr] :
      ( v1479(VarCurr)
    <=> ( v1474(VarCurr)
        & v1186(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_236,axiom,(
    ! [VarCurr] :
      ( v1471(VarCurr)
    <=> ( v1472(VarCurr)
        | v1475(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_235,axiom,(
    ! [VarCurr] :
      ( v1475(VarCurr)
    <=> ( v1476(VarCurr)
        & v1397(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_234,axiom,(
    ! [VarCurr] :
      ( v1476(VarCurr)
    <=> ( v1474(VarCurr)
        & v1186(VarCurr) ) ) )).

fof(writeUnaryOperator_150,axiom,(
    ! [VarCurr] :
      ( ~ v1474(VarCurr)
    <=> v1224(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_233,axiom,(
    ! [VarCurr] :
      ( v1472(VarCurr)
    <=> ( v1473(VarCurr)
        & v1391(VarCurr) ) ) )).

fof(writeUnaryOperator_149,axiom,(
    ! [VarCurr] :
      ( ~ v1473(VarCurr)
    <=> v1224(VarCurr) ) )).

fof(addAssignment_296,axiom,(
    ! [VarNext] :
      ( v1377(VarNext,bitIndex2)
    <=> v1462(VarNext,bitIndex1) ) )).

fof(addCaseBooleanConditionShiftedRanges1_10,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( ~ v1463(VarNext)
       => ( ( v1462(VarNext,bitIndex3)
          <=> v1377(VarCurr,bitIndex4) )
          & ( v1462(VarNext,bitIndex2)
          <=> v1377(VarCurr,bitIndex3) )
          & ( v1462(VarNext,bitIndex1)
          <=> v1377(VarCurr,bitIndex2) )
          & ( v1462(VarNext,bitIndex0)
          <=> v1377(VarCurr,bitIndex1) ) ) ) ) )).

fof(addCaseBooleanConditionEqualRanges0_20,axiom,(
    ! [VarNext] :
      ( v1463(VarNext)
     => ! [B] :
          ( range_3_0(B)
         => ( v1462(VarNext,B)
          <=> v1415(VarNext,B) ) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_232,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( v1463(VarNext)
      <=> v1464(VarNext) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_231,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( v1464(VarNext)
      <=> ( v1466(VarNext)
          & v1402(VarNext) ) ) ) )).

fof(writeUnaryOperator_148,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( ~ v1466(VarNext)
      <=> v1409(VarNext) ) ) )).

fof(addConditionBooleanCondShiftedRangesElseBranch_12,axiom,(
    ! [VarCurr] :
      ( ~ v1457(VarCurr)
     => ( v1222(VarCurr,bitIndex2)
      <=> $false ) ) )).

fof(addConditionBooleanCondShiftedRangesThenBranch_9,axiom,(
    ! [VarCurr] :
      ( v1457(VarCurr)
     => ( v1222(VarCurr,bitIndex2)
      <=> $true ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_230,axiom,(
    ! [VarCurr] :
      ( v1457(VarCurr)
    <=> ( v1458(VarCurr)
        | v1459(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_229,axiom,(
    ! [VarCurr] :
      ( v1459(VarCurr)
    <=> ( v1460(VarCurr)
        & v1397(VarCurr) ) ) )).

fof(writeUnaryOperator_147,axiom,(
    ! [VarCurr] :
      ( ~ v1460(VarCurr)
    <=> v1186(VarCurr) ) )).

fof(addBitVectorEqualityBitBlasted_52,axiom,(
    ! [VarCurr] :
      ( v1458(VarCurr)
    <=> ( $true
      <=> v1377(VarCurr,bitIndex1) ) ) )).

fof(addAssignment_295,axiom,(
    ! [VarNext] :
      ( v1377(VarNext,bitIndex1)
    <=> v1449(VarNext,bitIndex0) ) )).

fof(addCaseBooleanConditionShiftedRanges1_9,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( ~ v1450(VarNext)
       => ( ( v1449(VarNext,bitIndex3)
          <=> v1377(VarCurr,bitIndex4) )
          & ( v1449(VarNext,bitIndex2)
          <=> v1377(VarCurr,bitIndex3) )
          & ( v1449(VarNext,bitIndex1)
          <=> v1377(VarCurr,bitIndex2) )
          & ( v1449(VarNext,bitIndex0)
          <=> v1377(VarCurr,bitIndex1) ) ) ) ) )).

fof(addCaseBooleanConditionEqualRanges0_19,axiom,(
    ! [VarNext] :
      ( v1450(VarNext)
     => ! [B] :
          ( range_3_0(B)
         => ( v1449(VarNext,B)
          <=> v1415(VarNext,B) ) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_228,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( v1450(VarNext)
      <=> v1451(VarNext) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_227,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( v1451(VarNext)
      <=> ( v1453(VarNext)
          & v1402(VarNext) ) ) ) )).

fof(writeUnaryOperator_146,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( ~ v1453(VarNext)
      <=> v1409(VarNext) ) ) )).

fof(addConditionBooleanCondShiftedRangesElseBranch_11,axiom,(
    ! [VarCurr] :
      ( ~ v1435(VarCurr)
     => ( v1222(VarCurr,bitIndex1)
      <=> $false ) ) )).

fof(addConditionBooleanCondShiftedRangesThenBranch_8,axiom,(
    ! [VarCurr] :
      ( v1435(VarCurr)
     => ( v1222(VarCurr,bitIndex1)
      <=> $true ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_226,axiom,(
    ! [VarCurr] :
      ( v1435(VarCurr)
    <=> ( v1436(VarCurr)
        | v1446(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_225,axiom,(
    ! [VarCurr] :
      ( v1446(VarCurr)
    <=> ( v1447(VarCurr)
        & v1400(VarCurr) ) ) )).

fof(writeBinaryOperatorShiftedRanges_77,axiom,(
    ! [VarCurr] :
      ( v1447(VarCurr)
    <=> ( v1445(VarCurr)
        & v1368(VarCurr,bitIndex1) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_224,axiom,(
    ! [VarCurr] :
      ( v1436(VarCurr)
    <=> ( v1437(VarCurr)
        | v1442(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_223,axiom,(
    ! [VarCurr] :
      ( v1442(VarCurr)
    <=> ( v1443(VarCurr)
        & v1397(VarCurr) ) ) )).

fof(writeBinaryOperatorShiftedRanges_76,axiom,(
    ! [VarCurr] :
      ( v1443(VarCurr)
    <=> ( v1445(VarCurr)
        & v1368(VarCurr,bitIndex1) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_222,axiom,(
    ! [VarCurr] :
      ( v1445(VarCurr)
    <=> ( v1396(VarCurr)
        & v1441(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_221,axiom,(
    ! [VarCurr] :
      ( v1437(VarCurr)
    <=> ( v1438(VarCurr)
        & v1391(VarCurr) ) ) )).

fof(writeBinaryOperatorShiftedRanges_75,axiom,(
    ! [VarCurr] :
      ( v1438(VarCurr)
    <=> ( v1440(VarCurr)
        & v1368(VarCurr,bitIndex1) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_220,axiom,(
    ! [VarCurr] :
      ( v1440(VarCurr)
    <=> ( v1224(VarCurr)
        & v1441(VarCurr) ) ) )).

fof(writeUnaryOperator_145,axiom,(
    ! [VarCurr] :
      ( ~ v1441(VarCurr)
    <=> v1368(VarCurr,bitIndex0) ) )).

fof(addAssignment_294,axiom,(
    ! [VarNext] :
      ( v1377(VarNext,bitIndex4)
    <=> v1427(VarNext,bitIndex3) ) )).

fof(addCaseBooleanConditionShiftedRanges1_8,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( ~ v1428(VarNext)
       => ( ( v1427(VarNext,bitIndex3)
          <=> v1377(VarCurr,bitIndex4) )
          & ( v1427(VarNext,bitIndex2)
          <=> v1377(VarCurr,bitIndex3) )
          & ( v1427(VarNext,bitIndex1)
          <=> v1377(VarCurr,bitIndex2) )
          & ( v1427(VarNext,bitIndex0)
          <=> v1377(VarCurr,bitIndex1) ) ) ) ) )).

fof(addCaseBooleanConditionEqualRanges0_18,axiom,(
    ! [VarNext] :
      ( v1428(VarNext)
     => ! [B] :
          ( range_3_0(B)
         => ( v1427(VarNext,B)
          <=> v1415(VarNext,B) ) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_219,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( v1428(VarNext)
      <=> v1429(VarNext) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_218,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( v1429(VarNext)
      <=> ( v1431(VarNext)
          & v1402(VarNext) ) ) ) )).

fof(writeUnaryOperator_144,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( ~ v1431(VarNext)
      <=> v1409(VarNext) ) ) )).

fof(addConditionBooleanCondShiftedRangesElseBranch_10,axiom,(
    ! [VarCurr] :
      ( ~ v1421(VarCurr)
     => ( v1222(VarCurr,bitIndex4)
      <=> $false ) ) )).

fof(addConditionBooleanCondShiftedRangesThenBranch_7,axiom,(
    ! [VarCurr] :
      ( v1421(VarCurr)
     => ( v1222(VarCurr,bitIndex4)
      <=> $true ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_217,axiom,(
    ! [VarCurr] :
      ( v1421(VarCurr)
    <=> ( v1422(VarCurr)
        | v1423(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_216,axiom,(
    ! [VarCurr] :
      ( v1423(VarCurr)
    <=> ( v1424(VarCurr)
        & v1400(VarCurr) ) ) )).

fof(writeUnaryOperator_143,axiom,(
    ! [VarCurr] :
      ( ~ v1424(VarCurr)
    <=> v1186(VarCurr) ) )).

fof(addBitVectorEqualityBitBlasted_51,axiom,(
    ! [VarCurr] :
      ( v1422(VarCurr)
    <=> ( $true
      <=> v1377(VarCurr,bitIndex3) ) ) )).

fof(addAssignment_293,axiom,(
    ! [VarNext] :
      ( v1377(VarNext,bitIndex3)
    <=> v1404(VarNext,bitIndex2) ) )).

fof(addCaseBooleanConditionShiftedRanges1_7,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( ~ v1405(VarNext)
       => ( ( v1404(VarNext,bitIndex3)
          <=> v1377(VarCurr,bitIndex4) )
          & ( v1404(VarNext,bitIndex2)
          <=> v1377(VarCurr,bitIndex3) )
          & ( v1404(VarNext,bitIndex1)
          <=> v1377(VarCurr,bitIndex2) )
          & ( v1404(VarNext,bitIndex0)
          <=> v1377(VarCurr,bitIndex1) ) ) ) ) )).

fof(addCaseBooleanConditionEqualRanges0_17,axiom,(
    ! [VarNext] :
      ( v1405(VarNext)
     => ! [B] :
          ( range_3_0(B)
         => ( v1404(VarNext,B)
          <=> v1415(VarNext,B) ) ) ) )).

fof(addAssignment_292,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ! [B] :
          ( range_3_0(B)
         => ( v1415(VarNext,B)
          <=> v1413(VarCurr,B) ) ) ) )).

fof(addConditionBooleanCondShiftedRangesElseBranch_9,axiom,(
    ! [VarCurr] :
      ( ~ v1416(VarCurr)
     => ( ( v1413(VarCurr,bitIndex3)
        <=> v1222(VarCurr,bitIndex4) )
        & ( v1413(VarCurr,bitIndex2)
        <=> v1222(VarCurr,bitIndex3) )
        & ( v1413(VarCurr,bitIndex1)
        <=> v1222(VarCurr,bitIndex2) )
        & ( v1413(VarCurr,bitIndex0)
        <=> v1222(VarCurr,bitIndex1) ) ) ) )).

fof(addConditionBooleanCondEqualRangesThenBranch_39,axiom,(
    ! [VarCurr] :
      ( v1416(VarCurr)
     => ! [B] :
          ( range_3_0(B)
         => ( v1413(VarCurr,B)
          <=> $false ) ) ) )).

fof(writeUnaryOperator_142,axiom,(
    ! [VarCurr] :
      ( ~ v1416(VarCurr)
    <=> v1220(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_215,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( v1405(VarNext)
      <=> v1406(VarNext) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_214,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( v1406(VarNext)
      <=> ( v1407(VarNext)
          & v1402(VarNext) ) ) ) )).

fof(writeUnaryOperator_141,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( ~ v1407(VarNext)
      <=> v1409(VarNext) ) ) )).

fof(addAssignment_291,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( v1409(VarNext)
      <=> v1402(VarCurr) ) ) )).

fof(addAssignment_290,axiom,(
    ! [VarCurr] :
      ( v1402(VarCurr)
    <=> v288(VarCurr) ) )).

fof(addConditionBooleanCondShiftedRangesElseBranch_8,axiom,(
    ! [VarCurr] :
      ( ~ v1384(VarCurr)
     => ( v1222(VarCurr,bitIndex3)
      <=> $false ) ) )).

fof(addConditionBooleanCondShiftedRangesThenBranch_6,axiom,(
    ! [VarCurr] :
      ( v1384(VarCurr)
     => ( v1222(VarCurr,bitIndex3)
      <=> $true ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_213,axiom,(
    ! [VarCurr] :
      ( v1384(VarCurr)
    <=> ( v1385(VarCurr)
        | v1398(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_212,axiom,(
    ! [VarCurr] :
      ( v1398(VarCurr)
    <=> ( v1399(VarCurr)
        & v1400(VarCurr) ) ) )).

fof(addBitVectorEqualityBitBlasted_50,axiom,(
    ! [VarCurr] :
      ( v1400(VarCurr)
    <=> ( $true
      <=> v1377(VarCurr,bitIndex4) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_211,axiom,(
    ! [VarCurr] :
      ( v1399(VarCurr)
    <=> ( v1395(VarCurr)
        & v1390(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_210,axiom,(
    ! [VarCurr] :
      ( v1385(VarCurr)
    <=> ( v1386(VarCurr)
        | v1392(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_209,axiom,(
    ! [VarCurr] :
      ( v1392(VarCurr)
    <=> ( v1393(VarCurr)
        & v1397(VarCurr) ) ) )).

fof(addBitVectorEqualityBitBlasted_49,axiom,(
    ! [VarCurr] :
      ( v1397(VarCurr)
    <=> ( $true
      <=> v1377(VarCurr,bitIndex2) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_208,axiom,(
    ! [VarCurr] :
      ( v1393(VarCurr)
    <=> ( v1395(VarCurr)
        & v1390(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_207,axiom,(
    ! [VarCurr] :
      ( v1395(VarCurr)
    <=> ( v1396(VarCurr)
        & v1368(VarCurr,bitIndex0) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_206,axiom,(
    ! [VarCurr] :
      ( v1396(VarCurr)
    <=> ( v1224(VarCurr)
        & v1186(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_205,axiom,(
    ! [VarCurr] :
      ( v1386(VarCurr)
    <=> ( v1387(VarCurr)
        & v1391(VarCurr) ) ) )).

fof(addBitVectorEqualityBitBlasted_48,axiom,(
    ! [VarCurr] :
      ( v1391(VarCurr)
    <=> ( $true
      <=> v1377(VarCurr,bitIndex0) ) ) )).

fof(addAssignmentInitValueVector_13,axiom,
    ( ( v1377(constB0,bitIndex4)
    <=> $false )
    & ( v1377(constB0,bitIndex3)
    <=> $false )
    & ( v1377(constB0,bitIndex2)
    <=> $false )
    & ( v1377(constB0,bitIndex1)
    <=> $false ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_204,axiom,(
    ! [VarCurr] :
      ( v1387(VarCurr)
    <=> ( v1389(VarCurr)
        & v1390(VarCurr) ) ) )).

fof(writeUnaryOperator_140,axiom,(
    ! [VarCurr] :
      ( ~ v1390(VarCurr)
    <=> v1368(VarCurr,bitIndex1) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_203,axiom,(
    ! [VarCurr] :
      ( v1389(VarCurr)
    <=> ( v1224(VarCurr)
        & v1368(VarCurr,bitIndex0) ) ) )).

fof(addAssignment_289,axiom,(
    ! [VarCurr,B] :
      ( range_1_0(B)
     => ( v1368(VarCurr,B)
      <=> v1370(VarCurr,B) ) ) )).

fof(addAssignment_288,axiom,(
    ! [VarCurr,B] :
      ( range_1_0(B)
     => ( v1370(VarCurr,B)
      <=> v1372(VarCurr,B) ) ) )).

fof(addAssignment_287,axiom,(
    ! [VarCurr] :
      ( v1372(VarCurr,bitIndex0)
    <=> v36(VarCurr,bitIndex4) ) )).

fof(addAssignment_286,axiom,(
    ! [VarCurr] :
      ( v1372(VarCurr,bitIndex1)
    <=> v1374(VarCurr) ) )).

fof(writeBinaryOperatorShiftedRanges_74,axiom,(
    ! [VarCurr] :
      ( v1374(VarCurr)
    <=> ( v36(VarCurr,bitIndex1)
        | v36(VarCurr,bitIndex7) ) ) )).

fof(addAssignment_285,axiom,(
    ! [VarCurr] :
      ( v1224(VarCurr)
    <=> v1226(VarCurr) ) )).

fof(addAssignment_284,axiom,(
    ! [VarCurr] :
      ( v1226(VarCurr)
    <=> v1228(VarCurr) ) )).

fof(writeBinaryOperatorShiftedRanges_73,axiom,(
    ! [VarCurr] :
      ( v1228(VarCurr)
    <=> ( v1366(VarCurr)
        | v36(VarCurr,bitIndex7) ) ) )).

fof(writeBinaryOperatorShiftedRanges_72,axiom,(
    ! [VarCurr] :
      ( v1366(VarCurr)
    <=> ( v36(VarCurr,bitIndex1)
        | v36(VarCurr,bitIndex4) ) ) )).

fof(addConditionBooleanCondShiftedRangesElseBranch_7,axiom,(
    ! [VarCurr] :
      ( ~ v1333(VarCurr)
     => ( v36(VarCurr,bitIndex4)
      <=> $false ) ) )).

fof(addConditionBooleanCondShiftedRangesThenBranch_5,axiom,(
    ! [VarCurr] :
      ( v1333(VarCurr)
     => ( v36(VarCurr,bitIndex4)
      <=> $true ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_202,axiom,(
    ! [VarCurr] :
      ( v1333(VarCurr)
    <=> ( v1334(VarCurr)
        | v1363(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_201,axiom,(
    ! [VarCurr] :
      ( v1363(VarCurr)
    <=> ( v1364(VarCurr)
        & v1323(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_200,axiom,(
    ! [VarCurr] :
      ( v1364(VarCurr)
    <=> ( v1342(VarCurr)
        & v1168(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_199,axiom,(
    ! [VarCurr] :
      ( v1334(VarCurr)
    <=> ( v1335(VarCurr)
        | v1361(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_198,axiom,(
    ! [VarCurr] :
      ( v1361(VarCurr)
    <=> ( v1362(VarCurr)
        & v1300(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_197,axiom,(
    ! [VarCurr] :
      ( v1362(VarCurr)
    <=> ( v1352(VarCurr)
        & v1168(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_196,axiom,(
    ! [VarCurr] :
      ( v1335(VarCurr)
    <=> ( v1336(VarCurr)
        | v1358(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_195,axiom,(
    ! [VarCurr] :
      ( v1358(VarCurr)
    <=> ( v1359(VarCurr)
        & v1360(VarCurr) ) ) )).

fof(addBitVectorEqualityBitBlasted_47,axiom,(
    ! [VarCurr] :
      ( v1360(VarCurr)
    <=> ( $true
      <=> v31(VarCurr,bitIndex6) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_194,axiom,(
    ! [VarCurr] :
      ( v1359(VarCurr)
    <=> ( v1342(VarCurr)
        & v1168(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_193,axiom,(
    ! [VarCurr] :
      ( v1336(VarCurr)
    <=> ( v1337(VarCurr)
        | v1356(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_192,axiom,(
    ! [VarCurr] :
      ( v1356(VarCurr)
    <=> ( v1357(VarCurr)
        & v1278(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_191,axiom,(
    ! [VarCurr] :
      ( v1357(VarCurr)
    <=> ( v1352(VarCurr)
        & v1168(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_190,axiom,(
    ! [VarCurr] :
      ( v1337(VarCurr)
    <=> ( v1338(VarCurr)
        | v1353(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_189,axiom,(
    ! [VarCurr] :
      ( v1353(VarCurr)
    <=> ( v1354(VarCurr)
        & v1355(VarCurr) ) ) )).

fof(addBitVectorEqualityBitBlasted_46,axiom,(
    ! [VarCurr] :
      ( v1355(VarCurr)
    <=> ( $true
      <=> v31(VarCurr,bitIndex3) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_188,axiom,(
    ! [VarCurr] :
      ( v1354(VarCurr)
    <=> ( v1342(VarCurr)
        & v1168(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_187,axiom,(
    ! [VarCurr] :
      ( v1338(VarCurr)
    <=> ( v1339(VarCurr)
        | v1349(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_186,axiom,(
    ! [VarCurr] :
      ( v1349(VarCurr)
    <=> ( v1350(VarCurr)
        & v1238(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_185,axiom,(
    ! [VarCurr] :
      ( v1350(VarCurr)
    <=> ( v1352(VarCurr)
        & v1168(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_184,axiom,(
    ! [VarCurr] :
      ( v1352(VarCurr)
    <=> ( v1342(VarCurr)
        & v1180(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_183,axiom,(
    ! [VarCurr] :
      ( v1339(VarCurr)
    <=> ( v1340(VarCurr)
        & v1348(VarCurr) ) ) )).

fof(addBitVectorEqualityBitBlasted_45,axiom,(
    ! [VarCurr] :
      ( v1348(VarCurr)
    <=> ( $true
      <=> v31(VarCurr,bitIndex0) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_182,axiom,(
    ! [VarCurr] :
      ( v1340(VarCurr)
    <=> ( v1342(VarCurr)
        & v1168(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_181,axiom,(
    ! [VarCurr] :
      ( v1342(VarCurr)
    <=> ( v1343(VarCurr)
        & v1347(VarCurr) ) ) )).

fof(writeUnaryOperator_139,axiom,(
    ! [VarCurr] :
      ( ~ v1347(VarCurr)
    <=> v38(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_180,axiom,(
    ! [VarCurr] :
      ( v1343(VarCurr)
    <=> ( v1344(VarCurr)
        & v1346(VarCurr) ) ) )).

fof(writeUnaryOperator_138,axiom,(
    ! [VarCurr] :
      ( ~ v1346(VarCurr)
    <=> v903(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_179,axiom,(
    ! [VarCurr] :
      ( v1344(VarCurr)
    <=> ( v1345(VarCurr)
        & v881(VarCurr) ) ) )).

fof(writeUnaryOperator_137,axiom,(
    ! [VarCurr] :
      ( ~ v1345(VarCurr)
    <=> v87(VarCurr) ) )).

fof(addAssignment_283,axiom,(
    ! [VarNext] :
      ( v31(VarNext,bitIndex9)
    <=> v1325(VarNext,bitIndex8) ) )).

fof(addCaseBooleanConditionShiftedRanges1_6,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( ~ v1326(VarNext)
       => ( ( v1325(VarNext,bitIndex10)
          <=> v31(VarCurr,bitIndex11) )
          & ( v1325(VarNext,bitIndex9)
          <=> v31(VarCurr,bitIndex10) )
          & ( v1325(VarNext,bitIndex8)
          <=> v31(VarCurr,bitIndex9) )
          & ( v1325(VarNext,bitIndex7)
          <=> v31(VarCurr,bitIndex8) )
          & ( v1325(VarNext,bitIndex6)
          <=> v31(VarCurr,bitIndex7) )
          & ( v1325(VarNext,bitIndex5)
          <=> v31(VarCurr,bitIndex6) )
          & ( v1325(VarNext,bitIndex4)
          <=> v31(VarCurr,bitIndex5) )
          & ( v1325(VarNext,bitIndex3)
          <=> v31(VarCurr,bitIndex4) )
          & ( v1325(VarNext,bitIndex2)
          <=> v31(VarCurr,bitIndex3) )
          & ( v1325(VarNext,bitIndex1)
          <=> v31(VarCurr,bitIndex2) )
          & ( v1325(VarNext,bitIndex0)
          <=> v31(VarCurr,bitIndex1) ) ) ) ) )).

fof(addCaseBooleanConditionEqualRanges0_16,axiom,(
    ! [VarNext] :
      ( v1326(VarNext)
     => ! [B] :
          ( range_10_0(B)
         => ( v1325(VarNext,B)
          <=> v1253(VarNext,B) ) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_178,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( v1326(VarNext)
      <=> v1327(VarNext) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_177,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( v1327(VarNext)
      <=> ( v1329(VarNext)
          & v1240(VarNext) ) ) ) )).

fof(writeUnaryOperator_136,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( ~ v1329(VarNext)
      <=> v1247(VarNext) ) ) )).

fof(addConditionBooleanCondShiftedRangesElseBranch_6,axiom,(
    ! [VarCurr] :
      ( ~ v1311(VarCurr)
     => ( v36(VarCurr,bitIndex9)
      <=> $false ) ) )).

fof(addConditionBooleanCondShiftedRangesThenBranch_4,axiom,(
    ! [VarCurr] :
      ( v1311(VarCurr)
     => ( v36(VarCurr,bitIndex9)
      <=> $true ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_176,axiom,(
    ! [VarCurr] :
      ( v1311(VarCurr)
    <=> ( v1312(VarCurr)
        | v1321(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_175,axiom,(
    ! [VarCurr] :
      ( v1321(VarCurr)
    <=> ( v1322(VarCurr)
        & v1323(VarCurr) ) ) )).

fof(addBitVectorEqualityBitBlasted_44,axiom,(
    ! [VarCurr] :
      ( v1323(VarCurr)
    <=> ( $true
      <=> v31(VarCurr,bitIndex9) ) ) )).

fof(addAssignment_282,axiom,(
    ! [VarCurr] :
      ( v1322(VarCurr)
    <=> v38(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_174,axiom,(
    ! [VarCurr] :
      ( v1312(VarCurr)
    <=> ( v1313(VarCurr)
        | v1319(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_173,axiom,(
    ! [VarCurr] :
      ( v1319(VarCurr)
    <=> ( v1320(VarCurr)
        & v1300(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_172,axiom,(
    ! [VarCurr] :
      ( v1320(VarCurr)
    <=> ( v38(VarCurr)
        & v1180(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_171,axiom,(
    ! [VarCurr] :
      ( v1313(VarCurr)
    <=> ( v1314(VarCurr)
        | v1317(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_170,axiom,(
    ! [VarCurr] :
      ( v1317(VarCurr)
    <=> ( v1318(VarCurr)
        & v1278(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_169,axiom,(
    ! [VarCurr] :
      ( v1318(VarCurr)
    <=> ( v38(VarCurr)
        & v1180(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_168,axiom,(
    ! [VarCurr] :
      ( v1314(VarCurr)
    <=> ( v1315(VarCurr)
        & v1238(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_167,axiom,(
    ! [VarCurr] :
      ( v1315(VarCurr)
    <=> ( v38(VarCurr)
        & v1180(VarCurr) ) ) )).

fof(addAssignment_281,axiom,(
    ! [VarNext] :
      ( v31(VarNext,bitIndex8)
    <=> v1302(VarNext,bitIndex7) ) )).

fof(addCaseBooleanConditionShiftedRanges1_5,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( ~ v1303(VarNext)
       => ( ( v1302(VarNext,bitIndex10)
          <=> v31(VarCurr,bitIndex11) )
          & ( v1302(VarNext,bitIndex9)
          <=> v31(VarCurr,bitIndex10) )
          & ( v1302(VarNext,bitIndex8)
          <=> v31(VarCurr,bitIndex9) )
          & ( v1302(VarNext,bitIndex7)
          <=> v31(VarCurr,bitIndex8) )
          & ( v1302(VarNext,bitIndex6)
          <=> v31(VarCurr,bitIndex7) )
          & ( v1302(VarNext,bitIndex5)
          <=> v31(VarCurr,bitIndex6) )
          & ( v1302(VarNext,bitIndex4)
          <=> v31(VarCurr,bitIndex5) )
          & ( v1302(VarNext,bitIndex3)
          <=> v31(VarCurr,bitIndex4) )
          & ( v1302(VarNext,bitIndex2)
          <=> v31(VarCurr,bitIndex3) )
          & ( v1302(VarNext,bitIndex1)
          <=> v31(VarCurr,bitIndex2) )
          & ( v1302(VarNext,bitIndex0)
          <=> v31(VarCurr,bitIndex1) ) ) ) ) )).

fof(addCaseBooleanConditionEqualRanges0_15,axiom,(
    ! [VarNext] :
      ( v1303(VarNext)
     => ! [B] :
          ( range_10_0(B)
         => ( v1302(VarNext,B)
          <=> v1253(VarNext,B) ) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_166,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( v1303(VarNext)
      <=> v1304(VarNext) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_165,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( v1304(VarNext)
      <=> ( v1306(VarNext)
          & v1240(VarNext) ) ) ) )).

fof(writeUnaryOperator_135,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( ~ v1306(VarNext)
      <=> v1247(VarNext) ) ) )).

fof(addConditionBooleanCondShiftedRangesElseBranch_5,axiom,(
    ! [VarCurr] :
      ( ~ v1296(VarCurr)
     => ( v36(VarCurr,bitIndex8)
      <=> $false ) ) )).

fof(addConditionBooleanCondShiftedRangesThenBranch_3,axiom,(
    ! [VarCurr] :
      ( v1296(VarCurr)
     => ( v36(VarCurr,bitIndex8)
      <=> $true ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_164,axiom,(
    ! [VarCurr] :
      ( v1296(VarCurr)
    <=> ( v1297(VarCurr)
        | v1298(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_163,axiom,(
    ! [VarCurr] :
      ( v1298(VarCurr)
    <=> ( v1299(VarCurr)
        & v1300(VarCurr) ) ) )).

fof(addBitVectorEqualityBitBlasted_43,axiom,(
    ! [VarCurr] :
      ( v1300(VarCurr)
    <=> ( $true
      <=> v31(VarCurr,bitIndex8) ) ) )).

fof(writeUnaryOperator_134,axiom,(
    ! [VarCurr] :
      ( ~ v1299(VarCurr)
    <=> v1180(VarCurr) ) )).

fof(addBitVectorEqualityBitBlasted_42,axiom,(
    ! [VarCurr] :
      ( v1297(VarCurr)
    <=> ( $true
      <=> v31(VarCurr,bitIndex7) ) ) )).

fof(addAssignment_280,axiom,(
    ! [VarNext] :
      ( v31(VarNext,bitIndex6)
    <=> v1288(VarNext,bitIndex5) ) )).

fof(addCaseBooleanConditionShiftedRanges1_4,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( ~ v1289(VarNext)
       => ( ( v1288(VarNext,bitIndex10)
          <=> v31(VarCurr,bitIndex11) )
          & ( v1288(VarNext,bitIndex9)
          <=> v31(VarCurr,bitIndex10) )
          & ( v1288(VarNext,bitIndex8)
          <=> v31(VarCurr,bitIndex9) )
          & ( v1288(VarNext,bitIndex7)
          <=> v31(VarCurr,bitIndex8) )
          & ( v1288(VarNext,bitIndex6)
          <=> v31(VarCurr,bitIndex7) )
          & ( v1288(VarNext,bitIndex5)
          <=> v31(VarCurr,bitIndex6) )
          & ( v1288(VarNext,bitIndex4)
          <=> v31(VarCurr,bitIndex5) )
          & ( v1288(VarNext,bitIndex3)
          <=> v31(VarCurr,bitIndex4) )
          & ( v1288(VarNext,bitIndex2)
          <=> v31(VarCurr,bitIndex3) )
          & ( v1288(VarNext,bitIndex1)
          <=> v31(VarCurr,bitIndex2) )
          & ( v1288(VarNext,bitIndex0)
          <=> v31(VarCurr,bitIndex1) ) ) ) ) )).

fof(addCaseBooleanConditionEqualRanges0_14,axiom,(
    ! [VarNext] :
      ( v1289(VarNext)
     => ! [B] :
          ( range_10_0(B)
         => ( v1288(VarNext,B)
          <=> v1253(VarNext,B) ) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_162,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( v1289(VarNext)
      <=> v1290(VarNext) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_161,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( v1290(VarNext)
      <=> ( v1292(VarNext)
          & v1240(VarNext) ) ) ) )).

fof(writeUnaryOperator_133,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( ~ v1292(VarNext)
      <=> v1247(VarNext) ) ) )).

fof(addAssignment_279,axiom,(
    ! [VarNext] :
      ( v31(VarNext,bitIndex5)
    <=> v1280(VarNext,bitIndex4) ) )).

fof(addCaseBooleanConditionShiftedRanges1_3,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( ~ v1281(VarNext)
       => ( ( v1280(VarNext,bitIndex10)
          <=> v31(VarCurr,bitIndex11) )
          & ( v1280(VarNext,bitIndex9)
          <=> v31(VarCurr,bitIndex10) )
          & ( v1280(VarNext,bitIndex8)
          <=> v31(VarCurr,bitIndex9) )
          & ( v1280(VarNext,bitIndex7)
          <=> v31(VarCurr,bitIndex8) )
          & ( v1280(VarNext,bitIndex6)
          <=> v31(VarCurr,bitIndex7) )
          & ( v1280(VarNext,bitIndex5)
          <=> v31(VarCurr,bitIndex6) )
          & ( v1280(VarNext,bitIndex4)
          <=> v31(VarCurr,bitIndex5) )
          & ( v1280(VarNext,bitIndex3)
          <=> v31(VarCurr,bitIndex4) )
          & ( v1280(VarNext,bitIndex2)
          <=> v31(VarCurr,bitIndex3) )
          & ( v1280(VarNext,bitIndex1)
          <=> v31(VarCurr,bitIndex2) )
          & ( v1280(VarNext,bitIndex0)
          <=> v31(VarCurr,bitIndex1) ) ) ) ) )).

fof(addCaseBooleanConditionEqualRanges0_13,axiom,(
    ! [VarNext] :
      ( v1281(VarNext)
     => ! [B] :
          ( range_10_0(B)
         => ( v1280(VarNext,B)
          <=> v1253(VarNext,B) ) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_160,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( v1281(VarNext)
      <=> v1282(VarNext) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_159,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( v1282(VarNext)
      <=> ( v1284(VarNext)
          & v1240(VarNext) ) ) ) )).

fof(writeUnaryOperator_132,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( ~ v1284(VarNext)
      <=> v1247(VarNext) ) ) )).

fof(addConditionBooleanCondShiftedRangesElseBranch_4,axiom,(
    ! [VarCurr] :
      ( ~ v1274(VarCurr)
     => ( v36(VarCurr,bitIndex5)
      <=> $false ) ) )).

fof(addConditionBooleanCondShiftedRangesThenBranch_2,axiom,(
    ! [VarCurr] :
      ( v1274(VarCurr)
     => ( v36(VarCurr,bitIndex5)
      <=> $true ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_158,axiom,(
    ! [VarCurr] :
      ( v1274(VarCurr)
    <=> ( v1275(VarCurr)
        | v1276(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_157,axiom,(
    ! [VarCurr] :
      ( v1276(VarCurr)
    <=> ( v1277(VarCurr)
        & v1278(VarCurr) ) ) )).

fof(addBitVectorEqualityBitBlasted_41,axiom,(
    ! [VarCurr] :
      ( v1278(VarCurr)
    <=> ( $true
      <=> v31(VarCurr,bitIndex5) ) ) )).

fof(writeUnaryOperator_131,axiom,(
    ! [VarCurr] :
      ( ~ v1277(VarCurr)
    <=> v1180(VarCurr) ) )).

fof(addBitVectorEqualityBitBlasted_40,axiom,(
    ! [VarCurr] :
      ( v1275(VarCurr)
    <=> ( $true
      <=> v31(VarCurr,bitIndex4) ) ) )).

fof(addAssignment_278,axiom,(
    ! [VarNext] :
      ( v31(VarNext,bitIndex4)
    <=> v1266(VarNext,bitIndex3) ) )).

fof(addCaseBooleanConditionShiftedRanges1_2,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( ~ v1267(VarNext)
       => ( ( v1266(VarNext,bitIndex10)
          <=> v31(VarCurr,bitIndex11) )
          & ( v1266(VarNext,bitIndex9)
          <=> v31(VarCurr,bitIndex10) )
          & ( v1266(VarNext,bitIndex8)
          <=> v31(VarCurr,bitIndex9) )
          & ( v1266(VarNext,bitIndex7)
          <=> v31(VarCurr,bitIndex8) )
          & ( v1266(VarNext,bitIndex6)
          <=> v31(VarCurr,bitIndex7) )
          & ( v1266(VarNext,bitIndex5)
          <=> v31(VarCurr,bitIndex6) )
          & ( v1266(VarNext,bitIndex4)
          <=> v31(VarCurr,bitIndex5) )
          & ( v1266(VarNext,bitIndex3)
          <=> v31(VarCurr,bitIndex4) )
          & ( v1266(VarNext,bitIndex2)
          <=> v31(VarCurr,bitIndex3) )
          & ( v1266(VarNext,bitIndex1)
          <=> v31(VarCurr,bitIndex2) )
          & ( v1266(VarNext,bitIndex0)
          <=> v31(VarCurr,bitIndex1) ) ) ) ) )).

fof(addCaseBooleanConditionEqualRanges0_12,axiom,(
    ! [VarNext] :
      ( v1267(VarNext)
     => ! [B] :
          ( range_10_0(B)
         => ( v1266(VarNext,B)
          <=> v1253(VarNext,B) ) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_156,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( v1267(VarNext)
      <=> v1268(VarNext) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_155,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( v1268(VarNext)
      <=> ( v1270(VarNext)
          & v1240(VarNext) ) ) ) )).

fof(writeUnaryOperator_130,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( ~ v1270(VarNext)
      <=> v1247(VarNext) ) ) )).

fof(addAssignment_277,axiom,(
    ! [VarNext] :
      ( v31(VarNext,bitIndex3)
    <=> v1258(VarNext,bitIndex2) ) )).

fof(addCaseBooleanConditionShiftedRanges1_1,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( ~ v1259(VarNext)
       => ( ( v1258(VarNext,bitIndex10)
          <=> v31(VarCurr,bitIndex11) )
          & ( v1258(VarNext,bitIndex9)
          <=> v31(VarCurr,bitIndex10) )
          & ( v1258(VarNext,bitIndex8)
          <=> v31(VarCurr,bitIndex9) )
          & ( v1258(VarNext,bitIndex7)
          <=> v31(VarCurr,bitIndex8) )
          & ( v1258(VarNext,bitIndex6)
          <=> v31(VarCurr,bitIndex7) )
          & ( v1258(VarNext,bitIndex5)
          <=> v31(VarCurr,bitIndex6) )
          & ( v1258(VarNext,bitIndex4)
          <=> v31(VarCurr,bitIndex5) )
          & ( v1258(VarNext,bitIndex3)
          <=> v31(VarCurr,bitIndex4) )
          & ( v1258(VarNext,bitIndex2)
          <=> v31(VarCurr,bitIndex3) )
          & ( v1258(VarNext,bitIndex1)
          <=> v31(VarCurr,bitIndex2) )
          & ( v1258(VarNext,bitIndex0)
          <=> v31(VarCurr,bitIndex1) ) ) ) ) )).

fof(addCaseBooleanConditionEqualRanges0_11,axiom,(
    ! [VarNext] :
      ( v1259(VarNext)
     => ! [B] :
          ( range_10_0(B)
         => ( v1258(VarNext,B)
          <=> v1253(VarNext,B) ) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_154,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( v1259(VarNext)
      <=> v1260(VarNext) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_153,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( v1260(VarNext)
      <=> ( v1262(VarNext)
          & v1240(VarNext) ) ) ) )).

fof(writeUnaryOperator_129,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( ~ v1262(VarNext)
      <=> v1247(VarNext) ) ) )).

fof(addAssignment_276,axiom,(
    ! [VarNext] :
      ( v31(VarNext,bitIndex2)
    <=> v1242(VarNext,bitIndex1) ) )).

fof(addCaseBooleanConditionShiftedRanges1,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( ~ v1243(VarNext)
       => ( ( v1242(VarNext,bitIndex10)
          <=> v31(VarCurr,bitIndex11) )
          & ( v1242(VarNext,bitIndex9)
          <=> v31(VarCurr,bitIndex10) )
          & ( v1242(VarNext,bitIndex8)
          <=> v31(VarCurr,bitIndex9) )
          & ( v1242(VarNext,bitIndex7)
          <=> v31(VarCurr,bitIndex8) )
          & ( v1242(VarNext,bitIndex6)
          <=> v31(VarCurr,bitIndex7) )
          & ( v1242(VarNext,bitIndex5)
          <=> v31(VarCurr,bitIndex6) )
          & ( v1242(VarNext,bitIndex4)
          <=> v31(VarCurr,bitIndex5) )
          & ( v1242(VarNext,bitIndex3)
          <=> v31(VarCurr,bitIndex4) )
          & ( v1242(VarNext,bitIndex2)
          <=> v31(VarCurr,bitIndex3) )
          & ( v1242(VarNext,bitIndex1)
          <=> v31(VarCurr,bitIndex2) )
          & ( v1242(VarNext,bitIndex0)
          <=> v31(VarCurr,bitIndex1) ) ) ) ) )).

fof(addCaseBooleanConditionEqualRanges0_10,axiom,(
    ! [VarNext] :
      ( v1243(VarNext)
     => ! [B] :
          ( range_10_0(B)
         => ( v1242(VarNext,B)
          <=> v1253(VarNext,B) ) ) ) )).

fof(addAssignment_275,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ! [B] :
          ( range_10_0(B)
         => ( v1253(VarNext,B)
          <=> v1251(VarCurr,B) ) ) ) )).

fof(addConditionBooleanCondShiftedRangesElseBranch_3,axiom,(
    ! [VarCurr] :
      ( ~ v1254(VarCurr)
     => ( ( v1251(VarCurr,bitIndex10)
        <=> v36(VarCurr,bitIndex11) )
        & ( v1251(VarCurr,bitIndex9)
        <=> v36(VarCurr,bitIndex10) )
        & ( v1251(VarCurr,bitIndex8)
        <=> v36(VarCurr,bitIndex9) )
        & ( v1251(VarCurr,bitIndex7)
        <=> v36(VarCurr,bitIndex8) )
        & ( v1251(VarCurr,bitIndex6)
        <=> v36(VarCurr,bitIndex7) )
        & ( v1251(VarCurr,bitIndex5)
        <=> v36(VarCurr,bitIndex6) )
        & ( v1251(VarCurr,bitIndex4)
        <=> v36(VarCurr,bitIndex5) )
        & ( v1251(VarCurr,bitIndex3)
        <=> v36(VarCurr,bitIndex4) )
        & ( v1251(VarCurr,bitIndex2)
        <=> v36(VarCurr,bitIndex3) )
        & ( v1251(VarCurr,bitIndex1)
        <=> v36(VarCurr,bitIndex2) )
        & ( v1251(VarCurr,bitIndex0)
        <=> v36(VarCurr,bitIndex1) ) ) ) )).

fof(addConditionBooleanCondEqualRangesThenBranch_38,axiom,(
    ! [VarCurr] :
      ( v1254(VarCurr)
     => ! [B] :
          ( range_10_0(B)
         => ( v1251(VarCurr,B)
          <=> $false ) ) ) )).

fof(writeUnaryOperator_128,axiom,(
    ! [VarCurr] :
      ( ~ v1254(VarCurr)
    <=> v33(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_152,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( v1243(VarNext)
      <=> v1244(VarNext) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_151,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( v1244(VarNext)
      <=> ( v1245(VarNext)
          & v1240(VarNext) ) ) ) )).

fof(writeUnaryOperator_127,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( ~ v1245(VarNext)
      <=> v1247(VarNext) ) ) )).

fof(addAssignment_274,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( v1247(VarNext)
      <=> v1240(VarCurr) ) ) )).

fof(addAssignment_273,axiom,(
    ! [VarCurr] :
      ( v1240(VarCurr)
    <=> v288(VarCurr) ) )).

fof(addConditionBooleanCondShiftedRangesElseBranch_2,axiom,(
    ! [VarCurr] :
      ( ~ v1233(VarCurr)
     => ( v36(VarCurr,bitIndex2)
      <=> $false ) ) )).

fof(addConditionBooleanCondShiftedRangesThenBranch_1,axiom,(
    ! [VarCurr] :
      ( v1233(VarCurr)
     => ( v36(VarCurr,bitIndex2)
      <=> $true ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_150,axiom,(
    ! [VarCurr] :
      ( v1233(VarCurr)
    <=> ( v1234(VarCurr)
        | v1235(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_149,axiom,(
    ! [VarCurr] :
      ( v1235(VarCurr)
    <=> ( v1236(VarCurr)
        & v1238(VarCurr) ) ) )).

fof(addBitVectorEqualityBitBlasted_39,axiom,(
    ! [VarCurr] :
      ( v1238(VarCurr)
    <=> ( $true
      <=> v31(VarCurr,bitIndex2) ) ) )).

fof(writeUnaryOperator_126,axiom,(
    ! [VarCurr] :
      ( ~ v1236(VarCurr)
    <=> v1180(VarCurr) ) )).

fof(addBitVectorEqualityBitBlasted_38,axiom,(
    ! [VarCurr] :
      ( v1234(VarCurr)
    <=> ( $true
      <=> v31(VarCurr,bitIndex1) ) ) )).

fof(addAssignmentInitValueVector_12,axiom,
    ( ( v31(constB0,bitIndex11)
    <=> $false )
    & ( v31(constB0,bitIndex10)
    <=> $false )
    & ( v31(constB0,bitIndex9)
    <=> $false )
    & ( v31(constB0,bitIndex8)
    <=> $false )
    & ( v31(constB0,bitIndex7)
    <=> $false )
    & ( v31(constB0,bitIndex6)
    <=> $false )
    & ( v31(constB0,bitIndex5)
    <=> $false )
    & ( v31(constB0,bitIndex4)
    <=> $false )
    & ( v31(constB0,bitIndex3)
    <=> $false )
    & ( v31(constB0,bitIndex2)
    <=> $false )
    & ( v31(constB0,bitIndex1)
    <=> $false ) )).

fof(bitBlastConstant_257,axiom,(
    ~ b00000000000(bitIndex10) )).

fof(bitBlastConstant_256,axiom,(
    ~ b00000000000(bitIndex9) )).

fof(bitBlastConstant_255,axiom,(
    ~ b00000000000(bitIndex8) )).

fof(bitBlastConstant_254,axiom,(
    ~ b00000000000(bitIndex7) )).

fof(bitBlastConstant_253,axiom,(
    ~ b00000000000(bitIndex6) )).

fof(bitBlastConstant_252,axiom,(
    ~ b00000000000(bitIndex5) )).

fof(bitBlastConstant_251,axiom,(
    ~ b00000000000(bitIndex4) )).

fof(bitBlastConstant_250,axiom,(
    ~ b00000000000(bitIndex3) )).

fof(bitBlastConstant_249,axiom,(
    ~ b00000000000(bitIndex2) )).

fof(bitBlastConstant_248,axiom,(
    ~ b00000000000(bitIndex1) )).

fof(bitBlastConstant_247,axiom,(
    ~ b00000000000(bitIndex0) )).

fof(addAssignmentInitValueVector_11,axiom,
    ( v31(constB0,bitIndex0)
  <=> $true )).

fof(addAssignment_272,axiom,(
    ! [VarCurr] :
      ( v1220(VarCurr)
    <=> v12(VarCurr) ) )).

fof(addAssignment_271,axiom,(
    ! [VarCurr] :
      ( v1198(VarCurr)
    <=> v1200(VarCurr) ) )).

fof(addAssignment_270,axiom,(
    ! [VarCurr] :
      ( v1200(VarCurr)
    <=> v16(VarCurr) ) )).

fof(addAssignment_269,axiom,(
    ! [VarCurr] :
      ( v1168(VarCurr)
    <=> v1170(VarCurr) ) )).

fof(addAssignment_268,axiom,(
    ! [VarCurr] :
      ( v1170(VarCurr)
    <=> v1172(VarCurr) ) )).

fof(addAssignment_267,axiom,(
    ! [VarCurr] :
      ( v1172(VarCurr)
    <=> v1174(VarCurr,bitIndex3) ) )).

fof(addAssignment_266,axiom,(
    ! [VarCurr] :
      ( v1174(VarCurr,bitIndex3)
    <=> v743(VarCurr,bitIndex3) ) )).

fof(addAssignment_265,axiom,(
    ! [VarCurr] :
      ( v1162(VarCurr)
    <=> v1164(VarCurr) ) )).

fof(addAssignment_264,axiom,(
    ! [VarCurr] :
      ( v1164(VarCurr)
    <=> v1166(VarCurr) ) )).

fof(addAssignment_263,axiom,(
    ! [VarCurr] :
      ( v1166(VarCurr)
    <=> v915(VarCurr,bitIndex1) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_148,axiom,(
    ! [VarCurr] :
      ( v1148(VarCurr)
    <=> ( v1156(VarCurr)
        & v1158(VarCurr) ) ) )).

fof(writeUnaryOperator_125,axiom,(
    ! [VarCurr] :
      ( ~ v1158(VarCurr)
    <=> v1150(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_147,axiom,(
    ! [VarCurr] :
      ( v1156(VarCurr)
    <=> ( v1157(VarCurr)
        & v909(VarCurr) ) ) )).

fof(writeUnaryOperator_124,axiom,(
    ! [VarCurr] :
      ( ~ v1157(VarCurr)
    <=> v1031(VarCurr) ) )).

fof(addAssignment_262,axiom,(
    ! [VarCurr] :
      ( v1150(VarCurr)
    <=> v1152(VarCurr) ) )).

fof(addAssignment_261,axiom,(
    ! [VarCurr] :
      ( v1152(VarCurr)
    <=> v1154(VarCurr,bitIndex0) ) )).

fof(addAssignment_260,axiom,(
    ! [VarCurr] :
      ( v1154(VarCurr,bitIndex0)
    <=> v1142(VarCurr,bitIndex0) ) )).

fof(addAssignment_259,axiom,(
    ! [VarCurr] :
      ( v1142(VarCurr,bitIndex0)
    <=> v919(VarCurr,bitIndex0) ) )).

fof(addAssignment_258,axiom,(
    ! [VarCurr] :
      ( v919(VarCurr,bitIndex0)
    <=> v921(VarCurr,bitIndex0) ) )).

fof(addAssignment_257,axiom,(
    ! [VarCurr] :
      ( v921(VarCurr,bitIndex0)
    <=> v1017(VarCurr,bitIndex0) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_146,axiom,(
    ! [VarCurr] :
      ( v1029(VarCurr)
    <=> ( v1146(VarCurr)
        & v1132(VarCurr) ) ) )).

fof(writeUnaryOperator_123,axiom,(
    ! [VarCurr] :
      ( ~ v1146(VarCurr)
    <=> v1031(VarCurr) ) )).

fof(addAssignment_256,axiom,(
    ! [VarCurr] :
      ( v1132(VarCurr)
    <=> v1134(VarCurr) ) )).

fof(addAssignment_255,axiom,(
    ! [VarCurr] :
      ( v1134(VarCurr)
    <=> v1136(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_145,axiom,(
    ! [VarCurr] :
      ( v1136(VarCurr)
    <=> ( v1144(VarCurr)
        & v1138(VarCurr) ) ) )).

fof(writeUnaryOperator_122,axiom,(
    ! [VarCurr] :
      ( ~ v1144(VarCurr)
    <=> v915(VarCurr,bitIndex1) ) )).

fof(addAssignment_254,axiom,(
    ! [VarCurr] :
      ( v1138(VarCurr)
    <=> v1140(VarCurr) ) )).

fof(addAssignment_253,axiom,(
    ! [VarCurr] :
      ( v1140(VarCurr)
    <=> v1142(VarCurr,bitIndex15) ) )).

fof(addAssignment_252,axiom,(
    ! [VarCurr] :
      ( v1142(VarCurr,bitIndex15)
    <=> v919(VarCurr,bitIndex15) ) )).

fof(addAssignment_251,axiom,(
    ! [VarCurr] :
      ( v919(VarCurr,bitIndex15)
    <=> v921(VarCurr,bitIndex15) ) )).

fof(addAssignment_250,axiom,(
    ! [VarCurr] :
      ( v921(VarCurr,bitIndex15)
    <=> v1017(VarCurr,bitIndex15) ) )).

fof(addAssignment_249,axiom,(
    ! [VarCurr] :
      ( v1031(VarCurr)
    <=> v1033(VarCurr) ) )).

fof(addAssignment_248,axiom,(
    ! [VarCurr] :
      ( v1033(VarCurr)
    <=> v1035(VarCurr) ) )).

fof(addBitVectorEqualityBitBlasted_37,axiom,(
    ! [VarCurr] :
      ( v1035(VarCurr)
    <=> ( ( v1037(VarCurr,bitIndex4)
        <=> $false )
        & ( v1037(VarCurr,bitIndex3)
        <=> $false )
        & ( v1037(VarCurr,bitIndex2)
        <=> $false )
        & ( v1037(VarCurr,bitIndex1)
        <=> $false )
        & ( v1037(VarCurr,bitIndex0)
        <=> $false ) ) ) )).

fof(addCaseBooleanConditionEqualRanges1_10,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( ~ v1118(VarNext)
       => ! [B] :
            ( range_4_0(B)
           => ( v1037(VarNext,B)
            <=> v1037(VarCurr,B) ) ) ) ) )).

fof(addCaseBooleanConditionEqualRanges0_9,axiom,(
    ! [VarNext] :
      ( v1118(VarNext)
     => ! [B] :
          ( range_4_0(B)
         => ( v1037(VarNext,B)
          <=> v1126(VarNext,B) ) ) ) )).

fof(addAssignment_247,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ! [B] :
          ( range_4_0(B)
         => ( v1126(VarNext,B)
          <=> v1124(VarCurr,B) ) ) ) )).

fof(aaddConditionBooleanCondEqualRangesElseBranch_36,axiom,(
    ! [VarCurr] :
      ( ~ v1127(VarCurr)
     => ! [B] :
          ( range_4_0(B)
         => ( v1124(VarCurr,B)
          <=> v1039(VarCurr,B) ) ) ) )).

fof(addConditionBooleanCondEqualRangesThenBranch_37,axiom,(
    ! [VarCurr] :
      ( v1127(VarCurr)
     => ! [B] :
          ( range_4_0(B)
         => ( v1124(VarCurr,B)
          <=> $false ) ) ) )).

fof(writeUnaryOperator_121,axiom,(
    ! [VarCurr] :
      ( ~ v1127(VarCurr)
    <=> v928(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_144,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( v1118(VarNext)
      <=> v1119(VarNext) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_143,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( v1119(VarNext)
      <=> ( v1120(VarNext)
          & v925(VarNext) ) ) ) )).

fof(writeUnaryOperator_120,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( ~ v1120(VarNext)
      <=> v984(VarNext) ) ) )).

fof(addParallelCaseBooleanConditionEqualRanges3_3,axiom,(
    ! [VarCurr] :
      ( ( ~ v1042(VarCurr)
        & ~ v1044(VarCurr)
        & ~ v1085(VarCurr) )
     => ! [B] :
          ( range_4_0(B)
         => ( v1039(VarCurr,B)
          <=> v1037(VarCurr,B) ) ) ) )).

fof(addParallelCaseBooleanConditionEqualRanges2_3,axiom,(
    ! [VarCurr] :
      ( v1085(VarCurr)
     => ! [B] :
          ( range_4_0(B)
         => ( v1039(VarCurr,B)
          <=> v1087(VarCurr,B) ) ) ) )).

fof(addParallelCaseBooleanConditionEqualRanges1_7,axiom,(
    ! [VarCurr] :
      ( v1044(VarCurr)
     => ! [B] :
          ( range_4_0(B)
         => ( v1039(VarCurr,B)
          <=> v1046(VarCurr,B) ) ) ) )).

fof(addParallelCaseBooleanConditionEqualRanges0_7,axiom,(
    ! [VarCurr] :
      ( v1042(VarCurr)
     => ! [B] :
          ( range_4_0(B)
         => ( v1039(VarCurr,B)
          <=> v1037(VarCurr,B) ) ) ) )).

fof(addBitVectorEqualityBitBlasted_36,axiom,(
    ! [VarCurr] :
      ( v1114(VarCurr)
    <=> ( ( v1115(VarCurr,bitIndex1)
        <=> $true )
        & ( v1115(VarCurr,bitIndex0)
        <=> $true ) ) ) )).

fof(addAssignment_246,axiom,(
    ! [VarCurr] :
      ( v1115(VarCurr,bitIndex0)
    <=> v1023(VarCurr) ) )).

fof(addAssignment_245,axiom,(
    ! [VarCurr] :
      ( v1115(VarCurr,bitIndex1)
    <=> v945(VarCurr) ) )).

fof(aaddConditionBooleanCondEqualRangesElseBranch_35,axiom,(
    ! [VarCurr] :
      ( ~ v1088(VarCurr)
     => ! [B] :
          ( range_4_0(B)
         => ( v1087(VarCurr,B)
          <=> v1089(VarCurr,B) ) ) ) )).

fof(addConditionBooleanCondEqualRangesThenBranch_36,axiom,(
    ! [VarCurr] :
      ( v1088(VarCurr)
     => ! [B] :
          ( range_4_0(B)
         => ( v1087(VarCurr,B)
          <=> b10000(B) ) ) ) )).

fof(addAssignment_244,axiom,(
    ! [VarCurr] :
      ( v1089(VarCurr,bitIndex0)
    <=> v1111(VarCurr) ) )).

fof(addAssignment_243,axiom,(
    ! [VarCurr] :
      ( v1089(VarCurr,bitIndex1)
    <=> v1109(VarCurr) ) )).

fof(addAssignment_242,axiom,(
    ! [VarCurr] :
      ( v1089(VarCurr,bitIndex2)
    <=> v1104(VarCurr) ) )).

fof(addAssignment_241,axiom,(
    ! [VarCurr] :
      ( v1089(VarCurr,bitIndex3)
    <=> v1099(VarCurr) ) )).

fof(addAssignment_240,axiom,(
    ! [VarCurr] :
      ( v1089(VarCurr,bitIndex4)
    <=> v1091(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_142,axiom,(
    ! [VarCurr] :
      ( v1109(VarCurr)
    <=> ( v1110(VarCurr)
        & v1113(VarCurr) ) ) )).

fof(writeBinaryOperatorShiftedRanges_71,axiom,(
    ! [VarCurr] :
      ( v1113(VarCurr)
    <=> ( v1037(VarCurr,bitIndex0)
        | v1037(VarCurr,bitIndex1) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_141,axiom,(
    ! [VarCurr] :
      ( v1110(VarCurr)
    <=> ( v1111(VarCurr)
        | v1112(VarCurr) ) ) )).

fof(writeUnaryOperator_119,axiom,(
    ! [VarCurr] :
      ( ~ v1112(VarCurr)
    <=> v1037(VarCurr,bitIndex1) ) )).

fof(writeUnaryOperator_118,axiom,(
    ! [VarCurr] :
      ( ~ v1111(VarCurr)
    <=> v1037(VarCurr,bitIndex0) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_140,axiom,(
    ! [VarCurr] :
      ( v1104(VarCurr)
    <=> ( v1105(VarCurr)
        & v1108(VarCurr) ) ) )).

fof(writeBinaryOperatorShiftedRanges_70,axiom,(
    ! [VarCurr] :
      ( v1108(VarCurr)
    <=> ( v1096(VarCurr)
        | v1037(VarCurr,bitIndex2) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_139,axiom,(
    ! [VarCurr] :
      ( v1105(VarCurr)
    <=> ( v1106(VarCurr)
        | v1107(VarCurr) ) ) )).

fof(writeUnaryOperator_117,axiom,(
    ! [VarCurr] :
      ( ~ v1107(VarCurr)
    <=> v1037(VarCurr,bitIndex2) ) )).

fof(writeUnaryOperator_116,axiom,(
    ! [VarCurr] :
      ( ~ v1106(VarCurr)
    <=> v1096(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_138,axiom,(
    ! [VarCurr] :
      ( v1099(VarCurr)
    <=> ( v1100(VarCurr)
        & v1103(VarCurr) ) ) )).

fof(writeBinaryOperatorShiftedRanges_69,axiom,(
    ! [VarCurr] :
      ( v1103(VarCurr)
    <=> ( v1095(VarCurr)
        | v1037(VarCurr,bitIndex3) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_137,axiom,(
    ! [VarCurr] :
      ( v1100(VarCurr)
    <=> ( v1101(VarCurr)
        | v1102(VarCurr) ) ) )).

fof(writeUnaryOperator_115,axiom,(
    ! [VarCurr] :
      ( ~ v1102(VarCurr)
    <=> v1037(VarCurr,bitIndex3) ) )).

fof(writeUnaryOperator_114,axiom,(
    ! [VarCurr] :
      ( ~ v1101(VarCurr)
    <=> v1095(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_136,axiom,(
    ! [VarCurr] :
      ( v1091(VarCurr)
    <=> ( v1092(VarCurr)
        & v1098(VarCurr) ) ) )).

fof(writeBinaryOperatorShiftedRanges_68,axiom,(
    ! [VarCurr] :
      ( v1098(VarCurr)
    <=> ( v1094(VarCurr)
        | v1037(VarCurr,bitIndex4) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_135,axiom,(
    ! [VarCurr] :
      ( v1092(VarCurr)
    <=> ( v1093(VarCurr)
        | v1097(VarCurr) ) ) )).

fof(writeUnaryOperator_113,axiom,(
    ! [VarCurr] :
      ( ~ v1097(VarCurr)
    <=> v1037(VarCurr,bitIndex4) ) )).

fof(writeUnaryOperator_112,axiom,(
    ! [VarCurr] :
      ( ~ v1093(VarCurr)
    <=> v1094(VarCurr) ) )).

fof(writeBinaryOperatorShiftedRanges_67,axiom,(
    ! [VarCurr] :
      ( v1094(VarCurr)
    <=> ( v1095(VarCurr)
        & v1037(VarCurr,bitIndex3) ) ) )).

fof(writeBinaryOperatorShiftedRanges_66,axiom,(
    ! [VarCurr] :
      ( v1095(VarCurr)
    <=> ( v1096(VarCurr)
        & v1037(VarCurr,bitIndex2) ) ) )).

fof(writeBinaryOperatorShiftedRanges_65,axiom,(
    ! [VarCurr] :
      ( v1096(VarCurr)
    <=> ( v1037(VarCurr,bitIndex0)
        & v1037(VarCurr,bitIndex1) ) ) )).

fof(addBitVectorEqualityBitBlasted_35,axiom,(
    ! [VarCurr] :
      ( v1088(VarCurr)
    <=> ( ( v1037(VarCurr,bitIndex4)
        <=> $true )
        & ( v1037(VarCurr,bitIndex3)
        <=> $false )
        & ( v1037(VarCurr,bitIndex2)
        <=> $false )
        & ( v1037(VarCurr,bitIndex1)
        <=> $false )
        & ( v1037(VarCurr,bitIndex0)
        <=> $false ) ) ) )).

fof(bitBlastConstant_246,axiom,(
    b10000(bitIndex4) )).

fof(bitBlastConstant_245,axiom,(
    ~ b10000(bitIndex3) )).

fof(bitBlastConstant_244,axiom,(
    ~ b10000(bitIndex2) )).

fof(bitBlastConstant_243,axiom,(
    ~ b10000(bitIndex1) )).

fof(bitBlastConstant_242,axiom,(
    ~ b10000(bitIndex0) )).

fof(addBitVectorEqualityBitBlasted_34,axiom,(
    ! [VarCurr] :
      ( v1085(VarCurr)
    <=> ( ( v1086(VarCurr,bitIndex1)
        <=> $true )
        & ( v1086(VarCurr,bitIndex0)
        <=> $false ) ) ) )).

fof(addAssignment_239,axiom,(
    ! [VarCurr] :
      ( v1086(VarCurr,bitIndex0)
    <=> v1023(VarCurr) ) )).

fof(addAssignment_238,axiom,(
    ! [VarCurr] :
      ( v1086(VarCurr,bitIndex1)
    <=> v945(VarCurr) ) )).

fof(aaddConditionBooleanCondEqualRangesElseBranch_34,axiom,(
    ! [VarCurr] :
      ( ~ v1047(VarCurr)
     => ! [B] :
          ( range_31_0(B)
         => ( v1046(VarCurr,B)
          <=> v1048(VarCurr,B) ) ) ) )).

fof(addConditionBooleanCondEqualRangesThenBranch_35,axiom,(
    ! [VarCurr] :
      ( v1047(VarCurr)
     => ! [B] :
          ( range_31_0(B)
         => ( v1046(VarCurr,B)
          <=> $false ) ) ) )).

fof(addSignExtensionConstraint_104,axiom,(
    ! [VarCurr] :
      ( v1048(VarCurr,bitIndex6)
    <=> v1049(VarCurr,bitIndex5) ) )).

fof(addSignExtensionConstraint_103,axiom,(
    ! [VarCurr] :
      ( v1048(VarCurr,bitIndex7)
    <=> v1049(VarCurr,bitIndex5) ) )).

fof(addSignExtensionConstraint_102,axiom,(
    ! [VarCurr] :
      ( v1048(VarCurr,bitIndex8)
    <=> v1049(VarCurr,bitIndex5) ) )).

fof(addSignExtensionConstraint_101,axiom,(
    ! [VarCurr] :
      ( v1048(VarCurr,bitIndex9)
    <=> v1049(VarCurr,bitIndex5) ) )).

fof(addSignExtensionConstraint_100,axiom,(
    ! [VarCurr] :
      ( v1048(VarCurr,bitIndex10)
    <=> v1049(VarCurr,bitIndex5) ) )).

fof(addSignExtensionConstraint_99,axiom,(
    ! [VarCurr] :
      ( v1048(VarCurr,bitIndex11)
    <=> v1049(VarCurr,bitIndex5) ) )).

fof(addSignExtensionConstraint_98,axiom,(
    ! [VarCurr] :
      ( v1048(VarCurr,bitIndex12)
    <=> v1049(VarCurr,bitIndex5) ) )).

fof(addSignExtensionConstraint_97,axiom,(
    ! [VarCurr] :
      ( v1048(VarCurr,bitIndex13)
    <=> v1049(VarCurr,bitIndex5) ) )).

fof(addSignExtensionConstraint_96,axiom,(
    ! [VarCurr] :
      ( v1048(VarCurr,bitIndex14)
    <=> v1049(VarCurr,bitIndex5) ) )).

fof(addSignExtensionConstraint_95,axiom,(
    ! [VarCurr] :
      ( v1048(VarCurr,bitIndex15)
    <=> v1049(VarCurr,bitIndex5) ) )).

fof(addSignExtensionConstraint_94,axiom,(
    ! [VarCurr] :
      ( v1048(VarCurr,bitIndex16)
    <=> v1049(VarCurr,bitIndex5) ) )).

fof(addSignExtensionConstraint_93,axiom,(
    ! [VarCurr] :
      ( v1048(VarCurr,bitIndex17)
    <=> v1049(VarCurr,bitIndex5) ) )).

fof(addSignExtensionConstraint_92,axiom,(
    ! [VarCurr] :
      ( v1048(VarCurr,bitIndex18)
    <=> v1049(VarCurr,bitIndex5) ) )).

fof(addSignExtensionConstraint_91,axiom,(
    ! [VarCurr] :
      ( v1048(VarCurr,bitIndex19)
    <=> v1049(VarCurr,bitIndex5) ) )).

fof(addSignExtensionConstraint_90,axiom,(
    ! [VarCurr] :
      ( v1048(VarCurr,bitIndex20)
    <=> v1049(VarCurr,bitIndex5) ) )).

fof(addSignExtensionConstraint_89,axiom,(
    ! [VarCurr] :
      ( v1048(VarCurr,bitIndex21)
    <=> v1049(VarCurr,bitIndex5) ) )).

fof(addSignExtensionConstraint_88,axiom,(
    ! [VarCurr] :
      ( v1048(VarCurr,bitIndex22)
    <=> v1049(VarCurr,bitIndex5) ) )).

fof(addSignExtensionConstraint_87,axiom,(
    ! [VarCurr] :
      ( v1048(VarCurr,bitIndex23)
    <=> v1049(VarCurr,bitIndex5) ) )).

fof(addSignExtensionConstraint_86,axiom,(
    ! [VarCurr] :
      ( v1048(VarCurr,bitIndex24)
    <=> v1049(VarCurr,bitIndex5) ) )).

fof(addSignExtensionConstraint_85,axiom,(
    ! [VarCurr] :
      ( v1048(VarCurr,bitIndex25)
    <=> v1049(VarCurr,bitIndex5) ) )).

fof(addSignExtensionConstraint_84,axiom,(
    ! [VarCurr] :
      ( v1048(VarCurr,bitIndex26)
    <=> v1049(VarCurr,bitIndex5) ) )).

fof(addSignExtensionConstraint_83,axiom,(
    ! [VarCurr] :
      ( v1048(VarCurr,bitIndex27)
    <=> v1049(VarCurr,bitIndex5) ) )).

fof(addSignExtensionConstraint_82,axiom,(
    ! [VarCurr] :
      ( v1048(VarCurr,bitIndex28)
    <=> v1049(VarCurr,bitIndex5) ) )).

fof(addSignExtensionConstraint_81,axiom,(
    ! [VarCurr] :
      ( v1048(VarCurr,bitIndex29)
    <=> v1049(VarCurr,bitIndex5) ) )).

fof(addSignExtensionConstraint_80,axiom,(
    ! [VarCurr] :
      ( v1048(VarCurr,bitIndex30)
    <=> v1049(VarCurr,bitIndex5) ) )).

fof(addSignExtensionConstraint_79,axiom,(
    ! [VarCurr] :
      ( v1048(VarCurr,bitIndex31)
    <=> v1049(VarCurr,bitIndex5) ) )).

fof(addAssignment_237,axiom,(
    ! [VarCurr,B] :
      ( range_5_0(B)
     => ( v1048(VarCurr,B)
      <=> v1049(VarCurr,B) ) ) )).

fof(addAssignment_236,axiom,(
    ! [VarCurr] :
      ( v1049(VarCurr,bitIndex0)
    <=> v1083(VarCurr) ) )).

fof(addAssignment_235,axiom,(
    ! [VarCurr] :
      ( v1049(VarCurr,bitIndex1)
    <=> v1081(VarCurr) ) )).

fof(addAssignment_234,axiom,(
    ! [VarCurr] :
      ( v1049(VarCurr,bitIndex2)
    <=> v1077(VarCurr) ) )).

fof(addAssignment_233,axiom,(
    ! [VarCurr] :
      ( v1049(VarCurr,bitIndex3)
    <=> v1073(VarCurr) ) )).

fof(addAssignment_232,axiom,(
    ! [VarCurr] :
      ( v1049(VarCurr,bitIndex4)
    <=> v1069(VarCurr) ) )).

fof(addAssignment_231,axiom,(
    ! [VarCurr] :
      ( v1049(VarCurr,bitIndex5)
    <=> v1051(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_134,axiom,(
    ! [VarCurr] :
      ( v1081(VarCurr)
    <=> ( v1082(VarCurr)
        & v1084(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_133,axiom,(
    ! [VarCurr] :
      ( v1084(VarCurr)
    <=> ( v1055(VarCurr,bitIndex0)
        | v1063(VarCurr) ) ) )).

fof(writeBinaryOperatorShiftedRanges_64,axiom,(
    ! [VarCurr] :
      ( v1082(VarCurr)
    <=> ( v1083(VarCurr)
        | v1055(VarCurr,bitIndex1) ) ) )).

fof(writeUnaryOperator_111,axiom,(
    ! [VarCurr] :
      ( ~ v1083(VarCurr)
    <=> v1055(VarCurr,bitIndex0) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_132,axiom,(
    ! [VarCurr] :
      ( v1077(VarCurr)
    <=> ( v1078(VarCurr)
        & v1080(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_131,axiom,(
    ! [VarCurr] :
      ( v1080(VarCurr)
    <=> ( v1061(VarCurr)
        | v1064(VarCurr) ) ) )).

fof(writeBinaryOperatorShiftedRanges_63,axiom,(
    ! [VarCurr] :
      ( v1078(VarCurr)
    <=> ( v1079(VarCurr)
        | v1055(VarCurr,bitIndex2) ) ) )).

fof(writeUnaryOperator_110,axiom,(
    ! [VarCurr] :
      ( ~ v1079(VarCurr)
    <=> v1061(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_130,axiom,(
    ! [VarCurr] :
      ( v1073(VarCurr)
    <=> ( v1074(VarCurr)
        & v1076(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_129,axiom,(
    ! [VarCurr] :
      ( v1076(VarCurr)
    <=> ( v1059(VarCurr)
        | v1065(VarCurr) ) ) )).

fof(writeBinaryOperatorShiftedRanges_62,axiom,(
    ! [VarCurr] :
      ( v1074(VarCurr)
    <=> ( v1075(VarCurr)
        | v1055(VarCurr,bitIndex3) ) ) )).

fof(writeUnaryOperator_109,axiom,(
    ! [VarCurr] :
      ( ~ v1075(VarCurr)
    <=> v1059(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_128,axiom,(
    ! [VarCurr] :
      ( v1069(VarCurr)
    <=> ( v1070(VarCurr)
        & v1072(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_127,axiom,(
    ! [VarCurr] :
      ( v1072(VarCurr)
    <=> ( v1057(VarCurr)
        | v1066(VarCurr) ) ) )).

fof(writeBinaryOperatorShiftedRanges_61,axiom,(
    ! [VarCurr] :
      ( v1070(VarCurr)
    <=> ( v1071(VarCurr)
        | v1055(VarCurr,bitIndex4) ) ) )).

fof(writeUnaryOperator_108,axiom,(
    ! [VarCurr] :
      ( ~ v1071(VarCurr)
    <=> v1057(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_126,axiom,(
    ! [VarCurr] :
      ( v1051(VarCurr)
    <=> ( v1052(VarCurr)
        & v1067(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_125,axiom,(
    ! [VarCurr] :
      ( v1067(VarCurr)
    <=> ( v1054(VarCurr)
        | v1068(VarCurr) ) ) )).

fof(writeUnaryOperator_107,axiom,(
    ! [VarCurr] :
      ( ~ v1068(VarCurr)
    <=> v1055(VarCurr,bitIndex5) ) )).

fof(writeBinaryOperatorShiftedRanges_60,axiom,(
    ! [VarCurr] :
      ( v1052(VarCurr)
    <=> ( v1053(VarCurr)
        | v1055(VarCurr,bitIndex5) ) ) )).

fof(writeUnaryOperator_106,axiom,(
    ! [VarCurr] :
      ( ~ v1053(VarCurr)
    <=> v1054(VarCurr) ) )).

fof(writeBinaryOperatorShiftedRanges_59,axiom,(
    ! [VarCurr] :
      ( v1054(VarCurr)
    <=> ( v1055(VarCurr,bitIndex4)
        | v1056(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_124,axiom,(
    ! [VarCurr] :
      ( v1056(VarCurr)
    <=> ( v1057(VarCurr)
        & v1066(VarCurr) ) ) )).

fof(writeUnaryOperator_105,axiom,(
    ! [VarCurr] :
      ( ~ v1066(VarCurr)
    <=> v1055(VarCurr,bitIndex4) ) )).

fof(writeBinaryOperatorShiftedRanges_58,axiom,(
    ! [VarCurr] :
      ( v1057(VarCurr)
    <=> ( v1055(VarCurr,bitIndex3)
        | v1058(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_123,axiom,(
    ! [VarCurr] :
      ( v1058(VarCurr)
    <=> ( v1059(VarCurr)
        & v1065(VarCurr) ) ) )).

fof(writeUnaryOperator_104,axiom,(
    ! [VarCurr] :
      ( ~ v1065(VarCurr)
    <=> v1055(VarCurr,bitIndex3) ) )).

fof(writeBinaryOperatorShiftedRanges_57,axiom,(
    ! [VarCurr] :
      ( v1059(VarCurr)
    <=> ( v1055(VarCurr,bitIndex2)
        | v1060(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_122,axiom,(
    ! [VarCurr] :
      ( v1060(VarCurr)
    <=> ( v1061(VarCurr)
        & v1064(VarCurr) ) ) )).

fof(writeUnaryOperator_103,axiom,(
    ! [VarCurr] :
      ( ~ v1064(VarCurr)
    <=> v1055(VarCurr,bitIndex2) ) )).

fof(writeBinaryOperatorShiftedRanges_56,axiom,(
    ! [VarCurr] :
      ( v1061(VarCurr)
    <=> ( v1055(VarCurr,bitIndex1)
        | v1062(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_121,axiom,(
    ! [VarCurr] :
      ( v1062(VarCurr)
    <=> ( v1055(VarCurr,bitIndex0)
        & v1063(VarCurr) ) ) )).

fof(writeUnaryOperator_102,axiom,(
    ! [VarCurr] :
      ( ~ v1063(VarCurr)
    <=> v1055(VarCurr,bitIndex1) ) )).

fof(addZeroExtensionConstraint_3,axiom,(
    ! [VarCurr] : ~ v1055(VarCurr,bitIndex5) )).

fof(addAssignment_230,axiom,(
    ! [VarCurr,B] :
      ( range_4_0(B)
     => ( v1055(VarCurr,B)
      <=> v1037(VarCurr,B) ) ) )).

fof(addBitVectorEqualityBitBlasted_33,axiom,(
    ! [VarCurr] :
      ( v1047(VarCurr)
    <=> ( ( v1037(VarCurr,bitIndex4)
        <=> $false )
        & ( v1037(VarCurr,bitIndex3)
        <=> $false )
        & ( v1037(VarCurr,bitIndex2)
        <=> $false )
        & ( v1037(VarCurr,bitIndex1)
        <=> $false )
        & ( v1037(VarCurr,bitIndex0)
        <=> $false ) ) ) )).

fof(addBitVectorEqualityBitBlasted_32,axiom,(
    ! [VarCurr] :
      ( v1044(VarCurr)
    <=> ( ( v1045(VarCurr,bitIndex1)
        <=> $false )
        & ( v1045(VarCurr,bitIndex0)
        <=> $true ) ) ) )).

fof(addAssignment_229,axiom,(
    ! [VarCurr] :
      ( v1045(VarCurr,bitIndex0)
    <=> v1023(VarCurr) ) )).

fof(addAssignment_228,axiom,(
    ! [VarCurr] :
      ( v1045(VarCurr,bitIndex1)
    <=> v945(VarCurr) ) )).

fof(addAssignmentInitValue_12,axiom,(
    ~ v1037(constB0,bitIndex4) )).

fof(addAssignmentInitValue_11,axiom,(
    ~ v1037(constB0,bitIndex3) )).

fof(addAssignmentInitValue_10,axiom,(
    ~ v1037(constB0,bitIndex2) )).

fof(addAssignmentInitValue_9,axiom,(
    ~ v1037(constB0,bitIndex1) )).

fof(addAssignmentInitValue_8,axiom,(
    v1037(constB0,bitIndex0) )).

fof(bitBlastConstant_241,axiom,(
    ~ b00001(bitIndex4) )).

fof(bitBlastConstant_240,axiom,(
    ~ b00001(bitIndex3) )).

fof(bitBlastConstant_239,axiom,(
    ~ b00001(bitIndex2) )).

fof(bitBlastConstant_238,axiom,(
    ~ b00001(bitIndex1) )).

fof(bitBlastConstant_237,axiom,(
    b00001(bitIndex0) )).

fof(addBitVectorEqualityBitBlasted_31,axiom,(
    ! [VarCurr] :
      ( v1042(VarCurr)
    <=> ( ( v1043(VarCurr,bitIndex1)
        <=> $false )
        & ( v1043(VarCurr,bitIndex0)
        <=> $false ) ) ) )).

fof(addAssignment_227,axiom,(
    ! [VarCurr] :
      ( v1043(VarCurr,bitIndex0)
    <=> v1023(VarCurr) ) )).

fof(addAssignment_226,axiom,(
    ! [VarCurr] :
      ( v1043(VarCurr,bitIndex1)
    <=> v945(VarCurr) ) )).

fof(memoryReadIntoBuffer_1,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ! [AssociatedAddressVar] :
          ( v1019_range_3_to_0_address_association(VarNext,AssociatedAddressVar)
         => ! [A] :
              ( address(A)
             => ! [B] :
                  ( A = AssociatedAddressVar
                 => ( range_17_0(B)
                   => ( v1017(VarNext,B)
                    <=> v923_array(VarNext,A,B) ) ) ) ) ) ) )).

fof(addAssignmentInitValueVector_10,axiom,(
    ! [B] :
      ( range_3_0(B)
     => ( v1019(constB0,B)
      <=> $false ) ) )).

fof(memoryConstantWriteDisabled_1,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ! [A] :
          ( ~ ( $true
              & v1009(VarNext) )
         => ! [B] :
              ( range_17_0(B)
             => ( v923_array(VarNext,A,B)
              <=> v923_1__array(VarNext,A,B) ) ) ) ) )).

fof(memoryConstantWriteEnabledInsideRange_1,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ! [A] :
          ( ( $true
            & v1009(VarNext) )
         => ! [B] :
              ( range_17_0(B)
             => ( v923_array(VarNext,A,B)
              <=> b000000000000000000(B) ) ) ) ) )).

fof(bitBlastConstant_236,axiom,(
    ~ b000000000000000000(bitIndex17) )).

fof(bitBlastConstant_235,axiom,(
    ~ b000000000000000000(bitIndex16) )).

fof(bitBlastConstant_234,axiom,(
    ~ b000000000000000000(bitIndex15) )).

fof(bitBlastConstant_233,axiom,(
    ~ b000000000000000000(bitIndex14) )).

fof(bitBlastConstant_232,axiom,(
    ~ b000000000000000000(bitIndex13) )).

fof(bitBlastConstant_231,axiom,(
    ~ b000000000000000000(bitIndex12) )).

fof(bitBlastConstant_230,axiom,(
    ~ b000000000000000000(bitIndex11) )).

fof(bitBlastConstant_229,axiom,(
    ~ b000000000000000000(bitIndex10) )).

fof(bitBlastConstant_228,axiom,(
    ~ b000000000000000000(bitIndex9) )).

fof(bitBlastConstant_227,axiom,(
    ~ b000000000000000000(bitIndex8) )).

fof(bitBlastConstant_226,axiom,(
    ~ b000000000000000000(bitIndex7) )).

fof(bitBlastConstant_225,axiom,(
    ~ b000000000000000000(bitIndex6) )).

fof(bitBlastConstant_224,axiom,(
    ~ b000000000000000000(bitIndex5) )).

fof(bitBlastConstant_223,axiom,(
    ~ b000000000000000000(bitIndex4) )).

fof(bitBlastConstant_222,axiom,(
    ~ b000000000000000000(bitIndex3) )).

fof(bitBlastConstant_221,axiom,(
    ~ b000000000000000000(bitIndex2) )).

fof(bitBlastConstant_220,axiom,(
    ~ b000000000000000000(bitIndex1) )).

fof(bitBlastConstant_219,axiom,(
    ~ b000000000000000000(bitIndex0) )).

fof(writeBinaryOperatorEqualRangesSingleBits_120,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( v1009(VarNext)
      <=> ( v1010(VarNext)
          & v1015(VarNext) ) ) ) )).

fof(addAssignment_225,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( v1015(VarNext)
      <=> v1006(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_119,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( v1010(VarNext)
      <=> ( v1012(VarNext)
          & v925(VarNext) ) ) ) )).

fof(writeUnaryOperator_101,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( ~ v1012(VarNext)
      <=> v984(VarNext) ) ) )).

fof(memoryWriteDisabled_1,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ! [AssociatedAddressVar] :
          ( v953_range_3_to_0_address_association(VarNext,AssociatedAddressVar)
         => ! [A] :
              ( ~ ( A = AssociatedAddressVar
                  & v997(VarNext) )
             => ! [B] :
                  ( range_17_0(B)
                 => ( v923_1__array(VarNext,A,B)
                  <=> v923_array(VarCurr,A,B) ) ) ) ) ) )).

fof(memoryWriteEnabledInsideRange_1,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ! [AssociatedAddressVar] :
          ( v953_range_3_to_0_address_association(VarNext,AssociatedAddressVar)
         => ! [A] :
              ( ( A = AssociatedAddressVar
                & v997(VarNext) )
             => ! [B] :
                  ( range_17_0(B)
                 => ( v923_1__array(VarNext,A,B)
                  <=> v930(VarNext,B) ) ) ) ) ) )).

fof(range_axiom_12,axiom,(
    ! [B] :
      ( range_17_0(B)
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
        | bitIndex17 = B ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_118,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( v997(VarNext)
      <=> ( v998(VarNext)
          & v1004(VarNext) ) ) ) )).

fof(addAssignment_224,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( v1004(VarNext)
      <=> v1002(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_117,axiom,(
    ! [VarCurr] :
      ( v1002(VarCurr)
    <=> ( v1005(VarCurr)
        & v945(VarCurr) ) ) )).

fof(writeUnaryOperator_100,axiom,(
    ! [VarCurr] :
      ( ~ v1005(VarCurr)
    <=> v1006(VarCurr) ) )).

fof(writeUnaryOperator_99,axiom,(
    ! [VarCurr] :
      ( ~ v1006(VarCurr)
    <=> v928(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_116,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( v998(VarNext)
      <=> ( v999(VarNext)
          & v925(VarNext) ) ) ) )).

fof(writeUnaryOperator_98,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( ~ v999(VarNext)
      <=> v984(VarNext) ) ) )).

fof(initSateConstraint_111,axiom,(
    ~ v923_array(constB0,b1111_address_term,bitIndex0) )).

fof(initSateConstraint_110,axiom,(
    ~ v923_array(constB0,b1111_address_term,bitIndex15) )).

fof(initSateConstraint_109,axiom,(
    ~ v923_array(constB0,b1111_address_term,bitIndex17) )).

fof(initSateConstraint_108,axiom,(
    ~ v923_array(constB0,b1110_address_term,bitIndex0) )).

fof(initSateConstraint_107,axiom,(
    ~ v923_array(constB0,b1110_address_term,bitIndex15) )).

fof(initSateConstraint_106,axiom,(
    ~ v923_array(constB0,b1110_address_term,bitIndex17) )).

fof(initSateConstraint_105,axiom,(
    ~ v923_array(constB0,b1101_address_term,bitIndex0) )).

fof(initSateConstraint_104,axiom,(
    ~ v923_array(constB0,b1101_address_term,bitIndex15) )).

fof(initSateConstraint_103,axiom,(
    ~ v923_array(constB0,b1101_address_term,bitIndex17) )).

fof(initSateConstraint_102,axiom,(
    ~ v923_array(constB0,b1100_address_term,bitIndex0) )).

fof(initSateConstraint_101,axiom,(
    ~ v923_array(constB0,b1100_address_term,bitIndex15) )).

fof(initSateConstraint_100,axiom,(
    ~ v923_array(constB0,b1100_address_term,bitIndex17) )).

fof(initSateConstraint_99,axiom,(
    ~ v923_array(constB0,b1011_address_term,bitIndex0) )).

fof(initSateConstraint_98,axiom,(
    ~ v923_array(constB0,b1011_address_term,bitIndex15) )).

fof(initSateConstraint_97,axiom,(
    ~ v923_array(constB0,b1011_address_term,bitIndex17) )).

fof(initSateConstraint_96,axiom,(
    ~ v923_array(constB0,b1010_address_term,bitIndex0) )).

fof(initSateConstraint_95,axiom,(
    ~ v923_array(constB0,b1010_address_term,bitIndex15) )).

fof(initSateConstraint_94,axiom,(
    ~ v923_array(constB0,b1010_address_term,bitIndex17) )).

fof(initSateConstraint_93,axiom,(
    ~ v923_array(constB0,b1001_address_term,bitIndex0) )).

fof(initSateConstraint_92,axiom,(
    ~ v923_array(constB0,b1001_address_term,bitIndex15) )).

fof(initSateConstraint_91,axiom,(
    ~ v923_array(constB0,b1001_address_term,bitIndex17) )).

fof(initSateConstraint_90,axiom,(
    ~ v923_array(constB0,b1000_address_term,bitIndex0) )).

fof(initSateConstraint_89,axiom,(
    ~ v923_array(constB0,b1000_address_term,bitIndex15) )).

fof(initSateConstraint_88,axiom,(
    ~ v923_array(constB0,b1000_address_term,bitIndex17) )).

fof(initSateConstraint_87,axiom,(
    ~ v923_array(constB0,b0111_address_term,bitIndex0) )).

fof(initSateConstraint_86,axiom,(
    ~ v923_array(constB0,b0111_address_term,bitIndex15) )).

fof(initSateConstraint_85,axiom,(
    ~ v923_array(constB0,b0111_address_term,bitIndex17) )).

fof(initSateConstraint_84,axiom,(
    ~ v923_array(constB0,b0110_address_term,bitIndex0) )).

fof(initSateConstraint_83,axiom,(
    ~ v923_array(constB0,b0110_address_term,bitIndex15) )).

fof(initSateConstraint_82,axiom,(
    ~ v923_array(constB0,b0110_address_term,bitIndex17) )).

fof(initSateConstraint_81,axiom,(
    ~ v923_array(constB0,b0101_address_term,bitIndex0) )).

fof(initSateConstraint_80,axiom,(
    ~ v923_array(constB0,b0101_address_term,bitIndex15) )).

fof(initSateConstraint_79,axiom,(
    ~ v923_array(constB0,b0101_address_term,bitIndex17) )).

fof(initSateConstraint_78,axiom,(
    ~ v923_array(constB0,b0100_address_term,bitIndex0) )).

fof(initSateConstraint_77,axiom,(
    ~ v923_array(constB0,b0100_address_term,bitIndex15) )).

fof(initSateConstraint_76,axiom,(
    ~ v923_array(constB0,b0100_address_term,bitIndex17) )).

fof(initSateConstraint_75,axiom,(
    ~ v923_array(constB0,b0011_address_term,bitIndex0) )).

fof(initSateConstraint_74,axiom,(
    ~ v923_array(constB0,b0011_address_term,bitIndex15) )).

fof(initSateConstraint_73,axiom,(
    ~ v923_array(constB0,b0011_address_term,bitIndex17) )).

fof(initSateConstraint_72,axiom,(
    ~ v923_array(constB0,b0010_address_term,bitIndex0) )).

fof(initSateConstraint_71,axiom,(
    ~ v923_array(constB0,b0010_address_term,bitIndex15) )).

fof(initSateConstraint_70,axiom,(
    ~ v923_array(constB0,b0010_address_term,bitIndex17) )).

fof(initSateConstraint_69,axiom,(
    ~ v923_array(constB0,b0001_address_term,bitIndex0) )).

fof(initSateConstraint_68,axiom,(
    ~ v923_array(constB0,b0001_address_term,bitIndex15) )).

fof(initSateConstraint_67,axiom,(
    ~ v923_array(constB0,b0001_address_term,bitIndex17) )).

fof(initSateConstraint_66,axiom,(
    ~ v923_array(constB0,b0000_address_term,bitIndex0) )).

fof(initSateConstraint_65,axiom,(
    ~ v923_array(constB0,b0000_address_term,bitIndex15) )).

fof(initSateConstraint_64,axiom,(
    ~ v923_array(constB0,b0000_address_term,bitIndex17) )).

fof(addCaseBooleanConditionEqualRanges1_9,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( ~ v980(VarNext)
       => ! [B] :
            ( range_3_0(B)
           => ( v953(VarNext,B)
            <=> v953(VarCurr,B) ) ) ) ) )).

fof(addCaseBooleanConditionEqualRanges0_8,axiom,(
    ! [VarNext] :
      ( v980(VarNext)
     => ! [B] :
          ( range_3_0(B)
         => ( v953(VarNext,B)
          <=> v990(VarNext,B) ) ) ) )).

fof(addAssignment_223,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ! [B] :
          ( range_3_0(B)
         => ( v990(VarNext,B)
          <=> v988(VarCurr,B) ) ) ) )).

fof(aaddConditionBooleanCondEqualRangesElseBranch_33,axiom,(
    ! [VarCurr] :
      ( ~ v991(VarCurr)
     => ! [B] :
          ( range_3_0(B)
         => ( v988(VarCurr,B)
          <=> v955(VarCurr,B) ) ) ) )).

fof(addConditionBooleanCondEqualRangesThenBranch_34,axiom,(
    ! [VarCurr] :
      ( v991(VarCurr)
     => ! [B] :
          ( range_3_0(B)
         => ( v988(VarCurr,B)
          <=> $false ) ) ) )).

fof(writeUnaryOperator_97,axiom,(
    ! [VarCurr] :
      ( ~ v991(VarCurr)
    <=> v928(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_115,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( v980(VarNext)
      <=> v981(VarNext) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_114,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( v981(VarNext)
      <=> ( v982(VarNext)
          & v925(VarNext) ) ) ) )).

fof(writeUnaryOperator_96,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( ~ v982(VarNext)
      <=> v984(VarNext) ) ) )).

fof(addAssignment_222,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( v984(VarNext)
      <=> v925(VarCurr) ) ) )).

fof(aaddConditionBooleanCondEqualRangesElseBranch_32,axiom,(
    ! [VarCurr] :
      ( ~ v945(VarCurr)
     => ! [B] :
          ( range_3_0(B)
         => ( v955(VarCurr,B)
          <=> v953(VarCurr,B) ) ) ) )).

fof(addConditionBooleanCondEqualRangesThenBranch_33,axiom,(
    ! [VarCurr] :
      ( v945(VarCurr)
     => ! [B] :
          ( range_3_0(B)
         => ( v955(VarCurr,B)
          <=> v957(VarCurr,B) ) ) ) )).

fof(aaddConditionBooleanCondEqualRangesElseBranch_31,axiom,(
    ! [VarCurr] :
      ( ~ v958(VarCurr)
     => ! [B] :
          ( range_3_0(B)
         => ( v957(VarCurr,B)
          <=> v959(VarCurr,B) ) ) ) )).

fof(addConditionBooleanCondEqualRangesThenBranch_32,axiom,(
    ! [VarCurr] :
      ( v958(VarCurr)
     => ! [B] :
          ( range_3_0(B)
         => ( v957(VarCurr,B)
          <=> $false ) ) ) )).

fof(addAssignment_221,axiom,(
    ! [VarCurr] :
      ( v959(VarCurr,bitIndex0)
    <=> v975(VarCurr) ) )).

fof(addAssignment_220,axiom,(
    ! [VarCurr] :
      ( v959(VarCurr,bitIndex1)
    <=> v973(VarCurr) ) )).

fof(addAssignment_219,axiom,(
    ! [VarCurr] :
      ( v959(VarCurr,bitIndex2)
    <=> v968(VarCurr) ) )).

fof(addAssignment_218,axiom,(
    ! [VarCurr] :
      ( v959(VarCurr,bitIndex3)
    <=> v961(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_113,axiom,(
    ! [VarCurr] :
      ( v973(VarCurr)
    <=> ( v974(VarCurr)
        & v977(VarCurr) ) ) )).

fof(writeBinaryOperatorShiftedRanges_55,axiom,(
    ! [VarCurr] :
      ( v977(VarCurr)
    <=> ( v953(VarCurr,bitIndex0)
        | v953(VarCurr,bitIndex1) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_112,axiom,(
    ! [VarCurr] :
      ( v974(VarCurr)
    <=> ( v975(VarCurr)
        | v976(VarCurr) ) ) )).

fof(writeUnaryOperator_95,axiom,(
    ! [VarCurr] :
      ( ~ v976(VarCurr)
    <=> v953(VarCurr,bitIndex1) ) )).

fof(writeUnaryOperator_94,axiom,(
    ! [VarCurr] :
      ( ~ v975(VarCurr)
    <=> v953(VarCurr,bitIndex0) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_111,axiom,(
    ! [VarCurr] :
      ( v968(VarCurr)
    <=> ( v969(VarCurr)
        & v972(VarCurr) ) ) )).

fof(writeBinaryOperatorShiftedRanges_54,axiom,(
    ! [VarCurr] :
      ( v972(VarCurr)
    <=> ( v965(VarCurr)
        | v953(VarCurr,bitIndex2) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_110,axiom,(
    ! [VarCurr] :
      ( v969(VarCurr)
    <=> ( v970(VarCurr)
        | v971(VarCurr) ) ) )).

fof(writeUnaryOperator_93,axiom,(
    ! [VarCurr] :
      ( ~ v971(VarCurr)
    <=> v953(VarCurr,bitIndex2) ) )).

fof(writeUnaryOperator_92,axiom,(
    ! [VarCurr] :
      ( ~ v970(VarCurr)
    <=> v965(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_109,axiom,(
    ! [VarCurr] :
      ( v961(VarCurr)
    <=> ( v962(VarCurr)
        & v967(VarCurr) ) ) )).

fof(writeBinaryOperatorShiftedRanges_53,axiom,(
    ! [VarCurr] :
      ( v967(VarCurr)
    <=> ( v964(VarCurr)
        | v953(VarCurr,bitIndex3) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_108,axiom,(
    ! [VarCurr] :
      ( v962(VarCurr)
    <=> ( v963(VarCurr)
        | v966(VarCurr) ) ) )).

fof(writeUnaryOperator_91,axiom,(
    ! [VarCurr] :
      ( ~ v966(VarCurr)
    <=> v953(VarCurr,bitIndex3) ) )).

fof(writeUnaryOperator_90,axiom,(
    ! [VarCurr] :
      ( ~ v963(VarCurr)
    <=> v964(VarCurr) ) )).

fof(writeBinaryOperatorShiftedRanges_52,axiom,(
    ! [VarCurr] :
      ( v964(VarCurr)
    <=> ( v965(VarCurr)
        & v953(VarCurr,bitIndex2) ) ) )).

fof(writeBinaryOperatorShiftedRanges_51,axiom,(
    ! [VarCurr] :
      ( v965(VarCurr)
    <=> ( v953(VarCurr,bitIndex0)
        & v953(VarCurr,bitIndex1) ) ) )).

fof(addBitVectorEqualityBitBlasted_30,axiom,(
    ! [VarCurr] :
      ( v958(VarCurr)
    <=> ( ( v953(VarCurr,bitIndex3)
        <=> $true )
        & ( v953(VarCurr,bitIndex2)
        <=> $true )
        & ( v953(VarCurr,bitIndex1)
        <=> $true )
        & ( v953(VarCurr,bitIndex0)
        <=> $true ) ) ) )).

fof(addAssignmentInitValue_7,axiom,(
    ~ v953(constB0,bitIndex3) )).

fof(addAssignmentInitValue_6,axiom,(
    ~ v953(constB0,bitIndex2) )).

fof(addAssignmentInitValue_5,axiom,(
    ~ v953(constB0,bitIndex1) )).

fof(addAssignmentInitValue_4,axiom,(
    v953(constB0,bitIndex0) )).

fof(addAssignment_217,axiom,(
    ! [VarCurr] :
      ( v945(VarCurr)
    <=> v947(VarCurr) ) )).

fof(addAssignment_216,axiom,(
    ! [VarCurr] :
      ( v947(VarCurr)
    <=> v949(VarCurr) ) )).

fof(addAssignment_215,axiom,(
    ! [VarCurr] :
      ( v949(VarCurr)
    <=> v951(VarCurr) ) )).

fof(addAssignment_214,axiom,(
    ! [VarCurr,B] :
      ( range_15_0(B)
     => ( v930(VarCurr,B)
      <=> v938(VarCurr,B) ) ) )).

fof(addAssignment_213,axiom,(
    ! [VarCurr] :
      ( ( v930(VarCurr,bitIndex17)
      <=> v932(VarCurr,bitIndex1) )
      & ( v930(VarCurr,bitIndex16)
      <=> v932(VarCurr,bitIndex0) ) ) )).

fof(addAssignment_212,axiom,(
    ! [VarCurr,B] :
      ( range_15_0(B)
     => ( v938(VarCurr,B)
      <=> v940(VarCurr,B) ) ) )).

fof(addAssignment_211,axiom,(
    ! [VarCurr,B] :
      ( range_15_0(B)
     => ( v940(VarCurr,B)
      <=> v942(VarCurr,B) ) ) )).

fof(addAssignment_210,axiom,(
    ! [VarCurr,B] :
      ( range_1_0(B)
     => ( v932(VarCurr,B)
      <=> v934(VarCurr,B) ) ) )).

fof(addAssignment_209,axiom,(
    ! [VarCurr,B] :
      ( range_1_0(B)
     => ( v934(VarCurr,B)
      <=> v936(VarCurr,B) ) ) )).

fof(addAssignment_208,axiom,(
    ! [VarCurr] :
      ( v928(VarCurr)
    <=> v12(VarCurr) ) )).

fof(addAssignment_207,axiom,(
    ! [VarCurr] :
      ( v925(VarCurr)
    <=> v288(VarCurr) ) )).

fof(addAssignment_206,axiom,(
    ! [VarCurr] :
      ( v903(VarCurr)
    <=> v905(VarCurr) ) )).

fof(addAssignment_205,axiom,(
    ! [VarCurr] :
      ( v905(VarCurr)
    <=> v91(VarCurr,bitIndex2) ) )).

fof(addAssignment_204,axiom,(
    ! [VarCurr] :
      ( v91(VarCurr,bitIndex2)
    <=> v898(VarCurr,bitIndex2) ) )).

fof(addAssignment_203,axiom,(
    ! [VarCurr] :
      ( v892(VarCurr,bitIndex2)
    <=> v896(VarCurr,bitIndex2) ) )).

fof(addAssignment_202,axiom,(
    ! [VarCurr] :
      ( v894(VarCurr,bitIndex2)
    <=> v895(VarCurr,bitIndex1) ) )).

fof(addAssignment_201,axiom,(
    ! [VarCurr] :
      ( v885(VarCurr,bitIndex2)
    <=> v889(VarCurr,bitIndex2) ) )).

fof(addAssignment_200,axiom,(
    ! [VarCurr] :
      ( v887(VarCurr,bitIndex2)
    <=> v888(VarCurr,bitIndex1) ) )).

fof(addAssignment_199,axiom,(
    ! [VarCurr] :
      ( v881(VarCurr)
    <=> v883(VarCurr) ) )).

fof(addAssignment_198,axiom,(
    ! [VarCurr] :
      ( v883(VarCurr)
    <=> v91(VarCurr,bitIndex1) ) )).

fof(addAssignment_197,axiom,(
    ! [VarCurr] :
      ( v91(VarCurr,bitIndex1)
    <=> v898(VarCurr,bitIndex1) ) )).

fof(writeBinaryOperatorEqualRangesMultipleBits_5,axiom,(
    ! [VarCurr,B] :
      ( range_2_0(B)
     => ( v898(VarCurr,B)
      <=> ( v899(VarCurr,B)
          | v892(VarCurr,B) ) ) ) )).

fof(writeBinaryOperatorEqualRangesMultipleBits_4,axiom,(
    ! [VarCurr,B] :
      ( range_2_0(B)
     => ( v899(VarCurr,B)
      <=> ( v900(VarCurr,B)
          & v885(VarCurr,B) ) ) ) )).

fof(addAssignment_196,axiom,(
    ! [VarCurr] :
      ( v900(VarCurr,bitIndex0)
    <=> v901(VarCurr) ) )).

fof(addAssignment_195,axiom,(
    ! [VarCurr] :
      ( v900(VarCurr,bitIndex1)
    <=> v901(VarCurr) ) )).

fof(addAssignment_194,axiom,(
    ! [VarCurr] :
      ( v900(VarCurr,bitIndex2)
    <=> v901(VarCurr) ) )).

fof(addAssignment_193,axiom,(
    ! [VarCurr] :
      ( v901(VarCurr)
    <=> v93(VarCurr) ) )).

fof(addAssignment_192,axiom,(
    ! [VarCurr] :
      ( v892(VarCurr,bitIndex1)
    <=> v896(VarCurr,bitIndex1) ) )).

fof(writeBinaryOperatorEqualRangesMultipleBits_3,axiom,(
    ! [VarCurr,B] :
      ( range_2_0(B)
     => ( v896(VarCurr,B)
      <=> ( v95(VarCurr,B)
          & v897(VarCurr,B) ) ) ) )).

fof(writeUnaryOperator_89,axiom,(
    ! [VarCurr,B] :
      ( range_2_0(B)
     => ( v897(VarCurr,B)
      <=> ~ v894(VarCurr,B) ) ) )).

fof(addAssignment_191,axiom,(
    ! [VarCurr] :
      ( v894(VarCurr,bitIndex1)
    <=> v895(VarCurr,bitIndex0) ) )).

fof(writeBinaryOperatorEqualRangesMultipleBits_2,axiom,(
    ! [VarCurr,B] :
      ( range_1_0(B)
     => ( v895(VarCurr,B)
      <=> ( v894(VarCurr,B)
          | v95(VarCurr,B) ) ) ) )).

fof(addAssignment_190,axiom,(
    ! [VarCurr] :
      ( v894(VarCurr,bitIndex0)
    <=> $false ) )).

fof(addAssignment_189,axiom,(
    ! [VarCurr] :
      ( v885(VarCurr,bitIndex1)
    <=> v889(VarCurr,bitIndex1) ) )).

fof(writeBinaryOperatorEqualRangesMultipleBits_1,axiom,(
    ! [VarCurr,B] :
      ( range_2_0(B)
     => ( v889(VarCurr,B)
      <=> ( v97(VarCurr,B)
          & v890(VarCurr,B) ) ) ) )).

fof(writeUnaryOperator_88,axiom,(
    ! [VarCurr,B] :
      ( range_2_0(B)
     => ( v890(VarCurr,B)
      <=> ~ v887(VarCurr,B) ) ) )).

fof(addAssignment_188,axiom,(
    ! [VarCurr] :
      ( v887(VarCurr,bitIndex1)
    <=> v888(VarCurr,bitIndex0) ) )).

fof(writeBinaryOperatorEqualRangesMultipleBits,axiom,(
    ! [VarCurr,B] :
      ( range_1_0(B)
     => ( v888(VarCurr,B)
      <=> ( v887(VarCurr,B)
          | v97(VarCurr,B) ) ) ) )).

fof(range_axiom_11,axiom,(
    ! [B] :
      ( range_1_0(B)
    <=> ( $false
        | bitIndex0 = B
        | bitIndex1 = B ) ) )).

fof(addAssignment_187,axiom,(
    ! [VarCurr] :
      ( v887(VarCurr,bitIndex0)
    <=> $false ) )).

fof(memoryReadIntoBuffer,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ! [AssociatedAddressVar] :
          ( v869_range_3_to_0_address_association(VarNext,AssociatedAddressVar)
         => ! [A] :
              ( address(A)
             => ! [B] :
                  ( A = AssociatedAddressVar
                 => ( range_66_0(B)
                   => ( v867(VarNext,B)
                    <=> v749_array(VarNext,A,B) ) ) ) ) ) ) )).

fof(addAssignmentInitValueVector_9,axiom,(
    ! [B] :
      ( range_3_0(B)
     => ( v869(constB0,B)
      <=> $false ) ) )).

fof(memoryConstantWriteDisabled,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ! [A] :
          ( ~ ( $true
              & v859(VarNext) )
         => ! [B] :
              ( range_66_0(B)
             => ( v749_array(VarNext,A,B)
              <=> v749_1__array(VarNext,A,B) ) ) ) ) )).

fof(memoryConstantWriteEnabledInsideRange,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ! [A] :
          ( ( $true
            & v859(VarNext) )
         => ! [B] :
              ( range_66_0(B)
             => ( v749_array(VarNext,A,B)
              <=> b0000000000000000000000000000000000000000000000000000000000000000000(B) ) ) ) ) )).

fof(bitBlastConstant_218,axiom,(
    ~ b0000000000000000000000000000000000000000000000000000000000000000000(bitIndex66) )).

fof(bitBlastConstant_217,axiom,(
    ~ b0000000000000000000000000000000000000000000000000000000000000000000(bitIndex65) )).

fof(bitBlastConstant_216,axiom,(
    ~ b0000000000000000000000000000000000000000000000000000000000000000000(bitIndex64) )).

fof(bitBlastConstant_215,axiom,(
    ~ b0000000000000000000000000000000000000000000000000000000000000000000(bitIndex63) )).

fof(bitBlastConstant_214,axiom,(
    ~ b0000000000000000000000000000000000000000000000000000000000000000000(bitIndex62) )).

fof(bitBlastConstant_213,axiom,(
    ~ b0000000000000000000000000000000000000000000000000000000000000000000(bitIndex61) )).

fof(bitBlastConstant_212,axiom,(
    ~ b0000000000000000000000000000000000000000000000000000000000000000000(bitIndex60) )).

fof(bitBlastConstant_211,axiom,(
    ~ b0000000000000000000000000000000000000000000000000000000000000000000(bitIndex59) )).

fof(bitBlastConstant_210,axiom,(
    ~ b0000000000000000000000000000000000000000000000000000000000000000000(bitIndex58) )).

fof(bitBlastConstant_209,axiom,(
    ~ b0000000000000000000000000000000000000000000000000000000000000000000(bitIndex57) )).

fof(bitBlastConstant_208,axiom,(
    ~ b0000000000000000000000000000000000000000000000000000000000000000000(bitIndex56) )).

fof(bitBlastConstant_207,axiom,(
    ~ b0000000000000000000000000000000000000000000000000000000000000000000(bitIndex55) )).

fof(bitBlastConstant_206,axiom,(
    ~ b0000000000000000000000000000000000000000000000000000000000000000000(bitIndex54) )).

fof(bitBlastConstant_205,axiom,(
    ~ b0000000000000000000000000000000000000000000000000000000000000000000(bitIndex53) )).

fof(bitBlastConstant_204,axiom,(
    ~ b0000000000000000000000000000000000000000000000000000000000000000000(bitIndex52) )).

fof(bitBlastConstant_203,axiom,(
    ~ b0000000000000000000000000000000000000000000000000000000000000000000(bitIndex51) )).

fof(bitBlastConstant_202,axiom,(
    ~ b0000000000000000000000000000000000000000000000000000000000000000000(bitIndex50) )).

fof(bitBlastConstant_201,axiom,(
    ~ b0000000000000000000000000000000000000000000000000000000000000000000(bitIndex49) )).

fof(bitBlastConstant_200,axiom,(
    ~ b0000000000000000000000000000000000000000000000000000000000000000000(bitIndex48) )).

fof(bitBlastConstant_199,axiom,(
    ~ b0000000000000000000000000000000000000000000000000000000000000000000(bitIndex47) )).

fof(bitBlastConstant_198,axiom,(
    ~ b0000000000000000000000000000000000000000000000000000000000000000000(bitIndex46) )).

fof(bitBlastConstant_197,axiom,(
    ~ b0000000000000000000000000000000000000000000000000000000000000000000(bitIndex45) )).

fof(bitBlastConstant_196,axiom,(
    ~ b0000000000000000000000000000000000000000000000000000000000000000000(bitIndex44) )).

fof(bitBlastConstant_195,axiom,(
    ~ b0000000000000000000000000000000000000000000000000000000000000000000(bitIndex43) )).

fof(bitBlastConstant_194,axiom,(
    ~ b0000000000000000000000000000000000000000000000000000000000000000000(bitIndex42) )).

fof(bitBlastConstant_193,axiom,(
    ~ b0000000000000000000000000000000000000000000000000000000000000000000(bitIndex41) )).

fof(bitBlastConstant_192,axiom,(
    ~ b0000000000000000000000000000000000000000000000000000000000000000000(bitIndex40) )).

fof(bitBlastConstant_191,axiom,(
    ~ b0000000000000000000000000000000000000000000000000000000000000000000(bitIndex39) )).

fof(bitBlastConstant_190,axiom,(
    ~ b0000000000000000000000000000000000000000000000000000000000000000000(bitIndex38) )).

fof(bitBlastConstant_189,axiom,(
    ~ b0000000000000000000000000000000000000000000000000000000000000000000(bitIndex37) )).

fof(bitBlastConstant_188,axiom,(
    ~ b0000000000000000000000000000000000000000000000000000000000000000000(bitIndex36) )).

fof(bitBlastConstant_187,axiom,(
    ~ b0000000000000000000000000000000000000000000000000000000000000000000(bitIndex35) )).

fof(bitBlastConstant_186,axiom,(
    ~ b0000000000000000000000000000000000000000000000000000000000000000000(bitIndex34) )).

fof(bitBlastConstant_185,axiom,(
    ~ b0000000000000000000000000000000000000000000000000000000000000000000(bitIndex33) )).

fof(bitBlastConstant_184,axiom,(
    ~ b0000000000000000000000000000000000000000000000000000000000000000000(bitIndex32) )).

fof(bitBlastConstant_183,axiom,(
    ~ b0000000000000000000000000000000000000000000000000000000000000000000(bitIndex31) )).

fof(bitBlastConstant_182,axiom,(
    ~ b0000000000000000000000000000000000000000000000000000000000000000000(bitIndex30) )).

fof(bitBlastConstant_181,axiom,(
    ~ b0000000000000000000000000000000000000000000000000000000000000000000(bitIndex29) )).

fof(bitBlastConstant_180,axiom,(
    ~ b0000000000000000000000000000000000000000000000000000000000000000000(bitIndex28) )).

fof(bitBlastConstant_179,axiom,(
    ~ b0000000000000000000000000000000000000000000000000000000000000000000(bitIndex27) )).

fof(bitBlastConstant_178,axiom,(
    ~ b0000000000000000000000000000000000000000000000000000000000000000000(bitIndex26) )).

fof(bitBlastConstant_177,axiom,(
    ~ b0000000000000000000000000000000000000000000000000000000000000000000(bitIndex25) )).

fof(bitBlastConstant_176,axiom,(
    ~ b0000000000000000000000000000000000000000000000000000000000000000000(bitIndex24) )).

fof(bitBlastConstant_175,axiom,(
    ~ b0000000000000000000000000000000000000000000000000000000000000000000(bitIndex23) )).

fof(bitBlastConstant_174,axiom,(
    ~ b0000000000000000000000000000000000000000000000000000000000000000000(bitIndex22) )).

fof(bitBlastConstant_173,axiom,(
    ~ b0000000000000000000000000000000000000000000000000000000000000000000(bitIndex21) )).

fof(bitBlastConstant_172,axiom,(
    ~ b0000000000000000000000000000000000000000000000000000000000000000000(bitIndex20) )).

fof(bitBlastConstant_171,axiom,(
    ~ b0000000000000000000000000000000000000000000000000000000000000000000(bitIndex19) )).

fof(bitBlastConstant_170,axiom,(
    ~ b0000000000000000000000000000000000000000000000000000000000000000000(bitIndex18) )).

fof(bitBlastConstant_169,axiom,(
    ~ b0000000000000000000000000000000000000000000000000000000000000000000(bitIndex17) )).

fof(bitBlastConstant_168,axiom,(
    ~ b0000000000000000000000000000000000000000000000000000000000000000000(bitIndex16) )).

fof(bitBlastConstant_167,axiom,(
    ~ b0000000000000000000000000000000000000000000000000000000000000000000(bitIndex15) )).

fof(bitBlastConstant_166,axiom,(
    ~ b0000000000000000000000000000000000000000000000000000000000000000000(bitIndex14) )).

fof(bitBlastConstant_165,axiom,(
    ~ b0000000000000000000000000000000000000000000000000000000000000000000(bitIndex13) )).

fof(bitBlastConstant_164,axiom,(
    ~ b0000000000000000000000000000000000000000000000000000000000000000000(bitIndex12) )).

fof(bitBlastConstant_163,axiom,(
    ~ b0000000000000000000000000000000000000000000000000000000000000000000(bitIndex11) )).

fof(bitBlastConstant_162,axiom,(
    ~ b0000000000000000000000000000000000000000000000000000000000000000000(bitIndex10) )).

fof(bitBlastConstant_161,axiom,(
    ~ b0000000000000000000000000000000000000000000000000000000000000000000(bitIndex9) )).

fof(bitBlastConstant_160,axiom,(
    ~ b0000000000000000000000000000000000000000000000000000000000000000000(bitIndex8) )).

fof(bitBlastConstant_159,axiom,(
    ~ b0000000000000000000000000000000000000000000000000000000000000000000(bitIndex7) )).

fof(bitBlastConstant_158,axiom,(
    ~ b0000000000000000000000000000000000000000000000000000000000000000000(bitIndex6) )).

fof(bitBlastConstant_157,axiom,(
    ~ b0000000000000000000000000000000000000000000000000000000000000000000(bitIndex5) )).

fof(bitBlastConstant_156,axiom,(
    ~ b0000000000000000000000000000000000000000000000000000000000000000000(bitIndex4) )).

fof(bitBlastConstant_155,axiom,(
    ~ b0000000000000000000000000000000000000000000000000000000000000000000(bitIndex3) )).

fof(bitBlastConstant_154,axiom,(
    ~ b0000000000000000000000000000000000000000000000000000000000000000000(bitIndex2) )).

fof(bitBlastConstant_153,axiom,(
    ~ b0000000000000000000000000000000000000000000000000000000000000000000(bitIndex1) )).

fof(bitBlastConstant_152,axiom,(
    ~ b0000000000000000000000000000000000000000000000000000000000000000000(bitIndex0) )).

fof(writeBinaryOperatorEqualRangesSingleBits_107,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( v859(VarNext)
      <=> ( v860(VarNext)
          & v865(VarNext) ) ) ) )).

fof(addAssignment_186,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( v865(VarNext)
      <=> v856(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_106,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( v860(VarNext)
      <=> ( v862(VarNext)
          & v751(VarNext) ) ) ) )).

fof(writeUnaryOperator_87,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( ~ v862(VarNext)
      <=> v823(VarNext) ) ) )).

fof(memoryWriteDisabled,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ! [AssociatedAddressVar] :
          ( v791_range_3_to_0_address_association(VarNext,AssociatedAddressVar)
         => ! [A] :
              ( ~ ( A = AssociatedAddressVar
                  & v847(VarNext) )
             => ! [B] :
                  ( range_66_0(B)
                 => ( v749_1__array(VarNext,A,B)
                  <=> v749_array(VarCurr,A,B) ) ) ) ) ) )).

fof(memoryWriteEnabledInsideRange,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ! [AssociatedAddressVar] :
          ( v791_range_3_to_0_address_association(VarNext,AssociatedAddressVar)
         => ! [A] :
              ( ( A = AssociatedAddressVar
                & v847(VarNext) )
             => ! [B] :
                  ( range_66_0(B)
                 => ( v749_1__array(VarNext,A,B)
                  <=> v756(VarNext,B) ) ) ) ) ) )).

fof(range_axiom_10,axiom,(
    ! [B] :
      ( range_66_0(B)
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
        | bitIndex66 = B ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_105,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( v847(VarNext)
      <=> ( v848(VarNext)
          & v854(VarNext) ) ) ) )).

fof(addAssignment_185,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( v854(VarNext)
      <=> v852(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_104,axiom,(
    ! [VarCurr] :
      ( v852(VarCurr)
    <=> ( v855(VarCurr)
        & v783(VarCurr) ) ) )).

fof(writeUnaryOperator_86,axiom,(
    ! [VarCurr] :
      ( ~ v855(VarCurr)
    <=> v856(VarCurr) ) )).

fof(writeUnaryOperator_85,axiom,(
    ! [VarCurr] :
      ( ~ v856(VarCurr)
    <=> v754(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_103,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( v848(VarNext)
      <=> ( v849(VarNext)
          & v751(VarNext) ) ) ) )).

fof(writeUnaryOperator_84,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( ~ v849(VarNext)
      <=> v823(VarNext) ) ) )).

fof(initSateConstraint_63,axiom,(
    ~ v749_array(constB0,b1111_address_term,bitIndex63) )).

fof(initSateConstraint_62,axiom,(
    ~ v749_array(constB0,b1111_address_term,bitIndex64) )).

fof(initSateConstraint_61,axiom,(
    ~ v749_array(constB0,b1111_address_term,bitIndex65) )).

fof(initSateConstraint_60,axiom,(
    ~ v749_array(constB0,b1111_address_term,bitIndex66) )).

fof(initSateConstraint_59,axiom,(
    ~ v749_array(constB0,b1110_address_term,bitIndex63) )).

fof(initSateConstraint_58,axiom,(
    ~ v749_array(constB0,b1110_address_term,bitIndex64) )).

fof(initSateConstraint_57,axiom,(
    ~ v749_array(constB0,b1110_address_term,bitIndex65) )).

fof(initSateConstraint_56,axiom,(
    ~ v749_array(constB0,b1110_address_term,bitIndex66) )).

fof(bitBlastConstant_151,axiom,(
    b1110(bitIndex3) )).

fof(bitBlastConstant_150,axiom,(
    b1110(bitIndex2) )).

fof(bitBlastConstant_149,axiom,(
    b1110(bitIndex1) )).

fof(bitBlastConstant_148,axiom,(
    ~ b1110(bitIndex0) )).

fof(initSateConstraint_55,axiom,(
    ~ v749_array(constB0,b1101_address_term,bitIndex63) )).

fof(initSateConstraint_54,axiom,(
    ~ v749_array(constB0,b1101_address_term,bitIndex64) )).

fof(initSateConstraint_53,axiom,(
    ~ v749_array(constB0,b1101_address_term,bitIndex65) )).

fof(initSateConstraint_52,axiom,(
    ~ v749_array(constB0,b1101_address_term,bitIndex66) )).

fof(bitBlastConstant_147,axiom,(
    b1101(bitIndex3) )).

fof(bitBlastConstant_146,axiom,(
    b1101(bitIndex2) )).

fof(bitBlastConstant_145,axiom,(
    ~ b1101(bitIndex1) )).

fof(bitBlastConstant_144,axiom,(
    b1101(bitIndex0) )).

fof(initSateConstraint_51,axiom,(
    ~ v749_array(constB0,b1100_address_term,bitIndex63) )).

fof(initSateConstraint_50,axiom,(
    ~ v749_array(constB0,b1100_address_term,bitIndex64) )).

fof(initSateConstraint_49,axiom,(
    ~ v749_array(constB0,b1100_address_term,bitIndex65) )).

fof(initSateConstraint_48,axiom,(
    ~ v749_array(constB0,b1100_address_term,bitIndex66) )).

fof(bitBlastConstant_143,axiom,(
    b1100(bitIndex3) )).

fof(bitBlastConstant_142,axiom,(
    b1100(bitIndex2) )).

fof(bitBlastConstant_141,axiom,(
    ~ b1100(bitIndex1) )).

fof(bitBlastConstant_140,axiom,(
    ~ b1100(bitIndex0) )).

fof(initSateConstraint_47,axiom,(
    ~ v749_array(constB0,b1011_address_term,bitIndex63) )).

fof(initSateConstraint_46,axiom,(
    ~ v749_array(constB0,b1011_address_term,bitIndex64) )).

fof(initSateConstraint_45,axiom,(
    ~ v749_array(constB0,b1011_address_term,bitIndex65) )).

fof(initSateConstraint_44,axiom,(
    ~ v749_array(constB0,b1011_address_term,bitIndex66) )).

fof(bitBlastConstant_139,axiom,(
    b1011(bitIndex3) )).

fof(bitBlastConstant_138,axiom,(
    ~ b1011(bitIndex2) )).

fof(bitBlastConstant_137,axiom,(
    b1011(bitIndex1) )).

fof(bitBlastConstant_136,axiom,(
    b1011(bitIndex0) )).

fof(initSateConstraint_43,axiom,(
    ~ v749_array(constB0,b1010_address_term,bitIndex63) )).

fof(initSateConstraint_42,axiom,(
    ~ v749_array(constB0,b1010_address_term,bitIndex64) )).

fof(initSateConstraint_41,axiom,(
    ~ v749_array(constB0,b1010_address_term,bitIndex65) )).

fof(initSateConstraint_40,axiom,(
    ~ v749_array(constB0,b1010_address_term,bitIndex66) )).

fof(bitBlastConstant_135,axiom,(
    b1010(bitIndex3) )).

fof(bitBlastConstant_134,axiom,(
    ~ b1010(bitIndex2) )).

fof(bitBlastConstant_133,axiom,(
    b1010(bitIndex1) )).

fof(bitBlastConstant_132,axiom,(
    ~ b1010(bitIndex0) )).

fof(initSateConstraint_39,axiom,(
    ~ v749_array(constB0,b1001_address_term,bitIndex63) )).

fof(initSateConstraint_38,axiom,(
    ~ v749_array(constB0,b1001_address_term,bitIndex64) )).

fof(initSateConstraint_37,axiom,(
    ~ v749_array(constB0,b1001_address_term,bitIndex65) )).

fof(initSateConstraint_36,axiom,(
    ~ v749_array(constB0,b1001_address_term,bitIndex66) )).

fof(bitBlastConstant_131,axiom,(
    b1001(bitIndex3) )).

fof(bitBlastConstant_130,axiom,(
    ~ b1001(bitIndex2) )).

fof(bitBlastConstant_129,axiom,(
    ~ b1001(bitIndex1) )).

fof(bitBlastConstant_128,axiom,(
    b1001(bitIndex0) )).

fof(initSateConstraint_35,axiom,(
    ~ v749_array(constB0,b1000_address_term,bitIndex63) )).

fof(initSateConstraint_34,axiom,(
    ~ v749_array(constB0,b1000_address_term,bitIndex64) )).

fof(initSateConstraint_33,axiom,(
    ~ v749_array(constB0,b1000_address_term,bitIndex65) )).

fof(initSateConstraint_32,axiom,(
    ~ v749_array(constB0,b1000_address_term,bitIndex66) )).

fof(bitBlastConstant_127,axiom,(
    b1000(bitIndex3) )).

fof(bitBlastConstant_126,axiom,(
    ~ b1000(bitIndex2) )).

fof(bitBlastConstant_125,axiom,(
    ~ b1000(bitIndex1) )).

fof(bitBlastConstant_124,axiom,(
    ~ b1000(bitIndex0) )).

fof(initSateConstraint_31,axiom,(
    ~ v749_array(constB0,b0111_address_term,bitIndex63) )).

fof(initSateConstraint_30,axiom,(
    ~ v749_array(constB0,b0111_address_term,bitIndex64) )).

fof(initSateConstraint_29,axiom,(
    ~ v749_array(constB0,b0111_address_term,bitIndex65) )).

fof(initSateConstraint_28,axiom,(
    ~ v749_array(constB0,b0111_address_term,bitIndex66) )).

fof(bitBlastConstant_123,axiom,(
    ~ b0111(bitIndex3) )).

fof(bitBlastConstant_122,axiom,(
    b0111(bitIndex2) )).

fof(bitBlastConstant_121,axiom,(
    b0111(bitIndex1) )).

fof(bitBlastConstant_120,axiom,(
    b0111(bitIndex0) )).

fof(initSateConstraint_27,axiom,(
    ~ v749_array(constB0,b0110_address_term,bitIndex63) )).

fof(initSateConstraint_26,axiom,(
    ~ v749_array(constB0,b0110_address_term,bitIndex64) )).

fof(initSateConstraint_25,axiom,(
    ~ v749_array(constB0,b0110_address_term,bitIndex65) )).

fof(initSateConstraint_24,axiom,(
    ~ v749_array(constB0,b0110_address_term,bitIndex66) )).

fof(initSateConstraint_23,axiom,(
    ~ v749_array(constB0,b0101_address_term,bitIndex63) )).

fof(initSateConstraint_22,axiom,(
    ~ v749_array(constB0,b0101_address_term,bitIndex64) )).

fof(initSateConstraint_21,axiom,(
    ~ v749_array(constB0,b0101_address_term,bitIndex65) )).

fof(initSateConstraint_20,axiom,(
    ~ v749_array(constB0,b0101_address_term,bitIndex66) )).

fof(bitBlastConstant_119,axiom,(
    ~ b0101(bitIndex3) )).

fof(bitBlastConstant_118,axiom,(
    b0101(bitIndex2) )).

fof(bitBlastConstant_117,axiom,(
    ~ b0101(bitIndex1) )).

fof(bitBlastConstant_116,axiom,(
    b0101(bitIndex0) )).

fof(initSateConstraint_19,axiom,(
    ~ v749_array(constB0,b0100_address_term,bitIndex63) )).

fof(initSateConstraint_18,axiom,(
    ~ v749_array(constB0,b0100_address_term,bitIndex64) )).

fof(initSateConstraint_17,axiom,(
    ~ v749_array(constB0,b0100_address_term,bitIndex65) )).

fof(initSateConstraint_16,axiom,(
    ~ v749_array(constB0,b0100_address_term,bitIndex66) )).

fof(bitBlastConstant_115,axiom,(
    ~ b0100(bitIndex3) )).

fof(bitBlastConstant_114,axiom,(
    b0100(bitIndex2) )).

fof(bitBlastConstant_113,axiom,(
    ~ b0100(bitIndex1) )).

fof(bitBlastConstant_112,axiom,(
    ~ b0100(bitIndex0) )).

fof(initSateConstraint_15,axiom,(
    ~ v749_array(constB0,b0011_address_term,bitIndex63) )).

fof(initSateConstraint_14,axiom,(
    ~ v749_array(constB0,b0011_address_term,bitIndex64) )).

fof(initSateConstraint_13,axiom,(
    ~ v749_array(constB0,b0011_address_term,bitIndex65) )).

fof(initSateConstraint_12,axiom,(
    ~ v749_array(constB0,b0011_address_term,bitIndex66) )).

fof(bitBlastConstant_111,axiom,(
    ~ b0011(bitIndex3) )).

fof(bitBlastConstant_110,axiom,(
    ~ b0011(bitIndex2) )).

fof(bitBlastConstant_109,axiom,(
    b0011(bitIndex1) )).

fof(bitBlastConstant_108,axiom,(
    b0011(bitIndex0) )).

fof(initSateConstraint_11,axiom,(
    ~ v749_array(constB0,b0010_address_term,bitIndex63) )).

fof(initSateConstraint_10,axiom,(
    ~ v749_array(constB0,b0010_address_term,bitIndex64) )).

fof(initSateConstraint_9,axiom,(
    ~ v749_array(constB0,b0010_address_term,bitIndex65) )).

fof(initSateConstraint_8,axiom,(
    ~ v749_array(constB0,b0010_address_term,bitIndex66) )).

fof(bitBlastConstant_107,axiom,(
    ~ b0010(bitIndex3) )).

fof(bitBlastConstant_106,axiom,(
    ~ b0010(bitIndex2) )).

fof(bitBlastConstant_105,axiom,(
    b0010(bitIndex1) )).

fof(bitBlastConstant_104,axiom,(
    ~ b0010(bitIndex0) )).

fof(initSateConstraint_7,axiom,(
    ~ v749_array(constB0,b0001_address_term,bitIndex63) )).

fof(initSateConstraint_6,axiom,(
    ~ v749_array(constB0,b0001_address_term,bitIndex64) )).

fof(initSateConstraint_5,axiom,(
    ~ v749_array(constB0,b0001_address_term,bitIndex65) )).

fof(initSateConstraint_4,axiom,(
    ~ v749_array(constB0,b0001_address_term,bitIndex66) )).

fof(initSateConstraint_3,axiom,(
    ~ v749_array(constB0,b0000_address_term,bitIndex63) )).

fof(initSateConstraint_2,axiom,(
    ~ v749_array(constB0,b0000_address_term,bitIndex64) )).

fof(initSateConstraint_1,axiom,(
    ~ v749_array(constB0,b0000_address_term,bitIndex65) )).

fof(initSateConstraint,axiom,(
    ~ v749_array(constB0,b0000_address_term,bitIndex66) )).

fof(addCaseBooleanConditionEqualRanges1_8,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( ~ v819(VarNext)
       => ! [B] :
            ( range_3_0(B)
           => ( v791(VarNext,B)
            <=> v791(VarCurr,B) ) ) ) ) )).

fof(addCaseBooleanConditionEqualRanges0_7,axiom,(
    ! [VarNext] :
      ( v819(VarNext)
     => ! [B] :
          ( range_3_0(B)
         => ( v791(VarNext,B)
          <=> v829(VarNext,B) ) ) ) )).

fof(addAssignment_184,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ! [B] :
          ( range_3_0(B)
         => ( v829(VarNext,B)
          <=> v827(VarCurr,B) ) ) ) )).

fof(aaddConditionBooleanCondEqualRangesElseBranch_30,axiom,(
    ! [VarCurr] :
      ( ~ v830(VarCurr)
     => ! [B] :
          ( range_3_0(B)
         => ( v827(VarCurr,B)
          <=> v793(VarCurr,B) ) ) ) )).

fof(addConditionBooleanCondEqualRangesThenBranch_31,axiom,(
    ! [VarCurr] :
      ( v830(VarCurr)
     => ! [B] :
          ( range_3_0(B)
         => ( v827(VarCurr,B)
          <=> $false ) ) ) )).

fof(writeUnaryOperator_83,axiom,(
    ! [VarCurr] :
      ( ~ v830(VarCurr)
    <=> v754(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_102,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( v819(VarNext)
      <=> v820(VarNext) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_101,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( v820(VarNext)
      <=> ( v821(VarNext)
          & v751(VarNext) ) ) ) )).

fof(writeUnaryOperator_82,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( ~ v821(VarNext)
      <=> v823(VarNext) ) ) )).

fof(addAssignment_183,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( v823(VarNext)
      <=> v751(VarCurr) ) ) )).

fof(aaddConditionBooleanCondEqualRangesElseBranch_29,axiom,(
    ! [VarCurr] :
      ( ~ v783(VarCurr)
     => ! [B] :
          ( range_3_0(B)
         => ( v793(VarCurr,B)
          <=> v791(VarCurr,B) ) ) ) )).

fof(addConditionBooleanCondEqualRangesThenBranch_30,axiom,(
    ! [VarCurr] :
      ( v783(VarCurr)
     => ! [B] :
          ( range_3_0(B)
         => ( v793(VarCurr,B)
          <=> v796(VarCurr,B) ) ) ) )).

fof(aaddConditionBooleanCondEqualRangesElseBranch_28,axiom,(
    ! [VarCurr] :
      ( ~ v797(VarCurr)
     => ! [B] :
          ( range_3_0(B)
         => ( v796(VarCurr,B)
          <=> v798(VarCurr,B) ) ) ) )).

fof(addConditionBooleanCondEqualRangesThenBranch_29,axiom,(
    ! [VarCurr] :
      ( v797(VarCurr)
     => ! [B] :
          ( range_3_0(B)
         => ( v796(VarCurr,B)
          <=> $false ) ) ) )).

fof(addAssignment_182,axiom,(
    ! [VarCurr] :
      ( v798(VarCurr,bitIndex0)
    <=> v814(VarCurr) ) )).

fof(addAssignment_181,axiom,(
    ! [VarCurr] :
      ( v798(VarCurr,bitIndex1)
    <=> v812(VarCurr) ) )).

fof(addAssignment_180,axiom,(
    ! [VarCurr] :
      ( v798(VarCurr,bitIndex2)
    <=> v807(VarCurr) ) )).

fof(addAssignment_179,axiom,(
    ! [VarCurr] :
      ( v798(VarCurr,bitIndex3)
    <=> v800(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_100,axiom,(
    ! [VarCurr] :
      ( v812(VarCurr)
    <=> ( v813(VarCurr)
        & v816(VarCurr) ) ) )).

fof(writeBinaryOperatorShiftedRanges_50,axiom,(
    ! [VarCurr] :
      ( v816(VarCurr)
    <=> ( v791(VarCurr,bitIndex0)
        | v791(VarCurr,bitIndex1) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_99,axiom,(
    ! [VarCurr] :
      ( v813(VarCurr)
    <=> ( v814(VarCurr)
        | v815(VarCurr) ) ) )).

fof(writeUnaryOperator_81,axiom,(
    ! [VarCurr] :
      ( ~ v815(VarCurr)
    <=> v791(VarCurr,bitIndex1) ) )).

fof(writeUnaryOperator_80,axiom,(
    ! [VarCurr] :
      ( ~ v814(VarCurr)
    <=> v791(VarCurr,bitIndex0) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_98,axiom,(
    ! [VarCurr] :
      ( v807(VarCurr)
    <=> ( v808(VarCurr)
        & v811(VarCurr) ) ) )).

fof(writeBinaryOperatorShiftedRanges_49,axiom,(
    ! [VarCurr] :
      ( v811(VarCurr)
    <=> ( v804(VarCurr)
        | v791(VarCurr,bitIndex2) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_97,axiom,(
    ! [VarCurr] :
      ( v808(VarCurr)
    <=> ( v809(VarCurr)
        | v810(VarCurr) ) ) )).

fof(writeUnaryOperator_79,axiom,(
    ! [VarCurr] :
      ( ~ v810(VarCurr)
    <=> v791(VarCurr,bitIndex2) ) )).

fof(writeUnaryOperator_78,axiom,(
    ! [VarCurr] :
      ( ~ v809(VarCurr)
    <=> v804(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_96,axiom,(
    ! [VarCurr] :
      ( v800(VarCurr)
    <=> ( v801(VarCurr)
        & v806(VarCurr) ) ) )).

fof(writeBinaryOperatorShiftedRanges_48,axiom,(
    ! [VarCurr] :
      ( v806(VarCurr)
    <=> ( v803(VarCurr)
        | v791(VarCurr,bitIndex3) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_95,axiom,(
    ! [VarCurr] :
      ( v801(VarCurr)
    <=> ( v802(VarCurr)
        | v805(VarCurr) ) ) )).

fof(writeUnaryOperator_77,axiom,(
    ! [VarCurr] :
      ( ~ v805(VarCurr)
    <=> v791(VarCurr,bitIndex3) ) )).

fof(writeUnaryOperator_76,axiom,(
    ! [VarCurr] :
      ( ~ v802(VarCurr)
    <=> v803(VarCurr) ) )).

fof(writeBinaryOperatorShiftedRanges_47,axiom,(
    ! [VarCurr] :
      ( v803(VarCurr)
    <=> ( v804(VarCurr)
        & v791(VarCurr,bitIndex2) ) ) )).

fof(writeBinaryOperatorShiftedRanges_46,axiom,(
    ! [VarCurr] :
      ( v804(VarCurr)
    <=> ( v791(VarCurr,bitIndex0)
        & v791(VarCurr,bitIndex1) ) ) )).

fof(addBitVectorEqualityBitBlasted_29,axiom,(
    ! [VarCurr] :
      ( v797(VarCurr)
    <=> ( ( v791(VarCurr,bitIndex3)
        <=> $true )
        & ( v791(VarCurr,bitIndex2)
        <=> $true )
        & ( v791(VarCurr,bitIndex1)
        <=> $true )
        & ( v791(VarCurr,bitIndex0)
        <=> $true ) ) ) )).

fof(bitBlastConstant_103,axiom,(
    b1111(bitIndex3) )).

fof(bitBlastConstant_102,axiom,(
    b1111(bitIndex2) )).

fof(bitBlastConstant_101,axiom,(
    b1111(bitIndex1) )).

fof(bitBlastConstant_100,axiom,(
    b1111(bitIndex0) )).

fof(addAssignmentInitValue_3,axiom,(
    ~ v791(constB0,bitIndex3) )).

fof(addAssignmentInitValue_2,axiom,(
    ~ v791(constB0,bitIndex2) )).

fof(addAssignmentInitValue_1,axiom,(
    ~ v791(constB0,bitIndex1) )).

fof(addAssignmentInitValue,axiom,(
    v791(constB0,bitIndex0) )).

fof(bitBlastConstant_99,axiom,(
    ~ b0001(bitIndex3) )).

fof(bitBlastConstant_98,axiom,(
    ~ b0001(bitIndex2) )).

fof(bitBlastConstant_97,axiom,(
    ~ b0001(bitIndex1) )).

fof(bitBlastConstant_96,axiom,(
    b0001(bitIndex0) )).

fof(addAssignment_178,axiom,(
    ! [VarCurr] :
      ( v783(VarCurr)
    <=> v785(VarCurr) ) )).

fof(addAssignment_177,axiom,(
    ! [VarCurr] :
      ( v785(VarCurr)
    <=> v787(VarCurr) ) )).

fof(addAssignment_176,axiom,(
    ! [VarCurr] :
      ( v787(VarCurr)
    <=> v789(VarCurr) ) )).

fof(addAssignment_175,axiom,(
    ! [VarCurr,B] :
      ( range_10_0(B)
     => ( v756(VarCurr,B)
      <=> v776(VarCurr,B) ) ) )).

fof(addAssignment_174,axiom,(
    ! [VarCurr] :
      ( ( v756(VarCurr,bitIndex26)
      <=> v770(VarCurr,bitIndex15) )
      & ( v756(VarCurr,bitIndex25)
      <=> v770(VarCurr,bitIndex14) )
      & ( v756(VarCurr,bitIndex24)
      <=> v770(VarCurr,bitIndex13) )
      & ( v756(VarCurr,bitIndex23)
      <=> v770(VarCurr,bitIndex12) )
      & ( v756(VarCurr,bitIndex22)
      <=> v770(VarCurr,bitIndex11) )
      & ( v756(VarCurr,bitIndex21)
      <=> v770(VarCurr,bitIndex10) )
      & ( v756(VarCurr,bitIndex20)
      <=> v770(VarCurr,bitIndex9) )
      & ( v756(VarCurr,bitIndex19)
      <=> v770(VarCurr,bitIndex8) )
      & ( v756(VarCurr,bitIndex18)
      <=> v770(VarCurr,bitIndex7) )
      & ( v756(VarCurr,bitIndex17)
      <=> v770(VarCurr,bitIndex6) )
      & ( v756(VarCurr,bitIndex16)
      <=> v770(VarCurr,bitIndex5) )
      & ( v756(VarCurr,bitIndex15)
      <=> v770(VarCurr,bitIndex4) )
      & ( v756(VarCurr,bitIndex14)
      <=> v770(VarCurr,bitIndex3) )
      & ( v756(VarCurr,bitIndex13)
      <=> v770(VarCurr,bitIndex2) )
      & ( v756(VarCurr,bitIndex12)
      <=> v770(VarCurr,bitIndex1) )
      & ( v756(VarCurr,bitIndex11)
      <=> v770(VarCurr,bitIndex0) ) ) )).

fof(addAssignment_173,axiom,(
    ! [VarCurr] :
      ( ( v756(VarCurr,bitIndex62)
      <=> v764(VarCurr,bitIndex35) )
      & ( v756(VarCurr,bitIndex61)
      <=> v764(VarCurr,bitIndex34) )
      & ( v756(VarCurr,bitIndex60)
      <=> v764(VarCurr,bitIndex33) )
      & ( v756(VarCurr,bitIndex59)
      <=> v764(VarCurr,bitIndex32) )
      & ( v756(VarCurr,bitIndex58)
      <=> v764(VarCurr,bitIndex31) )
      & ( v756(VarCurr,bitIndex57)
      <=> v764(VarCurr,bitIndex30) )
      & ( v756(VarCurr,bitIndex56)
      <=> v764(VarCurr,bitIndex29) )
      & ( v756(VarCurr,bitIndex55)
      <=> v764(VarCurr,bitIndex28) )
      & ( v756(VarCurr,bitIndex54)
      <=> v764(VarCurr,bitIndex27) )
      & ( v756(VarCurr,bitIndex53)
      <=> v764(VarCurr,bitIndex26) )
      & ( v756(VarCurr,bitIndex52)
      <=> v764(VarCurr,bitIndex25) )
      & ( v756(VarCurr,bitIndex51)
      <=> v764(VarCurr,bitIndex24) )
      & ( v756(VarCurr,bitIndex50)
      <=> v764(VarCurr,bitIndex23) )
      & ( v756(VarCurr,bitIndex49)
      <=> v764(VarCurr,bitIndex22) )
      & ( v756(VarCurr,bitIndex48)
      <=> v764(VarCurr,bitIndex21) )
      & ( v756(VarCurr,bitIndex47)
      <=> v764(VarCurr,bitIndex20) )
      & ( v756(VarCurr,bitIndex46)
      <=> v764(VarCurr,bitIndex19) )
      & ( v756(VarCurr,bitIndex45)
      <=> v764(VarCurr,bitIndex18) )
      & ( v756(VarCurr,bitIndex44)
      <=> v764(VarCurr,bitIndex17) )
      & ( v756(VarCurr,bitIndex43)
      <=> v764(VarCurr,bitIndex16) )
      & ( v756(VarCurr,bitIndex42)
      <=> v764(VarCurr,bitIndex15) )
      & ( v756(VarCurr,bitIndex41)
      <=> v764(VarCurr,bitIndex14) )
      & ( v756(VarCurr,bitIndex40)
      <=> v764(VarCurr,bitIndex13) )
      & ( v756(VarCurr,bitIndex39)
      <=> v764(VarCurr,bitIndex12) )
      & ( v756(VarCurr,bitIndex38)
      <=> v764(VarCurr,bitIndex11) )
      & ( v756(VarCurr,bitIndex37)
      <=> v764(VarCurr,bitIndex10) )
      & ( v756(VarCurr,bitIndex36)
      <=> v764(VarCurr,bitIndex9) )
      & ( v756(VarCurr,bitIndex35)
      <=> v764(VarCurr,bitIndex8) )
      & ( v756(VarCurr,bitIndex34)
      <=> v764(VarCurr,bitIndex7) )
      & ( v756(VarCurr,bitIndex33)
      <=> v764(VarCurr,bitIndex6) )
      & ( v756(VarCurr,bitIndex32)
      <=> v764(VarCurr,bitIndex5) )
      & ( v756(VarCurr,bitIndex31)
      <=> v764(VarCurr,bitIndex4) )
      & ( v756(VarCurr,bitIndex30)
      <=> v764(VarCurr,bitIndex3) )
      & ( v756(VarCurr,bitIndex29)
      <=> v764(VarCurr,bitIndex2) )
      & ( v756(VarCurr,bitIndex28)
      <=> v764(VarCurr,bitIndex1) )
      & ( v756(VarCurr,bitIndex27)
      <=> v764(VarCurr,bitIndex0) ) ) )).

fof(addAssignment_172,axiom,(
    ! [VarCurr] :
      ( ( v756(VarCurr,bitIndex66)
      <=> v758(VarCurr,bitIndex3) )
      & ( v756(VarCurr,bitIndex65)
      <=> v758(VarCurr,bitIndex2) )
      & ( v756(VarCurr,bitIndex64)
      <=> v758(VarCurr,bitIndex1) )
      & ( v756(VarCurr,bitIndex63)
      <=> v758(VarCurr,bitIndex0) ) ) )).

fof(addAssignment_171,axiom,(
    ! [VarCurr,B] :
      ( range_10_0(B)
     => ( v776(VarCurr,B)
      <=> v778(VarCurr,B) ) ) )).

fof(addAssignment_170,axiom,(
    ! [VarCurr,B] :
      ( range_10_0(B)
     => ( v778(VarCurr,B)
      <=> v780(VarCurr,B) ) ) )).

fof(range_axiom_9,axiom,(
    ! [B] :
      ( range_10_0(B)
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
        | bitIndex10 = B ) ) )).

fof(addAssignment_169,axiom,(
    ! [VarCurr,B] :
      ( range_15_0(B)
     => ( v770(VarCurr,B)
      <=> v772(VarCurr,B) ) ) )).

fof(addAssignment_168,axiom,(
    ! [VarCurr,B] :
      ( range_15_0(B)
     => ( v772(VarCurr,B)
      <=> v774(VarCurr,B) ) ) )).

fof(range_axiom_8,axiom,(
    ! [B] :
      ( range_15_0(B)
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
        | bitIndex15 = B ) ) )).

fof(addAssignment_167,axiom,(
    ! [VarCurr,B] :
      ( range_35_0(B)
     => ( v764(VarCurr,B)
      <=> v766(VarCurr,B) ) ) )).

fof(addAssignment_166,axiom,(
    ! [VarCurr,B] :
      ( range_35_0(B)
     => ( v766(VarCurr,B)
      <=> v768(VarCurr,B) ) ) )).

fof(range_axiom_7,axiom,(
    ! [B] :
      ( range_35_0(B)
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
        | bitIndex35 = B ) ) )).

fof(addAssignment_165,axiom,(
    ! [VarCurr,B] :
      ( range_3_0(B)
     => ( v758(VarCurr,B)
      <=> v760(VarCurr,B) ) ) )).

fof(addAssignment_164,axiom,(
    ! [VarCurr,B] :
      ( range_3_0(B)
     => ( v760(VarCurr,B)
      <=> v762(VarCurr,B) ) ) )).

fof(addAssignment_163,axiom,(
    ! [VarCurr] :
      ( v754(VarCurr)
    <=> v12(VarCurr) ) )).

fof(addAssignment_162,axiom,(
    ! [VarCurr] :
      ( v751(VarCurr)
    <=> v288(VarCurr) ) )).

fof(addAssignment_161,axiom,(
    ! [VarCurr] :
      ( v664(VarCurr)
    <=> v666(VarCurr) ) )).

fof(addAssignment_160,axiom,(
    ! [VarCurr] :
      ( v666(VarCurr)
    <=> v668(VarCurr) ) )).

fof(addCaseBooleanConditionEqualRanges1_7,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( ~ v724(VarNext)
       => ( v668(VarNext)
        <=> v668(VarCurr) ) ) ) )).

fof(addCaseBooleanConditionEqualRanges0_6,axiom,(
    ! [VarNext] :
      ( v724(VarNext)
     => ( v668(VarNext)
      <=> v734(VarNext) ) ) )).

fof(addAssignment_159,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( v734(VarNext)
      <=> v732(VarCurr) ) ) )).

fof(aaddConditionBooleanCondEqualRangesElseBranch_27,axiom,(
    ! [VarCurr] :
      ( ~ v735(VarCurr)
     => ( v732(VarCurr)
      <=> x697(VarCurr) ) ) )).

fof(addConditionBooleanCondEqualRangesThenBranch_28,axiom,(
    ! [VarCurr] :
      ( v735(VarCurr)
     => ( v732(VarCurr)
      <=> v678(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_94,axiom,(
    ! [VarCurr] :
      ( v735(VarCurr)
    <=> ( v736(VarCurr)
        & v737(VarCurr) ) ) )).

fof(writeUnaryOperator_75,axiom,(
    ! [VarCurr] :
      ( ~ v737(VarCurr)
    <=> v674(VarCurr) ) )).

fof(writeUnaryOperator_74,axiom,(
    ! [VarCurr] :
      ( ~ v736(VarCurr)
    <=> v670(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_93,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( v724(VarNext)
      <=> v725(VarNext) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_92,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( v725(VarNext)
      <=> ( v726(VarNext)
          & v721(VarNext) ) ) ) )).

fof(writeUnaryOperator_73,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( ~ v726(VarNext)
      <=> v728(VarNext) ) ) )).

fof(addAssignment_158,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( v728(VarNext)
      <=> v721(VarCurr) ) ) )).

fof(addAssignment_157,axiom,(
    ! [VarCurr] :
      ( v721(VarCurr)
    <=> v701(VarCurr) ) )).

fof(addAssignment_156,axiom,(
    ! [VarCurr] :
      ( v678(VarCurr)
    <=> v680(VarCurr) ) )).

fof(addAssignment_155,axiom,(
    ! [VarCurr] :
      ( v680(VarCurr)
    <=> v682(VarCurr) ) )).

fof(addCaseBooleanConditionEqualRanges1_6,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( ~ v704(VarNext)
       => ( v682(VarNext)
        <=> v682(VarCurr) ) ) ) )).

fof(addCaseBooleanConditionEqualRanges0_5,axiom,(
    ! [VarNext] :
      ( v704(VarNext)
     => ( v682(VarNext)
      <=> v714(VarNext) ) ) )).

fof(addAssignment_154,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( v714(VarNext)
      <=> v712(VarCurr) ) ) )).

fof(aaddConditionBooleanCondEqualRangesElseBranch_26,axiom,(
    ! [VarCurr] :
      ( ~ v715(VarCurr)
     => ( v712(VarCurr)
      <=> x697(VarCurr) ) ) )).

fof(addConditionBooleanCondEqualRangesThenBranch_27,axiom,(
    ! [VarCurr] :
      ( v715(VarCurr)
     => ( v712(VarCurr)
      <=> v688(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_91,axiom,(
    ! [VarCurr] :
      ( v715(VarCurr)
    <=> ( v716(VarCurr)
        & v717(VarCurr) ) ) )).

fof(writeUnaryOperator_72,axiom,(
    ! [VarCurr] :
      ( ~ v717(VarCurr)
    <=> v686(VarCurr) ) )).

fof(writeUnaryOperator_71,axiom,(
    ! [VarCurr] :
      ( ~ v716(VarCurr)
    <=> v684(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_90,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( v704(VarNext)
      <=> v705(VarNext) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_89,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( v705(VarNext)
      <=> ( v706(VarNext)
          & v699(VarNext) ) ) ) )).

fof(writeUnaryOperator_70,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( ~ v706(VarNext)
      <=> v708(VarNext) ) ) )).

fof(addAssignment_153,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( v708(VarNext)
      <=> v699(VarCurr) ) ) )).

fof(addAssignmentInitValueVector_8,axiom,
    ( v682(constB0)
  <=> $false )).

fof(addAssignment_152,axiom,(
    ! [VarCurr] :
      ( v699(VarCurr)
    <=> v701(VarCurr) ) )).

fof(addAssignment_151,axiom,(
    ! [VarCurr] :
      ( v701(VarCurr)
    <=> v288(VarCurr) ) )).

fof(addAssignment_150,axiom,(
    ! [VarCurr] :
      ( v688(VarCurr)
    <=> v690(VarCurr) ) )).

fof(addAssignment_149,axiom,(
    ! [VarCurr] :
      ( v690(VarCurr)
    <=> v692(VarCurr) ) )).

fof(addAssignment_148,axiom,(
    ! [VarCurr] :
      ( v692(VarCurr)
    <=> v694(VarCurr) ) )).

fof(addAssignment_147,axiom,(
    ! [VarCurr] :
      ( v694(VarCurr)
    <=> v696(VarCurr) ) )).

fof(addAssignment_146,axiom,(
    ! [VarCurr] :
      ( v686(VarCurr)
    <=> v676(VarCurr) ) )).

fof(addAssignment_145,axiom,(
    ! [VarCurr] :
      ( v684(VarCurr)
    <=> v672(VarCurr) ) )).

fof(addAssignment_144,axiom,(
    ! [VarCurr] :
      ( v674(VarCurr)
    <=> v676(VarCurr) ) )).

fof(addAssignment_143,axiom,(
    ! [VarCurr] :
      ( v676(VarCurr)
    <=> $false ) )).

fof(addAssignment_142,axiom,(
    ! [VarCurr] :
      ( v670(VarCurr)
    <=> v672(VarCurr) ) )).

fof(addAssignment_141,axiom,(
    ! [VarCurr] :
      ( v672(VarCurr)
    <=> $false ) )).

fof(addAssignment_140,axiom,(
    ! [VarCurr] :
      ( v320(VarCurr)
    <=> v322(VarCurr) ) )).

fof(addAssignment_139,axiom,(
    ! [VarCurr] :
      ( v322(VarCurr)
    <=> v324(VarCurr) ) )).

fof(addAssignment_138,axiom,(
    ! [VarCurr] :
      ( v324(VarCurr)
    <=> v326(VarCurr) ) )).

fof(addAssignment_137,axiom,(
    ! [VarCurr] :
      ( v326(VarCurr)
    <=> v328(VarCurr) ) )).

fof(addAssignment_136,axiom,(
    ! [VarCurr] :
      ( v328(VarCurr)
    <=> v330(VarCurr) ) )).

fof(addAssignment_135,axiom,(
    ! [VarCurr] :
      ( v330(VarCurr)
    <=> v332(VarCurr) ) )).

fof(aaddConditionBooleanCondEqualRangesElseBranch_25,axiom,(
    ! [VarCurr] :
      ( ~ v657(VarCurr)
     => ( v332(VarCurr)
      <=> $false ) ) )).

fof(addConditionBooleanCondEqualRangesThenBranch_26,axiom,(
    ! [VarCurr] :
      ( v657(VarCurr)
     => ( v332(VarCurr)
      <=> v658(VarCurr) ) ) )).

fof(addParallelCaseBooleanConditionEqualRanges1_6,axiom,(
    ! [VarCurr] :
      ( ~ v510(VarCurr)
     => ( v658(VarCurr)
      <=> v661(VarCurr) ) ) )).

fof(addParallelCaseBooleanConditionEqualRanges0_6,axiom,(
    ! [VarCurr] :
      ( v510(VarCurr)
     => ( v658(VarCurr)
      <=> v659(VarCurr) ) ) )).

fof(aaddConditionBooleanCondEqualRangesElseBranch_24,axiom,(
    ! [VarCurr] :
      ( ~ v513(VarCurr)
     => ( v661(VarCurr)
      <=> v662(VarCurr) ) ) )).

fof(addConditionBooleanCondEqualRangesThenBranch_25,axiom,(
    ! [VarCurr] :
      ( v513(VarCurr)
     => ( v661(VarCurr)
      <=> $true ) ) )).

fof(aaddConditionBooleanCondEqualRangesElseBranch_23,axiom,(
    ! [VarCurr] :
      ( ~ v517(VarCurr)
     => ( v662(VarCurr)
      <=> $false ) ) )).

fof(addConditionBooleanCondEqualRangesThenBranch_24,axiom,(
    ! [VarCurr] :
      ( v517(VarCurr)
     => ( v662(VarCurr)
      <=> $false ) ) )).

fof(aaddConditionBooleanCondEqualRangesElseBranch_22,axiom,(
    ! [VarCurr] :
      ( ~ v509(VarCurr)
     => ( v659(VarCurr)
      <=> v660(VarCurr) ) ) )).

fof(addConditionBooleanCondEqualRangesThenBranch_23,axiom,(
    ! [VarCurr] :
      ( v509(VarCurr)
     => ( v659(VarCurr)
      <=> $false ) ) )).

fof(aaddConditionBooleanCondEqualRangesElseBranch_21,axiom,(
    ! [VarCurr] :
      ( ~ v539(VarCurr)
     => ( v660(VarCurr)
      <=> $false ) ) )).

fof(addConditionBooleanCondEqualRangesThenBranch_22,axiom,(
    ! [VarCurr] :
      ( v539(VarCurr)
     => ( v660(VarCurr)
      <=> $true ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_88,axiom,(
    ! [VarCurr] :
      ( v657(VarCurr)
    <=> ( v510(VarCurr)
        | v514(VarCurr) ) ) )).

fof(addCaseBooleanConditionEqualRanges1_5,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( ~ v645(VarNext)
       => ( v334(VarNext,bitIndex0)
        <=> v334(VarCurr,bitIndex0) ) ) ) )).

fof(addCaseBooleanConditionEqualRanges0_4,axiom,(
    ! [VarNext] :
      ( v645(VarNext)
     => ( v334(VarNext,bitIndex0)
      <=> v653(VarNext) ) ) )).

fof(addAssignment_134,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( v653(VarNext)
      <=> v651(VarCurr) ) ) )).

fof(aaddConditionBooleanCondEqualRangesElseBranch_20,axiom,(
    ! [VarCurr] :
      ( ~ v531(VarCurr)
     => ( v651(VarCurr)
      <=> v342(VarCurr,bitIndex0) ) ) )).

fof(addConditionBooleanCondEqualRangesThenBranch_21,axiom,(
    ! [VarCurr] :
      ( v531(VarCurr)
     => ( v651(VarCurr)
      <=> $true ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_87,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( v645(VarNext)
      <=> v646(VarNext) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_86,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( v646(VarNext)
      <=> ( v648(VarNext)
          & v484(VarNext) ) ) ) )).

fof(writeUnaryOperator_69,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( ~ v648(VarNext)
      <=> v524(VarNext) ) ) )).

fof(aaddConditionBooleanCondEqualRangesElseBranch_19,axiom,(
    ! [VarCurr] :
      ( ~ v637(VarCurr)
     => ( v342(VarCurr,bitIndex0)
      <=> $false ) ) )).

fof(addConditionBooleanCondEqualRangesThenBranch_20,axiom,(
    ! [VarCurr] :
      ( v637(VarCurr)
     => ( v342(VarCurr,bitIndex0)
      <=> v641(VarCurr) ) ) )).

fof(addParallelCaseBooleanConditionEqualRanges1_5,axiom,(
    ! [VarCurr] :
      ( ~ v638(VarCurr)
     => ( v641(VarCurr)
      <=> $true ) ) )).

fof(addParallelCaseBooleanConditionEqualRanges0_5,axiom,(
    ! [VarCurr] :
      ( v638(VarCurr)
     => ( v641(VarCurr)
      <=> v642(VarCurr) ) ) )).

fof(aaddConditionBooleanCondEqualRangesElseBranch_18,axiom,(
    ! [VarCurr] :
      ( ~ v539(VarCurr)
     => ( v642(VarCurr)
      <=> $true ) ) )).

fof(addConditionBooleanCondEqualRangesThenBranch_19,axiom,(
    ! [VarCurr] :
      ( v539(VarCurr)
     => ( v642(VarCurr)
      <=> $true ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_85,axiom,(
    ! [VarCurr] :
      ( v637(VarCurr)
    <=> ( v638(VarCurr)
        | v640(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_84,axiom,(
    ! [VarCurr] :
      ( v640(VarCurr)
    <=> ( v513(VarCurr)
        & v514(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_83,axiom,(
    ! [VarCurr] :
      ( v638(VarCurr)
    <=> ( v639(VarCurr)
        & v510(VarCurr) ) ) )).

fof(writeUnaryOperator_68,axiom,(
    ! [VarCurr] :
      ( ~ v639(VarCurr)
    <=> v509(VarCurr) ) )).

fof(addAssignment_133,axiom,(
    ! [VarCurr] :
      ( v344(VarCurr)
    <=> v346(VarCurr) ) )).

fof(addBitVectorEqualityBitBlasted_28,axiom,(
    ! [VarCurr] :
      ( v346(VarCurr)
    <=> ( ( v348(VarCurr,bitIndex4)
        <=> $false )
        & ( v348(VarCurr,bitIndex3)
        <=> $false )
        & ( v348(VarCurr,bitIndex2)
        <=> $false )
        & ( v348(VarCurr,bitIndex1)
        <=> $false )
        & ( v348(VarCurr,bitIndex0)
        <=> $false ) ) ) )).

fof(addCaseBooleanConditionEqualRanges1_4,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( ~ v621(VarNext)
       => ! [B] :
            ( range_4_0(B)
           => ( v348(VarNext,B)
            <=> v348(VarCurr,B) ) ) ) ) )).

fof(addCaseBooleanConditionEqualRanges0_3,axiom,(
    ! [VarNext] :
      ( v621(VarNext)
     => ! [B] :
          ( range_4_0(B)
         => ( v348(VarNext,B)
          <=> v631(VarNext,B) ) ) ) )).

fof(addAssignment_132,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ! [B] :
          ( range_4_0(B)
         => ( v631(VarNext,B)
          <=> v629(VarCurr,B) ) ) ) )).

fof(aaddConditionBooleanCondEqualRangesElseBranch_17,axiom,(
    ! [VarCurr] :
      ( ~ v632(VarCurr)
     => ! [B] :
          ( range_4_0(B)
         => ( v629(VarCurr,B)
          <=> v352(VarCurr,B) ) ) ) )).

fof(addConditionBooleanCondEqualRangesThenBranch_18,axiom,(
    ! [VarCurr] :
      ( v632(VarCurr)
     => ! [B] :
          ( range_4_0(B)
         => ( v629(VarCurr,B)
          <=> $false ) ) ) )).

fof(writeUnaryOperator_67,axiom,(
    ! [VarCurr] :
      ( ~ v632(VarCurr)
    <=> v350(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_82,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( v621(VarNext)
      <=> v622(VarNext) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_81,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( v622(VarNext)
      <=> ( v623(VarNext)
          & v618(VarNext) ) ) ) )).

fof(writeUnaryOperator_66,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( ~ v623(VarNext)
      <=> v625(VarNext) ) ) )).

fof(addAssignment_131,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( v625(VarNext)
      <=> v618(VarCurr) ) ) )).

fof(addAssignment_130,axiom,(
    ! [VarCurr] :
      ( v618(VarCurr)
    <=> v484(VarCurr) ) )).

fof(addParallelCaseBooleanConditionEqualRanges3_2,axiom,(
    ! [VarCurr] :
      ( ( ~ v543(VarCurr)
        & ~ v545(VarCurr)
        & ~ v586(VarCurr) )
     => ! [B] :
          ( range_4_0(B)
         => ( v352(VarCurr,B)
          <=> v348(VarCurr,B) ) ) ) )).

fof(addParallelCaseBooleanConditionEqualRanges2_2,axiom,(
    ! [VarCurr] :
      ( v586(VarCurr)
     => ! [B] :
          ( range_4_0(B)
         => ( v352(VarCurr,B)
          <=> v588(VarCurr,B) ) ) ) )).

fof(addParallelCaseBooleanConditionEqualRanges1_4,axiom,(
    ! [VarCurr] :
      ( v545(VarCurr)
     => ! [B] :
          ( range_4_0(B)
         => ( v352(VarCurr,B)
          <=> v547(VarCurr,B) ) ) ) )).

fof(addParallelCaseBooleanConditionEqualRanges0_4,axiom,(
    ! [VarCurr] :
      ( v543(VarCurr)
     => ! [B] :
          ( range_4_0(B)
         => ( v352(VarCurr,B)
          <=> v348(VarCurr,B) ) ) ) )).

fof(addBitVectorEqualityBitBlasted_27,axiom,(
    ! [VarCurr] :
      ( v615(VarCurr)
    <=> ( ( v616(VarCurr,bitIndex1)
        <=> $true )
        & ( v616(VarCurr,bitIndex0)
        <=> $true ) ) ) )).

fof(addAssignment_129,axiom,(
    ! [VarCurr] :
      ( v616(VarCurr,bitIndex0)
    <=> v377(VarCurr) ) )).

fof(addAssignment_128,axiom,(
    ! [VarCurr] :
      ( v616(VarCurr,bitIndex1)
    <=> v354(VarCurr) ) )).

fof(aaddConditionBooleanCondEqualRangesElseBranch_16,axiom,(
    ! [VarCurr] :
      ( ~ v589(VarCurr)
     => ! [B] :
          ( range_4_0(B)
         => ( v588(VarCurr,B)
          <=> v590(VarCurr,B) ) ) ) )).

fof(addConditionBooleanCondEqualRangesThenBranch_17,axiom,(
    ! [VarCurr] :
      ( v589(VarCurr)
     => ! [B] :
          ( range_4_0(B)
         => ( v588(VarCurr,B)
          <=> b01111(B) ) ) ) )).

fof(addAssignment_127,axiom,(
    ! [VarCurr] :
      ( v590(VarCurr,bitIndex0)
    <=> v612(VarCurr) ) )).

fof(addAssignment_126,axiom,(
    ! [VarCurr] :
      ( v590(VarCurr,bitIndex1)
    <=> v610(VarCurr) ) )).

fof(addAssignment_125,axiom,(
    ! [VarCurr] :
      ( v590(VarCurr,bitIndex2)
    <=> v605(VarCurr) ) )).

fof(addAssignment_124,axiom,(
    ! [VarCurr] :
      ( v590(VarCurr,bitIndex3)
    <=> v600(VarCurr) ) )).

fof(addAssignment_123,axiom,(
    ! [VarCurr] :
      ( v590(VarCurr,bitIndex4)
    <=> v592(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_80,axiom,(
    ! [VarCurr] :
      ( v610(VarCurr)
    <=> ( v611(VarCurr)
        & v614(VarCurr) ) ) )).

fof(writeBinaryOperatorShiftedRanges_45,axiom,(
    ! [VarCurr] :
      ( v614(VarCurr)
    <=> ( v348(VarCurr,bitIndex0)
        | v348(VarCurr,bitIndex1) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_79,axiom,(
    ! [VarCurr] :
      ( v611(VarCurr)
    <=> ( v612(VarCurr)
        | v613(VarCurr) ) ) )).

fof(writeUnaryOperator_65,axiom,(
    ! [VarCurr] :
      ( ~ v613(VarCurr)
    <=> v348(VarCurr,bitIndex1) ) )).

fof(writeUnaryOperator_64,axiom,(
    ! [VarCurr] :
      ( ~ v612(VarCurr)
    <=> v348(VarCurr,bitIndex0) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_78,axiom,(
    ! [VarCurr] :
      ( v605(VarCurr)
    <=> ( v606(VarCurr)
        & v609(VarCurr) ) ) )).

fof(writeBinaryOperatorShiftedRanges_44,axiom,(
    ! [VarCurr] :
      ( v609(VarCurr)
    <=> ( v597(VarCurr)
        | v348(VarCurr,bitIndex2) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_77,axiom,(
    ! [VarCurr] :
      ( v606(VarCurr)
    <=> ( v607(VarCurr)
        | v608(VarCurr) ) ) )).

fof(writeUnaryOperator_63,axiom,(
    ! [VarCurr] :
      ( ~ v608(VarCurr)
    <=> v348(VarCurr,bitIndex2) ) )).

fof(writeUnaryOperator_62,axiom,(
    ! [VarCurr] :
      ( ~ v607(VarCurr)
    <=> v597(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_76,axiom,(
    ! [VarCurr] :
      ( v600(VarCurr)
    <=> ( v601(VarCurr)
        & v604(VarCurr) ) ) )).

fof(writeBinaryOperatorShiftedRanges_43,axiom,(
    ! [VarCurr] :
      ( v604(VarCurr)
    <=> ( v596(VarCurr)
        | v348(VarCurr,bitIndex3) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_75,axiom,(
    ! [VarCurr] :
      ( v601(VarCurr)
    <=> ( v602(VarCurr)
        | v603(VarCurr) ) ) )).

fof(writeUnaryOperator_61,axiom,(
    ! [VarCurr] :
      ( ~ v603(VarCurr)
    <=> v348(VarCurr,bitIndex3) ) )).

fof(writeUnaryOperator_60,axiom,(
    ! [VarCurr] :
      ( ~ v602(VarCurr)
    <=> v596(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_74,axiom,(
    ! [VarCurr] :
      ( v592(VarCurr)
    <=> ( v593(VarCurr)
        & v599(VarCurr) ) ) )).

fof(writeBinaryOperatorShiftedRanges_42,axiom,(
    ! [VarCurr] :
      ( v599(VarCurr)
    <=> ( v595(VarCurr)
        | v348(VarCurr,bitIndex4) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_73,axiom,(
    ! [VarCurr] :
      ( v593(VarCurr)
    <=> ( v594(VarCurr)
        | v598(VarCurr) ) ) )).

fof(writeUnaryOperator_59,axiom,(
    ! [VarCurr] :
      ( ~ v598(VarCurr)
    <=> v348(VarCurr,bitIndex4) ) )).

fof(writeUnaryOperator_58,axiom,(
    ! [VarCurr] :
      ( ~ v594(VarCurr)
    <=> v595(VarCurr) ) )).

fof(writeBinaryOperatorShiftedRanges_41,axiom,(
    ! [VarCurr] :
      ( v595(VarCurr)
    <=> ( v596(VarCurr)
        & v348(VarCurr,bitIndex3) ) ) )).

fof(writeBinaryOperatorShiftedRanges_40,axiom,(
    ! [VarCurr] :
      ( v596(VarCurr)
    <=> ( v597(VarCurr)
        & v348(VarCurr,bitIndex2) ) ) )).

fof(writeBinaryOperatorShiftedRanges_39,axiom,(
    ! [VarCurr] :
      ( v597(VarCurr)
    <=> ( v348(VarCurr,bitIndex0)
        & v348(VarCurr,bitIndex1) ) ) )).

fof(addBitVectorEqualityBitBlasted_26,axiom,(
    ! [VarCurr] :
      ( v589(VarCurr)
    <=> ( ( v348(VarCurr,bitIndex4)
        <=> $false )
        & ( v348(VarCurr,bitIndex3)
        <=> $true )
        & ( v348(VarCurr,bitIndex2)
        <=> $true )
        & ( v348(VarCurr,bitIndex1)
        <=> $true )
        & ( v348(VarCurr,bitIndex0)
        <=> $true ) ) ) )).

fof(addBitVectorEqualityBitBlasted_25,axiom,(
    ! [VarCurr] :
      ( v586(VarCurr)
    <=> ( ( v587(VarCurr,bitIndex1)
        <=> $true )
        & ( v587(VarCurr,bitIndex0)
        <=> $false ) ) ) )).

fof(addAssignment_122,axiom,(
    ! [VarCurr] :
      ( v587(VarCurr,bitIndex0)
    <=> v377(VarCurr) ) )).

fof(addAssignment_121,axiom,(
    ! [VarCurr] :
      ( v587(VarCurr,bitIndex1)
    <=> v354(VarCurr) ) )).

fof(aaddConditionBooleanCondEqualRangesElseBranch_15,axiom,(
    ! [VarCurr] :
      ( ~ v548(VarCurr)
     => ! [B] :
          ( range_31_0(B)
         => ( v547(VarCurr,B)
          <=> v549(VarCurr,B) ) ) ) )).

fof(addConditionBooleanCondEqualRangesThenBranch_16,axiom,(
    ! [VarCurr] :
      ( v548(VarCurr)
     => ! [B] :
          ( range_31_0(B)
         => ( v547(VarCurr,B)
          <=> $false ) ) ) )).

fof(addSignExtensionConstraint_78,axiom,(
    ! [VarCurr] :
      ( v549(VarCurr,bitIndex6)
    <=> v550(VarCurr,bitIndex5) ) )).

fof(addSignExtensionConstraint_77,axiom,(
    ! [VarCurr] :
      ( v549(VarCurr,bitIndex7)
    <=> v550(VarCurr,bitIndex5) ) )).

fof(addSignExtensionConstraint_76,axiom,(
    ! [VarCurr] :
      ( v549(VarCurr,bitIndex8)
    <=> v550(VarCurr,bitIndex5) ) )).

fof(addSignExtensionConstraint_75,axiom,(
    ! [VarCurr] :
      ( v549(VarCurr,bitIndex9)
    <=> v550(VarCurr,bitIndex5) ) )).

fof(addSignExtensionConstraint_74,axiom,(
    ! [VarCurr] :
      ( v549(VarCurr,bitIndex10)
    <=> v550(VarCurr,bitIndex5) ) )).

fof(addSignExtensionConstraint_73,axiom,(
    ! [VarCurr] :
      ( v549(VarCurr,bitIndex11)
    <=> v550(VarCurr,bitIndex5) ) )).

fof(addSignExtensionConstraint_72,axiom,(
    ! [VarCurr] :
      ( v549(VarCurr,bitIndex12)
    <=> v550(VarCurr,bitIndex5) ) )).

fof(addSignExtensionConstraint_71,axiom,(
    ! [VarCurr] :
      ( v549(VarCurr,bitIndex13)
    <=> v550(VarCurr,bitIndex5) ) )).

fof(addSignExtensionConstraint_70,axiom,(
    ! [VarCurr] :
      ( v549(VarCurr,bitIndex14)
    <=> v550(VarCurr,bitIndex5) ) )).

fof(addSignExtensionConstraint_69,axiom,(
    ! [VarCurr] :
      ( v549(VarCurr,bitIndex15)
    <=> v550(VarCurr,bitIndex5) ) )).

fof(addSignExtensionConstraint_68,axiom,(
    ! [VarCurr] :
      ( v549(VarCurr,bitIndex16)
    <=> v550(VarCurr,bitIndex5) ) )).

fof(addSignExtensionConstraint_67,axiom,(
    ! [VarCurr] :
      ( v549(VarCurr,bitIndex17)
    <=> v550(VarCurr,bitIndex5) ) )).

fof(addSignExtensionConstraint_66,axiom,(
    ! [VarCurr] :
      ( v549(VarCurr,bitIndex18)
    <=> v550(VarCurr,bitIndex5) ) )).

fof(addSignExtensionConstraint_65,axiom,(
    ! [VarCurr] :
      ( v549(VarCurr,bitIndex19)
    <=> v550(VarCurr,bitIndex5) ) )).

fof(addSignExtensionConstraint_64,axiom,(
    ! [VarCurr] :
      ( v549(VarCurr,bitIndex20)
    <=> v550(VarCurr,bitIndex5) ) )).

fof(addSignExtensionConstraint_63,axiom,(
    ! [VarCurr] :
      ( v549(VarCurr,bitIndex21)
    <=> v550(VarCurr,bitIndex5) ) )).

fof(addSignExtensionConstraint_62,axiom,(
    ! [VarCurr] :
      ( v549(VarCurr,bitIndex22)
    <=> v550(VarCurr,bitIndex5) ) )).

fof(addSignExtensionConstraint_61,axiom,(
    ! [VarCurr] :
      ( v549(VarCurr,bitIndex23)
    <=> v550(VarCurr,bitIndex5) ) )).

fof(addSignExtensionConstraint_60,axiom,(
    ! [VarCurr] :
      ( v549(VarCurr,bitIndex24)
    <=> v550(VarCurr,bitIndex5) ) )).

fof(addSignExtensionConstraint_59,axiom,(
    ! [VarCurr] :
      ( v549(VarCurr,bitIndex25)
    <=> v550(VarCurr,bitIndex5) ) )).

fof(addSignExtensionConstraint_58,axiom,(
    ! [VarCurr] :
      ( v549(VarCurr,bitIndex26)
    <=> v550(VarCurr,bitIndex5) ) )).

fof(addSignExtensionConstraint_57,axiom,(
    ! [VarCurr] :
      ( v549(VarCurr,bitIndex27)
    <=> v550(VarCurr,bitIndex5) ) )).

fof(addSignExtensionConstraint_56,axiom,(
    ! [VarCurr] :
      ( v549(VarCurr,bitIndex28)
    <=> v550(VarCurr,bitIndex5) ) )).

fof(addSignExtensionConstraint_55,axiom,(
    ! [VarCurr] :
      ( v549(VarCurr,bitIndex29)
    <=> v550(VarCurr,bitIndex5) ) )).

fof(addSignExtensionConstraint_54,axiom,(
    ! [VarCurr] :
      ( v549(VarCurr,bitIndex30)
    <=> v550(VarCurr,bitIndex5) ) )).

fof(addSignExtensionConstraint_53,axiom,(
    ! [VarCurr] :
      ( v549(VarCurr,bitIndex31)
    <=> v550(VarCurr,bitIndex5) ) )).

fof(addAssignment_120,axiom,(
    ! [VarCurr,B] :
      ( range_5_0(B)
     => ( v549(VarCurr,B)
      <=> v550(VarCurr,B) ) ) )).

fof(addAssignment_119,axiom,(
    ! [VarCurr] :
      ( v550(VarCurr,bitIndex0)
    <=> v584(VarCurr) ) )).

fof(addAssignment_118,axiom,(
    ! [VarCurr] :
      ( v550(VarCurr,bitIndex1)
    <=> v582(VarCurr) ) )).

fof(addAssignment_117,axiom,(
    ! [VarCurr] :
      ( v550(VarCurr,bitIndex2)
    <=> v578(VarCurr) ) )).

fof(addAssignment_116,axiom,(
    ! [VarCurr] :
      ( v550(VarCurr,bitIndex3)
    <=> v574(VarCurr) ) )).

fof(addAssignment_115,axiom,(
    ! [VarCurr] :
      ( v550(VarCurr,bitIndex4)
    <=> v570(VarCurr) ) )).

fof(addAssignment_114,axiom,(
    ! [VarCurr] :
      ( v550(VarCurr,bitIndex5)
    <=> v552(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_72,axiom,(
    ! [VarCurr] :
      ( v582(VarCurr)
    <=> ( v583(VarCurr)
        & v585(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_71,axiom,(
    ! [VarCurr] :
      ( v585(VarCurr)
    <=> ( v556(VarCurr,bitIndex0)
        | v564(VarCurr) ) ) )).

fof(writeBinaryOperatorShiftedRanges_38,axiom,(
    ! [VarCurr] :
      ( v583(VarCurr)
    <=> ( v584(VarCurr)
        | v556(VarCurr,bitIndex1) ) ) )).

fof(writeUnaryOperator_57,axiom,(
    ! [VarCurr] :
      ( ~ v584(VarCurr)
    <=> v556(VarCurr,bitIndex0) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_70,axiom,(
    ! [VarCurr] :
      ( v578(VarCurr)
    <=> ( v579(VarCurr)
        & v581(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_69,axiom,(
    ! [VarCurr] :
      ( v581(VarCurr)
    <=> ( v562(VarCurr)
        | v565(VarCurr) ) ) )).

fof(writeBinaryOperatorShiftedRanges_37,axiom,(
    ! [VarCurr] :
      ( v579(VarCurr)
    <=> ( v580(VarCurr)
        | v556(VarCurr,bitIndex2) ) ) )).

fof(writeUnaryOperator_56,axiom,(
    ! [VarCurr] :
      ( ~ v580(VarCurr)
    <=> v562(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_68,axiom,(
    ! [VarCurr] :
      ( v574(VarCurr)
    <=> ( v575(VarCurr)
        & v577(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_67,axiom,(
    ! [VarCurr] :
      ( v577(VarCurr)
    <=> ( v560(VarCurr)
        | v566(VarCurr) ) ) )).

fof(writeBinaryOperatorShiftedRanges_36,axiom,(
    ! [VarCurr] :
      ( v575(VarCurr)
    <=> ( v576(VarCurr)
        | v556(VarCurr,bitIndex3) ) ) )).

fof(writeUnaryOperator_55,axiom,(
    ! [VarCurr] :
      ( ~ v576(VarCurr)
    <=> v560(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_66,axiom,(
    ! [VarCurr] :
      ( v570(VarCurr)
    <=> ( v571(VarCurr)
        & v573(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_65,axiom,(
    ! [VarCurr] :
      ( v573(VarCurr)
    <=> ( v558(VarCurr)
        | v567(VarCurr) ) ) )).

fof(writeBinaryOperatorShiftedRanges_35,axiom,(
    ! [VarCurr] :
      ( v571(VarCurr)
    <=> ( v572(VarCurr)
        | v556(VarCurr,bitIndex4) ) ) )).

fof(writeUnaryOperator_54,axiom,(
    ! [VarCurr] :
      ( ~ v572(VarCurr)
    <=> v558(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_64,axiom,(
    ! [VarCurr] :
      ( v552(VarCurr)
    <=> ( v553(VarCurr)
        & v568(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_63,axiom,(
    ! [VarCurr] :
      ( v568(VarCurr)
    <=> ( v555(VarCurr)
        | v569(VarCurr) ) ) )).

fof(writeUnaryOperator_53,axiom,(
    ! [VarCurr] :
      ( ~ v569(VarCurr)
    <=> v556(VarCurr,bitIndex5) ) )).

fof(writeBinaryOperatorShiftedRanges_34,axiom,(
    ! [VarCurr] :
      ( v553(VarCurr)
    <=> ( v554(VarCurr)
        | v556(VarCurr,bitIndex5) ) ) )).

fof(writeUnaryOperator_52,axiom,(
    ! [VarCurr] :
      ( ~ v554(VarCurr)
    <=> v555(VarCurr) ) )).

fof(writeBinaryOperatorShiftedRanges_33,axiom,(
    ! [VarCurr] :
      ( v555(VarCurr)
    <=> ( v556(VarCurr,bitIndex4)
        | v557(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_62,axiom,(
    ! [VarCurr] :
      ( v557(VarCurr)
    <=> ( v558(VarCurr)
        & v567(VarCurr) ) ) )).

fof(writeUnaryOperator_51,axiom,(
    ! [VarCurr] :
      ( ~ v567(VarCurr)
    <=> v556(VarCurr,bitIndex4) ) )).

fof(writeBinaryOperatorShiftedRanges_32,axiom,(
    ! [VarCurr] :
      ( v558(VarCurr)
    <=> ( v556(VarCurr,bitIndex3)
        | v559(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_61,axiom,(
    ! [VarCurr] :
      ( v559(VarCurr)
    <=> ( v560(VarCurr)
        & v566(VarCurr) ) ) )).

fof(writeUnaryOperator_50,axiom,(
    ! [VarCurr] :
      ( ~ v566(VarCurr)
    <=> v556(VarCurr,bitIndex3) ) )).

fof(writeBinaryOperatorShiftedRanges_31,axiom,(
    ! [VarCurr] :
      ( v560(VarCurr)
    <=> ( v556(VarCurr,bitIndex2)
        | v561(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_60,axiom,(
    ! [VarCurr] :
      ( v561(VarCurr)
    <=> ( v562(VarCurr)
        & v565(VarCurr) ) ) )).

fof(writeUnaryOperator_49,axiom,(
    ! [VarCurr] :
      ( ~ v565(VarCurr)
    <=> v556(VarCurr,bitIndex2) ) )).

fof(writeBinaryOperatorShiftedRanges_30,axiom,(
    ! [VarCurr] :
      ( v562(VarCurr)
    <=> ( v556(VarCurr,bitIndex1)
        | v563(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_59,axiom,(
    ! [VarCurr] :
      ( v563(VarCurr)
    <=> ( v556(VarCurr,bitIndex0)
        & v564(VarCurr) ) ) )).

fof(writeUnaryOperator_48,axiom,(
    ! [VarCurr] :
      ( ~ v564(VarCurr)
    <=> v556(VarCurr,bitIndex1) ) )).

fof(addZeroExtensionConstraint_2,axiom,(
    ! [VarCurr] : ~ v556(VarCurr,bitIndex5) )).

fof(addAssignment_113,axiom,(
    ! [VarCurr,B] :
      ( range_4_0(B)
     => ( v556(VarCurr,B)
      <=> v348(VarCurr,B) ) ) )).

fof(addBitVectorEqualityBitBlasted_24,axiom,(
    ! [VarCurr] :
      ( v548(VarCurr)
    <=> ( ( v348(VarCurr,bitIndex4)
        <=> $false )
        & ( v348(VarCurr,bitIndex3)
        <=> $false )
        & ( v348(VarCurr,bitIndex2)
        <=> $false )
        & ( v348(VarCurr,bitIndex1)
        <=> $false )
        & ( v348(VarCurr,bitIndex0)
        <=> $false ) ) ) )).

fof(addBitVectorEqualityBitBlasted_23,axiom,(
    ! [VarCurr] :
      ( v545(VarCurr)
    <=> ( ( v546(VarCurr,bitIndex1)
        <=> $false )
        & ( v546(VarCurr,bitIndex0)
        <=> $true ) ) ) )).

fof(addAssignment_112,axiom,(
    ! [VarCurr] :
      ( v546(VarCurr,bitIndex0)
    <=> v377(VarCurr) ) )).

fof(addAssignment_111,axiom,(
    ! [VarCurr] :
      ( v546(VarCurr,bitIndex1)
    <=> v354(VarCurr) ) )).

fof(addAssignmentInitValueVector_7,axiom,(
    ! [B] :
      ( range_4_0(B)
     => ( v348(constB0,B)
      <=> $false ) ) )).

fof(addBitVectorEqualityBitBlasted_22,axiom,(
    ! [VarCurr] :
      ( v543(VarCurr)
    <=> ( ( v544(VarCurr,bitIndex1)
        <=> $false )
        & ( v544(VarCurr,bitIndex0)
        <=> $false ) ) ) )).

fof(addAssignment_110,axiom,(
    ! [VarCurr] :
      ( v544(VarCurr,bitIndex0)
    <=> v377(VarCurr) ) )).

fof(addAssignment_109,axiom,(
    ! [VarCurr] :
      ( v544(VarCurr,bitIndex1)
    <=> v354(VarCurr) ) )).

fof(addAssignment_108,axiom,(
    ! [VarCurr] :
      ( v377(VarCurr)
    <=> v379(VarCurr) ) )).

fof(aaddConditionBooleanCondEqualRangesElseBranch_14,axiom,(
    ! [VarCurr] :
      ( ~ v535(VarCurr)
     => ( v379(VarCurr)
      <=> $false ) ) )).

fof(addConditionBooleanCondEqualRangesThenBranch_15,axiom,(
    ! [VarCurr] :
      ( v535(VarCurr)
     => ( v379(VarCurr)
      <=> v536(VarCurr) ) ) )).

fof(addParallelCaseBooleanConditionEqualRanges1_3,axiom,(
    ! [VarCurr] :
      ( ~ v510(VarCurr)
     => ( v536(VarCurr)
      <=> v540(VarCurr) ) ) )).

fof(addParallelCaseBooleanConditionEqualRanges0_3,axiom,(
    ! [VarCurr] :
      ( v510(VarCurr)
     => ( v536(VarCurr)
      <=> v537(VarCurr) ) ) )).

fof(aaddConditionBooleanCondEqualRangesElseBranch_13,axiom,(
    ! [VarCurr] :
      ( ~ v513(VarCurr)
     => ( v540(VarCurr)
      <=> v541(VarCurr) ) ) )).

fof(addConditionBooleanCondEqualRangesThenBranch_14,axiom,(
    ! [VarCurr] :
      ( v513(VarCurr)
     => ( v540(VarCurr)
      <=> $false ) ) )).

fof(aaddConditionBooleanCondEqualRangesElseBranch_12,axiom,(
    ! [VarCurr] :
      ( ~ v517(VarCurr)
     => ( v541(VarCurr)
      <=> $false ) ) )).

fof(addConditionBooleanCondEqualRangesThenBranch_13,axiom,(
    ! [VarCurr] :
      ( v517(VarCurr)
     => ( v541(VarCurr)
      <=> $true ) ) )).

fof(aaddConditionBooleanCondEqualRangesElseBranch_11,axiom,(
    ! [VarCurr] :
      ( ~ v509(VarCurr)
     => ( v537(VarCurr)
      <=> v538(VarCurr) ) ) )).

fof(addConditionBooleanCondEqualRangesThenBranch_12,axiom,(
    ! [VarCurr] :
      ( v509(VarCurr)
     => ( v537(VarCurr)
      <=> $true ) ) )).

fof(aaddConditionBooleanCondEqualRangesElseBranch_10,axiom,(
    ! [VarCurr] :
      ( ~ v539(VarCurr)
     => ( v538(VarCurr)
      <=> $false ) ) )).

fof(addConditionBooleanCondEqualRangesThenBranch_11,axiom,(
    ! [VarCurr] :
      ( v539(VarCurr)
     => ( v538(VarCurr)
      <=> $false ) ) )).

fof(writeUnaryOperator_47,axiom,(
    ! [VarCurr] :
      ( ~ v539(VarCurr)
    <=> v381(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_58,axiom,(
    ! [VarCurr] :
      ( v535(VarCurr)
    <=> ( v510(VarCurr)
        | v514(VarCurr) ) ) )).

fof(addCaseBooleanConditionEqualRanges1_3,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( ~ v520(VarNext)
       => ( v334(VarNext,bitIndex1)
        <=> v334(VarCurr,bitIndex1) ) ) ) )).

fof(addCaseBooleanConditionShiftedRanges0,axiom,(
    ! [VarNext] :
      ( v520(VarNext)
     => ( v334(VarNext,bitIndex1)
      <=> v530(VarNext) ) ) )).

fof(addAssignment_107,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( v530(VarNext)
      <=> v528(VarCurr) ) ) )).

fof(addConditionBooleanCondShiftedRangesElseBranch_1,axiom,(
    ! [VarCurr] :
      ( ~ v531(VarCurr)
     => ( v528(VarCurr)
      <=> v342(VarCurr,bitIndex1) ) ) )).

fof(addConditionBooleanCondEqualRangesThenBranch_10,axiom,(
    ! [VarCurr] :
      ( v531(VarCurr)
     => ( v528(VarCurr)
      <=> $false ) ) )).

fof(writeUnaryOperator_46,axiom,(
    ! [VarCurr] :
      ( ~ v531(VarCurr)
    <=> v336(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_57,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( v520(VarNext)
      <=> v521(VarNext) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_56,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( v521(VarNext)
      <=> ( v522(VarNext)
          & v484(VarNext) ) ) ) )).

fof(writeUnaryOperator_45,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( ~ v522(VarNext)
      <=> v524(VarNext) ) ) )).

fof(addAssignment_106,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( v524(VarNext)
      <=> v484(VarCurr) ) ) )).

fof(addConditionBooleanCondShiftedRangesElseBranch,axiom,(
    ! [VarCurr] :
      ( ~ v507(VarCurr)
     => ( v342(VarCurr,bitIndex1)
      <=> $false ) ) )).

fof(addConditionBooleanCondShiftedRangesThenBranch,axiom,(
    ! [VarCurr] :
      ( v507(VarCurr)
     => ( v342(VarCurr,bitIndex1)
      <=> v515(VarCurr) ) ) )).

fof(addParallelCaseBooleanConditionEqualRanges1_2,axiom,(
    ! [VarCurr] :
      ( ~ v508(VarCurr)
     => ( v515(VarCurr)
      <=> v516(VarCurr) ) ) )).

fof(addParallelCaseBooleanConditionEqualRanges0_2,axiom,(
    ! [VarCurr] :
      ( v508(VarCurr)
     => ( v515(VarCurr)
      <=> $true ) ) )).

fof(aaddConditionBooleanCondEqualRangesElseBranch_9,axiom,(
    ! [VarCurr] :
      ( ~ v517(VarCurr)
     => ( v516(VarCurr)
      <=> $true ) ) )).

fof(addConditionBooleanCondEqualRangesThenBranch_9,axiom,(
    ! [VarCurr] :
      ( v517(VarCurr)
     => ( v516(VarCurr)
      <=> $true ) ) )).

fof(writeUnaryOperator_44,axiom,(
    ! [VarCurr] :
      ( ~ v517(VarCurr)
    <=> v344(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_55,axiom,(
    ! [VarCurr] :
      ( v507(VarCurr)
    <=> ( v508(VarCurr)
        | v511(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_54,axiom,(
    ! [VarCurr] :
      ( v511(VarCurr)
    <=> ( v512(VarCurr)
        & v514(VarCurr) ) ) )).

fof(addBitVectorEqualityBitBlasted_21,axiom,(
    ! [VarCurr] :
      ( v514(VarCurr)
    <=> ( $true
      <=> v334(VarCurr,bitIndex1) ) ) )).

fof(writeUnaryOperator_43,axiom,(
    ! [VarCurr] :
      ( ~ v512(VarCurr)
    <=> v513(VarCurr) ) )).

fof(writeUnaryOperator_42,axiom,(
    ! [VarCurr] :
      ( ~ v513(VarCurr)
    <=> v381(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_53,axiom,(
    ! [VarCurr] :
      ( v508(VarCurr)
    <=> ( v509(VarCurr)
        & v510(VarCurr) ) ) )).

fof(addBitVectorEqualityBitBlasted_20,axiom,(
    ! [VarCurr] :
      ( v510(VarCurr)
    <=> ( $true
      <=> v334(VarCurr,bitIndex0) ) ) )).

fof(addAssignmentInitValueVector_6,axiom,
    ( v334(constB0,bitIndex1)
  <=> $false )).

fof(addAssignmentInitValueVector_5,axiom,
    ( v334(constB0,bitIndex0)
  <=> $true )).

fof(writeUnaryOperator_41,axiom,(
    ! [VarCurr] :
      ( ~ v509(VarCurr)
    <=> v344(VarCurr) ) )).

fof(addAssignment_105,axiom,(
    ! [VarCurr] :
      ( v381(VarCurr)
    <=> v383(VarCurr) ) )).

fof(addBitVectorEqualityBitBlasted_19,axiom,(
    ! [VarCurr] :
      ( v383(VarCurr)
    <=> ( ( v385(VarCurr,bitIndex4)
        <=> $false )
        & ( v385(VarCurr,bitIndex3)
        <=> $false )
        & ( v385(VarCurr,bitIndex2)
        <=> $false )
        & ( v385(VarCurr,bitIndex1)
        <=> $false )
        & ( v385(VarCurr,bitIndex0)
        <=> $false ) ) ) )).

fof(addCaseBooleanConditionEqualRanges1_2,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( ~ v491(VarNext)
       => ! [B] :
            ( range_4_0(B)
           => ( v385(VarNext,B)
            <=> v385(VarCurr,B) ) ) ) ) )).

fof(addCaseBooleanConditionEqualRanges0_2,axiom,(
    ! [VarNext] :
      ( v491(VarNext)
     => ! [B] :
          ( range_4_0(B)
         => ( v385(VarNext,B)
          <=> v501(VarNext,B) ) ) ) )).

fof(addAssignment_104,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ! [B] :
          ( range_4_0(B)
         => ( v501(VarNext,B)
          <=> v499(VarCurr,B) ) ) ) )).

fof(aaddConditionBooleanCondEqualRangesElseBranch_8,axiom,(
    ! [VarCurr] :
      ( ~ v502(VarCurr)
     => ! [B] :
          ( range_4_0(B)
         => ( v499(VarCurr,B)
          <=> v389(VarCurr,B) ) ) ) )).

fof(addConditionBooleanCondEqualRangesThenBranch_8,axiom,(
    ! [VarCurr] :
      ( v502(VarCurr)
     => ! [B] :
          ( range_4_0(B)
         => ( v499(VarCurr,B)
          <=> $false ) ) ) )).

fof(writeUnaryOperator_40,axiom,(
    ! [VarCurr] :
      ( ~ v502(VarCurr)
    <=> v387(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_52,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( v491(VarNext)
      <=> v492(VarNext) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_51,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( v492(VarNext)
      <=> ( v493(VarNext)
          & v482(VarNext) ) ) ) )).

fof(writeUnaryOperator_39,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( ~ v493(VarNext)
      <=> v495(VarNext) ) ) )).

fof(addAssignment_103,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( v495(VarNext)
      <=> v482(VarCurr) ) ) )).

fof(addAssignment_102,axiom,(
    ! [VarCurr] :
      ( v482(VarCurr)
    <=> v484(VarCurr) ) )).

fof(addAssignment_101,axiom,(
    ! [VarCurr] :
      ( v484(VarCurr)
    <=> v486(VarCurr) ) )).

fof(addAssignment_100,axiom,(
    ! [VarCurr] :
      ( v486(VarCurr)
    <=> v488(VarCurr) ) )).

fof(addAssignment_99,axiom,(
    ! [VarCurr] :
      ( v488(VarCurr)
    <=> v1(VarCurr) ) )).

fof(addParallelCaseBooleanConditionEqualRanges3_1,axiom,(
    ! [VarCurr] :
      ( ( ~ v407(VarCurr)
        & ~ v409(VarCurr)
        & ~ v450(VarCurr) )
     => ! [B] :
          ( range_4_0(B)
         => ( v389(VarCurr,B)
          <=> v385(VarCurr,B) ) ) ) )).

fof(addParallelCaseBooleanConditionEqualRanges2_1,axiom,(
    ! [VarCurr] :
      ( v450(VarCurr)
     => ! [B] :
          ( range_4_0(B)
         => ( v389(VarCurr,B)
          <=> v452(VarCurr,B) ) ) ) )).

fof(addParallelCaseBooleanConditionEqualRanges1_1,axiom,(
    ! [VarCurr] :
      ( v409(VarCurr)
     => ! [B] :
          ( range_4_0(B)
         => ( v389(VarCurr,B)
          <=> v411(VarCurr,B) ) ) ) )).

fof(addParallelCaseBooleanConditionEqualRanges0_1,axiom,(
    ! [VarCurr] :
      ( v407(VarCurr)
     => ! [B] :
          ( range_4_0(B)
         => ( v389(VarCurr,B)
          <=> v385(VarCurr,B) ) ) ) )).

fof(addBitVectorEqualityBitBlasted_18,axiom,(
    ! [VarCurr] :
      ( v479(VarCurr)
    <=> ( ( v480(VarCurr,bitIndex1)
        <=> $true )
        & ( v480(VarCurr,bitIndex0)
        <=> $true ) ) ) )).

fof(addAssignment_98,axiom,(
    ! [VarCurr] :
      ( v480(VarCurr,bitIndex0)
    <=> v403(VarCurr) ) )).

fof(addAssignment_97,axiom,(
    ! [VarCurr] :
      ( v480(VarCurr,bitIndex1)
    <=> v391(VarCurr) ) )).

fof(aaddConditionBooleanCondEqualRangesElseBranch_7,axiom,(
    ! [VarCurr] :
      ( ~ v453(VarCurr)
     => ! [B] :
          ( range_4_0(B)
         => ( v452(VarCurr,B)
          <=> v454(VarCurr,B) ) ) ) )).

fof(addConditionBooleanCondEqualRangesThenBranch_7,axiom,(
    ! [VarCurr] :
      ( v453(VarCurr)
     => ! [B] :
          ( range_4_0(B)
         => ( v452(VarCurr,B)
          <=> b01111(B) ) ) ) )).

fof(addAssignment_96,axiom,(
    ! [VarCurr] :
      ( v454(VarCurr,bitIndex0)
    <=> v476(VarCurr) ) )).

fof(addAssignment_95,axiom,(
    ! [VarCurr] :
      ( v454(VarCurr,bitIndex1)
    <=> v474(VarCurr) ) )).

fof(addAssignment_94,axiom,(
    ! [VarCurr] :
      ( v454(VarCurr,bitIndex2)
    <=> v469(VarCurr) ) )).

fof(addAssignment_93,axiom,(
    ! [VarCurr] :
      ( v454(VarCurr,bitIndex3)
    <=> v464(VarCurr) ) )).

fof(addAssignment_92,axiom,(
    ! [VarCurr] :
      ( v454(VarCurr,bitIndex4)
    <=> v456(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_50,axiom,(
    ! [VarCurr] :
      ( v474(VarCurr)
    <=> ( v475(VarCurr)
        & v478(VarCurr) ) ) )).

fof(writeBinaryOperatorShiftedRanges_29,axiom,(
    ! [VarCurr] :
      ( v478(VarCurr)
    <=> ( v385(VarCurr,bitIndex0)
        | v385(VarCurr,bitIndex1) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_49,axiom,(
    ! [VarCurr] :
      ( v475(VarCurr)
    <=> ( v476(VarCurr)
        | v477(VarCurr) ) ) )).

fof(writeUnaryOperator_38,axiom,(
    ! [VarCurr] :
      ( ~ v477(VarCurr)
    <=> v385(VarCurr,bitIndex1) ) )).

fof(writeUnaryOperator_37,axiom,(
    ! [VarCurr] :
      ( ~ v476(VarCurr)
    <=> v385(VarCurr,bitIndex0) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_48,axiom,(
    ! [VarCurr] :
      ( v469(VarCurr)
    <=> ( v470(VarCurr)
        & v473(VarCurr) ) ) )).

fof(writeBinaryOperatorShiftedRanges_28,axiom,(
    ! [VarCurr] :
      ( v473(VarCurr)
    <=> ( v461(VarCurr)
        | v385(VarCurr,bitIndex2) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_47,axiom,(
    ! [VarCurr] :
      ( v470(VarCurr)
    <=> ( v471(VarCurr)
        | v472(VarCurr) ) ) )).

fof(writeUnaryOperator_36,axiom,(
    ! [VarCurr] :
      ( ~ v472(VarCurr)
    <=> v385(VarCurr,bitIndex2) ) )).

fof(writeUnaryOperator_35,axiom,(
    ! [VarCurr] :
      ( ~ v471(VarCurr)
    <=> v461(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_46,axiom,(
    ! [VarCurr] :
      ( v464(VarCurr)
    <=> ( v465(VarCurr)
        & v468(VarCurr) ) ) )).

fof(writeBinaryOperatorShiftedRanges_27,axiom,(
    ! [VarCurr] :
      ( v468(VarCurr)
    <=> ( v460(VarCurr)
        | v385(VarCurr,bitIndex3) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_45,axiom,(
    ! [VarCurr] :
      ( v465(VarCurr)
    <=> ( v466(VarCurr)
        | v467(VarCurr) ) ) )).

fof(writeUnaryOperator_34,axiom,(
    ! [VarCurr] :
      ( ~ v467(VarCurr)
    <=> v385(VarCurr,bitIndex3) ) )).

fof(writeUnaryOperator_33,axiom,(
    ! [VarCurr] :
      ( ~ v466(VarCurr)
    <=> v460(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_44,axiom,(
    ! [VarCurr] :
      ( v456(VarCurr)
    <=> ( v457(VarCurr)
        & v463(VarCurr) ) ) )).

fof(writeBinaryOperatorShiftedRanges_26,axiom,(
    ! [VarCurr] :
      ( v463(VarCurr)
    <=> ( v459(VarCurr)
        | v385(VarCurr,bitIndex4) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_43,axiom,(
    ! [VarCurr] :
      ( v457(VarCurr)
    <=> ( v458(VarCurr)
        | v462(VarCurr) ) ) )).

fof(writeUnaryOperator_32,axiom,(
    ! [VarCurr] :
      ( ~ v462(VarCurr)
    <=> v385(VarCurr,bitIndex4) ) )).

fof(writeUnaryOperator_31,axiom,(
    ! [VarCurr] :
      ( ~ v458(VarCurr)
    <=> v459(VarCurr) ) )).

fof(writeBinaryOperatorShiftedRanges_25,axiom,(
    ! [VarCurr] :
      ( v459(VarCurr)
    <=> ( v460(VarCurr)
        & v385(VarCurr,bitIndex3) ) ) )).

fof(writeBinaryOperatorShiftedRanges_24,axiom,(
    ! [VarCurr] :
      ( v460(VarCurr)
    <=> ( v461(VarCurr)
        & v385(VarCurr,bitIndex2) ) ) )).

fof(writeBinaryOperatorShiftedRanges_23,axiom,(
    ! [VarCurr] :
      ( v461(VarCurr)
    <=> ( v385(VarCurr,bitIndex0)
        & v385(VarCurr,bitIndex1) ) ) )).

fof(addBitVectorEqualityBitBlasted_17,axiom,(
    ! [VarCurr] :
      ( v453(VarCurr)
    <=> ( ( v385(VarCurr,bitIndex4)
        <=> $false )
        & ( v385(VarCurr,bitIndex3)
        <=> $true )
        & ( v385(VarCurr,bitIndex2)
        <=> $true )
        & ( v385(VarCurr,bitIndex1)
        <=> $true )
        & ( v385(VarCurr,bitIndex0)
        <=> $true ) ) ) )).

fof(bitBlastConstant_95,axiom,(
    ~ b01111(bitIndex4) )).

fof(bitBlastConstant_94,axiom,(
    b01111(bitIndex3) )).

fof(bitBlastConstant_93,axiom,(
    b01111(bitIndex2) )).

fof(bitBlastConstant_92,axiom,(
    b01111(bitIndex1) )).

fof(bitBlastConstant_91,axiom,(
    b01111(bitIndex0) )).

fof(addBitVectorEqualityBitBlasted_16,axiom,(
    ! [VarCurr] :
      ( v450(VarCurr)
    <=> ( ( v451(VarCurr,bitIndex1)
        <=> $true )
        & ( v451(VarCurr,bitIndex0)
        <=> $false ) ) ) )).

fof(addAssignment_91,axiom,(
    ! [VarCurr] :
      ( v451(VarCurr,bitIndex0)
    <=> v403(VarCurr) ) )).

fof(addAssignment_90,axiom,(
    ! [VarCurr] :
      ( v451(VarCurr,bitIndex1)
    <=> v391(VarCurr) ) )).

fof(aaddConditionBooleanCondEqualRangesElseBranch_6,axiom,(
    ! [VarCurr] :
      ( ~ v412(VarCurr)
     => ! [B] :
          ( range_31_0(B)
         => ( v411(VarCurr,B)
          <=> v413(VarCurr,B) ) ) ) )).

fof(addConditionBooleanCondEqualRangesThenBranch_6,axiom,(
    ! [VarCurr] :
      ( v412(VarCurr)
     => ! [B] :
          ( range_31_0(B)
         => ( v411(VarCurr,B)
          <=> $false ) ) ) )).

fof(addSignExtensionConstraint_52,axiom,(
    ! [VarCurr] :
      ( v413(VarCurr,bitIndex6)
    <=> v414(VarCurr,bitIndex5) ) )).

fof(addSignExtensionConstraint_51,axiom,(
    ! [VarCurr] :
      ( v413(VarCurr,bitIndex7)
    <=> v414(VarCurr,bitIndex5) ) )).

fof(addSignExtensionConstraint_50,axiom,(
    ! [VarCurr] :
      ( v413(VarCurr,bitIndex8)
    <=> v414(VarCurr,bitIndex5) ) )).

fof(addSignExtensionConstraint_49,axiom,(
    ! [VarCurr] :
      ( v413(VarCurr,bitIndex9)
    <=> v414(VarCurr,bitIndex5) ) )).

fof(addSignExtensionConstraint_48,axiom,(
    ! [VarCurr] :
      ( v413(VarCurr,bitIndex10)
    <=> v414(VarCurr,bitIndex5) ) )).

fof(addSignExtensionConstraint_47,axiom,(
    ! [VarCurr] :
      ( v413(VarCurr,bitIndex11)
    <=> v414(VarCurr,bitIndex5) ) )).

fof(addSignExtensionConstraint_46,axiom,(
    ! [VarCurr] :
      ( v413(VarCurr,bitIndex12)
    <=> v414(VarCurr,bitIndex5) ) )).

fof(addSignExtensionConstraint_45,axiom,(
    ! [VarCurr] :
      ( v413(VarCurr,bitIndex13)
    <=> v414(VarCurr,bitIndex5) ) )).

fof(addSignExtensionConstraint_44,axiom,(
    ! [VarCurr] :
      ( v413(VarCurr,bitIndex14)
    <=> v414(VarCurr,bitIndex5) ) )).

fof(addSignExtensionConstraint_43,axiom,(
    ! [VarCurr] :
      ( v413(VarCurr,bitIndex15)
    <=> v414(VarCurr,bitIndex5) ) )).

fof(addSignExtensionConstraint_42,axiom,(
    ! [VarCurr] :
      ( v413(VarCurr,bitIndex16)
    <=> v414(VarCurr,bitIndex5) ) )).

fof(addSignExtensionConstraint_41,axiom,(
    ! [VarCurr] :
      ( v413(VarCurr,bitIndex17)
    <=> v414(VarCurr,bitIndex5) ) )).

fof(addSignExtensionConstraint_40,axiom,(
    ! [VarCurr] :
      ( v413(VarCurr,bitIndex18)
    <=> v414(VarCurr,bitIndex5) ) )).

fof(addSignExtensionConstraint_39,axiom,(
    ! [VarCurr] :
      ( v413(VarCurr,bitIndex19)
    <=> v414(VarCurr,bitIndex5) ) )).

fof(addSignExtensionConstraint_38,axiom,(
    ! [VarCurr] :
      ( v413(VarCurr,bitIndex20)
    <=> v414(VarCurr,bitIndex5) ) )).

fof(addSignExtensionConstraint_37,axiom,(
    ! [VarCurr] :
      ( v413(VarCurr,bitIndex21)
    <=> v414(VarCurr,bitIndex5) ) )).

fof(addSignExtensionConstraint_36,axiom,(
    ! [VarCurr] :
      ( v413(VarCurr,bitIndex22)
    <=> v414(VarCurr,bitIndex5) ) )).

fof(addSignExtensionConstraint_35,axiom,(
    ! [VarCurr] :
      ( v413(VarCurr,bitIndex23)
    <=> v414(VarCurr,bitIndex5) ) )).

fof(addSignExtensionConstraint_34,axiom,(
    ! [VarCurr] :
      ( v413(VarCurr,bitIndex24)
    <=> v414(VarCurr,bitIndex5) ) )).

fof(addSignExtensionConstraint_33,axiom,(
    ! [VarCurr] :
      ( v413(VarCurr,bitIndex25)
    <=> v414(VarCurr,bitIndex5) ) )).

fof(addSignExtensionConstraint_32,axiom,(
    ! [VarCurr] :
      ( v413(VarCurr,bitIndex26)
    <=> v414(VarCurr,bitIndex5) ) )).

fof(addSignExtensionConstraint_31,axiom,(
    ! [VarCurr] :
      ( v413(VarCurr,bitIndex27)
    <=> v414(VarCurr,bitIndex5) ) )).

fof(addSignExtensionConstraint_30,axiom,(
    ! [VarCurr] :
      ( v413(VarCurr,bitIndex28)
    <=> v414(VarCurr,bitIndex5) ) )).

fof(addSignExtensionConstraint_29,axiom,(
    ! [VarCurr] :
      ( v413(VarCurr,bitIndex29)
    <=> v414(VarCurr,bitIndex5) ) )).

fof(addSignExtensionConstraint_28,axiom,(
    ! [VarCurr] :
      ( v413(VarCurr,bitIndex30)
    <=> v414(VarCurr,bitIndex5) ) )).

fof(addSignExtensionConstraint_27,axiom,(
    ! [VarCurr] :
      ( v413(VarCurr,bitIndex31)
    <=> v414(VarCurr,bitIndex5) ) )).

fof(addAssignment_89,axiom,(
    ! [VarCurr,B] :
      ( range_5_0(B)
     => ( v413(VarCurr,B)
      <=> v414(VarCurr,B) ) ) )).

fof(range_axiom_6,axiom,(
    ! [B] :
      ( range_5_0(B)
    <=> ( $false
        | bitIndex0 = B
        | bitIndex1 = B
        | bitIndex2 = B
        | bitIndex3 = B
        | bitIndex4 = B
        | bitIndex5 = B ) ) )).

fof(addAssignment_88,axiom,(
    ! [VarCurr] :
      ( v414(VarCurr,bitIndex0)
    <=> v448(VarCurr) ) )).

fof(addAssignment_87,axiom,(
    ! [VarCurr] :
      ( v414(VarCurr,bitIndex1)
    <=> v446(VarCurr) ) )).

fof(addAssignment_86,axiom,(
    ! [VarCurr] :
      ( v414(VarCurr,bitIndex2)
    <=> v442(VarCurr) ) )).

fof(addAssignment_85,axiom,(
    ! [VarCurr] :
      ( v414(VarCurr,bitIndex3)
    <=> v438(VarCurr) ) )).

fof(addAssignment_84,axiom,(
    ! [VarCurr] :
      ( v414(VarCurr,bitIndex4)
    <=> v434(VarCurr) ) )).

fof(addAssignment_83,axiom,(
    ! [VarCurr] :
      ( v414(VarCurr,bitIndex5)
    <=> v416(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_42,axiom,(
    ! [VarCurr] :
      ( v446(VarCurr)
    <=> ( v447(VarCurr)
        & v449(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_41,axiom,(
    ! [VarCurr] :
      ( v449(VarCurr)
    <=> ( v420(VarCurr,bitIndex0)
        | v428(VarCurr) ) ) )).

fof(writeBinaryOperatorShiftedRanges_22,axiom,(
    ! [VarCurr] :
      ( v447(VarCurr)
    <=> ( v448(VarCurr)
        | v420(VarCurr,bitIndex1) ) ) )).

fof(writeUnaryOperator_30,axiom,(
    ! [VarCurr] :
      ( ~ v448(VarCurr)
    <=> v420(VarCurr,bitIndex0) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_40,axiom,(
    ! [VarCurr] :
      ( v442(VarCurr)
    <=> ( v443(VarCurr)
        & v445(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_39,axiom,(
    ! [VarCurr] :
      ( v445(VarCurr)
    <=> ( v426(VarCurr)
        | v429(VarCurr) ) ) )).

fof(writeBinaryOperatorShiftedRanges_21,axiom,(
    ! [VarCurr] :
      ( v443(VarCurr)
    <=> ( v444(VarCurr)
        | v420(VarCurr,bitIndex2) ) ) )).

fof(writeUnaryOperator_29,axiom,(
    ! [VarCurr] :
      ( ~ v444(VarCurr)
    <=> v426(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_38,axiom,(
    ! [VarCurr] :
      ( v438(VarCurr)
    <=> ( v439(VarCurr)
        & v441(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_37,axiom,(
    ! [VarCurr] :
      ( v441(VarCurr)
    <=> ( v424(VarCurr)
        | v430(VarCurr) ) ) )).

fof(writeBinaryOperatorShiftedRanges_20,axiom,(
    ! [VarCurr] :
      ( v439(VarCurr)
    <=> ( v440(VarCurr)
        | v420(VarCurr,bitIndex3) ) ) )).

fof(writeUnaryOperator_28,axiom,(
    ! [VarCurr] :
      ( ~ v440(VarCurr)
    <=> v424(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_36,axiom,(
    ! [VarCurr] :
      ( v434(VarCurr)
    <=> ( v435(VarCurr)
        & v437(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_35,axiom,(
    ! [VarCurr] :
      ( v437(VarCurr)
    <=> ( v422(VarCurr)
        | v431(VarCurr) ) ) )).

fof(writeBinaryOperatorShiftedRanges_19,axiom,(
    ! [VarCurr] :
      ( v435(VarCurr)
    <=> ( v436(VarCurr)
        | v420(VarCurr,bitIndex4) ) ) )).

fof(writeUnaryOperator_27,axiom,(
    ! [VarCurr] :
      ( ~ v436(VarCurr)
    <=> v422(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_34,axiom,(
    ! [VarCurr] :
      ( v416(VarCurr)
    <=> ( v417(VarCurr)
        & v432(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_33,axiom,(
    ! [VarCurr] :
      ( v432(VarCurr)
    <=> ( v419(VarCurr)
        | v433(VarCurr) ) ) )).

fof(writeUnaryOperator_26,axiom,(
    ! [VarCurr] :
      ( ~ v433(VarCurr)
    <=> v420(VarCurr,bitIndex5) ) )).

fof(writeBinaryOperatorShiftedRanges_18,axiom,(
    ! [VarCurr] :
      ( v417(VarCurr)
    <=> ( v418(VarCurr)
        | v420(VarCurr,bitIndex5) ) ) )).

fof(writeUnaryOperator_25,axiom,(
    ! [VarCurr] :
      ( ~ v418(VarCurr)
    <=> v419(VarCurr) ) )).

fof(writeBinaryOperatorShiftedRanges_17,axiom,(
    ! [VarCurr] :
      ( v419(VarCurr)
    <=> ( v420(VarCurr,bitIndex4)
        | v421(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_32,axiom,(
    ! [VarCurr] :
      ( v421(VarCurr)
    <=> ( v422(VarCurr)
        & v431(VarCurr) ) ) )).

fof(writeUnaryOperator_24,axiom,(
    ! [VarCurr] :
      ( ~ v431(VarCurr)
    <=> v420(VarCurr,bitIndex4) ) )).

fof(writeBinaryOperatorShiftedRanges_16,axiom,(
    ! [VarCurr] :
      ( v422(VarCurr)
    <=> ( v420(VarCurr,bitIndex3)
        | v423(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_31,axiom,(
    ! [VarCurr] :
      ( v423(VarCurr)
    <=> ( v424(VarCurr)
        & v430(VarCurr) ) ) )).

fof(writeUnaryOperator_23,axiom,(
    ! [VarCurr] :
      ( ~ v430(VarCurr)
    <=> v420(VarCurr,bitIndex3) ) )).

fof(writeBinaryOperatorShiftedRanges_15,axiom,(
    ! [VarCurr] :
      ( v424(VarCurr)
    <=> ( v420(VarCurr,bitIndex2)
        | v425(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_30,axiom,(
    ! [VarCurr] :
      ( v425(VarCurr)
    <=> ( v426(VarCurr)
        & v429(VarCurr) ) ) )).

fof(writeUnaryOperator_22,axiom,(
    ! [VarCurr] :
      ( ~ v429(VarCurr)
    <=> v420(VarCurr,bitIndex2) ) )).

fof(writeBinaryOperatorShiftedRanges_14,axiom,(
    ! [VarCurr] :
      ( v426(VarCurr)
    <=> ( v420(VarCurr,bitIndex1)
        | v427(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_29,axiom,(
    ! [VarCurr] :
      ( v427(VarCurr)
    <=> ( v420(VarCurr,bitIndex0)
        & v428(VarCurr) ) ) )).

fof(writeUnaryOperator_21,axiom,(
    ! [VarCurr] :
      ( ~ v428(VarCurr)
    <=> v420(VarCurr,bitIndex1) ) )).

fof(addZeroExtensionConstraint_1,axiom,(
    ! [VarCurr] : ~ v420(VarCurr,bitIndex5) )).

fof(addAssignment_82,axiom,(
    ! [VarCurr,B] :
      ( range_4_0(B)
     => ( v420(VarCurr,B)
      <=> v385(VarCurr,B) ) ) )).

fof(addBitVectorEqualityBitBlasted_15,axiom,(
    ! [VarCurr] :
      ( v412(VarCurr)
    <=> ( ( v385(VarCurr,bitIndex4)
        <=> $false )
        & ( v385(VarCurr,bitIndex3)
        <=> $false )
        & ( v385(VarCurr,bitIndex2)
        <=> $false )
        & ( v385(VarCurr,bitIndex1)
        <=> $false )
        & ( v385(VarCurr,bitIndex0)
        <=> $false ) ) ) )).

fof(addBitVectorEqualityBitBlasted_14,axiom,(
    ! [VarCurr] :
      ( v409(VarCurr)
    <=> ( ( v410(VarCurr,bitIndex1)
        <=> $false )
        & ( v410(VarCurr,bitIndex0)
        <=> $true ) ) ) )).

fof(addAssignment_81,axiom,(
    ! [VarCurr] :
      ( v410(VarCurr,bitIndex0)
    <=> v403(VarCurr) ) )).

fof(addAssignment_80,axiom,(
    ! [VarCurr] :
      ( v410(VarCurr,bitIndex1)
    <=> v391(VarCurr) ) )).

fof(addAssignmentInitValueVector_4,axiom,(
    ! [B] :
      ( range_4_0(B)
     => ( v385(constB0,B)
      <=> $false ) ) )).

fof(addBitVectorEqualityBitBlasted_13,axiom,(
    ! [VarCurr] :
      ( v407(VarCurr)
    <=> ( ( v408(VarCurr,bitIndex1)
        <=> $false )
        & ( v408(VarCurr,bitIndex0)
        <=> $false ) ) ) )).

fof(addAssignment_79,axiom,(
    ! [VarCurr] :
      ( v408(VarCurr,bitIndex0)
    <=> v403(VarCurr) ) )).

fof(addAssignment_78,axiom,(
    ! [VarCurr] :
      ( v408(VarCurr,bitIndex1)
    <=> v391(VarCurr) ) )).

fof(addAssignment_77,axiom,(
    ! [VarCurr] :
      ( v403(VarCurr)
    <=> v332(VarCurr) ) )).

fof(addAssignment_76,axiom,(
    ! [VarCurr] :
      ( v391(VarCurr)
    <=> v393(VarCurr) ) )).

fof(addAssignment_75,axiom,(
    ! [VarCurr] :
      ( v393(VarCurr)
    <=> v395(VarCurr) ) )).

fof(addAssignment_74,axiom,(
    ! [VarCurr] :
      ( v395(VarCurr)
    <=> v397(VarCurr) ) )).

fof(addAssignment_73,axiom,(
    ! [VarCurr] :
      ( v397(VarCurr)
    <=> v399(VarCurr) ) )).

fof(addAssignment_72,axiom,(
    ! [VarCurr] :
      ( v399(VarCurr)
    <=> v401(VarCurr) ) )).

fof(addAssignment_71,axiom,(
    ! [VarCurr] :
      ( v387(VarCurr)
    <=> v336(VarCurr) ) )).

fof(addAssignment_70,axiom,(
    ! [VarCurr] :
      ( v354(VarCurr)
    <=> v356(VarCurr) ) )).

fof(aaddConditionBooleanCondEqualRangesElseBranch_5,axiom,(
    ! [VarCurr] :
      ( ~ v374(VarCurr)
     => ( v356(VarCurr)
      <=> $false ) ) )).

fof(addConditionBooleanCondEqualRangesThenBranch_5,axiom,(
    ! [VarCurr] :
      ( v374(VarCurr)
     => ( v356(VarCurr)
      <=> $true ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_28,axiom,(
    ! [VarCurr] :
      ( v374(VarCurr)
    <=> ( v375(VarCurr)
        & v366(VarCurr) ) ) )).

fof(writeUnaryOperator_20,axiom,(
    ! [VarCurr] :
      ( ~ v375(VarCurr)
    <=> v358(VarCurr,bitIndex8) ) )).

fof(addAssignment_69,axiom,(
    ! [VarCurr] :
      ( v366(VarCurr)
    <=> v368(VarCurr) ) )).

fof(addAssignment_68,axiom,(
    ! [VarCurr] :
      ( v368(VarCurr)
    <=> v370(VarCurr) ) )).

fof(addAssignment_67,axiom,(
    ! [VarCurr] :
      ( v370(VarCurr)
    <=> v372(VarCurr) ) )).

fof(addAssignment_66,axiom,(
    ! [VarCurr] :
      ( v358(VarCurr,bitIndex8)
    <=> v360(VarCurr,bitIndex8) ) )).

fof(addAssignment_65,axiom,(
    ! [VarCurr] :
      ( v360(VarCurr,bitIndex8)
    <=> v362(VarCurr,bitIndex8) ) )).

fof(addAssignment_64,axiom,(
    ! [VarCurr] :
      ( v362(VarCurr,bitIndex8)
    <=> v364(VarCurr,bitIndex8) ) )).

fof(addAssignment_63,axiom,(
    ! [VarCurr] :
      ( v350(VarCurr)
    <=> v336(VarCurr) ) )).

fof(addAssignment_62,axiom,(
    ! [VarCurr] :
      ( v336(VarCurr)
    <=> v338(VarCurr) ) )).

fof(addAssignment_61,axiom,(
    ! [VarCurr] :
      ( v338(VarCurr)
    <=> v340(VarCurr) ) )).

fof(addAssignment_60,axiom,(
    ! [VarCurr] :
      ( v340(VarCurr)
    <=> v16(VarCurr) ) )).

fof(addAssignment_59,axiom,(
    ! [VarCurr] :
      ( v99(VarCurr)
    <=> v101(VarCurr) ) )).

fof(writeUnaryOperator_19,axiom,(
    ! [VarCurr] :
      ( ~ v101(VarCurr)
    <=> v103(VarCurr) ) )).

fof(addAssignment_58,axiom,(
    ! [VarCurr] :
      ( v103(VarCurr)
    <=> v105(VarCurr) ) )).

fof(addAssignment_57,axiom,(
    ! [VarCurr] :
      ( v105(VarCurr)
    <=> v107(VarCurr) ) )).

fof(addBitVectorEqualityBitBlasted_12,axiom,(
    ! [VarCurr] :
      ( v107(VarCurr)
    <=> ( ( v109(VarCurr,bitIndex3)
        <=> $false )
        & ( v109(VarCurr,bitIndex2)
        <=> $false )
        & ( v109(VarCurr,bitIndex1)
        <=> $false )
        & ( v109(VarCurr,bitIndex0)
        <=> $false ) ) ) )).

fof(addCaseBooleanConditionEqualRanges1_1,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( ~ v291(VarNext)
       => ! [B] :
            ( range_3_0(B)
           => ( v109(VarNext,B)
            <=> v109(VarCurr,B) ) ) ) ) )).

fof(addCaseBooleanConditionEqualRanges0_1,axiom,(
    ! [VarNext] :
      ( v291(VarNext)
     => ! [B] :
          ( range_3_0(B)
         => ( v109(VarNext,B)
          <=> v301(VarNext,B) ) ) ) )).

fof(addAssignment_56,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ! [B] :
          ( range_3_0(B)
         => ( v301(VarNext,B)
          <=> v299(VarCurr,B) ) ) ) )).

fof(aaddConditionBooleanCondEqualRangesElseBranch_4,axiom,(
    ! [VarCurr] :
      ( ~ v302(VarCurr)
     => ! [B] :
          ( range_3_0(B)
         => ( v299(VarCurr,B)
          <=> v111(VarCurr,B) ) ) ) )).

fof(addConditionBooleanCondEqualRangesThenBranch_4,axiom,(
    ! [VarCurr] :
      ( v302(VarCurr)
     => ! [B] :
          ( range_3_0(B)
         => ( v299(VarCurr,B)
          <=> $false ) ) ) )).

fof(writeUnaryOperator_18,axiom,(
    ! [VarCurr] :
      ( ~ v302(VarCurr)
    <=> v10(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_27,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( v291(VarNext)
      <=> v292(VarNext) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_26,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( v292(VarNext)
      <=> ( v293(VarNext)
          & v286(VarNext) ) ) ) )).

fof(writeUnaryOperator_17,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( ~ v293(VarNext)
      <=> v295(VarNext) ) ) )).

fof(addAssignment_55,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( v295(VarNext)
      <=> v286(VarCurr) ) ) )).

fof(addAssignment_54,axiom,(
    ! [VarCurr] :
      ( v286(VarCurr)
    <=> v288(VarCurr) ) )).

fof(addAssignment_53,axiom,(
    ! [VarCurr] :
      ( v288(VarCurr)
    <=> v197(VarCurr) ) )).

fof(addParallelCaseBooleanConditionEqualRanges3,axiom,(
    ! [VarCurr] :
      ( ( ~ v223(VarCurr)
        & ~ v225(VarCurr)
        & ~ v260(VarCurr) )
     => ! [B] :
          ( range_3_0(B)
         => ( v111(VarCurr,B)
          <=> v109(VarCurr,B) ) ) ) )).

fof(addParallelCaseBooleanConditionEqualRanges2,axiom,(
    ! [VarCurr] :
      ( v260(VarCurr)
     => ! [B] :
          ( range_3_0(B)
         => ( v111(VarCurr,B)
          <=> v262(VarCurr,B) ) ) ) )).

fof(addParallelCaseBooleanConditionEqualRanges1,axiom,(
    ! [VarCurr] :
      ( v225(VarCurr)
     => ! [B] :
          ( range_3_0(B)
         => ( v111(VarCurr,B)
          <=> v227(VarCurr,B) ) ) ) )).

fof(addParallelCaseBooleanConditionEqualRanges0,axiom,(
    ! [VarCurr] :
      ( v223(VarCurr)
     => ! [B] :
          ( range_3_0(B)
         => ( v111(VarCurr,B)
          <=> v109(VarCurr,B) ) ) ) )).

fof(addBitVectorEqualityBitBlasted_11,axiom,(
    ! [VarCurr] :
      ( v283(VarCurr)
    <=> ( ( v284(VarCurr,bitIndex1)
        <=> $true )
        & ( v284(VarCurr,bitIndex0)
        <=> $true ) ) ) )).

fof(bitBlastConstant_90,axiom,(
    b11(bitIndex1) )).

fof(bitBlastConstant_89,axiom,(
    b11(bitIndex0) )).

fof(addAssignment_52,axiom,(
    ! [VarCurr] :
      ( v284(VarCurr,bitIndex0)
    <=> v23(VarCurr) ) )).

fof(addAssignment_51,axiom,(
    ! [VarCurr] :
      ( v284(VarCurr,bitIndex1)
    <=> v113(VarCurr) ) )).

fof(aaddConditionBooleanCondEqualRangesElseBranch_3,axiom,(
    ! [VarCurr] :
      ( ~ v263(VarCurr)
     => ! [B] :
          ( range_3_0(B)
         => ( v262(VarCurr,B)
          <=> v264(VarCurr,B) ) ) ) )).

fof(addConditionBooleanCondEqualRangesThenBranch_3,axiom,(
    ! [VarCurr] :
      ( v263(VarCurr)
     => ! [B] :
          ( range_3_0(B)
         => ( v262(VarCurr,B)
          <=> b0110(B) ) ) ) )).

fof(addAssignment_50,axiom,(
    ! [VarCurr] :
      ( v264(VarCurr,bitIndex0)
    <=> v280(VarCurr) ) )).

fof(addAssignment_49,axiom,(
    ! [VarCurr] :
      ( v264(VarCurr,bitIndex1)
    <=> v278(VarCurr) ) )).

fof(addAssignment_48,axiom,(
    ! [VarCurr] :
      ( v264(VarCurr,bitIndex2)
    <=> v273(VarCurr) ) )).

fof(addAssignment_47,axiom,(
    ! [VarCurr] :
      ( v264(VarCurr,bitIndex3)
    <=> v266(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_25,axiom,(
    ! [VarCurr] :
      ( v278(VarCurr)
    <=> ( v279(VarCurr)
        & v282(VarCurr) ) ) )).

fof(writeBinaryOperatorShiftedRanges_13,axiom,(
    ! [VarCurr] :
      ( v282(VarCurr)
    <=> ( v109(VarCurr,bitIndex0)
        | v109(VarCurr,bitIndex1) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_24,axiom,(
    ! [VarCurr] :
      ( v279(VarCurr)
    <=> ( v280(VarCurr)
        | v281(VarCurr) ) ) )).

fof(writeUnaryOperator_16,axiom,(
    ! [VarCurr] :
      ( ~ v281(VarCurr)
    <=> v109(VarCurr,bitIndex1) ) )).

fof(writeUnaryOperator_15,axiom,(
    ! [VarCurr] :
      ( ~ v280(VarCurr)
    <=> v109(VarCurr,bitIndex0) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_23,axiom,(
    ! [VarCurr] :
      ( v273(VarCurr)
    <=> ( v274(VarCurr)
        & v277(VarCurr) ) ) )).

fof(writeBinaryOperatorShiftedRanges_12,axiom,(
    ! [VarCurr] :
      ( v277(VarCurr)
    <=> ( v270(VarCurr)
        | v109(VarCurr,bitIndex2) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_22,axiom,(
    ! [VarCurr] :
      ( v274(VarCurr)
    <=> ( v275(VarCurr)
        | v276(VarCurr) ) ) )).

fof(writeUnaryOperator_14,axiom,(
    ! [VarCurr] :
      ( ~ v276(VarCurr)
    <=> v109(VarCurr,bitIndex2) ) )).

fof(writeUnaryOperator_13,axiom,(
    ! [VarCurr] :
      ( ~ v275(VarCurr)
    <=> v270(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_21,axiom,(
    ! [VarCurr] :
      ( v266(VarCurr)
    <=> ( v267(VarCurr)
        & v272(VarCurr) ) ) )).

fof(writeBinaryOperatorShiftedRanges_11,axiom,(
    ! [VarCurr] :
      ( v272(VarCurr)
    <=> ( v269(VarCurr)
        | v109(VarCurr,bitIndex3) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_20,axiom,(
    ! [VarCurr] :
      ( v267(VarCurr)
    <=> ( v268(VarCurr)
        | v271(VarCurr) ) ) )).

fof(writeUnaryOperator_12,axiom,(
    ! [VarCurr] :
      ( ~ v271(VarCurr)
    <=> v109(VarCurr,bitIndex3) ) )).

fof(writeUnaryOperator_11,axiom,(
    ! [VarCurr] :
      ( ~ v268(VarCurr)
    <=> v269(VarCurr) ) )).

fof(writeBinaryOperatorShiftedRanges_10,axiom,(
    ! [VarCurr] :
      ( v269(VarCurr)
    <=> ( v270(VarCurr)
        & v109(VarCurr,bitIndex2) ) ) )).

fof(writeBinaryOperatorShiftedRanges_9,axiom,(
    ! [VarCurr] :
      ( v270(VarCurr)
    <=> ( v109(VarCurr,bitIndex0)
        & v109(VarCurr,bitIndex1) ) ) )).

fof(addBitVectorEqualityBitBlasted_10,axiom,(
    ! [VarCurr] :
      ( v263(VarCurr)
    <=> ( ( v109(VarCurr,bitIndex3)
        <=> $false )
        & ( v109(VarCurr,bitIndex2)
        <=> $true )
        & ( v109(VarCurr,bitIndex1)
        <=> $true )
        & ( v109(VarCurr,bitIndex0)
        <=> $false ) ) ) )).

fof(bitBlastConstant_88,axiom,(
    ~ b0110(bitIndex3) )).

fof(bitBlastConstant_87,axiom,(
    b0110(bitIndex2) )).

fof(bitBlastConstant_86,axiom,(
    b0110(bitIndex1) )).

fof(bitBlastConstant_85,axiom,(
    ~ b0110(bitIndex0) )).

fof(addBitVectorEqualityBitBlasted_9,axiom,(
    ! [VarCurr] :
      ( v260(VarCurr)
    <=> ( ( v261(VarCurr,bitIndex1)
        <=> $true )
        & ( v261(VarCurr,bitIndex0)
        <=> $false ) ) ) )).

fof(bitBlastConstant_84,axiom,(
    b10(bitIndex1) )).

fof(bitBlastConstant_83,axiom,(
    ~ b10(bitIndex0) )).

fof(addAssignment_46,axiom,(
    ! [VarCurr] :
      ( v261(VarCurr,bitIndex0)
    <=> v23(VarCurr) ) )).

fof(addAssignment_45,axiom,(
    ! [VarCurr] :
      ( v261(VarCurr,bitIndex1)
    <=> v113(VarCurr) ) )).

fof(aaddConditionBooleanCondEqualRangesElseBranch_2,axiom,(
    ! [VarCurr] :
      ( ~ v228(VarCurr)
     => ! [B] :
          ( range_31_0(B)
         => ( v227(VarCurr,B)
          <=> v229(VarCurr,B) ) ) ) )).

fof(addConditionBooleanCondEqualRangesThenBranch_2,axiom,(
    ! [VarCurr] :
      ( v228(VarCurr)
     => ! [B] :
          ( range_31_0(B)
         => ( v227(VarCurr,B)
          <=> $false ) ) ) )).

fof(range_axiom_5,axiom,(
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

fof(bitBlastConstant_82,axiom,(
    ~ b00000000000000000000000000000000(bitIndex31) )).

fof(bitBlastConstant_81,axiom,(
    ~ b00000000000000000000000000000000(bitIndex30) )).

fof(bitBlastConstant_80,axiom,(
    ~ b00000000000000000000000000000000(bitIndex29) )).

fof(bitBlastConstant_79,axiom,(
    ~ b00000000000000000000000000000000(bitIndex28) )).

fof(bitBlastConstant_78,axiom,(
    ~ b00000000000000000000000000000000(bitIndex27) )).

fof(bitBlastConstant_77,axiom,(
    ~ b00000000000000000000000000000000(bitIndex26) )).

fof(bitBlastConstant_76,axiom,(
    ~ b00000000000000000000000000000000(bitIndex25) )).

fof(bitBlastConstant_75,axiom,(
    ~ b00000000000000000000000000000000(bitIndex24) )).

fof(bitBlastConstant_74,axiom,(
    ~ b00000000000000000000000000000000(bitIndex23) )).

fof(bitBlastConstant_73,axiom,(
    ~ b00000000000000000000000000000000(bitIndex22) )).

fof(bitBlastConstant_72,axiom,(
    ~ b00000000000000000000000000000000(bitIndex21) )).

fof(bitBlastConstant_71,axiom,(
    ~ b00000000000000000000000000000000(bitIndex20) )).

fof(bitBlastConstant_70,axiom,(
    ~ b00000000000000000000000000000000(bitIndex19) )).

fof(bitBlastConstant_69,axiom,(
    ~ b00000000000000000000000000000000(bitIndex18) )).

fof(bitBlastConstant_68,axiom,(
    ~ b00000000000000000000000000000000(bitIndex17) )).

fof(bitBlastConstant_67,axiom,(
    ~ b00000000000000000000000000000000(bitIndex16) )).

fof(bitBlastConstant_66,axiom,(
    ~ b00000000000000000000000000000000(bitIndex15) )).

fof(bitBlastConstant_65,axiom,(
    ~ b00000000000000000000000000000000(bitIndex14) )).

fof(bitBlastConstant_64,axiom,(
    ~ b00000000000000000000000000000000(bitIndex13) )).

fof(bitBlastConstant_63,axiom,(
    ~ b00000000000000000000000000000000(bitIndex12) )).

fof(bitBlastConstant_62,axiom,(
    ~ b00000000000000000000000000000000(bitIndex11) )).

fof(bitBlastConstant_61,axiom,(
    ~ b00000000000000000000000000000000(bitIndex10) )).

fof(bitBlastConstant_60,axiom,(
    ~ b00000000000000000000000000000000(bitIndex9) )).

fof(bitBlastConstant_59,axiom,(
    ~ b00000000000000000000000000000000(bitIndex8) )).

fof(bitBlastConstant_58,axiom,(
    ~ b00000000000000000000000000000000(bitIndex7) )).

fof(bitBlastConstant_57,axiom,(
    ~ b00000000000000000000000000000000(bitIndex6) )).

fof(bitBlastConstant_56,axiom,(
    ~ b00000000000000000000000000000000(bitIndex5) )).

fof(bitBlastConstant_55,axiom,(
    ~ b00000000000000000000000000000000(bitIndex4) )).

fof(bitBlastConstant_54,axiom,(
    ~ b00000000000000000000000000000000(bitIndex3) )).

fof(bitBlastConstant_53,axiom,(
    ~ b00000000000000000000000000000000(bitIndex2) )).

fof(bitBlastConstant_52,axiom,(
    ~ b00000000000000000000000000000000(bitIndex1) )).

fof(bitBlastConstant_51,axiom,(
    ~ b00000000000000000000000000000000(bitIndex0) )).

fof(addSignExtensionConstraint_26,axiom,(
    ! [VarCurr] :
      ( v229(VarCurr,bitIndex5)
    <=> v230(VarCurr,bitIndex4) ) )).

fof(addSignExtensionConstraint_25,axiom,(
    ! [VarCurr] :
      ( v229(VarCurr,bitIndex6)
    <=> v230(VarCurr,bitIndex4) ) )).

fof(addSignExtensionConstraint_24,axiom,(
    ! [VarCurr] :
      ( v229(VarCurr,bitIndex7)
    <=> v230(VarCurr,bitIndex4) ) )).

fof(addSignExtensionConstraint_23,axiom,(
    ! [VarCurr] :
      ( v229(VarCurr,bitIndex8)
    <=> v230(VarCurr,bitIndex4) ) )).

fof(addSignExtensionConstraint_22,axiom,(
    ! [VarCurr] :
      ( v229(VarCurr,bitIndex9)
    <=> v230(VarCurr,bitIndex4) ) )).

fof(addSignExtensionConstraint_21,axiom,(
    ! [VarCurr] :
      ( v229(VarCurr,bitIndex10)
    <=> v230(VarCurr,bitIndex4) ) )).

fof(addSignExtensionConstraint_20,axiom,(
    ! [VarCurr] :
      ( v229(VarCurr,bitIndex11)
    <=> v230(VarCurr,bitIndex4) ) )).

fof(addSignExtensionConstraint_19,axiom,(
    ! [VarCurr] :
      ( v229(VarCurr,bitIndex12)
    <=> v230(VarCurr,bitIndex4) ) )).

fof(addSignExtensionConstraint_18,axiom,(
    ! [VarCurr] :
      ( v229(VarCurr,bitIndex13)
    <=> v230(VarCurr,bitIndex4) ) )).

fof(addSignExtensionConstraint_17,axiom,(
    ! [VarCurr] :
      ( v229(VarCurr,bitIndex14)
    <=> v230(VarCurr,bitIndex4) ) )).

fof(addSignExtensionConstraint_16,axiom,(
    ! [VarCurr] :
      ( v229(VarCurr,bitIndex15)
    <=> v230(VarCurr,bitIndex4) ) )).

fof(addSignExtensionConstraint_15,axiom,(
    ! [VarCurr] :
      ( v229(VarCurr,bitIndex16)
    <=> v230(VarCurr,bitIndex4) ) )).

fof(addSignExtensionConstraint_14,axiom,(
    ! [VarCurr] :
      ( v229(VarCurr,bitIndex17)
    <=> v230(VarCurr,bitIndex4) ) )).

fof(addSignExtensionConstraint_13,axiom,(
    ! [VarCurr] :
      ( v229(VarCurr,bitIndex18)
    <=> v230(VarCurr,bitIndex4) ) )).

fof(addSignExtensionConstraint_12,axiom,(
    ! [VarCurr] :
      ( v229(VarCurr,bitIndex19)
    <=> v230(VarCurr,bitIndex4) ) )).

fof(addSignExtensionConstraint_11,axiom,(
    ! [VarCurr] :
      ( v229(VarCurr,bitIndex20)
    <=> v230(VarCurr,bitIndex4) ) )).

fof(addSignExtensionConstraint_10,axiom,(
    ! [VarCurr] :
      ( v229(VarCurr,bitIndex21)
    <=> v230(VarCurr,bitIndex4) ) )).

fof(addSignExtensionConstraint_9,axiom,(
    ! [VarCurr] :
      ( v229(VarCurr,bitIndex22)
    <=> v230(VarCurr,bitIndex4) ) )).

fof(addSignExtensionConstraint_8,axiom,(
    ! [VarCurr] :
      ( v229(VarCurr,bitIndex23)
    <=> v230(VarCurr,bitIndex4) ) )).

fof(addSignExtensionConstraint_7,axiom,(
    ! [VarCurr] :
      ( v229(VarCurr,bitIndex24)
    <=> v230(VarCurr,bitIndex4) ) )).

fof(addSignExtensionConstraint_6,axiom,(
    ! [VarCurr] :
      ( v229(VarCurr,bitIndex25)
    <=> v230(VarCurr,bitIndex4) ) )).

fof(addSignExtensionConstraint_5,axiom,(
    ! [VarCurr] :
      ( v229(VarCurr,bitIndex26)
    <=> v230(VarCurr,bitIndex4) ) )).

fof(addSignExtensionConstraint_4,axiom,(
    ! [VarCurr] :
      ( v229(VarCurr,bitIndex27)
    <=> v230(VarCurr,bitIndex4) ) )).

fof(addSignExtensionConstraint_3,axiom,(
    ! [VarCurr] :
      ( v229(VarCurr,bitIndex28)
    <=> v230(VarCurr,bitIndex4) ) )).

fof(addSignExtensionConstraint_2,axiom,(
    ! [VarCurr] :
      ( v229(VarCurr,bitIndex29)
    <=> v230(VarCurr,bitIndex4) ) )).

fof(addSignExtensionConstraint_1,axiom,(
    ! [VarCurr] :
      ( v229(VarCurr,bitIndex30)
    <=> v230(VarCurr,bitIndex4) ) )).

fof(addSignExtensionConstraint,axiom,(
    ! [VarCurr] :
      ( v229(VarCurr,bitIndex31)
    <=> v230(VarCurr,bitIndex4) ) )).

fof(addAssignment_44,axiom,(
    ! [VarCurr,B] :
      ( range_4_0(B)
     => ( v229(VarCurr,B)
      <=> v230(VarCurr,B) ) ) )).

fof(addAssignment_43,axiom,(
    ! [VarCurr] :
      ( v230(VarCurr,bitIndex0)
    <=> v258(VarCurr) ) )).

fof(addAssignment_42,axiom,(
    ! [VarCurr] :
      ( v230(VarCurr,bitIndex1)
    <=> v256(VarCurr) ) )).

fof(addAssignment_41,axiom,(
    ! [VarCurr] :
      ( v230(VarCurr,bitIndex2)
    <=> v252(VarCurr) ) )).

fof(addAssignment_40,axiom,(
    ! [VarCurr] :
      ( v230(VarCurr,bitIndex3)
    <=> v248(VarCurr) ) )).

fof(addAssignment_39,axiom,(
    ! [VarCurr] :
      ( v230(VarCurr,bitIndex4)
    <=> v232(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_19,axiom,(
    ! [VarCurr] :
      ( v256(VarCurr)
    <=> ( v257(VarCurr)
        & v259(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_18,axiom,(
    ! [VarCurr] :
      ( v259(VarCurr)
    <=> ( v236(VarCurr,bitIndex0)
        | v243(VarCurr) ) ) )).

fof(writeBinaryOperatorShiftedRanges_8,axiom,(
    ! [VarCurr] :
      ( v257(VarCurr)
    <=> ( v258(VarCurr)
        | v236(VarCurr,bitIndex1) ) ) )).

fof(writeUnaryOperator_10,axiom,(
    ! [VarCurr] :
      ( ~ v258(VarCurr)
    <=> v236(VarCurr,bitIndex0) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_17,axiom,(
    ! [VarCurr] :
      ( v252(VarCurr)
    <=> ( v253(VarCurr)
        & v255(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_16,axiom,(
    ! [VarCurr] :
      ( v255(VarCurr)
    <=> ( v241(VarCurr)
        | v244(VarCurr) ) ) )).

fof(writeBinaryOperatorShiftedRanges_7,axiom,(
    ! [VarCurr] :
      ( v253(VarCurr)
    <=> ( v254(VarCurr)
        | v236(VarCurr,bitIndex2) ) ) )).

fof(writeUnaryOperator_9,axiom,(
    ! [VarCurr] :
      ( ~ v254(VarCurr)
    <=> v241(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_15,axiom,(
    ! [VarCurr] :
      ( v248(VarCurr)
    <=> ( v249(VarCurr)
        & v251(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_14,axiom,(
    ! [VarCurr] :
      ( v251(VarCurr)
    <=> ( v239(VarCurr)
        | v245(VarCurr) ) ) )).

fof(writeBinaryOperatorShiftedRanges_6,axiom,(
    ! [VarCurr] :
      ( v249(VarCurr)
    <=> ( v250(VarCurr)
        | v236(VarCurr,bitIndex3) ) ) )).

fof(writeUnaryOperator_8,axiom,(
    ! [VarCurr] :
      ( ~ v250(VarCurr)
    <=> v239(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_13,axiom,(
    ! [VarCurr] :
      ( v232(VarCurr)
    <=> ( v233(VarCurr)
        & v246(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_12,axiom,(
    ! [VarCurr] :
      ( v246(VarCurr)
    <=> ( v235(VarCurr)
        | v247(VarCurr) ) ) )).

fof(writeUnaryOperator_7,axiom,(
    ! [VarCurr] :
      ( ~ v247(VarCurr)
    <=> v236(VarCurr,bitIndex4) ) )).

fof(writeBinaryOperatorShiftedRanges_5,axiom,(
    ! [VarCurr] :
      ( v233(VarCurr)
    <=> ( v234(VarCurr)
        | v236(VarCurr,bitIndex4) ) ) )).

fof(writeUnaryOperator_6,axiom,(
    ! [VarCurr] :
      ( ~ v234(VarCurr)
    <=> v235(VarCurr) ) )).

fof(writeBinaryOperatorShiftedRanges_4,axiom,(
    ! [VarCurr] :
      ( v235(VarCurr)
    <=> ( v236(VarCurr,bitIndex3)
        | v238(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_11,axiom,(
    ! [VarCurr] :
      ( v238(VarCurr)
    <=> ( v239(VarCurr)
        & v245(VarCurr) ) ) )).

fof(writeUnaryOperator_5,axiom,(
    ! [VarCurr] :
      ( ~ v245(VarCurr)
    <=> v236(VarCurr,bitIndex3) ) )).

fof(writeBinaryOperatorShiftedRanges_3,axiom,(
    ! [VarCurr] :
      ( v239(VarCurr)
    <=> ( v236(VarCurr,bitIndex2)
        | v240(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_10,axiom,(
    ! [VarCurr] :
      ( v240(VarCurr)
    <=> ( v241(VarCurr)
        & v244(VarCurr) ) ) )).

fof(writeUnaryOperator_4,axiom,(
    ! [VarCurr] :
      ( ~ v244(VarCurr)
    <=> v236(VarCurr,bitIndex2) ) )).

fof(writeBinaryOperatorShiftedRanges_2,axiom,(
    ! [VarCurr] :
      ( v241(VarCurr)
    <=> ( v236(VarCurr,bitIndex1)
        | v242(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_9,axiom,(
    ! [VarCurr] :
      ( v242(VarCurr)
    <=> ( v236(VarCurr,bitIndex0)
        & v243(VarCurr) ) ) )).

fof(writeUnaryOperator_3,axiom,(
    ! [VarCurr] :
      ( ~ v243(VarCurr)
    <=> v236(VarCurr,bitIndex1) ) )).

fof(addZeroExtensionConstraint,axiom,(
    ! [VarCurr] : ~ v236(VarCurr,bitIndex4) )).

fof(addAssignment_38,axiom,(
    ! [VarCurr,B] :
      ( range_3_0(B)
     => ( v236(VarCurr,B)
      <=> v109(VarCurr,B) ) ) )).

fof(addBitVectorEqualityBitBlasted_8,axiom,(
    ! [VarCurr] :
      ( v228(VarCurr)
    <=> ( ( v109(VarCurr,bitIndex3)
        <=> $false )
        & ( v109(VarCurr,bitIndex2)
        <=> $false )
        & ( v109(VarCurr,bitIndex1)
        <=> $false )
        & ( v109(VarCurr,bitIndex0)
        <=> $false ) ) ) )).

fof(addBitVectorEqualityBitBlasted_7,axiom,(
    ! [VarCurr] :
      ( v225(VarCurr)
    <=> ( ( v226(VarCurr,bitIndex1)
        <=> $false )
        & ( v226(VarCurr,bitIndex0)
        <=> $true ) ) ) )).

fof(bitBlastConstant_50,axiom,(
    ~ b01(bitIndex1) )).

fof(bitBlastConstant_49,axiom,(
    b01(bitIndex0) )).

fof(addAssignment_37,axiom,(
    ! [VarCurr] :
      ( v226(VarCurr,bitIndex0)
    <=> v23(VarCurr) ) )).

fof(addAssignment_36,axiom,(
    ! [VarCurr] :
      ( v226(VarCurr,bitIndex1)
    <=> v113(VarCurr) ) )).

fof(addAssignmentInitValueVector_3,axiom,(
    ! [B] :
      ( range_3_0(B)
     => ( v109(constB0,B)
      <=> $false ) ) )).

fof(addBitVectorEqualityBitBlasted_6,axiom,(
    ! [VarCurr] :
      ( v223(VarCurr)
    <=> ( ( v224(VarCurr,bitIndex1)
        <=> $false )
        & ( v224(VarCurr,bitIndex0)
        <=> $false ) ) ) )).

fof(bitBlastConstant_48,axiom,(
    ~ b00(bitIndex1) )).

fof(bitBlastConstant_47,axiom,(
    ~ b00(bitIndex0) )).

fof(addAssignment_35,axiom,(
    ! [VarCurr] :
      ( v224(VarCurr,bitIndex0)
    <=> v23(VarCurr) ) )).

fof(addAssignment_34,axiom,(
    ! [VarCurr] :
      ( v224(VarCurr,bitIndex1)
    <=> v113(VarCurr) ) )).

fof(addAssignment_33,axiom,(
    ! [VarCurr] :
      ( v113(VarCurr)
    <=> v115(VarCurr) ) )).

fof(addAssignment_32,axiom,(
    ! [VarCurr] :
      ( v115(VarCurr)
    <=> v117(VarCurr) ) )).

fof(addAssignment_31,axiom,(
    ! [VarCurr] :
      ( v117(VarCurr)
    <=> v119(VarCurr) ) )).

fof(addAssignment_30,axiom,(
    ! [VarCurr] :
      ( v119(VarCurr)
    <=> v121(VarCurr) ) )).

fof(addCaseBooleanConditionEqualRanges1,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( ~ v200(VarNext)
       => ( v121(VarNext)
        <=> v121(VarCurr) ) ) ) )).

fof(addCaseBooleanConditionEqualRanges0,axiom,(
    ! [VarNext] :
      ( v200(VarNext)
     => ( v121(VarNext)
      <=> v210(VarNext) ) ) )).

fof(addAssignment_29,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( v210(VarNext)
      <=> v208(VarCurr) ) ) )).

fof(aaddConditionBooleanCondEqualRangesElseBranch_1,axiom,(
    ! [VarCurr] :
      ( ~ v211(VarCurr)
     => ( v208(VarCurr)
      <=> v127(VarCurr) ) ) )).

fof(addConditionBooleanCondEqualRangesThenBranch_1,axiom,(
    ! [VarCurr] :
      ( v211(VarCurr)
     => ( v208(VarCurr)
      <=> $false ) ) )).

fof(writeUnaryOperator_2,axiom,(
    ! [VarCurr] :
      ( ~ v211(VarCurr)
    <=> v123(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_8,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( v200(VarNext)
      <=> v201(VarNext) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_7,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( v201(VarNext)
      <=> ( v202(VarNext)
          & v193(VarNext) ) ) ) )).

fof(writeUnaryOperator_1,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( ~ v202(VarNext)
      <=> v204(VarNext) ) ) )).

fof(addAssignment_28,axiom,(
    ! [VarNext,VarCurr] :
      ( nextState(VarCurr,VarNext)
     => ( v204(VarNext)
      <=> v193(VarCurr) ) ) )).

fof(addAssignment_27,axiom,(
    ! [VarCurr] :
      ( v193(VarCurr)
    <=> v195(VarCurr) ) )).

fof(addAssignment_26,axiom,(
    ! [VarCurr] :
      ( v195(VarCurr)
    <=> v197(VarCurr) ) )).

fof(addAssignment_25,axiom,(
    ! [VarCurr] :
      ( v197(VarCurr)
    <=> v1(VarCurr) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_6,axiom,(
    ! [VarCurr] :
      ( v127(VarCurr)
    <=> ( v190(VarCurr)
        & v178(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_5,axiom,(
    ! [VarCurr] :
      ( v190(VarCurr)
    <=> ( v191(VarCurr)
        & v139(VarCurr) ) ) )).

fof(writeUnaryOperator,axiom,(
    ! [VarCurr] :
      ( ~ v191(VarCurr)
    <=> v129(VarCurr) ) )).

fof(addAssignment_24,axiom,(
    ! [VarCurr] :
      ( v178(VarCurr)
    <=> v180(VarCurr) ) )).

fof(addAssignment_23,axiom,(
    ! [VarCurr] :
      ( v180(VarCurr)
    <=> v182(VarCurr) ) )).

fof(writeBinaryOperatorShiftedRanges_1,axiom,(
    ! [VarCurr] :
      ( v182(VarCurr)
    <=> ( v187(VarCurr)
        | v184(VarCurr,bitIndex2) ) ) )).

fof(writeBinaryOperatorShiftedRanges,axiom,(
    ! [VarCurr] :
      ( v187(VarCurr)
    <=> ( v184(VarCurr,bitIndex0)
        | v184(VarCurr,bitIndex1) ) ) )).

fof(addAssignmentInitValueVector_2,axiom,(
    ! [B] :
      ( range_2_0(B)
     => ( v184(constB0,B)
      <=> $true ) ) )).

fof(range_axiom_4,axiom,(
    ! [B] :
      ( range_2_0(B)
    <=> ( $false
        | bitIndex0 = B
        | bitIndex1 = B
        | bitIndex2 = B ) ) )).

fof(bitBlastConstant_46,axiom,(
    b111(bitIndex2) )).

fof(bitBlastConstant_45,axiom,(
    b111(bitIndex1) )).

fof(bitBlastConstant_44,axiom,(
    b111(bitIndex0) )).

fof(addAssignment_22,axiom,(
    ! [VarCurr] :
      ( v139(VarCurr)
    <=> v141(VarCurr) ) )).

fof(addAssignment_21,axiom,(
    ! [VarCurr] :
      ( v141(VarCurr)
    <=> v143(VarCurr) ) )).

fof(aaddConditionBooleanCondEqualRangesElseBranch,axiom,(
    ! [VarCurr] :
      ( ~ v167(VarCurr)
     => ( v143(VarCurr)
      <=> $false ) ) )).

fof(addConditionBooleanCondEqualRangesThenBranch,axiom,(
    ! [VarCurr] :
      ( v167(VarCurr)
     => ( v143(VarCurr)
      <=> $true ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_4,axiom,(
    ! [VarCurr] :
      ( v167(VarCurr)
    <=> ( v168(VarCurr)
        | v176(VarCurr) ) ) )).

fof(addBitVectorEqualityBitBlasted_5,axiom,(
    ! [VarCurr] :
      ( v176(VarCurr)
    <=> ( ( v158(VarCurr,bitIndex6)
        <=> $false )
        & ( v158(VarCurr,bitIndex5)
        <=> $false )
        & ( v158(VarCurr,bitIndex4)
        <=> $false )
        & ( v158(VarCurr,bitIndex3)
        <=> $true )
        & ( v158(VarCurr,bitIndex2)
        <=> $false )
        & ( v158(VarCurr,bitIndex1)
        <=> $false )
        & ( v158(VarCurr,bitIndex0)
        <=> $true ) ) ) )).

fof(bitBlastConstant_43,axiom,(
    ~ b0001001(bitIndex6) )).

fof(bitBlastConstant_42,axiom,(
    ~ b0001001(bitIndex5) )).

fof(bitBlastConstant_41,axiom,(
    ~ b0001001(bitIndex4) )).

fof(bitBlastConstant_40,axiom,(
    b0001001(bitIndex3) )).

fof(bitBlastConstant_39,axiom,(
    ~ b0001001(bitIndex2) )).

fof(bitBlastConstant_38,axiom,(
    ~ b0001001(bitIndex1) )).

fof(bitBlastConstant_37,axiom,(
    b0001001(bitIndex0) )).

fof(writeBinaryOperatorEqualRangesSingleBits_3,axiom,(
    ! [VarCurr] :
      ( v168(VarCurr)
    <=> ( v169(VarCurr)
        | v173(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits_2,axiom,(
    ! [VarCurr] :
      ( v173(VarCurr)
    <=> ( v174(VarCurr)
        | v175(VarCurr) ) ) )).

fof(addBitVectorEqualityBitBlasted_4,axiom,(
    ! [VarCurr] :
      ( v175(VarCurr)
    <=> ( ( v158(VarCurr,bitIndex6)
        <=> $false )
        & ( v158(VarCurr,bitIndex5)
        <=> $true )
        & ( v158(VarCurr,bitIndex4)
        <=> $false )
        & ( v158(VarCurr,bitIndex3)
        <=> $false )
        & ( v158(VarCurr,bitIndex2)
        <=> $false )
        & ( v158(VarCurr,bitIndex1)
        <=> $false )
        & ( v158(VarCurr,bitIndex0)
        <=> $true ) ) ) )).

fof(bitBlastConstant_36,axiom,(
    ~ b0100001(bitIndex6) )).

fof(bitBlastConstant_35,axiom,(
    b0100001(bitIndex5) )).

fof(bitBlastConstant_34,axiom,(
    ~ b0100001(bitIndex4) )).

fof(bitBlastConstant_33,axiom,(
    ~ b0100001(bitIndex3) )).

fof(bitBlastConstant_32,axiom,(
    ~ b0100001(bitIndex2) )).

fof(bitBlastConstant_31,axiom,(
    ~ b0100001(bitIndex1) )).

fof(bitBlastConstant_30,axiom,(
    b0100001(bitIndex0) )).

fof(addBitVectorEqualityBitBlasted_3,axiom,(
    ! [VarCurr] :
      ( v174(VarCurr)
    <=> ( ( v158(VarCurr,bitIndex6)
        <=> $false )
        & ( v158(VarCurr,bitIndex5)
        <=> $false )
        & ( v158(VarCurr,bitIndex4)
        <=> $false )
        & ( v158(VarCurr,bitIndex3)
        <=> $false )
        & ( v158(VarCurr,bitIndex2)
        <=> $false )
        & ( v158(VarCurr,bitIndex1)
        <=> $false )
        & ( v158(VarCurr,bitIndex0)
        <=> $true ) ) ) )).

fof(bitBlastConstant_29,axiom,(
    ~ b0000001(bitIndex6) )).

fof(bitBlastConstant_28,axiom,(
    ~ b0000001(bitIndex5) )).

fof(bitBlastConstant_27,axiom,(
    ~ b0000001(bitIndex4) )).

fof(bitBlastConstant_26,axiom,(
    ~ b0000001(bitIndex3) )).

fof(bitBlastConstant_25,axiom,(
    ~ b0000001(bitIndex2) )).

fof(bitBlastConstant_24,axiom,(
    ~ b0000001(bitIndex1) )).

fof(bitBlastConstant_23,axiom,(
    b0000001(bitIndex0) )).

fof(writeBinaryOperatorEqualRangesSingleBits_1,axiom,(
    ! [VarCurr] :
      ( v169(VarCurr)
    <=> ( v145(VarCurr,bitIndex0)
        & v170(VarCurr) ) ) )).

fof(writeBinaryOperatorEqualRangesSingleBits,axiom,(
    ! [VarCurr] :
      ( v170(VarCurr)
    <=> ( v171(VarCurr)
        | v172(VarCurr) ) ) )).

fof(addBitVectorEqualityBitBlasted_2,axiom,(
    ! [VarCurr] :
      ( v172(VarCurr)
    <=> ( ( v158(VarCurr,bitIndex6)
        <=> $false )
        & ( v158(VarCurr,bitIndex5)
        <=> $true )
        & ( v158(VarCurr,bitIndex4)
        <=> $false )
        & ( v158(VarCurr,bitIndex3)
        <=> $false )
        & ( v158(VarCurr,bitIndex2)
        <=> $false )
        & ( v158(VarCurr,bitIndex1)
        <=> $false )
        & ( v158(VarCurr,bitIndex0)
        <=> $false ) ) ) )).

fof(bitBlastConstant_22,axiom,(
    ~ b0100000(bitIndex6) )).

fof(bitBlastConstant_21,axiom,(
    b0100000(bitIndex5) )).

fof(bitBlastConstant_20,axiom,(
    ~ b0100000(bitIndex4) )).

fof(bitBlastConstant_19,axiom,(
    ~ b0100000(bitIndex3) )).

fof(bitBlastConstant_18,axiom,(
    ~ b0100000(bitIndex2) )).

fof(bitBlastConstant_17,axiom,(
    ~ b0100000(bitIndex1) )).

fof(bitBlastConstant_16,axiom,(
    ~ b0100000(bitIndex0) )).

fof(addBitVectorEqualityBitBlasted_1,axiom,(
    ! [VarCurr] :
      ( v171(VarCurr)
    <=> ( ( v158(VarCurr,bitIndex6)
        <=> $false )
        & ( v158(VarCurr,bitIndex5)
        <=> $false )
        & ( v158(VarCurr,bitIndex4)
        <=> $false )
        & ( v158(VarCurr,bitIndex3)
        <=> $false )
        & ( v158(VarCurr,bitIndex2)
        <=> $false )
        & ( v158(VarCurr,bitIndex1)
        <=> $false )
        & ( v158(VarCurr,bitIndex0)
        <=> $false ) ) ) )).

fof(bitBlastConstant_15,axiom,(
    ~ b0000000(bitIndex6) )).

fof(bitBlastConstant_14,axiom,(
    ~ b0000000(bitIndex5) )).

fof(bitBlastConstant_13,axiom,(
    ~ b0000000(bitIndex4) )).

fof(bitBlastConstant_12,axiom,(
    ~ b0000000(bitIndex3) )).

fof(bitBlastConstant_11,axiom,(
    ~ b0000000(bitIndex2) )).

fof(bitBlastConstant_10,axiom,(
    ~ b0000000(bitIndex1) )).

fof(bitBlastConstant_9,axiom,(
    ~ b0000000(bitIndex0) )).

fof(addAssignment_20,axiom,(
    ! [VarCurr,B] :
      ( range_6_0(B)
     => ( v158(VarCurr,B)
      <=> v160(VarCurr,B) ) ) )).

fof(range_axiom_3,axiom,(
    ! [B] :
      ( range_6_0(B)
    <=> ( $false
        | bitIndex0 = B
        | bitIndex1 = B
        | bitIndex2 = B
        | bitIndex3 = B
        | bitIndex4 = B
        | bitIndex5 = B
        | bitIndex6 = B ) ) )).

fof(addAssignment_19,axiom,(
    ! [VarCurr] :
      ( ( v160(VarCurr,bitIndex6)
      <=> v149(VarCurr,bitIndex60) )
      & ( v160(VarCurr,bitIndex5)
      <=> v149(VarCurr,bitIndex59) )
      & ( v160(VarCurr,bitIndex4)
      <=> v149(VarCurr,bitIndex58) )
      & ( v160(VarCurr,bitIndex3)
      <=> v149(VarCurr,bitIndex57) )
      & ( v160(VarCurr,bitIndex2)
      <=> v149(VarCurr,bitIndex56) )
      & ( v160(VarCurr,bitIndex1)
      <=> v149(VarCurr,bitIndex55) )
      & ( v160(VarCurr,bitIndex0)
      <=> v149(VarCurr,bitIndex54) ) ) )).

fof(addAssignment_18,axiom,(
    ! [VarCurr,B] :
      ( range_60_54(B)
     => ( v149(VarCurr,B)
      <=> v151(VarCurr,B) ) ) )).

fof(addAssignment_17,axiom,(
    ! [VarCurr,B] :
      ( range_60_54(B)
     => ( v151(VarCurr,B)
      <=> v156(VarCurr,B) ) ) )).

fof(range_axiom_2,axiom,(
    ! [B] :
      ( range_60_54(B)
    <=> ( $false
        | bitIndex54 = B
        | bitIndex55 = B
        | bitIndex56 = B
        | bitIndex57 = B
        | bitIndex58 = B
        | bitIndex59 = B
        | bitIndex60 = B ) ) )).

fof(addAssignment_16,axiom,(
    ! [VarCurr] :
      ( v145(VarCurr,bitIndex0)
    <=> v147(VarCurr,bitIndex0) ) )).

fof(addAssignment_15,axiom,(
    ! [VarCurr] :
      ( v147(VarCurr,bitIndex0)
    <=> v149(VarCurr,bitIndex12) ) )).

fof(addAssignment_14,axiom,(
    ! [VarCurr] :
      ( v149(VarCurr,bitIndex12)
    <=> v151(VarCurr,bitIndex12) ) )).

fof(addAssignment_13,axiom,(
    ! [VarCurr] :
      ( v151(VarCurr,bitIndex12)
    <=> v156(VarCurr,bitIndex12) ) )).

fof(addAssignmentInitValueVector_1,axiom,(
    ! [B] :
      ( range_3_0(B)
     => ( v155(constB0,B)
      <=> $false ) ) )).

fof(range_axiom_1,axiom,(
    ! [B] :
      ( range_3_0(B)
    <=> ( $false
        | bitIndex0 = B
        | bitIndex1 = B
        | bitIndex2 = B
        | bitIndex3 = B ) ) )).

fof(bitBlastConstant_8,axiom,(
    ~ b0000(bitIndex3) )).

fof(bitBlastConstant_7,axiom,(
    ~ b0000(bitIndex2) )).

fof(bitBlastConstant_6,axiom,(
    ~ b0000(bitIndex1) )).

fof(bitBlastConstant_5,axiom,(
    ~ b0000(bitIndex0) )).

fof(addAssignment_12,axiom,(
    ! [VarCurr] :
      ( v129(VarCurr)
    <=> v131(VarCurr) ) )).

fof(addAssignment_11,axiom,(
    ! [VarCurr] :
      ( v131(VarCurr)
    <=> v133(VarCurr) ) )).

fof(addBitVectorEqualityBitBlasted,axiom,(
    ! [VarCurr] :
      ( v133(VarCurr)
    <=> ( ( v135(VarCurr,bitIndex4)
        <=> $false )
        & ( v135(VarCurr,bitIndex3)
        <=> $false )
        & ( v135(VarCurr,bitIndex2)
        <=> $false )
        & ( v135(VarCurr,bitIndex1)
        <=> $false )
        & ( v135(VarCurr,bitIndex0)
        <=> $false ) ) ) )).

fof(addAssignmentInitValueVector,axiom,(
    ! [B] :
      ( range_4_0(B)
     => ( v135(constB0,B)
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

fof(bitBlastConstant_4,axiom,(
    ~ b00000(bitIndex4) )).

fof(bitBlastConstant_3,axiom,(
    ~ b00000(bitIndex3) )).

fof(bitBlastConstant_2,axiom,(
    ~ b00000(bitIndex2) )).

fof(bitBlastConstant_1,axiom,(
    ~ b00000(bitIndex1) )).

fof(bitBlastConstant,axiom,(
    ~ b00000(bitIndex0) )).

fof(addAssignment_10,axiom,(
    ! [VarCurr] :
      ( v123(VarCurr)
    <=> v125(VarCurr) ) )).

fof(addAssignment_9,axiom,(
    ! [VarCurr] :
      ( v125(VarCurr)
    <=> v14(VarCurr) ) )).

fof(addAssignment_8,axiom,(
    ! [VarCurr] :
      ( v58(VarCurr)
    <=> v60(VarCurr) ) )).

fof(addAssignment_7,axiom,(
    ! [VarCurr] :
      ( v60(VarCurr)
    <=> v62(VarCurr) ) )).

fof(addAssignment_6,axiom,(
    ! [VarCurr] :
      ( v62(VarCurr)
    <=> v64(VarCurr) ) )).

fof(addAssignment_5,axiom,(
    ! [VarCurr] :
      ( v64(VarCurr)
    <=> v16(VarCurr) ) )).

fof(addAssignment_4,axiom,(
    ! [VarCurr] :
      ( v33(VarCurr)
    <=> v12(VarCurr) ) )).

fof(addAssignment_3,axiom,(
    ! [VarCurr] :
      ( v10(VarCurr)
    <=> v12(VarCurr) ) )).

fof(addAssignment_2,axiom,(
    ! [VarCurr] :
      ( v12(VarCurr)
    <=> v14(VarCurr) ) )).

fof(addAssignment_1,axiom,(
    ! [VarCurr] :
      ( v14(VarCurr)
    <=> v16(VarCurr) ) )).

fof(addAssignment,axiom,(
    ! [VarCurr] :
      ( v16(VarCurr)
    <=> v18(VarCurr) ) )).

%------------------------------------------------------------------------------
