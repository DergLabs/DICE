----------------------------------------------------------------------------------
-- Company: Drexel University
-- Engineer: John Hofmeyr, Claudia Offutt
-- 
-- Create Date: 01/12/2025 07:28:33 PM
-- Last Updated Date: 4/28/2025
-- Design Name: 
-- Module Name: Statistics Core - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: Implements Mean, Variance and Std. Dev Calculation
--              Total Latency = # of values (defined by variance width) + 8 clock cycles
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.math_real.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
library UNISIM;
use UNISIM.VComponents.all;


entity statistics_core is
    generic (
        G_VARIANCE_DEPTH  : integer := 1024;
        G_DATA_WIDTH      : integer := 11;
        G_DEPTH_BITS      : integer := integer(ceil(log2(real(G_VARIANCE_DEPTH))))
    );
    port(
        clk_i       : in std_logic;
        ce_i        : in std_logic;
        rst_i       : in std_logic;

        data_i      : in signed((G_DATA_WIDTH-1) downto 0);
        valid_i     : in std_logic;

        var_o       : out std_logic_vector(15 downto 0);
        mean_o      : out std_logic_vector(15 downto 0);
        std_dev_o   : out std_logic_vector(15 downto 0);
        valid_o     : out std_logic
    );
end statistics_core;

architecture Behavioral of statistics_core is
    type shift_reg is array (natural range <>) of std_logic;
    constant C_SUM_WIDTH            : integer := 48;
    constant C_NUM_SAMPLES          : integer := 28; -- Number of samples for variance calculation
    constant C_SAMPLE_DIV           : signed(15 downto 0) := to_signed(2340, 16);


    signal ce_x                     : std_logic;
    signal valid_x                  : std_logic;

    signal dsp_vsum_tmp_x           : signed(C_SUM_WIDTH-1 downto 0) := (others => '0');
    signal dsp_vsum_valid_x         : std_logic := '0';
    signal dsp_vsum_valid_d3_r      : shift_reg(2 downto 0) := (others => '0');
    signal dsp_vsum_data_in_x       : signed((G_DATA_WIDTH-1) downto 0);

    signal dsp_hsum_tmp_x           : signed(C_SUM_WIDTH-1 downto 0) := (others => '0');
    signal dsp_hsum_valid_x         : std_logic := '0';
    signal dsp_hsum_valid_d2_r      : shift_reg(1 downto 0) := (others => '0');
    signal dsp_hsum_data_in_x       : signed((G_DATA_WIDTH-1) downto 0);

    signal dsp_var_tmp_x            : std_logic_vector(C_SUM_WIDTH-1 downto 0) := (others => '0');
    signal dsp_var_valid_d4_r       : shift_reg(3 downto 0) := (others => '0');

    signal vsum                     : unsigned(C_SUM_WIDTH-1 downto 0) := (others => '0');
    signal htsum                    : signed(31 downto 0) := (others => '0');

    signal vsum_shifted             : unsigned(C_SUM_WIDTH-1 downto 0) := (others => '0');
    signal vsum_multiplied          : unsigned(63 downto 0) := (others => '0');
    signal vsum_shifted_valid_r     : std_logic := '0'; 

    signal htsum_shifted            : signed(17 downto 0) := (others => '0');
    signal htsum_multiplied         : signed(63 downto 0) := (others => '0');
    signal htsum_shifted_valid_r    : std_logic := '0';

    signal mean_r                   : std_logic_vector(15 downto 0) := (others => '0');
    signal mean_valid_r             : std_logic := '0';
    signal var_x                    : std_logic_vector(15 downto 0) := (others => '0');
    signal var_valid_x              : std_logic := '0';
    signal std_dev_x                : std_logic_vector(15 downto 0) := (others => '0');
    signal std_dev_valid_x          : std_logic := '0';
    signal hold_var_mean_x          : std_logic := '0';

    -- SQRT Cordic IP Block
    COMPONENT sqrt_cordic
    PORT (
        aclk : IN STD_LOGIC;
        aclken : IN STD_LOGIC;
        aresetn : IN STD_LOGIC;
        s_axis_cartesian_tvalid : IN STD_LOGIC;
        s_axis_cartesian_tdata : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
        m_axis_dout_tvalid : OUT STD_LOGIC;
        m_axis_dout_tdata : OUT STD_LOGIC_VECTOR(15 DOWNTO 0) 
    );
    END COMPONENT;

begin

    ce_x <= ce_i;

    -- if data is valid, send to accumulator. otherwise send 0's (to hold prev sum)
    process(clk_i)
    begin
        if rising_edge(clk_i) then
            if valid_i = '1' then
                dsp_vsum_data_in_x <= data_i;
                dsp_hsum_data_in_x <= data_i;
            else 
                dsp_vsum_data_in_x <= (others => '0');
                dsp_hsum_data_in_x <= (others => '0');
            end if;

            valid_x <= valid_i;

        end if;
    end process;
    

    -------------------- VSUM MAC Logic --------------------
    vsum_valid_p : entity work.data_delay_reg
    generic map (
        SHIFT_DEPTH => 3,
        DATA_WIDTH => 1
    )
    port map (
        clk_i => clk_i,
        ce_i => '1',
        rst_i => rst_i,
        data_i(0) => valid_x,
        data_o(0) => dsp_vsum_valid_x
    );

    
    -- DSP MAC - Performs vsum = vsum + a*b - 3 cycles latency - updated to behavioral
    dsp_vsum_mac : entity work.dsp_mac
    GENERIC MAP (
        SIZEIN => G_DATA_WIDTH,
        SIZEOUT => C_SUM_WIDTH
    )
    PORT MAP (
        clk => clk_i,
        rst => rst_i,
        ce => ce_x,
        sload => rst_i,
        a => dsp_vsum_data_in_x,
        b => dsp_vsum_data_in_x,
        accum_out => dsp_vsum_tmp_x
    );

    -------------------- HSUM ACUM Logic --------------------
    -- ACUM - Performs htsum = htsum + data_in - 2 cycles latency - updated to behavioral
    hsum_acum_i : entity work.dsp_acum
    generic map (
        SIZEIN =>   G_DATA_WIDTH, -- width of the inputs
        SIZEOUT =>  C_SUM_WIDTH  -- width of the output
    )
    port map (
        clk => clk_i,
        rst => rst_i,
        ce => ce_x,
        sload => rst_i,
        a => dsp_hsum_data_in_x,
        accum_out => dsp_hsum_tmp_x
    );

    -- delay valid signal to match the output data from the hsum acum
    hsum_valid_p : entity work.data_delay_reg
    generic map (
        SHIFT_DEPTH => 2,
        DATA_WIDTH => 1
    )
    port map (
        clk_i => clk_i,
        ce_i => '1',
        rst_i => rst_i,
        data_i(0) => valid_x,
        data_o(0) => dsp_hsum_valid_x
    );

    -- delay mean valid signal
    mean_valid_p : entity work.data_delay_reg
    generic map (
        SHIFT_DEPTH => 3,
        DATA_WIDTH => 1
    )
    port map (
        clk_i => clk_i,
        ce_i => '1',
        rst_i => rst_i,
        data_i(0) => dsp_hsum_valid_x,
        data_o(0) => mean_valid_r
    );

    -- compute divided hsum for mean, using fabric 
    process(clk_i)
    begin
        if rising_edge(clk_i) then
            if rst_i = '1' then
                htsum_multiplied <= (others => '0');
                htsum_shifted <= (others => '0');
                htsum_shifted_valid_r <= '0';
            else
                if dsp_hsum_valid_x = '1' then
                    -- multiply hsum by C_SAMPLE_DIV
                    htsum_multiplied <= dsp_hsum_tmp_x * C_SAMPLE_DIV;
                end if;

                -- shift right by 16
                htsum_shifted <= resize(shift_right(htsum_multiplied, 16), 18);
                -- set mean
                mean_r <= std_logic_vector(resize(htsum_shifted, 16));
            end if;
        end if;
    end process;


    -- compute divided vsum
    process(clk_i)
    begin
        if rising_edge(clk_i) then
            if rst_i = '1' then
                vsum_multiplied <= (others => '0');
                vsum_shifted <= (others => '0');
            else
                if dsp_vsum_valid_x = '1' then
                    -- multiply vsum by C_SAMPLE_DIV
                    vsum_multiplied <= unsigned(dsp_vsum_tmp_x * C_SAMPLE_DIV);
                end if;
                    -- shift right by 16
                vsum_shifted <= resize(shift_right(vsum_multiplied, 16), C_SUM_WIDTH);
            end if;
        end if;
    end process;

    dsp_var_msub : entity work.dsp_msub
    generic map (
        AWIDTH => 16, -- width of A input
        CWIDTH => C_SUM_WIDTH  -- width of C input
    )
    port map(
        clk => clk_i,
        ce => ce_x,
        rst => rst_i,
        ain => std_logic_vector(mean_r),
        cin => std_logic_vector(vsum_shifted),
        pout => dsp_var_tmp_x
    );

    var_valid_delay : entity work.data_delay_reg
    generic map (
        SHIFT_DEPTH => 6,
        DATA_WIDTH => 1
    )
    port map (
        clk_i => clk_i,
        ce_i => '1',
        rst_i => rst_i,
        data_i(0) => dsp_vsum_valid_x,
        data_o(0) => var_valid_x
    );

    var_x <= std_logic_vector(resize(shift_right(unsigned(dsp_var_tmp_x), 2), 16));

    -- std dev calculations. 5 cycles latency
    std_dev_sqrt : sqrt_cordic
    PORT MAP (
        aclk => clk_i,
        aclken => ce_x,
        aresetn => not (rst_i),
        s_axis_cartesian_tvalid => var_valid_x,
        s_axis_cartesian_tdata => std_logic_vector(resize(shift_right(unsigned(dsp_var_tmp_x), 4), 16)),
        m_axis_dout_tvalid => std_dev_valid_x,
        m_axis_dout_tdata => std_dev_x
    );

    -- Final result, set valid for one clock cycle when valid_x goes high then hold until valid_x goes low
    -- Counter and output registers for valid delay
    process(clk_i, rst_i)
    begin
        if (rst_i = '1') then
            valid_o <= '0';
            mean_o <= (others => '0');
            var_o <= (others => '0');
            std_dev_o <= (others => '0');
        elsif rising_edge(clk_i) then
            if (std_dev_valid_x = '1' and mean_valid_r = '1') then
                valid_o <= '1'; 
                mean_o <= mean_r;
                var_o <= var_x;
                std_dev_o <= std_dev_x;
            else
                valid_o <= '0';
                mean_o <= mean_o; 
                var_o <= var_o;
                std_dev_o <= std_dev_o;
            end if;
        end if;
    end process;

end Behavioral;