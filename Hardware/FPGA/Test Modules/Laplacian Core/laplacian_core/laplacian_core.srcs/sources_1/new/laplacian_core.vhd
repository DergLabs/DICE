----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/07/2025 01:03:15 PM
-- Design Name: 
-- Module Name: laplacian_core - Behavioral
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

entity laplacian_core is
    port (
        clk_i       : in std_logic;
        rst_i       : in std_logic;
        
        pixel_i     : in std_logic_vector(7 downto 0);
        valid_i     : in std_logic;

        laplacian_o : out std_logic_vector(10 downto 0);
        valid_o     : out std_logic
    );
end laplacian_core;

architecture Behavioral of laplacian_core is

    -- See diagram for reg naming, based off of pixel position in 3x3 pixel grid
    -- only pixel 1, 3, 4, 5, 7 are used for laplacian filter, corner pixels are mutlipled by 0 and not used
    -- 11-bit signed values are used for laplacian output
    -- shift in 8 8b pixels in serial, read out pixels in parallel
    signal temp_pixel_1          : std_logic_vector(7 downto 0) := (others => '0');
    signal temp_pixel_3          : std_logic_vector(7 downto 0) := (others => '0');
    signal temp_pixel_4          : std_logic_vector(7 downto 0) := (others => '0');
    signal temp_pixel_5          : std_logic_vector(7 downto 0) := (others => '0');

    signal pixel_1          : std_logic_vector(7 downto 0) := (others => '0');
    signal pixel_3          : std_logic_vector(7 downto 0) := (others => '0');
    signal pixel_4          : std_logic_vector(10 downto 0) := (others => '0');
    signal pixel_5          : std_logic_vector(7 downto 0) := (others => '0');
    signal pixel_7          : std_logic_vector(7 downto 0) := (others => '0');


    signal pixel_1_delay_x  : std_logic_vector(7 downto 0) := (others => '0');
    signal pixel_3_delay_x  : std_logic_vector(7 downto 0) := (others => '0');
    signal pixel_5_delay_x  : std_logic_vector(7 downto 0) := (others => '0');
    signal pixel_7_delay_x  : std_logic_vector(7 downto 0) := (others => '0');

    signal pixel_counter    : unsigned(3 downto 0);
    
    signal pixel_4_mult     : signed(10 downto 0) := (others => '0');

    signal valid_x          : std_logic;

    COMPONENT dsp_macro_simd
    PORT (
        CLK : IN STD_LOGIC;
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
    /*SRL16E_inst : SRL16E
    generic map (
        INIT => X"0000",        -- Initial contents of shift register
        IS_CLK_INVERTED => '0'  -- Optional inversion for CLK
    )
    port map (
        Q => valid_x,     -- 1-bit output: SRL Data
        CE => '1',   -- 1-bit input: Clock enable
        CLK => clk_i, -- 1-bit input: Clock
        D => valid_i,     -- 1-bit input: SRL Data
        -- Depth Selection inputs: A0-A3 select SRL depth
        A0 => '1',
        A1 => '1',
        A2 => '1',
        A3 => '1' 
    );*/

    -- Delay path for valid input to valid output
    SRLC32E_inst : SRLC32E
    generic map (
        INIT => X"00000000",    -- Initial contents of shift register
        IS_CLK_INVERTED => '0'  -- Optional inversion for CLK
    )
    port map (
        Q => valid_x,     -- 1-bit output: SRL Data
        Q31 => open, -- 1-bit output: SRL Cascade Data
        A => 5b"01110",     -- 5-bit input: Selects SRL depth
        CE => '1',   -- 1-bit input: Clock enable
        CLK => clk_i, -- 1-bit input: Clock
        D => valid_i      -- 1-bit input: SRL Data
    );

    -- Counter to updated hold registers
    process(clk_i, rst_i)
    begin
        if (rst_i = '1') then
            pixel_counter <= x"0";
        elsif rising_edge(clk_i) then
            if (pixel_counter = x"7") then 
                    pixel_counter <= x"0";
            else
                if (valid_i = '1') then
                    pixel_counter <= pixel_counter + 1;
                else
                    pixel_counter <= pixel_counter;
                end if;
            end if;
        end if;
    end process;

    -- Collect Pixels
    process(clk_i, rst_i)
    begin
        if (rst_i = '1') then
            temp_pixel_1 <= (others => '0');
            temp_pixel_3 <= (others => '0');
            temp_pixel_4 <= (others => '0');
            temp_pixel_5 <= (others => '0');
            pixel_7 <= (others => '0');
        elsif rising_edge(clk_i) then
            if (pixel_counter = x"1") then
                temp_pixel_1 <= pixel_i;
            elsif (pixel_counter = x"3") then
                temp_pixel_3 <= pixel_i;
            elsif (pixel_counter = x"4") then
                temp_pixel_4 <= pixel_i;
            elsif (pixel_counter = x"5") then
                temp_pixel_5 <= pixel_i;
            elsif (pixel_counter = x"7") then
                pixel_7 <= pixel_i;
                pixel_1 <= temp_pixel_1;
                pixel_3 <= temp_pixel_3;
                pixel_4(7 downto 0) <= temp_pixel_4;
                pixel_5 <= temp_pixel_5;
            else
                temp_pixel_1 <= temp_pixel_1;
                temp_pixel_3 <= temp_pixel_3;
                temp_pixel_4 <= temp_pixel_4;
                temp_pixel_5 <= temp_pixel_5;
                pixel_7 <= pixel_7;
            end if;
        end if;
    end process;

    
    -- shift pixel 4 value left to multiply by 4 and XOR to multiply by -1 
    process(clk_i, rst_i)
    begin
        if (rst_i = '1') then
            pixel_4_mult <= (others => '0');
        elsif rising_edge(clk_i) then
            pixel_4_mult <= -signed(pixel_4 sll 2);
        end if;
    end process;

    -- delay shift registers for pipelining
    pixel_7_shift_reg : entity work.data_delay_reg
    generic map (
        SHIFT_DEPTH => 4,
        DATA_WIDTH => pixel_7'length
    )
    port map (
        clk_i => clk_i,
        rst_i => rst_i,
        data_i => pixel_7,
        data_o => pixel_7_delay_x
    );

    pixel_5_shift_reg : entity work.data_delay_reg
    generic map (
        SHIFT_DEPTH => 4,
        DATA_WIDTH => pixel_7'length
    )
    port map (
        clk_i => clk_i,
        rst_i => rst_i,
        data_i => pixel_5,
        data_o => pixel_5_delay_x
    );

    pixel_3_shift_reg : entity work.data_delay_reg
    generic map (
        SHIFT_DEPTH => 1,
        DATA_WIDTH => pixel_7'length
    )
    port map (
        clk_i => clk_i,
        rst_i => rst_i,
        data_i => pixel_3,
        data_o => pixel_3_delay_x
    );

    pixel_1_shift_reg : entity work.data_delay_reg
    generic map (
        SHIFT_DEPTH => 1,
        DATA_WIDTH => pixel_7'length
    )
    port map (
        clk_i => clk_i,
        rst_i => rst_i,
        data_i => pixel_1,
        data_o => pixel_1_delay_x
    );

    dsp_add1_11b : dsp_macro_simd
    PORT MAP (
        CLK => clk_i,
        SCLR => rst_i,
        A => (19b"0000000000000000000" & pixel_1_delay_x),
        C => (std_logic_vector(resize(pixel_4_mult, 27))),
        D => (19b"0000000000000000000" & pixel_3_delay_x),
        P => dsp1_out_tmp_x
    );

    dsp_add2_11b : dsp_macro_simd
    PORT MAP (
        CLK => clk_i,
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
            if (valid_x = '1') then
                valid_o <= valid_x;
                laplacian_o <= dsp2_out_tmp_x(10 downto 0);
            else
                valid_o <= '0';
                laplacian_o <= laplacian_o;
            end if;
        end if;
    end process;


end Behavioral;
