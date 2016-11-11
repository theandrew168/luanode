package.path = package.path .. ';./bindings/?.lua'
package.path = package.path .. ';./src/?.lua'
package.path = package.path .. ';./src/resources/?.lua'

local Window = require('Window')
local Model = require('Model')
local Shader = require('Shader')
local Manager = require('ResourceManager')
local VALS = require('values')

local window = Window.new(960, 640)
window:printSpecs()
window:clearColor(0.2, 0.2, 0.2)

local tri = Model.new()
tri:addBuffer(0, 3, VALS.triangle.vertices)
tri:addBuffer(1, 3, VALS.triangle.colors)

local shader_basic = Manager.get('shader/basic')

while window:shouldClose() == 0 do
	window:clear()
	window:update()

	shader_basic:start()
	shader_basic:setUniformFloat('uAlpha', 0.8)

	tri:bind()
	tri:draw()
	tri:unbind()

	shader_basic:stop()

	window:draw()
end

Manager.unload('shader/basic')
window:destroy()
