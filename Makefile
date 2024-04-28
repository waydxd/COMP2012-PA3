CPPFLAGS = -std=c++11 -g -Wall #-static-libgcc -static-libstdc++ -static

SHARED  = adoptionCenter.cpp animal.cpp bst.cpp datatypes.cpp randomAnimalGenerator.cpp
SRCS	= main.cpp $(SHARED)
SRCS_TEST = main_test.cpp $(SHARED)
OBJS	= $(SRCS:.cpp=.o)
OBJS_TEST = $(SRCS_TEST:.cpp=.o)
DEPS	= $(OBJS:.o=.d)
DEPS_TEST = $(OBJS_TEST:.o=.d)

all: PA3.exe 

PA3.exe: $(OBJS) 
	g++ $(CPPFLAGS) -o $@ $^

test: PA3_test.exe

PA3_test.exe: $(OBJS_TEST)
	g++ $(CPPFLAGS) -o $@ $^

# To include the .d dependency files
-include $(DEPS) $(DEPS_TEST)

%.o: %.cpp
	g++ $(CPPFLAGS) -MMD -MP -c $< -o $@

clean:;
	rm *.o *.exe *.d
# del *.o *.exe *.d  #for Windows

