# aclk {FREQ_HZ 148148163 CLK_DOMAIN top_design_processing_system7_0_0_FCLK_CLK1 PHASE 0.0} aclk1 {FREQ_HZ 148148163 CLK_DOMAIN top_design_processing_system7_0_0_FCLK_CLK1 PHASE 0.0} aclk2 {FREQ_HZ 148148163 CLK_DOMAIN top_design_processing_system7_0_0_FCLK_CLK1 PHASE 0.0}
# Clock Domain: top_design_processing_system7_0_0_FCLK_CLK1
create_clock -name aclk -period 6.750 [get_ports aclk]
# Generated clocks
create_generated_clock -name aclk1 -source [get_ports aclk] -divide_by 1 [get_ports aclk1]
create_generated_clock -name aclk2 -source [get_ports aclk] -divide_by 1 [get_ports aclk2]
