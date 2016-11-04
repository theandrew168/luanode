package.path = package.path .. ';./bindings/?.lua'

local Screen = require('Screen')

local screen = Screen.new(960, 640)
screen:printSpecs()
screen:clearColor(0.2, 0.2, 0.2)

while screen:shouldClose() == 0 do
	screen:clear()
	screen:update()
	screen:draw()
end

screen:destroy()
