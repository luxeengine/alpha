
import luxe.Input;
import luxe.Vector;
import luxe.Text;

import luxe.collision.shapes.*;
import luxe.collision.ShapeDrawerLuxe;

class Main extends luxe.Game {

        //shared conveniences for the states
    public static var drawer: ShapeDrawerLuxe;
    public static var shapes: Array<Shape>;
    public static var rays: Array<Ray>;
    static var disp : Text;

        //main specifics
    var desc : Text;
    var state : luxe.States;
    var current : Int = 0;
    var count : Int = 0;

    override function config(config:luxe.AppConfig) {

            //if you have errors about the window being created,
            //lower this to 2, or 0. it can also be 8
        config.render.antialiasing = 4;

        return config;

    } //config

    override function ready() {

            //Set the line widths to the group number,
            //so that the test cases can opt into sizes

        Luxe.renderer.batcher.add_group(2,
            function(_) Luxe.renderer.state.lineWidth(2),
            function(_) Luxe.renderer.state.lineWidth(1)
        );
        Luxe.renderer.batcher.add_group(3,
            function(_) Luxe.renderer.state.lineWidth(3),
            function(_) Luxe.renderer.state.lineWidth(1)
        );
        Luxe.renderer.batcher.add_group(4,
            function(_) Luxe.renderer.state.lineWidth(4),
            function(_) Luxe.renderer.state.lineWidth(1)
        );

        drawer = new ShapeDrawerLuxe();
        shapes = [];
        rays = [];

        desc = new Text({
            pos: new Vector(10,10),
            point_size: 18,
            text: 'differ usage examples, press 9 or 0 to cycle'
        });

        disp = new Text({
            pos: new Vector(10, 30),
            point_size: 15,
            text: 'usage text goes here'
        });

        state = new luxe.States({ name:'machine' });

        state.add( new states.RayAndShape({ name:'state0' }) );
        state.add( new states.Circles({ name:'state1' }) );
        state.add( new states.Polygons({ name:'state2' }) );

        count = Lambda.count( state._states );
        state.set( 'state0' );

    } //ready

    public static function display(text:String) {
        disp.text = text;
    }

    function change(to:String) {
        shapes = [];
        rays = [];
        disp.text = '';
        state.set(to);
    }

    override function onkeyup( e:KeyEvent ) {

        if(e.keycode == Key.key_9) {
            current--;
            if(current < 0) current = count-1;
            change('state$current');
        }

        if(e.keycode == Key.key_0) {
            current++;
            if(current >= count) current = 0;
            change('state$current');
        }

        if(e.keycode == Key.escape) {
            Luxe.shutdown();
        }

    } //onkeyup

    override function onrender() {
        for(shape in shapes) drawer.drawShape(shape);
        for(ray in rays) drawer.drawLine(ray.start, ray.end);
    }

} //Main
