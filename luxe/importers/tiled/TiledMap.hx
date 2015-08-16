package luxe.importers.tiled;

import luxe.Log.*;
import luxe.Vector;
import luxe.Rectangle;
import luxe.importers.tiled.TiledMapData;

import luxe.tilemaps.Tilemap;

typedef TiledMapOptions = {
    tiled_file_data : String,
    ?pos : Vector,
    ?format : String,
    ?asset_path : String
}

class TiledMap extends Tilemap {

    public var tiledmap_data : TiledMapData;

    public function new( options:TiledMapOptions ) {

            //sane defaults
        def(options.format, 'xml');
        def(options.asset_path, 'assets/');
        def(options.pos, new Vector());

        if(options.tiled_file_data == null || options.tiled_file_data.length == 0) {
            throw 'TiledMap handed invalid file data, pass the text contents of the tmx/json file';
        }

            //create the tiled map data
        tiledmap_data = new TiledMapData();

            //load the tiled map data from the file
        if(options.format == 'json') {
            tiledmap_data.parseFromJSON( haxe.Json.parse( options.tiled_file_data ) );
        } else {
            tiledmap_data.parseFromXML( Xml.parse( options.tiled_file_data ) );
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

            var _tileset_id = haxe.io.Path.join([options.asset_path,_tileset.texture_name]);

            _debug('loading $_tileset_id');

            add_tileset({

                name : _tileset.name,
                texture : Luxe.resources.texture(_tileset_id),
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

            var _layer_properties:Map<String,String> = new Map();

            for(_prop in _layer.properties.keys()) {
                _layer_properties.set(_prop, _layer.properties.get(_prop));
            }

                //add the layer
            add_layer({
                name : _layer.name,
                layer : layer_index,
                opacity : _layer.opacity,
                visible : _layer.visible,
                properties : _layer_properties,
            });

                //create the tiles
            add_tiles_fill_by_id( _layer.name, 0 );

                //Now we iterate the layer and store the tiles id's
            var tilemap_layer : TileLayer = layers.get(_layer.name);
            var _gid_counter : Int = 0;

            for(_y in 0 ... _layer.height) {
                for(_x in 0 ... _layer.width) {

                    var _layer_tile = _layer.tiles[_gid_counter];

                        if(_layer_tile.id != 0) {
                            var tile = tilemap_layer.tiles[_y][_x];
                            tile.id = _layer_tile.id;
                            tile.flipx = _layer_tile.flip_horizontal;
                            tile.flipy = _layer_tile.flip_vertical;
                            if(_layer_tile.flip_diagonal) {
                                tile.angle = 90;
                                tile.flipx = !tile.flipx;
                            }
                        }

                    _gid_counter++;

                } //for x
            } //for y

                //increment the index
            layer_index++;

        } //for each layer

    } //load_layers

} //TiledMap
