package luxe;

import luxe.Core;
import haxe.Timer;
import luxe.Log._debug;

class Timer {


    @:noCompletion public var core : Core;
    @:noCompletion public var timers : Array<snow.api.Timer>;


    @:noCompletion public function new( _core:Core ) {
        core = _core;
        timers = [];
    } //new

    @:noCompletion public function init() {

        _debug('\t timer initialized.');

    } //init

    @:noCompletion public function destroy() {

        reset();
        _debug('\t timer shut down.');

    } //destroy

    @:noCompletion public function process() {

    } //process

        /** Kill all existing scheduled timers created through `schedule` */
    public function reset() {

        for( t in timers ) {
            t.stop();
            t = null;
        }

        timers = null;
        timers = [];

    } //reset

    public function schedule( _time_in_seconds:Float, _on_time:Void->Void, ?repeat:Bool = false ) : snow.api.Timer {

        var t = new snow.api.Timer( _time_in_seconds );

        t.run = function () {
            if(!repeat) {
                t.stop ();
                timers.remove(t);
            }
            _on_time();
        };

        timers.push(t);

        return t;

    } //schedule


} //Timer
