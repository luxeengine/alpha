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
import snow.api.buffers.Float32Array;
import snow.modules.opengl.GL;
import snow.types.Types.Error;
import snow.systems.assets.Asset;


@:allow(phoenix.Shader)
@:allow(phoenix.geometry.Geometry)
class Uniforms {

    var ints        : Map<String, Uniform<Int>>;
    var floats      : Map<String, Uniform<Float>>;
    var vector2s    : Map<String, Uniform<Vector>>;
    var vector3s    : Map<String, Uniform<Vector>>;
    var vector4s    : Map<String, Uniform<Vector>>;
    var matrix4s    : Map<String, Uniform<Matrix>>;
    var matrix4arrs : Map<String, Uniform<Float32Array>>;
    var colors      : Map<String, Uniform<Color>>;
    var textures    : Map<String, Uniform<Texture>>;

    var dirty_ints          : Array<Uniform<Int>>;
    var dirty_floats        : Array<Uniform<Float>>;
    var dirty_vector2s      : Array<Uniform<Vector>>;
    var dirty_vector3s      : Array<Uniform<Vector>>;
    var dirty_vector4s      : Array<Uniform<Vector>>;
    var dirty_matrix4s      : Array<Uniform<Matrix>>;
    var dirty_matrix4arrs   : Array<Uniform<Float32Array>>;
    var dirty_colors        : Array<Uniform<Color>>;
    var dirty_textures      : Array<Uniform<Texture>>;

    public function new() {
        clear();
    } //new

    function destroy() {
        ints = null;
        floats = null;
        vector2s = null;
        vector3s = null;
        vector4s = null;
        matrix4s = null;
        colors = null;
        textures = null;
        dirty_ints = null;
        dirty_floats = null;
        dirty_vector2s = null;
        dirty_vector3s = null;
        dirty_vector4s = null;
        dirty_matrix4s = null;
        dirty_matrix4arrs = null;
        dirty_colors = null;
        dirty_textures = null;
    }

    function clear() {

        destroy();

        ints        = new Map();
        floats      = new Map();
        vector2s    = new Map();
        vector3s    = new Map();
        vector4s    = new Map();
        matrix4s    = new Map();
        matrix4arrs = new Map();
        colors      = new Map();
        textures    = new Map();

        dirty_ints          = [];
        dirty_floats        = [];
        dirty_vector2s      = [];
        dirty_vector3s      = [];
        dirty_vector4s      = [];
        dirty_matrix4s      = [];
        dirty_matrix4arrs   = [];
        dirty_colors        = [];
        dirty_textures      = [];

    } //clear

    public inline function set_int( _name:String, _value:Int, _location:Location ) : Void {

        var _int = ints.get(_name);

        if(_int != null) {
            _int.value = _value;
        } else {
            _int = new Uniform<Int>(_name, _value, _location);
            ints.set(_name, _int);
        }

        dirty_ints.push(_int);

    } //set_int

    public inline function set_float( _name:String, _value:Float, _location:Location ) : Void {

        var _float = floats.get(_name);
        
        if(_float != null) {
            _float.value = _value;
        } else {
            _float = new Uniform<Float>(_name, _value, _location);
            floats.set(_name, _float);
        }

        dirty_floats.push(_float);

    } //set_float

    public inline function set_vector2( _name:String, _value:Vector, _location:Location ) : Void {

        var _vector2 = vector2s.get(_name);
        
        if(_vector2 != null) {
            _vector2.value = _value;
        } else {
            _vector2 = new Uniform<Vector>(_name, _value, _location);
            vector2s.set(_name, _vector2);
        }

        dirty_vector2s.push(_vector2);

    } //set_vector2

    public inline function set_vector3( _name:String, _value:Vector, _location:Location ) : Void {

        var _vector3 = vector3s.get(_name);
        
        if(_vector3 != null) {
            _vector3.value = _value;
        } else {
            _vector3 = new Uniform<Vector>(_name, _value, _location);
            vector3s.set(_name, _vector3);
        }

        dirty_vector3s.push(_vector3);

    } //set_vector3

    public inline function set_vector4( _name:String, _value:Vector, _location:Location ) : Void {

        var _vector4 = vector4s.get(_name);
        
        if(_vector4 != null) {
            _vector4.value = _value;
        } else {
            _vector4 = new Uniform<Vector>(_name, _value, _location);
            vector4s.set(_name, _vector4);
        }

        dirty_vector4s.push(_vector4);

    } //set_vector4

    public inline function set_matrix4( _name:String, _value:Matrix, _location:Location ) : Void {

        var _matrix4 = matrix4s.get(_name);
        
        if(_matrix4 != null) {
            _matrix4.value = _value;
        } else {
            _matrix4 = new Uniform<Matrix>(_name, _value, _location);
            matrix4s.set(_name, _matrix4);
        }

        dirty_matrix4s.push(_matrix4);

    } //set_matrix4

    public inline function set_matrix4_arr( _name:String, _value:Float32Array, _location:Location ) : Void {

        var _matrix4 = matrix4arrs.get(_name);
        
        if(_matrix4 != null) {
            _matrix4.value = _value;
        } else {
            _matrix4 = new Uniform<Float32Array>(_name, _value, _location);
            matrix4arrs.set(_name, _matrix4);
        }

        dirty_matrix4arrs.push(_matrix4);

    } //set_matrix4_arr

    public inline function set_color( _name:String, _value:Color, _location:Location ) : Void {

        var _color = colors.get(_name);
        
        if(_color != null) {
            _color.value = _value;
        } else {
            _color = new Uniform<Color>(_name, _value, _location);
            colors.set(_name, _color);
        }

        dirty_colors.push(_color);

    } //set_color

    public inline function set_texture( _name:String, _value:Texture, _location:Location ) : Void {

        var _texture = textures.get(_name);
        
        if(_texture != null) {
            _texture.value = _value;
        } else {
            _texture = new Uniform<Texture>(_name, _value, _location);
            textures.set(_name, _texture);
        }

        dirty_textures.push(_texture);

    } //set_texture

    //inline
    public function apply() {

        while(dirty_ints.length > 0) { 
            var uf = dirty_ints.pop();
            GL.uniform1i(uf.location, uf.value); 
        }

        while(dirty_floats.length > 0) { 
            var uf = dirty_floats.pop();
            GL.uniform1f(uf.location, uf.value); 
        }

        while(dirty_vector2s.length > 0) { 
            var uf = dirty_vector2s.pop();
            GL.uniform2f(uf.location, uf.value.x, uf.value.y); 
        }

        while(dirty_vector3s.length > 0) { 
            var uf = dirty_vector3s.pop();
            GL.uniform3f(uf.location, uf.value.x, uf.value.y, uf.value.z); 
        }

        while(dirty_vector4s.length > 0) { 
            var uf = dirty_vector4s.pop();
            GL.uniform4f(uf.location, uf.value.x, uf.value.y, uf.value.z, uf.value.w); 
        }

        while(dirty_colors.length > 0) { 
            var uf = dirty_colors.pop();
            GL.uniform4f(uf.location, uf.value.r, uf.value.g, uf.value.b, uf.value.a); 
        }

        while(dirty_textures.length > 0) { 
            var uf = dirty_textures.pop();
            GL.uniform1i(uf.location, uf.value.slot); uf.value.bind(); 
        }

        while(dirty_matrix4s.length > 0) { 
            var uf = dirty_matrix4s.pop();
            GL.uniformMatrix4fv(uf.location, false, uf.value.float32array()); 
        }

        while(dirty_matrix4arrs.length > 0) { 
            var uf = dirty_matrix4arrs.pop();
            GL.uniformMatrix4fv(uf.location, false, uf.value); 
        }

    } //apply

} //Uniforms

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

    public var no_default_uniforms : Bool = false;
    public var proj_attribute : Location;
    public var view_attribute : Location;

    public var uniforms:Uniforms;

    public function new( _options:ShaderOptions ) {

        assertnull(_options);

        _options.resource_type = ResourceType.shader;

        super( _options );

        frag_id = _options.frag_id;
        vert_id = _options.vert_id;
        no_default_uniforms = def(_options.no_default_uniforms, false);

        uniforms = new Uniforms();

    } //new

    public inline function activate() {

        use();

        uniforms.apply();

            //I dont remember what this was doing here exactly
        Luxe.renderer.state.activeTexture(GL.TEXTURE0);

    } //activate

    public function use() {
    
        if(program != null) {
            Luxe.renderer.state.useProgram( program );
        }

    } //use

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
        uniforms.set_int(_name, _value, location(_name));
    } //set_int

    public inline function set_float( _name:String, _value:Float ) : Void {
        uniforms.set_float(_name, _value, location(_name));
    } //set_float

    public inline function set_vector2( _name:String, _value:Vector ) : Void {
        uniforms.set_vector2(_name, _value, location(_name));
    } //set_vector2

    public inline function set_vector3( _name:String, _value:Vector ) : Void {
        uniforms.set_vector3(_name, _value, location(_name));
    } //set_vector3

    public inline function set_vector4( _name:String, _value:Vector ) : Void {
        uniforms.set_vector4(_name, _value, location(_name));
    } //set_vector4

    public inline function set_matrix4( _name:String, _value:Matrix ) : Void {
        uniforms.set_matrix4(_name, _value, location(_name));
    } //set_matrix4

    public inline function set_matrix4_arr( _name:String, _value:Float32Array ) : Void {
        uniforms.set_matrix4_arr(_name, _value, location(_name));
    } //set_matrix4_arr

    public inline function set_color( _name:String, _value:Color ) : Void {
        uniforms.set_color(_name, _value, location(_name));
    } //set_color

    public inline function set_texture( _name:String, _value:Texture ) : Void {
        uniforms.set_texture(_name, _value, location(_name));
    } //set_texture


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
        use();

            //:todo: this is being refactored for the new
            //way more flexible shaders and rendering :}

                //Matrices
            if(!no_default_uniforms) {

                proj_attribute = location('projectionMatrix');
                view_attribute = location('modelViewMatrix');

                var _tex0_attribute = location( 'tex0' );
                var _tex1_attribute = location( 'tex1' );
                var _tex2_attribute = location( 'tex2' );
                var _tex3_attribute = location( 'tex3' );
                var _tex4_attribute = location( 'tex4' );
                var _tex5_attribute = location( 'tex5' );
                var _tex6_attribute = location( 'tex6' );
                var _tex7_attribute = location( 'tex7' );

                if(_tex0_attribute != null) GL.uniform1i( _tex0_attribute, 0 );
                if(_tex1_attribute != null) GL.uniform1i( _tex1_attribute, 1 );
                if(_tex2_attribute != null) GL.uniform1i( _tex2_attribute, 2 );
                if(_tex3_attribute != null) GL.uniform1i( _tex3_attribute, 3 );
                if(_tex4_attribute != null) GL.uniform1i( _tex4_attribute, 4 );
                if(_tex5_attribute != null) GL.uniform1i( _tex5_attribute, 5 );
                if(_tex6_attribute != null) GL.uniform1i( _tex6_attribute, 6 );
                if(_tex7_attribute != null) GL.uniform1i( _tex7_attribute, 7 );

            }

        return true;

    } //link

    public inline function location( _name : String ) : Location {
        return GL.getUniformLocation( program, _name );
    }

//Resource

    override function clear() {

        if( vert_shader != null ) GL.deleteShader( vert_shader );
        if( frag_shader != null ) GL.deleteShader( frag_shader );
        if( program != null )     GL.deleteProgram( program );

        vert_source = null;
        frag_source = null;

        uniforms.clear();

    } //clear

    override public function reload() {

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

    inline function add_log( _log:String ) {
        log += _log;
    }

    override function toString() {
        return 'Shader($id) vert:$vert_id / frag: $frag_id';
    }

//Internal

    inline function format_log(_log:String) {
        var _items = _log.split('\n');
        _items = _items.filter(function(s) { return StringTools.trim(s) != ''; });
        _items = _items.map(function(s) { return '\t\t' + StringTools.trim(s); });
        return _items.join('\n');
    }

} //Shader

@:generic
private class Uniform<T> {

    public var name : String;
    public var value : T;
    public var location : Location;

    inline public function new(_name:String, _value:T, _location:Location) {
        name = _name;
        value = _value;
        location = _location;
    }

} //Uniform

private typedef Location = GLUniformLocation;


