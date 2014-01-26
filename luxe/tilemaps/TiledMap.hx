package luxe.tilemaps;

import luxe.Vector;
import luxe.Rectangle;
import luxe.tilemaps.tiled.TiledMapData;
import luxe.tilemaps.Tilemap;

typedef TiledMapOptions = {
    file : String,
    ?pos : Vector,    
    ?format : String,
    ?asset_path : String,
}

class TiledMap extends Tilemap {

    public var tiledmap_data : TiledMapData;    

    public function new( options:TiledMapOptions ) {

            //sane defaults
        if(options.format == null)      { options.format = 'xml';           }
        if(options.asset_path == null)  { options.asset_path = 'assets/';   }
        if(options.pos == null)         { options.pos = new Vector();       }

            //create the tiled map data
        tiledmap_data = new TiledMapData();

            //load the tiled map data from the file
        if(options.format == 'json') {
            tiledmap_data.parseFromJSON( haxe.Json.parse(Luxe.loadText(options.file)) );
        } else {
            var map_data = Luxe.loadText(options.file);
            if(map_data.length > 0) {
                tiledmap_data.parseFromXML( Xml.parse( map_data ) );
            } else {
                throw(options.file + " file contains no data?" );                
            }
        }

            //create the luxe tilemap 
            //from the data we are given
        super({
            x           : Std.int(options.pos.x), 
            y           : Std.int(options.pos.y), 
            w           : tiledmap_data.width,
            h           : tiledmap_data.height, 
            tile_width  : tiledmap_data.tile_width, 
            tile_height : tiledmap_data.tile_height
        }); 

            //Then load the tilesets and layers
        _load_tilesets( options );
        _load_layers( options );

            //Set the orientation
        orientation = tiledmap_data.orientation;

    } //new

    function _load_tilesets( options:TiledMapOptions ) {

        for(_tileset in tiledmap_data.tilesets) {
            
            add_tileset({

                name : _tileset.name, 
                texture : Luxe.loadTexture( options.asset_path + _tileset.texture_name),
                first_id : _tileset.first_id,
                tile_width : _tileset.tile_width,
                tile_height : _tileset.tile_height,
                spacing : _tileset.spacing,
                margin : _tileset.margin

            });

        } //for all tilesets  

    } //load_tilesets
    
    function _load_layers( options:TiledMapOptions ) {

        var layer_index : Int = 0;
        for(_layer in tiledmap_data.layers) {
                
                //add the layer
            add_layer({
                name : _layer.name, 
                layer : layer_index,
                opacity : _layer.opacity,  
                visible : _layer.visible
            });

                //create the tiles
            add_tiles_fill_by_id( _layer.name, 0 );

                //Now we iterate the layer and store the tiles id's
            var tilemap_layer : TileLayer = layers.get(_layer.name);
            var _gid_counter : Int = 0;

            for(_y in 0 ... _layer.height) {
                for(_x in 0 ... _layer.width) {
                    
                    var next_id = _layer.tiles[_gid_counter].id;
                    
                        if(next_id != 0) {
                            tilemap_layer.tiles[_y][_x].id = next_id;
                        }

                    _gid_counter++;

                } //for x
            } //for y

                //increment the index
            layer_index++;

        } //for each layer

    } //load_layers

} //TiledMap
