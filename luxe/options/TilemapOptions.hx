package luxe.options;

import phoenix.Texture;
import phoenix.Batcher;
import luxe.tilemaps.Tilemap;


/** Options specific to a `TilemapVisual`, part of a `Tilemap` */
typedef TilemapVisualOptions = {

    > RenderProperties,

        /** */
    @:optional var scale : Float;
        /** */
    @:optional var grid : Bool;
        /** */
    @:optional var filter : FilterType;
        /** */
    @:optional var no_destroy : Bool;

} //TilemapVisualOptions

/** Options specific to a `Tilemap` */
typedef TilemapOptions = {

        /** */
    var w : Int;
        /** */
    var h : Int;
        /** */
    var tile_width : Int;
        /** */
    var tile_height : Int;
        /** */
    @:optional var x : Int;
        /** */
    @:optional var y : Int;
        /** */
    @:optional var orientation : TilemapOrientation;

} //TilemapOptions

/** Options specific to a `Tile`, part of a `Tilemap` */
typedef TileOptions = {

        /** */
    var x: Int;
        /** */
    var y: Int;
        /** */
    var id : Int;
        /** */
    var layer : TileLayer;

    @:optional var flipx : Bool;

    @:optional var flipy : Bool;

    @:optional var angle : Int;

} //TileOptions

/** Options specific to a `TileLayer`, part of a `Tilemap` */
typedef TileLayerOptions = {

        /** */
    var name : String;
        /** */
    @:optional var opacity : Float;
        /** */
    @:optional var visible : Bool;
        /** */
    @:optional var fixed : Bool;
        /** */
    @:optional var map : Tilemap;
        /** */
    @:optional var layer : Int;
        /** */
    @:optional var properties : Map<String, String>;

} //TileLayerOptions


/** Options specific to a `Tileset`, part of a `Tilemap` */
typedef TilesetOptions = {

        /** */
    var name : String;
        /** */
    var texture : Texture;
        /** */
    var tile_width : Int;
        /** */
    var tile_height : Int;
        /** */
    @:optional var margin : Int;
        /** */
    @:optional var spacing : Int;
        /** */
    @:optional var first_id : Int;

} //TilesetOptions
