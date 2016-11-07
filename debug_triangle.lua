local gl = require('gles2')
local ffi = require('ffi')
local Shader = require('ShaderProgram')

local debug_triangle = {}

function debug_triangle.init()
	debug_triangle.vertices = {
		 0.0,  0.5, 0.0,
		-0.5, -0.5, 0.0,
		 0.5, -0.5, 0.0,
	}

	debug_triangle.colors = {
		1.0, 0.0, 0.0,
		0.0, 1.0, 0.0,
		0.0, 0.0, 1.0,
	}
	
	debug_triangle.cvertices = ffi.new("float[9]", debug_triangle.vertices)
	debug_triangle.ccolors = ffi.new("float[9]", debug_triangle.colors)
	
	debug_triangle.shader = Shader.new('basic')
end

function debug_triangle.destroy()
	debug_triangle.shader:destroy()
end

function debug_triangle.draw()
	debug_triangle.shader:start()

	gl.glVertexAttribPointer(0, 3, gl.GL_FLOAT, gl.GL_FALSE, 0, debug_triangle.cvertices)
	gl.glVertexAttribPointer(1, 3, gl.GL_FLOAT, gl.GL_FALSE, 0, debug_triangle.ccolors)
	gl.glDrawArrays(gl.GL_TRIANGLES, 0, 3)

	debug_triangle.shader:stop()
end

return debug_triangle
