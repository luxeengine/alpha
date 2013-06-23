package phoenix;

class DefaultShaders {

	public static var DefaultVertexShader =
		"attribute vec3 vertexPosition;
	    
	    uniform mat4 modelViewMatrix;
	    uniform mat4 projectionMatrix;
	    
	    void main(void) {
	        gl_Position = projectionMatrix * modelViewMatrix * vec4(vertexPosition, 1.0);
	    }";	

	public static var DefaultFragmentShader =
		"void main(void) {
            gl_FragColor = vec4(1.0, 1.0, 1.0, 1.0);
        }";

}

