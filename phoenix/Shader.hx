package phoenix;

import phoenix.Resource;
import phoenix.ResourceManager;
import phoenix.Vector;
import phoenix.Texture;

import nmegl.gl.GL;
import nmegl.gl.GLShader;
import nmegl.gl.GLProgram;

class Shader extends Resource {

	public var errors : String = '';

	public var vert_shader : Dynamic;
	public var frag_shader : Dynamic;
	public var program : GLProgram;
	public var shader : GLShader;

	public function new( _manager : ResourceManager ) {
		
		super( _manager, ResourceType.shader );

	}

	public function activate() {
		if(program != null) {
			GL.useProgram( program );
		} else {
			GL.useProgram( null );
		}
	}

	public function deactivate() {
		GL.useProgram( null );
	}

		//GL.FRAGMENT_SHADER
	public function compile( type : Int, source:String ) : GLShader {
		var _shader = GL.createShader( type );
		GL.shaderSource( _shader,  source);
		GL.compileShader(_shader);

		if (GL.getShaderParameter(_shader, GL.COMPILE_STATUS) == 0) {
			addError("\tFailed to compile shader (" + ((type == GL.FRAGMENT_SHADER) ? "fragment" : "vertex" ) + ") : \n");
            addError( "\t\t"+ GL.getShaderInfoLog(_shader) );
            GL.deleteShader(_shader);
            _shader = null;
            return null;
        }

        return _shader;
	}

	public function link() {

		var _program = GL.createProgram();

		GL.attachShader(_program, vert_shader);
	    GL.attachShader(_program, frag_shader);
    	GL.linkProgram(_program);
      
      	if( GL.getProgramParameter(_program, GL.LINK_STATUS) == 0) {
         	addError("Failed to link shader program:");
         	addError( GL.getProgramInfoLog(_program) );
         	GL.deleteProgram(_program);
         	_program = null;
         	return null;
      	}

      	return _program;
	}

	public function destroy() {
		if( vert_shader != null ) GL.deleteShader( vert_shader );
		if( frag_shader != null ) GL.deleteShader( frag_shader );
		if( program != null ) GL.deleteProgram( program );		
	}

	//! Loads shaders from a string, compiles, and links them */
	public function load_from_string( _vertex_source:String, _fragment_source:String ) {
			
			//First clean up
		destroy();  		

			//compile the sources
	    vert_shader = compile( GL.VERTEX_SHADER, _vertex_source );
	    frag_shader = compile( GL.FRAGMENT_SHADER, _fragment_source );

	    	//Any errors? fail
	    if( vert_shader == null || frag_shader == null ) return false;

	    	//Link shader
	    program = link();

	    	//if it fails return false
	    if( program == null ) return false;

	    return true;	
	}

	public function getUniform( uniform_name : String  ) : Int {
		return GL.getUniformLocation( program, uniform_name );
	}

    public function setUniformInt( uniform_name:String, value:Int ) {
    	GL.uniform1i( getUniform(uniform_name) , value );
    }

    public function setUniformFloat( uniform_name:String, value:Float ) {
		GL.uniform1f( getUniform(uniform_name) , value );
    }

    public function setUniformVector( uniform_name:String, value:Vector ) {
		GL.uniform3f( getUniform(uniform_name) , value.x, value.y, value.z );
    }

    public function setUniformColor( uniform_name:String, value:Color ) {
		GL.uniform4f( getUniform(uniform_name) , value.r, value.g, value.b, value.a );
    }

    public function setUniformTexture( uniform_name:String, value:Int ) {
    	GL.uniform1i( getUniform(uniform_name) , value );
    }

    public function addError( error:String ) {
    	errors += error;
    }

}	
