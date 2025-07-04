
--  Xilinx UltraRAM Single Port No Change Mode.  This code implements 
--  a parameterizable UltraRAM block in No Change mode. The behavior of this RAM is 
--  when data is written, the output of RAM is unchanged. Only when write is
--  inactive data corresponding to the address is presented on the output port.
--

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library UNISIM;
use UNISIM.VComponents.all;

entity ultra_ram_buffer is
generic (
         AWIDTH : integer := 12;  -- Address Width
         DWIDTH : integer := 72;  -- Data Width
         NBPIPE : integer := 3    -- Number of pipeline Registers
        );
port    (
         clk : in std_logic;                                  -- Clock 
         we : in std_logic;                                   -- Write Enable
         mem_en : in std_logic;                               -- Memory Enable
         din : in std_logic_vector(DWIDTH-1 downto 0);        -- Data Input  
         addr : in std_logic_vector(AWIDTH-1 downto 0);       -- Address Input
         dout : out std_logic_vector(DWIDTH-1 downto 0)       -- Data Output
        );
end ultra_ram_buffer;

architecture rtl of ultra_ram_buffer is

constant C_AWIDTH : integer := AWIDTH;
constant C_DWIDTH : integer := DWIDTH;
constant C_NBPIPE : integer := NBPIPE;

-- Internal Signals
type mem_t is array(natural range<>) of std_logic_vector(C_DWIDTH-1 downto 0);
type pipe_data_t is array(natural range<>) of std_logic_vector(C_DWIDTH-1 downto 0);
type pipe_en_t is array(natural range<>) of std_logic;

signal mem : mem_t(2**C_AWIDTH-1 downto 0);                -- Memory Declaration
signal memreg : std_logic_vector(C_DWIDTH-1 downto 0);              
signal mem_pipe_reg : pipe_data_t(C_NBPIPE-1 downto 0);    -- Pipelines for memory
signal mem_en_pipe_reg : pipe_en_t(C_NBPIPE downto 0);     -- Pipelines for memory enable  

attribute ram_style : string;
attribute ram_style of mem : signal is "ultra";

begin

-- RAM : Read has one latency, Write has one latency as well.
process(clk)
begin
  if(clk'event and clk='1')then
    if(mem_en = '1') then
      if(we = '1') then
        mem(to_integer(unsigned(addr))) <= din;
      else
        memreg <= mem(to_integer(unsigned(addr)));
      end if;
    end if;
  end if;
end process;

-- The enable of the RAM goes through a pipeline to produce a
-- series of pipelined enable signals required to control the data
-- pipeline.
process(clk)
begin
  if(clk'event and clk = '1') then
    mem_en_pipe_reg(0) <= mem_en;
    for i in 0 to C_NBPIPE-1 loop
      mem_en_pipe_reg(i+1) <= mem_en_pipe_reg(i);
    end loop;
  end if;
end process;

-- RAM output data goes through a pipeline.
process(clk)
begin
  if(clk'event and clk = '1') then
    if(mem_en_pipe_reg(0) = '1') then
      mem_pipe_reg(0) <= memreg;
    end if;
    for i in 0 to C_NBPIPE-2 loop
      if(mem_en_pipe_reg(i+1) = '1') then
        mem_pipe_reg(i+1) <= mem_pipe_reg(i);
      end if;
    end loop;
  end if;
end process;

process(clk)
begin
  if(clk'event and clk = '1') then
    if(mem_en_pipe_reg(C_NBPIPE) = '1') then
      dout <= mem_pipe_reg(C_NBPIPE-1);
    end if;
  end if;    
end process;

end rtl;

-- The following is an instantiation template for xilinx_ultraram_single_port_no_change 
-- Component Declaration
-- Uncomment the below component declaration when using
-- component xilinx_ultraram_single_port_no_change
--generic (
--         AWIDTH : integer := 12;  -- Address Width
--         DWIDTH : integer := 72;  -- Data Width
--         NBPIPE : integer := 3    -- Number of pipeline Registers
--        );
--port    (
--         clk : in std_logic;                                  -- Clock 
--         we : in std_logic;                                   -- Write Enable
--         mem_en : in std_logic;                               -- Memory Enable
--         din : in std_logic_vector(DWIDTH-1 downto 0);        -- Data Input  
--         addr : in std_logic_vector(AWIDTH-1 downto 0);       -- Address Input
--         dout : out std_logic_vector(DWIDTH-1 downto 0)       -- Data Output
--        );
-- end component;
-- Instantiation
-- Uncomment the below component declaration when using
-- <your_instance_name> : xilinx_ultraram_single_port_no_change 
-- generic map (
--		AWIDTH => AWIDTH, 
--		DWIDTH => DWIDTH, 
--	    NBPIPE => NBPIPE	
--       )
-- port map (
--         clk => clk, 
--         we => we, 
--         mem_en => mem_en, 
--         din => din, 
--         addr => addr, 
--         dout => dout
--         );
 
						
						