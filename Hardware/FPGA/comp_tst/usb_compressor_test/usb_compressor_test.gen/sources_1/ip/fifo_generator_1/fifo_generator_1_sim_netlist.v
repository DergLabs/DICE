// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
// Date        : Fri Jan 31 11:19:51 2025
// Host        : DESKTOP-U9NB2CD running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               c:/Users/johnh/Desktop/DICE/Hardware/FPGA/comp_tst/usb_compressor_test/usb_compressor_test.gen/sources_1/ip/fifo_generator_1/fifo_generator_1_sim_netlist.v
// Design      : fifo_generator_1
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xcku3p-ffva676-2-i
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "fifo_generator_1,fifo_generator_v13_2_9,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "fifo_generator_v13_2_9,Vivado 2023.2" *) 
(* NotValidForBitStream *)
module fifo_generator_1
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
  fifo_generator_1_fifo_generator_v13_2_9 U0
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
(* INV_DEF_VAL = "1'b1" *) (* ORIG_REF_NAME = "xpm_cdc_async_rst" *) (* RST_ACTIVE_HIGH = "1" *) 
(* VERSION = "0" *) (* XPM_MODULE = "TRUE" *) (* is_du_within_envelope = "true" *) 
(* keep_hierarchy = "true" *) (* xpm_cdc = "ASYNC_RST" *) 
module fifo_generator_1_xpm_cdc_async_rst
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
module fifo_generator_1_xpm_cdc_async_rst__1
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

(* DEST_SYNC_FF = "2" *) (* INIT_SYNC_FF = "0" *) (* ORIG_REF_NAME = "xpm_cdc_gray" *) 
(* REG_OUTPUT = "1" *) (* SIM_ASSERT_CHK = "0" *) (* SIM_LOSSLESS_GRAY_CHK = "0" *) 
(* VERSION = "0" *) (* WIDTH = "4" *) (* XPM_MODULE = "TRUE" *) 
(* is_du_within_envelope = "true" *) (* keep_hierarchy = "true" *) (* xpm_cdc = "GRAY" *) 
module fifo_generator_1_xpm_cdc_gray
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
module fifo_generator_1_xpm_cdc_gray__2
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

(* DEST_SYNC_FF = "4" *) (* INIT_SYNC_FF = "0" *) (* ORIG_REF_NAME = "xpm_cdc_single" *) 
(* SIM_ASSERT_CHK = "0" *) (* SRC_INPUT_REG = "0" *) (* VERSION = "0" *) 
(* XPM_MODULE = "TRUE" *) (* is_du_within_envelope = "true" *) (* keep_hierarchy = "true" *) 
(* xpm_cdc = "SINGLE" *) 
module fifo_generator_1_xpm_cdc_single
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
module fifo_generator_1_xpm_cdc_single__2
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 81088)
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
