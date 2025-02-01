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
    type wr_state_t is (RST, WRITE_BANK0, WRITE_BANK1);
    type rd_state_t is (RST, READ_BANK0, READ_BANK1);
    signal wr_state_r : wr_state_t := RST;
    signal rd_state_r : rd_state_t := RST;

    signal wr_counter_r : integer := 0;
    signal rd_counter_r : integer := 0;

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
        if rising_edge(clk_i) then
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

        if (rst_i = '1') then
            wr_state_r <= RST;
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
                            pixel_bank_0 <= input_pixel_r & pixel_bank_0((ELEMENT_WIDTH*NUM_ELEMENTS*DEPTH)-1 downto (ELEMENT_WIDTH*NUM_ELEMENTS));
                    end if;

                    when WRITE_BANK1 =>
                        if valid_r = '1' then
                            pixel_bank_1 <= data_i & pixel_bank_1((ELEMENT_WIDTH*NUM_ELEMENTS*DEPTH)-1 downto (ELEMENT_WIDTH*NUM_ELEMENTS));
                    end if;
                end case;
        end if;
    end process;

    -- control fsm for reading data from the banks
    process(clk_i, rst_i)
    begin
        if rising_edge(clk_i) then
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

        if (rst_i = '1') then
            rd_state_r <= RST;
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

    process(clk_i, rst_i)
    begin
        if (rst_i = '1') then
            data_o <= (others => '0');
            valid_o <= '0';
        elsif rising_edge(clk_i) then
            valid_o <= '1' when rd_state_r /= RST else '0';
            case rd_counter_r is
                when 0 =>
                    data_o <= pixel_output(512 downto 504) &  -- Depth 7
                              pixel_output(440 downto 432) &  -- Depth 6
                              pixel_output(368 downto 360) &  -- Depth 5
                              pixel_output(296 downto 288) &  -- Depth 4
                              pixel_output(224 downto 216) &  -- Depth 3
                              pixel_output(152 downto 144) &  -- Depth 2
                              pixel_output(80 downto 72) &    -- Depth 1
                              pixel_output(8 downto 0);       -- Depth 0
                when 1 => 
                    data_o <= pixel_output(521 downto 513) &
                                  pixel_output(449 downto 441) &
                                  pixel_output(377 downto 369) &
                                  pixel_output(305 downto 297) &
                                  pixel_output(233 downto 225) &
                                  pixel_output(161 downto 153) &
                                  pixel_output(89 downto 81) &
                                  pixel_output(17 downto 9);
                when 2 => 
                                  data_o <= 
                                  pixel_output(530 downto 522) &
                                  pixel_output(458 downto 450) &
                                  pixel_output(386 downto 378) &
                                  pixel_output(314 downto 306) &
                                  pixel_output(242 downto 234) &
                                  pixel_output(170 downto 162) &
                                  pixel_output(98 downto 90) &
                                  pixel_output(26 downto 18);
                when 3 => 
                                  data_o <= 
                                  pixel_output(539 downto 531) &
                                  pixel_output(467 downto 459) &
                                  pixel_output(395 downto 387) &
                                  pixel_output(323 downto 315) &
                                  pixel_output(251 downto 243) &
                                  pixel_output(179 downto 171) &
                                  pixel_output(107 downto 99) &
                                  pixel_output(35 downto 27);
                when 4 => 
                                  data_o <= 
                                  pixel_output(548 downto 540) &
                                  pixel_output(476 downto 468) &
                                  pixel_output(404 downto 396) &
                                  pixel_output(332 downto 324) &
                                  pixel_output(260 downto 252) &
                                  pixel_output(188 downto 180) &
                                  pixel_output(116 downto 108) &
                                  pixel_output(44 downto 36);
                when 5 => 
                                  data_o <= 
                                  pixel_output(557 downto 549) &
                                  pixel_output(485 downto 477) &
                                  pixel_output(413 downto 405) &
                                  pixel_output(341 downto 333) &
                                  pixel_output(269 downto 261) &
                                  pixel_output(197 downto 189) &
                                  pixel_output(125 downto 117) &
                                  pixel_output(53 downto 45);
                when 6 => 
                                  data_o <= 
                                  pixel_output(566 downto 558) &
                                  pixel_output(494 downto 486) &
                                  pixel_output(422 downto 414) &
                                  pixel_output(350 downto 342) &
                                  pixel_output(278 downto 270) &
                                  pixel_output(206 downto 198) &
                                  pixel_output(134 downto 126) &
                                  pixel_output(62 downto 54);
                when 7 => 
                                  data_o <= 
                                  pixel_output(575 downto 567) &
                                  pixel_output(503 downto 495) &
                                  pixel_output(431 downto 423) &
                                  pixel_output(359 downto 351) &
                                  pixel_output(287 downto 279) &
                                  pixel_output(215 downto 207) &
                                  pixel_output(143 downto 135) &
                                  pixel_output(71 downto 63);

                when others =>
                    data_o <= (others => '0');
                    valid_o <= '0';
            end case;
        end if;
    end process;
    
end Behavioral;
