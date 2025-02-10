library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.math_real."ceil";
use IEEE.math_real."log2";

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
library UNISIM;
use UNISIM.VComponents.all;


entity statistics_core is
    generic (
        variance_depth  : integer := 1024;
        data_width      : integer := 11;
        depth_bits      : integer := integer(ceil(log2(real(variance_depth))))
    );
    port(
        clk_i       : in std_logic;
        ce_i        : in std_logic;
        rst_i       : in std_logic;

        data_i      : in signed((data_width-1) downto 0);
        valid_i     : in std_logic;

        var_o       : out std_logic_vector(15 downto 0);
        mean_o      : out std_logic_vector(15 downto 0);
        std_dev_o   : out std_logic_vector(15 downto 0);
        valid_o     : out std_logic
    );
end statistics_core;

architecture Behavioral of statistics_core is
    signal data_in_x        : signed((data_width-1) downto 0);
    signal ce_x             : std_logic;
    signal valid_x          : std_logic;
    signal input_ce_x       : std_logic;
    signal output_ce_x      : std_logic;

    signal dsp_vsum_tmp_X   : std_logic_vector(47 downto 0) := (others => '0');
    signal dsp_hsum_tmp_X   : std_logic_vector(47 downto 0) := (others => '0');
    signal dsp_var_tmp_x    : std_logic_vector(47 downto 0) := (others => '0');

    signal vsum             : unsigned(47 downto 0) := (others => '0');
    signal htsum            : signed(31 downto 0) := (others => '0');

    signal vsum_shifted     : unsigned(47 downto 0) := (others => '0'); 
    signal htsum_shifted    : signed(17 downto 0) := (others => '0');    
   
    signal counter          : unsigned(7 downto 0) := (others => '0');
    signal valid_counter    : unsigned(15 downto 0) := (others => '0');


    signal rst_acum_x       : std_logic := '0';
    signal hold_sum_x       : std_logic := '0';

    signal mean_delayed_x   : std_logic_vector(15 downto 0) := (others => '0');
    signal var_delayed_x    : std_logic_vector(15 downto 0) := (others => '0');
    signal std_dev_x        : std_logic_vector(15 downto 0) := (others => '0');
    signal hold_var_mean_x  : std_logic := '0';

    COMPONENT dsp_mac
    PORT (
        CLK : IN STD_LOGIC;
        CE  : IN STD_LOGIC;
        SCLR : IN STD_LOGIC;
        A : IN STD_LOGIC_VECTOR(10 DOWNTO 0);
        P : OUT STD_LOGIC_VECTOR(47 DOWNTO 0) 
    );
    END COMPONENT;

    COMPONENT dsp_acum
    PORT (
        CLK : IN STD_LOGIC;
        CE : IN STD_LOGIC;
        SCLR : IN STD_LOGIC;
        C : IN STD_LOGIC_VECTOR(10 DOWNTO 0);
        P : OUT STD_LOGIC_VECTOR(47 DOWNTO 0) 
    );
    END COMPONENT;

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


    -- Register ce signal
    process(clk_i, rst_i)
    begin
        if (rst_i = '1') then
            ce_x <= '0';
        elsif rising_edge(clk_i) then
            ce_x <= ce_i;
        end if;
    end process;

    -- Register input data
    process(clk_i, rst_i)
    begin
        if (rst_i = '1') then
            data_in_x <= (others => '0');
            valid_x <= '0';
        elsif rising_edge(clk_i) then
            if (valid_i = '1' and ce_i = '1') then
                valid_x <= '1';
                data_in_x <= data_i;
            elsif(input_ce_x = '0') then
                --valid_x <= '0';
                data_in_x <= (others => '0');
            else
                valid_x <= valid_x;
                data_in_x <= data_in_x;
            end if;
        end if;
    end process;

    -- Counter to clear acumulators 3 cycles after valid_i goes low
    process(clk_i, rst_i, valid_i)
        variable cycle_count : integer := variance_depth + 3;  -- Register to store previous valid_i value
    begin
        if (rst_i = '1' or valid_x = '0') then
            counter <= (others => '0');
            input_ce_x <= '1';
            rst_acum_x <= '0';
        elsif rising_edge(clk_i) then
            if (ce_x = '1') then
                if (counter = cycle_count - 1) then
                    rst_acum_x <= '1';
                    counter <= (others => '0');
                else
                    counter <= counter + 1;
                    rst_acum_x <= '0';
                end if;

                if (counter >= cycle_count - 4) then
                    input_ce_x <= '0';
                else
                    input_ce_x <= '1';
                end if;
            else
                counter <= counter;
                rst_acum_x <= rst_acum_x;
            end if;
        end if;
    end process;

    -- counter to generate clock enable for output
    process(clk_i, rst_i)
        variable counter : integer := 0;
    begin
        if (rst_i = '1') then
            counter := 0;
            output_ce_x <= '0';
        elsif rising_edge(clk_i) then
            if (ce_x = '1') then
                if (counter = (variance_depth + 11)) then
                    counter := 0;
                    output_ce_x <= '1';
                else
                    counter := counter + 1;
                    output_ce_x <= '0';
                end if;
            else
                output_ce_x <= output_ce_x;
            end if;
        end if;
    end process;

    -- DSP MAC - Performs vsum = vsum + d_in^2
    dsp_vsum_mac : dsp_mac
    PORT MAP (
        CLK => clk_i,
        CE => ce_x,
        SCLR => rst_i or rst_acum_x,
        A => std_logic_vector(data_in_x),
        P => dsp_vsum_tmp_X
    );

    -- DSP ACUM - Performs htsum = htsum + data_in
    dsp_hsum_acum : dsp_acum
    PORT MAP (
        CLK => clk_i,
        CE => ce_x,
        SCLR => rst_i or rst_acum_x,
        C => std_logic_vector(data_in_x),
        P => dsp_hsum_tmp_X
    );

    -- Bit shift
    process(clk_i, rst_i, valid_i)
    begin
        if (rst_i = '1' or valid_x = '0') then
            vsum_shifted <= (others => '0');
            htsum_shifted <= (others => '0');
        elsif rising_edge(clk_i) then
            if (ce_x = '1') then
                vsum_shifted <= unsigned(dsp_vsum_tmp_X) srl depth_bits;
                htsum_shifted <= resize(signed(dsp_hsum_tmp_X), 18) sra depth_bits;
            else
                vsum_shifted <= vsum_shifted;
                htsum_shifted <= htsum_shifted;
            end if;
        end if;
    end process;

    -- Final variance calculation DSP - performs P = C - A*A
    dsp_var_msub : dsp_msub
    PORT MAP (
      CLK => clk_i,
      CE => ce_x,
      SCLR => rst_i,
      A => std_logic_vector(htsum_shifted),
      C => std_logic_vector(vsum_shifted),
      P => dsp_var_tmp_x
    );

    mean_shift_reg : entity work.data_delay_reg
    generic map (
        SHIFT_DEPTH => 7,
        DATA_WIDTH => 16
    )
    port map (
        clk_i => clk_i,
        ce_i => ce_x,
        rst_i => rst_i,
        data_i => std_logic_vector(resize(htsum_shifted, 16)),
        data_o => mean_delayed_x
    );

    var_shift_reg : entity work.data_delay_reg
    generic map (
        SHIFT_DEPTH => 3,
        DATA_WIDTH => 16
    )
    port map (
        clk_i => clk_i,
        ce_i => ce_x,
        rst_i => rst_i,
        data_i => std_logic_vector(resize(shift_right(unsigned(dsp_var_tmp_x), 4), 16)),
        data_o => var_delayed_x
    );

    std_dev_sqrt : sqrt_cordic
    PORT MAP (
        aclk => clk_i,
        aclken => ce_x,
        aresetn => not (rst_i),
        s_axis_cartesian_tvalid => '1',
        s_axis_cartesian_tdata => std_logic_vector(resize(shift_right(unsigned(dsp_var_tmp_x), 4), 16)),
        m_axis_dout_tvalid => open,
        m_axis_dout_tdata => std_dev_x
    );

    -- Final result, set valid for one clock cycle when valid_x goes high then hold until valid_x goes low
    -- Counter and output registers for valid delay
    process(clk_i, rst_i)
    begin
        if (rst_i = '1') then
            valid_counter <= (others => '0');
            valid_o <= '0';
            mean_o <= (others => '0');
            var_o <= (others => '0');
            std_dev_o <= (others => '0');
        elsif rising_edge(clk_i) then
            if (output_ce_x = '1') then
                valid_o <= '1'; 
                mean_o <= mean_delayed_x;
                var_o <= var_delayed_x;
                std_dev_o <= std_dev_x;
            else
                valid_counter <= valid_counter;
                mean_o <= mean_o; 
                var_o <= var_o;
                std_dev_o <= std_dev_o;
            end if;
        end if;
    end process;
end Behavioral;