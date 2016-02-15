package luxe.resource;

import luxe.Log.*;
import luxe.options.ResourceOptions;
import luxe.Resources;

import snow.api.Promise;
import snow.systems.assets.Asset;
import snow.systems.audio.AudioSource;

class Resource {

    /**     The unique resource ID.
            If the resource is loaded from disk, this matches the asset id.
            If not from disk, the id can be anything but must be unique to this resource. */
    public var id: String;
        /** The resource system that contains this Resource. */
    public var system: Resources;
        /** The resource type ID. Defaults use ResourceType ids but is typed Int for user id's. */
    public var resource_type: Int;
        /** The state this resource is currently in. */
    public var state (default, set): ResourceState;

        /** The reference count of this resource. Each time a
            `load_*` call is made on the resource system, it increments
            the count specific to that resource. When a resource calls
            `destroy()` it decreases by one. When the ref count is 0, and the
            resource is destroyed, it's properly destroyed.
            This works via setter, so changing it with ref++ and ref-- is ok. */
    public var ref (default, set): Int = 0;

    public function new( _options:ResourceOptions ) {

        assertnull(_options);
        assertnull(_options.id);

        def(_options.system, Luxe.resources);
        def(_options.resource_type, ResourceType.unknown);

        id = _options.id;
        system = _options.system;
        resource_type = _options.resource_type;
        state = ResourceState.unknown;
        ref = 1;

    } //new

        /** Destroys the resource, unlisting it, cleaning up it's resource usage.
            Once destroyed, it is no longer valid and should not be used in any way.
            To clean up without destroying the resource, use invalidate().
            To force destroying and ignore the ref counting, pass true for `force` flag. */
    public function destroy( ?_force:Bool=false ) : Void {

        assert(state != ResourceState.destroyed);

        if(!_force) {
            assert(ref > 0);
            ref--;
            assert(ref >= 0);
        }

        _debug('destroy / $id  / ref $ref');

        if(ref == 0 || _force) {

            clear();
            state = destroyed;
            system.remove(this);
            system.emit(destroyed, this);

        } //no refs || force

    } //destroy

        /** Invalidates and frees up any resource usage held.
            The resource instance remains valid for use, and remains listed in the resource cache. */
    public function invalidate() : Void {

        assert(state != ResourceState.destroyed);

        clear();
        state = invalidated;
        system.emit(invalidated, this);

    }

        /** Returns a promise for the reloaded resource.
            Returns null from the base `Resource` type, implemented in subclasses. */
    public function reload() : Promise {
        return null;
    }

        /** Returns the estimated memory use by this resource, in bytes.
            You can use Luxe.utils.bytes_to_string to display this value easily.
            Some resources return 0, in the case of not being able to give an estimate. */
    public function memory_use() : Float {
        return 0;
    } //memory_use

 //Internal

    function set_ref( _ref:Int ) {

        var pre = ref;
        ref = _ref;

        if(ref > pre) {
            system.emit(ResourceEvent.reference, this);
        } else if(ref < pre) {
            system.emit(ResourceEvent.dereference, this);
        }

        return ref;

    } //set_ref

    function set_state( _state:ResourceState ) {

        state = _state;

        switch(state) {
            case ResourceState.loading:
                system.emit(ResourceEvent.loading, this);
            case ResourceState.loaded:
                system.emit(ResourceEvent.loaded, this);
            case ResourceState.failed:
                system.emit(ResourceEvent.failed, this);
            case _:
        }

        return state;

    } //set_state

        /** Clean up any resource usage, freeing memory, removing references etc. */
    function clear() : Void {

    } //


    function state_string() {
        return switch(state) {
            case ResourceState.listed:      'listed';
            case ResourceState.loading:     'loading';
            case ResourceState.loaded:      'loaded';
            case ResourceState.failed:      'failed';
            case ResourceState.invalidated: 'invalidated';
            case ResourceState.destroyed:   'destroyed';
            case _:                         'unknown';
        }
    }

    function type_string() {
        return switch(resource_type) {
            case ResourceType.bytes:    'bytes';
            case ResourceType.text:     'text';
            case ResourceType.json:     'json';
            case ResourceType.texture:  'texture';
            case ResourceType.shader:   'shader';
            case ResourceType.font:     'font';
            case _: '$resource_type';
        }
    }

    function toString() {
        return 'Resource(`$id`, ${type_string()}, ${state_string()})';
    }


} //Resource


class BytesResource extends Resource {

    public var asset:AssetBytes;

    public function new( _options:BytesResourceOptions ) {

        assertnull(_options);

        _options.resource_type = ResourceType.bytes;

        super( _options );

        asset = _options.asset;

    } //new

    override function reload() : Promise {

        assert(state != ResourceState.destroyed);

        clear();

        return new Promise(function(resolve, reject) {

            state = ResourceState.loading;

            var get = Luxe.snow.assets.bytes(id);

            get.then(function(_asset:AssetBytes) {

                asset = _asset;
                state = ResourceState.loaded;
                resolve(this);

            });

            get.error(function(_error) {

                state = ResourceState.failed;
                reject(_error);

            });

        }); //promise

    } //reload

    override function clear() {

        if(asset != null) {
            asset.destroy();
            asset = null;
        }

    } //clear

    override function memory_use() {

        if(asset == null) return 0;

        return asset.bytes.byteLength;

    } //memory_use

} //BytesResource

class TextResource extends Resource {

    public var asset:AssetText;

    public function new( _options:TextResourceOptions ) {

        assertnull(_options);

        _options.resource_type = ResourceType.text;

        super( _options );

        asset = _options.asset;

    } //new

    override function reload() : Promise {

        assert(state != ResourceState.destroyed);

        clear();

        return new Promise(function(resolve, reject) {

            state = ResourceState.loading;

            var get = Luxe.snow.assets.text(id);

            get.then(function(_asset:AssetText) {

                asset = _asset;
                state = ResourceState.loaded;
                resolve(this);

            });

            get.error(function(_error) {

                state = ResourceState.failed;
                reject(_error);

            });

        }); //promise

    } //reload

    override function clear() {

        if(asset != null) {
            asset.destroy();
            asset = null;
        }

    } //clear

    override function memory_use() {

        if(asset == null) return 0;

        return asset.text.length;

    } //memory_use

} //TextResource

class JSONResource extends Resource {

    public var asset:AssetJSON;

    public function new( _options:JSONResourceOptions ) {

        assertnull(_options);

        _options.resource_type = ResourceType.json;

        super( _options );

        asset = _options.asset;

    } //new

    override function reload() : Promise {

        assert(state != ResourceState.destroyed);

        clear();

        return new Promise(function(resolve, reject) {

            state = ResourceState.loading;

            var get = Luxe.snow.assets.json(id);

            get.then(function(_asset:AssetJSON) {

                asset = _asset;
                state = ResourceState.loaded;
                resolve(this);

            });

            get.error(function(_error) {

                state = ResourceState.failed;
                reject(_error);

            });

        }); //promise

    } //reload

    override function clear() {

        if(asset != null) {
            asset.destroy();
            asset = null;
        }

    } //clear

} //JSONResource

class AudioResource extends Resource {

    public var asset:AssetAudio;
    public var source:AudioSource;

    var is_stream: Bool = false;

    public function new(_options:AudioResourceOptions) {

        assertnull(_options);

        _options.resource_type = ResourceType.audio;

        super( _options );

        asset = _options.asset;
        is_stream = def(_options.is_stream,false);
        
        if(asset != null) {
            source = new AudioSource(Luxe.snow, asset.audio);
        }

    } //new

    override function reload() : Promise {

        assert(state != ResourceState.destroyed);

        clear();

        return new Promise(function(resolve, reject) {

            state = ResourceState.loading;

            var get = Luxe.snow.assets.audio(id, is_stream);

            get.then(function(_asset:AssetAudio) {

                asset = _asset;
                source = new AudioSource(Luxe.snow, asset.audio);
                state = ResourceState.loaded;
                resolve(this);

            });

            get.error(function(_error) {

                state = ResourceState.failed;
                reject(_error);

            });

        }); //promise

    } //reload

    override function clear() {

        if(asset != null) {
            asset.destroy();
            asset = null;
        }

        if(source != null) {
            source.destroy();
            source = null;
        }

    } //clear

} //AudioResource
