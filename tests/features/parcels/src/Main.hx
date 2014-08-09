
import luxe.Input;
import luxe.Visual;
import luxe.Sprite;
import luxe.Color;
import luxe.Vector;

import luxe.Parcel;
import luxe.ParcelProgress;

class Main extends luxe.Game {


    override function ready() {

        Luxe.renderer.clear_color = new Color().rgb(0xf0f0f0);

        var json_string : String = '
            {
                "textures" : [
                    { "id" : "assets/texture1.png" },
                    { "id" : "assets/texture2.png" },
                    { "id" : "assets/texture3.png" },
                    { "id" : "assets/texture4.png" },
                    { "id" : "assets/texture5.png" }
                ],
                "shaders" : [
                    { "ps_id":"assets/shader1.glsl" },
                    { "ps_id":"assets/shader2.glsl" },
                    { "ps_id":"assets/shader3.glsl" }
                ],
                "fonts" : [
                    { "id" : "font1.fnt", "path" : "assets/fonts/" },
                    { "id" : "font2.fnt", "path" : "assets/fonts/" },
                    { "id" : "font3.fnt", "path" : "assets/fonts/" },
                    { "id" : "font4.fnt", "path" : "assets/fonts/" },
                    { "id" : "font5.fnt", "path" : "assets/fonts/" },
                ],
                "sounds" : [
                    { "id" : "assets/sound1.ogg", "name" : "sound1", "is_stream" : false },
                    { "id" : "assets/sound2.ogg", "name" : "sound2", "is_stream" : false },
                    { "id" : "assets/sound3.ogg", "name" : "sound3", "is_stream" : false },
                    { "id" : "assets/sound4.ogg", "name" : "sound4", "is_stream" : false },
                    { "id" : "assets/sound5.ogg", "name" : "sound5", "is_stream" : false }
                ],
                "text" : [
                    { "id" : "assets/text1.txt" },
                    { "id" : "assets/text2.txt" },
                    { "id" : "assets/text3.txt" },
                    { "id" : "assets/text4.txt" },
                    { "id" : "assets/text5.txt" }
                ],
                "data" : [
                    { "id" : "assets/bytes1" },
                    { "id" : "assets/bytes2" },
                    { "id" : "assets/bytes3" },
                    { "id" : "assets/bytes4" },
                    { "id" : "assets/bytes5" }
                ]
            }
        ';

        var parcel1 = new Parcel();

            parcel1.from_json( luxe.utils.JSON.parse(json_string) );

        // parcel1.load();

            //show an animation to test background thread
        sprites = [];

        var barw : Float = Luxe.screen.w/60;
        var space : Float = barw * 0.2;
        barw -= space;

        for(i in 0 ... 60) {
            var s = new Sprite({
                centered:false,
                pos : new Vector( (barw+space)*i, 0 ),
                size : new Vector( barw, Luxe.screen.h ),
                color : new Color().rgb(0x121212)
            });

            sprites.push( s );
            luxe.tween.Actuate.tween(s.scale, 0.4, {y:0} ).repeat().reflect().delay(Math.random());
        }

        var progress = new ParcelProgress({
            parcel      : parcel1,
            background  : new Color(1,1,1,0.85),
            oncomplete  : onloaded
        });

        parcel1.load();

    } //ready

    var sprites : Array<Sprite>;

    var s : Float = 0;

    function onloaded( p:Parcel ) {
        trace("All complete :  Total time took " + p.time_to_load);
    } //onloaded

    override function onkeyup( e:KeyEvent ) {

        if(e.keycode == Key.escape) {
            Luxe.shutdown();
        }

    } //onkeyup


} //Main
