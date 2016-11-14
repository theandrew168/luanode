local Renderable = {}
Renderable.__index = Renderable

function Renderable.new()
	local renderable = {}
	setmetatable(renderable, Renderable)

	renderable.shader = nil
	renderable.model = nil
	renderable.material = nil
	renderable.uniforms = {}

	return renderable
end

function Renderable:updateUniform(uniformName, value)
	self.uniforms[uniformName] = value
end

function Renderable:resetUniforms()
	self.uniforms = {}
end

return Renderable
