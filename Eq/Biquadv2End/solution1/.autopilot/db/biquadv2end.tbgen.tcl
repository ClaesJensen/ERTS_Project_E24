set C_TypeInfoList {{ 
"biquadv2end" : [[], { "return": [[], "void"]} , [{"ExternC" : 0}], [ {"b0_a0": [[],"0"] }, {"b1_a0": [[],"0"] }, {"b2_a0": [[],"0"] }, {"a1_a0": [[],"0"] }, {"a2_a0": [[],"0"] }, {"inDataLeft": [[],"1"] }, {"inDataRight": [[],"1"] }, {"outDataLeft": [[],{ "pointer": "2"}] }, {"outDataRight": [[],{ "pointer": "2"}] }],[],""], 
"0": [ "coeff_t", {"typedef": [[[],"3"],""]}], 
"1": [ "inData_t", {"typedef": [[[],"4"],""]}], 
"4": [ "ap_fixed<24, 1, 0, 0, 0>", {"hls_type": {"ap_fixed": [[[[], {"scalar": { "int": 24}}],[[], {"scalar": { "int": 1}}],[[], {"scalar": { "5": 0}}],[[], {"scalar": { "6": 0}}],[[], {"scalar": { "int": 0}}]],""]}}], 
"6": [ "sc_o_mode", {"enum": [[],[],[{"SC_SAT":  {"scalar": "__integer__"}},{"SC_SAT_ZERO":  {"scalar": "__integer__"}},{"SC_SAT_SYM":  {"scalar": "__integer__"}},{"SC_WRAP":  {"scalar": "__integer__"}},{"SC_WRAP_SM":  {"scalar": "__integer__"}}],""]}], 
"2": [ "outData_t", {"typedef": [[[],"4"],""]}], 
"3": [ "ap_fixed<27, 3, 0, 0, 0>", {"hls_type": {"ap_fixed": [[[[], {"scalar": { "int": 27}}],[[], {"scalar": { "int": 3}}],[[], {"scalar": { "5": 0}}],[[], {"scalar": { "6": 0}}],[[], {"scalar": { "int": 0}}]],""]}}], 
"5": [ "sc_q_mode", {"enum": [[],[],[{"SC_RND":  {"scalar": "__integer__"}},{"SC_RND_ZERO":  {"scalar": "__integer__"}},{"SC_RND_MIN_INF":  {"scalar": "__integer__"}},{"SC_RND_INF":  {"scalar": "__integer__"}},{"SC_RND_CONV":  {"scalar": "__integer__"}},{"SC_TRN":  {"scalar": "__integer__"}},{"SC_TRN_ZERO":  {"scalar": "__integer__"}}],""]}]
}}
set moduleName biquadv2end
set isCombinational 0
set isDatapathOnly 0
set isPipelined 0
set pipeline_type none
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set C_modelName {biquadv2end}
set C_modelType { void 0 }
set C_modelArgList {
	{ b0_a0_V int 27 regular {axi_slave 0}  }
	{ b1_a0_V int 27 regular {axi_slave 0}  }
	{ b2_a0_V int 27 regular {axi_slave 0}  }
	{ a1_a0_V int 27 regular {axi_slave 0}  }
	{ a2_a0_V int 27 regular {axi_slave 0}  }
	{ inDataLeft_V int 24 regular  }
	{ inDataRight_V int 24 regular  }
	{ outDataLeft_V int 24 regular {axi_slave 1}  }
	{ outDataRight_V int 24 regular {axi_slave 1}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "b0_a0_V", "interface" : "axi_slave", "bundle":"biquadv2","type":"ap_none","bitwidth" : 27, "direction" : "READONLY", "bitSlice":[{"low":0,"up":26,"cElement": [{"cName": "b0_a0.V","cData": "int27","bit_use": { "low": 0,"up": 26},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}], "offset" : {"in":16}, "offset_end" : {"in":23}} , 
 	{ "Name" : "b1_a0_V", "interface" : "axi_slave", "bundle":"biquadv2","type":"ap_none","bitwidth" : 27, "direction" : "READONLY", "bitSlice":[{"low":0,"up":26,"cElement": [{"cName": "b1_a0.V","cData": "int27","bit_use": { "low": 0,"up": 26},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}], "offset" : {"in":24}, "offset_end" : {"in":31}} , 
 	{ "Name" : "b2_a0_V", "interface" : "axi_slave", "bundle":"biquadv2","type":"ap_none","bitwidth" : 27, "direction" : "READONLY", "bitSlice":[{"low":0,"up":26,"cElement": [{"cName": "b2_a0.V","cData": "int27","bit_use": { "low": 0,"up": 26},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}], "offset" : {"in":32}, "offset_end" : {"in":39}} , 
 	{ "Name" : "a1_a0_V", "interface" : "axi_slave", "bundle":"biquadv2","type":"ap_none","bitwidth" : 27, "direction" : "READONLY", "bitSlice":[{"low":0,"up":26,"cElement": [{"cName": "a1_a0.V","cData": "int27","bit_use": { "low": 0,"up": 26},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}], "offset" : {"in":40}, "offset_end" : {"in":47}} , 
 	{ "Name" : "a2_a0_V", "interface" : "axi_slave", "bundle":"biquadv2","type":"ap_none","bitwidth" : 27, "direction" : "READONLY", "bitSlice":[{"low":0,"up":26,"cElement": [{"cName": "a2_a0.V","cData": "int27","bit_use": { "low": 0,"up": 26},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}], "offset" : {"in":48}, "offset_end" : {"in":55}} , 
 	{ "Name" : "inDataLeft_V", "interface" : "wire", "bitwidth" : 24, "direction" : "READONLY", "bitSlice":[{"low":0,"up":23,"cElement": [{"cName": "inDataLeft.V","cData": "int24","bit_use": { "low": 0,"up": 23},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "inDataRight_V", "interface" : "wire", "bitwidth" : 24, "direction" : "READONLY", "bitSlice":[{"low":0,"up":23,"cElement": [{"cName": "inDataRight.V","cData": "int24","bit_use": { "low": 0,"up": 23},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "outDataLeft_V", "interface" : "axi_slave", "bundle":"biquadv2","type":"ap_vld","bitwidth" : 24, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":23,"cElement": [{"cName": "outDataLeft.V","cData": "int24","bit_use": { "low": 0,"up": 23},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}], "offset" : {"out":56}, "offset_end" : {"out":63}} , 
 	{ "Name" : "outDataRight_V", "interface" : "axi_slave", "bundle":"biquadv2","type":"ap_vld","bitwidth" : 24, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":23,"cElement": [{"cName": "outDataRight.V","cData": "int24","bit_use": { "low": 0,"up": 23},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}], "offset" : {"out":64}, "offset_end" : {"out":71}} ]}
# RTL Port declarations: 
set portNum 26
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst_n sc_in sc_logic 1 reset -1 active_low_sync } 
	{ inDataLeft_V sc_in sc_lv 24 signal 5 } 
	{ inDataLeft_V_ap_vld sc_in sc_logic 1 invld 5 } 
	{ inDataLeft_V_ap_ack sc_out sc_logic 1 inacc 5 } 
	{ inDataRight_V sc_in sc_lv 24 signal 6 } 
	{ inDataRight_V_ap_vld sc_in sc_logic 1 invld 6 } 
	{ inDataRight_V_ap_ack sc_out sc_logic 1 inacc 6 } 
	{ s_axi_biquadv2_AWVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_biquadv2_AWREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_biquadv2_AWADDR sc_in sc_lv 7 signal -1 } 
	{ s_axi_biquadv2_WVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_biquadv2_WREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_biquadv2_WDATA sc_in sc_lv 32 signal -1 } 
	{ s_axi_biquadv2_WSTRB sc_in sc_lv 4 signal -1 } 
	{ s_axi_biquadv2_ARVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_biquadv2_ARREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_biquadv2_ARADDR sc_in sc_lv 7 signal -1 } 
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
	{ "name": "s_axi_biquadv2_AWADDR", "direction": "in", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "biquadv2", "role": "AWADDR" },"address":[{"name":"biquadv2end","role":"start","value":"0","valid_bit":"0"},{"name":"biquadv2end","role":"continue","value":"0","valid_bit":"4"},{"name":"biquadv2end","role":"auto_start","value":"0","valid_bit":"7"},{"name":"b0_a0_V","role":"data","value":"16"},{"name":"b1_a0_V","role":"data","value":"24"},{"name":"b2_a0_V","role":"data","value":"32"},{"name":"a1_a0_V","role":"data","value":"40"},{"name":"a2_a0_V","role":"data","value":"48"}] },
	{ "name": "s_axi_biquadv2_AWVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "biquadv2", "role": "AWVALID" } },
	{ "name": "s_axi_biquadv2_AWREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "biquadv2", "role": "AWREADY" } },
	{ "name": "s_axi_biquadv2_WVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "biquadv2", "role": "WVALID" } },
	{ "name": "s_axi_biquadv2_WREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "biquadv2", "role": "WREADY" } },
	{ "name": "s_axi_biquadv2_WDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "biquadv2", "role": "WDATA" } },
	{ "name": "s_axi_biquadv2_WSTRB", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "biquadv2", "role": "WSTRB" } },
	{ "name": "s_axi_biquadv2_ARADDR", "direction": "in", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "biquadv2", "role": "ARADDR" },"address":[{"name":"biquadv2end","role":"start","value":"0","valid_bit":"0"},{"name":"biquadv2end","role":"done","value":"0","valid_bit":"1"},{"name":"biquadv2end","role":"idle","value":"0","valid_bit":"2"},{"name":"biquadv2end","role":"ready","value":"0","valid_bit":"3"},{"name":"biquadv2end","role":"auto_start","value":"0","valid_bit":"7"},{"name":"outDataLeft_V","role":"data","value":"56"}, {"name":"outDataLeft_V","role":"valid","value":"60","valid_bit":"0"},{"name":"outDataRight_V","role":"data","value":"64"}, {"name":"outDataRight_V","role":"valid","value":"68","valid_bit":"0"}] },
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
 	{ "name": "ap_rst_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst_n", "role": "default" }} , 
 	{ "name": "inDataLeft_V", "direction": "in", "datatype": "sc_lv", "bitwidth":24, "type": "signal", "bundle":{"name": "inDataLeft_V", "role": "default" }} , 
 	{ "name": "inDataLeft_V_ap_vld", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "invld", "bundle":{"name": "inDataLeft_V", "role": "ap_vld" }} , 
 	{ "name": "inDataLeft_V_ap_ack", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "inacc", "bundle":{"name": "inDataLeft_V", "role": "ap_ack" }} , 
 	{ "name": "inDataRight_V", "direction": "in", "datatype": "sc_lv", "bitwidth":24, "type": "signal", "bundle":{"name": "inDataRight_V", "role": "default" }} , 
 	{ "name": "inDataRight_V_ap_vld", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "invld", "bundle":{"name": "inDataRight_V", "role": "ap_vld" }} , 
 	{ "name": "inDataRight_V_ap_ack", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "inacc", "bundle":{"name": "inDataRight_V", "role": "ap_ack" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3"],
		"CDFG" : "biquadv2end",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1",
		"Pipeline" : "None", "AlignedPipeline" : "0", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"VariableLatency" : "1",
		"Port" : [
			{"Name" : "b0_a0_V", "Type" : "None", "Direction" : "I"},
			{"Name" : "b1_a0_V", "Type" : "None", "Direction" : "I"},
			{"Name" : "b2_a0_V", "Type" : "None", "Direction" : "I"},
			{"Name" : "a1_a0_V", "Type" : "None", "Direction" : "I"},
			{"Name" : "a2_a0_V", "Type" : "None", "Direction" : "I"},
			{"Name" : "inDataLeft_V", "Type" : "HS", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "inDataLeft_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "inDataRight_V", "Type" : "HS", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "inDataRight_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "outDataLeft_V", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "outDataRight_V", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "array_r", "Type" : "Memory", "Direction" : "IO"}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.array_r_U", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.biquadv2end_biquadv2_s_axi_U", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.biquadv2end_mul_2bkb_U0", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	biquadv2end {
		b0_a0_V {Type I LastRead 0 FirstWrite -1}
		b1_a0_V {Type I LastRead 0 FirstWrite -1}
		b2_a0_V {Type I LastRead 0 FirstWrite -1}
		a1_a0_V {Type I LastRead 0 FirstWrite -1}
		a2_a0_V {Type I LastRead 0 FirstWrite -1}
		inDataLeft_V {Type I LastRead 0 FirstWrite -1}
		inDataRight_V {Type I LastRead 0 FirstWrite -1}
		outDataLeft_V {Type O LastRead -1 FirstWrite 8}
		outDataRight_V {Type O LastRead -1 FirstWrite 8}
		array_r {Type IO LastRead -1 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "49", "Max" : "49"}
	, {"Name" : "Interval", "Min" : "50", "Max" : "50"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	inDataLeft_V { ap_hs {  { inDataLeft_V in_data 0 24 }  { inDataLeft_V_ap_vld in_vld 0 1 }  { inDataLeft_V_ap_ack in_acc 1 1 } } }
	inDataRight_V { ap_hs {  { inDataRight_V in_data 0 24 }  { inDataRight_V_ap_vld in_vld 0 1 }  { inDataRight_V_ap_ack in_acc 1 1 } } }
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
