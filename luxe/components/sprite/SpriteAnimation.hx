package luxe.components.sprite;

import luxe.Component;
import luxe.Rectangle;
import luxe.Vector;
import luxe.Sprite;

import phoenix.Texture;

import luxe.Log.*;

/** A component for : luxe.Sprite
    Once attached to a sprite, the animation component can play animations,
    fire events on specific frames, and handles both UV (spritesheet/atlas)
    animation types or image sequences.
*/
class SpriteAnimation extends Component {

        /** The current animation data for this animation */
    public var current          : SpriteAnimationData;
        /** The current animation frame information */
    public var current_frame    : SpriteAnimationFrame;
        /** The list of animations added to this component */
    public var animations       : Map<String, SpriteAnimationData>;
        /** The image frame of the current animation frame */
    public var image_frame      : Int = 0;
        /** Whether or not the animation is playing.
            Currently read only (in concept), manipulated by play() and stop().
            This will be clarified in alpha-3.0 */
    public var playing          : Bool = false;
        /** Whether or not the animation will loop at reaching an end point. */
    public var loop             : Bool = false;
        /** Whether or not the animation is run in reverse when reaching an end point. */
    public var pingpong         : Bool = false;
        /** Whether or not the animation is run in reverse. */
    public var reverse          : Bool = false;

        /** The current active animation.
            Will set the new animation frame to 1,
            change the frame property if requiring a specific frame. */
    @:isVar public var animation (get,set) : String;
        /** The speed at which the animation plays.
            This is in frames per second. */
    @:isVar public var speed (get,set) : Float = 30.0;
        /** The current animation frame (index into the frame set).
            Setting this will update the sprite frame at any time. */
    @:isVar public var frame (get,set) : Int = 1;

    var time            : Float = 0;
    var next_frame_time : Float = 0;
    var sprite          : Sprite;
    var uv_cache        : Rectangle;

        /** Create a new `SpriteAnimation` */
    public function new( options:luxe.options.ComponentOptions ) {

        super(options);

        animations = new Map();
        uv_cache = new Rectangle();

    } //new

//component

    override function onadded() {

        sprite = cast entity;
        assertnull(sprite, 'SpriteAnimation belongs on a Sprite instance');

    }

    override function init() {

    } //init

//public playback API :todo: these are a bit odd.

        /** Reset the frame to 1 and `play`. */
    public function restart() : Void {

        frame = 1;
        play();

    } //restart

        /** Play/resume playback. */
    public function play() : Void {

        playing = true;

    } //play

        /** Stop/pause playback. Does not (currently) reset the animation to frame 1. */
    public function stop() : Void {

        playing = false;

    } //stop


//public animation data API

        /** Add an animation object from a raw `SpriteAnimationData` object. */
    public function add_from_anim_data( _data:SpriteAnimationData ) {

        animations.set(_data.name, _data);

    } //add_from_anim_data

        /** Add an animation object from a string containing JSON data. */
    public function add_from_json_object( _json_object : Dynamic ) : Void {

        var anim_items = _json_object;
        var anims = Reflect.fields(anim_items);

        if(anims.length > 0) {

            for(anim in anims) {

                var animdata : Dynamic = Reflect.field(anim_items, anim);
                var _anim = new SpriteAnimationData( cast entity, anim );

                    _anim.from_json( animdata );

                animations.set( anim, _anim );

            } //anim in anims

        } else { //anims.length > 0

            log('${entity.name} / add_from_json_object given an empty json object... This is probably an error.');

        }

    } //add_from_json_object

        /** Add an animation object from a string containing JSON data. */
    public function add_from_json( _json_string : String ) : Void {
        //

            //parse json first
        var _json_object = haxe.Json.parse(_json_string);
            //and add directly
        add_from_json_object( _json_object );

    } //add_from_json

//public event api

        /** Remove a specific event from a frame */
    public function remove_event( _animation:String, _image_frame:Int, _event:String='' ) : Void {

        if( animations.exists(_animation) ) {

            var _anim = animations.get(_animation);

            for(_anim_frame in _anim.frameset) {

                if( _anim_frame.image_frame != _image_frame ) continue;

                for(_frame_event in _anim_frame.events) {

                    if(_frame_event.frame != _image_frame) continue;
                    if(_frame_event.event != _event) continue;

                    _anim_frame.events.remove(_frame_event);
                    _debug("anim event being removed " + _image_frame + ":" + _event + " to " + _animation);


                } //each event

            } //each frame in the set

        } else {
            log('${entity.name} / $animation requested an event to be added, but that animation is not found in the `$name` component');
        }

    } //remove_event

        /** Remove all events from a frame */
    public function remove_events( _animation:String, _image_frame:Int) : Void {

        if( animations.exists(_animation) ) {
            var _anim = animations.get(_animation);
            for(_anim_frame in _anim.frameset) {
                if( _anim_frame.image_frame == _image_frame ) {
                        //clear the events
                    _anim_frame.events = [];
                } //matched frame index
            } //each frame in the set
        } else {
            log('${entity.name} / $animation requested an event to be removed, but that animation is not found in the `$name` component');
        }

    } //remove_events

    public function add_event( _animation:String, _image_frame:Int, _event:String='' ) : Void {

        _debug("\n adding event to animation : " + _animation + " " + _image_frame + ":" + _event);

        if( animations.exists(_animation) ) {

            var _anim = animations.get(_animation);

            _debug("animation: found anim " + _animation + ", looking for event duplicates ");

            for(_anim_frame in _anim.frameset) {
                if( _anim_frame.image_frame == _image_frame ) {

                        //matched image frame, now check if there isn't already an event named this way in the list
                        //so that we don't have multiples causing issues
                    var _add_event : Bool = true;
                    for(_frame_event in _anim_frame.events) {
                            //found an event for this frame, is it the same one?
                        if(_frame_event.frame == _image_frame && _frame_event.event == _event) {
                            _add_event = false;
                            _debug("anim event duplicate, not adding " + _image_frame + ":" + _event + " to " + _animation);
                        }
                    }

                        //still?
                    if(_add_event) {
                        _anim_frame.events.push({ frame:_image_frame, event:_event });
                        _debug("anim event added : " + _image_frame + ":" + _event + " to " + _animation);
                    }

                } //if the frame matches
            } //for the frameset in

        } else {

            log('${entity.name} / $animation requested an event to be added, but that animation is not found in the `$name` component');

        } //

    } //add_event

//Internal

    @:noCompletion override function update( dt:Float ) : Void {

        if(current == null) {
            // trace('SpriteAnimation: ignoring update when current is null');
            return;
        }

        if(!playing) return;

            //flag if we reached an end state
        var end = false;
        var _frame = frame;

            //update the local time
        time += dt;

            //time for a frame update?
        if(time >= next_frame_time) {

            next_frame_time = time + current.frame_time;

                //advance the frame
            if(!reverse) {
                _frame += 1;
            } else {
                _frame -= 1;
            }

                //check the logic for syncing
            if( !reverse ) {
                if( _frame > current.frame_count ) {
                    end = true;
                    if(!loop) {
                        _frame = current.frame_count;
                    }
                } //if at the end
            } else {
                if( _frame < 1 ) {
                    end = true;
                    if(!loop) {
                        _frame = 1;
                    }
                } //frame < 1
            } //!reverse

                //check the end status
            if(end) {

                if(loop) {

                    if(pingpong) {
                        reverse = !reverse;
                    }

                    if(!reverse) {
                        _frame = 1;
                    } else {
                        _frame = current.frame_count;
                    }

                    emit_anim_event('loop');

                } else {
                    stop();
                    emit_anim_event('end');
                    _frame = frame;
                }

            } //if end

                //sync up the actual frame with the updated value
            frame = _frame;

        } //time?

    } //update

        //sync the state to the sprite itself
    function refresh_sprite() : Void {

        assertnull(sprite, 'SpriteAnimation requires non-null sprite instance');

        if(current.type == SpriteAnimationType.animated_uv) {

                assertnull(sprite.texture, 'SpriteAnimation with animated_uv type requires a texture that is not null');

                    //cache the uv so we don't allocate for no good reason
                uv_cache.set( current_frame.frame_source.x, current_frame.frame_source.y, current_frame.frame_source.w, current_frame.frame_source.h );
                    //ratio of scale between sprite size and frame size
                var _ratio_x = current_frame.frame_size.x / sprite.size.x;
                var _ratio_y = current_frame.frame_size.y / sprite.size.y;
                    //resize the sprite non destructively, to fit the new frame size
                sprite.geometry.transform.scale.x = (current_frame.frame_source.w / (current_frame.frame_size.x)) * sprite.scale.x;
                sprite.geometry.transform.scale.y = (current_frame.frame_source.h / (current_frame.frame_size.y)) * sprite.scale.y;

                    //realign the sprite to match the new frame size, but also adjust for the new scale! otherwise it won't match
                sprite.geometry.transform.origin.x = -((current_frame.frame_pos.x / _ratio_x) * sprite.scale.x) / sprite.geometry.transform.scale.x;
                sprite.geometry.transform.origin.y = -((current_frame.frame_pos.y / _ratio_y) * sprite.scale.y) / sprite.geometry.transform.scale.y;

                    //and finally assign it to the sprite
                sprite.uv = uv_cache;

        } else if(current.type == SpriteAnimationType.animated_texture) {

            if( image_frame <= current.image_set.length ) {

                sprite.texture = current.image_set[image_frame-1];

                uv_cache.set( current_frame.frame_source.x, current_frame.frame_source.y, current_frame.frame_source.w, current_frame.frame_source.h );

                sprite.uv = uv_cache;

            } //image_frame inside image set

        }

    } //refresh_sprite

//properties

    function get_frame() : Int {

        return frame;

    } //get_frame

    function set_frame( _frame:Int ) : Int {

        frame = _frame;

        if(current == null) {
            return frame;
        }

            //:todo: the frame events could be deferred
            //and need testing but fixing quickly,
            //investigate this properly
        if(entity == null || entity.destroyed) {
            return frame;
        }

            current_frame = current.frameset[ frame - 1 ];
            image_frame = current_frame.image_frame;
            emit_frame_events();
            refresh_sprite();

        return frame;

    } //set_frame

    inline function get_speed() : Float {

        return speed;

    } //get_speed

    function set_speed( _speed:Float ) : Float {

            //:todo: it may make more sense to scale this in the updates
            //rather than modify the frame time like this
        if(current != null) {
            current.frame_time = 1 / _speed;
        }

        return speed = _speed;

    } //set_speed

    inline function get_animation() : String {

        return animation;

    } //get_animation

    function set_animation( _name:String ) : String {

        if(!animations.exists(_name)) {
            log('${entity.name} / set animation `$_name`, but that animation is not found in the `$name` component');
            return animation;
        }

            current = animations.get(_name);
            loop = current.loop;
            pingpong = current.pingpong;
            reverse = current.reverse;
            next_frame_time = time + current.frame_time;

            //set to the first frame of this animation
        frame = 1;

        return animation = _name;

    } //set_animation

//internal

    inline function emit_frame_events() : Void {
        //

            //handle any frame events
        for(_event in current_frame.events) {

            var _event_emit_name : String = _event.event;

                //default to animation.event.image_frame
            if(_event_emit_name == '') {
                _event_emit_name = 'animation.$animation.${current_frame.image_frame}';
            }

                //fire the event into the holding entity
            entity.events.fire( _event_emit_name, {
                animation : animation,
                event: _event_emit_name,
                frame_event : _event,
                frame: current_frame,
                image_frame : current_frame.image_frame
            });

        } //each event

    } //emit_frame_events

    inline function emit_anim_event(_name:String) {
        var _event_emit_name = 'animation.$animation.$_name';
        entity.events.fire( _event_emit_name, {
            animation : animation,
            event: _event_emit_name,
            frame_event : null,
            frame: current_frame,
            image_frame : current_frame.image_frame
        });
    }


} //SpriteAnimation





typedef SpriteAnimationEventData = {
    animation : String,
    event: String,
    frame_event : SpriteAnimationFrameEvent,
    frame: SpriteAnimationFrame,
    image_frame : Int
}

typedef SpriteAnimationFrameEvent = {
    frame : Int,
    event : String
}

typedef SpriteAnimationFrameSource = {
    frame : Int,
    source : Rectangle,
    size : Vector,
    pos : Vector
}

typedef SpriteAnimationFrame = {
    image_frame : Int,
    ?image_source : Texture,
    frame_source : Rectangle,
    frame_size : Vector,
    frame_pos : Vector,
    events : Array<SpriteAnimationFrameEvent>
}

enum SpriteAnimationType {
    animated_texture;
    animated_uv;
}


class SpriteAnimationData {

    public static var frame_range_regex : EReg = ~/(\d*)(\b\s*?-\s*?\b)(\d*)/gi;
    public static var frame_hold_regex : EReg = ~/(\d*)(\shold\s)(\d*)/gi;
    public static var frame_hold_prev_regex : EReg = ~/(\bhold\s)(\d*)/gi;
    public static var frame_regex : EReg = ~/(\d*)/gi;

    public var name : String;
    public var type : SpriteAnimationType;
    public var filter_type : Null<FilterType>;
    public var frameset : Array<SpriteAnimationFrame>;
    public var image_set_list : Array<String>;
    public var image_set : Array<Texture>;
    public var frame_size : Vector;
    public var frame_sources : Array<SpriteAnimationFrameSource>;
    public var frame_time : Float = 0.05;
    public var loop : Bool = false;
    public var pingpong : Bool = false;
    public var reverse : Bool = false;

    var sprite : Sprite;

    @:isVar public var frame_count (get,never) : Int = 0;
    function get_frame_count() {
        return frameset.length;
    }

    public function new( _sprite:Sprite, ?_name:String = 'anim' ) {
        name = _name;
        sprite = _sprite;
        frameset = [];
        frame_sources = [];
        frame_size = new Vector();
    }

    public function from_json( _animdata:Dynamic ) {

        assertnull(_animdata, 'Null animation object passed to from_json in SpriteAnimation');

        var _json_frameset : Array<String> = cast _animdata.frameset;
        var _json_frame_size : Dynamic = _animdata.frame_size;
        var _json_pingpong : Dynamic = _animdata.pingpong;
        var _json_loop : Dynamic = _animdata.loop;
        var _json_reverse : Dynamic = _animdata.reverse;
        var _json_speed : Dynamic = _animdata.speed;
        var _json_image_sequence : String = cast _animdata.image_sequence;
        var _json_filter_type : String = cast _animdata.filter_type;
        var _json_events_list : Array<Dynamic> = cast _animdata.events;
        var _json_framesource_list : Array<Dynamic> = cast _animdata.frame_sources;

        //frameset
        assertnull(_json_frameset, 'SpriteAnimation passed invalid json, anim data requires frameset as an array of strings.');

        var _frameset : Array<Int> = parse_frameset( _json_frameset );

        type = SpriteAnimationType.animated_uv;

        //filter type
        if(_json_filter_type != null) {
            switch (_json_filter_type) {
                case 'nearest': filter_type = FilterType.nearest;
                case 'linear':  filter_type = FilterType.linear;
            }
        }

        //frame_size
        var _frame_size = new Vector();
            if(_json_frame_size != null) {
                var _x : Float = Std.parseFloat(_json_frame_size.x);
                var _y : Float = Std.parseFloat(_json_frame_size.y);
                _frame_size.set_xy(_x, _y);
            }

        //pingpong
        var _pingpong : Bool = false;
            if(_json_pingpong != null) {
                if(_json_pingpong == 'true') {
                    _pingpong = true;
                } else {
                    _pingpong = false;
                }
            } //_json_pingpong

        //loop
        var _loop : Bool = false;
            if(_json_loop != null) {
                if(_json_loop == 'true') {
                    _loop = true;
                } else {
                    _loop = false;
                }
            } //_json_loop

        //_reverse
        var _reverse : Bool = false;
            if(_json_reverse != null) {
                if(_json_reverse == 'true') {
                    _reverse = true;
                } else {
                    _reverse = false;
                }
            } //_json_loop

        //speed
        var _speed : Float = 2;
            if(_json_speed != null) {
                _speed = Std.parseFloat(_json_speed);
            }

        //events
        var _events : Array<SpriteAnimationFrameEvent> = null;
            if(_json_events_list != null) {
                _events = parse_event_set(_json_events_list);
            }

        //frame_sources

            //store the default frame size here so we can fill in blanks
            //after we parse the sources
        frame_size = _frame_size;

        var _frame_sources : Array<SpriteAnimationFrameSource> = null;
            if(_json_framesource_list != null) {
                _frame_sources = parse_frame_sources_set(_json_framesource_list);
            }

        //create from the animation data
        for( _frame in _frameset ) {
            frameset.push({
                image_frame : _frame,
                events : parse_event_for_frame(_events,_frame),
                frame_source : parse_source_for_frame(_frame_sources,_frame),
                frame_size : parse_source_size_for_frame(_frame_sources, _frame),
                frame_pos : parse_source_pos_for_frame(_frame_sources, _frame)
            });
            // trace("add frame : " + frameset[frameset.length-1]);
        }

        //image sequence
        if(_json_image_sequence != null) {

                //ask for the textures
            var _images_list = Luxe.utils.find_assets_sequence( _json_image_sequence );
                //set the type
            type = SpriteAnimationType.animated_texture;
            image_set = [];

            var _textures = [];

            if(_images_list.length > 0) {

                image_set_list = _images_list;

                for(_image in _images_list) {
                    var _texture = Luxe.resources.texture(_image);
                    assertnull(_texture, 'SpriteAnimation texture id was not found : $_image');
                    image_set.push(_texture);
                }

                    //run over the frame sets, store their texture in the frame
                for(_frame in frameset) {
                    if(_frame.image_frame <= image_set.length) {
                        _frame.image_source = image_set[_frame.image_frame-1];
                        if(filter_type != null) {
                            _frame.image_source.filter_min = _frame.image_source.filter_mag = filter_type;
                        } //if filter type is set
                    } //if within the frame image set
                } //each frameset

            } //_images_list

        } //_json_image_sequence

        pingpong = _pingpong;
        loop = _loop;
        reverse = _reverse;
        frame_time = 1 / _speed;

        return this;

    } //from_json

    function parse_event_for_frame( _events:Array<SpriteAnimationFrameEvent>, _frame:Int ) : Array<SpriteAnimationFrameEvent> {

        if(_events == null) return [];
        if(_events.length == 0) return [];

        var _resulting_events = [];
        for(_event in _events) {
            if(_event.frame == _frame) {
                _resulting_events.push(_event);
            }
        }

        return _resulting_events;

    } //parse_event_for_frame

    function parse_source_size_for_frame( _sources:Array<SpriteAnimationFrameSource>, _frame:Int ) : Vector {

        if(_sources != null) {
            for(_source in _sources) {
                if(_source.frame == _frame) {
                    return _source.size;
                } //matching frame
            } //each source
        } //sources != null

        return frame_size;

    } //parse_source_size_for_frame

    function parse_source_pos_for_frame( _sources:Array<SpriteAnimationFrameSource>, _frame:Int ) : Vector {

        if(_sources != null) {
            for(_source in _sources) {
                if(_source.frame == _frame) {
                    return _source.pos;
                } //matching frame
            } //each source
        } //sources != null

        return new Vector();

    } //parse_source_pos_for_frame

    function parse_source_for_frame( _sources:Array<SpriteAnimationFrameSource>, _frame:Int ) : Rectangle {

        var _explicit_source : Rectangle = null;
        if(_sources != null) {
            for(_source in _sources) {
                if(_source.frame == _frame) {
                    _explicit_source = _source.source;
                } //matching frame
            } //each source
        } //sources != null

            //here is where we try the best guess for the frame given
            //unless an explicit frame source was given
        if(_explicit_source == null) {

            var result = new Rectangle(0, 0, frame_size.x, frame_size.y);

            if(sprite.texture != null) {
                switch(type) {

                    case SpriteAnimationType.animated_uv: {

                        var frames_per_row = ( sprite.texture.width - (sprite.texture.width % frame_size.x) ) / frame_size.x;
                        var image_row = Math.ceil( _frame / frames_per_row );
                        var image_x = ((_frame-1) * frame_size.x) % sprite.texture.width;
                        var image_y = ((image_row-1) * frame_size.y);

                        result = new Rectangle( image_x, image_y, frame_size.x, frame_size.y );

                    } //animated_uv

                    default : {}

                } //type

            } //texture != null

            return result;

        } else {

            return _explicit_source;

        } //if explicit source

    } //parse_source_for_frame

    function parse_frame_sources_set( _sources:Array<Dynamic> ) : Array<SpriteAnimationFrameSource> {

        if(_sources == null) return [];

        var resulting_sources = [];
        for(_json_source in _sources) {

            var _json_size : Dynamic = _json_source.size;
            var _json_source_rect : Dynamic = _json_source.source;
            var _json_pos : Dynamic = _json_source.pos;

            var _x : Float = 0;
            var _y : Float = 0;
            var _w : Float = 0;
            var _h : Float = 0;

            var _sx : Float = 0;
            var _sy : Float = 0;
            var _px : Float = 0;
            var _py : Float = 0;

            if(_json_source_rect != null) {
                _x = Std.parseFloat(_json_source_rect.x);
                _y = Std.parseFloat(_json_source_rect.y);
                _w = Std.parseFloat(_json_source_rect.w);
                _h = Std.parseFloat(_json_source_rect.h);
            }

            if(_json_size != null) {
                _sx = Std.parseFloat(_json_size.x);
                _sy = Std.parseFloat(_json_size.y);
            }

            if(_json_pos != null) {
                _px = Std.parseFloat(_json_pos.x);
                _py = Std.parseFloat(_json_pos.y);
            }

            var _source : SpriteAnimationFrameSource = {
                frame : Std.parseInt(_json_source.frame),
                source : new Rectangle(_x, _y, _w, _h),
                size : new Vector( _sx, _sy ),
                pos : new Vector( _px, _py )
            }

            resulting_sources.push(_source);

        } //each size in the list

        return resulting_sources;

    } //parse_frame_sources_set

    function parse_event_set( _events:Array<Dynamic> ) : Array<SpriteAnimationFrameEvent> {

        if(_events == null) return [];

        var resulting_events = [];
        for(_json_event in _events) {
                //frames can have empty events, in which case it will assume the animationname.event.frame
            if(_json_event.frame != null) {

                var _event : SpriteAnimationFrameEvent = {
                    frame : Std.parseInt(_json_event.frame),
                    event : (_json_event.event == null) ? "" : (_json_event.event)
                }

                resulting_events.push(_event);

            } //frame != null
        } //each event in json events

        return resulting_events;

    } //parse_event_set

    function parse_frameset_range( _frameset:Array<Int>, regex:EReg, _frame:String ) : Void {

        var _start : Int = Std.parseInt( regex.matched(1) );
        var _end : Int = Std.parseInt( regex.matched(3) );
        var _count : Int = Std.int(Math.abs( _start - _end ));

            //If they are the same, that's a silly range but allow it
        if(_count == 0) {
            _frameset.push( _start );
        } else {

                //if reversed, count backward from the end instead
            if(_start > _end) {
                for( _i in 0 ... _count+1 ) {
                    _frameset.push( _start - _i );
                }
            } else {
                for( i in _start ... _end+1 ) {
                    _frameset.push( i );
                }
            } //_start < _end

        } //_count == 0

    } //parse_frameset_range

    function parse_frameset_hold( _frameset:Array<Int>, regex:EReg, _frame:String ) : Void {

        var _frame_index : Int = Std.parseInt( regex.matched(1) );
        var _amount : Int = Std.parseInt( regex.matched(3) );

        for( _i in 0 ... _amount ) {
            _frameset.push( _frame_index );
        }

    } //parse_frameset_range

    function parse_frameset_prev_hold( _frameset:Array<Int>, regex:EReg, _frame:String ) : Void {

        assert(_frameset.length > 0, 'Animation frames given a hold with no prior frame, if you want to do that you can use `1 hold 10` where 1 is the frame index, 10 is the amount.');

        var _frame : Int = _frameset[ _frameset.length - 1 ];
        var _amount : Int = Std.parseInt( regex.matched(2) );

        for( _i in 0 ... _amount ) {
            _frameset.push( _frame );
        }

    } //parse_frameset_prev_hold

    function parse_frameset_frame( _frameset:Array<Int>, regex:EReg, _frame:String ) : Void {

        var _frame : Int = Std.parseInt( regex.matched(1) );

            _frameset.push( _frame );

    } //parse_frameset_frame

    function parse_frameset( _json_frameset:Array<String> ) : Array<Int> {

        var _final_frameset = [];
        for(_frame in _json_frameset) {

                //match a range (frame)-(frame)
            if( frame_range_regex.match( _frame ) ) {
                parse_frameset_range( _final_frameset, frame_range_regex, _frame );
            } else

                //match the (frame) hold (amount)
            if( frame_hold_regex.match( _frame ) ) {
                parse_frameset_hold( _final_frameset, frame_hold_regex, _frame );
            } else

                //match the hold (amount) from previous frame
            if( frame_hold_prev_regex.match( _frame ) ) {
                parse_frameset_prev_hold( _final_frameset, frame_hold_prev_regex, _frame );
            } else

                //match the single value frames
            if( frame_regex.match( _frame ) ) {
                parse_frameset_frame( _final_frameset, frame_regex, _frame );
            }

        } //for each frame

        return _final_frameset;
    }

} //SpriteAnimationData

