#include "hls_design_meta.h"
const Port_Property HLS_Design_Meta::port_props[]={
	Port_Property("ap_clk", 1, hls_in, -1, "", "", 1),
	Port_Property("ap_rst_n", 1, hls_in, -1, "", "", 1),
	Port_Property("s_axi_biquadv2_AWVALID", 1, hls_in, -1, "", "", 1),
	Port_Property("s_axi_biquadv2_AWREADY", 1, hls_out, -1, "", "", 1),
	Port_Property("s_axi_biquadv2_AWADDR", 5, hls_in, -1, "", "", 1),
	Port_Property("s_axi_biquadv2_WVALID", 1, hls_in, -1, "", "", 1),
	Port_Property("s_axi_biquadv2_WREADY", 1, hls_out, -1, "", "", 1),
	Port_Property("s_axi_biquadv2_WDATA", 32, hls_in, -1, "", "", 1),
	Port_Property("s_axi_biquadv2_WSTRB", 4, hls_in, -1, "", "", 1),
	Port_Property("s_axi_biquadv2_ARVALID", 1, hls_in, -1, "", "", 1),
	Port_Property("s_axi_biquadv2_ARREADY", 1, hls_out, -1, "", "", 1),
	Port_Property("s_axi_biquadv2_ARADDR", 5, hls_in, -1, "", "", 1),
	Port_Property("s_axi_biquadv2_RVALID", 1, hls_out, -1, "", "", 1),
	Port_Property("s_axi_biquadv2_RREADY", 1, hls_in, -1, "", "", 1),
	Port_Property("s_axi_biquadv2_RDATA", 32, hls_out, -1, "", "", 1),
	Port_Property("s_axi_biquadv2_RRESP", 2, hls_out, -1, "", "", 1),
	Port_Property("s_axi_biquadv2_BVALID", 1, hls_out, -1, "", "", 1),
	Port_Property("s_axi_biquadv2_BREADY", 1, hls_in, -1, "", "", 1),
	Port_Property("s_axi_biquadv2_BRESP", 2, hls_out, -1, "", "", 1),
	Port_Property("interrupt", 1, hls_out, -1, "", "", 1),
};
const char* HLS_Design_Meta::dut_name = "biquadv2";