#include "hls_design_meta.h"
const Port_Property HLS_Design_Meta::port_props[]={
	Port_Property("inClk", 1, hls_in, -1, "", "", 1),
	Port_Property("inReset", 1, hls_in, -1, "", "", 1),
	Port_Property("inData", 32, hls_in, 2, "ap_none", "in_data", 1),
	Port_Property("outData", 32, hls_out, 3, "ap_vld", "out_data", 1),
};
const char* HLS_Design_Meta::dut_name = "Biquad::Biquad";
