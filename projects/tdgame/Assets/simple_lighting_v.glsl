attribute vec3 vertexPosition;        
attribute vec2 vertexTCoord;
attribute vec4 vertexColor;
attribute vec3 vertexNormal;                

varying vec2 tcoord;
varying vec4 color;

uniform mat4 projectionMatrix;
uniform mat4 modelViewMatrix;


// Varyings
varying vec3 v_ecNormal;
varying vec3 eye;

void main() {

    	// Calculate and normalize eye space normal
    vec3 ecNormal = vec3( modelViewMatrix * vec4(vertexNormal, 0.0) );
    	 ecNormal = ecNormal / length(ecNormal);
    	 v_ecNormal = ecNormal;

    eye = -(modelViewMatrix * vec4(vertexPosition, 1.0)).rgb;

    gl_Position = projectionMatrix * modelViewMatrix * vec4(vertexPosition, 1.0);
    tcoord = vertexTCoord;

}