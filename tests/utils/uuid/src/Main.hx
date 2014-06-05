
import luxe.Input;

class Main extends luxe.Game {


    public function ready() {
        
        var _time : Float = Luxe.time;
        
        for(i in 0 ... 10000) {
            var _s = haxe.crypto.Sha1.encode(Std.string(Luxe.time*Math.random()));
            // Sys.println(_s);
        }

        trace('Sha1 ' + (Luxe.time - _time));

        _time = Luxe.time;

        for(i in 0 ... 10000) {
            var _s = Luxe.utils.uniqueid();
            // Sys.println(_s);
        }
        
        trace('UUID ' + (Luxe.time - _time)); 

        _time = Luxe.time;

        for(i in 0 ... 10000) {
            var _s = haxe.crypto.Md5.encode(Std.string(Luxe.time*Math.random()));
            // Sys.println(_s);
        }
        
        trace('md5 ' + (Luxe.time - _time));

    } //ready

    public function onkeyup( e:KeyEvent ) {

        if(e.key == KeyValue.escape) {
            Luxe.shutdown();
        }
        
    } //onkeyup

    public function update(dt:Float) {

    } //update


} //Main
