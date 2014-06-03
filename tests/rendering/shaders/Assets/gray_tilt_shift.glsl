uniform sampler2D tex0;
varying vec2 tcoord;
varying vec4 color;

void main() {

     const float bluramount = 4.0;

     const float center = 1.1;

     float amount;
     vec4 blurred;
     
     const float stepSize = 0.004;
     const float steps = 2.0;
     
     amount = pow((tcoord.y * center) * 2.0 - 1.0, 2.0) * bluramount;
     
     const float minOffs = (float(steps-1.0)) / -2.0;
     const float maxOffs = (float(steps-1.0)) / 2.0;
     
     blurred = vec4(0.0, 0.0, 0.0, 1.0);
     
     for (float offsX = minOffs; offsX <= maxOffs; offsX++) {
        for (float offsY = minOffs; offsY <= maxOffs; offsY++) {

            vec2 temp_tcoord = tcoord.xy;

            temp_tcoord.x += offsX * amount * stepSize;
            temp_tcoord.y += offsY * amount * stepSize;

            vec4 texcolor = texture2D(tex0, temp_tcoord);
            float luminosity = (texcolor.r + texcolor.g + texcolor.b) / 3.0;
            vec4 gray = vec4(luminosity,luminosity,luminosity,1);
            blurred += gray;
        }

     }
     
     blurred /= float(steps * steps);
     gl_FragColor = blurred;

}

