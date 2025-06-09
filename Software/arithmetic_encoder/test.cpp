#include <iostream>
#include <cstdint>
#include "uniform_model.h"
#include "adaptive_model.h"

int main(int argc, char *argv[]) {
	/*
	UniformModel model;

	std::cout << "Yuh" << std::endl;
	model.encode_symbol('c');
	Bounds<uint8_t, uint32_t> bounds = model.decode_symbol(85);
	std::cout << bounds.symbol << std::endl;
	*/

	AdaptiveModel model;

	char message[] = "aaabbaccc";
	for(int i = 0; i < sizeof(message); i++) {
		Bounds<uint8_t, uint32_t> bounds = model.encode_symbol((uint8_t) message[i]);
		std::cout << bounds << std::endl;
	}

	return 0;
}
