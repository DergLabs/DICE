#include <iostream>
#include <fstream>
#include <string>
#include <cstdint>
#include <vector>

#include "bit_buffer.h"
#include "uniform_model.h"
#include "adaptive_model.h"

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

	void encode(std::string& message, Model<uint8_t, uint32_t>& model) {
		uint64_t uppers[num_streams];
		uint64_t lowers[num_streams];
		int index = 0;

		for(int i = 0; i < num_streams; i++) {
			uppers[i] = 0xFFFFFFFF;
			lowers[i] = 0x00000000;
		}

		for(std::string::iterator it = message.begin(); it != message.end(); it++) {
			uint64_t upper = uppers[index];
			uint64_t lower = lowers[index];
			//Get bounds for symbol
			char c = *it;
			Bounds<uint8_t, uint32_t> bounds = model.encode_symbol(c);
			//Encode symbol
			uint64_t range = upper - lower + 1;
			upper = lower + range * (uint64_t) bounds.upper_bound / (uint64_t) bounds.range - 1;
			lower = lower + range * (uint64_t) bounds.lower_bound / (uint64_t) bounds.range;
			//Renormalize working range
			while(true) {
				//upper passed the 0.5 threshold, cannot be higher than 0.5
				if(upper < 0x80000000) {
					upper = ((upper << 1) & 0xFFFFFFFF) | 0x1;
					lower = (lower << 1) & 0xFFFFFFFF;
					buffers[index].push_bit(0);
				}
				//lower passed the 0.5 threshold, cannot be lower than 0.5
				else if(lower >= 0x80000000) {
					upper = ((upper << 1) & 0xFFFFFFFF) | 0x1;
					lower = (lower << 1) & 0xFFFFFFFF;
					buffers[index].push_bit(1);
				}
				//upper's MSBs == 2'b10 and lower's BSBs == 2'b01
				else if((upper & 0xC0000000) == 0x80000000 && (lower & 0xC0000000) == 0x40000000) {
					upper = (upper & 0x80000000) | ((upper << 1) & 0x7FFFFFFF) | 0x1;
					lower = (lower & 0x80000000) | ((lower << 1) & 0x7FFFFFFF);
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

	void decode(std::string& message, Model<uint8_t, uint32_t>& model) {
		//CharModel model;
		uint64_t uppers[num_streams];
		uint64_t lowers[num_streams];
		uint32_t codes[num_streams];
		int index = 0;

		for(int i = 0; i < num_streams; i++) {
			uppers[i] = 0xFFFFFFFF;
			lowers[i] = 0x00000000;
			uint32_t code = 0;
			for(int j = 0; j < 32; j++) {
				code = (code << 1) | buffers[i].pop_bit();
			}
			codes[i] = code;
		}

		for(int i = 0; i < 200; i++) {
			uint64_t upper = uppers[index];
			uint64_t lower = lowers[index];
			uint32_t code = codes[index];

			//Get number representing symbol
			uint64_t range = upper - lower + 1;
			uint64_t temp = (code - lower) * model.get_range() / range;

			//Decode symbol
			Bounds<uint8_t, uint32_t> bounds = model.decode_symbol((uint32_t) temp);
			char c = bounds.symbol;
			message.push_back(c);

			//Current stop symbol is '!'
			if(c == '!') break;

			//Update bounds, same as encoder
			upper = lower + range * (uint64_t) bounds.upper_bound / (uint64_t) bounds.range - 1;
			lower = lower + range * (uint64_t) bounds.lower_bound / (uint64_t) bounds.range;

			//Renormalize working range
			while(true) {
				//upper passed the 0.5 threshold, cannot be higher than 0.5
				if(upper < 0x80000000) {
					upper = ((upper << 1) & 0xFFFFFFFF) | 0x1;
					lower = (lower << 1) & 0xFFFFFFFF;
					code = (code << 1) | buffers[index].pop_bit();
				}
				//lower passed the 0.5 threshold, cannot be lower than 0.5
				else if(lower >= 0x80000000) {
					upper = ((upper << 1) & 0xFFFFFFFF) | 0x1;
					lower = (lower << 1) & 0xFFFFFFFF;
					code = (code << 1) | buffers[index].pop_bit();
				}
				//upper's MSBs == 2'b10 and lower's BSBs == 2'b01
				else if((upper & 0xC0000000) == 0x80000000 && (lower & 0xC0000000) == 0x40000000) {
					upper = (upper & 0x80000000) | ((upper << 1) & 0x7FFFFFFF) | 0x1;
					lower = (lower & 0x80000000) | ((lower << 1) & 0x7FFFFFFF);
					//Pop bit ahead
					code = (code & 0x80000000) | ((code << 1) & 0x7FFFFFFF) | buffers[index].pop_bit();
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
	AdaptiveModel model = AdaptiveModel();
	StridedCodec<9> codec = StridedCodec<9>();

	codec.encode(message, model);

	std::cout << "======================" << std::endl;

	codec.decode(decoded_message, model);

	std::cout << "Length:     " << decoded_message.length() << std::endl;

	std::cout << "Decoded:    " << decoded_message << std::endl;
	std::cout << "Encoded:    " << message << std::endl;

	std::cout << "Original:   " << message.length() * 8 << std::endl;
	std::cout << "Compressed: " << codec.get_bit_count() << std::endl;

	codec.print_buffers();

	return 0;
}
