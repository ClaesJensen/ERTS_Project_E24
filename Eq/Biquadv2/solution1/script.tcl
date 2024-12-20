############################################################
## This file is generated automatically by Vivado HLS.
## Please DO NOT edit it.
## Copyright (C) 1986-2017 Xilinx, Inc. All Rights Reserved.
############################################################
open_project Biquadv2
set_top biquadv2
add_files Biquadv2/biquadv2.hpp
add_files Biquadv2/biquadv2.cpp
add_files -tb Biquadv2/biquadv2_test.cpp
open_solution "solution1"
set_part {xc7z010clg400-1} -tool vivado
create_clock -period 10 -name default
#source "./Biquadv2/solution1/directives.tcl"
csim_design
csynth_design
cosim_design
export_design -rtl vhdl -format ip_catalog
