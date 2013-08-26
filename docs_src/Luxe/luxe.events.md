
[![Logo](http://luxeengine.com/images/logo.png)](index.html)

###[Back to types](types.html)


## Luxe Events API

The events class offers a way to communicate across components, entities, classes and more by a generic messaging system.   

There are two ways to trigger an event, one which sends the event into a queue to be processed in the next frame - and one that will fire the event immediately. There are times when immediacy is important, such as return values from a handler and race conditions - but for the majority of cases you can queue them safely. See examples at the end.

_Listen for an event, by connecting a handler_


<a name="Listen" ></a>

###Listen and connect to events

<a name="listen" href="#listen">listen</a>

    var eventid = Luxe.events.listen( event_name : String, listener : Dynamic -> Void ) : String
<span class="small_desc_flat"> Listen for an event by name, attaching a function for when the event fires </span>      

<a name="disconnect" href="#disconnect">disconnect</a>

    var success = Luxe.events.disconnect( event_id : String ) : Bool
<span class="small_desc_flat"> Disconnect a listener, using the id returned by `listen` </span>      

<a name="Firing" ></a>

###Firing and Queuing events

<a name="queue" href="#queue">queue</a>

    var queueid = Luxe.events.queue( event_name : String, properties : Dynamic = null ) : String
<span class="small_desc_flat"> Queue an event to be fired for the next frame, , passing the properties object to the handler </span>      

<a name="dequeue" href="#dequeue">dequeue</a>

    var success = Luxe.events.dequeue( event_id: String ) : Bool
<span class="small_desc_flat"> Remove an event from the queue, provided it exists and hasn't been fired yet. </span>      

<a name="fire" href="#fire">fire</a>

    var success = Luxe.events.fire( event_name : String, properties : Dynamic = null ) : Bool
<span class="small_desc_flat"> Fire the event by name immediately, passing the properties object to the handler </span>      

<a name="schedule" href="#schedule">schedule</a>

    var eventid = Luxe.events.schedule( time:Float, event_name : String, properties : Dynamic = null) : String
<span class="small_desc_flat"> Fire the event by name some time in the future, passing the properties object to the handler </span>      

<a name="unschedule" href="#unschedule">unschedule</a>

    var success = Luxe.events.unschedule( schedule_id : String ) : Bool
<span class="small_desc_flat"> Cancel an event by the ID returned from `schedule` </span>      

### examples

Since event names are string, you can group events by a delimeter,   
i.e `Luxe.events.listen('game.player.*')`, which can be used to filter events by type.


		var event_id = Luxe.events.listen('debug:event1', function(e) { trace('event listener 1 : ' + e); });

        Luxe.events.listen( 'debug:event1' , function(e){ trace('event listener 2 : ' + e); });
        Luxe.events.listen( 'debug:event1' , function(e){ trace('event listener 3 : ' + e); });

        trace( 'registered debug:event1 ' + event_id ); 

        Luxe.events.fire('debug:event1', {

            name : 'test event',
            date : Date.now()

        });

            //remove one of them
        Luxe.events.disconnect( event_id );

            //now only two listeners
        Luxe.events.fire('debug:event1', {

            name : 'test event',
            date : Date.now()

        });

            //fire next frame
        Luxe.events.queue('debug:event1');
            
            //fire two seconds from now
        Luxe.events.schedule( 2.0 , 'debug:event1');

<br/>
<br/>
<br/>
