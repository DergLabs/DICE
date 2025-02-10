library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

library UNISIM;
use UNISIM.VComponents.all;

-- Fully pipelined RGB to Grayscale conversion
-- Module has a total latency of 9 clock cycles
-- valid_i must go high at the same time data is presented on pixel_i
-- valid_o will go high after 9 clock cycles, pixel_o will have valid data at that time
-- Core processes one pixel per clock cycle

entity rgb_to_gray is 
    port(
        clk_i   :   in std_logic;
        rst_i   :   in std_logic;

        pixel_i :   in std_logic_vector(23 downto 0);
        valid_i :   in std_logic;

        pixel_o :   out std_logic_vector(7 downto 0);
        valid_o :   out std_logic
    );
end rgb_to_gray;

architecture Behavioral of rgb_to_gray is

    signal pixel_in_reg_x   : std_logic_vector(23 downto 0);
    signal valid_x          : std_logic;

    signal red_ch_shift1_x    : unsigned(7 downto 0);
    --signal red_ch_shift2_x    : unsigned(7 downto 0);
    signal red_ch_shift3_x    : unsigned(7 downto 0);


    signal green_ch_shift1_x  : unsigned(7 downto 0);
    signal green_ch_shift2_x  : unsigned(7 downto 0);
    signal green_ch_shift3_x  : unsigned(7 downto 0);


    signal blue_ch_shift1_x   : unsigned(7 downto 0);
    signal blue_ch_shift2_x   : unsigned(7 downto 0); 
    --signal blue_ch_shift3_x   : unsigned(7 downto 0); 

    signal dsp_preadd_temp    : std_logic_vector(27 downto 0);
    signal dsp_final_temp     : std_logic_vector(27 downto 0);


    signal red_ch_adder_out_x       : unsigned(7 downto 0);
    signal green_ch_adder_out_x     : unsigned(7 downto 0);
    signal blue_ch_adder_out_x      : unsigned(7 downto 0);

    --signal final_adder_out_x    : unsigned(7 downto 0);
    

    -- Implements (A+D) + C, A, C & D are 27b, P is 28b. Padding zero's are added after each 8b value within A, C and D
    -- Input Bit fields: |  26  |  25 - 18  |  17  |  16 - 9  |  8  |  7 - 0  |
    --       A input   : | 0    |  R1(7-0)  |  0   |  G1(7-0) |  0  | B1(7-0) |
    --       D input   : | 0    |  R2(7-0)  |  0   |  G2(7-0) |  0  | B2(7-0) |
    --       C input   : | 0    |  R3(7-0)  |  0   |  G3(7-0) |  0  | B3(7-0) |
    -- Output Bit fields: |  47 - 26  |  25 - 18  |  17  |  16 - 9  |  8  |  7 - 0  |
    --       P output  :  | 0         |  RO(7-0)  |  0   |  GO(7-0) |  0  | BO(7-0) |
    COMPONENT dsp_macro_simd
    PORT (
        CLK : IN STD_LOGIC;
        SCLR : IN STD_LOGIC;
        A : IN STD_LOGIC_VECTOR(26 DOWNTO 0);
        C : IN STD_LOGIC_VECTOR(26 DOWNTO 0);
        D : IN STD_LOGIC_VECTOR(26 DOWNTO 0);
        P : OUT STD_LOGIC_VECTOR(27 DOWNTO 0) 
    );
    END COMPONENT;


begin

    -- Delay path for valid input to valid output
    SRL16E_inst : SRL16E
    generic map (
       INIT => X"0000",        -- Initial contents of shift register
       IS_CLK_INVERTED => '0'  -- Optional inversion for CLK
    )
    port map (
       Q => valid_x,     -- 1-bit output: SRL Data
       CE => '1',   -- 1-bit input: Clock enable
       CLK => clk_i, -- 1-bit input: Clock
       D => valid_i,     -- 1-bit input: SRL Data
       -- Depth Selection inputs: A0-A3 select SRL depth
       A0 => '1',
       A1 => '1',
       A2 => '1',
       A3 => '0' 
    );

    -- Register input pixel on valid_i
    process (clk_i, rst_i, valid_i)
    begin
        if (rst_i = '1') then
            pixel_in_reg_x <= (others => '0');
        elsif rising_edge(clk_i) and (valid_i = '1') then
            --if (valid_i = '1') then
                pixel_in_reg_x <= pixel_i;
        else 
                pixel_in_reg_x <= pixel_in_reg_x;
           --end if;
        end if;
    end process;

    -- Bit shifters
    process(clk_i, rst_i)
    begin
        if (rst_i = '1') then
            red_ch_shift1_x <= (others => '0');
            --red_ch_shift2_x <= (others => '0');
            red_ch_shift3_x <= (others => '0');

            green_ch_shift1_x <= (others => '0');
            green_ch_shift2_x <= (others => '0');
            green_ch_shift3_x <= (others => '0');

            blue_ch_shift1_x <= (others => '0');
            blue_ch_shift2_x <= (others => '0');
            --blue_ch_shift3_x <= (others => '0');

        elsif rising_edge(clk_i) then
            red_ch_shift1_x <= unsigned(pixel_in_reg_x(23 downto 16) srl 3);
            --red_ch_shift2_x <= unsigned(pixel_in_reg_x(23 downto 16) srl 3);
            red_ch_shift3_x <= unsigned(pixel_in_reg_x(23 downto 16) srl 4);

            green_ch_shift1_x <= unsigned(pixel_in_reg_x(15 downto 8) srl 1);
            green_ch_shift2_x <= unsigned(pixel_in_reg_x(15 downto 8) srl 4);
            green_ch_shift3_x <= unsigned(pixel_in_reg_x(15 downto 8) srl 5);

            blue_ch_shift1_x <= unsigned(pixel_in_reg_x(7 downto 0) srl 4);
            blue_ch_shift2_x <= unsigned(pixel_in_reg_x(7 downto 0) srl 5);
            --blue_ch_shift3_x <= unsigned(pixel_in_reg_x(7 downto 0) srl 5);
        end if;
    end process;

    -- Pre-adder DSP, performs (A+D)+C for each shifted output on R, G and B
    dsp_pre_add : dsp_macro_simd
    PORT MAP (
        CLK => clk_i,
        SCLR => rst_i,
        A => ("0" & std_logic_vector(red_ch_shift1_x) & "0" & std_logic_vector(green_ch_shift1_x) & "0" & std_logic_vector(blue_ch_shift1_x)),
        C => ("0" & std_logic_vector(red_ch_shift1_x) & "0" & std_logic_vector(green_ch_shift2_x) & "0" & std_logic_vector(blue_ch_shift2_x)),
        D => ("0" & std_logic_vector(red_ch_shift3_x) & "0" & std_logic_vector(green_ch_shift3_x) & "0" & std_logic_vector(blue_ch_shift2_x)),
        P => dsp_preadd_temp
    );

    red_ch_adder_out_x <= unsigned(dsp_preadd_temp(25 downto 18));
    green_ch_adder_out_x <= unsigned(dsp_preadd_temp(16 downto 9));
    blue_ch_adder_out_x <= unsigned(dsp_preadd_temp(7 downto 0));

    -- Final Adder, perfors (A+D)+C, adds R, G and B results from previous DSP
    dsp_final_add : dsp_macro_simd
    PORT MAP (
        CLK => clk_i,
        SCLR => rst_i,
        A => (19b"0000000000000000000" & std_logic_vector(red_ch_adder_out_x)),
        C => (19b"0000000000000000000" & std_logic_vector(green_ch_adder_out_x)),
        D => (19b"0000000000000000000" & std_logic_vector(blue_ch_adder_out_x)),
        P => dsp_final_temp
    );

    -- Final output stage
    process(clk_i, rst_i)
    begin
        if (rst_i) then
            pixel_o <= (others => '0');
            valid_o <= '0';
        elsif rising_edge(clk_i) then
            if (valid_x = '1') then
                valid_o <= valid_x;
                pixel_o <= std_logic_vector(dsp_final_temp(7 downto 0));
            else
                valid_o <= '0';
                pixel_o <= pixel_o;
            end if;
        end if;
    end process;   
    
end Behavioral;