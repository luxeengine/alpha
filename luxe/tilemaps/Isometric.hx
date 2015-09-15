package luxe.tilemaps;

import luxe.Color;
import luxe.Rectangle;
import luxe.Vector;

import luxe.tilemaps.Tilemap;
import luxe.tilemaps.Isometric;
import luxe.Log.*;

import phoenix.geometry.QuadGeometry;
import phoenix.Texture.FilterType;
import phoenix.geometry.Geometry;
import phoenix.Vector;

import luxe.options.TilemapOptions;

class Isometric {

    public static function worldpos_to_tile_coord( world_x:Float, world_y:Float, tile_width:Int, tile_height:Int, ?scale:Float=1.0 ) : Vector {

        var tile_pos = new Vector();

            var tile_width_half = tile_width / 2;
            var tile_height_half = tile_height / 2;

            tile_pos.x = ((world_x / tile_width_half) + (world_y / tile_height_half)) / 2;
            tile_pos.y = ((world_y / tile_height_half) - (world_x / tile_width_half)) / 2;

        return tile_pos;

    } //worldpos_to_tile_coord

    public static function tile_coord_to_worldpos(  tile_x:Int, tile_y:Int, tile_width:Int, tile_height:Int,
                                                   ?scale:Float=1.0, ?offset_x:TileOffset, ?offset_y:TileOffset ) : Vector {
        var world_pos = new Vector();

        var _scaled_tw = tile_width * scale;
        var _scaled_th = tile_height * scale;



        var tile_width_half = _scaled_tw / 2;
        var tile_height_half = _scaled_th / 2;

            //  Top left by default
        def(offset_x, TileOffset.left);
        def(offset_y, TileOffset.top);

        var tile_offset_x : Float = 0;
        var tile_offset_y : Float = 0;

            switch(offset_x) {
                case TileOffset.center:    { tile_offset_x += (_scaled_tw / 2); tile_offset_x /= tile_width; }
                case TileOffset.right:     { tile_offset_x += _scaled_tw; tile_offset_x /= tile_width; }
                default:
            }

            switch(offset_y) {
                case TileOffset.center:    { tile_offset_y += (_scaled_th/2); tile_offset_y /= tile_height; }
                case TileOffset.bottom:    { tile_offset_y += _scaled_th; tile_offset_y /= tile_height; }
                default:
            }

        tile_offset_x += tile_x;
        tile_offset_y += tile_y;

        world_pos.x = (tile_offset_x - tile_offset_y) * tile_width_half;
        world_pos.y = (tile_offset_x + tile_offset_y) * tile_height_half;

        return world_pos;

    } //tile_coord_to_worldpos


} //Ortho

class IsometricVisual extends TilemapVisual {

    public override function create() {

        for( layer in map ) {

            var _layer_geom : TilemapVisualLayerGeometry = [];

            for( y in 0 ... map.height ) {

                    //the geometry row
                var _geom_row : Array<Geometry> = [];

                for( x in 0 ... map.width ) {

                    var _tile_geom = create_tile_for_layer(layer, x, y);

                        //we want to push nulls into here,
                        //because otherwise the sizes won't match
                        //and because we use it to create tiles when
                        //changing the tile gid later
                    _geom_row.push( _tile_geom );

                } //for each tile in the x

                    //add the geometry to the bunches
                _layer_geom.push(_geom_row);

            } //for y

                //add the geometry to the list
            geometry.set( layer.name, _layer_geom );

        } //for each layer

        if(options.grid) {

            var color = new Color(1,1,1,0.8).rgb(0xcc0000);

            for(x in 0 ... map.width+1) {

                var ip = Isometric.tile_coord_to_worldpos(x, 0, map.tile_width, map.tile_height, options.scale);
                var ip_bot = Isometric.tile_coord_to_worldpos(x, map.height, map.tile_width, map.tile_height, options.scale);

                Luxe.draw.line({
                    p0 : new Vector(map.pos.x + ip.x, map.pos.y + ip.y ),
                    p1 : new Vector(map.pos.x + ip_bot.x, map.pos.y + ip_bot.y),
                    color : color,
                    depth : options.depth+0.001,
                    batcher : options.batcher
                });
            }

            for(y in 0 ... map.height+1) {

                var ip = Isometric.tile_coord_to_worldpos(0, y, map.tile_width, map.tile_height, options.scale);
                var ip_bot = Isometric.tile_coord_to_worldpos(map.width, y, map.tile_width, map.tile_height, options.scale);

                Luxe.draw.line({
                    p0 : new Vector(map.pos.x + ip.x, map.pos.y + ip.y),
                    p1 : new Vector(map.pos.x + ip_bot.x, map.pos.y + ip_bot.y),
                    color : color,
                    depth : options.depth+0.001,
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

    } //update_tile_id

    override function create_tile_for_layer( layer:TileLayer, x:Int, y:Int ) {

            //map tile size scaled up
        var _scaled_tilewidth = map.tile_width*options.scale;
        var _scaled_tileheight = map.tile_height*options.scale;

        var tile = layer.tiles[y][x];

            //don't create blank tiles
        if(tile.id == 0) {
            return null;
        }

        var tileset = map.tileset_from_id( tile.id );

        assertnull(tileset, 'Tilemap Iso cannot find tileset for tile id ${tile.id}');

            //specific to each tileset
        var _scaled_tileset_tilewidth = tileset.tile_width*options.scale;
        var _scaled_tileset_tileheight = tileset.tile_height*options.scale;

            //the half tile size in world space, not tile space
        var _half_world_tile_width = _scaled_tilewidth / 2;
        var _half_world_tile_height = _scaled_tileheight / 2;

            //create the tile to the geometry
        var _tile_geom = Luxe.draw.box({
                //the positions are based on the map tile width, not the texture tilesize
            x : (map.pos.x + ((x - y) * _half_world_tile_width)) - _half_world_tile_width,
            y : (map.pos.y + ((x + y) * _half_world_tile_height)) - _half_world_tile_height,
                //the geometry size is based on the texture/tileset size, not the map size
            w : _scaled_tileset_tilewidth,
            h : _scaled_tileset_tileheight,
            texture : (tileset != null) ? tileset.texture : null,
            visible : layer.visible,
            color : new Color(1,1,1,layer.opacity),
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

            tileset.texture.filter_min = tileset.texture.filter_mag = options.filter;

        } //texture != null

        return _tile_geom;

    } //create_tile_for_layer


} //IsometricVisual
