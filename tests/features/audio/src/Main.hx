
import luxe.Input;

class Main extends luxe.Game {


    var pan : Float = 1;


    override function ready() {

        Luxe.audio.create('assets/sound.ogg', 'sound');
        Luxe.audio.create('assets/ambience.ogg', 'music');

        Luxe.audio.on('music', 'load', function(s:snow.audio.Sound) {
            Luxe.audio.loop('music');
        });

        on('mouseup', mouseup);
        on('keyup', keyup);

        // //pan from left to right and back
        // luxe.tween.Actuate.tween(this, 20, { pan:-1 })
        //     .repeat()
        //     .reflect()
        //     .onUpdate(function(){
        //         Luxe.audio.pan('music', pan);
        //     });

    } //ready

    function mouseup( e:MouseEvent ) {
        if(e.button == MouseButton.left) {
            Luxe.audio.play('sound');
        }
    }

    function keyup( e:KeyEvent ) {

        if(e.keycode == Key.key_r) {
            Luxe.audio.position('music', 0);
        }

        if(e.keycode == Key.key_l) {
            Luxe.audio.play('sound');
        }

        if(e.keycode == Key.key_s) {
            Luxe.audio.stop('music');
        }
        if(e.keycode == Key.key_p) {
            Luxe.audio.toggle('music');
        }

        if(e.keycode == Key.escape) {
            Luxe.shutdown();
        }

    } //onkeyup


} //Main
