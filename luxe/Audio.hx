package luxe;

import luxe.Core;

class Audio {
    
    @:noCompletion public var core : Core;
    @:noCompletion public function new( _core:Core ) { core = _core; }

    @:noCompletion public function init() {

        core._debug(':: luxe :: \t Audio Initialized.');
    }

    @:noCompletion public function destroy() {
        core._debug(':: luxe :: \t Audio shut down.');
    }

    public function create(_name:String,_file:String, ?_forcemusic:Bool = false ) {
        core.lime.audio.create(_name, _file, _forcemusic);
    }

    public function play(_name:String, ?_loops:Int=0, ?_start:Float = 0) {
        var s = core.lime.audio.get(_name);
        if(s != null) {
            s.play( _loops , _start );
        } else {
            trace('Audio :: Sound does not exist, use Luxe.audio.create() first : ' + _name);
        }
    }

    public function volume(_name:String, _v:Float) {
        var s = core.lime.audio.get(_name);
        if(s != null) {
            s.volume = _v;
        } else {
            trace('Audio :: Sound does not exist, use Luxe.audio.create() first : ' + _name);
        }
    }

    public function pan(_name:String, _p:Float) {
        var s = core.lime.audio.get(_name);
        if(s != null) {
            s.pan = _p;
        } else {
            trace('Audio :: Sound does not exist, use Luxe.audio.create() first : ' + _name);
        }
    }

    @:noCompletion public function process() {
        
    }    
}