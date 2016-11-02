local ffi = require('ffi')
libgles3 = ffi.load('GLESv2')

ffi.cdef[[

typedef unsigned int GLbitfield;

void glClear(GLbitfield mask);

]]
