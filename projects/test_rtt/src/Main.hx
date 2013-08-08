
import lab.Vector;
import lab.Input;
import lab.Sprite;

import phoenix.Batcher;
import phoenix.RenderTexture;

class Main extends lab.Game {

    var rtt : RenderTexture;
    var batcher : Batcher;
    var sprite : Sprite;

    public function ready() {
        rtt = new RenderTexture( Lab.resources, new Vector( Lab.screen.w, Lab.screen.h ) );

        batcher = new Batcher( Lab.renderer, 'test_rtt_batcher' );

            //Create a sprite, but don't add it to the batcher
        sprite = new Sprite({
            add : false,
            centered : false,
            texture : Lab.loadTexture('assets/image.jpg')
        });

        batcher.add( sprite.geometry );

        batcher.draw( false );
        // Lab.renderer.add_batch( batcher );

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


