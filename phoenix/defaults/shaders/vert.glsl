attribute vec3 vertexPosition;
attribute vec2 vertexTCoord;
attribute vec4 vertexColor;
attribute vec3 vertexNormal;

varying vec2 tcoord;
varying vec4 color;

uniform mat4 projectionMatrix;
uniform mat4 modelViewMatrix;

void main(void) {

    gl_Position = projectionMatrix * modelViewMatrix * vec4(vertexPosition, 1.0);
    tcoord = vertexTCoord;
    color = vertexColor;
        //hmm! I think shaders are compiled optimised, removing unused values which means
        //that the shaders getVertexNormal attribute returns invalid (-1) values!
    vec3 n = vertexNormal;
    gl_PointSize = 1.0;

}