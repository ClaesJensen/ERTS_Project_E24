set C_TypeInfoList {{ 
"Biquadv2coeffs" : [[], { "return": [[], "void"]} , [{"ExternC" : 0}], [ {"in0b0_a0": [[],"0"] }, {"in0b1_a0": [[],"0"] }, {"in0b2_a0": [[],"0"] }, {"in0a1_a0": [[],"0"] }, {"in0a2_a0": [[],"0"] }, {"out0b0_a0": [[],{ "pointer": "0"}] }, {"out0b1_a0": [[],{ "pointer": "0"}] }, {"out0b2_a0": [[],{ "pointer": "0"}] }, {"out0a1_a0": [[],{ "pointer": "0"}] }, {"out0a2_a0": [[],{ "pointer": "0"}] }],[],""], 
"0": [ "coeff_t", {"typedef": [[[],"1"],""]}], 
"1": [ "ap_fixed<27, 3, 0, 0, 0>", {"hls_type": {"ap_fixed": [[[[], {"scalar": { "int": 27}}],[[], {"scalar": { "int": 3}}],[[], {"scalar": { "2": 0}}],[[], {"scalar": { "3": 0}}],[[], {"scalar": { "int": 0}}]],""]}}], 
"2": [ "sc_q_mode", {"enum": [[],[],[{"SC_RND":  {"scalar": "__integer__"}},{"SC_RND_ZERO":  {"scalar": "__integer__"}},{"SC_RND_MIN_INF":  {"scalar": "__integer__"}},{"SC_RND_INF":  {"scalar": "__integer__"}},{"SC_RND_CONV":  {"scalar": "__integer__"}},{"SC_TRN":  {"scalar": "__integer__"}},{"SC_TRN_ZERO":  {"scalar": "__integer__"}}],""]}], 
"3": [ "sc_o_mode", {"enum": [[],[],[{"SC_SAT":  {"scalar": "__integer__"}},{"SC_SAT_ZERO":  {"scalar": "__integer__"}},{"SC_SAT_SYM":  {"scalar": "__integer__"}},{"SC_WRAP":  {"scalar": "__integer__"}},{"SC_WRAP_SM":  {"scalar": "__integer__"}}],""]}]
}}
set moduleName Biquadv2coeffs
set isCombinational 1
set isDatapathOnly 0
set isPipelined 0
set pipeline_type none
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set C_modelName {Biquadv2coeffs}
set C_modelType { void 0 }
set C_modelArgList {
	{ in0b0_a0_V int 27 regular {axi_slave 0}  }
	{ in0b1_a0_V int 27 regular {axi_slave 0}  }
	{ in0b2_a0_V int 27 regular {axi_slave 0}  }
	{ in0a1_a0_V int 27 regular {axi_slave 0}  }
	{ in0a2_a0_V int 27 regular {axi_slave 0}  }
	{ out0b0_a0_V int 27 regular {pointer 1}  }
	{ out0b1_a0_V int 27 regular {pointer 1}  }
	{ out0b2_a0_V int 27 regular {pointer 1}  }
	{ out0a1_a0_V int 27 regular {pointer 1}  }
	{ out0a2_a0_V int 27 regular {pointer 1}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "in0b0_a0_V", "interface" : "axi_slave", "bundle":"coeffs","type":"ap_none","bitwidth" : 27, "direction" : "READONLY", "bitSlice":[{"low":0,"up":26,"cElement": [{"cName": "in0b0_a0.V","cData": "int27","bit_use": { "low": 0,"up": 26},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}], "offset" : {"in":16}, "offset_end" : {"in":23}} , 
 	{ "Name" : "in0b1_a0_V", "interface" : "axi_slave", "bundle":"coeffs","type":"ap_none","bitwidth" : 27, "direction" : "READONLY", "bitSlice":[{"low":0,"up":26,"cElement": [{"cName": "in0b1_a0.V","cData": "int27","bit_use": { "low": 0,"up": 26},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}], "offset" : {"in":24}, "offset_end" : {"in":31}} , 
 	{ "Name" : "in0b2_a0_V", "interface" : "axi_slave", "bundle":"coeffs","type":"ap_none","bitwidth" : 27, "direction" : "READONLY", "bitSlice":[{"low":0,"up":26,"cElement": [{"cName": "in0b2_a0.V","cData": "int27","bit_use": { "low": 0,"up": 26},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}], "offset" : {"in":32}, "offset_end" : {"in":39}} , 
 	{ "Name" : "in0a1_a0_V", "interface" : "axi_slave", "bundle":"coeffs","type":"ap_none","bitwidth" : 27, "direction" : "READONLY", "bitSlice":[{"low":0,"up":26,"cElement": [{"cName": "in0a1_a0.V","cData": "int27","bit_use": { "low": 0,"up": 26},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}], "offset" : {"in":40}, "offset_end" : {"in":47}} , 
 	{ "Name" : "in0a2_a0_V", "interface" : "axi_slave", "bundle":"coeffs","type":"ap_none","bitwidth" : 27, "direction" : "READONLY", "bitSlice":[{"low":0,"up":26,"cElement": [{"cName": "in0a2_a0.V","cData": "int27","bit_use": { "low": 0,"up": 26},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}], "offset" : {"in":48}, "offset_end" : {"in":55}} , 
 	{ "Name" : "out0b0_a0_V", "interface" : "wire", "bitwidth" : 27, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":26,"cElement": [{"cName": "out0b0_a0.V","cData": "int27","bit_use": { "low": 0,"up": 26},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "out0b1_a0_V", "interface" : "wire", "bitwidth" : 27, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":26,"cElement": [{"cName": "out0b1_a0.V","cData": "int27","bit_use": { "low": 0,"up": 26},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "out0b2_a0_V", "interface" : "wire", "bitwidth" : 27, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":26,"cElement": [{"cName": "out0b2_a0.V","cData": "int27","bit_use": { "low": 0,"up": 26},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "out0a1_a0_V", "interface" : "wire", "bitwidth" : 27, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":26,"cElement": [{"cName": "out0a1_a0.V","cData": "int27","bit_use": { "low": 0,"up": 26},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "out0a2_a0_V", "interface" : "wire", "bitwidth" : 27, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":26,"cElement": [{"cName": "out0a2_a0.V","cData": "int27","bit_use": { "low": 0,"up": 26},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} ]}
# RTL Port declarations: 
set portNum 33
set portList { 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ out0b0_a0_V sc_out sc_lv 27 signal 5 } 
	{ out0b0_a0_V_ap_vld sc_out sc_logic 1 outvld 5 } 
	{ out0b1_a0_V sc_out sc_lv 27 signal 6 } 
	{ out0b1_a0_V_ap_vld sc_out sc_logic 1 outvld 6 } 
	{ out0b2_a0_V sc_out sc_lv 27 signal 7 } 
	{ out0b2_a0_V_ap_vld sc_out sc_logic 1 outvld 7 } 
	{ out0a1_a0_V sc_out sc_lv 27 signal 8 } 
	{ out0a1_a0_V_ap_vld sc_out sc_logic 1 outvld 8 } 
	{ out0a2_a0_V sc_out sc_lv 27 signal 9 } 
	{ out0a2_a0_V_ap_vld sc_out sc_logic 1 outvld 9 } 
	{ s_axi_coeffs_AWVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_coeffs_AWREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_coeffs_AWADDR sc_in sc_lv 6 signal -1 } 
	{ s_axi_coeffs_WVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_coeffs_WREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_coeffs_WDATA sc_in sc_lv 32 signal -1 } 
	{ s_axi_coeffs_WSTRB sc_in sc_lv 4 signal -1 } 
	{ s_axi_coeffs_ARVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_coeffs_ARREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_coeffs_ARADDR sc_in sc_lv 6 signal -1 } 
	{ s_axi_coeffs_RVALID sc_out sc_logic 1 signal -1 } 
	{ s_axi_coeffs_RREADY sc_in sc_logic 1 signal -1 } 
	{ s_axi_coeffs_RDATA sc_out sc_lv 32 signal -1 } 
	{ s_axi_coeffs_RRESP sc_out sc_lv 2 signal -1 } 
	{ s_axi_coeffs_BVALID sc_out sc_logic 1 signal -1 } 
	{ s_axi_coeffs_BREADY sc_in sc_logic 1 signal -1 } 
	{ s_axi_coeffs_BRESP sc_out sc_lv 2 signal -1 } 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst_n sc_in sc_logic 1 reset -1 active_low_sync } 
}
set NewPortList {[ 
	{ "name": "s_axi_coeffs_AWADDR", "direction": "in", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "coeffs", "role": "AWADDR" },"address":[{"name":"in0b0_a0_V","role":"data","value":"16"},{"name":"in0b1_a0_V","role":"data","value":"24"},{"name":"in0b2_a0_V","role":"data","value":"32"},{"name":"in0a1_a0_V","role":"data","value":"40"},{"name":"in0a2_a0_V","role":"data","value":"48"}] },
	{ "name": "s_axi_coeffs_AWVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "coeffs", "role": "AWVALID" } },
	{ "name": "s_axi_coeffs_AWREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "coeffs", "role": "AWREADY" } },
	{ "name": "s_axi_coeffs_WVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "coeffs", "role": "WVALID" } },
	{ "name": "s_axi_coeffs_WREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "coeffs", "role": "WREADY" } },
	{ "name": "s_axi_coeffs_WDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "coeffs", "role": "WDATA" } },
	{ "name": "s_axi_coeffs_WSTRB", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "coeffs", "role": "WSTRB" } },
	{ "name": "s_axi_coeffs_ARADDR", "direction": "in", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "coeffs", "role": "ARADDR" },"address":[] },
	{ "name": "s_axi_coeffs_ARVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "coeffs", "role": "ARVALID" } },
	{ "name": "s_axi_coeffs_ARREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "coeffs", "role": "ARREADY" } },
	{ "name": "s_axi_coeffs_RVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "coeffs", "role": "RVALID" } },
	{ "name": "s_axi_coeffs_RREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "coeffs", "role": "RREADY" } },
	{ "name": "s_axi_coeffs_RDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "coeffs", "role": "RDATA" } },
	{ "name": "s_axi_coeffs_RRESP", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "coeffs", "role": "RRESP" } },
	{ "name": "s_axi_coeffs_BVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "coeffs", "role": "BVALID" } },
	{ "name": "s_axi_coeffs_BREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "coeffs", "role": "BREADY" } },
	{ "name": "s_axi_coeffs_BRESP", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "coeffs", "role": "BRESP" } }, 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "out0b0_a0_V", "direction": "out", "datatype": "sc_lv", "bitwidth":27, "type": "signal", "bundle":{"name": "out0b0_a0_V", "role": "default" }} , 
 	{ "name": "out0b0_a0_V_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "out0b0_a0_V", "role": "ap_vld" }} , 
 	{ "name": "out0b1_a0_V", "direction": "out", "datatype": "sc_lv", "bitwidth":27, "type": "signal", "bundle":{"name": "out0b1_a0_V", "role": "default" }} , 
 	{ "name": "out0b1_a0_V_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "out0b1_a0_V", "role": "ap_vld" }} , 
 	{ "name": "out0b2_a0_V", "direction": "out", "datatype": "sc_lv", "bitwidth":27, "type": "signal", "bundle":{"name": "out0b2_a0_V", "role": "default" }} , 
 	{ "name": "out0b2_a0_V_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "out0b2_a0_V", "role": "ap_vld" }} , 
 	{ "name": "out0a1_a0_V", "direction": "out", "datatype": "sc_lv", "bitwidth":27, "type": "signal", "bundle":{"name": "out0a1_a0_V", "role": "default" }} , 
 	{ "name": "out0a1_a0_V_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "out0a1_a0_V", "role": "ap_vld" }} , 
 	{ "name": "out0a2_a0_V", "direction": "out", "datatype": "sc_lv", "bitwidth":27, "type": "signal", "bundle":{"name": "out0a2_a0_V", "role": "default" }} , 
 	{ "name": "out0a2_a0_V_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "out0a2_a0_V", "role": "ap_vld" }} , 
 	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst_n", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1"],
		"CDFG" : "Biquadv2coeffs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1",
		"Pipeline" : "None", "AlignedPipeline" : "0", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"Combinational" : "1",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"VariableLatency" : "0",
		"Port" : [
			{"Name" : "in0b0_a0_V", "Type" : "None", "Direction" : "I"},
			{"Name" : "in0b1_a0_V", "Type" : "None", "Direction" : "I"},
			{"Name" : "in0b2_a0_V", "Type" : "None", "Direction" : "I"},
			{"Name" : "in0a1_a0_V", "Type" : "None", "Direction" : "I"},
			{"Name" : "in0a2_a0_V", "Type" : "None", "Direction" : "I"},
			{"Name" : "out0b0_a0_V", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "out0b1_a0_V", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "out0b2_a0_V", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "out0a1_a0_V", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "out0a2_a0_V", "Type" : "Vld", "Direction" : "O"}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.Biquadv2coeffs_coeffs_s_axi_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	Biquadv2coeffs {
		in0b0_a0_V {Type I LastRead 0 FirstWrite -1}
		in0b1_a0_V {Type I LastRead 0 FirstWrite -1}
		in0b2_a0_V {Type I LastRead 0 FirstWrite -1}
		in0a1_a0_V {Type I LastRead 0 FirstWrite -1}
		in0a2_a0_V {Type I LastRead 0 FirstWrite -1}
		out0b0_a0_V {Type O LastRead -1 FirstWrite 0}
		out0b1_a0_V {Type O LastRead -1 FirstWrite 0}
		out0b2_a0_V {Type O LastRead -1 FirstWrite 0}
		out0a1_a0_V {Type O LastRead -1 FirstWrite 0}
		out0a2_a0_V {Type O LastRead -1 FirstWrite 0}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "0", "Max" : "0"}
	, {"Name" : "Interval", "Min" : "1", "Max" : "1"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	out0b0_a0_V { ap_vld {  { out0b0_a0_V out_data 1 27 }  { out0b0_a0_V_ap_vld out_vld 1 1 } } }
	out0b1_a0_V { ap_vld {  { out0b1_a0_V out_data 1 27 }  { out0b1_a0_V_ap_vld out_vld 1 1 } } }
	out0b2_a0_V { ap_vld {  { out0b2_a0_V out_data 1 27 }  { out0b2_a0_V_ap_vld out_vld 1 1 } } }
	out0a1_a0_V { ap_vld {  { out0a1_a0_V out_data 1 27 }  { out0a1_a0_V_ap_vld out_vld 1 1 } } }
	out0a2_a0_V { ap_vld {  { out0a2_a0_V out_data 1 27 }  { out0a2_a0_V_ap_vld out_vld 1 1 } } }
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
