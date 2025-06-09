#ifndef _UNIFORM_MODEL_H_
#define _UNIFORM_MODEL_H_

#include <iostream>
#include <cstdint>
#include "model.h"
#include "range.h"

class UniformModel: public Model<uint8_t, uint32_t> {
public:
	UniformModel() {}

	Bounds<uint8_t, uint32_t> encode_symbol(uint8_t symbol) override {
		uint32_t lower_bound = symbol;
		uint32_t upper_bound = symbol+ 1;
		uint32_t range = 256;
		return Bounds<uint8_t, uint32_t>(lower_bound, upper_bound, range, symbol);
	}

	Bounds<uint8_t, uint32_t> decode_symbol(uint32_t value) override {
		uint32_t lower_bound = value;
		uint32_t upper_bound = value + 1;
		uint32_t denominator = 256;
		return Bounds<uint8_t, uint32_t>(lower_bound, upper_bound, denominator, (uint8_t) value);
	}

	uint32_t get_range() override {
		return 256;
	}

	void reset() override {}
};

#endif
