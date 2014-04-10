
import luxe.Input;
import luxe.Color;

import phoenix.geometry.RingGeometry;


class Main extends luxe.Game {


    var ring : RingGeometry;


    public function ready() {

        var middle_screen_x = Luxe.screen.w / 2;
        var middle_screen_y = Luxe.screen.h / 2;

        var box = Luxe.draw.box({
            x: middle_screen_x - 45,
            y: middle_screen_y - 45,
            w: 90,
            h: 90,
            color : new Color().rgb(0xff5917)
        });

        ring = Luxe.draw.ring({
            x: middle_screen_x,
            y: middle_screen_y,
            r: 70
        });

    } //ready

    public function onmousemove( e:MouseEvent ) {

            //move the ring to the mouse position
        ring.pos = e.pos;

    } //onmousemove
  
    public function onkeyup( e:KeyEvent ) {
        if(e.key == KeyValue.escape) {
            Luxe.shutdown();
        }
    } //onkeyup

    public function update(dt:Float) {

    } //update


} //Main
