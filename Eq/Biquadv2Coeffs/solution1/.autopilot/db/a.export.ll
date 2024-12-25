; ModuleID = 'C:/Users/lions/Desktop/Github/ERTS_Project_E24/Eq/Biquadv2Coeffs/solution1/.autopilot/db/a.o.2.bc'
target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-f80:128:128-v64:64:64-v128:128:128-a0:0:64-f80:32:32-n8:16:32-S32"
target triple = "i686-pc-mingw32"

@llvm_global_ctors_1 = appending global [1 x void ()*] [void ()* @_GLOBAL__I_a]
@llvm_global_ctors_0 = appending global [1 x i32] [i32 65535]
@Biquadv2coeffs_str = internal unnamed_addr constant [15 x i8] c"Biquadv2coeffs\00"
@p_str2 = private unnamed_addr constant [7 x i8] c"coeffs\00", align 1
@p_str1 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@p_str = private unnamed_addr constant [10 x i8] c"s_axilite\00", align 1

declare void @llvm.dbg.value(metadata, i64, metadata) nounwind readnone

define weak void @_ssdm_op_Write.ap_auto.i27P(i27*, i27) {
entry:
  store i27 %1, i27* %0
  ret void
}

define weak void @_ssdm_op_SpecTopModule(...) {
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

declare void @_GLOBAL__I_a() nounwind

define void @Biquadv2coeffs(i27 %in0b0_a0_V, i27 %in0b1_a0_V, i27 %in0b2_a0_V, i27 %in0a1_a0_V, i27 %in0a2_a0_V, i27* %out0b0_a0_V, i27* %out0b1_a0_V, i27* %out0b2_a0_V, i27* %out0a1_a0_V, i27* %out0a2_a0_V) {
.preheader.preheader:
  call void (...)* @_ssdm_op_SpecBitsMap(i27 %in0b0_a0_V), !map !26
  call void (...)* @_ssdm_op_SpecBitsMap(i27 %in0b1_a0_V), !map !32
  call void (...)* @_ssdm_op_SpecBitsMap(i27 %in0b2_a0_V), !map !36
  call void (...)* @_ssdm_op_SpecBitsMap(i27 %in0a1_a0_V), !map !40
  call void (...)* @_ssdm_op_SpecBitsMap(i27 %in0a2_a0_V), !map !44
  call void (...)* @_ssdm_op_SpecBitsMap(i27* %out0b0_a0_V), !map !48
  call void (...)* @_ssdm_op_SpecBitsMap(i27* %out0b1_a0_V), !map !52
  call void (...)* @_ssdm_op_SpecBitsMap(i27* %out0b2_a0_V), !map !56
  call void (...)* @_ssdm_op_SpecBitsMap(i27* %out0a1_a0_V), !map !60
  call void (...)* @_ssdm_op_SpecBitsMap(i27* %out0a2_a0_V), !map !64
  call void (...)* @_ssdm_op_SpecTopModule([15 x i8]* @Biquadv2coeffs_str) nounwind
  %in0a2_a0_V_read = call i27 @_ssdm_op_Read.s_axilite.i27(i27 %in0a2_a0_V)
  %in0a1_a0_V_read = call i27 @_ssdm_op_Read.s_axilite.i27(i27 %in0a1_a0_V)
  %in0b2_a0_V_read = call i27 @_ssdm_op_Read.s_axilite.i27(i27 %in0b2_a0_V)
  %in0b1_a0_V_read = call i27 @_ssdm_op_Read.s_axilite.i27(i27 %in0b1_a0_V)
  %in0b0_a0_V_read = call i27 @_ssdm_op_Read.s_axilite.i27(i27 %in0b0_a0_V)
  call void (...)* @_ssdm_op_SpecInterface(i27 %in0b0_a0_V, [10 x i8]* @p_str, i32 0, i32 0, [1 x i8]* @p_str1, i32 0, i32 0, [7 x i8]* @p_str2, [1 x i8]* @p_str1, [1 x i8]* @p_str1, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str1, [1 x i8]* @p_str1) nounwind
  call void (...)* @_ssdm_op_SpecInterface(i27 %in0b1_a0_V, [10 x i8]* @p_str, i32 0, i32 0, [1 x i8]* @p_str1, i32 0, i32 0, [7 x i8]* @p_str2, [1 x i8]* @p_str1, [1 x i8]* @p_str1, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str1, [1 x i8]* @p_str1) nounwind
  call void (...)* @_ssdm_op_SpecInterface(i27 %in0b2_a0_V, [10 x i8]* @p_str, i32 0, i32 0, [1 x i8]* @p_str1, i32 0, i32 0, [7 x i8]* @p_str2, [1 x i8]* @p_str1, [1 x i8]* @p_str1, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str1, [1 x i8]* @p_str1) nounwind
  call void (...)* @_ssdm_op_SpecInterface(i27 %in0a1_a0_V, [10 x i8]* @p_str, i32 0, i32 0, [1 x i8]* @p_str1, i32 0, i32 0, [7 x i8]* @p_str2, [1 x i8]* @p_str1, [1 x i8]* @p_str1, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str1, [1 x i8]* @p_str1) nounwind
  call void (...)* @_ssdm_op_SpecInterface(i27 %in0a2_a0_V, [10 x i8]* @p_str, i32 0, i32 0, [1 x i8]* @p_str1, i32 0, i32 0, [7 x i8]* @p_str2, [1 x i8]* @p_str1, [1 x i8]* @p_str1, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str1, [1 x i8]* @p_str1) nounwind
  call void @_ssdm_op_Write.ap_auto.i27P(i27* %out0b0_a0_V, i27 %in0b0_a0_V_read)
  call void @_ssdm_op_Write.ap_auto.i27P(i27* %out0b1_a0_V, i27 %in0b1_a0_V_read)
  call void @_ssdm_op_Write.ap_auto.i27P(i27* %out0b2_a0_V, i27 %in0b2_a0_V_read)
  call void @_ssdm_op_Write.ap_auto.i27P(i27* %out0a1_a0_V, i27 %in0a1_a0_V_read)
  call void @_ssdm_op_Write.ap_auto.i27P(i27* %out0a2_a0_V, i27 %in0a2_a0_V_read)
  ret void
}

!opencl.kernels = !{!0, !7, !13, !13, !13, !13}
!hls.encrypted.func = !{}
!llvm.map.gv = !{!19}

!0 = metadata !{null, metadata !1, metadata !2, metadata !3, metadata !4, metadata !5, metadata !6}
!1 = metadata !{metadata !"kernel_arg_addr_space", i32 0, i32 0, i32 0, i32 0, i32 0, i32 1, i32 1, i32 1, i32 1, i32 1}
!2 = metadata !{metadata !"kernel_arg_access_qual", metadata !"none", metadata !"none", metadata !"none", metadata !"none", metadata !"none", metadata !"none", metadata !"none", metadata !"none", metadata !"none", metadata !"none"}
!3 = metadata !{metadata !"kernel_arg_type", metadata !"coeff_t", metadata !"coeff_t", metadata !"coeff_t", metadata !"coeff_t", metadata !"coeff_t", metadata !"coeff_t*", metadata !"coeff_t*", metadata !"coeff_t*", metadata !"coeff_t*", metadata !"coeff_t*"}
!4 = metadata !{metadata !"kernel_arg_type_qual", metadata !"", metadata !"", metadata !"", metadata !"", metadata !"", metadata !"", metadata !"", metadata !"", metadata !"", metadata !""}
!5 = metadata !{metadata !"kernel_arg_name", metadata !"in0b0_a0", metadata !"in0b1_a0", metadata !"in0b2_a0", metadata !"in0a1_a0", metadata !"in0a2_a0", metadata !"out0b0_a0", metadata !"out0b1_a0", metadata !"out0b2_a0", metadata !"out0a1_a0", metadata !"out0a2_a0"}
!6 = metadata !{metadata !"reqd_work_group_size", i32 1, i32 1, i32 1}
!7 = metadata !{null, metadata !8, metadata !9, metadata !10, metadata !11, metadata !12, metadata !6}
!8 = metadata !{metadata !"kernel_arg_addr_space", i32 0}
!9 = metadata !{metadata !"kernel_arg_access_qual", metadata !"none"}
!10 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_fixed<27, 3, (enum ap_q_mode)0, (enum ap_o_mode)0, 0> &"}
!11 = metadata !{metadata !"kernel_arg_type_qual", metadata !""}
!12 = metadata !{metadata !"kernel_arg_name", metadata !"op"}
!13 = metadata !{null, metadata !14, metadata !15, metadata !16, metadata !17, metadata !18, metadata !6}
!14 = metadata !{metadata !"kernel_arg_addr_space"}
!15 = metadata !{metadata !"kernel_arg_access_qual"}
!16 = metadata !{metadata !"kernel_arg_type"}
!17 = metadata !{metadata !"kernel_arg_type_qual"}
!18 = metadata !{metadata !"kernel_arg_name"}
!19 = metadata !{metadata !20, [1 x i32]* @llvm_global_ctors_0}
!20 = metadata !{metadata !21}
!21 = metadata !{i32 0, i32 31, metadata !22}
!22 = metadata !{metadata !23}
!23 = metadata !{metadata !"llvm.global_ctors.0", metadata !24, metadata !"", i32 0, i32 31}
!24 = metadata !{metadata !25}
!25 = metadata !{i32 0, i32 0, i32 1}
!26 = metadata !{metadata !27}
!27 = metadata !{i32 0, i32 26, metadata !28}
!28 = metadata !{metadata !29}
!29 = metadata !{metadata !"in0b0_a0.V", metadata !30, metadata !"int27", i32 0, i32 26}
!30 = metadata !{metadata !31}
!31 = metadata !{i32 0, i32 0, i32 0}
!32 = metadata !{metadata !33}
!33 = metadata !{i32 0, i32 26, metadata !34}
!34 = metadata !{metadata !35}
!35 = metadata !{metadata !"in0b1_a0.V", metadata !30, metadata !"int27", i32 0, i32 26}
!36 = metadata !{metadata !37}
!37 = metadata !{i32 0, i32 26, metadata !38}
!38 = metadata !{metadata !39}
!39 = metadata !{metadata !"in0b2_a0.V", metadata !30, metadata !"int27", i32 0, i32 26}
!40 = metadata !{metadata !41}
!41 = metadata !{i32 0, i32 26, metadata !42}
!42 = metadata !{metadata !43}
!43 = metadata !{metadata !"in0a1_a0.V", metadata !30, metadata !"int27", i32 0, i32 26}
!44 = metadata !{metadata !45}
!45 = metadata !{i32 0, i32 26, metadata !46}
!46 = metadata !{metadata !47}
!47 = metadata !{metadata !"in0a2_a0.V", metadata !30, metadata !"int27", i32 0, i32 26}
!48 = metadata !{metadata !49}
!49 = metadata !{i32 0, i32 26, metadata !50}
!50 = metadata !{metadata !51}
!51 = metadata !{metadata !"out0b0_a0.V", metadata !24, metadata !"int27", i32 0, i32 26}
!52 = metadata !{metadata !53}
!53 = metadata !{i32 0, i32 26, metadata !54}
!54 = metadata !{metadata !55}
!55 = metadata !{metadata !"out0b1_a0.V", metadata !24, metadata !"int27", i32 0, i32 26}
!56 = metadata !{metadata !57}
!57 = metadata !{i32 0, i32 26, metadata !58}
!58 = metadata !{metadata !59}
!59 = metadata !{metadata !"out0b2_a0.V", metadata !24, metadata !"int27", i32 0, i32 26}
!60 = metadata !{metadata !61}
!61 = metadata !{i32 0, i32 26, metadata !62}
!62 = metadata !{metadata !63}
!63 = metadata !{metadata !"out0a1_a0.V", metadata !24, metadata !"int27", i32 0, i32 26}
!64 = metadata !{metadata !65}
!65 = metadata !{i32 0, i32 26, metadata !66}
!66 = metadata !{metadata !67}
!67 = metadata !{metadata !"out0a2_a0.V", metadata !24, metadata !"int27", i32 0, i32 26}
