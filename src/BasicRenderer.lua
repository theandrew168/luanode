local ffi = require('ffi')
local gl = require('gles2')

local BasicRenderer = {}

--x start shader   shader:start
--x set uniforms   shader:setUniformFoo
-- bind texture   material:bind
-- create buffer  glGenBuffer
-- buffer data    glBufferData
-- draw           glDrawElements / Arrays
-- delete buffer  glDeleteBuffer?
-- unbind texture material:unbind
--x stop shader    shader:stop
function BasicRenderer.draw(renderable)
	renderable:getShader():start()
	for k, v in pairs(renderable:getUniforms()) do
		renderable:getShader():setUniform(k, v)
	end

	renderable:getModel():bind()
	renderable:getModel():draw()
	renderable:getModel():unbind()

	renderable:getShader():stop()
end

return BasicRenderer
