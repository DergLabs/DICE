// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
// Date        : Sat May  3 00:07:21 2025
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
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [10:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DIN" *) input [15:0]dina;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTB, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clkb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB RST" *) input rstb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB EN" *) input enb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB ADDR" *) input [10:0]addrb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB DOUT" *) output [15:0]doutb;
  output rsta_busy;
  output rstb_busy;

  wire [10:0]addra;
  wire [10:0]addrb;
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
  wire [10:0]NLW_U0_rdaddrecc_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [10:0]NLW_U0_s_axi_rdaddrecc_UNCONNECTED;
  wire [15:0]NLW_U0_s_axi_rdata_UNCONNECTED;
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
  (* C_COUNT_18K_BRAM = "0" *) 
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
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     3.55895 mW" *) 
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
  (* C_READ_DEPTH_A = "2048" *) 
  (* C_READ_DEPTH_B = "2048" *) 
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
  (* C_WRITE_DEPTH_A = "2048" *) 
  (* C_WRITE_DEPTH_B = "2048" *) 
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
        .rdaddrecc(NLW_U0_rdaddrecc_UNCONNECTED[10:0]),
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
        .s_axi_rdaddrecc(NLW_U0_s_axi_rdaddrecc_UNCONNECTED[10:0]),
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 35984)
`pragma protect data_block
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
mzZt3ZDyglERDalU/QSBwEY=
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
