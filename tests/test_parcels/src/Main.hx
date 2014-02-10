
import luxe.Input;
import luxe.Visual;
import luxe.Sprite;
import luxe.Color;
import luxe.Vector;


import luxe.Parcel;
import luxe.ParcelProgress;

class Main extends luxe.Game {

    public function ready() {

        Luxe.renderer.clear_color = new Color().rgb(0xf0f0f0);

        var parcel1 = new Parcel();
            
            parcel1.add_texture('assets/texture1.png');
            parcel1.add_texture('assets/texture2.png');
            parcel1.add_texture('assets/texture3.png');
            parcel1.add_texture('assets/texture4.png');
            parcel1.add_texture('assets/texture5.png');

            parcel1.add_text('assets/text1.txt');
            parcel1.add_text('assets/text2.txt');
            parcel1.add_text('assets/text3.txt');
            parcel1.add_text('assets/text4.txt');
            parcel1.add_text('assets/text5.txt');

            parcel1.add_data('assets/bytes1');
            parcel1.add_data('assets/bytes2');
            parcel1.add_data('assets/bytes3');
            parcel1.add_data('assets/bytes4');
            parcel1.add_data('assets/bytes5');

            parcel1.add_font('font1.fnt', 'assets/fonts/');
            parcel1.add_font('font2.fnt', 'assets/fonts/');
            parcel1.add_font('font3.fnt', 'assets/fonts/');
            parcel1.add_font('font4.fnt', 'assets/fonts/');
            parcel1.add_font('font5.fnt', 'assets/fonts/');

            parcel1.add_sound( 'assets/sound1.ogg', 'sound1', false );
            parcel1.add_sound( 'assets/sound2.ogg', 'sound2', false );
            parcel1.add_sound( 'assets/sound3.ogg', 'sound3', false );
            parcel1.add_sound( 'assets/sound4.ogg', 'sound4', false );
            parcel1.add_sound( 'assets/sound5.ogg', 'sound5', false );

        var progress = new ParcelProgress({
            parcel      : parcel1, 
            oncomplete  : onloaded
        });

        parcel1.load();

        //Luxe.showConsole(true);

    } //ready
    
    var s : Float = 0;

    function onloaded( p:Parcel ) { 
        trace("All complete :  Total time took " + p.time_to_load);
    }

    public function onkeyup( e:KeyEvent ) {

        if(e.key == KeyValue.escape) {
            Luxe.shutdown();
        }

    } //onkeyup

    public function update(dt:Float) {

    } //update

} //Main
