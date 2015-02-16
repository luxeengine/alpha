
import luxe.Input;
import luxe.Screen;
import luxe.Vector;

class Main extends luxe.Game {

    var start : Vector;

    override function ready() {

        Luxe.renderer.clear_color.rgb(0x3e8fb1);
        start = Luxe.screen.size;

    } //ready

    override function onkeyup( e:KeyEvent ) {

        if(e.keycode == Key.escape) {
            Luxe.shutdown();
        }

        if(e.keycode == Key.key_r) {
            Luxe.core.app.window.set_size(
                    Luxe.utils.random.int(start.x - 50, start.x + 100 ),
                    Luxe.utils.random.int(start.y - 50, start.y + 100 )
            );
        }

    } //onkeyup

    override function onrender() {
        Luxe.draw.rectangle({
            x:20, y:20,
            w:Luxe.screen.w - 40,
            h:Luxe.screen.h - 40,
            immediate:true
        });
    }

    override function onwindowmoved( e:WindowEvent ) {
        trace('window moved : ${e.event.x} / ${e.event.y}');
    }
    override function onwindowresized( e:WindowEvent ) {
        trace('window resized : ${e.event.x} / ${e.event.y}');
    }
    override function onwindowsized( e:WindowEvent ) {
        trace('window sized : ${e.event.x} / ${e.event.y}');
        Luxe.camera.viewport = new luxe.Rectangle(0, 0, e.event.x, e.event.y);
    }
    override function onwindowminimized( e:WindowEvent ) {
        trace('window minimized');
    }
    override function onwindowrestored( e:WindowEvent ) {
        trace('window restored');
    }

} //Main
