// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
// Date        : Fri Feb  7 06:30:07 2025
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
  wire [11:0]NLW_U0_data_count_UNCONNECTED;
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
  wire [10:0]NLW_U0_rd_data_count_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_buser_UNCONNECTED;
  wire [63:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_ruser_UNCONNECTED;
  wire [11:0]NLW_U0_wr_data_count_UNCONNECTED;

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
  (* C_DATA_COUNT_WIDTH = "12" *) 
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
  (* C_PRIM_FIFO_TYPE = "4kx9" *) 
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
  (* C_PROG_FULL_THRESH_ASSERT_VAL = "4095" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_AXIS = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_RACH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_RDCH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WACH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WDCH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WRCH = "1023" *) 
  (* C_PROG_FULL_THRESH_NEGATE_VAL = "4094" *) 
  (* C_PROG_FULL_TYPE = "0" *) 
  (* C_PROG_FULL_TYPE_AXIS = "0" *) 
  (* C_PROG_FULL_TYPE_RACH = "0" *) 
  (* C_PROG_FULL_TYPE_RDCH = "0" *) 
  (* C_PROG_FULL_TYPE_WACH = "0" *) 
  (* C_PROG_FULL_TYPE_WDCH = "0" *) 
  (* C_PROG_FULL_TYPE_WRCH = "0" *) 
  (* C_RACH_TYPE = "0" *) 
  (* C_RDCH_TYPE = "0" *) 
  (* C_RD_DATA_COUNT_WIDTH = "11" *) 
  (* C_RD_DEPTH = "2048" *) 
  (* C_RD_FREQ = "1" *) 
  (* C_RD_PNTR_WIDTH = "11" *) 
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
  (* C_WR_DATA_COUNT_WIDTH = "12" *) 
  (* C_WR_DEPTH = "4096" *) 
  (* C_WR_DEPTH_AXIS = "1024" *) 
  (* C_WR_DEPTH_RACH = "16" *) 
  (* C_WR_DEPTH_RDCH = "1024" *) 
  (* C_WR_DEPTH_WACH = "16" *) 
  (* C_WR_DEPTH_WDCH = "1024" *) 
  (* C_WR_DEPTH_WRCH = "16" *) 
  (* C_WR_FREQ = "1" *) 
  (* C_WR_PNTR_WIDTH = "12" *) 
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
        .data_count(NLW_U0_data_count_UNCONNECTED[11:0]),
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
        .prog_empty_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_empty_thresh_assert({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_empty_thresh_negate({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_full(NLW_U0_prog_full_UNCONNECTED),
        .prog_full_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_full_thresh_assert({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_full_thresh_negate({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .rd_clk(rd_clk),
        .rd_data_count(NLW_U0_rd_data_count_UNCONNECTED[10:0]),
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
        .wr_data_count(NLW_U0_wr_data_count_UNCONNECTED[11:0]),
        .wr_en(wr_en),
        .wr_rst(1'b0),
        .wr_rst_busy(wr_rst_busy));
endmodule

(* DEST_SYNC_FF = "2" *) (* INIT_SYNC_FF = "0" *) (* ORIG_REF_NAME = "xpm_cdc_gray" *) 
(* REG_OUTPUT = "1" *) (* SIM_ASSERT_CHK = "0" *) (* SIM_LOSSLESS_GRAY_CHK = "0" *) 
(* VERSION = "0" *) (* WIDTH = "12" *) (* XPM_MODULE = "TRUE" *) 
(* is_du_within_envelope = "true" *) (* keep_hierarchy = "true" *) (* xpm_cdc = "GRAY" *) 
module fifo_generator_1_xpm_cdc_gray
   (src_clk,
    src_in_bin,
    dest_clk,
    dest_out_bin);
  input src_clk;
  input [11:0]src_in_bin;
  input dest_clk;
  output [11:0]dest_out_bin;

  wire [11:0]async_path;
  wire [10:0]binval;
  wire dest_clk;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "GRAY" *) wire [11:0]\dest_graysync_ff[0] ;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "GRAY" *) wire [11:0]\dest_graysync_ff[1] ;
  wire [11:0]dest_out_bin;
  wire [10:0]gray_enc;
  wire src_clk;
  wire [11:0]src_in_bin;

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
  FDRE \dest_graysync_ff_reg[0][11] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[11]),
        .Q(\dest_graysync_ff[0] [11]),
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
  FDRE \dest_graysync_ff_reg[1][11] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [11]),
        .Q(\dest_graysync_ff[1] [11]),
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
  LUT2 #(
    .INIT(4'h6)) 
    \dest_out_bin_ff[0]_i_1 
       (.I0(\dest_graysync_ff[1] [0]),
        .I1(binval[1]),
        .O(binval[0]));
  LUT2 #(
    .INIT(4'h6)) 
    \dest_out_bin_ff[10]_i_1 
       (.I0(\dest_graysync_ff[1] [10]),
        .I1(\dest_graysync_ff[1] [11]),
        .O(binval[10]));
  LUT6 #(
    .INIT(64'h6996966996696996)) 
    \dest_out_bin_ff[1]_i_1 
       (.I0(\dest_graysync_ff[1] [1]),
        .I1(\dest_graysync_ff[1] [3]),
        .I2(\dest_graysync_ff[1] [5]),
        .I3(binval[6]),
        .I4(\dest_graysync_ff[1] [4]),
        .I5(\dest_graysync_ff[1] [2]),
        .O(binval[1]));
  LUT5 #(
    .INIT(32'h96696996)) 
    \dest_out_bin_ff[2]_i_1 
       (.I0(\dest_graysync_ff[1] [2]),
        .I1(\dest_graysync_ff[1] [4]),
        .I2(binval[6]),
        .I3(\dest_graysync_ff[1] [5]),
        .I4(\dest_graysync_ff[1] [3]),
        .O(binval[2]));
  LUT4 #(
    .INIT(16'h6996)) 
    \dest_out_bin_ff[3]_i_1 
       (.I0(\dest_graysync_ff[1] [3]),
        .I1(\dest_graysync_ff[1] [5]),
        .I2(binval[6]),
        .I3(\dest_graysync_ff[1] [4]),
        .O(binval[3]));
  LUT3 #(
    .INIT(8'h96)) 
    \dest_out_bin_ff[4]_i_1 
       (.I0(\dest_graysync_ff[1] [4]),
        .I1(binval[6]),
        .I2(\dest_graysync_ff[1] [5]),
        .O(binval[4]));
  LUT2 #(
    .INIT(4'h6)) 
    \dest_out_bin_ff[5]_i_1 
       (.I0(\dest_graysync_ff[1] [5]),
        .I1(binval[6]),
        .O(binval[5]));
  LUT6 #(
    .INIT(64'h6996966996696996)) 
    \dest_out_bin_ff[6]_i_1 
       (.I0(\dest_graysync_ff[1] [6]),
        .I1(\dest_graysync_ff[1] [8]),
        .I2(\dest_graysync_ff[1] [10]),
        .I3(\dest_graysync_ff[1] [11]),
        .I4(\dest_graysync_ff[1] [9]),
        .I5(\dest_graysync_ff[1] [7]),
        .O(binval[6]));
  LUT5 #(
    .INIT(32'h96696996)) 
    \dest_out_bin_ff[7]_i_1 
       (.I0(\dest_graysync_ff[1] [7]),
        .I1(\dest_graysync_ff[1] [9]),
        .I2(\dest_graysync_ff[1] [11]),
        .I3(\dest_graysync_ff[1] [10]),
        .I4(\dest_graysync_ff[1] [8]),
        .O(binval[7]));
  LUT4 #(
    .INIT(16'h6996)) 
    \dest_out_bin_ff[8]_i_1 
       (.I0(\dest_graysync_ff[1] [8]),
        .I1(\dest_graysync_ff[1] [10]),
        .I2(\dest_graysync_ff[1] [11]),
        .I3(\dest_graysync_ff[1] [9]),
        .O(binval[8]));
  LUT3 #(
    .INIT(8'h96)) 
    \dest_out_bin_ff[9]_i_1 
       (.I0(\dest_graysync_ff[1] [9]),
        .I1(\dest_graysync_ff[1] [11]),
        .I2(\dest_graysync_ff[1] [10]),
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
        .D(binval[10]),
        .Q(dest_out_bin[10]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[11] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[1] [11]),
        .Q(dest_out_bin[11]),
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
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[10]_i_1 
       (.I0(src_in_bin[11]),
        .I1(src_in_bin[10]),
        .O(gray_enc[10]));
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
        .D(gray_enc[10]),
        .Q(async_path[10]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[11] 
       (.C(src_clk),
        .CE(1'b1),
        .D(src_in_bin[11]),
        .Q(async_path[11]),
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
(* VERSION = "0" *) (* WIDTH = "11" *) (* XPM_MODULE = "TRUE" *) 
(* is_du_within_envelope = "true" *) (* keep_hierarchy = "true" *) (* xpm_cdc = "GRAY" *) 
module fifo_generator_1_xpm_cdc_gray__parameterized1
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
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[8]_i_1 
       (.I0(src_in_bin[9]),
        .I1(src_in_bin[8]),
        .O(gray_enc[8]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
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

(* DEST_SYNC_FF = "5" *) (* INIT_SYNC_FF = "0" *) (* ORIG_REF_NAME = "xpm_cdc_single" *) 
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
(* INIT_SYNC_FF = "0" *) (* ORIG_REF_NAME = "xpm_cdc_sync_rst" *) (* SIM_ASSERT_CHK = "0" *) 
(* VERSION = "0" *) (* XPM_MODULE = "TRUE" *) (* is_du_within_envelope = "true" *) 
(* keep_hierarchy = "true" *) (* xpm_cdc = "SYNC_RST" *) 
module fifo_generator_1_xpm_cdc_sync_rst
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
module fifo_generator_1_xpm_cdc_sync_rst__2
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
module fifo_generator_1_xpm_cdc_sync_rst__parameterized2
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 154496)
`pragma protect data_block
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
S70soTovijePvXH+WFVXmNO4gnGz6PgSUno=
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
