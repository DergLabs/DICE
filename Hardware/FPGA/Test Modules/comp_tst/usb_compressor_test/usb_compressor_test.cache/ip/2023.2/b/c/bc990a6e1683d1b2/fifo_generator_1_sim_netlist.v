// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
// Date        : Sun Feb  2 00:27:53 2025
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
    valid);
  input rst;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 write_clk CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME write_clk, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, INSERT_VIP 0" *) input wr_clk;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 read_clk CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME read_clk, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, INSERT_VIP 0" *) input rd_clk;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE WR_DATA" *) input [15:0]din;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE WR_EN" *) input wr_en;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ RD_EN" *) input rd_en;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ RD_DATA" *) output [15:0]dout;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE FULL" *) output full;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ EMPTY" *) output empty;
  output valid;

  wire [15:0]din;
  wire [15:0]dout;
  wire empty;
  wire full;
  wire rd_clk;
  wire rd_en;
  wire rst;
  wire valid;
  wire wr_clk;
  wire wr_en;
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
  wire NLW_U0_rd_rst_busy_UNCONNECTED;
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
  wire NLW_U0_wr_rst_busy_UNCONNECTED;
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
  (* C_DIN_WIDTH = "16" *) 
  (* C_DIN_WIDTH_AXIS = "1" *) 
  (* C_DIN_WIDTH_RACH = "32" *) 
  (* C_DIN_WIDTH_RDCH = "64" *) 
  (* C_DIN_WIDTH_WACH = "1" *) 
  (* C_DIN_WIDTH_WDCH = "64" *) 
  (* C_DIN_WIDTH_WRCH = "2" *) 
  (* C_DOUT_RST_VAL = "0" *) 
  (* C_DOUT_WIDTH = "16" *) 
  (* C_ENABLE_RLOCS = "0" *) 
  (* C_ENABLE_RST_SYNC = "1" *) 
  (* C_EN_SAFETY_CKT = "0" *) 
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
  (* C_MEMORY_TYPE = "2" *) 
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
        .rd_rst_busy(NLW_U0_rd_rst_busy_UNCONNECTED),
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
        .wr_rst_busy(NLW_U0_wr_rst_busy_UNCONNECTED));
endmodule

(* DEF_VAL = "1'b0" *) (* DEST_SYNC_FF = "2" *) (* INIT_SYNC_FF = "0" *) 
(* INV_DEF_VAL = "1'b1" *) (* RST_ACTIVE_HIGH = "1" *) (* VERSION = "0" *) 
(* XPM_MODULE = "TRUE" *) (* is_du_within_envelope = "true" *) (* keep_hierarchy = "true" *) 
(* xpm_cdc = "ASYNC_RST" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_cdc_async_rst
   (src_arst,
    dest_clk,
    dest_arst);
  input src_arst;
  input dest_clk;
  output dest_arst;

  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "ASYNC_RST" *) wire [1:0]arststages_ff;
  wire dest_clk;
  wire src_arst;

  assign dest_arst = arststages_ff[1];
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "ASYNC_RST" *) 
  FDPE #(
    .INIT(1'b0)) 
    \arststages_ff_reg[0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(1'b0),
        .PRE(src_arst),
        .Q(arststages_ff[0]));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "ASYNC_RST" *) 
  FDPE #(
    .INIT(1'b0)) 
    \arststages_ff_reg[1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(arststages_ff[0]),
        .PRE(src_arst),
        .Q(arststages_ff[1]));
endmodule

(* DEF_VAL = "1'b0" *) (* DEST_SYNC_FF = "2" *) (* INIT_SYNC_FF = "0" *) 
(* INV_DEF_VAL = "1'b1" *) (* ORIG_REF_NAME = "xpm_cdc_async_rst" *) (* RST_ACTIVE_HIGH = "1" *) 
(* VERSION = "0" *) (* XPM_MODULE = "TRUE" *) (* is_du_within_envelope = "true" *) 
(* keep_hierarchy = "true" *) (* xpm_cdc = "ASYNC_RST" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_cdc_async_rst__1
   (src_arst,
    dest_clk,
    dest_arst);
  input src_arst;
  input dest_clk;
  output dest_arst;

  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "ASYNC_RST" *) wire [1:0]arststages_ff;
  wire dest_clk;
  wire src_arst;

  assign dest_arst = arststages_ff[1];
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "ASYNC_RST" *) 
  FDPE #(
    .INIT(1'b0)) 
    \arststages_ff_reg[0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(1'b0),
        .PRE(src_arst),
        .Q(arststages_ff[0]));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "ASYNC_RST" *) 
  FDPE #(
    .INIT(1'b0)) 
    \arststages_ff_reg[1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(arststages_ff[0]),
        .PRE(src_arst),
        .Q(arststages_ff[1]));
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

(* DEST_SYNC_FF = "4" *) (* INIT_SYNC_FF = "0" *) (* SIM_ASSERT_CHK = "0" *) 
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
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "SINGLE" *) wire [3:0]syncstages_ff;

  assign dest_out = syncstages_ff[3];
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
endmodule

(* DEST_SYNC_FF = "4" *) (* INIT_SYNC_FF = "0" *) (* ORIG_REF_NAME = "xpm_cdc_single" *) 
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
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "SINGLE" *) wire [3:0]syncstages_ff;

  assign dest_out = syncstages_ff[3];
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
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2023.2"
`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
gcDjvJ18gZEH8C+LHMq/N7AaYWSyHgvjIQn585rdUOTVX2orO9n8j6LNiga3BYkS91+lbHAjAieW
oD/8serz9uvKt9uVuyMIE6oOFFScZR6q2wQk1d1Qzq717+8yPCwgBT9HIhfJIHLujHt+cA2l2L5t
tux9aNBdVKkk1MHv7yY=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
exhH3ieiewq538XhQByQWj7PMh1Y+pzdDw+4bALHgOXUMTZleYL0Pvhip/E5VwYBOb3/5i/ElWf3
Vm6OeE9b1Jj8xb7x10akeyRaNdCJYAtTqgb7gFS/crjXeoaYKJgLqCiyaB7LdWR9BiZOWqxEPSxe
/lr/8F8psti0kra2jACCbz94iU3qDIdZWH5kqd21Pp2/YczWpJBQzh+bBz9V+EuMAeZIzY3x2GZy
jOMZPemqiqFhSEcDf09mKK3xKEUxE+TPz82hd9ZrF5OjFst6mWMVye10lkzmY5Hmmx5Y/PVgPx3R
fN0tTAZfIDGH/YUu758U8UWOIcMzBHF6rytqmg==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
Umfm0FNxPKfdryB9QccnkcrzqkPtalTpE+R0M3D9kxaXOa1YOGT+9jGc1TRZMLcN5NyGN3UIZcH4
LWFVfGg80k9RmFHBDZaHzOXaomQhoPSO++ArXvmvO5zgttfCHEl7jypYkuPgwfQMfjK7YII9Deex
KOC8JtqORVWmhq47cpQ=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
cm7WeJnXtFlUdJuJH7wHYfinJTaBhpglyFWD2YwmOuS4fmVA4nXbX0IMaU1F1WGO1VK25KlFf8Nm
w8L6BJ6ZpH12xPIl3J17rMT4/3KHv9tpBWqeC080GeV5nISo8JrhOpIKa4+HBHZ6lYLce8LBAu/Z
EiBmDqw22aLsAuPAzAMh9yuHT5rpX9ykD9u0uZ5UplK05S0TsvYMUqcHNQ2hijt/lbxvUxXHTa+W
GJ5RRQAdw98wG1mc65u16hfZPsLimnw4BHwpyNGOPadShqb78rQihc+YiBTn4lgN1HhquWRGqCYZ
ZEjBmtWOJm8WJSTWtcpFEkmPlOTDmNX82e9mnw==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
a1mMNsEVIHwFCxw3sHygQ6eU3z5whgDQI+YHUmPAwU6q4vqfu2NVxu0z42QL1rV1rCsm39SqZ078
EGEqt7XUt6bdvI3yu4dU8gF+jou5njJ2UU34VmbOw/MQt48Hmi+hxtH1/zSlbNe2iOksDFEFTHmW
WGHgPS2bACG/KtAZMYK3gBtbnb9dtu+p5hxiQtwMOFnv9kQGBxcMaciN0yqy2TE5fygwKcNEua29
jiGUF0qgPS1k6qN+zLrYWkaVT0amR1MFXpv0WcwL+xVkxj6bBQhe5D7t5xCIsfLR4xqa5WVpa0dN
FkxGlIoufL17G/cGRr4nV4QP0sqcDCCHYpRoIA==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2022_10", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
rPFWI49JcHqYFxRrTG2uFixmE4jeIWIero9KijBFo7+FOCC7hJeSlCuNlwb8mBsI0Up57fm7C8t9
tb1l2QCfvy82JqTvEuH49UmS+8/GEnbK1QbVHsDIiv3/8cFn+0zw/VSuVeaN8L0yzeNIo8m59iAq
AQ9wOyqKFEhKKkbn+nVg+hQW3L/P25hisjV06sqmfsA0Rx4bYhFoxEvIw3A4x9LsBIIfDpgDsPzS
NICAEhfA7fWXKK6UsOmuq1NZLTDmFe2zEHijVMovzm/qqvHfu7fCt5POlGtLOPZhXGCDZi0v1yiq
VyT7JTUW5P/rcLgzkfyKToozq36lEkXd6VSaLg==

`pragma protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
T4EV2kKcg5a7rlvEGr4AG3uvv0JzSoc0NQb9aIeE2gsKGq0oLel4q0oZ7eO6He8noW5KEowgkY0O
xDnerk/R4qxdSePYeRRmUg3KZ7hAHVEQrHpQ2RbYwK5mUIpQLjxCWRWzBjeWOce2bh0dAMR/4OH6
t95V8b9VWpgepcUXynGvLDv31tVgr+8LtXlgWTNBiJj2mTZ3gEVxpgGRwMGsampw9yKqBKoR+/hg
++FP8JJkrOSdB2bhnNaD4fZotMLkhYDrWvQm9z6rW7fwxA2oEI+oUqi+K+82oiLzeVWy7FhVyzgS
Y273uSE53DWk35UE9A6ebcI/xUl1iGqwdeZihA==

`pragma protect key_keyowner="Atrenta", key_keyname="ATR-SG-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=384)
`pragma protect key_block
gZRrJLrBkbil4BLf1tia07NzGL28f+Pk9zyPElbTDf8NEXCsuwTum6RjR5lvY/odzAYHlcKxpG+6
gwjafT2OV5gHqqtPXrRHcVU4p5LEzOOl5p3puqvK+1z2+YpHqxOZIIZPIH9kjtzNgcBmcU7S2sFN
zTxyAYuLL9sAN+AIQ9UrW4MXDWxUtdkwPaSyFIvuKoxOKUD5IXEY9NtBpz1zsABMKNHneOO8pAix
qg8S/uQ/XJ8Qggr+vE7HDUUMCsijNXvqbkLM3xf6dXFpOqanKxd6/GfTcob4sezm/hMOZ2xiXcfS
hsYUMRdO9H6fmhECfszoK2XMsMt6xM+vlLywWJ0I6u468qVFxROkf9vL+ZDq/tMiJOm7E1p+HDif
98f5v1OybtzlZJP9bDMwWYcsCqcDejCMQyYOgPCgg+2jTR1JezxuK7PpjyliT0rnu7FfI/0tRzbL
d5YqO79RN0byWVTTdIlTWzL/qBD8BLVqXzWs3M+up46dGPxbkzv44od4

`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="CDS_RSA_KEY_VER_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
A79lFm/8JnoMxv1MOWkY+AtU24uc6/CeGf6bjoYWLJXkzzHQooKleg9l+jH7oajoC3oVQh/sMXdi
3QmwZ5SKMt6sb03SC5BW7xPky8zyP6w8FRMCI2Tz1/GhozqjIbgSstUfCaemxIgj3rG7GkRYZ/2k
ualG2mpYDNyaxz1lMYaHfm7stH/IQlkCh6HHMbi7ImYJ6pILa828Ls3VREjo7dtXPS2ZDFxreSIH
2SZ3NpLJO0/umchZaUkt1xN0bsxgtGdOzSqGDpTJrU/ltmclBX199pmrXQa5p/q0FSLj2WkB043l
l3x1Rdipn49DvChkvbVzJP9aej4kwSPhvxHnHQ==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
GFpXmWYmUY46GvuVucUW1VOu3+gGtLxYW4Ho/p4wggZ+jWrpUVhz2RSAxu+ufiLHtM9oYgKPaSYT
DOeuIJGTnxGr20Vh6Nn3cc41TyKAf0vxN2fGISEQQWrjh9OOgNcBmJfaHsSq7+5dhCaIWlGrInVr
GD5TqclLzw6cHAuPGxMi2wD4rq16RkDJnQbPf8ptaskWz81NxZfyWAL4T2E24soybpln8+vuF+72
IQYfLQh/dDDsNHKNKwTKAtGjpFS8eVSbYnS+k3Am4loN8JRflh0+c4yGUo4EkuRzUFiIBrJOKylp
qicgwQw7vdbe+yPl6moUlvA1U2CjJ87bsXk5CA==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Hzklq501x4qEym07A6+Vh+O6T5Q1srpTjckVi/KQ8/P6I6xpFqHBBikoKASz9mkWuvFaf6aly934
etGfnzZuPuKCoMPixevIcq9cgFblu43p0H0FR4BSbqN+A/K2utwAblPur01qwtH9nc1azxOtPedI
3KLsEBUN2ObidzkZIUbiQlQ72wru0lGZ5uN6iiNcLRnEhqjdjWiOHf5qGo+df2QyP6S5zRR7hGOd
N5h9/9towH2UQ++6hnOd4pjtl7PKHWlU92421M+LhruDkz4Bw6c7d7EVdbIcZ3ub+l/OnCyNwQsr
WUo2E+j4vd3zIVA0gzTA1oLX73BJ1oxwQdO3JA==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 84848)
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
