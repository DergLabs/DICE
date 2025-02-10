// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
// Date        : Fri Jan 31 11:19:50 2025
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
  wire [3:0]NLW_U0_data_count_UNCONNECTED;
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
  wire [3:0]NLW_U0_wr_data_count_UNCONNECTED;

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
  (* C_DATA_COUNT_WIDTH = "4" *) 
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
  (* C_PROG_FULL_THRESH_ASSERT_VAL = "15" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_AXIS = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_RACH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_RDCH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WACH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WDCH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WRCH = "1023" *) 
  (* C_PROG_FULL_THRESH_NEGATE_VAL = "14" *) 
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
  (* C_USE_EMBEDDED_REG = "0" *) 
  (* C_USE_FIFO16_FLAGS = "0" *) 
  (* C_USE_FWFT_DATA_COUNT = "0" *) 
  (* C_USE_PIPELINE_REG = "0" *) 
  (* C_VALID_LOW = "0" *) 
  (* C_WACH_TYPE = "0" *) 
  (* C_WDCH_TYPE = "0" *) 
  (* C_WRCH_TYPE = "0" *) 
  (* C_WR_ACK_LOW = "0" *) 
  (* C_WR_DATA_COUNT_WIDTH = "4" *) 
  (* C_WR_DEPTH = "16" *) 
  (* C_WR_DEPTH_AXIS = "1024" *) 
  (* C_WR_DEPTH_RACH = "16" *) 
  (* C_WR_DEPTH_RDCH = "1024" *) 
  (* C_WR_DEPTH_WACH = "16" *) 
  (* C_WR_DEPTH_WDCH = "1024" *) 
  (* C_WR_DEPTH_WRCH = "16" *) 
  (* C_WR_FREQ = "1" *) 
  (* C_WR_PNTR_WIDTH = "4" *) 
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
        .data_count(NLW_U0_data_count_UNCONNECTED[3:0]),
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
        .prog_full_thresh({1'b0,1'b0,1'b0,1'b0}),
        .prog_full_thresh_assert({1'b0,1'b0,1'b0,1'b0}),
        .prog_full_thresh_negate({1'b0,1'b0,1'b0,1'b0}),
        .rd_clk(rd_clk),
        .rd_data_count(NLW_U0_rd_data_count_UNCONNECTED[3:0]),
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
        .wr_data_count(NLW_U0_wr_data_count_UNCONNECTED[3:0]),
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
(* WIDTH = "4" *) (* XPM_MODULE = "TRUE" *) (* is_du_within_envelope = "true" *) 
(* keep_hierarchy = "true" *) (* xpm_cdc = "GRAY" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_cdc_gray
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
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[0]_i_1 
       (.I0(src_in_bin[1]),
        .I1(src_in_bin[0]),
        .O(gray_enc[0]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
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

(* DEST_SYNC_FF = "2" *) (* INIT_SYNC_FF = "0" *) (* ORIG_REF_NAME = "xpm_cdc_gray" *) 
(* REG_OUTPUT = "1" *) (* SIM_ASSERT_CHK = "0" *) (* SIM_LOSSLESS_GRAY_CHK = "0" *) 
(* VERSION = "0" *) (* WIDTH = "4" *) (* XPM_MODULE = "TRUE" *) 
(* is_du_within_envelope = "true" *) (* keep_hierarchy = "true" *) (* xpm_cdc = "GRAY" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_cdc_gray__2
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 81360)
`pragma protect data_block
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
NQaJh9XcoI/NnbJKjzFllzdXbhyh
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
