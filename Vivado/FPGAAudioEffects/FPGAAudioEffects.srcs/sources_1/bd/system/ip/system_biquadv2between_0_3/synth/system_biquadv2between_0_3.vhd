-- (c) Copyright 1995-2024 Xilinx, Inc. All rights reserved.
-- 
-- This file contains confidential and proprietary information
-- of Xilinx, Inc. and is protected under U.S. and
-- international copyright and other intellectual property
-- laws.
-- 
-- DISCLAIMER
-- This disclaimer is not a license and does not grant any
-- rights to the materials distributed herewith. Except as
-- otherwise provided in a valid license issued to you by
-- Xilinx, and to the maximum extent permitted by applicable
-- law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
-- WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
-- AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
-- BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
-- INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
-- (2) Xilinx shall not be liable (whether in contract or tort,
-- including negligence, or under any other theory of
-- liability) for any loss or damage of any kind or nature
-- related to, arising under or in connection with these
-- materials, including for any direct, or any indirect,
-- special, incidental, or consequential loss or damage
-- (including loss of data, profits, goodwill, or any type of
-- loss or damage suffered as a result of any action brought
-- by a third party) even if such damage or loss was
-- reasonably foreseeable or Xilinx had been advised of the
-- possibility of the same.
-- 
-- CRITICAL APPLICATIONS
-- Xilinx products are not designed or intended to be fail-
-- safe, or for use in any application requiring fail-safe
-- performance, such as life-support or safety devices or
-- systems, Class III medical devices, nuclear facilities,
-- applications related to the deployment of airbags, or any
-- other applications that could lead to death, personal
-- injury, or severe property or environmental damage
-- (individually and collectively, "Critical
-- Applications"). Customer assumes the sole risk and
-- liability of any use of Xilinx products in Critical
-- Applications, subject only to applicable laws and
-- regulations governing limitations on product liability.
-- 
-- THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
-- PART OF THIS FILE AT ALL TIMES.
-- 
-- DO NOT MODIFY THIS FILE.

-- IP VLNV: xilinx.com:hls:biquadv2between:1.0
-- IP Revision: 2113879027

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY system_biquadv2between_0_3 IS
  PORT (
    inDataLeft_V_ap_vld : IN STD_LOGIC;
    inDataLeft_V_ap_ack : OUT STD_LOGIC;
    inDataRight_V_ap_vld : IN STD_LOGIC;
    inDataRight_V_ap_ack : OUT STD_LOGIC;
    outDataLeft_V_ap_vld : OUT STD_LOGIC;
    outDataLeft_V_ap_ack : IN STD_LOGIC;
    outDataRight_V_ap_vld : OUT STD_LOGIC;
    outDataRight_V_ap_ack : IN STD_LOGIC;
    s_axi_biquadv2_AWADDR : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
    s_axi_biquadv2_AWVALID : IN STD_LOGIC;
    s_axi_biquadv2_AWREADY : OUT STD_LOGIC;
    s_axi_biquadv2_WDATA : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    s_axi_biquadv2_WSTRB : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    s_axi_biquadv2_WVALID : IN STD_LOGIC;
    s_axi_biquadv2_WREADY : OUT STD_LOGIC;
    s_axi_biquadv2_BRESP : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    s_axi_biquadv2_BVALID : OUT STD_LOGIC;
    s_axi_biquadv2_BREADY : IN STD_LOGIC;
    s_axi_biquadv2_ARADDR : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
    s_axi_biquadv2_ARVALID : IN STD_LOGIC;
    s_axi_biquadv2_ARREADY : OUT STD_LOGIC;
    s_axi_biquadv2_RDATA : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    s_axi_biquadv2_RRESP : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    s_axi_biquadv2_RVALID : OUT STD_LOGIC;
    s_axi_biquadv2_RREADY : IN STD_LOGIC;
    ap_clk : IN STD_LOGIC;
    ap_rst_n : IN STD_LOGIC;
    inDataLeft_V : IN STD_LOGIC_VECTOR(23 DOWNTO 0);
    inDataRight_V : IN STD_LOGIC_VECTOR(23 DOWNTO 0);
    outDataLeft_V : OUT STD_LOGIC_VECTOR(23 DOWNTO 0);
    outDataRight_V : OUT STD_LOGIC_VECTOR(23 DOWNTO 0)
  );
END system_biquadv2between_0_3;

ARCHITECTURE system_biquadv2between_0_3_arch OF system_biquadv2between_0_3 IS
  ATTRIBUTE DowngradeIPIdentifiedWarnings : STRING;
  ATTRIBUTE DowngradeIPIdentifiedWarnings OF system_biquadv2between_0_3_arch: ARCHITECTURE IS "yes";
  COMPONENT biquadv2between IS
    GENERIC (
      C_S_AXI_BIQUADV2_ADDR_WIDTH : INTEGER;
      C_S_AXI_BIQUADV2_DATA_WIDTH : INTEGER
    );
    PORT (
      inDataLeft_V_ap_vld : IN STD_LOGIC;
      inDataLeft_V_ap_ack : OUT STD_LOGIC;
      inDataRight_V_ap_vld : IN STD_LOGIC;
      inDataRight_V_ap_ack : OUT STD_LOGIC;
      outDataLeft_V_ap_vld : OUT STD_LOGIC;
      outDataLeft_V_ap_ack : IN STD_LOGIC;
      outDataRight_V_ap_vld : OUT STD_LOGIC;
      outDataRight_V_ap_ack : IN STD_LOGIC;
      s_axi_biquadv2_AWADDR : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
      s_axi_biquadv2_AWVALID : IN STD_LOGIC;
      s_axi_biquadv2_AWREADY : OUT STD_LOGIC;
      s_axi_biquadv2_WDATA : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      s_axi_biquadv2_WSTRB : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      s_axi_biquadv2_WVALID : IN STD_LOGIC;
      s_axi_biquadv2_WREADY : OUT STD_LOGIC;
      s_axi_biquadv2_BRESP : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      s_axi_biquadv2_BVALID : OUT STD_LOGIC;
      s_axi_biquadv2_BREADY : IN STD_LOGIC;
      s_axi_biquadv2_ARADDR : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
      s_axi_biquadv2_ARVALID : IN STD_LOGIC;
      s_axi_biquadv2_ARREADY : OUT STD_LOGIC;
      s_axi_biquadv2_RDATA : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      s_axi_biquadv2_RRESP : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      s_axi_biquadv2_RVALID : OUT STD_LOGIC;
      s_axi_biquadv2_RREADY : IN STD_LOGIC;
      ap_clk : IN STD_LOGIC;
      ap_rst_n : IN STD_LOGIC;
      inDataLeft_V : IN STD_LOGIC_VECTOR(23 DOWNTO 0);
      inDataRight_V : IN STD_LOGIC_VECTOR(23 DOWNTO 0);
      outDataLeft_V : OUT STD_LOGIC_VECTOR(23 DOWNTO 0);
      outDataRight_V : OUT STD_LOGIC_VECTOR(23 DOWNTO 0)
    );
  END COMPONENT biquadv2between;
  ATTRIBUTE X_CORE_INFO : STRING;
  ATTRIBUTE X_CORE_INFO OF system_biquadv2between_0_3_arch: ARCHITECTURE IS "biquadv2between,Vivado 2017.2";
  ATTRIBUTE CHECK_LICENSE_TYPE : STRING;
  ATTRIBUTE CHECK_LICENSE_TYPE OF system_biquadv2between_0_3_arch : ARCHITECTURE IS "system_biquadv2between_0_3,biquadv2between,{}";
  ATTRIBUTE CORE_GENERATION_INFO : STRING;
  ATTRIBUTE CORE_GENERATION_INFO OF system_biquadv2between_0_3_arch: ARCHITECTURE IS "system_biquadv2between_0_3,biquadv2between,{x_ipProduct=Vivado 2017.2,x_ipVendor=xilinx.com,x_ipLibrary=hls,x_ipName=biquadv2between,x_ipVersion=1.0,x_ipCoreRevision=2113879027,x_ipLanguage=VHDL,x_ipSimLanguage=MIXED,C_S_AXI_BIQUADV2_ADDR_WIDTH=6,C_S_AXI_BIQUADV2_DATA_WIDTH=32}";
  ATTRIBUTE X_INTERFACE_INFO : STRING;
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_biquadv2_AWADDR: SIGNAL IS "xilinx.com:interface:aximm:1.0 s_axi_biquadv2 AWADDR";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_biquadv2_AWVALID: SIGNAL IS "xilinx.com:interface:aximm:1.0 s_axi_biquadv2 AWVALID";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_biquadv2_AWREADY: SIGNAL IS "xilinx.com:interface:aximm:1.0 s_axi_biquadv2 AWREADY";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_biquadv2_WDATA: SIGNAL IS "xilinx.com:interface:aximm:1.0 s_axi_biquadv2 WDATA";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_biquadv2_WSTRB: SIGNAL IS "xilinx.com:interface:aximm:1.0 s_axi_biquadv2 WSTRB";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_biquadv2_WVALID: SIGNAL IS "xilinx.com:interface:aximm:1.0 s_axi_biquadv2 WVALID";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_biquadv2_WREADY: SIGNAL IS "xilinx.com:interface:aximm:1.0 s_axi_biquadv2 WREADY";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_biquadv2_BRESP: SIGNAL IS "xilinx.com:interface:aximm:1.0 s_axi_biquadv2 BRESP";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_biquadv2_BVALID: SIGNAL IS "xilinx.com:interface:aximm:1.0 s_axi_biquadv2 BVALID";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_biquadv2_BREADY: SIGNAL IS "xilinx.com:interface:aximm:1.0 s_axi_biquadv2 BREADY";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_biquadv2_ARADDR: SIGNAL IS "xilinx.com:interface:aximm:1.0 s_axi_biquadv2 ARADDR";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_biquadv2_ARVALID: SIGNAL IS "xilinx.com:interface:aximm:1.0 s_axi_biquadv2 ARVALID";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_biquadv2_ARREADY: SIGNAL IS "xilinx.com:interface:aximm:1.0 s_axi_biquadv2 ARREADY";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_biquadv2_RDATA: SIGNAL IS "xilinx.com:interface:aximm:1.0 s_axi_biquadv2 RDATA";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_biquadv2_RRESP: SIGNAL IS "xilinx.com:interface:aximm:1.0 s_axi_biquadv2 RRESP";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_biquadv2_RVALID: SIGNAL IS "xilinx.com:interface:aximm:1.0 s_axi_biquadv2 RVALID";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_biquadv2_RREADY: SIGNAL IS "xilinx.com:interface:aximm:1.0 s_axi_biquadv2 RREADY";
  ATTRIBUTE X_INTERFACE_INFO OF ap_clk: SIGNAL IS "xilinx.com:signal:clock:1.0 ap_clk CLK";
  ATTRIBUTE X_INTERFACE_INFO OF ap_rst_n: SIGNAL IS "xilinx.com:signal:reset:1.0 ap_rst_n RST";
  ATTRIBUTE X_INTERFACE_INFO OF inDataLeft_V: SIGNAL IS "xilinx.com:signal:data:1.0 inDataLeft_V DATA";
  ATTRIBUTE X_INTERFACE_INFO OF inDataRight_V: SIGNAL IS "xilinx.com:signal:data:1.0 inDataRight_V DATA";
  ATTRIBUTE X_INTERFACE_INFO OF outDataLeft_V: SIGNAL IS "xilinx.com:signal:data:1.0 outDataLeft_V DATA";
  ATTRIBUTE X_INTERFACE_INFO OF outDataRight_V: SIGNAL IS "xilinx.com:signal:data:1.0 outDataRight_V DATA";
BEGIN
  U0 : biquadv2between
    GENERIC MAP (
      C_S_AXI_BIQUADV2_ADDR_WIDTH => 6,
      C_S_AXI_BIQUADV2_DATA_WIDTH => 32
    )
    PORT MAP (
      inDataLeft_V_ap_vld => inDataLeft_V_ap_vld,
      inDataLeft_V_ap_ack => inDataLeft_V_ap_ack,
      inDataRight_V_ap_vld => inDataRight_V_ap_vld,
      inDataRight_V_ap_ack => inDataRight_V_ap_ack,
      outDataLeft_V_ap_vld => outDataLeft_V_ap_vld,
      outDataLeft_V_ap_ack => outDataLeft_V_ap_ack,
      outDataRight_V_ap_vld => outDataRight_V_ap_vld,
      outDataRight_V_ap_ack => outDataRight_V_ap_ack,
      s_axi_biquadv2_AWADDR => s_axi_biquadv2_AWADDR,
      s_axi_biquadv2_AWVALID => s_axi_biquadv2_AWVALID,
      s_axi_biquadv2_AWREADY => s_axi_biquadv2_AWREADY,
      s_axi_biquadv2_WDATA => s_axi_biquadv2_WDATA,
      s_axi_biquadv2_WSTRB => s_axi_biquadv2_WSTRB,
      s_axi_biquadv2_WVALID => s_axi_biquadv2_WVALID,
      s_axi_biquadv2_WREADY => s_axi_biquadv2_WREADY,
      s_axi_biquadv2_BRESP => s_axi_biquadv2_BRESP,
      s_axi_biquadv2_BVALID => s_axi_biquadv2_BVALID,
      s_axi_biquadv2_BREADY => s_axi_biquadv2_BREADY,
      s_axi_biquadv2_ARADDR => s_axi_biquadv2_ARADDR,
      s_axi_biquadv2_ARVALID => s_axi_biquadv2_ARVALID,
      s_axi_biquadv2_ARREADY => s_axi_biquadv2_ARREADY,
      s_axi_biquadv2_RDATA => s_axi_biquadv2_RDATA,
      s_axi_biquadv2_RRESP => s_axi_biquadv2_RRESP,
      s_axi_biquadv2_RVALID => s_axi_biquadv2_RVALID,
      s_axi_biquadv2_RREADY => s_axi_biquadv2_RREADY,
      ap_clk => ap_clk,
      ap_rst_n => ap_rst_n,
      inDataLeft_V => inDataLeft_V,
      inDataRight_V => inDataRight_V,
      outDataLeft_V => outDataLeft_V,
      outDataRight_V => outDataRight_V
    );
END system_biquadv2between_0_3_arch;
