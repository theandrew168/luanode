local gl = require('gles2')
local ffi = require('ffi')

local debug_triangle = {}

debug_triangle.vertices = {
	 0.0,  0.5, 0.0,
	-0.5, -0.5, 0.0,
	 0.5, -0.5, 0.0,
}

debug_triangle.cvertices = ffi.new("float[9]", debug_triangle.vertices)

function debug_triangle.draw()
	gl.glVertexAttribPointer(0, 3, gl.GL_FLOAT, gl.GL_FALSE, 0, debug_triangle.cvertices)
	gl.glEnableVertexAttribArray(0)
	gl.glDrawArrays(gl.GL_TRIANGLES, 0, 3)
end

return debug_triangle
