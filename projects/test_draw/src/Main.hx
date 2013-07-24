
import lab.Vector;
import lab.Input;
import phoenix.geometry.LineGeometry;



class Main extends lab.Game {

    public var line : LineGeometry; 

    public function ready() {

        line = Lab.draw.line({
            p0 : new Vector( 0, Lab.screen.h/2 ),
            p1 : new Vector( Lab.screen.w, Lab.screen.h/2 ),
            color : new Color(0.8,0.2,0.3,1)
        });

        

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


