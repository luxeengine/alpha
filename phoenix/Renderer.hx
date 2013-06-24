package phoenix;

import nmegl.gl.GL;
import nmegl.utils.Libs;

import phoenix.ResourceManager;
import phoenix.geometry.Geometry;
import phoenix.DefaultShaders;
import phoenix.Shader;
import phoenix.Color;
import phoenix.Camera;
import phoenix.Texture;

import nmegl.utils.UInt8Array;
import nmegl.utils.ArrayBuffer;
import hxlode.PicoPNG;


class Renderer {

    public var resource_manager : ResourceManager;
    public var batchers : Array<Batcher>;
        
        //Default rendering
    public var default_shader : Shader;
    public var default_batcher : Batcher;
    public var default_camera : Camera;

    public var should_clear : Bool = true;
    public var clear_color : Color;

    public function startup() {

        clear_color = new Color(0.16,0.16,0.16,1);

        resource_manager = new ResourceManager();

            //create the default rendering shader
        default_shader = new Shader( resource_manager );  
        default_camera = new Camera( ProjectionType.ortho, { x2:960, y2:640 } );

        var compiles = default_shader.load_from_string( 
                            DefaultShaders.DefaultVertexShader, 
                            DefaultShaders.DefaultFragmentShader 
                        );

        if( !compiles ) {
            throw "Default shader compilation error! \n" + default_shader.errors;
        }
        
            //create the default batcher
        default_batcher = new Batcher( this );

        trace(':: phoenix :: renderer starting up');        
    }

    public function shutdown() {
        trace(':: phoenix :: renderer shutting down');   
    }

    public function clear( _color:Color ) {
        if(_color == null) _color = clear_color;

        GL.clearColor( _color.r, _color.g, _color.b, _color.a );
        GL.clear( GL.COLOR_BUFFER_BIT | GL.DEPTH_BUFFER_BIT );
    }

    public function load_texture( name : String ) : Texture {

        var texture : Texture = new Texture( resource_manager, {x:0,y:0} );

        texture.texture = GL.createTexture();

        var asset_bytes = nmegl.utils.Assets.getBytes( name );

        if(asset_bytes == null) {
            trace("error, texture not found from assets!");
            return texture;
        }

        // var nme_bitmap_data = nme_bitmap_data_from_bytes(asset_bytes, null);
        // var _width : Float = nme_bitmap_data_width(nme_bitmap_data);
        // var _height : Float = nme_bitmap_data_height(nme_bitmap_data);
        // var raw_data = nme_bitmap_data_get_pixels(nme_bitmap_data, new Rectt(0,0,_width,_height) );
        // trace(raw_data);
        // if(raw_data == null) {
        //     throw "get pixels returned null!";
        // }

        var image_bytes = haxe.io.Bytes.alloc(asset_bytes.length);
        for(i in 0 ... asset_bytes.length) {
            image_bytes.set(i, asset_bytes[i] );
        }

        trace(asset_bytes.length);
        trace(image_bytes.length);

        var img:Image = PicoPNG.decodePNG( image_bytes.getData(), image_bytes.length );

        var _width = img.width;
        var _height = img.height;

        if(img == null) {
            throw "Image was null from hxlode";
        }

        // trace(img.width);
        // trace(img.height);
        // trace('img data length ' + img.data.length);
        // trace('expected size?  ' + (_width*_height*4));

        var bytes = haxe.io.Bytes.ofData(img.data);
        var pixels = new UInt8Array(new ArrayBuffer(_width*_height*4));
        for(i in 0 ... img.data.length) {
            pixels[i] = bytes.get(i);
            // if(i == 0) {
            //     trace('r : ' + bytes.get(0));
            //     trace('g : ' + bytes.get(1));
            //     trace('b : ' + bytes.get(2));
            //     trace('a : ' + bytes.get(3));
            // }
        }

        texture.bind();
        GL.texImage2D(GL.TEXTURE_2D, 0, GL.RGBA, Std.int(_width), Std.int(_height), 0, GL.RGBA, GL.UNSIGNED_BYTE, pixels);
        texture.set_filtering( FilterType.linear );
        texture.set_clamp( ClampType.repeat );
        
        // texture._data = raw_data;
        texture.id = name;
        texture.width = Std.int(_width);
        texture.height = Std.int(_height);

        asset_bytes = null;
        bytes = null;

        return texture;

    }

        //The main render function 
    public function process() {
        
        if(should_clear) {
            clear( clear_color );
        }

        if(default_batcher != null) {
            default_batcher.draw();
        }

    }

    private static var nme_bitmap_data_from_bytes = Libs.load("nme", "nme_bitmap_data_from_bytes", 2);
    private static var nme_bitmap_data_height = Libs.load("nme", "nme_bitmap_data_height", 1);
    private static var nme_bitmap_data_width = Libs.load("nme", "nme_bitmap_data_width", 1);
    private static var nme_bitmap_data_get_pixels = Libs.load("nme", "nme_bitmap_data_get_pixels", 2); 
    #if cpp
    private static var nme_bitmap_data_get_array = Libs.load("nme", "nme_bitmap_data_get_array", 3);
    #end

}

    