import ::APP_MAIN::;

import lab.Core;
import lime.LiME;

class ApplicationMain {
		
	public static var _main_ : ::APP_MAIN::;
	public static var _core : Core;
	public static var _lime : LiME;

	public static function main () {

		var config = {
			game : null,
			width : ::WIN_WIDTH::, 
			height : ::WIN_HEIGHT::, 
			title : "::APP_TITLE::",
			renderer : phoenix.Renderer
		};

			//Create the lime layer
		_lime = new LiME();
			//Create the game class, give it the runtime
		_main_ = new ::APP_MAIN::();
			//Create the haxelab runtime, pass it the lime reference
		_core = new Core( _main_ );
			//Store the core for reference in the game
		_main_.core = _core;

			//Start up lime, but give it the core library 
			//as the host instead of the main,
			//so we intercept the ready event and can tell the
			//game main when we are done!
		_lime.init( _core, config );
	}
	
}