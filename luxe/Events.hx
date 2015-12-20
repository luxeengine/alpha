package luxe;

import luxe.Core;
import luxe.Log.*;


/** An event system that handles queued, immediate or
    scheduled event id's to be fired and listened for.
    Multiple listeners can be connected to a single event id,
    and when fired all listeners are informed. Events are not
    retroactive, only listeners that are attached at the time
    will recieve the event notifications. Don't forget to disconnect events. */
class Events {

    @:noCompletion public var event_queue : Array<EventObject>;
    @:noCompletion public var event_connections : Map<String, EventConnection>; //event id, connect
    @:noCompletion public var event_slots : Map<String, Array<EventConnection> >; //event name, array of connections
    @:noCompletion public var event_filters : Map<String, Array<EventConnection> >; //event name, array of connections
    @:noCompletion public var event_schedules : Map<String, snow.api.Timer>; //event id, timer

    var event_queue_count = 0;

        /** Create a new instance for sending/receiving events. */
    public inline function new( ) {

            //create the queue, lists and map
        event_connections = new Map();
        event_slots = new Map();
        event_filters = new Map();
        event_queue = [];
        event_schedules = new Map();

    } //new

        /** Destroy this `Events` instance */
    public function destroy() {

        clear();

    } //destroy

        /** Clear any scheduled or bound events. Called on destroy. */
    public function clear() {

        for(schedule in event_schedules) {
            schedule.stop();
            schedule = null;
        }

        for(connection in event_connections.keys()) {
            event_connections.remove(connection);
        }

        for(filter in event_filters.keys()) {
            event_filters.remove(filter);
        }

        for(slot in event_slots.keys()) {
            event_slots.remove(slot);
        }

        var _count = event_queue.length;
        while(_count > 0) {
            event_queue.pop();
            _count--;
        }

    }

        /** Convenience. Exposed for learning/testing the filtering API. */
    public function does_filter_event( _filter:String, _event:String ) {

        var _replace_stars = ~/\*/gi;
        var _final_filter = _replace_stars.replace( _filter, '.*?' );
        var _final_search = new EReg(_final_filter, 'gi');

        return _final_search.match( _event );

    } //does_filter_event


        /** Bind a signal (listener) to a slot (event_name)
            event_name : The event id
            listener : A function handler that should get called on event firing */
    public function listen<T>( _event_name : String, _listener : T -> Void ):String {

            //we need an ID and a connection to store
        var id = Luxe.utils.uniqueid();
        var connection = new EventConnection( id, _event_name, _listener );

            //now we store it in the map
        event_connections.set( id, connection );

            //first check if the event name in question has a * wildcard,
            //if it does we have to store it as a filtered event so it's more optimal
            //to search through when events are fired
        var _has_stars = ~/\*/gi;
        if(_has_stars.match(_event_name)) {

                //also store the listener inside the slots
            if(!event_filters.exists(_event_name)) {
                    //no slot exists yet? make one!
                event_filters.set(_event_name, [] );
            }

                //it should exist by now, lets store the connection by event name
            event_filters.get(_event_name).push( connection );

        } else {

                //also store the listener inside the slots
            if(!event_slots.exists(_event_name)) {
                    //no slot exists yet? make one!
                event_slots.set(_event_name, [] );
            }

                //it should exist by now, lets store the connection by event name
            event_slots.get(_event_name).push( connection );

        }

            //return the id for unlistening
        return id;

    } //listen

        /**Disconnect a bound signal
            The event connection id is returned from listen()
            and returns true if the event existed and was removed. */
    public function unlisten( event_id : String ) : Bool {

        if(event_connections.exists(event_id)) {

            var connection = event_connections.get(event_id);
            var event_slot = event_slots.get(connection.event_name);

            if(event_slot != null) {
                event_slot.remove(connection);
                return true;
            } else {
                var event_filter = event_filters.get(connection.event_name);
                if(event_filter != null) {
                    event_filter.remove(connection);
                    return true;
                } else {
                    return false;
                } //event_filter != null
            } //event_slot != null

            return true;

        } else {
            return false;
        }

    } //unlisten

        /*Queue an event in the next update loop
            event_name : The event (register listeners with listen())
            properties : A dynamic pass-through value to hand off data
            returns : a String, the unique ID of the event */
    public function queue<T>( event_name : String, ?properties : T ) : String {

        var id = Luxe.utils.uniqueid();

            event_queue.push(new EventObject(id, event_name, properties));

        return id;

    } //queue

        /** Remove an event from the queue by id returned from queue. */
    public function dequeue( event_id: String ) {

        //:todo: proper search, not string id's, etc
        var i = 0;
        var _count = event_queue.length;
        do {

            if(event_queue[i].id == event_id) {
                event_queue.splice(i, 1);
                return true;
            }

            ++i;

        } while(i < _count);

        return false;

    } //dequeue

        /** Process/update the events, firing any events in the queue.
            if you create a custom instance, call this when you want to process. */
    public function process() {

            //fire each event in the queue
        var _count = event_queue.length;
        while(_count > 0) {
            var _event = event_queue.shift();
            fire(_event.name, _event.properties);
            _count--;
        }

    } //update

        /** Fire an event immediately, calling all listeners.
            properties : An optional pass-through value to hand to the listener.
            Returns true if event existed, false otherwise.
            If the optional tag flag is set (default:false), the properties object will be modified
            with some debug information, like _event_name_ and _event_connection_count_ */
    public function fire<T>( _event_name : String, ?_properties : T, ?_tag:Bool=false ) : Bool {

        var _fired = false;

        //we have to check against our filters if this event matches anything
        for(_filter in event_filters) {

            if(_filter.length > 0) {

                var _filter_name = _filter[0].event_name;
                if(does_filter_event(_filter_name, _event_name)) {

                    if(_tag) {
                        _properties = tag_properties(_properties, _event_name, _filter.length);
                    }

                    for(_connection in _filter) {
                        _connection.listener( cast _properties );
                    } //each connection to this filter

                    _fired = true;

                } //if it actually fits this event filter
            } //if there are any connections

        } //for each of our filters

        if(event_slots.exists( _event_name )) {

                //we have an event by this name
            var connections = event_slots.get(_event_name);

            if(_tag) {
                _properties = tag_properties(_properties, _event_name, connections.length);
            }

                //call each listener
            for(connection in connections) {
                connection.listener( cast _properties );
            }

            _fired = true;

        }

        return _fired;

    } //fire

        /** Schedule and event in the future
            event_name : The event (register listeners with listen())
            properties : An optional pass-through value to hand to the listeners
            Returns the ID of the schedule (for unschedule) */
    public function schedule<T>( time:Float, event_name : String, ?properties : T ) : String {

        var id : String = Luxe.utils.uniqueid();

            var _timer = Luxe.timer.schedule(time, fire.bind(event_name, properties));

            event_schedules.set( id, _timer );

        return id;

    } //schedule

        /** Unschedule a previously scheduled event
            schedule_id : The id of the schedule (returned from schedule)
            Returns false if fails, or event doesn't exist */
    public function unschedule( schedule_id : String ) : Bool {

        if(event_schedules.exists(schedule_id)) {
                //find the timer
            var timer = event_schedules.get(schedule_id);
                //kill it
            timer.stop();
                //remove it from the list
            event_schedules.remove(schedule_id);
                //done
            return true;
        }

        return false;

    } //unschedule

//Internal

    function tag_properties(_properties:Dynamic, _name:String,_count:Int) {

        def(_properties, {});

            //tag these information slots, with _ so they don't clobber other stuff
        Reflect.setField(_properties,'_event_name_', _name);
            //tag a listener count
        Reflect.setField(_properties,'_event_connection_count_', _count);

        return _properties;

    } //tag_properties

} // Events

private class EventConnection {


    public var listener : Dynamic -> Void;
    public var id : String;
    public var event_name : String;


    public function new( _id:String, _event_name:String, _listener : Dynamic -> Void ) {

        id = _id;
        listener = _listener;
        event_name = _event_name;

    } //new


} //EventConnection

private class EventObject {


    public var id : String;
    public var name:String;
    public var properties : Dynamic;


    public function new(_id:String, _event_name:String, _event_properties:Dynamic ) {

        id = _id;
        name = _event_name;
        properties = _event_properties;

    } //new


} //EventObject
