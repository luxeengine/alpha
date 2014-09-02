
import luxe.components.sprite.SpriteAnimation;
import luxe.Input;
import luxe.Sprite;
import luxe.Vector;
import luxe.Color;

import luxe.importers.texturepacker.TexturePackerData;
import luxe.importers.texturepacker.TexturePackerJSON;
import luxe.importers.TexturePackerSpriteAnimation;

class Main extends luxe.Game {


    override function ready() {

        Luxe.renderer.clear_color = new Color().rgb(0xf0f0f0);

        var json_source_1 : Dynamic = Luxe.loadJSON('assets/player1.json').json;
        var json_source_2 : Dynamic = Luxe.loadJSON('assets/player2.json').json;

        var data1 : TexturePackerData = TexturePackerJSON.parse( json_source_1 );
        var data2 : TexturePackerData = TexturePackerJSON.parse( json_source_2 );

        trace("data1 : from " + data1.meta);
        trace("data2 : from " + data2.meta);

        var json_sprite_1 = TexturePackerSpriteAnimation.parse( data1, 'all' );
        var json_sprite_2 = TexturePackerSpriteAnimation.parse( data2, 'all' );

        var texture = Luxe.loadTexture('assets/playertest.png');

        texture.onload = function(t) {

            //create 2 sprites with the 2 diff importer types

            var sprite1 = new Sprite({
                name : "one",
                texture : texture,
                pos : new Vector( Luxe.screen.w*0.75, Luxe.screen.h/2 ),
                size : new Vector(64,64)
            });

            var sprite2 = new Sprite({
                name : "two",
                texture : texture,
                pos : new Vector( Luxe.screen.w*0.25, Luxe.screen.h/2 ),
                size : new Vector(64,64)
            });

            var sprite1_anim = new SpriteAnimation({ name:'anim' });
            var sprite2_anim = new SpriteAnimation({ name:'anim' });

            sprite1.add( sprite1_anim );
            sprite2.add( sprite2_anim );

            sprite1_anim.add_from_json_object( json_sprite_1 );
            sprite2_anim.add_from_json_object( json_sprite_2 );

            sprite1_anim.animation = 'all';
            sprite1_anim.speed = 8;
            sprite1_anim.loop = true;
            sprite2_anim.animation = 'all';
            sprite2_anim.speed = 8;
            sprite2_anim.loop = true;

            sprite1_anim.play();
            sprite2_anim.play();

        } //texture.onload

    } //ready

    override function onkeyup( e:KeyEvent ) {

        if(e.keycode == Key.escape) {
            Luxe.shutdown();
        }

    } //onkeyup


} //Main
