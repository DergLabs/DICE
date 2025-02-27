----------------------------------------------------------------------------------
-- Company: Drexel University
-- Engineer: John Hofmeyr
-- 
-- Create Date:
-- Design Name: 
-- Module Name: dct1d - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: Fully integer based 1D Discrete Cosine Transform. Based on this paper: https://doi.org/10.1109/ICMCS.2011.5945659
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

entity dct1d is
    port ( 
        clk_i       : in std_logic;
        ce_i        : in std_logic;
        rst_i       : in std_logic;
        data_i      : in std_logic_vector(95 downto 0);
        valid_i     : in std_logic;

        data_o      : out std_logic_vector(95 downto 0);
        valid_o     : out std_logic
    );
end dct1d;

architecture Behavioral of dct1d is
    signal dsp_layer_1_out  : std_logic_vector(95 downto 0);
    signal dsp_layer_2_out  : std_logic_vector(95 downto 0);
    signal dsp_layer_3_out  : std_logic_vector(95 downto 0);

    signal layer_2_tmp_x    : std_logic_vector(47 downto 0);
    signal valid_x          : std_logic;

begin

    -- Delay reg for valid
    valid_delay : entity work.data_delay_reg
    generic map (
        SHIFT_DEPTH => 6,
        DATA_WIDTH => 1
    )
    port map (
        clk_i => clk_i,
        ce_i => ce_i,
        rst_i => rst_i,
        data_i(0) => valid_i,
        data_o(0) => valid_x
    );

    -- DSP Layer 1
    dsp1_add : entity work.simd_4x12b_dsp
    generic map (
        W => 12,
        OP => "ADD"
    )
    port map (
        clk_i => clk_i,
        rst_i => rst_i,
        ce_i => ce_i,
        a0 => data_i(11 downto 0), -- X0
        b0 => data_i(95 downto 84), -- X7
        a1 => data_i(23 downto 12), -- X1
        b1 => data_i(83 downto 72), -- X6
        a2 => data_i(35 downto 24), -- X2
        b2 => data_i(71 downto 60), -- X5
        a3 => data_i(47 downto 36), -- X3
        b3 => data_i(59 downto 48), -- X4
        out0 => dsp_layer_1_out(11 downto 0), -- X0 + X7
        out1 => dsp_layer_1_out(23 downto 12), -- X1 + X6
        out2 => dsp_layer_1_out(35 downto 24), -- X2 + X5
        out3 => dsp_layer_1_out(47 downto 36) -- X3 + X4
    );

    dsp2_sub : entity work.simd_4x12b_dsp
    generic map (
        W => 12,
        OP => "SUB"
    )
    port map (
        clk_i => clk_i,
        rst_i => rst_i,
        ce_i => ce_i,
        a0 => data_i(47 downto 36), -- X3
        b0 => data_i(59 downto 48), -- X4
        a1 => data_i(35 downto 24), -- X2
        b1 => data_i(71 downto 60), -- X5
        a2 => data_i(23 downto 12), -- X1
        b2 => data_i(83 downto 72), -- X6
        a3 => data_i(11 downto 0), -- X0
        b3 => data_i(95 downto 84), -- X7
        out0 => dsp_layer_1_out(59 downto 48), -- X3 - X4 (or -x4 + x3)
        out1 => dsp_layer_1_out(71 downto 60), -- X2 - X5 (or -x5 + x2)
        out2 => dsp_layer_1_out(83 downto 72), -- X1 - X6 (or -x6 + x1)
        out3 => dsp_layer_1_out(95 downto 84) -- X0 - X7 (or -x7 + x0)
    );

    -- DSP Layer 2
    dsp3_add : entity work.simd_4x12b_dsp
    generic map (
        W => 12,
        OP => "ADD"
    )
    port map (
        clk_i => clk_i,
        rst_i => rst_i,
        ce_i => ce_i,
        a0 => dsp_layer_1_out(11 downto 0), -- X0
        b0 => dsp_layer_1_out(47 downto 36), -- X3
        a1 => dsp_layer_1_out(23 downto 12), -- X1
        b1 => dsp_layer_1_out(35 downto 24), -- X2
        a2 => std_logic_vector(-signed(dsp_layer_1_out(35 downto 24))), -- -X2
        b2 => dsp_layer_1_out(23 downto 12), -- X1
        a3 => std_logic_vector(-signed(dsp_layer_1_out(47 downto 36))), -- -X3
        b3 => dsp_layer_1_out(11 downto 0), -- X0
        out0 => dsp_layer_2_out(11 downto 0), -- X0 + X3
        out1 => dsp_layer_2_out(23 downto 12), -- X1 + X2
        out2 => dsp_layer_2_out(35 downto 24), -- -X2 + X1
        out3 => dsp_layer_2_out(47 downto 36) -- -X3 + X0
    );

    -- Small Fabric Adders & sign change for Layer 2
    layer_2_tmp_x(11 downto 0) <= std_logic_vector(-signed(dsp_layer_1_out(59 downto 48))); -- -X4
    layer_2_tmp_x(23 downto 12) <= std_logic_vector(-signed(dsp_layer_1_out(71 downto 60))); -- -X5
    layer_2_tmp_x(35 downto 24) <= std_logic_vector(signed(dsp_layer_1_out(83 downto 72)) + signed(dsp_layer_1_out(95 downto 84))); -- X6 + X7
    layer_2_tmp_x(47 downto 36) <= std_logic_vector(signed(dsp_layer_1_out(95 downto 84)) - signed(dsp_layer_1_out(83 downto 72))); -- X7 - X6

    layer_2_delay : entity work.data_delay_reg
    generic map (
        SHIFT_DEPTH => 2,
        DATA_WIDTH => 48
    )
    port map (
        clk_i => clk_i,
        ce_i => ce_i,
        rst_i => rst_i,
        data_i => layer_2_tmp_x,
        data_o => dsp_layer_2_out(95 downto 48)
    );

    -- DSP Layer 3
    dsp4_add : entity work.simd_4x12b_dsp
    generic map (
        W => 12,
        OP => "ADD"
    )
    port map (
        clk_i => clk_i,
        rst_i => rst_i,
        ce_i => ce_i,
        a0 => dsp_layer_2_out(11 downto 0), -- X0
        b0 => dsp_layer_2_out(23 downto 12), -- X1
        a1 => dsp_layer_2_out(11 downto 0), -- X0
        b1 => std_logic_vector(-signed(dsp_layer_2_out(23 downto 12))), -- -X1
        a2 => dsp_layer_2_out(35 downto 24), -- -X2
        b2 => dsp_layer_2_out(47 downto 36), -- -X3
        a3 => std_logic_vector(-signed(dsp_layer_2_out(35 downto 24))), -- -X2
        b3 => dsp_layer_2_out(47 downto 36), -- X3
        out0 => dsp_layer_3_out(11 downto 0), -- X0 + X1
        out1 => dsp_layer_3_out(23 downto 12), -- X0 - X1 
        out2 => dsp_layer_3_out(35 downto 24), -- -X2 + X3
        out3 => dsp_layer_3_out(47 downto 36) -- -X3 + X4
    );

    -- double register layer 3 outputs
    layer_3_delay : entity work.data_delay_reg
    generic map (
        SHIFT_DEPTH => 2,
        DATA_WIDTH => 48
    )
    port map (
        clk_i => clk_i,
        ce_i => ce_i,
        rst_i => rst_i,
        data_i => dsp_layer_2_out(95 downto 48),
        data_o => dsp_layer_3_out(95 downto 48)
    );

    -- Register output
    process(clk_i, rst_i)
    begin
        if rst_i = '1' then
            data_o <= (others => '0');
            valid_o <= '0';
        elsif rising_edge(clk_i) then
            if (ce_i = '1' and valid_x = '1') then
                data_o <= (dsp_layer_3_out(59 downto 48)) & 
                        (dsp_layer_3_out(47 downto 36)) & 
                        (dsp_layer_3_out(95 downto 84)) & 
                        (dsp_layer_3_out(23 downto 12)) & 
                        (dsp_layer_3_out(71 downto 60)) & 
                        (dsp_layer_3_out(35 downto 24)) & 
                        (dsp_layer_3_out(83 downto 72)) & 
                        (dsp_layer_3_out(11 downto 0));
                valid_o <= valid_x;
            else
                data_o <= data_o;
                valid_o <= '0';
            end if;
        end if;
    end process;

end Behavioral;