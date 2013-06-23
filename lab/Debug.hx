package lab;

import lab.Core;

class Debug {
        
    public var core : Core;
    public function new( _core:Core ) { core = _core; }

    public function startup() {

        core._debug(':: haxelab :: \t Debug Initialized.');
    }

    public function shutdown() {
        core._debug(':: haxelab :: \t Debug shut down.');
    }

	public function process() {
		
	}    
}