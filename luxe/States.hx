package luxe;

import Luxe.Ev;
import luxe.Input;
import luxe.Screen;
import luxe.Objects;
import luxe.options.StateOptions;

import luxe.Log.log;
import luxe.Log._debug;
import luxe.Log._verbose;
import luxe.Log._verboser;


class State extends ID {

    public var machine : States;
    public var active : Bool = false;
    public var enabled : Bool = false;
    public var inited : Bool = false;

    public function new( _options:StateOptions ) {

        super( _options.name );

    } //_name

    public function enable<T>( ?_enable_with:T ) {

        machine.enable( name, _enable_with );

    } //enable

    public function disable<T>( ?_disable_with:T ) {

        machine.disable( name, _disable_with );

    } //disable

    public function destroy() {

        machine.kill( name );

    } //destroy

        //critical events
    public function init() {}
    public function update(dt:Float) {}

    @:noCompletion public function onfixedupdate() {}

        //state specific events
    @:noCompletion public function onleave<T>(d:T) {}
    @:noCompletion public function onenter<T>(d:T) {}
    @:noCompletion public function onenabled<T>(d:T) {}
    @:noCompletion public function ondisabled<T>(d:T) {}
    @:noCompletion public function onadded() {}
    @:noCompletion public function onremoved() {}

    @:noCompletion public function onrender() {}
    @:noCompletion public function onprerender() {}
    @:noCompletion public function onpostrender() {}

   //scene events, called directly
    @:noCompletion public function onreset() {}
    @:noCompletion public function ondestroy() {}

        //input events, connected only when overridden in child class
    @:noCompletion public function onkeyup( event:KeyEvent ) {}
    @:noCompletion public function onkeydown( event:KeyEvent ) {}
    @:noCompletion public function ontextinput( event:TextEvent ) {}

    @:noCompletion public function oninputdown( name:String, event:InputEvent ) {}
    @:noCompletion public function oninputup( name:String, event:InputEvent ) {}

    @:noCompletion public function onmousedown( event:MouseEvent ) {}
    @:noCompletion public function onmouseup( event:MouseEvent ) {}
    @:noCompletion public function onmousemove( event:MouseEvent ) {}
    @:noCompletion public function onmousewheel( event:MouseEvent ) {}

    @:noCompletion public function ontouchdown( event:TouchEvent ) {}
    @:noCompletion public function ontouchup( event:TouchEvent ) {}
    @:noCompletion public function ontouchmove( event:TouchEvent ) {}

    @:noCompletion public function ongamepadup( event:GamepadEvent ) {}
    @:noCompletion public function ongamepaddown( event:GamepadEvent ) {}
    @:noCompletion public function ongamepadaxis( event:GamepadEvent ) {}
    @:noCompletion public function ongamepaddevice( event:GamepadEvent ) {}

   @:noCompletion public function onwindowmoved( event:WindowEvent ) {}
   @:noCompletion public function onwindowresized( event:WindowEvent ) {}
   @:noCompletion public function onwindowsized( event:WindowEvent ) {}
   @:noCompletion public function onwindowminimized( event:WindowEvent ) {}
   @:noCompletion public function onwindowrestored( event:WindowEvent ) {}

//internal

    @:allow(luxe.States)
    inline function _init() {
        if(!inited) {
            inited = true;
            init();
        }
    } //_init


} //State

class States extends Objects {

    @:noCompletion public var _states: Map<String,State>;

    public var active_states: Array<State>;
    public var current_state: State;

    var active_count:Int = 0;

    public function new( ?_options:StatesOptions ) {

        var _name = '';

        if(_options != null && _options.name != null) {
            _name = _options.name;
        }

        super(_name == '' ? Luxe.utils.uniqueid() : _name);

        _states = new Map();
        active_states = new Array<State>();

        Luxe.core.on(Ev.init, init);
        Luxe.core.on(Ev.destroy, ondestroy);
        Luxe.core.on(Ev.update, update);

        Luxe.core.on(Ev.prerender, prerender);
        Luxe.core.on(Ev.postrender, postrender);
        Luxe.core.on(Ev.render, render);

        Luxe.core.on(Ev.keydown, keydown);
        Luxe.core.on(Ev.keyup, keyup);
        Luxe.core.on(Ev.textinput, textinput);

        Luxe.core.on(Ev.inputup, inputup);
        Luxe.core.on(Ev.inputdown, inputdown);

        Luxe.core.on(Ev.mouseup, mouseup);
        Luxe.core.on(Ev.mousedown, mousedown);
        Luxe.core.on(Ev.mousemove, mousemove);
        Luxe.core.on(Ev.mousewheel, mousewheel);

        Luxe.core.on(Ev.touchup, touchup);
        Luxe.core.on(Ev.touchdown, touchdown);
        Luxe.core.on(Ev.touchmove, touchmove);

        Luxe.core.on(Ev.gamepadup, gamepadup);
        Luxe.core.on(Ev.gamepaddown, gamepaddown);
        Luxe.core.on(Ev.gamepadaxis, gamepadaxis);
        Luxe.core.on(Ev.gamepaddevice, gamepaddevice);

        Luxe.core.on(Ev.windowmoved, windowmoved);
        Luxe.core.on(Ev.windowresized, windowresized);
        Luxe.core.on(Ev.windowsized, windowsized);
        Luxe.core.on(Ev.windowminimized, windowminimized);
        Luxe.core.on(Ev.windowrestored, windowrestored);

    } //new

    var _state_count:Int = 0;
    public function add<T:State>( _state:T ) : T {

            //store it in the state list
        _states.set( _state.name, _state );
        _state_count++;
            //store reference of the owner
        _state.machine = this;
            //let them know
        _state.onadded();
            //if this state is added
            //after init has happened,
            //it should init immediately
        if(Luxe.core.inited) {
            _state._init();
        }

            //debug stuff
        _debug('$name / adding a state called ' + _state.name + ', now at ' + Lambda.count(_states) + ' states');

        return _state;

    } //add

    public function remove<T:State, T1>( _name:String, ?_leave_with:T1 ) : T {

        if(_states.exists(_name)) {

            var _state:T = cast _states.get(_name);

            if(_state != null) {

                    //if it's running unset it
                if(_state.active) {

                    leave(_state, _leave_with);

                    if(_state == current_state) {
                        current_state = null;
                    }

                } //_state.active

                    //if it's stacked, disable it
                if(_state.enabled) {
                    disable(_state.name);
                }

                    //tell user
                _state.onremoved();

                    //remove it
                _states.remove(_name);
                _state_count--;

            } //state != null

            return _state;

        } //remove

        return null;

    } //remove

    public function kill( _name:String ) {

        if(_state_count > 0) {
            if( _states.exists(_name) ) {
                var _state : State = remove( _name );
                if(_state != null) {
                    _state.ondestroy();
                }
            }
        }

    } //kill

    public function enabled( _name:String ) {
        if(_state_count == 0) return false;

        var state = _states.get( _name );

        if(state != null) {
            return state.enabled;
        }

        return false;

    } //enabled

    public function enable<T>( _name:String, ?_enable_with:T ) {
        if(_state_count == 0) return;

        var state = _states.get( _name );
        if(state != null) {
            _debug('$name / enabling a state ' + _name );
            state.onenabled(_enable_with);
            state.active = true;
            state.enabled = true;
            active_states.push(state);
            active_count++;
            _debug('$name / now at ${active_states.length} active states');
        }
    } //enable

    public function disable<T>( _name:String, ?_disable_with:T  ) {
        if(_state_count == 0) return;

        var state = _states.get( _name );
        if(state != null) {
            _debug('$name / disabling a state ' + _name );
            state.ondisabled(_disable_with);
            state.active = false;
            state.enabled = false;
            active_states.remove( state );
            active_count--;
            _debug('$name / now at ${active_states.length} active states');
        }
    } //disable

    function enter<T>( _state:State, ?_enter_with:T ) {

            //order matters
        _state.onenter( _enter_with );
        active_states.push( _state );
        active_count++;
        _state.active = true;

    } //enter

    function leave<T>( _state:State, ?_leave_with:T ) {

            //order matters
        _state.active = false;
        active_states.remove( _state );
        active_count--;
        _state.onleave( _leave_with );

    } //leave

        /** Change the actively set state. */
    public function set<T1,T2>(name:String, ?_enter_with:T1, ?_leave_with:T2 #if luxe_state_pos, ?pos:haxe.PosInfos #end ) : Bool {

         //:todo: these debug flags should be consolidated
        #if luxe_state_pos
            _debug('attempt to set state to $name from ${pos.fileName}:${pos.lineNumber}@${pos.className}.${pos.methodName}');
        #end

        if(!_states.exists(name)) {
            log('cannot find state named $name, is it added to this state machine?');
            return false;
        }

        //leave current state

        unset(_leave_with);

        //enter new state

        _debug('found state named $name, calling enter');

        current_state = _states.get(name);
        enter( current_state, _enter_with );

        _debug('called enter on $name, now at ${Lambda.count(active_states)} active_states');

        return true;

    } //set

        /** Exit the actively set state. */
    public function unset<T>( ?_leave_with:T ) {

        if (current_state != null) {

                _debug('current state was valid, leaving current state : ${current_state.name} (${current_state.active})');
                _debug('currently at ${Lambda.count(active_states)} active_states');

            leave( current_state, _leave_with );

                _debug('removed ${current_state.name}, now at ${Lambda.count(active_states)} active_states');

            current_state = null;

        } //current_state != null

    } //unset

    public function destroy() {

        if(_state_count > 0) {
            for (state in _states) {
                state.destroy();
            }
        }

        Luxe.core.off(Ev.init, init);
        Luxe.core.off(Ev.destroy, ondestroy);
        Luxe.core.off(Ev.update, update);

        Luxe.core.off(Ev.prerender, prerender);
        Luxe.core.off(Ev.postrender, postrender);
        Luxe.core.off(Ev.render, render);

        Luxe.core.off(Ev.keydown, keydown);
        Luxe.core.off(Ev.keyup, keyup);
        Luxe.core.off(Ev.textinput, textinput);

        Luxe.core.off(Ev.inputup, inputup);
        Luxe.core.off(Ev.inputdown, inputdown);

        Luxe.core.off(Ev.mouseup, mouseup);
        Luxe.core.off(Ev.mousedown, mousedown);
        Luxe.core.off(Ev.mousemove, mousemove);
        Luxe.core.off(Ev.mousewheel, mousewheel);

        Luxe.core.off(Ev.touchup, touchup);
        Luxe.core.off(Ev.touchdown, touchdown);
        Luxe.core.off(Ev.touchmove, touchmove);

        Luxe.core.off(Ev.gamepadup, gamepadup);
        Luxe.core.off(Ev.gamepaddown, gamepaddown);
        Luxe.core.off(Ev.gamepadaxis, gamepadaxis);
        Luxe.core.off(Ev.gamepaddevice, gamepaddevice);

        Luxe.core.off(Ev.windowmoved, windowmoved);
        Luxe.core.off(Ev.windowresized, windowresized);
        Luxe.core.off(Ev.windowsized, windowsized);
        Luxe.core.off(Ev.windowminimized, windowminimized);
        Luxe.core.off(Ev.windowrestored, windowrestored);

        emit(Ev.destroy);

    } //destroy

    //entity router functions
    function init(_) {
        if(_state_count > 0) {
            for (state in _states) {
                state._init();
            }
        }
    } //init

    function reset(_) {
        if(active_count > 0) {
            for (state in active_states) {
                state.onreset();
            }
        }
    } //reset

    function update(dt:Float) {
        if(active_count > 0) {
            for (state in active_states) {
                _verboser('${state.name} / update / $dt');
                state.update(dt);
            }
        }
    } //update

    function ondestroy(_) {

        destroy();

    } //ondestroy

    function render(_) {
        if(active_count > 0) {
            for (state in active_states) {
                state.onrender();
            }
        }
    } //render

    function prerender(_) {
        if(active_count > 0) {
            for (state in active_states) {
                state.onprerender();
            }
        }
    } //prerender

    function postrender(_) {
        if(active_count > 0) {
            for (state in active_states) {
                state.onpostrender();
            }
        }
    } //postrender

//Internal helper functions

    function keydown( e:KeyEvent ) {
        if(active_count > 0) {
            for (state in active_states) {
                state.onkeydown(e);
            }
        }
    } //onkeydown

    function keyup( e:KeyEvent ) {
        if(active_count > 0) {
            for (state in active_states) {
                state.onkeyup(e);
            }
        }
    } //onkeyup

    function textinput( e:TextEvent ) {
        if(active_count > 0) {
            for (state in active_states) {
                state.ontextinput(e);
            }
        }
    } //ontextinput

//inputbindings

    function inputup( _event:{ name:String, event:InputEvent } ) {
        if(active_count > 0) {
            for (state in active_states) {
                state.oninputup( _event.name, _event.event );
            }
        }
    } //oninputup

    function inputdown( _event:{ name:String, event:InputEvent } ) {
        if(active_count > 0) {
            for (state in active_states) {
                state.oninputdown( _event.name, _event.event );
            }
        }
    } //oninputdown

//mouse

    function mousedown( e:MouseEvent ) {
        if(active_count > 0) {
            for (state in active_states) {
                state.onmousedown(e);
            }
        }
    } //onmousedown

    function mousewheel( e:MouseEvent ) {
        if(active_count > 0) {
            for (state in active_states) {
                state.onmousewheel(e);
            }
        }
    } //onmousewheel

    function mouseup( e:MouseEvent ) {
        if(active_count > 0) {
            for (state in active_states) {
                state.onmouseup(e);
            }
        }
    } //onmouseup

    function mousemove( e:MouseEvent ) {
        if(active_count > 0) {
            for (state in active_states) {
                state.onmousemove(e);
            }
        }
    } //onmousemove

//touch

    function touchdown( e:TouchEvent ) {
        if(active_count > 0) {
            for (state in active_states) {
                state.ontouchdown(e);
            }
        }
    } //ontouchdown

    function touchup( e:TouchEvent ) {
        if(active_count > 0) {
            for (state in active_states) {
                state.ontouchup(e);
            }
        }
    } //ontouchup

    function touchmove( e:TouchEvent ) {
        if(active_count > 0) {
            for (state in active_states) {
                state.ontouchmove(e);
            }
        }
    } //ontouchmove

//gamepad

    function gamepadaxis( e:GamepadEvent ) {
        if(active_count > 0) {
            for (state in active_states) {
                state.ongamepadaxis(e);
            }
        }
    } //ongamepadaxis

    function gamepadup( e:GamepadEvent ) {
        if(active_count > 0) {
            for (state in active_states) {
                state.ongamepadup(e);
            }
        }
    } //ongamepadup

    function gamepaddown( e:GamepadEvent ) {
        if(active_count > 0) {
            for (state in active_states) {
                state.ongamepaddown(e);
            }
        }
    } //ongamepaddown

    function gamepaddevice( e:GamepadEvent ) {
        if(active_count > 0) {
            for (state in active_states) {
                state.ongamepaddevice(e);
            }
        }
    } //ongamepaddevice

//windowing

    function windowmoved( e:WindowEvent ) {
        if(active_count > 0) {
            for (state in active_states) {
                state.onwindowmoved(e);
            }
        }
    } //windowmoved

    function windowresized( e:WindowEvent ) {
        if(active_count > 0) {
            for (state in active_states) {
                state.onwindowresized(e);
            }
        }
    } //windowresized

    function windowsized( e:WindowEvent ) {
        if(active_count > 0) {
            for (state in active_states) {
                state.onwindowsized(e);
            }
        }
    } //windowsized

    function windowminimized( e:WindowEvent ) {
        if(active_count > 0) {
            for (state in active_states) {
                state.onwindowminimized(e);
            }
        }
    } //windowminimized

    function windowrestored( e:WindowEvent ) {
        if(active_count > 0) {
            for (state in active_states) {
                state.onwindowrestored(e);
            }
        }
    } //windowrestored


} //States
