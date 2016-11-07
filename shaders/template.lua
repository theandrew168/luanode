-- Vertex shader
vertex = {

-- Shader source
-- (required)
source = [[
#version 100
int main() {

}
]],

-- Specify attribute locations
-- These will be set at shader program link time
-- (optional)
attributes = {
	foo = 0,
	bar = 1,
},

-- Specify uniforms
-- Their locations with be retrieved (via glGetUniformLocation)
--     and cached upon shader program creation
-- (optional)
uniforms = {
	'foobar',
	'bazzy',
},

}

-- Fragment shader
fragment = {

-- Shader source
-- (required)
source = [[
#version 100
int main() {

}
]],

}
