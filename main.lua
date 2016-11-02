local Screen = require('Screen')

local screen = Screen.new(960, 640)

while screen:shouldClose() == 0 do
	screen:clear()
	screen:update()
	screen:draw()
end

screen:destroy()
