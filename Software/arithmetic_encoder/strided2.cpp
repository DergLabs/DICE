#include <iostream>
#include <fstream>
#include <string>
#include <cstdint>
#include <vector>

#include "bit_buffer.h"
#include "uniform_model.h"
#include "adaptive_model_16.h"

void print_bits(uint32_t value, int num_bits) {
	for(int i = num_bits - 1; i >= 0; i--) {
		uint8_t bit = (value >> i) & 0x01;
		std::printf("%u", bit);
	}
}

template <uint32_t num_streams>
class StridedCodec {
private:
	BitBuffer buffers[num_streams];
public:
	StridedCodec() {
		for(int i = 0; i < num_streams; i++) {
			buffers[i] = BitBuffer();
		}
	}

	void encode(std::string& message, Model<uint8_t, uint16_t>& model) {
		uint32_t uppers[num_streams];
		uint32_t lowers[num_streams];
		int index = 0;

		for(int i = 0; i < num_streams; i++) {
			uppers[i] = 0xFFFF;
			lowers[i] = 0x0000;
		}

		for(std::string::iterator it = message.begin(); it != message.end(); it++) {
			uint32_t upper = uppers[index];
			uint32_t lower = lowers[index];

			print_bits(upper, 16);
			std::printf(" ");
			print_bits(lower, 16);
			std::printf(" ");

			//Get bounds for symbol
			char c = *it;
			Bounds<uint8_t, uint16_t> bounds = model.encode_symbol(c);

			//Encode symbol
			uint32_t range = upper - lower + 1;
			uint32_t range_inv = (uint32_t) 0x10000 / (uint32_t) bounds.range;

			uint32_t t_upper = range * bounds.upper_bound;
			uint32_t u_upper = ((t_upper >> 16) & 0xFFFF) * range_inv;
			uint32_t l_upper = (t_upper & 0xFFFF) * range_inv;

			uint32_t t_lower = range * bounds.lower_bound;
			uint32_t u_lower = ((t_lower >> 16) & 0xFFFF) * range_inv;
			uint32_t l_lower = (t_lower & 0xFFFF) * range_inv;

			uint32_t part_upper = u_upper + (l_upper >> 16);
			uint32_t part_lower = u_lower + (l_lower >> 16);

			upper = lower + part_upper - 1;
			lower = lower + part_lower;

			print_bits(upper, 16);
			std::printf(" ");
			print_bits(lower, 16);
			std::printf(" ");
			print_bits(bounds.upper_bound, 16);
			std::printf(" ");
			print_bits(bounds.lower_bound, 16);
			std::printf(" ");
			print_bits(range_inv, 17);
			std::printf("\n");

			//Renormalize working range
			while(true) {
				//upper passed the 0.5 threshold, cannot be higher than 0.5
				if(upper < 0x8000) {
					upper = ((upper << 1) & 0xFFFF) | 0x1;
					lower = (lower << 1) & 0xFFFF;
					buffers[index].push_bit(0);
				}
				//lower passed the 0.5 threshold, cannot be lower than 0.5
				else if(lower >= 0x8000) {
					upper = ((upper << 1) & 0xFFFF) | 0x1;
					lower = (lower << 1) & 0xFFFF;
					buffers[index].push_bit(1);
				}
				//upper's MSBs == 2'b10 and lower's BSBs == 2'b01
				else if((upper & 0xC000) == 0x8000 && (lower & 0xC000) == 0x4000) {
					upper = (upper & 0x8000) | ((upper << 1) & 0x7FFF) | 0x1;
					lower = (lower & 0x8000) | ((lower << 1) & 0x7FFF);
					//Push underflow bit
					buffers[index].push_pending();
				}
				else {
					break;
				}
			}

			uppers[index] = upper;
			lowers[index] = lower;

			index = (index + 1) % num_streams;
		}

		for(int i = 0; i < num_streams; i++) buffers[i].write_complete();
	}

	void decode(std::string& message, Model<uint8_t, uint16_t>& model) {
		//CharModel model;
		uint32_t uppers[num_streams];
		uint32_t lowers[num_streams];
		uint16_t codes[num_streams];
		int index = 0;

		for(int i = 0; i < num_streams; i++) {
			uppers[i] = 0xFFFF;
			lowers[i] = 0x0000;
			uint16_t code = 0;
			for(int j = 0; j < 16; j++) {
				code = (code << 1) | buffers[i].pop_bit();
			}
			codes[i] = code;
		}

		for(int i = 0; i < 200; i++) {
			uint32_t upper = uppers[index];
			uint32_t lower = lowers[index];
			uint16_t code = codes[index];

			//Get number representing symbol
			uint32_t range = upper - lower + 1;

			uint32_t temp = (code - lower) * model.get_range() / range;

			//Decode symbol
			Bounds<uint8_t, uint16_t> bounds = model.decode_symbol((uint16_t) temp);
			char c = bounds.symbol;
			message.push_back(c);

			//Current stop symbol is '!'
			if(c == '!') break;

			//Update bounds, same as encoder
			uint32_t range_inv = (uint32_t) 0x10000 / (uint32_t) bounds.range;

			uint32_t t_upper = range * bounds.upper_bound;
			uint32_t u_upper = ((t_upper >> 16) & 0xFFFF) * range_inv;
			uint32_t l_upper = (t_upper & 0xFFFF) * range_inv;

			uint32_t t_lower = range * bounds.lower_bound;
			uint32_t u_lower = ((t_lower >> 16) & 0xFFFF) * range_inv;
			uint32_t l_lower = (t_lower & 0xFFFF) * range_inv;

			uint32_t part_upper = u_upper + (l_upper >> 16);
			uint32_t part_lower = u_lower + (l_lower >> 16);

			upper = lower + part_upper - 1;
			lower = lower + part_lower;

			//Renormalize working range
			while(true) {
				//upper passed the 0.5 threshold, cannot be higher than 0.5
				if(upper < 0x8000) {
					upper = ((upper << 1) & 0xFFFF) | 0x1;
					lower = (lower << 1) & 0xFFFF;
					code = (code << 1) | buffers[index].pop_bit();
				}
				//lower passed the 0.5 threshold, cannot be lower than 0.5
				else if(lower >= 0x8000) {
					upper = ((upper << 1) & 0xFFFF) | 0x1;
					lower = (lower << 1) & 0xFFFF;
					code = (code << 1) | buffers[index].pop_bit();
				}
				//upper's MSBs == 2'b10 and lower's BSBs == 2'b01
				else if((upper & 0xC000) == 0x8000 && (lower & 0xC000) == 0x4000) {
					upper = (upper & 0x8000) | ((upper << 1) & 0x7FFF) | 0x1;
					lower = (lower & 0x8000) | ((lower << 1) & 0x7FFF);
					//Pop bit ahead
					code = (code & 0x8000) | ((code << 1) & 0x7FFF) | buffers[index].pop_bit();
				}
				else {
					break;
				}
			}

			uppers[index] = upper;
			lowers[index] = lower;
			codes[index] = code;

			index = (index + 1) % num_streams;
		}
	}

	void print_buffers() {
		for(int i = 0; i < num_streams; i++) {
			std::printf("Stream %02d: ", i);
			buffers[i].print_bits();
		}
	}

	int get_bit_count() {
		int count = 0;
		for(int i = 0; i < num_streams; i++) count += buffers[i].get_bit_count();
		return count;
	}
};



int main(int argc, char *argv[]) {
	//std::string message = "aaaaabbbbbaaaaa!";
	std::string message = "This is a message encoded using arithmetic coding, which is a statistical entropy encoding scheme!";
	std::string decoded_message;
	//BitBuffer buffer;
	AdaptiveModel16 model = AdaptiveModel16();
	StridedCodec<9> codec = StridedCodec<9>();

	codec.encode(message, model);

	std::cout << "======================" << std::endl;

	codec.print_buffers();

	codec.decode(decoded_message, model);

	std::cout << "Length:     " << decoded_message.length() << std::endl;

	std::cout << "Decoded:    " << decoded_message << std::endl;
	std::cout << "Encoded:    " << message << std::endl;

	std::cout << "Original:   " << message.length() * 8 << std::endl;
	std::cout << "Compressed: " << codec.get_bit_count() << std::endl;

	codec.print_buffers();

	return 0;
}
