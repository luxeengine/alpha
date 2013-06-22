package lab.core;

import lab.core.Core;

class Time {
    
    public var core : Core;
    public function new( _core:Core ) { core = _core; }


    public function startup() {
        core._debug(':: haxelab :: \t Time Initialized.');
    }

    public function shutdown() {
        core._debug(':: haxelab :: \t Time shut down.');
    }


    public function process() {
        
    }
    
}