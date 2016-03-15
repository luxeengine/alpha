
import luxe.Input;
import luxe.States;

typedef State2TypedArgs = {
    name : String,
    int : Int,
    game : Main
}


class State1 extends State {

    var value : Int;

    public function new( _name:String, _value:Int ) {
        super({ name:_name });
        value = _value;
    }

    override function init() {
        trace("State1 inited with value : " + value);
    } //init

    override function onleave<T>( _value:T ) {
        trace("State 1 LEAVE with value " + _value);
    } //onleave

    override function onenter<T>( _value:T ) {
        trace("State 1 ENTER with value " + _value);
    } //onenter


} //State1


class State2 extends State {

    var data : State2TypedArgs;

    public function new( _data:State2TypedArgs ) {
        super({ name:_data.name });
        data = _data;
    }

    override function init() {
        trace("State 2 inited with data " + data);
    } //init

    override function onenter<T>( _data:T ) {
        trace("State 2 ENTER with data " + _data);
    } //onenter

    override function onleave<T>( _data:T ) {
        trace("State 2 LEAVE with data " + _data);
    } //onleave


} //State2


class TransientState extends State {

    public var start : Float = 0;

    override function onenabled<T>( duration:T ) {

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


class Main extends luxe.Game {


    var machine : States;


    override function ready() {

        machine = new States({ name:'statemachine' });

        machine.add(new State1('state1', 5));
        machine.add(new State2({ name:'state2', int:24, game:this }) );
        machine.add(new TransientState({ name:'transient'}));

        machine.set('fake');
        machine.set('state1', 222 );
        machine.set('state2', { name:"state2enter", int:2536, game:this }, 223 );
        machine.unset({ name:"state2leave", int:4356, game:this });

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


} //Main
