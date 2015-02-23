package phoenix;

import phoenix.Rectangle;
import phoenix.Vector;
import phoenix.Camera;

class Ray {
	public var origin : Vector;
	public var end : Vector;
	public var dir : Vector;
	
	public var screen_pos(default, set) : Vector;
	
	var start_ndc : Vector;
	var end_ndc : Vector;
	
	var camera : Camera;
	var viewport : Rectangle;
	
	public function new(_screen_pos:Vector, _camera:Camera, ?_viewport:Rectangle = null) {
		if (_camera == null) {
			throw "Camera required for a ray!";
		}
		
		if (_viewport == null) {
			_viewport = new Rectangle(0, 0, Luxe.screen.w, Luxe.screen.h);
		}
		
		camera = _camera;
		viewport = _viewport;
		start_ndc = new Vector(0, 0, 0, 1);
		end_ndc = new Vector(0, 0, 1, 1);
		screen_pos = _screen_pos;
	}
	
		/** Refresh the ray */
	public function refresh():Void {
		origin = camera.unproject(start_ndc);
		end = camera.unproject(end_ndc);
		dir = Vector.Subtract(end, origin);
	}
	
		/** Get a point along the ray */
	public function get_point(distance:Float):Vector {
		dir.length = distance;
		return Vector.Add(origin, dir);
	}
		/** Refresh the ray and get a point along it */
	public function refresh_and_get(distance:Float):Vector {
		refresh();
		return get_point(distance);
	}
	
		/** Set a new screen pos, then get a point along the ray */
	public function set_and_get(_screen_pos:Vector, distance:Float):Vector {
		screen_pos = _screen_pos;
		return get_point(distance);
	}
	
	function set_screen_pos(_v:Vector):Vector {
		start_ndc.x = end_ndc.x = (_v.x/viewport.w - 0.5) * 2;
		start_ndc.y = end_ndc.y = ((viewport.h - _v.y) / viewport.h - 0.5) * 2;
		refresh();
		return screen_pos = _v;
	}
}