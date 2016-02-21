package luxe.tilemaps;

import luxe.Log.*;
import luxe.Vector;
import luxe.Rectangle;
import luxe.options.TilemapOptions;
import luxe.tilemaps.Ortho.OrthoVisual;
import luxe.tilemaps.Isometric.IsometricVisual;

import phoenix.Texture;
import phoenix.geometry.Geometry;

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

        if(options.no_destroy != null && options.no_destroy != true) {
            destroy();
            geometry = new Map();
        }

        //implemented in subclass

    } //create

    public function geometry_for_tile( _layer:String, x:Int, y:Int ) : Geometry {

        if(!geometry.exists(_layer)) {
            log('visual / geometry_for_layer / $_layer does not exist in tilemap visual');
            return null;
        }

        var geomlayer = geometry_for_layer(_layer);

        return geomlayer[y][x];

    } //geometry_for_tile

    public function geometry_for_layer( _layer:String ) : TilemapVisualLayerGeometry {

        if(!geometry.exists(_layer)) {
            log('visual / geometry_for_layer / $_layer does not exist in tilemap visual');
        }

        return geometry.get(_layer);

    } //geometry_for_layer

    function default_options() {

        def(options.batcher, Luxe.renderer.batcher);
        def(options.depth, 0.0);
        def(options.scale, 1);
        def(options.grid, false);
        def(options.filter, FilterType.nearest);

    } //default_options

    function create_tile_for_layer( layer:TileLayer, x:Int, y:Int ) : Geometry {

        //implemented in subclass
        return null;

    } //create_tile_for_layer

    function update_tile_id( _geom:Geometry, _layer_name:String, _x:Int, _y:Int, _id:Int, _flipx:Bool, _flipy:Bool, _angle:Int ) {

        //implemented in subclass

    } //update_tile_id

        /** Update the visual to match a new tile id at a given coordinate.
            This is called automatically when you set a `Tile` ID in a map, if it has a visual assigned. 
            _angle has to be a multiple of 90 */
    public function refresh_tile_id( _layer_name:String, _x:Int, _y:Int, _id:Int, _flipx:Bool = false, _flipy:Bool = false, _angle:Int = 0) {

        var _tile_layer = map.layer(_layer_name);
        var _geom_layer = geometry_for_layer(_layer_name);

        if(_geom_layer != null) {

                //we need to know if the _x/_y fits inside the map because
                //if the geometry is actually null, we need to create it first
            if(map.inside(_x,_y)) {

                var _geom = _geom_layer[_y][_x];

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

                        update_tile_id(_geom, _layer_name, _x, _y, _id, _flipx, _flipy, _angle);

                    } // id == 0 else

                } // geom == null else

            } else { //inside
                trace("cannot refresh tile " + _x + "," + _y + " because the coords were out of the map width/height : " + _layer_name + " and " + map.width + "," + map.height );
            }

        } else {
            trace("cannot refresh tile " + _x + "," + _y + " because layer was not found : " + _layer_name );
        }

    } //refresh_tile_id

        /** Destroy the geometry this visual contains and clean up */
    public function destroy( ) {

        if(geometry != null) {
            for(_name in geometry.keys()) {

                var layer = geometry.get(_name);

                for(row in layer) {
                    for(tile in row) {
                        if(tile != null) {
                            tile.drop();
                        }
                        tile = null;
                    } //tile
                    row = null;
                } //row

                geometry.remove(_name);

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
    @:isVar public var flipx(default, set):Bool;
    @:isVar public var flipy(default, set):Bool;
        //Has to be a multiple of 90
    @:isVar public var angle(default, set):Int;

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

        flipx = def(options.flipx, false);
        flipy = def(options.flipy, false);
        angle = def(options.angle, 0);

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
        return 'Tile: id:$id x,y:$x,$y layer(${layer.name}) coord($x,$y) pos(${pos.x},${pos.y}) size(${size.x},${size.y}) flipx,flipy:$flipx,$flipy angle:$angle';
    }

    function set_id( _id:Int ) {

            //update first, so
            //visual have the latest
            //values
        id = _id;

        if(map != null) {
            if(map.visual != null) {
                map.visual.refresh_tile_id( layer.name, x, y, _id, flipx, flipy, angle );
            }
        }

        return id;

    } //set_id

    function set_flipx(_val:Bool):Bool {
        flipx = _val;
        if(map != null && map.visual != null) {
            map.visual.refresh_tile_id( layer.name, x, y, id, flipx, flipy, angle);
        }
        return flipx;
    }

    function set_flipy(_val:Bool):Bool {
        flipy = _val;
        if(map != null && map.visual != null) {
            map.visual.refresh_tile_id( layer.name, x, y, id, flipx, flipy, angle);
        }
        return flipy;
    }

    function set_angle(_val:Int):Int {
        assert(_val % 90 == 0, 'Tile angle has to be a multiple of 90');
        angle = _val;
        if(map != null && map.visual != null) {
            map.visual.refresh_tile_id( layer.name, x, y, id, flipx, flipy, angle);
        }
        return angle;
    }
} //Tile


class TileLayer {

        /** the depth/ordering value */
    public var layer : Int;
        /** the unique id of the layer */
    public var id : String;
        /** the name of the layer */
    public var name : String;
        /** the layer opacity. default: 1 */
    public var opacity : Float = 1.0;
        /** the layer visibility. default: true */
    public var visible : Bool = true;
        /** The layer static state.
            When fixed, visuals can optimize the geometry */
    public var fixed : Bool = true;
        /** the map this tilemap belongs to */
    public var map : Tilemap;
        /** array of array of tiles */
    public var tiles : Array<TileArray>;
        /** layer properties */
    public var properties : Map<String,String>;

    public function new( options:TileLayerOptions ) {

        assertnull(options.map, 'TileLayer requires a Tilemap passed into the options, as map:Tilemap');

            //required options
        id = Luxe.utils.uniqueid();
        name = options.name;
        map = options.map;

        layer = def(options.layer, 0);
        opacity = def(options.opacity, 1.0);
        visible = def(options.visible, true);
        fixed = def(options.fixed, true);
        properties = def(options.properties, new Map());

        tiles = [];

    } //new


        /** Returns a list of rectangles in tile space, 
            where any tile with id > 0 is combined into bounding regions */
    public function bounds_fitted():Array<Rectangle> {

        var checked:Array<Null<Bool>> = [];
        var rectangles:Array<Rectangle> = [];
        var startCol = -1;
        var index = -1;
        var tileID = -1;
        var width = map.width;
        var height = map.height;

        for(y in 0...height) {
            for(x in 0...width) {

                index = y * width + x;
                tileID = tiles[y][x].id;

                if(tileID > 0 && (checked[index] == false || checked[index] == null)) {

                    if(startCol == -1) {
                        startCol = x;
                    }

                    checked[index] = true;

                } else if(tileID == 0 || checked[index] == true) {

                    if(startCol != -1) {
                        rectangles.push(find_bounds_rect(y, startCol, x, checked));
                        startCol = -1;
                    }

                }

            } //x in 0...width

            if(startCol != -1) {
                rectangles.push(find_bounds_rect(y, startCol, width, checked));
                startCol = -1;
            }

        } //each row

        return rectangles;

    } //bounds_fitted

        /** Finds the largest bounding rect around tiles with id > 0 between start_x and end_x, starting at start_y and going down as far as possible */
    function find_bounds_rect(start_y:Int, start_x:Int, end_x:Int, checked:Array<Null<Bool>>) {

        var index = -1;
        var tileID = -1;
        var width = map.width;
        var height = map.height;

        for(y in (start_y + 1)... height){
            for(x in start_x...end_x) {

                index = y * width + x;

                tileID = tiles[y][x].id;

                if(tileID == 0 || checked[index] == true){

                    //Set everything we've visited so far in this row to false again because it won't be included in the rectangle and should be checked again
                    for(_x in start_x...x) {
                        index = y * width + _x;
                        checked[index] = false;
                    }

                    return new Rectangle(start_x, start_y, end_x - start_x, y - start_y);

                }

                checked[index] = true;

            } //each x
        } //each y

        return new Rectangle(start_x, start_y, end_x - start_x, height - start_y);

    } //find_bounds_rect

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

        assertnull(options, 'Tileset requires a non-null options on new()');
        assertnull(options.texture, 'Tileset requires a texture that is not null');

        name = options.name;
        texture = options.texture;
        tile_width = options.tile_width;
        tile_height = options.tile_height;

        first_id    = def(options.first_id, 1);
        margin      = def(options.margin,   0);
        spacing     = def(options.spacing,  0);

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

        /** The layers the map consists of, stored by name */
    public var layers : Map<String,TileLayer>;
        /** The layers in an ordered array */
    public var layers_ordered : Array<TileLayer>;

        /** Tilesets associated with this map */
    public var tilesets : Map<String,Tileset>;
        /** key:value property list for this tilemap */
    public var properties : Map<String,String>;

        /** The orientation if any of this map */
    public var orientation : TilemapOrientation;
        /** The visual representation if any of this map */
    public var visual : TilemapVisual;

        /** The position of the tilemap in world space */
    public var pos : Vector;
        /** The width of a tile */
    public var tile_width : Int = 0;
        /** The height of a tile */
    public var tile_height : Int = 0;
        /** The width of the map in tiles */
    public var width : Int = 0;
        /** The height of the map in tiles */
    public var height : Int = 0;

        /** Get the total width of the tilemap in world units (tilewidth*width) */
    public var total_width (get,null) : Int = 0;
        /** Get the total height of the tilemap in world units (tilewidth*width) */
    public var total_height (get,null) : Int = 0;
        /** Get the containing bounding rectangle of the map in world units */
    public var bounds (get,null) : Rectangle;

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

        /** If the given tile space coordinate is inside the map or not */
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

        /** Get the world space position of a tile coordinate, from a given layer. */
    public function tile_pos( layer_name:String, x:Int, y:Int, ?scale:Float=1.0, ?offset_x:TileOffset, ?offset_y:TileOffset ) {

        if(inside(x,y)) {

            switch(orientation) {

                case TilemapOrientation.ortho: {
                    var _worldpos = Ortho.tile_coord_to_worldpos(x, y, tile_width, tile_height, scale, offset_x, offset_y );
                    return _worldpos.add( pos );
                }

                case TilemapOrientation.isometric: {
                    var _worldpos = Isometric.tile_coord_to_worldpos(x, y, tile_width, tile_height, scale, offset_x, offset_y );
                    return _worldpos.add( pos );
                }

                default: {

                }

            } //switch orientation

        } //inside

        return new Vector();

    } //tile_pos

        /** Returns the tile at a given world position, or null */
    public function tile_at_pos( layer_name:String, worldpos:Vector, ?_scale:Float = 1.0 ) {

        switch(orientation) {

            case TilemapOrientation.ortho: {

                var _tile_pos = Ortho.worldpos_to_tile_coord( worldpos.x - pos.x, worldpos.y - pos.y, tile_width, tile_height, _scale );
                return tile_at( layer_name, Math.floor(_tile_pos.x), Math.floor(_tile_pos.y) );

            } //ortho

            case TilemapOrientation.isometric: {

                var _tile_pos = Isometric.worldpos_to_tile_coord( worldpos.x - pos.x, worldpos.y - pos.y, tile_width, tile_height, _scale );
                return tile_at( layer_name, Math.floor(_tile_pos.x), Math.floor(_tile_pos.y) );

            } //isometric

            default: {

            }

        } //switch orientation

        return null;

    } //tile_at_pos

        /** Convert a world space position to map space coords */
    public function worldpos_to_map( worldpos:Vector, ?_scale:Float = 1.0 ) {

         switch(orientation) {

            case TilemapOrientation.ortho: {
                return Ortho.worldpos_to_tile_coord( worldpos.x - pos.x, worldpos.y - pos.y, tile_width, tile_height, _scale );
            }

            case TilemapOrientation.isometric: {
                return Isometric.worldpos_to_tile_coord( worldpos.x - pos.x, worldpos.y - pos.y, tile_width, tile_height, _scale );
            }

            default:{}

        } //switch orientation

        return null;

    } //worldpos_to_map

        /** Fetch a layer by name, or null if it's not found */
    public function layer( layer_name:String ) {
        return layers.get( layer_name );
    }

        /** Fetch a tileset by name, or null if its not found */
    public function tileset( tileset_name:String ) {
        return tilesets.get( tileset_name );
    }

        /** Return a tile from a layer, at the given tile coordinates */
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

        /** Allows iterating on the layers in order */
    public function iterator() : Iterator<TileLayer> {

        return layers_ordered.iterator();

    } //iterator

        /** Add a tileset with the given options */
    public function add_tileset( options:TilesetOptions ) {

        var tileset = new Tileset( options );

           tilesets.set( tileset.name, tileset );

        return tileset;

    } //add_tileset

        /** Return the tileset for a given tile id, or null */
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

        /**  Removes the tile at the given tile coordinates. Sets the tile id to 0 */
    public function remove_tile( layer_name:String, x:Int, y:Int ) : Bool {

        if(inside(x,y)) {

            var _layer = layer(layer_name);
            if(_layer != null) {
                _layer.tiles[y][x].id = 0;
            }

        }

        return false;

    } //remove_tile

        /** Remove a tileset by name */
    public function remove_tileset( name:String, _destroy_textures:Bool = false ) : Bool {

        var _tileset = tileset(name);

            if(_tileset != null && _destroy_textures) {
                _tileset.texture.destroy();
            }

        return tilesets.remove( name );

    } //remove_tileset

        /** Remove a layer by name */
    public function remove_layer( name:String ) : Bool {

        var _layer = layer(name);

            if(_layer != null) {
                layers_ordered.remove( _layer );
            }

        return layers.remove( name );

    } //remove_layer

        /** Add a layer with the given options */
    public function add_layer( options:TileLayerOptions ) {

        def(options.map, this);

        var new_layer = new TileLayer( options );

                //store in the named layer map
            layers.set( new_layer.name, new_layer );
                //store in the ordered list as well
            layers_ordered.push( new_layer );
                //and sort the list
            sort_layers();

        return new_layer;

    } //add_layer

        /** Fill an entire layer with the given tile id.
            The existing tiles are replaced. */
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

        /** Add tiles from an array of integer tile id's to the given layer.
            This will destroy previous tiles (use set to change them). */
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

        /** Destroys the tilemap and it's visual. */
    public function destroy(?_keep_visual:Bool=false) {

        layers = null;
        layers_ordered = null;
        tilesets = null;
        properties = null;
        orientation = null;
        pos = null;
        tile_width = 0;
        tile_height = 0;
        width = 0;
        height = 0;

        if(!_keep_visual && visual != null) {
            visual.destroy();
        }

    } //destroy

//Internal

    function _sort_layers( a:TileLayer,b:TileLayer ) {
        if(a.layer < b.layer) return -1;
        if(a.layer >= b.layer) return 1;
        return 1;
    } //_sort_layers

    function sort_layers() {

        layers_ordered.sort( _sort_layers );

    } //sort_layers

//Getters

    function get_bounds() : Rectangle {

        return new Rectangle( pos.x, pos.y, pos.x+total_width, pos.y + total_height );

    } //get_bounds

        /** Get the total height of the tilemap in tile width space */
    function get_total_width() : Int {

        return width * tile_width;

    } //get_total_width

        /** Get the total height of the tilemap in tile height space */
    
    function get_total_height() : Int {

        return height * tile_height;

    } //get_total_height

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

