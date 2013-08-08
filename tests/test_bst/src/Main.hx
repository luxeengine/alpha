
import luxe.Vector;
import luxe.Input;
import tests.BST;


class Main extends luxe.Game {

    public function ready() {
        var n = new BST();
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


