package.path = package.path .. ';./bindings/?.lua'

local Screen = require('Screen')
local tri = require('debug_triangle')

local screen = Screen.new(960, 640)
screen:printSpecs()
screen:clearColor(0.2, 0.2, 0.2)

while screen:shouldClose() == 0 do
	screen:clear()
	screen:update()

	tri.draw()

	screen:draw()
	print('Space:      ' .. tostring(screen:isKeyPressed(screen.INPUT.KEY_SPACE)))
	print('Left Mouse: ' .. tostring(screen:isMouseButtonPressed(screen.INPUT.MOUSE_BUTTON_LEFT)))
end

screen:destroy()
