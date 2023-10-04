.PHONY: all build clean

BUILD = build
SRC = src
TEST = tests
INCLUDE = include
TARGET = $(BUILD)/build.out

CC = gcc
FLAGS = -Werror -Wall -Wextra -std=c11 -fsanitize=address -I$(INCLUDE)

EXAMPLE_C = $(SRC)/example.c
SRC_FILES = $(wildcard $(SRC)/*.c)
SRC_FILES_WITHOUT_EXAMPLE = $(filter-out $(EXAMPLE_C), $(SRC_FILES))
TEST_FILES = $(wildcard $(TEST)/*.c)

all: test

my_math: $(SRC_FILES_WITHOUT_EXAMPLE)
	$(CC) $(FLAGS) -fPIC -shared $^ -o $(TARGET)

example: $(SRC_FILES)
	$(CC) $(FLAGS) $^ -o $(TARGET)

test: $(SRC_FILES_WITHOUT_EXAMPLE) $(TEST_FILES)
	$(CC) $(FLAGS) $^ c_tests/build/build -o $(TARGET)

clean:
	rm $(TARGET)





