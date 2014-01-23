
import luxe.Input;
import luxe.Sprite;
import luxe.Vector;
import luxe.Color;

import luxe.importers.texturepacker.TexturePackerData;
import luxe.importers.texturepacker.TexturePackerJSON;
import luxe.importers.TexturePackerSpriteAnimation;

class Main extends luxe.Game {

    public function ready() {

        var json : Dynamic = luxe.utils.JSON.parse(  Luxe.loadText('assets/player1.json') );        
        var json2 : Dynamic = luxe.utils.JSON.parse(  Luxe.loadText('assets/player2.json') );        
        
        var data : TexturePackerData = TexturePackerJSON.parse( json );
        var data1 : TexturePackerData = TexturePackerJSON.parse( json2 );

        trace("data1 : from " + data.meta);
        trace("data2 : from " + data.meta);

        var texture = Luxe.loadTexture('assets/playertest.png');
        texture.onload = function(t) {
            
            //create 2 sprites with the 2 diff importer types

            var sprite = new Sprite({
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

        } //onload


    } //ready

    public function onkeyup( e:KeyEvent ) {

        if(e.key == KeyValue.escape) {
            Luxe.shutdown();
        }
        
    } //onkeyup

    public function update(dt:Float) {

    } //update

} //Main