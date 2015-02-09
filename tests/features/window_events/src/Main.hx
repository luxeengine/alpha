
import luxe.Input;
import luxe.Screen;

class Main extends luxe.Game {

    override function ready() {

    } //ready

    override function onkeyup( e:KeyEvent ) {

        if(e.keycode == Key.escape) {
            Luxe.shutdown();
        }

    } //onkeyup

    override function onwindowmoved( e:WindowEvent ) {
        trace('window moved : ${e.event.x} / ${e.event.y}');
    }
    override function onwindowresized( e:WindowEvent ) {
        trace('window resized : ${e.event.x} / ${e.event.y}');
    }
    override function onwindowsized( e:WindowEvent ) {
        trace('window sized : ${e.event.x} / ${e.event.y}');
    }
    override function onwindowminimized( e:WindowEvent ) {
        trace('window minimized');
    }
    override function onwindowrestored( e:WindowEvent ) {
        trace('window restored');
    }

} //Main
