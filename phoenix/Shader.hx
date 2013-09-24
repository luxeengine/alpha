package phoenix;

import phoenix.Resource;
import phoenix.ResourceManager;
import phoenix.Vector;
import phoenix.Texture;

import lime.gl.GL;
import lime.gl.GLShader;
import lime.gl.GLProgram;

enum UniformValueType {
    int;
    float;
    vector2;
    vector3;
    vector4;
    color;
    texture;
    unknown;
}

typedef UniformValue = {
    var name : String;
    var value : Dynamic;
    var type : UniformValueType;
}

class Shader extends Resource {

    public var errors : String = '';
	public var log : String = '';

	public var vert_shader : Dynamic;
	public var frag_shader : Dynamic;
	public var program : GLProgram;
	public var shader : GLShader;

    public var uniforms : Map<String, Dynamic>;

	public function new( _manager : ResourceManager ) {
		
		super( _manager, ResourceType.shader );
        uniforms = new Map<String,Dynamic>();
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

   public function set_uniform_int( _name:String, _value:Int ) : Void {
        if(uniforms.exists(_name)) {
            var _uniformvalue : UniformValue = cast uniforms.get(_name);
                _uniformvalue.value = _value;
        } else {

            var _uniformvalue : UniformValue = {
                name : _name,
                value : _value,
                type : UniformValueType.int
            }

            uniforms.set(_name, _uniformvalue);
        }
    } //set_uniform_int
   public function set_uniform_float( _name:String, _value:Float ) : Void {
        if(uniforms.exists(_name)) {
            var _uniformvalue : UniformValue = cast uniforms.get(_name);
                _uniformvalue.value = _value;
        } else {

            var _uniformvalue : UniformValue = {
                name : _name,
                value : _value,
                type : UniformValueType.float
            }

            uniforms.set(_name, _uniformvalue);
        }
    } //set_uniform_float

    public function set_uniform_vector2( _name:String, _value:Vector ) : Void {
        if(uniforms.exists(_name)) {
            var _uniformvalue : UniformValue = cast uniforms.get(_name);
                _uniformvalue.value = _value;
        } else {
            var _uniformvalue : UniformValue = { name : _name, value : _value, type : UniformValueType.vector2 }
            uniforms.set(_name, _uniformvalue);
        }
    } //set_uniform_vector2

    public function set_uniform_vector3( _name:String, _value:Vector ) : Void {
        if(uniforms.exists(_name)) {
            var _uniformvalue : UniformValue = cast uniforms.get(_name);
                _uniformvalue.value = _value;
        } else {
            var _uniformvalue : UniformValue = { name : _name, value : _value, type : UniformValueType.vector3 }
            uniforms.set(_name, _uniformvalue);
        }
    } //set_uniform_vector3

    public function set_uniform_vector4( _name:String, _value:Vector ) : Void {
        if(uniforms.exists(_name)) {
            var _uniformvalue : UniformValue = cast uniforms.get(_name);
                _uniformvalue.value = _value;
        } else {
            var _uniformvalue : UniformValue = { name : _name, value : _value, type : UniformValueType.vector4 }
            uniforms.set(_name, _uniformvalue);
        }
    } //set_uniform_vector4

    public function set_uniform_color( _name:String, _value:Color ) : Void {
        if(uniforms.exists(_name)) {
            var _uniformvalue : UniformValue = cast uniforms.get(_name);
                _uniformvalue.value = _value;
        } else {
            var _uniformvalue : UniformValue = { name : _name, value : _value, type : UniformValueType.color }
            uniforms.set(_name, _uniformvalue);
        }
    } //set_uniform_color

    public function set_uniform_texture( _name:String, _value:Texture ) : Void {
        if(uniforms.exists(_name)) {
            var _uniformvalue : UniformValue = cast uniforms.get(_name);
                _uniformvalue.value = _value;
        } else {
            var _uniformvalue : UniformValue = { name : _name, value : _value, type : UniformValueType.texture }
            uniforms.set(_name, _uniformvalue);
        }
    } //set_uniform_texture


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

    public override function drop() {
        super.drop();
        destroy();
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

    @:noCompletion public function apply_uniforms() {
        for(_uniform in uniforms) {
            var uniform : UniformValue = cast _uniform;
            switch(uniform.type) {
                case UniformValueType.int:
                    setUniformInt(uniform.name, cast uniform.value);
                case UniformValueType.float:
                    setUniformFloat(uniform.name, cast uniform.value);
                case UniformValueType.vector2:
                    setUniformVector2(uniform.name, cast uniform.value);
                case UniformValueType.vector3:
                    setUniformVector3(uniform.name, cast uniform.value);
                case UniformValueType.vector4:
                    setUniformVector4(uniform.name, cast uniform.value);
                case UniformValueType.color:
                    setUniformColor(uniform.name, cast uniform.value);
                case UniformValueType.texture:
                    setUniformTexture(uniform.name, cast uniform.value);
                case UniformValueType.unknown:
            }
        } //for each uniform
    }

	@:noCompletion public function getUniform( uniform_name : String  ) : lime.gl.GLUniformLocation {
		return GL.getUniformLocation( program, uniform_name );
	}

    @:noCompletion public function setUniformInt( uniform_name:String, value:Int ) {
    	GL.uniform1i( getUniform(uniform_name) , value );
    }
    @:noCompletion public function setUniformFloat( uniform_name:String, value:Float ) {
		GL.uniform1f( getUniform(uniform_name) , value );
    }
    @:noCompletion public function setUniformVector2( uniform_name:String, value:Vector ) {
        GL.uniform2f( getUniform(uniform_name) , value.x, value.y);
    }
    @:noCompletion public function setUniformVector3( uniform_name:String, value:Vector ) {
        GL.uniform3f( getUniform(uniform_name) , value.x, value.y, value.z );
    }
    @:noCompletion public function setUniformVector4( uniform_name:String, value:Vector ) {
        GL.uniform4f( getUniform(uniform_name) , value.x, value.y, value.z, value.w );
    }
    @:noCompletion public function setUniformColor( uniform_name:String, value:Color ) {
		GL.uniform4f( getUniform(uniform_name) , value.r, value.g, value.b, value.a );
    }
    @:noCompletion public function setUniformTexture( uniform_name:String, value:Texture ) {
    	GL.uniform1i( getUniform(uniform_name) , value.slot );
    }

    public function addLog( _log:String ) {
        log += _log;
    }

    public function addError( _error:String ) {
    	errors += _error;
    }

}	
