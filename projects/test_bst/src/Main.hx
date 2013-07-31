
import lab.Vector;
import lab.Input;
import tests.BST;


class Main extends lab.Game {

    public function ready() {
        var n = new BST();
    } //ready
  
    public function onkeyup(e) {
      if(e.value == Input.Keys.escape) {
        Lab.shutdown();
      }
    } //onkeyup

    public function update(dt:Float) {

    } //update

    public function shutdown() {

    } //shutdown
}


