#ifndef _STRIDED_CODEC_16_H_
#define _STRIDED_CODEC_16_H_

#include <iostream>
#include <fstream>
#include <string>
#include <cstdint>
#include <vector>

#include "codec.h"
#include "model.h"
#include "range.h"

#include "bit_buffer.h"

template <uint32_t num_streams>
class StridedCodec16 : public Codec<uint8_t, uint16_t> {
private:
	Model<uint8_t, uint16_t>& model;

	BitBuffer buffers[num_streams];

	uint16_t encoded_count;

public:
	StridedCodec16(Model<uint8_t, uint16_t>& model) : model{model} {
		encoded_count = 0;

		for(int i = 0; i < num_streams; i++) {
			buffers[i] = BitBuffer();
		}
	}

	void encode(uint8_t *symbol_arr, size_t num_symbols) {
		uint32_t uppers[num_streams];
		uint32_t lowers[num_streams];
		int index = 0;

		//Initialize stream working bounds
		for(int i = 0; i < num_streams; i++) {
			uppers[i] = 0xFFFF;
			lowers[i] = 0x0000;
		}

		//Encode symbols from buffer
		for(int i = 0; i < num_symbols; i++) {
			uint32_t upper = uppers[index];
			uint32_t lower = lowers[index];

			//Get bounds for symbol
			uint8_t c = symbol_arr[i];
			Bounds<uint8_t, uint16_t> bounds = model.encode_symbol(c);

			//Encode symbol
			uint64_t range = upper - lower + 1;
			upper = lower + range * (uint32_t) bounds.upper_bound / (uint32_t) bounds.range - 1;
			lower = lower + range * (uint32_t) bounds.lower_bound / (uint32_t) bounds.range;

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

		encoded_count += num_symbols;
	}

	void write_complete() {
		for(int i = 0; i < num_streams; i++) {
			buffers[i].write_complete();
		}
	}

	CodecBuffer decode() {
		std::cout << "encoded_count = " << encoded_count << std::endl;
		uint8_t *buffer = new uint8_t[encoded_count];
		std::cout << "I got here" << std::endl;

		uint32_t uppers[num_streams];
		uint32_t lowers[num_streams];
		uint16_t codes[num_streams];
		int index = 0;

		for(int i = 0; i < num_streams; i++) {
			//Initial upper and lower bounds for each stream
			uppers[i] = 0xFFFF;
			lowers[i] = 0x0000;

			//Initialize code value for each stream
			uint16_t code = 0;
			for(int j = 0; j < 16; j++) {
				code = (code << 1) | buffers[i].pop_bit();
			}

			codes[i] = code;
		}

		//Decode number of symbols embedded in the stream
		for(int i = 0; i < encoded_count; i++) {
			uint32_t upper = uppers[index];
			uint32_t lower = lowers[index];
			uint16_t code = codes[index];

			//Get number representing symbol
			uint32_t range = upper - lower + 1;

			uint32_t temp = (code - lower) * model.get_range() / range;

			//Decode symbol
			Bounds<uint8_t, uint16_t> bounds = model.decode_symbol((uint16_t) temp);
			buffer[i] = bounds.symbol;
			//std::cout << bounds.symbol << ": " << (int) bounds.symbol << " ";

			//Encode symbol
			upper = lower + range * (uint32_t) bounds.upper_bound / (uint32_t) bounds.range - 1;
			lower = lower + range * (uint32_t) bounds.lower_bound / (uint32_t) bounds.range;

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

			std::cout << "i = " << i << std::endl;
		}

		CodecBuffer codec_buffer = CodecBuffer(encoded_count, buffer);
		return codec_buffer;
	}

	CodecBuffer write_encoded_data() override {
		//Get size of final buffer
		int size = model.get_size_bytes();

		//Figure out which stream is longest
		int stream_size = 0;
		int max = 0;
		for(int i = 0; i < num_streams; i++) {
			if(buffers[i].get_size_bytes() > max) {
				max = buffers[i].get_size_bytes();
			}
		}

		stream_size = max * num_streams;
		size += stream_size;

		//Write to the stream
		uint8_t *buffer = new uint8_t[size];
		int count = model.write_model_to_buffer(buffer);

		//Write stream length
		buffer[count] = (uint8_t) ((encoded_count >> 8) & 0xFF);
		buffer[count + 1] = (uint8_t) (encoded_count & 0xFF);

		//Write bytes to stream after model data and stream length
		uint8_t *stream_buffer = &buffer[count + 2];
		for(int i = 0; i < stream_size; i++) {
			int b = i % num_streams;
			buffers[b].write_byte_to_buffer(&stream_buffer[i]);
		}

		CodecBuffer codec_buffer = CodecBuffer(size, buffer);

		return codec_buffer;
	}

	void read_encoded_data(CodecBuffer codec_buffer) override {
		//Reset buffers and model before they get initialized
		model.reset();
		for(int i = 0; i < num_streams; i++) buffers[i].reset();

		std::cout << "size: " << codec_buffer.size << std::endl;

		//Initialize the model
		int count = model.read_model_from_buffer(codec_buffer.data);

		std::cout << "count = " << count << std::endl;

		//Get the length of the remaining stream to populate buffers with
		uint8_t *stream_buffer = codec_buffer.data + count;
		encoded_count = ((uint16_t) stream_buffer[0] << 8) | (uint16_t) stream_buffer[1];
		stream_buffer = stream_buffer + 2;

		size_t stream_size = codec_buffer.size - count - 2;

		//Populate buffers
		for(int i = 0; i < stream_size; i++) {
			int b = i % num_streams;
			buffers[b].read_byte_from_buffer(&stream_buffer[i]);
		}

		print_buffers();
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

#endif
