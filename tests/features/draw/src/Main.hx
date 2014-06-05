
import luxe.Text;
import luxe.Vector;
import luxe.Color;
import luxe.Input;

import phoenix.geometry.CircleGeometry;
import phoenix.geometry.RingGeometry;
import phoenix.geometry.LineGeometry;
import phoenix.geometry.QuadGeometry;
import phoenix.geometry.RectangleGeometry;

class Main extends luxe.Game {


    public var mouse    : Vector;
    public var line     : LineGeometry; 
    public var rect     : RectangleGeometry; 
    public var box      : QuadGeometry; 
    public var circle   : CircleGeometry; 
    public var ring     : RingGeometry; 


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

        
        Luxe.draw.ngon({
            r:200, sides : 3,
            solid : true,
            color: new Color(1,1,1,0.1),
            x:Luxe.screen.mid.x, y:Luxe.screen.mid.y
        });
        Luxe.draw.ngon({
            r:120, sides : 3,
            color: new Color(1,1,1,0.5),
            angle: 90,
            x:Luxe.screen.mid.x, y:Luxe.screen.mid.y
        });
        Luxe.draw.ngon({
            r:120, sides : 3,
            color: new Color(1,1,1,0.5),
            angle: 180,
            x:Luxe.screen.mid.x, y:Luxe.screen.mid.y
        });
        Luxe.draw.ngon({
            r:200, sides : 5,
            color: new Color(1,1,1,0.3),
            x:Luxe.screen.mid.x, y:Luxe.screen.mid.y
        });
        Luxe.draw.ngon({
            r:200, sides : 6,
            color: new Color(1,1,1,0.3),
            x:Luxe.screen.mid.x, y:Luxe.screen.mid.y
        });
        Luxe.draw.ngon({
            r:200, sides : 7,
            color: new Color(1,1,1,0.3),
            x:Luxe.screen.mid.x, y:Luxe.screen.mid.y
        });
        Luxe.draw.ngon({
            r:200, sides : 8,
            color: new Color(1,1,1,0.3),
            x:Luxe.screen.mid.x, y:Luxe.screen.mid.y
        });

        box = Luxe.draw.box({
            x : 40, y : 40,
            w : Luxe.screen.w - 80, 
            h : Luxe.screen.h - 80,
            color : new Color(0,0,0,0.5)
        });

        circle = Luxe.draw.circle({
            x : Luxe.screen.w/2,
            y : Luxe.screen.h/2,
            r : 50,
            color : new Color().rgb(0xff4b03)
        });

        ring = Luxe.draw.ring({
            x : Luxe.screen.w/2,
            y : Luxe.screen.h/2,
            r : 60,
            color : new Color(1,1,1,1)
        });

        Luxe.draw.ring({
            x : Luxe.screen.w/2,
            y : Luxe.screen.h/2,
            rx : 200,
            ry : 100,
            color : new Color(1,1,1,0.3)
        });

        Luxe.draw.ring({
            x : Luxe.screen.w/2,
            y : Luxe.screen.h/2,
            rx : 100,
            ry : 200,
            color : new Color(1,1,1,0.3)
        });

        Luxe.draw.arc({
            x : Luxe.screen.w/2,
            y : Luxe.screen.h/2,
            r : 70,
            end_angle:70,
            color : new Color(1,1,1,1)
        });

        Luxe.draw.text({
            color : new Color(1,1,1,1),
            pos : Luxe.screen.mid,
            size : 24,
            text : 
"Luxe.draw.ring({
        x : Luxe.screen.mid.x,
        y : Luxe.screen.mid.y,
        r : 70,
        color : new Color(1,1,1,1)
});\n"

        });

    } //ready
  
    public function onmousemove( e:MouseEvent ) {
        mouse.set(e.x,e.y);
    } //onmousemove

    public function onmousedown( e:MouseEvent ) {
        mouse.set(e.x,e.y);
    } //onmousedown

    public function onmouseup( e:MouseEvent ) {
        mouse.set(e.x,e.y);
    } //onmouseup

    public function onkeyup( e:KeyEvent ) {
        if(e.value == Input.Keys.escape) {
            Luxe.shutdown();
        }
    } //onkeyup

    public function update(dt:Float) {

        // Luxe.draw.rectangle({
        //         //this line is important, as each frame it will create new geometry!
        //     immediate : true,
        //     x : mouse.x, y : mouse.y,
        //     w : 120,
        //     h : 120,
        //     color : new Color(Math.random(),Math.random(),Math.random(),0.5)
        // });

        // Luxe.draw.text({
        //         //this line is important, as each frame it will create new geometry!
        //     immediate:true,
        //     color : new Color(Math.random(),Math.random(),Math.random(),0.5),
        //     pos : mouse,
        //     text : Luxe.dt
        // });

    } //update


} //Main
