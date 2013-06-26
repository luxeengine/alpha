package phoenix;

import phoenix.Resource;

import lime.gl.GL;
import lime.gl.GLTexture;

import lime.utils.UInt8Array;

import lime.utils.Libs;
import lime.utils.ArrayBuffer;

enum FilterType {
    nearest;
    linear;    
}
enum ClampType {
    edge;
    repeat;    
    mirror;    
}

class Rectangle {
    public var x:Float;
    public var y:Float;
    public var width:Float;
    public var height:Float;
    public function new(_x,_y,_w,_h) {
        x = _x; 
        y = _y; 
        width = _w; 
        height = _h; 
    }
}

class Texture extends Resource {

    public var texture : GLTexture;
    public var data : UInt8Array;

    public var width : Int = -1;
    public var height : Int = -1;   

    public function new( _manager : ResourceManager, _size : Dynamic = null ) {
        
        super( _manager, ResourceType.texture );

        id = 'Untitled';
        build( _size, null );
    }

    public function build(_size : Dynamic, _color: Dynamic) {

        if(_size == null) _size = {x:0, y:0};
        if(_color == null) _color = {r:1,g:1,b:1,a:1};
        if(_size.x > 0 && _size.y > 0) {

            width = Std.int(_size.x);
            height = Std.int(_size.y);

                //clear up old data in case
            data = null;
                //create a new set of pixels data
            data = new UInt8Array( cast new ArrayBuffer( width * height * 4 ) );
                //fill it up!
            for(x in 0 ... width) {
                for(y in 0 ... height) {
                    setPixel({x:x, y:y}, _color);
                }
            }

            texture = GL.createTexture();
        }
    }

        //Create from the bytes from Assets.getBytes() or other method
    public function create_from_bytes( _asset_name:String, _asset_bytes:haxe.io.Bytes ) {
        
        var nme_bitmap_handle = nme_bitmap_data_from_bytes(_asset_bytes, null);
        var _width = nme_bitmap_data_width( nme_bitmap_handle );
        var _height = nme_bitmap_data_height( nme_bitmap_handle );
        
        var image_bytes : lime.utils.ByteArray = cast nme_bitmap_data_get_pixels( nme_bitmap_handle, {x:0, y:0, width:_width, height:_height } );
        
        texture = GL.createTexture();

            //if no problems
        id = _asset_name;
        width = Std.int(_width);
        height = Std.int(_height);            

        data = new UInt8Array( image_bytes.getData() );
        var image_length = width * height;

            //ARGB to RGBA cos format 
            //todo : do inside nme side.
        for(i in 0 ... image_length) {

            var a = data[i*4+0];
            var r = data[i*4+1];
            var g = data[i*4+2];
            var b = data[i*4+3];

            //rgba would then be

            data[i*4+0] = r;
            data[i*4+1] = g;
            data[i*4+2] = b;
            data[i*4+3] = a;
        }

            //Now we can bind it
        bind();
            //And send GL the data
        GL.texImage2D(GL.TEXTURE_2D, 0, GL.RGBA, width, height, 0, GL.RGBA, GL.UNSIGNED_BYTE, data );

            //Set the properties
        set_filtering( FilterType.linear );
        set_clamp( ClampType.repeat );
        
        image_bytes = null;
        data = null; //todo - sven use lock/unlock
    }

        //THIS IS NOT USED ATM
    public function create_from_bytes_using_haxe( _asset_name:String, _asset_bytes:haxe.io.Bytes ) {

        texture = GL.createTexture();

            //First we have to convert to haxe.io.bytes for use with format.png
        var image_bytes = haxe.io.Bytes.ofData( _asset_bytes.getData() );
            //Then we need it to be a BytesInput haxe.io.Input
        var byte_input = new haxe.io.BytesInput(image_bytes,0,image_bytes.length);

        //todo - use nme for the image side.

            //NOW we can read the png from it
        var png_data = new format.png.Reader(byte_input).read();
            //Extract the bytes from the png reader
        var png_bytes = format.png.Tools.extract32(png_data);
            //And the header information for infomation
        var png_header = format.png.Tools.getHeader(png_data); 

            //if no problems
        id = _asset_name;
        width = Std.int(png_header.width);
        height = Std.int(png_header.height);            

        data = new UInt8Array(png_bytes.getData());
        var image_length = width * height;

            //BGRA to RGBA cos format...yea I dunno.
            //GL doesn't even have BGRA as a default format 
            //on a ton of platforms.
        for(i in 0 ... image_length) {

            var b = data[i*4+0];
            var g = data[i*4+1];
            var r = data[i*4+2];
            var a = data[i*4+3];

            //rgba would then be

            data[i*4+0] = r;
            data[i*4+1] = g;
            data[i*4+2] = b;
            data[i*4+3] = a;
        }

            //Now we can bind it
        bind();
            //And send GL the data
        GL.texImage2D(GL.TEXTURE_2D, 0, GL.RGBA, width, height, 0, GL.RGBA, GL.UNSIGNED_BYTE, data );

            //Set the properties
        set_filtering( FilterType.linear );
        set_clamp( ClampType.repeat );
        
        image_bytes = null;
        byte_input = null;
        png_bytes = null;
        png_header = null;
        data = null; //todo - sven use lock/unlock

    }

    public function set_clamp( _clamp : ClampType ) {
        bind();
        switch (_clamp) {
            case ClampType.edge:
                GL.texParameteri(GL.TEXTURE_2D, GL.TEXTURE_WRAP_S, GL.CLAMP_TO_EDGE );
                GL.texParameteri(GL.TEXTURE_2D, GL.TEXTURE_WRAP_T, GL.CLAMP_TO_EDGE );
            case ClampType.repeat:
                GL.texParameteri(GL.TEXTURE_2D, GL.TEXTURE_WRAP_S, GL.REPEAT );
                GL.texParameteri(GL.TEXTURE_2D, GL.TEXTURE_WRAP_T, GL.REPEAT );
           case ClampType.mirror:
                GL.texParameteri(GL.TEXTURE_2D, GL.TEXTURE_WRAP_S, GL.MIRRORED_REPEAT );
                GL.texParameteri(GL.TEXTURE_2D, GL.TEXTURE_WRAP_T, GL.MIRRORED_REPEAT );
        }
    }

    public function set_filtering( _filter : FilterType ) {

        bind();

        switch(_filter) {
            case FilterType.linear:
                GL.texParameteri(GL.TEXTURE_2D, GL.TEXTURE_MIN_FILTER, GL.LINEAR);
                GL.texParameteri(GL.TEXTURE_2D, GL.TEXTURE_MAG_FILTER, GL.LINEAR);

            case FilterType.nearest:
                GL.texParameteri(GL.TEXTURE_2D, GL.TEXTURE_MIN_FILTER, GL.NEAREST);
                GL.texParameteri(GL.TEXTURE_2D, GL.TEXTURE_MAG_FILTER, GL.NEAREST);            
        }

    }

    public function bind() {
        GL.bindTexture(GL.TEXTURE_2D, texture);
    }

    public function getPixel(_pos) {
        if(data == null) return null;

        var x : Int = Std.int(_pos.x);
        var y : Int = Std.int(_pos.y);

        return {
            r: data[ (((y*width)+x)*4)  ],
            g: data[ (((y*width)+x)*4)+1],
            b: data[ (((y*width)+x)*4)+2],
            a: data[ (((y*width)+x)*4)+3]
        };
    }

    public function setPixel(_pos, _color) {
        
        if(data == null) return;

        var x : Int = Std.int(_pos.x);
        var y : Int = Std.int(_pos.y);

        data[ (((y*width)+x)*4)  ] = _color.r;
        data[ (((y*width)+x)*4)+1] = _color.g;
        data[ (((y*width)+x)*4)+2] = _color.b;
        data[ (((y*width)+x)*4)+3] = _color.a;

    }

    public function lock() {
        
        //todo sven
        // glGetTexImage is missing from nme GL

        // data = new UInt8Array(new ArrayBuffer( width * height * 4));
        
        // glBindTexture(GL_TEXTURE_2D, texture);
        // glGetTexImage( GL_TEXTURE_2D , 0 , GL_RGBA , GL_UNSIGNED_BYTE, data );

        return true;
    }

    public function unlock() {
        
        if (data != null) {

            GL.bindTexture(GL.TEXTURE_2D, texture);            
            GL.texImage2D(GL.TEXTURE_2D, 0, GL.RGBA, width, height, 0, GL.RGBA, GL.UNSIGNED_BYTE, data);

            data = null;
        }

    }

    public function destroy() {
        GL.deleteTexture(texture);
        data = null;
    }


    private static var nme_bitmap_data_from_bytes = Libs.load("nme", "nme_bitmap_data_from_bytes", 2);
    private static var nme_bitmap_data_height = Libs.load("nme", "nme_bitmap_data_height", 1);
    private static var nme_bitmap_data_width = Libs.load("nme", "nme_bitmap_data_width", 1);
    private static var nme_bitmap_data_get_pixels = Libs.load("nme", "nme_bitmap_data_get_pixels", 2); 

}