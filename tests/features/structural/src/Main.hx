
import luxe.Input;
import luxe.structural.Pool;

class Main extends luxe.Game {

    override function config(config:luxe.AppConfig) {

        return config;

    } //config

    var pool: Pool<luxe.Sprite>;
    var unlimited_pool: Pool<luxe.Sprite>;

    override function ready() {

        pool = new Pool<luxe.Sprite>(5, 5, function() {
            return new luxe.Sprite({
                pos: Luxe.screen.mid,
                size: new luxe.Vector(32,32),
                color: luxe.Color.random()
            });
        });
        
        unlimited_pool = new Pool<luxe.Sprite>(2, function() {
            return new luxe.Sprite({
                pos: Luxe.screen.mid,
                size: new luxe.Vector(16,16),
                color: luxe.Color.random()
            });
        });

    } //ready

    override function onmouseup( e:MouseEvent ) {

        //on left click, spawn from the limited pool
        if(e.button == MouseButton.left) {
            var spawn = pool.get();
            if(spawn != null) {
                spawn.pos.copy_from(e.pos);
                spawn.color.a = 1;
                spawn.color.tween(0.5+Math.random()*3, {a:0})
                    .onComplete(function(){
                        pool.put(spawn);
                        trace('> LIMITED return > at ${pool.items.length} items');
                    });
            }
    
            trace('> LIMITED get > at ${pool.items.length} items');

        } else {

            var spawn = unlimited_pool.get();
            if(spawn != null) {
                spawn.pos.copy_from(e.pos);
                spawn.color.a = 1;
                spawn.color.tween(0.3+Math.random()*3, {a:0})
                    .onComplete(function(){
                        unlimited_pool.put(spawn);
                        trace('> UNLIMITED return > at ${unlimited_pool.items.length} items');
                    });
            }
    
            trace('> UNLIMITED get > at ${unlimited_pool.items.length} items');
        }

    } //onkeyup

    override function onkeyup( e:KeyEvent ) {

        if(e.keycode == Key.escape) {
            Luxe.shutdown();
        }

    } //onkeyup

} //Main
