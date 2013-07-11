package lab;

import lab.Core;

class Audio {
    
    public var core : Core;
    public function new( _core:Core ) { core = _core; }

    public function startup() {

        core._debug(':: haxelab :: \t Audio Initialized.');
    }

    public function shutdown() {
        core._debug(':: haxelab :: \t Audio shut down.');
    }

    public function create(_name:String,_file:String, ?_music:Bool = false ) {
        core.lime.audio.create_sound(_name, _file, _music);
    }

    public function play(_name:String) {
        var s = core.lime.audio.sounds.get(_name);
        if(s != null) {
            s.play();
        } else {
            trace('Audio :: Sound does not exist, use Lab.audio.create() first : ' + _name);
        }
    }

    public function volume(_name:String, _v:Float) {
        var s = core.lime.audio.sounds.get(_name);
        if(s != null) {
            s.volume = _v;
        } else {
            trace('Audio :: Sound does not exist, use Lab.audio.create() first : ' + _name);
        }
    }

    public function pan(_name:String, _p:Float) {
        var s = core.lime.audio.sounds.get(_name);
        if(s != null) {
            s.pan = _p;
        } else {
            trace('Audio :: Sound does not exist, use Lab.audio.create() first : ' + _name);
        }
    }

    public function process() {
        
    }    
}