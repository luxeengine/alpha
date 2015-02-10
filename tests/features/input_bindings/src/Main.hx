
import luxe.Vector;
import luxe.Input;

class Main extends luxe.Game {

    override function ready() {

        Luxe.showConsole(true);

        trace('press space, z, or mouse left.');

        Luxe.input.bind_key('fire', Key.space);
        Luxe.input.bind_key('fire', Key.key_z);
        Luxe.input.bind_mouse('fire', MouseButton.left);

        // all gamepads fires this named binding when button 0 is pressed
        Luxe.input.bind_gamepad('fire', 0);

        //only the gamepad=1 fires this named binding when button 2 is pressed
        Luxe.input.bind_gamepad('jump', 2, 1);

    } //ready

    override function oninputup( _input:String, e:InputEvent ) {
        trace( 'named input up : ' + _input );
    } //oninputup

    override function oninputdown( _input:String, e:InputEvent ) {
        trace( 'named input down : ' + _input );

    } //oninputdown

    override function onkeyup( e:KeyEvent ) {
        if(e.keycode == Key.escape) {
            Luxe.shutdown();
        }
    } //onkeyup

    var next_trace:Float = 0.0;
    override function update(dt:Float) {

        if(Luxe.input.inputdown('fire')) {
            if(Luxe.time > next_trace) {
                trace('fire is held down');
                next_trace = Luxe.time + 0.4;
            }
        }

        if(Luxe.input.inputpressed('fire')) {
            trace('fire pressed in update');
        }

        if(Luxe.input.inputreleased('fire')) {
            trace('fire released in update');
        }

    }


} //Main
