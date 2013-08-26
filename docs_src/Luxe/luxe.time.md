
[![Logo](http://luxeengine.com/images/logo.png)](index.html)

###[Back to types](types.html)

## Luxe Time API

The time class offers a consistent method of scheduling things and measuring time in different ways.

<a name="SchedulingFunctions" ></a>

###Scheduling functions

<a name="schedule" href="#schedule">schedule</a>

	Luxe.time.schedule( _time_in_seconds:Float, _on_time:Void->Void, ?repeat:Bool = false ) : haxe.Timer
<span class="small_desc_flat"> Schedule a function in the future, you can use the return value to cancel the timer, with `schedule.stop()` </span>      





