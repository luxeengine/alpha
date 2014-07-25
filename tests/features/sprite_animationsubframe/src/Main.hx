
import luxe.Input;
import luxe.Rectangle;
import luxe.Sprite;
import luxe.Text;
import luxe.Vector;
import luxe.Color;

import luxe.components.sprite.SpriteAnimation;

import phoenix.Texture.FilterType;


class Main extends luxe.Game {


    var animation : Sprite;
    var subanimation : Sprite;


    override function ready() {

        Luxe.renderer.clear_color = new Color().rgb(0xf0f0f0);

        var texture = Luxe.loadTexture('assets/player_grid.png');
        var texture2 = Luxe.loadTexture('assets/player64_grid.png');

            //cross hairs for debugging origins
        Luxe.draw.line({
            p0 : new Vector(Luxe.screen.w/2, 0),
            p1 : new Vector(Luxe.screen.w/2, Luxe.screen.h),
            color : new Color(0,0,0,0.3),
        });

        Luxe.draw.line({
            p0 : new Vector(0, Luxe.screen.h/2),
            p1 : new Vector(Luxe.screen.w, Luxe.screen.h/2),
            color : new Color(0,0,0,0.3),
        });

            //html5 safe
        texture2.onload = function(t) {

            texture2.filter = FilterType.nearest;
            texture.filter = FilterType.nearest;

                //the sub animation sprite,
                //none of the sprite transform (size, scale or origin) should affect the sub animation working
            subanimation = new Sprite({
                name : "subanimation",
                texture : texture,
                color : new Color(1,0.6,0.1,0.8),
                pos : new Vector( Luxe.screen.w/2, Luxe.screen.h/2 ),
                size : new Vector(64,64),       //change this to start at a new base size
                // origin : new Vector(0,0),    //change this to offset the sprite
                // scale : new Vector(2,2),     //change this to scale the sprite
            });

            animation = new Sprite({
                name : "animation",
                texture : texture2,
                color : new Color(1,0.6,0.1,0.3),
                pos : new Vector( Luxe.screen.w/2, Luxe.screen.h/2 ),
                size : new Vector(64,64),
                // origin : new Vector(0,0),
                // scale : new Vector(2,2)
            });

                //debug offsets from positions
                // on top of each other somewhere near the top left
            new Sprite({
                name : "tie_small",
                texture : Luxe.loadTexture('assets/tiesmall.png'),
                pos : new Vector(128,128),
                origin : new Vector(0-4,0-19)
            });

            new Sprite({
                name : "tie_big",
                pos : new Vector(128,128),
                texture : Luxe.loadTexture('assets/tiebig.png'),
                origin: new Vector(0,0)
            });

            var subanim = subanimation.add( SpriteAnimation, 'anim' );
            var anim = animation.add( SpriteAnimation, 'anim' );

           var sub_anim_json = '
                {
                    "walk" : {
                        "frame_size":{ "x":"64", "y":"64" },
                        "frameset": ["1-12"],
                        "frame_sources": [
                            { "frame":1,  "source": { "x":0,    "y":0,      "w":28,     "h":46 }, "pos":{ "x":17,"y":11 }, "size":{ "x":64, "y":64 }  },
                            { "frame":2,  "source": { "x":28,   "y":0,      "w":28,     "h":46 }, "pos":{ "x":14,"y":11 }, "size":{ "x":64, "y":64 }  },
                            { "frame":3,  "source": { "x":56,   "y":0,      "w":28,     "h":48 }, "pos":{ "x":13,"y":9 }, "size":{ "x":64, "y":64 }  },
                            { "frame":4,  "source": { "x":84,   "y":0,      "w":28,     "h":46 }, "pos":{ "x":16,"y":10 }, "size":{ "x":64, "y":64 }  },
                            { "frame":5,  "source": { "x":0,    "y":48,     "w":28,     "h":46 }, "pos":{ "x":16,"y":11 }, "size":{ "x":64, "y":64 }  },
                            { "frame":6,  "source": { "x":28,   "y":48,     "w":28,     "h":46 }, "pos":{ "x":16,"y":10 }, "size":{ "x":64, "y":64 }  },
                            { "frame":7,  "source": { "x":56,   "y":48,     "w":28,     "h":46 }, "pos":{ "x":16,"y":11 }, "size":{ "x":64, "y":64 }  },
                            { "frame":8,  "source": { "x":84,   "y":48,     "w":28,     "h":48 }, "pos":{ "x":13,"y":9 }, "size":{ "x":64, "y":64 }  },
                            { "frame":9,  "source": { "x":0,    "y":96,     "w":32,     "h":52 }, "pos":{ "x":16,"y":6 }, "size":{ "x":64, "y":64 }  },
                            { "frame":10, "source": { "x":32,   "y":96,     "w":52,     "h":44 }, "pos":{ "x":9,"y":13 }, "size":{ "x":64, "y":64 }  },
                            { "frame":11, "source": { "x":84,   "y":96,     "w":44,     "h":34 }, "pos":{ "x":5,"y":20 }, "size":{ "x":64, "y":64 }  },
                            { "frame":12, "source": { "x":0,    "y":148,    "w":18,     "h":34 }, "pos":{ "x":4,"y":19 }, "size":{ "x":64, "y":64 }  },
                        ],
                        "pingpong":"false",
                        "loop": "true",
                        "speed": "2"
                    }
                }
            ';

            var anim_json = '
                {
                    "walk" : {
                        "frame_size":{ "x":"64", "y":"64" },
                        "frameset": ["1-12"],
                        "pingpong":"false",
                        "loop": "true",
                        "speed": "2"
                    }
                }
            ';

            subanim.add_from_json( sub_anim_json );
            subanim.animation = 'walk';
            subanim.play();

            anim.add_from_json( anim_json );
            anim.animation = 'walk';
            anim.play();

        } //onload

    } //ready

    override function onmouseup( e:MouseEvent ) {

    } //onmouseup

    override function onkeyup( e:KeyEvent ) {

        if(e.keycode == Key.ESCAPE) {
            Luxe.shutdown();
        }

    } //onkeyup

} //Main
