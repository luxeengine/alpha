
import luxe.Vector;
import luxe.Input;
import luxe.Sprite;

import phoenix.Batcher;
import phoenix.Camera;
import phoenix.RenderTexture;

class Main extends luxe.Game {

    var rtt : RenderTexture;
    var batcher : Batcher;
    var camera : Camera;
    var sprite : Sprite;
    var sprite2 : Sprite;

    public function ready() {
        rtt = new RenderTexture( Luxe.resources, new Vector( 512,512 ) );

        batcher = new Batcher( Luxe.renderer, 'test_rtt_batcher' );

            //Create a sprite, but don't add it to the batcher
        sprite = new Sprite({
            add : false, //dont add to the main renderer
            texture : Luxe.loadTexture('assets/image.jpg'),
            size : new Vector(1024,1024)
        });
        
            //doing this lets you work with html5 late loading textures,
            //unless you have a preloader, or on desktop where its sequential, 
            //you don't have to worry about this not working, it calls for you
        sprite.texture.onload = function(t) {

            batcher.add( sprite.geometry );
            
            sprite2 = new Sprite({
                texture : rtt,
                size : new Vector(512,512),
                centered:false,
                pos:new Vector(50,50),
            });
        }

    } //ready
  
    public function onkeyup(e) {
      if(e.value == Input.Keys.escape) {
        Luxe.shutdown();
      }
    } //onkeyup

    public function prerender() {
        rtt.bindBuffer();
        batcher.draw( false );
        rtt.unbindBuffer();
    }

    public function update(dt:Float) {
        sprite.rotation += 20 * dt;
    } //update

    public function shutdown() {

    } //shutdown
}


