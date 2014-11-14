package luxe.tilemaps;

import luxe.Rectangle;
import luxe.Vector;
import phoenix.geometry.QuadGeometry;
import phoenix.Texture;
import phoenix.geometry.Geometry;

import luxe.tilemaps.Ortho.OrthoVisual;
import luxe.tilemaps.Isometric.IsometricVisual;

import luxe.options.TilemapOptions;

typedef TilemapVisualLayerGeometry = Array< Array<Geometry> >;

class TilemapVisual {

    public var geometry : Map<String, TilemapVisualLayerGeometry>;
    public var map : Tilemap;
    public var options : TilemapVisualOptions;

    public function new( _map:Tilemap, _options:TilemapVisualOptions ) {

        geometry = new Map();
        map = _map;
        options = _options;

        default_options();

        create();

    } //new

    public function create() {

        if(options.no_destroy == null) {
            destroy();
            geometry = new Map();
        }

        //implemented in subclass

    } //create

    function default_options() {

        if(options.batcher == null)     options.batcher = Luxe.renderer.batcher;
        if(options.depth == null)       options.depth = 0.0;
        if(options.group == null)       options.group = 0;
        if(options.scale == null)       options.scale = 1;
        if(options.grid == null)        options.grid = false;

    } //default_options

    function create_tile_for_layer( layer:TileLayer, x:Int, y:Int, ?_scale:Float=1, ?_filter:FilterType  ) : QuadGeometry {

        //implemented in subclass
        return null;

    } //create_tile_for_layer

    public function refresh_tile_id( _layer_name:String, _x:Int, _y:Int, _id:Int ) {

        var _geom_layer : Array< Array<Geometry> > = geometry.get( _layer_name );
        if(_geom_layer != null) {

                //we need to know if the _x/_y fits inside the map because
                //if the geometry is actually null, we need to create it first
            if(map.inside(_x,_y)) {

                var _geom : QuadGeometry = cast _geom_layer[_y][_x];

                    //null geometry means the tile was either destroyed
                    //or created at 0 gid, which means we can create it now
                if(_geom == null) {

                        //don't create blank tiles, ever
                    if(_id != 0) {

                            //create the geometry, this sets the uv's also
                        _geom = create_tile_for_layer(map.layer(_layer_name), _x, _y);
                            //store it back in the tilemap
                        _geom_layer[_y][_x] = _geom;

                    } //id != 0

                } else {

                    //if we have a geometry and the new id is 0, we should kill the geometry
                    if(_id == 0) {

                        _geom.drop();
                        _geom = null;
                        _geom_layer[_y][_x] = null;

                    } else { //id == 0

                        //now we know the geometry is there, we just set it's uv's
                        var tileset = map.tileset_from_id( _id );
                        var image_coord = tileset.pos_in_texture( _id );

                        _geom.uv(
                            new Rectangle(
                                tileset.margin + ((image_coord.x * tileset.tile_width) + (image_coord.x * tileset.spacing)),
                                tileset.margin + ((image_coord.y * tileset.tile_height) + (image_coord.y * tileset.spacing)),
                                tileset.tile_width,
                                tileset.tile_height
                            ) //Rectangle
                        ); //uv

                    } // id == 0 else

                } // geom == null else

            } else { //inside
                trace("cannot refresh tile " + _x + "," + _y + " because the coords were out of the map width/height : " + _layer_name + " and " + map.width + "," + map.height );
            }

        } else {
            trace("cannot refresh tile " + _x + "," + _y + " because layer was not found : " + _layer_name );
        }

    } //refresh_tile_id

    public function destroy( ) {

        if(geometry != null) {
            for(layer in geometry) {
                for(row in layer) {
                    for(tile in row) {
                        tile.drop();
                    } //tile
                } //row
            } //layer
        } //!null

        geometry = null;

    } //destroy

} //TilemapVisual

class Tile {

    public var uuid : String;
    public var x : Int;
    public var y : Int;
    public var pos : Vector;
    public var size : Vector;

    public var layer : TileLayer;
    public var map : Tilemap;

    @:isVar public var id (default, set) : Int = 0;

    public function new( options : TileOptions ) {

        uuid = Luxe.utils.uniqueid();
        id = options.id;
        layer = options.layer;
        map = options.layer.map;

        x = options.x;
        y = options.y;

            //size is dependent on the tileset
        var _tileset = map.tileset_from_id( id );
            //but only if it can find it (i.e 0 tile id)
        if(_tileset != null) {
            size = new Vector( _tileset.tile_width, _tileset.tile_height );
        } else {
            size = new Vector( map.tile_width, map.tile_height );
        }

        pos = new Vector( map.pos.x + (size.x * x), map.pos.y + (size.y * y) );

    } //new

    function toString() {
        return 'Tile: id:$id x,y:$x,$y layer(${layer.name}) coord($x,$y) pos(${pos.x},${pos.y}) size(${size.x},${size.y})';
    }

    function set_id( _id:Int ) {

            //update first, so
            //visual have the latest
            //values
        id = _id;

        if(map != null) {
            if(map.visual != null) {
                map.visual.refresh_tile_id( layer.name, x, y, _id );
            }
        }

        return id;

    } //set_id

} //Tile


class TileLayer {

    //the depth/ordering value
    public var layer : Int;
        //the unique id of the layer
    public var id : String;
        //the name of the layer
    public var name : String;
        //the name of the layer
    public var opacity : Float = 1.0;
        //the name of the layer
    public var visible : Bool = true;
        //the map this tilemap belongs to
    public var map : Tilemap;
        //array of array of tiles
    public var tiles : Array<TileArray>;
        //layer properties
    public var properties : Map<String,String>;

    public function new( options:TileLayerOptions ) {

        if(options.map == null) {
            throw "TileLayer requires a Tilemap passed into the options, as map:Tilemap";
        }

            //required options
        id = Luxe.utils.uniqueid();
        name = options.name;
        map = options.map;
            //optional layer index
        layer = (options.layer == null) ? 0 : options.layer;
        opacity = (options.opacity == null) ? 1.0 : options.opacity;
        visible = (options.visible == null) ? true : options.visible;

        tiles = [];
        properties = new Map();

    } //new

} //TileLayer


class Tileset {

    public var texture : Texture;
    public var name : String;
    public var first_id : Int = 1;
    public var tile_width : Int = 0;
    public var tile_height : Int = 0;
        //the image margin
    public var margin : Int = 0;
        //the tile spacing
    public var spacing : Int = 0;

    public function new( options:TilesetOptions ) {

        if(options == null) {
            throw "Tileset requires a non-null options on new()";
        }

        if(options.texture == null) {
            throw "Tileset requires a texture that is not null";
        }

        name = options.name;
        texture = options.texture;
        tile_width = options.tile_width;
        tile_height = options.tile_height;

        first_id    = (options.first_id == null) ? 1 : options.first_id;
        margin      = (options.margin   == null) ? 0 : options.margin;
        spacing     = (options.spacing  == null) ? 0 : options.spacing;

    } //new

    function toString() : String {
        return "Tileset; " + name + " tw(" + tile_width + ") th(" + tile_height + ") first_id(" + first_id + ") margin(" + margin + ") spacing(" + spacing + ")";
    }

        //Returns a Vector which specifies the position of the gid in this tileset (Not in pixels!)
    public function pos_in_texture(_id:Int):Vector {

        var tileid = _id - first_id;
        return new Vector( texture_x(tileid), texture_y(tileid) );

    } //pos_in_texture

        //Returns the inner x-position of a texture with given _id
    public function texture_x(_id:Int):Int {
        var _tx = Std.int(texture.width / tile_width);
        return _tx == 0 ? 0 : (_id % _tx);
    } //texture_x

        //Returns the inner y-position of a texture with given _id
        //:todo : Is this making an assumption about the height of a tile?
    public function texture_y(_id):Int {

        var _ty = Std.int(texture.width / tile_width);
        return _ty == 0 ? 0 : Std.int(_id / _ty);

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
        //the visual representation if any of this map
    public var visual : TilemapVisual;

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

        orientation = (options.orientation == null) ? TilemapOrientation.none : options.orientation;

        properties = new Map<String,String>();
        tilesets = new Map<String,Tileset>();
        layers = new Map<String,TileLayer>();
        layers_ordered = [];

    } //new

    public function display( options:TilemapVisualOptions ) {

        switch(orientation) {
            case TilemapOrientation.ortho :
                visual = new OrthoVisual( this, options );
            case TilemapOrientation.isometric :
                visual = new IsometricVisual( this, options );
            case TilemapOrientation.none :
        } //orientation

    } //display

        //If the position is inside the map or not
    public function inside( x:Int, y:Int ) : Bool {

        if(width == 0 || height == 0) {
            return false;
        }

        if( x < 0) {
            return false;
        }

        if( y < 0 ) {
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

    public function tile_pos( layer_name:String, x:Int, y:Int, ?offset_x:TileOffset, ?offset_y:TileOffset ) {

        if(inside(x,y)) {

            switch(orientation) {

                case TilemapOrientation.ortho: {
                    var _worldpos = Ortho.tile_coord_to_worldpos(x, y, tile_width, tile_height, offset_x, offset_y );
                    return _worldpos.add( pos );
                }

                case TilemapOrientation.isometric: {
                    var _worldpos = Isometric.tile_coord_to_worldpos(x, y, tile_width, tile_height, offset_x, offset_y );
                    return _worldpos.add( pos );
                }

                default: {

                }

            } //switch orientation

        } //inside

        return new Vector();

    } //tile_pos

    public function tile_at_pos( layer_name:String, worldpos:Vector, ?_scale:Float = 1.0 ) {

        switch(orientation) {

            case TilemapOrientation.ortho: {

                var _tile_pos = Ortho.worldpos_to_tile_coord( worldpos.x - pos.x, worldpos.y - pos.y, Math.floor(tile_width*_scale), Math.floor(tile_height*_scale) );
                return tile_at( layer_name, Math.floor(_tile_pos.x), Math.floor(_tile_pos.y) );

            } //ortho

            case TilemapOrientation.isometric: {

                var _tile_pos = Isometric.worldpos_to_tile_coord( worldpos.x - pos.x, worldpos.y - pos.y, Math.floor(tile_width*_scale), Math.floor(tile_height*_scale) );
                return tile_at( layer_name, Math.floor(_tile_pos.x), Math.floor(_tile_pos.y) );

            } //isometric

            default: {

            }

        } //switch orientation

        return null;

    } //tile_at_pos

    public function worldpos_to_map( worldpos:Vector, ?_scale:Float = 1.0 ) {

         switch(orientation) {

            case TilemapOrientation.ortho: {
                return Ortho.worldpos_to_tile_coord( worldpos.x - pos.x, worldpos.y - pos.y, Math.floor(tile_width*_scale), Math.floor(tile_height*_scale) );
            }

            case TilemapOrientation.isometric: {
                return Isometric.worldpos_to_tile_coord( worldpos.x - pos.x, worldpos.y - pos.y, Math.floor(tile_width*_scale), Math.floor(tile_height*_scale) );
            }

            default:{}

        } //switch orientation

        return null;

    } //worldpos_to_map

    public function layer( layer_name:String ) {
        return layers.get( layer_name );
    }

    public function tileset( layer_name:String ) {
        return tilesets.get( layer_name );
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

    public function add_tileset( options:TilesetOptions ) {

        var tileset = new Tileset( options );

           tilesets.set( tileset.name, tileset );

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

        var max : Int = 0;
        for(t in this.tilesets) {
            if(_id >= t.first_id && t.first_id >= max) {
                max = t.first_id;
                tileset = t;
            }
        }

        return tileset;

    } //tileset_from_id

        //to remove the tile we can set the id to 0
    public function remove_tile( layer_name:String, x:Int, y:Int ) : Bool {

        if(inside(x,y)) {

            var _layer = layer(layer_name);
            if(_layer != null) {
                _layer.tiles[y][x].id = 0;
            }

        }

        return false;

    } //remove_tile

    public function remove_tileset( name:String, _destroy_textures:Bool = false ) : Bool {

        var _tileset = tileset(name);

            if(_tileset != null && _destroy_textures) {
                _tileset.texture.destroy();
            }

        return tilesets.remove( name );

    } //remove_tileset

    public function remove_layer( name:String ) : Bool {

        var _layer = layer(name);

            if(_layer != null) {
                layers_ordered.remove( _layer );
            }

        return layers.remove( name );

    } //remove_layer

    public function add_layer( options:TileLayerOptions ) {

        if(options.map == null) options.map = this;

        var new_layer = new TileLayer( options );

                //store in the named layer map
            layers.set( new_layer.name, new_layer );
                //store in the ordered list as well
            layers_ordered.push( new_layer );
                //and sort the list
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

                    var _tile = new Tile({
                        layer : _layer,
                        id : _tileid,
                        x : x,
                        y : y
                    });

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
                    var _tile = new Tile({
                        layer : _layer,
                        id : tileid,
                        x : x,
                        y : y
                    });

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


 //Additional defines

enum TilemapOrientation {
    ortho;
    isometric;
    none;
}


enum TileOffset {
    center;
    top;
    bottom;
    left;
    right;
}

typedef TileArray = Array<Tile>;

