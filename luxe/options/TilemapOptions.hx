package luxe.options;

import phoenix.Texture;
import phoenix.Batcher;
import luxe.tilemaps.Tilemap;


typedef TilemapVisualOptions = {
    ? scale : Float,
    ? grid : Bool,
    ? batcher : Batcher,
    ? depth : Float,
    ? group : Int,
    ? filter : FilterType,
    ? no_destroy : Bool
}

typedef TilemapOptions = {
    ?x : Int,
    ?y : Int,
    w : Int,
    h : Int,
    tile_width : Int,
    tile_height : Int,
    ?orientation : TilemapOrientation
} //TilemapOptions

typedef TileOptions = {
    x: Int,
    y: Int,
    id : Int,
    layer : TileLayer
} //TileOptions

typedef TileLayerOptions = {
    name : String,
    ?opacity : Float,
    ?visible : Bool,
    ?fixed : Bool,
    ?map : Tilemap,
    ?layer : Int
} //TileLayerOptions

typedef TilesetOptions = {
    name : String,
    texture : Texture,
    tile_width : Int,
    tile_height : Int,
    ?margin : Int,
    ?spacing : Int,
    ?first_id : Int
} //TilesetOptions
