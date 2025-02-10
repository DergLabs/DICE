// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
// Date        : Sun Feb  2 23:12:57 2025
// Host        : DESKTOP-U9NB2CD running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ fifo_generator_1_sim_netlist.v
// Design      : fifo_generator_1
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xcku3p-ffva676-2-i
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "fifo_generator_1,fifo_generator_v13_2_9,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "fifo_generator_v13_2_9,Vivado 2023.2" *) 
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
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE WR_DATA" *) input [31:0]din;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE WR_EN" *) input wr_en;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ RD_EN" *) input rd_en;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ RD_DATA" *) output [31:0]dout;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE FULL" *) output full;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ EMPTY" *) output empty;
  output valid;
  output wr_rst_busy;
  output rd_rst_busy;

  wire [31:0]din;
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
  wire [5:0]NLW_U0_data_count_UNCONNECTED;
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
  wire [5:0]NLW_U0_rd_data_count_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_buser_UNCONNECTED;
  wire [63:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_ruser_UNCONNECTED;
  wire [5:0]NLW_U0_wr_data_count_UNCONNECTED;

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
  (* C_DATA_COUNT_WIDTH = "6" *) 
  (* C_DEFAULT_VALUE = "BlankString" *) 
  (* C_DIN_WIDTH = "32" *) 
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
  (* C_PRELOAD_LATENCY = "0" *) 
  (* C_PRELOAD_REGS = "1" *) 
  (* C_PRIM_FIFO_TYPE = "512x36" *) 
  (* C_PRIM_FIFO_TYPE_AXIS = "1kx18" *) 
  (* C_PRIM_FIFO_TYPE_RACH = "512x36" *) 
  (* C_PRIM_FIFO_TYPE_RDCH = "512x72" *) 
  (* C_PRIM_FIFO_TYPE_WACH = "512x36" *) 
  (* C_PRIM_FIFO_TYPE_WDCH = "512x72" *) 
  (* C_PRIM_FIFO_TYPE_WRCH = "512x36" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL = "4" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_AXIS = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_RACH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_RDCH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_WACH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_WDCH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_WRCH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_NEGATE_VAL = "5" *) 
  (* C_PROG_EMPTY_TYPE = "0" *) 
  (* C_PROG_EMPTY_TYPE_AXIS = "0" *) 
  (* C_PROG_EMPTY_TYPE_RACH = "0" *) 
  (* C_PROG_EMPTY_TYPE_RDCH = "0" *) 
  (* C_PROG_EMPTY_TYPE_WACH = "0" *) 
  (* C_PROG_EMPTY_TYPE_WDCH = "0" *) 
  (* C_PROG_EMPTY_TYPE_WRCH = "0" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL = "63" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_AXIS = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_RACH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_RDCH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WACH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WDCH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WRCH = "1023" *) 
  (* C_PROG_FULL_THRESH_NEGATE_VAL = "62" *) 
  (* C_PROG_FULL_TYPE = "0" *) 
  (* C_PROG_FULL_TYPE_AXIS = "0" *) 
  (* C_PROG_FULL_TYPE_RACH = "0" *) 
  (* C_PROG_FULL_TYPE_RDCH = "0" *) 
  (* C_PROG_FULL_TYPE_WACH = "0" *) 
  (* C_PROG_FULL_TYPE_WDCH = "0" *) 
  (* C_PROG_FULL_TYPE_WRCH = "0" *) 
  (* C_RACH_TYPE = "0" *) 
  (* C_RDCH_TYPE = "0" *) 
  (* C_RD_DATA_COUNT_WIDTH = "6" *) 
  (* C_RD_DEPTH = "64" *) 
  (* C_RD_FREQ = "1" *) 
  (* C_RD_PNTR_WIDTH = "6" *) 
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
  (* C_USE_EMBEDDED_REG = "0" *) 
  (* C_USE_FIFO16_FLAGS = "0" *) 
  (* C_USE_FWFT_DATA_COUNT = "0" *) 
  (* C_USE_PIPELINE_REG = "0" *) 
  (* C_VALID_LOW = "0" *) 
  (* C_WACH_TYPE = "0" *) 
  (* C_WDCH_TYPE = "0" *) 
  (* C_WRCH_TYPE = "0" *) 
  (* C_WR_ACK_LOW = "0" *) 
  (* C_WR_DATA_COUNT_WIDTH = "6" *) 
  (* C_WR_DEPTH = "64" *) 
  (* C_WR_DEPTH_AXIS = "1024" *) 
  (* C_WR_DEPTH_RACH = "16" *) 
  (* C_WR_DEPTH_RDCH = "1024" *) 
  (* C_WR_DEPTH_WACH = "16" *) 
  (* C_WR_DEPTH_WDCH = "1024" *) 
  (* C_WR_DEPTH_WRCH = "16" *) 
  (* C_WR_FREQ = "1" *) 
  (* C_WR_PNTR_WIDTH = "6" *) 
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
        .data_count(NLW_U0_data_count_UNCONNECTED[5:0]),
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
        .prog_empty_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_empty_thresh_assert({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_empty_thresh_negate({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_full(NLW_U0_prog_full_UNCONNECTED),
        .prog_full_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_full_thresh_assert({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_full_thresh_negate({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .rd_clk(rd_clk),
        .rd_data_count(NLW_U0_rd_data_count_UNCONNECTED[5:0]),
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
        .wr_data_count(NLW_U0_wr_data_count_UNCONNECTED[5:0]),
        .wr_en(wr_en),
        .wr_rst(1'b0),
        .wr_rst_busy(wr_rst_busy));
endmodule

(* DEST_SYNC_FF = "2" *) (* INIT_SYNC_FF = "0" *) (* REG_OUTPUT = "1" *) 
(* SIM_ASSERT_CHK = "0" *) (* SIM_LOSSLESS_GRAY_CHK = "0" *) (* VERSION = "0" *) 
(* WIDTH = "6" *) (* XPM_MODULE = "TRUE" *) (* is_du_within_envelope = "true" *) 
(* keep_hierarchy = "true" *) (* xpm_cdc = "GRAY" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_cdc_gray
   (src_clk,
    src_in_bin,
    dest_clk,
    dest_out_bin);
  input src_clk;
  input [5:0]src_in_bin;
  input dest_clk;
  output [5:0]dest_out_bin;

  wire [5:0]async_path;
  wire [4:0]binval;
  wire dest_clk;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "GRAY" *) wire [5:0]\dest_graysync_ff[0] ;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "GRAY" *) wire [5:0]\dest_graysync_ff[1] ;
  wire [5:0]dest_out_bin;
  wire [4:0]gray_enc;
  wire src_clk;
  wire [5:0]src_in_bin;

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
  FDRE \dest_graysync_ff_reg[0][5] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[5]),
        .Q(\dest_graysync_ff[0] [5]),
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
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][5] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [5]),
        .Q(\dest_graysync_ff[1] [5]),
        .R(1'b0));
  LUT6 #(
    .INIT(64'h6996966996696996)) 
    \dest_out_bin_ff[0]_i_1 
       (.I0(\dest_graysync_ff[1] [0]),
        .I1(\dest_graysync_ff[1] [2]),
        .I2(\dest_graysync_ff[1] [4]),
        .I3(\dest_graysync_ff[1] [5]),
        .I4(\dest_graysync_ff[1] [3]),
        .I5(\dest_graysync_ff[1] [1]),
        .O(binval[0]));
  LUT5 #(
    .INIT(32'h96696996)) 
    \dest_out_bin_ff[1]_i_1 
       (.I0(\dest_graysync_ff[1] [1]),
        .I1(\dest_graysync_ff[1] [3]),
        .I2(\dest_graysync_ff[1] [5]),
        .I3(\dest_graysync_ff[1] [4]),
        .I4(\dest_graysync_ff[1] [2]),
        .O(binval[1]));
  LUT4 #(
    .INIT(16'h6996)) 
    \dest_out_bin_ff[2]_i_1 
       (.I0(\dest_graysync_ff[1] [2]),
        .I1(\dest_graysync_ff[1] [4]),
        .I2(\dest_graysync_ff[1] [5]),
        .I3(\dest_graysync_ff[1] [3]),
        .O(binval[2]));
  LUT3 #(
    .INIT(8'h96)) 
    \dest_out_bin_ff[3]_i_1 
       (.I0(\dest_graysync_ff[1] [3]),
        .I1(\dest_graysync_ff[1] [5]),
        .I2(\dest_graysync_ff[1] [4]),
        .O(binval[3]));
  LUT2 #(
    .INIT(4'h6)) 
    \dest_out_bin_ff[4]_i_1 
       (.I0(\dest_graysync_ff[1] [4]),
        .I1(\dest_graysync_ff[1] [5]),
        .O(binval[4]));
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
        .D(binval[4]),
        .Q(dest_out_bin[4]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[5] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[1] [5]),
        .Q(dest_out_bin[5]),
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
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[2]_i_1 
       (.I0(src_in_bin[3]),
        .I1(src_in_bin[2]),
        .O(gray_enc[2]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[3]_i_1 
       (.I0(src_in_bin[4]),
        .I1(src_in_bin[3]),
        .O(gray_enc[3]));
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[4]_i_1 
       (.I0(src_in_bin[5]),
        .I1(src_in_bin[4]),
        .O(gray_enc[4]));
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
        .D(gray_enc[4]),
        .Q(async_path[4]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[5] 
       (.C(src_clk),
        .CE(1'b1),
        .D(src_in_bin[5]),
        .Q(async_path[5]),
        .R(1'b0));
endmodule

(* DEST_SYNC_FF = "2" *) (* INIT_SYNC_FF = "0" *) (* ORIG_REF_NAME = "xpm_cdc_gray" *) 
(* REG_OUTPUT = "1" *) (* SIM_ASSERT_CHK = "0" *) (* SIM_LOSSLESS_GRAY_CHK = "0" *) 
(* VERSION = "0" *) (* WIDTH = "6" *) (* XPM_MODULE = "TRUE" *) 
(* is_du_within_envelope = "true" *) (* keep_hierarchy = "true" *) (* xpm_cdc = "GRAY" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_cdc_gray__2
   (src_clk,
    src_in_bin,
    dest_clk,
    dest_out_bin);
  input src_clk;
  input [5:0]src_in_bin;
  input dest_clk;
  output [5:0]dest_out_bin;

  wire [5:0]async_path;
  wire [4:0]binval;
  wire dest_clk;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "GRAY" *) wire [5:0]\dest_graysync_ff[0] ;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "GRAY" *) wire [5:0]\dest_graysync_ff[1] ;
  wire [5:0]dest_out_bin;
  wire [4:0]gray_enc;
  wire src_clk;
  wire [5:0]src_in_bin;

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
  FDRE \dest_graysync_ff_reg[0][5] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[5]),
        .Q(\dest_graysync_ff[0] [5]),
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
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][5] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [5]),
        .Q(\dest_graysync_ff[1] [5]),
        .R(1'b0));
  LUT6 #(
    .INIT(64'h6996966996696996)) 
    \dest_out_bin_ff[0]_i_1 
       (.I0(\dest_graysync_ff[1] [0]),
        .I1(\dest_graysync_ff[1] [2]),
        .I2(\dest_graysync_ff[1] [4]),
        .I3(\dest_graysync_ff[1] [5]),
        .I4(\dest_graysync_ff[1] [3]),
        .I5(\dest_graysync_ff[1] [1]),
        .O(binval[0]));
  LUT5 #(
    .INIT(32'h96696996)) 
    \dest_out_bin_ff[1]_i_1 
       (.I0(\dest_graysync_ff[1] [1]),
        .I1(\dest_graysync_ff[1] [3]),
        .I2(\dest_graysync_ff[1] [5]),
        .I3(\dest_graysync_ff[1] [4]),
        .I4(\dest_graysync_ff[1] [2]),
        .O(binval[1]));
  LUT4 #(
    .INIT(16'h6996)) 
    \dest_out_bin_ff[2]_i_1 
       (.I0(\dest_graysync_ff[1] [2]),
        .I1(\dest_graysync_ff[1] [4]),
        .I2(\dest_graysync_ff[1] [5]),
        .I3(\dest_graysync_ff[1] [3]),
        .O(binval[2]));
  LUT3 #(
    .INIT(8'h96)) 
    \dest_out_bin_ff[3]_i_1 
       (.I0(\dest_graysync_ff[1] [3]),
        .I1(\dest_graysync_ff[1] [5]),
        .I2(\dest_graysync_ff[1] [4]),
        .O(binval[3]));
  LUT2 #(
    .INIT(4'h6)) 
    \dest_out_bin_ff[4]_i_1 
       (.I0(\dest_graysync_ff[1] [4]),
        .I1(\dest_graysync_ff[1] [5]),
        .O(binval[4]));
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
        .D(binval[4]),
        .Q(dest_out_bin[4]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[5] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[1] [5]),
        .Q(dest_out_bin[5]),
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
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[4]_i_1 
       (.I0(src_in_bin[5]),
        .I1(src_in_bin[4]),
        .O(gray_enc[4]));
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
        .D(gray_enc[4]),
        .Q(async_path[4]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[5] 
       (.C(src_clk),
        .CE(1'b1),
        .D(src_in_bin[5]),
        .Q(async_path[5]),
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 108576)
`pragma protect data_block
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
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
