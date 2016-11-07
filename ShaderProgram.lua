local ffi = require('ffi')
local gl = require('gles2')

local SHADER_DIR = 'shaders/'

local ShaderProgram = {}
ShaderProgram.__index = ShaderProgram

--- Create new ShaderProgram from shader file.
-- @param filename Name of shader file
-- @return ShaderProgram object
function ShaderProgram.new(filename)
	local program = {}
	setmetatable(program, ShaderProgram)

	-- Local cache for shader callbacks
	local vertSource, fragSource = nil, nil
	local attributes, uniforms = nil, nil

	-- Vertex shader callback
	function vertex(vertData)
		vertSource = vertData.source
		attributes = vertData.attributes or {}
		uniforms = vertData.uniforms or {}
	end

	-- Fragment shader callback
	function fragment(fragData)
		fragSource = fragData.source
	end

	dofile(SHADER_DIR .. filename .. '.lua')

	program.vertID = program.compileShader(vertSource, gl.GL_VERTEX_SHADER)
	program.fragID = program.compileShader(fragSource, gl.GL_FRAGMENT_SHADER)
	program.programID = gl.glCreateProgram()

	gl.glAttachShader(program.programID, program.vertID)
	gl.glAttachShader(program.programID, program.fragID)

	-- Bind attribute locations based on shader file
	program.attributes = attributes
	for k, v in pairs(attributes) do
		gl.glBindAttribLocation(program.programID, v, k)
	end

	gl.glLinkProgram(program.programID)
	gl.glValidateProgram(program.programID)

	-- Cache uniform locations
	program.uniforms = {}
	for i = 1, #uniforms do
		program.uniforms[uniforms[i]] = gl.glGetUniformLocation(program.programID, uniforms[i])
	end

	return program
end

function ShaderProgram.compileShader(shaderSource, shaderType)
	local cSource = ffi.new('const char *[1]')
	cSource[0] = shaderSource

	local cSourceLen = ffi.new('int[1]')
	cSourceLen[0] = #shaderSource

	shaderID = gl.glCreateShader(shaderType)
	gl.glShaderSource(shaderID, 1, cSource, cSourceLen)
	gl.glCompileShader(shaderID)

	local cStatus = ffi.new('int[1]')
	gl.glGetShaderiv(shaderID, gl.GL_COMPILE_STATUS, cStatus)
	if cStatus[0] == gl.GL_FALSE then
		local cErrLen = ffi.new('int[1]')
		local cLog = ffi.new('char[?]', cErrLen[0] + 1)

		gl.glGetShaderiv(shaderID, gl.GL_INFO_LOG_LENGTH, cErrLen)
		gl.glGetShaderInfoLog(shaderID, cErrLen[0], nil, cLog);

		if shaderType == gl.GL_VERTEX_SHADER then
			print('compileShader(vertex): \n' .. ffi.string(cLog))
		elseif shaderType == gl.GL_FRAGMENT_SHADER then
			print('compileShader(fragment): \n' .. ffi.string(cLog))
		else
			print('compileShader: \n' .. ffi.string(cLog))
		end

	end

	return shaderID
end

function ShaderProgram:start()
	gl.glUseProgram(self.programID)
	for _, v in pairs(self.attributes) do
		gl.glEnableVertexAttribArray(v)
	end
end

function ShaderProgram:stop()
	for _, v in pairs(self.attributes) do
		gl.glDisableVertexAttribArray(v)
	end
	gl.glUseProgram(0)
end

function ShaderProgram:destroy()
	self:stop()
	gl.glDetachShader(self.programID, self.vertID)
	gl.glDetachShader(self.programID, self.fragID)
	gl.glDeleteShader(self.vertID)
	gl.glDeleteShader(self.fragID)
	gl.glDeleteProgram(self.programID)
end

function ShaderProgram:setUniformBoolean(name, value)
	self:setUniformFloat(name, value and 1.0 or 0.0)
end

function ShaderProgram:setUniformInt(name, value)
	gl.glUniform1i(self.uniforms[name], value)
end

function ShaderProgram:setUniformFloat(name, value)
	gl.glUniform1f(self.uniforms[name], value)
end

-- TODO: Vector data structure
function ShaderProgram:setUniformVector(name, value)
	gl.glUniform3f(self.uniforms[name], value.x, value.y, value.z)
end

-- TODO: Matrix data structure
function ShaderProgram:setUniformMatrix(name, value)
	gl.glUniformMatrix4fv(self.uniforms[name], 1, false, value.buffer)
end

return ShaderProgram
