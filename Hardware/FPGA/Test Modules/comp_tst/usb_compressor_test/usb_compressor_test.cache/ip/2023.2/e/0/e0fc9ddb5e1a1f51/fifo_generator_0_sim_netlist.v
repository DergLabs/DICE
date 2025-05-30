// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
// Date        : Sat Jan 25 18:36:33 2025
// Host        : DESKTOP-U9NB2CD running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ fifo_generator_0_sim_netlist.v
// Design      : fifo_generator_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xcku3p-ffva676-2-i
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "fifo_generator_0,fifo_generator_v13_2_9,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "fifo_generator_v13_2_9,Vivado 2023.2" *) 
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
    valid,
    wr_rst_busy,
    rd_rst_busy);
  input srst;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 write_clk CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME write_clk, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, INSERT_VIP 0" *) input wr_clk;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 read_clk CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME read_clk, FREQ_HZ 200000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, INSERT_VIP 0" *) input rd_clk;
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
  (* C_PRELOAD_LATENCY = "2" *) 
  (* C_PRELOAD_REGS = "1" *) 
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
  (* C_RD_FREQ = "200" *) 
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
  (* C_USE_EMBEDDED_REG = "1" *) 
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
