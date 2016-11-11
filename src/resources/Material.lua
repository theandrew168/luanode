local Material = {}
Material.__index = Material

function Material.new()
	local material = {}
	setmetatable(material, Material)



	return meterial
end

function Material:destroy()
	print('Material: destroy()')
end

return Material
