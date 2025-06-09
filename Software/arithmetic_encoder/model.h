#ifndef _MODEL_H_
#define _MODEL_H_

#include "range.h"

template <typename S, typename T>
class Model {
public:
	virtual Bounds<S, T> encode_symbol(S symbol) = 0;
	virtual Bounds<S, T> decode_symbol(T value) = 0;
	virtual T get_range() = 0;
	virtual void reset() = 0;

	//C-style read/write functions for now
	virtual size_t get_size_bytes() = 0;
	virtual int write_model_to_buffer(uint8_t *buffer) = 0;
	virtual int read_model_from_buffer(uint8_t *buffer) = 0;
};

#endif
