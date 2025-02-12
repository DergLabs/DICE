----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/10/2025 10:33:01 PM
-- Design Name: 
-- Module Name: rgb2ycrcb - Behavioral
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
use IEEE.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity rgb2ycrcb is
    port ( 
        clk_i       : in std_logic;
        rst_i       : in std_logic;

        pixel_i     : in std_logic_vector(23 downto 0);
        valid_i     : in std_logic;

        ycrcb_o     : out std_logic_vector(23 downto 0);
        valid_o     : out std_logic
    );
end rgb2ycrcb;

architecture Behavioral of rgb2ycrcb is

    constant Y_COEFF_R     : unsigned(15 downto 0) := 16d"19595";
    constant Y_COEFF_G     : unsigned(15 downto 0) := 16d"38470";
    constant Y_COEFF_B     : unsigned(15 downto 0) := 16d"7471";
    constant CR_COEFF_R    : unsigned(15 downto 0) := 16d"46727";
    constant CR_COEFF_G    : unsigned(15 downto 0) := 16d"36962";

    signal pixel_r         : std_logic_vector(7 downto 0);
    signal pixel_g         : std_logic_vector(7 downto 0);
    signal pixel_b         : std_logic_vector(7 downto 0);

    signal pixel_delayed   : std_logic_vector(23 downto 0);

    signal y_mult_r_out    : std_logic_vector(23 downto 0);
    signal y_mult_g_out    : std_logic_vector(23 downto 0);
    signal y_mult_b_out    : std_logic_vector(23 downto 0);
    signal y_add_out       : std_logic_vector(24 downto 0);
    signal y_temp          : std_logic_vector(7 downto 0);
    signal y_delayed       : std_logic_vector(7 downto 0);

    signal cr_mult_out     : std_logic_vector(26 downto 0);
    signal cb_mult_out     : std_logic_vector(26 downto 0);

    signal cr_temp         : std_logic_vector(7 downto 0);
    signal cb_temp         : std_logic_vector(7 downto 0);

    signal y_o             : std_logic_vector(7 downto 0);
    signal cr_o            : std_logic_vector(7 downto 0);
    signal cb_o            : std_logic_vector(7 downto 0);


begin

    -- Register incoming data
    process(clk_i, rst_i)
    begin
        if rst_i = '1' then
            pixel_r <= (others => '0');
            pixel_g <= (others => '0');
            pixel_b <= (others => '0');
        elsif rising_edge(clk_i) then
            if (valid_i = '1') then
                pixel_r <= pixel_i(23 downto 16);
                pixel_g <= pixel_i(15 downto 8);
                pixel_b <= pixel_i(7 downto 0);
            else
                pixel_r <= pixel_r;
                pixel_g <= pixel_g;
                pixel_b <= pixel_b;
            end if;
        end if;
    end process;

    -- Delay pixels for cr and cb calculation
    pixel_delay : entity work.data_delay_reg
    generic map (
        SHIFT_DEPTH => 8,
        DATA_WIDTH => 24
    )
    port map (
        clk_i => clk_i,
        ce_i => '1',
        rst_i => rst_i,
        data_i => pixel_i,
        data_o => pixel_delayed
    );

    -- Delay valid signal
    valid_delay : entity work.data_delay_reg
    generic map (
        SHIFT_DEPTH => 13,
        DATA_WIDTH => 1
    )
    port map (
        clk_i => clk_i,
        ce_i => '1',
        rst_i => rst_i,
        data_i(0) => valid_i,
        data_o(0) => valid_o
    );

    -- Calculate Y = (19595*R + 38470*G + 7471*B) >> 16
    y_mult_r : entity work.dsp_mult
    generic map (
        AWIDTH => 8,
        BWIDTH => 16
    )
    port map (
        clk  => clk_i,
        rst  => rst_i,
        ain  => pixel_r,
        bin  => std_logic_vector(Y_COEFF_R),
        pout => y_mult_r_out
    );

    y_mult_g : entity work.dsp_mult
    generic map (
        AWIDTH => 8,
        BWIDTH => 16
    )
    port map (
        clk  => clk_i,
        rst  => rst_i,
        ain  => pixel_g,
        bin  => std_logic_vector(Y_COEFF_G),
        pout => y_mult_g_out
    );

    y_mult_b : entity work.dsp_mult
    generic map (
        AWIDTH => 8,
        BWIDTH => 16
    )
    port map (
        clk  => clk_i,
        rst  => rst_i,
        ain  => pixel_b,
        bin  => std_logic_vector(Y_COEFF_B),
        pout => y_mult_b_out
    );


    y_add : entity work.dsp_cascade_add
    generic map (
        AWIDTH => 24,
        BWIDTH => 24,
        CWIDTH => 24
    )
    port map (
        clk  => clk_i,
        rst  => rst_i,
        ain  => y_mult_r_out,
        bin  => y_mult_g_out,
        cin  => y_mult_b_out,
        pout => y_add_out 
    );

    y_temp <= std_logic_vector(resize(shift_right(unsigned(y_add_out), 16), 8));

    -- Delay Y out to align with Cr adn Cb
    y_delay : entity work.data_delay_reg
    generic map (
        SHIFT_DEPTH => 4,
        DATA_WIDTH => 8
    )
    port map (
        clk_i => clk_i,
        ce_i => '1',
        rst_i => rst_i,
        data_i => y_temp,
        data_o => y_delayed
    );

    -- Calculate Cr = ((R-Y) * 46727) >> 16
    cr_dsp : entity work.dsp_presub_mult
    generic map (
        AWIDTH => 9, -- 8 bits + 1 sign bit
        BWIDTH => 9,
        CWIDTH => 17
    )
    port map (
        clk  => clk_i,
        rst  => rst_i,
        ain  => '0' & pixel_delayed(23 downto 16),
        bin  => '0' & y_temp,
        cin  => '0' & std_logic_vector(CR_COEFF_R),
        pout => cr_mult_out -- take upper 16 bits, equivelant to right shift by 16
    );

    -- Calculate Cb = ((B-Y) * 36962) >> 16
    cb_dsp : entity work.dsp_presub_mult
    generic map (
        AWIDTH => 9,
        BWIDTH => 9,
        CWIDTH => 17
    )
    port map (
        clk  => clk_i,
        rst  => rst_i,
        ain  => '0' & pixel_delayed(7 downto 0),
        bin  => '0' & y_temp,
        cin  => '0' & std_logic_vector(CR_COEFF_G),
        pout => cb_mult_out -- take upper 16 bits, equivelant to right shift by 16
    );

    cr_temp <= std_logic_vector(resize(shift_right(unsigned(cr_mult_out), 16), 8));
    cb_temp <= std_logic_vector(resize(shift_right(unsigned(cb_mult_out), 16), 8));

    -- Final output stage
    process(clk_i, rst_i)
    begin
        if rst_i = '1' then
            y_o <= (others => '0');
            cr_o <= (others => '0');
            cb_o <= (others => '0');
        elsif rising_edge(clk_i) then
            y_o <= y_delayed;
            cr_o <= std_logic_vector(unsigned(cr_temp) + 128);
            cb_o <= std_logic_vector(unsigned(cb_temp) + 128);
        end if;
    end process;

    ycrcb_o <= y_o & cr_o & cb_o;

end Behavioral;
