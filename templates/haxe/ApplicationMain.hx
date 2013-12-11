import ::APP_MAIN::;

import luxe.Core;
import lime.Lime;

class ApplicationMain {
		
	public static var _main_ : ::APP_MAIN::;
	public static var _core : Core;
	public static var _lime : Lime;

	public static function main () {

		var config = {
			game 			: null,
			fullscreen		: ::WIN_FULLSCREEN::,
			resizable 		: ::WIN_RESIZABLE::,
			borderless		: ::WIN_BORDERLESS::,
			antialiasing	: ::WIN_ANTIALIASING::,
			stencil_buffer 	: ::WIN_STENCIL_BUFFER::,
			depth_buffer 	: ::WIN_DEPTH_BUFFER::,
			vsync 			: ::WIN_VSYNC::,
			width 			: ::WIN_WIDTH::, 
			height 			: ::WIN_HEIGHT::, 
			title 			: "::APP_TITLE::"
		};

			//Create the lime layer
		_lime = new Lime();
			//Create the game class, give it the runtime
		_main_ = new ::APP_MAIN::();
			//Create the haxeluxe runtime, pass it the lime reference
		_core = new Core( _main_ );
			//Store the core for reference in the game
		_main_.luxecore = _core;

			//Start up lime, but give it the core library 
			//as the host instead of the main,
			//so we intercept the ready event and can tell the
			//game main when we are done!
		_lime.init( _core, config );
	}
	
}