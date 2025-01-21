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


entity variance_core is
    generic (
        variance_depth  : integer := 1024;
        data_width      : integer := 11;
        depth_bits      : integer := integer(ceil(log2(real(variance_depth))))
    );
    port(
        clk_i       : in std_logic;
        rst_i       : in std_logic;

        data_i      : in signed((data_width-1) downto 0);
        valid_i     : in std_logic;

        var_o       : out std_logic_vector(15 downto 0);
        mean_o      : out std_logic_vector(15 downto 0);
        valid_o     : out std_logic
    );
end variance_core;

architecture Behavioral of variance_core is
    signal valid_x          : std_logic;

    signal data_in_x        : signed((data_width-1) downto 0);

    signal dsp_vsum_tmp_X   : std_logic_vector(47 downto 0) := (others => '0');
    signal dsp_hsum_tmp_X   : std_logic_vector(47 downto 0) := (others => '0');
    signal dsp_var_tmp_x    : std_logic_vector(47 downto 0) := (others => '0');

    signal vsum             : unsigned(47 downto 0) := (others => '0');
    signal htsum            : signed(31 downto 0) := (others => '0');

    signal vsum_shifted     : unsigned(47 downto 0) := (others => '0'); 
    signal htsum_shifted    : signed(17 downto 0) := (others => '0');    
   
    signal counter          : unsigned(3 downto 0) := (others => '0');

    signal rst_acum_x      : std_logic := '0';
    signal hold_sum_x       : std_logic := '0';

    signal mean_delayed_x  : std_logic_vector(15 downto 0) := (others => '0');

    signal clk_x            : std_logic;

    COMPONENT dsp_mac
    PORT (
        CLK : IN STD_LOGIC;
        SCLR : IN STD_LOGIC;
        A : IN STD_LOGIC_VECTOR(10 DOWNTO 0);
        P : OUT STD_LOGIC_VECTOR(47 DOWNTO 0) 
    );
    END COMPONENT;

    COMPONENT dsp_acum
    PORT (
        CLK : IN STD_LOGIC;
        SCLR : IN STD_LOGIC;
        C : IN STD_LOGIC_VECTOR(10 DOWNTO 0);
        P : OUT STD_LOGIC_VECTOR(47 DOWNTO 0) 
    );
    END COMPONENT;

    COMPONENT dsp_msub
    PORT (
        CLK : IN STD_LOGIC;
        SCLR : IN STD_LOGIC;
        A : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
        C : IN STD_LOGIC_VECTOR(47 DOWNTO 0);
        P : OUT STD_LOGIC_VECTOR(47 DOWNTO 0) 
    );
    END COMPONENT;

begin

    clk_x8_div : BUFGCE_DIV
    generic map (
       BUFGCE_DIVIDE => 8,              -- 1-8
       -- Programmable Inversion Attributes: Specifies built-in programmable inversion on specific pins
       IS_CE_INVERTED => '0',           -- Optional inversion for CE
       IS_CLR_INVERTED => '0',          -- Optional inversion for CLR
       IS_I_INVERTED => '0',            -- Optional inversion for I
       SIM_DEVICE => "ULTRASCALE_PLUS"  -- ULTRASCALE, ULTRASCALE_PLUS
    )
    port map (
       O => clk_x,     -- 1-bit output: Buffer
       CE => '1',   -- 1-bit input: Buffer enable
       CLR => '0', -- 1-bit input: Asynchronous clear
       I => clk_i      -- 1-bit input: Buffer
    );
 

    -- Delay path for valid input to valid output
    SRLC32E_inst : SRLC32E
    generic map (
        INIT => X"00000000",    -- Initial contents of shift register
        IS_CLK_INVERTED => '0'  -- Optional inversion for CLK
    )
    port map (
        Q => valid_x,     -- 1-bit output: SRL Data
        Q31 => open, -- 1-bit output: SRL Cascade Data
        A => 5b"10010",     -- 5-bit input: Selects SRL depth
        CE => '1',   -- 1-bit input: Clock enable
        CLK => clk_x, -- 1-bit input: Clock
        D => valid_i      -- 1-bit input: SRL Data
    );
   
    -- Register input data
    process(clk_x, rst_i)
    begin
        if (rst_i = '1') then
            data_in_x <= (others => '0');
        elsif rising_edge(clk_x) then
            if (valid_i = '1') then
                data_in_x <= data_i;
            else 
                data_in_x <= (others => '0');
            end if;
        end if;
    end process;

    -- DSP MAC - Performs vsum = vsum + d_in^2
    dsp_vsum_mac : dsp_mac
    PORT MAP (
        CLK => clk_x,
        SCLR => rst_i or rst_acum_x,
        A => std_logic_vector(data_in_x),
        P => dsp_vsum_tmp_X
    );

    -- DSP ACUM - Performs htsum = htsum + data_in
    dsp_hsum_acum : dsp_acum
    PORT MAP (
        CLK => clk_x,
        SCLR => rst_i or rst_acum_x,
        C => std_logic_vector(data_in_x),
        P => dsp_hsum_tmp_X
    );

    -- Counter to update hold registers & clear acumulators
    process(clk_x, rst_i, valid_i)
        --variable valid_prev : std_logic := '0';  -- Register to store previous valid_i value
    begin
        if (rst_i = '1' or valid_i = '1') then
            counter <= (others => '0');
            rst_acum_x <= '0';
            hold_sum_x <= '0';
        elsif rising_edge(clk_x) then
            if (counter = 3) then
                counter <= x"3";
                rst_acum_x <= '1';
                hold_sum_x <= rst_acum_x;
            else
                counter <= counter + 1;
                rst_acum_x <= '0';
                hold_sum_x <= '0';
            end if;
        end if;
    end process;


    -- Register acumulator data
    process(clk_x, rst_i, valid_i)
    begin
        if (rst_i = '1' or valid_i = '1') then
            vsum <= (others => '0');
            htsum <= (others => '0');
        elsif rising_edge(clk_x) then
            if (rst_acum_x = '1' and hold_sum_x = '0') then
                vsum <= unsigned(dsp_vsum_tmp_X);
                htsum <= resize(signed(dsp_hsum_tmp_X), 32);
            else
                vsum <= vsum;
                htsum <= htsum;
            end if;
        end if;
    end process;

    -- Bit shift
    process(clk_x, rst_i, valid_i)
    begin
        if (rst_i = '1' or valid_i = '1') then
            vsum_shifted <= (others => '0');
            htsum_shifted <= (others => '0');
        elsif rising_edge(clk_x) then
            vsum_shifted <= vsum srl depth_bits;
            htsum_shifted <= resize(htsum, 18) sra depth_bits;
        end if;
    end process;

    -- Final variance calculation DSP
    dsp_var_msub : dsp_msub
    PORT MAP (
      CLK => clk_x,
      SCLR => rst_i,
      A => std_logic_vector(htsum_shifted),
      C => std_logic_vector(vsum_shifted),
      P => dsp_var_tmp_x
    );

    mean_shift_reg : entity work.data_delay_reg
    generic map (
        SHIFT_DEPTH => 4,
        DATA_WIDTH => 16
    )
    port map (
        clk_i => clk_x,
        rst_i => rst_i,
        data_i => std_logic_vector(resize(htsum_shifted, 16)),
        data_o => mean_delayed_x
    );


    -- Final result
    process(clk_x, rst_i)
        variable output_set : std_logic := '0';  -- Track if output has been set
    begin
    if (rst_i = '1') then
        var_o <= (others => '0');
        mean_o <= (others => '0');
        valid_o <= '0';
        output_set := '0';
    elsif rising_edge(clk_x) then
        if (valid_x = '1' and output_set = '0') then  -- Only set outputs if not already set
            valid_o <= valid_x;
            mean_o <= mean_delayed_x;
            var_o <= std_logic_vector(resize(unsigned(dsp_var_tmp_x srl 4), 16));
            output_set := '1';
        elsif (valid_x = '0') then  -- Reset state when valid_x goes low
            valid_o <= '0';
            var_o <= (others => '0');
            mean_o <= (others => '0');
            output_set := '0';
        end if;
    end if;
    end process;

end Behavioral;