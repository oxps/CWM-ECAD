##############################################
# Part         - xcvu9p
# Package      - fsgd2104
# Speed grade  - -2L
# Xilinx Reference Board is VCU1525
###############################################################################

# General configuration - Do not modify
set_property CFGBVS GND                                [current_design]
set_property CONFIG_VOLTAGE 1.8                        [current_design]
set_property BITSTREAM.GENERAL.COMPRESS true           [current_design]
set_property BITSTREAM.CONFIG.EXTMASTERCCLK_EN {DIV-1} [current_design]
set_property BITSTREAM.CONFIG.SPI_32BIT_ADDR YES       [current_design]
set_property BITSTREAM.CONFIG.SPI_BUSWIDTH 4           [current_design]
set_property BITSTREAM.CONFIG.SPI_FALL_EDGE YES        [current_design]

set_property PACKAGE_PIN AY38 [get_ports clk_n]
set_property IOSTANDARD DIFF_SSTL12 [get_ports clk_n]
set_property PACKAGE_PIN AY37 [get_ports clk_p]
set_property IOSTANDARD DIFF_SSTL12 [get_ports clk_p]
create_clock -name clk -period 10.0 [get_ports clk_p]

set_property PACKAGE_PIN BD21 [get_ports rst]
set_property IOSTANDARD LVCMOS18 [get_ports rst]
set_property PULLUP true [get_ports rst]

set_property PACKAGE_PIN BC21 [get_ports lights_data]
set_property IOSTANDARD LVCMOS18 [get_ports lights_data]
set_property PACKAGE_PIN BB21 [get_ports plugs_data]
set_property IOSTANDARD LVCMOS18 [get_ports plugs_data]
set_property PACKAGE_PIN BA20 [get_ports temperature_data]
set_property IOSTANDARD LVCMOS18 [get_ports temperature_data]

set_property PACKAGE_PIN BC22 [get_ports lights_old]
set_property IOSTANDARD LVCMOS18 [get_ports lights_old]
set_property PACKAGE_PIN BB22 [get_ports plugs_old]
set_property IOSTANDARD LVCMOS18 [get_ports plugs_old]
set_property PACKAGE_PIN BB20 [get_ports temperature_old]
set_property IOSTANDARD LVCMOS18 [get_ports temperature_old]

set_property PACKAGE_PIN AL20 [get_ports lights]
set_property IOSTANDARD LVCMOS18 [get_ports lights]
set_property PACKAGE_PIN AL21 [get_ports plugs]
set_property IOSTANDARD LVCMOS18 [get_ports plugs]
set_property PACKAGE_PIN AM21 [get_ports temperature]
set_property IOSTANDARD LVCMOS18 [get_ports temperature]



#############################################################################################################



 


