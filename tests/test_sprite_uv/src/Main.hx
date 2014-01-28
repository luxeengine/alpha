
import luxe.Input;
import luxe.Sprite;
import luxe.Vector;

class Main extends luxe.Game {

    var stars : Sprite;
    var sky : Sprite;

    public function ready() {

        var ratio = Luxe.screen.w / Luxe.screen.h;

        sky = new Sprite({
            size : new Vector(Luxe.screen.w, Luxe.screen.w / ratio),
            centered : false,
            texture: Luxe.loadTexture('assets/bg_sky.png')
        });

        stars = new Sprite({
            size : new Vector(Luxe.screen.w, Luxe.screen.w / ratio),
            centered : false,
            texture: Luxe.loadTexture('assets/bg_stars.png')
        });

        stars.texture.filter = phoenix.Texture.FilterType.nearest;
        stars.texture.clamp = phoenix.Texture.ClampType.repeat;

    } //ready

    public function onkeyup( e:KeyEvent ) {

        if(e.key == KeyValue.escape) {
            Luxe.shutdown();
        }
        
    } //onkeyup

    public function update(dt:Float) {

        stars.uv.y -= 0.2;
        stars.uv.x += 0.4;

    } //update

} //Main