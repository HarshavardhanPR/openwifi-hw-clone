// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2021.1 (win64) Build 3247384 Thu Jun 10 19:36:33 MDT 2021
// Date        : Tue Jul 22 22:15:11 2025
// Host        : MyASUS running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               c:/Users/ASUS/Downloads/Openofdm/openofdm-dot11zynq/Wifi/ip_repo/rot_lut/rot_lut_sim_netlist.v
// Design      : rot_lut
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z020clg484-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "rot_lut,blk_mem_gen_v8_4_4,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_4,Vivado 2021.1" *) 
(* NotValidForBitStream *)
module rot_lut
   (clka,
    addra,
    douta,
    clkb,
    addrb,
    doutb);
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTA, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clka;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [8:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DOUT" *) output [31:0]douta;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTB, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clkb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB ADDR" *) input [8:0]addrb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB DOUT" *) output [31:0]doutb;

  wire [8:0]addra;
  wire [8:0]addrb;
  wire clka;
  wire [31:0]douta;
  wire [31:0]doutb;
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
  wire [8:0]NLW_U0_rdaddrecc_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [8:0]NLW_U0_s_axi_rdaddrecc_UNCONNECTED;
  wire [31:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;

  (* C_ADDRA_WIDTH = "9" *) 
  (* C_ADDRB_WIDTH = "9" *) 
  (* C_ALGORITHM = "1" *) 
  (* C_AXI_ID_WIDTH = "4" *) 
  (* C_AXI_SLAVE_TYPE = "0" *) 
  (* C_AXI_TYPE = "1" *) 
  (* C_BYTE_SIZE = "9" *) 
  (* C_COMMON_CLK = "1" *) 
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
  (* C_EN_SAFETY_CKT = "0" *) 
  (* C_EN_SHUTDOWN_PIN = "0" *) 
  (* C_EN_SLEEP_PIN = "0" *) 
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     5.244 mW" *) 
  (* C_FAMILY = "zynq" *) 
  (* C_HAS_AXI_ID = "0" *) 
  (* C_HAS_ENA = "0" *) 
  (* C_HAS_ENB = "0" *) 
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
  (* C_INIT_FILE = "rot_lut.mem" *) 
  (* C_INIT_FILE_NAME = "rot_lut.mif" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_LOAD_INIT_FILE = "1" *) 
  (* C_MEM_TYPE = "4" *) 
  (* C_MUX_PIPELINE_STAGES = "0" *) 
  (* C_PRIM_TYPE = "1" *) 
  (* C_READ_DEPTH_A = "512" *) 
  (* C_READ_DEPTH_B = "512" *) 
  (* C_READ_LATENCY_A = "1" *) 
  (* C_READ_LATENCY_B = "1" *) 
  (* C_READ_WIDTH_A = "32" *) 
  (* C_READ_WIDTH_B = "32" *) 
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
  (* C_WRITE_DEPTH_A = "512" *) 
  (* C_WRITE_DEPTH_B = "512" *) 
  (* C_WRITE_MODE_A = "WRITE_FIRST" *) 
  (* C_WRITE_MODE_B = "WRITE_FIRST" *) 
  (* C_WRITE_WIDTH_A = "32" *) 
  (* C_WRITE_WIDTH_B = "32" *) 
  (* C_XDEVICEFAMILY = "zynq" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  rot_lut_blk_mem_gen_v8_4_4 U0
       (.addra(addra),
        .addrb(addrb),
        .clka(clka),
        .clkb(1'b0),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .deepsleep(1'b0),
        .dina({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .dinb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .douta(douta),
        .doutb(doutb),
        .eccpipece(1'b0),
        .ena(1'b0),
        .enb(1'b0),
        .injectdbiterr(1'b0),
        .injectsbiterr(1'b0),
        .rdaddrecc(NLW_U0_rdaddrecc_UNCONNECTED[8:0]),
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
        .s_axi_rdaddrecc(NLW_U0_s_axi_rdaddrecc_UNCONNECTED[8:0]),
        .s_axi_rdata(NLW_U0_s_axi_rdata_UNCONNECTED[31:0]),
        .s_axi_rid(NLW_U0_s_axi_rid_UNCONNECTED[3:0]),
        .s_axi_rlast(NLW_U0_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(1'b0),
        .s_axi_rresp(NLW_U0_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_rvalid(NLW_U0_s_axi_rvalid_UNCONNECTED),
        .s_axi_sbiterr(NLW_U0_s_axi_sbiterr_UNCONNECTED),
        .s_axi_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wlast(1'b0),
        .s_axi_wready(NLW_U0_s_axi_wready_UNCONNECTED),
        .s_axi_wstrb(1'b0),
        .s_axi_wvalid(1'b0),
        .sbiterr(NLW_U0_sbiterr_UNCONNECTED),
        .shutdown(1'b0),
        .sleep(1'b0),
        .wea(1'b0),
        .web(1'b0));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2021.1"
`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
sbNGmomEbP78s1hfxgX3P1Jo01EKJk0i0C7iGpF+Yibr9EK0s4mcIifHDN/ag4jpPwW3bPllMHvn
U8AEY3mO8hCXVVoilrcRuCaEna/98GycCzy4G7FnYMfowsJb5k9ifRdE2jnurzeTLFbupUSpDF0H
Rl3Ci3DTGeExAZZ9UQE=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
zZZZoIprBFYfDWmCCcduELBM7HU98/+rvP9g8+y1mYyD3r3HEDm4ZwehwZvPoYWqoGXYoFqWZh3h
utt0abIfUW9/oF2vJ9hXn7nArtcm/Eui18rPYqp3aj/AItPNVXojk9zp7uFZLPTqcyig5v3Jtenl
qPnLi1Z84ZCW7NIRw6Y0bgmw6z26E8VPbYrZHs+0YW8Sztjo6CdIrQeEL5WBDolA0aHoKHWRZyFs
l5eRDmBAolj2uF07t/3eY3J7cYJmEDaoZ0TR1qcz25VFNu0OlcrEJ19IT+QdAxTah4jqJtknGZrT
6lUMwDZ7dBQwF1EuaE6p90gGNERhGAsbHLdvaw==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
KUbz0Iu2faeWqD6HFeuGLtSOAlqZmpKCCJfzym8tkcWUUNgNMn2mYvx6PTM7j4tyig8JdUG3uZYs
NfPgAsNXQtTI7b19u9CkMks9jR+oEzX1rW7QtTvSj/nHZLg2smoFwuB5Ieb7/B8IIs1NTUrIz6Rc
itLQVG+L+GMziamsrx4=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
G7XYdRx9VGclyxTEtwMG+rjJHV8bfBxEGdkcN82UL3koN3Dt0M5AWkzEvHcskt1W0hTOjyYgmvYj
/p70w1nz96tlg226+e4UubpRmBH9QXBBX6UmqIwSiHj9H+XI1yNfTIdlwBKGQvfzwCAMwBwrrrGL
/804k5Ux3RhWRvwezZB4+sj9DFm4akREVXmNpfeqjI2X02LU/MxWMUbKxvjJnD9YxikAAO6ccTd6
8DKv76V76MEFVyXc7E2FeQDToW3lqkRTa6MTpIXbYSekRihQC+qPVuhPUneA4kepvQDfgFYE8/Ir
gu5gK+s/qNfuXhJUAqyLjslrUcY4+XD9ckpSvQ==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
YXkYRXpUPv/tETnwnThdQ46UaPmI23lN9vrxHQjIOhq3WNJCuz7TYZK9hyzSdo6k0U6QE9ihQy2L
rYZg68RGbrK8bzlcnQ41r18LZb4GYlAn9PH7IrF1B+aHm3578doOZHf8wzUE2s+d1aHQIn6VIZjL
14pCTAjErJfMO13fgX6h8sgxb4GFC3eIORmkrq2J/fB9HALyh/qdGiLi7DejMfmdsssbOcPQTZUh
6Belf7fHTkIEr9B44rFZgMyrMVx4N9p0XpXD3JPe7Xeg6a3jxdqxHATaMuLdIa4s+ZiAz1TRx0EO
FFihCnLLb7weBBITQyTIncRL817BrF/ZXZD8Yw==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2021_01", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
g7FbNw1ywd4TBNHq8OmK/4zoKI/t7vKmyT8R8SeiyUtKywhn0/7DZ/lV0Lf4IhY8X5MYsKtOQ5l6
DIl3fxtOhxpi8NHn9Nw3Nfb8NnS38Zuy6DSpwOL0f/GSmUSf2/YdB5Ben6xibQT0Oy//oBl5/1kR
pV5fWjj8WRgI6cnmfyj3g1MxepxPu1A/UHxlm1/i9yUHHi114N/hEQ0iujjrn6GxfZSiJUVF+r6c
rnxD//eOAl/YaxhdU/KhUkfsMn+MxtA5m6hTYYE0bnze8rpmEU5UGYKyY0p8KUs+MgsdTe+m/7gV
HSf6puBqQmEa1qksRfl742aL9B9y169or7Jp9Q==

`pragma protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
kd1A2zIphLxXB0RyfHIqLkHXfWl0n38vROERuDghYrhK0ItcWGEP0XBrri6k1VZCSPYwiSu//pM6
83BfcPKbk09/A+ksvDIa3xS8Tg7DJK2AS+0pdnzBSjVWh+QD+glA3Hjk6LG9OMbjXyqD3hnMKacA
VRMwxKktV+KT5NXj5a7fMxXjo9exc0xM+woUJiSYs8onoUSwfBeH5/xhUy+iu+w0/OOydQE2LXZ0
1y+RObiz5C22dD4GGCfuvUCGAthYpUf633ZxRYN45mmAn5PxPsH4o+l2GhH/50Gu/VPVoAWDhgXQ
e93oPri++HinkK2uvDhDl4PI9HtRkq11Ky3uXQ==

`pragma protect key_keyowner="Atrenta", key_keyname="ATR-SG-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=384)
`pragma protect key_block
gDrrFgXHVyBo+Cn0bYn+SOSOCXPg7besukY6l0JmA/nu4gap105Wxbg11c7TJZ9ctHVLc5DXAxr+
EIvFpAIepoZBREtMjTlaIdNJ8k1nUpwAv2jaQeseq1TudTjugV1jtOYYk0RKd88z/6SJ8t9urDW0
yKqsfEWU3PwGcUGHOWtTn2hfAceNznmEIFWLmFmzSQJ1hQNdsIQn3jHnfMVYu8cAz5xvPVQWYyJW
pMHXhNYk6GyAjIshh991slb1g01K1ilR2tKD1EmxH5WGrX9BEUqBjHQo6uluC/d3mvcEQ5nJ1v+P
hIlj4qzUQT1wXjpk6d/BvNx7LyWmj5iq35dzNm+cdhfGwaFGG//vgmB6D/dFfs2BYSjHsa6VlpVM
7e2OgoFenuG9p1SVPI6gAs2MuFtnDKfxW7jS3RGhvsquS3tg1iFCDH/OU7E5aWfY7twF3yyN6G10
l72RZw62DfNoCdyUMG9sA8nc4qf6dEhyrr5S6XxpJhoBDJvkeq0TCUQZ

`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="CDS_RSA_KEY_VER_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
XR7vRF1m+9DS2Pv4r/O4uHwmvtXkChnKbsJCYczn1dvkZbcZSbBm/2UH78dXUaNorOh9XAuCvSjb
ER73y7e0anAfaIf1tJ9Y9pIb8EuNxGS/Pqdvg36cWarwGac9tsscdv/HWfb5Z+qWEk0/uFcLI7pH
CZO7fF2/ONQjA0NtUFBjW4idlx8WrySIuJgDs4jyGkMhbHR3U/ghF1YhMhwgwsbbcptfC1XLrIqQ
OecZnZu8E2hyc5eK/ccYdKcHnXoL55z1p5amI6Fuvz0wKTz2QQ/mwXodfGjEC1ZRWwTn7zCFM91M
qrA1Is49i6pSa7/VICjgn8ULMT1oKGfJLPm7hg==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 26960)
`pragma protect data_block
MtzWTJfvujin0sZDh4swfvaZ9qh2q8RQ8NrGGpqtkHOP22PTbDbS/eyglv/RaOGtiOWy6lExI63e
6AeSSo8q+Sk+t8k4liWvItN7ewzGubeQ1K00KDwhXvuZFdZ94xyhpCnwDXa1SzJOrdGOhQ/hNvQK
DayAtNxURPh3JzOvSNKrZCPKXCdlF9jeC7HA92nWaiF+/kGlps/l4MaQhV5/pP4T78zNcCBKhfHC
uiAf1CgGzyxvYbMG8cn8KoQU91wUODjCRNi6SCafGAv2q9aLGe0FW/wOo4OAd6nHijPzTtUDhbSV
UtTaHf8oEbte/WjvBb6e9HYxGUVMw6D9nBVtwQa16+QUfu4F2NIK2ATtF4fSg0jHiJFRgy6IgGiQ
ydM0YpX9Ede+O6cGSwUt1FujeqlBfx1EAkcEPD/gxZy1MbZPClE3MKQR8rNsjJLmzxRXqec4dIOk
XivHxkNb63JlIBC8ZML7sqHvwTyI4E8lDf2RAIxE6GFxsT0IDbTnwFWzwf9f5RjDskWeY16Tjoz7
msWLPlReowCjccXW2mNrfqw2ff9xIsUifspqvGcwEkksUQBGf6ojYO4N+ySwtYM+YsOOs3QgB+ZI
0iEE63WQx86DUoLgXCFKWLMIUcaSzGc3FsafW3/lvp9f7BfdWFu1SnRbVBqvnACKLgoag713iWyu
ROJNGijHdU2gS7D2i26up8h+bZv9/2aNHzU3TJtRWe90sTC23KqtcvKiXbxl0E8l7X1rMU65Tubc
Cb3mLH1TQZdEZyS7soE+8nlUaD9cpdLpJpEgrkRFs4Fknu6QTOeQB4W4U+MIOFfHaBrQd9MiJo9H
frlN7ecQu1262pUWPX9ZbWNOm0OEveo5J0+lfHvLXfE8UG9DHbeNP7O/V6WSqZpRzF/jeJu1bmtl
NDF2WYoTEgB4x0QDYzEQmNcgrsIJKm+EN8tzwAKFQt3cFUvgLMSpSxJvLfNZNXPjrJ2aXB0yOj1D
CxZb8s0yauvUurEQhd1fRuy4as3uKbI0D+BnxMUNHNpTbPnLNAHjDz4O0ewCGx6aAxfNzTx1/Mmz
LvsayIpyM7TLqDtaltZZeqI8sRUGAQYBKfhu1quZdlXpo7J19G5wWKZn0ta9JFpcaKGvl9jXBp6X
IQza1zzjeOIXWSYUuA1bu+SOX7aD5FVusRkgz6a0Xf76pAqw7yaVHr6O/3oohCsjGeAUTaI0fJXq
PsDr8fYRc/AipRBQdWWM+F62gNm+zmPrJlPDZjdUlR/ERLVu8+7Ynhv814yqu30+5bLzMPjq0RbN
G8/u5k9GuZwT6R1hMCNBgI2ozTpKSSafNduEkU66XbIFnShQPcBErW0p7p3Xez6BSbMs8r+TXmL1
GnUZ+SB8vTac10DTIQ1vq9GhYJz0uaJnAk1SoIErTszKnOdqsDr//bAnY6twuTkc6oM2k0RaKnSg
+K8a8O9OsRE+GOj579nZzqovhj2aT54LcUIrQJGvWf+VgC0RCrEbQahUc2/Q4VOyV+UZ/zkCPIAA
R/OQX3o9NEH1beNbeIIHiKqAqkf0Ost407bXnKFzRbl5k48dnqNB0wfQcSwUme1q8FbSlHMLkLAe
eoDTp7+/B4mzdizc5xxwjmcEv1WfH8SLBMqUkYH+NlLb156zF/U8nLj+ssD/LZPT8eEGmQkKQC5W
/3RULB+HytfUgLDmPvU6IFkNyNe11NxbsdkVfYCAvc5ANCJ3/xOPMKSERHd1tF+H4D9gOUqI57vl
IdTfZduKU9J+wEVaPJPEhQGOonKm0Yhf9ESMWFjKQn7nCk8PJQdwwrD1Ui8XRxVOOLKyO2TRxFws
bm7bmR92Kbqa1kTjTUav+qysHhCTnT9n/O/paO7yuhxpoGUxA5RsiNQZpvXM44TAdwThBXrjtZnF
j5liA8STRmF7a2R/Go+cG1SmWCbuWjwwNvJ3ChgP9a0K5HlM0ht7rdA2iLJ5UjgHHArOslco/uh1
hyHqPugU/63UyEYgq2lCtSBHq+WeMmodHbpj4r8WSQs03c6QdV5CdPxa2qPyGX4+sOuRJcuDQ15n
ofD8RdOLQwygFem4bhXd8yEfrbILOeAKgZ0anrSLRAfdKkCBS6ESw6aAFsi7qlxD/O+PRvBN0Gpa
hiY+pXm/UjsA7GHiVX149Aj2a3wQiGCahn1qrWg0VGwpBDA+9+CmXrN5p8thrA0CxUW7b70XFVM0
tF81MT6kaWiwNbXuLoQ/wflzfUSgu6jZrHiHDPWChgCO7w8cA2mKBP0L92NSDphYV07qo1nHWE1L
llvWuFq7ht6jY9rKICDeyKAssXmOKoRSYnkKrAN3jO5VNBVm5gB/pilt2PJp5y9hI/f4sFONb9S8
z5Ad80kL4GRvLUnL4vCxQcYy7JQxqIdU4SmHz2EBrHeL3ydycHZ+NMTeabwptTgE95l5L82b+sZU
WkRXyhjDLzUltBoHuoSzom2JsdMZrqV2T+FBNjf4bMu5P2+jUuEBHVvL4lAWbE5gW6URW877lyVs
YGO3Djjy1Xe9cGAcwI+D/SfMl91Z+Oqc0OohW9yf1a1W6Y8l0741j8FCtr1JKlxf1Pux4vxPdrtw
E6tOACSnuQYFGwm5++tQpl357s8PbmAh4svWi7Ca476u4v7ugBxbG/mvEnuLvx728ZIY9J5QEpdC
Rwr/twG+3MA8voNC1pUFwp8jHIrXpAw4UHGyYh925aeO+utSUY5N+fazdIB1z28PaYZvjusVWJqW
CFMohyavp/9pPJfYh9wkJHUhy8BZwXn8WZcXgNXAlZsGjzil5rPFaTYqqPkzh5yDZcipAzxM0BYN
yCpqLNMizUkHhAQXPCmZ4wgwFCQDvZgu7PrDzRDXRCBW7LMcUIsZ/7XePx25JqW59ZFQKexq8wBC
a4EpYTC4M23wevaviAFGEMpNlR3fjsnuBRySWbcFaWHRmyKTIeWWsuLDo2Ue3s3Q23EGbuIoF4VK
M6+3wIwbMB3Nhl7+XL1yO2eZkF6Q8R+OlCWtRFAhZKZuEy+ldNgs4IZKFxcnviGhtcxvgEShNhAP
lCsQbyBlkzR8xRNz9uosV0eA4jpYo9lMluvKdGzoBUwwJ0Gk7AUIZtfpGD3DdzbYAGQWil6mwT2K
oXL9G+4byegf+n2E6ZH7M2z4vWTjrgdsnG47nDhXcGf4Ncy1D/EIko7VjIzoowflVu9KUNRoXZI+
HDwne8Mfn6bkjNKp0oXcUde3uADHnQeWecqjUjhEw72QWZu/QhVOmM3VsmPf1w5tycNqRXr2809E
EY4LDnpuniMz6Mtc3Paj9S4hUN58dN7/nwQz6AFUbXxlKWEhN+i6vhBboZKbljPdNpcdkBQkdCe8
3EieOoyK+YbC1k2+LvbhGrHHicmUHJD3ibaAAKzgsQ8s3dISH7qXjmG/O/b6anOrZFK3n6rLmiJW
MbJ+aXdubFh1LEq/75QNgSOK04h91TrqQk6tXeYyls6Q5QHzv6vGaxk+1DWLWGSK//6Xq1Yr31jz
MvXE64+/8G9++p7nNG5iErXeo6MOjJkxquxjW7E5oW9aErAwqaVB5GhmkgRS5MoPhbrpuFEyO/zl
SbLQEMCVBY/3mwqfe1FkYyBACwj3IRnZo2dphE1Gh18vDMzmkPqwSxGf25wRnD70qfzUukUvarUA
Fxe8x1fnsWMS89jKdQhKaJQZMqASi1H5FvHssIfoYSZ9DtkKBHc00co3UlUTwJ8JqozPeFCZ7tyw
nSkyB5XZqErtL96SuA2A6iu2ScghLE0ah76sbXFrv1UaoShsiJfPSS/yAaWCrNyh5n9tlbIonHr/
0LOpPL+FspHPEyarlrm67WnHBHFVrwh60A2JQwOoKoDLdpUPDZEI10SxaRd6/XmucQeua2YvMHWc
kPE6CrWHqAhW/JHEjDee2SePVjAdGOx9ZVdKKsPZYcFFrDLCiD8vwsoaFWtoDFgcDX7Ux6RYmQld
qk92uO8kvvb/M+MXtrldWUYC3WqxDKrgwayk/nJlfVJESXnHWnLYtX63tsz31yiBt53rSZ+h7tJj
0ZWDOngQRx5csmRw1ImSpUCzJ1Zb/GNvdaSB+JkOTBd83f/zyLBSCB1pVqititffdLrjoIr/zcb8
mS+mAY/dwkRl0CqMXwx1+0EC8DcWPjA5PIWT95dVxSJMVuhrQX1RkzN7/vXuQZ0CRzxxe2z0IZ4Q
eKoYRqGxb8ywic6ViRDq8gIQe9LW213kqZ3hSQ/AwrdOyus8zNdIAbv7YhSfciRk1l2fBz0AjqXE
nuECD2XWV6b+CqFcaedyvUv0YynSuZCHY5eOaw5PHFV/6CpYYqkLCzKfhjpm2v365/cMMl29Mr+D
xmIpgfyCg1bQDqx9SPh6tQlyb0Nny6YVwxX844K1koi1rVwGIbtpkxrOIor/hziqmdX9S1IFfkDV
NFGhqnMZIkmqmLTh+D7/JfI4YfvJCi1Jz+TTMK78W3VKz8jQRmjojvG3kDJVGUXFzzKWUQaHx21q
WqmCDZHiwfJyPIAap8GiC/FnzVDxYUS5VjaPEcAomM0whO4Xmkzh+LQdLIe+AD80FP4bB6fLAoDg
zTiJQQCkgbR/Yjz9OOMU6E9uvuf56UCo9VxLAQ07Mo2+5QOrvsvmPnMlsxAQ9el7KABetAlR3IDJ
LMadgCtzA/c+vDM1GNuWUx2qqx5dMMuSXhnjRATcpCrDeqAY8ut8+n7bpzkwWbT092uD7CPtNaFJ
ALfOetLt4xjAc/g3I5SzEB+fj75jXcVrBG60uDXhay4nQUFltu9Lyl6dmUv0T7rXFci2nQQ53Ezh
S2IamAqCKoshG239eQLyN0nQvn8exHY2JskStAbWySSTG1+ecnr9ovsKbTt38sc56Cfnpw/NWq+E
L4m78sYlSdQyYPxh8wcja99GdSYUrNBEtivJqMkgdNY6uymSK36ntDg5+WC1plKrM+4518o3dEHI
Egt+LPQx2G7iQxenQgnCztOR5zJYemEwPJQkRGLZddmLP/FxgpCShpBFQroGrouFUxyZiH3/rYn+
bV5Rvi6QYvjC2g5zU399gMOcmyVk8CgM2I4XPBs1ABpzVNsOuoUpR5fe581VfiGWwTKLfLzWAkU3
2cbjDSHpTPg6Y7Vbuz9HOsEmjq5sjYRIZ6KAJE+9Xr2cjsEZCHhaN5gfVqoub8kB5Opt/inOpKmY
0Ucz2lcWZJErUUZic6M+uidUhKa8bxPelLjUNB81KzHwoo6UNIb9ji/dRXnYqmfZ6vLA/buTAnvY
nu80A6Oh5r5H0PNRHcqq5o3Je1LfvsJkunX+LuFTdjfwJgzkezbqubGmKF+SmMayGy8rmMast1rw
LHZXaof8urkotY/DZeHVa1FawdysGy7KOVlj1HJGcd9mLquY+t8LKI6XV3pu+gYgQ9Z+Uh9gXaq7
47ig0sD+ZSAmH2KbhqRuLWhcIsUfmb/of0YSFqG7pzOcLMD2hul3Jmj7kFTUjco75wHunkpiTvBK
alNYlCS76GAwDaeEeghbAvtDDt3kbNYl0hzCJivlcKE81/XhDaKqv1pmZokYhkQiKc3rn4slV/KM
KFZcDBLYVgq8TLBA3v1Bnd2C8N7DkN3gqRbp1PVTiC3+M0Bvy9wI5H7cicmP1xMuyvcpDoYjLEf0
AjuD9g9YeSOR43dHCjeCKFVuGpz2HSfLS+Swdi4gIq+DfuxE+Y4ienigJxUeCzzFzKexwVLZguxY
o21N/X5SsC+aKikAEEIP6OmnuP5ytiyA86CEirhhZmuf2q94j6mb+rkFkl85ncj6zRbvIEewM14N
UD3jbvPfbxqGGOap6dwq+udFvMZxxEfisMSYHUWW3gU1qtYFk/Pkv4h6XACzICFLUwxzflxZF8ha
jgnSRG+WfyiqCKq4hpwM9DbFQrci+JxXeZ6NLHBBt/mB5Pl5D96gbVbGcRfCbCFszoAHxE+NThqc
H+IMxF5wkyp+5YNtCqsddrF3vAnSW1uToHh1cbE8fjogVjd1UyStKcYnzUcFhj9WTc70fVQjS+ZJ
QsBKaG1/Tly+r0vK26RIq82+9NqijiTGM8YD80GEwu2NSM8KOUZLovCIzw8R+hyElSiEZHy/e5tv
WQzJUHMnAEVGfDPgGA5t4nluD5f4MapjPZ8p6ga0FkxWBSjP6zi+p+/pj46MbZpA3jcB5ze9+ogt
9MYFCT4W+LN3Lvc+TIT/Mo4/lsfVsp9LqEcNDJ1OEenPID/1wUAjtCjMOj5Jv3f9hgoVA7Rdygag
j3L3xMqR8MlaKg4fTIJ5AkkTZTuwYL6bzDJ2ay4DH1ir/yLARbH9lC814X57MaPxnkISb5MIuKSx
l5EK2tS1ksR4NAn2MXr7h3y6pRXOvwmNhWydIdqbtgCzoE5JedBWhAbyzQdfqd41BXQwXIE4xcfr
gpsePmQmGUdpVPjsIG9h+i6JeG6rBQHKkHkisTOgW4MpgKOiTA0No8FVIZHGxkQ+9Mk3QhcYxoy6
61KB71Qn+4MBmNX9am5LKi9BHfyTjBmM8QLg0IBzjTMSQ3lsT+Ds2b5pDZXVCUygG5UErwN7CmMu
+Mag4JP2Q5Ur5Uq3ObyvzIBYGnwjcODhblApWbDNwmw8z9Y7gE781tQRdmSYw4PCfieb4H2Ln9lm
mGWQtnKoRHbrI2yf8TppBLBlQvMlvoefgXoKpx+1pQdoxwZ0RVg0gEeDVUsTm2pnlELMMu5mOjr3
pIssjyJ8eogpCwijTM47/fpsDUDcbQ9jAzwU2zbnVmOixfp83eHaxAHxekrC0LMSPjlPaCPy1Bow
cNP2EiT0VeB3XnHe3qzo4NmQhN/Pq1VxWR6lumzMI7vpZASP32/O+WYiXhLyrj/YBzfJv2KZEE2H
lJgJ2A7vTaWAw9mP3dkOiyMDoRH/eUVnRM8w/8CxKvUyBLUT9qECbHwS7NUjkdRSufCkcvV7E4/F
XMz8M3Lp0i+WCseTKAq4J2HiMAslz9c3wZoPAVK/ZDYuDh0xZa7vmN6yl2SizXEa/Kc0W4GwWoeV
TsCQjl1TbJ9NNsNv1cDxuR7SQEF+oO469vR30LkftFJ/dwyq2qvc4is3adLAFL5ZdEo+TY+ChfhY
iw2ryKHEm9FrP+HTnFiuWZHjJ9Mtisri605oo0sb+7pHZGrPbzfJoc8vImGvfTTX/M2WkHLntgl/
85/HO19PpnnME8IhyTCm7dNoV20OQoAebIAHp85EHK4MSsdjYu4lJtV86LPqmXAQHG9BKiULbvwm
QfyyQ6UAJq/WwDzSeA4E4IXVyPNIJka4VmO6vwni2/PDJl2ZkTFPq1GKrchyQNhkYrcJhsyZXAFQ
mEjU1FikmIMGujuNlsE82k5qOwTQWw1GW/bKYq6S/Xyvgwyh+3JFwSETgItZtT0WcB+oJf6dxVHu
tTW/DxTt2Zj4WT1Uyn5p8KRdg9HXX1lHzwC2RCaA5s2e6CSDJSRthz53PYI1cZLOO7B3fA5roVKA
IlLAFXybVxRHwJopzj1keaNsPaywqo3tYkCce0CMy6Kr6fJT9LkbvlqF3u985Btw3ufvLQHlnUg/
hXj6Mp8oToKpgRPGNPXO5P543FJLHtF9u7V1z2jEP1x9vGQKNn7jf4mNm/ubw31K5Lr8C6Yx1ms3
fo7KE5X6EYUHEnl/mpN+vCkHx8QwXBojV798HyeWJFpf23jaJd4Po6e4AWAX1Fpp3tJm6b/2zskl
vuuoxhks0SQtRNg+SU89r813VRorNotju3czAb3CBxM50ljc474D5MciB3NBvBfkKWdX3af2XnCC
BtXNWc3/tbRfkQG+uZvgbfxgW8+gyVaNnKAPex1xBxHEzA+gL5AlvQH9dqEMWR98U/cBfE0pLRFX
6bZn3gyo/9Jaj4bIYiQq+JPiYxv/GBzh4V4L/xf2FF01+OmIiKriND+UPksvqOJ00KXzfvWRCGgw
EofUx6y2PnQtvnimTL/fl3JkYSpl4ZIrYUPtJIaKGbCCiS2Q96oVnL37QUIcYOzgC3Hbi0okXGr/
uC/rNWAURGHmY9JVn8Pk82XvSj8xOJDjpfklItBoIchZESR2UQKL7pLCedUBu8sOT7erdNDwW5D0
G66Ge7HLNTJw0d00CSKC8ixmvu0yRNlOYLDVmjql3Nz8GFfV49hFrllZP/TUg2wFiHiY6Agq2T+V
nlJGAK0EMv5cVz+EFD27B9KCyE+wnAu714xyQuTuHRquD1LfuVW4jI666JNN1dU7nA5Lbl3j8mN2
2cSlopOuIs+TEl0QSC2n6M3HTJUyvR9XgysL/v1FGi+w5R3eVQ5K6y28TOnXsLUiH0Pij66D5Awa
KY4W++4fY0fNaVEnbE/H3ovw23VVpm2+vBmYqX7C0RI2lon8Y9oLnKfefWKo4Mxi6XV+l2veM6Kj
5d2P7i4nIgYXmR0GZm7hCJUJN743VshqkLEK6M2R1ToaNoKx4DJsjuOVLRi1eoj7KT1NhI94O0fj
avhwkk0kECTexTU4d5HURMZrpyS2d0iuZ9Xo2/ehRQd3hYy9J0/iyKKFN0kXIW/h05KKExopNvC3
HbmFkCu1UVCo+kx5Wcqs8UkaSihAm6Vl70CynjodRLWzHMpzpiz+Qwgdp7WBmk05AnlahXjhC7rb
f76Hg9uXrlpRH+YRak0NJKt6AILgmyDErZqilGDSVPcC17YX5W3bQVzwZijg3Gor5zJXlKMuG8Ly
57Rq3pDYMC1+wVFyCDJgrMkE6SI1TDyOwZ+WDE7Q8nmIT/Te3FMA45BJ8sk2xkHo99e88EyMt1kG
F7cKqKUY5nrHde1RZZE6qzQ0N2WwS/qVJuNs1Vj9WRoQri3NvcJaIAgApKVJhkzeLhFqvdn0Q4cY
9e+6+MGQvzW4En/1MNjGSCovw04C88z3JhJ8aXvZW7jLy5v+NnDEl450+AO917+SipF1Nu+aQI2n
FQIHzG7un+F6/ahMUt2vIyqLtM/0eOQqH4QEyHZdmSPJCVjOzZLnkqZTIP6WrKkLNsm+xaFQcXaA
OPIxge/VlIZZWtgnRUQuf8+OqOf8aNkRF8QU+BExZ+7wB7g8kPCBmtWPtgFqAH7F4FxCXyaFAuoA
zj/n+3GmGMkAZl71NJjTAN9VkkuRTW5lMUB81ANTg4bodM892ZuMy6JiCKa/6kBHWhU7sZO33UcR
v+wgvLwxJBb1Tbt7P9J12Kx2ZVAzwRkI8q4cTtQxnEYe7LyC1tVlFFzZRfd+0Dv3r9n+BFZ96neG
ASXsAe7t7SreXssClgPQVUHKw96K80Tg9IMvxig8agavLmGwJRWHmi5KOz9qI9iQQ2WPHuMzR8UE
2ZELoInM4/gWoTexT4EhTTcyfLGaugMJumC+SAwV8nKYWXfe8J/Jw3h5gHQ7n1JL/a09wSXksM2F
LKlBgRQIjLMCKyJTTMPkXQHtYd4S1F46ZGbiDQiuEQnLPjCxGapU4DCDBRb7XhqApsjTLHsSg5u5
VXjo07neSi5kaJamV/BvTdtsoyH8diAsj5CIljiglXb3SUIDwyp9KZW3s7udaQdutvqwy6hZbV0O
07v4BzNHMaoh5KcLEmrLoReDn6Y+gqTRZOVeffmm4kH+M+XwwxltLHS/FpGwe/a5NlEQ0XGlbqeb
EELAbzCzif5lCDo+NQA+BVSdFQYNMyOYOaLFqR7ng4VZylnuyxwnZBIEVXGUF+isyvatz6TZJIbD
l6cfA+CMxJ/q/ceFGy9u7cUupxc8Kaen1BEUL6HP/5JLLOc07z5p9vLJZauOaChXYevW7M3ZwwDS
awjDLgVli5BmEYqth6ZZqtPs4LG2nLVmrb31Wp4uplTVr6WAi7GXsrpdtxZxQJePMqXHmGATVBNk
wuD2CeBbG29725F5O2V8WVl4MOYIKzRR8a+4RwePx425uqllgCT5jKrw9JO4TR6ADPrJ74GLHF8q
nHWQ9yq0NALRLZIBgDugM4XRAshm1NMBu6NZUzGQ5I83nqXd5sMPuIeZITnrHF507NKMYMpA3vjS
YOcQOrl84BXu+b/EtX9Op6Rd9UJpAOfYA2o7HmQMJZdY4vGqLe7tb+pJqmGNqrRaYuA2KTskKehe
5mHLI3qG5OkODMOTXI+daBhIk9ALf5/KL+owFkFHWND/HZdqjFGcGpQEU1Y63ORqM8pREOHsFnDa
zPYZ4ZnDtvEJUlGj2Qngiw1k4j6+E0ZUcP95BorTKpJdQnVHEOaI7jMs8KCk5aRzZK0nSHtH4snf
TkBZjbFW35ssrxAVGBJLkB5bc8eWAsIr3/qFfrdbCE6Xuc4vTJR2wke2UrgXz/+4kzNDWlYkuFf/
hy7UKYjI5PQZxrE8bsg4SMy5aL9gj79b2p4a95q2FJswE5meczB3SX4Clwowtp8W2iMoRCKWh2du
aooOnjdFEB897FDBRyTnyS1zQ3Cf7k6kUVJ0iQiYOemH+gB/uFX8/sMwFgOFpTw9mR2BYv3R8jxb
r5Fl5MNUF+tEza96v6xssV0zVue93JQ4RWaML/ti9jpnH+F6RMh2DB+Aprr2LSYbNXreAnomA/AE
YrXL2ywsz2KA58lSXYEJL3rtMdh2LLykRBUeLPtg7o8LLsHgBqRfD+zV0KULF0Aa5XWK1lEAxcdl
rW8Loagep1EBcXwuhB0UpgRT7bQw/kOuRTCBpbWe8Fh8eKEtylSQnJIC8tK+Co62O4dfkLpbzp6y
YF9emaLdU4QMspTvY7sNK6kRZsGrd3jZxC+W9qBC0n9tMgjObZYfg3p9qO21r4b8kwu6/2QqDnFj
zneY34feX9ga5RonShYykRfURpvzR3D5KG1zxOZnE9paZEM54nPj2uSnrMDzAO66V5gM/tpE4ZZZ
mKCVsCs8a9XH8qRXtqMJzTFiNaPe0JD06l9J8N6s5jfBKhEKEQcCxv3WNTn4iI6CaDO5El3X+ytf
sk0DPjqpK7VJz2L8h1UJv/GzKh9/ikFz5W96GLEbGHcbY4ST6QJA0n6d9UeXtnAaeOO4OMJudSzT
3mmFVedYH4Tg9G/iFWUpvGja/xJeDVsMQtSAkYj9WD4JKSrYRIICBWPIwbFdHsB9S0/mVET4T7H6
wlWh3dGd9oFwAjde3KqtgodA5EBLGj+/Kxu7K9XywOlLFdpxDZy4lLRgGzUjxNIcfGT1oV/L7xI8
mCxTYI3j8rgIwAUgDg3d3Ohmwtip4P/jDg87sW3OZNJ73Ppqw7FmLELpWwfB3IWjpiuBaePDbXRx
yIXxLN0vFpogNPFog19QqkyD/6dLrI+E5jzzQ4Gcv41+35RdRrI8SLd66OnH8eYgKvbDrggFxeci
SmGNaPOaO3COIuIY9kNoXjE1Sbok+InT4Hhhw7Kb309I5S5wD9oSKwBEKR/TYmBlbWJafRK+/5hF
cDIBd5a0l61aQPACOModP32W0ENLoteA/ca3JOKiLBWQIOMez8AGhbST6o5EiaQrvzhiDOizmRug
9BTwX5UXkgBh6uQg26T9r2AVYs79TRh894PfD8zzD/pEcUhc4pcqUTXh/GUxls6XPwHDFo/D8Fwo
l+/h518XRmoUwnvj3YbnCB5WqjNQcliRC87C9u4WCN2CGKKsvcTZKIFGs4tr8+I2Hw1vcLL/IwuM
4Cq55QpkI7/2FhlxxptiZV4ZCTVfWsZnbtM9vOwCl0NMP0QR7NROSDcbrgW+h95LYCsoSvIrrNVa
UQy3HucDT8QO81dXEk1o/zMqK/gibFPIRLW7MMG5tHoytS5/F3o2X68D43UIbUajGZjIPmmNvI6E
o+TKcm/5afIB3u1d2dPfdgPAHatPScEe7s7eq/j5zOzfh0c1OFwVEkygPx3ryM9OSnLsIh084PiP
xtvvHjau0fKN00PvXd2B6jiSc3zz6VKpLSDB0xuir6vXyjVE6IrF0ZBWBilE3fTeT4JwErF4j89g
kbNcHPuYCJ/cyTvtCciu4/GgCYCK7fXxAKnelzhB8tQZr9/H6chcJdEoqpslQ9vB2pfoKNFj6cQR
PUDj8fr8oGj2SJ1sGvQtcS/Y3bVPYHXsDdC1rKEfE9y/nSZgB4yo9zSrOtKnvv8XPQK9UxPlnc/s
n8FohE87oXNCoH2xqKphVrQhQUMnsEl3c3hTXM/jXiwt2aY8ng7iJBTtuLdwqFyR6nR9VNHtyl/m
J1TCzqyUOH7jZVC000kblGV/MzshEpIfBIm0Y3tbTYYF2CEzyIsOMlckrdfLdIJiFK3of9LkpFxF
x//0ClOu4OsWifJV1OLeUyBryUFgsRWMvP+2qj3HmKHu5GvO2zXbafV7pFggeDO6bZoxS2xg3+o3
h2kTx70Y0KoTT16PF/l5PsqNQN1rwT8+RHx/1hAnLrarP+Kn0V5UptAiW+Q+XWvj/sQAM96ceLj9
yYC1N7HIzoVlAVbMaIKPi4fB2reXRzg+Hhsi+L3g6H+albSIkw2LukHH+sQfoqYrtf0jkmgmWVTm
MB+t5xnfz2LUOTX5o7u2haBRX2OPslSrzeWJxIo1utpjlPDNSFdX2NYI9CMVptreq0uoD1PPf0vh
5qtkhcL3pdZ3pIWzftSqd7TgwKvqcSzcky8OBFQEgS8y/TevEZYS2VgGyZtXSJXlQSpsAzelSIju
PnRR7+QpVv0K8Is2zC5GZSVnRIugkGAWere0ExIl2sgl0ZgS3+HilTamBLolON0RwcS1lHPLml3E
OE/e6JZjqkXFcw4cEFVB1sHMXT/SkFbybGs+W47JfP6son+xZ7HwimSpEt7DefmR5Urc1Hta3Q8E
UntDM1A3UE9Qrckh8rWjyCpXZVQY3BV7NADL4A3lA3mRsABK+tGSc6HXjEay/F7qdgZqLSyQWi9t
5nrTMU0yi3T+3yB1gLQhElWQ3QqbX32ki7Kl7jyoGnaJxQ4u7tPAPrmj6QUefwCa+tjOFDm5JlpV
Pxdb6awRRB3VloURF89c7yCKKBhstw3k2gQv3hT6DO3aCdnFmuhsiPGjxTP8a18n/IzKGn60MqIJ
i96+2VpXU48uWBYQlRBj5eag1JFxOZ0fAFxvoaeSC0SIFCC88+wACLW6kOSd9hgpujKdUrjzhyT7
i9zNn1HWX/HTj/pDA88GIuIe/b6psTV9iprySJxtkRLMonmJyTnB+8ZdMlHQ07oTpI+83rcTmuum
EA5TjqIcezKxhEtsOubxV78Jj/w5WajKLxJn/aoxBjLsgE9GinunimLHLKiiK6OoJBC0m75aDfVD
dZleqaFkGR1Rd32Q7VQcZOKIlNoPNH5SxeTwk6RSTNpXSGVlwiGKk1Y7PHmrRbqDC/OzC0FmryzT
WsaVhRJlztPORScKoud2SmYtEm5FqtwRHoGm8/slEx+oLqTTTOtlEVXol0Q9Ub36Kt0dUNLcMXLA
sGeFIbAHN7D5LlZXS/3DytnyHlzNZSrQuUlaLubhncGkI77yPUTgUuHu2rAfFqc8x8qSATvw+77n
dKIiyQwiUhs7RB8tbQKEwJgIVHg1qhFXIPJJf4rODaOafKrWtv6UDzhZd1U7kTzVAN/z694fXv+K
Hb/8B5ZqK8x8Doo1F7WSBpzuUep4zR7jm6yDO6TsKHd9W14mh4rVeqXptTV7hVGgz3cDmTt/WepK
n7enOrcC3uNSiytvgg2HUM9V9nWSc4H6mFc9GzBDtprltKuppB+tp/Fhy/KcPLKUPXKQfE59U2WR
SWOLAm0epWcRCbQ9wgDJoKS0vzervFzVjBbuLpRiUGBA0+4jigx0d103O7Xlq8yrzUlJvRrr8eMw
q7eGJXiR5bcPoKx1Kt1YuDZxJjJ0a50WrNS2NUQLPeg6zt3sF9hzmFGR7ZKcsgi0AfE3p49ESZW3
NFfv8MBgOpDC/Ae6BlXITVmiwmGBsdTdcvpzuCZ8538n9aEDbBz85m4EsP/mJJObKiaEGFMzieW6
YH5w82X/kldxTtyqIF2OTMoaBsYIIXD7Y8dRYzVWll23/768FCrZKglZxV5yhUYjGGIM6GACs5iu
3g+pnMzYAKnLa5cc7MwhrLSLzmRdPLIqA4R56n22DnGoTwN6fiBGMHmM9kbrhGfCwEE3SvTb1fuy
GJmFceBc6zcbzFQR8F6dvKGwo7BjyEsiet1iYczqX3CCDLijUqlR56uYLeYsmgRvU5In6R3bixUj
LBwy49lxtBBtwnnCxFQz5NWpSPqOWoH04IurczkgiTKslwvEEvfoD6xiWtY7Hv+N1G5pqlfwGauF
Z43RyqgWWT6WN0IhGQ5BrbqUjuYrJGhjOmQgTw+sZPBQAVMy0WWcGPHnyDjlM3ZDX4EgKdnJBVwG
vJunBBwfoUU0BRTp7MhBcZI1cMVEtUyx0nh7pQsmpf8ytpM/o14rJc5Ef4OVYRFko78q37XxnwW/
2UwDvTV77/BRSZcjk7sXnG0TWzvq+U8vS9LRl/E1FwvELH3qO13WXQopUyrThRmE8WuOdeXOm2pv
Hf1JzB6sesDa4qBETjyanyaLpIf0rOnVSP9LTHuyl5z28hWyUhS9fwqnwszReLUGBpmIglm2Jmyl
eESjI6jfWfwJJbxuaHHFMFJ1SX530ziEU/yYf0qfZIFlxS1J1SxQisKGD53+DFm1XOpgGTKdxRP+
dSZ+ocFOiJDNMB78k0IkCMq+q2fTUvW9o5RottB+azPmi4mjy4DT4EyVJPHoNeGkJgAqgo5D+GCq
IDw9MUtbKW6pXCuyWJFHJIzmFA4s4loeY68Sqr/3SaZBz7NHcO+NlZa6yJMvm6qfDfHja6kYFgbC
NSUqpQrKxrQXAdmp3mHJYi38vKAIPxNnZj4HCBBcHoB73aRWCc4lvonuy4Hjvoc6Mf8jZak/Ugd3
40JuDxHlUC+bqQ6mB+c3JCdLH7fWwhNTaAQxhd+TpOtBPQHBNUvTSKDMkk8ciu6Gkj0eunxb87K6
CnL8aAV/A7+B4bDHt1xFlbma/vFABlkn0JkvBvmXHoYVXA1rmoxxV/0k1g9Y8TAV9sowLtabQcYu
HvXaaYlCVaKG0JVPQAj1rGlBM7MW6VZ3L7/D4R/2s+ZcU7Hxkwdy0cjaieIn0749pgworeadb238
BjQAMK6fYJncvKnFjwOXdl/YLu08GkJPRLcK08XVTK0xcBwMkr6jWLM6tTzqQL2QNIvIupCUPFAQ
2HX1tkfjOHiX/boU98n1c4kVFC7iEYMMPnfWZpeUshBCPHU0NlABFoNt4FNyhNyxn+X3ZPNnqzdr
5nujNcr6/yrM69j+p5o6edfmbBOP2ouRE2ITkH6hTviCPPOtstWvc1zgrweEaesCEWZQ65GbKKeQ
h/CnvPm9zwZfsSEabXXcRqKC4VUx4+V+lTtkc/A3KygZRxJkNJjl+iAG3sBpRgUyTmgDfiCWOlu2
BZK+MFxyoSFhXsvJijFMop7ix1KueiVTPtXUc3R24wkW2BGh9QoSzGiNEZNqjolpUhf4w999vhGu
THhWQLaGTB043oa/RjdghxlDP7f3glBbKCNjwWHd4sAu9xY403OSzpfEEpunEhtocBfGebOFtGkR
4tRgGnxaUmLrPl3BGkdRJ25puMk1/PCCciX53jV1cKgdgrLMQ/mH82+93ztgxrgsANUc7bnTGLit
t3v+O4Ht20yQ8mn2dCOdqg63mLqw/5fuRCTf7ZnR5nJzJZEbcaXikK9HTOJoLo9PAHQyZFsHPVxX
yrxaNGZ7yyyHrgQsnYvVlURRKmaYMxw0OId9tpiTXRa6VcfeWtn65O16MYaremxbUmZPFQSyjwM5
nzbeyfmKrUThsL7S1BYgWazyMtxDDujljUQdkz6VNHOF+UNZHst4aUIb5BEb2Uxe0zJbiBGGYYG1
dtMtsbBar4ekxoe9iOoQIQNi9JVdzGLen3DfJ/651MMatXsDr02+ymcqnQpZo9SQnVgerswrqB4I
qpetKXG+f5FOoLiWk1N7D0c5wK1uNyKfmxXjdSlZwNaS1udXtZOlxvAxnxs4e5apmRcH4Mmfn0Mt
Ku1XqR13LmAK1b/4jIn/TWp+8gMHoM/f5XSZUzpaTmKBTOvHL7vTr8D0zvNELjflU0R5s/s6rA1X
0RQ8ZlGZwnCh41K6/3Wab3zMg62ec9JwoRGPG/wWypJVJlPKfRX8ez/IrLEWL8TS2hvudqGEYpLp
lRCdUXKcyNqMDtvzuzghzGSO6TwOK3r7swxeYsLREhQk0AhyLyMcB/s7bg7Byt0+3LGegmJA4Vip
dpOKIQlc2fgCzEkhj4ny/xEdwLvMKFPESEYCjXMDU0sNes/RLFAJZdZrKmaSzL8VmP7u/Nmi3TA9
yL7og16bRwoWVWHNCV0gioN1Cu8YGclwMbBFTsCQc9xS+Yn0iuSK2IHr91mO1/aRI7A7u7aQLdUF
kdPGb8gdEBeSn7CeeYgywN0zf2b1EBSj4Um085AfOqxDFt75E0UNIP62CafiLa3gr+vx/Bu0V4KG
NPMMzV+sLpAl9Bep0tWoFVwWQG3R9lUhp7tbNWCRrv4bcUCisVXXu8jd0w+6EDi1Jm0p++FNOvbX
OoufR59igx1CRCekZCa/GZFnTjb7UiwBFcJksCzbqxUgEnmR9XTnZDbarZcGvLj2/JxOS79TljLx
6ojASsftKpsDOPZmv9ajbDI/1dSIHTKIwUmwPkUjHxdqf2OEULclbxaJ92N/UQILU86sP+I1XVaU
ofHWZ90r8t3z1qwCfm2z4qJD88jDsT0MncaKpo1irT33SzDOm9Z2lrTnBXb03CbEzkTcmBMKmexW
fGE6Tp1Sj7AIILIYx/ChZA/XE3AVFtzUSpQC/AcwSRmwMvE71J9pzK5hfkgbUIPnUG8vmPB+/Czh
GYJtcqbiTlpkSO+R1HUBYeY7fgfi5GrCpOnviRo/+ntP2NQetrvh2/LByuPFFvdSdpqjGmXFblPk
c6mMUnYelO8gMdReNv9LwJC7Xs2dEzJmFJIc2dxmCwZ5ecEWT1o+Zyf4UCElxOjuq76R8gTtC+o2
cJzsXreix+7MT8rOFg6xgL874uAPSQA1r0acd7SxN/Gi1YL4Q/pkfs1gLzIASM8Nx/4RzhCE72pl
Nm+Jr6uO36d8yCHRWDtRK6rOoNiQEm0Bdlh+n6Ip816WA4qDVunA/VbtGOz9fcmRu/SAEWp3wOtj
MnZlTMNsZGFsSSex7/1vPTepp5uN76Xj1a3RquTBHKX5sMvbuJdp+gg9+Ha5MgiDpDC6s6tKFr6T
gIuAgI9/o94+fhIKscfhgY4fVMp4HnWiHeHUSwhapx1n2cHjoi8rrnbNgASCE8Sekf+9erkdTm8X
UggZZ6JtnG8k7vN1Umyxn4j4YZvPBz3uuXXNeiC9FkKZtCKoHPAjAGDgB3jr+Bly5DHKvkj762DG
G6j7bC4DBcfuAwBkehC35r/6SNusXm+qROM2EqpwiM2m8IBASowbvAZoa8dcwA2PZBjnCaAsvjLt
hlQ2E63zwOz/qpJBY0+coaA5v5FvExeS4LZUuCC/cGTZXSgR1BpOZd7FkoGJ/HHJF2Wogr5m3Vuk
xPh0rQ8lX19+Hb10l66oTkjjudU/fPMZFk9m8TXLMXJz8oE4wqSp6SwLzDT7ePzR3AkHIwwYLRyz
KO/9/jJOx/U62Zbw5oamM/AKmnjeAlQ65YzkTqvKaECz5gyhzHw9vEscp9tJIVXrjgrB9mveKqKD
uISUawjIBQEFhKuR30HnIc/1FMyjrUaU328O3epypc0gNCY1VY8IXkQL4KXQvJme1OjuXHCZe5Rv
NGh5U11ypMfMZ5io5NcfJbGdfYMRz+D0g3wBK7DDLZaCCJldZz+Zc6RRIHkTm3o7l5/MWtfqzYBL
Jq4yBVHpp8Bkx9j8mS+lnDLz6sdJBOjnrrnjI08BAFVKlWtRmmoAbK0bTfwn14cJPKe5vdIAzSr8
lGcf82LrGkwEA2sS+WRsZsEojjniPkxNUy7sSWff3CttjNsGcBuWBcfU8LS0SxIcYsg0b3YfLehk
vcm0WB2kVEA8k8m/aHk8MLu3o1xQDltJYWPP/WDxXhzB6ZpbXahy+FaTTIu67jQavEJ4z5ydr4Yi
srjEUROMxpsXkZcAmQha5SIW+B+zLWQk86bzQdZOX1zyQ3H7EkZ2IMYfbdbO/u+AqFEJEKkZOgec
dM1x9M72uNaolluFbF6ULn+kmOqrD9flpykvZTCNBLzWIpSXOO/iQVPbnIzRn8qZb+Z7TwzjB7Gx
Ys4L/jqGmfa5MQwu9Kxitz1LHjZ3PKFGBMBfRQ0YhkcO+s8qrr6wLxwU1BCjxIoPNiSm5kFAYwdA
0fiT98nVrySl97U0IielukcP4X0New3WF662NlJBygkw1953INsBsMOTNMi1a5UgHHVc2dFh/b8D
fWh4WkFZqz/KCUDVQ61EJD23BO04FtM/Gu/PWXG0SAIdrjGr+KVGbulZa2GDEI2RvBdsVELsQHuG
RwEyDs450GZEgir8WMCWL9LcFJXsk9c5ipcsnSrUJldv7v4rwZHY7eXbnbP5UUM5E3fr2IwDBi5N
zUaEK2LiaNRMnkks2BkILM4/UnRL7PvEKj5yZAYJdoQZgOpGZ+TnmdT7j9OeTralR3AUrqdeXlya
mlm6c4+xxgomFfLuZC20gkgQ/38YUGpK04o42wZ6INAkv9Ggk5dABQktL7Dk7dyxtWPaYtiOGQnp
J7DL5OABwjWZYxvYzn7714xwg3mceyWcFQt+Ut0wHFHg5zHwSJ5xdbMNgtAaVfPiYtrUbC5WLMOY
GntmqjNHM4VRMaOhec1fVhFjnT0+IQB6Yyq+RteTLLCpvkdFQhMTh2lbpFhZjmCzzjl4rXheetwm
URwkHWvKOqk0G06KMSTFECl2Ja2InL+FR6agsyUrd0Ktc895v8RaVpyWDFUR2WkaR4aWZHsagaEE
QuLJ6jRpF6H/osbxfUMLNXxHs/97qIPjy8wQqSzxWNw4RxZ3040Rg4VTX1s9L7vP2DFUvqnuWCcu
0z3MYSc7hlMj7bYEz62M+thP74YjNPzEpsfauxCXOs3k6H4/oFcdN2F0BJHREMAtyWs1Hc4c3Urb
ibkeMo0r2BDTSgE4wYkAXucFN7UxwFeg2gAxqTAux6AW9A0xW1ItHVyZ2q6PdY3pvPAKAewmaaKr
Ukq2CpKTJzcyEiLtoToKVPkUDwCVdPSoecRB2iomxnWgoAVFUWd4K386SdY8OIPySyHmKhr+ZYt3
mszNLQft8YG2AJrH3UkJfVHqEWZacHhipZkGFTXgrSa7WjQfSp5fCpUsAG1IqRYAQxy8rdTNX78f
A9WxynYlfXFm0kib1pF9hSNP0fvfN3teXq0IrTMtHg0olRixzTr+TFDqMxba6oT4C/YxjP/q/g7B
7IN1I4azGVIZk3EDUQrSn1S/Cpd+b7ndWLIGlnRz2Qp0PxJhWx7QECKWCkQ8NyZMszUKgbQC1OR1
+Ce73fA5JMQBpw2MZACMmegc5BUO9nVLGvWG+Nr+DN6Wyfi4UlhSCd84dPLQBucsJosDZ05JJsy2
Oa0mmA4rNT847D+qWmxmKybvvsTio5AnU8DoE7EJG4yBALesbjPtm+pNT7cdXrjjHwhcfWgrl1yz
J+3v/vJ+jcryF8flTB/td5SBkfP+v1KWCO191XKECWHp0zkgbHwUvfeFmYskusbtVNZdA0N8RJKA
aRZdS4ZKn9zxG5ZW87XmpYXX818UKabWz/tvSiaDcA4knIrBNWQL8oA/8Jvc7ThyHM366xjYj9WN
PDVzVOsncKPrshiyWGcYC2PhcEalCWEGAF3uaRgZ8TFxHQWWRiq+RcKr0g/mHUVNwkOkNZFNg48Y
NSEgMPff/VC3nfB79Lo2YHKvoVvcT3fX3QvB3fifbnHHzQnCRZf+vWMo2ky7pgKzE53KKVFP5JVZ
7KoI7+bW8GTgCMjy9eznGWrHqGhSQCIIkh0U+I30E14JV7Qj23+CT/qMX9EZqwAXq5RmUtwWRSTQ
9h66mSD28DyqlF0dR0gwV5Hi56blfn/pLkNWQKEQr+2sEEXxbMzRGkskN5wtXpnjU0S/8VafyJJO
7rbZ/HtC9d2f9LhUUIZvonpOGaeDv/t28uVrROgYHtFHpnJkEBDRbX1SWmAJ65VlDHjNZxfGX7Hh
Qajm5zveYbOzaRpGphw5EJCURjp5P6fT7ksvzzyXp5RL1lOpEHtNIoKHPufe8QTlajEXe2bbkWpA
9WJ34JEEClZqr1cs2GaWw+RJs53JUO9mbNb/C1Z+F7CShoM8cnXURt06drFyB9SjmQMBn7LVSJ+i
acAi9+R119L1ADJhlngdY4wgOB1Kli1Uzi9bRp9okKHM1/Ka1FGgW6VXc2BdjJFV0TYnHlBqF9gi
oShYwWylHNDOHko+kKvLmAuedau71WdqZpch0SaQ5ASLElv1t/sgKjDwwrM5fYRu2b654y2bYPDR
62o1jGPTUj4+KuuJ2eMsnjRIJ31sNTPLnq3Osw8qXP1T/yzLYRjeA/316JxC+giPAYujXgmuwJJc
kTI/NilKdueGTASma0tS4kKDXEI6c2duWylHOkMIM7UiCAkBlquyZ6K3fgZXZqGgtzNTdDuQkPD0
UWzWljpxXsaTCpuOJrkH1Se2v7mnJ+VNBy4auDFmq4opvc3mIGJnPCLNGfyh9tXpyYcSHvYUV8kc
0ZLaYruINBj/1QQ6eCiO0cHuEpAksneLO/ZNnZJM6P0Pk1Y9ms2IOwpNfgL9NihVTLqPmJnACM1s
uCFt6ORaKpl7o4W12xNP3GINb6gZDDfgU82NpRNI78Gl6kA8IUxXMIth9+jtnwT9py2J68LyuiJb
6GLA5mUQCe/DTE4NDGgKsX83rtf5DGuLd1G+OUj+1EpI+RLYwXKD8qnzzfz8oCqW3fLD67oUuSvO
6a1E1pNyFf5FOlMwlNECHXen1dC+hBWn+8ZsKx7PedlwMwrnhZQTIuzqJQctFCNrU2BhQKvl54nf
WPPmV/44fZTQqPvm8h1lL1c97KYNBwY1nbgGxEMsJirJjBk04Z42VICDPGAM+bKrQBh08hGMrRmE
41IXSZPfVFvDpcPV76AfC9N0hOccg5s26s6itUJjg+TL0ySVrl+8wWmBfSjhn5jcKqe5UZXkq6RD
+zQtnpUDBnsPaTko5XsITu30VAwq959IlRYkF3lywXo7ZZchTO6TNDvmrqiPLkWmvcDs2KScscDu
RFu22BgzKbdeoLV3zbo8O0c8rimEHmQIH+CMPpwdw8K4I6ww28/uyr1lDQjwvcVuduoZ+PGWTqC6
5M0dqgZE3vask+tA0n1T8sl4/WZcabBhblOnWb2uZCGQ8ntXhj81DJbxr4k+X49pr17jmQT1yTLF
FrG4i8rxbOkKeGJXgCaXTOJK/ocGuwZtfaPHyFgNvQz42I7W9Pz0SaizXU/b7f3jzFWR5R/slWxU
iZGwd3JYiXzpSpxdZCy90mASSnO0pXIps2OjOzPC4jn0To3hJrM4nKXJ5/nG9ZfZEoVx0KflVQvr
wd76OGF7ezj0wYInyYEazSNKVgQ5Q2sIUkHFND10WUm9Z+J5SOGzaBRgm5xx8quS1AoEQNXd2V5/
SrS/zmoAUJ/0pLPZ5wz+efqUyd3lhDR8OrgSSo7wVbXCQxp0qwlRJ+Jv96Mt2+IG5WJc98mB6/Ru
qQbaudJN+eI5LTexr+MiustzQzzwJki+Z6/OKmK9JxjkU1HHbElX1woNFVoL6dR9HiNG9oq4sDZc
cTsG2+xt0Dg4pykgDoT+KWA7racMQjUpI4sJzeu/m332Z6II682TYqPD1KlSUbq9m5+5KxTTIad3
DKfBU1WMGJ/QjMF0mviQ9+1E+jkT/Vums0sl+WOwFyP7cuMwtM2PRzhDIOvSNOs0e5Q+u1eFnH1p
tuCe3OPbqs9HidiGEbrat+fRf/znbVqCW6bQeYGt/ol9frYspKS+DOYM0WacxqcyNq1EaY7uUX/J
3uYsRF+Isq/FF8DiPZdj2l+JfjxOqZY719iemUoXjfnm9Wyz7rSEnfTSiZENt3kadfMMGnEHHpOD
0Whgah+TmvCaaTQzh97KcWwFCQEOb+lyLjKkpePzssd0Fth/2pSV/Pz3tzLaykcpSA+dV+n2C4f6
5vBOU7Dje3NKcXepOpAHWEwvmvLrhjzbMxenFj2KgLaBD2KZRqAZVDaGy2Xd/v99g77D1mozvaZ8
VGAcEOPRlOIzMgYqcLX/U832h1Fy57L8T6yyRutTFwZsJ9SXI7XZ1OuBb/n+aYo1Z7VwOfgEBkx9
yOpr73W980KbRyoVAYyuKY8nQbxsp4teqqSvMStniQxThIvKh72paRolm5rC4g2gZ41ETpRy3fnZ
bk4lfe0r/o9/TCVPxWug7vlJ+kKGWSjab6Ns5ye8bq/njqBYCck1xiAvy2Qokw2NTVcp5CT9l1Zi
hE+qiM0TKDSIbPyvde7nveKOLMcMedBnwjtPeQcOx10932zm3FXJ9PIK4keEz35MihapLlFLnzl/
x/+JUe1ybY3BWTLVv8ZL8NcwifhUZgYqCx2MYfRoAcl6HPseD21DLbmabCLzZC/f+BvKNr/Gywxs
TAjFmkX+2tKTPXsEzf+OIv9PJtHgcSpqieRt0EsDAZDDD2tMUJPaPOx8vxTbVGq0AP1+95p5gLmB
3Wk7P3hoSxAiVRCKYDBtL7vjYgPSHYPr2uWbbKTu1+Ks7h9uwNc6ey9QOGsJBzXCjXmGQ43z7qXY
sGK98FmhdM9kqcdnkEqMQYoTmT2glP7xnwKul7FfXbNAyCIrO87Nkqho//FXzWyGFpZuGIMHchma
JyJfmR5TmiKHbPis0wHRQ9dStE8tL/+bo904x9pTUeL5PvgYYSjjUzAGb3DEMNenyS0rHdcoGAc7
vvQ2vk3dFR3r2zSC9joSOsXU9Mjb8tUaaqymn30VRnsXaDii1H729zG3RLGDAy/yRC9bQKtjsF6R
vGIyAUf5WsaJ28uCmQZ56Kx43LIs5lP4kaXAu1f6YoGCMZCnAgRs16XaYY2ji6Agx0tjYgfy+YoZ
M9k1NOeEI+lnEw2CRSe38AWC0LfTZ1IBSx4llOnsWfBm+p+mt3HMrYH7B8lNvtyjcuEg3MzJcCCA
LiMOBwAc6Ee7Vaf1eIAhVhFwkw8279Uf/TILYpT9PiGTXqXoyXKm8YKBO3TEof9/LQN8Swy1vbS7
RY1T8AHBrCMGcC7OpKFhhY667MOvanJThgT7jYm+yc8a6JyMANOyEL31Y015ssF5IsUzA/JBKEdP
fLxVvo8N7X95Yfdpwkke8xyW52akIg4H6pcs/q/u5u6zQBz/4eGXITw3cZa0MRTSYkChDODI2Wzh
9wVG8sdDb2RRUPOOLm3883zjYbOeYjTALqmwH88PW1XSI79zY9mXksGkP4tGUPrFSEo+UOLDAwtO
6zReVKyH3FahdeivrwhqgO04fIa3kP9djDylH4X/0U9TKo/p9KhIKFUiOFrP7w+r+MHf7Y8dq9hM
cN1At18m9niH02o6dQPJ1zQJZycMtKBEktn8fUBo8l2sh6sqgu/ZSBfbnITukSj1pJeOUMxckwX+
1ZZ3uDCtwY1Hwc8zsShTqPTfH3K9ZAXm0vnK6Qy5PuFvLFnc5UD1lns5D/cbA5C1piqhMXSOMDtC
EqOiJU55zraVpKmeDRNpDNJ2ltLOiZEPGh8fFKDi0xMJuaHQ+07jkWMZ/0IsOj+3asrQjHHwxbEe
cszpq4mBCqOPcuwEsSixopo14+I1qRfrpb/LgoA3p01i3LwJJcOcv+dBPB8/pHTePoWrKz77bv2I
Lq6kqAyHuDxUxD5uBcTvkK0xFHOk7GtZuT0jFWhQWhF4nx+I57xkmAvUEneZUHlDefA625lY8k8J
QtbEonFyDjZ72U4IXKRO4x7jmlcZjVTZK3Gu2S3FCLtssZC2c2mX9yGTdAe5nbuxFXVssp8BB5jv
TMkjpSYJ0/U8qygSSrQCS84wh8GKiXgeg7SoJbC+yRpIf1qtYdk9WF8DkqcQKx5aelQr+JeM3OIc
54kPwa/XTQDv0HH01iOvw7WITZvyvztakE457NdXAiwSvh1Jvb2hDS/R7+JeyDyisGT/m2S3XVA9
HakyDPCVduEizKH1EvwGZT+IUoA57daDhB6yjnZ7t5BIr2A/QnGpQ/nASzj62ai0aH4r/H1ecTay
2RRfsulC0SGLwQWRD+7c1x7QSY/6w6o2KbW9byWjJX2xkRv2Sa/JiQRcBVUQdHsXA7tP0TJGqZiu
u8nG9fNTzA9OP0nTZaJWSTKB3f89Wd42GnnkfPiNYTnZUG+RW3njE/AV5fs3EixknRc1IBiHBett
mYsJ+zu6DRSep5uiWAoGk/C7PVtHd7M1MtfJZsID63xCE2P7X5fmCSMBgX8mKYzZ4E/QtpdwRe7k
16KAMPVj5hsLogLUqCvyNNfYNqGPhAux0LoXl5Iq/PS3L+1lxtNJtD1RkXVBzmDNLNpn/DKsCs2b
TG/n1wFaEpNrsRYctyQMRrjSOhBjqrwSaNugDn4iG2arjkVTGzXSCbp0PKABMdq3cZ17i2+CO4Gf
mePoxNYKAGKvz9YY3UV69znI429BogYebhb74PV9/j3rodXFEme8UeIvVUmliJ268jNTY4qceqql
OiqUrSlbNMFuI5YpWxEtXq+Ez0eapA86YI3ukRomi+aQNGhdPRQeZR7k0KEf5aUzIR5HqLFbv/Io
LBejjXHR426N9M9FkZ6sunk4pJQfC4DVxSwVEgcXmO805HFX4fHS2nsJ3Oa/Rsol9xnj+iQUTqLo
MREeqNqud1TL8kT9NFaQtC2qgGHy6K0i+/1N5q8XUi3Tb9LsHFK5dd5HzyqdjH856gGmDJLS4o1t
jMQshX12k2lv+Zb94koYbs26ICVDAHK8LEMBS4pxpSffexN+DiH3t1bhWul1kw32w7K2Bc5wAugq
CbYcJfqen7nPUNkrClQypZXk+58gvOgpzhvcAMORMG0eZ3WRLoCGv6rCdqjGaJZ0pZxkMJ3t2sok
vli65gy7t/4FwmDno5xFg2u3GTYNHlMlBuWYSC4NIiX79t3zfO5KiqcLN4RbeIBFLsYbJtLOemH0
gaD+KBgk5sbCfgj8tIQA4XW35xZQahidmFMRLZs1dL6JVNi5ku7rK5QNy4hVQY6iOqqfe+Y5/bWY
vxU1a8x6qdxYoe4eN6CJMN9HF+7Ptcv98Y4NcAovYpSbXNnnCGUs4+51D/3E33datjB3M9N0fNkx
7l2R+FG9+OouknNBXlLRNPyUfIOq1Dv2pAp+3ZZkWBtYqdVvjrorSgtfg4NrwVuum4UpzVor3/w5
yjfE7LtteeQrt0KgUNZKLZPiX93puJaLpPDE47ftGruoMTojDOdZSf/6yFiP51Rbiwfs3XSMoATu
cFHlaoMJ+L5v/62fHi3LaEbDRAXd+nstL4L2spAPVHnUMfANA32yH4rqJIXTxFZr8Y5oKrL+tHtB
cGheZZvhMMZu/0zhN2TfBg354pJnS71UjAtECWQ4Er3PIaW93p5swhr4iq3DKv3SunGg/8s1sTbY
irHfV+4Fe4UoVIt2JdAR9KqBEakVRX88X+AWU42CR8XTdhaQnbhGizQ8V2N3Tz5aTReD1VtqP3Es
f2Xe9wBdFjjuwIyfInfXdTWnQAb8o2NbslIza7GM7sCGWlFRcH19KoQ+mv8QzXPJA5juMkMo9IhQ
11swLmmPOsDfvA9s00oxM4POK2S6OvqVGrxhMO9SM5D/qpoeaAYKHLf3VqSAgHg3D+8iQfZWlbsF
wG0aKdhKcMYtFtQ99/pauZzP5FjDr5Ata+Lz7GLfeo8B4RgHNGPLTt0fvOzl3hAE/HtF6660QKAH
Ulkl5RUHzmrYeMSkN2c/VG6elFfO0Q73iqmsXpzUs3w4RxewUtzmSEVbIRYYkzFL6WJzwjdFxxxb
gO4YRCUeF/W919y/ZghHY/qh4Orjh90nk84mZtTT6gazpHJLaAzBBsoo19qI6GKJDl+bFCbMaoQ0
9D3SBXy72lTS62+GaiO+EGXBT7U75wq/j88Ufp5ZJLYTmUZaPhIGst5vq2/naCGl84+yh8zoOXt6
0tJRpLUhxNxjUXx2fOlAmp2aNsiSS3jWqAegoe98+XvlzvgZNvnF7NAYIY34Gf+LZVLZJ+RcrXRJ
sppeJfHirXPZMNZj8NexRFYmd3JM8ctbWmXtl0g5sAqd8HhPdFgixJHXpPQP87wJYWnfKa9VYiBs
dCp77zLGQ4rIQpZU4pDgyXtjs3RumiCn6o/1ii4PmJy3qyQvkBQvp+cREc5zd+j+yZhD4WpjZr9n
fjBwr0McOAV1vKEHJGwSq0EPowQTmJJ1wZ22+3uWmOhoEbxqXokEwygZyKcoP4kCuvxDsVdVZl2A
7OFI2qKTKOc15bk4r4SPNxoEpwSDpi8klM77k9nuudBFsc70vIUwNEG8JLJULZFWVYuNedQFnR/v
tI1CK3DoeXOtbfT5hLEfqXomgBCSOyaBhVll1ellJxq1yBEbD6MP9w44kCuNjFnIs8d0aIsTOfzt
Kf6r3qqjoRH/6bpVLVLiG8LU6+DeM0r2UdPQ1zXnMBbSONJfzBs0Yvar3o5ORmEVtMVXbWJyQVOt
1+iJaiWbcJzrdgRIs5+fixkDB6nrNt2FKVkqR+86yUmjYSnQBblti+xun/EsQvEyh4diXnMjR27G
s+2EwsDzxDTBoR+/IUnJyHGKOdfetLS9eQI7776G3YZCmYut0HZK4G59mIYMqPJ7GwamN0JQbGOK
oqmk8tDbycuEr6ianTnayZtxG2h+uOQNkdqQPHmMIZoFkrmS4EtT76Wh9F1fwn3ZJMWiS0YJFIzl
1VO8kXth+dCo7KsEliUYrdLgJi25GjZh3HmfzIslgi7DibKH2HBGOKKzvf8zEcEC9dtKuA5035g0
2fZ38g/tJIYfAIUuUIqo72w+UyPn1q444tw+4KrMDlzKH332roLzeEMotWKL8RKxNG4BA0AAWr2k
zbCXaEt6Bq8B77CnvemVuQkZJ6GetlhQcrQSmemkmosLMS5bRWnfDwnSc6/4Umoz+O8xJ/m/YfYk
fHimG19qTdoHPEmeZhXN+LJVpE8rwmazQY6T3i+ryB5ReppoiBhj3QLlbQkpLS5zrSv8XtXJBcWZ
jdtM/lalpTjHr0GRpFsTfy9Rkkrxt08jmTQqjTw6tnHV0xEHoi7Ga1SEHRPStcM3lTPHTg/DUBMM
Tg2E5F7a/6VBQEtEqiCYJffZzos2i3uWesiLkFOVPhECubYbIVSkhWdy/SVCFXekqJgGqWE4nZkO
XXls8qFiykA8ov7Z7alN40cbPlqTIi+wgV70gLqHLAhLtp49J79O7Sz3SqjU+2AKaCYyXiVXgzrN
Wd5ExFYmd+Gatv/lUpfVumC8gqodySEjv643hlMEbN8IbboJdP7EKEvaVHqVC2Hd/z01OGLY1u+4
rDFUrmxNsPhzm84Zw7nOkMUMKuEIFUAJQ+MUSx8b5H77B9wTOAXPLQ9a+RcdSsJfAbPMe/qAQHuP
Wpbzqo4zeKjol4rMjbKlfaw9rlZKqomx1TIWjHfF+hARiVErzH78RMonlJWnS/JNqGq9Im6zHnCb
0AyxC92cD58tihm9OkI6202pou+LtoUOtM+ZoyeZk9E8FDJeZ773k+5GuYPY1+qv/GbtwsXU6PwV
QE6+Nre1ZWvX/O6qKMCQ9CZsXy7tv7CXx1d8oUhOJXyPyKDzTQjHa22D4q5eHo5csEcf9JPBDf7j
V8Gi+C1WcTG5Oa5cnqf8Qtx1JcNBgV+4GbWBJnsq8NKHRKBPPWgjCM4pMB2LV7hc3L9zRyUzdUpc
m6TWuDFAxGTxlfZX4sw8+Q3Aaq00+DDhAUGxVIvjWs/uvR+B6gzUGzV8IPuv6Oos+9J2dJtDjqZ6
srOYY4heWeLesltHHuioD5mm+pKvHh4qdVT8uWQ8Zeup3SId4MBvwnULUu1plIt1+OOANVQ0CwWH
u7mkddLJ2xTELRPQbaON3wtimP9Qw7Mz/6tOMwkOGPVAbmx2pUIOzImy+Foc0HokHLgLpVFZyOT0
61wKLdyMJq6F/syhBQjNdyf/8qktkrP4mDkPJ/KeZn+nZdERVvdSHmaa74+vK+kGaWOws8SfRUsg
4MDuwXQlysdH0Y5h7+ZXmoP1wEQSbKEUmqtfumapnimpKTj8MSCyZwgg4gkszFkk+km+nfwKkhii
5i2sDA9oxrhXePHCn6LeTQ4Fft8hyjfHE66elKRvcU7+ME/T2O8/sRLeTy8deKDowyHbOMiIeRl5
QcH6ljxCQ4r1v4WlWi/ofHtddT1K9f0iqOjJBJpLgdh6YQQycKZ8eWroitEDtlTGnZp4eh+pRRJ0
Di46iVvUf5k0CtUZzDFWRIrFl94QjD5JL51q3LMhDCcTU0kz4JVso31tKrTZIEGDOr2gdPUDtxo9
cLi9B7c1tTzB54MtY10c1A9U08uRL0+MiWqTjzjT5K+QnnCrBKufi1bTJjfGiP74daPlUSnlUWWf
9in7ZMr6/SQ60Qiod4+ysncWdcRlyjqs4g61nzusj9zHeyqc0PDhFDTKSrMbTjo/rvNTqZuhSiPu
aO3Kha7OdaC45odJ9akvXYhzpIqRshzpzg1vuqoPIVX0gNYokJt1zWWjtTXcOnxeE2+6QUDNnXk9
42+uHb8tEBggM3vI8AQYFJ5eI0bOLK8Nr3iUd5o0R3Zf0ccTrGLXH2Bp+2RS+VxdSfIMyG6djwJg
MDfq/9wPSAHmHKnTY9MkOj1/gEJPeCLcXDBAcC8qk8mPLYzu87cvJ5qa5pB572fgQ6fy51b2c9P+
KZzhw8ddHme6OGWu5gECTvkWkth7nb/qHMZQ1pWZA5hBHIAZulZqUQQMXcLkWLnbNH69LRndC60Z
tqLsnuFnxzr4RDePzQ/2gFAbs/n6o7w2yNmH1TysUd6B73dGfEb8yi1kJUpwSy0SG63KQui3DhZk
uiz6T3ywf2yRd1k5xS7qNf+6pV4MtjyDXhaG7ma2Y0sMWVxYchTOtP7kI2VfR7d7xRSJUJDgnDsi
2jR2vVO9Hn5M2jrvEvdzYinDHh5/DL0KpQpnQg+STmQXP7Wm0w4Tzyo/vdnwlL9FclGcWLdOxu+K
roebAQgzSiUuTrAwLdBTARUSSJ5iepEKHyAa6AIdKbf2HbMn0lDcqgsvUuSEiAuQDwJNWyoLvviR
G3vbnqa+Pv56QKZMS5vpgV0viA4r2MyvMj2dNOd7a5PBeCKu1Gm0M45xXC0oW8RsMEEIMYlKBP7y
OZDjSY+Q0W4AeYoQPUjdh+5rdS8NO1t/i0dvCvhTavTtm+unBKMdcTdKYOMCLO57zdE4roFG2+hF
3+TsPYbg6KQesrPyan+16OjAQsv0iCHbuZwnSXrKTN/+b3wXGuUZuEBYLoaguU49zxzuWCE8cF1h
BIVucrEdwWDmFBX566jzkT5fIpkg8aCPtupEuC/n/LKzSvtFZVnepWwLzdL9spT8qI8DECdrMEeM
W2JePHaRc9HiITVH9GyLJfokXSbxbdxkkr7aCqvOqsRdOqQ03Yb+7gZeS1AHAKRFYriP11+s01OV
q4SKhTmuRF63mJ8W4gghoDsfUqNUVs3f44/mq36fTkDgW8IGgCf+ywH1oHLqblcktRMHrC9DizBr
YHPCzOAGQuqPXP3AewMxdiJNAa1kFKBOcwfeoSyvABLngaDOBKnW0LgIpRCJqy1E2FfnNOhEuDgG
fmRBSziiQ8oxYLM9kxafmA3jnGxbebi/xhRJcNvlHq1zEyK3BQkGS0+DMYnpY/btzcNaJsf1sDXG
x6t6LA6kyixbUOdJ14L9R/M6cnSRG2gyXakjLH3zwKuceRKSJsJtV3ZDttoUaU7AAiH0znrsY60N
nqToleBTJmavuZAWQvPH9x0mgrV5ub63JVBKkGxsm422GJkKcug5siIwFA664kbZxgZkg0RkhZlq
pg9I2XpAR05olA2XBkjHeuZSIL4+AQ9UP0CuosmjRYB4MVBDQ37vNFjv8DH/xkdEwTMlY2LCHGBO
Ups+b9RwBNXLkYamBWkWsaHWfBmD++1fVgANqEd9vBFkFcwVgxfXKhJM6gp+rbWzNPSIp+/omyJK
Vr9gqlDYRGhkYDS5o/8szdvXIgGOee8IW2shEbgeUPZCHLmx8wD8rMSDYeyy8HazMRNwfBjNA/rb
dcs4v5X87Y1/k5tdrkJKD64L9/ctRgXyw94JrWBU+PxdEYOQb3ziUqbr/vKY6nnG8W+VOaxQ+cm/
LUlbYuUacK12HyxyeAbRsXSgnGKnvV2jmIifTWAFrPZLr9gvgdXqpmJ0KsT9dGOLJhlajUlY2gE6
TfmwhuHFYNYaFsQHfqwM1MaEFUGhUh24nR+XBT8gsqvhycDb8UvpcnEROv5RFxJRpv3Ni+mWYv4U
oNr0rdFH32w1hH2jDVZgSkPh1VbLvafNIlnFZGACICrtgYCGyuQ12KxJCnmPAv4RWd+fPA7nSW8F
L+6yoxWZywAE40IlFVgOo6od+YdwDkeQjaEQY16aLAqvm/4Mfzdgbi2gMPd1vEc/Mz30lv86Egyc
umxAUAMHPvmPSLC0dZUoofYypyIGsKax9qg3PSoO+qBjzkVbzqoNikaUr0SUR6zWeCHRuRoIYDvN
ZJD+jVZYM05MfwnEhL70+PdeQRUmY2JsriEURV4Qqv9R67Vlg9Nea/ukJ52ECwSiMAgWtgAPqpC0
LGyGk71pB2E/cb+KMpa1Ui+s/Q0AVn8c4JK4UnHalKSU6lGoYAhE5oV6Kks5Bb0dGp7K0H60No1t
vvAwiMSJ2SY7AU5PfJ9XcEdnzFibP8JjZ8Ck/jvkWJr4+xVsBNkX3kCgCGjNvkvxZKOIoa52BGau
sXiTgHLby5B6l3Ik/1pZ6ptVthyOy2oP6mv9hxUJAt6OFa1r1XnkmF3FPbpq724+WzJJ4Tk3NtWl
Md0Vf9xpKUZnVqIbPkWS/U/Ku59oBCbuLK+6NUCSk+x8QUNxPglsAuF+GsgB/bFw15OUTSGSvHgG
vgSfYhdDnwEtizGdXz2qgyVGXskyHpwEeIprVAn4PaYm3lo6+xLcVnELvMogFSsRUXR13QwETgk/
lxWlxNNOoz6e4hp71reQ2yRD0UXXeKYsP/WDa70tLlYdMnCUxafjOJCK7lH0WZpa+HY89ZRReu4g
pmFh7VOsU1L+ASd63LIJxluT8pXQyWrpJWNpGebPFfCGfBI0c/PRz8nwxIBtIsYjdqNhzjg5KQmG
Wak+2jHi6LhWmmkA5I2niqCEFTouoghkpqdEbss+6R3sP7PD9Y5ke3vqlMNWug8f8Rl+r4z4YUpu
GfLZKgmJfjw5v7ACCmS80MW+YWe9/QErnNiuw4xlxJAmE9krXL8dPoS0T72oa4MtwpLIUlzSiq39
Ba79UDDczSMAjS6u+37A7E+qHCDxHmgT6rgv6fgDbcLX6wsvKrBIhzOeGdhPlarN1Qei/j0eRhbX
W3OZ82nicB61tufne9NzJhVFRe/K0+smJYWOcCGvxAnT5/lFsodZjkSj/NXB7CpydyI9nYB6leQ4
9cPkKEjkGhu6PKSvhVH11MllfawSWz/zVQV2jO/nM+/5sYgBEffJ3f1pfwlLKz5ABXYpvUiSbjSB
CrOXEYWzzG/86bmTNySqH9eSn2cJNsNKjJQalcwpsidMt0T4uiIiXK57/o5mqpUxJqWRUmXYI2vQ
9jFpx+8I3HoOHVUGq8jybueqPD/OP4NUTkDPv+chjd2/AZEukgwqzNWHSx4XFargNufOq2M9oS3u
fwAxkB25qcyxzINAgSlZLs0vNHm6vHt/SLV0dSe+dZPLZ3Rqcmxw2ADehagu7N5jGy+Di1lxhnad
dCPqwA4jr9/tyLOhn+oM4FPTyrQRhQoAoD2RxC8VCJoORpvXrgiOMHLyn8QQ9kNmstoaprMBJzt1
LfOe05vpRLWqNUuF57GBJ+U/UJfL4wBQHi1uTkuDn4VTSD8+f5NrWUcHbmqjGbDCsH9QwxTAOG3c
kZg/kKfVl81OydSCwx62/c8B1Ps77b2PrjW//rlcVUwUJElcT9SNcDsg14VmZxMsTCt6kaSwgMcP
v1HeCZfaHEJLqWqSe6I8vof5rjjcbuvInGLIcqfXfE0jl7m93oHcM/EoIPk0KV3mFdS1Q5Vnm+7w
6H/dkdh8QGqWnl5tCad1z+p8gDpaf16d5CkM0O7E8Jkr2fFAkm4fp7eoBat9cPZ9uSvUCpak7cg4
JslK7Z8BuMz8U7PQqc+7B+F2Vz8YCQdYcv4D/X2gHR2xDzUK6hjDLhUJmFo7G50RzCYAfLondK/z
5NqeItg3d+mFvNS0ZGD+OdhvCbZ0m4P6OcWaLqCvIO84tz5Hcm+roYXVwkN0LG2L4y1lAUDyvN1C
pNQpmAWArKUAz+xmsXfhUcAnr6bQkrFxm5LirU8pv8AMzqlX1HkvEeeuD3674UfdWr8avSk2rpaA
bHaQUEvk62fYn0Hhfcsj2Z73VoP16MpB8rR6tl4S3WOQC9hy3YgWV3RwMD7eC2ZkhrMjM/PkpR2Z
5SWpvpOTqBxd4n6gN/unz9KwzdYZtxn9IWvY6RU9+oRtNThqtAumq2rOYLYiIxF6UcLFFTNX5oC7
aO0x0lgSVpj4cXIFKHGR9hEXyp+VeB+7htJwQLz8/W+tBLq6s4cNtSKgLMlwGcKz1iN8ZxTj0h5j
2xl/CN94vGsysqeuf9BR6hsIYF5crEzsU7psBG0COtHOMxRQT6iIJ5YS2Jc+L29JH9ZegDDThLBU
suiO466XDT4ebZv6CY0n4o2HYXOEoJ0Qn42bDCJN3XoakibRvY53aow/S2Qz92UE0vFggG6Ax9px
5XJ0S85TU4XnUdBJQl/aDrhGIMHkEqxSKPaJPlsy/BnCPWYbxz3GPAzV6M+gg0Lu+Kb9+hBjrd3D
HLX8p3NYXGoMG2i2XQT1d2KaOgugtyNMt3/2Yoi9Zst36qp5RYgisJRyuDcQM+aQl2ltMeivPkni
ixdTC3i+nYjNOFtMeT56ezG1cUOJVXczAsD9G87uOtmJwKjke0tAMd0YnFCpBNcTu0HISm7Anspd
FS1sRiBoAnMF8jdjzSs9EQCapMM42ap/RddaGlqXPrLFUf9+zIuQM99nNByK5gk0kKl91uJIzr5B
aNC0hr0mrFicxf+NJ7mDrI/Fq5G23zzdLfDfQEwi30dJNHp2rpHcUYcqdYEukiQcbf7PqT4OpqbV
Tscke4hoisrfS6MDgMRVoLikEaJqkWY9J6jtfoK/byFZNr5MCB0KwEOTeoPa7uaIRaUhccn5Kewz
BRcV5WK3B68z9FQzyDNxrV6f6IO+jk6pRka8jNTiycEsrnak6wy6JDXRydOzhfLILY6TXWPLSCFp
GzrUDNKzESFDKiXfzliIxXuGfKBE9axo6yGhGtqhh+J+AkmfduaWfJlVE3slRWR/4vwYWdX0eix4
0dqpBJ/lrWx5K+4I8Q1ddlsLuR0PHCN3u/3cZkhHRAkjw6Wi89jHsDTW7YC65g8f7VNUlEnJviv1
plovWkRxuNjs82MKQcgXmCzH5fURfYAmnQRIbNNbNcAxYlXaR5/EYBsLFIFxHgEHTv6K5g40zOfN
TjOEtgqZzSiDMRhXGmx6rZjp7G6SmWx9nFdr+jyc6xxbaZUWWPI1ZeN55jM+/biYcj07R6inwpX/
GJsZkOd0yzbFFfcZalIxJcwYQPcwM6AFrtqoL/YMwd/Ush+aVFMEH38mzLv5eVEvhQEp/4+kPeOc
IOSuHCGdjD8K2rmkG8r3VuTG4S/hgPDPtNd/6ST6iSBx2ZfDAs/EcAT+g2X1jGnHCgGEgJS4POB2
p3LouMDGETm4hZv8AwwBkmmzRRVN9KjKOteaKKpsFSm1b6OvoSlFr7z7+4m1nppf2wqJgALmJRXm
RAidClLKNIidw0zoTAEXwdkhbNaQzcuOO9FvrKfgIqnOZp7xiBQ9+3RCyxgDz1aZtmEsiP+XSCuO
/19G6S7Bkd/R9QwpTidgaChzLtrsX1fyduU5UyX6R4jPciXETR7fxLTORZSshWUas79NIac/gp6m
3vqy0mxHajhfhJ6puYVMV4xZC9MpMwLAI2EBYRe2YUA/mlrvv85Tt2FcoDWjj9WslbR6fONSelOY
zkFnmdosUDrel9C6C2LZ0bzyyxgbK8SubxJiDeq1ddrWwKfY8yOxlhC2kriQ/RunwVONcgDE/udG
Nu7Gz22Bsfj818xW/u2pXdzlsnIo3yMuzzSCBFsI2VjJUYnPQja1FqlUQhYLYx1rtKvNodTEvQkT
xF7UA8NuzfeFL/EyMC3wzd3U6djBZIs1/rTRMzC64H1SivqOBccMyFMapBsfNOkBMY+cngKpwTiR
dQ6P9zRuJWVm0StaA+Iwgu1r0r6vnAeyEm7TLoQRQy9eaJPDfpwq++uqr2rxaJi1Maqcdj1M7fV/
JaWJWt0Pf1UaEdU944NYCLJYlljc/DQRxb/lT1EYcOtU8GnydiwbStvbzfnhHvf4hh45+Avk940i
XW6ArBH+QST9cWosStzxslB6aay4L2eW3QXXHF7dLUP1C+oiqb5up9j9glE6Q9QTA9awthy9awEH
ydGV7wtOFCbQdscSbR3fC2iywHjmsodZ4wAxhoW5ifHB8BBBfGHEOJdGOnb+/blEkl5hO2qsyP54
riVXtQWiI3cpmqHGTCOmga9CyltU4g5zZnavd1zsC0f8l0PnYwABABZPDcurrSz4Mq5pELU5gqW+
L+c8LBni/zQL208fRUjzRRZ5wNCskitgnWmpFx3vCURSS066dNribwu4/MmboNekD4jro0Rw9PzL
rrGsU68OcLtxOm6/1P7BzUd8Yp4a2FBZ85rmvrMCW7hT/falJtV/xHZET8FiUo7PDNcwNu6Y+FMW
mVmrwv5mbC7Rk4dBaVqxmDxL0+v1I7TY+C3URUnSl4hS0JKM3Hd3jeuSFDzrQ0ePZ3isRFpV7bOJ
KUIKsUOR3f1WYugNf1CI6f45nKHmQvvIRsoT1NmzfH+7gUo7pBWpObblMIgfyYXh4/9nVVivBp0r
jecr0ADtNt4iYnjXV+InhkGkkWtHLJpfrhG1O7mFEDJvewLyliJKBubSRAE0365+rCyBHoWVOp9P
ZX6HcFjS2UIWH7WIddSN6MqpQr9cxKhhVEzhBDKKv7YZTQIHAMwwWV2TMPmhOtz7xFsWUJ3bchVg
u8aMABcK7ymkEMG7BqAwNTS37f+/zMQbtNwmaEnh4FI4/XBf6VKlk9PC+6Y7OxtbJTIFS7Cy0cgW
9msSw7SE04jGnDCKQOA6SjcyiLp6rir/U0wX5g8yO5gVWOFxnEAc30y9YI6yb9jiCaU3soMi2jq6
uYsDQpoZySlu3C9GBAMGf2Yz3Wq5UdkUmPZm7KEJ8p9wY81LfjpVDXzx+N3bQrOlnHL1XTDWLJTf
K+vQdlC0bBJpdDVhzRiegMidSLVcX3cXz/5Z4rsxilbRREi73Vr9SgzU4S21N6DUy3JgZHikBv0m
B8kDiHmUslOAGGkF6JPxufnDPTpwieOLnVCx/2CNw9/5Cw0lECM+FR/KYSKb5oQnT9xc2iz/ESqK
Rd0QXiKUIfYFWzmjGNKqQ4tE2LdYXEJRCPqV5GxlecPOrpZGexWUt+/D08hOggloASfduWIhsLkg
NHca8JRbgBq7ukE/HsgVFuAuvu3kopZZ+beML9ug7VDDEOiO4pl3zn8bYhbVloJX321MP8KRf7dF
vImyi0zcDigNt6CW6GaVbY/VFgO98KgnsSGwwt7MY8TZ77mYQB5Mic0lOM+ryoHrB/yCVtyIKnso
U/fomZBR7MMwuSm9oDdK47Vp2wqd9gY5d/LslIDYjQFqhCoJuskgCKS8B2cLwrHJ+DhKPaoD6r2G
n5r4NmllWZ1d7VuBwKiVR8un6P9EP4wOARZpDXAzir34NU4Oaeymzh2S3g0OrsRSaNI8QD8X1QW3
+mhEdvAToHfjhVXXtq69gvAGsRuoxVRLwoRgbFwD+Fwp3D9T4SUKuC3Mo1OOGk2Q/q72Go8t6NPu
BFIXQkktocIAIUhLJEw0/5vAJPpadE6GjEfoNl80DK7vW22VPR4GVGbTyWHYH4iHr7fIvMtzXLU=
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
