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

return Model
