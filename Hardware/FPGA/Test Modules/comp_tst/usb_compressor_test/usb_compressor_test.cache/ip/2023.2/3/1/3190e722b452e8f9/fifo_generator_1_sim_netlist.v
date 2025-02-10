// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
// Date        : Sun Feb  2 23:16:40 2025
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
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE WR_DATA" *) input [15:0]din;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE WR_EN" *) input wr_en;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ RD_EN" *) input rd_en;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ RD_DATA" *) output [15:0]dout;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE FULL" *) output full;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ EMPTY" *) output empty;
  output valid;
  output wr_rst_busy;
  output rd_rst_busy;

  wire [15:0]din;
  wire [15:0]dout;
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 107632)
`pragma protect data_block
fW+oSTXC6rhh7AW6Xpro9qoJKn0IdCtiLtstFr52lVoDVBSIS1kgXmYM3W+T8qPnSt6igdTsFY8+
mqfXjdgRVrHsOptjZ04aJpCQk4VrbOxbiimGD03W8RARQfc+WmNN7XUA/XP27Uh6Pv9tTuMb8G9h
eNOYXeLWvG7EmhmU5zMODG50gSVLsCmXC5bnF9RCUOIFW5cfuA8r50WtSnKCDwnrufvW0rmuVvZQ
iTapNRPPtnQwX4EtHB1ueyu1naQ8pV260UgnuWYkLCdfeGCpY0uMLRtiINJuvFB5DFOyLEjk9Pi8
f3Qr8yOz5jcr/+cYQot6vrDe7nZyy2j1vkDuMVsLFG10SlstJ6EHrTLlcoJjsTBwDlstCmxcVVFk
UWOS8QU68zThkopJ9kwM6aSzNxaMGwV3lyTMMyQ+QiNdSGXvgy08Uoh/+d6lG3n53UDdaVeUYq+O
J94OiDDFdfJky/JnweXw3qLquCAln6r0aSm8uSdUOiOh+0ZleNv/DlIZJrp/XYss1UXdstcCZEvW
kknkfrUx0SOrxGfZDq4iFgHpF5WYLS/TnmIIdIghdNo8a0Bzc7rXdwvLRvD3IZTG8P5bZ04eZrJv
h1q/6+LZpGotYjJ6A5j0fXUq6pGHPn3qQEVsJi5JoskcEZfYzcV/Q8xyvc0R75a3BgHk2LdI569Y
BHIGvTqKsFraUzNAd9RE+HwVO5I0DGgWljiLseR/NKccid9Bhw9vImdwIDaQyLGbNDubG6nbop/8
59OSaw40enUpzipfXgB+USiTkXViLtZXe8K+/UFuIbbivVGU0KKCAMBvnRJfVGs2XkBLG3orqKeL
tKQN3lpc1Bg9Nzy2/gm/6Z3V3V50BiBMpHvK7vS2yt5J+TCb2x4+pKMjXONURxYX0flYMMoFCzst
EDIaPjXHUUuuEEqLwwAuwngjsTmBXPZ9jBhisLbBscCY4GU1hF9R1IEXLCLJizDCtT/3N4eaHpmR
0edY7Q1cBLYbamKysWdN8n8Zk3WjHXGIe+JMsXYXw79Sb8MSvE5ofjpZ3FUwWnqOhD7xX8/wRRJy
/5OWKF9Bkw4n6lKAsy61tzQZMd322JE+cfbwVEOBWNBz7G0bObTR0VGyxttIAcWdt5RLqbAuWDhj
A0f5XJrMi+/cy4iExHEK/h+8H8vSRE0ey7m6TC7vC5SocCutoypBxVcspsah8ibVK1WqoSxtgUbU
CYs5KcwQmsUS7ea0qi3h24s4zlhW0XiWiyOxdm46cgsOoaZ/x+qMJzdAQvdNa+b680SVyvdTlbpT
4TmsCMEv76oQk0GTxHjk9ckPYPqsH76V+QpqPhAzs9n1oV9ADmbUK21xVT+d9ANussVSJlvjxsyl
ahbvf0bsra9VLSVtk1kriElluSfodD6nf+5VBhvLCXe0EFBtdGlxt00FRBKCgTh82E23Plbz59Vk
RzJ2QFVU38Xqs6u5dgO4wK/7gn8vnHlo+RD/Hj8s6E4CiyiVkCnqydX5jaCrNcRqh75urwppc0sU
F6/BZc84KPLo7mo6vA9hwMX2rhMh68wfOU/kUxGVkwfg2ZlOeDBedxjwc0K4PWDDn1rs+kDfNCH3
nce2mbbBpCxdx8ZBVKnY8N0OutcqsoDUsVsNo47VJ1UQX1S2ktxL3+JjKfo0U/fa2xjFZRXj8NO7
knh35nomBXv6F5Zv5TKoL9cLB68vc7650kZfDKzCDeDjdNRqbHLTGWOZY8phTPBa6N2XxKMr0+gX
drJcujpALzQMJT8hqPhTDIU+2oeR5eGtfROvB/44FCJn2lccvv08iUKzwmNuY12DkEQrfKsm18DE
aqOtyvYHXmTdPBjEzHNAjNlxt5jyPnLAWSzqIFLIgWTe+4ziVyHTxxm2f5OwKp1UhOHJTnXmVQki
67qa5YJyT84E/bXOXn6BrmFsjEUGs3rAF45Dtgm1tX554c/9pPYuSAwp0yRdqsFYlpwcxOtota0k
MEmvujCFv6d0l/+widC/4GfIHjr8gxG1r5CVBoQg7hv+aOgbRBicmUxKFB9go2DDBsm0tkQ+8/ME
YtSAgRwleCCApl/kGD4I1/8ZFSc8zIFKqOSohZenT/VmyyGH9TIgjOryjRJFzACSCrjlwk0KL9Tq
OzanOAg6XWTpKoTo9UpWHcZO7aCVBIVOBBjnHsllX9GLRPxMZdp+KeXNJvA+Ck3kCnnXzxASnWHS
UoFfqQYhzBjzzuCwpdP5INQ8GWkfIxomxvni2Nmasqr7GDUBCzA4SECOVgnKQfXNcobIPhb8Pnvw
fv3L3MlJmQtzQ6aDrpSxNsACEZYfQ/MC1R/Ug/lt69Fkz15olhM8QM6yDTrBa8RXXJlZwDADKjqA
GtXQDhUjtVJMl7dO1mBooho9VM/o5YV9gFI+PrNmi/Ntq+/1mFQdtGHE8iPMCXsAJE6Vkp06ajwP
ai54jJ7H7ZgaIjxFcz+72ITGiLOk13JymqrfJIXMIgEt1q+/CG563xnq4gEWA0xG/wL8XDpzHtZI
7g7GvI0hQ9E6Ivo9q2wmbKzeQyUYw373QV08I6wh1skZAtWg9SH10gqMIv4eeodrugwTGXqBGrjJ
TbdsByE78s06U3ZAFdqd93OCi9NvFuAwNjfqwE0F5BWDjFXmt1qGEEkDBo7eTqZK6O4+Cg2BHqZu
fsB6O8uexy8hjAedlyloBlZga01nbNLmPXptwqkIsLPEEdGEsVGUIA0FK+bR+4pWnQXzN2BZgaPq
TsyMf2VTlNkozKqQPEmDRT6T6M27nRh6CtT6jLqqbZ3wxQW7slYUG3U6MezJpk37raawk55wGuj9
r0m2ztMQTP8kUufun0I9FdPQtv0KJI8ulpFFc2chno860U1Vr2CTKvdxEfyH1/hrZBN/AibaRsaE
TF96cE2yVLesQ5ePMwBvK8AvnnjFm0IaQ25v49BpWL8u9zVI9uSzLi/2kFH4oVqf5udEd06FC/SD
IDMkWCqBdIbTnpKuSG/k2DUzGzkvfxfyv9DI/S/yTXRhoyDLJUHKm7ihPFHU8YWJqrwOoWC9x/uE
/xyeKYGAwt+lfvrxq2ZsmuXLddRjV7W3putPNAbgm15NzfRUDWLwdcKjYgRL/kN131D8JKyorI+2
CWnStbY3+R8F6XpCuJWfqYX0y5P/B+9HC8xsENvB/ITYxRGlpCfJxtcu8+2dsgWnYm8KdCwUjeIk
GwGvFkD5hXROvEzSBeE+2hYCF12UPowCZaoUMmg6cV6K6ZYohlCiMwnjYKEXwezRcGqniwtYn1bJ
jfdx6ABxgnpVnanT3/G5X1vhAgzQzpaf2xZPDEZakxDSbh3EIB34JnQic0WX/BtSxWuovKxzJh2s
J7Er30A4WwE78MHJPDbOv4Zl4w6k7Ghr6fbzNRtaLEw2lw/hLkoZ+Mpqss3tPBTMt6MZ1RpJtzkd
lLJtRDA4vAn3bWh8eubreUPHKJfm8/Mqp11og4nLl02LUlAv84YeReM1bDAtLVALOc7jfjde7Oea
t6xb6CBE1mH4hpDOTK49IYz7ux3R2Z5SC6sh4frTEOVHTsNb9BXpPH2SEvRYKwk0/XwBTdIgptwp
ovuVcRSlZfq9F1ipuLGFCKaBjoVUj8fn1RRXDBsvI/OrguPdSH76AenJSheY3Pzdw3wWgy+QXJ0P
CsJVtu5j8GPatNQaTWiGNY6/Rnq/iZWbDj31G670BDZueTy7FFhYJzDo6xcTl5rcoz7nZKzLjlTx
ahYQhRUbKPHIzwuZk/170d309chKMTNtR88QALPw5M1/uFhy9PRuBjmvsQa/tbbSKgbwYPNzLGMB
/cafGM2tnSLmHEBuSEEi8hFob5tckFILxh4+gZNYj3Z26E+dLhzwwACzVjhYrMPyXRXWGRDM8ucZ
q35DUWdg1VphdiA+V9hyL5Q+t+u5huM94DKrkaabrzZpxdk6PDuwsv7+YnlpSlJILEkcsroXT7dS
7hyyKZKsQCUnqhCbXTQZsjRRKzGs3S0ro+sl7DOxOViA8BeCC40EOHrogukMdPBoGyc8Ab7DgUPw
qgjFmOt2uyEkkfO5wJCcg5yCllpl0ehV36o6vKB7pLMA9G4Ov36r36ekXTscIIJ87wbpb8yGlJAa
lu229rZVAxhgMPqKtlr1M2e0wNLrbTZyUIYe6MXYN5fm9JKBHK4w2hyrxxf6CF56OryxPnQk42Bu
IwFzc5cvgWBFrMKaP4gz516vR5spKzgTS4BuwVKHvSZNEkiuk0n+Z0BV3a2NkWQdRamxGc2Yztp0
ecie9DeVCS/dWY3pr7eToCy4hx6lJ7RUy6NoOqOg4jBGjHSCTTRWeXeTaG2RGL7ysRG4bwze6PRu
dz9dMriwvBnSl5352A9Vyqyu0HYXmjhdqpE1umhmBtV583XGl+eiggADUVo1SUvPu7DgsOPCboE7
fRIwwAQ+4DGvpRfdqMgBmllIy21SRnAXmZ4awFAnP8OZxLAyaukIJu0G7hbK0ZVYK2pKumLeEneo
oOloXP7RjgvG07GIbEZ9qfsD4Zn1K8+CbqALHiwTcaBNd16jY5vEqZ/vr68YisloCtDaY5JxKxDU
CVKFPeKJwiGEZOEGsb1Cwkj2xZI46Baw0J3pqoOs46sKVQcwrU38XrfC5fXMWcal/8uACGQh1ZPh
96YRXHSd6Fnjd1/Z2Z4VVuRER2m2z/zkxJ1YdX/j9+rjMWkTvsFjSJv4L0yVD4wPPx6DyLhbGeP0
uRRokk4elkZlIYS27ptkn9pijVDSujCLqezbMiUPoxcMI9DFGLztgHpAu8lr8ZrtZr6CIa0P5EIG
svizOGqaABmD2j1zlxfGTFex1LDTRDK0X5yzn3ZkhmCcbM9DM8q0Je1gYTV8t8sEFzpxAfD+/Tvc
qCmkJ/vtsfScu8JBUcExNh8xxmeMGjJYGaP8vWQB3UQ5BzDZ+3aIJ5Pf/GwHEeVWqkiBEbQqO5yS
2P+XvLs0I424OL1M4M0v+S7PpufvSLIV+WMsUdYXpDrl0kXBxFomGWo2U1B+ofHzKflMTSllubsL
WEseCX1wwKEwUmdTxTftp5TMJkHRACsX0alvXugFmn8j48sOlZtP23WjYREyzr3YmXwwZW0UTlLR
tYRhInW+v2i15OLL1DX/BrwRp5TXe5e7NeXnPJhYLgSnYXwZ2fttoFPtt66Cl7GUKeu19Kt0gl3z
Mm/fGx1FLXPfEQ0H0M4bVAa4tMiUx8jlYHF69oxX6criZapCyg4cbVBmH5NyA+EOHmTKN7lJvKzH
JXW+3GvgqAx8YBQa/Kuo9L8XwqrylouWLhca6JCcXpY3wl7cDxaANgIw1IS0Ecii2Nx+mYV/Derx
lIi8y5wr8RIlkL9lpwRMyppr4VkfuiMipZyYxoXb0gZJ59F1T2Byj9Pb8zkUZnwSTnk13MmU6kSK
m81QBpYwbgmFBJom97+gFKEh+KAPtqz8MOiqW9bptaezFOw9hwbfP4uD79dJdVrzKy6R4pSy5+Kq
E1DXr7hFDMrRAqFYz7RFWA+JijsqYbhQNVxrZX1sl3+99KnoiAhjelASu5a2mCvKluUnYjiEzUCu
jqSjYq9r9prtunKDeMlcjDoyRBBOoVlW1HfX8KM49X1TtUks6fGMjRmb4/DwkVBlNKqzvLFVnN07
Hi/41mQkBAidCohB91Inbx/UTvPHYWEJDw2HF/vqoearl1zZ/h5QF019SqyHF7VFhCUqQSwcV8t0
ud+/6JrKFtWvWkvJdDfjjRr4Ng1UvtYKd2OEPMljprsxR2mv+mUWFgakU4dlWZ6icBPY7iqCvDkb
gTriDdG1vLxwQ6I9S5OfVQ2mNkpfSvIqo8kYy6rNKWla6qVVkEY+NFtelrALcv3S0kXgRThMCuvQ
e0ODxu9AbGK2EftUiNTPuieOE0F8/nEntHYcljd2c751WGmpbA5tTucSzk62Kq/SyriNzAECU0kj
QKLB/xgzjkPNH90OrZ+Z32tJJa23H9ijrWIjEwIHVU1p6b5XAOIgjj05ktHnDAmleHfU3Kp7MyA7
cvoqI/f/4WVoIh4kMiQoOah7hjmfUSxY2JP4mucQ1CXeuUVGMRFReq8lCfZsshPvm1tdu1ZxSNWS
5BPlm0GeftSPApXwx9v5LM7l5RYf03Fk6iVxnraLKTarG3nt6hnvVekhmMWp3DRdIWgmoaehne8j
gHYnjC8jIQQO0aUzXvAWaJflecVSrDiHhDC9jp5NgDqizLNTrZecNYgbGq8SPzCXwiwG4VLYhlqs
uMLI2V7078xiolr0YicJoRd7fvviu9Pl6oILSw9La4nt0aGQVJWbWFRWohPhB/m0OweTADj6v65E
CA5svX7GN2EqGRA4mbEV9fFpnBCg3FFNEexFmm5FI6dtYDDUMMwgWq5YhLDthgk+4slRqO8ZIPoi
CCFt8JyozkgrO/I7acoEJVOgIK3g2t9zKUJVtu4U6d+YrVyLjk1YxSmkSGky9BfVvORuFeuRGiyp
62EaMDWh3TbVUf8RMRUmbgWDLllpDjTUbZMVrMnUa9fNgAn941b3RvcCdyXS+FS8yr/eN9HeaAk6
9un1+Bs5DyJId928XsUewaQXV4xKwzkxMYhyVo7/bHoN9ZHTjtRRLKshLMz9T9wB6temOyd4wOre
ggHwxBmkEaxws2/b2NJwGpFKkrta1ve1AHBNIk9COw3px7exZvdkaq4gJqgG6HDDNPnAJM23J3w3
4A0JOpHY5lkw6YMU60VJnbXbewzHDXh03uOQwB+fseN8SQktGLeMZP7rro7BAufUlkfPFr1+EN3Q
ahYKj8vop+0e7jr7UiKwVyqUzEkEF4iYGOzUtVVfvIxbLBvjILO90pHbr66V6WOlIOEmS2sRCNA0
x2uAWbf9fVwg8bz1i+mMPwur90ngJ3IbCUHDwTrfNpFQE4QcjaGsxSOIylT/LQgOoy+2pfX2VOm0
o88IkJSvxUAUansR8IkLZcc7DuCE6c0/UTJncEmuSVsU9Y+yC4SaKPgK1lNRgO0OhRoWPtU6UKCj
8X1zWBVo4L+aMWoHShRZScloNl9Iot2hmfT/17RPJmHWrgFUMIgj3Y7YsBfu/ElEi20vcejEA0QR
+o3K4Y1gEtJ2TMqFw6ccSxy0SDVr+TCN3aBsegLSwJkCoyjjdtiIhB/MbTe1V0t9JUDNNvEVVCRk
bDZBQLL3wn6AQLtWqs1pz8rjVz0qqTqVexZvyjDmLVHCO6OmFF8mW2UzD/iQyD5BKW6pEYiMrFtd
PJj8YgbtfieX994KuVz6wa6em/Pukuwd939YjL9C8bNSpksV0773li1J7StUSrLjavJDqaXIw3OT
1+gmPj4hy3qX7ZMW5CSjjc6N5N5OCuvBdPQPXrMdyLq9fBFFVyh7xRCNjNyFERLbgYNxiZE4nnII
t7mCSqiKJufDv+L0KmoFwakN94gwArZNeszq1LUVYRXCZBiamFlGd7IX7U3AFnhZJl+g5Bf/8uMH
Bkz7KodbY0IpSMTIA75rctH14W4JP0WOzgQQ15cNn6iDyo9bPH9bxodisQA3RvIDryTg4QLbAqRx
Oc7D5K8Q7RKStQPabKup9XBZ3TFTZD1oskIuEGTkPHB4OiB07uk3bHitrDFJHNyMXwyK02PXPlZm
Yy6ZqnBMr8aoAOdWBVb5LhCdyKBvPZf7DA+q6R1sQeXumoOVMvfzdRjVSZaN9b0fHYKSDO9XB56+
u9N1qlC1D3yEfSBEaA6cyA/XV48/O8PwE5B2j8GgQjK0gGfx0j7wanG3ZHE3Ig4615uvVqrW6WvC
lMSBjzIP02YdC6o2BzViIyQFORThpEEbfMz4pEZjZNDNIy0Wx892zKADS5Z0q8Gdh/Gt1o/+OSAn
GmX3VRkLUeRpP0gbDGzvDGmy5Fhy2CQT09TZE4nMMy5FR4npXIUWtP5zJTCHEw8tiLZH+ib/gN9z
C5SH18F1A4Spx7hKGahop8n4XFdHfuqYHMWBV4wk/3Nr++QwC7FSgqfnmlB3tZVw83P4+VEOzNal
OtBPxd1JOtDyJCdmw79KFH8ltrHQC8T7rcPeb3I13e/WVLoX76THdkN7ccfvEmIz2y+IdVh09R8L
rsRMzcgksK2L7yqp791fYhcWLpVRXV8xpdai1xoFaV0rJ94hI7DXJtEyH8Fi+O6Le1KWt1mTKhWN
6DBhwi4rK4s1sgCaDeod4Z4b8XLhcX/ibuKGzn1xGbwdxRdzU7DgoWzm1Yl2NbQReVgHGgwtUAkD
baRCGeR2MM3rI2IE6aGkFPHSD8GpwVOAXPmz/z4oFF8XKzSqO/GzdVXGb0zzW5bWk/irLmD5pexB
QH1w4X5rmgfd0ZowkqABQX84L0V4EnRXpJGYGYAM2drNjj37eJR7W6A7bDnUpHeXIPZWxksPhz2Z
Rgx34CeZoJiAxbBvdDtm+bQklymKpWMBhcoritk+6FPtzgDn4Skn1zH7vPBn2duk0b2G+ncW2ZW6
DuIfHO6v2+si1jjk94Y0DYAUirVCGdRtReREbzudGWGLa0KX9gElbB84xB8M83SWY6wC1b6DDp8i
eBpsbaN6oA7tDx/iuMSqpppapBKewYRpYSb8i6mJntanfRjuQUoskDVF+z8tF2SkEe2ZR/Og6Co2
5EtUK2aMy5b5A4yDJ1jvtrzzvEYv9AbWPIDxptCyWSoubFxKXPeCyXEij/V5fdUEObYUkaDUteM+
dS0X3jEqiqR9A//pcLAzglFqY2O0VJkpQLg3au2J46dCcQiaSmP+3td6Z+/5N83033+WLN8hEO31
KJxmaSvghbNIctxrAzF4orm0Pk9BiteECvDY4cg9m5JxqIPr+ydN++/W/8Bv4Zyrc6VOppdYZ30p
qVpSYkBsqQA4Q9LFGMc8dRdx+RbIg1yHesVa1DcpsAcDNlNxVP5FWihfamofDB/0mWlqLmdKm2Lu
20qeh8P8nTZbClZKigi76fNRdUIVyvF82ZrgbxTnIQ+utrSo0OQUXUNJylNRIT7qbl5jp6ROgckf
xjswn3gxkO1SlgcDvPeP0Nw/eXNszJC3OlUlfLqUTkhfB/lpXVRpnG93Ipd60uIkiiB/PHYWnisk
oIP1fYMsskS6Mc5UfJYJ129DZTzKH+8vnTQcCAcTN6cuJU9qSVLVtySp7WF3Fhj8isscxYXnFmaM
Iwrsct7YGrRkGnZcBKgB1XigpopJ3DUcq/oz2Xx4aI9YwHrE7g2/1OyBxevqlBYJFJHdHyZnUvhm
XAS8rezoptNpKO8POMaXs8iwwjyYuf4upyWO4Cp5hraVAfL1iUwVzvWkt4dghXbEK2GIzfB01q2O
onuUtfQzsAyNh7QpPNOPlMdoXs3znk4gWtDPuISse2ROa8sSdsyv+9pAEZ8kSAjKRDMY3qy8PVQp
l6XcBBLSUU5qovuWyiwmsGfLFTWNv4t6xsBDYvx+yl7UyGZtv0B1Fs7a5SScz2hngaZIJFzWR8Qj
9pQpDrihGB8RZxgxrzoPvIk/+alKQ/tPdZ/W22BQ4ylkHCLVgRSXeTjUUI7TJ4ezgj9j/AR3Bu64
PX3mwH9UvCZwlN6UuTV5WMDRvx5WK5/1fPP4KRThHKN0XJQD1rhKPQ4/OtWGb13RMAEQIKHaBkBe
8xlxFb5nZ4CqHHactDEpk/8/W9Gwm9tXZPeraPSHmV5fEi5QI+e15zuFfdQgBmO0MfKGPOhsmu1d
i9q/Gmoi20Eub0wJNULxYWmcDMDiA2OqO/3Ho/bdPZ06vgucTKKJRMNZKisNKD0AAAzQqChS4IIZ
hnnEGc/YwWZT08SX3XWBze+RqjCEPdFxgin+XNoFc6tTQ30hEwu8uqWVKF1Yx7D9eFTsk65uOusd
/KT8e5ItAw3rEuRE/vnrGVIk+Knvs8iGvpn1+FgrO7VvGaZoypTpVBos5D3BqD0+6x+1htm4R0s0
vjJOdNVuJvsP8S2ErK7YYpaWCDwq+5sjRmbBtlZotJ6GgCELpz8IpLwNHxxLTSuEPG7/baGLbLd2
JV8JFDzJoh7IoVmQ4m5MPRkaXq4gsipuybIlE1ET8xP6zsnrcnvFyG7WDqX+bFlMTwjDJWrwgl88
aCHQWi4t8SOH9Ht5KzIKTsnf6DZfuAQaLQRbTs/rFYsfEtDGDAj+sPXAuu114UitIEBjoE3oKYKt
Q86rxh3JhRGikaFgUSYPEO85AbZ8072tHV0KicbHoJwvtc7GiEE1jbnagtzH0v9V8HafCV/Gw+Bg
rXA5oiCDd3Xeu4eVCe98E9rzETw1wsAa9byNNb60kN6Va+Osm9obJz/25F259DBF8MSrXVLD5H3N
YrMi+Xpf07R/qDX+C8ciKmlo8FxgwfGZx1CmVsqp8SaRnXJ3/M5DW2PbAlReL6ppYJCAFoqRzbP6
g88BloEfQN4FbwKG99zYFgvTI+jzS6ZUxbchUITM7MwIQr4jxsWSmiDm7gCjcyI6D8hIUAyj69X8
ywVS7Pw9GmZ447EDLZGrfHa3hUs/74CXPojXvjND5V5Oh+mXqnO4vHfI2z3AYwRn4wApm6feyp1+
NJ347ay8eUVrqO9h04NdZGnBFb+cxULx+laxiMN1/x+2Mq5kByJ8LbO2xGWdjC2wmd1vzPMZ8ht9
w/k8GI+zcc8Bb3S1GnoIWSdMZoNlfSoFH/kfftObbHf094juFSWs19SGmnd97QHu6ULjM8oPJvAI
dHEDdpYPwvVexcclSNiKgvWctUMQlUbdLUsyJR52u4cV3CHc3HmD12itGx16Z1kconNUp9FSDAVF
v3OlEwYX8UctauMzMrlzAKUggLsxfAg8nJlC/SDWSbvR+Kse1gtsjy5DlE10QR7E4VNVstaH09g+
bP1VvRxE536MiYMmpvtyPEeqvG0DUb1UIqWCqWQZWkEVMoAiMCH9kEFQc8gyxCvwSsEkg6fu2te4
LkQ9C6MTVDUYJq7aKiStsXYN2UB8WOtqW8Mqlz0gwCPwlWpS9nqD0fElIYLTHro98utOokNav60a
q94RGEQpNPoKckQNXU64WBFGzwqkPgTDK1to+lpySPYZbxNXPBiGZ7BUXkiJzeQB4WhM9abj6i0i
PvLxx4RFcapJcwDiWW5aIIbfS25AF/64eOIxIL/H7EsfPqyufHQUxRBaLfVdSCzFCtXoM7xK75j3
+WMaqJzBJzMferP9RTHYwYQDEq37V85hEHe6YSLkxMkxOHn4diFmJPfSweitBVuwQR6Z/QtpCi0U
BQ9KTy5K1Smc0LtweKCICAVM5WAK48w8GcBkOnHhT05nESjgdubl0PIph5sod4WrsIkqBb4llEHt
vLH7rl0dXM9HLo8H0Dr4ihOznebO/1EBs4737+ZqMyA1gYgydtCZLOl3egSNkvP05kae0O4B/9+d
VsX6GB8sIkU998ySZo5qpDepLIpYcYL2Cu/mx8tfe52hCcSByIbRx0SY1zCku+1oDWedDUcGVLbN
FSNvXk3mrKcCvx21Mcq1lgzuSltJ0Ltae6QHFxh7e7z8PVKNk8A6+9nv925QI7nMlS+qp8CSmP2F
MXNnaZKuyos1dOjlYs1gv776SdtXXkPaQq6/wz1rUlvUnaB19f8/k6zmwRUXWwl6YLge31X4e3dU
9jQa4u3qqfd55tkN0dxC3r/RGVZTaQP4jiuauutdyCv8B+uE/TxfUjGNPBGGaRS5u5Fd5OX8wmJf
pT/HpVYvxi1QkZRFVWTOwfYQAehOyAbBmgjX3FGzXj58AxIOHquns/hM0jpz41M5F8sKHLjw/hhi
W/sCNmTic9kfeU10vzqmdXWVbltj3cZDbVsIuNDv7L871tFdyDRbJyDvusL8fh7ROxZymQ2mau5Y
MwZ4pEjIzupWLIR+zd81G/iJO31nJnhtsORHLR+nOtof15NAt/6l7GGSdYdmvxlArS8OIrilVX02
ItOYZIk1QG7ThUle54jrNtGnQd+Asjz9HafebibYqWG4fW3sg3jQrXWxImWPXqL/zFRvdCqQDtlQ
kGm067PPBMwjjh/ZHSkOSDaRr3728+LPRBcbNjBB5yDeb3ESQH1Um9BAu824+oTyFuL2HmWMwJMf
gsYadHXvjvgU8V3Uaza2LbWwVfFB1vENmjDGmuEmP1LuavFc2bYHJoN6sbL0w4daXZKnsav8zEp7
xzyzABCeCXclt5n9GkpoEiQJFOIgOtFITSrel/KgEQF6b6X7go8Hc+Mqjwhi4/mHRnVgYrV/DEw7
0fyNaJOzK6fCBxsW/Y8X+bIK7j99RbEySvreHijVFXRqYSxwn5N9q5XO1iJv3O/ouV0k9Xmh6jBO
BF8XUMO1BY8Y58DKqVoInprNtXbvxIGrkwme/wHjOgK1wiQv44/bvTXLQf6pZGu/+pFFhhB0VqKL
a7TjwTbqFHen+w52L0pBCWy0SZwjffd19hBhp0Y1ieo8R3p6QpRzMd88NY2xsuN8bmk4XY+Sbbky
lsPu59P/aq48D4YnunfOdexbU5RrfScGdUVCAjDaiWr2Y2ni3zQVJ+dPCtimcsgYjNoHHqp/hePz
HhQ1McS2GxbOL/y+yYiNISj5dt1+SHD1P/fwUxxxotCA8FDZ7VRbvwopSn/rspWpODatx2iswAgy
+iP8kZ61nHXP2UZ6zdmYIwHwZO/ZkBfBiYQo5UsnMzd7btnIbK6BCw03ZiPXhLMHOFCELm/6k67q
UBDUVrdTjqgNS88qiJetNCMHueCsyFPjMxEmkYHX16GEXjHg2T6LJmg8TdIDyuEBnffqhCJ037Rk
d5SvB5bfxCMYqDI3+gCWTMSJLJHc+T1crRymqVg+HG//bIKSM1PDJuS9ceFOdx180b6ko1gjJLdd
EXEePBOQswgY1Cs4WToDZGXxlHvkBidtH2eX9SIGnbfCvHBF7SIHFLb9I+ceTXDJsQ/XIGiLPBv/
mMJlK4EZxygBHJ9HZTs0FbKtf/prfCOeJQCf/knyUzE/sxKGtORMC6AN4e9RA4V3zvj21MCM5w0z
4WL8DXOmTPubBwG0xcEGJ7lMMy6lE2qoCuYPPixor3qLroXMnZqr7SXBmx+kdgAGc1Dyyx+kHUsP
9rxOo1G8049n2VOuL0dLZR0I/1PA1emjAWUhpG6y3WakF7MOu+qHL5q5zK+2rqcnT+3ICm13IDBL
vDiGWf3TbSRwIf+IErSUXZ6LNkr1DKC1p01no8uvFC6tKhXxjQ8S/yWWfO/Mcuf+T9LBPQFeXjUn
g9fOSjWz57jTg44Ff7sqLzyGnOmoF6i/GCAHeHUr5mJyLHXcmVA2eJeAy73lStva4iHk0tqa9ZkB
eNu80ZLx661GuNjIcoz/5soQzbPV+DP4IxRVCbh2ufqjj5mOCRb+xIg0DnnAjYX6KUkgNo9Lxpi3
zqGrTKd/wfVR3kJrUMLhXVDbIbhM65GGTicOp0hsBqi6jhE0lPQyLgWhaSm8lpOF4cj5ITzUWSU0
WFdbePmmo98pzx7bb+ZeVdS2vZYPJx5I6Kr6kbyk3cbg9xK2C4iQtEvjYVR2zbbs8Gjz28PF9YHF
t5HYV8oV9Nhk+I2iA7N4uagUUa11It8m2lUqU9SXDdqv8dc11cVkFHdjFAnJ9U1kj87CIRPd3d+1
Wd0yg3XT4JW4GzDnAxQqCzdy/dgLpvkAzGZzaHV7gCDc81EtDYqDfKsKYwbPua9mmFMXH7+8XH3H
nl4J2Zgfc8X6I9GDJ/6n/al1J3YpsuS/nCF8Ypr0ui45U/n1MwDMKP3y/1NY6ZRjcQwMf5Kmsfq/
t3Mt/+rc9I1/NNSZn37JbvAoL+5oWurjhvlTfjJ16ISPmemOcH7p9xAuu5atQaDI1uCxDF0E426J
Wn4vaKi4lDEFE834k45KuyHPclvyMeDHuB2bzwJH4Fcd7iDrJQl+r7Qg5/GLePMCsSkvAHEbGOxv
Ek5vV9NfhIU3KgBSA/6rfY/rMtulRmbB59ZeGBVjrIin2v7e5ApB6c/VhDq4Go/PJaAozPhi1xBt
4tRtox+CewDA1hoXcAHZIPHrPCTPHMJwmcxlA1sNCOOIT2c2zSq/QeqY4lh0vjcxAxanjaiYcTQ8
0LhmV/707w61Ggr7s6uqr4v/Uu39OJh7h57SNLaq0fxav0WZiCnTarVbye03WVDK2nqcWMTV97+l
1lpjEGPaebwPAIBeXCxnDJGgVlDV1O9M1rKrWofMNah/qfbw77TrarrzMbP0LHYj3NWTmPe3gJJm
7tQVxnBYPPP7SOvVt8qA2/IaiB9ONeViqmg6B73zWS9ORqIeFXOffBgjC6ZdjU1A7bYExV+xi0ba
ebBYdRHNyMqYWPrBRIkB9140u179Cq8zUoDiRK3mZ0Oz140dJkgFfq3A2rdY5XWYorY8x+T5IjzU
iOXYHodHsNPblqoLfzamezOMRQP4nXnYUetdjW5Ovzrfq5sftW3YiDKsgSHzpwc0UmJldlyfkRvH
PYWGFx+J5SdpmJuIxEZ7h4Y7XeuS3qPmjMGjfcKxWtVShNEgQkthROYW51Cnxtjm5i+HTnwCYIiF
l6FPQBCw9U9KvThdZovUwKIvnfQ06POZ24Tu8WJi3u6KbZJul8VafHaM/yXhbRXdpYlAy9dDLiFg
k00SEfNPRxKt3eXPzRF1liTc9mQMMTmsTAfGvNgGsteFIAIcU0JrF7hXoW+Y0/7McSA3LcZ2xMJz
w9YhjnaQfhrKHnkjjrIke9y+PR8ZLkyx8rw552TOHnurQYIYIzH6veJ1vEtbvjUF747yV9jliYUw
B3vZAA2YvaAFz2XrDCgu1rIHyT/ZJsKP8nqqM+97dimVV8TC5yltuUJbxusuoYIJfwUleybvtoPx
SpT57RW/RBpLM9hx2/eQjXz0MYHWbLIwnlomQ3Xu2TTM1Z+YEZl6eVxO+2GNVafZJlmr1Zu2uXOE
Igbf22iohqRMxfV7GIjQGMVorETZanEX2nXHxcOE5sMP6Kj/YyVVYIjqF3Y82SE77oOANQgANhII
S6MDQd+Rl25toEMViNorhGi4oaiF2z2DvrSpTjsbDtj3+4u3mg8hMGH/OIYreK0U3T+lKfJiUJaf
DgXuHMbxSe9RtLaDpIqxVSxF1/R4fTzx3atwfc7+RlLvrd22Aj1QpFmvC2CppTwha/oHGSbb2nCy
Z3/7NptU+0/OAfdL+ASBeSF9wJGL3Bnbj8RpyzcobK+PBX+2gAc6LBv2+ZwjD6UsMcCeUK9MOAcS
QFz1X35u2Qc7+zSy+Ub0IlilCIaXFZnKzENuAvV2sbWZI0m+n7EZApeNNj5DDZHPcxi0gLPlTgND
446h3GzlgxWCUG3X+EUJbkEqcaU5EFvhAduJu9od6DguRmZvt5LIS3r9exWOBaDPv1z+OD5wM+5F
Ttyf0TI6+SiVcE2aVLYK+8ROt2wku3a2vDjGK5V6l51SUTg9LWZ/Skw2XRpUF17Rym9arHMzIMWG
suUwBK8eiib/PxSiz0TM3L5/uRbUFZWK4a89BQCpU/g90L72HERHIDDxzTLoJawJbg8wW1LhV7HQ
+XGZZv1+AFrDdaV22fdQkK33IQha51ZK2jBT7Hx68AIc9VswMTYBR53ofFLDy0MNU8bL/GGd/SBe
QthNJdTdXoR/U5JmYGBk4zDaZqfBtU//LivgkGGcla4xBfcji+2VjV8CLj61Wb46TOeyxkwmt3yw
yKrDrpCQgn1yDC2J87WDKt/WyEeTcBH6fREY9223fSHoAKwu21I6IEJxL8chCS4yB3XXSfCE4l2H
BkF9Dc/YPkYUSz7HL0J6bg18RuIducNQQ3dRyV1V7Y+WcxKipgdgQw19ZqaJPKcnjpr4gsVoD4DM
m70tzwf5Jbx/93cgraryi2agfTWmJ8Ck8zfDsyFZDEucdQsVl0QXIiXmoOFbRf/wx30VYWab7n8U
F6ECKd8xm4vvHmk/WVLzu4z27X/OLt7tmr+kAcKWSEQHwOIsYvP6i8zNXfvRLSMQnTdRv4TAF2+G
fxR38qEIO7UTSuxPLp+UgZSo8ChoHJ5nSkBIdCVHdJuWYzRLtWEK6dv8x7lEJMqj3UCM98jvZ3ku
lH5WfJc1S7H6qtzveffeK3Y6tTrResTuxprAJsZ5G4StNdKnsHqMsc7CPu4ybtrfctW5TtF0445o
wa/oaNjXzyPfW+SJ+mF8+WNv5cNIBs8+M6yCqUpb1f4iUnQ8mTCMfd2Gi2EDrcvREEJSSYMrzIqF
adlSHYWivoLYdXaBz2Ux9qyMwp5ltlZO57BUZWPXLttAsgOt15lumYXUj8Pc06hKDfxzguDpErMv
IYylp4g9DJDEbJuDOnsOcuKw4QhzCuTNS+soMG9Ujau8xuEQ+YxztbdPBTRPlvl3l8BgSQFnSDKF
gd87CxDpLZYBlBq0qm2+ZI7l9H16XPukxTQ4hk/EwdsBim0kQg5zYVR5Op7jaFRvVGstHsVY61uT
KAuYEcfcdTTK5MHn4cG0/oH3pA0DUMM5N/jxunbkYBGEg/dJjU4Kxol0508kluDA23C7MVg5ZhSl
afe2qEd4lJ6apA63nH9UVpscQ8kZychCF/R/zZ8aj8HEM0S0n6kB2oXzB8IzbxWhzqJyiWBkgo+7
gcGp5Ht3t6hd0mQ7SWbR7FRS4W0OAihptXXXlz6upCu2lvs6vgBlDXrn00VHAEUEhhSb4z3vmweM
jEiXk7u2vmioP4FZBugyKkb38+QIwpT4WQ76pFa+ScE/tS3nldFpPi867Wv0j12mHFZcgoutC6T/
K5oWJLUPQEd5IEu7+WFuubktnUqaARZw6zHPeNfk2nbkkHtoG+0kZ1zgrKAa2JLzMZVtGjpt7pxa
4vPn5NPjUXwGqx0exHJxPLO8XrvaFh38Nit2EZ0INfLUSmNbILjK/rLnp9IpQAIgsjYROjJJrW/8
00zBVRjXLl5hFC5MrN8hdbCf7LObslWrG/OiNwocxFYx4JP9dMm8mA0Akcg9WmioaEuatD2Gwqo0
vXJh1hzKxRwcZ5lK/axLaFj+Nf1V4+E9s6G4ynpqVnFWru1sx1KU8n2aVH6WPTlNPvQs/TNCVsat
KAQJCGFYtPmeGRtvUQo0u6teFq2yKa/Pz2vNny1/iNyHL15foV/L5nx9hY+axXeiARz9a2rMbUfi
aXwZH5V9MnfgbIo//EnrIpvpgIdEPzXA8jNQj7THdNtGjanVThLAzoKD6pBB8GLFY0nc64N7/0RU
2TJm+OSJFQbkdgtgqAi7U+nldIt73+te+GhV7w83I94x6LMCubpKD5rKO6qTeFIxdnI/COVdqpFT
XkmJCZswZ8Cn7AQWaIhvVblYVqWtoW3LQjhNgjsFn/IFThOwaQPgjz5SjuuSkTqrnR01lkDF566V
rUv/xijihgk+bPmEg49NSgW5RsH4+TnCJhvLAJzMNwchYex/WADL5qFKizXrtgg4iS0NciJVFVSR
gbHvAdnixggDYDoO9lOv7z27jFgzVlI/YXb5SAiqWpVbKJ22WV97ylf7f/tGmcEqPVhIcNZWeGk/
LMZXEzQkZsJgc8cYTHQs7l0mtzh1u++fBtkNj2FImSo99KWw8206v1PNcnqSqelPPxEAo0RYYsk3
j7YqbHmKN/89UQ7lb0CEgYX6N/8VnpTd60fbX/eNIb1gNMrkQ4cxwE83MB/oVEEE0PxEFT4jQbil
8jbVzk26abYB9Jguet2vRL40Hdm6a9e90zsXzI8hxxTb6wD7DgRvVzBCovmBWw8w2AanJ5oakzbC
FEsPcc7oJUxqa7X4U6KOOBXMWELaYVBEgk78/278vwpHtJKhzJ/BKmWjSm3iTRZWPqI9l9UIqG9x
c9JZW2X/ArZBeCyaFWhd2oOAWniJScmc0Xf5aykXqgi+MDIhuTrK07sIHvZNlYSl/vyyfA+Uueos
GLXhvx+GqK9OPYqevBGBQnaHLnOw8c058W2SmwSaX38Yh2T2AD9tasd/zOkaS9ym1SaHvI/S5cV4
Uzw/4bQ426yO397Ox0EyX5ysmM5wXKFYqC9frx5mR783V1ykGj5uXrx+3R13P40yJTujSIgXmDa9
gUJvzh6l4aAOZjtrgmJsIPAFKqklHvCuzEWZmsYUG+w1lNsVAd3xovIMHMHBWx0zVvXT6rmeVDZw
g5uIkhZCrqXBfNZeEQ2o2rwWIFbBG1QqMqddHqpCd7ZcaCiyVzzveHZcUczoX2gXn1U8hKLwt3Ir
mdP7vDMP+OpnIs3vVQtPtyTkqflFMe+fD7210P9nVOf8sTj2vIdnZUVgEhwsvZvOYEtjhr2R5u94
4njuFab4d1ivCzmOCixcnW0JAtiiasldoaVr1cuchOIvnLbt2K9vpdOM2A3TFOVLRF7NtVKALHYs
x1tGaMD9GIzfX8R8gfKP5rib31JItP28anNbJqqIQlmXUJ3f6H6dQbk2V8imVT3zpi0P/OouEmro
S67X4+74Py1aNExksvR7uccjr3GDmhQmBjtMI2mb/+yLfXvondYGTNoFQ3CNmXVm8ZWy/gZJFyJJ
IKCmeHkfNYZi9a0cAR42hhb26/2SFOenfzqeUQ07HJMFgZeE5n1lWs2wakstRGwsPIy9eEk3ipp+
8++ZGk8IB9/A4lSZh8yuCGVjTELCJF0YnQKLxAMyQSYNBeIlPRFagmV07c9XPdRlACD5FpjcwDc9
LzMtpxSJD2KDt8gFqo8gDde1SKjYpDB3MmZSdOT+bIFqYcwlfPi3YDhluwWeuQoGHzyeFN/J8hLZ
vZdmoFozWjtU50T391gFzXOKEd649Ix6gLx6dSklhZLAl94JWdum3TVRVxMQlRjFiGSVrt15vFT+
h1K66FBWlS1oaZUNI8K15gns2ZxoU8fxdsVwHu5duPhrC2CyzDvosSJexnwsW7VUEISlVJcYNBV6
E83capXxv3wr5e0KeTcsXYJPJE0rAuRGn3Lpi/GzCzjNIPyRbR7akoH1kdtExw+7dSbdkgwbavGe
KU/XU4AThNiJDbG2GYgpTBGlw+Ud9vM/SCUoSEitkvp49KixmAHOY1GUjEeXhVtNOpn/fT9tUB8t
oBMyrto5CjY0ngjexB93fg1Ca1EeFJzAomFihwo8zmhDx3Xgb95Dyz+DZGWRZllhokNc+IDVksud
wgGPYC00mbIg+86Vew3Fep10irVAzIKyCIrtZ2PTdCzExK82okezwRvglz7GU95q3jPSg3yJrV9W
+BxSEF2ji945TUIaIDH2fQ8Wr5FLN7CmEMEXjBzoQDpFpsh4bSypKSzdIyZjMtOfZkKukXLxi4Re
/Oz6vINrTGS220IvjgiFoUc5vxu84gR5hVc90hPAH9CG69jiTJ/9Xq0orw2XwsiutSf3oP8CNv1g
87Ddkd3gqTvLGEVJj16k2+Ar4lrltIuHQKrs3XLx/RIFNmBKYkdXoW5MQtnxZJbQ4SmdkQD8solU
3Q90CP82bwcy8QpV084sre51WgK3CTEmu68i1Vc3uN4hUF7IxwyGrDUM9CxITxpZJQaiAH23hZys
9OL508DI6CfRnSYwQZCJhhKBMLcFePtVotCsg1MxnYHIS0tnBUdsGHgSwvCAOl5eIZCmFUobcefJ
mlEeRoI/LPb6WQz8YnezUPCoYoE3BUgq0fG+TbyMHPoQWuXLb2O4nR35gVWw2YHxL5n1IkrqdB6B
38JFb8j6xHM9qdzdm2qU1YTnjDaait6qkke9m3WgoR6RO5O6/TrAKNy3dmHvA8h9xcnXNV4/DfJn
f4cUwWsLiUbYT+osCeRC7rd/L6Z14RGhI7qq0+E2h54wVYQv4iuIHZKkWVl12r+1qmf+enRNX+Rg
/WNVeQeVcGt6KXgii7zM+XunHGjP5SUZzK3nhXIgMsmHxfqDOz1PojBiKWG7ed4zF7/yhojY96Sl
1iK/p7vuTs6Btu8pvueRyDjw919a6XVAvIxPDkfZK4ZHnQlr4Grfd5heXZV5Mfiat2X4wOCDLbv8
PJgLIyezmacsH7B1KHqsGoKCPp4rBsrfshOOJTg2vBU7kj5Q/l5Yqw98kYnwL/BpAHjdwRyJhQuM
YW6biQkJLSSZTnFlktQnbS0m2tE63EHpO8uUm4qGTkKCWKcPhLSoVig1maJ7czdOjRRPmbQCS46Y
4IFzI/8FIddFfr5h4Y8/bHec6D6DKq+LEz/eRhpQosArBI+oXIbAWSg/8pXAqz7laWn7YOqS1siH
kYtJMghdj60FfAf78dy+3JyiALNKbBiql8u3d6Buxd13UJkDiRUcSfY0qDiwOe0p9CsMnHZ9mfUI
zG1drW7UAOEl7qwaYCZlb5h4tkai2fZgty+gNDef3dMScYuHsEOaEEeQAmT1p+TVauM3xt9gnWF3
gDQ8tiM260z0XnzX997HPz5vLNFOh2hfMg3+DLlVSrYhFILua9dCOhJ4sz/rn8p8I+tTR8a+6qLc
nw2dnIZ67LmUiEW+z6O8IqI4CWx4hcSmB1IG6+6c8pCmjpYBUcJUPTlPKBIAfVDyvsmxmfuc5rft
coHdHGVkVGJN9kC2xZcevZO9vmFXCERBfREJvRkE39TqyweCeFM0+FKtlt6ToZc1ordic6k0aXT7
dPTR6ZDF1mBZMBV7T6tz4XNHTmcGjoBNjsxr/vcbOU58kPFsZVdoJM+IXCGge1zODx1+ps/QtU58
RDoFi8XjTrT19Skij0WWn8YYFMFtRdUdYUOX9tRwTZpYQeEhtuNR2Jo4ptMHjdNUHd+PolPnxXoz
CpL9MJ1ChPXXoghrnYq1yPfeIWbapilEr5oir5QUkZvL6lCR/EJvAVn/2LIatWX290HeI1jj2hwZ
1rzFbtKq5SOr4RQt+O6RqcEfmZUdMWmSqJHI2YxhjP4kPjVYi2UE2cpucoYHYCjNntou3R72Vqll
Yo9Owszxb+dkOP89fMBrrfsKqjS6oph1xpRo3YY8WfcH2nADwROfF86Fn/4LNztqk9j5SyER7WXF
Qt3UjPXMxJKD33whVxyDSeY0z6lmE2xHgyNF2Yeok6Sx+S7aFNi/wZAjj6cqab6aoV4Ua2iLnWTt
AR+x2grJDJ4LT2+G4m6nRxXAlMSHtCuoUOe+oWf6NPIVqR+kfbwOuYuW/M/vd5sbhVeLVJF1Bi54
87YJB5cCcbENQR4w0V2boWGgA24BG92mThdaVaUecfSMRlhAc0RF+31fhVJeN9q0WO3JJNErLYbq
Qif19k/jNpO1BN0wEg3OV1y8eSPYn3EXfrWbxM+Q/WjrRhx8FY2/ipGwin6IU+hk5OZhfDk8i+qA
7FLRqlA2+/EJZU6x9ziMn87n2btsIGETpWKGfGdnpo1MdFp19fzIRoS9gs0iTXDzFmtLHHW6KKJR
mNsRdNBVXnicUJrR7LOd9tx7h+n+yr1fLeQWE1IA/s8eTyrx67VsvtEbDwih6JEcIA4+zPPVYZHu
+xh9PvD4nWipcS1dmV7l2uUzIItJUc2sQKU/NraQivb7yVFhio7+xrWWiJs5VT32/pdicfY31plj
zx/LQoKvN29Sa4X7/K1JgWQGOoKLbpemF/wm40qLrPa2vIINL06Tpq2IEwtmBwZcxx7db2y3Uqll
+KW9rvtzIo0OUBYd91PuurL+2ocRGL5hHvu4cybEautboMLkmzeWn9RVBK4OxMfQXW777XQf72Iq
NBcvyZ2GEBFY9V8wB0Fbqz2m5XWHdscUHahk4l6qi0eEiTai5e+WMCcsEkjbkyzpyNUw68l5F2C3
V9dEWZSrmPRZt1oYMx6XLXe2u1HPOOKe83vHSaJAhZIvAF3zgEy1qwP+5u5iO2i/FgI1grmnDl+e
/27A5gN+Yy/DP489EGYhg/4nUobyS183MI56XzgNiCUjUZUVvFe78S1s+PtR5+syEyUlx8vOvXOv
Wz5sAVgxu9GsHkTmnWKMnidc/fnvZG1OqKQ3FXvyE9mSECOtViOPg2RLds89vOL6bZ3I/maQYbF5
+WEtR+Xv64zd8YtpeXszvD4cb5z2WU7c5DqzwIbnncwkq5I5Amjtyyw1GdDOb0J8Qwwhw42I0WKZ
UDjd6zccuNVfmG8h3eOB168qFkXVb2nlQ09enT7nU29HigtDGAgh2/LEoEf6f0/7LXZi1weZItoe
dDO/Qa94Yi/B2HgdVvPCUVXhc9k7KcWoZJtzPV941aFEBkyHgQ7OWZrdxl1X2uAGI/nPE9avUzHF
hE00rbwBxVHSjv5mbzfA3UYBuaA/8OeFfJdbXlCBiLDLAAxIUfiN6SJAW6d5aqRP4lf1LRi+npsG
UbDGeknzC3bgOjqgkt77gvv0EvfBiRDOXrQiYqpr4WFpOEOa6D7TRR3gZ9U0V/XqsPDQ8IMuyaip
Xu8vsebaovZOd+UCt+/rgM22JrDkJIAr0cX91rrnCwiJHbebrPPgoeZTm4TwV4cPzQatYaMR0vBm
2hjgydNcEyGnkee0OmzlbAZ1HftgcVtU6AQLghz9PJ0SLRbpIT64pn5RLKZ3BjFh1CF8Z8AzAN/9
veyYhF2VR7ZncS2/7+1lhDyZn1mmK/m4SrLDvuUFpFltijuI68JYpqDi/2LaMFumF7HploetJdgd
Li+EByKTB5mr3GVmhR120DLlrjaXFEuR/s9Bm0d4BrTju2bH1quo2yEO7K7I7jfHkkvwVlYqFbPe
fTjmrt7CvcrAlswqOj/jyRX5Ahgr0aGb61HWkf+GHX1t8ugDwFqs3PWZypzezUGe/sdPGjF1rkRt
0Sxl1uy5ZQzdnkYHSYGu8oVPhG1JwUefJN2v8mDS70/i6sUNR7XWnK2KqXOjrIhDNraVJuyntNhv
17tvJ2YRkls+DmKbGUetlJZwtbA6jcE+YQvaXvLdHdAR3nKoCmEGaV4lAdmGZXzuB7ixDWjMUyje
sYB2kD8rtBA6oHh1Vr7HDweZlOiLQsYweIyqofuciOot1S8ae4oQ6idNmqkvcqocuYas6/rV55LG
ziMXvMieDNcXE32gd9Ew3896omr2+pgfTARFdqQDEX8ig4v/W+T3zpAhbCq/jf3hQOhHJJdnzKOZ
+7KNo4k2pc7pHcjEz6eoec5AgkxB+zQ/0uj+e7YAd20T0U35u91MbiE44VokJ1j3shvYiNKMGauV
9B3Q8DKfImI2kJCE+2xLWuA2qVracTGy9mbybt2N3r6U1fN3jUzwd3Ccv7RXcxAU6hi3NH/+hNk7
XH6zQdaCJNlc2DQp2kPQv7jxpkEeRhk6toOVCQWO8bEV+84ysmLRkeoomRYTbEj87836o+voxHSo
kEsY7MVXd+06ia+gqkLHuaxYMZZLM6a9iWHGksE10tx48mq7hVycmWuo/k6M9/Bdjqbl3x/VoPJ9
qFlQ/fy4BPhKGRFchXYZAMR/0oyOfD5ejgbqHwlZbi/aIMqSKZ2ju6srXqONYYQRHNVTm5cIfhXt
YUyfPFGlSZyukxcU4CplV+2Vz+Ht7m5Bp+fs04gHfvDAzlNmkWfYlV4QR1Z5FqvxjjKMSUv7cTUw
1wECu0Ias1eS5+ji3UdA77gu8LtSQyrQFE3bz8B1bE06RVbP1r+xl/6hp1CmMDhSZzj78tiVVoD3
+Q3pAajdU4nhFbp6MTTEBCddRI3uSZjFGyFRVMZmUtJbk0s28cXEdLXduYPKkTZcpvGNl4b2xQcZ
LyrbAQ2dYmzZZOJB+U69kZglpIojWgN4zx96uLseUOPYxr+G/LP99d1rUHd5nrOXuHxOyR5iDe4V
UJcQ2r/HrwZQr7O+11EDlVs7df9wgMwMtFhPnpdY3hqUuXDR9nViRYVUNspea1doqyB/cdUaAhs4
/DdGVUj6zXxzj6mx+9eSpnn/qhH+A09Ai/1E3pT2j1CBfTq0puqagiLsaF9bOdO/1dpYyRAtBPHH
piZHVpUYOiBhggC1egrN+Uzl7BC0tWAq+OdMWQ11R74msZuad98G/iwGRnkTVd+NGPBCZOBLEQjx
fTvrk8ji9im5+5Uff53KWHFT6021WY1uKbjg2rsIl6MgdZO/+6rihqNIJZ/2j5GBjwVpUKInutP+
tAPSXkKfVHeLiuA7pi0TZ5MmlGURapnanAJ/dDAzIqfLghGck7UqN8c44ZhvhsCgRo0aqlZanaXu
lN0UXyjPlKAHpekdWEEGtJn6BEUlHpUNS1CnVngNsy/GA+FpNw2oPUSWQzcJUWC3Tnh1cDxpyAfc
0ePqZ6Rf7o9FzhUjoCZqFFw2DvAuWsiB5woLsnLzJVkPyKOdfVvuUcCA9bdIxxM7Cu1gpcL4yqod
kPYixL009kxSb49sxCrIG/7bwK2CvtYgDq4CHZkZRfJ0pBiSKKMPH3ORrkr9liF/oVFdTHhaLVNq
8aVDgEn4BeRAUsQzs7jpMTMVhhtm4KswsuseBl14jyHqhn83Uk4i/HjisXLyf+qPwnV++eehdacb
YdkMOEwC+yvV3WfjX4RQQneRv6NCuHcyra4O7vnqVfW4XCCD6ch38SzwJjQ2proKXtetc9BlWgIC
qXMen7coJpvzbg6+U6kJ/P2rYO4gmuxI9Z69QCgMoF8q0Ar8qejdxTF9mnu+S4HaC+NjY0nLrS9q
8jbZERYQuWoFJUyOF/dCFxicuBeByB1OL9526Q1/4w2aohW5Eqnb5ozNHppizNQBcm1LP1LyTqc1
d0YCFTp1HX6RZQA7f0gSBHhb2omVLRqNd6UNZ81eqR0vUuweg3k1isbTw48jXay9sszOIlXYVO7x
7LOcNCrs1NplxmXgCKkRAfIyBOF0J1lVWbaw35UNLsfWkHCIDube4gd6rUQyncfnxJZcjUWOUa/g
I3mJklzP+tiNaPMtvfjIbXl2rNLE0RCCYv6z1vAH7qrgZMyNHnTz3MdsescsLj6r3/gowmIZ+K01
zMkOciZ7GqSxT4D3prFQf2Kt41VEx6p7sqdh0fx+Zqvre0Ime8ZbVqxxQpJXOyIFwRnd/k9btHcQ
jHdRD6xAwIU/lpnkr4nn7mD4TulgIlBB/TLufcWI24Z5kwb695jVlxapO67n/UDEj7H19GSjWlxn
i+oyr55GZiRriNiafTZoWLTWO1Sj0EGtujgljEuMwpFU0TxXUG9xZ5jZz5j1VFzmpWHHPuA3orOY
ib3I+fWPYtRdChwdiksRF7fROR1vfd8J1oxpwpYII21o29LxhX+iA8/C3khmFZD6Wg4atZvh5jdK
PESfHAwQz722hRqvXU0bqmxaXn/V/0sPuxq1Er5PA1ff0TtMphK/rDhGmoK9AOGiQsFjkjIs/I5I
gFq59PKPzpq1H+s7cX9Yl9l7Uo7cRnalPT0YwnlkZYVsiPWaq4a+1hcmkM4A7lRq2MAUy+u/S3tt
GpeK9nmMkHW+4Dlfc6QRhwlT/JWN9I7yV4tJoUKdBti423QFgb6/+1+Ko8QbWNz7B91WKwrhQ6dj
JSfqPEsMLQnr8QkHHLYWPavnUCbbx1+cLYWris0i7+xGoR5r7N02LD7YBkEXAK6B7L//5xVqbi+G
1lyBzdNHEY3rBNqN97Rc6KGaZeDPK1oS3mOYoh2YmZp7rulbsYnkwI23LHuY2AWemznMLTVjWKTH
m3uxI4CWMdx38rXZ7zMiBvmz8NDoo19tgfP8auGVcaMANy6nVfuIppjLMcBZsFwuUs3JnKX2SCB5
Mx2m9uET8MyMYIuSXsHkdAAsdfXdiShR+qF1gBtQSZsDEeYue62jnyPLKcNwGM20oDVh+I7dJw/J
nMpDdHRNeqaG55Ukx1NorAo1DyDB+euIpG0zqKO+ORJ6tUVCdeUC0xe0A67T6T8+dc61bFYF2D+r
csRfD+H4UEFYa6BQSqpUNdYyRKuZvPlWhT5cJyADTyGhwFOfKbVJ4FsF9AREh1s7JpKWWC9o275/
worCkk7pD8WI8c35MW1desHVmEeoOOAnEwn/E6/VlZQ9qZxzO97WRB9Gjb5ZW5hp/yVawZllueWj
xmNWzvAxefrKsSbuAa6Ugz6rnyPFtSihxyOBmoSXYp2cEfCDWb82bDkFNkfyeLiaIOjA22kw5tx9
Hy+ALsJtn7GDChI8pdwDGVUJWPmoUcylJQBTb8La9xxOllydtjaNx6YFzj7eDz+1MjbfFYi241Fp
Ogb1rvA+IQd7yBNGddbKjBLLfbwbvTaNYtmi+qZxzXW1AKmX+ZhK/2YE4X4GAJlKzgDwufD1g2rk
i7GPutVECx5801IB9U+Jid5J699Wnsrdcnl4joicg18pOE96KZ1SClbyE52o9vCK59KJZOaPFiiX
FaKuewesjCcgsOkayOJGq1wv1XJmkxX5b3zfgBlsOMs3KnnBcez10DoPZQPjbSS6ykPFWKwMegzO
/aFH8wypgIsf2/UJssrUmSuHXsbh5VuqYW6yNxBp/SBj6Xpo9MQuiRMy8/Lip0BKDjiR66e4K9EX
/Z7hsvXRNVxGGqB5CH4YnkYzsSSqM8EUNi9aAzGJa45F0K8emDwU+LUjDOAE6UbRoit4Vymwl8PK
Q/Z002yQAfWskVJQOe85rI8DxFtGwfajuZlDX7w+QjNmLswHNhCKipzpgdqHXDMrnf8E0fqN/g6W
Y9d1KRyi0u+kHw0BMdRk4JIrWWCtRxOht6Sh8TAY4FD01kY5zKtak36+jch5zQURvRBn2F6ka4B8
zDvfgQ02UU8arrKqWSPsvEFFAcsR+kVaSIB+thh40yjlyhK0nSlOqU0wZ849qDPe5XyeLgixmX1C
Jcp83kTe51iQQELqablj6hnnKV9RGeXOtsAruylOwaxV49PJaEUOqh1i7D68KdB9FJBmxlQxqlP7
yANz8mM/QhB4DkUFS7hnEIYeU9aEkWSJUyJ4pD3Fb9uIDy3TaQHLDMALBlp/vxiQIvg0fhSMOcOa
e8A4JbuRFS5vpMqyIdhI0Rl/gHSs+IXUHG4X1t9S/SlTVrrwMW6fHmppFRLdOQwkYHgJb1Pj4oPo
ZYHgWmjXCoifCeI5RSG5EDxyPKZBeqOAp+MwcJqWZW29Xn3lzWnxITZm7UHOUDCVtark4uMRZCTT
eh5PXv1WlsNDeKJesOfs7158sN+rk82NOfgyzBBATFfNg0x9RY91KChoQ7tWaz4EZkTfOeO+loNY
ndFfD998AnyVzPJHxG9umlcItnLDoLQZ9viLv8EPeQQgE7xAesfMOYM5PzE1De3PSe0W6Db3/xje
kGoPKUIAcg4pDehh+Vbakn1r6Uilv+MswofraNEYur+vB4gWJEnpbXSOQAqxEYWBxwgidUeWbNDf
qu6/XXBSjbm6pRWLi+nH+v8aSds6E9sa6SJQdHnBFrIKlPVu0psb2l1kDu06XDdgbE+5TH/cZJ6F
U6yFOYl+AgkIxQ9noH+1gmu0sQK8Fe1o0+tEjRUy+HEbWAkhMd6eMsvi+3a3n9dY3yIpFhdGIAZG
+eAzVoUUJ7I7AUB6xvilVtsoraOr1kYaw1xNkFSoAud+qn+odLHlJ/F52iE12enZXs5OIK1EMduK
oFL/gKrf9uWKS/4AfQOXB4c6J/C0U4aU+bBn//1mPGJuJTA2MLIFyv+YpoQVS/iSGmdl+6TuhhVd
33Fs6IIEHpWxzsqK0zFZ5wU/DqDIgIQD+zTBk21konasEQCsexO8MawupNrmBaVzbkRRCRByUxK6
h0crvZw+KSmMlzTaCBxQMaN75t88bJ5Jvy14kBN5h9BPv/eOyhOwBGTJS6GPMQROe2C380CITm1h
F7iYnqeypkepBt46H1RZRBCO0kE34o5HAZ395hW8MNj51BjgV4EReFBq7O9iUUxMRnRq8ym/2pKw
1qrsrxD2JKImFvMCT6iPykYRziXi5044g/hq4QwKldFdR2y8IBg65dOwEzo1a/g2BD/sdwrAymtq
ypi47SbCypdJTH9ZHWZRbtQ9VoM+BDHRjKs8jeMbmjSitbPnoKoXo4dUxf2hKCqP9M8lysQI4zHT
5TiRQ59Wkc9J+iwbNQrUEHd8eWxgA1+NgGkJDUopwSl01rpn3JcHV4ZGgbT5R8Urhvcn5VhzFxrO
ojeECR5jzpgf0NHPwh5aJBiWtgdbhBHP7MEftVA6bilLi8rr0+lMsKL4bTJt9YyqgtmE9OXzhuVB
YdKfrBh4syAOujs8/BQJqnPfaAReSZEF9KFj/CmqlsAawRlPjil2PEvdvD32O33d7L4JKR0X5u0S
Xksw5C0BZ4xc6IiQWgdI34IAwVAnJWtZqdG/BHD5XkpKtuo3v71LX04JgikP2wkogYdDxzMHrfKH
+NVGd8HD8AU/JdlG4V3GS1DpcPapzBewibPmLq/tDMZejOyFxPsK1xZlpLlBSMYCnjD8lVbrgJFZ
Qs2ZV+MU4KMo+D/UUE2+QmPMwRk1bFJGBnp3yBHh4tSKzdThdDY7Qz2LJ4kcb2Nj2+o1M2tIuC1H
Ir8xitmXqlyp5xtYrSPLhH/NESRjLI1oN1HDNsROVJGoMraWiacIfbc6z54lQChSMTJULFyC+6vv
DT2lbUaVBfIrL5PV9M12iNdR3f79SzV1HVhY5jG0/5u0K2PX8Bq4CVD95U77YUE1nMDgP800UhkS
5OiSld10W3x7jKmF2V5Xo0nOxAP61+SmBnrrblLjJxfVWzlSoSDxtsfA9vzET8Ryy5xuS0V3Juq9
CUyiJ/pkz3HfCFvwo9XnJz+LYKIr1gV7kklZE/5kpPiUYGkRBFkXKq4LVD7eu/2N8Zvu3lAglYQZ
UMQn7ZVQ7A+t9OEDOxNbMJfxAPngPQKf6CrT6fe05a+ywqKwN0jepa/KpFP8xLXuSasj48eAaI4A
skXdJ7NyUN0uDbHNBM32KJHxP+ul9FeQTKbwjEi3SIRqKOL3TTdTpnHRyOSPt0cZetvLwT4Abbkr
l9MwCHB7B7jlHJbFTkAiOeLxaYvzeUgnlT2/yaRCp+K7n0HpYP7Q+342FQeST0BS/e2kKa7sHgr5
kK2OAjO/EeKWLE1Yw52Jyhjh/W2t+DiXjeNK5F5Lan+XnwBWwC9dXZO2WYivqtqTHbRLSVXILGzQ
RoCCNXwCt89Fpg+IDqc+giIGSrwl5J+EJweEfuIHRVZv3nfap2El0cNLO/mowf/zjcIICurwy9qx
RrdusXwa+g/AffP5T1/RyTrLzu6BqijfqWdH2Jim4mkK4qX4bY6/EO6HWUc75NuwM3CqmgHURhyL
7PMhywIIfbSgsCV5J+GY7u9okx2YD3gqESbtDbdbK0TVciNC2zlyDkVS1JzzWjj23LkazpaxKSHh
3k3b4jM7H3oS3FrcJYbow0swgljI46EJc8b4SWj451pyz71sMTImc4WtQdb5aF4eWWxq9o7TMgq4
nH/5qTC70SlxoeFAaeG8wt79HASeVHwJGMjM6AXtwiCTblnVUpuJRoE9vextH31y0WW8+nm5szU5
IhwzKhGhP9MwcuwTLpKlPYfaYba07BeYD9nS80l4XF68p9CFcCCIrWJrqa0QRKAbZFJAMvob8bP1
apQqIAbMIFpDX/tuRQ0ryK7MBlClQb0ZV0PhpjtevN1gJzbl9EOLVtzhdLqYi08Cp2tIFrH7Iai+
VgqegMaBEQAl0/96dJpOAhYG+bi8H0219xAv51qlb52vCiVGgX6Iw0YGX7foV+toZ17BiDWA49b6
tnSfVjPzShcSOWwVrtQYMzbHkQ292GL2mubb9Rsqov0dn8O7etfWmDfQZTfxnFENkrG6s1E4rUOm
hmnvq7lURvs1Xul40tOyU+s0alcym9Xi9gi2Gx1rEoz7QXKrBpxS0q8NqbjWQdz1zNDoVOQett6W
1oGrqwNwGn+jHSoFq7aSlHM4tdmD5/4vbpJXljl7y/hpTrAd31CDA+3QKsxlBuTG2vuM3UZGn2zb
mlXGPRBk2Xw52l7RzrgGHS9/g7MCUyeW4JNDKc1XmlqCaNuhNubC7YRYjsmOSqBqLNqpFZoHW+Vn
ppox31J7y5BeP3rog5H+VJD/X8ZmWYiS9yVq68VNLTuONRjzJVVeAmQa18Q2HRoqPTqiPQVVKn2h
eglxcl8luMcR5sySFqatUosojNNm+5P03R2zoLWiTWG2+IK7TA5OSQkfXVxWxzihCFyIDfeJU/lX
tJkgZNAHFc7m+GjO8nr3Mx4kwJbhSX00mou1xv9seYCkU51zok90h2jbErv/ki4E7ELRjLV9QMEC
wsy9wMDT42LEqtUz8xVuhkyPDKKusyZk8e09Z+eJCf0qdWaYvrmWo9NeVO6W0hYT7E91K/fpywth
IV0r/cs28PK5mJ+Ka6ewHgIGaoh/gYoA7KkcEB0EZY5dgZuMoHByakjCFiPoCatZRIEn0vmxl6OV
DSDgsSnDsE1JLsPCEAezBbXj1iuUeCeQway6/niYF77wdE7Vec0c7GyHnRJIWVgptCjeFia3MiF+
k5FDLXj6/TKJZMXi52jxFRmrDbPA5D+sN+KTud0sZuGO6TvEPFfaui0ztFX9SFyZEeEm/atusWIv
eCGMMntcYK/9EaQ9ltJvyfTWkAst4SLufXnlLjJGTLGplJHINr+deJVhdZPUp+a/pzOMBcmhhbJB
/D9JYOpwMziuySXZ/MLwpRJ+wWIkv38dolRIg9vbuDsgY6foUg59CqktiDLRwPXPj+FjqKfEAWYQ
FSsqpQ9ElglwWanhS8XXOcuHBTNvCBFOkFuxA5GUwbeH6csff6dsAQpAOn00MlZBmq7bomJ2qH4v
UWBx2CKdy4z/PcMzS4k9L0q3TqoKTSIOG2z3SSkOi9Onw88ivG/+LOAO+n4fbck9IkTVL9oC1/lf
EoGn4jVpKYgt9bghVazU0+bc94vyAeaLn60SwazO9IJFJmZa5im73pjEkdjL0buRlfOIkoLn00SF
W2IkvbFUOxCRz/HA+bjizWYRVbDHBQX5b3HrdqdKnyG11IO47sM0JteOIBmTjBK2S6becfOBL+s9
B7gOhtIXcuFquqDaaGnEX346ZzfbF8ZW9IxiplZ/eQI88KTOa/i6k2StyWJkng92C9svHCOX93Sl
leYwoDjNQgIUvo4q6qfRb6fxDnLIh8242xgNBym+woSd1NOWnQRA2vw6BSM1oJciN/oNIA7uV/RU
PdENe8pydxTByI6xOPf5Wh2EWw9kJI4jdIOzlf1PcQyrQqXRXkd3f7qMh/j16Rza9EeKuw79Bx+k
ZyfW6x6sx1+0MMbrTZmzrKA7Ad9da3Am2ucnO2K9zjShLbsJWzWsBN+Z4Z71DV87FMpy1l5jIaGV
NEmW00U5FcUaw/o5egm7G78NpIFAZ++oEwS4GmJYSppfx2zFRQY/JhcM62Ka1dt42VE2dTrFjMwC
esmVFNo7tD1hgackH7SLuIdZ+kuzKe/JT8xVx82kiYiH3uuGMTsYhPnfw/rW2l4qLQj/p4TXcxlx
Ojxe+LH9N+CF4UHa0/e7U2Q8JZys1XEtnV/cwu3s3l1XN3WKi0Bd0ZeOvJKh/Gf7raoqgSfU+xgp
9v6Oh3QcmDh7UVJaQZS4x7kDcbZNxeq72Mv/lO6Lb9JExCYKPwT/hZh2mFWkAPFYgTGQ7lu2AbUM
hqFVyrV6TBo8Ix8GsrCTbTPlYfoPQ1MqJHLqJWNe1b9B/5JoFdyd3ieZdHzLABxep8NmyU3qkYjm
e2VztxrkdEgIU2ix0pA9UqicsYHnHM1708XRP9IEXlcNrzvhJTQt7ripWIZZsrxDCNnYwhOBBB3r
Y8Xck4j8bHhoV06n1VkIx7u/pGp/k8GdC4aMx8tlQw2eFNJpfPfsBm4pJksD4Sz9KgjEO4d3VgWr
8kDgLfN5SMp0UbHiN4oKRbh12iIlDZniooCOseTE7DUqFMphcRDCpLtarLcWCHK7teyiYZrKnd2Q
G+HFb2FaHdI0Ek1VlPr5ac7r0JmDrdro3KTBvpG28tcpOLkyn29bqgW3l4Yze7knBwSy1BPx1LfB
uYDNfZz9xSNnPYKRfsuE2zVQnbe9ERLLH1z7zjpJ7LzDlVmzJ/JEZV2k4i8DNCbdIRtYOsZQQsLn
NPoBgaULBBdXYHaA7mkdwECtunYkiWQ5FBXe71Ij8OJHy3dO6YA2ES9Lj/KdKi5vMvUzSGY4sLtK
onxlEhIC1Yv7jQ0vUAeLWDVsq5uEL7UoDCbWZLyl6dKjewVV9XS+86fj6Frv8qtyxGENkvPVcSsQ
2YjtukvZWeIS1Tchp7gvkTTCjL825UC/QxMd3VtYuKD/9GYqfweVfAdimbz59WzBf+R0IlXnL38r
tSrW9bhdS00DvWSGjOdLCwo70tt0b4e9AJsirWu8XnQKGC5n+2id/CMuaaLTOens6xCAtZfvvY0g
C7kLFlm8NHnX33TkTTTzVgz0ozdqi698sk8Vuu/5+UPar/9hKy3lwGX7Z45504oDMKyHb8kWrwWe
ui/m8sbKitgdt5wt9tImTk1Gp8p/H3EFWWf5QfEeIuEby6VKt3sW3PmagPfoIQxNyL9r2CWm6Edj
8dHYr/3viGGOX1ro3cOWm6YpHzWlyZzV6mMZpEibU1L1EOaeLS9U2pzmWNyPGOJFCKraIZ3kgGua
dmQYjTzvvnx2qPVifNZtWWgkrhyXyeM/fcqpDFvL3UXsog3G8Pi1gCO3QCc7xXDiVxSI8rilqM8y
7+LDn9y7qdk9djimIqV+ovJU62Iv+Yj5eRjavMDASZbTvTqY+JoC82EWdkTMpM0QHXE2xw+IAwIJ
v32OPUxtMti15hWDIVG0rijKCpG6zh2mfOpY8km/wmmNCmHa3cxl+ksyw2h48y06u7iYD6OrTEQD
Yj7n34V131FcmUwXXOd/o0kjxAEVmGvPq42E/wZeY0MwJAdCSDQjCpau0H0V1GAoM/J9qImfLDQV
hC5f3/8hSQiuzgBZ5UZYXKB+Oew2V9UtxRc75dD3nxNmSIJhX8q4AdJRQCveq2itOCHpbr9hkxeX
c3bPaWp877bxWsWQyrEnEivqlEa2IGN+4Xuj2fzPgV0cZt+A51ECJFU5armfXHyUlTV9MsDNIWfR
fiq3kbF2lMeyQzJ11/lh4/OBDuLGvppzAyCLfh4OTBcWxxPAXZDeM08L1kYkJNIbgDoAF+QGRmG7
K/BHD19SKpaQCkn2Pk839lgudq7eAIL6q6RHswQ/RLt0QgSVp9xdowLSju7Dmi/prYdowkSyNxJn
+ebrxMrUtqlWjIOodU81l5NnDTa+9eH1LkKelbYLr3e198rJZIr99xParwsAD9gSEhYiKJotBnHA
Z2GcAgqh/rzMBreyrlMcEE5oiJYvHVLujmskTj6xhgISS9xOuNJSh19rOHloerdhWTeKDZFlatc7
X05FpfxTOdnjNTC2MqjfTotTtO1Avlupm+ZEye43XK/qjDHh9hqbpzlSJg5U0Z9SQHuX+Vd8VI19
JKyn5RblbdB3+lOslynbdlOcVLBqfxPMcboQe7PdYOp73UaYv8FH26ZjWmreJxf4BcfYnSx4htxF
u+akBN7EHvktW12J5IgSxLcOGHmyYX/0yEwQUALvOQzxzOZY2EQrC9Lruo/1HYDPRLo4OyJ4IbRM
7xEk4UmypB7A1ZNVoRjatBzv/1RMplxSWgA3kMURdhogKITiFvpg+yG6Ymw8puxWmcSV7Y+Lx0I2
oSeS5kpqt3XmF/G3KuPvgsYiTuZX9pGdsdP5q68Mt85ew6NW+KGkDDLMMNfGCFxBXrxNzy4f3J/w
JuqLRTTYuKuAFB4cKd/VX8RuvhFHmoJy85ZfBDOjIrZXHoAK7M2mSQaF06GUtYY+h/pk4nUthi+j
R/DkcImFK/ML60A94QsJ3fio8HCSWABUzk7JNjmCVIujGncbSgjg7cxnjHW70qNeHzrz1aal4AHI
eCbE5xAjEmyfmCn4aRH7JfjfWl+8l76vPFhvr/uZol92CXqbHDIxQQDLmzTx+qdO01K7FhDpboe/
x8k34rvCOguu0VBd+HvN+py6T2cexUqmAZowcUF12W+uyrwp3u58fVqa3pcIE0z0wN8j7192lRwI
whCRiZHOvtx525N1U4hgWqs+l63IDZI6RjB2o4FBtTEDmw3xJ+YdoPjBtcI+CN9QXU99z9tGfnul
0qxNwD1KgY8SS9shl3PCIvcc8R0JUp10Ct+qjObHF87zw2r5QT55juQS4Zy1Wgr9KqV4opSKTRTk
wXWAbCpfq+mTGww62DUDC8pFwqNVU0YXTaDV1TDFFiQhZLVjbW9nFIosc8y0ERcl1f+NyDOB6uqp
KldP0n1+wyKSwVJhuRBfMH1IiBFRovGfXB2z/vl9gkO6hrcUkyJzskRYAKyC1P7aK2HRbVuZnfmL
mYyaoWVr3GU76QQzbIwdropzB2Do9O82Va8Zw+4EURpokivzuBUoEE82nC8UaeRcvopgAJrPMb9Z
Fm/dpSFf++oMUW6ciEXr32IvQOD8ltU51NvFmRuuf0A+xLngqSK4WjvSas0iXE1No2bObZieHa5S
H4j3e/HnvdCr5NTejVP5h3BrWxu3n1YItGmQTww3+mSj7IO/nDZIppioiJcf0bZScUv+enQDbvD2
DXcn2dSMMOqaeQmuuoFyEXrJDcGjyUuFe7vI5/Zt0tqXrTDsQRewJswXBYBEuE2XA7RRlwoEF3Oc
zKHeg/jzCY5Rmgx2OA8Ypszsaxu/6M64Dpg2VzBfTWh0mYUe8PfTx/wGEOB5L2vLfTwMfsehGZrq
fjFg8p19TsqkAss31wUTLhuGT9/d9mCSZxe7UALCi2lKR1YdZngkJDM4pT91CkoXCrtzRPJlDnaM
sbiNSGdYjJzdfhyDvRKjoi3PS43cH2SpimTt1tEQLx/C7JR9s+YFRSoXnyp62Hfiyn2VS0/ltqBN
DnAuThRYcgDy+g5axkf1krSQCTmldRI2Ih6ameWCNDfHvkT/EwQURIXMutyD0S0eEHYcshXP+eE9
v5DVn2Cy1GEUEdYRDDFcijHby8laT13HK06BVYFWNLp7/Z9B1V5/IrQBps+VQ6g57TLxwNpppufB
ycFK2riGfzrdSy7uoF041LpT6GeskcNT4uVsLdBM9N9h0DUvxP51qzDlacvkrv3/lMIdLeUG/9Pl
7Z9LbQuu7z9/quxpAxWtbD3UHcqRaVf+d3Tdm/AnNewM0WCj9MjtYq6260xFWF6MEVXxCPQzOCEO
/+w3C9nryjLnnxKcplDvSB0mulT1Qu2VBb8qOlkCmmEqhd6zjhiK4x1QeFpXZzCfz95DRbWHP/tD
gVse5kMcTebG9U31nVSMgSS91iUu5uLMlVGMWU8MCNEoyJY6vfSHBvOFnAKuXdXKrZFbYAfW9Df9
LEPo8rMmy+XI9cSJpn+cqNMI0UkwKVBTRLKfczcMwxDkW0XRMYDC03Aq1eCdPHO3tGGr4L9ZZLRv
ofeM1N5zQvQC+nj5toWjdWkqg0L9idTkeyHbuKTf3ve+O0wVLamYYWPMrNbuES70bbHuIb8evnJ8
ieMn9emupE5xwCCN9R84vq2NB7hI0sIQ34kKGHf5mrNPNzNyOCKwUwbyO4YBYQ34DC/zyvEGjLDk
EhInWF9MbL4RLQ+0+tbjAd/RMPuj/4BQ02uJ0TlJwUFTbec5dGKD90NCSpLp/1T/e6lXTWRbdDtn
tYsk+TzByeXYUYiRng9fCVveyfjekclEYehkQVbydkHWMqD6VW795NBsMWbiW7jzMjY2ZD2Nx2B/
w3ANd5cQ3KaCCkxAR6aCr4R1b1qTv0pEmmkh2Txm8duKQj7t9W7+ja9o1VlFVLyI0HqxXHWra3Kv
xU0yY4bErRDdcMDXcNrveeakqsRL53USGt8eFn4E6DsoCx5G+btfJqAxFOmXvVF/2/sqzFLYr6GR
GmgSMTekZ6EBIk0H4oNK2IX3FXwpUtrSYqjK+92N1+nLXsvJtZylXeqE//lV7UDCKwDhNb60J1S3
7H/ciAZs9XoEK99VUUu7LT/a0inSkT6ds0h0Ue9nAd1jXqvBe9rIU+JqpleKJOGECKOkHX3DJB81
mWWH8Ip7zteQUkNLQZWgvFN+zpCACMv4B+x7XJ5SywOcfy8pIbHPjf1Hs3uQxQPIcsC4Mt61SpMD
ltuoACcCCqXvxHvXi8FJJz+74sswd+b4htIFCQascJGwrHfPIEuR6UHmEcaAarQCRw+M0yz3BJVV
TNgxyG9OidBRcsj+5ULeEo4qYHKtj19Jz1HiWBOKbHKSOdED7e/tCmT0noyyMKeBJeCdc12GgG7p
KVbCgz4ThjKVjedB3qFHoUo4Q6iegEJbNCQAfVlayqW9tr1x5rFzdac3Mh9pIcmvGe0cRXSudbrW
bqed6FS0DxN+bVG3wFWt+fLbSnwIrnFkK2BrvhzMtbj3hQsOHgqQWQTnfxYjcTy2AdjIyK4hXdZg
aVt1qq5RLtmwOBqMMpaYfm/4AkmBaC8LCVCLlPrZ4Qou1cYOvGxS2ma84wXH5LvanxMQ/q8qcVEc
K5HEgC/vFE1+8Iu9K2kcveqrZ/7VW06Vt5bteL5QirE5ELLrdXPdh9BhpdZ/U4ou/zKKv973rKsk
P/xD5Rr/GoJEle9+TK1GFfitIZquD+kJQvNjYG7k52qWcQ9ukbLX3o+SIk+3zoxhK8mVx0bOliqQ
PRQ6p+bz6qyA4FPHQq078YeX50IEZuczFbDYqRRwRvyuygylYkAD9b6/KBbitfZOloDvOZFRTZHJ
n6kQeHQFSRBIoq78QefGe8dL0cTl0xuYfisi25dkJ631w+Dj2w5+aqRCqrepDl0MIpZvXTp/Hi39
Qqft9hCGBIHxYFNPQ8Qoyqw0R+noFfGCIWmaYGYoiQdqyvzpfsTIMXNfZkK6sRAR9YvTYNj++4Up
DZTstOxC0n9JbCITNXqPXRYGWts9NHk9Zbdems2nWTGjUH3t48CWkCJ9E6P9GUtqYC6uYOxtMXoq
4wFgt9WXrJrgFs/DeE/4yag5mtXaUTLsfqtbfUdBN79w6g4Kl+oS07AA5PjssabB16NVw2Lhh31q
QqgNzcZOhfIzNvNnOpfKxDxQo8cvq+r4gV0mlGCiaZVCHSYbS7sImvkj9cDu3W34Zu9kHOOaDZRu
X0MvmXFef5WyCTgZb6tgz+YxMlcJR18CfoIx6l393rc9Qj1g5Op4Y3fMjaVXHqMjYxWjCiC9p5q8
3NZZWx0R31H5y4l0k8mD6bfeR0G1dk6u1F3R5WTbQStEP7kHn13qKv9UbYwgZ5JsssyoKBKG7Hcx
zeIKWGKl+hVMcNR7XWzupshiVvm2VpAZhl9NHI3IRF7nztCIMBjpR7LYYQL7+B8uu+nykRpSrFKt
y4WOBqxwBSjjnEE0oqyOhH3uKbsxec4u4TIXD1s8ladvL4WOl97VGlCgDHiQqt1ZCcpiKeVUi62J
OQ5IKTbWuZeOXQKY6yPAXBZDT3WujWnQsZeJ4e2GbS2ldpNnhbYSyr4gI8Wv4bMMHB+o0rdqA1ai
Q0mxPZjgBCVN+PWZn3ZXZctEGEwSrFEanRQX4eSYxcSCiYU0yu5A0xZWdCvXhOaYQxiPdNqSiDNx
vlSOdJsoiOADXT7ZxmDzQDc2WQn0WlRF+H0i2SxavzI4TXeJaI133HT0qc4hPfqXsrGVwOrKqFyI
Yud3bCETdxxva0YSkzCLnHt7nAduqs9VYW43YHt2HcYtHs73zWeWu63EC2X+y2duNct1a8VYLfR+
puJQbd5IsHTX38ywmj7WxU3EW68WNAxrCo5N8jImny6OwNHYAa+thhqaalejudlLK6Lsk/B4DFeK
ErnGhasnitQTJyH+Xd6PzFCUJFosVcH/d2wxzzXMHcFF+QIC4yWZaPaX/S6eQvG72GxiWFNEpLE0
bELAkpDC43UNR3sJoL6s5QpRrhi5tsmolRGOatqRhmJapBRVAR91/RYl/nhdcW7Di2cvfd9/uq/g
rdYfTjRM3jkM0bn4lGPXZn9HTAHJgjZApBYx/DFGiBFtzwOEjLQtqrpA4oMuAZCsWolEmG5Ij8mL
+MCbkBIKCeY8obqPEie4odVXkJX21PWUidTGTok5TXiE8NeyU2qYwAtNDrRfCjBd4LFaZnbaOhkH
wTVfjvlnSV69H03CpIc9S7D4DIufAeTfbuftMK8MFMWTxCo/DaR44VLm6FCVtZSGgOB51geRkhvI
C2Ie2wK906X+OyuZTZm0TiwOW6Lb42s1MnGhsbzLBSg0OaRS/Ee0BmCiyikK+4oGeYvov81M9Xoo
2YRxe972bLKUXcVPOXYOWPWgq+VY0oX/13jBrYNokLXXYeYXXSmpodwGHlh1VvFGN2jD+hjId7Ko
71lOYnbgZzp7C4bQoV5zr/45aMHln4YgT4lJX98BsLIG5uoMeShoKdgHKpOIka3jXJz4Qd3dS5JV
g5y/qXZgRD3rA8wXgc5/qXdTgoNLgJXaD4hSPMP8icuOax4p5eiSH/W0lwKHvbDq+9t3ZO9XsFUI
jroYFuo8IC7V6QkVrFq94pBa+6aS4CX9VZEmc3m2VKO4kUmvjhxRaOhN7peJgsH7H4HE6RGKBZv2
eoVX3/A08T7kmwkGqKsHRPbKtw2QIaKmHyeITns5iCuE896zsJ+1kIkU/D9OZB+C8U4LD/eXAzLE
TmFie1n+Z4TwCpf75NT7InNNCQRp3VpiDFE5buUQXoSEKd+ed3AaZVf86WkfbNTTPeXqvT3OM5U7
Relp+lMAx03lTA0wX16eyw4nj+mOmiKe088FmPW18xFjSgLk8s/oDFq5bp5+vaAHNSls0helITin
SghJIYCeb+oSknss2lMxGACgAcCCaBVtt73xF1jqUgp2HvR1GegiBLN45vT607xA379RDGOuy94J
dTx/+pekwVsWCx6/W67TFO2SwM7LUrVwGI7fySnhzReV6l6EgMbpgo7as1udSpzjq31WZgzn0Fin
zqQFMNUxIDHBH3FFnYOlEFgvT6BfRfHmkJ2vBDXtAY3lhxArwsANUavrbeePCP2N82yJdg1D6UN5
d0bYjHt/TIs8N8sfSQ2PfLse2Ucna9xiymq9NGFgvgTslaNO+94anCUN01S4/h5UJhxo796CJlMN
JGvsKlOx9AUgWX55A35zYsFH/1IO0KFNvt/E355sAyycd1iPC7R0/DqBX0fvPCHrBCC+mzugFzL5
UbCloDTloI08UpFAVp3HbFR4dWhPQJOtDbEEyErv5RolVhuv0n0rsXiCVn9A98Mjl0IDVll9CAlM
2qiaK4mWPCKuw6el+6DDF/o3S9oelrGjwZDowBJvVSqlC8N1EA30JVj9uhP3Rm6CmJBBH9MB7T0u
PjLmnpe8oWh/f0MMTOgqOiBrC287bVaqOTNVmfiYraq3NhlwgCouI92nnPZD6j2mfbdaj056sUq/
3Evs0FyYUcVZGmtDScW2Vk7UwRL9Tu7kUjbEyDgVWIBTJgqh0effc5NOV8zwtKVgj+wLJs7fbRLL
QNJNZPzbFjSN0Wr4hXkDq8kywoxqUJeploJWb/UqryWHzM9yLPdthlv5DpkQjLY5yOvSYRFYoK2k
H0ED07kVgrmPlgKJ/W5hsz9E8eSr5SNZNUSIgWjZkz7rwGfstU37uEqCRFrE0zDzT/YULjIc5g6C
1v54hgPiv6fBVl/yU+2v1XEGP5Gkg4WgTb4tlOYVL8PWWcKKbcrl5fi6podH4JPu/NtwGhLg2n6k
OktTnWiRYHe5FhIOtjON3zWgm93KMfWdqohdq+dXZl3fjqngfNp4dK7rKHpZztEfSMp4mjyJjbUh
FD8uY7zcrh/2a0iqOQxZnbowccbcWdtNZKraLbnNoZ0BLS6EJTkHB97tUNPStEYsJQe37GBrpvUl
PaOp2B0u+4vM6hG7L+PqQEMbB3fsRoSSAYk/Qxeb0UbvLMzyRQxFaYk/oPLm2/Iptcthr5k4HREa
Fvs4/8oXj7VL8/ZZnlSL+B4GlxFqqNh79yBJMbrtTYyLt7VcWQvWICMhY1MiFRk9KE5uwaJnBfhz
+ybZxouA2yEmEfyIGkM7Y4Tim9EOJzE/MyX3rArcc2bmnJQ1PzbRDd2/YWiElG0c94A0ILqc8Grf
q/33pSB/YDfKE4psR9kFjW7uRzT9TiBRZJ5/p03KD9uli8dpzYvLu7tMkbKz/zDcLDVPiBQLORUG
6WI1ci7kCC8UKsbF3HN2UxpsA0xb7Z98uJw7Asb0Es5qrg1dWrSJM0VQn5pHMQ3hihQddjHD2QBB
uxhU9VV3W6Xtvi+MmEuQ1pO/bCvxPwHltm+rSdBB/Ju6CV2uf1xPwXL3HCuibb+ye8riS4zbJr8K
kF/31hj3ZG967gaKUvxT+4qBZnU/BG8h22SZh5j+PBVNfgzxCm7cb+pAt+0O13t3aT351Ox7bbBJ
FDZRaGdTHvBcfZhz1fvXuZxkD79s3sjUrlDkys4LYpYRqlz0peLF3RUOfNoiNK5jF2PgDveSqktA
U5RrkAjN6d0z5U0aIZyTfgyOHwWKbAZGMD16DBG8+2N1TJFfsfgHUhFUYaexKW3LpQ5AM3Gki7Yq
UueDUZrmaOuPh03MDGRA806cdUIN2lQwCfgZOWNWhANzL5SLx4bfz+Okz81oLqBgObFQAa1mbGDU
uKniR5bjxnfKcwHMpOdRLSnzz+cCXhnGDTlOr4AnFSuQw2TYbDXbbJghJXB5COBjLafpjbqgSVAV
nm6Sn1y6e1VzBRCU/7lr1c4ONwWTZXnzLsG0yT45+/9bhcjJRyqsDjTyU2cCnX/67BqYx+W6N1sx
KJeG0EFBdXfw6yRPBOfgddSwheHSrK65UNEbNd27s4ex4rlxgugkPUJoSnqXmYYyjLogiaauGbTR
mLQPL/eA7xt2BrnGb+oD9MKBGZ4rqXE16/vBvYR9BKuLkjQT27s/rWyBGyqB9d9k44ICiLNiuWUp
Rn0mV0BGmYkLujgcq8MvHwltpFLzZwnEphs3aRwfw447ieimGDS+1iBoJ5x1YVfkVVw89Zg40dk5
E4cyh/hKNCpLEOULv61D6OBQdsfwALCUpIlUrBRkwkipnObTbkd2sAF9x6RL9Bg3g4mHESRJTb4U
WMb+FZbEKuhmgDqzRHFM0rGQxSS+pasMW9hPKQ+YO6z46OuJ6r4nBA1loQ/79w+Dv292jRt0EuGT
Bxx7HAWsXEf4M1FCGAXhHuivr99coPMAzSJhfnQumy/iy5PdrASbPWQRfC0OnyJ6jYPBtvL+1/Bf
QepZO0eB+rTfT//onpG3attPxlUNnTRa0fXlkqbeNfnbY7TG8XODv64pfV8xzxOMlnudoHjlhab5
as05PzTWqPe3aGGYfH9/iy07igqSn7B9ZKhEyiG63wb6PzWB9THnTFzq12yE6i14F8b1H5vCsaLs
zM+aKwLyd/cLa6tNr7iTWzLlIS2j4yUxJp2iWeexjnAGGuc5fkhNxZze0COIrKbh+7TqDAkDWm2B
uLmXfs9VS24fHJHv8mknhtoNYKXylFh6qbzeTNk8OX3B/VdiKkL5q/Z93YWp5Gvvd4SkoiPrVdjI
iJFXeZguK9ByKU84t/bsxzbfm9IYBqkbxqrhl71Iz7coABNtR7mOu8jivDbtEE+NwM7EzvCv5dNB
9XwmQzDZrZyDsblmKMcV6XL4rDWXkdSRijO71x2rJYkCYiCswLqnun7RCwrmw5ITb/V2hZbRMTNn
mg5ZQqvbX5koWPfrIGxPmshPQjAq5049L3lEp2/Ksk08RRxejIwisxtfn5gT0Dj97fWJ5BQk7oRn
toewX2FF+X+NjwQI2/XdpiPMQttGg2Lgs/gRKPm+U6nUKHLjX3aPp/6jc195TSI0qL434tFdFCIe
riDjmSsKgdDx10g86RutyoaoUJrodDlhA1Zov7cEv7MOy8coh0qxgDX8QidBMnflaD+q6I0ay00C
cvkRcPC2aqEuY8ch1QbtDcrJleMawj7aUm8Lg52OBY45YsIrFSh3SP7sGP6bQ8AiY1XZBMxdeYxU
1exbkvpcFFjTZctcE60VyRfqzeWkOB/ZzIDnDDkuxGT3QctfS1vbRkDor4yLRGoKbWz3FLUDJilM
zJUyxSOwPz+jFWu8YCmsEZVkbMvZmsa3HeLtm4Jz6eCZ5t3Rv8ihrw/G8beq9D2luzJuv0ekD4iG
cEkxt3MxFELGfi02VyV57W5dX5nVrZiRNdJr5/ayRhDbvJA5NbVDhTKgOtWSmBa9HnDhmAsB/yXd
S3meH1Agw0z+Lip3vEnIKlIxH17cqj6V2+dsFgcg85GZKCdC07ecMh2sC1qfUPxFIzXDxBNlwEyj
pknrYIyesgWhi2xLhFgVf14Zpy+OGAh3Zh6CdSYM1zq/urSxB21wnUnqtcKxSmckSaZgQmTUniSS
O7iw6755txJcq5gzo93JNJ39+BStjraFKOq5T9qn4+z5Uv2a9eYf+GtDmBGIPIW+rOwE8vCfXD/Y
YXMSYIjvM7XL7oz3BVxBC34Q2LYDRh8VLiFXWaUxXTcedqvySQV5XLFfKX7JEqq6pF2gPUvv6Bq+
FuFd9eJV+zdEj2OSAq4OaeaQ3QgXvUWuxjFIdAzLgQCu0PdfPDzxFCnl7uui30Op+IRO/Yg9C224
5nCmHxOHW6PakXRNIWL9Wnls0zX1rnVlz5f4t7Ext3fqRhITHt4pl18a2r4jGC/RYNde7ePZZ1R3
tBOav5B2RIV8N8vwiggAIXD1jiKr4o7cyGULq6jM1eqZT7oOlwh8eR+qxQTE6Ey+kU72dHDpP+bE
nGv5oaBB8HYsUKJgqWh4xBzHjwLAPYuqTmWTi+5JsqfU4OTlaQbIobsOhRCktYpzkC9VO9nVEg+I
tEs7JvDI0fySsp4MFGbN/9scuAeg4bAFM8Odt6TN9TtKadm7khn3hmCoh0FxFUwTnPT3Ui7rA7ll
2GGExXO9dOe1sljCe3pcVtO5PkTvqmR2i7Kj+9rCYgsfg/xyHtuTQ4fOZE0mejZKiOhWoY0156us
fzYH65AoVM6+zmgzEl2HpNIO/a4zhOVLHu5qiYUkJ6mBOxA2txbfXH2/EaZm65vEZV7+aLu8p7nd
bMogDD7NH417bkr6OZOY4wLX8aV1V5td/An5kP6Xnr1Y6y3RF0pwWSG9ArsoYgJe8Y0x0LF41gK0
BbCEBVphC80FkPnuy3DeAlf2aqstW1gwYwMKj5kyUa+fYnte5wskU6wHGKJy5b7v5BuG1mvDrPWd
CWgpwjKQZU5YOty8yt4VPhkDfHB2To5rPLV+Zf2Pyn9HhT0UVwmqIZY8Z8/WCu+CZVfdq37VkIDw
azuXeBzYLExVCkXmXksADsJe1sVvJTjqEpv+Zs7PHmeIQr9tM/5AZs1yu+kZOftWa8Zg5ymRqrPG
BvVbrsT1VWE0I38k2+kXZ52rQE42BgxWTSXJ8ITitXKyps+Ul4Eopt/SiM9NHrouG0ycQxG96+Bu
TqK6GQEt9z/w/qhQZt+MBPP6vAnEp4S+NGvMgnC8QRbTYLT1JpUSPG4JOxqYTzQ/72rL1cWmsDuT
hQ8OuY8imFnuPsR1LP1RPPGLdn02onFmFYMdKJCrJa01WjZ3slowMJ8ptfAzcX/GupppuUsKMXaN
3OOFde7ak558XGHM4R6pJGmV88qjdiksSyHBaewSpofP+lxWtW5GECXWMy7eaq3WrJKdGR7j9HMx
oKxKTZuxWuLvvGdYRZtpynf6+UwV4D15dN0141uiN6xmKa/oJ1qjs+yg9e1HxLRZf07SDKswuK9V
1KFpEic1rRxo9YPrPkFvFjj78JVQ5qOc/HcMOB3X1w40rlidUU2cMAsR71yP5j+Ape4pfN6vEu8K
d8LaTQXQsRRlcEE+8OG43+mN2zrWJoralrDRPUykLw06g6dAXLm6MYut0xtJQJI+wJEhxme21oCi
H08Bz5R+FkYJFGqRjyMIcU6pS+t0gXo+BIIZ8G5AcJeJQ6HuReSVAW2zagNxRENA6Cbp2n/l4sqN
UHzQI1YPBCMuNUOIXUO4oa4gZLV3ZYmAXZy/5/bjOkvlpwZS6WU4IOf40yHtUEnEbWOesFGNl4VA
LJBzKYXzwtNt1tAb9j5RNIKctghSbh+7bbALqPwyKKxk3tmfCjc6tX/0fXrdkBl4r7wjCNgcMvM+
Z98+gOCwmEmpm5wDatwtfWneB4ZcZr638542P48UTLOdDM59wXVXWyp4HA1/QKKXWHfhFZhUWSgv
ZepdvXEb11xd5IZl2TVdO5kwXYnS/ecfxEVS+pNnOS3j5u4c2+s1jD+Uv996h4AgbVsMLPxOHJyV
E5jfCM3yx3b0T4NjK5k+d+lSmROQY+SukFbQMH/0cZosS8STChWzYDNN1H5onlKTXZOy6EuV5gLO
FExNTzMT7lnm7tnr6/JKbXh0lY5sdneKF8Pp/Z5NvXJAq3JjrXsjUNhkcrY9LK31yiCjzlheG71z
OgItBxU7wnlvNFBVWDfedR8x5mIrlaIHkt08md0XLQXa1lEWJah2ZyYNxXqaI+CK+yBgcdpCqjAS
3cKB8GMBmpJ3Oaubucg68vrdDHVlfZyOA4nnOKkarVd0EU4J4kzjD8b/oulTzs+3X5Blma0Leszy
YEhiYba64xbdb9r/IFDan4SFs/ngW9+YNdXKkMf+2DXzcN6zspP8+wdjv2QjlGQtXB3DtIDET1I2
8WCJLRiXYtmpFg3eZ30Ja1Hh6aI3nJ3OYFXoLH3yBc90513jlR/PKqC1moyUwSzA2WFnQHmK0y6M
vk86GnJmrJYYdF3jPMFSjkWCxfXq45VY34SRKMV//CvfMTq21wOJB1b8OTxjo9vwe0pvQ8fN+KMc
KlJ7eNYcY6t2a4TPtE7lIPiRKcV7WiY2SV6+10tzqWjCpfb2Yxg+35gp+LUJ9Doz78Ep6Wp0eTVH
aDbjMFGmgFgnfppYBzCz9gz45scFI2MI/AC9RvqHL2D6x35zwZlRtEhEQvW4UP9V4Pi+tjRvOy08
EALb9CzjIaNnDveOsrZp8p6SojGxLn/nEmlGlFNn+ZToxxiH36mXv9ukxu7QK5CGRH7+SmeVdPLg
NS/DbZ+5nIyuYCDNAAAH99FuJPQU1wxsayy1ALBxSy+1m3dZD/qeJN3fy19SQYDMJs9ENo4N4akg
pYUSSMBAXZX+qM9P7min9IHt7b+zJy9z+9+8WGoGGfBvoyIGsHv0nFXq0I380tQ15D3XrxHdY+mJ
dWWWbngmUOFhVG5dK3rBOjDqeWIjIJlBPz2fAC7KT9/0eazCt7kUDDiijgoC9Dh+C5rIz93StA+5
WENgp3bKUCvJC+Cz+uun55G4u0DyMoA8blmZzk/CNMdsmdKAt6y+QzidIoy4MA2A88i62XO04APJ
D34L9HsNfFMfEvAc/XrJ/WqzZhRsIbmTWT6VOoGiTNI2koK6mkkUQmFUGRgjo+aLbbSIuq97TYlW
wtue5p96EnWFQcVg1sh1gcuGxSysxVCQSb1qNWrDiF3t+GZkUzmVizNUj7y9dkMZ68+COenl54dI
mABNWqc/UjcAwpSgzxYoPTDLQErqKnXz3CuQ78v6j4LHKBt6pImP8mMlPDE9SekcoqdPC3J3BxKc
SrN/bLoBXeorgCqP6bvzbhmQKJyz4kZQwUXfjwd16oFv7BNSznYWG2hE3OvAyAB3JrrhrnGW85Uo
Wcti3uo/h8nWe0ege3PcsjYwehkvPThhPIZ28GpYCWcQ3MRIKFdLbGclhWLg7sYTck3L4gvk0BsY
aLwqlNwZOn518oHKD2lRu8kB/Re9ETLP7j/6hXGretNJJserYIQRoC0VDbH1DLHQt3sWuE++SJjQ
SQp8LDzQjSvt5PXN+SemseMb/LOfNqMQpBtGaEzCGEeGFMKJw/S5Y2rApZJOoNzyajirGTZ0+gDm
RITfr00eiMQKNSh0+kxVND3hyK/fJas6qFYWEWR4BTLXAste0Haf7AI53rhPehby1Hsdi1pNIsre
LGUqLyBb3LTDtKPKr6GOTvHOaTt3rfwdelks7CskLxT5Y33QnkAe/JjSDOe/rLwCuRAQvQh2S5tk
wWIuSaRXbxvWYmllHG6aUw+ZC0Mm1bha4mOPklwP2pmoCPFvLWQwTGyc5YjPntxVSPmvMNXk9Zq6
zwC/HA1fqyDxPFqv2vQujWbYBq+ByiBk0lEC+v/DoRi1rR4ekKU6CBsC9JnWv4ymju/ToUMq9+uk
G5z4ip+I/GMrYnJSwCKr4BV49FM94assbTqQWpg24TkprhdL2MYYwKACqY9YLGub5aYIFLPJNqP/
y6WGcbbC/TLxCByVg0Xr278GEOLyraUJfEep7teAXKKsAb/0teDxjn7uc/O9FTpTWxNDOn2jcDqu
VdcuaWRiQFk0775wtG9edEkPF5WdamJFy2nY6XtxkFXBSP1aoWQpafn3STCXgEN9OeVVFdWkiOmi
Jv2HSOsi+DEH8axMyArFu89RtHJPN0yDKUOr8KBO8NgPfOCeS5K292cVrTW0KVSpecFwsWowo+9D
YADjGfP3XZyv5pK9IUv5YXIUMd9iNW1XvjWXQcROyvMmYJmJp1IxVZk+ATtI7KFP41PZqE6WP8vf
rKLV5c2J7ipG2fkYTTtgF5COnX0HRncCRozEgUE3SzGgwYaSI9FX7OA4ygluilR3PWhxPqkL5bJj
6to5pVPQkMUD9hzPx7Dp+/RIy0uYjXMmpwZi+bmYgtZutzbxDCyhayjcX5PjQNxBYlIpiVsf+WHA
+xdZKYkE8sQ6Zg1mrfn2k9q/pOWAl/VxmEV8IB/VrF9g6lbDAJ5odAcxsX1grLPTCcvkTTdrrU6U
sdGVHTw8cvsQlQSxBdM77AYqJX+NpSwblkAt6q8X+E2WTEzh/OzsMvEg5EPa8wN6SiFw1fcwSEbY
uk1Te5sV63rAVebEz60u1VhZQPNrfu5qyX/8T/pnwZrpcAf144qExDpM7stBzhNQ2oHPiHx8Xay0
AYr8yNVZVePG0zw+AcjuTMVjxuTNlpmpd9Vt9I06vmeXEYWqZernigVxJusQrwhnlgZfgvai5nuW
hp3f8/CYlz/JPP5bu8WxUxgjo9Wo6VwWwKHn2Mw2VVXHExeaQ5JO8WzqXOZqJh6GaGTB/7uUna57
+/zUqGshi5haz/wShMlO1OS1nMMS9bR7B3m/16uuvwEtT7GJYayzC9DQFPQpnVhp/AcvXtdyf8fR
sgXFy0/0F0VJ+Y3H/IZ5+9c6WOdLe/g7wku7C/WDGTIO4mhfdHO81sKrt6eKe3dYbLvYLrHQvtoO
6cxexnX3GEAs5HRF0B9ZQVzuJGlE3/azWwD9piYkdxeP0sOlQdjpsVslcrB5SlPCyE2lSdnEb3G+
jVDCnw8QAfPEkTb8uDMZrdA9vycI8SV6NQeeFbLonMD1/6adx5AEJIWIcZNc1bxMU+kOhbw9LGB6
10OpjUaTc9tPPun8mBgDSvKHsE5rSqCArk+bWgd9SDeM8irHbN/JeO7viyz+OLaW0JbHMLphoNCU
XEOmJxxPQ+uI2wnMAzB1ceLgLw4w03EuaryALJTGSlb/DEjk+eAEX27G2IZKR6ktTfgy9o3FXLUe
RjtjqpUhGJZFD7I6BnqULv4m+6UNH5gz1DyvnK3l54BlOWYBP/5cRCrevZbbF9RKSH8L2ziSwvlV
FDMk/ctoEM/H4W5Yv59Eg99e5NSU72eHNfcbRwxISpRnPn/4U2NFVwPIu2KeTnHlwVcuuzzZmKtA
8vews7KceHPT/TWS/FThOTDqLklIUf56EqFG785TlB6/oh5al8ALFJm7Y81YfOdqG0Nf8SupAEr4
noQv2LDyxp2qbQwDOceGVFOj+UevT81sS1BRkBFQtTgRs6o/BHKqQmTKA6cR6MwnRj8Zii8nhYaH
5jCU3sOCvUqpwcNWh3R/0FXFLvFfkUXS+5Y70uOxAVcB0YzOyFNH8o2ADn3UcF3INbbMKcl8yxbY
GeHZCKckP0e1R9d9VsaETp+L2GmVsasApJfzSsBzRbenvWBdmfWiVsBh1a52i/EJSuBVb3aNhzPg
BpARk4cesNardMAm0HewCNFH+mLqnjCXtBQHWdx6iN2Xj7cnMKCqa4zEh/TqfvPL/LDCIWf4HMBZ
gcD2Xmqo2d8jzmM95hqBC5A24v/lfpc8NcAwHimAQRgEht+acJg2ISFPX+zQmcurBqs4s47Qw9WP
3+XM6kHqzwx3WSYUEv3yz1UIjMv8Q4sARlfAYZRJwyoFL4rEIJ3paiPn3XBHF9/uoReoUtEicX5M
VsBHCJsunGXXKPjpQL45UXTn6IFfPcQwK86wal1fRBFaMK/P9zWYFb20PMFI48EQb7TylZD9mCWk
sKnD9g4m+q3yA//OeR/KMhByxYHwn3pslEy9BuPau+5FCww3apF2TtRcUrqicoV/mGi4RUeiqp4+
eIYb4J0jZNztqnlmYNQqYV8UhK2EmdhrlHaj5f/LkKmIsHioQw8vUCk7X3UvaaWYnIMAGc2PmO9q
y4S1MHQydonwtF0J1i0kFIURw/uRlXin7cp2lvmy3WJNxbTPAGXRY2/5jjQi+2H2Ow4TQzaqtCVA
Ph4gIgBeHUpqp0mzDDmabDh+BA4vsIrHi0TjQIPg1j6nFqTZXC57uHvUWgS4AI8XIw+citpGNkD/
RRx3J6kjHd837K+TFIwkPqlDq+0FbOAit4LLX9mRjroFMeKY3Ym6PUcXKCEjv3WASOskzYj1B5+j
mSeJYuY+NYog9FZ4hpZiy4o6D1jVWzrlv1cojIQzVGqR2R5BiqLyCjbZkDwcJhAGBNfo3Mm4oMYw
I+6MiOIPrXGdoF1/mtf6tbmi9nADCKb1rIfjcCcELKjbZXhpX8kJzzndTB3U0a0694zyb4jJW5EC
cx23S/Dg2mgPcfroeWDiqcXjK5a/peZfC3IvBoTvQtmG/I0d4F6utokg1Qwnv1sJmNCwJXD7dduI
qVWpFdSUkx2+MMP26XOAJDX4WT6UtLkbro409QpsDC7EA1hMPBJsIT/66k/4j3BtUceb6lUQMM7Q
gOmPJ4jKmKIf4QDrUqAl2pwJsBEHDTE5WjOhhbzr78XQAtER7j25XIWl0VlGqFKpFteci6ENDma1
c4HzY+QOwTO1/FyGQ0iYq1KwWUgnJ+1yIoSu9b6fEOOUgXp5MckeLyHIFy4fzIjBW2/pYVFLKmCM
4nDuy7KDC08BhzfV0uMB+ggdqxngrCEVvM42BkZgHtNw15aR/vmrlRH38sTpg4x+eO9L5CjEXEqX
tNn4K5xR0xHCCBUqv9MYr5ZbqSN+HHg+yrvGczAVAeccYJ0VysbOhjZipKKxcA9rVydejs57Kzb1
E5TErg7UAj6n7fIC6zrLsS1qw9oq5CrT+vBMXxCMTWvY0C7J/BMJJJ+TBHDb6z537T8o8Sgdef80
j49Y3d/SU0JDk2o7JZ7cHGjfL1ovhymPVw0Z6HcqgEwzAalToEViiG3df5b6cJVEyr+25A1Bl8dR
5M0IbjRHBus84M9YOwHzPU1GNEoiUSTaWcJUOTBGddvTXbWRBshir32wFZasphJtw3Mf6CEhy6R4
e2x5uVhft6AMVOy2xOqiMK0+9nbM6cPgHhi1aV8q0B9XMN5VQm+LkFh9T3sdq9rA7hsSFhTX1zle
AROvrkafS6xcKeALvWFzgyqjOXonAN5hUHJJi1w2OQB4w+5541ybc9ZUkTNL25QMhKcTPzD0NpEo
Cv687hABgulZXmrKHcO2DxXvNzgt6gyomPwki9oXRfQasy6ikx1537CvtVsL9z2/UV10B7477U5q
c4JMNwELOZMcIYjTm6sIhacrw9x1BrzjA0mGvm6IVw5re+9v2fnWSVsOw5UtrMiny3KlWYbJsoXp
UHLffBxmj0pP2ox3OUqukyv/Y1kUzrhs7cJCTZesH8PSYJk6Vw6QhITNoi8X2QGJgfhBclYmzUzj
7TTHtoO/MkDe+qTmTaJvszP0vP4UVw6gOVvIApSsuiVQP1fqq/tWOoSXWA3YZXiaQuvPU3nadXHp
S50H/BDBLLmEqKrUzK9tLSdyM3u3eY48eT9okkVzPa+DjTKO9yZhmFtFeMLsB/115mxBP+Dshj1e
NBOckne7yzTSV97xgcRiF/0J2DtE0ziTwb/wi8sffT9sAaU7j7J4V1ane5vmKt8Zhi0kZXxUzihJ
Crw1QBkgQx2aNGlJh62fkvK/W/Nvj10MA/RSYrFLnjMeUzkxKSbJIPJE049C2AELLN/KPwaq9imR
a00FCGX+BNoTa7R3b7yVAsRILen1kLV2Xf8lvy9h1k90lRwEdZ4XEHIMwIu/HhMppe0/C6yGSFI8
aj49lFJzzEMvbXnjxBs0YNNo4QuBa21F9iVAPa7T18ak30Z+x6C4ZBVF+vGlOCI8wuB5Tf9cmG8l
a3WX12Azvhw2uyGIAFSxSNMSfl5KCYc5f0COxRXCFNu+PaEt+IlON38myUcByrZJDEhD41IULaq/
ypRt1m2W+B4P1O0XymcYK7WZa2VOHDvpiZGE0i9LBtYLrrsD8JDDakmDoGoux/IHrTpIEuK2f+nW
XxZwHipBA1t4zGmxGvAsc4j0Rdp+UV4JUDMrPNwcmv8CcI7ljKJjhRS1pBNUz1s6HpReNnyiywcX
czFfnfu26pZpB6/ugoyxvj+eeJiIQwpv0GmXXEa8uSynRX68umfkmcr+yywHt8vE6Rg0hZh+BQDw
BVa75Z+8trcmynJOfiUFwWS91vCMRUvuz445VxD8ui7cXSucYzZq2r6xtrw7WFJRQGvByD/X0YX3
NYrIP7cCpx1yOntkYnfbQ//9TaDs7QMNf3xI7nzV5Gym//O0iaxdXi5dD4e7SOJEE0w5G/xinBJO
mrwb6G2CgGqkrpdimvWFdheQqrYCpuHi6bKrNs6wLoGVCN00/chhztGSx4y4F+bfpZHUfZ7Avkgk
NwJH0vI/yDMFXjYJcu5h1+eztoMnk76aK6r7RD3xyU1yiMrTBeC2ItvpSvQu+hZT9LX2sc4QiSK4
ZTyB3nsMEEBrmsC9Jj5VdLLQwhFqhip1GJuEEXv5+NnUZnM1u9lljcBnuY66YwkBtcPKdY288tdk
jNSC99s+X5KpZqb3/xY+PUpVOWUmBgiKxCmTPl1lqOvBEl2dBgCPGtpZcfYqUalRHrOIuJKpdKGj
hmoTnwQAOwo13QRWKOluj9f8ZafjqvyTUASoSPXdSt0AsKnERpmLnCb/FjdOjU9eel+Sp6FoysgF
c2Fp1E+gwnpATc+5szqUw8tBtIlRcHKnsnvGxfhToyh5iFLBGcIRmeT8GyRE9FeBVbOmG1k/+9hH
fWSxweS/KJYyY26LOzESCB6zF7ajed1Iy5KU64GnbdUqcnFYqwoweg81SZ2hpcT4DTQCA18bMneu
AkkpUjOAzHwaXYkI77N5jNSWj6iTH4B7dVF22oxvFWkUmbz/ncohZ4B8CfRm/a1OaU/VStST8jIO
32R5w0YGFgAaNQX2Ahxb+QO1UJkRe/DDG5OpSgAXwYzwvWVEmqEKW4iM9sBUwGutazLsWbSwO9pG
ilMerShzxx2gNgyG9aTDYmXuPPlaW0xh2AAPtCV70v/AXOdnfcmO5Hv02gY8NpzJNJmlw4sVP/Ob
mEvcv7vy3gI9t5lYTPC1m2b5USc1mDI/IGh/9g7hXEiZNb3sxqpSdk6z9O36+gW5Zh/bGktd+WB5
YGGuQxKhmq46tWxrisGJgbYXEuH1mCJBHumeHeMcnZjrYHLfKNrttBMeGP+SI96+vPoPz/ynO9wF
PVcnVh9Imib1nFYu/WTKleoyjLYFQlQBXP25c7Vqmy7J7fM9lCuiF2eiJ3J4c9/oOulP/24R+qUS
/4bjhMkAuMyii0jUfmZVk38n6uOEnAVbAg+BoyxH2xcB0F9qtsdHE1re8OL//u4kMHIf+V7Jl99J
Lr9tbtAHJKLNvtRRhV4ClNMb7Y5qCO+AdkMPYSUzr9OCo9IWlG/2E5gm62X39u5oObx6AJ53dIsv
F0Yx0O00iM/rRSN1MpBqW5X8gw8Uxz00WbnKRIN9Aw5/lWS//XgGh2sd+iZ740qlFmpsiPyQwPBh
3MYx4YyIyV7QCkbgTG6ZeGpmBPJrTjzkPBE8D5kJu8WoLH/cR/LHcULB5hktmhdHoWGTNN8YpedA
C/8yFDts924WqWRL8wM9MMaRCbRH6DppXZB0J+z17PJcxReksS2VJgX5VPSvAn65r2ba8AlaghmI
jstfVNgmMH9NBZUFv6SMz51UTiYDtBE0Xd0QRPqsBZPV2H5oNJOKr04tPGDH/t4HwncXr6xFco7l
HXybTw8kK6t7pd0ScIZAiq21suzMg3qhCKFmkZ26CrCAOZ/0rBz18aiCActM+dQjTvjleAeWH14M
6LYFlfBLwn+t5IGZY/PymVcDQOxfs5xGAK3r19h+Ymblm9xXYzk9SsaaChqinbCH0bTLnE5iCQra
kllbw1TQYZM7Ut27BW9yzsk/3ZC27asqGbktt+j7m/WybvbkcWwXK1vutdFnC/l7zKgnPvVQfOhd
EOZvSRlzNX/UfFpTDICKWubNgP6jTERvPUjANQe3f3gVeSvniRtYrIGaqIRvibap/uYxaL6aNRV1
f8ObEQJ/MEOMaNHfLYKei7w1IZIm4ZWY+PzkpycRws2V/WOKaJ4mPAMiGxXK/BQOoLfi/Y8CbmUc
I5zUUHPXLxAVFxgv9UTSvwh4v5YjPTT6QO+c7N8yUX0h3k1YWTndYr4Q7NQURhN3n0fOSB3/EPyj
UxT1Ck5jYbkOOzrLE8n+m8Eu4LhE3crDClXeAKDZC3y57269SN14KzZGC0Q3/4ecONo3ikV+gm4U
WNr8DlrJAoSbDBwECdX2hL59O9XAroWcFerZO3ctf4+Ryu7QfKDTRItnNzHTmBaT8Bk8Y56ybfVl
KydP74a9AhPyRXgLCauee6kH3G+DLIv612lJVR22eqOpqhpwWIUP6j0Jt6Hqu8hY/arsKOKJbBXr
zZGP86B7Yz9Gfhu4ZZDTh5bsbvqMUvXfvlqCScRMysL4jjO//2LSaZMn2Pu2JxiWBRqTtV524wqZ
7FsIB24Xg4qwdUMqrMCk4go4xZjUpg+zBaZ789mzp7btp9VIAgUzrj9IEKqZckoWphVOQXfwZtbe
wPbvHyIcwGoF2ofGyl7JUOoBkTUjZJEZfKIn+2Gs4d0LZ2fwQWvx01Z70NBq9d4y2ACoSJqYENDR
UxaL0nIhw636fA9AGbZLTbs4/ZyOMRvvj1ru/ZCfUt80DFY4PJWwhkY7eDap8DLdNfTdWdqnopjc
dV7g7rfCDekclBYs6nRqc/u1oKKdNkI4TU3rNc8EaQxMgGhF+NU/GpbDhNq8C9RG9U4AeN070TJb
n2bj/0sFXxdANc2oeI4fXx2cy6c9a0AdvEIGplSCj9kxQ1moK+g6rCHgXpxAewdjCyTs9gbkyEA/
PSLkoMneHrhoUi1UW8cOSAG+DeyWFPEiVINW4yUKZM46E30J6G92QdTQR5gNAvkuEUdg8zwxo24S
iCx+CaYFoue49g+vekA5x5NbmbUk8ccjzSUhvTl8zf/el4jVyGyy7SdXjR6FzU98QBvgVAusnjKw
T+8Gau4oplRLfBduXtqexrEbQrolw/PbR0FZ92SAbjFep9JN3KBjdgPZMKF+hrhtDrOqimHLg8/2
juLddRJcA6NItsvvydTRthcGFIHXgfKNmLo4pd1/+IPcSs0nW5s0pxien3tQ2VKQtAuxIQECfBDX
Np9leZ5jqrwn0lK3/8F/YrQ117AY1Jf21A9pCY44cq/60vIv4SizD89mjO2j6bx7k0yov8FLnetR
SXLkA+XsgZmtyALc7edbqWio+iACvVUPr+Mfoi7Lu6HxaMwbLl48lGqyN+NSTpeyblz3J1IeGypU
IiGy0ymcc/iyPln2O5aEiVzSQR6fLucHjlbsekZf0AXf0TTWQ6/1AQx4o1dGSRarDfQTO/BtPMMl
wn+NBhPeFoFqSvCfiKyrXPYg/n1WAWoNDp5SLqWiaHlPaGwUSXYaZU6febR2POJfLMQYQFJ3Wgnh
0PCh6mEbqicGPwugQHXOZOP4z7PVwpqX1LY6+BtbFoOj+xU62aQ9G/a5IfDVLcQbsUn63q5+9nqg
HNxPtQI+C9qtVzgU7B36HRusf7LiC3qJV8OvDyGR8oWSqVPGUyU20n/vX6mXflSBpHtDAOgk+Ppu
LTrAxJCe6Tp7okBgwEf0OSd1C6TWBCLx6t/narPoJZetqemJEnv4dqslLpFFp35REt7RcjtCRx6C
26kB5dmCAFLV/Dbay5nb3oa5WIiF7ldzHsZh7n+835mXS3znJbwn7ZQQeYAMF2yAv53Lcmb45+DW
EgYBW7HCeDaG5i3KPclRCDyhLdFKrhK/olv5TGdMiARZ7KbGn6CU8Q67ikC+AWcFtRwsHk83t5SM
njt9/l8kL7sGjtYYpjbmWVsUNkYE41BfpZB2jzAiE9Fvzkq1iWt9H3CYcjVQ0YSOUfHyOwekmJGn
qR9DTciHo+e3I7ily1vSdH08DAeADsTE/hbK3IvCFMiULNj+6lAYF6vOJa6Om9NjY0OT1EsYQPFo
AwzoTao1fCzDZ6MirE1jkW1PRq/nwrJq82NFLFVynpyPvu3GXhfa6xNWocLwV86+rBlqbJDddEx1
sSloqSGD67xPPjizRlSkwV+Q4sEnTf2ATu/soootorkRulkAbJx7LtXDuCtgxKY4t2sp+82H4z76
e8r7kxPMB6P4TjFXf4Thoo6lAA6G5N6Rb4tAPx5uJCTyt9rIuYXiqhB3Lye6k4fuI7WxN0obJH90
G00cME7DZ94Y6wDH9/QnUCb5OMrnWDSHfq2/GhcPY52jxe/IHgS2hCggcNBbTjFarmsPRQ/H1btN
2OK9x6RkePG0+rnDdcsNwoL76DKP+Uxog3xUR7VapVBczzQs2c5F91JAHhb6JT58hoxdA/4IFikY
O/cvoV7eCi/oYQK4h8Z/cH7c/U32aVJINau149hJqNcJsxONvtUP/73Vmy+t5255Iauwn6AzuJ1V
w7aI5rGM8cjzgxQZY45AZuPpDusA9PxuNQfZkjN0EyrO/Vg01frEFxFqJOC9A5HjDwpBn453uOSE
Rj8jujdTT0Kreii/wv9FiNJ0wUkZXmQSUHRuSavAM+IbLHw+rvihSN/y0O4BpLvWaVYluBeS0Fb1
e51DQKJUHuE86DpV91gdOlLt/auZEM0DtZqaJrjPfIWoDkbOAN+IUpDMDnuCEIKN7GdS8O1y4nzf
jpEF3onIzusg8wy+4RSAzRp/t9XmAK4UhTFPUIAhTb58IUxtkElq8DMZGD02uhGX2zljNxUMUE1J
PCgLrfrIlFzP92/lnNibJtDhbcQe4UkhBof3OzIq00uf6o90pBOXVNBAj+thO3n9//WrJoZ8VA9m
09Gl+AkYtokBMm0M0GgJCkp9FYAlrNlW6IT+lUXFO82tugpkILnlG3J2Cc+FYjkHbsdc+AdzLUjs
6QjQO6tRZG578Q2Qhx/RXxVUjUmADuSKUUjfK1URINwOEBo6/k2UdvTj9zflm/hR1D5MigdvZhpv
8YFlzT3dlKbN4c3JTzWiT5JbFMaa1B9ifRjeQkNVzx7XYfR9M9c/8JCMEEvXZbbtrOWbiDyWGaGC
fQrj8b9d+ZdkbNPefrFzn0GAl/kFhWwmlkG2gDkZNVy+hSE3Aox57cxQ1JarbWDd0EsxnOAupmQ8
ASmIBD5ocjsN9MXe0jrCH33UfUy+qy8zMe8k/cs6YVb5PZN2tiR3f3Xap5wrSci/W21lMFfMSw5b
ibsf6mAeFYNIJZ+BAshVCWqSha9sxUoT8Msj78FuX3jmFVpXqmpfs7AHSI4HBZewwcclC/AS6axH
nYnuHv1uhVcdq5y3AZEfqWwaE7lyDuw0fX/WOH5T2oYcsfdFKulgLvKOlV4aRH+O2A9tHgfucBZn
TZk+ULf42wKhyZNihAL7a7+zXUbLIh1Om3riX7CxLQFn2OxQy0xoXCI/7G/taKQVdBxfMTymTB0j
4MEly4O3ZnRsQo8twt5ln+R4gBivLTJ2COSrv+xAA30rRGBpf9FPXu3u/u9CPDnnZhzWnVng4rPV
xcZ+x8wLkB7u/1xu7A8VkwT6ugHZQIJQaPEuPWPj70DpKpqQKDwrWtgG2/T3lxG2apo6pevp/bR8
ROEOYaBFwvikGSV44psAd5ctKuETU/pzzwWXDHfEYjfUC8v4lmsLcq5XCTZOTz1atmAlk1rs53Pe
uyPjJ/2KeI5hS7P8Tgfrpn6NavECLIRZlA/Qras1Jcpv21wyYw7cFW7+Zs5khKdCG0/LpSuS/6E5
KRiLCjM1WogAKQywHNC4n4PI0F2aQXmYGwY7yG3Au+J+OR7FnLjUiYhEzCjr2UR1twfclh3W7Hxj
0cZzyJTa4i2RPxZWf9612b2sFGwtg+aFwkKcCS/FVLadbF9cjPbB+jsKZjQi+0cuejAskQ+Aftjh
dUaofLae/8oKZoBwleZuMG2ncTeUwhknWj83AxRO4z3n2wzat5m5YatzryYBj4Zqc9B+DDoweHKs
g2rfL0lP3Q6XvWjI2HVDZCEZKv/S5NKr8Hon+MXW/4DRQ6/DrrCeVMkMhOZr4Nbm7x2y+IgYfdzm
BXZUEvKNFvVGc/OQqE9t9UPN2M8oFSTi0E21dl4nzD547fI7uRvHG+fyNItocZO4Nwf37+Ky3NgI
umCuF0dVBkfE6PrlpgngCcwjPmKNWgjB288axCEsyj5qExbJTXrDH8l8Dt2HeW/GIS0h+A2+LbwN
MOcrP8bTRDChelKsjy5alfpXn4IOzyB/EbrjynjphLiBs9NfkmMGOQ1FGbNcher3UhsQPXF8IcBx
Hx/Gfe/mhTFdCSs5QX2CC+T+n8G5VSarSKU+z4RBGQEVVMSEkX4yOS8OMCFSfeAv00PBnPDLsaIQ
FLOPy4vuIUis/wgmaetLelaCwQoZFPxUebp6uKPnu4jvq2mOw3YjkFbQqr83Enny4zK9D0zvkcdD
ZXhs9EwqJLNb7oMOKrqWH0VskReUtzjUtVIWXI8Iv2U/BxLR3My6APO8RfYuUd7UFcENmkbbm0El
YQQuy/+i7MFmO2QXb6NRvgFlaz8RTV8RdVvRGST9fXOJveI58pQycYmYsPTcQTBmE+yWLT0mEKUU
XfJrhtHFk2rOo+J0unNfWKyVxHht09pNtkn6txCfkoHT7xiP7HtYXJKsmW2c3eF2FvhkPEd7sNBw
qulW+ng+L/V8mgH6Hz/exZETl7Zz5OPEqMQh0vhl5P97AVMXA5iYtmVZQYZ4zP1WtfadCUGK7en0
v6GDrt5KIvZFrZDlvNW71QeOFK+ztIteyUA7g2HkZqeU8rFNlT3uhtNF8jxQvVpYUA599QBmsxv5
bHq5m5JySHVc2TAtgOFJeAOl8tKBxGAWh1NQ/9CEN9RWjBv4+Fch+D25oSMIFqKTHHF46zqhqMSk
HUdTXC9Q1dka1Ec+N4HSulQZC+bAfXcoF7J15JAgVGjyjPecBJp6w7xbJMJCcurz5H8FEYHA5QGz
lYo5TvfGrk+USVsM8Rt1mu2AAJWFiacYN8nPQhl5FDEQNyI7NbLQfkj7P4/rO+b9+q4pwrHjb7OD
jNkUvIcQcUP0/9nZGjM+ix91RKBvuw6rlm8HRd+4diVWy9nwlBPnyRoFh3Egw39Gl0f0OGUjh0oH
5eMLDVpUmPTVQHlwYy1QZKaqlg5WHvVLk+DqU8S/zSc3/+herzYC7ielXHYtV+9V8OkJDu/sfzvf
3A+vFRLh+wc8GrsV6aFdjiLBsBU6OAzDOnivYGR03/4+VPBEvoN6AqiUvGL/mZbmCdW/R1LILomc
IOtZzs8JykPAEFAGAbWVIqiWlYAqG1GNmoJIrOLj6WNl07/BIfet+qC8qFSb5SgN2rXz5d4WEkTw
FNTcF7Qg/MH1yEa+5LiY1huWjlT0vpolyKHJ/ownqwv9kOruGxmkWRlKbiJ2nfdttKDFghmOwyrU
rzJ0MDK8CrI7sBhpKnj3G75Kv+hw21GBMFOb6Z7AQcrUhJrQwtExRLdzEU2bEm1IymooLSkkxf7l
1Ayc02atgFg1g+ZJs85f0Ra6wWZHybu3QOlwri0XSYSXCNG0QdJqjNYnmDcyrdz+Jvmgy9bfg2/5
VZ65v9aGk6VAD7cenTgWcc8/Ry0KUgHJO3QxTCDmpr0HGvKJxPDx7VxX5uNvm4sMKhnXWPxfvgo7
2Wjw9PaeXKG+Exx2JGZxCtRMlFj8R4YhDaeVGYJpCaECNkuQZYRpy9lyUuVAKzSddBAukE9DAUZF
edSTLwqjMzfPsQl9w4ArZ+MGleNBqw6PkN0Bohe/mIdJwOsmKOFzctmpmIFI0sjkRqDoukCqEAbu
twbedZxE6mQ/ZCD5eaK4/0I1s3NSYJ96idKgX3L9eyN3Qp1V2RojyRzfmvRyou+Ww6vHJD9ExQq6
EbKvnZdkWZZxByBlkfN1GyYpMELBH/6gGkiZqCEltQ3H71XI1a27pDu7F+4wHY8LgNjpLX+GA229
mzTVBf1MA3FrReI5KK6m/p7cPEwGjkcg2DwUXl37MucUuVDrgRr2Tgp8IGtSx8pfOKQ+GiQOZWEA
ciWGmpvVGorOR/Scni1labXuRg1G+xy4mnh7hGCtdZWFl/bp7rgj8cs6gaI607VVe50cpNagL77x
10UoEWY4zq9lR9LH2MPIZ3TW8yaL/Iu4P3zj7VuhdJXiWTT95P4jsIXrA6oQU51eqtpM0lGPCkWW
16JLpd1POIa26AJL5pRRxCvBM8ZOs13Ct+cxyAK+i38KJW4bWonmYzHezTLcWcG3rSnELgFGeBP8
MS7LuAHAJMhxLNWrncVi2LorV+oKxZLyvKb7rFMSyaDEWSWudm6g7Q6IiNX+YQzHWkrDMwod56q9
GlS+UdNk0/xX4V4XuHiTLdbVzjtij9uY/9KTuB1C7fT3qYxg/8GQiOAqJ72bXYEPB9g8fhebqC2O
Kcsab6q+9+/rnJXkLTMNIijWpbMyx3nUTd+/EqMg2qmdrBAXtjZl06q1z8+wpDzUpZZB4Oc5S4G7
K9xJGatATUSe9Tm0R9JSwQwM5oym2+U3ifAZVempEJXXGS3pv2W/5E1uLBzUxLl7ixDJoVq9FfL6
0181UeX7raZR+uCykDqbfVMLLChVF8lGCGG2KepOCaD1xvPhPA5E2kqKZvdi68FEnPW+1YWMMcT2
IIlR8BAAXPCa/2HW0Wtu9BwUzT2eZi0REnq/92Q30ZoxR3CwP/xGeO+KCEgWBEopXemJIT5Ycwq+
eN/l2etN3EcWbq3Tqx4+dLyodgDyS1BrQG/jUxby3cARw17Cwhp0Kd7cSHHFkQNzu/g8EXfKqGFH
1Zk/JQiOhGGs1RfLdF2RZsqsm8+YoS1O0jOFuJt199yyUUZ6BChWzjlom3ObO/sevWdm3tcNHITN
S/UwslrLBSagynnJjFPgCmtghSy1JiAlgldw5t7cnGRl+HjN64MTZyJjwgkBEiwx3dWyiJ+qGllS
AcJWcsFG7l4M+O4tTVF+q6Kv9j9trA7C3hgtgGs4aks7UEaAeWHgZixdC3eoSX0OI1uK65jva2CQ
QSHaRnCb5bzQe+z6FdD6PDmf3X7T/sOZ2jvBBD/RJ66hoZn+FF4LGzuIR/o43zrRy8fQSNGZx0rO
RxZfbVVEJcWlquakiHQASsb3OwTTfVX5ihcu+KYvpTzv9WStJm8G7w4WKkNG3b0F0+zRSy7ElFbo
DArd+o99bVBKwaov77trZH9SZyW4NGHp376Okvv+gbY+DCXaWE6AqnbzTn3ynj4fZefp5APl5p2F
fUaZUCv/+iOkfnqVEeHvTWv8d1kWblgVplTR4pfyj3ZF4xIDEUqSwMYAy2Kfv3xiRRlkr8VGeb/h
uVEVYzHRdCjyuyK4vvLkcigkZ4QUzdDRVXmT8jAB/sc1e5xoL3eQ8QQMNwRTfBW9ZrGhaNrgRsf5
qfKzqZ1SqEMI1Ib1F9PZETGE1B2OleQ1BuHAKzpmoROkkqsPoMV7rcXifbHc1rer7jPxWvw25oWE
89FKLlw8SxEYv4aPri6Wr7c/njIKMu/V+gtfoUoGWT/vQrjyQMqrBI1uuT0eQOT5qtvsRlgv3vad
iIslnGBN158C8AtYnpTeEdKc2nTMGP1TI6qsasMuNG0SJyszKK3Pai1Try+Yh3+KXfX+wAgYnpmm
9Z+1cdwY5kgmLGCgOnnz7R63QBOq58Zb5cGyuOubip6FOi/kWrfNe6yjWb2y3bSaxBINu0i8n9G6
ZgDiE7lE0xL0bNbzlOfHMmBm2vJe5x19uvxwAuz67se6K5lLW2XxLL/5RihMQw+7QMZlNcHqNo20
xqy2VZyzLiwCzpfy9qHh2LzcJxQ8D2xFPWHLDxAkcNsvQL5AkzZY6ny+va5esg80BMkZ1rzqcnuu
IRcbcN6rwTsuzmno+FUErClXbsHYs/Q2zC9wII6/1Qpa0NElW7MQfKo4uWPdIn2Hyo+iULAc4XTz
bXH4DxCV7UpynT5FLH6argofAsrCUFVM4Kk62oOuZgb1DwEvBNzvayEyKFFMap/TWxXG6DPd9kDV
9APt6/v4LkkoeRvEw0uUqKgjbcNdcCk71Z88WJuwCkTZzyQyoDpFXHbAbW+8GJNS1o9+avjWFcA1
DxB242i7OBZklG/XwRGApeWgnlGUp914GkhU6M2M+dQs4kF5nG2IzZMPciRHYgf1hptNL5qKioTN
BqkXqAJL4nqHz+58PinHY7ayaLChiXKV7JUOcouwJrR0AxGR+ChoIKZATRN2FDMdH8cueGG8CQN+
otFm6kO0k9TIlJjU9kZWbbaGHKfwpEE77RUNyRnqjOUwFsOTxAkXKlXLu9UOz7auQuuQYo+xBxmm
Y1DHXI2QzBCnvukGC8dd0lEtGibUKSHKXj8J89fFFSsAljYIu4wqW8NTqx3eZ1TbqbH7kudhmZFH
hFbJssTGkjEs5rXMX0xJ75KWEpNRVCoi1tug/z10rcGDrJbu/yAxZEF09K6cwV6MTB22OrYl/gVj
xFUEOZH/u9C63JeEe//sA/BHcqwsh3llbSSrVlAFZg46b0Efb0OOsO2Sg1+4yBVOeTR4DLCaoSo4
eGndHqkcRtQJ+B/imZX8Xf2CYz8lKLBxAJBW5W3fufycMPne1kjBbohiUiwvU5jzBrKaRkNtDZhy
/PMuZmCzJWyQokp84DrBEri3wNHy+OtJis9hRaTtocujp4PwprxxpwAHRwBfzfxmSN2Qq42pIO4C
8u7LHCMSdr6E+mF5oiy3WItoMJqhyQax/30vsMk+N7SU1sL2d8AV0Ws+EFrLVKz4KTf5yqrLMtC3
CtjL9XOJZ53SdwAm9ELLgimr3bXm92ko+2HEhJCxA3R8SUraEo5N65/awktOpkDwGCv4luvQCfLq
g+/nv9j9ZLdN069Dt8MFijcreYqylp2gxK9GfDv/wrMt3HLKdZvZ1/eaI9/XkMFoo9iGWp7WHY0C
qeOTIApzrvlMoQonAc9J+u15FWakDrYRL+RtF1AUQTcA3X2noEFE1wOOv1xXxrgpPLpos7G7KBC+
dQ3SJZgeIYydFRhBWzgTB79GiTowgLZSS3vT/juvypWJpsDRjClRnd4Jk229OrgZU/R7Su7aKEks
u2m4Ee/wsgWO+fWcm2WhLuTfLxAECU1YrmTf3rnM3bqpzlqg/KCUeG54tJppAIfE/0jKhd64L3p8
tyjNLf6ZzoWdUM6bCFIAIeZUidB6v7lSwAxuy+XIDtslVlmJz/gYELa7cfUFqVd4lgJVTuKgMfgO
x2umkaJrG5bUScHpZ2GFvNsPYSih8ucfI7T6O3I7cL/JpT03AdAWtIgiwOYKHII9guoKf1+vabLe
rzeTHvdhM5+aKQ/c3/8b+MXXoa550qZqcqeUYss3eypTifGJ4vdbi541gTKzeicu0qG8kLHWoPaY
hpZG7mugvgX1M0OzRhRTYh53e75a7xkVHa3Zek4YuK1osh2lppFddBNZF8N127h4gpE+WpUJRv3m
tgF+nvUU5fVRJQFKJQGKzt7RH2nG5q3kOuv/6DpkxnyP2xv/ktKP0dyLslFgiS8NJOx9sy8P3PmX
bPGvt1yhXZFJOBONWMM3Smy5rdRVKdC2yRJOCsCtL1pVM25E5tai5XbNmQaoAL1mLpaaosF/KRnj
OeWHdlGghlKt5LATrsUkqC0ME2A7VylrxU062YkPs2toD6nfdVVz+/JHdXpE4nNwBiop3QvDVNoI
YYxL2WA9DbNFKzdG/Moa0yAYwR505lwcZ14t5Ly/OU6DV8c8Tsu+mieO1wBY9iYnsdLCYR5loxus
1OvmgDcUxZrOxNc0iy0GX6eTf0QKWJgDP8aPmI4eOqbjml9MrqpkM1se5/BFaZMTOMULjRe52/Cr
WtZv04zo0qZdqihfkbCwkHCaGA5hdRnabq0LjZv001Svgm6BxsnpONPDKpFRGKutriFtJ63rRQcW
xH8q7L7fFpXUNoDEN0n1NJufUUVtmOIkVCgaRT+iP6oo9ktzs6aaETDtJ+13/lzxySUAGeBQC9Ty
j8LvjxB/oVgK958RWy2OLByv66bCobGsgvJBzxZEvqWEMUrWPWh2oJCEQlmKtfUfU4NBX/HbK5Qy
FOz4aEzb2uSpxmVB84js/+Z07iIvfr3UN/yVGSeRMiP2Vee3G7qhIbhm0NgH7swzRUdBlMTsAWSu
luOW86HDsnbX1c0dObsNYNxtDMbTUJJLZs7usCrp/0ZBdvsdyMIJ5BkS2RuydJ9XSk61UoKUkvq+
vGEJXgyL1xHiAqvb2wHLZPP6dVB7aE+JCCZUrqAm3g1zT5x1K+vDNzNGohjDl0DuMjAPzzAPUnBg
XlJMzoS+F4vxFRHSi2XIUpVRyWZkDO1Zj/D9hn0JoUp3WpE52are4Apni9hBO26nYRpBDGVPvIy2
1fW3esO525Ls/reSVSd6e2AQd7Yn+CxprdbgdPKK416WcBIgcH8WarErmiUEkjurCafouIGxXtz3
FA+Q7cYGcvJTeGwNdNIfO9zlMcXMJKU9lFPyQD8pwUSeeICOx5bK+Ki/V4VX2RcYNvyOCY2Wmmx9
EN8l5CYNzjrLRYVqSixDPi+GGCnnq+3iIRbz8CMFMgnArRciwOwO5CVlXNEbnNJrETv6mTzKRxE7
hUPl/DMkxTRmMNQAHsM43nXWAn4wLfhOS0gsH3aJejIikH8lNLNp0jzihtmgf1ULxn+EzxkGCN/7
K0rnkwlM29CC8/0YE2wyjSHjnveEnHjDSpRtFitc5H1i63tfjK7Wm0VhB32jN1viXOPTZfJmL/xY
i6is37iMcQQuMHJ1kDoJIdGVRDjWHWlIevOJo8cXtrGVd+a+w+YrpAyCbG75O9QSI8I0OqSPOGU2
uWHODGVLL7A86+dLxy3GONRdPKPuBX1RTY9AFw+JWxhAhZxanf0SmPKfVghQzDIic0duvyw8dd/y
Mk/4vrxyi/3sTLfAzHAHjvCBeYqP85qSV5TTf/Zizviyfn6g+y14AekZspz8tspWe0jE04iZfZg8
mTOYRPrmIN7SuN4k3xrmSrYzm9z5bolNIZgGfhsa00He3ycOmgT5Ko/XcZ+9TmzxJOLjK2vYilSl
DH/8npGyZBg9MOs0mSq01S6rHd0Xto/2ldE7o2JeTd9GGc11H+x4wW7UrLNHoDr4DTnBhX2Dp4+C
E4x4gSA8swsVWN2eMspE00xAUdUe4w4k2FmVJuyauaKLEL5/AHc0bq18fZSbFzzN3j3Jz7t5APvp
nXf2WQkXHQa3H3PDKSy0SRBlCRcCcLd21WvlXrXshEMKBxf0s6q8M423tCyF9IVCo7+IHZYnEuGb
mwnsZ6jUYiNKEjiauT0fFYb1QHSSlFiWTN540GQDABCGGuVyl+nWYwNSI0cAbjFZDrcIAAgzqUja
CGKl9B3VMOf5F0AreO2FqwkEzb/1DJ8xepkbDgU213mQRq+1FspTlWMnQq+VtrQQhQ/mME01FAFn
Fiq/t2FDZGi6vVYc6skrrSt5tG7p0Yf2p3/qOPbO28Naf1Vf9p+j9+13vsZZBSZr1nZhqx5qy3we
ZxzW87XPGDocVzi8h0ik8IgyqdgIMcO5RSMaJipBZ9JXVpgnqHnCEMlKPLjJV6T2i+UZkGen+tPE
bVR96a6UPqYlF4pV6G3XqB77OgJBf2wijhdLrYmr67imrcCthzqbkdI5aEdFUWZXSCkb44IAp9Wx
Espyb6nC88r4W/pkjr3NY/WZfSw9L1vVHT0eiMSMQfT0/+cC14KaaqyuqaQoDLqyMj2l0hKdxX9A
jbqqJqxmRZrgwci0kb9H+FrMt04VFUaL0NzFaSWnRe5i09MMv5DbeqfX7ikBAA4r4FuYgxSSUwRQ
FNV6Q74KcskX+qUVSlvIfNWKFR4u5+lxYS/zOgJ0/Y6/blO1mUPlUnqf4KzHWoNLd8+lJP/E1nnA
8g+skw5st8AG6vuyPV/MpTVQhHuB5U/zWcO1CDbj+pofSdU+Oa/RdlkDkoduJpyU7446djvGLeoz
mFY1T1/WwL20ELIeNmx8dU8NqFi/qZGvAy9tMyGdPwVvUXF00ovhfXKke/z3lg/GkO1LDp/N/bpQ
jIMjLk9pvHwLXTIs2UMqd90DYE9tQoHH0hAhPGKsk9xCLaPuQbSNZ8S2x29gVlUxrjxyAqTOOqVQ
UuILg6edXHWtOcQ4iKPTZ7PszauhUcLBKe6GqT2Edu5lmm5zO+tR/bFso3btXABuRq3VuVUwRxeM
hjCiR4scy+AkFWqjBP+o3YbyYyL6TpJw+ihWG9phCHJHoiOb6CrGi85sWkWBl1hyQ5rRk9yNYulj
rDUGYnFAn0zLkR1PH0QN1Ns4FUxIg6EPS+k9QY8U86CGOurrKbFwPr3/scaND8fn1PSU4l05iUXU
w0Pn5VMx1N62fk4pTBf0g8Ir8ObFAlXh8FrrHNFj5oiN3BPrMuG8AsaLlRIzwhRmksC8/6P3IRZd
nN0DCSST+ZsVwJoJAhNu9kwGjX1TQZYYygjyEpFeLF/QWWr5OA66idgrRuQfcdwf8BP4kI/+uVDV
oeBQKE8tD92D4arbT9A8m5FLuMXNQLXuIM3BWwejwMrME2rQKScW+ukeYB8xBO91IUnDnPiZaAhh
/ODzZfTPSZCv7Rq6fz8Z7b+nbo+MB6zZQ8YYjr4cRd8q+sHKt/ifYUHrwMbSUv15YcfWPGJekzK6
j+d6XoAHaD3ldqGo0bCurh8pnUGTAkBiSlUdX4z/67e0TZOIAhfAYJfrFvkYO1MHiIC+DL/m34Y7
fPfiGiqux5/XIu6q+CdMBWfU8X2LDUIHXVceuPGFhWrVZMuLIWWk4zNiO/fW1xJy6aU9FkAHnzVN
eCpQl9N2QKjZFroyoxXGMwIAmsf5f69GQ10YBAz4MjJnXGZZRwaLtvazbEjJ6RajQPkVeH31bH6m
rzULddKDOfIJvgcqTZo59481kU71EeFS5A6jvuPI2il+uQyHrlikG1RKxDhvluSiZo2PBarLyUwc
+c2Szt9/w9QqxKhQLuBfhkEOd/+17EPkfyQK2ObWPrAV0bTzyJ3sR+NxKykPD2+40t00jJFhXp7f
JcrjdbC89ZkdRmnhh3IUJR9L99KO1TMWL7n3G1BUGTy0rCqiyWWOk4SSElVti3OQIFTKxRL6hjUM
+dMctT7su5lT44/MvKGRb6bQB8BrD/R60fIfqv3UWirgaUs6qIX28ro4a3xHGxGD4DcmxS0Tn0TQ
q0Yjt1umqyiFvqYPSldlNP2m77p1BHhJ9D93PScCnhVo+kAg8BSlzOF0lYgglWiGPsXastY+oG3/
yxWAB0HPqpupzQHp3jx3oAUN5o8+RDK7pmrPTeMOcsmtxExWXA8DwOfbGhL3GcMRDbyCLaHfFfEe
jUEYCuq/BbM12uDsO0SYanE+OQJPNGDbmLCcH/NjupBSZd7wjLBUF1gLd3CfTb4dtrNJftkN5E+K
c16iXTvWmUFun2vB9d+PJvBnbzwntCHBpjysA+fZ9wQySl/mhezQ6LKJ3x2JMP5pXGDD9uKex/E+
0GuoqXGp9AO4iDV0x4+PwSUHJgeie8ikKO5OKWuGuxvwR+2n1u+BLtIG7TonWpgV9tOlYCRgN7a1
CUUkugIcXRat4YNA4cHgDhV1cpUDEBxfvbb2ze21+3KMHQiR6H1deUGnT1et82H/S2y0nIhEPOpR
6QRA1WHcR1oUPXR1ZS7P05IJJFrIKWpaeG2akTLijKc06ka2A0yhfARoflwhY7lzO7REAvKy6OV8
0vyNst1qvLCZZn9v947he7+PC5K9EzCi37PT3Zh5qfylQvduiWntaPVxt3EfGl0F9Tb8dYlctFTN
dh3GrwxJZ9urtM2vP+tfIssiAd1Hbny5Lx/WTYiMYncyRxaOmvKwwARm4qJIT7BKA1fITjnYZzCD
by401gGY5Ja1ZcM9h+8RzXDyjQ9qAwDo0UW1OKiC/BCG1JHEZ3j5ZRRHCr0sMIGai6ZTu7P056zu
GOCild9JhQ70QVDebynkjdWHm+eLfzK2cpl2B3J+qYJY2YmwpMQXo3dZvzroKzfHdQfYCdyzvTTW
OyNibRgKWhZ2Hjp/NMyqs/ICFR6CTRWVncaEILBuDpyNG5AodCt4298aT+qUqXjE7Df/X6z+OHRs
SB7BmeBHLWdDMzwq92qXJXbuZJCnRjupxrFWPFpKyWLXw/efQ6b/M/JykUBgQtsW8TBvMV+xnN4+
lG1EClnnar/mXwBmtRThO9r8XPUX/Kwt6k96yuzQVA+8/8Sz8zIZhnSSkTyLKCCFLkzJKA91HvIH
ww3/J/Nei5NtoH00+G4FNPtoR0Fi8/D/D3fjljHqmGuMAS6OBLcGBQJ29hwYJgveBwZ+ZEF6gcfN
Jqw4cBo9DeTp5TyGjKz8mJ6Kez14aHqFpKwztIIKe6aq5I77lq9EMCMrdDNo+tKDY0ld6PEfGzSY
YPwChdXQ6TTBR/09lVqsEqPf9XjY5Uvue28QB55Ez9X1ncoeWqHc0sjuBCyvhF8iopj6AQRWcmuO
OJ8rQr6IuLYyyNnlvbHIu6yQGaBYJTJsxJgiHQCcJKfqLCeeOy2NhYCo+ZR6ru9Vf+j4FDFZJocW
VpBDtlZwoHZBMiGX/9WnUrhC5U6MH35LFy4HJz350xNBSppO8zJIOEG7jUg+o4WRE25b5A9iJbFc
FiFCHGhz8AhzJe7gnh5hr6X7rK6pJ2lBjeSFx8JwEUp7sM8EaaJzhbO+V+lSTWsNgea+Pjlk0vA7
uJojxcdIkz5OtaZOXFtGNZGKfvyCnSgwwVbSJqDRyLFA+dn3joFdrjaBMZL1ryzTL8TO7VCIwxqh
bgHRLgNwuu3p25AMpezYgCWHzny0l5fW0QgI1D8acwN/C8UFF/W/dO4m5hJp43zee4W5Y2quO0G6
8xCZpe01/XhZwEkct4e0nPFOI6lYIcUgrp2X80BIXNCl2f9CMXQEzZruyXAoSVA1UoHLFw4mMb2Y
Gc1+zESGhoxB+1suWQc6qxyrWLJLDzqkXUf/l+JdZYZ3UbD/xcGxr5jFCKDq+9LZ6IW2BMf+X2wU
2J5UOIoaT+RYtRx7dJsInG1SEnV9+FY8JvHc7nedDQ+m71qHKdR8lR7dQ9zOfmfrb7fMT51rQWtD
AgfIcdG9BB8RPuZsvz2AkSe+Q0fXdzSBHupjDSoDeJhVD+QmfUS8x+qbp4NcRukXBxGaQXSGjqP4
bCYHppyl5NK/hjALOgRQzYmZLO5Q+7QQtud7W2Cw5QJqQAWAeP7eZGNZ5SbWdXBEzy9aiih2yf09
TJxtTLL1829DBUj/Zp5aN0KtCJLl82K3StwKbmSHLy8KLz23NDZcOXeIl7Q4c2++QPJoVw75T1UQ
5ONhMJg5VOumXX5PKoTuavG/0A5ZF+Ljn2g5sYKYYoaVLY1OHJHA4Tx+RKpWxO4GVuSPZvRy1FUU
jMsDRF1RHQBsWDwuNKMsKVHWX1XiuYP6kI5VBqO5PoqVQLhq485RaCM4uCxK4SQt3jkln2cL9sPx
OfvnWzjA4cbEW0Cjxx1AhPQYm1b9X1VkWGgMHPaKEUkd8AXgdfgpU4gVQGAtcgnTJzYfYc4dwi7t
ODcvRpcy/0dwzk0D5o2sUkP878Us5pOFe3fvnfjo62mtgjs2Z0YI87C7vkeSC4BAMlmwED19Tmte
W8UIMQOmUaK06tqcO3FRf2gIavD3N+Uyf/aWeZ5xeB5ME0VL4l6NWBg+ri2wvFTOcuIdpYfz6shr
gkezmXeUgK+AX0VHJh7ttrGrvlQDnx0xz70c37nESnRrjUerhDpcOCV4pwBfZZMR+kOP0aXHQSsp
kxhXKv3544pXKU6BEi5PSLzYxhYqJcsEyHACsrgWGoaXKPGzK9xmsNnxFRELtSH5vQl07eJHndmM
PWmWnaaknXUMwGI/cX5DThx2TA/WNAqsNW25YbLrIowLRyFPIsUQ0nb37CbuB20kkINmFqjIhYq0
Pm3kxtvWpI3W5RnDBWCYD9/wk11Xk2A/RHuyRyqreSWtHdkPiwX7JUBrhbCJqWvjQu3bCqlPOREY
IAHHl5GUMX0oAo4H40+J//ehdBBJ+aCHxZMGzXpnh7p9uRAQ6NlyV7bwxHV8At3LsxmitLXE5qVb
+nnWVNir51dNa/Ojv5/7bRGIvhJk0teMPobuykQ0U2JqG9pMSOxnNAT+Hri+2RmqcfFdwVKIXcBy
71zCljGRmf+uOdymhgqM90SaJcrL6tDEsjtDLh6tp11DzXwKQyHAko4uhhFQsltTF01RugyzhfJE
aDtboKY0G4HBp5su7rra8pzrNzVozHNy5n9nxfjpzJpxlteiV4FPInJJXmv7gN2SrhKkyH3FMF2p
M8GiDFu/1Pz3LGBLuSPQDO25cGfrsqBd+vmXLEeiSM5CVb5lIqvz+ui2ZrsLfw3D5B6ty8TlAskj
ONr703rpymY00URGdrbm+JC2MQOslePIQecpeXIuSZOsmWIRzUIrsfyfQtQ75zJdW8lWVmzkT3MS
dXtWKmT+ljeLrDp9iIB0iSS/STA67s+1xSF+CHY4oRoQNc+tgCojHoMnuC9toEouALv1YN6zOeAs
6dmSSvFNH339No9+8g7+k9xRvHnqgRiBAyNEuLqIp+mZXCSVT8C6EvJh0q93olUc7IcwUI61WsWH
atKWhZO2QiWtDIVuoto7/qjtPl/sEpuQe0yvsjNvD2FhAvBNpMgqz8seKm129R++0PM2Au1vk/23
AjC4a9ejlMSkototqrqNeLve/e6qql0vsGkA5QKYrzRV/QRNxtBOVIfX9ZRQxYFiGUXnJ6xmmfdL
FCu9wA0VVP/pQ7RAwd8y9k/jucJ4Vr9Qu6/q3LhARO+DdjK6KMqGjUb3/dEqV1e6wc4Ebvq0YuOB
7wFV8jNrlZZb3i6nqiE83Lhc197fpQkuY7PDyOdcN04NIG8FPTBC5IR+A3c3u6hphOGoqcSFvTTh
WLHcEqqZj6om8hQxPn4HhRwsJ7K2oQYWAtFf42mPo2qLbmn8LA3SqZ+zageZBIa4pfD1IZt0zaj8
Cn2CmRrnAN5+wMuoqtGyVXbvZ1Y9oPVzs4cH3gtO3zudBqIg1XLuZ32OoF3Rtm66sBT/n7q/ZvPa
4W6Jcdha3+RfR7Oz37tcQSqhUJETKlUrcpsayvxCp6immjOxFw6YMGeJD4nhG32xnqVPKRrPQVTw
tUmGro8Ue2him9iCtK6LvEL3/Jh3Ju+QfIIorf6SLhXmHIt0oIf2o3V9kClqr94ywXT4LjOjmAOn
LI6Wm/Zk3D3MJYUCBHIbq1/ZSpu5zBzDtQqz4I907QZnD5+HAnGGXGXA48SCkTBQ76tTHrVBamd0
V7GWMxHhbPr579+kIk8c9Wf1+J6KoqN3mS1+AFrc/iEZae0usVwZbJxlGzYPl7mGksWD9FYRRwts
QcS9cKi/uAL/GeeV1Dga2PQZZLh59KMj9hI7PfLH2AyQhoGEgqb6tDu4BeaQn8097YGDa3k1ijP1
3rfqPy3yrmTfoyBAmJzJuKhvoUs45yb015bEUQyJp9WSHN1/4rWzFPnVdcUCfL9sMOHv6knM43Gu
Bmq+TmZhLyAQ1KtdXyntXNSXvZzEA7oBTWxLgFWEdTx35J3+0wXcsV07pJY03NXNeJ9OS0EP9X4q
z02anDzM3ViK2vjJ3nZDWCwk9n/yCB2WibQ7Bc8nj+aa/tCI0XqobOh9IlMo/bk8SDSXUpZ46e1t
7Jvabau5FAmrfz7+ZJcC9H1BVrgBjl0Lv/90Ke3oaJSzYQ6Vr7nETVuFz19QKOIjaXL7ykGflrZy
9KtGIzmnI87Uoyf7sUr04y01gVBPmXjsd1XDYyfeGpWSvQfO3kK400Zmi/gn4xj5S/L+DpYYEuJU
qlOsiZwgViky03LAKzRRyvKJQozz5Rc+xj6+/nJOHqP8PJQh2cH7hdydNzRFOtkF7QaGuRodL1pY
1PGihiuco65nx76mQLP6cYpkoYl/fl3AmNb0SC8qdYQcdglrc/cCF5fmr/uCBB4pAGdB8M2EgaIl
NbHOIQ1c4zSYqBPFStNdemvEof67X694r4dkLQ5FFP1NfbZa3ZqKtBKaN/QItn3HvB+g8XOmYCDc
SLCCMkfYFWwWMJ1sFGKkTZh5SvZH9ic6U8WUSJgPk1f2RfxYstsXzRazItnnFGxe2Tu/CPz4MjhD
XM+55+Pm0H995du/x9g0ugGb+OIFckXMKdmMugcj9wHTGp12F37O1ZAxNsEyRgXPpSkC0pdmanhW
TuYeDy205REvxvtzzP/8BfEy4fSAk44Ns0f4LatnFiWm0xnW0+5z9olsGAPjMS3VwAahwrhJsPHE
WJiwk7PRfY7geGM5Wbj896qpgxyEIV5ij6/7InDXWU7nziukfBOb8vH9DxtkCsZXAY/2luu+lsrv
dy3u+LpBSPxdIPpgq22h6+wv9WAJMSqmV455N1H4ThflFp3xj9u8R1EVG9DOhaLuW7W/jMU+2JuN
NmtVBJMZMxTRDsIeZOeQyt2NOOCvvl5o9bvKkDUr+7Zoma1h3Vf4u/di6QmqB9jrpFM2wpkMZAbd
w8GJDqA9UsuZEqN6fgCZV7e50d01l5NUxYCjaSK/knMKeYnn0lauI5qMa/9YCMmiKQ2P12fk9kv2
7ETpYvBJm7knKlEsv5Ub2F4ccxxFKlQAIDmF9auE+3ldXL1JIU6dnH4dwGSfGGLW5AwCLcDIZru0
e6FhSA2+vKSjjsrJV3+P4giabWDZIVn7sBmerr4SZz3eTf4Ypy9/vVYkdpl1GSazRFLG1daJTyky
WSX46I86awE1c5ybsBTWYuYGkFM5HBs/Gm3jfbMGbHrqea//wd/j0lpDuEMdzQMb6YMc+/pl0xOI
d/Tmgz8oO6RKEvPEMIPhla17OWeJ7Q3+5c9z75ZqRAf9sXSuvfLkQbrKDgq80Hp+F6z9aaZwJuFa
4HZ3UHMIJuZAtFSpeC5qvohNXm2a2n/8jXFtQTHc952nPbcqluvZrEMufjrbbuUxac3djKeQeNVq
EcZvzjDoTPglJWR5e4NIVp4jv5YwZOz2oVH1/8VPNgLU7jh/mHOA/+cS9he646v3JYp4lNx6AX9t
vuzh7pkhspx/zBD5LWZehaIiJnpF3YlowdRkf3QM3OI8mlqotgC/vTPAERnXFCRteY0XcKvt9g5M
3UKm7JaIh/cdN0cSshXUIfq/yYQ9+ehE1Y1q1jPOhilHMAHD2YEKmO09T5hA+dz1n1Kvewf3IVlO
b9l1eYlc3Z87YuRE2bLIPvfqojKkqKin73Dv1L/DGVxRhzvlqI6MAR/ARcqFzzlZJsrHah6oUHPJ
h84XuzzTnthNW3VwNIxZMFeiFp1NC3rmXf5JaMW6egB62qyrfCKMYos0zlzRxy8GSYdI5FuRxPZ1
CJ+nBThlIHbErvE1+yZXnEgRW6wTSVKRE3OOQd7kGQECzfxoCrMhw2q1WNHtTP4+wJkr5V6A7XAV
uAz3f04V/h8K7wOmPLlgdvxNvSxhis3zlbKR6iit0GyyTWrwncJgZoa9iKHSAgENVcJguKsqLb2b
+c8d++JqTVP8x2a45uXf6KvNN/VoIkGCDCQNw7ix9U864vxVpqSedMQaedxgEH3Ym9mhbr7tfx3B
YFKe9WI/LcL28WZEjYpSVD0uQ2Oy4XXtl1UXxrcMPLZhCzHb6UdhKzzr/0vaTFT5KpO5KyWwbeIf
eEfj2/Imh39PSMIm75fffnk0D3WtarSikofaXq1XYUxBoPdQoIb5muXeSj1PQNG3MPg2e9xPldqR
G1hOLAiZO1nn71xRQ0ci4QqulIJaeY+1GHxRNk3VBqAjNv0tDk+81ITL6ziALNyLvnli2W41NDrs
PMydzcZER9kZh36igHyZrJlRbSVaW49MunhidA5McCxQgQgttumZCvXsdWJpsn3E1clUVUBXqHxT
3ms9336XZU7rkbaCB7x1gORBaxemOm+2Km49nGhiusx2mfPFnlyqrLPzh1WQyxo5KIrslWaxGEYK
V6yvVNMA3thBrFoBpNSGEENgzfOO/MnUhrPtCw5FteqD2LkE58Wc8tYUKydpOVaVR8FAWUpO3jP7
5/A5BPSV5JdpsgvVg/4xNnUyl7VRZ25OAtq6fVemuTWQ4J15UVmfHSRzZpwa9LaybXj/LXolzPFu
DhYTSHFwalTeQ/WRiSl+q4WHgzFq0+UiTzpr246UvV4zXEyfOeDY0N3rTvoI0GOHm3aDi/7UaPPf
GCVX5NQdRuXY2ZVNPGySrle0dekZpX+FZ0mLZhCjkY4MQRgzloK15oVRCarcsPBeTanoL2HhqD0d
BvqnL/aVQlP3ssA5jsdHIwxIZwIs5FaoktIPYqRApNMWoJZ4knNk9hIjzyDj1jknM4T3erQr4tDF
NhaLts6RDBsFJ04+ZBBMBjN9w+ixfnDHTXU3sEG6G2WFtxokCUsI3S/ZT4AbxzTulw4AWi62nlLV
D+mqhqhYJnXfC/pS9FLr0AyFUGox5moDSn7f4Z2JXcosKGwgW5hHZgdd/FLsfWw+7A5rGjOmLlZr
O8hc7BGKs1LDuiuYkXZnbQvVXupLUz1uk/2eiy8Xe6hg6STNWO2WX6PQTrIOdHQf8/+JvoO3UDZF
neD7SIIkgBCJ7yzvZkE8SrGtbDsVens+F8tia8sQPYlc38zNOJTsIoB8dasxwrfeahxBUbHU+PeT
4LLeMUybj689IGGXZUFh4DAUxHJpy9dylsYoltUUa11l5y74RZKSw9IoKc7woTC+Dt/xs1GDDaBH
f6X5NVi6NdYzarOxMNnOe9V2TN5ZjGW3h3rUADsoqgFq+zrw1S/wW+wkg0XUTLRx43zG41Rn7Arl
64qs7hOoyHqHYET8bBFVqIjrfNk0HhpipmfgA+9r2H49nfh+8g5fVg0/zMBHa6aunc/DFP5Tw7L7
LRm+CImFsMabw6o+yZO3cIjUpjS4YIjSsuJ4ycL0oLNKp65slpM6BFjtysYFqS4VuPQRdVOj+332
Mo8WBsAZtZFP0RPwJr4XDYpT2AKZtjyHXnXor+tE2xOEj3ykPqOrpxscyTIO2bwxPE6qroq3tkw7
63ukicYTw/15pxAPl6SFca8kX0LxlE06X8AXixxzuhswTrDIyyDttDHzPCBAyZFqy7xDZDon3EnK
xBlFed3hQbeq9PNd5+aZAeEKbhYEJzU91ss7xWDfFgwPnVK3tnPC8ordoqGEufiQ0IvUNQ7xqgHG
iJS3Jr+zZaKglRfApelwuS7wPAEnQkyVrQp3NEZjztX6G/foNXHsjzcsNJgNO57KoESgKzBH0nCZ
DrgJxKveG6KHpVuIpV1Kc4TAW6sBwDboNUFBckrqPtUMHV7TLoo2cocmIiX5gyAdbn4ooseefkV8
IhmA3QKRjJCa+MWCjx1ChaakaDUy16FR9AJccJ19Me5u507fGamrhJDfhbkW65jlu17wTbRW8Udh
dlARvdRKHHBwpeEMz+rwFiLQnW1NmO9eszhShxU35Gk1Yv7hZJkfdWtONWdg1PHe5m+tfa9lhXYQ
eh3IlsM25sEN0odBs4ETs9D0DyR74cQAyc7NhiZxIJjigh7xrsaWQQwe5Dnyr3fw1AanjNUL1NTF
W+HATY3n+O70o6MiKK6QE9MR+sKns3tXidE2RukdkOZw4CL1k+Zfum5Csjj5rvhxRtwfxbUdE0FQ
OD4cETLvH8aLFDRJRGWD4qYAqxpvtvV64xvNotnmu5lV4uTgKqrNSXsGmOy3iVToVr+IOJe6fvEn
KSdh5s1BUiW4/OrFYBAV8IQ/z1pt4EWoryjOZCixCVm0KcbzAbWVMyMOaFt5mE5hdMjEvgFn44Ek
/P76xZiFEzrwUCVSDHD1vXYobhmWh1HhSxIuxBme+oTupsFJxH63U9ut1HIjZPYGCRBHd1XTw6hE
jMosJ/y7dXZZvjuSal0if48JGtFzcse0MJ9M0U5jfrzJ2nJY7nvr6yPr/g+9Ni1ljqOjh7aV07tv
DNHSjBwS5GXnJHCoxto2CZqSIS5KAIUvZ3BEIgErAjJKGFvv8kPSGpIz9ScGDjYYTYnL48Ssichz
xfFBu/bl0Ivp9TtS7hN8aH+7gB+a+sfVkSWLV0DFz9ktto12KdadZThwDCcuHKmlOTxZh+41jSmR
XL3ASizwx5P36Q2a3eLiRTGgKnl+X65tkd6vIwY5N71MzWI8lu8DxHW2IpGpV7BpbTi33cyDw1Mr
j4z1Pnv+nfzv8ABNLKdZVQCL2HjcQvMdvA4TDsS3Gv7p477Of/wgPHoI4vaaMtkf+jeECwmLqRZA
0Su+00CCw3s+Tj8QDlaUJ7pHJlOVxo8ljetMvKt9CjVZcoFEmHTQRenI6a84MP8yR4JVu5Z1Z365
mjglx8sgnv1CP1gIiWbA0l4yWmc2uWYV/qmuwxWuIaigeIq6atRr9M3bQuodX2H8uyWAnhpms0aQ
X4uUJgz/sbCkPY4gDty9AHNUulfx1LO/A1xS/cBuyOlZSpGX4XJjT6Cj0tieS4YY/Xc2+o3Rhfkw
vzaF5qYDexsnAtSJLqmALPXRuT5ONGoqvMRCv5lLMgbZHq8h+bDG06n5tDAIl86PqkcZdQvfMjTZ
SGG4g7iKg7jkUHN7LbXIJ7VV6iGyvkrW9qJs+qsNAMZDl35ctVLViY67sBc2TbA7wZlUpcWIE5nO
X7xTrXN7FsP0wx1bhAeVX5a+7qxeOSpO1bVVf7gKozp7By61VDh8QkLpAIsUuVy4gHcdBkhNW2rG
qvo2vm8onIEYGXZZiPNAMzpvgFKFrv83NoFD3w3padcknIp++QHWNwFsxroM3ik+JLJK40SlcE5Z
VUMg9gkHNB/mHriUUM1oQ7wMnAn5mTR1oAz8JcofIe1/HH6j2tDaVk1zpSQ3mfyJnOj8rZiRojeM
ytIBo6AVnbqXR+H6yCp532mMM6MOywanExMccRBLcYvqCwmpXfnow/my8UrHEGGqmYe8fojxL+Rn
elpkvYoFlX++A078CQX9Q4QQXYgEVLINGHZdLAXoUqhFXQUaEtyw55Z0+WBloGcbbycIk8RvWjcJ
uezSKIhrgoenaTLHqwAXut0elg9GZOZTd/iM3Cjd0ddvzC0YbS56MTuTIp8cqUn5XCtsSTQHtmYC
EujIkRiQpjO7oHTixheIJOvZTiZJmh0/KIvF0+WYD2Scpet9jTW3UxpYGWqLEmlIkJ10qQ+r2HlU
fJ2Mmv8NCtW8voaCwiOiObUQ/MMRc5rQLrn55eWIwrY2RFi9G1RI7L6p1CUXOW4dgkOA5HCFy69o
NdqnMQEh4QYTfNjSyj/9u8K3zgPp1esfgB4sG4Qs/9pjBapNuYByFZII+/evdzOM18kw2FsBP8hF
Z4+JZ/nP4NI6clkl2dPTzCrg7JSFci/OYKhwBtpM0w3nxFl8uwJ0XSMRO6pZVeMOUeF74LTMIWat
tXXETk4/I+y4aU/UT2Loo6IgKCJP0FBVuHpD92hpktmArRckOd9Asi+p2vhzq5ofAgkT9sZlFP/o
84Gb9oCehLjhiSikVm5wxFValWlE94kzdLCK50anj95aE5RJzgw/mhHqSyfStV0oOtXv1TETF4lh
b8ESqY2MUMvP1WGpAmrrejQfkbhY3Cl4CxTfF9LNY5m0kyvxiXRfGn2YRXEJWNOZY7UFEpDl9K9k
nHCz9NnLhyiMDCM05FCIE/wuDjmdpvjjP9lzVZgaRrAGjuHdIq8Rp2mS1hyfenJjRMMtGNtaJB7o
2j0s3ByxwBYqO6SKKENdIuOKhX3fyJvqjLTZ6ScLavAl9aXO3HygnaFqtRL/MOjdVd8uOdwfGgqg
AJyHs0Jq2Hyzfuqsne1Z9TmWilOmaNs2/N9NRD04vPrcC2Yhuvtr6EpVLl6s57O14leKp79wUZ6l
hUU7sE+fNDFhSjZu86A5WU9PhlAGCwcl9YJiHsmTs3QFXI2BAT46ExLu8VJsmDcTYQpXLgI2Ezzw
qXUBsUlT49ozGCX7syhLE1pJxAXhcISctQzqrQS0JXZKMtHvFwPpBYc4KuIANxBw74Mi/C3V5ba7
4dXwCLEQ1mYs3jQ5NIE9EfXEPFMJMzCfUGYzzKVxEl7bNdpBwvi/KXrT2D8lFvE7hUTv/4kySXv+
LUCQ+xZhkbFgjGLT/iEKo7xZ6BFg+xr4Tr+daxZFQX34a3RN+WmdNu51ayl4DVMYEAWzaSXUTQvA
//Cv9rV1kU+ofZV5e7keruCcjsGNhSGbjXQT17/RppWpQp11oPObIU40c0Ki45hwVK0ZOA5X3yVr
cCqTnHIFvxhTrtQuihdNS80Pmor6H7F77rEVSUj3mlZ4+7GS/uBtZVyopQPPRPOyfkxveYLRwSIG
GMBEPyCkEbUXpGSABKHiT3KWofPIhpndd+3qKfIsEk5f9l1p5HABgTZE4A2TytD0NARc4QRepfi8
50JDxd/2v2aK/m9D/4raV+1gvs3Z1z8Qu/fj/kxtl7zji1zHHga3ks8IsXhv4ycEi4P20TaboiYT
nLfIUx4RGG1icOLoWjQKz10yVdV2k4BWGTfHhD8i4ytJNz/ikUe16IaVkKbD94QLCWrcKu5HmGbC
x/gHnXLTO+2v+GNC1NqfoBqcdnKrtS4bNyPzGG+69cd/PvCo1xoVi0olYz86jWHj7oMZRL5hNc2t
VuPd5edi+FYGwjPMGyJkwCwZH5KJndyeiRL1KghH0dUWWMO6j3T51lk08M6luv2Gmt+iMJlybGk3
ppgA2d4JBoqu0gUL3UTwasYlqFDoBtdi4++I4z6skhBIzADO0SZYIAZrX4VSrRmBHHDeNYqKn1nz
qpCtczqZHe0upWXgtCsxRc/xUywCyDmETtQli08Izest4eewQda2aoXiN5/6uN6IjKnRDslUWDAI
qgRjowITmdihnBbbWd9T4sSqcxQp6g388UeJps8hJYjLTETjPSd/ayQ++P0kTluEMfQLced0OvMm
9kJ/opR/Uu7snN/0rLmlBezGNDLfK9+RLaLo4T3zX1Wzq61Z1wxkN1P8+263moHo0YiSAqqGkL6P
0vBEMI88zuVQ13Tzo5BuI1DHM47yZd+bqAAkv1ivJziaJ2kBVDcU2ifV9vmEFa5w3PUsO1mVMW39
nzTAIvAV7jzK0IOOdX6hGw8GPzE98BA6iF0x8tDZh7XtiNRjOxOupKHiNnm3Ttp5PeXauNNRCzdj
p8Vws/qjjJKkFvMLY0pkoWAOsBeZj88tR9Z/BaHrBCPhoAfseai/tXGOov412niW3EO/5tUuLNK2
a7bmP55v1ifFWjol2hwiP5mj9mQ17ogcgLnMFrlb7R/S2pn0ewkXhXU4PcNdvq8vLI+xeYNsKBOy
4Y9VOHd6ozeyrinjI1qQnNhWaxhKDL7XpNjz791qGqjYB0vO6lSHbZR1thtkjS7mlzcs9FmNo8ab
F/tsUAmtrDWOEbo4w0h9gWkQHXHAC+uZgGAhNF0R8PPvNBuihzBHVPE4gNN0WJmvd4x9cFyJpHXG
VF2kbGkzWsCaMOyfjDcQny366yN4/1jS53wHxQbjHJLb38a9D5OZXeseZUYADhF6uhex5ncA0vjg
Y0I38UPWkS883CfLhjfHhFHtUWQu8zJjCnh37lqsJHlyuWLk+SuuXYOyi9equCR/DqN+bsV0D9FV
oPcOaoZuCyCXezhc2cEYrx4oiIct1QfFi1tTy8ONbhymvdqkSGj1ZpgpRV8fyhIatpvTKenEpNWa
VEF4KGne9uQeDTuia9IGa2xFyWhyi3F6TgGnlNYGblBVqB1X8HHjJRPXaqPVHlCRr85xsLCLMVKP
kbNIEDKXvm1pHIvNoZRruEdnp62xBrBgkV6MjjjsVDmFzG25GQAVeOIJ1a7vQYMnHHV+0z6LDdcS
Hjp8feELnwFrmXBG8ijvMYIAnYC2kJUBFkI5Gs9i1rOLtFJgTlGDIaXDiNtG9B0vW6NgUBEEAt3j
gh55dPcMJA3vwacoJvFEQOMptT4jv3UQyNBQ2apKmyVabEvNHVYDA4Uo2hop8n0UwyZ17EUoutw8
Q0o8PEQaAtr8vaggWJBTKP46Qe/TLzp1S+DCSgMQ/N3nDzQUnv9JKfveI9zJ3Y/byAmxptkp1Sk2
jW5tA0Qe4M8/RvJETiB25MTLc7dx5Hpq7DxuLEj9jOS71Amj06K3RqPo19m520uq39m+Yb44olty
2SPUJNBKpoTsL9K/CwVWfs6oC0J1zbaRoxbjmn8N+knjG1NN861BHd1uJ1RsGFcPpL8UIK8AqLuu
1EsRAjdF/wcfXPndRgekcMWWJ22+1FEhxVnSmijqWAXI1L1I5MHInT7VZoaV2jJ3K/pDwbSGqkPY
9Fqny9OP8mrBUpc9pwxgcOVFJoaE9J++ndnT6visStFSl6HMVJr79tCBN1vkAa1z76it9d4XIfb3
usNpts3trBcp3aM90Zom/oTl/JGrfyA9apbve9gitwYWdG2SigwBqDhDKTSBmElMO81fR1fa6Pyc
SnF29WD1PII+0jTsCOpp+ggHhsXLyWVnJNBwv2GNaPiBB0yYqW2FeznuvO6iioNbaL1kQv6QVkiI
A4EHyeYtF0Al7DKqQ2qcIOHoXnGTpUyAPcJjxzMkM1EhY28Hfu6KE/GdrLN+mE9zoeuDgOWyEEGC
/19dI90kUVCwlhO/QHC6+w29FocSBYoIrYEa4GnxhytMBoEfhCy1kYlfUy3kGcXAX5aidADVscfV
1r1znRJqSft+cVmeMCmDn9Adw2L+Bkhpq4Gn/SBJEN+YzSOqQq4nk1XJWaz89Pq6ItNWhukfTnd3
BuTkm9rAeGZ248MjDNhuDm1OxHXJL6vs8/33uJQ7FvYIUyH3KICX2n4nOyStkblNKw76RXaZyLdb
NI+zAT1YDmtMRLE8965lz5zvpmiBZOK+Y/gdcZaL6ptEbivcawjuR+yOsFWvjsjDpXwWpah0kaCo
PnpWng1A3v+TWnr0wqAodc+it1DIzEPus9BEx5X8sl/uprn8co/vlhPhEdgj8J4XBzLLQZBT00GN
nekShFgkwmcImJRDcrCVG8UnAHTn7YPEynIwlDwpEP3flU61vJ5Tv8wuHOeod3nP8xMvcukXJeXY
zM1C1YY5r3JJVVVZNVVyP5BkeZ+XDo4NZX7aM5n4CFnd7E5q7Q2I3TlBFiadbjtiQXEZP5nTChhg
7ZXUDgd+LdpPZMYCdEgRnwR7xtMmesU6vEXk5PS2MEui6tDdw7H1VB3fL8NsP9z64H/jat1nVxeh
AmsoFVD4cMi5C3T9ZnPWFlYduvTDFf0Gj+34g+fl5CJq0Zhs2UPJR+LIFZf1o/ebQ31rIUXoK81a
e48R8t0T0lsBRWoDL/y8mkNG/HCwTRsIbFVmallUHPqifjuVkqYE5vPHudGH8+DOaGxwV7tnLiH5
wvoRtUyMWvgxNJ6oVQ85uLe6Mvd9hDN9yxTeIVQBD9j1IXtls9XLJzXdNjlkX407xgwWN4BN31kA
1f2Kpr5Nxp5eT5brG4wyB5tzo3RYFPW9GUESeWyi374EvsOWJh0SMNZXXXdXQ09fI5lEdwRv9bVR
z5t1mqDyfuehLviHU2CSLqy0KWTtlx/x4+nY5VYMLuPQt2Ftm5I9V2z3n3LhVEOke80Hskf4D6tO
URS/tiA3R88azkwssc6vyEST1wgAaJd5BoKdMYhSjZBiJJyIpqGa7Xmkm6xJyuyK+EF9OuluxbRn
FYN8qpa8ITOQdxhGdN0qLCWKB35IBuxqHbm3wyRWscVcpjagIzG1SBH/l2fz9KoKCcnA9jspttNE
MjkqBJbEskJrxvbigc6P3tmLnHvd1lYitfeGySSIplvp4anChzFRVRCDtTZDQaU8/VLA6Y0pRPbN
Q3UlBrER+VfNTUGLO7k/sdHJvqejdaWnvlI9SCcfy+uBHTwwhL9Ti1rd3D+QDoK2+7XX+/8d5+Eu
zlFx+07GwMA3JondkprhzXLXY0K3KL7/QCo1/tajjDpQ3GNHVqOXM7Fb1z63Y4NbcpAj85B2hENn
2l4DqVplega2wpCbiTsuUdoFWM6a/QAd2EPW1BShguZ5iw5Ot+vYNDnA4iWQr4QfCHvIt0YPOVKL
VdifcjQSASNYj4zTYy4Y5mw6z7aWoiE1EZSalZJ2hOmhLVmkZ9XgaPuyJ0vhUgCvlBanq0pUjDHd
NN4wtksS9VuUL2aeIOBx0nm5dUTHJQD7ihg3/+sQ9GMEQp0EhNV6a76oVq5yqrc4H9EwepsO1YDr
y3DcUUdjkeZ9UHTtpjn+SE61PNO1L9VmTuEfbrlrokLv9Pnip8oZPUn/XRtxMwENjhxh1oVZCpYK
sCQxBCk6ZP7WCeujOcljqUnjM1v9h3s2VpTmQPgI0BfpcvWoAlEPbVrvjRMBgcwooucSgpTCwz2G
2i9VgBaOoiX6f2BlyEn6ng8sw9fi/VrcwzLOwa+NBWYdvS9CeNG4ax7AkTkV1e2wntodnxAU9HMg
WM30AtvoSDfNFVuuNzuFTyzftRCbgD75SrYskeIIcm27ulSHhhyPJ7X9B9nCE+epI+pP3oY2Y4ys
xERcucGXCFkedchDd5tmrE89CXQ5IEdNMNfZICcT+h1p1AJAGcom7zGArrCwtTpm8vO5ilZ1EI2U
0ixOyXqjd0eZh8wAAIHw0VHQSlRjwKGCn4J2DXLKmdIcqST0rb7hmDPKEIxuY+bGfo/nidxLdqYY
UXiaj5YeNaxmkDrSYhaaMg6qNuxvKvb9+DJBpZzWlCQaNa6H7aCXSD8Lf5u9INWRgpWnHEyYPjd3
VNnFl4+Nm6unkD081cjMkC9zlFWBWpUCV9UNFumsQZSxs/4/PRAw76WyRXg2agmRDY42NR2Nr3WR
x6UK7d0FUazwlt4it5rFZFhBmZEwg79e6DOmzPFYE697eMp3son1SgHxCE97fjP83RiYnoqhfoi1
cXiLr1Dq9X2oC7vkjMIJDzpbdT3yl84AzECymP4J0N2TX6kCk0nVyitOag3UQcAm63uh14iGIjjD
V97kxBbiZ22G902XCwfMkBGODvmT1f9uOgvkZdp35evIVLNrABr+N562/Uxlh1eqwGRJHHwmZO3u
Hffz9LRuATOy6jFTBfjD7O6FbGWrT1w31gxl24HA5ou6u4P3lrjVvqz9763LCsR6XAQTPl9CdYSk
p8ZmtyxxCoe1zPNvgOSFna+fgr3SmxCiayodRxyKaickicrn26JUB0el3DcfpO0kneDA//9wJG0c
Sn3aFlS3PF8GyL0gXx2uMMQ59jJWEhyTN/a/oFgWOGybhx/FiBHoL9zs+PEEeocGJuc7CtgbCO8/
e6Vy/zZeprcTcaXTg4V9TkP10CPCXdUH0c9Au63rURasYK98P71Q7c9QfHXzd+E2f2XWWOA5PI/P
si4i4HBLLr74wzHxt34D6oJS4t2zHr2D5FWxMcCGjs7aSbl+TyFFut0SbD90kJZ7ZwLEqFpxyQmd
tPIgE+dMKdGw1+wupsMF3XqZbS5/Fkauv9Y1fNmRkyO401Ckb9yrKgvJJYcaWDYbfqr4poTtIcbu
V1NtUrWmNemBXeXncijFM/ntGWLCFwBBFMl+VpPV8M5W9jSgOomhruUF94m3Gn2sGb0a1vKB9Za0
3nXy/muI7o7ew5wn03zN1AQM0ZeEUxg/HwWdmh1tUl7EFvEoHMfgq8cbIlVzetWdh1YtvIeo2cNG
f0FPZg/dFwONY3phRsLcWJInv0U3mrxYYXklg7xYnbclTr0v/OKwB8GaFe/jxPH2KFiPxEBiELtb
UMM/CkXCH9JqFtl1EHDsdWz3M6UXUZS4Q862lPyeKwgwHEoTk0gBY+alTAqVk/m7tFxQaIRNuqNA
0j6a0X12jbQFi4HoqcKqrfm1kak6frSb+RRnEqS8vKjeLHI4wTURUjqLPV1xVA9/ApDZvbsefVLD
aPgpusVSSiEHczvmI0JO6kZdiaosP4rEAbvHE/YwuvWDnUjhu9WMl8QuY3jJmutP7J773kWhlDTw
IwDyzd/tE+0om6VKrsEgFTDjBmkpzDzn0NSHWpKDxr7+ice2PcK1fjUluRN7D4Q/pBBJ6Xe0rxgy
5smDFXP7kHDG85ZFJ+dsy3SCYxRhDQYRQIUqsTza28bcrJSAnGCsQO1rHVJF+TN6Mrh20vYLyFfL
xvTx0fmhMPR/rzv+4FWww51Ll7XLIQG1udTe5XZVYJnIp0BOal/OqmK8QjMwt7IzB3LSO3UZty2S
DN9/F9wWacaE36iQ9cEdJ1XwXMzAZ8GAh4/NZ4QC2xPJiu9oIGUO4s8uy70E8xcnaDogl4ULk7Qf
dDSRZ/Ny5K8RyOQFPKUdNotQ/mtgWb8f/Ob5HLxWKmVkVxRIaIBiK6Mp5wPgr74NosIDzQ/iIb9z
s4bAb4OSP2LrBg6tq30pUEuQfj5PO570NVjvpKfsU8VuEgMEkWp7HJXxieJul1oySoXIodgCIZWS
4yxHkF3wwMu0Hj1vmtV7ocpnC91zjGFFelhI7cJ6mJgr72KP95BfilfeBjt1Nz5ijXWIM7zpMD6Y
T1WTPYuwbTONLHcJr6MHgW9BaaKJ0jeoaxguTPAL3BNCZYPUW5apjJ6uF+JIezv4oCFDq7v3u+zv
Kot3rPEk1NZfd90OSz9byoklxT8F2RYKfpInzRfsgaqZViFaLaQc04JrrDiofLu7PQPDwUTXHt/v
0wgx2JHPwDBbySs7aY00wWxdjCEvrzdDDGBCo4ZSY4CgsvDHh5C/AQ0eVB1tXwluYutxN3PBOpG9
+kv1zYudfY8UTNW5rqhnQt/H5pAQh+gHfEigTGtSvYSSvkwKRBeVTWRTfLkHTZukTiOBovhHaEXx
R612dD1k7rJk/zHUyNE1YYEC9W9u45CuefwgAz3KhiCBlubF6LKteotzym65001PGukgOsEexQIe
SioZ+pbQOEFAqXRAvPpyzaWsLcF0pCR/u101HRv3mU8hJ1FzxB0SelNdF5f3fO1IKvx3pZ+rIUxa
FCjMj3E1e7b86SimNPebwDf+bByUzi3tFwehZwBoe1isuSeG1VN6lO2zn2IiIZnR9QD6kMtLzk4i
e4WWWC1e/6vE16lQugIcGS6TCp8x7lm+j2DRE4CyCAvoSxMeelw4r5oEUNzNCvM7YfJEHDdfYOTj
l1UijfE+/mTAXl3s0PY5tt1nT72ceIxTVIAV5YsJgksBsGruShfsD3RS085RO3iBHctgfmh6aagl
KnKoARfjsrSjKviJtO67fD9xjukcbCr88Ii1ESenaaU2YN+elWSD4bEl+Vl7bNItPu8lq4VoFwQ9
7syAWG4p/+tZvvm2bjt3/8FK0o4nFxRvjYtvmTyR7jmp678kQ7H2+iZed07025YPGSGux6eOl3op
28d2C0IOKBdKVYN9gQS+FSBm7qYXjFcVGQFf9C38b5Z6KwlbUbKiaLPY5M8PMyVXlr8Tpjt6Jsil
YnFrLeBx0fiiEX/n/LrE6UnmHwaB9lOI84ZVDKwHw2tfkjsyzg7j6jgiAuLWVlVB+ySQ1MfQ4KCI
DDFqdcGf4Gzjq8iX49/zxT0l1xDVFQ86JlzrQIHJhmLzTsZAwJBcj7To3qdZMbB1DyJpMvSPqLgB
3c3/42O/2Z4jaDJqwnsAZWfFaoM8jFgQvEKobuxAy/R2QGKgVGIYf+JUVEmZ+25JT3hD7aj2xiOg
VSFTkiujOEQSQ3+AMk0jzwpbdC95FKtKCo5WbM5kq4/Lq0Q+ASvMm7WTQO2F55haIysr1rjCDq3L
JAmVXBcVvYse1PGZgBjWh3zHty7r3VnlFdglfAVfoT4J/WpxCmgF9Z2uhx+VbgoqoZ5JQtiEsFB6
joyAP0jQ7fH6cmbAEEgMYI4PjFrf786ORUX9uWlt8iX3C6aYw8nbgd3kKMKL1CsAVFTt/p2cCDhZ
tsO3ZrB65FA8IVRdZa+KKzTzYUq3lQQbUdLYHKiqRwlLIDAWe1o07Lam/DbKQD25syLMBL1A2vaW
M1PXwbP1yJ+LbJWyayU8W1oC5lt5+RGeWwOJ6TZqzWIUOxZKO0r4It0kArQ5BYtoCupRu+yDp1XL
xgL36Usfyy+17yrXYno8TC4ZhZyYWq5W0zo2xJoiKdoc3ttK8Q1T7D8paNU0fdWNrpaeuifHe4sR
zpiOJxtiTpJWfiHIPbg42DYpSRSyADTBEV1vDSH5FU8RX0vbALtGVSrGsrefG3MqV3gG3WD0BuhH
b7D+OXihPnNXg1T4QrVq7r3vMwQbib6TRov1rDL92NB5yfGzRo2zhWMIYoo5dl1fvgOgpsmNsJ94
gJgzFz2rnHhrW9XeCB2AXEMIC+GOGpk5G39F+0pPEoIP4LIEod682vsIT179J+bvK1EyrfTlQb1J
MYDGiYu4qB4UqHrxMphJbD31KaKMvS+KI2ldBha3kiFhUqih4ZRO/ECLXxJfotXxr/M3x031pqfg
IRYI1yDe8R0KqOlkyVc+X+BQlGQIjW1AoiNeZc7NxUgknM9KJq+AFYe5/KKjRk+lJSnxJunxhL2g
KjtP5+NNjFtWXz0TXrNwZmy/rt9EgyOK8WdpgFjJmbljFKvsDLJcF6VXfkfEdWOL1SsHgWkvlRaF
iSuL6Ijof5F9212lax7U3InfrVMVIx3OGaLQrP2D2z9NCs1dDEDbQIOMmyhhmvRa1gVPUXhDYpqd
Qhhw2+fwbb5hcG0MgD0ORJoyEAG4OSgWpS/LEq+zo/n0YE0SNRlhp++gmKsmJbULLOAiNQ70sS2i
76TB41REvjgoKS+PbgRCoJOIy1e3HKOs7aaFtx5t3C3oYxHtdGxYBjF7fAmK5SexAAhX0/QgDDvY
gt32KnlnxpU/B38V0a96mJx5Yu2Dp1/TmXtdFpfvw/ASf+hWpCjQSOgPYkM87Vn6XDwmeovmQ42g
RmLXQgU/w42FtvymjBIajNAk3sXyAaG80+9yneN8jJjYHXgd7euNdY6Zari/pRsb4NdTDoRru9Ll
UQ//PG5vinq7XUh3CBXoCzt9FefuCe8f3KhoEFKq+q5NKWTw4GT9jogVAQZoCmnwKV1q1yrAA8T5
DUaKM4XBAPyvifLcQwCE9ylsqigUGyMWf1F/UmKV236PYab2F7el7lcp3xJVklTcjKKV4lXseoxy
/Lmnukh+6jAM/H0cX0onm5EYc8rw/Jp0hNNFdmaJ+rGegnhZ1kA2QZuCjpyQSdPRcSy29VYMCrAH
+UWv48cVQrRT2VbvgTKWblqhCLw6yqrXWYsNAVrAuaweV4mSb4emI0opfuEtAvwK5VaxW6Csqbd1
K7sqyfj3dJivFJjwV+01tl/OciyKNwf8X3VTcpC6P7bu9ea4IexQkCX3OXwkx3ShRWvDUryCTZAu
lEshfS3ezCEr1tGVQubgaXagEGb08+ecMLlHuWPh2frqOUO4FwUlcBvsdx7kKNHr/OeV8/NrL3Fr
fdYvdypVEvw62ziKFaJfNw4YQGsPRvj+GiZC86WTtRufWx2FTAiYS2Km0Lr/MWACgvjZlgeyjbk2
QLJYqM+RqVmGE/tiXkRB06IBs6LTV+haqor9hEkmb0ay4UtxIiE4ekODh87VRzkCfynpiHPi27LD
PKLETJvgJRIpW0ULpY1abg+4uFwfeIuPbxQn6B73q6QKqI5zJujNnKKqOQdFxv/6v2ZHKa2XSAZp
eW1ZPOGY9EGizotVMRNP6jdbQUbGhTJzQS3O3R1VmuooJ3FEtuZpSa9F/EcUkOUcqJX/+GAzK8wP
bpeq2tMt6bsQjbHqMSm+7E2JhXwAMoi9QD+UlIniiH8zhx+omyUP7OeujPnc4pBjWDagYG9fqIRZ
VPUSTsfBoKl70D6DtQC0KfP9xguOIhRQkPyifMYDnG1nMwicVym5jx1y4rfQUat+iHHFP/wvZ0m7
q+dM1GFZn9NP/zunQQbndM8xzX3l7IRf6bIgDiAF7FU0f53/0zyy1I6VwGFZ2S1Ufw3xur2H6Fov
TWdhBfc1vXHNRMUmMREBIGoeZtDyZa3/1TC61IPRKtf1NVwL5fmsoPrxs2D5cGR9esOOW3PDO0wq
D3mAjMbYq/2425pIJ8Ol/Y4m0R+cjq++bhwg0/vDatYAXqZnIKi9otHijyhgdoTDtlGUMOgblsYV
1CSU+VxdCDt1SWtjh3tcLGj06S5IbpZfoXY5ddk1+ykscVbNEYLe7uH2mb8nUoisET+lYHt7cFnG
WxtYLkedDEQsVbZtQbTx2wC3OS20RLrcfevqefnH0uFIUc9WSwg+hBC0CjOsb1taltUhzYBgkesH
DXfw5JyL//XfbYMcd5i+We+nzXHKvr0kU0sXb/xD/s+MI9MkWmHvR/OTtmueLyo0IrBIm4wkcGJC
zWAVCDr+A7vgEoYS1qykS8Xc4GhQOKyXiRB9uoHJuEJWTV9xEaVY8MI5Ftyb61RgelbsyQNMsdyt
U3vMFneRU0642eOqr/Eo8o/h7YYyC0Lms1lBO7HGBH03FFVmzGEEhnEkzMg3U7pCjK7K+v4pieoi
QX2axCQrnVgIQxSqSj2TYPjuQNCAJ1ujT7lHCXGhvwHpEgiIAZrHZ7h77JooMaqW2JnUeYGdLFED
0SOXqJ7WYhN6rriQohzRc8mCe4NcEvPqYAPC03U2VHtzFyPkiOj2H4FrAMWBtfHM0mEJBdibNSd5
DJW61ru82u7Bc0+bwZ3EmOF9eiqOB7P3SxOs59fA8Gt1T1WEfNIPT9Vv8UlbTRnJgvWWWicU5gxh
vCo2UeRgJ/mIrFh6TKiYA5xthtTumBKwLkdvDkT3PeNWke87laBBmjj7Z1ii9i0eu9i4GecWCshA
N4wDmPf5drObFDr7uFP7e80N6/dbUEoyLgmuk2/eHtWRB1ugAD6ua9Q6PW78PvQwdUoz36jzHijn
Lg3HCJk6lca6Dr7e8ctgQ4NbsXYODA6sJnyacWh8rVudJ37XwpCgepKJ2tHtHCfyRtdGRAxNUnBi
9p7ewBS7oNm9tAvIks71W1HVm2B/oNFlT9Mgs97ZusydNjrcG/UaaKDxMTxH9f6+QgxjVduTkAjW
GOklF2bwF3yJ4FuUgn3m20Sb/VGUG0eJUEO/dfeHF1FPtcHdUvNDq3yCZbxqXJtjWWy1IkYGNXzb
jmJcl0vxpk8pOQGJBrMUyBY6sqdqwqjje6EcWRXIKehDSMBfwT9Vc6ftnhaPAU968GvsMw6NilW7
s0Ersq269bnA9X59Dvc2wcIY43nrH3GOmurtFgvmpA3++NfkB5UlklCG9OhSdqNYhgizup/Q9ZEq
5PnNalQhO2l4rmhPfK7MoMxWkRZoN0N70ursejhask916hI23eQGLip408XT+AGh4s5TXHvfSvsu
ZcFFGQH3P35SNwuXfveCxgFOWSiH/SBTQ4/wC8PGN5DX5CD5cF74WDfWnE9s2NhN+HPeMNA5ekbb
RifZfBzP7VbQfGDp/OYIqNlFjg7qChhPbSndRzxVYdF9vjcJMCu6vlYSDuc5dDkYn15B/p/cuskF
y1LwmOBFKLFZXm3PJOGhMv2tVkar9wHCftiQ+ccsJpX5JRxJkMvHzZPaOSKl2gwGZYJpTSkkvSgS
g+xdhi6j7F9wyOE0uLT6bxKmauJOTmhILjAX8c7/UBFipM8vohrF6NsMptSqTuSC4cD2dPQjo4bG
O64HuBBwyA8e40Cn/cH2jurrv1TleNGFdZsg+Jw88jvh/OB+YME1Ft4XrkdYy6Sv8bRCC2UrkBdU
l1+pWQDi7d91LbL1T5z3FzfaKAYyKXPB7SecJpaDb5Dcbn5cRAoIE0QASLSTCIwjhq8yOL2K4GHl
zmw37RcAwtLDUNHAvu0dy0EBPnHZ6ke1Xv+x8wCRuSCpW2CGFx789kinLOQu/2E/lgV+8ZDBAulX
8bPxjIegJaeflgC7k7ZRRsjrvE6WEzo/QezISZv/IcG2GN5/1Er/H0tfTrGUAajzrjzcW02Xi2jB
Nm0Yw2160Y79ydM1KB0kwNd2FpPx2BVghWVEInxrbm34K/DOLD6c18vv1I7xnr/V3rV/srEhQIMO
aFucLsOwPr7MhljC4QuNoWaYU54MlPJzrfKrgGIe28gjsYG1Ku6IofVl9uoCElS64enx8BiXiguN
C19qCOKz7lX8V/EWxrEMoh6P2OyoUHCYBwzWUEHCU4s4hUg6h+zPAr65K9+lVeGCosF1/zWfTVTD
9HTYKA+43vKVMH9eq0a2n9OcI8kPo5xWBulVgXm5Jbiz7Gx5rA8TM624oz1z0lpO9aUwza8mnCca
U5l/PXzbrH2Q2clmAj8T17xbXtVaShgjIt5svbau1w7gBSDwYt3HEmgE1HNZ1OvhdWHOnChEXz2R
Ic4+aBR7ltehnzIitYTKocvvCKswGOYRksSQ0eGyD2S3te7QlgYz4gE/El8BOuC5eDhBjykwSceE
l/7UByYK9/EinwR3XX69wp1y0RV31Yq8KBeC7vO6VIWhHkEbeE0LJO5VOVgbRhVSk5yb34il3JiA
H8cfts2LoDhGr1WubUD0lbUY3VafJlkFVlzwhtjJtMQJzFFchCKXKuxuwFd/c9LEHSCILlcgSd38
Fr/FfTGa/CvZqA01npJH/Pf2/xgkyXGgOyfP2+8geULe4l9rfhsxYuMi3iNBqU6Abbi0pdJiFdVr
PFRCnNoos84t6+4sUCZCIpxWurqZ1FzCbjkKDxPBIbpc4VkJDmDK24PSu9i973RbzQ91YARWgh4f
Yv/ukhK9MrbAWuJcklCaHnsgVl4AsN2qr4WQYNOj9EC3qgB0+kKFQgyUH1VUBRawIhZHTZwbmjcW
giElqzzKgvPWHQuXsoA4E+4l4tg4Km7fPTIIox7wnIWERe7lZc2Bsts/u4G0CJzMzlS5SomSTqcA
68dpHMmKPd+TRhgwNSXAWuTd0rCuje9XN4xwQQTicv0nLEVHE2W9sCdgHgrtgutBdc1ceQMK9/l/
aC6byTDNf7Cl7ykKqI8AaVIRCPrXgBKyhBVkqcoPjOlQ6dZ8Se+vy9fiykO1i8wrm18aepDnVsdq
NtC56QGZrUlL2TdeDX85POsrLkYSMd+wZVBe2TsQq/htCsXG+ukiJoZd+tqz9RhiFCAnyYwrmrI9
JAx+X3A+JGy9h8LALnR2pNp3XDRrArWK14Va6CzGzhK1oYRxvbNWTQOTOJmMYgSnK4G7bm6RGJVo
Y9Ht7uLYgbpDk9SfVFqTZHkKNfjpJXyGelyM/8HJ8Wd8mwWvThRFXK6NzFGEmslSWyK+/x9uy5Ki
x1uqFgFNnemQbmZXLPef7vH7tLCpam5M3oL+mewbH4oGN5IXqfHk4X0uZ8NpQLZ5JfVcUnx0nicu
QWBMEKsOarc0AB1d/W67vi7tLrrJPl5crBUZc9+AtbXgeSlpXOTPlkOUpIYvr5bLzcagT53rAoQU
jIHyng+MZwUnS2vgzoeoKvJXPT7PWZVh+o3z2pAVE7HR4nj+M25tNiHOzkLfkgQK6bBkF7h2rBIO
zIaehj8taWPX/eaqSsrEVpuEEEJQZNSpSsBzeld/ZZU2VhYUX2nLMPq8Z6tr1LUSFoAwssPpllOs
gTQkIOkiLyikM9MR+CHCmSE1V00GU7hTm71sGuPqft3hylLkEfiwyW840JgoPxfMmeY8WzTVioIr
oIOoGn4dkaX9sJ4kl2LS6uP1iA8TQvu7e+Fuwk9geiuFQg4Ihyx5GPTTFKzwH2vOr7IK5ekbayiQ
PXn20U8jnmR8YWft3sUKYZJZfnoguSXoXXNPlYkoIyC94/QkiGGAulZUSApK1akxDXuhNgHTpMmu
e1za3Oa5/Ux7yp6kH0DjXVrw9SFQLYQHIg2wLa1UH5Vvzdx51SMdaw9u0T1jmvIQmPvgjacV2dXG
XBp36Jc2zrk9W2n3ssys+OE0lFN6PYE+wkotsFMIf5PkCaI2Pgg1EzyvgvW32h03lxejDWcyK0Aa
S/SIbgQt8cC69yLen7epyYd8ynLQIp9Hk1O91bV7NuNfkHscKH12d6ascOib2pjtxhdTlNr7rL4u
fkb9RG0p9Dd597Hql+gr2RXsutn90FR7jDlps0AO7FoWpacoOJXhRm5qsKan1/sukDIIIPZNvQ6G
BBI9kkXrH3ydV7lYw+F0rYi4NWuptIjp3nGVI9XjeF9k6FG/x9g+eMH1j2Gtw5NDIRV0COvcUz3s
iPeoD/tn9QCXu/nGQkdHAC2VVKLmFRVNVK/Zfu2Jq5/fnm28tufrmFxQoYHhSCOKV3T0YjZiEy6i
cdFdSBYGTmdZm1NOz8l5F29Z7lDtMWQdJULZCucX+20UHzgspnpAzU0ZRVbOze24a1/7YfkptLQq
lOFAFPPJOgM/I7ccuJslKwDba3Xu7M7syPURQWiMdzVwKyJxEEjVXshaq1G+Q/wj12Lmf/A523qk
pawH5Bl/WBDmeoH11VAylYbFqwMpb7IWHqPA62vO/MWnFtAhN4ONa6/uhHoZzAl9OewosL58DNHp
dvH8uPZLtvLdXOD/A+ocARC9EtthswLzgn9kn99zm+s1zxaEb5ZypDw7nH5khJHPNPjIdvGlA5Xs
jbw43Fsm82dNuerU5wO3RaZX+SrjWXezuB2iRgVSgzJO3JKPKRBE1bzI0b1niAfYVex7dcvvXVNI
2QIxSleExO/ulGB3AJonuMUTd7zpXa/UcyAHIzXI4vfF/k5xgK95DHbfTtO2Ig183gzmQExfM/iz
+YbmaZz/f+WJhC9ZniAX0Nlz3O2na5Drg1ftg4IDt3zP7vpoVB+9NQWSaWbfJVanzkonLq5gqpLQ
eRvvHKT+BKhv+BDLOhJUYPDULHBMBGDBjvHvKzsTNeNr4vBapjAY7BWum5Zexz1kBexXkY1ho3iw
INMXGvsD44Fww9RzHyNCDWrI+kXQYlnoRQb3m/yeNLBJPccFr6UjLPqro4waAlS27wyz9AFZ/dIg
QDjUPtfgEEiyLTQR0dK8XtvKnmbVKIMj4sRCFB/btKQpr3FU8GngztlMjV0sfDKj2OFFVbIEOJbx
NwgkRmDXb3ksA+XX9T65XfSxBXRZiek5+eMivA3LuGw0Y6TvzsMK5zYpdLETJ9LIc8uFm1iX/Uff
K5pJWwLwVj2zNcfRj45Qkr0jf22Dp2DcDRfLfgUZrOA1irtKSl9j51cFzw/SznEiL55YplLUHAer
/TjZ5DmePNfGTE0qBe5mqc0JGyxsoE3L0aT/Hc/vcSSn3P2TGLfqHSVSdgPMXeKJXmv836cS+p6I
Fq0C9dZWv2GJEwyBTnvb+A8Vk/MzXZndWXI+u2W3UO5SPgmgpy/Po6jMuB4NFUurIbIrrIvNOvwD
OUzGaJkmH/d91+J7eyAjFw2+fgmOCSfH9PsjtVpCMwioPuVrLAE0ztomg7C+e/rkaQ4JtpkAimmu
Bl2XCvrO1uNc+fhN8YPHtA2revHsDeX7HaiKFyCLVa1xPgW+kxRoGrDrWJKHSsQArxkQeI5I61+V
edb3Ft44QTjHRgey1/rBS0yazLBKHkKF0HKrRXqVEbCFRQLxyYDfLrD3vx2CrBzM8XsJSMRGbsIz
6MnLGZHYn1eGQWr/OBxPhJXhCR3zFHL2CKqqthIhL4odqz7g7TKuTfr5A4s8Sah9TV/5pozVAKL7
kbEF8pMXaYs7v0qRcZqO0x4M8wyREh/0T7Ds+zf82ry3Zk1m+J2AlPdp8893B/pwMLhY1xcZjB5d
507FFdMyzRJuoQyk4v1HxB/ICov/YkzKk+FgjBpVSYf86Ssw9GaNkrYBl+aNx/Dk85c6llBR1xJB
SRdiYzpf+uYk9gzGOWAnlOatJ2Fo6cSNj7g0M8zSJWjmZztkBBdHqwFTflTpci58pZbz3mp4Fs0D
qceuKIhHy4Is7TWSL4wtCtLCX0deOQtiKe0yMyX9ushXxdNSl2xJqU6BA0Z4CRLyXQMg3C3EVRi4
XtdwwVFPT6BQhgLr2MoI0P6jpoVbmwDb4uOZlsG3GZU884zb/R27k6ubRXZag6WLft1pCZboH6Vw
J+yJJeUTASO4SUrQWShaK9Jp/Z6Lb7H/2BMg4LlQY9bWw4uwuSP6ahchzX85bu2VBxM0+LiQgLqx
a6CTfzokbgN29zGxxL2AqQ0yMolLWRvC/Cq9UGBLMOU1cxDf17lslsYdlb+qoGY36gRsjPXlLL1J
zy1qffX1C1pE/5lVtjHjY4SbG5Z7eW+L8S+YvqfyfThxafV/oFqrkkqU4knWfehzCn+Upv+OG+Es
il0Txs6k5ZLfBMVFEBlBVjyyiTqo6ewPEoxZpaTvxEebK3uGF+HFDjhxX2JN/3poJScVu7jJWR/J
a6YPXo91E1qvLbiEkELBr5RJ31qzkIhBBcXbRs5fzZbdC0vpmUwO7Nfg2xLELzIA9rMZg5xxntwL
8RIzISKM4pUolLMdvw4y8+mBSvQoNdbDczvRzPWhhYv/j6PUPOMp7xwMjuKzkgWbjJDl5npAwURa
wBxC4wGS0ZAReGWddsBVNVeejU+gHoj6KApybmRHKTrSDQ+nRKJHplCXrs1kuCFDIdmCrTz359qG
xDmH9nDFAYaSQr/li5oFyhVYO/Ms8vyBPA/DgEBaseMjosbUTcLdBYUA0KWRQ87Y+CNJNioTTl87
X3ESNMW215IXexZO2wDx4lYp6iNTlZeelTmqwMfGlDPWLvQVTkGeoxUsnTxBlg7TIx2dMWrFkfTA
8j+YnzCEwkYJ8mQPGWdIXB/gXtZSRmfOfN/CXzOylpVsDug/MKCjzCAbTk9cBeDgE1QZYhOOWYgq
4lvgVofIc0iVBte32RcRtjexj1qQw3gK8picu/K4bmQ6l3exRLLmJDKhnEMDV+gty823F4W03pka
KGLPlmsj+lWoouvA+aqETUOIVSpowb7c1HXHIc4vug/6PsuvpJay1PcFPNCV5wFsXpN49GiMS4A5
2Y0VtFmDA6/PiSogXfGclOb2Egrc9SfYaoRkzOyd5T5KNXYoOw8CHHJRSfbvRRPOC5umZP8zP2nm
/+F7XZIFc7VGypF06RKvnb6JeXpp0/at6EcRnaXmVWoNab5UFVZXfInWHlwgGEn9b9rU84GcAncU
kDAJsjJ1m8extWsmUrKywe+nTIMQwRQah2gB/gAafZQ+yWUkE+bGjyIn6PqTvuhsyAkSUnav6OcR
QngPKGw0oI4BaNEMh9f8RLeKSVIT0TdL8ebCzgLXuf3Oon+psnMdEiyUes2Ai98yeJvEZHEQ+0t5
lihsa9VLkSFo/eiVl47fl08vhazhPARt8LirkXRxKT6uAH19kqrTOCoiSGK5PgQkardGC8rFbmmA
mVhplJQ2hxybZLeH2MH3dO21bAVB6DvkTw+XPZobPl7xVc9w+1gusiy6M1EjjBjgP51sMLVXAm6l
azR6NrHxnLBiez0maEyhGTDhSMdNwOH8sCzHcbAdpWeDUxWXtr+Ihr4lbC8PUjzv0ZcA6rDtPnyB
0TL8pbqBc+NYzxoHebimUNaPNk5CR2yTBWgtIhPBRItFwdhnCgsxPYSdZVWov1kA/Y98RNBeKx+N
qMBW/jplyHGpdhMkb5Mne2XWtRxp3Kmao+JOfbz4OqB+kzjnuPd2FAekNhK29zCjvSPs79QxXcbC
a0EJNuX3xoRx9aaLzYpTy25GbjkVifuwrpZo1t6t0bHrjfGO2L/+gGu4pJAWq/g+5IwOBKHLZVp6
1I5RE2wUMHKS6Fc2Fnyv7+Da5kTRgzn0KPIQl+ENXXk+W85IODh7zwldY/zCcdY/dUarQu1DJjbw
rym4RiCVUu0zKkGarQgkgbYLYuPUB8/vMRSIIeHbrs0pO3uy9O6GO3gOK0OMVGwDs6bAzl6yBaRK
mZLZEmFmHtVH7da23WT8rl+RsYWNKWpPKqnjyTuwOYhzKV5C4SRCFhB6lredlHUKAWRPTPEnkE7B
oAbD8u6Isf+DtSojS2A/FTBdvoHPvhmfCr+1ITnimtut3mCgEghraOpOysSd0A0jIiAA5Kc+0PSF
8zcrbGcBAQMw7T68NYlNAf66SQUUEUJg0/sUqu0xfpmzmEFRF95g7MQYmkIXOd6wY+mQNm81s+Ts
y2cqwRFCtYTn1Nf7kK4nVW/EiLHtdXq/bv6YC4Wq4o9dDrPxAuQuRIXQ+TDXxYzDVdWLzSImVHZl
AeDS1V59YslkmvzIYA3pUyS8AeZSgbxJNEuVrPjsE632yY5ncsbQ/tT3vwsQmtAalVMHxxv5k+jm
+hk3eDJXiMbDS3DurQGtgUMWfKFfkB1yauZxxXKhbqWx34BEHixO16v6Gpp86wqANMYAnsnzsnt3
o3fqSSDBLnJ4lAft6+fkDCR8oj6OLrqrYUl9ZfQi2QGSeIzPCesfEt4QO6zzxUngOA43SnxPhbAC
i6X/X3d0mRyd9EZBfphiinn8BqmjkXrkcRw6GNd5qsp51DLE4iqY9axV1Fwh4C8+ThigDk/yAuj/
+ivgw3XVXkeHNUn4mr5IYcxRn2jWxITVLH2+FEvtxqwOLNuOmPaR/qLP8B25S+e4W09dH6wRGy+q
C/MdJNExYdhuxa8giJxDsgBK3WCB3621pv61FmHRny+icjKAnfu7VqbJD3S2Jl3oyGuECIifr4rd
A6LmXysXCKd7P0NJ8Ca78lnF7xJwBJcsyfqrWLind5LxWvdNgXsGPrPfpYM2WP/2BmvFwC4FsKTO
dmRDCcnXmKL4zQIpPtjdjwWcoAigOODB7B+FFCHX8HK3Wt2QDf37FdV530QoV+pPWVYkZafxVBqV
YWQJ//ViV1cazNL2ohNECEbkVUiV1WJJhjwlILZGNaZEViIl6+6jUe0vGQjFN5kgcGBKaxgL8I4H
Bbrq3A2oZn5qt1tyyR/LzcTfPq+yf4hORm0CeK0Tyqcy0Hbf8NrBfPHAtSXMenyjR9sCiSZllQRA
XxfTROkXIyUs3NXJGaGz9CT/KAbZfi37C/ntJ3jCGhJpoq5EnelQUrCzFOWrw1vyU17NXdHqkbcN
Ew9iaUCOJo//rk5AaLHUZ1vjtqG00RNeNlFnqUOgguDBK+9KvQCvWHCXGOX055AVH05LWKzSn0Lf
wod5UkTtJwqmf5TM/neZoof028lF+KtGh/WUYMAvtfnLR/uVIGS8MJnRSu/9y/bJOg7wCXRUnXF4
WBXv5NuTDZyptUqpQluaXxfVG/gbCi23j71d+j9Sm7i0Ut9CliAqm6w5YHFoNBWMOT82YA1Vt5yt
DrdHNYGDkVi3CAFwxaHHJENEgE2p+7NN4xjcnomWcvT+FtbEe4bkZ35FX3lq9drS+TtUYwL44Xfo
GfCCdtZNRUwgPyzWjJWY1jknQFHETiFuB3THZAVwZn4Q8Xiet3WE0IWWzBD5TpLFC2swQk0ZFG4o
lFkJLnmnzEc1OliyeXjiKkt67WKATwRpPf130JylGgtKCJiZzOtUGAmgxr2EM8qgpLpC63k80CnH
SVCgUSdf8QykUokfR3QSX73hVetgcnxUCsVcxwyK7Clsc2XcrlOugHQNLwNIYAaYiOpD3fx6O+o5
KjMU97BGNrlsVUFhIwKbjRmNj5/luuVXnFL1p0VcIgztJkmj/AuAdKIX59s34FoQvKluRz18Ks7h
Y+MyJBcUEbJ/gmgzTVUNXcVIbRHG/ZkYFvvrI/hiesD7FqKnzuF32fMzqoIs2g88nbCqSN7MxWNt
xt0FDvdJOnYWv9EzLqYxJJRShUYtN0soTEbXn+iEme/4JCvI6yd5nq8lfxS8xigv0X7tbJ+V2yFj
paeN4/91rDX/DNiXgscxqGaMMrYQNjsrKMCLqEklSKYTXUAPGXb5EiBJcxO2tQwC+s1juCng6je8
0IazQUk7+SIajUGipxtz3TyLQIjbFGyGPkul4P0RfPSe1enySO9DKi5SRjpOb80c10Yhb/WJG3xv
YWWVqtX2EQGZch/JnJBdu9e9/fqOz7gTObaN+tKfTc5vSv1abrmE6Gage04BBKbIJv7VXUgc58Tz
GYdJ0ujyYU8g73uvfIxud2Rp3LxuT5/yLQ0efCVugJ2M6t/SNMfFcrvLr+0WsvsmAN6Eah1DsD+R
GVUYmAQpzylh2I0tQpj8k57ROgrsyIVbJ4k0RL9PDJW05pujyC8WjGeoN7Owms7PFfldeHWF2CY6
ka8/hSH4dD2iMxmCjWb5hJcVrIEhM+hSn4x7ECl0RktjRbpDRIK+CKTbWl30L8Nne0BR3ac2OtQC
jonNd+9hm6N0Ej14Trm5SHBnKAJCbNQnkqO7XP0SeTg4l3iQXRZ9xkLDtqkMawcY+pKh/tqVDPtU
GLr3YelOWMiu7XD6tVUeQeuCvJ/LTVb0g72Hya7Wyt/Hcnvv2rkGF5CDCcxBCPtA6RoAYtpoy6KY
mWXnRiNSt821vA+emOpODd15glHLhBPaIRlTI5HFPtfO8UVng1NNyrc5E8c+PlyYbnCnXXjAEHsW
K5iS7uoFwjxny9P9ADiBMMbM3/KhZZvws1bJhQmpz/8NXUZJLgBNDHxHC3Tm5KjKCwb3omBCT+OW
GzQdRy1gF7gUO2mwHXIvsytho8YMLKBj1iIknSx5Jm3ZCXKYTZ8RLTBU/Vy8KDTb2Lai7AdzEwtp
0IUe/MeOnCQ6WCCf88RezUUJ4N25a3n3w3TvAVZYT9lFcgLDwBdHSVwxit7OsAvLkTup+0gFl3Bx
XFMB1mWnIjgEL/BMW3URnJvscey25hdnpfsEwwa3rt0S0XYiRWow3ss0vOWnZIYzmi9+eqiiMAZY
JYcQyGNFYcuAqrHbWVWaroT96EatrAIvf26S1TFbo1RrA9ySQsf9BCMNLHNR07ToC6Fy1RCnepn9
eh/vET3VF2eSdEuebtmRHnE0GpjkuL31oWE5s/rszhqVofHc3iZ9BxJKQSKjOE4ULPdk2GFP+2yb
kN/MgsVAQscWIQFb9qJiTW9LctWEmDavNP5oy3UC/LlxAo8GP5J2+khR6bSs0BME0JQtvqzkeVD+
booVu13NDmyUosIXrsxzW/QS7GzIyX0Luofgkr1JXQFoj9QgrzexCJCJVPyiKKmaWYPbIc2yx3j+
AaiQmLZGEQfmo4n0wgrNTv684cFylYd5hKxDCeuOst3/bH0FVJOYt8pnTcOyvogloK/uePiiENpT
8+Zffm2kYYUpZ1SsEu8WzQxyUnJ/v0ZKlY0ggJQ4lJszbq2zB64voMaSh3vseqcPrWi+0NhPJXT+
B/W//OLsFXj+bX0QKNokqldmAvWDi56fjFGcPbPDqxoRCX8zjSlBeyrBDRurBI8CXTFnU94cXvcK
6ozVrJaKBRcqpR6UZgNxmPGBjWCnp6QjVAPXylo1z7t7u7IbAIUeQLmHOpyfsbjFIGqlTyOAmdvs
ZQKRJkbspMRAxZmi0tt6tj9DGMsr9ESTMrXCgLqX1R/1qOfv323GFp0bIpEPiXKnbPUGP59PJ1QD
eiiKaOVLCDvuNY/9o9SbS+RNkpn1L5z9x2gFAqc8pr4/CvWa4VKn9qYzIhcu9xEKNDC+u7eY8bzE
oqS8VGvmAtdYfYPe+rYyXfs3keaQifQqgyzGmJEpa+fT8q/FNin2LBP/arOGYhatAVPAjKecmWjj
nCv0jLbyqKOr7hN9FDOWwAQWK6Ei8emSzAhNh0k6smF20oBUtPWtp/HSMAjrER1IoJATWbw2CHBt
fXRHBKbDLa6FGcvORfEder0AFahiRT1JeOX7o6tXbukMLx/rT9BMwE3KcTzPgthfG66g6W2Hen2C
32qgSWpPbzHkvZL+2ytc4Vn0u7xRjysD8HjW/fHB8ee1xE/Jwag8D++qanjmNp+d0bzwC6L1s6KN
y9HfYyuDa9+5fIxqP35y9p+XYktgdWajckWBw2huKj6YxuJe8InkiU2gTjvSYAN7OmPU9neUV+LH
7iZGVkijkS2GINexOhvUMwNWxwNkaXJMr7/AIy1pcPoF0ZMQVYmLtDBrqztLmGg/9v+P4ErGpRzX
yEYDczkH3f9vHPE0aiiJgzhKjFDgRIdZQLuThjHN0KCp9bwAl3/jcVy/yRc4sbnJ1bJGNVGkahg4
3PChQkDc7HVM3uAKZ7MgD4BLSC/L0FqmZtEpjs77yihbK1XjdMZupS8m02H/Knam1VXRLfAi18fd
OoG1N9xhhL7w7ApL9elG8sNMWugNGIkowms1TdDO0Cxe+FVIzRZcd1f7wwCfpi0vpeI+rd8QFeUl
uPCG0hhIM1IKu/2dcmmgdA5dSS+h1izPK+bTN5WlEdFUElklL0NMln+3zWtwllhC/HVqEyH8RsEU
cYavTkNHrWqmvs/aF55JbKZ+RmFr6to+7GpFdeEMmJniep1gsvR+jrQ9l3ObvepdjI15bb7RbrT5
WdX1SpIqk3B9M3yA3Dg82IOIamKkBB6bNoxcZ+yzfQS7CWHeZBfLljglsMV+8rx72Bwc/UJS5qLT
L51fpwVirIKhJeoMa5voa79CicJ7FWNEu2+rYogrHVDgNwipZzaEz6cW9LJWpVF/wPgIaIfACyCA
Z1EbyGMCvI/z+N/lD4w+JpUcNnhvMq9KgNW/pi0l3XfrewafeOhH/NoiuKdd1n0H5wJ2aQyIcwdU
DYD6aRbU+bg7rWruDBahxFLrA9xBOMJ+6ema+lQEtY2/arNG4UyVkovNR8u4GvaVgQFPXuaF7LYp
z04Gv9lUFdDVt5ZRxqsRA/KxY3UfneH4cLOpN6OWo0UbG0aFTGHlCEW859TWgAFX1ubmqKFDflSE
RZTawylpKrNl9ZUqcl/gfWO3BxqGBIIF3/BRXs2b46askSCF1ntmQCfVN/cEGkn50jmJVJ45kY2/
7S2LYzDPR1klGQY0J08ftQ4olDEFM2NOvbPG8R61zM1RLzoY3PpYOFde+0RuzjAl7TeOoXs27Bu7
JitLpxNsxVe6VBQT6egMWNIQOxdOUn4AOv2g+E1xWdS777R6sfLIrDgie79rT8u0z9Vgb+Y42x+N
TLF+63gYuUxUKtneu8iZjefn4FTDW2WCmcZsczmefEb/xtPAz9ZV1UWYmK9eawsXOyfPTRXQoXDn
taQFiRTOe7bbtQbIblHndd95FsMKTgQ8HpX6oZGy2E3YbcT3DCvx0vNRSikt6NvBlSh0aLMjhWVY
1H+vOANhM1QzjhhPv2msS0mxsO9Z8pi4MtUiWug0i1MwxLVe1QZYrPvAv6g2jbmS6P2BL6v3ZuVf
w6NHbcEQm3P3Q3/B2XamgQ4qWMqG0fSLRjxNI2El/nMKuwnwLLxyhChFHM15hV1/MrzefeWQivEe
IFYvHvJZT3lujjUaZI6mRKQx95HPyhVUNoHw4Pg1KOJx8R3XjvlyjDAETSCjSQSSba+dbnggUu4T
H7N7KvBG6ABZJSFBm3pO5jDxU1YrTawvaIM8NL73o/ms64UMt+t+8YwvNzbAe2oeFm31xYMYHRXV
GCx9BjVNn3yhpz52txlCTApmuyDw7uyo2DJJgFev+FlWjjCSpgMAGah1AqIusGRELuITjpLd/hae
gtrlsjtryvWS9TO1Q+qL6TA2yUSy6sTbL6zGHKRINYZkS/wa4jMIryE3gkHMkPHupIdV/x4XBKnL
yfnUvdy8paDxBON5QFZMFCUCu4LKJZVSzOIBjMyHyJ5snuIXqCAF5T7bOqVyfj1+Rjf3DqvHR7Qh
5CazXBp99tfSf5oiBv6+1OmSEwyUvGr50jipejUVvZSO0J57RmX6MpPgKc+b5C0kxOYjsyijUNPY
JD+pzbtnZP0RF/rnXvkAQV6xFTs2iXFVun5hz5jZnc0Dl1PfiWWpWhzKS4rPLKwK1BRjTaha18Mf
AfJTand7kFs21a6vUL0ApUQPjfVduZU3C5m5+RbR2nootQQ1x+R69Vm5LxqbH0k0sKkQFthBsPLr
Fx8oPR1uA4a1VAUGe/h/IXiPOmxlRbVMs0UfG25fQKxMCB/8AOH/oLozn7DjT7n7ZePSZcfYGJGX
cIKyzi/LWgjLdHEVEwObEmOIyAPQw7KERzzLDoKFKOZpalEogmTGKsqOhEXfPKvoDsbMCpCRsGy9
7nDg+jIUrSAZCFl1BHiMjZKSBoTZ2M4dQZlRYkCWS65JdqfvpUJhgcWAwz242047RskXQGlcaOnc
dAin+jB7QYu0hnvMzgf556QaRlSFeZaNB3TOdptSb++nOlYMOhlxdLlpxuh4jTeh0a/mzpa5CQOB
D144d0nq6VKHSVxjlwm4HJHQBlQcl8oFgd4r2AvBkMRYuN51pRPiTh9gbMKeAt4HSLIaccLf7ICR
eQGLdUpnNxpuXzrXa5DkkepscCs0NCZCoABPhAeDv6vY94CUruHFmcP9mYg7RAicf/sAiS8vonYr
Vb7ZDGteJ2pe4JoEkn51YtEQcjtrCrgyKqQQrtmaX008d73eNvxPW2MDfL7CHE+6RlArV8qNF3RS
NeqPFoDuTHsOl0QgUpORJlD34djIt48dEnhvsPrVDyvek58UM6Asb+XFrGm0w7ngdwIXG953w2GG
pioVt5/dxtl3KMn4AqhzfYGDoc/aYCVDgX+yROCVIL9kx+SW9VNNgfb2CRvk/bLfdPHWTUHvQCMc
wATuEnoiUPnlj8VHal6jF8so2eRGL58eQLDQ24dCp88STs+K8cv29CAiq0x2ri40uw0/iLycQGMt
tSPTfM5OQNpzekSBrNmWP9Jjs0L0r78QSIFi2Cr0ISlYG4u20hfbEjowxTM9KSgid8gUTuzE0x21
jJiMgH+In1yv8lqP7JDRgi81fKhbOYCXHVdrAtmjP9Y89MMcK05MGAzW/5c7WBuhjpbMRS3TMsyX
Uvpg6FYzzlVh5FbzmOYUBoqz2KrijGfbIuUmB/yaJJpCiK2izZEdrBVM/9TKfnNmHOCisQtCjwto
UonIqOcVOAC6nYHFoUrIKUlw522NRIoCmlWM7SsVzsOBHuqizR96kROkJQiE/9lTFh5umHmBCKPY
a2Wd0YzIgWc4O/RuZeXDWGibOGm3ZXnBo89jJ83ZFscZP2X67FQlCvcIOzTwddJ7WdBllWrEsoRt
7hf1WdDvyuVwFKYqkUSrc6ZmlVH7fx6gFncAFyq4jISYIsFziiUFFhWbUTfukZ6r9HbPittaSEjh
0zZBBatYygzN/vvOyJXuDn4gfjbOClMGxk3lA8DP5PLfxBE9s4bPJNDmzNI/7fsmNf6XMIf/49iN
Kq8lQLd07TKuxU5LgNkVpnNzNmY/vT8o9KGXshD5W/6jGE/Y4Y8kJsKoolXnUsGbW1fx0oKYMTRN
cJAGx8SM1brQxY2jDMWw1S03GiLGHyJnYvs9zt2HABuQjA298+nB0u2LN3IjplKAWI7WcY0dtXLd
yBssEDB5dHpLL0pmzJIrfnLJFopXCJi4sjrIRTSkgvMGfBon6MSfR5faIKV3OdgNTE8xEeZ6EfWH
91/YK39cx3redAw4gNW36Dha+dcBve153xx3xQcwFIlgxjKPQMUJCXYtsox2pA1TSibTW+AGoxKH
P9r4FKiuzwPXB9PBsu8luQtMdpGtvbTNgilCytHtTO8a7CR94xGbdwNz/ZRBPthSqsf82eR3LyqO
V4cncIFYqvyWI22AGOSoYdrumYgx//F+B2IEnVrID2ZjMk5K24ogwVm6slTrTgkHV/xeLhBp7yu0
aYcrsR7SQyijMgKdCxNY/OCwsrK/AG6cM4gn7QY1+ezRUN1iqVvP3ivfteSzR0AwpkBAGAf19x0b
PZ98KyFeMJ67WPhgU/xQHn+ueFUB2XzzehY6PTH1eYPcLA/Xc/udVMPdh+T82nDKg1gGY5jleLTD
UwRmNy8QtR4HEQjme9jM7CsiqkHuguqqKEHr2ex4tFm6QEM3NIlEM0VX+c2+gg4b3WcV6sidLDQ6
YfXN1Kgyug83ccCiIzHz3MNUcTs6NyKPQY+TxU6ZQKQpRnR6tjmkmljQtF734sPE42mw0//VlMgd
TJe0yIhiHuPImYGCrmjKuNJ96aHLSY/LIndKhzqz8fPtCMgXYatCO78U3bX8hh7OgyQPsOSlITJs
honjaIVIea9ObNmuPEgY8hJB4zqUXl82lwDH8S81LIF5y0qRyJpS/as8/QG6tzfxfi/8ljhoc2pe
kAFBDzQu+6jZRHiATV99rVLpgS5yS8iNzJBcR6jfrGf1jCyzFraZvqdugcuaZjgXecPmjfTXik6x
1FAx7EHdrcRHA0z4x6QnMq/p37IBLDqDuht/n9leQKzvvyLfaaglgoyco38F9PnMDycEWf0KTN+r
4NvpsCKfBU0ACeZEfKSsjSuRrvxUfUnFiHfA7XWr4B4he83toA0jjuWr5wBc3Mlyd2409kjM6o2r
Dxz+eT+Wj5crSW2PH4z89fDfVNWk7yN9Nd15yx+hdn5gD3aedQe3ZXun2yLwYD5+KRpQJEQCCWH1
5sB0nNepDVXh9pz4ZbJf0NVdZ7QEMFATMM4XTHmV1gKG0W4yMkujEhLN+X2nUf+z9+yHHnlb8Ba3
xbR1NTxxXHC30JNXXJNV0i4AwAkj8kaBPW1EwM2xIdS0mncZEhhZopXC4+MZxz6xINub0F7pNFRx
YJf1n9v2l70PIZ1+Gr+f709wapd38jnY5qJwqLoUaA8mSgJ2ExDmbfN7JZXhef5MHcxMAxEt1VLO
BjX5tdwUXbUz30/OSkjTGpoWljEnVnvWCCwF2/YU1kKXo5ibFkLhuqszvOvisQV7Do4gmyW0sXCF
D329hBfUdoxHLpgCBGYw+Dg+rRgW+4GnuQ/59vM0taR5pIE3PvZZtYL2FCp5mbgpaDJINtXfEIaH
HF+ecY4Y2S3gZXY3KmzTWdvGj2KpSKmkAnQwu26yhhxEWcy/0cDui/k96OrGNfyF/2kOLjc/PKTs
zr6Bohk9VFHAQG3txzM9U3xVCN/XBT4k/Bub1ZU+p4vshPd9Mrq4/p5ObIlI2ZyqkUtcs8YUqwmn
j5GT5TYb7JfR8QArPJPIUMIHhmmKLqa2fs8nC5gg8+5j7VSJmtxw5C1vqFWWHAm26pmwFew1wwTr
Wbk2qZQ4/S5DBWYZzjA8Gu8MUgb5Yn7DR9Wxt6HOv144yah0SLAizectIS6yU9QJgHlfElWNywAY
YInjljrfimqtMZ6WA0da1nQuScSt2jKcl3fbCbmc44wl+vZ/ceUxCFmbVIrKG4DskTCUVFRSxb3a
3+AIY3qi+boxakvyaeZMdRGSd4XAqsgdaUBPJYLSfyYz3xSi9TZgsdmK7anXmWuYiQG3m25+q3aa
h82huowjV6XDu7Z3q8H2O0ywlrBUHEYgU4tUaxBthrTASwjFtkN/Iz3odruIJgge6H2fH0l6S3dq
25pH+Luq+eYXbKRXvli84dK7XxZ2qW0fsOhJ+3p9p2mNBH1Ve1LZHAjmPMbIxB4JM57vyDljyBSC
LTcNHG8KsmVRx3WfIeeKLy0BKI4SL1ommv//iwnzWFJfNc8qOo0O1SNuYYFqibI/0VK6KfZmofNl
1Zzu3vgmzfNn4YKGE7/Gr5ytZhHG4wQorExNmk83RBPZE76PGrAR9OxLDFaGQCEAPaKI62wO5oY/
5LLBV9gtvPGlwgvBnxznJB6hWvvS5CN7/vC4vMcOf1JtUxsHAD9B/tYqvdHijuugUU8+fg1OWetl
EjkVNduamXX1gPLzVBMNSiGR+l7sprgmBONxapA9Rp4h8rVqsyTHd5RQPcKZ2emho8PuGSJBgjMm
eW3sSeQXHyjrY0hiGWkBLHcAAb6ZO9aL03/WJgzeUF1QTwOf6PF9+b+4YOlRsYW4aJFylu0ePjtC
/8iEDR9hBwRnRIa57NZJeMywfC0deLtjsnUZlZC+9tYubgeWwaCN+1hS8EdYRI0d8th0g90jitIH
bCkUwTRKB50E+UKiWrXNFG94GB1PYPUcLxcdX8yKWyQjceFnvNHnautatGONvkyDx6pn5WXwVvOf
bKYb/U49OizrInQcSWZgZHSNA6DiJUFvCQ4MeNU2fp+9/a7blzaMrJe2RPgwIiC8Y7l0fdDCV3Iq
g8IsdrnHo39gbICC/ebjt1Ostzki4dD2crZsg7C1MF77crb7+Sc/bv+DPnHMfTHKbEY/BhVOui03
O2xweCM8BjqZiRJUlzW+oTaCqmhFCyerxhvukBl8/XIN3qxrCnxCZ8Q51zvKnS/UebGmPKaPmdmr
X49K7RTZV29g2LWUsHKTOGB5O2ikBC/7cJxslBJkT8lO7zMaoJJcSgwS+5hDPDid7m171svYBY3G
uxNYUYQ0ilBLkudmErLFXu8f3TGIWgsblHn5KrpN7xciQk+WgE4wWLezxkB4W7kLBz9yoGM7HQUX
NllKdGnF03aD1bfmQ3IpZIIk1d20C+GjEIIHRbp0/daeo2aWqTviD1yzWiaZhnFMtdsvUcpygkmi
924A/hxx0B3d/1cuYrRR1ezE+eIrJkqKRcCZcVEnntjEQTDo4t1+rpuVLTAg9oJ5AdCwZNA8JVOW
D1lUzUxt7vIkrZDcVcJ3Cmpv//IS/XQ2pJf1chGdQrAuq1CZjrizB2sF4lS4CpG2PUUB8AplbLuo
85ajJzW8w6xRRFx1wjCBggZFu48BlDuVKxj8/IoTfm82rHGoNnBPf67l9UmLLkv0qooYoo/difOz
/YCwzeDRNwjO5hcqTyRWTYuxoXRIo/0HJRxVaQCzxjaytEiMlNZxqwm085+2VcsLSzmaX/7mZybj
bH7/eI+5HQ4652DQRk/aH12do9x/hTPjyfEH3EsgHCviNzrZqCPXbAUd+LS/iKSNYygjgCvgMFeE
ZYf24bKmAQ6LA5htUIVs9TKqR8up2Hw/TfXQNK8BrCHVhAOKPCnuCarQ04qmm+vrPh/D5Qcc5OMv
YxdX7jngugt13DjPkOSRo0HX3f+A87lLYMDbRQp1Z8awhjjZm3kK+ErV37lcZkrKN4EBJ6MXtoVB
/rwHwc9Xayh6Lt1v8FyXS1R2oNum49SqLLlFnTK8XbJQ/c70JhXQ092k0BsUAyUjnrhTo65N+tgj
TSQGAEnm12fh1DJZLlgXFV8g2vmUznYDk26oyoaAk2Rx3LCvI3ySNI3YaNhx7IC7Mq+UmvZWcImM
gLhdKudq3XczBQpnN1lRNQTnjB5TzIQv+BwPqkscfR4IOz5PtElYVg/neYq5TN0Z9HymROqulr9p
dR2TE/cm+V+cysf30ELWkKW2GyAsa7Ekw6sFHFehQwILF07jawmHHMY+SGgTRA75D6/x3sGL+cN3
1PSksv79dck/wGPaWEPbCA/cufww9WZ55EqRd0FM5n62aWH4/W1r7G6WpQu+jfUaKMrdxeeYn8PE
+rAhRCL4aI1M9YR5YI+ulNbzLy/yx92y7MDWyTIVlsCCe2VsInBejjcdwWMcfdjPSEPeMeLNvZ4d
VniKueWGR9FFZo7bRrnwnB3Ss5t99Eiga4WggcwDJx3pFGWe7EJaAvBMX2EOmsz44cZgJVOiMSLl
symUFT/J0lWbzGd3iXsWJEuz26/qdn7cERKfqrHs8r5nBt4iZ5PaQ8Jt2qKfA0xW/P3lpAsyPlXN
GFZklF0tLEJITHFMad+hXCnn0xHdPn51KzpL7b4Oz4LQCVGPpjciCW8abqw90G5wPp9iHAhu78ex
JuKGhjeBJ3Oapj7os6NdRxhHtIc0mnRUGIhCWB/zzUnATBv83RFtiycutLfOsHeC0osebw9Q46Oi
8WpN4uqHUlpQ3p31+8mwCQGqFuX925+LX4+8nyo+LUBBDyro1Hd94HNH2RY/ORddVGBtU01FlVS5
pyzv/dvtF0uv6FyPYo9FQE/ayklnYtXJg/WObeatE0lP3HPCwDIS2MjES//DnfFkJ4f0PZevuxjs
gaqz0Uy4QwXmXebAFYwi5bTBcU5lLO8VPl4ZLRqa8shmmNSlQT8zRcAPwy9U1qO/R8oevTO+fCiG
LewzEi1KEvpHL73wNBu+AfQv/2A/mOwjYVYIipAVHpovT+SKdhhsWvf05vBtW5q6bqlh/OHrKhmM
h2qgcQ1b7QFseYAtQ8efiZmUspdfJStq3qD+PNAA33lHsTEJb5Yf1HwpYZH+bgDHk4V2iXIkakoH
SYM5/UB2nUw3eTZys8qCF+jA0gbMLYDRTUXsctnPtYoJTdRzec/rnQePdui7AP7paRMND5J+w7af
hwAGNwS2PAY82dXI3Zqxh2XprrikL8LGhpIGAsnHG1lQXFPWSZeWjLJgaNr65YbaoiZRoRh9BqCW
Dzow0aWgoN+GaWwXjP2wWkO25HEAve2k1rJLG5utUx/s+ToxblyFKcpNqSaQ3imBASVBFgC8Erq6
5/S8dbHns9hQXVa4PPGE+qiRQN6ZiKM+bH7NxDIs8/3bxC7vnqt6Pawc66XdV9Vu96ptSqsouNF6
PsIcO02R9vchWuCUKi9jxb0fAKA4RNN+v1GYivnhvOmLc6ko4b9Cb2o6BKeodlyVGuc/jRO8cuby
AOuMpXkwopyFQxA2JdqnY/vT7NPZCmTlOX88/KNxro1dd1GosMNgPjr9B7bN9rd8suQaQvmsYJMF
iaXdcox7ugWrpRKNMfL9FiTuBgOauGMzKAIuOfr6mRS5FQ/CfeGPEgFE669V0qCbkwAR4KpOC4Jq
5OZk+B0zEoBZVfnzXyrt/jewStfE5RKMhQE7WsCTy2ZbxPQcjJEJs3OdGsp4tnLaTLYn36W6leGt
KuXqbyAfd7bBYmvNiGSFa2zhWXoASn6ZPtjKmHTNv0gN0klOBJ3Ln/N2MQzbLEHqW8LRBNYkBEGU
FlCCS+WjiN6AoQ/m3w7hHaQhaUFlWjctgwMiJluk86m8NX1fKGocymEDbmDhg4PjsmVcTQCid1DZ
9hgpKyW9m27KV2M/LZY231I+jK6XwFWIYIHm5udwvLUpgRzmhFistWsAS7Trb/ysX0jl3g3PSnjT
a5+3QAcbnXABGpLe9HWfcpnku3YsSGu1tvQVG0KSPN1+TM1qjrUz3JffBEis1EuGDfQ6weMBh4II
FrZ+6ScMA0XPaOJ9pYgDyKdZoNJomkFNqvr+n+5QzyYeUBSUd6cRf2pFUZ3H/h3is/mjPEq0HnnH
+oA9OIEi1gh4s/3gSATpR9Rxv0ERQAGCg75LYk5pFX0Sy7hZu2d24XrixB9MpTh4D/l02akCQVid
Q9x0syPL2BC7ewutsQq2Pa/hSNU+1ZcD994MUb57OL/XYvQYienjysO4UUhVrue/3bf+Bpxs6A3A
fAkJXil/pPsGRvYFnBVe80vWa06Y+m/ooDSzQbEQI3Jk1sWommq1UU8gbOQfOcqidmcgOEISfVcF
Aee0VJkAgaAoQt0KmX1stNDmDrFbk8MXYuJeKrXOQzDkLOVyQjt7mfv50pf7P5weUMVcjbpCn3vT
8elPXeaWf9A0Tefi5JBydR4MEvO91oxH0G6I0niDakAug4TUov2Z5fPFMQ89P5S9/ixIqTHnXLC+
84y94u7w6fSNEOmTgCJRBXyeG3faVp4LezSTdYaWkP4ziveVXBRAdU5DYUObsrdvWfq0N8/nhn4n
o6GTcfWPEZUUAfXVmgoC/yXbf+SMP0rCG3qjQeUyF6k1/xVbycLe9HL95bkErvbQ6gnhFEr6eteK
AsTbUfRqxHcsX4N/OqnjaYm16Yg0bC5zuuLpzkkQFwrnOp/Khi0QcgYSC341k7gZijZl2TTDUrb9
cdWHW5Y6MY3lXHgt6yomP+0UvGQpvIjWbi25ra5KbGBKH0J+AucrMuceB2okAJeBLyHZSvFaLqT1
I+EBfpulME1KUexGnWII69yo4yPSmIXC49Mxb2yHNz4KdC2ppo38ENaXRGZLxbl2KFMf60rKOfw1
/plW/hoX1oPWl4OLZgirUnyxMc4Ssj0VPlcCD+aOYqNPK8NU/9GMurHPFSyGBItWCjPK2oAva1Gh
35W/NWqgttE6P/wnoROUIyIlascCimI7YQMUhFHHhnfnKM2pmf7tI8bAdv/jv5TRoiOmak8Yodot
1j84ZLkIU6KvjZ7nqx1lv1Id9RN1flYPZft7LD2DUX0+t/MBK1h9a8Sc3wI/I/gHQ08Z4ijWnmhJ
Vil34yDm/U91T7ZJOhIc/0z/kOVnwh5rQ1H2d5hykWBSGhNUY4vN0AcFGhFiP4DnQ8sxJISgCgFb
tC8wR0SN1vEC0VC4v0o5kSPrDw4W8nvbSGs+sMi6Yj0Wu9uFsCINKvdD2XOgnKXa8N+to2ZTESCU
LJzw+6LOh9tZhPyuqWYoF0q7/0Hsvv7F53qyAQCDwmrzbJNSGbL76Dkhun+gUCnnYbTLU6nW88KR
pbLQKiYhpa8kYzpqu5oWTrUwjN9Zzyj9kiX1ZzMrEzPrUq52j5N9qY/P1El4N37bCneHUnutvHvn
WDt28/6j0ezVzAoRYzi9Ku3H4fQ1B+T5hk4GNfLDZwYiCrH/bdDa8DQnvXN3J+eBnLjFOk/mmmXm
VOGLX4LykYdzU8wZt2juVD2sOaIiIbmM/rlLHX8Yu2zr4HMjDxXh2co0IEyr09zSV3Uql1Ic6DH+
Gwc+tMz1MuPSHW9q9ExCuPM4q7tvU9Uiypjt9TUVhIb3pyaV8KtOgwthkWgiErvdE3l4b8dkrOSN
ozJto3tigvQMFiaPj0GF681uGOnWzzBq+3gk3ywbPrfqzdZSbgyesgQ1xlgv31iKeJ+IUkptFdf1
1Yjmaf/CcN0YQWOAPsCxoeEb6xgCvH2bUdg+ujKccXT4U9WyZTdYJjwjSK/2B23cw29O0Jj7P8aR
pXyeebL1Ckj3gPigUSuf7Jc7wBjZ5ncOGWgMWmRKeRb6ad8D+ArrruhVU/W3+OarChcKjnrrKsY+
ZuIeaYSlpNT78p3MHcFmNMTUbXVOsTEAWBbNIoCW+5xc904APn0yQ+T+4p03LO35IeHeAC8ZKzLz
O2f2wf62pisKZ6YPJsgq0R5YudhEwqlIIj6aNs9cV6e6Vh5xuGygaK5dMk/GnA4eMr5ALAPyCwZI
7RywESuif7A0F+NwW8RTa/sE2q4yhkBLfq5YoclfNtrCN8fbv4ORDlIO4aHZE2O2RhjKvmdq9M+q
iKy9JxOZ9or06t2KuERorGpUDDDJQcYKxxMdrFDJ4JL+ZuDIBwiRWaB3VeRaRgfQzOp/G5ufIi+/
OK1wzsIdeRySiTZel5SDVCNWdIqbyybIP7YnrFPv+qd68leDTlM/PqINdKTp4BPmPrBful1fd39C
BGIhBB6RmA1BIYt+oEGcbfZW1/BrgPuTylD/1a3ymWdnzNz8QsmJtote0F6gTOf7gkkTKtuQB89k
RR/BilTGAfh1Q92oxIgVt5CVnMsRf2amWfHo497Vsz6MiwDkrCwXohqIMMgp9ekQyFJ/EBpp/5Oa
Whtuc3gq9EMFmeMybwwAoC7aUp6GkB6pGIL+2qzVz+aJZ5wC7xWmJsVaKdfLR3i3RvCaBMwCGTGA
bPXG3eEl01ZTYKPFUH9ThTxmbpJ05Ao6/39wLf1hWNuFhO8P6rl/rBTDDNOpVZGagsjLMrBRX6jS
m3nPHZeItf91h8DkOA/jrYgKgVRcE124wStHK65RWKxGK7172tSSTa5aA+pXZZJOPbekhTejgiDj
0mEOeZ+a5C2nJFDW09sQbOBpFwKDsr3msuJvmlHlnrsO4Ta+nlJzGnDI5idra1QxPwwGOpu5qiBv
Oq5d+ekhBbuDUmY5BDszVCA32zU6T1Cg+1dZfRWeHoNL2kZYERHdf7eDCFZ4x3wvhQ/rWQ5UkeCr
mdm+oCu5QIoeJmoMprOrLZnLL4CzTD/fLoSR4e6bH+MYU7bxzDpJRQaJM7DPDOrPTIXowD8r8ooe
kcoRTForTBiBz/yXlkZjtJ9XWZARBQLv3w0uKW/OB6003m/QeMVgskkya1vOF0Jh4nkl3IKoX0q9
3cXqfGsz0f2bKPJ7ssYM0GdCP7zo5ezPk3BV+HBlx6GWzPmhyK78Q9e2qniYxxKOznYoz4UawS8+
HvAaCRdhFkw/6kTxPQk/GV9PPhWyrR2aKj1eK9tXshrkr+f909eK2zWMASsaFzUGDZ3lYsE93U+u
LZ7EL5pI9ROtRHX1M/3iIZQ6pNVqMB1ooXqMBaD2FEhUquOr8am+SEW2HM8vRzud1+O5BkvEOrdV
QgYPURL3LV75wxmZGgfBsafVPdjOCIg4O1qTirw+o5CGFYAcPVAh5qJLxGXWba4Rm2wE72CB4qmv
bs6SFX+drJvUPmEL2M4mmiUTei7DWml6cGwSkYE07a3oHKAB6QL72y0hVP1yDHJ+1lat4v0Oyqwz
VbqWB6LvMFgYjOMxJuUdAEGxBNMIZ0XuFyV3gUTL8aSfkNHf0ZhmGYrKxhJ4Txz0/FTcYGrHotA8
k12lurizyj9gVWvlOHZa00DmAX98eJspEEX0xeeodOcSOVyyPIrQ0FaZAcldez5G4Kvy4Il+y9/C
g4enDlgOgBGSrnIiyNoJXWGogUQN4R7th0uuGWhsOip8gMwHURtzlvXLi4O8n9bXZCQTUkxNbqKK
jpc6f7fG9YnyxrEuR3LjQZYaWxo9ekAh7apLjFjrb44BMqDrSlYvoMl9g+hYBz6yMomGm0ahjQSj
YN2qRthmX2HuMZaI5ZzdoWPticwTXgmbOZUpfQzhfNCjNCVJqR0cfkD4r69iXpkhkFbYQTLJGafV
hXs4zgGPLYBfE5NfsFL6PtBcQ5pIPA44RXCpXNFdEN9f7D9eLQpCODGrjvhuzKLG3wiQ9E4ZJIcI
mB2NNPX7XmArccrqieuVIrhNlx9wwElYl+VR1R810Z0/8KII+Iu0z2Hvmvpa0CG7q/bvxJNHi3Th
uZzCzFg7h6YceJ6rA/sQlCCeSGVr4ZC8F07J3X2Vi4lD211eJJzK2Dx6DjdxrOcGAH9GhFi9k7YT
zn47uCNKqmftGIqfAy80TzHKoYXTo5kTr0LjZhrhPSigUm32+vv+MYGw0YnMksdh/JlDWoXCUlYO
Sdks/qAEo762Molp2S54XiXpAtzHx+F1Ia4zA5U782fv6B8ap2KVXDNgFHCSvca8MeQNiLK5K9M4
fkTcGNYm+VJBihw4DhbJnDO+6Zk2tOLjqC8b9U/i47VNzsoGExqU3mGojOFAYHg8U6S8h+tsX7cI
CId0DIQnAN7IG/2Kvw2NocmXkZz6uZXeG72enc1eL9Yl1oBf5OUH5hzdCTzj+qIwRVmXZAGfIAVd
/G7OyM5UGDDF3OQBhwHQMEFM8SoykZbdkHsLnB22JVO9dghc+eGKH/7DUWS6Iw6TXI+TEVRWk7ks
MaSe9D7MATbwqI6q8gG3G6SAWTMw2cDKqaNxt4ZwMOLjanEOBocdU4otZ+GF5/xN1z+7Z7H3byJg
DOHxig/twnCZfXVIXJoJbsIwHcHC8FRCidG7hvIa+F9FO4XYooPiUHyNd7lJ/kIyGO/cUVtWsWs5
8cqjycf+j2JATeAYqnw91BWhrBePGDJW9YcZJWfrVFgQ135Zspr5U1J2dC1LAR8dN5G8NDSva6I5
zm6tZkZIKXRF1lZvZjlZMJsMDZKhAtsOb0zHbBcsa41c0K5L1CmZsHVywal8MYr+C3O0HzgRzU64
qPXvCsPOBaVn2lBzxp6AkYHrY1NapxeiyrWc8lvYRVA91tErGLV028yVAg76uaFEiOMc5M/rrsBM
nPsG7L3CyE3HW9WWBnELLsd/r44dTKsWJzKb8dim9PaP0UHgkoKQbCRL5bAkdRR5qhq3SGnDOjSO
GPTH9Y45dOgxfyzZh5TgnlxkhKearwM2XvrKuvzWvB+OPDHbzLcMe9mAOxsmR2pONESpT+MlZmBO
1/rLIbb340GFId5WvAPIi4hqYrzxN5GD24Ljd3xD0+jMDope483U6s3xFuBdwfoQTnGiKvk3E0cp
rz8clCgV0+MxKmabxsIAXZ7P/8kN3kj/MEcLUwIWxuUsS+aoBp4Tvx+fRLFuzn6J2Du5Mex7Aevu
91yogwcYyLOfrY2gH7sUGU1kO8Cv/cQRGdtlZw3HKanr4QMcCqfKZfhfNc075Z5HMLUxdPKmvOdY
2ingT6b+tlvqWd4QqJAE80fWtGFgnBPFL+9T0a/S7l1zU+WYlpiyt1wMpoE8nBnRAY2UwXH+MSgV
I9r2B20cbgeg/43/o4EfMaklN9yHRlHYWJcpoSv2qqhkXfqSgOKCeOWqeZtJhWOwrkTE1V6wnx36
O1LxV62I2ZyMj2gSn9IQ3qUCnK5/xzy1Qsl32rz93yGJEQ7Mei2JsSyzZMX6IFEWwxUwuW89zd2M
kh1BQUYf6azVSnaUHe1C07REQEqVgucaoh/qzr3okCd9AQdE+pexVZFpoYxvTcgmNBCFSu+mvNF+
7/JezcD5iWPCtCotwcWZ9G5zX4NekVdSWveU6FWZrxy1bS33/4ZdujI59H2XqTF6xCJbl1iZ6CZr
c2/hihZwKsZSgcgGgWh3AoV4UXA2UduR8RumYDxde5D9XogPQbcfOIb05P2/2E0ptVmYB+4K+3xe
bmWFGnshNkYFP+CbP08aHbHR9peAH6OvNo36cMD6BDAiSBHEusyp9UCVb9Qspq6C2sqaMoIyDI0o
MLcv+u41VOeTktP9NXbZfR3X/nVoaAXC6LDEGCtz1/QIggecpJtp1f9M/uZxCZMZYLIexC9GMJMw
U5JGk6FvXAVhASOe3yp9O7HnZxo6+8KB1uK5iMw4Wx09FsqqbJj8+TARI13nwh+qQEwKvZR2+vnc
/sAMTFEp9RLwIEtD7b2HUWCN4XjpjSxTa4QxsN0WpHlx7ZvPlR2GtxoRd3jHNlgBNom4H6crcu8X
OAoim6O00PHKQ03GoDOpwr5Dnx7fWa/DiGgAZigtbJBYY/k1CeEiJpm9PQSrw7R25tCNpZZmlzNb
/u50OqOyOfYMmuqNTkt8m1b4Vlk6z7hSvAOPvmblhToYyQXBay4VAd+Lq6JPwPNGuDLxVz6Vwg3G
jegPFxwhkA4KGmFpWaRUBPvKzGVQ5pJ8EDn4g+jm0FzmcRNrtgN3jCLlMYS8/3Hd250O6CQgdNDu
AY8P/mEENsC1l+W1vwcKs+3DDZkL26O4TAIkpS42D5Bj34od+KzfKHlWcGwkwnyzkar67L7jiEXq
T4xDIZq9wKF6v8Iuvdu18Y+KSY57zjSd89xzxV6SYuOI+f0hRwIYkodvDiZXZwAJVqla54pSBYNK
ubb8IxwsD0WhD5UOibF5NhdRk57Oohzjk9mXofsXJQLFsPMgmGsDSsZSmt0kfgjxmzPym3sVj9CL
sijjE7RAtiDBD3HXbPkf8K3Lu7qF8RCAvRwRdO7rQleqRk2LfOlvt5RVVzmr0aha/XxcDVQJvocM
N/8WhA/MNhZNnqiA4Y6wWjBtSIZQ9RKZ5bktyD6mADWYghGz7luWZH18+n44N79yRE1fRpNeq1LC
bn1GiL5TAqVMo/iJBtg8VqJ0BWnO5CZUIiZI/P0NWfxu53gaSaE9SDXZpOYlJPrRTq2YGyDWzQBt
KM2P0U/9STOrQJkmwT5cEXYkodP1+BXDPSDYb1SfXpU4xx4k9+fs3kKqn9fTGHhl2qQcx7j+lmi0
CrDS1x5ndV08rfAILFoBI7BHQpsH989v1NUyiWGJQ1zawlyMVsJmXoUOQO5u5DVORmHPtU+RQL94
Q8IZc+V7X02Vu3QztBpBy/WYD3HbKpGjpvCTn7PHAOhkNPA4MjX2DOVXuKgyCaLv54yQh9W1Bzy4
6NVn7q/JAl9YBxxgPCUZnAOH0y73TF8sKyrzOTcpUEaK7MY4npBI9+gTbQAej+bCX7p1XO+BwaiQ
P1rbOmPswdz4eckaHNsZ2Ln7F34DC9rqNFdaUq4yAijLp8poJOH3ZZJE6g7A/YLroIvQtNzBsM71
BTebVCfR7VYqHAWkwGZzXELPi2lKlvA7PGJE3J4ts+aWZw9yFgelMZpSuRgyqyu+HWevaD5V29pn
0KgZ7iaUTgE9O/t0gBuSvLYyS55ZRCV2w//wuMaPD3yjFPp6f4vEpheVFB6NsNOLitNtoYyX8+x3
zXq7mOU8qGDHgxoFzsdJk1TZF2a0TuwT9+NzAw+HmTSP5NlOOK/h1wEILE+pw7GElbqqdusydK94
6CHNQh7D3X62KcetsRvkffVf8EmC9ajDYx5nl12ZjtT3kP9cxv9UbHoHQ91qbComfJXSxcJv30DK
u8JxDz2GS7Rca0dQy5rrz1lN437mSV+/vD0W/6rKT02XOiPM9MM4p8Gxs7fKFCq9Q/qgyAPkVOWo
kNhK5ZLRElK1R3igtF18WH2I8OwIUD1Efbozl7wG+t3bReEGXE6D6Jke8jYblIdT55qFbf2sQ9UB
WVw2lT39iaIFqhuW9ujApedt2hxwJMTBHa71kEjvokx19OtMXQaDSKfqBgTHBQxz2fSZXdcMRKQV
t9RkUN7nF13Kk0CW60G3iDTWY/OG0Rt18VkvdQy/htvLk5EkZbegboJ2KtsbhveAnReDOHZGkM9C
8i965sualJQtd+6jW9OHwqhzCHDLZPKyy8c/ZzQWkPjqRMqgguYcQlX2A7ePjof9BP0S/SOqgFQG
+iGDCgpR9Pk8AtHcfqQlW/b5A9B6kx4cxbVWAYkmfff7bjvWz1aJjrZpr0Dna6TlRBQLPvPejkaD
kIueG2LOksfAZh8t6sQDwddVF1KqIIxdJh/rg6EZRPCKd9rF3p00vgfy7vgbVv1rTY3osz3MW2rV
W1kW0ZLxucsaO3V+y9WYPkPZsXlP4IeKuAyjFUNrZdVXdTRbODOgoKXqT6Ql3GQ1hvzLE/ILjZLE
Ldz2LRElvFSXZqQopDbxSirJFuQIVygksY8/JODfGCxE6o5pZgGNpiEmD6o5XHimdMZa72T49GBw
2o8zFHQHhAWLpROXubVM0jB2OWqLNOIHX8kBkXIODW8N4/a2SwOZTqGw8q3LGpNYJqAfvDhPlLfy
igjnvNiXzDKeQWZi6gNckX2585TgwGWDxxZDJJTuZEeXN+8Xx8wNTXzzVyWgta/PN9vBpPFFMDMq
tVZBXLZd5Yr1DIC6mtKgs5nzRPx/+BVHJSd2lT3AirjqAMdCkt08lozy0l2z4A1uaCVeRNyQzFvN
EujMM0PSMT7oOkAr4KlUONmWMK+zLUvjoEZd5Y1Jv1L3MuAGcID4RbLYFrdpUKlYvCGi7gDjjZ0q
BZ44C/rxqedKo++f4Tfg2KPgpZvqxy/ud+/+XeCiknIs1RtqXzbodFqDxFO3gW0xCo2oQGqjEn1I
wc6gBUTcehe+YV4LQ9yXrBqXhNciytSoONBt+eOZzBytL1a5EwhZNM2eahH5ojyzgyLgkweVo+90
08qC6OdOoVOiHiAMFbsHN2P5bTXQyylQY0Ua5NiJM7Rzu1bx5f7S+KM6ohCvIdU7hMLr0xOOe/DK
m++h3pMDSzeG2DrahP6vqw9f3BSrayDlqx+79Kf2OS/xn++Z8fFrtbGieI76/fosdIWkUcaOu1zD
L1G3c6ESiI5W6nNduPvyoZpXdVirB0Pf38bki/lPOLr99Do56mLjBAdYeXZ5k+Obh6StxkUjElE8
g7OWdzEvCIbTZv53tjXlwkrh9I978xWZ0+g64e7RJM65QGiQMuU1v7OlV4wrMoWFYmrUF6pBLZ0l
Y9aiOQfAjl8tEESwR3u3Ha7ehIUgwkiy8CbsZPzJgdk9ah9mKfEbhpL+0ltVp3os3MQlthKyokKS
UXBT0CDZ6PLEgFOVjKZUJhvEFAD0s3HXq+H3s7rIR0CP86OUE6sI6Liv+RIFgizUrQpz+41uE9an
2U+u67a8RMAFi8fCP6lWZii6cOLoNX5iekzZkOspf8qJw+uYUqlhjHOBGvXl4rOajVbb/eH4gDU6
msY8hbMOH4bEtbwW1DnXGwV8H2X6wLW9yHf2OIU3VfTMVp12dvQM01Qwi+m7Nsw9ir9bP/iJ8F4X
6iRSIQEYi/Q7BeWjKuFDaYuU2tyh/tg/9J3692KRwychmuDyp3RShU6g7ldq1+3z0sPYXxtgm4Ng
PyIIXQNX4QhPwOt9Ex0c5BsU2xjs2q4rG1BZdk7ZoxAaaLitdeiQUxBJaY4C8xgXKkzNCHdefEo0
3cF6HBKa/h+s+wEaf/JihB4WRwNXHkCDFq8GCi95kOSytwVrKRXOmHG1M0x2sLO4VJaoad4JjkxS
Un6nTXv42JKmxxNU2uCp7zHBMrLGFJZkOklbEBX+H/oD4X9nDuP0TQNgw7UyX2yE09zlt/Mn37wx
pHnKYiar/pI9d8X4/6jr3ZYVResrWaQLEY4zBl3Jd6NASWFQOPxjpTP9j9/uOMmjnX0GePVqf6/U
n/h+AWGxtsNZM1anrJxrQuH6vYBXK3vhzX3cdNXmurQUTq2n0NKzkAW9dt0b9B51HQq1PIpjfP60
sF/0lEtAAtB5stzKVyhxyod4Mu17doV2fmpOEVtbzcM7ACCp0oJfxdBPdrAxxLkvyry0W3sxs6zd
rAsOQNyMV2yuXIbvIsHY7SdDOxaUi2qKeo0QWJuiZcCC4PSSOdZTlIe0W3UvSZQNBkPtdvneL+FL
deuSUcq6Mz9/O3QlUpWhpyBCBwaLPFp5LjBd07G+j6ItxKlotGrGUhCABsuFvNRUq3S1tR0VeGDr
/zt6DIPL/+2PwLtsQQzeX303MdXizgpaFY77mU/dhpiSrrVK6/GmKfQqYtt09jWHq1VHIAgL88VO
ZJLwhabCoId0NNJooS0GDEU4dlLrSRJR7+X6ReBBDKjchItvlKVr5lUixlSW5kBFGXnu++kWge6c
DE8bXMVWofJ88RajmjrJR23J760xRcFIChQFIIQyVJuKf/3n4KU7KxcMFPF0sX3xzGoT4LMH2CKN
BsfwpQ/ZcVXNyqGkUPg/YgMCSpuXnkWz3eXOc54vTdRaiJqXoYWj82h6OEbG2rzjpybHdkBnH3Ma
lgkTibDFNFI3Mp9lLu8YzEkPo9bKNUg7APqd49P2xwptLljg5W3h2LQqH8j0Vs6uhfeZ+1SZrQiB
0gEJ8/AEtH8SzgovkaVEqJktKEAOvnaWNgnbIUiq9R5tJzITBfuITdjl5hUEVbCSF5eNoDsDpK9i
zgQxItfFP7aFXAhs15tByaIryzLGPEP8RA+E84hIEuCGMX+HpNkFGYT/MJXiTouBDSy+ijA7Z4Ly
4TkbeSlKqEBYcLdtUq/vNT3xcYHUFAQr29DBW4kBSIFXl5tOkX5n5mhZcUzann07XSLJcu5sW9px
t54fTrfji9iM/CW45dLQDOobMzQHk651m4PS5KEdBT64GYiSO+Mfaqxdn9QxbkyN4zAxZFle7azf
V1SwTrtY73exKsuE0JDzgTNkh+fp0VChPLehwdQ092RbuDKUxq013u4WXpkoHK1Q0mf6WlO6xkQd
IzxSztt21lfZOCWCADxJ0uDI4sn+caXQSieDzGLU+i3LMEo/rapQgYfItIkdaGwIqp9m5V9PrNtO
aPjFKL7gLtrrjeNMSPbekIl3Fye6RLxHb3Kh3uC6yr7K/jcc46fkUT3vGqZENSJKtO9jq3sZs9Sm
fvMyH61MzrO6flx3+IVdn6EXjdlb82pQe5l6JiNUnerBUcg1gRD348CMiAEYyiDhH9wiOFyMlV+O
Ju2WpHS4kC2qceBAN4J00eoiCpXNx52okRWRSaEt3poVFV76otaN9ClBvokRADMyJY40VujM8/B2
Y5q3pmca4YIfHV3Qjtj+waRzzVEFzAsesc4kuJdTmKiOFv1jSvjQN+clBjm9DjcYf8rjLmTjXwXx
nTDABPXjQdx8GWNcHKnJw8IxjHJ57WZvt2HTX4PmtG1C6BLNIiVlv3KJpADFkDKUsjGia5X3zbRO
3Eo1zv3aJ5Rol5yNl8uE66hNUkHEgDUYDigsttvL8TaRhdH7AXHNGTQcpVoYu+9UUCBOtlzuY4Ry
g3qlOUq8cnZIis7SiCLl0ITBjR4Hm49oPvCyotYiGmnOIUgn1HbQ/l2w86vSCcGgVrLjw1rpbWKI
1Ju/n77z5ZJ7WDYTZllrPQ0MMGrmb/umgls5phX4MQTbG6Bn26dd/j6pbzjkcQ7iAfVHpJwj5C7q
Br/Qivpg9Lp5aEX2vVbvaRDKNwOQDLca22n2Ij2ROZcQKGY8qySNeL0efQ7q0nkQbF5+8Xt1dt0e
kOKo5dc9Bzpw0jzor41pzXz5QyIFVjezeGVnnoZYetArBqqptp60Nbfz267ptpQNQw1TL9vS0SWw
3FZ4xO1rRloNeVTgwuLbtMeOlQwKBGSM87WSOKsDTRXLPjr3yd+fVbkZ+m2O3EEnuDzBrHVsgphE
311nx+SjfY/JLBW9Fy+2GAPP7yDpRFlcvindve128C/K8n4n7RI/VK9j56mENpWuNicGudJ7urWy
Ip3TsKG3DoZtWxEWaM+L/+Xvab1xaS9MH5yXvPTey0Eu+gsbzhWKR1EI51dFONPPByJnyF9Hldrz
ghsgvdQ71EGcHskUJC0vkgurxvO0YAoE8+25NLvWzDdtqB4TlEzGCgdCDc78Wj4vhiTHi4P8jika
tBiaiMg5M1cmtc0cVQh3MDm3mak0ObGZJLZ1aOGX4d2lYm33k4nTuEHOpCXLSMinNYUyNHguMskL
N+8bzdSIO3sHeGkPdECfXfIWPHGdbMq0z/LlsQY8tRpxwuoDHQGc3l9XgIO0uU4TLdMd/C0/7pv9
KQNg8cMvXQmuBEyXrNAumR3qsokyPL+8I7Sf8hAPaf2Za1SWhluC6WpLgvM61vyV68++1GpTY9L5
iNC069o35DkWn72O6n3XlWupH6T5qQgwNQ7mGgo3LHwXDIJ+IY5VurgopjQrhK2EXv826PnkSN1N
/p5jHi5EsLP/z0d5WwLReOukO85R3zmshZVjtkObJXqvverm3J+AXB5jIF6Gh162hZGWzyn6YgGs
6DA6F0253I/JsNIFOL3dBkwGAvfb5m2ChSawxNngtg1Yy/fFBhoo6p1pKG6MDSECaimmRhg4PBfn
L897ju+lFXbKJC6pfUVoTLTQWh5lMZaaBFxH6plOKtp6tZ0B/JxIROwipUctSuc05mLI2J19H4Gn
tLfaGSTPozUr7lmwET5FA5OJnKx6tENo+ShVFBtRNJD4kb1XCzXMQqb1FBVAkajusY3+VwG4ITOB
69UJ9BiWoXA3vX4s7Zz36uZbWJt5GYba+vUXBy6R70N2pjnJ/PtpPCo/87Lo2y/T3TTEVat+AVLN
vc5GjeZs3fegu3ENH+bWRj32Kf4pShsPw9ln5mkADeEBVrXSa+Ab9HBv8DV92vucU4G14P4Rna/v
5G4uJ9b6ExQvbzkGavEMB8wjZfzY0trcMOK4xBfey/mrYin76xM9lPW7njogLdTzSzyDNFrpei1E
LlxupreCJnyD9jo1XMQvkIRwxMbvlI2pb2L2IoKpHNt5bTHelx9J1VILXuS5c/vdDsknoAcuzvyb
833BgN6vvXqGP0R8zB/h0SCfheA7DYIXeqVHnlk4hK5k9NzO7wSahihxs09ibAoWcEIVEJoQkzoS
GYH8o4HEPc8wdWJKTGeP9/6Wo/7Dd7Iat9PoNRYsX/fBiMccTdQaXfFlAJmWlxej9jtl3YCFCh8r
SsDmzw9Njsrgcya6WF7Ry3MfzpVq7Ngb3r2pnvaPXgEsOyrTJljzxHFw3PUneEXyftnQ2g/6mF8V
CPxn4r/gjUSqxDEibiqU2Sg+m/xIopWjQ0BjHqZZYtzebnlejyxx04ajAQthEhbNlhaDPA46lvK/
ji0r4vzk81i+ORjk7dmPz2UpnWDgUuE7N83OK+GnPuXQalo/xj7YJgodi7GjLwfU85AMniLWRnCT
LpK/529id2hv2AhXd4lWzsyOqFrUBwjLYIrIcmf4S1ivghG1Gac3Xjkv0D3cH8cVFT3enOP3uQTs
5pVKtnoQBgzRm81ORLqiT2uRfNBTgKDEcu7nhMXnt0krMgbnrm8NMJzf1fuIC9BB9d9pRLsgUH28
Ru3EYiwcgwzTeBls0lARcduwN8ML+asAfRtf76E83UOi4WIQYdaq4Ssm4nlODWWvcS/exXor0BWa
9Yo3JI/9Fmh5QMSzkA4rSsB6zJ6gercCB1Zbi1hkMv48WtblkAeqiHALdo9UCXqtQcsW9YeQYufo
IlWArYCBDBqVFO+WGQAOcDcX/ZtScgf/wIzWX1KCXf8KUxNH//yM4SefMs10J750mPTJXgNNNW6r
WuWbVeUoxFgNvAp2Zgx9QcH0700eFukNmEDIrcqO4LYRVVenQwujn+8fPZZGy9RN7bRaQ5pjlJob
+DXvqlWNR8DE96KFR//t/fJBci0y+5vEiICRVwr20/bLuymn4queZtM7kR1qPCCR3ZM8zl1xLjtE
LMQZCZAgijTUN0m9ADfnYYoBfjl2+niyKCx6ibPU8aLrnN5GKqxNxORcuYbd89s8Fa4d58D0hkMD
OfX4bO0P6B05ZvaNOg7L1CQiP3f0SH/WpUnRCluoSYAHANAmSY/rD4LnQq1Hb7RYYizZdfww8P5P
gzWMqikE3FA4snA2LAPNHWM0Wbjz+gpqdh7yFmg/jnx+6PNJxH1XVgRingcPHsq6DhcNZb0gGxpf
VVz8St1CcT/06cly+Zl1qFafZ8BvtP5zySo93euOK+pKzu5SeoZz0hj1MDzATnngeGKsvIu2A7K+
Dt6mrsDJg9jQUQEjasXVDnmbIJPj5wOwpIeEi4XNTE4a3qsdFrXhW/DWWBlztp6zptQVXhsaAnxI
yadsms6VKZYh1v9y9lNWrE7fpTh6F3MOYbwfCltZoAp2wFl6KSYtC1hFM8Ra2pH+Ek3/630WDlKN
t/KmcGi4VMtbBTcodAa9AdxEzTMetQFf1ViFr0gfqDaF3WkDZ8FztKKTnRP4WxVh0Np4sXAX0iJC
A800dlZusbkMYUVlwKbcPXtri9FrENTkw8mD+dLJhw0ZJS5dDeR0G+JRC1K73tE3UNKII/BHPOq8
vXubhIDA8WVy8C+vdaF5kYHbIAbtd9wEDVI1f3b6BoaYq5Vm9ocO7Z7cIUr0fjBn/T66rJ45hugF
BxBiObuANwgVCHVPkTKZzlV5cUbaevdBt8621edqh2ZgR5tzOixoBJDyitiPPwczcrlkLlfFUdYv
0IBHJoYWxphMtUeiyZCjlXgwdvWiWQJEFlm36R3S/TTwOpWnBHdWMUHHmORSG5+JavyKdwBm+NMU
h9F+S+CQlueIuHwzFXcq1T2xgspqs4WVXl83ZuWkaU9RDUBa9T5WxAbfLBsZzuEwBxTiHWdqa21Q
Unk1QSYbPBkAmK1F+CYakg0dl32asogS39MxQaXWlKKEOjHoS/nlx7jIoJwE8zPyvpgWm/EDji4X
bWC1P4prBkhQRpCAiTZIJVaVCeurSnc+2zokz3LO4RJl7CLKEq++TtZxGIG1T5jk5UHKoJsTmHRj
NrI7/G8OM2tlP8YWjk2BoUMa+y4b9XMhR9cLcZRWWn18Fr+jcvJEJgqQS56PbET5/gIfzrQjWhgi
dtrcAwB734Tzp+DKmGttZ+WGWeAdsAQCQdBCJYWUq/eGnAQ8lqGYKPaSNLG+hlinJS0S5MpKwJ3/
7TPHC2yXqxq8smY8xk2Sf9CCv8lHmwXvQjhp7rwi7d/f+zkOQX3FXWFsElvOiChCutXfUIK9sEjc
QjZgHxwq2q3GbogtxUXhZ1JJVSvPockHbbPIMyAmi3VypoUe1qxFNKq4ox5AML5ZlPk9ZfAbr9GR
/siNRWkq0YSO3PyW8VOwl2exN8jc09Dx9gLpGFpPX9WiFOMa8Jro8n0SdK+mdk8iZQ7HVgcFk4pX
13S7ZNhMPYoofMwAMWk39NxWaXz2B8WgtDADZGoP/KP9p+qa9VLapmBpWjKakK8t7RNPKs+PytTn
DB9D4VY5PNLHDjd192dvuer2Yrrgrn4v2Of8IXeiIlAhd6wBj/5afa/vswpTPv1wKAUupexYLdhR
yQrnsSJbR78tkdmFdH7DvJlCw6kftu+4BSnltr75JZRkoogJUYACrRYyvdFh5nJ8hbOW9AP0ChP1
WQ5YKAMSy6PWMtmTxxCKmVVxiMkc7kiK8JiR69LnAiXOJORPl5BEJ24KCJcVBxHQJ9N2S2LwC6W2
RXP+J6v9c5kQKmZU3QvoUHYCdC8gwUVh1xqi0v3FOszLVnMBwi5UEgB19pHEK/P8iiXp6QwbYr5F
EO6fr2NLQPlS1EFCl4Kw1Il9B9qLFy7ng5vgIdHro1IVRI0jS9Wlkm+F2u1IobNhVAUayawTtxCO
KLENwo4Pf2P3w1/Oc05v7dq6PIdu2/wqbcsTPxvkpAt3wfZbnhKpZ9hEw0a0DO7zqU4wOInYYsZg
Mys4VnG2pfPu9gL0k3kYQ1AcDxRNWwafLHN2rF/KR/1dyTYMq29yoWp17hbTWv3iEaMRnE3nPWU6
F7ZxqGv22WjwHne6Btr8PHKDNKbPuwaCP06s2bMIP0zV4r/ooyapEP9gd2kWS2Yb2C65OhTDHNap
J6nsXM7CCGPJ0QCLIAuc9C+7TZhIKjOe4PF/sJWywNkyYmEo4LwqbZdIjn1eoqNmT8cw4h2xD3Hs
gjnLyrbkypfqIHlN4uLZ7NYR676auBG5N37yKn81sAJMsl/BvypaG1ZaYbpdnd9rOYxgJjoKBPfl
bT+mixB4bMJaiai4RVCJYlpAISxt5HeFdSPyt/cqvVsjhbu4fkARxGIwtlagrWJ4szUuWkQxIWKC
MfmrIVPg9W0N9L1Qi6yXdw/td4JO5YvueT1XhN92OqQWVSAgSQgP3eY0KrC1/KJ9GDAg38EOE9Wu
hLJZG/kZW2A3HX2oHv0pKTfYY2v/sbd+k+YYzSXBqpLf4uegKdrr3i0jeD0pLnmP0JnxQujQjXJq
SAMkpVE7IYrO2GyUTG6OHaPE4IB0L7lubqS/51rRX4poE7C4fLzBw5oxHbMe7FjPaGUMlIwiAcFd
Ib+NCuztqMSedb4FiDcXXQ5o1fUckqLpmUvNDSSBnxkgn90FqAk0UwQFgJqfRIl01aabwyzodvX9
bufBlEuj8kbm4Fe8m1sTZpT4Zfv8oN30Rls3yNKCb50uDpuNfhZt+7ZC7Fq71snIV//hOu9k/o/X
dckVwnCKTbSB+NXMbS4M5g7bQHttrRQvGMFshX50PP+GNq9yaHX9jdKTONsoIxskVnCKvqZnuCxY
H6wi8OdA/WPEjFX9Thg8q+sJujNm6XRVxxIX6e5uC5Q8zQ8SSV8nwhgB7NEkDyB+Cd+A52il2vbU
NxowQSGtF6a1WSovmZZxvxsw+5Y0aXW0nP1NfYu7MaFJdJ7zqAWXHSei7SaGJ6F5SQvMGyv2jRiz
60EkoM0WG+pqjFlsZy6wCHzqH4naEOh4RIBeMngdJAa94RrvEcdNU56Myj18S87I1JXmugG/WHEt
MmwpWBBXVih/laWD2/RFv2kkFPvALxRNn9A8SXGT79OXqAjfSgjy25+u1btrFIfpD+c6SEMq1udn
rvahZnGQMd9+TaSWVPeUmDN1eAJSmGNX9RLTNJMp0KPM1lJq2kGLMmwlWJVLIKSjlVfEX9YY/JUU
87EA5wmMBOR95OPGdeks/AAVvlp2XSOI2r0AWg5n36p5UaDpjd4QTtu6t0QT/O0kiVo9oem7FfHz
9NmGf65HC+rXXG63c5lEKAIFemkvH5jslg3hZFeqsfwXhw0jbxDMxPIiLzVXXtahkrnEFehf9tgI
3TNh0GOzeuDuo9RSr0zBulnkjE12sD4aWWmXvKWfQVI722piiX66aiMhS+76FBroojb5UmKTl6SR
tYb5++SFXKvxpE+rOseNpY12NFjaycnnTiq/B4i/2MnrAjwFZ6Lj1xaohOnFnVf7fkICiNqUCDKW
GT5Sw9FPyOOG4+h50N/F23HL4nzferOOWDAmYPZhHL8jlvPCouaYVASA0aiWy8TcUtr/X5zhZA44
tYLZZ2vTeX6ueHOe9V3xd2bLvJCH7Yy9v/rb8Yv+KG5NV5Mt3IMLgQ8YX021fkNOeQHIMyWdVsq/
Q8K2dbOTUGv+TvyaQyp14C1GZhHgYggpGmQk3l8b32nk9nzp1cHe3FFpD4+VU99Dci4UeVzBhBmu
p7WTo5v+XEtiuaSDlqq7Ol497L1CSfs407AVLlnbrBecz+GxAygSE/BntGqIq0/aM64ofLZ3wP97
d0iGt5A4KxFTcpy4rm8qT1vu6y3pot3IoSzZASRn3tCwjB12CEs352Prh38Pi+Vb4guPNfa90lK+
81RsRQyYzDp7axLGfMJSrsAJEb2jTPc6+EcTMMiqNFywpeQ5qNpTPv1c+V0+yAHAvk0AIS/XESZS
CTvcZurGQaTV8f7529xINtX9ldowQbgelVho4DwYt+Pzko+o8D3KDl1LD7sV1jN3JWD6lxSUfb+V
yr+DLO6I7z8xtQVsWiWisWsfA5pWPDLVhlRVvkgDe4I+234G4E8oVbIJK5EwT2AaA3p4gLjmmDlE
fmzjl2/AKptrbSy02t8FMw/lebvwcjXhBfQ5O5KneARLhiHd/Z9ZxmgiN+b/xXU0xKCxjM7YZX2U
SHOKrXRQ/YhtSKPuZKGI1RMe3IpAcNNPt7ral4Yn4ZVAgl6kdGZgcnnypR5ZfNXT5FRXK6wWZoxB
SgFam64oV2TcQvCTmBdeiBBRJGBp7YaZBRn47QIJq1MPmfmRsO+gD9QNE0oKrTLzpxugPqOa9kRh
QjsSb31XTGmKP4pX5UMAI5fL6J4NYnVKz7xyjOumHfe664G1hgWjDM/OHb4oAdEeSNy86U686mkh
vCYyurKPKSmezab23JM6XmKQ3Uer1QfRk6DmHDMRfNHHglNnkoVkFHC06l2pzKEZDIofrpcgRdok
ksHX+0qAQ7oTyslFjZG0TWIyU71TG6YmEBkXor4ggoOfCsNJzpy8qkR5iaf+k0chEKVMb7cMiYr5
K7tUhB+6G8OTxvvdtyzW1kKejxx88pSCfzICoBHdhZepy/q7VE0gbGTdO+jRf1l0uJUqjJ1wj0nx
U3MxxPazx4arYfkq45gfXUD1JTEGuSm1Pk4wnqTZ8wO/b8E1ptmbV7tDJ9EkAf8j05BXAaSxrh6J
3iWbZfp2HnR7Akmjo/+kMYhOK9ksd2bL3/oQKv7C7+HxyLGtuEoxLTtmpczV1HP5N93PnSiEnBmZ
UM9bW07UTLjjynvkGpXEZhj4fmF5fnkuXLwtstiYpufXYWTM3Z9YyQ0GjcT3Q+bFAB2D2p/nEnUx
LSpZTp0oxCEs83ZuXFyJSEBt0ELC1z1u4lQKBT6OX+xNVARALLZcmNOfGtQ/l7OW00XDgZOoqN6q
nmJG0Y2mOiHajVmd3AmAEOHl/CesXZtdmQS84Dhb80YXOmC0Ii+tyKzJpV1M0Wmhm9r7hG+dYrtq
B/geulxJgQKRij5zNohEaqgErnUHtAL05ZdpjJkiRBgQdh+iUMw8D2GMKTRm2USAlOjZnr4cyHhn
Nu9A78+JdZBJ8pfH2mC/+znqG2n4Br73qZ7XMSYPTAdESZEb3m00vql9qX0v+Bbv9QuTxQJKP3iR
tnonZEsUPwueDhxzdmsbT54+2V3wzJlkbKWHEd6IuBO+y7GiSdQ25WXk4K2GvVsbz6uEYO03LhTd
sJUefkUmoybOmyVbHK1/Tk4YxWtSG8G9ymrN/52Ac15pH5gnWCjGTr+6dYYNeDyO5EBcauoZni0G
c0w8Wt7pw/ozWH1MEpsJRWkvMaNZCbq+Sd5rX8bzHIg5ffYVsivFx/hC+DApLQXcnlA5+BvEYmlU
caueCJpEKb9pXEDz89frNsNlHiLBJN4wW10KKRadr5ep2xkR1oAlIR+3dlooBzFfFglHWteFD5QG
edX8gGU6DhPfJSHMtHpeDTSAuxOeBoSN5EcxF1W5UzESFluGbNfc4IyoRONbz+OHySLNh1igoR4W
TcVWj4oRbFnjWVmoqKtuWSx3SFSwjiBdFk8tzn46ZjUOfp9r3HuRpBqvbTsudxmL6M46LG622ED8
9MWtNv6seKpsHqh1AaLyh8VwXFDuq0RoGvt/vda/h7+WXtE94N3mBwnrnjvbSbjnqytJzegfcJCq
s3IdrrSlK3Gerd4HuDLPfapGHPl0Y1rdKen7tm1nE3eVB9/AlqiSu7otubv6LQdvsqlKo+Iaa/Og
eRX86IsgyLMadcOgDE4mpSBTgOPAvNnljKyCBkESIwG1jCPVKKokrMEsNob8+A3Xtag8XLufXaJ8
KSESA6PwqpzA69nvW5y9jOTNUQabfIfUjQP+N1YJfoBWeVYvBR696FekFxWoU/dwl1sJvmQMT1w+
DfcAoEBuqLWCUrbmdC9WJPUxEhangvZAelf4Rad7N+lHI9/foJRRx3WdHtxW5d3SRUFeM+XQY0aO
d70sC+i5Q0PKgXom/MUC/dScVRS+J129U+eZFUqA3alu1wsGyrrzsR+txDHUtiRVgSJ+YdDp+94J
QmqhnNfZP/ZnycWb95dlREg3CClMK4wpECeIoXCLSSpAp0gIBOTIuXX9S4sizr4MSB5oHMnplyPd
CcZFg2m7ahZwJkYQoMPi20ttGAz2g9GI6EgnNfzPd8ji3KyApboi8w6sAg2tdbqjXYO3VKdLhMc2
CC7u0D4GwpvRtchLqdlaP+xXf9RsMep+InxhFWcYSRvCmx7Z0RtUa+RKaWtKCFV0k57fpT7nFJbg
3fNk6Da//OMsP9TncCj7uLaGTyuK39fAI1FbJlBhZ8fweBCjqOAKSfR82Ye2K8QZTeIoYDLM1m7Q
KX2OBi/UcAQHn8Eh0t6quFq34XthAIGVNfbtsrpv57+vbdUnaqbz906+wRNd+J3QGzK53skeUdBK
MhzJ7QHkXAKgWvlaZ8B+9HD//+kDhglerxpYnVY/7zFPqIA8HXzgVveatQrzlaCanotr1xSB5zUM
pgl968SflFtejqHdA+0xraZZpZYHKdzumsJLEJZ+ulOAUBT9PvX2SFh+mBLawiKb+riRugk4z70d
9qAvm3/zYGY+9yq82/y3TunVq1mcTibvIuHgFA86a8g71sru+6246SNfI0wxE38gHTum/zt/2VXx
I3AFfi5GeWUZ9L4sgzD/yxQXVdQenRxvOCSIEkRuyObg6xfF3PGbdVsLOvV04yEk967dkdC59MBJ
ddhzuSnxtnn4tZlkSbWBWdQPd2qjIq61Fy2ueveFrhbZ1E7fFMI+KmbEMY++YIbeyi7mZewvevtr
elmym6f3hPLTtv3bHTxO6B3wAMwgbOgwp05NWCAeC4cGVs3m5i2FmkZNPTKz74H2xStuF0vW7pYH
biz/PM3MWeZ28vRp3poq+pFxzPfSHAa8bracRXnz0GZbRu5ZmK9SXuzlYZRT/gb68aW1MjGss31T
ta67tyEdW/uSy6aw7RyVgNIQqbI5D55DZesz7qrarXTduM9g31vzAqUUhX03LrinYXCLH9QQP4QZ
PW+j2k9NYD3/gOv9NfB0OqKcqvAbhoNX/F8lHQhiuS8UXS0CIyasWTZukPmYs1CGBaze4BIbw7SB
PjQC0r2zOOx8T03K1AmqdaX462fW7oCc+UIeGaECqxWdwvRdvmsU54J+POVqcsLLB6BnoABNariT
atC6fBpIKNpXjkGQ2DZU3ntCRdK6RJ1l/nVhFEvkguNbAVaheUKqCEbccdUQ/VL3yzTYkKORfMAI
weVLO/erpAeZhqqZvket2MqfwoiUqWm2VjYbtN9rq/aFvOz04oiJAmxRW+OdmHJ45BCQQuTz2omW
i9yHpXbYB132fn4R0EBQG6dWDnCL0mXWChT62iOXmKSMJvaIGTgF3GWscoxNXDUwbfGZxHz32F36
WWD37H2Z5Yz4MK7NP0NOfJvmDp2+sXNk5koyBaCOJ3ywo/TuxS+PoMkUZJ5Ac52/rtuKbbP16ZyM
+9RsvzQemoljpw6rLwSxI0XHtIkWHVx3pq/NiVKbT3zfyM+fYdMXySy5wG70vPewJE2Iqs13knSn
ctAtKdtlSsCFL7QuFRt6pxvtdHc8FatuFZhWV0uv7a28gSjIMoIwKRQMMlkUtukvFoJgEAn0egb+
iJBNaP0bwEFcln28pwM8CEMtTGyaYpSLlekINENF0wv9U1tr5/oPNuA3JnwifAWtnYqquGpczrV4
XJwJjnTUqr8GxbL12qUVxj6t1Qyonq/Q3p6HwTTAnJgRyWQdha1dUhM761+ZaxD6ectEvqtYfFiZ
IVnLmOYMGmyUrMXUOg573kdDOFGF9cCc1mdSVUop8D5X6MG7HRriAGWzo/MO+HteOeD3eNxA4pMB
F0UxnAJLtzctQfU6jEyTebiWCxsM4totw9IkuIPVbBr6iqz9LK0Olz2VCYroHuhFFAqq++6DBPQR
2h/3jIa7v24fkg0SzX7370MJtUee1I9AeInM7qBMcDTolsRTuiJlwxQf46DX7yEITSLhh+MROBR5
Itn1NH9w+pklVdzIkVy7Q5/97WLi5o2Nwt75VkGkTN1KpqjmLYOA9ocgcubhP9PVXok29ZsqZNYX
k4QrT7llc8Rxh5ARHFo0L7aZawYhtPf+NVGFb/AN/UigKPPUQDYRsoIlfss1LZiTDFmKAVk9jndN
xoZCvLWX24eHbAyJjJIkrZBkO/x52zgkoUn+mPTjCQ3gzyLodX6/cjK9ZrmmjUaIImW6IBD7iopV
TR5HylwSRiz0UotsMjD4d9BqLngMC2Bcji6jAM6w+2kAF2DP2X0q8+7UA40xReaDqwdlMPEDBp5u
xoR2tkvm64f4I39LzJswg0fAKJZM+GzFV2nHd8QsFYEsby0IGcLBOZrRypN4MrTWfQOuhDE7agZn
2czwvL+6cO2WzyoX9F41Wthk0PYPosc+2Apz08yqbgOKqQpDw2ZImcZPwAlCoqcNFwFfcwvaP2ac
kCDB8PXo0VSfMDBECLAWBiMUApftPjDeU0m2A0c+obP5jG8QWafz6d8FY3Y/oUVKQiKWU8PTbKI0
bKf4BlkTbBXPMSJa3+qTNQriSrgp+fgqut58TO1p94WzKlKSk6eio4Llx1HF2dvE2fODTqFFVtIO
DWmMKiz5iyGM+LtCKUAdTJ0Gh9VGW2aRa79I0yRb2plsJrmgbkh02oxZPWlbkgUnBZc8AfYHofJ1
Gc9vOISK7aOYCQIzvuQAMp1qo/zAMSd6DbLkAgT/ABu6uSuckvCBkdzILaajo0E153B/y/L5Feeq
51pLpI03ZxDhefnoLTQbj/rqfv1CsZ8tJdf5xk6Tlzjq5WgVSEmoFsbdQUKxs1yzxJtVJdbUboYI
5N1Hkh9fAWE1LJzQrH4Ueh701ZAb/+RnvFe9u6niA5nM4BxlRoghaQ9Q4ltTDYVoUqNqJVDql8Z0
FUf9UHrzFS7w5TGq7oHJ7xzILHIm7gXjLLETHxegjK9ygoPwJ16S7OYoeHzgmE6SHeFz6zb/GmeK
WRRXPIwkz0lGDk3qLNB+1aNctjLZvionHAldvIIEvo9nEE2v4M/GOMVIrnONRL7/NQivGc9WyccD
jR9j9kfeZUCWsjg4TR8DD//XJAwfE5CL8AJjkTk1cTMuanek2fkzSJbBedkz5X43AZ3r4JNYuClP
4X2AEexmCqiIiMLihMAWseRn+diGg/hfzoQlinLXq++7OsOoVFCivj6rIl6bvGgrtPjMhoU68hx+
KM+Fw+E6DI5iVEmhLEZJ8rImTEiDPPwEjOQ8HdnQj3iIqNN7oDQ1Aa7w9GgIpHbx4dLrTRAUbFyV
qQ5QpzT18hgPmIqPguAFurfOx09oLjl6DQir4+dKkFN1Hx9+uTpRS7+/dHEQ85kZ5CRuyvrLHfOC
FiUKSoKQ6i+S0JDloOjbNpsagoFNja9eHtCu29LL8OB/INf9YZ4+1SIr7jk7MjWmrUr3/rIPGIpT
R3G3O+fU2ncpsofcBatLzj/NBY3OP19PX85mi8cuFkEjZCB5oh5Ber3UY42QW1cO0IGGkfU1Gku/
EPXajCaRHk3okuo/SVFNNsEF6To14FeXZIcA4E9K7SyP6h5SNYmfy7ukCTKqpilMdUIkWZc1kmCA
GqMuh9k6ifFNGRNMXEYp7247wPXKScXY3kjOHwdyKJTIgKw10PYHya2A4YtiZAbPoHT+v5wwehH1
PmPhqr9qjcSUxr8tQDj4m3VCgKBqBjuS1sAy2Kqr7hqNW2yG227eOHYhqaoB+kvsahBynQCG0zeH
UxSlc+STxMN+nO88Pu6387sEa9rNhv49l4za1Vcj2uGZG23lyDN/jAgEEgHP/+4g73cTCU/hyZZU
Vp0B8LmFSO3UQBiGHSJ0ExizZNLqv5VhPUY3bLtXH1co2pbRwtFMGoAfdnoDocsadBYgUBEFjxhW
Zuk6XMiLLjRhsePtdt41sTTUyuyBnYfcI5MybCeaWRHKmFBD3anPhFGv4jwmdlz8NADSUUCont5r
lG1c5CXsp5NSA2UztXr40epJp8hPz9cOBfEmCkZWqnvUtI7T2blmjpeSA6v3EBXPOmbOznrxK2fD
JGttq8r1O/0rXNkU9kVm04/S4vl/0myN9aUi8+qPK64oc6zAw7WdUESkfINRnooLYdIWK5FPL+vD
my8IICV090Utq5hK5zLYq8AJVdfc7Y0vtPzN3LtD2MccY0OgC2+9lXrKFYX8SwNLiVYH/v1JGAfM
OhkUPfh/Dk5VOZ1RiqHQNpYd/xbp1fdpGLgXk/WV573VgKjoxoI8wVTTVrZI76QNNU+PaPf8LPvF
iiYgbkfUan713vs2eHEulprFMwx4vt43uNOp4kXW3UetzbmqBPBi7S0mDEcXYA9JCFzAzWzuJzib
DrLN+TE+R9A9G1IoGdTDZxoT106KSdmbY4t5KJyksSLGxx1I83al4tQ7qCaPwVzmQl9h/D2YBop9
zQrrW3dWfF5jf1eiEVgPG+4ph6rXC2W2O6uu0yN0zsVMxy6OgELODx0pr0NbuJBq/thHC345tP5o
F1tLlr6Rk7n32+f5shswAN2mo8BZFRNYdN2sEBfGQulbY4C6Sm1LITLpXl1CKVgjmQKoMQS+o7na
LseRl37v9bLXJ8/jmLv7/NzZ9yuioTVO1yOiktaVmbdynr2l/ucOTlOIh+b/Yngc9xn41rysqWIO
4fRFQEj+w6av45m6EOE3LvKkB+twApGYnCG6yTYEAzTSuDQh0qxybAiJBpLxyq4jjbkDPJU3XcMW
5FoPqyKLhO+nhQ08WgvvXi9oxvZS96Dgfb5zVWVtezwG5IIXYGtD9VIJYj9IhF0pIoHZISVtz6xI
9cQ8mo1xPs8X2GGz3X6ycXEBBLeO66GU9lgJXfeE8eWhnuAUtHn63o/Uu3yi9WebuVYxYL0/BM6k
4Rjlswr5vmhdTdJ/t/gyfncJPH+qaatJ7oms24hHdRSl0Ag/O2lzuhgV8VWXlWNMpVQK7xLcwDX8
lT2ijJiw7eNe2S7VHQzSJjLWkDtW81b5G64SGDNY8D9DcSPkU2HbWSqPIWA0SfEYvXQOfdk87EhZ
Fvn9U8lkluEjVgR3Tf4OtctefQt+kEEwmItfTIoJcq95wY1sLeED4MaeRPrhxJ+xBqRfa1NbJKEo
vaWXrd6y3aFYVLgbQiwx4eKUIA2ljia1JwN8fvRUme3S/buLcZVSzJ+mCIr95DIB7ZqI3xRWPcsT
kRGimRiz+LhSfK7Nnwm9KWkhYvUj8LkHBmer7fclYyr4nY4ubUITdPH1N3X4Et5UXFGsvwA48L+q
jeyyQr8ZfotMsZ1VNkBWqIQmWAR19b7lKYI4cOqM7FTxLWOV35YsHh9eKDrp67O1hItIX5BMFVir
DGHWibYD7k4rbBJ8RNpHKqBl3uoAn0gCod13WeIB8U3JZWIPcyu5pbBr7ZFuSrAXNiXO0X1jPQ5q
vljZhNBeyTMEmOZAzH/TI7YMUygYnQfkFUVye/iFyqj22Qn0onMoG57wArLp3jA24R2PRwBWrGqI
5wQiZ5ZkDizOEwPRl/uwTIeaZ+7Onhsdt4fc1E6P0UW0gWWlApBwZNzEZkJCKb1fgj9RgAOjEMXB
Pgcu357Qr9RyCknP1031I7L8zpFZYEf88ZQ0yBM7gtUD2FewVek8skO6dg3hc3Lwg2TGWJTd2xso
g89NDY3DSX4LmJYGSeNGFvM813aKD1mTfmiWNGT293JZQ9wwOASQRCHKk4CxROfUYmC2AfWO75LJ
NiISMkyHbWi+WweYG9JISm2WjonW5BIbK9dSpXALPezPJBgkaVOLo5kknExPCYRaUJ4LmWm7RrRA
xEJj6lBqR0AqgSz+IKR1ywHufIcmOu9ZuWK1i+B6oTGNDKXhEI9NKVz1jy8ZIa4EYNiEGc5IhZj5
v3tdI3G1wICXrxINToGrRHTI4hTZty/3RjD4YwulOtkraHuU2e/kxBS/ta8h8b2UBmZRZ2uoV0YU
NIWvE1miMuIy/GOGYtI/vbSgc27pp/53j8pmPe/asieZqugPbt4ey8KsZMp87V1Wqn8ZmYKU6oTS
ATOIYiCjisHNtHB122tG5Ksk+/7OprIiSf3ix+y+e2a+UNOktbSnB6kc35soon1dkLsN5sj0v1mY
eE6cxyYM2ZlZ2cu07EkKxWm/mGh2oBsj+fcoocZ03ay9O+YS2F+lblBguxKpD8YX2oln5UXu3uyR
GrqpL5ClkB+xTvstF+BBwq2fS6oAOlqWKWiKUW5EdK/SmKEjAxWNH5wpWkjSDQIpcHVqjFRRwTOa
BHiQ2u99r77ofk5u6HLs6q6XfclC84EM7AVGv5ZU48wydH24Mowr6JjRo3UgG092yx8wos/Iy+ld
uk9OOVVKmWswMOqdxeueGDA0Bt3e0B4pvFDXeAyWorFWE4xTzUjmBKcktL5SPtV8+nzc/JR3+dCx
3oSpGbrJT8jwp/+HqVQ5ciJJiWNQN08szP4wcpDL3qiat+0Pkarvyi3wZL9izUshtyavMJrHny7j
7c0Zbxh2FkM6fsOZeUh2SVEaXlichttQqzJokAmRW7pbwGNNcxHFr3QFcCpvwZJCCFriJfM+CdQ/
Cbla2K6xzatzntMGsigH0Nmvpuj43L8MQJu+srrCTykf4PzFrozpFM8mQY9dJTAPXRhkJh/9Rd4V
HzFjht7SCcr8Hod6vIz0T9+9mLKYOpLTfuzK+fvM6/egJvVKGVyYPB3qtwN8dDRna2rCMPDydDxy
qzOJSBlr6uAFdO5bcW3sRNLAZLUX0iCiUJ/ZnI5UADuAmQbjNpjmvV95Oqu7WWMf0kQg+zA0+J6t
F8JBoH4WxB1D3zbERV00Rx9bpuqvNaPPrk1BaATQOeiYpEeYcHmLV8PbYjXBI6lDQ6ITqFcCs5TE
5KVuW6Ikpu0n0hJB3TniGvTYEYiMRlFiIsFkx9JQrDV/i5LGfciVzdVMMOWlE/gA3ZlVx88EWRXa
Us71WHcPhYMZC1fYzv+YHh7yPMZAOk3sR1XffwfV1XNeAhOftFE2b4di8eBoKdc5qlND0lTiCUi1
D7Ngn/ciANFfIIHOeQSBYnpnBxAidlzKY3Bq0fb5u1lY9LlsEqcZkGtx/rOaEg9MdzhNKbfCCful
lS2zZYNalU0xsY8lwUIN3yVPL3FazVnPdsQHDaLoozdfrg2CHP39nnb2y50wp+n6S0Wyig85BQsx
s7ufzrKvs9VvJrwCohN0RSH3Xh+D3p66o7ggnoqjDYvhyny/pblDUOaZ0BNi1CuWNixliyPK6yjX
GOjAxafZZY7BZRuG3ij8Vl3/VAxapLXfQrPuMyczpqA2hIOs9AJHOWyf7HWjRqGAe2YflnKlPoQq
3Btg1oUOB0wpTDtbDp7eRYwwrhKsGfaeQqvb191ehIPZlmtEJtodSSdYvGvUPAeZeMil/PzNd6+1
vjcNUSrabuwlni177D/vy3s4Myf0wl8oevJ2yTAY87UNtZmxIC/IcufzvWLlyM6QEMWX90KC+XV6
KrvCzYKPI9Ywpnku1wcgHW02IpQJT7tXgzbFzT/dGqRrH/m3XHymfCf5sanCr9QXgopCyYM6x2HU
xlalguzHDNegTa5cqRWimyRX8buEQknxQzXyKY0a0TBT23RiO1u/f9RnMUUgJazd1NOkwG2+b9X6
8uilF+aac1WdlHed9mOCQBYCaNx4dV2l+sN20Aistqh9iMxV2Iv1qeowTkYblrPeqcCLwtyCePCr
GkrP1K5sYpReKvoCRjMCPcjGjCnPgdTPDOBsiN1FhY6KrmG5azkIInAdMqmbu5TCeWRBPeerNc7r
AT62JAlK2nbUgu8YTViieLNhpMY0NUKMdD953pC+5meMwapbpVVSJ/ySpgzgeK+L42ZWyOwuCexc
2GGH3dMg213r54ftdYPmWHQ5KfCPjrckQMT+FWXOHpLxSClSuP3TJj6+jBwWw/bD8pnyGBlXf6C9
hxGQWIai+6ulUC3hlRdJMbOTNXH5/CYmghAr2ENTG5mi9MQSrAeRj4J3LojXEDReE0ehLAjWeocc
Ob78CLbf/KPRetWFb8kD5NckkTAZJa/uTYF0Pm4U8wi5fMkGQLs0kFjJzvWfnS03gMsNPSjN35Uw
XdNeChnAyRe341mu5FYUVYgnfLv7yLb0U+d3rUTGFCu5db3zZIPfdU2hA+wa6T7l+ge+g+wxd0jK
Wmz7lw6s85bXKfp8yIp/abl/k6rrTr9h99V2xAqmXqnvcRXurMYYcxlCFjXPZKmrQbSMflQwPVhV
Cut1QDkhb6IbBm2EWog0X6FxswHJN6sbYUWjXMBDh5lWS9VwRA7RU6ulXnMDdWm/YiUiO5NE5sNO
d2k/0ioCNV39pj6DU1bDDds6Mfzt0s3alvlE1VTZvpEVFREVfGVEMh3lv+RGLFHd8d0LnW1yqnmw
Z8l5i6C1pEdSj4KlAK23UC5ZQzy/UZi8zznxHlOLHI/noBD+SNDfTg3HCEpSGfE5Q9Fw3PPQfBK7
ONWrL1npDqasz3rEtC9FAbT+iYYg0SDnTAdOKg2kBADpqy6qhhJPGplw+UjR3KnuXAg6xdDpcQ5V
BroZ1PmkWKXTLydXZoNGqZ+MbQXfB8c9Uq7ATDWRl38diKPyKeU37uSe6InMDOx47GeZM56UBDB3
r7+jppQFUaRiZe/qizElEpFTqqDlcdDQ0gFjozmwwziu2dv9x95Q97LYVy3ITbwViR9YQvwk7HX+
ioBRCFoyqv2/QRyf4i0n7RmjG3b9Vh1umCIAHYYLdsBTopQ3DS4t7RXgsZBeKImSCGYYY56Zy4ma
uW/9zmNLBMxuesI0aOEm1dvaLudzeIxZRoCdKJGw4vHywM0gXZnOCjuz0nOtYD7LleSTF+5ZzIaf
riHdjKk0H1TE9kPjSEL4Eg6E24NAMW3ZDJdqBpBRmRimMgOttY283fkshgXOUV6o8CYbc4QbPIjG
vH/q/Rt30OCuBbeLNwMIbtcOtT8Tt1n8bIDk2X5YVGpGU1r5a4FlmgAdky5WDvhsqrwfTaYVC+z+
AMLwhDZDAUmKBBp1eaD148HNaNkIPOvxxE3TEp2qAVwbLxortkmcVh3P3l3nQqB8Xaep/NHY4yOF
psMCFRMZHykcLpENbBcw3LKKtXJFNITtTSFmg2DSu8oIFSSUwBL2xnmC9+60KDCqKFI6TrdHQ8NQ
eVmBQN0og7uZZojwPQ6rgO3CIde2y4/sXKLnKLHZkI4jgLDcBUFV2XPmuUOy25e+nI3DFcmtItt9
Qo7bYtuY4u0U5MC7sXh5AQ+SKL4binSHy+C+sCk2TfAdN8hsX0oRbwz5X5NffHA8qWaQpC4dsj6Z
GIEo4T+jb4eecn+ZUIDn68X9umpx5LiEIJ7MA8h+oz7swDKUDBaYLh+e+fo61jdxr9S3iLbnW21g
MHarMhQdTjWFFXNDk/h0UAEECnYc/9TnK3RQcsYMElTioVz0EfFXB8roazIMdDcH9UBP0MEalHJd
JUPSDUS6IDRMBC4cQnnSXIQg+11bIKIy71U1nPjIEHHWlaxcgqDWXXBq/hEDLNzbmvEYIjYRXH6H
BnafWEF1e/eyRLm3hKpkgjgLedjwSuNc/hqPokjefALWYodZT8gWmjRRgzDgbruP0KqGopu+8qr9
sp6+LfvK4QX/9Ry7eOD2vU5Dmm+Mn68Qk6vsH9S2GdudOqvBeqhBmeehzY89HcazCXYSXbsFoyUg
ihbFu8bcULGL3A2nWlWsRPHBbUT9RWVMxR7GuFccGEL3IC3J0ICeEjMnj5zj5xsQCa1GEdISZTC2
67FtWoSSyGPSh/I/s4QtROsfw7VmnutL/UGXzwa9WG6RP1RIsaUdnVOj8masMdlTJJcvBHvIkSGV
6rsnwqpXxg4xQOX8YJUcn0j8C95dwbmznbqA99Rue4eRZMW8hM6eJj2KGuEMVmu1DYRxHYFQmNS+
BH0sobNWQCKPXN/H8+rwokPErjwWL9Qesma9Vm69DCbz4X8cW2OpwekN4z3bA+FEVv6vmDpf6vVq
RrPRz5NoVirLe1Bu0ovnOXQVnUZCe/jGcgPi72LK9q+WNc3m1Vdm0JzoLJ9EgmZa6LUm6XA7v6L6
fs/KjgiErLIEftjSj/hrQXz577I3/WVxyLuz2kiEl45QMpqwETMDPiUcCZ7poNi2CcvLxbhQIZ75
c6PS6AxEEfB2B2VV48z3vINlzJ3LDYW8n8EJRlvx4Xeq+pCjN0QNZg/Y0/iWo/ppXzgEzYSP8hLw
xmG2vnd1V5Kz7wqhKz1vvnb3Oyac2IBuHi/MnpAkK7Jo4MWYE+jds/003vxSoSL0/t5Y2Zb1b9Bm
B2t9JKFmIXpQzpb6fWeSCNGfJpsJjgZDs+8at7GzBitvYtj00Zi6V3pCNffC3zHi7tiRPn51z10M
09HXDEEFOiJ1FtLedOZTOcCaWacFHj34xs6T+itrGD7xgP9NNFQYSg3gwQcbXij3LMgtt44WHbDa
O/S3ws1X8Y8WeTIG7NnstAaFUVEEba4i8rLMR6aeAtkt1srrMmhUQFsyS+2kOg8wzmr2o5G3TNoq
51YbOYvMs9u5YFbyZyZR5kLw3hcxc/b3NmIA35MxIoFXfhAcmPa/JbDPsLUPGyHR9IEcwQtJLoTB
PgQ+0ykEK1FE1tVnD8bG6b1NJFulThQffCYuHww+eVOJun3Q8N3cYq/RxDqaqE61g/QJx6Y1TGHu
IUE23NFKR6vHX7KNXZ+12CgBcg8vhPyakSxBpexvX4vRvp+v6tlhed8vZUs4dSxfSo+nyKbcsD+3
K6Bog/4KLyFX16fObclGV4eX6D/dbEgpzyeVjBcBFEufI4SwLywdGrBAI9kFwft3iwFGOwBknB/5
OnRY7vWrZqexlk1bhwVMn9DFEMhMcLq346UGQM/13E45vjpS1HjHd8GqwN61MzTCN1Am/fx2Ph5u
q/UAm5WGGCyfSU7PoEJDXjBkPh0/eAByj+YVX12FFl2eILcWBWYgEGWVZEDN2IRno7oSVjsdF0Ef
7nPxmnS1Z2wz+IGCpn3ckzhmNbbmOEBviNBhMd8lz7/87Nz2R+3w+usg1dwHcbGD+hvZl5JAsW7k
c/QXfhyqqJff4dGix7dRSCFSXBDfylcOFynG2FTjf7wC7qvMl5LQrAsKMRxoBfhmE9Pm/Z8Q+SsS
oJAqeUDLAl9Ikw4GgZRwlzbzG4+2747YRrxhNDi+syyuUznB7vDgYcXGrTOqlbGw76CykFO9arx3
jclnIRYajCWehlVjnLQlTUWVJT9NNpl8V5MfwtzwwSyX/+HTH5C2JtbIbzvlotbYTfK18YWU4kzy
EEmAdCxwrtcnpcyAJnyq6GNN8oPjUg0GVQg/5Hr+noo6+XIzi6gIB5UmHtjOdkVhxKKE0jQ4eK7T
xEQcc6tcqgoHrgxL9HCkBvD56gnO66lM2IVcQhARInKwIN1ePpSCZmp500M3Bn/8l94YzmivvfUO
VDGumcAJdR/lbf2jyoZAmS/c7/+25jUXos3CeQ4cq7XvKehfeOXi/dUzzH1H6Vt0gqDhePwyUDp3
p5X+NN1aYev56PAd3SStjGWdWbWTA/RYvlYyohElv4bptSnQP2wyeyl6do0FPxym4V5cKYWwsJT3
JdKuti50lwhWfnniLAoYMXW3ntpVd4Vba4DMywPgL2uuwQi1Im8I0hsk32uhI3p9I2XN1T09pUUf
6r8/mj0mC87DBC7CKzlq8/79VTCNFa0zMm9yU9xksGHSkvr9v3/sAPLoqK5fR6JR3SOEY0PXFryF
3bjqMEXDFpXFHxzntbokz46/tXY+MX12Jpga4lCI/BzTWN+2Syxm2TaDEcLhLLg04YsdOcSrQd+j
dlgJl0h+UEBTKeKMYs364rpvBwFLQV00ZoxIGrtouzFxQXXdbvxB1lFZq7YpXFP2SL6rqZPcHrS8
hEaz1JbWOAWkMdW6XT2AAPGqnTj7q/glVSzAQvAB2FkQWO233YMAtSWt8w7bhce0Ac2R67q7WPwH
bgSLTDZNVe1DqsCqQr2QT6YTLrSjGIjwU7CcsZ8l+62TN6uJCtFGI59fxkGQTr0UvZOn6Pe6QwnI
+p9vTuZReNpUoVadtVTHzb9AJmAt6kUMzsgEukrWa7wJY6Bc117jgigJNx4OG1EK/sr9WphoYW4X
fq4srMr+6FI4ASQoswElnJyLTKgN2Kml4aGTZC44vNd3XXGBsoVGYIqdMP1kZLYJ/pQJCRigDtBr
ZE/GQ/eqYitfU7flbNqBqLrkFWhEmGCdpowQfBM2TaFVEX08hSoaDI7/ftJapv5aNoJNLiQUGLOc
K6jUfvs5Fjx52p9U02a0jmVfZG3I5b1GbkpP4g5/9hiFpSEMczj9wrJ6B0MYmD7lUGhBuBC9bCO3
0ptOlHJzBCBQ4X1II7N/v17XFomIwS1JaGttWTzODDGYAeENx2EvNj5WDGIx7q0oFnv1dkZGuPg+
iZ1zC31OV0zUmpvgkT67ig88LPdyUDob6cfd0YAxOcBe/SO1VSRPBibu0sVBUxenOmwf0J1T81iQ
dFd5ZNGTXBKIvVThd1YjC+fyQsWv69aSBH9p1HYoFScDo1MK/nxsArC/01OiR5xSxLUgzIEx6bt9
0Fzdn/T2w+e1Wg4w6uBskIGZPoMiGpdbpIxE+fXTTBOVjKxcbhaExbTh/2eUMOONEK0opClUhQs7
sZM+xUpTYEOdE+IuKB0boT0AyZQYqFmdzxHWWp3QeEkC4zEX2Ry0qZvalvRlwPwPUTvX+vafZrFx
L12s7daMuza4PuO9t5+LzYReycuqnkGR37wSNBgjbHSUTUVbw6pGi2tXClRZjxl6jF+dmyXNnLCx
14dSPAz/p8MmkDsDnQ084UEMttS0W3tTGbjLl3Z5Qpw7aj6x7E1REKfMBaoO3ZLDaVpXUDrdX3Ft
E7neAaYN+MyKgwEEw+AJFRQ9QL48ylqsoSoeztdDfC1WBXcx+y/GYoCG8aZCVTksplFormFvMs0V
FQHXiKuNfA94bt08KA6C//lv74TGkomjDSiPwmarHk3q7OPBgVd2EF8pIx10wQni4yI9Aq73Ib4+
Aqj7Ef9FBviO3IieS4Q+qsk00bq+NBTADcl/YG8Sxh1FnU4MMdJujCo+0FJ+GdgvpXA8ah+20xB8
/zwvo24BWlvyEzPagQujra80931383fgaBfAHWCjJKSwVkbdbkiX7pfoqYvkiolqkcHIjwwOfLvz
80b8FAi7ZS52oxT0t59HZFBl9WFph3Mn5vqD9E9OxNV31juqM2sIuMZ87mzipBy/5jL6Iqi3fYQn
1yuVjqXlIiw3FO3x1JFC97vI1tiGGG/UuKi32i6gdEFCrNH6WBD8uwVtzM8fYi8Ee1f+BYRFTaGp
4jNkRK9eMWkJNZOo6RJTknpltgLdqP6NUmTYhMpwj6bTayf1GDbgr8y0xaYYDoVNlt3xs+mkpE80
yOEklWAsWLAw3t9aLCZQAjIN669ouwT+PNyDXuLk1/dQz4FyD6dla1PDMOx3OLoCtiZdYtemkYt3
XIL49KVxVBRH2rkUhu+ZIFgw+/Ob7Hm1TwJgCCSITl3+LKNzMCDkL186Np93H3DFwe9UI2cH4IGa
l0U3QV6FuniuMiZX/BJqQQKxUCbnaEPqvl2vZq+uIXbDvTaYaNa9EboI/WgnXG3PgTd9XHWKjMf1
vgoxMoFssEFuaxigm6Epk2YoGg7gUqN/bWyr122pkmEpMaZkMurC+Sfd8Sr51ONZF8FCnzsQigVK
poTxlydo90yKFEgLXD9K0Sxv998NVgaiYXXwGGR0whaOa8Utw1J0X5CeDZXW0cxgkwFJ47Pdi3aP
RW03Ll10BFg7+JAOvCkL7J8nEXBRp5OAM+l9nEJxG1XSOgBoA9sfFCOUkmjJ9EvtKAB9GM3xsKEp
ZKdkV+NeKAPf4WnoPzkVYUs7NMoHoCwrqxkeNm9vXA0PHLoUIFnP6ZQeXlnIUwQBpcPpSy8WALO1
TT8vRH8NdFI9kEO7rHsjf3UWZ28hKcxSAOtXjo1tLBS0qFR/W3v/UUCD+qygypGenJbgp2MPEaX2
vvxCITMGkPSz72gX5etYg397xFF5n+IJlECOHBaarVpsWqPuktrhvkJ82rqXiGKBgLAZhE8XQL95
Rge37ne09g5nWOir8mVDjEPc6xema8YGd/Y5jItNsXwESa9vAYkjXkIC9Xx2Krgr0VRSee8R4SDu
fz+7JSK31g9ALXYXfyb0r20yFr5MWqKH0JmqSo5DEVuN48Ir86o04szWybguGZOZbzp8rZjADGbE
GPWx4Qzx5Tzlj3uWCz73GaE+CADNvputiIlru/0DcblcvgB5s59+ihrVroTRy8+mrFnaryC/qARd
X2M/mjwJ04QkO2oRGe/c1JhhCBKd6o4Pnpx+yHZC8/mB058g9LvF1enZ6IMC2cE09AcV+SmJLn5A
woIeAKpxmkgy3zF5GW15zNfL/dhg0ZkO87sR6VrlRgpgpNdNOXccRDO2+WvY0QjnJglGj7VflJPt
RbNVY8dzlJgqZwhjlpK4oa7+GisQLA4ovwaywdJKb/KOM5LaxQrSpHd3GDE2L8Y0nKWHNYp1QT04
IETcPHlvDDT75nZzz0YhBL5hsZS0i1PNstPQLzb7w46oU7pofqPLWc45/dGM4L3ipTSPZpBGlb96
T63ZVgokzCzSq6cD/kElGJiJRcxARiLcYyNQtKEvlV+4DPsezoAP9wyo2O+rp7lkDiGfrT95A/Hg
lqXnk+V7gvBCL28FXS8dlg1JImrpOZf6f78xHkYNDHMMbRKh2C3HC/eyxOpWd0YtGGFvQLqIwtyE
vb5oKBnrnsH70bifzOC/cbb30NeXKamc/CkK9MbWUqFRKKKCo44igJuYf18gkzuHUd3KXx1RKir+
1WYo/jVQZqcZaqpqJnGpO38U94nXb/mCFrxdAsSU/6syslBrOdhuAEhJCHLR6s86iPUys9W7RTko
8Eawwew4PjURe4zyNac3uH9oBwRGDvguYtrRskSzOsyDt4YeKu97A6fLgsPuoMz9XCZkC6M8mLJh
2WSxz/7IqkiFR1Lwbm9+M/ndbszwbBIl00RgD6e99qqK3EkTawBBOF9eTUku3ahagmQ3asHk69jc
Wopt+ZuJMCNZM4Los6IvGC11L8k932K5x10GwV9CND1vBp/dNT2z7KlmqzhcpwctGn+/95/Qw13k
Bhlb+QI3ugJ2MxVfN+dKH8sUeyRxDc/9u/plZMcpckHjmDNrxkiYH0H4uvcS5S9T8qLC1D+l04oM
mVxVge5AODcZrvQ0bQeLAa0Ok8N9NJiPZX1O0HHeK9m6lEyZoc2IXxXvojC6w6g5kYq9EC634lmC
ioT7sd5RND7xI+nyarZc6lekTR9xjUGrzMkygVDtNwk4ll/yuvk9hnGUYXIzNEQoTPH3ZR1OOtac
DJ4hzGcffwDdLk2UpPxaPpQjyTtHKEqwwj59+jPO8+brPeLnEU3+W1Mnmfm57LlcC5/b7+zX9rtd
S3+gxdcvjyO8uucLcuOA2LMRZkidkeZbvmSkEzGBC+2P6u+v3OflLqAZdmlE3SfYT4lcw1jvBrIN
3iri4dD0IMk5SmknYb5h10YTTupA05u6Et3aDUBGXvmV6uWWFFqaMp+USTtzvOTY3Uh7Ngj8EPQQ
iYML+y6s4tmaGDDhSaJZZ26/A0xsgT5fT3Lj4Q9zYP0taQvhEUy0bseJ116CjD/r7gzGFJPWvdos
/Iqjza970P6BjnZEvm3uKyzub3Hnl4ebpKCxwpw2WBpvdfsgzwnSW4cEfwS2mzvuRFcpjMr8iVJc
GY7irg+vAPrhN0bXZthN2duRpaITKlB6N95pp2rMEmBE9jBizxnn0PmOH3ZXSx9q025bjVWLLOnc
TM5R3ja4XlJujTROaAOpRjYW1vEl7qyZ6f5l8yV3kkAf7mlkOPmO+yXPtOZE30bO8T/hFMQR5K/V
L0x3K6RfWSlSq1Et2RfKGyeahJ3B/UY+PKZOaDVbC2JROCInlhYqXp9u7kC6rA4U+DsGNwssujNk
Hn3aCY5N/cemfKiHuw7ikVae/wUqBKuSD1JinL5n54MNSh1z5V7qLdg00ePWPYfi5Zfkd+6/5vYz
3kr1jad2PcZtyLqGS8a1ZV79aQ1V3ymnVW8VbXHrXHNt2uJx0WXF1RI077LiFuCWJPkMTxWK/Zoz
o1ioR5/Z3rFzZzrjmkYRVXnK1ybJgLJwEDSZD/MR4EKeOW6EGXu/3hu0OilQDPLlY+fDx8eRYOOj
CoSYMAY/2U5144+OkSp9Jx1IKx+SKF8rskA1qMATGM310msnWsjNtdnqawAx64sSirludYp20v5s
JFxWS56ZxvYkFW7+MMOsGtk8RVvWqzSAK8FKhYt4krTnBG49tS4gg5sRinIDyhxnPjeHCF0+SpCm
C/gCVCdRhzUIGIo2ODnsHh6Sc9V+6/Wi93xO4VGgo2sGUa9LltAP7jREqMlBmcBk/ZocTyg2vt1a
Tnw1g1dAZx5lju7Twcb8Qb4vaYLlS+eqcolwbtrxaevgdUjYzODVe2B0RT4cewib7ONIxCHxbp5a
lR3WhZzQ4pRl+AH/271GWtebi4rVSbgD+ry9vqec3naWnN2sD50znXZy4avYKUNEti6n1O0wGXoL
DXy5oYVMkawRomEacZSAqlJ0CqvRzuyqZDb9TxG74aYJwwLu8G2cOhGdEc5Og9lDGBLHU6Qh8Wzn
tXac7Z8gIWn33R8rNPFoKih0rSWFm5MBDewa5860GabnBaTvVn1oTuTEi9Uo27bQgw/us52J5yfR
PI7y8dePOnW5PIqlPMYa79fD5LlNIJI7UBLPhwjHqYGWjqL3TxEDwOYmm53rbaBmWWzPj42jay5E
NzyjcAl/UhM+fSBtZaos+M21+nEEMNtTcjmixMDh8w+UTEtDYUyyVs/XhnYn3dS0fktgKScpz7s5
YzAgVNyDua4GOYhwyohekaDRX+KAE5Zao1vIjjeaAA5myzx2wZWYiYfsSv6q3ZTAX0vjILCABed2
TCSPqM08hqbewXTxulxZtNUT1HtrK9fKDEr5frvpV5W7t/V1mHpJcnkHpTy512xBvQLGOMOMoZSc
ePNQYSl9PvhiCK8+UmMg9hoPsmctuw2pmGg7PTsKKvngcjKiex+llP5mHzwFJT8c+MC9yDtW2Xei
rYC1SAORxCcI2oMBJOKR74NtWs/3gr6p7oY+opETxMsW5/ln+6qpRe/3uKDbhWq/PEzdKeHwVOLR
APvQNA1fWzRBfpct7wYxdg==
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
