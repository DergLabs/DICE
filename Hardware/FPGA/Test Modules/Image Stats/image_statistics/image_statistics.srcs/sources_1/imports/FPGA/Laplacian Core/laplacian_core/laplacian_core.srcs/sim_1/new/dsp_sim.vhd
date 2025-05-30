library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity dsp_sim is
end dsp_sim;

architecture sim of dsp_sim is
    constant clock : integer := 100_000_000;
    constant clk_period : time := 1 sec / clock;

    signal clk : std_logic := '1';
    signal rst : std_logic := '0';

    signal data_a : signed(7 downto 0) := (others => '0');
    signal data_c : signed(7 downto 0) := (others => '0');
    signal data_d : signed(7 downto 0) := (others => '0');

    signal data_o : std_logic_vector(9 downto 0) := (others => '0');

    signal data_a1 : signed(7 downto 0) := (others => '0');
    signal data_a2 : signed(7 downto 0) := (others => '0');
    signal data_a3 : signed(7 downto 0) := (others => '0');

    signal data_c1 : signed(7 downto 0) := (others => '0');
    signal data_c2 : signed(7 downto 0) := (others => '0');
    signal data_c3 : signed(7 downto 0) := (others => '0');

    signal data_d1 : signed(7 downto 0) := (others => '0');
    signal data_d2 : signed(7 downto 0) := (others => '0');
    signal data_d3 : signed(7 downto 0) := (others => '0');

    signal P_temp  : std_logic_vector(47 downto 0) := (others => '0');
    signal data_o1 : std_logic_vector(7 downto 0) := (others => '0');
    signal data_o2 : std_logic_vector(7 downto 0) := (others => '0');
    signal data_o3 : std_logic_vector(7 downto 0) := (others => '0');
    

    signal prog_counter : unsigned(7 downto 0) := (others => '0');

    -- Implements (A+D) + C
    COMPONENT dsp_macro_0
    PORT (
        CLK : IN STD_LOGIC;
        A : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
        C : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
        D : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
        P : OUT STD_LOGIC_VECTOR(9 DOWNTO 0) 
    );
    END COMPONENT;

    -- Implements (A+D) + C
    COMPONENT dsp_macro_simd
    PORT (
        CLK : IN STD_LOGIC;
        A : IN STD_LOGIC_VECTOR(26 DOWNTO 0);
        C : IN STD_LOGIC_VECTOR(47 DOWNTO 0);
        D : IN STD_LOGIC_VECTOR(26 DOWNTO 0);
        P : OUT STD_LOGIC_VECTOR(47 DOWNTO 0) 
    );
    END COMPONENT;
    
begin

    test_dsp : dsp_macro_0
    PORT MAP (
        CLK => clk,
        A => std_logic_vector(data_a),
        C => std_logic_vector(data_c),
        D => std_logic_vector(data_d),
        P => data_o
    );


    test_dsp_simd : dsp_macro_simd
    PORT MAP (
        CLK => clk,
        A => ("0" & std_logic_vector(data_a3) & "0" & std_logic_vector(data_a2) & "0" & std_logic_vector(data_a1)),
        C => ("0000000000000000000000" & std_logic_vector(data_c3) & "0" & std_logic_vector(data_c2) & "0" & std_logic_vector(data_c1)),
        D => ("0" & std_logic_vector(data_d3) & "0" & std_logic_vector(data_d2) & "0" & std_logic_vector(data_d1)),
        P => P_temp
    );

    data_o1 <= P_temp(7 downto 0);
    data_o2 <= P_temp(16 downto 9);
    data_o3 <= P_temp(25 downto 18);


    clk <= not clk after clk_period / 2;


    process(clk)
    begin
        if rising_edge(clk) then
            if rst = '1' then
                prog_counter <= (others => '0');
            else
                if prog_counter = X"0E" then
                    prog_counter <= (others => '0');
                else
                    prog_counter <= prog_counter + 1;
                end if;
            end if;
        end if;
    end process;



    process is
    variable delay_ns : integer := 100;
    variable wait_rst : boolean := TRUE;
    begin
        rst <= '1';
        wait_rst := FALSE;
        data_a <= to_signed(0, data_a'length); 
        data_c <= to_signed(0, data_c'length); 
        data_d <= to_signed(0, data_d'length); 

        data_a1 <= to_signed(0, data_a1'length);
        data_a2 <= to_signed(0, data_a2'length);
        data_a3 <= to_signed(0, data_a3'length);
        data_c1 <= to_signed(0, data_c1'length);
        data_c2 <= to_signed(0, data_c2'length);
        data_c3 <= to_signed(0, data_c3'length);
        data_d1 <= to_signed(0, data_d1'length);
        data_d2 <= to_signed(0, data_d2'length);
        data_d3 <= to_signed(0, data_d3'length);
        wait for 50 ns;

        rst <= '0';
        --wait for 10 ns;

        data_a <= to_signed(0, data_a'length); 
        data_c <= to_signed(0, data_c'length); 
        data_d <= to_signed(0, data_d'length);

        data_a1 <= to_signed(0, data_a1'length);
        data_a2 <= to_signed(0, data_a2'length);
        data_a3 <= to_signed(0, data_a3'length);
        data_c1 <= to_signed(0, data_c1'length);
        data_c2 <= to_signed(0, data_c2'length);
        data_c3 <= to_signed(0, data_c3'length);
        data_d1 <= to_signed(0, data_d1'length);
        data_d2 <= to_signed(0, data_d2'length);
        data_d3 <= to_signed(0, data_d3'length);
        wait for delay_ns * ns;

        data_a <= to_signed(10, data_a'length); 
        data_c <= to_signed(0, data_c'length); 
        data_d <= to_signed(0, data_d'length);

        data_a1 <= to_signed(10, data_a1'length);
        data_a2 <= to_signed(10, data_a2'length);
        data_a3 <= to_signed(10, data_a3'length);
        data_c1 <= to_signed(0, data_c1'length);
        data_c2 <= to_signed(0, data_c2'length);
        data_c3 <= to_signed(0, data_c3'length);
        data_d1 <= to_signed(0, data_d1'length);
        data_d2 <= to_signed(0, data_d2'length);
        data_d3 <= to_signed(0, data_d3'length);
        wait for delay_ns * ns;
        
        data_a <= to_signed(0, data_a'length); 
        data_c <= to_signed(10, data_c'length); 
        data_d <= to_signed(0, data_d'length);

        data_a1 <= to_signed(0, data_a1'length);
        data_a2 <= to_signed(00, data_a2'length);
        data_a3 <= to_signed(0, data_a3'length);
        data_c1 <= to_signed(10, data_c1'length);
        data_c2 <= to_signed(10, data_c2'length);
        data_c3 <= to_signed(10, data_c3'length);
        data_d1 <= to_signed(0, data_d1'length);
        data_d2 <= to_signed(0, data_d2'length);
        data_d3 <= to_signed(0, data_d3'length);
        wait for delay_ns * ns;

        data_a <= to_signed(10, data_a'length); 
        data_c <= to_signed(10, data_c'length); 
        data_d <= to_signed(0, data_d'length);

        data_a1 <= to_signed(10, data_a1'length);
        data_a2 <= to_signed(10, data_a2'length);
        data_a3 <= to_signed(10, data_a3'length);
        data_c1 <= to_signed(10, data_c1'length);
        data_c2 <= to_signed(10, data_c2'length);
        data_c3 <= to_signed(10, data_c3'length);
        data_d1 <= to_signed(0, data_d1'length);
        data_d2 <= to_signed(0, data_d2'length);
        data_d3 <= to_signed(0, data_d3'length);
        wait for delay_ns * ns;

        data_a <= to_signed(0, data_a'length); 
        data_c <= to_signed(0, data_c'length); 
        data_d <= to_signed(10, data_d'length);

        data_a1 <= to_signed(0, data_a1'length);
        data_a2 <= to_signed(0, data_a2'length);
        data_a3 <= to_signed(0, data_a3'length);
        data_c1 <= to_signed(0, data_c1'length);
        data_c2 <= to_signed(0, data_c2'length);
        data_c3 <= to_signed(0, data_c3'length);
        data_d1 <= to_signed(10, data_d1'length);
        data_d2 <= to_signed(10, data_d2'length);
        data_d3 <= to_signed(10, data_d3'length);
        wait for delay_ns * ns;

        data_a <= to_signed(10, data_a'length); 
        data_c <= to_signed(0, data_c'length); 
        data_d <= to_signed(10, data_d'length);

        data_a1 <= to_signed(10, data_a1'length);
        data_a2 <= to_signed(10, data_a2'length);
        data_a3 <= to_signed(10, data_a3'length);
        data_c1 <= to_signed(0, data_c1'length);
        data_c2 <= to_signed(0, data_c2'length);
        data_c3 <= to_signed(0, data_c3'length);
        data_d1 <= to_signed(10, data_d1'length);
        data_d2 <= to_signed(10, data_d2'length);
        data_d3 <= to_signed(10, data_d3'length);
        wait for delay_ns * ns;

        data_a <= to_signed(0, data_a'length); 
        data_c <= to_signed(10, data_c'length); 
        data_d <= to_signed(10, data_d'length);

        data_a1 <= to_signed(0, data_a1'length);
        data_a2 <= to_signed(0, data_a2'length);
        data_a3 <= to_signed(0, data_a3'length);
        data_c1 <= to_signed(10, data_c1'length);
        data_c2 <= to_signed(10, data_c2'length);
        data_c3 <= to_signed(10, data_c3'length);
        data_d1 <= to_signed(10, data_d1'length);
        data_d2 <= to_signed(10, data_d2'length);
        data_d3 <= to_signed(10, data_d3'length);
        wait for delay_ns * ns;

        data_a <= to_signed(10, data_a'length); 
        data_c <= to_signed(10, data_c'length); 
        data_d <= to_signed(10, data_d'length);

        data_a1 <= to_signed(10, data_a1'length);
        data_a2 <= to_signed(10, data_a2'length);
        data_a3 <= to_signed(10, data_a3'length);
        data_c1 <= to_signed(10, data_c1'length);
        data_c2 <= to_signed(10, data_c2'length);
        data_c3 <= to_signed(10, data_c3'length);
        data_d1 <= to_signed(10, data_d1'length);
        data_d2 <= to_signed(10, data_d2'length);
        data_d3 <= to_signed(10, data_d3'length);
        wait for delay_ns * ns;

        wait_rst := TRUE;
        wait for delay_ns * ns;
        
        if (wait_rst) then
            wait for 300 ns;
        end if;

    end process;

end sim;