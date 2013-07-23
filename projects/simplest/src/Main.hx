
import lab.Vector;
import lab.Input;
import lab.Color;

class Main extends lab.Game {

    public var dttext : lab.Text;
    public function ready() {
        dttext = new lab.Text({
            depth : 999.3,
            color : new Color(0,0,0,1).rgb(0xf6007b),
            pos : new Vector(10,10),
            font : Lab.renderer.default_font,
            text : 'dt : ',
            size : 20
        });        
    } //ready
  
    public function onkeyup(e) {
      if(e.value == Input.Keys.escape) {
        Lab.shutdown();
      }
    } //onkeyup

    public function update(dt:Float) {
        dttext.text = 'dt : ' + dt + '\n average : ' + Lab.debug.dt_average;
    } //update

    public function shutdown() {

    } //shutdown
}


