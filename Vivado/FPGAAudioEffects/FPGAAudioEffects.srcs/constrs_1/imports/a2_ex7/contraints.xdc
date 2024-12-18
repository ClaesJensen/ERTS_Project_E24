############################
# On-board LEDS            #
############################
set_property PACKAGE_PIN M14 [get_ports outLeds[0]]
set_property IOSTANDARD LVCMOS33 [get_ports outLeds[0]]
set_property PACKAGE_PIN M15 [get_ports outLeds[1]]
set_property IOSTANDARD LVCMOS33 [get_ports outLeds[1]]
set_property PACKAGE_PIN G14 [get_ports outLeds[2]]
set_property IOSTANDARD LVCMOS33 [get_ports outLeds[2]]
set_property PACKAGE_PIN D18 [get_ports outLeds[3]]
set_property IOSTANDARD LVCMOS33 [get_ports outLeds[3]]

############################
# On-board SWS             #
############################
set_property PACKAGE_PIN G15 [get_ports inSwitch[0]]
set_property IOSTANDARD LVCMOS33 [get_ports inSwitch[0]]
set_property PACKAGE_PIN P15 [get_ports inSwitch[1]]
set_property IOSTANDARD LVCMOS33 [get_ports inSwitch[1]]
set_property PACKAGE_PIN W13 [get_ports inSwitch[2]]
set_property IOSTANDARD LVCMOS33 [get_ports inSwitch[2]]
set_property PACKAGE_PIN T16 [get_ports inSwitch[3]]
set_property IOSTANDARD LVCMOS33 [get_ports inSwitch[3]]

############################
# On-board BTNS             #
############################
#set_property PACKAGE_PIN R18 [get_ports inBtns[0]]
#set_property IOSTANDARD LVCMOS33 [get_ports inBtns[0]]
#set_property PACKAGE_PIN P16 [get_ports inBtns[1]]
#set_property IOSTANDARD LVCMOS33 [get_ports inBtns[1]]
#set_property PACKAGE_PIN V16 [get_ports inBtns[2]]
#set_property IOSTANDARD LVCMOS33 [get_ports inBtns[2]]
#set_property PACKAGE_PIN Y16 [get_ports inBtns[3]]
#set_property IOSTANDARD LVCMOS33 [get_ports inBtns[3]]

#ZyBo board
# Audio Related constraints
set_property PACKAGE_PIN K18 [get_ports BCLK]
set_property IOSTANDARD LVCMOS33 [get_ports BCLK]

set_property PACKAGE_PIN L17 [get_ports PBLRCLK]
set_property IOSTANDARD LVCMOS33 [get_ports PBLRCLK]

set_property PACKAGE_PIN M18 [get_ports RECLRCLK]
set_property IOSTANDARD LVCMOS33 [get_ports RECLRCLK]

set_property PACKAGE_PIN K17 [get_ports RECDAT]
set_property IOSTANDARD LVCMOS33 [get_ports RECDAT]

set_property PACKAGE_PIN M17 [get_ports PBDATA]
set_property IOSTANDARD LVCMOS33 [get_ports PBDATA]

#GPIO[0] output (MUTE)
set_property PACKAGE_PIN P18 [get_ports {gpio_tri_o[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpio_tri_o[0]}]

#MCLK
set_property PACKAGE_PIN T19 [get_ports FCLK_CLK1]
set_property IOSTANDARD LVCMOS33 [get_ports FCLK_CLK1]

#I2C 1 interface
set_property PACKAGE_PIN N18 [get_ports iic_1_scl_io]
set_property IOSTANDARD LVCMOS33 [get_ports iic_1_scl_io]

#I2C 1 interface
set_property PACKAGE_PIN N17 [get_ports iic_1_sda_io]
set_property IOSTANDARD LVCMOS33 [get_ports iic_1_sda_io]

# GPIO2[0] for bypass a sample or send it through the filter
set_property PACKAGE_PIN G15 [get_ports {gpio2_tri_i[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpio2_tri_i[0]}]

