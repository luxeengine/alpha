
import luxe.Input;

class Main extends luxe.Game {

    public function ready() {

        Luxe.audio.create('sound', 'assets/sound.ogg');
        Luxe.audio.create('music', 'assets/ambience.ogg');

        Luxe.audio.play('music');

        
    } //ready

    public function onmouseup( e:MouseEvent ) {
        Luxe.audio.play('sound');
    }

    public function onkeyup( e:KeyEvent ) {

        if(e.key == KeyValue.key_R) {
            //
        }

        if(e.key == KeyValue.escape) {
            Luxe.shutdown();
        }
        
    } //onkeyup

    public function update(dt:Float) {

    } //update

} //Main