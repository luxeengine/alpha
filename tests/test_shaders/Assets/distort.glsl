

uniform sampler2D tex0;
varying vec2 tcoord;
varying vec4 color;

uniform sampler2D distortmap;

void main() {

	vec4 color1 = texture2D(distortmap, tcoord);
	vec4 color2 = texture2D(tex0, tcoord);

	if(tcoord.x < 0.5) {
    	gl_FragColor = color1;
    } else {
    	gl_FragColor = color2;
    }

}

