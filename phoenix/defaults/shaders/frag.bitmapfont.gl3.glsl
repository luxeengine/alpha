#version 330 core

#define OUTLINE 1
#define GLOW 1
#define SUPERSAMPLE 1

uniform sampler2D tex0;
in vec2 tcoord;
in vec4 color;
out vec4 frag;

uniform float smoothness;
uniform float thickness;

uniform vec4 outline_color;
uniform float outline;

uniform vec4 glow_color;
uniform float glow_threshold;
uniform float glow_amount;


float edge(float value, float amount, float t) {
    return smoothstep(value - amount, value + amount, t);
}

float get(vec2 uv, float width) {
    float texa = texture(tex0, uv).a;
    return smoothstep(0.5 - width, 0.5 + width, texa);
}

void main() {

//basic sdf

    float dist = texture(tex0, tcoord).a;
        //fwidth keeps width similar despite scaling, see below for options
    float smoothamt = smoothness * fwidth(dist);
    // float smoothamt = smoothness * length(vec2(dFdx(dist), dFdy(dist)));

        //calculate the edge smoothing
    float alpha = edge(1.0 - thickness, smoothamt, dist);

//super sampling

        #if SUPERSAMPLE == 1

                //these values can be exposed later
                //the current being 0.25/sqrt(2)
            float factor = 0.1767766953;
            float sampleamt = 0.5;
                //this is a simple box filter around the point,
                //we use a separate width for now
            float samplew = sampleamt * fwidth(dist);
            vec2 sampleoffset = factor * (dFdx(tcoord) + dFdy(tcoord));
            vec4 fltr = vec4(tcoord - sampleoffset, tcoord + sampleoffset);

            float total = get( fltr.xy, samplew ) + get( fltr.zw, samplew ) +
                          get( fltr.xw, samplew ) + get( fltr.zy, samplew );

            alpha = (alpha + 0.5 * total) / 3.0;

        #endif //SUPERSAMPLE

        //the base color + scaled by the new alpha
    vec4 finalColor = vec4(color.rgb, color.a * alpha);

//outline

    #if OUTLINE == 1

            //wip
        if(outline > 0.0) {

            //range of 1.0 ~ 0.1, we get 0 ~ 1
            float _outline = 0.9 - (outline * 0.9);
            float _outline_a = edge(_outline, smoothamt, dist);
            vec4 _outline_c = vec4(outline_color.rgb, outline_color.a * _outline_a);

            finalColor = mix(_outline_c, finalColor, alpha);

        } //outline > 0.0

    #endif //OUTLINE

// glow

    #if GLOW == 1

            //wip
        if(glow_amount > 0.0) {

            //:todo: expose offset for directional shadow
            // vec2 _glow_offs = vec2(0,0);
            // float _glow_dist = texture(tex0, tcoord - _glow_offset).a;

            float _glow_amt = 1.0 - glow_amount;
            float _glow_limit = (_glow_amt * glow_threshold);
            float _glow_a = edge(_glow_amt, _glow_limit, dist);
            vec4  _glow_c = vec4(glow_color.rgb, glow_color.a * _glow_a);

            finalColor = mix(_glow_c, finalColor, finalColor.a);

        } //glow_amount > 0

    #endif //GLOW

//done

    frag = finalColor;


} //main
