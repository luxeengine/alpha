package luxe;

import luxe.Core;
import haxe.Timer;

class Time {
    
    @:noCompletion public var core : Core;
    @:noCompletion public function new( _core:Core ) { core = _core; }


    @:noCompletion public function init() {
        core._debug(':: luxe :: \t Time Initialized.');
    }

    @:noCompletion public function destroy() {
        core._debug(':: luxe :: \t Time shut down.');
    } //destroy

    public function schedule( _time_in_seconds:Float, _on_time:Void->Void, ?repeat:Bool = false ) : haxe.Timer {
        var t = new haxe.Timer( Std.int(_time_in_seconds * 1000));

        t.run = function () {
            if(!repeat) t.stop ();
            _on_time();
        };
        
        return t;

    } //schedule

    @:noCompletion public function process() {
        
    }
    
}