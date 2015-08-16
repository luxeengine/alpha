attribute vec3 vertexPosition;
attribute vec2 vertexTCoord;
attribute vec4 vertexColor;
attribute vec3 vertexNormal;

varying vec2 tcoord;
varying vec4 color;

uniform mat4 projectionMatrix;
uniform mat4 modelViewMatrix; //this was previously named incorrectly but will be fixed later
uniform mat4 model; //this is only for custom submissions

void main(void) {

    gl_Position = projectionMatrix * modelViewMatrix * model * vec4(vertexPosition, 1.0);
    tcoord = vertexTCoord;
    color = vertexColor;
    vec3 n = vertexNormal;
    gl_PointSize = 1.0;

}