#include <stdio.h>

#include "gfx_window.h"

int main() {
	gfx_init();
	gfx_createWindow(200, 200);
	gfx_clearColor(0, 0, 0, 1);
	while(!gfx_closeRequested()) {
		gfx_clear();
		gfx_update();
		gfx_draw();
	}
	gfx_quit();
}
