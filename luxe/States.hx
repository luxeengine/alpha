package luxe;

import luxe.Input;
import luxe.Objects;
import luxe.options.StateOptions;

import luxe.Log.log;
import luxe.Log._debug;
import luxe.Log._verbose;
import luxe.Log._verboser;


class State extends ID {

    public var machine : States;
    public var active : Bool = false;

    public function new( _options:StateOptions ) {

        super( _options.name );

    } //_name

    public function enable<T>( ?_enable_with:T ) {

        machine.enable( name, _enable_with );

    } //enable

    public function disable<T>( ?_disable_with:T ) {

        machine.disable( name, _disable_with );

    } //disable

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


} //State

class States extends Objects {

    @:noCompletion public var _states: Map<String,State>;

    public var active_states: Array<State>;
    public var current_state: State;

    public function new( ?_options:StatesOptions ) {

        var _name = '';

        if(_options != null && _options.name != null) {
            _name = _options.name;
        }

        super(_name == '' ? Luxe.utils.uniqueid() : _name);

        _states = new Map();
        active_states = new Array<State>();

        Luxe.core.on('init', init);
        Luxe.core.on('destroy', destroy);
        Luxe.core.on('update', update);

        Luxe.core.on('prerender', prerender);
        Luxe.core.on('postrender', postrender);
        Luxe.core.on('render', render);

        Luxe.core.on('keydown', keydown);
        Luxe.core.on('keyup', keyup);
        Luxe.core.on('textinput', textinput);

        Luxe.core.on('inputup', inputup);
        Luxe.core.on('inputdown', inputdown);

        Luxe.core.on('mouseup', mouseup);
        Luxe.core.on('mousedown', mousedown);
        Luxe.core.on('mousemove', mousemove);
        Luxe.core.on('mousewheel', mousewheel);

        Luxe.core.on('touchup', touchup);
        Luxe.core.on('touchdown', touchdown);
        Luxe.core.on('touchmove', touchmove);

        Luxe.core.on('gamepadup', gamepadup);
        Luxe.core.on('gamepaddown', gamepaddown);
        Luxe.core.on('gamepadaxis', gamepadaxis);
        Luxe.core.on('gamepaddevice', gamepaddevice);

    } //new

    public function add( _state:State ) : Void {

            //store it in the state list
        _states.set( _state.name, _state );
            //store reference of the owner
        _state.machine = this;
            //let them know
        _state.onadded();

            //debug stuff
        _debug('$name / adding a state called ' + _state.name + ', now at ' + Lambda.count(_states) + ' states');

    } //add_state

    public function enable<T>( _name:String, ?_enable_with:T ) {
        var state = _states.get( _name );
        if(state != null) {
            _debug('$name / enabling a state ' + _name );
            state.onenabled(_enable_with);
            active_states.push(state);
            _debug('$name / now at ${active_states.length} active states');
        }
    } //enable

    public function disable<T>( _name:String, ?_disable_with:T  ) {
        var state = _states.get( _name );
        if(state != null) {
            _debug('$name / disabling a state ' + _name );
            state.ondisabled(_disable_with);
            active_states.remove( state );
            _debug('$name / now at ${active_states.length} active states');
        }
    } //disable

    public function set<T1,T2>(name:String, ?_enter_with:T1, ?_leave_with:T2, ?pos:haxe.PosInfos ) {

        _debug('attempt to set state to $name from ${pos.fileName}:${pos.lineNumber}@${pos.className}.${pos.methodName}');

        if (current_state != null) {

                _debug('current state was valid, leaving current state : ${current_state.name} (${current_state.active})');
                _debug('currently at ${Lambda.count(active_states)} active_states');

            active_states.remove( current_state );

                _debug('removed ${current_state.name}, now at ${Lambda.count(active_states)} active_states');

            current_state.onleave(_leave_with);

            current_state = null;

        } //current_state != null

        if (_states.exists(name)) {

                _debug('found state named $name, calling enter');

            current_state = _states.get(name);
            active_states.push( current_state );

                _debug('calling enter on $name, now at ${Lambda.count(active_states)} active_states');

            current_state.onenter(_enter_with);

        } //if states.exists(name)

    } //set

    //entity router functions
    function init(_) {
        for (state in _states) {
            state.init();
        }
    } //init

    function reset(_) {
        for (state in active_states) {
            state.onreset();
        }
    } //reset

    function update(dt:Float) {
        for (state in active_states) {
            _verboser('${state.name} / update / $dt');
            state.update(dt);
        }
    } //update

    function destroy(_) {

        for (state in _states) {
            state.ondestroy();
        }

        Luxe.core.off('init', init);
        Luxe.core.off('destroy', destroy);
        Luxe.core.off('update', update);

        Luxe.core.off('prerender', prerender);
        Luxe.core.off('postrender', postrender);
        Luxe.core.off('render', render);

        Luxe.core.off('keydown', keydown);
        Luxe.core.off('keyup', keyup);
        Luxe.core.off('textinput', textinput);

        Luxe.core.off('inputup', inputup);
        Luxe.core.off('inputdown', inputdown);

        Luxe.core.off('mouseup', mouseup);
        Luxe.core.off('mousedown', mousedown);
        Luxe.core.off('mousemove', mousemove);
        Luxe.core.off('mousewheel', mousewheel);

        Luxe.core.off('touchup', touchup);
        Luxe.core.off('touchdown', touchdown);
        Luxe.core.off('touchmove', touchmove);

        Luxe.core.off('gamepadup', gamepadup);
        Luxe.core.off('gamepaddown', gamepaddown);
        Luxe.core.off('gamepadaxis', gamepadaxis);
        Luxe.core.off('gamepaddevice', gamepaddevice);

        emit('destroy');

    } //destroy

    function render(_) {
        for (state in active_states) {
            state.onrender();
        }
    } //render

    function prerender(_) {
        for (state in active_states) {
            state.onprerender();
        }
    } //prerender

    function postrender(_) {
        for (state in active_states) {
            state.onpostrender();
        }
    } //postrender

//Internal helper functions

    function keydown( e:KeyEvent ) {
        for (state in active_states) {
            state.onkeydown(e);
        }
    } //onkeydown

    function keyup( e:KeyEvent ) {
        for (state in active_states) {
            state.onkeyup(e);
        }
    } //onkeyup

    function textinput( e:TextEvent ) {
        for (state in active_states) {
            state.ontextinput(e);
        }
    } //ontextinput

//inputbindings

    function inputup( _event:{ name:String, event:InputEvent } ) {
        for (state in active_states) {
            state.oninputup( _event.name, _event.event );
        }
    } //oninputup

    function inputdown( _event:{ name:String, event:InputEvent } ) {
        for (state in active_states) {
            state.oninputdown( _event.name, _event.event );
        }
    } //oninputdown

//mouse

    function mousedown( e:MouseEvent ) {
        for (state in active_states) {
            state.onmousedown(e);
        }
    } //onmousedown

    function mousewheel( e:MouseEvent ) {
        for (state in active_states) {
            state.onmousewheel(e);
        }
    } //onmousewheel

    function mouseup( e:MouseEvent ) {
        for (state in active_states) {
            state.onmouseup(e);
        }
    } //onmouseup

    function mousemove( e:MouseEvent ) {
        for (state in active_states) {
            state.onmousemove(e);
        }
    } //onmousemove

//touch

    function touchdown( e:TouchEvent ) {
        for (state in active_states) {
            state.ontouchdown(e);
        }
    } //ontouchdown

    function touchup( e:TouchEvent ) {
        for (state in active_states) {
            state.ontouchup(e);
        }
    } //ontouchup

    function touchmove( e:TouchEvent ) {
        for (state in active_states) {
            state.ontouchmove(e);
        }
    } //ontouchmove

//gamepad 

    function gamepadaxis( e:GamepadEvent ) {
        for (state in active_states) {
            state.ongamepadaxis(e);
        }
    } //ongamepadaxis

    function gamepadup( e:GamepadEvent ) {
        for (state in active_states) {
            state.ongamepadup(e);
        }
    } //ongamepadup

    function gamepaddown( e:GamepadEvent ) {
        for (state in active_states) {
            state.ongamepaddown(e);
        }
    } //ongamepaddown

    function gamepaddevice( e:GamepadEvent ) {
        for (state in active_states) {
            state.ongamepaddevice(e);
        }
    } //ongamepaddevice


} //States
