/**
 * @author Joshua Granick
 */
package luxe.tween;


import luxe.tween.actuators.GenericActuator;
import luxe.tween.actuators.MethodActuator;
import luxe.tween.actuators.MotionPathActuator;
import luxe.tween.actuators.SimpleActuator;
import luxe.tween.easing.IEasing;
import luxe.tween.easing.Quad;

class Actuate {
    
    
    public static var defaultActuator:Class <GenericActuator> = SimpleActuator;
    public static var defaultEase:IEasing = Quad.easeOut;
    private static var targetLibraries:ObjectHash <Array <GenericActuator>> = new ObjectHash <Array <GenericActuator>> ();
    
    
    /**
     * Copies properties from one object to another. Conflicting tweens are stopped automatically
	 * @example		<code>Actuate.apply (MyClip, { alpha: 1 } );</code>
	 * @param	target		The object to copy to
	 * @param	properties		The object to copy from
	 * @param	customActuator		A custom actuator to use instead of the default (Optional)
	 * @return		The current actuator instance, which can be used to apply properties like onComplete or onUpdate handlers
     */
    public static function apply (target:Dynamic, properties:Dynamic, customActuator:Class <GenericActuator> = null):IGenericActuator {
        
        stop (target, properties);
        
        if (customActuator == null) {
            
            customActuator = defaultActuator;
            
        }
        
        var actuator = Type.createInstance (customActuator, [ target, 0, properties ]);
        actuator.apply ();
        
        return actuator;
        
    }
    
        
	private static function getLibrary (target:Dynamic, allowCreation:Bool = true):Array <GenericActuator> {
		
		if (!targetLibraries.exists (target) && allowCreation) {
            
            targetLibraries.set (target, new Array <GenericActuator> ());
            
        }
        
        return targetLibraries.get (target);
        
    }
    
    
    /**
     * Creates a new MotionPath tween
	 * @param	target		The object to tween
	 * @param	duration		The length of the tween in seconds
	 * @param	properties		An object containing a motion path for each property you wish to tween
	 * @param	overwrite		Sets whether previous tweens for the same target and properties will be overwritten (Default is true)
	 * @return		The current actuator instance, which can be used to apply properties like ease, delay, onComplete or onUpdate
     */
    public static function motionPath (target:Dynamic, duration:Float, properties:Dynamic, overwrite:Bool = true):IGenericActuator {
        
        return tween (target, duration, properties, overwrite, MotionPathActuator);
        
    }
    
    
    /**
     * Pauses tweens for the specified target objects
	 * @param	... targets		The target objects which will have their tweens paused. Passing no value pauses tweens for all objects
     */
    //public static function pause (... targets:Array):void {
    public static function pause (target:Dynamic):Void {
        
        if (Std.is (target, GenericActuator)) {
            
            cast (target, GenericActuator).pause ();
            
        } else {
            
			var library:Array <GenericActuator> = getLibrary (target, false);
            
			if (library != null) {
				
            for (actuator in library) {
                
                actuator.pause ();
                
            }
            
        }
        
    }
    
	}
    
	
    public static function pauseAll ():Void {
        
        for (library in targetLibraries) {
            
            for (actuator in library) {
                
                actuator.pause ();
                
            }
            
        }
        
    }
    
    
    /**
     * Resets Actuate by stopping and removing tweens for all objects
     */
    public static function reset ():Void {
        
        for (library in targetLibraries) {
            
            var i = library.length - 1;
            while (i >= 0) {
                library[i].stop (null, false, false);
                i--;
            }
            
        }
        
        targetLibraries = new ObjectHash <Array <GenericActuator>> ();
        
    }
    
    
    /**
     * Resumes paused tweens for the specified target objects
	 * @param	... targets		The target objects which will have their tweens resumed. Passing no value resumes tweens for all objects
     */
    public static function resume (target:Dynamic):Void {
        
        if (Std.is (target, GenericActuator)) {
            
            cast (target, GenericActuator).resume ();
            
        } else {
            
			var library:Array <GenericActuator> = getLibrary (target, false);
			
			if (library != null) {
            
            for (actuator in library) {
                
                actuator.resume ();
					
				}
                
            }
            
        }
        
    }
    
    
    public static function resumeAll ():Void {
        
        for (library in targetLibraries) {
            
            for (actuator in library) {
                
                actuator.resume ();
                
            }
            
        }
        
    }
    
    
    /**
     * Stops all tweens for an individual object
	 * @param	target		The target object which will have its tweens stopped, or a generic actuator instance
	 * @param	properties		A string, array or object which contains the properties you wish to stop, like "alpha", [ "x", "y" ] or { alpha: null }. Passing no value removes all tweens for the object (Optional)
	 * @param	complete		If tweens should apply their final target values before stopping. Default is false (Optional) 
	 * @param	sendEvent	If a complete() event should be dispatched for the specified target. Default is true (Optional)
     */
    public static function stop (target:Dynamic, properties:Dynamic = null, complete:Bool = false, sendEvent:Bool = true):Void {
        
        if (target != null) {
            
            if (Std.is (target, GenericActuator)) {
                
                cast (target, GenericActuator).stop (null, complete, sendEvent);
                
            } else {
                
				var library:Array <GenericActuator> = getLibrary (target, false);
				
				if (library != null) {
                
                if (Std.is (properties, String)) {
                    
                    var temp = { };
                    Reflect.setField (temp, properties, null);
                    properties = temp;
                    
                } else if (Std.is (properties, Array)) {
                    
                    var temp = {};
                    
                    for (property in cast (properties, Array <Dynamic>)) {
                        
                        Reflect.setField (temp, property, null);
                        
                    }
                    
                    properties = temp;
                    
                }
                
                var i = library.length - 1;
                while (i >= 0) {
                    library[i].stop (properties, complete, sendEvent);
                    i--;
                }
                
            }
            
        }
        
    }
    
	}
    
	
    /**
     * Creates a tween-based timer, which is useful for synchronizing function calls with other animations
	 * @example		<code>Actuate.timer (1).onComplete (trace, [ "Timer is now complete" ]);</code>
	 * @param	duration		The length of the timer in seconds
	 * @param	customActuator		A custom actuator to use instead of the default (Optional)
	 * @return		The current actuator instance, which can be used to apply properties like onComplete or to gain a reference to the target timer object
     */
    public static function timer (duration:Float, customActuator:Class <GenericActuator> = null):IGenericActuator {
        
        return tween (new TweenTimer (0), duration, new TweenTimer (1), false, customActuator);
        
    }
	
    
    
    /**
     * Creates a new tween
	 * @example		<code>Actuate.tween (MyClip, 1, { alpha: 1 } ).onComplete (trace, [ "MyClip is now visible" ]);</code>
	 * @param	target		The object to tween
	 * @param	duration		The length of the tween in seconds
	 * @param	properties		The end values to tween the target to
	 * @param	overwrite			Sets whether previous tweens for the same target and properties will be overwritten (Default is true)
	 * @param	customActuator		A custom actuator to use instead of the default (Optional)
	 * @return		The current actuator instance, which can be used to apply properties like ease, delay, onComplete or onUpdate
     */ 
    public static function tween (target:Dynamic, duration:Float, properties:Dynamic, overwrite:Bool = true, customActuator:Class <GenericActuator> = null):IGenericActuator {
        
        if (target != null) {
            
            if (duration > 0) {
                
                if (customActuator == null) {
                    
                    customActuator = defaultActuator;
                    
                }
                
                var actuator = Type.createInstance (customActuator, [ target, duration, properties ]);
                var library = getLibrary (actuator.target);
                
                if (overwrite) {
                    
                    var i = library.length - 1;
                    
                    while (i >= 0) {
                        library[i].stop (actuator.properties, false, false);
                        i--;
                    }
                    
					library = getLibrary (actuator.target);
					
                }
                
                library.push (actuator);
                actuator.move ();
                
                /*var actuator:GenericActuator = createInstance (customActuator, target, duration, properties);
                
                if (overwrite) {
                    
                    stop (target, properties, false, false);
                    
                }
                
                var library:Array <GenericActuator> = getLibrary (target);
                library.push (actuator);
                
                actuator.move ();*/
                
                return actuator;
                
            } else {
                
                return apply (target, properties, customActuator);
                
            }
            
        }
        
        return null;
        
    }
    
    
    public static function unload (actuator:GenericActuator):Void {
        
        var target = actuator.target;
        
        if (targetLibraries.exists (target)) {
            
            targetLibraries.get (target).remove (actuator);
            
            if (targetLibraries.get (target).length == 0) {
                
                targetLibraries.remove (target);
                
            }
            
        }
        
    }
    
    
    /**
     * Creates a new tween that updates a method rather than setting the properties of an object
	 * @example		<code>Actuate.update (trace, 1, ["Value: ", 0], ["", 1]).onComplete (trace, [ "Finished tracing values between 0 and 1" ]);</code>
	 * @param	target		The method to update		
	 * @param	duration		The length of the tween in seconds
	 * @param	start		The starting parameters of the method call. You may use both numeric and non-numeric values
	 * @param	end		The ending parameters of the method call. You may use both numeric and non-numeric values, but the signature should match the start parameters
	 * @param	overwrite		Sets whether previous tweens for the same target and properties will be overwritten (Default is true)
	 * @return		The current actuator instance, which can be used to apply properties like ease, delay, onComplete or onUpdate
     */
    public static function update (target:Dynamic, duration:Float, start:Array <Dynamic> = null, end:Array <Dynamic> = null, overwrite:Bool = true):IGenericActuator {
        
        var properties:Dynamic = { start: start, end: end };
        
        return tween (target, duration, properties, overwrite, MethodActuator);
        
    }
    
    
}




@:noCompletion private class TweenTimer {


    public var progress:Float;


    public function new (progress:Float):Void {
        
        this.progress = progress;
        
    }


}


typedef ObjectHash<T> = haxe.ds.ObjectMap<Dynamic, T>;
