// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
// Date        : Sat Feb  1 20:41:47 2025
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
    ena,
    wea,
    addra,
    dina,
    clkb,
    enb,
    addrb,
    doutb);
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTA, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clka;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA EN" *) input ena;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA WE" *) input [0:0]wea;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [5:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DIN" *) input [15:0]dina;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTB, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clkb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB EN" *) input enb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB ADDR" *) input [5:0]addrb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB DOUT" *) output [15:0]doutb;

  wire [5:0]addra;
  wire [5:0]addrb;
  wire clka;
  wire clkb;
  wire [15:0]dina;
  wire [15:0]doutb;
  wire ena;
  wire enb;
  wire [0:0]wea;
  wire NLW_U0_dbiterr_UNCONNECTED;
  wire NLW_U0_rsta_busy_UNCONNECTED;
  wire NLW_U0_rstb_busy_UNCONNECTED;
  wire NLW_U0_s_axi_arready_UNCONNECTED;
  wire NLW_U0_s_axi_awready_UNCONNECTED;
  wire NLW_U0_s_axi_bvalid_UNCONNECTED;
  wire NLW_U0_s_axi_dbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_rlast_UNCONNECTED;
  wire NLW_U0_s_axi_rvalid_UNCONNECTED;
  wire NLW_U0_s_axi_sbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_wready_UNCONNECTED;
  wire NLW_U0_sbiterr_UNCONNECTED;
  wire [15:0]NLW_U0_douta_UNCONNECTED;
  wire [5:0]NLW_U0_rdaddrecc_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [5:0]NLW_U0_s_axi_rdaddrecc_UNCONNECTED;
  wire [15:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;

  (* C_ADDRA_WIDTH = "6" *) 
  (* C_ADDRB_WIDTH = "6" *) 
  (* C_ALGORITHM = "1" *) 
  (* C_AXI_ID_WIDTH = "4" *) 
  (* C_AXI_SLAVE_TYPE = "0" *) 
  (* C_AXI_TYPE = "1" *) 
  (* C_BYTE_SIZE = "9" *) 
  (* C_COMMON_CLK = "0" *) 
  (* C_COUNT_18K_BRAM = "1" *) 
  (* C_COUNT_36K_BRAM = "0" *) 
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
  (* C_EN_SAFETY_CKT = "0" *) 
  (* C_EN_SHUTDOWN_PIN = "0" *) 
  (* C_EN_SLEEP_PIN = "0" *) 
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     0.687555 mW" *) 
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
  (* C_HAS_RSTA = "0" *) 
  (* C_HAS_RSTB = "0" *) 
  (* C_HAS_SOFTECC_INPUT_REGS_A = "0" *) 
  (* C_HAS_SOFTECC_OUTPUT_REGS_B = "0" *) 
  (* C_INITA_VAL = "0" *) 
  (* C_INITB_VAL = "0" *) 
  (* C_INIT_FILE = "blk_mem_gen_1.mem" *) 
  (* C_INIT_FILE_NAME = "no_coe_file_loaded" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_LOAD_INIT_FILE = "0" *) 
  (* C_MEM_TYPE = "1" *) 
  (* C_MUX_PIPELINE_STAGES = "0" *) 
  (* C_PRIM_TYPE = "1" *) 
  (* C_READ_DEPTH_A = "64" *) 
  (* C_READ_DEPTH_B = "64" *) 
  (* C_READ_LATENCY_A = "1" *) 
  (* C_READ_LATENCY_B = "1" *) 
  (* C_READ_WIDTH_A = "16" *) 
  (* C_READ_WIDTH_B = "16" *) 
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
  (* C_WRITE_DEPTH_A = "64" *) 
  (* C_WRITE_DEPTH_B = "64" *) 
  (* C_WRITE_MODE_A = "WRITE_FIRST" *) 
  (* C_WRITE_MODE_B = "WRITE_FIRST" *) 
  (* C_WRITE_WIDTH_A = "16" *) 
  (* C_WRITE_WIDTH_B = "16" *) 
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
        .dinb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .douta(NLW_U0_douta_UNCONNECTED[15:0]),
        .doutb(doutb),
        .eccpipece(1'b0),
        .ena(ena),
        .enb(enb),
        .injectdbiterr(1'b0),
        .injectsbiterr(1'b0),
        .rdaddrecc(NLW_U0_rdaddrecc_UNCONNECTED[5:0]),
        .regcea(1'b0),
        .regceb(1'b0),
        .rsta(1'b0),
        .rsta_busy(NLW_U0_rsta_busy_UNCONNECTED),
        .rstb(1'b0),
        .rstb_busy(NLW_U0_rstb_busy_UNCONNECTED),
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
        .s_axi_rdaddrecc(NLW_U0_s_axi_rdaddrecc_UNCONNECTED[5:0]),
        .s_axi_rdata(NLW_U0_s_axi_rdata_UNCONNECTED[15:0]),
        .s_axi_rid(NLW_U0_s_axi_rid_UNCONNECTED[3:0]),
        .s_axi_rlast(NLW_U0_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(1'b0),
        .s_axi_rresp(NLW_U0_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_rvalid(NLW_U0_s_axi_rvalid_UNCONNECTED),
        .s_axi_sbiterr(NLW_U0_s_axi_sbiterr_UNCONNECTED),
        .s_axi_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wlast(1'b0),
        .s_axi_wready(NLW_U0_s_axi_wready_UNCONNECTED),
        .s_axi_wstrb(1'b0),
        .s_axi_wvalid(1'b0),
        .sbiterr(NLW_U0_sbiterr_UNCONNECTED),
        .shutdown(1'b0),
        .sleep(1'b0),
        .wea(wea),
        .web(1'b0));
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 22960)
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
