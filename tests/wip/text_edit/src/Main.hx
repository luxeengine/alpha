
import luxe.Input;
import luxe.Text;

class Main extends luxe.Game {

    var edit:Text;

    override function ready() {

        edit = new Text({
            text: 'enter something ...',
            pos : Luxe.screen.mid,
            point_size : 18,
            align: center,
            align_vertical:center
        });

        var c = edit.add( new TextEdit() );

    } //ready

    override function onkeyup( e:KeyEvent ) {

        if(e.keycode == Key.escape) {
            Luxe.shutdown();
        }

    } //onkeyup

} //Main


