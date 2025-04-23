#include "factorial.h"

long long Factorial::getFactorial(int n) {
	long long factorialValue = 1;
	
	if (n > 0) {
		do {
			factorialValue *= n;
			n--;
		} while(n > 1);
	}

	return factorialValue;
}

