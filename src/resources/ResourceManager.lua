local Shader = require('Shader')
local Model = require('Model')
local Material = require('Material')
local ResourceManager = {}

RES_PATH = 'res/'

local resources = {}

local function resSplit(resName, delim)
	local result = {}

	delimIndex = string.find(resName, delim)
	table.insert(result, string.sub(resName, 1, delimIndex - 1))
	table.insert(result, string.sub(resName, delimIndex + 1))

	return result
end

function ResourceManager.load(resName)
	if resources[resName] ~= nil then
		return
	end

	print('ResourceManager.load(): ' .. resName)
	local tokens = resSplit(resName, '/')
	if tokens[1] == 'shader' then
		resources[resName] = Shader.new(tokens[2])
	elseif tokens[1] == 'model' then
		resources[resName] = Model.new(tokens[2])
	elseif tokens[1] == 'material' then
		resources[resName] = Texture.new(tokens[2])
	end
end

function ResourceManager.unload(resName)
	resources[resName]:destroy()
	resources[resName] = nil
end

function ResourceManager.get(resName)
	if resources[resName] == nil then
		ResourceManager.load(resName)
	end

	return resources[resName]
end

return ResourceManager
