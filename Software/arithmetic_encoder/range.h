#ifndef _RANGE_H_
#define _RANGE_H_

#include <iostream>

template <typename S, typename T>
class Bounds {
public:
	T lower_bound;
	T upper_bound;
	T range;
	S symbol;
	Bounds() {}
	Bounds(T lower, T upper, T range, S symbol):
		lower_bound{lower},
		upper_bound{upper},
		range{range},
		symbol{symbol} {}
};

template <typename S, typename T>
std::ostream& operator<<(std::ostream& stream, const Bounds<S, T>& bounds) {
	stream << "[" << bounds.lower_bound << ", " << bounds.upper_bound << ", " << bounds.range << ", " << (uint32_t) bounds.symbol << "]";
	return stream;
}

#endif
