#ifndef _ARITHMETIC_CODEC_H_
#define _ARITHMETIC_CODEC_H_

#include "codec.h"
#include "range.h"
#include "model.h"

class ArithmeticCodec: public Codec<uint8_t, uint32_t> {
public:
	ArithmeticCodec(Model<uint8_t, uint32_t>& model) : Codec(model) {}

	void encode(std::istream& input, std::ostream& output, size_t symbol_count) {
		BitBuffer buffer = BitBuffer();
		uint64_t upper = 0xFFFFFFFF;
		uint64_t lower = 0x00000000;
		uint64_t range;

		for(int i = 0; i < symbol_count; i++) {
			//Get bounds for symbol
			uint8_t c;
			input.read((char *) &c, 1);
			Bounds<uint8_t, uint32_t> bounds = model.encode_symbol(c);

			//Encode symbol
			range = upper - lower + 1;
			upper = lower + range * (uint64_t) bounds.upper_bound / (uint64_t) bounds.range - 1;
			lower = lower + range * (uint64_t) bounds.lower_bound / (uint64_t) bounds.range;

			//Renormalize working range
			while(true) {
				//upper passed the 0.5 threshold, cannot be higher than 0.5
				if(upper < 0x80000000) {
					upper = ((upper << 1) & 0xFFFFFFFF) | 0x1;
					lower = (lower << 1) & 0xFFFFFFFF;
					buffer.push_bit(0);
				}
				//lower passed the 0.5 threshold, cannot be lower than 0.5
				else if(lower >= 0x80000000) {
					upper = ((upper << 1) & 0xFFFFFFFF) | 0x1;
					lower = (lower << 1) & 0xFFFFFFFF;
					buffer.push_bit(1);
				}
				//upper's MSBs == 2'b10 and lower's BSBs == 2'b01
				else if((upper & 0xC0000000) == 0x80000000 && (lower & 0xC0000000) == 0x40000000) {
					upper = (upper & 0x80000000) | ((upper << 1) & 0x7FFFFFFF) | 0x1;
					lower = (lower & 0x80000000) | ((lower << 1) & 0x7FFFFFFF);
					//Push underflow bit
					buffer.push_pending();
				}
				else {
					break;
				}
			}
		}

		buffer.write_complete();

		model.write_table(output);
		buffer.write_stream(output);
	}

	void decode(std::istream& input, std::ostream& output) {
		uint64_t upper = 0xFFFFFFFF;
		uint64_t lower = 0x00000000;
		uint32_t code = 0;

		BitBuffer buffer;

		model.read_table(input);
		buffer.read_stream(input);

		//Initialize code value
		for(int i = 0; i < 32; i++) {
			code = (code << 1) | buffer.pop_bit();
		}

		for(int i = 0; i < symbol_count; i++) {
			//Get number representing symbol
			uint64_t range = upper - lower + 1;
			uint64_t temp = (code - lower) * model.get_range() / range;

			//Decode symbol
			Bounds<uint8_t, uint32_t> bounds = model.decode_symbol((uint32_t) temp);
			char c = bounds.symbol;
			output.write(&c, 1);

			//Update bounds, same as encoder
			upper = lower + range * (uint64_t) bounds.upper_bound / (uint64_t) bounds.range - 1;
			lower = lower + range * (uint64_t) bounds.lower_bound / (uint64_t) bounds.range;

			//Renormalize working range
			while(true) {
				//upper passed the 0.5 threshold, cannot be higher than 0.5
				if(upper < 0x80000000) {
					upper = ((upper << 1) & 0xFFFFFFFF) | 0x1;
					lower = (lower << 1) & 0xFFFFFFFF;
					code = (code << 1) | buffer.pop_bit();
				}
				//lower passed the 0.5 threshold, cannot be lower than 0.5
				else if(lower >= 0x80000000) {
					upper = ((upper << 1) & 0xFFFFFFFF) | 0x1;
					lower = (lower << 1) & 0xFFFFFFFF;
					code = (code << 1) | buffer.pop_bit();
				}
				//upper's MSBs == 2'b10 and lower's BSBs == 2'b01
				else if((upper & 0xC0000000) == 0x80000000 && (lower & 0xC0000000) == 0x40000000) {
					upper = (upper & 0x80000000) | ((upper << 1) & 0x7FFFFFFF) | 0x1;
					lower = (lower & 0x80000000) | ((lower << 1) & 0x7FFFFFFF);
					//Pop bit ahead
					code = (code & 0x80000000) | ((code << 1) & 0x7FFFFFFF) | buffer.pop_bit();
				}
				else {
					break;
				}
			}
		}
	}
};

#endif
