// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
// Date        : Sat Jan 25 22:32:18 2025
// Host        : DESKTOP-U9NB2CD running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim {c:/Users/johnh/Desktop/DICE/Hardware/FPGA/USB Compressor
//               Test/usb_compressor_test/usb_compressor_test.gen/sources_1/ip/fifo_generator_0/fifo_generator_0_sim_netlist.v}
// Design      : fifo_generator_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xcku3p-ffva676-2-i
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "fifo_generator_0,fifo_generator_v13_2_9,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "fifo_generator_v13_2_9,Vivado 2023.2" *) 
(* NotValidForBitStream *)
module fifo_generator_0
   (srst,
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
  input srst;
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
  wire srst;
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
  wire [9:0]NLW_U0_data_count_UNCONNECTED;
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
  wire [9:0]NLW_U0_wr_data_count_UNCONNECTED;

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
  (* C_DATA_COUNT_WIDTH = "10" *) 
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
  (* C_HAS_VALID = "1" *) 
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
  (* C_PRELOAD_LATENCY = "1" *) 
  (* C_PRELOAD_REGS = "0" *) 
  (* C_PRIM_FIFO_TYPE = "1kx18" *) 
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
  (* C_PROG_FULL_THRESH_ASSERT_VAL = "1022" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_AXIS = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_RACH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_RDCH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WACH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WDCH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WRCH = "1023" *) 
  (* C_PROG_FULL_THRESH_NEGATE_VAL = "1021" *) 
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
  (* C_WR_DATA_COUNT_WIDTH = "10" *) 
  (* C_WR_DEPTH = "1024" *) 
  (* C_WR_DEPTH_AXIS = "1024" *) 
  (* C_WR_DEPTH_RACH = "16" *) 
  (* C_WR_DEPTH_RDCH = "1024" *) 
  (* C_WR_DEPTH_WACH = "16" *) 
  (* C_WR_DEPTH_WDCH = "1024" *) 
  (* C_WR_DEPTH_WRCH = "16" *) 
  (* C_WR_FREQ = "100" *) 
  (* C_WR_PNTR_WIDTH = "10" *) 
  (* C_WR_PNTR_WIDTH_AXIS = "10" *) 
  (* C_WR_PNTR_WIDTH_RACH = "4" *) 
  (* C_WR_PNTR_WIDTH_RDCH = "10" *) 
  (* C_WR_PNTR_WIDTH_WACH = "4" *) 
  (* C_WR_PNTR_WIDTH_WDCH = "10" *) 
  (* C_WR_PNTR_WIDTH_WRCH = "4" *) 
  (* C_WR_RESPONSE_LATENCY = "1" *) 
  (* is_du_within_envelope = "true" *) 
  fifo_generator_0_fifo_generator_v13_2_9 U0
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
        .data_count(NLW_U0_data_count_UNCONNECTED[9:0]),
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
        .prog_full_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_full_thresh_assert({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_full_thresh_negate({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
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
        .valid(valid),
        .wr_ack(NLW_U0_wr_ack_UNCONNECTED),
        .wr_clk(wr_clk),
        .wr_data_count(NLW_U0_wr_data_count_UNCONNECTED[9:0]),
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 51856)
`pragma protect data_block
BhkxunSRgRzHXO4hdxW3dcgerG9Yk0oKrnOuCmsLG9DIKmi891enHTC9VDJjT/0JjZmjHxcJ85f5
Iu0e3nwIR7Fv0ziC5TW5HXOn2xYTs2rZZI6vHp1BJxGQIHwWnpkaOd4O1Yq9b69oQT6YpFhIdWeV
DCh7uwBz5P/8p7eqW+/aY+sUbqX4cwsTDYYB6/NqGXDQpr+6cwTnOc1udGX4+oZ3DMFec+aL/vKA
IH2/6colfe6NwqJDBMC3Yz5WDK7dYfdj0iDzoea7F/R0rQuowuTe9jqB6eUOturMQHYI/18QNFnR
VFNiqlom/mLPvxjp1ot8Tgg9mDVPxXhwzbtJ9Px4BVGD2znErGxmBS40ugThSCSNFmRl0poEK408
lSNE6FG20TREa+OBg9K9/kKKOGuQiYzGSqp1G5Gj8a3cjAIxgQa8KsOrSJBx3nljNUgdA8gvQGat
X8XZ8prJLEubQWOWPocyVETlr7wDpBA4bn2TM92lyr5q9EvvogWUYI+qbIkMjyrbe31y2FUAKPj5
ttKiIttvVZRP0Enn/diumww5OL/Lpn5YQ+OmXsoCwwEF3o4/rrxa7nQVaGdZS7T6C32MBfDvrZpV
G3z2dgyxE5MfY1o9B4y2fy5dxkzhgds5y9qCvF6fcKEDlgnz9YWwB7uJ6luJsplr7wNmO1ZMjeAB
i+TX5n8uyOdadAjBojSAy/gniPhc4c+sAZ8ROy2VcTAOKZz0IYMhkmb1+lvxeCIxGvRfATloZ4aH
4mOo4lmxE1ADgUs0/+qYjTz3S68pbIs3hw1GmBdkXCWpBZh1hearKc/qQ87x2wbfoYbr7sQ5P8CS
QUiuJHXikCQWYxjB/x3Xk0GlZtWcAaSfr4vPjAT6XIyKFB7eMgpNYzYXxlIaicP/AAYXMKxA+zJG
uUI13xadwnEemrwlbWecFMD8+ZZ2WSa0QnGY2MNrwk2BRBqUc4KY8lkpPyCv8JPhG/21nVUjRlI+
iSE3fYl1UhGMxnc5l4T2W0/wrshRo4EZryvplH7qsaQL25bZ12xU8Ht8G40abqdA6PLuBJnZ0H2y
q+J4so5OALyLqX1LDneUsiM5EbZZVOh5+M/cT2Q0ePm5EWBOnQZP3O3tW7OF8LGIdhhLXVVVsOgI
SHJ6trJtKdxW5gvt48lgaOwfZZt4y7tIm9jhgHwOhHhloF6igwSsVs1ofFotDpjU/8JE9fdNDeIK
i9Rzoi9aiP5s3u33O92YLNLiNjCYCo+JISzI6iGxp4mJZCAUv+v34hlZXhrT+PLxTImlIDWcUGSu
iyvruDn3kdEonnlDOz1IT4nNw3epJJWaeFVRJzpUXOIiweAkDs1h5XnRjBQXJB+QwFnL8CeKYzB6
TsOTiDG70lbLjC3mhTBglpDffNaelpI+YxSgxVDGlqPtPcZ01z54+g+kkxiaN0Bdk+aCqHVm0vBT
AbRUcOTEHcizjQsg6hHkeqopcOiCMnr8qGVPsKpa6uxeRCKu/l0AV+OBjgBjJD6bFaMVRbE51Nmm
qr1DIJQSaaYxu10B01aHwdrhyEA/bubNQdUfbBL80M0BhClVULS+xLv7E0I4XDIM+C3/EqAcOfhR
XmmBvCeRpBLDr0hFOE4Z2LXD8sJgcv1ZYUaSX0/5eEJUt0WcikrOl54qN3MudyTGqZ+ac9q5eHAp
g2uIdUQw47HX5nndIfCMLcgUOmwKe9qJp5Usv1laQxWbo2aLHiYi0CKJcp06lbCq7FsE4Gwt41V/
JDrpe1ay8Ljjicf9BODIZrPvtqhusrXw5369cXh2PQVRroVlHsCdZUIGyFSQTUuO9alC8GaOyyQR
IbeUCFYMlFsRH/YC/Ig9ri7Ii7YAQOru+AxMfOOD1W2zdMHwwlI9mGkyEtlIJ6MEKIfa9Azo1waA
8ijAzI1XXfmQQe0wA7IhlJI8Hy88WLuz6QrmU3yf9XJjTsJG/Q5HX0fb8JAMO+4eFLkEmXaYCW+g
LKLve9tp5CESBodYMxK92twzgyQG+N9KDsdej0rHwtaxEQYeOl+a89mxyXZyqWuhfCA//UTPiO+M
GghYsdgRaGfrvqAQqKg7vW6RkgSYeC6RN039RljbdKgU/0YeRYkcDdhzVTG7gL4jEzuVl45x0xDU
+hQV8SC6CxRy8VhZZQWjWoxILnGnkXOAV1EdrlRFyCFuH4gbb+l/OqxdKR0KVp5ilrYK2AM9cqav
gJ9eikXPZ6RNV5+/BrOQoTQbfzlGOFMyGAZmTjdIsO+OEHaKiIahagoNnh4+hha//dd2g/skydUr
RL8QF5jzRzcqYjaqbQy1VTttPxWQZJVhLsOFjkq7nxrWGzAS1qjQFacQaZs6aDzkzJb/px7lNGYD
E6XqDAnJZQhCEjS5Nibi+iLfYhZrsiosr7zycyvHLKu07R+4WOxC7MYrAY0N8t9CP5oivOpDDS9v
idXdluNsTaLJkp38jHuZtHEBtx6y1p1Zw28+e3n+X0bKKVteqQVZO2EXGUAQRTcpmJecmaGQsa1b
zZ2+UVutTRRSpfvSdN6XRt1Q8zD45gefHK+9NOZbuPrUyqnrt+KIdL7iijC+6KBQHOGugLTL4yIX
uYVCkIlccGwXs9mkGhGtivC2+bpE/12rk52Lua5GDN6UnqeBXic/tF9tyRVTFjH0R6+eP0LZcp4+
XfFZHz0FJiSQSV6A+Y1iCyMdd446lMVrzS7g3Od1QWxi9enpan1/it3ekWAQO3Ork4vcmnqGoaPR
O/6bNKZ6ddCnN95aou6MjFNnRbQR2JwwgNjKQkfjrIlfXuXT2y0+5l8YaPg3x6lN8XUHDRXbz9M6
DPvezEIERcCdcj41CQRL/sYIGC1NZ0gCTrGgRNcBfe4Y3D4Omv3qTC+2FByuK67qgzSfcbEpmCQ9
3b+SdfEEWqhXJv01ZVERNq+rWMuk0u5XZxiMk4eK5Riz6nJTd7TeH+RKiTnoDd02gDD4pAzDt5Ka
o5g+RsB0uDtsU8bK6Z2WfADYpTIYTkdxmFKfl6Qg680b7o2ATb6dgF4GGb4sXFYbgm76h+yGyrgp
UGp+UwJ4V4ONGpeOzvVh78PInuX+Y4Q5Mf09GUWBK39tKOgH+YSqhq24PrBrJELhsLfTCcIFKKVt
oMsV/dlEPTL7jKnm6YW/8vkPzUuclHeTXpczRnPuQxPap1iaxIso9gj7rSNJlEGzyf6XayE02V9t
EU3Dpm6ux2qnw+tHEwOA1u5ucpya2BFjbfibpIoZI0dbgQln2blT4SqnSCqP9cILq9IuIeOZzUI5
buh6dw1HX+9NWPIwpGe4CmWEvRTsLKKslnG+o0dV1p/A0nTOSDJaYQmxczMbxTPOZWKA7ZsvYXKj
rYuSYXeBy0JN/MwycUABPCYFP+NZ/dzAbsACiE+41lUhGGbhPGr3FHwMgfwGbCwT9oeZhNBDC03p
oFAy+Yp0A0s05tyTR9LtGDV0fEC7t7oobCBWR3fcbmriK0nbmgJ8tkfRLyOcvb+XO1uc+c2UtRrv
3lSvc3ePbFM6yFo0/pP+y7tJx8NH01r4L6DA8HOYB4/5dOuH/mVXE6I2SukvMkYuR1RDnucpfu2c
uo38WUs3F1ICAi4xGTtIVL0/dvLTWFBNi1hNosfPZdBkFn+jk4paanGQ0SPH34XaeS/ESzZFqWSM
HIjyioCMmfbx0MGTK7mS2d8yzfGT8RhB6hP6dsF1X/LMgyi90tk8ISEw0+LEWutY7tND7K6wk067
Ob+I1OyJjEv3o5/eELyRIQyP6U0y00cftjlXWvMPuHpJ1fO3/B51YNaLK4qk1HXeKcFEGu/ouM4L
onO8yuy76GEKF3m2aXy2WBnOnQzy/TvArfF0GJD/zgzBNLVdSY/MZ/uUJq4j2viUh8bG3HsdxXaf
JE/XxpmfNMsepJbi/Ta/OP7A3YU7LqYc0ZlEA1KBjyJBeB9Zv8F+dSXS/KvFZ466A7WSTbFz8GeY
Kkdq0eFDM2EmvFq8fEWHftJjGDfNSPoiveWpUyim72v2Z8VdPKglIl2KFP8YgDPcWCBn5AH/BiD7
ENPKXSEYfgFNSnOQwDIpZhK/s9WUK7lrF9OavyykHaWaG6MDssXsP1b8rZsVoS2hBGL3Aqnlk86E
WFWH6nRGWmDGs5YvYFjwOdKBhQhvnrylMsMm2nNO8T+fPW92S9zt4xfPhydboLgiiSxfzCTMzyfh
y5zeg4NVF/jcJaqieNximSKwM7yVV6iGi+yLZl5VK3Gx+MwfPFwGlUC1nDPzFSgnQ6E4qmEakVZG
yI4NpnqqyHUaI99Fx+zRVuYnwflSvrQlpcFLLWv443hC9HjLXfnvWORbBRK8l1ku7lfPHOHupXEJ
XYYf2uY2F9om4FNqn8Ya8/ZYOLKYhrnkUML64tcpJT8ysR39AVphHQL4XnM2vyV7a7+D6Ck81gkX
LN6ZE/48hNl0LkF+xZ2JvxZo0K2Jtwl23d+OrqqKJyT0raaA8GzoW6L7Vl/4F3uPQqajhp1iWbHO
6Im+Nw8VwdzH9zN2sUgZLVcadF3YYR6h3UxA3quuAnV9kXY+m/eq/6CarGd+EFUPvJMeOsVbgIoN
uQ24eO059c5sXPVELWHY2lvYhELBcUnHu01sF4ySywTC6cQoDPPhtHzREiocbPR5xg4FOMBv1vqi
lsihjKVN5YbgQnMDp6Au38qrFJOgDlwOysAs+fVucrO3EHpGMKy9yhO9v1PrYQARsttkrM5fWdUN
X3iMjP5fy9Evl5P8c3HFUPp5JMKTB8aU+OS6KoFEMd/r5gZL2TjYgjpJPLlWNbysFjIxh4hIptzB
LkctP2laDHOW3TiJ0JgRFVUcDk2WQ9ZZlzxkrV99x7d7+uPMBaVSawHnMGPaunPNPtb/did8aS2A
xhpVIHi1ZobyAxNFPSCA5ZoyUoU8Drne9c52oxdymZXaSU4ndJHR1zrca5qnopr1tZ3m9rA9+pQ6
TiH1dX0YEfREiDI2wW7wRVPW0dm9UYF87o4OBrUwSkH6lE1Q6iwAZsaJ/sis+6CNH7/Jlq+hV603
EopbjVogg8hZzZPh9lemgt6XBRIBUcT5Q1u7OeFZFKaUU6RdNvsKNhTUe171RSBny7rF/R42drDw
hibFPilyRSBcy3TyCXULnCqZoWOYWTjCWaVUvA+1pCAt2CdRt25O2O/hodB66P7IGHcRoVzOOWWw
b/jJFuTKdcoOKSLbp6nTLiGsNQbvjsfkvEQjmtG1+LxPF8nt6hT+7O0GbFzUOkeaHBHpEdgsggx7
2JJGkDQeDHr1TahHNfObBgyVYKEQ/Zdi5uheF70Ja+N+utrN0CElz48TvBttqjZrMNr7BfZcybEe
fhfjTVQ31Yw9ToUOzGGhhf9VZsEqQ1yN+LGGu9P5K4hQvd+Zc2TD8kn/ys3s6qZY0bEGIrp83siL
l+/KeNicVAEDwUj5KH+J2bLsmjjy1ar9U65rx5VeYgD9nlea5q7gUzsKr+1UtA8VN6WWrtiJf5Rz
OJI7Wvdg2lz9AoMjHbSy58hQ6pcB5YV3GPYcnwUiGr8TJpZWCpfvvn1rN6U4TTCafUfKwV9TJojq
O/TkdZhA1VVGJmK4pVcWcrVIofiCstumCt+kZ4/jjo1WGGfC1OgcStVDzkQBzVqy45IbYPqY48+l
4ZV53VKC+cPPflW70JrL0fbeU2sSaQ7ShrssnVpVj1LGuf3216Kmn7mkCLJybw1mmazZes2G4V/N
bn2ClYy02cKpj2aLlRCid6eDrMM5BDchO5vg0y/LBlSZDypbPQqrRvLJZJrSr9isphFg50lhByWR
W9KP66fnmxCMu2YFog1cDWTCb49zQdxmFXYD2DuusZNB6y/zRv0j9pw0jn0gh0gzots0y9Hqw5rP
sD4fK3/XkhFdXRYLa7HXKqI+zbiDshu+IDKtycrbpFqHP41+mCd5uyt0qCr8e3W3tK2oTRH4Z/A6
7DCaritDZDJ8puq5lcGWmr6XSWDPEW3o7eUX0C41PcdOOoUwwg6PqnsAQb6SqTC83EtAjwcSYHKq
A0ukqQwrW2phcNqiX8/bTpiotO8/TJa/K7H6N/1YL1ddI5qtDnuTb2miFSCdGz0tk1VvwNFKHN4I
GlRtR95/uP4T2Ap2E5Frc853iW7ZMoS9JesEGTxI5CVGuoTE+Ht4Ictk0BEud4Xk4OUooRyNZVSx
fWVCv5zvQPQdmB0dgarSwbj1cZ1xkAmXDBqRejXQcEMTA9IQWBmarXW1i63hKcbut5zNJlvcmrV5
jguYBlnH/75cIZeud3ePGJXaHZi1kFRR4FXRcA2J87XY5VEAG5/GYJlvFROg3pl3LaOqHud7Jrle
Fh9jECc+ylBt0cffC8YfD30jYIR3uRODKohMcO7i7tYADuF+hKBsYiWXwZOHil8zt3wpqpF27gbr
XtiTAh2br3TE75Ca221GgWB+EavOzQLs18INHxmuF0k/wG4h9d991RfJr53fSXyLO0BCvvIdzIZt
M0yIlNr7pYBeY7fVobf0ImyjmMLncGhBXE9eaw7mynNkCSb2a/ANrWmh1Ljw6pq6N7kdJ66wEwVo
ERU+vMxt1+HkedJJwkSL8hS23RmlRfLPv0e6p5DsXg+5I2Ivin0+zlRVjr/AjFEKCXNF4V1VRSND
7bawPEtxu+8FninKwpL96PfI08A4UtC5wWxrfuTPNVgg2aqJnoLtopBAZlioySFvl8hcHRFg8wuI
hDuZbTbBchTshzlr5LFBlyIKWqzufZugPWFBWil364YN++nY+45ud8Ksr3CVyNXsnmWHtAmqixs0
9B6OYX9/1c6G51C2E1rDYHjaHeZVgPlHeMvO6KGXQbjigTX9gAzf/qb1PBl7Vbe6ICHfSLYHuzu6
bsLMlKJUMzWUYOCohMdNOFZMd3bbdakHa7LGP6YN0abWTCO5pPFuKQPQwUgJh8qHjmS42Mx8prTy
UdDy/f3/Tx5k6dOERbv5J0od1buUmv4O+N4wf8AMpxaYzXowOFNrCfZ9O99u0gEOs7N3sndYPSZN
EGWYaakWAzgX8FMYqKhSnDhnX10VWtLjpm4kk/HNXMT+xW9NeeqtMhoAwmF988Cy2gSng5TvwSSR
jJgfnTW6PjqTh9oWMOxrNd/3sv84ni9eyhlNpVkFN8JE5bmsTKYnrVJLrybcDK/e7p4FeHIRUvTP
0+KqwTw458MZ/05jtt5Jw1rfZAhzWsYUdLek9RBgQ1DA4mhj/s1aK5RosUHlmI8VVCXmvQHJviVl
iYfAfyAdyBCelapEuQwETbPw9QGGilQb5+wHxd8VzUJEGVN2+DcyxuR+L8CftK+lLCP5hxVFZelx
lmMCqeevP++3xlA4ks0O3vMMcPUihYm+csRupGqoIwsQpggIJqOJWsgh4uy2BoKDcGGMC5s6aTkT
WXco88p7GF6gWCHkwZhX1N1TCZN4kcjwsXPq3VqxSeuPDmfFoVBGhLWF8wscDcn9CBWS6GJfB9/s
u5TlTZ7Dv/eGNph8hHaeXeRT1Hiwc/7g/vrSPAFjnkZ98FW37nb60IJnY6Gd3Dy+NkYUxu0OC7EY
svooY7jqxJMeON2aSPZlhAvjgQJv6LnqybNs768DrvHTbcDGNfP1+lO6rpqH528m1spkyi+Eo/4W
ZaJOCBVaaVD+2aNY7QJu9tqLmecqjK4V92cO9dmsfg+4+h+D36x6SN7cN/es1pmo9ln+JjBj9bPP
BjETb4mRSAn/wZCqb+vEuG9Mv1+6zkpXN9OlKnrAx/ytDsGJmY/EOItJXXHkpiHQo0ZFKNxWO59H
JPl0H8ksrTH4h86Slnehu+QVO4reN+qabumIqmdYweltMkeJXImmvedeDHFNWpBLznUzDAPRCxeP
xpXK3mlw3w1whEtjMNd5/iyX4c7dekXVAyZNffoWCbdAW4+f7lbwAN2qJW1ekQ9T6oFuUq+dPfgi
xwWfmHBnjSxdoe3otusend30uWPY7IJskNqElQae0wOmG1qIpGQUEefljaFDd8K4zJKT1NbL6vQS
hpcQzjZA1INnMmTAXHUS+HmQlvVm4JgJ5TdYnXETU7jItouYesbuit7v4JDW9XlX2gnOKBW/W91s
GoPydy4Dz6u17d5R2kEWh52mw0WGYZz/ZNZ6CZlitw2VZP0kv34i0XMLaFs9JqCNP2yO+CysUAJO
p02uzkpRzYcFxl7734LzgcgAbcQXJo8Y/v3nB8ASy71VZqNSiZ0XjdraHg/d256vlxr/3pjbugwO
1coiTEQTOdU5jJp0juI4lkWrCDFrFevxlclUQ9+1b94BbgsUtN83gJVxP37+MNMPw+OEHjmgm9yy
y4gejPEUgbi0wpcrcPbG/IrxRVn0wYoVQpn8R1Baowa6G3B7swDx5MUdqBbDJrRCKThRJOVdsdb1
4h4ZEqODD2PBRcr+cFb+lfK+kxpty058+fBFW8jy3cyQEIEDgl9xk5YzBqLCMh+b6tWx92zTM8BJ
mwBYED+PA1XZ3UtwTXNp7TXJ1NlnGel6kj2KkG2CAjaStR+X4Lc9mVELdjD76tSOmBN9LmaVMnOK
bGA8d5ibiuTJerysTmOUU1r32pJNIOWnc2VnUAM1omkxQsSN1xBHyzBMd1cHeca3IiWINr0tLfVa
GYukpkMoKk/kcqpJxORKlNNYSZsscEu8IhttKair904JOW04JpIB4n13WRwUdJuss+WBbPU6CMlk
TkFYubHGfd4nSbT9Em6MHYnHB2h5TR1+7r3DKE216RnzxPOuEByc32p3aeD6Hnv/Wfr77uGY35Da
LZWxlQx4WTf87RISA0Yq7JlHl8BiZH4B2scxfXEv3RQt0BglJAYFumktkPJD0Zpv5ElNYLVv+XpD
UufYTfjj1KunoV7kxCUJAFvOba0Ij4FM8t2wpm46KBbGnh79OOOwndrXhSb95ptqQx1jOIHWssgW
hu8K54Z2C9zxd5DMdyUlv9rzvci0fMga7ftzE8ALaG0G2wNeAuH34drjvClQo9AP/IoP7QBpRYgJ
x38dXRQ3zfw5pXcaHB9F2N8R+saisNVaXrgBAr992dUIV18zqa+pbfJoBJ2a2HcPYovGqzqSpIYc
8x+mvg7ATs28WxaRPTdwTUf8aKmtIq3YTz8LrZ+J3Zl1HHe3b4HG8Tjzdjf2ZDfYCP75BFrjo2Di
rr8pPpPAqD8xyJd0bhooXbvR/U7aEjbSZ8/lkpevox6bDNpf8909xliBbjFxg3LCRUwiMu/mmNFR
sIcEzk7Jx28KP756ek8yFQJH1jZDJKI336y07FDOYaLsVTNOwmaUGyZECwZVHb3eHXU2Gm0wLpmj
BZf2u3bqufsWStFsj6gZvaZpUWBP9FTSAqt9Mabg9m2rvcXwffJOdALVHTPwmPpiAQxVB4ISZW+9
whVMr5kHvw3OnYnGQaf92WnqF1guiqA1syGaxVf6+2VXrEYDVwhIFVqWcEePdwSbSOrWnKNiXhbo
TL6JoVfkiaMGCuetGZ/FMdxfM+VhjG4zKLvAbbkSgzJOwuwYGn4yQcyJh9pd+0YY9ZlaKSaBXK7m
nsKIFdu0J+LEpjdMjZ44V9YStU2BQTli1bXpqcS+HyGkvSgQ/JsZRv8TOAaj7L0H5IRFeVa2q9oS
amSDCVaCJSXHHC2FADdPmX347uh0CaReKlpJBcUFTMtoY+QxGVdOLgRDSby5abV5YaB8Y5jJ2Sct
EkObcnSidYbg62um0uuYtItt8fVxj5+A5vLATFGtPGNmi+9hLCaD4TwZy9EUpVKNcJZDkR/Ejl99
zKZK4kLKXouUId282w+fmOrfHs0IQliCyfvT7lnPvg13sggKEX0zc2Hsl64C/P7t4iT/c8iuNj5Z
kJgeqprzU/Mb2denUyJcQwiRBTXmmHLn9BDJcWR4fDSmYTvAFStWaaahGp1DEgl9nu1N1neIIn5S
Na9m1Ng1Cqu7noSE6PStAjEyhJsXXs6L0gQwpXqqtrlLF7KuWUZibAhvo2NzDipufjPV0ED+aW+l
y+s8TOozAopTxRYmP/h7l9kmOjMVJUVsLUDST4OcIrXA2gmuoA/p1YfCOgrOTVxYEAL7j312HFbf
nLtfc/8QjtIjO6FAbbKn5xrpU/DA0yMiH89CUYtnx2BZNH+c6F03BHsGCNCFsTqgzHkiPSq3WbGo
eZrV83+TPuQIiJWtGeolKMv+7KAcEE75lQLEMBcmLA3potthYNKQakST1jzz6xfWYoa0OK/jHTHd
loUnzmxtOgELQmsOaXK+KR4F4kGkRMmi4WdST7hfyeOgdyrsD/M2mTHBQhuNpyOTaZR6tG2vJWI3
TUxD6w0LXxZPhZilxSVOL016gZKY8ijzhzjpRTdlrkAp/g3JidYSBE8tsWouFkjJWEDpt+ZFwhce
Wsp8JNdInCDiS29rnZO0+IIorbI1uN1khVyjINfVjnkVDbs4L0z56h82sGtGrnNQIIOM/IJlLUE+
Q6uxOz8IAlaTuo8hEqgzjA53okqSWH5/gE7qMpcL54FY1Q6wknBp8lpxmkUmklB1zJoIj9DXvNVg
sl63EEEZa9akm9urJ2dZWC+6Y0IoaP2Ef5uVFfSbz9ZBg8/eXpQ2JiR+Pe5Eca59jheXXNVjRjNx
/yhETi/q8tj8nxJbiE19OIj35jMydPGh3SsQSLbd8VI2vE/rvDyPWLT1YKyZtDLggTIzUe7Kt+gV
RqZUXbYzySfGs3Mk6dgkRtH9Nua+SpeaYpq2pMInfzPUf9m2BnmCLzmqPo8ooTA1cuiRkVGGE0gI
kXeGpw+V/zKNw+d0X+I8wxRVXdiJQbsjpnU9YgCXKVHOnE+vzkSRULov6APYxfeZwyN6leG2vYiS
wfqbkQH+RQj0MDqKkWhKoJ7Y1wnh9mqcdpw/KxUCt7BL9jetzgqoYdvDkJOtm/QIY3fOsyCInBmf
Ts3HWWQlL1YvjGbdrRETYbmqBaL15pc9JgixEXzOlF4D6mby65H17Usk/mZGMtVDaBS+Dx8vz4Nm
jRYRn1vQztDJxUMO7ieM2TriEqU0+MGCLJDLrgUqc5TjtCUJEKPxe64VXVb4ip3hSNKSTKAtVeKI
wEqFMj32L83RVf2J6CSp/91YUTcnHfbi6XtJ4BLSCHSKTP46WbMFY569znFJjlfSdrauQcWq2gWw
K11QcRi/n0ATaxfYCB22X8eU3vKPTfw7rX46NWjKIbEGBPuoeOGYhAreuH3uJS+2NGEcmlpK5Nd8
wxxYfkTMRXkX6PNCL/Q0Z8ERjhF0jm6z3YTLviRZZsaRYCaB0oXIqOGwiZ4fcW8EeHc8TRUJtk14
YWJkODuoU9ZM+t23SygmemB0hBBoyHQomCdlaqSX7vbSMIFr3+a5F9xzLBzI14Q5EV1/UpxdKE74
ttjiViYMKvjw+uoeKm4hkfYOw92C8MfEbXAwqmI92JILDsTl8npEO/oFCwp9yM8uZRC4J1UYXRjD
SSgAxoZWNW80YR3JoZzKBeIXoOZLO+maCY4riL5ISk01rfmTAMecBOvmfRLXQVXil3nQydJSkHza
Sg36nc0ZUamx3NWdcmcgURO7iyJBZWck4/Vofv39JCYXwYQr0GaeEK3TRrOqgNGENsvFNjNZMR/F
nyUiDkAND+FpHujo4QFJ+Gle2fLgpLex+Yw8hRsZhPnD0AYoZGXNuZWoxHm4ycj4nAjjJpwPhZkq
9S6sAeSNmDw+Snrw3yEM4l5H/zXHzRpUp6MIb6Mc8Z5W1BgGHuEzb0aLcdYRvOGrOSSuxMsrCVRV
g7Wt5nCYTu/QW0ayhxEvzohu89aDL76w+nxPuIKS3NhsSt3X0IoHNc577CFPiSje1zsuhH7D9Gmu
A6bu6vw51fYOyhYmR9hBWOzt9jxAxTeeAne598DjneD4Izkb8TILq14R1jwxVHtuEt4ctCQBnSxv
xey9AyFWADU9RqinCXOC6Qp0Hc4gMW7z3yX/pads/Q+AsiMjjxDjeu5qMG3pkC3CgStq55K77Wib
q3uz6HMeCU6i9r8VSoMk4DdKHtX2mOBS25DLksUBF3/IrMT/dvSsOPd5M8n3wXX1M4Z8IoCPl+zr
IyIUWL3IRVAh5C3JVAcCjYmtS4R4DGsV7SWpql1EfAtlhxbFKZo+xpey34/JGGpvKctIWkHEVvRt
LJzKiV15VtHMS0Vkpys7N0gyQvloWRmwML8gyHAFPcmBEs07bRV47BPhj10XBgViBPzRH8StEelW
KkF9vWoPm7Fy5Uuv1HzEnkN6RxAZ4IExmFjjvCRrzIuq/q6AxVLIcWV6gAa3xppotomLR4D1KOOl
iIWrjjs2bz+tvdyinLz0EV2DFU/FbJZHpIsGeyiEPh5kqnCuR/rzj9AvpdGa3usH4XYxGP+oXOT5
Vwt+S2PUr+qotHhv3hJqNsZGjRAnELVwIEUcMgi8cMlvctn4gCOvnQ/nJX7afh278iFKxL+KMsoX
MLvwLNjPducrjfUfkeL9CG/2dNgbx7jvks44ZTNgq9eKiF7dksYmghvU8VMJJ/J1OeZxZ1ES6cGy
0LABPbyEr477BjliHTRQytEga3s/u6PQT6+/zX0JG9E7NEBq42lVDlDIx/e3liUPjte8Q+BA4kC0
EHruVU5Sgj0TU3vcxoXhKJkVLhtki1YTMo0x5F+E7lx4RgQ7NraImej9uyCT/Rq5v3PRwdSleRLq
w72sAO4kGgSvWD8o0UxJgAYlni+BFMRWKiTeFQ+WjfDDz93DT41+8MZuARR1k66majCkOj5MSGRZ
C+WXT8mo/fA0gSQL4tPjf91SE9ujefj+i302XsgqUZeqT3QQeMdjYeKs+8Smp9asqgqOUg+xy8LY
jSidPPR4RFuvJfG0Bj9jHTXGS53v5b1Gswkm468QDdqa9Se1syBRthqFHMDb/iaZlVwFySuXzB+l
U23unkDYfg/uM82oKnnlMt41h9dT0ehu7ygWi7y6qAbeEwPEumFRcb+AxR4ze7E5A8dYTT/QnR9G
ajDNcj9S4Nwmu0q62a9evPc+eFdwt5mz8RzQSOcMF2qQrUfLsxRM8ouGwl2TI1r0XtbaRHq1Jdxh
c7C1ZqMD+JYt38P6Sd7ljbsw0AJCowIVTCwSiGvJciwC4e6HDGA2DbTvj1KvQube7pHZpGDZxqbT
tE80nmxoI+63dV8bk7fCcEmpIgyLyasqS7D56PBh4f1pEv+CaxPDOEhrOATdMAg1kW8hfNRxa+K8
attvoXQxW+UPgLdYHyqslof+mBk0kVJGlf7p/xrzfdfK/kwnLTyowMTK3RcB6LhvcLk1/geDrwRc
+JN0ZhAWqe7JpoEsz9w2mUg3jVmQLPFiyE6v8/yGh5NJUdExetHJjAB9sfMcORyMwG/yhk2frypz
XRKyLZf7G0x+6Q6FbbotL6X7PKBXcDnwbBVIX2daubMvPxea6TbyrSmZdXL+U9AFapewsETa8eMb
n7Yrba3QXh8HsUjRn6SRp/M01YxgtjYtWOEGUieUvwhToppULrQo2PM+fDY9PNNIz6EraAwkBwSY
1rUN82mjS+uSIL4nlvV/R1XNNrr6Jt6hQTpLsDBi6gGXn9+vlEcMhmrVO/ZnJaGlassKeEpEYLsa
ZARTT5K7R589I30qvcT2ZlS3O1jnyEpNiQF93yzvj+N8P3v39/L19ZeD2DFWbvhrehRioZ7+W7or
Nqd8eMSP4jD6txpmJOI+5YXi3e0YgNS3kEUd3BNTGyhUitvXrorHF2Rn8R6W/H+0piKpIVhvnb4p
ztVZbQSivRNCUSC/U4E7JS2tX8RE2YGUHX3B/r3MNpk7chcBu1F7QO6AZBHjFtri4O77ebWqIwpy
SHBXNETqMZxXrwzwx9A7dPEPBb8bqi1C686LSLHuz2YcI0IH1Y9GTgzjFj+wLvwCyXry2rCFDpM0
h5IanGCY0VFPmOVqYOuH9zBZl/csOpmXEVn5zGmrjiF+ZK0AymGGMVhMeu9J+ZgpnLt47ZRfFJ6O
MpfZMLdf6sZVX5Q5bvy3DkD6iHZOItpHIzt5G4OOQw07fZ3OFgltMU2y/g3emtFHeYRQHP8DadqS
mqD3+YW59kjl1dsnv4e2Vb/Nzeb4wLX0iy6K73uNpH5xhcvf4z2ICYNOlgpVJJaw5aJ6jWHRft9u
/Wlj6RAyJfd7Y0mVVG1DMTCSe2gD/dFmcuCuhDIk0exNzCHnkX+ba+sSU67NtSSAsp1YwYsfTjHx
njDmTihxiFj/P5g0efZu9t9bOFjesZQP+FbVhB1hhuEOTNahJVMjzACj1OHeXjxV/baVjw2d0FeD
D5mcTdcbbd1HbEtwvxL6IHhlTbmCVn1jepDncMQ6Lzi0yaFd3rUox3duJUHLnG3Gh8m1N4VSRQ8G
ykSOWyrgtKmvLfonMvqg3Y/CnmMrm2Gw2KQ/vUH4SpvgYjgQCVyeRX9Z7Ow/z6fEXg2wf783N6wl
uC9Zu6bLJubLRo8pwwV9QMuNqFdzyUwNalnrZysRWw/5elaJVP5XQAqgakolN1Yzv8AlDEBS9PUV
WrcclPyF7kL0vr1YQXP403B8IZk6zBp1HSADJl4ApkCU3RiZbjvjz9ZeV7HAfNcnLt3+BUgKhz+8
vu/8cblJVvhoznLpiN0VUf7pkpJAwm5eMv0cEpd7zt36oCBSgJTnj4dkBCFhjI9AjPd3s2AJLzFX
xS12vDdX97oV5nL/TnrTmDB/khFlfqh9xo9/CTj9bifSHAAX/qmSTb8vWoIV+45sMSqxFlsSHQSv
kL22Z52W5N8EubUD79QdH1GH2SUqmF3jUFVD91zmT33YUZyzhGkojcCe69EIwEStuORhu113GVZz
djKLGV9qSCbJ5GtCbURelAgCBZV/yRSeftLxqxE7E3FSAkq/Xc6ChJZYxwfB//Mw/NxEVdfTAXpF
HFOqkqCidsSHs4vciNNZgXCTIbfpncdLo6J8cJKBNUUPNEM3g8N/nxRLdhC0OoC9Iwq6zT01uagL
zXrd16v3oZTDC7XxQ6aXMcNH/IjA/HejhjKDEUh8ubwbd0dD7ILWXweRRaPoVs0EPS7PPN8W2VFN
NBOu4ta2M7tRcqs8QkjtFOAcMLDs3GiaxRu5Q9gjYVRhq6RXH/zugX5ve9QiRO652PCJe4D1otDg
cgguhdNtD1/pZgwTlCBxAg3bOdWtI9+pWelz4DTjBLh46qCw+TmylD4oMa4o+oUYpjqit1nUCG5R
x3dhSaJUXVxf7R9utyg03n7SEYelYgoWIpu2r/LbJA79rHDVMw4RujizImbVUpr68ZvWxxF7tH0U
xKc5SjWAF1QKypWHZEPkDKXsFO90GSfM5k4NNJqpukukXNAHATSLWSHw3ai0BJJ1FGWzYnKfY+gB
RV9NRdM+dMelvnyh20wzbcktADSvASAAkAm3imtgrOAzFbD4Rf9CnQ0ntIRJTiEAlqplNKN8mdcv
SC75VxrzwDVwiBrG3T59J6N5g2tikhMFNkrqqzl1GONmB28LcwEdBE4tVcM1g3ZgJD9anbUfhAFb
0qKcJW5HEwThxyzqlQl2h8LJUkinNjgEgsq7hMXU7wBcmZwegWT1GT1cT3N4T+0hPL1VMAkgtUV/
WZCfVvhffNfKo8y0dELyt3cEekuZMZiM467Df0mjTrhg06Ek1n+9F6XC+PDr0ozLLz1XK6F55/CM
utdu7TDOPWRVH89PXckiuESS85DTj0Ad7vuFZkaj01GWm9Uqix/4C2WI7QzYen4g8aMuMb/2UO6+
kx2/8N0Eqzo5kgtw7pLv0A3ugmLp2prtYEX3/OZsnMPymKYUQmjihTg6bA3E3De3WU5fAvU9uZIF
F8rLvPWF3Ouda6tdsY9Pd1v+xC/lD2cqWCNtbeoS6haivKGu7IPl6iQn5826DYe9PvltNJyoCsRy
bk06CvGtv206zWrAHZrtyFAWPbcnjIPgVlbyyEruzlvkTnumsMvvk3jbRnwoFz44QBkF6hVjBi+s
SzRq0MvT+TCa4c2DVXOFmq3GlEfvxbkKq5BqBA7LOEtLCeSlRnCOz0XOS4d1l8SRIv9iYirV1rqg
Jr8jpDc8/iVW66Q03/maWDlwC8PU6fLvAGsG/p3WQM/gDF6088PBGFlgw4eZFJOnBrsZMDafsGpI
v5EZxTiFswVU65mKV9mHUlgOWJM3qmQmR9SS5jBEXoUHD73DNHNcKoLvzWxDKX9060OHVSY1PmBx
sCOMj2xxknJZLJNEnmpu9AQhjevqd+u++wywsWHCxk9RyXQLDqFxbKWPEyyzq3u4ewxltVr+J0+J
UzxC8zwpnP/sHZ8LD4blSRE70aw/F4IYm4x/73OXqoXUQDsCBD+fad7075HVH1aximOFoX5geDmf
Yy75pK+zv5kKywuaQRP/XsY4WzLV6LlGlpbSEwiABFhm0oTWCyQzcInLnGiqQ0gJUQ7+Ka0tOl7f
JgUXDOCkeaKq5Wy3WJwsioAgn7+KQZLvRsQS1lb2tlPTk7/ry2Rch9wsKbA/gpvdeJun6gdLFQD6
6CkfSOxbRYxu1DUDv+xXx1roa36kR9roFolpFx0RTg8X59CKmpebyGNIXy8/aBUPY+sF3JdM7ops
9HuPVqgV+n6o77Zcr1cFx/Kjq5T+katFH7eH3RK4qC+P1AMAprkeZO2MjLOX1AGMKvQx1mktOpNX
FkFKKGqXTPnjJ+5lEXeyeH2J8GuAnL+NpqTRqPXftopBTkinnLIUNz+9wkF0hyz2mBgdQ4oGAHxv
4iu121JM9Mqc99iz3nz7bvAM5Tszv6hNx8hCbwpkfsX30GPQQhXpije2c5Yqes+otMYwnh16SabC
I0g2EqTopmGbHw8j2PWdfyF62+hQaDKknh9HkL1sLnSh197650j0FuFq/cl5UiA/fq5APunddUYu
aB/FpFGpN7fL5ngKRUA7G8cq61hYXVnQuWTNAO4N6joTCWDfZNA/81s1ljfwJafPnDkK1QNze7pZ
/DIYSh194CVFSkYPoKLHpifzobSwtynU1ADW4gVGk9GEUElaMTg6ikp+Fe0eVw4M+at8FyYjQ7bq
1iwQiXxF5wvY0PSphYIQB7x3F6/eWHgW88wzHtrGXCqJ9/yceaUD/pjWycV6qU8bclXM0gvURZ/M
OgFWPQGZ7RH3iB2fcbmfK2WKRIedUH1AoX5FrIk6BPIGrtGgfAlFKfZjMELNIpNYEi4xeFXsk0Ri
73Ux784m7QOwAPNm2ca6srFabuYErtNID7mmw/NatpUlJIks41bg5/PeBQr1Do6Dv3CUUXRFBTlC
RW9NEdg+RgJZ4tq7yUZ9ByQX2/uTOODjeH669y77G3xSwaKBCz1hgE8VyK0sL+JYsvGbTmB81g90
FYX6LOGRDew2RLNp4c73TMs/7G6JUwnakU5MrZx9kfIWmwjlgWIZwXWp5Qq9A/akD8u1v3f6BesU
4Erxl7Z/uaG5c/jUaP1K7cRssSyL6jCx47+lSRL+E9ksmJ4MzFPXeXbX3N7Hblyu6f6HhpJ92vcU
FfNzazPIXAMK2zkQgwmUVhyQ0+cWCxbVr2ab5oMIPCFcP4wG9eoJ1rEW9SqmWhN+CruNFEBp4Tsa
X9WcNT6fVwWhIm7Or+CckKwGpQBD4EjoL15d0anQpbYKT5hveuSs59UtbvNNYnX+tRZYZA1zshNK
0yKjXl9eRTPDL15VjZ67Jj1xTSH8ShJd5OrRpFhZWOcEEuDPE2XoHihoVqECrcach7QjzSL27hPU
0q3ADCOFqWCUqZObCyMtC85ZxGPl5QbbMkZeT2Uqvx0ff0BgG6+G/Q3U45Y9UgedPBV+DkgvxsRD
DSpFglR4r4OEFw+c6P+oT/zCeYHbh4SlyzSNZ2CYFgR3epVhLqLBgueTxneEix0lPBr4Tt02ONW0
Pc9d/uz5FrLRCcYxOqxRWqCUgUoNW2782DtacYgG+6pzspvqBpz+BdotuMrkAtWTrwrY/mrzCyrQ
nhpk2NiLyQQPfMlD3Qf/NHyV3TmYzjQI6BH+WepPug+HuT0zbtjf4EDXmKXglq/WavNTJhImc5Pg
pW+36IDTcpDne8NyrVEwmnPAV85xO1bqX951X5h8xoz3eYOwF7bBGJv7rq+7ldbCmSekm5ai3aK0
n160F9cUBsG9yzkhHMurmxbGl4w0M3IOgA9UYxWk1NkB/CtaqijMU73+KW470gidj/ar8LOgo/nN
2dJDVZNqqSby8gGHHmYtPgk6ZoqplHSSlk1Pi+y3SF2yrXdAL9gwyW+M9ELWFQSX1eM+1kXQhQax
nHxzTRBex9v1e8EomDSEmsBQm1IInEZ89BeVRhbGEoPV90y95oqLMqfh0DatrfRNbx7LO59+zYH2
xGRh/MjHbswpvGkQAHNppSp62CUa+0xEXmHn8Nijko0MIKp55A4iCtSwQiUCBCDSFThFL+8Tk+Ku
4tZOlj2aS+zfE1A/6FwglpWVkWVx5SMrUUfQpzKt9Y89NAwFjvZjkE2AEEYC9LhxgKnc3FCUupHT
H2tiy9+oVbETfJKWEKv9eVOURYPIrampvdkIyptrFJt9ADCSq+dA+2P7d9W1SLKSq1JCE25oXlYh
BwrUmi3K/LVYwH9xNWDvEFSo/vCKqBMZwjekuvk+CQRcI8WQw8/S18ecyHyT+BskwLH+zP8KFDhC
vw+xPnqbr44F6mtFtRYvwrvLG+qBzD0CRkZsRGcOhb4/D5jwXb1KLpZAhPkizEQ90T+++36lSfyI
jSnTazEu06MdHupIcFbOfQoFBOA1xKWBGKmFpBQxtpsKLjLaMTQMPRSaBb84aQqBrJlNPMfYwdlC
H4Op6u6eV9bWQ60xkINO1/i0tjOcpWZ2UvcrZWn/SdFbzKi9OCIYCe9ZNjlZ4TnXnKvkouIk3+z4
ORhBfKMxUbWLRHCO0doU5xdM2gz+aL69fdnHbIWlK6Bc3WUI3TIZ1dV8FCoRLmIoeLjzhw0pxKZ8
qUV50xOXSFXOX4xDaxA1mMySmovqIwsb5+k6212r9mWT+e+sri0rkHC6qXyn1KM1VJIk2udPzIg9
eed13M78G/FshXoPVCAY1mqFZlIhHYARRDNn2YCaVJngFjM+c5vhfwIPWNKmvFq6hlNBRdhHnec0
4+fl2eH0yOL6vCvJBPql4iKDy2prtnvBKkhBkKbTt7DlCrruyC6JTe506VVy07cfsf1IORZkKIJP
sgDS/4tQxBMpBY4f1NSDBdro7hvueVgrs172RW0L29/XAFg9FRoQRpuA0zTgNociSkCUwnBGKkKD
gnxEkPice/GV0+j8dN1DQngERihkAsCmlc2AlQkKgltAjG+ca6oFF7P4whDxDjF2Ejr7pi/G8tvj
woOskgbODiVCWJLjNyBTcd2f+9AJVOkPXo+25ecgj+UjTMWHN1Cc8aoflFE7gmkpIpcE29oH65+u
qvvaF+0ujz+8AlEqdw9u05S9lyzGBYTsBmj1ve5gGG3PUQcMoTJ0nLPsJd4TRU4+p4+wxgbgfuoU
b8qB5/TiMBPdUuxqb/78mKbOxpHt8uaEHMizHWleRZQmg17XW5fjUPCo3pispce1jjjgfgtj1kIW
mdOhQ75WdXryhNyRcngqdbIl8KK+Wzu4RvDtwHfvD+MK0fcbPGzfJ/ROn83qHoOIjt54jx/QYT1p
Izx/huTevUETNtO6oKbb7wQnXwh7g4DqV27AqLc3LBDXxsHswzXfV6GXG2SQs8s0bXve7gJnNPO2
07I8Z7FjSNxPrGvzbOwRbA7JzFvNg3aKA1mwYttxfLqWaKyb2s4Ar7LFr4wuDCPBxLH2GHgKxgSp
RNJCM1K9tWOyi7Cj0EcU42Enf4GOiM+kwTO08GUB3U5HXwz8awVtFiSmhYb75d+xFWgtk00avE2s
sPkwV+8r3tgIiuT/wB3IvNsQlqejMtE5kZ6ZdPNPvcOMxNWYWddpXq3tHaaqyqxBDmauv68DQwGS
yidxuw3p90gTmu5hIlf5ZmxZrWPklNAzmX72MdWaFWX4H/Xa3Kp0OSHJziofIR+S4A3jxNK+tOSB
sI+emSkkgTHgUwruOl53Q2NWythjG5OvE5dPJGlr9JOQsx6E79VnYWHqrzZPyInwgSVnUsvN+pha
I0Xj8DlYMEH3WBAM9MtuS7kGwdq6VbWU/pTt5Q8ADZnYhR+hpinTI9Awgv6ImzQIfnFjtKBRExu+
dPz91w830QD0SOZO60v9b91lAuFrYM5KKNMiS1E3ui2PseqXAhYmmiHtfde6viVsRW7k2jpe5Fci
dJEZsRc98nsq45usbLAKkHqUiW0a22KtFQD7XszQjs6dUv0IsWvI26OMFFZVTN9Y5XT91VV5oRCS
UF1tnAzDsPaPuAV4NQ0oOYmbgdJlbti21rUdYopkyvD16wMXpgNTb0f+Rs/pC+qNHNMUxQ04qOWp
BrnaM4gzEZSLeYyQgmrqQrYx9GPlGLfGsYRa/RU1DDzgoLSCselIo7jVT5306cDzPFk9sHMLojrG
zqTnacHDegBwMcaC4eV+uS0ddWRV/94gcfKUY9GzCkU4pKVw82oZXn6I9JRtu+PuMxG4sP2MNAAJ
J3bRMzOE12bAN+u1Dj+2Rr7PbyGaBndMDiU7JLNtFIgYHnQOBqGvraW11upGwOeEJ25CgwNJKTz3
sxuE6UrivMoyWix0PJ4OSxDMbqluqEXkdJdL9JzbtVkwnK+L6719lILXhijoxIaBMVxSLYf9PGAM
f7MKZDv06qhoxc41EJ+eqO4pWGUsNn/ktafYlEhvHWi4Ap397hSowgBdKe+vvlFIoVSWTGT4zxGu
o1AcNdY77rS3GkUXcaary+jVFg5b3qbyzmDiIAdxtZGzgScdCtr5Fh/h1anhyXEGxdRcosLS2qzW
xaAG0cmfhSleeaibFUX3YGRqDyhHIhHTAc81Th4Mp6TUo/WmoYCDXv2gRwmrK9K1O8klHzMepN9f
Fdj6eXnDR7Mqw/MXy6wEaTke8kuNpzLd0qLTy0b5ZGYZj5tkrWklPIsKJwOUClFZubY0eCjAVq7a
ODIp1xVWSdwRsrCyDL5T/EzGUu9N0FKDeUjBKz+v1DAA6uIZHLulQxiMAIMee3uY+wJS64U2fd69
H4bDZjEUJokPJlWv1dQkZCmXcHEuKFCxTZzsepnuykIaK2tr897DL9D1DGS6gaG+JzKNFdbxD3T3
NL5A2AcW9kkhtVyGYqEgiGAkema7jZe0W7zmRG8aT1rBrSlnYhY4Hu8MgYMs3jA3NuVU7Id0fdB4
Ttj/k8XfJoztbiPsxh+gwOv2KsXyhsw1PTtqA9vsBpygjEFhY+DFw4ZO5Uo2f/RBF8AaFyUNQeY0
D/DOoG1C962JhsPxOkepqCAHeXFzuIDFooeYprjULVSVWaVu5i3rWIKx27But3XkJ598LJC38pho
HyfomLo43KWaD9yRvsRwYGdMXNoSH3mck72pBUVpbilBmt7A1C8joeEvFH6NgjGQ8zFRWMOASoM4
a2Y3ZjAHo6YqkU0od4GbBDS6X3eSyeq5zc1a5CJIiwEvHWYl9rx6h0Dh7Siv5DeHCzNe0YyoRfDD
Jt86K2FgB8DWy0RLyUVsLL0NmI38mJWMzBlr/TNC+xGIEEuQGXpVP0OiA79+IX9TLRtqdaein/LI
J1zHigFWQTpoZA+n8U+vkBkIqCbhBZsXYavVVIJuUyTLA4yg1Kez6UTbwJu+q2djc+iXsNLRmdsT
uu9y+RrQgl2W9xZtKMARVklYSYPJdpqsmXj8B+8dDO7NyXt2Zkjj6uOQ0vzebgty2i1RidjkCmx0
nTsJ52liZzV+kpgASqK3RanOLsoUWqQ1pe052ABhzD79B7Yjb4Rgr8YvEHBSsZRfpw2d/aQFoQzc
bWF2NlZzIO0fe8qc+wDOBMBpezgt8S4Q6eqp72ot6cO7HGkSRY3zNUiqQE79Fs0xyFeUAJvbVnUb
cUNi1ME+q4Um8LWz3vhm/nS1hKSki9jCoa3Klr8reLP7jfl4lF4g8uSgD7lBp2rzpOwEMwvTdz5U
ucJOBYQtKLPDF0Z3sX5E8An9XBEKvZ3Nm6jkC1+ZbAxvedi9e6/mHShc8HDshWSTX5aEW3oMU6Fq
iZwE4q4Cjv+1DWU3YvAYqqxB6ZWpWYrnkcuQYbcgOyNopXFCYKJgxzMhef2g+cbUYbiS0wGYpSJD
KVB4cnFdn4InMSnojJx/luMcgZRdTuiiHPXas4MoB1hc/pW3LvkvaTCRO3YmV9zRcQZvP7gw9e+d
fOzgRwI3+XOzJWzp9d/ooBnZQj+7lk9Cq4MkA1uKVT9ANbPbVmrXgS7rPcc3BT60CY/QHGXoyQn5
iqw/HXjWJQdS9PekLpYM2VZmZqQMP4s9xacp/bd41tuTDEllUHLyjqH9mzLGJLZZT7eNmpaDeJPT
qa1OE6ft4dxXTALfrjATkrUWm9N1mow+RrtDIKE7I2B4+7y+fJ4VvWA0GVxLXgOsQbFOkOQbJ+5x
SHgYKp/gn2dXK2Xq6B7eSFoGl2692TbR0MTUfh/mGJ4aXS/x4dtPMAXyvGfn5ouH+VKZXlQ588hP
Ky5AhrzFQUPYLXdWgLnsoZLzIKr1p/7bz6Iu3bw7sjsrt4WsFIR4JGYaL1Cyt4VIsJKzTVPkZmZu
6XsiJQMfxVRBAMZbxnD0nomf0/9GYdOBLR28iwlMXYqCrOnCcKzXL/z0StxoBNplHsI6iROTHLHu
auSgTJTaP1uBKIWve5jxlI/IwaMBFKFHHBQCHEei43+EHIWPIGeDnfjp4dkwhDrrE/5pu+9GG2rL
2WBYg3s/AYq8SCxRgnI3pGSd7QvyiYqFhJRMc9WvHWVoaZTj6oT0V28IXo8ddsSfzxKUylI6YMV6
YKinhwxdQlLUsE0ZIAuxbTZdErVG56HWJU+ZQPoy6Hxf5jlvqbg9lHgMkDQRordqMYGOG0yqJnTg
0MOVzD7BF1tfeAtu8EjPpt4WDXIVUQo5QPYRhPWchfXBjRSpjx1/faoTzpPBZNJ8w+e3BZ42/YuE
GN2izhiQjPX82uV0v0uZ8CnqBGfLhWhuVslcZTvl+lg8bmACGDumhzZk3WDYWbVOOnryGwcbgNjB
TBPXK7EBPhWwC6I+WDDZFhUl2rLMxObb8sR/nQlgPa9vi+u6FlFQYLZiWBo+Oyr7HKUVcMvFXEa4
kasR0bTGFLbUSyYmmIX6hl+IFrocfFyHhVLcuMUwFkM6n2MCVYo24RjuDQgdS86N9NMpOWn8Fdt6
Vyie3DHx20gL5D/43DvWKKUHecVKuGj/Q6xOVXmnzpMLzPEJ7uVeA9v92TpQ20ugVjEK8e/tk/44
9pMUp/ObzMJKY6R8HiiGQJXTR2gE1TSrfZoARIs2UBK0t1V2SYSNBBpToTWGGaiHDq4+Hp76VP2M
mHNqlBtPIFWssEfAeFPFpQmf6r8YXUWF/xcACldQW9qP67UUDe1uaxsGZ/QQ4JZvK52Kk4cRI2/S
Xnu4ElhUNkm1wr4tniLrhkiGrLkqjjSGsU9ft5tVRQRenFs0vRWSXX0IOYXOPk4zOGxbaOKLPpaS
I9K7Q1WA9tZqUXqapJT36WsokTVkRs7qxAWCugQOKNTjQF9TlxK4FdhVqnwyyR3tBWqvT6FSlY9c
MyPrNLxdzQy9IZNbNWBFLGoSUc1SowGKeJE68+SkXhTLW5ildFhGIH+lHSrJEO9OmmnOOHKt7lYi
nrJpEa3DfkZuw+hwYyD+WAza0QNhWDV/4754w3nHdb9sTYdA4RtdBTqKQtRiWvjy+ytLr0ksG/yT
8DBeSxBpmbsujtRk7laGM7MO2P7VHkpt7QODFEDYn0RWE2p7dmHCuPPhBKM1QufqF9L2HexTK+hQ
TQQdnMqgEV9zi9STe+79cZriJqXhFsn63KtTHnccn4zShWRBeBuCqOylmbhVI779URYJc9hcXRO9
W10sx9gM0ZlDVJPpJeaI+RUYU3+BJlREk123+YO6UvkBf4CYyy/KjtHY708pTdldnP/KNJVZm1Yo
ZtWd8/3IHmdQyPO86gUXv60trllAALD5iTm4fqWiF6C/UaXf0MrO8+NzCTA1qK3iR40lXRc/4WFA
1tfObzWpFRoduAKFLuyOSiccBn7CDR2+mICTkO7Fpxy2miBbR2GA+vU4VMr1jExsmBTOyVjPAWTe
W/YQKQba7VgMHKiTQVm2/cfgo7YkQxBmpcxg7s+c90PjBLhysp6FZ3TnSxHXwxwGanjFuK2U3Nxw
ctCWJvVUnakEvrmaqSs0NdEDBrfnekXOruGl8JHKA8mWQHNm+3qBKIxJXv9+A9Vm0xj9LZZ/AMt3
gSatPWbISxCI5a9V3o1dfzWnJd3MiIQlU1MeIS94/R/2VUJ5LOyVbhnc19Ghip2SbOPWRvPhppi6
d3XUdmvrz3xZsz93JHN29XziKXyC8x9j21hZ3cjWh4FiO/5Vsk9pgWRJ2zP98BHOEy+0O/GRO3aY
DkO0NAhSatyWh2IJQRCgkBkH6vk/8EQRZeA4JX9hATp+GBvZGIWi9RwlAuZADfPDYOg/ZEfY1alU
r6EL/9kLMFp6oekrDeh3EOT+tslkQWfMAPgfPCHvkDK0jSfKid+b+i22wqlowIz2NbNqPsjq4vvD
mdxg8/p88h4vhl65wbTWGxOZRwoysPDtEQn+KvOPi3zF+54stP+g1tNpllKAZivrbqXbjsQ2n0+9
+Kbi4sVXxEahz/CYN3+HCIyApzdjpIBJ4bZidtaOU1x4Aym8c//V8Va3/WbHywZvVlQaG5CbwhlR
cNH888YyNJFd6xgEOu+OTGOXJx686NyH+r4jY2D/MCUgFNPOxuUiYBum3BtJwVeubFHnGTyUKSNQ
VICgyk03lRHdSKKcsZB+3YDiSQlvtXp6xmXiogWhqsTCd9xAcY3FfbYG2QM4h3ysxS7LPqdF/egr
KdSCLXrXwwUrqsJjDbZTu4pT5w8sYH+wih98TpJXuBxFhhy77dI8mGdwdCXCFrypPh6aIsnKCbpL
piHHLXcblgrj4xurrPt5oVB2aDdnH7h3iOoVSgYgMUW2CRuI9dOmqFyLA1Cz/ons7qyNkgjNgUZ0
AKkV88rf+my+fY+j88pX8nUxeNaAB63fb0kp/ZZPxqqD2FbuDSRtCu8wbuEdqCHMZjezs/arciI0
Thpu1GjsoEJ2kCnK8srHD5e6LrB32/A9xoAfaMa4pFQ/2R4nRZ2s98Fcf8iMZhRwhsH2bjZMRaYv
Dv2f0AW+OSumkWZNC7z+WD6V1ilg7/y2otLKz0DsViDdI2NkaOfcsV4KlU6odH8X9XWyzyUxmm4/
v/SIp+PxUAG1m1QgMANuvVI7IraFFb1S4ES4A3fDH3F7hloMZw69nfD8LfT28zS5jaDNqtoppyjK
7ias/1coQQw76MADVTeqh2WngwOtAqu7VzmZ7sJB7DN00bfzDFp2D7+vZsMzD41oy0KDyMEe4aqo
V3ok9lZJ8wxtiqkREUxo6Mp1eUu76ksZ4LgSgDmynshrrsYPGLpAj3L18IclLOeeZhXZak7UcGSh
ZrVnqPnaIyVMSjs4YcnLvZuskMVoKJLnxtF1FcNtLwuJDwGsXBKg/rI3SODIpUQv7YvnD6c0AqEv
53bsjZGfAMliw5iU+MKQHlYQLCSaH0r9oLDIK0Vrb13+pFwpJhTDadu3CY87a3daEs0mohR5cr63
1iD94ys/wnEQlHl6aomVwi3Bu0/zCuZLBCzzencadrOm8mHY9I1F7XR2DMG/E6SeAjwZ2x3zSdD8
tICLFa6Pz+pRk3E7vDJvlq5Z0l0im/2iktKfoeorOnYtBUoSkF9o4QTqOFRrSxpYUHJkspu52zN+
Uz9V3yAku/IJD9G0wamCR5z7EqL+uZW2sfH69Boy45STYTmStT7B+gapx8M3QlO7F6y+D8ZmW9x8
R/QehA5byEtcIFYcZyJ+f3IW1GLRCSWT1d/3QcytZUuOc2bJuda1G3m3KoEibZ8zRQH26mBBuya/
bcAiLhHOIT1/5mRUoDKdmVxf2F/X+ZQVgXlgUIOLj7G4Zd3DAiMLVZ62N17XLqvhKCx+WeiLLcPt
3kzK4RsAoRMkXYurCwEqICpD6SFEDWhrB3BnCz/Qr1rU/vjHwC2kjJNgAk1fnxhbSnvNyEKBu3SU
r+arR7LzKApi/GC3sAbteWe1kjYA5AZdxtEMY8IlOBK4d0e0FUShv2MbC78s3vGa11TdDeWAh7c4
wiefwpoetGaSi/blnJDrHhhsi51hLjFmHvSaaeg+7g3ZPmSs0B6cyC4oqii80GKwA02G+75Z8Rgt
/KFSHLeT/0CIzecVvV5bU8glDlzoK1qEc0PIYv9O0oFeeyeyO74iUf/efoVFWNH/MVNtDhiaToN/
17ykx70EwzAn/w2djyimRB/drVzZX5dhB5I/v1I/pibhQvc+KDx8PSRExAiGJZW8NKFiPgKnCqRd
2dzJthapejpz1MzpqKE+yPnGr4WFb8AeSIR/g7rwmS7qsxY87xB5E1sG6h7or8AhTWjEEdCokCBe
an9R99Aj6B24PtH/d2C9a7mLfKVl7njcR3R6Goa2+xoWEDqa4kDep8U2eIDNROid0ID9C+2oUQry
oXFRixMaBZ0BOlwP4W5j5gBgvmRDlPchh+x6u+qnY9jb9UJIf+4bR+DQ+xbyVlizLYvc96L4lKVa
mM450DytY6oBRkatQOu54iNKbnyHW7xIkxY6mw9HhbCXIof2Ad8Y+D23WcdbORSh7tGMuSavvO01
zjyG5lIh9uXJtvl9SYAFf1AesxDYMtvzMsORl5kULY+WSfXNYCotpJXeoUJDD0PWtVxtbN/fS+en
4uJD9jBCHNt5yU/zp3Wro6zjIOfNhFeEAPr/W7YHZm1FjpkoWsv1D7IlkjiB59VVnHHFx3HBfKVF
NIgARIbn2RvqCdcrSqrqnmHpNlHgBddLlxY9/hBxpmeB/bfoSKrCHj1Bgk+HRi2KuTCXu+xXgjmV
1QhbSoPl0M3kpJ2wQAw4b9dP2lMdwzrCCahgcHkNt64N+X9NhvWgO2QQps7ZHBnfSqXae9T+zUjj
uP6CvJhHQ8zycDWJUWwqDMbpr4g+ZtZyf3JJwh6LgyQ9ktBcZQ2H3FqBqBzSuHnxt67322jfR4jN
Gv0WNM2pvSodW/HBtzop4gSvYifBUkZRll76blvLjYncoA+h2eXtgJkvQfaUBM8PgOXZyjqpbdql
F4FFYIxYRlevPUA4LzGF5TdM7fF18ZvwmdD8dt8S4WqF+3zq1ftVGX603XpwsrWC5orpjf88jPOh
0SvbBpue7kmoYMUq+URFb23cEisLl8vIEHjxrFgDX7mkRKGuEcIs3bQe3kBh9qxyRZ/D8eaBDZmi
NQxNaNyMyMLmNwdZjMdlY7O2CzD+apry46ar6rtB3+c0fg3ghkws1YsL+z4O70zLGpeCI/EDHhxz
KmY/3BZK9AWEVshDf02ZzvolNhnodMF9sgv5ASOxl45/B+VH1XO8Wzz3sLa8wiPnxdTRRcqkt5As
Zfb6ZLF8OZtsFJWH5NarqOfjT6tEr3MR2is360kCXyS7qDjxhIRH3v6tYTDgcMfv3VWZ1vuXMxtK
SRnX0cFDUAmkOjazI4c+N9re7rAd/3gapV7X9TbibylvFy7dKeDfhHZTeborWTn72p0q6mG9lEB1
FVxc87UjPfbRSkJ2AqsENckL0rxjKipsnYZ6qDQJIBGQ1YC4zq7GSjpy5hFiPWis8EEo4ki3SBjh
zFuH+CsJ/WapUG1agONqOloY4IWx2ZPXSDX6mdf9mErLxb8ssqLrWEWP15HtDCGdMEsmnZMUsK0+
14w9bqXsHeWKJdT4EggZEUPdUzigMGSWAixtBPp9C844Ju/hYwy6zBswdFiuN3Ym0Hi4QtIiOVKG
tCI0DKe/lL7xHXURrwsOdmmYUEdXi9oRTIipVKENR/d1KjAi4/JT98Qb8cNeNJ0xzYbpSxCWDib3
zPpU0Zo3Kyh04VUUPbsIoQ1952q9hoAk6sLBeFFvp/TRKJAPFlfh1KlARyFnWaT5k0/Lvzd347DZ
Agncy1Q5gAOsN6aIXdT1Xbqi0ISZd3/fjk6rZHehOZ6NLWTA0oVHkgLFbU1iocuV5ehABqHflsff
MIU5ZtHjtYtvwpg++R2FvK2SDQltBVtx2SdRKT//1K8h6YQF0YFScq6oGVZdkNB0RxD0gOTnuRqd
zGInkyxUFyW1f/vXiYeYdbeLIvyZkeTmq7OM3K5JDtSKMDPBkPsrXJfg5JjIr7K+mpWuuJ4fyT8X
9lf3i5xYsNar7FFDtShttWjeFqsyzB/gJXlo7a355SRu++BEer6Nwgs9XsdqlofK2v6d8qWxgedM
MvHT85mlRgCekEr+r3NAJnqwQDDG6wxDeGxFVb0NyXOCC32tQIbfeDIetrHj9aUgJuBakeS1pQvX
yeaf3IpfBp3LFDLDCICWTQuH4c/AwRejmRpR2hcF2+4gT028P39nMlAviyLh82sDS1VadNX7hq0q
bMc5A4IMUMbOdKV0EEtNw/cMzl6X50FCldvMEvdh5ab1gLnQpnI+RkeZOAXq3N8GkPB/DrH6ZuOZ
eWESd3qlVV3Vz/tXHVruSrgvQhJ3VIK8AsS960Kif/8ivb9rcEVR68Cc9Gy2LNM/wKVDzDXcGmed
2alZb1+zzKZfRMtTLSb+w0f6ipMbNDa9F4Q4pTC4oaWFIN2X57lqGBI6Vvu3uKcthghEksa0ukUz
9Lj9SLuXU4hgGMM8C19K7lfGGPMT8E7mCfdz1bJ5wwZl6A5kuhzOaR1BbLwWXeVQLoUEC/wFBalv
vLu6vKABXM1X054hxnGL22xceziYZWDxA75y9zWAg0AOpRp0K4UCqiidyslNt3ZCgl9TAtXHvRHS
FNgQrx9R8UE5WSlzddSSoq1K2pyuInZfhcsvheWZD0vfW2iMTx487mfAQsTycd7FZTab7HJpymgI
G1qcQIgNpaWSO/uvxtnlOWznCG0NImTSSfoCSNTsAvarXAJTqaaLqVBaIuNzYprP3WD0Vw3YHBgg
AtjFtc1SWu44MGaHuvB6yQLsZpb3m7d31f4b37dQYddgs4Djq3/6cX4YrjYatcoNCWYcvDUvj/oU
pd0WcNWtxNCpIxHUpbZ5ca90BNmvIaKyV1l/m5nnVTuzqSeFdLWVw6gfJxXWA8Mhz6M4nNcjF9RX
E6DMuRfS9Ifm74ztCZlkcB4Nmi+jvUphqRhS/OaFW9GVSKZS7QwzOv4ZOOrk6Jw4Zme3Ecbe+44u
5906mPtwPjgu4/fFORKPxICtI6STBdg2y+Go31arLfWzqYpA/eohT7VD0jxfKpMDnopC682hvZtq
aCmxHt9uJDqm45cwU2gu38UcprTyoaJ32dBzXFCRRLQAT2nwzn08279C0+PBcILVnRZmzqwRNi3U
tB5mR4xslSDaoVeEptaGSAgbzEfWTIDy6TdfN3zKm8cafqhvutRlfHO9ZF5Vw2aNYM0Y01E4YOnp
94b7FAkJ+nYTgXwtPLOOJvT2TB9cBivlf8iCIKlsKq25k05zyxI0aMcaLImUQhqtRLt3xA2V+EVY
h3mOE9ThebNPyd+5hfralBN1lvv84+MH0l83ndIDPu9cKtWEfStk36gd3XvhRsz1ZaQuEmkHkCp0
GdEe1uATVkpkzRHrHqUNUmNG2deGNudzACkT+W6mjM/R7kPwrer21RoIWjxzP9SiK3kLGJAJQhrN
CMvPdY9HVHdYA1xQLabE4BiVTSqydaX41F7LhJsmuoupwI+JDqi/N8PL5Bsv0m5V5u2d8zlksaFF
ceTRrTCx7fJY5TFsUB77bUVp0+nNUcdKUTeHJAuxdd14mVwX9gnLfN/JbS8DCPm+xbrupecWzdom
lxsoWF2yqsfBwY455J4a++WMuG2sT1cujEJmpabe/T4CsNEbZHOCMn3MsvnaNQgsvVTGMhKD1omP
hguGCAEAwOvscoym1wkfTYHpicC/9vMFgS/jrcWK/TzIR/x0rHC7uZdlFykenFIzQY00cnNttloP
Q5hr9FO24cUaDLOx1O9OHL8y2QltrgabP1q6TAc3UrIHa+Kr9jeL8e4oln1/01E7NFnKSebvx+ZO
ss+QtEeUFQccIeSt/hL6YFj9wUN/6c6b+qJPQrWQQYite5qwwJaHklGKWkZWLDmIQJdx6WgSHpU1
LS7IYUNE/1hCoPxAHQ5twjHBrG4uV1KOYIGX3MHD+tPnzmFLn55d8n+/r/b/QUk6rhJ/9QNpuzT9
FV+Mv28bbY7KqyM2WoRIik5Q/GC61XJwE06Nrrry5tHRgoF7e/3QJWvsLuug+fZHwG8gcr3VoHxR
krTupFFPd9UkjJy2tUPgbS+/P4rnbjCnwCFVowYwTZ9WvO2ongYRw6CEAPKmrngCG5lvBOLeZ+4e
2F8+t9Mm9tBpIuc1LmUyvT2JcLUmcOgrb0Xw5CvjaCCl0IE4r2j2KQGYb+htL/hNAhrh8K8CyPf0
uNJbbJU3rH4weMjRc/IggAeYul7ZwDAxtJSb/jru4F8TyPdYNu6LDwRbje6/danqPcnPT+4y64RV
gOjhaCYsPb+CEERh2Itx1oRWhuKJZ/qHbHCBNFFbuu3v8XHZ3YXkYA75lAe/3FbNlYh7oe+6l0Nq
q/lfORkw60WaXUNzTv3MgTnQpnWGqVQhEXXpqN2LOMqktRaWmP2DjKAcBh95kE/kUdu/HlaJ58kw
EwMARVkVdiV3GriLRKptL/5xMdZTt0ljihhJbr3Rp3Ne8mmzuZpY624CSQIX3SmR+JW8bo3SB5Yd
j/JKsF2hTpf4p106bwoK0NHyBPRowiTqVcbaIuEBRjpdH3+T57saHJsUCDQyPEOTud6JpFbliIW0
kbZrTPqYkvQmayzVrHi5GTx5rHVz1KCjlPzDe8aHl4KHXGxXjekZvLoGnMEpeK+L57MepHMP6C2L
3ww9Hoj0/Wqdjm7fZlxvAni2BfSSN7a+1haYLn2G9eD96YVfYk3XLMT69v1XRgf9bYiwVFYewEeC
h6mKQrslLgCM9q7l7pGhSf+CSisgaN7caKYBAdqp47oAtOs1nhFoz5LRZZMsc0+kJ8fkMpydCYIC
IT0Vjvf1TvU2XioUPlChAF4Py+iDjUexZKw5zz9LADVmPlL5kncZk48kNKB6epzF5XJSA/F/BJ58
BV3r+RYRJwZvPznYDy6rV8bPSwo3gXRfQSJyoMcSleMgBrCnak+5Vjs6j95oMXGO9KYoWt5h5BSE
APsNAATw8CARds6DpoKWMhZHCZGYL5q4m+V+ryHDUZHn2YTJcsGw5gXTjVWO+fKJWWvPpfi4snG1
5Q7YeXr8LBtAQvAn9CAya3bprQXB3Cbvn8XAGq4c4a4LmcDvPoIn9aaDkz3d765oN4Jb92ksytEi
wsccm74paBf2UVAaFd8y/Gj0feleUokk/Otru38tqJ5H/ZCp4WrQQ/A2wZCPNhJbvkOStXSA/RyC
CQYNCwlGOXvVe/wps099HfUZsFSkt0EjQbdGVYX+i+F9K3EcuGX+SJH50R27HrlhBOONdtO0Bfim
yr4JyiBhqhdI3cCx1l3vjMdJop4b3ZrmWggKD+/PX1kl6t5a3kDhwBjDRrRjQ0RAr3Q5KQuTdrzP
HpBki7CfGbCy7mZ9U3tVBBss6O/RSNZaYBOBGdxItwFWVqbgjv0+ODvuxaLe4NfhFzG79Mmk2M2M
7KlZdyIBqbtzWHPN4RYiFY6Q74mY48Tg87K5xGz5UmtYaezCYsC3sUTqN7sQPTCKR93c9PqsfIzo
7EmPamg8muLwbrVgX3MYOlcg3/2Y6mEs2BmRt6l8LaQ8fIs4DtiD7cuFBnqEjPs6rkIgEyIT8yne
p5bU5eYV3+LYmfbgS2DnPRJag8Eki3mLWtyM5G4odtol4YidBhZFqqxphBKw8u0JJJuVsjFzqe0R
vMRuqoLwVu7z2xz/z90jIeNJs2xKrzlxMjvKhBl2imrMpc4TCVuAW5c0wsQorSJCHifIQKP1w+kV
BN35OH1GGf6n0xbrnU6pq5sBedXIdQ1+TW+vIlfMcryyoC0oMBDx8RNxT8mTgLGHc9Wbggw50wiH
OYzAcLpf/upPTNUXP5uWcXMG6Mx6MSU674f1C6+dt5SxWkGijKDrXCKnCTeuerC3BZ1vhpCnwZVR
GezsRDVckNEM8A2/Kjbxut2WQILCEWIutAyGY4Yu913TIQRUXjktoCT0ABfDnd0NTSe1yQocQeyv
WKvr63CKPYcMYlRs7CfpTXqrDTTtx7vMGm1EfLEY3PFnVniCu89USIJMQAd0tJbQVFKpyR4PjD5m
uwYjKkpTuvGddI56ykfr7JAss8vkSEcVR53tVQSoaNw5B392FnaTQLcOQdgWz1QC47e708V/Vzsn
D8qvHYzsWXsqCcqKoN4l7LLGiTG4DBYB46s6FuNKWdSBNl72deQYZVCnm23DuXTkeOhxrnWuMG+q
njZRqOq3zEB1McL0IYPySZXwfkhGzQjtSNYhy/4yOS69lZzyJNlVHxgTffSEx6Bg5f82aMMPOKRu
0t0dsFczDZIuhuJ0UUhm9eGsw8PXp13VZN9n3y2vsDF+p9dvmjy4hYmFh191ihK2SBQV485jhK/A
sw2Kp2u2NwpGUZoyjEygJfUrLPZvd39aRWJOkedXV3+ul3fyvJJ1OA8YwTrdHggBPQc5pA1kzuJs
G4CpjQb5J2jzsbjuS/IP2LCXF2bsfoCNnXDMJ041WSMJjHnN19lQh5eITiCzxtEhTdV7nU0jLcW5
4b/mhGZP5AIc06zrSrgY6algg0T4XS5KFqNNjk0yqRdEVtJqaLFGlPWllkzljiMDX0wteB96UZ8o
bmJPQC6MZT+fuXLgwLqgw8f0+CAqkTLlZn2pxYADBSPvw6046csYUmfeEhy1iR0NR2atVPJnatoB
+5DEbD755R9vtbfT9ilFY0NpUQxQD1MAcJ8DmbAxehLpLdcJn7ai+G1S+NxlMi1CcGGtqksqndHP
NFkcx4c54B0PONdAn4j1q510iNBVtruMpG2WDrlQGPQUEWJzcDDXERuJctBwycZ5RBYyBLyk3uOm
aLrz3QRyBRFjkMNkY98mLnCisEC/3izmGYToB3bzrNImrZqI90x1EeJ13sK3Mf+qaBtEddATvcAt
pORYVfYm0PjFKibsab0EnDxgbF8dVLir+ASf+l/Gyoo1iCZPZiMRRFIKuLi/dD+MsWV+guMYbsmZ
F6lLClO6yxS+D6I0+VTFqg+1xxQRYH3XvorMvyzG1lzsI3fCMxoIt+fCoCRsAzKY3L5Tb0LC9XNc
Tz2BCOCqypCrRJsVVE1IjSZD6ww9DQ+6hVn8bu8u9pR684isJnP8KaAXN0+434ll4jHQs8hY6uve
gbr2rdtrxrZV9UC70AbYXx3nIStVKwJRa16vdLlxvza+OBJQvmHyXlbN9d5Wbz7DxKlSzMfg0GHw
gSz74fM8VhJSqn36C7sLdXuZeVtIPnOt41SVnCDlLrgC3w4uz65vD/xNnJ8nmcd00mBYwq9Cfd0X
NadlKBT2W+uQph6NnZ8n8kN8jS9X7ND9PZLJFC0rIYstSrsGokjjUuT2qopycwkoUEcaf4aTZC7t
FIo8mAL871BMk29g/5t41zzsWBTZJjTwibV7PMKhmIidCMVMzCjlE6lpzSbFzPB+XG4Wa5xZK4/n
90WVNzy1Pfyp+Qfr9C8vt2IiaWqlcOlXYVUPDyXSZM2uP8Avgff5EOT1xFJZ3bI2UwkRUoVaAhhH
ZMXb3InYs2y9C/KIoTtAYS7q3ysaalEQ2jQslxDmEgAM4Fk+J+mbxqG82mhaEl3/575whr71y4oN
nw7e72DgBg5x9Jom03aQqw+XjL3v/JzYE2EU2dV9WH9O10bo1WKrdJBp6RHTGiAPK6p7umo0w++Z
l0xfSIax1qTD9Cd5SC+D7Jz2qbbDjkmZdwA9rGrVlY9kG4SjXKRsiBnMLluOy8L0WBFkIiVTdD10
BUNjRhiGcYYZrSAcG2HZ7myaNNUHpGr+gpdxLbFFhDd6/Lf9vqfrcKz0hW0mRSeXXH6xco8HqMc6
J2UbgoM3sE18lKt3V6/Lvy3PRq/1WSWdsa7AoCNgSBEpKc5fPZ79k1YLPGBWm8kQ8dJgNJR3GsVU
4Cw51SU5IhTEJfFF2D+HK2iPTiPqpBzoPZGTOeIX+FevOwREedNvwtu6Kl50+4WOY+9nOOh9oLaf
ZomsahJZyNxtS51YeA98uQ7RHsTRH+g3kKXayrxUfZUFysPS4yacPA+N9fmMyQ9cxPkwChZD8agV
8MIbkuf/RhPUcLiM0F2EeqZBqvmP8eyCsKcS6hTSAGAvrrR2V01oEgd+M3m7wRNyPPWsutpIyItJ
t4vQZ4DbpvEAGcOyGYey0XG2vzsopWPts/PS8Fy79G24QyNISyLMWUK5g1gdoZN36cO8ZZroAdm7
odrwTy9zPubNomXXVB7gMZQcB1ZdqgkXqjpfr2PMbiE1OKS0jfRIGVexUQu87HHicho8LlxqgfC7
PCmiSlbenMUi+/cK4rtXwCBUpeCDLqRKHJM4ET91g6hd7HaaijVUKs+PZnpm0K5jvpr4q8DQp7bL
1ZZqX9VzvBLOt0W5kJAEDZfbk6w8tiOZUpGmo3/jcYrfITo75hgRQ9iokasmp9yyzFLT35fWlHtT
Sis6fsKTHQrGWN7LBi4dHh60VFKDp/ss2zYP3KGuTrRH92awjv2SbK9ngwDjbxx8+37hXCVeopDO
pG5AmrnsK37UzLd9k/X50hoHTHRNUqMe07Qk18b3XeD4YzA746UOmNzV0HNV1sXGGA/pOrtSPMMt
6tJKdPmKtq5GyfihgbKlM+uVy0t9fzPhV4tvicOVB/lCQIsPvAg+dwunx5SMRHajX15H8v5imitZ
mK0npcLI8mrgQe6cQqghuyK+hV8ht/8AK2V3luTH+2kbTLB0G3viEneSqJcqVSlHXqYfF35Y+TPg
Bcz1Ap71t7nTdPukMhcbB7hxEc9AJ4lwjNt0CYbiPZON0wh5pZ7CE4pghJu8R0APd3rUyyUMYNbl
1m2nU6+YKXavIWGQvXgkTANehWZ/CMrjcJfZOJlLAqoztInmrbVmnkBvPTNLEOQ0hZB/xD7YH6z1
MGJzJTEbWMx8lSv5DyG/IsIPDYGa38aZoIBBzCD2tr1v4rOfb+81EoERvIVipVPs3IA2luwlg+lP
U/VSX3WWT3EE4RBfHfS5a8tUIbYMCDqPCf+Sw5AHHfLJnVQg55v5/KsZTHghJEwlzMcJYjf10zhJ
PQJDFQRaiFNY201j7StQTNcatGvuyyOV10DAHWui28CFCadxpTSDWS1xdAb61oQFKcfWuaTsmy/r
c04Xpom4csPgvY6lisCdH7biRWpmB4w78uLbeyEKzBZDfy1J1Z1JVygrRXKgH49YeTOkBXIGCOG1
H0JjG7bCwxfqoEXNF/Q3XRByDrQoEdPe9Fi3avR9p389ZLwHXM6cUOKLzofngK5NE3yQXnyEGFSX
Zal+5mqJazgJX1KXcEgsn1rG1YMj/Xvdu/b1dL2N0AiNga+8xVaTJ6xFMwigXzGbPgx+deJM40o8
It/NVmw8osbRyWcqW9qxmG/HpShInkpuh0fWDVnC6aB19Y4ya/eboQE+5ctQVzj3Amr2dexE9SfQ
qFjulrOz7eMmKSClRTIjRr+B4DIImc9mZoEymVWXeCnjkwCsIBfsXKblpfGGciQT/7419RwHFjfl
lzMOMHhQhSYeNPkaFT4MASDxJiJ73pHKlDy8eZRZakMJqHRRcL3VxM/wIO6g9AKWYzgFnzSNE/6x
3eFU/8NkUdvOd6rijYT1WBDdvYdXW/ChdChdoPCstfWsPRXBU3bwSZE6+3B64UF7NS7Fcl21+Qz9
+KTWywKSfluaQ82W3FO4b1TXHP/LW1fCuIuZydJcWq2z3BWKLnDDq+lqje9jbaVwucLJvTTqx80a
LY7eyoysd1cBCC0Cr5IJasKFck0wUfjxISNRSF0ld4jg3EEkJhZwIhVovlPEkLSfDyCYQOJvWlHS
jSTknGXUqJAREtaFnOzuO83NcSo151oS8ISf8Hc/oKvUlI7+dqQjRh7MIGos4UVwrHZ0QUGEyOPd
9PcExlXlyZSUQUcJLVADu1SsCrQhU35ak9Pq66dMKVXDEbW5QbNwqRycozObqWEqEKl7rttcoH7U
APSfJIAhRA1tRbbOAjHaQDmYqIvJIZ5ZBDgg+OvTimof6o1nqht46Sh4DhIBEhwJi/Azui/2AfeL
2/ib4/XJD64/hjsM3ad74yRlk+Sy52cx7si8PLjpU+TZTuWU/I6R5LfGoY//1qNJsXmbOyY+QYCk
y+NFVUiz60hR+7aGZilbnnsyv+CFVSrm7ZxbrYopiw5S2rbxboyXKKtoo5TdpMswaL98YVvIxCND
nBl8IFc8axQZev7MnlhiIXXAPajVHkf5NQpYG6T7+u7CAU7tpxdMeihJXdPqRUHKkaaFxzTaZK8z
4dsqtJZA4q6OU+00q5sJg7ipJY0SUqQg4comlNZ2hBaHjRFZUzItIxF+WM5x+ifwW75hAv3pYc8C
5ZPKZ20EBt1iVhr7blgG01JCO91K3ZTWGTxNsOTaAGTJX2nA79qJ2yy6bo6b1g393BEDkphnE4dh
8a7BbPHyad/yiuSwN+BU5siYjzJlPlzwpTaw8zH2sUEy828nyZP4tYnfB/Z4rbZhDf7JtaoLvGVi
egxGFrTiQ0LiqryVSRQZBY83K/SpE52iHbdJjVUoYaZXRl6I2W6ketsz2QAg6bRim9Xb3rw55qph
b8z5fb5QCx4RGdlhF8mOvjb2EFhTkmNmJo9g2FI6zmMSKolRL+NMdZL5yc8Hy2GGUnon3kE30O6D
AcS27pj5f3naYw5k0g8AbPPDV7J69I5YRvI7YsfUnKF7yuHMf80cB+KhvT235wIrZdaFuL38MfHJ
lMJQYqrgC0guZCBEOr22Xn8rC/aZJcqdwsOSkCnH491ZBMuU4BVmJ14RwLI0pjQ01oCcnVRAyI/U
h36DFJ/7kc6Bs0WJhbeBkfRzFoa1jShrPKLhp3S5WffhnUDlhVY+HMC1hrv+uEg/YR/gJ1SuVCsL
U0w3QPYpnpEYydF+fwCgpczrLp7GX2HxuUy8E5QTVkFFeV0Zxp6+qV5vYJplBzuevQucFYilJ4M/
MKGdlmPBfUi9rXn0ZOhqC0foFMyw/gJElDzz7tAwKR/oopfwf7Iqlfslspz+kCx1GgllpteaCPIJ
UvPtEep0vXLKkiyxUFMwRQL4ltvtMoMBJl92GgJNbl+o7RtmxubJ3JkP7aS/L14WqhDkMgM8uzRf
ioE60tzm0VdWxPjLJy2AhqpfO1CiY9mxYY7LMhZKUGEdi724X/IJymkECs6EDoi2/apLGginrD7l
c7Bh10HgaTyY2tPxjhkXL/0KilEJjvSKdXrHmSIORxFl+Jk9W/GnjOyofD8o0OJLKbEMq3uPtsub
+rbuhtLj5V5pXl0ck5WmqHQw4D3aNfRzYe1rgzkcwcTGcx2i5uDh/jB1Iw1gvheJ41UOCOT1v8AP
N3hszrNniAbpVwTo5BVOtv8pqmCo/y6nHsrKDOqO7+sTpOH4xNyC/PEPmSw9MmcInd++ZifE8153
5tPM46rzN+KByR1eUqPMRaFlkaX7XIPUBxvQGYSIsGyNxGt3zROVzpfmdj7rChx7foND+4T6RBIZ
Y7RBQELdpZAgCkkbdUm7yLsWBk8x5yUl9lFVTkppMq0KPduzKySQMgRHQ4v57Ji+gkq+K6aYgZ84
T4Z0o/a8tXirYZoHdptwAF6lf5RRwBBd3qjSH4WFjuOjqo+t48/gDfeDKWUcs9DhN8YOP1gyCZ4x
OX/Xt1VIeTpTMMOVNAt3EW7VOYoJBmChnUF9k2BkUo63UxcTeDHsq3RPDDjhD0vdKDq2wXBYskA1
em+IeiRxBZCN3KYqqeI2tks8x2MLq8UTgSgZMCq1o+1TySxnh3BNPhR3VGniDj4hozkhQyxFd762
yp+XAhKbPYiGG8JWW2d4zf2KcEoL2uSXGHnRuiakyCCoBs8EZpfGkHJXyjz54uJEmCcpRxi1KKt4
R+cLjbiItWlwce5wDCpZVpLh9u6fU+fUkUXFFfHJc9YcTKNtkKiP79Ca7a8bWqxnwd9EyG9HQaGf
swHB+UNJOcrWacO8LrL2SZH2Mrl8vH6ZwagE95nmyu5rXTY63UT95qGuL6TIZvU8RRKhLaUvM0Ed
1KpW+OYhOjsGonOT+T7F6GlftRhlgUdqt5fOksPqW4e8tnoPOv0BNaR7FOE15eGoKRWGTaSV564g
lc0Q4X5S2+XQXSrh2eRNaA1Shr2q4+YqDfte5f2niQ7rwG1gEmSMisqwcZi/+v6iUcgsDb1LOgN6
HUAzwwEWgevXV70C4hAAe8kD1X9GSAwpyuSQR5kanPVZUxYR0zoHEdH8VGyVQzsdPs1QcYsrdWOD
ydZf5+OQ8U4DJRrfo/UuebqbHf/5lyCrmcLlzXp+sm1MgEIibXbPbEls2c9Sa9Xh4a2M9OpqurFg
A856qXwjUAWHxILV6DRGvqMCM+YeDnUvMXC+FkMHryUNosggF428F9xIC5A7ET0jvAZk8PtEIhLU
V9rTDQDyswAm/IRoxDcAVLQkUVk1Ih9czGR6fWsEyhCALNclcFdSv1zGbwThqLMAPzJ35BbXOiiL
lIvdJb8UUkHhswnGLeNCiO7lJBPbPzrx8PT1x4neuvPp05fBYUtyIpvh7//wgy7xUJXVhTsxWJ9n
1MVcBTkOOR8pG8FeTp0W999gTkEyRPtiUgHUNM8eXZ/Hw9BFKnRHEGgjWE38Qots3lExM/JtOK9K
kn4ZuYhkGX6lrdgb+1sWwqQLYgWtmKCN0W50kKgOjstYga3hJZfr1Xek9vuArutpkF1F6OvymOpS
bmABED20JislxnRN9FM81zkhKqLz2n1Diq8GXmmx77Z0qQDe5iF4TuytUbLQ5P6bMWHLTrwBo/UR
qTG6MG1irzy8R514Yhf4Hw5vEqQdoWWtHTkBykNxOawurg3/KqiqdKgjSpxIk65MG9pV1i68e7XS
Mi76HnY9mDHPE3XYWRBcGnqtAnCdRyx/obsWQZctqmfCakxVnjpopa+2MbzvS7E9j+764kz0YjeY
UmxMay5zDxhGM+7ytkcp815KAXQgnhIsdgST3/xX3fvwjnimww2HtMHGEmco58LWMUaQqUPtZJrY
YkmDxOg3jJy3OjPDE4JeJvHHAslyrRtngz7YG8Wi7fmWOz7O3ky5l6RXIPlXHk59q4Xd8cRhGbVN
t4oJ1dAUXd/TNsDwnhVNUiKmsWypIBH2VMMflsYplbR3EextdwYIR9usTfSWrE0pd5t8a/d8o4tE
880eHZ2YXr8t1KLa4/d0klfus0IuDAWqPRxGmX9ECgE8jvpQAti0sckhfr43lfpeurxKjuLWJ8Zo
SJudQo46+I/jwh7mmtBrEFlWafdmgNMwYCf9GHuG9OeFm33xzxE3rPMwjL+fprohklHvqeledZ2v
HpiN9jufHJNFNW7Cmvj476doM7WSX+1+ZboaGij4VZIh4pSXS3XcPtkFlCCjZeHkvfUKClRhfAsd
eZIyS5b0VOyo4t7OD9RWO+MpRQiWXoFtPfbYgfpccSKEnkwQjIp3KQPMI9KNuCtgqYDW4b7tVfQk
0MLohSRaHB2tc5UdY7PHqqAHDdkIVYbVbFIMg4cqu9KAQdTWowqhAAmjQanVNhsgkL7woXU75lST
tWm3CrNaGCoZMpyzCs+sAFIvtXz+kjKzdDMXMgAloe8FJAEmxE5ObANwMicmvrQMhuzPLi8NCFOh
dl9g41yr1vIA8tCdm0Ff5siL/L8pM45wyHfdQQ5QvsSYmuXZJ73IG8pAteijJHaaG8esWQwRwxTm
+1pFx6TX0NR/HRLrINlWf1KkSs311N2W2jTE1rhfX/jyUM/43zAIt5zaDSgUGkUPEybXtTaPgJMS
YQB+BttQT/Hl8ydtu8xEu/U/4pO+vtNVrEvvELAmDAiz6tirJRrf5VKUzzvK+JRp0DpbaLwI1pj7
GGndm7/YYmqmBRjk3EIIe40QGFAlpas35NRGU6LBNnnOI91S0JruACqcB7pUd4NHYEkMBW4xwlay
qrFT63HDXgxzPSMGgJhpw7rA4m/Bdqa3IrJZRSoav4IORpdMSNiKvpAm6P/XYJVu8pt5hKmPgJUH
Q5fGXt0KOKuAwiYg4vJVaPNZSV7koteCAfu4MnvdUyzlcuewRV6U+Di1xPVRunsX469zvEgGbhGp
ukGq28ELuwV22wYGdSGWZTAGr0l9qN4UuaBi8zhEpaBbp+6qbu9li3xc/BLEjbTLIvTMYusJSwea
PW3e8kfUMB1LCWw/5OGPjNQKETeyw71ay2BCxC+C5mrdFcxnEZgpmhVGgMs4L6yh3sSqKUuY2Wz3
5n28VcF08/k6e/hIXO3Nlt3KhRw8ej6JY0YD2FlB3a+kYxc+x+zfTpvKgntwVQ4Z7hay04aDJj/M
EMsA7NKcph/2aMq6SH+3yJ4JdEjzFzYoVNY5Qzu7XRglxyGXJp8bFmr2F+T3YhwJkQSFXIRsmmKa
nqV4f+dRcP9YppX2dxGf6usbXZz/Asb8Mr6EhXCANL1TzQfFbEh8M1pXotpfZXI3XYG/mZhRLsj0
xg2QGq5Q/wJ7BFEMG9xc8y6AEPixDsxsakYIkqHLn4fKAyOvcPMYcpYrqfqLrEAvKcP61yRnvngu
IWNk6l1Nuo5aK5/7HBh62K5iCyraIcZck1Pd28itsysAq7VJwc5gSo9Sk/mzVa51lre2za2E5IEk
G9bTfOsxMIRpRzyWOMv8heTOuscSQCP8ky2EqpNS5kpHMRai+6jL20k/Ue0upz1k6gCpGZ3j8xxw
253p+e9XU4by4Y8O7+8FeJFZhNiXh6f2n6kxzv25aJkxEqXqwJ7aoIQWI+ncVkHMxPb4mrqcp2TQ
EKR2IADwVyELq0eDIt/9Xh898ZRFs3knSOAArXSkzTJYvvASIeVt/BB1bYlccZBbsXJJXLBmLPFa
VChwQ2vjpn8Z+yPinE3tt+ckngByLQZuzp294gzPBYUmTdRMZporkEZmGD+JQBDI38FPgTfXYv92
Xxcb8OopR3BLbfkxcihLoUoVE2cXBdITkrg9OeJIiqWtDHg5Nepj/Lh5kWBwA215cfStM4TLOy2y
qGYkXIYLHdK+6xM5QSEkL9BZ/gTa3rjcu33lCicO5jYjLUGRZCV/CGaxgiKKYxIeyHSgDthxb9XK
uoAiwp52FeRm3nozRODNcxvkbN1OXN7n6NJGLL8H5iVQGGoTLjX+X9kONo6smURtqIzTrNC0Xsul
KLbGvNnXr9Xopo4s64XXQdBHmjTjhx0J5u+Kvka4aAaPJBWMMxrk03U0EogSpzmpRvLTQX9Xt/XT
5wBNJWSEOCHnD4Ny6iJQba8ga+E955c7AeHtAQi0K6awO3rYskSueqU7HCEPj32ddo08L+Hs9AE0
nDRUdeci9g/UDi/umtr+pGS8uW+D5m3n1Sl9tCROQdAxOE3EYMyf0sce817ai8iNae/9zoIFxJS4
OqmR9R3lI90LyvwKNexbE8m6FIlLAkDVlzCuGDhFsAXiLm/JzMKiChMdZbxz8svGcIxsGPjj0cvL
KvlRkkVsGdOM16kShdeNXD/LQ+9yUdfQVmKQSXn07QEoKnoqR//4kmd+OqVUX5/jAyVJrWVYe+KY
+bjRMd8OeDY/zztlJ9iBrKTB5W/2D9gj1JdSPQ2f7WYX6KLthEAR5seJu1HmiiRKqvCKeINjfyIo
6NeqEhPwUc0qi9TwI0jPneN9CYT7RgjtQHoRcov8BH526SLQ8TOpOErHJfULj34Egrpd0xxgz7Vd
eIEVEF8PLi3GLDnH5Ob5aRbu5ubJtK31+tI+CpjBPCWiD1J8KcinO2T8NrBq131NPsxXJl3FVjd4
so0UpNb3Y8D8K/EHjGXc3o8KJfCswYsPCyNshPeQPlsLq1HaRed3fCdlHT4ZyHgiOBeVD+J4pBpB
SG6RuyhR+REc7XQyS65ZYAP/8HkI7Oks306GMNQi7AgtG+ZZyBSyYQDXZXZhhJ9/1FhCTZcRrQ7r
590RkqTdaYdSeuNHfBwMPp/JKNMF8iFa1M7Zia7nCJBOtlsrqf8U9oQGnTZjhe6nx/SNramzpCGc
DOQ5oLH9XhG+bqoJBYHd5z1qDEyTg5NNLIjydbefJygm7CTTecQMQCJfZhgoCF/VY5d01cwtxM6E
IjU8MwiTJqTUpl9mQizTVVCc5KxvkK4CUAiIRuMz07FgFV3i2tA6pluUudJSWnonkgHyPP62F8nJ
yu2IlyYj7s5wgm22QO9HUbWJCW+DmwUsu3bsQZlP8P4TD5dsXmtjnQ+UJDi1Wt6vnXjFiMNpLVr/
T3Q8UezYdvhDjytyPYE6C8q8dj156qYLVQKjY5j7NDh2LVFZrxxrs9q+ZwMrEUKOPPvUSV5cNkyh
qVkJPUQY39HiDOjPjySoEQXXeJvJdT13maoQsu+VP8EUn6allu9gPP+nISiVQW/xP4iwdzV9TE1B
4ei0udgwA2IZTeHfOphyF7tvIUTybqn0f9Y69vP8lZlFLPZFCFwz7y40L7XE20J5S2DJ5QRVP1SQ
p6zpjnrqsQLfRz4LR80QEMs3dV4KbeW+TYBrtN4JZJUxb634czHZZGGph3kXQ/LaU4GtZ9YLUo6J
4A0csS1XQr/IhCuOToxRfqIYkn0cldr83IeSUq6YsZe+pp4pLqXdXrRRDiO9jsfO0Ht89RxcT7M9
SM9PdLcQstatr65nGcSJQSVP5x/AxFnLJjQPK8XRmJGDE84OUuQJA58AjCuDIcS1Z50n11a8mzFv
K4IzTjsjLcvmzo9V1r+nZl+vfsU/pXpr7lg8Cnr8H2R2XBlBuQ0xznpe7Dy1W30eDc23wLXpHqWL
A9/sAma2YB29cn9W7bnQvgxAxKwzFbWz34EUOyrBk7F2IS0UPBbIMo0HL+vvoO7miaHoYDZqRS7N
omdc7fkmH3o61IazKrUNo1LnavIy7tnolEPzpRYmy2QowwAsnN9DHWeAoxYSNQ0JTBjHOL7skbwr
Vsn1Gyfe/QJhCRpvk15bXf40oldcP72iK60BlrKadkZ1JUgOk2TuDsFh9zqUd7rox0hZVFB8X4Rb
9ZDZxb90gwxe3miZEoclWbUi+mgFaWi/yXe5qmnKXR2OsQfkMtfhEOR6pZbL3RA3M6UbU8FB7anF
Iz3O3DlpTh8XhKEURKimj63x4fSmexwx+n/j30QbS8WEgZ1UIdUmw+lXiby+wy4Sz5wxC9kk+nVK
+lWrXToTpC1+TJUCMNcil25BaPzaAIVw0l9MIvmInrrdoKMS9CTbQOL+RPiYFyuis7++mHmpAul6
e3gqMuGpzln2ldzbiTBb7J9eaU/MEz4SNEfUkZzDvPn/pqzRAeSMQ+Io5xmDBIT1J8jD8Ndn26zh
97y2wuTCSX1D0rKUgvZ7nsRLYK8vp9QlanT39GHaL1AlTWcfN3HtBSOs+SSImKxf+BbKKz7bGlMF
wTEHMKDiqwYUOcnuSuxOiITeF4aArLoJIpOEkcpsyPo9dhdmqqaXVKPtc3k1y/DG6r6Xnv8G5BFh
dFo5iByk8EK9cPshZLZWsqMt6+VtrIoMtoNgD3SOeMlI0upqCAqvf6W6dcgNb0y1T4VxZ+ZAVmXb
Jr0YAIZjU+GFDgWl7+iydaj482PVCbfM9IR8nwSxjTyi3kSJJ8wKJ3R8GwHnvQo17h+5RZlKH0cn
HgEJLbphZVZjv8SPpkrKFgqcJ5FO87ME4Ke3KOaWuiKhEQDoRSa5L3Ovc2teaFzPi7RVkRQHUX+T
nfo/Vmh6X84pdfJFGNGr5ERgi1p52WDRj7H5JIgxC0rl+X7s2+nwW7a88bFqE8rNVmqLcMgpVuf6
0rj5EBP2K0t8DO6fozO7Y08i4Iag2lZO0wRzFMEzWfwiGwEZOOGqmdsQpF4vJGpvlUik7eeIli8W
PuIkWOLYuJ5lqMrsjlZmKjzoZ4jOB4dn3v92piVSLxCELAlVwXQVnm8iC7fsVq9dY9W5CF8Zc5sc
HAqYUQ3wrV81XqIwpjWijbLzVnCgtIY9tMolHONk633NHNdQqsgErqcbDVl3f1Z6mrPLwp4foJaE
bs4oYYyZxZGCyHAow3NvUoPF3CpROBmScsPIXGXwGmF64ObnOf13JzMlIq5xNu5xHP5IXHjihB9G
TEhc+tf07Nixf+VG3u/nPE4GBKaJTFLDm6lVPUjQUDlehZhe5J1CBfsgsjlEKwW4zAhN0W/X1UYv
Y3RTYBqJQnesEP4Hubn03uOE1bku/aUx534L1YKbxqYxKpHNBmMFlNxFWONc+QvoA+oRDmfYGbk8
AJR7K5pR226Rg7IEWP93h2M/TbRnzN48axKMv/RaF4epbTw3p20H8HgRusGaZH95e4f/VQlPbDdo
JT4JVEnkmuSIt5pUbTLsGnFHqm9gWN4ekEviayCFKSuIdwx2QnNw4LcFCmbyQSXVldcksD34HEmB
W2i+ggm0T5G//OLDTYKvuE19C/BiCpXH/IoQmmSe+3nuStxWjh/8YwKOhd/lDscVhagVG8Ny2nwa
vaVzGoILn/s7A/azB1h/8fAIP1tSpqJuKTcJwvTkxSp/rjuEujpAIyLSY06WpP0o4T5nvGoWCdx2
CjHSJ9e4iWRgDlAOGvmEZx/M04rCiZDivdY11UUs4rQ4BzzC4EM653Fgvqd51QWImTsqKKjYv5O9
fV4O7ru50KJh0R/mtFOljdAimfOAPB3JFX/tFQrfxkRgEQTcOFkJxRCXhJrSGcCY5W1+Ky8c1AwJ
/eVLDQAR1j7/3gtha0N89xgAWYkwqIairN1Ak3ILaou4FQK/+kA6Bq0u+C7EakQPqa86h+eMPHP3
6i1J+9C0IFVloYexDml6Latmw4Fr3btCV7wHua5S72xUHrPx8tnDt4cLjHFaKYgK3qqJMzZCPaZz
+CcgzazlETuC7B9y8fzhXLywL+xUNwhH3DgCqT0w2Jk7MnhIR5x+ESNzLDY5kKTqobCZPEOCvJlp
vELVwXydp6q07EBh4it087osqBhdHfiT1qKXQjPpmksZ3G07MbuG0c2UCvEacsYgnploeUFnAiYm
zHC52vTIUvCm/lXoRv4hczvE2mkp+7PYS1JDljqc+THm35P39SGMHvfbaCfXFixNumolWkAkzTA1
MF46KBHvo7cqZywI0/w7WHI1norO1BPZL/gV8tem80LfgmqJ+BG2BT9+2f+KLIZl8urqQa9ijarD
2++qTP8Qx4/45bjsWYVFgIirfX+QnhHADi29Mp4S0aInDadxxd4Ksnbw3wAuj4U7hqyEOxoSFSuG
7nV1QYU2FUpKUtsYgDIKF5CLA60khYwe9SsvfQG2LDFbyxZCXWaLEeys6csZml0+OSTBwTYYJl68
3GEe92OVwsLZzvSEdhXEXrz+OcQDexkvBFViFH0JZpyPNRf28nqFktSTCi+yNOz+cYxwscNzDUrU
tg87z4e0/JljHJpYcCsAcL3IbDUx4+ZzbBkt8/9QW4ZW1uD0s+y9B4vAUi/TKYydIll+vn3Zlfq+
W3W1D+YRBGwd0hphlp+afBI1wxLhCqAlzJOyDIuAVm2lF4zmNrtLtihXTgWOF8N1K44mXO7V5/9f
gkbnazQkwdy2aVzSJxh8brnue9+dNjDv9p7rHsRqTYK3elw5mapYK9C2cn8VVqUmAI3kSHhFRJUc
y6dDUEgYkDj3ZwcHCiVNZtO/Ke0uLR21XLFEMsxh1KJMUwizxR4zTW/I+bz1nS+rX837ZvXYyPep
hH+RFt9WsGPwDaE3D97dubkrBDULpMmcLn2hJNoZa04wW8k44ugdW8tSJuE+tEHTKugNSOvwUjHu
tlV9LnJpBFWDgVNZPCOHeHbV1iRQcHflRs/gcDGv7K6GH3JBwj9+YoS51q6Fiv6FYMBddw6FBGdE
HWlW4SsVGXIGou4fSDZL0hcllNU5dU1FPc+W93VcsMSoWcdG9QkCbTlKN22ORkiDcyi98KjN5zsj
TGN+NjoCFuisGM4Xo738Kb+1nC+WdxhsvTwBPgIhEXX/2IZMT9bB9/Ko8rbL5eu+feoGSUXlIp0i
xKI+RAX6+nbUc+xXPDkiYFJemUhd+rU/xht3ZdGQaiKvLoE61IutiFESABhw+Ro/CEKHCd7cx0cw
wtVAvIZsJp54EgPYvHHz/KV5lnhlg3uIj49q9Zi9magKWX/JxNq5aWoeNQbMWy7+7oNRoC2JkYEO
qHW3cDrOAUVl5onrQSVV4goE/IrkEmy6G5U5KtBr10AvmdJ23avjkYxTtlRBpxKattYAf8f/H8SW
PYB+8MP7k1gU2vMt/43sVJkvWKX4E4QPcCl3jjUYqPXr94GVdbVUpqy1NiWJn2AZkcS6E2We8ujF
LVw+47kXt2SBJipQOew/MBXwuF7lT+9dQsonTBF3dhVWA+69Wj948CtPdyuNnjLshKHPf7FLgKvr
222Lv23v+Yfqdf2PJ5yhUUVoTu54lDT8qVSc4lts+j40DElnIIxVXmLPfPsxNFpGKNOUM7SdhL3C
f4YX5Zzll4VcsRjnt6OLe8onqZM9UJBEbnD/L64sX/3+5EJA2v4g4MlgIU/tIGCeIefL5wChBB+/
65OqzjvTP3osx5cloGVNdDlqrSwVTXIHcTz56lv+nrwi+b/vyIfzrY4Ye3K4MYwC5Z6uAfnguLQO
4jJDk105TW+ySp3iw/jpgX4mbvrPVwortk2iALHbop6gf0Jw9053Ye8njaqenxUbDqcVFXS4revH
ia/cNkcpDzI8BTEgzhGOSXX1H9nUJDQgAWN4pwAvmnoHCol2w1p3hfdvMXUubu/G0fwA/iwdxjL9
LrV/nm9XnCZs67vm/OGnZ+w6okBw5pzKAl6yGLU3YmRa+NiWj79hHH5KZ/IQTH46Q0MLvF/ok9W0
WF0jEiPJ6MWqYhM8q4+0r7s0uxG5ZeEKdGH1ahFOah1APTDslbcnusagUC4KkTJRQbBMEtkaPRNj
4lgdZR3mpigHDJCZS5bU7TYY7buE3eHToVMpZzV8rKh4ZbmTOGdrh8WhDPXC/SElSi6TDWX+CfC9
WPjcS+6eHffOLYFJ3V2SuaHiCHEwtGJzFjG/fm6P1jX5AMPn0SN7DW13Kwzmunn+/iG+xI/2UcyE
8qXyzbhxTP0cRhHKPyZlyAJMZEOPRMbuzqaeeSOh22KSntxPUyiTaBdJrBcMEGyvx5XSb0dIfbo4
ifsa/qIudpUjAZq942tREBukeLyE1iNNR8caP+/xZfc0aK15Z+bZ2AEyKtr/hYGSWxEfKTUTm3pT
7p6xxyvBE8yGeW8UqUqWTBywmK8oitT7lcQwO5I5haeROAWWvM1FrtL/98GoF60qxoZtWL8p31nW
mvlhmDT8b3QTwjCknzllZQyQutwKoBVZP+lG+uqf3J05nwYg1rbT2hQhbTqEVxPDDoau4taFXDpn
CWt2E2mzDZ3WACTYgjmfr/yGPbU7AmNYQUPv8DqYDRtw2W4SUI8T1CrkqFXh3R8hFynVZRtRfqMe
jCacDrLE4iC8Hmbz2qc7q9V5Pce3FYP9ylBQ34inhRwvWB7b1uenRz49D9fQNRZH1O1WejuTJaqm
mh4sUvvjLODdgT4fD9INMlS3NBsWSQHbJO9reNoBM0/tj3TyCguPyM6LJU0ryd/aHqV83N3IPh+b
T6RH6GXO30KcJMgVmvkK6PIyr4/nl/kPX652G/qoeKOKKqqQii6mf+lhUx0QfCVgpWAenBUb9W6f
bHkAjNBvF6FO2mICcHncYdOn2gz/l0cbBZoC8ebmiTdrX7un7PITVhan0xQ2Ed0VJJiTHWrUfGxh
V40EEfm0e1D8rGXZEZeDVLT8z09M7knAgjL1xdoeU5+PW2b+ih7FybLiff9BVy+XC6t84uqie459
CiQuaJoOST8wFdNDHk8bkfLu9uEumG/5qvlY/C8TTtXxAUXH7Ao6FTGyVPliH/v2KK0icSMpAzUm
5B+W2YnyNpueoCqBLaDJ+m1ZIkNorZUDsdfb7Z3uoGtATleR+AD8zWLbpqQ01+dZQH7QUG1YC1Sq
k8EuDiY+kUon02xRCqcQYd74DIXOFWuRgdArtubhbn061B3AIv2QsrrryDQfPg3gLmScw65Y8oK6
C895z/WmDhza2Av+O79wpqr44QcPEVVFt1NQCxmLajtDCjP4zqag7ZVErUm0i5HkYP/RIM0dOQo1
vjtdHYxFK6SSgsvf25GhKum6tTdYygH+xeDI8CK1Ffctd8T+CjRRbfE3MkasUplyeGqfBJzPszQ5
OAdKkafxMwrjxe/l/VDzoHkkaOLMcPUuLglQ+n8Kdho8ECDkPlUF7UcMaNgFWgJtS8KiQkKhlBg4
kuVqo/Wjw8M+eogk9Vc1sY+VG5b26e5LZHd/QNhLvuu8BIs+FfZ7ln4M+pQqbquh7Q/k0ZNlchXU
vI27VC5zDRtRePjidqLaNbyacvIq2xhwqLUqO+a2OfPZzauU5RqVS9BjVaptoux4u+0I13G9Qg3x
vAoHiYWBTaS41BRvMvW+H/FfmTBLmeMAz9nEAHYelEUvowNRJwGJHeEGbhjjJugcqWu3gSjQ3o4p
+hLLrlpZs4Wbu5zTa5qZv2epMwXei3BdO4i3LyEKW+3OS83RP/Vtuw1pGoRQ+Wo2A/N0LG5lrmBj
H+k9pZJUZTA8sLBbHuPsKNStY/WRusqmgp5T7nq6mKnS4EJWIWOLaWgPnrjbZJmhwAz8iXUiinwv
7vvcackqRpsTqL02JlCwXUheW9aZ5I3dnsL0GJHlCCwJDGIAnYR2T8+J1CXeaWuKaSMMuKRm48H8
E9Wsm/GKG0wJhTSc3Zlx0HTelFveheLf7ZjHYADmLtpxhFX4WoGxvtb9CdzLVDGj1V3GHw3txz8N
Tu868FDK5UWs17e2wvslo98P9n96m21z3DfGV825k0Jt4NPgrvVPeqf00rPet+jxCCI+YFsHra/g
VCFG+3vLvKAtS4Yym5RJzsKYyttIGeNbr9q8slU2vob91qwop6KtzfIch61F/iXprp15NkN4hbTf
eoPfcoMfhObapw+GHL6Y0TJ9AuKip4BH+jdKnN+NnqOP8qCP/hIvUY0PS8u07BabO5w8+WL8FdZv
9BVdz3yv8raPnH9rnD1BGh7Kd/VD0rQq+ETkwnpCyqfvF20ByQA05ZHSMn9laH4rTwPW8fxZ3qfb
izxsLCZy2EG7X1YGjOwtraubEUOdpX+oAkV/voklC+u/bGW743w3hMvj2yy7AUdHys9g7oMA438O
TBJDOZNp7GFi+XUt0uH9unIpPYUyY77qhUud3JrO2Mjza8VGv+WcSXtrOccGWvvyWLH1uK8e9jxu
/orXY81lOzfxjSylXgSRZy2NzRasorb8VVN1LU8fIh9QwspEIhH0+p9kOhN2CslsgLSUj++6mDkz
bWrvoLj9A61/HT7JU8LwFa+hbO/sGzafwkoBZSg5sAIaSzxKRQaxBSA7XXEs3dRCwRRGoyx1RG7T
fXR17iyuJG1g80luZjBGYQnSR4ueQeZGnwreOdtB5TrXryN4DTJFfuVsQBGNX9QEF5JIX6j0cfhx
FEmMMpkU/aC976fE9APcmfsIVGM3mYylSkEXzKD4Osh6oxpLzoleZYQQo14vH6S1jKEqphUVZ5/v
PUWvNWFd8MuUfHOfBbh6QtU+f0rXDR0osKPCuz0BjGU8Ny4qbenZEhI8SmLMxFMJ/W9OgKOgtOOr
dktFQb/w7iiMrc3buWupdj8Xgrc6eqlZ1uKfjxWCPZcmRwhtRG1BFHK0/WHBzOPM0+n0a10j3BgQ
3Fdth7XgVsdAiVYKg7g7WZr3nOImdn53yfblBasGqimnFZsKz+IU6JSUmKyc9Xybo0xoHPdq7C0X
Om0MLs+y+erTFb2h4YcAK7sHReRqMvPCjjuuiurGtCHCoB1aGL1DrH4E2GrHkeXJagXMVVvvNCKQ
QwSCJugfsAktnZlHBfm9VB5ZXPq4Mdrsh7hXr+RfyR8zHbiaYdX6AEj6ICQcb3A8EbyPpE5YsNO/
OeFC2MgE2Y339xUgeiPFj5brokC126ZYMqFJj5fYAc8zK6k2kyfPpvWLH0vo972Y4oVec6RHjS2l
Vg93nu0emE8eKqEkA8pS/QPlmyg5FWslgSyF47T8tAKfFgQkZC+8fNnQHN37LXyWJDT9SJedr+4u
ZGwoPlpx4jPMlvZuVF2bbraPA98b4dFDwi1hq8f27bE7Fa5JlWNVu9x4v2wvZDHpBiAQjQNatJSc
jaJh/B1sKaJdbtf9bZHu7feZnF6p+VQTdCnSqb2wUPcWTU36nnZ+Dr+44pMamgAnlHEc9fdBAA6j
MZ6KUkptSZyuIqRMamq8BXDY3WCiHBBZQYJLqgsfUeRSzDfWUSMrmwEZK+c5AaKEercrmcuvZqPC
5Wn4uGsEynQo/4b7VTdUVGxX3VXhu8rCNCFEPX1DxIjQFgCvCpXsRl48dSgHHACHKRq6jgiDjK+n
x/xoOjwxuXBJAX7u784YL8wQhMVE5YZSZzbn+F7ymtVxS4SuNSUq8KfpybTAtQLVy/xUxb0xbYYB
phWtqbQQM9ii1bTNHbwLYxGlpkICFD5RR4zBIGVqgRiyN2I26U99/kEPH3/yjHNZkAnP797Vz2f4
oOELH/dZhSZewEgn4kZl4QA/+ltw/2xPph9FCCkoH2cyaifoVgXO9AVLo4yOBUnZ39Fhm9aoJqZL
i5pdZRZMBDflzp1ECWH+XwghiRMeB/nLIIulRv4bP4KM70teTTb+ZRsfddCRUBc9I2sa8QEXS2VS
22mo4rbKQ/oD0NgDGt5vqaas/jYbIivOo97p+FC0fIugLjvX9Yc2ZfJvbinLvG8Xlvy2P5mM+c6R
nRH1JJHdDS7ZL2UqR56+vdOH3s6obYJurxTWWUAlGqRLCVBkJgbloL+w/URnCa36xs1CTYH9K1fR
LTgJbMLp1Dgaiz7hKO2aNMne1hwmtRNp/Y0cqQ/pOou1tqFBa4GlORrCxm+Xl1WIIlMnpg/6lCwZ
5KaqbmykC5//piWxH8zZXcmdKfhKCzXr5Iddqpghf0BEbSPyG534mpPQU1bbuWWc2aemA1fDrs8U
j6WTcHYO9A+ZuWnxbmmA9ejUOy+2gc433vknhB6cIvRHKANtVpgWl3aeWGv3SKhckBGMoJJNQ753
8vZkVx6Qq2KecQRgI2nshkX+ousxfgfPmN/d/MJQGkhMt5Ztf6MrACiozhPoRtF4GUAtIIChvEjY
wdcxIOwmPTD0P7AvB+5nyH3qACRIRoczlaZ+24iuoxyFR7UWRPQY3JmPfM+zMU/dh0amMT8KcAjV
bSr218sE7ZtA5SERN9zH9+x/6UwMbVfh8eMWMkVEMSrqam7GS7YBqGetCIAQx8YipeWY7kgmIKNJ
jP1HXDvk1P1X9r33fJrSyr/ZhmbxIeAmrP9UhoFhyUFK+Ijh9umjVWtkvLlXv8OXy6MHHdiOI5ZV
4EgLBozkEdqMNOrwx2sEnh1wvXI4lSl9/fXOkgwS1p3augoCDFk9I7N/cteESBLTsYIUquqrXgPn
WVQ6mGFRrGmvDM+qCvjhElcMgpwgKwHZnsFnvrHE3Kf9bjtQ/h2GCAa0GYyctkz3dSI6R7/KCDzZ
O9uhBDn8hmHJVO39kpAxC64/47HnKHmsKlNgBeRhme2eqMfpM+IOI24Oj06qkpCNqodtuco0JoJt
C98Q59oL4IW7dkv/tjKvWiU4aVohi34cAuRYIPPVOO2HmW1bwwfBEiHHkyHKXAUL8VnR3wPWmwW6
y9q6frMVH7cNJehInTibCm3D+zfltzQCskhur36CRADJusreg3fFk/mUiQNsUuVECOCcWsH9+3Ig
/Za5fcGsRzsvtuUKZ7bFEfdJ0PqjB6avFqD9f6uZkm0578HHrxAJtJYwipYxlX60pwmRbiDIaPaE
Erg2obpUgBdpgnUmH076vb+Y+umkUaN7BjRy+z8PlBgbD8DibT6lctYKJE6JJoxzaK8uOMxPGSgo
6cYdGinZ+fHAZvE0ElEuDL/D/nEIr0aAoyCnGXZ/814RvntzjX1szYmx1+q4JKWWEezasEadnO2o
t5ALoHBR6IU4tapoYfWXKZAYf50YSCjxJi4blxkhnS7xRt4j12keS5hApbXUT13ONNlcVbA4zaM9
O87W8ah8Di1bzUSQitBvzzLjth3sTxBMjoKCjg8LBd7yO4MOz/vx2pHfJ18imfpKu6Ow7nkhFx/W
erv4wPSBHxw8aaG64NTXq4V6BA9mwou7uNtm+n9gP0D6HzsWVNFlhDYw3Pp7QJhE9dmF9Gmo0I0c
TKWzlvgerc0FFI1f9nfGnulGzqtL3wOyAmXKtW6zTzSku1hyridqA1JtSMaVVT+BX26+10h989si
JU+/cQYE16LtU9jQeQmiixHSHQfhSrukdoGcOBgdRk9W/sf1IUCVs7Blxlr/mHGJCO0eztzSZys5
BQxwxxnaFgm7etgN+gQV8zB2ALi8xja2uu0URYG4VHuvA2lVb7elA/x7OR97WrLiCvO/5AsrYpzC
QmaK7uIAc5dxiVS1youKBNWMHbfcfszjMHTIczPExoI3ExPVdRni7qrzNdd+M4Q5i/cORCz2UfLt
UI4xZJC5G2wwYbIEtYDfxxhj9vT53H7JXCaB6PmRNKVhDDdezAXncHdxGn0D64glUPu9VnmQRIZd
4YJHnQIOrNlacs7KOiGwVc1ara2t9zmxTmztptfbNunrKqkQ8CWeaObumZrlD6HqGZvVLWD1SxVb
XW0krUMcWnMXZ0jUvlfeMDUqjRiqyEDUeV2dv70FrZ0VZLQkzen8lI4r/qcmUY5VJxIZhc0an4H4
6hSZ64JQX0TLGoAQIroYIcbbYSXSdmqJeLZX3CP/FYV6bE9+GY331dhSnahaV4548uxw4vp2T0cz
xWBbUkbU2MyJnu8xAMCL0dPtAtPwJAaNUvs5uYicPFx1BT6mHQQIvh5d6ZF1UyEoLi8GDObWLVxI
P05Gfb9YB3Dt6yHzMs9RRL1GToZMCweAejwPksCLNcZ+003EHDvD897Q1K6m/G3J2qJ4xs7tRCSJ
ysMxEyZP8zix4zZnCvdoMAVuC4sg43VqDksbxj/2g1HPyYe4iqjdqvja+bV3wUKQpr6KiVTrP6Ng
YVFwiknSSz+tqWWqw60KLXN53ocv23/g3ycY/1PZYM3rZMfIqzZBMSOzVu8gXx2bTB0BI5nyVJNi
0bEyf4eRLyTpG99X74KPcH5BTKD0q4OZFodXLaBI5zGdlMUpZj9REJUcnR7Q+DvMG79gblLoj6rx
fv4JJGIUIqTAami62JNheH9oP5FerDawS2zTVXmu00FHO9KpfsNmTnIQHbHu11ZlOmuB/8XJUrK/
DNNwRvjSA+DIZMx7v6fw8R6bU4ieqIVOtN8nZDfuAK/h/zpJ2qk2ZBSuwDDJfl+CvsoIp7pn2tfW
1NecveB7OvGJ3WZyMnfHwCqOgmVAit2fmzErTmC54zg87WcvHcQsJcRlqf3kHADWsAPLbDUCX07I
ykAzeNoFD2+f+U28h9s4luKNp5OGm+9JgWJ/BdNU1q//pyETE4x3GmulXznajDY/W9AVwZqojTdx
30dhL531aZsLSTqMNwPzVqbHNqKbNwV0Xeyn6qswgNcKFeMTG1GLGbFnLNrUkEK1b+VH6jhIjBmp
kFeaX6bY8fQYuG6mxVRY6EbWzpMZDaPZCu+ZOjqcUiUgAFjkrjaPGUmU5B/vIE/bompmgyIS0Nr0
fRhPft0d0c9EY3b4sg9Gzhc30ULFXCeFoWZIJWFXpgQRong9C1dtRwMC0DxDnYSyFrM/UNcrfMix
fwexn+TesiEE9F1eR8z5S3iwk4zatZNYiuthGrCUuU6+7o9RG62hmrDDGvE9vPnan4Rkxhw0VGam
72jFDGDmjZ05xbDo0Plc4hOSwjSXj/p6fDU8B/BCsOHhP99rH/nd9ZJkuMCuQdWgDSQaN2gNc9b2
Eb7PnQhVPvBBgD5bC4eJeznxc+dJwdxZRgxrl5Qd0P/KASFYx7Vc/xtvKsoC2F6EbotJe4MYJYMq
JEbGamakKAVFA89bJ5r5gAc3gd5KUSbGGjX5/q8oiHX9fZHq81yFZwD/qHgnZk0pv1t+SO1G7Ael
QD8StQv/wxiakJGJtKIbHnsiWIBiqx975qhJ5hHuGSdDkjh8OPpnCoCCnQbmNTcnWRV81E6SscLr
/4WFglM8GLRrLNrWBGSQCbPQu7v9bNUxWdUCgD6Ux3qLSm08i35IsVWepnt89EIjjiS+6htQnmO1
mFhRZBEelod2/P55qP0E50S+pZy86UsSs7/NFk8sC3jZixFVUv62EOR2+YBQf++58lH/L3etOfIk
3/EpmyJprVDJ82PsJIhAFCHXVgMYiDeNrKsTjnoH9F/HaU0sUrwNYHhEQ5gNxBX0jp2uY+oxtfgR
bpNH8UChJL30wofVJ9t+eSCFdWQE8NuOSINmnVcgm8B5tjabGeIGirZE9NxO0R3vDVfbdi4C6KNP
rLfTuq8G4dAaGsVhCV4BKxx4bzfal5wQp9ifW+3U60cSTf4l1p+oXIumI6rEdORE1EXr+7et7KId
7OkJvTjtKinZKeC/Xq8CwCY5frXqixvzNiZBl9j5jMTeQ1C54e9lke+XliM114HPkmjS5Sid4YAD
5M8drpGhPp3opDpHLxLgdMMJQQbD0P3tnFa/qmDAfU59YqmdHC8vpVInOWte3BEpwPcMF7CDFqE/
3RxRuIaTqF7JgNuZTf4x8W8xSg1COIxwHVJ6aUIeQLrvmY46F3YlQJG1DHNl4bjACpU8hwknWAhw
7bFqCnbd9pyWkC+ZPlOVSmRZUrbgr5nfdoE/258ftYYB/nj6pzX23fLflWHxSoi6cn+aOy+jBdAw
kvR1yTikqHr+co+F8V5NdXTsEAOc/crR69kX6nIhbYEjEiftT3J4rXqDCdtIdMQEp6ECC9qd/om+
U6fHBbXO862nHesIjuFRYHHQq17y74v6FM94/eteN8ppeGOBhWgxLM1OjklsSiqv71oHMUIZx3fz
ie/S0AtkC6PcxkSnO7Rr0SQAnDaLA6JYJYTcI4B1+IqAJb0xDF/utkJrI0LtV9xIW5qg43VvIyw9
Qec1V7TlR8CIjIe7iag46aRbz3d+I6l7TGHhQN28VLLGG0VOwQOWNSfWZwNABFywmFUHnhr5111Z
agHKytCpaR1AME79rWb303gGi0cuhSImca9Dkp9hBw8apR0hWF2AsF1XID9ylDnzYDkk/lSmV4Cw
KBDCT59Ve6lzJ2bY8vzLKQkcUzCmvHi/oQIAgJ6xbInKvx/mvESg3CXdiirUcPq5Wv/6B5X7+AxB
yZ9vmORAoKdlaArJwRU5mExh6zzM0WWUT2F2Ptj2Hp0UuA7mE+yTHT5CQE74mndEPGv98kL5jfuJ
FfTFajbzzTSR9dVvyuEm/GV79xGxNEk/kny2jmGNs4e1zcjuXgJr1eDzFCPzAuXoeJstz4/TYgAm
uSaRP0W/oemCtS3j69gTfZukLpC2L6UxASvePGL3V5twAfheLbGGjUrMV+ApEOmSDkEsSwtVkcZ+
A33jyB16+j1XCQk9ZRP/4ztt3vbmJP/DmHy+wTXaVgUOB/wicbKajoSaCWtmGk1QE1s0sN/8tobd
UrdxnzA3YGrK5d0XyHqdlKVdyxw7kSAVI5LuiG00hXvQY8EmQfydDR+IgFMqM8mYFjrU1O7pqeCl
B8YOFeSmAyS0crntJ0pwtx40U50w0Agv+zb6SE7hBm1r8sYooLgbvfUHYMlu4XVZULLzZ76CGmUg
rPuS6DZ4OZcbGSI41x9WYEbpl5MnePfCj1TdPCyAc6h73TWKGlrHixhDRCbgOEDnhRsLosIy8eJu
7b+9MV4UwLZr2D/+F9mj1xYpm+7nz3qyKO2iVvSsXAQBwV8zGwxguF3dY4yNHgMcqREJYW7L9yil
+n8QlN6mKq+jYhJbj5jOsaSUt94h0CVPcQe6YG8UPYzSJt1OJ5/dEgU2KQNGtVvdGs1S4xLcDpcT
prnwOSjHMufxL/dPtCyPSxcTB4kRiYIJ9ePsyZUKJ14DcoieujlkuqrboiLqnk5sHXl7IWZY3BPD
I/FedsC0jQ97jBRpmv4ccs9k0GbIpYJB/v0yOuwzAVxFQ6iLewQfo+pp2wBpkFG6mp1atdCvn+CG
oQxX5O6+VH8lvJ9yBHgFNW5SQAlWXf7mfvOI+qr9kzl6DNuAM/CJ88x1Wg0NWq8YGn54BOmGj6/V
5V2cwLzs5NxCweoueezCuOi2ozZaSWVOHXMeBTncEGDYXvNjbbEXPO78EWJeUExp2bNb4V8ZdPMB
DIaT3CmUbmtuCO8srPtoZ+kjlz3JvLYJhBpfqQ6W6DsBOgKAD2AUN2Zau7HoDfpPvQtadkbNDRqb
WALceqknye4TTj/FT1LpnWYvIW4laN2TUAV9sbcx6Ye+ap7CBWqaWSQJxQ3L1ojsmtFCPPCq/6lV
eqjpOmp8F1hFrydEldGpOj4H1xCcqZh7NWCznIwEyjj0BtRxwuDFNhllXFqxlavZiyZRVLKp9Nld
Qe81ujqcEXA83EVr3Jj3Sv21+dpEO0V3GHQ4/uO3HJdxU92PCrCPx1Kxy8kVQ2gfMhgq9xRf9TnS
3FN70K/Zt0FWq0fEOjP+kBSnt8iKrB7b6FVSkSU9cTDi43m31y3ei42XhgseroLuSjaWtHlHKIt3
L4tZgpIuCtnssJh7RejwwLPVNnMzs+6XexoiplOMIZr8fb5lxjXVpxoMUzpDk90Uwq1Sl4At/iSB
zXsS/rBAEzp1hxXF8dwyJcDpv3wFjDgnDw/k7UVPnkjQY313vlWPslxskqEnrbLGF9gwrgf8a3c7
ZDyGEq26K3Hznmfq3kWWowYDSDtD334Ul2Upu0sXS7AgW+ieENfVUEjtI8H8PLEnfNKsfKQ1gFsn
SG3OjNc3M8upAEfEdCmYcHyh4aXkgsoTD10sBz7U8FU+//3rZiQ3jgJ2MAjB+tnicY/Ej+BFhhnA
eG0La39u2u5i0nPy9Vy/NfY4Z16sWFBcVVgopKf65k9wmt/0fxbCl9uT3YWBJeExbdfwKu56KaSS
S1jjrAhAKRR/Ruf2tMZkoWEgN9Ku6SfvvOd2O6X0Y4sEyl5KqRGysZWplRyg9P9aUQzp/KCjz54a
JiN4Im74fCOlpClmgRTvBIV//ievNuCMwEu25koD7l54a5Ru0MztsP3Dfqn8fJV2NORHsWrEXx0E
v+Prm7alU/DsbkSFt68CR2tbXwZ3L36yu2DMiskqcArNN4Pr3Yl+hA2F66s+/ihSZ0/Cn9Aflj2L
Hn/O5nvAm++ZkbKtwylLmWfXIaOyvQp4m/A41IOR6CxenN34ulQ99mwzYT1cyqcYsnhQUXgPov+H
M8/nzWGWmfeMniwIDvgA6Jj22kYVY4R4AhstY0EcopTurhtRwqgv33kgJgRHmJOYQrii/2Zm5bqA
E9kIWIHrRnTpwsZg0/Eco9l+JxLCksR7pTjVBghR190CR2oK0jBkG1cIg9Fzb1426tGnvKibXOGZ
rUSZ5VUJIwEXjT9McDpRp/2Y22GDGGBGhH3UPvB8C5nO4r0QgabefaxX5xZADDz3TJq7DYT6+QMo
TN2pPF073OrH1AKCPw8yTsUfvZYpjH+C15HShuX311/Wfp9DS8UfsJClq16fjz9EYc2RRPYlNjwz
egAm9t7k0nnEaMyaY4dZn4pOWlwgZ0XdMWPn6RHcDTQUVI8oD9IDuJF2D8yukWvB1iC04a2pnXlH
TmLAhhhWQGqM3wOi2Ghky8jX0QEv2XMdsNVR0XKo64e+iqiP9Vs8igpHVoc0YeKivKFZQ4YeW36/
Dtz/KuB+NMFKSErl2RxCfUjOBjjjYWUAbdAsJymW5wBUqhDlQI/wReOrnZP2ph7eESKT/sXDT51/
wi4LTu2Qxj/Tv8nvYeBmRwdDik1AbBGCt3Pe6B3l/FeqQbNnN0kw6k4V2pdBC7eNeL7o2650iaNm
+RzVWD7rpeNQqFeDlMjv1N+eNGTRrrpT4roo45hzbaSiNnZjeYHK2WxcNQcVjqkraQJ9hMw9FLQy
DR4Nt5JKPybVVuDOK3MMzkMWqt45Fa3oPq43ey9kHtUeywjYtDBdrAC5etpotWB/miFZymaQeGjE
Yi1vOk5hjOyEghk1grwDwlzCu2PR/1bs/bhOLMQsDkEZXaeXVSQj3MAItAvPSQEVI7+KenOWfVjk
L66BXh/9r3YVmoCIXc3CF1qkbeSMwlOckOWp2eO2P3r3asV3Q2L5gKeywQyfN89Mc7zFHQUktF63
sxnFJRjZwW9SJk+Y8ZX48ttd9CKatbTA5fzvPdjZJZlt12sO5YnnemByn5rScos0oUKbOScbwo2I
c+8zpu761Hz4yw82gy5EZFRN22oWpxPw3IqpMcvfZCDwFDFbqKk+u739wh1EVaWMNAMEgcfav6MJ
PBo+DeItVdiYIK029a6XUy+xsl2FN+UXr8OcbUtQ7D0GCdDILY3ZIbOssWibmeDoVfKQsDBdF1Rs
FHzmSpYhGwHwRufI5pA064QT6FQXgAtoKoCzwZXoPymL8zGUcqfki8xiBLv2BmGePQPPkCXcAWK+
3k9ePlTHpurmZus2EHKOZDC3aEf7A52bbvAJTpGDXqzLes/tlZIDng40O2T5NiwRZVr0sYhJoxbc
KutQiElgCQszmjl55jRHrngQ3WYAALjsYLSYv2p2Ctu57Qs/x/qWeYMt4UewM236KfGhoWfRo9tx
+YCB/NoVAUPZdB+WB0yQwVMXdmJ+9k4+f1bWgZDXn8qJ3uofQZjL1nVMskc6wtjU4R0WpnaQXoEz
4bkIdmZZOb86m8nXN0tcOhEBYlB3iqCV8NLZCtJQJKBZkQXjz39oUt/6pEeF9HgNs839aTqcgNFT
Al607IMrNb1SiKBWvDlX22uoFQNGmx4nO6BntABBImTvGEFd9hKuIaiPo0CyvlGOjiYMJk4w3UWb
olWwHTM0GILnvof+eG9KFHeFP4nVmm9mD4Lu+rwSYC4yOZtEVOMry5Kx2kkAoDX4Jzv1tCBRUMiX
/rCBpOK2lAFcHwVNKxmc3PsCoMCyCaLAP6MqSxcZpCFOuLWBAGhs09qsL2ksgULh7qWbblr3KR6X
IihRRpjzpeqUZgRUhXYLf/oyE8+qMPUjRP4Gm8pseH4jWxiUIvTqh9EeMUETOSeNcIyMDymm+D2z
k6RajOOjZ8OxhZdmkx2Qrsm4UJiOhRjHyTWKLwLHunELym96/ndY7m/1iyyFl64VBZ2hBadA33VF
wLuKO4ICrXajnPIKill0/t0RgDPxJyBc3kASDoqAODgPbZoGOJJMfr/o4RUbu/JrFHtcic8DalaI
UJHOhpcwCvdP9wj+Ui5pTzFOqdMmXQO0tQURs2k7idZAk3UNZRl3vzFJAhy39O8dG98OBFMWxmLk
+L5SmGpP+v5HZ/wsTXF+evnYhr93Q0+Hz27U54ZgTp6xD+hlwlILi3f9RzS9e5wNwXAlns+MCph8
va5tarTLFzCtfD8pT4NGSeQTB+cUHm4nR+JBtE7xYjfhb7qGvAWpwRDbojc1qGUgX+NwTRUDEhvj
dmMN98B3CpvJloCpdczMiyniOv3rPP5JX7iC9z4scQkbepzYjdwRyYWaArXf0yCRmGymeJXqrJeS
jP6bPspTNALiUmY6eCJA/JRkEPgsHIsnwLKVarMpwm/ssEVffRFLpgOKm/GNqnRHrQ2Wcn9Qty9V
mKrFGD4QS9QksnMzFOD937jByBzDDfqfvnkeuek1nn3j+qxs4J6Ae7+0fcRiSBrxVP/DHQpHqTAg
OEzK6PgPqgVIL8H0FNGlbJmy0HXDqPf+ibDxm1/51AEqAGh3pYMs+3BUWjjp0YJBfxl3MQbx0HCx
woUofil3fYp/n3vk45mnqbYlCKHK/CSmy08xIqyMoZlKJ1uKKn0HQyg2FQlQxmUyd0Kwcmb82Pqo
YxbzLYtSRGERrV/YLH+kUIY0qGhPI2VP/I1gQxv9ZCc5onwBVL+w6GwySGfY8yTnoGAeKpP2y2cs
tqIko6G4X0eiqplJtw9YN6yXrSgxfrckoDqtLKSZ84xvM1bQmcus0aKRkIXXluCC24U3Xx3TC0nd
PpnopEO3l+H0ZTA/ihAIyIgJbF8Ao9mwYGuYL5Dg9f0nPHDuOHwJXj5bsLFNjvq/qxFVCbyEUIzB
ITLladfytfZv5MiSCMpW/dY1VyE9YVjONp3FHUtrmpmw2EfIqCX3JJNvr4sm4IcbQkMzazwHbeRM
Y0JqG9sEei1EbM5MrqTZDVrVY5XHEVIXCyb6Mrkz8D0pJqIFF42eZZ6R0LL001vyoc6owHa28klD
eYTpbccmGuH1T2pSbfSnpplJQ3NaeGudZA7K2dJD+tQw2lFLZB+lho9YU0OOr2zcIru9Zk2pT3Eh
4pKeoEPWYbhCMorEg+iO/OnG5kI27ywY3OZ9X6wyJVggXcTVUddEKKUjnPyYkxomG+e3Ksj8l7El
mS9KvO54Us0Brp8RzkOs+O8fP+q1KwBOD5snm0sbv1nnViHww6DnbANHoc1+8AjakTu0FrnJWN9d
d/eWuUaObj0kjGWOyz7G8cgGAc2RLCmhXxOatFaoLdDeZCSpT4f479O4FB2aukmyM3cEauYS+T6U
9G/y8cL7QorfMZxnKh8EPxhYvW4j4/YCATljng8uvoTdjly0xupAZf2uzrYYuvAKMmnZm4iCJnWH
9XTxCNx3gQVKuaMDz9j0YW4SmWVDsi33/bvY8Xq0YvUh25SvpLn5Jrveshg7DGQkTl1GibIfEaGC
2yMKeI5fCtkWKcJHe+K+pFhkT+LtsB/FnsBcTNe8FVUeHaZdBGYyM3poi2pBele8iRupJv+0+QId
6AVRvJElTym7CHE4VKKBIernvdSd82S/uNs/aHWUKu6EJAjrbnrYutiSSv4w/PI2jKNn8Eg7cGcr
kibG8v8lOZBXvSTI0l22uqE7v1+qls09y4tu7mirQLoAUBnEsJTSD/ba/857cHrMhU67BSYdh62M
YyZClm6BD76nSIuLYP9tCKyKeGWRWuMB9Ft2ZUjpt04gFVLmJU2nZNErF6RGvRF4ZlbcxoVUpmrF
5/xkMOqHOK6Zq1aVksczPG6ouWzRwFJQMIjFKAJqubkBFARTzCeQ5GddpHY97YiRxqbg8qe9y61B
WJyTyh5Tq3reSSUhG6RAivr5jUoMdOR46polZ95S23Qy0k+jW3MIi7ASrYsvg8E88t0ZzkVNQPsg
497kO/pecbfUaVFHm00NulxHX6FXB091+rSB2SN7oTlxOHYVxNJ0xPjalq3uhk3F3/AqTyvnmrAu
YvtA8UOYvufClsjywwib08pCpcIdww4sh2dIIjPeTyN1IhUL6uY1q+7n0lPcsDEtAZc47KTnW8Sz
4JcBBt23/GA5M1K+l8OyKYG6ZJWfRzVdHobfqwytRGC59/rotVCKUMpTUxy9PqLx5b2x2kEdi2/E
8gGDvpw/+rzAkQ1FnAZMnHUjeEmZB3S9Cr9aDqsKBSuWVvVrWNvCKnGUyGzLgriNBthLWPUrkw2J
q/pE3BpMAmwc0JhT8qDdiyxafZOpjbNYYpdxef4NE+hlpkTuuzS5xh8Zmm4xnPMYSc6Zng8XcZQJ
abumr6prbARupCxcgpxeKs8EcbYD44tlGT2MzOz14KQf0oxjA6Ek7Gm8fSTMox7e85gPCSQad5qi
qMWhfFMlu4Xg81uc3P8Jkmbs/3QFAi7L2gjDp80LpzdN5LbxzsjLIMTP17xRjDtbcVMqTuxej8T1
508pJyz0a2EaM3Q4085PPrSzW0pJP/CJl2OD/+wmJbWbxH1jhsZLJaqY1cWHxlftFzEcQ5Q//w8h
+rcKQCQozYhnlVukP/GHPBWpxi/ycBFDbeAmjrXSIZLUD0+o0MOytvzKnQukcwdqbTU1SsQ7jmwl
SWsdeyysOSjOapHHHi4dwYvpQ4ta0TEd1ub6pFV06/supHC2D7tbyAyh3/RAsMz/MlPfpTzlDtm3
tE9L2pW8HSaP5chDEuyqe8WjtyTTlJjQoTyXDFtfLfLqGfcpMtDEn0V3dIsghBmBZVctYsy3B6eD
rlrC4ze95/Du1xBgLUgUxNL62cCMysxL/ku0ry0yFBuoQ2AXei0LBidbFF06k+fAYUyOIQCYDVPe
7ZX5YgYHtOMA95aHFThPP3ehLMeItsACT+zq73qvCBc2O2kuUBh00Oej98akCirQXNYor9LYQMTH
KodADhQ+leEQ1D8PcNrJrRHQ0plVp/gzyIIhyizZaEqzoUoU5ylpYEFZSP9Y+M5JIVBXxyTGYx3E
BsdJIW7o6cmJaje3QGwgoXvLKzlsqNsJcmNE1tcbgcwSwHju/c5uoFO4oB8bjmpywMzTV449+gxB
92UdsAUCR0EdBzGAQx95yJpa5Nmc5Y6sgC5Efe0n5KlgWk6gMjn6c/yfv9x+nVBrW6TsbIYAIV/F
IzxukhxOieEnIKWmHN6+bu2zdmyphPXwDTioCF7/F3M1KBAfhldL3p1Bj6QLeq/nIPzLffeEv2KS
GCwD2wJxgKIh2h5RGOQiKs4BhNC8d6bw+ZnRcjLii+kG8T7UB9rLa4HW29orEWa1BvzfKuWi+r5X
oU4dTI77rVslHlXTiJrepOuJSGZJAK5UNC72JFe0pAdyhG+N4GWsV97gqBlFG9ek+OVouc5kJgGP
DSPlwwj4ckeiOTAW7bz8+bryCAoQuL8yVueS5/GDllFU4IMDFLDa4Ic0M5x0L+6AGHIoQXofvs5R
FrzvcsoUUzPSx/VA8hDPP5nC4AuYXXe3ZDfi3aDfmE1JGzCrMB4h0+hKwDTGlX0GglCJRt9wC9OK
7BGJjjNl7iteCwkO9/9NBvBgprryMEbuEkXZvt2khmapU+vJ7eEf2v9Qw+xEOr/p3vgHNZT4E6FH
9qoQs04LwfYIpVExnWjetDBbBW/hg56ZlquHxLyaogb1o/cROK8yVBXGYOHpqsu0jn+KkEaHKaqY
QsILyg7X6HEuWp4O0blgZ63A4+DOd00PgL9BcmSbGdeDFl9vo8yS8Ig74UT8M40oA34uXHDqg74A
lLMR9QHUX78qqnyWdoWq9I1OfFa+urRTMIjoCs6wpmatjVadG17k67p3+kHTKFJGZgjAV8FtSLO1
3zmn2kIwSoISS4qea4x3NvqzTc4jhSGmBo8bMp2Ga2sptASPLl2e+Fx2A6hNFrms/D5MpT4T/Oey
rm0YwlR5YwmAiaroFa+qObhjYeMDVVb7VwkYC3047BxIyUsQ7YiPj5SGS1BK0kdkgVaRgcXDmRvx
XuO/rouoVH6rlQUTWklfRw11PuG/Wjt/9hzVXzicatgnBnzARpqCMOIZdlFjCxgoyH8nm1ka6Zo7
OIXY+AiAe92viugahUeU+Qb+JSrLzDLD/WLAZMNytWXXTXm6HWyqttfDdhZY249bk3DMSG6h+itS
Wk+sFhUXWqtJug0eFpFLBd1Oqi3s81pELg5DpFwO4CntDHR4D99qtFlb+vIkVF67NqZCdAH3/Wlf
lgSruupLFHxuv3lB5nnyU5YajPqfPvjkCodXZWUxXbNEuiC0RzZoCWg3QsHTgAgJll3imLycmfQ8
40Xme6Dii8bpTjcQigDFRahm3sKccFNHDbosj9rtX+Ts2euhN9BmK7Q6SLpnzvZf9cqqJzgBnQL5
VPEthdp/eIUfk14DzMDo4ciVpmjr7Dp9LFrjnMYMjiMqhjKjLP6kfA3vAfHd0GHtVjxVyxV9KyRS
zPuynJr5s9BTQva3sF4KFG/htRS99sI2aCxy09O4N2pQx6PGhiiay7WEVTA8s55O6rT21fPIA3Bz
huj7vjOf6bBHT0W0cIeRjroJogH4scibOTGkhrz2M7Lz9K5FAtcKq91WUGCgm3hMd9yIr41QPXBV
239PLXksR99rpTrXusqxd5XYvCAs1+DCD4vPzHNftaQDXmmDgkBSrc5FSUwMemDNJU1KQlYuymwm
tq6OJESRcXeCNnRwQy5hehm8OKinG8X9vTU4YyblLmAcrSTSQzaQT/CrFoD63y2px6082tdwEUtA
J4jF3AKZgGrevLsGiuzz+LAVyL1dp9BXE+VWid122JlTCV13Jzmd8mGEomGCmgrw97NTaOPhbICP
kS8mMY6ldoQC7GSMiTqwE0Hkf1xyUvQC6XZV/OoFiCe+xbISkpRixncWeFHAmDiR6a9KAGBdCZxt
x1OZeAhupt8Em9hu+VAa9mrsC991z47/6VUqYebqIW+oFR54kqYOwbsOAsSZdbsayoLmwduX9mAL
5nNbRetTd/mGSxf51IuhmiJMyTZSxzTCrfBDpY2W0Yzgt5cUnYWjypJ7wVKYprHDX/iMFwuPhK7P
P1aPpSdaFnUKDuxNJBpvYM/INiEZjRwrXmxZM/nudIyzJJ247pxwwi1V8K5AqCkUNedR3DOdCgok
IlqMDlwkhXldnBD/ryELSSGX/DsIfE+uUqZVUfYHFEBpqSLn0Uvz7Ns5tXaLzQJh9lLb9P18025x
sErtldDP4Jh6cCDtQlnFbUJTSN/ln6/T7/ncWfYC5dv5iVg1QlyoI7/ja0yCKYZ6QfaDebWpl42A
i7wmSt0rABZGgvlkgw/M/IWK7K2eLd0y7AMhiL/sWn7NLiIVJcG0MA9j5jbLyH5dNMHb/mL5kASg
d8+JuQheSeA/Ns58MTFkHhxk/u5pubhCOjeiuawlMzvqUAsYRym0S4w/MFleBwMr3UiRG5qsGaFc
UlP1fxvPXAUL9q1Sje+5ryZbyxA/2Sl5uQFg7OjvqCQF2elezw/Ao4lCA6CvhX3XwZjhzuPkjoZ+
59rh70/j6YPBN4ymc9+4jvXSUa9NmvS+hRTiErh2GMpYYuhHlJI/EKSYLH2izGtsucKsGbinwgjW
zJF8tjkQpv5Us15ItVDh9if2QkJKcBsh1iKZX1kJdYN0Hznqu4ASqV7phFRnVQyZ6d8+3m73Y1yp
Ic8vYJsLx1zOAwnUPHkhMvr50XtYKMUtUnw0Ykiur/Vceg427AdVI7YZh+X8tffGxcVXKiiDjCpA
GSvf+uaIDsb02BjBn/MUfLWGW2+NAqczgX5UeXw4z9wB39a4+msJIqFeRScaQ1kUYEQeSnEzJK1S
wHcat6rvUnr902LxGVqt0QQpJXEpKcjytNa57r3VlJYIrL/ueQIOP2IABss6loUOa9Sv5Kb0Z6Vq
mXnpnrrGRyRCcgZ7V9t33ovLYgHyW5GoCBce3c8PsA8WZWnoQBC+QZ4X0ggxBDQgn/zkskyPLrSi
WRfL8zXVn/fAgy1MbNPrUEJ6AvWX5q/7caK7RRBapZrLfA9l4M41hZwig6KkF3RhFblEQGOBOLha
/qfvGUhl9db6Fv2zI1eJ1KZwZqULAK9uH6MoPuunk37LkSjxJT3Hvavn+aiSbKzAJBHhTWggX++X
JvbpuMg19u5aMY431p53YqqYQbI7ZP/u1Dyp6CfzrjES4krRSDO8Bd5YVcx4zc8JRAwS2tijfuiJ
ySha7AtvXa70heXI2l2Sldazg4j4MlE7kkMa+MgIHvBvgsYvRD5K46Hjc06dfAzzuIcEfRsFcLYs
vOHBsi8v7DmAeuXA25njthflg5IoLOA98aLJm7clMPrEVXgXRtzFNUH7RvTXspyz/krouO624knu
4hsSvayaVt4WOn5ezHsXISLEJX3kbhFy/wzFZYd5hU5c5MsUMlUUxQ9z4e5aJfK6zuaLy21qB1jb
5ncDBSw72lSzv7Dg2GnehOJFUYy0h7Ro0De0fQJVZWl0qbQLPhpTPdGG6JFVRr4ZApo44WFGASY/
MwZduOI8YowRBi7d29oTB95hrcv5/dU4NVZx5SjcTtjIge8s2ucMN8cF9NTXcu5KAOuAXfyDdJmx
i5nHSsDb1xp4MXNr6pA3YOstFuMz69J1JZC1oKwI53tAaHtDERIGngWPwzKBCOAsmdDen0r8HU0A
v4Trrwx7yO9qPTgfjvP4maC+tWNQdxmE4RfZtYL66wfo8crLme1LBRM1AuWGzUgpoOWk7v4MnMea
el2MnFoD11VnAVp73HCD22ZSNY4cdwNu9qUmv/BOopoapg3KM/ifuKqSgjP3vstJxj5ZaIGslaoJ
l9yeWOtOY0rl+LOl1kz8/gJjtdifDvBxn6CcUR9NM11PfCqQvJDFR88DPeK4PhCoSF0eYrDmfyXi
A9weAgr4QugWrvKFgqqr+op4ymyoKkypjMlrAbfmRueDJZbbXJWaZb2+rnTzBXCwHmFBgR1xSD1l
G3rP7XmC6PKZ3fi9TmF7JrYnLxQzcd1WScOdRX9lR0+PzvV4VsFbZCeXOihOtc/TFv2WYoRv6t9f
rLoDPD4DB8DanjHQZLGtLFjDSH2M7fahvF8umR1LRtg7d6G+7IvFvmtIgxdVW2FrCvreKPzIrvK5
HrZSu2rXL8oMKWveL4XeFrtENjyZfh6H/3x3ak29p1RCgTjOSNFc4N/HLTemTPvcRH9rOBF0DWF9
KsocjdD56ekWuDKwpcl/hKCeAb9z4GobwpJopwL+TzETzM1ht8dlafSu+I3gkQ2gmRQJ4GQhUwY3
00AifaSIfgMaB43PhrdnP//vPp0QZ2gZc/FGY+rDBASsqKtLQgYaaCbqGa0960e7Ngs8W017vZvf
n4tPKh63x7OyPZaTScnFjTotX4wlQA2ZpZlxGmKhgmOgim05MQu1dHG4zPBAHH8MDiV/Tx4b8vVn
/hVE2Hf2CVcgA6+B0tZj+/ltg/ruWmItfuRezvrBigfYAFUYVkYpNZAWlnJUigv4WvBHVustXYS7
rNQPtcD6z0B/r51UTtp5Uvdnpd017lqvrPF2Agc0jg7iwPL+R0pGrPvMBYqHPsVpsNjAKra0/r2m
XrL1sd+1O8P+0Pb2UoaF0dkbqnQP+YrerTupDWI2gYeVeXaWZ+/J+sOIMxCFIvzdz0i0ywJpEBTf
7LLLh9333jyYkWh0uWaTGiCxyWnjxJwak6dluh5dmWbqEWU8CQe2MQhf7FXWrZsopeoGTpDSbIxK
BtrB6Eiav5ztABFdQr9tsxiCU7aPJvKoG7i0GAwPYWigGaNywLmv7I0iNa60gbvxjm9dq6fWqEdE
7syhGOwIxFEiIPEFNt37gECZ9VUCUcX/2bt6lnko9wTvlPSsdDTvVi5lgNEQeLT4rZcHJXLSKDfX
HbGp19ZQT+8S4/XXUjJBSOGVpNfh3A3hEHySY7yyiloJt7COLcgXHhH3Z6RpLyz/FxuWq1RCXZxl
Q7tdedMyTOeYwIOrTXTkRLU1hOH145Gzg25T5ifWCQd2B5uGmzjRVQUDXPOjMEQBt1RSIgAPlESK
LufNUOgGlW79ehcituHCoqgPfmH+MIGXGHjMTk0KjfSTYAe4p7JLUmXKOcCWWcZQGlXm3g8elSsJ
kb4EJx6Q47RNnjteP8W70sepfSofuel4vPNLAOqExZDuK44LuU3+dBfvKP/awA0B05ZYeMjZeKZ1
x7U4ulY4MkBsz7C6n+0I6RE8AvpTn2l5YjSU29wp+8i1xS/bXZVW6G5napIcj7VNY+vLFN8KvM87
z66tmKP5wzhofehqpnoD5wDOGTBDUP75/9fsaETSh9yDb47PB9erE4zwU6rPKsZcC3lP1P4fjw8u
kk0/r33FOZAyqzHeP1KvdM2EcTMPH8jln3O+iX96p22r1Nir/iKGBuI6jgEkJbp/luczMUmNTrqN
LF6t2nMdfBkuFyAOvvXG4YKLt0Bf4lj6ZqYQaZMbW8FLPPyNJsr9Q+WQshRfPZTckVLFAG4OoNJt
IZ2cR7dzmWrbwgGMA4k2KG+35ypU2zulCyIRrLtbw/1Apz9dB42gro7Ry3RCjVwmve3jJNDjlNQN
oKse1wkcwPgIOFojH47ED4hS23kDs21B4Cz4b4Lsk+9zpH//p+oB3sng/K29NcrFZJvZDesb1+9I
ri12ri3EMgMzsPHttk+DoQvUMriHDGaxDFUgAdq26H0/oesxXmj0R6lqkw8uyOvldV8/Lz25+e2w
PX5fIS0rxuXO3oNjfKdIe8NjAc5chRriy8mS+CHFkiw8Q14XXU3OXTHZOZeKOh53qNJF90uqJ1QG
j1A7x+aL7EqWkGakHXqWEACXFGH/GRmsSK2URiTCG986Coqfy08idehieS4UlRcVKRSnIDYGDxUz
4d6aNpT2domNLwhjUvzX+WAFwXuZsEokCUT3HkaqWPzTnjlU/OXw/fy/G/J2WutSUgl04F4IsuXW
bFiUy4JZS6fYsx2MreulDcswLbR7C185Ru1dyRGabSU1W8nHbfwbMpaf7ZY/Bnvj5QukYBQZYd92
q8OtPgePxMDpvebhr2dcoE8RdD8Bu/ipzQCA7V7tDr1o5POiaBAI8opUd6mNg9YEPLNXZOcqyvbq
ESqo5E2CpfTT7HQlJKMwXPP4TR5LP8smSAr9vM54Qvav0+SEl8iBbOT4QsVK3jpjPrDxId7RzjFD
wFdJPSnfbVGIRgkZbCkqC2fG8DqBW/hDLMRIMaxCxhZQT9w2lxk76tV+xxNaWmCQuF/zJ+FBRPCg
Osdw0NveQdWbvE0xpPBQinl+I0q0Ztacfit0opDlQGCd/p2lbkmIk28TdRp6rJvszKErecA5KbSy
O1ccu8QC5wj2SeQ/d+f+ZdH7iyqlTKWQkaA0MdNbGebWOLCej23rOC5+i5FOIgcUk6qli9f6IrOo
xi6za0Hao2vrz8/18HPbqQiDiPJ2uvO+5FOcLCvCZMngz73vZRk7HcbWhu6FwtJzuCNLOCSh8w93
Gte1GEZ+jNhFfO/HHiTgakl6YuyQNF/G6qDdf/Dgfs4sxT4F4bEzbUjxBZ7frxYhq5O9LiJT96fN
KE/ctwQvxJw2GjeRa+sFMvai3FoykIz1vdQffmjkwS9kxvar6kFBHY4Hu2MOWzLg5vx/ujLCb/vm
VyHzeT8MqQGxw0ztFscSsv7H1jUYYzxVU0/FGlpcUF7GamXZwA0YBkI89ERpdLqLXCyeMZ9KGHZO
bwPVUuOUIFrsxrfXUneYHfuqycCBs3FOq2UFDb60VAoDlESxO+bf91N10HBrrDn0/kdCl8o8aO9l
kqgDP16LUMabUiPoCzqw6BSatT4C5lCczWBR1eBuSQjDnoichiGr8jrkSowQ1mRwRh3eudPzLLTs
1A1sTUInlqYj7AHd/AoOILmp8heIVccA0dOm73/lu9sx8KmnWiVujoTpJw==
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
