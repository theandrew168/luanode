#include <stdio.h>
#include <stdbool.h>

#include "glad/glad.h"
#include "SDL.h"

bool gfx_init();
void gfx_quit();

void gfx_createWindow(unsigned width, unsigned height);
bool gfx_closeRequested();
void gfx_clearColor(float r, float g, float b, float a);

void gfx_update();
void gfx_clear();
void gfx_draw();
