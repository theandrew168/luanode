local ffi = require('ffi')
local gl = require('gles2')

local BasicRenderer = {}

function BasicRenderer.draw(renderable)
	renderable.shader:start()
	-- set uniforms  shader:setUniformFoo
	-- create buffer glGenBuffer
	-- buffer data   glBufferData
	-- draw          glDrawElements / Arrays
	-- delete buffer glDeleteBuffer?

	renderable.shader:stop()
end


return BasicRenderer
