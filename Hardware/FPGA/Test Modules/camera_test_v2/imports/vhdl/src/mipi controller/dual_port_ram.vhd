library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

library UNISIM;
use UNISIM.VComponents.all;

entity full_dp_mem is
    generic (
        DATA_WIDTH : integer := 8;
        ADDR_WIDTH : integer := 8
    );
    
    port (
        clka_i : in std_logic;
        rsta_i : in std_logic;
        ena_i : in std_logic;
        wea_i : in std_logic;
        addra_i : in std_logic_vector(ADDR_WIDTH - 1 downto 0);
        dina_i : in std_logic_vector(DATA_WIDTH - 1 downto 0);
        douta_o : out std_logic_vector(DATA_WIDTH - 1 downto 0);

        clkb_i : in std_logic;
        rstb_i : in std_logic;  
        enb_i : in std_logic;
        web_i : in std_logic;
        addrb_i : in std_logic_vector(ADDR_WIDTH - 1 downto 0);
        dinb_i : in std_logic_vector(DATA_WIDTH - 1 downto 0);
        doutb_o : out std_logic_vector(DATA_WIDTH - 1 downto 0)
    );
end full_dp_mem;

architecture Behavioral of full_dp_mem is

    type ram_type is array ((2**ADDR_WIDTH) - 1 downto 0) of std_logic_vector(DATA_WIDTH - 1 downto 0);
    shared variable RAM : ram_type;


begin

    -- Port A
    process(clka_i, rsta_i)
    begin
        if (rsta_i = '1') then
            RAM := (others => (others => '0'));
        elsif rising_edge(clka_i) then
            if ena_i = '1' then
                douta_o <= RAM(to_integer(unsigned(addra_i)));
                if wea_i = '1' then
                    RAM(to_integer(unsigned(addra_i))) := dina_i;
                end if;
            end if;
        end if;
    end process;

    -- Port B
    process(clkb_i, rstb_i)
    begin
        if (rstb_i = '1') then
            RAM := (others => (others => '0'));
        elsif rising_edge(clkb_i) then
            if enb_i = '1' then
                doutb_o <= RAM(to_integer(unsigned(addrb_i)));
                if web_i = '1' then
                    RAM(to_integer(unsigned(addrb_i))) := dinb_i;
                end if;
            end if;
        end if;
    end process;

end Behavioral;
    
