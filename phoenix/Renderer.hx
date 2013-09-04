package phoenix;

import lime.gl.GL;
import lime.utils.Libs;

import phoenix.RenderPath;
import phoenix.ResourceManager;
import phoenix.geometry.Geometry;
    //default resources
import phoenix.defaults.Shaders;
import phoenix.defaults.FontString;
import phoenix.defaults.FontBytes;

import phoenix.Shader;
import phoenix.Color;
import phoenix.Camera;
import phoenix.Texture;
import phoenix.BitmapFont;

import lime.utils.UInt8Array;
import lime.utils.ArrayBuffer;

import luxe.structures.BinarySearchTree;


class Renderer {

    public var resource_manager : ResourceManager;
    public var batchers : BinarySearchTree<Int,Batcher>;

        //Default rendering
    public var default_shader : Shader;
    public var default_shader_textured : Shader;
        //Default view and batching renderer
    public var default_batcher : Batcher;
    public var default_camera : Camera;
        //Default font for debug stuff etc
    public var default_font : BitmapFont;    
        //Default render path is a forward renderer, and acts as a fallback for deferred
        //render path is the active render path, can replace it to render in a different manner
        //It will pass all batchers to be processed etc for you to do whatever with
    public var render_path : RenderPath;
    public var default_render_path : RenderPath;

    public var should_clear : Bool = true;
    public var stop : Bool = false;
    public var stop_count : Int = 0;
    public var clear_color : Color;

    public var stats : RendererStats;   

    public function startup() {

        clear_color = new Color().rgb(0x1a1a1a);
        stats = new RendererStats();

        resource_manager = new ResourceManager();
        batchers = new BinarySearchTree<Int,Batcher>( function(a:Int,b:Int){
            if(a < b) return -1;
            if(a == b) return 0;
            return 1;
        } );

            //The default view
        default_camera = new Camera({ projection:ProjectionType.ortho, x2 : Luxe.screen.w, y2 : Luxe.screen.h });
            //Create the default render path
        default_render_path = new RenderPath( this );
            //Apply it
        render_path = default_render_path;

            //create the default rendering shader
        default_shader = new Shader( resource_manager );  
        default_shader.id = 'default_shader';

        default_shader_textured = new Shader( resource_manager );  
        default_shader_textured.id = 'default_shader_textured';

        default_shader.load_from_string( Shaders.vertex_shader(), 
                                         Shaders.fragment_untextured(), false );

        default_shader_textured.load_from_string( Shaders.vertex_shader(), 
                                                  Shaders.fragment_textured(), false );

            //create the default batcher
        default_batcher = new Batcher( this, 'default_batcher' );
        default_batcher.layer = 1;
        add_batch(default_batcher);

            //create the default font
        default_font = new BitmapFont( resource_manager );

        _debug("Creating the default font...");
            //create the font texture                    
        var _font_texture = load_texture_from_string_byte_array('default_font', FontBytes.data(), 512,512 );
        default_font.load_from_string( FontString.data(), 'phoenix.internal_data.default_font', null, [_font_texture] );

        _debug("Done. " + _font_texture.width + 'x' + _font_texture.height );

            //enable z buffer use
        GL.enable(GL.DEPTH_TEST);
            // Accept fragment if it closer or equal away from the other
        GL.depthFunc(GL.LEQUAL);
            //Clear the depth buffer
        GL.clearDepth(1.0);

            //Enable blending
        GL.enable(GL.BLEND);
        GL.blendFunc(GL.SRC_ALPHA, GL.ONE_MINUS_SRC_ALPHA);

            //Make sure that we aren't premultiplying the backbuffer
        #if lime_html5
            GL.pixelStorei(GL.UNPACK_PREMULTIPLY_ALPHA_WEBGL, 0);
        #end //html5
        
        // trace(':: phoenix :: renderer starting up');        
    }

    public function shutdown() {
        // trace(':: phoenix :: renderer shutting down');   
    }

    public function add_batch(batch:Batcher) {
        batchers.insert( batch.layer, batch );
    }

    public function remove_batch(batch:Batcher) {
        batchers.remove( batch.layer );
    }

    public function clear( _color:Color ) {
        if(_color == null) _color = clear_color;

        GL.clearColor( _color.r, _color.g, _color.b, _color.a );
        GL.clear( GL.COLOR_BUFFER_BIT | GL.DEPTH_BUFFER_BIT );
    }

    private function _debug(v:Dynamic) {
        //trace(v);
    }

    public function load_shader( _psid:String, ?_vsid:String, ?_onloaded:Shader->Void ) : Shader {
        
        var _frag_shader = '';
        var _vert_shader = '';

        if(_vsid == 'default' || _vsid == '') {
            _vert_shader = Shaders.vertex_shader();
        } else {
            _vert_shader = lime.utils.Assets.getText(_vsid);
        }

        if(_psid == 'default' || _psid == '') {
            _frag_shader = Shaders.fragment_untextured();
        } else if(_psid == 'textured') {
            _frag_shader = Shaders.fragment_textured();
        } else {
            _frag_shader = lime.utils.Assets.getText(_psid);
        }
            
        var _shader : Shader = null;


        if(_frag_shader.length > 0 && _vert_shader.length > 0) {

            var prefixes = '';
            #if lime_html5
                prefixes += "precision mediump float;";
            #end //lime_html5
            
             _shader = new Shader( resource_manager );
            _shader.load_from_string( _vert_shader , prefixes + _frag_shader, false );

        } //

        if(_shader != null) {
            return _shader;
        } else {
            return null;
        }

    } //load_shader


    public function load_texture_from_string_byte_array(_name:String = 'untitled texture', _string_byte_array:String, _width:Int, _height:Int) : Texture {
        
        _debug("Checking if the texture exists in the cache ..." + _name);
        var _exists = resource_manager.find_texture(_name);

        if(_exists != null) {
            _debug("Yes, returning it instead");
            return _exists;
        } else {
            _debug("Nope, continuing");
        }

        var _array_data = _string_byte_array.split(' ');
        var _int_array_data : Array<Int> = [];
            //loop over the string items and parse them to int
        for(_s in _array_data) {
            _int_array_data.push( Std.parseInt( _s ) );
        }

        _debug("have data array");

        var texture_bytes = Luxe.utils.arrayToBytes( _int_array_data );
        var texture = new Texture(resource_manager);

        #if lime_native 
            texture.create_from_bytes( _name , lime.utils.ByteArray.fromBytes(texture_bytes) );
            _debug("created from bytes");
        #end
        #if lime_html5
            texture.create_from_bytes_using_haxe(_name, texture_bytes );
        #end 

        texture_bytes = null;
        _array_data = null;
        _int_array_data = null;
        texture.loaded = true;

        _debug("add to cache");
        resource_manager.cache(texture);

        return texture;        

    }


    public function load_texture( _name : String, ?_onloaded:Texture->Void ) : Texture {

        var _exists = resource_manager.find_texture(_name);

        if(_exists != null) {
            if(_name != 'default_ui_button' && _name != 'default_ui_box') {
                trace(":: phoenix :: Texture loaded (cache) " + _exists.id + ' (' + _exists.width + 'x' + _exists.height + ') real size ('+ _exists.actual_width + 'x' + _exists.actual_height +')') ;
            }
            return _exists;
        }

        var texture : Texture = new Texture( resource_manager );

#if lime_html5
        var image: js.html.ImageElement = js.Browser.document.createImageElement();
            
        image.onload = function(a) {

            var width_pot = Luxe.utils.nearest_power_of_two(image.width);
            var height_pot = Luxe.utils.nearest_power_of_two(image.height);

            var tmp_canvas = js.Browser.document.createCanvasElement();
            tmp_canvas.width = width_pot; tmp_canvas.height = height_pot;

            var tmp_context = tmp_canvas.getContext2d();
            tmp_context.clearRect( 0,0, tmp_canvas.width, tmp_canvas.height );
            tmp_context.drawImage( image, 0, 0, image.width, image.height );

            var image_bytes = tmp_context.getImageData( 0, 0, tmp_canvas.width, tmp_canvas.height );
            var haxe_bytes = new lime.utils.UInt8Array( image_bytes.data );

            texture.create_from_bytes_html(image.src, haxe_bytes, tmp_canvas.width, tmp_canvas.height);
            texture.width = image.width;
            texture.height = image.height;
            texture.id = _name; //the full src name is less useful

            trace(":: phoenix :: Texture loaded " + texture.id + ' (' + texture.width + 'x' + texture.height + ') real size ('+ texture.actual_width + 'x' + texture.actual_height +')') ;            

            tmp_canvas = null;
            tmp_context = null;
            haxe_bytes = null;
            image_bytes = null;

                //append the listener
            if(_onloaded != null) texture.onload = _onloaded;
                //and fire the handler
            texture.do_onload();

        } //image.onload

            //source comes after the onload being set, for race conditions
        image.src = './' + _name;

#end //lime_html5

#if lime_native

        var asset_bytes = cast lime.utils.Assets.getBytes( _name );

        if(asset_bytes != null) {

            texture.create_from_bytes( _name, asset_bytes );

                //append the listener
            if(_onloaded != null) texture.onload = _onloaded;
                //call all the onload listeners
            texture.do_onload();

            trace(":: phoenix :: Texture loaded " + texture.id + ' (' + texture.width + 'x' + texture.height + ')') ;

        } else {

            trace(":: phoenix :: Texture not found by asset name. " + _name );      
                //Set the failed to load flagged
            texture.id = "Failed to load texture : " + _name;    

        }

         asset_bytes = null;

#end //lime_native
       
            //store a reference so we can check if it exists later
        resource_manager.cache(texture);
       
        return texture;

    }

        //The main render function 
    public function process() {
        
        if(stop) { return; }

        if(should_clear) {
            clear( clear_color );
        }

        stats.batchers = batchers.size();
        stats.reset();

            //render 
        render_path.render( batchers, stats );

        // stop_count++;
        // if(stop_count >= 3) {
        //     stop = true;
        // }

    } //process


} //renderer



class RendererStats {
    public function new(){}
    public var batchers : Int = 0;
    public var geometry_count : Int = 0;
    public var dynamic_batched_count : Int = 0;
    public var static_batched_count : Int = 0;
    public var enabled_count : Int = 0;
    public var draw_calls : Int = 0;
    public var group_count : Int = 0;

    public function reset() {
        geometry_count = 0;
        dynamic_batched_count = 0;
        static_batched_count = 0;
        enabled_count = 0;
        group_count = 0;
        draw_calls = 0;        
    }
    public function toString() {
        return 
            'Renderer Statistics\n' + 
            '\tbatcher count : ' + batchers + '\n' +
            '\ttotal geometry : ' + geometry_count + '\n' +
            '\tenabled geometry : ' + enabled_count + '\n' +
            '\tdynamic batched geometry : ' + dynamic_batched_count + '\n' +
            '\tstatic batched geometry : ' + static_batched_count + '\n' +
            '\ttotal draw calls : ' + draw_calls;
    }
}
    