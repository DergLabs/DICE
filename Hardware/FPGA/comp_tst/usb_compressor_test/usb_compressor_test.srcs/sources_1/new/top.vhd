----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/25/2025 05:18:28 PM
-- Design Name: 
-- Module Name: top - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
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

entity top is
    generic (
        NUM_CHANNELS : integer := 2
    );
    port ( 
        -- Inputs
        --clk_100m            : in std_logic;
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

    signal sys_clk_ibuf_x       : std_logic; -- IBUFDS 200MHz Clock to global buffer
    signal sys_clk_bufg_x       : std_logic; -- Global buffer output to MMCM and logic

    signal data_to_ft600 : std_logic_vector(15 downto 0);
    signal be_to_ft600 : std_logic_vector(1 downto 0);

    signal data_from_ft600 : std_logic_vector(15 downto 0);
    signal be_from_ft600 : std_logic_vector(1 downto 0);

    signal data_in_valid : std_logic;  -- Data from FT600 is valid
    signal data_out_valid : std_logic; -- Data to FT600 is valid

    signal fifo_data_o : std_logic_vector(31 downto 0);
    signal fifo_byte_selector : std_logic := '0';
    signal fifo_read_enable : std_logic := '0';
    signal fifo_full : std_logic;
    signal fifo_empty : std_logic;
    signal fifo_valid : std_logic;
    signal wr_rst_busy : std_logic;
    signal rd_rst_busy : std_logic;

    signal pixel_data : std_logic_vector(15 downto 0);

    signal processor_output : std_logic_vector((NUM_CHANNELS*64)-1 downto 0);
    signal processor_valid : std_logic_vector(NUM_CHANNELS-1 downto 0);

    signal uram_out_addr : std_logic_vector(2 downto 0);
    signal uram_output_data_o : std_logic_vector((NUM_CHANNELS*64)-1 downto 0);

    signal shift_reg_en : std_logic;

    signal processor_ce : std_logic_vector(NUM_CHANNELS-1 downto 0);

    signal uram_addr1 : std_logic_vector(2 downto 0);
    signal uram_addr2 : std_logic_vector(2 downto 0);
    signal output_ce : std_logic;
    signal core_done : std_logic_vector(NUM_CHANNELS-1 downto 0);
    signal output_word_select : unsigned(7 downto 0);
    signal begin_word_select : std_logic;   
    signal word_select_en : std_logic;

    --signal pixel_counter_x : unsigned(15 downto 0) := (others => '0');
    --signal vaid_counter_x : unsigned(15 downto 0) := (others => '0');
    signal data_x : std_logic_vector(31 downto 0);
    signal valid_x : std_logic := '0';
    signal core_data_valid : std_logic;
    signal data_out_valid_delay : std_logic;    

    signal rst_x : std_logic;
    signal data_out_to_fifo : std_logic_vector(15 downto 0);
    signal rd_en_x : std_logic;
    signal fifo_full_x : std_logic;
    signal fifo_empty_x : std_logic;
    signal fifo_wr_rst_busy : std_logic;
    signal fifo_rd_rst_busy : std_logic;
    
    component clk_wiz_0
    port
    (-- Clock in ports
    -- Clock out ports
    clk_out1          : out    std_logic;
    clk_out2          : out    std_logic;
    -- Status and control signals
    reset             : in     std_logic;
    locked            : out    std_logic;
    clk_in1         : in     std_logic
    );
    end component;

    signal clk_200m : std_logic;
    signal clk_100m : std_logic;
    signal locked : std_logic;

    /*COMPONENT ila_0
    PORT (
        clk : IN STD_LOGIC;



        probe0 : IN STD_LOGIC; 
        probe1 : IN STD_LOGIC_VECTOR(31 DOWNTO 0); 
        probe2 : IN STD_LOGIC_VECTOR(23 DOWNTO 0); 
        probe3 : IN STD_LOGIC_VECTOR(15 DOWNTO 0); 
        probe4 : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
        probe5 : IN STD_LOGIC;
        probe6 : IN STD_LOGIC;
        probe7 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
        probe8 : IN STD_LOGIC;
        probe9 : IN STD_LOGIC;
        probe10 : IN STD_LOGIC;
        probe11 : IN STD_LOGIC;
        probe12 : IN STD_LOGIC_VECTOR(2 DOWNTO 0)
    );
    END COMPONENT;*/

    COMPONENT fifo_generator_1
    PORT (
        rst : IN STD_LOGIC;
        wr_clk : IN STD_LOGIC;
        rd_clk : IN STD_LOGIC;
        din : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
        wr_en : IN STD_LOGIC;
        rd_en : IN STD_LOGIC;
        dout : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
        full : OUT STD_LOGIC;
        empty : OUT STD_LOGIC 
    );
    END COMPONENT;

begin
    rst_x <= not rst_i;
    
    /*ila : ila_0
    PORT MAP (
        clk => clk_200m,



        probe0 => rd_en_x, 
        probe1 => data_x, 
        probe2 => pixel_data & X"00", 
        probe3 => data_to_ft600, 
        probe4 => std_logic_vector(output_word_select),
        probe5 => begin_word_select,
        probe6 => data_in_valid,
        probe7 => data_from_ft600,
        probe8 => clk_100m,
        probe9 => valid_x,
        probe10 => fifo_byte_selector,
        probe11 => core_data_valid,
        probe12 => uram_addr2
    );*/

    IBUFDS_inst : IBUFDS
    port map (
        O => sys_clk_ibuf_x,   -- 1-bit output: Buffer output
        I => sysclk_p,   -- 1-bit input: Diff_p buffer input (connect directly to top-level port)
        IB => sysclk_n  -- 1-bit input: Diff_n buffer input (connect directly to top-level port)
    );

    -- MMCM instantiation
    sys_clk : clk_wiz_0
    port map ( 
        -- Clock out ports  
        clk_out1 => clk_200m, 
        clk_out2 => clk_100m,
        -- Status and control signals                
        reset => rst_x,
        locked => locked,
        -- Clock in ports
        clk_in1 => sys_clk_ibuf_x
    );

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

        ready_to_recieve => data_out_valid, -- Data from BRAM is valid and ready to send to FT600
        ready_to_send => data_in_valid -- Data from FT600 is valid and ready to send to BRAM
    );

    -- Shift register to hold incoming pixel data
    /*process(clk_100m, rst_x)
    begin
        if (rst_x = '1') then
            data_x <= (others => '0');
        elsif rising_edge(clk_100m) then
            if (data_in_valid = '1') then
                --valid_x <= '1';
                -- shift data in right to left (LSB to MSB)
                data_x <= data_x(15 downto 0) & data_from_ft600;
                --shift data in left to right (MSB to LSB)
                --data_x <= data_i & data_x((IN_WIDTH*DEPTH)-1 downto IN_WIDTH);
            else
                --valid_x <= '0';
                data_x <= data_x;
            end if;
        end if;
    end process;

    process(clk_100m, rst_x)
    begin
        if (rst_x = '1') then
            valid_x <= '0';
        elsif rising_edge(clk_100m) then
            if (data_in_valid = '1') then
                valid_x <= '1';
            else
                valid_x <= '0';
            end if;
        end if;

    -- MUX to select correct bytes from shift reg output
    process(clk_100m, rst_x)
    begin
        if (rst_x = '1') then
            fifo_byte_selector <= '0';
        elsif rising_edge(clk_100m) then
            if (valid_x = '1') then
                fifo_byte_selector <= not fifo_byte_selector;
            else
                fifo_byte_selector <= fifo_byte_selector;
            end if;
        end if;
    end process;

    with fifo_byte_selector select
        pixel_data <= data_x(31 downto 16) when '1',
                    data_x(15 downto 0) when others;
    */

    input_cdc_fifo : fifo_generator_1
    PORT MAP (
        rst => rst_x,
        wr_clk => ftdi_clk_i,
        rd_clk => clk_100m,
        din => data_from_ft600,
        wr_en => data_in_valid,
        rd_en => '1',
        dout => pixel_data,
        full => fifo_full,
        empty => fifo_empty
    );

    core_en_delay : entity work.data_delay_reg
    generic map (
        SHIFT_DEPTH => 8,
        DATA_WIDTH => 1
    )
    port map (
        clk_i => clk_100m,
        ce_i => '1',
        rst_i => rst_x,
        data_i(0) => data_in_valid,
        data_o(0) => valid_x
    );

    /*process(clk_100m, rst_x)
    begin
        if (rst_x = '1') then
            valid_x <= '0';
        elsif rising_edge(clk_100m) then
            if (data_in_valid = '1') then
                valid_x <= '1';
            else
                valid_x <= '0';
            end if;
        end if;
    end process;

    process(clk_100m, rst_x)
    begin
        if (rst_x = '1') then
            pixel_data <= (others => '0');
        elsif rising_edge(clk_100m) then
            if (valid_x = '1') then
                pixel_data <= data_from_ft600;
            else
                pixel_data <= pixel_data;
            end if;
        end if;
    end process;*/

    process(clk_100m, rst_x)
        constant NUM_PIXELS : integer := 66;
        variable counter : integer := 0;
    begin
        if (rst_x = '1') then
            core_data_valid <= '0';
            counter := 0;
        elsif rising_edge(clk_100m) then
            if (valid_x = '1') then
                if (counter = NUM_PIXELS - 1) then
                    counter := NUM_PIXELS - 1;
                else
                    counter := counter + 1;
                end if;

                if (counter = NUM_PIXELS - 1) then
                    core_data_valid <= '0';
                else
                    core_data_valid <= '1';
                end if;
            else
                core_data_valid <= '0';
                counter := 0;
            end if;
        end if;
    end process;

    -- delay we signal by 1 cycle 
    /*core_en_delay : entity work.data_delay_reg
    generic map (
        SHIFT_DEPTH => 1,
        DATA_WIDTH => 1
    )
    port map (
        clk_i => clk_100m,
        ce_i => '1',
        rst_i => rst_x,
        data_i(0) => valid_x,
        data_o(0) => core_data_valid
    );*/

    -- Image compression core
    compression_core : entity work.multi_core_test
    generic map (
        NUM_CHANNELS => NUM_CHANNELS
    )
    port map (
        clk_i => clk_100m,
        rst_i => rst_x,
        data_i => pixel_data,
        valid_i => core_data_valid,
        ce_o => processor_ce,
        done_o => core_done,
        data_o => processor_output,
        valid_o => processor_valid
    );

    --delay core done signal to output word select
    out_sel_en_delay : entity work.data_delay_reg
    generic map (
        SHIFT_DEPTH => 6,
        DATA_WIDTH => 1
    )
    port map (
        clk_i => clk_100m,
        ce_i => '1',
        rst_i => rst_x,
        data_i(0) => core_done(0),
        data_o(0) => begin_word_select
    );

    -- Counter to increment output memory address for loading in data, runs at 1/8th clk
    process(clk_100m, rst_x)
        variable clk_div : integer := 8;
        variable counter : integer := 0;
    begin
        if rst_x = '1' then
            counter := 0;
            uram_addr1 <= (others => '0');
        elsif rising_edge(clk_100m) then
            if (processor_ce(0) = '1' and processor_valid(0) = '1') then
                if counter = clk_div - 1 then
                    counter := 0;
                    uram_addr1 <= (others => '0');
                else
                    counter := counter + 1;
                    uram_addr1 <= std_logic_vector(unsigned(uram_addr1) + 1);
                end if;
            else
                uram_addr1 <= uram_addr1;
                counter := 0;
            end if;
        end if;
    end process;

    -- delay data_out_valid signal by one cycle 
    process(clk_100m, rst_x)
    begin
        if (rst_x = '1') then
            data_out_valid_delay <= '0';
        elsif rising_edge(clk_100m) then
            data_out_valid_delay <= data_out_valid;
        end if;
    end process;
    

    -- Counter to increment output memory address for loading in data, runs at 1/12th clk
    process(clk_100m, rst_x)
        variable clk_div : integer := 8;
        variable counter2 : integer := 0;
    begin
        if rst_x = '1' then
            counter2 := 0;
            uram_addr2 <= (others => '0');
        elsif rising_edge(clk_100m) then
            if (begin_word_select = '1' and processor_valid(0) = '1' and data_out_valid = '1') then
                if counter2 = clk_div - 1 then
                    counter2 := 0;
                    if uram_addr2 = "111" then
                        uram_addr2 <= (others => '0');
                    else
                        uram_addr2 <= std_logic_vector(unsigned(uram_addr2) + 1);
                    end if;
                else
                    counter2 := counter2 + 1;
                end if;
            else
                counter2 := 0;
            end if;
        end if;
    end process;

    -- Switch to slower read clock once core is done
    with begin_word_select select
        uram_out_addr <=  uram_addr1 when '0',
                        uram_addr2 when others;

    ultra_ram_pixel_output_buffer : entity work.ultra_ram_buffer
    generic map (
        AWIDTH => 3, -- 512 elements for 3*64b output
        DWIDTH => 128, -- Data width of 24 bits, 8bpc
        NBPIPE => 1 -- # of pipeline registers
    )
    port map (
        clk => clk_100m,
        we => processor_ce(0),
        mem_en => '1',
        din => processor_output,
        addr => uram_out_addr(2 downto 0),
        dout => uram_output_data_o
    );

    --delay core done signal to align word select with ram output
    word_sel_delay : entity work.data_delay_reg
    generic map (
        SHIFT_DEPTH => 2,
        DATA_WIDTH => 1
    )
    port map (
        clk_i => clk_100m,
        ce_i => data_out_valid_delay,
        rst_i => rst_x,
        data_i(0) => begin_word_select,
        data_o(0) => word_select_en
    );

    -- Output word select counter
    process(clk_100m, rst_x)
    variable clk_div : integer := 8;
    begin
        if rst_x = '1' then
            output_word_select <= (others => '0');
        elsif rising_edge(clk_100m) then
            if (word_select_en = '1' and processor_valid(0) = '1') then
                if output_word_select = clk_div - 1 then
                    output_word_select <= (others => '0');
                else
                    output_word_select <= output_word_select + 1;
                end if;
            else
                output_word_select <= (others => '0');
            end if;
        end if;
    end process;

    /*with output_word_select select
        data_out_to_fifo <= uram_output_data_o(15 downto 0) when X"00",
                        uram_output_data_o(31 downto 16) when X"01",
                        uram_output_data_o(47 downto 32) when X"02",
                        uram_output_data_o(63 downto 48) when X"03",
                        uram_output_data_o(79 downto 64) when X"04",
                        uram_output_data_o(95 downto 80) when X"05",
                        uram_output_data_o(111 downto 96) when X"06",
                        uram_output_data_o(127 downto 112) when X"07",
                        uram_output_data_o(143 downto 128) when X"08",
                        uram_output_data_o(159 downto 144) when X"09",
                        uram_output_data_o(175 downto 160) when X"0A",
                        uram_output_data_o(191 downto 176) when others;*/

    with output_word_select select
    data_out_to_fifo <= uram_output_data_o(15 downto 0) when X"00",
                    uram_output_data_o(31 downto 16) when X"01",
                    uram_output_data_o(47 downto 32) when X"02",
                    uram_output_data_o(63 downto 48) when X"03",
                    uram_output_data_o(79 downto 64) when X"04",
                    uram_output_data_o(95 downto 80) when X"05",
                    uram_output_data_o(111 downto 96) when X"06",
                    uram_output_data_o(127 downto 112) when others;
    
    dout_valid_delay : entity work.data_delay_reg
    generic map (
        SHIFT_DEPTH => 4,
        DATA_WIDTH => 1
    )
    port map (
        clk_i => clk_100m,
        ce_i => '1',
        rst_i => rst_x,
        data_i(0) => data_out_valid,
        data_o(0) => rd_en_x
    );

                        
    output_cdc_fifo : fifo_generator_1
    PORT MAP (
        rst => rst_x,
        wr_clk => clk_100m,
        rd_clk => ftdi_clk_i,
        din => data_out_to_fifo,
        wr_en => word_select_en,
        rd_en => rd_en_x,
        dout => data_to_ft600,
        full => fifo_full_x,
        empty => fifo_empty_x
    );

end Behavioral;
