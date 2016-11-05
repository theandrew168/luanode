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

	if glfw.glfwInit() ~= glfw.GLFW_TRUE then
		print('Failed to init GLFW!')
		os.exit()
	end

	glfw.glfwWindowHint(glfw.GLFW_CLIENT_API, glfw.GLFW_OPENGL_ES_API)
	glfw.glfwWindowHint(glfw.GLFW_CONTEXT_CREATION_API, glfw.GLFW_EGL_CONTEXT_API)
	glfw.glfwWindowHint(glfw.GLFW_CONTEXT_VERSION_MAJOR, 2)
	glfw.glfwWindowHint(glfw.GLFW_CONTEXT_VERSION_MINOR, 0)

	screen.window = glfw.glfwCreateWindow(width, height, "LuaJIT - OpenGL ES 2.0", nil, nil)
	if screen.window == nil then
		print('Failed to create window!')
		os.exit()
	end

	glfw.glfwMakeContextCurrent(screen.window)
	glfw.glfwSwapInterval(1)

	return screen
end

function Screen:shouldClose()
	return glfw.glfwWindowShouldClose(self.window)
end

function Screen:destroy()
	glfw.glfwTerminate()
end

function Screen:clear()
	gl.glClear(gl.GL_COLOR_BUFFER_BIT)
end

function Screen:update()
	glfw.glfwPollEvents()
end

function Screen:draw()
	glfw.glfwSwapBuffers(self.window)
end

function Screen:clearColor(r, g, b)
	gl.glClearColor(r, g, b, 1.0)
end

function Screen:getCursorPos()
	glfw.glfwGetCursorPos(self.window, self.mouse_xpos, self.mouse_ypos)
	return self.mouse_xpos[0], self.mouse_ypos[0]
end

function Screen:isMouseButtonPressed(button)
	return glfw.glfwGetMouseButton(self.window, button) == glfw.GLFW_PRESS
end

function Screen:isKeyPressed(key)
	return glfw.glfwGetKey(self.window, key) == glfw.GLFW_PRESS
end

function Screen:printSpecs()
	print('Vendor:   ' .. ffi.string(gl.glGetString(gl.GL_VENDOR)))
	print('Renderer: ' .. ffi.string(gl.glGetString(gl.GL_RENDERER)))
	print('Version:  ' .. ffi.string(gl.glGetString(gl.GL_VERSION)))
	print('Shaders:  ' .. ffi.string(gl.glGetString(gl.GL_SHADING_LANGUAGE_VERSION)))
end

return Screen
