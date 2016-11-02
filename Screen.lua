local gl = require('gles3')
local glfw = require('glfw3')
local ffi = require('ffi')

local Screen = {}
Screen.__index = Screen

function Screen.new(width, height)
	local screen = {}
	setmetatable(screen, Screen)

	screen.width = width
	screen.height = height

	if glfw.init() ~= 1 then
		print('Failed to init GLFW!')
		return {}
	end

	glfw.windowHint(glfw.CLIENT_API, glfw.OPENGL_ES_API)
	glfw.windowHint(glfw.CONTEXT_VERSION_MAJOR, 3)
	glfw.windowHint(glfw.CONTEXT_VERSION_MINOR, 0)

	screen.window = glfw.createWindow(width, height, "LuaJIT - OpenGL ES 3.0", nil, nil)
	if screen.window == 0 then
		print('Failed to create window!')
		return {}
	end

	glfw.makeContextCurrent(screen.window)
	glfw.swapInterval(1)
	gl.clearColor(0.2, 0.4, 0.4, 1.0)

	print('Vendor:   ' .. ffi.string(gl.getString(gl.VENDOR)))
	print('Renderer: ' .. ffi.string(gl.getString(gl.RENDERER)))
	print('Version:  ' .. ffi.string(gl.getString(gl.VERSION)))
	print('Shaders:  ' .. ffi.string(gl.getString(gl.SHADING_LANGUAGE_VERSION)))

	return screen
end

function Screen:shouldClose()
	return glfw.windowShouldClose(self.window)
end

function Screen:destroy()
	glfw.terminate()
end

function Screen:clear()
	gl.clear(gl.COLOR_BUFFER_BIT)
end

function Screen:update()
	glfw.pollEvents()
end

function Screen:draw()
	glfw.swapBuffers(self.window)
end

return Screen
