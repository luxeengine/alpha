
[![Logo](http://luxeengine.com/images/logo.png)](index.html)

#[luxe](index.html)
###[Back to types](types.html)

## Luxe Time API

The time class offers a consistent method of scheduling things and measuring time in different ways.

_Schedule a function in the future_

**schedule**	time in seconds, function to call, repeat?
`var schedule = Luxe.time.schedule( _time_in_seconds:Float, _on_time:Void->Void, ?repeat:Bool = false ) : haxe.Timer`

You can use the return value to cancel the timer, with `schedule.stop()`;


