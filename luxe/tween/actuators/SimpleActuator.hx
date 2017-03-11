package luxe.tween.actuators;


import luxe.tween.actuators.GenericActuator;

#if neko
import haxe.Log;
import haxe.PosInfos;
#end
import haxe.Timer;


class SimpleActuator<T, U> extends GenericActuator<T> {



	private var timeOffset:Float;

	private static var actuators = new Array<SimpleActuator<Dynamic, Dynamic>> ();
	private static var actuatorsLength = 0;
	private static var addedEvent = false;

	private static var timer:Timer;

	private var active:Bool;
	private var cacheVisible:Bool;
	private var detailsLength:Int;
	private var initialized:Bool;
	private var paused:Bool;
	private var pauseTime:Float;
	private var propertyDetails:Array <PropertyDetails<U>>;
	private var sendChange:Bool;
	private var setVisible:Bool;
	private var startTime:Float;
	private var toggleVisible:Bool;

    var has_timescaled_starttime : Bool = false;

	public function new (target:T, duration:Float, properties:Dynamic) {

        active = true;
		propertyDetails = new Array ();
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
            Luxe.on(luxe.Ev.tickstart, on_internal_update);

        }

    }


    /**
	 * @inheritDoc
     */
	public override function autoVisible (?value:Null<Bool>):GenericActuator<T> {

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
	 * @inheritDoc
     */
	public override function delay (duration:Float):GenericActuator<T> {

        _delay = duration;
        timeOffset = startTime + duration;

        return this;

    }


	private inline function getField<V> (target:V, propertyName:String):Dynamic {


        var value = null;

        if (Reflect.hasField (target, propertyName)) {

            value = Reflect.field (target, propertyName);

        } else {

            value = Reflect.getProperty (target, propertyName);

        }

        return value;

    }


	private function initialize ():Void {

		var details:PropertyDetails<U>;
		var start:Dynamic;

        for (i in Reflect.fields (properties)) {

            var isField = true;

			if (Reflect.hasField (target, i) #if html5 && !(untyped (target).__properties__ && untyped (target).__properties__["set_" + i]) #end) {

                start = Reflect.field (target, i);

            } else {

                isField = false;
                start = Reflect.getProperty (target, i);

            }


            if (Std.is (start, Float)) {

				var value:Dynamic = getField (properties, i);
				
				#if (neko || js)
				if (start == null) start = 0;
				if (value == null) value = 0;
				#end
				
				details = new PropertyDetails (cast target, i, start, value - start, isField);
            propertyDetails.push (details);

            }

        }

        detailsLength = propertyDetails.length;
        initialized = true;

    }


	private override function move ():Void {

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
	 * @inheritDoc
     */
	public override function onUpdate (handler:Dynamic, parameters:Array <Dynamic> = null):GenericActuator<T> {

        _onUpdate = handler;

        if (parameters == null) {

            _onUpdateParams = [];

        } else {

        _onUpdateParams = parameters;

        }

        sendChange = true;

        return this;

    }


	private override function pause ():Void {

		if (!paused)
		{
            paused = true;

            super.pause();

            pauseTime = timescaled ? update_timer : current_time;
        }

    }


	private override function resume ():Void {

        if (paused) {

            paused = false;

            timeOffset += ( (timescaled ? update_timer : current_time) - pauseTime);
            // timeOffset += (haxe.Timer.stamp () - pauseTime) / 1000;

			super.resume();
			
			
        }

    }


	@:generic private inline function setField<V> (target:V, propertyName:String, value:Dynamic):Void {

        if (Reflect.hasField (target, propertyName)) {

            Reflect.setField (target, propertyName, value);

        } else {

            Reflect.setProperty (target, propertyName, value);

        }

    }


	private inline function setProperty (details:PropertyDetails<U>, value:Dynamic):Void {

        if (details.isField) {

			Reflect.setProperty (details.target, details.propertyName, value);

        } else {

            Reflect.setProperty (details.target, details.propertyName, value);

        }

    }


	private override function stop (properties:Dynamic, complete:Bool, sendEvent:Bool):Void {

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


	private function update (currentTime:Float):Void {

        if (!paused) {

			var details:PropertyDetails<U>;
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

		var actuator:SimpleActuator<Dynamic, Dynamic>;

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
