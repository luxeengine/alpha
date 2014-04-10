
import luxe.Vector;
import luxe.Input;

class Main extends luxe.Game {

    public function ready() {

        Luxe.input.add('fire', KeyValue.space);
        Luxe.input.add('fire', KeyValue.key_Z);
        Luxe.input.add('fire', MouseButton.left);

    } //ready

    public function oninputup( _input:String, e:InputEvent ) {
        trace( 'named input up : ' + _input );
    }
    public function oninputdown( _input:String, e:InputEvent ) {
        trace( 'named input down : ' + _input );
    }
  
    public function onkeyup( e:KeyEvent ) {
        if(e.value == Input.Keys.escape) {
            Luxe.shutdown();
        }
    } //onkeyup

    public function update(dt:Float) {

    } //update

    public function destroyed() {

    } //destroyed
}


