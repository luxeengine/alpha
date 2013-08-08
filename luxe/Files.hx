package luxe;

import luxe.Core;

class Files {
    
    public var core : Core;
    public function new( _core:Core ) { core = _core; }


    public function startup() {
        core._debug(':: luxe :: \t Files Initialized.');
    }

    public function shutdown() {
        core._debug(':: luxe :: \t Files shut down.');
    }

    public function process() {
    	
    }
    
}