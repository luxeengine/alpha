package phoenix;

import phoenix.Rectangle;
import phoenix.Vector;
import phoenix.Camera;

class Ray {
	public var screen_pos(default, set) : Vector;
	var start_ndc : Vector;
	var end_ndc : Vector;
	public var origin : Vector;
	public var end : Vector;
	public var dir : Vector;
	
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
		start_ndc = new Vector(0,0,0,1);
		end_ndc = new Vector(0, 0, 1, 1);
		screen_pos = _screen_pos;
	}
	
	function set_screen_pos(_v:Vector):Vector {
		start_ndc.x = end_ndc.x = (_v.x/viewport.w - 0.5) * 2;
		start_ndc.y = end_ndc.y = ((viewport.h - _v.y) / viewport.h - 0.5) * 2;
		refresh();
		return screen_pos = _v;
	}
	
	public function refresh():Void {
		origin = camera.unproject(start_ndc);
		end = camera.unproject(end_ndc);
		dir = Vector.Subtract(end, origin);
	}
	
	public function get_point(along:Float):Vector {
		dir.length = along;
		return Vector.Add(origin, dir);
	}
	
	public function refresh_and_get(along:Float):Vector {
		refresh();
		return get_point(along);
	}
	
	public function set_and_get(_screen_pos:Vector, along:Float):Vector {
		screen_pos = _screen_pos;
		return get_point(along);
	}
}