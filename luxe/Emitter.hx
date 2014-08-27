package luxe;

import luxe.Log._debug;
import luxe.Log._verbose;
import luxe.Log._verboser;
import luxe.Log.log;

/** A simple event emitter, used as a base class for systems that want to handle direct connections to named events */

@:noCompletion typedef EmitHandler = Dynamic->Void;

@:noCompletion private typedef EmitInfo = { event : String, ?pos:haxe.PosInfos }
@:noCompletion private typedef EmitNode = { > EmitInfo, handler:EmitHandler }

class Emitter {

    public var bindings : Map<String, Array<EmitHandler> >;

        //store the items to remove
    var _to_remove : Array<EmitNode>;

    public function new() {

        _to_remove = [];

        bindings = new Map();

    } //new

        /** Emit a named event */
    public function emit<T>( event:String, ?data:T, ?pos:haxe.PosInfos  ) {

        _check();

        if(bindings.exists(event)) {
            var list = bindings.get(event);
            if(list.length > 0) {
                for(handler in list) {
                    _verboser('emit / $event / ${pos.fileName}:${pos.lineNumber}');
                    handler(data);
                }
            }
        }

        _check();

    } //emit

        /** connect a named event to a handler */
    public function on<T>(event:String, handler: T->Void, ?pos:haxe.PosInfos ) {

        _check();

        _debug('on / $event / ${pos.fileName}:${pos.lineNumber}');

        if(!bindings.exists(event)) {
            bindings.set(event, [handler]);
        } else {
            var list = bindings.get(event);
            if(list.indexOf(handler) == -1) {
                list.push(handler);
            }
        }

    } //on

        /** disconnect a named event and handler. returns true on success, or false if event or handler not found */
    public function off<T>(event:String, handler: T->Void, ?pos:haxe.PosInfos ) : Bool {

        _check();

        var success = false;

        if(bindings.exists(event)) {

            _debug('off / $event / ${pos.fileName}:${pos.lineNumber}');

            _to_remove.push({ event:event, handler:handler });
                //debateable :p
            success = true;

        } //if exists

        return success;

    } //off

    var _checking = false;

    function _check() {

        if(_checking) {
            return;
        }

        _checking = true;

        if(_to_remove.length > 0) {

            for(_node in _to_remove) {

                var list = bindings.get(_node.event);
                list.remove( _node.handler );

                    //clear the event list if there are no bindings
                if(list.length == 0) {
                    bindings.remove(_node.event);
                }

            } //each node

            _to_remove = null;
            _to_remove = [];

        } //_to_remove length > 0

        _checking = false;

    } //_check

} //Emitter
