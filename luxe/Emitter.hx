package luxe;

/** A simple event emitter, used as a base class for systems that want to handle direct connections to named events */
@:noCompletion private typedef EmitNode = {
    event : String, handler:Dynamic->Void
}

class Emitter {

    public var handlers : Map<String, Array<Dynamic->Void> >;

    var _to_remove : Array<EmitNode>;

    public function new() {

        handlers = new Map();
        _to_remove = [];

    } //new

        /** Emit a named event */
    public function emit<T>(event:String, ?data:T, ?pos:haxe.PosInfos  ) {

        _check();

        if(handlers.exists(event)) {
            var list = handlers.get(event);
            if(list.length > 0) {
                for(handler in list) {
                    handler(data);
                }
            }
        }

    } //emit

        /** connect a named event to a handler */
    public function on<T>(event:String, handler: T->Void, ?pos:haxe.PosInfos ) {

        _check();

        if(!handlers.exists(event)) {
            handlers.set(event, [handler]);
        } else {
            var list = handlers.get(event);
            if(list.indexOf(handler) == -1) {
                list.push(handler);
            }
        }

    } //on

        /** disconnect a named event and handler. returns true on success, or false if event or handler not found */
    public function off<T>(event:String, handler: T->Void, ?pos:haxe.PosInfos ) : Bool {

        _check();

        var success = false;

        if(handlers.exists(event)) {

            _to_remove.push({ event:event, handler:handler });
                //debateable :p
            success = true;

        } //if exists

        return success;

    } //off


    function _check() {

        if(_to_remove.length > 0) {

            for(_node in _to_remove) {

                var list = handlers.get(_node.event);
                list.remove( _node.handler );

                    //clear the event list if there are no handlers
                if(list.length == 0) {
                    handlers.remove(_node.event);
                }

            } //each node

            _to_remove = null;
            _to_remove = [];

        } //_to_remove length > 0

    } //_update

} //Emitter
