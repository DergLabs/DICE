#ifndef _CODEC_H_
#define _CODEC_H_

#include <cstdint>
#include <vector>

#include "model.h"

//Buffer object to extract encoded data from codec object
class CodecBuffer {
public:
	int      size;
	uint8_t *data;

	CodecBuffer(int size, uint8_t *data) : size{size}, data{data} {};
};

//Codec template
//Encodes data and stores it, encoded data can be read out as a CodecBuffer object
//Decoding is done by loading a CodecBuffer and then calling decode
//Decoding current returns another generic CodecBuffer since that gets passed up
template <typename S, typename T>
class Codec {
protected:
	//Model<S, T>& model;

public:
	//Codec(Model<S, T> model) : model{model} {}
	//Codec();

	virtual void encode(S *buffer, size_t num_symbols) = 0;
	virtual void write_complete() = 0;
	virtual CodecBuffer write_encoded_data() = 0;

	virtual CodecBuffer decode() = 0;
	virtual void read_encoded_data(CodecBuffer codec_buffer) = 0;

	//virtual void encode(std::istream& input, std::ostream& output, size_t num_symbols);
	//virtual void decode(std::istream& input, std::ostream& output);
};


#endif
