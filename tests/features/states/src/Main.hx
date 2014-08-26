
import luxe.Input;
import luxe.States;

typedef State2TypedArgs = {
    name : String,
    int : Int,
    game : Main
}


class State1 extends State {

    var value : Int;

    public function new( _value:Int ) {
        super();
        value = _value;
    }

	override function init() {
        trace("State1 inited with value : " + value);
	} //init

    override function leave<T>( _value:T ) {
        trace("State 1 LEAVE with value " + _value);
    } //leave

    override function enter<T>( _value:T ) {
        trace("State 1 ENTER with value " + _value);
    } //enter


} //State1


class State2 extends State {

    var data : State2TypedArgs;

    public function new( _data:State2TypedArgs ) {
        super();
        data = _data;
    }

    override function init() {
        trace("State 2 inited with data " + data);
    } //init

    override function enter<T>( _data:T ) {
        trace("State 2 ENTER with data " + _data);
    } //enter

    override function leave<T>( _data:T ) {
        trace("State 2 LEAVE with data " + _data);
    } //leave


} //State2


class TransientState extends State {

    public var start : Float = 0;

    override function enabled<T>( duration:T ) {

        trace("enabled transient state, will end in " + duration + 's' );

        start = Luxe.time;
        Luxe.timer.schedule(cast duration, function(){
            trace(" duration complete, disabling ");
            disable();
        });

    } //enabled

    override function update(dt:Float) {

        trace("inside transient update : " + luxe.utils.Maths.fixed((Luxe.time - start),3) );

    } //update

} //TransientState


class TestEmits extends luxe.Emitter {

    public function new() {

        super();

        on('one', function(s:Float) { trace( s+0.1 ); });
        on('two', function(d:{a:Int}) { trace( d ); });

        emit('one', 0.1);
        emit('two', { a:3 });
        emit('two', { a:4 });

    }

} //TestEmits

class Main extends luxe.Game {


	var machine : States;


    override function ready() {

        var s : TestEmits = new TestEmits();

    	machine = new States('statemachine');

        machine.add('state1', new State1(5) );
        machine.add('state2', new State2({ name:"state2init", int:24, game:this }) );
        machine.add('transient', new TransientState());

        machine.init();

        machine.set('state1', 222 );
        machine.set('state2', { name:"state2enter", int:2536, game:this }, 223 );
        machine.set('', null , { name:"state2leave", int:4356, game:this } );

        trace("Hit space key to enable a transient state");

        Luxe.core.show_console(true);

    } //ready

    override function onkeyup( e:KeyEvent ) {

        if(e.keycode == Key.space) {
            var _duration = (Std.random(2)+1) * Math.random();
            machine.enable('transient', _duration);
        }

        if(e.keycode == Key.escape) {
            Luxe.shutdown();
        }

    } //onkeyup

    override function update(dt:Float) {

        machine.update(dt);

    } //update


} //Main
