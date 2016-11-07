package.path = package.path .. ';./bindings/?.lua'

local Window = require('Window')
local tri = require('debug_triangle')

local window = Window.new(960, 640)
window:printSpecs()
window:clearColor(0.2, 0.2, 0.2)
tri.init()

while window:shouldClose() == 0 do
	window:clear()
	window:update()

	tri.draw()

	window:draw()
--	print('Space:      ' .. tostring(window:isKeyPressed(window.INPUT.GLFW_KEY_SPACE)))
--	print('Left Mouse: ' .. tostring(window:isMouseButtonPressed(window.INPUT.GLFW_MOUSE_BUTTON_LEFT)))
end

tri.destroy()
window:destroy()
