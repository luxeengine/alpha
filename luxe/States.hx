package luxe;

import luxe.Input;
import luxe.Objects;

import luxe.Log.log;
import luxe.Log._debug;
import luxe.Log._verbose;


class State extends Objects {

    public var machine : States;
    public var active : Bool = false;

    public function enable<T>( ?_enable_with:T ) {

        machine.enable( name, _enable_with );

    } //enable

    public function disable<T>( ?_disable_with:T ) {

        machine.disable( name, _disable_with );

    } //disable

    public function init() {}
    public function reset() {}
    public function destroyed() {}

    public function leave<T>(d:T) {}
    public function enter<T>(d:T) {}
    public function added() {}
    public function removed() {}
    public function pre_render() {}
    public function post_render() {}

    public function enabled<T>(d:T) {}
    public function disabled<T>(d:T) {}

    public function fixed_update() {}
    public function update(dt:Float) {}

    public function onkeyup(e:KeyEvent) {}
    public function onkeydown(e:KeyEvent) {}

    public function onmouseup(e:MouseEvent) {}
    public function onmousedown(e:MouseEvent) {}
    public function onmousemove(e:MouseEvent) {}
    public function onmousewheel(e:MouseEvent) {}

    public function ontouchup(e:TouchEvent) {}
    public function ontouchdown(e:TouchEvent) {}
    public function ontouchmove(e:TouchEvent) {}

    public function ongamepadaxis(e:GamepadEvent) {}
    public function ongamepaddown(e:GamepadEvent) {}
    public function ongamepadup(e:GamepadEvent) {}
    public function ongamepaddevice(e:GamepadEvent) {}

    public function oninputdown(_name:String, e:InputEvent) {}
    public function oninputup(_name:String, e:InputEvent) {}

} //State

class States extends Objects {

    @:noCompletion public var _states: Map<String,State>;

    public var active_states: Array<State>;
    public var current_state: State;


    public function new( ?_name:String='' ) {

        super();
        name = _name == '' ? Luxe.utils.uniqueid() : _name;
        _states = new Map();
        active_states = new Array<State>();

    } //new

    public function add(_name:String, _state:State ) : Void {

            //set the name of the instance
        _state.name = _name;
            //store it in the state list
        _states.set( _name, _state );
            //store reference of the owner
        _state.machine = this;
            //let them know
        _state.added();

            //debug stuff
        _debug('states / $name / adding a state called ' + _temp_name + ', now at ' + Lambda.count(_states) + ' states');

    } //add_state

    public function enable<T>( _name:String, ?_enable_with:T ) {
        var state = _states.get( _name );
        if(state != null) {
            _debug('states / $name / enabling a state ' + _name );
            state.enabled(_enable_with);
            active_states.push(state);
        }
    } //enable

    public function disable<T>( _name:String, ?_disable_with:T  ) {
        var state = _states.get( _name );
        if(state != null) {
            _debug('states / $name / disabling a state ' + _name );
            state.disabled(_disable_with);
            active_states.remove( state );
        }
    } //disable

    public function set<T1,T2>(name:String, ?_enter_with:T1, ?_leave_with:T2 ) {

        _debug('attempt to set state to $name');

        if (current_state != null) {

                _debug('current state was valid, leaving current state : ${current_state.name} (${current_state.active})');
                _debug('currently at ${Lambda.count(active_states)} active_states');

            active_states.remove( current_state );

                _debug('removed ${current_state.name}, now at ${Lambda.count(active_states)} active_states');

            current_state.leave(_leave_with);

            current_state = null;

        } //current_state != null

        if (_states.exists(name)) {

                _debug('found state named $name, calling enter');

            current_state = _states.get(name);
            active_states.push( current_state );

                _debug('calling enter on $name, now at ${Lambda.count(active_states)} active_states');

            current_state.enter(_enter_with);

        } //if states.exists(name)

    } //set

    //entity router functions
    public function init() {
        for (state in _states) {
            state.init();
        }
    } //init
    public function reset() {
        for (state in active_states) {
            state.reset();
        }
    } //reset
    public function update(dt:Float) {
        for (state in active_states) {
            state.update(dt);
        }
    } //update
    public function destroy() {
        for (state in _states) {
            state.destroyed();
        }
    } //destroy
    public function pre_render() {
        for (state in active_states) {
            state.pre_render();
        }
    } //pre_render
    public function post_render() {
        for (state in active_states) {
            state.post_render();
        }
    } //post_render

//Internal helper functions

    public function onkeydown( e:KeyEvent ) {
        for (state in active_states) {
            state.onkeydown(e);
        }
    } //onkeydown

    public function onkeyup( e:KeyEvent ) {
        for (state in active_states) {
            state.onkeyup(e);
        }
    } //onkeyup

    public function oninputup( name:String, e:InputEvent ) {
        for (state in active_states) {
            state.oninputup(name, e);
        }
    } //oninputup

    public function oninputdown( name:String, e:InputEvent ) {
        for (state in active_states) {
            state.oninputdown(name, e);
        }
    } //oninputdown

    public function onmousedown( e:MouseEvent ) {
        for (state in active_states) {
            state.onmousedown(e);
        }
    } //onmousedown

    public function onmousewheel( e:MouseEvent ) {
        for (state in active_states) {
            state.onmousewheel(e);
        }
    } //onmousewheel

    public function onmouseup( e:MouseEvent ) {
        for (state in active_states) {
            state.onmouseup(e);
        }
    } //onmouseup

    public function onmousemove( e:MouseEvent ) {
        for (state in active_states) {
            state.onmousemove(e);
        }
    } //onmousemove

    public function ontouchdown( e:TouchEvent ) {
        for (state in active_states) {
            state.ontouchdown(e);
        }
    } //ontouchdown

    public function ontouchup( e:TouchEvent ) {
        for (state in active_states) {
            state.ontouchup(e);
        }
    } //ontouchup

    public function ontouchmove( e:TouchEvent ) {
        for (state in active_states) {
            state.ontouchmove(e);
        }
    } //ontouchmove

    public function ongamepadaxis( e:GamepadEvent ) {
        for (state in active_states) {
            state.ongamepadaxis(e);
        }
    } //ongamepadaxis

    public function ongamepadup( e:GamepadEvent ) {
        for (state in active_states) {
            state.ongamepadup(e);
        }
    } //ongamepadup

    public function ongamepaddown( e:GamepadEvent ) {
        for (state in active_states) {
            state.ongamepaddown(e);
        }
    } //ongamepaddown

    public function ongamepaddevice( e:GamepadEvent ) {
        for (state in active_states) {
            state.ongamepaddevice(e);
        }
    } //ongamepaddevice


} //States
