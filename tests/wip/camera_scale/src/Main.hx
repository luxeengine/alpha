
import luxe.Color;
import luxe.Input;
import luxe.Sprite;
import luxe.Vector;
import luxe.Rectangle;
import luxe.Text;
import luxe.Camera;
import phoenix.Texture;

class Main extends luxe.Game {

    var text : Text;

    override function config( config:luxe.AppConfig ) {

        config.window.width = 720;
        config.window.height = 420;

        return config;

    } //config

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

            Luxe.camera.size = new Vector(apartment.width, apartment.height);

        } //onload

        text = new Text({
            pos:new Vector(3,100),
            text : 'size mode : fit\nmove the mouse',
            color : new Color(0,0,0),
            point_size : 4
        });


    } //ready

    override function onmousewheel( e:MouseEvent ) {
        if( e.y > 0 ) {
            Luxe.camera.zoom += 0.01;
        } else if( e.y < 0 ) {
            Luxe.camera.zoom -= 0.01;
        }
    }

    override function onmousemove( e:MouseEvent ) {
        update_text(e.pos.int());
    }

    function update_text( ?pos:Vector ) {
        if(pos == null) {
            pos = Luxe.screen.cursor.pos.int();
        }

        var world_coord = Luxe.camera.screen_point_to_world(pos);

        text.text =
              'size mode: ' + Luxe.camera.size_mode + '\n'
            + 'screen coord: ' + pos + '\n'
            + 'world coord: ' + world_coord.int();
    }

    override function onkeyup( e:KeyEvent ) {

            //cycle sizing mode by space bar
        if(e.keycode == Key.space) {
            switch(Luxe.camera.size_mode) {
                case fit:
                    Luxe.camera.size_mode = SizeMode.cover;
                    update_text();
                case cover:
                    Luxe.camera.size_mode = SizeMode.contain;
                    update_text();
                case contain:
                    Luxe.camera.size_mode = SizeMode.fit;
                    update_text();
            }
        }

        if(e.keycode == Key.escape) {
            Luxe.shutdown();
        }

    } //onkeyup

} //Main
