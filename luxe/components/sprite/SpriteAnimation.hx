package luxe.components.sprite;

import luxe.components.Components;
import luxe.Rectangle;
import luxe.Vector;
import luxe.Sprite;


typedef SpriteAnimationFrame = {
	var image_frame : Int;
	var events : Array<String>;
}


class SpriteAnimationData {

	public static var frame_range_regex : EReg = new EReg("(\\d*)-(\\d*)",'gi');
	public static var frame_regex : EReg = new EReg("(\\d*)",'gi');

	public var name : String; 
	public var frameset : Array<SpriteAnimationFrame>;
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

	public function from_json( _animdata:Dynamic ) {

		if(_animdata == null) throw "Null animation object passed to from_json in SpriteAnimation";

		var _json_frameset : Array<String> = cast _animdata.frameset;
		var _json_frame_size : Dynamic = _animdata.frame_size;
		var _json_pingpong : Dynamic = _animdata.pingpong;
		var _json_loop : Dynamic = _animdata.loop;
		var _json_reverse : Dynamic = _animdata.reverse;
		var _json_speed : Dynamic = _animdata.speed;		
//frameset
		if(_json_frameset == null) { throw "SpriteAnimation passed invalid json, anim data requires frameset. In anim : " + name; }

		var _frameset : Array<Int> = parse_frameset( _json_frameset );
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
		var speed : Float = 2;
			if(_json_speed != null) {
				speed = Std.parseFloat(_json_speed);
			}

//create from the animation data
		for( _frame in _frameset ) {
			frameset.push({ image_frame:_frame, events:[] });
		}

		frame_size = _frame_size;
		pingpong = _pingpong;
		loop = _loop;
		reverse = _reverse;
		frame_time = 1 / speed;

		return this;

	} //from_json

	
	function parse_frameset_range( _frameset:Array<Int>, regex:EReg, _frame:String ) : Void {
		
		var _start : Int = Std.parseInt( regex.matched(1) );
		var _end : Int = Std.parseInt( regex.matched(2) );
		var _results : Array<Int> = [];			
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
			} else if( frame_regex.match( _frame ) ) {
				parse_frameset_frame( _final_frameset, frame_regex, _frame );
			}

		} //for each frame

		trace(_final_frameset);

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
			throw "SpriteAnimation belongs on a Sprite";
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


	function get_animation() {
		return animation;
	}

	function set_animation( _name:String ) {
		if(animation_list.exists(_name)) {
			current = animation_list.get(_name);
			loop = current.loop;
			pingpong = current.pingpong;
			reverse = current.reverse;
			return animation = _name;
		}

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
		if(sprite.texture == null) return;

		var frames_per_row = ( sprite.texture.width - (sprite.texture.width % current.frame_size.x) ) / current.frame_size.x;
		var image_row = Math.ceil( _frame / frames_per_row );
		var image_x = ((_frame-1) * current.frame_size.x) % sprite.texture.width;
		var image_y = ((image_row-1) * current.frame_size.y);

		uv_cache.set( image_x, image_y, current.frame_size.x, current.frame_size.y );

		sprite.uv = uv_cache;

	} //set_frame

		//sync the state to the sprite itself
	private function refresh_sprite() {

		if(sprite == null) return;
		if(sprite.texture == null) return;

		var frames_per_row = ( sprite.texture.width - (sprite.texture.width % current.frame_size.x) ) / current.frame_size.x;
		var image_row = Math.ceil( image_frame / frames_per_row );
		var image_x = ((image_frame-1) * current.frame_size.x) % sprite.texture.width;
		var image_y = ((image_row-1) * current.frame_size.y);

		uv_cache.set( image_x, image_y, current.frame_size.x, current.frame_size.y );

		sprite.uv = uv_cache;

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
		
			image_frame = current.frameset[frame-1].image_frame;

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




