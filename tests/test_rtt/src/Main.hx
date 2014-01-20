
import luxe.Vector;
import luxe.Input;
import luxe.Sprite;
import luxe.Color;

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
        
        rtt = new RenderTexture( Luxe.resources, new Vector( 1024, 1024 ) );

        batcher = new Batcher( Luxe.renderer, 'test_rtt_batcher' );
        camera = new phoenix.Camera({ projection :ProjectionType.ortho, x2 : 512, y2 : 512 });
        camera.pos.x = 0;
        camera.pos.y = 0;
        batcher.view = camera;

            //Create a sprite, but don't add it to the batcher
        sprite = new Sprite({
            add : false, //dont add to the main renderer
            texture : Luxe.loadTexture('assets/image.jpg'),
            size : new Vector(256,256),
            centered :false
        });
        
            //doing this lets you work with html5 late loading textures,
            //unless you have a preloader, or on desktop where its sequential, 
            //you don't have to worry about this not working, it calls for you
        sprite.texture.onload = function(t) {

            batcher.add( sprite.geometry );
            sprite2 = new Sprite({
                texture : rtt,
                size : new Vector(Luxe.screen.w,Luxe.screen.h),
                centered : false,
                pos:new Vector(0,0)
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
        batcher.renderer.clear(new Color().rgb(0xff4b03));
        batcher.draw( false );
        rtt.unbindBuffer();
    }

    public function update(dt:Float) {
        // sprite.rotation_z += 40 * dt;
    } //update

    public function destroyed() {

    } //destroyed
}


