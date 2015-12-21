package luxe;

import luxe.Log.*;
import luxe.resource.Resource;
import luxe.Parcel;
import luxe.options.ResourceOptions;
import phoenix.Texture;
import phoenix.BitmapFont;
import phoenix.Shader;
import snow.api.Promise;

class Resources {

        /** The Parcel set that this system contains. */
    public var parcels : Array<Parcel>;
        /** The resource cache, stored by `Resource` id.
            All resources in a `Parcel` contained by this system, will be here. */
    public var cache: Map<String, Resource>;

        /** General statistics about this system. */
    public var stats : ResourceStats;

//Internal vars

    @:allow(luxe.Parcel)
    var emitter: Emitter<ResourceEvent>;

//

    public function new() {
        parcels = [];
        emitter = new Emitter();
        cache = new Map();
        stats = new ResourceStats();
    }

//Public `Parcel` tracking

    public function track(_cache:Parcel) {

        assertnull(_cache);
        assert(parcels.indexOf(_cache) == -1);

        parcels.push(_cache);
        emit(ResourceEvent.cache_tracked, _cache);

    } //track

    public function untrack(_cache:Parcel) {

        assertnull(_cache);

        var removed = parcels.remove(_cache);

        if(removed) {
            emit(ResourceEvent.cache_untracked, _cache);
        }

    } //untrack

//Public Resource list

        /** Add a resource to be tracked by this system. */
    public function add(resource:Resource) {

        assert(!cache.exists(resource.id));

        cache.set(resource.id, resource);

        emit(ResourceEvent.listed, resource);

        update_stats(resource, 1);

    } //add

        /** Remove a resource being tracked by this system. */
    public function remove(resource:Resource #if luxe_resource_pos, ?_pos:haxe.PosInfos #end) : Bool {

        assert(cache.exists(resource.id));

        emit(ResourceEvent.unlisted, resource);

        update_stats(resource, -1);

        return cache.remove(resource.id);

    } //remove

        /** Destroy a resource by id. Returns false if the resource wasn't found. */
    public function destroy(_id:String, ?_force:Bool=false) : Bool {

        var resource = get(_id);

        if(resource == null) return false;

        resource.destroy(_force);

        return true;

    } //destroy

        /** Invalidate a resource by id. Returns false if the resource wasn't found. */
    public function invalidate(_id:String) : Bool {

        var resource = get(_id);

        if(resource == null) return false;

        resource.invalidate();

        return true;

    } //invalidate

//Public event handling

    public function on<T>(ev:ResourceEvent, handler:T->Void) {

        emitter.on(ev, handler);

    } //on

    public function off<T>(ev:ResourceEvent, handler:T->Void) {

        emitter.off(ev, handler);

    } //off

    public function emit<T>(ev:ResourceEvent, data:T) {

        emitter.emit(ResourceEvent.any, data);
        emitter.emit(ev, data);

    } //emit


//Public load api

    public function load_bytes(_id:String) : Promise {

        assertnull(_id);

        var _resource = bytes(_id);

        if(_resource != null) {
            _debug('bytes / existed / $_id');
            _resource.ref++;
            return Promise.resolve(_resource);
        }

        _debug('bytes / loading / $_id');

        _resource = new BytesResource({
            id: _id,
            system: this,
            asset: null
        });

        add(_resource);

        return _resource.reload();

    } //load_bytes

    public function load_text(_id:String) : Promise {

        assertnull(_id);

        var _resource = text(_id);

        if(_resource != null) {
            _debug('text / existed / $_id');
            _resource.ref++;
            return Promise.resolve(_resource);
        }

        _debug('text / loading / $_id');

        _resource = new TextResource({
            id: _id,
            system: this,
            asset: null
        });

        add(_resource);

        return _resource.reload();

    } //load_text

    public function load_json(_id:String) : Promise {

        assertnull(_id);

        var _resource = json(_id);

        if(_resource != null) {
            _debug('json / existed / $_id');
            _resource.ref++;
            return Promise.resolve(_resource);
        }

        _debug('json / loading / $_id');

        _resource = new JSONResource({
            id: _id,
            system: this,
            asset: null
        });

        add(_resource);

        return _resource.reload();

    } //load_json

    public function load_texture(_id:String, ?_options:LoadTextureOptions) : Promise {

        assertnull(_id);

        var _resource = texture(_id);

        if(_resource != null) {
            _debug('texture / existed / $_id');
            _resource.ref++;
            return Promise.resolve(_resource);
        }

        _debug('texture / loading / $_id');

        //options

            var _filter_min = null;
            var _filter_mag = null;
            var _clamp_s = null;
            var _clamp_t = null;
            var _premultiply = null;

            if(_options != null) {
                _filter_min  = _options.filter_min;
                _filter_mag  = _options.filter_mag;
                _clamp_s     = _options.clamp_s;
                _clamp_t     = _options.clamp_t;
                _premultiply = _options.load_premultiply_alpha;
            }

        _resource = new Texture({
            id: _id,
            system: this,
            filter_min: _filter_min,
            filter_mag: _filter_mag,
            clamp_s: _clamp_s,
            clamp_t: _clamp_t,
            load_premultiply_alpha: _premultiply
        });

        add(_resource);

        return _resource.reload();

    } //load_texture

    public function load_font(_id:String, ?_options:LoadFontOptions) : Promise {

        assertnull(_id);

        var _resource = font(_id);

        if(_resource != null) {
            _debug('font / existed / $_id');
            _resource.ref++;
            return Promise.resolve(_resource);
        }

        _debug('font / loading / $_id');

        var _texture_path = null;
        if(_options != null) {
            _texture_path = _options.texture_path;
        }

        _resource = new BitmapFont({
            id: _id,
            system: this,
            texture_path: _texture_path
        });

        add(_resource);

        return _resource.reload();

    } //load_font

    public function load_shader(_id:String, _options:LoadShaderOptions) : Promise {

        assertnull(_id);

        var _resource = shader(_id);

        if(_resource != null) {
            _debug('shader / existed / $_id');
            _resource.ref++;
            return Promise.resolve(_resource);
        }

        _debug('shader / loading / $_id');

        _resource = new Shader({
            id: _id,
            system: this,
            frag_id: _options.frag_id,
            vert_id: _options.vert_id
        });

        add(_resource);

        return _resource.reload();

    } //load_shader


    public function load_audio(_id:String, ?_options:LoadAudioOptions) : Promise {

        assertnull(_id);

        var _resource = audio(_id);

        if(_resource != null) {
            _debug('audio / existed / $_id');
            _resource.ref++;
            return Promise.resolve(_resource);
        }

        _debug('audio / loading / $_id');

        var _is_stream = false;
        if(_options != null) {
            _is_stream = _options.is_stream;
        }

        _resource = new AudioResource({
            id: _id,
            system: this,
            asset: null,
            is_stream: _is_stream
        });

        add(_resource);

        return _resource.reload();

    } //load_audio

//Public fetch API

    public inline function has      (_id:String) : Bool           return cache.exists(_id);
    public inline function get      (_id:String) : Resource       return fetch(_id);
    public inline function bytes    (_id:String) : BytesResource  return fetch(_id);
    public inline function text     (_id:String) : TextResource   return fetch(_id);
    public inline function json     (_id:String) : JSONResource   return fetch(_id);
    public inline function texture  (_id:String) : Texture        return fetch(_id);
    public inline function font     (_id:String) : BitmapFont     return fetch(_id);
    public inline function shader   (_id:String) : Shader         return fetch(_id);
    public inline function audio    (_id:String) : AudioResource  return fetch(_id);

//Internal

    inline function fetch<T>(_id:String) : T {
        return cast cache.get(_id);
    } //fetch

    inline function update_stats(_res:Resource, _offset:Int) {

        switch(_res.resource_type) {
            case ResourceType.unknown:          stats.unknown   += _offset;
            case ResourceType.bytes:            stats.bytes     += _offset;
            case ResourceType.text:             stats.texts     += _offset;
            case ResourceType.json:             stats.jsons     += _offset;
            case ResourceType.texture:          stats.textures  += _offset;
            case ResourceType.render_texture:   stats.rtt       += _offset;
            case ResourceType.font:             stats.fonts     += _offset;
            case ResourceType.shader:           stats.shaders   += _offset;
            case ResourceType.audio:            stats.audios    += _offset;
        }

        stats.total += _offset;

    }

} //Resources



/** The state a resource can be in. The state is
    mutually exclusive (only one at a time), and states
    that lead to other states should always change in a fixed order.
    In other words, state can never go from unknown to loaded, without
    first passing through listed and loading. */
@:enum abstract ResourceState(Int) from Int to Int {
    //
        /** This resource id is not known to the system,
            either it wasn't added or was subsequently removed */
    var unknown     = 0;

        /** This id is known, but is not loaded.
            unloaded resources go back to this state unless removed. */
    var listed      = 1;

        /** The resource is pending a load completion or timeout. */
    var loading     = 2;

        /** The resource is loaded and stored for query/fetching. */
    var loaded      = 3;

        /** The resource has failed to be created. */
    var failed      = 4;

        /** The resource has been invalidated, either manually or
            from an event (change on disk, graphics context lost, etc)
            and needs to be reloaded from the source data if desired. */
    var invalidated = 5;

        /** The resource has been destroyed. If the asset is in this
            state it should not be considered for reuse and will assert on use it */
    var destroyed   = 6;

} //ResourceState

@:enum abstract ResourceEvent(Int) from Int to Int {

    var unknown             = 0;
    var any                 = 1;
    var listed              = 2;
    var loading             = 3;
    var loaded              = 4;
    var failed              = 5;
    var invalidated         = 6;
    var unlisted            = 7;
    var destroyed           = 8;
    var reference           = 9;
    var dereference         = 10;
    var cache_tracked       = 11;
    var cache_untracked     = 12;

} //ResourceEvent


@:enum
abstract ResourceType(Int) from Int to Int {
    var unknown         = 0;
    var text            = 1;
    var json            = 2;
    var bytes           = 3;
    var texture         = 4;
    var render_texture  = 5;
    var font            = 6;
    var shader          = 7;
    var audio           = 8;
}


class ResourceStats {

    public var total : Int = 0;
    public var fonts : Int = 0;
    public var textures : Int = 0;
    public var rtt : Int = 0;
    public var shaders : Int = 0;
    public var texts : Int = 0;
    public var jsons : Int = 0;
    public var bytes : Int = 0;
    public var audios : Int = 0;
    public var unknown : Int = 0;

    public function new() {

    } //new

    function toString() {

        return
            'Resource Statistics\n' +
            '\ttotal : ' + total + '\n' +
            '\ttexture : ' + textures + ' \n' + '' +
            '\trender texture : ' + rtt + ' \n' +
            '\tfont : ' + fonts + '\n' +
            '\tshader : ' + shaders + '\n' +
            '\ttext : ' + texts + '\n' +
            '\tjson : ' + jsons + '\n' +
            '\tbytes : ' + bytes + '\n' +
            '\taudios : ' + audios + '\n' +
            '\tunknown : ' + unknown;

    } //toString

    public function reset() {

        total = 0;
        fonts = 0;
        textures = 0;
        rtt = 0;
        shaders = 0;
        texts = 0;
        jsons = 0;
        bytes = 0;
        audios = 0;
        unknown = 0;

    } //reset


} //ResourceStats
