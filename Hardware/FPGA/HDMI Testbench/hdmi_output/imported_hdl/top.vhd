library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity hdmi_tx_top is
    generic (
        VIDEO_RESOLUTION : string := "3840P"
    );

    port (
        -- Clocks & Reset
        sysclk_p : in std_logic;
        sysclk_n : in std_logic;
        reset : in std_logic;
        
        locked_led : out std_logic;

        -- Control signals
        --video_src_sel : in std_logic;

        -- External Video signals
        /*ext_video_data : in std_logic_vector(23 downto 0);
        ext_video_clk_in : in std_logic;
        ext_video_hsync_in : in std_logic;
        ext_video_vsync_in : in std_logic;
        ext_video_de_in : in std_logic;*/
        
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
    signal s_video_clk : std_logic;
    signal s_video_hs : std_logic;
    signal s_video_vs : std_logic;
    signal s_video_de : std_logic;
    --signal video_data_r : std_logic_vector(7 downto 0);
    --signal video_data_g : std_logic_vector(7 downto 0);
    --signal video_data_b : std_logic_vector(7 downto 0);
    signal s_video_data : std_logic_vector(23 downto 0);

    signal clk_27m : std_logic;
    signal clk_148_5m : std_logic;   
    signal clk_297m : std_logic; 
    signal clk_500m : std_logic;
    signal clk_74m : std_logic;
    signal clk_25m : std_logic;

    signal rst_n : std_logic;
    signal hdmi_nrst : std_logic;

    signal i2c_lut_index : std_logic_vector(9 downto 0);
    signal i2c_lut_data : std_logic_vector(31 downto 0);
    
    signal s_rst : std_logic;
    
    signal s_ila_clk : std_logic;
   
    component clk_wiz_0
        port
        (-- Clock in ports
        -- Clock out ports
        clk_27m             : out    std_logic;
        clk_148_5m          : out    std_logic;
        clk_297m            : out    std_logic;
        clk_74m             : out    std_logic;
        clk_25m             : out std_logic;
        -- Status and control signals
        reset             : in     std_logic;
        locked            : out    std_logic;
        clk_in1_p         : in     std_logic;
        clk_in1_n         : in     std_logic
        );
    end component;
    
    COMPONENT vio_0
      PORT (
        clk : IN STD_LOGIC;
        probe_out0 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
        probe_out1 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
        probe_out2 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0) 
      );
    END COMPONENT;
    
    /*COMPONENT ila_0
        PORT (
            clk : IN STD_LOGIC;
            probe0 : IN STD_LOGIC; 
            probe1 : IN STD_LOGIC; 
            probe2 : IN STD_LOGIC; 
            probe3 : IN STD_LOGIC; 
            probe4 : IN STD_LOGIC_VECTOR(23 DOWNTO 0); 
            probe5 : IN STD_LOGIC; 
            probe6 : IN STD_LOGIC;
            probe7 : IN STD_LOGIC;
            probe8 : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
            probe9 : IN STD_LOGIC_VECTOR(31 DOWNTO 0)
        );
    END COMPONENT  ;*/

begin 

    s_rst <= not reset;

    video_clk_gen : clk_wiz_0
    port map ( 
        -- Clock out ports  
        clk_27m => clk_27m,
        clk_148_5m => clk_148_5m,
        clk_297m => clk_297m,
        clk_74m => clk_74m,
        clk_25m => clk_25m,
        -- Status and control signals                
        reset => s_rst,
        locked => locked_led,
        -- Clock in ports
        clk_in1_p => sysclk_p,
        clk_in1_n => sysclk_n
    );
    
    color_input : vio_0
      PORT MAP (
        clk => s_video_clk,
        probe_out0 => s_video_data(7 downto 0),
        probe_out1 => s_video_data(15 downto 8),
        probe_out2 => s_video_data(23 downto 16)
      );
    
    with VIDEO_RESOLUTION select
    s_video_clk <= clk_148_5m when "1080P",
                 clk_297m when "3840P",
                 clk_74m when "720P",
                 clk_25m when "480P",
                 clk_297m when others;
    
    with VIDEO_RESOLUTION select
    s_ila_clk <= clk_297m when "1080P",
                 clk_297m when "3840P",
                 clk_148_5m when "720P",
                 clk_74m when "480P",
                 clk_297m when others;                           
                            
    /*ila : ila_0
    PORT MAP (
        clk => s_ila_clk,
        probe0 => '0', 
        probe1 => '1', 
        probe2 => hdmi_out_nrst, 
        probe3 => video_pixel_clk, 
        probe4 => video_data, 
        probe5 => video_hs, 
        probe6 => video_vs,
        probe7 => video_de,
        probe8 => i2c_lut_index,
        probe9 => i2c_lut_data
    );*/
             

    reset_power_on_i2c : entity work.reset_power_on
    generic map(
        FREQ => 27, 
        MAX_TIME => 200
    )
    port map (
        clk => clk_27m,
        user_rst => s_rst,
        power_on_rst => rst_n
    );

    reset_power_on_hdmi : entity work.reset_power_on
    generic map(
        FREQ => 27, 
        MAX_TIME => 200
    )
    port map (
        clk => clk_27m,
        user_rst => s_rst,
        power_on_rst => hdmi_nrst
    );
    
    
    i2c_config : entity work.i2c_config
    port map(
        rst => NOT rst_n,
        clk => clk_27m,
        clk_div_cnt => D"99",
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
        clk => s_video_clk,
        rst => s_rst,
        hs => s_video_hs,
        vs => s_video_vs,
        de => s_video_de,
        video_data => open
        --rgb_r => s_video_data(7 downto 0),
        --rgb_g =>   s_video_data(15 downto 8),
        --rgb_b => s_video_data(23 downto 16)
    );

    /*video_mux : entity work.video_mux
    generic map(
        video_in_width => 24,
        video_out_width => 24,
        pixels_per_clk => 1
    )
    port map (
        clk => clk_27m,
        reset => s_rst,
        video_source_sel => '0',

        ext_video_data_in => X"000000",
        ext_video_clk_in => '0',
        ext_video_hsync_in => '0',
        ext_video_vsync_in => '0',
        ext_video_de_in => '0',

        int_video_data_in => s_video_data,
        int_video_clk_in => s_video_clk,
        int_video_hsync_in => s_video_hs,
        int_video_vsync_in => s_video_vs,
        int_video_de_in => s_video_de,

        video_data_out => video_data,
        video_clk_out => video_pixel_clk,
        video_hsync_out => video_hs,
        video_vsync_out => video_vs,
        video_de_out => video_de
    );*/
    
    video_data <= s_video_data;
    video_pixel_clk <= s_video_clk;
    video_hs <= s_video_hs;
    video_vs <= s_video_vs;
    video_de <= s_video_de;
    hdmi_out_nrst <= hdmi_nrst;

end Behavioral;
