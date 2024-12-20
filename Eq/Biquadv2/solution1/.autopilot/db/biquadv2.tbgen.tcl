set C_TypeInfoList {{ 
"biquadv2" : [[], { "return": [[], "void"]} , [{"ExternC" : 0}], [ {"inData": [[],"0"] }, {"outData": [[],{ "pointer": "1"}] }],[],""], 
"0": [ "inData_t", {"typedef": [[[],"2"],""]}], 
"2": [ "ap_fixed<24, 1, 0, 0, 0>", {"hls_type": {"ap_fixed": [[[[], {"scalar": { "int": 24}}],[[], {"scalar": { "int": 1}}],[[], {"scalar": { "3": 0}}],[[], {"scalar": { "4": 0}}],[[], {"scalar": { "int": 0}}]],""]}}], 
"3": [ "sc_q_mode", {"enum": [[],[],[{"SC_RND":  {"scalar": "__integer__"}},{"SC_RND_ZERO":  {"scalar": "__integer__"}},{"SC_RND_MIN_INF":  {"scalar": "__integer__"}},{"SC_RND_INF":  {"scalar": "__integer__"}},{"SC_RND_CONV":  {"scalar": "__integer__"}},{"SC_TRN":  {"scalar": "__integer__"}},{"SC_TRN_ZERO":  {"scalar": "__integer__"}}],""]}], 
"4": [ "sc_o_mode", {"enum": [[],[],[{"SC_SAT":  {"scalar": "__integer__"}},{"SC_SAT_ZERO":  {"scalar": "__integer__"}},{"SC_SAT_SYM":  {"scalar": "__integer__"}},{"SC_WRAP":  {"scalar": "__integer__"}},{"SC_WRAP_SM":  {"scalar": "__integer__"}}],""]}], 
"1": [ "outData_t", {"typedef": [[[],"2"],""]}]
}}
set moduleName biquadv2
set isCombinational 0
set isDatapathOnly 0
set isPipelined 0
set pipeline_type none
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set C_modelName {biquadv2}
set C_modelType { void 0 }
set C_modelArgList {
	{ inData_V int 24 regular {axi_slave 0}  }
	{ outData_V int 24 regular {axi_slave 1}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "inData_V", "interface" : "axi_slave", "bundle":"biquadv2","type":"ap_none","bitwidth" : 24, "direction" : "READONLY", "bitSlice":[{"low":0,"up":23,"cElement": [{"cName": "inData.V","cData": "int24","bit_use": { "low": 0,"up": 23},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}], "offset" : {"in":16}, "offset_end" : {"in":23}} , 
 	{ "Name" : "outData_V", "interface" : "axi_slave", "bundle":"biquadv2","type":"ap_vld","bitwidth" : 24, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":23,"cElement": [{"cName": "outData.V","cData": "int24","bit_use": { "low": 0,"up": 23},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}], "offset" : {"out":24}, "offset_end" : {"out":31}} ]}
# RTL Port declarations: 
set portNum 20
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst_n sc_in sc_logic 1 reset -1 active_low_sync } 
	{ s_axi_biquadv2_AWVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_biquadv2_AWREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_biquadv2_AWADDR sc_in sc_lv 5 signal -1 } 
	{ s_axi_biquadv2_WVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_biquadv2_WREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_biquadv2_WDATA sc_in sc_lv 32 signal -1 } 
	{ s_axi_biquadv2_WSTRB sc_in sc_lv 4 signal -1 } 
	{ s_axi_biquadv2_ARVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_biquadv2_ARREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_biquadv2_ARADDR sc_in sc_lv 5 signal -1 } 
	{ s_axi_biquadv2_RVALID sc_out sc_logic 1 signal -1 } 
	{ s_axi_biquadv2_RREADY sc_in sc_logic 1 signal -1 } 
	{ s_axi_biquadv2_RDATA sc_out sc_lv 32 signal -1 } 
	{ s_axi_biquadv2_RRESP sc_out sc_lv 2 signal -1 } 
	{ s_axi_biquadv2_BVALID sc_out sc_logic 1 signal -1 } 
	{ s_axi_biquadv2_BREADY sc_in sc_logic 1 signal -1 } 
	{ s_axi_biquadv2_BRESP sc_out sc_lv 2 signal -1 } 
	{ interrupt sc_out sc_logic 1 signal -1 } 
}
set NewPortList {[ 
	{ "name": "s_axi_biquadv2_AWADDR", "direction": "in", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "biquadv2", "role": "AWADDR" },"address":[{"name":"biquadv2","role":"start","value":"0","valid_bit":"0"},{"name":"biquadv2","role":"continue","value":"0","valid_bit":"4"},{"name":"biquadv2","role":"auto_start","value":"0","valid_bit":"7"},{"name":"inData_V","role":"data","value":"16"}] },
	{ "name": "s_axi_biquadv2_AWVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "biquadv2", "role": "AWVALID" } },
	{ "name": "s_axi_biquadv2_AWREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "biquadv2", "role": "AWREADY" } },
	{ "name": "s_axi_biquadv2_WVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "biquadv2", "role": "WVALID" } },
	{ "name": "s_axi_biquadv2_WREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "biquadv2", "role": "WREADY" } },
	{ "name": "s_axi_biquadv2_WDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "biquadv2", "role": "WDATA" } },
	{ "name": "s_axi_biquadv2_WSTRB", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "biquadv2", "role": "WSTRB" } },
	{ "name": "s_axi_biquadv2_ARADDR", "direction": "in", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "biquadv2", "role": "ARADDR" },"address":[{"name":"biquadv2","role":"start","value":"0","valid_bit":"0"},{"name":"biquadv2","role":"done","value":"0","valid_bit":"1"},{"name":"biquadv2","role":"idle","value":"0","valid_bit":"2"},{"name":"biquadv2","role":"ready","value":"0","valid_bit":"3"},{"name":"biquadv2","role":"auto_start","value":"0","valid_bit":"7"},{"name":"outData_V","role":"data","value":"24"}, {"name":"outData_V","role":"valid","value":"28","valid_bit":"0"}] },
	{ "name": "s_axi_biquadv2_ARVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "biquadv2", "role": "ARVALID" } },
	{ "name": "s_axi_biquadv2_ARREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "biquadv2", "role": "ARREADY" } },
	{ "name": "s_axi_biquadv2_RVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "biquadv2", "role": "RVALID" } },
	{ "name": "s_axi_biquadv2_RREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "biquadv2", "role": "RREADY" } },
	{ "name": "s_axi_biquadv2_RDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "biquadv2", "role": "RDATA" } },
	{ "name": "s_axi_biquadv2_RRESP", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "biquadv2", "role": "RRESP" } },
	{ "name": "s_axi_biquadv2_BVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "biquadv2", "role": "BVALID" } },
	{ "name": "s_axi_biquadv2_BREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "biquadv2", "role": "BREADY" } },
	{ "name": "s_axi_biquadv2_BRESP", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "biquadv2", "role": "BRESP" } },
	{ "name": "interrupt", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "biquadv2", "role": "interrupt" } }, 
 	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst_n", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4"],
		"CDFG" : "biquadv2",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1",
		"Pipeline" : "None", "AlignedPipeline" : "0", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"VariableLatency" : "1",
		"Port" : [
			{"Name" : "inData_V", "Type" : "None", "Direction" : "I"},
			{"Name" : "outData_V", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "coeffs", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "samples_V", "Type" : "Memory", "Direction" : "IO"}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.coeffs_U", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.samples_V_U", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.biquadv2_biquadv2_s_axi_U", "Parent" : "0"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.biquadv2_mul_24s_bkb_U0", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	biquadv2 {
		inData_V {Type I LastRead 0 FirstWrite -1}
		outData_V {Type O LastRead -1 FirstWrite 3}
		coeffs {Type I LastRead -1 FirstWrite -1}
		samples_V {Type IO LastRead -1 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "38", "Max" : "38"}
	, {"Name" : "Interval", "Min" : "39", "Max" : "39"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
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
