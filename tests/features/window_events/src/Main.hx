
import luxe.Input;
import luxe.Screen;
import luxe.Vector;

class Main extends luxe.Game {

    var start : Vector;

    var truefs = false;
    var fs = false;
    var grab = false;


    override function ready() {

        Luxe.renderer.clear_color.rgb(0x3e8fb1);
        start = Luxe.screen.size;

    } //ready

    override function onkeyup( e:KeyEvent ) {

        if( e.keycode == Key.enter && e.mod.alt ) {
            fs = !fs;
            Luxe.snow.runtime.window_fullscreen(fs);
        }

        if( e.keycode == Key.enter && e.mod.ctrl) {
            truefs = !truefs;
            Luxe.snow.runtime.window_fullscreen(truefs, true);
        }

        if( e.keycode == Key.enter && e.mod.shift) {
            grab = !grab;
            Luxe.snow.runtime.window_grab(grab);
        }

        if(e.keycode == Key.escape) {
            Luxe.shutdown();
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
        trace('window moved : ${e.x} / ${e.y}');
    }
    override function onwindowresized( e:WindowEvent ) {
        trace('window resized : ${e.x} / ${e.y}');
    }
    override function onwindowsized( e:WindowEvent ) {
        trace('window sized : ${e.x} / ${e.y}');
        Luxe.camera.viewport = new luxe.Rectangle(0, 0, e.x, e.y);
    }
    override function onwindowminimized( e:WindowEvent ) {
        trace('window minimized');
    }
    override function onwindowrestored( e:WindowEvent ) {
        trace('window restored');
    }

} //Main
