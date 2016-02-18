package luxe.tween.actuators;


import luxe.tween.actuators.GenericActuator;

#if neko
import haxe.Log;
import haxe.PosInfos;
#end
import haxe.Timer;



/**
  @author Joshua Granick   
  @version 1.2   
 */
class SimpleActuator extends GenericActuator {


    var timeOffset:Float;

    static var actuators:Array <SimpleActuator> = new Array <SimpleActuator> ();
    static var actuatorsLength:Int = 0;
    static var addedEvent:Bool = false;

    static var timer:Timer;

    var active:Bool;
    var cacheVisible:Bool;
    var detailsLength:Int;
    var initialized:Bool;
    var paused:Bool;
    var pauseTime:Float;
    var propertyDetails:Array <PropertyDetails>;
    var sendChange:Bool;
    var setVisible:Bool;
    var startTime:Float;
    var toggleVisible:Bool;

    var has_timescaled_starttime : Bool = false;

    public function new (target:Dynamic, duration:Float, properties:Dynamic) {

        active = true;
        propertyDetails = new Array <PropertyDetails> ();
        sendChange = false;
        paused = false;
        cacheVisible = false;
        initialized = false;
        setVisible = false;
        toggleVisible = false;

        startTime = Luxe.time;

        super (target, duration, properties);

        if (!addedEvent) {

            addedEvent = true;
            Luxe.on(Luxe.Ev.tickstart, on_internal_update);

        }

    }


    /**
      @inheritDoc   
     */
    public override function autoVisible (?value:Null<Bool>):IGenericActuator {

        if (value == null) {

            value = true;

        }

        _autoVisible = value;

        if (!value) {

            toggleVisible = false;

            if (setVisible) {

                setField (target, "visible", cacheVisible);

            }

        }

        return this;

    }


    /**
      @inheritDoc   
     */
    public override function delay (duration:Float):IGenericActuator {

        _delay = duration;
        timeOffset = startTime + duration;

        return this;

    }


    inline function getField (target:Dynamic, propertyName:String):Dynamic {


        var value = null;

        if (Reflect.hasField (target, propertyName)) {

            value = Reflect.field (target, propertyName);

        } else {

            value = Reflect.getProperty (target, propertyName);

        }

        return value;

    }


    function initialize ():Void {

        var details:PropertyDetails;
        var start:Float;

        for (i in Reflect.fields (properties)) {

            var isField = true;

            if ( Reflect.hasField (target, i)
                    #if web && (!target.__properties__ || untyped !target.__properties__["set_" + i]) #end
               ) {

                start = Reflect.field (target, i);

            } else {

                isField = false;
                start = Reflect.getProperty (target, i);

            }


            if (Std.is (start, Float)) {

                details = new PropertyDetails (target, i, start, getField (properties, i) - start, isField);
            propertyDetails.push (details);

            }

        }

        detailsLength = propertyDetails.length;
        initialized = true;

    }


    public override function move ():Void {

        toggleVisible = (Reflect.hasField (properties, "alpha") && Reflect.hasField (properties, "visible"));

        if (toggleVisible && properties.alpha != 0 && !getField (target, "visible")) {

            setVisible = true;
            cacheVisible = getField (target, "visible");
            setField (target, "visible", true);

        }

        timeOffset = startTime;
        actuators.push (this);
        ++actuatorsLength;

    }


    /**
      @inheritDoc   
     */
    public override function onUpdate (handler:Dynamic, parameters:Array <Dynamic> = null):IGenericActuator {

        _onUpdate = handler;

        if (parameters == null) {

            _onUpdateParams = [];

        } else {

        _onUpdateParams = parameters;

        }

        sendChange = true;

        return this;

    }


    public override function pause ():Void {

        paused = true;

        pauseTime = timescaled ? update_timer : current_time;//haxe.Timer.stamp ();

    }


    public override function resume ():Void {

        if (paused) {

            paused = false;

            timeOffset += ( (timescaled ? update_timer : current_time) - pauseTime);
            // timeOffset += (haxe.Timer.stamp () - pauseTime) / 1000;

        }

    }


    inline function setField (target:Dynamic, propertyName:String, value:Dynamic):Void {

        if (Reflect.hasField (target, propertyName)) {

            Reflect.setField (target, propertyName, value);

        } else {

            Reflect.setProperty (target, propertyName, value);

        }

    }


    inline function setProperty (details:PropertyDetails, value:Dynamic):Void {

        if (details.isField) {

            Reflect.setProperty (details.target, details.propertyName, value);

        } else {

            Reflect.setProperty (details.target, details.propertyName, value);

        }

    }


    public override function stop (properties:Dynamic, complete:Bool, sendEvent:Bool):Void {

        if (active) {

            if (properties == null) {

                active = false;

                if (complete) {

                    apply ();

                }

                this.complete (sendEvent);
                return;

            }

            for (i in Reflect.fields (properties)) {

                if (Reflect.hasField (this.properties, i)) {

                    active = false;

                    if (complete) {

                        apply ();

                    }

                    this.complete (sendEvent);
                    return;

                }

            }

        }

    }

    function update( currentTime:Float ):Void {


        if (!paused) {

            var details:PropertyDetails;
            var easing:Float;
            var i:Int;

            var tweenPosition:Float = (currentTime - timeOffset) / duration;

            if (tweenPosition > 1) {

                tweenPosition = 1;

            }

            if (!initialized) {

                initialize ();

            }

            if (!special) {

                easing = _ease.calculate (tweenPosition);

                for (i in 0...detailsLength) {

                    details = propertyDetails[i];
                    setProperty (details, details.start + (details.change * easing));

                }

            } else {

                if (!_reverse) {

                    easing = _ease.calculate (tweenPosition);

                } else {

                    easing = _ease.calculate (1 - tweenPosition);

                }

                var endValue:Float;

                for (i in 0...detailsLength) {

                    details = propertyDetails[i];

                    if (_smartRotation && (details.propertyName == "rotation" || details.propertyName == "rotationX" || details.propertyName == "rotationY" || details.propertyName == "rotationZ")) {

                        var rotation:Float = details.change % 360;

                        if (rotation > 180) {

                            rotation -= 360;

                        } else if (rotation < -180) {

                            rotation += 360;

                        }

                        endValue = details.start + rotation * easing;

                    } else {

                        endValue = details.start + (details.change * easing);

                    }

                    if (!_snapping) {

                        setProperty (details, endValue);

                    } else {

                        setProperty (details, Math.round (endValue));

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

                    if (_onRepeat != null) {

                        callMethod (_onRepeat, _onRepeatParams);

                    }

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




    // Event Handlers

    static var update_timer : Float = 0;
    static var current_time : Float = 0;
    static function on_internal_update(_) : Void {

        update_timer += Luxe.dt;
        current_time = Luxe.time;

        var currentTime = current_time;

        var actuator:SimpleActuator;

        var j:Int = 0;
        var cleanup = false;

        for (i in 0...actuatorsLength) {

            actuator = actuators[j];

            if (actuator != null && actuator.active) {

                currentTime = actuator.timescaled ? update_timer : current_time;

                if(actuator.timescaled && !actuator.has_timescaled_starttime) {
                    actuator.has_timescaled_starttime = true;
                    actuator.startTime = update_timer;
                    actuator.timeOffset = actuator.startTime;
                }

                if(currentTime > actuator.timeOffset) {
                    actuator.update( currentTime );
                }

                j++;

            } else {

                actuators.splice (j, 1);
                --actuatorsLength;

            }

        }

    }


}
