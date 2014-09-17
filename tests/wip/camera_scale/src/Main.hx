
import luxe.Color;
import luxe.Input;
import luxe.Sprite;
import luxe.Vector;
import luxe.Rectangle;
import luxe.Text;
import phoenix.Texture;

class Main extends luxe.Game {

    var text : Text;

    override function ready() {


            //load the image up
        var apartment = Luxe.loadTexture('assets/apartment.png');

        apartment.onload = function(_){

                //this makes sure the pixels stay crisp when scaling
            apartment.filter = FilterType.nearest;

                //set the sprite at 0,0 (centered false)
            new Sprite({
                name: 'apartment',
                texture: apartment,
                centered: false
            });

            Luxe.camera.zoom = 4;
            Luxe.camera.center = new Vector(apartment.width/2, apartment.height/2);

        } //onload

        text = new Text({
            pos:new Vector(3,100),
            text : 'move the mouse',
            color : new Color(0,0,0),
            size : 4
        });


    } //ready

    override function onmousemove( e:MouseEvent ) {
        var world_coord = Luxe.camera.screen_point_to_world(e.pos);
        text.text =
              'screen coord: ' + e.pos.int() + '\n'
            + 'world coord: ' + world_coord.int();
    }

    override function onkeyup( e:KeyEvent ) {

        if(e.keycode == Key.escape) {
            Luxe.shutdown();
        }

    } //onkeyup

} //Main
