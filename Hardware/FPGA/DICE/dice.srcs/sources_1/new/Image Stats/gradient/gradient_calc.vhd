----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/12/2025 07:28:33 PM
-- Design Name: 
-- Module Name: gradient_calc - Behavioral
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

entity gradient_calc is
    port ( 
        clk_i       : in std_logic;
        ce_i        : in std_logic;
        rst_i       : in std_logic;

        -- input data
        pixel_i      : in std_logic_vector(71 downto 0);
        valid_i     : in std_logic;
        new_pixel_i : in std_logic;

        -- output data
        gradient_o      : out std_logic_vector(10 downto 0);
        valid_o     : out std_logic
    );
end gradient_calc;

architecture Behavioral of gradient_calc is

    signal pixel_reg_x              : std_logic_vector(71 downto 0);

    signal sobel_x_px2              : unsigned(11 downto 0);     
    signal sobel_x_px5              : unsigned(11 downto 0);     
    signal sobel_x_px8              : unsigned(11 downto 0);     

    signal sobel_x_px0              : signed(11 downto 0);       
    signal sobel_x_px3              : signed(11 downto 0);       
    signal sobel_x_px6              : signed(11 downto 0);       
    


    signal sobel_y_px6              : unsigned(11 downto 0);     
    signal sobel_y_px7              : unsigned(11 downto 0);     
    signal sobel_y_px8              : unsigned(11 downto 0);     

    signal sobel_y_px0              : signed(11 downto 0);       
    signal sobel_y_px1              : signed(11 downto 0);       
    signal sobel_y_px2              : signed(11 downto 0);       


    signal sobel_x_dsp_result_1     : std_logic_vector(13 downto 0);
    signal sobel_x_dsp_result_2     : std_logic_vector(13 downto 0);
    
    signal sobel_y_dsp_result_1     : std_logic_vector(13 downto 0);
    signal sobel_y_dsp_result_2     : std_logic_vector(13 downto 0);
    signal sobel_y_dsp_result_2_delay : std_logic_vector(13 downto 0);

    signal dsp1_final_result_x      : std_logic_vector(13 downto 0);
    signal dsp2_final_result_x      : std_logic_vector(13 downto 0);

    signal sum_x                    : signed(13 downto 0);

    signal valid_x                  : std_logic;

    signal dsp1_tmp : signed(13 downto 0);
    signal dsp2_tmp : signed(13 downto 0);
    signal dsp3_tmp : signed(13 downto 0);
    signal dsp4_tmp : signed(13 downto 0);

    signal sum_1_tmp : signed(13 downto 0);
    signal sum_2_tmp : signed(13 downto 0);

    -- performs (A+D)+C
    COMPONENT dsp_macro_add_22b
    PORT (
        CLK : IN STD_LOGIC;
        CE : IN STD_LOGIC;
        SCLR : IN STD_LOGIC;
        A : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
        C : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
        D : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
        P : OUT STD_LOGIC_VECTOR(13 DOWNTO 0) 
    );
    END COMPONENT;

begin

    SRLC32E_inst : SRLC32E
    generic map (
        INIT => X"00000000",    -- Initial contents of shift register
        IS_CLK_INVERTED => '0'  -- Optional inversion for CLK
    )
    port map (
        Q => valid_x,     -- 1-bit output: SRL Data
        Q31 => open, -- 1-bit output: SRL Cascade Data
        A => 5b"00111",     -- 5-bit input: Selects SRL depth
        CE => ce_i,   -- 1-bit input: Clock enable
        CLK => clk_i, -- 1-bit input: Clock
        D => valid_i      -- 1-bit input: SRL Data
    );

    -- register input data
    process(clk_i, rst_i)
    begin
        if (rst_i = '1') then
            pixel_reg_x <= (others => '0');
        elsif rising_edge(clk_i) then
            if (valid_i = '1' and ce_i = '1') then
                pixel_reg_x <= pixel_i;
            else
                pixel_reg_x <= pixel_reg_x;
            end if;
        end if;
    end process;


    -- Process X sobel filter
    process(clk_i, rst_i)
    begin
        if (rst_i = '1') then
            sobel_x_px0 <= (others => '0');
            sobel_x_px3 <= (others => '0');
            sobel_x_px2 <= (others => '0');
            sobel_x_px5 <= (others => '0');
            sobel_x_px6 <= (others => '0');
            sobel_x_px8 <= (others => '0');
        elsif rising_edge(clk_i) then
            if (ce_i = '1') then
                sobel_x_px2 <=  unsigned(resize(unsigned(pixel_reg_x(23 downto 16)), 12));
                sobel_x_px8 <=  unsigned(resize(unsigned(pixel_reg_x(71 downto 64)), 12));
                sobel_x_px5 <=  unsigned(resize(unsigned(pixel_reg_x(47 downto 40)), 12)) sll 1;

                sobel_x_px0 <= -signed(resize(unsigned(pixel_reg_x(7 downto 0)), 12));
                sobel_x_px6 <= -signed(resize(unsigned(pixel_reg_x(55 downto 48)), 12));
                sobel_x_px3 <= -signed(resize(unsigned(pixel_reg_x(31 downto 24)), 12)) sll 1;
            else
                sobel_x_px2 <= sobel_x_px2;
                sobel_x_px8 <= sobel_x_px8;
                sobel_x_px5 <= sobel_x_px5;
                sobel_x_px0 <= sobel_x_px0;
                sobel_x_px6 <= sobel_x_px6;
                sobel_x_px3 <= sobel_x_px3;
            end if;
        end if;
    end process;

    -- Process Y sobel filter
    process(clk_i, rst_i)
    begin
        if (rst_i = '1') then
            sobel_y_px0 <= (others => '0');
            sobel_y_px1 <= (others => '0');
            sobel_y_px2 <= (others => '0');
            sobel_y_px6 <= (others => '0');
            sobel_y_px7 <= (others => '0');
            sobel_y_px8 <= (others => '0');
        elsif rising_edge(clk_i) then
            if (ce_i = '1') then
                sobel_y_px6 <=  unsigned(resize(unsigned(pixel_reg_x(55 downto 48)), 12));
                sobel_y_px8 <=  unsigned(resize(unsigned(pixel_reg_x(71 downto 64)), 12));
                sobel_y_px7 <=  unsigned(resize(unsigned(pixel_reg_x(63 downto 56)), 12)) sll 1;

                sobel_y_px0 <= -signed(resize(unsigned(pixel_reg_x(7 downto 0)), 12));
                sobel_y_px2 <= -signed(resize(unsigned(pixel_reg_x(23 downto 16)), 12));
                sobel_y_px1 <= -signed(resize(unsigned(pixel_reg_x(15 downto 8)), 12)) sll 1;
            else
                sobel_y_px6 <= sobel_y_px6;
                sobel_y_px8 <= sobel_y_px8;
                sobel_y_px7 <= sobel_y_px7;
                sobel_y_px0 <= sobel_y_px0;
                sobel_y_px2 <= sobel_y_px2;
                sobel_y_px1 <= sobel_y_px1;
            end if;
        end if;
    end process;

    -- DSP MACROs
    sobel_x_dsp1 : dsp_macro_add_22b
    PORT MAP (
        CLK => clk_i,
        CE => ce_i,
        SCLR => new_pixel_i,
        A => std_logic_vector(sobel_x_px2),
        C => std_logic_vector(sobel_x_px5),
        D => std_logic_vector(sobel_x_px8),
        P => sobel_x_dsp_result_1
    );

    sobel_x_dsp2 : dsp_macro_add_22b
    PORT MAP (
        CLK => clk_i,
        CE => ce_i,
        SCLR => new_pixel_i,
        A => std_logic_vector(sobel_x_px0),
        C => std_logic_vector(sobel_x_px3),
        D => std_logic_vector(sobel_x_px6),
        P => sobel_x_dsp_result_2
    );

    sobel_y_dsp1 : dsp_macro_add_22b
    PORT MAP (
        CLK => clk_i,
        CE => ce_i,
        SCLR => new_pixel_i,
        A => std_logic_vector(sobel_y_px6),
        C => std_logic_vector(sobel_y_px7),
        D => std_logic_vector(sobel_y_px8),
        P => sobel_y_dsp_result_1
    );

    sobel_y_dsp2 : dsp_macro_add_22b
    PORT MAP (
        CLK => clk_i,
        CE => ce_i,
        SCLR => new_pixel_i,
        A => std_logic_vector(sobel_y_px0),
        C => std_logic_vector(sobel_y_px1),
        D => std_logic_vector(sobel_y_px2),
        P => sobel_y_dsp_result_2
    );
    

    /*final_adder_0 : dsp_macro_add_22b
    PORT MAP (
        CLK => clk_i,
        CE => '1',
        SCLR => new_pixel_i,
        A => std_logic_vector(sobel_x_dsp_result_1(11 downto 0)),
        C => std_logic_vector(sobel_x_dsp_result_2(11 downto 0)),
        D => std_logic_vector(sobel_y_dsp_result_1(11 downto 0)),
        P => dsp1_final_result_x
    );

    data_delay : entity work.data_delay_reg
    generic map (
        SHIFT_DEPTH =>3,
        DATA_WIDTH => sobel_y_dsp_result_2'length
    )
    port map (
        clk_i => clk_i,
        rst_i => rst_i,
        data_i => sobel_y_dsp_result_2,
        data_o => sobel_y_dsp_result_2_delay
    );

    final_adder_1 : dsp_macro_add_22b
    PORT MAP (
        CLK => clk_i,
        CE => '1',
        SCLR => new_pixel_i,
        A => std_logic_vector(dsp1_final_result_x(11 downto 0)),
        C => std_logic_vector(sobel_y_dsp_result_2_delay(11 downto 0)),
        D => "000000000000",
        P => dsp2_final_result_x
    );*/

    process(clk_i, rst_i)
    begin
        if (rst_i = '1') then
            dsp1_tmp <= (others => '0');
            dsp2_tmp <= (others => '0');
            dsp3_tmp <= (others => '0');
            dsp4_tmp <= (others => '0');
        elsif rising_edge(clk_i) then
            if (ce_i = '1') then
                dsp1_tmp <= signed(sobel_x_dsp_result_1);
                dsp2_tmp <= signed(sobel_x_dsp_result_2);
                dsp3_tmp <= signed(sobel_y_dsp_result_1);
                dsp4_tmp <= signed(sobel_y_dsp_result_2);
            else
                dsp1_tmp <= dsp1_tmp;
                dsp2_tmp <= dsp2_tmp;
                dsp3_tmp <= dsp3_tmp;
                dsp4_tmp <= dsp4_tmp;
            end if;
        end if;
    end process;

    process(clk_i, rst_i)
    begin
        if (rst_i = '1') then
            sum_1_tmp <= (others => '0');
            sum_2_tmp <= (others => '0');
        elsif rising_edge(clk_i) then
            if (ce_i = '1') then
                sum_1_tmp <= dsp1_tmp + dsp2_tmp;
                sum_2_tmp <= dsp3_tmp + dsp4_tmp;
            else
                sum_1_tmp <= sum_1_tmp;
                sum_2_tmp <= sum_2_tmp;
            end if;
        end if;
    end process;

    -- Fabric Adders for final result
    process(clk_i, rst_i)
    begin
        if (rst_i = '1') then
            sum_x <= (others => '0');
        elsif rising_edge(clk_i) then
            if (ce_i = '1') then
                sum_x <= sum_1_tmp + sum_2_tmp;
            else
                sum_x <= sum_x;
            end if;
        end if;
    end process;

    -- Register output
    process(clk_i, rst_i)
    begin
        if (rst_i = '1') then
            gradient_o <= (others => '0');
        elsif rising_edge(clk_i) then
            if (valid_x = '1' and ce_i = '1') then
                valid_o <= '1';
                gradient_o <= std_logic_vector(resize(signed(sum_x), 11) sra 1);
            else
                valid_o <= '0';
                gradient_o <= gradient_o;
            end if;
        end if;
    end process;

                         


end Behavioral;
