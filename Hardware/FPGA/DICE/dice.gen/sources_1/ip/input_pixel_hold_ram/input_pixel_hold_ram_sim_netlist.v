// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (lin64) Build 4029153 Fri Oct 13 20:13:54 MDT 2023
// Date        : Thu Feb 27 16:17:29 2025
// Host        : john-linux-desktop running 64-bit Ubuntu 22.04.5 LTS
// Command     : write_verilog -force -mode funcsim
//               /home/john/Desktop/DICE/Hardware/FPGA/DICE/dice.gen/sources_1/ip/input_pixel_hold_ram/input_pixel_hold_ram_sim_netlist.v
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
RUjOgI81Uk9wTeAUtOnnjf4vYGjjtEhq
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
