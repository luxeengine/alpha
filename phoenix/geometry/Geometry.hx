package phoenix.geometry;


import phoenix.geometry.Vertex;
import phoenix.Matrix4;
import phoenix.Quaternion;
import phoenix.Rectangle;
import phoenix.Vector;
import phoenix.Shader;
import phoenix.Texture;
import phoenix.Batcher;

import luxe.structures.BinarySearchTree;

import lime.utils.ByteArray;
import lime.utils.Float32Array;
import lime.utils.IMemoryRange;

import lime.gl.GL;
import lime.gl.GLBuffer;

class Geometry {

		//The list of vertices
	public var vertices : Array<Vertex>;

		//Statically batched VBO's
	public var locked : Bool = false;
	public var submitted : Bool = false;
	public var dirty : Bool = false;
	public var static_vertex_buffer : GLBuffer;
    public var static_tcoord_buffer : GLBuffer;
    public var static_vcolor_buffer : GLBuffer;
    public var static_normal_buffer : GLBuffer;	

		//Batcher information
	public var added : Bool = false;
	public var batchers : Array<Batcher>;

	public var state : GeometryState;
	public var dropped : Bool = false;
	public var uuid : String = '';
	public var id : String = '';
	

		//State properties
	@:isVar public var primitive_type(get, set) : PrimitiveType;
	@:isVar public var texture(get, set) : Texture;
	@:isVar public var shader(get, set) : Shader;
	@:isVar public var depth(get, set) : Float;
	@:isVar public var group(get, set) : Int;
	@:isVar public var clip(get, set) : Bool;
	@:isVar public var clip_rect(get, set) : Rectangle;

	private var shadow_primitive_type : PrimitiveType;
	private var shadow_texture : Texture;
	private var shadow_shader : Shader;
	private var shadow_group : Int = 0;
	private var shadow_depth : Float = 0.0;
	private var shadow_clip : Bool = false;

	private var dirty_primitive_type : Bool = false;
	private var dirty_texture : Bool = false;
	private var dirty_shader : Bool = false;
	private var dirty_group : Bool = false;
	private var dirty_depth : Bool = false;
	private var dirty_clip : Bool = false;

		//Geometry properties	
	@:isVar public var enabled(default, set) : Bool = true;
	@:isVar public var immediate(default, default) : Bool;
	@:isVar public var color(default, set) : Color;
		//Transform
	@:isVar public var pos(get, set) : Vector;
	@:isVar public var rotation(get, set) : Quaternion;
	@:isVar public var scale(get, set) : Vector;
		//The origin for the transform
	@:isVar public var origin(default, set) : Vector;
		//The transform matrix
	public var matrix : Matrix4;
		//Private reuse value
	var _final_vert_position : Vector;


	public function new( options:Dynamic ) {

		uuid = luxe.utils.UUID.get();
		vertices = new Array<Vertex>();
		state = new GeometryState();
		batchers = new Array<Batcher>();
			
			//default transform properties
		pos = new Vector();
		rotation = new Quaternion();
		scale = new Vector(1,1,1);
			//offset for transform
		origin = new Vector();
			//default matrix for transform
		matrix = new Matrix4();
		matrix = matrix.identity();
			//init the empty vertex reuse
		_final_vert_position = new Vector();

			//geometry clipping
		clip = false;
		clip_rect = new Rectangle();		

		if(options != null) {
			
			state.depth 			= options.depth == null 	? state.depth 			: options.depth;
			state.group 			= options.group == null 	? state.group 			: options.group;
			state.texture 			= options.texture == null 	? state.texture 		: options.texture;			
			state.clip 				= options.clip == null 		? state.clip 			: options.clip;
			state.clip_rect 		= options.clip_rect == null ? state.clip_rect 		: options.clip_rect;
			state.primitive_type 	= options.type == null 		? state.primitive_type 	: options.type;
			state.shader 			= options.shader == null 	? state.shader 			: options.shader;

			pos 		= (options.pos == null) 		? pos 		: options.pos;
			rotation 	= (options.rotation == null) 	? rotation 	: options.rotation;
			scale 		= (options.scale == null) 		? scale 	: options.scale;

			origin 		= (options.origin == null) 		? origin 	: options.origin;
			immediate 	= (options.immediate == null) 	? false 	: options.immediate;
			enabled 	= (options.enabled == null) 	? true 		: options.enabled;

			color 		= (options.color == null) 		? new Color() : options.color;
			
		} //options != null

	} //new

	public function short_id() {

		return uuid.substr(0, uuid.indexOf('-'));

	} //a shorthand id for easier identification

	public function str() {
		if(!state.log) return;
		trace('\t\tgeometry ; ' + short_id());
		state.log = true;
		state.str();
		state.log = false;
	}

	public function drop( ?remove:Bool = true ) {
		
		dropped = true;

		if( remove && added ) {
			
			for(b in batchers) {
				b.remove( this, true );
			} //for each batcher

		} //if remove && added

	} //drop

	public function compare( other:Geometry ) : Int {
		
		return state.compare( other.state );

	} //compare

	public function add( v : Vertex ) {

		vertices.push( v );

	} //add

	public function remove( v : Vertex ) {

		vertices.remove(v);

	} //remove 

	public function batch( vertlist : Array<Float>, tcoordlist : Array<Float>, 
						   colorlist : Array<Float>, normallist : Array<Float> ) {

		var origin_x = origin.x;
		var origin_y = origin.y;
		var origin_z = origin.z;

		for(v in vertices) {			

				//the base position of the vert
			_final_vert_position.set( v.pos.x - origin_x, v.pos.y - origin_y, v.pos.z - origin_z );
				//compose the final position matrix
			matrix.compose( pos, rotation, scale );
				//apply the transform to the vert
			_final_vert_position.applyMatrix4( matrix );

				//submit vert positions
			vertlist.push( _final_vert_position.x );
			vertlist.push( _final_vert_position.y );
			vertlist.push( _final_vert_position.z );

				//texture coordinates todo:multiple uv sets
			tcoordlist.push( v.uv[0].u );
			tcoordlist.push( v.uv[0].v );

			if(v.color == null) {
				throw id;
			}
				//color values per vertex
			colorlist.push( v.color.r );
			colorlist.push( v.color.g );
			colorlist.push( v.color.b );
			colorlist.push( v.color.a );

				//normal directions
			normallist.push( v.normal.x );
			normallist.push( v.normal.y );
			normallist.push( v.normal.z );

		} //each vertex

	} //batch

//Transform

	public function translate( _offset:Vector ) {

		pos.set( pos.x+_offset.x, pos.y+_offset.y, pos.x+_offset.z );

	} // translate

	public function set_origin( _origin:Vector ) : Vector {

		return origin = _origin;

	} //set_origin

	public function set_pos( _position:Vector ) : Vector {

		return pos = _position;

	} //set_pos

	public function get_pos() : Vector {
		
		return pos;

	} //get_pos

	public function set_rotation( _rotation:Quaternion ) {

		if(rotation == null) { 
			return rotation = _rotation;
		} //rotation == null			
		
		return rotation = _rotation;

	} //set_rotation

	public function get_rotation() : Quaternion {
		
		return rotation;
		
	} //get_rotation

	public function set_scale( _scale:Vector ) {

		if(scale == null) { 
			return scale = _scale;
		} //rotation == null			
		
		return scale = _scale;

	} //set_rotation

	public function get_scale() : Vector {

		return scale;

	} //get_scale

//Invariants that cause a shift in the geometry tree

	function refresh() {

			//remove from all batchers
		for(b in batchers) {
			b.remove( this, false );
		} //for each batcher

				//update the values from the shadow values, if needed
			if(dirty_primitive_type) {
				dirty_primitive_type = false;
				state.primitive_type = shadow_primitive_type;
			} //dirty_primitive_type

			if(dirty_texture) {
				dirty_texture = false;
				state.texture = shadow_texture;
			} //dirty_texture

			if(dirty_shader) {
				dirty_shader = false;
				state.shader = shadow_shader;
			} //dirty_shader

			if(dirty_group) {
				dirty_group = false;
				state.group = shadow_group;
			} //dirty_group

			if(dirty_depth) {
				dirty_depth = false;
				state.depth = shadow_depth;
			} //dirty_depth

			if(dirty_clip) {
				dirty_clip = false;
				state.clip = shadow_clip;
			} //dirty_clip

		for(b in batchers) {
			b.add(this,false);
		} //for each batcher

	} //refresh

//Primitive Type

	private function get_primitive_type() : PrimitiveType {

		return state.primitive_type;

	} //get_primitive_type

	private function set_primitive_type( val : PrimitiveType ) : PrimitiveType {	

		if(state.primitive_type != val) {
			shadow_primitive_type = val;
			dirty_primitive_type = true;
			refresh();		
		}
		
		return primitive_type = val;

	} //set_primitive_type

//Texture

	public function get_texture() : Texture {

		return state.texture;

	} //get_texture

	public function set_texture(val : Texture) : Texture {
		
		if(state.texture != val) {
			shadow_texture = val;
			dirty_texture = true;
			refresh();		
		}
		
		return texture = val;

	} //set_texture

//Visibility

	public function set_enabled(val : Bool) : Bool {

		return enabled = val;

	} //set_enabled

//Color

	public function set_color(val : Color) : Color {

		for(v in vertices) {
			v.color = val.clone();
		} //for each vertex

		return color = val;

	} //set_color
	
//Shader

	public function get_shader() : Shader {

		return state.shader;

	} //get_shader

	public function set_shader(val : Shader) : Shader {

		if(state.shader != val) {
			shadow_shader = val;
			dirty_shader = true;
			refresh();
		}
		
		return shader = val;

	} //set_shader

//Depth

	public function get_depth() : Float {

		return state.depth;

	} //get_depth


	public function set_depth(val : Float) : Float {

		if(state.depth != val) {
			shadow_depth = val;
			dirty_depth = true;
			refresh();
		}

		return depth = val;

	} //set_depth

//Group

	public function get_group() : Int {

		return state.group;

	} //get_group

	public function set_group(val : Int) : Int {		

		if(state.group != val) {
			shadow_group = val;
			dirty_group = true;
			refresh();
		}
		
		return group = val;

	} //set_group

//Clip

	public function get_clip() : Bool {

		return state.clip;

	} //get_clip

	public function set_clip(val : Bool) : Bool {		

		if(state.clip != val) {
			shadow_clip = val;
			dirty_clip = true;
			refresh();		
		}
		
		return clip = val;

	} //set_clip

//Clip rect

	public function get_clip_rect() : Rectangle {

		return state.clip_rect;

	} //get_clip_rect

	public function set_clip_rect(val : Rectangle) : Rectangle {

		return state.clip_rect = val;

	} //set_clip_rect


} //Geometry


