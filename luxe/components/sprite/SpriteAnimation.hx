package luxe.components.sprite;

import luxe.components.Components;
import luxe.Rectangle;
import luxe.Vector;
import luxe.Sprite;

import phoenix.Texture;

typedef SpriteAnimationFrameEvent = {
    frame : Int,
    event : String
}

typedef SpriteAnimationFrame = {
    image_frame : Int,
    ?image_source : Texture,
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
    public var filter_type : FilterType;
    public var frameset : Array<SpriteAnimationFrame>;
    public var image_set_list : Array<String>;
    public var image_set : Array<Texture>;
    public var frame_size : Vector;
    public var frame_time : Float = 0.05;
    public var loop : Bool = false;
    public var pingpong : Bool = false;
    public var reverse : Bool = false;

    @:isVar public var frame_count (get,never) : Int = 0;
    function get_frame_count() {
        return frameset.length;
    }

    public function get_serialize_data() : Dynamic {
        var _frameset = [];

        for(_set in frameset) {
            _frameset.push({ image_frame: _set.image_frame, events: _set.events });
        }

        return {
            name : name,
            frameset : _frameset,
            frame_size : frame_size.serialized,
            frame_time : frame_time,
            loop : loop,
            pingpong : pingpong,
            reverse : reverse
        };

    } //get_serialize_data

    public function new( ?_name:String = 'anim' ) {
        name = _name;
        frameset = [];
        frame_size = new Vector();
    }

    function on_image_sequence_loaded( _textures:Array<Texture> ) {

        image_set = _textures;

            //run over the frame sets, store their texture in the frame
        for(_frame in frameset) {
            if(_frame.image_frame <= image_set.length - 1) {
                _frame.image_source = image_set[_frame.image_frame-1];
                _frame.image_source.filter = filter_type;
            }
        }

    } //on_image_sequence_loaded

    public function from_json( _animdata:Dynamic ) {

        if(_animdata == null) throw "Null animation object passed to from_json in SpriteAnimation";

        var _json_frameset : Array<String> = cast _animdata.frameset;
        var _json_frame_size : Dynamic = _animdata.frame_size;
        var _json_pingpong : Dynamic = _animdata.pingpong;
        var _json_loop : Dynamic = _animdata.loop;
        var _json_reverse : Dynamic = _animdata.reverse;
        var _json_speed : Dynamic = _animdata.speed;        
        var _json_image_sequence : String = cast _animdata.image_sequence;      
        var _json_filter_type : String = cast _animdata.filter_type;
        var _json_events_list : Array<Dynamic> = cast _animdata.events; 
        
        //frameset
        if(_json_frameset == null) { throw "SpriteAnimation passed invalid json, anim data requires frameset. In anim : " + name; }

        var _frameset : Array<Int> = parse_frameset( _json_frameset );

        type = SpriteAnimationType.animated_uv;
        
        //filter type
        if(_json_filter_type != null) {
            switch (_json_filter_type) {
                case 'nearest':
                    filter_type = FilterType.nearest;
                case 'linear':
                    filter_type = FilterType.linear;
            }
        }

        //frame_size
        var _frame_size = new Vector();
            if(_json_frame_size != null) {
                var _x : Float = Std.parseFloat(_json_frame_size.x);
                var _y : Float = Std.parseFloat(_json_frame_size.y);
                _frame_size.set(_x, _y);
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

        //create from the animation data
        for( _frame in _frameset ) {
            frameset.push({ image_frame:_frame, events:parse_event_for_frame(_events,_frame) });
        }

        //image sequence        
        if(_json_image_sequence != null) {

                //ask for the textures
            var _images_list = Luxe.utils.find_assets_image_sequence( _json_image_sequence );
            if(_images_list.length > 0) {
                image_set_list = _images_list;
                Luxe.loadTextures( _images_list, on_image_sequence_loaded, true);
            }

                //set the type
            type = SpriteAnimationType.animated_texture;

        } //_json_image_sequence        

        frame_size = _frame_size;
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
            
        if(_frameset.length < 1) {
            throw " Animation frames given a hold with no prior frame, if you want to do that you can use '1 hold 10` where 1 is the frame index, 10 is the amount. ";
        }

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

class SpriteAnimation extends Component {

    private var sprite : Sprite;

    public var animation_list : Map<String,SpriteAnimationData>;
    public var current : SpriteAnimationData;

    @:isVar public var animation (get,set):String;

    public var frame : Int = 0;
    public var image_frame : Int = 0;

    var time : Float = 0;

        //the length of a frame for the current frameset
    public var frame_time : Float = 0;
    @:noCompletion public var next_frame_time : Float = 0;

    public var loop : Bool = false;
    public var pingpong : Bool = false;
    public var reverse : Bool = false;

    public var playing : Bool = false;
    
    var uv_cache : Rectangle;

    public function init() {

        uv_cache = new Rectangle();

        if(animation_list == null) {
            animation_list = new Map();
        }

        sprite = cast entity;

        if(sprite == null) {
            throw "SpriteAnimation belongs on a Sprite instance";
        } //sprite test

    } //init

    public function add_from_json( _json_string : String ) {

        if(animation_list == null) {
            animation_list = new Map();
        }
        
        var anim_items = luxe.utils.JSON.decode(_json_string,false);
        var anims = Reflect.fields(anim_items);

        if(anims.length > 0) {
            for(anim in anims) {
                
                var animdata : Dynamic = Reflect.field(anim_items, anim);
                var _anim = new SpriteAnimationData(anim);
                    
                    _anim.from_json( animdata );

                animation_list.set( anim, _anim );

            } //anim in anims
        } //anims.length > 0

    } //add_from_json

        //remove specific event from frame
    public function remove_event( _animation:String, _image_frame:Int, _event:String='' ) {

        if( animation_list.exists(_animation) ) {
            var _anim = animation_list.get(_animation);
            for(_anim_frame in _anim.frameset) {
                if( _anim_frame.image_frame == _image_frame ) {
                    for(_frame_event in _anim_frame.events) {       
                            //found an event for this frame, is it the same one?
                        if(_frame_event.frame == _image_frame && _frame_event.event == _event) {
                            _anim_frame.events.remove(_frame_event);
                            _debug("anim event being removed " + _image_frame + ":" + _event + " to " + _animation);
                        } //matched frame and event match
                    } //each event
                } //matched frame number
            } //each frame in the set
        } else {
            trace('SpriteAnimation on ' + entity.name + ' was asked for ' + animation + ' to add an event but it is not found in the component. ');
        }

    } //remove_event

        //remove all events from a frame
    public function remove_events( _animation:String, _image_frame:Int) {

        if( animation_list.exists(_animation) ) {
            var _anim = animation_list.get(_animation);
            for(_anim_frame in _anim.frameset) {
                if( _anim_frame.image_frame == _image_frame ) {
                        //clear the events
                    _anim_frame.events = [];
                } //matched frame index
            } //each frame in the set
        } else {
            trace('SpriteAnimation on ' + entity.name + ' was asked for ' + animation + ' to add an event but it is not found in the component. ');
        }

    } //remove_events

    public function add_event( _animation:String, _image_frame:Int, _event:String='' ) {

        _debug("\n adding event to animation : " + _animation + " " + _image_frame + ":" + _event);

        if( animation_list.exists(_animation) ) {

            var _anim = animation_list.get(_animation);

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
            trace('SpriteAnimation on ' + entity.name + ' was asked for ' + animation + ' to add an event but it is not found in the component. ');
        }        

    } //add_event

    function get_animation() {
        return animation;
    }

    function set_animation( _name:String ) {

        if(animation_list.exists(_name)) {
            current = animation_list.get(_name);
            loop = current.loop;
            pingpong = current.pingpong;
            reverse = current.reverse;
            frame_time = current.frame_time;
            next_frame_time = time;

            return animation = _name;
        }

        trace('SpriteAnimation on ' + entity.name + ' was asked for ' + animation + ' but it is not found in the component. ');

        return animation;

    } //set_animation

    public function restart() {
        frame = 1;
        play();
    }

    public function play() {
        playing = true;
    }

    public function stop() {
        playing = false;
    }

    public function set_frame( _frame:Int ) {

        if(sprite == null) return;      
        if(current.type == SpriteAnimationType.animated_uv) {

            if(sprite.texture == null) return;

            var frames_per_row = ( sprite.texture.width - (sprite.texture.width % current.frame_size.x) ) / current.frame_size.x;
            var image_row = Math.ceil( _frame / frames_per_row );
            var image_x = ((_frame-1) * current.frame_size.x) % sprite.texture.width;
            var image_y = ((image_row-1) * current.frame_size.y);

            uv_cache.set( image_x, image_y, current.frame_size.x, current.frame_size.y );

            sprite.uv = uv_cache;

        } else if(current.type == SpriteAnimationType.animated_texture) {

            if(_frame <= current.image_set.length-1 ) {
                sprite.texture = current.image_set[_frame-1];
            }

        } //SpriteAnimationType.animated_texture

    } //set_frame

        //sync the state to the sprite itself
    private function refresh_sprite() {

        if(sprite == null) return;
        if(current.type == SpriteAnimationType.animated_uv) {

            if(sprite.texture == null) return;

            var frames_per_row = ( sprite.texture.width - (sprite.texture.width % current.frame_size.x) ) / current.frame_size.x;
            var image_row = Math.ceil( image_frame / frames_per_row );
            var image_x = ((image_frame-1) * current.frame_size.x) % sprite.texture.width;
            var image_y = ((image_row-1) * current.frame_size.y);

            uv_cache.set( image_x, image_y, current.frame_size.x, current.frame_size.y );

            sprite.uv = uv_cache;
        
        } else if(current.type == SpriteAnimationType.animated_texture) {

            if( image_frame <= current.image_set.length-1 ) {
                sprite.texture = current.image_set[image_frame-1];
            }

        }

    } //refresh_sprite

    @:noCompletion public function update( dt:Float ) {

        if(current == null) return;
        if(!playing) return;

            //flag if we reached an end state
        var end = false;

            //update the local time
        time += dt;     

            //time for a frame update?
        if(time >= next_frame_time) {

            next_frame_time = time + current.frame_time;

                //advance the frame
            if(!reverse) {
                frame += 1;
            } else {
                frame -= 1;
            }

                //check the logic for syncing
            if( !reverse ) {
                if( frame > current.frame_count ) { 
                    end = true;  
                    if(!loop) {
                        frame = current.frame_count; 
                    }
                } //if at the end
            } else {
                if( frame < 1 ) { 
                    end = true; 
                    if(!loop) {
                        frame = 1;
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
                        frame = 1;
                    } else {
                        frame = current.frame_count;
                    }
                    
                } else {
                    stop();
                }
            } //if end
                
                //the current animation frame 
            var _anim_frame = current.frameset[frame-1];            

                //set the image frame from the current frameset
            image_frame = _anim_frame.image_frame;

                //handle any frame events
            for(_event in _anim_frame.events) {
                var _event_emit_name : String = _event.event;
                
                    //default to animation.event.image_frame
                if(_event_emit_name == '') {
                    _event_emit_name = animation + '.event.' + _anim_frame.image_frame;
                }

                    //fire the event into the holding entity
                entity.events.fire( _event_emit_name, {
                    animation : animation,
                    event: _event_emit_name, 
                    frame_event : _event,
                    frame: _anim_frame,
                    image_frame : _anim_frame.image_frame
                });
            }

                //finally, update the sprite
            refresh_sprite();

        } //time

    } //update

    public override function get_serialize_data() : Dynamic {

        var _data : Dynamic = super.get_serialize_data();

        var _animation_list = [];

        for(anim in animation_list) {
            _animation_list.push(anim.get_serialize_data());
        }
        
        var _extra : Dynamic = {
            name : name, 
            frame : frame,
            image_frame : image_frame,
            animation : animation,
            animations : _animation_list,
            playing : playing
        };

        return _merge_properties(_data, _extra);

    } //get_serialize_data

} //SpriteAnimation




