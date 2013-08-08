package luxe;

import luxe.Core;
import haxe.Timer;

class Time {
    
    public var core : Core;
    public function new( _core:Core ) { core = _core; }


    public function startup() {
        core._debug(':: luxe :: \t Time Initialized.');
    }

    public function shutdown() {
        core._debug(':: luxe :: \t Time shut down.');
    }

    public function schedule( _time_in_seconds:Float, _on_time:Void->Void, ?repeat:Bool = false ) : haxe.Timer {
        var t = new haxe.Timer( Std.int(_time_in_seconds * 1000));

        t.run = function () {
            if(!repeat) t.stop ();
            _on_time();
        };
        
        return t;

    } //schedule

    public function process() {
        
    }
    
}