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

    public static function worldpos_to_tile_coord( world_x:Float, world_y:Float, tile_width:Int, tile_height:Int, ?scale:Float=1.0, ?rounded:Bool=true ) : Vector {

        var tile_coord = new Vector();

            tile_coord.x = world_x / (tile_width * scale);
            tile_coord.y = world_y / (tile_height * scale);

            if(rounded) {
                tile_coord.x = Math.floor(tile_coord.x);
                tile_coord.y = Math.floor(tile_coord.y);
            }

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

            //dirty hack - I always pick the first tileset because there is no mapping between Layer and TileSet right now
            var key = "";
            for (k in map.tilesets.keys()) {
                key = k;
                break;
            }

            var _layer_geom : TilemapVisualLayerGeometry = new TilemapVisualLayerGeometry({
                    texture: map.tilesets.get(key).texture,
                    batcher: options.batcher
                });

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

    override function update_tile_id( _quadpack_id:Int, _layer_name:String, _x:Int, _y:Int, _id:Int, _flipx:Bool, _flipy:Bool, _angle:Int ) {

        var tileset = map.tileset_from_id( _id );
        var image_coord = tileset.pos_in_texture( _id );

        var geomlayer = geometry_for_layer(_layer_name);
        geomlayer.quad_uv(
             _quadpack_id,
            new Rectangle(
                tileset.margin + ((image_coord.x * tileset.tile_width) + (image_coord.x * tileset.spacing)),
                tileset.margin + ((image_coord.y * tileset.tile_height) + (image_coord.y * tileset.spacing)),
                tileset.tile_width,
                tileset.tile_height
            ) //Rectangle
        ); //uv

        geomlayer.quad_flipx(_quadpack_id, _flipx);
        geomlayer.quad_flipy(_quadpack_id, _flipy);
        //todo uv_angle _angle

    } //update_tile_id

    override function create_tile_for_layer( layer:TileLayer, x:Int, y:Int ) : Null<Int> {

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

        //init packed quad for tile
        var geomlayer = geometry_for_layer(layer.name);
        var _quadpack_id = geomlayer.quad_add({
                x: map.pos.x + (tile.x * _map_scaled_tw) - (_offset_x),
                y: map.pos.y + (tile.y * _map_scaled_th) - (_offset_y),
                w: _scaled_tilewidth,
                h: _scaled_tileheight,
                visible: layer.visible,
                color: new Color(1,1,1, layer.opacity)
            });


        if(tileset.texture != null) {

            var image_coord = tileset.pos_in_texture( tile.id );

            geomlayer.quad_uv(
                 _quadpack_id,
                new Rectangle(
                    tileset.margin + ((image_coord.x * tileset.tile_width) + (image_coord.x * tileset.spacing)),
                    tileset.margin + ((image_coord.y * tileset.tile_height) + (image_coord.y * tileset.spacing)),
                    tileset.tile_width,
                    tileset.tile_height
                ) //Rectangle
            ); //uv

            geomlayer.quad_flipx(_quadpack_id, tile.flipx);
            geomlayer.quad_flipy(_quadpack_id, tile.flipy);  
            //todo uv_angle tile.angle

        } //texture != null

        return _quadpack_id;

    } //create_tile_for_layer


} //OrhtoVisual
