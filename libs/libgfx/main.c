#include <stdio.h>
#include "SDL.h"

void ffi_init();

int main() {
	ffi_init();
}

void ffi_init() {
	if (SDL_Init(SDL_INIT_VIDEO) != 0) {
		printf("SDL_Init error: %s\n", SDL_GetError());
	}

	printf("SDL_Init successful!\n");
	SDL_Quit();
}
