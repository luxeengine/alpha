package phoenix;

import lumen.render.gl.GL;
import lumen.utils.UInt8Array;
import lumen.utils.Libs;
import lumen.utils.ArrayBuffer;

import phoenix.Color;
import phoenix.Vector;

import luxe.Resource;
import luxe.ResourceManager;

enum FilterType {
    nearest;
    linear;
    mip_nearest_nearest;  //The texel filter, and then the mip filter
    mip_linear_nearest;
    mip_nearest_linear;
    mip_linear_linear;
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

    public var slot : Int = 0;

    public var _onload_handlers : Array<Texture -> Void>;

    public var onload(never,set) : Texture -> Void;
    @:isVar public var filter(default,set) : FilterType;
    @:isVar public var filter_min(default,set) : FilterType;
    @:isVar public var filter_mag(default,set) : FilterType;
    @:isVar public var clamp(default,set) : ClampType;


    public function new( _manager : ResourceManager, ?_type : ResourceType = null ) {

        if(_type == null) _type = ResourceType.texture;

        super( _manager, _type );
        _onload_handlers = new Array<Texture -> Void>();

        id = 'Untitled';

    } //new

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

    } //set_onload

    public function do_onload() {

        loaded = true;

        for(f in _onload_handlers) {
            f(this);
        }

        _onload_handlers.splice(0,_onload_handlers.length);

    } //do_onload

    public function toString() {
        return 'Texture (' + texture + ') ('+ width + 'x' + height +') real size('+ actual_width + 'x' + actual_height +') ' + filter + ' filtering. id: ' + id;
    } //toString

    @:noCompletion public function build( _size : Vector, _color: Color ) {

        if(_size == null) _size = new Vector();
        if(_color == null) _color = new Color();
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
            var _p = new Vector();

            for(x in 0 ... width) {
                for(y in 0 ... height) {
                    _p.set(x,y);
                    set_pixel( _p, _color );
                }
            }


            // :todo : A test should be made for this

                //Create
            texture = GL.createTexture();
                //Now we can bind it
            bind();
                //And send GL the data
            GL.texImage2D(GL.TEXTURE_2D, 0, GL.RGBA, width, height, 0, GL.RGBA, GL.UNSIGNED_BYTE, data );

                //Set the properties
            _set_filter( FilterType.linear );
            _set_clamp( ClampType.edge );

                //clear up
            data = null;

        } //if size is valid

    } //build

    public function estimated_memory() {

        var _bytes = (actual_width * actual_height * 4);

        return Luxe.utils.bytes_to_string(_bytes);

    } //estimated_memory

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
        _set_clamp( ClampType.edge );

        // image_bytes = null;
        // data = null; //:todo : - sven use lock/unlock

    } //create_from_bytes_html

        //Create from the bytes from Assets.getBytes() or other method
    public function create_from_bytes( _asset_name:String, _asset_bytes:haxe.io.Bytes ) {

        var start = Luxe.time;
        // // trace(_asset_bytes);

        // var max_size = GL.getParameter(GL.MAX_TEXTURE_SIZE);

        // var nme_bitmap_handle = lime_bitmap_data_from_bytes(_asset_bytes, null);
        // if(nme_bitmap_handle == null) throw "cannot create bitmap " + _asset_name;

        // // var _width = lime_bitmap_data_width( nme_bitmap_handle );
        // // var _height = lime_bitmap_data_height( nme_bitmap_handle );
        // var _width = 256;
        // var _height = 256;

        //     //The actual padded size (for NPOT strict renderers)
        // actual_width = _width;
        // actual_height = _height;

        // if(_width > max_size) throw "texture bigger than MAX_TEXTURE_SIZE (" + max_size + ") " + _asset_name;
        // if(_height > max_size) throw "texture bigger than MAX_TEXTURE_SIZE (" + max_size + ") " + _asset_name;

        // var image_bytes : lumen.utils.ByteArray;

        // try {
        //     image_bytes = cast lime_bitmap_data_get_pixels( nme_bitmap_handle, {x:0, y:0, width:_width, height:_height } );
        // } catch(e:Dynamic) {
        //     trace(e);
        //     throw " fail!";
        // }

        // texture = GL.createTexture();

        //     //if no problems
        // id = _asset_name;
        // width = Std.int(_width);
        // height = Std.int(_height);

        // data = new UInt8Array( cast image_bytes );
        // var image_length = width * height;

        //     //ARGB to RGBA cos format
        //     //:todo: do inside native (don't worry about this, new backend)

        // for(i in 0 ... image_length) {
        //     // data[i] = ((data[i]>>24) | (data[i]<<8));

        //     var a = data[i*4+0];
        //     var r = data[i*4+1];
        //     var g = data[i*4+2];
        //     var b = data[i*4+3];

        //     //rgba would then be

        //     data[i*4+0] = r;
        //     data[i*4+1] = g;
        //     data[i*4+2] = b;
        //     data[i*4+3] = a;
        // }


        //     //Now we can bind it
        // bind();
        //     //And send GL the data
        // GL.texImage2D(GL.TEXTURE_2D, 0, GL.RGBA, width, height, 0, GL.RGBA, GL.UNSIGNED_BYTE, data );

        //     //Set the properties
        // _set_filter( FilterType.linear );
        // _set_clamp( ClampType.edge );

        // image_bytes = null;
        // data = null; //:todo : - sven use lock/unlock

        trace('texture.create took ' + (Luxe.time - start));

    } //create_from_bytes

        //Only used for memory array fonts on html5 atm (like the default font and ui)
        //:todo: These functions should be isolated into the asset manager, not here
    public function create_from_bytes_using_haxe( _asset_name:String, _asset_bytes:haxe.io.Bytes ) {

        texture = GL.createTexture();

            //First we have to convert to haxe.io.bytes for use with format.png
        var image_bytes = haxe.io.Bytes.ofData( _asset_bytes.getData() );
            //Then we need it to be a BytesInput haxe.io.Input
        var byte_input = new haxe.io.BytesInput(image_bytes,0,image_bytes.length);

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
        clamp = ClampType.edge;

        image_bytes = null;
        byte_input = null;
        png_bytes = null;
        png_header = null;
        data = null; //todo - sven use lock/unlock

    } //create_from_bytes_using_haxe

    public function generate_mipmaps() {

        onload = function(t) {
            //make it active
            bind();
            //Generate mipmaps
            GL.generateMipmap(GL.TEXTURE_2D);
        }

    } //generate_mipmaps

    public function bind() {

        switch(slot) {
            case 0:
                Luxe.renderer.state.activeTexture(GL.TEXTURE0);
            case 1:
                Luxe.renderer.state.activeTexture(GL.TEXTURE1);
            case 2:
                Luxe.renderer.state.activeTexture(GL.TEXTURE2);
            case 3:
                Luxe.renderer.state.activeTexture(GL.TEXTURE3);
            case 4:
                Luxe.renderer.state.activeTexture(GL.TEXTURE4);
            case 5:
                Luxe.renderer.state.activeTexture(GL.TEXTURE5);
            case 6:
                Luxe.renderer.state.activeTexture(GL.TEXTURE6);
            case 7:
                Luxe.renderer.state.activeTexture(GL.TEXTURE7);
        }

        Luxe.renderer.state.bindTexture2D( texture );
    }

    public function get_pixel( _pos : Vector ) {

        if(data == null) return null;

        var x : Int = Std.int(_pos.x);
        var y : Int = Std.int(_pos.y);

        return {
            r: data[ (((y*width)+x)*4)  ]/255.0,
            g: data[ (((y*width)+x)*4)+1]/255.0,
            b: data[ (((y*width)+x)*4)+2]/255.0,
            a: data[ (((y*width)+x)*4)+3]/255.0
        };

    } //get_pixel

    public function set_pixel( _pos:Vector, _color:Color ) {

        if(data == null) return;

        var x : Int = Std.int(_pos.x);
        var y : Int = Std.int(_pos.y);

        data[ (((y*width)+x)*4)  ] = Std.int(_color.r*255);
        data[ (((y*width)+x)*4)+1] = Std.int(_color.g*255);
        data[ (((y*width)+x)*4)+2] = Std.int(_color.b*255);
        data[ (((y*width)+x)*4)+3] = Std.int(_color.a*255);

    } //set_pixel

    public function lock() {

        //:todo : this is related to glGetTexImage not in WebGL

        // data = new UInt8Array(new ArrayBuffer( width * height * 4));

        // glBindTexture(GL_TEXTURE_2D, texture);
        // glGetTexImage( GL_TEXTURE_2D , 0 , GL_RGBA , GL_UNSIGNED_BYTE, data );

        return true;
    }

    public function unlock() {

        if (data != null) {

            Luxe.renderer.state.bindTexture2D(texture);
            GL.texImage2D(GL.TEXTURE_2D, 0, GL.RGBA, width, height, 0, GL.RGBA, GL.UNSIGNED_BYTE, data);

            data = null;

        }

    } //unlock

    public override function drop() {

        super.drop();
        destroy();

    } //drop

    public function activate(att) { }

    public function destroy() {

        GL.deleteTexture(texture);
        data = null;

    } //destroy


    function _set_clamp( _clamp : ClampType ) {

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

    } //_set_clamp

    function set_clamp( _clamp : ClampType ) {

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

    } //set_clamp

    function _set_filter( _filter : FilterType ) {

        switch(_filter) {

            case FilterType.linear:
                GL.texParameteri(GL.TEXTURE_2D, GL.TEXTURE_MIN_FILTER, GL.LINEAR);
                GL.texParameteri(GL.TEXTURE_2D, GL.TEXTURE_MAG_FILTER, GL.LINEAR);

            case FilterType.nearest:
                GL.texParameteri(GL.TEXTURE_2D, GL.TEXTURE_MIN_FILTER, GL.NEAREST);
                GL.texParameteri(GL.TEXTURE_2D, GL.TEXTURE_MAG_FILTER, GL.NEAREST);

        //mip filters
            case FilterType.mip_nearest_nearest:
                GL.texParameteri(GL.TEXTURE_2D, GL.TEXTURE_MIN_FILTER, GL.NEAREST_MIPMAP_NEAREST);
                GL.texParameteri(GL.TEXTURE_2D, GL.TEXTURE_MAG_FILTER, GL.NEAREST_MIPMAP_NEAREST);
            case FilterType.mip_linear_nearest:
                GL.texParameteri(GL.TEXTURE_2D, GL.TEXTURE_MIN_FILTER, GL.LINEAR_MIPMAP_NEAREST);
                GL.texParameteri(GL.TEXTURE_2D, GL.TEXTURE_MAG_FILTER, GL.LINEAR_MIPMAP_NEAREST);
            case FilterType.mip_nearest_linear:
                GL.texParameteri(GL.TEXTURE_2D, GL.TEXTURE_MIN_FILTER, GL.NEAREST_MIPMAP_LINEAR);
                GL.texParameteri(GL.TEXTURE_2D, GL.TEXTURE_MAG_FILTER, GL.NEAREST_MIPMAP_LINEAR);
            case FilterType.mip_linear_linear:
                GL.texParameteri(GL.TEXTURE_2D, GL.TEXTURE_MIN_FILTER, GL.LINEAR_MIPMAP_LINEAR);
                GL.texParameteri(GL.TEXTURE_2D, GL.TEXTURE_MAG_FILTER, GL.LINEAR_MIPMAP_LINEAR);

        } //switch _filter

    } //set_filter

    function _set_filter_min( _filter : FilterType ) {

        switch(_filter) {

            case FilterType.linear:
                GL.texParameteri(GL.TEXTURE_2D, GL.TEXTURE_MIN_FILTER, GL.LINEAR);
            case FilterType.nearest:
                GL.texParameteri(GL.TEXTURE_2D, GL.TEXTURE_MIN_FILTER, GL.NEAREST);

        //mip filters
            case FilterType.mip_nearest_nearest:
                GL.texParameteri(GL.TEXTURE_2D, GL.TEXTURE_MIN_FILTER, GL.NEAREST_MIPMAP_NEAREST);
            case FilterType.mip_linear_nearest:
                GL.texParameteri(GL.TEXTURE_2D, GL.TEXTURE_MIN_FILTER, GL.LINEAR_MIPMAP_NEAREST);
            case FilterType.mip_nearest_linear:
                GL.texParameteri(GL.TEXTURE_2D, GL.TEXTURE_MIN_FILTER, GL.NEAREST_MIPMAP_LINEAR);
            case FilterType.mip_linear_linear:
                GL.texParameteri(GL.TEXTURE_2D, GL.TEXTURE_MIN_FILTER, GL.LINEAR_MIPMAP_LINEAR);

        } //switch _filter

    } //set_filter_min

    function _set_filter_mag( _filter : FilterType ) {

        switch(_filter) {

            case FilterType.linear:
                GL.texParameteri(GL.TEXTURE_2D, GL.TEXTURE_MAG_FILTER, GL.LINEAR);
            case FilterType.nearest:
                GL.texParameteri(GL.TEXTURE_2D, GL.TEXTURE_MAG_FILTER, GL.NEAREST);

        //mip filters
            case FilterType.mip_nearest_nearest:
                GL.texParameteri(GL.TEXTURE_2D, GL.TEXTURE_MAG_FILTER, GL.NEAREST_MIPMAP_NEAREST);
            case FilterType.mip_linear_nearest:
                GL.texParameteri(GL.TEXTURE_2D, GL.TEXTURE_MAG_FILTER, GL.LINEAR_MIPMAP_NEAREST);
            case FilterType.mip_nearest_linear:
                GL.texParameteri(GL.TEXTURE_2D, GL.TEXTURE_MAG_FILTER, GL.NEAREST_MIPMAP_LINEAR);
            case FilterType.mip_linear_linear:
                GL.texParameteri(GL.TEXTURE_2D, GL.TEXTURE_MAG_FILTER, GL.LINEAR_MIPMAP_LINEAR);
        } //switch _filter

    } //set_filter_min

    function set_filter( _filter : FilterType ) {

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

    } //set_filter

    function set_filter_min( _filter : FilterType ) {

        if(loaded == false) {
            onload = function(t) {
                bind();
                _set_filter_min(_filter);
            }
        } else {
            bind();
            _set_filter_min(_filter);
        }

        return filter_min = _filter;

    } //set_filter_min

    function set_filter_mag( _filter : FilterType ) {

        if(loaded == false) {
            onload = function(t) {
                bind();
                _set_filter_mag(_filter);
            }
        } else {
            bind();
            _set_filter_mag(_filter);
        }

        return filter_mag = _filter;

    } //set_filter_mag

    // static var lime_bitmap_data_from_bytes  = Libs.load("lime", "lime_bitmap_data_from_bytes", 2);
    // static var lime_bitmap_data_height      = Libs.load("lime", "lime_bitmap_data_height", 1);
    // static var lime_bitmap_data_width       = Libs.load("lime", "lime_bitmap_data_width", 1);
    // static var lime_bitmap_data_get_pixels  = Libs.load("lime", "lime_bitmap_data_get_pixels", 2);


} //Texture
