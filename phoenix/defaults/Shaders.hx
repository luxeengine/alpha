package phoenix.defaults;

class Shaders {

	public static function vertex_shader() {

	   return "
        
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
        }

        ";
    } //vertex_shader

    public static function fragment_textured() {

       return

        #if !desktop
        "precision mediump float;" +
        #end

        "
            uniform sampler2D tex0;
            varying vec2 tcoord;
            varying vec4 color;

            void main() {
                vec4 texcolor = texture2D(tex0, tcoord);
                float luminosity = (texcolor.r + texcolor.g + texcolor.b) / 3.0;
                vec4 gray = vec4(luminosity,luminosity,luminosity,1);
                vec4 ocolor = vec4(texcolor.r, texcolor.g, texcolor.b, 1);
                vec4 uvcolor = vec4(tcoord.x, tcoord.y, (tcoord.x+tcoord.y)*2.0, 1);
                vec4 white = vec4(1, 1, 1, 0.6);
                // gl_FragColor = gray * ((tcoord.x+tcoord.y)/2.0);
                gl_FragColor = color * texcolor; //vec4(0,0.9,0.6,1); ;
                // vec4 cc = uvcolor * gray;
                // gl_FragColor = texcolor;
            }
        ";

    } //fragment_textured

	public static function fragment_untextured() {

       return

		#if !desktop
	  	"precision mediump float;" +
	  	#end

		"
            varying vec2 tcoord;
            varying vec4 color;

        	void main() {
                gl_FragColor = color;
        	}
        ";

    } //fragment_untextured

}

