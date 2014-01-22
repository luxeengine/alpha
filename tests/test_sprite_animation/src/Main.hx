
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
    var sprite2 : Sprite;
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
                name : "walker",
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
                        "frameset": ["1-12"],
                        "events" : [{"frame":8, "event":"foot.1"}, {"frame":1, "event":"foot.2"}, { "frame": 6 }],
                        "pingpong":"false",
                        "loop": "true",
                        "speed": "18"
                    },
                    "walk_glitch" : {
						"frame_size":{ "x":"48", "y":"48" },
						"frameset": ["1-8","9","10","hold 10","11 hold 5", "12"],
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

                //create the sound to use
            Luxe.audio.create('step1', 'assets/samulis_footstep_on_stone_2.ogg');
            Luxe.audio.create('step2', 'assets/samulis_footstep_on_stone_1.ogg');

                //create an event manually
            anim.add_event('walk', 7, 'frame7');
            anim.add_event('walk', 8 );
            anim.add_event('walk', 10, 'test_dupe' );
            anim.add_event('walk', 10, 'test_dupe' );

            sprite.events.listen('foot.1', function(e){ Luxe.audio.play('step1'); });
            sprite.events.listen('foot.2', function(e){ Luxe.audio.play('step2'); });
            sprite.events.listen('*', function(e){ 
                //uncomment to see all the events listed
                // trace( e.event + " fired on animation " + e.animation );
            });

		} //onload

            sprite2 = new Sprite({
                name : "squad_guy",
                pos : new Vector( Luxe.screen.w/2, Luxe.screen.h-32 ),
                size : new Vector(64,64)
            });

                //add a sprite animation component
            var anim2 = sprite2.add( SpriteAnimation, 'anim' );
            var animation_json2 = '
                {
                    "idle" : {
                        "frame_size":{ "x":"16", "y":"16" },
                        "frameset": ["1-2","3 hold 5","4","1 hold 7"], 
                        "image_sequence" : "assets/idle/swat_idle",
                        "loop": "true",
                        "filter_type" : "nearest",
                        "speed": "8"
                    }
                }
            ';

                //We can create the animation from a json string
            anim2.add_from_json( animation_json2 );

            anim2.animation = 'idle';
            anim2.play();

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