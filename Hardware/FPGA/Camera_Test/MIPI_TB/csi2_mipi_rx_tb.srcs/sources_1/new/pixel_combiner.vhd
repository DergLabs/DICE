library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

library UNISIM;
use UNISIM.VComponents.all;

entity pixel_combiner is
    port(
        -- Clocks & Reset
        reset : in std_logic;
        clk_297m : in std_logic;
        clk_148_5m : in std_logic;

        -- Input Video Signals
        video_even_data_i : in std_logic_vector(23 downto 0);
        video_odd_data_i : in std_logic_vector(23 downto 0);

        -- Output Video Signals
        video_data_o : out std_logic_vector(23 downto 0)
    );

end pixel_combiner;

architecture Behavioral of pixel_combiner is
    signal video_even_data_x : std_logic_vector(23 downto 0);
    signal video_odd_data_x : std_logic_vector(23 downto 0);
    signal vid_src_sel_x : std_logic;
    signal video_data_out_x : std_logic_vector(23 downto 0);
begin

    process(clk_148_5m, reset)
    begin
        if (reset = '1') then
            video_even_data_x <= (others => '0');
            video_odd_data_x <= (others => '0');
        elsif rising_edge(clk_148_5m) then
            video_even_data_x <= video_even_data_i;
            video_odd_data_x <= video_odd_data_i;
        end if;
    end process;

    process(clk_297m, reset)
    begin
        if (reset = '1') then
            vid_src_sel_x <= '0';
        elsif rising_edge(clk_297m) then
            vid_src_sel_x <= NOT vid_src_sel_x;
        end if;
    end process;

    with vid_src_sel_x select
        video_data_out_x <= video_even_data_x when '0',
                        video_odd_data_x when others;

    process(clk_297m, reset)
    begin
        if (reset = '1') then
            video_data_o <= (others => '0');
        elsif rising_edge(clk_297m) then
            video_data_o <= video_data_out_x;
        end if;
    end process;

end Behavioral;