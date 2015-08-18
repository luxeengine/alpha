package luxe.importers.tiled;

import luxe.importers.tiled.TiledLayer;

class TiledTile {

    public var layer : TiledLayer;
    public var id : UInt;

    public var flip_horizontal:Bool;
    public var flip_vertical:Bool;
    public var flip_diagonal:Bool;

    @:isVar public var width (get,null) : Int;
    @:isVar public var height (get,null) : Int;

    public function new( _layer:TiledLayer, _id:UInt ) {

        layer = _layer;

        flip_horizontal = _id & 0x80000000 != 0;
        flip_vertical = _id & 0x40000000 != 0;
        flip_diagonal = _id & 0x20000000 != 0;

        id = _id & ~(0x80000000 | 0x40000000 | 0x20000000);

    } //new

//properties

    function get_width() : Int {
        return layer.map.tile_width;
    }

    function get_height() : Int {
        return layer.map.tile_height;
    }

} //TiledTile