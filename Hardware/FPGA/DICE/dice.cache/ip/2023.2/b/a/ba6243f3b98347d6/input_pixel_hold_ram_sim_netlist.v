// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
// Date        : Mon May  5 19:25:32 2025
// Host        : DESKTOP-U9NB2CD running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ input_pixel_hold_ram_sim_netlist.v
// Design      : input_pixel_hold_ram
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xcku3p-ffva676-2-i
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "input_pixel_hold_ram,blk_mem_gen_v8_4_7,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_7,Vivado 2023.2" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
   (clka,
    ena,
    wea,
    addra,
    dina,
    clkb,
    rstb,
    enb,
    addrb,
    doutb,
    rsta_busy,
    rstb_busy);
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTA, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clka;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA EN" *) input ena;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA WE" *) input [0:0]wea;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [11:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DIN" *) input [15:0]dina;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTB, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clkb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB RST" *) input rstb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB EN" *) input enb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB ADDR" *) input [11:0]addrb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB DOUT" *) output [15:0]doutb;
  output rsta_busy;
  output rstb_busy;

  wire [11:0]addra;
  wire [11:0]addrb;
  wire clka;
  wire clkb;
  wire [15:0]dina;
  wire [15:0]doutb;
  wire ena;
  wire enb;
  wire rsta_busy;
  wire rstb;
  wire rstb_busy;
  wire [0:0]wea;
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
  wire [15:0]NLW_U0_douta_UNCONNECTED;
  wire [11:0]NLW_U0_rdaddrecc_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [11:0]NLW_U0_s_axi_rdaddrecc_UNCONNECTED;
  wire [15:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;

  (* C_ADDRA_WIDTH = "12" *) 
  (* C_ADDRB_WIDTH = "12" *) 
  (* C_ALGORITHM = "1" *) 
  (* C_AXI_ID_WIDTH = "4" *) 
  (* C_AXI_SLAVE_TYPE = "0" *) 
  (* C_AXI_TYPE = "1" *) 
  (* C_BYTE_SIZE = "9" *) 
  (* C_COMMON_CLK = "0" *) 
  (* C_COUNT_18K_BRAM = "0" *) 
  (* C_COUNT_36K_BRAM = "2" *) 
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
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     6.641901 mW" *) 
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
  (* C_HAS_RSTB = "1" *) 
  (* C_HAS_SOFTECC_INPUT_REGS_A = "0" *) 
  (* C_HAS_SOFTECC_OUTPUT_REGS_B = "0" *) 
  (* C_INITA_VAL = "0" *) 
  (* C_INITB_VAL = "0" *) 
  (* C_INIT_FILE = "input_pixel_hold_ram.mem" *) 
  (* C_INIT_FILE_NAME = "no_coe_file_loaded" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_LOAD_INIT_FILE = "0" *) 
  (* C_MEM_TYPE = "1" *) 
  (* C_MUX_PIPELINE_STAGES = "0" *) 
  (* C_PRIM_TYPE = "1" *) 
  (* C_READ_DEPTH_A = "4096" *) 
  (* C_READ_DEPTH_B = "4096" *) 
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
  (* C_WRITE_DEPTH_A = "4096" *) 
  (* C_WRITE_DEPTH_B = "4096" *) 
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
        .rdaddrecc(NLW_U0_rdaddrecc_UNCONNECTED[11:0]),
        .regcea(1'b0),
        .regceb(1'b0),
        .rsta(1'b0),
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
        .s_axi_rdaddrecc(NLW_U0_s_axi_rdaddrecc_UNCONNECTED[11:0]),
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 57056)
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
