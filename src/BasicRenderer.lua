local ffi = require('ffi')
local gl = require('gles2')

local BasicRenderer = {}

local NUM_BUFFERS = 2

function BasicRenderer.initialize()
	local cBufferRef = ffi.new('int[' .. NUM_BUFFERS .. ']')
	gl.glGenBuffers(NUM_BUFFERS, cBufferRef)

	BasicRenderer.cBufferRef = cBufferRef
	BasicRenderer.BUFFER_POSITION = cBufferRef[0]
	BasicRenderer.BUFFER_COLOR = cBufferRef[1]
end

function BasicRenderer.terminate()
	gl.glDeleteBuffers(NUM_BUFFERS, BasicRenderer.cBufferRef)
end

--x start shader   shader:start
--x set uniforms   shader:setUniformFoo
-- bind texture   material:bind
--x buffer data    glBufferData
--x draw           glDrawElements / Arrays
-- unbind texture material:unbind
--x stop shader    shader:stop
local cDataPos = nil
local cDataCol = nil
function BasicRenderer.draw(renderable)
	-- buffer position data
	local pos = renderable.model.data.position
	if cDataPos == nil then
		cDataPos = ffi.new('float[' .. #pos .. ']', pos)
	end
	gl.glBindBuffer(gl.GL_ARRAY_BUFFER, BasicRenderer.BUFFER_POSITION)
	gl.glBufferData(gl.GL_ARRAY_BUFFER, #pos * 4, cDataPos, gl.GL_STATIC_DRAW)
	gl.glBindBuffer(gl.GL_ARRAY_BUFFER, 0)

	-- buffer color data
	local col = renderable.model.data.color
	if cDataCol == nil then
		cDataCol = ffi.new('float[' .. #col .. ']', col)
	end
	gl.glBindBuffer(gl.GL_ARRAY_BUFFER, BasicRenderer.BUFFER_COLOR)
	gl.glBufferData(gl.GL_ARRAY_BUFFER, #col * 4, cDataCol, gl.GL_STATIC_DRAW)
	gl.glBindBuffer(gl.GL_ARRAY_BUFFER, 0)

	renderable.shader:start()
	for k, v in pairs(renderable.uniforms) do
		renderable.shader:setUniform(k, v)
	end

	-- set position attrib pointer
	gl.glBindBuffer(gl.GL_ARRAY_BUFFER, BasicRenderer.BUFFER_POSITION)
	gl.glVertexAttribPointer(renderable.shader.ATTRIB_POSITION, 3, gl.GL_FLOAT, gl.GL_FALSE, 0, nil)

	-- set color attrib pointer
	gl.glBindBuffer(gl.GL_ARRAY_BUFFER, BasicRenderer.BUFFER_COLOR)
	gl.glVertexAttribPointer(renderable.shader.ATTRIB_COLOR, 3, gl.GL_FLOAT, gl.GL_FALSE, 0, nil)
	
	-- do the draw
	gl.glDrawArrays(gl.GL_TRIANGLES, 0, 3)

	-- unbind buffers
	gl.glBindBuffer(gl.GL_ARRAY_BUFFER, 0)

	renderable.shader:stop()
end

return BasicRenderer
