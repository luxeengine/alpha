package luxe;

//@:autoBuild(luxe.components.ObjectsMacro.build()) 

class Objects {

	public var id : String;
    public var name : String;

    @:noCompletion public function new() {
    	id = Luxe.utils.uniqueid();
    } //new

//Private helper functions

	@:noCompletion private function _call(_object:Objects, _name : String, ?args:Array<Dynamic> = null ) {
		
		var _func = Reflect.field( _object, _name );
		if(_func != null) {
			Reflect.callMethod( _object, _func, args == null ? [] : args );
		} //does function exist?

	} //_call

    @:noCompletion private function _merge_properties( _properties:Dynamic, _with:Dynamic) : Dynamic {

        if(_with == null) {
            _with = {};
        }

        var fields = Reflect.fields(_with);
        for(field in fields) {
            Reflect.setField(_properties, field, Reflect.field(_with, field));
        }

        return _properties;

    } //_merge_properties  

    @:noCompletion public static var _show_debug : Bool = false;
    @:noCompletion public static var _show_debug_verbose : Bool = false;
    @:noCompletion private function _debug(v,?verbose=false){ 
        if(_show_debug) { 
            if(!verbose) { 
                trace(v); 
            } else {
                if(_show_debug_verbose) {
                    trace(v); 
                } 
            }
        } 
    }	

} //Objects
