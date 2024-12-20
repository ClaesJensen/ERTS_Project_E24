set moduleName Biquad
set isCombinational 0
set isDatapathOnly 0
set isPipelined 0
set pipeline_type none
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set C_modelName {Biquad::Biquad}
set C_modelType { void 0 }
set C_modelArgList {
	{ inClk int 1 unused {pointer 0}  }
	{ inReset int 1 unused {pointer 0}  }
	{ inData int 32 regular {pointer 0 volatile }  }
	{ outData int 32 regular {pointer 1 volatile }  }
}
set C_modelArgMapList {[ 
	{ "Name" : "inClk", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "Biquad.inClk.m_if.Val","cData": "bool","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "inReset", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "Biquad.inReset.m_if.Val","cData": "bool","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "inData", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY", "bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "Biquad.inData.m_if.Val.V","cData": "int32","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "outData", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "Biquad.outData.m_if.Val.V","cData": "int32","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} ]}
# RTL Port declarations: 
set portNum 4
set portList { 
	{ inClk sc_in sc_logic 1 clock -1 } 
	{ inReset sc_in sc_logic 1 reset -1 active_high_sync inClk } 
	{ inData sc_in sc_lv 32 signal 2 inClk } 
	{ outData sc_out sc_lv 32 signal 3 inClk } 
}
set NewPortList {[ 
	{ "name": "inClk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "inClk", "role": "default" }} , 
 	{ "name": "inReset", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "inReset", "role": "default" }} , 
 	{ "name": "inData", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "inData", "role": "default" }} , 
 	{ "name": "outData", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "outData", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1"],
		"CDFG" : "Biquad",
		"ControlExist" : "0", "ap_start" : "0", "ap_ready" : "0", "ap_done" : "0", "ap_continue" : "0", "ap_idle" : "0",
		"Pipeline" : "Dataflow", "AlignedPipeline" : "0", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "1",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"VariableLatency" : "1",
		"InputProcess" : [],
		"OutputProcess" : [],
		"Port" : [
			{"Name" : "inClk", "Type" : "None", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_Biquad_process_fu_58", "Port" : "inClk"}]},
			{"Name" : "inReset", "Type" : "None", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_Biquad_process_fu_58", "Port" : "inReset"}]},
			{"Name" : "inData", "Type" : "None", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_Biquad_process_fu_58", "Port" : "inData"}]},
			{"Name" : "outData", "Type" : "Vld", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_Biquad_process_fu_58", "Port" : "outData"}]},
			{"Name" : "Biquad_ssdm_thread_M_process", "Type" : "None", "Direction" : "I"},
			{"Name" : "coeffs", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_Biquad_process_fu_58", "Port" : "coeffs"}]}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_Biquad_process_fu_58", "Parent" : "0", "Child" : ["2", "3", "4"],
		"CDFG" : "Biquad_process",
		"ControlExist" : "0", "ap_start" : "0", "ap_ready" : "0", "ap_done" : "0", "ap_continue" : "0", "ap_idle" : "0",
		"Pipeline" : "None", "AlignedPipeline" : "0", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"VariableLatency" : "1",
		"Port" : [
			{"Name" : "inClk", "Type" : "None", "Direction" : "I"},
			{"Name" : "inReset", "Type" : "None", "Direction" : "I"},
			{"Name" : "inData", "Type" : "None", "Direction" : "I"},
			{"Name" : "outData", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "coeffs", "Type" : "Memory", "Direction" : "I"}]},
	{"ID" : "2", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_Biquad_process_fu_58.coeffs_U", "Parent" : "1"},
	{"ID" : "3", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_Biquad_process_fu_58.samples_V_U", "Parent" : "1"},
	{"ID" : "4", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_Biquad_process_fu_58.Biquad_mul_25s_32dEe_U0", "Parent" : "1"}]}


set ArgLastReadFirstWriteLatency {
	Biquad {
		inClk {Type I LastRead -1 FirstWrite -1}
		inReset {Type I LastRead -1 FirstWrite -1}
		inData {Type I LastRead 2 FirstWrite -1}
		outData {Type O LastRead -1 FirstWrite 5}
		Biquad_ssdm_thread_M_process {Type I LastRead -1 FirstWrite -1}
		coeffs {Type I LastRead -1 FirstWrite -1}}
	Biquad_process {
		inClk {Type I LastRead -1 FirstWrite -1}
		inReset {Type I LastRead -1 FirstWrite -1}
		inData {Type I LastRead 2 FirstWrite -1}
		outData {Type O LastRead -1 FirstWrite 5}
		coeffs {Type I LastRead -1 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "0", "Max" : "33"}
	, {"Name" : "Interval", "Min" : "1", "Max" : "34"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	inData { ap_none {  { inData in_data 0 32 } } }
	outData { ap_vld {  { outData out_data 1 32 } } }
}

set busDeadlockParameterList { 
}

# RTL port scheduling information:
set fifoSchedulingInfoList { 
}

# RTL bus port read request latency information:
set busReadReqLatencyList { 
}

# RTL bus port write response latency information:
set busWriteResLatencyList { 
}

# RTL array port load latency information:
set memoryLoadLatencyList { 
}
