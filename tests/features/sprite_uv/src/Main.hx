
import luxe.Input;
import luxe.Sprite;
import luxe.Text;
import luxe.Color;
import luxe.Vector;
import luxe.Rectangle;
import phoenix.Texture;
import phoenix.Texture.ClampType;
import phoenix.Texture.FilterType;

class Main extends luxe.Game {


    var stars : Sprite;
    var sky : Sprite;
    var mousetext : Text;

    override function config(config:luxe.AppConfig) {

        config.preload.textures.push({ id:'assets/bg_sky.png' });
        config.preload.textures.push({ id:'assets/bg_stars.png' });

        return config;

    } //config

    override function ready() {

        var ratio = Luxe.screen.w / Luxe.screen.h;

        sky = new Sprite({
            size : new Vector(Luxe.screen.w, Luxe.screen.w / ratio),
            centered : false,
            texture: Luxe.resources.texture('assets/bg_sky.png')
        });

        stars = new Sprite({
            size : new Vector(Luxe.screen.w, Luxe.screen.w / ratio),
            centered : false,
            texture: Luxe.resources.texture('assets/bg_stars.png')
        });

        mousetext = new Text({
            pos : new Vector(20,20),
            point_size : 20,
            color : new Color().rgb(0xff440b),
            text : "mouse pos :"
        });

        stars.texture.filter_min = stars.texture.filter_mag = FilterType.nearest;
        stars.texture.clamp_s = stars.texture.clamp_t = ClampType.repeat;

        Luxe.on(Luxe.Ev.windowresized, on_resize);

    } //ready

    function on_resize( _event: snow.types.Types.WindowEvent ) {

        var w = _event.x;
        var h = _event.y;
        var ratio = w / h;

        stars.size = sky.size = new Vector(w, w / ratio);
        Luxe.camera.viewport = new Rectangle(0,0,w,h);

    }

    override function onmousemove( e:MouseEvent ) {

        mousetext.text = 'mouse pos' + e.pos;

    } //onmousemove

    var fs = false;
    override function onkeyup( e:KeyEvent ) {

        if( e.keycode == Key.enter && e.mod.alt ) {
            fs = !fs;
            Luxe.snow.runtime.window_fullscreen(fs);
        }


        if(e.keycode == Key.escape) {
            Luxe.shutdown();
        }

    } //onkeyup

    override function update(dt:Float) {

        stars.uv.y -= 4 * dt;
        stars.uv.x += 8 * dt;

    } //update


} //Main
