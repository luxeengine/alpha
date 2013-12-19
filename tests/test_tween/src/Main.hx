
import luxe.Input;
import luxe.Vector;
import luxe.Sprite;
import luxe.Color;
import luxe.tween.Actuate;

class Main extends luxe.Game {

    public function ready() {

    	var size = Luxe.screen.h*0.1;
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


    } //ready

    public function onkeyup( e:KeyEvent ) {

        if(e.key == KeyValue.escape) {
            Luxe.shutdown();
        }
        
    } //onkeyup

    public function update(dt:Float) {

    } //update

} //Main