
import luxe.components.sprite.SpriteAnimation;
import luxe.Input;
import luxe.Sprite;
import luxe.Vector;
import luxe.Color;

import luxe.importers.texturepacker.TexturePackerData;
import luxe.importers.texturepacker.TexturePackerJSON;
import luxe.importers.TexturePackerSpriteAnimation;

class Main extends luxe.Game {


    public function ready() {

        Luxe.renderer.clear_color = new Color().rgb(0xf0f0f0);

        var json_source_1 : Dynamic = luxe.utils.JSON.parse(  Luxe.loadText('assets/player1.json').text );        
        var json_source_2 : Dynamic = luxe.utils.JSON.parse(  Luxe.loadText('assets/player2.json').text );        
        
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

            var sprite1_anim = sprite1.add( SpriteAnimation, 'anim' );
            var sprite2_anim = sprite2.add( SpriteAnimation, 'anim' );

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

    public function onkeyup( e:KeyEvent ) {

        if(e.key == KeyValue.escape) {
            Luxe.shutdown();
        }
        
    } //onkeyup

    public function update(dt:Float) {

    } //update


} //Main
