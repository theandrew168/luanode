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

local tri = Model.new()
tri:addBuffer(0, 3, VALS.triangle.vertices)
tri:addBuffer(1, 3, VALS.triangle.colors)

local triangle = Renderable.new()
triangle:setShader(Manager.get('shader/basic'))
triangle:setModel(tri)
local alpha = 0.2
local diff = 0.001

while window:shouldClose() == 0 do
	window:clear()
	window:update()

	triangle:setUniform('uAlpha', 'float', alpha)
	Render.draw(triangle)

	window:draw()

	alpha = alpha + diff
	if alpha > 10 then
		diff = -0.001
	elseif alpha < 0 then
		diff = 0.001
	end
end

Manager.unload('shader/basic')
window:destroy()
