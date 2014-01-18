package luxe.tilemaps;

import luxe.Vector;
import luxe.Rectangle;
import luxe.tilemaps.tiled.TiledMap;
import luxe.tilemaps.Tilemap;
import luxe.tilemaps.Ortho;

class TiledOrtho extends Ortho {

    public var display : OrthoDisplay;
    public var tiledmap : TiledMap;

    public function new( _tmx_asset_name:String ) {

        tiledmap = new TiledMap();
        tiledmap.parseFromXML( Xml.parse(Luxe.loadText(_tmx_asset_name)) );

        super({
            x:128, y:0, 
            w:tiledmap.width,  h:tiledmap.height, 
            tile_width:tiledmap.tile_width, 
            tile_height:tiledmap.tile_height
        }); 

            //load the tilesets
        for(_tileset in tiledmap.tilesets) {
            var new_tileset = add_tileset( _tileset.name, Luxe.loadTexture('assets/' + _tileset.texture_name) );
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