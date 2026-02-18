// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.2 (lin64) Build 6299465 Fri Nov 14 12:34:56 MST 2025
// Date        : Wed Feb 18 16:49:57 2026
// Host        : serg running 64-bit Ubuntu 24.04.3 LTS
// Command     : write_verilog -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ top_design_axi_dynclk_0_0_stub.v
// Design      : top_design_axi_dynclk_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z020clg400-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* CHECK_LICENSE_TYPE = "top_design_axi_dynclk_0_0,axi_dynclk,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "axi_dynclk,Vivado 2025.2" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix(REF_CLK_I, PXL_CLK_O, PXL_CLK_5X_O, LOCKED_O, 
  s_axi_lite_awaddr, s_axi_lite_awprot, s_axi_lite_awvalid, s_axi_lite_awready, 
  s_axi_lite_wdata, s_axi_lite_wstrb, s_axi_lite_wvalid, s_axi_lite_wready, 
  s_axi_lite_bresp, s_axi_lite_bvalid, s_axi_lite_bready, s_axi_lite_araddr, 
  s_axi_lite_arprot, s_axi_lite_arvalid, s_axi_lite_arready, s_axi_lite_rdata, 
  s_axi_lite_rresp, s_axi_lite_rvalid, s_axi_lite_rready, s_axi_lite_aclk, 
  s_axi_lite_aresetn)
/* synthesis syn_black_box black_box_pad_pin="PXL_CLK_5X_O,LOCKED_O,s_axi_lite_awaddr[5:0],s_axi_lite_awprot[2:0],s_axi_lite_awvalid,s_axi_lite_awready,s_axi_lite_wdata[31:0],s_axi_lite_wstrb[3:0],s_axi_lite_wvalid,s_axi_lite_wready,s_axi_lite_bresp[1:0],s_axi_lite_bvalid,s_axi_lite_bready,s_axi_lite_araddr[5:0],s_axi_lite_arprot[2:0],s_axi_lite_arvalid,s_axi_lite_arready,s_axi_lite_rdata[31:0],s_axi_lite_rresp[1:0],s_axi_lite_rvalid,s_axi_lite_rready,s_axi_lite_aresetn" */
/* synthesis syn_force_seq_prim="REF_CLK_I" */
/* synthesis syn_force_seq_prim="PXL_CLK_O" */
/* synthesis syn_force_seq_prim="s_axi_lite_aclk" */;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 REF_CLK_I CLK" *) (* x_interface_mode = "slave REF_CLK_I" *) (* x_interface_parameter = "XIL_INTERFACENAME REF_CLK_I, FREQ_HZ 148148163, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN top_design_processing_system7_0_0_FCLK_CLK0, INSERT_VIP 0" *) input REF_CLK_I /* synthesis syn_isclock = 1 */;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 PXL_CLK_O CLK" *) (* x_interface_mode = "master PXL_CLK_O" *) (* x_interface_parameter = "XIL_INTERFACENAME PXL_CLK_O, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN top_design_axi_dynclk_0_0_PXL_CLK_O, INSERT_VIP 0" *) output PXL_CLK_O /* synthesis syn_isclock = 1 */;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 PXL_CLK_5X_O CLK" *) (* x_interface_mode = "master PXL_CLK_5X_O" *) (* x_interface_parameter = "XIL_INTERFACENAME PXL_CLK_5X_O, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN top_design_axi_dynclk_0_0_PXL_CLK_5X_O, INSERT_VIP 0" *) output PXL_CLK_5X_O;
  output LOCKED_O;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI_LITE AWADDR" *) (* x_interface_mode = "slave S_AXI_LITE" *) (* x_interface_parameter = "XIL_INTERFACENAME S_AXI_LITE, WIZ_DATA_WIDTH 32, WIZ_NUM_REG 9, SUPPORTS_NARROW_BURST 0, DATA_WIDTH 32, PROTOCOL AXI4LITE, FREQ_HZ 148148163, ID_WIDTH 0, ADDR_WIDTH 6, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 0, HAS_LOCK 0, HAS_PROT 1, HAS_CACHE 0, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, NUM_READ_OUTSTANDING 8, NUM_WRITE_OUTSTANDING 8, MAX_BURST_LENGTH 1, PHASE 0.0, CLK_DOMAIN top_design_processing_system7_0_0_FCLK_CLK0, NUM_READ_THREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0" *) input [5:0]s_axi_lite_awaddr;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI_LITE AWPROT" *) input [2:0]s_axi_lite_awprot;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI_LITE AWVALID" *) input s_axi_lite_awvalid;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI_LITE AWREADY" *) output s_axi_lite_awready;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI_LITE WDATA" *) input [31:0]s_axi_lite_wdata;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI_LITE WSTRB" *) input [3:0]s_axi_lite_wstrb;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI_LITE WVALID" *) input s_axi_lite_wvalid;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI_LITE WREADY" *) output s_axi_lite_wready;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI_LITE BRESP" *) output [1:0]s_axi_lite_bresp;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI_LITE BVALID" *) output s_axi_lite_bvalid;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI_LITE BREADY" *) input s_axi_lite_bready;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI_LITE ARADDR" *) input [5:0]s_axi_lite_araddr;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI_LITE ARPROT" *) input [2:0]s_axi_lite_arprot;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI_LITE ARVALID" *) input s_axi_lite_arvalid;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI_LITE ARREADY" *) output s_axi_lite_arready;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI_LITE RDATA" *) output [31:0]s_axi_lite_rdata;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI_LITE RRESP" *) output [1:0]s_axi_lite_rresp;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI_LITE RVALID" *) output s_axi_lite_rvalid;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI_LITE RREADY" *) input s_axi_lite_rready;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 S_AXI_LITE_CLK CLK, xilinx.com:signal:clock:1.0 s_axi_lite_aclk CLK" *) (* x_interface_mode = "slave S_AXI_LITE_CLK, slave s_axi_lite_aclk" *) (* x_interface_parameter = "XIL_INTERFACENAME S_AXI_LITE_CLK, ASSOCIATED_BUSIF S_AXI_LITE, ASSOCIATED_RESET s_axi_lite_aresetn, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, INSERT_VIP 0, XIL_INTERFACENAME s_axi_lite_aclk, ASSOCIATED_RESET s_axi_lite_aresetn, FREQ_HZ 148148163, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN top_design_processing_system7_0_0_FCLK_CLK0, ASSOCIATED_BUSIF S_AXI_LITE, INSERT_VIP 0" *) input s_axi_lite_aclk /* synthesis syn_isclock = 1 */;
  (* x_interface_info = "xilinx.com:signal:reset:1.0 S_AXI_LITE_RST RST, xilinx.com:signal:reset:1.0 s_axi_lite_aresetn RST" *) (* x_interface_mode = "slave S_AXI_LITE_RST, slave s_axi_lite_aresetn" *) (* x_interface_parameter = "XIL_INTERFACENAME S_AXI_LITE_RST, POLARITY ACTIVE_LOW, INSERT_VIP 0, XIL_INTERFACENAME s_axi_lite_aresetn, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) input s_axi_lite_aresetn;
endmodule
