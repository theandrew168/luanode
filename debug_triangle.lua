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
	gl.vertexAttribPointer(0, 3, gl.FLOAT, gl.FALSE, 0, debug_triangle.cvertices)
	gl.enableVertexAttribArray(0)
	gl.drawArrays(gl.TRIANGLES, 0, 3)
end

return debug_triangle
