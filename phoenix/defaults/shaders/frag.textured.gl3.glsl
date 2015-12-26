#version 330 core

uniform sampler2D tex0;
in vec2 tcoord;
in vec4 color;
out vec4 frag;

void main() {
    vec4 texcolor = texture(tex0, tcoord);
    frag = color * texcolor;
}