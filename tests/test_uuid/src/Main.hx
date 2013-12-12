
import luxe.Input;

class Main extends luxe.Game {

    public function ready() {
        
        var _time : Float = haxe.Timer.stamp();
        
        for(i in 0 ... 10000) {
            var _s = haxe.crypto.Sha1.encode(Std.string(haxe.Timer.stamp()*Math.random()));
            // Sys.println(_s);
        }

        trace('Sha1 ' + (haxe.Timer.stamp() - _time));

        _time = haxe.Timer.stamp();

        for(i in 0 ... 10000) {
            var _s = Luxe.utils.uniqueid();
            // Sys.println(_s);
        }
        
        trace('UUID ' + (haxe.Timer.stamp() - _time)); 

        _time = haxe.Timer.stamp();

        for(i in 0 ... 10000) {
            var _s = haxe.crypto.Md5.encode(Std.string(haxe.Timer.stamp()*Math.random()));
            // Sys.println(_s);
        }
        
        trace('md5 ' + (haxe.Timer.stamp() - _time));

    } //ready

    public function onkeyup( e:KeyEvent ) {

        if(e.key == KeyValue.escape) {
            Luxe.shutdown();
        }
        
    } //onkeyup

    public function update(dt:Float) {

    } //update

} //Main