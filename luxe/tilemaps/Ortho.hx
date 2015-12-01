package luxe.tilemaps;

import luxe.Color;
import luxe.Rectangle;
import phoenix.geometry.QuadGeometry;
import phoenix.Texture.FilterType;
import luxe.tilemaps.Tilemap;

import luxe.Vector;
import luxe.Log.*;

import phoenix.geometry.Geometry;

import luxe.options.TilemapOptions;

class Ortho {

    public static function worldpos_to_tile_coord( world_x:Float, world_y:Float, tile_width:Int, tile_height:Int, ?scale:Float=1.0 ) : Vector {

        var tile_coord = new Vector();

            tile_coord.x = Math.floor(world_x / (tile_width * scale));
            tile_coord.y = Math.floor(world_y / (tile_height * scale));

        return tile_coord;

    } //worldpos_to_tile_coord

    public static function tile_coord_to_worldpos(  tile_x:Int, tile_y:Int, tile_width:Int, tile_height:Int,
                                                    ?scale:Float=1.0, ?offset_x:TileOffset, ?offset_y:TileOffset ) : Vector {

        var world_pos = new Vector();

        var _scaled_tw = tile_width * scale;
        var _scaled_th = tile_height * scale;

            world_pos.x = tile_x * _scaled_tw;
            world_pos.y = tile_y * _scaled_th;

            //top left by default
        def(offset_x, TileOffset.left);
        def(offset_y, TileOffset.top);

            switch(offset_x) {
                case TileOffset.center:    { world_pos.x += (_scaled_tw/2); }
                case TileOffset.right:     { world_pos.x += _scaled_tw; }
                default:
            }

            switch(offset_y) {
                case TileOffset.center:    { world_pos.y += (_scaled_th/2); }
                case TileOffset.bottom:    { world_pos.y += _scaled_th; }
                default:
            }

        return world_pos;

    } //tile_coord_to_worldpos


} //Ortho

class OrthoVisual extends TilemapVisual {

    public override function create() {

        super.create();

        var _map_scaled_tw = map.tile_width*options.scale;
        var _map_scaled_th = map.tile_height*options.scale;

        for( layer in map ) {

            var _layer_geom : TilemapVisualLayerGeometry = [];

            for( y in 0 ... map.height ) {

                var _geom_row : Array<Geometry> = [];

                for( x in 0 ... map.width ) {

                        //we do want to push nulls into here,
                        //because otherwise the sizes won't match
                        //and because we use it to create tiles when
                        //changing the tile gid later
                    var _tile_geom = create_tile_for_layer( layer, x, y );

                    _geom_row.push( _tile_geom );

                } //for each tile

                _layer_geom.push(_geom_row);

            } //for each row

                //add the geometry to the list
            geometry.set( layer.name, _layer_geom );

        } //for each map


        if(options.grid) {

            //:todo : grid for tilemap is primitive, should be a facility
            var color = new Color(1,1,1,0.8).rgb(0xcc0000);

            for(x in 0 ... map.width+1) {
                Luxe.draw.line({
                    p0 : new Vector(map.pos.x + (x * _map_scaled_tw), map.pos.y + 0 ),
                    p1 : new Vector(map.pos.x + (x * _map_scaled_tw), map.pos.y + (map.height * _map_scaled_th)),
                    color : color,
                    depth : options.depth+0.0001,
                    batcher : options.batcher
                });
            }

            for(y in 0 ... map.height+1) {
                Luxe.draw.line({
                    p0 : new Vector(map.pos.x + (0), map.pos.y + (y * _map_scaled_th)),
                    p1 : new Vector(map.pos.x + (map.width * _map_scaled_tw), map.pos.y + (y * _map_scaled_th)),
                    color : color,
                    depth : options.depth+0.0001,
                    batcher : options.batcher
                });
            }

        }

    } //create

    override function update_tile_id( _geom:Geometry, _layer_name:String, _x:Int, _y:Int, _id:Int, _flipx:Bool, _flipy:Bool, _angle:Int ) {

        var tileset = map.tileset_from_id( _id );
        var image_coord = tileset.pos_in_texture( _id );

        var g : QuadGeometry = cast _geom;

        g.uv(
            new Rectangle(
                tileset.margin + ((image_coord.x * tileset.tile_width) + (image_coord.x * tileset.spacing)),
                tileset.margin + ((image_coord.y * tileset.tile_height) + (image_coord.y * tileset.spacing)),
                tileset.tile_width,
                tileset.tile_height
            ) //Rectangle
        ); //uv

        g.flipx = _flipx;
        g.flipy = _flipy;
        g.uv_angle = _angle;

    } //update_tile_id

    override function create_tile_for_layer( layer:TileLayer, x:Int, y:Int ) {

        var _map_scaled_tw = map.tile_width*options.scale;
        var _map_scaled_th = map.tile_height*options.scale;

        var tile = layer.tiles[y][x];

            //don't create blank tiles
        if(tile.id == 0) {
            return null;
        }

        var tileset = map.tileset_from_id( tile.id );

        assertnull(tileset, 'Tilemap Ortho cannot find tileset for tile id ${tile.id}');

        var _scaled_tilewidth = tileset.tile_width*options.scale;
        var _scaled_tileheight = tileset.tile_height*options.scale;

        var _offset_x = 0;
        var _offset_y = _scaled_tileheight - _map_scaled_th;

            //create the tile geometry
        var _tile_geom = Luxe.draw.box({
            x: map.pos.x + (tile.x * _map_scaled_tw) - (_offset_x),
            y: map.pos.y + (tile.y * _map_scaled_th) - (_offset_y),
            w: _scaled_tilewidth,
            h: _scaled_tileheight,
            visible : layer.visible,
            texture : (tileset != null) ? tileset.texture : null,
            color : new Color(1,1,1, layer.opacity),
            depth : options.depth,
            batcher : options.batcher
        });


        if(tileset.texture != null) {

            var image_coord = tileset.pos_in_texture( tile.id );

            _tile_geom.uv(
                new Rectangle(
                    tileset.margin + ((image_coord.x * tileset.tile_width) + (image_coord.x * tileset.spacing)),
                    tileset.margin + ((image_coord.y * tileset.tile_height) + (image_coord.y * tileset.spacing)),
                    tileset.tile_width,
                    tileset.tile_height
                ) //Rectangle
            ); //uv

            _tile_geom.uv_angle = tile.angle;
            _tile_geom.flipx = tile.flipx;
            _tile_geom.flipy = tile.flipy;

            tileset.texture.filter_min = tileset.texture.filter_mag = options.filter;

        } //texture != null

        return _tile_geom;

    } //create_tile_for_layer


} //OrhtoVisual
