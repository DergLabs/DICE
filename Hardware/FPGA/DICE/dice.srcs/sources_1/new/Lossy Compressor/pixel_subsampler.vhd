----------------------------------------------------------------------------------
-- Company: Drexel University
-- Engineer: John Hofmeyr
-- 
-- Create Date: 01/21/2025 11:23:03 AM
-- Design Name: 
-- Module Name: pixel_subsampler - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: Implements very basic 4:2:2 pixel subsampling for chroma subsample. Takes in 2 pixels in 2 cycles, outputs 1 pixel for 2 cycles. Implements (px1 + px2) / 2
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
-- implements 4:2:2 subsampling
entity pixel_subsampler is
    generic (
        WIDTH : integer := 8
    );
    port ( 
        clk_i       : in std_logic;
        rst_i       : in std_logic;

        data_i      : in std_logic_vector(WIDTH-1 downto 0);
        valid_i     : in std_logic;

        data_o        : out std_logic_vector(WIDTH-1 downto 0);
        valid_o     : out std_logic
    );
end pixel_subsampler;

architecture Behavioral of pixel_subsampler is
    signal update_pixel : std_logic;

    signal pixel_reg_0 : unsigned(WIDTH-1 downto 0);
    signal pixel_reg_1 : unsigned(WIDTH-1 downto 0);

    signal pixel_adder_out : unsigned(WIDTH downto 0);
    signal pixel_shifted_out : unsigned(WIDTH-1 downto 0);
    
    signal valid_x : std_logic;
    signal valid_delayed : std_logic;

begin

    -- register valid signal, used to delay pixel select by 1 cycle
    valid_x <= valid_i when rising_edge(clk_i);

    -- Create pixel update signal, toggles every 2 cycles
    process(clk_i, rst_i)
    begin
        if rst_i = '1' then
            update_pixel <= '0';
        elsif rising_edge(clk_i) then
            if valid_x = '1' then
                update_pixel <= not update_pixel;
            end if;
        end if;
    end process;

    -- delay valid signal by 2 cycles
    valid_delay_reg : entity work.data_delay_reg
    generic map (
        SHIFT_DEPTH => 2,
        DATA_WIDTH => 1
    )
    port map (
        clk_i => clk_i,
        ce_i => '1',
        rst_i => rst_i,
        data_i(0) => valid_i,
        data_o(0) => valid_delayed
    );

    -- register chain for incoming data
    process(clk_i, rst_i)
    begin
        if rst_i = '1' then
            pixel_reg_0 <= (others => '0');
            pixel_reg_1 <= (others => '0');
        elsif rising_edge(clk_i) then
            if valid_i = '1' then
                pixel_reg_0 <= unsigned(data_i);
                pixel_reg_1 <= pixel_reg_0;
            else
                pixel_reg_0 <= (others => '0');
                pixel_reg_1 <= (others => '0');
            end if;
        end if;
    end process;
    
    -- pixel adder
    pixel_adder_out <= resize(pixel_reg_0, WIDTH+1) + resize(pixel_reg_1, WIDTH+1);

    -- pixel shift
    pixel_shifted_out <= resize(shift_right(pixel_adder_out, 1), WIDTH);

    -- pixel hold register
    process(clk_i, rst_i)
    begin
        if rst_i = '1' then
            data_o <= (others => '0');
            valid_o <= '0';
        elsif rising_edge(clk_i) then
            if update_pixel = '1' and valid_delayed = '1' then
                data_o <= std_logic_vector(pixel_shifted_out); -- every 2 cycles output the shifted pixel value
            end if;

            valid_o <= valid_delayed;
        end if;
    end process;

end Behavioral;
