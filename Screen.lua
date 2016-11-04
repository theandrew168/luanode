local gl = require('gles2')
local glfw = require('glfw3')
local ffi = require('ffi')

local Screen = {}
Screen.__index = Screen

function Screen.new(width, height)
	local screen = {}
	setmetatable(screen, Screen)

	screen.width = width
	screen.height = height

	-- init input fields
	screen.INPUT = glfw.INPUT_CONSTANTS
	screen.mouse_xpos = ffi.typeof("double[1]")()
	screen.mouse_ypos = ffi.typeof("double[1]")()

	if glfw.init() ~= glfw.TRUE then
		print('Failed to init GLFW!')
		os.exit()
	end

	glfw.windowHint(glfw.CLIENT_API, glfw.OPENGL_ES_API)
	glfw.windowHint(glfw.CONTEXT_CREATION_API, glfw.EGL_CONTEXT_API)
	glfw.windowHint(glfw.CONTEXT_VERSION_MAJOR, 2)
	glfw.windowHint(glfw.CONTEXT_VERSION_MINOR, 0)

	screen.window = glfw.createWindow(width, height, "LuaJIT - OpenGL ES 2.0", nil, nil)
	if screen.window == nil then
		print('Failed to create window!')
		os.exit()
	end

	glfw.makeContextCurrent(screen.window)
	glfw.swapInterval(1)

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

function Screen:clearColor(r, g, b)
	gl.clearColor(r, g, b, 1.0)
end

function Screen:getCursorPos()
	glfw.getCursorPos(self.window, self.mouse_xpos, self.mouse_ypos)
	return self.mouse_xpos[0], self.mouse_ypos[0]
end

function Screen:isMouseButtonPressed(button)
	return glfw.getMouseButton(self.window, button) == glfw.PRESS
end

function Screen:isKeyPressed(key)
	return glfw.getKey(self.window, key) == glfw.PRESS
end

function Screen:printSpecs()
	print('Vendor:   ' .. ffi.string(gl.getString(gl.VENDOR)))
	print('Renderer: ' .. ffi.string(gl.getString(gl.RENDERER)))
	print('Version:  ' .. ffi.string(gl.getString(gl.VERSION)))
	print('Shaders:  ' .. ffi.string(gl.getString(gl.SHADING_LANGUAGE_VERSION)))
end

return Screen
