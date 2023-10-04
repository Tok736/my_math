.PHONY: all build clean

BUILD = build
SRC = src
INCLUDE = include
TARGET = $(BUILD)/build.out

CC = gcc
FLAGS = -Werror -Wall -Wextra -std=c11 -fsanitize=address -I$(INCLUDE)

EXAMPLE_C = $(SRC)/example.c
SRC_FILES = $(wildcard $(SRC)/*.c)

all: example

my_math: $(filter-out $(EXAMPLE_C), $(SRC_FILES))
	$(CC) $(FLAGS) -fPIC -shared $^ -o $(TARGET)

example: $(SRC_FILES)
	$(CC) $(FLAGS) $^ -o $(TARGET)

clean:
	rm $(TARGET)





