import ::APP_MAIN::;

import lab.Core;
import nmegl.NMEGL;

class ApplicationMain {
		
	public static var _main_ : ::APP_MAIN::;
	public static var _core : Core;
	public static var _nmegl : NMEGL;

	public static function main () {

		var config = {
			game : null,
			width : ::WIN_WIDTH::, 
			height : ::WIN_HEIGHT::, 
			title : "::APP_TITLE::",
			renderer : phoenix.Renderer
		};

			//Create the NMEGL layer
		_nmegl = new NMEGL();
			//Create the game class, give it the runtime
		_main_ = new ::APP_MAIN::();
			//Create the haxelab runtime, pass it the nmegl reference
		_core = new Core( _main_ );
			//Store the core for reference in the game
		_main_.core = _core;

			//Start up NMEGL, but give it the core library 
			//as the host instead of the main,
			//so we intercept the ready event and can tell the
			//game main when we are done!
		_nmegl.init( _core, config );
	}
	
}