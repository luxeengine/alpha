
import luxe.Sprite;
import luxe.Vector;
import luxe.Input;
import luxe.Color;

class Main extends luxe.Game {

    public var sprites : Array<Sprite>;

    public function ready() {

        var image = Luxe.loadTexture('assets/image.png');
        var image2 = Luxe.loadTexture('assets/luxe.png');

        sprites = [];

        for(i in 1 ... 20) {

            var ih = image.height;
            var iw = image.width;

            if(i == 1) {
                iw = image2.width;
                ih = image2.height;
            }

            sprites.push(new Sprite({
                name : 's' + i,
                depth : i,
                texture: (i == 1) ? image2 : image,
                centered : false,
                color : (i == 1) ? new Color() : new Color(Math.random(), Math.random(), Math.random()),
                pos : new Vector(100 + (i*20), 100 + (i*20) ),
                size : new Vector(iw*0.2,ih*0.2)
            }));

        } //

       
    } //ready
  
    public function onmousemove(e) {
        var m = new Vector(e.x,e.y);
        sprites[0].pos = m;
    }

    public function onkeyup(e) {

      if(e.value == Input.Keys.escape) {
        Luxe.shutdown();
      }


      if(e.value == Input.Keys.space) {
        var d= sprites[0].depth;
        sprites[0].depth = d;
      }

      if(e.value == Input.Keys.equals) {
        sprites[0].depth+=1;
        trace(sprites[0].depth);
      }
      if(e.value == Input.Keys.minus) {
        sprites[0].depth-=1;
        trace(sprites[0].depth);
      }

    } //onkeyup

    public function update(dt:Float) {

    } //update

    public function destroyed() {

    } //destroyed
}


