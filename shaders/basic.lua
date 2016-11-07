vertex {
source = [[
#version 100

attribute vec4 aPosition;
attribute vec4 aColor;

uniform vec4 uMVPMatrix;

varying vec4 vColor;
varying vec4 vMVP;

void main() {
	gl_Position = aPosition;
	vColor = aColor;
	vMVP = uMVPMatrix;
}
]],

attributes = {
	aPosition = 0,
	aColor = 1,
},

uniforms = {
	'uMVPMatrix',
},
}

fragment {
source = [[
#version 100

precision mediump float;

varying vec4 vColor;
varying vec4 vMVP;

void main() {
	gl_FragColor = vColor;
}
]],
}
