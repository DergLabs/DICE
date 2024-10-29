/* -----------------------------------------------------------------------------
// Author   	: Michael Haahr
// Email    	: mph93@drexel.edu
// Date     	: October 1, 2024
// File     	: spi_slave.sv
// Desc     	: SPI Slave module for recieveing and sending SPI data
//                Default SPI Mode 0
//                Assumes only one slave on SPI bus, MISO not tri-state buffered
// -----------------------------------------------------------------------------*/

`timescale 1ns/1ps

module spi_slave#(
    //configureable paramters
    parameter SPI_Mode = 0                          // SPI Mode, read/send on rising or falling edge
    // when data valid goes high read data in, when it goes low send it out
    // raises ready flag when ready to send more data
)(
    input clk,
    input SCK,
    input CS,
    input MOSI,
    output MISO
);
    
    reg [2:0] SCKr;                                 // store 3 clock cycles of SPI Clock
    reg [2:0] CSr;                                  // store 3 clock cycles of Chip Select
    reg [1:0] MOSIr;

    
    wire CPHA = (SPI_Mode && 2'b01);                // determine clock polarity from  SPI mode


    always @(posedge clk) begin
        SCKr <= {SCKr{1:0}, SCK};
    end


    if (CPHA) begin
        wire Data_Read = (SCKr[2:1] == 2'b10);      // if CPHA is 1, read on falling edge, write on rising
        wire Data_Write = (SCKr[2:1] == 2'b01);
    end
    else begin
        wire Data_Read = (SCKr[2:1] == 2'b01);      // if CPHA is 0, read on rising edge, write on falling
        wire Data_Write = (SCKr[2:1] == 2'b10);
    end


    always @(posedge clk) begin
        CSr <= {CSr[1:0], CS};                      // store 2 cycles of chip select to see when it falls low
    end

    wire CS_Active = ~CSr[1];                       // chip select is active low 
    wire CS_startmessage = (CSr[2:1]==2'b10);       // message starts at falling edge
    wire CS_endmessage = (CSr[2:1]==2'b01);         // message stops at rising edge

    always @(posedge clk) begin
        MOSIr <= {MOSIr[0], MOSI};
    end
    
    wire MOSI_data = MOSIr[1];                      // most recent MOSI data to read based on SPI Clock

    reg [2:0] bits_count;                           // count of recieved bits up to one byte long
    reg byte_recieved;                              // flag for when a full byte has been recieved
    reg [7:0] byte_data_recieved;                   // recieved data from MOSI
    reg [2:0] temp_recieved;                        // temp register for reading bits in for debouncing
    reg flag_read_next;                             // one clock cycle delay flag for debouncing

    // read in MOSI data 
    always @(posedge clk) begin
        if(~CS_Active) begin
            bits_count <= 3'b000;
        end
        else begin
            temp_recieved <= {temp_recieved[1:0], MOSI_data};

            if(Data_Read) begin
                flag_read_next <= 1'b1;
            end

            if(flag_read_next)
                flag_read_next <= 1'b0;

                bits_count <= bits_count + 3'b001;

                byte_data_recieved <= {byte_data_recieved[6:0], (temp_recieved[0] && temp_recieved[1] || temp_recieved[1] && temp_recieved[2] || temp_recieved[0] && temp_recieved[2])};

        end
    end

    // flag for if a full byte is recieved
    always @(posedge clk) begin
        byte_recieved <= CS_Active && Data_Read && (recieved_bits == 3'b111);
    end

    reg [7:0] byte_data_sent;
    reg [7:0] sent_messages;

    // count messages being sent
    always @(posedge clk) begin
        if(CS_startmessage) begin
            sent_messages <= sent_messages + 8'h1;
        end
    end

    
    always @(posedge clk) begin
        if(CS_Active) begin
            if(CS_startmessage) begin
                byte_data_sent <= sent_messages;    // first byte sent is message count
            end
            else begin
                if(Data_Write) begin
                    if(bits_count == 3'b000) begin
                        byte_data_sent <= 8'h00;
                    end
                    else begin
                        byte_data_sent <= {byte_data_sent[6:0], 1'b0};
                    end
                end
            end
        end
    end

    assign MISO = byte_data_sent[7];


endmodule