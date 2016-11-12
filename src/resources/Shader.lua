local ffi = require('ffi')
local gl = require('gles2')

local SHADER_DIR = 'res/shaders/'

local Shader = {}
Shader.__index = Shader

--- Create new Shader from shader file.
-- @param filename Name of shader file
-- @return Shader object
function Shader.new(filename)
	local shader = {}
	setmetatable(shader, Shader)

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

	shader.vertID = shader.compileShader(vertSource, gl.GL_VERTEX_SHADER)
	shader.fragID = shader.compileShader(fragSource, gl.GL_FRAGMENT_SHADER)
	shader.id = gl.glCreateProgram()

	gl.glAttachShader(shader.id, shader.vertID)
	gl.glAttachShader(shader.id, shader.fragID)

	-- Bind attribute locations based on shader file
	shader.attributes = attributes
	for k, v in pairs(attributes) do
		gl.glBindAttribLocation(shader.id, v, k)
	end

	gl.glLinkProgram(shader.id)
	gl.glValidateProgram(shader.id)

	-- Cache uniform locations
	shader.uniforms = {}
	for k, v in pairs(uniforms) do
		if shader.uniforms[k] == nil then
			shader.uniforms[k] = {}
		end

		shader.uniforms[k].dataType = v
		shader.uniforms[k].location = gl.glGetUniformLocation(shader.id, k)
	end

	return shader
end

--- Compile shaders from source.
-- @param shaderSource Shader source code as a string
-- @param shaderType Type of shader (GL_VERTEX_SHADER or GL_FRAGMENT_SHADER)
-- @return ID of compiled shader
function Shader.compileShader(shaderSource, shaderType)
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

--- Start using this shader program and enable attrib arrays.
function Shader:start()
	gl.glUseProgram(self.id)
	for _, v in pairs(self.attributes) do
		gl.glEnableVertexAttribArray(v)
	end
end

--- Stop using this shader program and disable attrib arrays.
function Shader:stop()
	for _, v in pairs(self.attributes) do
		gl.glDisableVertexAttribArray(v)
	end
	gl.glUseProgram(0)
end

--- Delete this shader and free its resources
function Shader:destroy()
	self:stop()
	gl.glDetachShader(self.id, self.vertID)
	gl.glDetachShader(self.id, self.fragID)
	gl.glDeleteShader(self.vertID)
	gl.glDeleteShader(self.fragID)
	gl.glDeleteProgram(self.id)
end

--- Set uniform value
-- @param uniformName Name of uniform in shader (must be exact)
-- @param uniformType Type of uniform in shader
-- @param value Value to be assigned to uniform
function Shader:setUniform(uniformName, value)
	local uniform = self.uniforms[uniformName]
	if uniform.dataType == 'bool' then
		gl.glUniform1f(uniform.location, value and 1.0 or 0.0)
	elseif uniform.dataType == 'int' then
		gl.glUniform1i(uniform.location, value)
	elseif uniform.dataType == 'float' then
		gl.glUniform1f(uniform.location, value)
	elseif uniform.dataType == 'vector' then
		print('setUniform: TODO vector')
	elseif uniform.dataType == 'matrix' then
		print('setUniform: TODO matrix')
	end
end

return Shader
