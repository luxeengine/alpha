
import luxe.Vector;
import luxe.Color;
import luxe.Input;
import phoenix.geometry.LineGeometry;
import phoenix.geometry.RectangleGeometry;



class Main extends luxe.Game {

    public var mouse : Vector;

    public var line : LineGeometry; 
    public var rect : RectangleGeometry; 

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

        rect = Luxe.draw.rectangle({
            x : 40, y : 40,
            w : Luxe.screen.w - 80, 
            h : Luxe.screen.h - 80,
            color : new Color(0.5,0.2,0.2,0.5)
        });        

    } //ready
  
    public function onmousemove(e) {
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

    } //update

    public function shutdown() {

    } //shutdown
}


