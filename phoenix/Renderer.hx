package phoenix;

import lime.gl.GL;
import lime.utils.Libs;

import phoenix.ResourceManager;
import phoenix.geometry.Geometry;
import phoenix.defaults.Shaders;

import phoenix.Shader;
import phoenix.Color;
import phoenix.Camera;
import phoenix.Texture;

import lime.utils.UInt8Array;
import lime.utils.ArrayBuffer;

import phoenix.utils.BinarySearchTree;


class Renderer {

    public var resource_manager : ResourceManager;
    public var batchers : BinarySearchTree<Batcher>;
        
        //Default rendering
    public var default_shader : Shader;
    public var default_shader_textured : Shader;
        //Default view and batching renderer
    public var default_batcher : Batcher;
    public var default_camera : Camera;

    public var should_clear : Bool = true;
    public var stop : Bool = false;
    public var clear_color : Color;

    public function startup() {

        clear_color = new Color(0,0,0,1);

        resource_manager = new ResourceManager();
        batchers = new BinarySearchTree<Batcher>( function(a:Batcher,b:Batcher){
            return a.compare(b);
        } );

            //The default view ; todo : unhardcode
        default_camera = new Camera( ProjectionType.ortho, { x2:960, y2:640 } );

            //create the default rendering shader
        default_shader = new Shader( resource_manager );  
        default_shader.id = 'default_shader';

        default_shader_textured = new Shader( resource_manager );  
        default_shader_textured.id = 'default_shader_textured';

        default_shader.load_from_string( Shaders.vertex_shader(), 
                                         Shaders.fragment_untextured(), true );

        default_shader_textured.load_from_string( Shaders.vertex_shader(), 
                                                  Shaders.fragment_textured(), true );

            //create the default batcher
        default_batcher = new Batcher( this );
        add_batch(default_batcher);

            //enable z buffer use
        GL.enable(GL.DEPTH_TEST);
            // Accept fragment if it closer or equal away from the other
        GL.depthFunc(GL.LESS);

            //Enable blending
        GL.enable(GL.BLEND);
        GL.blendFunc(GL.SRC_ALPHA, GL.ONE_MINUS_SRC_ALPHA);

            //Make sure that we aren't premultiplying the backbuffer
        GL.pixelStorei(GL.UNPACK_PREMULTIPLY_ALPHA_WEBGL, 0);
        
        // trace(':: phoenix :: renderer starting up');        
    }

    public function shutdown() {
        // trace(':: phoenix :: renderer shutting down');   
    }

    public function add_batch(batch:Batcher) {
        batchers.insert(batch);
    }

    public function clear( _color:Color ) {
        if(_color == null) _color = clear_color;

        GL.clearColor( _color.r, _color.g, _color.b, _color.a );
        GL.clear( GL.COLOR_BUFFER_BIT | GL.DEPTH_BUFFER_BIT );
    }

    public function load_texture( _name : String, ?_onloaded:Texture->Void ) : Texture {

        var texture : Texture = new Texture( resource_manager );

#if lime_html5
        var image: js.html.ImageElement = js.Browser.document.createImageElement();
            
        image.onload = function(a) {

            var tmp_canvas = js.Browser.document.createCanvasElement();
            tmp_canvas.width = image.width; tmp_canvas.height = image.height;

            var tmp_context = tmp_canvas.getContext2d();
            tmp_context.clearRect( 0,0, tmp_canvas.width, tmp_canvas.height );
            tmp_context.drawImage( image, 0, 0, tmp_canvas.width, tmp_canvas.height );

            var image_bytes = tmp_context.getImageData( 0, 0, tmp_canvas.width, tmp_canvas.height );
            var haxe_bytes = new lime.utils.UInt8Array( image_bytes.data );

            texture.create_from_bytes_html(image.src, haxe_bytes, tmp_canvas.width, tmp_canvas.height);
            texture.loaded = true;

            trace(":: phoenix :: Texture loaded " + texture.id + ' (' + texture.width + 'x' + texture.height + ')') ;

            tmp_canvas = null;
            tmp_context = null;
            haxe_bytes = null;
            image_bytes = null;

            if(_onloaded != null) {
                _onloaded(texture);
            } //if onloaded

            if(texture.onload != null) {
                texture.onload(texture);
            } //if texture.onload

        } //image.onload

            //source comes after the onload being set, for race conditions
        image.src = './' + _name;

#end //lime_html5

#if lime_native

        var asset_bytes = cast lime.utils.Assets.getBytes( _name );

        if(asset_bytes != null) {

            texture.create_from_bytes( _name, asset_bytes );
            texture.loaded = true;
            
            if(_onloaded != null) {
                _onloaded(texture);
            } //if onloaded

            if(texture.onload != null) {
                texture.onload(texture);
            } //if texture.onload

            trace(":: phoenix :: Texture loaded " + texture.id + ' (' + texture.width + 'x' + texture.height + ')') ;

        } else {

            trace(":: phoenix :: Texture not found by asset name. " + _name );      
                //Set the failed to load flagged
            texture.id = "Failed to load texture : " + _name;    

        }

         asset_bytes = null;

#end //lime_native
       
        return texture;

    }

        //The main render function 
    public function process() {
        
        if(stop) { return; }

        if(should_clear) {
            clear( clear_color );
        }

        for(batch in batchers) {
            batch.draw();
        }

        stop = false;
    }



}

    