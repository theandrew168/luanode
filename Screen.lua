local gl = require('gles3')
local glfw = require('glfw3')

local Screen = {}
Screen.__index = Screen

function Screen.new(width, height)
	local screen = {}
	setmetatable(screen, Screen)

	screen.width = width
	screen.height = height

	glfw.init();
	screen.window = glfw.createWindow(width, height, "LuaJIT - OpenGL ES 3.0", nil, nil)
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

return Screen
