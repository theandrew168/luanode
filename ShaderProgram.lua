local ffi = require('ffi')
local gl = require('gles2')

local ShaderProgram = {}
ShaderProgram.__index = ShaderProgram

ShaderProgram.ATTRIB_POSITION = 0
ShaderProgram.ATTRIB_TCOORDS  = 1
ShaderProgram.ATTRIB_NORMALS  = 2

function ShaderProgram.new(vertSource, fragSource, attributes)
	local program = {}
	setmetatable(program, ShaderProgram)

	program.vertID = program.compileShader(vertSource, gl.GL_VERTEX_SHADER)
	program.fragID = program.compileShader(fragSource, gl.GL_FRAGMENT_SHADER)
	program.programID = gl.glCreateProgram()

	gl.glAttachShader(program.programID, program.vertID)
	gl.glAttachShader(program.programID, program.fragID)

	for k, v in pairs(attributes) do
		gl.glBindAttribLocation(program.programID, v, k)
	end

	gl.glLinkProgram(program.programID)
	gl.glValidateProgram(program.programID)

	return program
end

function ShaderProgram.newFromFile(filename)
	local vertSource, fragSource = nil, nil
	local attributes = nil

	function vert(vertData)
		vertSource = vertData.source
		attributes = vertData.attributes
	end

	function frag(fragData)
		fragSource = fragData.source
	end

	dofile(filename .. '.lua')
	return ShaderProgram.new(vertSource, fragSource, attributes)
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

		print('compileShader: \n' .. ffi.string(cLog))
	end

	return shaderID
end

function ShaderProgram:start()
	gl.glUseProgram(self.programID)
end

function ShaderProgram:stop()
	gl.glUseProgram(0)
end

function ShaderProgram:destroy()
	gl.glDetachShader(self.programID, self.vertID)
	gl.glDetachShader(self.programID, self.fragID)
	gl.glDeleteShader(self.vertID)
	gl.glDeleteShader(self.fragID)
	gl.glDeleteProgram(self.programID)
end

return ShaderProgram
