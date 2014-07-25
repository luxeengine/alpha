package phoenix;

import snow.render.opengl.GL;
import snow.utils.ByteArray;
import snow.utils.Libs;

import luxe.Log.log;
import luxe.Log._debug;
import luxe.Log._verbose;

import luxe.Core;
import luxe.Rectangle;
import luxe.ResourceManager;

import phoenix.Batcher;
import phoenix.RenderPath;
import phoenix.geometry.Geometry;

import phoenix.RenderTexture;
import phoenix.Shader;
import phoenix.Color;
import phoenix.Camera;
import phoenix.Texture;
import phoenix.BitmapFont;

import snow.utils.UInt8Array;
import snow.utils.ArrayBuffer;

import luxe.structural.BalancedBinarySearchTree;


typedef BatcherKey = {
    uuid : String,
    layer : Int
}

class Renderer {

    public var resource_manager : ResourceManager;
    public var batchers : Array<Batcher>;
    // public var batchers : BalancedBinarySearchTree<BatcherKey,Batcher>;

    public var core : Core;
    public var state : RenderState;
    public var default_fbo : GLFramebuffer;
        //Default rendering
    public var default_shader : Shader;
    public var default_shader_textured : Shader;
    public var default_vert_source : String;
    public var default_frag_source : String;
    public var default_frag_textured_source : String;
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

    @:isVar public var target (get,set) : RenderTexture;
    public var target_size : Vector;

    public var should_clear : Bool = true;
    public var stop : Bool = false;
    public var stop_count : Int = 0;
    public var clear_color : Color;

    public var stats : RendererStats;

    public function new( _core:luxe.Core ) {

        core = _core;

    } //new

    public function init() {

        state = new RenderState(this);
        clear_color = new Color().rgb(0x1a1a1a);
        stats = new RendererStats();

        resource_manager = new ResourceManager();
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

        #if !no_debug_console

            create_default_font();

        #end //no_debug_console

        if(core.app.config.window.depth_buffer) {
                // Enable z buffer use
            GL.enable(GL.DEPTH_TEST);
                // Accept fragment if it closer or equal away from the other
            GL.depthFunc(GL.LEQUAL);
                //Clear the depth buffer
            GL.clearDepth(1.0);
        }

            //Enable blending
        GL.enable(GL.BLEND);
        GL.blendFunc(GL.SRC_ALPHA, GL.ONE_MINUS_SRC_ALPHA);

            //Make sure that we aren't premultiplying the backbuffer
        #if luxe_html5
            GL.pixelStorei(GL.UNPACK_PREMULTIPLY_ALPHA_WEBGL, 0);
        #end //luxe_html5

    } //init

    public function destroy() {

        clear( new luxe.Color().rgb(0xff440b) );

    } //destroy

    @:noCompletion public function sort_batchers( a:Batcher, b:Batcher ) {
        if(a.layer < b.layer) return -1;
        if(a.layer >= b.layer) return 1;
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

        if( core.app.config.window.depth_buffer ) {
            GL.clear( GL.COLOR_BUFFER_BIT | GL.DEPTH_BUFFER_BIT );
            GL.clearDepth(1.0);
        } else {
            GL.clear( GL.COLOR_BUFFER_BIT );
        }

    } //clear

        //The main render function
    public function process() {

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
                //:todo: On iOS and some platforms the default
                //fbo id is not null/0, it is an actual value
                //which needs to be queried at creation and stored
                //for use here instead, but leaving it null works for most platforms
            state.bindFramebuffer( default_fbo );

        }

        return target = _target;

    } //set_target

    function create_default_shaders() {

        _debug('creating default shaders...');

        default_vert_source = haxe.Resource.getString('default.vert.glsl');
        default_frag_source = haxe.Resource.getString('default.frag.glsl');
        default_frag_textured_source = haxe.Resource.getString('default.frag.textured.glsl');

            //for html5 + mobile, these are required
        #if !desktop
            default_frag_source = "precision mediump float;\n" + default_frag_source;
            default_frag_textured_source = "precision mediump float;\n" + default_frag_textured_source;
        #end

            //create the default rendering shader
        default_shader = new Shader( resource_manager );
        default_shader.id = 'default_shader';

        default_shader_textured = new Shader( resource_manager );
        default_shader_textured.id = 'default_shader_textured';

        default_shader.from_string( default_vert_source, default_frag_source, false );
        default_shader_textured.from_string( default_vert_source, default_frag_textured_source, false );

        _debug('done. ');

    } //create_default_shaders

    function create_default_font() {

        _debug("creating the default font...");

            font = new BitmapFont( resource_manager );

                //create the font texture
            var _font_texture = Texture.load_from_resource('din.png', 256, 256);
                _font_texture.filter_min = FilterType.linear;

                //load the font string data
            font.from_string( haxe.Resource.getString('din.fnt'), 'luxe.font', null, [_font_texture] );

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

    public function toString() {
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

