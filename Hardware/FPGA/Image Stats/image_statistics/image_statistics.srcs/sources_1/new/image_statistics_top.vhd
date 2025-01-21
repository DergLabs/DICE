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
    port ( 
        clk_i       : in std_logic;
        rst_i       : in std_logic;

        pixel_i     : in std_logic_vector(23 downto 0);
        valid_i     : in std_logic;

        lapplacian_var_o : out std_logic_vector(15 downto 0);
        lapplacian_mean_o : out std_logic_vector(15 downto 0);
        lapplacian_std_dev_o : out std_logic_vector(15 downto 0);
        lapplacian_valid_o : out std_logic;

        gradient_var_o : out std_logic_vector(15 downto 0);
        gradient_mean_o : out std_logic_vector(15 downto 0);
        gradient_std_dev_o : out std_logic_vector(15 downto 0);
        gradient_valid_o : out std_logic
    );
end image_statistics_top;

architecture Behavioral of image_statistics_top is

    signal pixel_reg_x : std_logic_vector(23 downto 0);
    signal valid_x : std_logic;

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
    

    /*COMPONENT vio_0
    PORT (
        clk : IN STD_LOGIC;
        probe_in0 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
        probe_in1 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
        probe_in2 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
        probe_in3 : IN std_logic;
        probe_in4 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
        probe_in5 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
        probe_in6 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
        probe_in7 : IN std_logic;
        probe_out0 : OUT std_logic;
        probe_out1 : OUT std_logic;
        probe_out2 : OUT STD_LOGIC_VECTOR(23 DOWNTO 0) 
    );
    END COMPONENT;*/

begin

    /*test_io : vio_0
    PORT MAP (
      clk => clk_i,
      probe_in0 => lapplacian_mean_o,
      probe_in1 => lapplacian_var_o,
      probe_in2 => lapplacian_std_dev_o,
      probe_in3 => lapplacian_valid_o,
      probe_in4 => gradient_mean_o,
      probe_in5 => gradient_var_o,
      probe_in6 => gradient_std_dev_o,
      probe_in7 => gradient_valid_o,
      probe_out0 => valid_i,
      probe_out1 => rst_i,
      probe_out2 => pixel_i
    );*/

    -- register incoming pixel data
    process(clk_i, rst_i)
    begin
        if (rst_i = '1') then
            pixel_reg_x <= (others => '0');
            valid_x <= '0';
        elsif rising_edge(clk_i) then
            if (valid_i = '1') then
                valid_x <= '1';
                pixel_reg_x <= pixel_i;
            else
                pixel_reg_x <= pixel_reg_x;
                valid_x <= '0';
            end if;
        end if;
    end process;

    -- Convert pixel from RGB to grayscale
    rgb_to_gray : entity work.rgb_to_gray
        port map (
            clk_i => clk_i,
            rst_i => rst_i,
            pixel_i => pixel_reg_x,
            valid_i => valid_x,

            pixel_o => gray_pixel_o,
            valid_o => gray_valid_o
    );

    -- counter to toggle saving from pixel shift reg to pixel hold reg
    process(clk_i, rst_i)
    begin
        if (rst_i = '1') then
            pixel_counter_x <= (others => '0');
        elsif rising_edge(clk_i) then
            if (pixel_counter_x = 8) then
                pixel_block_valid_x <= '1';
                pixel_counter_x <= (others => '0');
            else
                pixel_counter_x <= pixel_counter_x + 1;
                pixel_block_valid_x <= '0';
            end if; 
        end if;
    end process;


    -- shift register to hold incoming pixel data
    process(clk_i, rst_i)
    begin
        if (rst_i = '1') then
            pixel_shift_reg_x <= (others => '0');
        elsif rising_edge(clk_i) then
            if (gray_valid_o = '1') then
                pixel_shift_reg_x <= gray_pixel_o & pixel_shift_reg_x(71 downto 8);
            else
                pixel_shift_reg_x <= pixel_shift_reg_x;
            end if;
        end if;
    end process;

    -- Non-Clocked mux to load shift reg data into hold register on when 9th pixel is recieved
    with pixel_counter_x select
    pixel_hold_reg_x <= pixel_shift_reg_x when X"0",
                         pixel_hold_reg_x when others;  

    
    -- Laplacian Core
    laplacian_core : entity work.laplacian_core
        port map (
            clk_i => clk_i,
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
            rst_i => rst_i,
            pixel_i => pixel_hold_reg_x(71 downto 0),
            valid_i => pixel_block_valid_x,
            new_pixel_i => '0',
            gradient_o => graient_x,
            valid_o => gradient_valid_x
    );

    -- Statistics Core for Laplacian
    statistics_core_laplacian : entity work.statistics_core
        generic map (
            variance_depth => 16,
            data_width => 11
        )
        port map (
            clk_i => clk_i,
            rst_i => rst_i,
            data_i => signed(lapplacian_x),
            valid_i => laplacian_valid_x,

            var_o => lapplacian_var_o,
            mean_o => lapplacian_mean_o,
            std_dev_o => lapplacian_std_dev_o,
            valid_o => lapplacian_valid_o
    );

    -- Statistics Core for Gradient
    statistics_core_gradient : entity work.statistics_core
        generic map (
            variance_depth => 16,
            data_width => 11
        )
        port map (
            clk_i => clk_i,
            rst_i => rst_i,
            data_i => signed(graient_x),
            valid_i => gradient_valid_x,

            var_o => gradient_var_o,
            mean_o => gradient_mean_o,
            std_dev_o => gradient_std_dev_o,
            valid_o => gradient_valid_o
    );
    


end Behavioral;
