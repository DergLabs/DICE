library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity video_mux is
    generic (
        video_in_width : integer := 24;
        video_out_width : integer := 24;
        pixels_per_clk : integer := 1
    );
    port (

        -- Control signals
        clk : in std_logic;
        reset : in std_logic;
        video_source_sel : in std_logic;

        -- External video input interface
        ext_video_data_in : in std_logic_vector((video_in_width-1) downto 0);
        ext_video_clk_in : in std_logic;
        ext_video_hsync_in : in std_logic;
        ext_video_vsync_in : in std_logic;
        ext_video_de_in : in std_logic;
        
        -- Internal Test video input interface
        int_video_data_in : in std_logic_vector((video_in_width-1) downto 0);
        int_video_clk_in : in std_logic;
        int_video_hsync_in : in std_logic;
        int_video_vsync_in : in std_logic;
        int_video_de_in : in std_logic;
        

        -- Video output interface
        video_data_out : out std_logic_vector((video_out_width-1) downto 0);
        video_clk_out : out std_logic;
        video_hsync_out : out std_logic;
        video_vsync_out : out std_logic;
        video_de_out : out std_logic
    );
end video_mux;

architecture Behavioral of video_mux is
    signal s_vid_src_sel : std_logic;
begin

    process(clk, reset)
    begin
        if (reset = '1') then
            s_vid_src_sel <= '0';
        elsif rising_edge(clk) then
            s_vid_src_sel <= video_source_sel;
        end if;
    end process;

    with (s_vid_src_sel) select
        video_data_out <= ext_video_data_in when '1',
                          int_video_data_in when '0',
                          int_video_data_in when others;

    with (s_vid_src_sel) select
        video_clk_out <= ext_video_clk_in when '1',
                        int_video_clk_in when '0',
                        int_video_clk_in when others;   

    with (s_vid_src_sel) select
        video_hsync_out <= ext_video_hsync_in when '1',
                        int_video_hsync_in when '0',
                        int_video_hsync_in when others;    

    with (s_vid_src_sel) select
        video_vsync_out <= ext_video_vsync_in when '1',
                          int_video_vsync_in when '0',
                          int_video_vsync_in when others;

    with (s_vid_src_sel) select
        video_de_out <= ext_video_de_in when '1',
                          int_video_de_in when '0',
                          int_video_de_in when others;              


end Behavioral;