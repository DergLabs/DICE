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
