############################################################
## This file is generated automatically by Vivado HLS.
## Please DO NOT edit it.
## Copyright (C) 1986-2017 Xilinx, Inc. All Rights Reserved.
############################################################
open_project Biquadv2Start
set_top biquadv2start
add_files Biquadv2Start/biquadv2start.cpp
add_files Biquadv2Start/biquadv2start.hpp
add_files -tb Biquadv2Start/biquadv2start_test.cpp
open_solution "solution1"
set_part {xc7z010clg400-1} -tool vivado
create_clock -period 10 -name default
#source "./Biquadv2Start/solution1/directives.tcl"
csim_design
csynth_design
cosim_design -setup -trace_level all -rtl vhdl
export_design -rtl vhdl -format ip_catalog
