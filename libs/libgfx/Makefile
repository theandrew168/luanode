CC = gcc
RM = rm -fr

TARGET = libgfx.a

SDL_DIR = ../SDL-mirror
SDL_INC_DIR = $(SDL_DIR)/include
SDL_LIB_DIR = $(SDL_DIR)/build/.libs
SDL_LIB = $(SDL_LIB_DIR)/libSDL2.a

CFLAGS = -fPIC -Wall -Wextra -std=c11 -I$(SDL_INC_DIR)
LFLAGS = -L$(SDL_LIB_DIR) -lSDL2 -shared

SRCS = $(wildcard *.c)
HEAD = $(wildcard *.h)
OBJS = $(patsubst %.c, %.o, $(SRCS))

.PHONY: all default clean
all: $(TARGET)
default: all

clean:
	$(RM) *.o *.a
	cd $(SDL_DIR); make clean

$(SDL_LIB):
	cd $(SDL_DIR); ./configure; make -j$(nproc)

$(TARGET): $(SDL_LIB) $(OBJS)
	$(CC) -o $@ $^ $(LFLAGS)

%.o: %.c $(HEAD)
	$(CC) -c $< -o $@ $(CFLAGS)

