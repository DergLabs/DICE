#ifndef _BIT_BUFFER_H_
#define _BIT_BUFFER_H_

#include <iostream>
#include <cstdint>
#include <vector>

class BitBuffer {
private:
	uint32_t pending;

	uint8_t  write_value;
	uint32_t write_pointer;
	uint32_t read_pointer;
	uint32_t bit_count;

	std::vector<uint8_t> data;

	uint32_t b_write_pointer;

public:
	BitBuffer();

	void push_bit(uint8_t bit);
	uint8_t pop_bit();
	void push_pending();

	void write_complete();

	uint32_t get_bit_count();
	void print_bits();

	/*
	void write_stream(std::ostream& stream);
	void read_stream(std::istream& stream);
	*/

	//This is gonna have to do for now...
	void reset();
	int get_size_bytes();
	void write_byte_to_buffer(uint8_t *buffer);
	void read_byte_from_buffer(uint8_t *buffer);
};

BitBuffer::BitBuffer() {
	pending = 0;

	write_value = 0;
	write_pointer = 0;
	read_pointer = 0;

	bit_count = 0;

	b_write_pointer = 0;
}

void BitBuffer::push_bit(uint8_t bit) {
	uint8_t underflow_bit = bit == 0;
	//Add next bit
	write_value = write_value | (bit << write_pointer);
	write_pointer++;

	if(write_pointer == 8) {
		write_pointer = 0;
		data.push_back(write_value);
		write_value = 0;
	}

	bit_count++;

	//Add pending bits
	while(pending > 0) {
		write_value |= underflow_bit << write_pointer;
		write_pointer++;
		if(write_pointer == 8) {
			write_pointer = 0;
			data.push_back(write_value);
			write_value = 0;
		}
		bit_count++;
		pending--;
	}
}

uint8_t BitBuffer::pop_bit() {
	//Assume value is lower bound of range when reading past bit stream
	if(read_pointer >= bit_count) return 0;

	//Otherwise, return the next bit in the stream
	int byte_offset = read_pointer / 8;
	int bit_offset = read_pointer % 8;

	uint8_t value = (data[byte_offset] >> bit_offset) & 0x01;

	read_pointer++;

	return value;
}

void BitBuffer::push_pending() {
	pending++;
}

void BitBuffer::write_complete() {
	push_bit(1);
	if(write_pointer == 0) return;
	data.push_back(write_value);
}

uint32_t BitBuffer::get_bit_count() {
	return bit_count;
}

void BitBuffer::print_bits() {
	int temp = read_pointer;
	read_pointer = 0;
	for(uint32_t i = 0; i < bit_count; i++) std::cout << (char) (pop_bit() + '0');
	std::cout << std::endl;
	read_pointer = temp;
}

void BitBuffer::reset() {
	data.clear();

	read_pointer = 0;
	write_pointer = 0;

	bit_count = 0;

	b_write_pointer = 0;
}

int BitBuffer::get_size_bytes() {
	return data.size();
}

void BitBuffer::write_byte_to_buffer(uint8_t *buffer) {
	if(b_write_pointer < data.size()) {
		buffer[0] = data.at(b_write_pointer);
		b_write_pointer++;
	}
	else {
		buffer[0] = 0;
	}
}

void BitBuffer::read_byte_from_buffer(uint8_t *buffer) {
	//std::cout << "read_byte_from_buffer: " << (int) buffer[0] << std::endl;
	data.push_back(buffer[0]);
	bit_count += 8;
}
/*
void BitBuffer::write_stream(std::ostream& stream) {
	uint32_t size = data.size();
	stream.write((char *) size, sizeof(uint32_t));
	stream.write((char *) data.data(), data.size());
}

void BitBuffer::read_stream(std::istream& stream) {
	uint32_t size;
	stream.read((char *) size, sizeof(uint32_t));
	data.reserve(size);
	stream.read((char *) data.data(), size);
}
*/
#endif
