// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
// Date        : Sat Feb  1 21:08:48 2025
// Host        : DESKTOP-U9NB2CD running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ blk_mem_gen_2_sim_netlist.v
// Design      : blk_mem_gen_2
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xcku3p-ffva676-2-i
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "blk_mem_gen_2,blk_mem_gen_v8_4_7,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_7,Vivado 2023.2" *) 
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
  (* C_INIT_FILE = "blk_mem_gen_2.mem" *) 
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
  (* C_WRITE_MODE_A = "NO_CHANGE" *) 
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
