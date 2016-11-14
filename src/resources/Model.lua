local ffi = require('ffi')
local gl = require('gles2')

local Model = {}
Model.__index = Model

function Model.new(filename)
	local model = {}
	setmetatable(model, Model)

	model.buffers = {}
	model.data = {}
	model.data.position = {
		0.0,  0.5, 0.0,
		-0.5, -0.5, 0.0,
		0.5, -0.5, 0.0,
	}
	model.data.color = {
		1.0, 0.0, 0.0,
		0.0, 1.0, 0.0,
		0.0, 0.0, 1.0,
	}
	model.data.normal = {}
	model.data.uv = {}
	model.data.binormal = {}
	model.data.tangent = {}
	model.indices = {}

	return model
end

function Model:destroy()
	print('Model: destroy()')
end

-- gen
-- bind
-- buffer
-- unbind
function Model:addBuffer(location, bufferID, width, data)

--	local cBufferID = ffi.new('int[1]')
--	gl.glGenBuffers(1, cBufferID)

	-- Cache buffer details
	if self.buffers[location] == nil then
		local buffer = {}
		print('creating buffer...')
		buffer.id = bufferID
		buffer.location = location
		buffer.width = width
		buffer.data = ffi.new('float[' .. #data .. ']', data)
		self.buffers[location] = buffer
--		table.insert(self.buffers, buffer)
	end

	-- Add data to buffer
	gl.glBindBuffer(gl.GL_ARRAY_BUFFER, bufferID)
	gl.glBufferData(gl.GL_ARRAY_BUFFER, #data * 4, self.buffers[location].data, gl.GL_STATIC_DRAW)
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
	for k, v in pairs(self.buffers) do
		gl.glBindBuffer(gl.GL_ARRAY_BUFFER, v.id)
		gl.glVertexAttribPointer(v.location, 3, gl.GL_FLOAT, gl.GL_FALSE, 0, nil)
	end
end

-- unbind buffers
function Model:unbind()
	gl.glBindBuffer(gl.GL_ARRAY_BUFFER, 0)
end

return Model
