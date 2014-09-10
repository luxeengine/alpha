
import luxe.Input;
import luxe.Sprite;
import luxe.Color;
import luxe.Vector;

class Main extends luxe.Game {

    var block : Sprite;

    override function ready() {

        block = new Sprite({
            name: 'a sprite',
            pos: Luxe.screen.mid,
            color: new Color().rgb(0xf94b04),
            size: new Vector(128, 128)
        });

    } //ready

    override function onmousemove( event:MouseEvent ) {

        block.pos = event.pos;

    } //onmousemove

    override function onkeyup( e:KeyEvent ) {

        if(e.keycode == Key.escape) {
            Luxe.shutdown();
        }

    } //onkeyup

    override function update( delta:Float ) {

            //if we add 40 each frame, and scale it by the delta,
            //it becomes 40 degrees per second!
        block.rotation_z += 40 * delta;

    } //update


} //Main
