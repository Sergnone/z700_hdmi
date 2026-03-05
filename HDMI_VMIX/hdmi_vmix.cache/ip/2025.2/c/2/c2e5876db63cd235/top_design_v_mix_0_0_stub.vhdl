-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2025.2 (lin64) Build 6299465 Fri Nov 14 12:34:56 MST 2025
-- Date        : Sat Feb 28 15:11:11 2026
-- Host        : serg running 64-bit Ubuntu 24.04.3 LTS
-- Command     : write_vhdl -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
--               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ top_design_v_mix_0_0_stub.vhdl
-- Design      : top_design_v_mix_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7z020clg400-2
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
  Port ( 
    s_axi_CTRL_AWADDR : in STD_LOGIC_VECTOR ( 12 downto 0 );
    s_axi_CTRL_AWVALID : in STD_LOGIC;
    s_axi_CTRL_AWREADY : out STD_LOGIC;
    s_axi_CTRL_WDATA : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_CTRL_WSTRB : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_CTRL_WVALID : in STD_LOGIC;
    s_axi_CTRL_WREADY : out STD_LOGIC;
    s_axi_CTRL_BRESP : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_CTRL_BVALID : out STD_LOGIC;
    s_axi_CTRL_BREADY : in STD_LOGIC;
    s_axi_CTRL_ARADDR : in STD_LOGIC_VECTOR ( 12 downto 0 );
    s_axi_CTRL_ARVALID : in STD_LOGIC;
    s_axi_CTRL_ARREADY : out STD_LOGIC;
    s_axi_CTRL_RDATA : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_CTRL_RRESP : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_CTRL_RVALID : out STD_LOGIC;
    s_axi_CTRL_RREADY : in STD_LOGIC;
    ap_clk : in STD_LOGIC;
    ap_rst_n : in STD_LOGIC;
    interrupt : out STD_LOGIC;
    s_axis_video_TVALID : in STD_LOGIC;
    s_axis_video_TREADY : out STD_LOGIC;
    s_axis_video_TDATA : in STD_LOGIC_VECTOR ( 23 downto 0 );
    s_axis_video_TKEEP : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axis_video_TSTRB : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axis_video_TUSER : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axis_video_TLAST : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axis_video_TID : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axis_video_TDEST : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axis_video1_TVALID : in STD_LOGIC;
    s_axis_video1_TREADY : out STD_LOGIC;
    s_axis_video1_TDATA : in STD_LOGIC_VECTOR ( 23 downto 0 );
    s_axis_video1_TKEEP : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axis_video1_TSTRB : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axis_video1_TUSER : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axis_video1_TLAST : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axis_video1_TID : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axis_video1_TDEST : in STD_LOGIC_VECTOR ( 0 to 0 );
    m_axis_video_TVALID : out STD_LOGIC;
    m_axis_video_TREADY : in STD_LOGIC;
    m_axis_video_TDATA : out STD_LOGIC_VECTOR ( 23 downto 0 );
    m_axis_video_TKEEP : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axis_video_TSTRB : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axis_video_TUSER : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axis_video_TLAST : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axis_video_TID : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axis_video_TDEST : out STD_LOGIC_VECTOR ( 0 to 0 )
  );

  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "top_design_v_mix_0_0,top_design_v_mix_0_0_v_mix,{}";
  attribute CORE_GENERATION_INFO : string;
  attribute CORE_GENERATION_INFO of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "top_design_v_mix_0_0,top_design_v_mix_0_0_v_mix,{x_ipProduct=Vivado 2025.2,x_ipVendor=xilinx.com,x_ipLibrary=ip,x_ipName=v_mix,x_ipVersion=6.0,x_ipCoreRevision=0,x_ipLanguage=VERILOG,x_ipSimLanguage=MIXED,C_S_AXI_CTRL_ADDR_WIDTH=13,C_S_AXI_CTRL_DATA_WIDTH=32,C_M_AXI_MM_VIDEO1_ID_WIDTH=1,C_M_AXI_MM_VIDEO1_ADDR_WIDTH=32,C_M_AXI_MM_VIDEO1_DATA_WIDTH=64,C_M_AXI_MM_VIDEO1_AWUSER_WIDTH=1,C_M_AXI_MM_VIDEO1_ARUSER_WIDTH=1,C_M_AXI_MM_VIDEO1_WUSER_WIDTH=1,C_M_AXI_MM_VIDEO1_RUSER_WIDTH=1,C_M_AXI_MM_VIDEO1_BUSER_WIDTH=1,C_M_AXI_MM_VIDEO1_USER_VALUE=0x00000000,C_M_AXI_MM_VIDEO1_PROT_VALUE=0x0,C_M_AXI_MM_VIDEO1_CACHE_VALUE=0x3,C_M_AXI_MM_VIDEO2_ID_WIDTH=1,C_M_AXI_MM_VIDEO2_ADDR_WIDTH=32,C_M_AXI_MM_VIDEO2_DATA_WIDTH=64,C_M_AXI_MM_VIDEO2_AWUSER_WIDTH=1,C_M_AXI_MM_VIDEO2_ARUSER_WIDTH=1,C_M_AXI_MM_VIDEO2_WUSER_WIDTH=1,C_M_AXI_MM_VIDEO2_RUSER_WIDTH=1,C_M_AXI_MM_VIDEO2_BUSER_WIDTH=1,C_M_AXI_MM_VIDEO2_USER_VALUE=0x00000000,C_M_AXI_MM_VIDEO2_PROT_VALUE=0x0,C_M_AXI_MM_VIDEO2_CACHE_VALUE=0x3,C_M_AXI_MM_VIDEO3_ID_WIDTH=1,C_M_AXI_MM_VIDEO3_ADDR_WIDTH=32,C_M_AXI_MM_VIDEO3_DATA_WIDTH=64,C_M_AXI_MM_VIDEO3_AWUSER_WIDTH=1,C_M_AXI_MM_VIDEO3_ARUSER_WIDTH=1,C_M_AXI_MM_VIDEO3_WUSER_WIDTH=1,C_M_AXI_MM_VIDEO3_RUSER_WIDTH=1,C_M_AXI_MM_VIDEO3_BUSER_WIDTH=1,C_M_AXI_MM_VIDEO3_USER_VALUE=0x00000000,C_M_AXI_MM_VIDEO3_PROT_VALUE=0x0,C_M_AXI_MM_VIDEO3_CACHE_VALUE=0x3,C_M_AXI_MM_VIDEO4_ID_WIDTH=1,C_M_AXI_MM_VIDEO4_ADDR_WIDTH=32,C_M_AXI_MM_VIDEO4_DATA_WIDTH=64,C_M_AXI_MM_VIDEO4_AWUSER_WIDTH=1,C_M_AXI_MM_VIDEO4_ARUSER_WIDTH=1,C_M_AXI_MM_VIDEO4_WUSER_WIDTH=1,C_M_AXI_MM_VIDEO4_RUSER_WIDTH=1,C_M_AXI_MM_VIDEO4_BUSER_WIDTH=1,C_M_AXI_MM_VIDEO4_USER_VALUE=0x00000000,C_M_AXI_MM_VIDEO4_PROT_VALUE=0x0,C_M_AXI_MM_VIDEO4_CACHE_VALUE=0x3,C_M_AXI_MM_VIDEO5_ID_WIDTH=1,C_M_AXI_MM_VIDEO5_ADDR_WIDTH=32,C_M_AXI_MM_VIDEO5_DATA_WIDTH=64,C_M_AXI_MM_VIDEO5_AWUSER_WIDTH=1,C_M_AXI_MM_VIDEO5_ARUSER_WIDTH=1,C_M_AXI_MM_VIDEO5_WUSER_WIDTH=1,C_M_AXI_MM_VIDEO5_RUSER_WIDTH=1,C_M_AXI_MM_VIDEO5_BUSER_WIDTH=1,C_M_AXI_MM_VIDEO5_USER_VALUE=0x00000000,C_M_AXI_MM_VIDEO5_PROT_VALUE=0x0,C_M_AXI_MM_VIDEO5_CACHE_VALUE=0x3,C_M_AXI_MM_VIDEO6_ID_WIDTH=1,C_M_AXI_MM_VIDEO6_ADDR_WIDTH=32,C_M_AXI_MM_VIDEO6_DATA_WIDTH=64,C_M_AXI_MM_VIDEO6_AWUSER_WIDTH=1,C_M_AXI_MM_VIDEO6_ARUSER_WIDTH=1,C_M_AXI_MM_VIDEO6_WUSER_WIDTH=1,C_M_AXI_MM_VIDEO6_RUSER_WIDTH=1,C_M_AXI_MM_VIDEO6_BUSER_WIDTH=1,C_M_AXI_MM_VIDEO6_USER_VALUE=0x00000000,C_M_AXI_MM_VIDEO6_PROT_VALUE=0x0,C_M_AXI_MM_VIDEO6_CACHE_VALUE=0x3,C_M_AXI_MM_VIDEO7_ID_WIDTH=1,C_M_AXI_MM_VIDEO7_ADDR_WIDTH=32,C_M_AXI_MM_VIDEO7_DATA_WIDTH=64,C_M_AXI_MM_VIDEO7_AWUSER_WIDTH=1,C_M_AXI_MM_VIDEO7_ARUSER_WIDTH=1,C_M_AXI_MM_VIDEO7_WUSER_WIDTH=1,C_M_AXI_MM_VIDEO7_RUSER_WIDTH=1,C_M_AXI_MM_VIDEO7_BUSER_WIDTH=1,C_M_AXI_MM_VIDEO7_USER_VALUE=0x00000000,C_M_AXI_MM_VIDEO7_PROT_VALUE=0x0,C_M_AXI_MM_VIDEO7_CACHE_VALUE=0x3,C_M_AXI_MM_VIDEO8_ID_WIDTH=1,C_M_AXI_MM_VIDEO8_ADDR_WIDTH=32,C_M_AXI_MM_VIDEO8_DATA_WIDTH=64,C_M_AXI_MM_VIDEO8_AWUSER_WIDTH=1,C_M_AXI_MM_VIDEO8_ARUSER_WIDTH=1,C_M_AXI_MM_VIDEO8_WUSER_WIDTH=1,C_M_AXI_MM_VIDEO8_RUSER_WIDTH=1,C_M_AXI_MM_VIDEO8_BUSER_WIDTH=1,C_M_AXI_MM_VIDEO8_USER_VALUE=0x00000000,C_M_AXI_MM_VIDEO8_PROT_VALUE=0x0,C_M_AXI_MM_VIDEO8_CACHE_VALUE=0x3,C_M_AXI_MM_VIDEO9_ID_WIDTH=1,C_M_AXI_MM_VIDEO9_ADDR_WIDTH=32,C_M_AXI_MM_VIDEO9_DATA_WIDTH=64,C_M_AXI_MM_VIDEO9_AWUSER_WIDTH=1,C_M_AXI_MM_VIDEO9_ARUSER_WIDTH=1,C_M_AXI_MM_VIDEO9_WUSER_WIDTH=1,C_M_AXI_MM_VIDEO9_RUSER_WIDTH=1,C_M_AXI_MM_VIDEO9_BUSER_WIDTH=1,C_M_AXI_MM_VIDEO9_USER_VALUE=0x00000000,C_M_AXI_MM_VIDEO9_PROT_VALUE=0x0,C_M_AXI_MM_VIDEO9_CACHE_VALUE=0x3,C_M_AXI_MM_VIDEO10_ID_WIDTH=1,C_M_AXI_MM_VIDEO10_ADDR_WIDTH=32,C_M_AXI_MM_VIDEO10_DATA_WIDTH=64,C_M_AXI_MM_VIDEO10_AWUSER_WIDTH=1,C_M_AXI_MM_VIDEO10_ARUSER_WIDTH=1,C_M_AXI_MM_VIDEO10_WUSER_WIDTH=1,C_M_AXI_MM_VIDEO10_RUSER_WIDTH=1,C_M_AXI_MM_VIDEO10_BUSER_WIDTH=1,C_M_AXI_MM_VIDEO10_USER_VALUE=0x00000000,C_M_AXI_MM_VIDEO10_PROT_VALUE=0x0,C_M_AXI_MM_VIDEO10_CACHE_VALUE=0x3,C_M_AXI_MM_VIDEO11_ID_WIDTH=1,C_M_AXI_MM_VIDEO11_ADDR_WIDTH=32,C_M_AXI_MM_VIDEO11_DATA_WIDTH=64,C_M_AXI_MM_VIDEO11_AWUSER_WIDTH=1,C_M_AXI_MM_VIDEO11_ARUSER_WIDTH=1,C_M_AXI_MM_VIDEO11_WUSER_WIDTH=1,C_M_AXI_MM_VIDEO11_RUSER_WIDTH=1,C_M_AXI_MM_VIDEO11_BUSER_WIDTH=1,C_M_AXI_MM_VIDEO11_USER_VALUE=0x00000000,C_M_AXI_MM_VIDEO11_PROT_VALUE=0x0,C_M_AXI_MM_VIDEO11_CACHE_VALUE=0x3,C_M_AXI_MM_VIDEO12_ID_WIDTH=1,C_M_AXI_MM_VIDEO12_ADDR_WIDTH=32,C_M_AXI_MM_VIDEO12_DATA_WIDTH=64,C_M_AXI_MM_VIDEO12_AWUSER_WIDTH=1,C_M_AXI_MM_VIDEO12_ARUSER_WIDTH=1,C_M_AXI_MM_VIDEO12_WUSER_WIDTH=1,C_M_AXI_MM_VIDEO12_RUSER_WIDTH=1,C_M_AXI_MM_VIDEO12_BUSER_WIDTH=1,C_M_AXI_MM_VIDEO12_USER_VALUE=0x00000000,C_M_AXI_MM_VIDEO12_PROT_VALUE=0x0,C_M_AXI_MM_VIDEO12_CACHE_VALUE=0x3,C_M_AXI_MM_VIDEO13_ID_WIDTH=1,C_M_AXI_MM_VIDEO13_ADDR_WIDTH=32,C_M_AXI_MM_VIDEO13_DATA_WIDTH=64,C_M_AXI_MM_VIDEO13_AWUSER_WIDTH=1,C_M_AXI_MM_VIDEO13_ARUSER_WIDTH=1,C_M_AXI_MM_VIDEO13_WUSER_WIDTH=1,C_M_AXI_MM_VIDEO13_RUSER_WIDTH=1,C_M_AXI_MM_VIDEO13_BUSER_WIDTH=1,C_M_AXI_MM_VIDEO13_USER_VALUE=0x00000000,C_M_AXI_MM_VIDEO13_PROT_VALUE=0x0,C_M_AXI_MM_VIDEO13_CACHE_VALUE=0x3,C_M_AXI_MM_VIDEO14_ID_WIDTH=1,C_M_AXI_MM_VIDEO14_ADDR_WIDTH=32,C_M_AXI_MM_VIDEO14_DATA_WIDTH=64,C_M_AXI_MM_VIDEO14_AWUSER_WIDTH=1,C_M_AXI_MM_VIDEO14_ARUSER_WIDTH=1,C_M_AXI_MM_VIDEO14_WUSER_WIDTH=1,C_M_AXI_MM_VIDEO14_RUSER_WIDTH=1,C_M_AXI_MM_VIDEO14_BUSER_WIDTH=1,C_M_AXI_MM_VIDEO14_USER_VALUE=0x00000000,C_M_AXI_MM_VIDEO14_PROT_VALUE=0x0,C_M_AXI_MM_VIDEO14_CACHE_VALUE=0x3,C_M_AXI_MM_VIDEO15_ID_WIDTH=1,C_M_AXI_MM_VIDEO15_ADDR_WIDTH=32,C_M_AXI_MM_VIDEO15_DATA_WIDTH=64,C_M_AXI_MM_VIDEO15_AWUSER_WIDTH=1,C_M_AXI_MM_VIDEO15_ARUSER_WIDTH=1,C_M_AXI_MM_VIDEO15_WUSER_WIDTH=1,C_M_AXI_MM_VIDEO15_RUSER_WIDTH=1,C_M_AXI_MM_VIDEO15_BUSER_WIDTH=1,C_M_AXI_MM_VIDEO15_USER_VALUE=0x00000000,C_M_AXI_MM_VIDEO15_PROT_VALUE=0x0,C_M_AXI_MM_VIDEO15_CACHE_VALUE=0x3,C_M_AXI_MM_VIDEO16_ID_WIDTH=1,C_M_AXI_MM_VIDEO16_ADDR_WIDTH=32,C_M_AXI_MM_VIDEO16_DATA_WIDTH=64,C_M_AXI_MM_VIDEO16_AWUSER_WIDTH=1,C_M_AXI_MM_VIDEO16_ARUSER_WIDTH=1,C_M_AXI_MM_VIDEO16_WUSER_WIDTH=1,C_M_AXI_MM_VIDEO16_RUSER_WIDTH=1,C_M_AXI_MM_VIDEO16_BUSER_WIDTH=1,C_M_AXI_MM_VIDEO16_USER_VALUE=0x00000000,C_M_AXI_MM_VIDEO16_PROT_VALUE=0x0,C_M_AXI_MM_VIDEO16_CACHE_VALUE=0x3}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "yes";
  attribute hls_module : string;
  attribute hls_module of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "yes";
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix;

architecture stub of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
  attribute syn_black_box : boolean;
  attribute black_box_pad_pin : string;
  attribute syn_black_box of stub : architecture is true;
  attribute black_box_pad_pin of stub : architecture is "s_axi_CTRL_AWADDR[12:0],s_axi_CTRL_AWVALID,s_axi_CTRL_AWREADY,s_axi_CTRL_WDATA[31:0],s_axi_CTRL_WSTRB[3:0],s_axi_CTRL_WVALID,s_axi_CTRL_WREADY,s_axi_CTRL_BRESP[1:0],s_axi_CTRL_BVALID,s_axi_CTRL_BREADY,s_axi_CTRL_ARADDR[12:0],s_axi_CTRL_ARVALID,s_axi_CTRL_ARREADY,s_axi_CTRL_RDATA[31:0],s_axi_CTRL_RRESP[1:0],s_axi_CTRL_RVALID,s_axi_CTRL_RREADY,ap_clk,ap_rst_n,interrupt,s_axis_video_TVALID,s_axis_video_TREADY,s_axis_video_TDATA[23:0],s_axis_video_TKEEP[2:0],s_axis_video_TSTRB[2:0],s_axis_video_TUSER[0:0],s_axis_video_TLAST[0:0],s_axis_video_TID[0:0],s_axis_video_TDEST[0:0],s_axis_video1_TVALID,s_axis_video1_TREADY,s_axis_video1_TDATA[23:0],s_axis_video1_TKEEP[2:0],s_axis_video1_TSTRB[2:0],s_axis_video1_TUSER[0:0],s_axis_video1_TLAST[0:0],s_axis_video1_TID[0:0],s_axis_video1_TDEST[0:0],m_axis_video_TVALID,m_axis_video_TREADY,m_axis_video_TDATA[23:0],m_axis_video_TKEEP[2:0],m_axis_video_TSTRB[2:0],m_axis_video_TUSER[0:0],m_axis_video_TLAST[0:0],m_axis_video_TID[0:0],m_axis_video_TDEST[0:0]";
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of s_axi_CTRL_AWADDR : signal is "xilinx.com:interface:aximm:1.0 s_axi_CTRL AWADDR";
  attribute X_INTERFACE_MODE : string;
  attribute X_INTERFACE_MODE of s_axi_CTRL_AWADDR : signal is "slave";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of s_axi_CTRL_AWADDR : signal is "XIL_INTERFACENAME s_axi_CTRL, DATA_WIDTH 32, PROTOCOL AXI4LITE, FREQ_HZ 150000000, ID_WIDTH 0, ADDR_WIDTH 13, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 0, HAS_LOCK 0, HAS_PROT 0, HAS_CACHE 0, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 0, NUM_READ_OUTSTANDING 8, NUM_WRITE_OUTSTANDING 8, MAX_BURST_LENGTH 1, PHASE 0.0, CLK_DOMAIN top_design_processing_system7_0_0_FCLK_CLK1, NUM_READ_THREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of s_axi_CTRL_AWVALID : signal is "xilinx.com:interface:aximm:1.0 s_axi_CTRL AWVALID";
  attribute X_INTERFACE_INFO of s_axi_CTRL_AWREADY : signal is "xilinx.com:interface:aximm:1.0 s_axi_CTRL AWREADY";
  attribute X_INTERFACE_INFO of s_axi_CTRL_WDATA : signal is "xilinx.com:interface:aximm:1.0 s_axi_CTRL WDATA";
  attribute X_INTERFACE_INFO of s_axi_CTRL_WSTRB : signal is "xilinx.com:interface:aximm:1.0 s_axi_CTRL WSTRB";
  attribute X_INTERFACE_INFO of s_axi_CTRL_WVALID : signal is "xilinx.com:interface:aximm:1.0 s_axi_CTRL WVALID";
  attribute X_INTERFACE_INFO of s_axi_CTRL_WREADY : signal is "xilinx.com:interface:aximm:1.0 s_axi_CTRL WREADY";
  attribute X_INTERFACE_INFO of s_axi_CTRL_BRESP : signal is "xilinx.com:interface:aximm:1.0 s_axi_CTRL BRESP";
  attribute X_INTERFACE_INFO of s_axi_CTRL_BVALID : signal is "xilinx.com:interface:aximm:1.0 s_axi_CTRL BVALID";
  attribute X_INTERFACE_INFO of s_axi_CTRL_BREADY : signal is "xilinx.com:interface:aximm:1.0 s_axi_CTRL BREADY";
  attribute X_INTERFACE_INFO of s_axi_CTRL_ARADDR : signal is "xilinx.com:interface:aximm:1.0 s_axi_CTRL ARADDR";
  attribute X_INTERFACE_INFO of s_axi_CTRL_ARVALID : signal is "xilinx.com:interface:aximm:1.0 s_axi_CTRL ARVALID";
  attribute X_INTERFACE_INFO of s_axi_CTRL_ARREADY : signal is "xilinx.com:interface:aximm:1.0 s_axi_CTRL ARREADY";
  attribute X_INTERFACE_INFO of s_axi_CTRL_RDATA : signal is "xilinx.com:interface:aximm:1.0 s_axi_CTRL RDATA";
  attribute X_INTERFACE_INFO of s_axi_CTRL_RRESP : signal is "xilinx.com:interface:aximm:1.0 s_axi_CTRL RRESP";
  attribute X_INTERFACE_INFO of s_axi_CTRL_RVALID : signal is "xilinx.com:interface:aximm:1.0 s_axi_CTRL RVALID";
  attribute X_INTERFACE_INFO of s_axi_CTRL_RREADY : signal is "xilinx.com:interface:aximm:1.0 s_axi_CTRL RREADY";
  attribute X_INTERFACE_INFO of ap_clk : signal is "xilinx.com:signal:clock:1.0 ap_clk CLK";
  attribute X_INTERFACE_MODE of ap_clk : signal is "slave";
  attribute X_INTERFACE_PARAMETER of ap_clk : signal is "XIL_INTERFACENAME ap_clk, ASSOCIATED_BUSIF s_axi_CTRL:m_axi_mm_video1:m_axi_mm_video2:m_axi_mm_video3:m_axi_mm_video4:m_axi_mm_video5:m_axi_mm_video6:m_axi_mm_video7:m_axi_mm_video8:m_axi_mm_video9:m_axi_mm_video10:m_axi_mm_video11:m_axi_mm_video12:m_axi_mm_video13:m_axi_mm_video14:m_axi_mm_video15:m_axi_mm_video16:s_axis_video:m_axis_video:s_axis_video1:s_axis_video2:s_axis_video3:s_axis_video4:s_axis_video5:s_axis_video6:s_axis_video7:s_axis_video8:s_axis_video9:s_axis_video10:s_axis_video11:s_axis_video12:s_axis_video13:s_axis_video14:s_axis_video15:s_axis_video16, ASSOCIATED_RESET ap_rst_n, FREQ_HZ 150000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN top_design_processing_system7_0_0_FCLK_CLK1, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of ap_rst_n : signal is "xilinx.com:signal:reset:1.0 ap_rst_n RST";
  attribute X_INTERFACE_MODE of ap_rst_n : signal is "slave";
  attribute X_INTERFACE_PARAMETER of ap_rst_n : signal is "XIL_INTERFACENAME ap_rst_n, POLARITY ACTIVE_LOW, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of interrupt : signal is "xilinx.com:signal:interrupt:1.0 interrupt INTERRUPT";
  attribute X_INTERFACE_MODE of interrupt : signal is "master";
  attribute X_INTERFACE_PARAMETER of interrupt : signal is "XIL_INTERFACENAME interrupt, SENSITIVITY LEVEL_HIGH, PortWidth 1";
  attribute X_INTERFACE_INFO of s_axis_video_TVALID : signal is "xilinx.com:interface:axis:1.0 s_axis_video TVALID";
  attribute X_INTERFACE_MODE of s_axis_video_TVALID : signal is "slave";
  attribute X_INTERFACE_PARAMETER of s_axis_video_TVALID : signal is "XIL_INTERFACENAME s_axis_video, TDATA_NUM_BYTES 3, TDEST_WIDTH 1, TID_WIDTH 1, TUSER_WIDTH 1, HAS_TREADY 1, HAS_TSTRB 1, HAS_TKEEP 1, HAS_TLAST 1, FREQ_HZ 150000000, PHASE 0.0, CLK_DOMAIN top_design_processing_system7_0_0_FCLK_CLK1, LAYERED_METADATA undef, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of s_axis_video_TREADY : signal is "xilinx.com:interface:axis:1.0 s_axis_video TREADY";
  attribute X_INTERFACE_INFO of s_axis_video_TDATA : signal is "xilinx.com:interface:axis:1.0 s_axis_video TDATA";
  attribute X_INTERFACE_INFO of s_axis_video_TKEEP : signal is "xilinx.com:interface:axis:1.0 s_axis_video TKEEP";
  attribute X_INTERFACE_INFO of s_axis_video_TSTRB : signal is "xilinx.com:interface:axis:1.0 s_axis_video TSTRB";
  attribute X_INTERFACE_INFO of s_axis_video_TUSER : signal is "xilinx.com:interface:axis:1.0 s_axis_video TUSER";
  attribute X_INTERFACE_INFO of s_axis_video_TLAST : signal is "xilinx.com:interface:axis:1.0 s_axis_video TLAST";
  attribute X_INTERFACE_INFO of s_axis_video_TID : signal is "xilinx.com:interface:axis:1.0 s_axis_video TID";
  attribute X_INTERFACE_INFO of s_axis_video_TDEST : signal is "xilinx.com:interface:axis:1.0 s_axis_video TDEST";
  attribute X_INTERFACE_INFO of s_axis_video1_TVALID : signal is "xilinx.com:interface:axis:1.0 s_axis_video1 TVALID";
  attribute X_INTERFACE_MODE of s_axis_video1_TVALID : signal is "slave";
  attribute X_INTERFACE_PARAMETER of s_axis_video1_TVALID : signal is "XIL_INTERFACENAME s_axis_video1, TDATA_NUM_BYTES 3, TDEST_WIDTH 1, TID_WIDTH 1, TUSER_WIDTH 1, HAS_TREADY 1, HAS_TSTRB 1, HAS_TKEEP 1, HAS_TLAST 1, FREQ_HZ 150000000, PHASE 0.0, CLK_DOMAIN top_design_processing_system7_0_0_FCLK_CLK1, LAYERED_METADATA undef, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of s_axis_video1_TREADY : signal is "xilinx.com:interface:axis:1.0 s_axis_video1 TREADY";
  attribute X_INTERFACE_INFO of s_axis_video1_TDATA : signal is "xilinx.com:interface:axis:1.0 s_axis_video1 TDATA";
  attribute X_INTERFACE_INFO of s_axis_video1_TKEEP : signal is "xilinx.com:interface:axis:1.0 s_axis_video1 TKEEP";
  attribute X_INTERFACE_INFO of s_axis_video1_TSTRB : signal is "xilinx.com:interface:axis:1.0 s_axis_video1 TSTRB";
  attribute X_INTERFACE_INFO of s_axis_video1_TUSER : signal is "xilinx.com:interface:axis:1.0 s_axis_video1 TUSER";
  attribute X_INTERFACE_INFO of s_axis_video1_TLAST : signal is "xilinx.com:interface:axis:1.0 s_axis_video1 TLAST";
  attribute X_INTERFACE_INFO of s_axis_video1_TID : signal is "xilinx.com:interface:axis:1.0 s_axis_video1 TID";
  attribute X_INTERFACE_INFO of s_axis_video1_TDEST : signal is "xilinx.com:interface:axis:1.0 s_axis_video1 TDEST";
  attribute X_INTERFACE_INFO of m_axis_video_TVALID : signal is "xilinx.com:interface:axis:1.0 m_axis_video TVALID";
  attribute X_INTERFACE_MODE of m_axis_video_TVALID : signal is "master";
  attribute X_INTERFACE_PARAMETER of m_axis_video_TVALID : signal is "XIL_INTERFACENAME m_axis_video, TDATA_NUM_BYTES 3, TDEST_WIDTH 1, TID_WIDTH 1, TUSER_WIDTH 1, HAS_TREADY 1, HAS_TSTRB 1, HAS_TKEEP 1, HAS_TLAST 1, FREQ_HZ 150000000, PHASE 0.0, CLK_DOMAIN top_design_processing_system7_0_0_FCLK_CLK1, LAYERED_METADATA undef, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of m_axis_video_TREADY : signal is "xilinx.com:interface:axis:1.0 m_axis_video TREADY";
  attribute X_INTERFACE_INFO of m_axis_video_TDATA : signal is "xilinx.com:interface:axis:1.0 m_axis_video TDATA";
  attribute X_INTERFACE_INFO of m_axis_video_TKEEP : signal is "xilinx.com:interface:axis:1.0 m_axis_video TKEEP";
  attribute X_INTERFACE_INFO of m_axis_video_TSTRB : signal is "xilinx.com:interface:axis:1.0 m_axis_video TSTRB";
  attribute X_INTERFACE_INFO of m_axis_video_TUSER : signal is "xilinx.com:interface:axis:1.0 m_axis_video TUSER";
  attribute X_INTERFACE_INFO of m_axis_video_TLAST : signal is "xilinx.com:interface:axis:1.0 m_axis_video TLAST";
  attribute X_INTERFACE_INFO of m_axis_video_TID : signal is "xilinx.com:interface:axis:1.0 m_axis_video TID";
  attribute X_INTERFACE_INFO of m_axis_video_TDEST : signal is "xilinx.com:interface:axis:1.0 m_axis_video TDEST";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of stub : architecture is "top_design_v_mix_0_0_v_mix,Vivado 2025.2";
begin
end;
