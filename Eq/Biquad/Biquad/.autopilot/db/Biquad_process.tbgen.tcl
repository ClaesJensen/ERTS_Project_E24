set moduleName Biquad_process
set isCombinational 0
set isDatapathOnly 0
set isPipelined 0
set pipeline_type none
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set C_modelName {Biquad::process}
set C_modelType { void 0 }
set C_modelArgList {
	{ inData int 32 regular {pointer 0 volatile }  }
	{ outData int 32 regular {pointer 1 volatile }  }
}
set C_modelArgMapList {[ 
	{ "Name" : "inData", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY", "bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "Biquad.inData.m_if.Val.V","cData": "int32","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "outData", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "Biquad.outData.m_if.Val.V","cData": "int32","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} ]}
# RTL Port declarations: 
set portNum 5
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ inData sc_in sc_lv 32 signal 0 } 
	{ outData sc_out sc_lv 32 signal 1 } 
	{ outData_ap_vld sc_out sc_logic 1 outvld 1 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "inData", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "inData", "role": "default" }} , 
 	{ "name": "outData", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "outData", "role": "default" }} , 
 	{ "name": "outData_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "outData", "role": "ap_vld" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3"],
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
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.coeffs_U", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.samples_V_U", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.Biquad_mul_25s_32dEe_U0", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	Biquad_process {
		inClk {Type I LastRead -1 FirstWrite -1}
		inReset {Type I LastRead -1 FirstWrite -1}
		inData {Type I LastRead 2 FirstWrite -1}
		outData {Type O LastRead -1 FirstWrite 5}
		coeffs {Type I LastRead -1 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "32", "Max" : "32"}
	, {"Name" : "Interval", "Min" : "32", "Max" : "32"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	inData { ap_none {  { inData in_data 0 32 } } }
	outData { ap_vld {  { outData out_data 1 32 }  { outData_ap_vld out_vld 1 1 } } }
}
