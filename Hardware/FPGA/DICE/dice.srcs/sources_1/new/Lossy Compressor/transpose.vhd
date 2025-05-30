----------------------------------------------------------------------------------
-- Company: Drexel University
-- Engineer: John Hofmeyr & Claudia Offutt
-- 
-- Create Date: 01/21/2025 11:13:08 PM
-- Design Name: 
-- Module Name: transpose - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: Implements dual transposition buffer. Transposes 8x8 matrix one roww per clock cycle
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
        -- Leave these values as 8, module is designed for 8x8 matrix
        NUM_ELEMENTS : integer := 8; -- Number of parallel data elements, DO NOT CHANGE 
        DEPTH : integer := 8 -- How many elements to store, DO NOT CHANGE
    );
    port ( 
        clk_i       : in std_logic;
        rst_i       : in std_logic;
        data_i      : in std_logic_vector((ELEMENT_WIDTH*NUM_ELEMENTS)-1 downto 0);
        valid_i     : in std_logic;

        data_o      : out std_logic_vector((ELEMENT_WIDTH*NUM_ELEMENTS)-1 downto 0);
        valid_o     : out std_logic
    );
end transpose;

architecture Behavioral of transpose is

    type wr_state_t is (RST, WRITE_BANK0, WRITE_BANK1);
    type rd_state_t is (RST, READ_BANK0, READ_BANK1);
    signal wr_state_r : wr_state_t := RST;
    signal rd_state_r : rd_state_t := RST;

    signal wr_counter_r : integer := 0; -- Counter for the write state, only goes from 0-7
    signal rd_counter_r : integer := 0; -- Counter for the read state, only goes from 0-7

    signal input_pixel_r : std_logic_vector((ELEMENT_WIDTH*NUM_ELEMENTS)-1 downto 0) := (others => '0');
    signal valid_r : std_logic := '0';

    signal pixel_bank_0 : std_logic_vector((ELEMENT_WIDTH*NUM_ELEMENTS*DEPTH)-1 downto 0) := (others => '0');
    signal pixel_bank_1 : std_logic_vector((ELEMENT_WIDTH*NUM_ELEMENTS*DEPTH)-1 downto 0) := (others => '0');

    signal pixel_output : std_logic_vector((ELEMENT_WIDTH*NUM_ELEMENTS*DEPTH)-1 downto 0) := (others => '0');

begin

    -- input data register
    process(clk_i, rst_i)
    begin 
        if (rst_i = '1') then
            input_pixel_r <= (others => '0');
            valid_r <= '0';
        elsif rising_edge(clk_i) then
            input_pixel_r <= data_i;
            valid_r <= valid_i;
        end if;
    end process;

    -- control fsm for the writing of the data to the banks
    process(clk_i, rst_i)
    begin
        if(rst_i = '1') then
            wr_state_r <= RST;
            wr_counter_r <= 0;
        elsif rising_edge(clk_i) then
            case wr_state_r is
                when RST =>
                    wr_counter_r <= 0;
                    if valid_i = '1' then
                        wr_state_r <= WRITE_BANK0;
                    end if;

                when WRITE_BANK0 =>
                    if valid_i = '1' then
                        if wr_counter_r = DEPTH-1 then
                            wr_state_r <= WRITE_BANK1;
                            wr_counter_r <= 0;
                        else
                            wr_counter_r <= wr_counter_r + 1;
                        end if;
                    end if;

                when WRITE_BANK1 =>
                    if valid_i = '1' then
                        if wr_counter_r = DEPTH-1 then
                            wr_state_r <= WRITE_BANK0;
                            wr_counter_r <= 0;
                        else
                            wr_counter_r <= wr_counter_r + 1;
                        end if;
                    end if;
            end case;

        end if;
    end process;

    -- write data to the banks
    process(clk_i, rst_i)
    begin
        if (rst_i = '1') then
            pixel_bank_0 <= (others => '0');
            pixel_bank_1 <= (others => '0');
        elsif rising_edge(clk_i) then
            case wr_state_r is
                when RST =>
                        pixel_bank_0 <= (others => '0');
                        pixel_bank_1 <= (others => '0');

                    when WRITE_BANK0 =>
                        if valid_r = '1' then
                            -- Shift in 8 pixels from left to right
                            pixel_bank_0 <= input_pixel_r & pixel_bank_0((ELEMENT_WIDTH*NUM_ELEMENTS*DEPTH)-1 downto (ELEMENT_WIDTH*NUM_ELEMENTS));
                    end if;

                    when WRITE_BANK1 =>
                        if valid_r = '1' then
                            -- Shift in 8 pixels from left to right
                            pixel_bank_1 <= data_i & pixel_bank_1((ELEMENT_WIDTH*NUM_ELEMENTS*DEPTH)-1 downto (ELEMENT_WIDTH*NUM_ELEMENTS));
                    end if;
                end case;
        end if;
    end process;

    -- control fsm for reading data from the banks
    process(clk_i, rst_i)
    begin
        if(rst_i = '1') then
            rd_state_r <= RST;
            rd_counter_r <= 0;
        elsif rising_edge(clk_i) then
            case rd_state_r is
                when RST =>
                    rd_counter_r <= 0;
                    if ((wr_counter_r = DEPTH-1) and (wr_state_r = WRITE_BANK0)) then
                            rd_state_r <= READ_BANK0;
                    end if;

                when READ_BANK0 =>
                    rd_counter_r <= rd_counter_r + 1;
                    if ((wr_counter_r = DEPTH-1) and (wr_state_r = WRITE_BANK1)) then
                        rd_state_r <= READ_BANK1;
                        rd_counter_r <= 0;
                    end if;

                when READ_BANK1 =>
                    rd_counter_r <= rd_counter_r + 1;
                    if ((wr_counter_r = DEPTH-1) and (wr_state_r = WRITE_BANK0)) then
                        rd_state_r <= READ_BANK0;
                        rd_counter_r <= 0;
                    end if;
            end case;
        end if;
    end process;
   
    -- read data from the banks
    process(all)
    begin
        case rd_state_r is
            when RST =>
                pixel_output <= (others => '0');

            when READ_BANK0 =>
                pixel_output <= pixel_bank_0;

            when READ_BANK1 =>
                pixel_output <= pixel_bank_1;
        end case;
    end process;

    -- output data register
    process(clk_i, rst_i)
    begin
        if (rst_i = '1') then
            data_o <= (others => '0');
            valid_o <= '0';
        elsif rising_edge(clk_i) then
            valid_o <= '1' when rd_state_r /= RST else '0';
            case rd_counter_r is
                when 0 =>
                    -- Col 0
                    data_o <=   pixel_output((ELEMENT_WIDTH * 56) + (ELEMENT_WIDTH - 1) downto (ELEMENT_WIDTH * 56)) &  -- Pixel 56
                                pixel_output((ELEMENT_WIDTH * 48) + (ELEMENT_WIDTH - 1) downto (ELEMENT_WIDTH * 48)) &  -- Pixel 48
                                pixel_output((ELEMENT_WIDTH * 40) + (ELEMENT_WIDTH - 1) downto (ELEMENT_WIDTH * 40)) &  -- Pixel 40
                                pixel_output((ELEMENT_WIDTH * 32) + (ELEMENT_WIDTH - 1) downto (ELEMENT_WIDTH * 32)) &  -- Pixel 32
                                pixel_output((ELEMENT_WIDTH * 24) + (ELEMENT_WIDTH - 1) downto (ELEMENT_WIDTH * 24)) &  -- Pixel 24
                                pixel_output((ELEMENT_WIDTH * 16) + (ELEMENT_WIDTH - 1) downto (ELEMENT_WIDTH * 16)) &  -- Pixel 16
                                pixel_output((ELEMENT_WIDTH * 8) + (ELEMENT_WIDTH - 1) downto (ELEMENT_WIDTH * 8)) &  -- Pixel 8
                                pixel_output((ELEMENT_WIDTH * 0) + (ELEMENT_WIDTH - 1) downto (ELEMENT_WIDTH * 0));  -- Pixel 0
                when 1 => 
                    -- Col 1
                    data_o <=   pixel_output((ELEMENT_WIDTH * 57) + (ELEMENT_WIDTH - 1) downto (ELEMENT_WIDTH * 57)) &  -- Pixel 57
                                pixel_output((ELEMENT_WIDTH * 49) + (ELEMENT_WIDTH - 1) downto (ELEMENT_WIDTH * 49)) &  -- Pixel 49
                                pixel_output((ELEMENT_WIDTH * 41) + (ELEMENT_WIDTH - 1) downto (ELEMENT_WIDTH * 41)) &  -- Pixel 41
                                pixel_output((ELEMENT_WIDTH * 33) + (ELEMENT_WIDTH - 1) downto (ELEMENT_WIDTH * 33)) &  -- Pixel 33
                                pixel_output((ELEMENT_WIDTH * 25) + (ELEMENT_WIDTH - 1) downto (ELEMENT_WIDTH * 25)) &  -- Pixel 25
                                pixel_output((ELEMENT_WIDTH * 17) + (ELEMENT_WIDTH - 1) downto (ELEMENT_WIDTH * 17)) &  -- Pixel 17
                                pixel_output((ELEMENT_WIDTH * 9) + (ELEMENT_WIDTH - 1) downto (ELEMENT_WIDTH * 9)) &  -- Pixel 9
                                pixel_output((ELEMENT_WIDTH * 1) + (ELEMENT_WIDTH - 1) downto (ELEMENT_WIDTH * 1));  -- Pixel 1
                when 2 => 
                    -- Col 2
                    data_o <=   pixel_output((ELEMENT_WIDTH * 58) + (ELEMENT_WIDTH - 1) downto (ELEMENT_WIDTH * 58)) &  -- Pixel 58
                                pixel_output((ELEMENT_WIDTH * 50) + (ELEMENT_WIDTH - 1) downto (ELEMENT_WIDTH * 50)) &  -- Pixel 50
                                pixel_output((ELEMENT_WIDTH * 42) + (ELEMENT_WIDTH - 1) downto (ELEMENT_WIDTH * 42)) &  -- Pixel 42
                                pixel_output((ELEMENT_WIDTH * 34) + (ELEMENT_WIDTH - 1) downto (ELEMENT_WIDTH * 34)) &  -- Pixel 34
                                pixel_output((ELEMENT_WIDTH * 26) + (ELEMENT_WIDTH - 1) downto (ELEMENT_WIDTH * 26)) &  -- Pixel 26
                                pixel_output((ELEMENT_WIDTH * 18) + (ELEMENT_WIDTH - 1) downto (ELEMENT_WIDTH * 18)) &  -- Pixel 18
                                pixel_output((ELEMENT_WIDTH * 10) + (ELEMENT_WIDTH - 1) downto (ELEMENT_WIDTH * 10)) &  -- Pixel 10
                                pixel_output((ELEMENT_WIDTH * 2) + (ELEMENT_WIDTH - 1) downto (ELEMENT_WIDTH * 2));  -- Pixel 2
                when 3 => 
                    -- Col 3
                    data_o <=   pixel_output((ELEMENT_WIDTH * 59) + (ELEMENT_WIDTH - 1) downto (ELEMENT_WIDTH * 59)) &  -- Pixel 59
                                pixel_output((ELEMENT_WIDTH * 51) + (ELEMENT_WIDTH - 1) downto (ELEMENT_WIDTH * 51)) &  -- Pixel 51
                                pixel_output((ELEMENT_WIDTH * 43) + (ELEMENT_WIDTH - 1) downto (ELEMENT_WIDTH * 43)) &  -- Pixel 43
                                pixel_output((ELEMENT_WIDTH * 35) + (ELEMENT_WIDTH - 1) downto (ELEMENT_WIDTH * 35)) &  -- Pixel 35
                                pixel_output((ELEMENT_WIDTH * 27) + (ELEMENT_WIDTH - 1) downto (ELEMENT_WIDTH * 27)) &  -- Pixel 27
                                pixel_output((ELEMENT_WIDTH * 19) + (ELEMENT_WIDTH - 1) downto (ELEMENT_WIDTH * 19)) &  -- Pixel 19
                                pixel_output((ELEMENT_WIDTH * 11) + (ELEMENT_WIDTH - 1) downto (ELEMENT_WIDTH * 11)) &  -- Pixel 11
                                pixel_output((ELEMENT_WIDTH * 3) + (ELEMENT_WIDTH - 1) downto (ELEMENT_WIDTH * 3));  -- Pixel 3
                when 4 => 
                    -- Col 4
                    data_o <=   pixel_output((ELEMENT_WIDTH * 60) + (ELEMENT_WIDTH - 1) downto (ELEMENT_WIDTH * 60)) &  -- Pixel 60
                                pixel_output((ELEMENT_WIDTH * 52) + (ELEMENT_WIDTH - 1) downto (ELEMENT_WIDTH * 52)) &  -- Pixel 52
                                pixel_output((ELEMENT_WIDTH * 44) + (ELEMENT_WIDTH - 1) downto (ELEMENT_WIDTH * 44)) &  -- Pixel 44
                                pixel_output((ELEMENT_WIDTH * 36) + (ELEMENT_WIDTH - 1) downto (ELEMENT_WIDTH * 36)) &  -- Pixel 36
                                pixel_output((ELEMENT_WIDTH * 28) + (ELEMENT_WIDTH - 1) downto (ELEMENT_WIDTH * 28)) &  -- Pixel 28
                                pixel_output((ELEMENT_WIDTH * 20) + (ELEMENT_WIDTH - 1) downto (ELEMENT_WIDTH * 20)) &  -- Pixel 20
                                pixel_output((ELEMENT_WIDTH * 12) + (ELEMENT_WIDTH - 1) downto (ELEMENT_WIDTH * 12)) &  -- Pixel 12
                                pixel_output((ELEMENT_WIDTH * 4) + (ELEMENT_WIDTH - 1) downto (ELEMENT_WIDTH * 4));  -- Pixel 4
                when 5 => 
                    -- Col 5
                    data_o <=   pixel_output((ELEMENT_WIDTH * 61) + (ELEMENT_WIDTH - 1) downto (ELEMENT_WIDTH * 61)) &  -- Pixel 61
                                pixel_output((ELEMENT_WIDTH * 53) + (ELEMENT_WIDTH - 1) downto (ELEMENT_WIDTH * 53)) &  -- Pixel 53
                                pixel_output((ELEMENT_WIDTH * 45) + (ELEMENT_WIDTH - 1) downto (ELEMENT_WIDTH * 45)) &  -- Pixel 45
                                pixel_output((ELEMENT_WIDTH * 37) + (ELEMENT_WIDTH - 1) downto (ELEMENT_WIDTH * 37)) &  -- Pixel 37
                                pixel_output((ELEMENT_WIDTH * 29) + (ELEMENT_WIDTH - 1) downto (ELEMENT_WIDTH * 29)) &  -- Pixel 29
                                pixel_output((ELEMENT_WIDTH * 21) + (ELEMENT_WIDTH - 1) downto (ELEMENT_WIDTH * 21)) &  -- Pixel 21
                                pixel_output((ELEMENT_WIDTH * 13) + (ELEMENT_WIDTH - 1) downto (ELEMENT_WIDTH * 13)) &  -- Pixel 13
                                pixel_output((ELEMENT_WIDTH * 5) + (ELEMENT_WIDTH - 1) downto (ELEMENT_WIDTH * 5));  -- Pixel 5
                when 6 => 
                    -- Col 6
                    data_o <=   pixel_output((ELEMENT_WIDTH * 62) + (ELEMENT_WIDTH - 1) downto (ELEMENT_WIDTH * 62)) &  -- Pixel 62
                                pixel_output((ELEMENT_WIDTH * 54) + (ELEMENT_WIDTH - 1) downto (ELEMENT_WIDTH * 54)) &  -- Pixel 54
                                pixel_output((ELEMENT_WIDTH * 46) + (ELEMENT_WIDTH - 1) downto (ELEMENT_WIDTH * 46)) &  -- Pixel 46
                                pixel_output((ELEMENT_WIDTH * 38) + (ELEMENT_WIDTH - 1) downto (ELEMENT_WIDTH * 38)) &  -- Pixel 38
                                pixel_output((ELEMENT_WIDTH * 30) + (ELEMENT_WIDTH - 1) downto (ELEMENT_WIDTH * 30)) &  -- Pixel 30
                                pixel_output((ELEMENT_WIDTH * 22) + (ELEMENT_WIDTH - 1) downto (ELEMENT_WIDTH * 22)) &  -- Pixel 22
                                pixel_output((ELEMENT_WIDTH * 14) + (ELEMENT_WIDTH - 1) downto (ELEMENT_WIDTH * 14)) &  -- Pixel 14
                                pixel_output((ELEMENT_WIDTH * 6) + (ELEMENT_WIDTH - 1) downto (ELEMENT_WIDTH * 6));  -- Pixel 6
                when 7 => 
                    -- Col 7
                    data_o <=   pixel_output((ELEMENT_WIDTH * 63) + (ELEMENT_WIDTH - 1) downto (ELEMENT_WIDTH * 63)) &  -- Pixel 63
                                pixel_output((ELEMENT_WIDTH * 55) + (ELEMENT_WIDTH - 1) downto (ELEMENT_WIDTH * 55)) &  -- Pixel 55
                                pixel_output((ELEMENT_WIDTH * 47) + (ELEMENT_WIDTH - 1) downto (ELEMENT_WIDTH * 47)) &  -- Pixel 47
                                pixel_output((ELEMENT_WIDTH * 39) + (ELEMENT_WIDTH - 1) downto (ELEMENT_WIDTH * 39)) &  -- Pixel 39
                                pixel_output((ELEMENT_WIDTH * 31) + (ELEMENT_WIDTH - 1) downto (ELEMENT_WIDTH * 31)) &  -- Pixel 31
                                pixel_output((ELEMENT_WIDTH * 23) + (ELEMENT_WIDTH - 1) downto (ELEMENT_WIDTH * 23)) &  -- Pixel 23
                                pixel_output((ELEMENT_WIDTH * 15) + (ELEMENT_WIDTH - 1) downto (ELEMENT_WIDTH * 15)) &  -- Pixel 15
                                pixel_output((ELEMENT_WIDTH * 7) + (ELEMENT_WIDTH - 1) downto (ELEMENT_WIDTH * 7));  -- Pixel 7
                when others =>
                    data_o <= (others => '0');
                    valid_o <= '0';
            end case;
        end if;
    end process;
    
end Behavioral;
