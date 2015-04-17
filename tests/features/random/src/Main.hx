
import luxe.Input;
import luxe.Log.*;


class Main extends luxe.Game {

    override function ready() {

        trace('press G for "get"');
        trace('press F for "float(0,1)"');
        trace('press I for "int(0,1)"');

        Luxe.showConsole(true);

    } //ready

    function test_int(count:Int) {

        var min = 0;
        var max = 0;

        for(i in 0 ... count) {
            var rand = Luxe.utils.random.int(0, 10);
            min = Std.int(Math.min(min, rand));
            max = Std.int(Math.max(max, rand));
        }

        trace( 'count:$count, min:$min, max: $max' );

        assert(max <= 10);
        assert(min >= 0);


    } //test_int

    function test_float(count:Int) {

        var min : Float= 0;
        var max : Float= 0;

        for(i in 0 ... count) {
            var rand = Luxe.utils.random.float(0, 10);
            min = Math.min(min, rand);
            max = Math.max(max, rand);
        }

        trace( 'count:$count, min:$min, max: $max' );

        assert(max <= 10);
        assert(min >= 0);

    } //test_float

    function test_get(count:Int) {

        var min : Float = 0;
        var max : Float = 0;

        for ( i in 0...count ){
            var rand = Luxe.utils.random.get();
            min = Math.min(min, rand);
            max = Math.max(max, rand);
        }

        trace( 'count:$count, min:$min, max: $max' );

        assert(max <= 1);
        assert(min >= 0);

    } //test_get

    override function onkeyup( e:KeyEvent ) {

        var count = 1000000;

        if(e.keycode == Key.key_i) test_int(count);
        if(e.keycode == Key.key_f) test_float(count);
        if(e.keycode == Key.key_g) test_get(count);

        if(e.keycode == Key.escape) {
            Luxe.shutdown();
        }

    } //onkeyup

    override function update(dt:Float) {

    } //update


} //Main
