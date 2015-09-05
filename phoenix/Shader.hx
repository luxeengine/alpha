package phoenix;

import luxe.options.ResourceOptions;
import luxe.resource.Resource;
import luxe.Resources;

import luxe.Log.*;

import phoenix.Vector;
import phoenix.Texture;
import phoenix.Matrix;
import phoenix.Batcher;

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

    public var proj_attribute : Location;
    public var view_attribute : Location;
    public var tex0_attribute : Location;
    public var tex1_attribute : Location;
    public var tex2_attribute : Location;
    public var tex3_attribute : Location;
    public var tex4_attribute : Location;
    public var tex5_attribute : Location;
    public var tex6_attribute : Location;
    public var tex7_attribute : Location;

    var uniform_int     : Map<String, Uniform<Int>>;
    var uniform_float   : Map<String, Uniform<Float>>;
    var uniform_vector2 : Map<String, Uniform<Vector>>;
    var uniform_vector3 : Map<String, Uniform<Vector>>;
    var uniform_vector4 : Map<String, Uniform<Vector>>;
    var uniform_matrix4 : Map<String, Uniform<Matrix>>;
    var uniform_color   : Map<String, Uniform<Color>>;
    var uniform_texture : Map<String, Uniform<Texture>>;

    public function new( _options:ShaderOptions ) {

        assertnull(_options);

        _options.resource_type = ResourceType.shader;

        super( _options );

        frag_id = _options.frag_id;
        vert_id = _options.vert_id;

        uniform_int = new Map();
        uniform_float = new Map();
        uniform_vector2 = new Map();
        uniform_vector3 = new Map();
        uniform_vector4 = new Map();
        uniform_matrix4 = new Map();
        uniform_color = new Map();
        uniform_texture = new Map();

    } //new

    public inline function activate() {

        if(program != null) {
            Luxe.renderer.state.useProgram( program );
        }

    } //activate

    public inline function deactivate() {

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

   public inline function set_int( _name:String, _value:Int ) : Void {

        if(uniform_int.exists(_name)) {
            uniform_int.get(_name).value = _value;
        } else {
            uniform_int.set(_name, new Uniform<Int>(_name, _value, location(_name)));
        }

    } //set_int

   public inline function set_float( _name:String, _value:Float ) : Void {

        if(uniform_float.exists(_name)) {
            uniform_float.get(_name).value = _value;
        } else {
            uniform_float.set(_name, new Uniform<Float>(_name, _value, location(_name)));
        }

    } //set_float

    public inline function set_vector2( _name:String, _value:Vector ) : Void {

        if(uniform_vector2.exists(_name)) {
            uniform_vector2.get(_name).value = _value;
        } else {
            uniform_vector2.set(_name, new Uniform<Vector>(_name, _value, location(_name)));
        }

    } //set_vector2

    public inline function set_vector3( _name:String, _value:Vector ) : Void {

        if(uniform_vector3.exists(_name)) {
            uniform_vector3.get(_name).value = _value;
        } else {
            uniform_vector3.set(_name, new Uniform<Vector>(_name, _value, location(_name)));
        }

    } //set_vector3

    public inline function set_vector4( _name:String, _value:Vector ) : Void {

        if(uniform_vector4.exists(_name)) {
            uniform_vector4.get(_name).value = _value;
        } else {
            uniform_vector4.set(_name, new Uniform<Vector>(_name, _value, location(_name)));
        }

    } //set_vector4

    public inline function set_matrix4( _name:String, _value:Matrix ) : Void {

        if(uniform_matrix4.exists(_name)) {
            uniform_matrix4.get(_name).value = _value;
        } else {
            uniform_matrix4.set(_name, new Uniform<Matrix>(_name, _value, location(_name)));
        }

    } //set_matrix4

    public inline function set_color( _name:String, _value:Color ) : Void {

        if(uniform_color.exists(_name)) {
            uniform_color.get(_name).value = _value;
        } else {
            uniform_color.set(_name, new Uniform<Color>(_name, _value, location(_name)));
        }

    } //set_color

    public inline function set_texture( _name:String, _value:Texture ) : Void {

        if(uniform_texture.exists(_name)) {
            uniform_texture.get(_name).value = _value;
        } else {
            uniform_texture.set(_name, new Uniform<Texture>(_name, _value, location(_name)));
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

            _log += '\n\t// start -- ($_type_name / $_type_id) compile log --\n';
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

    public function link() : Bool {

        program = GL.createProgram();

        GL.attachShader(program, vert_shader);
        GL.attachShader(program, frag_shader);

            //Now we want to ensure that our locations are static
        GL.bindAttribLocation( program, Batcher.vert_attribute,    'vertexPosition');
        GL.bindAttribLocation( program, Batcher.tcoord_attribute,  'vertexTCoord');
        GL.bindAttribLocation( program, Batcher.color_attribute,   'vertexColor');
        GL.bindAttribLocation( program, Batcher.normal_attribute,  'vertexNormal');

        GL.linkProgram(program);

        if( GL.getProgramParameter(program, GL.LINK_STATUS) == 0) {
            add_log("\tFailed to link shader program:");
            add_log( format_log(GL.getProgramInfoLog(program)) );
            GL.deleteProgram(program);
            program = null;
            return false;
        }

            //first bind it
        activate();

            //:todo: this is being refactored for the new
            //way more flexible shaders and rendering :}

                //Matrices
            proj_attribute = location("projectionMatrix");
            view_attribute = location("modelViewMatrix");

                //Textures
            tex0_attribute = location( "tex0" );
            tex1_attribute = location( "tex1" );
            tex2_attribute = location( "tex2" );
            tex3_attribute = location( "tex3" );
            tex4_attribute = location( "tex4" );
            tex5_attribute = location( "tex5" );
            tex6_attribute = location( "tex6" );
            tex7_attribute = location( "tex7" );

        return true;

    } //link

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

        inline function dump_log() {
            if(log.length > 0) {
                luxe.Log.log(log);
            }
        }

        clear();

        frag_source = _fragment_source;
        vert_source = _vert_source;

            //compile the sources
        vert_shader = compile( GL.VERTEX_SHADER, vert_source );
        frag_shader = compile( GL.FRAGMENT_SHADER, frag_source );

        if( vert_shader == null || frag_shader == null ) {
            dump_log();
            return false;
        }

            //Link shader
        if(!link()) {
            dump_log();
            return false;
        }

        return true;

    } //

    @:noCompletion public inline function apply_uniforms() {

        if(tex0_attribute != null) GL.uniform1i( tex0_attribute, 0 );
        if(tex1_attribute != null) GL.uniform1i( tex1_attribute, 1 );
        if(tex2_attribute != null) GL.uniform1i( tex2_attribute, 2 );
        if(tex3_attribute != null) GL.uniform1i( tex3_attribute, 3 );
        if(tex4_attribute != null) GL.uniform1i( tex4_attribute, 4 );
        if(tex5_attribute != null) GL.uniform1i( tex5_attribute, 5 );
        if(tex6_attribute != null) GL.uniform1i( tex6_attribute, 6 );
        if(tex7_attribute != null) GL.uniform1i( tex7_attribute, 7 );

        for(uniform in uniform_int)     { GL.uniform1i(uniform.location, uniform.value); }
        for(uniform in uniform_float)   { GL.uniform1f(uniform.location, uniform.value); }
        for(uniform in uniform_vector2) { GL.uniform2f(uniform.location, uniform.value.x, uniform.value.y); }
        for(uniform in uniform_vector3) { GL.uniform3f(uniform.location, uniform.value.x, uniform.value.y, uniform.value.z); }
        for(uniform in uniform_vector4) { GL.uniform4f(uniform.location, uniform.value.x, uniform.value.y, uniform.value.z, uniform.value.w); }
        for(uniform in uniform_matrix4) { GL.uniformMatrix4fv(uniform.location, false, uniform.value.float32array()); }
        for(uniform in uniform_color)   { GL.uniform4f(uniform.location, uniform.value.r, uniform.value.g, uniform.value.b, uniform.value.a); }
        for(uniform in uniform_texture) { GL.uniform1i(uniform.location, uniform.value.slot); uniform.value.bind(); }

    } //apply_uniforms

    inline function location( _name : String ) : Location {
        return GL.getUniformLocation( program, _name );
    }

    inline function add_log( _log:String ) {
        log += _log;
    }

    override function toString() {
        return 'Shader($id) vert:$vert_id / frag: $frag_id';
    }

} //Shader

@:allow(phoenix.Shader)
class Uniform<T> {

    var name : String;
    var value : T;
    var location : Location;

    inline function new(_name:String, _value:T, _location:Location) {
        name = _name;
        value = _value;
        location = _location;
    }

} //Uniform

private typedef Location = GLUniformLocation;


