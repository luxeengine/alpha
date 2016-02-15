package phoenix;

import snow.api.Promise;
import snow.systems.assets.Asset;
import snow.modules.opengl.GL;

import snow.api.buffers.Uint8Array;
import snow.api.buffers.ArrayBufferView;
import snow.api.buffers.ArrayBuffer;

import phoenix.Color;
import phoenix.Vector;

import luxe.Resources;
import luxe.resource.Resource;
import luxe.options.ResourceOptions;
import snow.types.Types.Error;

import luxe.Log.*;

class Texture extends Resource {

//Static flags

    public static var default_filter: FilterType = FilterType.linear;
    public static var default_clamp: ClampType = ClampType.edge;

//Members

        /** Which texture slot this texture would be assigned to when bound. */
    public var slot : Int = 0;
        /** Only used when submitting to the GPU, where supported. */
    public var border : Int = 0;
        /** The GPU texture ID */
    public var texture : TextureID;
        /** The GPU texture format, i.e `GL.RGBA` or similar. */
    public var format : TextureFormat;
        /** The GPU texture type, i.e `GL.TEXTURE_2D` or similar. */
    public var type : TextureType;
        /** The GPU data type, i.e `GL.UNSIGNED_BYTE` or similar. */
    public var data_type : TextureDataType;
        /** If true, the pixels buffer should store compressed image format data that the GPU understands. */
    public var compressed : Bool = false;

        /** The width of the actual texture, used for example when the texture may be padded to POT sizes. */
    public var width_actual : Int = -1;
        /** The height of the actual texture, used for example when the texture may be padded to POT sizes. */
    public var height_actual : Int = -1;
        /** The width of the texture */
    public var width : Int = -1;
        /** The height of the texture */
    public var height : Int = -1;

        /** Set the minification filter type */
    @:isVar public var filter_min   (default,set) : FilterType;
        /** Set the magnification filter type */
    @:isVar public var filter_mag   (default,set) : FilterType;
        /** Sets the S (horizontal) clamp type */
    @:isVar public var clamp_s      (default,set) : ClampType;
        /** Sets the T (vertical) clamp type */
    @:isVar public var clamp_t      (default,set) : ClampType;

        /** If true, only when (re)loading from an asset id,
            the pixels will be premultiplied by their alpha before
            submit is called.  */
    var load_premultiply_alpha : Bool = false;

    public function new( _options:TextureOptions ) {

        assertnull(_options, 'Texture create requires non-null options');

        def(_options.resource_type, ResourceType.texture);

        super( _options );

        //texture id must be first, followed by bind

        def(_options.texture, create_texture_id());

        texture = _options.texture;

        bind();

        apply_default_options(_options);

            //pixels require width and height
        if(_options.pixels != null) {
            assertnull(_options.width, 'Texture create with pixels requires both width and height');
            assertnull(_options.height, 'Texture create with pixels requires both width and height');
        }

        if(_options.width != null || _options.height != null) {

                //width requires height and vice versa
            assertnull(_options.height, 'Texture requires both width and height, only width was given in construct options');
            assertnull(_options.width, 'Texture requires both width and height, only height was given in construct options');

            width = width_actual = _options.width;
            height = height_actual = _options.height;

            if(_options.pixels != null) {
                submit(_options.pixels);
            }

        } //width/height not null


    } //new

        /** Returns the estimated memory usage of this Texture, in bytes. */
    override public function memory_use() {

            //:todo: not force 4 bpp
        return (width_actual * height_actual * 4);

    } //memory_use


        /** Fetch the pixels from the texture id, storing them in the provided array buffer view.
            Returns image pixels in RGBA format, as unsigned byte (0-255) values only.
            This means that the view must be `w * h * 4` in length, minimum.
            By default, x and y are 0, 0, and the texture `width` and `height`
            are used (not width_actual/height_actual) */
    public function fetch( _into:Uint8Array, ?_x:Int = 0, ?_y:Int = 0, ?_w:Int, ?_h:Int ) : Uint8Array {

        assertnull(_into, 'Texture fetch requires a valid buffer to store the pixels.');

        def(_x, 0);
        def(_y, 0);
        def(_w, width);
        def(_h, height);

        var _required = _w * _h * 4;

        assert( _into.length >= _required, 'Texture fetch requires at least $_required (w * h * 4) bytes for the pixels, you have ${_into.length}!' );

            //GL ES/WebGL spec doesn't include `glGetTexImage`,
            //but we can read the pixels from a temporary frame buffer (render texture) instead
            //This way works on all targets the same.

        var fb = GL.createFramebuffer();

        GL.bindFramebuffer(GL.FRAMEBUFFER, fb);
        GL.framebufferTexture2D(GL.FRAMEBUFFER, GL.COLOR_ATTACHMENT0, GL.TEXTURE_2D, texture, 0);

        assert(GL.checkFramebufferStatus(GL.FRAMEBUFFER) == GL.FRAMEBUFFER_COMPLETE);

            GL.readPixels(_x, _y, _w, _h, GL.RGBA, GL.UNSIGNED_BYTE, _into);

        GL.bindFramebuffer(GL.FRAMEBUFFER, null);
        GL.deleteFramebuffer(fb);
        fb = null;

        return _into;

    } //fetch

        /** Submit a pixels array to the texture id. Must match the type and format accordingly. */
    public function submit( _pixels:ArrayBufferView, ?_target:TextureSubmitTarget, ?_level:Int = 0 ) {

        assert(_level >= 0, 'Texture submit level cannot be negative');

        var _max = max_size();

        assert(width_actual <= _max, 'Texture actual width bigger than maximum hardware size (width:$width_actual, max:$_max)');
        assert(height_actual <= _max, 'Texture actual height bigger than maximum hardware size (height:$height_actual, max:$_max)');

        bind();

        if(type == TextureType.tex_2D) {
            def(_target, TextureSubmitTarget.tex_2D);
        } else {
            assertnull(_target, 'Texture submit to a non 2D texture requires the _target to be specified');
        }

        if(compressed) {
            GL.compressedTexImage2D(_target, _level, format, width_actual, height_actual, border, _pixels);
        } else {
            GL.texImage2D(_target, _level, format, width_actual, height_actual, border, format, data_type, _pixels );
        }

    } //submit

        /** Generates mipmaps for this texture. */
    public function generate_mipmaps() {

        bind();
        GL.generateMipmap(type);

    } //generate_mipmaps

        /** Bind this texture to the it's active texture slot,
            and it's texture id to the texture type. Calling this
            repeatedly is fine, as the state is tracked by
            the RenderState. */
    public function bind() {

        Luxe.renderer.state.activeTexture( GL.TEXTURE0+slot );
        Luxe.renderer.state.bindTexture( type, texture );

    } //bind

//Resource overrides

        /** Reloads this texture from it's id - only a valid call if the id is a image asset resource. */
    override public function reload() : Promise {

        assert(state != ResourceState.destroyed, 'Resource cannot reload when already destroyed');

        clear();

        return new Promise(function(resolve, reject) {

            state = ResourceState.loading;

            var get = Luxe.snow.assets.image(id);

            get.then(function(_asset:AssetImage) {

                texture = create_texture_id();

                from_asset(_asset);

                state = ResourceState.loaded;
                resolve(this);

            }); //then

            get.error(function(_error) {

                state = ResourceState.failed;
                reject(_error);

            });

        }); //promise

    } //reload

    function from_asset(_asset:AssetImage, _clear_asset:Bool=true) {

        dump_asset_info( _asset );

        width = _asset.image.width;
        height = _asset.image.height;
        width_actual = _asset.image.width_actual;
        height_actual = _asset.image.height_actual;

        if(load_premultiply_alpha) {
            Luxe.utils.premultiply_alpha(_asset.image.pixels);
        }

        submit( _asset.image.pixels );

        if(_clear_asset) {
            _asset.image.pixels = null;
            _asset = null;
        }

        apply_props();

    } //from_asset

    override function clear() {

        if(texture != null) {
            GL.deleteTexture(texture);
        }

    } //clear

//Internal

        //:todo:refactor:gl:
    function create_texture_id() {

        return GL.createTexture();

    } //create_texture_id

    inline function apply_props() {

        apply_filter(filter_min, FilterSlot.min_filter);
        apply_filter(filter_mag, FilterSlot.mag_filter);
        apply_clamp(clamp_s, ClampSlot.wrap_s);
        apply_clamp(clamp_t, ClampSlot.wrap_t);

    } //apply_props

    function apply_default_options( _options:TextureOptions ) {

        //texture properties

            load_premultiply_alpha = def(_options.load_premultiply_alpha, false);
            compressed = def(_options.compressed, false);
            format = def(_options.format, GL.RGBA);
            type = def(_options.type, GL.TEXTURE_2D);
            data_type = def(_options.data_type, GL.UNSIGNED_BYTE);

        //properties

            //filter
                filter_min = def(_options.filter_min, default_filter);
                filter_mag = def(_options.filter_mag, default_filter);

            //clamp
                clamp_s = def(_options.clamp_s, default_clamp);
                clamp_t = def(_options.clamp_t, default_clamp);

    } //apply_default_options


        /** Return the maximum size of a texture from the hardware */
    public static function max_size() : Int return GL.getParameter(GL.MAX_TEXTURE_SIZE);

        //:todo: not be a weird static function
    static inline function dump_asset_info(_asset:AssetImage) {

        _debug('Texture Asset id: '         + _asset.image.id);
        _debug('\t image.bpp: '             + _asset.image.bpp);
        _debug('\t image.bpp_source: '      + _asset.image.bpp_source);
        _debug('\t image.pixels.length: '   + _asset.image.pixels.length);
        _debug('\t image.height: '          + _asset.image.height);
        _debug('\t image.height_actual: '   + _asset.image.height_actual);
        _debug('\t image.width: '           + _asset.image.width);
        _debug('\t image.width_actual: '    + _asset.image.width_actual);

    } //dump_asset_info

//Properties

    function set_clamp_s( _clamp:ClampType ) {

        bind();

        apply_clamp(_clamp, ClampSlot.wrap_s);

        return clamp_s = _clamp;

    } //set_clamp_s

    function set_clamp_t( _clamp:ClampType ) {

        bind();

        apply_clamp(_clamp, ClampSlot.wrap_t);

        return clamp_t = _clamp;

    } //set_clamp_t

    function set_filter_min( _filter : FilterType ) {

        bind();

        apply_filter(_filter, FilterSlot.min_filter);

        return filter_min = _filter;

    } //set_filter_min

    function set_filter_mag( _filter : FilterType ) {

        bind();

        apply_filter(_filter, FilterSlot.mag_filter);

        return filter_mag = _filter;

    } //set_filter_mag

//Internal helpers, :todo:refactor:gl:

    inline function apply_clamp( _clamp:ClampType, _type:ClampSlot ) {

        GL.texParameteri(type, _type, _clamp);

    } //apply_clamp

    inline function apply_filter( _filter:FilterType, _type:FilterSlot ) {

        GL.texParameteri(type, _type, _filter);

    } //apply_filter

    override function toString() {

        var _type = type_name(type);
        var _filter_min = filter_name(filter_min);
        var _filter_mag = filter_name(filter_mag);
        var _clamp_s = clamp_name(clamp_s);
        var _clamp_t = clamp_name(clamp_t);

        var _filter = 'filter(min: $_filter_min, mag:$_filter_mag)';
        var _clamp = 'clamp(s: $_clamp_t, t: $_clamp_t)';
        var _width = 'size(size: ${width}x${height}, actual: ${width_actual}x${height_actual})';

        return 'Texture(id: $id, tex: $texture, type:$_type, $_width $_filter $_clamp )';

    } //toString

    static function type_name(_type:TextureType) {
        return switch(_type) {
            case TextureType.tex_2D: 'tex_2D';
            case TextureType.tex_cube: 'tex_cube';
        }
    }

    static function filter_name(_filter:FilterType) {
        return switch(_filter) {
            case FilterType.linear:              'linear';
            case FilterType.nearest:             'nearest';
            case FilterType.mip_linear_linear:   'mip_linear_linear';
            case FilterType.mip_linear_nearest:  'mip_linear_nearest';
            case FilterType.mip_nearest_linear:  'mip_nearest_linear';
            case FilterType.mip_nearest_nearest: 'mip_nearest_nearest';
        }
    } //filter_name

    static function clamp_name(_clamp:ClampType) {
        return switch(_clamp) {
            case ClampType.edge:    'edge';
            case ClampType.repeat:  'repeat';
            case ClampType.mirror:  'mirror';
        }
    } //clamp_name

} //Texture


//General Texture specific types,
//initial abstraction out GL specifics


    typedef TextureID = GLTexture;
    typedef TextureFormat = Int;
    typedef TextureDataType = Int;

    @:enum abstract TextureType(Int) from Int to Int {

        var tex_2D = GL.TEXTURE_2D;
        var tex_cube = GL.TEXTURE_CUBE_MAP;
        //:future: var tex_3D = 0x806F; //GL.TEXTURE_3D;

    } //TextureType

    @:enum abstract TextureSubmitTarget(Int) from Int to Int {

        var tex_2D          = GL.TEXTURE_2D;

        var cube_plus_x     = GL.TEXTURE_CUBE_MAP_POSITIVE_X;
        var cube_plus_y     = GL.TEXTURE_CUBE_MAP_POSITIVE_Y;
        var cube_plus_z     = GL.TEXTURE_CUBE_MAP_POSITIVE_Z;

        var cube_minus_x    = GL.TEXTURE_CUBE_MAP_NEGATIVE_X;
        var cube_minus_y    = GL.TEXTURE_CUBE_MAP_NEGATIVE_Y;
        var cube_minus_z    = GL.TEXTURE_CUBE_MAP_NEGATIVE_Z;

    } //TextureSubmitTarget

    @:enum abstract FilterType(Int) from Int to Int {

        var nearest = GL.NEAREST;
        var linear = GL.LINEAR;
        var mip_nearest_nearest = GL.NEAREST_MIPMAP_NEAREST;
        var mip_linear_nearest = GL.LINEAR_MIPMAP_NEAREST;
        var mip_nearest_linear = GL.NEAREST_MIPMAP_LINEAR;
        var mip_linear_linear = GL.LINEAR_MIPMAP_LINEAR;

    } //FilterType

    @:enum abstract ClampType(Int) from Int to Int {

        var edge = GL.CLAMP_TO_EDGE;
        var repeat = GL.REPEAT;
        var mirror = GL.MIRRORED_REPEAT;

    } //ClampType


//Private Texture types

    @:enum private abstract ClampSlot(Int) from Int to Int {
        var wrap_s = GL.TEXTURE_WRAP_S;
        var wrap_t = GL.TEXTURE_WRAP_T;
        //:future: var wrap_r = GL.TEXTURE_WRAP_R;
    }

    @:enum private abstract FilterSlot(Int) from Int to Int {
        var min_filter = GL.TEXTURE_MIN_FILTER;
        var mag_filter = GL.TEXTURE_MAG_FILTER;
    }
