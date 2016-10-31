local ffi = require('ffi')
ffi.cdef[[
void ffi_init();
]]

local gfxlib = ffi.load('libs/libgfx/libgfx.a')

gfxlib.ffi_init()
print('LuaJIT rocks!')
