
import luxe.Input;
import luxe.Rectangle;
import luxe.Sprite;
import luxe.Text;
import luxe.Vector;
import luxe.Color;

import luxe.components.sprite.SpriteAnimation;

import phoenix.Texture.FilterType;


class Main extends luxe.Game {

    var sprite : Sprite;
	var text : Text;
    var textbounds : Rectangle;

    public function ready() {

    	var block_back = new Sprite({
    		centered : false,
    		pos : new Vector(0,0),
    		size : new Vector(Luxe.screen.w, Luxe.screen.h),
    		color : new Color().rgb(0xa8a79c)
    	});

    	var floory = (Luxe.screen.h/2)+92;
    	var block_floor = new Sprite({
    		centered : false,
    		pos : new Vector(0,floory),
    		size : new Vector(Luxe.screen.w, Luxe.screen.h - floory ),
    		color : new Color().rgb(0x797d76)
    	});

        var _text = 'Animation by Gabriele Pala\nclick to visit http://meetcartographer.com/carapace';
        text = new Text({
            pos : new Vector(Luxe.screen.w/2, 100),
            color : new Color().rgb(0x797d76),
            size : 20,
            align : TextAlign.center,
            text : _text
        });

        var _textsize = Luxe.renderer.default_font.get_text_dimensions(_text, new Vector(1,1));
        
            textbounds = new Rectangle((Luxe.screen.w/2) - (_textsize.x/2), 90, _textsize.x, _textsize.y);

    	var texture = Luxe.loadTexture('assets/carapace.png');
		texture.onload = function(t) {

			texture.filter = FilterType.nearest;

			sprite = new Sprite({	
				texture : texture,
				pos : new Vector( Luxe.screen.w/2, Luxe.screen.h/2 ),
				size : new Vector(192,192)
			});

				//add a sprite animation component
			var anim = sprite.add( SpriteAnimation, 'anim' );

			var animation_json = '
				{
					"walk" : {
						"frame_size":{ "x":"48", "y":"48" },
						"frameset": ["1-8","9","10-12"],
						"pingpong":"false",
						"loop": "true",
						"speed": "18"
					}
				}
			';

				//We can create the animation from a json string
			anim.add_from_json( animation_json );

				//Or we can add them manually, using the anim.animation_list.push(new SpriteAnimationData)

			anim.animation = 'walk';
			anim.play();

		} //onload

    } //ready

    public function onmouseup( e:MouseEvent ) {

        if(textbounds.point_inside(e.pos)) {
            Luxe.openURL('http://meetcartographer.com/carapace/');
        }
    }

    public function onkeyup( e:KeyEvent ) {

        if(e.key == KeyValue.escape) {
            Luxe.shutdown();
        }
        
    } //onkeyup

    public function update(dt:Float) {

    } //update

} //Main