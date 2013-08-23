
import luxe.Vector;
import luxe.Input;
import luxe.Sprite;
import luxe.Color;

import motion.Actuate;

class Main extends luxe.Game {


    var test_sprite : Sprite;

    public function ready() {
        
        test_sprite = new Sprite({
            size : new Vector(128,128),
            pos : new Vector(480,320),
            color : new Color().rgb(0xf6007b),
        });

    } //ready
  
    public function onmousemove(e) {
        
    }

    public function onkeyup(e) {

      if(e.value == Input.Keys.key_S) {
            Actuate.tween( test_sprite.scale , 0.6, { x:1+(Math.random()*5) }).ease( motion.easing.Bounce.easeOut );
      }

      if(e.value == Input.Keys.escape) {
        Luxe.shutdown();
      }
    } //onkeyup

    public function update(dt:Float) {

    } //update

    public function shutdown() {

    } //shutdown
}


