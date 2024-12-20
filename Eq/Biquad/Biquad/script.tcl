############################################################
## This file is generated automatically by Vivado HLS.
## Please DO NOT edit it.
## Copyright (C) 1986-2017 Xilinx, Inc. All Rights Reserved.
############################################################
open_project Biquad
set_top Biquad
add_files SystemCImplementation/src/biquad.hpp
add_files SystemCImplementation/src/biquad.cpp
open_solution "Biquad"
set_part {xc7z010clg400-1} -tool vivado
create_clock -period 10 -name default
#source "./Biquad/Biquad/directives.tcl"
#csim_design
csynth_design
#cosim_design
export_design -rtl vhdl -format ip_catalog
