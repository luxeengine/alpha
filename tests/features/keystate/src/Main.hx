
import luxe.Input;

class Main extends luxe.Game {


    public function ready() {

        Luxe.showConsole( true );

    } //ready

    public function onkeyup( e:KeyEvent ) {

        if(e.key == KeyValue.escape) {
            Luxe.shutdown();
        }
        
    } //onkeyup

    public function update( dt:Float ) {

        if(Luxe.input.keypressed(KeyValue.key_R)) {
            trace('key R was pressed');
        }
        
        if(Luxe.input.keyreleased(KeyValue.key_R)) {
            trace('key R was released');
        }

        if(Luxe.input.keydown(KeyValue.key_R)) {
            trace('key R is down');
        }

    } //update


} //Main
