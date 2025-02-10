// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
// Date        : Thu Jan 30 20:21:26 2025
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
   (srst,
    wr_clk,
    rd_clk,
    din,
    wr_en,
    rd_en,
    dout,
    full,
    empty,
    wr_rst_busy,
    rd_rst_busy);
  input srst;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 write_clk CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME write_clk, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, INSERT_VIP 0" *) input wr_clk;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 read_clk CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME read_clk, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, INSERT_VIP 0" *) input rd_clk;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE WR_DATA" *) input [15:0]din;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE WR_EN" *) input wr_en;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ RD_EN" *) input rd_en;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ RD_DATA" *) output [15:0]dout;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE FULL" *) output full;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ EMPTY" *) output empty;
  output wr_rst_busy;
  output rd_rst_busy;

  wire [15:0]din;
  wire [15:0]dout;
  wire empty;
  wire full;
  wire rd_clk;
  wire rd_en;
  wire rd_rst_busy;
  wire srst;
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
  wire NLW_U0_valid_UNCONNECTED;
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
  wire [8:0]NLW_U0_data_count_UNCONNECTED;
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
  wire [8:0]NLW_U0_rd_data_count_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_buser_UNCONNECTED;
  wire [63:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_ruser_UNCONNECTED;
  wire [8:0]NLW_U0_wr_data_count_UNCONNECTED;

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
  (* C_DATA_COUNT_WIDTH = "9" *) 
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
  (* C_HAS_RST = "0" *) 
  (* C_HAS_SLAVE_CE = "0" *) 
  (* C_HAS_SRST = "1" *) 
  (* C_HAS_UNDERFLOW = "0" *) 
  (* C_HAS_VALID = "0" *) 
  (* C_HAS_WR_ACK = "0" *) 
  (* C_HAS_WR_DATA_COUNT = "0" *) 
  (* C_HAS_WR_RST = "0" *) 
  (* C_IMPLEMENTATION_TYPE = "6" *) 
  (* C_IMPLEMENTATION_TYPE_AXIS = "1" *) 
  (* C_IMPLEMENTATION_TYPE_RACH = "1" *) 
  (* C_IMPLEMENTATION_TYPE_RDCH = "1" *) 
  (* C_IMPLEMENTATION_TYPE_WACH = "1" *) 
  (* C_IMPLEMENTATION_TYPE_WDCH = "1" *) 
  (* C_IMPLEMENTATION_TYPE_WRCH = "1" *) 
  (* C_INIT_WR_PNTR_VAL = "0" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_MEMORY_TYPE = "4" *) 
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
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL = "6" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_AXIS = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_RACH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_RDCH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_WACH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_WDCH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_WRCH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_NEGATE_VAL = "7" *) 
  (* C_PROG_EMPTY_TYPE = "0" *) 
  (* C_PROG_EMPTY_TYPE_AXIS = "0" *) 
  (* C_PROG_EMPTY_TYPE_RACH = "0" *) 
  (* C_PROG_EMPTY_TYPE_RDCH = "0" *) 
  (* C_PROG_EMPTY_TYPE_WACH = "0" *) 
  (* C_PROG_EMPTY_TYPE_WDCH = "0" *) 
  (* C_PROG_EMPTY_TYPE_WRCH = "0" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL = "511" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_AXIS = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_RACH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_RDCH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WACH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WDCH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WRCH = "1023" *) 
  (* C_PROG_FULL_THRESH_NEGATE_VAL = "510" *) 
  (* C_PROG_FULL_TYPE = "0" *) 
  (* C_PROG_FULL_TYPE_AXIS = "0" *) 
  (* C_PROG_FULL_TYPE_RACH = "0" *) 
  (* C_PROG_FULL_TYPE_RDCH = "0" *) 
  (* C_PROG_FULL_TYPE_WACH = "0" *) 
  (* C_PROG_FULL_TYPE_WDCH = "0" *) 
  (* C_PROG_FULL_TYPE_WRCH = "0" *) 
  (* C_RACH_TYPE = "0" *) 
  (* C_RDCH_TYPE = "0" *) 
  (* C_RD_DATA_COUNT_WIDTH = "9" *) 
  (* C_RD_DEPTH = "512" *) 
  (* C_RD_FREQ = "100" *) 
  (* C_RD_PNTR_WIDTH = "9" *) 
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
  (* C_WR_DATA_COUNT_WIDTH = "9" *) 
  (* C_WR_DEPTH = "512" *) 
  (* C_WR_DEPTH_AXIS = "1024" *) 
  (* C_WR_DEPTH_RACH = "16" *) 
  (* C_WR_DEPTH_RDCH = "1024" *) 
  (* C_WR_DEPTH_WACH = "16" *) 
  (* C_WR_DEPTH_WDCH = "1024" *) 
  (* C_WR_DEPTH_WRCH = "16" *) 
  (* C_WR_FREQ = "100" *) 
  (* C_WR_PNTR_WIDTH = "9" *) 
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
        .data_count(NLW_U0_data_count_UNCONNECTED[8:0]),
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
        .prog_empty_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_empty_thresh_assert({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_empty_thresh_negate({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_full(NLW_U0_prog_full_UNCONNECTED),
        .prog_full_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_full_thresh_assert({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_full_thresh_negate({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .rd_clk(rd_clk),
        .rd_data_count(NLW_U0_rd_data_count_UNCONNECTED[8:0]),
        .rd_en(rd_en),
        .rd_rst(1'b0),
        .rd_rst_busy(rd_rst_busy),
        .rst(1'b0),
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
        .srst(srst),
        .underflow(NLW_U0_underflow_UNCONNECTED),
        .valid(NLW_U0_valid_UNCONNECTED),
        .wr_ack(NLW_U0_wr_ack_UNCONNECTED),
        .wr_clk(wr_clk),
        .wr_data_count(NLW_U0_wr_data_count_UNCONNECTED[8:0]),
        .wr_en(wr_en),
        .wr_rst(1'b0),
        .wr_rst_busy(wr_rst_busy));
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 52624)
`pragma protect data_block
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
+28ifuVupkgWLvGxYA==
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
