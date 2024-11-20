library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity hdmi_tx_top is
    generic (
        VIDEO_RESOLUTION : string := "3840P_30"
    );

    port (
        -- Clocks & Reset
        sysclk_p : in std_logic;
        sysclk_n : in std_logic;

        reset : in std_logic;

        -- HDMI Clk & Data
        hdmi_out_nrst : out std_logic;
        video_pixel_clk : out std_logic;
        video_hs : out std_logic;
        video_vs : out std_logic;
        video_de : out std_logic;
        video_data : out std_logic_vector(23 downto 0);

        -- HDMI Controller I2C
        hdmi_i2c_scl : inout std_logic;
        hdmi_i2c_sda : inout std_logic
    );
end hdmi_tx_top;

architecture Behavioral of hdmi_tx_top is
    signal video_clk : std_logic;
    signal s_video_hs : std_logic;
    signal s_video_vs : std_logic;
    signal s_video_de : std_logic;
    signal video_data_r : std_logic_vector(7 downto 0);
    signal video_data_g : std_logic_vector(7 downto 0);
    signal video_data_b : std_logic_vector(7 downto 0);

    signal clk_27m : std_logic;
    signal clk_148_5m : std_logic;   
    signal clk_297m : std_logic; 
    signal locked : std_logic;

    signal rst_n : std_logic;
    signal hdmi_nrst : std_logic;

    signal i2c_lut_index : std_logic_vector(9 downto 0);
    signal i2c_lut_data : std_logic_vector(31 downto 0);

    component clk_wiz_0
        port
        (-- Clock in ports
        -- Clock out ports
        clk_27m          : out    std_logic;
        clk_148_5m          : out    std_logic;
        clk_297m          : out    std_logic;
        -- Status and control signals
        reset             : in     std_logic;
        locked            : out    std_logic;
        clk_in1_p         : in     std_logic;
        clk_in1_n         : in     std_logic
        );
    end component;

begin 

    video_clk_gen : clk_wiz_0
    port map ( 
        -- Clock out ports  
        clk_27m => clk_27m,
        clk_148_5m => clk_148_5m,
        clk_297m => clk_297m,
        -- Status and control signals                
        reset => reset,
        locked => locked,
        -- Clock in ports
        clk_in1_p => sysclk_p,
        clk_in1_n => sysclk_n
    );
    
    with VIDEO_RESOLUTION select
    video_clk <= clk_148_5m when "1080P_60",
                 clk_297m when "3840P_30",
                 clk_297m when others;
    
    with VIDEO_RESOLUTION select
    video_pixel_clk <= clk_148_5m when "1080P_60",
                       clk_297m when "3840P_30",
                       clk_297m when others;
                     

    reset_power_on_i2c : entity work.reset_power_on
    generic map(
        FREQ => 27, 
        MAX_TIME => 200
    )
    port map (
        clk => clk_27m,
        user_rst => 0,
        power_on_rst => rst_n
    );

    reset_power_on_hdmi : entity work.reset_power_on
    generic map(
        FREQ => 27, 
        MAX_TIME => 200
    )
    port map (
        clk => clk_27m,
        user_rst => 0,
        power_on_rst => hdmi_nrst
    );
    
    
    i2c_config : entity work.i2c_config
    port map(
        rst => NOT rst_n,
        clk => clk_27m,
        clk_div_cnt => X"99",
        i2c_addr_2byte => 0,
        lut_index => i2c_lut_index,
        lut_dev_addr => i2c_lut_data(31 downto 24),
        lut_reg_addr => i2c_lut_data(23 downto 8),
        lut_reg_data => i2c_lut_data(7 downto 0),
        --error => 0, 
        --done => 0, 
        i2c_scl => hdmi_i2c_scl,
        i2c_sda => hdmi_i2c_sda
    );

    lut_hdmi_config : entity work.lut_hdmi_out
    port map (
        lut_index => i2c_lut_index,
        lut_data => i2c_lut_data
    );

    color_bar_gen : entity work.color_bar
    port map (
        clk => video_clk,
        rst => reset,
        hs => s_video_hs,
        vs => s_video_vs,
        de => s_video_de,
        rgb_r => video_data_r,
        rgb_g => video_data_g,
        rgb_b => video_data_b
    );

    video_data <= video_data_r & video_data_g & video_data_b;
    video_hs <= s_video_hs;
    video_vs <= s_video_vs;
    video_de <= s_video_de;
    hdmi_out_nrst <= hdmi_nrst;

end Behavioral;
