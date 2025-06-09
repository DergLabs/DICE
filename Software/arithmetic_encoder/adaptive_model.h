#ifndef _ADAPTIVE_MODEL_H_
#define _ADAPTIVE_MODEL_H_

#include <iostream>
#include <cstdint>

#include "model.h"
#include "range.h"

class AdaptiveModel: public Model<uint8_t, uint32_t> {
private:
	class RangeNode {
	public:
		uint32_t left_count;
		uint32_t count;
	};

	class Timestamp {
	public:
		uint8_t symbol;
		uint32_t first_seen;
	};

	RangeNode encode_tree[256];
	RangeNode decode_tree[256];

	Timestamp timestamps[256];

	uint32_t encode_count;
	uint32_t decode_count;

	uint32_t encode_index;
	uint32_t decode_index;

public:
	AdaptiveModel() {
		std::cout << "AdaptiveModel()" << std::endl;

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

	Bounds<uint8_t, uint32_t> encode_symbol(uint8_t symbol) override {
		uint32_t lower = 0;
		uint32_t upper = 256;
		Bounds<uint8_t, uint32_t> bounds = Bounds<uint8_t, uint32_t>(0, 0, 0, 0);

		//Binary search over table to find match
		while(true) {
			uint32_t midpoint = (upper + lower) / 2;
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

	Bounds<uint8_t, uint32_t> decode_symbol(uint32_t value) override {
		uint32_t lower = 0;
		uint32_t upper = 256;
		Bounds<uint8_t, uint32_t> bounds = Bounds<uint8_t, uint32_t>(0, 0, 0, 0);

		if(timestamps[decode_index].first_seen == decode_count) {
			uint8_t symbol = timestamps[decode_index].symbol;
			decode_index++;

			while(true) {
				uint32_t midpoint = (upper + lower) / 2;
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
			uint32_t lower_bound = 0;
			while(true) {
				uint32_t midpoint = (upper + lower) / 2;
				RangeNode& node = decode_tree[midpoint];

				if(value < lower_bound + node.left_count) {
					upper = midpoint;
					node.left_count++;
				}
				else if(value >= lower_bound + node.left_count + node.count) {
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

	uint32_t get_range() override {
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

	void print_encode_dist() {
		for(int i = 0; i < 256; i++) {
			uint8_t symbol = i;

			uint32_t lower = 0;
			uint32_t upper = 256;

			uint32_t lower_bound = 0;

			while(true) {
				uint32_t middle = (upper + lower) / 2;
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
					uint32_t upper_bound = lower_bound + node.count;

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

			uint32_t lower = 0;
			uint32_t upper = 256;

			while(true) {
				uint32_t middle = (upper + lower) / 2;
				RangeNode& node = decode_tree[middle];

				if(symbol < middle) {
					upper = middle;
				}
				else if(symbol > middle) {
					lower = middle;
				}
				else {
					uint32_t lower_bound = node.left_count;
					uint32_t upper_bound = lower_bound + node.count;

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
			std::cout << "[" << timestamps[i].symbol << ", " << (uint32_t) timestamps[i].symbol << ", " << timestamps[i].first_seen << "]" << std::endl;
		}
	}

};

#endif
