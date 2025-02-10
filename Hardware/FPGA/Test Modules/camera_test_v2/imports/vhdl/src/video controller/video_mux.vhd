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
        cam_video_hsync_in : in std_logic;
        cam_video_vsync_in : in std_logic;
        cam_video_de_in : in std_logic;
        
        -- Internal Test video input interface
        test_video_data_in : in std_logic_vector((video_in_width-1) downto 0);
        test_video_hsync_in : in std_logic;
        test_video_vsync_in : in std_logic;
        test_video_de_in : in std_logic;
        

        -- Video output interface
        video_data_out : out std_logic_vector((video_out_width-1) downto 0);
        video_hsync_out : out std_logic;
        video_vsync_out : out std_logic;
        video_de_out : out std_logic
    );
end video_mux;

architecture Behavioral of video_mux is
begin
    process(clk, reset)
    begin
        if (reset) then
            video_data_out <= (others => '0');
            video_hsync_out <= '0';
            video_vsync_out <= '0';
            video_de_out <= '0';
        elsif rising_edge(clk) then
            if (video_source_sel = '1') then
                video_data_out <= cam_video_data_in;
                video_hsync_out <= cam_video_hsync_in;
                video_vsync_out <= cam_video_vsync_in;
                video_de_out <= cam_video_de_in;
            else
                video_data_out <= test_video_data_in;
                video_hsync_out <= test_video_hsync_in;
                video_vsync_out <= test_video_vsync_in;
                video_de_out <= test_video_de_in;
            end if;
        end if;
    end process;  

end Behavioral;