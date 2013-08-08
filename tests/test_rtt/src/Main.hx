
import luxe.Vector;
import luxe.Input;
import luxe.Sprite;

import phoenix.Batcher;
import phoenix.RenderTexture;

class Main extends luxe.Game {

    var rtt : RenderTexture;
    var batcher : Batcher;
    var sprite : Sprite;

    public function ready() {
        rtt = new RenderTexture( Luxe.resources, new Vector( Luxe.screen.w, Luxe.screen.h ) );

        batcher = new Batcher( Luxe.renderer, 'test_rtt_batcher' );

            //Create a sprite, but don't add it to the batcher
        sprite = new Sprite({
            add : false,
            centered : false,
            texture : Luxe.loadTexture('assets/image.jpg')
        });

        batcher.add( sprite.geometry );

        batcher.draw( false );
        // Luxe.renderer.add_batch( batcher );

    } //ready
  
    public function onkeyup(e) {
      if(e.value == Input.Keys.escape) {
        Luxe.shutdown();
      }
    } //onkeyup

    public function update(dt:Float) {
        
    } //update

    public function shutdown() {

    } //shutdown
}


