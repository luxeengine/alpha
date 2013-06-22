import ::APP_MAIN::;

import haxelab.core.Core;

class ApplicationMain {
		
	public static var _main_ : ::APP_MAIN::;
	public static var _core : Core;

	public static function main () {
		_core = new Core();
		_main_ = new ::APP_MAIN::(_core);

		_core.init( _main_ );		
	}
	
}