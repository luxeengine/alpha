package haxelab.core;

import haxelab.core.Core;

class Input {
	
	public var core : Core;
	public function new( _core:Core ) { core = _core; }


	public function startup() {
		core._debug(':: haxelab :: \t Input Initialized.');
	}

	public function shutdown() {
		core._debug(':: haxelab :: \t Input shut down.');
	}
}