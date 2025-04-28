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
    constant C_SUM_WIDTH    : integer := 48;

    signal ce_x             : std_logic;

    signal dsp_vsum_tmp_X   : signed(C_SUM_WIDTH-1 downto 0) := (others => '0');
    signal dsp_vsum_valid_d3_r : shift_reg(2 downto 0) := (others => '0');
    signal dsp_vsum_data_in_x : signed((G_DATA_WIDTH-1) downto 0);

    signal dsp_hsum_tmp_x   : signed(C_SUM_WIDTH-1 downto 0) := (others => '0');
    signal dsp_hsum_valid_d2_r : shift_reg(1 downto 0) := (others => '0');
    signal dsp_hsum_data_in_x : signed((G_DATA_WIDTH-1) downto 0);

    signal dsp_var_tmp_x    : std_logic_vector(C_SUM_WIDTH-1 downto 0) := (others => '0');
    signal dsp_var_valid_d4_r : shift_reg(3 downto 0) := (others => '0');

    signal vsum             : unsigned(C_SUM_WIDTH-1 downto 0) := (others => '0');
    signal htsum            : signed(31 downto 0) := (others => '0');

    signal vsum_shifted     : unsigned(C_SUM_WIDTH-1 downto 0) := (others => '0');
    signal vsum_shifted_valid_r : std_logic := '0'; 
    signal htsum_shifted    : signed(17 downto 0) := (others => '0');
    signal htsum_shifted_valid_r : std_logic := '0';

    signal mean_r           : std_logic_vector(15 downto 0) := (others => '0');
    signal mean_valid_r     : std_logic := '0';
    signal var_x            : std_logic_vector(15 downto 0) := (others => '0');
    signal var_valid_x      : std_logic := '0';
    signal std_dev_x        : std_logic_vector(15 downto 0) := (others => '0');
    signal std_dev_valid_x  : std_logic := '0';
    signal hold_var_mean_x  : std_logic := '0';

    component dsp_mac
    generic (
        SIZEIN  : natural; -- width of the inputs
        SIZEOUT : natural  -- width of the output
    );
    port (
        clk         : in std_logic;
        rst         : in std_logic;
        ce          : in std_logic;
        sload       : in  std_logic;
        a           : in  signed (SIZEIN-1 downto 0);
        b           : in  signed (SIZEIN-1 downto 0);
        accum_out   : out signed (SIZEOUT-1 downto 0));
    end component;

    component dsp_acum
      generic (
        SIZEIN  : natural := 16; -- width of the inputs
        SIZEOUT : natural := 40  -- width of the output
      );
      port (
        clk         : in std_logic;
        rst         : in std_logic;
        ce          : in std_logic;
        sload       : in  std_logic;
        a           : in  signed (SIZEIN-1 downto 0);
        accum_out   : out signed (SIZEOUT-1 downto 0));
    end component;

    -- Multiply subtract block, C-A*A
    COMPONENT dsp_msub
    PORT (
        CLK : IN STD_LOGIC;
        CE : IN STD_LOGIC;
        SCLR : IN STD_LOGIC;
        A : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
        C : IN STD_LOGIC_VECTOR(47 DOWNTO 0);
        P : OUT STD_LOGIC_VECTOR(47 DOWNTO 0) 
    );
    END COMPONENT;

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

    -------------------- VSUM MAC Logic --------------------
    -- valid goes through 3 delay cycles to match up with the output data from the dsp mac
    vsum_valid_p: process(clk_i)
    begin
        if (rising_edge(clk_i)) then
            dsp_vsum_valid_d3_r(0) <= valid_i;
            for i in 1 to dsp_vsum_valid_d3_r'high loop
                dsp_vsum_valid_d3_r(i) <= dsp_vsum_valid_d3_r(i-1);
            end loop;
        end if;
    end process;

    -- if data is valid, send to accumulator. otherwise send 0's (to hold prev sum)
    vsum_data_p : process(all)
    begin
        if valid_i then
            dsp_vsum_data_in_x <= data_i;
        else
            dsp_vsum_data_in_x <= (others => '0');
        end if;
    end process;

    -- DSP MAC - Performs vsum = vsum + a*b - 3 cycles latency - updated to behavioral
    dsp_vsum_mac : dsp_mac
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
        accum_out => dsp_vsum_tmp_X
    );

    -------------------- HSUM ACUM Logic --------------------
    -- valid goes through 2 delay cycles to match up with the output data from the dsp mac
    hsum_valid_p: process(clk_i)
    begin
        if (rising_edge(clk_i)) then
            dsp_hsum_valid_d2_r(0) <= valid_i;
            for i in 1 to dsp_hsum_valid_d2_r'high loop
                dsp_hsum_valid_d2_r(i) <= dsp_hsum_valid_d2_r(i-1);
            end loop;
        end if;
    end process;

    -- if data is valid, send to accumulator. otherwise send 0's (to hold prev sum)
    hsum_data_p : process(all)
    begin
        if valid_i then
            dsp_hsum_data_in_x <= data_i;
        else
            dsp_hsum_data_in_x <= (others => '0');
        end if;
    end process;

    -- ACUM - Performs htsum = htsum + data_in - 2 cycles latency - updated to behavioral
    hsum_acum_i : dsp_acum
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
        accum_out => dsp_hsum_tmp_X
    );

    -- propogate bit shifted values - 1 cycle latency
    process(clk_i)
    begin
        if rising_edge(clk_i) then
            if (rst_i = '1') then
                vsum_shifted <= (others => '0');
                htsum_shifted_valid_r <= '0';
                htsum_shifted <= (others => '0');
                vsum_shifted_valid_r <= '0';
                mean_r <= (others => '0');
                mean_valid_r <= '0';
            elsif (ce_x = '1') then
                if htsum_shifted_valid_r then
                    mean_r <= std_logic_vector(resize(htsum_shifted, 16));
                    mean_valid_r <= '1';
                end if;
                htsum_shifted <= shift_right(resize(signed(dsp_hsum_tmp_X), 18), G_DEPTH_BITS);
                htsum_shifted_valid_r <= dsp_hsum_valid_d2_r(dsp_hsum_valid_d2_r'high);
                vsum_shifted <= shift_right(unsigned(dsp_vsum_tmp_X), G_DEPTH_BITS);
                vsum_shifted_valid_r <= dsp_vsum_valid_d3_r(dsp_vsum_valid_d3_r'high);
            end if;
        end if;
    end process;

    -- vsum always updates 1 cycle later than hsum, so that valid is carried
    -- 3 cycles of latency to match the variance dsp
    var_valid_p: process(clk_i)
    begin
        if (rising_edge(clk_i)) then
            dsp_var_valid_d4_r(0) <= vsum_shifted_valid_r;
            for i in 1 to dsp_var_valid_d4_r'high loop
                dsp_var_valid_d4_r(i) <= dsp_var_valid_d4_r(i-1);
            end loop;
        end if;
    end process;

    -- Final variance calculation DSP - performs P = C - (A*A) - 3 cycles latency - left as IP
    dsp_var_msub : dsp_msub
    PORT MAP (
      CLK => clk_i,
      CE => ce_x,
      SCLR => rst_i,
      A => std_logic_vector(htsum_shifted),
      C => std_logic_vector(vsum_shifted),
      P => dsp_var_tmp_x
    );

    -- resize variance. 1 cycle latency
    var_shift_p : process(all)
    begin
        if rst_i then
            var_x <= (others => '0');
            var_valid_x <= '0';
        elsif dsp_var_valid_d4_r(dsp_var_valid_d4_r'high) then
            var_x <= std_logic_vector(resize(shift_right(unsigned(dsp_var_tmp_x), 4), 16));
            var_valid_x <= '1';
        else
            var_valid_x <= '0';
        end if;
    end process;

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