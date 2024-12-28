; ModuleID = 'C:/Users/lions/Desktop/Github/ERTS_Project_E24/Eq/Biquad/Biquad/.autopilot/db/a.o.2.bc'
target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-f80:128:128-v64:64:64-v128:128:128-a0:0:64-f80:32:32-n8:16:32-S32"
target triple = "i686-pc-mingw32"

@ssdm_ins_Biquad_0_0_4 = global i1 false
@ssdm_ins_Biquad_0_0_3 = global i32 0
@ssdm_ins_Biquad_0_0_1 = global i1 false
@ssdm_ins_Biquad_0_0_s = global i32 0
@llvm_global_ctors_1 = appending global [1 x void ()*] [void ()* @_GLOBAL__I_a]
@llvm_global_ctors_0 = appending global [1 x i32] [i32 65535]
@coeffs = internal unnamed_addr constant [5 x i25] [i25 8314060, i25 -16558260, i25 8245108, i25 16558260, i25 -8170561]
@Biquad_ssdm_thread_M_process = external global i1
@p_str9 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@p_str8 = private unnamed_addr constant [15 x i8] c"__ssdm_reset__\00", align 1
@p_str7 = private unnamed_addr constant [8 x i8] c"process\00", align 1
@p_str6 = private unnamed_addr constant [8 x i8] c"outData\00", align 1
@p_str5 = private unnamed_addr constant [7 x i8] c"inData\00", align 1
@p_str4 = private unnamed_addr constant [13 x i8] c"\22sc_int<32>\22\00", align 1
@p_str3 = private unnamed_addr constant [8 x i8] c"inReset\00", align 1
@p_str2 = private unnamed_addr constant [6 x i8] c"inClk\00", align 1
@p_str12 = private unnamed_addr constant [22 x i8] c"-bus_bundle biquad_io\00", align 1
@p_str11 = private unnamed_addr constant [10 x i8] c"AXI4LiteS\00", align 1
@p_str1 = private unnamed_addr constant [7 x i8] c"\22bool\22\00", align 1
@p_str = private unnamed_addr constant [7 x i8] c"Biquad\00", align 1

declare i56 @llvm.part.select.i56(i56, i32, i32) nounwind readnone

declare void @llvm.dbg.value(metadata, i64, metadata) nounwind readnone

declare void @llvm.dbg.declare(metadata, metadata) nounwind readnone

define weak void @_ssdm_op_Write.ap_auto.volatile.i32P(i32*, i32) {
entry:
  store i32 %1, i32* %0
  ret void
}

define weak void @_ssdm_op_Wait(...) nounwind {
entry:
  ret void
}

define weak void @_ssdm_op_SpecTopModule(...) nounwind {
entry:
  ret void
}

define weak i32 @_ssdm_op_SpecStateEnd(...) nounwind {
entry:
  ret i32 0
}

define weak i32 @_ssdm_op_SpecStateBegin(...) nounwind {
entry:
  ret i32 0
}

define weak void @_ssdm_op_SpecSensitive(...) nounwind {
entry:
  ret void
}

define weak i32 @_ssdm_op_SpecRegionEnd(...) {
entry:
  ret i32 0
}

define weak i32 @_ssdm_op_SpecRegionBegin(...) {
entry:
  ret i32 0
}

define weak void @_ssdm_op_SpecProtocol(...) nounwind {
entry:
  ret void
}

define weak void @_ssdm_op_SpecProcessDef(...) nounwind {
entry:
  ret void
}

define weak void @_ssdm_op_SpecProcessDecl(...) nounwind {
entry:
  ret void
}

define weak void @_ssdm_op_SpecPort(...) nounwind {
entry:
  ret void
}

define weak i32 @_ssdm_op_SpecLoopTripCount(...) {
entry:
  ret i32 0
}

define weak i32 @_ssdm_op_SpecLoopBegin(...) {
entry:
  ret i32 0
}

define weak void @_ssdm_op_SpecIFCore(...) {
entry:
  ret void
}

define weak void @_ssdm_op_SpecBitsMap(...) {
entry:
  ret void
}

define weak i32 @_ssdm_op_Read.ap_auto.volatile.i32P(i32*) {
entry:
  %empty = load i32* %0
  ret i32 %empty
}

define weak i32 @_ssdm_op_PartSelect.i32.i56.i32.i32(i56, i32, i32) nounwind readnone {
entry:
  %empty = call i56 @llvm.part.select.i56(i56 %0, i32 %1, i32 %2)
  %empty_5 = trunc i56 %empty to i32
  ret i32 %empty_5
}

declare void @_GLOBAL__I_a() nounwind

define void @"Biquad::process"(i1* %inClk, i1* %inReset, i32* %inData, i32* %outData) {
  call void (...)* @_ssdm_op_SpecBitsMap(i1* %inClk), !map !95
  call void (...)* @_ssdm_op_SpecBitsMap(i1* %inReset), !map !99
  call void (...)* @_ssdm_op_SpecBitsMap(i32* %inData), !map !103
  call void (...)* @_ssdm_op_SpecBitsMap(i32* %outData), !map !107
  %samples_V = alloca [5 x i32], align 4
  call void (...)* @_ssdm_op_SpecPort([7 x i8]* @p_str, i32 0, [7 x i8]* @p_str1, [6 x i8]* @p_str2, i32 0, i32 0, i1* %inClk) nounwind
  call void (...)* @_ssdm_op_SpecPort([7 x i8]* @p_str, i32 0, [7 x i8]* @p_str1, [8 x i8]* @p_str3, i32 0, i32 0, i1* %inReset) nounwind
  call void (...)* @_ssdm_op_SpecPort([7 x i8]* @p_str, i32 0, [13 x i8]* @p_str4, [7 x i8]* @p_str5, i32 0, i32 0, i32* %inData) nounwind
  call void (...)* @_ssdm_op_SpecPort([7 x i8]* @p_str, i32 1, [13 x i8]* @p_str4, [8 x i8]* @p_str6, i32 0, i32 0, i32* %outData) nounwind
  call void (...)* @_ssdm_op_SpecProcessDef([7 x i8]* @p_str, i32 2, [8 x i8]* @p_str7) nounwind
  %tmp_2 = call i32 (...)* @_ssdm_op_SpecRegionBegin([15 x i8]* @p_str8)
  call void (...)* @_ssdm_op_SpecProtocol(i32 1, [1 x i8]* @p_str9) nounwind
  %p_ssdm_reset_v = call i32 (...)* @_ssdm_op_SpecStateBegin(i32 0, i32 0, i32 1) nounwind
  call void (...)* @_ssdm_op_SpecIFCore(i32* %inData, [1 x i8]* @p_str9, [10 x i8]* @p_str11, [1 x i8]* @p_str9, i32 -1, [1 x i8]* @p_str9, [1 x i8]* @p_str9, [1 x i8]* @p_str9, [1 x i8]* @p_str9, [22 x i8]* @p_str12)
  call void (...)* @_ssdm_op_SpecIFCore(i32* %outData, [1 x i8]* @p_str9, [10 x i8]* @p_str11, [1 x i8]* @p_str9, i32 -1, [1 x i8]* @p_str9, [1 x i8]* @p_str9, [1 x i8]* @p_str9, [1 x i8]* @p_str9, [22 x i8]* @p_str12)
  %empty = call i32 (...)* @_ssdm_op_SpecStateEnd(i32 %p_ssdm_reset_v) nounwind
  %empty_6 = call i32 (...)* @_ssdm_op_SpecRegionEnd([15 x i8]* @p_str8, i32 %tmp_2)
  %samples_V_addr = getelementptr [5 x i32]* %samples_V, i32 0, i32 0
  %samples_V_addr_1 = getelementptr [5 x i32]* %samples_V, i32 0, i32 3
  %samples_V_addr_2 = getelementptr [5 x i32]* %samples_V, i32 0, i32 4
  %samples_V_addr_3 = getelementptr [5 x i32]* %samples_V, i32 0, i32 1
  %samples_V_addr_4 = getelementptr [5 x i32]* %samples_V, i32 0, i32 2
  br label %_ZN7_ap_sc_7sc_core4waitEi.exit2

_ZN7_ap_sc_7sc_core4waitEi.exit2:                 ; preds = %_ZN7_ap_sc_7sc_core4waitEi.exit, %0
  %loop_begin = call i32 (...)* @_ssdm_op_SpecLoopBegin() nounwind
  %val_V = call i32 @_ssdm_op_Read.ap_auto.volatile.i32P(i32* %inData)
  store i32 %val_V, i32* %samples_V_addr, align 4
  call void (...)* @_ssdm_op_Wait(i32 1) nounwind
  br label %1

; <label>:1                                       ; preds = %_ZrsILi128ELb1EE11ap_int_baseIXT_EXT0_EXleT_Li64EEERKS1_i.exit, %_ZN7_ap_sc_7sc_core4waitEi.exit2
  %v_V = phi i32 [ 0, %_ZN7_ap_sc_7sc_core4waitEi.exit2 ], [ %result_V, %_ZrsILi128ELb1EE11ap_int_baseIXT_EXT0_EXleT_Li64EEERKS1_i.exit ]
  %t_V = phi i3 [ 0, %_ZN7_ap_sc_7sc_core4waitEi.exit2 ], [ %i_V, %_ZrsILi128ELb1EE11ap_int_baseIXT_EXT0_EXleT_Li64EEERKS1_i.exit ]
  %exitcond = icmp eq i3 %t_V, -3
  %empty_7 = call i32 (...)* @_ssdm_op_SpecLoopTripCount(i64 5, i64 5, i64 5)
  %i_V = add i3 %t_V, 1
  br i1 %exitcond, label %_ZN7_ap_sc_7sc_core4waitEi.exit, label %_ZrsILi128ELb1EE11ap_int_baseIXT_EXT0_EXleT_Li64EEERKS1_i.exit

_ZrsILi128ELb1EE11ap_int_baseIXT_EXT0_EXleT_Li64EEERKS1_i.exit: ; preds = %1
  %tmp = zext i3 %t_V to i32
  %coeffs_addr = getelementptr [5 x i25]* @coeffs, i32 0, i32 %tmp
  %coeffs_load = load i25* %coeffs_addr, align 4
  %samples_V_addr_5 = getelementptr [5 x i32]* %samples_V, i32 0, i32 %tmp
  %samples_V_load_2 = load i32* %samples_V_addr_5, align 4
  %lhs_V_cast = sext i25 %coeffs_load to i56
  %rhs_V_cast = sext i32 %samples_V_load_2 to i56
  %r_V = mul i56 %lhs_V_cast, %rhs_V_cast
  %phitmp = call i32 @_ssdm_op_PartSelect.i32.i56.i32.i32(i56 %r_V, i32 24, i32 55)
  %result_V = add i32 %phitmp, %v_V
  br label %1

_ZN7_ap_sc_7sc_core4waitEi.exit:                  ; preds = %1
  %samples_V_load = load i32* %samples_V_addr_1, align 4
  store i32 %samples_V_load, i32* %samples_V_addr_2, align 4
  store i32 %v_V, i32* %samples_V_addr_1, align 4
  %samples_V_load_1 = load i32* %samples_V_addr_3, align 4
  store i32 %samples_V_load_1, i32* %samples_V_addr_4, align 4
  store i32 %val_V, i32* %samples_V_addr_3, align 4
  call void @_ssdm_op_Write.ap_auto.volatile.i32P(i32* %outData, i32 %v_V)
  call void (...)* @_ssdm_op_Wait(i32 1) nounwind
  br label %_ZN7_ap_sc_7sc_core4waitEi.exit2
}

define weak void @"Biquad::Biquad"(i1* %inClk, i1* %inReset, i32* %inData, i32* %outData) {
  call void (...)* @_ssdm_op_SpecIFCore(i32* %outData, [1 x i8]* @p_str9, [10 x i8]* @p_str11, [1 x i8]* @p_str9, i32 -1, [1 x i8]* @p_str9, [1 x i8]* @p_str9, [1 x i8]* @p_str9, [1 x i8]* @p_str9, [22 x i8]* @p_str12)
  call void (...)* @_ssdm_op_SpecIFCore(i32* %inData, [1 x i8]* @p_str9, [10 x i8]* @p_str11, [1 x i8]* @p_str9, i32 -1, [1 x i8]* @p_str9, [1 x i8]* @p_str9, [1 x i8]* @p_str9, [1 x i8]* @p_str9, [22 x i8]* @p_str12)
  call void (...)* @_ssdm_op_SpecBitsMap(i1* %inClk), !map !95
  call void (...)* @_ssdm_op_SpecBitsMap(i1* %inReset), !map !99
  call void (...)* @_ssdm_op_SpecBitsMap(i32* %inData), !map !103
  call void (...)* @_ssdm_op_SpecBitsMap(i32* %outData), !map !107
  call void (...)* @_ssdm_op_SpecTopModule([7 x i8]* @p_str, [7 x i8]* @p_str) nounwind
  %Biquad_ssdm_threa = load i1* @Biquad_ssdm_thread_M_process, align 1
  br i1 %Biquad_ssdm_threa, label %1, label %2

; <label>:1                                       ; preds = %0
  call void @"Biquad::process"(i1* %inClk, i1* %inReset, i32* %inData, i32* %outData)
  unreachable

; <label>:2                                       ; preds = %0
  call void (...)* @_ssdm_op_SpecProcessDecl([7 x i8]* @p_str, i32 2, [8 x i8]* @p_str7) nounwind
  call void (...)* @_ssdm_op_SpecSensitive([8 x i8]* @p_str7, [6 x i8]* @p_str2, i1* %inClk, i32 1) nounwind
  call void (...)* @_ssdm_op_SpecSensitive([8 x i8]* @p_str7, [8 x i8]* @p_str3, i1* %inReset, i32 3) nounwind
  call void (...)* @_ssdm_op_SpecPort([7 x i8]* @p_str, i32 0, [7 x i8]* @p_str1, [6 x i8]* @p_str2, i32 0, i32 0, i1* %inClk) nounwind
  call void (...)* @_ssdm_op_SpecPort([7 x i8]* @p_str, i32 0, [7 x i8]* @p_str1, [8 x i8]* @p_str3, i32 0, i32 0, i1* %inReset) nounwind
  call void (...)* @_ssdm_op_SpecPort([7 x i8]* @p_str, i32 0, [13 x i8]* @p_str4, [7 x i8]* @p_str5, i32 0, i32 0, i32* %inData) nounwind
  call void (...)* @_ssdm_op_SpecPort([7 x i8]* @p_str, i32 1, [13 x i8]* @p_str4, [8 x i8]* @p_str6, i32 0, i32 0, i32* %outData) nounwind
  ret void
}

!opencl.kernels = !{!0, !7, !13, !15, !21, !24, !26, !0, !0, !0, !29, !31, !31, !34, !34, !0, !0, !36, !0, !38, !41, !41, !0, !42, !44, !41, !41, !0, !21, !46, !46, !41, !0, !47, !0, !0, !0, !0, !0, !49, !0, !0, !50, !53, !0, !0, !0, !46, !46, !55, !55, !59, !59, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !61}
!hls.encrypted.func = !{}
!llvm.map.gv = !{!63, !70, !75, !80, !85, !90}

!0 = metadata !{null, metadata !1, metadata !2, metadata !3, metadata !4, metadata !5, metadata !6}
!1 = metadata !{metadata !"kernel_arg_addr_space"}
!2 = metadata !{metadata !"kernel_arg_access_qual"}
!3 = metadata !{metadata !"kernel_arg_type"}
!4 = metadata !{metadata !"kernel_arg_type_qual"}
!5 = metadata !{metadata !"kernel_arg_name"}
!6 = metadata !{metadata !"reqd_work_group_size", i32 1, i32 1, i32 1}
!7 = metadata !{null, metadata !8, metadata !9, metadata !10, metadata !11, metadata !12, metadata !6}
!8 = metadata !{metadata !"kernel_arg_addr_space", i32 0}
!9 = metadata !{metadata !"kernel_arg_access_qual", metadata !"none"}
!10 = metadata !{metadata !"kernel_arg_type", metadata !"const struct _ap_sc_::sc_dt::sc_int<32> &"}
!11 = metadata !{metadata !"kernel_arg_type_qual", metadata !""}
!12 = metadata !{metadata !"kernel_arg_name", metadata !"v"}
!13 = metadata !{null, metadata !8, metadata !9, metadata !10, metadata !11, metadata !14, metadata !6}
!14 = metadata !{metadata !"kernel_arg_name", metadata !"v2"}
!15 = metadata !{null, metadata !16, metadata !17, metadata !18, metadata !19, metadata !20, metadata !6}
!16 = metadata !{metadata !"kernel_arg_addr_space", i32 0, i32 0}
!17 = metadata !{metadata !"kernel_arg_access_qual", metadata !"none", metadata !"none"}
!18 = metadata !{metadata !"kernel_arg_type", metadata !"volatile sc_int<32> &", metadata !"const struct _ap_sc_::sc_dt::sc_int<32> &"}
!19 = metadata !{metadata !"kernel_arg_type_qual", metadata !"", metadata !""}
!20 = metadata !{metadata !"kernel_arg_name", metadata !"P", metadata !"val"}
!21 = metadata !{null, metadata !8, metadata !9, metadata !22, metadata !11, metadata !23, metadata !6}
!22 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<32, true> &"}
!23 = metadata !{metadata !"kernel_arg_name", metadata !"op2"}
!24 = metadata !{null, metadata !8, metadata !9, metadata !25, metadata !11, metadata !23, metadata !6}
!25 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<128, true> &"}
!26 = metadata !{null, metadata !16, metadata !17, metadata !27, metadata !19, metadata !28, metadata !6}
!27 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<128, true> &", metadata !"int"}
!28 = metadata !{metadata !"kernel_arg_name", metadata !"op", metadata !"op2"}
!29 = metadata !{null, metadata !16, metadata !17, metadata !30, metadata !19, metadata !28, metadata !6}
!30 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<64, true> &", metadata !"const ap_int_base<64, true> &"}
!31 = metadata !{null, metadata !8, metadata !9, metadata !32, metadata !11, metadata !33, metadata !6}
!32 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<64, true> &"}
!33 = metadata !{metadata !"kernel_arg_name", metadata !"op"}
!34 = metadata !{null, metadata !8, metadata !9, metadata !35, metadata !11, metadata !33, metadata !6}
!35 = metadata !{metadata !"kernel_arg_type", metadata !"const sc_int<32> &"}
!36 = metadata !{null, metadata !8, metadata !9, metadata !37, metadata !11, metadata !23, metadata !6}
!37 = metadata !{metadata !"kernel_arg_type", metadata !"const struct _ap_sc_::sc_dt::sc_int<64> &"}
!38 = metadata !{null, metadata !8, metadata !9, metadata !39, metadata !11, metadata !40, metadata !6}
!39 = metadata !{metadata !"kernel_arg_type", metadata !"int"}
!40 = metadata !{metadata !"kernel_arg_name", metadata !""}
!41 = metadata !{null, metadata !8, metadata !9, metadata !39, metadata !11, metadata !33, metadata !6}
!42 = metadata !{null, metadata !8, metadata !9, metadata !43, metadata !11, metadata !23, metadata !6}
!43 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<1, false> &"}
!44 = metadata !{null, metadata !16, metadata !17, metadata !45, metadata !19, metadata !28, metadata !6}
!45 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<8, true> &", metadata !"int"}
!46 = metadata !{null, metadata !8, metadata !9, metadata !39, metadata !11, metadata !12, metadata !6}
!47 = metadata !{null, metadata !8, metadata !9, metadata !48, metadata !11, metadata !23, metadata !6}
!48 = metadata !{metadata !"kernel_arg_type", metadata !"const struct _ap_sc_::sc_dt::sc_int<8> &"}
!49 = metadata !{null, metadata !8, metadata !9, metadata !10, metadata !11, metadata !23, metadata !6}
!50 = metadata !{null, metadata !8, metadata !9, metadata !51, metadata !11, metadata !52, metadata !6}
!51 = metadata !{metadata !"kernel_arg_type", metadata !"volatile sc_int<32> &"}
!52 = metadata !{metadata !"kernel_arg_name", metadata !"P"}
!53 = metadata !{null, metadata !8, metadata !9, metadata !54, metadata !11, metadata !23, metadata !6}
!54 = metadata !{metadata !"kernel_arg_type", metadata !"const volatile struct _ap_sc_::sc_dt::sc_int<32> &"}
!55 = metadata !{null, metadata !56, metadata !9, metadata !57, metadata !58, metadata !40, metadata !6}
!56 = metadata !{metadata !"kernel_arg_addr_space", i32 1}
!57 = metadata !{metadata !"kernel_arg_type", metadata !"char*"}
!58 = metadata !{metadata !"kernel_arg_type_qual", metadata !"const"}
!59 = metadata !{null, metadata !8, metadata !9, metadata !60, metadata !11, metadata !40, metadata !6}
!60 = metadata !{metadata !"kernel_arg_type", metadata !"::sc_core::sc_module_name"}
!61 = metadata !{null, metadata !8, metadata !9, metadata !39, metadata !11, metadata !62, metadata !6}
!62 = metadata !{metadata !"kernel_arg_name", metadata !"n"}
!63 = metadata !{metadata !64, i32* @ssdm_ins_Biquad_0_0_s}
!64 = metadata !{metadata !65}
!65 = metadata !{i32 0, i32 31, metadata !66}
!66 = metadata !{metadata !67}
!67 = metadata !{metadata !"ssdm_ins_Biquad_0_0.outData.m_if.Val.V", metadata !68, metadata !"int32", i32 0, i32 31}
!68 = metadata !{metadata !69}
!69 = metadata !{i32 0, i32 0, i32 1}
!70 = metadata !{metadata !71, i1* @ssdm_ins_Biquad_0_0_4}
!71 = metadata !{metadata !72}
!72 = metadata !{i32 0, i32 0, metadata !73}
!73 = metadata !{metadata !74}
!74 = metadata !{metadata !"ssdm_ins_Biquad_0_0.inReset.m_if.Val", metadata !68, metadata !"bool", i32 0, i32 0}
!75 = metadata !{metadata !76, i32* @ssdm_ins_Biquad_0_0_3}
!76 = metadata !{metadata !77}
!77 = metadata !{i32 0, i32 31, metadata !78}
!78 = metadata !{metadata !79}
!79 = metadata !{metadata !"ssdm_ins_Biquad_0_0.inData.m_if.Val.V", metadata !68, metadata !"int32", i32 0, i32 31}
!80 = metadata !{metadata !81, i1* @ssdm_ins_Biquad_0_0_1}
!81 = metadata !{metadata !82}
!82 = metadata !{i32 0, i32 0, metadata !83}
!83 = metadata !{metadata !84}
!84 = metadata !{metadata !"ssdm_ins_Biquad_0_0.inClk.m_if.Val", metadata !68, metadata !"bool", i32 0, i32 0}
!85 = metadata !{metadata !86, [1 x i32]* @llvm_global_ctors_0}
!86 = metadata !{metadata !87}
!87 = metadata !{i32 0, i32 31, metadata !88}
!88 = metadata !{metadata !89}
!89 = metadata !{metadata !"llvm.global_ctors.0", metadata !68, metadata !"", i32 0, i32 31}
!90 = metadata !{metadata !91, i1* @Biquad_ssdm_thread_M_process}
!91 = metadata !{metadata !92}
!92 = metadata !{i32 0, i32 0, metadata !93}
!93 = metadata !{metadata !94}
!94 = metadata !{metadata !"Biquad::__ssdm_thread_M_process", metadata !68, metadata !"bool", i32 0, i32 0}
!95 = metadata !{metadata !96}
!96 = metadata !{i32 0, i32 0, metadata !97}
!97 = metadata !{metadata !98}
!98 = metadata !{metadata !"Biquad.inClk.m_if.Val", metadata !68, metadata !"bool", i32 0, i32 0}
!99 = metadata !{metadata !100}
!100 = metadata !{i32 0, i32 0, metadata !101}
!101 = metadata !{metadata !102}
!102 = metadata !{metadata !"Biquad.inReset.m_if.Val", metadata !68, metadata !"bool", i32 0, i32 0}
!103 = metadata !{metadata !104}
!104 = metadata !{i32 0, i32 31, metadata !105}
!105 = metadata !{metadata !106}
!106 = metadata !{metadata !"Biquad.inData.m_if.Val.V", metadata !68, metadata !"int32", i32 0, i32 31}
!107 = metadata !{metadata !108}
!108 = metadata !{i32 0, i32 31, metadata !109}
!109 = metadata !{metadata !110}
!110 = metadata !{metadata !"Biquad.outData.m_if.Val.V", metadata !68, metadata !"int32", i32 0, i32 31}
