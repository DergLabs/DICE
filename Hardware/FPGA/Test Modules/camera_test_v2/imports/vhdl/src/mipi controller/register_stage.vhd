library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity register_stage is
    generic 
    (
        BUS1_WIDTH : integer := 8;
        BUS2_WIDTH : integer := 8;
        BUS3_WIDTH : integer := 8;
        BUS4_WIDTH : integer := 8
    );

    port (
        clk_i : in std_logic;
        reset_i : in std_logic;
        
        -- Input/Ouput Buses
        bus0_i : in std_logic_vector(BUS1_WIDTH-1 downto 0);
        bus1_i : in std_logic_vector(BUS2_WIDTH-1 downto 0);
        bus2_i : in std_logic_vector(BUS3_WIDTH-1 downto 0);
        bus3_i : in std_logic_vector(BUS4_WIDTH-1 downto 0);

        bus0_o : out std_logic_vector(BUS1_WIDTH-1 downto 0);
        bus1_o : out std_logic_vector(BUS2_WIDTH-1 downto 0);
        bus2_o : out std_logic_vector(BUS3_WIDTH-1 downto 0);
        bus3_o : out std_logic_vector(BUS4_WIDTH-1 downto 0);

        -- Input/Output Signals
        signal0_i : in std_logic;
        signal1_i : in std_logic;
        signal2_i : in std_logic;
        signal3_i : in std_logic;
        signal4_i : in std_logic;
        signal5_i : in std_logic;
        signal6_i : in std_logic;
        signal7_i : in std_logic;
        signal8_i : in std_logic;
        signal9_i : in std_logic;
        signal10_i : in std_logic;
        signal11_i : in std_logic;
        signal12_i : in std_logic;
        signal13_i : in std_logic;
        signal14_i : in std_logic;
        signal15_i : in std_logic;

        signal0_o : out std_logic;
        signal1_o : out std_logic;
        signal2_o : out std_logic;
        signal3_o : out std_logic;
        signal4_o : out std_logic;
        signal5_o : out std_logic;
        signal6_o : out std_logic;
        signal7_o : out std_logic;
        signal8_o : out std_logic;
        signal9_o : out std_logic;
        signal10_o : out std_logic;
        signal11_o : out std_logic;
        signal12_o : out std_logic;
        signal13_o : out std_logic;
        signal14_o : out std_logic;
        signal15_o : out std_logic
    );

end register_stage;

architecture Behavioral of register_stage is

begin

    -- Bus registers
    process(clk_i)
    begin
        if rising_edge(clk_i) then
            if reset_i = '1' then
                bus0_o <= (others => '0');
                bus1_o <= (others => '0');
                bus2_o <= (others => '0');
                bus3_o <= (others => '0');
            else
                bus0_o <= bus0_i;
                bus1_o <= bus1_i;
                bus2_o <= bus2_i;
                bus3_o <= bus3_i;
            end if;
        end if;
    end process;

    -- Signal registers
    process(clk_i)
    begin
        if rising_edge(clk_i) then
            if reset_i = '1' then
                signal0_o <= '0';
                signal1_o <= '0';
                signal2_o <= '0';
                signal3_o <= '0';
                signal4_o <= '0';
                signal5_o <= '0';
                signal6_o <= '0';
                signal7_o <= '0';
                signal8_o <= '0';
                signal9_o <= '0';
                signal10_o <= '0';
                signal11_o <= '0';
                signal12_o <= '0';
                signal13_o <= '0';
                signal14_o <= '0';
                signal15_o <= '0';
            else
                signal0_o <= signal0_i;
                signal1_o <= signal1_i;
                signal2_o <= signal2_i;
                signal3_o <= signal3_i;
                signal4_o <= signal4_i;
                signal5_o <= signal5_i;
                signal6_o <= signal6_i;
                signal7_o <= signal7_i;
                signal8_o <= signal8_i;
                signal9_o <= signal9_i;
                signal10_o <= signal10_i;
                signal11_o <= signal11_i;
                signal12_o <= signal12_i;
                signal13_o <= signal13_i;
                signal14_o <= signal14_i;
                signal15_o <= signal15_i;
            end if;
        end if;
    end process;

end Behavioral;