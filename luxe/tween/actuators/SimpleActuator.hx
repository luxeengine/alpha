package luxe.tween.actuators;


import luxe.tween.actuators.GenericActuator;

#if neko
import haxe.Log;
import haxe.PosInfos;
#end
import haxe.Timer;



/**
 * @author Joshua Granick
 * @version 1.2
 */
class SimpleActuator extends GenericActuator {
	
	private var timeOffset:Float;
	
	private static var actuators:Array <SimpleActuator> = new Array <SimpleActuator> ();
	private static var actuatorsLength:Int = 0;
	private static var addedEvent:Bool = false;
	
	private static var timer:Timer;
	
	private var active:Bool;
	private var cacheVisible:Bool;
	private var detailsLength:Int;
	private var initialized:Bool;
	private var paused:Bool;
	private var pauseTime:Float;
	private var propertyDetails:Array <PropertyDetails>;
	private var sendChange:Bool;
	private var setVisible:Bool;
	private var startTime:Float;
	private var toggleVisible:Bool;
	
	
	public function new (target:Dynamic, duration:Float, properties:Dynamic) {
		
		active = true;
		propertyDetails = new Array <PropertyDetails> ();
		sendChange = false;
		paused = false;
		cacheVisible = false;
		initialized = false;
		setVisible = false;
		toggleVisible = false;
		
		startTime = haxe.Timer.stamp();
		
		super (target, duration, properties);
		
		if (!addedEvent) {
			
			addedEvent = true;
			
			Luxe.core.add_internal_update( on_internal_update );
			
		}
		
	}
	
	
	/**
	 * @inheritDoc
	 */
	public override function autoVisible (?value:Null<Bool>):IGenericActuator {
		
		if (value == null) {
			
			value = true;
			
		}
		
		_autoVisible = value;
		
		if (!value) {
			
			toggleVisible = false;
			
			if (setVisible) {
				
				target.visible = cacheVisible;
				
			}
			
		}
		
		return this;
		
	}
	
	
	/**
	 * @inheritDoc
	 */
	public override function delay (duration:Float):IGenericActuator {
		
		_delay = duration;
		timeOffset = startTime + duration;
		
		return this;
		
	}
	
	
	private function initialize ():Void {
		
		var details:PropertyDetails;
		var start:Float;
		
		for (i in Reflect.fields (properties)) {
			
			var isField = true;
			
			#if (haxe_209 || haxe3)
			
			if (#if flash false && #end Reflect.hasField (target, i)) {
				
				start = Reflect.field (target, i);
				
			} else {
				
				isField = false;
				start = Reflect.getProperty (target, i);
				
			}
			
			#else
			
			start = Reflect.field (target, i);
			
			#end
			
			details = new PropertyDetails (target, i, start, Reflect.field (properties, i) - start, isField);
			propertyDetails.push (details);
			
		}
		
		detailsLength = propertyDetails.length;
		initialized = true;
		
	}
	
	
	public override function move ():Void {
		
		toggleVisible = (Reflect.hasField (properties, "alpha") && Reflect.hasField (properties, "visible"));
		
		if (toggleVisible && !target.visible && properties.alpha != 0) {
			
			setVisible = true;
			cacheVisible = target.visible;
			target.visible = true;
			
		}
		
		timeOffset = startTime;
		actuators.push (this);
		++actuatorsLength;
		
	}
	
	
	/**
	 * @inheritDoc
	 */
	public override function onUpdate (handler:Dynamic, parameters:Array <Dynamic> = null):IGenericActuator {
		
		_onUpdate = handler;
		_onUpdateParams = parameters;
		sendChange = true;
		
		return this;
		
	}
	
	
	public override function pause ():Void {
		
		paused = true;
		
		pauseTime = haxe.Timer.stamp ();
		
	}
	
	
	public override function resume ():Void {
		
		if (paused) {
			
			paused = false;
			
			timeOffset += (haxe.Timer.stamp () - pauseTime) / 1000;
			
		}
		
	}
	
	
	private inline function setField (details:PropertyDetails, value:Dynamic):Void {
		
		#if flash
		
		untyped details.target[details.propertyName] = value;
		
		#else
		
		if (details.isField) {
			
			Reflect.setProperty (details.target, details.propertyName, value);
			
		} else {
			
			Reflect.setProperty (details.target, details.propertyName, value);
			
		}
		
		#end
		
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
	
	
	private function update (currentTime:Float):Void {
		
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
					setField (details, details.start + (details.change * easing));
					
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
						
						setField (details, endValue);
						
					} else {
						
						setField (details, Math.round (endValue));
						
					}
					
				}
				
			}
			
			if (tweenPosition == 1) {
				
				if (_repeat == 0) {
					
					active = false;
					
					if (toggleVisible && target.alpha == 0) {
						
						target.visible = false;
						
					}
					
					complete (true);
					return;
					
				} else {
					
					if (_onRepeat != null) {
						
						#if (neko && (haxe_209 || haxe3))
						
						var args = _onRepeatParams != null ? _onRepeatParams : [];
						untyped __dollar__call (_onRepeat , _onRepeat, args.__neko ());
						
						#else
						
						Reflect.callMethod (_onRepeat, _onRepeat, _onRepeatParams);
						
						#end
						
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
	
	
	private static function on_internal_update( dt : Float) : Void {
		
		var currentTime = haxe.Timer.stamp ();
		
		var actuator:SimpleActuator;
		
		var j:Int = 0;
		var cleanup = false;
		
		for (i in 0...actuatorsLength) {
			
			actuator = actuators[j];
			
			if (actuator.active) {
				
				if (currentTime > actuator.timeOffset) {
					
					actuator.update (currentTime);
					
				}
				
				j++;
				
			} else {
				
				actuators.splice (j, 1);
				--actuatorsLength;
				
			}
			
		}
		
	}
	
	
}
