local ffi = require('ffi')
ffi.cdef[[
bool gfx_init();
void gfx_quit();
void gfx_createWindow(unsigned width, unsigned height);
bool gfx_closeRequested();
void gfx_clearColor(float r, float g, float b, float a);
void gfx_update();
void gfx_clear();
void gfx_draw();
]]

local gfx = ffi.load('libs/libgfx/libgfx.a')

gfx.gfx_init()
gfx.gfx_createWindow(400, 400)
gfx.gfx_update()

while not gfx.gfx_closeRequested() do
	gfx.gfx_clear()
	gfx.gfx_update()
	gfx.gfx_draw()
end

gfx.gfx_quit()

print('LuaJIT rocks!')
