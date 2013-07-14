package phoenix.geometry;

import phoenix.geometry.Vertex;
import phoenix.Matrix4;
import phoenix.Vector;
import phoenix.Shader;
import phoenix.Texture;
import phoenix.Batcher;

import lime.utils.ByteArray;
import lime.utils.Float32Array;
import lime.utils.IMemoryRange;



class Geometry {

	public var vertices : Array<Vertex>;

	public var locked : Bool = false;
	public var matrix : Matrix4; //used for rotation and more

	public var state : GeometryState;
	public var dropped : Bool = false;
	public var uuid : String = '';

		//State properties
	@:isVar public var primitive_type(get, set) : PrimitiveType;
	@:isVar public var texture(get, set) : Texture;
	@:isVar public var shader(get, set) : Shader;
	@:isVar public var depth(get, set) : Float;
	@:isVar public var group(get, set) : Int;
	@:isVar public var clip(get, set) : Bool;

		//Geometry properties	
	@:isVar public var enabled(default, set) : Bool = true;
	@:isVar public var immediate(default, default) : Bool;
	@:isVar public var pos(default, set) : Vector;
	@:isVar public var origin(default, default) : Vector;
	@:isVar public var color(default, set) : Color;

	public function new(options:Dynamic) {
		
		uuid = lab.utils.UUID.get();
		vertices = new Array<Vertex>();
		state = new GeometryState();
		pos = new Vector();
		origin = new Vector();

		matrix = new Matrix4();
		matrix = matrix.identity();

		if(options != null) {
			
			state.depth = options.depth == null ? state.depth : options.depth;
			state.group = options.group == null ? state.group : options.group;
			state.texture = options.texture == null ? state.texture : options.texture;			
			state.clip = options.clip == null ? state.clip : options.clip;
			state.primitive_type = options.type == null ? state.primitive_type : options.type;
			state.shader = options.shader == null? state.shader : options.shader;

			pos = (options.pos == null) ? pos : options.pos;
			origin = (options.origin == null) ? origin : options.origin;
			immediate = (options.immediate == null) ? true : options.immediate;
			
			color = (options.color == null) ? new Color() : options.color;
			// trace("creating geometry " + uuid +  " \t\t " + options );
		}

	}

	public function short_id() {
		return uuid.substr(0, uuid.indexOf('-'));
	}

	public function str() {
		if(!state.log) return;
		trace('\t\tgeometry ; ' + short_id());
		state.log = true;
		state.str();
		state.log = false;
	}

	public function drop() {
		dropped = true;
	}

	public function compare( other:Geometry ) {
		return state.compare( other.state );
	}

	public function add( v : Vertex ) {
		vertices.push( v );
	}

	public function remove( v : Vertex ) {
		vertices.remove(v);
	}

	public function batch( 
			vertlist : Array<Float>, tcoordlist : Array<Float>, 
			colorlist:Array<Float>, normallist : Array<Float> ) {
		
		for(v in vertices) {
				
				//vert positions
			vertlist.push( v.pos.x );
			vertlist.push( v.pos.y );
			vertlist.push( v.pos.z );

				//texture coordinates
			tcoordlist.push( v.uv[0].u );
			tcoordlist.push( v.uv[0].v );

				//color values todo : per vertex colors
			colorlist.push( color.r );
			colorlist.push( color.g );
			colorlist.push( color.b );
			colorlist.push( color.a );

				//normal directions
			normallist.push( v.normal.x );
			normallist.push( v.normal.y );
			normallist.push( v.normal.z );


		}
	}

		//todo use origin!
	public function rotate( _offset:Vector ) {
		translate(pos.inverted);

			matrix.setRotationFromEuler(_offset);
			for(v in vertices) {
				matrix.multiplyVector3(v.pos);
			}

		translate(pos);
	}
		//todo use origin!
	public function scale( _offset:Vector ) {
		translate(pos.inverted);
		for(v in vertices) {
			v.pos.x *= _offset.x;
			v.pos.y *= _offset.y;
			v.pos.z *= _offset.z;
		}
		translate(pos);
	}

	public function translate( _offset:Vector ) {
		for(v in vertices) {
			v.pos.x += _offset.x;
			v.pos.y += _offset.y;
			v.pos.z += _offset.z;
		}
	}

//Position
	public function set_pos(_v:Vector) : Vector {
			//when first creating the vector, we give it a blank vector
		if(pos == null) return {
			pos = _v;
		}

			//Now there is a position to set,
			//find the difference between the new position
			//and the existing position we have.
		var difference : Vector = Vector.Subtract(_v, pos);
			//translate that difference only
		translate(difference);
			//setter value
		return pos = _v;
	}

//Primitive Type
	public function get_primitive_type() : PrimitiveType {
		return state.primitive_type;
	}

	public function set_primitive_type(val : PrimitiveType) : PrimitiveType {		
		return state.primitive_type = val;
	}
//Texture
	public function get_texture() : Texture {
		return state.texture;
	}

	public function set_texture(val : Texture) : Texture {		
		return state.texture = val;
	}

//Enabled
	public function set_enabled(val : Bool) : Bool {		
		return enabled = val;
	}
//Color
	public function set_color(val : Color) : Color {		
		return color = val;
	}
	
//Shader
	public function get_shader() : Shader {
		return state.shader;
	}

	public function set_shader(val : Shader) : Shader {		
		return state.shader = val;
	}
//Depth
	public function get_depth() : Float {
		return state.depth;
	}

	public function set_depth(val : Float) : Float {		
		return state.depth = val;
	}
//Group
	public function get_group() : Int {
		return state.group;
	}

	public function set_group(val : Int) : Int {		
		return state.group = val;
	}
//Clip
	public function get_clip() : Bool {
		return state.clip;
	}

	public function set_clip(val : Bool) : Bool {
		return state.clip = val;
	}
//


}