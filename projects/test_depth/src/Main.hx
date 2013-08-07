
import lab.Sprite;
import lab.Vector;
import lab.Input;

import tests.BST;


class Main extends lab.Game {

    public var sprites : Array<Sprite>;

    public function ready() {

        var image = Lab.loadTexture('assets/image.png');

        sprites = [];

        for(i in 1 ... 21) {

            sprites.push(new Sprite({
                name : 's' + i,
                depth : i,
                texture: image,
                centered : false,
                pos : new Vector(100 + (i*20), 100 + (i*20) ),
                size : new Vector(204,144)
            }));

        } //
       
    } //ready
  
    public function onmousemove(e) {
        var m = new Vector(e.x,e.y);
        sprites[0].pos = m;
    }

    public function onkeyup(e) {
      if(e.value == Input.Keys.escape) {
        Lab.shutdown();
      }


        if(e.value == Input.Keys.key_D) {
                Sys.println('>>> drop sprite geometry >>> ' + sprites[4].geometry.short_id());
            sprites[4].destroy();
                Sys.println('>>> drop sprite geometry >>> ' + sprites[2].geometry.short_id());
            sprites[2].destroy();
                Sys.println('>>> drop sprite geometry >>> ' + sprites[12].geometry.short_id());
            sprites[12].destroy();
                Sys.println('>>> drop sprite geometry >>> ' + sprites[5].geometry.short_id());
            sprites[5].destroy();
                Sys.println('>>> drop sprite geometry >>> ' + sprites[1].geometry.short_id());
            sprites[1].destroy();
        }

      if(e.value == Input.Keys.key_L) {
            Sys.println('geometry list ; ');
            for( g in Lab.renderer.default_batcher.geometry ) {
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


