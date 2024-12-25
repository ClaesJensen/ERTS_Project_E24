; ModuleID = 'C:/Users/lions/Desktop/Github/ERTS_Project_E24/Eq/Biquadv2/solution1/.autopilot/db/a.o.2.bc'
target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-f80:128:128-v64:64:64-v128:128:128-a0:0:64-f80:32:32-n8:16:32-S32"
target triple = "i686-pc-mingw32"

@samples_V = internal unnamed_addr global [5 x i24] zeroinitializer
@llvm_global_ctors_1 = appending global [1 x void ()*] [void ()* @_GLOBAL__I_a]
@llvm_global_ctors_0 = appending global [1 x i32] [i32 65535]
@coeffs_V = internal unnamed_addr global [5 x i27] zeroinitializer
@biquadv2_str = internal unnamed_addr constant [9 x i8] c"biquadv2\00"
@p_str2 = private unnamed_addr constant [9 x i8] c"biquadv2\00", align 1
@p_str1 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@p_str = private unnamed_addr constant [10 x i8] c"s_axilite\00", align 1

declare i51 @llvm.part.select.i51(i51, i32, i32) nounwind readnone

declare void @llvm.dbg.value(metadata, i64, metadata) nounwind readnone

define void @biquadv2(i27 %b0_a0_V, i27 %b1_a0_V, i27 %b2_a0_V, i27 %a1_a0_V, i27 %a2_a0_V, i24 %inData_V, i24* %outData_V) {
.preheader82.preheader:
  call void (...)* @_ssdm_op_SpecBitsMap(i27 %b0_a0_V), !map !99
  call void (...)* @_ssdm_op_SpecBitsMap(i27 %b1_a0_V), !map !105
  call void (...)* @_ssdm_op_SpecBitsMap(i27 %b2_a0_V), !map !109
  call void (...)* @_ssdm_op_SpecBitsMap(i27 %a1_a0_V), !map !113
  call void (...)* @_ssdm_op_SpecBitsMap(i27 %a2_a0_V), !map !117
  call void (...)* @_ssdm_op_SpecBitsMap(i24 %inData_V), !map !121
  call void (...)* @_ssdm_op_SpecBitsMap(i24* %outData_V), !map !125
  call void (...)* @_ssdm_op_SpecTopModule([9 x i8]* @biquadv2_str) nounwind
  %inData_V_read = call i24 @_ssdm_op_Read.s_axilite.i24(i24 %inData_V)
  %a2_a0_V_read = call i27 @_ssdm_op_Read.s_axilite.i27(i27 %a2_a0_V)
  %a1_a0_V_read = call i27 @_ssdm_op_Read.s_axilite.i27(i27 %a1_a0_V)
  %b2_a0_V_read = call i27 @_ssdm_op_Read.s_axilite.i27(i27 %b2_a0_V)
  %b1_a0_V_read = call i27 @_ssdm_op_Read.s_axilite.i27(i27 %b1_a0_V)
  %b0_a0_V_read = call i27 @_ssdm_op_Read.s_axilite.i27(i27 %b0_a0_V)
  call void (...)* @_ssdm_op_SpecInterface(i24* %outData_V, [10 x i8]* @p_str, i32 0, i32 0, [1 x i8]* @p_str1, i32 0, i32 0, [9 x i8]* @p_str2, [1 x i8]* @p_str1, [1 x i8]* @p_str1, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str1, [1 x i8]* @p_str1) nounwind
  call void (...)* @_ssdm_op_SpecInterface(i24 %inData_V, [10 x i8]* @p_str, i32 0, i32 0, [1 x i8]* @p_str1, i32 0, i32 0, [9 x i8]* @p_str2, [1 x i8]* @p_str1, [1 x i8]* @p_str1, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str1, [1 x i8]* @p_str1) nounwind
  call void (...)* @_ssdm_op_SpecInterface(i27 %b0_a0_V, [10 x i8]* @p_str, i32 0, i32 0, [1 x i8]* @p_str1, i32 0, i32 0, [9 x i8]* @p_str2, [1 x i8]* @p_str1, [1 x i8]* @p_str1, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str1, [1 x i8]* @p_str1) nounwind
  call void (...)* @_ssdm_op_SpecInterface(i27 %b1_a0_V, [10 x i8]* @p_str, i32 0, i32 0, [1 x i8]* @p_str1, i32 0, i32 0, [9 x i8]* @p_str2, [1 x i8]* @p_str1, [1 x i8]* @p_str1, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str1, [1 x i8]* @p_str1) nounwind
  call void (...)* @_ssdm_op_SpecInterface(i27 %b2_a0_V, [10 x i8]* @p_str, i32 0, i32 0, [1 x i8]* @p_str1, i32 0, i32 0, [9 x i8]* @p_str2, [1 x i8]* @p_str1, [1 x i8]* @p_str1, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str1, [1 x i8]* @p_str1) nounwind
  call void (...)* @_ssdm_op_SpecInterface(i27 %a1_a0_V, [10 x i8]* @p_str, i32 0, i32 0, [1 x i8]* @p_str1, i32 0, i32 0, [9 x i8]* @p_str2, [1 x i8]* @p_str1, [1 x i8]* @p_str1, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str1, [1 x i8]* @p_str1) nounwind
  call void (...)* @_ssdm_op_SpecInterface(i27 %a2_a0_V, [10 x i8]* @p_str, i32 0, i32 0, [1 x i8]* @p_str1, i32 0, i32 0, [9 x i8]* @p_str2, [1 x i8]* @p_str1, [1 x i8]* @p_str1, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str1, [1 x i8]* @p_str1) nounwind
  call void (...)* @_ssdm_op_SpecInterface(i32 0, [10 x i8]* @p_str, i32 0, i32 0, [1 x i8]* @p_str1, i32 0, i32 0, [9 x i8]* @p_str2, [1 x i8]* @p_str1, [1 x i8]* @p_str1, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str1, [1 x i8]* @p_str1) nounwind
  store i27 %b0_a0_V_read, i27* getelementptr inbounds ([5 x i27]* @coeffs_V, i32 0, i32 0), align 16
  store i27 %b1_a0_V_read, i27* getelementptr inbounds ([5 x i27]* @coeffs_V, i32 0, i32 1), align 4
  store i27 %b2_a0_V_read, i27* getelementptr inbounds ([5 x i27]* @coeffs_V, i32 0, i32 2), align 8
  store i27 %a1_a0_V_read, i27* getelementptr inbounds ([5 x i27]* @coeffs_V, i32 0, i32 3), align 4
  store i27 %a2_a0_V_read, i27* getelementptr inbounds ([5 x i27]* @coeffs_V, i32 0, i32 4), align 16
  store i24 %inData_V_read, i24* getelementptr inbounds ([5 x i24]* @samples_V, i32 0, i32 0), align 16
  br label %0

; <label>:0                                       ; preds = %_ifconv, %.preheader82.preheader
  %p_Val2_s = phi i24 [ 0, %.preheader82.preheader ], [ %result_V, %_ifconv ]
  %p_s = phi i3 [ 0, %.preheader82.preheader ], [ %i_V, %_ifconv ]
  %tmp_1 = icmp eq i3 %p_s, -3
  %empty = call i32 (...)* @_ssdm_op_SpecLoopTripCount(i64 5, i64 5, i64 5)
  %i_V = add i3 %p_s, 1
  br i1 %tmp_1, label %1, label %_ifconv

_ifconv:                                          ; preds = %0
  %tmp_2 = zext i3 %p_s to i32
  %coeffs_V_addr = getelementptr [5 x i27]* @coeffs_V, i32 0, i32 %tmp_2
  %coeffs_V_load = load i27* %coeffs_V_addr, align 4
  %OP1_V = sext i27 %coeffs_V_load to i51
  %samples_V_addr = getelementptr [5 x i24]* @samples_V, i32 0, i32 %tmp_2
  %samples_V_load_2 = load i24* %samples_V_addr, align 4
  %OP2_V = sext i24 %samples_V_load_2 to i51
  %p_Val2_1 = mul nsw i51 %OP1_V, %OP2_V
  %tmp_7 = call i48 @_ssdm_op_BitConcatenate.i48.i24.i24(i24 %p_Val2_s, i24 0)
  %tmp_7_cast = sext i48 %tmp_7 to i51
  %p_Val2_2 = add i51 %tmp_7_cast, %p_Val2_1
  %signbit = call i1 @_ssdm_op_BitSelect.i1.i51.i32(i51 %p_Val2_2, i32 50)
  %p_Val2_3 = call i24 @_ssdm_op_PartSelect.i24.i51.i32.i32(i51 %p_Val2_2, i32 24, i32 47)
  %tmp_10 = call i1 @_ssdm_op_BitSelect.i1.i51.i32(i51 %p_Val2_1, i32 23)
  %tmp_4 = zext i1 %tmp_10 to i24
  %tmp_11 = call i1 @_ssdm_op_BitSelect.i1.i51.i32(i51 %p_Val2_2, i32 47)
  %p_Val2_4 = add i24 %p_Val2_3, %tmp_4
  %newsignbit = call i1 @_ssdm_op_BitSelect.i1.i24.i32(i24 %p_Val2_4, i32 23)
  %tmp_s = xor i1 %newsignbit, true
  %carry = and i1 %tmp_11, %tmp_s
  %tmp_13 = call i1 @_ssdm_op_BitSelect.i1.i51.i32(i51 %p_Val2_2, i32 48)
  %tmp_6 = call i2 @_ssdm_op_PartSelect.i2.i51.i32.i32(i51 %p_Val2_2, i32 49, i32 50)
  %Range2_all_ones = icmp eq i2 %tmp_6, -1
  %tmp_8 = call i3 @_ssdm_op_PartSelect.i3.i51.i32.i32(i51 %p_Val2_2, i32 48, i32 50)
  %Range1_all_ones = icmp eq i3 %tmp_8, -1
  %Range1_all_zeros = icmp eq i3 %tmp_8, 0
  %deleted_zeros = select i1 %carry, i1 %Range1_all_ones, i1 %Range1_all_zeros
  %tmp_5 = xor i1 %tmp_13, true
  %p_41_i_i = and i1 %Range2_all_ones, %tmp_5
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
  %result_V = select i1 %underflow_not, i24 %p_Val2_4_mux, i24 %p_Val2_4_4
  br label %0

; <label>:1                                       ; preds = %0
  %samples_V_load = load i24* getelementptr inbounds ([5 x i24]* @samples_V, i32 0, i32 3), align 4
  store i24 %samples_V_load, i24* getelementptr inbounds ([5 x i24]* @samples_V, i32 0, i32 4), align 16
  store i24 %p_Val2_s, i24* getelementptr inbounds ([5 x i24]* @samples_V, i32 0, i32 3), align 4
  %samples_V_load_1 = load i24* getelementptr inbounds ([5 x i24]* @samples_V, i32 0, i32 1), align 4
  store i24 %samples_V_load_1, i24* getelementptr inbounds ([5 x i24]* @samples_V, i32 0, i32 2), align 8
  store i24 %inData_V_read, i24* getelementptr inbounds ([5 x i24]* @samples_V, i32 0, i32 1), align 4
  call void @_ssdm_op_Write.s_axilite.i24P(i24* %outData_V, i24 %p_Val2_s)
  ret void
}

define weak void @_ssdm_op_Write.s_axilite.i24P(i24*, i24) {
entry:
  store i24 %1, i24* %0
  ret void
}

define weak void @_ssdm_op_SpecTopModule(...) {
entry:
  ret void
}

define weak i32 @_ssdm_op_SpecLoopTripCount(...) {
entry:
  ret i32 0
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

define weak i24 @_ssdm_op_Read.s_axilite.i24(i24) {
entry:
  ret i24 %0
}

define weak i3 @_ssdm_op_PartSelect.i3.i51.i32.i32(i51, i32, i32) nounwind readnone {
entry:
  %empty = call i51 @llvm.part.select.i51(i51 %0, i32 %1, i32 %2)
  %empty_5 = trunc i51 %empty to i3
  ret i3 %empty_5
}

define weak i24 @_ssdm_op_PartSelect.i24.i51.i32.i32(i51, i32, i32) nounwind readnone {
entry:
  %empty = call i51 @llvm.part.select.i51(i51 %0, i32 %1, i32 %2)
  %empty_6 = trunc i51 %empty to i24
  ret i24 %empty_6
}

define weak i2 @_ssdm_op_PartSelect.i2.i51.i32.i32(i51, i32, i32) nounwind readnone {
entry:
  %empty = call i51 @llvm.part.select.i51(i51 %0, i32 %1, i32 %2)
  %empty_7 = trunc i51 %empty to i2
  ret i2 %empty_7
}

define weak i1 @_ssdm_op_BitSelect.i1.i51.i32(i51, i32) nounwind readnone {
entry:
  %empty = zext i32 %1 to i51
  %empty_8 = shl i51 1, %empty
  %empty_9 = and i51 %0, %empty_8
  %empty_10 = icmp ne i51 %empty_9, 0
  ret i1 %empty_10
}

define weak i1 @_ssdm_op_BitSelect.i1.i24.i32(i24, i32) nounwind readnone {
entry:
  %empty = trunc i32 %1 to i24
  %empty_11 = shl i24 1, %empty
  %empty_12 = and i24 %0, %empty_11
  %empty_13 = icmp ne i24 %empty_12, 0
  ret i1 %empty_13
}

define weak i48 @_ssdm_op_BitConcatenate.i48.i24.i24(i24, i24) nounwind readnone {
entry:
  %empty = zext i24 %0 to i48
  %empty_14 = zext i24 %1 to i48
  %empty_15 = shl i48 %empty, 24
  %empty_16 = or i48 %empty_15, %empty_14
  ret i48 %empty_16
}

declare void @_GLOBAL__I_a() nounwind

!opencl.kernels = !{!0, !7, !7, !13, !13, !15, !21, !21, !15, !15, !23, !23, !25, !31, !15, !15, !15, !37, !39, !39, !41, !15, !21, !47, !15, !15, !15, !15, !15, !15, !48, !39, !39, !15, !50, !52, !39, !39, !15, !54, !56, !56, !15, !15, !58, !15, !15, !60, !60, !63, !65, !67, !39, !39, !15, !15, !15, !15, !69, !15, !15, !15, !71, !71, !73, !73, !74, !15, !15, !15, !76, !79, !15, !15, !15, !81, !81, !82, !82, !84, !15, !15, !15, !15, !15, !15, !86, !15, !15, !15, !88, !15, !15, !15, !90, !15, !15, !15, !15}
!hls.encrypted.func = !{}
!llvm.map.gv = !{!92}

!0 = metadata !{null, metadata !1, metadata !2, metadata !3, metadata !4, metadata !5, metadata !6}
!1 = metadata !{metadata !"kernel_arg_addr_space", i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 1}
!2 = metadata !{metadata !"kernel_arg_access_qual", metadata !"none", metadata !"none", metadata !"none", metadata !"none", metadata !"none", metadata !"none", metadata !"none"}
!3 = metadata !{metadata !"kernel_arg_type", metadata !"coeff_t", metadata !"coeff_t", metadata !"coeff_t", metadata !"coeff_t", metadata !"coeff_t", metadata !"inData_t", metadata !"outData_t*"}
!4 = metadata !{metadata !"kernel_arg_type_qual", metadata !"", metadata !"", metadata !"", metadata !"", metadata !"", metadata !"", metadata !""}
!5 = metadata !{metadata !"kernel_arg_name", metadata !"b0_a0", metadata !"b1_a0", metadata !"b2_a0", metadata !"a1_a0", metadata !"a2_a0", metadata !"inData", metadata !"outData"}
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
!48 = metadata !{null, metadata !8, metadata !9, metadata !40, metadata !11, metadata !49, metadata !6}
!49 = metadata !{metadata !"kernel_arg_name", metadata !""}
!50 = metadata !{null, metadata !8, metadata !9, metadata !51, metadata !11, metadata !12, metadata !6}
!51 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<1, false> &"}
!52 = metadata !{null, metadata !32, metadata !33, metadata !53, metadata !35, metadata !36, metadata !6}
!53 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<4, false> &", metadata !"int"}
!54 = metadata !{null, metadata !8, metadata !9, metadata !55, metadata !11, metadata !12, metadata !6}
!55 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<32, true> &"}
!56 = metadata !{null, metadata !8, metadata !9, metadata !40, metadata !11, metadata !57, metadata !6}
!57 = metadata !{metadata !"kernel_arg_name", metadata !"val"}
!58 = metadata !{null, metadata !8, metadata !9, metadata !59, metadata !11, metadata !12, metadata !6}
!59 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_uint<4> &"}
!60 = metadata !{null, metadata !8, metadata !9, metadata !61, metadata !11, metadata !62, metadata !6}
!61 = metadata !{metadata !"kernel_arg_type", metadata !"double"}
!62 = metadata !{metadata !"kernel_arg_name", metadata !"v"}
!63 = metadata !{null, metadata !8, metadata !9, metadata !61, metadata !11, metadata !64, metadata !6}
!64 = metadata !{metadata !"kernel_arg_name", metadata !"d"}
!65 = metadata !{null, metadata !32, metadata !33, metadata !66, metadata !35, metadata !36, metadata !6}
!66 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<54, false> &", metadata !"int"}
!67 = metadata !{null, metadata !8, metadata !9, metadata !68, metadata !11, metadata !12, metadata !6}
!68 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<54, false> &"}
!69 = metadata !{null, metadata !32, metadata !33, metadata !70, metadata !35, metadata !36, metadata !6}
!70 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<1, false> &", metadata !"const ap_int_base<54, true> &"}
!71 = metadata !{null, metadata !8, metadata !9, metadata !72, metadata !11, metadata !14, metadata !6}
!72 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<54, true> &"}
!73 = metadata !{null, metadata !8, metadata !9, metadata !51, metadata !11, metadata !14, metadata !6}
!74 = metadata !{null, metadata !8, metadata !9, metadata !75, metadata !11, metadata !12, metadata !6}
!75 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<55, true> &"}
!76 = metadata !{null, metadata !32, metadata !33, metadata !77, metadata !35, metadata !78, metadata !6}
!77 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<11, false> &", metadata !"int"}
!78 = metadata !{metadata !"kernel_arg_name", metadata !"op", metadata !"i_op"}
!79 = metadata !{null, metadata !32, metadata !33, metadata !80, metadata !35, metadata !36, metadata !6}
!80 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<11, false> &", metadata !"const ap_int_base<32, true> &"}
!81 = metadata !{null, metadata !8, metadata !9, metadata !55, metadata !11, metadata !14, metadata !6}
!82 = metadata !{null, metadata !8, metadata !9, metadata !83, metadata !11, metadata !14, metadata !6}
!83 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<11, false> &"}
!84 = metadata !{null, metadata !8, metadata !9, metadata !85, metadata !11, metadata !12, metadata !6}
!85 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<33, true> &"}
!86 = metadata !{null, metadata !8, metadata !9, metadata !61, metadata !11, metadata !87, metadata !6}
!87 = metadata !{metadata !"kernel_arg_name", metadata !"pf"}
!88 = metadata !{null, metadata !8, metadata !9, metadata !89, metadata !11, metadata !14, metadata !6}
!89 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_fixed<24, 1, (enum ap_q_mode)0, (enum ap_o_mode)0, 0> &"}
!90 = metadata !{null, metadata !8, metadata !9, metadata !91, metadata !11, metadata !14, metadata !6}
!91 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_fixed<27, 3, (enum ap_q_mode)0, (enum ap_o_mode)0, 0> &"}
!92 = metadata !{metadata !93, [1 x i32]* @llvm_global_ctors_0}
!93 = metadata !{metadata !94}
!94 = metadata !{i32 0, i32 31, metadata !95}
!95 = metadata !{metadata !96}
!96 = metadata !{metadata !"llvm.global_ctors.0", metadata !97, metadata !"", i32 0, i32 31}
!97 = metadata !{metadata !98}
!98 = metadata !{i32 0, i32 0, i32 1}
!99 = metadata !{metadata !100}
!100 = metadata !{i32 0, i32 26, metadata !101}
!101 = metadata !{metadata !102}
!102 = metadata !{metadata !"b0_a0.V", metadata !103, metadata !"int27", i32 0, i32 26}
!103 = metadata !{metadata !104}
!104 = metadata !{i32 0, i32 0, i32 0}
!105 = metadata !{metadata !106}
!106 = metadata !{i32 0, i32 26, metadata !107}
!107 = metadata !{metadata !108}
!108 = metadata !{metadata !"b1_a0.V", metadata !103, metadata !"int27", i32 0, i32 26}
!109 = metadata !{metadata !110}
!110 = metadata !{i32 0, i32 26, metadata !111}
!111 = metadata !{metadata !112}
!112 = metadata !{metadata !"b2_a0.V", metadata !103, metadata !"int27", i32 0, i32 26}
!113 = metadata !{metadata !114}
!114 = metadata !{i32 0, i32 26, metadata !115}
!115 = metadata !{metadata !116}
!116 = metadata !{metadata !"a1_a0.V", metadata !103, metadata !"int27", i32 0, i32 26}
!117 = metadata !{metadata !118}
!118 = metadata !{i32 0, i32 26, metadata !119}
!119 = metadata !{metadata !120}
!120 = metadata !{metadata !"a2_a0.V", metadata !103, metadata !"int27", i32 0, i32 26}
!121 = metadata !{metadata !122}
!122 = metadata !{i32 0, i32 23, metadata !123}
!123 = metadata !{metadata !124}
!124 = metadata !{metadata !"inData.V", metadata !103, metadata !"int24", i32 0, i32 23}
!125 = metadata !{metadata !126}
!126 = metadata !{i32 0, i32 23, metadata !127}
!127 = metadata !{metadata !128}
!128 = metadata !{metadata !"outData.V", metadata !97, metadata !"int24", i32 0, i32 23}
