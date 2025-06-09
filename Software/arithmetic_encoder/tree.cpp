#include <iostream>
#include <fstream>
#include <string>
#include <cstdint>
#include <vector>

class RangeNode {
public:
	//Used in calculating upper and lower bounds
	uint32_t left_count;
	uint32_t count;
};

class Range {
public:
	uint32_t lower_bound;
	uint32_t upper_bound;
	uint32_t total_count;
	Range() {
		lower_bound = 0;
		upper_bound = 0;
		total_count = 0;
	}
};

class Timestamp {
public:
	uint8_t  symbol;
	uint32_t seen;
	Timestamp() {}
	Timestamp(uint8_t symbol, uint32_t seen):
		symbol{symbol},
		seen{seen} {};
};

class AdaptiveModel1 {
private:
	RangeNode symbol_tree[256];
	uint32_t  total_count = 0;
	Timestamp timestamps[256];
	uint32_t  index;

public:
	AdaptiveModel1() {
		index = 0;
		for(int i = 0; i < 256; i++) {
			timestamps[i].symbol = 0;
			timestamps[i].seen = 0;
			symbol_tree[i].left_count = 0;
			symbol_tree[i].count = 0;
		}
	}

	Range next_range_encode(uint8_t symbol) {

		uint32_t midpoint = 128;
		uint32_t halfway = 64;
		Range range;

		while(true) {
			RangeNode& node = symbol_tree[midpoint];
			if(symbol < midpoint) {
				midpoint -= halfway;
				node.left_count++;
			}
			else if(symbol > midpoint) {
				midpoint += halfway;
				range.lower_bound += node.left_count + node.count;
			}
			else {
				if(node.count == 0) {
					timestamps[index].symbol = symbol;
					timestamps[index].seen = total_count;
					index++;
				}
				node.count++;
				range.lower_bound += node.left_count;
				range.upper_bound = range.lower_bound + node.count;
				break;
			}
			halfway = halfway >> 1;
		}

		total_count++;
		range.total_count = total_count;

		return range;
	}

	Range next_range_decode(uint32_t value) {
		if(timestamps[index].seen == total_count) {
			next_range_encode(timestamps[index].symbol);
			index++;
		}

		uint32_t midpoint = 128;
		uint32_t halfway = 64;
		Range range;
		uint32_t lower;
		while(true) {
			RangeNode node = symbol_tree[midpoint];
			if(value < node.left_count) {
				midpoint -= halfway;
				node.left_count++;
			}
			else if(value >= node.left_count + node.count) {
				midpoint += halfway;
				range.lower_bound += node.left_count + node.count;
			}
			else {
				range.lower_bound += node.left_count;
				range.upper_bound = range.lower_bound + node.count;
				break;
			}
			halfway = halfway >> 1;
		}

		return range;
	}

	void flip() {
		index = 0;
		for(int i = 0; i < 256; i++) {
			symbol_tree[i].left_count = 0;
			symbol_tree[i].count = 0;
		}
	}

	void reset() {
		index = 0;
		for(int i = 0; i < 256; i++) {
			symbol_tree[i].left_count = 0;
			symbol_tree[i].count = 0;
			timestamps[i].symbol = 0;
			timestamps[i].seen = 0;
		}
	}

	void print_distribution() {
		for(int i = 0; i < 256; i++) {
			uint8_t symbol = i;
			uint32_t lower_bound = 0;
			uint32_t upper_bound = 0;
			uint8_t midpoint = 128;
			uint8_t halfway = 64;
			uint32_t count;
			for(int i = 0; i < 8; i++) {
				RangeNode& node = symbol_tree[midpoint];
				if(symbol < midpoint) {
					midpoint -= halfway;
				}
				else if(symbol > midpoint) {
					midpoint += halfway;
					lower_bound += node.left_count + node.count;
				}
				else {
					lower_bound += node.left_count;
					upper_bound = lower_bound + node.count;
					count = node.count;
					break;
				}
				halfway = halfway >> 1;
			}
			if(lower_bound == upper_bound) continue;
			std::printf("Symbol %03d: [%03d, %03d]\n", symbol, lower_bound, upper_bound);
		}
		/*
		for(int i = 0; i < 256; i++) {
			RangeNode& node = symbol_tree[i];
			std::printf("Node %03d: [left_count = %03d, count = %03d]\n", i, node.left_count, node.count);
		}
		*/
	}
};

int main(int argc, char *argv[]) {
	std::string message = "This is some text!";
	AdaptiveModel1 model = AdaptiveModel1();
	for(int i = 0; i < message.length(); i++) model.next_range_encode(message[i]);
	model.print_distribution();
	return 0;
}
