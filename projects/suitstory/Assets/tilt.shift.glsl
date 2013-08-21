uniform sampler2D tex0;
varying vec2 tcoord;
varying vec4 color;

void main() {
    // vec4 texcolor = texture2D(tex0, tcoord);
    // float luminosity = (texcolor.r + texcolor.g + texcolor.b) / 3.0;
    // vec4 gray = vec4(luminosity,luminosity,luminosity,1);
    // vec4 ocolor = vec4(texcolor.r, texcolor.g, texcolor.b, 1);
    // vec4 uvcolor = vec4(tcoord.x, tcoord.y, (tcoord.x+tcoord.y)*2.0, 1);
    // vec4 white = vec4(1, 1, 1, 0.6);
    // gl_FragColor = gray * ((tcoord.x+tcoord.y)/2.0);
    // gl_FragColor = color * texcolor; //vec4(0,0.9,0.6,1); ;

     const float bluramount = 1.0;

     const float center = 1.1;

     float amount;
     vec4 blurred;
     
     const float stepSize = 0.004;
     const float steps = 3.0;
     
     amount = pow((tcoord.y * center) * 2.0 - 1.0, 2.0) * bluramount;
     
     const float minOffs = (float(steps-1.0)) / -2.0;
     const float maxOffs = (float(steps-1.0)) / 2.0;
     
     blurred = vec4(0.0, 0.0, 0.0, 1.0);
     
     for (float offsX = minOffs; offsX <= maxOffs; offsX++) {
        for (float offsY = minOffs; offsY <= maxOffs; offsY++) {

            vec2 temp_tcoord = tcoord.xy;

            temp_tcoord.x += offsX * amount * stepSize;
            temp_tcoord.y += offsY * amount * stepSize;

            blurred += texture2D(tex0, temp_tcoord);
        }

     }
     
     blurred /= float(steps * steps);
     gl_FragColor = blurred;

}

