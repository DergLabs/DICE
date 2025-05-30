// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
// Date        : Mon Feb 10 16:27:40 2025
// Host        : DESKTOP-U9NB2CD running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top input_data_fifo -prefix
//               input_data_fifo_ input_data_fifo_sim_netlist.v
// Design      : input_data_fifo
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xcku3p-ffva676-2-i
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "input_data_fifo,fifo_generator_v13_2_9,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "fifo_generator_v13_2_9,Vivado 2023.2" *) 
(* NotValidForBitStream *)
module input_data_fifo
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
  wire [10:0]NLW_U0_data_count_UNCONNECTED;
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
  wire [9:0]NLW_U0_rd_data_count_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_buser_UNCONNECTED;
  wire [63:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_ruser_UNCONNECTED;
  wire [10:0]NLW_U0_wr_data_count_UNCONNECTED;

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
  (* C_DATA_COUNT_WIDTH = "11" *) 
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
  (* C_PRELOAD_LATENCY = "0" *) 
  (* C_PRELOAD_REGS = "1" *) 
  (* C_PRIM_FIFO_TYPE = "2kx18" *) 
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
  (* C_PROG_FULL_THRESH_ASSERT_VAL = "2047" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_AXIS = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_RACH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_RDCH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WACH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WDCH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WRCH = "1023" *) 
  (* C_PROG_FULL_THRESH_NEGATE_VAL = "2046" *) 
  (* C_PROG_FULL_TYPE = "0" *) 
  (* C_PROG_FULL_TYPE_AXIS = "0" *) 
  (* C_PROG_FULL_TYPE_RACH = "0" *) 
  (* C_PROG_FULL_TYPE_RDCH = "0" *) 
  (* C_PROG_FULL_TYPE_WACH = "0" *) 
  (* C_PROG_FULL_TYPE_WDCH = "0" *) 
  (* C_PROG_FULL_TYPE_WRCH = "0" *) 
  (* C_RACH_TYPE = "0" *) 
  (* C_RDCH_TYPE = "0" *) 
  (* C_RD_DATA_COUNT_WIDTH = "10" *) 
  (* C_RD_DEPTH = "1024" *) 
  (* C_RD_FREQ = "1" *) 
  (* C_RD_PNTR_WIDTH = "10" *) 
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
  (* C_WR_DATA_COUNT_WIDTH = "11" *) 
  (* C_WR_DEPTH = "2048" *) 
  (* C_WR_DEPTH_AXIS = "1024" *) 
  (* C_WR_DEPTH_RACH = "16" *) 
  (* C_WR_DEPTH_RDCH = "1024" *) 
  (* C_WR_DEPTH_WACH = "16" *) 
  (* C_WR_DEPTH_WDCH = "1024" *) 
  (* C_WR_DEPTH_WRCH = "16" *) 
  (* C_WR_FREQ = "1" *) 
  (* C_WR_PNTR_WIDTH = "11" *) 
  (* C_WR_PNTR_WIDTH_AXIS = "10" *) 
  (* C_WR_PNTR_WIDTH_RACH = "4" *) 
  (* C_WR_PNTR_WIDTH_RDCH = "10" *) 
  (* C_WR_PNTR_WIDTH_WACH = "4" *) 
  (* C_WR_PNTR_WIDTH_WDCH = "10" *) 
  (* C_WR_PNTR_WIDTH_WRCH = "4" *) 
  (* C_WR_RESPONSE_LATENCY = "1" *) 
  (* is_du_within_envelope = "true" *) 
  input_data_fifo_fifo_generator_v13_2_9 U0
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
        .data_count(NLW_U0_data_count_UNCONNECTED[10:0]),
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
        .prog_empty_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_empty_thresh_assert({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_empty_thresh_negate({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_full(NLW_U0_prog_full_UNCONNECTED),
        .prog_full_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_full_thresh_assert({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_full_thresh_negate({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .rd_clk(rd_clk),
        .rd_data_count(NLW_U0_rd_data_count_UNCONNECTED[9:0]),
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
        .wr_data_count(NLW_U0_wr_data_count_UNCONNECTED[10:0]),
        .wr_en(wr_en),
        .wr_rst(1'b0),
        .wr_rst_busy(wr_rst_busy));
endmodule

(* DEST_SYNC_FF = "2" *) (* INIT_SYNC_FF = "0" *) (* REG_OUTPUT = "1" *) 
(* SIM_ASSERT_CHK = "0" *) (* SIM_LOSSLESS_GRAY_CHK = "0" *) (* VERSION = "0" *) 
(* WIDTH = "11" *) (* XPM_MODULE = "TRUE" *) (* is_du_within_envelope = "true" *) 
(* keep_hierarchy = "true" *) (* xpm_cdc = "GRAY" *) 
module input_data_fifo_xpm_cdc_gray
   (src_clk,
    src_in_bin,
    dest_clk,
    dest_out_bin);
  input src_clk;
  input [10:0]src_in_bin;
  input dest_clk;
  output [10:0]dest_out_bin;

  wire [10:0]async_path;
  wire [9:0]binval;
  wire dest_clk;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "GRAY" *) wire [10:0]\dest_graysync_ff[0] ;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "GRAY" *) wire [10:0]\dest_graysync_ff[1] ;
  wire [10:0]dest_out_bin;
  wire [9:0]gray_enc;
  wire src_clk;
  wire [10:0]src_in_bin;

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
  FDRE \dest_graysync_ff_reg[0][10] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[10]),
        .Q(\dest_graysync_ff[0] [10]),
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
  FDRE \dest_graysync_ff_reg[0][6] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[6]),
        .Q(\dest_graysync_ff[0] [6]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][7] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[7]),
        .Q(\dest_graysync_ff[0] [7]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][8] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[8]),
        .Q(\dest_graysync_ff[0] [8]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][9] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[9]),
        .Q(\dest_graysync_ff[0] [9]),
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
  FDRE \dest_graysync_ff_reg[1][10] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [10]),
        .Q(\dest_graysync_ff[1] [10]),
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
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][6] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [6]),
        .Q(\dest_graysync_ff[1] [6]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][7] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [7]),
        .Q(\dest_graysync_ff[1] [7]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][8] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [8]),
        .Q(\dest_graysync_ff[1] [8]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][9] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [9]),
        .Q(\dest_graysync_ff[1] [9]),
        .R(1'b0));
  LUT6 #(
    .INIT(64'h6996966996696996)) 
    \dest_out_bin_ff[0]_i_1 
       (.I0(\dest_graysync_ff[1] [0]),
        .I1(\dest_graysync_ff[1] [2]),
        .I2(\dest_graysync_ff[1] [4]),
        .I3(binval[5]),
        .I4(\dest_graysync_ff[1] [3]),
        .I5(\dest_graysync_ff[1] [1]),
        .O(binval[0]));
  LUT5 #(
    .INIT(32'h96696996)) 
    \dest_out_bin_ff[1]_i_1 
       (.I0(\dest_graysync_ff[1] [1]),
        .I1(\dest_graysync_ff[1] [3]),
        .I2(binval[5]),
        .I3(\dest_graysync_ff[1] [4]),
        .I4(\dest_graysync_ff[1] [2]),
        .O(binval[1]));
  LUT4 #(
    .INIT(16'h6996)) 
    \dest_out_bin_ff[2]_i_1 
       (.I0(\dest_graysync_ff[1] [2]),
        .I1(\dest_graysync_ff[1] [4]),
        .I2(binval[5]),
        .I3(\dest_graysync_ff[1] [3]),
        .O(binval[2]));
  LUT3 #(
    .INIT(8'h96)) 
    \dest_out_bin_ff[3]_i_1 
       (.I0(\dest_graysync_ff[1] [3]),
        .I1(binval[5]),
        .I2(\dest_graysync_ff[1] [4]),
        .O(binval[3]));
  LUT2 #(
    .INIT(4'h6)) 
    \dest_out_bin_ff[4]_i_1 
       (.I0(\dest_graysync_ff[1] [4]),
        .I1(binval[5]),
        .O(binval[4]));
  LUT6 #(
    .INIT(64'h6996966996696996)) 
    \dest_out_bin_ff[5]_i_1 
       (.I0(\dest_graysync_ff[1] [5]),
        .I1(\dest_graysync_ff[1] [7]),
        .I2(\dest_graysync_ff[1] [9]),
        .I3(\dest_graysync_ff[1] [10]),
        .I4(\dest_graysync_ff[1] [8]),
        .I5(\dest_graysync_ff[1] [6]),
        .O(binval[5]));
  LUT5 #(
    .INIT(32'h96696996)) 
    \dest_out_bin_ff[6]_i_1 
       (.I0(\dest_graysync_ff[1] [6]),
        .I1(\dest_graysync_ff[1] [8]),
        .I2(\dest_graysync_ff[1] [10]),
        .I3(\dest_graysync_ff[1] [9]),
        .I4(\dest_graysync_ff[1] [7]),
        .O(binval[6]));
  LUT4 #(
    .INIT(16'h6996)) 
    \dest_out_bin_ff[7]_i_1 
       (.I0(\dest_graysync_ff[1] [7]),
        .I1(\dest_graysync_ff[1] [9]),
        .I2(\dest_graysync_ff[1] [10]),
        .I3(\dest_graysync_ff[1] [8]),
        .O(binval[7]));
  LUT3 #(
    .INIT(8'h96)) 
    \dest_out_bin_ff[8]_i_1 
       (.I0(\dest_graysync_ff[1] [8]),
        .I1(\dest_graysync_ff[1] [10]),
        .I2(\dest_graysync_ff[1] [9]),
        .O(binval[8]));
  LUT2 #(
    .INIT(4'h6)) 
    \dest_out_bin_ff[9]_i_1 
       (.I0(\dest_graysync_ff[1] [9]),
        .I1(\dest_graysync_ff[1] [10]),
        .O(binval[9]));
  FDRE \dest_out_bin_ff_reg[0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[0]),
        .Q(dest_out_bin[0]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[10] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[1] [10]),
        .Q(dest_out_bin[10]),
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
        .D(binval[5]),
        .Q(dest_out_bin[5]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[6] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[6]),
        .Q(dest_out_bin[6]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[7] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[7]),
        .Q(dest_out_bin[7]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[8] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[8]),
        .Q(dest_out_bin[8]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[9] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[9]),
        .Q(dest_out_bin[9]),
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
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[4]_i_1 
       (.I0(src_in_bin[5]),
        .I1(src_in_bin[4]),
        .O(gray_enc[4]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[5]_i_1 
       (.I0(src_in_bin[6]),
        .I1(src_in_bin[5]),
        .O(gray_enc[5]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[6]_i_1 
       (.I0(src_in_bin[7]),
        .I1(src_in_bin[6]),
        .O(gray_enc[6]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[7]_i_1 
       (.I0(src_in_bin[8]),
        .I1(src_in_bin[7]),
        .O(gray_enc[7]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[8]_i_1 
       (.I0(src_in_bin[9]),
        .I1(src_in_bin[8]),
        .O(gray_enc[8]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[9]_i_1 
       (.I0(src_in_bin[10]),
        .I1(src_in_bin[9]),
        .O(gray_enc[9]));
  FDRE \src_gray_ff_reg[0] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[0]),
        .Q(async_path[0]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[10] 
       (.C(src_clk),
        .CE(1'b1),
        .D(src_in_bin[10]),
        .Q(async_path[10]),
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
        .D(gray_enc[5]),
        .Q(async_path[5]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[6] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[6]),
        .Q(async_path[6]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[7] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[7]),
        .Q(async_path[7]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[8] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[8]),
        .Q(async_path[8]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[9] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[9]),
        .Q(async_path[9]),
        .R(1'b0));
endmodule

(* DEST_SYNC_FF = "2" *) (* INIT_SYNC_FF = "0" *) (* ORIG_REF_NAME = "xpm_cdc_gray" *) 
(* REG_OUTPUT = "1" *) (* SIM_ASSERT_CHK = "0" *) (* SIM_LOSSLESS_GRAY_CHK = "0" *) 
(* VERSION = "0" *) (* WIDTH = "10" *) (* XPM_MODULE = "TRUE" *) 
(* is_du_within_envelope = "true" *) (* keep_hierarchy = "true" *) (* xpm_cdc = "GRAY" *) 
module input_data_fifo_xpm_cdc_gray__parameterized1
   (src_clk,
    src_in_bin,
    dest_clk,
    dest_out_bin);
  input src_clk;
  input [9:0]src_in_bin;
  input dest_clk;
  output [9:0]dest_out_bin;

  wire [9:0]async_path;
  wire [8:0]binval;
  wire dest_clk;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "GRAY" *) wire [9:0]\dest_graysync_ff[0] ;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "GRAY" *) wire [9:0]\dest_graysync_ff[1] ;
  wire [9:0]dest_out_bin;
  wire [8:0]gray_enc;
  wire src_clk;
  wire [9:0]src_in_bin;

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
  FDRE \dest_graysync_ff_reg[0][6] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[6]),
        .Q(\dest_graysync_ff[0] [6]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][7] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[7]),
        .Q(\dest_graysync_ff[0] [7]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][8] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[8]),
        .Q(\dest_graysync_ff[0] [8]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][9] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[9]),
        .Q(\dest_graysync_ff[0] [9]),
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
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][6] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [6]),
        .Q(\dest_graysync_ff[1] [6]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][7] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [7]),
        .Q(\dest_graysync_ff[1] [7]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][8] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [8]),
        .Q(\dest_graysync_ff[1] [8]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][9] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [9]),
        .Q(\dest_graysync_ff[1] [9]),
        .R(1'b0));
  LUT5 #(
    .INIT(32'h96696996)) 
    \dest_out_bin_ff[0]_i_1 
       (.I0(\dest_graysync_ff[1] [0]),
        .I1(\dest_graysync_ff[1] [2]),
        .I2(binval[4]),
        .I3(\dest_graysync_ff[1] [3]),
        .I4(\dest_graysync_ff[1] [1]),
        .O(binval[0]));
  LUT4 #(
    .INIT(16'h6996)) 
    \dest_out_bin_ff[1]_i_1 
       (.I0(\dest_graysync_ff[1] [1]),
        .I1(\dest_graysync_ff[1] [3]),
        .I2(binval[4]),
        .I3(\dest_graysync_ff[1] [2]),
        .O(binval[1]));
  LUT3 #(
    .INIT(8'h96)) 
    \dest_out_bin_ff[2]_i_1 
       (.I0(\dest_graysync_ff[1] [2]),
        .I1(binval[4]),
        .I2(\dest_graysync_ff[1] [3]),
        .O(binval[2]));
  LUT2 #(
    .INIT(4'h6)) 
    \dest_out_bin_ff[3]_i_1 
       (.I0(\dest_graysync_ff[1] [3]),
        .I1(binval[4]),
        .O(binval[3]));
  LUT6 #(
    .INIT(64'h6996966996696996)) 
    \dest_out_bin_ff[4]_i_1 
       (.I0(\dest_graysync_ff[1] [4]),
        .I1(\dest_graysync_ff[1] [6]),
        .I2(\dest_graysync_ff[1] [8]),
        .I3(\dest_graysync_ff[1] [9]),
        .I4(\dest_graysync_ff[1] [7]),
        .I5(\dest_graysync_ff[1] [5]),
        .O(binval[4]));
  LUT5 #(
    .INIT(32'h96696996)) 
    \dest_out_bin_ff[5]_i_1 
       (.I0(\dest_graysync_ff[1] [5]),
        .I1(\dest_graysync_ff[1] [7]),
        .I2(\dest_graysync_ff[1] [9]),
        .I3(\dest_graysync_ff[1] [8]),
        .I4(\dest_graysync_ff[1] [6]),
        .O(binval[5]));
  LUT4 #(
    .INIT(16'h6996)) 
    \dest_out_bin_ff[6]_i_1 
       (.I0(\dest_graysync_ff[1] [6]),
        .I1(\dest_graysync_ff[1] [8]),
        .I2(\dest_graysync_ff[1] [9]),
        .I3(\dest_graysync_ff[1] [7]),
        .O(binval[6]));
  LUT3 #(
    .INIT(8'h96)) 
    \dest_out_bin_ff[7]_i_1 
       (.I0(\dest_graysync_ff[1] [7]),
        .I1(\dest_graysync_ff[1] [9]),
        .I2(\dest_graysync_ff[1] [8]),
        .O(binval[7]));
  LUT2 #(
    .INIT(4'h6)) 
    \dest_out_bin_ff[8]_i_1 
       (.I0(\dest_graysync_ff[1] [8]),
        .I1(\dest_graysync_ff[1] [9]),
        .O(binval[8]));
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
        .D(binval[5]),
        .Q(dest_out_bin[5]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[6] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[6]),
        .Q(dest_out_bin[6]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[7] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[7]),
        .Q(dest_out_bin[7]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[8] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[8]),
        .Q(dest_out_bin[8]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[9] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[1] [9]),
        .Q(dest_out_bin[9]),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[0]_i_1 
       (.I0(src_in_bin[1]),
        .I1(src_in_bin[0]),
        .O(gray_enc[0]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[1]_i_1 
       (.I0(src_in_bin[2]),
        .I1(src_in_bin[1]),
        .O(gray_enc[1]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[2]_i_1 
       (.I0(src_in_bin[3]),
        .I1(src_in_bin[2]),
        .O(gray_enc[2]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[3]_i_1 
       (.I0(src_in_bin[4]),
        .I1(src_in_bin[3]),
        .O(gray_enc[3]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[4]_i_1 
       (.I0(src_in_bin[5]),
        .I1(src_in_bin[4]),
        .O(gray_enc[4]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[5]_i_1 
       (.I0(src_in_bin[6]),
        .I1(src_in_bin[5]),
        .O(gray_enc[5]));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[6]_i_1 
       (.I0(src_in_bin[7]),
        .I1(src_in_bin[6]),
        .O(gray_enc[6]));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[7]_i_1 
       (.I0(src_in_bin[8]),
        .I1(src_in_bin[7]),
        .O(gray_enc[7]));
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[8]_i_1 
       (.I0(src_in_bin[9]),
        .I1(src_in_bin[8]),
        .O(gray_enc[8]));
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
        .D(gray_enc[5]),
        .Q(async_path[5]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[6] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[6]),
        .Q(async_path[6]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[7] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[7]),
        .Q(async_path[7]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[8] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[8]),
        .Q(async_path[8]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[9] 
       (.C(src_clk),
        .CE(1'b1),
        .D(src_in_bin[9]),
        .Q(async_path[9]),
        .R(1'b0));
endmodule

(* DEST_SYNC_FF = "5" *) (* INIT_SYNC_FF = "0" *) (* SIM_ASSERT_CHK = "0" *) 
(* SRC_INPUT_REG = "0" *) (* VERSION = "0" *) (* XPM_MODULE = "TRUE" *) 
(* is_du_within_envelope = "true" *) (* keep_hierarchy = "true" *) (* xpm_cdc = "SINGLE" *) 
module input_data_fifo_xpm_cdc_single
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
module input_data_fifo_xpm_cdc_single__2
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
module input_data_fifo_xpm_cdc_sync_rst
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
module input_data_fifo_xpm_cdc_sync_rst__2
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
module input_data_fifo_xpm_cdc_sync_rst__parameterized2
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 131712)
`pragma protect data_block
DC7mKDdN5/GVZftydLPPpCOvaHQ5AKhjayQVZWh5MNUs/ZL2d7+OrUUs9Hu/RWAyTrAHCrZdZ3Pg
bR7KvoBQQ5Ni0W1OoXubqCRlzVtftMWXv300CRtRCc9ruZHfTh4r308CXkq/zGAF3wFvLc9hoskd
CyOdYGsgxLdBqOgX9fo1KEByKKR6fbcqJBmosYT7bdcaAKMOwIqtEuAXeslSvGBM3l9grkvLZB3G
z2XqiUUMuWG4vty8nIiloEbogs4mUcdnwuJS/ftmCsd9fcxiSZjO+WsGh1FLHeO2Bopxn+M6IkIy
ZOGTztVjpiz1EOmlygyN96oRFEtpdNKHgKyLzNwC/yjh6MgsLJXIosf2Y81Mz61vlmYhzaqaN1C8
+bdAo1QoZMiUp9hVM7x2yey6MQYohDwgQlNqdzjuqVZVAf6U7A/Wvei0rVAV5kG4L5BIfopJz2TZ
KJi9FLpb+LpD+pFVDS9k6Mfkd1zzwlR7lKS3B67oWu2eq3g8jVyrtGHLDf3SPPo9Aen5+MEwdP0p
s/dVPPRdHQbtXHiJ+AyffolPuUCQO9Iq9sbASoX766eFB2TF16ipwgATwXPDEGxST9MTz/sEa7nG
FJK/l2jeQczeQAz9F1rpfDwqGg8T3+dHlsf69q6iEYSqW0PvzXjI6ufoY0lslwZz4U1oXEuunAf4
m2lso/zouTdp/zJQfB2HvsPVTk9Td+/FaqUDYQ0s3YoeO1tBykTZvk+yGahmc3PLV72ch68LWrYc
G5FvspzqkntMER8z11exprrD2/v1KmrorEj64/7C/0iXqBA0Yn+GTrXGUMVLYN7m8YuEZ1j3t99p
rIs1MnLdbSgsN1Gfx4WfKEkpKchKBPPygwvsDrroLOYzJJuAzQESha/5wwuWPN0R2/IpxG/+v+S1
LQCu2nDq8CDANLvWoQQgTUN4f+DXoltt+Ss8TVSmyNq+wNFRuPJCLh35A78FSan05O8a1vEBD6eZ
nHDw677YDk3Ru68+/2UD6DF9ESfZ5UYWKwwrTvrwileWI5w826hasq4Cuo820bvMDFS+J2SOnsJj
xHX+iXq1xnb8T3mLqtWhUvCfipIbfzrkWChgmIM6pF7+x5Acp7mEsmKF8LCcX6N3cKfdAYOb4oWh
7tjrJio/sGbiHJ3P0v1sojHzRBox7R6a1yyzkUlh9NV+7btz8DEDxvYcRfUvmC9ow3g81ZgYEcdN
NttISiyTPjJJXDqV2occJgXEn6/EdeDq+6pSvnTzpQ13V2O/yXCrbWgyruGD59Ss53HRubapihfN
zZ5qK5SnFzswYZGjq+2Uo7F137tJaAK/1Ivf91ln4tiTQrcmoH+2UHhUoPAO7pURbC4qRbSECQh2
c57pU9mRLTXBcgSPqvM5xrvHCIkH4eJJ/piDsQq9ArpNmQJqKFPR8jnB+VTqzD2aZ2VS+YISK4L9
6KgkHpSN0X1ED1bIu6mWiEjWn0Q0imTfM5cJb0I61vbUtWRZujoAXLxGqfYFXbyj8npO1xt6hqxv
8ZIlfK09JlAFWCmp4RGR3E6EWmHaJpFpzOmf18TCX1sxllXW86gy+NjO9XyyoarUaXKkJDewJKnd
rYlYlmlx61YJ+1zS2Jt8KnGCUKT4jSYGh+ngJ3ay01GpJdC0JAOqQbW8/n4fdxOoAmJqi03X9kNW
oXWYmgsptnEqWve4g8EiZUty2BD5fZgnkiZq9eercMj5T6Ag7m9NoYlfm2OFCWISIV0AySw0o/sg
Z60aWz9A5sbwxTJo+YkcZIB3MOGCYperWbaz+GugA4sVBLWgNTvFPPA8s6kmi6maIJ0UQ+lVLIMD
YIqyz/7Kci1+YfUjbAeICA6S+82kcpH/FqTSRVlZUK11/GAWt061qSB8GrqMcTBoRneERlApVa6M
WcAQ1l19npoRijB7xB+NnbTCRydQHYve1qL/rkls60inI9S9DOO2gjNDB0HHT+2kuuGzeNnm6/aq
tf8zDxFbZH7aEUHdVtpxIVnMbjA+L2KMv9MYwQwJCEUnc/8LlfNbNU9KQGkCvXXnb73n27VONer3
JHClBPFwWxum64h8DBwl2ry3vcqJ33huzaVBt2sABgm6gAHPori4vXrARwiRE9MIzpcBPhx35eq9
MciBAZCg+/saPNsv9pDPKcd/aFnLrC/aspsqu80Ueu9CQORs0vlr+wL52rb5Sd2QzLR+YPFzZezo
OE1nL5UAd7Yw7fqfG2Oqa36q8PoKwoPlIdV73YExgOVw/orZ6n27Ez3C3h0OZxC2i6L2Qo+6lCz9
zihXv344AtJACjnWF/vgyXRxaaVwC8kfWTez44fBCjMq9Bm7ljAGN91sRmI0IUjf7iAY/Z+Zjc16
QUF2/WZWAvgFGf5K4VipGmdPRU6RJjuPBP6kvHE+87AXWIfDPuIx3ZAocJcuIuhAaNQTofevsF2V
hmQCiaqal10W9TNJlYr/8Gjt0/Og80f8NL7MP/jL2JC10VejE4GFT39LS8LgbdSYYNHjp3mdrJFo
pUlPbzgBsdnjjoKvNy3JLfatelvKs/pU9Ed8U23qXBkp7OczEWNv/demHrglAoi4Crsasq8nBc+s
BJumFlIiigrkAoFIM5XZVp56/y+MCyqIVuVBIpcDOCd00zGWX6DOfME0vjC7l60J/VUZ5X9S9bJc
rIroucGbDXmYoRvEEBmjCiqIcWGds+Q/+vdmMNHtwTQ1AStdxhHgmyTrmHPHBA4fE+4uHZZXLBoG
iqZ6KEVwGlCuv/ZA3CCdC8RuYTCvpVtUGvnnJwidigxUVVTmA1ytsoDLI1m2e3brSoQonBWNoOyk
8MKjFwVw/bufPuuM8yP1mC5NFBaXeH8a4d0n6E11gGBy/47JGFkWZSYbyAlyaLavG6ERksYSG3VF
rSaVv244wlkyuc77dphVv1FaWBwWhWpQOBJLaovIr4++vXN/EvLcDnbZtQfx9+VBxku8Rj0zuFLq
R5zvRmmCt2AvaqVRkOXcuFVeJIhRH2JgxWVLXy4iziAqpYhOazqy3SryHIYh/eUdqty1CAsK5v5e
+fwBg53VywQk6mcmxLsaHhBpFRqJz1k6o5kXT8AA6NA1CNKy5nMLpUk9ZL2OlH4HAeMPFriyVWlb
WAaAntAPHxmL4Mohob7LQIoVAt0k44dPUwDMFRvjNyRTgoESKUWqE0CD5AkFvZAYs/TLjj0HTtV+
lppwcbJ1Wklx452+cOF+IJDRp4Vj5/i92JJRRo8NTqbB8NSuvSXasoworMcqu+jucMtvCR87zBiu
N8xA10hb5dKUyJW0r0Z6U/KIQZGR8eRn/7e6PKp+N733STRmatRx1Z04LHtzct/mUBPCTxW09Sy/
PuMHFWKgwdaPGP5Ck3rhP5r6ltdw1HSKXMjfuDcxm3M2PdfszDwTiYG3fz2h6wqla1oGEWpk79fh
K0Bc3ylPR/ugG6lb+fbx4IAim0cfDw8YovxplDaR2pLza30vv7koDhc+2D+PS1Cr4C8fk8bAhBTS
yLxMrXWNP2UupxvAFTodwE8w6FTGdIyv2pvIAdAv1iPvsLiSrXIQVHVOhRY8KQUu+iGq975e0wPP
Zdvp0m7hxU2sWN+6MT56ZnAPB1SdpPAENgy3gne8Sgkqg4krePBZ3UIAmUowNWMeelxNL//E/Dtj
8pIoZhVbXf419y9s6lGr5TZ+PqofJH37u/zQWCIUtRoj0da/7ZElUbcaczAV5VUpvJ92PpJ3INrh
SmwXPatOBjXzFYajYYY7/Rn5K9WRXYokNu2moyenkEegxvb26WRkozdM/+OCHtbS61Uh07FrMMlH
qNIBMHBjpLOeu8S5DZMeKiMU1uFXVIdTkgjEWduiX2sQWPrcHeRjzmyKsyvPsIJ2pUSRhSm0CU82
2fPCfQg85e3VcYMv0Fz9lxfYs+94W7e+K3Fd8+W12IU7kAvrVb9lakfBIiwJ27GSAXz+LOHyltkx
IW4qz0ISMf9XJK5QDSRCZID/TKeRKfPhiNUxz9duxr6oXZz/29jMNEapNh8gyAJ6wDEOLE3ohldK
0803REUYkfeUGv+zaGmxNLUePHDkOQ45Kg9a6KquCkypqprG2Pk8uY/F/GzZadin24qgmEJ2fsYJ
bPmv3+FiGqXQ5AYzxpB44X4KObEr1Ff5uzQZqdjWvTvpAPbwH8QM/vYWq3XkiEK6fCSZOKAbyfNX
NPS567xzmPUb6c6v/TOX1AE6k/DOUW1FnVWv+GzcZUoD7Uy3z/LJ1vUYjLUXTehkkAHyFJw1yXc3
Or2R4rfz69XKkv5KU+xm7dSSCiTAFrbjeKmq7F7BextVD1jdrb+HXnV9KaFIR9czOeNoXNt6725U
ty1YI+yx4XaeYVclUaMOo43KlapWK04rWh8jpARmLpR2dw9e+VqhbLZAd7bowMoAXvzRBKjnnSJN
DDjKJ9TxDoXfl4UeYfRmd/MB2edvgja9n9gy7xUKeTat7P/7eyGXvgrzm9liSYmi9BzHtxy46a2A
V2YYo75wqFxDMup4xGnIBd1PMzsrq+4YNaO+e8M5C8D4AIY7Q1N2gHf04UWXgWhnfQdRRI0JPFY4
A7oemToazNhwPiVFcODLy/IK5uvRK6Xwbd7kZX0VaXs8qBOhRxhtD5YPnsqO0ixUPFMSsjAWIYNY
sGxmPR3qWPfe/Yn5Mi54ky68AuzCUWGTb9Q1BH9SkToB/F5owFB0Lb2IIZCSWN06a6dipRAOInjB
wTs1KOyRCJDKlnhRxeGqtA12N8H5j5BqSKU3ATgA2Qn1NXoDE9Df/ehEvm40pZiBLLdUVA+sx5jc
zt84fhdAo/UjORQMHEwS7jEENZCAOJsaCUt6I1xKcAc+KkKtHYyS8IHs67K/nfuFd4kd5dH8Z1Ad
py3pAjqltC/oZIjpziE0j0MwZK91Y247lI4bVgyiCyGDsuaJeCSd8B2G14hZGNAXNNlaOdU/R8oZ
AiueyuXtjM3NxYsm9ll/foamHDw5/xqBmkXvR5EOXF8z7goia5rGwQmRx8XjLLW2C4LOaT+s9mQX
zJ12UV7ivwATt9UXdiaorY8D1Rp93btZPiF6ZVqWn2WvkEJ+PdqrP3FKO7XK9fv5Y7VZSYMMZ0np
O/Rvl57qv0/RjWPWH57+5u/UmIpYMM35ah5R/iOmrXRool3U1Tfjwq0uTLAJwhYClrj5hlOWYt6/
QGDvjJwRrkPVTbi1Ax/Hg/a1PTrm2fJPg5M9zbKsUONG1Jqdof6PAvQpxtyHjn+Lw8/PZIeq8L7E
LAQ3EO00NWUhCRVkqOSjy0aq0Aorzanqo/ymix8lLHE247p5ceY9sUotZbd7G5ulzOS/fGnaxe/V
uIRCji+nGLVN3KWE4QBR5rGlQg6EDiQ+OF66ugyIShfLnEeZvL4TVE66qkVw7AlJ+DYNiBO/mx3v
6cxdyBxuiS18Hlyzv2VwdDZkUIZKX9sIbvGtZHDRE8uwFOFjclwZMDXIhDwcdTMI3tEiDNlwSyjN
cqFjuqKP7g0mf7zhe4b9iuMz88yKVClQYi5F8rJoY5wwNZS3y7GV6J5/kPOGGEzGhpdMAksllQD/
AaU6TavYPs/or2qHU2jWNMKlIFmtyV6iUsHOCgxPg4f42mkhGFo3icLdLEcyETcD4xnRasLORSgc
OICBZv0TjPt6XCujSUDdebJA/xH3gM5O1/0KYslQFbvNw3ocFwUPWubPpn9KC7F/3nbHvqnYdDyA
gWR2qVniDT5uq2eu+URbXjWPViDjolzhXWUi9i9+j2E1LKzGJMp5wMZ4H2BR1yFeCwXL0BUUENiv
BAc0qaLrXemMGZuxJ+3/aTRPZrZSJ8MkDRqyRSMjG8pTM+Ak73uKyLM0FuFUtHdkKqnOC6auOw91
JeV9DdLkqkElXG5WiR5UwFWp97fNa60TowegaqSeMU2XIN8Byf97DeUaxFegaZJhqsc7+l4m8LdH
5i+V/hVuEiKVeR0xIjjIPgfcCnPIo5msknF+cjfI+i1a67h0+tydNJSURw844rZlU8/Q/eObxWQ5
tAA9+ggjcRufmwN2YV0CPdhwf0KTnzNfknZmwKnLdd8Oi119s4tjqokJKrWHmvwdR5Hk/tE0vJbK
1P3+OVZ7E5vSmcYuivculkyTIX+d0iRLUvRPEsC3YrOYwxGmWd/Wytv8rV74xL2J/aylAgImLlTd
JF0gtusEcif3VKjaQblZRy3nOxAA67KaKuoOON11JMTmhSu9A1sIQn6wo4A0MSC0ar/x7yBa26T6
fMMuu9ciBoDsgaNwW2Tj9SsMq5jZDyVguuQol07pDPX6BdoGV1TuUR5qIXpNgUxvsfJXjkzrDcTe
pBhXe5nwi58XhPnfD9pGgvZc/SUF9amDa9okCXueDtiz3h9g0q/qBC2tF+zs5M3BI8+hbgkxETUU
URskoeJtwZpRuU+VeZXLT4Bv4BeqkTqx/eOXlhtMuaM0E3GsQZJ24LInDuFHtIV68VJPqH0vCZFr
Pk23oMTpdXpyJrAvg4LAjoFuk0Z0tFFGiVCH6txjOkwIeKE0+ub54xlFHf1nIXHr0S0PmVaA+nO0
1oQOdtitnW+BQh07/hDLIw5FZKb9keAv+qKECcyBVNtpZm7bDtu4AOOF6gOr/+TG9EPIbH6wcKBh
q80LNCHf9Uo+5vWa8FOSjTMmPtTVoaqDkDEUTF9MmlNOeWDXOXI4dCQd1Wq8H7Ar7+wDxhoYi+OH
ILfOVm+Pb3EpP9rNXT5p1cXF8KhkmujaeTeXKiWjVZUCmeEcg2l9/qmHu1150QZpiZhzTvTd8ugE
4kArpaMkVWb2tAaUrWgvTqIzUxpF89OGKJHqrCHCWU7511b2xKGgWJs49N2UXVjoeQ/Smd/ZZ6QH
X1c8K4fQaDHg9YZ/2tK7zVyRgwlNl5XmbV88HhHXQ+a5g85yjFwoqYGCzFxwif7tzifCfBDo9cNZ
dKZVI9lA4v/SrzYCx7oqmiDLbcPs01D1OLJ31AFpvUsP3P2/T46yDxWy13x4XXYdGoyHVcj97ta/
UvRWQgCzCrR9k3jU9GMBXAnMIwwPcDyN3i0j9DB7xyTNWogMdLSaX49JxChUDqiRvjKRgFDyGhH2
f8vYZH+gdprE35e9SCPlyXJ9ikDdqSnt0qoRjFsREn00g0Ya7dMpm9myFBRZjFweLCBfjhhwTf5/
6dhroQ0oyVWgkx2c8kBlLYXiL5T2m0NQvG+uEK3MeZMztIJu4ScvLDGEYaP88NiyHll/kIIXXTfQ
FKS6GyJUzCImBgvhBHnOJLaay4/aFxZX0REV43ixs4tZ2CWdaS/FfIqPDCkgO4uzg5+g5Wf53juG
/LsQLYErDOOBlRPzIuZIBIT3KdjH6lfLofeja6NYUf7M3//ZW98ut5HQs1GBcVivihl1Qq1AbYrI
knc6XNUI0q/EwUqkLdNxVQLn98e2rGPa6t2kUcEww591/MLfXxqNq+O0EQmga2BAbVhC8/BOJeET
2b82SS4oYKB8AkjiTJfB+qoFcij/xCtUd1EE1qYnChWI6VUkq+ocqZTNQbqMqMwKO0LaYOcTfwmo
RJGov2msJ000d9r3j8VRFiH5eRnDQwBC9Iw9F9aWFbRDD4uLp+MeqZpKcLuEo0Nn2kNCeMqBCWbu
kxxPNOqWdf7usvDB7gtA8BS1YrTG+eaEEDP9PBqRzYg1pgFT3OntYMLlsBtdUp7/R2mdZlK9U/Kp
zzd+TekXZK0+i3tKzVt2OcKWkWfIwvnDElY/pnsGbtx/l+HK9H9a422kGk2+Ajh7LYwkDMdqrIl3
AncyPglKHgHXX0VrK/3I3PozDlYskRvoyUui859H3nRlrG7KLuDHNOCRdw2SqE1ANCZr1usLe10z
0N0zWBZooepa1HKqAfDB+ni/W726lUOyuCqS0SWeo+LSXBIcyvNSGXCDYFnxUJraz7Lr0RKKcmM4
B0hLGiwO+wc9V9VT/is7gqEOeZQFp2vnIppgL723s8I/iPb6MqT7d0jmqqlrhxOeclYL3JPga30k
bOKnjOa+xu3Gfn66U3ccUZwZ+cOHZA3973LymLDNLZ34qK54RHCkZTXOeCiVP1JB+hM3BsheY9vb
Dx/0Ez382Q1KVF7lADQC16/RYUoMovqjzHiresJ8TgBeVZWEde3FhZFa8+TI2hf5HnAfY158KyTZ
kgpObRxAu45hCzSJZJWhKVKEWD7tcQwiz9AD5wuU1IjW79zFlt5MrO5bFUP0tvV8+cYBCCV0T9KI
dojZHEU8khXpq19/E9OAD/6T4ePpcSPut+Fq+dabNlYz04oWN27hQ5jOnQpofIqsd9uSSPms6vkQ
dmt25RgfldlZYXIYzHGCAi/qQ0CHG4q7641BvrQAR99nuOVx9XdUGPebtsO7joYlxHQiNv7FBWtX
qv0RBoA7Xy9G5lC1XaV2HpoW/yjuAnuxLGeuqv8KYXi8SIzY2lZAPxjM6LYzdB+dzoklHYVXiRmc
pGM6yXw3jHQE4RTIUae9jSmaq8D50zjCvXP9gaJI1VpUv29zMcDWcc9zJkGJwX+sqsU8CoBDJ8GX
tvZj7tIXYLcCkwkiUrVpNxJLS8/S4r9xF+SXwNGEctOsW3e9ofCMLh7puVGNr6UT/+phDP7kuwj7
hpyPiPFEl4/7tVPBweRZuDUdG/xa58moOFm6UDRWY41v8tvPc2egoADaw7Y7DaP56PuaZPoJHO04
5A1Jf78Qmpn6EVz09B3IM0x2XxsHxXIvKPqVIx/UxuL8yJQuty3S/zv/pqeaM1LSIj3JoSxiZvcP
wyAoqO+c40n1EgyfvEWz07PKirXjm2jIOFaITrlW00FhZysRj3EAygD8yKTK2c4cZFV7MvAf3BX0
dkuzixDKc5Da6FFOr6zJCQdNJ2MRoyM4x7sy0Ck9GxexV+5/qawoSnQKt29giNJpVs5Aldni3Ejc
g42egoDLI0HUvCDQ04dFszPMvuHFDjJgRJ8XCZsn0TXtrvqyhOp7jnAu+AY3x3FMDFRH/V7t8djo
8ZQCDNq4EPJ5EL8zikA/FeHRjE1XRkmCm7KiyJa7dhwxhOvwpqc0syF1rMkKncN6g7P3IkokpVQF
Sehc69lS3XMzlaUz5/Nqrtt8tmLW4MSlohBJ+gvMJi6H1JTVTXL0oK71y9dEL7hoQUY2q+G10sXu
j0F91NtREhHjRu3mGswcFu1l49pr8eljHiZOG1KpEzc84fGMWislFEidYmAadxGHDCilOtbKLOWc
2w2NPlehmIlu/+JJE0uEXfajZAm+pG1LEZ4i8giCma6QXkUzlqZfbCxblI7IraqLhiT0XwGr+B4C
7+Q4z8wmg2yF/dB45wjJgaYYJEPEevLnoBdw1OoD9Zg/PnqleMq6PaIfJzMIJ8Pn5rkvPFpj88xN
qjKg+FOHW3IEe8MvP+YoUOdyRmIFLbM7Ko2l2FDcG8KEsWBr/dnawYTIkRpGF04Y0H++vt7rF62G
qhcPqhalYo7j8Vqka2JhBiFCnmOG0SafYIui4/WEAMVlRFy+oMf5WGtdOhk1/nmUTlx4UF0r6Ux+
qXLEnYOXndo8Ewz2Q3wBLfQcAwgF/rS6j7XCWgxkTk/y614XVw7PiRaSVKRDq84QI3TjlrRW5/r4
NPxtSJDWa4xyEq8kpIMM2o3kdcmK8X7vautn1x/OiAWjKK/rgU1IQtaGAWrRCkpuA/R1FtDQv0F2
oNA2ZllfxLOKZ5Nx/Z2f0IQ7pLsBZQfURk1gXXhMqYz0UkKwZEDd++uwbdRTGEAYUTBELxbFsMZc
1/nFRgDHmfbDd1uzxyAf3KMfZBm4Py6pzbRivP0LaqirM3yh71EOUiqMBFcUYhVAEKv2kC1jFxN1
vq+yCkF2qduXFdoOGO7WGMkXATwbqF2qQ41x39iX0iJLT0/mczM9myHxLGezy0Roj0JuzDOMqqDj
iTxXnnJS8jZcVCw38RGAnCxIpKzdvG/ViCP8qevVj1Kt5J5hVYm09KwW+e0hKZ5Vc7OKX/lAD+UQ
mhwh8oiKReFUa4at39g75MFt9o3fiyUBAPyFsNFW5e0YnZlDkX3ozwLQHq3aWhncA+/I814vuBTO
XjHRVBmPryWzyIPuQ6HjqpYljWFtDfFcbpvNk4eJnlxn9phktLHjZvwk/Zk0iXKwKQ+tk4xrHYWB
Tb63tACRSHkLwo3IzHbLACPeN9oUK1I+F3kuwLV/Or3FRHYLhFEPLiAT6rjoPKGypthz3a9XRwWI
JHKbRDKIbF9GsEsROadt51NGvhrYZuuy07OUnhtvVIbz0IFM/sAQ2JzKzFQVMzkSeEwWFyByeV5C
7/OWs5mTWsl/VpfrV2jcbqm6HMidlhng5CNFH08NzUuPxEpu6TPbmc8QSJl3YP/KZJusklfY3VVE
y3pS3/zMRwxSB4c50thbUk8i9S9Djtxzh55OQmLF6jqvI9ceqpSOIy3d/dyLjy+Y9XyH+fB13Efi
DPK1or0q1f8wkkm/RNdRwG887IU8hPEzn5qCf3jexKP1YB0/xECYxGqwru9RfIEfRfcz9hvz7oKJ
NQAXsdSGH0gna5J774O5ZyrYKb2a0JMIey5LkrvvvKAc3FycLn//lRMSefN8dgI4TGpzimQamiD/
bqvdUJv0kAi+ulcbhv4ZjjA2dAlFwpLICflaTihtaezug7F3kNV2t7jFU1zsARIzH5RpKnOBJm5D
BeCL1bCqgTIg8/7xRLFSlFLoq69hVSPMr+hWmdzSa1W5bkbCaREJR60NSZ0s6pFkFPg75WI4kTqr
bCu40qstGmo/JjDHOZ9IAjmz4pp16N63Z8LEOpr12GT6QJwD0T0kQ+csGs8sp01iOT9TSudLDYOy
87pPGfiSlopXK3yarJJQqJrtX2OMTgA2jHUp0wVg36QouExOzQJcLmEbnGY6m0RcovNIbTR++//r
1bBRRz90IB/f3xIWU+khUOSHbXwxzTlgnH2rKmGSHC05uvd3mqHqoQMmHTdKxhU1zC8C+BO3jJMS
MoYlM7WF6tZ2wONeJTKesd3lQZ/nB4Is+yH15iSsb9YAj/EJK1stxcQ+AUmMYaW+TBPGSmchYqI3
m1qGQWQAYmLshXQKgFLqOdSM+/Qw2+G1EpoYQzHONsufLgWlJjgl/FxUHQrvrAhErpGz3g99eI1B
N5AebjNmBCk0slrtLcAWTOfqEYMEFFyNNz8eOkoJy6U3z6aXTGlfF7uTrcditXhL2baLTL9kh5q9
4cv5O1WquVq3dpZIfzF1d+HxiENwsqAOUjjXYe/gnMDKHGJEfmsLWXQlaQdzoyRIvwAhnyohC5dE
i6aBxQcHFtTmBYtSV6JSwdhddmN0KIX/NwLOtYkiOsTop5ZudHygwYIApLk3NXxL2LDY469L0UDp
KuOMsOn3FNUxeEwksmZmhfkNCEvOz5vMysxj05rfxZmaPr46QBY99jLummIEcuGiUUZSjbckB6Fp
HjR3ZPrBRYaemNyD9Fte5GFGXQ58M/GwusPBUu6mAhCx6jMJxVM6aWdGupxVyK4y0Y4I8QQXnKuH
1E11H1QfvsLO6AngCWdOO+UfQTsAPWsPtmYAtj9QWHLvspSRe9eEQYUiX2Z7VvA4B1hx7A8mI3Zl
c+OQrbkqfcn04sgzBAaqBhurlJdcKMmC8e+J3oM8UKw+zf1Bkua9j6OqqE8rQYog+cSvVR8iVyav
gT98e4ZbPiNKne660dd8XmvQChTRFOdBnqgOFcAl5LAITMRSOXo+FLSnbDCQAKbV6fLS3i35PeMP
s+fCFnwRtXSa/nSJVhBjQySjz6Yc3pml+z76xCBLcX8ZO35UtwuCRYO6u4TwIbiwL1xX4QHGgjUR
oUATBLNQXKszuYj1E+85yUNVe5vKWYfUAs9Ca4roHqZIJZt0htOAg+75ltWKeDUJIaCi2RJRXfMy
u7lTt6VrNWEbi7xdQoUZCMHaWo3RApl6/NPouBXNWmmMfYpCYKLGU0ym0RRF0VPFgByeJ0KDEmGA
qkzYUztuE0OqgcG2bA/sYmX3TVjlEUreiyd6Z9Ar6ZsKeviUQTBwPTHYjzhKUYoUaLqZsNpTGfq8
ZbAuFV4FGReNHUFpoLzfBx2+JSGGvAcivOz4His4qFsmCXgFA4kn4OSaIu6YGuWHZbxqZDwlfYvI
8mvB3By85ABZt64SpeFHCQnfpbdu7SAg6LzHoLiLKe7q13pxiA1BY/0Q/fKCvgIglKzCt3GARWOv
OBygdMcDDEBXBeticBwjrr9Z4Vb4hZbppaQ4kQPi6ZTsvfxdF6zNXRIchVXe5sHkmzeJFJg0Em+1
bQsjCPhCmD6Elo2s/F7+rv1ObBHeolnyQV+Gmj3PWP+ZE7NhrnPiheEHkezS4Zlws8cYnYmcB5Ek
dXtT/1Md36omGXENPUlQX7oyWiWdvJiRE6468a39fCyLo7j+oifUu0FR4NejPET317vfYkpudxqH
1Epio1K+GG38st8HaOqJEr4naWq049SWwp20u0wS+vtieGfsQdq8fIWh4jjS1x2MhJ3rLXC2jk7o
ZU7dI07v5JLFT0GzFmJg/Hw6YMnOUScclze1g20ucTeJvrHkkPneaVkOHpGiYBlbycmFraRZYGBn
8inbUbJkndFPh2lFVYKVi7tzvYDM7VljHSg6SnXr1eED63FmK2EJsbNhlG12H9aG05p2gqSwFN3E
O0ORyV8ivOt5L+qbr5aokbdvmWyRe9JpFiPYKMDuHvFzyISBe8U8DiTfJBAxZsm71loeHvyYJoD7
+UaxMforZ+Zv3Mw40vfOL4ZXD8uY8l8Ih9c929hiVdC8C3UfsJvlaS5FKjN6k46HZ2lkih9Sr5d4
WMqPruPq1055uOzJrOypIgPLsqLwYMJZ7UunGnb1jphQCjsotJ1LRL7oGV7/jMfrFN/TucsxCoyX
8gWqDMpWR3sXRX9xHuVhRKrghN0BuxFzp0OIQS5Lxfj9E2fp65rZnxkKZKdE88KE7E+jptQSBMXR
4zIFJ5pPyE7ADv0o44Bbt73A+rWETGBwFzBV1N0ZlaJJbRMH062wTKKqKtzZUwiUJ6H4TKUPx0/i
pNoR4NFzAXP4XHCkpQB+ISYDhGL9NJUSZiOo3zZT8SFS99LrjVIgJnob0o5qftLKTMQB8e6zTqnj
QNZOZGbfEQanPHgRZmXqcb4vmrBuKcmRVBXkNNZkS5MtJugFNnRNjNITcFhQ8Avj0kacN4fgh2gn
UUOqNU+Ylc0wH/D5DvYo7zpPJiX7zC76UhGv8E7Y8YTQ/a4YBlQDz7a+S1sD91vAWbpChxJuEYVm
BH2SoQ221vYqnhJHAMsTAUQbc8qjj+UuTb6ZyD5uCjDAideH1TCTJp/ejqKJCVtAZ7+hH+H0GJZq
QTDqq+YXS2gJvcwto5AkyJGXWnZHhFKz0SOi4o+Y2wzZXEqZaZK25bNIaG4hwh5HlpaPzsNjvrJx
PAszDWR8G3UoR9V8B9dk4ui3nAUrl1oh0NIUQo5/ITmgU56ebW9KQM7fZZ/2JACViIu0OYD7X7QD
bIy8FPW6G4oCjUcpfp+c+G41nQtYMFVS/PrvKn4769I3nUMg6om21Et378uw9EQEDfK4y6/hxol5
OGA0JZwq9GUQplvPD5TyuHqSBIAVlp2EqwoZOLm7qhnfCFJKs+3Eul6GOlyq4F8YQleCnKYXpLwo
KbM/AxSmn432b93BHl9MY2p9Xs/mrwt8NNeaTzJsEO3nENlEInGjx1//JhpmcwGqosc5f1pF6CSU
lNAi6qElof8nFXJK+ADm4lTYdz/fFGiUEkHhE4yO2xZXYAS8Yyt+Yf1K0vTSTNwPiOoO6wxhDoya
rlWdN72ZI7AnoLVqFAWebhFkgZY/btMPsu4p8zPXR4EKpH/n1B3znQtbjh2S1+ptYOsM7cUIfcCr
u6xgjgRXpGyvn2Lcf0kN1S3SztowzOQI5EHI6QqoKCYjLmrSWn4bQo3Jy9ceKnT1D094fDc0LCEH
/RiLk+B250B/BYDU6QxX2gmAwzO6i/Ctnm/S+Yw2q8+ouupKZCaB/GlHyORlh+Ek+kXt48wJp9qN
mxeNVaRLWthS8iSBuawytUygK2wt0conbvn6EmHvCG8XJrLTlf5AAQa0mpo+bw91Ws4a9I7tEzqU
AaqXv/+pPfsJbE2dPFjjhV8yKM4fd55A5EKzmxchY/llapvRK5sKNQ9uBy2YR4+h3Xrrai3leHLB
Qk56GXI7E8j6X4zDxr5dvQQ/CQZrP8GguPNWMEh3ZyuOZJTYX4wi5EGdLCz/8dg6r51/EKs6HXJ2
oriTt7qZHbklIMVNQ+p0X9XgrxkIbCMirKNMUMTlTU+6B2cqDCWFoc8lZSX5UBCAxO3OBw/u7A5+
ytMM+ziIl/dLwU8r32sVKORwnCfJyz9bDNhY88fa6WBa25Usw8E7Tm/9CCcdNu1EpJDWrhsqsIDU
NsRYfbUV+984JVh+o7WzrgJm9+zxTCzvYtsgG+eHXV8zJN9rENWYugNI8sZyWO+CEz5IhsgYly7U
OPHdiNjzn+/qQeQ/kSB5hGfN8dG2+o8ZxtCUMHPRBToYAyXppNlZiqEzjv9EpTNmZhVfHxYpbGzU
rHU8Eaf9PM6+kgOGhKKRegLvDMOA9G/cYf5OKg4RB1j1Fd+lvHmxe5qJnnOnyEqjbExpI7sofe+X
JV+kF2+NXpU2aVpxD6d8kP9SbGZdkY4wnVS1AO5na/LDlJRW7puFzeaXyaaNxL3w1YLkVVtN3I1s
I0mlMOtF7OOfYbQt/tnieyi5VU/cUTyy8aLdGsnahKZD6+b+OKxUh7AJTIEjXGC37j/ZPceu4Eqf
rW/68dHC4J5rfuO86WxBW7r+Wg//PWNPjZioJmR9Gt/n5/N2FEahdUz1DMM4TrmVXOlSHVZtNrM/
FZPnxVHekPm/vlFWpmGyjFfVQssF1Y7E+hXuFVGfVYbUg9jIbaAB8TX0FqPYt1s51Jc/f+bMVC6x
U4sM4D+QLCcfmimjLl3P2F+vBBlgMVJucdAgH4/nM68gHvnYvehdbqhabxBS0RIdja0TyXl9UBrf
UPR89hOo+eOcin1UJMb5CHymmgRq9gNeZkVisPwK9pxIv3d9aCmt6vUQJ3afGg1zA+MRryf9Q27b
H+NdaEagy083MqDZNVR3dAIvFqc+ckzfRu+9hOIcF5bUICtU94rih2AQP+07p5HAwbFzyZv9h4ks
Jc2h5H7jXLf5n4BFlJSSjiEtn0rR/oKRdAIjFpOFPcUGqJ4BJ0HHImUkddF8wOmWC9LnRLYU0O38
Zjd9Qfzaj85NZFM0NQbEAu4WFCbgCKR45S/k9KJCdzQIHsVZeTArZSXUIWcnNzuon95vNO2a7BBS
/h33hm9/Cw+rf8ON2YRpREW4DswkwVQaJa0zhicdJpcDhAOSSsXqz9YBs4xsiKgZko8VF2fi/App
vi3Zaprs4RI8J0Ed+yuKkwtvF7R0ffZZGPqGd4wdR+3Ur20SHq23UPpQrHXqcvQBBjsvFyyhVhKi
VRqCr5/JHGc42OO/RVNgHxhc1D0NZcl42miMjcdZ/oPNvauH192+5hIB4bkrK0GefqiMK+xcouia
eCVH1hukp5aEm2Cf6DSQtmYUPqRSanT/RuEGy2eAWDK3BnmIfIMpRqe0IxIsMSg2ZB4cAfquXTXO
PonLEtu1t55OY9on61FHpc41bt/Pm3wKGpH4XBXP2NHOe0i5JYwZc4s9W/xsAhILjnBc3KxtMUgQ
I/gV8D3AyDPwGECJzMFifh1H06aF2lbMO/eOREtdZp0Dz/KwL5LkUKysOcl+3aMT9ss/iUfYMD3k
dsun7KxIOIpgsN9XcczUYYj0Y4lNaOCdMwk4dFXr+H94i8xZJt6wZOrvs+Hhg7fbPW8HBviFU9hn
I9sEUFGwzXuEA9l8Yx5n3Qf8SzxDKFRnxJEehUVo6msVRYXcaL1I7l9mCAvwE32QTfFQA81da/q4
5OhWs4mL2l9YoKLF4ClA3n6UHyiKAU1oaglzba9ImkesJOcIqP8OiZ4zdpvtLV+xu8Rao65IsSGk
ytsUzAyV6Lgbg2o5RRv6LvjUh6Xuik+ZOCS6sdzCiQDzVmAvRCH2xtFQgufuxw4+Or8mtAQ6GUyT
hJaHmwYa8YbqIeFTgun3l7s4DMZ+qEITWg1d9ER1sNrNCSQotRN7zGoiUfndmhzQCGd++caovOiD
b2HAfw+RJRBrUunb+1GuFYgFkBgYEfNvX+ktpfTYy+P3eqeQR/XIouoUHeX/bOJsX5SxlzI2KLJ4
jX7HJMcrp3mwUvSh2fuGYx4j7dkgMP7tOumHOiwHqRsCJ93W7dXFj4++FjsbI2c2Rs9X9RF7ROKR
ekuezifCBFLR3GQYmES/Qu6Szd7FL1fOdTkNPld6WR1G2zNcEuEqVlVp7FdTYqgRBAlO5onBMqSF
qe1dlk/qlB20qF6teyPbSfHWAcwsuCdw9cZgGrvRyE0gXdGhe5R6W2VM31Dwn378igz5hiSV2WdA
juyl9GzkoP7xaLgqFhg9kiVB3FXF0KtYBpKcM3cvJThbrm74cyUdUB+/34CFj1jBHfkoVYZmGYsP
yXdGKoeFQHFa+FdIFA9BITJn0D62jASvZTGoef5uI4RZXohtsud7pr/PU3D3/+j7nOKaUCjIJvsv
NiImaKteweftWXfA9gNcHtUTkuYleI51LkIhoxguEBvZZCx7Liq/6uIU5FFJlVLWBNynATSAxxw7
FlPv8MaFzgL4NTHMLXP6ZBwVgI8WWbqojolXGAS3IR28VxMH5o0JfSks/70GsPd0XAJ5KOkPA+BI
KjpCDyngvzKoqKGXJJplJDaMR2pChKskUR3Nla+ROmTQj7NZmqiep2s30LnO9KX0heL35C0f8+14
oGRxUATAEe+CNh9P92cnnb9Nw3KrdBPWHIgSTbuorJk6Yvj2D4KIbyMuRWS2tv4kkcZJFKxNTJ2D
A/5j0Tb2NMdBIY4QT3gkXOIDgpChzXUgxyNsudoz1JAakFMlAmmCYQm87CLB7tUmabu25+/cpBeO
IQB1eKbxkHLIeM84lmh/adliiKbhOy1YubQXIVsSzMoLERmLs1fgfGucaoL5fy3+06vmWrPB6HxN
T1uu7mSPgk/IV+B5p1Z9z8Gb+3i+poTqyUaMvHVqxoKsfw26ATb45unIxuufVwf+mcCZ6VEP0c38
MklAsuMehHUfUAi6v4wWSsTMavzYpQLmKLIsYRdiotNGlJZOAevL+xqFPEQOh0mOsAdqOYv2/qme
RUj3mstMGSJE/AMm9n+UWx+blccIdyDFl1aLcAkJnFVSwKveCthNsF/5HOJpUhwyG4+COyJXAGk0
ylaxisNt4ZA/5pBj8ZMmYn1uZocZBgCqsj9DaoUQWb8m37igS6Lo1gTRiqc7wJF4f3sLo/XQ5nYm
Wunrahgpx5gIVKByVb3b0MVXgfufL8vzBi3jGq55yMVd4qie0uXJqCDNLMOyuuSKmkPH328Qie6E
uFQW/vKRUc/rqIvCoAHoKj3GGtdm1Gp/DRRHmbFB4tjphUHRikSW2dKqs0I3XCBeKQWP9AxZuJcf
kMyE9jVyLl1p8BRvN28QsJj/pLUiZ/Jqbguzx9VbIGAn8GcdVj6gKGPlSA69FFEUaaGlbnmcYQtf
8KqnB3xaexw+/01kRL3FtZV6AGILioKvdeaOnBqHK6NOja5M2Mmnr6D5YBPgAyV64aFQuF/DFaHD
UagI8/f+rjKntpZ+N1By38Nle4Eay99X7WWOL7DXv8NPVTCaS6Fxb3XVPCXkgYuR1hKifsF4juWN
ioeWdTYoaK5WBuggVIVSvwk1RIpDPNLHZOsVhyk9Ojucw0BudYJSN1NRStdawzriPgmR5JYrbcWf
EUfmf3F+3sA3WaBLraPj6gZDafHhp1HnGOYtWUU9Iidljb9rcsmvulwgpPo5juTF3Lz+ipvRF++3
PuD87Gq33MFYd8ZA4iNN7b4rKc9tEOolvnbomFUvx1lVhByqMxb5vV0JcBoSkmczxp9rIQM0oMNy
J3JZF57LL0rKDFfSLdG7x+e4/RxT4TMHDLmedGptAACeG50xsE8WdBhGJbJ9FgY21EUTJQsZSG0t
u0VikeRc8IF/m11f7S6cot3Wu0Dpdzjijiz6CtFN+Yefx1MhjmiFnJ3WPYwd2VhsmujKzqxUS8AJ
/GiEZrF9gGf3BYLLMoutaMQO8I+Z6GTNPR8LcbRtbaJ8Izan9b5J/UG2Xt1QGV5UkZMr6hYNkBlp
chKLpbbjYyokmniIg9Np/LykHsMczMPWSlITh/rntSYizYXFRhZhiHnOUidtIWi1C92JI8o109rr
t7jQL1sq3lMwc5EfwEkQz/WXqz7ygD3eSKLqW+1UY/BXi4FkOFvPAeR9aKCVvSE5oagSDqsms8a5
tBiq6gIXHzPRusgLKF1r5QnAl0eVY5tVAKDTIyoVnb4z49FU5klVrpuHwaZbHj280c8pTDYf5Nsd
3UE013CH0jSpTDo1rhyz785lfVxNujH+MsfotK9DsttS/Gp067uJwdgTbXCZc2bon4ZReTyA6pvA
fIcGgpGb4eYTvXrblgH5srLpBrrqO24Bq9c+eYL2Vq0UDw1weLXgAVEVK9qqEBBeAlLaZliyR80B
/BEt012SCiVRfnEQpoOym6Sor5QHJCYzCMdJnBj/kgUy/XNs1G7uzT4cyKl0nVGjYqqkmqWkvg8w
RL9AloIr3ETqLt9P9qJC5U0c6KfaM8GMTF5S7SF0fgGm9lRiDL5TATt9yEXcvaC3n1JTg0qCFWY8
UUZMyrAF8egkyb0+NQST8h6/APOjK/2/UkTYMddFnGdxnLF+4LESacErcFNCmCInjxTVa5kDWomP
xO2JlY8dVhuTxi7rjude9oljR8fpHicOaLmVQNmher0dyQKfMkFRoz9GrSpNB+5FL//F+iBIOm1d
HD7WxPEcWMk7kBFlpwanMjLYTISNWjeQW/LYRgDAAZ8c6X47wAVk7UoxJCSoAcIDtH4FfwkxCrte
ywH+a075Hnn3anyZgSIX4S47zxP7fJxXnV19Lwb28YfkF4HhBLl58R6/uXHdzV5x296nJneKP7Gq
OexcDKRDB9Mdhn6XvVlpyXJ//JatLkp4hvZjJIStPuu1NlZDl8KvyL/P13iDzOBmRhGBGuSUVMgx
3RbNY3jhbH1u1ZSDzeIWB6nhzaeSe6WZOQzLDvvxw1pFopszpDx9AZDl5eETemVVFVL8slHBGAjU
EBc64H1xQxkZyouR6pi3B3qQZ9D+6HfSVgSUniP5QIdeLmyXoCYYNf7YggYkXN4NEj4ISPSWtpFh
98dnkOeimqKsK/DIur3OCLd8BvTMHeZkkf2ZNEDcJq1GTF2j2Oj5E5DNkLKT2VOzlCg6Smhuqxnj
13mchCz3skZbFjkV5VyjAAyqc98T80B2NZt/kLDtrO2G5NB8QIB0Ix6rtcbLlc6aezFG47GGL7Xu
Ls4aYT1saQZFJtIj0bPdDZimn9H45WaB/DD0R1+lrBB4vHHvNXPM17E3R4WXTHgk6Dj9joP93Saa
aw1ZLA3PMA3BMsMzcn+RCvJuOmwV1IVk9RR02qG/dCRLdztLVoS35TBgI5MDMZc29PRmxOW+TzJ9
Wcf7XJL1vSaNWFD04oRC61zQEUPXWfekgs78P+nvE/Nazy6H5/B1gG5328ajS2ENnlibB5gbuoC1
Py9ZtrKenQbVi/YhO8qZIkfWIc3XhTI1FeKUJdHlbCgRLAnP/CWt/QV3r/PKsnSx8Ujt3MAAyeeV
3Lj7fGgmb7Db1DZjX/VHH30SzEqo3glKIPKWXT7RRaIrNr77elCVZcCa5jPhrMYwpFH1dHQsh94y
2bcuwIJZ7c77mCT531QQcjVAwei1G431T9FewN8mbEi9NaNNhJnJ+vVzbGQ5GR3/hHqm0gGUsMin
ORRem0I71wFbmFzjo4zcurwK0MiVzsMglnl4uGqQSZz1CY8sGoq6KKSRp0Kui7wvMdmecYseuX/j
KmMHb6I+t8ijjrpDAWEHM8NzYTP9JS36kLT5uUPWkI7IWoKnzSgw7+yIZM2fOI5jfxE6UevMzmR9
My+9/N7sK1ox6I/O2kagC93+EAr/3Boy1x+X/Pp7Q844QwYVI9EsT6bP9Lq0o/TtZDo6CVNv5CZW
JVQVrsywN/VZOCzF6+N1B2h70nx3kkEKSpQWcuc2W5en4QhV05HcBTTJ6sl6gQi0xWGvS3/HDDBo
URaUIe1tEjyeDcw0N61bSNF6NVsR19bBFDFr11aJ6Ox8f5iBLPmlnzFHhosGNef+7gvxBq7Zm7GT
Pu7CcA+QEaF1MFyM3s52avQT9jkB9Bf+kyQMGQTXmgpMr2vwL/+wpJvFumuKeMYv2OSqO/JVRkxH
VkbyeL2c5+a78RBuq738qfHb/yvc63Ek3RDY5k5VyBq3K1RzX3n3BzQ0dFJigtTkjh7UR89JRvce
aahjnQdLF24rKZpafkZ0WB+jIeDmRBxFqvwgCCNXfYzaPh2WPTmhJayXJ2ZQkdeT2Brp/hlLmjIn
AblncjnS8gbirdEFlIsXZ2YJIy+UW2Zt4EKYIchRU8FwrA6khRNuvsq3XLXq2MPRXzICt0g10YEo
TSycdV2bvs87tEmda1fQy9EBEfiTyjBk5Qso6lOdyX+GkruRYwTahUn0HC3MC7TS8OPofqDJfcMT
JfEWdwA/3P+MPgFVydWiWmkGzNuOPmxNntfZz+LB2rgynWaLAangdNDPtPfaBanjbT65D1Z5rlrU
NfN0lP2AuVQbFDRg2NyHORBGm63qbg7XIivwPznWaU56M3TwziAEH6zKWfTfjv7IcMoKLwCfd220
5csl3uiURfPGbgEpn6emI5D/H/8bF1pILMIZnTJUel0p2Vt2AiqST3oTl+Cnq5Bq7YV+8lLjVi+K
tavxbEvmXEKpzxdOfwOulV2pDH7ar0YK/KHpdLQrQtgBUuHeIy7aQeRjQMEJ9gIsygkJCGl7FQFA
4KX86GAEUdUYjvuFRTPa5akNyi/6PW1HE59DzFLMmpTinjfnXRf7JIctM+FstduSSapbOuBLLWKY
n/glM1ZEwDUtumMcgT/nq4K6PQQBFGapFZOAjrgZN5sNrxBQVzVS6JRtP7AloddVzhFd6C1Mu1RC
O4HGpBQARAGtHZGOOXNpRuCY4jivxEaMVwmW7ekeSCrjy4jdXiRAa6mKh6klBakEtTRyjliCzu/a
1DigPsBC747JLQ15NGaAga9W6sKq9BAFghUhNZOTXgBW9wEupWu+k+8B+ebeFg9LUOtdySAoeM/w
pBGj6/o63h0cP9yHR/L4wULX0+6+QGZdvWqEluw7sdDwCIQmHJWMZVi60Gf/Q04PgiEU1lstpHsL
Eddsrh4O/5EoYiVTsv02A491fXQs7R6nAXI5vEigWK+XLYxKE/0ZY7m8vkE4V0Erm7dv0qXz8J4B
bPz14HB0WMqHUW5qodkY2WT2CDLuNBl/XP+dfOyCcuxa5FPmqOSj/kyGndn4z6NmdMFx6At4+b69
S1FvRNJM6Zl6C3ZwOcNU9fpTfduqpXWPQudp0Ou+F+WeF81Tu6hPmLKfJhsV7WPLO5KRLBnZkqM+
DVXh6/ErkVYy0SEWzZ8WLZECQXM3orTJgLd1gkj9/D+rsnI3aXdeIWgGSjchJMs4iWEry/dOVHy+
u4ebCorWyNBzYvR+EpqEgNQJ7VHhGszIyJmp0aqWjm9msB7C4U7IUq7Y/gPDka0RbvXy4crZVCYR
gKa9aBuKzOS95+KhBpgHg88H2UGocjLk1symhiHsGVohFxF1vb4mmXjZFy/pUzRI1fX4DHeq8HcO
P8Sx1WN+MD0XcK0S7iglVSoL3JlA4VJm7Ve0a16nKf1l9B60DSN7SleD6vWQDUJWWk3CsUx16UJb
at7H9Z4Ux9r55++VJPUANR57jh4WSTIdfTqxF6Zsxqgk1xnSBS8pPsLwBZw1vdK46ujNVFh24gAd
XoxsQo8ZWwSGy0DtKaky6vbvXnk/TXljU1t4FX/KqJ8r3MDjccepDvYqXaHCnZj59ncImuXLMcsx
Dvleho8js7RpX0JggP5i3wV993NAT7Nes2kr/Knk/8JttGzbJI4XhkylmWe4o8ndHB2Q+MROp5hl
8Zp+slOxoSwXunY0Xq/+/eQ5qTFeSUTxyV9YIoGLx7bm7+ZiIF3K+Yz28ctg9/yBsk5iYNYIEtDk
HXpGvGWMwUj3GuaeC1DuGiCiQuGLRaEvoLRbZiJWsklMopNCuukIgrP+dNnNpwgqXOwNvvC2aIE8
9iGZNeil2/Essha7YmXbm0BAMwlgSA27sarAbOpDCay4UfjqG/TuXucJtP3A0BVCEpDhW+a/VZNE
DAmch1lfXcoEYGSx+p8RfuOi1CLOA0ib4pGlySHrKbhYguztByYt+4/04eSvw/XmtqBxidTtaAyD
4Qru49QYGJ8pJZyVbNccqyYo2qQw1KVX24sdPATQeC1YAzqWUc6z+su1UMbB2fypR45aWX/DADsH
mzIbWYQhNzwpLDuCw8ag1PVW5MZWfB335VYsVGEEb9mC3Kh2w+9aRStJiSIs/dwTFFgISHj7Oacv
4fr9tsfuZ4yXVywrb3g56z1NtFz+pxWBzbBcnCqvq+r17nhCh5UWC+qKYTvedk8kJ0PQaEDuI+S4
63aL9kq6x/Bzuao3RqviIIfjVB64wOFFzDcGLr7y7Q8SnCKpEyasANGI+OGF3boj9Bu6Y17mPdo9
c0SBPd7ltaMejUVKqiVqPU50UNhl39K6cQT/auKQqNeWu983hEMqydicWRHrtA6xz0E+2Xh3EcBd
N+h8JtSSPEAv/K2bZt1XXcllOgXs9qLcE2j9/0QyckDIjERKUUAlQzEcvbDRzB035PFOLk3jrNM3
ysViVJ5sPxvlylNm4y5Bys7QTYn/wM+zn8VQx5PU/D7NLgkd6jpO+AKnYZmxxn2Ru0IXt1TdXdYB
OIqACRKSzq4as8pq34GvFO4yTqS/6gnaa2p7Wi8fdlN4sxVBnBt3yvrVmuymjaDaJsrEbw2NfoIB
EaJKrePdqxZI0XUPfTfL0KA+ERR0P76KPfqOyF/g/8AtyYhD8DAHPOWu2TOHswvLHDLXWPQXGWFp
9urJPpru4RE5U6/Gv818VliGRvu4wt+k2lY7rkCBmSLauxW6x21LwkVRVeBtjU+TPDPu76BN5F6L
mtAfoZM4kw2/DpfepMjozhf+s4BWXjXBipPFVWGXkAlr8Y+bW4+ShmLzBACItNKprQfajYtCipc6
4ZsreapWU+EUEtagRcodiresKponWJsO19sdfVauJ8/HC92ffLE0v1GNevhzWgYb+plnq1cT4/ui
xKkwdAE8/MB0ultOIhQG5tafq7lSrLwW/uTXggtj0swuQMfIwBvHxUwWLqJan7mDPGCQwmUEVXai
9NYKm8Z5zVN7IrAaAEQFESmKcAIKcxBHtdUPJbNFuU0EhcAgEKc+DuqYIzNsbZq37hJhjTDZPEvs
l2NUf6lNZh73V87BXoxAfPHhFw5LTxva0if5W7YNIR/I04/yBjsy7D3QWznnCgUzhwHqk3+X3BKU
a4HYqEGZSrC1QrR4Shfu/Hi0/sLnxvXi63utCltOtyRJwGVQUQqBW37eAzyuFVL6Hmiqx0A4RmsF
a21AJrZGiofTsS3ljtX53rTZ6P2uW7tJw/NcKBfVHELj3BMO+hqsbiLC5n9nu4jq7QlU0jYTnnyn
nu46HFXlVp0/fzEdVPD91GokjWPfqAq4lg6SVxd36Haz2UwLzfMQJCHPqcsPHjUwIfbdbqVazaTf
1eGgXI4CcbNI4eruqHlMlPizOMzjC9719AC7tyI8kFA55eSiqO02mpJmh+PfL4oyP+MWyExKWHZ5
8/ite35hc1BR7oi/KC52Hor6Hl/6+98197DqOnL9Ey/xAZPOGgSyDp4hUmeEKIqvB/mShbld7/tS
521U/w6vxrgcUITw6MKivZsa1AQNsngjL8EbfvSzDT1Z3WL5Qw8gmWCuSx5tTe2ECuwase16qEKl
zgLGNhB65JZRLUtILvgxlRPbLx3PVNLL6Lz18ii65lwz6iezsz2mneHAobHQ/2q4xj/nr/YONcRV
wItCAVcFpClhCM+vQHABDLcnlslkmMDDdzKr9diO83zJpCxoOrS3clPOK7VM0Frm4NuTmsi4PLlM
4W586kKk8tG61C+TNhrJ8t5xwnR24W2qKzTk+IMz2MyGqkNR63dXYahUEPxYGaEYqpRUZ7dUWEN7
RNXhpl+qZlYELI0yb4mR9CtpGScc/FhXusHFx5/5sfvEZ53PLW2i2darxEg5u5mFMnZ+1DOmwb4t
/0BOCUoKvnEFENjm/Du0l4UbGvCsQ9lIh3SoFb6tgPjPuIpHGxCZYb3Tx8UGewxsx8KL4f5Xo14N
B6k5W0qzBqAt1xt0hjlBMEfax1VLiDPDCpuvlOrTnj/qMYGZ2FA+juJ9J937mufLeTbtM/VeMiUv
PfCSQ7FdUCuDfeBwoz1iBD+BTr67duDle852yo4WBzqwOE9C2t1RoQrA9UbOb+vB09pZGHsU7jgt
cUYsT15/0Wm0GWlghTLEXnZdBh3MjZDPB/QzQeFzrX3BfEUeuT512LsE+rjzKkhlw+3F0iWHvrVv
5dAHtlcO3m7XV9Zn1EpP/28zhs4u9XHZz6hqzA/rFTxLlK63xY1VT9cH85VNJO1KYVwr6Goxi5ID
DV+tX4MIGx/bwmyJOwE9N2hMzi/8Wq1mTnU8E1YCdbku30cGQGUe/fz6CKW9ESz22sb7EZIXFuzn
1y9ZE4A5CxnKp0Cyr+at4wO0ws4Wigy8ZdK95wkui0FcTh1RW/prYBfbW+4hXC6C3Rp4bMpAzqFn
V84fR1Vy2yhAen100AvsN1Yy1krzW5WD85y9xTW1hnmI/HK69+wQuukouuhHQNnBJrubJxQrcRJj
690tpkXmScTwY2XQ5BxYDg+K8Sxdt8lMCGHI81usOrPFLvj+Aid/hDNDCci9sbBv+VNKzgu4bDlz
JVcmN13ROWZvkghwnY+fEoRdCSfn/lqAGGMhoAy1k0Jtx03ia3oNzOz1ykSgp4vNxx79NN4UA1nK
WPTPLLOIOfrU5BYgnQb1rmZNScTED0JeLeHl786WhUaTw6csdAldV4dLiCg/pP9tgcBl9d7ymC0b
yW30L93ppdzux46hgUh0ucVUCfiez1Ei+bdvFZkY7dZHZF7hK68TwgC5KQbcJa5nGQLkQjden0sp
UBpPh7ZyNp9XRxL5msQ2cLoOtsZPWXCGTtsucLHFJ0q07KkFVUQTYkOfS2f5d528qj56AN/4WxRz
mU5B2yb/0kUgRIc0l+27+8YreyVBUlWveLewxG9Q3No/9Pazm96j6xScYijjOPkoK9p+CEMDlDiB
c/qym9+5I/NZGeqW2O8XpnGjK6ZEODO1m9IVlvvB4NPsTUfSgmkvZafpSmc309pW6m9nLBOL3Dun
RMQgrEp9WgWcc+onNp8NB6qVfs7yGsU2WincAdisnnTK2MumnnWOdIMI7r55YqzncDcCBkx7hQge
wFi2X1vtT54RdD1s6BVYHYHNbFrZ9dmpOuOy/wMKN7/5vvOlWA0nfmTnRWj5iIngq0pbAaZCmQm9
mo936BdAdb8it2N4nxlTHcuWScOfcy2HsO6+Lo1Bv6vMmbxF5vso9NW6hrJLa32+/A1JjWRI7BuU
7S46KqHL9/v+iBpaSpRZIazXuFdTeGdap+wKATju/2dxnxIs+hdArnfVwuao5sMx/1YkwK/Y4aC+
dQsiw6IbgsSkpYwsW4ePxnmb4HjK1T+BY8kULS4IQazMEHHtg3UNZtTEWlmi7DGKJnjUrWgXogCG
9jsHIJO0jEbYBrS3LvYnSQi8sjGrdt5ycDLOqYR27LCcZlEaJlmXornKMG69D7+WAWsIU1WyMRiN
4Mk+J9t4FQ4w8s3ocHVIs2zIxeYcLppDJDEed0DSxpscw6gt5wjYmsWdCNXZQFSoFnScrL0Dq+16
8n+8d2he/vRUl0tMCgBtWlP+mJAFRnOC85JV9R9iyjaBJkHL2x/nwTsLCP3NiQ5flLhBa5OzYikv
CmgVLpQBXB2oVzJRfF1bCap2dT141GHGUFsWRIyFtwZNCEz1aRmDV4CSCYdG+8tD6XmT+ScLTBFL
BZJ4ZbFzd+DAVlix74bPwrWbLUGNo9Rz+eScUJN3b5xfaNBRYtsylSg0l/2++kSKEvddjhHNYrlP
waDJymX+x/fUyweyB5aGxD7UQjWLHFNfkRQdgHfvT6qMPCkCrDZy2U8FMq0U+gmmJ/hK9xJ+JGzf
mylMM+oD95KXYli6HnaNx9SvzcIxWJzl2ns4H4M/xGAbWEmhf82MrIuy2+nh35p4r5qxe1FIV+RN
S6j7kBZaYBY2fEzeAtwbjBkp+eRgJxC/MQhNAgoZ16xiVFOWenNV/lfj47Dbh6HQmp0/mriarDA0
+aU5PTuDF5ygJj+A1J3WXua19RLYXLzx7t8ZuFMevpljJs58PAjUW2f08uteyFXfax4dlAhfCpyI
El7pjRrPP5kYifq4JPT5B4fA3Xt7qkzNBbIdTDb4f255+c6dIBui0EKNbUoOo6Zv6rYTYWpozkWr
5RvFFfx5CF68K+9NvUagBfAEGGkKHejAhcwMO0DkxO+IpW/gi3PvKYJH3dzuT3kYAzRsFK4t1k3p
OnsnuHQwYny+v06gs+2VQ+h31qcLdPh1xnNSjMQYS/gaMySeFbep2m1BrLSloH6BjlFQCs5z6ZYs
7LqdcJFhtbbcDaox0WIiY66qtt1PKOyDkjtxaWXC/JmFAcnHEu4l1ejWRhA8vCG5Feh++AqPPMCG
ewFaMdg+vKjkiNy0UY/t7OgC6yipujfdEYwhVHM7sIISOF5u1gJoajagPsnzUoCyMOBNf91qM7TE
07RD92u9C1QoOgHkDPaMzNFnzDaHaLwo2ehPNddPSweRbNTR0VOtbHYpjAARD+pDx6qH19srZ8yn
LarqTb2M10icwXhqKC3f99zSjRthje4Z6+xLdHRDutmGbv7B88tB+JGaE/NoFsRc733q8tF3TpHI
SkdXuPPX44zXFBsHO5or8WINQc87PDm5ITxwJUR/zy3whEoIjYpE2MmDp38MWU2SZR/XrNw0oHGR
bJU8Qr5GLxGyHEgXwiG/BW0pXWMfvv46iv2JLE4fiLEyiOjfLGhcLf18ReI4+Ey5p6o7yWDtc+tg
8lq8R7JUQDpDDyPdGCahZBWQafVpP67VyM/rJ9OmRxDJXTtb6aPWRWYy/2WlC5rJSVCrN5npx3/k
Le9DwQOPDtJIAnduuDAVPpzGLGyYAtXO+tzEJ+Y9f8lQBxPPm45AVp6SatIgwrXbhrjvaqg5M8CB
rkpReGf595G7kqyVIhCO1Qm6s76kVFyePs2JdJnd6QhDNbY7e0PWXVliKUxDPJpmDmQwp0HT65VF
DVmoS2JI/hTr5Q4eIkHqHoBwvuHtR3VLxd7na0MhPnYfNxcU5dG19Vo82Vr9Kf4VGPGv6n7X+dwF
cZa1ezZzLbI4uXcKfJUegaR/sGrB+gkcqVnOOyEGaEPT5MXi6Q0QQx0FfnQ6shiif3jMV/97oYKo
zK9qqEpH38QfZy8kC7v+6gdUKEJz48CrrY+HGSGPznC4H0yD4PUDpgCswCk9d0uMtUE818KJNRfX
oC9wobTl/njhh2hLc6qzXFZg4npbDPRORhqT8/MogQ3i82HMJJTRSHt8C5V6j0AU92/+R2lPEF+o
qv3KLpQOCn4hKKdf1EmzwL0fv3lGXlEtR6iiMaO5bVLugs4s1fObUi9G9DypSgCGXNSSRNjzyi5x
wHOxhQjd5QmFy58llnG/NQGRCxftK8ADF5lPbvZ4iALXHxKotNzg2KKOS+5GTA3BiGp8ITY67lkd
9dLOdkIySZLJrn6Ndv9q0KftQky/qVvzKwafSm0CsV83YURO9nruV59jV3xOKhwIizd0sUENBfRn
uZ8rvTb2gSAan+Ku3yYaYTXhdk8VbFYkm8MUkd+EH4R1ZaNMbWqkccXfowHrT1Mav7rl1R7bLw+v
oZ1GugkRtPDlBJ9hoSQWVYpU+jqk7w87gWOlYkQbBodFvFzRWX5EpM1D2PfGBO+nI2WTQyC33CYn
+U2FY7r+iSTx0BBPD+/mo2WRt89aK5nZMEkzJ/jE/ncBzTEG24kVIa4/QyyiNZXyn7Djjw02fZoc
X6qyuyU5ZuwqEK4gAc2tHhrIxY8az7HRI7TrCqe5oi9AQAwbPwzlZc29gVVZbj+8K7Gpfody1y0L
Qe7H7ysx1on9+DF2TdkbsN3PzHwyiWsIOQvO5MY+y/QsIuAvHceFJg7boiU7uDV3nYJ0t9xQdAzn
L19q2esjKYrlonsbH6lRgdQ8oCFYr+FOyiphfH6GD7D46ChEatPTPlqr53kcOs44W9bZBsrqFvkt
GH6RqRQlqcjdvPAVWfP+CDUkiBfIaTULcmlp28LLio6Iumw93C188GPop1ilzUdskym2mpIekMNJ
Ai3RvQj5pdSk5gJqtRfNANG9eVWKMMln3NNTdoxBLSEGWZQstNAMKbI8pWxAloIb5i222cUapGZX
gwaf5oJMOUk4Iiyj0XyzCBcUqUZQz572p9jTmLKlLw9g9zCYnJs1kVg156fcxCRAHgm59Ht6Zan/
P3hpRPG7+kXZ8bEZ/6kM3k8Udio1s+pHzjMDppXD21wdyaxUpBBmx/g4ADvmCQq2Vwo4kq2CZjNp
6y+uBsLFr2zF6TED/dPc61crps1Gaqy8qQEZ/o1mq5tXYtvshrin9MfBHDA9zHdKlm3jtr+sSDiY
Qi0tttGyA5fboBoQzN/X+yj16NIy+f91cEC7xr/eb9J4rZTbxuMwL1Y0tKJye5JUsktigHGfO2Bo
tU7kgac3EGwtJ1ToawwKP0XBWRwAOMr3t3mrfJuhxlkqLGM2HzP+JFoRJfFiX5JWJen/WfP/MG8F
WiVDhYBobkMgzY33pfLggmFcHkQLje5MxS9lVAO/SZJj2HVnidDjfhoU+sORODKK6pCWjn6LARjz
xMgHV5sC8DymK+Xotr03Q6QPyolkHxX2vWItcsf+rxI5OqhR4ZFd++1QqXnwFKh1JPLVs+bAPwtW
5ZErCN3P0yaDt5uEDvHcIW10Gu+A7+4bAlkd6yU/ppiZ/vnYAOy0qcPWJKvVb+G1w4xTLlbu2sTk
4/oHlqyazh7HTdQ2KYGCkZ/HkbtSzD6zqO3ixpmS39eXHPs9XFYwbsqMCGdI/tqO7lWDdWjppJRN
iiszMikPuabFEsUXM7j1yrXgj+tZ7N2LvuWKEwjv2vN4zpjaTrpjZ5LKeGLp+gtgjT4M0EtC+Lfb
irN5in80SRRQ9qKIp7jQ66lAyXLIJvsjtJwFKZK5KJsXZU1Xk3gsXloW1DXmq7RSLdBb6aMTah6+
j40+8N8Hoyo2G+WsJwfQWKIiFx4oNZ+g43kK84EjkYaV6KnYYZsTFhAfM/ADdBTw3RCoAlQ0ufrX
Mxyf6qYS4H3Q6Q5yyo8Msz5xFussa3BFwookcJXdaaP9YDbki+KmszaZY4eLcOG8/SMBIVd5XmKY
RKP+RizegWpUC3XtLIA75nnpzkVGuaqdSQ0/fz0v29N3FjoEyeYzJCfBvdtRQb6pOa31ghTIKzip
y2rDZg18bVGQri3XyEwtdLJebZ1sX5CAUN6KfmQmuypKYIKn12lQtep6gim5n78Yj0utheG0uInJ
9kTmwkcZHDdE6RmpgDTDiTyIjAsL17mEHK8It39RcSiGlq5szxprYttoT/EZ6odm4jYaWdq4Y9Tx
Llajbrbomm4fRMYXb35zECxPNOaEPkx6xPAMF+aRnLMNQmGZy+sW1CNHTNol3oRY9tFsDebwjvDY
fyL3BrvNnp9aaaGv1rWZ0A7du1G99op5JeOa7jLubXWDKH0qLcc1tprN1YlLpBFRgkZFb3vwwpC6
k40tXCNf9+cJk15qYCzNfxNYcDF2dEFKS81YazI2ugxT2suH0sYhr78rSTJ24INiAxy92G86fuN5
T6RUTfVLFSaP/9btyUhIEB3y1k157+sFyfZ2kb6BfivGlWOY8XTnhrkA5kh9o1HTS8r5TAMD2JOV
WKOaKj2xkKU2Zd2PVpncJ4s5B0BaCis3TY+q/MS7OkG0hWiF3uJ7TDiedTeN8OVblpx/1CwZDpND
WG4jjkaNdi96lTTBHvyziTBnwplPzZSoqodbDFRqUevdoZeRxT2+XmmoWdUwDxew9DgD2B8IOK6K
dXaK9fhOpY7toLJdgIGjatFzinD1xmR+H/e+FAer1EfjFu9TOqJEXMX5ve4PiN+Mj8WUupNv78Yv
oJAl+Y4Agcu3y5LWSaNRB93MFHduUMYqvYnQEbcAG+or4DZf2c3VD81XM9CZWH5XNS3wygZqzBUh
jftj923Rj29V7Nezd1v4kv+6UTYi5JbKw9ynWM60iBRH0Bv0g/1CpHKnxO1pcMAvAc9EP/VItZC6
b7zgb7dPjFkN7ALPz3e+R3agQmqlxL4BqC1MhlukX4m4qAFZPWpDxB0hjKk2keoH6ou3hKb6H2KN
lxDdePZe+suFUBu/TapKJ8P6F70IxNFCOXVqFXRysbWP0gy9aCQuINki7rSrn444PoSPWYPlA+m8
0VD6hg53cs+Z6WQ57w8uqJHT/LpIybH1IrQ4E0AwniwTbnSdOXfdHfUHeT2BTpJI0Kssvcnpp0fr
F3RWl+v2rcDZgX4E0aV5j25aia8mqY1v2Qwd6R38NgveTAovPNk5ay12D7peVa09FJtG8TFtdmh1
priwQQDZ2k9Dsc3GHkPH/DQ0AV1W3jpDFpTPOvPSKJ59r3bzwrtAh8egGXACDQbOtdXE4maxzsJC
mkxPjxf1Pm6yV7eAm0ZX1bFzgnMoKfTVSNJDyv8qPJJQTsP1Vd4/nFV5HBN5//8sgw3ZyTmmT3fx
9cuboBAFmWGmoHfksa9ZZfw9oK87LGxzGvR6QhO/hp/tqzPPKp4JPlJeP4GML6yepKWs/NGYuIpr
M1gWK0gRDh+e34AMOTMLkO0KBZr+eZoTFOII0FTu3WtdbkBvsNg7fqe5vATwXpluEUkbozhR4HWr
1vtlVD8PRGh91w3rI3oDY4ig1Mn48EoETWYEuAIS2o4j39FQ1eHR5wN/XTmQLtLqEwTNBactb/Sx
0XKw7E8vbDAxRamSGOZsAO3A4vlS/zdHguc+blM62NDH56dQ4FfJL18JBexd1qELhQBZih8cfzWz
3x099IvXrKPwZzIXWkpP788iyZScfdQBOJx2NKUiGccFXXsFBhiAzjj091QQRjahgnH7DiUyx9mz
eXh55uTO3uwhGaWXMmqaTfOSUDjxlxzMigDnYWSJdUc62ajSZ+kG6V8/vjdxl6CRsvwSZ8AXVFYR
lPO2B9fqvWqqqAmnhRMGjzF3kDmtsfyFm3JbIuufEG3Dbzgn+nTw1dn1noX1PwjYuBP8w68cgfDL
Hh+l/pIS/p1wqKpqwvMigfqUlrZAJdzs0B1k/7k/niBjfuMtWh80nUMLPCZk8knCl5+Y7Y3zTZpH
iM7moFpLFhr4IF2WjDGJbutgqQiCyjXHghonZqw/TzM6ZXPPnuxhbZwbBDUi1g36JLT/aOGovVQj
R8qRAtOO6JVQG2ZYaM/wZlwvJ3OMmpPxYvZEXchlqG5k+R5Dg9FwGaPPTIQiNmkYw3PAqzVvicGJ
8gatX18nBOsxdCNn0dZvSxLiFmOlwco7kQ+FtHXG0qkrbh5zqV8751D5hOLCTKeFyfwwC26HhYwL
0qxAkaVgy1E9guYJi4jWdo+DGtHymwke2wYb2+bsyZhgZQp3mldFUgTtHqbL/crJxVWqhXH1UkdD
8krEJJ0Aag3363m2tf14MPiUid5ky70GvcuVdjmWVPSuuqGTlcHldp3OgDsnINd1ZgMdIIq5wCE0
5gNmXGtahbU5iSGB+MSlJm1OAVQekWiuGdiUQO4v5QZECpIUEVjvjtuzFbp0yu3y77gawkQzUASV
dHMwD6qB6JoNyxJ46ZNLPyo7l+yYwoJfYBcfFBXXfm7v3sa1Q2xeACDNZZ/RAZdz/b4gXZCXBvUl
cz5urgjAfM6hdT+ScjAL8/p0FAWAutTFBT5bpxuumJ8SNNJc09NhET4vKpzEVqPSIM11Zv9x+agY
i/csA/xhNCoGmffQpoLJTecVmnuhSrH8HS+r99XbBq93oTybS2ucXcbsfeH+3gLcRu1aknZpRGFf
4evMwqZhnRqm5xgkl1T4HK+jN4tZXbWafWI+h7ldYdgefYofbULWoZ6MxET7pIGb6AzFA7PqaFUA
Me4uGA84XSDjc+g/Fns1FDe+IQYUTt67EsJ09GXMUGSNmX8k2K3kzqpdvb239AYw6dlf6iTyOW51
xqw8yjPvsYUIkyxnRroQOlRV5EWtpBtOGumHBCQuCcESp7b7BCwNMnXotIWdeitVeQA1himaz6F/
xQn66BzWeUHEBo9le0XBYHCl8Rhl39A+CwMXIjMEAZkbBTNasVFEVu5lkepHP7U8o3B5oEqfUqca
i+i5OTOoRCPf5TlEuLEBcSY16RrvuQuQJc/p3sqfJreroeL8bw+HMO6qI/Sxh5KqGYxg9l755oKV
xkuCUteFtPxzBgre9yExVTy8ceHGSqQvL4RrH8aLrtsACLGZ3eKCgBNHjJYTAta/M7+RPkJ8jwKl
PG2wSU+3wqLhfwj/55mH1gnnwPnX9r39R+aJLgAqrjcyQe/heuGfBrOT0vaJoBHM9VbQegTbJUEX
MwxGo5Ro5fpYanHZUxV5m8/Eag3maEWZpHmGcSe05oY9FlHJaVLKci9hTOsIqCBUy2VFU9AqZyCP
uNo14jeZDXNxgOUa9cfCZrEddBlWJ4LtTQVzZoBXO55+jW/WgeZkxVqO/F5Z8dqF+voS+zImtM5C
6nG7mLqnrMmoP5DUWF4ly3C18LtNChx6WmgO37jGdTDdCEIQzMVp0E9xoMVZBjEDhdXW/QrXz7vs
eTrIZCb6PtbAWloRSYKIvZpLbDRx92qQGmG6rn6tLUmnc7XgO5IclULz3M7+51rnSj5UeOOxQotC
nV0t+kRShtL8nDYeepQM805dhS1nEujtRq/2u+RI3bg8mlSDhuYx38qnweCIUGPXH8pFjm0HyAZT
fRj6CyvtK0OgxPlI2CuHqqYJpx5ICBgdhjp/t00wUPEX212E77gx58Q8H99DmEFGIFtgW1Inuxsc
D8WIdR8Nx9jjNd4TKvF02eWqxRp0sfbrKgHx9nWqO6ck4FIZdcmuHbvFpBX6bJkL1UAmH7WVGgEI
7y2K3IOQOYLHI8EwQ+Dm8YXiRJLXQGee/c4tsDg+R35u95TMRl1yRsOWje0NT53ecCCWNAAZI1LB
ygAN/GAQ/r1dMbOt5um/C/pnZJbytL9tewLXI3zCtb1SZvcw+qrq0wOR28Pp93nqazRNajFAiqUj
ogmEuLcmqWG7une6fdt1QFwBNzBREx8ZIY2ijAwlnsk89F+cmJlvID6T97cBzRge+nITB9CE5yrB
7KDgLy/L4+EWuMmdbiXJw2kNNSKKvK7iRG6MkQUQZhBpCsgIbTecgGXKr3f3EsYjXzqqomLzSIYL
erUhb7CQc236NTNMslz1S2GhmaWTlowGKaebdJ6+Vdk1I3f5erLUMfEGsdpF4CwxNW7l3qdrVeFU
WS6C1gt3MIorqp3sKw3tkEVCUO5QsVIUyG/hn32EQL4KrvEif1WgTruQRuq05gWRNdG9NUihtG/w
92HO0RnCxOC3umue6/BgjxqBDusYxLNNPdhq27oX2VHbZlaQ5CYZntZY2jLuOBH3SLGUiKN/K+Dh
EJMAZhxzNesRwr+/WDHfOzAhLTF50IZ10wtx2/vFdtX2lSyDmj58otSH3jFS7aQTl0kpUE26ottV
DfN9UOAK1zfgV7tozoc8ONptEnDFf3OMXObpPBVWNgA1OjipzFbHkTLJM1JxtecHKBYTEqWSdr8Y
9ZiWVfPwmlHOoQ5Dcrde82Iye7X5Np469Y5lfC5lEulMVYyKCpdnk5nte41V95cIxQtUyviO6S0a
ORC9w3jVFGlwolFZ1rVpp6SlgljF+wf56qrLYHZ8SAuwaDFf+lXI8Q3aRj6NA8PCxgvduCkR5sfI
OHlYYLbb7pmtXrLDrYB/UDX52eMjEXM3QvW3LbhuXDcHFDDok70YMnlN4kjpy7+8K6R93oxwT5e/
E9w74HpTPMkTP9XndIOPBoDgagLJJFVAuZV5k8PyesJ7mpUkyCHREF5XNQqO90AmKzrso0u+KE+Z
+3ODFI8fHfCKkfho8U8zOZ7Lt8K2jkM61OX0G/pz/EqBihnGWd6ltiVczG6pUely+gj4GM7t7yy0
KmpqB1GtZbp5UUyFCRUyzOxQdC0MWkazfYu03EcD9DChvoywafIyzcnScas9fS0BUJuL/yPko6WG
kMWt3TwN66wtkHLC6/KaLvc1yL82gXfzsl5iXm127hxQQGdil3bOxQ5gvvtiIAvBYnB9WNK2atTv
4ysP+c4vcprXIj/4XOdB0DFVYzGEmYQ+s6qFA7NjqYANYTrQ3U7ruwVBpVVXQpL7iY95+bL7bp63
hL1WxhL5ZeQgK6YBcMhZjXQIRs54mKVpm06tIA+7gg6yXr4GRF6edNNRMgBEB55aod15p0ox6BrI
lzzuzAc9wbdt7A+FOEmAkpIK8wuvutCqfGyeFCSsenJaHzySHINWJ3MDG8dk08xT+ixTLixkWnmz
xFqo9apj6TZrLyFey3s/a0NxLsFuRWEupK2Wfa3WLH/JQ8oN4sZJi3tvmLl/BWvwrWg9WjwDugFs
yZJ+XuHlyoo2kPkN9XxPZWyMpJa+qhAHVc+6wNf6Yon4sTKuQeqFxMeO+oPvaEIcIWZljbb0hTrK
i8IfO2RBSJ2YcJTHsYTSHspWeJ71gAY9hZgLaB4d9NF2avFs0ocCJsb7Y5Bv08TcDoc5Y1dvgkhh
7gu4xjiOyQtpHY6i5oogTFMY5AaZBBPvk6OjQKcfE9pVXHUNh/8cmqzFLkqhuZOaHlOUEmbNcryP
uePUUj2+vBl+H/ioX57f0h1M/kIVDE4YQelmoqZKW8Kk1Mc+XUQr9GKSySacjmpCGTcVRod1xU9o
vByWsiiovwXDNsMQ/Y4ADWQSdTJevctpjY+DpRVtyaTs1YJKbdKtUVg1H4p6QxH9vKuG4HXP0ZTt
q1NQbvWdU0KJ91gxjF6mX1KQvQVqPDEgfaSVGMMbs1SIW+GZ0VlK4KVbNsBuJSLYadzOdfIFZZS8
XZ8+iYVRKsETuFoPCsgNOkmgnn+gHTFA6hsLRmm0p4CLQX0aKiWmHINupQ3tyHaFoxsIqxlFPJQo
eC4B7UKzeN417W/A9HoY7jc4xIl48oANGjthWII8M3PZRwyuryhKqez5b+QZ5ak8yMGbAD58f3kj
ssc+emSWEmsO4fqwYxuF/RiCHWWzGJh0skmZkxGjfsq4PJdGo4UF0Xd9A5Zz7m1/Cnnlyqww89cZ
HBFktKYTjXQKi3LoS46zFnreToEvB4mmv5rI6eFwDNSjAm3ZrIZIYBbmBFqCcQ9brCkVqNI1BPsN
F9yllABRYZyZunsrJBw6+f596fY9UIx73bDnJGONiQ65/2TiThPXs/3WDU1r3YAcF1V5VI7lNyNa
dN8Hw6FFy6URKJtRbXFAn1O59lgGCVSMn4mXT8ScDQ6MHffmX/FE/xEVo+TrP+XnEPdRjsTRCSQl
wlIW3yZndCjYbPyviCXsf9RYM/GEzNXh4og0Gp7Wp6ebvNXcYBCIeuAlaNjyb8vXX5aLN5AB8iep
AqSTA4qBJs5F0Ya/sgmoPQA60zUCfwOPUq1qYdu7q8fNTam7irvajuZig8CSJbJ/yd9iZK0aAlkb
8vFIMyAHkftLJRPv1hYwr5fQBQrlNY9f7bw4orafHZNytjZL1tY5G1jVnZtCTPH/F5QNpg306J6g
QeVBHZZDFRh1VGytxbMZzuoV0K91TpM1TjvVT1z/2GmG877q/FFp9LRWkz0ui9A/IQ6k5/nmQVLs
7BvqAMcImW4VBTHFDd9xAHh77BsmburGnzsovPnReeqvUmPsJZJGn7X8ekA5KrUK0wjYbJh05mZ3
TVhOiryhrLCMCnoomkZE9E6VWPrDP6Pyc6zLfiFKj3HopsXcM7/yDNbLQ/MeOZMLFG7ZUi1G5UMR
PI1AVGWkOJ5bdhfLUMwEbLHH+j+kM7rNQjErvBrMvJ2oS/dVTMUqjo940TAgxpdYuZ0QJ+zW26Qd
kEQZgt6v1zt23lZ3/LJdSLcLYqSgdpSC6V3fM8/l37pHnprY+LscCVdj365y60lX0tUVqfrK99CV
8G1In/TV4sxhCxTiByrhfpCSKk+6Lthh3VOu0UJbAbRM7Ja9jeByv0gkRg8tuaS3vFnALkFkZVqV
bX81tUDPQ+SoNiwtHDFebH3Sjrre2Vjf+/EagzETH2sVceZpCeW/RmkdT5FIOpqtFnx3dJVlARIW
4eh/bJqk8BXKeWGRWiWVc9IQNpdt08GQHfmjRtBlmVnzmwBUN9XD33VKi8z5NerH2zp7K84zzqZR
Uo2uMctEAI0D+k8oXz9tSkMRa+yU/Mr97F88yYDC7FE0DZvB92jOxEIr3sk8G5h35mF2f76IXEhw
nJqKmiauKRLiOOY6u6RJ4jZYL89QGUQ5t40iYVOo9s1mpP5u2t+roJ5wcdkbiZhDmPpL3C+h3rj3
Rm+6RXBktSDXUHchePL+W9EqX6aLCc8UQzJvvBzJ3kzCc4W8SHokK84Wbi6LxNtLzIiWjtDdn8vK
BfQ4CJC4gKgwYXHL1hLBS0MOoTKhnHmPCNJkCaAGreBaQOCkY676wB5vV8u86yngfbm8XFwvLRQA
yZ7CvaukTPQmCm3zzX2XxkqfOwKtU9p5hUInLgPvguH7kpsotgW80q8pcJBxEvsu9C+qmAhLRcr4
VSAsH+t0R0iYgaYpT7TJqvxojkkz2pFVwJsrsmfsh5k7bnG/CmtMhZ403SQG7hOC90mmA5gohh9G
FS1kSO8jaiGxs0jUxZ+NHN+1QMvfV4ZChMPx0YhI1GKI9uSptRybpRK/DJ4fTqwXw3Oh1OP6iIKi
K2sgHMR9lJadN+pdQueJ6aahtKdJkqiUajWHjNG0ijVZAxbK9v7beT9KG7uoeX0mReK0ENBHs25x
rJZGty6jUlhKsf3gAd3vcbEyAN9TYEtxws8mMHVo4ohAQjvnVcwRph5bWIOsKKknJV/4JlXtXMyH
h4gj/f3oq+4EMXFL65VYTi1oHxwHxNN0PVFgXgIcM2Swjk+Ratz+HXF4ZCyk5mgCkIR3bZx/V1qZ
m0RxCzP3HY48eh9NOiWUVlLkwfnleIqtMVp4qyKfYtYaEHsNa5vTaN0ZsvfltRXhiI4F10b7AJR7
TWgFIc8yjJhup8tARHe1iAw1Wcf7ztZotMpw0xwKooncjmygvl+5bHubS6uCm7jCL404QY5cfqQd
SG0t+ryiU/9CNcXpnL6y4egOgFVDXCltyXXThVg5/C7Dxw6H6NBNwc6SBV1LeLz4jc3q+JtGCbPS
IdIehBtzZA852exPVbolp49VdblWclJV0YC+WJcZps0iLwMsiJTn6J19Flqjj/CtyFSeeiSHKL5f
ZEDf0WpWfXgyq041o1RXQ3ifN8ZKL31O4/Ol7cZnj2c7bw9OP9704bu6ILyiBJPydQtdhNL30k5Z
PkXYIuNsRitpNXsPlRBe77breewDvgoj9Tj5IFse7L4HNDaxjdJHS5LHsxMPMXXvlnlOuv4m0vwS
XwD+mJITYO65iU6IXLTK6DImVvGs8Ch1xqWFl1DMP2M0x/rNa5gizZ+lP/qfsYsCT6JzV+fSokqn
gEAg8+k8RbQ7VLwcrkgIv2NEI8gfmN2zvf2X0njZwunfOXjCTQxvbCSeyfV6TmfoQF97J/dXhORN
sfVGeL3YFo6imvZHIAa4V2/cb70VnrBbDnZMoHVjkrl+XaAE4ynmliPfvqdO7f1DusiZS1oGNcCl
Fuu1uEGVEyWIHWNADh3yXtVy9sPMafacd219qp33upTAiieLbSlslCehgzFaQYbsRuATiG9VMU0Z
JDnHzMZYhcdBbihqpc2XtXh3K56flKVXSbDJSPGC4lFvy6G+KkxllHiDFwD3QzZMyaFk59WkkNvE
n7LFGgVX6MRcNTi1W7VPBYfTarmCXH78AXCD8ltLapUSC1Ha0Q3ES5UwLH++koZ4PkGWJ78K2cvV
ml22mrTziSpviViwJ14guIcib+2A0TOok1ZMXroFsNBqMaQBYktwwmlwUTJEQt3wiH53H3Z4KkrC
U+3oVrdlCt9PoxMN+xIl8VU+WYxvC7P5ZPG85WU7uZBQeTJ3k5zCTlfGc+5icHrfEYt12RLsI3vc
W8pW5oRq/Mdq4vCd1xGfONFxnJ0kJYqek9NkmOTcw+/KAsdGjnMTB5BIl12L210NXDyWOVvmKIck
8Kcmv71+umY4SY9iu4WvPojzIzcETP0d2cl4nySjLwgLjIedTiiJQsQXb3KIfsBJRzXIqm7G4Skk
/nwcagfUBs35wJ4Ahf377u0QbN8R+fdOFkeRln8JYCTwPGOitC/lnaQe6juYbGIPxw5AP3vjfAnU
+JPnq09ogIG28L8b7QGjr6n/EZxxb1BcKlAWznTNZvlbkiqFfsjy8EByy5wsT348GFQiAoR2nY/e
XvbMa5r4/X7QLbcpCeh4EalhUPl2/C18Pl+Hjgm+cEctDoZTp1gpfrsXz8tEjEklos188nx6QLc6
7AX8YVmmKQlDQMnYap3difMqnsI6tUzhA08LPboIJwMF+ImumXQHvHLP8onAesy+SbPX9aSxXrM6
iIz0Wk5wYKfK4RIkqLE6wZuJtwGxXDF07Akhe93w5jVTVsrRvICgaxv4XHFXxgJj61b9Y0eouziM
tX0wUZnsYLsYugIcoWWcCK9Q3eFpIvRdITQedZ6ro9IFBx8DKqbVbDed5x4j+8qNkCqv508lpqMJ
NZm/iS27HmKscxpFhKv3wt5NbyllVgjWjlUwChzTSWvZr3egePhU2sq3zTyvBF6XHRYAJL6iIOh0
0KzzQVi1R5KoDKODlckK/kxu4Un9Sqp+y/trgsB2VAtd+VspXsaNMpTNSGP+iTY4FznvQJznBub2
AwS4zkO0EXncUCsJBZxqUHGfdx6ZUDClPLV70wru6wVLFZjBtLfIiW/rrXmks53j3MspuIDmGRlp
M7xBTo/oF9Co8LRprbAQr9r5TXAvcuxO/+1959byU/8lImdfV976/QTm/VuyMPYqULEJtJT5YJIa
O3j3NocnwEK0gkjocGTnHgbq0uEHKtzTFAKc5kRdhQENS+r0U4iSDKQ9b9g72QK2uc4pcl8+/+40
4TDpphAxQM73WRNzlNwLCKCwRk/LzLFsqbI64mPuN1Zghad2ZiiQUSi/SgUxBe4tU23kqU41374f
YBl2l5klaFD8vHoHUMUMql8uF9jC0ZdqMLQNiV7dR4XePf/norybPsIQNolT6ShoFxe5K/M8ieoT
4DLZMWXTcH7rM0o90j8qGOCEPMNr6HJBdm4eo/m7lujXUH0WG0IIUznMc5TuVPWw8voSQYgyZLgX
eNGp0TojQznS7oH0fKmdH2hM93J1KIsf3ho2kxzaUKrDlujNsI7E9u+A+xldSOHCrNlS79YiorMJ
itKMCntbrE6rMqxuCNwcWLVsMeMYy2OEQVKfYAIB0hSmHIEVZfySlgj/5V/XjWHLhHFEnIe/vYY6
cbe9OKP6apGw6KSz/i6KtNsvhPO4zHfsWa4h8j4JTFttyEjjI2V928l6Mu/zQI4ELw+hRVVHlAsb
R4i3XBcYsiTCSUestmUPWu6C8FncDyITW8fBPgBP9xo1b3hziug8VubaRYF0Bl3lnwHLtG3Dfg2l
8/rNQ5Ztlo1VvpQWj+h7XHnvCXMOMAAE/dreNR3eXrRGLFD2+ChB+h+hLjrB1vYm3zyk4+BfsF1M
tZCMtKzGMXWlUMOpit3L7s77gy9xGnXVDeq2jsU7Moh96KtwPUN1pgVzhAggP4mda2uORqMwwZh1
5nGImQWoMtUE1Ng/BPpoiuDXKyiPb4V3j0noi66IVxVcVd7ayCL8Y5+eO4VXVT8kEXREosXoaGLR
f3hLdNm+Hds9xrQcLlHUXUwfjhazr3qbqCBCkF3KgfNoq+8TjLtZBhrpqDMScGcsIKX2vz3ZTvL9
gmziFcK4arJapWaFt03HXEp35J6HVh0Qq8kfGtlAtN0WMlS1WELzoJXmywlLY1fNMh/m5cN618Fz
Nnxa+/LRRFMpTOQhQPXQ+fsBRmkl1cb94UkJ0Ca2gBPWIK+HCXbDVVmbXgp1OgTn3UxRBjkdmfzn
t8Iuqpi4Efq3mpgZfj8OoZETIL4OokEz39difanAXeWdaMxXBxciCgvKMpjvrJjSjVY68Zyz9S4R
0aWMYg28dciEfJpAbcEL9LqdBvCqSO5mE3SFP7UqkUjt3WUZ33JJYBgmiPmAEfwKLqxzRu5hnvrq
e3jt2TTmYktqq26XzOjuMx0BImmFLoqWwufb/y3r5rG/yt8oUuVTYsblDJeQnBxgWLRz+ONFvAd0
Da2OqszSNT8T79dwjSonIsQAjvUAlOREG9srtdSnB/V+OmfgWyI7lJOjonlpM8w8hWxyImQ8Y+Yb
65adq1jMr3pPGuF7BuVcDHo1l5o26nf11oPUKT07F8+3u6prU3ktU0ckyhodk34eEr03Ww/Jix/v
z/jiZepG7Chn9MrCpHvd0/GIF1DqoiMBoBf3pv3zv0SMmwDwFeuxOrAeCWEtw3nbwEafmcfxyYi1
zWwPcPR97Ncq/SruiackqI03J6rlela4goIvXf7LCF7bMoZJtvBBHvOHH0ePG8k29wiHaYVK0HWe
Ll0q2zL8Y02tJOmwo0zx5YHozSp65gMKdoDhFuioOeJzOBHfin+5f6KvJKhsxg6bmPKedEU0NPre
i2JGsfnNsEOgC3N/n0DY5hx+PaFZV9Jn/tBrxJDt5F/tDF0PGm/pn4+gtiTbpohu6qHf9lhgqPHq
qelGGK+Mg5+mdnhTNt683F2R6ZxWKZ51rTDQAOUGJLOMWY5Po4MtEhRDb/BROnnD0eb7z2Nk2b/L
Z4WR//0uJfzmccQ6DOuGe/+1Z3zLMzfhCb/Hg23FIPnMZZBAqDYyijXppdWS8hIOvM7uLcsYuBH6
zmWjTfaR6CvazFVNcCvXNV5lXDMgFl8S0JRJZzVcAEV8osJY+S9nKDrc0hPnKLULMRBdNsnZr7DO
z+8AqzujJhOw2cnZRkCrB01IjKhwiMar/XaRIb03ZAu6pEfE1/3S3t46AVg1WUGpe1gjRibTRPH1
tbTBlXbQoDbyYsSUsEmO3pyKpOn4DWWY97KPNuKaAA+O1IGdacWwL90B+tuWDBWUIa5nuy9XcDjU
sSUOV/eMrwAiO6X6IHKRPtY0GD9btBSqSIrkCDm2/SSeJpTr19EdwTr5NuJbtKCiKrS9ie7wzQ6j
i1sAXJd9WFJdWH1A5104HK9CM/qH4tJ+aiGZYHBHS8FT3NzOPS2kpvT3FtJXto83Xa+M2MNWlgOw
PkHLdx94GcCKyNfErqJPq5k2zjBXdkykoIIFWV8VBA5yTks7ns2lXV+L8eY3dgI/CkXb3SxmxkJf
2m9jr7vCMMx3JIXMVxa2ctLp/YPWX+BvuE3zR10rigWxKVp9w1VGAHQz/PQRhlbc6EkKZKM6g4/X
WsBLf2k6+hG1C2dmr/GqsLJT+VjLolibCUS0xdxGzZe2/+ISmLy5IbQr+ErBHeOlo6mh1iwSpDo2
NSs5Bpz0EUwepsoG//wRVGbzWe1fL29RPC1gh98QJ7HBEWaEjvv/VOEAVQR0pQIpAyaw+GE5dDHi
lVMv/G7/KPI6cSDFa1p3dzB/ELTjxTGQyRunQ0AYAk2ePEpVRHF1V6rxa2W0IB3716109FLLHQsq
KYTHJmC3doPnohin4qFtIW8xYET/NFTWku8/Zn+m7tbuxdiA8nNwoNN01jq724ivvoiYrw3gH9eH
zMWtnPTZQxj0EkdML9Gb+8//yFVCQ9KI2jNOHpHuzL/C5H1xhVVcECF6vqREu1GjbsSOTJ5pDsOQ
5ZHrnRtqaR1pseGw0nQM02DHu5F/ulBL3DgvU63Aw2UdHn4l2rOojckq3UhGQzWp7nK9u5zem6iy
tH54trqVquK0DhOsi6n4ob+jv64YzJwVgaQ1A+erNN0Fth79eaU/WjVk7OmKp55lemXKnFe5+Rkr
+R1j5ltJIGm1/FMOsmtn1PFn5ViqZ7V9cosKy+x4WBQxGeEb4bEgFS2YXAsZ2twunIWsflxS7PCu
YUlFlXd93T3lrV9flV1EmY+vHowDLLIEe8tHSF8srMdsXcGPbSiL1OmKJROUB/9tIpYPhyooMBU5
NelMzuBI+F8RrnIsdrNpsMD40oLF5D9yU0Vdc68GZKGFVgWe7TrOaa/aerBUHxYDg4XI/nPkbEEq
DbcHTn/JVZpFl5rVcVPB8ARtHPAgKg4LDPAYer7r+2ahXnBX8QbYrigLvUsk/pznqJnHb5IzuGc3
Hmn8Up6tvM+g0ymsakOC2/fmfUhypJuvu8HEDD+kEDNJ/+nDehUR+7P3Fbbrb9eFCez0lzAlDaxO
EsBOvhC+VNkGx8iKQE+YesOBbNnKtq1Hio4MbsFxsVdmbaSjsqHY3LEQbO3BtQhjuvQqgftk0pNL
XFGQ/XkvraZzivOOt0OSVefeO6d8stjf8bT8JZTdTx29meUVcvGBcJ2QDtbCLwrSRLE8eGveAjFB
ChXgfMbg8JIs5z4OYqq+K37475uJErvOZ/e/h5dCQLAUDztDgo8ddrsMMGsFGddrzoKtbAML3rhI
2m0zRV3glPZeivxteI+0R8CuKxl/Dm+nMaX5dyFsw2kFFnwpu4BPCOWN5HrdqAI91Uho8ABOA7MO
8ziFEzL4qyYFLVqZUXFWDc5v5ljkFQ16an++iBd8WU5geFJa695lDh1acfwCTXq15u+mpqnm8Ni0
rPXxvjFWytvacNOHgPydTj43ynRHtPQ/kV3HDEEdNXyMGfhXjwufbRRDYrIxNOeLjVtAjbAoouxC
QQAu/b3rPPKv4pcVImXFbytploV1xgGjn0co00B2KIyKfnr7V2tvG4sEB+lkOJ2brPfkJmI21+4Z
jLIMHqzsYXXogcABGH3t1Veve/tq5MR/8SjIKwdv8dWzKYJ+W9SEf+7GoJpBFk+f0pxlqDj/r/oi
7NIt/hHP739RSu49VDN23ogQB7bM2eEvZjgtaXUGmpHO+/5XPta8BJkJHIK3DdBXVuOXrxjRN9Qt
JME/GnSNwvqmYP8KyIVVkyggUKd0xOucWyN7RYjsXxidbT8/rJLDC7ZJ0FE0V3bI+OWdtRIWhkOT
4RVzBFSCI0BEebfOCf+YcqigrmQtOPJl1wB1oONaEaNCLyVKwnslwqoydOejSSP1xZhp/9MrdZyH
wrGT8zzU0ph31yw0EQe/+0c7lt8ORoCrIX2vNgww3SxExZBjyRRyycPYCG9zFDeElfIW6AiM2AXB
i1oOjAA9ahhA2LvMhAiXz/OcfGBojyP+FqYO265ywh9VLyEHL0u9TJQ1zPOtfaPDJ3VlMxf03icB
ewsHj696DNlWcgSO0IPAUtxrjc+5HM+lCcoLWwxzvre6TpuhfGkweYLwlfDCOPCgOM184sZHw83y
l8JgT/zg0XfEV8GBu/5MDqvZ4cuulc3vGJiNXGvH7N/4XfLaZpz3HolcZ8CDBD5pebCK9XoVFvCe
vQwpw26QIybU0YyokeSQ+L7C0g+h76nRv09Sl39kxl6AbBHZVap6zpN0vmI4w0zvgp2ncBSVwqjp
iV4sQDa9eXz2n28l/OVC7qFWhPWcoCD4icRoDD8QCJQlYEdfSnAnU6aX+EbdN1HNxpMG5swOLfJY
W2WOEEQeHi2TAzhvNp/h+vIuvgDyS8N4Immp6+JzIoj3OHJm1zZ8IhZPP5HLIDG/hwhZSkhcdspn
PyR3Hk9xgAuLw/Fc7LvO9/1AqIR9y3qluZjsiBaGSFgp363SE+c37q7LDXMkNct82I1O+/rG6EMW
uhcqiS3Jrkt287vYcMViWOJOgU2ZhHcsc2MDNuLtp3rGANiSLLPlFIXbTgvsAoElvMaKZdO1aYnf
lAVYNjRWKDuNxcJvOT1XBfszMjNbhOcac/CvVo2FT1YEszf6v9+X+56fHvSCYzfuow/WJaIzx3TH
+p5Y8pBmyJuqjZv8FFSXrb2ioNJumZC2Q1ZXiyMrNAJ1eHyuAc3m+YrOFSAm5fTgjkh9OjyGENJA
6T9NbaC8GbivLvK1Mkxa/3Ydy6+UKLEvX0dRSH7esnO+2yhV3WUixLDh/bAy932jps11sEWrTiQ3
skZv8mWQO9PBmxE/dbExpCtpJ9ciJecb4CyaKCG4l9b8oR4nn06Lbd3kBgc6LGl3XeLvxaehNfIV
8wmQRXx6mUTQhKMz1Vl478j86G4PDi1mnAgjt8OyMWKuy/C5AF2q9nBumjMAWHt8gnMFwurNRnxA
U5Y2uUKqTUeVVxbcuQ47zZUOwlqKlfdOmFMFNtytN7sg1I6DLm+QqtX/H0Ua7V9QzQ7b3ykIhQCV
Dk05QVN3h84qPTo9wPxr5ZZe82oOFy4oyD9XtoUkatP1qV9itwuhdj4nCJoukHn6Uno4QIpkfxiz
HB4p4Gb6m8oJksbzu28IUC5CXtq4Qyr2RqF0Xmbzg2bppNPUSjb1K+eCRR5MjMFVOo/wEeAdbXjD
Uyfau+fNGJGsfPY7Ms0MwETW3lhK1DcB1UU+ZyjGHznXta31LZeSRh/RcNjkLKKU3UwVY4OiE1mo
ciSe2eD4FAYr76GIJm8ECilz6HwW2A/QT5wCrDPr26J2SFxQlJDcbwV3OR+r08RwhobjCu9YZskc
pcExf4wWsSlUSyKkL1Y7HSOtyOhBDetms2Anl1WIavmRjeOPLsXoJWJnz1sLIQcjeagFvxEUetjw
xwcUSzQqsVTK66/FCH9inmu8uOoBP9oQMOolpp5N5CX9qjzc2zIlGQMv3k8vREd6vWWMEASPL3ee
99pXTfVtkwT+ueRxB0JJsT+Le39yc+3PJVQ31j2O2l1M0hKQTOahLzJNt804ze9Btck0Y0IcZZ17
YLywqxLF6S/wXmjSRwtCTY9K5S0EZCQ3RDf9u5qYmD66wY5hUBa+FTSaMJiiItSOLco2hmgqc2DY
eecdkBC2rCcwUgepq81o0NmuwhL6laFf2YnTo6FETcRs6kh7N/EcadBd/Pqu6EhEJQraKw2I/79r
N+0yNh7qkUVyk166UHFG3Ex/VD/juA7lZzNmcQBrR9uKjztZpL3PZgyCfHCM+qKtd8IwLQ07CEgM
yNnm5QR292OWU2qiUdcGWaaDmyEbfcxf7paCwkWgI1L0wMIGshW+fx4jgo7aLM+8TXwQdfkZpv5t
T2wgiJOqazvfqZcjbjHYoGsngSZjHU/pQu5vti0ystEBYBAGE6p1t0+ub6/OGMZTBepfKWE541Dr
kxfkSONljvXgu9bkB9NfHQ4RcJyVQOkQKoZu7JB7ZhVwiPXBzNilreGWdAGWRmFp+1KNkbswO+/e
gzBiSAlElrBFxSYsqywmqND/7PMPLZnVkPJ2MukguCry7Zakwi5ehYfHVuIDT/j/pR1pnjG9pvnL
ViJbLJGpWT/FPCNb+1I3zT+DSe54C503p/bFMfHRBVF1oaR9u6AhB4ajVsszcYfUf/u/6OPKsUs2
hIq09xIabaUaZlbDanPddH4SJjKycBAaUfqN/S5JbWJwRGR1WNDKel6Rb7PQx6HHHLr7XQBeEmbj
XZHwhb9bCoyWPhS1soaNAi692w/Eirnv9yplB5wPMoOtSb46qhx3XKDLKddp3BkbHli+VFmdZFv6
3yMmGwRFJKm1d09c8ao0VAGWXyat8XEShuiusXI1O/qIC5KFD++C0MdJ33yPKCxMKnWRTka1oAFt
3Eohlsxuh8onMPj/yAcPEqvfu9lfI2T6h71amUOwRcdm0M3QxJvb04aECQE7ybn6wGGT0CaLMk0k
HQx4DqwkPCoH7eSr0SiggkyswhshMKsoAdl+Jz8LS21Za7Pgfhl1JhyObZ9lzOYh94UDQIYiUZud
mAbdw4LbWWmOMyH1pLqxSUzPZDD4Cq6d9v8XFlz+WtyY5OhGMC/9aBFb9YM0boSWnC5bD/xPBVYX
v2nuIcIGgqKmfY2bu4GQLP20jDlMyoj9rcfDjgjjy09WS81GpDTRZx9HDfQyrAS8BMZhBObSq7eB
7QxbKaKyqvv2o7UJDnTsEzXrLtJpa4qooq9VRw/Arkfw+dTzhgi5ubwfp1qR4dbPXoP5TEW2IMXB
j4zd+XopxuJ3LrhufURCbZtWrYyRSyF4DwLKUnRbwAN7HJyzPeIq3PmfcFcxpxPA2L8e8rLoNJHe
CqiGlSQ4CsfU1Hu21evpJVf2q5A1nj13NG6MXhO1DPZ2hcsgy2wufou/eXgvXJiylEY3aZMucioc
Kc1BegY6pbUzsVisafIaPigU37QMArE860rr68+zQYAlhgzeg4vaIH0Mw0rgrREfY8l/3z9FEDfj
Pn7TNrxNHTB2/ObYVhPljkQDkhqrnGyXb8wCqMYvu9XMSBl+5OsnBRO1KfPwQiCbOyKecJtcDRqi
90wI6a4i/6wdn+uDH2ntQn7v7F1NLaehXjXESHPIF36JHGR0NLnVLkWDz0hRYKtJy5N8HMLT1q++
ZsfaFPdUCvc1E8ps8SLBfIxwqX7DzaFnIPOO4/vU+8Ei3Mag/eX9Zjyt91tqvrJGlqvdfbFcGxOK
3i1GLR5EHiUu99oBuCJOw/EJ0eJgHJCCPrQIA+RmiB32aEdLTL7pg65951PSQkrzfsy2klc+2bQe
mbnlN2ptSwiJjW6hmi18lK5teYWN41hbvEHA8nTuF/o1BXDgPfHIlV7zzA2g9DZw5sVPvn52TY+b
L8lohs4YgaSABXJaPFv4j9bRfxAGmXQB97roWcbTQTmZwqlyH287hyxW4Xe7MHCj6OfSRo5SwZSZ
ETLo9pZENtrC2am0Bb3mM4YVrUG6CzQ6hFedI6XppAo+6KZlldUuq46ew+mGiJCXMNNfI43CKHIX
yD133ugvNnRd2wwV3YJdUT6wQsszLVgijr46n952owTgWnW/5UJmUf8sb9grSLzaZwzFKTO7LAP6
tsX57g8Y+OfJnPPa3v3f51ScoQCqvYNAubZwL5ZuIQ2AbKt9EkwZ1PRR4Pz8cimqyB67vrYdNTF9
A3wHsXDrMr7X56Lh/a5Z9YPzWRkvxcCFZqs3muUwiQhWnWOGBaoSydrt4yKP9GpqAvp3mVkTRhdK
NQ/4ZcJK3DAzZeqeiBBD03NppKGCG6Od4khAiU1GOmnyiMVnMi+u7FQl82VryACGxOom6rF5wWEo
Omrp08k9zIlzrPokHLDZh+BI4NB1tmVYdDqPCZZyv6hNnX8FeZhAeklrytTdg6FCKUXxK1jku9mY
eQEGGbJvGHtF8nN3fb0vUIOXEplwBhoo3H4GOe5dajODFol7TZX2IRJxUD5YDGtajmaVOLFuCFHM
K5RWPi0P0eIPkq3UpWb+AAzO7YkKgJeLMOfxiSkxEiWjyzPzSSgbrLPnnx+jy8lb8eHHW16JU/iU
l2MbGDU9nSdfFLNMRdmuUEmbr0Z0e7an2OPXnA5BegRRxNwnvQpliZZIH2G7X0pJP5GhrR5/19k5
9IAumATCFNI3YvQhlHCPK9tHYzLToYRGHizdtxvEDpvL3msW/6IWBGmWCUpHvUlaP0HVlu0BfgDQ
47XsFR2XftNK28M41mAF9vTX7W5rM0TH9XZvGMGU7WXZ6MLvTP/pyxRugmlXnPm3YGRK99a0Fc26
WN1h/d0cezLK6R6MUHXy/la1BvoplU4IiK55naHAnuYvrtZtS85vWQ1mqpNp75/H5HX1mFSXhxeJ
cRPgRQMJazrcyz3WlHf1Hjm6rYbOj7ABY20G5nlOi2+42kKZHZW1+6qoT2FMfDlyJOmeKUVsbgpK
Qpqo4DNK/F6b8ekdQfL45SzUcdTHOr4udgHbGkJz8Nx3QMm42SQWLcOoP8HoEdlI3vsWrAHPSm2A
1Vdzspno7F66PcBbJymMtDsdEKEZNDkDphduWSHMkwcd5ajspjGmTLm0YAxOboJbAAwKowNZkn0z
AHuyUKUUtvaal/mvhJxE99qd4xWjNrRxJkojg7i/cS/tGnADgp4BN6kpWwWoyZcdbsK1w2m5xNuw
+aA9YyJD1ELiK3nagbXrs/nMajIupv9jCnSauvrHbhvayEHoCPwTD+jrKxMm3Xr5ci7BJ3VRbzrv
3zZJhGNHx6avfEInSj5LWHCLN8sYZw3+oy1AU6kiM18YlMmU6EOZ+BIFyfSKNdcLB9W7vzjHiZdf
TCfb01RKxq7ULY/+LCiH8z1XYxt5f/RPD4jt6xdLlefm1Ck7ROeD6HthKWt9kkL1jkVaYMkeXKcE
015egqx3dWqwencBo6eKmRaVzoOPdUvSgEAOVdmXfLfTjxjbEn97rBUVOmCH6H9hGisTUOs5FHGR
WXH7u1WcVjtV0zTdkHUVPrzMNDx7kyMCn99uoA2a+Buq6RrCizFda5vPRbcUz6vx6p32b9bQoAPe
kj00wkFIwROY2b1+MxReDD99mRt7shANV9TSv5EnGlUF5fqYmA5Lz2/gicIdgmYyyYNvPDSpxZFV
w7jVY9LYFHac+N3525nXv9cS/Zia7pSyAydvT95Wi27IUXu+GVtS8nqKdPZ3y4vb6uHwbF1sWuSb
B5Otd1tc2ZPHRUzbXPRV9Jp3t1RtSEBM/RjBliRqmXzGRuWZoCCqUFLMQmWk5djvQ8pDHF61bVuq
3io+v01GA+fC+fcfWx2cGwlSiEHdeE2KANUBSYHUNx//uAvGWh+a8bnTlUO0gK9jJ4cAdvHE/wHJ
Cr8HfOr9bYflLt1SyVpwdtQbY8bPWvSPuItjZGlRjqBkbVXyJpbAq4rcEKjw8jfdXUJAHJXnSqT8
t4I2GZdgpLrU70N5B3Kfx+OLAsgjCnVhrlKZQiGwPrvp1gerI/ZOn3BSS9QCWqCl1kGq7Bp1xBAF
+WkPCoPA1cWKgdEph54IXGfGYAtrCGkdxwARujm11885Xae/c1J0QkSPBL4wrkF5n7Id9YeOvmrF
8A9BldNP/qtC4m31HM++UdDUsQsW0vfmH5HynYrZq6KBI+MYaTIaOanyP6kSeR2pgP8jTWh064Lj
Gd7ckspGrnLQHETkQ/e59CpzK+6b+DgvJJEsJtjrT2KxqRsU+P6con9kKHB5ZSMVgL619MJVx5L6
4DFeYZLICjPTI4TgCyKnPP0IWWttus8UdSkcGY10OD7Vke5k+KrmdcjFI/Hf9KJ3qYgPbwxHdhlS
y3NwW+HlpR8F3FlHOqF9v7cpevLkZiVQExEDwbq5Hm3YM7y3kVCYLUfbedGaRBQ0ckapcl7TTJ09
MG8Mp6mGWJ5kG+iwsVn4omYfDdpz42HR1VpD5sllHpmkgqQmV6psKSvphnqXlPAW59bw36YIuzI0
85bkHY5vryl312dETSNx9fQk2BypRuteLlJ73x+7xyS6/qQjPXFllfbZTwN23xKeU5bd5c3tQxXF
nQ0q+i5SScAEoR74qQUC+19QkrjkN0gUc7bK3td3ZbcpbBdUbJhDakJEKM5ckF0H2jVKMsfoDSDK
wmtrvJlsSP1g0/nGNxsrYaR5pc+Bi3BRXKn6dR8qBJRip0M7MjqZuDxnEjEGUv/ApxeIg0y5/VvF
uJ9YRlJ2ccqTRmEFXkpEQeslTNYNgs9tIWScgp2wCy2mllj/zkvse89tImTH2dAwdL7FXvB52cwe
zz8SrFpbXcqd0dUsVx6yV4xW0KNfzLKP3sTDSupULLXZfMaPwBbWAB4i6EuHTJo3ib0bh+eitv3H
QIsrv5NRAg2qqqna6TvREMzpSqZK9uNQWS61egpyCY8ayi8g5ImcBXLKYvQU+lZB+9jQ0GwHPd1q
5fLPKCVhfamakQR3wFcHm1koF9YVjuYPLUYtN4JEHFe8wGq6O86vxc/Y4Iowb3zJ7i2IcKk+EVRs
nyLedtu4qGfSgt5eKiwLi1nFuMtwmgSJ2ioyhASXABIteg7zY+jZmpseuzu48V1mJXLlTLthksUi
zdKmEuwoajQuEzkYU7nwNsthT2k70m2ZAFy3Pr8cKpVTjXlxevxFmmin5XbXcZ1PNW+HhB1lksDO
p3Uu8dX8Y5kd7xa70muv6U6/piwOvpUk0rNnWnxaI8y1oNcqtXxuXyX1Nefao8GVcJqVZhuSw5Hg
yvDg+F+NneeY+Y/GZEh08j8qZKxaSza0rgsNFFBPWBIfGUrXr0PW6SBsa9OMX9KSRGn9jG5kuWSI
TPnQcvAQjMtAUZL3FCSGPhAHcQZhaY1ynobosZLmwIm5AFllhXjozrNXuURS+uNi70r6NdXg6ht7
dCx815si1XfounN8p38MFka0NXFSF1LRNwwIQI5g5faEkFQsEYDF6gxt/XYyCRVBvUZP7SZFKhAc
3yjYKkXy5nROaMxjM7Z/WlieZ6BYEnH0x5+d/PdWn/LIAOFNY4mrVjaq4fDKbIS2vl3OajVrRI/U
KTZsTJRMTZObB9pquRa+J/Ix3q5rL3WR6yiLoa19eLXHLmtpkoZ1FZQvRxJnXfmxr1TKWXATH/gp
TFsO1USbijEo1uJ6ef9T8gnLR4Uj68jCCUXdqufyFkyyZtL8tXjtWQQRhs6KnFnref2c7mBGzAEV
loIVuAJCrBlR+h3gBAN35PzwdfRtUVFhCySaRc3gbD5EDMlKWDgA/d8Adm9fOz4T1hhxZjKVqm2T
UhF1hHYexX6SG2XKqT70hB+IsIpjNiz+5gDXsbQv757llWyurqnAzjBEP7dB/vvk8FvuJ12CbH2v
QKaDQHyiHksPGZgxD2179ZCTawdefDUAD+E1cVZEOB3xu79FWyOrq/lYK1hyUE/5lN7XbhoYbGTA
dFSxdg4yxeNnSqwvl0Im9eqgvywEnN5LZUh6q+eEQSB/CefOwof3zIDUStrVaAoxrjI7502LSWKd
vCChnDEbLDbVBqWGcQR2cuA5vyozEiQ6ZzljXfZiE7LkU1bGb2iaRLexXpKENrmZ78PT8Iaf+iuy
P9e2QFwj9edlfokj8Bs36aJpkHXsfhuiuKJv0LCDcvjemRW3BhexMWVLRMbhYfChp4U+hisp2amU
+wlFZvFg4sWFapmRMUI9dpAvcm5D92tlISbIVDdCWJYwZfhxgsRVSBm17VB2NZiAUWP6JyRcrsPN
LvAF5eDvlSRAgbZGYOePL+iKw5Smy0WsM7uOM5zJZRfdTc+EjXGkatbTdmIuHtmXuzjhzzPSzz/8
hjOM8yP80oe99sb5KwJLt5HPKz+16mFh6rqwOXdzUqpju6XxI/sXuS+xZkoKV1O5yh3W7Ok6hoI6
0NDhBKedyXRc/R+g6YIGVOVCz6Oe8/QPFiBlzoS6idZ0/TOVSJt4JRedZ0G29V4baf2yPg5tCXsY
8FoHDNMvfmcTJKpNsiR95WwttGC8cCVjl/qXYOrf3eQW22QLOWiS/uFsslw+9amLAug0kreY/fVA
6J/Vae2pQsScv+aArbGIcl7dvDt31+BXyEd/GVZErHDWmS4+nR0UwjlLOOgyJ8MF0yrzrz7qoOaa
YRPMP0QLkexjoHbLnZPGffRiKsn+0EcS3FfRtS0ZDI66eVsdGoOg4J7FcdKHo22fj8qD09zw7AJk
H+eAE2jomidNJDtJx+re9S09A3Q1TZBQHQYN15y11qV8YOCMq2wokyIv2HEDsXwnytmNT4ntxgRB
qEcXRDJ9nwjNZClWb8rsu4D5MoSeZCg71bSk0Gt9ZYoLxKZ94aToNdrhtyVKOHcLHC/nQo/8EuGK
phugmJxsoybiC0q7UessN8pfxdU0Z1y5trif6WQWjWL/vr2O3cw/SG6W1hlBBMAP6B/3MWxXi0+s
QmQ1phz3A+QX0ey7f0mr3nRc/T6k6ASHwZUUbuaYCoH/l2b/tj+SZFwRBIF5gX4juw7HMZF9hxC7
dc+z9Du7LUu2Eyh6h0rZgIYIvuB1r5zx5R3PCJJESSM+b+WRfEZaPp6h9LIL2NzCOmevh/Q84zWq
tJ58VsVxiAtfWSbFR9+yM9Mh4uqdffz4OjKbHEuUOQxjf8ldNF/msOWnnQb+yDrZToa+YV5nJzdp
bnSFW6oK0s+UtH/cVnGnj/c40k3oyWSp/hFVQDjbRnNsXC7LuL0vWesPNkSOc6NPfAQvX/lJCpoE
XLYcrCNcFa3c5bLSLlaztOpf8oFi5gbqlYTIGH03rCtnOQapotKZJ3Cb09VHh4H1mKbJqm6hs++r
dG0YqIeYJV6tJym4il/FS+VQPAVpt+WaBaQrOj8gYKrZvpzwQZZTGE0FbilP3dzespLeszvY21UW
alJzdC80LCTRD8HlRdE5QJGbon0zWWq0BK6ZxE8+nYZ1n/PzStq80dQdcTE0WVkh7Cq6EtDXOQvL
lv+OQbJ5oZUMjFn+b45kclvtkKQYvPdU3ItvSgJ8fqyCClcDE8zoaPv2b3xIVG9DGDoOpeq71aSJ
7QfunaOqnYdzpCidH5weU4GXfTQ2PUqnS6WDUiWezTN6icZF4796i3uLfqFhlWqamDxrxBzD69LG
kwXCQeZClBaAgLleLRVfqVl8QKaAUuO+ZiNHUGeC1cYMGWRUWq4tU0dR5fVLj6MNWJw9KuOUjVEA
wilRStwzrwZW3vwXSpNdbJbpQapGrynZW0O5UBEf1ruz0fgK1r1fC7j96I+gHMFcm28z6XMWtlls
bPv7Ivp9mFUnnmgai1Xp/Bl5wla+EzvT/5oau64BcykWrFdj9PWkSuxNHKQaiqsEJy+FsN+SbnYG
HXxNuMDnuXo3o/NevETmvSKp6kBzTtocHldncuU6jKvoPa3TtIuNm22FhNfDEkldBY/wDdTBI6cc
nUHWK8jZ+BOjY5+qYUsrpccbbQMW7x+M2P1QMnWMc1HWXEsS7K8U1d8yxMDJmOhiMTUqt5lMO28x
Gi9xet37HAFuOMWaSld9Q3N/EM8sja0D4Zx9W6tWyP52zqY+UU4Fb6pF67lkX+JBnVfflu3dwyM6
eg/0T6UX/LN6E4QvTt33fJa0PgH5zgSquVx82ZD2iPOq1lSCGVMNWehTm1UGNuvqVKWY7/COpLO0
JImfgs1TMPkwZTmc5BHyUg3x4HMzBeO8HDJigYWzGD5NjH1/j7sYlBTkstuZ4mnC/GrC2opn2PNm
YX73hp/5YMPooVvcHaTmhmKckkPiLblyUkMcEnIYAyvguChoc0NX5OE8O3jCy+onK7wa9lNJqdko
OPSmAKVzsUWwh6kn5CA+B0Dx49LjPsAmwwtVrWUWcR1KDBcl1kKf9xf9WLhv13w//WS+1mW/YDxa
JFM/BdzXwhED8lNgEPAueypts/rjZWD7qhfiV06E1lyzuHiXKZKl7eiVkZeUF5Z8qucGR82g9XIZ
2nbOTiQZOc2x5d26fbvT51JJ9ygUPTTMQXJ+HCqTmNOzDDPj35S1YIw3d+wfo7ILNSHMalrhFJ23
qyXPmnttlQ73+V7j8WIBc2DRy7FsTckcboibCkZWGLIYHCPMXauY6tFvGLK6CznLr/xGnvvn/8wg
jWhMMMi3uDOvRtcIhmMrvZ0c5eGa3ccO+rzOwgwoG5AN2iGYHQ8A17xvqwxBe8ZK/so7lJs2xatq
HlO17RyyQLnu3W/KdpRayJBFbmhSZnCIlK+iMU8exi93q8+JdJJ61n9E/g1HVyVb4aN9xwiFfHj5
BF6Ka8dx7WB6Jsouvl7DDUcuYbnzubtkdT+GVfpyb3ymyokfa3wEshA0wr/Fm7BTJputHxm1l21X
E8E0i2rj02EM4gpL7NyWFN8/H/9EAZi32zpdct5NdqowTeMLjS41gTp3iGux/TjE2qO005iHipII
A4ptNRYTlZ81L6/Nrxdjv8vJ3hwMh+EZ80a79pk/V2wviTVCpA5t4uzF24zGM/QNRpw3kNcW6Prn
zEfLB/+ZoG0JEI+m/xwB9feETbt4YsKw3hpESQ7rKwzNcMeuMufvLNTFB4p59+ETKVIJNG9/bL3m
TUULdKamq7BWF+AX/D4ZFL/H39H8cso0uM8SYpOA+3qA0Kn+/K18/e9wP+AScU7kJ77dw/gdh7n9
ua+u6hx22Mt4y9fO7P9p/jAA64LrlL421AzlFNUmG7Dm+DIOLUWBhvL9ObuuJ8D2TzSZyr/N7OLC
9szL5a+kcM2ZtoL+VdP2r4kjvklPGY56EsTM+2ODcKowIV9HK5nHSij91em2uU65vBPrHpM++INH
97p6fABDnTsSoAX7oegy4SauXhXG/w5Sgz8k/GD+245HhqrVzExpcJli81i6BuovBp2X2BZ8E9UT
PqYYekRDtx5rauNYRO+GrAE/ddMwRzG4ciKygZB359h6uvgrpGNk0It20WSMkexgj+o/+39eougn
m7W0F2CeIlSVG6GSmQm8YFyaKv8jueTzsl1LdrhHeP1jadtvQfaxuuCqaSX6o/67/gHVdlBs9lhx
2AgXO+XP/BwSVGcO4dGzjId2mLBFf2rZJJtYx2wprwuE3XhaMkaF001YOwYMeTPX/ra5juYaDIPz
kCzk0CEixlI/NE64lmURJzgty2+F6Z9XXVDfgNfBhk4cF0oddco/dXEsyGWUDKJMuAtftmAPX3Hs
Swf09xPA0VN71+yHcYx8DKgNjbfmPomjY5X2/HEqbf0oDwFQLQt3BAWs97mweR37xeC7DmAYSgcF
NrkFhF0dKhmXwVPAFZ6UqBqkihvtkkzQ4OIe2VPt1ByxCmQt3pF3QNbsJHGNCSo4GMSGGCa/vELF
51nm+tP3CYGePe6yGAW2xCwu/pc8mz0YLjCKjn4Jo5ukw2d23MSZzrgq9Ak/+ZxCIPtwQnIcGw7J
xA0MmkEYNdVCtmgQ9C3Lu3aKAYz5KNFQFm5ump7Fe9mzdt9ZQOi9jSQP84sGo/0jx7Cy4FW+XsTB
c+YQqtHYmXYQLtf4xtPq2sc+M7iGn0IWHYP0DEqC+5JwZHqSJbOhW4Uq+PrHKm3DirpCXEF1KPjs
Pz19O0ThnsEkIkX+z5nyDnOGw+j2JRRO4WUm6Va35Hf9yoVPO/dyRt+oMaXK6NYwzxeCzB/22WOB
0VoHphsFR9pdx1n3LqcI7IRoun3tjDp6sh9FzeWHVPwOPsn56+RmffSIC/J7Tly/KrcJtZFlkhhT
OMVnEKhPJTJLoT2MpSygqEPHzneO+rOl1PdUj2pQxMzIp2dVPZh4FMaKfR6srRBN6OvmnURsv4Ad
jpuV9b97E/Ld7ZTspheDARokNrMfu3qaJHLbeEE73RZzlhSUxwZ84zPJU5D6LG66OZNjm8bS8J0J
ZQnZBf5Q6KjALs/eGzk+vvaZnmCylVyysYeJ3E/+Ej5fNVaufShSqhImNA1bPWN3jPMaCknFdRgg
y2+rTathgJehUtD7vcDSGQSBmY6/RomLzG4MJlCJSFR8Y4TYY8k0kY7b4hOVD9nWBuboScIFVsNJ
SUoPYpLYXb5HTCEuYvu+l5390U6YkuYH+84gsxTMjY+OV9GQFbxgTjWJOZI5G5o5Es0b2C9lPn6P
TPlxYE3VT4VfYsh6tRxnhTBFSoDgK8UzGGacXUZOrFIJEk/wKudVNIEjQQWvWleKPrkanm5KDazW
XLiPK1iwH15K0gRX1gWTVg0Y5Rpx7tRXhizcjBG/bgOKsJyoIzWbg494vh5Qdy2QY2CQJPfb3/ha
ZD7JSEGUpzTB06whGVKJCIl2rak6amXR+zUJAFx8nTQWKhcBHfB/XT5xmkd39pXn4/hqsoAOBrSR
wZ5i44W6VaxLUatAr94f4ZTaqOadWhD7Ugj73Vurv5e8OiB1G8ZF0rcvs24hMl3H+bwOEmM6gVzS
/XDQgxOSZlrWF1HLSoXWe+SnWx8l4RtrUZcQNl6XDT9YuKre1aDcRX0UZgOXijlebE0zHWv3QG5e
B38+YCeEWTM26ojFYtD1UpCmejRIPQ0k6QiJXlxo8RK5fHz8nxRzzotHExzpKhZghG4xfDpbqlDt
Qx2SPeoGnWrGFfP5FDLZCk6JjXmqcbSXWsXPr3HQPYbA7eL2PMsnXRAeHTIdjL1YusbuaIuLrsGi
30cv9MeWK57quOzd94ok0FmMK003v21NpJe0T1t4Sx+l2l2UOBQfJOEzDKOzmmGfMz3MsqGymOg1
viYamqc2JHy1z0/hDekST9yMA0fnp1MGxCAlGDwGvjtOzW4XDYuqsjIFPH34soq8XdfeeCfs5hJ/
fld7O02vSiytWB1V8CUtmhT0h2vVKsT/InVPmX3ULq2M4+zhfajUJJesHDCi5xd2Sc20jZ7sC/5g
q7E/Cb0UVJUo4Vo2l3aTYKz96KBdX9KG9MNvCFx2bKTHz5iyryhdXGI8NShhT+V23kIu//cZH0iB
nedro+VxyWGU4UzgVag1kFvaG7va+O0eZkpuiBrq3tsHLjnq0C/Kd5vCfu4qqb9/Ed5eSvkjdLpE
EYTiFQ1WTGy9rNAURxRgUt4tWyflpJsNBNOcW3gXtJ26inpAh15oJcE7b82fvunBKrvh68WaGidF
gMUTW3zwqp8b4kKaPBzqHZSj8rIwQ9ogXdTIXdxH9R6hDw8WMv4QSENuOruYi7mquwoygDx7j3h3
CaqqB1wAUNwGYhM5kXkmzmyQbj0rvq9QSClZbwRWiaqujXqVIhOgHdC8qjiVoxwzmXJILY+5XtFD
f7rh1Ir877VLyeELcxeo5H/4FJMHIKPhwZyJJyTqMzfWei756V+hwrltBqHGdqEl7LVveUUaJ25l
ZUvJv0eWjwIOXyLqjeGQkfPrmHeXJ4XRft7Sm0c/HyQbz7uzSocYjQu3T9VEKO53O9o4gWZ84KJA
Wpjnpuq5Tq7jvg0nYXDfiz5aSg3g9ecYwkwAidnABm+EYQ+Lla/b88SV49cXxw4sc03oU45efaL2
fVowcUeTB4ljBvACGnPJahloTUIESiKtRkdamatzePZC7NEr6BAPu3iXhuXFN/jLII3Tpmcm35Jb
lmE5Wu6MwEe1+/HLo1mLRRhHvk9NLzo9fiYpGloSnqERX3KpdxIlinPu8eTt0LEbvj0mmCZ7fX3d
8/d9HWwtay9530MPKtw55MLpGl4sspwLOS/Y+12LpeWdd8RZ9p1s/BgE3H1TVRqf+kjI0rgcKZcM
MQCrqfTQfzCe73WoSUHAfFlLf4dZdYcp+2FBilBiF3xFEOJlHIcbA1a9Y/UpJTrkZn5uUHGi9Oz6
XwXUVFxtqL0LJGyhYhlhuWedozN3eDVMUcakSNMR5qc7WDZvzdFNFjX/7OUDMJAQZpBg8UgrcO5t
EH28eBbJUDTJiwHCpKbl9hqp8DjFzQGjx9dj86M53wZUuAs25rGt9X9qaaXWkzR1ObXo+5eLBudR
MLPO0nyPHePyCotZzmXx47xPYMI9pVO/mH5h5KZPtkEOp+a59LuuoFNjF/qyFtF82g7//7FENqx4
+dYs4kSphZPs+qY1GJ+BF+/C89lAOzG3LdbSiEUNeqokYGkjLxWOgKVepXXI6KYm8kDo1PsL8W7c
CDh3HGdQ1ffcZ2kOx+1TEhP4VDjFRDRofaHKd32L3dfddurkGDKA6KcELtKj16K3I8t4GlDezHcz
4qGU6OeBem5l86H16yeCnT2yUj1bk+zrJgihB2FfPQylu/UqCgHwLiooEk6ILDEQAWiSwpQI7PwD
GdrDo+WEMwgoAXsg3fGr2zYgX+RIvd4B4UL+jsatmBE1kSgGMlqhGCrwQdJvDAgIKAt9/RYY11Ct
AA41bE/W/GMgjLNQM7wajcuFt3lWFg9VtUKT9zxjiNrNSzu6dN4Mu3V4o/I898hBzZvLvVrSwDWO
IPlziiHLeM/6Rru9rG9rBlhvYnK80fksKMOywbFe3oh5XWjPyPtTuQKcnzPXttPfQ4TkKkNgIQi2
erhThonDFckMnMbUFVsEynufm64ZRMN7hyLK0Rwx04DiRbTxAqP31TggRf+4A9jtaC+uP5oMyado
14B18NUUq8qovUoDXqUSyRq7bAr3zn9MNizBqKRVVzqlVLZZyeNGfgjFhGO4QsAr+UjXuNAeXR32
bXhYjnXruKNMd0X5PaJQKTJI6Mugm438E5tGLmt+euPaUWgriB7qCL7NCteU9s7Q4h94HtmIjXAh
7dHYL/k7y7IKhlpVpEi/54K35wxu9LU4IaAs5xutqKNOKAXtHWBr1N/TM/yShX5AMKIdmsBztDFu
ZfBSr3tdlRgoGb+kCtmkQmsAppPtPJgeXyRbze2aRAbG3H9HPllsCREyCIfBS8DJat5/jOOMzz10
LiL7ms1e35rBUwdAA74b514ylFgLsGQ7eUcgYcEFCTy7e3KWPpzLdhBNbpXWS1reswljQgTRYQ4x
dfmNtIx/d8ztURV5M0k9LgXRI7TodsJXRJB1DOQ5tsFHapec7x3CTRw/Y1OksZfzLFs+9ttLaoHs
W5N1fPmlkriRdFQzWLpx1LEfQP5N50mRVaQxjbGYMSNfme4OkNb5mhH49Scvc16ZsYGtPPxQLEXF
QYfYOEqZkn8TRjHhHst3+hBjW7Z+hwNN7K2Sq4Eu+1RVy8qSbdQfRWGUb4imC5GLwhx9fNzQTiN4
jJ8/iZWJ2WGhtzjf+jw7Vwtv/wPPN6W97pvpsaMmsJI8rQyI9TOh+2wfhTKMIgBmtUVr9SX/0Au0
+DguhCRL7/VSclTEO6S033BObG8Ep5EutLuzAe6W0xDkfs/D+BV1BnhvIFaQE5D6AGMU/emu11pc
I9E6f66a2CzRRxNqhjJU0CKuwGLERFCxAXNp8Gp/siOet6zzksTEf8FE37lB6aBfxBFwgDUaIw7P
ccq5J1YWO3Shj9KnCiqiuhYo5LDLp91Evk7m/KX6IVsMxJbOGfRaxu3z+CH/FzBkfs2rfLIkfwim
Dp6O7smUL1jqRZPwm6ZLXS4C5HOVUw8Xwhnv3l3kFN8lLcR41mzFnDXXtqihr2Be4XuD+ppCAOHN
7co8dT+jeK2H1NwEriUBpgX9/VWXMk0btsKuirvmKhO5XPF4AbaDjn6rdSYUTfNuQajuZEZz1Tnm
ALBoO1Laibh8oGUe12dgqPASQfNxGoW6ulBd4Om1uz1rI7ICdAxjbHte+PHznJWOJlr4K5FeM4oB
Xn5yFnUpEDVY+vk3iFDKLcqDVj2/e30g5f6e8SKGyv4Dm27Sp0ha6JqJnucd2ufJuaurSdYEiVWA
wZLpwsftf5b7xMsgOSAukevwJySyg5+eukQgCyWTqmugu0Lj9gtr9EUI+gWHyKUbl7tlUyjeigmy
jNs9WZuxfJSLRGctpIg+lMGggrVBSG3ddZo7oo9JzdRH2OwZDEVaqiJS14QbCRRAdZ3nvkXTeeqg
ZFI2E82K4Dlw59M28RmWf1ea8/4Q2/nFDrt2Ifjug2jAhq6clZ7CucbNUvgQJF+SHbmbgcqK6xYe
TP2DxsosfJHJ9RGw+EtcK8qwYb8Mt4Cq8IdjvSFtylYrXOLndFGBig3y0CBM5m6v/2uRZ59Iy7PS
rXWzNFnyoJ40qvDmf3PvDs9YeqP9HYSRosC4/dEpWyBrR2rdmRs0jNwYQvle0I+bH0uOeFjhb0kb
xVxIUZ6JnUm1fMrlf5oMOzvgTz9ZGaP4CTaj5tQQU1Hl6gw8s7FholnW6qZbuPajydUogx8TtU21
qvT7JPM8kt/UrjuQr6imqJI1vq8dbVOyNJ1BtxR0j0U81wL9RV9BGZG0bpLzOwkikEcZPTzUIAkB
Jwh/04MpG0Narylqpeo8SkzF5ojFBmcthDUoWXFMHNDWeAPRziy/XE9FhdT4seB24M7hiCtmYudJ
rDt+Dj6TShejR3DzJjUaWehRdGaqlFbzr5WyoAW/ls7N1oymS/pL2t9XfDYzpmq1j5sqCwTll6HV
gLFRHbPhUTaYuKdUsh1Ws0nUfG2GMOUaY+3BXiMJIUffNaqG+PArDGvsak2/gbPZKP7vwfkDyaXH
seKE0EQWsXwVzSwF7maYPsY1FtgvWucW6yM+n3pK/sr17kJGCaGAebbfcvoNfAWAVmQ1pcN5t1Ad
jsXdgunu5nkh9NBeydzdd8uwDW0VjwtrXEnqmbQkMBRWZUPiXFLjBhaIMUTTG7zOCNG/kvpNDTsq
cg6SbUlFhfGTehOoP75TM1zohfdHbNdkrwGDD1GUaqxozm2K6Cg0k7I1Uor6gt3DU26KTzrJeom0
Zlcrnj6Vn6PQKMROBk/chxQ5B8mGVbn8pOgQl3pIltfUvlpVGWORVpO0S9sXANkF+mVM+zZaYOHA
GUKKhtvmRU05qjjMzMwbpvmaI+9uyquXYBr2DrPAMk1t4eyhiOfagGF+HB9+gNq7V4L/Oq3VUR6K
1MUkI/eDUCw0vT7pyv6LODbSm1F1NNa7qLLbidEgazNBDXRGiFISdR4YQqdeXibc552jhg9F8yu9
pz7opik978KYjjXPcZqaM1Tsnft3Zc01uG4pJjpJXIuQtY+nO1G3dM3OceKm7OTDdtk9FQKlec0A
hZu8C/S4xbKQqyr4+jgANq6gUxIlCifqoc8OcayaSARJC/H2EEpffkoGCGQhUFQpyHYJs7lMWlFJ
48UUkpoKQNANqp4/NqyHe7LzeMTG3IXSCPYKU4NOQJwPrnXFue0fCo8VgFaaQ/UpQR8OgFY8tuHe
g8tZmbrWcXEZUpWlMwsGA2z0X+lpg3ufQWzLMnNQ8qtwT12SaP1BTFP0S998Ou4p1dzB9jLNMHdm
QEKvgeyDZGtKTn0iVoZRCrliSuVMJbrqbbtJpKsQSjztrTQKANcDQndXhVMKJ7lF356W7Ay+rYPh
CV2OGHYa2G/YvJoyJhtvzedyjuEbUhUd4eKd8lKVcwCqZhyqc+54E9F3pPaMa+KeoPmlabt2vnWp
V5LSoE1LZVKqRM/qAaeMwFy6moB0Nda6ho5B2D3ByzvP9xnTRXVqH1udqoMYDW4d7dQ0T85leMDe
qmtD129iOk2Prb7YfRPvIRySnY46khC1sAIrMt+jvrcARF1GKBRHWgT+KnEkfLUlal7Th1sLuF5t
Q2c+45IBacIjJLrQjvDBR2bzyJTqdhJK6cLJvi7sFLxNbEoRe9ImzzdeqWhVnQo86NvqaH8LYSbR
VnIHxwOBjWtNyUOaiJrLo3w5/GJfT26tAEraVuO+Cs/Ryt4VPq1y1z+aKO1o56q0vJHQfRtrFG3s
HB4TAJDvYlQs6bd6hghPVwdSCiLZUipAVTSK9cA7OIxSO/3pUIyqolr58o4z1/gUzm0Rwvc/eH5a
dWhA+BKd8tFKTzDmAv8k2tFObo6GXke5w2jKNFHLpkQBPt+9OsQRX1PVILHq8qVjZJ/2080xBsOG
xag+NQv5a6iPFWWDvgafEv4xecdw/xUZALeOZRXy81FEB60AzJ5cGM942eaNO8rs6vQTkx8zA/Gl
gIfoHEALVvM4863sS6etyGAG3OOI7AI/i7RZJ9u3tiYb0xpkOKfZT8dDR5zzP9vsHaNixt4qkbOH
i91lv7zNMNbZwFUq/Fq+H0gpRGoAIPLFWZeN2MaP8x6/GKlBF0XlVnIQQ2tWwqJdb7VeXq1ghy/T
GugC1kvSOc/WZyqoYfPTL8zHfD0p+BMxXw2Rx3zVhWxwCWdL9qRq16OPTU672j5+uM0tPsFvHJXW
uTzpR7JeEaxP4UglBRoW5ykcRZSPx1njC9UD/0hWRYDlJGpd7i5o9ym90krZuPtMb3WhtDMcawEQ
MkTMcaAx8ls9ss7IYLb8UtsEZezKnKi6fGHemIybEltWh84dKBodb17vlDBFmy90g+V/XQ7rpzZX
XzAJvZgJoez3cB57nl4guydKO/f9HNrvJwXi3JL1q2jvcsfgL+O25rAcFep2ZKvEiPxF95FXS4mA
UrNYbbU2dRi8fwIuaX2dkdGmURIzQysYD6SwPXWD/ruZUF8UJLFJbj2Qgi9/j2HFI9TBbSbiE6XJ
IFAiLJ1N9VCXMb0AS37MJoBPUkwrlqqGRYVWJ1xFe3eIGpcF6d8f2LQhapP4K0tJhuQwqE1euCK5
Y/V0FVZuxAr+D9nUzjxESm32K1aaTMIIxvBXEUQ1H6CwhN3zPwzaT5lFzgxmSeC6ypeqnj0Gj9HX
aJYcqvxIBQO3H3yFNRVEE8sXFg8xUnk1zqhFUVhlDdOfRDICjhh8uXQCq/xdnTHP9f1XeXkHN9Fw
oQBof1cWDCDNAK43SvhlfLuvetVvRX/rHiyHvitfx2l0l07RSwqDda8B3/Jns/Xr+uF7QcWE271a
4ZjMGiBzgiESvAx8hPE9vNlyvXu+KQfHEAojDlKAZy2FJYPi3hwiZT/NRFKw4dU0y6Bk8Wlw/ikj
BJoGYFSKN9XfoztNjzBh9sqZ4newXhrkndlbai17tkk5B/9sqhnvFcH+saSAInXqmqQvdOKu4Q1G
JnsEuMFWuLynPkpNqJh22947bL580BqUvjf2Jbrnjh24OGHmi+8qjYNvwy8DXero+4W1JRkjsCUn
9esiX6jxvfML1aHY1wPIvCDJZrAxGfvAWDVNnMTc1EkMnNKpyY1W4iBzuJqqeDizV68vHC3sHKpt
Zl8Iqa6BLFEQZAzdWCNYXcn+2pPsnKazvyJHpT112DIpL5gtR3qIlM6fqd3Qu+Mf+6DgF8NguEO4
yyaxHu19L5i3qaxtrF9j5rO4x9xAaHU25tiCIJfZsV6tJ7eo4a64CJ6uBj1XOZ3hryoVGaMc57zX
QPADFmrCplbSVlo7JcaKG2MMWJzFXVtuOCz6zjaX0xwFYoXgD+c+MDuCcJoXDPiAi5YMd4gZF6j+
l0l9LX1oqMqIHG2y/CjJJZdqq6qUv3TXM1urfTk2iuNPnDL/DVAXZJCpubem0x4X0vdBJQAeST0F
2gY7uWkCH+Sqk/yRK2QQTaIGXLvbSbGEGAnTVU/PmmMRqbPIVlwswffo6pVo773q9a3STQdxcpMn
Bh0WV1D102qRLPEf546MmRSQOIbGg0UQp1k61ts9qkGeMSNI1uRqqNsHqzP60FAuhwTv0UQvC4Hd
FQIS36ESfBsLyYXibs8wW73+d9BmpTycbUQDasMIJ+XwPCprnI9+MWne0yh3BwJ8yDVas2eDLQ3u
i/MjcxUY/5pyGqDD44bydcbPmyhDDdQnCZhGiK3ZqdMtxqF7Kuu6I9Kz+x1T452S5h1ek0RM1Kug
eQSkefQr7efOap9JBZb36MB8xLmZ3M9CNpA6h/H3fym/yhPaa1IO5JaAmMbEB/pzdq+irVX9WNU/
oO/INK7n8/gsXOvTSOHXO+vY55Gl2QLq4CxEkOln1nur7n29193RzaIRwK6wFMYoFuDAxlhAXnBj
pAJ+AkIa8yDjqgje/i8/mGEAgGGoSXaoZVGhuzTDA4pf5OFKK48Wp88QZ2YcbQJ3jORmQd4TKbxJ
OYAGDrS/lOxhVfg6OMYY7K35kk2oVIvhoF7NUEA6yJKfbGfFlQGo6EtfpCPNvoGi4yOaw8umWGUT
Ztu8pkic6AiQxiI6YdBiRGpyxSVkUCjDx8qIk+9FIh35IM2VhatWEF1dXiqVoU7oqnNjKk4Rxzb0
ksghm7lwxkiB33uUKqo7IF8ObbVRjDcEHOcwT0JYEBVJVffb/Q6wZjWZXQbCRIAb2duoJ9qiD+42
Vi0yWDJOqQpQIR3vRTBgt7gYwniJYiKTqs2zGzrICzgmRa8R/v68a0BhfiMfubLqLMS7oEcrbMwx
3LQksWcMQCOYLpqe7KrMbwiKxmS1byyFNiY4r/1duFZjPm2HjKo7T7oSpn6Xs51nXrXmStbo6+1M
ZDvlHDlUmzy5LtXoHDREKcIenuh5mzOUR/KUvwtnRqQQs2A9Prdz3Sb2qOOw7UKQDEGuSqFyQIgi
oQAIsNmJnXtKHOqWQmXDOYts4CEBggSX1O74DtgtG5oD9gph9Lb29IWslwk9PunNWcat3IsK8Ib4
WMdfy17BY4ZOmatFwx6Yf2UuAeG9Y4rccu+QxttoGo7pk9HTOA8HAsh67+FGh8Y2X+v2qOi0OX9K
5R7RwHn/sj60WGa0U1Rx9omaorO2DIq8LnzJ3vE6328elmzRBHwi9yxYmMAVs6zwrzfFu8PbClmB
y1/vz+sm49Rjhq7rnonLKH/cWz8txBIZobIg8Uw9llXbb1lXKk8Fex5fkmHMdbOa7yNx1bQ6nkdl
uXPzrc38rIozrf/l/iTKKwZM5ApmcTN+DVQWE+7wKtBrg62Qf9OI8akpSpJZfh6gGTou9GRWgAeS
3oIP++V4/3gBSQRJRND2F98LUloAo8M6mbDzUCCdiEaI1Vu1NSyHocant92IFfa13+iwxyG2dzpv
5xrmx3jALgmhmlo9wv4UTqgfoyROPYAptMCM6RLWOPjAVhbXWi9XRRBTbADFyopJ8ISj6We/t1Ut
jUOVXya10PRApF4jB3tCbTZivzh9CTFFI9QA0UVg590PZnOqqiHeNJc6n6F663TRNBEbivS27Nhi
tGCOf9FaJDW7LkCzb/WpSMUZMinBSVGNihXVVZerLxHSAo4MnjSPklTO50KT0JBGXbVEz7XQMDku
3D6DE3IlexI0FkbKf2VJWOQKpu+XnnmixLYFuLwJl6UcAucS0bwzGBT8yUqQkx94wyyDgUD20+vv
6a5Qst+ZmSFW9TzKRljGm7vSSqybBYWPa+Qy6UFJNq1i0f7W7qhMJG1NNBfL10d9YCBmzNpJ1nfA
x8T+zItF8gBY1oo97Hax/phK0ZpijbrfVsee60iv0coaOZpfHe1sippvP1gbXsgszSbkIONh0BKr
v7k6uX1K/bmc4poC3XBsbFLmR1UzNbQQL1N46IZJOT3xoB7i7RhuNjIt5aUI04M/XAmEWwUM530n
XK4jBr9Ye/UAzne0Sp0SqxWO3CLWqXF+XKcxTiQyp3l2S1czBEGY8sUwovJ71s+S7t57aBFjU0qr
baIpAna8pe5JBIT0UHwnnEAzDxbEF8d6K+44imjhpbNsJumU4rOHEalakRYxLa3gqk0vLY/EPUsL
WwpHJOB3YRjCfKo3INj5pWuvPIzGgcoyF6JZADK3jKHJ6Wtxuj4aZ1gBN4wQyMJa7LX7Z6FNag98
7/BNzv8HBQpNEzKIYcZi6rGgq4qEut5Dw4thqWwLwAlWUw2oXLP/x+D0Ft3PNeYE+F/XyoB6uygv
gRgYxboZG75Wxx3SZePrWQ7MUA3QqoS7NYiMnzJj/STGo0whzOsynId4fOx7RBEJrlz3p3N7f36T
2arxKZhvgeQuY8jfBa4XYwLfgj6whI9GPcRhBHqraw3SB23W3C/A0FGUww6ETgrkPZwtO3Nia9hP
EuEnjUPELB1tIHa+61bj2fVl5xbCM2nJaHs+GbjL+QposiHqKMPhuck48+UaC5ElfShttZI6wBcy
8IyaYu8BMdnPB9XYlnc7MrbM8hUiGD88S9rey8DUEfWXDi6SpEubXp5d3MiJHLjcmMVUi0DccieI
9RIOnRe1qrwC1s9YzUFNgVM7wXO0iuE9uJvnhPNQFET4RsvqppSl7cNDAJMDplg3SGVQ4X3m68c5
YYSH+rjV3mu4RE914ypQniFaN13vJqLccVPxFU7ngiYNKcLM/t3nj9eNhBjZ6akYrmpVNdVYgNl3
DmO+d9DIe4v+oktf7UCe2NDYiEbfWYDTYyGMMGysulEDgP4u4onDy5BQrpS/sO2VSJTGKZYwirlP
JpzYN+a7+HpimxQcyyC6GitquWEHJaXvDC6cInAawph1Uat+laE/n1Vk8PgVt9Ax7vmWYjGLpp0G
SuolYEw4UWW7NgBmWZd80/jiv6QCRTXZvqwn9bmMs3HZW7Dd9NfbX5RT7/fdmQf9ejwMjCJKXBnZ
e2EBn7jBQXn8n0SjMg3ChistQDSmPvm4gt+iT8dBOq2SAomjwc1fX/jFZHfPRnYtQxlZSXxUIOj+
mINlwuyL0zUW4JcKw1ClA6kYG+dz4ZAJesPK1MCvX29S44+v5Pmtr+mg2+AMSTGBmQKw72Yp6kna
qpYiv+GNzba07LYf8dVRwwGyGgoQQHu3N6Ze1+i6Mgmpr8SY/J0J6ATLLTxsflddUCdwV99vJjNd
LwGaPuI2jXHcrDSmjCT/3filBfgmEz0F+m35iHXmlrx8HPMeOaKRE4CTqarK2mTqzCY1x7dA5EUh
uRNLKtyU1ssUEBB0I4v1IPGfPWJ7vjiJRwdw55QWWyFay7HQjiMU6tqzwew/qBsS2ZfAXe/QVB+U
9pSsMNSX7JuqF5WbFv1HXUkZeFi+jC/rzOXvF9uTlExKfEKwgoX+hWoOwJK9Vs44tpQxC6gZAL/I
UQyrE1MLySNk03yFMtolnuO1c3qSshhgTp7khRpX6Jo1tQFThi6oxnP6GdDvC+Jok7Gls/jDi1aH
ZwjhGQovdGJjTLp9+a/f2KdDkbk8HMCB1+C1bTX+Aagn0npxagY7vj/Bcm4nEgNTKBBQUgFV9mok
LWAVBWoL31mUkJlgosnbfbazNZn1fYlrQEz8S4lF/fbse6MgszZMXbtPGinsjezHxN1uhfiyXmph
eplMqle7hiwtUyYLGRjgMFNdZgKG6tm+rK4LChZA9GzfHVvONi2RzjyP69FKk0ctU3qA+DHo9BnC
ZfxSHOYTyPfr3J4eR+I5o06Ykm6+h6/nSmZM85m3QnzVTd/msx2rAN1YwGoOV1G98vxQO+/fDysY
JEVQlAIlvKiK4b2z1FlFph1VchsHRfs4QwiFDStgoy0tPMGLygtqLsbfDNWwiw8yEamHu1e0XrRq
JwWh/7h3o8UWObCTsI5NisWdNP1xbj3pC/bYVsUiWkvf6kHaEcvLRvzGVaqVj7g5H9vfxuHzIoAe
DwMKHOUuajlBfzdvXwBlvZaw8wkORPipsa1MQTpWIcpUmV1fYhmeAwZBgQ0Cb8Jp3Iyx+ddULkTZ
c4MeCTr4CNa/gQ1M//Ztx7JUe9ZK1JOUB0FUF8vM6fOyZ61JrJXZduJtcQfl7eacb3yCwHArMv3g
prhPI3Hj2abquRbZVjCGsrROTiH0xS+HTl2CXakktT96vQdKio9WoK8KFOAdTkTLAGdqJC7M736s
mQ+WxJZ7joyVvenTxYsIWlJgDnKvoAt8NyM2aHZRaa+6fRGY3CC147tiZ6l9XpQ8pClvsp2jYXc1
ZrDzI82vq1z6hxmrcZpExiLcZKOGZaoRx7F/z3415yNV2cDqhbg0Gb+n1YjLY2iE5RfPmFajyjUJ
b2NKvv++WHRjadIRORewOVATmF+AkP6zEDKp6eo/jSb7TUUqTFYl4vQr1fsUxmzDpv22qHATeEyK
Nhob65JBHgKAJIS1tWRwSwxVDlQPuKx6TmwqfpPCegTYcDGQ6RREJC/03TErbk1gK2ZwfjQIfOaL
euMDQiOc2ceA76X5tGacGdJ9gQ3AuW0bAESxfd4yNuLH8PlaW+s4RMcFaeg7Rmp/Jv3AeKasf+nY
LXFPDbtUKwO9rJQ4Q5AP8tsLQ5rNHL7ZSt1EfxWoWeuZUTIfLzzq26rGVd0Xt0+sbLhZvJ14S8Of
MoyXZQfPK+aAZAutSNv3A3lphHt8aP37jENXPr8YQ8NSHhX90rd+ZZaccJj4VTt5T7ZId55dTKWf
pvuuULF7FTAKHCl2BVfh3OosY4adA9cRgi399cJ7qj62F3vvF556WXmiPSQNBCyS6uUmhk5sTul3
yqKBdgvdGx69IooZSZy4rjQ7kli1YAUG4xsDAAjaNUCa54HJclwUjgsMvPXEObLAC+0hMmazOeMK
ebDnO5/2bngNQgxXsDpBgEEFWbIOcXh45meTNvOs2rcs5jJ8brj9qlvTJbTeL6eLAsdCpd+MJzml
6SIybPzxBFQUEkk4LS9uHQ6k5jtOsiSnOksq6cJ56FbNHNijQgSIYzx6r7RRUh+gNpI5RzZczEs3
NP4zNnCK/dlvR/Wqunz3IKpKwdimrWqAhKI7qA9Fjf8ustrtXcdYjb/6fbB9TKPptm05trRX05of
EcBLzzEDvLFYAmmVqDjZ9T8svvzF7XOTiWJO3SvVNa7pL+soTWJPMyR2zt0Xph5wkXxF3MHLzFBc
3RPgLXH1Ow+3Nt7l5A/loioHlP7Tjbnl+4HPsMdwyC0/lz93oYjEFLdYGHGcH4TmzFZcgEb+UdT9
3mzVtdJeBLyY8q3dRwg5nt4ge9PWkz8/EA0xBfDDWIdOK9eyCgLhCLX4om/8JrC0S3dN7PmPisuh
s7IzJzyNf8/gl02xiehsjW5TcogimN6AwBpek3mVDQjRPHAviR7ijNCIT8jqq2KP/S78uartzFQh
CXhVCrjL4/I6Y0fDJhvGZyl4rbqqwVcPShPcxaoy7Fs2GA17+zeTfwp/oBUXtk99hyjrq5e4yYvm
aZhdi5Vq4l8iGuSj8kyWX4q6u2TQoCRPXZXaLndkkJvrkvoA8q3/A4I/DctMNZr/CZ+Pz9cFYlyL
/FosxcPyJZOcpyrnlh7HUw/8fRRDThKsQZ6kdvt1KO02uygnQKV/DUzXYXJ3n75HR5XMuYlN1Auw
mk83WTHNc9V/wBnkSdYZbv5cg7XBYJ1tv23ZiXniEqJf9ehyZBHF6K/JlBK4GMumeS79EFHgcFFS
uOtwZSPvx8a1qS5dRdjMRy3+htHi5AyMCS3cAjwRUTkPsKc2XVo/zfno3TycvKVFaaM2MI8A0JN3
7n1Mb/T/9Ub/cROlB7QEWu7Kzz8fBX0ytn7D6Z17N8rVP7f01NC3lgulFNB+ICFP0yYihs19tB23
j1BQ8ssloeBNPBpZVhGfOcFnKoLR/T3ysjh+g9XmH5PiNIx6x8Rk9iuL6AvOowDRi7yObkTAcK5j
ApEL3tQpaX5moqGUQMwmuQREljjt0h3zLqz4e1ZV03C7J3S6Vjrq5DW4b+gaJYUL0sHGhvPSVvAk
jkFMwFbJsgQKs8T4xKCe/mDMRrQNXB5EnSYioGAmXSj/mWv4eGwxNYTEhMVi+G60OlRAGCDrqP7c
DJcUhV5LL9Q8rP39NZZ/v0rEEWuhPIp7uhNqJrDpewwB56J9ZOTX+v4dt6aSKNCQRgSA0utn+kuR
1n0Ds1kgjfIHvMXEuF8P5bjfgJx2pWpOrtSaCAVOZQy5txZ4rKGTxaY353428bIEYr34RUY9R2hv
9zVzhOYQZn3EU9Mv1yXz2nJl5vRRab5tJBawABYIxfdcgpKy0TJOFh+ezNKOTrVJR+91iqvK/kUR
nJtNACkanQJ/tCjvADWLBI4sjVJoiXmNqkIi6SJb4DbWcopRzNIXTrDkeAFQVK0C73FsE82pu5zM
qNSLQIKI+uDJ3+2qdTp0d9lfdsHxVoRXaVQyHQKk9tdhwc01YrgkKYaP/0eCa8F2HdJrD0i/U3W3
7KiUpSqY24xrFxS1LrzEE1JBosrVbkNWngcF2V9Cpl6FeBbVGHjr+jirPwfzioXhkpUA/vsGHjPK
FMFqIxTYjJ3uvjsu7LTPVoXSc28ejlKX9r+PNfnujQoQ0apxKQIsiySn8M5RA4BFOKd0tgQExK3h
D7Lpr/Om5BZOUcb0FcPCpc5VzjzgCLM3H4Zj1r5q9RsF8Q/HFz30l8mY10sxoxM+JzsPRsfnrzGr
bzV7UtOsP0as0Pn5QyHq7VQA7K9EKvO3oNY28ydK4iyqfrZt9C+6/XPWyRVdjVmmT3tRQtuXblTA
LE1ccN5Zw8Y3TtKC/6Golrt8b5Zc8krj2KimhWXRRIYN12SIq6q2KbJbxxTTvlRwQK8fFowr1cm5
iKSKkpjo9rjUB8Fo9zseKExHHHpOEX6RVIDt8QTwhA+1yswvXrhz1vAs8F1RNA6VOp0T/UI6ut2U
FchkTKZv9eg7qtHo0h39YyUcCmBprMwYZNssFeGOZi3O5PbVuOZtXre1atuvheG5keQoZgv9G+pq
UiXqX1hnGD4gB11z1g+cgGuQefdFn6pfOZ3JVSFK5+/BwuLOdXiLP6vzbs+zZctEu6j67iSyjILb
im3hPRTADgMaizqVnO47Ovw+sqPPVzuRwJXTQPtPzc9gx6n2iJWaar0Gcw10u1ud1u94e0L3qSGf
+RbTK7nNC1JsbpxFcOO8QQHsHdIG/FyBlFUxvRuanOdxJw0EM8idFK35JRB/z3TQL3xIvBIpMMUn
srXOWCCDA0FruZhm06HjzyNk9BIlmT9+zq0bRKNBdMDW89jT7bk3Zd7x0aA8324J8HOkNC4XR29z
WkiEdH3d4fJffjXk8+x4S/jPMQAPdIuaf9gLQxfMfn8a6PZWinqTwAI5hh0QPm603GQL4GyxhjMR
rp8emETAiD8HN/59zdtPXAJH5J0I4uJKK5uoTb+T6MVyr2RFFBnSaYEKCOAygPpJmrTJq3uqE3xL
8Bj51uElxOZ2nHsOymYLSOTmE19kUuO/dA1d0YGg1kyPEXP3riw3Wt0zczMdbnKd/aP15UPlpq44
z5ZA1nsrmaKnFnkMVHHL02rUqHGUZO2ujQZISTgetIrlMD0oYCX2tYwEE3F3+62W8A69wkz1igAp
+GQhhsUHH0whlqmyMW2hSx96/INywNokpu7cRYObM+o+AgqOFXQ/G4lfnRSrUG5ztc4Jnipx8/V8
P1T5NcFDcH/O7fsI1QGZnaiKZ9HFQqcl1msS1rtSzAgL8h88N/orl5d9iK0yTcvG53lHkwlCJecI
E59v1oG9b4kAMJsclEecNY+p29dmQv4h2mAg7lftIVNhBkTJ2zj6iXTjNPmSqyzGnqoZBMn1VndT
b/0kp1+J1XXPoMYdFUxO7TA1BQKARPmwiXYwN5SEYysGT1/H7si1acMSQGPjWbSeLjscYcoNGEMD
z4yXbc1ezjOYSyqg/JlInSkj8cCszg/KRvaceSj8zEZykebfIi3riHC+dQrMlA6GW1zy54APbq/K
7bjiSfVlQMvLUHbYdHWNk9Wam/RMz80HJWNVuuaO0HZPPyqGf/uNEjkbvIJblo3r89zmtzq4ec+h
zhNotiJtS1mrq0kqhJhA5eWumR0Jb+f3MUc1jjZyWjbLv+dG/Dmke2sdAqeLzTC/HPbxKZA4d5DY
XfiqmVQ2LTcMzTGB/2fYmwx6SCzyzjaoyPsONCXtt0cn8jlDOf/sdf8awlyhR8PyI2WJ4XBdZMmO
dff2XSuB5kbaJROfkhvp2X/Wcz0hV1fHeWJ+ptSnw/LO8+Q9KzJrW5wHeD8p7uIBJOlX20rt+4ob
Hsqy46G1ZGR5RoXglGWv/0DqOotWZ8X/GUOESbRqLeZLW0Eb1JUn9oYC4MMsq2XaZGMqy8KRq78l
gJJ4UxuLqQ+lvEqi+rQRUzjUjSRXn2rlCpzOpk74rrfKtfqSYtO0S0ENOwcRuQ8ndd47VwQQlBHr
KRorr44Tav14aUbUX/ms6+h4m77u/60aJ2ZKgCoXokqexkzww8nBz2grIRxlrR5/Uj6wHQuACf4g
3p9XDhPSFg226RhbO5N0/mpjf/ppgjXXtkh8EaqqDvdy6OZgjgmdluMs2lC6pKiJ4c6jhpPBJHmP
cvvSNAzkPF0K+3SvCd2ZFgwlhzdqXO9xt6PcIMkGfYmWlacG2AEuLQwec2mKe4plJFf3FpfBa0rL
Z65TtEkaJ2VmawpA56Qg+3jwA1RxKKjcZXLnMRS65JyB5E8bwzH/UpsDg3VPoDfMvoSlIe8vkwFo
Jww3OXqnQy8K3ZPoohRFE0lzmMSnyulXM5X0grcgX9wMYJMKZ7c2oOaTfxfivRqfN/PCEtjerFb+
Ec514o8riL4zzwVzeEJIsHDqLG6eatUJJ/YbvfI4u7dejVC3P0zR6Rt7acBH7PCTJGpYBaxUHGnB
Mb5Mt4S4GFHD3Pk14qIqTPkHW7KBgJV6IHLkENOzDK7neL9yKmTNU4nr24HBmEp5Nc82CsKVyez3
Iobp7VaZt7DXW1+1lQTnQaQ9S9hMswmlvEe5dw1lH7zMHMPIQopddG9mA+LSZqr2UrelmOgLtpS7
ZwpQh+VYIMTO7fjjnRyUcEzn5RXyIEa1xwUGp3o3vZcnO7qxLcCpjpEe+6duR4anv/kGqLW2XEsF
p1inE5pVF2k/dHHOGpT1sx/wG24+J1yUze4Y24aaJpTEqk95yyz99Y5G/n+P8eqX+4/UXBgYLuz5
BdRQIO8hbY7/ZfAE758JjJdLBZvgFT36F1tGJVl1Oppq/u8JoRVS1pQQz2o/qIuIfxzW9Hq52T5M
iO+Y3d5XK886MgNNNbXXj4ptHsjFqFVaN88GZgf6WvZFmvT22HpuAr74h/nzpEyFIIJd2ptw+XFI
2o2Qr1Ye6/jAhhJ3xPodjAmmplVkG3pKL4KyXF/b42+MA22J9fmTEVP1as8vw8joIln6bD5uEVL1
qjPxW1x4eZnvXlfAeVqScSRSH21c3+3LnA1n1vqGibxjVg+ESaV8Q75rRY68OEJMxjKwJ/KeRTeU
kynKtEHLB0ZHCXr811vMHM6CQbAPmaANylK+/M+u8uK054kHbKcu0fYNmfe6sC6aB4dbP0akfLeJ
zPQFcT8ttvlrhS7lGVstW5FUUDh0DhRRbcIQuZJ0EhZO4108deUNsSn66hi46umF/5rLeBX5eBq3
zv75JcrexrcEFfqCSy8dSdwarSj9jS5aSBYb8qgfB6CI1hSdQZ9/YXtgoFWTMLKnWez0Xiddz2gn
glDJUoeOJvZKp9vftI/u0Vuecp4Z1+jWkK1XnIIsbdiwrdQQ0zVlKnWSQs3gNhzC+NXUPRyW0OJR
GEKTXHpxcly2z1Sj6E7BZKJWJF5Evjl1JJJJxcoFYHxPi3kkqMClv0PaayR2v8DaO602pMPO6eEI
QGFpDK04ht9391iGRQ6jChPMPaFCWrLFLQHAlfgqAZbkJZyd+1vWqANmTLOF/axv9yLl0HqxuPnc
yE+8mt1LXn+RYKyqM7BncMhSDAhRB7xtOC2izyCPhTqV9uVEEQYvmGi+CrvUQYv4aqagQCKlqVBn
1BhVIrrM11Usl4KuKSbamqh7eqpn+hfg1230WHoEF0uXg0z0eCcog+V/JlsA505oyxZydaP6AoKn
nxCa0JZG2HBziSuUnweRMyhSqOuW63c9ex5ThXzawWqcUm1/YoEPn6YF58BF7HTUZF/Wz8lLdfqt
aDLr89AjGklByYXSKpDY3QPsNK8qLhTNnYsawnl7dqcZcK97Z8it1PEOsKG4AArb5XkMGUFRodBr
a9c0rqq2nTmHeUKEl/eHEgCbnwoJ2cyBR5LClX8I137nWerZubjQOd0ELwnx6fp57hH4BW+gdUX2
WGHPUzV4cWD9nubSGN92ni6ds20PWZOJ2ZIVBHb/QUYTTTD0bVUC6PaaFZVRw6f8MGZWt5aqvk8M
peqbK5u4JBkJUPIClBV9C3HNGjNArFKkMoJpEU+5izZ5ADpPhFy5PMW4iLiJWQXba4S/g1ehJ89u
+MdkR6huQwixbS3quMNrxAZXDP4kopri5Mp3tVuPJz7e0rtNXooNhDOK5Y7Oyw5BIhkBjw3kfVDx
yRLdC/ymI4f7ilPUdd/hII6zxjnI5Qc1mg0NAYFiT6PngSNuLdhnz4cjp8kljHHDLgkmDZ1kh7Bm
kcsdLEM2y+Fa80OYI0SMZz/WuB0TEd1O8xj7c4JrWpzongWnj7jwIRHFDIhnCjhv3ZgMEXH27r8T
VOJRBIK6bcd3GMPZSRuYE1KbhyYpVNBUrbkFhz7Cfck6uXvCsa3NGBGD2lQqYfNtOpw7I7MZ2d3f
qaN9rdKYvDYIZJwOllMkpmSeFPcV/jttqU29VN6IabXKy1ofP9baVJXwQxHIMBp2tqEcbSYNUiaS
eKn1Hvbxh4TNepU0auTPPS7AM9zpn6oATG8a5ro7GbW9gGoAF3WwQgSOkTHSmUmVgsmPDn3vv7xq
6b6l+zP31eZjsgi2cjqvVVSbM1doQGKfyZqA7VjIKDLJPqCyfOGi8hUKLsfRJj4tRvtXuKm1rO10
FFKeuEhDcKfWXgY+nE2VFjgp3/3yAg3RQQEe6h2HVw3kZJ1c2ZZrZcPjMprcenUdIrnpJgEIVm5q
j9bads7i9vwjQ+ycUDApxEj+QiuSIQd3ZhaykFHACCHHDz+uzmE5rfSCi/w6D3Mv1s2xUiTP+j2p
/U0A7oMD1CMExAqzii5cf67EjNMq7wsAceSi5XupWKOpKTrN/CtvTlLtMj3emUSlP+2fyND83I6m
24LHNIP2vA9gVVduNtIKkFNtaQzKRf2SF14/QFZuDpL9evwW4MEd/UaKBDtVhHdqloOKKeRRBRhM
CGA5kRIS4JfZlE0v9YvxKeHPJWaHRkP7X+LHtDSi5hH6aSEa79NXXXeCx4Hy1Fz2LS6aRz4uvtif
PfVJifa8hQz6uS0qkOoKdjLHVmoWIfWdrOFoJmZ0piZLsg/U2+32L4R1ueBeBKaABYr2LkwciKon
b0n/rzeeYXCgcaddrwsWaSWvHmip6fAGdDz6GYTjAPfrq7dyx/XsyZlmQ77qTJXElP88Vh+Z7u6y
fQ58uwnJvv98F0b/8jXckBldZDv0b3QJZjDNFCsTAVvfPPJG3nqzQjOu0pB6s852bebKUMJaD4ki
Y+N/Q1gq/mgjLMPaBQFOR8EqypfDyafM1MjAZNlUsVreQHEx2oGPpZXtu9iv1b0Bw5xL0Pnsjnnf
VSN4Jmf42rjK/43eW1Ig80kMxQPWCtZT2zF1VEJiPe24Nu37LqUAH0vF1LKqXFqETrVDNTgScTvw
Ro3Per0YYeTTrCrZdZ8I8UXhgdovTEvon+Qcv7PkL9bt2fFVlOasbF81PhJcvk1pSjbE6hBG0xxX
tsdzJGaSOjAkL4xHWTmZCXkuGqQXY+8yDrM5KpkVHNVlJKBxGU+iCyjeVUP6/cxCTWwlVan7t5Bl
VZfBdMwyE6du6TkZz7vogh+XzX1tLq+BizsLXU3AzrpRuxL+BSDsDPFn+oolfkYexNGE35dCNqFc
WRbNK6yw6ZuCYDC/uahIEGfc+zXkoEmD9CgmoMdGA0ZctftUyfpXiFe4SUo/EAtsAUgnes+ojSko
OsAK3NdK35HWlJAZR6P7yoiKCyICnR/fEXp6PKbHWtTOPC5yJeN6/AG5Vtt1SfYATWpenRvOO780
XTEXFE8WLscfER5q7/EpfWZZOAZ+btCjUYBnvvc3kiS7iWLU4hBL3petPbtVlyJpxaKq4UXSdgqE
d/yL+JP6hxcrSiPMxdFvXh2P1GTVy+UfFgrJX4LqNzpv6aVQbUEeP9UYuWzIiE5C2hD1Qw8nEOU+
df37usx3RsK0zLQS+Go1rF8seSPMj37pp749czdcG5MtFYM4+Vtb5vACjmIHbhN64d8m1i+60E9i
GFHzUfDdhxpD9B7nmVNzBD2bK9tm5fTtf3sZi6tH+8dZ5N/m4UX4T58IU7YuwmCwdmcURZqaRK5f
9NA9sgnpqCmyXf4GuKKn6lb+KfZB4xke/RyH8h5n8LAMZnWtP4c3fhfb+qcDGdjck/SduS9QGyHp
I3jC2lbXEyvCLsrDxIuKd/6OC+7Ia+JSUgPYYeCyqIil9zrmwblESliQI62J0XM5niHGu6ius2H2
HQuIBqKxwuljjfhEmeM579XBQ2+bFkpTiGRanWnQ4VkkyAyVL4tW0rPe0gFlXSsgaGiXa/h25u44
ZhqfCEP4j5MdU73YfiGEhPplfSsVedWgvwaDYApuOLuz14aQGk4GUpcX5x2/xCc4XDrdZao6TnxA
/kOhg2wB18Um1Yqd963nuq5CgpvRiJUr+Qcg7iQgcZJq60xEzY898A4dOq0AHGz82o9YnDhDPswh
JrClqDZlkqtZNvKuSQAUhBCRt5NxxLpXV3H/Xe6f7bHO39zJLZObJUexylkKlX5owhd8DbHDJbwl
s5pWGjZ/jMVW1aLojeR0zI7V0xv4N/1US7fg9kLr5n9ienGpvj1rWBdSnGIex0N5qcct8g24bwCv
shCjSBXSgRs3lsfktejhfnPrlnoHcfeKWntNAJjNJqN72A24r3DTvLHwZOtAxokYzh0TiTY6uq5t
6J3UmfK916iFQK5w7Td7Tg6jUSnopOi+5CbinWDTgOI8rnFfhG3LvMemF7owE8d9nCFxBRf5qRJp
40vowY30z583UHI5audUdj3fpu/vjZot7B0E+x0p1gDHIQtwim9n+wWcJjgyweqUa7FCbu1rN0YS
hikshml3FoNsjy5XTo+q3NMYgfYoHFxJRmMO1VaMlgUjWCDjCOpv2epDtwPLpQPv8TNkMTncbuPl
ulViQM5dr1Hm21W8U3Xb08lSQTn2ipdtogPqcxKwd+YB4yHfdMphRM4oYxwPb8d1+WdObMoqqXht
dQ0GVYTFJ/SwBtTKsu8eV9rABVvMORdGSCfMsdpmvFwAX6xGmWSE4vYxV6cXWsKyHZokH/GLOz24
bYQKTCHT1+8zwBXpcHIioJGydAYx04P2xOgo8c/LvKMcDk0ARC8eSyC2pBqj9JfleMvjF5PaAmTU
3GfUYcm2gjTbUg6b5T5Rir+UzVKXBJKgrGw0P9lJLDbsrc50evtqWW4SxVEbzT20nL49KsK1fGqb
qyh9Ud/IC228lzBc5fsdlL8JBxmdKgDYGin/1kAatMcke7SXHY9dYfaBycpWL32ry8UjBXYFX9YC
e4n4EybCtkLvAB+NXVUORw8psHKSUy802IU1b8Hu+4wexFRoqURGp858vE874BAtRvl5rgXNj3gW
sUz62Vo60buGsgxp5lzd2bTaL4JVHlFfCuDqY2L1X5SMvR94/9u7Lv3GhFfaqWXgMieGbwXuy3QM
W8uaHyi9AqUyJmCp+Z5elLkI/2leL2u360puKp8LyQUF6vC/o+BOoOb16jOQD2jjJA45je4Yazf/
GdU/U6T9nCsfIafqndmqmLLxwKvXDWWsVrqi11ZU3+5zkmJJHHcYMo6YqoWNuEc6PNMtiHR3mi5R
sLYpzcmDT7RP1liyATxMVrVI/cb6SOr4ByWrWxUddxN5V/BOHbf1l9eh4CnGkVUr8p61UvkWkY9u
7xbkxrHCWsz4vZIzGxEQuA++5TLJAD1HhdqWRNFF+g3kZ8M1uivkdIo0fu8uV9RimesBKZETpFbw
iFkkloO+zTdWcvJl4VzNz+uc7emR+SdiAftcGjlWRHeKwKYtrwzP+Q21n9avmDfL5k6wALm8CTE5
DA/lEFEGY2fqR3GVOHICeXoMdPiOD053QWnlENkcQPxYVe/Ry5vBpctPSzjeoIpSfmC2hzvEWfWp
YZ8JM8YJXjy0tpxdYyb26Yj7dHIkHspSEQARu/pjnDpwrfQiOoFCXryLcM2H7j23a5FAFdcjKhUY
LP7saKtrZcZ0QC+5O3tbRWRvhlur3NkTOs7x3HMlVlBYksQJ5pqYLOnkfMbM3tHgRgfIJkHoShem
HBuPYQVsPvUZC4LZEKUpHc4ipNzJ568hxw9K8gy0BZgVqnFAd5AWAzLe/C9Atz6MDtHLQXPG67SI
2WTJ+CW5QkvaPWNh5zPrrGKXvT2JY+U+pHWYb4CC1RIt3aGvMH9wHzo5zqlZHwHoeQBYiJzhw1ww
GAf+1w+JBxMghjFLgS6Eg6o877TG5Jqnsn/hfJdabtCqXM4jWXs3Muv3aBFHRlu26TRLqekIs8WT
ahBcsXNoyENqB9sZRUwHW9R2WlxjKoTFnescJdNFSEtlyp1YJtyFQLQxEPodqXDu1W72MewbdIOA
9kawI3sv04sipH+yQGAxEvz3vMmg3IXINGjBsvX8k/gR6/rQpfj/c1y5bkq+nScTmylaHXCHnvfK
Nrsllsm/Zxzvo0z2rrXF82XrK60BXv9dzq28W3E+9esllJCJzGQ4iV7qNdDuKM/pYdLFusbp2Zta
JUf1u1nmzKQQfYErRQXcvyK9rGK6TjIRcUH418YDZ1XoEsa2s+C0XNOz/hORIFsAq5O+L1JDXcCN
2AqQq2oBjbYYCID/gP/+88fG2d6s66jCeRJgAVQvAWxPXekdZCAaG+dOcBkXkkHs8y7yJMxHewcj
rdG9LNOrS7McBfOqwcrAdDQP3GCW0g/5okGzZVKS6zcuIp49dYTt03ms3YsbLt2pC1zH3i4KHW1Y
VU9cy6gHliJnw6dPwM98eU5sK5FMZwS6pxfEgz30c3AL5+lCE1XNw8BLj7PIFuq1NY9ok6HRYrem
Q+Qs84peTU6elCV21ndMeTI0aTwdZUXAqkQucSDSTUBq5Wb8orj8JQFUSiGM10byx7ymrZZXSS+3
gmfKpGMYHzsSw3WzgqjFuaU7ActYHgWO8zSWLzc4h2WnLEUbJVLbyEiR60suMpscgxArg6WeOigN
5pVZqSdczGX36sH4c0MKuz5GORftI3u46ZgBgwIzOHxG3ei6pQ+WldnYR2xpsvkApS+T5gGplQKr
dAS+IMXcQuO4z+Yg4Qe63I7VeRoypHpBYToK678qJIAXleAzkrXKOVXIOThbr1ksAmz2kkusJ5B4
CRLBvblu9UkF1BQomxx2VOO2ncXOA/egyO+SRc1Q3sIhbwyt+ms8DNfiIpuxLZBRRixDwkdXSd7w
LUmZvKuCZzRDyxN22FidxXHcC7bKsxTlhkyzltfvHxnwR7CNFBGLvdnQH+hOAOXs3SVw2C77PkoY
NHy92UUhDCeb6fqE09MOmJiDVXoobAKFg0gZ5ykTRh9/OXoAeI7nHDZFPGsxyN5Glx5cYZn1ARea
lFAWgiTjGBUIEFLS/fYfCj3s8R6Ql07wxwxplxK6e++D234AnIhLnazQOSaddaGx67FiBEqzQBbe
e6pe8yedN1ANgM1LRvHowMqHjvDLndVNY44ml+fTJeZtXGKqcLEsmmuOPF30BO1ljA+KHanf9EII
VXP0+anmsRLJWBqfknavolNinNEonsigpgY/QDn57tiXfYvlOP4qcHdPDODLHU37xhBT/g4EjY39
o2eLaH/BJbpywI3xas7j8vFmVvjcP0M+GQxIX6+CFkTq1USu8K9q8FO0VIAGSNIE6zA0WVLr6tAG
VFadZtVi70ExPwTv8RJ2/vBPon+TqrKmuZZPFUYkV79qWua4hjj0umDv0/OmtOWGwSRrhG/CGCRq
XmkxyFtBCcIL4GafmAZ5zD08uDPPs+cIbzqgRS0CZQgS++4UMhxyUWw8YU4dUz54vB/I4Lsq+jH9
on6xJCfh7tc0oVntZQXwGJkFbzftDkwGLjWNinzw0zTPwZZMp1V9lVCaxMXlAhg2OxyakLguIeHP
yLw76GrzPWFJu0vBmp/7VglCwYokH7l0rEAjVxzK2fremkh+aM6h959nZTKSYRePSywaSiWPB7M8
HU4BKgqu8xw0jw4dl1s/TWaTYnPNUMb7bWaIKhgD+Jm3PB1mVNqk1L4mRYYZWcjBY8nTGkdDBchd
ikZzGgyG1Jb/ncw2g6fFTFY2vQbWGyzHbCb+K2s6VTTMlrgk5LUhiwQcpwXcQta0PjsMk841nIA9
P82gMpB+W5yqXz4LnAcBbwutHR5qtqyhePrWoKhPMdgBhtyNmUquuSnoRYV3RsikcjCoJYaEmc/q
No//mdJQ1x5B0HHP+FyxvChKCLsUjshHtEzKOv7HW959tqRfij+av6lIrxISFqIllPNVwNJHFF24
7XkY2NzIMN8ftjgF00a4zxKvRrMwknPKanNcLgM0lmR1Dz2N2pDNKds1vX3bmHnCfTHLmGmX2fkD
tVnZif3zDnUDZC2DUWOmQ3V4CYXnmvFvy5L0aAtIfHO2JjA3LnQqqR4qoXWYHSnMGfjLIGiQNxJV
43H7QDhtNSfyHszQSDA4OmlmTgIAk+rn8nUo+Nd1+Oi/vnWT48yVYjAQ+kFN2loZbm7TYgI12GYg
ibG/BK96nTaRy6ze4Gatc0O48uTeW2DBKL5YWvkAh3qZaIWgWZIx9iavMEID55vIWPFNpE8TztzK
DaStkrFiiBJHMmf7+0qewl0dFcoBczIM6tY68mSip+f6pGQZH0s5Y8kogomOwwJEeQ6Rz+fvdwZJ
Y5XibPpdSCG+E6/9nvNwoGBhQf2U4xwvYKTgKIJfjnBcMSa+O/NRSNbJPmcufZV3aBHUIrkQZDz3
571XffgxVcxJykg43cF5hT8Q0JCtPuALBrukI44LmEKgSb6NfDLUZb+NqHFiCbrPR7nm9PHww7fr
3EInhj6JYHAJIHucgpKaEIhgicFuZQQIcxisXZdIRzDsfARx8Aa5ifMM/t7jkDhgXU5t+qw/997N
foXYD8dqsTMAcMnJP/W+T5+YsNrv4V9iGZhRGKjCAUOQgoUSxNwW0cFEQd799fqkiaFH3h6/4bgh
StD3BITGY8CReE1Pxlgv0tnVreHHXOS2eqNq8ETQU0mtApJ8UopsS66N7XgeGIVOtl8iOt6fGesN
k+YSdr9CGU8zjd5Gi+i0OHUtejIN1vCdBGNTBrjiGU/hvi3a8mxDu96E2pqjVNiHW4fQXFga1itu
6pquaiW6dTuYv6dtoZadfrmoSp6wGeCcGWrS5cM9/SlxOA8YLlTyairS1J09hBx/Bth/L33hnHiz
tEnMyLBz9cmyU81gTjnaTabYdd2Pddw4jChwXKUK6kSgqFjlHqRegtiiZ7tLl9WIeLewMT7CBSS7
Mp3vyimY30qSwl8n0fBUoZsU05lGyavy4VoVRQWBoguMKW5WIPK+uAvjmlAByvQTxy1eJffhI5T2
oxNnpXQJjd/tZEkCLZaJ2EgC7a3rL581MJfFL+lAOfwb6ffxVOJd/OtJ7+RM6Vkh52N8TL+/6Pf+
NbZsgkDFrWVB/W4pbT0w68VwCuggCdCeEXrrxhSSqbdd/NMOrY5Jkmrunl+ZCwa8qlIsGKcXJTQe
U8vkEKeuh5gDwtaUeOJSK7lmxt+BTFR/k9vnGb30D0a/vMe9qUB1XksPs2RWQQ/ccZFJ1jgzsSGp
XQbhGZme1b7xt0SJ4fLt1NZXWJl6X4OVw+gc9zr0fUF0h1vAQnHE+ea4z/yEQaaN5OycYc8mV9lR
7CRuaFCOyptFFM/iKkK89XNYaa0tMY3j1uHGx52JX9NQgF+CiAH+1imWM/y2UK6Am3qx6hpAjaNB
hO/kOjhGCDiy6MOMAFXHJaiWtkFTTx1DYNyr+sBEL3q15zcCXx1RBn5V9pMZ2KMqmru1WcmLBZdy
9v1dCWy8HmAypy5viKiAN503KyByegcByhDDxunvtsy889rsU4Q0nDg+o7obPTdrOCQSMILAQEtU
G6Z7UpLPBS5HEQ9NJOugEowd+pTkkkcbZbpLgjN/4+iH1iCsNFPHGm3NIQ3uDtrREJ3D7QKAi2uj
m4anl50R4gliDSKOC4ImaKQz8xiO36xDaLn1T7BoAzgv02ZIIl8ND1a4jHF6iH6zGFplHhhYpUOR
F7vEADUI4F1C3/EMCIhvVYR5wGfjG6t7wzE+Kb+x+fYWd/m4ff41VJpJBASUWHsKO/mq4MuTq0SJ
8iOAgncu6f3b0Ppb2F8LkosYH9JO5NyZ1Igb0Gr5tKsh10yKSE4Ptng5PJzNU6mJKpBmAd6D3qKk
OfqPtX+M4DT5qNw2cv6X8uZ53k9VkTiodceCJ7rAfa6sCSm49ef+OLwgphCb4ujVpc7x4a+1cuRf
819dPgj7JrbRE+zleHa8TNbypRQGGi8KOZ2I7QsRfvhB3R66l0m9/z2HniOsMAYQzJgHYH2EQ2Y2
LED/0F8dFM3D8j3HRcR/lXM2qUXAm/IlDVZtDZ8UUkp2TuBfw3Fg17d5qerXUGGqWMBQcGf659L4
0DSf1TdJMcFOWyTNlpprRaSN/gc/T5NDveTqx1H4SAjZu9wbDKXv988ibTKXJF+7p8KYuGniK3VN
5x/f8CAWIU9h5DzayE10WMrOQ14pA5VE+S3fgcmfhUCR5htczbdykY5VC3mbI3OtqTzBLhIlXBx3
F4RTOGhlb9bepbAJRvrjnu6sFY6XIzC5hcinwuEf9Ax4swFcnz5Xfm5QZxTZU1dqFYpnaa2fdddD
o71hPqk967AYhkDUO/rETS7TA5Gw7X7urSpE+P/rk9qLbMaGbk5FzMdA1oBK7hBtPhJM22eRZcQS
h2qYQvM5eJZOnj2fKQDtH48Lw0os4ZsuRbhq07L0Xjqkf09srJ66OXT7ZUuaUbQwup9cME1Dd/Up
VRe2FooS9VR6zk4uPCHx0uflilpiQaCIbX8G6VkpZ1Xp0PsgMQlosJi+s0fq9RugXsyOaDBXtMTz
i+8yF4puf+B6INjrI8NYkJIF/KLvFWfbGN2xacoHW7eyVAcmlL5W6HF1vLHG+adFh80Iee4DuKFp
I5ersp8tf/lznYp6MZWaMXzewMPjEncEZXjD/5vgF1vU3GslCRDOpPJ8r9Lcg+t67ox/C9V/cq7u
/c3JVn1IIi7IgnEyesaTw9R+iEo56IpK9iJgyoumH+VLK0tHjHq70igOA9ZVZ7aPUIYnwwE4X8Af
U6mGrZJqICuAOszgxczzf5QD5anh8PPaFqeJQlrfRCzmA/OaSDCANBIW+pMWh0frgwEwAffjjtGk
ZSKK7GSAEAV0XQ83OhtmydndbGoPq0Shf+Yd9mrJLSfzItt/dsqOCP4o+j+pBre25Uf01jzXGmYN
UegOSzQPaCkn07zSSWEUq3T98O7IH3K8T2JsPZchF4tSy6YK5Nmfzl1BuIfKeQEMsR+yYrb43SwK
T1BGP9tZzzeT+3aCCjz4hwq79mBdqm4H38mUm38PM43buixxXpCc689a7UhoDdCO3Zwag/ZZ2LXy
Bf9tHOa9kMJ2gfk7rFV0tZXaLBMpa1C2s4zaK3YKoHBwvU4wi1uPr8+gZ7XGEiym+fN1R36PcnoB
FW8FhV6Zls8oHxPA8Ptviddc2Fhx05qECLeS62Wq5yOY3VYii+HMGCwbGCshYkLWs3NL0+ex6cpA
084BErTjJnrVnMVeXQhZwv4NxjL2jn8lXavfxJZ4drbp0jw3rAbpaa2d3tsIUqozrTcm8X41enLU
CZE3vUVZ5x+XbsdfzAsTGiS5cmLRByLc9R/zugNHjBAH20cb3sXHm5+QkEgJ3AfpzFivVBMOUeWr
HzGrSchqJHyufkV4UC+4FUCyOYQH2h3QMiHM8P1vJVk6IJ3vpFvExLNnWIpbpoMEpBb+Ws4bh+cV
OGFVegqxXhBMtwameBRSS6C2oFEByen4Bc+JhEGaAhpy9ULRNs2puAfKPF7JZCxlcbBH3/Lf+AhN
sLSh1rl6XmJr+/vE3BpmU3rPWK/kXWaqLYN8PuEj7uOlCZbJlvk0G8fEy+HVaUyKs+F1VJ+SBiZZ
kPRuJWC56NtSqWcCxCZyFES5b9Gr2pss2A0oBEcUKL0o+A7DvCEoIK38EKaxHYsXWMhwJRJdmoO2
n4STZ/OywdrjRNA6DGyqqdb0MGf5jLFU4Hxsky/C+W5EhiRz2iRHaRctInP3cwArLqR3o9ftvHZk
YH5JGmNiQzMuRxmo76cqb1jKtLgQuZcvqUAiO32UtX+1qVKl7UFs1wJgnwWNOMAdpqgSfx9CnrJQ
riozzoJmB/aw8y9J7hDNYZmFjDdwg7uoNiei+03zE/nD4ydZv6lSRNf+mrCb7eqtKY5krcb0twp6
vGM+SqnOABAQmtH3rpeUFsfnEDTMUKZn0PAWtqVuE+2LwvvPlE+SH0wpb3zvxLUyJYugr+V+bNIk
LxRTTgvvA7THGVyX3xjwij2+8+mU57qB4tmCWjrxKSJEWAIT7CSiNdNUHnxlkyf71UJD6km2O0Q7
JVZCwoIEoGjyvgcUatl3XL6Y2suMst9qnIh5suAj1vHJFBHuV4UKZ3+FnHfFOdAVj9WaDQw3mo/L
FoJssOmmNMILfiyZsZ+0WzT0lANsTBi8Sawmt1+nzcPAZ+jUDqwB57QqYl8dPOxKqi8oxUzJhR9W
pJwaPa0K1igdD0QdEXWeL1VPUmWrGAIY2pd1dXR/UK5gwjH5d1KLmOwe8edBJtFUpHYT/IJGskyh
c38+usqr5n6JQBDOODnkjpYtFq3pMtjRXGZds+3AH6dGkmiWGaPPa9bKk6HJ+oVmp5nkQqxfjN2a
Db3SplwlavdeLBgn0s4vaNnmTDBIxftJIEijswMc9k2kCCkH3RpE0YPuHcxZhQgJEPjs/yRZRNI6
Onrw43iTcqq66IDIfJEDd5Sgr34xCM3CjIce5mNAMZWchjOdzmY3BvTmjNrxZ8H5bBkfxd8b3fTR
k8pcbpa8yk663kjlwm70Vm4b8nAz0XZEGX5l7mjE0L8376E/dS65fFAL+ziyrnw+dEh8SlVugWOv
zvDCyiFokmH9LvUGhNfiprqywVXJm2cEeOlYREhWUpGl93+OggJMiyLCtK/Uuy23SsREG0cdATEV
1Utpd472fRAaiWf1vnPIuUT86kgjSLE4t6wGhbnXkfcekS+8PsFJRF0S2jHrgETcuI10cNMyyb1W
L7rue12Wxrl6zWpL4Jhcle2FVxC2FLIpRsR89XMmBwgDtqCPYdA0LnRwMarG2sl0S2/PW3d9jvr2
FD5UDSi/MoWf9gDalLZJ6EezPTg4d9nZtTGbLVUKDxngjeWOgeFOz5Xh24yCNjsHpfl2tk5GKEQR
BnFBANZfFCfJ/ZMIH+xvXilJayInWYJVFbYhuUYsLjiGc7Jqyf9jqVaK/w6Cs1SN/OtjtiOpgKt7
+3ijZ8sMEkxkEQupqJHvtHawGQ50iPNia3709XGpMtIffUxL49bnFYjbqBeXe2eOWz1TGspS6ssW
2P8XQFtrzYNvGIKLo1R1qlCADpRTfWSsJTm5Uyp/SsSlfPrsrjZy6RSHvaB7+J7AZZLdoDIlXTK7
/qjKRSLGSnzHDmhvhvL+rm2ZS5vPyqIPQV7KyWrekuSOAy3ZThzZFsfKmTknBkFfFqTX5EkLo3JN
TqqrAPX3Psn31lwRrEX8Eq33IKhUpCCOeq2U+GEb2aoT5yBK9RjXo8AyHBtiaR7GSATKdjZ8mmbN
5LhNWCNn2I5snTMJxxT+BvMw/G5Cjhyu86CNh12VgdvjGNUSxO3ezb7g7fIx8KsnuV0MKHx7SdIA
/lB0ZjwddWIETu50lf4tl0Pv3TcdlK8jvon0fbwqdgTqS7gvAsYMsamsTxHBTrygBm5gcLqoy/Ae
/S0fkuNE9QIsrPrpR3aP5Fx14VOMWs4IE6+cgJ4wRFwB3aWi2zy+otpQXRH1m0ypnGOkYpdm7LUm
Dmx+LQ7qtxhUW5azXhMCuKvlyGGxdzLNt8Q7B0NFFv6HU88vFSNF3pU/zoxGE55JCsRI+UEJHWg8
Bfmg82Zh9aXHeeh3fgs7TArf8BzQ/7VpBzdzArS7khQtrlJCoB3WSdXrPE4CuKWRH/cLWXRnejxh
C/ZU5mPo0kgbDtZFjcqBu5aSS87rDna5LtyCqNPE927e2dPA4R8RmvkAqFJs8tJTCX+oXCEslO8p
Rwz7PIa0BN4onmeAnMc5JZ1oPgn86ST/ldDJH9LiY6wYSO8iD/Qxv/NGWHw74Nbp8kg8A0tb4uSi
LXqt+/CYC7Mdh8vJ4jgy5W9VFLcYdeLRVuqywlrSgGzD9uvkOQivgDKuKOu+ASTjy4ymPqvSbxYz
UAkVmA5pYMnB3JItbpvDMok0sJY/qXiyFY8jXALjZ8vSL6dGYlzt3WendxPsx2qGxrOe4jMVvzso
hKcx7Lp9FcBXDISiGmtf+OLYY7vZyL9Ayi3XE9mmh339KotjLiA/JpM1S3OkJNvWIbhc9ahNFCTf
fNDp7VQC8EJhecngP8nIsCZLOBq1AU/R6S4IF5b3T4y7Sh2QpuJvD1lKUJbbERJ+VNBRkxGe5nnM
8VoK2JQXXeC3Egs3VbK7ovMNYpL8Cxub9yMoSoL1L/Z8UkYPfE4fgMFICKPM12ilm14qMylMFleI
Q6aSB8cafv+HHuf8N98wXTJrLYguiwJazt3S4gLkvzg5On4R+P2ekClYLXj+TEaFdLVgg6S8PQxm
PsNuNDp2domjeW+4oAlOAEJxzD/wPWQmUCAMldgPdICnBo2WtgvTRtOcObAHom+qGBAgKtBGzW1P
fE7b4Ty1FLfVvJKvmY+PLYvNx3BXFaRD7nPjR4x6lBDPlUClrKA1Ya7rn58DlMargMZeGObWvQjK
osInfbBeieRLiRymTG/ihrxvtvFCSlHfDGHOsgdcltNc/YInTuvJTJ8nazyqtIysnLIWUdplzKtq
ARc4V0CdP6/ORF3I2WsvGBT3hNWV8nnADHLyyQL3E7XMSUtzsBFIbO0ef3gzwksLkD7i3C5xWR6d
4zzEiRMRJ/SSZ3jP5IhKFa+hXJdJy8SEyLHcxQ3z+cGhZPc8kespU6ZTXAe7TYyLb/pZzPkdohFn
gnKxWcSYd8tEQwchfzm+/cZYIk+9BzNnhl7kXG8MaH6pYc9wGyQDwvUKhRTEM8IuvF5zqY8+DY+z
FZee17tOgZDvKJAwVeLhw8RCnt2UHqtHWGW3FVQ1qc9oASR7bIHvSWKKlKCDM2Ke0q0bGsIqb9yP
l1hhlj7SUvC/BjU8dW3GKq9WuRTqm03HFu9tYVBkvrMZmo0b/tMNiImpDPEAntUUPKHF8wpTiXdX
jMy92IfWlOMHcVJPFhh+snkeSJkHXDTyU33/hhfOYSvPWuvfVDzy54jIHIbR359K3N2qW0zBjS2p
PuW/pcBphqWZtRb34eRWJ7AV0BmJhBBQU80csHskHIEK9j7zrqmZCXE8CyWqx0itlH3fjayE1tUe
2oHw5bX9w4SURxwjW+PPc7cweIPP8Bo38/XRuHHETvpGdj5b3PtArybMNdz8pwk8snTv+Q02hWbg
yo2iPGryyyFBXpZ0z6Phihx9t7pwB9fAPWXk1nuBNSfWek/abHFIAMVUNnT7F3AJZDHT0+swY4dY
3r3vfTCS9f+9W5rEglJe+yU4wb97kSJZ9RWMqmejpwyK6jCXSuLPOGpq/QyHQqyAkVFB+xXaIbFl
2tHRoY5G8X6QWdtmj+/5TXJW4Lmtb8uxP+V0I/qPg2Nar+MRTPGrFtxnFDA+X6OKOIiYICTggjZv
BudCZI0TsVy4l0tags5YN4ZxDvHl239t2UQKekva69a6Mw0bsHh+yypKT+TSRtER7r1hVQwAK4Qs
lFWOZi2/KHV01fFF8GneGuXorDS9wraO0KRfE4/DKzzx/JLqwIVNy5D4h+WR2H13DvYhCnX6CZYw
SEUtB8BxiWc8Ytd8+YYs3QN3I+yjP8I2xdheYAEhUtk8RGFn5aa3OmSn+BoAy0TZKVlFFuyIPOsz
qb2go83uitmGCiVg9pxfew5GZVsYmm5a2ZsdtkZaPcaXnxPbXLyUZuxiR/eK/rNwKFOzaGT2Q+Ks
iFc7qQJuzEKdaDTVmy/yWUH02S82lswOLNEABcH66e+ep4+kptb/lc46xqNN7VgehVZ3CtcAZ2Kw
pZBMMKWS7BvxjkuVaii1MkL2nKA0fnx8wzBF+RrnF+/m0Uc+u7iOCU2g1pt6tEq4lJanurDbRgBU
zM/L0/E62tOLz9KZKyaQypHxxYeMiAzptzaIKio4SGBBHrY49gJCpBznSEmtoe/fyKb9up07SRdF
FKAk8FbGXeFehZPjJ1nNi4jSPqCRGonhUbSn24yDr6tZSCZSkvIoXyyIHdDiwGEKnrym+L92XIpI
atXrxNf4cI90T+PXduO6SLgMaVA5ew/+pKGDrpoqM5HiXCQ8dOV9aMGrJRuRm0j1O/jt+l1ZV51I
//y1E0TgkC7VAOszJr33/C2u9T603MnU3fsUaVaots5iyOoQoE2klt/PslYMKa6N7AQQx6FGy/LF
1FTFpc3bfEBQuU3hV1RjRKUA+ZlM3etIabowY1Xw1zSMGjPLakQh6FSQYwR+wvGRfZnNNbNwNgNN
6jM8UOeMw5vK2yIHvzpI1xHlubr8QzlF2ZYt0fYY+mxK38vRoDNfylFGIT0FXoRIbVxln31/E8rE
QeLAhyI6cHmrepPEuHjwnrgkkV3kOFCOA9XCx2mkjESh2Rj05FXF6pOdNM6Dy/tRRYfWc7DkeIKE
OqL4H6xMvpAk6CeQ3Tn0G2HHFwb60r557hhxy0GWBb8Ks3tIzEckbqaiBUF1n0w5L0HmKBKX+4cS
yJC3F8kdsBX9iZPsUzi+L08uIX8acizfAkxSitD9nGUO9bAFr+PgoXYoef4vH85lj8tu3kBaxwbG
N7PbDd5WNYNLCdpqtVpgYNV9vhNhHgMLAL2rK1g1AP7fHl297yFGyUr+yjo6L+PJ4mi2ErpJt7Z5
gxoaj6kHAud6lrGsqXkiInC2V6d0iXvFqyKAGUBfdyKnY1HtNe3BaPmLssFzrAdRSRnS+YuPKnw3
XhJ9uyUTx4G9BJV1d+QgA0mB4BQovkVSXacA0sS/6rYNIGpoPE+IRuUzDIK0CaW+s2vZrr6jgmTd
YY8TGz0LEsOP5gXRH8ehl6fJpYmwCsMwHNa1kU4/joNJIlEL7nz8T1+8qHgAqdD3k+Z5qkXWsaro
2FkIZJNQP6SP8vXqZ3jp2ScaO7vvfDogzx1keZhQYjcyJ41UcVGwvMFZ4rTjNNhCyCBqDxi0QLGo
xnrvJ3C15Gi7ufakbA/fLZVd9IxDKZ453ekv+BJ+LcZW/DNmZNCx7oQ3T2VCXmAz1sfLNqrxvZuH
rPdaI2DPYt0yXkwrwfPzLv2VIbjfxTZNFnvY2/PDi9OTbRIo6iQun3RTLfNeXF0mx/jN2rvfuX4q
4lxoEIRq7JjS7cJ0yymboBcgyfs1f001uzlvFR790+59sv5zqUrengoHLC2sSMvovAuHs2RPT415
5CqTejmwXrSA4QNLSONWQlgPqAYF9PlxMegXmVURbFz0tzDOJ9Cq2+ul4Jv4OeinFgXsifpp06xd
CTsjK8lW/Jjcj2ekOpQBKmpz9VxIAWjowp70lrWoJqLMQTTkvyXapNd7aUN3gaO22ZZn5ubQQX5m
3Y+zrmi3qCdKUf1NqSFNfzLqtXo2AlmczDM6L5kDPsJwYb1+8aY5D3jgQeUmbho9kCzSbswVajWZ
B08Qp+MlieHkIXEmyF1ctgobILUL6tozZl4R5tJuI0avaSe75MPOfXTpI8YIxqTgRvXxNp4R+T2F
OpbGbVJOpdP3kLUX8HwR8ZdcU8oJ/cxCl1y+m02t7FbTCr6gEBLSQcGx2FXSygPBO3vYrQF/Ajr6
reukjxhdVuu/jJYusMiiFAdBXeFEaYEPF0RBVQKQyv2YMzHhjuRw79LC7HFY9qQdv7V7Prh9xhxi
hwO6vkqL2HRe4UDHBu431dpBw4gqzT8llexcP+TY+VsKbOJlBGIjrvk3yNKPo8cbpKz8iovcbIwQ
pXkVNgLn7dGWifgtNNCqSmUMIHx9H0AFBksZcXuZl769ApRsFB8nONtCepgbuYAhSzvYHrhSBZk9
aXvUWuCyS0nmPS8ujQtBYyxc/6V7hcxzJDsuEiWcpYkT8xJ4Ub8Ug+y1/oQ8u4jjx16BMUJRXNm1
IazsGYZ1vIT6HGGtsAz3Gh7iOgNQQnRuHlnigBDpiacbzjwrfAlsUWKuIyLE2GB7uU0OX36GISLo
caloh5+/2R2rts6IbWPeq8zBzo0WWBdg/MQOukkJtk5VtvwboD6daSjfVCMB57mg2EqUF0o5GfFo
cAUphQD+058cZwxFXwMhZt8Et5qtp3wenrJW7EkYAMc1v9hS2G9c4jWwr28J4sAEm62de8RM9LQ0
PMJZ0k+pS24yWtD5gCxkC10CmJs5UY1eFGobIKU7M9GiByBdu9zdRYdSPL9KPWVOTHSnQmszU2ed
6AvBfJQc2ZupqBjIGApbqYM7cX7A8YcR8gNcMMqlVGVBKsIp+UMpJojE+yay7yQg03l+bydLHbqt
GDRRxpTGxo19gvHYDcU4gtMmyotPndm9/yLFlKI/Ranu+nH8pNeHdo+dmiNSSYRXslhtMKkMHyIH
m2Dpq7c6UJughwFzv3JzgWimacuLKp0ieFMc7nDdfyuPMgUpb+Me/2OrHztiHvT17KnP8qlpRYPh
vVKGpSmpA8iqMW0G4nfef3yXioD0YjJBzRDz7DP4mcsMYavqsmqk+8oxCYNcUxNoq7wH9Ro/Lv3t
T29GTjIQsbcX1MIesM8QMK3fr/8uXEjnJ/jncH5hYM82QWth2Sv1d5QzROr6Lz5SoKO88A9nz+M/
L2cNsdPVjLHKHp8eKYawuMdPOm1hVoqO6YRtNvugW60ja2p4F52MNZLJ2mcpsy5mjWAmT9sMWvdL
7ZNTaTSk0iGk9ZXmE4YfJ+4hZ/a9ToMA2dDp0mOV9a3gSm2+T/ZtkO9OfewGDfwUYrZfPj+mu8qN
v3Xa6h2Z7rN8xUca2Cu3yagUtjY6MljF4HJQvUQpbvsrprisX8785E6OQLkMRDPqREYSRElv42e8
Ea8dXnwDSEc1cWjesLu6WmMRXstAviPvAEQ3SReLxpOsZbLgvEdW3rLQ/ShC3l0OazK0v7TjtDKV
VRLy9XeFxfttgxaThIPDhta67eWe6XnPMBe7jjp9PL7ppf/am3GD8onmRXANG8/CZInY5jVpcAIw
qdT74ACEh5Ms9uiryZ3qNYQmoCXLQnB9ibU0DAqajfAmWreUaTu5u/efNSNULwcpVdBb0AN78tP1
hy51kzylpD7XfGpPCIs8hXDhahcsV/SbszWS69K+7ZUtVXIN0Q5VasZte6iQT3NDKHG/UalNmCS6
Z0k09XEJW3E4JRIscEJH/94qDXehF0wHbgVCLX7bo7ULJK2J1JWQdoGOEn4t3eDCHd9PElIWxEDL
v8EqGfyK3BrtDlqwd6twvTV9tELN4VonzDq//lK6FpxG71lvuVAaeeh6zOvRDUDwANaVthUgIn5D
bttwhI9rWQr4CYVCEHK3PSMtmuNJGH0v//pwWGze5U1cSv91IR48LWruLM/+SCidnlzFgHTctGpt
vmu6KWo14G3jVoxkOuRYwkHjSn/EN1FWRHwi7quGI+DrsBHfvPw7iZePv2ruwLDf5egM4mCaFmWq
PHRpkvx906KdlrVqOxmhHWt9sHkckhOg+GKDHRq4VsdM+Q5CGGxFmguBkfdHap35Ali1DaVoI6nR
JdaYBDPEjaR4B/ExgxDLAuPc993lsv8UBjo8d84FO/BaxxbWva55JH9Q3wCFyPWvdIh0uxoOFSxg
6bvIBxQ5NVgTDWlV78cYr02sjGU+12gxZ1dbZ43if02SVwjJzlpUA4wAwliLl/R6EgJeKgI3/VvA
ogMtVqRO/rmoIBfJ2nZtMxoXVTFRmH5U6eVE2gO3NTTA3s9jjjgy0i6f94yKItXK1iUmjJJk3NHA
p5ZXnsCUhFsn8TYAXCXD95fJ3uAzaUTkquygt73+yfKDPdcT5YrEWqElIRuJcXvEAhYYYjKc+vh1
71ffEeXpi89Ga98p1peaXJymPMpSeA2AdhO2Lf3oda4enuYSKMUKq3fxuWo0/golowSa0KAkdgAC
DTwC42hi6vKgbpNVCDAFKN3wCr+u4TpmvTnnfljvdupLIrDXfrIMV4AJn8AkkaFF+qd0bRjxUMGs
bSSPFzUxgH9ieFFyNlkb3dyUJifPz6LkFqflTzRwHc+fYsVrpk+SEoF1oMc0C1Sdge4qwOlETate
S43GbWfqv4lWAToXFC27bb8GxXbdHVLNZa2PNmh2GdrZwzctkvfqW8eLxUMz2WaTB8ZQwPxE3P27
l4frsNjJZN9AgOPhO4deA/1S1222QZqET/5MqZlIX+z9WsvIcB2MGuYc2NeSvmTieHFHeAz1OouW
bU1jEULb36/0qFtSc0V9ogbQWwm7thGm7JAVkcxa5Ptp9AZKPIvgeWBO0girUZ77JAFapHShqexP
UYGU+gN07SOz2ayokk//+TOB05RLJ/zGHG7IsBwEvmXVr0JsHfunqDpvWskfOPQlXHDxqWMowcOt
yT0d05EYdlWz5fbDcIgfk+LfZ42Vlx7rEa/U0ZsEeqDi0HuK3Wwclbiu8Ci/gZmE8XJhdDQXSBIO
+kbny0N3Rgj4L3luyuvY3DoROGff3X651NKwRny31Zexd5cCZyYVB4IrZNltuTdu49fC4I37eiTf
S1T2cj8L9MMD0cF/br3cfaKP8rdArB4oGdUs4TD+5vqTnpXKgXoLNiWCtiuhy26LlJGqZkFeBWHS
TkqdJBH6j8ZR33xnFVKXEAs3630gzUWkOph7nj4rSH4fpylbhEh8hTzCu2MlJIp6RbsJTSVZJ4aG
ZLD9fOfN2gSO2E3HW5kWtLIWe61uTIjozQxO7PJoS9kZWPCR6ocT8sf74+Anm7ITW8LoMI6fedE1
5uU/Ryyw8RwGXYGPPCJdzcX9QtoNIUtfuWISR6WwYrmv/456Vlbnyi4hBWJcuq1Ng/8RulRiOTx+
2NkWhgrslUrlVoY5Bt7sOXfUNLejZKQZxalLmsYBXwIQxn+AjAzTldYtxObxlGyp6iIapQBziB2u
gvsIVaFi2C0ChhR6Ki1E1p8jiYr3Bq+APYYi+ktaSCH9QaNOU8CTl8hNkVnyR+ivU2LXoH17Zt5K
xcP/+QyHOg/hrlvhwcEb3caWJQc1KoPg2937A3Rl8vPfM6vbmgIeCLQJWSUYmuQmQEDvdHW5i8Zh
ZCW5F2sqCNqeysiAX4BT5hsL2n/AzQtMkGEQscSo4GnVU9w8AnbmUGn7PuJSqQfb7jQGnqlAnnZQ
SL02yJe/s14PYeOIVuyGa9OV8aRkx34DpCHMaWRKJEolO20YYyCFs9uQzbSZbbc+dCDmKRWTc88d
ReL3Myy4Zn1yvv0jV7ayIPXVZvcjg5zK1HzEGe6+++aFBUnN3VFSreP8wbxwZEocPCfiy7Se4hM9
2/gVKvW9sX5vQV+0sHnxSsI8979ups2pybnOUM7k/Lmn+NVtQsfuf8L5o01dx3IBRId3cMX/tqVV
KDAJVXXDAkSh/I+zW2AYdnFh58apbw6c4TArAXoysPlbflSQ5gPZxlwhCPSXFqdEfS6n3TDsRjHf
nE7feVEDBbiXFPiiLjJiCGyyUau1pHGRZyMpjmv3+35sY57sav+TLrGSJqaJFllK2sWpvpd38liu
uoJAKAw+9scWWfsisjZrCTdwGYYscLfF3gUplO2VskxNl4WvToDVz8va9E4w9acN30ORGQ3fjC2z
bz5QHi78sMkKSaEVBCktDY/VdsSfVhhQzAEoXv2d+b9wuyY7ZntehTOiFQ1qHZCzenJPBvM+WVbH
QWAM3bdT+HNn9F8PmNpCN6KRFGMh0Td4Sq3yWYRmulwezW2Teff9OFZDaFtSnvu7RQHia2v1sIQG
qy84HhbeNSzqBgTUOD9/vTfrG2ISpW3cs/yL2HFzIZKcH7XlqmAGSfw2JS3ZxhbAW/C9WdyRceub
PtOcE8Ie+FCGL2GSw3DmdVjciNYP16S6UznfY5ENjq1CSju4hu+IcNElyLQ6ke7D8bpPUmw9qwsu
u6cEOSJC2AzOXFpYGbco4cIIe9Uppv682KQDoFdxxnmDUfikt/BiQGQtkc0DaY9QnjvAahabmwhT
xkDEsj68hkUwHMjjEb5GS1h4xXoTFz3gFqdP4LQzRHAVuFsb14guzF7cYQGfznEo5gbhff9FSvNX
GtcLcuoDkrcsONgIPE7qiSgaOFZlW6drLmlXGqijDvzdSImWNfiTYAvhe1XrjJ0Z5g9f3RtqOSUT
XWrhluVAvtxK3FnS28caDdWfNCH/Fi0Qk9UHvc1jrEn9zJzYeICclTCtQ9rIVvFtMGUNSI5thxjp
e7rvrN1636shFSQ0qfoIjmoXBF9ArERO5jZsh26vAakRRnZAkHdcdD2XrFclHrwJhlYEnFWSW/fz
FdC9lUZ4HOvdJipKbn3pg6rDAnprc71WN6Cq1rZIbOoPMJIKcXQ0mXC2+3/24XNdLQi3+S45dws1
LMDTpIPxaqIW+BMMFU4KuhpkHcP2Tq4JZ6lgq369pWCni8bcMAVU+3L+Hia9vnFFJ37+auI0AD/A
z7BkGBYmrpesW6GYLxOx1v0LSmIMy/NXdt6iLDMh1cY8K4JQ7hzM1sExyYjNhNnipe1ZQ8Hc9xma
hfVeBREugQarfKHqBcfy2ZkiBEd8/7bO/mTIBi3mqxi0aRLKT2k600Muj2dlRba4OFoLdwglEYTa
NEuoBn7y4yv1PfIBO6tmHJApTUQupFKKlk7WGmbxugbzhahEXl5Mo0WPJJJ9U/rsLJr/le2law8T
hsnpEp0zYir5zzJSf4oqb/XyBWn/RT/hR0nFMJg65L5F20wzdY0MmzdOaAG0TGXclhDgScURQzZx
FBHhgZuLU5R0PHZDqFVosyZiMwYW7zOr/TpOt1Ow0oPJ2eYWNO1P047ZFUyJUzjxigZZJo8wkK1Q
ZvvriQGEGTntQ+JAVhK8CwGFn6sd/ba6qtOLsO8G7kPEDudwWy6J8FR30yRIphezsAUb4JHHNq2C
Qqz747Bs+fMWdVWOrF1W2VXVW5LMAOFhGIoEvXONZBZcxRtV+DV0XufBlsh4e2t0E9RsROWwJyWF
CLb9mCkMlWe82zSWS5zCSltBRbVZEg+pOvVs43qxRbBc2zguNqgW3675L+nOGqf9/bepoxjahpsD
dq1ShYRkSeCyHBA8ZGBWxB5rUfmbATS2Nj9ZSjtGDrR8YcTtUw57WYZg0dELtQMfjyFuxXFs5vXO
zkSQwlEbY6vKodXJDQbSiCpLmGBAXn6Ti47FDmg+obcPjdDU/1JLRmXfbEL94fepAIT3XCLzGv+6
P716Phprd+p77RRzldiv+3BSaV/dGDHC2krv90OJM2U2ZV7whjOTavCx2xf8A8Z0kcd4pjZ6skrt
dKjJwDvFdxEMabD/aiRJlMgm6DatPr4EXuv+nTGCyqeTPUg9gTgbYNj1j1lyPtQKB3ReUiYB1TKl
Po1kT/ipi7DxRtF86ihRde/fdzAxfuin82DxpU8CxQNCaLSmB5P6uSXRtuljRoTL5Vaxe/riLM30
iZMhG1cWjtUirwK6bljCttL0BWUyubyuZjm87LZCgVYSZ5C0cokiNq8nGnAaudTbJzhsFT4WLfOW
GvS0ln+S3T7Fmiz+2YZJ5wQtmEmjGbLyz8TcIRmEQpZKRk1XSo5IKNjtN20+o1/JuJdj9XbK6LU/
54zN3PzaVU+LnxbcDBm+OyG0XlODv2Y2JUybrn+QlBoIXFQpH+N8uXpFYMM2oQekRbbVFXN+xe64
Ne0lhcJxtI3BLpWUdZhIwnT7OdFXfSrkGuT+jTGyq0Rh47rUYGxTAO7aJwbRCM/prMrimc/thKXJ
tGVl42f6d6+oQrD/F2sRc6q3U51hWmGORMwrqJd9S9r1N5DDVaJo1cMcvH9Bi0Mt86Fj5SW1pQUD
zAbjkBSUx83djjbPj70+JBw4Z4UXeAp+k29jHI3oj2EaNXrZZ+t6p12rFVQF+4Ho4F9JXKSetoSy
yLorNX0bgJc+oK/y11dUsgb24tASYd0iLaHFST/bFhTzx5EJWQBHIs2NF0DjA92D4X/glHUpRXRx
Lp1luzX1PCgudmZdnsPc+0/h4Kw0u4nw8B6blx6sIi357YWGyOWBL2Ef27pAFlIJegEW576DkKBA
+twcEfsYfPrz3W4rGNvJEUndJGnuLZfYeL2zkTAljPpuxYuFSvemjS9MPoxHpxjHWKyn7cDYwgZZ
L2qwaGr14UyDuhOR+tzSCC4buQyuNMuhj5Luhub9+QlSVyEZYHT22uaMc4Q68iJQsMsPSOID1YfR
BwD7zOsMViH0lAQ6CyxT+FlXaYiIeQVyYvSwpKU4OCq/MhpH9fqm4zxWCaCqQ9LOZ2EkvsNl+RBb
QjKa4lsXuhyZEoAWEb6xDSDfOKDEL/6nbePCbEDGuxS6zMSPx3seVweZLnE1GFBF7wSrh0dY5oIe
xR+K88ULrUqS4Z+Fvnl62olTexC4+nJHeq0Ef2/HjN7orisGmCnsi03bZ25jUpgRGP6HvssAPGPm
kBHYMucSt2bCltkeZQ1nEGZs+SI2onMZN/TNof2R4DmfMpb76tPTKS96cVuOtryu7vOTB50GNWEN
nPoInZDQm+JkrMmMy6I7FaBCVwmOhTSZO8DAO16hwzfAcV79H+gGCV4Qh+JYJiBi7JQiSZOmCFuk
5WAEJa7X6XYtbfA0LXJgPqndBWb4sORs92dthmbVwNC8q4496Cy5ymR7jm7HRIw7HK5DG7y6AV2v
BGPpN6qXdCAPMbHxdHv+krq71v2HIeHWl4NhckFq1UJc1trFFlxgKXuDgi5nbX0nwcypSE1O2Ja8
/k1wvHNAgkKQGWbU+r5XdNBgkw2rgy3paqwsLZCT0qrKQoJVnqTnmVOGyd1I5WEYj5XWohstaV4V
yHA2XoK9VB/FWF+ZeIIw4sRj5jBZsAA/METitrJfVY2knuf9MV9084DfoCkk1p/Mp8PWknIIQTYE
kHbrnu/sJKvZQyS5JRP/9TWYKuKfL26cDCPZt4tk5TxQEFh6slL1t7VkFB6cepWQW+On7q+SVRru
GlhREnaI77L4SpsW/d7Tg6t26vAe8Qkkh31JAmzSP3InfdnfmOx2wvKsuC8scFmaYbdbRUzR9K8P
Q8PTDudpzppGTGR/jW9vTX+H3rSBKGLG3lL5GSxSEBXNkSaWKujuV4/H6o39I5wq30nOw+TcLrbH
iUlTQ7zmX0rZpa8XIOVzNzL90TjV+zkvum2UX/Z0OfKvThNeeC3d8lX/NOeaO8wmw7ZqdYB+M93K
PJRTKP93M9hJTyXkwUmbSOhK/RIkShZJWoXMtL4xG46cOcCTamuMqfsnNzZHyZ/UgWxFqVUlJWRl
hv0vfM7z9B3AadtlxWRniFUBp0OT2fCB/P1OBJS5ALmd2R/WT+f0zPlI0MQApNJFh8E7QxneSxYg
l/b/t4mcNXH56XHYpWQ9AexS4Nw81JDLnMDpkmJs+AM8wRSqjuWkbo6Di+hCEZhhWq0f5q+UYsAV
u9bBlnveFK/J4UycwrfcHIncqr5WW2DrRztfVnwloCs3nN86/UECgZXEuuOqpk3sWSSVFFfKojFM
CTkC4pqYkGnndxJe1XlLXF0QaQ+zubkqNwDwNGW6V/Cowt757GDW8D9fa9YSyO82p41wMTQmn8e1
UYIEnUpa9DQatB0GEwv5xnSm+dW5jevCh09BthH9N/XBb0TG2QA+NPYmG5xVP25v/O6R1Y2/4lCw
FF2ARW5r9rl+vFeyMjnXkwMzGJuS6q/zPhMs1Y/Ydy8WBQ17dojHIbySbWsbcV2vhB4OYfT7Iy4D
u0obSbyD16Ibn2ryw2ms9UFJ925/6aIkLd6RS95wwYrnZg7ipUbop6rseZEMlkVdhaC6IWGPTD8O
l//Lz2//Y9KOtqVvwDrHK3N6L+1OlhB7ggXeFeCds+uAJgI2Bfl058fRzU+BAfHmsSYO2T2+JnSJ
FeXcpflkkIeTcS6slQbf5oDkiMakrmzQnZgrLmeuWJexYnZDK7HVPUOj/shLLFlCnbC+Vbla9Qke
94EOSNRKUFI0bjK0q8tih9jdIau8q3lidReuX54R2XkUfBwekaBvFprwiru6DSHAky9klSq63ZfP
yvHtXfngedKMOUIkWQbfRhOGBiIeecvekk8PhRg7CFkAOb8GS2RIQhh5j8dAaWfcgIz66Q3BGTv8
E6Ou/Wq5pstLoESTCn8hFQYXR7I5DyoSzty4+shUBcVrbRN5R/duydmCujPq6htFpJk3l34Ebee/
hCGrcRmETcTok1/5l9/oesiR/Nj9MhaV/Qv43wwT/IB5j6gZUGLQ9BGmrKgSbBprV5axn54A+8e9
NQP1ccnpBEsP8jtOsyv71DZiCCDsOfoohDgLgL6QQLeb5MZAXbeG5u0se0lFq478p+M906U72PpN
Kw3kpDI4eC3smVlmFb2+/+yYno2ITfGg6ypGB2sg+cDfxaX7k4HdK4Ko37BfnyFj+FI7q9s6RYRb
92Knk4KOUKKzwrXlVHNmO4xmlTbEVZyhb1wqatuiII13X7pxWFRVb8eRGrmbS6VV55PLeImn5fSd
CsWpqG4nyRjrkXR9raSptPMJ1liew6lxBsFNqiA4qKD1DJDODDPUiBcNpHqA8QnU2f44aswjEBTu
lKKdhqa5xubE1AzxVVcqo0wArUvwJ/S+VQN8C2D7MGum1ZN9tjfmeI2UbG1uwV7GQF6NwxngJAWM
R67bdUYRC1z0vIupRtNqExFH4071bB9IK1BQCjXzzrsvQhktReEFz3e0rg2KmmIj/JKnQiDC8uDX
FkNz4zBIpCYeWUqDoQbpMZI6Wze6bM5+W8bAAY4imym3a7aJx81sqVmhtkfz9XZH78iIEdbd7BOE
rYi/UpO3EzdxGUnlmm5rxdqFAI9XtPVtyiLseEmCxDuobTEorVlLBvS6cyj3l34GiLC4VrInDhkx
U4BU7XoufUZ1692n511b+DqmbLfTeXlIjNNr3lg+V2lO2oADyuLV6TQbYun9ra+xcBvTHUf7j53p
kZuriWiMoIRCCiyeSXgxaqwISVuLMk01Stx5rWgtIE88ZSPUqZWmCsNpeK3FMfCLXLYwRR3bv6Ai
fw7YbZ4g6ApW6xiewUFVd+OS/Zd2I9bPZvGzFL5P6dYwzah8wNY+AgAZVjmdzar7X2RNtq3hmxX4
aodGquU+I+M0qrCego/eqfG0Qb/W1nryZkTXE/L9tgZu3IiCeFV2M0SDam45fU2wFQcQsLHWT7Ho
H7p6laxvOPSadCrHiUnRHQsT76DjacJbOtLi14dtMU7YByTUNyTU2MYkLuu/cQLPPlISv1VG5wXE
uoblge72dOwAwZMoADW/o9sweNru3VJxKnmf0p4EcBcDMzK7hO5xCJ4WMUIlNX8XjsD+G84nvtW2
owl4utMhjHlGqUKhy2aeY5Mt6H7P+ee1z6f6GwyVTCO9qszGbkZr2f0OJ1+FtdQVM9454uEvgXWC
JNT6q5Onh4gOJbAfozUQNDTZfTcregZJcxxwo5YozGPVusC989tO0nGAXPMxkMiVSA8f+1hahanT
vYCz3hYmGAzQidR8yRjf2YerLVPg/uyhP0UFaueLCHUjyMk33qemAQsExTkHkXEENoWwyAUq6ohA
8nniza8vEjztP8NpnCt0jyr6E13HSSxnSFFkOYzFpW0eA9IVCdLRg5uUpXGmsUYddAMdO3bFDH/u
rbCEV4t/v52Mlb9/+t/a/0KTQ7TnXUWTgIDbl7G1RNrdrsWKNp7A5fJtShAA5Uul6NeWWzertynC
69alzJ9WoQ6suIgpgKTarram49W8hFQzyrEAA6qaVTb/jNQyjk3a4anZCuhxKld2BrQF+oZjtex3
sVuGszSdcBuE2FurVXPD9LAp/zZlf08L7gy6N8tZ4N1mRgCZVg0Np3KY692iK0FNRVEvQFtVDWs0
keUgSWH4GZ1UVVeONmPQQ8e4KJKkl7bCzugStrFxIOQql2KXP+Aol0z+FKkotErEEx/N1z/tpVki
SaVvpO7whlfGEv6W2/K6haovS2gWpQhCl8pUnalT0TdylD3Qb3Lko57pijYqn2fASLUSmQivOwLH
seSyKhiT6HtpllrarT0VhVAnqDv1+8DqGR6omhYRHueeliERXdHmsL1Hu9yghk6uWl21htNcfCme
X/9tqmsCx+f/gvI0YVavBsz3Xdvl/jUtuWKxdhHg73IiRcp5s5dNj/0RqUoSc09cNKikZ2QScKHp
in44SsVaubIN4whXmhvXNw9OBpjCkD4m3Fe1Tp/lL+pD1uFlINHuhcmRqZ5YEW7cpITGkEg2MgiM
LLiSQaZbShlTlBfDHLhjm5OBv5sOj2BbaCOFQwM2P1Z68lxKxBIcTBnuA94JjTMUJ+gFJ6CMWwDN
TcFfC2gAa+sKCrWNt3c3lZfCO+uzJ+vpbgjysRvaSWiMaEZ0ZrHR1zHeEPT7/NfjvAIY00X/tLPe
17jvyK0suZ0hvnyF2ry+jDpGzCTPsMOj++SZbPN3Ph5D8F2+SiMc4g/K0Btn2FbnPTafSDRLPmPr
/sgb1JrK/fS4pRu6r4wQl8VH5ZvHcvBNN4foux2IBZe4caN0BJfzpWp+jPRZWjE8kMF/rd7/Rc2+
Wec5SCvBmZmvKtJgxk9PPHBMXP/nEBLMB8i0h0h5rCUiQmvn9RvWaU6Nu9aFXB1z4K2vdLO3aff7
6mVQ2lin1bXA4jdVDXrbOeGVFHVOy0Io3CUE8nXr1rqLJFZtitRNPpoHcORJ3AWXTrQc1L6lJQzn
Dkr+4O/2hrg9s0TCdy3uVxZxVqLR8MD9Y8NfIqBJTIWi3PpLCgp3FIWb6Cj2Ug0ss5v96KJEKTCw
XMcWJyeoWoAMmy8KkyNVQpLy4iXqjE6HIE2I+qfC5V/ojJhs00oCmJTVQSzycTEFQNkWj7JrFu7K
mNMj8lDfz0D8/StWZuNe8mwEvl1CnfAT8Qq1xdV86OSasvLE2coD8spYVM52CjpV2He1P51mZYcI
OZgqL6EFtQyxAyjf4SkzOV9k3wBLr0tXC2se9slY1wHotZabLOSa/HaNnC8pRQeTzhzAp3MKVGnW
vuS0W1zGb9omBoeZ7nGg+jTQbfzj6q3cvzy6CR9SWvRskgUWfHs/3P4teqpxqwLqEVNDT+wcxkrB
nzxaKr3VbJOg7J/yVepzhBK3prMfi1rhJmqwqjNckrWn/QNjYgaP0bntF38FXSRuwb0kjhWC5N2C
jk7NUzOO6Vq/+hIE/428ap2RgQjUF3168Nr6giKr6sOaS11Pa1XFgH1C7LMH0JK/K9Jd9RTxGAJW
qVIWK57d1V3dYF0ji0DmKrFRBANZ/oiS+pmU5jPnignbCMg+hRP9WOXrxGR0yQMgJYdE7TO7TxeN
pCcLOvuzIp+CP55EEhjeQzeD2iOH5t+0QKi0yGvC54Ig0TBegmCxor/3If+upERflv/eCbqDe3fl
s82YDtkIgntD0ud26zGLhc5EAOOxCsUYxiUCEumjBv7wFMVRmZCbI893uuFu2pig2R8DLrv5+1hj
zIFAH0BimrLVtbMysADjnkyYqB4SwykVt0kOVriHnKMVwyFW2KCD4b/NYWw8Oo91DrjEmguIMoXm
W6lZWgIf2C10Vi1NYmUDV8lzFpKGLVlWyxS/QO5Jre8lAkDT0JSE4DasZre4uGVCT8igHDfvNhGO
no+NE+/kzPnFSbJQ+UZdhw47eH3QeBbuMRny0DOjInJcoWKCOT6iB3q/H+svQW3g6iAgcIk8VoBS
I5Eq2panPxwwYq2avjb7Ju1Ab97NLrd5bvuRmvCzU1wnZi15UwR3sHevW/Zm6vW/9ZztuvHn+VWe
5NW1nqjzQ5o31zTLyrPZVw10IO9nL4v5tVechBK1OPu9/vC+3O+RoPHj2kxSAdQY8hh5G48XEKcj
u3HUUzZ4uAPxlvJ6gTwqc3/aa4Ig9H82MGapKr/wmo5lFxk+maHdvuvLyYWcgDl/t0FoeDuXjehJ
QIxlkiRBfYhiY54OCJh5yPagNi6v91VqDcNKUG13SAw0LbWhgKicKZc7kHWyMixl+SrliUWrq9k1
nd+71hjmmEQ8ReIY3DpYGTijxGURYAXZDWPd3mSvkawq4ybmLoZfE6hENp7qKZWrnhqBojBQ78BQ
+QPQOchl0r1+eDiNqIPYq+EYueYhuh+qm5JoFDfr2xYMqrFai4SdpGDd4SJ3bGRksSfvKGp6ebIq
s87shJbH2RE43xaqeRSKwWUWgTmTbJVgCLpJEyYSjiqpH4iKj6jgO3XGZGBatfnz5O0VNk8dbVsP
wlFOdhMzDW9RPY4miZsFAFLGJLHzdj6x4pH+4BmtiN31MR6HM6Coa3j/cL0lYyQEXuBam3k759P6
p7z8zx/MhK+HxqNQ7ri+txTOQhbkyL/rQupQFqALNY4UQ+BF99axFmH1C3kDKhCj43rDNA6TEANb
rQRIUIfcUjkVTrcQuQ6b3K0kGxgEP3YJcU8C+VJ27GIjjwj0Q0n29zy87eiuw8x7MAvg7hX6WPMb
XqapgS/BDEOfG1C1JDIA3HX8TAgOACYHJpdbQO+kd29hKR10i+I0+qh7KuQH3550qKR7NeF2hXSG
5gHNsroHxeOWYktwuDiRCKawl6S55bbm+/rNMf1nCQHO+RehrMo4cIZ5te06ORx/3KmiQcKfwyPt
ypYUXxWm/ZF9kAHIRXYSwTzyIZ1OE+0cfYdMfiFHxVd+uD4NiSEcRGGQUI1IkwSwFFmoJCqVJlxg
84QxBcQvdOJUIKnpb1pCptRpaii5Nn1e89WrSloawbmtv8T1TYghQTu4cxBK3Tabv1DZh5KvySqN
K3ISoRXLmZhb+nPLVi3F28bH3C70c9q5nfA4cYaNgT+8XWUoxeAqIKaiRNV/INHWfvSDMGuTB6C+
027Me5I729fhfINnOpNsXl2fpXwXPG9Oy7j21AxSLml9yVm6usnZhYs8dXCMTu5VzkhCT4FSBgpQ
Zm2VHajHcco1ZjZe99Qg/zHKuGIvO8idmHlodqS5UmgdojYli3mJ7Zx4HHV0Iy9lC71GMJZs92f2
FHfaeOB1LqME3hvLkLcs7aYMvZ4fR7tmEgJFnNhVmu05M1+QGaiqXQ3pRWz9VbZv4D1o6/CvArdw
CEuGM99g54tR2jRTnxyEx74RZ4zSATG3nrZKRr4AkhGMh2j5sxenKKRrh6CTEOQ5ucQiwzW6aKqO
3RUp2JoWc+5ypr7W5CPbiUsSE60jVltlRaB/3n5bqFO+6MC04hM5CQV1yxSOTKHD4CnV2weRRDnU
nDCkibL7qlGlK2soOfXqffUMns5ALTANMhbg2worLNS45TvD80Z2+XCAvvaIqe9vfmruCB88Wyh5
Xhk5tP5bxEcyqdHg4AKNCW89fzuZTVkCEA9hlYN7cv5HAswH6EHf9B/VhrwAZjwLD/hmfV1EWiMM
TfjCxf6tct6xJt2wYeLpppsiU9s2odxEjhRI3z1/FLqLcEgptcPq5NZBod8ysoAX71l/927v2p8Q
9Y48EZYZAN/jow5YgQggFghgsdkBk/E/0M9pZ3LCKQk30LQuKqej1ZggEoOMDUWUm1DI8lDcTQUi
JBqUqVaJzocTLMqig6VzuF53AX9MrPWAfHCUIMFZqIneyWI7BQgiXvE3YJNUshJvdc0T8bK74FM6
2ruKiNxLF8u0o2rMBP8olYOIIkmibhVK/aYkA/V1lAhELlhkGZU1S9IhiX0onDmxXkqXHj5huUHC
oiPn9f5Ga4fbcuJfXUAHs3NCUOIKZou8Dp/D9+9UVPqdiSFQuBxz3weOmxde4L78vAVcb7+AcS4h
fBKST7paCcipiefe1Dxnhu9otCEXL++AxZJRYKrI6NdCQM3iQeMga/NfGn3Rdbu82z+D2CCCsorv
bkA4Un1LKX/la4CGGVYY3m90/SahoIobwgRKGLIgnmqBX6/5857FaZg330KO5cxaJHyPsNwajfFo
NjniFI4d9Cp+kTtzWJM8uH7SdDZA7izXbw4iPMZ43ExqLXod3tsVjRWVDWLiAJ9Wc60b3BlhFD9t
3RvQeQgkxf/mNwXEHhIxtKaaXVSchMp5Etz1Z7RCn+sH5qEMmzj0yCZgvjwg5BSHS8CBvqpBT+8y
K4RbRRJ5SXov7DFCPfcEUUIqTdZTmeHUdwECQSOQWW4a07oMHOH51easqNLGDZ0r92gbSfzQJd9N
TDZBYdIySawYSBObP1W8R/y/2UgDLxE6heD6Qknj+qikqhlce5HzjqzzK89TRQ0OrOTDNvlY/dt3
SH1VdKKIn3+EXQi0eJTARZWzckAnfepZ/4COHbG4A6+NP0pTKeKZwsoKJ60Jc1LDMYqeGzMafIVC
1w/LGkoNcWmfwuK3hGkwG1Du61LzC0zxxl5zHqPTz2J+v6DmYRBer1NylU83lu8JeWspLQbcng1h
kpitGDkT0q9tKGxWEjCOqO5iSrETK929rPT6hXpBSpPKMlqT+XXcFW7h6aOYFV9x37z72al3u5/D
sD5zaEOmNPpKCCFJYdCy5IUq7UoouqNiETfUZmntkyDifHIIfP/Otlo9XDfx7md4GREYqHzn/ole
25ogUP38SXeL+2eGpd1kdTD2+ih9qX2f9gVnFqkdniDvtpYMsIgDrwbXd6rBL+qtnuTr+0jg0mXG
wC8vjKpGAmfxsg/Nfvkv04Km3wTgsiypiJXXiZvnC2dezrTUV+YOvuuW7hyPi1lHlQ2g466SitfD
Nas+GdFiBhSWonezqeZtU6ZTqcXUMsOhqUSKgDzwgJJsPMqiJMsYuXfqb38PilE6S6rYWUHLeyAb
gLEok3bSSHy2K8EEvAlki5qo+bvxdY0+1TNcJBjJqdLoK5cpDK7JjnvFP2Vl29gJc6jZAVdQ6faL
RZ24yApsQ+WQ8GWpEW3j+H+TQDq2V67KZJOnmcbxVjJNcVa9cKydMFfDPitaQ6gJfEmq4VJIg/XS
bIaJVGptt5/+Kqj7O7Mya5sKSovobDwsVxdbRZoAv9NqWz5erCShNnM8U72WL0cjvVwjejkqIsK7
WcKZsfmHVX111NDcApbSyrpqv86LpvG+UM/O3hikQ8X00gq0f3fOHBsaZdgPgaxD6ioChl1mrPu+
8pf8mxx/8yrXZ6Oklnyluof/dnqNdtSOQRjO862gJ3F2PxMC3KkSG+WXsd96rz+fLhtQajAAfLZ/
IRTgrLCYOYHiLwpciYyiuU3dCnxcFHSgU2HBwVZx5suJq/EgPwt1TWAWbSMk4DhnDppylMMvZ1as
NTIfbUGDHc5exl54o953rXty0e+imHZyGvmr2V9fMnMtlzUyZTKCDhsQQLJuwyV7u48uUlK+Q78i
aKEsgpf2KrE+2/YyleG581FB0iYD5M3i9549qBoR3TkzJZibu2TlIbt9ChPB376bORJsWeC1UXSJ
1NG20KRuB4G0rlE7PWgaR9mx5O0MH9dSY9I36c5yRzoH4jyZcWFO5McJDVMR8XkQYoXxknjnQAtu
NWEmAyhMrll1hLRbsBUMmtTDZCl3IX1ySuqCpUB8VjZqOzyhtw7dFgRXQXUqBFSnAiy39DrOlOBE
q8CWjRKv03VWL1GLG7Sxm0Uq2oxFWnbjtK5LwRQuTBYnQIE8x/HyGqXdtndm+rlhYJJ6G42YmMMt
l24yLJ2D3LQ8uEU7pGNzr7xrHhibMYR9KdqqxB1PRqxkhpnGiwyIvxgQZ26oLSx8BmfqTP4tnym5
Ote3BWbdANWjvj47Cbov63IVvKTeIYVrsxE3vI0TSJUM2UAeaTdy/v7ut9GG2GKoDzl1T7J2Tmgb
zgKgQm18aKrTw2tgLnQQM5rqny4ZefvuE8fmWUXgYmXmzatyLQKlSOvIgTUm/Z2j8CMsNla4s4dr
FjbyREMpMldAsp/798pdOO88ScvNpnqGU3RMOKm9PionwXDmh3g0ADs6EFqB9NfrnvGIaRsY6dYC
XlDmUlB+wU4QjGMqiTPGJFUatEKOvHVmP9Imi0B6AcfUTxl69oOzniYeLpgvn9N8tqVLVXZuJR66
4PM6We/h9KoxeXjoV1oa7RfUvgOHthOfoHvF453B3lCgUQK3segyo7KoDUcH0eHUDX1WO580pVsc
xJfLHDr/BA8TYbZ9Qnbqj15uWFgCoDkXlnU7Q1vQIMxsa4o9/R1EieBO/64nFVrt5xiplQKwefOj
vusjiNO4Wb0jJHDK//Op+/zNWcuf2xmbgVrVg02gpdLZArrK/x8pw9oxf3mv82GMBI7EKCrjtQmd
v7R0lxopbpX28BL6YTv6/sfwyRTmZiF4w4xEF5ieIoUpdbYCBK4Z2uZHqLRTasiQ6nf6ivB2Gyxi
YOVrOOJlXlx1gfxYfYO9qKxU86D7f0Z5KfZoZPo+p62I+gKef8kenApOEWw/rLlpX7AwHjXevD61
PDZPmXx28thElIkY2zLNORU0bEjwA0WAvb72EeW+8miRLmxLTDxtLpxAJCu0L1qNw6MJ+h5sOvEC
58A58HGKc2ha/Ggz7DxJtFhJjEgSD+lwct0MmqL1G61+toTUJnfFZaw7hAi5EQ5Rq1nLbAqJ5A63
UXob5R8rh7ILuoVfQpDPbvpAqzSZ/a1zkcDCkkK5dP8/k3YknMqVnUzh1f8IHNM4vRY8OnHrQQZ0
CAprTnUmsazjPshOv4+MZegY4JcAUoHumounUKMTV0hoG9D4aBWGM3C8K/BnN/j4eb6WXVV2N2qg
rbU4ORBOuv6VzJSnsKWZtbcRTLWjN8LqNql2oBYdzD/pBWifTriluJtnXO9DwGDTHl99fQD12hgr
QG6+QoeIVMoeBHBuIltAWArsxc+VlJIR86gHly5M974MmxZLEom5unqlALlOCehsBbSjY6jJy8+B
S6wyi6WTF1rpGn5vHmuT4roUQkRqM1IRWMgwdwUxifWgiQaRTS68CpJA1sIMbNJ4csNW+B0bPRi4
gvZA9I7cfmx0gXFRKDRQ+vv9u9vSeKJWBgLcY4Wc3T8YjE4MLi0AfDuU5HT4QPLjRkrq9N2IW9n2
zCR9thGVkxKtESSq0N3s9ppSTrDtin7WLjuJvGtO3iom6WQ7Ce/P42S+7qDsIqLLsz2PvPoEo1Eq
3PmMsdnLmoFcBzEXOTz2vuJAwKgwtI8FwOrdI8T33MmGKh6mKKProDq4SnznSz6sRJ63/KoECFdY
8wy7GEjo8Bl37Yntlsjq3lEUtf4+ZuplWPWt0/zNrVmkxJFlpNg+Tb0UAptwXATk7oP2FHeO+ryp
JeShxqGXM9CbqySMU2IuCqf1CSnNS/HqCV9Ik/WP71Hr8eKHZG9us98iXIil6DVy5W7rChrCTzCS
9k5CvAtVyGjWLGZgzTlNLcXLl411mO6QPurYycuk4ieJUQGuCTXhb+PmJ9BqQhc0UWWA2bPq6x4z
31nh/yOZ1dTUVJoQyWZc5bhUbyzV4jVn3scPzMDKXq+SIUrbyWq52QDGZCEBmViDfBqL9UgIcNQh
eJ+6PhksZKZEGAehzZshvia0SQkFP9aI5SdkdhIicelv5ATGKQJ2epBOgIKgs8SuD3SMiYcVIIdx
D4GTpWRMboOoeefKn03uo1hom3+558SEEAm55sxlbjg4KImc0dJuC97IFaQJA0zl4jSR2gso0cE+
7+8KZ9Be4iFjRHbCph/Rrgkk7XXnM8s7eFgWpTMatnkSyr9dNel0fe62whLQIoGSjR+BRj/HkQ2V
9GxxXWe3pyJSKz6fCp58eoyBoFCUMpKcEFC7LYfX75g94PW8UqnbAuCefFRrln5MEBNoQGrQq9Od
ux8zmDKoIDsutXfgiTqGufSOUK0eKc0d5BOVWbcFhHVXjLSqb23nx6HMlmIgyqxtrjm+ECItEajN
raBxp7XL5oe5l02SVkixfwUaDd8dxofQ7kzM1j2OmpXJxxc2UfGU41sD+L5Tr2g2FkqIS8rYV+dU
gvsXXWicMqw/NgwkXkJfaSGR2jOVCQIqm9yVoCDtDa+1OK4OmDNJFy3PKoeH+Iqdm0ylvKVA7iWx
+nZeO8ZKJRr4apineVHDO9SbJhQ2O+8qh8k6myhRzhdliH3mANKXc9hVecixgFEeB6TDpUdT7X2F
l6AXLxKfceHqkihDbfg6g/CEB4PiaJDMjuiCLSscADBoJZxfflxE32FSz07EaHLe5x1fk8hI/CPR
hqrmc1Xau+QcJAmXp6793HxpYq/VdOlBI9x1JmSfRa/c2viyIZ3y9GSMZ2Tx/8jNuUiwos4DejmE
W86v1zHqWskZZ4GWXj3K07/688Aq2NmnlMpEnyM8mVsIKpawf6+oy4VPqtKjBiQVOZZfSDWRZwzW
/wh4rwCYGHnYTLCMO3WYSUJmDaBE8D8eqdFwEzyFO8KMWkkgkAUF4dIqDkiQrR7xfv2E/Xc8QNiS
WuzfF+vwCF14lpuJRe3EhY7zeNziLe1UuEy6g2r4KlErWgU1LGi8Hfdt40AeUYMx3Ugugm3WvV98
3rELrRI5vd6Jbeg1mmBHXaICmJLt0s8v4nyWr520He/0LpgCwO5R5jbbsvB51Es832whktLKzRZ2
tIsb//3hvbYDJw+T3fxSn9L031wrwxD7U+tFxQuNwghxMqGi4bosPI6Ni0C8gVFGwLS9CWhb7FyW
6izAn7t+6nM15W7Nd6lyge5HWNtD0etGK/ukkoMJUwLyMO74anUI6GZcl5DoTkTxHl/MF9sNJvNk
iEIb8BWX0DycIIDs/KrZ5iljHyhv9zpOuHiRYGs26m6/5fujPb8nGiUHFTBoOBPzDsj4wjGTzktu
X8hiVRAgBJYSSfbvnHwL5VjzCvyagkAY/wkIOGZQyM3EugRXOqjX7c/93chnaPOsDP/o1JgnEmgQ
M+Fn+WtKT6o0WzFtMoqRIJ4CMzufMIiQ71V7vm/qnPCEa5XqMEz2oh/uiokP09BClyYrIucMeQbG
GxpEt3JIG0hoExLk3uvOcjvKnV9C5V7D9AynLIsrKO23ovbcAPWi218m65A9a5Wrap/XWd50RSjv
9bCAUPaWx4wwJZFkAkWS7SiANa/C6lrEniGkgVHOoJUT5ZmdQW7C/82gVMtn38X3fzh1XAv4vOz8
q3il7ng/5kdKn0Ync3Imr5Vmk+mk6r4LgpQV9uNqH3YAffR/MED1OeFJEQfW5RlVp8v21Tf1e0wt
wdAvZJfP3r8UqFuXZwvqzTZWZXQcQ1jH7yNj5AKDlFVfICMOT574nRQSNrkMLDdCfE2ZvBsoC2J0
YgcKVAtUY4uFuU97kMJRJ4dV+FGdAvJI6mlwn5ln+sVfG6XEkmJOaxYpq0vBBNF1LKxyEWExQI40
toiSAHliZscnMtTPmWwFPj5P10M9noWIgKxn+YpkgpAvhxcySpFEpUsUP/5sEygQWVCgwML1MG6/
M9TPe5dlhZj+KKRQ1IWjWLCsmGFL9CIS+vPp1d0XCKIZ6X5UjTepT+BEawV/ZJlwfRd04T2TY+Nz
OQ6DSvPJ8ywWtQMCn0drwfFVWT62oX8mZLTqbSAAGroOKoGMGTj15V6wHsrEiJHLDAUZtbTxmVBa
GPRqPXeiaSbExSpJc6GOiLaCYoPtSK4f5Q4LsT80wG6Lhyt8gMbXL36Yo/tDd/CbglId8TeR4tyg
aU23eBnlqQ9kH5r9psHtdw/MdoHi11RasUYWsb1J4IU4Zuv0em6m4ftXPosywJtYDWtumRUzW7vD
LhICOE7omJInNJWDOmZKBP8/1To1/53QhN0Qs0wkyuzVL+SVydwsv6BvkPIrpsc8KWk1h2/r7+xw
jM+2naWUEUeOQM4D659dZ3L6gPF9S4Rn7MW6X0HrRDkYuGB5nPn/THwhqGcTOHHZYDSkKblmmgGS
hQvhi5B9fPTwSUyR0fhvH42vFUkEU918YEPAJw38Ny4H/6ufnB9+Dae5d8r2iFKT9I8Vz8v74xVO
TxFRkHHUXVupjE1/w6ng7gidriI8RnWu1hnWsUPPZIs9bYg3qQgTLayLFLhzcqZe6+fa1IDrQzxs
GESWobPhSuCFWVhKpRhO3kLt65AnuAbkU+jIaALq0DwcqHAzKcrCSnV3QwikCRNDXtGq7oVmhm2o
Aciy4tN1/w6xh6LhPN+XOcEzcrgNa/BvfHtRXpE4EBSETiZZOsPj9NOGbaS2rjiJZqZjaiefqrgs
A30820goF528x5vJn0Uu1UdxAeClZVg0Hp6myju6/Rh1GojNvFe+DZlO3p5C2RtS1J670EtXxIN2
lRdVaJ8S7HGG+G4hKBLBCtApW5xKSSOVr3SxzCMcB/Xuu56/tBv2gQTRE2G99ods4902j8Tl3Bk4
jlWhh7nzKh5R93we+hBW9jIobjC9DrFp8dz4F3B9wDc0pxw5y17AgHVxsALRdAbUNfrUYprZ3Lv4
sz/qNgyI1mo+VelEAuh81xgUbwPKmYnzREfOmHnfxJ33/1sy5+gbEacPbo52ComJZrUh9+mZUWw2
c/C51UGpBspzGTZRi5deuyIJXC+sLkF/fFR71Q/SWpdPJZyCM83Dv7latDHdrUxaV1TjYFiVzdNK
s2pxzVxh6452LMySy/fT5cIaYwKUOhIEofK3ukAwQSHESgW9TOWdSnwLlB62+fKCpGu3+qMxnU9y
DYkZmsxNi+pEkjZosa7J/UEOp+ChuzHZ91KJdZGfdIaSowPmE3PUh1tT9AsTkuJJJh+yCxN+XOjZ
n2YuGdgjlkda+NLIL3BBNUI8CH5wmuz5oLnEuuNWKNCmG48XIjbnob3Wt8b/djh63oMu8FoGw9/6
cxYT9oLx2MsBZEh4S+vGUr90N2fcmor8gAIV1iNDIdaIz/RDy4MKW8vfKCOEYfjqa/cHR1TkOm0A
+Mx3C8ePTLC6HMAB3KjscREQ3HBOmotvEzIT5BVkP9ETWZtivKffc27nnOxmj6NML63Da66XbtMZ
xkqrSpf1q/U/M9I7zI2tGsQ4II450bF7i2d44vOqgFKxfL1YlNQorAPblCRwzsNa/vIHK0ZS8712
jnlHYSSjO5zvaYhBzc8+9l0/WKcFitYnmY7SQJzeQDNNuItjn2+ci0WyaXKxzG7AmT3QMgsRAcKQ
wFQrkc7frKNRpaQiDFwryDZdIIGzvC8DHlVo/AqTXayIuA83Srwf+XSflA1RdCP3y9TuyGSSTj1d
0Ru3vYEz2s1ac/QanPOymQGkEUMH64CH7a4J7UxVP2AN0vD+ll2Ytui9PHar+9iJslpzhvGNHoZG
GG+BA+wIZbeKhz2uWkyIG3AXWG7xf01z3wpqohlHva0ozfOye4h38HqJgKKrqD3yVCOD2VSW8/c4
8GfF1SdNxJbWnuED5+QROASX9K5L0ZKk+V66ZduY8xn3eIOqtbftKSG0PU0lCu7vQex+qOvXxhqV
FRuGYrJuVDREW2PjLNwECudYt+gXk5UnhrZNKsL8jpiEaHFWaDl65+u+9Dq5J07ZgnsJBuWF6+QN
r3pQz2mTiILTh09NOR7oPICRUbLXJQYXqjcQ+jeFD0d3gEKUYaPIrpzPfBJ/anVZbozcAEALbtou
MqhGiBbRM1vwyiFg8Oxmv38pWBrh0ABV0JZ60mOdbOMwOgjET21TxgYOVLE4HqCbjLdJerKPiH0U
7bhtWzl4W49/zKmTIMSxfIGKBvoAhW/8PpHuH1bXH4hjNvc1u/b3OQ3ZFDDBY3Z2ukg9d9USu/O1
RS5lj27R00MeZszlLyd8QJrCxbM2LpvCoF0EIGSZuMrS/Sk2EFu9njhSWXSw6QJT74R1YobM0KnN
lYf/A3y5P6nTO3h79oAZL1JNQ0iHjsjNxm2GDCF/7g7I6Kro7h+RYjRYtb9qmCecnnJHqD7WcFD6
wKDLYBfvWlD+YmeAHBz9Tw4ZwDaUJ9OcICtRxQUL9k8i3e1+ixwgqbmzfJ1MzHVxzgOr34HmksaL
OZMoHRYCTwRWRXMa+qaSWDJX+CdwQCZSJUbAeGn7HN427rycaefDeCQxVBvgGGN+WvV3HB0OVYWe
nMMpQTtnHIvJdeeognsv0DwcvUdYIMz7qse2J+ZSxPluBls/p48IPxrrS6ZnmYrLQyfl4l4TAoCr
dEq4F4peMVq7/2r6hAHh1tld+zfE8jusa+Sc5SMVuSBBy0LuwtPgkA9hB6TtP/ZQw2Ira6bWdR1o
MdZBKTGALEoW/kcVW85xrBPbxZaluB19dXo1JwF5HrDUPtbO1Q5QmjxHk9j8aGhUN72Nhp8eHukT
XMqw7bSPKbXzb2stN4aMkdqA4QeMOG14YG3aZL/2Bcga1lbz2FXsa9WzriHVRdkqxPIADvDZDtNw
6bM62ccjy6bGDsfSpOayq4vY9JEzG/MeYtQfhc77tfImIbzhbW7U1ltzAtb555bJJ7qsmVCXpjAL
5bm76g9GbBPyLYbkZdBmaHQV4sEkJ5pcitcyfVL2mAK4Rkb2sYSMXb2A9exZbbO142Bzjfvb8PE8
VLvic374Dsu8oroBi70PcDMGWkBQ7zuhEuXHmmm4XqJ5MIPaQdjEjr7jpjBoR8LbHebPeuT4l7BS
XDcgzX2viuwgEvCHMZcsO0760P/ynIuEBnMb0qZnUknw1PBb8cbZuwI3JzuuJ3ZLv854yWrErXxS
Ra+guRWG96mh0gJFbXxU5MEPzQNDXgVlYO7kzhPf6LpaLcp0wcIVkArXMVD+FHNKfPcBLHGeZPdu
O5rFGqufIcqc/EX1tMcNYAqual3M3fnNdrd1QNPjD3qh4JHYa5y0CmcY4wwLbI8zwJ+TO9oiLLXf
xyOdXzhifHGW4OJjoIJie1/3dLczYfSWo4uJYlbr4lmFGDRKPHYIyu16W/3hy6x+MrbPqKew0FQ6
2IL4B9d6NajQMVmJeWldqtWeocKlTuGIJgYKIgFQFBBAsEktSJWse4ZochYvAR7eglLm6HHcbT0H
JjiHfo95FwCfm9eAKdEbgyMlykF1hRvzpT2/BE49Q+zWGfUkyfyFPX2hQe6FvWRkXRQJj0MD/Gbb
Lgx+iesekiXj6JhDRX7gtbkw2RX4kAs+DQOz7oreFpd1HiuiXJTRRny0UtVP2odHVPKqtDBooBRE
QHmSmGvrTpcgUvnCG13wIVwqPHlpySqsKRjftNDxlUJTr+U3Rao3JxuzMRDPv3APC//um6MX5UHu
mwMsK/NjKs+GdJNBQS2tYyzeRuWbKnjz10ScIBZd2WTPkirx86KYD8hVKGGWK0bD9GqOl1DjGHEU
23i07AAeCdDSpcL8roQ3SWb4wZ5716nN70/jFrPfqENHxgbO1/uM5BqFDzGaUARaIwu6Bds5onxU
4KW9vMEq82yUPMkhgglvrM9QXzuUinGJ3f0J950MYNa2NIx8G3ekGM4JTNjKNKfQu6pVzOCVYr54
4RJZg3yPKQWlar6qGZ8N8uFO/I+gRPSQV5F1lBoiZdyTZNKWjz8i/xxm/i39hz2e5HkhiIbAKeL9
Y4jhyIOonfdi7WHwGdBvRJNVsK5l8Vjax67Ri8vMI0/9csWk6lvCYiAaynmsC2Sph0Q6OwEc/afp
O5oXaJwtzenBDpiN4/OME9geXQLz7AQBDK2NR68+Ce8xlN3il9Ro7eb+k+N7UQtMqy48/wV097ky
OY1uPHarnrvuDhYaKFylGh+SlsdkTlzV2Hv3Ns+Fa6qPXbL8IaRf9a77hNNSJNkIKuWn47JnvG4M
gmkZyZi92PI+jZuLjLrRV6GhfrUhvkmkEiUpyBS9+myiuIJdCvG2S0/QiniA0VICwySNFm5uGObD
dVZaI/+zji+uYCSiL8Ud6lywfe3AxGcSbmSg//YWNqOvpbjKF0oJop0dGWIeLV4IONhhuhTh/TnE
QwfLT2sRDFpUuoTOqCnQVRqyo1SUviziIyV1S//6R3kE0aC21YayZaPcH2WL7IeCI4b6+fPhatFD
aMg1VdlZha875KtWRCoymFDjcQzgT7iv4dWxkJGUGPHCG9M/f+aU1Fwtdb0LCLlKRXcLpJwbSbK8
q3cPT+0widKMpdLGF+05e4qzzlMzW8oZMsLS+myZ+37Zgy4Osfc8mbNADYR7q8GAkS3+fJ92SxYj
3NUuFYPcO/TXyoYDyBbZ1sKZbBRhZyqDMniUFRV/zxYx5HMvltBSUzM+NDmwNKZLe10mdd1hP97p
a3lmROn/g/D/7+1h4h1xgNsXDOGKDJFTN1R+zoJKAg+lUZndUURkuTEO71jWq492JqPpSN+XDIfs
QJXqlAqHYZNxAulFuwkUyHxgglO9KNVDSbTiIkXaEqsJO6xdI6X81aeP43raiuE10ImioQqp7OTn
hDrPypd+U6PXDw7FhNjbDLU/X+b3DzE3+SINS02A0IpIOyEuM0alrvRmHhom+AuSJHYz2iGJbEHm
fdKnDa7fbrhebZ0/rhxqXqYQtwQKgthdpjbHbMV/JYzzoRE03rMNHDB7omU9ok9zbuYAlWTnbdyA
iSM1L8ADxW6F9tpCJ/ZjIISa5ykMlOh/O6pvLMmLwqRaBjtwWU4h1eSQeHHKALBP5ip48Pdso3nj
OzkkMbAKoaXvbJtmQbjypj1pPqdO4rbgK05RjBt6tarfmO4XtLURRKLyoq3iUievQkwoa1UucJiF
7CfRPfZK3jFY0pj2fYLuHR/SILWhTKKVJvgYpFoAB63KF974MWcUfSpAzWeU6Imjc2oACw//uA/z
m3gWQgGA1AeEXY5o2xLC60M173tYighwQ3B29bbQinSFjTAexGagMcNtPgcNkOejK1VhyofQb2e6
z4Gc62ebZKrWaiuk6VXHTbH1aBpvx4EfZABzCazgWZhS1hNfe646OLg4VahNgqjLubRrCd7sfNjN
1haqYXLTODGd+JGqKWLQwwvkL117aIhW3H1uqBG6sFdMtGPWF5OE4M0KffCrwLY3MXwRyvTAgGYB
d9qXs/rhwyfJ30j7IQ9UhJUATasH+lKa2HUWVcv13N1n0qYkRdpuLWGuelvaPY2lO5EZFZt4sn2L
7blrJD91eXB67seIGWFb5Fm/wYElyM9A4MbuhIsMbAr/8POmyu9joidGefAvXq5FqBErr51UFC8h
t3DbCcOPRWG4mJM90RuOx/hBtGOudJqrNRy/1xg8ZNhHRSfb8JHw4qNEX+N1LNbkt2sLRj68+5kZ
/9UHfA5DB9jtgvMRJfgEr4Hlonaz8ywhr+6TTvHFIf1H6mVACjwOov42bGlTLjqZMUTj8x2YmfxJ
EwhI2hqOqpVXqdgnvsVQJtt2/AkPfrNSn3Yl89uhe6LrnOhuwYcmHqm1KVbFP+wkbpYev1es45M3
HZjoNd5R68yiUNaHpvVl/F6ttpZZ2TPmqZeFUZZDrYAI5TIaM4w8gOOBzG8dhFwlhSmp/VTTVvqi
6fsZpUoTAEpmbei399+GF5blTScqYGwgzZRu43HUk7iGTGpV5fCQP5JvQo0Y2ATEPwTInyCqtJyN
jFhEMicnDpNoA85hS8MD/gGw+ehT9WX4Xqngx2Ul8pCqiPd20u1ulhZXsQ8h5s8IaCJttoTDf5aa
bmD2KwR9uTk2ovfNtxpYne3JVuMqqkv068cJ++KX7n5By7yiJBVP+0+aEQtfXUnOFR7gMB3xDfOQ
IZuPROWhoGuOs0gj94sfZyGzVobYfhy8teaghfaaVL8B4/wRK1YVuBMXF6Lb8LWjmZy1n1Rayggn
8YfkouhCGMTQXthV/me9JRJLFy5dw8iQ9AFhmSr3nK4SjQoyiWs67ScgYeve6D0mHrfvDE/HDgqc
DQHUbdRjCwFTQl9YHZUuBRy0O6ckxIOo9J04SGDFQYi64p+MLyoUKB/92VMpCvQ8cjfxkXB9wzhH
Fnx651DMtPX9NrFWGRwObaxEKZNafPfxMy4AUATu/M+QZ55eIpGzRizmURkRjL4H9xE4QTZOOFh+
CHrVR4b96KF4qT9H8oi2/jRUK5X8BUygacsaFKVMq9uxXIUUG8aFTTgy7MoJvPplr1EKXRzf0LBx
aXPRdxYSEwLWu1jq8+hJhlJGctfoDxmVIxZgYaJoN3T16pZ6dOFkixHQk6YgCZo21FRfJ5Gxyle1
tkSjfblFagFouY7j2MJNDuvPm5FaQ6RuPvYW99K/tgAlZTBfPmkeegYl4oAk7qd+w2rg4SUiTmTO
klM8jTTIIeFQUZv8zUlM8K5m0mPTsixyh/t4Xw3adH94vlKXtsktDUK5ztE6cZ+wAPOGoFNE9rQo
3KNlairzZgF6q63AjltBuwebi69ZYkpr0z+sIebXHWAqWxjKlun7DP3IEWEDRbPluZNuzBTSwaph
siJcoUVtfZ/a9SXzCGKe2I8R94OsuXm4IB9G6nG8QKC2hWRtwqWTa6kvRkqFR3R+u121To/SVwLw
IdWXNr0ov7RHUFMivSj7qYUxxjKIGZvFiRYReJe2sc9313IHHe06jWJ7VK2Z4hIx0EoNHY7zp2WI
okIo2q1ORblQz9e/apECBOGI/OGtPlxolp9DcXoKc5oiX0ADVVq1YhXQ4e1ftGABIPTWU+5N9EZ0
+s91+kAZucNlaNmdIDNavm1gcnzvXyBUSQIdg4l9kBGJlfRAG9UwsW4tn5bUbuZ1bgAgJrj3Nw2A
4NAO6OSzYTYHj7kOQk1WGkcP9VVbO36ECu6KxMa4wnXNjZ6xtEQ/fjf4Tamg4F77tpQGIJOr7olU
RBcDRuUnTw6T5MaRiC1xOAp540HPEGRUvw1tbDW1KVC//xL4leAEnut2GGSv8r4au395ZRi6WWaL
GjRYr4QzddopaV6h2n0iovJtvcbo1Ao76lpbYPSRBXX0YdDgJQn62bErMbq+36a/NFs/Sm8cAvux
XT2cHCkVPNV26lJ6pheOxzcHEesUfudAd7iG364TbnHcjiDqoyMx3PM+BZPqm4kFwb3s7Am0XO3u
Rht5fkRsvyf4EsAAZRDmzGXhWDRzBSjshvwdIMw66/ZB/orocuus50a6t0ypLsb5fwBHg+g/77gY
BM8tBOxlcaHNyfhEzQFZHlDPisNaR3ssg+p1Yp1zh3ODXtnvjsT5D8vCAgpuWk/AOCVXCaPlXzKq
ECjsUMwwK07JPuF3OuvwuoLdXUoDE5MCSMmm5rdmbLWnDAG7+6LS4Ux+XB/d/9eVkz9CHzxBJmLd
bDrSD+OI52Q++3UYHfIT78V/GrCfWbdjjBkN0n/1w2RFKLcU1u5SDl8P+Yo7EJY/6NJkIOpaA0a8
8KI4eFkpGuxVB/8qmA+ZLuJarAlUPNcqwj4LNITwLCJzZnLizuD3G+CzG+UIs9NY0Ieks02ozD+y
Rc9s++rKQnsYPLvbYvZ0cPoLtI1U019Jsi9ireCuxQrtkikPD2cTkon7RKpJ0MgQ9+qexhglQ9Vi
66eeApi54F+/VkPzJaINZqIk4aVwPdaom7o19v7lhCcMkC8zUeRl6PKjIjcwa610VtFIh4wjtiC3
7923fLZif3T7aDd1ePTWR2hvvS1Gte0tmIvVtrp2CHaGNny4FT22SwfrEb9wj96whXrXMzrBcvq1
zzCQ5yOu+7QLR58rSGL7SzbPxj8VRUdd/22fBoTX9cKw4Sb9544I0f/KTyaWdgGkKV5Ik6d7jjAi
zyuGCkcfPyHfz4Osjl9EIxVmXTr+lHTIM1YELZPD5aUKlq5VMmqNGDyZCO/A8mVdRirqTFm5QaOX
sDpkDNY16VlgZmXQRuneaSNKlzzndYK3Gw9QBmQQlsVYQC+A6Jn+AV3Tj30PxfGhDX4RiQ0A8BLW
ZysDRoLsyyNesm3Q2ir5YPp76fOTnZ8nL2x7mqirQFeLq/+JqZd8SPKxnhzDBfFodkVVnGPK8dNG
unLuCYBvFy3tLDyyfIBQQ4BO6mQEyyT8dSPCSSbKsc0L3r+wB4b0KLCg6YzWABXfRdlTagKk2Jn0
LnKhMw03GgamuJC/EAHGIxYjASZge6WyLRAZFXKNP+NHXIZ4FotjpyUccj/xmHNN6PbOP6uHQGX1
IAQ4Q10mN6aM67HWS902l29NbLDc6lmxJk9MI9G9V6oLiq6pB06BMKrWYVT9ALh9i2MzbZ5OVCFg
6psyYfZJeITrfJjzGYl8jBvLLxh5xllFnetmAiBS4gGkERDkO6y/eFGQJZ/yyWz+ZUfSm8a0F0gT
tm9UacaigjVJtxc3mvAVZkEEgfJRCRqZbkzV7q9zRm6AHA48wRPdKoL7HPEMWl6UXMHalPNR3nTw
1g1HFIUXPoZHQ5aNyY2HQ/OfaGSmsxtTGLo+AGUexFiFEZHkj4i0St6uqpR0flJ249gHg6eCumc/
89ulsMZzLbylwSqKlcdvL6iyfjOwEaGq8mZxZcETIRICZO+SI/CvAu0w3nEkB5k5/DovnLZfTMiL
iws5pU4rHQOxNMhZFiLD21aS+croyKOPhUNNeqM/oYHf06UA33KdHV2Mf+uBqcWTuUcrf2ia7UsK
MadBDoPG7jDXbDK07ETVE/sqvmD4XFQeA61bIVLvdRI9Nskp0rWxasSxo19Xeci54DYWAjcP2rVT
SVMr9o99tmV41WWYmsASMG+pqk823NtAuvI7BKpkwfnrwOZ3lyinnL1FAiPHqiAH9sJD8k/Y77/x
r5BbHyyLgcB4lxJQIoCgKoRoEsN4x2AItrG4bhokztCAw8Q6D6La5oLdH0lvW9vVM65iMadB0hM9
W+xNEC7kuOEduDg617gaYcy7+py6IGAVJ0kpYsXW+EKkhwXb/KLjYlksHvqVZQtG07gZ42336j37
HClYzg3twArSCYN9gaAZxMzviXlP6W93ymaI5SQvlH6DkH9THgLHXyh04fwbdamPh8NE5aUFFWXJ
p3x1z031hzSRu0XUzvv0O2ItSMVpLOXK7lBVlG6hsKxZpBtDDjwkwKj33xTXujax+YMxe5TVxvee
V7wgkFMVrk5JSNiRoQ+w2ezfxL/FdtSMdwVUAOiKdEmoNCPonETsjGFNcxCaNk4sNliY2Get1ql3
LIcpw8Lo1N98ICv1D35JGyTxRiSzgLfjmRV61qU/tmrwIOzSdFOQT79w/OZad0QG9euxfGHXVRZR
NUMX+xY8QLMVGNaBvUluvnsz5vMJS0PiSpr0Z05l25fHWhdaB6TE2npC7i1LSlGyo9fOcsX6923O
rqmzz4fc6y6WD3I0005QilZ2fHFNDmqdkrfd+I5J1OeE/k1LseNO012xRJy6fr2r/zwp0d33kmfb
BjgP5+AgwEOPAm94HDhujGrg9sYxRB2n1OjA3lRou9RZ2pVlldSw6gTFUGnzyaLk+xrMJaUWN9Ai
okeY7YeZz+dPujb4I3V1QWnkng/7FU+0fcpEkInn5edWa39jMvG/JQrmTsn3vzJagFiDTTOva1re
OKVMOqDpSvQzvfpgE8/la6ofeD7lxQ0GfpyYE1O5SEjgMJD2JSaAFJTa/NiaqlfjchzBd3xTPgYc
5+i/Y81Fk/HULJgxvVuxNvvzMnuSbg8HbIY1erTMu/4m3TiHJEGDtdoEXTvz2AxfjB7hY6tBZzML
IUMdvEoQdQFNtjU8i35nrlFLFY8R7Sz81AZObtmNNBU/kT4mWF/+kaXMNiHgoGsv0AdFXIyGgTWp
agEyhKneM/QRHWuZBNXn+akx6uCqojbmp/3Lxgu/r5NdMR79rIQVbB/0ZFims2RnzXuR14LVnefH
HFcy5eLAeJvqzWc3gH6fL6WVqQCDlsZdkoJjBHjxpounJM+QTAJoPB5kgeTEHKkDXWDnovNUJY/6
uuFu7c1m+4wDUkdQF5cP2vuMCdL+XsnvGDa9KpicvV4XeLvmL4sNfB9T3jss7uFzjBYBYnVfw8CQ
f11oKsGIXfUTTlbv+T1xup2BRvPpyxo1AFHtdHPFpVs4+0p2Y1VdhqyaENvR5oKwtWTERMWkhNEf
qLpIsZy8U3dQeuuU3hNaSEOF2Z+NB6mE3HPkjMGUBlPyC1tK5yW3S+2po2/9dxpi8GCmQLgGMJ/O
70i5jAvFEuQHUuuRosxt8qEB0WHSbc2spvZ9B90rKf8NKQt4VmxUc23Sf74+TjNoaI4nGdWPhVCH
3JXqkp/fBnzPibVLebjuAxxAFI3/lnVkAYmyDS+ZTiv3fbEkJMGTcvhAXTFacDD1GdqF1FG6zLqc
78qzo3Y6D0jHRBTidGV10p/9nwOKOdV4SvzF0KNWzkFLxEdAS49mXD1fJrzPsYlYNp+RfDQRpSbc
6/PSakoc+9f4vT++4UH9eA9uL8TZy3HO6ntuqVVyyysJabFtsH5fqqOtNvjHZoWsBGpvMJvbfDkW
j0FUT41ygKQ5H9e5HrxMMV627Y3D4m5XySQzZn2Tfb/V+aVFOlR9FwBfGshWLmcjfq0aKq7gJ+2n
/Yp1Ude7ojtlH+wXa34PKKgfidv/6bHyMgvHPyeUB0jkLF5PjOdcFKZ3BwlD10ttxITlJb3wfTEh
nKIgdzYm1OGF/xETQ+AHxj6ySTmcWETKkWyMDujYwD12CwJmryUg7Sc6xHHC/E5N1lJ+8QOrFjdN
HpKnPQbN7oYnYARJ7QwXeqYnSDA2NuM+owgK4Qsl5+9mavld7/CF8wcOcZAwQ33MuXnIZuAel8D3
wnmrPRirTi/Ldr2hygk7it0vf22Sl6LGDMyutaNBj43XDV96oX5wbtIhJJq/Tly4absDYkTISghO
xk4y1Cs8kyH5BKimNJiW348GZp2wjOtIp0MJRHBgOrU60WNrBtR0uE2M8HU8y5qKxJJKfkQvQobP
h7XyllNREb/CTzdjbs3e8JzkmvB2JjIuvVHFLriNUgNQWzK/iLnWC6I1i1kycX4p90iO7Zxo/J9N
kDjAM2SkseWwpNCzFNJ+kfXwGef/R/LtdGF64/CJQNIoICzbAeUxLiqkwsYzfHlYR+rhQn9AM4I6
ChAfnBklN96XespT/pCNSMATYxJIKUQH4ARQ3L8xdG90irJLRtengTgOtnGrbLrf7N1fO4EZ75QH
4pXfkLu9Sj/FfjowChYQL956RJEB1OmoJ2p/qudu6snte1/fcpdQSjnFLVAMeubNHWsMxSf9Cpq4
ojzgrhXKkeELzWp4n8Y8P6gTbbMG9sRbrKNClpQzakpVz3oJu4KqFo2e9neNNP5ESIfaI0i/b5Jx
55r0LIUWhxIagllY6qHZNmaqjflsEEqWmrgSp4GqtdHuJleszedFi8bVH2OSTtDPoIAr1uCVZE44
dd6pOEMbRCdFKDrbSEE3UYZq1eIzYNkLVmxHFhrqmABNV5gjDo+Wfa0H1ZsXtUvZtOqGMKahTOR3
L+YWuErtZW85R+ls1sWjWs7MlkkIw7RbdU/y0PmmdxOC8atoMwXLUPlPAijtDtFEy/RSNXrCrS/A
wm203hJTg5LBxHrMXYzhSIiVlmpRZ8qxgk+wNkjlFIW7hw20tPM6t38S17fSOP+kOTBrepYYXjOY
TXJjdwTH1dfWUNaFjuf3UB7GO4Uw/IsezknxDzna1dwmT3ANEcCea5UvKdvmv2epe/2x0EY3I4eu
CwJk0nuzfh8svXyZuDxlkDTALkGHfJmoXvHlQChWhbccTJjHYZEq1tYawADO1HzswrICi+/VWUJ4
cJ+LpckbuAJ1RTN00DlqR9oWh7XACIrpc4FMrQBqDtv6rJP/Avs7N9bkvOHK3gdntpBTuNaz3lzA
U5v93v0Sf4ElM8e4viI359FG4y96lIaqE7hbyLkv2JvEi7dn9csxvNDMOSu/195Hf863kAIg43cq
gwnM8ZaSw9sny7+av72uhsj6XZCxAiDm7ularKpI8yIhIQ8zvtWe1M4i0uZyQ/+ejJjj1Eu6xvcw
sFqdn/+EpY2awqQ5o9QfD8MRjVUWww7d+p2aetxH1OrWFxfl5JgR1pqLYflCE6lKyb5zbyKXhQZ8
dWdtOMay3lc0EXi/stVCT+osUKRcXlVgZMH3ysXNf5TdHLXzyEYf3/4ItLiUqhgqIddrpz8HzW9Z
3fijxQAvgCIQYjl+AJtGNmA2EWGc5d28G3+U1Ht0NtuSqBaHir71nJoYpxO1lx0hXbIJpWB7AKlS
zJIzNLIWbUdET3LZvKULFHYu0F+S7ocxKm2RAslPZO55MeVuJAN605wDUt4O5dWwUqaFpfnGr5ZN
k7RVIqv43/pyuHrqHpMcRme8E8OFV1YgfbHUxR4Qn02ZjUNm2lFdkcWQySNE69feWC9usRC1R56f
XWD4mwgABaeUKlvCylDekkDJbk76tDRNpF1H5XZ2o4fqej8BxiMpVgzbgHVQzeaxQ+hOJS2wU+Lr
i1qhWgk0wSEPiB4xH/5caS6I0mKtpPgfJGevTLOS2OGOBdm8MLB6YOc6dHoPiOMXMHcxmvxEN/o+
8dNjNOapn1JH4oDxqTeA3RuxpNLlk2rWMMheszt+UjxRJXYzwPGRh/F58qWv35Mk73j2yyB7IizD
18ihu2/whI1d225Laic/TVBQ0QgJxWzwwxBnZHjG6SYWJG5i7AToq/RT4NNw7pG0GZ1NThYX7JLE
ThaXyLIIgRw1MXWVvheXYtgSaM3X/VkMeqw9SYbfVI2trtlX5zRvnB7UsSHSnFYkYGQ5lqWjSHzM
qjlYN9GrKe1e2XKKbLtZGk4Ua/OcvxyVFZMsoGtekHYbiEoloeX+nHXBTyyEHpeRqo4kyogtEph8
0y1eaaESUQhPvZsUR6m82rVwT/X5HPWfLANZu7mjsAwXegFhVZxPmAkhsAsa0BgYaVcpCj1DoG9T
uikcj1WAhUHy5BcN3ncPbll94ur+YwRvy3lT5ehL03YRgyyZANV4hMpDHIMQJv+2SUF9/9x/5nFe
ohhSPom2OL3JUH2cNIcUg4Id2LV4E44MZWTe3kH+wul4uJHi0TgEG3PQ/zCWy3GVqfga25uqkZOG
j+TvDw4ylIjsjNKuKCGGQxx/l2gv9LvIsRFwZwlGdkqCulC6Cs7g4LHJFfGqU+6fnHc71dOvZvPX
y1MhdbanIW1K5awMrQT5UYzol8fIVm0P+hpn/R9gYp7XprI3CWiMsqn/EOy0NbRY8CoHE164clhF
fEOTL+Au6ge+MOAmQE6oFp6AYFl79qRZ7+VWeS1bWyPR5EhmFwkWctJi6Gj7laDm7zTLjT52sCW+
7d7t03atzY1Z16uhYl/0rqz1OIlEKmWFek3slHN4+/BMRhWhZxau4S8oFaSZFnMQancSgQVa+beb
xXFsVqev5jL30xA+R3EdyvrrescNnOzFmd7w1lSxInWD6BnvbFN7NwAn5LgYi/6j8VRk4qC0pXfi
xLR4stsbuWsCIEWPcV0Q/4vY48i+e9zxSQscUY2by1OpWuzv0fJEGEa4D9aEb26VH2EXr+ZHK+2+
Lc1GvfIm1nr0kG8/JE+vKOBdumfjbzZBAv8IsyFKPlm0AJLKwDCFt+d7XtYJKhrPnBVpHh06/Ben
sbscoK6iU3W4W5KAjwyTaL7neGbGHYRNqb7LKo9ynAPG3DSCcE9Op+XE033ncZMWz8jaj5Le+FhA
godf/7pUr6C1HsNXxtTZoZRo8hXTlixR7W6X17fnCRx3+u1cs0FMMWQ4mThdi6YKMa5e8dgyk2rb
V+5Jp1OzJDALFDfUQYKeO52xtRUJvsQV6XmOCnyKqnPVyCKQ7YU8roWdXM861nVuvPwjQGkx19yQ
TCOJgUVU96BNiOzXwlrZ12hOk5blXUQsOLXWUFylet9sTstoqtWPbv2rQ0mcB63GvBY8QIRTvLgb
NubJbyg4cfjvcTpjhM0jjnjn1sZQLqP1rLPaAvqsyl1v22YkWGHLxP8qaBgTZFCcAgc/uQIIl0xF
Tj/bPNMgjMnsR5ETHmaGLgAYB/3ufQUSTaBB4bUlKIyLn8Vp2BdW6vb7sZw8UNHoQAVckY2it8/a
3V19GME52ri2M43HHLNl8CuVfFal46Xa9CS8AmGP2+9e/Q08uJAMs3aTFf5JYgAmlokG1CoRT44r
14cEgdBN9i8EhVI9T6tT0B3Oc4sxhw0GIFo0gcH7MWUDkGuooUD7tPEi9sgyQpUmsTK5teajiCXo
Vn/OapFB9kfJ0zcYdd5dFXMC1kKgAokdwWq3v8Wwc2G5WHMqROCWFWsXyHZjOR6dT1rPj8r34gb9
bGCEncPv/Job7uT9OZ2qVulSlId7MQ9cADDySsGrT0jQd12uBrY0Gga1f9uAgoAPACjBXnU306Ps
WH4AU4sSG/ySn6nxB83twa49xOhencJLg11UVt2ZaKpfb0zgnr1nGb6oFEkysWDkYUZhEGP6VL/O
DOo/QbrBs33wf+IOUC9UD5DyYsvTpfBnMK/CvOEhqUFnwfp7lB6HTn+hWpXJQoHpZYhQruY5YsuC
U5wD/CpHfTGbpiFktuvdWEXeLLKLe/gY54CUjiy59E/fNcM3UaYmRsn1rJAUbq+0kI0u1ABl24R3
ZZaemNE3Mhbum0RgpT0Alg1bxyCa0Uzog8cRmcBQrpAK4LT4CkZfje/nM0LbKR4k6foQe69+hcX5
oPVaUVj7ihX+3N7FvCnbgKUH1nY6VmucUEXxPL/drB87BmPCAPCWYhriJyBYTFMde/X8dEO0FVrb
nOQjVwgKC5XTgpRnsY2OLtXNamn8GCO0OK5KtDMulhmNzgMkF8r3SqhpaKtOtk6EjkKxUkXp0HA0
SNZ4AKGjgy+iXGXDwD7QnEQkb6egnCvk4bmfqWSVSgq7gaIAXaT61EpRL5NEGrUNjYr4VaDmMnwt
1FuryFAHCQUM7PKXQgppXnFFbu1QI0W/XI4/LPfWWQTaMUecV8C5aXYu7nMyk9txe0s6ASV9WC0h
m3uwOe/RBOkmG6aY+U1IH8Gi8amj+k1zpOeIH4Veu/XbWrJnzSfVPoTqOBlxlI6d9MHDVWOH3B3j
LjhOL4hIOYwCX+DCfNJLW7S2QFPS7ZxX/C4X4AFpT8DmI0ERb6bAG2EWzbSequBLIDrCnib0TmGv
IfA5zcz/HNANI1Jv81dtOicxwyS20y9cBYu4dK/P0j7mdPhZo6WpThc/lM9umyzaFElr/idHFIgP
7rvynQU8z9IsBkmVHRl4iwRBSC8Wia2Je/RvZL+jEkxrQOgEXegHGV/tkkSdxvcWHloEF8WgiRnN
e781u+xDK/qkVYC7+SIMoPTxvTdjLFyfP1XaSJlXaGTbwxh0hHCmvRWNGMZf9+UVWlP9ibIaR94f
iBBlNrksU338wwRH0rfkj9i8EMT+Nt5jdsTYlj3elCynUEhV2gDDKNzHSV5gY7g0LxSE7zQ4omTP
9ZMjoMnnyq6G5dJIJmkLaLYlnQ14u+JjPDdSAXRepodGKZW65u/yTuXUyGHrG5LV/KLne3RU7xl8
INNd1n9cKZVfE2OXVDToFiV+AaridCXHLwG5LTSoEJAMwCml+tSh7M9i25fd6xvRGIxVbR2s31m/
Fvw36r28anR7paG0AAg3sZguHYawjonGMb1G2e78MC+31nqX6uxWRJT+3LVaVSt58pfExSyR3K0R
j6pQL2mjkajWIKjs9sKI1raDFPvHqAyF7p34ubqi0Zx5uEOmY2hKHCp6SH7fgKfdzG3vizsnvlmg
tmuZtT7i96jtDbZ0caqO2YLYCo/NIJdJBcoG8CbIiiMu0vZLAsCORY0zt8/VYsJn6qDd7nbI0WQU
jhQkbgbtn+MFhjQlHfAFKeLT0yj+0+pwCIV2OxzkOXUzE71tb5my5wzsdDvafl9j6AIEdVlQOmYu
Dv+X+7huLEZIxHn8gh/yCEO0is7iiKehlcyVa7KG+NWjYVkiGjtMRO8WtM52+LJJdbrTyYv4C9G8
vmpe97WCTY0moQJJkU8onqdCzOyA9TU1X6hVvMW2UyeBDFhs7DzdLbLdvbVG/VimBLaopcPaOHPx
U8kY0Qka6f8mJkNX5hXm6JT++iHPKxIQ24KiZGJcxslKkm3XI0EDnxzCETKEfomFazfr4Sbceqfs
byIK+4uTAIEMbFRNwmbxb0z6X/DxO4GNHvTsfuLx+QBSPK87BYjCJnTjMH41tDqlPRXo4kITorv5
AAAlgJwOSVxmGbewxdC9K9Wo94IHE5mb4JTwUbVAxZni6sxSuktJEn09bDsS7H4L8QTeOpraOc/Y
wi5klQ2SX2BJusM6hpKUPD6D14/qlYfFYlpAdIgAE8/V0OTl3VF9UIqgYBnaC6UhoT4TF+7/LfRb
f2EYr8E52O1nFYImFVOZuPP4LW8gnk/WBlZG1+9s6Tr7W7L7HTeyapuGafcK8DAShTZMe9bo7lRb
Ffp3xVmYBtQ91T7aKxUjzbYVss/A19ek0uLZOl1CbGApH+fluQlIP7ZYjYRlQLaL7xkC9TXHSELo
iA7cNYGBiKmbQU+HuKtpF+cIhdz7m9xNszSY1JI9Sw/HavYttf31YAtQSHGFrIIKpMDFdOJFrtu5
6+VU5D8uMy5scJzcHVB8BWQFwv8Wg9BHRyXQvKeDUHh3DM28x9HDpgsCO/bCvAJS4vxIKB0VlCnQ
eLdBQGiRg9W7ukUnCXfFSWaWK9n7lvPSTwtyCrpzx2AwGCQpOTIrxUZhs49DBxojudmgcK5ex+Ej
AR9AqNZ2oLZWzo7AZgNtcYTsc3v6MEqlkzk+Bp8JtNTwRWnpyQAu5+1Dwxdh+UL/dRE1fIpMZYAz
PM0z041HnhU5gomS94hLMYNBMMlilMkyofJS7MX9gP0s2HpXxdLpger29T4cjGFeCrApLB4uc8Xk
Rd0rpY19MsEFafUqKOZBNm3jBFR9LdWvcZdZqsi4e1I5Sb/dlQWEZqCGXidhSi90+I/llL8SwODA
gWE2P2Fu+vSWu+DOj2CickEdm8aD4tATBCrkXbVTHQWMuie49tI1GWpfT3YNayZPRExPV2a14prX
c7lsBTyRSst1M3R+Vzs+Drn7+l7dnnvYrH7Za+hpTkVROd2LvxjSlADHFXeVJFLG/6tqNsa0zHtn
Alc6G/tOUCEDfjqlLsNztXqUP6ZiXV3DBUbJREo7jQx7U7gN7lxmnxzBNozphzpfYTmwReUA49Ga
ZQ/o2/N6A4q8gdsPOG5cJ90gni0r60tmVUut3dI8PnZcW6ssSA03C2I8iVcE3vUz7PCSHFdfMPqr
DjQv2A5TPLHUbhgoHRWnDcLrkmicYzATRWp6lIkKA4iYOOZlbDoDmry2VYd+hUQwDA5x5ARjfT52
UnIzG8p5BXiD989EehMrW747B+W863UNwFeOud6r/k5KUySsmU1G0lD2cVw5Gm96orSs/Qghz8OC
mEWmvId9vZb4IYXRxvJ0IcGxSY40R5Gv21aYEiUhtMeL9v1XVJQaQxasafi5v9HKxe5rFC3YxyHE
kVLpkPZEybNBezoFb6COb05/4QoKNa9tQ0VauReZhu+vcxibwwd2oXUg25Z71UhACpbjFDzIypPs
pw5v1fxsaWflAKQlkd4LD1piuI0yh4bCNsvYDYzH7mBznqtdEj4xsZeTfmXn20rgO2yFnX8o6Hkx
PH/IPu8sqyU+NL+xJeB8DZbm/ZKpEx34EbK5JQCA59Yuiq57SMBuNDt0z9WN4d3LJ8nCqI+9AHtT
fNNxQtftkZmdoXesDIJjoKone6IW//vCp1XoOAVuBKntdaxDNE4hX6oHcPOyUBmVJxDhTe5ATNbV
tBvzOWujNXMPsFXBvbMSHlX43sCN9XGrQXUoPV/ZmWYWVcGzaf2aeIOvtfMPi5sYBXe6YTrx/8O3
elLjvlmcGbDdTDA/tPXBJIW7HGCrC6mWB/GiE4KbbF1xT68DlkDymlDRY1DKawPiB3gzqSYN+g7v
UVLNl8Daxv2D4Fhv9sfuNba/u04+zyOdPJN4KvL3uj261RhPDQWvMaUIR5gfkLXf/i45vhsPMqJ6
Nvg8Clp5qkOeV2Ckk3ClRf4yLRCyc5fzmxzj5lCjLDcJz9rRd42g8LSy/11efbw7QBYtx0fGEd9t
31NBpgHptKZ7L7oyyj4jZ84mhwrukbk/VrXTjwd6fjSQHFS+0kxuiau8epif6elBEbdowM9cgl3r
IiSLvWeoIsRoCzWyQmyhbIPhXOxQxX8RA8EFVEZuRTo5yzCeDamjIFRXbs2WEeJpes8KdxiH+Q0I
0J/iiyp3rK6woH19uZ4swhu851VkA3AAm4CApbsQzHE75YK4H9wGVROTc0W2laM5J/o0yH2ue5fz
+rMrdGekGGxAUT6qhkW8IePIDYy1fgIVIBDOEDtvdJbbHlp1nOYg6f+ZWDr+RWjGZh7s0Do0Xsr0
B7O05/YMR4OJL+p1FNwipb6bRPDXR6EusB1z5vYoHyHG3OTdOaA9dNDEfCIJh6xzu5Wu9ZZgNuys
hC03xpCRg7A+DXzNiQTnU1kXJCQFXZ7v89wkLiveacD9dSztym8gGDoy3JvJV5y2UqCZeJetKfDO
1D2JrfMKlH02KQmkcJEnDDCMM5u/iiD4Meihltm87NQXzFBb59O0rwIoGIDnspHoxDZZBT+tis5Z
RiQUC76nUm5ySZX70ehh9am8vcHAODxPIFRv0RpuAGx9pHXvqSMPAtiT2wsB1a9vHuxDX+c3UDBA
2SAzg1g4aAGs6CoFllWumogzG+MEp5P82FU4fiFTVGfKa8DggMh6/UbAUZcs+ozEmsnr3lEUjL+b
pqpU+mg9UELTNh9ylz1mETrfoSxlNjMtugRSD6w5L9pwBub+raeyJNFSyfPFjU+pQpfiznQi/jOw
nk9/P082d156XMuYJrB6RY2U9TV+mJZtR4e9t2CogDT7GziuZKs1rDWXU/w/cTQ376b64wpR7x+w
OiEcrFEXdGyNmg8J+sN4xaHALDasOWvcPJUfUS8NksaL/IdH5kl56AiKyS3XiWcrzKNS+I4GGwJL
Ban/qtaWNkhHqGRE0+9N2zK4Ggiraxy3u1JgZEYFPTJeUvntp4zDHt3sQmSrJQLzqG4NKK2BfTM4
BIPGBBSLdxt+zDzmOpwpbFAwecSUCm7+rpIEg//2D404hCrzjn5AyYYaF7HoU/T10AJm7p8uCaO5
Ag/tQH5fAtxpyzITjIiphxF2Y92lpx80nR+0ChLO/OtmUt3zf14gTxlBvQYwGKK4X+vyPEpjelLj
Y+TAPBXXR+xv4bruNhuYdDOSQnJo70gyn7UDYxWBGA8gyxoxLGD9R7Dou/LAur+qd3FdGWmORa5r
Vz45AL9VJ/j+H5aKkwZ+u+3TFS6nKQML6nJTiBQcIyy4Zvp1zext7oVrmMnOExzOmxk9/u3+5mhD
NXphYDI40oqXX0HwU3G+yc+Y60WEGoeKrxHOLSXJDzile/9WjVrHf+nP+9LxuPFQB6exFS8kd7nd
2nt8a9xDUb6P+eXNfnFrhWGwSBV+NqRYF5JERkY7LvDN3uudIAH6LNgg0I2EW7FAawXRmdfa3LWn
25gHfgvmd65f0Fio4p9cuPmZYCMtvrTGoVN9lfvCHVfD14suG3xuuewX7hBGwbksqWE+44YzpvB/
6L9IEp+BkL0W9sfYzLJKnyWUvpN2tFp5zWz3GrgbXluKzNYL1TKrfA/cWxX7HKMdBJb9HxsgqpYK
+GXW1GTCso93YD8eKizdH1jeogrZ4RDNsMFvlaEDFMojpk2wyXGnDtYVRGvzTmA9x8gIqlGjVG61
rM8p5RKcUDY9UtGtzyH9zgV0N1diXweBeyTLsBJnA8lSnzFGnJTw+laybHSOEjB7pJbDHkapmc05
OHBkVic5de/Pt+Q6hZWGfjSJFluKogZPURfZZpyNoZEqpZ0AkIyF1KRVhDsu6s2YSbPK6eimRPSV
ILF1Dfm14F0J6tDp6h6ZcNFpSkoC+ManlUd13UyAcwOgzucNYB/yCzfimpoV2WP7intptynICtgX
gSu6sOZfFuH8B4Zv9cTpTs+k+tVc75kY0dZGCgRADfHyEYOF/SRrw5kO6GRtNguacjjy73hFxRB2
6t4+W+rvBklCYn2RAZPZfPTemk3c2ICHIaCo8Ame5WDWLJAnfgNsrGgV8VEm84/+9fJEleS76BJv
UIS+zgv1XeAKHvkc8SE99WkiEgkeLkum74m4T6eEuHst4KgRqo8vBnmM7sgbBZY1KazncrLY1hLw
EKY5z1d+aATETD8nsxupDCQJhGBN3Wcp/Q2bHidmRbW6xOIU0d4ujI87q8wp+3NM821Dr6K6Bf4s
QJR9bEZyC2EjL6rhaX9x70fpANvMZ38/3OrX4vxsWbck16GpZ8ZD4CVrnYc6dtOAoKPhJRU4ZQ93
SzNTWkKSVDrN1Z20fZ6Cd9WakOcnl/WNo2cGZcY5SCt0kaav/lsSqLPTSe5ueXug+UpPUkzdgubL
3Uje17CcKAXT1dXU7NNAJ4e1S3JJKPJ6dUv0641qAJ4IvEA4keyUNA6c/q0RkLSZBmyavZD25TFg
/Prm5olkYqCtoPJNsXtetuMyZVPS9bpaWUb8n71nKrVH9c8sdFOm01jv9MUYBvgEgoxHHy5ZMaGh
I+ahuxuFZDaG7yHcz34fBFTFkCghTYwYuVjYmp3cKXhy9KwvGye9RDVIW532VrwsoXiHrLGCZcic
BsC0ZxogCgxNbnBS3ZmQ07ACWV0LxUfyIZMRVz1jd/Lx1+DTEAzHOND6tWIDHpWiuWOr3+/DIxeK
TuUTYhgAt6+WzMrSP57Y2r/g0+jsl1aBHtPwfcwc+JK+YagoxINOupe2MRVTTR+S0XCrBRW8otO4
oRQ3swcmF9z4UOfDEeL8X/OcyV2KaOYLPV+DOWRknp1hyX6qi9zesTS0SqYMgtSZQMsUHNfdUimc
+E8qEihBa24jqe6didW6s3GWRu6iEzyeYSIz43CzyM+c7+nPCm0HGLTYdbsZyDSJp62KetagiqPk
QIePaXzVzRlc41o5htExNjBLpZa77SLEfgBgTHqqeSd38jz0PTjmlTMRaY+HjJISc9HrNPFVwvla
uC1Wfrlb6AkV0tNDoDn35RD5AUwOsdyEURYykXqd19kYnGnsMUI7TLEMNnyXVHcFkPm8sa8wmawC
4JoB2L8m/uERwCddnB6oHDEc8Jpt+yF2+LY3B5WF8SEh4KnTOIbBgp7Ei8aH7Arv3csikgHpmHDT
e+GDiwSKdY32u9N3BD93d1aFKNes8vCHGxI+rBL/JuWEiEy0qi1pLZgBr/w1G+qbhoTEwDv/c/H4
g3C2RpaScWj1Mp4Gb+YSlSi1zVa6KglWSEC7LSBdmjU9jETXF6u8AlR59Gljo8LYzDgV97qWm/+B
BKslc8FLFimJMIk6SFQ7DGf1Zu1JYR0grGWGa2mOQ3srHJruviZL4TBlHxWK4rO1CFtS74vQ5Li5
8aXqhZ8Kvgzhi+rTS96iQoQDUK5qIjzruI09KMbtd748DTKrqfkA543/Y6HPEbJIEndJtT7PFWUL
2IwSSOrpoEwICwFIT0CzfwvfLh8gNGnhNvU30jCN3ld1Q0oJpGd7ldISb30tXU+74oBPSPPwQ912
jhHuUf7u4JDhvZFUvcjWwXcsQ2QC+31hGsg6ItL+4Qv1ve3oB33PrUXaaIIT5sDEWjj4oeD8ro2l
+dZxo+lQmcxLJncr1FmwPVUlwnSNmj6w0wj+mF8m3l2SI6HcqGLbJbmDri5g8Fn7OZLolFoJoUdz
uvylg+fLUDveyjwfLFGn0aUmrBPklj2r6ezf5UZLoAGKwFwfJ5l4ZSCgime0NiVY8aHRwddU/UvB
duWckiA5Y2ZiSGX6AdxmuaVRtkA0D9M0sgCnlnD/gV77JDccqJrsuQaUi9/PLdvQP48X33M04hxv
AQ3cHTQdrzQ/jFSYEGBvgUhz3G6xOTWiFM5cpQwfrqe0tqqzqUuOjknFwjBnkfEOOST9NvUGcZvA
eKt3pNmxdBFVyNfNwKebK2sGHTEFGVo1KOWo7ckVM50xlRkchvtKyar+uOn4Hhm5HWJDKsyMG8wY
M6SoWzpaORXxX2b5U6oPIYDzXVZPEOmk+2HezpoqHqOCb/yjnh6nOB3IaxKi0hMLWTPPKSjR4Ry3
1ndy6vyoPgb4qOmMrTcJ/acdwCo5P9oEUd1mN9qDNHY9+mbjsPv55C0ozS3qI2wSbyqjpq7oWzTo
ekmoMsSK2rd/PtUByQRo2t+kELeZmvGVr5IJ85lnrmn/jVi8B1yT5tAemYD6Y7tluH7ckreFryUy
WXfr691iU7qWb86jXlXWxKKmPW1c6/0IOb2eOf+w7i9dPIwtVO0N9c04Gao8h7sBjZtUoqSlkrMZ
FJnznLYbqqedDC1qovr2ZqeUiZCe6AhadgUnrW5UA24AD7yYNw0Ar97dlg3Rmj7SD6GTIRWVqwzd
LNoWpeZWT58zCDsm+FkWi2wUnGcwZjrLejtqZjWZtFLF9/oRyZnrX+ox+JMZWRaYNEUkNP5nPeBY
xDt82A5hcgPXsGB2g41E0SnaC4sNtXjYMU7qmrFvuHmb8MqSXYTMczh3WIKePGtZ2LFqtVj8c2oY
nT0sDR3fAMHQlAcmRbUyVUZBPyM0uks+Su9oQ6VX2/46Ix9YUhRc9JKCdgNYj9Hb+tPvBBgjNVS2
aXEjG0Fh6Xtvv6pEYoHFLbOMj6s5ScWlGgDI82Tgu9ye/wWjXRo+gt1y4BcEAh0zDp7OzdPO4R9S
1z8Gok4iVCu4vxfEvzS5F2tqvWQ8oAo8KVF9YBj/P7QoAox1ngpvjN92VTQFLdmYeHLhqOY99xNR
RrnBr9SJUtc4ToeO+uzgdUtaJN5jfXjollALrq4AqqFKYAyFpAGYCv5maLmr/ffeuGbiHrAC0F/J
hLRIU+4rDwdo/TqtUKg/iARP75VDzIOqKJ1bW/1vUT6pUMA0JxBAMSUWgLffMyIKfBAayzs+wLDw
FAdnDqMrfZI0xDm0dErqXiSf0n5uJuhuInZlnuHAke0L0fNl+jixHkGJLQHr4f63sBiUFbAnmeZU
6TtFXez2ANM2+yRF9k5wfdAAnY11LLRRavJrbu4iy1NV1JMII8ROpiInrdE4l16ivPOQ8CIjT5HQ
RdSNGlzBlcW2uSL3PH2MYe1XJzClMjPysoI+T1YQIWLrC5qKQgSJHOlgh0OWNY0qu5cT7g3mQfye
8PLuCd0k5QzP5D/DDvxjXEFjfFbsvC61+qDPvui/SQiWZkNKfUX7LRPprpylY7eyjcQu7Y0U3HJu
9vTPpthhIrHnMPQ6+0ed7YJXRVyNjVUvSch4H5gblV415e/PHib4c1yHLg4rdSMwYs5+TqDl9eda
HOjor71qK+7QySkhAqFoW/IVZdNBzqMjJFssHmekji+shrfhvuOUkNFca6/k1C4EtuW1R2B8JMWG
PJ/eoXkRDR/tPRGESoR70OYq3j/YsXTs0PokFZutdhlWup/kQfE1u8XVXadd05tkXLXP8coFBJvL
RzmgZ15uT6V5WZ2ICBAOB6+6EOuA6gZ1yyZP7407wn/i9c+epz2K9Nmo/k3/OyVvmjydx6AbtYGy
ka8onEQzvUxH7rnHEhuxzDhlU61R6RiN12KHOKA77sJcRh8K+qY07C9aFM9S6md+KrIQnl37HH5/
63uYw5rW1Bxs3IlD8EyW9kkS+gzGW1490xux4mRZ7B1D5tbF4pswS75Zx0Gbgd5DRhLS52/MPFDn
1LcvOMFqdd6Vg8q7oADsmZmyOeREaFcbizHIUGbt9IcjCL0wonwx5rYQtxSYEN+6WhXPfyeAqN8y
hjMtXQMDk4Qwg403hhxIm1thLUZT+wK88SchA6FTuBPWl1uiAb63RPzjrrF6h8hiS8NHKJlYqneG
2ia7VTnqIL9IGF43MdsG5wrybbaPUiQ3mb4OyanYFsN5NKdPOjq/LjOEjjBCkQro109qV8OIcCIt
CEjCv4jWJYm0c+78D0FCW63OYNQDkqkaST/6+FcIPan1qdlTm0uhHDermlIZXcVyz8OOi4NJ5eSR
5U5G4LhYluKysI3+xG1M/wSlQdq6XMMF8pbT4PdKmzM+vwAcwl6kxAqGjBJFJT52B+G7EWVKF3Zp
VTK94qAOriGLysBjiVvWmuLesqZjdi4Q1zC8aIheu1jesXXQsTpZFkLFwlEpFxG2SEc1SbTsXaqb
kOqFEJ4zZiZrChgk4VOGHvj95krCpPF3Jfg92hrho9NntTk8bCLz9BZltf+HbeMW3wVrwXYzjqaR
g4YIioj9SNvdVM2RcZHcGw9/EURUCGxFe4ct23vjP5iSpPPCCSH1W+r5EnjWrVTi3yVWh8hrXYB3
FMaiItJMeV8hJ4axU7Lam3R/VrrYdKF6HDYdQmgFh7WPUskvUifdWekXZRD4BHysIZx7Hyne8PsM
rHO07TXUvoW9RIGlhA64pWnm+Kzhmhgw4mvJ85aofKeDnnJN90eE8s0WYa5gIMJD3GAAI5VqOzwm
e/7CdecDQP0EqsqPjY73WDemche+h/ht6F7uxxxjisXuxD6jgal4Ntgk1kCKFv6LJb0BSaDRxny2
1degijshgpEuwRwD+MoQmju6EfbUYFq7EWRhLL2GyuCyhlSDZWYwxdsjKGzEp4n6KmglLvcPd2Bg
nGWsDelvTNDiFxsu2dK9eXuK+ZEAtUlLRGmg11Zo9MIaA9AABm5Jxkpoa7/BF5U8qlAaCT2tEB1f
BYSB0FNxhOsdqHQOaYaWjZshoYViWjk/1Bbtb/gEs1Vhahs2vVbF1NkMwyfZQsU0vLpnis9iE0mT
CalEEXNb4nK1hKRWN0yKFfSv9kLwVIt7pQxgkR5FZiNvyKOUovLteLM2YTEXMrV6VVxJkACnRxlc
sAyFy1heCR2jrxmDznpT7aXJZnHXH9RIBwM7qvjf2ulR+/RrKjFYiYmt8mBPzfLR6zRiF5emkDGO
5lRJkDqGw3j13YE395zwyJNQuyJT2SlXXeOxpgelBQ8QPOrPJyRsHcWLDlaNWiH+/HjLxLeugOrG
JE0bjnu1lr5avfoo9nZnY2wjw+j6V+rnTJWThs39KDVMoT2y7ptjeORL+RxeIcKZghbB7U/ocWL0
8g1IKHMA8aJWduhk2bGob1v1J3rI6Cc47mOeHHbmqTFYeTMkvIb0gLbPy0JY5lTuoaILzCJhUKhs
0/TcYI2RxnNiLGRO6J722YQkYv3Mm2RTJ4q+Grn+ftxEOaH4lXLpiE8Qbce0w/YC/Gc1859J7eVa
kP5vBjaUObH8L9EUXZTtfvifrx8DSEW7zyz98mYRON98VZfLSvwDRn8Rf/Tsyz30d8yQTSSRFHoh
pxO2x8vQ3MoQG2t5rh26/rHUsiYPSU65hiAg43JRyh83jOZva7HQd68YqTjWPIzPR5ajdIXOvuD8
Jxu+2EysdzjdJhYTWdbOBSP2l9ug9yxtz2R9hxKWYwNMVxY/QWUxabDLZzZmvrdnSyNVnzicr3qx
4ojsAnQ6DOKqwt8K5Z9AvClr/Y2RIgVPAPVTQBXh+PAdWP200AIEvr9U/OJ0rmN8IZxatx0+SbcY
65JAyL8gJsktjFTDvlxuGHOj62iNySz8xOURU2Kuql7ZOwBhnDMlvKxbcLIo3w0or01YWrpWnraG
KYCcy0mF8fDz4uMM7ITiuawR7HOJKHZw7z8rCVRWu6ahrAgsrTe9gDbNt1KmGyDk9Y7fey4payB4
rupGp64TCOYDLSaLRdFC3DLYfNNCSt4gvGNiEHZxkmg1TdvhrlRdQ8dbq/9nZgGmCFfck0400Y9W
2CnvDJjCVYbQoGPHQKGGT8EhO7Q9cLbN7FvncgX03OhmBqE1xum9tbsXuhcNHrdd1fa+8GGpsETZ
WAkgwVJ5rKf77wWQ8g3thmgY3MRJ2zZyid2d4O6a1SL2kJjJUd9OAkI+12qoTuKxcR8wTDiXLNwP
kczhSJIwcd0r5B3O4ghFn5zeuRRPVoHx8kgvTIt5BnMlkAFtVOELQ9IF9RuEphXIA8LkQOmaqCyT
IhT5DMTuzC5Xws9g7fQcKSIq9V/hNVCHo6abTnKEQplUocfmLTRdNPI075SWzvJPj3vaB52o6F3z
qxpkJoAJvjT4M5G9YSvJMIU+sc/0QvGwJ0gXMN8iORBKURU2RwGAIdcWNwCpnr5VFlhzyjA8bcNU
KNzARZ2RqWHrcC1k0qjjTR0I5PeD05167KHeopa/6I0KQEM9OP8M4IGAH88rhyx9N0sG1mr5vALZ
GmxIU5rG5AMhH5htpZyOLUKHVOBFReJWeisB/+cS2jpztvs6ZlNPYkRaVh+b/EOJOAeU9lSq/UC4
c5bw3zDwvCln7ZZmL5jNDICvSwRSohXhOFZOdM4whRta3aThgdLB7q5MDv0+gIH9FsZ+JGRB2UrU
X0jCPy88jUfqVTgN4Iw9pbKI+W+n6QsdQv+g7AgsnQ44FX+LYWYuiFEpdMIOszImdm9mhLVnTWPt
k2ktZyKNdXI29nSmGbcQYvLs7uMX9OySgjE7+IHhQCU1B5Rt8VrNS1cvQaMyO94uSbz0nc9sdtY0
7XIMzTuNvljGnSoLXYFsnOYaq0Kbon9eS8jHigi/nQNSY6jzVHxlb1DJeCwERlUA2bGrgr5PUdZb
xRjsT52FUNliPyXyzRsc/7zqi6YJpOUcHQqE5K7y7LT7bOIajiQ1wXxr0VpO5mmhHFrBEEO0zzL4
VsV/e4PZZGTut/4RduR0s3f86n8b931msU1VU4CPYoelbFqCx/98BCOdzlvfitAhn5F6RGUrx52V
aNKz5TiuhpgayK0pJeJZGxl45JEuCsV7JJoQmctzvy92vQs5LV21COEnGlFmrXbgV86fKc7LqzxC
ijuOMZKp+2gFFcX7SGOPJQK3KZFebGv2mNSL/6gzPJg74uQdEqLE96SMYVyIk+KnfFZKEyuIilLJ
cJN9NjMj99OoC6xk5QqvrcgESlMKOL0U7Q5v5yYpzlRdWMLRlufjkw2V5X3vetBkYMqx1Wc4Nn8E
Zv237r73USm2kx654gIyQhJPd3x/t/A5BvKGJEY9BkN9ZTWgeM/GmCTiuPjET4w/FY4Q59cRLOri
u/MYiu5fenDF8u5dn4beBlc657GfNX+OsmSZRy49opMX6rVloXCM/CRnbX8T2h+bbT13IZA5g2hz
+0DUyi9BoPUR0w4tY14A23fcke0TRcUAOtO4YB92BiJAdPB7A42PhMcTtTORCa8KHyqfaYlmU3/R
JMNca+S78GrYjPafRfT5Wt88FF9yFJI+3bbx/3dCLkO0LgI07rS4PN5yildPUl5n2TtM1apDQjdV
50Q1uDz+c5B0Up7kAnSsrMYY7oMdLcerc36N6UB1pI9JvBYa9U4Rjf2TNFdrJFD0vpzrMBdgZhAt
Nlmv9sx1KD14PZshi+bG56dwPPX378dI2dH79z3Skxu5bLnxch7gImCleAefzWfHkFgCjfIbbfUd
xnMWLMMWsQ7sTqDoeqeXFcfpvFFWwPFU22RX6jy5iKqKQbHlVHDSijadO8MIwTbz9fFATbYHwtg9
coYTBsXjcJK87PRFwyhDvgloWgQTTqCXoX3b0BiKLTgdZKPYcUVYTh7OrjX8NIB/Tm82JhlZZ0Cd
VAnLOLpRxdCtyd+NKK4o8jo23ykzZrt1aQKFadecIT1kJ+kemRBxJ27BVBDgC4Y7VTCXddb15oCZ
uJokGJ4uahQT/ZFW/uOajcgsmS2EBkwID6OKx2LkPefxljt7RuwK1Zf8HfIFz7FiDdENYBntvLNt
kd1Hvr7O/p9aAoTU0kwI2IcEuoK73kodH2rKs39cm94OuoJ2M7B7HjDQd+gvz+9jLEnoYkIDWTPB
anWOjzZ1KA+qaOBvp3c07IOZVqEMPq3HZxhPbVf6ClvR/NWfZEsdYoZrs73YDWya4llk7RnE3Hpb
UBt5QLZeM129sSEtK4WN9s2zYIJm4pY0tAKVWyJ6+f88atnyWIAJtLBtVDNHGj4PluoPTXzoFH+p
VeFat2/iAW8zkolRixIist7y2aPMObtz+6yq3qltlpev9GaVXrAm0bv+HOEEGbRmDMJbsAahlmcd
sYSVMi9bZeEiRxAdHVGVFxPjOmFHpHZJuH82UfIrOgQomtxR6jhCW8IWFKoA7zhbdI73ScmGpsDE
cN1tJYJQ4TbrR9/SPCCsi1fXFLNl4/sPXMOLwGU78GdiNr6cM7YF7golLXAteb5pg60lEAcIvLLf
MhG7STLr2U/RnprnRWYly++DkvgejJXO4f1oydRbNwZybZ5E0x4lNF79WaLwty4+9DU6wQmML1Sf
0Q4vmmzYEP5wwVkUxqag5nPM8l0Fk3sQgk/6iwxxzIjvRZuVBgS5rhlj5mHqimZWzkjrFnt7OwLy
zB3rv+3laoRXAlVioGa6uFUARtcRRcljRpi62Cwi7QTVmkaRsVka6xSu7DMoPMag0sWgrfRMxJ+J
GVCsgwf8QvvVpOCBN05CGMQK2TOHWJJ3eWLAyxfffzspp7a3v+mIVtRfJBXzyPcQXwSC5Vd2LiDh
Qx0sqmhjbhEtnNDJT+MzCUT452zkEqV/GNtZlTYPVJICQwO2Cg4CrZiH0Zj2meqtCTcAxSmJ7+V8
lAp3VHGIQidQKGWaGRRlH4A0T1JnTf+C1Sv37dJQuZWaGGB023FtFRB3LfscrMWu1DoVsjOKeN05
M8Bv8Rc8RV00YhyLW7AqXTTDkH33QgLy1wf4q9Ch8M25m5nkdrzEbNQD6m3Ww7bvd20pte9cgryg
x+jpHBrXr4TMNl1mbXnbcrxsFEM0TKhDOxxKqqGY67gj2KadJFZmeqKnO5HWpFpgZtsWBCe3mn/j
DMEuheL15KKqc2pn06hpJGXszMG/fV2zzl9ZrTLwLMO8AAXTVLJuOMcCiq275ZaigEk0DEVUsxe0
famdvIusTm09xYeSufjyxIGbkrSBhsn/xo/D99Su31Zd5PW4TUV5tjQn+X1KI8vfukrDIPd8ni23
oqf5rK5O7eNxhGpOYTaBjNKaD1Mp5ciDdsqVI1cd3Mi3RS9gg54I9Dbdt/32BjBNo3HQxLX/N1Kp
fQwq/0iSbSNZB4WRc+sPu3uYRCpb5L5qRL4KL/P27qHqjSGQ48bYHdz//yOTZNdEVblN51/SwpNd
Ow/gDysdW1X8DJsVPuhjEQLjmiJ+Dq+rS02mi6YxTg3nn+S98+tw8sTK9Ut1yzv2WSO+gcwrc0dX
6dv2luWnLTOUbbZXewolcxoLV5ZutqEGaosv/Y8zOtr2FraieC3S7lEhuC6rwmBT1X2n0yw6BKO8
snAmcp2Nw8yxSJE2Y/+Izmhvu0yQydbuARDGRPKi2GVF96IUE7IgcWLoiNPVJktjaKFCpL6Fh9qb
8ODF1eOcNPgogDlCCS26uvRZlLdeKb8wtcu9mIKgooWGZK6dNtS8YQljTkrFVrkTV76G+E7jXEXs
QIRZC1oW1ow9pBXLsnmm9n1/DU9zlaM/5EiwqmJa79HxhLRlT/5mdT/4xP/s9i4fF+BMgSLhhUv1
+oYZnNFaes4jYVbHhnWYBqj0MIQsdsqC+/nkS/Ni/U047KajHZMynVpF8qkvSyE39dDT7aiQi2IB
7kL21GYbeNXmbWX1q5/h4ZOYImemIkt2xFkMHsZGCVhOtASEXMcChTXhQK6dcZvbSvbK+F0CHeVT
+ROST+UVU3LZcgXuxZuFapxp9/Mv1Vgtvs4y4X+3bDfVyvb9Dchpvd06c1hf/Pxzjkd8dulvCGGT
mrx9mLEe4/9NQro7eCruQbs56LrqVhhWfTaaB4feupVSveVzfl6gRE1SRDlH0T1uFyryGMNocImc
lA1FETc0HOWZgqdXOC0+FKNN4JHUJIPHNzW6Tu1Pj8iKSR5+NMJNblmJzwsfJ1cZem6rQ8NP/ALp
n2As3yBxHmRke6JX8G2E+/VKMmwNrb/IieSuDEctsh9AYe17V5nyYq1KityqgI4CdgV0WwqC2O3+
uJreNwcS/rtMgR8iBQQNbZ4Y+MXBOnFlytQTGvjIu2vnMbDYnBfFvNdPoT5YXz2Hfn8o5iy9IrNY
s0PLSJpWBPeUBV/MGIg5TNBwRLuOwYBrp2gUh6ml9rWHLl8Akk7T6Sn5p0yL4Pmo+fOdI+pESUm6
Ye4/5mrpXxb7KpfQi7w4aChERizxO5dLhxXtc1Oxf7UJ2MEzwSfF7v40AxBsoQt7ClCjTuBdLmXc
mvLxf0hk8ivoK6sWiNTfpZobMMC3wBGCAdgdpp3uuNfONUJgaVVZSyP4YkF+XNpCCmQMxWahJJ/n
3DJnCoPFadPUgV+jZfwn6bS7ZAZe3FdhJpOMkg+wWo0UlWrsZXu1XsEeOToxMgPhKFiVr//1sXuN
gP7uiK8OqkVCavWentfsVcs1zs4uve4Ui14pEEYOASPpn7I3th6zVrQ0Sbxojv8iL0cwtV1ajpVk
2PqFlwjV6kk3kTf7cpyDtZ0oKd3Enf7O26v8nTJ13HdIH0XciPbxS+ztaNTKdvDIjsoi8NVO5BKv
JJdxzfxv0OnAvZj7CuVjRj5NJh0Jt4pjEoZg7fw6Th3pkavOwibOJ4V7eKEFzrGVBV+qz02HS6Ji
BNbdevprsqpNyCnHigyIQ58iS05H+VfVnhjL6VT2Nl8xEVC4o1rOqF2JP9LpfXq0KfPpptKVoopw
qtZ8cM6ktxWX4hK2ThujHv5Ox4k9BkMc3xjcsf2WiFygcqn9xPRIXEYgsFAggrEZPgZ4ivFUDeYu
0apch0Xz+/WL0qIKajO2Qik4rxhHmj5Rtr8QmX7umPrBec9ZQzCryeLJwOMDM83wrm/RYwHTEdpK
ChfFulznISZCRCu79Q3skBEJ9/W/g29TuvykEUDdZIuH5FUlLRBnjMrOWimvR0NU1+tHoV+dXlPB
8dsbqsQOzVALXecrz1WlR2UMQ/p+TKXu4rugYKn2N1QBSD2yOCpMD4+0qATozHkwmmBTcNaYJPaY
qNTlzQ5UCBB/qz6JEGjikRuIXZ0j08ntP2MwJwhdU6o5qPGvmMFWLrLWyRb/ax8lK3KhA2Y4fjqZ
kuGDOREJLVAfCd9lLI6ZFkJgPdiR3gpx/KkeWzC6iOq10j+0z7wOVmZODLdqMywrgBzdi+BoK+rn
nZieiMEbKM3j73/3flH3PuQfoffw403bBaotrKal0h3O2wuZt+Tpomo1s9aB2pkaLsvrCMoRx9c6
SwBFPnBDBz9MgTub3u5bSP04Gi5zfYnPR5NYNhlcY8ldGklLEVMrbUt7PucU62X7v60UdkyyPAH7
KacT/G354MHRMvAcGwIN0WHpfx90nURYH3nfjWIsHxy2lCcaC27rX8Aca1As+TCFIvJi3DHeqRaU
glJ0JHrrWa7NqgPNZmlEI17sX0qUt86FkLUCmtVyBDgCyiucLBz+LMbrPbFTtNX9IyCA9Q5FlCBm
LyVO8+GsxWskZOfnsnj3jcCvR+ESsgxcRproGZz2Uv4nljafHLsynhpAtUNkuw3n2Gn1W8UJ/Oak
8c5A3WZ5xRZN1wwomuCU3I6Q4mT0wXimQ+meK9PgJNGEeRGXxjpI6zhbYCWqanZc96jYwZWoyUkl
Da3GnSiJre79xBVdqdPba8Jt4jkmqg0kmIy6vNtvsJ+Xkuis1h2LvraR1MOGYQ1IWxcnI/+M0MI1
70Vktb9QozaMKM4MgZMMfND0eTioJRV+OQzS0kixieCGRZoe5UFOaMCwroyT4kscZjBI46ehYUH/
YlY16P61wGpS+V+fG6HM+3a7oPX/IJs9KT2tgoaZSfAB/ZASzdint4rT2vJEi9Wfe3SIJSng2SEK
syBiaqiSVNLPwZ29EIZe+OESVCf7NENADcyF19D7BgagY1fJWcR/bUI44p6K5lO7rw2OdtBhQQPD
mdfrQN1hra/RkbhrpLExwcUePcg+rzsxOEuYU9EWiXaghMZyaV2DeB4aJ6H6SPlNE8kZfdy0mwmq
Kut4Uhpo2gJOZV+6AeWuy80bsraHwS8kUDAAkbBfpxabti76KDo2+h7migFCXTAORwTVfG2upZ0D
D1YN/sWpUSDxfrEMZirbv8b+CalxWS6qMylcEvxolv5F0dY0rpIcsKoxkEMKoI/ieih6JT5akC2X
XAF2eSJJkpvmpk/o0c/+mfpxUoJJiy8sXdgy4YZPIrtt3PgG/Euwmau3xkw4yShfpZ3/k7TeGgcO
joUY/wUlwZzU0PzMWdJ0PmT3kQXdGq2h1q96iqquViNrTTLFK25smZdRoI0jjXAJu+aqJKoZCEgH
0+oRt4TIq6JTOY6DUUu90VJS5KKraN2mCqt/9gSgnct+AglCgWdPmR4rSqdrxeFrJ9atecEedo5f
j+OC9apcNlm1ClMzgzzXaYEi4xMuX/2yyy38EmRmA4uk7WfbCNPAUDCws7VwSfUN0zrGp3AHzrrl
1IY8+G96U2Rc7lCHwQquNqYAgYRrXyFqp3tpME32AZQRNtSs1cc1g9IcTb9PKyGI6i2c4wI4hskr
RQvsKM25ZXW4ZM4mYqNHA6K2jyr19YvSWaBBU71APH8I6FLVpfSnzidc4dSYEcrXgMnVNenAc1K/
HZV6p2RIrDjk+GYEmW1n08h0Ju1ncFEoswnWfiIYMKKscssYcNC0KRZ4iTP6bFHOLlnq+5cbtn8k
YclVie+E7ndGoOFmdbkcrKZYrpb3ZkvG9wE68O/xbXtyJy5/DRQ3vHwRGmbAS8OFobJVjqXgS9Fo
uJQb2e7z/ErYjszVDkO/KvQcThjHBcMyu9wmU3cdMf4pIDZXp8NlvOrhAXFymJvvhSPdbb0iXAt6
Lch7Cer64u2izkDcD011OjyjQZO86H9Y9A+4vBlhzI7p9e3Q9Dq3ut2kJv+lxmYrlLfkXPWnsKsN
rEKu3lNPhLzUF8ORrXk6Tjy6U1HpJgp0UL7ct0xXRgDWlDxhVs0Z8398Lp6TpyMdwyh0Bk2J1DgJ
K+uWeD9vU4LUlJAPEdnTGcKs2Hzy4fRsNYomy4qrsrzpNodhGhXWCj4h2RVFWoROHG1BkDngsUx/
lnA4XmD0Eo9FScd40Utvdr5rB4i5jDyhNtgVCWf/q2T/O/lVgEfrX26A0nR6uNQOwDSEl5u8nvHY
xJ5KkcT4c8XKzH2Itm+AkFJzhV4MZq+Qwga+AwPYgXmKmynczdLCPPVArmOfd4ivneioZqy5zISr
SRnpOhyXjfunqnPBzxNmqb6PmWXc1H1a5GQhhygRkhf7Lfa0h+FQYaI7KhIJ60wPvJZqdEZa9es1
ZG7n1UPRtRKdHWrG3oZpwTp0OUOBLegj8LX4eZL5/bOzSM/m45Zh6JI6cLKd/4UO8M9qBDqPd6cq
3RdCAzJpEurnAYqBcrbQr8E/nxdKsC5Li1+orIOt1FtlNTr1Os8sa6tPgkiBTQI7uhysnKNVF4Cg
NPZ+UhNhMZ6d2pLhfQ1UxrRn4iM4grxsrFBOHwcesBVpJhflIr0t5DYXzu462waVw9GGQJSbseTw
H4JmmJHFiYjCifnV7hpxpefQh/WqICT4cz1uplVE4c3+HtcPV1C7RqJIhdDWBbGXp67IUeljHAuA
aOobFW0aUHXF9ocwdf6INMhraabmlE/zrOa5/qAIdciXYMH8V4zpdCeHPXxmWeF42Q3C408mgR4F
tYoqiDvpnGZIYf67K7jkTjxf1/8jtxuspkwIO8s8pIcCppz0iTWyc1uhHjufPH+YjmECGZqQT8od
NgGPoJOGgew54Gjv5b0hS5oeH2gx0RamyKpkjJTXaKYUavXkM33qmSIzujrtBT8L1x4wcrkju7JJ
lijuxDITuaPcJ942WqzT9DR6Tt7xPTrWOFx4xswC7r7J4GKQefMW+1gYsYVGoczATPuwx5z46hPU
Mb1pxNTFJ7hIPVGqZgsI0ntvGkvn/89mvUQSCboBNmR+cyUThu9t/TQ6TgUE2sJuTrlcDtXuXYxs
eurFhhPanrvbiMm6SVZQ1No/a5tDO7Z3R+oKzgoscGM+igAEL2WyPpCwOoiGXuA3YN4P9c/HGkzv
zZIG4aC0uhr/nocnra11sl7vqt9TMLSv1ZLefGDxpxOhItJjscT0tvZce5LbdnHHMrNIu2WApk5y
dFRdfKs8uhlYdbKgjSiatlLBiPb27IKITcZIJgPJ8TADId2aQxCs+5HzXPFRX/nutTK+s9UwLXaX
CsHcEkJ3JB7Nt79DXcEeMzeZyxjmuLax56dUfc5WL0fjK64FamFNq+4oki0v4lS0RFzdvCV3NULW
iysAbRd1N4+aIPw79lRlEDqjTwsAM1e77ZFIVo0H/vFPUC0FnfdZFVgo2jnfv5h71EyeLYeTQKDR
frKdtUjZ91uMNUVqJLooolFVCnVh8zNtf7+iAZ+EipvFIGYfhStr4pm5KbwntihNzuJ6+ILND/n9
ya0eoVBIvspnUt9ilHb0mm0F/pADqZmw4Rd1T8zi66+gvrQy31DtizDwqu9QrsCZ9yFo5WXdSjEI
TG71rM7hSxb+74p92dZ46ffwOMGpsfaSyjZDS8qlMXnQbSenKymGCDrfbcDcVQsmLaYbcYT3lq+/
/3HLCLeUqKiCRKoQ9+V5+JSooRhur8JpXUsjzPki2l5L9Z9VQjB14aO/Ze9AlFnCqQcW1eIu+9d9
cArtYWcr6ZMwWE3GDiCzGAzGib+FG6zujIPqnoAJr+VADtH4v1d8qwMD6hfA7oqaOSBv1fsDICLM
EWXbLzKALXHFpSa1SzLSRN8DbCwYiiqkzKezuVeTpuXvVG7VAENlDLWaEMeiMUIIFCcQYDD/+ARp
zFC+N2IxqKvxBmt9wpGJ7Q5VqIAJMe4FOltPPb/e/QHqwSoFJmhWqO5uwj5hWdH7mL6oHSbd1N1z
gzPoII467X9sZqOmn7e9ywrWnPeTD1Ch5r489NsUEnR5AVG5Mv79tvcnaZ1U9qhZL65XKndn0kj+
CiEmZE5CSls1deWSqzRNByCaLSuN+oC73SI8ZjmOBM+IGyraVk2bkFEonKV56sh1pSs58BB2Nf6c
BrpLliMm/VTDo4EXhSbhg9908d0tN2UD1kmZOxIAS0VQMYiWiOLihI2l5fTETP2MfKrHLsSvgVDW
Ug3STHw93psCDX8GGsszVJ9mclKfvAabbvmc9NN/Fw6EjtUJscq2fYU05tuj5XhoOpgj7kxgGH6M
XRoSTj2Dwyp+wsn1S9Uq7PWxrSDkMLngBGR7cgBf7K6sagcMaY5dJqj4bBcLLC8IF7ulqoMHg8FX
vOs7StdDKxbZK9se3LLeaoUmFdT/HQpbJkubeVNdOGnJplMlPNoGTJgA3b+GbFdRKVT+dIjFWUzY
9iWRdeSNym2bZj9VhBCwESe/QVAvqkjl1GJExDL959daKy8RYVlPIegIHp5vjGSA+UBcIHz5cQV8
9vJPLNtgFP1InoqTW7sF0dXkgtlMnaFVhZLPuQDJbFSGvfx1V8vaBWPamSHZ8U7nFAwBJ7sw/1hO
WaN0uonwjGJiD30NLk8iC5SOjmGLzDntKxGXdsWl3yXbenCowo0uIGwrmtsfW86v6iYCYiCIhwdl
XjzvUnVGpkbqTivUhNCUOz/6rfmBS/i/Ar8OGd4DP/6bTfebRWVnvNoSXR73GLMi94B9dlS8/sMw
YS0PihIvNJkfOgtuogK5acfkLuJcIuy08oGVDGnj/ZWkNHn+keusnWvdHGygjTv9TmFoNZArfSAB
D+YcHriqrQYNdugMCkq4eaQvUyd587tx3nwTNlZtfgSw7CFbzoSvrShJR97mu4vfCorRIZmqtDCj
8Yr8dGrRiGH2yNVrkDY/qAtB9AiUDD4rMZBtZ51UAecikwEoFRqjqZ50YMvNyv4g1rpZF0yjKFIh
rVo72LLsX51Awg++zfbk2PPdtS4KT14i7UVPjhjwjrw1NGujgnmdC1OroHALo374WH0PDUiF3nA9
4NhCQqkC/VUbah+tRDJoPV2ny4lXeKdtYgnfr1uwOSlO3ytFmg8Kh/GkdoaUruF0mRqmN9lZsYHw
HGvk7sAyOZ34/8NALQEBCUw/PlvmZenUIQP1vaVWWpqDtmwR3cIDMZJVP7Zf7cilXmcvu49dAnLq
nNSmAO92AMK+VHeZBLifwXbZNTJ0zUiYyHhoegzbzWiTMqTsAQ186cGezaFJTpbTWnMO3ZknDURA
teqx4ScJjybBw2kdNla50FxoH/SQPgwxW8T5tDrOJDT1v5p3JotZyK9cxWuXvKtYqbtIIrlIMXBh
jtpr5KY+yNxk1qHfQs5OAfRvFC29zfx4pDSp0uPkjOqb3QHnUyyqpfILg8nYq7bLyIwQx5vdDnfL
2J73a9NfoQJ7STNKKTIgEFl59Dab2xD8NwEe3TNA5SMed903fecvHNSfzoGOvqBLcppGJYHMrtLb
IEBfJUiLr4zo6cYgGBokIy/qUbIPjeezzIVl4IlHwnRjdejC8w57SYJKf2CbAuSr9GsyJokrYII2
ByqwR4rX6Bu+r1UFwpuTekl50okcnO1PfJ81GiuewKfSFihsZy30IsSRzGbOqe8phG7Nh6amITfk
Cg+2tWCbCzC6uDQj1fzrfyGWJT11N/pyTrlRKoPsiYceGfIt0xXtt0m63ms6B6uqvHr589uwbub+
cMR2Es9z5kES6Ak40urtCsvqXyRU7iRFo7ZVwry/zi36Rs6GyCAExPRrhKfHPbn3CMOjklpTCHtM
jA2CC7v4sBstXkhnB5rGrqknmpczJ/BHVcduP1m3hn63D8gwIZBDT/BEwB8TRiTSnruE423Brvb6
e3W67Q5QWk2cmy62u9zTe4UawtU2/n0uT5+JSTvlJieThlIwUMH2HzNvKkgdpa4cRVVw3SsPn9OQ
FyLYnCCA9EzOic2N4QCdkjHw/C+usR1JVQDUpnS6YwD/yRycqF2vAyEbMvwaI6gzJm1lbIl6KJXZ
YW+En8PXGeoO6o6jI+hhLhMYtf633eaF6cK9DBX6tcYr38RJvC0+GGqABqmUZ1XFvbZwcWs18oVj
W9UV087ERErvMZk7sPtZvinN82eNiRkM7GtHJm+bHSiQPVyfvuuD8C+W5FirLEOMFAnYxV6NEHn7
79D5rgUzXN0oeJ4+7RDx8lHk7se5AxBnxEyrxiIDacORzahuLnUcuIZeI5W7ms57GCX5e5Sum/VZ
sWBfn4pAU7DzXm1s4hoQF/t3P+VU7pkkSSpjPr4Mw67ZFe9Od56miN5BhlZbaUq2aolp02851cTW
JUcj6DvnRBmyaVdfVlAL2Y20LsvkoNoSNHEefrhOIY6x+3Hk9FE0A94UPoey9ihEoKa6geY60V3g
eXWTOcRLwMMieX45qtmBqxZ0SQdWSKSExPIxzhOQTNSwqHp4r2usAZy+agXTR7bHdQOClNi6HoRm
yI8WH4A7+aHVeEMD6YbL2CCmU79CTuTSsIJvSiFy6PEODILycTpj6pHsmGSxEYsMl1Yc+RreHPsn
GV3VFIoCITHeavuTwUJrj36pPgTJSqZr8EJNyNAYqI3UqJyvmEm6T1HOEMhrEeY8uAK1N2GDRbME
ozKQ5s16mlCHI4zbTnehpinnQFicOkNylna2oDPBer7Xw2L0lUrAUUXvdRgqAScLON+uWKrvwOI0
Lfzv7kf2B0sM5L3i2auGiDDEFv+5NOxkrjuWR2yYh9+zkO+0ftIu0z1dHPn8UiJyiX9F1EBdHJpC
GsjU60ld33nrR0Aq8A/hz/rBH+uxNhByTeb5dXfa3bdpygT55xDKzgDz/y4qwOIJzJidl7hXphYk
vjZ2VLhDX876qma3HRpeuYioCEgvJUtgzGZj7DPKMpPwBS2eAcCo5ly8baZY08Md1TwpeLdu6LrG
Cq+x2WQGcaHq4GJB1tCq/Yq9uBE20cBVbtOIlK6P1C5NUhiNO4Q+vPySA9WZ9+RsVOEUy8M8QwkX
24c3OpIZoFLLuIStXyePPUWck3yNuDm5Bwq5mU+q7S/+fSGAZeC2bdAn3jO/LWzDigzYeP36rw4z
a8Zj7YaUn3iRBPDINxQdE3ompx6fAYSbEkCmcuKERk/hT4LJkHtOrX+0DPxEPiHR7fscIJNAkpiO
PXkAkeBjgxsYIfd/9L0CnW7KF9BAdEJXL22SbF817nqbdfxxEYIg64I5R8LhiaR37tjJ5BJqegCL
/p1bzZrz4E21xgNcTMQwCER+hPA4ak8/cksNSE2mf2DfIeen3YmNQd59JRyFWpWWpBDz+/a8iCtk
7PCHa78rrbYMaDHURZws96AY+bXzFb9KmeCyf+PFlgzwEf7ZecN/xpjbWofUtixt0LhvpUfVxQ+5
vVloOqbr74jBrg7533jqcKs+EkCNIetuWLKAEI6P3JObJzn7Hg5cwvD+O/cjZcpb3dSfKODzhxvT
X2UHEIUOwc/YoGG7jpIq5EKmi+zvOFdYlkuAifDLAhqf/5Aj1TOZSQI3RmHA91g79cHLTl5BPC90
ei1I1W3JBQGP0j8qVOcpBnMU5rmeuooQNCaQEc1vXZjgBts9D1vk0W52HNs0cMCtDUtZPypwvrJW
b6gJWTxcMO7EaRETi/9rki6OlRTnJTdM9Gxp4uYEQ9bXYDsOTxIHHtWcsB9TZYNYBXrlfPRYXZW9
xo5eaSIccCK1MSnNi/LDH+E752pkGh9nSC74FkeCdA30Z0ESYFd6fjueby4JhjdnuCy9VjepQR2f
g0lv72+JcqA9CjUkVGH0YFljbctjTKoIOQP3L50mqt2l+XU5oU05/npGzsFYTH5m6xjeSYYJ3UnL
ajAN6NZL7eW931Q/mWhbkF3fPGQnsnSr8gzHQrfJ8+DQ6UA9QEpYx7eEmUS0qKj0ENynCKiOrcvW
SmqPFXzumvXAlR63i9nXCT+k4ipNmtN3LhSEeBO/a3AVG+i/DN9c6ajcHM0RKwl8F3TbtDGO3pT0
znJg16/J8pedXQCos6zqEIX/yfEeRcXuiiQ4tWz+4uKTsf2BP+GCLALSAJs5+zsGsyXdZATGEoq1
Pv5oKN9vzVlPk761tebJAP3nSZKLbHT4wJiMnhiztvVj+BofoqysjLU4Z6D0+VtZH2stKnICa6i/
EONoYYThHSBGpARhu6MxkGTP5A/wfsLawGMHrFTfZTbFU5mL73JbigGjG857ubAjhDqHc9+e9Obn
yIwg5T+z8LsHxZdt9L7pXBbb/GxkAsyzdcg5jvaruy82kl210I0l50AliaHWUdytNQ4IodmP9ccy
0CEb/37OZLZfmE+XPBJ7D3ZD68QK2CKkYUIQAyAu0TDgc95egTb6NzOBYYZ9znaWCSHiA5hAAQw/
Hloe0PNuPAGRW73Hhbfoeui0yJHPEcmM5xam4pbPCVEIESoMm/7+w2IT7cM+w+0oJHVO7SFyIT0e
B61RUYDPQOuV47wfBvlPCqyAaz9BRujD9wUGhm9DiDHLfNbiMU3I+o/t5LQtjdNYkd0LKe2b7KCW
tbbt8Xi0/5fp53yilIbg7RB/II7CH6GrLtt//xxxTkNIDOBTV4hrGbjb1gS02OuuUdM1qiLL88ok
2btaXdcbGIns3K9KVJVyI4DYRKp8CdOoJkQKQFvZ9I4Euq6OTXkaQnHsY2+vTkd7pyZuU7JynmV7
qqF6Bt4nNVaHJPSESWdIxzIYEZ4eYGJgBg8D6YA6JWS8WrCwD1Tgj5GfRwPUQY0eUGrcrSaEQggn
2SAzkO36G6OqRI/6xDOBQPQ9s+anHZmNO0kG5pxDhuR7meeF57twuP+CTbLOWXtPokan+6Qq+GPv
gSnYtLTUv3KazU2d45yK/1G0GORYlNzAzv94cSb/1meH5GaEi4O9KLlkqaM+M44sJS6LIvLJEv43
qPaUyCebI3j/9YCiZYBtiVo16AJ1H9vFyw10IK0dpLi/90iKNSBTf6bREWHiR0cTqoCjh2I7WCrj
HiKMxCipP3QhaewdbbOGe7XGx07S91qQWZDdRPYgXvIQHnImWj2hRsUrUaNGQgf0MXnAiH7VACsW
xntII5Zms0BCXXxA3FA2FTr0osiMNiOp24l7C6s3XdCGPT+G9jz+xfDFtmG6MzTCDZQXGxvO6pic
cf/jlRoP3MQr0aDvHKMqWEYy0suSCMfPwmbm0Vg8fKvhIg2uYgST+qS7zepudm/d4RO4NRApvL6r
9cI2mNWIYHDRfVB025uPIF+Q5vcc6tDoF2ScPxYyaiowAANvxZhKmpoxv/s36EdsNGnRPH0vjZgP
fLKJpgIqvh/WI0CM98Dgqqvu2mBYegg0BN1o0FqKlR/G0/Zju+lvbnTDXUU6VTuYrvzYZKNMDBWe
jdslbDk3XPlltkWtjcio4GQjoJHeOa6emTnpxfs7qlqG7dgHhm+lp5fQH613oOeoO9GbHeqVSloZ
40rybXGLW+T1egBTv93oPxed/lNA15E4pQ5R72bevg3qjH80JWNQkQ0ajnwyhvEPJ/xIa3orQwVP
c3PscLZCtjy1ArFe66QtJVDSa5nTVuFjHCABas5sYWruxgs4KwABv4BzPoyJnytYXs2hrPfC/4wE
Mj3ABljlbanE1IVfXxDXIRG0l3l4joKucJZWqe0VUsd6zOTaC5rx/ynN/hxTduJRfB9ld+qEAJvx
tT51dnV6XLO7pua8Pgub7PRtza934dP/37K+t7sQiEkUivAMOtURrJPZhqRuibiCh+vA6pJDjOTE
e4NkXUsOoxmZprMnEhU9jcqDv8k8nchaKY1s0WFh7Dm6KL18/uJxam8eQpyVYPTZiEUk8Yhmcb8z
wnwlYqHWjDQWGqtP4GvMIn4dRqo8dgAdQVO+g8YmKqauZN3yGKR+I432asv1MLx7o/XqYijmg8JL
bpc9cahtx7hXOXdyJzuKqkzXk2Q/e8W7KNrCz7icVtJS8sNecSDtEsIEMWBI+Mi/iASDyizUKLyq
sTnyJ4NjvOsUVWs6+QpI4Wkx0i0O6loO9nU8OtJVFgPC3daxjw5n2M2T/qoTzOmvp7GQp/Gq3HjP
huNZElc0HPg316cmLDKA0HJimz57Njm7EYMb8GFWJM86VZvyKQG35FrSw80GwvLJrbxWyvnCDOtx
TCUez14V/NCPPWgxzl7kFzR1VPDlieWh8SbjcLP0SQqTwp6dGIv9n9koj69ko8HEd4/sPfTwS8YQ
jgNsVV942b1Y0rjsj+4Ohp0wIcUZusr2lWWwQRScVd6goqf8aWLsuhjixcL98kANEr+/oPcorAQY
9bx0IK6sieytV8R1eHcBGRJdoTW5IQixB3yKzbC8aGhPHHImOzDKiJK4ClvZKX/j0VLZug3pnQNa
kfrpnthyUIb6IWvGTX4iGGYktdXkbpiYCtX4Q705h2sK4uua4SqnQb4Gi6K3Wq72jvDm27MrcIy1
1GvSe/Se5Kc/L+eWTjMzJSG6Gyc7Ax2jwOAGEar0xlH5furbuLSY9aWfBljXdKNZy4Ff5D42LDuB
4m0AFjkFeuAUj1SZzQks83p9mpk4acMDMhjGcuEuYxX8jif7HMaGu55XMIeP5jgm72yiPQm8d5Tv
fveOg4kiKotc0OxpOZUCqkJVVzsRAa/2ZPGPEXglwHfSCrOfcksbboZJwcHNAc+nUenE+OrMnNyK
ZswpSL5FlTUWxMmFu/eP5PfLUfcbY8W9DLbXOgxuVU7FUEwm4QUlovEVO8MdaK3ZOUSEQ93MWAsr
krhQUHqDJWWNsH/OXQR2G/3Siz/njQPgGUguU8kzPplqqgfvkmzu3YXroJz7vt2OS9ssev1xJ9JC
MWZM/66Zr1wVn5mzdBa4xwoUHWI7ogowqg4I+rueCvvxWQMWRZ8WnY1AnkcBBNgraj45bsX+W3Ek
MnTw6/OJW1mCtdonPYVmwIAdwk/JDd2TAeQukPAeOQxyxJnHOVxOl7c49vnTdD4JgQUzXaXGLS8P
4tUT5zW6y2epbOL8EUrztKGfq0BVofy5z6pBxFUqwUTDhMG9Q2MBQbYbfrBDJAULxzwRmyGo50JM
aWq/1EybSOXnPnMReBFQMlWkfybPnlS93GA0ssGSyeuD1nbYT97XA9GVuoXlQgmUpfh5NIwu3rSb
KXrWUoonbr6jYSybEeOfSIsjlGq3tJ3er1FzRG8SE7DiU4NxI55THSD47jCbGEhMnQ0otiSlWWm0
rtINAxNSO8rCK4Sn43PTYqvwO5mCzaSJQH1hkcHGVtGYfvttcSRv6VVJkoSvgijtkilXUpu6v9bN
XluMNMqQwIU6UqfkFdV9RV8i1YWY1+2D5MM3uZ1TpMP0EWtkGGmH3h309z7E5od5sL3DopNYplLG
XTnzmiw9YSMaLRVjQpvdX1uenNrOzdZY3JZL/1R1rwWAU+1eUIhq+tSbuvH7xVVFgcxP0G40fwfr
VLGjKCOpU8GgQKaAUOzF5cbair/t5K4ZFRrc/mNTC+UOLJ82UcWGHjwDp8WI48dIUEDs50zQ8Vjn
1qKCMcoEJRVWXqkAZouEP3m2mCtNQVXmyZYY8pZS5TSrDCvF8M1vpy7TXuUofvHHrAvDeinl6Jp2
G/6P0Uvj6Gc/WsrZLT24FcVzoY5DiJp87n0NBMWoLO56orBqyfVXlDqH83mWbzpERQ6dn2w/4fNp
lsHGYPhv7m47/ypshZv5xTUGE0xAF0VUj+a86sJoGoLPKW2QP39X9z0A4q38h/AZSG8JXr4So2xI
vIC6vAmRZsTpOBquyST/bKzoS1JX3y82dFXxA88do15ANBmz+EFNZ2jJnG0EmNyLC3foJmDhyDs3
GYSsx8eaNxqNNM939uGa5ljAI+kIHcOlMY8yn9CNaZv/RDqegC2EvFMo8Ah0i7uY03QxgEigZJWt
IyIknRF/JLbAcrwMz3RHXY2+E65hiayXVMDmvpundKNFopczG1Y5iaGbJ2kziYCoQyO60B6YmXaK
ZnsqMebXF+wrT0S01QTFm9YSO42iR4uwLMpyQJWU9sXXLNoxlyQiw5VywvOFJM3FsLkOEQZ7ccVa
cjaEKUw8UyIG5ySemER1yHyjpu2ECHBxcYo8EHavfAZlj3hBIrlGD9X89Y00X2mWpqJnnmjG5WSS
TQ+boZK7ENj5PSoPeVdQ2VgKu7mDGWq8rKjBn3sMAqdsU1G5B9aUhFzoiuK/rxM4Q9kvuv3v2c51
eQ6Ms6RQwAdOuZVD/NVbw139/P/hYF2IyaSH2oSdyylqHA2S/x6y03lpsxratW71wGuC5rJYKx5G
Iaov2gl93HcpMAPOAr8PWiw7LZJZHtV/QLyEwI21rXTJGBME57PZ33R9EPbQmeEQnuU5pWQi7ied
dY2CQ5U4DTLNJ2Qd78p56zO8VEMd51w4HPyPvCCvw3ZmELKHzBvVqV2ihX/Oufa3h/pzgBrSFUm6
i7inUZYtWKbErXkNdhxx/Xu9H8ErcTHiU1jGkSyi1x3sMQtFySTA24V8GlH+cF97mk4k70GiKEez
w41UDA0CQlPGCaw4x7sd/wUeGb5/6deIjGBwhlqbdP+GoweQvRpKCo6Omh37m0jdPBMSwpm7IVOo
OUOpaZxsuq5rYl0omHYI5SUrZmxGeR+SCUbyIhbxoL6bTcmzTE+JrtJYrhG4s0q1KCA6UIrInohc
OsLZuXOwbmAX7BPdka6TVSB2ORYr2xbEh+Dw2EK+fF7dQ/ySgraZyx1n25MCAsKBN7hulsdb04EV
1dYgpjcTFa8M3G2E7aVzUZ6poIpGGwH2sntRzYKQZUclXHRvUly5Xz5FWZJDqiN8Fz3BJ/alPckK
vWqPCIcXgW4FBHjfvOYvvxwVEyCdPRW1rvX8GU+/xD+/RYarc1zsy1OEaQ4bHMmSqM9dmd9Z+n2i
lgxFITrxW1JTaUCyhJ3zuYQKwcrFWLmtkmMAOO/VU+KkG+d5kEh0F3FqiPC/gdHUyDWWjYWrxAjA
9vru8BOfvxzuwnN0HXhx8EMuk7VgP1skJId3WCdRHsygNLp/RRAc9vF5Ucna7wo+QfDECrqnS046
rn+7kB11Dva5AaG+wYlGG3fz5FAVS2/fmv6Nwy3xaNac0rzRuL6Sd3Izc7rrhQ9t3CGOkNNfIPTI
b2LjE7QtoWYSUwb1JbTsGpXJirx0XADE32LHoFisTq8Q6LLtXvwrA3eCr20AgnoNXCDgVMfwYFIo
spfqCVXxf6Tj9glkjBfCEgxz1aCVcTfCGlAQrI8QccUik6nyEk71r8q6ctGpN/4R3cxtGas/krW2
9UYazUEpdzmltBgOHa6nm2o3AJT7qBLllaysZ+It9VvNdNG5FgFMfCmZRQlpWulUSY+zdT0UFV7j
YqFHpuhRprX+UA69GUQUX7e/opU/FMcJ8iOkkOvPkKiCaC3E/hajhHNh8v+gA9FaG30pFUMjvNA1
+tzWgKZRpJiSvqzSy7uPcvCktpDuhR6m+uBgJcw9pMGdamHSz0XqPop5sqdD37gXIADZ5iFziafK
4UbbSQM94sab/o+st8isgh/PjpuZ5teUhws1dKBwvz6TSlKuCyStLgjKk8iq9aWvqelt1TCV/hF4
1FNxs8Hx67Zam44redTgapuC8cP/Pl86KqrGxrO7nt46s/RDy0w7sFOQrUM5/enzlHbsTfw3zJdI
+bSQSrnf1ccgS4sRaNFe5Z5MH7cv+9h/6p3jHIAVipmxTWxYGYvbwvUFtKJ0vAG8ePwxD7/Mf1fl
YmxaPwRrQT0tR7HyygstFQlZGbUA+TrY7cnKPEg7kjN3+84/kQDfHMf1M0Fo42eGbIFKWdc8KZuS
5sS1akzdyDs4/7ZNv/Mtx5j0Cj/ddT9vIcvZHrce5PjKW2dCH3m2jZXWAqg8P/Ke1OVaQz4C2AsJ
JYXaX8sah0cw0SeBNyY34jxIDQeeREVB45AhUs5VCjPkzg35hrkzXwGCjVb10ocFn8ywOVwWAHAU
1JprU3+ohxjXdgYm7YxV2ky+ycrz+9LBGQPM/9v7pJgKU93vq9IhevjGpWutO20W6cJNCqMg/WOh
WDfOfs3zdmGbdeZmJ+rT7swU9n4skkpuOqzKchgyQc7DFWM37O1yvSJ880r781EUE9nccFEg4IPB
RusO3T/dCjrSc4C0TsAFKtRL0Xiy5eBOkq/SYU9L1LrWa23sid3jsehXlZuxGspCkI+OcdBGjmfo
YrBAGLsk9O68VKxlIHKDclFUVw7Qs+/jVHdwZC11Q8d7sCedlyCji3zXJkRzJUwp6a++5ifBZDZ7
TOGQc0cPnk/Pzf727/xtTvc+iZvP5MK73Oj06NFN1MGyBNA9wfrQrzFOBfS1OcRkHZcbsg9CpcLV
C/1XihFMNp38+9uS6jQq19gy/0pNRXvywei7m1ngeMnhNcBp/aQwhgwy3uokii+SaoCJ0yvToBZO
wFkohhjr9u05G7DGTVFVQpVtQlqOh5a2knFeijQYb92jPYutmUCmI5HmBLDDLZ4fWyUUSHZZl0nO
LGjacqLAuU6eJY2VVI2ueeEA3g5K2TCoWeRYbcjkPLCCmU38K5NWgukKr2Mj7z2r5Guasgaw+I75
bR84LV3S2j3TVxmUqkGaOsX6Edg8scQEo+ZN5NuHLCB0z/5t6agG3D1MvW4jhXaJ/Ml696X4gqLU
FL3UmjLR4JFkmnljcULL0WcMD+EwemP+L0VJnjcUv9OD2ZxIkfDN5pyRFBRAo+zbRMCH0KU+cD9N
cIX465FwTLQXAv/gZIdSqW4tm7aXNW9sqHAVdBpgOeA1WnLM9qRfazfjvNdCzPrQ9DrXFGtWIsPi
bOPIDl+envcVzdRmps3UxmQmu6TO6a7lhnD9fJAeFDU9l8v4GGO0cvRudErzvEDOQjtAHJQ2jdhz
BEYtEIiLivwjmrqET0mh0oTV4vDqHKERSrX0gAHs9PtWLEO80gOrliYuIqdpUbhLRT3Qp++UMU0j
IPjcBxPdwNvksIOr5dIvx1rkLdY4sYGyqZJyw5ywPsRaxhFZQDrQoYoIZD5FONmIqoaehELHvQAI
Tr6Gyg90yTBiYOGXn9ESQBbitQRttTjbWYHaILjjMLUz10TkOuoYRx2oOXAHjTgFo54X/j7jTgtX
CF+MaYneHgi2CIXimxWuMUoYpIoFz+unPmBq3jJ2/K/H4HAhvLfTx/8tD9jVmd5jqtCXhjwbmU32
//1sXpGjkhflc4ihNrKF9UUWGRY4WljLf78AwEy2Jcx2lWzkntFCvgo+w7KXrd1xqBcgdm1VTcyh
LOzMX2RQAuwtm13UMB4LkKOfdlNCvain960VUiP3X00gFtbAPmKtOEnmQdMlzPmOJLiILZtaaEAf
I7jJmmeZoz6n6BfJCwCbU3VGVZcOz+6X6ShmYmfwsnVIui7ZgK3YM+pQnjZfwRv9AMKLNmIv4MYl
XdMwGMzhYuFjR/aCh82+egJqf8gnznis8oM0xiOqHWrWPAR7u0HC273zEiabiMP7a7KJ+g5QFL6p
PQ5DvA1T6BcwOhmeaPniT5vUdVv/vdN11s9HUIKz8WXypQcyp4VKRvuNYuplG/iEQ53yQzi/8dUR
O5wn7ixlmIPMFimwVOiIcDFkxfLIg17uU58o+RiKRhau96p0c86ldQMAVHzmjExmw1Apen+nORx1
p/nZTbtVnGG1wtqhid9Ub4w9KhCpgttW8bUi/l+dfQCWBhY0ZgB8uIbIRtOSA+NHdxgHULlCRmPn
7Tz3p2bj7zZZ99qf4xYAJZvKC3XWzQUcTFOYt97vBYKMmeQIZCkumieYliSki33eOodI+OBgwGSJ
t4wcsZ/3OiFmnfBh9ieTIjk0BVkK23jss9cny2D2X3b5RJ2w02LA6mDZkPmfHBA8Af8ZhcxQcJO4
xl30Af9TmsEkKp+Kgr6vn98cAarQpZqaIgOfSaDQRaF0/n4h6TJ88OHro1dGHqTre/W71PCDzZgW
MlmY0hEk3Ki6MCUvtgYpoGBGDQb7hwGFjgZBfjZb5tbz3emzpj35uAEqO8e8MLnUsNqUjcGS4iTP
W9tY7MjAI0Kh0z02txmLXWkGnXZQ5Zd4L4ZLvmBkEfjIK8PF9iCoECqb8qAHQCYQH11lWEXzEE8i
8hdMV78VjY88UdX9BL2gsleZkZ8+7c/vOhW6PqxRuxPGYzo9vM5nw8NYDNjg6KMKUZ/GRA0+Sdxn
aDwjNaR/Oq7zpT/j+/2bIl0ZuqtRUMSNvbctGqfjnH6gfKs4aINeM0cGHUP+116dleGg7PQ51jZn
dPE59qC62PKLwblAYMq3Z/inRgLBuV8AFWohTuZfg3tQrCyC/ADTFI8g7sHuJWgtXjMwQhfcGcVx
YSYB6+qy+BGkEiZS5Aq5s8HpuNPGELWIUWmOUbwXhcCTzaJhK1tY+/zg+1Fc7DCHmowNnLdiSKR3
xnL1M0yDC48THM5R0gGNMybuf7vIlHdCq7kLrZz5ocr9PLVGcfjMFMkg57UdS+bh4bSfDzalHEBQ
gDI1r0BnJSat8ItCrWfpEGYkyBf9xjlQV73cYsEv+I/FLphKjOcOdSofNL4O6+fCongfTnCI/D++
q91LXuL69ZagApQ6ZahAqlOgQJxiHrvSbLi26sQaWJpiNOTFtGzme2cTA2ATBQdNLqdIjvf8E5wB
dLdW9zX6ZFiIYJO+9nglEf3QVKAG7ErU0yPOex9JWLBvW0W4vlRlNiYp4ykf/PoBO66LxpETbEE0
kfEmZjF9CrUaI3sLopcXj5Y2g6HSivKK6+O+0o5WLJY6bjT7Sefa+myBvKMWlMXkKdb6FFSjUdU/
zAQ99R6nNqJAlfXq1g6v4A3IdWyiRwCXDEHqWuF2gUK5/pjsl7Sh9HA0eTV5eAxuppYUDbz5ilq9
W9SGmlky61RtHN4Aw2h8+ePgH8lqlE4SQ6VIG7HrznUg89n2dMszJicFwZhaeB7OMLVKGO16NDdn
9flt+WfUUTq1PxaKt6ZSAdkjguaqRJ8gXX/XZX6Fg9abmzTal2Tvjp6BnDHJ30JUUM4R3Js6DL0E
Hwrx2yF6DjsmYsjDvkLU7S9Qm4KZm7q17yhSfqj5WLoHYL6eReEKytgH4vz/hfk+Nh2AYZ9CRWRr
Koahy0KJwlKx2dQ3dXh+BdVe3VV9f0eWoLY/yfsw32vnc2Ojt0b+yoILkLNGeMKJN3C31510f5Bz
XM39ApuYu15EidaIWSGbkSRLvpP/FBKZdJWZ2TpFLuKAXP79MDl5/wkWFBc2LADpYXOTs6DyuxZf
KpdiYGd05Obk3Xxxa84Pp9YOL7x/UAcshwgF+KYqYZG/SLo3yIcLkwiaFrvhksz+vJXA6lDZSyYm
mm68P0kheMnmN6NF94g7aovIl72rKwgqY+AJtmsVDQVlk0+N279BDp0sf6FzUyr4wuX8bvERnqJt
PnaAvqII6VkDlfbjWAIuw9vB5cuxvSsrrZaKHGVJICuAQzxo1cUqb5MLCKtmhHzsg+tufvTriK1k
I0horvNnHKe+1Td6ruJY9OU/LgXpl0///JfQ/TMwdmNtRxv2/1kVBrMEmmQ4SGi9ebMWGwBXXsbs
yLs0/zyl3szZ7Yl5Nu0kuIpRO4FTtAj1XIpWxpcV8ssfb/e0pQ3NvJ+0YCAAvlUyaQLgBSzypeBw
d6Eqa2fRZcyif39AccAyCnHRUfwVPnutH3edzpgAJl0fF6jKQCUSK3mcKoVq2W1hKoW8DGMQ0eIM
Kc1WHAuVCMzl30qIZpn1L1kEilmzjHJaE5o4dWB8jKlpcordZMJ5cSGlaBBnKu5mk6ONbV0noFTp
/N0x8MhM9Q/GSHEIITFMuAsVOncIAUYvlhCTmDNP1DGVkDxVEbuyxrRb7YPC7+xb4/NYHTZtvVHv
LI9jCYMNyKMebJiSwdieTndbS4SB+x0HayuhoDEg7QakScJ7892wF+9/9cD4x592EdQ+0RTbHyvK
7gyg6pB5wfZqzzMvaj8igQ3vdh81a6l8xisws/NH2ckzmGaS34w1HFVJn+gO0GrUHwHrryHlhOAq
YNrxfulxoqGeFOAjS+7mOvmGXsiV73kVf2i1+DBfV1Nlkz0nndYZGNGltbZhyu69SI3EBfRTxOU3
lsmO9qQLu49rcdVPBGxAb/3MkX89NBAYla7mU/LFnfNXZg3rSp5HmZsML/fQijQN7gyGseND/oG9
jPoSO72T+AT09YptunwnVUrFTHcUChPU+6Yn1xgrO+NbW/O4fMsjzww07W2XpoAjtzsp3+HAaokh
wtEm2y6eCnAPdGlEXQgjoRvT9tJ7qWObeFDHi0KljCwXtW4pPHGq5l1gFWqWY+kH+HSW7KbXVP9I
stSmOVw71TzNZUQs89HHjMcR+iL33rpOoKqYYCZTNbYDnSJwzbHvJGH5atAojPJikLJOB1KOPpEb
5dqQaC/1FjnO3YZ2Ai29263mRTSOAhK/8BndcVU8Gon0hL/xLRW/zTFhvEfUsEoYRllnFxy+ERK2
Sqn6yNkrvlWlUZ7lwyXU+dCUWBRmnJT49MhFKK37+wSY+804bUnOcLLy7ouGi+BRJAjNGclUDmP9
3yO7tSylm/Z8bnCU3tisqpf1ZiZlXcITnHOUaCO3V2oc4lcd93YhnMHGXw39We8MyI4qIWGBcnH6
L531VmOTy30/fMaOgcvi1BbLJa7DB12K9sbY0X9eN7MzA8Bkk0Nd5nuuKoqx4jsW+yQOq6IS5Xt4
pVAIIKNiX2b7aeh7Rzdo8ElcjuPc5OBqV37HUHj1QF2kS4VK8h2F1P8Dq+BUV1WPRySH2O3gajMe
uNH+1QyXSfrz8xHjkmaHwj1jc6a6HOGiE+5fXX6MT3/M1g5nACxJ5UGs/H7inADdPIEbpz0kkQK0
Hg02EF4YWQ1NSnbQptIrxfBQGKKUev+vlxwQE96hzjVFxhgwcZZUo7ckxg95GlapOZqTUDf1d5sA
rqxlC+dqGVdLEY6ExuUd3A0wIcRN28wzwa0U2ofD+bSsiVR55Bxlp0ij6T3466tM3t8Y91lm2hg3
gTLK3IECMVV+JniR+Cx33UGJYDCl2JWOa/udbPhaUTLDBeOv0F5YDFbxoaMTPV0JXCBIBPSJijwS
WKHunaGKKLNaCcqGNuV0foJYnpN/wSIcETZ6qev1/pMWV99GmOF8PTDAmSR2nUNS64AxgBpd+Tg5
zYtRaGarGBG/OTXkdmjjL7XRRUubu5OWudqpUTRglx2MsXcT/paTRrykKXP3yiyE1jRPalF4MWA1
x6CuRWKN9CBV8U1Ht6Dlw8s93wGoEnN1v6pdJ3r9GH1JaWiKfFeDbReXTFvQiRlGBXjlrJ1B9aNa
SNF1FT5ynli7pZfQvKwVyWQdEojBhPZ0kdJ49VVJP4Ld38CRQfJTzFK6ebIzP0X525dmNSWz99VI
nBtrxT7qRFT66ipv6F+XL7dN5tP4mAplvhCj2tYjrynbHLJt9MW9MrWXzBCGHPBI1J/ybQ6XT+E1
y8TuXfPiHy8IOWdfj7ra62pU8GJPqCM+Ry+wSZd0/J9TbPMHTXVj0fgGJ08HNBVcnfV8G5Gbv7k9
zUZ4JIhz+L4HKtOqG976srhXhT9qCVfEvySFNfn1zHGFe3SnF3+6KHbDFLVglLHuLfXHx+9O/zSJ
ySUYcy8DZf+ar92I32R7GYfea36RU0fO5H4S12o6A81KEluUDrnJw/MCUgqqhytpUkA9w/8ZFc+Q
shucB/6HjylOZKAIV+Cg4ESjsjYzI4FMnRTostBlSEYD4UsLLHQL/kmNW1Y7ngr/nVu3lQMfIeww
23w7WZizFjFP55x7rDQWREycHyOiN1TNQFumm1bdyfr7sUKiGdL3um5+gbPu0n5DmfVmNCGK8y7b
fpMTqGzvia1+tH2vQFCeYRA+ZliH/BxFfe29XVnYdaUM7XW/mVYWNsCf1D+HBK+65xlctGRTqfk3
WSXNzTDbEdRLzc34Fq1RyyzuHAyx43Pidga/bVm89lWXRC7o5mNbRgjynKkpunr077qdoEYkFlT8
vfYwHvk4QxFu9yiQP2HxFoJ+escOUAUMlJ1dwrjjF2NgXE2MXOeu4/T3NmX3TIQ5IqhEnubrtBYk
iStLZDvP0AdZ/0oWR5WY3GNbejxeNVlrGZQmP6zmfNWbxSx3A1PiUCz6FsShhulKb89i8IqYVvpC
ujrfDvlmyrFlPzHY/5Bm7imRY5ofXEsw9VD7SYlanRzi0gZcvUF/h3OUEA7YQaePBDEOcGftY1uS
bF9BAYcn32StnmQS7yqev+4PjlUV0+KCawpd4xUBS3E09/Hw8BpIXI/ZHn1bue5ezqybU2VWcV7Q
xYbbABkkWM5sgfeluS19pM2LbSe6zD1VjImrj7HS8VibdKFDseWpgnPvj2Tto1oIt29VAyWeDJsP
3KIznBVx/5pRXjLkOuhnUEZuXvPzH/3GAIfPww+LJXCe9on929iPh1SXkNLTxqVAoCbWkDPton37
Ew5MwhAM8w6bgbmRD3k02+8L4tHuUjp6TGot4DdOT4T4DLR83nrIJQOfpN7ij4CJLDh8gamRWK2A
Km5DYKp8nyg2aP6YyeBSmkGo2mhX4s18QgMsyvzlDpftKT/eUbcnvY/sTuOZgpjf5YXR5mB8dMv5
D4t+MuTX4bItcb3uyS7/WYV5hCJBCBb5mNrzqBrYtOi2eu7SN32a7VFGgFQy0G/x7xI5sJdm7Yt6
3hbg9pCVhm3BMrcNu+fwd/Bnm/MZ3yGANYi6xoh3NvJYa8g9C5lBEb6bkYt2s01MQYwYx7JpLL9j
kWCpyLGjcuRjKP3zBHbdJ93vklAS/KiPvsD+YK9iuKDKwcEGQ49ZlcIBTYwHgWXMySaW4iSaWwI4
EnHj9oHIPY6J/4IxvhrKCElPOaOAtw4TEanRyfrGl/iqyN6D7d/t+WJyrGxjeZe8S4bzpGQXBom2
mG+gHd3JD1i6w+hmvaA3IpAKYW42I+jmyOB7RQzClrb3h3q5sc5uSoStQ6olVH1WbzjOI1UGL6eu
Qc/6Z7Gn0VaEpICjxoTYVzGDuV1GTz51k0T44/Lgt8vs1q3e8LHzPtMXl74cpt6yqWZv+JEcrx2o
oaqte/HxRVKrPAHzB2TOxfPqGEYDq141tu9QFV4aNzNnL9HP4mtXwrr/pKLVNpOvOLr0+fONgLNV
Bo5hiq1WeEkMSAVHPUSPAXfzN2jhzsAth7lp76nDmfrh05Eqfo8Gqos4avLLvNCBA076oG0pgVBs
oq8Apaa7k7XZThVQmBwtYS6/aiRj+KQhTIDsSkdfh8F5t+ZNAnTiR/2X9ADrqK0XxPK2YhIAwOMY
sStIHK/ZLSD9K+f8JnqmROJy5rTWzqUfpcQGQ4jQmpLo7W3MQl94xymyFckmmcujtlJXZFh9yKKv
P8fgS3XNP+PD5tVgKwkIJVrQ4ja6JfuZ/i/FU+ygOOnHQbVDmMYO3L6zWkEKW2WMzUaMXuoyxXNP
3s3g9QycxeJ4aJwfCqv+8RS4ZWCrgdoLvvlAfdxQZxF/Opdtha4L+vvqFCpWN3Rn/NdMCqw+DT1T
pr/p/Oy6WHTjudDhh5XIxQXYZF5SJtG972Cryq7n2+4ZWtuvs5TL02SMQUUQMvOUM4HsxHvK+zO7
hq1PjdCejHftW+wqkxshuGCw8DVklO85NRgsrFJsCfxQqj7SAkUUhvjCERU8t0bGXJD/8HHLhcEs
OK87ZKH86ktVF/bjqeWjOF168J/7yF4edGHN01gX6Z7DxbIi6LI7Dtt0ctXYaTAbcd6uNbz4p9aS
HY3lx0/Nc7+0t4As8cueSKGJQz6SKiTQdcoLa1UD2i9s4m7CJUstdk2oq6gqdqjenqGdMv0HHrZt
cYDgdc7TDQ1iheBpt7XLGbO3TRuh+VT+mCpz4cKHxLl5cojBDAf3dHoxiV18Qi5054vO6m9TpDzf
vCU/6vVF2z8rm5dA8cKV5hbdpW261twLRsdWdHPR5NqBtuq4drQ3WCTttgH/zNeAtkKkdmWjei3z
7h22KwZTb4bOrkNbBBEI9TDq56GT6x1JdbDbfS5km1OB+6eWfMh37Lw8cc9/imIHMG9v67V7Fy18
7rpQ4NWAiqGzj+xDDUg36bXiqpPFyPHwP+yP/pPqVELM18H4A5PPUi5wHf8uIl06nX3KxzFPnXTv
2IlRea2lffV822FOBcyUojiThKP/jhKLKBlb+MoOWaVytt9QZ4NJMSNrW1S6kaYKQ8R9Ra1/nD4K
UGpMqucdx2faNkydIUY/4Jg/HS1DoHtewjPeGFkG4kZ9AHsMP4iYddJ+mYsB9DyIl3HT5ORqlEpA
YY+HpvEqciX3qvoKLdDpESVA9M0fpLHOyz44Clpr4Zcy9OHO6KyX7gEtvziI6+Z/MjM+f5BV0H8G
7jyYkaZR/7tKsW1DYgf8zYXuXSSNESbdTg6NKAGgSdj1el0Sx4DDOUvql9GVKkOojfarWcxeo1QR
oVhYAS5XwZPYvC+LQw9KRmuNCwUM1XaE0DSltKjbE4/1Gjqgf0mp8YJGxZniVhcBVUJWB58DK7l3
M4O+bz72cYx5n7ZhMgS3haLjBHdN+H90Yog2O9gbFdTM2iZeBRY3jN9DDrMjHW50Y9FL5aEutIi3
z1eda4Hk8nq2D1ef8WlbnQ8HqOCiO7Ffaw85cqoz0IniL5R24ZraXREBwAFe4icT+R5ET+VWxREZ
fpR1j9QrXGVA3Bb3MNrOS/OQQKLAgC45sFZZXPgY53G+cRHHoVyhT1LY2Y3ryAW+nQVZmqjq8b49
+R0dZBPENlpL/emcO4ZjzC5F2acOibWc5r/gktBw8kshGAzCtju24MfGVavhLJ+doXcilaXcYnwM
lZX0WKXdtTflSLwTpnosseGEkkg4EPXJZq0D9Jnx+PZaHJeON6ScIriMj15U45jTuPeE5I1pynW2
0xIiuZu46Bey9mXu0ZZtnRInFU4skhkArp5T95hjmFDJuThOLwp854Tw/BlwdDVmiypA80VZopYd
RfWQ2ozQ2zOe33EJNgw9lE53zXMbvbcuxGNH9g1mjlwwwxy8WupiwU4ybPKmNq+Cyc9x59QbEqL0
P7cGEuIqk7zJqAw0yf4hxZ4k6/GzHSGPrR7SpNm815TWSC1OlNOW2whRs51yoYyWhTCEJamNhNyE
rX98Z0qYahwfeboS7DuhuQ5LHXtjsjLSE2+bD5FSKJS9jQ5pc55VQj4TT/chCUZ7qOed60xUMhN4
m8M5K/VCe69PRoedAH7fYLOhG5CbreM78ipkcC6eKEZtIrFhU9CaOPTVScyGOLN9bUDcIIGF11PN
6ceigBybqFcstFZZI3agpJprSqKi4lBZm01qkXDv9x3aVrfHd+QHOzzZ3yLcV29SW1Mavpq/POGN
THlOQ1yzE9tR4PPtErjWvIsSOsr+XkmP0zWZT3a5zCWic838AWP5bwlVTnPTAmB3/WtYI7xvA3qJ
+FfbL+rU7CUAlNmREF7kS2zNnoP8A28/3KJGFqJZDN8YtJ5qD0vJTZU30bCtfbkboAIF3V0L8iKJ
M1IVxpgC+VLv/xuGQhMqiWwyFOc7Z+jjgNxREVfek/BY4hESsyztUGSXtTUA1lI4S29Rtoigz4Tx
XF+sGyqBxBWf45THRDTFUk+HxLn/gPJpyLcxNzDBDGWQeVIS34ce3ASdfFcoWBUGX6U70RIohTBJ
gCBy8I66lTF3K9EoWygZxoM0v6f+ULnQ9h1lDhXsw8ZjyouF3gtiLuIWV7IC6dk3NlpoBF5kNs01
hgr4Kj4CD9I1IHlULmU11wKgFIdKQ1EkZY14gJ6X/RidnVKJ3tbL7JnOOBN8XnEIUjDt+7l/ofpr
iwxR/8zBynS2evXqWODVsMtOKI8GzPWrQPAZWEKzi1+4tXqgH0fOE9ua3i87mgJpKQpThX+Dg+m6
KzcAwgyp5aDoJmRlpUf//Syw5LMhwV34npHxqTGBngV46qW0suw+h3s2oGI0y6yhwxr8U0f4A/Vq
iQhLzrVzZDs4iA0pdMY/npw2lElXIyLkmN+NE/R4s5ubHL85d989uElwzahvDvVRbb8JuU4O+HSC
0/CB1kGLaLMRRfDCF2osAzE/Hm2zx/LTmwPoylA0z1T2GSxdyTVAG/ysfn+ZHD7YR9cWxCGqLBFT
nDebLdJbyLiGU8ioNjPMd/FMX5b5sCT6G9Cemu486llTFSw5PWklvAynG/nQNQP9crtciQ5rT+oG
0vxFOCABAsmBsHl40nNAcq6Nb7YCwHi1DgYEoMhtnhEqohibe1Qn5LH8ZgpFr64LCTlcVPGKTnwe
bcBQ5Mq3mL2bT2j8MizaPR0hD5F15GH82S3EqM3cmLxGuf102DNNx5FokvLi93X5v5e8UFFqPp7c
I75yJvljiEBAoSbEJa81CD32cHIWw3oo1NtWRGpSUkkJvTcgBSu9qZ7DvhtS/GIJvpmEZ+igJ1zN
IzpOqeIMo9t3Af1+UVg+EznEMDzbEyiym8AqVzsvU7I0x/CI59UOUSa2ekJPIpvRNozzVhED75C1
A4TA+krCu7ppKtvvwPI4shlUxmZepoTJClY8nkDaTX80ppsY78CEvM8HSMj2vtMyCzNad7WKw2xP
IR9BKHEsUcSuuVGyJbq9fI/O+9psZC+xxYTnihufjLj96K8cGYnRBqKIS2+RZXwkup0aovzNvjY5
qzVhWIRRxvggC3nAHwl5c0lG22eH19RyvWkvNstvUaB9KXUfKg/1hzMdnayvMah+VL+2sEuMd5B8
F4rnPrcSTwHKcJZeoZx5AaNrtoV5pG2vjyMRcv68Eya+mnGKC8Nc/AtyJzoh1iVal/vnt+CF2NaC
yZAr1jqIX80C5jnWyqYwbvB2t4taLpjE7p92iH79gj2Tw8WVRrXCHWGVLB+B/K9VuDZ3NprNyXrB
dlQV7Y77EXvCb1nzaY1UkrwGZx/slUHY9rAkza/ymaSLtlv0oh1JQIyaZwytBk1iUPpKjVSJ5M9y
DNZSacX/XgkLx0Fgi2q+zS0uQzfTLA/T6eum9a+cPCmSlp1loXXXVusN72WOqWAGKyP4bfOFnTEg
QuA0h3NsKmHzWnGuUoRIDiRvYtnrQWXuegz9uygfF2+7l6XIIKU6EUPD0Of9BqJw2FF0oJ2I77fe
E3CYmxAL3IZk2SuJS7cp9qAn1XH4QfF+Jj+RYxWd3FwrxU0RbGz+9DY6dqveYbhViWg6SgHA0fcs
AkWdL6v2h9V0pNWR5obp+HTGvpWp1gzAYdv4yBgvd8DExVGU2Qp3Cj0t6cwj2rj3jzwi++f92SxK
fQwazC+cXyj4I75Qji6P5aLouwcASXPXwbF2+SMGHYXOXqYUU9R/mhKYxJe5QEACKxwbyWu3Zetu
xLblQNg8jSJCkONT/iqlJH/rmNtOMucOfpFhH/a0ykLbCGQVeaeXtRQf70eTsUAs4/GKApZXqadJ
zZC73eNazdI/utYGRNnlb3eEJb/0a7PaNO+jbHf7Cnap9dgG2mG6pCPQW5ZX0PFPfyWCEEbnY8JL
uV9NyJD509QZI7308zuzPVXs15JjjaWaZOOf62r4YZtYBK64mYCF39rDrOHykFPYcVOeEKAUcbky
qZGWhVXxlhcodV1y8/hzArH8O+BAy4hsovKKxcwdBkUtfF4SGkCdAwRPNhw8h53TK1ln331eSreY
4ySRPXv01sxujra6M6lpQtIb3mMZc3AhGK9vY6dvyIjDZf2LTGTgtMw5CQO3vQu1jlk+ig/AwpPb
thcyD5L3t8PqBLW0jxVgWTM0xTQxLQGMvw87LlBrD9JlfZeJ/93zvZsVg2uz6A+mdviC9WVJ85E2
i2YVGz8F/gDcfESqMFu87Gc8QhzBdOiar9kWb5l1+sAoP8y1UnUK6JnfXJDSSn/Sk0XdmvQS4POC
dqgCjzVAaPo9BL++bZnvDPr2MRJoyW9ixVbjW54Fzkj7UHW+nY7pi82DycstjVhlkUHbATC7lYFr
XuN5QBbgfQtDM5ZlsnqCB98l654VhWAelkIjAyt8bHX3q2xszpVgd2hvh6/Yajuu4HCkwxyyz3dV
2LzxtHDOGLv6ft9gpxXJX5USwowuTomh4DHlgWMlCoVYc1BiTiMwKKGrSyGwyCQOj0V2sDHVbmdW
G6nj2dF6KIIgNH0NCqbIpG4dInXlHdy8G+TDNa4JTombCqVQgnkY9qW3tLffYIaZnOGZtMlU/ogS
BF/t4BoIMIR3nZVIly58KRqA5zn+L5awuw9jQe8D5Z7QuoBYz6KD0CN69/cfVlVQwsYt4cHUUW0Q
RwvFmbMjH6x5PGhlRJUrGLLAqjbBFtLuFos+9nsp1OGuY2xQN4l6VlTrP1k4Qgu0dmOVQ3kFKpac
r7GdM/8Eg1ErtG5OT0lH3wY2pabUGn3PkgWyyYTHEa6GWIFiYpwQzcehDdgzSEsHiJIRntG2aKap
q8ucaFXWGGAdTL3ePh7v4gGGhff5Y9oFWnezZFwe3AsWb4ZcvS+6vpBoW5uodcLls4HlnnHBlf3V
+/98GjK41qPN7CWbvZPThVj2nlZQ25V5cp/e7pT0S7ZNwDbE30EFi/VmzpTiFU05usDm1H3buMCx
GitEhluE5ezv/KirmHI/erHSxVpE3R0pPGgOTO93hqiwHTJ8WB2t1NgW+aGUdWFHl7q2nQBNrzNE
YmGqGIpvVUztgV8zVc3+/FA++fxSp+HMS2RBciKCGTzIK3oGL4P9fceLhsEUM0hBhH/uEJ3q+dxd
pP/pGfOa171z+llaKm3USLnuXcjL3jUcVcr1LfENmBb6BV4vC4BlSK0MKqKyeuZJnh3LF86QAshm
rxIx4HefL3MTTyvLi9NG6lME3X0Yo8ZS7zMZHRZkW9QxhNNSBBqLlqeTcl3vXLzIIbFCL17nANMg
m6DnEaqokPiN2W3qTEQI0ztJuKex6f8GqQ2f5P3AmMJ6cnhJgxzZJGkPAnYzQf34DztnSQsDo+R4
cYMObYyqHvr04uLHERm7hNSXZy2EQWGdTxzVQoq3r4K669vD65JKlavNs7Wgb2ex7MBTaO9DIsan
aIDMmaCTasN4TPfKOPzPAs0CI/DTUfGvK3COeKBAEjxmmshZsFYYCyPf7FoAFwcOQbrLN1ZFgqNl
LW8VGpqb+DE3zjXXiqKOmnk7k5anQOJXc+cpmDMovjGh5Q3wTCm6Df2cvtfvZm1/f6NvvZGVUMd0
2WuWBjD9zGbylNY5iAg58C2sVeO/QM0smHKM9ThG0B2D6RWlF0Tgf4jphrrSIai26TWVNBK1mliG
QQpsBNI28p4tLBBr5Wfh21Je5AFoISymqmNtyFoJ6pChaB24KPjfv+cxqLxGb0eCd0bUwq7zGv2M
nGHEqThRezQjW5n/8G3Os+iaeM7VqKKvACnmO/VVDzd/+dUZSh5MHvPVR8SvM6Nn/UxUMalWd5Nv
udV6ur7o+tbD1la/OKbxSrxf2d5bnDkJzUSJcRZDm5gs1/USZ1kY6ZD58Yhhp906cyvRlL/FBZ7+
ZZpYFBhj0kj1tOkvEcyQV+xcDemmR7AFHevrsvDsGLMQlN7b+Yyl327oIp3+ox3Z0RZ3ghGZYE+H
nuFVOyvv/iSNHfZpQD3+QptcSKk7ntXjCI+1jATD4UiXEc1QCufLnzSE8t4t95+UzyHsWAmxwSdS
qtAgJEp8Ohh0hd2uJWyFLAEwA9w9xQr22rImBXvXt06hVu1jfD5Gnckj7qXF75h1VVxv+9I/LD6p
xD/n7NeFq/mIjps/07Q++2xeGO+CI1RnmZWO5iXrupTlDhtwPlNfNizAE9Qt1NOhDYpg4LaLHcps
JEm6j3pW/nmuL/AmZWXIkZHCSQrX4cWRTzf3bPwRWfoaB+OvoYbkS/k441wX5aQam8bEHwlYmWN9
FqChq0N6IK5yJw2ZzO33Njuf4zi+ER80nWuO3Pufnep4Hl7CyMYObJcG7NOg5wIPXET7HeD3AiCA
JgV/FA4qe8KSo46A3Ey4B4Z48kqlPggZ9HOanrhV7a/EK4QILdg4wMCnOJl26ihtD6clvpTjIS9H
yPkvbKSPJ1iQ9biiBELVG0jxp5TG8CezO2wHvfp5TQNJ0NZ1ns2iFtwhlTJDlbT2//7/yfvuYJIs
QW9vVCuc8m9/JyS/hCJXyWFBjbx0HQB0+FVzgwdrz4qS8fIv1MeTMIqFUsfKMAxPAfnFZ9/u1ikk
FQCBfjL6ak9g2yT5aCs5Y5ARM/68Nv9BEIVRLpcrWDWq21zOqn7tIXsiLBpRCoGTsrMDCwi49iqO
G+eoaW2I25ydJ9eBCT1B/48KNr6hqB3SErbKAKCC2cFakqxY/jn4fOvRuTCE9LKtWfH0CY2WUhI6
+jRO9ZKIaRnJXTezHR4KDdEIKBB2Wuh91fXrENdhDuqHmswgWxtgGCTA/HClQgLG6sw9X774Bbae
kTGplPNdJ7xJYfB7PE/FPeSaXDINzf7BbGtj5skRjqnrNM5usZhV1487hvP1QYrmjdKDn1/RKwIY
5u6X19JIrUPQpnmpJ9JROawpj4YKK8ubY6ls9P6QkRScX+1/6uQ8NU6KWbKNgia3eqJidc9N0Tc5
EhArJoDnQ5LPBDa+QdrIKEjMsWDIUH3SXdQSTGS54KuvlkTyZZIb2yGqt/5CWjTAQyEy8QmyMX6K
cpb1pZPA4ecmCHpTbOPDxmNga5RP2wSF1qYP8OQwq3+ZXLySHmd4yxsuXANE7hNFeLoM2kON3HXX
Aky9zBd0Grv0lqN9DWupfs/VtAu95flhS4gCFLLK6NrpGDrmusddwumxj21adC46l8rG9IUWtizb
nsmDNphyHOxu79rLTRnKpUcHGSF7WtdHXP37nDsunwa51LNqrSyGh7WUNQpH05El6ohlhQ899yM3
7VqT2bBS5KP+2afnuAwcEfzyjW40BOyQJG7jSsK70Isn9Gcf0Yp5tMNQP6Z7sUmHLnu1jp9mfPxC
fIzPLT/8/KnRokdgZ5fhE2lctBmmW9bSwbYET2Vol8Mv65K/82sIg+/2lDKcM350lZVRhfXaMHfl
JegxG7abc71j/mr95ruVuyWYFucrWkG3vIlFBu9guGK2lH9Upux05k+KILfDTif8M/UT7RxYSo7M
vQ2A3yuJamOgwh58g/Rc93utsc3Ae6X3ovrKH3lSsnv/TkOTK56M/gHNMHmhEvppw0ZIygzJi2x3
01sEjK9IPGGanQ+9wc7KL3//C7mjBgqUmMXrvdUnvL6im193v3oxz5ufUgGdHkk1Q/lcCK5W7yVY
NV7vCrictjaxb9BMPeVJH49TWprkTadFoT49jjGrSImmPfQ+Docfc1Ff6eqiDIK3x+5D6kux4B/N
wIM0bQWqad2pOXlm7YqziDOKwlFc1mDnu6aLHHu3DpSjtUBTgYZ9bII6QiXWuvIZOpyrgup/1CvO
aXdidIa4ib+s9TUNCnINdtr9Mj8NVpgAaeaZqOs2Kiyu/7faVtTS8gyHLS2VKVAQvTnlhwVB6asL
8+KIRnMmlYX9cz+ArdSxPJubAj8ZAApG+jx2MK3HiYOlpfS9HPdHPGjex6VYYcet2NblNjCpophX
NNXSgvKhtIjgv4Jh7TbKxTdugpRsa65JVffsnH915r+pmtJY6QCZgC99Faibec4YA3MjQFCKyns4
/Suckr01hRrcCj/vshZNeL1/Znw7R7RqygrlqOSjy8RnDx4nJX7JD6ghAyRNdeiaZULU/k/Fl3xQ
LN/9GSiChz4LTfFmFdrohvV2CXsgYbPnDQnvsS4ES1AEMv/gYe1WZbIVUL6q6KLhoIrdj8j+G9CY
cu0AXK4kZ+UKPOio1DUKxjyFGvjzUYGAOIqBVHLa+EBbs877a7ucotb27U6nXFZOiOvKzxNOseFa
hwq7F09rMY5Jtf/GOAHJVFCTcxZAIRyMf8TUuR/z8hcDcOZouVapDVRih/CKv9Q8IZi/99Z008hX
6f0Axa0D912XkfHd03LD2lrumEgQ3M1WcQ3uUqWZXIia4RKI4Lx8EWfmEzgZmUW0KGy9y5mhOV9B
3giYe9DFC37kvPmI3yxblfzNIAcbqhHWJQb+MZz7yq5eussQ2mSyCpwRhtYs0T5LLbB52jmGFN5q
u5+hMXknpDOekfZ0QIJw/X93OgKzidK2H0mR5Y3tBzI7GZcz2S7sboYgeDpM9Zth/q6sUTn34d9Y
IDUBU7bbppE5+cv7Y3kwdx4X2KbJenNxR4vaaQtNarI1m4JoZVUGO7C0WLXorlXCWWQKWtbhdz1Q
vGfb8xIVjCfIlNuZjdsi0oYjKESR02Ettt3BP699LB8b9YbiyC1VfZ6k8cIGFDezfLIvaGPh61Dp
2vCoT5VWzCqYxuoFGm+BewE4xVSPF/LPsk74g8z2sFLSkc/ARHk8XcFhuEBIHJiwQ9p5LB6UCtMn
ALw2jRm5dxVIlznkf0P4xlE53Z42E/oCoI9ssEQ63gukc9UaeVxNfgmTtKKLJL0IFa829FD2PkLo
tydE9N4c5j/3aoTYsPc10Nx0bf8JqI+nln2TbfLb7sWbWlAuWhzZySL0ddOwCEWMT0DBZzZMK86q
9hDMeU9lcTt6ubRd+mGiDxk1Yj2HgKrFmMl0HG7FSA+UNqnTEkQtyIjtIw+sSE+8usMxXKAE7Wwm
G4c0PPkMTrV6d1o9q7+PJ2ekuk57ksIlP37fmz/C+NsPvgZEgqSuRFJ7Xm8maYcNtrOhBV5WLzTB
fn5LHDFstz0fb14ibtv7kW4SUYkGpgRVNNNpk9b/3balbKvr/v41bGhoGJ27NRVolH4DQ/8RTCzL
Z4GS2pYzSluiql4oWRFmY5hfgz03P6su6z9vSbkOoaQntqCudux6L1Jryt0TUaUO70hv+HBMx6Yi
mMcEtO7y74G8IdQKyLHF8F7y7YYoQBGHp8eC+bNnNn1M/kyvnRRZIkns3l4f0Ztzq/bWzfLqOOxZ
ubcD9VJeqrE9YYrTos6K4Jn+8gh+pbFvg4KMgHvCaFu9Ocdui9OggQWjesJuvDBNTFXnniRadKr4
GD8uO8b7t31taxcAba2hX0k3Gy23iAzUg86m9AoUyGFUdKt6TG83h/iQKlfl2ZU4UXgn/6A4ve/+
aNY6PwzxxiU8wylxWCFpEXY9nIe5vqq5fqac8YLxJCXUEsOH3HZHBvOfL8k+c6oI8De+F8WpPSWl
VzuEMrc2NK+AEKXJbkimokRb85RwKexkbTIPkU04XZjHnj/Q/5u0n+1Z+ZLjLXYodh0qoZsFM8Jp
FT/o0lbpKAY4F5BBFNmuAbdyGLqZAANgBXR1qTVDAYz8CIF17Dcsqwvij3yZn2PHP3Bxwnkww7Qd
ehVczArevts9Nb3nOPkaUU5JuSSxCEuiFqcTLj+f6XzmWw42iLxDmJ80MUZgOk1pBd264RxQZ2Pk
VOFS/+SCbHH/xavYONxz1JiXZE96bXUOmyDNNqPxRF78M8G4v35Lc4JbqIn6qdiO29Ji/GSeqFfo
oeT9CvOKUCzHB/jvaBNOWMGRO0yF0tyH6hu/ri3ZX4lXM1S3XLRoYqnkxB7KYCjE2NryRFsVhq/N
uZ3qVxUUowbr2t0J6FNn5Dik6fXNn2QAYnsfcMSOps9VOb4UYmWKJTkU12Vzt6JdZ7NdfNcWaf7s
cmup7fE/qxeMv/Dg2l+UQvixjxwT932T874Z6C+4w3xi3mzu+yHWK/1vJB1uXDqA7pj7XdPi2Roh
up1mlw4m5GsMZRLXtUS4WDwMO63DNjDX0zYHIggiGy7cNFuLcTIYG5NCY/fGyuq0OTion8GQ7mjo
5+tQTpBPg5N6QYYhsNtRDvW1wcIKAj2Lgx3Bnb+2SNjF1i/C65HfB+Yl0rjy70EvoB0NuqMhrQnW
jz26OHkd0puleYaWouRxYLpYjdHtlEtGkkWTZhiy7NEExuwqXNiCkz1Kb4Sf3EE+CyugFkiYDHKs
gQ7knfcMrofJdeILbOwqhSmZtU94c5lNORipMOV7kPl/e8hnegS2TAUo0Rgfx2TEV6/hUlIPJGR3
fcJGvZUBQ3e8GkVRxrj08ukxxsJSylKaGtHIUHy2lq23ZkJnV25mrsWpVZl+OFTdT/Pld90uU6gZ
6WXDmyxGLY+42U//PhrnA0LP95l79a3RxQnD0Xu28jxjgs98wCPXO4PiPltYMtei3/DpTZIs3eTI
uIiz/Ljb6uUnhwgrBZF4y6YOqyfgWMQHB6TJ+Y7D4+DTAv5NY6yv6W6kazrhZpWSIARoWxCODuHV
216TwtM4Rg40IaqCe3YER1S6rUTxB2wi0mOsq6zVFbHBy8JbMabXxibGnkc5qCRLqdvcBeuuGwW1
NawvYw7Iqrq4mH78mmXMH35NLAYXHf17yytfxMwLHofshBUnXsjfy/q6W5v5ANGtxb9dfUljbkOK
/UoedyjPVIo980u4Yug7U0AL7aTjc6XgQk9NZaJIzLlYRzTkdQZTX0JGj2xP59LXOC2KSSICoTjB
IA84exMO8vUZEdSpQRLA+zKXWQfUCKo9U1pxBgUbJ42yKXZOTLHdU8isinrrsvcSeGxLfEjwlGat
N9Lxt07pUZcmgIov8hxhI2s9OJfHXE4FyZ2js9nirlfbbImhKNvtPs9IyU1D34FQshMq2gchS9Dr
j1L6c8lso7h2DNwd2EZY8vhHPI5DwfWAQRrFB/WxyPMF/i1VNVh/Ox3bnLdfOY7Awk+pf3o8qKDS
qXje/JAxOPKTAJpxqJNOut7jLlF7GT7EEtijJYvgQRfTk5UAIXoweBa2MAA3FRHtRPoHCB5HS5I2
1rWPzR1Y9a45G3WWUNbO+Z3s7brneut0sjYaGVUmKbtnxndz29PYQ1u2iVuRS9vzBJpfcoEiXg2d
oti4wtRcrFjKBawe5fO4Q6yz7GvJV0esszZs8Y1O8WEGkwelHn8/LjQwY2YA27FwwnftHEJt1Yl2
J3hvCQqA7C4egNhXhmcnB0ylv8GDeG7Zfp56gQaYpVLGWrmxqZPtN1zAqR7yieUdDOCh2btjzEkH
katCMfyZ+tFUIhWEaQvhZUyKGD2bxfXrZOYFTzkz5hTAoTlhGmWCDZ1jOExDGvEB/c4gC3gUddJ9
cv+oN24pLzg1dgW8mZnkXDo8WDTXDk8GKvsmvmoLtWrIXfmgk3+p8tLrKc1dAttUZQX5Qa3An7A8
yWC2gpSqYINIPBrS6MF7286bEsiaksNi+FE6TDAHZIF5n9cOcZJdqAnq4mXjwZkyzuDm2gBdo0s7
5TUxIQRDhn3ivhtUqUXzxAh8H4QS0rL2d88IugsGARdkJXwU+Ej1rNkreo8dZXZUDHOvRXAn3kck
mMFjfnm0wZbx1S7GUZbYyDaZL1jZhTUDIvX5XMNiTMSKhV2YwaY4wLyZH7GmpYaf2rUb/EZ2cPgN
XbtCw7I2JFBtAq9m+INIwBPK7gF1MeVBjO68AuSHopy/DaIGb15MWo1FlcoT08Ih5zZoCUTZI9cn
AB/KYa4eeEbsNF/8fseTMrS/A3+45X3RFfurMTPRAwyStM1rX1BmP0aIg6nAG3XLX59IofHAhfig
FFVK4x4kD3KuPggMaBFsA9nuE5z0KMIY1f015TdUg1RwKvYEkr3mQvdnxDXgEDNpQaj4DqNqGaJO
2KKCcVUAOn19ggj1Ah5HdgdxH5VhgIP+h/c7cLXE+h4WIyLviMoV9tGnUZqr7uZqSnch/+Chw3FS
7uvaaWYgssJRbMotrVGuzKiw5KJ8xyAE/4Nrh0b3EUeVlvyxUXoLzzuxwCfPmlHy+9wZV6+faiq6
d2AaypUZrhit3mZNCMrkznB+/iAcx8oyn60lN/vA7oUwGlq1r1rYzhFh8GZphdP1DjP6/ocp/XHI
2Ah5dQLhHT2Irl/BvPVnswfP9MqCfk3F+VMsbSCTKInayUCN3JOYzZkSnM2RM3trP7hol8FrjYw7
48kfIdLkKS3ccCpqp9lFebMA15xeP4RynNCvcRf50sUDDb9vYdGGpHVQT9pdGfZbF5e0HqM54Y42
OrmLp+Wmn/6pu97+nvb6d68PEX6zpg7PICnoBAwlyvwOd4SozIGDGde0akk7osxQ+aG4VuqRbQBZ
JtFmVG1zi9RAZYlGFnDT0NxFzqQHhlUIU/nU4MRnOeXZXBrim0RckNV1T90L7ONieARRpXrJpXmq
ZePc9xRFzJePKnq8Da3b5BAWMNhXS1MsO0r4EFUQkj+uJOhwY3nOIypAZg/vzaH3JWX7NJPY76n/
uXhC67wy50h+dH/3PTUyxzd8dYa/0d9NT9fEZXfya+qD5a9eyhVruWsV9ZYOWqCyNGrqVdIxcRr8
JuA4t1bYg59koynMbXK+nGTd0B98BlzPmrMN/GjY0aPh9kFxMLsoHs0WBL9v2jlZLtEplhlZvrep
DQTlJWcBbi3KrD6xNa77waGlOSwh2SJKCwM9S2nWLtAqS0Pvahf4PbK3IYKfDpaY30Z1xZaKMf3/
tUYY+n2j5ltV8e2x8zcFeXS21eRBu9fx8ZuFgvWi7VL65xNScT02i1fB5KvkiXQSh7vFmUX98FRR
nEDhZYsWiEDW8D2eJscILS9xunVR1GRjkCQqHm50z/FRXPGkQMTJ+7LcOelzxlWfNfbtNMo53F/W
PmIjCLqdCa7AzIKlbxaPL3115iMC8+u3T3OEs1tPxAMvGFRh5jQTDkHQ2Z0lB4hxTO9DforNa1r+
5BvBuk7rmSVLIam0lAKiKC/zsMd3Rm61gGwRwcrEBzcqfcXs7s8syMc/mHpccCHlr6Ilchp/2s+q
UlujbNbZF4JaJrKCP9w2LaLWC1L2ILiK5GkIcxZRM0mCqamjYy6R84mnrddTdTT6rhmz70YjynJf
UEyxGmn0VZK4N3xhYETheUnZLHtxfgjNHBZwtX7AXJTfIqRYfVpPzGlaRrjlG8iLRNSSuH3rSOP6
FcVmYfwL66Nba9iwelsfRZ6/SsAtZia4hSACuMFlExTeMRj+tcawDwupv4e65s+uKaXiE1qi4/WR
YJ5q6hj2s/yF+xl76om2sYaA5g90hTQNLkmzpvF/oYaQiG3VtThzhcjRh+QARyEQcPzdc8TCHoqv
1eGTBz3xcu4szFF9dERjqICBI5WnTKealk3ypfYD4+XPxQRayN2G/tn22wnTSbfLCN1v09BQUVdR
EjGNNCFmQTCG0x/0slt06ACa9Hb36W+O7VB9xpFG4uVKmZIuHLeOV0TBCTFNTBSvv76irEzRYCBN
C94mjly+9D9b5HrVdHzvHkbhWsON3ofGQ2ESi1oIx7s43+UGba6UPnmIFwyEJLcYzQXfcBT8MQx5
FsVIxRdlifPOdN/FpyLgcCNMP3oI7KeC9lGPj0kekjUIuLqctUQKQeEbgvFBqfHISE2s+jF640NE
aRS10i8MwvUUeDqOxtY3XQoWvMxwMKvgGpkdC5I02Ps2V70u2xnUYA8VQ2u6MlpadVFKvkZrCBIU
ZC+E1nh+LGhVVX1i6GqhfvpYfEMJ3eyYTwapiHhLhvGxkbr9I4ZbrQDLfwLeGszksxQxNvrSKHvf
v68mvgX+v/Jry5HoE8WgXqe8vbJ52LZix4HVfKJu/QjZ5RruihK1PKlBRuV548K+z5T605Pk2JNN
54quGEXL6UMQKIxxxyj79UfnPs1qSfXpvjAOI1WWyHfxX0nZe0Zi3+xi8KZSdKfwpB5FFdSHjwWh
pSn7drzf+akAc9QsBwJv2N/ozF2+5Pk7yQyyTM11KyWJo0sMg0rhivCi2Vcq9PQzJ1o/dqwb1hen
dz75zynCMXlvCoPv0KmFDPIAcCI8FAw74xExd2CYGXANscwLR23WhDMcQ2g6CyKqAu0oxblhpLRa
2sUBVqAMuf7tclI6Px5MBfZPLFql/cho5x7BN1y4jGjb5H1grOC7dTnN4Numgb53JVeI+MhUxVhN
CvIMu+dW+y+AEGOQIymGAcLw5Qn5NsTzGJGelvZOAPoiqQcl5tGFHuWlnRitW6gcQXD0SBkG/mOk
t3yKpXUjsXXj3CFo3r98VRoBk6zW3wBt3kJ/ksMg9+lQCtAjJGDGswKN
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
