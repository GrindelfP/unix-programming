#ifndef fibonacci_h
#define fibonacci_h

#include <vector>

/**
 * @brief Fibonacci class.
 *
 * Class to generate the Fibonacci sequence of a given number.
 */ 
class Fibonacci {

public:
	/**
	 * @brief Calculates Fibonacci sequence.
	 *
	 * Calculates Fibonacci sequance for a given number n
	 * using formulae:
	 *
	 * F_0 = 0,
	 * F_1 = 1
	 * F_n = F_{n-1} + F_{n-2}
	 * for any given natural n > 1.
	 *
	 * @param n number.
	 *
	 * @return Fibonacci sequence for n.
	 */
	std::vector<int> getFibonacci(int n);
};

#endif

