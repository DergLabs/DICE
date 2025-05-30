----------------------------------------------------------------------------------
-- Company: Drexel University
-- Engineer: John Hofmeyr
-- 
-- Create Date: 05/29/2025 11:38:24 PM
-- Design Name: 
-- Module Name: tile_selection_logic - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: Logic for selecting tile based on gradient and laplacian values
-- Also includes logic for extracting threshold values from input data
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
--library UNISIM;
--use UNISIM.VComponents.all;

entity tile_selection_logic is
    port ( 
        clk_i                   : in std_logic;
        rst_i                   : in std_logic;

        gradient_var_i          : in std_logic_vector(15 downto 0);
        gradient_mean_i         : in std_logic_vector(15 downto 0);
        gradient_std_dev_i      : in std_logic_vector(15 downto 0);
        gradient_valid_i        : in std_logic;

        laplacian_var_i         : in std_logic_vector(15 downto 0);
        laplacian_mean_i        : in std_logic_vector(15 downto 0);
        laplacian_std_dev_i     : in std_logic_vector(15 downto 0);
        laplacian_valid_i       : in std_logic;

        fifo_data_i             : in std_logic_vector(31 downto 0);
        fifo_valid_i            : in std_logic;
        clear_threshold_i       : in std_logic;

        lossy_tile_data_i       : in std_logic_vector(15 downto 0);
        lossless_tile_data_i    : in std_logic_vector(15 downto 0);

        tile_data_o             : out std_logic_vector(15 downto 0);
        tile_select             : out std_logic;

        gradient_threshold_o    : out std_logic_vector(15 downto 0);
        laplacian_threshold_o   : out std_logic_vector(15 downto 0)

    );

end tile_selection_logic;

architecture Behavioral of tile_selection_logic is

    signal transfer_count           : unsigned(2 downto 0); -- Count number of transfers
    signal gradient_lsb             : std_logic_vector(7 downto 0);
    signal laplacian_lsb            : std_logic_vector(7 downto 0);
    signal gradient_msb             : std_logic_vector(7 downto 0);
    signal laplacian_msb            : std_logic_vector(7 downto 0); 

    signal gradient_threshold       : std_logic_vector(15 downto 0) := X"0000"; -- Default threshold for gradient
    signal laplacian_threshold      : std_logic_vector(15 downto 0) := X"0000"; -- Default threshold for laplacian

    signal pixel_select             : std_logic := '0'; -- Default to lossless block
    
begin

        -- Extract Gradient and laplacian thresholds from first 4 transfers from Fifo
    process(clk_i, rst_i)
    begin
        if rst_i = '1' then
            gradient_threshold <= (others => '0'); 
            laplacian_threshold <= (others => '0');
            transfer_count <= (others => '0');
            gradient_lsb <= (others => '0');
            gradient_msb <= (others => '0');
            laplacian_lsb <= (others => '0');
            laplacian_msb <= (others => '0');
        elsif rising_edge(clk_i) then
            if fifo_valid_i = '1' then
                if transfer_count = "100" then
                    gradient_threshold <= gradient_lsb & gradient_msb;
                    laplacian_threshold <= laplacian_lsb & laplacian_msb;
                else
                    case transfer_count is
                        when "000" =>
                            gradient_lsb <= fifo_data_i(15 downto 8);
                        when "001" =>
                            gradient_msb <= fifo_data_i(15 downto 8);
                        when "010" =>
                            laplacian_lsb <= fifo_data_i(15 downto 8);
                        when "011" =>
                            laplacian_msb <= fifo_data_i(15 downto 8);
                        when others =>
                            gradient_lsb <= (others => '0'); -- Default case, should not happen
                            gradient_msb <= (others => '0');
                            laplacian_lsb <= (others => '0');
                            laplacian_msb <= (others => '0');
                    end case;

                    transfer_count <= transfer_count + 1;

                end if;
            end if;

            if clear_threshold_i = '1' then
                -- Reset transfer count when new data is received from FT600
                transfer_count <= (others => '0');
            end if;


        end if;
    end process;


    -- Simple decision Logic for image stats
    process(clk_i, rst_i)
    begin
        if rst_i = '1' then
            pixel_select <= '0';
        elsif rising_edge(clk_i) then
            if (unsigned(gradient_var_i) < unsigned(gradient_threshold)) and (unsigned(laplacian_var_i) < unsigned(laplacian_threshold)) then
                pixel_select <= '0'; -- Choose lossy block, both thresholds are met
            else
                pixel_select <= '1'; -- Choose lossless block, no thresholds are met
            end if;
        end if;
    end process;

    -- When selecting output_memory_data, final 2049th word will be 0xFFFF (Lossy)
    -- When selecting hold_memory_data, final 2049th word will be 0x0000 (Lossless)

    with pixel_select select
        tile_data_o <= lossy_tile_data_i when '0',
                        lossless_tile_data_i when others;

    tile_select <= pixel_select; -- Output tile selection signal
    gradient_threshold_o <= gradient_threshold; -- Output gradient threshold
    laplacian_threshold_o <= laplacian_threshold; -- Output laplacian threshold


end Behavioral;
