
import luxe.Input;

class Main extends luxe.Game {


    var pan : Float = 1;


    public function ready() {

        Luxe.audio.create('sound', 'assets/sound.ogg');
        Luxe.audio.create('music', 'assets/ambience.ogg');

        Luxe.audio.loop('music');

        // //pan from left to right and back
        // luxe.tween.Actuate.tween(this, 20, { pan:-1 })
        //     .repeat()
        //     .reflect()
        //     .onUpdate(function(){
        //         Luxe.audio.pan('music', pan);
        //     });
        
    } //ready

    public function onmouseup( e:MouseEvent ) {
        if(e.button == MouseButton.left) {
            Luxe.audio.play('sound', 3);
        } else {
            Luxe.audio.play('sound');
        }        
    }

    public function onkeyup( e:KeyEvent ) {

        if(e.key == KeyValue.key_R) {
            Luxe.audio.position('music', 0);
        }

        if(e.key == KeyValue.key_L) {
            Luxe.audio.play('sound', 2);
        }

        if(e.key == KeyValue.key_S) {
            Luxe.audio.stop('music');
        }
        if(e.key == KeyValue.key_P) {
            Luxe.audio.play('music');
        }

        if(e.key == KeyValue.escape) {
            Luxe.shutdown();
        }
        
    } //onkeyup

    public function update(dt:Float) {        

    } //update


} //Main
