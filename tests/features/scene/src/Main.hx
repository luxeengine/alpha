
import luxe.Component;
import luxe.Input;
import luxe.Scene;
import luxe.Vector;
import luxe.Sprite;
import luxe.Color;
import luxe.tween.Actuate;
import luxe.Log.log;


/**

Goals :
    1. Test the concept of multiple scenes
    2. Test the propagation of events through all scenes, entities, and components on those entities
*/


class Main extends luxe.Game {

    var hud : Scene;
    var bg : Sprite;

    override function ready() {

        on('keyup', keyup);

        create_hud();

        bg = new Sprite({
            name : 'bg',
            size : new Vector(256,256),
            pos : Luxe.screen.mid,
            color : new Color(1,1,1,0.1),
            texture : Luxe.loadTexture('assets/circle.png')
        });

        log(Luxe.scene);

    } //ready

    override function update(dt:Float) {

        bg.rotation_z += 16 * dt;

    } //update

    function create_hud() {

        if(hud != null) {
            return;
        }

        hud = new Scene('hud scene');

        var ui = new Sprite({
            name : 'ui',
            texture : Luxe.loadTexture('assets/circle.png'),
            pos : new Vector(0, Luxe.screen.h),
            scene : hud
        });

        ui.add(new RandomSlide('slide'));

        log(hud);

    } //create_hude

    function keyup( e:KeyEvent ) {

        if(e.keycode == Key.escape) {
            Luxe.shutdown();
        }

        if(e.keycode == Key.key_r) {
            if(hud != null) {
                log('resetting hud');
                hud.reset();
            }
        }

        if(e.keycode == Key.key_d) {
            if(hud != null) {
                log('destroying hud');
                hud.destroy();
                hud = null;
            }
        }
        if(e.keycode == Key.key_c) {
            if(hud == null) {
                log('creating hud');
                create_hud();
            }
        }

    } //keyup

} //Main

class RandomSlide extends Component {

    var time : Float = 0;
    var next : Float = 0;

    var start : Vector;

    override function init() {

        start = pos.clone();

        entity.on('reset', reset);
        entity.on('destroy', destroy);

        on('removed', removed);

        log('init');

    } //init

    function mousedown( e:MouseEvent ) {

        Actuate.tween(pos, 0.1, { x: e.pos.x });

    } //mousedown

    function reset(_) {

        pos = start.clone();

        log('reset');

    } //reset

    function destroy(_) {

        trace('destroy');

    } //destroy

    override function update(dt:Float) {

        time += dt;

        if(time > next) {
            Actuate.tween(pos, 0.5, { x: start.x + ((Math.random() * Luxe.screen.w)) });
            next = time + (1 + Std.random(3));
        }

    } //update

}