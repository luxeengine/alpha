uniform sampler2D tex0;
varying vec2 tcoord;
varying vec4 color;

uniform float smoothness;
uniform float thickness;

vec4 color_tint = vec4(1,1,1,1);

uniform vec4 outline_color;
uniform float outline;

uniform vec4 glow_color;
uniform float glow_threshold;
uniform float glow_amount;

void main() {

//basic sdf

    float dist = texture2D(tex0, tcoord).a;
    float smoothing = fwidth(dist) * smoothness;

    // float smoothing = smoothness * length(vec2(dFdx(dist), dFdy(dist)));

    float alpha = smoothstep(thickness - smoothing, thickness + smoothing, dist);
          // alpha = clamp(alpha,0.0,1.0);

    vec4 finalColor = vec4(color.rgb, color.a * alpha);

//outline

    if(outline > 0.0) {

                //range of 1.0 ~ 0.1, we get 0 ~ 1
        float _outline = 0.9 - (outline * 0.9);
        float outlineAlpha = smoothstep(_outline - smoothing, _outline + smoothing, dist);

        vec4 outline_c = vec4(outline_color.rgb, outline_color.a * outlineAlpha);
        finalColor = mix(outline_c, finalColor, alpha);

    } //outline

// //glow

    if(glow_amount > 0.0) {

        float amt = 1.0 - glow_amount;
        float start = amt * glow_threshold;
        float glowAlpha = smoothstep(start, amt, dist);
        finalColor = mix(vec4(glow_color.rgb, glow_color.a * glowAlpha), finalColor, finalColor.a);

    }

//global tint

    finalColor *= color_tint;

//done

    gl_FragColor = finalColor;

}


