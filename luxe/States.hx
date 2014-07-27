package luxe;

import luxe.Input;
import luxe.Objects;

import luxe.Log.log;
import luxe.Log._debug;
import luxe.Log._verbose;

import luxe.options.StateOptions;

class State extends Objects {


    public var machine : States;
    public var active : Bool = false;

    var options : Dynamic;


    public override function new<T>( ?_options:StateOptions<T> ) {

        super();

        options = _options;

    }


    public function enable<T>( ?_enable_with:T ) {
        machine.enable( name, _enable_with );
    }

    public function disable<T>( ?_disable_with:T ) {
        machine.disable( name, _disable_with );
    }

    @:noCompletion public function _init() {
        _call(this, 'init', [ (options == null) ? null : cast options.init_with ]);
    }

    @:noCompletion public function _update(dt:Float) {

        _call(this, 'update', [dt]);

    } //update


} //State

class States {


    @:noCompletion public var _states: Map<String,State>;

    public var active_states: Array<State>;
    public var current_state: State;


    public function new() {

        _states = new Map();
        active_states = new Array<State>();

    } //new

    public function add_state<T1,T2>(type:Class<T1>, ?_name:String='', ?_construct_with:T2 ) : T1 {

        var _temp_name = _name;

        if(_temp_name.length == 0) {
            _temp_name = Luxe.utils.uniqueid();
            trace("warning ; State being added with no name " + type + ", this means setting it by name requires using a uniqueid : " + _temp_name);
        } else {
            _temp_name = _name;
        }

            //create a class instance
        var _state = Type.createInstance( type, [_construct_with] );
            //create a state typed instance
        var _state_instance : State = cast _state;
            //set the name of the instance
        _state_instance.name = _temp_name;
            //store it in the state list
        _states.set(_temp_name, _state_instance );
            //store reference of the owner
        _state_instance.machine = this;
            //debug stuff
        _debug('adding a state called ' + _temp_name + ', now at ' + Lambda.count(_states) + ' states');

            //return the state instance
        return _state;

    } //add_state

    public function enable<T>( _name:String, ?_enable_with:T ) {
        var state = _states.get( _name );
        if(state != null) {
            _debug('enabling a state ' + _name );
            _call(state, 'enabled',[_enable_with] );
            active_states.push(state);
        }
    } //enable

    public function disable<T>( _name:String, ?_disable_with:T  ) {
        var state = _states.get( _name );
        if(state != null) {
            _debug('disabling a state ' + _name );
            _call(state, 'disabled',[_disable_with] );
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

            _call(current_state, 'leave',[_leave_with] );

            current_state = null;

        } //current_state != null

        if (_states.exists(name)) {

                _debug('found state named $name, calling enter');

            current_state = _states.get(name);
            active_states.push( current_state );

                _debug('calling enter on $name, now at ${Lambda.count(active_states)} active_states');

            _call(current_state, 'enter',[_enter_with] );

        } //if states.exists(name)

    } //set

    //entity router functions
    public function init() {
        for (state in _states) {
            state._init();
        }
    } //init
    public function reset() {
        for (state in active_states) {
            _call(state, 'reset');
        }
    } //reset
    public function update(dt:Float) {
        for (state in active_states) {
            state._update(dt);
        }
    } //update
    public function destroy() {
        for (state in _states) {
            _call(state, 'destroyed', []);
        }
    } //destroy
    public function prerender() {
        for (state in active_states) {
            _call(state, 'prerender', []);
        }
    } //prerender
    public function postrender() {
        for (state in active_states) {
            _call(state, 'postrender', []);
        }
    } //postrender

//Internal helper functions

    function _call(_object:State, _name:String, ?_args:Array<Dynamic> ) {
        var _func = Reflect.field(_object, _name);
        if(_func != null) {
            Reflect.callMethod(_object, _func, _args );
        } //does function exist?
    } //_call

    public function onkeydown( e:KeyEvent ) {
        for (state in active_states) {
            _call(state, 'onkeydown', [e]);
        }
    } //onkeydown

    public function onkeyup( e:KeyEvent ) {
        for (state in active_states) {
            _call(state, 'onkeyup', [e]);
        }
    } //onkeyup

    public function oninputup( name:String, e:InputEvent ) {
        for (state in active_states) {
            _call(state, 'oninputup', [name,e]);
        }
    } //oninputup

    public function oninputdown( name:String, e:InputEvent ) {
        for (state in active_states) {
            _call(state, 'oninputdown', [name,e]);
        }
    } //oninputdown

    public function onmousedown( e:MouseEvent ) {
        for (state in active_states) {
            _call(state, 'onmousedown', [e]);
        }
    } //onmousedown

    public function onmousewheel( e:MouseEvent ) {
        for (state in active_states) {
            _call(state, 'onmousewheel', [e]);
        }
    } //onmousewheel

    public function onmouseup( e:MouseEvent ) {
        for (state in active_states) {
            _call(state, 'onmouseup', [e]);
        }
    } //onmouseup

    public function onmousemove( e:MouseEvent ) {
        for (state in active_states) {
            _call(state, 'onmousemove', [e]);
        }
    } //onmousemove

    public function ontouchdown( e:TouchEvent ) {
        for (state in active_states) {
            _call(state, 'ontouchdown', [e]);
        }
    } //ontouchdown

    public function ontouchup( e:TouchEvent ) {
        for (state in active_states) {
            _call(state, 'ontouchup', [e]);
        }
    } //ontouchup

    public function ontouchmove( e:TouchEvent ) {
        for (state in active_states) {
            _call(state, 'ontouchmove', [e]);
        }
    } //ontouchmove


} //States
