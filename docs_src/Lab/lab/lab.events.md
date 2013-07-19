
![Logo](http://underscorediscovery.com/sven/images/logo.png)

#[haxelab](../index.html)
###[Back to types](types.html)


## Lab Events API

The events class offers a way to communicate across components, entities, classes and more by a generic messaging system.   

There are two ways to trigger an event, one which sends the event into a queue to be processed in the next frame - and one that will fire the event immediately. There are times when immediacy is important, such as return values from a handler and race conditions - but for the majority of cases you can queue them safely. See examples at the end.

_Listen for an event, by connecting a handler_

**connect**	event name, listening function (returns an event ID to use later)
`var eventid = Lab.events.connect( event_name : String, listener : Dynamic -> Void ) : String`

**disconnect**	event id from connect (returns if the event was removed)
`var success = Lab.events.disconnect( event_id : String ) : Bool`

**queue**	event name, properties to forward to the listeners (returns an event id, not used often)
`var queueid = Lab.events.queue( event_name : String, properties : Dynamic = null ) : String`

**dequeue**	event id ( returns if the event was removed )
`var success = Lab.events.dequeue( event_id: String ) : Bool`

**fire** event name, properties to forward to the listeners (returns true if the event was found)
`var success = Lab.events.fire( event_name : String, properties : Dynamic = null ) : Bool`

**schedule** time in seconds, event name to fire, properties to forward (returns an event id for unschedule)
`var eventid = Lab.events.schedule( time:Float, event_name : String, properties : Dynamic = null) : String`

**unschedule** event id (returns if the schedule was cancelled )
`var success = Lab.events.unschedule( schedule_id : String ) : Bool`

### examples

Since event names are string, you can group events by delimeter. A planned feature for the near future is to include filtering or listening to events by 'namespace', like `Lab.events.connect('game.player.*')` for debugging and such.


		var event_id = Lab.events.connect('debug:event1', function(e) { trace('event listener 1 : ' + e); });
        Lab.events.connect('debug:event1', function(e) { trace('event listener 2 : ' +e); });
        Lab.events.connect('debug:event1', function(e) { trace('event listener 3 : ' + e); });

        trace('registered debug:event1 ' + event_id); 

        Lab.events.fire('debug:event1', {
            name : 'test event',
            date : Date.now()
        });

            //remove one of them
        Lab.events.disconnect( event_id );

            //now only two listeners
        Lab.events.fire('debug:event1', {
            name : 'test event',
            date : Date.now()
        });

            //fire next frame
        Lab.events.queue('debug:event1');
            
            //fire two seconds from now
        Lab.events.schedule( 2.0 , 'debug:event1');


_wip_
