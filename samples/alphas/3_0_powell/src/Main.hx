
import luxe.Color;
import luxe.Input;
import luxe.Parcel.ParcelState;
import luxe.Sprite;
import luxe.Text;
import luxe.Vector;

    //custom loading screen
    //some audio examples

class Main extends luxe.Game {

    override function config(config:luxe.AppConfig) {

            //The splash screen assets can be loaded up front
            //using the preload parcel. It can't show anything during
            //the preload phase so keep them simpler
        config.preload.textures = [{ id:'assets/load.png' }];

            //you can ignore this line
        #if luxe_doc_sample config.window.width = 640; config.window.height = 427; #end
        
        return config;

    } //config

    var parcel: luxe.Parcel;
    var info: luxe.Text;

    override function ready() {

        Luxe.renderer.clear_color.rgb(0xfafafa);

            //We add a 1 second delay so we can see things,
            //both before, and per item. Since we have 4 items,
            // we will have at least 4.5 seconds to look at the loading bar
        parcel = new luxe.Parcel({
            load_time_spacing: 1,
            load_start_delay: 0.5,
            textures : [
                { id:'assets/menu/m_1.png' },
                { id:'assets/menu/m_2.png' },
                { id:'assets/level_1/1_1.png' },
                { id:'assets/level_1/1_2.png' }
            ]
        });

        new Splash(parcel, onloaded);

    } //ready


    function reload() {

        info.destroy();

        parcel.unload();
        parcel.load();

    } //reload

    function onloaded() {

        info = new Text({
            pos: Luxe.screen.mid,
            color: new Color(0,0,0,0.6),
            text: 'Press R to reload the parcel',
            align: center, 
            point_size: 20
        });

    } //onloaded

    override function onkeyup( e:KeyEvent ) {

        if(e.keycode == Key.key_r) {
            if(parcel.state == ParcelState.loaded) {
                reload();
            }
        }

        if(e.keycode == Key.escape) {
            Luxe.shutdown();
        }

    } //onkeyup

} //Main
