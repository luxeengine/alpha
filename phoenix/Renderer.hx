package phoenix;

import snow.modules.opengl.GL;
import snow.systems.assets.Asset;

import luxe.Log.*;

import luxe.Engine;
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
import snow.types.Types.Error;

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

interface RenderTarget {
    public var width: Int;
    public var height: Int;
    public var viewport_scale: Float;
    public var framebuffer: GLFramebuffer;
    public var renderbuffer: GLRenderbuffer;
}

@:allow(phoenix.Renderer)
class Backbuffer implements RenderTarget {

    public var width: Int;
    public var height: Int;
    public var viewport_scale: Float;
    public var framebuffer: GLFramebuffer;
    public var renderbuffer: GLRenderbuffer;

    function new(_render_w:Int, _render_h:Int, _render_scale:Float, _fb:GLFramebuffer, _rb:GLRenderbuffer) {
        width = _render_w;
        height = _render_h;
        viewport_scale = _render_scale;
        framebuffer = _fb;
        renderbuffer = _rb;
    }

}

class Renderer {

    public var batchers : Array<Batcher>;

    public var core : Engine;
    public var state : RenderState;
    public var default_framebuffer : GLFramebuffer;
    public var default_renderbuffer : GLRenderbuffer;
        //Default rendering
    public var shaders : DefaultShaders;
        //Default view and batching renderer
    public var batcher : Batcher;
    public var camera : Camera;
        //Default font for debug stuff etc
    public var font : BitmapFont;
        //This will be null if there's no default font
    public var font_asset : AssetImage;
        //Default render path is a forward renderer, and acts as a fallback for deferred
        //render path is the active render path, can replace it to render in a different manner
        //It will pass all batchers to be processed etc for you to do whatever with
    public var render_path : RenderPath;
    public var default_render_path : RenderPath;

    @:isVar public var target (get,set) : RenderTarget;
    public var backbuffer: Backbuffer;

    public var should_clear : Bool = true;
    public var stop : Bool = false;
    public var stop_count : Int = 0;
    public var clear_color : Color;

    public var stats : RendererStats;

    public function new( _core:luxe.Engine, _asset:AssetImage ) {

        core = _core;
        font_asset = _asset;

        //store the default framebuffer/renderbuffer as on some platforms it is not just '0'
        //:todo:refactor:gl:

            default_framebuffer = GL.getParameter(GL.FRAMEBUFFER_BINDING);
            default_renderbuffer = GL.getParameter(GL.RENDERBUFFER_BINDING);

            var render_scale_ratio = 1.0;
            if(core.game_config.use_device_pixels) {
                render_scale_ratio = core.app.runtime.window_device_pixel_ratio();
            }

            backbuffer = new Backbuffer(
                core.app.runtime.window_width(),
                core.app.runtime.window_height(),
                render_scale_ratio,
                default_framebuffer,
                default_renderbuffer
            );

        _debug("default Framebuffer set to " + default_framebuffer);
        _debug("default Renderbuffer set to " + default_renderbuffer);

    } //new

    public function init() {

        state = new RenderState(this);
        clear_color = new Color().rgb(0x1a1a1a);
        stats = new RendererStats();
        target = backbuffer;
        batchers = [];

            //The default view
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

        if(Luxe.core.app.config.render.depth > 0) {
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

            //:todo: why is this hardcoded at 2
        var _new_batcher_layer = 2;

        if(options != null) {

            def(options.name, 'batcher');
            def(options.layer, _new_batcher_layer);
            def(options.camera, new phoenix.Camera());
            def(options.max_verts, 16384);

        } else {
            options = {
                name : 'batcher',
                camera : new phoenix.Camera(),
                layer : _new_batcher_layer,
                max_verts : 16384
            }
        }

        var _batcher = new Batcher( this, options.name, options.max_verts );
            _batcher.view = options.camera;
            _batcher.layer = options.layer;

        if( options.no_add == null || options.no_add == false ) {
            add_batch( _batcher );
        }


        return _batcher;

    } //create_batcher


    public function clear( _color:Color ) {

        def(_color, clear_color);

        GL.clearColor( _color.r, _color.g, _color.b, _color.a );

        if(Luxe.core.app.config.render.depth > 0) {
            GL.clear(GL.COLOR_BUFFER_BIT | GL.DEPTH_BUFFER_BIT);
            GL.clearDepth(1.0);
        } else {
            GL.clear(GL.COLOR_BUFFER_BIT);
        }

    } //clear

    public function blend_mode(?_src_mode:BlendMode = BlendMode.src_alpha, _dst_mode:BlendMode = BlendMode.one_minus_src_alpha) {

        GL.blendFunc(_src_mode, _dst_mode);

    } //set blendmode

    public function blend_equation(?_equation:BlendEquation = BlendEquation.add) {

        GL.blendEquation(_equation);

    } //set blend equation

        //The resize handler
    @:allow(luxe.Engine)
    function internal_resized(_w:Int, _h:Int) {

        backbuffer.width = _w;
        backbuffer.height = _h;

    } //internal_resized

        //The main render function
    @:allow(luxe.Engine)
    function process() {

        // if(stop) { return; }

        if(should_clear) {
            clear( clear_color );
        }

            //render
        render_path.render( batchers, stats );

        // stop_count++;
        // if(stop_count >= 3) {
        //     stop = true;
        // }

    } //process

    @:allow(luxe.Engine)
    function prerender() {

        stats.reset();

    } //prerender

    function get_target() : RenderTarget {

        return target;

    } //get_target

    function set_target( _target:RenderTarget ) {

        if(_target == null) _target = backbuffer;

        state.bindFramebuffer(_target.framebuffer);
        state.bindRenderbuffer(_target.renderbuffer);

        return target = _target;

    } //set_target

    function create_default_shaders() {

        _debug('creating default shaders...');

        var vert = null;
        var frag = null;
        var frag_textured = null;
        var frag_bitmapfont = null;

        #if (linc_opengl && !linc_opengl_GLES && !js)
            if(Luxe.snow.config.render.opengl.profile == snow.types.Types.OpenGLProfile.core) {
                var vaos = [0];
                opengl.GL.glGenVertexArrays(1, vaos);
                opengl.GL.glBindVertexArray(vaos[0]);

                vert = haxe.Resource.getString('default.vert.gl3.glsl');
                frag = haxe.Resource.getString('default.frag.gl3.glsl');
                frag_textured = haxe.Resource.getString('default.frag.textured.gl3.glsl');
                frag_bitmapfont = haxe.Resource.getString('default.frag.bitmapfont.gl3.glsl');
            }
        #end

        if(vert == null) {
            vert = haxe.Resource.getString('default.vert.glsl');
            frag = haxe.Resource.getString('default.frag.glsl');
            frag_textured = haxe.Resource.getString('default.frag.textured.glsl');
            frag_bitmapfont = haxe.Resource.getString('default.frag.bitmapfont.glsl');
        }


        #if luxe_web
            var ext = snow.modules.opengl.GL.gl.getExtension('OES_standard_derivatives');
        #end

            //for web + mobile, these are required
        #if !desktop
            frag = "precision mediump float;\n" + frag;
            frag_textured = "precision mediump float;\n" + frag_textured;
            frag_bitmapfont = "#extension GL_OES_standard_derivatives : enable\n#extension OES_standard_derivatives : enable\nprecision mediump float;\n" + frag_bitmapfont;
        #end

        var _plain = new Shader({ id:'luxe.shader', frag_id:'default', vert_id:'default' });
        var _textured = new Shader({ id:'luxe.shader_textured', frag_id:'textured', vert_id:'default' });
        var _font = new Shader({ id:'luxe.shader_bitmapfont', frag_id:'bitmapfont', vert_id:'default' });

        //create compile and link the shaders
        var _ok = true;

            _ok = _ok && _plain.from_string( vert, frag );
            _ok = _ok && _textured.from_string( vert, frag_textured );
            _ok = _ok && _font.from_string( vert, frag_bitmapfont );

        assert(_ok, 'Default shaders failed to compile or link. See log for errors');

        //store for use

        shaders = {
            plain : { shader : _plain, source : { vert:vert, frag:frag } },
            textured : { shader : _textured, source : { vert:vert, frag:frag_textured } },
            bitmapfont : { shader : _font, source : { vert:vert, frag:frag_bitmapfont } },
        };

        _debug('done.');

    } //create_default_shaders

    function create_default_font() {

        assertnull(font_asset, 'Renderer / failed to create the default font');

        _debug("creating the default font...");

                //Create the font texture
            var _font_texture = new Texture({
                id:'luxe.font.png',
                width: font_asset.image.width_actual,
                height: font_asset.image.height_actual,
                pixels: font_asset.image.pixels
            });

            assertnull(_font_texture, 'Renderer / failed to create the default font... font_texture was null.');

            var _font_data = haxe.Resource.getString('default.fnt');

            font = new BitmapFont({
                id: 'luxe.font',
                font_data: _font_data,
                pages: [ _font_texture ]
            });

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
    public var vert_count : Int = 0;

    public function reset() {
        geometry_count = 0;
        dynamic_batched_count = 0;
        static_batched_count = 0;
        visible_count = 0;
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

