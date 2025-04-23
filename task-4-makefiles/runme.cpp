#include "runme.h"
#include "hello.h"
#include "factorial.h"
#include "fibonacci.h" 

int main (int argc, char** argv) {
	
	// =========
	// HELLO
	// =========
	Hello hello("Hey from a class and a makefile!");
	hello.sayHello();

	// =========
	// FACTORIAL
	// =========
	Factorial factorial;
	println(factorial.getFactorial(10));
	
	// =========
	// FIBONACCI
	// =========
	Fibonacci fibonacci;
	std::vector<int> sequence =  fibonacci.getFibonacci(10);
	repeatIndexed(11) {
		print(sequence[i]);
	}

	return 0;
}

