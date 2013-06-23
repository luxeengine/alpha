package lab;

import lab.Core;

class Files {
    
    public var core : Core;
    public function new( _core:Core ) { core = _core; }


    public function startup() {
        core._debug(':: haxelab :: \t Files Initialized.');
    }

    public function shutdown() {
        core._debug(':: haxelab :: \t Files shut down.');
    }

    public function process() {
    	
    }
    
}