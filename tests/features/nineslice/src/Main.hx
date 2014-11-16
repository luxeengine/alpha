
import luxe.Color;
import luxe.NineSlice;
import luxe.Vector;
import luxe.Input;

import luxe.tween.Actuate;

class Main extends luxe.Game {


    var geom : NineSlice;

    var sx : Int = 500;
    var sy : Int = 260;


    override function ready() {

        Luxe.renderer.clear_color = new Color().rgb(0xefefef);

        geom = new NineSlice({
            texture : Luxe.loadTexture('tiny.ui.png'),
            top : 32, left : 32, right : 32, bottom : 32,
            color : new Color(1,1,1,0.4)
        });

        geom.create( new Vector(100, 200), 500, 260 );

    } //ready

    override function onmousemove( e:MouseEvent ) {

        var m = new Vector(e.x,e.y);
        geom.pos = m;

    } //onmousemove

    function sizechange() {

        geom.size = new Vector(sx,sy);

    } //sizechange

    override function onkeyup( e:KeyEvent ) {

        if(e.keycode == Key.space) {
            var nsx : Int = Math.round( 100+(Math.random()*600) );
            var nsy : Int = Math.round( 100+(Math.random()*600) );
            Actuate.tween( this , 0.2 , { sx:nsx, sy:nsy } , true ).onUpdate(sizechange);

            var new_a = luxe.utils.Maths.clamp(0.1 + Math.random(), 0, 1);
            Actuate.tween( geom.color, 0.2 , { a:new_a }, true );
        }

        if(e.keycode == Key.escape) {
            Luxe.shutdown();
        }

    } //onkeyup

} //Main
