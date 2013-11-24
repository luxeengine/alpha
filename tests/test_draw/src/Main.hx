
import lime.utils.ByteArray;
import lime.utils.Float32Array;
import luxe.Vector;
import luxe.Color;
import luxe.Input;
import phoenix.geometry.CompositeGeometry;
import phoenix.geometry.LineGeometry;
import phoenix.geometry.QuadGeometry;
import phoenix.geometry.RectangleGeometry;


class Main extends luxe.Game {

    public var mouse : Vector;

    public var line : LineGeometry; 
    public var rect : RectangleGeometry; 
    public var rect2 : QuadGeometry; 

    public function ready() {

        mouse = new Vector();

        line = Luxe.draw.line({
            p0 : new Vector( 0, Luxe.screen.h/2 ),
            p1 : new Vector( Luxe.screen.w, Luxe.screen.h/2 ),
            color : new Color(0.5,0.2,0.2,1)
        });

        rect = Luxe.draw.rectangle({
            x : 10, y : 10,
            w : Luxe.screen.w - 20, 
            h : Luxe.screen.h - 20,
            color : new Color(0.4,0.4,0.4)
        });

        rect2 = Luxe.draw.box({
            x : 40, y : 40,
            w : Luxe.screen.w - 80, 
            h : Luxe.screen.h - 80,
            color : new Color(0.5,0.2,0.2,0.5)
        });

        // rect2.locked = true;     

        var c = Luxe.draw.circle({
            x : Luxe.screen.w/2,
            y : Luxe.screen.h/2,
            r : 50,
            color : new Color(0.8,0.3,0.2,1)
        });

        c.locked = true;

        c = Luxe.draw.ring({
            x : Luxe.screen.w/2,
            y : Luxe.screen.h/2,
            r : 60,
            color : new Color(1,1,1,1)
        });

        c = Luxe.draw.ring({
            x : Luxe.screen.w/2,
            y : Luxe.screen.h/2,
            r : 70,
            color : new Color(1,1,1,1)
        });

        var n : CompositeGeometry = Luxe.draw.text({
            color : new Color(Math.random(),Math.random(),Math.random(),0.5),
            pos : new Vector( Luxe.screen.w/2, Luxe.screen.h/2 ),
            text : "// c = Luxe.draw.ring({\n //      x : Luxe.screen.w/2,\n //      y : Luxe.screen.h/2,\n//     r : 70,\n //     color : new Color(1,1,1,1)\n // });\n"
        });
        
        n.locked = true;        

    } //ready
  
    public function onmousemove(e) {
        mouse.set(e.x,e.y);
    }
    public function onmousedown(e) {
        mouse.set(e.x,e.y);
    }
    public function onmouseup(e) {
        mouse.set(e.x,e.y);
    }

    public function onkeyup(e) {

      if(e.value == Input.Keys.escape) {
        Luxe.shutdown();
      }
    } //onkeyup

    public function update(dt:Float) {

        Luxe.draw.rectangle({
            x : mouse.x, y : mouse.y,
            w : 120,
            h : 120,
            immediate : true,
            color : new Color(Math.random(),Math.random(),Math.random(),0.5)
        });

        Luxe.draw.text({
            immediate:true,
            color : new Color(Math.random(),Math.random(),Math.random(),0.5),
            pos : mouse,
            text : Luxe.dt
        });

    } //update

    public function shutdown() {

    } //shutdown
}


