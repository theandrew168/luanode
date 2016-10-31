local ffi = require('ffi')
ffi.cdef[[
void ffi_init();
]]

local gfxlib = ffi.load('/home/adail/luanode/libs/libgfx/libgfx.a')

gfxlib.ffi_init()
print('LuaJIT rocks!')
