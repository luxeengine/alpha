
import lab.Vector;
import lab.Input;
import lab.Text;
import lab.Color;
import lab.Rectangle;

class Main extends lab.Game {

    public function ready() {

        new Text({
            color : new Color(),
            text : "left && top",
            bounds : new Rectangle(50,50,200,100),
            align : TextAlign.left,
            align_vertical : TextAlign.top
        });

        new Text({
            color : new Color(),
            text : "right && center",
            bounds : new Rectangle(250,50,200,100),
            align : TextAlign.right,
            align_vertical : TextAlign.center
        });

        new Text({
            color : new Color(),
            text : "center && bottom",
            bounds : new Rectangle(450,50,200,100),
            align : TextAlign.center,
            align_vertical : TextAlign.bottom
        });

        Lab.draw.rectangle({x:50,y:50,w:200,h:100});
        Lab.draw.rectangle({x:250,y:50,w:200,h:100});
        Lab.draw.rectangle({x:450,y:50,w:200,h:100});

    } //ready
  
    public function onkeyup(e) {
      if(e.value == Input.Keys.escape) {
        Lab.shutdown();
      }
    } //onkeyup

    public function update(dt:Float) {

    } //update

    public function shutdown() {

    } //shutdown
}


