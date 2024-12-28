; ModuleID = 'C:/Users/lions/Desktop/Github/ERTS_Project_E24/Eq/Biquadv2Between/solution1/.autopilot/db/a.o.2.bc'
target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-f80:128:128-v64:64:64-v128:128:128-a0:0:64-f80:32:32-n8:16:32-S32"
target triple = "i686-pc-mingw32"

@llvm_global_ctors_1 = appending global [1 x void ()*] [void ()* @_GLOBAL__I_a]
@llvm_global_ctors_0 = appending global [1 x i32] [i32 65535]
@biquadv2between_str = internal unnamed_addr constant [16 x i8] c"biquadv2between\00"
@array_r = internal global [15 x i27] zeroinitializer
@p_str8 = private unnamed_addr constant [16 x i8] c"LOOP_PROCESSING\00", align 1
@p_str5 = private unnamed_addr constant [13 x i8] c"ap_ctrl_none\00", align 1
@p_str4 = private unnamed_addr constant [9 x i8] c"biquadv2\00", align 1
@p_str3 = private unnamed_addr constant [10 x i8] c"s_axilite\00", align 1
@p_str2 = private unnamed_addr constant [6 x i8] c"ap_hs\00", align 1
@p_str1 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@p_str = private unnamed_addr constant [4 x i8] c"mul\00", align 1

declare i51 @llvm.part.select.i51(i51, i32, i32) nounwind readnone

declare void @llvm.dbg.value(metadata, i64, metadata) nounwind readnone

define void @biquadv2between(i27 %b0_a0_V, i27 %b1_a0_V, i27 %b2_a0_V, i27 %a1_a0_V, i27 %a2_a0_V, i24 %inDataLeft_V, i24 %inDataRight_V, i24* %outDataLeft_V, i24* %outDataRight_V) {
.preheader192.preheader:
  call void (...)* @_ssdm_op_SpecBitsMap(i27 %b0_a0_V), !map !90
  call void (...)* @_ssdm_op_SpecBitsMap(i27 %b1_a0_V), !map !96
  call void (...)* @_ssdm_op_SpecBitsMap(i27 %b2_a0_V), !map !100
  call void (...)* @_ssdm_op_SpecBitsMap(i27 %a1_a0_V), !map !104
  call void (...)* @_ssdm_op_SpecBitsMap(i27 %a2_a0_V), !map !108
  call void (...)* @_ssdm_op_SpecBitsMap(i24 %inDataLeft_V), !map !112
  call void (...)* @_ssdm_op_SpecBitsMap(i24 %inDataRight_V), !map !116
  call void (...)* @_ssdm_op_SpecBitsMap(i24* %outDataLeft_V), !map !120
  call void (...)* @_ssdm_op_SpecBitsMap(i24* %outDataRight_V), !map !124
  call void (...)* @_ssdm_op_SpecTopModule([16 x i8]* @biquadv2between_str) nounwind
  %inDataRight_V_read = call i24 @_ssdm_op_Read.ap_hs.i24(i24 %inDataRight_V)
  %inDataLeft_V_read = call i24 @_ssdm_op_Read.ap_hs.i24(i24 %inDataLeft_V)
  %a2_a0_V_read = call i27 @_ssdm_op_Read.s_axilite.i27(i27 %a2_a0_V)
  %a1_a0_V_read = call i27 @_ssdm_op_Read.s_axilite.i27(i27 %a1_a0_V)
  %b2_a0_V_read = call i27 @_ssdm_op_Read.s_axilite.i27(i27 %b2_a0_V)
  %b1_a0_V_read = call i27 @_ssdm_op_Read.s_axilite.i27(i27 %b1_a0_V)
  %b0_a0_V_read = call i27 @_ssdm_op_Read.s_axilite.i27(i27 %b0_a0_V)
  call void (...)* @_ssdm_op_SpecResourceLimit(i32 1, [4 x i8]* @p_str, [1 x i8]* @p_str1, [1 x i8]* @p_str1, [1 x i8]* @p_str1) nounwind
  call void (...)* @_ssdm_op_SpecInterface(i24 %inDataLeft_V, [6 x i8]* @p_str2, i32 0, i32 0, [1 x i8]* @p_str1, i32 0, i32 0, [1 x i8]* @p_str1, [1 x i8]* @p_str1, [1 x i8]* @p_str1, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str1, [1 x i8]* @p_str1) nounwind
  call void (...)* @_ssdm_op_SpecInterface(i24 %inDataRight_V, [6 x i8]* @p_str2, i32 0, i32 0, [1 x i8]* @p_str1, i32 0, i32 0, [1 x i8]* @p_str1, [1 x i8]* @p_str1, [1 x i8]* @p_str1, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str1, [1 x i8]* @p_str1) nounwind
  call void (...)* @_ssdm_op_SpecInterface(i24* %outDataLeft_V, [6 x i8]* @p_str2, i32 0, i32 0, [1 x i8]* @p_str1, i32 0, i32 0, [1 x i8]* @p_str1, [1 x i8]* @p_str1, [1 x i8]* @p_str1, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str1, [1 x i8]* @p_str1) nounwind
  call void (...)* @_ssdm_op_SpecInterface(i24* %outDataRight_V, [6 x i8]* @p_str2, i32 0, i32 0, [1 x i8]* @p_str1, i32 0, i32 0, [1 x i8]* @p_str1, [1 x i8]* @p_str1, [1 x i8]* @p_str1, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str1, [1 x i8]* @p_str1) nounwind
  call void (...)* @_ssdm_op_SpecInterface(i27 %b0_a0_V, [10 x i8]* @p_str3, i32 0, i32 0, [1 x i8]* @p_str1, i32 0, i32 0, [9 x i8]* @p_str4, [1 x i8]* @p_str1, [1 x i8]* @p_str1, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str1, [1 x i8]* @p_str1) nounwind
  call void (...)* @_ssdm_op_SpecInterface(i27 %b1_a0_V, [10 x i8]* @p_str3, i32 0, i32 0, [1 x i8]* @p_str1, i32 0, i32 0, [9 x i8]* @p_str4, [1 x i8]* @p_str1, [1 x i8]* @p_str1, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str1, [1 x i8]* @p_str1) nounwind
  call void (...)* @_ssdm_op_SpecInterface(i27 %b2_a0_V, [10 x i8]* @p_str3, i32 0, i32 0, [1 x i8]* @p_str1, i32 0, i32 0, [9 x i8]* @p_str4, [1 x i8]* @p_str1, [1 x i8]* @p_str1, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str1, [1 x i8]* @p_str1) nounwind
  call void (...)* @_ssdm_op_SpecInterface(i27 %a1_a0_V, [10 x i8]* @p_str3, i32 0, i32 0, [1 x i8]* @p_str1, i32 0, i32 0, [9 x i8]* @p_str4, [1 x i8]* @p_str1, [1 x i8]* @p_str1, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str1, [1 x i8]* @p_str1) nounwind
  call void (...)* @_ssdm_op_SpecInterface(i27 %a2_a0_V, [10 x i8]* @p_str3, i32 0, i32 0, [1 x i8]* @p_str1, i32 0, i32 0, [9 x i8]* @p_str4, [1 x i8]* @p_str1, [1 x i8]* @p_str1, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str1, [1 x i8]* @p_str1) nounwind
  call void (...)* @_ssdm_op_SpecInterface(i32 0, [13 x i8]* @p_str5, i32 0, i32 0, [1 x i8]* @p_str1, i32 0, i32 0, [1 x i8]* @p_str1, [1 x i8]* @p_str1, [1 x i8]* @p_str1, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str1, [1 x i8]* @p_str1) nounwind
  store i27 %b0_a0_V_read, i27* getelementptr inbounds ([15 x i27]* @array_r, i32 0, i32 0), align 16
  store i27 %b1_a0_V_read, i27* getelementptr inbounds ([15 x i27]* @array_r, i32 0, i32 1), align 4
  store i27 %b2_a0_V_read, i27* getelementptr inbounds ([15 x i27]* @array_r, i32 0, i32 2), align 8
  store i27 %a1_a0_V_read, i27* getelementptr inbounds ([15 x i27]* @array_r, i32 0, i32 3), align 4
  store i27 %a2_a0_V_read, i27* getelementptr inbounds ([15 x i27]* @array_r, i32 0, i32 4), align 16
  %inDataLeft_V_trunc = zext i24 %inDataLeft_V_read to i27
  store i27 %inDataLeft_V_trunc, i27* getelementptr inbounds ([15 x i27]* @array_r, i32 0, i32 5), align 4
  %inDataRight_V_trunc = zext i24 %inDataRight_V_read to i27
  store i27 %inDataRight_V_trunc, i27* getelementptr inbounds ([15 x i27]* @array_r, i32 0, i32 10), align 8
  br label %0

; <label>:0                                       ; preds = %_ifconv, %.preheader192.preheader
  %p_Val2_5 = phi i24 [ 0, %.preheader192.preheader ], [ %resultRight_V, %_ifconv ]
  %p_Val2_s = phi i24 [ 0, %.preheader192.preheader ], [ %resultLeft_V, %_ifconv ]
  %p_s = phi i3 [ 0, %.preheader192.preheader ], [ %i_V, %_ifconv ]
  %tmp_2 = icmp eq i3 %p_s, -3
  %empty = call i32 (...)* @_ssdm_op_SpecLoopTripCount(i64 5, i64 5, i64 5)
  %i_V = add i3 %p_s, 1
  br i1 %tmp_2, label %1, label %_ifconv

_ifconv:                                          ; preds = %0
  call void (...)* @_ssdm_op_SpecLoopName([16 x i8]* @p_str8) nounwind
  %tmp_3 = zext i3 %p_s to i32
  %tmp_3_cast = zext i3 %p_s to i4
  %array_addr = getelementptr [15 x i27]* @array_r, i32 0, i32 %tmp_3
  %array_load_4 = load i27* %array_addr, align 4
  %OP1_V = sext i27 %array_load_4 to i51
  %addr5 = add i4 5, %tmp_3_cast
  %addr5_cast = zext i4 %addr5 to i32
  %array_addr_1 = getelementptr [15 x i27]* @array_r, i32 0, i32 %addr5_cast
  %array_load_5 = load i27* %array_addr_1, align 4
  %tmp_20 = trunc i27 %array_load_5 to i24
  %OP2_V = sext i24 %tmp_20 to i51
  %p_Val2_1 = mul nsw i51 %OP1_V, %OP2_V
  %tmp_8 = call i48 @_ssdm_op_BitConcatenate.i48.i24.i24(i24 %p_Val2_s, i24 0)
  %tmp_8_cast = sext i48 %tmp_8 to i51
  %p_Val2_2 = add i51 %tmp_8_cast, %p_Val2_1
  %signbit = call i1 @_ssdm_op_BitSelect.i1.i51.i32(i51 %p_Val2_2, i32 50)
  %p_Val2_3 = call i24 @_ssdm_op_PartSelect.i24.i51.i32.i32(i51 %p_Val2_2, i32 24, i32 47)
  %tmp_22 = call i1 @_ssdm_op_BitSelect.i1.i51.i32(i51 %p_Val2_1, i32 23)
  %tmp_5 = zext i1 %tmp_22 to i24
  %tmp_23 = call i1 @_ssdm_op_BitSelect.i1.i51.i32(i51 %p_Val2_2, i32 47)
  %p_Val2_4 = add i24 %p_Val2_3, %tmp_5
  %newsignbit = call i1 @_ssdm_op_BitSelect.i1.i24.i32(i24 %p_Val2_4, i32 23)
  %tmp_s = xor i1 %newsignbit, true
  %carry = and i1 %tmp_23, %tmp_s
  %tmp_25 = call i1 @_ssdm_op_BitSelect.i1.i51.i32(i51 %p_Val2_2, i32 48)
  %tmp_6 = call i2 @_ssdm_op_PartSelect.i2.i51.i32.i32(i51 %p_Val2_2, i32 49, i32 50)
  %Range2_all_ones = icmp eq i2 %tmp_6, -1
  %tmp_7 = call i3 @_ssdm_op_PartSelect.i3.i51.i32.i32(i51 %p_Val2_2, i32 48, i32 50)
  %Range1_all_ones = icmp eq i3 %tmp_7, -1
  %Range1_all_zeros = icmp eq i3 %tmp_7, 0
  %deleted_zeros = select i1 %carry, i1 %Range1_all_ones, i1 %Range1_all_zeros
  %tmp_1 = xor i1 %tmp_25, true
  %p_41_i_i = and i1 %Range2_all_ones, %tmp_1
  %deleted_ones = select i1 %carry, i1 %p_41_i_i, i1 %Range1_all_ones
  %p_38_i_i = and i1 %carry, %Range1_all_ones
  %p_not_i_i = xor i1 %deleted_zeros, true
  %brmerge_i_i = or i1 %newsignbit, %p_not_i_i
  %tmp_9 = xor i1 %signbit, true
  %overflow = and i1 %brmerge_i_i, %tmp_9
  %brmerge40_demorgan_i = and i1 %newsignbit, %deleted_ones
  %tmp_demorgan = or i1 %p_38_i_i, %brmerge40_demorgan_i
  %tmp = xor i1 %tmp_demorgan, true
  %underflow = and i1 %signbit, %tmp
  %brmerge_i_i_i = or i1 %underflow, %overflow
  %tmp1 = or i1 %brmerge40_demorgan_i, %tmp_9
  %underflow_not = or i1 %tmp1, %p_38_i_i
  %p_Val2_4_mux = select i1 %brmerge_i_i_i, i24 8388607, i24 %p_Val2_4
  %p_Val2_4_4 = select i1 %underflow, i24 -8388608, i24 %p_Val2_4
  %resultLeft_V = select i1 %underflow_not, i24 %p_Val2_4_mux, i24 %p_Val2_4_4
  %addr1 = add i4 -6, %tmp_3_cast
  %addr1_cast = zext i4 %addr1 to i32
  %array_addr_2 = getelementptr [15 x i27]* @array_r, i32 0, i32 %addr1_cast
  %array_load_6 = load i27* %array_addr_2, align 4
  %tmp_26 = trunc i27 %array_load_6 to i24
  %OP2_V_1 = sext i24 %tmp_26 to i51
  %p_Val2_6 = mul nsw i51 %OP1_V, %OP2_V_1
  %tmp_10 = call i48 @_ssdm_op_BitConcatenate.i48.i24.i24(i24 %p_Val2_5, i24 0)
  %tmp_13_cast = sext i48 %tmp_10 to i51
  %p_Val2_7 = add i51 %tmp_13_cast, %p_Val2_6
  %signbit_1 = call i1 @_ssdm_op_BitSelect.i1.i51.i32(i51 %p_Val2_7, i32 50)
  %p_Val2_8 = call i24 @_ssdm_op_PartSelect.i24.i51.i32.i32(i51 %p_Val2_7, i32 24, i32 47)
  %tmp_28 = call i1 @_ssdm_op_BitSelect.i1.i51.i32(i51 %p_Val2_6, i32 23)
  %tmp_11 = zext i1 %tmp_28 to i24
  %tmp_29 = call i1 @_ssdm_op_BitSelect.i1.i51.i32(i51 %p_Val2_7, i32 47)
  %p_Val2_9 = add i24 %p_Val2_8, %tmp_11
  %newsignbit_1 = call i1 @_ssdm_op_BitSelect.i1.i24.i32(i24 %p_Val2_9, i32 23)
  %tmp_12 = xor i1 %newsignbit_1, true
  %carry_1 = and i1 %tmp_29, %tmp_12
  %tmp_31 = call i1 @_ssdm_op_BitSelect.i1.i51.i32(i51 %p_Val2_7, i32 48)
  %tmp_13 = call i2 @_ssdm_op_PartSelect.i2.i51.i32.i32(i51 %p_Val2_7, i32 49, i32 50)
  %Range2_all_ones_1 = icmp eq i2 %tmp_13, -1
  %tmp_14 = call i3 @_ssdm_op_PartSelect.i3.i51.i32.i32(i51 %p_Val2_7, i32 48, i32 50)
  %Range1_all_ones_1 = icmp eq i3 %tmp_14, -1
  %Range1_all_zeros_1 = icmp eq i3 %tmp_14, 0
  %deleted_zeros_1 = select i1 %carry_1, i1 %Range1_all_ones_1, i1 %Range1_all_zeros_1
  %tmp_15 = xor i1 %tmp_31, true
  %p_41_i_i1 = and i1 %Range2_all_ones_1, %tmp_15
  %deleted_ones_1 = select i1 %carry_1, i1 %p_41_i_i1, i1 %Range1_all_ones_1
  %p_38_i_i1 = and i1 %carry_1, %Range1_all_ones_1
  %p_not_i_i1 = xor i1 %deleted_zeros_1, true
  %brmerge_i_i1 = or i1 %newsignbit_1, %p_not_i_i1
  %tmp_16 = xor i1 %signbit_1, true
  %overflow_1 = and i1 %brmerge_i_i1, %tmp_16
  %brmerge40_demorgan_i_1 = and i1 %newsignbit_1, %deleted_ones_1
  %tmp2_demorgan = or i1 %p_38_i_i1, %brmerge40_demorgan_i_1
  %tmp2 = xor i1 %tmp2_demorgan, true
  %underflow_1 = and i1 %signbit_1, %tmp2
  %brmerge_i_i_i1 = or i1 %underflow_1, %overflow_1
  %tmp3 = or i1 %brmerge40_demorgan_i_1, %tmp_16
  %underflow_1_not = or i1 %tmp3, %p_38_i_i1
  %p_Val2_9_mux = select i1 %brmerge_i_i_i1, i24 8388607, i24 %p_Val2_9
  %p_Val2_9_5 = select i1 %underflow_1, i24 -8388608, i24 %p_Val2_9
  %resultRight_V = select i1 %underflow_1_not, i24 %p_Val2_9_mux, i24 %p_Val2_9_5
  br label %0

; <label>:1                                       ; preds = %0
  %array_load = load i27* getelementptr inbounds ([15 x i27]* @array_r, i32 0, i32 8), align 16
  %tmp_4 = trunc i27 %array_load to i24
  %samples_V_load11_tru = zext i24 %tmp_4 to i27
  store i27 %samples_V_load11_tru, i27* getelementptr inbounds ([15 x i27]* @array_r, i32 0, i32 9), align 4
  %p_Val2_trunc = zext i24 %p_Val2_s to i27
  store i27 %p_Val2_trunc, i27* getelementptr inbounds ([15 x i27]* @array_r, i32 0, i32 8), align 16
  %array_load_1 = load i27* getelementptr inbounds ([15 x i27]* @array_r, i32 0, i32 6), align 8
  %tmp_17 = trunc i27 %array_load_1 to i24
  %samples_V_load_114_t = zext i24 %tmp_17 to i27
  store i27 %samples_V_load_114_t, i27* getelementptr inbounds ([15 x i27]* @array_r, i32 0, i32 7), align 4
  store i27 %inDataLeft_V_trunc, i27* getelementptr inbounds ([15 x i27]* @array_r, i32 0, i32 6), align 8
  %array_load_2 = load i27* getelementptr inbounds ([15 x i27]* @array_r, i32 0, i32 13), align 4
  %tmp_18 = trunc i27 %array_load_2 to i24
  %samples_V_load_217_t = zext i24 %tmp_18 to i27
  store i27 %samples_V_load_217_t, i27* getelementptr inbounds ([15 x i27]* @array_r, i32 0, i32 14), align 8
  %p_Val2_5_trunc = zext i24 %p_Val2_5 to i27
  store i27 %p_Val2_5_trunc, i27* getelementptr inbounds ([15 x i27]* @array_r, i32 0, i32 13), align 4
  %array_load_3 = load i27* getelementptr inbounds ([15 x i27]* @array_r, i32 0, i32 11), align 4
  %tmp_19 = trunc i27 %array_load_3 to i24
  %samples_V_load_320_t = zext i24 %tmp_19 to i27
  store i27 %samples_V_load_320_t, i27* getelementptr inbounds ([15 x i27]* @array_r, i32 0, i32 12), align 16
  store i27 %inDataRight_V_trunc, i27* getelementptr inbounds ([15 x i27]* @array_r, i32 0, i32 11), align 4
  call void @_ssdm_op_Write.ap_hs.i24P(i24* %outDataLeft_V, i24 %p_Val2_s)
  call void @_ssdm_op_Write.ap_hs.i24P(i24* %outDataRight_V, i24 %p_Val2_5)
  ret void
}

define weak void @_ssdm_op_Write.ap_hs.i24P(i24*, i24) {
entry:
  store i24 %1, i24* %0
  ret void
}

define weak void @_ssdm_op_SpecTopModule(...) {
entry:
  ret void
}

define weak void @_ssdm_op_SpecResourceLimit(...) nounwind {
entry:
  ret void
}

define weak i32 @_ssdm_op_SpecLoopTripCount(...) {
entry:
  ret i32 0
}

define weak void @_ssdm_op_SpecLoopName(...) nounwind {
entry:
  ret void
}

define weak void @_ssdm_op_SpecInterface(...) nounwind {
entry:
  ret void
}

define weak void @_ssdm_op_SpecBitsMap(...) {
entry:
  ret void
}

define weak i27 @_ssdm_op_Read.s_axilite.i27(i27) {
entry:
  ret i27 %0
}

define weak i24 @_ssdm_op_Read.ap_hs.i24(i24) {
entry:
  ret i24 %0
}

define weak i3 @_ssdm_op_PartSelect.i3.i51.i32.i32(i51, i32, i32) nounwind readnone {
entry:
  %empty = call i51 @llvm.part.select.i51(i51 %0, i32 %1, i32 %2)
  %empty_6 = trunc i51 %empty to i3
  ret i3 %empty_6
}

define weak i24 @_ssdm_op_PartSelect.i24.i51.i32.i32(i51, i32, i32) nounwind readnone {
entry:
  %empty = call i51 @llvm.part.select.i51(i51 %0, i32 %1, i32 %2)
  %empty_7 = trunc i51 %empty to i24
  ret i24 %empty_7
}

declare i24 @_ssdm_op_PartSelect.i24.i27.i32.i32(i27, i32, i32) nounwind readnone

define weak i2 @_ssdm_op_PartSelect.i2.i51.i32.i32(i51, i32, i32) nounwind readnone {
entry:
  %empty = call i51 @llvm.part.select.i51(i51 %0, i32 %1, i32 %2)
  %empty_8 = trunc i51 %empty to i2
  ret i2 %empty_8
}

define weak i1 @_ssdm_op_BitSelect.i1.i51.i32(i51, i32) nounwind readnone {
entry:
  %empty = zext i32 %1 to i51
  %empty_9 = shl i51 1, %empty
  %empty_10 = and i51 %0, %empty_9
  %empty_11 = icmp ne i51 %empty_10, 0
  ret i1 %empty_11
}

define weak i1 @_ssdm_op_BitSelect.i1.i24.i32(i24, i32) nounwind readnone {
entry:
  %empty = trunc i32 %1 to i24
  %empty_12 = shl i24 1, %empty
  %empty_13 = and i24 %0, %empty_12
  %empty_14 = icmp ne i24 %empty_13, 0
  ret i1 %empty_14
}

define weak i48 @_ssdm_op_BitConcatenate.i48.i24.i24(i24, i24) nounwind readnone {
entry:
  %empty = zext i24 %0 to i48
  %empty_15 = zext i24 %1 to i48
  %empty_16 = shl i48 %empty, 24
  %empty_17 = or i48 %empty_16, %empty_15
  ret i48 %empty_17
}

declare void @_GLOBAL__I_a() nounwind

!opencl.kernels = !{!0, !7, !7, !13, !13, !15, !21, !21, !15, !15, !23, !23, !25, !31, !15, !15, !15, !37, !39, !39, !41, !15, !21, !47, !15, !15, !15, !15, !15, !15, !48, !39, !39, !15, !51, !15, !15, !15, !53, !53, !55, !55, !15, !57, !39, !39, !15, !59, !61, !62, !63, !63, !15, !15, !65, !67, !69, !15, !15, !71, !71, !73, !75, !75, !77, !77, !79, !15, !15, !15, !81, !39, !39, !15, !15, !15, !15, !15, !15, !15}
!hls.encrypted.func = !{}
!llvm.map.gv = !{!83}

!0 = metadata !{null, metadata !1, metadata !2, metadata !3, metadata !4, metadata !5, metadata !6}
!1 = metadata !{metadata !"kernel_arg_addr_space", i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 1, i32 1}
!2 = metadata !{metadata !"kernel_arg_access_qual", metadata !"none", metadata !"none", metadata !"none", metadata !"none", metadata !"none", metadata !"none", metadata !"none", metadata !"none", metadata !"none"}
!3 = metadata !{metadata !"kernel_arg_type", metadata !"coeff_t", metadata !"coeff_t", metadata !"coeff_t", metadata !"coeff_t", metadata !"coeff_t", metadata !"inData_t", metadata !"inData_t", metadata !"outData_t*", metadata !"outData_t*"}
!4 = metadata !{metadata !"kernel_arg_type_qual", metadata !"", metadata !"", metadata !"", metadata !"", metadata !"", metadata !"", metadata !"", metadata !"", metadata !""}
!5 = metadata !{metadata !"kernel_arg_name", metadata !"b0_a0", metadata !"b1_a0", metadata !"b2_a0", metadata !"a1_a0", metadata !"a2_a0", metadata !"inDataLeft", metadata !"inDataRight", metadata !"outDataLeft", metadata !"outDataRight"}
!6 = metadata !{metadata !"reqd_work_group_size", i32 1, i32 1, i32 1}
!7 = metadata !{null, metadata !8, metadata !9, metadata !10, metadata !11, metadata !12, metadata !6}
!8 = metadata !{metadata !"kernel_arg_addr_space", i32 0}
!9 = metadata !{metadata !"kernel_arg_access_qual", metadata !"none"}
!10 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_fixed_base<51, 4, true, (enum ap_q_mode)5, (enum ap_o_mode)3, 0> &"}
!11 = metadata !{metadata !"kernel_arg_type_qual", metadata !""}
!12 = metadata !{metadata !"kernel_arg_name", metadata !"op2"}
!13 = metadata !{null, metadata !8, metadata !9, metadata !10, metadata !11, metadata !14, metadata !6}
!14 = metadata !{metadata !"kernel_arg_name", metadata !"op"}
!15 = metadata !{null, metadata !16, metadata !17, metadata !18, metadata !19, metadata !20, metadata !6}
!16 = metadata !{metadata !"kernel_arg_addr_space"}
!17 = metadata !{metadata !"kernel_arg_access_qual"}
!18 = metadata !{metadata !"kernel_arg_type"}
!19 = metadata !{metadata !"kernel_arg_type_qual"}
!20 = metadata !{metadata !"kernel_arg_name"}
!21 = metadata !{null, metadata !8, metadata !9, metadata !22, metadata !11, metadata !14, metadata !6}
!22 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_fixed_base<24, 1, true, (enum ap_q_mode)0, (enum ap_o_mode)0, 0> &"}
!23 = metadata !{null, metadata !8, metadata !9, metadata !24, metadata !11, metadata !14, metadata !6}
!24 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_fixed_base<52, 5, true, (enum ap_q_mode)5, (enum ap_o_mode)3, 0> &"}
!25 = metadata !{null, metadata !26, metadata !27, metadata !28, metadata !29, metadata !30, metadata !6}
!26 = metadata !{metadata !"kernel_arg_addr_space", i32 0, i32 0, i32 0, i32 0}
!27 = metadata !{metadata !"kernel_arg_access_qual", metadata !"none", metadata !"none", metadata !"none", metadata !"none"}
!28 = metadata !{metadata !"kernel_arg_type", metadata !"_Bool", metadata !"_Bool", metadata !"_Bool", metadata !"_Bool"}
!29 = metadata !{metadata !"kernel_arg_type_qual", metadata !"", metadata !"", metadata !"", metadata !""}
!30 = metadata !{metadata !"kernel_arg_name", metadata !"underflow", metadata !"overflow", metadata !"lD", metadata !"sign"}
!31 = metadata !{null, metadata !32, metadata !33, metadata !34, metadata !35, metadata !36, metadata !6}
!32 = metadata !{metadata !"kernel_arg_addr_space", i32 0, i32 0}
!33 = metadata !{metadata !"kernel_arg_access_qual", metadata !"none", metadata !"none"}
!34 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<52, false> &", metadata !"int"}
!35 = metadata !{metadata !"kernel_arg_type_qual", metadata !"", metadata !""}
!36 = metadata !{metadata !"kernel_arg_name", metadata !"op", metadata !"op2"}
!37 = metadata !{null, metadata !8, metadata !9, metadata !38, metadata !11, metadata !12, metadata !6}
!38 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<52, false> &"}
!39 = metadata !{null, metadata !8, metadata !9, metadata !40, metadata !11, metadata !14, metadata !6}
!40 = metadata !{metadata !"kernel_arg_type", metadata !"int"}
!41 = metadata !{null, metadata !42, metadata !43, metadata !44, metadata !45, metadata !46, metadata !6}
!42 = metadata !{metadata !"kernel_arg_addr_space", i32 0, i32 0, i32 0}
!43 = metadata !{metadata !"kernel_arg_access_qual", metadata !"none", metadata !"none", metadata !"none"}
!44 = metadata !{metadata !"kernel_arg_type", metadata !"_Bool", metadata !"_Bool", metadata !"_Bool"}
!45 = metadata !{metadata !"kernel_arg_type_qual", metadata !"", metadata !"", metadata !""}
!46 = metadata !{metadata !"kernel_arg_name", metadata !"qb", metadata !"r", metadata !"s"}
!47 = metadata !{null, metadata !8, metadata !9, metadata !22, metadata !11, metadata !12, metadata !6}
!48 = metadata !{null, metadata !32, metadata !33, metadata !49, metadata !35, metadata !50, metadata !6}
!49 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<4, false> &", metadata !"int"}
!50 = metadata !{metadata !"kernel_arg_name", metadata !"op", metadata !"i_op"}
!51 = metadata !{null, metadata !32, metadata !33, metadata !52, metadata !35, metadata !36, metadata !6}
!52 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<4, false> &", metadata !"const ap_int_base<32, true> &"}
!53 = metadata !{null, metadata !8, metadata !9, metadata !54, metadata !11, metadata !14, metadata !6}
!54 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<32, true> &"}
!55 = metadata !{null, metadata !8, metadata !9, metadata !56, metadata !11, metadata !14, metadata !6}
!56 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<4, false> &"}
!57 = metadata !{null, metadata !8, metadata !9, metadata !40, metadata !11, metadata !58, metadata !6}
!58 = metadata !{metadata !"kernel_arg_name", metadata !""}
!59 = metadata !{null, metadata !8, metadata !9, metadata !60, metadata !11, metadata !12, metadata !6}
!60 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<1, false> &"}
!61 = metadata !{null, metadata !32, metadata !33, metadata !49, metadata !35, metadata !36, metadata !6}
!62 = metadata !{null, metadata !8, metadata !9, metadata !54, metadata !11, metadata !12, metadata !6}
!63 = metadata !{null, metadata !8, metadata !9, metadata !40, metadata !11, metadata !64, metadata !6}
!64 = metadata !{metadata !"kernel_arg_name", metadata !"val"}
!65 = metadata !{null, metadata !8, metadata !9, metadata !66, metadata !11, metadata !12, metadata !6}
!66 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_uint<4> &"}
!67 = metadata !{null, metadata !8, metadata !9, metadata !68, metadata !11, metadata !14, metadata !6}
!68 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_fixed<24, 1, (enum ap_q_mode)0, (enum ap_o_mode)0, 0> &"}
!69 = metadata !{null, metadata !8, metadata !9, metadata !70, metadata !11, metadata !14, metadata !6}
!70 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_fixed<27, 3, (enum ap_q_mode)0, (enum ap_o_mode)0, 0> &"}
!71 = metadata !{null, metadata !8, metadata !9, metadata !40, metadata !11, metadata !72, metadata !6}
!72 = metadata !{metadata !"kernel_arg_name", metadata !"v"}
!73 = metadata !{null, metadata !8, metadata !9, metadata !40, metadata !11, metadata !74, metadata !6}
!74 = metadata !{metadata !"kernel_arg_name", metadata !"b"}
!75 = metadata !{null, metadata !8, metadata !9, metadata !40, metadata !11, metadata !76, metadata !6}
!76 = metadata !{metadata !"kernel_arg_name", metadata !"i_op"}
!77 = metadata !{null, metadata !8, metadata !9, metadata !78, metadata !11, metadata !14, metadata !6}
!78 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_fixed_base<32, 32, true, (enum ap_q_mode)5, (enum ap_o_mode)3, 0> &"}
!79 = metadata !{null, metadata !32, metadata !33, metadata !80, metadata !35, metadata !36, metadata !6}
!80 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<32, false> &", metadata !"int"}
!81 = metadata !{null, metadata !8, metadata !9, metadata !82, metadata !11, metadata !12, metadata !6}
!82 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<32, false> &"}
!83 = metadata !{metadata !84, [1 x i32]* @llvm_global_ctors_0}
!84 = metadata !{metadata !85}
!85 = metadata !{i32 0, i32 31, metadata !86}
!86 = metadata !{metadata !87}
!87 = metadata !{metadata !"llvm.global_ctors.0", metadata !88, metadata !"", i32 0, i32 31}
!88 = metadata !{metadata !89}
!89 = metadata !{i32 0, i32 0, i32 1}
!90 = metadata !{metadata !91}
!91 = metadata !{i32 0, i32 26, metadata !92}
!92 = metadata !{metadata !93}
!93 = metadata !{metadata !"b0_a0.V", metadata !94, metadata !"int27", i32 0, i32 26}
!94 = metadata !{metadata !95}
!95 = metadata !{i32 0, i32 0, i32 0}
!96 = metadata !{metadata !97}
!97 = metadata !{i32 0, i32 26, metadata !98}
!98 = metadata !{metadata !99}
!99 = metadata !{metadata !"b1_a0.V", metadata !94, metadata !"int27", i32 0, i32 26}
!100 = metadata !{metadata !101}
!101 = metadata !{i32 0, i32 26, metadata !102}
!102 = metadata !{metadata !103}
!103 = metadata !{metadata !"b2_a0.V", metadata !94, metadata !"int27", i32 0, i32 26}
!104 = metadata !{metadata !105}
!105 = metadata !{i32 0, i32 26, metadata !106}
!106 = metadata !{metadata !107}
!107 = metadata !{metadata !"a1_a0.V", metadata !94, metadata !"int27", i32 0, i32 26}
!108 = metadata !{metadata !109}
!109 = metadata !{i32 0, i32 26, metadata !110}
!110 = metadata !{metadata !111}
!111 = metadata !{metadata !"a2_a0.V", metadata !94, metadata !"int27", i32 0, i32 26}
!112 = metadata !{metadata !113}
!113 = metadata !{i32 0, i32 23, metadata !114}
!114 = metadata !{metadata !115}
!115 = metadata !{metadata !"inDataLeft.V", metadata !94, metadata !"int24", i32 0, i32 23}
!116 = metadata !{metadata !117}
!117 = metadata !{i32 0, i32 23, metadata !118}
!118 = metadata !{metadata !119}
!119 = metadata !{metadata !"inDataRight.V", metadata !94, metadata !"int24", i32 0, i32 23}
!120 = metadata !{metadata !121}
!121 = metadata !{i32 0, i32 23, metadata !122}
!122 = metadata !{metadata !123}
!123 = metadata !{metadata !"outDataLeft.V", metadata !88, metadata !"int24", i32 0, i32 23}
!124 = metadata !{metadata !125}
!125 = metadata !{i32 0, i32 23, metadata !126}
!126 = metadata !{metadata !127}
!127 = metadata !{metadata !"outDataRight.V", metadata !88, metadata !"int24", i32 0, i32 23}
