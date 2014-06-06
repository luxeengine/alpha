uniform sampler2D tex0;
varying vec2 tcoord;
varying vec4 color;

void main() {
    vec4 texcolor = texture2D(tex0, tcoord);
    // float luminosity = (texcolor.r + texcolor.g + texcolor.b) / 3.0;
    // vec4 gray = vec4(luminosity,luminosity,luminosity,1);
    // vec4 ocolor = vec4(texcolor.r, texcolor.g, texcolor.b, 1);
    // vec4 uvcolor = vec4(tcoord.x, tcoord.y, (tcoord.x+tcoord.y)*2.0, 1);
    // vec4 white = vec4(1, 1, 1, 0.6);
    // gl_FragColor = gray * ((tcoord.x+tcoord.y)/2.0);
    gl_FragColor = color * texcolor; //vec4(0,0.9,0.6,1); ;
    // gl_FragColor = vec4(gl_PointCoord.x, gl_PointCoord.y, 0, 1);
    // vec4 cc = uvcolor * gray;
    // gl_FragColor = texcolor;
}