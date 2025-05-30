// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
// Date        : Mon May  5 19:25:33 2025
// Host        : DESKTOP-U9NB2CD running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               c:/Users/johnh/Desktop/DICE/Hardware/FPGA/DICE/dice.gen/sources_1/ip/input_pixel_hold_ram/input_pixel_hold_ram_sim_netlist.v
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 57024)
`pragma protect data_block
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
09U18WY9KaFN4B1gT70D1pTv/5jtDL61
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
