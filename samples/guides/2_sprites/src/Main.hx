
import luxe.Input;
import luxe.Color;
import luxe.Sprite;
import luxe.Vector;

class Main extends luxe.Game {

    var sprite_image : Sprite;
    var sprite_block : Sprite;

    public function ready() {

            //create a sprite with an image 
        sprite_image = new Sprite({
            pos : new Vector(Luxe.screen.w/2, Luxe.screen.h/2),
            texture : Luxe.loadTexture('assets/luxelogo.png'),
            depth : 1,
        }); //sprite_image

            //create a sprite just as a block
        sprite_block = new Sprite({
            pos : new Vector(0,0),
            size : new Vector(Luxe.screen.w, Luxe.screen.h),
            centered : false,
            color : new Color(0.6,0.4,0.2,0.2)
        }); //sprite_block

    } //ready

    public function onmousemove( e:MouseEvent ) {

        sprite_image.pos = e.pos;

    } //onmousemove
  
    public function onkeyup( e:KeyEvent ) {
        if(e.key == KeyValue.escape) {
            Luxe.shutdown();
        }
    } //onkeyup

    public function update(dt:Float) {

    } //update

} //Main