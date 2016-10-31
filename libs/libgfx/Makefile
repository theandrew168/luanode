CC = gcc
RM = rm -fr

TARGET = libgfx.a
DEBUG = gfx_debug

SDL_DIR = ../SDL-mirror
SDL_INC_DIR = $(SDL_DIR)/include
SDL_LIB_DIR = $(SDL_DIR)/build/.libs
SDL_LIB = $(SDL_LIB_DIR)/libSDL2.a

GLAD_DIR = ../glad
GLAD_INC_DIR = $(GLAD_DIR)/include
GLAD_LIB_DIR = $(GLAD_DIR)
GLAD_LIB = $(GLAD_LIB_DIR)/libglad.a

CFLAGS = -fPIC -Wall -Wextra -std=c11 -I$(SDL_INC_DIR) -I$(GLAD_INC_DIR)
LFLAGS = -lGL -L$(SDL_LIB_DIR) -lSDL2 -L$(GLAD_LIB_DIR) -lglad

SRCS = $(wildcard *.c)
HEAD = $(wildcard *.h)
OBJS = $(patsubst %.c, %.o, $(SRCS))

.PHONY: all default run clean
all: $(TARGET)
default: all

run: $(DEBUG)
	./$(DEBUG)

clean:
	$(RM) $(TARGET) $(DEBUG) *.o

$(SDL_LIB):
	cd $(SDL_DIR); ./configure; make -j$(nproc)

$(GLAD_LIB):
	cd $(GLAD_DIR); cmake . -DCMAKE_POSITION_INDEPENDENT_CODE:BOOL=true; make -j$(nproc)

$(TARGET): $(SDL_LIB) $(GLAD_LIB) $(OBJS)
	$(CC) -o $@ $^ $(LFLAGS) -shared

$(DEBUG): $(TARGET)
	$(CC) -o $@ -Wall -Wextra -std=c11 -L. -lgfx

%.o: %.c $(HEAD)
	$(CC) -c $< -o $@ $(CFLAGS)

