package phoenix;

class DefaultShaders {

	public static var DefaultVertexShader =
	    "

        attribute vec3 vertexPosition;
        attribute vec2 tcoordPosition;

        uniform mat4 projectionMatrix;
        uniform mat4 modelViewMatrix;
        uniform mat4 modelMatrix;
        uniform mat4 viewMatrix; 

        void main(void) {
            gl_Position = projectionMatrix * modelViewMatrix * vec4(vertexPosition, 1.0);
        }

        ";

	public static var DefaultFragmentShader =

		#if !desktop
	  	"precision mediump float;" +
	  	#end

		"
        	uniform sampler2D uSampler;

        	void main() {
        	    gl_FragColor = vec4(0.4,0.1,0.1,1);
        	}
        ";

}

