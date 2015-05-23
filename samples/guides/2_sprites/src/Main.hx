
import luxe.Input;
import luxe.Sprite;
import luxe.Vector;
import phoenix.Texture;

class Main extends luxe.Game {

    var player : Sprite;
        //set by the screen size later
    var move_speed : Float = 0;

        //The config function is simple: It hands us a default config,
        //we modify the values that we want to change, and then we
        //return it with the modifications.
    override function config( config:luxe.AppConfig ) {

            //This time, we are going to modify the preload parcel texture list,
            //and add our texture for the sprite, so that it will exist when we
            //try to use it during `ready`
        config.preload.textures.push({ id:'assets/stand.png' });

        #if luxe_doc_sample
            config.window.width = 640;
            config.window.height = 427;
        #end

        return config;

    } //config


    override function ready() {

            //fetch the previously loaded texture!
        var image = Luxe.resources.texture('assets/stand.png');

            //keep pixels crisp when scaling them, for pixel art
        image.filter_min = image.filter_mag = FilterType.nearest;

            //work out the correct size based on a ratio
        var height = Luxe.screen.h/1.75;
        var width = (height/image.height) * image.width;

            //this is an arbitrary ratio I made up :)
        move_speed = width*3;

            //create the actual visible player, give it the texture
        player = new Sprite({
            name: 'player',
            texture: image,
            pos : new Vector(Luxe.screen.mid.x, Luxe.screen.h - (height/1.75)),
            size: new Vector(width, height)
        });

        connect_input();

    } //ready


    function connect_input() {

        //here, we are going to bind A/left and D/right into a single named
        //input event, so that we can keep our movement code the same when changing keys

        Luxe.input.bind_key('left', Key.left);
        Luxe.input.bind_key('left', Key.key_a);

        Luxe.input.bind_key('right', Key.right);
        Luxe.input.bind_key('right', Key.key_d);

    } //connect_input

    override function update( delta:Float ) {

            //This is using the "immediate query" api
            //there is also oninputdown like onkeydown and onmousedown

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
