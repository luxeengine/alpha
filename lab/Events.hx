package lab;

import lab.Core;

class Events {
    
    public var core : Core;
    public function new( _core:Core ) { core = _core; }


    public function startup() {
        core._debug(':: haxelab :: \t Events Initialized.');
    }

    public function shutdown() {
        core._debug(':: haxelab :: \t Events shut down.');
    }

	public function process() {
		
	}    
    
}