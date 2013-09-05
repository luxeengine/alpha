package luxe.tween;
	
	
/**
 * @author Joshua Granick
 */
class MotionPath {
	
	
	public var x (get_x, null):IComponentPath;
	public var y (get_y, null):IComponentPath;
	
	private var _x:ComponentPath;
	private var _y:ComponentPath;
	
	
	public function new () {
		
		_x = new ComponentPath ();
		_y = new ComponentPath ();
		
	}
	
	
	/**
	 * Adds a bezier curve to the current motion path
	 * @param	x		The x position of the end point for the curve
	 * @param	y		The y position of the end point for the curve
	 * @param	controlX		The x position of the control point for the curve, which affects the angle and midpoint
	 * @param	controlX		The x position of the control point for the curve, which affects the angle and midpoint
	 * @param	strength		The degree of emphasis that should be placed on this segment. If a motion path contains multiple segments with the same strength, they all receive equal emphasis (Default is 1)
	 * @return		The current motion path instance
	 */
	public function bezier (x:Float, y:Float, controlX:Float, controlY:Float, strength:Float = 1):MotionPath {
		
		_x.addPath (new BezierPath (x, controlX, strength));
		_y.addPath (new BezierPath (y, controlY, strength));
		
		return this;
		
	}
	
	
	/**
	 * Adds a line to the current motion path
	 * @param	x		The x position of the end point for the line
	 * @param	x		The y position of the end point for the line
	 * @param	strength		The degree of emphasis that should be placed on this segment . If a motion path contains multiple segments with the same strength, they all receive equal emphasis (Default is 1)
	 * @return		The current motion path instance
	 */
	public function line (x:Float, y:Float, strength:Float = 1):MotionPath {
		
		_x.addPath (new LinearPath (x, strength));
		_y.addPath (new LinearPath (y, strength));
		
		return this;
		
	}
	
	
	
	
	// Get & Set Methods
	
	
	
	
	private function get_x ():IComponentPath {
		
		return _x;
		
	}
	
	
	private function get_y ():IComponentPath {
		
		return _y;
		
	}
	
	
}


class ComponentPath implements IComponentPath {
	
	
	public var start:Float;
	public var end (get_end, null):Float;
	
	private var paths:Array <BezierPath>;
	private var totalStrength:Float;
	
	
	public function new () {
		
		paths = new Array <BezierPath> ();
		start = 0;
		totalStrength = 0;
		
	}
	
	
	public function addPath (path:BezierPath):Void {
		
		paths.push (path);
		totalStrength += path.strength;
		
	}
	
	
	public function calculate (k:Float):Float {
		
		if (paths.length == 1) {
			
			return paths[0].calculate (start, k);
			
		} else {
			
			var ratio = k * totalStrength;
			var lastEnd = start;
			
			for (path in paths) {
				
				if (ratio > path.strength) {
					
					ratio -= path.strength;
					lastEnd = path.end;
					
				} else {
					
					return path.calculate (lastEnd, ratio / path.strength);
					
				}
				
			}
			
		}
		
		return 0;
		
	}
	
	
	
	// Get & Set Methods
	
	
	
	
	private function get_end ():Float {
		
		if (paths.length > 0) {
			
			var path = paths[paths.length - 1];
			return path.end;
			
		} else {
			
			return start;
			
		}
		
	}
	
	
}


interface IComponentPath {
	
	
	var end (get_end, null):Float;
	var start:Float;
	
	function calculate (k:Float):Float;
	
	
}




class BezierPath {
	
	
	public var control:Float;
	public var end:Float;
	public var strength:Float;
	
	
	public function new (end:Float, control:Float, strength:Float) {
		
		this.end = end;
		this.control = control;
		this.strength = strength;
		
	}
	
	
	public function calculate (start:Float, k:Float):Float {
		
		return (1 - k) * (1 - k) * start + 2 * (1 - k) * k * control + k * k * end;
		
	}
	
	
}


class LinearPath extends BezierPath {
	
	
	public function new (end:Float, strength:Float) {
		
		super (end, 0, strength);
		
	}
	
	
	public override function calculate (start:Float, k:Float):Float {
		
		return start + k * (end - start);
		
	}
	
	
}