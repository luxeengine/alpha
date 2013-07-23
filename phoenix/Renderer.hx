package phoenix;

import lime.gl.GL;
import lime.utils.Libs;

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

import phoenix.utils.BinarySearchTree;

class RendererStats {
    public function new(){}
    public var batchers : Int = 0;
    public var geometry_count : Int = 0;
    public var dynamic_batched_count : Int = 0;
    public var static_batched_count : Int = 0;
    public var enabled_count : Int = 0;
    public var draw_calls : Int = 0;
    public var group_count : Int = 0;
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

class Renderer {

    public var resource_manager : ResourceManager;
    public var batchers : BinarySearchTree<Batcher>;
        
        //Default rendering
    public var default_shader : Shader;
    public var default_shader_textured : Shader;
        //Default view and batching renderer
    public var default_batcher : Batcher;
    public var default_camera : Camera;
        //Default font for debug stuff etc
    public var default_font : BitmapFont;    

    public var should_clear : Bool = true;
    public var stop : Bool = false;
    public var stop_count : Int = 0;
    public var clear_color : Color;

    public var stats : RendererStats;   

    public function startup() {

        clear_color = new Color(0,0,0,1);
        stats = new RendererStats();
        

        resource_manager = new ResourceManager();
        batchers = new BinarySearchTree<Batcher>( function(a:Batcher,b:Batcher){
            return a.compare(b);
        } );

            //The default view
        default_camera = new Camera( ProjectionType.ortho, { x2 : Lab.screen.w, y2 : Lab.screen.h } );

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
        add_batch(default_batcher);

            //create the default font
        default_font = new BitmapFont( resource_manager );

        trace("Creating the default font...");
            //create the font texture                    
        var _font_texture = load_texture_from_string_byte_array('default_font', FontBytes.data(), 512,512 );
        default_font.load_from_string( FontString.data(), 'phoenix.internal_data.default_font', null, [_font_texture] );

        trace("Done. " + _font_texture.width + 'x' + _font_texture.height );

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
        batchers.insert(batch);
    }

    public function clear( _color:Color ) {
        if(_color == null) _color = clear_color;

        GL.clearColor( _color.r, _color.g, _color.b, _color.a );
        GL.clear( GL.COLOR_BUFFER_BIT | GL.DEPTH_BUFFER_BIT );
    }


    public function load_texture_from_string_byte_array(_name:String = 'untitled texture', _string_byte_array:String, _width:Int, _height:Int) : Texture {
        
        trace("Checking if the texture exists in the cache ...");
        var _exists = resource_manager.find_texture(_name);

        if(_exists != null) {
            trace("Yes, returning it instead");
            return _exists;
        } else {
            trace("Nope, continuing");
        }

        var _array_data = _string_byte_array.split(' ');
        var _int_array_data : Array<Int> = [];
            //loop over the string items and parse them to int
        for(_s in _array_data) {
            _int_array_data.push( Std.parseInt( _s ) );
        }

        trace("have data array");

        var texture_bytes = Lab.utils.arrayToBytes( _int_array_data );
        var texture = new Texture(resource_manager);

        #if lime_native 
            texture.create_from_bytes( _name , lime.utils.ByteArray.fromBytes(texture_bytes) );
            trace("created from bytes");
        #end
        #if lime_html5
            texture.create_from_bytes_using_haxe(_name, texture_bytes );
        #end 

        texture_bytes = null;
        _array_data = null;
        _int_array_data = null;
        texture.loaded = true;

        trace("add to cache");
        resource_manager.cache(texture);

        return texture;        

    }

    public function load_texture( _name : String, ?_onloaded:Texture->Void ) : Texture {

        var _exists = resource_manager.find_texture(_name);
        if(_exists != null) {
            trace(":: phoenix :: Texture loaded (cache) " + _exists.id + ' (' + _exists.width + 'x' + _exists.height + ') real size ('+ _exists.actual_width + 'x' + _exists.actual_height +')') ;
            return _exists;
        }

        var texture : Texture = new Texture( resource_manager );

#if lime_html5
        var image: js.html.ImageElement = js.Browser.document.createImageElement();
            
        image.onload = function(a) {

            var width_pot = Lab.utils.nearest_power_of_two(image.width);
            var height_pot = Lab.utils.nearest_power_of_two(image.height);

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

        stats.batchers = batchers.length;
        stats.geometry_count = 0;
        stats.dynamic_batched_count = 0;
        stats.static_batched_count = 0;
        stats.enabled_count = 0;
        stats.group_count = 0;
        stats.draw_calls = 0;

        for(batch in batchers) {
            if(batch.enabled) {
                batch.draw();
                    //Update render stats
                stats.geometry_count += Lambda.count(batch.geometry);
                stats.dynamic_batched_count += batch.dynamic_batched_count;
                stats.static_batched_count += batch.static_batched_count;
                stats.enabled_count += batch.enabled_count;
                stats.draw_calls += batch.draw_calls;
                stats.group_count += Lambda.count(batch.groups);
            } //batcher enabled
        }       

        // stop_count++;
        // if(stop_count >= 5) {
        //     stop = false;
        // }        
    }



}

    