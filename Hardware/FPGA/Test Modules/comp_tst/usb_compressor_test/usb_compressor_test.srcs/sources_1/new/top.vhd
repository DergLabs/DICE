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
        BLOCK_SIZE : integer := 1024;
        USE_SIM_MODEL : boolean := false;
        ENABLE_ILA : boolean := false
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
    signal sys_clk_ibuf_x               : std_logic; -- IBUFDS 200MHz Clock to global buffer
    signal sys_clk_bufg_x               : std_logic; -- Global buffer output to MMCM and logic
    signal clk_200m                     : std_logic; -- ILA Clock
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

    -- Processor Core 
    signal core_dout                    : std_logic_vector((NUM_CHANNELS*64)-1 downto 0);
    signal core_dout_valid              : std_logic_vector(NUM_CHANNELS-1 downto 0);

    -- Special case for 3 cores
    signal core_dout_256b               : std_logic_vector(255 downto 0);

    -- Data to FT600
    signal data_to_ft600                : std_logic_vector(15 downto 0);
    signal ft600_ready_for_data         : std_logic; -- Data to FT600 is valid, driven by FT600
    signal be_to_ft600                  : std_logic_vector(1 downto 0);


    -- Core clock gen
    component clk_wiz_0
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
        probe0      : IN STD_LOGIC; 
        probe1      : IN STD_LOGIC_VECTOR(31 DOWNTO 0); 
        probe2      : IN STD_LOGIC_VECTOR(23 DOWNTO 0); 
        probe3      : IN STD_LOGIC_VECTOR(15 DOWNTO 0); 
        probe4      : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
        probe5      : IN STD_LOGIC;
        probe6      : IN STD_LOGIC;
        probe7      : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
        probe8      : IN STD_LOGIC;
        probe9      : IN STD_LOGIC;
        probe10     : IN STD_LOGIC;
        probe11     : IN STD_LOGIC;
        probe12     : IN STD_LOGIC_VECTOR(2 DOWNTO 0)
    );
    END COMPONENT;

begin

    -- invert RST for internal use, FT600 core uses active low reset, rest of core uses active high reset
    -- RST input to FPGA is active high
    rst_x <= not rst_i; 
    
    -- debug ILA
    ila_gen : if ENABLE_ILA generate
        ila : ila_0
        PORT MAP (
            clk => clk_x,
            probe0 => ft600_ready_for_data, 
            probe1 => fifo_data_to_core, 
            probe2 => fifo_data_to_core(7 downto 0) & fifo_data_to_core(31 downto 24) & fifo_data_to_core(23 downto 16),
            probe3 => data_to_ft600, 
            probe4 => (others => '0'),
            probe5 => ftdi_rxf_n_i,
            probe6 => data_in_valid,
            probe7 => data_from_ft600,
            probe8 => clk_x,
            probe9 => input_fifo_valid,
            probe10 => ftdi_txe_n_i,
            probe11 => ftdi_wr_n_o,
            probe12 => (others => '0')
        );
    end generate;

    -- Clocking
    clocking_gen: if not USE_SIM_MODEL generate
        /*IBUFDS_inst : IBUFDS
        port map (
            O => sys_clk_ibuf_x,   -- 1-bit output: Buffer output
            I => sysclk_p,   -- 1-bit input: Diff_p buffer input (connect directly to top-level port)
            IB => sysclk_n  -- 1-bit input: Diff_n buffer input (connect directly to top-level port)
        );*/

        -- MMCM instantiation
        sys_clk : clk_wiz_0
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

    -- Tie clk_x to sim_clk for simulation
    sim_clocking_gen : if USE_SIM_MODEL generate
        clk_x <= sim_clk;
    end generate;


    -- FT600 runs on FTDI CLK
    ft600_send_recv : entity work.send_recieve_module
    port map (
        rst_n => rst_i,
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

    input_memory_fifo : entity work.input_memory
    generic map (
        DIN_WIDTH => data_from_ft600'length,
        DOUT_WIDTH => fifo_data_to_core'length
        --DEPTH => BLOCK_SIZE -- Should be equal to number of pixels we will read in
    )
    port map (
        rst_i => rst_x,
        
        data_i => data_from_ft600_r,
        data_in_valid => data_in_valid_r,
        write_clk_i => ftdi_clk_i,
        write_en_i => data_in_valid,

        data_o => fifo_data_to_core,
        data_out_valid => input_fifo_valid,
        read_clk_i => clk_x,

        empty_o => open,
        full_o => open
    );

    -- RGB to YCrCb converter
    rgb_to_ycrcb : entity work.rgb_to_ycrcb
    port map(
        clk_i => clk_x,
        -- data_i order is | B | R | G | <- |23:16|15:8|7:0|
        rgb_i => fifo_data_to_core(31 downto 24) & fifo_data_to_core(23 downto 16) & fifo_data_to_core(7 downto 0),
        rgb_valid_i => input_fifo_valid,
        ycrcb_o => ycrcb_x,
        ycrcb_valid_o => ycrcb_valid_x
    );

    gen_modified_core_input : 
    if NUM_CHANNELS = 3 generate
        -- Image compression core
        compression_core : entity work.multi_core_test
        generic map (
            NUM_CHANNELS => NUM_CHANNELS
        )
        port map (
            clk_i => clk_x,
            rst_i => rst_x,
            -- data_i order is | Core 2 - Cb | Core 1 - Y | Core 0 - Cr | <- |23:16|15:8|7:0|
            --data_i => fifo_data_to_core(7 downto 0) & fifo_data_to_core(31 downto 24) & fifo_data_to_core(23 downto 16),
            --valid_i => input_fifo_valid,
            data_i => ycrcb_x,
            valid_i => ycrcb_valid_x,
            ce_o => open,
            done_o => open,
            data_o => core_dout,
            valid_o => core_dout_valid
        );

        --core_dout_256b <= X"0000000000000000" & core_dout;
        
        core_dout_256b <= core_dout(63 downto 56) & X"00" & core_dout(191 downto 184) & core_dout(127 downto 120) &
                        core_dout(55 downto 48) & X"00" & core_dout(183 downto 176) & core_dout(119 downto 112) &
                        core_dout(47 downto 40) & X"00" & core_dout(175 downto 168) & core_dout(111 downto 104) &
                        core_dout(39 downto 32) & X"00" & core_dout(167 downto 160) & core_dout(103 downto 96) &
                        core_dout(31 downto 24) & X"00" & core_dout(159 downto 152) & core_dout(95 downto 88) &
                        core_dout(23 downto 16) & X"00" & core_dout(151 downto 144) & core_dout(87 downto 80) &
                        core_dout(15 downto 8) & X"00" & core_dout(143 downto 136) & core_dout(79 downto 72) &
                        core_dout(7 downto 0) & X"00" & core_dout(135 downto 128) & core_dout(71 downto 64);

        output_memory : entity work.output_memory
        generic map (
            DIN_WIDTH => 256,
            DOUT_WIDTH => data_to_ft600'length,
            NUM_WRITE_WORDS => ((BLOCK_SIZE * 32)/256),
            NUM_READ_WORDS => ((BLOCK_SIZE * 32)/16)
            --DEPTH => 2048
        )
        port map (
            rst_i => rst_x,
            
            -- Converting to 256b bus for output memory, may fix later but this keeps things simple
            data_i => core_dout_256b,
            data_in_valid => core_dout_valid(0),
            write_clk_i => clk_x,
    
            reciever_ready_i => ft600_ready_for_data,
            data_o => data_to_ft600,
            data_out_valid => open,
            read_clk_i => ftdi_clk_i,
    
            memory_clear_o => fifo_clear
        );
    else generate
        -- Image compression core
        compression_core : entity work.multi_core_test
        generic map (
            NUM_CHANNELS => NUM_CHANNELS
        )
        port map (
            clk_i => clk_x,
            rst_i => rst_x,
            --data_i => fifo_data_to_core(7 downto 0) & fifo_data_to_core(31 downto 24) & fifo_data_to_core(23 downto 16),
            --valid_i => input_fifo_valid,
            data_i => ycrcb_x,
            valid_i => ycrcb_valid_x,
            ce_o => open,
            done_o => open,
            data_o => core_dout,
            valid_o => core_dout_valid
        );

        output_memory : entity work.output_memory
        generic map (
            DIN_WIDTH => 256,
            DOUT_WIDTH => data_to_ft600'length,
            NUM_WRITE_WORDS => ((BLOCK_SIZE * 32)/256),
            NUM_READ_WORDS => ((BLOCK_SIZE * 32)/16)
            --DEPTH => BLOCK_SIZE
        )
        port map (
            rst_i => rst_x,
            
            -- Converting to 256b bus for output memory, may fix later but this keeps things simple
            data_i => core_dout,
            data_in_valid => core_dout_valid(0),
            write_clk_i => clk_x,
    
            reciever_ready_i => not ftdi_txe_n_i,
            data_o => data_to_ft600,
            data_out_valid => open,
            read_clk_i => ftdi_clk_i,
    
            memory_clear_o => fifo_clear
        );
    end generate;

end Behavioral;
