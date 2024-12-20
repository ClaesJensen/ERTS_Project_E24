; ModuleID = 'C:/Users/lions/Desktop/Github/ERTS_Project_E24/Eq/Biquadv2/solution1/.autopilot/db/a.o.2.bc'
target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-f80:128:128-v64:64:64-v128:128:128-a0:0:64-f80:32:32-n8:16:32-S32"
target triple = "i686-pc-mingw32"

@samples_V = internal unnamed_addr global [5 x i24] zeroinitializer
@llvm_global_ctors_1 = appending global [1 x void ()*] [void ()* @_GLOBAL__I_a]
@llvm_global_ctors_0 = appending global [1 x i32] [i32 65535]
@coeffs = internal unnamed_addr constant [5 x i26] [i26 108003, i26 0, i26 -108003, i26 33337968, i26 -16561209]
@biquadv2_str = internal unnamed_addr constant [9 x i8] c"biquadv2\00"
@p_str2 = private unnamed_addr constant [9 x i8] c"biquadv2\00", align 1
@p_str1 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@p_str = private unnamed_addr constant [10 x i8] c"s_axilite\00", align 1

declare i50 @llvm.part.select.i50(i50, i32, i32) nounwind readnone

declare void @llvm.dbg.value(metadata, i64, metadata) nounwind readnone

define void @biquadv2(i24 %inData_V, i24* %outData_V) {
.preheader.preheader:
  call void (...)* @_ssdm_op_SpecBitsMap(i24 %inData_V), !map !108
  call void (...)* @_ssdm_op_SpecBitsMap(i24* %outData_V), !map !114
  call void (...)* @_ssdm_op_SpecTopModule([9 x i8]* @biquadv2_str) nounwind
  %inData_V_read = call i24 @_ssdm_op_Read.s_axilite.i24(i24 %inData_V)
  call void (...)* @_ssdm_op_SpecInterface(i24* %outData_V, [10 x i8]* @p_str, i32 0, i32 0, [1 x i8]* @p_str1, i32 0, i32 0, [9 x i8]* @p_str2, [1 x i8]* @p_str1, [1 x i8]* @p_str1, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str1, [1 x i8]* @p_str1) nounwind
  call void (...)* @_ssdm_op_SpecInterface(i24 %inData_V, [10 x i8]* @p_str, i32 0, i32 0, [1 x i8]* @p_str1, i32 0, i32 0, [9 x i8]* @p_str2, [1 x i8]* @p_str1, [1 x i8]* @p_str1, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str1, [1 x i8]* @p_str1) nounwind
  call void (...)* @_ssdm_op_SpecInterface(i32 0, [10 x i8]* @p_str, i32 0, i32 0, [1 x i8]* @p_str1, i32 0, i32 0, [9 x i8]* @p_str2, [1 x i8]* @p_str1, [1 x i8]* @p_str1, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str1, [1 x i8]* @p_str1) nounwind
  store i24 %inData_V_read, i24* getelementptr inbounds ([5 x i24]* @samples_V, i32 0, i32 0), align 16
  br label %0

; <label>:0                                       ; preds = %_ifconv, %.preheader.preheader
  %p_Val2_s = phi i24 [ 0, %.preheader.preheader ], [ %result_V, %_ifconv ]
  %p_0 = phi i3 [ 0, %.preheader.preheader ], [ %i_V, %_ifconv ]
  %tmp_5 = icmp eq i3 %p_0, -3
  %empty = call i32 (...)* @_ssdm_op_SpecLoopTripCount(i64 5, i64 5, i64 5)
  %i_V = add i3 %p_0, 1
  br i1 %tmp_5, label %1, label %_ifconv

_ifconv:                                          ; preds = %0
  %tmp_6 = zext i3 %p_0 to i32
  %coeffs_addr = getelementptr [5 x i26]* @coeffs, i32 0, i32 %tmp_6
  %coeffs_load = load i26* %coeffs_addr, align 4
  %OP1_V_cast = sext i26 %coeffs_load to i49
  %samples_V_addr = getelementptr [5 x i24]* @samples_V, i32 0, i32 %tmp_6
  %samples_V_load_2 = load i24* %samples_V_addr, align 4
  %OP2_V_cast = sext i24 %samples_V_load_2 to i49
  %p_Val2_1 = mul i49 %OP2_V_cast, %OP1_V_cast
  %tmp_7 = call i48 @_ssdm_op_BitConcatenate.i48.i24.i24(i24 %p_Val2_s, i24 0)
  %tmp_7_cast = sext i48 %tmp_7 to i50
  %tmp_8_cast = sext i49 %p_Val2_1 to i50
  %p_Val2_2 = add i50 %tmp_8_cast, %tmp_7_cast
  %signbit = call i1 @_ssdm_op_BitSelect.i1.i50.i32(i50 %p_Val2_2, i32 49)
  %p_Val2_3 = call i24 @_ssdm_op_PartSelect.i24.i50.i32.i32(i50 %p_Val2_2, i32 24, i32 47)
  %tmp_8 = call i1 @_ssdm_op_BitSelect.i1.i49.i32(i49 %p_Val2_1, i32 23)
  %tmp_2 = zext i1 %tmp_8 to i24
  %tmp_10 = call i1 @_ssdm_op_BitSelect.i1.i50.i32(i50 %p_Val2_2, i32 47)
  %p_Val2_4 = add i24 %tmp_2, %p_Val2_3
  %newsignbit = call i1 @_ssdm_op_BitSelect.i1.i24.i32(i24 %p_Val2_4, i32 23)
  %tmp_3 = xor i1 %newsignbit, true
  %carry = and i1 %tmp_10, %tmp_3
  %tmp_12 = call i1 @_ssdm_op_BitSelect.i1.i50.i32(i50 %p_Val2_2, i32 48)
  %tmp_9 = call i2 @_ssdm_op_PartSelect.i2.i50.i32.i32(i50 %p_Val2_2, i32 48, i32 49)
  %Range1_all_ones = icmp eq i2 %tmp_9, -1
  %Range1_all_zeros = icmp eq i2 %tmp_9, 0
  %deleted_zeros = select i1 %carry, i1 %Range1_all_ones, i1 %Range1_all_zeros
  %tmp_4 = xor i1 %tmp_12, true
  %p_41_i_i = and i1 %signbit, %tmp_4
  %deleted_ones = select i1 %carry, i1 %p_41_i_i, i1 %Range1_all_ones
  %p_38_i_i = and i1 %carry, %Range1_all_ones
  %p_not_i_i = xor i1 %deleted_zeros, true
  %brmerge_i_i = or i1 %newsignbit, %p_not_i_i
  %tmp_s = xor i1 %signbit, true
  %overflow = and i1 %brmerge_i_i, %tmp_s
  %brmerge40_demorgan_i = and i1 %newsignbit, %deleted_ones
  %tmp_demorgan = or i1 %p_38_i_i, %brmerge40_demorgan_i
  %tmp = xor i1 %tmp_demorgan, true
  %underflow = and i1 %signbit, %tmp
  %brmerge_i_i_i = or i1 %underflow, %overflow
  %tmp1 = or i1 %brmerge40_demorgan_i, %tmp_s
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

define weak i24 @_ssdm_op_Read.s_axilite.i24(i24) {
entry:
  ret i24 %0
}

define weak i24 @_ssdm_op_PartSelect.i24.i50.i32.i32(i50, i32, i32) nounwind readnone {
entry:
  %empty = call i50 @llvm.part.select.i50(i50 %0, i32 %1, i32 %2)
  %empty_5 = trunc i50 %empty to i24
  ret i24 %empty_5
}

define weak i2 @_ssdm_op_PartSelect.i2.i50.i32.i32(i50, i32, i32) nounwind readnone {
entry:
  %empty = call i50 @llvm.part.select.i50(i50 %0, i32 %1, i32 %2)
  %empty_6 = trunc i50 %empty to i2
  ret i2 %empty_6
}

define weak i1 @_ssdm_op_BitSelect.i1.i50.i32(i50, i32) nounwind readnone {
entry:
  %empty = zext i32 %1 to i50
  %empty_7 = shl i50 1, %empty
  %empty_8 = and i50 %0, %empty_7
  %empty_9 = icmp ne i50 %empty_8, 0
  ret i1 %empty_9
}

define weak i1 @_ssdm_op_BitSelect.i1.i49.i32(i49, i32) nounwind readnone {
entry:
  %empty = zext i32 %1 to i49
  %empty_10 = shl i49 1, %empty
  %empty_11 = and i49 %0, %empty_10
  %empty_12 = icmp ne i49 %empty_11, 0
  ret i1 %empty_12
}

define weak i1 @_ssdm_op_BitSelect.i1.i24.i32(i24, i32) nounwind readnone {
entry:
  %empty = trunc i32 %1 to i24
  %empty_13 = shl i24 1, %empty
  %empty_14 = and i24 %0, %empty_13
  %empty_15 = icmp ne i24 %empty_14, 0
  ret i1 %empty_15
}

define weak i48 @_ssdm_op_BitConcatenate.i48.i24.i24(i24, i24) nounwind readnone {
entry:
  %empty = zext i24 %0 to i48
  %empty_16 = zext i24 %1 to i48
  %empty_17 = shl i48 %empty, 24
  %empty_18 = or i48 %empty_17, %empty_16
  ret i48 %empty_18
}

declare void @_GLOBAL__I_a() nounwind

!opencl.kernels = !{!0, !7, !7, !13, !13, !15, !21, !21, !15, !15, !23, !23, !25, !31, !15, !15, !15, !35, !37, !37, !39, !15, !21, !45, !15, !15, !15, !15, !15, !15, !46, !37, !37, !15, !48, !50, !37, !37, !15, !52, !54, !54, !15, !15, !56, !15, !15, !58, !58, !61, !63, !65, !37, !37, !15, !15, !15, !15, !67, !15, !15, !15, !69, !69, !71, !71, !72, !15, !15, !15, !74, !77, !15, !15, !15, !79, !79, !80, !80, !82, !15, !15, !15, !15, !15, !15, !84, !15, !15, !15, !86, !15, !15, !15, !88, !88, !89, !91, !91, !93, !93, !25, !95, !15, !15, !15, !97, !37, !37, !99, !15, !58, !58, !61, !39, !84}
!hls.encrypted.func = !{}
!llvm.map.gv = !{!101}

!0 = metadata !{null, metadata !1, metadata !2, metadata !3, metadata !4, metadata !5, metadata !6}
!1 = metadata !{metadata !"kernel_arg_addr_space", i32 0, i32 1}
!2 = metadata !{metadata !"kernel_arg_access_qual", metadata !"none", metadata !"none"}
!3 = metadata !{metadata !"kernel_arg_type", metadata !"inData_t", metadata !"outData_t*"}
!4 = metadata !{metadata !"kernel_arg_type_qual", metadata !"", metadata !""}
!5 = metadata !{metadata !"kernel_arg_name", metadata !"inData", metadata !"outData"}
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
!31 = metadata !{null, metadata !32, metadata !2, metadata !33, metadata !4, metadata !34, metadata !6}
!32 = metadata !{metadata !"kernel_arg_addr_space", i32 0, i32 0}
!33 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<52, false> &", metadata !"int"}
!34 = metadata !{metadata !"kernel_arg_name", metadata !"op", metadata !"op2"}
!35 = metadata !{null, metadata !8, metadata !9, metadata !36, metadata !11, metadata !12, metadata !6}
!36 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<52, false> &"}
!37 = metadata !{null, metadata !8, metadata !9, metadata !38, metadata !11, metadata !14, metadata !6}
!38 = metadata !{metadata !"kernel_arg_type", metadata !"int"}
!39 = metadata !{null, metadata !40, metadata !41, metadata !42, metadata !43, metadata !44, metadata !6}
!40 = metadata !{metadata !"kernel_arg_addr_space", i32 0, i32 0, i32 0}
!41 = metadata !{metadata !"kernel_arg_access_qual", metadata !"none", metadata !"none", metadata !"none"}
!42 = metadata !{metadata !"kernel_arg_type", metadata !"_Bool", metadata !"_Bool", metadata !"_Bool"}
!43 = metadata !{metadata !"kernel_arg_type_qual", metadata !"", metadata !"", metadata !""}
!44 = metadata !{metadata !"kernel_arg_name", metadata !"qb", metadata !"r", metadata !"s"}
!45 = metadata !{null, metadata !8, metadata !9, metadata !22, metadata !11, metadata !12, metadata !6}
!46 = metadata !{null, metadata !8, metadata !9, metadata !38, metadata !11, metadata !47, metadata !6}
!47 = metadata !{metadata !"kernel_arg_name", metadata !""}
!48 = metadata !{null, metadata !8, metadata !9, metadata !49, metadata !11, metadata !12, metadata !6}
!49 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<1, false> &"}
!50 = metadata !{null, metadata !32, metadata !2, metadata !51, metadata !4, metadata !34, metadata !6}
!51 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<4, false> &", metadata !"int"}
!52 = metadata !{null, metadata !8, metadata !9, metadata !53, metadata !11, metadata !12, metadata !6}
!53 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<32, true> &"}
!54 = metadata !{null, metadata !8, metadata !9, metadata !38, metadata !11, metadata !55, metadata !6}
!55 = metadata !{metadata !"kernel_arg_name", metadata !"val"}
!56 = metadata !{null, metadata !8, metadata !9, metadata !57, metadata !11, metadata !12, metadata !6}
!57 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_uint<4> &"}
!58 = metadata !{null, metadata !8, metadata !9, metadata !59, metadata !11, metadata !60, metadata !6}
!59 = metadata !{metadata !"kernel_arg_type", metadata !"double"}
!60 = metadata !{metadata !"kernel_arg_name", metadata !"v"}
!61 = metadata !{null, metadata !8, metadata !9, metadata !59, metadata !11, metadata !62, metadata !6}
!62 = metadata !{metadata !"kernel_arg_name", metadata !"d"}
!63 = metadata !{null, metadata !32, metadata !2, metadata !64, metadata !4, metadata !34, metadata !6}
!64 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<54, false> &", metadata !"int"}
!65 = metadata !{null, metadata !8, metadata !9, metadata !66, metadata !11, metadata !12, metadata !6}
!66 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<54, false> &"}
!67 = metadata !{null, metadata !32, metadata !2, metadata !68, metadata !4, metadata !34, metadata !6}
!68 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<1, false> &", metadata !"const ap_int_base<54, true> &"}
!69 = metadata !{null, metadata !8, metadata !9, metadata !70, metadata !11, metadata !14, metadata !6}
!70 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<54, true> &"}
!71 = metadata !{null, metadata !8, metadata !9, metadata !49, metadata !11, metadata !14, metadata !6}
!72 = metadata !{null, metadata !8, metadata !9, metadata !73, metadata !11, metadata !12, metadata !6}
!73 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<55, true> &"}
!74 = metadata !{null, metadata !32, metadata !2, metadata !75, metadata !4, metadata !76, metadata !6}
!75 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<11, false> &", metadata !"int"}
!76 = metadata !{metadata !"kernel_arg_name", metadata !"op", metadata !"i_op"}
!77 = metadata !{null, metadata !32, metadata !2, metadata !78, metadata !4, metadata !34, metadata !6}
!78 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<11, false> &", metadata !"const ap_int_base<32, true> &"}
!79 = metadata !{null, metadata !8, metadata !9, metadata !53, metadata !11, metadata !14, metadata !6}
!80 = metadata !{null, metadata !8, metadata !9, metadata !81, metadata !11, metadata !14, metadata !6}
!81 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<11, false> &"}
!82 = metadata !{null, metadata !8, metadata !9, metadata !83, metadata !11, metadata !12, metadata !6}
!83 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<33, true> &"}
!84 = metadata !{null, metadata !8, metadata !9, metadata !59, metadata !11, metadata !85, metadata !6}
!85 = metadata !{metadata !"kernel_arg_name", metadata !"pf"}
!86 = metadata !{null, metadata !8, metadata !9, metadata !87, metadata !11, metadata !14, metadata !6}
!87 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_fixed<24, 1, (enum ap_q_mode)0, (enum ap_o_mode)0, 0> &"}
!88 = metadata !{null, metadata !8, metadata !9, metadata !38, metadata !11, metadata !60, metadata !6}
!89 = metadata !{null, metadata !8, metadata !9, metadata !38, metadata !11, metadata !90, metadata !6}
!90 = metadata !{metadata !"kernel_arg_name", metadata !"b"}
!91 = metadata !{null, metadata !8, metadata !9, metadata !38, metadata !11, metadata !92, metadata !6}
!92 = metadata !{metadata !"kernel_arg_name", metadata !"i_op"}
!93 = metadata !{null, metadata !8, metadata !9, metadata !94, metadata !11, metadata !14, metadata !6}
!94 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_fixed_base<32, 32, true, (enum ap_q_mode)5, (enum ap_o_mode)3, 0> &"}
!95 = metadata !{null, metadata !32, metadata !2, metadata !96, metadata !4, metadata !34, metadata !6}
!96 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<32, false> &", metadata !"int"}
!97 = metadata !{null, metadata !8, metadata !9, metadata !98, metadata !11, metadata !12, metadata !6}
!98 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<32, false> &"}
!99 = metadata !{null, metadata !8, metadata !9, metadata !100, metadata !11, metadata !14, metadata !6}
!100 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_fixed_base<27, 3, true, (enum ap_q_mode)0, (enum ap_o_mode)0, 0> &"}
!101 = metadata !{metadata !102, [1 x i32]* @llvm_global_ctors_0}
!102 = metadata !{metadata !103}
!103 = metadata !{i32 0, i32 31, metadata !104}
!104 = metadata !{metadata !105}
!105 = metadata !{metadata !"llvm.global_ctors.0", metadata !106, metadata !"", i32 0, i32 31}
!106 = metadata !{metadata !107}
!107 = metadata !{i32 0, i32 0, i32 1}
!108 = metadata !{metadata !109}
!109 = metadata !{i32 0, i32 23, metadata !110}
!110 = metadata !{metadata !111}
!111 = metadata !{metadata !"inData.V", metadata !112, metadata !"int24", i32 0, i32 23}
!112 = metadata !{metadata !113}
!113 = metadata !{i32 0, i32 0, i32 0}
!114 = metadata !{metadata !115}
!115 = metadata !{i32 0, i32 23, metadata !116}
!116 = metadata !{metadata !117}
!117 = metadata !{metadata !"outData.V", metadata !106, metadata !"int24", i32 0, i32 23}
