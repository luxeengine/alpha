package luxe.tween.easing;
	
	
/**
 * @author Joshua Granick
 * @author Philippe / http://philippe.elsass.me
 */
interface IEasing {
	
	
	function calculate (k:Float):Float;
	function ease (t:Float, b:Float, c:Float, d:Float):Float;
	
	
}