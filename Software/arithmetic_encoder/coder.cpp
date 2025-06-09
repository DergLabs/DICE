#include <iostream>
#include <fstream>
#include <sstream>
#include <string>
#include <cstdint>
#include <vector>

#include "bit_buffer.h"
#include "uniform_model.h"
#include "adaptive_model.h"
#include "default_model.h"
#include "arithmetic_codec.h"

void encode(std::string& message, BitBuffer& buffer, Model<uint8_t, uint32_t>& model) {
	uint64_t upper = 0xFFFFFFFF;
	uint64_t lower = 0x00000000;
	uint64_t range;
	for(std::string::iterator it = message.begin(); it != message.end(); it++) {
		//Get bounds for symbol
		char c = *it;
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
}

void decode(std::string& message, BitBuffer& buffer, Model<uint8_t, uint32_t>& model) {
	uint64_t upper = 0xFFFFFFFF;
	uint64_t lower = 0x00000000;
	uint64_t range;
	uint32_t code = 0;
	for(int i = 0; i < 32; i++) code = (code << 1) | buffer.pop_bit();
	for(int i = 0; i < 200; i++) {
		//Get number representing symbol
		range = upper - lower + 1;
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

int main(int argc, char *argv[]) {
	std::string message = "This is a very long string of text that will be compressed using arithmetic coding!";
	std::string decoded_message;
	BitBuffer buffer;


	//UniformModel model = UniformModel();
	//AdaptiveModel model = AdaptiveModel();
	DefaultModel model = DefaultModel();
	ArithmeticCodec codec = ArithmeticCodec(model);

	std::stringstream input_stream(message);
	std::stringstream encoded_stream;
	std::stringstream decoded_stream;

	codec.encode(input_stream, encoded_stream, message.length());

	std::cout << "======================" << std::endl;

	codec.decode(encoded_stream, decoded_stream);
	decoded_message = decoded_stream.str();

	std::cout << "Length:     " << decoded_message.length() << std::endl;

	std::cout << "Decoded:    " << decoded_message << std::endl;
	std::cout << "Encoded:    " << message << std::endl;

	std::cout << "Original:   " << message.length() * 8 << std::endl;
	std::cout << "Compressed: " << buffer.get_bit_count() << std::endl;

	std::cout << "Stream:     ";
	buffer.print_bits();

	return 0;
}
