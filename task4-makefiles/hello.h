#ifndef hello_h
#define hello_h

#include <string>
#include <iostream>

/**
* @brief Class to say hello.
*
* This class prints Hello line initialized 
* through a constructor param to text output.
*/
class Hello {

private:
	/**
	 * @var line
	 * 
	 * @brief  String variable for storing the hello message.
	 */
	std::string line;

public:
	/**
	 * @brief Main constructor for the class Hello.
	 *
	 * @param line line of text to be stored and printed.
	 */ 
	Hello(std::string line);
	
	/**
	 * @brief Says hello.
	 *
	 * Prints the line value to the text output.
	 *
	 * @return void.
	*/ 
	void sayHello();
};

#endif

