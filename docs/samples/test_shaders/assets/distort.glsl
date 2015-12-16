

uniform sampler2D tex0;
uniform sampler2D tex1;

varying vec2 tcoord;
varying vec4 color;

uniform float distortamount;

void main() {

	vec4 direction = texture2D(tex1, tcoord);
	vec4 col = texture2D(tex0, tcoord + distortamount * (direction.rg - vec2(0.5, 0.5)));

	gl_FragColor = col;

}

