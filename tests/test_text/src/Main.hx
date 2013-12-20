
import luxe.Vector;
import luxe.Input;
import luxe.Text;
import luxe.Color;
import luxe.Rectangle;

class Main extends luxe.Game {

    public function ready() {

        new Text({
            color : new Color(),
            text : "left && top",
            bounds : new Rectangle(50,50,200,100),
            align : TextAlign.left,
            align_vertical : TextAlign.top,
            size : 24
        });

        Sys.args().filter(function(e){

        });

        new Text({
            color : new Color(),
            text : "right && center",
            bounds : new Rectangle(250,50,200,100),
            align : TextAlign.right,
            align_vertical : TextAlign.center,
            size : 24
        });

        new Text({
            color : new Color(),
            text : "center && bottom",
            bounds : new Rectangle(450,50,200,100),
            align : TextAlign.center,
            align_vertical : TextAlign.bottom,
            size : 24
        });

        Luxe.draw.rectangle({x:50,y:50,w:200,h:100});
        Luxe.draw.rectangle({x:250,y:50,w:200,h:100});
        Luxe.draw.rectangle({x:450,y:50,w:200,h:100});

    } //ready
  
    public function onkeyup(e) {
      if(e.value == Input.Keys.escape) {
        Luxe.shutdown();
      }
    } //onkeyup

    public function update(dt:Float) {

    } //update

    public function destroy() {

    } //destroy
}


