#include "fibonacci.h"

std::vector<int> Fibonacci::getFibonacci(int n) {
	
	std::vector<int> sequence = { 1, 0 };

	if (n > 1) {
		for (int i = 2; i < n + 1; ++i) {
			sequence.insert(sequence.begin(), sequence[0] + sequence[1]);
		}
	}

	return sequence;
}

