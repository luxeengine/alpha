
import luxe.Vector;
import luxe.Input;

class Main extends luxe.Game {

    public function ready() {

        Luxe.input.add('fire', KeyValue.space);
        Luxe.input.add('fire', KeyValue.key_Z);
        Luxe.input.add('fire', MouseButton.left);

    } //ready

    public function oninput( _input:String, e:Dynamic ) {
        trace( 'named input fired : ' + _input );
    }
  
    public function onkeyup( e:KeyEvent ) {
        if(e.value == Input.Keys.escape) {
            Luxe.shutdown();
        }
    } //onkeyup

    public function update(dt:Float) {

    } //update

    public function shutdown() {

    } //shutdown
}


