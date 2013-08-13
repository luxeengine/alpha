
import luxe.Vector;
import luxe.Input;

class Main extends luxe.Game {

    public function ready() {

        Luxe.utils.file_bytes_to_class( 'assets/box.ui.png', '/Users/Sven/dev/box.ui.hx' );
        Luxe.utils.file_bytes_to_class( 'assets/button.ui.png', '/Users/Sven/dev/button.ui.hx' );

    } //ready
  
    public function onkeyup(e) {
      if(e.value == Input.Keys.escape) {
        Luxe.shutdown();
      }
    } //onkeyup

    public function update(dt:Float) {

    } //update

    public function shutdown() {

    } //shutdown
}


