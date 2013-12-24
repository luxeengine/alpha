package luxe;

import luxe.Rectangle;
import luxe.Vector;
import luxe.Entity;
import luxe.tween.Actuate;
import luxe.tween.easing.Quad;
import phoenix.Camera.ProjectionType;

typedef ProjectionType = phoenix.Camera.ProjectionType;

class Camera extends Entity {
	
	public var view : phoenix.Camera;
	private var view_position : Vector;

    @:isVar public var size (get,set) : Vector;

	public var bounds : Rectangle;

	public var shake_vector : Vector;
    public var shake_amount : Float;
    public var shaking : Bool = false;

	public function new(?options:Dynamic = null) {
			
		if(options == null) options = {};		

			//Init the entity part
		super();
			//Start with defaults
		name = 'untitled camera';

				//Apply options
			name = options.name == null ? name : options.name;
			view = options.view == null ? new phoenix.Camera(options) : options.view;

			//Update
		view_position = view.pos;

	}

    public var zoom_amount : Float = 1;
    public var minimum_zoom_scale : Float = 0.1;
    var zoom_scale : Float = 1;

    var ring : phoenix.geometry.RingGeometry;

    public function zoom( _scale:Float, ?adjust_pos:Bool=true ) {
        
    //     trace( '\n -' );
    //     trace( "_scale " + zoom_amount + " vs new " + _scale );

    //         //center of the screen
    //     var mid_x = Luxe.screen.w/2;
    //     var mid_y = Luxe.screen.h/2;
    //     var _ratio = (zoom_amount/_scale);
    //     var _invratio = 1/_ratio;

    //     trace( 'ratio '+ _ratio );
    //     trace( '1/ratio '+ _invratio );

    //     // if(_ratio == 1) return;

    //         //limit the scale
    //     if(_scale < minimum_zoom_scale) _scale = minimum_zoom_scale;

    //         //find the vector between mid and top left corner
    //     var line_x = (mid_x - pos.x);
    //     var line_y = (mid_y - pos.y);

    //         //now find the center of that line
    //     line_x /= _ratio;
    //     line_y /= _ratio;

    //     var top_left_x = mid_x - pos.x;
    //     var top_left_y = mid_y - pos.y;

    //         //now, work out the difference between the old pos, and the new pos
    //     var diff_x = line_x - top_left_x;
    //     var diff_y = line_y - top_left_y;        

    //     trace( 'z/o '+ _scale + ', ' + zoom_amount );
    //     trace( 'line '+ line_x + ', ' + line_y );
    //     trace( 'pos '+ pos.x + ', ' + pos.y );
    //     trace( 'diff '+ diff_x + ', ' + diff_y );        

    // //draw the point for debug
    //     Luxe.debug.batcher.enabled = true;
    //     if(ring != null) {
    //         ring.drop();
    //     }
        
    //     ring = Luxe.draw.ring({      
    //         x : line_x, y : line_y, 
    //         r : 4, color : new Color().rgb(0xff4b03),
    //         depth : 20,
    //         batcher : Luxe.debug.batcher
    //     }); 

    //         //adjust the zoom amount
    //     var _last_zoom = zoom_amount;
    //         zoom_amount = _scale;
    
            //scale the view
        view.scale.x = 1/_scale;
        view.scale.y = 1/_scale;

        // pos = pos.add(new Vector(diff_x, diff_y));

            //measure the difference from the position

    } //zoom

    function set_size( _p:Vector ) : Vector {

            view.size = _p;

        return size = _p;

    } //set_size

    function get_size() : Vector {

        return view.size;

    } //get_size


		///Focus the camera on a specific point, for Ortho atm
	public function center( _p:Vector, _t:Float = 0.6, ?oncomplete:Void->Void=null ) {	

		var center_point_x = _p.x - (view.size.x/2);
		var center_point_y = _p.y - (view.size.y/2);

		Actuate.tween(view_position, _t, { x:center_point_x, y:center_point_y }, true )
            .onComplete( oncomplete ).ease( Quad.easeInOut );

	} //

    @:noCompletion public override function get_pos() : Vector {
        return view_position;
    }

	@:noCompletion public override function set_pos(v:Vector) : Vector {
		
		if(bounds != null) {
        	if(v.x < bounds.x) v.x = bounds.x;
        	if(v.y < bounds.y) v.y = bounds.y;
        	if(v.x > bounds.w-view.size.x) v.x = bounds.w-view.size.x;
        	if(v.y > bounds.h-view.size.y) v.y = bounds.h-view.size.y;
        }

        // var _newp = v.clone().divideScalar(zoom_amount);
		view_position = v;
		pos = v;

			//listen for sub changes on properties
		_attach_listener( pos, _pos_change );

		return pos;
	}

    public function shake(amount:Float) {
        shake_amount = amount;
        shaking = true;
    }

        //Called by the scene the camera belongs to
    @:noCompletion public function update(dt:Float) {    	       

    		//start at our base position
    	var final_position = view_position.clone();
    		//add camera shake
        if(shaking) {
            shake_vector = Luxe.utils.geometry.random_point_in_unit_circle();
            shake_vector.x *= shake_amount;
            shake_vector.y *= shake_amount; 
            shake_vector.z *= shake_amount;         
            shake_amount *= 0.9;
            final_position = Vector.Add(final_position, shake_vector);
        } 

        	//check that we are within the given bounds
        if(bounds != null) {
        	if(final_position.x < bounds.x) final_position.x = bounds.x;
        	if(final_position.y < bounds.y) final_position.y = bounds.y;
        	if(final_position.x > bounds.w-view.size.x) final_position.x = bounds.w-view.size.x;
        	if(final_position.y > bounds.h-view.size.y) final_position.y = bounds.h-view.size.y;
        }

        	//finally, assign the position
        view.pos = final_position;        

    } //update

    public override function get_serialize_data() : Dynamic {

        var _data : Dynamic = super.get_serialize_data();

        var _extra : Dynamic = {
            camera_type : view.projection.getName()            
        };
        
        if(bounds != null)                                  _extra.bounds = bounds.serialized;
        if(view.target != null)                             _extra.target = view.target.serialized;
        if(view.projection == ProjectionType.ortho)         _extra.camera_options = view.perspective_options;
        if(view.projection == ProjectionType.perspective)   _extra.camera_options = view.ortho_options;

        return _merge_properties(_data, _extra);

    } //get_serialize_data    

}