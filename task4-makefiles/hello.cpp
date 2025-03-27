#include "hello.h"
/**
 * @brief Main constructor for the class Hello.
 *
 * @param line line of text to be stored and printed.
 */ 
Hello::Hello(std::string line) : line(line) {} ;
	
/**
 * @brief Says hello.
 *
 * Prints the line value to the text output.
 *
 * @return void.
*/ 
void Hello::sayHello() {
	std::cout << line << std::endl;	
}
