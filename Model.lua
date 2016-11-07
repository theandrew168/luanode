local ffi = require('ffi')
local gl = require('gles2')

local Model = {}
Model.__index = Model

function Model.new()
	local model = {}
	setmetatable(model, Model)

	model.buffers = {}

	return model
end

-- gen
-- bind
-- buffer
-- unbind
function Model:addBuffer(location, width, data)
	local buffer = {}

	local cBufferID = ffi.new('int[1]')
	gl.glGenBuffers(1, cBufferID)

	-- Cache buffer details
	buffer.id = cBufferID[0]
	buffer.location = location
	buffer.width = width
	buffer.data = ffi.new('float[' .. #data .. ']', data)
	table.insert(self.buffers, buffer)

	-- Add data to buffer
	gl.glBindBuffer(gl.GL_ARRAY_BUFFER, buffer.id)
	gl.glBufferData(gl.GL_ARRAY_BUFFER, #data * 4, buffer.data, gl.GL_STATIC_DRAW)
	gl.glBindBuffer(gl.GL_ARRAY_BUFFER, 0)
end

function Model:draw()
	gl.glDrawArrays(gl.GL_TRIANGLES, 0, 3)
end

-- bind buffers
-- vertexAttribPointer
---- layout location
---- width
---- data
function Model:bind()
	for i = 1, #self.buffers do
		gl.glBindBuffer(gl.GL_ARRAY_BUFFER, self.buffers[i].id)
		gl.glVertexAttribPointer(self.buffers[i].location, self.buffers[i].width, 
			gl.GL_FLOAT, gl.GL_FALSE, 0, nil)
	end
end

-- unbind buffers
function Model:unbind()
	for i = 1, #self.buffers do
		gl.glBindBuffer(gl.GL_ARRAY_BUFFER, 0)
	end
end

return Model
