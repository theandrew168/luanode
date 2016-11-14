package.path = package.path .. ';./bindings/?.lua'
package.path = package.path .. ';./src/?.lua'
package.path = package.path .. ';./src/resources/?.lua'

local Window = require('Window')
local Model = require('Model')
local Manager = require('ResourceManager')
local Renderable = require('Renderable')
local Render = require('BasicRenderer')
local VALS = require('values')

local window = Window.new(960, 640)
window:printSpecs()
window:clearColor(0.2, 0.2, 0.2)

Render.initialize()

local model = Model.new()
local triangle = Renderable.new()
triangle.shader = Manager.get('shader/basic')
triangle.model = model

local alpha = 0.2
local diff = 0.1

while window:shouldClose() == 0 do
	window:clear()
	window:update()

	triangle:updateUniform('uAlpha', alpha)
	Render.draw(triangle)

	window:draw()

	alpha = alpha + diff
	if alpha > 10 then
		diff = -diff
	elseif alpha < 0 then
		diff = -diff
	end
end

Manager.unload('shader/basic')
window:destroy()
