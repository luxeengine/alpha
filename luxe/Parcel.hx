package luxe;

import luxe.Emitter;
import luxe.Resources;
import luxe.resource.Resource;
import luxe.options.ResourceOptions;
import luxe.options.ParcelOptions;
import snow.api.Promise;
import phoenix.Texture;
import luxe.Log.*;

@:enum abstract ParcelEvent(Int) from Int to Int {
    var unknown = 0;
    var progress = 1;
    var complete = 2;
    var failed = 3;
}

typedef ParcelChange = {
    load_id: String,
    id: String,
    index: Int,
    total: Int,
    ? error: Dynamic,
    ? resource: Resource,
}

typedef ItemInfo = {
    id: String
}

typedef BytesInfo = ItemInfo;
typedef TextInfo = ItemInfo;
typedef JSONInfo = ItemInfo;

typedef TextureInfo = {
    > ItemInfo,
    > LoadTextureOptions,
}

typedef ShaderInfo = {
    > ItemInfo,
    > LoadShaderOptions,
}

typedef SoundInfo = {
    > ItemInfo,
    is_stream: Bool
}

typedef BitmapFontInfo = {
    > ItemInfo,
    > LoadFontOptions,
}

typedef ParcelList = {
    bytes: Array<BytesInfo>,
    texts: Array<TextInfo>,
    jsons: Array<JSONInfo>,
    textures: Array<TextureInfo>,
    fonts: Array<BitmapFontInfo>,
    shaders: Array<ShaderInfo>,
    sounds: Array<SoundInfo>,
}

@:enum abstract ParcelState(Int) from Int to Int {
    var unloaded = 0;
    var loading = 1;
    var loaded = 2;
}

class Parcel {

        /** The parent Resources system this Parcel is contained by. */
    public var system: Resources;
        /** The id of this `Parcel`. */
    public var id : String;
        /** The list of the resource infos within this parcel, used at load/unload time. */
    public var list: ParcelList;
        /** A list of resource ids that are loaded in this parcel, i.e that have a reference to the resource id */
    public var loaded: Array<String>;
        /** A list of resource ids that are known to this parcel */
    public var listed (get, never): Array<String>;
        /** Return the number of resources listed in this Parcel */
    public var length (get, never) : Int;
        /** The time in seconds the last load took */
    public var time_to_load : Float = 0.0;
        /** The current parcel state.
            Set to unloaded by default,
            changed to loading when calling `load`,
            changed to loaded when complete,
            changed to unloaded when `unload` completes */
    public var state : ParcelState;

    var emitter: Emitter<ParcelEvent>;
    var oncomplete: Parcel->Void;
    var onprogress: ParcelChange->Void;
    var onfailed: ParcelChange->Void;
    var start_load: Float = 0.0;
    var load_time_spacing: Float = 1/20;
    var load_start_delay: Float = 0.2;

    public function new( ?_options:ParcelOptions ) {

        def(_options, {});
        def(_options.system, Luxe.resources);
        def(_options.id, Luxe.utils.uniqueid());

        if(_options.oncomplete != null)         oncomplete = _options.oncomplete;
        if(_options.onprogress != null)         onprogress = _options.onprogress;
        if(_options.onfailed != null)           onfailed = _options.onfailed;

        if(_options.load_time_spacing != null)  load_time_spacing = _options.load_time_spacing;
        if(_options.load_start_delay != null)   load_start_delay = _options.load_start_delay;

        state = ParcelState.unloaded;
        loaded = [];
        emitter = new Emitter();
        system = _options.system;
        id = _options.id;
        list = empty_list();

            if(_options.bytes    != null) list.bytes    = _options.bytes;
            if(_options.texts    != null) list.texts    = _options.texts;
            if(_options.jsons    != null) list.jsons    = _options.jsons;
            if(_options.textures != null) list.textures = _options.textures;
            if(_options.fonts    != null) list.fonts    = _options.fonts;
            if(_options.shaders  != null) list.shaders  = _options.shaders;
            if(_options.sounds   != null) list.sounds   = _options.sounds;

        system.track(this);

    } //new

//Public event handling

    public function on<T>( ev:ParcelEvent, handler:T->Void ) emitter.on(ev, handler);
    public function off<T>( ev:ParcelEvent, handler:T->Void ) emitter.off(ev, handler);
    public function emit<T>( ev:ParcelEvent, data:T ) emitter.emit(ev, data);

//Public load API

    public inline function is_loaded( _id:String ) return loaded.indexOf(_id) != -1;

        /** Load this parcel contents with the optional load id, which is added to events. */
    public function load( ?_load_id:String ) {

        state = ParcelState.loading;

        Luxe.timer.schedule(load_start_delay, function() {

            start_load = Luxe.time;

            def(_load_id, id);

            _debug('$id / $_load_id / loading $length items');
            _debug('   bytes: ${list.bytes.length}');
            _debug('   texts: ${list.texts.length}');
            _debug('   jsons: ${list.jsons.length}');
            _debug('   textures: ${list.textures.length}');
            _debug('   fonts: ${list.fonts.length}');
            _debug('   shaders: ${list.shaders.length}');
            _debug('   sounds: ${list.sounds.length}');

            if(length == 0) {
                _debug('nothing to load: ${list.sounds.length}');
                do_complete(_load_id);
                return;
            }

            var _index = 0;

            inline function _handle(_item_id:String, _load:Promise) {
                _load.then(function(_res) {
                    one_loaded(_item_id, _load_id, _res, ++_index, length);
                }, function(_err:Dynamic){
                    one_failed(_item_id, _load_id, _err, ++_index, length);
                });
            }

            //bytes

                for(_bytes in list.bytes) {

                    if(!is_loaded(_bytes.id)) {

                        loaded.push(_bytes.id);
                        Luxe.timer.schedule(load_time_spacing, function() {

                            _handle( _bytes.id, system.load_bytes( _bytes.id ) );

                        }); //timer

                    } else { //!loaded
                        log('$id / already had ${_bytes.id} loaded, skipped');
                        one_loaded(_bytes.id, _load_id, system.get(_bytes.id), ++_index, length);
                    }

                } //each bytes

            //text

                for(_text in list.texts) {

                    if(!is_loaded(_text.id)) {

                        loaded.push(_text.id);
                        Luxe.timer.schedule(load_time_spacing*_index, function() {

                            _handle( _text.id, system.load_text( _text.id ) );

                        }); //timer

                    } else { //!loaded
                        log('$id / already had ${_text.id} loaded, skipped');
                        one_loaded(_text.id, _load_id, system.get(_text.id), ++_index, length);
                    }

                } //each texts

            //json

                for(_json in list.jsons) {

                    if(!is_loaded(_json.id)) {

                        loaded.push(_json.id);
                        Luxe.timer.schedule(load_time_spacing*_index, function() {

                            _handle( _json.id, system.load_json( _json.id ) );

                        });

                    } else { //!loaded
                        log('$id / already had ${_json.id} loaded, skipped');
                        one_loaded(_json.id, _load_id, system.get(_json.id), ++_index, length);
                    }

                } //each jsons

            //texture

                for(_texture in list.textures) {

                    if(!is_loaded(_texture.id)) {

                        loaded.push(_texture.id);
                        Luxe.timer.schedule(load_time_spacing*_index, function() {

                            var _load = system.load_texture( _texture.id, {
                                load_premultiply_alpha:_texture.load_premultiply_alpha,
                                filter_min:_texture.filter_min,
                                filter_mag:_texture.filter_mag,
                                clamp_s:_texture.clamp_s,
                                clamp_t:_texture.clamp_t
                            });

                            _handle(_texture.id, _load);

                        }); //timer

                    } else { //!loaded
                        log('$id / already had ${_texture.id} loaded, skipped');
                        one_loaded(_texture.id, _load_id, system.get(_texture.id), ++_index, length);
                    }

                } //each textures

            //font

                for(_font in list.fonts) {

                    if(!is_loaded(_font.id)) {

                        loaded.push(_font.id);
                        Luxe.timer.schedule(load_time_spacing*_index, function() {

                            var _load = system.load_font( _font.id, {
                                texture_path:_font.texture_path
                            });

                            _handle(_font.id, _load);

                        }); //timer

                    } else { //!loaded
                        log('$id / already had ${_font.id} loaded, skipped');
                        one_loaded(_font.id, _load_id, system.get(_font.id), ++_index, length);
                    }

                } //each fonts

            //shader

                for(_shader in list.shaders) {

                    if(!is_loaded(_shader.id)) {

                        loaded.push(_shader.id);
                        Luxe.timer.schedule(load_time_spacing*_index, function() {

                            var _load = system.load_shader( _shader.id, {
                                frag_id: _shader.frag_id,
                                vert_id: _shader.vert_id
                            });

                            _handle(_shader.id, _load);

                        }); //timer

                    } else { //!loaded
                        log('$id / already had ${_shader.id} loaded, skipped');
                        one_loaded(_shader.id, _load_id, system.get(_shader.id), ++_index, length);
                    }

                } //each shaders

            //audio

                for(_sound in list.sounds) {

                    if(!is_loaded(_sound.id)) {

                        loaded.push(_sound.id);
                        Luxe.timer.schedule(load_time_spacing*_index, function() {

                            var _load = system.load_audio( _sound.id, {
                                is_stream: _sound.is_stream
                            });

                            _handle(_sound.id, _load);

                        }); //timer

                    } else { //!loaded
                        log('$id / already had ${_sound.id} loaded, skipped');
                        one_loaded(_sound.id, _load_id, system.get(_sound.id), ++_index, length);
                    }

                } //each sounds

        }); //start delay timer

    } //load

        /** Unload this parcel contents, telling the system to remove the reference we have to them.
            Optionally the list can be emptied out, but will be kept around for reloading the parcel again. */
    public function unload( ?_empty_list:Bool = false ) {

        inline function _remove(_id) {
            log('$_id / removing');
            system.destroy(_id);
            loaded.remove(_id);
        }

        for(item in list.bytes)     _remove(item.id);
        for(item in list.texts)     _remove(item.id);
        for(item in list.jsons)     _remove(item.id);
        for(item in list.textures)  _remove(item.id);
        for(item in list.fonts)     _remove(item.id);
        for(item in list.shaders)   _remove(item.id);
        for(item in list.sounds)    _remove(item.id);

        if(_empty_list) {
            list = null;
            list = empty_list();
        }

        state = ParcelState.unloaded;

    } //unload

    public function from_json( _json_object:Dynamic ) {

        assertnull(_json_object);

        if(_json_object.bytes != null) {
            var _bytes : Array<BytesInfo> = cast _json_object.bytes;
            for(item in _bytes) {
                if(item != null) {
                    assertnull(item);
                    assertnull(item.id);

                    list.bytes.push(item);
                } //item != null
            } //each bytes
        } //json object bytes

        if(_json_object.text != null) {
            var _texts : Array<TextInfo> = cast _json_object.text;
            for(item in _texts) {
                if(item != null) {
                    assertnull(item);
                    assertnull(item.id);

                    list.texts.push(item);
                } //item != null
            } //each text
        } //json object text

        if(_json_object.json != null) {
            var _jsons : Array<JSONInfo> = cast _json_object.json;
            for(item in _jsons) {
                if(item != null) {
                    assertnull(item);
                    assertnull(item.id);

                    list.jsons.push(item);
                } //item != null
            } //each json
        } //json object json

        if(_json_object.textures != null) {
            var _textures : Array<Dynamic> = cast _json_object.textures;
            for(item in _textures) {
                assertnull(item);
                assertnull(item.id);

                inline function _get_filter(_filter_type:String) : Null<FilterType> {
                    if(_filter_type == null) return null;
                    assert(_filter_type == 'nearest' || _filter_type == 'linear');
                    return switch(_filter_type) {
                        case 'nearest': FilterType.nearest;
                        case 'linear': FilterType.linear;
                        default: null;
                    }
                }

                inline function _get_clamp(_clamp_type:String) : Null<ClampType> {
                    if(_clamp_type == null) return null;
                    assert(_clamp_type == 'edge' || _clamp_type == 'repeat' || _clamp_type == 'mirror');
                    return switch(_clamp_type) {
                        case 'edge':    ClampType.edge;
                        case 'mirror':  ClampType.mirror;
                        case 'repeat':  ClampType.repeat;
                        default: null;
                    }
                }

                list.textures.push({
                    id: item.id,
                    filter_min: _get_filter(item.filter_min),
                    filter_mag: _get_filter(item.filter_mag),
                    clamp_s: _get_clamp(item.clamp_s),
                    clamp_t: _get_clamp(item.clamp_t),
                    load_premultiply_alpha: item.load_premultiply_alpha
                });

            } //item in textures
        } //json object textures

        if(_json_object.fonts != null) {
            var _fonts : Array<BitmapFontInfo> = cast _json_object.fonts;
            for(item in _fonts) {
                if(item != null) {
                    assertnull(item);
                    assertnull(item.id);

                    list.fonts.push(item);
                } //item != null
            } //item in fonts
        } //json object fonts

        if(_json_object.shaders != null) {
            var _shaders : Array<ShaderInfo> = cast _json_object.shaders;
            for(item in _shaders) {
                if(item != null) {
                    assertnull(item);
                    assertnull(item.id);
                    assertnull(item.frag_id);
                    assertnull(item.vert_id);

                    list.shaders.push(item);
                } //item != null
            } //item in shaders
        } //json object shaders

        if(_json_object.sounds != null) {
            var _sounds : Array<SoundInfo> = cast _json_object.sounds;
            for(item in _sounds) {
                if(item != null) {
                    assertnull(item);
                    assertnull(item.id);

                    // if(item.is_stream == null) item.is_stream = false;

                    list.sounds.push(item);
                } //item != null
            } //each sounds
        } //json object sounds

    } //from_json

//Internal

    function one_loaded( _item_id:String, _load_id:String, _resource:Resource, _index:Int, _total:Int ) {

        _debug('loaded $_index / $_item_id / $_total for $_load_id / ' + Std.string(_resource) );

        var _state : ParcelChange = {
            id: _item_id,
            load_id: _load_id,
            resource: _resource,
            index: _index,
            total: _total
        };

        emitter.emit(ParcelEvent.progress, _state);

        if(onprogress != null) {
            onprogress(_state);
        }

        if(_index == _total) {
            do_complete(_load_id);
        }

    } //one_loaded

    function one_failed( _item_id:String, _load_id:String, _error:Dynamic, _index:Int, _total:Int ) {

        _debug('failed $_index / $_item_id / $_total for $_load_id / ${_error}');

        var _state : ParcelChange = {
            id: _item_id,
            load_id: _load_id,
            error: _error,
            index: _index,
            total: _total
        };

        emitter.emit(ParcelEvent.failed, _state);

        if(onfailed != null) {
            onfailed(_state);
        }

    } //one_failed

        //
    inline function get_listed() : Array<String> {
        var _result = [];

        for(item in list.bytes)     _result.push(item.id);
        for(item in list.texts)     _result.push(item.id);
        for(item in list.jsons)     _result.push(item.id);
        for(item in list.textures)  _result.push(item.id);
        for(item in list.fonts)     _result.push(item.id);
        for(item in list.shaders)   _result.push(item.id);
        for(item in list.sounds)    _result.push(item.id);

        return _result;
    }

    inline function get_length() {
        return
            list.bytes.length +
            list.texts.length +
            list.jsons.length +
            list.textures.length +
            list.shaders.length +
            list.fonts.length +
            list.sounds.length;
    }

        //do_complete
    inline function do_complete( _load_id:String ) {

        state = ParcelState.loaded;
        time_to_load = Luxe.time - start_load;

        _debug('completed load $_load_id in $time_to_load');

        emitter.emit(ParcelEvent.complete, this);

        if(oncomplete != null) {
            oncomplete(this);
        }

    } //do_complete

    function empty_list() : ParcelList {
        return {
            bytes:[],
            texts:[],
            jsons:[],
            textures:[],
            fonts:[],
            shaders:[],
            sounds:[],
        };
    }

} //Parcel
