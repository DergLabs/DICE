// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
// Date        : Mon May  5 19:25:32 2025
// Host        : DESKTOP-U9NB2CD running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top input_pixel_hold_ram -prefix
//               input_pixel_hold_ram_ input_pixel_hold_ram_sim_netlist.v
// Design      : input_pixel_hold_ram
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xcku3p-ffva676-2-i
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "input_pixel_hold_ram,blk_mem_gen_v8_4_7,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_7,Vivado 2023.2" *) 
(* NotValidForBitStream *)
module input_pixel_hold_ram
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
  input_pixel_hold_ram_blk_mem_gen_v8_4_7 U0
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 56736)
`pragma protect data_block
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
FkImOzYDfxo17yIQXsMPv4+i5cHv
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
