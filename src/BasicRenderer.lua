local ffi = require('ffi')
local gl = require('gles2')

local BasicRenderer = {}

local NUM_BUFFERS = 2

function BasicRenderer.initialize()
	local cBufferRef = ffi.new('int[' .. NUM_BUFFERS .. ']')
	gl.glGenBuffers(NUM_BUFFERS, cBufferRef)

	BasicRenderer.BUFFER_POSITION = cBufferRef[0]
	BasicRenderer.BUFFER_COLOR = cBufferRef[1]
end

--[[
--init:
--  buffers created
--
--onDraw:
--  glBindBuffer -- buffer id
--  glBufferData -- data
--  glVertexAttribPointer -- attrib location, data
--  glDrawArrays
--
--term:
--  buffers deleted
--
--]]

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
--	local pos = renderable.model.data.position
--	local cDataPos = ffi.new('float[' .. #pos .. ']', pos)
--	gl.glBindBuffer(gl.GL_ARRAY_BUFFER, BasicRenderer.BUFFER_POSITION)
--	gl.glBufferData(gl.GL_ARRAY_BUFFER, #pos * 4, cDataPos, gl.GL_STREAM_DRAW)
--
--	local col = renderable.model.data.color
--	local cDataCol = ffi.new('float[' .. #col .. ']', col)
--	gl.glBindBuffer(gl.GL_ARRAY_BUFFER, BasicRenderer.BUFFER_POSITION)
--	gl.glBufferData(gl.GL_ARRAY_BUFFER, #col * 4, cDataCol, gl.GL_STREAM_DRAW)

	renderable.shader:start()
	for k, v in pairs(renderable.uniforms) do
		renderable.shader:setUniform(k, v)
	end

--	gl.glBindBuffer(gl.GL_ARRAY_BUFFER, BasicRenderer.BUFFER_POSITION)
--	gl.glVertexAttribPointer(renderable.shader.ATTRIB_POSITION, 3, gl.GL_FLOAT, gl.GL_FALSE, 0, nil)
--
--	gl.glBindBuffer(gl.GL_ARRAY_BUFFER, BasicRenderer.BUFFER_COLOR)
--	gl.glVertexAttribPointer(renderable.shader.ATTRIB_COLOR, 3, gl.GL_FLOAT, gl.GL_FALSE, 0, nil)
--
--	print('good')
--	--gl.glDrawArrays(gl.GL_TRIANGLES, 0, 3)
--
--	gl.glBindBuffer(gl.GL_ARRAY_BUFFER, 0)
	
	-- TODO
	renderable.model:bind()

--	renderable.model:draw()
	gl.glDrawArrays(gl.GL_TRIANGLES, 0, 3)

--	renderable.model:unbind()
	gl.glBindBuffer(gl.GL_ARRAY_BUFFER, 0)

	renderable.shader:stop()
end

return BasicRenderer
