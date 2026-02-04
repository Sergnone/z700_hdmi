//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Command: generate_target bd_7ad6.bd
//Design : bd_7ad6
//Purpose: IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "bd_7ad6,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=bd_7ad6,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=12,numReposBlks=12,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=SBD,synth_mode=None}" *) (* HW_HANDOFF = "top_design_system_ila_0_0.hwdef" *) 
module bd_7ad6
   (SLOT_0_AXIS_tdata,
    SLOT_0_AXIS_tdest,
    SLOT_0_AXIS_tid,
    SLOT_0_AXIS_tkeep,
    SLOT_0_AXIS_tlast,
    SLOT_0_AXIS_tready,
    SLOT_0_AXIS_tstrb,
    SLOT_0_AXIS_tuser,
    SLOT_0_AXIS_tvalid,
    SLOT_1_AXI_araddr,
    SLOT_1_AXI_arcache,
    SLOT_1_AXI_arlen,
    SLOT_1_AXI_arlock,
    SLOT_1_AXI_arprot,
    SLOT_1_AXI_arqos,
    SLOT_1_AXI_arready,
    SLOT_1_AXI_arregion,
    SLOT_1_AXI_arsize,
    SLOT_1_AXI_arvalid,
    SLOT_1_AXI_awaddr,
    SLOT_1_AXI_awcache,
    SLOT_1_AXI_awlen,
    SLOT_1_AXI_awlock,
    SLOT_1_AXI_awprot,
    SLOT_1_AXI_awqos,
    SLOT_1_AXI_awready,
    SLOT_1_AXI_awregion,
    SLOT_1_AXI_awsize,
    SLOT_1_AXI_awvalid,
    SLOT_1_AXI_bready,
    SLOT_1_AXI_bresp,
    SLOT_1_AXI_bvalid,
    SLOT_1_AXI_rdata,
    SLOT_1_AXI_rlast,
    SLOT_1_AXI_rready,
    SLOT_1_AXI_rresp,
    SLOT_1_AXI_rvalid,
    SLOT_1_AXI_wdata,
    SLOT_1_AXI_wlast,
    SLOT_1_AXI_wready,
    SLOT_1_AXI_wstrb,
    SLOT_1_AXI_wvalid,
    SLOT_2_AXI_araddr,
    SLOT_2_AXI_arcache,
    SLOT_2_AXI_arlen,
    SLOT_2_AXI_arlock,
    SLOT_2_AXI_arprot,
    SLOT_2_AXI_arqos,
    SLOT_2_AXI_arready,
    SLOT_2_AXI_arregion,
    SLOT_2_AXI_arsize,
    SLOT_2_AXI_arvalid,
    SLOT_2_AXI_awaddr,
    SLOT_2_AXI_awcache,
    SLOT_2_AXI_awlen,
    SLOT_2_AXI_awlock,
    SLOT_2_AXI_awprot,
    SLOT_2_AXI_awqos,
    SLOT_2_AXI_awready,
    SLOT_2_AXI_awregion,
    SLOT_2_AXI_awsize,
    SLOT_2_AXI_awvalid,
    SLOT_2_AXI_bready,
    SLOT_2_AXI_bresp,
    SLOT_2_AXI_bvalid,
    SLOT_2_AXI_rdata,
    SLOT_2_AXI_rlast,
    SLOT_2_AXI_rready,
    SLOT_2_AXI_rresp,
    SLOT_2_AXI_rvalid,
    SLOT_2_AXI_wdata,
    SLOT_2_AXI_wlast,
    SLOT_2_AXI_wready,
    SLOT_2_AXI_wstrb,
    SLOT_2_AXI_wvalid,
    SLOT_3_AXIS_tdata,
    SLOT_3_AXIS_tdest,
    SLOT_3_AXIS_tid,
    SLOT_3_AXIS_tkeep,
    SLOT_3_AXIS_tlast,
    SLOT_3_AXIS_tready,
    SLOT_3_AXIS_tstrb,
    SLOT_3_AXIS_tuser,
    SLOT_3_AXIS_tvalid,
    clk,
    resetn);
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 SLOT_0_AXIS TDATA" *) (* X_INTERFACE_MODE = "Monitor SlaveType" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME SLOT_0_AXIS, CLK_DOMAIN top_design_processing_system7_0_0_FCLK_CLK1, FREQ_HZ 148148163, HAS_TKEEP 1, HAS_TLAST 1, HAS_TREADY 1, HAS_TSTRB 1, INSERT_VIP 0, LAYERED_METADATA undef, PHASE 0.0, TDATA_NUM_BYTES 3, TDEST_WIDTH 1, TID_WIDTH 1, TUSER_WIDTH 1" *) input [23:0]SLOT_0_AXIS_tdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 SLOT_0_AXIS TDEST" *) input [0:0]SLOT_0_AXIS_tdest;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 SLOT_0_AXIS TID" *) input [0:0]SLOT_0_AXIS_tid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 SLOT_0_AXIS TKEEP" *) input [2:0]SLOT_0_AXIS_tkeep;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 SLOT_0_AXIS TLAST" *) input SLOT_0_AXIS_tlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 SLOT_0_AXIS TREADY" *) input SLOT_0_AXIS_tready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 SLOT_0_AXIS TSTRB" *) input [2:0]SLOT_0_AXIS_tstrb;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 SLOT_0_AXIS TUSER" *) input [0:0]SLOT_0_AXIS_tuser;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 SLOT_0_AXIS TVALID" *) input SLOT_0_AXIS_tvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_1_AXI ARADDR" *) (* X_INTERFACE_MODE = "Monitor SlaveType" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME SLOT_1_AXI, ADDR_WIDTH 32, ARUSER_WIDTH 0, AWUSER_WIDTH 0, BUSER_WIDTH 0, CLK_DOMAIN top_design_processing_system7_0_0_FCLK_CLK1, DATA_WIDTH 64, FREQ_HZ 148148163, HAS_BRESP 1, HAS_BURST 0, HAS_CACHE 1, HAS_LOCK 1, HAS_PROT 1, HAS_QOS 1, HAS_REGION 1, HAS_RRESP 1, HAS_WSTRB 1, ID_WIDTH 0, INSERT_VIP 0, MAX_BURST_LENGTH 16, NUM_READ_OUTSTANDING 2, NUM_READ_THREADS 1, NUM_WRITE_OUTSTANDING 4, NUM_WRITE_THREADS 1, PHASE 0.0, PROTOCOL AXI4, READ_WRITE_MODE READ_WRITE, RUSER_BITS_PER_BYTE 0, RUSER_WIDTH 0, SUPPORTS_NARROW_BURST 0, WUSER_BITS_PER_BYTE 0, WUSER_WIDTH 0" *) input [31:0]SLOT_1_AXI_araddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_1_AXI ARCACHE" *) input [3:0]SLOT_1_AXI_arcache;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_1_AXI ARLEN" *) input [7:0]SLOT_1_AXI_arlen;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_1_AXI ARLOCK" *) input [0:0]SLOT_1_AXI_arlock;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_1_AXI ARPROT" *) input [2:0]SLOT_1_AXI_arprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_1_AXI ARQOS" *) input [3:0]SLOT_1_AXI_arqos;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_1_AXI ARREADY" *) input SLOT_1_AXI_arready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_1_AXI ARREGION" *) input [3:0]SLOT_1_AXI_arregion;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_1_AXI ARSIZE" *) input [2:0]SLOT_1_AXI_arsize;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_1_AXI ARVALID" *) input SLOT_1_AXI_arvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_1_AXI AWADDR" *) input [31:0]SLOT_1_AXI_awaddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_1_AXI AWCACHE" *) input [3:0]SLOT_1_AXI_awcache;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_1_AXI AWLEN" *) input [7:0]SLOT_1_AXI_awlen;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_1_AXI AWLOCK" *) input [0:0]SLOT_1_AXI_awlock;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_1_AXI AWPROT" *) input [2:0]SLOT_1_AXI_awprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_1_AXI AWQOS" *) input [3:0]SLOT_1_AXI_awqos;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_1_AXI AWREADY" *) input SLOT_1_AXI_awready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_1_AXI AWREGION" *) input [3:0]SLOT_1_AXI_awregion;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_1_AXI AWSIZE" *) input [2:0]SLOT_1_AXI_awsize;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_1_AXI AWVALID" *) input SLOT_1_AXI_awvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_1_AXI BREADY" *) input SLOT_1_AXI_bready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_1_AXI BRESP" *) input [1:0]SLOT_1_AXI_bresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_1_AXI BVALID" *) input SLOT_1_AXI_bvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_1_AXI RDATA" *) input [63:0]SLOT_1_AXI_rdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_1_AXI RLAST" *) input SLOT_1_AXI_rlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_1_AXI RREADY" *) input SLOT_1_AXI_rready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_1_AXI RRESP" *) input [1:0]SLOT_1_AXI_rresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_1_AXI RVALID" *) input SLOT_1_AXI_rvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_1_AXI WDATA" *) input [63:0]SLOT_1_AXI_wdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_1_AXI WLAST" *) input SLOT_1_AXI_wlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_1_AXI WREADY" *) input SLOT_1_AXI_wready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_1_AXI WSTRB" *) input [7:0]SLOT_1_AXI_wstrb;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_1_AXI WVALID" *) input SLOT_1_AXI_wvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_2_AXI ARADDR" *) (* X_INTERFACE_MODE = "Monitor SlaveType" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME SLOT_2_AXI, ADDR_WIDTH 32, ARUSER_WIDTH 0, AWUSER_WIDTH 0, BUSER_WIDTH 0, CLK_DOMAIN top_design_processing_system7_0_0_FCLK_CLK1, DATA_WIDTH 64, FREQ_HZ 148148163, HAS_BRESP 1, HAS_BURST 0, HAS_CACHE 1, HAS_LOCK 1, HAS_PROT 1, HAS_QOS 1, HAS_REGION 1, HAS_RRESP 1, HAS_WSTRB 1, ID_WIDTH 0, INSERT_VIP 0, MAX_BURST_LENGTH 16, NUM_READ_OUTSTANDING 4, NUM_READ_THREADS 1, NUM_WRITE_OUTSTANDING 2, NUM_WRITE_THREADS 1, PHASE 0.0, PROTOCOL AXI4, READ_WRITE_MODE READ_WRITE, RUSER_BITS_PER_BYTE 0, RUSER_WIDTH 0, SUPPORTS_NARROW_BURST 0, WUSER_BITS_PER_BYTE 0, WUSER_WIDTH 0" *) input [31:0]SLOT_2_AXI_araddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_2_AXI ARCACHE" *) input [3:0]SLOT_2_AXI_arcache;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_2_AXI ARLEN" *) input [7:0]SLOT_2_AXI_arlen;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_2_AXI ARLOCK" *) input [0:0]SLOT_2_AXI_arlock;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_2_AXI ARPROT" *) input [2:0]SLOT_2_AXI_arprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_2_AXI ARQOS" *) input [3:0]SLOT_2_AXI_arqos;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_2_AXI ARREADY" *) input SLOT_2_AXI_arready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_2_AXI ARREGION" *) input [3:0]SLOT_2_AXI_arregion;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_2_AXI ARSIZE" *) input [2:0]SLOT_2_AXI_arsize;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_2_AXI ARVALID" *) input SLOT_2_AXI_arvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_2_AXI AWADDR" *) input [31:0]SLOT_2_AXI_awaddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_2_AXI AWCACHE" *) input [3:0]SLOT_2_AXI_awcache;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_2_AXI AWLEN" *) input [7:0]SLOT_2_AXI_awlen;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_2_AXI AWLOCK" *) input [0:0]SLOT_2_AXI_awlock;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_2_AXI AWPROT" *) input [2:0]SLOT_2_AXI_awprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_2_AXI AWQOS" *) input [3:0]SLOT_2_AXI_awqos;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_2_AXI AWREADY" *) input SLOT_2_AXI_awready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_2_AXI AWREGION" *) input [3:0]SLOT_2_AXI_awregion;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_2_AXI AWSIZE" *) input [2:0]SLOT_2_AXI_awsize;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_2_AXI AWVALID" *) input SLOT_2_AXI_awvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_2_AXI BREADY" *) input SLOT_2_AXI_bready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_2_AXI BRESP" *) input [1:0]SLOT_2_AXI_bresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_2_AXI BVALID" *) input SLOT_2_AXI_bvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_2_AXI RDATA" *) input [63:0]SLOT_2_AXI_rdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_2_AXI RLAST" *) input SLOT_2_AXI_rlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_2_AXI RREADY" *) input SLOT_2_AXI_rready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_2_AXI RRESP" *) input [1:0]SLOT_2_AXI_rresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_2_AXI RVALID" *) input SLOT_2_AXI_rvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_2_AXI WDATA" *) input [63:0]SLOT_2_AXI_wdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_2_AXI WLAST" *) input SLOT_2_AXI_wlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_2_AXI WREADY" *) input SLOT_2_AXI_wready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_2_AXI WSTRB" *) input [7:0]SLOT_2_AXI_wstrb;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_2_AXI WVALID" *) input SLOT_2_AXI_wvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 SLOT_3_AXIS TDATA" *) (* X_INTERFACE_MODE = "Monitor SlaveType" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME SLOT_3_AXIS, CLK_DOMAIN top_design_processing_system7_0_0_FCLK_CLK1, FREQ_HZ 148148163, HAS_TKEEP 1, HAS_TLAST 1, HAS_TREADY 1, HAS_TSTRB 1, INSERT_VIP 0, LAYERED_METADATA undef, PHASE 0.0, TDATA_NUM_BYTES 3, TDEST_WIDTH 1, TID_WIDTH 1, TUSER_WIDTH 1" *) input [23:0]SLOT_3_AXIS_tdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 SLOT_3_AXIS TDEST" *) input [0:0]SLOT_3_AXIS_tdest;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 SLOT_3_AXIS TID" *) input [0:0]SLOT_3_AXIS_tid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 SLOT_3_AXIS TKEEP" *) input [2:0]SLOT_3_AXIS_tkeep;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 SLOT_3_AXIS TLAST" *) input SLOT_3_AXIS_tlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 SLOT_3_AXIS TREADY" *) input SLOT_3_AXIS_tready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 SLOT_3_AXIS TSTRB" *) input [2:0]SLOT_3_AXIS_tstrb;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 SLOT_3_AXIS TUSER" *) input [0:0]SLOT_3_AXIS_tuser;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 SLOT_3_AXIS TVALID" *) input SLOT_3_AXIS_tvalid;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.CLK CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.CLK, ASSOCIATED_BUSIF SLOT_0_AXIS:SLOT_1_AXI:SLOT_2_AXI:SLOT_3_AXIS, ASSOCIATED_RESET resetn, CLK_DOMAIN top_design_processing_system7_0_0_FCLK_CLK1, FREQ_HZ 148148163, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.0" *) input clk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.RESETN RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.RESETN, INSERT_VIP 0, POLARITY ACTIVE_LOW" *) input resetn;

  wire [23:0]SLOT_0_AXIS_tdata;
  wire [0:0]SLOT_0_AXIS_tdest;
  wire [0:0]SLOT_0_AXIS_tid;
  wire [2:0]SLOT_0_AXIS_tkeep;
  wire SLOT_0_AXIS_tlast;
  wire SLOT_0_AXIS_tready;
  wire [2:0]SLOT_0_AXIS_tstrb;
  wire [0:0]SLOT_0_AXIS_tuser;
  wire SLOT_0_AXIS_tvalid;
  wire [31:0]SLOT_1_AXI_araddr;
  wire [3:0]SLOT_1_AXI_arcache;
  wire [7:0]SLOT_1_AXI_arlen;
  wire [0:0]SLOT_1_AXI_arlock;
  wire [2:0]SLOT_1_AXI_arprot;
  wire [3:0]SLOT_1_AXI_arqos;
  wire SLOT_1_AXI_arready;
  wire [3:0]SLOT_1_AXI_arregion;
  wire [2:0]SLOT_1_AXI_arsize;
  wire SLOT_1_AXI_arvalid;
  wire [31:0]SLOT_1_AXI_awaddr;
  wire [3:0]SLOT_1_AXI_awcache;
  wire [7:0]SLOT_1_AXI_awlen;
  wire [0:0]SLOT_1_AXI_awlock;
  wire [2:0]SLOT_1_AXI_awprot;
  wire [3:0]SLOT_1_AXI_awqos;
  wire SLOT_1_AXI_awready;
  wire [3:0]SLOT_1_AXI_awregion;
  wire [2:0]SLOT_1_AXI_awsize;
  wire SLOT_1_AXI_awvalid;
  wire SLOT_1_AXI_bready;
  wire [1:0]SLOT_1_AXI_bresp;
  wire SLOT_1_AXI_bvalid;
  wire [63:0]SLOT_1_AXI_rdata;
  wire SLOT_1_AXI_rlast;
  wire SLOT_1_AXI_rready;
  wire [1:0]SLOT_1_AXI_rresp;
  wire SLOT_1_AXI_rvalid;
  wire [63:0]SLOT_1_AXI_wdata;
  wire SLOT_1_AXI_wlast;
  wire SLOT_1_AXI_wready;
  wire [7:0]SLOT_1_AXI_wstrb;
  wire SLOT_1_AXI_wvalid;
  wire [31:0]SLOT_2_AXI_araddr;
  wire [3:0]SLOT_2_AXI_arcache;
  wire [7:0]SLOT_2_AXI_arlen;
  wire [0:0]SLOT_2_AXI_arlock;
  wire [2:0]SLOT_2_AXI_arprot;
  wire [3:0]SLOT_2_AXI_arqos;
  wire SLOT_2_AXI_arready;
  wire [3:0]SLOT_2_AXI_arregion;
  wire [2:0]SLOT_2_AXI_arsize;
  wire SLOT_2_AXI_arvalid;
  wire [31:0]SLOT_2_AXI_awaddr;
  wire [3:0]SLOT_2_AXI_awcache;
  wire [7:0]SLOT_2_AXI_awlen;
  wire [0:0]SLOT_2_AXI_awlock;
  wire [2:0]SLOT_2_AXI_awprot;
  wire [3:0]SLOT_2_AXI_awqos;
  wire SLOT_2_AXI_awready;
  wire [3:0]SLOT_2_AXI_awregion;
  wire [2:0]SLOT_2_AXI_awsize;
  wire SLOT_2_AXI_awvalid;
  wire SLOT_2_AXI_bready;
  wire [1:0]SLOT_2_AXI_bresp;
  wire SLOT_2_AXI_bvalid;
  wire [63:0]SLOT_2_AXI_rdata;
  wire SLOT_2_AXI_rlast;
  wire SLOT_2_AXI_rready;
  wire [1:0]SLOT_2_AXI_rresp;
  wire SLOT_2_AXI_rvalid;
  wire [63:0]SLOT_2_AXI_wdata;
  wire SLOT_2_AXI_wlast;
  wire SLOT_2_AXI_wready;
  wire [7:0]SLOT_2_AXI_wstrb;
  wire SLOT_2_AXI_wvalid;
  wire [23:0]SLOT_3_AXIS_tdata;
  wire [0:0]SLOT_3_AXIS_tdest;
  wire [0:0]SLOT_3_AXIS_tid;
  wire [2:0]SLOT_3_AXIS_tkeep;
  wire SLOT_3_AXIS_tlast;
  wire SLOT_3_AXIS_tready;
  wire [2:0]SLOT_3_AXIS_tstrb;
  wire [0:0]SLOT_3_AXIS_tuser;
  wire SLOT_3_AXIS_tvalid;
  wire clk;
  wire [23:0]net_slot_0_axis_tdata;
  wire [0:0]net_slot_0_axis_tdest;
  wire [0:0]net_slot_0_axis_tid;
  wire [2:0]net_slot_0_axis_tkeep;
  wire net_slot_0_axis_tlast;
  wire net_slot_0_axis_tready;
  wire [2:0]net_slot_0_axis_tstrb;
  wire [0:0]net_slot_0_axis_tuser;
  wire net_slot_0_axis_tvalid;
  wire [1:0]net_slot_1_axi_ar_cnt;
  wire [1:0]net_slot_1_axi_ar_ctrl;
  wire [31:0]net_slot_1_axi_araddr;
  wire [3:0]net_slot_1_axi_arcache;
  wire [7:0]net_slot_1_axi_arlen;
  wire [0:0]net_slot_1_axi_arlock;
  wire [2:0]net_slot_1_axi_arprot;
  wire [3:0]net_slot_1_axi_arqos;
  wire net_slot_1_axi_arready;
  wire [3:0]net_slot_1_axi_arregion;
  wire [2:0]net_slot_1_axi_arsize;
  wire net_slot_1_axi_arvalid;
  wire [1:0]net_slot_1_axi_aw_cnt;
  wire [1:0]net_slot_1_axi_aw_ctrl;
  wire [31:0]net_slot_1_axi_awaddr;
  wire [3:0]net_slot_1_axi_awcache;
  wire [7:0]net_slot_1_axi_awlen;
  wire [0:0]net_slot_1_axi_awlock;
  wire [2:0]net_slot_1_axi_awprot;
  wire [3:0]net_slot_1_axi_awqos;
  wire net_slot_1_axi_awready;
  wire [3:0]net_slot_1_axi_awregion;
  wire [2:0]net_slot_1_axi_awsize;
  wire net_slot_1_axi_awvalid;
  wire [1:0]net_slot_1_axi_b_cnt;
  wire [1:0]net_slot_1_axi_b_ctrl;
  wire net_slot_1_axi_bready;
  wire [1:0]net_slot_1_axi_bresp;
  wire net_slot_1_axi_bvalid;
  wire [1:0]net_slot_1_axi_r_cnt;
  wire [2:0]net_slot_1_axi_r_ctrl;
  wire [63:0]net_slot_1_axi_rdata;
  wire net_slot_1_axi_rlast;
  wire net_slot_1_axi_rready;
  wire [1:0]net_slot_1_axi_rresp;
  wire net_slot_1_axi_rvalid;
  wire [2:0]net_slot_1_axi_w_ctrl;
  wire [63:0]net_slot_1_axi_wdata;
  wire net_slot_1_axi_wlast;
  wire net_slot_1_axi_wready;
  wire [7:0]net_slot_1_axi_wstrb;
  wire net_slot_1_axi_wvalid;
  wire [1:0]net_slot_2_axi_ar_cnt;
  wire [1:0]net_slot_2_axi_ar_ctrl;
  wire [31:0]net_slot_2_axi_araddr;
  wire [3:0]net_slot_2_axi_arcache;
  wire [7:0]net_slot_2_axi_arlen;
  wire [0:0]net_slot_2_axi_arlock;
  wire [2:0]net_slot_2_axi_arprot;
  wire [3:0]net_slot_2_axi_arqos;
  wire net_slot_2_axi_arready;
  wire [3:0]net_slot_2_axi_arregion;
  wire [2:0]net_slot_2_axi_arsize;
  wire net_slot_2_axi_arvalid;
  wire [1:0]net_slot_2_axi_aw_cnt;
  wire [1:0]net_slot_2_axi_aw_ctrl;
  wire [31:0]net_slot_2_axi_awaddr;
  wire [3:0]net_slot_2_axi_awcache;
  wire [7:0]net_slot_2_axi_awlen;
  wire [0:0]net_slot_2_axi_awlock;
  wire [2:0]net_slot_2_axi_awprot;
  wire [3:0]net_slot_2_axi_awqos;
  wire net_slot_2_axi_awready;
  wire [3:0]net_slot_2_axi_awregion;
  wire [2:0]net_slot_2_axi_awsize;
  wire net_slot_2_axi_awvalid;
  wire [1:0]net_slot_2_axi_b_cnt;
  wire [1:0]net_slot_2_axi_b_ctrl;
  wire net_slot_2_axi_bready;
  wire [1:0]net_slot_2_axi_bresp;
  wire net_slot_2_axi_bvalid;
  wire [1:0]net_slot_2_axi_r_cnt;
  wire [2:0]net_slot_2_axi_r_ctrl;
  wire [63:0]net_slot_2_axi_rdata;
  wire net_slot_2_axi_rlast;
  wire net_slot_2_axi_rready;
  wire [1:0]net_slot_2_axi_rresp;
  wire net_slot_2_axi_rvalid;
  wire [2:0]net_slot_2_axi_w_ctrl;
  wire [63:0]net_slot_2_axi_wdata;
  wire net_slot_2_axi_wlast;
  wire net_slot_2_axi_wready;
  wire [7:0]net_slot_2_axi_wstrb;
  wire net_slot_2_axi_wvalid;
  wire [23:0]net_slot_3_axis_tdata;
  wire [0:0]net_slot_3_axis_tdest;
  wire [0:0]net_slot_3_axis_tid;
  wire [2:0]net_slot_3_axis_tkeep;
  wire net_slot_3_axis_tlast;
  wire net_slot_3_axis_tready;
  wire [2:0]net_slot_3_axis_tstrb;
  wire [0:0]net_slot_3_axis_tuser;
  wire net_slot_3_axis_tvalid;
  wire resetn;

  bd_7ad6_g_inst_0 g_inst
       (.aclk(clk),
        .aresetn(resetn),
        .m_slot_0_axis_tdata(net_slot_0_axis_tdata),
        .m_slot_0_axis_tdest(net_slot_0_axis_tdest),
        .m_slot_0_axis_tid(net_slot_0_axis_tid),
        .m_slot_0_axis_tkeep(net_slot_0_axis_tkeep),
        .m_slot_0_axis_tlast(net_slot_0_axis_tlast),
        .m_slot_0_axis_tready(net_slot_0_axis_tready),
        .m_slot_0_axis_tstrb(net_slot_0_axis_tstrb),
        .m_slot_0_axis_tuser(net_slot_0_axis_tuser),
        .m_slot_0_axis_tvalid(net_slot_0_axis_tvalid),
        .m_slot_1_axi_ar_cnt(net_slot_1_axi_ar_cnt),
        .m_slot_1_axi_araddr(net_slot_1_axi_araddr),
        .m_slot_1_axi_arcache(net_slot_1_axi_arcache),
        .m_slot_1_axi_arlen(net_slot_1_axi_arlen),
        .m_slot_1_axi_arlock(net_slot_1_axi_arlock),
        .m_slot_1_axi_arprot(net_slot_1_axi_arprot),
        .m_slot_1_axi_arqos(net_slot_1_axi_arqos),
        .m_slot_1_axi_arready(net_slot_1_axi_arready),
        .m_slot_1_axi_arregion(net_slot_1_axi_arregion),
        .m_slot_1_axi_arsize(net_slot_1_axi_arsize),
        .m_slot_1_axi_arvalid(net_slot_1_axi_arvalid),
        .m_slot_1_axi_aw_cnt(net_slot_1_axi_aw_cnt),
        .m_slot_1_axi_awaddr(net_slot_1_axi_awaddr),
        .m_slot_1_axi_awcache(net_slot_1_axi_awcache),
        .m_slot_1_axi_awlen(net_slot_1_axi_awlen),
        .m_slot_1_axi_awlock(net_slot_1_axi_awlock),
        .m_slot_1_axi_awprot(net_slot_1_axi_awprot),
        .m_slot_1_axi_awqos(net_slot_1_axi_awqos),
        .m_slot_1_axi_awready(net_slot_1_axi_awready),
        .m_slot_1_axi_awregion(net_slot_1_axi_awregion),
        .m_slot_1_axi_awsize(net_slot_1_axi_awsize),
        .m_slot_1_axi_awvalid(net_slot_1_axi_awvalid),
        .m_slot_1_axi_b_cnt(net_slot_1_axi_b_cnt),
        .m_slot_1_axi_bready(net_slot_1_axi_bready),
        .m_slot_1_axi_bresp(net_slot_1_axi_bresp),
        .m_slot_1_axi_bvalid(net_slot_1_axi_bvalid),
        .m_slot_1_axi_r_cnt(net_slot_1_axi_r_cnt),
        .m_slot_1_axi_rdata(net_slot_1_axi_rdata),
        .m_slot_1_axi_rlast(net_slot_1_axi_rlast),
        .m_slot_1_axi_rready(net_slot_1_axi_rready),
        .m_slot_1_axi_rresp(net_slot_1_axi_rresp),
        .m_slot_1_axi_rvalid(net_slot_1_axi_rvalid),
        .m_slot_1_axi_wdata(net_slot_1_axi_wdata),
        .m_slot_1_axi_wlast(net_slot_1_axi_wlast),
        .m_slot_1_axi_wready(net_slot_1_axi_wready),
        .m_slot_1_axi_wstrb(net_slot_1_axi_wstrb),
        .m_slot_1_axi_wvalid(net_slot_1_axi_wvalid),
        .m_slot_2_axi_ar_cnt(net_slot_2_axi_ar_cnt),
        .m_slot_2_axi_araddr(net_slot_2_axi_araddr),
        .m_slot_2_axi_arcache(net_slot_2_axi_arcache),
        .m_slot_2_axi_arlen(net_slot_2_axi_arlen),
        .m_slot_2_axi_arlock(net_slot_2_axi_arlock),
        .m_slot_2_axi_arprot(net_slot_2_axi_arprot),
        .m_slot_2_axi_arqos(net_slot_2_axi_arqos),
        .m_slot_2_axi_arready(net_slot_2_axi_arready),
        .m_slot_2_axi_arregion(net_slot_2_axi_arregion),
        .m_slot_2_axi_arsize(net_slot_2_axi_arsize),
        .m_slot_2_axi_arvalid(net_slot_2_axi_arvalid),
        .m_slot_2_axi_aw_cnt(net_slot_2_axi_aw_cnt),
        .m_slot_2_axi_awaddr(net_slot_2_axi_awaddr),
        .m_slot_2_axi_awcache(net_slot_2_axi_awcache),
        .m_slot_2_axi_awlen(net_slot_2_axi_awlen),
        .m_slot_2_axi_awlock(net_slot_2_axi_awlock),
        .m_slot_2_axi_awprot(net_slot_2_axi_awprot),
        .m_slot_2_axi_awqos(net_slot_2_axi_awqos),
        .m_slot_2_axi_awready(net_slot_2_axi_awready),
        .m_slot_2_axi_awregion(net_slot_2_axi_awregion),
        .m_slot_2_axi_awsize(net_slot_2_axi_awsize),
        .m_slot_2_axi_awvalid(net_slot_2_axi_awvalid),
        .m_slot_2_axi_b_cnt(net_slot_2_axi_b_cnt),
        .m_slot_2_axi_bready(net_slot_2_axi_bready),
        .m_slot_2_axi_bresp(net_slot_2_axi_bresp),
        .m_slot_2_axi_bvalid(net_slot_2_axi_bvalid),
        .m_slot_2_axi_r_cnt(net_slot_2_axi_r_cnt),
        .m_slot_2_axi_rdata(net_slot_2_axi_rdata),
        .m_slot_2_axi_rlast(net_slot_2_axi_rlast),
        .m_slot_2_axi_rready(net_slot_2_axi_rready),
        .m_slot_2_axi_rresp(net_slot_2_axi_rresp),
        .m_slot_2_axi_rvalid(net_slot_2_axi_rvalid),
        .m_slot_2_axi_wdata(net_slot_2_axi_wdata),
        .m_slot_2_axi_wlast(net_slot_2_axi_wlast),
        .m_slot_2_axi_wready(net_slot_2_axi_wready),
        .m_slot_2_axi_wstrb(net_slot_2_axi_wstrb),
        .m_slot_2_axi_wvalid(net_slot_2_axi_wvalid),
        .m_slot_3_axis_tdata(net_slot_3_axis_tdata),
        .m_slot_3_axis_tdest(net_slot_3_axis_tdest),
        .m_slot_3_axis_tid(net_slot_3_axis_tid),
        .m_slot_3_axis_tkeep(net_slot_3_axis_tkeep),
        .m_slot_3_axis_tlast(net_slot_3_axis_tlast),
        .m_slot_3_axis_tready(net_slot_3_axis_tready),
        .m_slot_3_axis_tstrb(net_slot_3_axis_tstrb),
        .m_slot_3_axis_tuser(net_slot_3_axis_tuser),
        .m_slot_3_axis_tvalid(net_slot_3_axis_tvalid),
        .slot_0_axis_tdata(SLOT_0_AXIS_tdata),
        .slot_0_axis_tdest(SLOT_0_AXIS_tdest),
        .slot_0_axis_tid(SLOT_0_AXIS_tid),
        .slot_0_axis_tkeep(SLOT_0_AXIS_tkeep),
        .slot_0_axis_tlast(SLOT_0_AXIS_tlast),
        .slot_0_axis_tready(SLOT_0_AXIS_tready),
        .slot_0_axis_tstrb(SLOT_0_AXIS_tstrb),
        .slot_0_axis_tuser(SLOT_0_AXIS_tuser),
        .slot_0_axis_tvalid(SLOT_0_AXIS_tvalid),
        .slot_1_axi_araddr(SLOT_1_AXI_araddr),
        .slot_1_axi_arcache(SLOT_1_AXI_arcache),
        .slot_1_axi_arlen(SLOT_1_AXI_arlen),
        .slot_1_axi_arlock(SLOT_1_AXI_arlock),
        .slot_1_axi_arprot(SLOT_1_AXI_arprot),
        .slot_1_axi_arqos(SLOT_1_AXI_arqos),
        .slot_1_axi_arready(SLOT_1_AXI_arready),
        .slot_1_axi_arregion(SLOT_1_AXI_arregion),
        .slot_1_axi_arsize(SLOT_1_AXI_arsize),
        .slot_1_axi_arvalid(SLOT_1_AXI_arvalid),
        .slot_1_axi_awaddr(SLOT_1_AXI_awaddr),
        .slot_1_axi_awcache(SLOT_1_AXI_awcache),
        .slot_1_axi_awlen(SLOT_1_AXI_awlen),
        .slot_1_axi_awlock(SLOT_1_AXI_awlock),
        .slot_1_axi_awprot(SLOT_1_AXI_awprot),
        .slot_1_axi_awqos(SLOT_1_AXI_awqos),
        .slot_1_axi_awready(SLOT_1_AXI_awready),
        .slot_1_axi_awregion(SLOT_1_AXI_awregion),
        .slot_1_axi_awsize(SLOT_1_AXI_awsize),
        .slot_1_axi_awvalid(SLOT_1_AXI_awvalid),
        .slot_1_axi_bready(SLOT_1_AXI_bready),
        .slot_1_axi_bresp(SLOT_1_AXI_bresp),
        .slot_1_axi_bvalid(SLOT_1_AXI_bvalid),
        .slot_1_axi_rdata(SLOT_1_AXI_rdata),
        .slot_1_axi_rlast(SLOT_1_AXI_rlast),
        .slot_1_axi_rready(SLOT_1_AXI_rready),
        .slot_1_axi_rresp(SLOT_1_AXI_rresp),
        .slot_1_axi_rvalid(SLOT_1_AXI_rvalid),
        .slot_1_axi_wdata(SLOT_1_AXI_wdata),
        .slot_1_axi_wlast(SLOT_1_AXI_wlast),
        .slot_1_axi_wready(SLOT_1_AXI_wready),
        .slot_1_axi_wstrb(SLOT_1_AXI_wstrb),
        .slot_1_axi_wvalid(SLOT_1_AXI_wvalid),
        .slot_2_axi_araddr(SLOT_2_AXI_araddr),
        .slot_2_axi_arcache(SLOT_2_AXI_arcache),
        .slot_2_axi_arlen(SLOT_2_AXI_arlen),
        .slot_2_axi_arlock(SLOT_2_AXI_arlock),
        .slot_2_axi_arprot(SLOT_2_AXI_arprot),
        .slot_2_axi_arqos(SLOT_2_AXI_arqos),
        .slot_2_axi_arready(SLOT_2_AXI_arready),
        .slot_2_axi_arregion(SLOT_2_AXI_arregion),
        .slot_2_axi_arsize(SLOT_2_AXI_arsize),
        .slot_2_axi_arvalid(SLOT_2_AXI_arvalid),
        .slot_2_axi_awaddr(SLOT_2_AXI_awaddr),
        .slot_2_axi_awcache(SLOT_2_AXI_awcache),
        .slot_2_axi_awlen(SLOT_2_AXI_awlen),
        .slot_2_axi_awlock(SLOT_2_AXI_awlock),
        .slot_2_axi_awprot(SLOT_2_AXI_awprot),
        .slot_2_axi_awqos(SLOT_2_AXI_awqos),
        .slot_2_axi_awready(SLOT_2_AXI_awready),
        .slot_2_axi_awregion(SLOT_2_AXI_awregion),
        .slot_2_axi_awsize(SLOT_2_AXI_awsize),
        .slot_2_axi_awvalid(SLOT_2_AXI_awvalid),
        .slot_2_axi_bready(SLOT_2_AXI_bready),
        .slot_2_axi_bresp(SLOT_2_AXI_bresp),
        .slot_2_axi_bvalid(SLOT_2_AXI_bvalid),
        .slot_2_axi_rdata(SLOT_2_AXI_rdata),
        .slot_2_axi_rlast(SLOT_2_AXI_rlast),
        .slot_2_axi_rready(SLOT_2_AXI_rready),
        .slot_2_axi_rresp(SLOT_2_AXI_rresp),
        .slot_2_axi_rvalid(SLOT_2_AXI_rvalid),
        .slot_2_axi_wdata(SLOT_2_AXI_wdata),
        .slot_2_axi_wlast(SLOT_2_AXI_wlast),
        .slot_2_axi_wready(SLOT_2_AXI_wready),
        .slot_2_axi_wstrb(SLOT_2_AXI_wstrb),
        .slot_2_axi_wvalid(SLOT_2_AXI_wvalid),
        .slot_3_axis_tdata(SLOT_3_AXIS_tdata),
        .slot_3_axis_tdest(SLOT_3_AXIS_tdest),
        .slot_3_axis_tid(SLOT_3_AXIS_tid),
        .slot_3_axis_tkeep(SLOT_3_AXIS_tkeep),
        .slot_3_axis_tlast(SLOT_3_AXIS_tlast),
        .slot_3_axis_tready(SLOT_3_AXIS_tready),
        .slot_3_axis_tstrb(SLOT_3_AXIS_tstrb),
        .slot_3_axis_tuser(SLOT_3_AXIS_tuser),
        .slot_3_axis_tvalid(SLOT_3_AXIS_tvalid));
  bd_7ad6_ila_lib_0 ila_lib
       (.clk(clk),
        .probe0(net_slot_0_axis_tdata),
        .probe1(net_slot_0_axis_tdest),
        .probe10(net_slot_1_axi_araddr),
        .probe11(net_slot_1_axi_arcache),
        .probe12(net_slot_1_axi_arlen),
        .probe13(net_slot_1_axi_arlock),
        .probe14(net_slot_1_axi_arprot),
        .probe15(net_slot_1_axi_arqos),
        .probe16(net_slot_1_axi_arregion),
        .probe17(net_slot_1_axi_arsize),
        .probe18(net_slot_1_axi_aw_cnt),
        .probe19(net_slot_1_axi_awaddr),
        .probe2(net_slot_0_axis_tid),
        .probe20(net_slot_1_axi_awcache),
        .probe21(net_slot_1_axi_awlen),
        .probe22(net_slot_1_axi_awlock),
        .probe23(net_slot_1_axi_awprot),
        .probe24(net_slot_1_axi_awqos),
        .probe25(net_slot_1_axi_awregion),
        .probe26(net_slot_1_axi_awsize),
        .probe27(net_slot_1_axi_b_cnt),
        .probe28(net_slot_1_axi_bresp),
        .probe29(net_slot_1_axi_r_cnt),
        .probe3(net_slot_0_axis_tkeep),
        .probe30(net_slot_1_axi_rdata),
        .probe31(net_slot_1_axi_rresp),
        .probe32(net_slot_1_axi_wdata),
        .probe33(net_slot_1_axi_wstrb),
        .probe34(net_slot_1_axi_aw_ctrl),
        .probe35(net_slot_1_axi_w_ctrl),
        .probe36(net_slot_1_axi_b_ctrl),
        .probe37(net_slot_1_axi_ar_ctrl),
        .probe38(net_slot_1_axi_r_ctrl),
        .probe39(net_slot_2_axi_ar_cnt),
        .probe4(net_slot_0_axis_tstrb),
        .probe40(net_slot_2_axi_araddr),
        .probe41(net_slot_2_axi_arcache),
        .probe42(net_slot_2_axi_arlen),
        .probe43(net_slot_2_axi_arlock),
        .probe44(net_slot_2_axi_arprot),
        .probe45(net_slot_2_axi_arqos),
        .probe46(net_slot_2_axi_arregion),
        .probe47(net_slot_2_axi_arsize),
        .probe48(net_slot_2_axi_aw_cnt),
        .probe49(net_slot_2_axi_awaddr),
        .probe5(net_slot_0_axis_tuser),
        .probe50(net_slot_2_axi_awcache),
        .probe51(net_slot_2_axi_awlen),
        .probe52(net_slot_2_axi_awlock),
        .probe53(net_slot_2_axi_awprot),
        .probe54(net_slot_2_axi_awqos),
        .probe55(net_slot_2_axi_awregion),
        .probe56(net_slot_2_axi_awsize),
        .probe57(net_slot_2_axi_b_cnt),
        .probe58(net_slot_2_axi_bresp),
        .probe59(net_slot_2_axi_r_cnt),
        .probe6(net_slot_0_axis_tvalid),
        .probe60(net_slot_2_axi_rdata),
        .probe61(net_slot_2_axi_rresp),
        .probe62(net_slot_2_axi_wdata),
        .probe63(net_slot_2_axi_wstrb),
        .probe64(net_slot_2_axi_aw_ctrl),
        .probe65(net_slot_2_axi_w_ctrl),
        .probe66(net_slot_2_axi_b_ctrl),
        .probe67(net_slot_2_axi_ar_ctrl),
        .probe68(net_slot_2_axi_r_ctrl),
        .probe69(net_slot_3_axis_tdata),
        .probe7(net_slot_0_axis_tready),
        .probe70(net_slot_3_axis_tdest),
        .probe71(net_slot_3_axis_tid),
        .probe72(net_slot_3_axis_tkeep),
        .probe73(net_slot_3_axis_tstrb),
        .probe74(net_slot_3_axis_tuser),
        .probe75(net_slot_3_axis_tvalid),
        .probe76(net_slot_3_axis_tready),
        .probe77(net_slot_3_axis_tlast),
        .probe8(net_slot_0_axis_tlast),
        .probe9(net_slot_1_axi_ar_cnt));
  bd_7ad6_slot_1_ar_0 slot_1_ar
       (.In0(net_slot_1_axi_arvalid),
        .In1(net_slot_1_axi_arready),
        .dout(net_slot_1_axi_ar_ctrl));
  bd_7ad6_slot_1_aw_0 slot_1_aw
       (.In0(net_slot_1_axi_awvalid),
        .In1(net_slot_1_axi_awready),
        .dout(net_slot_1_axi_aw_ctrl));
  bd_7ad6_slot_1_b_0 slot_1_b
       (.In0(net_slot_1_axi_bvalid),
        .In1(net_slot_1_axi_bready),
        .dout(net_slot_1_axi_b_ctrl));
  bd_7ad6_slot_1_r_0 slot_1_r
       (.In0(net_slot_1_axi_rvalid),
        .In1(net_slot_1_axi_rready),
        .In2(net_slot_1_axi_rlast),
        .dout(net_slot_1_axi_r_ctrl));
  bd_7ad6_slot_1_w_0 slot_1_w
       (.In0(net_slot_1_axi_wvalid),
        .In1(net_slot_1_axi_wready),
        .In2(net_slot_1_axi_wlast),
        .dout(net_slot_1_axi_w_ctrl));
  bd_7ad6_slot_2_ar_0 slot_2_ar
       (.In0(net_slot_2_axi_arvalid),
        .In1(net_slot_2_axi_arready),
        .dout(net_slot_2_axi_ar_ctrl));
  bd_7ad6_slot_2_aw_0 slot_2_aw
       (.In0(net_slot_2_axi_awvalid),
        .In1(net_slot_2_axi_awready),
        .dout(net_slot_2_axi_aw_ctrl));
  bd_7ad6_slot_2_b_0 slot_2_b
       (.In0(net_slot_2_axi_bvalid),
        .In1(net_slot_2_axi_bready),
        .dout(net_slot_2_axi_b_ctrl));
  bd_7ad6_slot_2_r_0 slot_2_r
       (.In0(net_slot_2_axi_rvalid),
        .In1(net_slot_2_axi_rready),
        .In2(net_slot_2_axi_rlast),
        .dout(net_slot_2_axi_r_ctrl));
  bd_7ad6_slot_2_w_0 slot_2_w
       (.In0(net_slot_2_axi_wvalid),
        .In1(net_slot_2_axi_wready),
        .In2(net_slot_2_axi_wlast),
        .dout(net_slot_2_axi_w_ctrl));
endmodule
