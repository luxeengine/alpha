
import luxe.Vector;
import luxe.Input;
import luxe.Sprite;

import phoenix.Batcher;
import phoenix.RenderTexture;

class Main extends luxe.Game {

    var rtt : RenderTexture;
    var batcher : Batcher;
    var sprite : Sprite;
    var sprite2 : Sprite;

    public function ready() {
        rtt = new RenderTexture( Luxe.resources, new Vector( 512,512 ) );

        batcher = new Batcher( Luxe.renderer, 'test_rtt_batcher' );

            //Create a sprite, but don't add it to the batcher
        sprite = new Sprite({
            add : false,
            centered : false,
            texture : Luxe.loadTexture('assets/image.jpg')
        });
    
        sprite.texture.onload = function(t) {
            batcher.add( sprite.geometry );
            rtt.bindBuffer();
            batcher.draw( false );
            rtt.unbindBuffer();

            sprite2 = new Sprite({
                texture : rtt,
                size : new Vector(512,512),
                centered:false,
                pos:new Vector(50,50)
            });
        }        

        // Luxe.renderer.add_batch( batcher );

    } //ready
  
    public function onkeyup(e) {
      if(e.value == Input.Keys.escape) {
        Luxe.shutdown();
      }
    } //onkeyup

    public function prerender() {
        
    }

    public function update(dt:Float) {
        
    } //update

    public function shutdown() {

    } //shutdown
}


