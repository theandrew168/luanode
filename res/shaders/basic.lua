vertex {
source = [[
#version 100

attribute vec4 aPosition;
attribute vec4 aColor;

uniform float uAlpha;

varying vec4 vColor;
varying float vAlpha;

void main() {
	gl_Position = aPosition;
	vColor = aColor;
	vAlpha = uAlpha;
}
]],

attributes = {
	aPosition = 0,
	aColor = 1,
},

uniforms = {
	uAlpha = 'float',
},
}

fragment {
source = [[
#version 100

precision mediump float;

varying vec4 vColor;
varying float vAlpha;

void main() {
	gl_FragColor = vColor * vAlpha;
}
]],
}
