
import luxe.Input;
import luxe.Color;
import luxe.Parcel;
import luxe.Sprite;
import luxe.Vector;
import phoenix.Texture;


class Main extends luxe.Game {

    var player : Sprite;

    override function ready() {

            //fetch a list of assets to load from the json file
        var json_asset = Luxe.loadJSON('assets/parcel.json');

            //then create a parcel to load it for us, and tell us when it's done
        var preload = new Parcel({ oncomplete:assets_loaded });
            preload.from_json(json_asset.json);

                //go!
            preload.load();

    } //ready

        //called when assets are done loading
    function assets_loaded(_) {

        create_apartment();
        create_static_player();

    } //assets_loaded

    function create_apartment() {

            //load the image up
        var apartment = Luxe.loadTexture('assets/apartment.png');

            //this makes sure the pixels stay crisp when scaling
        apartment.filter = FilterType.nearest;

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

    function create_static_player() {

            //load the standing image
        var stand = Luxe.loadTexture('assets/stand.png');

            //keep pixels crisp
        stand.filter = FilterType.nearest;

            //work out the correct size based on a ratio
        var height = Luxe.screen.h/1.75;
        var width = (height/stand.height) * stand.width;

        player = new Sprite({
            name: 'player',
            texture: stand,
            pos : new Vector(Luxe.screen.mid.x, Luxe.screen.h - (height/1.75)),
            size: new Vector(width, height)
        });

    } //create_static_player

    override function onkeyup( e:KeyEvent ) {

        if(e.keycode == Key.escape) {
            Luxe.shutdown();
        }

    } //onkeyup


} //Main
