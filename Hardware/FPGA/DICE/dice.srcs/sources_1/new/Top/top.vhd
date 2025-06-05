----------------------------------------------------------------------------------
-- Company: Drexel University
-- Engineer: John Hofmeyr
-- 
-- Create Date: 01/25/2025 05:18:28 PM
-- Design Name: 
-- Module Name: top - Behavioral
-- Project Name: DICE
-- Target Devices: 
-- Tool Versions: 
-- Description: Top Level for Simplified Image Compressor with USB interface
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
Library xpm;
use xpm.vcomponents.all;


entity top is
    generic (
        NUM_CHANNELS : integer := 3;
        BLOCK_SIZE : integer := 4096; -- # of bytes per block, block contains 1024 pixels
        USE_SIM_MODEL : boolean := false;
        ENABLE_ILA : boolean := false;
        ENABLE_STATS : boolean := true;
        ENABLE_VIO : boolean := false 
    );
    port ( 
        -- Inputs
        sim_clk             : in std_logic; -- Only used in simulation

        sysclk_n            : in std_logic;
        sysclk_p            : in std_logic;
        rst_i               : in std_logic;

        ftdi_clk_i          : in std_logic;
        ftdi_rxf_n_i        : in std_logic; 
        ftdi_txe_n_i        : in std_logic;
           
        -- Outputs
        led_o               : out std_logic_vector(3 downto 0);

        ftdi_rstn_o         : out std_logic;
        ftdi_wakeup_o       : out std_logic;
        ftdi_oe_n_o         : out std_logic;
        ftdi_rd_n_o         : out std_logic;
        ftdi_wr_n_o         : out std_logic;

        -- Bidirectional
        ftdi_data_io        : inout std_logic_vector(15 downto 0);
        ftdi_be_io          : inout std_logic_vector(1 downto 0)
    );
end top;

architecture Behavioral of top is

    -- Clocking & Reset Signals
    signal rst_x                        : std_logic;
    signal clk_x                        : std_logic;
    signal locked                       : std_logic;


    -- Data from FT600
    signal data_from_ft600              : std_logic_vector(15 downto 0);
    signal data_in_valid                : std_logic;  -- Data from FT600 is valid, driven by FT600
    signal be_from_ft600                : std_logic_vector(1 downto 0);
    
    signal data_from_ft600_r            : std_logic_vector(15 downto 0);
    signal data_in_valid_r              : std_logic;  -- Data from FT600 is valid, driven by FT600

    -- CDC Input memory
    signal fifo_data_to_core            : std_logic_vector(((NUM_CHANNELS * 16) - 17 ) downto 0);
    signal input_fifo_valid             : std_logic;
    --Fifo clear signal from output memory controller
    signal fifo_clear                   : std_logic;


    -- Data from RGB to YCrCb
    signal ycrcb_x                      : std_logic_vector(23 downto 0);
    signal ycrcb_valid_x                : std_logic;
    signal ycrcb_delayed_x              : std_logic_vector(23 downto 0);
    signal ycrcb_valid_delayed_x        : std_logic;

    -- Processor Core 
    signal core_dout                    : std_logic_vector(255 downto 0);
    signal core_dout_valid              : std_logic_vector(NUM_CHANNELS-1 downto 0);

    -- Special case for 3 cores
    signal core_dout_256b               : std_logic_vector(255 downto 0);
    --signal core_dout_512b               : std_logic_vector(511 downto 0);

    -- Data to FT600
    signal output_memory_data           : std_logic_vector(15 downto 0); -- Data from processed output memory
    signal hold_memory_data             : std_logic_vector(15 downto 0); -- Data from hold memory
    signal data_to_ft600                : std_logic_vector(15 downto 0);
    signal ft600_ready_for_data         : std_logic; -- Data to FT600 is valid, driven by FT600
    signal be_to_ft600                  : std_logic_vector(1 downto 0);

    -- Statistics Module Outputs
    signal laplacian_var                : std_logic_vector(15 downto 0);
    signal laplacian_mean               : std_logic_vector(15 downto 0);
    signal laplacian_std_dev            : std_logic_vector(15 downto 0);
    signal laplacian_valid              : std_logic;

    signal gradient_var                 : std_logic_vector(15 downto 0);
    signal gradient_mean                : std_logic_vector(15 downto 0);
    signal gradient_std_dev             : std_logic_vector(15 downto 0);
    signal gradient_valid               : std_logic;

    signal gradient_threshold           : std_logic_vector(15 downto 0) := X"0000"; -- Default threshold for gradient
    signal laplacian_threshold          : std_logic_vector(15 downto 0) := X"0000"; -- Default threshold for laplacian

    -- Selection signal for lossless vs lossy data
    signal pixel_select                 : std_logic;

    -- output memory debug signals
    signal output_ram_wr_addr_dbg       : std_logic_vector(8 downto 0);
    signal output_ram_rd_addr_dbg       : std_logic_vector(12 downto 0);
    signal read_counter_dbg             : std_logic_vector(15 downto 0); -- Debug read counter for output memory

    -- Core clock gen
    component sys_clk_mmcm
    port
    (
    -- Clock out ports
    clk_out1          : out    std_logic;
    -- Status and control signals
    reset             : in     std_logic;
    locked            : out    std_logic;
    clk_in1_p         : in     std_logic;
    clk_in1_n         : in     std_logic
    );
    end component;

    -- Debug ILA
    COMPONENT ila_0
    PORT (
        clk         : IN STD_LOGIC;
        probe0      : IN STD_LOGIC_VECTOR(15 DOWNTO 0); 
        probe1      : IN STD_LOGIC;
        probe2      : IN STD_LOGIC_VECTOR(31 DOWNTO 0); 
        probe3      : IN STD_LOGIC;
        probe4      : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
        probe5      : IN STD_LOGIC; 
        probe6      : IN STD_LOGIC_VECTOR(15 DOWNTO 0); 
        probe7      : IN STD_LOGIC_VECTOR(15 DOWNTO 0); 
        probe8      : IN STD_LOGIC_VECTOR(15 DOWNTO 0); 
        probe9      : IN STD_LOGIC; 
        probe10     : IN STD_LOGIC_VECTOR(15 DOWNTO 0); 
        probe11     : IN STD_LOGIC_VECTOR(15 DOWNTO 0); 
        probe12     : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
        probe13     : IN STD_LOGIC;
        probe14     : IN STD_LOGIC
    );
    END COMPONENT;


    COMPONENT vio_0
    PORT (
      clk : IN STD_LOGIC;
      probe_out0 : OUT STD_LOGIC;
      probe_out1 : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
      probe_out2 : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
      probe_out3 : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
      probe_out4 : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
      probe_out5 : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
      probe_out6 : OUT STD_LOGIC_VECTOR(15 DOWNTO 0) 
    );
    END COMPONENT;

    signal vio_rst : std_logic;

    signal vio_gradient_mean : std_logic_vector(15 downto 0);
    signal vio_gradient_std_dev : std_logic_vector(15 downto 0);
    signal vio_gradient_var : std_logic_vector(15 downto 0);

    signal vio_laplacian_mean : std_logic_vector(15 downto 0);
    signal vio_laplacian_std_dev : std_logic_vector(15 downto 0);
    signal vio_laplacian_var : std_logic_vector(15 downto 0);

begin

    vio_gen : if ENABLE_VIO generate
        system_vio : vio_0
        PORT MAP (
            clk => clk_x,
            probe_out0 => vio_rst,
            probe_out1 => vio_gradient_mean,
            probe_out2 => vio_gradient_std_dev,
            probe_out3 => vio_gradient_var,
            probe_out4 => vio_laplacian_mean,
            probe_out5 => vio_laplacian_std_dev,
            probe_out6 => vio_laplacian_var
        );
    else generate
        vio_rst <= '0';
        vio_gradient_mean <= (others => '0');
        vio_gradient_std_dev <= (others => '0');
        vio_gradient_var <= X"dead"; -- Currently only used stat

        vio_laplacian_mean <= (others => '0');
        vio_laplacian_std_dev <= (others => '0');
        vio_laplacian_var <= X"beef"; -- Currently only used stat
    end generate;

    -- invert RST for internal use, FT600 core uses active low reset, rest of core uses active high reset
    -- RST input to FPGA is active high
    rst_x <= (not rst_i); 
    
    -- debug ILA
    ila_gen : if ENABLE_ILA generate
        ila : ila_0
        PORT MAP (
            clk => clk_x,

            probe0 => data_from_ft600, -- was data_from_ft600
            probe1 => data_in_valid, 
            probe2 => fifo_data_to_core,
            probe3 => input_fifo_valid, 
            probe4 => data_to_ft600, -- was data_to_ft600
            probe5 => ft600_ready_for_data,

            probe6 => laplacian_var,
            probe7 => laplacian_mean,
            probe8 => laplacian_std_dev,
            probe9 => laplacian_valid,

            probe10 => gradient_var,
            probe11 => gradient_mean,
            probe12 => gradient_std_dev,
            probe13 => gradient_valid,

            probe14 => pixel_select -- Pixel select signal for lossless vs lossy block
            
        );
    end generate;

    -- Clocking
    clocking_gen: if USE_SIM_MODEL generate
        clk_x <= sim_clk; -- Tie system clk (clk_x) to simulation clock (sim_clk)
    else generate
        -- MMCM instantiation, configured for 200MHz output clock
        sys_clk : sys_clk_mmcm
        port map ( 
            -- Clock out ports  
            clk_out1 => clk_x, 
            -- Status and control signals                
            reset => '0',
            locked => locked,
            -- Clock in ports
            clk_in1_p => sysclk_p,
            clk_in1_n => sysclk_n
        );
    end generate;


    -- FT600 interface, runs on FTDI CLK
    ft600_send_recv : entity work.send_recieve_module
    port map (
        rst_n => rst_i or vio_rst,
        LED_data => led_o,

        ftdi_resetn => ftdi_rstn_o,
        ftdi_wakeupn => ftdi_wakeup_o,
        ftdi_clk => ftdi_clk_i,
        ftdi_rxf_n => ftdi_rxf_n_i,
        ftdi_txe_n => ftdi_txe_n_i,
        ftdi_oe_n => ftdi_oe_n_o,
        ftdi_rd_n => ftdi_rd_n_o,
        ftdi_wr_n => ftdi_wr_n_o,
        ftdi_data => ftdi_data_io,
        ftdi_be => ftdi_be_io,

        data_to_ft600 => data_to_ft600,
        be_to_ft600 => 2b"11",

        data_from_ft600 => data_from_ft600, 
        be_from_ft600 => be_from_ft600,

        ready_to_recieve => ft600_ready_for_data, -- Data from BRAM is valid and ready to send to FT600
        ready_to_send => data_in_valid -- Data from FT600 is valid and ready to send to BRAM
    );

    data_from_ft600_r <= data_from_ft600 when rising_edge(ftdi_clk_i);
    data_in_valid_r <= data_in_valid when rising_edge(ftdi_clk_i);

    -- Input fifo, bridges ftdi_clk and core_clk
    -- Regen FIFO IP if DIN or DOUT width change
    input_memory_fifo : entity work.input_memory
    generic map (
        DIN_WIDTH => data_from_ft600'length,
        DOUT_WIDTH => fifo_data_to_core'length
    )
    port map (
        rst_i => rst_x,
        
        data_i => data_from_ft600_r,
        data_in_valid => data_in_valid_r,
        write_clk_i => ftdi_clk_i,
        write_en_i => data_in_valid,

        read_hold_ram_i => ft600_ready_for_data,
        hold_ram_data_o => hold_memory_data,

        data_o => fifo_data_to_core,
        data_out_valid => input_fifo_valid,
        read_clk_i => clk_x,

        empty_o => open,
        full_o => open
    );

    -- RGB to YCrCb converter (system verilog version)
    /*rgb_to_ycrcb : entity work.rgb_to_ycrcb
    port map(
        clk_i => clk_x,
        rst_i => rst_x,
        -- data_i order is | B | R | G | <- |23:16|15:8|7:0|
        rgb_i => fifo_data_to_core(31 downto 24) & fifo_data_to_core(23 downto 16) & fifo_data_to_core(7 downto 0),
        rgb_valid_i => input_fifo_valid,
        ycrcb_o => ycrcb_x,
        ycrcb_valid_o => ycrcb_valid_x
    );*/


    -- RGB to YCrCb converter (VHDL version)
    rgb_to_ycrcb : entity work.rgb_to_ycrcb
    port map(
        clk_i => clk_x,
        rst_i => rst_x,

        -- data_i order is | B | R | G | <- |23:16|15:8|7:0|
        rgb_i => fifo_data_to_core(31 downto 24) & fifo_data_to_core(23 downto 16) & fifo_data_to_core(7 downto 0),
        valid_i => input_fifo_valid,

        ycrcb_o => ycrcb_x,
        valid_o => ycrcb_valid_x
    );

    -- Image compression core
    lossy_comp_core : entity work.multi_ch_lossy_comp
    generic map (
        Y_BITS => 12,
        CR_BITS => 10,
        CB_BITS => 10,

        EN_Y_SUBSAMPLE => false,
        EN_CR_SUBSAMPLE => true,
        EN_CB_SUBSAMPLE => true,
        EN_ZIGZAG => true
    )
    port map (
        clk_i => clk_x,
        rst_i => rst_x,
        vio_rst_i => vio_rst or data_in_valid,
        -- data_i order is | Core 2 - Cb | Core 1 - Y | Core 0 - Cr | <- |23:16|15:8|7:0|
        --data_i => ycrcb_delayed_x,
        --valid_i => ycrcb_valid_delayed_x,
        data_i => ycrcb_x,
        valid_i => ycrcb_valid_x,
        --ce_o => open,
        --done_o => open,
        data_o => core_dout,
        valid_o => core_dout_valid
    );


    -- Order is Core 0 - Cb | Core 2 - Cr | Core 1 - Y
    -- Core 0 width is 80 bits (10b per pixel), Core 1 width is 96 bits (12b per pixel), Core 2 width is 80 bits (10b per pixel)
    -- Structure is bits 79:0 Cb (core 0), 255:176 Cr (core 2), 175:80 Y (core 1)
    core_dout_256b <=   core_dout(79 downto 70) & core_dout(255 downto 246) & core_dout(175 downto 164) &
                        core_dout(69 downto 60) & core_dout(245 downto 236) & core_dout(163 downto 152) &
                        core_dout(59 downto 50) & core_dout(235 downto 226) & core_dout(151 downto 140) &
                        core_dout(49 downto 40) & core_dout(225 downto 216) & core_dout(139 downto 128) &
                        core_dout(39 downto 30) & core_dout(215 downto 206) & core_dout(127 downto 116) &
                        core_dout(29 downto 20) & core_dout(205 downto 196) & core_dout(115 downto 104) &
                        core_dout(19 downto 10) & core_dout(195 downto 186) & core_dout(103 downto 92) &
                        core_dout(9 downto 0)   & core_dout(185 downto 176) & core_dout(91 downto 80);


    output_memory : entity work.output_memory
    generic map (
        DIN_WIDTH => 256,
        DOUT_WIDTH => data_to_ft600'length,
        NUM_WRITE_WORDS => ((BLOCK_SIZE * 32)/256), -- Extra write space for now
        NUM_READ_WORDS => 2048 -- Hard coded for 1024 pixel blocks, 
                                --each block is 32b so we read out 2048 16b words + 1 16b word for end of block marker
        --DEPTH => 2048
    )
    port map (
        rst_i => rst_x,
        
        -- Converting to 256b bus for output memory, may fix later but this keeps things simple
        data_i => core_dout_256b,
        data_in_valid => core_dout_valid(0),
        write_clk_i => clk_x,

        reciever_ready_i => ft600_ready_for_data,
        data_o => output_memory_data,
        data_out_valid => open,
        read_clk_i => ftdi_clk_i,

        memory_clear_o => fifo_clear,

        -- Debug signals
        output_ram_wr_addr_o => output_ram_wr_addr_dbg,
        output_ram_rd_addr_o => output_ram_rd_addr_dbg,
        read_counter_o => read_counter_dbg
    );

    -- Image statistics core
    gen_image_statistics :
    if ENABLE_STATS generate
        -- Image statistics core
        image_statistics_core : entity work.image_statistics_top
        generic map (
            NUM_SAMPLES => 28 -- # of 9 pixel samples to process, 256/9 = 28.77 so we round down to 28
        )
        port map (
            clk_i => clk_x, 
            ce_i => '1',
            rst_i => rst_x or data_in_valid, -- reset core every time new data is received from the FT600

            pixel_i => ycrcb_x(15 downto 8), -- pass Y channel to statistics core
            valid_i => ycrcb_valid_x,

            laplacian_var_o => laplacian_var,
            laplacian_mean_o => laplacian_mean,
            laplacian_std_dev_o => laplacian_std_dev,
            laplacian_valid_o => laplacian_valid,

            gradient_var_o => gradient_var,
            gradient_mean_o => gradient_mean,
            gradient_std_dev_o => gradient_std_dev,
            gradient_valid_o => gradient_valid
        );

        tile_selector : entity work.tile_selection_logic
        port map(
            clk_i => clk_x,
            rst_i => rst_x,

            gradient_var_i => gradient_var,
            gradient_mean_i => gradient_mean,
            gradient_std_dev_i => gradient_std_dev,
            gradient_valid_i => gradient_valid,

            laplacian_var_i => laplacian_var,
            laplacian_mean_i => laplacian_mean,
            laplacian_std_dev_i => laplacian_std_dev,
            laplacian_valid_i => laplacian_valid,

            fifo_data_i => fifo_data_to_core,
            fifo_valid_i => input_fifo_valid,
            clear_threshold_i => data_in_valid,

            lossy_tile_data_i => output_memory_data, -- Data from output memory
            lossless_tile_data_i => hold_memory_data, -- Data from hold memory

            tile_data_o => data_to_ft600, -- Data to FT600
            tile_select => pixel_select, -- Output tile selection signal

            -- Debug signals
            gradient_threshold_o => gradient_threshold, -- Debug output for gradient mean
            laplacian_threshold_o => laplacian_threshold -- Debug output for laplacian mean
        );
    
    else generate
        -- No statistics core, only use processed data
        data_to_ft600 <= output_memory_data;

    end generate;


end Behavioral;
