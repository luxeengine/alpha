package phoenix;

import luxe.options.ResourceOptions;
import luxe.resource.Resource;
import luxe.Resources;

import luxe.Log.*;

import phoenix.Vector;
import phoenix.Texture;

import snow.api.Promise;
import snow.modules.opengl.GL;
import snow.types.Types.Error;
import snow.system.assets.Asset;


class Shader extends Resource {

    public var log : String = '';

    public var vert_source : String;
    public var frag_source : String;
    public var vert_id : String = '';
    public var frag_id : String = '';

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

    public function new( _options:ShaderOptions ) {

        assertnull(_options);

        _options.resource_type = ResourceType.shader;

        super( _options );

        frag_id = _options.frag_id;
        vert_id = _options.vert_id;

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
    public function clone( _id:String ) {

        var _clone = new Shader({
            id: _id,
            frag_id: frag_id,
            vert_id: vert_id
        });

        _clone.from_string( vert_source, frag_source );

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

    inline function format_log(_log:String) {
        var _items = _log.split('\n');
        _items = _items.filter(function(s) { return StringTools.trim(s) != ''; });
        _items = _items.map(function(s) { return '\t\t' + StringTools.trim(s); });
        return _items.join('\n');
    }

    public function compile( _type : Int, _source:String ) : GLShader {

        var _shader = GL.createShader( _type );

            GL.shaderSource( _shader,  _source);
            GL.compileShader(_shader);

        var _compile_log = GL.getShaderInfoLog(_shader);
        var _log = '';

        if(_compile_log.length > 0) {

            var _is_frag = (_type == GL.FRAGMENT_SHADER);
            var _type_name = (_is_frag) ? 'frag' : 'vert';
            var _type_id = (_is_frag) ? frag_id : vert_id;

            _log += '\n\t// start -- ($_type_name / $_type_id) compile log -- \n';
            _log +=  format_log(_compile_log);
            _log += '\n\t// end --\n';

        } //_log.length

        if(GL.getShaderParameter(_shader, GL.COMPILE_STATUS) == 0) {

            add_log('\tFailed to compile shader `$id`:\n');
            add_log( _log.length == 0 ? format_log(GL.getShaderInfoLog(_shader)) : _log );

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
            add_log("\tFailed to link shader program:");
            add_log( format_log(GL.getProgramInfoLog(program)) );
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

//Resource

    override function clear() {

        if( vert_shader != null ) GL.deleteShader( vert_shader );
        if( frag_shader != null ) GL.deleteShader( frag_shader );
        if( program != null )     GL.deleteProgram( program );

        vert_source = null;
        frag_source = null;

    } //clear

    override function reload() {

        assert(state != ResourceState.destroyed);

        clear();

        return new Promise(function(resolve, reject) {

            state = ResourceState.loading;

            switch(frag_id) {
                case 'default':  frag_source = Luxe.renderer.shaders.plain.source.frag;
                case 'textured': frag_source = Luxe.renderer.shaders.textured.source.frag;
            }

            switch(vert_id) {
                case 'default': vert_source = Luxe.renderer.shaders.plain.source.vert;
            }

            function _onfail(_err:Dynamic) {
                state = ResourceState.failed;
                reject(_err);
            }

                //one for the default shaders, already resolved
            var _wait = [ Promise.resolve() ];

            if(frag_source == null) {

                var _frag = Luxe.snow.assets.text(frag_id);

                _frag.then(function(_asset:AssetText) {
                    frag_source = _asset.text;
                });

                _wait.push(_frag);

            } //frag_source == null

            if(vert_source == null) {

                var _vert = Luxe.snow.assets.text(vert_id);

                _vert.then(function(_asset:AssetText) {
                    vert_source = _asset.text;
                });

                _wait.push(_vert);

            } //vert_source

            Promise.all(_wait).then(function(){

                #if luxe_no_shader_prefix
                        //:todo:hxsw: this must go
                    var prefixes = #if luxe_web "precision mediump float;\n" #else '' #end;
                    frag_source = prefixes + frag_source;
                #end //luxe_no_shader_prefix

                if(from_string(vert_source, frag_source)) {
                    state = ResourceState.loaded;
                    resolve(this);
                } else {
                    _onfail(Error.error('`$id` failed to create :\n\n$log'));
                }

            }).error(function(err) {
                _onfail(Error.error('`$id` failed to create :\n\t\t$err\n'));
            });

        }); //promise

    } //reload

        /** Loads shaders from a string, compiles, and links them */
    public function from_string( _vert_source:String, _fragment_source:String ) {

        clear();

        frag_source = _fragment_source;
        vert_source = _vert_source;

            //compile the sources
        vert_shader = compile( GL.VERTEX_SHADER, vert_source );
        frag_shader = compile( GL.FRAGMENT_SHADER, frag_source );

        if( vert_shader == null || frag_shader == null ) {
            return false;
        }

            //Link shader
        link();

        if(log.length > 0) {
            luxe.Log.log(log);
        }

        return program != null;

    } //

    @:noCompletion public function apply_uniforms() {

        if(tex0_attribute != null) GL.uniform1i( tex0_attribute, 0 );
        if(tex1_attribute != null) GL.uniform1i( tex1_attribute, 1 );
        if(tex2_attribute != null) GL.uniform1i( tex2_attribute, 2 );
        if(tex3_attribute != null) GL.uniform1i( tex3_attribute, 3 );
        if(tex4_attribute != null) GL.uniform1i( tex4_attribute, 4 );
        if(tex5_attribute != null) GL.uniform1i( tex5_attribute, 5 );
        if(tex6_attribute != null) GL.uniform1i( tex6_attribute, 6 );
        if(tex7_attribute != null) GL.uniform1i( tex7_attribute, 7 );

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

    override function toString() {
        return 'Shader($id) vert:$vert_id / frag: $frag_id';
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

private typedef Location = GLUniformLocation;


