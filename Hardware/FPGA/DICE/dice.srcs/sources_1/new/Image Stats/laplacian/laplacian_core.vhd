----------------------------------------------------------------------------------
-- Company: Drexel University
-- Engineer: John Hofmeyr
-- 
-- Create Date: 01/12/2025 07:28:33 PM
-- Design Name: 
-- Module Name: laplacian_core - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: Implements 2D Laplacian calculation using standard laplacian kernel. Operates on a full 3x3 block of pixels each clock cycle, outputs single averaged gradient value
--              Output = (X_Gradient + Y_Gradient) / 2
--              Total Latency = 9 clock cycles
--              Laplacian Kernel:
--              |0|1|0|
--              |1|4|1|
--              |0|1|0|
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

entity laplacian_core is
    port (
        clk_i       : in std_logic;
        ce_i        : in std_logic;
        rst_i       : in std_logic;
        
        pixel_i     : in std_logic_vector(71 downto 0);
        valid_i     : in std_logic;

        laplacian_o : out std_logic_vector(10 downto 0);
        valid_o     : out std_logic
    );
end laplacian_core;

architecture Behavioral of laplacian_core is
    signal pixel_reg_x        : std_logic_vector(71 downto 0) := (others => '0');

    signal pixel_1          : std_logic_vector(7 downto 0) := (others => '0');
    signal pixel_3          : std_logic_vector(7 downto 0) := (others => '0');

    signal pixel_5_delay_x  : std_logic_vector(7 downto 0) := (others => '0');
    signal pixel_7_delay_x  : std_logic_vector(7 downto 0) := (others => '0');

    signal pixel_4_mult     : signed(10 downto 0) := (others => '0');

    signal valid_x          : std_logic;

    -- performs (A+D) + C
    COMPONENT dsp_macro_simd
    PORT (
        CLK : IN STD_LOGIC;
        CE : IN STD_LOGIC;
        SCLR : IN STD_LOGIC;
        A : IN STD_LOGIC_VECTOR(26 DOWNTO 0);
        C : IN STD_LOGIC_VECTOR(26 DOWNTO 0);
        D : IN STD_LOGIC_VECTOR(26 DOWNTO 0);
        P : OUT STD_LOGIC_VECTOR(27 DOWNTO 0) 
    );
    END COMPONENT;

    signal dsp1_out_tmp_x : std_logic_vector(27 downto 0) := (others => '0');
    signal dsp2_out_tmp_x : std_logic_vector(27 downto 0) := (others => '0');

begin

    -- Delay path for valid input to valid output
    SRLC32E_inst : SRLC32E
    generic map (
        INIT => X"00000000",    -- Initial contents of shift register
        IS_CLK_INVERTED => '0'  -- Optional inversion for CLK
    )
    port map (
        Q => valid_x,     -- 1-bit output: SRL Data
        Q31 => open, -- 1-bit output: SRL Cascade Data
        A => 5b"00111",     -- 5-bit input: Selects SRL depth
        CE => ce_i,   -- 1-bit input: Clock enable
        CLK => clk_i, -- 1-bit input: Clock
        D => valid_i      -- 1-bit input: SRL Data
    );

    -- register input data
    process(clk_i, rst_i)
    begin
        if (rst_i = '1') then
            pixel_reg_x <= (others => '0');
        elsif rising_edge(clk_i) then
            if (valid_i = '1' and ce_i = '1') then
                pixel_reg_x <= pixel_i;
            else
                pixel_reg_x <= pixel_reg_x;
            end if;
        end if;
    end process;

    -- split wide pixel bus into individual pixels
    process(clk_i, rst_i)
    begin
        if (rst_i = '1') then
            pixel_1 <= (others => '0');
            pixel_3 <= (others => '0');
        elsif rising_edge(clk_i) then
            if (ce_i = '1') then
                pixel_1 <= pixel_reg_x(15 downto 8);
                pixel_3 <= pixel_reg_x(31 downto 24);
            else
                pixel_1 <= pixel_1;
                pixel_3 <= pixel_3;
            end if;
        end if;
    end process;
    
    -- shift pixel 4 value left to multiply by 4 and XOR to multiply by -1 
    process(clk_i, rst_i)
    begin
        if (rst_i = '1') then
            pixel_4_mult <= (others => '0');
        elsif rising_edge(clk_i) then
            if (ce_i = '1') then
                pixel_4_mult <= -signed((resize(unsigned(pixel_reg_x(39 downto 32)), 11)) sll 2);
            else
                pixel_4_mult <= pixel_4_mult;
            end if;
        end if;
    end process;

    -- delay shift registers for pipelining
    pixel_7_shift_reg : entity work.data_delay_reg
    generic map (
        SHIFT_DEPTH => 4,
        DATA_WIDTH => 8
    )
    port map (
        clk_i => clk_i,
        ce_i => ce_i,
        rst_i => rst_i,
        data_i => pixel_reg_x(63 downto 56),
        data_o => pixel_7_delay_x
    );

    pixel_5_shift_reg : entity work.data_delay_reg
    generic map (
        SHIFT_DEPTH => 4,
        DATA_WIDTH => 8
    )
    port map (
        clk_i => clk_i,
        ce_i => ce_i,
        rst_i => rst_i,
        data_i => pixel_reg_x(47 downto 40),
        data_o => pixel_5_delay_x
    );

    dsp_add1_11b : dsp_macro_simd
    PORT MAP (
        CLK => clk_i,
        CE => ce_i,
        SCLR => rst_i,
        A => (19b"0000000000000000000" & pixel_1),
        C => (std_logic_vector(resize(pixel_4_mult, 27))),
        D => (19b"0000000000000000000" & pixel_3),
        P => dsp1_out_tmp_x
    );

    dsp_add2_11b : dsp_macro_simd
    PORT MAP (
        CLK => clk_i,
        CE => ce_i,
        SCLR => rst_i,
        A => (19b"0000000000000000000" & pixel_7_delay_x),
        C => (std_logic_vector(resize(signed(dsp1_out_tmp_x), 27))),
        D => (19b"0000000000000000000" & pixel_5_delay_x),
        P => dsp2_out_tmp_x
    );

    -- Register output
    process(clk_i, rst_i)
    begin
        if (rst_i = '1') then
            laplacian_o <= (others => '0');
        elsif rising_edge(clk_i) then
            if (valid_x = '1' and ce_i = '1') then
                valid_o <= '1';
                laplacian_o <= dsp2_out_tmp_x(10 downto 0);
            else
                valid_o <= '0';
                laplacian_o <= laplacian_o;
            end if;
        end if;
    end process;


end Behavioral;
