// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2017.2
// Copyright (C) 1986-2017 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module Biquad_process (
        ap_clk,
        ap_rst,
        inData,
        outData,
        outData_ap_vld
);

parameter    ap_ST_fsm_state1 = 11'd1;
parameter    ap_ST_fsm_state2 = 11'd2;
parameter    ap_ST_fsm_state3 = 11'd4;
parameter    ap_ST_fsm_state4 = 11'd8;
parameter    ap_ST_fsm_state5 = 11'd16;
parameter    ap_ST_fsm_state6 = 11'd32;
parameter    ap_ST_fsm_state7 = 11'd64;
parameter    ap_ST_fsm_state8 = 11'd128;
parameter    ap_ST_fsm_state9 = 11'd256;
parameter    ap_ST_fsm_state10 = 11'd512;
parameter    ap_ST_fsm_state11 = 11'd1024;

input   ap_clk;
input   ap_rst;
input  [31:0] inData;
output  [31:0] outData;
output   outData_ap_vld;

reg outData_ap_vld;

wire   [2:0] coeffs_address0;
reg    coeffs_ce0;
wire   [24:0] coeffs_q0;
wire   [31:0] samples_V_q0;
reg  signed [31:0] reg_193;
(* fsm_encoding = "none" *) reg   [10:0] ap_CS_fsm;
wire    ap_CS_fsm_state6;
wire   [31:0] samples_V_q1;
wire    ap_CS_fsm_state10;
reg   [31:0] val_V_reg_271;
wire    ap_CS_fsm_state3;
wire   [2:0] i_V_fu_205_p2;
reg   [2:0] i_V_reg_279;
wire    ap_CS_fsm_state5;
wire   [0:0] exitcond_fu_199_p2;
reg  signed [24:0] coeffs_load_reg_294;
wire    ap_CS_fsm_state7;
reg   [31:0] phitmp_reg_309;
wire    ap_CS_fsm_state8;
wire   [31:0] result_V_fu_240_p2;
wire    ap_CS_fsm_state9;
reg   [2:0] samples_V_address0;
reg    samples_V_ce0;
reg    samples_V_we0;
reg   [31:0] samples_V_d0;
reg   [2:0] samples_V_address1;
reg    samples_V_ce1;
reg    samples_V_we1;
reg   [31:0] samples_V_d1;
reg   [31:0] v_V_reg_168;
wire    ap_CS_fsm_state4;
reg   [2:0] t_V_reg_182;
wire   [31:0] tmp_fu_211_p1;
wire    ap_CS_fsm_state11;
wire   [55:0] grp_fu_224_p2;
reg   [10:0] ap_NS_fsm;

// power-on initialization
initial begin
#0 ap_CS_fsm = 11'd1;
end

Biquad_process_cobkb #(
    .DataWidth( 25 ),
    .AddressRange( 5 ),
    .AddressWidth( 3 ))
coeffs_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .address0(coeffs_address0),
    .ce0(coeffs_ce0),
    .q0(coeffs_q0)
);

Biquad_process_sacud #(
    .DataWidth( 32 ),
    .AddressRange( 5 ),
    .AddressWidth( 3 ))
samples_V_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .address0(samples_V_address0),
    .ce0(samples_V_ce0),
    .we0(samples_V_we0),
    .d0(samples_V_d0),
    .q0(samples_V_q0),
    .address1(samples_V_address1),
    .ce1(samples_V_ce1),
    .we1(samples_V_we1),
    .d1(samples_V_d1),
    .q1(samples_V_q1)
);

Biquad_mul_25s_32dEe #(
    .ID( 1 ),
    .NUM_STAGE( 2 ),
    .din0_WIDTH( 25 ),
    .din1_WIDTH( 32 ),
    .dout_WIDTH( 56 ))
Biquad_mul_25s_32dEe_U0(
    .clk(ap_clk),
    .reset(ap_rst),
    .din0(coeffs_load_reg_294),
    .din1(reg_193),
    .ce(1'b1),
    .dout(grp_fu_224_p2)
);

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_state1;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state10)) begin
        reg_193 <= samples_V_q1;
    end else if ((1'b1 == ap_CS_fsm_state6)) begin
        reg_193 <= samples_V_q0;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state9)) begin
        t_V_reg_182 <= i_V_reg_279;
    end else if ((1'b1 == ap_CS_fsm_state4)) begin
        t_V_reg_182 <= 3'd0;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state9)) begin
        v_V_reg_168 <= result_V_fu_240_p2;
    end else if ((1'b1 == ap_CS_fsm_state4)) begin
        v_V_reg_168 <= 32'd0;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state6)) begin
        coeffs_load_reg_294 <= coeffs_q0;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state5)) begin
        i_V_reg_279 <= i_V_fu_205_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state8)) begin
        phitmp_reg_309 <= {{grp_fu_224_p2[55:24]}};
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state3)) begin
        val_V_reg_271 <= inData;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state5)) begin
        coeffs_ce0 = 1'b1;
    end else begin
        coeffs_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state10)) begin
        outData_ap_vld = 1'b1;
    end else begin
        outData_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state11)) begin
        samples_V_address0 = 32'd1;
    end else if (((1'b1 == ap_CS_fsm_state10) | ((1'b1 == ap_CS_fsm_state5) & (exitcond_fu_199_p2 == 1'd1)))) begin
        samples_V_address0 = 32'd3;
    end else if (((1'b1 == ap_CS_fsm_state5) & (exitcond_fu_199_p2 == 1'd0))) begin
        samples_V_address0 = tmp_fu_211_p1;
    end else if ((1'b1 == ap_CS_fsm_state3)) begin
        samples_V_address0 = 32'd0;
    end else begin
        samples_V_address0 = 'bx;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state11)) begin
        samples_V_address1 = 32'd2;
    end else if ((1'b1 == ap_CS_fsm_state10)) begin
        samples_V_address1 = 32'd4;
    end else if ((1'b1 == ap_CS_fsm_state5)) begin
        samples_V_address1 = 32'd1;
    end else begin
        samples_V_address1 = 'bx;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state10) | (1'b1 == ap_CS_fsm_state3) | ((1'b1 == ap_CS_fsm_state5) & (exitcond_fu_199_p2 == 1'd0)) | ((1'b1 == ap_CS_fsm_state5) & (exitcond_fu_199_p2 == 1'd1)) | (1'b1 == ap_CS_fsm_state11))) begin
        samples_V_ce0 = 1'b1;
    end else begin
        samples_V_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state10) | (1'b1 == ap_CS_fsm_state5) | (1'b1 == ap_CS_fsm_state11))) begin
        samples_V_ce1 = 1'b1;
    end else begin
        samples_V_ce1 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state11)) begin
        samples_V_d0 = val_V_reg_271;
    end else if ((1'b1 == ap_CS_fsm_state10)) begin
        samples_V_d0 = v_V_reg_168;
    end else if ((1'b1 == ap_CS_fsm_state3)) begin
        samples_V_d0 = inData;
    end else begin
        samples_V_d0 = 'bx;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state11)) begin
        samples_V_d1 = reg_193;
    end else if ((1'b1 == ap_CS_fsm_state10)) begin
        samples_V_d1 = samples_V_q0;
    end else begin
        samples_V_d1 = 'bx;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state10) | (1'b1 == ap_CS_fsm_state3) | (1'b1 == ap_CS_fsm_state11))) begin
        samples_V_we0 = 1'b1;
    end else begin
        samples_V_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state10) | (1'b1 == ap_CS_fsm_state11))) begin
        samples_V_we1 = 1'b1;
    end else begin
        samples_V_we1 = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            ap_NS_fsm = ap_ST_fsm_state2;
        end
        ap_ST_fsm_state2 : begin
            ap_NS_fsm = ap_ST_fsm_state3;
        end
        ap_ST_fsm_state3 : begin
            ap_NS_fsm = ap_ST_fsm_state4;
        end
        ap_ST_fsm_state4 : begin
            ap_NS_fsm = ap_ST_fsm_state5;
        end
        ap_ST_fsm_state5 : begin
            if (((1'b1 == ap_CS_fsm_state5) & (exitcond_fu_199_p2 == 1'd1))) begin
                ap_NS_fsm = ap_ST_fsm_state10;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state6;
            end
        end
        ap_ST_fsm_state6 : begin
            ap_NS_fsm = ap_ST_fsm_state7;
        end
        ap_ST_fsm_state7 : begin
            ap_NS_fsm = ap_ST_fsm_state8;
        end
        ap_ST_fsm_state8 : begin
            ap_NS_fsm = ap_ST_fsm_state9;
        end
        ap_ST_fsm_state9 : begin
            ap_NS_fsm = ap_ST_fsm_state5;
        end
        ap_ST_fsm_state10 : begin
            ap_NS_fsm = ap_ST_fsm_state11;
        end
        ap_ST_fsm_state11 : begin
            ap_NS_fsm = ap_ST_fsm_state3;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign ap_CS_fsm_state10 = ap_CS_fsm[32'd9];

assign ap_CS_fsm_state11 = ap_CS_fsm[32'd10];

assign ap_CS_fsm_state3 = ap_CS_fsm[32'd2];

assign ap_CS_fsm_state4 = ap_CS_fsm[32'd3];

assign ap_CS_fsm_state5 = ap_CS_fsm[32'd4];

assign ap_CS_fsm_state6 = ap_CS_fsm[32'd5];

assign ap_CS_fsm_state7 = ap_CS_fsm[32'd6];

assign ap_CS_fsm_state8 = ap_CS_fsm[32'd7];

assign ap_CS_fsm_state9 = ap_CS_fsm[32'd8];

assign coeffs_address0 = tmp_fu_211_p1;

assign exitcond_fu_199_p2 = ((t_V_reg_182 == 3'd5) ? 1'b1 : 1'b0);

assign i_V_fu_205_p2 = (t_V_reg_182 + 3'd1);

assign outData = v_V_reg_168;

assign result_V_fu_240_p2 = (phitmp_reg_309 + v_V_reg_168);

assign tmp_fu_211_p1 = t_V_reg_182;

endmodule //Biquad_process