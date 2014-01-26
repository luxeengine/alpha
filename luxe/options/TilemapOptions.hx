package luxe.options;

import phoenix.Texture;
import luxe.tilemaps.Tilemap;

typedef TilemapOptions = {
    ?x : Int,
    ?y : Int,
    w : Int,
    h : Int,
    tile_width : Int,
    tile_height : Int,
    ?orientation : TilemapOrientation
}

typedef TileOptions = {
    x: Int,
    y: Int,
    id : Int,
    layer : TileLayer
}

typedef TileLayerOptions = {
    name : String,
    ?opacity : Float,
    ?visible : Bool,
    ?map : Tilemap,
    ?layer : Int
}

typedef TilesetOptions = {
    name : String,
    texture : Texture,
    tile_width : Int,
    tile_height : Int,
    ?margin : Int,
    ?spacing : Int,
    ?first_id : Int
};