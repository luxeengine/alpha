
import luxe.Input;
import luxe.Sprite;
import luxe.Parcel;
import luxe.ParcelProgress;
import luxe.Text;
import luxe.Vector;
import luxe.Color;
import luxe.resource.Resource;

import phoenix.BitmapFont;
import phoenix.Texture;
import snow.types.Types.AudioHandle;


//A simple message object,
    //time to stay on screen,
    //message to show,
    //and optional event to fire
typedef Message = {
      msg : String,
      time : Float,
    ? event : String
}

class Main extends luxe.Game {

        //the text object
    var text : Text;
        //the font we will use
    var montez_font : BitmapFont;
        //the screen sized color overlay
    var overlay : Sprite;
        //the image background
    var apartment : Sprite;
        //a list of messages to show
    var messages : Array<Message>;


    var music_id = 'assets/sound/189175__triangelx__emotional-piano.ogg';
    var thunder_id = 'assets/sound/244053__lennyboy__thunder.ogg';
    var rain_id = 'assets/sound/244028__lennyboy__rain001.ogg';

        //The audio sources
    var thunder : AudioResource;
    var music : AudioResource;
    var rain : AudioResource;

        //The audio instances (i.e the one that is playing)
    var thunder_handle : AudioHandle;
    var music_handle : AudioHandle;
    var rain_handle : AudioHandle;

    override function ready() {

            //as with guide 3, we just create a list of assets to load

        var parcel = new Parcel({
            textures : [{ id : 'assets/apartment.png' }],
            fonts : [{ id : 'assets/montez/montez.fnt' }],
            sounds : [
                { id : thunder_id, is_stream : false },
                { id : rain_id, is_stream : false },
                { id : music_id, is_stream : false }
            ]
        });

            //and a simpe progress bar
        new ParcelProgress({
            parcel      : parcel,
            background  : new Color(1,1,1,0.85),
            oncomplete  : assets_loaded
        });

            //go!
        parcel.load();

    } //ready

    function assets_loaded(_) {

        thunder = Luxe.resources.audio(thunder_id);
        music = Luxe.resources.audio(music_id);
        rain = Luxe.resources.audio(rain_id);

        create_apartment();
        create_overlay();
        create_text();
        connect_events();

        //once all created, start the chain

        start();

    } //assets_loaded

    function start() {

            //now we tween over time, to fade in the color alpha
            //notice the times are all in seconds, always

            //for the apartment, it fades to full alpha
        apartment.color.tween(1, { a:1 });
            //for the overlay, partially full
        overlay.color.tween(2, { a:0.95 }).delay(0.5);
            //now, a little after that, start the text!
        Luxe.timer.schedule(2.8, show_message);

        rain_handle = Luxe.audio.loop(rain.source);

    } //start

    function reset() {

            //flush the existing stuff
        Luxe.scene.empty();
            //kill the audio
        Luxe.audio.stop(music_handle);
        Luxe.audio.stop(thunder_handle);
        Luxe.audio.stop(rain_handle);
            //reset the timers
        Luxe.timer.reset();
            //start over
        assets_loaded(null);

    } //reset

    function create_overlay() {

            //create a large screen sized rectangle,
            //and set its depth to 2, so its above the apartment

            //notice the alpha is set to 0, we want to fade it in
            //later on as well
        overlay = new Sprite({
            name : 'overlay',
            centered : false,
            size : Luxe.screen.size,
            color : new Color(1,1,1,0),
            depth : 1
        });

    } //create_overlay

    function create_text() {

            //since the parcel has created the font, its in the resource manager
        montez_font = Luxe.resources.font('assets/montez/montez.fnt');

            //scale to fit the screen nicely, but max at the font default size of 48,
            //and the 12 is a ratio I made up based on the default window size
        var text_size = Math.min( Math.round(Luxe.screen.h/12), 48);

            //again, depth 3 > 2, so its above everything
        text = new Text({
            pos : Luxe.screen.mid,
            point_size : text_size,
            depth : 3,
            align : TextAlign.center,
            font : montez_font,
            text : 'no message yet',
            color : new Color(0,0,0,0).rgb(0x242424)
        });

        messages = [];
        messages.push({ msg:'An unfortunate story...', time:4 });
        messages.push({ msg:'a person seeking answers', time:3, event:'thunder' });
        messages.push({ msg:'searching the edges of time', time:5.5, event:'darkness' });
        messages.push({ msg:'but finding only darkness.', time:6, event:'music' });
        messages.push({ msg:'as the tale is written...', time:3 });
        messages.push({ msg:'it all started with a backpack', time:5, event:'finish' });

    } //create_text

    function create_apartment() {

            //fetch the previously loaded texture
        var image = Luxe.resources.texture('assets/apartment.png');

            //this makes sure the pixels stay crisp when scaling, like in guide 3
        image.filter_min = image.filter_mag = FilterType.nearest;

            //this calculates how wide the image should be on screen,
            //if we make the image as high as the view itself

        var height = Luxe.screen.h;
        var width = (height/image.height) * image.width;

            //we also set the alpha to zero, so it can be faded in
        apartment = new Sprite({
            name: 'apartment',
            texture: image,
            size: new Vector( width, height ),
            centered: false,
            color : new Color(1,1,1,0)
        });

    } //create_apartment


    function show_message() {

        if(messages.length == 0) {
            return;
        }

            //take the first message off the list
        var message = messages[0];
            //update the text itself
        text.text = message.msg;
            //schedule the timer for on complete,
            //we use the + here because the fade in time is added
            //so that the text has its whole time shown
        Luxe.timer.schedule( message.time + 0.45, message_done);

        text.color.tween(0.45, { a:1 });

    } //show_message

    function message_done() {

            //make sure we remove the message we used
        var message = messages.shift();

            //hide the text, and when done,
        text.color.tween(0.55, { a:0 }).onComplete(function(){

                //if it has an event, fire it
            if(message.event != null) {
                Luxe.events.fire('intro.' + message.event);
            }

                //continue the queue (if any)
            show_message();

        }); //tween

    } //message_done

    function connect_events() {

        Luxe.events.listen('intro.darkness', ondarkness);
        Luxe.events.listen('intro.thunder', onthunder);
        Luxe.events.listen('intro.music', onmusic);
        Luxe.events.listen('intro.finish', onfinish);

    } //connect_events

    function onthunder(_) {

        thunder_handle = Luxe.audio.play(thunder.source);

    } //onthunder

    function onmusic(_) {

        music_handle = Luxe.audio.play(music.source);
        Luxe.audio.volume(music_handle, 0.1);

    } //onmusic

    function ondarkness(_) {

            //dramatic effect
        overlay.color.tween(0.3, { r:0.05, g:0.05, b:0.05 });
        text.color = new Color().rgb(0xefefef);

    } //ondarkness

    function onfinish(_) {

        overlay.color.tween( 4, { a:0 });

    } //onfinish

    override function onkeyup( e:KeyEvent ) {

        if(e.keycode == Key.key_r) {
            reset();
        }

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
