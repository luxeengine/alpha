package lab;

import lab.core.Core;

class Game {

		//local handle to the core engine
	public var core : Core;

		//constructur (don't forget to call super if you overide!)
	public function new( _core:Core) {
		
		core = _core;

	}
 
	public function init() {
		core._debug(':: haxelab.game :: Game Initializing.');
	}

		//shell for on ready
	public function ready() {} 

}

