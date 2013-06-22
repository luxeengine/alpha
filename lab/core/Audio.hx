package lab.core;

import lab.core.Core;

class Audio {
    
    public var core : Core;
    public function new( _core:Core ) { core = _core; }

    public function startup() {

        core._debug(':: haxelab :: \t Audio Initialized.');
    }

    public function shutdown() {
        core._debug(':: haxelab :: \t Audio shut down.');
    }

    public function process() {
        
    }    
}