// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
// Date        : Fri Dec 13 16:34:32 2024
// Host        : DESKTOP-U9NB2CD running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ blk_mem_gen_1_sim_netlist.v
// Design      : blk_mem_gen_1
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xcku3p-ffva676-2-i
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "blk_mem_gen_1,blk_mem_gen_v8_4_7,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_7,Vivado 2023.2" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
   (clka,
    rsta,
    ena,
    wea,
    addra,
    dina,
    douta,
    clkb,
    rstb,
    enb,
    web,
    addrb,
    dinb,
    doutb,
    rsta_busy,
    rstb_busy);
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTA, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clka;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA RST" *) input rsta;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA EN" *) input ena;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA WE" *) input [0:0]wea;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [10:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DIN" *) input [23:0]dina;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DOUT" *) output [23:0]douta;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTB, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clkb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB RST" *) input rstb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB EN" *) input enb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB WE" *) input [0:0]web;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB ADDR" *) input [10:0]addrb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB DIN" *) input [23:0]dinb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB DOUT" *) output [23:0]doutb;
  output rsta_busy;
  output rstb_busy;

  wire [10:0]addra;
  wire [10:0]addrb;
  wire clka;
  wire clkb;
  wire [23:0]dina;
  wire [23:0]dinb;
  wire [23:0]douta;
  wire [23:0]doutb;
  wire ena;
  wire enb;
  wire rsta;
  wire rsta_busy;
  wire rstb;
  wire rstb_busy;
  wire [0:0]wea;
  wire [0:0]web;
  wire NLW_U0_dbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_arready_UNCONNECTED;
  wire NLW_U0_s_axi_awready_UNCONNECTED;
  wire NLW_U0_s_axi_bvalid_UNCONNECTED;
  wire NLW_U0_s_axi_dbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_rlast_UNCONNECTED;
  wire NLW_U0_s_axi_rvalid_UNCONNECTED;
  wire NLW_U0_s_axi_sbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_wready_UNCONNECTED;
  wire NLW_U0_sbiterr_UNCONNECTED;
  wire [10:0]NLW_U0_rdaddrecc_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [10:0]NLW_U0_s_axi_rdaddrecc_UNCONNECTED;
  wire [23:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;

  (* C_ADDRA_WIDTH = "11" *) 
  (* C_ADDRB_WIDTH = "11" *) 
  (* C_ALGORITHM = "1" *) 
  (* C_AXI_ID_WIDTH = "4" *) 
  (* C_AXI_SLAVE_TYPE = "0" *) 
  (* C_AXI_TYPE = "1" *) 
  (* C_BYTE_SIZE = "9" *) 
  (* C_COMMON_CLK = "0" *) 
  (* C_COUNT_18K_BRAM = "1" *) 
  (* C_COUNT_36K_BRAM = "1" *) 
  (* C_CTRL_ECC_ALGO = "NONE" *) 
  (* C_DEFAULT_DATA = "0" *) 
  (* C_DISABLE_WARN_BHV_COLL = "0" *) 
  (* C_DISABLE_WARN_BHV_RANGE = "0" *) 
  (* C_ELABORATION_DIR = "./" *) 
  (* C_ENABLE_32BIT_ADDRESS = "0" *) 
  (* C_EN_DEEPSLEEP_PIN = "0" *) 
  (* C_EN_ECC_PIPE = "0" *) 
  (* C_EN_RDADDRA_CHG = "0" *) 
  (* C_EN_RDADDRB_CHG = "0" *) 
  (* C_EN_SAFETY_CKT = "1" *) 
  (* C_EN_SHUTDOWN_PIN = "0" *) 
  (* C_EN_SLEEP_PIN = "0" *) 
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     5.826343 mW" *) 
  (* C_FAMILY = "kintexuplus" *) 
  (* C_HAS_AXI_ID = "0" *) 
  (* C_HAS_ENA = "1" *) 
  (* C_HAS_ENB = "1" *) 
  (* C_HAS_INJECTERR = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_A = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_A = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_REGCEA = "0" *) 
  (* C_HAS_REGCEB = "0" *) 
  (* C_HAS_RSTA = "1" *) 
  (* C_HAS_RSTB = "1" *) 
  (* C_HAS_SOFTECC_INPUT_REGS_A = "0" *) 
  (* C_HAS_SOFTECC_OUTPUT_REGS_B = "0" *) 
  (* C_INITA_VAL = "0" *) 
  (* C_INITB_VAL = "0" *) 
  (* C_INIT_FILE = "blk_mem_gen_1.mem" *) 
  (* C_INIT_FILE_NAME = "no_coe_file_loaded" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_LOAD_INIT_FILE = "0" *) 
  (* C_MEM_TYPE = "2" *) 
  (* C_MUX_PIPELINE_STAGES = "0" *) 
  (* C_PRIM_TYPE = "1" *) 
  (* C_READ_DEPTH_A = "2048" *) 
  (* C_READ_DEPTH_B = "2048" *) 
  (* C_READ_LATENCY_A = "1" *) 
  (* C_READ_LATENCY_B = "1" *) 
  (* C_READ_WIDTH_A = "24" *) 
  (* C_READ_WIDTH_B = "24" *) 
  (* C_RSTRAM_A = "0" *) 
  (* C_RSTRAM_B = "0" *) 
  (* C_RST_PRIORITY_A = "CE" *) 
  (* C_RST_PRIORITY_B = "CE" *) 
  (* C_SIM_COLLISION_CHECK = "ALL" *) 
  (* C_USE_BRAM_BLOCK = "0" *) 
  (* C_USE_BYTE_WEA = "0" *) 
  (* C_USE_BYTE_WEB = "0" *) 
  (* C_USE_DEFAULT_DATA = "0" *) 
  (* C_USE_ECC = "0" *) 
  (* C_USE_SOFTECC = "0" *) 
  (* C_USE_URAM = "0" *) 
  (* C_WEA_WIDTH = "1" *) 
  (* C_WEB_WIDTH = "1" *) 
  (* C_WRITE_DEPTH_A = "2048" *) 
  (* C_WRITE_DEPTH_B = "2048" *) 
  (* C_WRITE_MODE_A = "WRITE_FIRST" *) 
  (* C_WRITE_MODE_B = "WRITE_FIRST" *) 
  (* C_WRITE_WIDTH_A = "24" *) 
  (* C_WRITE_WIDTH_B = "24" *) 
  (* C_XDEVICEFAMILY = "kintexuplus" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_v8_4_7 U0
       (.addra(addra),
        .addrb(addrb),
        .clka(clka),
        .clkb(clkb),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .deepsleep(1'b0),
        .dina(dina),
        .dinb(dinb),
        .douta(douta),
        .doutb(doutb),
        .eccpipece(1'b0),
        .ena(ena),
        .enb(enb),
        .injectdbiterr(1'b0),
        .injectsbiterr(1'b0),
        .rdaddrecc(NLW_U0_rdaddrecc_UNCONNECTED[10:0]),
        .regcea(1'b0),
        .regceb(1'b0),
        .rsta(rsta),
        .rsta_busy(rsta_busy),
        .rstb(rstb),
        .rstb_busy(rstb_busy),
        .s_aclk(1'b0),
        .s_aresetn(1'b0),
        .s_axi_araddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arburst({1'b0,1'b0}),
        .s_axi_arid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arready(NLW_U0_s_axi_arready_UNCONNECTED),
        .s_axi_arsize({1'b0,1'b0,1'b0}),
        .s_axi_arvalid(1'b0),
        .s_axi_awaddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awburst({1'b0,1'b0}),
        .s_axi_awid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awready(NLW_U0_s_axi_awready_UNCONNECTED),
        .s_axi_awsize({1'b0,1'b0,1'b0}),
        .s_axi_awvalid(1'b0),
        .s_axi_bid(NLW_U0_s_axi_bid_UNCONNECTED[3:0]),
        .s_axi_bready(1'b0),
        .s_axi_bresp(NLW_U0_s_axi_bresp_UNCONNECTED[1:0]),
        .s_axi_bvalid(NLW_U0_s_axi_bvalid_UNCONNECTED),
        .s_axi_dbiterr(NLW_U0_s_axi_dbiterr_UNCONNECTED),
        .s_axi_injectdbiterr(1'b0),
        .s_axi_injectsbiterr(1'b0),
        .s_axi_rdaddrecc(NLW_U0_s_axi_rdaddrecc_UNCONNECTED[10:0]),
        .s_axi_rdata(NLW_U0_s_axi_rdata_UNCONNECTED[23:0]),
        .s_axi_rid(NLW_U0_s_axi_rid_UNCONNECTED[3:0]),
        .s_axi_rlast(NLW_U0_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(1'b0),
        .s_axi_rresp(NLW_U0_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_rvalid(NLW_U0_s_axi_rvalid_UNCONNECTED),
        .s_axi_sbiterr(NLW_U0_s_axi_sbiterr_UNCONNECTED),
        .s_axi_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wlast(1'b0),
        .s_axi_wready(NLW_U0_s_axi_wready_UNCONNECTED),
        .s_axi_wstrb(1'b0),
        .s_axi_wvalid(1'b0),
        .sbiterr(NLW_U0_sbiterr_UNCONNECTED),
        .shutdown(1'b0),
        .sleep(1'b0),
        .wea(wea),
        .web(web));
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 51776)
`pragma protect data_block
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
uWr84YLcSpHKSSuQzbH9r2qEclE=
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
