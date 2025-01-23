----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/21/2025 11:13:08 PM
-- Design Name: 
-- Module Name: transpose - Behavioral
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

entity transpose is
    generic(
        ELEMENT_WIDTH : integer := 12; -- Bits per data element
        NUM_ELEMENTS : integer := 8; -- Number of parallel data elements
        DEPTH : integer := 8 -- How many elements to store
    );
    port ( 
        clk_i       : in std_logic;
        ce_i        : in std_logic;
        rst_i       : in std_logic;
        data_i      : in std_logic_vector((ELEMENT_WIDTH*NUM_ELEMENTS)-1 downto 0);
        valid_i     : in std_logic;

        data_o      : out std_logic_vector((ELEMENT_WIDTH*NUM_ELEMENTS)-1 downto 0);
        valid_o     : out std_logic;
        row_num_o   : out std_logic_vector(3 downto 0)
    );
end transpose;

architecture Behavioral of transpose is
    signal input_pixel_x : std_logic_vector((ELEMENT_WIDTH*NUM_ELEMENTS)-1 downto 0) := (others => '0');

    signal valid_x : std_logic := '0';
    signal valid_2_x : std_logic := '0';
    signal valid_delay_x : std_logic := '0';

    signal pixel_bank_0 : std_logic_vector((ELEMENT_WIDTH*NUM_ELEMENTS*DEPTH)-1 downto 0) := (others => '0');
    signal pixel_bank_1 : std_logic_vector((ELEMENT_WIDTH*NUM_ELEMENTS*DEPTH)-1 downto 0) := (others => '0');
    signal pixel_output : std_logic_vector((ELEMENT_WIDTH*NUM_ELEMENTS*DEPTH)-1 downto 0) := (others => '0');

    signal counter_x : integer := 0;
    signal bank_sel : std_logic := '0';
begin

    -- Delay reg for valid
    -- Used to only update output data once it is ready and valid
    -- Delayed by 6 cycles, final valid is delayed by 1 more cycle to align with data
    -- On Cycle 6 data and valid are sent to ourtput registers and will be valid on the next cycle
    SRLC32E_inst : SRLC32E
    generic map (
        INIT => X"00000000",    -- Initial contents of shift register
        IS_CLK_INVERTED => '0'  -- Optional inversion for CLK
    )
    port map (
        Q => valid_2_x,     -- 1-bit output: SRL Data
        Q31 => open, -- 1-bit output: SRL Cascade Data
        A => std_logic_vector(to_unsigned(6, 5)),     -- 5-bit input: Selects SRL depth
        CE => ce_i,   -- 1-bit input: Clock enable
        CLK => clk_i, -- 1-bit input: Clock
        D => valid_x      -- 1-bit input: SRL Data
    );

    --register incoming pixel data
    -- Aligns data and valid signal
    process(clk_i, rst_i)
    begin
        if (rst_i = '1') then
            input_pixel_x <= (others => '0');
        elsif rising_edge(clk_i) then
            if (ce_i = '1' and valid_i = '1') then
                valid_x <= '1';
                input_pixel_x <= data_i;
            else
                valid_x <= valid_x;
                input_pixel_x <= input_pixel_x;
            end if;
        end if;
    end process;

    -- increment counter each time new data is loaded
    -- Counter used to select which row of data to output
    process(clk_i, rst_i)
    begin
        if rst_i = '1' then
            counter_x <= 0;
            bank_sel <= '0';
        elsif rising_edge(clk_i) then
            if (ce_i = '1' and valid_x = '1') then
                if (counter_x = DEPTH-1) then
                    counter_x <= 0;
                    bank_sel <= not bank_sel;
                else
                    counter_x <= counter_x + 1;
                end if;
            else
                counter_x <= counter_x;
            end if;
        end if;
    end process;

    -- shift register to hold incoming pixel data, two banks are used and written to alternately
    -- Data is shifted in from left to right, so the first pixel in will be the last element
    process(clk_i, rst_i)
    begin
        if (rst_i = '1') then
            pixel_bank_0 <= (others => '0');
            pixel_bank_1 <= (others => '0');
        elsif rising_edge(clk_i) then
            if (bank_sel = '0' and ce_i = '1') then
                -- Shift in pixels from left to right
                pixel_bank_0 <= input_pixel_x & pixel_bank_0((ELEMENT_WIDTH*NUM_ELEMENTS*DEPTH)-1 downto (ELEMENT_WIDTH*NUM_ELEMENTS));

                -- Shift in pixels from right to left
                --pixel_bank_0 <= pixel_bank_0(((ELEMENT_WIDTH*NUM_ELEMENTS*DEPTH)-97) downto 0) & input_pixel_x;

                pixel_bank_1 <= pixel_bank_1;
            elsif (bank_sel = '1' and ce_i = '1') then
                -- Shift in pixels from left to right
                pixel_bank_1 <= input_pixel_x & pixel_bank_1((ELEMENT_WIDTH*NUM_ELEMENTS*DEPTH)-1 downto (ELEMENT_WIDTH*NUM_ELEMENTS));

                -- Shift in pixels from right to left
                --pixel_bank_1 <= pixel_bank_1(((ELEMENT_WIDTH*NUM_ELEMENTS*DEPTH)-97) downto 0) & input_pixel_x;

                pixel_bank_0 <= pixel_bank_0;
            else
                pixel_bank_0 <= pixel_bank_0;
                pixel_bank_1 <= pixel_bank_1;
            end if;
        end if;
    end process;

    with bank_sel select
        pixel_output <= pixel_bank_0 when '1',
                        pixel_bank_1 when others;

    -- 2nd Delay register valid_o, needed to align data with row number
    process(clk_i, rst_i)
    begin
        if (rst_i = '1') then
            valid_delay_x <= '0';
        elsif rising_edge(clk_i) then
            if (ce_i = '1') then
                valid_delay_x <= valid_2_x;
            end if;
        end if;
    end process;

    -- Output current row number associated with output data for debug
    process(clk_i, rst_i)
    begin
        if (rst_i = '1') then
            row_num_o <= (others => '0');
        elsif rising_edge(clk_i) then
            if (ce_i = '1' and valid_delay_x = '1') then
                row_num_o <= std_logic_vector(to_unsigned(counter_x, 4));
            else
                row_num_o <= row_num_o;
            end if;
        end if;
    end process;

    -- Output data selection mux
    process(clk_i, rst_i)
    begin
        if (rst_i = '1') then
            data_o <= (others => '0');
            valid_o <= '0';
        elsif rising_edge(clk_i) then
            if (ce_i = '1' and valid_2_x = '1') then
                valid_o <= valid_delay_x;
                case counter_x is
                    when 0 => 
                        data_o <= 
                            pixel_output(683 downto 672) &  -- Depth 7
                            pixel_output(587 downto 576) &  -- Depth 6
                            pixel_output(491 downto 480) &  -- Depth 5
                            pixel_output(395 downto 384) &  -- Depth 4
                            pixel_output(299 downto 288) &  -- Depth 3
                            pixel_output(203 downto 192) &  -- Depth 2
                            pixel_output(107 downto 96) &   -- Depth 1
                            pixel_output(11 downto 0);      -- Depth 0
                    when 1 => 
                        data_o <= 
                            pixel_output(695 downto 684) &  
                            pixel_output(599 downto 588) &  
                            pixel_output(503 downto 492) &  
                            pixel_output(407 downto 396) &  
                            pixel_output(311 downto 300) &  
                            pixel_output(215 downto 204) &  
                            pixel_output(119 downto 108) &  
                            pixel_output(23 downto 12); 
                   when 2 => 
                        data_o <= 
                            pixel_output(707 downto 696) &  
                            pixel_output(611 downto 600) &  
                            pixel_output(515 downto 504) &  
                            pixel_output(419 downto 408) &  
                            pixel_output(323 downto 312) &  
                            pixel_output(227 downto 216) &  
                            pixel_output(131 downto 120) &  
                            pixel_output(35 downto 24); 
                   when 3 => 
                        data_o <= 
                            pixel_output(719 downto 708) &  
                            pixel_output(623 downto 612) &  
                            pixel_output(527 downto 516) &  
                            pixel_output(431 downto 420) &  
                            pixel_output(335 downto 324) &  
                            pixel_output(239 downto 228) &  
                            pixel_output(143 downto 132) &  
                            pixel_output(47 downto 36); 
                   when 4 => 
                        data_o <= 
                            pixel_output(731 downto 720) &  
                            pixel_output(635 downto 624) &  
                            pixel_output(539 downto 528) &  
                            pixel_output(443 downto 432) &  
                            pixel_output(347 downto 336) &  
                            pixel_output(251 downto 240) &  
                            pixel_output(155 downto 144) &  
                            pixel_output(59 downto 48); 
                   when 5 => 
                        data_o <= 
                            pixel_output(743 downto 732) &  
                            pixel_output(647 downto 636) &  
                            pixel_output(551 downto 540) &  
                            pixel_output(455 downto 444) &  
                            pixel_output(359 downto 348) &  
                            pixel_output(263 downto 252) &  
                            pixel_output(167 downto 156) &  
                            pixel_output(71 downto 60);  
                   when 6 => 
                        data_o <= 
                            pixel_output(755 downto 744) &  
                            pixel_output(659 downto 648) &  
                            pixel_output(563 downto 552) &  
                            pixel_output(467 downto 456) &  
                            pixel_output(371 downto 360) &  
                            pixel_output(275 downto 264) &  
                            pixel_output(179 downto 168) &  
                            pixel_output(83 downto 72);  
                   when 7 => 
                        data_o <= 
                            pixel_output(767 downto 756) &  
                            pixel_output(671 downto 660) &  
                            pixel_output(575 downto 564) &  
                            pixel_output(479 downto 468) &  
                            pixel_output(383 downto 372) &  
                            pixel_output(287 downto 276) &  
                            pixel_output(191 downto 180) &  
                            pixel_output(95 downto 84); 
                   when others =>
                        data_o <= (others => '0');
                end case;
            else
                data_o <= data_o;
                valid_o <= valid_o;
            end if;
        end if;
    end process;
    
end Behavioral;
