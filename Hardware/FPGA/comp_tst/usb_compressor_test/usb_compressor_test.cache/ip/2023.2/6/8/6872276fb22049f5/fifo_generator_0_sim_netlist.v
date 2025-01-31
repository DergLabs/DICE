// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
// Date        : Sat Jan 25 22:19:17 2025
// Host        : DESKTOP-U9NB2CD running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ fifo_generator_0_sim_netlist.v
// Design      : fifo_generator_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xcku3p-ffva676-2-i
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "fifo_generator_0,fifo_generator_v13_2_9,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "fifo_generator_v13_2_9,Vivado 2023.2" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
   (rst,
    wr_clk,
    rd_clk,
    din,
    wr_en,
    rd_en,
    dout,
    full,
    empty,
    valid,
    wr_rst_busy,
    rd_rst_busy);
  input rst;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 write_clk CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME write_clk, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, INSERT_VIP 0" *) input wr_clk;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 read_clk CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME read_clk, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, INSERT_VIP 0" *) input rd_clk;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE WR_DATA" *) input [15:0]din;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE WR_EN" *) input wr_en;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ RD_EN" *) input rd_en;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ RD_DATA" *) output [31:0]dout;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE FULL" *) output full;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ EMPTY" *) output empty;
  output valid;
  output wr_rst_busy;
  output rd_rst_busy;

  wire [15:0]din;
  wire [31:0]dout;
  wire empty;
  wire full;
  wire rd_clk;
  wire rd_en;
  wire rd_rst_busy;
  wire rst;
  wire valid;
  wire wr_clk;
  wire wr_en;
  wire wr_rst_busy;
  wire NLW_U0_almost_empty_UNCONNECTED;
  wire NLW_U0_almost_full_UNCONNECTED;
  wire NLW_U0_axi_ar_dbiterr_UNCONNECTED;
  wire NLW_U0_axi_ar_overflow_UNCONNECTED;
  wire NLW_U0_axi_ar_prog_empty_UNCONNECTED;
  wire NLW_U0_axi_ar_prog_full_UNCONNECTED;
  wire NLW_U0_axi_ar_sbiterr_UNCONNECTED;
  wire NLW_U0_axi_ar_underflow_UNCONNECTED;
  wire NLW_U0_axi_aw_dbiterr_UNCONNECTED;
  wire NLW_U0_axi_aw_overflow_UNCONNECTED;
  wire NLW_U0_axi_aw_prog_empty_UNCONNECTED;
  wire NLW_U0_axi_aw_prog_full_UNCONNECTED;
  wire NLW_U0_axi_aw_sbiterr_UNCONNECTED;
  wire NLW_U0_axi_aw_underflow_UNCONNECTED;
  wire NLW_U0_axi_b_dbiterr_UNCONNECTED;
  wire NLW_U0_axi_b_overflow_UNCONNECTED;
  wire NLW_U0_axi_b_prog_empty_UNCONNECTED;
  wire NLW_U0_axi_b_prog_full_UNCONNECTED;
  wire NLW_U0_axi_b_sbiterr_UNCONNECTED;
  wire NLW_U0_axi_b_underflow_UNCONNECTED;
  wire NLW_U0_axi_r_dbiterr_UNCONNECTED;
  wire NLW_U0_axi_r_overflow_UNCONNECTED;
  wire NLW_U0_axi_r_prog_empty_UNCONNECTED;
  wire NLW_U0_axi_r_prog_full_UNCONNECTED;
  wire NLW_U0_axi_r_sbiterr_UNCONNECTED;
  wire NLW_U0_axi_r_underflow_UNCONNECTED;
  wire NLW_U0_axi_w_dbiterr_UNCONNECTED;
  wire NLW_U0_axi_w_overflow_UNCONNECTED;
  wire NLW_U0_axi_w_prog_empty_UNCONNECTED;
  wire NLW_U0_axi_w_prog_full_UNCONNECTED;
  wire NLW_U0_axi_w_sbiterr_UNCONNECTED;
  wire NLW_U0_axi_w_underflow_UNCONNECTED;
  wire NLW_U0_axis_dbiterr_UNCONNECTED;
  wire NLW_U0_axis_overflow_UNCONNECTED;
  wire NLW_U0_axis_prog_empty_UNCONNECTED;
  wire NLW_U0_axis_prog_full_UNCONNECTED;
  wire NLW_U0_axis_sbiterr_UNCONNECTED;
  wire NLW_U0_axis_underflow_UNCONNECTED;
  wire NLW_U0_dbiterr_UNCONNECTED;
  wire NLW_U0_m_axi_arvalid_UNCONNECTED;
  wire NLW_U0_m_axi_awvalid_UNCONNECTED;
  wire NLW_U0_m_axi_bready_UNCONNECTED;
  wire NLW_U0_m_axi_rready_UNCONNECTED;
  wire NLW_U0_m_axi_wlast_UNCONNECTED;
  wire NLW_U0_m_axi_wvalid_UNCONNECTED;
  wire NLW_U0_m_axis_tlast_UNCONNECTED;
  wire NLW_U0_m_axis_tvalid_UNCONNECTED;
  wire NLW_U0_overflow_UNCONNECTED;
  wire NLW_U0_prog_empty_UNCONNECTED;
  wire NLW_U0_prog_full_UNCONNECTED;
  wire NLW_U0_s_axi_arready_UNCONNECTED;
  wire NLW_U0_s_axi_awready_UNCONNECTED;
  wire NLW_U0_s_axi_bvalid_UNCONNECTED;
  wire NLW_U0_s_axi_rlast_UNCONNECTED;
  wire NLW_U0_s_axi_rvalid_UNCONNECTED;
  wire NLW_U0_s_axi_wready_UNCONNECTED;
  wire NLW_U0_s_axis_tready_UNCONNECTED;
  wire NLW_U0_sbiterr_UNCONNECTED;
  wire NLW_U0_underflow_UNCONNECTED;
  wire NLW_U0_wr_ack_UNCONNECTED;
  wire [4:0]NLW_U0_axi_ar_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_ar_rd_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_ar_wr_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_aw_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_aw_rd_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_aw_wr_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_b_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_b_rd_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_b_wr_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_r_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_r_rd_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_r_wr_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_w_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_w_rd_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_w_wr_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axis_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axis_rd_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axis_wr_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_data_count_UNCONNECTED;
  wire [31:0]NLW_U0_m_axi_araddr_UNCONNECTED;
  wire [1:0]NLW_U0_m_axi_arburst_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_arcache_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_arid_UNCONNECTED;
  wire [7:0]NLW_U0_m_axi_arlen_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_arlock_UNCONNECTED;
  wire [2:0]NLW_U0_m_axi_arprot_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_arqos_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_arregion_UNCONNECTED;
  wire [2:0]NLW_U0_m_axi_arsize_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_aruser_UNCONNECTED;
  wire [31:0]NLW_U0_m_axi_awaddr_UNCONNECTED;
  wire [1:0]NLW_U0_m_axi_awburst_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_awcache_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_awid_UNCONNECTED;
  wire [7:0]NLW_U0_m_axi_awlen_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_awlock_UNCONNECTED;
  wire [2:0]NLW_U0_m_axi_awprot_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_awqos_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_awregion_UNCONNECTED;
  wire [2:0]NLW_U0_m_axi_awsize_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_awuser_UNCONNECTED;
  wire [63:0]NLW_U0_m_axi_wdata_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_wid_UNCONNECTED;
  wire [7:0]NLW_U0_m_axi_wstrb_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_wuser_UNCONNECTED;
  wire [7:0]NLW_U0_m_axis_tdata_UNCONNECTED;
  wire [0:0]NLW_U0_m_axis_tdest_UNCONNECTED;
  wire [0:0]NLW_U0_m_axis_tid_UNCONNECTED;
  wire [0:0]NLW_U0_m_axis_tkeep_UNCONNECTED;
  wire [0:0]NLW_U0_m_axis_tstrb_UNCONNECTED;
  wire [3:0]NLW_U0_m_axis_tuser_UNCONNECTED;
  wire [3:0]NLW_U0_rd_data_count_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_buser_UNCONNECTED;
  wire [63:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_ruser_UNCONNECTED;
  wire [4:0]NLW_U0_wr_data_count_UNCONNECTED;

  (* C_ADD_NGC_CONSTRAINT = "0" *) 
  (* C_APPLICATION_TYPE_AXIS = "0" *) 
  (* C_APPLICATION_TYPE_RACH = "0" *) 
  (* C_APPLICATION_TYPE_RDCH = "0" *) 
  (* C_APPLICATION_TYPE_WACH = "0" *) 
  (* C_APPLICATION_TYPE_WDCH = "0" *) 
  (* C_APPLICATION_TYPE_WRCH = "0" *) 
  (* C_AXIS_TDATA_WIDTH = "8" *) 
  (* C_AXIS_TDEST_WIDTH = "1" *) 
  (* C_AXIS_TID_WIDTH = "1" *) 
  (* C_AXIS_TKEEP_WIDTH = "1" *) 
  (* C_AXIS_TSTRB_WIDTH = "1" *) 
  (* C_AXIS_TUSER_WIDTH = "4" *) 
  (* C_AXIS_TYPE = "0" *) 
  (* C_AXI_ADDR_WIDTH = "32" *) 
  (* C_AXI_ARUSER_WIDTH = "1" *) 
  (* C_AXI_AWUSER_WIDTH = "1" *) 
  (* C_AXI_BUSER_WIDTH = "1" *) 
  (* C_AXI_DATA_WIDTH = "64" *) 
  (* C_AXI_ID_WIDTH = "1" *) 
  (* C_AXI_LEN_WIDTH = "8" *) 
  (* C_AXI_LOCK_WIDTH = "1" *) 
  (* C_AXI_RUSER_WIDTH = "1" *) 
  (* C_AXI_TYPE = "1" *) 
  (* C_AXI_WUSER_WIDTH = "1" *) 
  (* C_COMMON_CLOCK = "0" *) 
  (* C_COUNT_TYPE = "0" *) 
  (* C_DATA_COUNT_WIDTH = "5" *) 
  (* C_DEFAULT_VALUE = "BlankString" *) 
  (* C_DIN_WIDTH = "16" *) 
  (* C_DIN_WIDTH_AXIS = "1" *) 
  (* C_DIN_WIDTH_RACH = "32" *) 
  (* C_DIN_WIDTH_RDCH = "64" *) 
  (* C_DIN_WIDTH_WACH = "1" *) 
  (* C_DIN_WIDTH_WDCH = "64" *) 
  (* C_DIN_WIDTH_WRCH = "2" *) 
  (* C_DOUT_RST_VAL = "0" *) 
  (* C_DOUT_WIDTH = "32" *) 
  (* C_ENABLE_RLOCS = "0" *) 
  (* C_ENABLE_RST_SYNC = "1" *) 
  (* C_EN_SAFETY_CKT = "1" *) 
  (* C_ERROR_INJECTION_TYPE = "0" *) 
  (* C_ERROR_INJECTION_TYPE_AXIS = "0" *) 
  (* C_ERROR_INJECTION_TYPE_RACH = "0" *) 
  (* C_ERROR_INJECTION_TYPE_RDCH = "0" *) 
  (* C_ERROR_INJECTION_TYPE_WACH = "0" *) 
  (* C_ERROR_INJECTION_TYPE_WDCH = "0" *) 
  (* C_ERROR_INJECTION_TYPE_WRCH = "0" *) 
  (* C_FAMILY = "kintexuplus" *) 
  (* C_FULL_FLAGS_RST_VAL = "0" *) 
  (* C_HAS_ALMOST_EMPTY = "0" *) 
  (* C_HAS_ALMOST_FULL = "0" *) 
  (* C_HAS_AXIS_TDATA = "1" *) 
  (* C_HAS_AXIS_TDEST = "0" *) 
  (* C_HAS_AXIS_TID = "0" *) 
  (* C_HAS_AXIS_TKEEP = "0" *) 
  (* C_HAS_AXIS_TLAST = "0" *) 
  (* C_HAS_AXIS_TREADY = "1" *) 
  (* C_HAS_AXIS_TSTRB = "0" *) 
  (* C_HAS_AXIS_TUSER = "1" *) 
  (* C_HAS_AXI_ARUSER = "0" *) 
  (* C_HAS_AXI_AWUSER = "0" *) 
  (* C_HAS_AXI_BUSER = "0" *) 
  (* C_HAS_AXI_ID = "0" *) 
  (* C_HAS_AXI_RD_CHANNEL = "1" *) 
  (* C_HAS_AXI_RUSER = "0" *) 
  (* C_HAS_AXI_WR_CHANNEL = "1" *) 
  (* C_HAS_AXI_WUSER = "0" *) 
  (* C_HAS_BACKUP = "0" *) 
  (* C_HAS_DATA_COUNT = "0" *) 
  (* C_HAS_DATA_COUNTS_AXIS = "0" *) 
  (* C_HAS_DATA_COUNTS_RACH = "0" *) 
  (* C_HAS_DATA_COUNTS_RDCH = "0" *) 
  (* C_HAS_DATA_COUNTS_WACH = "0" *) 
  (* C_HAS_DATA_COUNTS_WDCH = "0" *) 
  (* C_HAS_DATA_COUNTS_WRCH = "0" *) 
  (* C_HAS_INT_CLK = "0" *) 
  (* C_HAS_MASTER_CE = "0" *) 
  (* C_HAS_MEMINIT_FILE = "0" *) 
  (* C_HAS_OVERFLOW = "0" *) 
  (* C_HAS_PROG_FLAGS_AXIS = "0" *) 
  (* C_HAS_PROG_FLAGS_RACH = "0" *) 
  (* C_HAS_PROG_FLAGS_RDCH = "0" *) 
  (* C_HAS_PROG_FLAGS_WACH = "0" *) 
  (* C_HAS_PROG_FLAGS_WDCH = "0" *) 
  (* C_HAS_PROG_FLAGS_WRCH = "0" *) 
  (* C_HAS_RD_DATA_COUNT = "0" *) 
  (* C_HAS_RD_RST = "0" *) 
  (* C_HAS_RST = "1" *) 
  (* C_HAS_SLAVE_CE = "0" *) 
  (* C_HAS_SRST = "0" *) 
  (* C_HAS_UNDERFLOW = "0" *) 
  (* C_HAS_VALID = "1" *) 
  (* C_HAS_WR_ACK = "0" *) 
  (* C_HAS_WR_DATA_COUNT = "0" *) 
  (* C_HAS_WR_RST = "0" *) 
  (* C_IMPLEMENTATION_TYPE = "2" *) 
  (* C_IMPLEMENTATION_TYPE_AXIS = "1" *) 
  (* C_IMPLEMENTATION_TYPE_RACH = "1" *) 
  (* C_IMPLEMENTATION_TYPE_RDCH = "1" *) 
  (* C_IMPLEMENTATION_TYPE_WACH = "1" *) 
  (* C_IMPLEMENTATION_TYPE_WDCH = "1" *) 
  (* C_IMPLEMENTATION_TYPE_WRCH = "1" *) 
  (* C_INIT_WR_PNTR_VAL = "0" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_MEMORY_TYPE = "1" *) 
  (* C_MIF_FILE_NAME = "BlankString" *) 
  (* C_MSGON_VAL = "1" *) 
  (* C_OPTIMIZATION_MODE = "0" *) 
  (* C_OVERFLOW_LOW = "0" *) 
  (* C_POWER_SAVING_MODE = "0" *) 
  (* C_PRELOAD_LATENCY = "2" *) 
  (* C_PRELOAD_REGS = "1" *) 
  (* C_PRIM_FIFO_TYPE = "512x36" *) 
  (* C_PRIM_FIFO_TYPE_AXIS = "1kx18" *) 
  (* C_PRIM_FIFO_TYPE_RACH = "512x36" *) 
  (* C_PRIM_FIFO_TYPE_RDCH = "512x72" *) 
  (* C_PRIM_FIFO_TYPE_WACH = "512x36" *) 
  (* C_PRIM_FIFO_TYPE_WDCH = "512x72" *) 
  (* C_PRIM_FIFO_TYPE_WRCH = "512x36" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL = "2" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_AXIS = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_RACH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_RDCH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_WACH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_WDCH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_WRCH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_NEGATE_VAL = "3" *) 
  (* C_PROG_EMPTY_TYPE = "0" *) 
  (* C_PROG_EMPTY_TYPE_AXIS = "0" *) 
  (* C_PROG_EMPTY_TYPE_RACH = "0" *) 
  (* C_PROG_EMPTY_TYPE_RDCH = "0" *) 
  (* C_PROG_EMPTY_TYPE_WACH = "0" *) 
  (* C_PROG_EMPTY_TYPE_WDCH = "0" *) 
  (* C_PROG_EMPTY_TYPE_WRCH = "0" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL = "29" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_AXIS = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_RACH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_RDCH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WACH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WDCH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WRCH = "1023" *) 
  (* C_PROG_FULL_THRESH_NEGATE_VAL = "28" *) 
  (* C_PROG_FULL_TYPE = "0" *) 
  (* C_PROG_FULL_TYPE_AXIS = "0" *) 
  (* C_PROG_FULL_TYPE_RACH = "0" *) 
  (* C_PROG_FULL_TYPE_RDCH = "0" *) 
  (* C_PROG_FULL_TYPE_WACH = "0" *) 
  (* C_PROG_FULL_TYPE_WDCH = "0" *) 
  (* C_PROG_FULL_TYPE_WRCH = "0" *) 
  (* C_RACH_TYPE = "0" *) 
  (* C_RDCH_TYPE = "0" *) 
  (* C_RD_DATA_COUNT_WIDTH = "4" *) 
  (* C_RD_DEPTH = "16" *) 
  (* C_RD_FREQ = "1" *) 
  (* C_RD_PNTR_WIDTH = "4" *) 
  (* C_REG_SLICE_MODE_AXIS = "0" *) 
  (* C_REG_SLICE_MODE_RACH = "0" *) 
  (* C_REG_SLICE_MODE_RDCH = "0" *) 
  (* C_REG_SLICE_MODE_WACH = "0" *) 
  (* C_REG_SLICE_MODE_WDCH = "0" *) 
  (* C_REG_SLICE_MODE_WRCH = "0" *) 
  (* C_SELECT_XPM = "0" *) 
  (* C_SYNCHRONIZER_STAGE = "2" *) 
  (* C_UNDERFLOW_LOW = "0" *) 
  (* C_USE_COMMON_OVERFLOW = "0" *) 
  (* C_USE_COMMON_UNDERFLOW = "0" *) 
  (* C_USE_DEFAULT_SETTINGS = "0" *) 
  (* C_USE_DOUT_RST = "1" *) 
  (* C_USE_ECC = "0" *) 
  (* C_USE_ECC_AXIS = "0" *) 
  (* C_USE_ECC_RACH = "0" *) 
  (* C_USE_ECC_RDCH = "0" *) 
  (* C_USE_ECC_WACH = "0" *) 
  (* C_USE_ECC_WDCH = "0" *) 
  (* C_USE_ECC_WRCH = "0" *) 
  (* C_USE_EMBEDDED_REG = "1" *) 
  (* C_USE_FIFO16_FLAGS = "0" *) 
  (* C_USE_FWFT_DATA_COUNT = "0" *) 
  (* C_USE_PIPELINE_REG = "0" *) 
  (* C_VALID_LOW = "0" *) 
  (* C_WACH_TYPE = "0" *) 
  (* C_WDCH_TYPE = "0" *) 
  (* C_WRCH_TYPE = "0" *) 
  (* C_WR_ACK_LOW = "0" *) 
  (* C_WR_DATA_COUNT_WIDTH = "5" *) 
  (* C_WR_DEPTH = "32" *) 
  (* C_WR_DEPTH_AXIS = "1024" *) 
  (* C_WR_DEPTH_RACH = "16" *) 
  (* C_WR_DEPTH_RDCH = "1024" *) 
  (* C_WR_DEPTH_WACH = "16" *) 
  (* C_WR_DEPTH_WDCH = "1024" *) 
  (* C_WR_DEPTH_WRCH = "16" *) 
  (* C_WR_FREQ = "1" *) 
  (* C_WR_PNTR_WIDTH = "5" *) 
  (* C_WR_PNTR_WIDTH_AXIS = "10" *) 
  (* C_WR_PNTR_WIDTH_RACH = "4" *) 
  (* C_WR_PNTR_WIDTH_RDCH = "10" *) 
  (* C_WR_PNTR_WIDTH_WACH = "4" *) 
  (* C_WR_PNTR_WIDTH_WDCH = "10" *) 
  (* C_WR_PNTR_WIDTH_WRCH = "4" *) 
  (* C_WR_RESPONSE_LATENCY = "1" *) 
  (* is_du_within_envelope = "true" *) 
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_fifo_generator_v13_2_9 U0
       (.almost_empty(NLW_U0_almost_empty_UNCONNECTED),
        .almost_full(NLW_U0_almost_full_UNCONNECTED),
        .axi_ar_data_count(NLW_U0_axi_ar_data_count_UNCONNECTED[4:0]),
        .axi_ar_dbiterr(NLW_U0_axi_ar_dbiterr_UNCONNECTED),
        .axi_ar_injectdbiterr(1'b0),
        .axi_ar_injectsbiterr(1'b0),
        .axi_ar_overflow(NLW_U0_axi_ar_overflow_UNCONNECTED),
        .axi_ar_prog_empty(NLW_U0_axi_ar_prog_empty_UNCONNECTED),
        .axi_ar_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_ar_prog_full(NLW_U0_axi_ar_prog_full_UNCONNECTED),
        .axi_ar_prog_full_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_ar_rd_data_count(NLW_U0_axi_ar_rd_data_count_UNCONNECTED[4:0]),
        .axi_ar_sbiterr(NLW_U0_axi_ar_sbiterr_UNCONNECTED),
        .axi_ar_underflow(NLW_U0_axi_ar_underflow_UNCONNECTED),
        .axi_ar_wr_data_count(NLW_U0_axi_ar_wr_data_count_UNCONNECTED[4:0]),
        .axi_aw_data_count(NLW_U0_axi_aw_data_count_UNCONNECTED[4:0]),
        .axi_aw_dbiterr(NLW_U0_axi_aw_dbiterr_UNCONNECTED),
        .axi_aw_injectdbiterr(1'b0),
        .axi_aw_injectsbiterr(1'b0),
        .axi_aw_overflow(NLW_U0_axi_aw_overflow_UNCONNECTED),
        .axi_aw_prog_empty(NLW_U0_axi_aw_prog_empty_UNCONNECTED),
        .axi_aw_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_aw_prog_full(NLW_U0_axi_aw_prog_full_UNCONNECTED),
        .axi_aw_prog_full_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_aw_rd_data_count(NLW_U0_axi_aw_rd_data_count_UNCONNECTED[4:0]),
        .axi_aw_sbiterr(NLW_U0_axi_aw_sbiterr_UNCONNECTED),
        .axi_aw_underflow(NLW_U0_axi_aw_underflow_UNCONNECTED),
        .axi_aw_wr_data_count(NLW_U0_axi_aw_wr_data_count_UNCONNECTED[4:0]),
        .axi_b_data_count(NLW_U0_axi_b_data_count_UNCONNECTED[4:0]),
        .axi_b_dbiterr(NLW_U0_axi_b_dbiterr_UNCONNECTED),
        .axi_b_injectdbiterr(1'b0),
        .axi_b_injectsbiterr(1'b0),
        .axi_b_overflow(NLW_U0_axi_b_overflow_UNCONNECTED),
        .axi_b_prog_empty(NLW_U0_axi_b_prog_empty_UNCONNECTED),
        .axi_b_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_b_prog_full(NLW_U0_axi_b_prog_full_UNCONNECTED),
        .axi_b_prog_full_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_b_rd_data_count(NLW_U0_axi_b_rd_data_count_UNCONNECTED[4:0]),
        .axi_b_sbiterr(NLW_U0_axi_b_sbiterr_UNCONNECTED),
        .axi_b_underflow(NLW_U0_axi_b_underflow_UNCONNECTED),
        .axi_b_wr_data_count(NLW_U0_axi_b_wr_data_count_UNCONNECTED[4:0]),
        .axi_r_data_count(NLW_U0_axi_r_data_count_UNCONNECTED[10:0]),
        .axi_r_dbiterr(NLW_U0_axi_r_dbiterr_UNCONNECTED),
        .axi_r_injectdbiterr(1'b0),
        .axi_r_injectsbiterr(1'b0),
        .axi_r_overflow(NLW_U0_axi_r_overflow_UNCONNECTED),
        .axi_r_prog_empty(NLW_U0_axi_r_prog_empty_UNCONNECTED),
        .axi_r_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axi_r_prog_full(NLW_U0_axi_r_prog_full_UNCONNECTED),
        .axi_r_prog_full_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axi_r_rd_data_count(NLW_U0_axi_r_rd_data_count_UNCONNECTED[10:0]),
        .axi_r_sbiterr(NLW_U0_axi_r_sbiterr_UNCONNECTED),
        .axi_r_underflow(NLW_U0_axi_r_underflow_UNCONNECTED),
        .axi_r_wr_data_count(NLW_U0_axi_r_wr_data_count_UNCONNECTED[10:0]),
        .axi_w_data_count(NLW_U0_axi_w_data_count_UNCONNECTED[10:0]),
        .axi_w_dbiterr(NLW_U0_axi_w_dbiterr_UNCONNECTED),
        .axi_w_injectdbiterr(1'b0),
        .axi_w_injectsbiterr(1'b0),
        .axi_w_overflow(NLW_U0_axi_w_overflow_UNCONNECTED),
        .axi_w_prog_empty(NLW_U0_axi_w_prog_empty_UNCONNECTED),
        .axi_w_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axi_w_prog_full(NLW_U0_axi_w_prog_full_UNCONNECTED),
        .axi_w_prog_full_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axi_w_rd_data_count(NLW_U0_axi_w_rd_data_count_UNCONNECTED[10:0]),
        .axi_w_sbiterr(NLW_U0_axi_w_sbiterr_UNCONNECTED),
        .axi_w_underflow(NLW_U0_axi_w_underflow_UNCONNECTED),
        .axi_w_wr_data_count(NLW_U0_axi_w_wr_data_count_UNCONNECTED[10:0]),
        .axis_data_count(NLW_U0_axis_data_count_UNCONNECTED[10:0]),
        .axis_dbiterr(NLW_U0_axis_dbiterr_UNCONNECTED),
        .axis_injectdbiterr(1'b0),
        .axis_injectsbiterr(1'b0),
        .axis_overflow(NLW_U0_axis_overflow_UNCONNECTED),
        .axis_prog_empty(NLW_U0_axis_prog_empty_UNCONNECTED),
        .axis_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axis_prog_full(NLW_U0_axis_prog_full_UNCONNECTED),
        .axis_prog_full_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axis_rd_data_count(NLW_U0_axis_rd_data_count_UNCONNECTED[10:0]),
        .axis_sbiterr(NLW_U0_axis_sbiterr_UNCONNECTED),
        .axis_underflow(NLW_U0_axis_underflow_UNCONNECTED),
        .axis_wr_data_count(NLW_U0_axis_wr_data_count_UNCONNECTED[10:0]),
        .backup(1'b0),
        .backup_marker(1'b0),
        .clk(1'b0),
        .data_count(NLW_U0_data_count_UNCONNECTED[4:0]),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .din(din),
        .dout(dout),
        .empty(empty),
        .full(full),
        .injectdbiterr(1'b0),
        .injectsbiterr(1'b0),
        .int_clk(1'b0),
        .m_aclk(1'b0),
        .m_aclk_en(1'b0),
        .m_axi_araddr(NLW_U0_m_axi_araddr_UNCONNECTED[31:0]),
        .m_axi_arburst(NLW_U0_m_axi_arburst_UNCONNECTED[1:0]),
        .m_axi_arcache(NLW_U0_m_axi_arcache_UNCONNECTED[3:0]),
        .m_axi_arid(NLW_U0_m_axi_arid_UNCONNECTED[0]),
        .m_axi_arlen(NLW_U0_m_axi_arlen_UNCONNECTED[7:0]),
        .m_axi_arlock(NLW_U0_m_axi_arlock_UNCONNECTED[0]),
        .m_axi_arprot(NLW_U0_m_axi_arprot_UNCONNECTED[2:0]),
        .m_axi_arqos(NLW_U0_m_axi_arqos_UNCONNECTED[3:0]),
        .m_axi_arready(1'b0),
        .m_axi_arregion(NLW_U0_m_axi_arregion_UNCONNECTED[3:0]),
        .m_axi_arsize(NLW_U0_m_axi_arsize_UNCONNECTED[2:0]),
        .m_axi_aruser(NLW_U0_m_axi_aruser_UNCONNECTED[0]),
        .m_axi_arvalid(NLW_U0_m_axi_arvalid_UNCONNECTED),
        .m_axi_awaddr(NLW_U0_m_axi_awaddr_UNCONNECTED[31:0]),
        .m_axi_awburst(NLW_U0_m_axi_awburst_UNCONNECTED[1:0]),
        .m_axi_awcache(NLW_U0_m_axi_awcache_UNCONNECTED[3:0]),
        .m_axi_awid(NLW_U0_m_axi_awid_UNCONNECTED[0]),
        .m_axi_awlen(NLW_U0_m_axi_awlen_UNCONNECTED[7:0]),
        .m_axi_awlock(NLW_U0_m_axi_awlock_UNCONNECTED[0]),
        .m_axi_awprot(NLW_U0_m_axi_awprot_UNCONNECTED[2:0]),
        .m_axi_awqos(NLW_U0_m_axi_awqos_UNCONNECTED[3:0]),
        .m_axi_awready(1'b0),
        .m_axi_awregion(NLW_U0_m_axi_awregion_UNCONNECTED[3:0]),
        .m_axi_awsize(NLW_U0_m_axi_awsize_UNCONNECTED[2:0]),
        .m_axi_awuser(NLW_U0_m_axi_awuser_UNCONNECTED[0]),
        .m_axi_awvalid(NLW_U0_m_axi_awvalid_UNCONNECTED),
        .m_axi_bid(1'b0),
        .m_axi_bready(NLW_U0_m_axi_bready_UNCONNECTED),
        .m_axi_bresp({1'b0,1'b0}),
        .m_axi_buser(1'b0),
        .m_axi_bvalid(1'b0),
        .m_axi_rdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .m_axi_rid(1'b0),
        .m_axi_rlast(1'b0),
        .m_axi_rready(NLW_U0_m_axi_rready_UNCONNECTED),
        .m_axi_rresp({1'b0,1'b0}),
        .m_axi_ruser(1'b0),
        .m_axi_rvalid(1'b0),
        .m_axi_wdata(NLW_U0_m_axi_wdata_UNCONNECTED[63:0]),
        .m_axi_wid(NLW_U0_m_axi_wid_UNCONNECTED[0]),
        .m_axi_wlast(NLW_U0_m_axi_wlast_UNCONNECTED),
        .m_axi_wready(1'b0),
        .m_axi_wstrb(NLW_U0_m_axi_wstrb_UNCONNECTED[7:0]),
        .m_axi_wuser(NLW_U0_m_axi_wuser_UNCONNECTED[0]),
        .m_axi_wvalid(NLW_U0_m_axi_wvalid_UNCONNECTED),
        .m_axis_tdata(NLW_U0_m_axis_tdata_UNCONNECTED[7:0]),
        .m_axis_tdest(NLW_U0_m_axis_tdest_UNCONNECTED[0]),
        .m_axis_tid(NLW_U0_m_axis_tid_UNCONNECTED[0]),
        .m_axis_tkeep(NLW_U0_m_axis_tkeep_UNCONNECTED[0]),
        .m_axis_tlast(NLW_U0_m_axis_tlast_UNCONNECTED),
        .m_axis_tready(1'b0),
        .m_axis_tstrb(NLW_U0_m_axis_tstrb_UNCONNECTED[0]),
        .m_axis_tuser(NLW_U0_m_axis_tuser_UNCONNECTED[3:0]),
        .m_axis_tvalid(NLW_U0_m_axis_tvalid_UNCONNECTED),
        .overflow(NLW_U0_overflow_UNCONNECTED),
        .prog_empty(NLW_U0_prog_empty_UNCONNECTED),
        .prog_empty_thresh({1'b0,1'b0,1'b0,1'b0}),
        .prog_empty_thresh_assert({1'b0,1'b0,1'b0,1'b0}),
        .prog_empty_thresh_negate({1'b0,1'b0,1'b0,1'b0}),
        .prog_full(NLW_U0_prog_full_UNCONNECTED),
        .prog_full_thresh({1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_full_thresh_assert({1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_full_thresh_negate({1'b0,1'b0,1'b0,1'b0,1'b0}),
        .rd_clk(rd_clk),
        .rd_data_count(NLW_U0_rd_data_count_UNCONNECTED[3:0]),
        .rd_en(rd_en),
        .rd_rst(1'b0),
        .rd_rst_busy(rd_rst_busy),
        .rst(rst),
        .s_aclk(1'b0),
        .s_aclk_en(1'b0),
        .s_aresetn(1'b0),
        .s_axi_araddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arburst({1'b0,1'b0}),
        .s_axi_arcache({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arid(1'b0),
        .s_axi_arlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arlock(1'b0),
        .s_axi_arprot({1'b0,1'b0,1'b0}),
        .s_axi_arqos({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arready(NLW_U0_s_axi_arready_UNCONNECTED),
        .s_axi_arregion({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arsize({1'b0,1'b0,1'b0}),
        .s_axi_aruser(1'b0),
        .s_axi_arvalid(1'b0),
        .s_axi_awaddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awburst({1'b0,1'b0}),
        .s_axi_awcache({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awid(1'b0),
        .s_axi_awlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awlock(1'b0),
        .s_axi_awprot({1'b0,1'b0,1'b0}),
        .s_axi_awqos({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awready(NLW_U0_s_axi_awready_UNCONNECTED),
        .s_axi_awregion({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awsize({1'b0,1'b0,1'b0}),
        .s_axi_awuser(1'b0),
        .s_axi_awvalid(1'b0),
        .s_axi_bid(NLW_U0_s_axi_bid_UNCONNECTED[0]),
        .s_axi_bready(1'b0),
        .s_axi_bresp(NLW_U0_s_axi_bresp_UNCONNECTED[1:0]),
        .s_axi_buser(NLW_U0_s_axi_buser_UNCONNECTED[0]),
        .s_axi_bvalid(NLW_U0_s_axi_bvalid_UNCONNECTED),
        .s_axi_rdata(NLW_U0_s_axi_rdata_UNCONNECTED[63:0]),
        .s_axi_rid(NLW_U0_s_axi_rid_UNCONNECTED[0]),
        .s_axi_rlast(NLW_U0_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(1'b0),
        .s_axi_rresp(NLW_U0_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_ruser(NLW_U0_s_axi_ruser_UNCONNECTED[0]),
        .s_axi_rvalid(NLW_U0_s_axi_rvalid_UNCONNECTED),
        .s_axi_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wid(1'b0),
        .s_axi_wlast(1'b0),
        .s_axi_wready(NLW_U0_s_axi_wready_UNCONNECTED),
        .s_axi_wstrb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wuser(1'b0),
        .s_axi_wvalid(1'b0),
        .s_axis_tdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axis_tdest(1'b0),
        .s_axis_tid(1'b0),
        .s_axis_tkeep(1'b0),
        .s_axis_tlast(1'b0),
        .s_axis_tready(NLW_U0_s_axis_tready_UNCONNECTED),
        .s_axis_tstrb(1'b0),
        .s_axis_tuser({1'b0,1'b0,1'b0,1'b0}),
        .s_axis_tvalid(1'b0),
        .sbiterr(NLW_U0_sbiterr_UNCONNECTED),
        .sleep(1'b0),
        .srst(1'b0),
        .underflow(NLW_U0_underflow_UNCONNECTED),
        .valid(valid),
        .wr_ack(NLW_U0_wr_ack_UNCONNECTED),
        .wr_clk(wr_clk),
        .wr_data_count(NLW_U0_wr_data_count_UNCONNECTED[4:0]),
        .wr_en(wr_en),
        .wr_rst(1'b0),
        .wr_rst_busy(wr_rst_busy));
endmodule

(* DEST_SYNC_FF = "2" *) (* INIT_SYNC_FF = "0" *) (* REG_OUTPUT = "1" *) 
(* SIM_ASSERT_CHK = "0" *) (* SIM_LOSSLESS_GRAY_CHK = "0" *) (* VERSION = "0" *) 
(* WIDTH = "5" *) (* XPM_MODULE = "TRUE" *) (* is_du_within_envelope = "true" *) 
(* keep_hierarchy = "true" *) (* xpm_cdc = "GRAY" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_cdc_gray
   (src_clk,
    src_in_bin,
    dest_clk,
    dest_out_bin);
  input src_clk;
  input [4:0]src_in_bin;
  input dest_clk;
  output [4:0]dest_out_bin;

  wire [4:0]async_path;
  wire [3:0]binval;
  wire dest_clk;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "GRAY" *) wire [4:0]\dest_graysync_ff[0] ;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "GRAY" *) wire [4:0]\dest_graysync_ff[1] ;
  wire [4:0]dest_out_bin;
  wire [3:0]gray_enc;
  wire src_clk;
  wire [4:0]src_in_bin;

  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[0]),
        .Q(\dest_graysync_ff[0] [0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[1]),
        .Q(\dest_graysync_ff[0] [1]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[2]),
        .Q(\dest_graysync_ff[0] [2]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[3]),
        .Q(\dest_graysync_ff[0] [3]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][4] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[4]),
        .Q(\dest_graysync_ff[0] [4]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [0]),
        .Q(\dest_graysync_ff[1] [0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [1]),
        .Q(\dest_graysync_ff[1] [1]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [2]),
        .Q(\dest_graysync_ff[1] [2]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [3]),
        .Q(\dest_graysync_ff[1] [3]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][4] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [4]),
        .Q(\dest_graysync_ff[1] [4]),
        .R(1'b0));
  LUT5 #(
    .INIT(32'h96696996)) 
    \dest_out_bin_ff[0]_i_1 
       (.I0(\dest_graysync_ff[1] [0]),
        .I1(\dest_graysync_ff[1] [2]),
        .I2(\dest_graysync_ff[1] [4]),
        .I3(\dest_graysync_ff[1] [3]),
        .I4(\dest_graysync_ff[1] [1]),
        .O(binval[0]));
  LUT4 #(
    .INIT(16'h6996)) 
    \dest_out_bin_ff[1]_i_1 
       (.I0(\dest_graysync_ff[1] [1]),
        .I1(\dest_graysync_ff[1] [3]),
        .I2(\dest_graysync_ff[1] [4]),
        .I3(\dest_graysync_ff[1] [2]),
        .O(binval[1]));
  LUT3 #(
    .INIT(8'h96)) 
    \dest_out_bin_ff[2]_i_1 
       (.I0(\dest_graysync_ff[1] [2]),
        .I1(\dest_graysync_ff[1] [4]),
        .I2(\dest_graysync_ff[1] [3]),
        .O(binval[2]));
  LUT2 #(
    .INIT(4'h6)) 
    \dest_out_bin_ff[3]_i_1 
       (.I0(\dest_graysync_ff[1] [3]),
        .I1(\dest_graysync_ff[1] [4]),
        .O(binval[3]));
  FDRE \dest_out_bin_ff_reg[0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[0]),
        .Q(dest_out_bin[0]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[1]),
        .Q(dest_out_bin[1]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[2]),
        .Q(dest_out_bin[2]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[3]),
        .Q(dest_out_bin[3]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[4] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[1] [4]),
        .Q(dest_out_bin[4]),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[0]_i_1 
       (.I0(src_in_bin[1]),
        .I1(src_in_bin[0]),
        .O(gray_enc[0]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[1]_i_1 
       (.I0(src_in_bin[2]),
        .I1(src_in_bin[1]),
        .O(gray_enc[1]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[2]_i_1 
       (.I0(src_in_bin[3]),
        .I1(src_in_bin[2]),
        .O(gray_enc[2]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[3]_i_1 
       (.I0(src_in_bin[4]),
        .I1(src_in_bin[3]),
        .O(gray_enc[3]));
  FDRE \src_gray_ff_reg[0] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[0]),
        .Q(async_path[0]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[1] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[1]),
        .Q(async_path[1]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[2] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[2]),
        .Q(async_path[2]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[3] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[3]),
        .Q(async_path[3]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[4] 
       (.C(src_clk),
        .CE(1'b1),
        .D(src_in_bin[4]),
        .Q(async_path[4]),
        .R(1'b0));
endmodule

(* DEST_SYNC_FF = "2" *) (* INIT_SYNC_FF = "0" *) (* ORIG_REF_NAME = "xpm_cdc_gray" *) 
(* REG_OUTPUT = "1" *) (* SIM_ASSERT_CHK = "0" *) (* SIM_LOSSLESS_GRAY_CHK = "0" *) 
(* VERSION = "0" *) (* WIDTH = "4" *) (* XPM_MODULE = "TRUE" *) 
(* is_du_within_envelope = "true" *) (* keep_hierarchy = "true" *) (* xpm_cdc = "GRAY" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_cdc_gray__parameterized1
   (src_clk,
    src_in_bin,
    dest_clk,
    dest_out_bin);
  input src_clk;
  input [3:0]src_in_bin;
  input dest_clk;
  output [3:0]dest_out_bin;

  wire [3:0]async_path;
  wire [2:0]binval;
  wire dest_clk;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "GRAY" *) wire [3:0]\dest_graysync_ff[0] ;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "GRAY" *) wire [3:0]\dest_graysync_ff[1] ;
  wire [3:0]dest_out_bin;
  wire [2:0]gray_enc;
  wire src_clk;
  wire [3:0]src_in_bin;

  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[0]),
        .Q(\dest_graysync_ff[0] [0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[1]),
        .Q(\dest_graysync_ff[0] [1]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[2]),
        .Q(\dest_graysync_ff[0] [2]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[3]),
        .Q(\dest_graysync_ff[0] [3]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [0]),
        .Q(\dest_graysync_ff[1] [0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [1]),
        .Q(\dest_graysync_ff[1] [1]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [2]),
        .Q(\dest_graysync_ff[1] [2]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [3]),
        .Q(\dest_graysync_ff[1] [3]),
        .R(1'b0));
  LUT4 #(
    .INIT(16'h6996)) 
    \dest_out_bin_ff[0]_i_1 
       (.I0(\dest_graysync_ff[1] [0]),
        .I1(\dest_graysync_ff[1] [2]),
        .I2(\dest_graysync_ff[1] [3]),
        .I3(\dest_graysync_ff[1] [1]),
        .O(binval[0]));
  LUT3 #(
    .INIT(8'h96)) 
    \dest_out_bin_ff[1]_i_1 
       (.I0(\dest_graysync_ff[1] [1]),
        .I1(\dest_graysync_ff[1] [3]),
        .I2(\dest_graysync_ff[1] [2]),
        .O(binval[1]));
  LUT2 #(
    .INIT(4'h6)) 
    \dest_out_bin_ff[2]_i_1 
       (.I0(\dest_graysync_ff[1] [2]),
        .I1(\dest_graysync_ff[1] [3]),
        .O(binval[2]));
  FDRE \dest_out_bin_ff_reg[0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[0]),
        .Q(dest_out_bin[0]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[1]),
        .Q(dest_out_bin[1]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[2]),
        .Q(dest_out_bin[2]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[1] [3]),
        .Q(dest_out_bin[3]),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[0]_i_1 
       (.I0(src_in_bin[1]),
        .I1(src_in_bin[0]),
        .O(gray_enc[0]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[1]_i_1 
       (.I0(src_in_bin[2]),
        .I1(src_in_bin[1]),
        .O(gray_enc[1]));
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[2]_i_1 
       (.I0(src_in_bin[3]),
        .I1(src_in_bin[2]),
        .O(gray_enc[2]));
  FDRE \src_gray_ff_reg[0] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[0]),
        .Q(async_path[0]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[1] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[1]),
        .Q(async_path[1]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[2] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[2]),
        .Q(async_path[2]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[3] 
       (.C(src_clk),
        .CE(1'b1),
        .D(src_in_bin[3]),
        .Q(async_path[3]),
        .R(1'b0));
endmodule

(* DEST_SYNC_FF = "5" *) (* INIT_SYNC_FF = "0" *) (* SIM_ASSERT_CHK = "0" *) 
(* SRC_INPUT_REG = "0" *) (* VERSION = "0" *) (* XPM_MODULE = "TRUE" *) 
(* is_du_within_envelope = "true" *) (* keep_hierarchy = "true" *) (* xpm_cdc = "SINGLE" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_cdc_single
   (src_clk,
    src_in,
    dest_clk,
    dest_out);
  input src_clk;
  input src_in;
  input dest_clk;
  output dest_out;

  wire dest_clk;
  wire src_in;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "SINGLE" *) wire [4:0]syncstages_ff;

  assign dest_out = syncstages_ff[4];
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SINGLE" *) 
  FDRE \syncstages_ff_reg[0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(src_in),
        .Q(syncstages_ff[0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SINGLE" *) 
  FDRE \syncstages_ff_reg[1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[0]),
        .Q(syncstages_ff[1]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SINGLE" *) 
  FDRE \syncstages_ff_reg[2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[1]),
        .Q(syncstages_ff[2]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SINGLE" *) 
  FDRE \syncstages_ff_reg[3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[2]),
        .Q(syncstages_ff[3]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SINGLE" *) 
  FDRE \syncstages_ff_reg[4] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[3]),
        .Q(syncstages_ff[4]),
        .R(1'b0));
endmodule

(* DEST_SYNC_FF = "5" *) (* INIT_SYNC_FF = "0" *) (* ORIG_REF_NAME = "xpm_cdc_single" *) 
(* SIM_ASSERT_CHK = "0" *) (* SRC_INPUT_REG = "0" *) (* VERSION = "0" *) 
(* XPM_MODULE = "TRUE" *) (* is_du_within_envelope = "true" *) (* keep_hierarchy = "true" *) 
(* xpm_cdc = "SINGLE" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_cdc_single__2
   (src_clk,
    src_in,
    dest_clk,
    dest_out);
  input src_clk;
  input src_in;
  input dest_clk;
  output dest_out;

  wire dest_clk;
  wire src_in;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "SINGLE" *) wire [4:0]syncstages_ff;

  assign dest_out = syncstages_ff[4];
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SINGLE" *) 
  FDRE \syncstages_ff_reg[0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(src_in),
        .Q(syncstages_ff[0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SINGLE" *) 
  FDRE \syncstages_ff_reg[1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[0]),
        .Q(syncstages_ff[1]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SINGLE" *) 
  FDRE \syncstages_ff_reg[2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[1]),
        .Q(syncstages_ff[2]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SINGLE" *) 
  FDRE \syncstages_ff_reg[3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[2]),
        .Q(syncstages_ff[3]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SINGLE" *) 
  FDRE \syncstages_ff_reg[4] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[3]),
        .Q(syncstages_ff[4]),
        .R(1'b0));
endmodule

(* DEF_VAL = "1'b1" *) (* DEST_SYNC_FF = "5" *) (* INIT = "1" *) 
(* INIT_SYNC_FF = "0" *) (* SIM_ASSERT_CHK = "0" *) (* VERSION = "0" *) 
(* XPM_MODULE = "TRUE" *) (* is_du_within_envelope = "true" *) (* keep_hierarchy = "true" *) 
(* xpm_cdc = "SYNC_RST" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_cdc_sync_rst
   (src_rst,
    dest_clk,
    dest_rst);
  input src_rst;
  input dest_clk;
  output dest_rst;

  wire dest_clk;
  wire src_rst;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "SYNC_RST" *) wire [4:0]syncstages_ff;

  assign dest_rst = syncstages_ff[4];
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SYNC_RST" *) 
  FDRE #(
    .INIT(1'b1)) 
    \syncstages_ff_reg[0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(src_rst),
        .Q(syncstages_ff[0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SYNC_RST" *) 
  FDRE #(
    .INIT(1'b1)) 
    \syncstages_ff_reg[1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[0]),
        .Q(syncstages_ff[1]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SYNC_RST" *) 
  FDRE #(
    .INIT(1'b1)) 
    \syncstages_ff_reg[2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[1]),
        .Q(syncstages_ff[2]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SYNC_RST" *) 
  FDRE #(
    .INIT(1'b1)) 
    \syncstages_ff_reg[3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[2]),
        .Q(syncstages_ff[3]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SYNC_RST" *) 
  FDRE #(
    .INIT(1'b1)) 
    \syncstages_ff_reg[4] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[3]),
        .Q(syncstages_ff[4]),
        .R(1'b0));
endmodule

(* DEF_VAL = "1'b1" *) (* DEST_SYNC_FF = "5" *) (* INIT = "1" *) 
(* INIT_SYNC_FF = "0" *) (* ORIG_REF_NAME = "xpm_cdc_sync_rst" *) (* SIM_ASSERT_CHK = "0" *) 
(* VERSION = "0" *) (* XPM_MODULE = "TRUE" *) (* is_du_within_envelope = "true" *) 
(* keep_hierarchy = "true" *) (* xpm_cdc = "SYNC_RST" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_cdc_sync_rst__2
   (src_rst,
    dest_clk,
    dest_rst);
  input src_rst;
  input dest_clk;
  output dest_rst;

  wire dest_clk;
  wire src_rst;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "SYNC_RST" *) wire [4:0]syncstages_ff;

  assign dest_rst = syncstages_ff[4];
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SYNC_RST" *) 
  FDRE #(
    .INIT(1'b1)) 
    \syncstages_ff_reg[0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(src_rst),
        .Q(syncstages_ff[0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SYNC_RST" *) 
  FDRE #(
    .INIT(1'b1)) 
    \syncstages_ff_reg[1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[0]),
        .Q(syncstages_ff[1]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SYNC_RST" *) 
  FDRE #(
    .INIT(1'b1)) 
    \syncstages_ff_reg[2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[1]),
        .Q(syncstages_ff[2]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SYNC_RST" *) 
  FDRE #(
    .INIT(1'b1)) 
    \syncstages_ff_reg[3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[2]),
        .Q(syncstages_ff[3]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SYNC_RST" *) 
  FDRE #(
    .INIT(1'b1)) 
    \syncstages_ff_reg[4] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[3]),
        .Q(syncstages_ff[4]),
        .R(1'b0));
endmodule

(* DEF_VAL = "1'b0" *) (* DEST_SYNC_FF = "3" *) (* INIT = "0" *) 
(* INIT_SYNC_FF = "0" *) (* ORIG_REF_NAME = "xpm_cdc_sync_rst" *) (* SIM_ASSERT_CHK = "0" *) 
(* VERSION = "0" *) (* XPM_MODULE = "TRUE" *) (* is_du_within_envelope = "true" *) 
(* keep_hierarchy = "true" *) (* xpm_cdc = "SYNC_RST" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_cdc_sync_rst__parameterized2
   (src_rst,
    dest_clk,
    dest_rst);
  input src_rst;
  input dest_clk;
  output dest_rst;

  wire dest_clk;
  wire src_rst;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "SYNC_RST" *) wire [2:0]syncstages_ff;

  assign dest_rst = syncstages_ff[2];
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SYNC_RST" *) 
  FDRE #(
    .INIT(1'b0)) 
    \syncstages_ff_reg[0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(src_rst),
        .Q(syncstages_ff[0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SYNC_RST" *) 
  FDRE #(
    .INIT(1'b0)) 
    \syncstages_ff_reg[1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[0]),
        .Q(syncstages_ff[1]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SYNC_RST" *) 
  FDRE #(
    .INIT(1'b0)) 
    \syncstages_ff_reg[2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[1]),
        .Q(syncstages_ff[2]),
        .R(1'b0));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2023.2"
`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
jLV29U0rrfMIZhYJzdoUrPoqB9eHQ5NXmWyCdqnN3Wgm+GU4C3zthrN1m4QGiaj0thPCIynZbX+0
7yjtkv+T5ByJ6NhiofAwWseGLvPXlYu6ERAPvi4SAYpF2VUqQHtPAbPmnPubGdDRgIEpeobF7hsz
rEcpEru1pyiScUriyuo=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
vsoizVrOONWw/DhjRLEYrtRmtji+Ok63CbpSg/l9VnoKAi8tAzqRbQ57atGB2N6IGGbKHkbK2Uzh
EHgWvYZeyt4hE+bpQX91vc9PNxfjQMGzPoFD3jCWk30EmEk+AND39eWx+DhJ8xhFuucoOQ2GwyAk
B+Mjs15naPE7DvlHel8hnD4dfSdYhGKp96oozu8JeBto8aHG6poOuYkxSwaut7NCI+mabCkMxtMp
RrydgmRuTvhRTbJMyx5CxFSZTRDrS5aU1vaRlnMiqKCI7g2KY9pemYaJsFeVodBuo6IyKGynyEhs
wr+VtUhQDtaVhMkwB95WwmMoDk9F2L5Au1I+TQ==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
W081dPMCWhKs5YlQD7n3zvf7+PTcnb8eFWxoVs8+zHLkxDMA1klITbsfztGYvJFce8Yao5XQLLqZ
oUE5Pq2arq+zwICFUcLjdMsmP1WmL82znHOPHm83zNwrxWMloHkySAqzFbgJeHa973uZqj0M8ydc
sYmzCYVlGVjt0QX0xqA=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Zpc3MmdLWaVOv+S4z2POuoyslYoAbWc+Npxq2UyQRtDwf566IId3uwAetolMAgfLo/G3ezuSOXMn
8NznS37h9XvmVrxA50SAux68P87WgkLtiUYqM3CMBKkxNlZ/TR8WzTuQyFdvzkOE9lp8HC7LXnk5
RDsnOM+su46FW7ysY01COslo9Xc7rhs6WFqx29+Xcqk8+ZMLSzaJfuwZdNmJFS3Q1vhlq3ZeYqMl
wMieB731KsPxjxp7VKNHpTbgFryC2isqc4ohBDOt52M/Bz4B/rIpFeHfZ7X3jWSiKtSuBsDN2NXf
EMjfAT248dlK7NxJ+NBNPhS5sLxTiGyQhta57A==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
rPMYqnkKhJKV1wltOfDrKos9ZbucaoX3WGTuqsdLkGpcKObzslHBwlGrKtWV7bZYmS2SM+QuEMfa
CE+tCUdsSiprp+n5BuSQlJa6BJ8mlqccjoo/JLw2QEmUhyMXQ3TLGomGGoZdeTmMPXhUBAOyLPea
Ddc8mgtTN8Kpy117GOTXDKP+IKJqW01fLrPJpgEhFiJCbyElLgtCRWmI94gX+y4XNVS0Cd1YwNw6
4nHgnEdC7fXARDKcYO3VsWC/pdzPQgursXloNLrVYa6i2xr+8E1V0+nSWwNYQZP7XUIVqXKMU8Ea
bT4acXrRCF/5tJJ5B9JparYI0zxXSbaakn1dIw==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2022_10", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
mfroTgL8g2pyIXQ/mGO9YHm19cd5mOlJ++qpusOYeVxGmkIhvF4aKx+AyIUz2yGGAeCtOzIasHty
pyqKgZhibSqxcpHgR0m6GOxXXOXJiHaK8NzxUzXeRJovcBI/WjtDhXeb1LRMI1J97jVBtJPJQH0Y
fGOD7jWvkvQwxnrZdyLp6kPWgSIcavHHDbO7iJv4gnyGp6W3/FCDo2RKWNLoW+SNjSdLZ6YRP8a+
ldaGU8TYvJ03KWlmik7repuN6AwxCjg2KeQ+x1sBAEXzROXomuSbvX3ZAo8UiIKAQY1SJumHLG3L
QI/S4Wbl1Hz6LDTsttMwP480gq6+tb6s1E4oWw==

`pragma protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
QJIabgm8dx/gVHbOQFwt8maOKVHFgkpZTPR6dzD8fqoGo9M9oGPTqBqchtPZWgv2UYFF2KEUSlV4
L3SDXBKrLs+NsAVTcICaEMiEi6j82zj/C1LsPkQfS8RLrg0ab8lbDMb5YqJ7lkHs3iM65x2iN1Mf
66cTgCbkAdl3rDpab75btpTQt5ZKiq5CSY3RZfyIW0uWbTGTELm6liuRKM9+K8BQwTU7A+FFFQBA
/9eJwQYzNNA/iwoYJ2WTPd6pBlzXriNLu9M+/2bYicNBSuH1PBR9v2ESrTB6k7EiV1zvBXV9NuG/
sFt4MumWMuSNwP2W38bQATxxW/l0IrmaXGOC/w==

`pragma protect key_keyowner="Atrenta", key_keyname="ATR-SG-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=384)
`pragma protect key_block
lhKf/Vgj6pHpme1ji4HVe36BU8pMkam/2I9lFeyOiBnIbzgdEGfLJBcEvkL33A7s0hxa6LFbHnkT
upgMpPjmIghBz3xUQ13vpiY152thFec6qvlcdg1r+GTmnBOSFl6g/OfZ3eFUhfsve6ZjQHpXnKFo
a55hN2+eP1EG9+VxGeM7XkHaeFhEIry52qtnmg072KEFIwRiGs2d/TJ4AqupuIdIiP1kTN9k+oqa
2ta1vdtqPY0dDHqrf+5YSd0CejkhQeCqg/bauLP3755SwdOPRgooG5ANT8hUpTiFMFXtU+GC9NSp
evJtMHUy1NbgMmhFHO+w3URLEdjSaBxZPD7YLdWkF65jY526tJzoek+BzEKoBaGfCaY7O1nHKXm+
89k3rPUy0Xo4/0nHpno+N/Db09heJPbnGsCwN/l+KnR6Lz8kvWziBjZe0ijOkKI+T12y3T1VeOtY
H/aqtNlQt1mhFwrbw6ezaAiDPVbCQXnly6b4tbb8+nFsxWOGIGAfLozB

`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="CDS_RSA_KEY_VER_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
PNsQ8uEcQYrl+GaDuBaq1tQ5br5aAdaqHnyrc0NVu/JnQUk53jaiLx8Oz5fNACvWelUUk2/C+P5I
b2rbU1bb/dC6TqC5J1N0yoMYRYw58u4Lrl8Kgqgt9Rlph5Qgzzfxp+oblXF/pO4mRyAXpZhpNkFT
0Ar9BUtPOTOtJ9/g53SRnZ6GjxzfeD+25J4fcXBNo2gCTgUkwiLSsJRwTB/cJmn+dZPwPdIOHEP9
TkfDK+OrbLYO3T+DFBTCMRNH2NB1J9sc5s+nPU8iYnjgPTo6HoGW+LIlCz6yNJMZzJzoeW708utc
0fJXkT7vLDVh7olvy3V9AAY8Do0YR1kiZlhVhQ==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
zAz8RnGHFebkJFAS+gjC+mXHW7m7We+JgSmIz15mS01u/4+9Ng0sJfkeXOClmVPTQ2Mp2Yuv6/6f
ehzUTcANilWsqLM6Q1FToCPNX/NTqodlcHirGM7b5R9yevouNT/aqH12nmbunBQmBHmehNutdCjG
r6Z7kZgeZ2ZE7MMOF0rTy1XHEPkqgMNTRoS8R/pPWPTW4/j+bn3aJj0Q/fTz4Gi3mbSUKWs2fREQ
UKiuolNJkN6DiDvhlVYHUyytXNJG44ikmBXehoQQRLapkYaxnQmMRT1ok9uY6pKoy71CtvJ3Mt2x
EQv1GU2i4qQyAOwa0mkEohWXduicU6tDz3zQwQ==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
TK3eE9V+v1z2P1KjG4GrjhA1n3qDOpNzLGXdtjnjhF0QBFPSuhC+nmNqTPOb3p2a9r5KD0miY3Cd
+KpjH6Ao09E2/LD2Go4aLQh6vP+9BldlSKEwCGfx2NjBQrXWVH21lQR7IRjOvyTOclpd7SgtUJLw
dvebETyLiKr9C6RfnIBeptuCA3iJlXfwkh6I0JfzD5WBizQkotioZmmrXv5105pCXQ4Ta1WThFsA
2ll9dZeSjEDHUxxhfyfjryv9m4VL89ZDU/rGITsdptwB1BC1jLqmPDymY05lyECnjA6NIR5GGfI4
K2y2f4GfikKoN5r9IOvFzw963Wm82ZZPtXOKGg==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 97824)
`pragma protect data_block
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
3VMXBlrlVRTw2vXx
`pragma protect end_protected
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
