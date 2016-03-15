
import luxe.States;
import luxe.Input;
import luxe.Rectangle;
import luxe.Log.log;

import phoenix.geometry.QuadPackGeometry;
import phoenix.Texture.FilterType;

typedef MapTile = {
    quad : Int,
    tilex : Int,
    tiley : Int
}

class TileView extends State {

    var root : Parrott;

    var geom : QuadPackGeometry;
    var map_tiles : Array< Array<MapTile> >;

    public function new( _root:Parrott ) {

            //sets the name for the state in the machine
        super({name:'tileview'});

            //store the reference to our parent for access to the state machine
        root = _root;

    } //new


    override function onenter<T>( ignored:T ) {

        log('onenter tileview');

        geom = new phoenix.geometry.QuadPackGeometry({
            texture : Luxe.resources.texture('assets/tileset.png'),
            batcher : Luxe.renderer.batcher
        });

        geom.texture.filter_min = geom.texture.filter_mag = FilterType.nearest;
        geom.locked = true;

        create_map();

    } //onenter

    function create_map() {

        map_tiles = [];

        var tile_texture_w = 16;
        var tile_size = 16;
        var tilecx : Int = Math.ceil(Luxe.screen.w / tile_size);
        var tilecy : Int = Math.ceil(Luxe.screen.h / tile_size);

        for(_y in 0 ... tilecy) {

            var _row:Array<MapTile> = [];
            for(_x in 0 ... tilecx) {

                var map_x = _x * tile_size;
                var map_y = _y * tile_size;
                var _quad = geom.quad_add({x:map_x, y:map_y, w:tile_size, h:tile_size});

                var _tilex = Std.random(13);
                var _tiley = Std.random(5);

                geom.quad_uv(_quad, new Rectangle((_tilex * tile_texture_w),(_tiley * tile_texture_w), tile_texture_w, tile_texture_w) );

                _row.push( { quad:_quad, tilex:_tilex, tiley:_tiley } );

            } //_x

            map_tiles.push(_row);

        } //_y

    } //create_map


    override function onkeyup( event:KeyEvent ) {

        if( event.keycode == Key.key_t ) {

            if(!root.state.enabled('textview')) {
                root.state.enable('textview');
            } else {
                root.state.disable('textview');
            }

        } //key_t

    } //onkeyup


} //TileView
