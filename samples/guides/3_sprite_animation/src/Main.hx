
import luxe.Input;
import luxe.Color;
import luxe.Vector;

import luxe.Parcel;
import luxe.ParcelProgress;

import luxe.Sprite;
import phoenix.Texture;
import luxe.components.sprite.SpriteAnimation;


class Main extends luxe.Game {

    var player : Sprite;
    var anim : SpriteAnimation;
    var image : Texture;

        //these are altered by the screen size later
    var max_left : Float = 0;
    var max_right : Float = 0;
    var move_speed : Float = 0;


    override function ready() {

            //A parcel is a group of resources,
            //which allows us to conveniently load
            //them all at and keep track. We add
            //the list of resources we want to the
            //parcel when creating it, and then
            //tell it to load.

        var parcel = new Parcel({
            jsons:[ { id:'assets/anim.json' } ],
            textures : [
                { id: 'assets/apartment.png' },
                { id: 'assets/player.png' }
            ],
        });

            //but, before we load it, we also want to
            //display a simple progress bar for the parcel,
            //this is a default one, you can create your own
        new ParcelProgress({
            parcel      : parcel,
            background  : new Color(1,1,1,0.85),
            oncomplete  : assets_loaded
        });

            //go!
        parcel.load();

    } //ready

        //called when assets are done loading
    function assets_loaded(_) {

        create_apartment();
        create_player();
        create_player_animation();
        connect_input();

    } //assets_loaded

    function create_apartment() {

            //fetch the previously loaded image
        var apartment = Luxe.resources.texture('assets/apartment.png');

            //this makes sure the pixels stay crisp when scaling,
            //we set both at once, since they both are needed.
        apartment.filter_min = apartment.filter_mag = FilterType.nearest;

            //this calculates how wide the image should be on screen,
            //if we make the image as high as the view itself

        var height = Luxe.screen.h;
        var width = (height/apartment.height) * apartment.width;

        new Sprite({
            name: 'apartment',
            texture: apartment,
            size: new Vector( width, height ),
            centered: false
        });

    } //create_apartment

    function create_player() {

            //fetch the player image
        image = Luxe.resources.texture('assets/player.png');

            //keep pixels crisp, same as create_apartment
        image.filter_min = image.filter_mag = FilterType.nearest;

            //work out the correct size based on a ratio with the screen size
        var frame_width = 32;
        var height = Luxe.screen.h/1.75;
        var ratio = (height/image.height);
        var width = ratio * frame_width;

            //this is an arbitrary ratio I made up :)
        move_speed = width*1.5;

            //screen edge boundary for walking
        max_right = Luxe.screen.w - (width/2);
        max_left = (width/2);

            //start with the idle texture
        player = new Sprite({
            name: 'player',
            texture: image,
            pos : new Vector(Luxe.screen.mid.x, Luxe.screen.h - (height/1.75)),
            size: new Vector(width, height)
        });

    } //create_player

    function create_player_animation() {

            //create the animation from the previously loaded json,
            //the frameset structure allows us to specify things like
            //"animate frames 1-3 and then hold for 2 frames" etc.
        var anim_object = Luxe.resources.json('assets/anim.json');

            //create the animation component and add it to the sprite
        anim = player.add( new SpriteAnimation({ name:'anim' }) );

            //create the animations from the json
        anim.add_from_json_object( anim_object.asset.json );

            //set the idle animation to active
        anim.animation = 'idle';
        anim.play();

    } //create_player_animation

    function connect_input() {

        //here, we are going to bind A/left and D/right into a single named
        //input event, so that we can keep our movement code the same when changing keys

        Luxe.input.bind_key('left', Key.left);
        Luxe.input.bind_key('left', Key.key_a);

        Luxe.input.bind_key('right', Key.right);
        Luxe.input.bind_key('right', Key.key_d);

    } //connect_input

    override function update( delta:Float ) {

        //this can get called while waiting, so if it's not
        //ready we just return!
        if(player == null) {
            return;
        }

        var moving = false;

        if(Luxe.input.inputdown('left')) {

            player.pos.x -= move_speed * delta;
            player.flipx = true;

            moving = true;

        } else if(Luxe.input.inputdown('right')) {

            player.pos.x += move_speed * delta;
            player.flipx = false;

            moving = true;

        } //left/right

           //limit to the screen edges
        if(player.pos.x >= max_right) {
            player.pos.x = max_right;
            moving = false;
        }
        if(player.pos.x <= max_left) {
            player.pos.x = max_left;
            moving = false;
        }

            //set the correct animation
        if(moving) {
            if(anim.animation != 'walk') {
                anim.animation = 'walk';
            }
        } else {
            if(anim.animation != 'idle') {
                anim.animation = 'idle';
            }
        }

    } //update

    override function onkeyup( e:KeyEvent ) {

        if(e.keycode == Key.escape) {
            Luxe.shutdown();
        }

    } //onkeyup

    override function config( config:luxe.AppConfig ) {

        #if luxe_doc_sample
            config.window.width = 640;
            config.window.height = 427;
        #end

        return config;

    } //config

} //Main
