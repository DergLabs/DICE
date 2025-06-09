#ifndef _DEFAULT_MODEL_H_
#define _DEFAULT_MODEL_H_

#include <iostream>
#include <cstdint>

#include "model.h"
#include "range.h"

class DefaultModel: public Model<uint8_t, uint32_t> {
private:
	class RangeNode {
	public:
		uint32_t left_count;
		uint32_t count;
	};

	RangeNode encode_tree[256];
	RangeNode decode_tree[256];

	uint32_t encode_count;
	uint32_t decode_count;

	void init_tables() {
		//Guh
		for(int i = 0; i < 256; i++) {
			encode_tree[i].left_count = 0;
			encode_tree[i].count = 0;

			decode_tree[i].left_count = 0;
			decode_tree[i].count = 0;
		}

		//Tables initialized to uniform distribution
		encode_count = 256;
		decode_count = 256;

		//I am lazy and decided to initialize the left_count values this way instead of precomputing each value
		for(int i = 0; i < 256; i++) {
			uint8_t symbol = (uint8_t) i;

			uint32_t lower = 0;
			uint32_t upper = 256;

			while(true) {
				uint32_t midpoint = (upper + lower) / 2;
				RangeNode& e_node = encode_tree[midpoint];
				RangeNode& d_node = decode_tree[midpoint];

				if(symbol < midpoint) {
					upper = midpoint;
					e_node.left_count++;
					d_node.left_count++;
				}
				else if(symbol > midpoint) {
					lower = midpoint;
				}
				else {
					e_node.count++;
					d_node.count++;
					break;
				}
			}
		}
	}

public:
	DefaultModel() {
		init_tables();
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
				bounds.lower_bound += node.left_count;
				bounds.upper_bound = bounds.lower_bound + node.count;
				node.count++;

				bounds.range = encode_count;
				encode_count++;

				bounds.symbol = symbol;
				break;
			}
		}

		return bounds;
	}

	Bounds<uint8_t, uint32_t> decode_symbol(uint32_t value) override {
		uint32_t lower = 0;
		uint32_t upper = 256;
		Bounds<uint8_t, uint32_t> bounds = Bounds<uint8_t, uint32_t>(0, 0, 0, 0);

		//Binary search over table to find match
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

		return bounds;
	}

	uint32_t get_range() override {
		return decode_count;
	}

	void reset() override {
		init_tables();
	}
};

#endif
