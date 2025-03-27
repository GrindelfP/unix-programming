SRCS = hello.cpp factorial.cpp fibonacci.cpp runme.cpp
OBJS = $(SRCS:.cpp=.o)
TARGET = make-example

all: $(TARGET)
$(TARGET): $(OBJS)
	g++ $(OBJS) -o $(TARGET)

%.o: %.cpp
	g++ -std=c++11 -c $< -o $@

clean:
	rm -f $(OBJS)

install:
	cp $(TARGET) /usr/local/bin/

uninstall: 
	rm -f /usr/local/bin/$(TARGET)

docs:
	doxygen Doxyfile

