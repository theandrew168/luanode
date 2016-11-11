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

function Renderable:getShader()
	return self.shader
end

function Renderable:setShader(shader)
	self.shader = shader
end

function Renderable:getModel()
	return self.model
end

function Renderable:setModel(model)
	self.model = model
end

function Renderable:getMaterial()
	return self.material
end

function Renderable:setMaterial(material)
	self.material = material
end

function Renderable:setUniform(uniformName, uniformType, value)
	self.uniforms[uniformName] = {}
	self.uniforms[uniformName].uniformType = uniformType
	self.uniforms[uniformName].value = value
end

function Renderable:resetUniforms()
	self.uniforms = {}
end

function Renderable:getUniforms()
	return self.uniforms
end

return Renderable
