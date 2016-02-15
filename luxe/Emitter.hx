package luxe;

import haxe.ds.IntMap;
import luxe.Log._debug;
import luxe.Log._verbose;
import luxe.Log._verboser;
import luxe.Log.log;


@:noCompletion typedef EmitHandler = Dynamic->Void;
@:noCompletion typedef HandlerList = Array<EmitHandler>;

@:noCompletion private typedef EmitNode<T> = { event : T, handler:EmitHandler #if luxe_emitter_pos, ?pos:haxe.PosInfos #end }


/** A simple event emitter, used as a base class for systems that want to handle direct connections to named events */

// @:generic
class Emitter<ET:Int> {

    @:noCompletion public var bindings : IntMap<HandlerList>;

        //store connections loosely, to find connected locations
    var connected : List< EmitNode<ET> >;
        //store the items to remove
    var _to_remove : List< EmitNode<ET> >;

        /** create a new emitter instance, for binding functions easily to named events. similar to `Events` */
    public function new() {

        _to_remove = new List();
        connected = new List();

        bindings = new IntMap<HandlerList>();

    } //new

    @:noCompletion public function _emitter_destroy() {
        while(_to_remove.length > 0) {
            var n = _to_remove.pop();
            n.event = null;
            n.handler = null;
            n = null;
        }

        while(connected.length > 0) {
            var n = connected.pop();
            n.event = null;
            n.handler = null;
            n = null;
        }

        _to_remove = null;
        connected = null;
        bindings = null;
    }

        /** Emit a named event */
    // @:generic
    @:noCompletion public function emit<T>( event:ET, ?data:T #if luxe_emitter_pos, ?pos:haxe.PosInfos #end ) {

        if(bindings == null) return;

        _check();

        var list = bindings.get(event);
        if(list != null && list.length > 0) {
            for(handler in list) {
                #if luxe_emitter_pos _verboser('emit / $event / ${pos.fileName}:${pos.lineNumber}@${pos.className}.${pos.methodName}'); #end
                handler(data);
            }
        }

            //needed because handlers
            //might disconnect listeners
        _check();

    } //emit

        /** connect a named event to a handler */
    // @:generic
    @:noCompletion public function on<T>(event:ET, handler: T->Void #if luxe_emitter_pos, ?pos:haxe.PosInfos #end ) {

        if(bindings == null) return;

        _check();

        #if luxe_emitter_pos _verbose('on / $event / ${pos.fileName}:${pos.lineNumber}@${pos.className}.${pos.methodName}'); #end

        if(!bindings.exists(event)) {

            bindings.set(event, [handler]);
            connected.push({ handler:handler, event:event #if luxe_emitter_pos, pos:pos #end });

        } else {
            var list = bindings.get(event);
            if(list.indexOf(handler) == -1) {
                list.push(handler);
                connected.push({ handler:handler, event:event #if luxe_emitter_pos, pos:pos #end });
            }
        }

    } //on

        /** disconnect a named event and handler. returns true on success, or false if event or handler not found */
    // @:generic
    @:noCompletion public function off<T>(event:ET, handler: T->Void #if luxe_emitter_pos, ?pos:haxe.PosInfos #end ) : Bool {

        if(bindings == null) return false;

        _check();

        var success = false;

        if(bindings.exists(event)) {

            #if luxe_emitter_pos _verbose('off / $event / ${pos.fileName}:${pos.lineNumber}@${pos.className}.${pos.methodName}'); #end

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

        if(connected == null) return null;

        var list : Array<EmitNode<ET>> = [];

        for(_info in connected) {
            if(_info.handler == handler) {
                list.push(_info);
            }
        }

        return list;

    } //connections

    var _checking = false;

    function _check() {

        if(_checking || _to_remove == null) {
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
