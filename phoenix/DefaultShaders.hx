package phoenix;

class DefaultShaders {

	public static var DefaultVertexShader =
	    "

        attribute vec3 vertexPosition;
        attribute vec2 tcoordPosition;

        varying vec2 tcoord;

        uniform mat4 projectionMatrix;
        uniform mat4 modelViewMatrix;

        void main(void) {
            gl_Position = projectionMatrix * modelViewMatrix * vec4(vertexPosition, 1.0);
            tcoord = tcoordPosition;
        }

        ";

	public static var DefaultFragmentShader =

		#if !desktop
	  	"precision mediump float;" +
	  	#end

		"
        	uniform sampler2D tex0;
            varying vec2 tcoord;

        	void main() {
                vec4 texcolor = texture2D(tex0, tcoord);
                float luminosity = (texcolor.r + texcolor.g + texcolor.b) / 3.0;
                vec4 gray = vec4(luminosity,luminosity,luminosity,1);
                vec4 color = vec4(texcolor.r, texcolor.g, texcolor.b, 1);
                // gl_FragColor = gray * ((tcoord.x+tcoord.y)/2.0);
                gl_FragColor = texcolor;
        	}
        ";

}

