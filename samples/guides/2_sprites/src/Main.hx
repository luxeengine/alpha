
import luxe.Input;
import luxe.Color;
import luxe.Parcel;
import luxe.ParcelProgress;
import luxe.Sprite;
import luxe.Vector;
import phoenix.Texture;


class Main extends luxe.Game {

    var player : Sprite;
    var image : Texture;

        //set by the screen size later
    var move_speed : Float = 0;

    override function ready() {

        //it's important that if you want to build
        //for platforms where loading can take time
        //like on a web page, you must wait for your assets
        //to load before using them.

        //In the next tutorial this is shown using a built in progress bar,
        //for multiple assets, but for now we just use the onloaded argument of load texture

        image = Luxe.loadTexture('assets/stand.png');

        image.onload = create_player;

    } //ready

    function create_player(_) {

            //now that the image is loaded
            //keep pixels crisp
        image.filter = FilterType.nearest;

            //work out the correct size based on a ratio
        var height = Luxe.screen.h/1.75;
        var width = (height/image.height) * image.width;

            //this is an arbitrary ratio I made up :)
        move_speed = width*3;

        player = new Sprite({
            name: 'player',
            texture: image,
            pos : new Vector(Luxe.screen.mid.x, Luxe.screen.h - (height/1.75)),
            size: new Vector(width, height)
        });

        connect_input();

    } //create_static_player


    function connect_input() {

        //here, we are going to bind A/left and D/right into a single named
        //input event, so that we can keep our movement code the same when changing keys

        Luxe.input.add('left', Key.left);
        Luxe.input.add('left', Key.key_a);

        Luxe.input.add('right', Key.right);
        Luxe.input.add('right', Key.key_d);

    } //connect_input

    override function update( delta:Float ) {

        if(Luxe.input.inputdown('left')) {
            player.pos.x -= move_speed * delta;
            player.flipx = true;
        } else if(Luxe.input.inputdown('right')) {
            player.pos.x += move_speed * delta;
            player.flipx = false;
        }

    } //update

    override function onkeyup( e:KeyEvent ) {

        if(e.keycode == Key.escape) {
            Luxe.shutdown();
        }

    } //onkeyup


} //Main
