#ifndef factorial_h
#define factorial_h

/**
 * @brief Factorial class.
 *
 * Class to generate the factorial of a given number.
 */ 
class Factorial {

public:
	/**
	 * @brief Calculates factorial.
	 *
	 * Calculates factorial of a given natural number n
	 * by multiplying it by (n - 1), (n - 2) and so on
	 * untill (n - (n - 1)).
	 *
	 * @param n number.
	 *
	 * @return factorial of n.
	 */
	long long getFactorial(int n);
};

#endif
