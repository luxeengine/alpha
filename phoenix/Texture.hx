package phoenix;

import phoenix.Resource;

import lime.gl.GL;
import lime.gl.GLTexture;

import lime.utils.UInt8Array;

import lime.utils.Libs;
import lime.utils.ArrayBuffer;
import phoenix.Vector;

enum FilterType {
    nearest;
    linear;    
}
enum ClampType {
    edge;
    repeat;    
    mirror;    
}

class Texture extends Resource {

    public var texture : GLTexture;
    public var data : UInt8Array;

    public var actual_width : Int = -1;
    public var actual_height : Int = -1;   
    public var width : Int = -1;
    public var height : Int = -1;   
    public var loaded : Bool = false;

    public var _onload_handlers : Array<Texture -> Void>;

    @:isVar public var onload(never,set) : Texture -> Void;
    @:isVar public var filter(default,set) : FilterType;

    public function new( _manager : ResourceManager, ?_size : Vector = null ) {
        
        super( _manager, ResourceType.texture );
        _onload_handlers = new Array<Texture -> Void>();

        id = 'Untitled';
        build( _size, null );
    }

    public function set_onload( f: Texture -> Void ) {
            //if already loaded when adding an onloaded handler,
            //just call the handler now
        if(loaded) {
            f(this);
            return f;
        } else {
            //otherwise we store it in the list for calling later
            _onload_handlers.push(f);
        }

        return f;
    }

    public function do_onload() {
        loaded = true;
        for(f in _onload_handlers) {
            f(this);
        }
        _onload_handlers.splice(0,_onload_handlers.length);
    }

    public function toString() {
        return 'phoenix.Texture (' + width + 'x' + height +') real size('+ actual_width + 'x' + actual_height +') ' + filter + ' filtering. id: ' + id;
    }

    public function build(_size : Vector, _color: Dynamic) {

        if(_size == null) _size = new Vector();
        if(_color == null) _color = {r:1,g:1,b:1,a:1};
        if(_size.x > 0 && _size.y > 0) {

            width = Std.int(_size.x);
            height = Std.int(_size.y);
            actual_width = width;
            actual_height = height;

                //clear up old data in case
            data = null;
                //create a new set of pixels data
            data = new UInt8Array( cast new ArrayBuffer(  ) ); //width * height * 4
                //fill it up!
            for(x in 0 ... width) {
                for(y in 0 ... height) {
                    setPixel({x:x, y:y}, _color);
                }
            }

            texture = GL.createTexture();
        }
    }

    public function estimated_memory() {
        var _bytes = (actual_width * actual_height * 4);        
        return Lab.utils.bytes_to_string(_bytes);
    }

    public function create_from_bytes_html(_asset_name:String, _asset_bytes, _width, _height ) {

        var max_size = GL.getParameter(GL.MAX_TEXTURE_SIZE);

        texture = GL.createTexture();

            //if no problems
        id = _asset_name;
        width = Std.int(_width);
        height = Std.int(_height);  

        actual_width = width;
        actual_height = height;     

        if(_width > max_size) throw "texture bigger than MAX_TEXTURE_SIZE (" + max_size + ") " + _asset_name;
        if(_height > max_size) throw "texture bigger than MAX_TEXTURE_SIZE (" + max_size + ") " + _asset_name;

        //Now we can bind it
        bind();

            //And send GL the data
        GL.texImage2D(GL.TEXTURE_2D, 0, GL.RGBA, width, height, 0, GL.RGBA, GL.UNSIGNED_BYTE, cast _asset_bytes );

            //Set the properties
        _set_filter( FilterType.linear );
        _set_clamp( ClampType.repeat );

        // image_bytes = null;
        // data = null; //todo - sven use lock/unlock
    }

        //Create from the bytes from Assets.getBytes() or other method
    public function create_from_bytes( _asset_name:String, _asset_bytes:haxe.io.Bytes ) {

        var start = haxe.Timer.stamp();
        // trace(_asset_bytes);

        var max_size = GL.getParameter(GL.MAX_TEXTURE_SIZE);

        var nme_bitmap_handle = nme_bitmap_data_from_bytes(_asset_bytes, null);
        if(nme_bitmap_handle == null) throw "cannot create bitmap " + _asset_name;

        var _width = nme_bitmap_data_width( nme_bitmap_handle );
        var _height = nme_bitmap_data_height( nme_bitmap_handle );
        
            //The actual padded size (for NPOT strict renderers)
        actual_width = _width;
        actual_height = _height;
        
        if(_width > max_size) throw "texture bigger than MAX_TEXTURE_SIZE (" + max_size + ") " + _asset_name;
        if(_height > max_size) throw "texture bigger than MAX_TEXTURE_SIZE (" + max_size + ") " + _asset_name;

        var image_bytes : lime.utils.ByteArray;

        try {
            image_bytes = cast nme_bitmap_data_get_pixels( nme_bitmap_handle, {x:0, y:0, width:_width, height:_height } );
        } catch(e:Dynamic) {
            trace(e);
            throw " fail!";
        }
        
        texture = GL.createTexture();

            //if no problems
        id = _asset_name;
        width = Std.int(_width);
        height = Std.int(_height);            

        data = new UInt8Array( cast image_bytes );
        var image_length = width * height;

            //ARGB to RGBA cos format 
            //todo : do inside nme side.
        
        for(i in 0 ... image_length) {
            // data[i] = ((data[i]>>24) | (data[i]<<8)); 

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
        _set_filter( FilterType.linear );
        _set_clamp( ClampType.repeat );

        image_bytes = null;
        data = null; //todo - sven use lock/unlock
        // trace('create_from_bytes took ' + (haxe.Timer.stamp() - start));
    }

        //Only used for memory array fonts on html5 atm (like the default font and ui)
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
        actual_width = width;
        actual_height = height;   
        loaded = true;

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
        filter = FilterType.linear;
        set_clamp( ClampType.repeat );
        
        image_bytes = null;
        byte_input = null;
        png_bytes = null;
        png_header = null;
        data = null; //todo - sven use lock/unlock

    }


    private function _set_clamp( _clamp : ClampType ) {

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

    public function set_clamp( _clamp : ClampType ) {
        if(loaded == false) {
            onload = function(t) {
                bind();
                _set_clamp(_clamp);
            }
        } else {
            bind();
            _set_clamp(_clamp);
        }

        return _clamp;
    }

    private function _set_filter( _filter : FilterType ) {       

        switch(_filter) {
            case FilterType.linear:
                GL.texParameteri(GL.TEXTURE_2D, GL.TEXTURE_MIN_FILTER, GL.LINEAR);
                GL.texParameteri(GL.TEXTURE_2D, GL.TEXTURE_MAG_FILTER, GL.LINEAR);

            case FilterType.nearest:
                GL.texParameteri(GL.TEXTURE_2D, GL.TEXTURE_MIN_FILTER, GL.NEAREST);
                GL.texParameteri(GL.TEXTURE_2D, GL.TEXTURE_MAG_FILTER, GL.NEAREST);            
        }

    }

    public function set_filter( _filter : FilterType ) {
        if(loaded == false) {
            onload = function(t) {
                bind();
                _set_filter(_filter);
            }
        } else {
            bind();
            _set_filter(_filter);
        }
        return filter = _filter;
    }

    public function generate_mipmaps() {
            //make it active
        bind();
            //Generate mipmaps
        GL.generateMipmap(GL.TEXTURE_2D);
    }

    public function bind() {
        GL.bindTexture(GL.TEXTURE_2D, texture);
    }

    public function activate(att) {
        
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

    public override function drop() {
        super.drop();
        destroy();
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