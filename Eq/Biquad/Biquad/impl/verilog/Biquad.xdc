create_clock -name inClk -period 10.000 -waveform {0.000 5.000} [get_ports inClk]
set_property HD.CLK_SRC BUFGCTRL_X0Y0 [get_ports inClk]

#set_input_delay 0 -clock CLK  [all_inputs]
#set_output_delay 0 -clock CLK [all_outputs]


