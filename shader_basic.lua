vert {
source = [[
#version 100

attribute vec4 vPosition;
attribute vec4 vColor;
varying vec4 foobar;

void main() {
	gl_Position = vPosition;
	foobar = vColor;
}
]],

attributes = {
	vPosition = 0,
	vColor = 1,
}
}

frag {
source = [[
#version 100

precision mediump float;

varying vec4 foobar;

void main() {
	gl_FragColor = foobar;
}
]],
}
