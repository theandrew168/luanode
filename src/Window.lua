local gl = require('gles2')
local glfw = require('glfw3')
local ffi = require('ffi')
local bit = require('bit')

local Window = {}
Window.__index = Window

--- Create new Window.
-- @param width Width of window
-- @param height Height of window
-- @return Window object
function Window.new(width, height)
	local window = {}
	setmetatable(window, Window)

	window.width = width
	window.height = height

	-- init input fields
	window.INPUT = glfw.INPUT_CONSTANTS
	window.mouse_xpos = ffi.typeof("double[1]")()
	window.mouse_ypos = ffi.typeof("double[1]")()

	if glfw.glfwInit() ~= glfw.GLFW_TRUE then
		print('Failed to init GLFW!')
		os.exit()
	end

	glfw.glfwWindowHint(glfw.GLFW_CLIENT_API, glfw.GLFW_OPENGL_ES_API)
	glfw.glfwWindowHint(glfw.GLFW_CONTEXT_CREATION_API, glfw.GLFW_EGL_CONTEXT_API)
	glfw.glfwWindowHint(glfw.GLFW_CONTEXT_VERSION_MAJOR, 2)
	glfw.glfwWindowHint(glfw.GLFW_CONTEXT_VERSION_MINOR, 0)
--	glfw.glfwWindowHint(glfw.GLFW_VISIBLE, glfw.GLFW_FALSE)

	window.id = glfw.glfwCreateWindow(width, height, "LuaJIT - OpenGL ES 2.0", nil, nil)
	if window.id == nil then
		print('Failed to create window!')
		os.exit()
	end

	glfw.glfwMakeContextCurrent(window.id)
	glfw.glfwSwapInterval(1)

	return window
end

--- Checks if window should close.
-- @return Whether window should close
function Window:shouldClose()
	return glfw.glfwWindowShouldClose(self.id)
end

--- Destroy window.
function Window:destroy()
	glfw.glfwTerminate()
end

--- Clear window
function Window:clear()
	gl.glClear(bit.bor(gl.GL_COLOR_BUFFER_BIT, gl.GL_DEPTH_BUFFER_BIT))
end

--- Check window for input events
function Window:update()
	glfw.glfwPollEvents()
end

--- Swap window buffers
function Window:draw()
	glfw.glfwSwapBuffers(self.id)
end

--- Show window
function Window:show()
	glfw.glfwShowWindow(self.id)
end

--- Hide window
function Window:hide()
	glfw.glfwHideWindow(self.id)
end

--- Check window visibility
-- @return True if visible, false otherwise
function Window:isVisible()
	return glfw.glfwGetWindowAttrib(self.id, glfw.GLFW_VISIBLE) == 1 and true or false
end

--- Set window clear color
function Window:clearColor(r, g, b)
	gl.glClearColor(r, g, b, 1.0)
end

--- Get position of cursor
-- @return (xpos, ypos) of cursor
function Window:getCursorPos()
	glfw.glfwGetCursorPos(self.id, self.mouse_xpos, self.mouse_ypos)
	return self.mouse_xpos[0], self.mouse_ypos[0]
end

--- Check if mouse button is pressed
-- @param button Mouse button to check
-- @return Whether button is pressed
function Window:isMouseButtonPressed(button)
	return glfw.glfwGetMouseButton(self.id, button) == glfw.GLFW_PRESS
end

--- Check if key is pressed
-- @param key Key to check
-- @return Whether key is pressed
function Window:isKeyPressed(key)
	return glfw.glfwGetKey(self.id, key) == glfw.GLFW_PRESS
end

--- Print details about OpenGL / GPU
function Window:printSpecs()
	print('Vendor:   ' .. ffi.string(gl.glGetString(gl.GL_VENDOR)))
	print('Renderer: ' .. ffi.string(gl.glGetString(gl.GL_RENDERER)))
	print('Version:  ' .. ffi.string(gl.glGetString(gl.GL_VERSION)))
	print('Shaders:  ' .. ffi.string(gl.glGetString(gl.GL_SHADING_LANGUAGE_VERSION)))
end

return Window
