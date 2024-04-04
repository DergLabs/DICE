-- (c) Copyright 1995-2024 Xilinx, Inc. All rights reserved.
-- 
-- This file contains confidential and proprietary information
-- of Xilinx, Inc. and is protected under U.S. and
-- international copyright and other intellectual property
-- laws.
-- 
-- DISCLAIMER
-- This disclaimer is not a license and does not grant any
-- rights to the materials distributed herewith. Except as
-- otherwise provided in a valid license issued to you by
-- Xilinx, and to the maximum extent permitted by applicable
-- law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
-- WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
-- AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
-- BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
-- INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
-- (2) Xilinx shall not be liable (whether in contract or tort,
-- including negligence, or under any other theory of
-- liability) for any loss or damage of any kind or nature
-- related to, arising under or in connection with these
-- materials, including for any direct, or any indirect,
-- special, incidental, or consequential loss or damage
-- (including loss of data, profits, goodwill, or any type of
-- loss or damage suffered as a result of any action brought
-- by a third party) even if such damage or loss was
-- reasonably foreseeable or Xilinx had been advised of the
-- possibility of the same.
-- 
-- CRITICAL APPLICATIONS
-- Xilinx products are not designed or intended to be fail-
-- safe, or for use in any application requiring fail-safe
-- performance, such as life-support or safety devices or
-- systems, Class III medical devices, nuclear facilities,
-- applications related to the deployment of airbags, or any
-- other applications that could lead to death, personal
-- injury, or severe property or environmental damage
-- (individually and collectively, "Critical
-- Applications"). Customer assumes the sole risk and
-- liability of any use of Xilinx products in Critical
-- Applications, subject only to applicable laws and
-- regulations governing limitations on product liability.
-- 
-- THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
-- PART OF THIS FILE AT ALL TIMES.
-- 
-- DO NOT MODIFY THIS FILE.
-- IP VLNV: xilinx.com:ip:vio:3.0
-- IP Revision: 22
-- The following code must appear in the VHDL architecture header.

------------- Begin Cut here for COMPONENT Declaration ------ COMP_TAG
COMPONENT vio_twm_ddrx
  PORT (
    clk : IN STD_LOGIC;
    probe_in0 : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    probe_in1 : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
    probe_in2 : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
    probe_in3 : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
    probe_in4 : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    probe_in5 : IN STD_LOGIC_VECTOR(164 DOWNTO 0);
    probe_in6 : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
    probe_in7 : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    probe_in8 : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
    probe_in9 : IN STD_LOGIC_VECTOR(8 DOWNTO 0);
    probe_in10 : IN STD_LOGIC_VECTOR(8 DOWNTO 0);
    probe_in11 : IN STD_LOGIC_VECTOR(8 DOWNTO 0);
    probe_in12 : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    probe_in13 : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    probe_in14 : IN STD_LOGIC_VECTOR(47 DOWNTO 0);
    probe_in15 : IN STD_LOGIC_VECTOR(47 DOWNTO 0);
    probe_out0 : OUT STD_LOGIC_VECTOR(8 DOWNTO 0);
    probe_out1 : OUT STD_LOGIC_VECTOR(4 DOWNTO 0);
    probe_out2 : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    probe_out3 : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    probe_out4 : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    probe_out5 : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    probe_out6 : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    probe_out7 : OUT STD_LOGIC_VECTOR(9 DOWNTO 0);
    probe_out8 : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    probe_out9 : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    probe_out10 : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    probe_out11 : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    probe_out12 : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    probe_out13 : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    probe_out14 : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    probe_out15 : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    probe_out16 : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    probe_out17 : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    probe_out18 : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    probe_out19 : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    probe_out20 : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    probe_out21 : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    probe_out22 : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    probe_out23 : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    probe_out24 : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    probe_out25 : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    probe_out26 : OUT STD_LOGIC_VECTOR(1 DOWNTO 0) 
  );
END COMPONENT;
-- COMP_TAG_END ------ End COMPONENT Declaration ------------

-- The following code must appear in the VHDL architecture
-- body. Substitute your own instance name and net names.

------------- Begin Cut here for INSTANTIATION Template ----- INST_TAG
your_instance_name : vio_twm_ddrx
  PORT MAP (
    clk => clk,
    probe_in0 => probe_in0,
    probe_in1 => probe_in1,
    probe_in2 => probe_in2,
    probe_in3 => probe_in3,
    probe_in4 => probe_in4,
    probe_in5 => probe_in5,
    probe_in6 => probe_in6,
    probe_in7 => probe_in7,
    probe_in8 => probe_in8,
    probe_in9 => probe_in9,
    probe_in10 => probe_in10,
    probe_in11 => probe_in11,
    probe_in12 => probe_in12,
    probe_in13 => probe_in13,
    probe_in14 => probe_in14,
    probe_in15 => probe_in15,
    probe_out0 => probe_out0,
    probe_out1 => probe_out1,
    probe_out2 => probe_out2,
    probe_out3 => probe_out3,
    probe_out4 => probe_out4,
    probe_out5 => probe_out5,
    probe_out6 => probe_out6,
    probe_out7 => probe_out7,
    probe_out8 => probe_out8,
    probe_out9 => probe_out9,
    probe_out10 => probe_out10,
    probe_out11 => probe_out11,
    probe_out12 => probe_out12,
    probe_out13 => probe_out13,
    probe_out14 => probe_out14,
    probe_out15 => probe_out15,
    probe_out16 => probe_out16,
    probe_out17 => probe_out17,
    probe_out18 => probe_out18,
    probe_out19 => probe_out19,
    probe_out20 => probe_out20,
    probe_out21 => probe_out21,
    probe_out22 => probe_out22,
    probe_out23 => probe_out23,
    probe_out24 => probe_out24,
    probe_out25 => probe_out25,
    probe_out26 => probe_out26
  );
-- INST_TAG_END ------ End INSTANTIATION Template ---------

-- You must compile the wrapper file vio_twm_ddrx.vhd when simulating
-- the core, vio_twm_ddrx. When compiling the wrapper file, be sure to
-- reference the VHDL simulation library.



