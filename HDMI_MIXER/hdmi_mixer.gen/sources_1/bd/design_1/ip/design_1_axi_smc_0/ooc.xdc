# aclk {FREQ_HZ 153333344 CLK_DOMAIN design_1_processing_system7_0_0_FCLK_CLK1 PHASE 0.0} aclk1 {FREQ_HZ 100000000 CLK_DOMAIN design_1_processing_system7_0_0_FCLK_CLK0 PHASE 0.0}
# Clock Domain: design_1_processing_system7_0_0_FCLK_CLK1
create_clock -name aclk -period 6.522 [get_ports aclk]
# Clock Domain: design_1_processing_system7_0_0_FCLK_CLK0
create_clock -name aclk1 -period 10.000 [get_ports aclk1]
# Generated clocks
