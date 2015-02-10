
import luxe.Vector;
import luxe.Input;
import snow.input.gamepad.XBox360Buttons;
import snow.input.gamepad.PS3Buttons;

class Main extends luxe.Game {

    override function ready() {

        Luxe.showConsole(true);

        trace('press space, z, or mouse left.');

        Luxe.input.bind_key('fire', Key.space);
        Luxe.input.bind_key('fire', Key.key_z);
        Luxe.input.bind_mouse('fire', MouseButton.left);
        Luxe.input.bind_gamepad('fire', XBox360Buttons.button_b);

        //needs two gamepads connected for this to work
        Luxe.input.bind_gamepad('jump', PS3Buttons.cross, 1);

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
