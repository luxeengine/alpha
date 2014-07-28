
import luxe.Vector;
import luxe.Input;

class Main extends luxe.Game {

    override function ready() {

        Luxe.input.add('fire', Key.SPACE);
        Luxe.input.add('fire', Key.KEY_z);
        Luxe.input.add('fire', MouseButton.left);

    } //ready

    override function oninputup( _input:String, e:InputEvent ) {
        trace( 'named input up : ' + _input );
    } //oninputup

    override function oninputdown( _input:String, e:InputEvent ) {
        trace( 'named input down : ' + _input );
    } //oninputdown

    override function onkeyup( e:KeyEvent ) {
        if(e.keycode == Key.ESCAPE) {
            Luxe.shutdown();
        }
    } //onkeyup


} //Main
