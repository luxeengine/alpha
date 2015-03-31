package phoenix;

import snow.modules.opengl.GL;
import snow.utils.Libs;

import luxe.Log.log;
import luxe.Log._debug;
import luxe.Log._verbose;

import luxe.Core;
import luxe.Rectangle;

import phoenix.Batcher;
import phoenix.RenderPath;
import phoenix.geometry.Geometry;

import phoenix.RenderTexture;
import phoenix.Shader;
import phoenix.Color;
import phoenix.Camera;
import phoenix.Texture;
import phoenix.BitmapFont;

typedef BatcherKey = {
    uuid : String,
    layer : Int
}

private typedef DefaultShader = {
    source: { vert:String, frag:String },
    shader : Shader
}

private typedef DefaultShaders = {
    plain : DefaultShader,
    textured : DefaultShader,
    bitmapfont : DefaultShader
}

class Renderer {

    public var batchers : Array<Batcher>;

    public var core : Core;
    public var state : RenderState;
    public var default_fbo : GLFramebuffer;
    public var default_rbo : GLRenderbuffer;
        //Default rendering
    public var shaders : DefaultShaders;
        //Default view and batching renderer
    public var batcher : Batcher;
    public var camera : Camera;
        //Default font for debug stuff etc
    public var font : BitmapFont;
        //Default render path is a forward renderer, and acts as a fallback for deferred
        //render path is the active render path, can replace it to render in a different manner
        //It will pass all batchers to be processed etc for you to do whatever with
    public var render_path : RenderPath;
    public var default_render_path : RenderPath;

    @:isVar public var vsync (get,set) : Bool;
    @:isVar public var target (get,set) : RenderTexture;
    public var target_size : Vector;

    public var should_clear : Bool = true;
    public var stop : Bool = false;
    public var stop_count : Int = 0;
    public var clear_color : Color;

    public var stats : RendererStats;

    public function new( _core:luxe.Core ) {

        core = _core;

            //store the default FBO as on some platforms
            //it is not the same as 0

        default_fbo = GL.getParameter(GL.FRAMEBUFFER_BINDING);
        default_rbo = GL.getParameter(GL.RENDERBUFFER_BINDING);

        _debug("default Framebuffer set to " + default_fbo);
        _debug("default Renderbuffer set to " + default_rbo);

    } //new

    public function init() {

        state = new RenderState(this);
        clear_color = new Color().rgb(0x1a1a1a);
        stats = new RendererStats();
        batchers = [];

            //The default view
        target_size = new Vector(Luxe.screen.w, Luxe.screen.h);
        camera = new Camera();
            //Create the default render path
        default_render_path = new RenderPath( this );
            //Apply it
        render_path = default_render_path;

            //init shaders
        create_default_shaders();

            //create the default batcher
        batcher = new Batcher( this, 'default batcher' );
        batcher.layer = 1;
        add_batch(batcher);

        #if !no_default_font

            create_default_font();

        #end //no_default_font

        if(Luxe.core.app.config.render.depth) {
                // Enable z buffer use
            state.enable(GL.DEPTH_TEST);
                // Accept fragment if it closer or equal away from the other
            state.depth_function(GL.LEQUAL);
                //Clear the depth buffer
            GL.clearDepth(1.0);
        }

            //Enable blending
        GL.enable(GL.BLEND);
        GL.blendFunc(GL.SRC_ALPHA, GL.ONE_MINUS_SRC_ALPHA);

            //Make sure that we aren't premultiplying the backbuffer
        #if luxe_web
            GL.pixelStorei(GL.UNPACK_PREMULTIPLY_ALPHA_WEBGL, 0);
        #end //luxe_web

    } //init

    public function destroy() {

        clear( new luxe.Color().rgb(0xff440b) );

    } //destroy

    @:allow(phoenix.Batcher)
    function sort_batchers( a:Batcher, b:Batcher ) {
        if(a.layer < b.layer) return -1;
        if(a.layer > b.layer) return 1;
        if(a.sequence < b.sequence) return -1;
        if(a.sequence > b.sequence) return 1;
        return 1;
    } //sort_batchers

    public function add_batch( batch:Batcher ) {

        batchers.push( batch );
        batchers.sort( sort_batchers );

    } //add_batch

    public function remove_batch( batch:Batcher ) {

        batchers.remove( batch );

    } //remove_batch

        /** Create a batcher, convenience for create batcher, add batcher (option), and create a camera for the batcher. */
    public function create_batcher( ? options:luxe.options.BatcherOptions ) : Batcher {

        var _new_batcher_layer = 2;

        if(options != null) {

            if(options.name == null) {
                options.name = 'batcher';
            }
            if(options.layer == null) {
                options.layer = _new_batcher_layer;
            }
            if(options.camera == null) {
                options.camera = new phoenix.Camera();
            }

        } else {
            options = {
                name : 'batcher',
                camera : new phoenix.Camera(),
                layer : _new_batcher_layer
            }
        }

        var _batcher = new Batcher( this, options.name );
            _batcher.view = options.camera;
            _batcher.layer = options.layer;

        if( options.no_add == null || options.no_add == false ) {
            add_batch( _batcher );
        }

        return _batcher;

    } //create_batcher


    public function clear( _color:Color ) {

        if(_color == null) {
            _color = clear_color;
        }

        GL.clearColor( _color.r, _color.g, _color.b, _color.a );

        if( Luxe.core.app.config.render.depth ) {
            GL.clear( GL.COLOR_BUFFER_BIT | GL.DEPTH_BUFFER_BIT );
            GL.clearDepth(1.0);
        } else {
            GL.clear( GL.COLOR_BUFFER_BIT );
        }

    } //clear

    public function blend_mode(?_src_mode:BlendMode = BlendMode.src_alpha, _dst_mode:BlendMode = BlendMode.one_minus_src_alpha) {

        GL.blendFunc(_src_mode, _dst_mode);

    } //set blendmode

    public function blend_equation(?_equation:BlendEquation = BlendEquation.add) {

        GL.blendEquation(_equation);

    } //set blend equation

        //The resize handler
    @:allow(luxe.Core)
    function internal_resized(_w:Int, _h:Int) {

        if(target == null) {
            target_size.set_xy(_w, _h);
        }

    } //internal_resized

        //The main render function
    @:allow(luxe.Core)
    function process() {

        if(stop) { return; }

        if(should_clear) {
            clear( clear_color );
        }

        stats.batchers = batchers.length;
        stats.reset();

            //render
        render_path.render( batchers, stats );

        // stop_count++;
        // if(stop_count >= 3) {
        //     stop = true;
        // }

    } //process

    public function onresize(e:Dynamic) {

    } //onresize

    function set_vsync( _vsync:Bool ) : Bool {

        Luxe.core.app.windowing.enable_vsync( _vsync );

        return vsync = _vsync;

    } //set_vsync

    function get_vsync() : Bool {

        return vsync;

    } //get_vsync

function get_target() : RenderTexture {

        return target;

    } //get_target

    function set_target( _target:RenderTexture ) {

        if(_target != null) {

            target_size.x = _target.width;
            target_size.y = _target.height;

            state.bindFramebuffer( _target.fbo );

        } else {

            target_size.x = Luxe.screen.w;
            target_size.y = Luxe.screen.h;

            state.bindFramebuffer();

        }

        return target = _target;

    } //set_target

    function create_default_shaders() {

        _debug('creating default shaders...');

        var vert = haxe.Resource.getString('default.vert.glsl');
        var frag = haxe.Resource.getString('default.frag.glsl');
        var frag_textured = haxe.Resource.getString('default.frag.textured.glsl');
        var frag_bitmapfont = haxe.Resource.getString('default.frag.bitmapfont.glsl');

        #if luxe_web
            var ext = snow.modules.opengl.GL.current_context.getExtension('OES_standard_derivatives');
        #end

            //for web + mobile, these are required
        #if !desktop
            frag = "precision mediump float;\n" + frag;
            frag_textured = "precision mediump float;\n" + frag_textured;
            frag_bitmapfont = "#extension GL_OES_standard_derivatives : enable\n#extension OES_standard_derivatives : enable\nprecision mediump float;\n" + frag_bitmapfont;
        #end

        var _plain = new Shader( core.resources );
        var _textured = new Shader( core.resources );
        var _font = new Shader( core.resources );

        //set the id's

            var _dvs = 'default vertex shader';

            _plain.id = 'default_shader';
            _textured.id = 'default_shader_textured';
            _font.id = 'default_shader_bitmapfont';

        //create compile and link the shaders

            _plain.from_string( vert, frag, _dvs, 'default fragment shader', false );
            _textured.from_string( vert, frag_textured, _dvs, 'default textured shader', false );
            _font.from_string( vert, frag_bitmapfont, _dvs, 'default bitmapfont shader', false );

        //store for use

        shaders = {
            plain : { shader : _plain, source : { vert:vert, frag:frag } },
            textured : { shader : _textured, source : { vert:vert, frag:frag_textured } },
            bitmapfont : { shader : _font, source : { vert:vert, frag:frag_bitmapfont } },
        };

        _debug('done.');

    } //create_default_shaders

    function create_default_font() {

        _debug("creating the default font...");

            font = new BitmapFont({ id:'default', resources:core.resources });

                //create the font texture
            var _font_texture = Texture.load_from_resource('default.png');
                _font_texture.filter_min = FilterType.linear;

                //load the font string data
            font.from_string( haxe.Resource.getString('default.fnt'), null, [_font_texture] );

        _debug("done. " + _font_texture.width + 'x' + _font_texture.height );

    } //create_default_font

} //renderer



class RendererStats {

    public function new(){}
    public var batchers : Int = 0;
    public var geometry_count : Int = 0;
    public var dynamic_batched_count : Int = 0;
    public var static_batched_count : Int = 0;
    public var visible_count : Int = 0;
    public var draw_calls : Int = 0;
    public var group_count : Int = 0;
    public var vert_count : Int = 0;

    public function reset() {
        geometry_count = 0;
        dynamic_batched_count = 0;
        static_batched_count = 0;
        visible_count = 0;
        group_count = 0;
        draw_calls = 0;
        vert_count = 0;
    }

    function toString() {
        return
            'Renderer Statistics\n' +
            '\tbatcher count : ' + batchers + '\n' +
            '\ttotal geometry : ' + geometry_count + '\n' +
            '\tvisible geometry : ' + visible_count + '\n' +
            '\tdynamic batched geometry : ' + dynamic_batched_count + '\n' +
            '\tstatic batched geometry : ' + static_batched_count + '\n' +
            '\ttotal draw calls : ' + draw_calls + '\n' +
            '\ttotal vertices : ' + vert_count;
    }

}

