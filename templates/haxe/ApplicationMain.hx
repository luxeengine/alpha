import ::APP_MAIN::;

import luxe.Core;
import lumen.Lumen;
import lumen.types.Types;

class ApplicationMain {

    public static var _game : ::APP_MAIN::;
	public static var _core : Core;
    public static var _lumen : Lumen;

	public static function main () {

			//Create the runtime
        _lumen = new Lumen();
            //Create the app class, give it to the bootstrapper
        _game = new ::APP_MAIN::();
			//Create the core luxe runtime
		_core = new Core( _lumen, _game );

		    //Create the window config
        var _window_config = {

            fullscreen      : ::WIN_FULLSCREEN::,
            resizable       : ::WIN_RESIZABLE::,
            borderless      : ::WIN_BORDERLESS::,
            antialiasing    : Std.int(::WIN_ANTIALIASING::),
            stencil_buffer  : ::WIN_STENCIL_BUFFER::,
            depth_buffer    : ::WIN_DEPTH_BUFFER::,
            vsync           : ::WIN_VSYNC::,
            fps             : Std.int(::WIN_FPS::),
            x               : Std.int(0x1FFF0000), 
            y               : Std.int(0x1FFF0000), 
            width           : Std.int(::WIN_WIDTH::), 
            height          : Std.int(::WIN_HEIGHT::), 
            title           : "::APP_TITLE::",

            orientation     : "::WIN_ORIENTATION::"

        } //_window_config

            //Create the main config
        var _config : LumenConfig = {

            host            : _core,
            window_config   : _window_config,
            runtime_config  : {},
            run_loop        : true

        };

            //Start up, but give the host as the luxe core
        _lumen.init( _core, _config );

	} //main

} //ApplicationMain