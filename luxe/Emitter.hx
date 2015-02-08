package luxe;

import luxe.Log._debug;
import luxe.Log._verbose;
import luxe.Log._verboser;
import luxe.Log.log;

/** A simple event emitter, used as a base class for systems that want to handle direct connections to named events */

@:noCompletion typedef EmitHandler = Dynamic->Void;

@:noCompletion private typedef EmitNode = { event : Int, handler:EmitHandler, ?pos:haxe.PosInfos }

@:generic
class Emitter {

    @:noCompletion public var bindings : Map<Int, Array<EmitHandler> >;

        //store connections loosely, to find connected locations
    var connected : List<EmitNode>;
        //store the items to remove
    var _to_remove : List<EmitNode>;

        /** create a new emitter instance, for binding functions easily to named events. similar to `Events` */
    public function new() {

        _to_remove = new List();
        connected = new List();

        bindings = new Map();

    } //new

        /** Emit a named event */
    @:noCompletion public function emit<T>( event:Int, ?data:T, ?pos:haxe.PosInfos  ) {

        _check();

        var list = bindings.get(event);
        if(list != null && list.length > 0) {
            for(handler in list) {
                _verboser('emit / $event / ${pos.fileName}:${pos.lineNumber}@${pos.className}.${pos.methodName}');
                handler(data);
            }
        }

            //needed because handlers
            //might disconnect listeners
        _check();

    } //emit

        /** connect a named event to a handler */
    @:noCompletion public function on<T>(event:Int, handler: T->Void, ?pos:haxe.PosInfos ) {

        _check();

        _verbose('on / $event / ${pos.fileName}:${pos.lineNumber}@${pos.className}.${pos.methodName}');

        if(!bindings.exists(event)) {

            bindings.set(event, [handler]);
            connected.push({ handler:handler, event:event, pos:pos });

        } else {
            var list = bindings.get(event);
            if(list.indexOf(handler) == -1) {
                list.push(handler);
                connected.push({ handler:handler, event:event, pos:pos });
            }
        }

    } //on

        /** disconnect a named event and handler. returns true on success, or false if event or handler not found */
    @:noCompletion public function off<T>(event:Int, handler: T->Void, ?pos:haxe.PosInfos ) : Bool {

        _check();

        var success = false;

        if(bindings.exists(event)) {

            _verbose('off / $event / ${pos.fileName}:${pos.lineNumber}@${pos.className}.${pos.methodName}');

            _to_remove.push({ event:event, handler:handler });

            for(_info in connected) {
                if(_info.event == event && _info.handler == handler) {
                    connected.remove(_info);
                }
            }

                //debateable :p
            success = true;

        } //if exists

        return success;

    } //off

    @:noCompletion public function connections( handler:EmitHandler ) {

        var list : Array<EmitNode> = [];

        for(_info in connected) {
            if(_info.handler == handler) {
                list.push(_info);
            }
        }

        return list;

    } //connections

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
            _to_remove = new List();

        } //_to_remove length > 0

        _checking = false;

    } //_check

} //Emitter
