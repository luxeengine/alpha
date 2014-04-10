
import luxe.Input;
import luxe.Sprite;
import luxe.Vector;
import phoenix.Batcher;

class Main extends luxe.Game {


    var level_sprite : Sprite;

    var luxe_sprite1 : Sprite;
    var luxe_sprite2 : Sprite;
    var luxe_sprite3 : Sprite;


    public function ready() {

        var level_texture = Luxe.loadTexture('assets/level.png');
    	var luxe_texture = Luxe.loadTexture('assets/luxe.png');            

        level_sprite = new Sprite({
            texture : level_texture,
            pos : new Vector(Luxe.screen.w/2,Luxe.screen.h/2)
        });

        level_texture.onload = function(tt) {

            level_texture.filter = phoenix.Texture.FilterType.nearest;
            level_sprite.scale = new Vector(Luxe.screen.w/240,Luxe.screen.h/160);

        } //level tex on load

            //We will create 3 sprites, each with a different group
        var a_third = Luxe.screen.w/4;
        var half_a_third = (Luxe.screen.w/3)/2;
        var mid = Luxe.screen.h/2;

        luxe_sprite1 = new Sprite({
            texture : luxe_texture,
            pos : new Vector( a_third * 1, mid ), 
            size : new Vector( half_a_third, half_a_third ),
            group : 1
        });

        luxe_sprite2 = new Sprite({
            texture : luxe_texture,
            pos : new Vector( a_third * 2, mid ),
            size : new Vector( half_a_third, half_a_third ),
            group : 2
        });

        luxe_sprite3 = new Sprite({
            texture : luxe_texture,
            pos : new Vector( a_third * 3, mid ),
            size : new Vector( half_a_third, half_a_third ),
            group : 3
        });

            //for the first group, we set the blend mode to additive
        Luxe.addGroup(1, 
            function(b:Batcher){
                b.blend_mode(BlendMode.src_alpha, BlendMode.one);
            }
        );

            //for the second, we set it to negative
        Luxe.addGroup(2, 
            function(b:Batcher){
                b.blend_mode(BlendMode.one_minus_src_color, BlendMode.zero);
            }
        );

            //for the third one, we maks sure it is reset as well
        Luxe.addGroup(3, 
            function(b:Batcher){
                b.blend_mode(BlendMode.dst_color, BlendMode.one_minus_src_alpha);
            }, 
            function(b:Batcher){
                b.blend_mode(); 
            }
        );

    } //ready

    public function onkeyup( e:KeyEvent ) {

        if(e.key == KeyValue.escape) {
            Luxe.shutdown();
        }
        
    } //onkeyup

    public function update(dt:Float) {

    } //update


} //Main
