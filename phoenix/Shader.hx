package phoenix;

import phoenix.Resource;
import phoenix.ResourceManager;
import phoenix.Vector;
import phoenix.Texture;

import lime.gl.GL;
import lime.gl.GLShader;
import lime.gl.GLProgram;

class Shader extends Resource {

    public var errors : String = '';
	public var log : String = '';

	public var vert_shader : Dynamic;
	public var frag_shader : Dynamic;
	public var program : GLProgram;
	public var shader : GLShader;

	public function new( _manager : ResourceManager ) {
		
		super( _manager, ResourceType.shader );
        
	}

	public function activate() {
		if(program != null) {
            // trace('\t\t activating shader ' + id + ' ' + program);
            
			GL.useProgram( program );
		} else {
			//GL.useProgram( null );
		}
	}

	public function deactivate() {
		//GL.useProgram( null );
	}

		//GL.FRAGMENT_SHADER
	public function compile( _type : Int, _source:String, _verbose:Bool = false ) : GLShader {
		var _shader = GL.createShader( _type );
		GL.shaderSource( _shader,  _source);
		GL.compileShader(_shader);

        var shader_log = '';
        if(_verbose) {
            shader_log = GL.getShaderInfoLog(_shader);
            if(shader_log.length > 0) {

                addLog("\n\t :: start -- (" + ((_type == GL.FRAGMENT_SHADER) ? "fragment" : "vertex" ) + ") Shader compile log -- " + id + '\n');
                
                addLog("\t\t" + shader_log + '\n');
                
                addLog("\t :: end -- (" + ((_type == GL.FRAGMENT_SHADER) ? "fragment" : "vertex" ) + ") Shader compile log -- " + id);

            } //shader_log.length

        } //_verbose

		if (GL.getShaderParameter(_shader, GL.COMPILE_STATUS) == 0) {

			addError("\tFailed to compile shader (" + ((_type == GL.FRAGMENT_SHADER) ? "fragment" : "vertex" ) + ") : \n");
                
                //only fetch if we haven't already above
            if(!_verbose) {
                shader_log = GL.getShaderInfoLog(_shader);
            }

            addError( "\t\t"+ shader_log );

            GL.deleteShader(_shader);
            _shader = null;

            return null;

        } //compile_status

        return _shader;
	}

	public function link() {

		var _program = GL.createProgram();

		GL.attachShader(_program, vert_shader);
	    GL.attachShader(_program, frag_shader);
    	GL.linkProgram(_program);
      
      	if( GL.getProgramParameter(_program, GL.LINK_STATUS) == 0) {
         	addError("\tFailed to link shader program:");
         	addError( "\t\t"+ GL.getProgramInfoLog(_program) );
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
	public function load_from_string( _vertex_source:String, _fragment_source:String, _verbose:Bool = false ) {
			
			//First clean up
		destroy();  		

			//compile the sources
	    vert_shader = compile( GL.VERTEX_SHADER, _vertex_source, _verbose );
	    frag_shader = compile( GL.FRAGMENT_SHADER, _fragment_source, _verbose );

	    	//Any errors? fail
	    if( vert_shader == null || frag_shader == null ) {
            if(_verbose) {
                throw "SHADER : " + id + " \n\n " + log + '\n' + errors;
            } else {
                throw errors;
            } 
            return false;
        }

	    	//Link shader
	    program = link();

            //Check compile status and throw errors if there are any
        if(program == null) {
            if(_verbose) {
                throw log + '\n' + errors;
            } else {
                throw errors;
            }            
        } else {            
            if(_verbose && log.length > 0) {
                trace(log);
            }
        }

	    	//if it fails return false
	    if( program == null ) return false;

	    return true;	
	}

	public function getUniform( uniform_name : String  ) : lime.gl.GLUniformLocation {
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

    public function addLog( _log:String ) {
        log += _log;
    }

    public function addError( _error:String ) {
    	errors += _error;
    }

}	
