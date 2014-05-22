package luxe.tween.actuators;


/**
 * @author Joshua Granick
 * @version 1.2
 */
class MethodActuator extends SimpleActuator {
    
    
    private var currentParameters:Array <Dynamic>;
    private var tweenProperties:Dynamic;
    
    
    public function new (target:Dynamic, duration:Float, properties:Dynamic) {
        
        currentParameters = new Array <Dynamic> ();
        tweenProperties = { };
        
        super (target, duration, properties);
        
        if (!Reflect.hasField (properties, "start")) {
            
            this.properties.start = new Array <Dynamic> ();
            
        }
        
        if (!Reflect.hasField (properties, "end")) {
            
            this.properties.end = this.properties.start;
            
        }
        
        for (i in 0...this.properties.start.length) {
            
            currentParameters.push (null);
            
        }
        
    }
    
    
    public override function apply ():Void {
        
        #if (neko && (haxe_209 || haxe3))
        
        untyped __dollar__call (target , null, properties.end);
        
        #else
        
        Reflect.callMethod (null, target, properties.end);
        
        #end
        
    }
    
    
    private override function complete (sendEvent:Bool = true):Void {
        
        for (i in 0...properties.start.length) {
            
            currentParameters[i] = Reflect.field (tweenProperties, "param" + i);
            
        }
        
        #if (neko && (haxe_209 || haxe3))
        
        untyped __dollar__call (target , null, currentParameters);
        
        #else
        
        Reflect.callMethod (null, target, currentParameters);
        
        #end
        
        super.complete (sendEvent);
        
    }
    
    
    private override function initialize ():Void {
        
        var details:PropertyDetails;
        var propertyName:String;
        var start:Dynamic;
        
        for (i in 0...properties.start.length) {
            
            propertyName = "param" + i;
            start = properties.start[i];
            
            Reflect.setField (tweenProperties, propertyName, start);
            
            if (Std.is (start, Float) || Std.is (start, Int)) {
                
                details = new PropertyDetails (tweenProperties, propertyName, start, properties.end[i] - start);
                propertyDetails.push (details);
                
            }
            
        }
        
        detailsLength = propertyDetails.length;
        initialized = true;
        
    }
    
    
    private override function update (currentTime:Float):Void {
        
        super.update (currentTime);
        
        if (active) {
            
            for (i in 0...properties.start.length) {
                
                currentParameters[i] = Reflect.field (tweenProperties, "param" + i);
                
            }
            
            #if (neko && (haxe_209 || haxe3))
            
            untyped __dollar__call (target , null, currentParameters);
            
            #else
            
            Reflect.callMethod (null, target, currentParameters);
            
            #end
            
        }
        
    }
    
    
}