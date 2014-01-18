package luxe.tilemaps;

import luxe.Vector;
import luxe.Rectangle;
import luxe.tilemaps.tiled.TiledMap;
import luxe.tilemaps.Tilemap;
import luxe.tilemaps.Ortho;

typedef TiledMapOptions = {
    file : String,
    ?pos : Vector,    
    ?format : String,
    ?asset_path : String,
}

class TiledOrtho extends Ortho {

    public var display : OrthoDisplay;
    public var tiledmap : TiledMap;

    public function new( options:TiledMapOptions ) {

        var format : String = 'xml';

        if(options.format == 'json') {
            format = 'json';
        }

        tiledmap = new TiledMap();
        if(format == 'json') {
            tiledmap.parseFromJSON( haxe.Json.parse(Luxe.loadText(options.file)) );
        } else {
            tiledmap.parseFromXML( Xml.parse(Luxe.loadText(options.file)) );
        }

        var _pos_x : Int = 0;
        var _pos_y : Int = 0;

        if(options.pos != null) {
            _pos_x = Std.int(options.pos.x);
            _pos_y = Std.int(options.pos.y);
        }

        super({
            x:_pos_x, y:_pos_y, 
            w:tiledmap.width,  h:tiledmap.height, 
            tile_width:tiledmap.tile_width, 
            tile_height:tiledmap.tile_height
        }); 

        if(options.asset_path == null) {
            options.asset_path = 'assets/';
        }

            //load the tilesets
        for(_tileset in tiledmap.tilesets) {
            var new_tileset = add_tileset( _tileset.name, Luxe.loadTexture(options.asset_path + _tileset.texture_name) );
                new_tileset.first_id = _tileset.first_id;
                new_tileset.tile_width = tiledmap.tile_width;
                new_tileset.tile_height = tiledmap.tile_height;
        }

            //load the layers
        var layer_index : Int = 0;
        for(_layer in tiledmap.layers) {
                
                //add the layer
            add_layer(_layer.name, layer_index );            
                //create the tiles
            add_tiles_fill_by_id( _layer.name, 0 );

            var tilemap_layer : TileLayer = layers.get(_layer.name);
            var _gid_counter : Int = 0;
            for(_y in 0 ... _layer.height) {
                for(_x in 0 ... _layer.width) {
                    
                    var next_id = _layer.tiles[_gid_counter].id;
                    
                        if(next_id != 0) {
                            tilemap_layer.tiles[_y][_x].id = next_id;
                        }

                    _gid_counter++;

                }
            }

                //increment the index
            layer_index++;
        }

        display = new OrthoDisplay( this, { scale:4 } );

    }


}