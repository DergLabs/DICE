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
        cam_video_data_in : in std_logic_vector((video_in_width-1) downto 0);
        cam_video_clk_in : in std_logic;
        cam_video_hsync_in : in std_logic;
        cam_video_vsync_in : in std_logic;
        cam_video_de_in : in std_logic;
        
        -- Internal Test video input interface
        test_video_data_in : in std_logic_vector((video_in_width-1) downto 0);
        test_video_clk_in : in std_logic;
        test_video_hsync_in : in std_logic;
        test_video_vsync_in : in std_logic;
        test_video_de_in : in std_logic;
        

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
        if (reset = '0') then
            s_vid_src_sel <= '0';
        elsif rising_edge(clk) then
            s_vid_src_sel <= video_source_sel;
        end if;
    end process;

    with (s_vid_src_sel) select
        video_data_out <= cam_video_data_in when '1',
                          test_video_data_in when '0',
                          test_video_data_in when others;

    with (s_vid_src_sel) select
        video_clk_out <= cam_video_clk_in when '1',
                        test_video_clk_in when '0',
                        test_video_clk_in when others;

    with (s_vid_src_sel) select
        video_hsync_out <= cam_video_hsync_in when '1',
                        test_video_hsync_in when '0',
                        test_video_hsync_in when others;    

    with (s_vid_src_sel) select
        video_vsync_out <= cam_video_vsync_in when '1',
                          test_video_vsync_in when '0',
                          test_video_vsync_in when others;

    with (s_vid_src_sel) select
        video_de_out <= cam_video_de_in when '1',
                          test_video_de_in when '0',
                          test_video_de_in when others;              


end Behavioral;