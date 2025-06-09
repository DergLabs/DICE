#ifndef _ADAPTIVE_MODEL_H_
#define _ADAPTIVE_MODEL_H_

#include <iostream>
#include <cstdint>

#include "model.h"
#include "range.h"

class AdaptiveModel16: public Model<uint8_t, uint16_t> {
private:
	class RangeNode {
	public:
		uint16_t left_count;
		uint16_t count;
	};

	class Timestamp {
	public:
		uint8_t symbol;
		uint16_t first_seen;
	};

	RangeNode encode_tree[256];
	RangeNode decode_tree[256];

	Timestamp timestamps[256];

	uint16_t encode_count;
	uint16_t decode_count;

	uint16_t encode_index;
	uint16_t decode_index;

public:
	AdaptiveModel16() {
		encode_index = 0;
		decode_index = 0;

		encode_count = 0;
		decode_count = 0;

		for(int i = 0; i < 256; i++) {
			timestamps[i].symbol = 0;
			timestamps[i].first_seen = 0;

			encode_tree[i].left_count = 0;
			encode_tree[i].count = 0;

			decode_tree[i].left_count = 0;
			decode_tree[i].count = 0;
		}
	}

	//Virtual functions
	Bounds<uint8_t, uint16_t> encode_symbol(uint8_t symbol) override {
		uint16_t lower = 0;
		uint16_t upper = 256;
		Bounds<uint8_t, uint16_t> bounds = Bounds<uint8_t, uint16_t>(0, 0, 0, 0);

		//Binary search over table to find match
		while(true) {
			uint16_t midpoint = (upper + lower) / 2;
			RangeNode& node = encode_tree[midpoint];

			if(symbol < midpoint) {
				upper = midpoint;
				node.left_count++;
			}
			else if(symbol > midpoint) {
				lower = midpoint;
				bounds.lower_bound += node.left_count + node.count;
			}
			else {
				if(node.count == 0) {
					timestamps[encode_index].symbol = symbol;
					timestamps[encode_index].first_seen = encode_count;
					encode_index++;

					node.count++;
					bounds.lower_bound += node.left_count;
					bounds.upper_bound = bounds.lower_bound + node.count;

					encode_count++;
					bounds.range = encode_count;
				}
				else {
					bounds.lower_bound += node.left_count;
					bounds.upper_bound = bounds.lower_bound + node.count;
					node.count++;

					bounds.range = encode_count;
					encode_count++;
				}

				break;
			}
		}

		bounds.symbol = symbol;

		return bounds;
	}

	Bounds<uint8_t, uint16_t> decode_symbol(uint16_t value) override {
		uint32_t lower = 0;
		uint32_t upper = 256;
		Bounds<uint8_t, uint16_t> bounds = Bounds<uint8_t, uint16_t>(0, 0, 0, 0);

		if(timestamps[decode_index].first_seen == decode_count) {
			uint8_t symbol = timestamps[decode_index].symbol;
			decode_index++;

			while(true) {
				uint16_t midpoint = (upper + lower) / 2;
				RangeNode& node = decode_tree[midpoint];

				if(symbol < midpoint) {
					upper = midpoint;
					node.left_count++;
				}
				else if(symbol > midpoint) {
					lower = midpoint;
					bounds.lower_bound += node.left_count + node.count;
				}
				else {
					node.count++;
					bounds.lower_bound += node.left_count;
					bounds.upper_bound = bounds.lower_bound + node.count;
					bounds.symbol = symbol;
					break;
				}
			}

			decode_count++;
			bounds.range = decode_count;
		}
		else {
			uint16_t lower_bound = 0;
			while(true) {
				uint16_t midpoint = (upper + lower) / 2;
				RangeNode& node = decode_tree[midpoint];

				if(value < lower_bound + node.left_count) {
					//std::cout << "less: " << value << std::endl;
					upper = midpoint;
					node.left_count++;
				}
				else if(value >= lower_bound + node.left_count + node.count) {
					//std::cout << "greater: " << value << std::endl;
					lower = midpoint;
					lower_bound += node.left_count + node.count;
				}
				else {
					bounds.lower_bound = lower_bound + node.left_count;
					bounds.upper_bound = bounds.lower_bound + node.count;
					bounds.symbol = midpoint;
					node.count++;
					break;
				}
			}
			bounds.range = decode_count;
			decode_count++;
		}

		return bounds;
	}

	uint16_t get_range() override {
		if(timestamps[decode_index].first_seen == decode_count) return decode_count + 1;
		return decode_count;
	}

	void reset() override {
		encode_index = 0;
		decode_index = 0;
		for(int i = 0; i < 256; i++) {
			encode_tree[i].left_count = 0;
			encode_tree[i].count = 0;

			decode_tree[i].left_count = 0;
			decode_tree[i].count = 0;

			timestamps[i].symbol = 0;
			timestamps[i].first_seen = 0;
		}
	}

	//This is gonna have to do for now
	size_t get_size_bytes() {
		return encode_index * 3 + 1;
	}

	int write_model_to_buffer(uint8_t *buffer) {
		int b_i = 0;

		//Write the number of table entries from encoding
		buffer[b_i++] = (encode_index & 0xFF) - 1;

		//Write the table entries
		for(int i = 0; i < encode_index; i++) {
			Timestamp& timestamp = timestamps[i];

			uint8_t symbol = timestamp.symbol;
			uint8_t u_first_seen = (timestamp.first_seen >> 8) & 0xFF;
			uint8_t l_first_seen = timestamp.first_seen & 0xFF;

			buffer[b_i++] = symbol;
			buffer[b_i++] = u_first_seen;
			buffer[b_i++] = l_first_seen;
		}

		return b_i;
	}

	int read_model_from_buffer(uint8_t *buffer) {
		int b_i = 0;

		//Read number of table entries in stream
		uint16_t num_entries = buffer[b_i++] + 1;

		//Read the table entries
		for(int i = 0; i < num_entries; i++) {
			Timestamp& timestamp = timestamps[i];

			uint8_t symbol = buffer[b_i++];
			uint8_t u_first_seen = buffer[b_i++];
			uint8_t l_first_seen = buffer[b_i++];

			timestamp.symbol = symbol;
			timestamp.first_seen = (((uint16_t) u_first_seen) << 8) | ((uint16_t) l_first_seen);
		}

		return b_i;
	}

	//Member functions specific to this class
	void print_encode_dist() {
		for(int i = 0; i < 256; i++) {
			uint8_t symbol = i;

			uint16_t lower = 0;
			uint16_t upper = 256;

			uint16_t lower_bound = 0;

			while(true) {
				uint16_t middle = (upper + lower) / 2;
				RangeNode& node = encode_tree[middle];

				if(symbol < middle) {
					upper = middle;
				}
				else if(symbol > middle) {
					lower = middle;
					lower_bound += node.left_count + node.count;
				}
				else {
					lower_bound += node.left_count;
					uint16_t upper_bound = lower_bound + node.count;

					if(lower_bound == upper_bound) break;
					std::printf("Symbol %03d: [%03d, %03d]\n", symbol, lower_bound, upper_bound);
					break;
				}
			}
		}
	}

	void print_decode_dist() {
		for(int i = 0; i < 256; i++) {
			uint8_t symbol = i;

			uint16_t lower = 0;
			uint16_t upper = 256;

			while(true) {
				uint16_t middle = (upper + lower) / 2;
				RangeNode& node = decode_tree[middle];

				if(symbol < middle) {
					upper = middle;
				}
				else if(symbol > middle) {
					lower = middle;
				}
				else {
					uint16_t lower_bound = node.left_count;
					uint16_t upper_bound = lower_bound + node.count;

					if(lower_bound == upper_bound) break;
					std::printf("Symbol %03d: [%03d, %03d]\n", symbol, lower_bound, upper_bound);
					break;
				}
			}
		}
	}

	void print_timestamps() {
		for(int i = 0; i < 256; i++) {
			if(timestamps[i].symbol == 0) return;
			std::cout << "[" << timestamps[i].symbol << ", " << (uint16_t) timestamps[i].symbol << ", " << timestamps[i].first_seen << "]" << std::endl;
		}
	}

};

#endif
