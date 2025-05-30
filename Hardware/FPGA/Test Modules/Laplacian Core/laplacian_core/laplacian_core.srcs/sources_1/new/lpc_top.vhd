library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
library UNISIM;
use UNISIM.VComponents.all;

entity lpc_top is
    port(
        clk_i : in std_logic;
        rst_i : in std_logic;
        
        pixel_i : in std_logic_vector(23 downto 0);
        valid_i : in std_logic;

        blur_o : out std_logic_vector(15 downto 0);
        valid_o : out std_logic
    );
end lpc_top;

architecture Behavioral of lpc_top is

    signal gray_pixel_x         : std_logic_vector(7 downto 0) := (others => '0');
    signal gray_pixel_valid_x   : std_logic := '0';

    signal laplacian_val_x      : std_logic_vector(10 downto 0) := (others => '0');
    signal laplacian_valid_x    : std_logic := '0';

begin

    rgb2gray : entity work.rgb_to_gray
        port map (
            clk_i => clk_i,
            rst_i => rst_i,
            
            pixel_i => pixel_i,
            valid_i => valid_i,

            pixel_o => gray_pixel_x,
            valid_o => gray_pixel_valid_x
        );

    
    laplacian : entity work.laplacian_core
        port map (
            clk_i => clk_i,
            rst_i => rst_i,
            pixel_i => gray_pixel_x,
            valid_i => gray_pixel_valid_x,

            laplacian_o => laplacian_val_x,
            valid_o => laplacian_valid_x
        );

    vairiance : entity work.variance_core
        generic map (
            variance_depth => 8,
            data_width => 11
        )
        port map (
            clk_i => clk_i,
            rst_i => rst_i,
            data_i => signed(laplacian_val_x),
            valid_i => laplacian_valid_x,

            var_o => blur_o,
            mean_o => open,
            valid_o => valid_o
        );

end Behavioral;