
import luxe.Input;
import luxe.States;

typedef State2TypedArgs = {
    name : String,
    int : Int,
    game : Main
}


class State1 extends State {


	public function init( value:Int ) {
        trace("State1 inited with value : " + value);
	} //init

    public function leave( value:Int ) {
        trace("State 1 LEAVE with value " + value);
    } //leave

    public function enter( value:Int ) {
        trace("State 1 ENTER with value " + value);
    } //enter


} //State1


class State2 extends State {


    public function init( data:State2TypedArgs ) {
        trace("State 2 inited with data " + data);
    } //init

    public function enter( data:State2TypedArgs ) {
        trace("State 2 ENTER with data " + data);
    } //enter

    public function leave( data:State2TypedArgs ) {
        trace("State 2 LEAVE with data " + data);
    } //leave


} //State2


class TransientState extends State {


    public var start : Float = 0;


    public function enabled( duration:Float ) {

        trace("enabled transient state, will end in " + duration + 's' );
        start = Luxe.time;
        Luxe.timer.schedule( duration, function(){
            trace(" duration complete, disabling ");
            disable();
        });

    } //enabled

    public function update(dt:Float) {

        trace("inside transient update : " + luxe.utils.Maths.fixed((Luxe.time - start),3) );

    } //update

} //TransientState


class Main extends luxe.Game {


	var machine : States;


    override function ready() {

    	machine = new States();
        machine.add_state(State1, 'state1', { init_with:5} );
        machine.add_state(State2, 'state2', { init_with:{ name:"state2init", int:24, game:this } } );
        machine.add_state(TransientState, 'transient');

        machine.init();

        machine.set('state1', 222 );
        machine.set('state2', { name:"state2enter", int:2536, game:this }, 223 );
        machine.set('', null , { name:"state2leave", int:4356, game:this } );

        trace("Hit space key to enable a transient state");

        Luxe.core.show_console(true);

    } //ready

    override function onkeyup( e:KeyEvent ) {

        if(e.keycode == Key.SPACE) {
            var _duration = (Std.random(2)+1) * Math.random();
            machine.enable('transient', _duration);
        }

        if(e.keycode == Key.ESCAPE) {
            Luxe.shutdown();
        }

    } //onkeyup

    override function update(dt:Float) {

        machine.update(dt);

    } //update


} //Main
