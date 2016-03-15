
import luxe.Input;
import luxe.Vector;
import luxe.Sprite;
import luxe.Color;
import luxe.tween.Actuate;

class Main extends luxe.Game {


    override function ready() {

        var size = Luxe.screen.h*0.05;
        var midx = Luxe.screen.w/2;
        var gap = Luxe.screen.w * 0.2;

        var s1 = new Sprite({
            size : new Vector(size,size),
            pos : new Vector(gap, size * 2)
        });

        var s2 = new Sprite({
            size : new Vector(size,size),
            pos : new Vector(gap, size * 4)
        });

        var s3 = new Sprite({
            size : new Vector(size,size),
            pos : new Vector(gap, size * 6)
        });

        var s4 = new Sprite({
            size : new Vector(size,size),
            pos : new Vector(gap, size * 8)
        });

        Actuate.tween(s1.pos, 1+Math.random(), {x:Luxe.screen.w-gap} )
            .delay(Math.random())
            .repeat()
            .reflect()
            .onRepeat(function(){ s1.color = Color.random(); })
            .ease(luxe.tween.easing.Cubic.easeInOut);
        Actuate.tween(s2.pos, 1+Math.random(), {x:Luxe.screen.w-gap} )
            .delay(Math.random())
            .repeat()
            .reflect()
            .onRepeat(function(){ s2.color = Color.random(); })
            .ease(luxe.tween.easing.Elastic.easeIn);
        Actuate.tween(s3.pos, 1+Math.random(), {x:Luxe.screen.w-gap} )
            .delay(Math.random())
            .repeat()
            .reflect()
            .onRepeat(function(){ s3.color = Color.random(); })
            .ease(luxe.tween.easing.Quad.easeInOut);
        Actuate.tween(s4.pos, 1+Math.random(), {x:Luxe.screen.w-gap} )
            .delay(Math.random())
            .repeat()
            .reflect()
            .onRepeat(function(){ s4.color = Color.random(); })
            .ease(luxe.tween.easing.Bounce.easeOut);


        var p1 = new Sprite({
            size : new Vector(size,size),
            pos : new Vector(gap, Luxe.screen.h-size),
            color: Color.random(),
        });

        var c1 = new Sprite({
            parent: p1,
            color: Color.random(),
            size : new Vector(size,size),
            pos : new Vector(size/4, size/4)
        });

        var c2 = new Sprite({
            parent: c1,
            color: Color.random(),
            size : new Vector(size,size),
            pos : new Vector(size/4, size/4)
        });

        Actuate.tween(p1.pos, 2, {x:Luxe.screen.w-gap} )
            .delay(Math.random())
            .repeat()
            .reflect()
            .onRepeat(function(){ p1.color = Color.random();c1.color = Color.random();c2.color = Color.random(); })
            .ease(luxe.tween.easing.Cubic.easeInOut);


    } //ready

    override function onkeyup( e:KeyEvent ) {

        if(e.keycode == Key.escape) {
            Luxe.shutdown();
        }

    } //onkeyup


} //Main
