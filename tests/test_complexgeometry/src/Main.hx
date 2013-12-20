
import luxe.Color;
import luxe.Rectangle;
import luxe.Vector;
import luxe.Input;
import phoenix.geometry.ComplexGeometry;


typedef MapTile = {
    quad:String,
    tilex : Int,
    tiley : Int
};

class Main extends luxe.Game {

    var geom : ComplexGeometry;
    var big_quad : String;
    var mouse_quad : String;
    var next_anim:Float = 1;
    var rowx : Int = 0;
    var rowy : Int = 0;

    var anim_delay : Float = 1;
    var mapw : Int = 60;
    var maph : Int = 40;
    var loaded : Bool = false;

    var map_tiles : Array< Array<MapTile> >;

    public function ready() {

        geom = new phoenix.geometry.ComplexGeometry({
            texture : Luxe.loadTexture('assets/tileset.png')
        });

        geom.texture.filter = phoenix.Texture.FilterType.nearest;

        geom.texture.onload = function(t) {

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
            
                //add to the renderer
            Luxe.addGeometry( geom );

            next_anim = haxe.Timer.stamp() + anim_delay;

            // geom.locked = true;

            loaded = true;
        }   


    } //ready


    public function random_int(max:Int) {
        return Math.floor(max*Math.random());
    }//random_int

    public function create_map() {
        map_tiles = new Array< Array<MapTile> >();

        for(_y in 0 ... maph) {
            var _row = new Array<MapTile>();
            for(_x in 0 ... mapw) {

                var map_x = _x * 16;
                var map_y = _y * 16;
                var _quad = geom.quad_add({x:map_x, y:map_y, w:16, h:16});
                var _tilex = random_int(13);
                var _tiley = random_int(5);

                geom.quad_uv(_quad, new Rectangle((_tilex * 16),(_tiley * 16), 16, 16) );

                _row.push( { quad:_quad, tilex:_tilex, tiley:_tiley } );

            } //_x
            map_tiles.push(_row);
        } //_y
    } //create_map
  
    public function onmousemove(e) {
        // geom.quad_pos( mouse_quad, new Vector(e.x-32, e.y-32) );
    }

    public function onkeyup(e) {
        
        if(e.value == Input.Keys.escape) {
            Luxe.shutdown();
        } //escape

    } //onkeyup

    public function update(dt:Float) {

        if(!loaded) return;

            //animate the tile
        if(haxe.Timer.stamp() > next_anim) {
            next_anim = haxe.Timer.stamp() + anim_delay;
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

    public function destroy() {



    } //destroy
}


