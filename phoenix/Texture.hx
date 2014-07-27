package phoenix;

import snow.assets.AssetImage;
import snow.render.opengl.GL;
import snow.utils.UInt8Array;
import snow.utils.Libs;
import snow.utils.ArrayBuffer;

import phoenix.Color;
import phoenix.Vector;

import luxe.Resource;
import luxe.ResourceManager;

import luxe.Log._verbose;
import luxe.Log.log;

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
    public var asset : AssetImage;

    public var width_actual : Int = -1;
    public var height_actual : Int = -1;
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
        filter = FilterType.linear;
        clamp = ClampType.edge;

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
            if(f != null) {
                f(this);
            }
        }

        _onload_handlers.splice(0,_onload_handlers.length);

    } //do_onload

    public function toString() {
        return 'Texture (' + texture + ') ('+ width + 'x' + height +') real size('+ width_actual + 'x' + height_actual +') ' + filter + ' filtering. ' + clamp + ' clamp. id: ' + id;
    } //toString

    public function estimated_memory() {

        var _bytes = (width_actual * height_actual * 4);

        return Luxe.utils.bytes_to_string(_bytes);

    } //estimated_memory

    public function create_from_bytes_html(_asset_name:String, _asset_bytes, _width, _height ) {

        var max_size = GL.getParameter(GL.MAX_TEXTURE_SIZE);

        texture = GL.createTexture();

            //if no problems
        id = _asset_name;
        width = Std.int(_width);
        height = Std.int(_height);

        width_actual = width;
        height_actual = height;

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

    public static function load( _id:String, ?_onloaded:Texture->Void, ?_silent:Bool=false ) {

            //:todo:which resources
        var resources = Luxe.resources;

            //Check for existing texture in resource manager
        var _exists = resources.find_texture(_id);

        if(_exists != null) {

            _verbose("texture loaded (cached) " + _exists.id ) ;

            if(_onloaded != null) {
                _onloaded(_exists);
            }

            return _exists;

        } //_exists != null

        //if not found already, create a new Texture

        var texture : Texture = new Texture( resources );

            //append the onload handler
        if(_onloaded != null) {
            texture.onload = _onloaded;
        }

        var _asset = Luxe.core.app.assets.image(_id, {
            onload : function( asset:AssetImage ) {
                if(asset != null) {
                    texture.from_asset(asset);
                    texture.reset();
                    texture.do_onload();

                    if(!_silent) {
                        log("texture loaded " + texture.id + ' (' + texture.width + 'x' + texture.height + ') real size ('+ texture.width_actual + 'x' + texture.height_actual +')') ;
                    }

                }
            }
        });

        if(_asset != null) {

            texture.id = _id;

            resources.cache(texture);

            return texture;

        } //_asset != null

        return null;

    } //load


    public static function load_from_resource( _name:String, _width:Int, _height:Int, ?_cache:Bool = true ) {

        var texture_bytes : haxe.io.Bytes = haxe.Resource.getBytes(_name);

        if(texture_bytes != null) {

                //:todo: which resource manager...
            var resources = Luxe.renderer.resource_manager;
            var texture = new Texture(resources);

            var _asset = Luxe.core.app.assets.image(_name, {
                bytes:snow.utils.ByteArray.fromBytes(texture_bytes)
            });

            if(_asset != null) {

                texture.from_asset(_asset);

                texture_bytes = null;
                texture.reset();
                texture.do_onload();

                if(_cache) {
                    resources.cache(texture);
                }

                return texture;

            } //_asset != null

        } //texture_bytes != null

        return null;

    } //load_texture_from_resource_bytes

    function check_size() {

        var max_size = GL.getParameter(GL.MAX_TEXTURE_SIZE);

        if(asset.image.width_actual > max_size) throw "texture bigger than MAX_TEXTURE_SIZE (" + max_size + ") " + asset.id;
        if(asset.image.height_actual > max_size) throw "texture bigger than MAX_TEXTURE_SIZE (" + max_size + ") " + asset.id;

    } //check_size

        //create and submit the asset information to GL,
        //generating a valid id as well
    public function reset() {

            //Create the GL id
        texture = GL.createTexture();
            //Now we can bind it,
        bind();
            //And send GL the data
        GL.texImage2D(GL.TEXTURE_2D, 0, GL.RGBA, width, height, 0, GL.RGBA, GL.UNSIGNED_BYTE, asset.image.data );

            //Set the existing properties on the new texture
        _set_filter( filter );
        _set_clamp( clamp );

    } //reset

    public function from_asset( _asset:AssetImage ) {

        if(_asset == null) {
            throw "null asset passed to Texture.from_asset";
        }

            //store the asset for later use
        asset = _asset;

            //check for size limitations
        check_size();

            //Store the asset id as our resource id
        id = asset.id;

            //assign sizes
        width = asset.image.width;
        height = asset.image.height;
        width_actual = asset.image.width_actual;
        height_actual = asset.image.height_actual;

    } //from_asset

    public function generate_mipmaps() {

        onload = function(t) {
            //make it active
            bind();
            //Generate mipmaps
            GL.generateMipmap(GL.TEXTURE_2D);
        }

    } //generate_mipmaps

    public function bind() {
        Luxe.renderer.state.activeTexture( GL.TEXTURE0+slot );
        Luxe.renderer.state.bindTexture2D( texture );
    }

    public function get_pixel( _pos : Vector ) {

        if(asset.image.data == null) return null;

        var x : Int = Std.int(_pos.x);
        var y : Int = Std.int(_pos.y);

        return {
            r: asset.image.data[ (((y*width)+x)*4)  ]/255.0,
            g: asset.image.data[ (((y*width)+x)*4)+1]/255.0,
            b: asset.image.data[ (((y*width)+x)*4)+2]/255.0,
            a: asset.image.data[ (((y*width)+x)*4)+3]/255.0
        };

    } //get_pixel

    public function set_pixel( _pos:Vector, _color:Color ) {

        if(asset.image.data == null) return;

        var x : Int = Std.int(_pos.x);
        var y : Int = Std.int(_pos.y);

        asset.image.data[ (((y*width)+x)*4)  ] = Std.int(_color.r*255);
        asset.image.data[ (((y*width)+x)*4)+1] = Std.int(_color.g*255);
        asset.image.data[ (((y*width)+x)*4)+2] = Std.int(_color.b*255);
        asset.image.data[ (((y*width)+x)*4)+3] = Std.int(_color.a*255);

    } //set_pixel

    public function lock() {

        //:todo : this is related to glGetTexImage not in WebGL

        // data = new UInt8Array(new ArrayBuffer( width * height * 4));

        // glBindTexture(GL_TEXTURE_2D, texture);
        // glGetTexImage( GL_TEXTURE_2D , 0 , GL_RGBA , GL_UNSIGNED_BYTE, data );

        return true;
    }

    public function unlock() {

        if (asset.image.data != null) {

            Luxe.renderer.state.bindTexture2D(texture);
            GL.texImage2D(GL.TEXTURE_2D, 0, GL.RGBA, width, height, 0, GL.RGBA, GL.UNSIGNED_BYTE, asset.image.data);

            asset.image.data = null;

        }

    } //unlock

    public override function drop() {

        super.drop();
        destroy();

    } //drop

    public function activate(att) { }

    public function destroy() {

        GL.deleteTexture(texture);
        // asset.destroy(); :todo:

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

        if(clamp == null) {
            return clamp = _clamp;
        }

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

        if(filter == null) {
            return filter = _filter;
        }

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

} //Texture
