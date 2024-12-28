; ModuleID = 'C:/Users/lions/Desktop/Github/ERTS_Project_E24/Eq/Biquadv2Coeffs/solution1/.autopilot/db/a.o.3.bc'
target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-f80:128:128-v64:64:64-v128:128:128-a0:0:64-f80:32:32-n8:16:32-S32"
target triple = "i686-pc-mingw32"

@llvm_global_ctors_1 = appending global [1 x void ()*] [void ()* @_GLOBAL__I_a] ; [#uses=0 type=[1 x void ()*]*]
@llvm_global_ctors_0 = appending global [1 x i32] [i32 65535] ; [#uses=0 type=[1 x i32]*]
@Biquadv2coeffs_str = internal unnamed_addr constant [15 x i8] c"Biquadv2coeffs\00" ; [#uses=1 type=[15 x i8]*]
@p_str2 = private unnamed_addr constant [7 x i8] c"coeffs\00", align 1 ; [#uses=5 type=[7 x i8]*]
@p_str1 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1 ; [#uses=25 type=[1 x i8]*]
@p_str = private unnamed_addr constant [10 x i8] c"s_axilite\00", align 1 ; [#uses=5 type=[10 x i8]*]

; [#uses=20]
declare void @llvm.dbg.value(metadata, i64, metadata) nounwind readnone

; [#uses=5]
define weak void @_ssdm_op_Write.ap_auto.i27P(i27*, i27) {
entry:
  store i27 %1, i27* %0
  ret void
}

; [#uses=1]
define weak void @_ssdm_op_SpecTopModule(...) {
entry:
  ret void
}

; [#uses=5]
define weak void @_ssdm_op_SpecInterface(...) nounwind {
entry:
  ret void
}

; [#uses=10]
define weak void @_ssdm_op_SpecBitsMap(...) {
entry:
  ret void
}

; [#uses=5]
define weak i27 @_ssdm_op_Read.s_axilite.i27(i27) {
entry:
  ret i27 %0
}

; [#uses=1]
declare void @_GLOBAL__I_a() nounwind

; [#uses=0]
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
  %in0a2_a0_V_read = call i27 @_ssdm_op_Read.s_axilite.i27(i27 %in0a2_a0_V) ; [#uses=1 type=i27]
  call void @llvm.dbg.value(metadata !{i27 %in0a2_a0_V_read}, i64 0, metadata !68), !dbg !495 ; [debug line = 385:49@14:2] [debug variable = op.V]
  %in0a1_a0_V_read = call i27 @_ssdm_op_Read.s_axilite.i27(i27 %in0a1_a0_V) ; [#uses=1 type=i27]
  call void @llvm.dbg.value(metadata !{i27 %in0a1_a0_V_read}, i64 0, metadata !68), !dbg !504 ; [debug line = 385:49@13:2] [debug variable = op.V]
  %in0b2_a0_V_read = call i27 @_ssdm_op_Read.s_axilite.i27(i27 %in0b2_a0_V) ; [#uses=1 type=i27]
  call void @llvm.dbg.value(metadata !{i27 %in0b2_a0_V_read}, i64 0, metadata !68), !dbg !506 ; [debug line = 385:49@12:2] [debug variable = op.V]
  %in0b1_a0_V_read = call i27 @_ssdm_op_Read.s_axilite.i27(i27 %in0b1_a0_V) ; [#uses=1 type=i27]
  call void @llvm.dbg.value(metadata !{i27 %in0b1_a0_V_read}, i64 0, metadata !68), !dbg !508 ; [debug line = 385:49@11:2] [debug variable = op.V]
  %in0b0_a0_V_read = call i27 @_ssdm_op_Read.s_axilite.i27(i27 %in0b0_a0_V) ; [#uses=1 type=i27]
  call void @llvm.dbg.value(metadata !{i27 %in0b0_a0_V_read}, i64 0, metadata !68), !dbg !510 ; [debug line = 385:49@10:2] [debug variable = op.V]
  call void @llvm.dbg.value(metadata !{i27* %out0b0_a0_V}, i64 0, metadata !512), !dbg !515 ; [debug line = 3:120] [debug variable = out0b0_a0.V]
  call void @llvm.dbg.value(metadata !{i27* %out0b1_a0_V}, i64 0, metadata !516), !dbg !518 ; [debug line = 3:140] [debug variable = out0b1_a0.V]
  call void @llvm.dbg.value(metadata !{i27* %out0b2_a0_V}, i64 0, metadata !519), !dbg !521 ; [debug line = 3:160] [debug variable = out0b2_a0.V]
  call void @llvm.dbg.value(metadata !{i27* %out0a1_a0_V}, i64 0, metadata !522), !dbg !524 ; [debug line = 3:180] [debug variable = out0a1_a0.V]
  call void @llvm.dbg.value(metadata !{i27* %out0a2_a0_V}, i64 0, metadata !525), !dbg !527 ; [debug line = 3:200] [debug variable = out0a2_a0.V]
  call void (...)* @_ssdm_op_SpecInterface(i27 %in0b0_a0_V, [10 x i8]* @p_str, i32 0, i32 0, [1 x i8]* @p_str1, i32 0, i32 0, [7 x i8]* @p_str2, [1 x i8]* @p_str1, [1 x i8]* @p_str1, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str1, [1 x i8]* @p_str1) nounwind, !dbg !528 ; [debug line = 4:1]
  call void (...)* @_ssdm_op_SpecInterface(i27 %in0b1_a0_V, [10 x i8]* @p_str, i32 0, i32 0, [1 x i8]* @p_str1, i32 0, i32 0, [7 x i8]* @p_str2, [1 x i8]* @p_str1, [1 x i8]* @p_str1, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str1, [1 x i8]* @p_str1) nounwind, !dbg !529 ; [debug line = 5:1]
  call void (...)* @_ssdm_op_SpecInterface(i27 %in0b2_a0_V, [10 x i8]* @p_str, i32 0, i32 0, [1 x i8]* @p_str1, i32 0, i32 0, [7 x i8]* @p_str2, [1 x i8]* @p_str1, [1 x i8]* @p_str1, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str1, [1 x i8]* @p_str1) nounwind, !dbg !530 ; [debug line = 6:1]
  call void (...)* @_ssdm_op_SpecInterface(i27 %in0a1_a0_V, [10 x i8]* @p_str, i32 0, i32 0, [1 x i8]* @p_str1, i32 0, i32 0, [7 x i8]* @p_str2, [1 x i8]* @p_str1, [1 x i8]* @p_str1, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str1, [1 x i8]* @p_str1) nounwind, !dbg !531 ; [debug line = 7:1]
  call void (...)* @_ssdm_op_SpecInterface(i27 %in0a2_a0_V, [10 x i8]* @p_str, i32 0, i32 0, [1 x i8]* @p_str1, i32 0, i32 0, [7 x i8]* @p_str2, [1 x i8]* @p_str1, [1 x i8]* @p_str1, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str1, [1 x i8]* @p_str1) nounwind, !dbg !532 ; [debug line = 8:1]
  call void @llvm.dbg.value(metadata !{i27 %in0b0_a0_V}, i64 0, metadata !68), !dbg !510 ; [debug line = 385:49@10:2] [debug variable = op.V]
  call void @llvm.dbg.value(metadata !{i27 %in0b1_a0_V}, i64 0, metadata !68), !dbg !508 ; [debug line = 385:49@11:2] [debug variable = op.V]
  call void @llvm.dbg.value(metadata !{i27 %in0b2_a0_V}, i64 0, metadata !68), !dbg !506 ; [debug line = 385:49@12:2] [debug variable = op.V]
  call void @llvm.dbg.value(metadata !{i27 %in0a1_a0_V}, i64 0, metadata !68), !dbg !504 ; [debug line = 385:49@13:2] [debug variable = op.V]
  call void @llvm.dbg.value(metadata !{i27 %in0a2_a0_V}, i64 0, metadata !68), !dbg !495 ; [debug line = 385:49@14:2] [debug variable = op.V]
  call void @llvm.dbg.value(metadata !{i27* %out0b0_a0_V}, i64 0, metadata !533), !dbg !536 ; [debug line = 384:53@16:2] [debug variable = ssdm_int<27 + 1024 * 0, true>.V]
  call void @_ssdm_op_Write.ap_auto.i27P(i27* %out0b0_a0_V, i27 %in0b0_a0_V_read), !dbg !538 ; [debug line = 386:9@16:2]
  call void @llvm.dbg.value(metadata !{i27* %out0b1_a0_V}, i64 0, metadata !533), !dbg !540 ; [debug line = 384:53@17:2] [debug variable = ssdm_int<27 + 1024 * 0, true>.V]
  call void @_ssdm_op_Write.ap_auto.i27P(i27* %out0b1_a0_V, i27 %in0b1_a0_V_read), !dbg !542 ; [debug line = 386:9@17:2]
  call void @llvm.dbg.value(metadata !{i27* %out0b2_a0_V}, i64 0, metadata !533), !dbg !543 ; [debug line = 384:53@18:2] [debug variable = ssdm_int<27 + 1024 * 0, true>.V]
  call void @_ssdm_op_Write.ap_auto.i27P(i27* %out0b2_a0_V, i27 %in0b2_a0_V_read), !dbg !545 ; [debug line = 386:9@18:2]
  call void @llvm.dbg.value(metadata !{i27* %out0a1_a0_V}, i64 0, metadata !533), !dbg !546 ; [debug line = 384:53@19:2] [debug variable = ssdm_int<27 + 1024 * 0, true>.V]
  call void @_ssdm_op_Write.ap_auto.i27P(i27* %out0a1_a0_V, i27 %in0a1_a0_V_read), !dbg !548 ; [debug line = 386:9@19:2]
  call void @llvm.dbg.value(metadata !{i27* %out0a2_a0_V}, i64 0, metadata !533), !dbg !549 ; [debug line = 384:53@20:2] [debug variable = ssdm_int<27 + 1024 * 0, true>.V]
  call void @_ssdm_op_Write.ap_auto.i27P(i27* %out0a2_a0_V, i27 %in0a2_a0_V_read), !dbg !551 ; [debug line = 386:9@20:2]
  ret void, !dbg !552                             ; [debug line = 21:1]
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
!68 = metadata !{i32 790533, metadata !69, metadata !"op.V", null, i32 385, metadata !488, i32 0, i32 0} ; [ DW_TAG_arg_variable_field_ro ]
!69 = metadata !{i32 786689, metadata !70, metadata !"op", metadata !71, i32 33554817, metadata !482, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!70 = metadata !{i32 786478, i32 0, null, metadata !"operator=", metadata !"operator=", metadata !"_ZN8ap_fixedILi27ELi3EL9ap_q_mode0EL9ap_o_mode0ELi0EEaSERKS2_", metadata !71, i32 384, metadata !72, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, null, null, metadata !471, metadata !91, i32 385} ; [ DW_TAG_subprogram ]
!71 = metadata !{i32 786473, metadata !"D:/Xilinx/Vivado_HLS/2017.2/common/technology/autopilot/ap_int.h", metadata !"C:\5CUsers\5Clions\5CDesktop\5CGithub\5CERTS_Project_E24\5CEq", null} ; [ DW_TAG_file_type ]
!72 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !73, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!73 = metadata !{metadata !74, metadata !422, metadata !482}
!74 = metadata !{i32 786448, null, null, null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !75} ; [ DW_TAG_reference_type ]
!75 = metadata !{i32 786434, null, metadata !"ap_fixed<27, 3, 0, 0, 0>", metadata !71, i32 290, i64 32, i64 32, i32 0, i32 0, null, metadata !76, i32 0, null, metadata !487} ; [ DW_TAG_class_type ]
!76 = metadata !{metadata !77, metadata !419, metadata !423, metadata !426, metadata !429, metadata !432, metadata !435, metadata !438, metadata !441, metadata !444, metadata !447, metadata !450, metadata !453, metadata !456, metadata !459, metadata !462, metadata !465, metadata !468, metadata !471, metadata !472, metadata !478, metadata !484}
!77 = metadata !{i32 786460, metadata !75, null, metadata !71, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !78} ; [ DW_TAG_inheritance ]
!78 = metadata !{i32 786434, null, metadata !"ap_fixed_base<27, 3, true, 0, 0, 0>", metadata !79, i32 512, i64 32, i64 32, i32 0, i32 0, null, metadata !80, i32 0, null, metadata !413} ; [ DW_TAG_class_type ]
!79 = metadata !{i32 786473, metadata !"D:/Xilinx/Vivado_HLS/2017.2/common/technology/autopilot/ap_fixed_syn.h", metadata !"C:\5CUsers\5Clions\5CDesktop\5CGithub\5CERTS_Project_E24\5CEq", null} ; [ DW_TAG_file_type ]
!80 = metadata !{metadata !81, metadata !98, metadata !102, metadata !105, metadata !108, metadata !137, metadata !143, metadata !146, metadata !150, metadata !154, metadata !158, metadata !162, metadata !166, metadata !169, metadata !173, metadata !177, metadata !181, metadata !186, metadata !191, metadata !196, metadata !199, metadata !204, metadata !208, metadata !213, metadata !216, metadata !219, metadata !222, metadata !225, metadata !228, metadata !231, metadata !235, metadata !238, metadata !242, metadata !245, metadata !248, metadata !251, metadata !255, metadata !258, metadata !261, metadata !264, metadata !267, metadata !270, metadata !273, metadata !276, metadata !277, metadata !278, metadata !279, metadata !282, metadata !285, metadata !288, metadata !291, metadata !294, metadata !295, metadata !296, metadata !299, metadata !302, metadata !305, metadata !308, metadata !309, metadata !312, metadata !315, metadata !316, metadata !319, metadata !320, metadata !323, metadata !327, metadata !328, metadata !331, metadata !335, metadata !338, metadata !341, metadata !342, metadata !343, metadata !346, metadata !349, metadata !350, metadata !351, metadata !354, metadata !355, metadata !356, metadata !357, metadata !358, metadata !359, metadata !363, metadata !366, metadata !367, metadata !368, metadata !371, metadata !374, metadata !378, metadata !379, metadata !382, metadata !383, metadata !386, metadata !389, metadata !390, metadata !391, metadata !392, metadata !393, metadata !396, metadata !399, metadata !400, metadata !410}
!81 = metadata !{i32 786460, metadata !78, null, metadata !79, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !82} ; [ DW_TAG_inheritance ]
!82 = metadata !{i32 786434, null, metadata !"ssdm_int<27 + 1024 * 0, true>", metadata !83, i32 29, i64 32, i64 32, i32 0, i32 0, null, metadata !84, i32 0, null, metadata !93} ; [ DW_TAG_class_type ]
!83 = metadata !{i32 786473, metadata !"D:/Xilinx/Vivado_HLS/2017.2/common/technology/autopilot/etc/autopilot_dt.def", metadata !"C:\5CUsers\5Clions\5CDesktop\5CGithub\5CERTS_Project_E24\5CEq", null} ; [ DW_TAG_file_type ]
!84 = metadata !{metadata !85, metadata !87}
!85 = metadata !{i32 786445, metadata !82, metadata !"V", metadata !83, i32 29, i64 27, i64 32, i64 0, i32 0, metadata !86} ; [ DW_TAG_member ]
!86 = metadata !{i32 786468, null, metadata !"int27", null, i32 0, i64 27, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!87 = metadata !{i32 786478, i32 0, metadata !82, metadata !"ssdm_int", metadata !"ssdm_int", metadata !"", metadata !83, i32 29, metadata !88, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !91, i32 29} ; [ DW_TAG_subprogram ]
!88 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !89, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!89 = metadata !{null, metadata !90}
!90 = metadata !{i32 786447, i32 0, metadata !"", i32 0, i32 0, i64 32, i64 32, i64 0, i32 64, metadata !82} ; [ DW_TAG_pointer_type ]
!91 = metadata !{metadata !92}
!92 = metadata !{i32 786468}                      ; [ DW_TAG_base_type ]
!93 = metadata !{metadata !94, metadata !96}
!94 = metadata !{i32 786480, null, metadata !"_AP_N", metadata !95, i64 27, null, i32 0, i32 0} ; [ DW_TAG_template_value_parameter ]
!95 = metadata !{i32 786468, null, metadata !"int", null, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!96 = metadata !{i32 786480, null, metadata !"_AP_S", metadata !97, i64 1, null, i32 0, i32 0} ; [ DW_TAG_template_value_parameter ]
!97 = metadata !{i32 786468, null, metadata !"bool", null, i32 0, i64 8, i64 8, i64 0, i32 0, i32 2} ; [ DW_TAG_base_type ]
!98 = metadata !{i32 786478, i32 0, metadata !78, metadata !"overflow_adjust", metadata !"overflow_adjust", metadata !"_ZN13ap_fixed_baseILi27ELi3ELb1EL9ap_q_mode0EL9ap_o_mode0ELi0EE15overflow_adjustEbbbb", metadata !79, i32 522, metadata !99, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !91, i32 522} ; [ DW_TAG_subprogram ]
!99 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !100, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!100 = metadata !{null, metadata !101, metadata !97, metadata !97, metadata !97, metadata !97}
!101 = metadata !{i32 786447, i32 0, metadata !"", i32 0, i32 0, i64 32, i64 32, i64 0, i32 64, metadata !78} ; [ DW_TAG_pointer_type ]
!102 = metadata !{i32 786478, i32 0, metadata !78, metadata !"quantization_adjust", metadata !"quantization_adjust", metadata !"_ZN13ap_fixed_baseILi27ELi3ELb1EL9ap_q_mode0EL9ap_o_mode0ELi0EE19quantization_adjustEbbb", metadata !79, i32 595, metadata !103, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !91, i32 595} ; [ DW_TAG_subprogram ]
!103 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !104, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!104 = metadata !{metadata !97, metadata !101, metadata !97, metadata !97, metadata !97}
!105 = metadata !{i32 786478, i32 0, metadata !78, metadata !"ap_fixed_base", metadata !"ap_fixed_base", metadata !"", metadata !79, i32 653, metadata !106, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !91, i32 653} ; [ DW_TAG_subprogram ]
!106 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !107, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!107 = metadata !{null, metadata !101}
!108 = metadata !{i32 786478, i32 0, metadata !78, metadata !"ap_fixed_base<27, 3, true, 0, 0, 0>", metadata !"ap_fixed_base<27, 3, true, 0, 0, 0>", metadata !"", metadata !79, i32 663, metadata !109, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, metadata !113, i32 0, metadata !91, i32 663} ; [ DW_TAG_subprogram ]
!109 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !110, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!110 = metadata !{null, metadata !101, metadata !111}
!111 = metadata !{i32 786448, null, null, null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !112} ; [ DW_TAG_reference_type ]
!112 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !78} ; [ DW_TAG_const_type ]
!113 = metadata !{metadata !114, metadata !115, metadata !116, metadata !117, metadata !128, metadata !136}
!114 = metadata !{i32 786480, null, metadata !"_AP_W2", metadata !95, i64 27, null, i32 0, i32 0} ; [ DW_TAG_template_value_parameter ]
!115 = metadata !{i32 786480, null, metadata !"_AP_I2", metadata !95, i64 3, null, i32 0, i32 0} ; [ DW_TAG_template_value_parameter ]
!116 = metadata !{i32 786480, null, metadata !"_AP_S2", metadata !97, i64 1, null, i32 0, i32 0} ; [ DW_TAG_template_value_parameter ]
!117 = metadata !{i32 786480, null, metadata !"_AP_Q2", metadata !118, i64 0, null, i32 0, i32 0} ; [ DW_TAG_template_value_parameter ]
!118 = metadata !{i32 786436, null, metadata !"ap_q_mode", metadata !119, i32 657, i64 3, i64 4, i32 0, i32 0, null, metadata !120, i32 0, i32 0} ; [ DW_TAG_enumeration_type ]
!119 = metadata !{i32 786473, metadata !"D:/Xilinx/Vivado_HLS/2017.2/common/technology/autopilot/ap_int_syn.h", metadata !"C:\5CUsers\5Clions\5CDesktop\5CGithub\5CERTS_Project_E24\5CEq", null} ; [ DW_TAG_file_type ]
!120 = metadata !{metadata !121, metadata !122, metadata !123, metadata !124, metadata !125, metadata !126, metadata !127}
!121 = metadata !{i32 786472, metadata !"SC_RND", i64 0} ; [ DW_TAG_enumerator ]
!122 = metadata !{i32 786472, metadata !"SC_RND_ZERO", i64 1} ; [ DW_TAG_enumerator ]
!123 = metadata !{i32 786472, metadata !"SC_RND_MIN_INF", i64 2} ; [ DW_TAG_enumerator ]
!124 = metadata !{i32 786472, metadata !"SC_RND_INF", i64 3} ; [ DW_TAG_enumerator ]
!125 = metadata !{i32 786472, metadata !"SC_RND_CONV", i64 4} ; [ DW_TAG_enumerator ]
!126 = metadata !{i32 786472, metadata !"SC_TRN", i64 5} ; [ DW_TAG_enumerator ]
!127 = metadata !{i32 786472, metadata !"SC_TRN_ZERO", i64 6} ; [ DW_TAG_enumerator ]
!128 = metadata !{i32 786480, null, metadata !"_AP_O2", metadata !129, i64 0, null, i32 0, i32 0} ; [ DW_TAG_template_value_parameter ]
!129 = metadata !{i32 786436, null, metadata !"ap_o_mode", metadata !119, i32 667, i64 3, i64 4, i32 0, i32 0, null, metadata !130, i32 0, i32 0} ; [ DW_TAG_enumeration_type ]
!130 = metadata !{metadata !131, metadata !132, metadata !133, metadata !134, metadata !135}
!131 = metadata !{i32 786472, metadata !"SC_SAT", i64 0} ; [ DW_TAG_enumerator ]
!132 = metadata !{i32 786472, metadata !"SC_SAT_ZERO", i64 1} ; [ DW_TAG_enumerator ]
!133 = metadata !{i32 786472, metadata !"SC_SAT_SYM", i64 2} ; [ DW_TAG_enumerator ]
!134 = metadata !{i32 786472, metadata !"SC_WRAP", i64 3} ; [ DW_TAG_enumerator ]
!135 = metadata !{i32 786472, metadata !"SC_WRAP_SM", i64 4} ; [ DW_TAG_enumerator ]
!136 = metadata !{i32 786480, null, metadata !"_AP_N2", metadata !95, i64 0, null, i32 0, i32 0} ; [ DW_TAG_template_value_parameter ]
!137 = metadata !{i32 786478, i32 0, metadata !78, metadata !"ap_fixed_base<27, 3, true, 0, 0, 0>", metadata !"ap_fixed_base<27, 3, true, 0, 0, 0>", metadata !"", metadata !79, i32 777, metadata !138, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, metadata !113, i32 0, metadata !91, i32 777} ; [ DW_TAG_subprogram ]
!138 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !139, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!139 = metadata !{null, metadata !101, metadata !140}
!140 = metadata !{i32 786448, null, null, null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !141} ; [ DW_TAG_reference_type ]
!141 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !142} ; [ DW_TAG_const_type ]
!142 = metadata !{i32 786485, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !78} ; [ DW_TAG_volatile_type ]
!143 = metadata !{i32 786478, i32 0, metadata !78, metadata !"ap_fixed_base", metadata !"ap_fixed_base", metadata !"", metadata !79, i32 789, metadata !144, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !91, i32 789} ; [ DW_TAG_subprogram ]
!144 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !145, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!145 = metadata !{null, metadata !101, metadata !97}
!146 = metadata !{i32 786478, i32 0, metadata !78, metadata !"ap_fixed_base", metadata !"ap_fixed_base", metadata !"", metadata !79, i32 790, metadata !147, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !91, i32 790} ; [ DW_TAG_subprogram ]
!147 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !148, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!148 = metadata !{null, metadata !101, metadata !149}
!149 = metadata !{i32 786468, null, metadata !"char", null, i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ]
!150 = metadata !{i32 786478, i32 0, metadata !78, metadata !"ap_fixed_base", metadata !"ap_fixed_base", metadata !"", metadata !79, i32 791, metadata !151, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !91, i32 791} ; [ DW_TAG_subprogram ]
!151 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !152, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!152 = metadata !{null, metadata !101, metadata !153}
!153 = metadata !{i32 786468, null, metadata !"signed char", null, i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ]
!154 = metadata !{i32 786478, i32 0, metadata !78, metadata !"ap_fixed_base", metadata !"ap_fixed_base", metadata !"", metadata !79, i32 792, metadata !155, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !91, i32 792} ; [ DW_TAG_subprogram ]
!155 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !156, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!156 = metadata !{null, metadata !101, metadata !157}
!157 = metadata !{i32 786468, null, metadata !"unsigned char", null, i32 0, i64 8, i64 8, i64 0, i32 0, i32 8} ; [ DW_TAG_base_type ]
!158 = metadata !{i32 786478, i32 0, metadata !78, metadata !"ap_fixed_base", metadata !"ap_fixed_base", metadata !"", metadata !79, i32 793, metadata !159, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !91, i32 793} ; [ DW_TAG_subprogram ]
!159 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !160, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!160 = metadata !{null, metadata !101, metadata !161}
!161 = metadata !{i32 786468, null, metadata !"short", null, i32 0, i64 16, i64 16, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!162 = metadata !{i32 786478, i32 0, metadata !78, metadata !"ap_fixed_base", metadata !"ap_fixed_base", metadata !"", metadata !79, i32 794, metadata !163, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !91, i32 794} ; [ DW_TAG_subprogram ]
!163 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !164, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!164 = metadata !{null, metadata !101, metadata !165}
!165 = metadata !{i32 786468, null, metadata !"unsigned short", null, i32 0, i64 16, i64 16, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!166 = metadata !{i32 786478, i32 0, metadata !78, metadata !"ap_fixed_base", metadata !"ap_fixed_base", metadata !"", metadata !79, i32 795, metadata !167, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !91, i32 795} ; [ DW_TAG_subprogram ]
!167 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !168, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!168 = metadata !{null, metadata !101, metadata !95}
!169 = metadata !{i32 786478, i32 0, metadata !78, metadata !"ap_fixed_base", metadata !"ap_fixed_base", metadata !"", metadata !79, i32 796, metadata !170, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !91, i32 796} ; [ DW_TAG_subprogram ]
!170 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !171, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!171 = metadata !{null, metadata !101, metadata !172}
!172 = metadata !{i32 786468, null, metadata !"unsigned int", null, i32 0, i64 32, i64 32, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!173 = metadata !{i32 786478, i32 0, metadata !78, metadata !"ap_fixed_base", metadata !"ap_fixed_base", metadata !"", metadata !79, i32 801, metadata !174, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !91, i32 801} ; [ DW_TAG_subprogram ]
!174 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !175, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!175 = metadata !{null, metadata !101, metadata !176}
!176 = metadata !{i32 786468, null, metadata !"long int", null, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!177 = metadata !{i32 786478, i32 0, metadata !78, metadata !"ap_fixed_base", metadata !"ap_fixed_base", metadata !"", metadata !79, i32 802, metadata !178, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !91, i32 802} ; [ DW_TAG_subprogram ]
!178 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !179, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!179 = metadata !{null, metadata !101, metadata !180}
!180 = metadata !{i32 786468, null, metadata !"long unsigned int", null, i32 0, i64 32, i64 32, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!181 = metadata !{i32 786478, i32 0, metadata !78, metadata !"ap_fixed_base", metadata !"ap_fixed_base", metadata !"", metadata !79, i32 804, metadata !182, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !91, i32 804} ; [ DW_TAG_subprogram ]
!182 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !183, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!183 = metadata !{null, metadata !101, metadata !184}
!184 = metadata !{i32 786454, null, metadata !"ap_slong", metadata !79, i32 112, i64 0, i64 0, i64 0, i32 0, metadata !185} ; [ DW_TAG_typedef ]
!185 = metadata !{i32 786468, null, metadata !"long long int", null, i32 0, i64 64, i64 64, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!186 = metadata !{i32 786478, i32 0, metadata !78, metadata !"ap_fixed_base", metadata !"ap_fixed_base", metadata !"", metadata !79, i32 805, metadata !187, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !91, i32 805} ; [ DW_TAG_subprogram ]
!187 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !188, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!188 = metadata !{null, metadata !101, metadata !189}
!189 = metadata !{i32 786454, null, metadata !"ap_ulong", metadata !79, i32 111, i64 0, i64 0, i64 0, i32 0, metadata !190} ; [ DW_TAG_typedef ]
!190 = metadata !{i32 786468, null, metadata !"long long unsigned int", null, i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!191 = metadata !{i32 786478, i32 0, metadata !78, metadata !"ap_fixed_base", metadata !"ap_fixed_base", metadata !"", metadata !79, i32 806, metadata !192, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !91, i32 806} ; [ DW_TAG_subprogram ]
!192 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !193, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!193 = metadata !{null, metadata !101, metadata !194}
!194 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 32, i64 32, i64 0, i32 0, metadata !195} ; [ DW_TAG_pointer_type ]
!195 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !149} ; [ DW_TAG_const_type ]
!196 = metadata !{i32 786478, i32 0, metadata !78, metadata !"ap_fixed_base", metadata !"ap_fixed_base", metadata !"", metadata !79, i32 813, metadata !197, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !91, i32 813} ; [ DW_TAG_subprogram ]
!197 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !198, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!198 = metadata !{null, metadata !101, metadata !194, metadata !153}
!199 = metadata !{i32 786478, i32 0, metadata !78, metadata !"doubleToRawBits", metadata !"doubleToRawBits", metadata !"_ZNK13ap_fixed_baseILi27ELi3ELb1EL9ap_q_mode0EL9ap_o_mode0ELi0EE15doubleToRawBitsEd", metadata !79, i32 849, metadata !200, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !91, i32 849} ; [ DW_TAG_subprogram ]
!200 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !201, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!201 = metadata !{metadata !190, metadata !202, metadata !203}
!202 = metadata !{i32 786447, i32 0, metadata !"", i32 0, i32 0, i64 32, i64 32, i64 0, i32 64, metadata !112} ; [ DW_TAG_pointer_type ]
!203 = metadata !{i32 786468, null, metadata !"double", null, i32 0, i64 64, i64 64, i64 0, i32 0, i32 4} ; [ DW_TAG_base_type ]
!204 = metadata !{i32 786478, i32 0, metadata !78, metadata !"floatToRawBits", metadata !"floatToRawBits", metadata !"_ZNK13ap_fixed_baseILi27ELi3ELb1EL9ap_q_mode0EL9ap_o_mode0ELi0EE14floatToRawBitsEf", metadata !79, i32 857, metadata !205, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !91, i32 857} ; [ DW_TAG_subprogram ]
!205 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !206, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!206 = metadata !{metadata !172, metadata !202, metadata !207}
!207 = metadata !{i32 786468, null, metadata !"float", null, i32 0, i64 32, i64 32, i64 0, i32 0, i32 4} ; [ DW_TAG_base_type ]
!208 = metadata !{i32 786478, i32 0, metadata !78, metadata !"halfToRawBits", metadata !"halfToRawBits", metadata !"_ZNK13ap_fixed_baseILi27ELi3ELb1EL9ap_q_mode0EL9ap_o_mode0ELi0EE13halfToRawBitsEDh", metadata !79, i32 865, metadata !209, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !91, i32 865} ; [ DW_TAG_subprogram ]
!209 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !210, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!210 = metadata !{metadata !165, metadata !202, metadata !211}
!211 = metadata !{i32 786454, null, metadata !"half", metadata !79, i32 54, i64 0, i64 0, i64 0, i32 0, metadata !212} ; [ DW_TAG_typedef ]
!212 = metadata !{i32 786468, null, metadata !"half", null, i32 0, i64 16, i64 16, i64 0, i32 0, i32 4} ; [ DW_TAG_base_type ]
!213 = metadata !{i32 786478, i32 0, metadata !78, metadata !"rawBitsToDouble", metadata !"rawBitsToDouble", metadata !"_ZNK13ap_fixed_baseILi27ELi3ELb1EL9ap_q_mode0EL9ap_o_mode0ELi0EE15rawBitsToDoubleEy", metadata !79, i32 874, metadata !214, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !91, i32 874} ; [ DW_TAG_subprogram ]
!214 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !215, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!215 = metadata !{metadata !203, metadata !202, metadata !190}
!216 = metadata !{i32 786478, i32 0, metadata !78, metadata !"rawBitsToFloat", metadata !"rawBitsToFloat", metadata !"_ZNK13ap_fixed_baseILi27ELi3ELb1EL9ap_q_mode0EL9ap_o_mode0ELi0EE14rawBitsToFloatEj", metadata !79, i32 883, metadata !217, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !91, i32 883} ; [ DW_TAG_subprogram ]
!217 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !218, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!218 = metadata !{metadata !207, metadata !202, metadata !172}
!219 = metadata !{i32 786478, i32 0, metadata !78, metadata !"rawBitsToHalf", metadata !"rawBitsToHalf", metadata !"_ZNK13ap_fixed_baseILi27ELi3ELb1EL9ap_q_mode0EL9ap_o_mode0ELi0EE13rawBitsToHalfEt", metadata !79, i32 892, metadata !220, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !91, i32 892} ; [ DW_TAG_subprogram ]
!220 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !221, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!221 = metadata !{metadata !211, metadata !202, metadata !165}
!222 = metadata !{i32 786478, i32 0, metadata !78, metadata !"ap_fixed_base", metadata !"ap_fixed_base", metadata !"", metadata !79, i32 901, metadata !223, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !91, i32 901} ; [ DW_TAG_subprogram ]
!223 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !224, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!224 = metadata !{null, metadata !101, metadata !203}
!225 = metadata !{i32 786478, i32 0, metadata !78, metadata !"ap_fixed_base", metadata !"ap_fixed_base", metadata !"", metadata !79, i32 1014, metadata !226, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !91, i32 1014} ; [ DW_TAG_subprogram ]
!226 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !227, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!227 = metadata !{null, metadata !101, metadata !207}
!228 = metadata !{i32 786478, i32 0, metadata !78, metadata !"ap_fixed_base", metadata !"ap_fixed_base", metadata !"", metadata !79, i32 1018, metadata !229, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !91, i32 1018} ; [ DW_TAG_subprogram ]
!229 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !230, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!230 = metadata !{null, metadata !101, metadata !211}
!231 = metadata !{i32 786478, i32 0, metadata !78, metadata !"operator=", metadata !"operator=", metadata !"_ZN13ap_fixed_baseILi27ELi3ELb1EL9ap_q_mode0EL9ap_o_mode0ELi0EEaSERKS2_", metadata !79, i32 1022, metadata !232, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !91, i32 1022} ; [ DW_TAG_subprogram ]
!232 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !233, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!233 = metadata !{metadata !234, metadata !101, metadata !111}
!234 = metadata !{i32 786448, null, null, null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !78} ; [ DW_TAG_reference_type ]
!235 = metadata !{i32 786478, i32 0, metadata !78, metadata !"operator=", metadata !"operator=", metadata !"_ZN13ap_fixed_baseILi27ELi3ELb1EL9ap_q_mode0EL9ap_o_mode0ELi0EEaSERVKS2_", metadata !79, i32 1029, metadata !236, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !91, i32 1029} ; [ DW_TAG_subprogram ]
!236 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !237, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!237 = metadata !{metadata !234, metadata !101, metadata !140}
!238 = metadata !{i32 786478, i32 0, metadata !78, metadata !"operator=", metadata !"operator=", metadata !"_ZNV13ap_fixed_baseILi27ELi3ELb1EL9ap_q_mode0EL9ap_o_mode0ELi0EEaSERKS2_", metadata !79, i32 1036, metadata !239, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !91, i32 1036} ; [ DW_TAG_subprogram ]
!239 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !240, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!240 = metadata !{null, metadata !241, metadata !111}
!241 = metadata !{i32 786447, i32 0, metadata !"", i32 0, i32 0, i64 32, i64 32, i64 0, i32 64, metadata !142} ; [ DW_TAG_pointer_type ]
!242 = metadata !{i32 786478, i32 0, metadata !78, metadata !"operator=", metadata !"operator=", metadata !"_ZNV13ap_fixed_baseILi27ELi3ELb1EL9ap_q_mode0EL9ap_o_mode0ELi0EEaSERVKS2_", metadata !79, i32 1042, metadata !243, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !91, i32 1042} ; [ DW_TAG_subprogram ]
!243 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !244, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!244 = metadata !{null, metadata !241, metadata !140}
!245 = metadata !{i32 786478, i32 0, metadata !78, metadata !"setBits", metadata !"setBits", metadata !"_ZN13ap_fixed_baseILi27ELi3ELb1EL9ap_q_mode0EL9ap_o_mode0ELi0EE7setBitsEy", metadata !79, i32 1051, metadata !246, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !91, i32 1051} ; [ DW_TAG_subprogram ]
!246 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !247, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!247 = metadata !{metadata !234, metadata !101, metadata !190}
!248 = metadata !{i32 786478, i32 0, metadata !78, metadata !"bitsToFixed", metadata !"bitsToFixed", metadata !"_ZN13ap_fixed_baseILi27ELi3ELb1EL9ap_q_mode0EL9ap_o_mode0ELi0EE11bitsToFixedEy", metadata !79, i32 1057, metadata !249, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !91, i32 1057} ; [ DW_TAG_subprogram ]
!249 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !250, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!250 = metadata !{metadata !78, metadata !190}
!251 = metadata !{i32 786478, i32 0, metadata !78, metadata !"to_ap_int_base", metadata !"to_ap_int_base", metadata !"_ZNK13ap_fixed_baseILi27ELi3ELb1EL9ap_q_mode0EL9ap_o_mode0ELi0EE14to_ap_int_baseEb", metadata !79, i32 1066, metadata !252, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !91, i32 1066} ; [ DW_TAG_subprogram ]
!252 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !253, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!253 = metadata !{metadata !254, metadata !202, metadata !97}
!254 = metadata !{i32 786434, null, metadata !"ap_int_base<3, true, true>", metadata !119, i32 651, i32 0, i32 0, i32 0, i32 4, null, null, i32 0} ; [ DW_TAG_class_type ]
!255 = metadata !{i32 786478, i32 0, metadata !78, metadata !"to_int", metadata !"to_int", metadata !"_ZNK13ap_fixed_baseILi27ELi3ELb1EL9ap_q_mode0EL9ap_o_mode0ELi0EE6to_intEv", metadata !79, i32 1101, metadata !256, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !91, i32 1101} ; [ DW_TAG_subprogram ]
!256 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !257, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!257 = metadata !{metadata !95, metadata !202}
!258 = metadata !{i32 786478, i32 0, metadata !78, metadata !"to_uint", metadata !"to_uint", metadata !"_ZNK13ap_fixed_baseILi27ELi3ELb1EL9ap_q_mode0EL9ap_o_mode0ELi0EE7to_uintEv", metadata !79, i32 1104, metadata !259, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !91, i32 1104} ; [ DW_TAG_subprogram ]
!259 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !260, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!260 = metadata !{metadata !172, metadata !202}
!261 = metadata !{i32 786478, i32 0, metadata !78, metadata !"to_int64", metadata !"to_int64", metadata !"_ZNK13ap_fixed_baseILi27ELi3ELb1EL9ap_q_mode0EL9ap_o_mode0ELi0EE8to_int64Ev", metadata !79, i32 1107, metadata !262, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !91, i32 1107} ; [ DW_TAG_subprogram ]
!262 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !263, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!263 = metadata !{metadata !184, metadata !202}
!264 = metadata !{i32 786478, i32 0, metadata !78, metadata !"to_uint64", metadata !"to_uint64", metadata !"_ZNK13ap_fixed_baseILi27ELi3ELb1EL9ap_q_mode0EL9ap_o_mode0ELi0EE9to_uint64Ev", metadata !79, i32 1110, metadata !265, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !91, i32 1110} ; [ DW_TAG_subprogram ]
!265 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !266, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!266 = metadata !{metadata !189, metadata !202}
!267 = metadata !{i32 786478, i32 0, metadata !78, metadata !"to_double", metadata !"to_double", metadata !"_ZNK13ap_fixed_baseILi27ELi3ELb1EL9ap_q_mode0EL9ap_o_mode0ELi0EE9to_doubleEv", metadata !79, i32 1113, metadata !268, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !91, i32 1113} ; [ DW_TAG_subprogram ]
!268 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !269, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!269 = metadata !{metadata !203, metadata !202}
!270 = metadata !{i32 786478, i32 0, metadata !78, metadata !"to_float", metadata !"to_float", metadata !"_ZNK13ap_fixed_baseILi27ELi3ELb1EL9ap_q_mode0EL9ap_o_mode0ELi0EE8to_floatEv", metadata !79, i32 1166, metadata !271, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !91, i32 1166} ; [ DW_TAG_subprogram ]
!271 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !272, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!272 = metadata !{metadata !207, metadata !202}
!273 = metadata !{i32 786478, i32 0, metadata !78, metadata !"to_half", metadata !"to_half", metadata !"_ZNK13ap_fixed_baseILi27ELi3ELb1EL9ap_q_mode0EL9ap_o_mode0ELi0EE7to_halfEv", metadata !79, i32 1215, metadata !274, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !91, i32 1215} ; [ DW_TAG_subprogram ]
!274 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !275, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!275 = metadata !{metadata !211, metadata !202}
!276 = metadata !{i32 786478, i32 0, metadata !78, metadata !"operator double", metadata !"operator double", metadata !"_ZNK13ap_fixed_baseILi27ELi3ELb1EL9ap_q_mode0EL9ap_o_mode0ELi0EEcvdEv", metadata !79, i32 1265, metadata !268, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !91, i32 1265} ; [ DW_TAG_subprogram ]
!277 = metadata !{i32 786478, i32 0, metadata !78, metadata !"operator float", metadata !"operator float", metadata !"_ZNK13ap_fixed_baseILi27ELi3ELb1EL9ap_q_mode0EL9ap_o_mode0ELi0EEcvfEv", metadata !79, i32 1269, metadata !271, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !91, i32 1269} ; [ DW_TAG_subprogram ]
!278 = metadata !{i32 786478, i32 0, metadata !78, metadata !"operator half", metadata !"operator half", metadata !"_ZNK13ap_fixed_baseILi27ELi3ELb1EL9ap_q_mode0EL9ap_o_mode0ELi0EEcvDhEv", metadata !79, i32 1272, metadata !274, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !91, i32 1272} ; [ DW_TAG_subprogram ]
!279 = metadata !{i32 786478, i32 0, metadata !78, metadata !"operator char", metadata !"operator char", metadata !"_ZNK13ap_fixed_baseILi27ELi3ELb1EL9ap_q_mode0EL9ap_o_mode0ELi0EEcvcEv", metadata !79, i32 1275, metadata !280, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !91, i32 1275} ; [ DW_TAG_subprogram ]
!280 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !281, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!281 = metadata !{metadata !149, metadata !202}
!282 = metadata !{i32 786478, i32 0, metadata !78, metadata !"operator signed char", metadata !"operator signed char", metadata !"_ZNK13ap_fixed_baseILi27ELi3ELb1EL9ap_q_mode0EL9ap_o_mode0ELi0EEcvaEv", metadata !79, i32 1279, metadata !283, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !91, i32 1279} ; [ DW_TAG_subprogram ]
!283 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !284, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!284 = metadata !{metadata !153, metadata !202}
!285 = metadata !{i32 786478, i32 0, metadata !78, metadata !"operator unsigned char", metadata !"operator unsigned char", metadata !"_ZNK13ap_fixed_baseILi27ELi3ELb1EL9ap_q_mode0EL9ap_o_mode0ELi0EEcvhEv", metadata !79, i32 1283, metadata !286, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !91, i32 1283} ; [ DW_TAG_subprogram ]
!286 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !287, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!287 = metadata !{metadata !157, metadata !202}
!288 = metadata !{i32 786478, i32 0, metadata !78, metadata !"operator short", metadata !"operator short", metadata !"_ZNK13ap_fixed_baseILi27ELi3ELb1EL9ap_q_mode0EL9ap_o_mode0ELi0EEcvsEv", metadata !79, i32 1287, metadata !289, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !91, i32 1287} ; [ DW_TAG_subprogram ]
!289 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !290, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!290 = metadata !{metadata !161, metadata !202}
!291 = metadata !{i32 786478, i32 0, metadata !78, metadata !"operator unsigned short", metadata !"operator unsigned short", metadata !"_ZNK13ap_fixed_baseILi27ELi3ELb1EL9ap_q_mode0EL9ap_o_mode0ELi0EEcvtEv", metadata !79, i32 1291, metadata !292, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !91, i32 1291} ; [ DW_TAG_subprogram ]
!292 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !293, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!293 = metadata !{metadata !165, metadata !202}
!294 = metadata !{i32 786478, i32 0, metadata !78, metadata !"operator int", metadata !"operator int", metadata !"_ZNK13ap_fixed_baseILi27ELi3ELb1EL9ap_q_mode0EL9ap_o_mode0ELi0EEcviEv", metadata !79, i32 1296, metadata !256, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !91, i32 1296} ; [ DW_TAG_subprogram ]
!295 = metadata !{i32 786478, i32 0, metadata !78, metadata !"operator unsigned int", metadata !"operator unsigned int", metadata !"_ZNK13ap_fixed_baseILi27ELi3ELb1EL9ap_q_mode0EL9ap_o_mode0ELi0EEcvjEv", metadata !79, i32 1300, metadata !259, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !91, i32 1300} ; [ DW_TAG_subprogram ]
!296 = metadata !{i32 786478, i32 0, metadata !78, metadata !"operator long", metadata !"operator long", metadata !"_ZNK13ap_fixed_baseILi27ELi3ELb1EL9ap_q_mode0EL9ap_o_mode0ELi0EEcvlEv", metadata !79, i32 1313, metadata !297, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !91, i32 1313} ; [ DW_TAG_subprogram ]
!297 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !298, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!298 = metadata !{metadata !176, metadata !202}
!299 = metadata !{i32 786478, i32 0, metadata !78, metadata !"operator unsigned long", metadata !"operator unsigned long", metadata !"_ZNK13ap_fixed_baseILi27ELi3ELb1EL9ap_q_mode0EL9ap_o_mode0ELi0EEcvmEv", metadata !79, i32 1317, metadata !300, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !91, i32 1317} ; [ DW_TAG_subprogram ]
!300 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !301, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!301 = metadata !{metadata !180, metadata !202}
!302 = metadata !{i32 786478, i32 0, metadata !78, metadata !"operator unsigned long long", metadata !"operator unsigned long long", metadata !"_ZNK13ap_fixed_baseILi27ELi3ELb1EL9ap_q_mode0EL9ap_o_mode0ELi0EEcvyEv", metadata !79, i32 1322, metadata !303, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !91, i32 1322} ; [ DW_TAG_subprogram ]
!303 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !304, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!304 = metadata !{metadata !190, metadata !202}
!305 = metadata !{i32 786478, i32 0, metadata !78, metadata !"operator long long", metadata !"operator long long", metadata !"_ZNK13ap_fixed_baseILi27ELi3ELb1EL9ap_q_mode0EL9ap_o_mode0ELi0EEcvxEv", metadata !79, i32 1326, metadata !306, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !91, i32 1326} ; [ DW_TAG_subprogram ]
!306 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !307, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!307 = metadata !{metadata !185, metadata !202}
!308 = metadata !{i32 786478, i32 0, metadata !78, metadata !"length", metadata !"length", metadata !"_ZNK13ap_fixed_baseILi27ELi3ELb1EL9ap_q_mode0EL9ap_o_mode0ELi0EE6lengthEv", metadata !79, i32 1330, metadata !256, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !91, i32 1330} ; [ DW_TAG_subprogram ]
!309 = metadata !{i32 786478, i32 0, metadata !78, metadata !"countLeadingZeros", metadata !"countLeadingZeros", metadata !"_ZN13ap_fixed_baseILi27ELi3ELb1EL9ap_q_mode0EL9ap_o_mode0ELi0EE17countLeadingZerosEv", metadata !79, i32 1334, metadata !310, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !91, i32 1334} ; [ DW_TAG_subprogram ]
!310 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !311, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!311 = metadata !{metadata !95, metadata !101}
!312 = metadata !{i32 786478, i32 0, metadata !78, metadata !"operator++", metadata !"operator++", metadata !"_ZN13ap_fixed_baseILi27ELi3ELb1EL9ap_q_mode0EL9ap_o_mode0ELi0EEppEv", metadata !79, i32 1435, metadata !313, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !91, i32 1435} ; [ DW_TAG_subprogram ]
!313 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !314, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!314 = metadata !{metadata !234, metadata !101}
!315 = metadata !{i32 786478, i32 0, metadata !78, metadata !"operator--", metadata !"operator--", metadata !"_ZN13ap_fixed_baseILi27ELi3ELb1EL9ap_q_mode0EL9ap_o_mode0ELi0EEmmEv", metadata !79, i32 1439, metadata !313, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !91, i32 1439} ; [ DW_TAG_subprogram ]
!316 = metadata !{i32 786478, i32 0, metadata !78, metadata !"operator++", metadata !"operator++", metadata !"_ZN13ap_fixed_baseILi27ELi3ELb1EL9ap_q_mode0EL9ap_o_mode0ELi0EEppEi", metadata !79, i32 1447, metadata !317, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !91, i32 1447} ; [ DW_TAG_subprogram ]
!317 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !318, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!318 = metadata !{metadata !112, metadata !101, metadata !95}
!319 = metadata !{i32 786478, i32 0, metadata !78, metadata !"operator--", metadata !"operator--", metadata !"_ZN13ap_fixed_baseILi27ELi3ELb1EL9ap_q_mode0EL9ap_o_mode0ELi0EEmmEi", metadata !79, i32 1453, metadata !317, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !91, i32 1453} ; [ DW_TAG_subprogram ]
!320 = metadata !{i32 786478, i32 0, metadata !78, metadata !"operator+", metadata !"operator+", metadata !"_ZN13ap_fixed_baseILi27ELi3ELb1EL9ap_q_mode0EL9ap_o_mode0ELi0EEpsEv", metadata !79, i32 1461, metadata !321, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !91, i32 1461} ; [ DW_TAG_subprogram ]
!321 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !322, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!322 = metadata !{metadata !78, metadata !101}
!323 = metadata !{i32 786478, i32 0, metadata !78, metadata !"operator-", metadata !"operator-", metadata !"_ZNK13ap_fixed_baseILi27ELi3ELb1EL9ap_q_mode0EL9ap_o_mode0ELi0EEngEv", metadata !79, i32 1465, metadata !324, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !91, i32 1465} ; [ DW_TAG_subprogram ]
!324 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !325, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!325 = metadata !{metadata !326, metadata !202}
!326 = metadata !{i32 786434, null, metadata !"ap_fixed_base<28, 4, true, 5, 3, 0>", metadata !79, i32 512, i32 0, i32 0, i32 0, i32 4, null, null, i32 0} ; [ DW_TAG_class_type ]
!327 = metadata !{i32 786478, i32 0, metadata !78, metadata !"getNeg", metadata !"getNeg", metadata !"_ZN13ap_fixed_baseILi27ELi3ELb1EL9ap_q_mode0EL9ap_o_mode0ELi0EE6getNegEv", metadata !79, i32 1471, metadata !321, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !91, i32 1471} ; [ DW_TAG_subprogram ]
!328 = metadata !{i32 786478, i32 0, metadata !78, metadata !"operator!", metadata !"operator!", metadata !"_ZNK13ap_fixed_baseILi27ELi3ELb1EL9ap_q_mode0EL9ap_o_mode0ELi0EEntEv", metadata !79, i32 1479, metadata !329, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !91, i32 1479} ; [ DW_TAG_subprogram ]
!329 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !330, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!330 = metadata !{metadata !97, metadata !202}
!331 = metadata !{i32 786478, i32 0, metadata !78, metadata !"operator~", metadata !"operator~", metadata !"_ZNK13ap_fixed_baseILi27ELi3ELb1EL9ap_q_mode0EL9ap_o_mode0ELi0EEcoEv", metadata !79, i32 1485, metadata !332, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !91, i32 1485} ; [ DW_TAG_subprogram ]
!332 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !333, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!333 = metadata !{metadata !334, metadata !202}
!334 = metadata !{i32 786434, null, metadata !"ap_fixed_base<27, 3, true, 5, 3, 0>", metadata !79, i32 512, i32 0, i32 0, i32 0, i32 4, null, null, i32 0} ; [ DW_TAG_class_type ]
!335 = metadata !{i32 786478, i32 0, metadata !78, metadata !"operator<<", metadata !"operator<<", metadata !"_ZNK13ap_fixed_baseILi27ELi3ELb1EL9ap_q_mode0EL9ap_o_mode0ELi0EElsEi", metadata !79, i32 1508, metadata !336, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !91, i32 1508} ; [ DW_TAG_subprogram ]
!336 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !337, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!337 = metadata !{metadata !78, metadata !202, metadata !95}
!338 = metadata !{i32 786478, i32 0, metadata !78, metadata !"operator<<", metadata !"operator<<", metadata !"_ZNK13ap_fixed_baseILi27ELi3ELb1EL9ap_q_mode0EL9ap_o_mode0ELi0EElsEj", metadata !79, i32 1567, metadata !339, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !91, i32 1567} ; [ DW_TAG_subprogram ]
!339 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !340, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!340 = metadata !{metadata !78, metadata !202, metadata !172}
!341 = metadata !{i32 786478, i32 0, metadata !78, metadata !"operator>>", metadata !"operator>>", metadata !"_ZNK13ap_fixed_baseILi27ELi3ELb1EL9ap_q_mode0EL9ap_o_mode0ELi0EErsEi", metadata !79, i32 1611, metadata !336, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !91, i32 1611} ; [ DW_TAG_subprogram ]
!342 = metadata !{i32 786478, i32 0, metadata !78, metadata !"operator>>", metadata !"operator>>", metadata !"_ZNK13ap_fixed_baseILi27ELi3ELb1EL9ap_q_mode0EL9ap_o_mode0ELi0EErsEj", metadata !79, i32 1669, metadata !339, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !91, i32 1669} ; [ DW_TAG_subprogram ]
!343 = metadata !{i32 786478, i32 0, metadata !78, metadata !"operator<<=", metadata !"operator<<=", metadata !"_ZN13ap_fixed_baseILi27ELi3ELb1EL9ap_q_mode0EL9ap_o_mode0ELi0EElSEi", metadata !79, i32 1721, metadata !344, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !91, i32 1721} ; [ DW_TAG_subprogram ]
!344 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !345, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!345 = metadata !{metadata !234, metadata !101, metadata !95}
!346 = metadata !{i32 786478, i32 0, metadata !78, metadata !"operator<<=", metadata !"operator<<=", metadata !"_ZN13ap_fixed_baseILi27ELi3ELb1EL9ap_q_mode0EL9ap_o_mode0ELi0EElSEj", metadata !79, i32 1784, metadata !347, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !91, i32 1784} ; [ DW_TAG_subprogram ]
!347 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !348, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!348 = metadata !{metadata !234, metadata !101, metadata !172}
!349 = metadata !{i32 786478, i32 0, metadata !78, metadata !"operator>>=", metadata !"operator>>=", metadata !"_ZN13ap_fixed_baseILi27ELi3ELb1EL9ap_q_mode0EL9ap_o_mode0ELi0EErSEi", metadata !79, i32 1831, metadata !344, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !91, i32 1831} ; [ DW_TAG_subprogram ]
!350 = metadata !{i32 786478, i32 0, metadata !78, metadata !"operator>>=", metadata !"operator>>=", metadata !"_ZN13ap_fixed_baseILi27ELi3ELb1EL9ap_q_mode0EL9ap_o_mode0ELi0EErSEj", metadata !79, i32 1893, metadata !347, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !91, i32 1893} ; [ DW_TAG_subprogram ]
!351 = metadata !{i32 786478, i32 0, metadata !78, metadata !"operator==", metadata !"operator==", metadata !"_ZNK13ap_fixed_baseILi27ELi3ELb1EL9ap_q_mode0EL9ap_o_mode0ELi0EEeqEd", metadata !79, i32 1971, metadata !352, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !91, i32 1971} ; [ DW_TAG_subprogram ]
!352 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !353, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!353 = metadata !{metadata !97, metadata !202, metadata !203}
!354 = metadata !{i32 786478, i32 0, metadata !78, metadata !"operator!=", metadata !"operator!=", metadata !"_ZNK13ap_fixed_baseILi27ELi3ELb1EL9ap_q_mode0EL9ap_o_mode0ELi0EEneEd", metadata !79, i32 1972, metadata !352, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !91, i32 1972} ; [ DW_TAG_subprogram ]
!355 = metadata !{i32 786478, i32 0, metadata !78, metadata !"operator>", metadata !"operator>", metadata !"_ZNK13ap_fixed_baseILi27ELi3ELb1EL9ap_q_mode0EL9ap_o_mode0ELi0EEgtEd", metadata !79, i32 1973, metadata !352, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !91, i32 1973} ; [ DW_TAG_subprogram ]
!356 = metadata !{i32 786478, i32 0, metadata !78, metadata !"operator>=", metadata !"operator>=", metadata !"_ZNK13ap_fixed_baseILi27ELi3ELb1EL9ap_q_mode0EL9ap_o_mode0ELi0EEgeEd", metadata !79, i32 1974, metadata !352, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !91, i32 1974} ; [ DW_TAG_subprogram ]
!357 = metadata !{i32 786478, i32 0, metadata !78, metadata !"operator<", metadata !"operator<", metadata !"_ZNK13ap_fixed_baseILi27ELi3ELb1EL9ap_q_mode0EL9ap_o_mode0ELi0EEltEd", metadata !79, i32 1975, metadata !352, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !91, i32 1975} ; [ DW_TAG_subprogram ]
!358 = metadata !{i32 786478, i32 0, metadata !78, metadata !"operator<=", metadata !"operator<=", metadata !"_ZNK13ap_fixed_baseILi27ELi3ELb1EL9ap_q_mode0EL9ap_o_mode0ELi0EEleEd", metadata !79, i32 1976, metadata !352, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !91, i32 1976} ; [ DW_TAG_subprogram ]
!359 = metadata !{i32 786478, i32 0, metadata !78, metadata !"operator[]", metadata !"operator[]", metadata !"_ZN13ap_fixed_baseILi27ELi3ELb1EL9ap_q_mode0EL9ap_o_mode0ELi0EEixEj", metadata !79, i32 1979, metadata !360, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !91, i32 1979} ; [ DW_TAG_subprogram ]
!360 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !361, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!361 = metadata !{metadata !362, metadata !101, metadata !172}
!362 = metadata !{i32 786434, null, metadata !"af_bit_ref<27, 3, true, 0, 0, 0>", metadata !79, i32 93, i32 0, i32 0, i32 0, i32 4, null, null, i32 0} ; [ DW_TAG_class_type ]
!363 = metadata !{i32 786478, i32 0, metadata !78, metadata !"operator[]", metadata !"operator[]", metadata !"_ZNK13ap_fixed_baseILi27ELi3ELb1EL9ap_q_mode0EL9ap_o_mode0ELi0EEixEj", metadata !79, i32 1991, metadata !364, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !91, i32 1991} ; [ DW_TAG_subprogram ]
!364 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !365, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!365 = metadata !{metadata !97, metadata !202, metadata !172}
!366 = metadata !{i32 786478, i32 0, metadata !78, metadata !"bit", metadata !"bit", metadata !"_ZN13ap_fixed_baseILi27ELi3ELb1EL9ap_q_mode0EL9ap_o_mode0ELi0EE3bitEj", metadata !79, i32 1996, metadata !360, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !91, i32 1996} ; [ DW_TAG_subprogram ]
!367 = metadata !{i32 786478, i32 0, metadata !78, metadata !"bit", metadata !"bit", metadata !"_ZNK13ap_fixed_baseILi27ELi3ELb1EL9ap_q_mode0EL9ap_o_mode0ELi0EE3bitEj", metadata !79, i32 2009, metadata !364, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !91, i32 2009} ; [ DW_TAG_subprogram ]
!368 = metadata !{i32 786478, i32 0, metadata !78, metadata !"get_bit", metadata !"get_bit", metadata !"_ZNK13ap_fixed_baseILi27ELi3ELb1EL9ap_q_mode0EL9ap_o_mode0ELi0EE7get_bitEi", metadata !79, i32 2021, metadata !369, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !91, i32 2021} ; [ DW_TAG_subprogram ]
!369 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !370, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!370 = metadata !{metadata !97, metadata !202, metadata !95}
!371 = metadata !{i32 786478, i32 0, metadata !78, metadata !"get_bit", metadata !"get_bit", metadata !"_ZN13ap_fixed_baseILi27ELi3ELb1EL9ap_q_mode0EL9ap_o_mode0ELi0EE7get_bitEi", metadata !79, i32 2027, metadata !372, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !91, i32 2027} ; [ DW_TAG_subprogram ]
!372 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !373, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!373 = metadata !{metadata !362, metadata !101, metadata !95}
!374 = metadata !{i32 786478, i32 0, metadata !78, metadata !"range", metadata !"range", metadata !"_ZN13ap_fixed_baseILi27ELi3ELb1EL9ap_q_mode0EL9ap_o_mode0ELi0EE5rangeEii", metadata !79, i32 2042, metadata !375, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !91, i32 2042} ; [ DW_TAG_subprogram ]
!375 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !376, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!376 = metadata !{metadata !377, metadata !101, metadata !95, metadata !95}
!377 = metadata !{i32 786434, null, metadata !"af_range_ref<27, 3, true, 0, 0, 0>", metadata !79, i32 238, i32 0, i32 0, i32 0, i32 4, null, null, i32 0} ; [ DW_TAG_class_type ]
!378 = metadata !{i32 786478, i32 0, metadata !78, metadata !"operator()", metadata !"operator()", metadata !"_ZN13ap_fixed_baseILi27ELi3ELb1EL9ap_q_mode0EL9ap_o_mode0ELi0EEclEii", metadata !79, i32 2048, metadata !375, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !91, i32 2048} ; [ DW_TAG_subprogram ]
!379 = metadata !{i32 786478, i32 0, metadata !78, metadata !"range", metadata !"range", metadata !"_ZNK13ap_fixed_baseILi27ELi3ELb1EL9ap_q_mode0EL9ap_o_mode0ELi0EE5rangeEii", metadata !79, i32 2054, metadata !380, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !91, i32 2054} ; [ DW_TAG_subprogram ]
!380 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !381, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!381 = metadata !{metadata !377, metadata !202, metadata !95, metadata !95}
!382 = metadata !{i32 786478, i32 0, metadata !78, metadata !"operator()", metadata !"operator()", metadata !"_ZNK13ap_fixed_baseILi27ELi3ELb1EL9ap_q_mode0EL9ap_o_mode0ELi0EEclEii", metadata !79, i32 2103, metadata !380, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !91, i32 2103} ; [ DW_TAG_subprogram ]
!383 = metadata !{i32 786478, i32 0, metadata !78, metadata !"range", metadata !"range", metadata !"_ZN13ap_fixed_baseILi27ELi3ELb1EL9ap_q_mode0EL9ap_o_mode0ELi0EE5rangeEv", metadata !79, i32 2108, metadata !384, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !91, i32 2108} ; [ DW_TAG_subprogram ]
!384 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !385, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!385 = metadata !{metadata !377, metadata !101}
!386 = metadata !{i32 786478, i32 0, metadata !78, metadata !"range", metadata !"range", metadata !"_ZNK13ap_fixed_baseILi27ELi3ELb1EL9ap_q_mode0EL9ap_o_mode0ELi0EE5rangeEv", metadata !79, i32 2113, metadata !387, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !91, i32 2113} ; [ DW_TAG_subprogram ]
!387 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !388, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!388 = metadata !{metadata !377, metadata !202}
!389 = metadata !{i32 786478, i32 0, metadata !78, metadata !"is_zero", metadata !"is_zero", metadata !"_ZNK13ap_fixed_baseILi27ELi3ELb1EL9ap_q_mode0EL9ap_o_mode0ELi0EE7is_zeroEv", metadata !79, i32 2117, metadata !329, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !91, i32 2117} ; [ DW_TAG_subprogram ]
!390 = metadata !{i32 786478, i32 0, metadata !78, metadata !"is_neg", metadata !"is_neg", metadata !"_ZNK13ap_fixed_baseILi27ELi3ELb1EL9ap_q_mode0EL9ap_o_mode0ELi0EE6is_negEv", metadata !79, i32 2121, metadata !329, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !91, i32 2121} ; [ DW_TAG_subprogram ]
!391 = metadata !{i32 786478, i32 0, metadata !78, metadata !"wl", metadata !"wl", metadata !"_ZNK13ap_fixed_baseILi27ELi3ELb1EL9ap_q_mode0EL9ap_o_mode0ELi0EE2wlEv", metadata !79, i32 2127, metadata !256, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !91, i32 2127} ; [ DW_TAG_subprogram ]
!392 = metadata !{i32 786478, i32 0, metadata !78, metadata !"iwl", metadata !"iwl", metadata !"_ZNK13ap_fixed_baseILi27ELi3ELb1EL9ap_q_mode0EL9ap_o_mode0ELi0EE3iwlEv", metadata !79, i32 2131, metadata !256, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !91, i32 2131} ; [ DW_TAG_subprogram ]
!393 = metadata !{i32 786478, i32 0, metadata !78, metadata !"q_mode", metadata !"q_mode", metadata !"_ZNK13ap_fixed_baseILi27ELi3ELb1EL9ap_q_mode0EL9ap_o_mode0ELi0EE6q_modeEv", metadata !79, i32 2135, metadata !394, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !91, i32 2135} ; [ DW_TAG_subprogram ]
!394 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !395, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!395 = metadata !{metadata !118, metadata !202}
!396 = metadata !{i32 786478, i32 0, metadata !78, metadata !"o_mode", metadata !"o_mode", metadata !"_ZNK13ap_fixed_baseILi27ELi3ELb1EL9ap_q_mode0EL9ap_o_mode0ELi0EE6o_modeEv", metadata !79, i32 2139, metadata !397, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !91, i32 2139} ; [ DW_TAG_subprogram ]
!397 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !398, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!398 = metadata !{metadata !129, metadata !202}
!399 = metadata !{i32 786478, i32 0, metadata !78, metadata !"n_bits", metadata !"n_bits", metadata !"_ZNK13ap_fixed_baseILi27ELi3ELb1EL9ap_q_mode0EL9ap_o_mode0ELi0EE6n_bitsEv", metadata !79, i32 2143, metadata !256, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !91, i32 2143} ; [ DW_TAG_subprogram ]
!400 = metadata !{i32 786478, i32 0, metadata !78, metadata !"to_string", metadata !"to_string", metadata !"_ZN13ap_fixed_baseILi27ELi3ELb1EL9ap_q_mode0EL9ap_o_mode0ELi0EE9to_stringE8BaseMode", metadata !79, i32 2147, metadata !401, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !91, i32 2147} ; [ DW_TAG_subprogram ]
!401 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !402, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!402 = metadata !{metadata !403, metadata !101, metadata !404}
!403 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 32, i64 32, i64 0, i32 0, metadata !149} ; [ DW_TAG_pointer_type ]
!404 = metadata !{i32 786436, null, metadata !"BaseMode", metadata !119, i32 603, i64 5, i64 8, i32 0, i32 0, null, metadata !405, i32 0, i32 0} ; [ DW_TAG_enumeration_type ]
!405 = metadata !{metadata !406, metadata !407, metadata !408, metadata !409}
!406 = metadata !{i32 786472, metadata !"SC_BIN", i64 2} ; [ DW_TAG_enumerator ]
!407 = metadata !{i32 786472, metadata !"SC_OCT", i64 8} ; [ DW_TAG_enumerator ]
!408 = metadata !{i32 786472, metadata !"SC_DEC", i64 10} ; [ DW_TAG_enumerator ]
!409 = metadata !{i32 786472, metadata !"SC_HEX", i64 16} ; [ DW_TAG_enumerator ]
!410 = metadata !{i32 786478, i32 0, metadata !78, metadata !"to_string", metadata !"to_string", metadata !"_ZN13ap_fixed_baseILi27ELi3ELb1EL9ap_q_mode0EL9ap_o_mode0ELi0EE9to_stringEa", metadata !79, i32 2151, metadata !411, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !91, i32 2151} ; [ DW_TAG_subprogram ]
!411 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !412, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!412 = metadata !{metadata !403, metadata !101, metadata !153}
!413 = metadata !{metadata !414, metadata !415, metadata !96, metadata !416, metadata !417, metadata !418}
!414 = metadata !{i32 786480, null, metadata !"_AP_W", metadata !95, i64 27, null, i32 0, i32 0} ; [ DW_TAG_template_value_parameter ]
!415 = metadata !{i32 786480, null, metadata !"_AP_I", metadata !95, i64 3, null, i32 0, i32 0} ; [ DW_TAG_template_value_parameter ]
!416 = metadata !{i32 786480, null, metadata !"_AP_Q", metadata !118, i64 0, null, i32 0, i32 0} ; [ DW_TAG_template_value_parameter ]
!417 = metadata !{i32 786480, null, metadata !"_AP_O", metadata !129, i64 0, null, i32 0, i32 0} ; [ DW_TAG_template_value_parameter ]
!418 = metadata !{i32 786480, null, metadata !"_AP_N", metadata !95, i64 0, null, i32 0, i32 0} ; [ DW_TAG_template_value_parameter ]
!419 = metadata !{i32 786478, i32 0, metadata !75, metadata !"ap_fixed", metadata !"ap_fixed", metadata !"", metadata !71, i32 293, metadata !420, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !91, i32 293} ; [ DW_TAG_subprogram ]
!420 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !421, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!421 = metadata !{null, metadata !422}
!422 = metadata !{i32 786447, i32 0, metadata !"", i32 0, i32 0, i64 32, i64 32, i64 0, i32 64, metadata !75} ; [ DW_TAG_pointer_type ]
!423 = metadata !{i32 786478, i32 0, metadata !75, metadata !"ap_fixed", metadata !"ap_fixed", metadata !"", metadata !71, i32 365, metadata !424, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !91, i32 365} ; [ DW_TAG_subprogram ]
!424 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !425, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!425 = metadata !{null, metadata !422, metadata !97}
!426 = metadata !{i32 786478, i32 0, metadata !75, metadata !"ap_fixed", metadata !"ap_fixed", metadata !"", metadata !71, i32 366, metadata !427, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !91, i32 366} ; [ DW_TAG_subprogram ]
!427 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !428, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!428 = metadata !{null, metadata !422, metadata !153}
!429 = metadata !{i32 786478, i32 0, metadata !75, metadata !"ap_fixed", metadata !"ap_fixed", metadata !"", metadata !71, i32 367, metadata !430, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !91, i32 367} ; [ DW_TAG_subprogram ]
!430 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !431, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!431 = metadata !{null, metadata !422, metadata !157}
!432 = metadata !{i32 786478, i32 0, metadata !75, metadata !"ap_fixed", metadata !"ap_fixed", metadata !"", metadata !71, i32 368, metadata !433, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !91, i32 368} ; [ DW_TAG_subprogram ]
!433 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !434, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!434 = metadata !{null, metadata !422, metadata !161}
!435 = metadata !{i32 786478, i32 0, metadata !75, metadata !"ap_fixed", metadata !"ap_fixed", metadata !"", metadata !71, i32 369, metadata !436, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !91, i32 369} ; [ DW_TAG_subprogram ]
!436 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !437, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!437 = metadata !{null, metadata !422, metadata !165}
!438 = metadata !{i32 786478, i32 0, metadata !75, metadata !"ap_fixed", metadata !"ap_fixed", metadata !"", metadata !71, i32 370, metadata !439, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !91, i32 370} ; [ DW_TAG_subprogram ]
!439 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !440, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!440 = metadata !{null, metadata !422, metadata !95}
!441 = metadata !{i32 786478, i32 0, metadata !75, metadata !"ap_fixed", metadata !"ap_fixed", metadata !"", metadata !71, i32 371, metadata !442, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !91, i32 371} ; [ DW_TAG_subprogram ]
!442 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !443, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!443 = metadata !{null, metadata !422, metadata !172}
!444 = metadata !{i32 786478, i32 0, metadata !75, metadata !"ap_fixed", metadata !"ap_fixed", metadata !"", metadata !71, i32 372, metadata !445, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !91, i32 372} ; [ DW_TAG_subprogram ]
!445 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !446, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!446 = metadata !{null, metadata !422, metadata !176}
!447 = metadata !{i32 786478, i32 0, metadata !75, metadata !"ap_fixed", metadata !"ap_fixed", metadata !"", metadata !71, i32 373, metadata !448, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !91, i32 373} ; [ DW_TAG_subprogram ]
!448 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !449, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!449 = metadata !{null, metadata !422, metadata !180}
!450 = metadata !{i32 786478, i32 0, metadata !75, metadata !"ap_fixed", metadata !"ap_fixed", metadata !"", metadata !71, i32 374, metadata !451, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !91, i32 374} ; [ DW_TAG_subprogram ]
!451 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !452, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!452 = metadata !{null, metadata !422, metadata !190}
!453 = metadata !{i32 786478, i32 0, metadata !75, metadata !"ap_fixed", metadata !"ap_fixed", metadata !"", metadata !71, i32 375, metadata !454, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !91, i32 375} ; [ DW_TAG_subprogram ]
!454 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !455, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!455 = metadata !{null, metadata !422, metadata !185}
!456 = metadata !{i32 786478, i32 0, metadata !75, metadata !"ap_fixed", metadata !"ap_fixed", metadata !"", metadata !71, i32 376, metadata !457, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !91, i32 376} ; [ DW_TAG_subprogram ]
!457 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !458, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!458 = metadata !{null, metadata !422, metadata !211}
!459 = metadata !{i32 786478, i32 0, metadata !75, metadata !"ap_fixed", metadata !"ap_fixed", metadata !"", metadata !71, i32 377, metadata !460, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !91, i32 377} ; [ DW_TAG_subprogram ]
!460 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !461, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!461 = metadata !{null, metadata !422, metadata !207}
!462 = metadata !{i32 786478, i32 0, metadata !75, metadata !"ap_fixed", metadata !"ap_fixed", metadata !"", metadata !71, i32 378, metadata !463, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !91, i32 378} ; [ DW_TAG_subprogram ]
!463 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !464, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!464 = metadata !{null, metadata !422, metadata !203}
!465 = metadata !{i32 786478, i32 0, metadata !75, metadata !"ap_fixed", metadata !"ap_fixed", metadata !"", metadata !71, i32 380, metadata !466, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !91, i32 380} ; [ DW_TAG_subprogram ]
!466 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !467, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!467 = metadata !{null, metadata !422, metadata !194}
!468 = metadata !{i32 786478, i32 0, metadata !75, metadata !"ap_fixed", metadata !"ap_fixed", metadata !"", metadata !71, i32 381, metadata !469, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !91, i32 381} ; [ DW_TAG_subprogram ]
!469 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !470, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!470 = metadata !{null, metadata !422, metadata !194, metadata !153}
!471 = metadata !{i32 786478, i32 0, metadata !75, metadata !"operator=", metadata !"operator=", metadata !"_ZN8ap_fixedILi27ELi3EL9ap_q_mode0EL9ap_o_mode0ELi0EEaSERKS2_", metadata !71, i32 384, metadata !72, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !91, i32 384} ; [ DW_TAG_subprogram ]
!472 = metadata !{i32 786478, i32 0, metadata !75, metadata !"operator=", metadata !"operator=", metadata !"_ZN8ap_fixedILi27ELi3EL9ap_q_mode0EL9ap_o_mode0ELi0EEaSERVKS2_", metadata !71, i32 390, metadata !473, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !91, i32 390} ; [ DW_TAG_subprogram ]
!473 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !474, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!474 = metadata !{metadata !74, metadata !422, metadata !475}
!475 = metadata !{i32 786448, null, null, null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !476} ; [ DW_TAG_reference_type ]
!476 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !477} ; [ DW_TAG_const_type ]
!477 = metadata !{i32 786485, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !75} ; [ DW_TAG_volatile_type ]
!478 = metadata !{i32 786478, i32 0, metadata !75, metadata !"operator=", metadata !"operator=", metadata !"_ZNV8ap_fixedILi27ELi3EL9ap_q_mode0EL9ap_o_mode0ELi0EEaSERKS2_", metadata !71, i32 395, metadata !479, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !91, i32 395} ; [ DW_TAG_subprogram ]
!479 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !480, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!480 = metadata !{null, metadata !481, metadata !482}
!481 = metadata !{i32 786447, i32 0, metadata !"", i32 0, i32 0, i64 32, i64 32, i64 0, i32 64, metadata !477} ; [ DW_TAG_pointer_type ]
!482 = metadata !{i32 786448, null, null, null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !483} ; [ DW_TAG_reference_type ]
!483 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !75} ; [ DW_TAG_const_type ]
!484 = metadata !{i32 786478, i32 0, metadata !75, metadata !"operator=", metadata !"operator=", metadata !"_ZNV8ap_fixedILi27ELi3EL9ap_q_mode0EL9ap_o_mode0ELi0EEaSERVKS2_", metadata !71, i32 400, metadata !485, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !91, i32 400} ; [ DW_TAG_subprogram ]
!485 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !486, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!486 = metadata !{null, metadata !481, metadata !475}
!487 = metadata !{metadata !414, metadata !415, metadata !416, metadata !417, metadata !418}
!488 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !489} ; [ DW_TAG_pointer_type ]
!489 = metadata !{i32 786438, null, metadata !"ap_fixed<27, 3, 0, 0, 0>", metadata !71, i32 290, i64 27, i64 32, i32 0, i32 0, null, metadata !490, i32 0, null, metadata !487} ; [ DW_TAG_class_field_type ]
!490 = metadata !{metadata !491}
!491 = metadata !{i32 786438, null, metadata !"ap_fixed_base<27, 3, true, 0, 0, 0>", metadata !79, i32 512, i64 27, i64 32, i32 0, i32 0, null, metadata !492, i32 0, null, metadata !413} ; [ DW_TAG_class_field_type ]
!492 = metadata !{metadata !493}
!493 = metadata !{i32 786438, null, metadata !"ssdm_int<27 + 1024 * 0, true>", metadata !83, i32 29, i64 27, i64 32, i32 0, i32 0, null, metadata !494, i32 0, null, metadata !93} ; [ DW_TAG_class_field_type ]
!494 = metadata !{metadata !85}
!495 = metadata !{i32 385, i32 49, metadata !70, metadata !496}
!496 = metadata !{i32 14, i32 2, metadata !497, null}
!497 = metadata !{i32 786443, metadata !498, i32 3, i32 211, metadata !499, i32 0} ; [ DW_TAG_lexical_block ]
!498 = metadata !{i32 786478, i32 0, metadata !499, metadata !"Biquadv2coeffs", metadata !"Biquadv2coeffs", metadata !"_Z14Biquadv2coeffs8ap_fixedILi27ELi3EL9ap_q_mode0EL9ap_o_mode0ELi0EES2_S2_S2_S2_PS2_S3_S3_S3_S3_", metadata !499, i32 3, metadata !500, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, null, null, null, metadata !91, i32 3} ; [ DW_TAG_subprogram ]
!499 = metadata !{i32 786473, metadata !"Biquadv2Coeffs/biquadv2coeffs.cpp", metadata !"C:\5CUsers\5Clions\5CDesktop\5CGithub\5CERTS_Project_E24\5CEq", null} ; [ DW_TAG_file_type ]
!500 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !501, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!501 = metadata !{null, metadata !502, metadata !502, metadata !502, metadata !502, metadata !502, metadata !503, metadata !503, metadata !503, metadata !503, metadata !503}
!502 = metadata !{i32 786454, null, metadata !"coeff_t", metadata !499, i32 4, i64 0, i64 0, i64 0, i32 0, metadata !75} ; [ DW_TAG_typedef ]
!503 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 32, i64 32, i64 0, i32 0, metadata !502} ; [ DW_TAG_pointer_type ]
!504 = metadata !{i32 385, i32 49, metadata !70, metadata !505}
!505 = metadata !{i32 13, i32 2, metadata !497, null}
!506 = metadata !{i32 385, i32 49, metadata !70, metadata !507}
!507 = metadata !{i32 12, i32 2, metadata !497, null}
!508 = metadata !{i32 385, i32 49, metadata !70, metadata !509}
!509 = metadata !{i32 11, i32 2, metadata !497, null}
!510 = metadata !{i32 385, i32 49, metadata !70, metadata !511}
!511 = metadata !{i32 10, i32 2, metadata !497, null}
!512 = metadata !{i32 790531, metadata !513, metadata !"out0b0_a0.V", null, i32 3, metadata !514, i32 0, i32 0} ; [ DW_TAG_arg_variable_field ]
!513 = metadata !{i32 786689, metadata !498, metadata !"out0b0_a0", metadata !499, i32 100663299, metadata !503, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!514 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 32, i64 32, i64 0, i32 0, metadata !489} ; [ DW_TAG_pointer_type ]
!515 = metadata !{i32 3, i32 120, metadata !498, null}
!516 = metadata !{i32 790531, metadata !517, metadata !"out0b1_a0.V", null, i32 3, metadata !514, i32 0, i32 0} ; [ DW_TAG_arg_variable_field ]
!517 = metadata !{i32 786689, metadata !498, metadata !"out0b1_a0", metadata !499, i32 117440515, metadata !503, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!518 = metadata !{i32 3, i32 140, metadata !498, null}
!519 = metadata !{i32 790531, metadata !520, metadata !"out0b2_a0.V", null, i32 3, metadata !514, i32 0, i32 0} ; [ DW_TAG_arg_variable_field ]
!520 = metadata !{i32 786689, metadata !498, metadata !"out0b2_a0", metadata !499, i32 134217731, metadata !503, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!521 = metadata !{i32 3, i32 160, metadata !498, null}
!522 = metadata !{i32 790531, metadata !523, metadata !"out0a1_a0.V", null, i32 3, metadata !514, i32 0, i32 0} ; [ DW_TAG_arg_variable_field ]
!523 = metadata !{i32 786689, metadata !498, metadata !"out0a1_a0", metadata !499, i32 150994947, metadata !503, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!524 = metadata !{i32 3, i32 180, metadata !498, null}
!525 = metadata !{i32 790531, metadata !526, metadata !"out0a2_a0.V", null, i32 3, metadata !514, i32 0, i32 0} ; [ DW_TAG_arg_variable_field ]
!526 = metadata !{i32 786689, metadata !498, metadata !"out0a2_a0", metadata !499, i32 167772163, metadata !503, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!527 = metadata !{i32 3, i32 200, metadata !498, null}
!528 = metadata !{i32 4, i32 1, metadata !497, null}
!529 = metadata !{i32 5, i32 1, metadata !497, null}
!530 = metadata !{i32 6, i32 1, metadata !497, null}
!531 = metadata !{i32 7, i32 1, metadata !497, null}
!532 = metadata !{i32 8, i32 1, metadata !497, null}
!533 = metadata !{i32 790531, metadata !534, metadata !"ssdm_int<27 + 1024 * 0, true>.V", null, i32 384, metadata !514, i32 0, i32 0} ; [ DW_TAG_arg_variable_field ]
!534 = metadata !{i32 786689, metadata !70, metadata !"this", metadata !71, i32 16777600, metadata !535, i32 64, i32 0} ; [ DW_TAG_arg_variable ]
!535 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 32, i64 32, i64 0, i32 0, metadata !75} ; [ DW_TAG_pointer_type ]
!536 = metadata !{i32 384, i32 53, metadata !70, metadata !537}
!537 = metadata !{i32 16, i32 2, metadata !497, null}
!538 = metadata !{i32 386, i32 9, metadata !539, metadata !537}
!539 = metadata !{i32 786443, metadata !70, i32 385, i32 53, metadata !71, i32 1} ; [ DW_TAG_lexical_block ]
!540 = metadata !{i32 384, i32 53, metadata !70, metadata !541}
!541 = metadata !{i32 17, i32 2, metadata !497, null}
!542 = metadata !{i32 386, i32 9, metadata !539, metadata !541}
!543 = metadata !{i32 384, i32 53, metadata !70, metadata !544}
!544 = metadata !{i32 18, i32 2, metadata !497, null}
!545 = metadata !{i32 386, i32 9, metadata !539, metadata !544}
!546 = metadata !{i32 384, i32 53, metadata !70, metadata !547}
!547 = metadata !{i32 19, i32 2, metadata !497, null}
!548 = metadata !{i32 386, i32 9, metadata !539, metadata !547}
!549 = metadata !{i32 384, i32 53, metadata !70, metadata !550}
!550 = metadata !{i32 20, i32 2, metadata !497, null}
!551 = metadata !{i32 386, i32 9, metadata !539, metadata !550}
!552 = metadata !{i32 21, i32 1, metadata !497, null}
