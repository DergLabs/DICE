----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/21/2025 11:19:48 AM
-- Design Name: 
-- Module Name: simd_4x12b_dsp - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
library UNISIM;
use UNISIM.VComponents.all;
-- Implements either A+B or A-B. Operation is applied to 4 12-bit signed inputs
entity simd_4x12b_dsp is
    generic (
        W : integer := 12;
        OP : string := "ADD"
    );
    port ( 
        clk_i : in std_logic;
        rst_i : in std_logic;
        ce_i  : in std_logic;
        a0,b0 : in std_logic_vector(W-1 downto 0);
        a1,b1 : in std_logic_vector(W-1 downto 0);
        a2,b2 : in std_logic_vector(W-1 downto 0);
        a3,b3 : in std_logic_vector(W-1 downto 0);
        out0  : out std_logic_vector(W-1 downto 0);
        out1  : out std_logic_vector(W-1 downto 0);
        out2  : out std_logic_vector(W-1 downto 0);
        out3  : out std_logic_vector(W-1 downto 0)
    );
end simd_4x12b_dsp;

architecture Behavioral of simd_4x12b_dsp is
    attribute use_dsp : string;
    attribute use_dsp of Behavioral : architecture is "simd";
    
    signal a0_r,b0_r : std_logic_vector(W-1 downto 0); 
    signal a1_r,b1_r : std_logic_vector(W-1 downto 0); 
    signal a2_r,b2_r : std_logic_vector(W-1 downto 0); 
    signal a3_r,b3_r : std_logic_vector(W-1 downto 0); 

begin

    
    simd_add : if OP = "ADD" generate
        process(clk_i, rst_i)
        begin
        if(rising_edge(clk_i)) then
            if(rst_i = '1') then
                a0_r <= (others => '0');
                b0_r <= (others => '0');
                a1_r <= (others => '0');
                b1_r <= (others => '0');
                a2_r <= (others => '0');
                b2_r <= (others => '0');
                a3_r <= (others => '0');
                b3_r <= (others => '0');
                out0 <= (others => '0');
                out1 <= (others => '0');
                out2 <= (others => '0');
                out3 <= (others => '0');
            end if;

            if (ce_i = '1') then
                a0_r <= a0;
                b0_r <= b0;
                a1_r <= a1;
                b1_r <= b1;
                a2_r <= a2;
                b2_r <= b2;
                a3_r <= a3;
                b3_r <= b3;
                out0 <= std_logic_vector(signed(a0_r) + signed(b0_r));
                out1 <= std_logic_vector(signed(a1_r) + signed(b1_r));
                out2 <= std_logic_vector(signed(a2_r) + signed(b2_r));
                out3 <= std_logic_vector(signed(a3_r) + signed(b3_r));
            end if;
        end if;
        end process;
    end generate;

    simd_sub : if OP = "SUB" generate
        process(clk_i, rst_i)
        begin
        if(rising_edge(clk_i)) then
            if(rst_i = '1') then
                a0_r <= (others => '0');
                b0_r <= (others => '0');
                a1_r <= (others => '0');
                b1_r <= (others => '0');
                a2_r <= (others => '0');
                b2_r <= (others => '0');
                a3_r <= (others => '0');
                b3_r <= (others => '0');
                out0 <= (others => '0');
                out1 <= (others => '0');
                out2 <= (others => '0');
                out3 <= (others => '0');
            end if;

            if (ce_i = '1') then
                a0_r <= a0;
                b0_r <= b0;
                a1_r <= a1;
                b1_r <= b1;
                a2_r <= a2;
                b2_r <= b2;
                a3_r <= a3;
                b3_r <= b3;
                out0 <= std_logic_vector(signed(a0_r) - signed(b0_r));
                out1 <= std_logic_vector(signed(a1_r) - signed(b1_r));
                out2 <= std_logic_vector(signed(a2_r) - signed(b2_r));
                out3 <= std_logic_vector(signed(a3_r) - signed(b3_r));
            end if;
        end if;
        end process;
    end generate;
    

end Behavioral;

