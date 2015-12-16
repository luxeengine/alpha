varying vec4 color;
varying vec2 tcoord;

uniform sampler2D tex0;
uniform float grid_size;

void main() {

    int xcoord = int(tcoord.s * grid_size);
    int ycoord = int(tcoord.t * grid_size);

    vec2 grid_coord = vec2(
        float(xcoord)/grid_size,
        float(ycoord)/grid_size
    );

    gl_FragColor = texture2D(tex0, grid_coord) * color;

} //main