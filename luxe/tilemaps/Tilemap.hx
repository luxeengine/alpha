package luxe.tilemaps;

import luxe.Rectangle;
import luxe.Vector;
import phoenix.Texture;

typedef TileArray = Array<Tile>;

typedef TilemapOptions = {
    ?x : Int,
    ?y : Int,
    w : Int,
    h : Int,
    tile_width : Int,
    tile_height : Int
}

enum TilemapOrientation {
    ortho;
    isometric;
    none;
}

class Tile {

    public var uuid : String;
    public var x : Int;
    public var y : Int;
    public var pos : Vector;
    public var size : Vector;

    public var layer : TileLayer;
    public var map : Tilemap;
    public var id : Int;

    public function new( _layer:TileLayer, _id:Int, _x:Int, _y:Int ) {

        uuid = Luxe.utils.uniqueid(); 
        id = _id;
        layer = _layer;
        map = _layer.map;
        y = _y;
        x = _x;

        size = new Vector( map.tile_width, map.tile_height );
        pos = new Vector( map.pos.x + (size.x * x), map.pos.y + (size.y * y) );

    }

    public function toString() {
        return "Tile: id:"+id+" layer(" + layer.name + ") coord("+x+","+y+") pos("+pos.x+","+pos.y+") size("+size.x+","+size.y+")";
    }

} //Tile


class TileLayer {

        //the depth/ordering value 
    public var layer : Int;
        //the name of the layer
    public var name : String;
        //the map this tilemap belongs to
    public var map : Tilemap;
        //array of array of tiles
    public var tiles : Array<TileArray>;
        //layer properties
    public var properties : Map<String,String>;

    public function new( _map:Tilemap, _name:String, _layer:Int = 0 ) {

        layer = _layer;
        name = _name;
        map = _map;
        tiles = [];
        properties = new Map();

    } //new

} //TileLayer

class Tileset {
    
    public var texture : Texture;
    public var name : String;
    public var first_id : Int;
    public var tile_width : Int;
    public var tile_height : Int;

    public function new( _name:String = '', _texture:Texture, _tile_width:Int, _tile_height:Int, _first_id : Int = 1 ) {        

        if(_texture == null) {
            throw "Tileset requires a texture that is not null";
        }

        name = _name;
        texture = _texture;
        first_id = _first_id;
        tile_width = _tile_width;
        tile_height = _tile_height;

    } //new

        //Returns a Point which specifies the position of the gid in this tileset (Not in pixels!)
    public function pos_in_texture(_id:Int):Vector {

        var tileid = _id - first_id;
        return new Vector(texture_x(tileid), texture_y(tileid));

    } //pos_in_texture

        //Returns the inner x-position of a texture with given _id
    public function texture_x(_id:Int):Int {
        return (_id % Std.int(texture.width / tile_width));
    } //texture_x
    
        //Returns the inner y-position of a texture with given _id
        //todo : Is this making an assumption about the height of a tile?
    public function texture_y(_id):Int {
        return Std.int(_id / Std.int(texture.width / tile_width));
    } //texture_y

} //Tileset

class Tilemap {

        //the layers the map consists of
    public var layers : Map<String,TileLayer>;
    public var layers_ordered : Array<TileLayer>;

        //tilesets associated with this map
    public var tilesets : Map<String,Tileset>;
        //key:value property list for this tilemap
    public var properties : Map<String,String>;

        //the orientation if any of this map
    public var orientation : TilemapOrientation;
        //the position of the tilemap in world space
    public var pos : Vector;
        //the size of the tiles in this map
    public var tile_width : Int = 0;
    public var tile_height : Int = 0;    
        //the sizes of the layer
    public var width : Int = 0;
    public var height : Int = 0;

        //the total width of the layer
    @:isVar public var total_width (get,null) : Int = 0;
    @:isVar public var total_height (get,null) : Int = 0;
    @:isVar public var bounds (get,null) : Rectangle;

    public function new( options:TilemapOptions ) {

        width = options.w;
        height = options.h;
        tile_width = options.tile_width;
        tile_height = options.tile_height;

        if(options.x != null && options.y != null ) {
            pos = new Vector(options.x,options.y);
        } else {
            pos = new Vector();
            if(options.x != null) { pos.x = options.x; }
            if(options.y != null) { pos.y = options.y; }
        }

        orientation = TilemapOrientation.none;

        properties = new Map<String,String>();        
        tilesets = new Map<String,Tileset>();
        layers = new Map<String,TileLayer>();
        layers_ordered = [];

    } //new

        //If the position is inside the map or not
    public function inside( x:Int, y:Int ) : Bool {
        
        if(width == 0 || height == 0) {
            return false;
        }

        if( y > height-1 ) {
            return false;
        }

        if( x > width-1 ) {
            return false;
        }

        return true;

    } //inside

    public function tile_at_pos( layer_name:String, worldpos:Vector ) {
        trace("base Tilemap has no way of calculating the tile position");
        return null;
    }

    public function layer( layer_name:String ) {
        return layers.get( layer_name );
    }

        //return a tile from a layer, in tile coordinates
    public function tile_at( layer_name:String, x:Int, y:Int ) {

        if( inside(x,y) ) {
            var _layer = layers.get(layer_name);
            if(_layer != null) {
                return _layer.tiles[y][x];
            } else {
                trace("No tile layer called '" + layer_name + "' for tile_at " + x + "," + y);
                return null;
            }
        } else { //if inside
            // trace("Tile is outside the map bounds for tile_at " + x + "," + y );
            return null;
        }

    } //tile_at

    public function iterator() : Iterator<TileLayer> {
        return layers_ordered.iterator();
    } //iterator

    public function add_tileset( name:String, texture:Texture, first_id:Int=0 ) {

        var tileset = new Tileset( name, texture, tile_width, tile_height, first_id );
            tilesets.set( name, tileset );

        return tileset;

    } //add_tileset

    function _sort_layers( a:TileLayer,b:TileLayer ) {
        if(a.layer < b.layer) return -1;
        if(a.layer >= b.layer) return 1;
        return 1;
    } //_sort_layers

    function sort_layers() {
        layers_ordered.sort( _sort_layers );
    } //sort_layers

    public function tileset_from_id( _id:Int ) {
        var tileset:Tileset = null;

        for(t in this.tilesets) {
            if(_id >= t.first_id) {
                tileset = t;
            }
        }

        return tileset;
    } //tileset_from_id

    public function add_layer( _name:String, _layer:Int=0 ) {
        
        var new_layer = new TileLayer( this, _name, _layer );

            layers.set(_name, new_layer);

            layers_ordered.push( new_layer );
            sort_layers();

        return new_layer;

    } //add_layer

    public function add_tiles_fill_by_id( layer_name:String, _tileid:Int = 0 ) {

        var _layer = layers.get(layer_name);

        if(_layer != null) {

            _layer.tiles = null;
            _layer.tiles = [];

            for(y in 0 ... height) {

                var _tile_row = [];
                for(x in 0 ... width) {

                    var _tile = new Tile( _layer, _tileid, x, y );

                    _tile_row.push(_tile);

                } //for each tile

                _layer.tiles.push(_tile_row);

            } //for each row

        } else {//layer != null
            trace("No tile layer called '" + layer_name + "' for add_tiles_fill_by_id");
        }

    } //add_tiles_fill_by_id

        //this will destroy previous tiles (use set to change them)
    public function add_tiles_from_grid( layer_name:String, grid:Array< Array<Int> > ) {

        if(grid.length != height) {
            throw "add_tiles_from_grid requires a grid of integers the same size as the tilemap! height != grid.length";
        } //grid.length != height

        if(grid.length != 0) {
            if(grid[0].length != width) {
                throw "add_tiles_from_grid requires a grid of integers the same size as the tilemap! width != grid[0].length";
            }
        } //grid.length != 0

        var _layer = layers.get(layer_name);
        if(_layer != null) {

            _layer.tiles = null;
            _layer.tiles = [];
            
            for(y in 0 ... height) {

                var _tile_row = [];
                for(x in 0 ... width) {

                    var tileid = grid[y][x];
                    var _tile = new Tile( _layer, tileid, x, y );

                    _tile_row.push(_tile);

                } //for each tile

                _layer.tiles.push(_tile_row);

            } //for each row

        } else {//layer != null
            trace("No tile layer called '" + layer_name + "' for add_tiles_from_grid");
        }

    } //add_tiles_from_grid

    function get_total_width() : Int {
        return width * tile_width;
    } //get_total_width

    function get_total_height() : Int {
        return height * tile_height;
    } //get_total_height

    function get_bounds() : Rectangle {
        return new Rectangle( pos.x, pos.y, pos.x+total_width, pos.y + total_height );
    } //get_bounds

} // Tilemap
