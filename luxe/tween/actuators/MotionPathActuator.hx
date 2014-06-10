package luxe.tween.actuators;


import luxe.tween.MotionPath;


/**
 * @author Joshua Granick
 */
class MotionPathActuator extends SimpleActuator {
    
    
    public function new (target:Dynamic, duration:Float, properties:Dynamic) {
        
        super (target, duration, properties);
        
    }
    
    
    public override function apply ():Void {
        
        for (propertyName in Reflect.fields (properties)) {
            
            if (#if flash false && #end Reflect.hasField (target, propertyName)) {
                    
                Reflect.setField (target, propertyName, cast (Reflect.field (properties, propertyName), IComponentPath).end);
                
            } else {
                
                Reflect.setProperty (target, propertyName, cast (Reflect.field (properties, propertyName), IComponentPath).end);
                
            }
            
        }
        
    }
    
    
    private override function initialize ():Void {
        
        var details:PropertyPathDetails;
        var path:IComponentPath;
        
        for (propertyName in Reflect.fields (properties)) {
            
            path = cast (Reflect.field (properties, propertyName), IComponentPath);
            
            if (path != null) {
                
                var isField = true;
                
                if (#if flash false && #end Reflect.hasField (target, propertyName)) {
                    
                    path.start = Reflect.field (target, propertyName);
                    
                } else {
                    
                    isField = false;
                    path.start = Reflect.getProperty (target, propertyName);
                    
                }
                
                
                details = new PropertyPathDetails (target, propertyName, path, isField);
                propertyDetails.push (details);
                
            }
            
        }
        
        detailsLength = propertyDetails.length;
        initialized = true;
        
    }
    
    
    private override function update (currentTime:Float):Void {
        
        if (!paused) {
            
            var details:PropertyPathDetails;
            var easing:Float;
            
            var tweenPosition = (currentTime - timeOffset) / duration;
            
            if (tweenPosition > 1) {
                
                tweenPosition = 1;
                
            }
            
            if (!initialized) {
                
                initialize ();
                
            }
            
            if (!special) {
                
                easing = _ease.calculate (tweenPosition);
                
                for (details in propertyDetails) {
                    
                    if (details.isField) {
                        
                        Reflect.setField (details.target, details.propertyName, cast (details, PropertyPathDetails).path.calculate (easing));
                        
                    } else {
                        
                        Reflect.setProperty (details.target, details.propertyName, cast (details, PropertyPathDetails).path.calculate (easing));
                        
                    }
                    
                }
                
            } else {
                
                if (!_reverse) {
                    
                    easing = _ease.calculate (tweenPosition);
                    
                } else {
                    
                    easing = _ease.calculate (1 - tweenPosition);
                    
                }
                
                var endValue:Float;
                
                for (details in propertyDetails) {
                    
                    if (!_snapping) {
                        
                        if (details.isField) {
                            
                            Reflect.setField (details.target, details.propertyName, cast (details, PropertyPathDetails).path.calculate (easing));
                            
                        } else {
                            
                            Reflect.setProperty (details.target, details.propertyName, cast (details, PropertyPathDetails).path.calculate (easing));
                            
                        }
                        
                    } else {
                        
                        if (details.isField) {
                            
                            Reflect.setField (details.target, details.propertyName, Math.round (cast (details, PropertyPathDetails).path.calculate (easing)));
                            
                        } else {
                            
                            Reflect.setProperty (details.target, details.propertyName, Math.round (cast (details, PropertyPathDetails).path.calculate (easing)));
                            
                        }
                        
                        
                    }
                    
                }
                
            }
            
            if (tweenPosition == 1) {
                
                if (_repeat == 0) {
                    
                    active = false;
                    
					if (toggleVisible && getField (target, "alpha") == 0) {
                        
						setField (target, "visible", false);
                        
                    }
                    
                    complete (true);
                    return;
                    
                } else {
                    
                    if (_reflect) {
                        
                        _reverse = !_reverse;
                        
                    }
                    
                    startTime = currentTime;
                    timeOffset = startTime + _delay;
                    
                    if (_repeat > 0) {
                        
                        _repeat --;
                        
                    }
                    
                }
                
            }
            
            if (sendChange) {
                
                change ();
                
            }
            
        }
        
    }
    
    
}


#if !haxe3
import com.eclecticdesignstudio.motion.MotionPath;
#end


class PropertyPathDetails extends PropertyDetails {
    
    
    public var path:IComponentPath;
    
    
    public function new (target:Dynamic, propertyName:String, path:IComponentPath, isField:Bool = true) {
        
        super (target, propertyName, 0, 0, isField);
        
        this.path = path;
        
    }
    
    
}
