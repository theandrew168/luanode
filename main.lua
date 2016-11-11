package.path = package.path .. ';./bindings/?.lua'

local Window = require('Window')
local Model = require('Model')
local Shader = require('ShaderProgram')
local VALS = require('values')

local window = Window.new(960, 640)
window:printSpecs()
window:clearColor(0.2, 0.2, 0.2)

local tri = Model.new()
tri:addBuffer(0, 3, VALS.triangle.vertices)
tri:addBuffer(1, 3, VALS.triangle.colors)

local basic = Shader.new('basic')

while window:shouldClose() == 0 do
	window:clear()
	window:update()

	basic:start()
	basic:setUniformFloat('uAlpha', 0.5)

	tri:bind()
	tri:draw()
	tri:unbind()

	basic:stop()

	window:draw()
end

basic:destroy()
window:destroy()
