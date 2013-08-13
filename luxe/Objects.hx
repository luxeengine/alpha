package luxe;

class Objects {
	public var id : String;
    public var name : String;

    public function new() {
    	id = luxe.utils.UUID.get();
    } //new


//Private helper functions

	private function _call(_object:Objects, _name : String, ?args:Array<Dynamic> ) {
		
		var _func = Reflect.field( _object, _name );
		if(_func != null) {
			Reflect.callMethod( _object, _func, args );
		} //does function exist?

	} //_call

    public static var _show_debug : Bool = false;
    private function _debug(v){ if(_show_debug) { trace(v); } }	

} //Objects
