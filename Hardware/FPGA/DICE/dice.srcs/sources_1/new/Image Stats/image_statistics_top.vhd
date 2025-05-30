----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/13/2025 09:00:54 PM
-- Design Name: 
-- Module Name: image_statistics_top - Behavioral
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

entity image_statistics_top is
    generic (
        NUM_SAMPLES : integer := 8
    );
    port ( 
        clk_i       : in std_logic;
        ce_i        : in std_logic;
        rst_i       : in std_logic;

        pixel_i     : in std_logic_vector(7 downto 0);
        valid_i     : in std_logic;

        laplacian_var_o : out std_logic_vector(15 downto 0); -- Variance, unsigned 16b integer
        laplacian_mean_o : out std_logic_vector(15 downto 0); -- mean, signed 16b integer
        laplacian_std_dev_o : out std_logic_vector(15 downto 0); -- std. deviation, unsigned 16b integer
        laplacian_valid_o : out std_logic;

        gradient_var_o : out std_logic_vector(15 downto 0); -- Variance, unsigned 16b integer
        gradient_mean_o : out std_logic_vector(15 downto 0); -- mean, signed 16b integer
        gradient_std_dev_o : out std_logic_vector(15 downto 0); -- std. deviation, unsigned 16b integer
        gradient_valid_o : out std_logic
    );
end image_statistics_top;

architecture Behavioral of image_statistics_top is

    signal pixel_reg_x : std_logic_vector(7 downto 0);
    signal valid_x : std_logic;

    signal valid2_x : std_logic;

    signal gray_pixel_o : std_logic_vector(7 downto 0);
    signal gray_valid_o : std_logic;
    
    signal pixel_shift_reg_x : std_logic_vector(71 downto 0);
    signal pixel_hold_reg_x : std_logic_vector(71 downto 0);
    signal pixel_block_valid_x : std_logic;

    signal pixel_counter_x : unsigned(3 downto 0) := (others => '0');


    signal lapplacian_x : std_logic_vector(10 downto 0);
    signal laplacian_valid_x : std_logic;

    signal graient_x : std_logic_vector(10 downto 0);
    signal gradient_valid_x : std_logic;
    
    signal statistics_core_ce_x : std_logic;

begin

    -- register incoming pixel data
    process(clk_i, rst_i)
    begin
        if (rst_i = '1') then
            pixel_reg_x <= (others => '0');
            valid_x <= '0';
        elsif rising_edge(clk_i) then
            if (valid_i = '1' and ce_i = '1') then
                valid_x <= '1';
                pixel_reg_x <= pixel_i;
            else
                pixel_reg_x <= pixel_reg_x;
                valid_x <= '0';
            end if;
        end if;
    end process;


    -- Shift register for pixel data, serial input stream becomes parallel output of 9 pixels (3x3 grid)
    input_sipo : entity work.sipo_reg
    generic map(
        IN_WIDTH => 8,
        DEPTH => 9,
        OUT_TAPS => 9,
        TAP_END => 0
    )
    port map (
        clk_i => clk_i,
        rst_i => rst_i,

        data_i => pixel_reg_x,
        valid_i => valid_x,

        data_o => pixel_hold_reg_x,
        valid_o => pixel_block_valid_x
    );

    
    -- Laplacian Core
    laplacian_core : entity work.laplacian_core
        port map (
            clk_i => clk_i,
            ce_i => ce_i,
            rst_i => rst_i,
            pixel_i => pixel_hold_reg_x(71 downto 0),
            valid_i => pixel_block_valid_x,
            laplacian_o => lapplacian_x,
            valid_o => laplacian_valid_x
    );

    -- Gradient Core
    gradient_core : entity work.gradient_calc
        port map (
            clk_i => clk_i,
            ce_i => ce_i,
            rst_i => rst_i,
            pixel_i => pixel_hold_reg_x(71 downto 0),
            valid_i => pixel_block_valid_x,
            new_pixel_i => '0',
            gradient_o => graient_x,
            valid_o => gradient_valid_x
    );

    -- Register valid signal again to align ce with data
    /*process(clk_i, rst_i)
    begin
        if rst_i = '1' then
            valid2_x <= '0';
        elsif rising_edge(clk_i) then
            valid2_x <= valid_x;
        end if;
    end process;

    -- Counter to generate statistics core clock enable
    process(clk_i, rst_i)
        variable clk_div : integer := 9;
        variable counter : integer := 0;
    begin
        if (rst_i = '1') then
            counter := 0;
            statistics_core_ce_x <= '0';
        elsif rising_edge(clk_i) then
            if (valid2_x = '1') then
                if (counter = clk_div - 1) then
                    counter := 0;
                else
                    counter := counter + 1;
                end if;

                if (counter = clk_div - 1) then
                    statistics_core_ce_x <= '1';
                else
                    statistics_core_ce_x <= '0';
                end if;
            else
                statistics_core_ce_x <= '0';
                counter := 0;
            end if;
        end if;
    end process;*/

    -- Statistics Core for Laplacian
    statistics_core_laplacian : entity work.statistics_core
        generic map (
            G_VARIANCE_DEPTH => NUM_SAMPLES,
            G_DATA_WIDTH => 11
        )
        port map (
            clk_i => clk_i,
            ce_i => '1',
            rst_i => rst_i,

            data_i => signed(lapplacian_x),
            valid_i => laplacian_valid_x,

            var_o => laplacian_var_o,
            mean_o => laplacian_mean_o,
            std_dev_o => laplacian_std_dev_o,
            valid_o => laplacian_valid_o
    );

    -- Statistics Core for Gradient
    statistics_core_gradient : entity work.statistics_core
        generic map (
            G_VARIANCE_DEPTH => NUM_SAMPLES,
            G_DATA_WIDTH => 11
        )
        port map (
            clk_i => clk_i,
            ce_i => '1',
            rst_i => rst_i,
            
            data_i => signed(graient_x),
            valid_i => gradient_valid_x,

            var_o => gradient_var_o,
            mean_o => gradient_mean_o,
            std_dev_o => gradient_std_dev_o,
            valid_o => gradient_valid_o
    );
    


end Behavioral;
