#include <iostream>
#include <string>
#include <cstdint>

#include "range.h"
#include "adaptive_model_16.h"
#include "strided_codec_16.h"

int main(int argc, char *argv[]) {
	std::string message = "This is some text encoded using arithmetic coding, a type of lossless entropy encoding.                                      ab\0";
	std::cout << "Message: " << message << std::endl;
	std::cout << "Num bytes: " << message.length() << std::endl;

	uint8_t *message_data = (uint8_t *) message.c_str();

	AdaptiveModel16 model = AdaptiveModel16();
	StridedCodec16<9> codec = StridedCodec16<9>(model);

	codec.encode(message_data, message.length());
	codec.write_complete();
	CodecBuffer encoded_buffer = codec.write_encoded_data();

	std::cout << "Encoded size: " << encoded_buffer.size << std::endl;

	codec.read_encoded_data(encoded_buffer);
	CodecBuffer decoded_buffer = codec.decode();
	std::string decoded_message = std::string((char *) decoded_buffer.data);

	std::cout << "Decoded: " << decoded_message << std::endl;

	return 0;
}
