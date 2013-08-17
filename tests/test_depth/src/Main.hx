
import luxe.Sprite;
import luxe.Vector;
import luxe.Input;

import tests.BST;


class Main extends luxe.Game {

    public var sprites : Array<Sprite>;

    public function ready() {

        var image = Luxe.loadTexture('assets/image.png');
        var image2 = Luxe.loadTexture('assets/luxe.png');

        sprites = [];

        for(i in 1 ... 5) {

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


        if(e.value == Input.Keys.key_D) {
                Sys.println('>>> drop sprite geometry >>> ' + sprites[1].geometry.short_id());
            sprites[1].destroy();
                Sys.println('>>> drop sprite geometry >>> ' + sprites[2].geometry.short_id());
            sprites[2].destroy();
                Sys.println('>>> drop sprite geometry >>> ' + sprites[3].geometry.short_id());
            sprites[3].destroy();
        }

      if(e.value == Input.Keys.key_L) {
            Sys.println('geometry list ; ');
            for( g in Luxe.renderer.default_batcher.geometry ) {
                Sys.println('\t ' + g.short_id() + ' at ' + g.depth +' ( ' + g.id +  ' )');
            }
      }

      if(e.value == Input.Keys.key_0) {
        sprites[0].depth = 0;
      }
      if(e.value == Input.Keys.key_1) {
        sprites[0].depth = 1;
      }
      if(e.value == Input.Keys.key_2) {
        sprites[0].depth = 2;
      }
      if(e.value == Input.Keys.key_3) {
        sprites[0].depth = 3;
      }
      if(e.value == Input.Keys.key_4) {
        sprites[0].depth = 4;
      }
    } //onkeyup

    public function update(dt:Float) {

    } //update

    public function shutdown() {

    } //shutdown
}


