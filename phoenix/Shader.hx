package phoenix;


import luxe.resource.Resource;
import luxe.resource.Resources;

import luxe.Log.log;
import luxe.Log._debug;
import luxe.Log._verbose;

import phoenix.Vector;
import phoenix.Texture;

import snow.render.opengl.GL;

private typedef Location = GLUniformLocation;

class Shader extends Resource {

    public var errors : String = '';
    public var log : String = '';

    public var vertex_source : String = '';
    public var frag_source : String = '';
    public var vertex_source_name : String = '';
    public var frag_source_name : String = '';

    public var vert_shader : GLShader;
    public var frag_shader : GLShader;
    public var program : GLProgram;
    public var shader : GLShader;

    public var vert_attribute   : Int = 0;
    public var tcoord_attribute : Int = 1;
    public var color_attribute  : Int = 2;
    public var normal_attribute : Int = 3;

    public var projectionmatrix_attribute : Location;
    public var modelviewmatrix_attribute : Location;
    public var tex0_attribute : Location;
    public var tex1_attribute : Location;
    public var tex2_attribute : Location;
    public var tex3_attribute : Location;
    public var tex4_attribute : Location;
    public var tex5_attribute : Location;
    public var tex6_attribute : Location;
    public var tex7_attribute : Location;

    public var uniforms : Map<String, Uniform<Dynamic> >;

    var uniform_textures : Map<String,Texture>;

    public function new( _manager : Resources ) {

        super( _manager, ResourceType.shader );
        uniforms = new Map<String, Uniform<Dynamic> >();
        uniform_textures = new Map();

    } //new

    public function activate() {
        if(program != null) {
            Luxe.renderer.state.useProgram( program );
        }
    } //activate

    public function deactivate() {
        Luxe.renderer.state.useProgram( null );
    } //deactivate

        /** Create a new shader based on the source of this shader. */
    public function clone() {

        var _clone = new Shader( manager );

            _clone.id = id + '.clone.' + Luxe.utils.uniqueid();
            _clone.from_string( vertex_source, frag_source, vertex_source_name, frag_source_name, false );

        return _clone;

    } //clone

   public function set_int( _name:String, _value:Int ) : Void {
        if(uniforms.exists(_name)) {
            var _uniform : Uniform<Int> = uniforms.get(_name);
                _uniform.value = _value;
        } else {

            var _uniform = {
                name : _name,
                value : _value,
                type : UniformType.int,
                location : location( _name )
            }

            uniforms.set(_name, _uniform);
        }
    } //set_int
   public function set_float( _name:String, _value:Float ) : Void {
        if(uniforms.exists(_name)) {
            var _uniform : Uniform<Float> = uniforms.get(_name);
                _uniform.value = _value;
        } else {

            var _uniform = {
                name : _name,
                value : _value,
                type : UniformType.float,
                location : location( _name )
            }

            uniforms.set(_name, _uniform);
        }
    } //set_float

    public function set_vector2( _name:String, _value:Vector ) : Void {

        if(uniforms.exists(_name)) {

            var _uniform : Uniform<Vector> = uniforms.get(_name);
                _uniform.value = _value;

        } else {

            var _uniform = {
                name : _name,
                value : _value,
                type : UniformType.vector2,
                location : location( _name )
            }

            uniforms.set(_name, _uniform);
        }
    } //set_vector2

    public function set_vector3( _name:String, _value:Vector ) : Void {

        if(uniforms.exists(_name)) {

            var _uniform : Uniform<Vector> = uniforms.get(_name);
                _uniform.value = _value;

        } else {

            var _uniform = {
                name : _name,
                value : _value,
                type : UniformType.vector3,
                location : location( _name )
            }

            uniforms.set(_name, _uniform);

        }

    } //set_vector3

    public function set_vector4( _name:String, _value:Vector ) : Void {

        if(uniforms.exists(_name)) {

            var _uniform : Uniform<Vector> = uniforms.get(_name);
                _uniform.value = _value;

        } else {

            var _uniform = {
                name : _name,
                value : _value,
                type : UniformType.vector4,
                location : location( _name )
            }

            uniforms.set(_name, _uniform);

        } //if exists

    } //set_vector4

    public function set_color( _name:String, _value:Color ) : Void {

        if(uniforms.exists(_name)) {

            var _uniform : Uniform<Color> = uniforms.get(_name);
                _uniform.value = _value;

        } else {

            var _uniform = {
                name : _name,
                value : _value,
                type : UniformType.color,
                location : location( _name )
            }

            uniforms.set(_name, _uniform);

        }

    } //set_color

    public function set_texture( _name:String, _value:Texture ) : Void {
        if(uniforms.exists(_name)) {

            var _uniform : Uniform<Texture> = uniforms.get(_name);
                _uniform.value = _value;
                uniform_textures.set(_name, _value);

        } else {

            var _uniform : Uniform<Texture> = {
                name : _name, value : _value,
                type : UniformType.texture,
                location : location( _name )
            }

            uniforms.set(_name, _uniform);
            uniform_textures.set(_name, _value);
        }
    } //set_texture


    public function compile( _type : Int, _source:String, _verbose:Bool = false ) : GLShader {

        var _shader = GL.createShader( _type );

            GL.shaderSource( _shader,  _source);
            GL.compileShader(_shader);

        var shader_log = '';

        if(_verbose) {
            shader_log = GL.getShaderInfoLog(_shader);

            if(shader_log.length > 0) {

                add_log("\n\t :: start -- (" + ((_type == GL.FRAGMENT_SHADER) ? "fragment" : "vertex" ) + ") Shader compile log -- " + id + '\n');

                add_log("\t\t" + shader_log + '\n');

                add_log("\t :: end -- (" + ((_type == GL.FRAGMENT_SHADER) ? "fragment" : "vertex" ) + ") Shader compile log -- " + id);

            } //shader_log.length

        } //_verbose

        if (GL.getShaderParameter(_shader, GL.COMPILE_STATUS) == 0) {

            var _info = ((_type == GL.FRAGMENT_SHADER) ? "fragment" : "vertex" );
                _info += ((_type == GL.FRAGMENT_SHADER) ? '($frag_source_name)' : '($vertex_source_name)' );

            add_error("\tFailed to compile shader (" + _info + ") : \n");

                //only fetch if we haven't already above
            if(!_verbose) {
                shader_log = GL.getShaderInfoLog(_shader);
            }

            add_error( "\t\t"+ shader_log );

            GL.deleteShader(_shader);
            _shader = null;

            return null;

        } //compile_status

        return _shader;
    }

    public function link() {

        program = GL.createProgram();

        GL.attachShader(program, vert_shader);
        GL.attachShader(program, frag_shader);

            //Now we want to ensure that our locations are static
        GL.bindAttribLocation( program, vert_attribute,    'vertexPosition');
        GL.bindAttribLocation( program, tcoord_attribute,  'vertexTCoord');
        GL.bindAttribLocation( program, color_attribute,   'vertexColor');
        GL.bindAttribLocation( program, normal_attribute,  'vertexNormal');

        GL.linkProgram(program);

        if( GL.getProgramParameter(program, GL.LINK_STATUS) == 0) {
            add_error("\tFailed to link shader program:");
            add_error( "\t\t"+ GL.getProgramInfoLog(program) );
            GL.deleteProgram(program);
            program = null;
            return;
        }

            //first bind it
        activate();

            //:todo: this is being refactored for the new
            //way more flexible shaders and rendering :}

                //Matrices
            projectionmatrix_attribute = location("projectionMatrix");
            modelviewmatrix_attribute = location("modelViewMatrix");

                //Textures
            tex0_attribute = location( "tex0" );
            tex1_attribute = location( "tex1" );
            tex2_attribute = location( "tex2" );
            tex3_attribute = location( "tex3" );
            tex4_attribute = location( "tex4" );
            tex5_attribute = location( "tex5" );
            tex6_attribute = location( "tex6" );
            tex7_attribute = location( "tex7" );

    }

    public override function drop() {
        super.drop();
        destroy();
    }

    public function destroy() {
        if( vert_shader != null ) GL.deleteShader( vert_shader );
        if( frag_shader != null ) GL.deleteShader( frag_shader );
        if( program != null )     GL.deleteProgram( program );
    }

    public static function load( _psid:String, ?_vsid:String, ?_onloaded:Shader->Void, ?_silent:Bool=false ) : Shader {

        var _frag_shader = '';
        var _vert_shader = '';

        if(_vsid == 'default' || _vsid == '') {
            _vert_shader = Luxe.renderer.shaders.plain.source.vert;
        } else {
            _vert_shader = Luxe.loadText(_vsid).text;
        }

        if(_psid == 'default' || _psid == '') {
            _frag_shader = Luxe.renderer.shaders.plain.source.frag;
        } else if(_psid == 'textured') {
            _frag_shader = Luxe.renderer.shaders.textured.source.frag;
        } else {
            _frag_shader = Luxe.loadText(_psid).text;
        }

        var _shader : Shader = null;

        if( _frag_shader != null && _frag_shader.length > 0 &&
            _vert_shader != null && _vert_shader.length > 0 ) {

            var prefixes = '';
            #if luxe_web
                prefixes += "precision mediump float;\n";
            #end //luxe_web

                //:todo: which resource manager...
            _shader = new Shader( Luxe.resources );
            _shader.from_string( _vert_shader , prefixes + _frag_shader, _vsid, _psid, false );

        } //

        if(_shader != null) {

            _shader.id = _psid + '|' + _vsid;

            if(_onloaded != null) {
                _onloaded( _shader );
            }

            if(!_silent) log("shader loaded " + _shader.id );

            return _shader;

        } else {
            return null;
        }

    } //load_shader

        /** Loads shaders from a string, compiles, and links them */
    public function from_string( _vertex_source:String, _fragment_source:String, _vertex_name:String='', _frag_name:String='', _verbose:Bool = false ) {

            //First clean up
        destroy();

            //store the names
        frag_source = _fragment_source;
        vertex_source = _vertex_source;
        frag_source_name = _frag_name;
        vertex_source_name = _vertex_name;

            //compile the sources
        vert_shader = compile( GL.VERTEX_SHADER, vertex_source, _verbose );
        frag_shader = compile( GL.FRAGMENT_SHADER, frag_source, _verbose );

        inline function fail() {
            luxe.Log.log("failed to create shader : " + id + "\n\n" + log + '\n' + errors);
            throw ":( shader errors ";
        }

            //Any errors? fail
        if( vert_shader == null || frag_shader == null ) {
            fail();
        }

            //Link shader
        link();

            //Check compile status and throw errors if there are any
        if(program == null) {
            fail();
        } else {
            if(_verbose && log.length > 0) {
                luxe.Log.log(log);
            }
        }

            //if it fails return false
        if( program == null ) return false;

        return true;
    }

    function toString() {
        return 'Shader($id) vert:$vertex_source_name / frag: $frag_source_name';
    }

    @:noCompletion public function apply_uniforms() {

        GL.uniform1i( tex0_attribute, 0 );
        GL.uniform1i( tex1_attribute, 1 );
        GL.uniform1i( tex2_attribute, 2 );
        GL.uniform1i( tex3_attribute, 3 );
        GL.uniform1i( tex4_attribute, 4 );
        GL.uniform1i( tex5_attribute, 5 );
        GL.uniform1i( tex6_attribute, 6 );
        GL.uniform1i( tex7_attribute, 7 );

        for(uniform in uniforms) {

            switch(uniform.type) {
                case int:       apply_int( uniform.location, uniform.value );
                case float:     apply_float( uniform.location, uniform.value );
                case vector2:   apply_vec2( uniform.location, uniform.value );
                case vector3:   apply_vec3( uniform.location, uniform.value );
                case vector4:   apply_vec4( uniform.location, uniform.value );
                case color:     apply_color( uniform.location, uniform.value );
                case texture:   apply_texture( uniform.location, uniform.value );
                case unknown:
            } //switch type

        } //for each uniform
    }

    inline function location( _name : String ) : Location {
        return GL.getUniformLocation( program, _name );
    }

    inline function apply_int( _location:Location, _int:Int ) {
        GL.uniform1i( _location, _int );
    }

    inline function apply_float( _location:Location, _float:Float ) {
        GL.uniform1f( _location, _float );
    }

    inline function apply_vec2( _location:Location, _vec:Vector ) {
        GL.uniform2f( _location, _vec.x, _vec.y);
    }

    inline function apply_vec3( _location:Location, _vec:Vector ) {
        GL.uniform3f( _location, _vec.x, _vec.y, _vec.z );
    }

    inline function apply_vec4( _location:Location, _vec:Vector ) {
        GL.uniform4f( _location, _vec.x, _vec.y, _vec.z, _vec.w );
    }

    inline function apply_color( _location:Location, _color:Color ) {
        GL.uniform4f( _location, _color.r, _color.g, _color.b, _color.a );
    }

    inline function apply_texture( _location:Location, _tex:Texture ) {
        GL.uniform1i( _location, _tex.slot );
        _tex.bind();
    }

    inline function add_log( _log:String ) {
        log += _log;
    }

    inline function add_error( _error:String ) {
        errors += _error;
    }

} //Shader


@:enum abstract UniformType(Int) from Int to Int {
    var unknown = 0;
    var int = 1;
    var float = 2;
    var vector2 = 3;
    var vector3 = 4;
    var vector4 = 5;
    var color = 6;
    var texture = 7;
}

typedef Uniform<T> = {

    var name : String;
    var value : T;
    var type : UniformType;
    var location : Location;

} //Uniform



