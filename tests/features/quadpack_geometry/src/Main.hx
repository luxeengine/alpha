
import luxe.Color;
import luxe.Rectangle;
import luxe.Vector;
import luxe.Input;
import phoenix.geometry.QuadPackGeometry;


typedef MapTile = {
    quad : Int,
    tilex : Int,
    tiley : Int
};

class Main extends luxe.Game {


    var geom : QuadPackGeometry;
    var big_quad : Int;
    var mouse_quad : Int;
    var next_anim:Float = 1;
    var rowx : Int = 0;
    var rowy : Int = 0;

    var anim_delay : Float = 1;
    var mapw : Int = 60;
    var maph : Int = 40;

    var map_tiles : Array< Array<MapTile> >;

    override function config(config:luxe.AppConfig) {

        config.preload.textures.push({ id:'assets/tileset.png' });

        return config;

    } //config

    override function ready() {

        geom = new phoenix.geometry.QuadPackGeometry({
            texture : Luxe.resources.texture('assets/tileset.png'),
            batcher : Luxe.renderer.batcher
        });

        geom.texture.filter_min = geom.texture.filter_mag = phoenix.Texture.FilterType.nearest;

        create_map();

        var quad1 = geom.quad_add({
            x: 100, y:100,
            w: 64,  h:64
        });

        mouse_quad = geom.quad_add({
            x: 100, y:100,
            w: 64,  h:64
        });

        big_quad = geom.quad_add({
            x: 100, y:100,
            w: 64,  h:64
        });

            //move it over
        geom.quad_pos( quad1, new Vector(960 - 64,200) );
            //color it
        geom.quad_color( quad1, new Color(0,0,0,1).rgb(0xf6007b) );
            //but just the alpha
        geom.quad_alpha( quad1, 0.5 );
            //add second quad
        geom.quad_color( mouse_quad, new Color(0.5,0.8,1,1) );
        geom.quad_pos( mouse_quad, new Vector(128, 0) );

        geom.quad_resize( big_quad, new Rectangle(64,64,64,64) );
        geom.quad_uv( big_quad, new Rectangle(112, 48, 16, 16));
        geom.quad_uv(mouse_quad, new Rectangle(64, 32, 16, 16));

        next_anim = Luxe.time + anim_delay;

        geom.locked = true;

    } //ready

    function random_int( max:Int ) {

        return Math.floor(max*Math.random());

    }//random_int

    function create_map() {

        map_tiles = [];

        var tilew = 16;
        var tilecx : Int = Std.int(Luxe.screen.w / tilew);
        var tilecy : Int = Std.int(Luxe.screen.h / tilew);

        for(_y in 0 ... tilecy) {
            var _row:Array<MapTile> = [];
            for(_x in 0 ... tilecx) {

                var map_x = _x * tilew;
                var map_y = _y * tilew;
                var _quad = geom.quad_add({x:map_x, y:map_y, w:tilew, h:tilew});
                var _tilex = random_int(13);
                var _tiley = random_int(5);

                geom.quad_uv(_quad, new Rectangle((_tilex * tilew),(_tiley * tilew), tilew, tilew) );

                _row.push( { quad:_quad, tilex:_tilex, tiley:_tiley } );

            } //_x
            map_tiles.push(_row);
        } //_y
    } //create_map

    override function onmousemove( e:MouseEvent ) {
        // geom.quad_pos( mouse_quad, new Vector(e.x-32, e.y-32) );
    } //onmousemove

    override function onkeyup( e:KeyEvent ) {

        if(e.keycode == Key.escape) {
            Luxe.shutdown();
        } //escape

    } //onkeyup

    override function update(dt:Float) {

            //animate the tile
        if(Luxe.time > next_anim) {
            next_anim = Luxe.time + anim_delay;
            geom.quad_uv( big_quad, new Rectangle( (rowx * 16), (rowy * 16), 16, 16));
            rowx++;
            if(rowx == 14) {
                rowy++; rowx = 0;
                if(rowy == 6) {
                    rowy = 0;
                }
            }
        }

    } //update


} //Main
