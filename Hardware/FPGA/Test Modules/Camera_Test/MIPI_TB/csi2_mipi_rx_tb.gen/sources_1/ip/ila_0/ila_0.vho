-- (c) Copyright 2023 Advanced Micro Devices, Inc. All rights reserved.
--
-- This file contains confidential and proprietary information
-- of AMD and is protected under U.S. and
-- international copyright and other intellectual property
-- laws.
--
-- DISCLAIMER
-- This disclaimer is not a license and does not grant any
-- rights to the materials distributed herewith. Except as
-- otherwise provided in a valid license issued to you by
-- AMD, and to the maximum extent permitted by applicable
-- law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
-- WITH ALL FAULTS, AND HEREBY DISCLAIMS ALL WARRANTIES
-- AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
-- BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
-- INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
-- (2) AMD shall not be liable (whether in contract or tort,
-- including negligence, or under any other theory of
-- liability) for any loss or damage of any kind or nature
-- related to, arising under or in connection with these
-- materials, including for any direct, or any indirect,
-- special, incidental, or consequential loss or damage
-- (including loss of data, profits, goodwill, or any type of
-- loss or damage suffered as a result of any action brought
-- by a third party) even if such damage or loss was
-- reasonably foreseeable or AMD had been advised of the
-- possibility of the same.
--
-- CRITICAL APPLICATIONS
-- AMD products are not designed or intended to be fail-
-- safe, or for use in any application requiring fail-safe
-- performance, such as life-support or safety devices or
-- systems, Class III medical devices, nuclear facilities,
-- applications related to the deployment of airbags, or any
-- other applications that could lead to death, personal
-- injury, or severe property or environmental damage
-- (individually and collectively, "Critical
-- Applications"). Customer assumes the sole risk and
-- liability of any use of AMD products in Critical
-- Applications, subject only to applicable laws and
-- regulations governing limitations on product liability.
--
-- THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
-- PART OF THIS FILE AT ALL TIMES.
--
-- DO NOT MODIFY THIS FILE.

------------- Begin Cut here for COMPONENT Declaration ------ COMP_TAG
COMPONENT ila_0

PORT (
	clk : IN STD_LOGIC;



	probe0 : IN STD_LOGIC_VECTOR(0 DOWNTO 0); 
	probe1 : IN STD_LOGIC_VECTOR(0 DOWNTO 0); 
	probe2 : IN STD_LOGIC_VECTOR(0 DOWNTO 0); 
	probe3 : IN STD_LOGIC_VECTOR(0 DOWNTO 0); 
	probe4 : IN STD_LOGIC_VECTOR(0 DOWNTO 0); 
	probe5 : IN STD_LOGIC_VECTOR(31 DOWNTO 0); 
	probe6 : IN STD_LOGIC_VECTOR(0 DOWNTO 0); 
	probe7 : IN STD_LOGIC_VECTOR(31 DOWNTO 0); 
	probe8 : IN STD_LOGIC_VECTOR(0 DOWNTO 0); 
	probe9 : IN STD_LOGIC_VECTOR(0 DOWNTO 0); 
	probe10 : IN STD_LOGIC_VECTOR(0 DOWNTO 0); 
	probe11 : IN STD_LOGIC_VECTOR(0 DOWNTO 0); 
	probe12 : IN STD_LOGIC_VECTOR(39 DOWNTO 0); 
	probe13 : IN STD_LOGIC_VECTOR(0 DOWNTO 0); 
	probe14 : IN STD_LOGIC_VECTOR(0 DOWNTO 0); 
	probe15 : IN STD_LOGIC_VECTOR(0 DOWNTO 0); 
	probe16 : IN STD_LOGIC_VECTOR(0 DOWNTO 0); 
	probe17 : IN STD_LOGIC_VECTOR(0 DOWNTO 0); 
	probe18 : IN STD_LOGIC_VECTOR(0 DOWNTO 0); 
	probe19 : IN STD_LOGIC_VECTOR(19 DOWNTO 0); 
	probe20 : IN STD_LOGIC_VECTOR(19 DOWNTO 0); 
	probe21 : IN STD_LOGIC_VECTOR(0 DOWNTO 0); 
	probe22 : IN STD_LOGIC_VECTOR(0 DOWNTO 0); 
	probe23 : IN STD_LOGIC_VECTOR(0 DOWNTO 0); 
	probe24 : IN STD_LOGIC_VECTOR(0 DOWNTO 0); 
	probe25 : IN STD_LOGIC_VECTOR(29 DOWNTO 0); 
	probe26 : IN STD_LOGIC_VECTOR(29 DOWNTO 0); 
	probe27 : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
	probe28 : IN STD_LOGIC_VECTOR(0 DOWNTO 0)
);
END COMPONENT  ;

-- COMP_TAG_END ------ End COMPONENT Declaration ------------

-- The following code must appear in the VHDL architecture
-- body. Substitute your own instance name and net names.

------------- Begin Cut here for INSTANTIATION Template ----- INST_TAG


your_instance_name : ila_0
PORT MAP (
	clk => clk,



	probe0 => probe0, 
	probe1 => probe1, 
	probe2 => probe2, 
	probe3 => probe3, 
	probe4 => probe4, 
	probe5 => probe5, 
	probe6 => probe6, 
	probe7 => probe7, 
	probe8 => probe8, 
	probe9 => probe9, 
	probe10 => probe10, 
	probe11 => probe11, 
	probe12 => probe12, 
	probe13 => probe13, 
	probe14 => probe14, 
	probe15 => probe15, 
	probe16 => probe16, 
	probe17 => probe17, 
	probe18 => probe18, 
	probe19 => probe19, 
	probe20 => probe20, 
	probe21 => probe21, 
	probe22 => probe22, 
	probe23 => probe23, 
	probe24 => probe24, 
	probe25 => probe25, 
	probe26 => probe26, 
	probe27 => probe27,
	probe28 => probe28
);


-- INST_TAG_END ------ End INSTANTIATION Template ---------

-- You must compile the wrapper file ila_0.vhd when simulating
-- the core, ila_0. When compiling the wrapper file, be sure to
-- reference the VHDL simulation library.
