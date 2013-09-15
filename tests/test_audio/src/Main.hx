
import luxe.Input;

class Main extends luxe.Game {

    public function ready() {

        Luxe.audio.create('vent', 'assets/vent.wav');
        Luxe.audio.create('music', 'assets/music.ogg');

        Luxe.audio.play('music');
        
    } //ready

    public function onkeyup( e:KeyEvent ) {

        if(e.key == KeyValue.key_S) {
            Luxe.audio.play('vent');
        }


        if(e.key == KeyValue.escape) {
            Luxe.shutdown();
        }
        
    } //onkeyup

    public function update(dt:Float) {

    } //update

} //Main