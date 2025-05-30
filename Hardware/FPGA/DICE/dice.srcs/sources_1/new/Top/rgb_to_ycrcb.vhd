----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/28/2025 07:51:35 AM
-- Design Name: 
-- Module Name: rgb_to_ycrcb - Behavioral
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

entity rgb_to_ycrcb is
    port ( 
        clk_i       : in std_logic;
        rst_i       : in std_logic;

        rgb_i       : in std_logic_vector(23 downto 0); -- RGB input
        valid_i     : in std_logic; -- Input valid signal

        ycrcb_o     : out std_logic_vector(23 downto 0); -- YCrCb output
        valid_o     : out std_logic -- Output valid signal
    );
end rgb_to_ycrcb;

architecture Behavioral of rgb_to_ycrcb is

    signal r, g, b : std_logic_vector(7 downto 0);
    signal y, cr, cb : std_logic_vector(7 downto 0);

    signal r_delayed1 : std_logic_vector(7 downto 0); -- Delayed R signal for dsp stage 1, need to wait for g multiplication
    signal r_delayed2 : std_logic_vector(7 downto 0); -- Delayed R signal for dsp stage 2, need to wait for y_int calculation
    signal b_delayed1 : std_logic_vector(7 downto 0); -- Delayed B signal for dsp stage 1, need to wait for r dsp stage 1 result
    signal b_delayed2 : std_logic_vector(7 downto 0); -- Delayed B signal for dsp stage 2, need to wait for y_int calculation
    

    signal y_internal : std_logic_vector(7 downto 0); -- Internal Y signal for intermediate calculations

    signal r_coeff : std_logic_vector(15 downto 0) := std_logic_vector(to_unsigned(19595, 16)); -- 0.299 << 16
    signal g_coeff : std_logic_vector(15 downto 0) := std_logic_vector(to_unsigned(38469, 16)); -- 0.587 << 16
    signal b_coeff : std_logic_vector(15 downto 0) := std_logic_vector(to_unsigned(7471, 16));  -- 0.114 << 16
    signal cr_coeff : std_logic_vector(15 downto 0) := std_logic_vector(to_unsigned(46727, 16)); -- 0.713 << 16
    signal cb_coeff : std_logic_vector(15 downto 0) := std_logic_vector(to_unsigned(36926, 16)); -- 0.564 << 16

    signal cr_offset, cb_offset : signed(8 downto 0) := to_signed(128, 9); -- Offset for Cr and Cb

    signal r_coeff_madd_out : std_logic_vector(24 downto 0);
    signal g_coeff_mult_out : std_logic_vector(23 downto 0);
    signal b_coeff_madd_out : std_logic_vector(25 downto 0);

    signal cr_dsp_out : std_logic_vector(26 downto 0);
    signal cr_shift_out : std_logic_vector(8 downto 0);
    signal cr_add_out : std_logic_vector(7 downto 0);

    signal cb_dsp_out : std_logic_vector(26 downto 0);
    signal cb_shift_out : std_logic_vector(8 downto 0);
    signal cb_add_out : std_logic_vector(7 downto 0);

begin

    -- register input RGB signal & split into R, G, B components
    process(clk_i, rst_i)
    begin
        if rst_i = '1' then
            r <= (others => '0');
            g <= (others => '0');
            b <= (others => '0');
        elsif rising_edge(clk_i) then
            if valid_i = '1' then
                r <= rgb_i(23 downto 16);
                g <= rgb_i(15 downto 8);
                b <= rgb_i(7 downto 0);
            end if;
        end if;
    end process;

    -- G DSP Stage 1, implement (A * B)
    dsp_g_mult : entity work.dsp_mult
    generic map (
        AWIDTH => 8,
        BWIDTH => 16,
        USE_SIGNED => false
    )
    port map (
        clk  => clk_i,
        rst  => rst_i,
        ain  => g,
        bin  => g_coeff, -- Coefficient for G
        pout => g_coeff_mult_out
    );

    -- R Delay Stage 1, to delay R signal for g multiplication
    r_delay_1 : entity work.data_delay_reg
    generic map (
        SHIFT_DEPTH => 2,
        DATA_WIDTH => 8
    )
    port map (
        clk_i => clk_i,
        ce_i => '1',
        rst_i => rst_i,
        data_i => r,
        data_o => r_delayed1
    );

    -- R DSP Stage 1, implementing (A * B) + C, 
    dsp_r_madd : entity work.dsp_madd
    generic map (
        AWIDTH => 8,  -- Width of R input
        BWIDTH => 16, -- Width of R coefficient
        CWIDTH => 24,  -- Width of dsp_g_mult output
        USE_SIGNED => false -- Use unsigned arithmetic
    )
    port map (
        clk_i  => clk_i,
        rst_i  => rst_i,
        ain  => r_delayed1,
        bin  => r_coeff, -- Coefficient for R
        cin  => g_coeff_mult_out, -- No constant input
        pout => r_coeff_madd_out
    );

    -- B delay Stage 1, to delay B signal for R stage 1 result
    b_delay_1 : entity work.data_delay_reg
    generic map (
        SHIFT_DEPTH => 5,
        DATA_WIDTH => 8
    )
    port map (
        clk_i => clk_i,
        ce_i => '1',
        rst_i => rst_i,
        data_i => b,
        data_o => b_delayed1
    );

    -- B DSP Stage 1, implementing (A * B) + C
    dsp_b_madd : entity work.dsp_madd
    generic map (
        AWIDTH => 8,  -- Width of B input
        BWIDTH => 16, -- Width of B coefficient
        CWIDTH => 25, -- Width of dsp_r_madd output
        USE_SIGNED => false -- Use unsigned arithmetic
    )
    port map (
        clk_i  => clk_i,
        rst_i  => rst_i,
        ain  => b_delayed1,
        bin  => b_coeff, -- Coefficient for B
        cin  => r_coeff_madd_out, -- Output from R stage
        pout => b_coeff_madd_out
    );

    -- Calculate Y
    y_internal <= std_logic_vector(resize(shift_right(unsigned(b_coeff_madd_out), 16), 8));


    -- R Delay Stage 2, to delay R signal for Y calculation
    r_delay_2 : entity work.data_delay_reg
    generic map (
        SHIFT_DEPTH => 8,
        DATA_WIDTH => 8
    )
    port map (
        clk_i => clk_i,
        ce_i => '1',
        rst_i => rst_i,
        data_i => r,
        data_o => r_delayed2
    );

    -- CR calculation
    -- Note: singed arithmetic is used, need to add 1 bit to input/output widths
    dsp_cr_presub_mult : entity work.dsp_presub_mult
    generic map (
        AWIDTH => 9,  -- Width of Cr input
        BWIDTH => 9, -- Width of Y subtraction input
        CWIDTH => 17   -- Width of Cr coefficient
    )
    port map (
        clk  => clk_i,
        rst  => rst_i,
        ain  => std_logic_vector(resize(unsigned(r_delayed2), 9)),
        bin  => std_logic_vector(resize(unsigned(y_internal), 9)), -- Coefficient for Cr
        cin  => std_logic_vector(resize(unsigned(cr_coeff), 17)), -- Offset for Cr
        pout => cr_dsp_out
    );

    -- right shift cr output
    cr_shift_out <= std_logic_vector(resize(shift_right(signed(cr_dsp_out), 16), 9));
    -- Add offset to Cr
    cr_add_out <= std_logic_vector(resize(unsigned(signed(cr_shift_out) + signed(cr_offset)), 8));

    -- B Delay Stage 2, to delay B signal for Y calculation
    b_delay_2 : entity work.data_delay_reg
    generic map (
        SHIFT_DEPTH => 8,
        DATA_WIDTH => 8
    )
    port map (
        clk_i => clk_i,
        ce_i => '1',
        rst_i => rst_i,
        data_i => b,
        data_o => b_delayed2
    );

    -- CB calculation
    dsp_cb_presub_mult : entity work.dsp_presub_mult
    generic map (
        AWIDTH => 9,  -- Width of Cr input
        BWIDTH => 9, -- Width of Y subtraction input
        CWIDTH => 17   -- Width of Cr coefficient
    )
    port map (
        clk  => clk_i,
        rst  => rst_i,
        ain  => std_logic_vector(resize(unsigned(b_delayed2), 9)),
        bin  => std_logic_vector(resize(unsigned(y_internal), 9)), -- Coefficient for Cb
        cin  => std_logic_vector(resize(unsigned(cb_coeff), 17)), -- Offset for Cb
        pout => cb_dsp_out
    );

    -- right shift cr output
    cb_shift_out <= std_logic_vector(resize(shift_right(signed(cb_dsp_out), 16), 9));
    -- Add offset to Cr
    cb_add_out <= std_logic_vector(resize(unsigned(signed(cb_shift_out) + signed(cb_offset)), 8));

    -- Y delay
    y_delay : entity work.data_delay_reg
    generic map (
        SHIFT_DEPTH => 4,
        DATA_WIDTH => 8
    )
    port map (
        clk_i => clk_i,
        ce_i => '1',
        rst_i => rst_i,
        data_i => y_internal,
        data_o => y
    );

    -- Register outputs and pass valid signal
    process(clk_i, rst_i)
    begin
        if rst_i = '1' then
            cr <= (others => '0');
            cb <= (others => '0');
        elsif rising_edge(clk_i) then
            cr <= cr_add_out;
            cb <= cb_add_out;
        end if;
    end process;

    -- Valid delay
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

    ycrcb_o <= cb & y & cr; -- Concatenate Y, Cr, Cb to form YCrCb output

end Behavioral;
